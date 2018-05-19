// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_16_s1.s
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
   random seed:	808905694
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

	setx 0x9275a539081cac9f, %g1, %g0
	setx 0xfae6bc3b70f733f6, %g1, %g1
	setx 0xf8859112a74d7cb7, %g1, %g2
	setx 0x89c5f261d8681c03, %g1, %g3
	setx 0xffcb9b2e40b5c2c7, %g1, %g4
	setx 0xb47efe61cae479b5, %g1, %g5
	setx 0x5025b6ea70493bbf, %g1, %g6
	setx 0xce373decd5a9f6fd, %g1, %g7
	setx 0x889225d3aec313e1, %g1, %r16
	setx 0x42a36c5ab9995cdd, %g1, %r17
	setx 0x6019e29d13e621bc, %g1, %r18
	setx 0x59368bb18ab44bbc, %g1, %r19
	setx 0x7990c86feab79f0a, %g1, %r20
	setx 0xbc0037d70fe2c496, %g1, %r21
	setx 0x6df10b3bd27efd98, %g1, %r22
	setx 0x38feb8a2e54f2926, %g1, %r23
	setx 0xbb69b64ca7aae47f, %g1, %r24
	setx 0xd1a39182ce042f1c, %g1, %r25
	setx 0xea56886ce0ab8210, %g1, %r26
	setx 0x7e0c26d350cf9bdd, %g1, %r27
	setx 0xd6c69b1a9e5cc633, %g1, %r28
	setx 0x01348f150785efec, %g1, %r29
	setx 0xffd3c27c0cba8468, %g1, %r30
	setx 0xae3d4b6d4aeac2a4, %g1, %r31
	save
	setx 0xf171dcbe75794713, %g1, %r16
	setx 0xfcefbad5389e3481, %g1, %r17
	setx 0xcc4b0c17ad0761bb, %g1, %r18
	setx 0x6421aa5edb747104, %g1, %r19
	setx 0xe6cedb294ec48235, %g1, %r20
	setx 0xee3df12bfde0ce2a, %g1, %r21
	setx 0xdf7961905013b863, %g1, %r22
	setx 0x624fdf32bf9e742c, %g1, %r23
	setx 0x67a3bf5bbfbff320, %g1, %r24
	setx 0x5e261fe72c9ca11f, %g1, %r25
	setx 0xa9b765936eb16054, %g1, %r26
	setx 0x7b6ab27762912c33, %g1, %r27
	setx 0x34d2a22847f7a31e, %g1, %r28
	setx 0x87e1a5d4d7cd3e85, %g1, %r29
	setx 0x1611c00ee9886c63, %g1, %r30
	setx 0xc33628a0932a89f0, %g1, %r31
	save
	setx 0x3b803f155677b068, %g1, %r16
	setx 0xc0594e25ede49196, %g1, %r17
	setx 0x31571ba5df3421cb, %g1, %r18
	setx 0xc53f4f7a835a5c33, %g1, %r19
	setx 0x9c20160177dbda3e, %g1, %r20
	setx 0xaa0c1fdead27edef, %g1, %r21
	setx 0x9442a84c842e4f95, %g1, %r22
	setx 0xd187b27598d7cdbf, %g1, %r23
	setx 0xa4d3d08419f1bd24, %g1, %r24
	setx 0x888b9bd7cb3db3d2, %g1, %r25
	setx 0x902b8871b3d9354d, %g1, %r26
	setx 0x7cce637e0fe0d0d2, %g1, %r27
	setx 0xd6ee24b3e62de3e7, %g1, %r28
	setx 0x474d24c4bfb34723, %g1, %r29
	setx 0x58d8fbdb20a1c045, %g1, %r30
	setx 0x7e1ecab2f6510deb, %g1, %r31
	save
	setx 0x8da1eedcd29e9ae7, %g1, %r16
	setx 0x452d8d78372ef9a8, %g1, %r17
	setx 0xc3173060462d82f4, %g1, %r18
	setx 0xae0ddcf65b48808b, %g1, %r19
	setx 0x45f33c45a9c60917, %g1, %r20
	setx 0x8565e6c41b1da1b2, %g1, %r21
	setx 0x36d20ac966527724, %g1, %r22
	setx 0x4baca986ec571502, %g1, %r23
	setx 0x4f5553565ace32d0, %g1, %r24
	setx 0xab16f1f2118de8f8, %g1, %r25
	setx 0xad29c6e876cf007d, %g1, %r26
	setx 0x908580b49cd8c825, %g1, %r27
	setx 0x1e0943eac4273735, %g1, %r28
	setx 0xb292bd67f18125a1, %g1, %r29
	setx 0x7411672bd874b032, %g1, %r30
	setx 0x631eab6f61cb815e, %g1, %r31
	save
	setx 0x4fec8a2a34987061, %g1, %r16
	setx 0x39c52c4c451a6f07, %g1, %r17
	setx 0x17a07851b2b9e57d, %g1, %r18
	setx 0xe0c13aa16783645e, %g1, %r19
	setx 0x9ebc9459cc6b78be, %g1, %r20
	setx 0x4548694bb4489840, %g1, %r21
	setx 0x280b57bdfcf437b2, %g1, %r22
	setx 0x0d6f85db3913100d, %g1, %r23
	setx 0xeb707c9ca00c441b, %g1, %r24
	setx 0x355acbdd477e218a, %g1, %r25
	setx 0xb4b0eba1615a4c1c, %g1, %r26
	setx 0x72f51e354c246542, %g1, %r27
	setx 0xf8d0f8c391515f07, %g1, %r28
	setx 0x94ccbd6747d81743, %g1, %r29
	setx 0x35fe4746b51b0df2, %g1, %r30
	setx 0x018d539e3f765b25, %g1, %r31
	save
	setx 0xea4b5f139e75afd8, %g1, %r16
	setx 0x9e99eea1f046f6eb, %g1, %r17
	setx 0xee0acdbc624813f5, %g1, %r18
	setx 0x9fe590669ac107e0, %g1, %r19
	setx 0xd391f73e54ad82c1, %g1, %r20
	setx 0xf6e50bd367d0c7ba, %g1, %r21
	setx 0xfd4193cfa4f48379, %g1, %r22
	setx 0x8926c0a40ea1bca3, %g1, %r23
	setx 0xb20c19754b165901, %g1, %r24
	setx 0x339dcd55889344e3, %g1, %r25
	setx 0x071f29b94181aa2a, %g1, %r26
	setx 0x9b429feb5d97c80f, %g1, %r27
	setx 0x3ccc66cf974d5a62, %g1, %r28
	setx 0x70f0ee92af523687, %g1, %r29
	setx 0x787eb5e7d2955d80, %g1, %r30
	setx 0xa5af3a5874bb6250, %g1, %r31
	save
	setx 0x8cd047bf0ed81278, %g1, %r16
	setx 0x8c85045989a43657, %g1, %r17
	setx 0x237d4a8499855fd2, %g1, %r18
	setx 0x3e5381e863ad1874, %g1, %r19
	setx 0xc15a0f4e42118281, %g1, %r20
	setx 0x5a1348c351ab8a6b, %g1, %r21
	setx 0x66ddb94013a0c788, %g1, %r22
	setx 0x2bdd09a992ba6a0b, %g1, %r23
	setx 0xf9137aa44d88366e, %g1, %r24
	setx 0x2c204e7e8ae83ca5, %g1, %r25
	setx 0xe5f71af09f4e8278, %g1, %r26
	setx 0x1fc4e6f5f2bda160, %g1, %r27
	setx 0xf3584266bf29237b, %g1, %r28
	setx 0x56d4a4f23ae82dca, %g1, %r29
	setx 0xe47c669595ccc890, %g1, %r30
	setx 0x5bdfa261f18c9384, %g1, %r31
	save
	setx 0x64e3723174c15d91, %g1, %r16
	setx 0x531894545e1af3f8, %g1, %r17
	setx 0xb360107f72016974, %g1, %r18
	setx 0xbda0e99703d8b035, %g1, %r19
	setx 0xd3a9be784ce72624, %g1, %r20
	setx 0x185bcf4efb7426b1, %g1, %r21
	setx 0xf9b66b28ae49abd4, %g1, %r22
	setx 0x6af1cf8433f2a3a1, %g1, %r23
	setx 0x310a9176f9e724a5, %g1, %r24
	setx 0xbb8723b7cfb94b96, %g1, %r25
	setx 0xd195de74ccb7a48c, %g1, %r26
	setx 0x521d742cd91f1939, %g1, %r27
	setx 0xdd4955024fb1aafa, %g1, %r28
	setx 0xd06d0a73fb387bf5, %g1, %r29
	setx 0x027c8f8e8e77f98e, %g1, %r30
	setx 0x86af98f407be4cf5, %g1, %r31
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
	.word 0xb1e54000  ! 4: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 12)
	.word 0xb3e421ee  ! 7: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_0:
	setx	0x190120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd34f001  ! 9: SRLX_I	srlx	%r19, 0x0001, %r30
	.word 0xb5e48000  ! 12: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_0:
	mov	0x20, %r14
	.word 0xf6f38e80  ! 13: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_0:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_1:
	mov	0x26, %r14
	.word 0xfef38e60  ! 18: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e4e1c3  ! 24: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde48000  ! 25: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_2:
	mov	0x37, %r14
	.word 0xf0f38400  ! 27: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_1:
	setx	0x1f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 30: SAVE_R	save	%r19, %r0, %r27
	.word 0xbbe40000  ! 32: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_3:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 36: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_2:
	setx	0x1e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 44: SAVE_R	save	%r17, %r0, %r26
	.word 0xbbe48000  ! 45: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e461ac  ! 46: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_4:
	mov	0x14, %r14
	.word 0xfaf38400  ! 47: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e52116  ! 53: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb20da16f  ! 54: AND_I	and 	%r22, 0x016f, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_3:
	setx	0x1d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1ea  ! 58: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_4:
	setx	0x1e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_5:
	mov	0x11, %r14
	.word 0xf8f389e0  ! 69: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbbe4e14f  ! 70: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e54000  ! 72: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe5c000  ! 74: SAVE_R	save	%r23, %r0, %r31
	.word 0xb5e5c000  ! 76: SAVE_R	save	%r23, %r0, %r26
	.word 0xb69d0000  ! 82: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xb1e4a040  ! 83: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e48000  ! 85: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e420d0  ! 87: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_2:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 91: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e44000  ! 92: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_4:
	mov	0x1e, %r14
	.word 0xf0db8e80  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_6:
	setx	0x1e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0aca1a2  ! 105: ANDNcc_I	andncc 	%r18, 0x01a2, %r24
T0_asi_reg_wr_6:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 106: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_7:
	setx	0x1e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe5a04d  ! 109: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_7:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 119: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb17cc400  ! 120: MOVR_R	movre	%r19, %r0, %r24
	.word 0xbde5c000  ! 121: SAVE_R	save	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_5:
	mov	0x1a, %r14
	.word 0xfedb8400  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbde4613f  ! 127: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb735b001  ! 128: SRLX_I	srlx	%r22, 0x0001, %r27
	.word 0xb1e520f0  ! 129: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_8:
	setx	0x1f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe4a18e  ! 136: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_8:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 137: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_6:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde5e1f6  ! 145: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb2352154  ! 147: SUBC_I	orn 	%r20, 0x0154, %r25
cpu_intr_0_9:
	setx	0x1d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a0fa  ! 151: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6948000  ! 158: ORcc_R	orcc 	%r18, %r0, %r27
	.word 0xb3e46034  ! 162: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe58000  ! 164: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_10:
	setx	0x1d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_11:
	setx	0x1f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_12:
	setx	0x1c000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_13:
	setx	0x1c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e46170  ! 176: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e5c000  ! 178: SAVE_R	save	%r23, %r0, %r26
	.word 0xb1e58000  ! 179: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_9:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 181: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3e4a0cd  ! 184: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e52078  ! 188: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe5a1fc  ! 190: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_14:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 198: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_7:
	mov	0x38, %r14
	.word 0xfcdb84a0  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_15:
	setx	0x1f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 204: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_16:
	setx	0x1d010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 207: SAVE_R	save	%r21, %r0, %r27
	.word 0xb8952075  ! 208: ORcc_I	orcc 	%r20, 0x0075, %r28
T0_asi_reg_wr_10:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 209: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_17:
	setx	0x1f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 216: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e40000  ! 217: SAVE_R	save	%r16, %r0, %r24
	.word 0xbfe50000  ! 218: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe56169  ! 220: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_18:
	setx	0x1f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_19:
	setx	0x1c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_11:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 225: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbde48000  ! 226: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_12:
	mov	0x2c, %r14
	.word 0xfcf38400  ! 227: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbde4c000  ! 228: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_20:
	setx	0x1d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 232: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_21:
	setx	0x1e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_22:
	setx	0x1d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 236: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbe350000  ! 237: ORN_R	orn 	%r20, %r0, %r31
	.word 0xb5e4a177  ! 242: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_23:
	setx	0x1c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c58000  ! 245: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xbde58000  ! 247: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_24:
	setx	0x1d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_13:
	mov	0x23, %r14
	.word 0xfef384a0  ! 250: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbbe40000  ! 255: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_25:
	setx	0x1c030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_14:
	mov	0x0, %r14
	.word 0xf6f38e60  ! 259: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_8:
	mov	0x0, %r14
	.word 0xfadb8e40  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 18)
	.word 0xb33d2001  ! 262: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb3e48000  ! 265: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_15:
	mov	0x38, %r14
	.word 0xfaf384a0  ! 266: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_9:
	mov	0x17, %r14
	.word 0xf6db8400  ! 274: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7e4a1b2  ! 277: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_10:
	mov	0x31, %r14
	.word 0xf8db89e0  ! 278: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbfe40000  ! 280: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_16:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 283: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_26:
	setx	0x1e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_27:
	setx	0x1e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 31)
	.word 0xb8956015  ! 291: ORcc_I	orcc 	%r21, 0x0015, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_28:
	setx	0x1e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_17:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 299: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_29:
	setx	0x1f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8158000  ! 307: OR_R	or 	%r22, %r0, %r28
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e4e1e6  ! 309: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_11:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 313: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbaadc000  ! 314: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xb4ad0000  ! 315: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xb135e001  ! 316: SRL_I	srl 	%r23, 0x0001, %r24
cpu_intr_0_30:
	setx	0x1e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a061  ! 320: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xba844000  ! 323: ADDcc_R	addcc 	%r17, %r0, %r29
	.word 0xb1e5a00d  ! 325: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4c000  ! 328: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_31:
	setx	0x1d001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_32:
	setx	0x1c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 343: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e44000  ! 344: SAVE_R	save	%r17, %r0, %r25
	.word 0xb3e44000  ! 348: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_12:
	mov	0x2c, %r14
	.word 0xfcdb84a0  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_33:
	setx	0x1f020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_34:
	setx	0x1e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e460ca  ! 360: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e54000  ! 361: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_13:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 363: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde54000  ! 364: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_35:
	setx	0x1d0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_36:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde58000  ! 372: SAVE_R	save	%r22, %r0, %r30
	.word 0xb9e5211d  ! 373: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_14:
	mov	0x21, %r14
	.word 0xf6db8e60  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe5e00d  ! 379: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd2df001  ! 381: SLLX_I	sllx	%r23, 0x0001, %r30
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e5a0c5  ! 383: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb4048000  ! 386: ADD_R	add 	%r18, %r0, %r26
cpu_intr_0_37:
	setx	0x1f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x1f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e460e1  ! 392: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 13)
	.word 0xb33c3001  ! 397: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xbde460e9  ! 398: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_39:
	setx	0x1c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 403: SAVE_R	save	%r19, %r0, %r30
	.word 0xb5e460a3  ! 404: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 33)
	.word 0xb82c4000  ! 408: ANDN_R	andn 	%r17, %r0, %r28
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e5c000  ! 417: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_40:
	setx	0x1c0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_18:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 422: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1e56144  ! 426: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_19:
	mov	0x2, %r14
	.word 0xf4f384a0  ! 428: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_15:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb2c42032  ! 431: ADDCcc_I	addccc 	%r16, 0x0032, %r25
	.word 0xb9518000  ! 433: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe561b3  ! 435: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e56113  ! 436: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_41:
	setx	0x1c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e521e2  ! 441: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e50000  ! 442: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_16:
	mov	0x2e, %r14
	.word 0xfcdb8e60  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_20:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 444: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 446: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e58000  ! 452: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_42:
	setx	0x1e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb015a07e  ! 458: OR_I	or 	%r22, 0x007e, %r24
cpu_intr_0_43:
	setx	0x1d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8354000  ! 461: ORN_R	orn 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_44:
	setx	0x1f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e5608c  ! 468: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 20)
	.word 0xbf508000  ! 472: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e4e184  ! 473: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde4604c  ! 476: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_21:
	mov	0x12, %r14
	.word 0xfef38e40  ! 482: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe40000  ! 483: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_22:
	mov	0x13, %r14
	.word 0xfef38e40  ! 484: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde50000  ! 487: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e5207f  ! 489: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e521e5  ! 492: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e5c000  ! 494: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 0)
	.word 0xb5e44000  ! 497: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_45:
	setx	0x21013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_46:
	setx	0x23012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_17:
	mov	0x27, %r14
	.word 0xfcdb8400  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb3e420d6  ! 506: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe48000  ! 511: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_47:
	setx	0x200125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0af  ! 517: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_18:
	mov	0x31, %r14
	.word 0xf8db84a0  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_48:
	setx	0x230039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5600b  ! 522: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde561f2  ! 528: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_49:
	setx	0x20033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1c9  ! 533: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_50:
	setx	0x22003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1a1  ! 538: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_23:
	mov	0x24, %r14
	.word 0xf6f38e80  ! 552: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_24:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 553: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_19:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e40000  ! 569: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, d)
	.word 0xba8d4000  ! 573: ANDcc_R	andcc 	%r21, %r0, %r29
	.word 0xb234c000  ! 574: ORN_R	orn 	%r19, %r0, %r25
T0_asi_reg_rd_20:
	mov	0x37, %r14
	.word 0xf8db8e80  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3e48000  ! 577: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_25:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 584: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_21:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_26:
	mov	0x31, %r14
	.word 0xfcf38e60  ! 591: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 593: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_28:
	mov	0x0, %r14
	.word 0xfaf389e0  ! 596: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb9e5c000  ! 598: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_51:
	setx	0x230238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 606: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde44000  ! 612: SAVE_R	save	%r17, %r0, %r30
	.word 0xb22c2065  ! 613: ANDN_I	andn 	%r16, 0x0065, %r25
cpu_intr_0_53:
	setx	0x20011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52056  ! 615: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde54000  ! 623: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e4c000  ! 628: SAVE_R	save	%r19, %r0, %r27
	.word 0xb5e4e102  ! 629: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_22:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 631: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbde5e125  ! 632: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe48000  ! 634: SAVE_R	save	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5e0c7  ! 640: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_29:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 645: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb63c4000  ! 646: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xb5e44000  ! 647: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e58000  ! 648: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe48000  ! 649: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_23:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbbe5618c  ! 653: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_24:
	mov	0x1b, %r14
	.word 0xfcdb89e0  ! 657: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_30:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 659: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_25:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe4607b  ! 662: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_54:
	setx	0x200311, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_26:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_55:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_56:
	setx	0x200003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_57:
	setx	0x20032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 669: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_27:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e420c9  ! 674: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbcc42128  ! 679: ADDCcc_I	addccc 	%r16, 0x0128, %r30
T0_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 680: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbf520000  ! 681: RDPR_PIL	<illegal instruction>
T0_asi_reg_wr_32:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 683: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_33:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 685: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 26)
	.word 0xb7e560a4  ! 691: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_58:
	setx	0x200211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 693: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe54000  ! 697: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e4c000  ! 700: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_59:
	setx	0x23012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e17b  ! 704: WRPR_PIL_I	wrpr	%r19, 0x017b, %pil
T0_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 705: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_60:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_61:
	setx	0x23003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_35:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 715: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_62:
	setx	0x200031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_28:
	mov	0x5, %r14
	.word 0xfedb8e60  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_rd_29:
	mov	0x23, %r14
	.word 0xfcdb8e60  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1e54000  ! 728: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e4c000  ! 735: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e58000  ! 736: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_63:
	setx	0x220125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52c0000  ! 740: SLL_R	sll 	%r16, %r0, %r26
	.word 0xb9508000  ! 741: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4a088  ! 742: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e54000  ! 749: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_64:
	setx	0x230222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e1cf  ! 753: WRPR_TT_I	wrpr	%r19, 0x01cf, %tt
	.word 0xbc140000  ! 756: OR_R	or 	%r16, %r0, %r30
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 31)
	.word 0xbcb58000  ! 761: SUBCcc_R	orncc 	%r22, %r0, %r30
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 2)
	.word 0xb1e5a1be  ! 770: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe5c000  ! 779: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e58000  ! 780: SAVE_R	save	%r22, %r0, %r28
	.word 0xb7e420c5  ! 781: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_30:
	mov	0x1, %r14
	.word 0xfcdb84a0  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb204a015  ! 785: ADD_I	add 	%r18, 0x0015, %r25
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_65:
	setx	0x20020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 789: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_36:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 790: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 20)
	.word 0x9195212e  ! 794: WRPR_PIL_I	wrpr	%r20, 0x012e, %pil
	.word 0xbfe4c000  ! 795: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_66:
	setx	0x21033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 800: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_67:
	setx	0x21033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 805: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xba45e037  ! 808: ADDC_I	addc 	%r23, 0x0037, %r29
	.word 0xb1e421b8  ! 810: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_31:
	mov	0x14, %r14
	.word 0xfcdb89e0  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_32:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1e5c000  ! 816: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_68:
	setx	0x200131, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_69:
	setx	0x200108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb5e40000  ! 841: SAVE_R	save	%r16, %r0, %r26
	.word 0xbde4c000  ! 842: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e50000  ! 846: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_70:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_71:
	setx	0x21013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e191  ! 854: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe40000  ! 856: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_38:
	mov	0x16, %r14
	.word 0xfef38e80  ! 857: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_72:
	setx	0x210101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5e0cb  ! 859: ADDCcc_I	addccc 	%r23, 0x00cb, %r28
	.word 0xbbe44000  ! 860: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e46113  ! 864: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe421bb  ! 866: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_33:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_73:
	setx	0x230005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_39:
	mov	0x1e, %r14
	.word 0xfcf384a0  ! 878: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb5e561a3  ! 879: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb97c2401  ! 881: MOVR_I	movre	%r16, 0x1, %r28
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_34:
	mov	0x2a, %r14
	.word 0xf8db8400  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_35:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 890: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbfe44000  ! 892: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_74:
	setx	0x21022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 894: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_40:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 897: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_41:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 901: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_75:
	setx	0x230212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1a9  ! 914: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e4615a  ! 915: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_36:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 921: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7e4a04c  ! 923: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf2cf001  ! 924: SLLX_I	sllx	%r19, 0x0001, %r31
	.word 0xbde4e126  ! 925: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbead8000  ! 926: ANDNcc_R	andncc 	%r22, %r0, %r31
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e5a057  ! 928: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e50000  ! 929: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_42:
	mov	0x2b, %r14
	.word 0xfef38400  ! 931: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbde58000  ! 932: SAVE_R	save	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 13)
	.word 0xbfe521bb  ! 938: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e5c000  ! 939: SAVE_R	save	%r23, %r0, %r24
	.word 0xb5e44000  ! 945: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe46198  ! 948: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_76:
	setx	0x260101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46088  ! 956: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_77:
	setx	0x240023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_78:
	setx	0x250221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9dc000  ! 965: XORcc_R	xorcc 	%r23, %r0, %r29
cpu_intr_0_79:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 967: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfe4e093  ! 969: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_80:
	setx	0x270212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_38:
	mov	0x29, %r14
	.word 0xf8db8400  ! 973: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_81:
	setx	0x250129, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_43:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 981: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_44:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 982: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_45:
	mov	0x30, %r14
	.word 0xfaf38400  ! 984: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbe40000  ! 986: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe44000  ! 987: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde56026  ! 989: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_39:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_82:
	setx	0x240233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 993: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_40:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb73d0000  ! 1002: SRA_R	sra 	%r20, %r0, %r27
	.word 0xbfe4a137  ! 1003: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_41:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_83:
	setx	0x24031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_84:
	setx	0x270202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_42:
	mov	0x9, %r14
	.word 0xfedb8400  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1e58000  ! 1017: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_46:
	mov	0x25, %r14
	.word 0xf2f38e80  ! 1021: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9e420c5  ! 1027: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e5c000  ! 1029: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_85:
	setx	0x250331, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 1036: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbde52043  ! 1038: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb73c9000  ! 1039: SRAX_R	srax	%r18, %r0, %r27
cpu_intr_0_86:
	setx	0x270211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x260006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_88:
	setx	0x25000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534f001  ! 1051: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xbde520e5  ! 1054: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e58000  ! 1058: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_89:
	setx	0x240206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46151  ! 1065: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_48:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 1068: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_90:
	setx	0x25023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_49:
	mov	0x27, %r14
	.word 0xf6f38e60  ! 1076: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9e461c5  ! 1079: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_91:
	setx	0x270218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6054000  ! 1087: ADD_R	add 	%r21, %r0, %r27
	.word 0xb134e001  ! 1088: SRL_I	srl 	%r19, 0x0001, %r24
T0_asi_reg_wr_50:
	mov	0x2b, %r14
	.word 0xf8f38e60  ! 1089: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe44000  ! 1092: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_51:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 1096: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9e46044  ! 1097: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_92:
	setx	0x25002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_52:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 1099: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_93:
	setx	0x25031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_53:
	mov	0x2c, %r14
	.word 0xf0f384a0  ! 1101: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T0_asi_reg_rd_43:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_94:
	setx	0x240130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_95:
	setx	0x250232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e4c000  ! 1112: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_44:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9e520be  ! 1114: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe40000  ! 1117: SAVE_R	save	%r16, %r0, %r29
	.word 0x8594a0bc  ! 1119: WRPR_TSTATE_I	wrpr	%r18, 0x00bc, %tstate
T0_asi_reg_rd_45:
	mov	0x14, %r14
	.word 0xf0db8400  ! 1123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe420ae  ! 1134: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_96:
	setx	0x260136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e40000  ! 1138: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_54:
	mov	0xd, %r14
	.word 0xf6f38400  ! 1140: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe4c000  ! 1145: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_55:
	mov	0x30, %r14
	.word 0xf0f38e80  ! 1146: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb0958000  ! 1150: ORcc_R	orcc 	%r22, %r0, %r24
cpu_intr_0_97:
	setx	0x27010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_46:
	mov	0x35, %r14
	.word 0xfedb84a0  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_98:
	setx	0x26030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60460ce  ! 1159: ADD_I	add 	%r17, 0x00ce, %r27
T0_asi_reg_wr_56:
	mov	0x28, %r14
	.word 0xf8f38e40  ! 1163: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 1165: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_99:
	setx	0x250025, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_57:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 1169: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_58:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 1173: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e48000  ! 1174: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 4)
	.word 0xb7e5210d  ! 1177: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_wr_59:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 1178: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_100:
	setx	0x250102, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_47:
	mov	0x34, %r14
	.word 0xf8db84a0  ! 1187: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 10)
	.word 0xbd2c8000  ! 1189: SLL_R	sll 	%r18, %r0, %r30
	.word 0xb7e44000  ! 1190: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_101:
	setx	0x27032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe420a0  ! 1193: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_60:
	mov	0x33, %r14
	.word 0xf2f384a0  ! 1196: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_rd_48:
	mov	0x28, %r14
	.word 0xfadb8400  ! 1197: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9e40000  ! 1200: SAVE_R	save	%r16, %r0, %r28
	.word 0xb7e5e0b7  ! 1201: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5c000  ! 1202: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e5200e  ! 1203: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e40000  ! 1204: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_49:
	mov	0x2b, %r14
	.word 0xfedb8e40  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_102:
	setx	0x240007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60ca169  ! 1209: AND_I	and 	%r18, 0x0169, %r27
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e5a048  ! 1213: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e4e09b  ! 1223: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e44000  ! 1224: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e4c000  ! 1227: SAVE_R	save	%r19, %r0, %r25
	.word 0xb7e4c000  ! 1230: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_50:
	mov	0x2f, %r14
	.word 0xf4db8e60  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_103:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x1a, %r14
	.word 0xf6f389e0  ! 1238: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e4c000  ! 1241: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e5e131  ! 1244: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5a111  ! 1246: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_62:
	mov	0xc, %r14
	.word 0xfcf38400  ! 1247: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_104:
	setx	0x24011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_51:
	mov	0x7, %r14
	.word 0xf2db8e40  ! 1252: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 31)
	.word 0xbb540000  ! 1257: RDPR_GL	<illegal instruction>
T0_asi_reg_rd_52:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_105:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e54000  ! 1265: SAVE_R	save	%r21, %r0, %r28
	.word 0xb1e4a0a1  ! 1267: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e40000  ! 1269: SAVE_R	save	%r16, %r0, %r26
	.word 0xb77c6401  ! 1271: MOVR_I	movre	%r17, 0x1, %r27
	.word 0xb9e58000  ! 1273: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_53:
	mov	0x16, %r14
	.word 0xfedb8400  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_rd_54:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_55:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 1289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_106:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995a0f0  ! 1292: WRPR_TICK_I	wrpr	%r22, 0x00f0, %tick
T0_asi_reg_wr_63:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 1293: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_rd_56:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_64:
	mov	0xd, %r14
	.word 0xfcf38e80  ! 1304: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfe54000  ! 1305: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_107:
	setx	0x250239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x270323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a05f  ! 1317: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbec561ce  ! 1318: ADDCcc_I	addccc 	%r21, 0x01ce, %r31
T0_asi_reg_rd_57:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 1319: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb20d8000  ! 1320: AND_R	and 	%r22, %r0, %r25
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_109:
	setx	0x24000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 1342: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e4e092  ! 1345: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_65:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 1347: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_110:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 1353: SAVE_R	save	%r18, %r0, %r30
	.word 0xb2048000  ! 1357: ADD_R	add 	%r18, %r0, %r25
	.word 0xb9e52000  ! 1360: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4a025  ! 1361: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_58:
	mov	0xc, %r14
	.word 0xfcdb8400  ! 1365: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_111:
	setx	0x24021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1379: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_112:
	setx	0x270122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e4e111  ! 1384: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e54000  ! 1385: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_66:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 1387: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_67:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 1388: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_113:
	setx	0x2b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a01f  ! 1393: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_114:
	setx	0x2a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0248000  ! 1400: SUB_R	sub 	%r18, %r0, %r24
	.word 0xb9e50000  ! 1406: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe40000  ! 1407: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_68:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1417: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_115:
	setx	0x2b020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe421fe  ! 1424: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_116:
	setx	0x2b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe560a1  ! 1426: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5c000  ! 1428: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_59:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_rd_60:
	mov	0x3, %r14
	.word 0xfcdb84a0  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_69:
	mov	0x34, %r14
	.word 0xf6f384a0  ! 1434: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb42c4000  ! 1435: ANDN_R	andn 	%r17, %r0, %r26
	.word 0xbfe461f6  ! 1436: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb13d4000  ! 1437: SRA_R	sra 	%r21, %r0, %r24
	.word 0xbfe4e1fb  ! 1438: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e44000  ! 1440: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e4c000  ! 1442: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 28)
	.word 0xb3e54000  ! 1445: SAVE_R	save	%r21, %r0, %r25
	.word 0xba358000  ! 1448: ORN_R	orn 	%r22, %r0, %r29
	.word 0xbfe42188  ! 1449: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe4e1ea  ! 1452: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_117:
	setx	0x2b0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1456: SAVE_R	save	%r18, %r0, %r31
	.word 0xb024c000  ! 1458: SUB_R	sub 	%r19, %r0, %r24
	.word 0xb7e46044  ! 1462: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe520a8  ! 1467: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_61:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 1468: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, f)
	.word 0xb28c617a  ! 1472: ANDcc_I	andcc 	%r17, 0x017a, %r25
	.word 0xb9e4e1d6  ! 1474: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde4c000  ! 1477: SAVE_R	save	%r19, %r0, %r30
	.word 0xb1e48000  ! 1479: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_118:
	setx	0x2b0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42177  ! 1481: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_70:
	mov	0x19, %r14
	.word 0xf8f389e0  ! 1484: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb1e5a02a  ! 1486: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_119:
	setx	0x2a0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_120:
	setx	0x2b0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1497: SAVE_R	save	%r20, %r0, %r31
	.word 0xb5518000  ! 1500: RDPR_PSTATE	<illegal instruction>
	.word 0xb2b5215c  ! 1501: SUBCcc_I	orncc 	%r20, 0x015c, %r25
	.word 0xb5e5a1d8  ! 1502: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe48000  ! 1504: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe5c000  ! 1505: SAVE_R	save	%r23, %r0, %r29
	.word 0xb6040000  ! 1506: ADD_R	add 	%r16, %r0, %r27
T0_asi_reg_rd_62:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb32ca001  ! 1509: SLL_I	sll 	%r18, 0x0001, %r25
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde56177  ! 1516: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe40000  ! 1518: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_121:
	setx	0x2a0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42087  ! 1520: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_71:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 1524: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_122:
	setx	0x2a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e16b  ! 1532: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 6)
	.word 0xbde5a1dd  ! 1535: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_72:
	mov	0x32, %r14
	.word 0xf2f38e60  ! 1539: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_123:
	setx	0x280120, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_63:
	mov	0x24, %r14
	.word 0xf0db8e60  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 12)
	.word 0xbfe561f9  ! 1556: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_73:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 1557: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_124:
	setx	0x2b0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1560: SAVE_R	save	%r21, %r0, %r27
	.word 0xb1e50000  ! 1566: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_125:
	setx	0x2a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_126:
	setx	0x2a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1571: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e4c000  ! 1577: SAVE_R	save	%r19, %r0, %r27
	.word 0xbcbd0000  ! 1578: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xb3e44000  ! 1579: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5e44000  ! 1580: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e58000  ! 1589: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e48000  ! 1595: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_74:
	mov	0x2d, %r14
	.word 0xfef38e80  ! 1601: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_64:
	mov	0x1a, %r14
	.word 0xfedb89e0  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb42c2161  ! 1603: ANDN_I	andn 	%r16, 0x0161, %r26
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e4a1dd  ! 1613: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e521e1  ! 1615: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_75:
	mov	0x2, %r14
	.word 0xf6f384a0  ! 1617: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e40000  ! 1622: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e44000  ! 1623: SAVE_R	save	%r17, %r0, %r24
	.word 0xb1e54000  ! 1625: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e521b1  ! 1632: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_65:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_127:
	setx	0x280216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 1641: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde4c000  ! 1642: SAVE_R	save	%r19, %r0, %r30
	.word 0xb3e5a077  ! 1648: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb97c0400  ! 1649: MOVR_R	movre	%r16, %r0, %r28
cpu_intr_0_128:
	setx	0x280302, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_76:
	mov	0x27, %r14
	.word 0xfef38e40  ! 1653: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_77:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 1655: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5e4c000  ! 1656: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_129:
	setx	0x28023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 1659: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_78:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 1663: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 1)
	.word 0xba0d8000  ! 1667: AND_R	and 	%r22, %r0, %r29
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_130:
	setx	0x290113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a14c  ! 1673: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e54000  ! 1679: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_66:
	mov	0xb, %r14
	.word 0xf2db84a0  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, b)
	.word 0xbea461f5  ! 1684: SUBcc_I	subcc 	%r17, 0x01f5, %r31
	.word 0xb7e5c000  ! 1685: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_79:
	mov	0x33, %r14
	.word 0xf4f389e0  ! 1687: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7e58000  ! 1688: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e4a1b1  ! 1690: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e50000  ! 1691: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, d)
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e5a0fb  ! 1697: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde5a0bf  ! 1699: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e5605b  ! 1700: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_80:
	mov	0x20, %r14
	.word 0xf4f38e60  ! 1703: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbbe50000  ! 1705: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_67:
	mov	0x2f, %r14
	.word 0xf8db84a0  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7643801  ! 1709: MOVcc_I	<illegal instruction>
	.word 0xb9e4a183  ! 1710: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe48000  ! 1722: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 1726: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfe40000  ! 1727: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_68:
	mov	0x1e, %r14
	.word 0xf0db89e0  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3e48000  ! 1729: SAVE_R	save	%r18, %r0, %r25
	.word 0xb9e4613e  ! 1731: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbcb40000  ! 1737: SUBCcc_R	orncc 	%r16, %r0, %r30
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_82:
	mov	0xc, %r14
	.word 0xfef38e40  ! 1739: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5e46177  ! 1744: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e56076  ! 1746: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_69:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb23c8000  ! 1752: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0xbf540000  ! 1756: RDPR_GL	<illegal instruction>
cpu_intr_0_131:
	setx	0x29013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_70:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 1759: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5e4c000  ! 1763: SAVE_R	save	%r19, %r0, %r26
	.word 0xb2044000  ! 1764: ADD_R	add 	%r17, %r0, %r25
T0_asi_reg_rd_71:
	mov	0x1a, %r14
	.word 0xf0db8e80  ! 1766: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_132:
	setx	0x28013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1773: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_133:
	setx	0x280001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e0f4  ! 1775: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe40000  ! 1777: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_72:
	mov	0x21, %r14
	.word 0xf4db8e60  ! 1779: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_134:
	setx	0x29022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_83:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 1784: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 25)
	.word 0xb3e4e034  ! 1791: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_73:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7e5a1da  ! 1793: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4a0d1  ! 1796: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7342001  ! 1797: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xb9e4a026  ! 1798: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_84:
	mov	0x38, %r14
	.word 0xfef389e0  ! 1799: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbde5e11c  ! 1800: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e4e11b  ! 1802: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5a1f7  ! 1803: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde5c000  ! 1809: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_135:
	setx	0x280101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_136:
	setx	0x280318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 21)
	.word 0xb4ad0000  ! 1820: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xb7e54000  ! 1821: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e4c000  ! 1825: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e5e1dd  ! 1831: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_137:
	setx	0x2a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0de1b9  ! 1835: AND_I	and 	%r23, 0x01b9, %r29
cpu_intr_0_138:
	setx	0x280017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_139:
	setx	0x2a0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c1000  ! 1840: SRAX_R	srax	%r16, %r0, %r30
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e5e101  ! 1847: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e50000  ! 1849: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_85:
	mov	0x2d, %r14
	.word 0xfcf384a0  ! 1850: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb5e40000  ! 1852: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_74:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 1854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 3)
	.word 0xb6a50000  ! 1862: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xb9e40000  ! 1865: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9e54000  ! 1868: SAVE_R	save	%r21, %r0, %r28
	.word 0xbac50000  ! 1871: ADDCcc_R	addccc 	%r20, %r0, %r29
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_140:
	setx	0x2d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 1875: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_141:
	setx	0x2d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e420b3  ! 1877: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb2256145  ! 1879: SUB_I	sub 	%r21, 0x0145, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_87:
	mov	0x10, %r14
	.word 0xf6f384a0  ! 1886: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_rd_75:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 1888: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5e58000  ! 1890: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e44000  ! 1892: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_88:
	mov	0x13, %r14
	.word 0xfaf38e80  ! 1895: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb52c5000  ! 1899: SLLX_R	sllx	%r17, %r0, %r26
	.word 0xb7e58000  ! 1901: SAVE_R	save	%r22, %r0, %r27
	.word 0xb7e421db  ! 1903: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe40000  ! 1905: SAVE_R	save	%r16, %r0, %r29
	.word 0xb7e54000  ! 1906: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_142:
	setx	0x2c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_76:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 1910: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_77:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb5e40000  ! 1922: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_143:
	setx	0x2d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3ce001  ! 1926: SRA_I	sra 	%r19, 0x0001, %r31
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_144:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ad8000  ! 1931: ANDNcc_R	andncc 	%r22, %r0, %r24
cpu_intr_0_145:
	setx	0x2d0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8c4000  ! 1934: ANDcc_R	andcc 	%r17, %r0, %r31
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 3c)
	.word 0xba144000  ! 1938: OR_R	or 	%r17, %r0, %r29
cpu_intr_0_146:
	setx	0x2c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 1940: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_147:
	setx	0x2f0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_78:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3e460e4  ! 1949: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_148:
	setx	0x2c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, e)
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 25)
	.word 0xb625c000  ! 1961: SUB_R	sub 	%r23, %r0, %r27
	.word 0xb7508000  ! 1962: RDPR_TSTATE	<illegal instruction>
	.word 0xb1354000  ! 1964: SRL_R	srl 	%r21, %r0, %r24
	.word 0xbde460d5  ! 1967: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 36)
	.word 0xb3e44000  ! 1973: SAVE_R	save	%r17, %r0, %r25
	.word 0xb1e40000  ! 1978: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_149:
	setx	0x2f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_150:
	setx	0x2e0333, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_89:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 1981: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5e48000  ! 1983: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_151:
	setx	0x2e0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe421a8  ! 1986: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_152:
	setx	0x2e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 27)
	.word 0xb485615b  ! 1994: ADDcc_I	addcc 	%r21, 0x015b, %r26
	.word 0xb0944000  ! 1996: ORcc_R	orcc 	%r17, %r0, %r24
	.word 0xb13c2001  ! 1997: SRA_I	sra 	%r16, 0x0001, %r24
	.word 0xbfe58000  ! 1998: SAVE_R	save	%r22, %r0, %r31
	.word 0xb9e58000  ! 1999: SAVE_R	save	%r22, %r0, %r28
	.word 0xb1e50000  ! 2000: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e44000  ! 2001: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e5c000  ! 2005: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, b)
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 17)
	.word 0xb20ca00c  ! 2010: AND_I	and 	%r18, 0x000c, %r25
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 28)
	.word 0xbb35c000  ! 2013: SRL_R	srl 	%r23, %r0, %r29
	.word 0xbde54000  ! 2018: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_90:
	mov	0x15, %r14
	.word 0xfcf389e0  ! 2022: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_153:
	setx	0x2c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 16)
	.word 0xb534f001  ! 2032: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb0150000  ! 2036: OR_R	or 	%r20, %r0, %r24
T0_asi_reg_rd_79:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e5a19a  ! 2041: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde44000  ! 2043: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_154:
	setx	0x2d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_80:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_81:
	mov	0x2, %r14
	.word 0xf6db8e60  ! 2053: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1e5a0ce  ! 2055: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e5e1de  ! 2061: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde40000  ! 2063: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_91:
	mov	0x11, %r14
	.word 0xfcf38e80  ! 2065: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_155:
	setx	0x2f003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_83:
	mov	0x18, %r14
	.word 0xf2db8400  ! 2076: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 15)
	.word 0xb7510000  ! 2079: RDPR_TICK	<illegal instruction>
	.word 0xbde48000  ! 2082: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5e58000  ! 2083: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_84:
	mov	0x34, %r14
	.word 0xf4db8e40  ! 2084: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_85:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_156:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a1f1  ! 2088: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde52160  ! 2089: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbde4c000  ! 2093: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_86:
	mov	0x9, %r14
	.word 0xf8db8e80  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_157:
	setx	0x2e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, c)
	.word 0xbfe4a141  ! 2106: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4e126  ! 2109: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_92:
	mov	0x1d, %r14
	.word 0xf8f38e60  ! 2116: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_158:
	setx	0x2d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_93:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 2121: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9e5e005  ! 2123: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_87:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb92d2001  ! 2130: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xbfe40000  ! 2132: SAVE_R	save	%r16, %r0, %r31
	.word 0xb3e520b9  ! 2135: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_159:
	setx	0x2c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e4c000  ! 2141: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, f)
	.word 0xba05e02c  ! 2149: ADD_I	add 	%r23, 0x002c, %r29
	.word 0xb3e50000  ! 2153: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e4e08c  ! 2156: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_160:
	setx	0x2d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a08b  ! 2163: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4e149  ! 2164: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e5a071  ! 2168: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_161:
	setx	0x2c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 37)
	.word 0xbf35c000  ! 2172: SRL_R	srl 	%r23, %r0, %r31
T0_asi_reg_wr_94:
	mov	0x5, %r14
	.word 0xfef38400  ! 2173: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe5605f  ! 2175: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_88:
	mov	0x2b, %r14
	.word 0xfedb84a0  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9e4e0fd  ! 2178: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_95:
	mov	0x0, %r14
	.word 0xf2f38e80  ! 2179: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e56136  ! 2183: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_89:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb7e40000  ! 2188: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e58000  ! 2190: SAVE_R	save	%r22, %r0, %r24
	.word 0xbf7c4400  ! 2192: MOVR_R	movre	%r17, %r0, %r31
	.word 0xb9e46054  ! 2195: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e421b7  ! 2196: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e52092  ! 2199: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_96:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 2200: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_97:
	mov	0x32, %r14
	.word 0xfaf38e40  ! 2201: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_162:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_98:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 2205: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5e44000  ! 2206: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_90:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 2207: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_163:
	setx	0x2d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2210: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_164:
	setx	0x2d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_91:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_165:
	setx	0x2e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 2226: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e54000  ! 2227: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_92:
	mov	0x1a, %r14
	.word 0xf6db8e60  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_93:
	mov	0x17, %r14
	.word 0xf6db89e0  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_99:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 2235: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_94:
	mov	0x1b, %r14
	.word 0xf8db8e60  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5e58000  ! 2242: SAVE_R	save	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 23)
	.word 0xbde4c000  ! 2247: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe58000  ! 2248: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_100:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 2249: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e48000  ! 2250: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_95:
	mov	0x21, %r14
	.word 0xf6db89e0  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_96:
	mov	0x26, %r14
	.word 0xf2db8e80  ! 2252: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e560a6  ! 2255: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe420ea  ! 2258: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_97:
	mov	0x4, %r14
	.word 0xfadb8400  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_166:
	setx	0x2f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520bd  ! 2265: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_167:
	setx	0x2e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561c8  ! 2269: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_101:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 2273: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_168:
	setx	0x2c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_102:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2285: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbbe44000  ! 2288: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_98:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbe5e08f  ! 2291: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_169:
	setx	0x2e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_103:
	mov	0x17, %r14
	.word 0xf8f38e40  ! 2294: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_104:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 2299: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e54000  ! 2302: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_170:
	setx	0x32020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e18e  ! 2304: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_99:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_rd_100:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 2306: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe4a18b  ! 2307: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e52048  ! 2308: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe44000  ! 2313: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e54000  ! 2319: SAVE_R	save	%r21, %r0, %r27
	.word 0xbc14c000  ! 2320: OR_R	or 	%r19, %r0, %r30
	.word 0xbabc8000  ! 2321: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0xb9e46068  ! 2323: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_105:
	mov	0x29, %r14
	.word 0xf4f384a0  ! 2325: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e5e193  ! 2326: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e5c000  ! 2327: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_101:
	mov	0x1, %r14
	.word 0xfedb8e60  ! 2329: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde50000  ! 2336: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e521fe  ! 2337: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_171:
	setx	0x320010, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_102:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_106:
	mov	0x15, %r14
	.word 0xf2f384a0  ! 2348: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_172:
	setx	0x310236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_173:
	setx	0x30002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 2356: SAVE_R	save	%r18, %r0, %r29
	.word 0xbd2c8000  ! 2357: SLL_R	sll 	%r18, %r0, %r30
T0_asi_reg_rd_103:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 2358: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbca4a1cd  ! 2360: SUBcc_I	subcc 	%r18, 0x01cd, %r30
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e58000  ! 2369: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_174:
	setx	0x320205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 2371: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_175:
	setx	0x300328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 2377: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_107:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 2379: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_104:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb1e48000  ! 2382: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e461c8  ! 2386: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e54000  ! 2387: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_176:
	setx	0x310302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2391: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_177:
	setx	0x310016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_178:
	setx	0x32022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_179:
	setx	0x32020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0fd  ! 2400: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_108:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 2402: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5e58000  ! 2403: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_105:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 2404: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb83da063  ! 2405: XNOR_I	xnor 	%r22, 0x0063, %r28
	.word 0xbde421bf  ! 2408: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_109:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 2410: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 2411: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfe4c000  ! 2415: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_180:
	setx	0x300238, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2417: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e420a4  ! 2420: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe44000  ! 2423: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e40000  ! 2424: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e5e193  ! 2428: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_106:
	mov	0x9, %r14
	.word 0xfedb8400  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_rd_107:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_108:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e48000  ! 2434: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e5a05c  ! 2436: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_181:
	setx	0x32003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 2440: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_112:
	mov	0x31, %r14
	.word 0xf2f389e0  ! 2442: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_113:
	mov	0x1, %r14
	.word 0xfef38e80  ! 2445: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e5c000  ! 2450: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_109:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 2453: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_wr_114:
	mov	0x2c, %r14
	.word 0xf4f38e80  ! 2455: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1e48000  ! 2456: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_115:
	mov	0x24, %r14
	.word 0xf0f38e60  ! 2457: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_116:
	mov	0x34, %r14
	.word 0xf0f38400  ! 2460: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_110:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_117:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 2464: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_182:
	setx	0x330135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_183:
	setx	0x320332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_184:
	setx	0x30011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 2470: SAVE_R	save	%r20, %r0, %r26
	.word 0xb72c5000  ! 2471: SLLX_R	sllx	%r17, %r0, %r27
T0_asi_reg_rd_111:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 2472: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e4a17c  ! 2474: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_118:
	mov	0x0, %r14
	.word 0xfef389e0  ! 2479: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb01cc000  ! 2483: XOR_R	xor 	%r19, %r0, %r24
	.word 0xbfe5a1c8  ! 2484: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_112:
	mov	0x2a, %r14
	.word 0xfcdb8e80  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_185:
	setx	0x310009, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_113:
	mov	0x13, %r14
	.word 0xfadb8e80  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_rd_114:
	mov	0x20, %r14
	.word 0xfcdb8e60  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_119:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 2498: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e4e0fc  ! 2503: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_186:
	setx	0x300017, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_120:
	mov	0x16, %r14
	.word 0xf8f38400  ! 2506: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5e48000  ! 2507: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_115:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 2508: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_rd_116:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 2509: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_117:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 2515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e50000  ! 2517: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5e4c000  ! 2518: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe5c000  ! 2519: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_118:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_187:
	setx	0x30031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x310217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56165  ! 2529: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_121:
	mov	0xf, %r14
	.word 0xfef38e40  ! 2531: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_122:
	mov	0x27, %r14
	.word 0xf2f38400  ! 2532: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, d)
	.word 0xb5e4c000  ! 2540: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_123:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 2541: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_189:
	setx	0x31002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1c2069  ! 2549: XOR_I	xor 	%r16, 0x0069, %r31
	.word 0xb835c000  ! 2550: SUBC_R	orn 	%r23, %r0, %r28
T0_asi_reg_rd_119:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_190:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1ce  ! 2559: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_120:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_121:
	mov	0x38, %r14
	.word 0xf2db8400  ! 2566: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_191:
	setx	0x320122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_192:
	setx	0x300022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_193:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1f9  ! 2575: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e521f0  ! 2576: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbc148000  ! 2581: OR_R	or 	%r18, %r0, %r30
T0_asi_reg_wr_124:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 2584: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e44000  ! 2585: SAVE_R	save	%r17, %r0, %r28
	.word 0xbbe4609e  ! 2586: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_194:
	setx	0x31020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0b1  ! 2591: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_122:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbabc6152  ! 2597: XNORcc_I	xnorcc 	%r17, 0x0152, %r29
	.word 0xbbe48000  ! 2598: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e54000  ! 2607: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb405e122  ! 2609: ADD_I	add 	%r23, 0x0122, %r26
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_195:
	setx	0x30030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_196:
	setx	0x30023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb50000  ! 2621: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xbbe54000  ! 2623: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e48000  ! 2624: SAVE_R	save	%r18, %r0, %r24
	.word 0xb4ac21f8  ! 2627: ANDNcc_I	andncc 	%r16, 0x01f8, %r26
	.word 0xbbe5c000  ! 2629: SAVE_R	save	%r23, %r0, %r29
	.word 0xbb2dc000  ! 2632: SLL_R	sll 	%r23, %r0, %r29
cpu_intr_0_197:
	setx	0x320229, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_123:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe54000  ! 2645: SAVE_R	save	%r21, %r0, %r31
	.word 0xb7e40000  ! 2646: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e4e0b4  ! 2647: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_124:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 2648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_198:
	setx	0x310006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2652: SAVE_R	save	%r20, %r0, %r29
	.word 0xb1e44000  ! 2653: SAVE_R	save	%r17, %r0, %r24
	.word 0xbde5602a  ! 2654: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e5e196  ! 2657: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_199:
	setx	0x31003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735d000  ! 2661: SRLX_R	srlx	%r23, %r0, %r27
cpu_intr_0_200:
	setx	0x30011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5353001  ! 2665: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xbbe461fb  ! 2666: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_125:
	mov	0x1a, %r14
	.word 0xf8db8e60  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e4e1e4  ! 2674: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb29461cc  ! 2676: ORcc_I	orcc 	%r17, 0x01cc, %r25
cpu_intr_0_201:
	setx	0x30031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 2684: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_125:
	mov	0x37, %r14
	.word 0xf0f38e60  ! 2686: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e4a1b1  ! 2687: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e420f3  ! 2688: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e56123  ! 2691: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e4e19b  ! 2692: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e4e1b3  ! 2694: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e421c2  ! 2697: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e40000  ! 2701: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde48000  ! 2702: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb6c48000  ! 2711: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xb215c000  ! 2712: OR_R	or 	%r23, %r0, %r25
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_126:
	mov	0x2c, %r14
	.word 0xfaf38400  ! 2716: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_126:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 2717: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_rd_127:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 2719: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_202:
	setx	0x300123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_127:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 2724: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_128:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 2725: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e5e0a0  ! 2726: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_129:
	mov	0x17, %r14
	.word 0xf4f384a0  ! 2731: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3e521a0  ! 2734: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_203:
	setx	0x37020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00ca14d  ! 2744: AND_I	and 	%r18, 0x014d, %r24
	.word 0xb5e421b0  ! 2745: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde50000  ! 2750: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_204:
	setx	0x37020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, e)
	.word 0xa1902001  ! 2755: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cpu_intr_0_205:
	setx	0x360002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_wr_130:
	mov	0x36, %r14
	.word 0xfef384a0  ! 2762: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e58000  ! 2764: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e44000  ! 2765: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e4e025  ! 2767: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e521c4  ! 2768: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5211a  ! 2769: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_128:
	mov	0xf, %r14
	.word 0xfcdb89e0  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb53cc000  ! 2776: SRA_R	sra 	%r19, %r0, %r26
	.word 0xb7e58000  ! 2780: SAVE_R	save	%r22, %r0, %r27
	.word 0xbfe4e14c  ! 2781: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e50000  ! 2784: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 4)
	.word 0xbfe4c000  ! 2792: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_206:
	setx	0x340105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe58000  ! 2800: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_131:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 2804: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3e4213c  ! 2805: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe5a136  ! 2810: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e48000  ! 2812: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e5e128  ! 2818: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_129:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_207:
	setx	0x350000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbac4609e  ! 2825: ADDCcc_I	addccc 	%r17, 0x009e, %r29
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_208:
	setx	0x37012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e03f  ! 2828: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_209:
	setx	0x360111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_210:
	setx	0x36012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_130:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 2843: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb895a1fd  ! 2845: ORcc_I	orcc 	%r22, 0x01fd, %r28
T0_asi_reg_wr_132:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 2846: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_133:
	mov	0x2, %r14
	.word 0xfcf384a0  ! 2847: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_134:
	mov	0x29, %r14
	.word 0xf6f38e60  ! 2848: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_211:
	setx	0x35022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 35)
	.word 0xbb3d6001  ! 2852: SRA_I	sra 	%r21, 0x0001, %r29
cpu_intr_0_212:
	setx	0x340218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4206b  ! 2854: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_213:
	setx	0x37030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_131:
	mov	0x21, %r14
	.word 0xfedb84a0  ! 2858: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_135:
	mov	0xe, %r14
	.word 0xf2f384a0  ! 2859: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9e4c000  ! 2862: SAVE_R	save	%r19, %r0, %r28
	.word 0xbbe5e15a  ! 2863: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_136:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 2864: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_214:
	setx	0x350314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4854000  ! 2866: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xb751c000  ! 2867: RDPR_TL	<illegal instruction>
cpu_intr_0_215:
	setx	0x340032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_137:
	mov	0x12, %r14
	.word 0xf4f38e60  ! 2870: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xa1902000  ! 2871: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbbe50000  ! 2873: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_132:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 2874: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde4e1e6  ! 2875: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb645a194  ! 2876: ADDC_I	addc 	%r22, 0x0194, %r27
	.word 0x8f902000  ! 2878: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe561ea  ! 2884: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_138:
	mov	0x37, %r14
	.word 0xfef38400  ! 2885: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_133:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e58000  ! 2889: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_216:
	setx	0x340304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2893: RDPR_PIL	<illegal instruction>
cpu_intr_0_217:
	setx	0x350018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_218:
	setx	0x370026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_134:
	mov	0x8, %r14
	.word 0xf4db8400  ! 2897: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_219:
	setx	0x350125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_220:
	setx	0x370230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e067  ! 2902: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_221:
	setx	0x370100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_222:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde44000  ! 2913: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_223:
	setx	0x360339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4217e  ! 2916: SUBcc_I	subcc 	%r16, 0x017e, %r29
	.word 0xb7e5c000  ! 2918: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_135:
	mov	0x24, %r14
	.word 0xf0db8e60  ! 2919: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_224:
	setx	0x340204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e560d6  ! 2925: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5a007  ! 2926: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4e058  ! 2927: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe420f5  ! 2928: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e58000  ! 2931: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e44000  ! 2936: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_139:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 2940: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5e54000  ! 2942: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_136:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe56030  ! 2950: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e420b0  ! 2954: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e54000  ! 2955: SAVE_R	save	%r21, %r0, %r24
	.word 0xb5e48000  ! 2956: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_140:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 2957: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_141:
	mov	0x18, %r14
	.word 0xf4f38400  ! 2959: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfe5a1e8  ! 2963: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_225:
	setx	0x360105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_142:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 2970: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9e4e06b  ! 2971: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_137:
	mov	0x31, %r14
	.word 0xf4db8400  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb2bc6142  ! 2973: XNORcc_I	xnorcc 	%r17, 0x0142, %r25
cpu_intr_0_226:
	setx	0x340110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_227:
	setx	0x350133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe54000  ! 2978: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_138:
	mov	0x6, %r14
	.word 0xf6db8e40  ! 2979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_143:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 2983: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3e4c000  ! 2984: SAVE_R	save	%r19, %r0, %r25
	.word 0xb7e5601e  ! 2985: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_139:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_140:
	mov	0x16, %r14
	.word 0xf8db84a0  ! 2988: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_wr_144:
	mov	0x2e, %r14
	.word 0xf6f38e40  ! 2990: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 19)
	.word 0xb1e58000  ! 2992: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_228:
	setx	0x360304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2994: RDPR_TPC	<illegal instruction>
	.word 0xb1e48000  ! 2997: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e4e043  ! 2999: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_145:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 3000: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_141:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde4e18a  ! 3006: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e461e9  ! 3010: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_229:
	setx	0x35032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_230:
	setx	0x37020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_142:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_143:
	mov	0x35, %r14
	.word 0xf4db8400  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_144:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_231:
	setx	0x370211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 3027: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_232:
	setx	0x350307, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_145:
	mov	0x1d, %r14
	.word 0xf0db8e80  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e4a190  ! 3034: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde56119  ! 3035: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e42156  ! 3036: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4e0cc  ! 3037: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4e1ea  ! 3039: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_146:
	mov	0x38, %r14
	.word 0xfcdb84a0  ! 3042: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xba1d20b4  ! 3043: XOR_I	xor 	%r20, 0x00b4, %r29
T0_asi_reg_wr_146:
	mov	0x4, %r14
	.word 0xf8f38e40  ! 3044: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbac560ba  ! 3045: ADDCcc_I	addccc 	%r21, 0x00ba, %r29
	.word 0xb5e5c000  ! 3049: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e5c000  ! 3050: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_233:
	setx	0x37020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e520a7  ! 3052: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb2a48000  ! 3054: SUBcc_R	subcc 	%r18, %r0, %r25
T0_asi_reg_rd_147:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 3064: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb1e4e0ff  ! 3065: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_234:
	setx	0x36022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_147:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 3071: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb1643801  ! 3072: MOVcc_I	<illegal instruction>
	.word 0xbfe4e0e0  ! 3077: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe50000  ! 3080: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe4e141  ! 3081: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e40000  ! 3083: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb33c8000  ! 3085: SRA_R	sra 	%r18, %r0, %r25
	.word 0x919560d3  ! 3088: WRPR_PIL_I	wrpr	%r21, 0x00d3, %pil
T0_asi_reg_rd_148:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe4611d  ! 3099: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 21)
	.word 0xb49d8000  ! 3103: XORcc_R	xorcc 	%r22, %r0, %r26
cpu_intr_0_235:
	setx	0x340135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb694a197  ! 3105: ORcc_I	orcc 	%r18, 0x0197, %r27
	.word 0xb7e44000  ! 3110: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e5c000  ! 3111: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_148:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3112: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e5a183  ! 3114: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e56153  ! 3116: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_149:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 3119: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e5a171  ! 3125: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_236:
	setx	0x360129, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_150:
	mov	0x2b, %r14
	.word 0xfaf38e80  ! 3127: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_151:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 3129: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e58000  ! 3130: SAVE_R	save	%r22, %r0, %r28
	.word 0xbe842016  ! 3135: ADDcc_I	addcc 	%r16, 0x0016, %r31
	.word 0xbc1d61a2  ! 3138: XOR_I	xor 	%r21, 0x01a2, %r30
	.word 0xbfe5615c  ! 3140: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_149:
	mov	0x21, %r14
	.word 0xf0db84a0  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_150:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_237:
	setx	0x35002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4213e  ! 3147: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e48000  ! 3151: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7e40000  ! 3152: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_238:
	setx	0x35022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e1ff  ! 3158: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_239:
	setx	0x340321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbfe5a14b  ! 3161: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbb504000  ! 3162: RDPR_TNPC	<illegal instruction>
T0_asi_reg_rd_151:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbcbc4000  ! 3165: XNORcc_R	xnorcc 	%r17, %r0, %r30
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e5e0c4  ! 3167: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_152:
	mov	0x5, %r14
	.word 0xf8db8400  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_152:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3175: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_153:
	mov	0x24, %r14
	.word 0xfcdb84a0  ! 3179: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e5c000  ! 3181: SAVE_R	save	%r23, %r0, %r26
	.word 0xb6254000  ! 3183: SUB_R	sub 	%r21, %r0, %r27
	.word 0xbde521c3  ! 3187: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5e009  ! 3198: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5a008  ! 3200: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e58000  ! 3202: SAVE_R	save	%r22, %r0, %r27
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
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 6)
	.word 0xbb480000  ! 3208: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
T0_asi_reg_rd_154:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb8bde155  ! 3210: XNORcc_I	xnorcc 	%r23, 0x0155, %r28
	.word 0xb5e58000  ! 3213: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_153:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 3215: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_154:
	mov	0xe, %r14
	.word 0xf0f38400  ! 3218: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_240:
	setx	0x3a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_241:
	setx	0x38031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_155:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 3225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_155:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3227: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe4e139  ! 3231: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb28de0c1  ! 3233: ANDcc_I	andcc 	%r23, 0x00c1, %r25
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5e44000  ! 3236: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 37)
	.word 0xbfe58000  ! 3240: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_156:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb57c0400  ! 3246: MOVR_R	movre	%r16, %r0, %r26
cpu_intr_0_242:
	setx	0x380003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4215e  ! 3249: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_157:
	mov	0x28, %r14
	.word 0xfedb8400  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbc34a0b3  ! 3251: ORN_I	orn 	%r18, 0x00b3, %r30
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_243:
	setx	0x3a022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3259: SAVE_R	save	%r16, %r0, %r24
	.word 0xb52c7001  ! 3260: SLLX_I	sllx	%r17, 0x0001, %r26
	.word 0xbfe52127  ! 3267: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde40000  ! 3270: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_244:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_158:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb02c8000  ! 3277: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xb7e461c5  ! 3278: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_159:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3e4c000  ! 3280: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_161:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 31)
	.word 0xbe8561a9  ! 3293: ADDcc_I	addcc 	%r21, 0x01a9, %r31
	.word 0xbbe560e7  ! 3296: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e40000  ! 3298: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_156:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 3299: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e5c000  ! 3305: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_162:
	mov	0x13, %r14
	.word 0xf8db8e80  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_163:
	mov	0x22, %r14
	.word 0xfadb8400  ! 3310: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_157:
	mov	0x1a, %r14
	.word 0xf8f38e60  ! 3313: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_245:
	setx	0x380313, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_158:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 3320: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_159:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 3323: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe50000  ! 3324: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_246:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 3328: SAVE_R	save	%r18, %r0, %r28
	.word 0xb5e58000  ! 3329: SAVE_R	save	%r22, %r0, %r26
	.word 0xbea44000  ! 3330: SUBcc_R	subcc 	%r17, %r0, %r31
	.word 0xbbe54000  ! 3331: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_247:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4248000  ! 3342: SUB_R	sub 	%r18, %r0, %r26
	.word 0xb7e560ab  ! 3343: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_164:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_248:
	setx	0x380117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56027  ! 3347: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e44000  ! 3350: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb3e40000  ! 3352: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe560e4  ! 3353: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e52133  ! 3354: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_160:
	mov	0x32, %r14
	.word 0xf8f38400  ! 3355: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb6054000  ! 3358: ADD_R	add 	%r21, %r0, %r27
cpu_intr_0_249:
	setx	0x38002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46184  ! 3362: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe4206e  ! 3376: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_161:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 3378: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe5e178  ! 3379: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe4e18b  ! 3382: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_165:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 3385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_166:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_250:
	setx	0x3a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 32)
	.word 0xbebde14f  ! 3391: XNORcc_I	xnorcc 	%r23, 0x014f, %r31
	.word 0xb13c7001  ! 3393: SRAX_I	srax	%r17, 0x0001, %r24
cpu_intr_0_251:
	setx	0x3a013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 3395: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_252:
	setx	0x380104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 3402: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_162:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 3403: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e54000  ! 3410: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_253:
	setx	0x3a0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_163:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 3415: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9e42119  ! 3416: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_167:
	mov	0x1b, %r14
	.word 0xf6db89e0  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_164:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 3420: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_254:
	setx	0x390303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_255:
	setx	0x3b0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_256:
	setx	0x380121, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_165:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 3431: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbde50000  ! 3433: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_166:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 3435: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbc340000  ! 3436: ORN_R	orn 	%r16, %r0, %r30
	.word 0xb9e4e1fa  ! 3438: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_167:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3442: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb32c6001  ! 3444: SLL_I	sll 	%r17, 0x0001, %r25
cpu_intr_0_257:
	setx	0x3b0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c3001  ! 3448: SLLX_I	sllx	%r16, 0x0001, %r29
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_168:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 3452: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e58000  ! 3453: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe48000  ! 3455: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_169:
	mov	0x28, %r14
	.word 0xfaf38400  ! 3457: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e50000  ! 3459: SAVE_R	save	%r20, %r0, %r24
	.word 0xbfe5e18c  ! 3463: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde50000  ! 3465: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_170:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 3468: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_171:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 3469: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_168:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_172:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 3471: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 3473: SAVE_R	save	%r21, %r0, %r31
	.word 0xb5e40000  ! 3475: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e4a172  ! 3477: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_169:
	mov	0x21, %r14
	.word 0xf8db8e80  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_173:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 3481: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7e44000  ! 3487: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e58000  ! 3488: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e421a0  ! 3490: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e50000  ! 3493: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_258:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x30229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_260:
	setx	0x3b0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_170:
	mov	0x2a, %r14
	.word 0xfadb8e80  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_261:
	setx	0x38003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_171:
	mov	0xf, %r14
	.word 0xf0db89e0  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_262:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_263:
	setx	0x390031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_174:
	mov	0x3, %r14
	.word 0xfef38e60  ! 3523: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_264:
	setx	0x380003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_265:
	setx	0x390025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 3527: SAVE_R	save	%r21, %r0, %r28
	.word 0x8995214c  ! 3531: WRPR_TICK_I	wrpr	%r20, 0x014c, %tick
T0_asi_reg_rd_172:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 3532: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb80c4000  ! 3533: AND_R	and 	%r17, %r0, %r28
T0_asi_reg_rd_173:
	mov	0xc, %r14
	.word 0xfadb89e0  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbfe5602a  ! 3539: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5e0aa  ! 3541: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbe2da127  ! 3542: ANDN_I	andn 	%r22, 0x0127, %r31
	.word 0xb5e44000  ! 3543: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe5e176  ! 3545: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 34)
	.word 0xbde5e069  ! 3552: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e40000  ! 3554: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e42075  ! 3555: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1350000  ! 3556: SRL_R	srl 	%r20, %r0, %r24
	.word 0xb9e4a0bc  ! 3558: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_266:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac44000  ! 3566: ADDCcc_R	addccc 	%r17, %r0, %r29
cpu_intr_0_267:
	setx	0x39033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_175:
	mov	0x2f, %r14
	.word 0xf0f38e40  ! 3574: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_174:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe48000  ! 3578: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_176:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 3581: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_268:
	setx	0x3b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba150000  ! 3588: OR_R	or 	%r20, %r0, %r29
	.word 0xbde54000  ! 3592: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_175:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_269:
	setx	0x3b010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe5e00c  ! 3597: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_270:
	setx	0x3b0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1cc000  ! 3602: XOR_R	xor 	%r19, %r0, %r29
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e54000  ! 3615: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_176:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 3617: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e46034  ! 3618: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb97d4400  ! 3620: MOVR_R	movre	%r21, %r0, %r28
cpu_intr_0_271:
	setx	0x3e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_272:
	setx	0x3f031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_177:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 3636: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e560e8  ! 3638: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xba24616f  ! 3639: SUB_I	sub 	%r17, 0x016f, %r29
	.word 0xb1e4a061  ! 3641: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e4a03e  ! 3642: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 16)
	.word 0xb1e54000  ! 3649: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e40000  ! 3650: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 36)
	.word 0xb834e00a  ! 3655: ORN_I	orn 	%r19, 0x000a, %r28
	.word 0xbfe58000  ! 3663: SAVE_R	save	%r22, %r0, %r31
	.word 0xb7e5e02f  ! 3664: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde5a0bd  ! 3675: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_178:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 3677: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_wr_179:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 3678: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9e4e1f2  ! 3680: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbe940000  ! 3683: ORcc_R	orcc 	%r16, %r0, %r31
T0_asi_reg_wr_180:
	mov	0x37, %r14
	.word 0xfaf38e80  ! 3684: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbfe5e050  ! 3686: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_273:
	setx	0x3d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_274:
	setx	0x3f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_275:
	setx	0x3f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_276:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e175  ! 3694: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5a070  ! 3695: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbe3c0000  ! 3698: XNOR_R	xnor 	%r16, %r0, %r31
	.word 0xb150c000  ! 3699: RDPR_TT	<illegal instruction>
cpu_intr_0_277:
	setx	0x3f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_278:
	setx	0x3c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 3707: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e4a1d1  ! 3708: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_279:
	setx	0x3e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1a8  ! 3710: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_280:
	setx	0x3e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe5a1a6  ! 3719: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e4a0de  ! 3724: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_281:
	setx	0x3d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3732: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_181:
	mov	0x23, %r14
	.word 0xf6f384a0  ! 3734: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1e520c4  ! 3736: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e5e14d  ! 3739: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb2ac6064  ! 3740: ANDNcc_I	andncc 	%r17, 0x0064, %r25
T0_asi_reg_wr_182:
	mov	0x22, %r14
	.word 0xf2f38e80  ! 3741: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_282:
	setx	0x3c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3750: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_283:
	setx	0x3c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_284:
	setx	0x3e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 3754: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_285:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_177:
	mov	0x1, %r14
	.word 0xf8db8400  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_286:
	setx	0x3f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034c000  ! 3761: ORN_R	orn 	%r19, %r0, %r24
	.word 0xbfe50000  ! 3762: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e5e103  ! 3766: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_183:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 3768: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_rd_178:
	mov	0xa, %r14
	.word 0xf8db8400  ! 3776: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_179:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 3778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_287:
	setx	0x3d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1f1  ! 3781: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbd643801  ! 3783: MOVcc_I	<illegal instruction>
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_184:
	mov	0x6, %r14
	.word 0xf0f38e80  ! 3790: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_rd_180:
	mov	0x10, %r14
	.word 0xf0db8400  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_288:
	setx	0x3e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_289:
	setx	0x3023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3795: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_181:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 3796: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7e58000  ! 3802: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_185:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 3803: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5500000  ! 3805: RDPR_TPC	<illegal instruction>
cpu_intr_0_290:
	setx	0x3c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_291:
	setx	0x3f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3808: SAVE_R	save	%r23, %r0, %r24
	.word 0xbfe44000  ! 3809: SAVE_R	save	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_186:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 3814: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e54000  ! 3816: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 24)
	.word 0xbf3d2001  ! 3820: SRA_I	sra 	%r20, 0x0001, %r31
	.word 0xb9e46068  ! 3821: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_187:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 3822: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_292:
	setx	0x3e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_293:
	setx	0x3e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3827: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe4a0f9  ! 3829: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e421b7  ! 3833: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_182:
	mov	0x2b, %r14
	.word 0xf4db8400  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbf2d5000  ! 3841: SLLX_R	sllx	%r21, %r0, %r31
T0_asi_reg_rd_183:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb4848000  ! 3844: ADDcc_R	addcc 	%r18, %r0, %r26
cpu_intr_0_294:
	setx	0x3f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_295:
	setx	0x3f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe421d4  ! 3848: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_296:
	setx	0x3f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e5e03c  ! 3851: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_297:
	setx	0x3e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_188:
	mov	0x1d, %r14
	.word 0xf8f384a0  ! 3855: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb0044000  ! 3856: ADD_R	add 	%r17, %r0, %r24
	.word 0xbde46100  ! 3857: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3e40000  ! 3863: SAVE_R	save	%r16, %r0, %r25
	.word 0xbcc461a7  ! 3865: ADDCcc_I	addccc 	%r17, 0x01a7, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 20)
	.word 0xbde46091  ! 3874: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4a18e  ! 3876: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e46082  ! 3877: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_184:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7e44000  ! 3889: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_185:
	mov	0x1a, %r14
	.word 0xf0db89e0  ! 3892: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe5c000  ! 3896: SAVE_R	save	%r23, %r0, %r31
	.word 0xb085a073  ! 3898: ADDcc_I	addcc 	%r22, 0x0073, %r24
	.word 0xb2348000  ! 3899: ORN_R	orn 	%r18, %r0, %r25
cpu_intr_0_298:
	setx	0x3e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_189:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 3901: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_299:
	setx	0x3c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0ea  ! 3904: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_300:
	setx	0x3e0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a00c  ! 3906: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_301:
	setx	0x3c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0ad  ! 3909: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e48000  ! 3912: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_186:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 3915: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_187:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 3917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_188:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9e50000  ! 3919: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_190:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 3922: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbde50000  ! 3925: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_191:
	mov	0x32, %r14
	.word 0xfef38e60  ! 3926: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbde40000  ! 3927: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_189:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_302:
	setx	0x3f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 2d)
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
	.word 0xb9e4e16a  ! 3940: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_303:
	setx	0x3e0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_192:
	mov	0x6, %r14
	.word 0xfef384a0  ! 3956: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_304:
	setx	0x3f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0d6  ! 3960: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_305:
	setx	0x3e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c8000  ! 3962: SRA_R	sra 	%r18, %r0, %r29
	.word 0xb9e46109  ! 3963: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_193:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 3964: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1e4a00a  ! 3965: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e56138  ! 3967: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_194:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 3970: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e421cc  ! 3972: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_190:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde44000  ! 3974: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_191:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3975: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7e58000  ! 3977: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_192:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e4c000  ! 3982: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe50000  ! 3987: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde54000  ! 3988: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe5e024  ! 3989: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_306:
	setx	0x3f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_193:
	mov	0x18, %r14
	.word 0xf0db84a0  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e40000  ! 3994: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe4e1e8  ! 3995: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e4a1df  ! 3997: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde48000  ! 3998: SAVE_R	save	%r18, %r0, %r30
	.word 0xbde561be  ! 3999: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_195:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 4000: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 10)
	.word 0xba140000  ! 4003: OR_R	or 	%r16, %r0, %r29
	.word 0xb7e44000  ! 4007: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_307:
	setx	0x3f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 4011: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_194:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_196:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 4016: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_308:
	setx	0x3c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3518000  ! 4031: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_wr_197:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 4032: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_309:
	setx	0x3f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_310:
	setx	0x3d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 31)
	.word 0xb5e5601b  ! 4044: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_311:
	setx	0x3f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_198:
	mov	0xe, %r14
	.word 0xf8f38400  ! 4050: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_312:
	setx	0x3f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 4053: SAVE_R	save	%r22, %r0, %r24
	.word 0xbfe4c000  ! 4055: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_313:
	setx	0x3f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a032  ! 4070: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_199:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 4072: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_200:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 4074: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_314:
	setx	0x3f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e461f3  ! 4080: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbabca088  ! 4082: XNORcc_I	xnorcc 	%r18, 0x0088, %r29
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_201:
	mov	0x32, %r14
	.word 0xf8f389e0  ! 4093: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 3f)
	.word 0xba9560fd  ! 4096: ORcc_I	orcc 	%r21, 0x00fd, %r29
cpu_intr_0_315:
	setx	0x43002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_316:
	setx	0x410007, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_195:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb1e5e0a5  ! 4102: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde4e035  ! 4103: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e54000  ! 4104: SAVE_R	save	%r21, %r0, %r24
	.word 0xb5e5a138  ! 4105: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_196:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_317:
	setx	0x410327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0e2  ! 4111: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e52086  ! 4114: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_318:
	setx	0x410024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521d6  ! 4117: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_197:
	mov	0x1, %r14
	.word 0xfcdb8e60  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_319:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_202:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 4122: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e561c8  ! 4126: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e5c000  ! 4136: SAVE_R	save	%r23, %r0, %r25
	.word 0xbfe50000  ! 4139: SAVE_R	save	%r20, %r0, %r31
	.word 0xb7e4c000  ! 4144: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, d)
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_198:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_203:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 4154: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_320:
	setx	0x430112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_321:
	setx	0x400312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5603a  ! 4157: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe48000  ! 4159: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_322:
	setx	0x430305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 11)
	.word 0xb3340000  ! 4165: SRL_R	srl 	%r16, %r0, %r25
cpu_intr_0_323:
	setx	0x420205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520cd  ! 4173: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb1350000  ! 4177: SRL_R	srl 	%r20, %r0, %r24
	.word 0xb9e48000  ! 4178: SAVE_R	save	%r18, %r0, %r28
	.word 0xbde50000  ! 4179: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_324:
	setx	0x400205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_204:
	mov	0x4, %r14
	.word 0xfcf384a0  ! 4182: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_325:
	setx	0x42001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_199:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 4190: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_205:
	mov	0x9, %r14
	.word 0xfcf384a0  ! 4191: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_206:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4192: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_326:
	setx	0x41032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 4197: SAVE_R	save	%r20, %r0, %r24
	.word 0xb1e48000  ! 4200: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e5a1c3  ! 4204: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_327:
	setx	0x420316, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_207:
	mov	0x8, %r14
	.word 0xf6f38e40  ! 4216: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_328:
	setx	0x400008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_329:
	setx	0x420324, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_200:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb2844000  ! 4229: ADDcc_R	addcc 	%r17, %r0, %r25
	.word 0xb9e4218e  ! 4230: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e4e172  ! 4234: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_330:
	setx	0x42032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 4240: SAVE_R	save	%r21, %r0, %r24
	.word 0x8195a0dc  ! 4241: WRPR_TPC_I	wrpr	%r22, 0x00dc, %tpc
	.word 0xbfe58000  ! 4242: SAVE_R	save	%r22, %r0, %r31
	.word 0xbbe44000  ! 4245: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_201:
	mov	0x12, %r14
	.word 0xf4db8e40  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5e48000  ! 4251: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbb34d000  ! 4262: SRLX_R	srlx	%r19, %r0, %r29
cpu_intr_0_331:
	setx	0x43013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_208:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 4265: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_202:
	mov	0xe, %r14
	.word 0xf6db8400  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_203:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb62d61ea  ! 4270: ANDN_I	andn 	%r21, 0x01ea, %r27
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e420c1  ! 4272: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e48000  ! 4281: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_204:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_332:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e11e  ! 4293: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_209:
	mov	0x8, %r14
	.word 0xfef38400  ! 4295: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_333:
	setx	0x400027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_334:
	setx	0x42003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde560eb  ! 4298: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde4211a  ! 4299: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e44000  ! 4300: SAVE_R	save	%r17, %r0, %r25
	.word 0xb0b54000  ! 4303: SUBCcc_R	orncc 	%r21, %r0, %r24
	.word 0xbbe48000  ! 4304: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe5a0ef  ! 4305: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e5a015  ! 4307: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_210:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 4309: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1e520fa  ! 4314: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_211:
	mov	0x4, %r14
	.word 0xf4f38e60  ! 4322: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_335:
	setx	0x400202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e50000  ! 4331: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_336:
	setx	0x400134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_212:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4334: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5e58000  ! 4336: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_337:
	setx	0x430201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 4353: SAVE_R	save	%r18, %r0, %r28
	.word 0xbde561ee  ! 4356: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_205:
	mov	0x12, %r14
	.word 0xf6db89e0  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e44000  ! 4359: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_338:
	setx	0x41001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x410324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9e5e16a  ! 4363: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb2bca046  ! 4371: XNORcc_I	xnorcc 	%r18, 0x0046, %r25
cpu_intr_0_340:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e420f8  ! 4374: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_206:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 4376: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbc9c8000  ! 4377: XORcc_R	xorcc 	%r18, %r0, %r30
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e50000  ! 4382: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e40000  ! 4386: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_341:
	setx	0x43030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4389: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_342:
	setx	0x430228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_343:
	setx	0x43020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_207:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb6b54000  ! 4396: SUBCcc_R	orncc 	%r21, %r0, %r27
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_344:
	setx	0x420012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_345:
	setx	0x420124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e4a095  ! 4404: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_213:
	mov	0x2a, %r14
	.word 0xfcf38e60  ! 4406: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5e461f1  ! 4409: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_346:
	setx	0x430109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_208:
	mov	0x7, %r14
	.word 0xfadb89e0  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_347:
	setx	0x400032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a172  ! 4420: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_209:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_214:
	mov	0x2b, %r14
	.word 0xf2f38e60  ! 4433: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_348:
	setx	0x43031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a05e  ! 4438: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e5c000  ! 4443: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_349:
	setx	0x420031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb025c000  ! 4448: SUB_R	sub 	%r23, %r0, %r24
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_215:
	mov	0x1c, %r14
	.word 0xfcf384a0  ! 4450: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_216:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 4451: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e4e174  ! 4452: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_217:
	mov	0x12, %r14
	.word 0xf6f384a0  ! 4453: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbe3ce15a  ! 4454: XNOR_I	xnor 	%r19, 0x015a, %r31
	.word 0xbde50000  ! 4455: SAVE_R	save	%r20, %r0, %r30
	.word 0xbead4000  ! 4456: ANDNcc_R	andncc 	%r21, %r0, %r31
	.word 0xb294c000  ! 4458: ORcc_R	orcc 	%r19, %r0, %r25
cpu_intr_0_350:
	setx	0x410135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_218:
	mov	0x18, %r14
	.word 0xfcf384a0  ! 4460: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_351:
	setx	0x420139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_219:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4474: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e50000  ! 4478: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5643801  ! 4484: MOVcc_I	<illegal instruction>
	.word 0xb7e54000  ! 4487: SAVE_R	save	%r21, %r0, %r27
	.word 0xbbe40000  ! 4491: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_352:
	setx	0x40011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 4496: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_220:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 4497: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e5a09f  ! 4501: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_353:
	setx	0x42020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 2)
	.word 0x85942018  ! 4506: WRPR_TSTATE_I	wrpr	%r16, 0x0018, %tstate
	.word 0xbfe5a117  ! 4508: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe40000  ! 4511: SAVE_R	save	%r16, %r0, %r29
	.word 0xb550c000  ! 4518: RDPR_TT	<illegal instruction>
	.word 0xb7e50000  ! 4520: SAVE_R	save	%r20, %r0, %r27
	.word 0xbbe44000  ! 4523: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe460f2  ! 4526: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e5c000  ! 4529: SAVE_R	save	%r23, %r0, %r28
	.word 0xb1e5a1fd  ! 4535: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_210:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 4537: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbf520000  ! 4539: RDPR_PIL	<illegal instruction>
T0_asi_reg_rd_211:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4541: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_212:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1e4e01e  ! 4546: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_354:
	setx	0x420331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a083  ! 4548: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_221:
	mov	0x2b, %r14
	.word 0xf4f38e80  ! 4549: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb035e17f  ! 4551: ORN_I	orn 	%r23, 0x017f, %r24
T0_asi_reg_wr_222:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 4554: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_355:
	setx	0x450213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5c000  ! 4563: ADDCcc_R	addccc 	%r23, %r0, %r27
	.word 0xbd2c3001  ! 4564: SLLX_I	sllx	%r16, 0x0001, %r30
cpu_intr_0_356:
	setx	0x460016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_357:
	setx	0x45012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_358:
	setx	0x47010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56125  ! 4572: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbe1d600a  ! 4574: XOR_I	xor 	%r21, 0x000a, %r31
	.word 0xb2b40000  ! 4575: SUBCcc_R	orncc 	%r16, %r0, %r25
T0_asi_reg_wr_223:
	mov	0x36, %r14
	.word 0xfaf389e0  ! 4579: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e48000  ! 4582: SAVE_R	save	%r18, %r0, %r26
	.word 0xb9e52126  ! 4583: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb235e1a2  ! 4584: ORN_I	orn 	%r23, 0x01a2, %r25
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e5c000  ! 4587: SAVE_R	save	%r23, %r0, %r27
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
	.word 0xbfe460af  ! 4596: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb8b4c000  ! 4597: ORNcc_R	orncc 	%r19, %r0, %r28
	.word 0xb9e54000  ! 4598: SAVE_R	save	%r21, %r0, %r28
	.word 0xb134c000  ! 4601: SRL_R	srl 	%r19, %r0, %r24
	.word 0xb6848000  ! 4602: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xb5e5c000  ! 4604: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde4e13c  ! 4605: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4c000  ! 4609: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 7)
	.word 0xb4856091  ! 4616: ADDcc_I	addcc 	%r21, 0x0091, %r26
	.word 0xb9e58000  ! 4619: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 1)
	.word 0xbbe4a1ee  ! 4632: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_213:
	mov	0x1f, %r14
	.word 0xf6db89e0  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_214:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9e54000  ! 4636: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_224:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 4641: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_rd_215:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 29)
	.word 0xba9dc000  ! 4646: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xb3e40000  ! 4649: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_359:
	setx	0x450001, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc0ce0f4  ! 4655: AND_I	and 	%r19, 0x00f4, %r30
	.word 0xb9e50000  ! 4656: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e40000  ! 4657: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e5e12e  ! 4660: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde4a12d  ! 4661: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_360:
	setx	0x460222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5604c  ! 4664: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_216:
	mov	0x2e, %r14
	.word 0xf4db84a0  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_217:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 4672: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e4a007  ! 4675: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_225:
	mov	0x1, %r14
	.word 0xfaf389e0  ! 4678: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_361:
	setx	0x44012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_218:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 4680: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_219:
	mov	0x19, %r14
	.word 0xf2db89e0  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde4c000  ! 4682: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e5a11d  ! 4689: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_220:
	mov	0x2f, %r14
	.word 0xfedb8e80  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e5a1b2  ! 4695: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e4612a  ! 4696: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5e0c2  ! 4699: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e4a185  ! 4703: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5641800  ! 4705: MOVcc_R	<illegal instruction>
	.word 0xb1e4e01d  ! 4707: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e42006  ! 4711: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbc24e055  ! 4716: SUB_I	sub 	%r19, 0x0055, %r30
T0_asi_reg_wr_226:
	mov	0x27, %r14
	.word 0xf0f384a0  ! 4720: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb40d6113  ! 4722: AND_I	and 	%r21, 0x0113, %r26
T0_asi_reg_rd_221:
	mov	0x1c, %r14
	.word 0xfadb8e60  ! 4723: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, b)
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_362:
	setx	0x46020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 4728: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_227:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 4729: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_228:
	mov	0x37, %r14
	.word 0xfaf38e80  ! 4730: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 36)
	.word 0xb23ce146  ! 4732: XNOR_I	xnor 	%r19, 0x0146, %r25
	.word 0xbfe5612f  ! 4733: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e4a149  ! 4736: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e58000  ! 4737: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_222:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4738: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_229:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 4739: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbde50000  ! 4740: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e4e020  ! 4742: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde560d9  ! 4743: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4e057  ! 4744: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e50000  ! 4749: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e4e1ea  ! 4750: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_363:
	setx	0x460228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_230:
	mov	0xa, %r14
	.word 0xf2f38e60  ! 4753: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e420d8  ! 4759: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e5c000  ! 4769: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde54000  ! 4772: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_364:
	setx	0x47023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01cc000  ! 4780: XOR_R	xor 	%r19, %r0, %r24
	.word 0xbbe5c000  ! 4782: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_365:
	setx	0x470328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_231:
	mov	0x11, %r14
	.word 0xf4f389e0  ! 4790: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_366:
	setx	0x44020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa50000  ! 4793: SUBcc_R	subcc 	%r20, %r0, %r29
	.word 0xbfe4c000  ! 4795: SAVE_R	save	%r19, %r0, %r31
	.word 0xb1e5a0d0  ! 4797: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbc2c21a5  ! 4798: ANDN_I	andn 	%r16, 0x01a5, %r30
cpu_intr_0_367:
	setx	0x460100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4800: SAVE_R	save	%r16, %r0, %r25
	.word 0xb1e420b8  ! 4801: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb7e58000  ! 4804: SAVE_R	save	%r22, %r0, %r27
	.word 0xbfe4c000  ! 4809: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe520a7  ! 4810: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_368:
	setx	0x440033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb7e4c000  ! 4813: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe5e08e  ! 4817: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_232:
	mov	0x1a, %r14
	.word 0xfef389e0  ! 4818: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb1e5e0fc  ! 4821: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e44000  ! 4822: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb3500000  ! 4828: RDPR_TPC	<illegal instruction>
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_369:
	setx	0x470100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49cc000  ! 4834: XORcc_R	xorcc 	%r19, %r0, %r26
cpu_intr_0_370:
	setx	0x470211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4841: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9e50000  ! 4845: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9e52180  ! 4846: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde560e0  ! 4847: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_371:
	setx	0x460226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 39)
	.word 0xbfe4e1f1  ! 4850: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_223:
	mov	0x28, %r14
	.word 0xfedb8e80  ! 4854: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_372:
	setx	0x47021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_373:
	setx	0x440130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8054000  ! 4859: ADD_R	add 	%r21, %r0, %r28
T0_asi_reg_rd_224:
	mov	0xc, %r14
	.word 0xf2db8400  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbde42193  ! 4863: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_374:
	setx	0x45033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 4867: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbe252106  ! 4870: SUB_I	sub 	%r20, 0x0106, %r31
T0_asi_reg_rd_225:
	mov	0x32, %r14
	.word 0xf2db8e40  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_375:
	setx	0x440338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 4879: SAVE_R	save	%r21, %r0, %r31
	.word 0xb9e54000  ! 4881: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_406:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_406), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_233:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 4895: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_407:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_407), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_376:
	setx	0x460239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_377:
	setx	0x46000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_234:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4902: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_235:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 4903: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e58000  ! 4908: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_236:
	mov	0x2e, %r14
	.word 0xf8f38400  ! 4911: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_378:
	setx	0x47003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_408:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_408), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_409:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_409), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_379:
	setx	0x460123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 4920: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde50000  ! 4922: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e420e1  ! 4924: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_237:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 4925: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_410:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_410), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_238:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 4934: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_rd_226:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbbe521dc  ! 4939: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4e122  ! 4941: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e46029  ! 4943: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbb510000  ! 4944: RDPR_TICK	<illegal instruction>
	.word 0xb01d0000  ! 4945: XOR_R	xor 	%r20, %r0, %r24
cpu_intr_0_380:
	setx	0x440323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e060  ! 4947: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_227:
	mov	0x6, %r14
	.word 0xf4db89e0  ! 4948: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_411:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_411), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_381:
	setx	0x470212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 4951: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_412:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_412), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e461e4  ! 4956: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_413:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_413), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e4202c  ! 4959: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e4e059  ! 4962: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e48000  ! 4964: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_239:
	mov	0x6, %r14
	.word 0xf4f38e80  ! 4968: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7e4a109  ! 4969: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_382:
	setx	0x440313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_383:
	setx	0x45003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_384:
	setx	0x470332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57c4400  ! 4979: MOVR_R	movre	%r17, %r0, %r26
	.word 0xb21c4000  ! 4980: XOR_R	xor 	%r17, %r0, %r25
cpu_intr_0_385:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_414:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_414), 16, 16)) -> intp(0, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e50000  ! 4985: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde40000  ! 4986: SAVE_R	save	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_240:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 4993: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbde561ea  ! 4994: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5216c  ! 4997: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_386:
	setx	0x460206, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xfe25602e  ! 2: STW_I	stw	%r31, [%r21 + 0x002e]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_0:
	setx	0x190008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1357001  ! 9: SRLX_I	srlx	%r21, 0x0001, %r24
	.word 0xf2ad0020  ! 10: STBA_R	stba	%r25, [%r20 + %r0] 0x01
T3_asi_reg_wr_0:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 13: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_0:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_1:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 18: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_2:
	mov	0x10, %r14
	.word 0xf2f38e80  ! 27: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_1:
	setx	0x1c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b48020  ! 31: STHA_R	stha	%r27, [%r18 + %r0] 0x01
T3_asi_reg_wr_3:
	mov	0x31, %r14
	.word 0xfef38e40  ! 36: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_2:
	setx	0x1e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674a126  ! 40: STX_I	stx	%r27, [%r18 + 0x0126]
	.word 0xfc2dc000  ! 41: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfab54020  ! 42: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xf6744000  ! 43: STX_R	stx	%r27, [%r17 + %r0]
T3_asi_reg_wr_4:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 47: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf42d4000  ! 50: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xbe0da07e  ! 54: AND_I	and 	%r22, 0x007e, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_3:
	setx	0x1d0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b1a  ! 59: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1a, %hpstate
cpu_intr_3_4:
	setx	0x1d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2dc000  ! 65: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf6b460a9  ! 66: STHA_I	stha	%r27, [%r17 + 0x00a9] %asi
cpu_intr_3_5:
	setx	0x1d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_5:
	mov	0x2f, %r14
	.word 0xfef384a0  ! 69: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_1:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf42d8000  ! 75: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfaa54020  ! 77: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xbe9c0000  ! 82: XORcc_R	xorcc 	%r16, %r0, %r31
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 28)
	.word 0xfa2cc000  ! 89: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_2:
	mov	0xf, %r14
	.word 0xf8db89e0  ! 91: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfcf4a055  ! 93: STXA_I	stxa	%r30, [%r18 + 0x0055] %asi
	.word 0xfa2421e6  ! 94: STW_I	stw	%r29, [%r16 + 0x01e6]
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_3:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf825c000  ! 98: STW_R	stw	%r28, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_4:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_6:
	setx	0x1e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xbcade1e1  ! 105: ANDNcc_I	andncc 	%r23, 0x01e1, %r30
T3_asi_reg_wr_6:
	mov	0xe, %r14
	.word 0xf0f38e80  ! 106: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_7:
	setx	0x1d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6aca095  ! 110: STBA_I	stba	%r27, [%r18 + 0x0095] %asi
	.word 0xfc74e092  ! 111: STX_I	stx	%r30, [%r19 + 0x0092]
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 38)
	.word 0xf874a1da  ! 115: STX_I	stx	%r28, [%r18 + 0x01da]
T3_asi_reg_wr_7:
	mov	0x11, %r14
	.word 0xf2f38400  ! 119: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb17dc400  ! 120: MOVR_R	movre	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_5:
	mov	0x1f, %r14
	.word 0xfcdb8400  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfca50020  ! 124: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xf03560b8  ! 125: STH_I	sth	%r24, [%r21 + 0x00b8]
	.word 0xb1347001  ! 128: SRLX_I	srlx	%r17, 0x0001, %r24
cpu_intr_3_8:
	setx	0x1f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 132: STW_R	stw	%r28, [%r20 + %r0]
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_8:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 137: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfca40020  ! 141: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_6:
	mov	0xa, %r14
	.word 0xf4db8e60  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf2b5a0a5  ! 144: STHA_I	stha	%r25, [%r22 + 0x00a5] %asi
	.word 0xf2746027  ! 146: STX_I	stx	%r25, [%r17 + 0x0027]
	.word 0xb234e1b4  ! 147: SUBC_I	orn 	%r19, 0x01b4, %r25
	.word 0xf4f560a4  ! 148: STXA_I	stxa	%r26, [%r21 + 0x00a4] %asi
cpu_intr_3_9:
	setx	0x1c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe752188  ! 155: STX_I	stx	%r31, [%r20 + 0x0188]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf03421db  ! 157: STH_I	sth	%r24, [%r16 + 0x01db]
	.word 0xb4950000  ! 158: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xf0f560c6  ! 159: STXA_I	stxa	%r24, [%r21 + 0x00c6] %asi
cpu_intr_3_10:
	setx	0x1e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_11:
	setx	0x1e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf52016  ! 170: STXA_I	stxa	%r30, [%r20 + 0x0016] %asi
	.word 0xfcb58020  ! 171: STHA_R	stha	%r30, [%r22 + %r0] 0x01
cpu_intr_3_12:
	setx	0x1c0135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_13:
	setx	0x1e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, a)
	.word 0xf2a50020  ! 175: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xfa24609d  ! 180: STW_I	stw	%r29, [%r17 + 0x009d]
T3_asi_reg_wr_9:
	mov	0x31, %r14
	.word 0xfef38e40  ! 181: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfca5a133  ! 183: STWA_I	stwa	%r30, [%r22 + 0x0133] %asi
	.word 0xfead0020  ! 187: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf275c000  ! 191: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf8a48020  ! 192: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xfa75c000  ! 194: STX_R	stx	%r29, [%r23 + %r0]
cpu_intr_3_14:
	setx	0x1f0120, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_7:
	mov	0x31, %r14
	.word 0xf4db84a0  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_15:
	setx	0x1f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_16:
	setx	0x1f0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494617f  ! 208: ORcc_I	orcc 	%r17, 0x017f, %r26
T3_asi_reg_wr_10:
	mov	0x5, %r14
	.word 0xf6f38e60  ! 209: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
cpu_intr_3_17:
	setx	0x1e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4a076  ! 219: STHA_I	stha	%r30, [%r18 + 0x0076] %asi
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_18:
	setx	0x1d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_11:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 225: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 227: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_20:
	setx	0x1d0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6744000  ! 233: STX_R	stx	%r27, [%r17 + %r0]
cpu_intr_3_21:
	setx	0x1f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_22:
	setx	0x1c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 236: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb634c000  ! 237: ORN_R	orn 	%r19, %r0, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf0f5e020  ! 240: STXA_I	stxa	%r24, [%r23 + 0x0020] %asi
	.word 0xf47521a8  ! 241: STX_I	stx	%r26, [%r20 + 0x01a8]
cpu_intr_3_23:
	setx	0x1d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c5c000  ! 245: ADDCcc_R	addccc 	%r23, %r0, %r24
cpu_intr_3_24:
	setx	0x1d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_13:
	mov	0x25, %r14
	.word 0xfaf38e80  ! 250: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf8b44020  ! 253: STHA_R	stha	%r28, [%r17 + %r0] 0x01
cpu_intr_3_25:
	setx	0x1d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_14:
	mov	0x9, %r14
	.word 0xfcf389e0  ! 259: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_8:
	mov	0x20, %r14
	.word 0xf4db8400  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 32)
	.word 0xb73c6001  ! 262: SRA_I	sra 	%r17, 0x0001, %r27
T3_asi_reg_wr_15:
	mov	0x2f, %r14
	.word 0xf6f384a0  ! 266: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf0b5a10d  ! 268: STHA_I	stha	%r24, [%r22 + 0x010d] %asi
T3_asi_reg_rd_9:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 274: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf4256096  ! 275: STW_I	stw	%r26, [%r21 + 0x0096]
T3_asi_reg_rd_10:
	mov	0x15, %r14
	.word 0xf6db8400  ! 278: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_16:
	mov	0x16, %r14
	.word 0xf2f38400  ! 283: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_26:
	setx	0x1f0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_27:
	setx	0x1e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 33)
	.word 0xfef56098  ! 289: STXA_I	stxa	%r31, [%r21 + 0x0098] %asi
	.word 0xba952081  ! 291: ORcc_I	orcc 	%r20, 0x0081, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf624c000  ! 296: STW_R	stw	%r27, [%r19 + %r0]
cpu_intr_3_28:
	setx	0x1d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_17:
	mov	0x16, %r14
	.word 0xfaf389e0  ! 299: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfa35216e  ! 301: STH_I	sth	%r29, [%r20 + 0x016e]
cpu_intr_3_29:
	setx	0x1c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a48020  ! 306: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xba15c000  ! 307: OR_R	or 	%r23, %r0, %r29
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_11:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 313: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb6ad4000  ! 314: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xb2ac8000  ! 315: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xb335e001  ! 316: SRL_I	srl 	%r23, 0x0001, %r25
	.word 0xf4b5e10e  ! 317: STHA_I	stha	%r26, [%r23 + 0x010e] %asi
cpu_intr_3_30:
	setx	0x1d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe854000  ! 323: ADDcc_R	addcc 	%r21, %r0, %r31
	.word 0xf6754000  ! 326: STX_R	stx	%r27, [%r21 + %r0]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_31:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf02c20ab  ! 333: STB_I	stb	%r24, [%r16 + 0x00ab]
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa754000  ! 335: STX_R	stx	%r29, [%r21 + %r0]
cpu_intr_3_32:
	setx	0x1e0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf0b4215b  ! 341: STHA_I	stha	%r24, [%r16 + 0x015b] %asi
	.word 0xf22dc000  ! 342: STB_R	stb	%r25, [%r23 + %r0]
T3_asi_reg_rd_12:
	mov	0x0, %r14
	.word 0xf4db89e0  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfe24601f  ! 350: STW_I	stw	%r31, [%r17 + 0x001f]
cpu_intr_3_33:
	setx	0x1e0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 25)
	.word 0xf0752102  ! 354: STX_I	stx	%r24, [%r20 + 0x0102]
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_34:
	setx	0x1c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_13:
	mov	0x23, %r14
	.word 0xf2db89e0  ! 363: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa48020  ! 366: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
cpu_intr_3_35:
	setx	0x1f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_36:
	setx	0x1c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_14:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2254000  ! 380: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xbf2cf001  ! 381: SLLX_I	sllx	%r19, 0x0001, %r31
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_HPRIV
	.word 0xb8048000  ! 386: ADD_R	add 	%r18, %r0, %r28
cpu_intr_3_37:
	setx	0x1d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819838d8  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d8, %hpstate
cpu_intr_3_38:
	setx	0x1d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb53df001  ! 397: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0xfaa5a055  ! 399: STWA_I	stwa	%r29, [%r22 + 0x0055] %asi
cpu_intr_3_39:
	setx	0x1f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe252091  ! 401: STW_I	stw	%r31, [%r20 + 0x0091]
	.word 0xf8358000  ! 402: STH_R	sth	%r28, [%r22 + %r0]
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 37)
	.word 0xbe2c8000  ! 408: ANDN_R	andn 	%r18, %r0, %r31
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 34)
	.word 0xf0b5a079  ! 413: STHA_I	stha	%r24, [%r22 + 0x0079] %asi
	.word 0xf6b4e03f  ! 414: STHA_I	stha	%r27, [%r19 + 0x003f] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf4b44020  ! 419: STHA_R	stha	%r26, [%r17 + %r0] 0x01
cpu_intr_3_40:
	setx	0x1e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 422: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc24e07e  ! 424: STW_I	stw	%r30, [%r19 + 0x007e]
	.word 0xfeb48020  ! 425: STHA_R	stha	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_19:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 428: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_15:
	mov	0xb, %r14
	.word 0xfedb8e60  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb4c4a034  ! 431: ADDCcc_I	addccc 	%r18, 0x0034, %r26
	.word 0xbb518000  ! 433: RDPR_PSTATE	rdpr	%pstate, %r29
cpu_intr_3_41:
	setx	0x1e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635217f  ! 439: STH_I	sth	%r27, [%r20 + 0x017f]
T3_asi_reg_rd_16:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_20:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 444: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfaf4e147  ! 445: STXA_I	stxa	%r29, [%r19 + 0x0147] %asi
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, f)
	.word 0xfa75c000  ! 448: STX_R	stx	%r29, [%r23 + %r0]
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a4a  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
	.word 0xf034200d  ! 454: STH_I	sth	%r24, [%r16 + 0x000d]
cpu_intr_3_42:
	setx	0x1d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4340000  ! 457: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xbc15200a  ! 458: OR_I	or 	%r20, 0x000a, %r30
cpu_intr_3_43:
	setx	0x1c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a46036  ! 460: STWA_I	stwa	%r27, [%r17 + 0x0036] %asi
	.word 0xbe354000  ! 461: ORN_R	orn 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_44:
	setx	0x1f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a54020  ! 465: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 5)
	.word 0xfcb5e06e  ! 470: STHA_I	stha	%r30, [%r23 + 0x006e] %asi
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 9)
	.word 0xb1508000  ! 472: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf8a4c020  ! 474: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xf07461a2  ! 477: STX_I	stx	%r24, [%r17 + 0x01a2]
	.word 0xf2758000  ! 479: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf67460ba  ! 480: STX_I	stx	%r27, [%r17 + 0x00ba]
T3_asi_reg_wr_21:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 482: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_22:
	mov	0x27, %r14
	.word 0xf6f38e40  ! 484: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8ad0020  ! 486: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982dc2  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc2, %hpstate
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b44020  ! 499: STHA_R	stha	%r28, [%r17 + %r0] 0x01
cpu_intr_3_45:
	setx	0x23002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0754000  ! 502: STX_R	stx	%r24, [%r21 + %r0]
cpu_intr_3_46:
	setx	0x230335, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_17:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa258000  ! 505: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xfe2c0000  ! 508: STB_R	stb	%r31, [%r16 + %r0]
cpu_intr_3_47:
	setx	0x22032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead615c  ! 514: STBA_I	stba	%r31, [%r21 + 0x015c] %asi
T3_asi_reg_rd_18:
	mov	0x1b, %r14
	.word 0xf8db8e60  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf4f4206f  ! 519: STXA_I	stxa	%r26, [%r16 + 0x006f] %asi
cpu_intr_3_48:
	setx	0x22031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a18  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a18, %hpstate
	.word 0xfc2560e2  ! 523: STW_I	stw	%r30, [%r21 + 0x00e2]
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_49:
	setx	0x220031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_50:
	setx	0x20001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfc2460ab  ! 536: STW_I	stw	%r30, [%r17 + 0x00ab]
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 23)
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f50  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f50, %hpstate
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfea50020  ! 550: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_23:
	mov	0x1f, %r14
	.word 0xf6f38e80  ! 552: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_wr_24:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 553: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6adc020  ! 561: STBA_R	stba	%r27, [%r23 + %r0] 0x01
T3_asi_reg_rd_19:
	mov	0x33, %r14
	.word 0xfcdb8e40  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf42d60fc  ! 568: STB_I	stb	%r26, [%r21 + 0x00fc]
	.word 0xfaa4e090  ! 570: STWA_I	stwa	%r29, [%r19 + 0x0090] %asi
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 33)
	.word 0xb28c4000  ! 573: ANDcc_R	andcc 	%r17, %r0, %r25
	.word 0xb4350000  ! 574: ORN_R	orn 	%r20, %r0, %r26
T3_asi_reg_rd_20:
	mov	0x36, %r14
	.word 0xfcdb8400  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2ad6041  ! 578: STBA_I	stba	%r25, [%r21 + 0x0041] %asi
	.word 0xfaac4020  ! 579: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xfaf4608e  ! 580: STXA_I	stxa	%r29, [%r17 + 0x008e] %asi
T3_asi_reg_wr_25:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 584: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf0ade154  ! 585: STBA_I	stba	%r24, [%r23 + 0x0154] %asi
T3_asi_reg_rd_21:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_26:
	mov	0x3, %r14
	.word 0xf4f38400  ! 591: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfaac0020  ! 592: STBA_R	stba	%r29, [%r16 + %r0] 0x01
T3_asi_reg_wr_27:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 593: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_28:
	mov	0xd, %r14
	.word 0xfef38e80  ! 596: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf6754000  ! 597: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf0ada020  ! 600: STBA_I	stba	%r24, [%r22 + 0x0020] %asi
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 20)
	.word 0xf2252072  ! 603: STW_I	stw	%r25, [%r20 + 0x0072]
cpu_intr_3_51:
	setx	0x220002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_52:
	setx	0x23023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfe74215a  ! 609: STX_I	stx	%r31, [%r16 + 0x015a]
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 20)
	.word 0xba2ca17d  ! 613: ANDN_I	andn 	%r18, 0x017d, %r29
cpu_intr_3_53:
	setx	0x20011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74e163  ! 616: STX_I	stx	%r30, [%r19 + 0x0163]
	.word 0xfe2d0000  ! 617: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfeade0fc  ! 621: STBA_I	stba	%r31, [%r23 + 0x00fc] %asi
	.word 0xfa74a059  ! 622: STX_I	stx	%r29, [%r18 + 0x0059]
	.word 0xf4ad8020  ! 624: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf4352057  ! 626: STH_I	sth	%r26, [%r20 + 0x0057]
T3_asi_reg_rd_22:
	mov	0x26, %r14
	.word 0xfedb89e0  ! 631: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfcac20dc  ! 633: STBA_I	stba	%r30, [%r16 + 0x00dc] %asi
	.word 0xf275c000  ! 635: STX_R	stx	%r25, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d0a  ! 638: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0a, %hpstate
	.word 0xf07421b5  ! 641: STX_I	stx	%r24, [%r16 + 0x01b5]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_29:
	mov	0x2a, %r14
	.word 0xf4f38e40  ! 645: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb23c8000  ! 646: XNOR_R	xnor 	%r18, %r0, %r25
T3_asi_reg_rd_23:
	mov	0x12, %r14
	.word 0xf2db8400  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf274e163  ! 652: STX_I	stx	%r25, [%r19 + 0x0163]
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6740000  ! 655: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf834e1a3  ! 656: STH_I	sth	%r28, [%r19 + 0x01a3]
T3_asi_reg_rd_24:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 657: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf2b420d6  ! 658: STHA_I	stha	%r25, [%r16 + 0x00d6] %asi
T3_asi_reg_wr_30:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 659: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfc350000  ! 660: STH_R	sth	%r30, [%r20 + %r0]
T3_asi_reg_rd_25:
	mov	0x22, %r14
	.word 0xfedb8e80  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_54:
	setx	0x200119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22cc000  ! 664: STB_R	stb	%r25, [%r19 + %r0]
T3_asi_reg_rd_26:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_55:
	setx	0x230016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_56:
	setx	0x230304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_57:
	setx	0x220119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_27:
	mov	0x10, %r14
	.word 0xf8db84a0  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_NONHPRIV
	.word 0xf024a0e4  ! 678: STW_I	stw	%r24, [%r18 + 0x00e4]
	.word 0xbcc4a12d  ! 679: ADDCcc_I	addccc 	%r18, 0x012d, %r30
T3_asi_reg_wr_31:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 680: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3520000  ! 681: RDPR_PIL	rdpr	%pil, %r25
T3_asi_reg_wr_32:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 683: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_33:
	mov	0x16, %r14
	.word 0xf6f38e80  ! 685: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf82c4000  ! 688: STB_R	stb	%r28, [%r17 + %r0]
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_58:
	setx	0x230202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 694: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf8b42067  ! 695: STHA_I	stha	%r28, [%r16 + 0x0067] %asi
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 9)
	.word 0xf2ad6140  ! 702: STBA_I	stba	%r25, [%r21 + 0x0140] %asi
cpu_intr_3_59:
	setx	0x23033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e1dc  ! 704: WRPR_PIL_I	wrpr	%r19, 0x01dc, %pil
T3_asi_reg_wr_34:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 705: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfe74a131  ! 708: STX_I	stx	%r31, [%r18 + 0x0131]
cpu_intr_3_60:
	setx	0x230322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc340000  ! 711: STH_R	sth	%r30, [%r16 + %r0]
cpu_intr_3_61:
	setx	0x220332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_35:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 715: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf8f5a09e  ! 716: STXA_I	stxa	%r28, [%r22 + 0x009e] %asi
cpu_intr_3_62:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_28:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_rd_29:
	mov	0x17, %r14
	.word 0xfedb8e60  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf835c000  ! 729: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf02561a4  ! 730: STW_I	stw	%r24, [%r21 + 0x01a4]
	.word 0xfe34c000  ! 731: STH_R	sth	%r31, [%r19 + %r0]
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_63:
	setx	0x22021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982998  ! 738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
	.word 0xb52c4000  ! 740: SLL_R	sll 	%r17, %r0, %r26
	.word 0xb7508000  ! 741: RDPR_TSTATE	rdpr	%tstate, %r27
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 32)
	.word 0xf6b5a126  ! 750: STHA_I	stha	%r27, [%r22 + 0x0126] %asi
cpu_intr_3_64:
	setx	0x210307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952160  ! 753: WRPR_TT_I	wrpr	%r20, 0x0160, %tt
	.word 0xbc140000  ! 756: OR_R	or 	%r16, %r0, %r30
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 1)
	.word 0xfab42053  ! 759: STHA_I	stha	%r29, [%r16 + 0x0053] %asi
	.word 0xbeb4c000  ! 761: SUBCcc_R	orncc 	%r19, %r0, %r31
	.word 0xfa742106  ! 762: STX_I	stx	%r29, [%r16 + 0x0106]
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 27)
	.word 0xfe25c000  ! 764: STW_R	stw	%r31, [%r23 + %r0]
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 17)
	.word 0xfcad0020  ! 768: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	.word 0xfc2dc000  ! 769: STB_R	stb	%r30, [%r23 + %r0]
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 23)
	.word 0xfcadc020  ! 773: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf6ac0020  ! 775: STBA_R	stba	%r27, [%r16 + %r0] 0x01
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_30:
	mov	0x1e, %r14
	.word 0xfcdb8400  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbc05e068  ! 785: ADD_I	add 	%r23, 0x0068, %r30
	.word 0xf6244000  ! 786: STW_R	stw	%r27, [%r17 + %r0]
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_65:
	setx	0x200316, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_36:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 790: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 1d)
	.word 0x919561fa  ! 794: WRPR_PIL_I	wrpr	%r21, 0x01fa, %pil
	.word 0xf874a179  ! 796: STX_I	stx	%r28, [%r18 + 0x0179]
	.word 0xfa248000  ! 797: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf2350000  ! 798: STH_R	sth	%r25, [%r20 + %r0]
cpu_intr_3_66:
	setx	0x20020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_67:
	setx	0x21002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea48020  ! 803: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_37:
	mov	0x31, %r14
	.word 0xfcf384a0  ! 805: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983cc8  ! 806: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
	.word 0xf474c000  ! 807: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xba4561eb  ! 808: ADDC_I	addc 	%r21, 0x01eb, %r29
T3_asi_reg_rd_31:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_32:
	mov	0x38, %r14
	.word 0xf2db84a0  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b92  ! 817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
cpu_intr_3_68:
	setx	0x210323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8b40020  ! 831: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983810  ! 833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
	.word 0xfaa4a163  ! 835: STWA_I	stwa	%r29, [%r18 + 0x0163] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_69:
	setx	0x210304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 27)
	.word 0xf02c20aa  ! 840: STB_I	stb	%r24, [%r16 + 0x00aa]
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 25)
	.word 0xf0246155  ! 844: STW_I	stw	%r24, [%r17 + 0x0155]
cpu_intr_3_70:
	setx	0x21022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_71:
	setx	0x230138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_38:
	mov	0x13, %r14
	.word 0xfef38400  ! 857: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_72:
	setx	0x230229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5a109  ! 859: ADDCcc_I	addccc 	%r22, 0x0109, %r27
	.word 0xf674e038  ! 861: STX_I	stx	%r27, [%r19 + 0x0038]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf474c000  ! 870: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf82c6095  ! 872: STB_I	stb	%r28, [%r17 + 0x0095]
T3_asi_reg_rd_33:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_73:
	setx	0x20002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a5c020  ! 877: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_39:
	mov	0x2d, %r14
	.word 0xf4f389e0  ! 878: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b90  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b90, %hpstate
	.word 0xb17ca401  ! 881: MOVR_I	movre	%r18, 0x1, %r24
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 3)
	.word 0xf4ad20d5  ! 885: STBA_I	stba	%r26, [%r20 + 0x00d5] %asi
T3_asi_reg_rd_34:
	mov	0x28, %r14
	.word 0xfadb8e80  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfaad0020  ! 887: STBA_R	stba	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_35:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_74:
	setx	0x22030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d8a  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8a, %hpstate
T3_asi_reg_wr_40:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 897: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_41:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 901: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfe34c000  ! 903: STH_R	sth	%r31, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_75:
	setx	0x21023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2740000  ! 917: STX_R	stx	%r25, [%r16 + %r0]
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_36:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 921: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb52d7001  ! 924: SLLX_I	sllx	%r21, 0x0001, %r26
	.word 0xb4acc000  ! 926: ANDNcc_R	andncc 	%r19, %r0, %r26
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 931: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b4e1d1  ! 934: STHA_I	stha	%r28, [%r19 + 0x01d1] %asi
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 35)
	.word 0xf2b560a5  ! 936: STHA_I	stha	%r25, [%r21 + 0x00a5] %asi
	.word 0xf275c000  ! 940: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf6740000  ! 942: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfe254000  ! 943: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf02c8000  ! 944: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xfa2de0df  ! 946: STB_I	stb	%r29, [%r23 + 0x00df]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_76:
	setx	0x270131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a50020  ! 950: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xfca40020  ! 952: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xf6ad0020  ! 955: STBA_R	stba	%r27, [%r20 + %r0] 0x01
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 37)
	ta	T_CHANGE_TO_TL1
	.word 0xfa256159  ! 961: STW_I	stw	%r29, [%r21 + 0x0159]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_77:
	setx	0x27031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_78:
	setx	0x260230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d4000  ! 965: XORcc_R	xorcc 	%r21, %r0, %r30
cpu_intr_3_79:
	setx	0x250324, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_37:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4350000  ! 970: STH_R	sth	%r26, [%r20 + %r0]
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_80:
	setx	0x270315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_38:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 973: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 32)
	.word 0xfe350000  ! 977: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xfca58020  ! 978: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
	.word 0xfe344000  ! 979: STH_R	sth	%r31, [%r17 + %r0]
cpu_intr_3_81:
	setx	0x240217, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_43:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 981: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_44:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 982: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfef4218c  ! 983: STXA_I	stxa	%r31, [%r16 + 0x018c] %asi
T3_asi_reg_wr_45:
	mov	0x19, %r14
	.word 0xf0f38400  ! 984: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_39:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_82:
	setx	0x250022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac4020  ! 997: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xfead4020  ! 999: STBA_R	stba	%r31, [%r21 + %r0] 0x01
T3_asi_reg_rd_40:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 39)
	.word 0xb13c8000  ! 1002: SRA_R	sra 	%r18, %r0, %r24
T3_asi_reg_rd_41:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_83:
	setx	0x260114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 39)
	.word 0xf2f421cc  ! 1009: STXA_I	stxa	%r25, [%r16 + 0x01cc] %asi
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_84:
	setx	0x27012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 29)
	.word 0xf8b4c020  ! 1013: STHA_R	stha	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_42:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1021: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc2dc000  ! 1023: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf62ca0a2  ! 1024: STB_I	stb	%r27, [%r18 + 0x00a2]
	.word 0xfe74c000  ! 1028: STX_R	stx	%r31, [%r19 + %r0]
cpu_intr_3_85:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0x32, %r14
	.word 0xfcf38400  ! 1036: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb53dd000  ! 1039: SRAX_R	srax	%r23, %r0, %r26
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982818  ! 1040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0818, %hpstate
cpu_intr_3_86:
	setx	0x270017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x240336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_88:
	setx	0x25011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734b001  ! 1051: SRLX_I	srlx	%r18, 0x0001, %r27
	.word 0xfa35e17f  ! 1052: STH_I	sth	%r29, [%r23 + 0x017f]
	.word 0xfe75e041  ! 1059: STX_I	stx	%r31, [%r23 + 0x0041]
	.word 0xf4aca1d7  ! 1060: STBA_I	stba	%r26, [%r18 + 0x01d7] %asi
cpu_intr_3_89:
	setx	0x260009, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf2358000  ! 1066: STH_R	sth	%r25, [%r22 + %r0]
T3_asi_reg_wr_48:
	mov	0x2a, %r14
	.word 0xf8f38400  ! 1068: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f48  ! 1069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
cpu_intr_3_90:
	setx	0x26012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_49:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 1076: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf6a44020  ! 1078: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_91:
	setx	0x240238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb804c000  ! 1087: ADD_R	add 	%r19, %r0, %r28
	.word 0xb934a001  ! 1088: SRL_I	srl 	%r18, 0x0001, %r28
T3_asi_reg_wr_50:
	mov	0x28, %r14
	.word 0xf8f38e80  ! 1089: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 23)
	.word 0xf625e113  ! 1093: STW_I	stw	%r27, [%r23 + 0x0113]
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_51:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1096: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_92:
	setx	0x27030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_52:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 1099: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_93:
	setx	0x27021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_53:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 1101: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_43:
	mov	0x1a, %r14
	.word 0xf2db8400  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_94:
	setx	0x260319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4e0ad  ! 1106: STWA_I	stwa	%r25, [%r19 + 0x00ad] %asi
cpu_intr_3_95:
	setx	0x27021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_44:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0x8594a00a  ! 1119: WRPR_TSTATE_I	wrpr	%r18, 0x000a, %tstate
	.word 0xf6244000  ! 1120: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf6348000  ! 1122: STH_R	sth	%r27, [%r18 + %r0]
T3_asi_reg_rd_45:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 1123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcacc020  ! 1126: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0a4a172  ! 1132: STWA_I	stwa	%r24, [%r18 + 0x0172] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_96:
	setx	0x250128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_54:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 1140: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfe2dc000  ! 1142: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf6ac2184  ! 1144: STBA_I	stba	%r27, [%r16 + 0x0184] %asi
T3_asi_reg_wr_55:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 1146: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe74214d  ! 1148: STX_I	stx	%r31, [%r16 + 0x014d]
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 31)
	.word 0xb2958000  ! 1150: ORcc_R	orcc 	%r22, %r0, %r25
cpu_intr_3_97:
	setx	0x270312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_46:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_98:
	setx	0x27023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f5a1ad  ! 1156: STXA_I	stxa	%r24, [%r22 + 0x01ad] %asi
	.word 0xbe04a1d4  ! 1159: ADD_I	add 	%r18, 0x01d4, %r31
	.word 0xfe34c000  ! 1161: STH_R	sth	%r31, [%r19 + %r0]
T3_asi_reg_wr_56:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 1163: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_99:
	setx	0x270228, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_57:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1169: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_58:
	mov	0x24, %r14
	.word 0xfaf38e80  ! 1173: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_59:
	mov	0x23, %r14
	.word 0xf0f38e80  ! 1178: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_100:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4e171  ! 1180: STHA_I	stha	%r24, [%r19 + 0x0171] %asi
	.word 0xf0b5213e  ! 1181: STHA_I	stha	%r24, [%r20 + 0x013e] %asi
	.word 0xf2ac8020  ! 1183: STBA_R	stba	%r25, [%r18 + %r0] 0x01
T3_asi_reg_rd_47:
	mov	0x16, %r14
	.word 0xf4db8e80  ! 1187: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 16)
	.word 0xbf2dc000  ! 1189: SLL_R	sll 	%r23, %r0, %r31
cpu_intr_3_101:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d4000  ! 1194: STB_R	stb	%r28, [%r21 + %r0]
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_60:
	mov	0x24, %r14
	.word 0xf8f389e0  ! 1196: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_48:
	mov	0x12, %r14
	.word 0xf0db8e60  ! 1197: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfcad21ce  ! 1198: STBA_I	stba	%r30, [%r20 + 0x01ce] %asi
	.word 0xf02d0000  ! 1205: STB_R	stb	%r24, [%r20 + %r0]
T3_asi_reg_rd_49:
	mov	0x19, %r14
	.word 0xf6db8e40  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_102:
	setx	0x260009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20ce071  ! 1209: AND_I	and 	%r19, 0x0071, %r25
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8a4a01f  ! 1215: STWA_I	stwa	%r28, [%r18 + 0x001f] %asi
	.word 0xfa2d61d1  ! 1220: STB_I	stb	%r29, [%r21 + 0x01d1]
	.word 0xf0754000  ! 1221: STX_R	stx	%r24, [%r21 + %r0]
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 19)
	.word 0xfaada067  ! 1228: STBA_I	stba	%r29, [%r22 + 0x0067] %asi
	.word 0xf2ad21cd  ! 1231: STBA_I	stba	%r25, [%r20 + 0x01cd] %asi
T3_asi_reg_rd_50:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_103:
	setx	0x260307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_61:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 1238: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0ada15b  ! 1239: STBA_I	stba	%r24, [%r22 + 0x015b] %asi
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_62:
	mov	0x27, %r14
	.word 0xfef38e40  ! 1247: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfeb421b2  ! 1249: STHA_I	stha	%r31, [%r16 + 0x01b2] %asi
cpu_intr_3_104:
	setx	0x260110, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_51:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 1252: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 24)
	.word 0xb9540000  ! 1257: RDPR_GL	rdpr	%-, %r28
T3_asi_reg_rd_52:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_105:
	setx	0x270228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfa342179  ! 1264: STH_I	sth	%r29, [%r16 + 0x0179]
	.word 0xf4b4e13f  ! 1268: STHA_I	stha	%r26, [%r19 + 0x013f] %asi
	.word 0xb97ca401  ! 1271: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xfe750000  ! 1274: STX_R	stx	%r31, [%r20 + %r0]
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf42de1df  ! 1277: STB_I	stb	%r26, [%r23 + 0x01df]
	.word 0xfca42149  ! 1278: STWA_I	stwa	%r30, [%r16 + 0x0149] %asi
T3_asi_reg_rd_53:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf8f420a0  ! 1281: STXA_I	stxa	%r28, [%r16 + 0x00a0] %asi
T3_asi_reg_rd_54:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfca48020  ! 1285: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_55:
	mov	0x2e, %r14
	.word 0xfadb8e60  ! 1289: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_106:
	setx	0x26033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995a17d  ! 1292: WRPR_TICK_I	wrpr	%r22, 0x017d, %tick
T3_asi_reg_wr_63:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 1293: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4adc020  ! 1298: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	.word 0xf0358000  ! 1300: STH_R	sth	%r24, [%r22 + %r0]
T3_asi_reg_rd_56:
	mov	0x4, %r14
	.word 0xfedb8e80  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_64:
	mov	0x1e, %r14
	.word 0xf2f384a0  ! 1304: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfaac6193  ! 1306: STBA_I	stba	%r29, [%r17 + 0x0193] %asi
	.word 0xf42ce007  ! 1307: STB_I	stb	%r26, [%r19 + 0x0007]
	.word 0xfa74607e  ! 1308: STX_I	stx	%r29, [%r17 + 0x007e]
cpu_intr_3_107:
	setx	0x260125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_108:
	setx	0x240334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc42106  ! 1318: ADDCcc_I	addccc 	%r16, 0x0106, %r30
T3_asi_reg_rd_57:
	mov	0x32, %r14
	.word 0xfadb8e60  ! 1319: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb20d0000  ! 1320: AND_R	and 	%r20, %r0, %r25
	.word 0xfa240000  ! 1321: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf23560a2  ! 1322: STH_I	sth	%r25, [%r21 + 0x00a2]
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a92  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf03520d1  ! 1328: STH_I	sth	%r24, [%r20 + 0x00d1]
	.word 0xf43460d5  ! 1333: STH_I	sth	%r26, [%r17 + 0x00d5]
	.word 0xfc2dc000  ! 1335: STB_R	stb	%r30, [%r23 + %r0]
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_109:
	setx	0x26003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4a031  ! 1339: STHA_I	stha	%r30, [%r18 + 0x0031] %asi
	.word 0xf8a5a031  ! 1340: STWA_I	stwa	%r28, [%r22 + 0x0031] %asi
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_65:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 1347: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf63561f4  ! 1348: STH_I	sth	%r27, [%r21 + 0x01f4]
cpu_intr_3_110:
	setx	0x250131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8752055  ! 1354: STX_I	stx	%r28, [%r20 + 0x0055]
	.word 0xb2054000  ! 1357: ADD_R	add 	%r21, %r0, %r25
T3_asi_reg_rd_58:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 1365: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, d)
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf835e0f7  ! 1375: STH_I	sth	%r28, [%r23 + 0x00f7]
	.word 0xf2748000  ! 1376: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xfc2d0000  ! 1377: STB_R	stb	%r30, [%r20 + %r0]
cpu_intr_3_111:
	setx	0x25012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_112:
	setx	0x260313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 0)
	.word 0xf6b56106  ! 1386: STHA_I	stha	%r27, [%r21 + 0x0106] %asi
T3_asi_reg_wr_66:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 1387: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_67:
	mov	0xc, %r14
	.word 0xf0f38e60  ! 1388: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_113:
	setx	0x2b0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a5e06e  ! 1391: STWA_I	stwa	%r26, [%r23 + 0x006e] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf22c61f3  ! 1395: STB_I	stb	%r25, [%r17 + 0x01f3]
	.word 0xf425e1c5  ! 1396: STW_I	stw	%r26, [%r23 + 0x01c5]
cpu_intr_3_114:
	setx	0x290101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb224c000  ! 1400: SUB_R	sub 	%r19, %r0, %r25
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e42  ! 1401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
	.word 0xf4ad2169  ! 1402: STBA_I	stba	%r26, [%r20 + 0x0169] %asi
	.word 0xf0ace10c  ! 1403: STBA_I	stba	%r24, [%r19 + 0x010c] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf834a1f3  ! 1408: STH_I	sth	%r28, [%r18 + 0x01f3]
	.word 0xfaa48020  ! 1412: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xf8b50020  ! 1413: STHA_R	stha	%r28, [%r20 + %r0] 0x01
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 15)
	.word 0xf0a56032  ! 1415: STWA_I	stwa	%r24, [%r21 + 0x0032] %asi
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_68:
	mov	0x15, %r14
	.word 0xf8f38e80  ! 1417: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_115:
	setx	0x29002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_116:
	setx	0x290312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224e0c0  ! 1427: STW_I	stw	%r25, [%r19 + 0x00c0]
T3_asi_reg_rd_59:
	mov	0x1b, %r14
	.word 0xfedb84a0  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_60:
	mov	0x24, %r14
	.word 0xf2db8e80  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf835a183  ! 1432: STH_I	sth	%r28, [%r22 + 0x0183]
T3_asi_reg_wr_69:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 1434: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb02cc000  ! 1435: ANDN_R	andn 	%r19, %r0, %r24
	.word 0xbd3c8000  ! 1437: SRA_R	sra 	%r18, %r0, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, f)
	.word 0xfe24617f  ! 1447: STW_I	stw	%r31, [%r17 + 0x017f]
	.word 0xb0348000  ! 1448: ORN_R	orn 	%r18, %r0, %r24
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_117:
	setx	0x28022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ada083  ! 1455: STBA_I	stba	%r26, [%r22 + 0x0083] %asi
	.word 0xf0b50020  ! 1457: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xbe244000  ! 1458: SUB_R	sub 	%r17, %r0, %r31
	.word 0xf825a113  ! 1459: STW_I	stw	%r28, [%r22 + 0x0113]
	.word 0xfe340000  ! 1460: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf6ade11a  ! 1464: STBA_I	stba	%r27, [%r23 + 0x011a] %asi
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 28)
	.word 0xfaa56063  ! 1466: STWA_I	stwa	%r29, [%r21 + 0x0063] %asi
T3_asi_reg_rd_61:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 1468: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 7)
	.word 0xb68c606a  ! 1472: ANDcc_I	andcc 	%r17, 0x006a, %r27
	.word 0xf42ce106  ! 1473: STB_I	stb	%r26, [%r19 + 0x0106]
	ta	T_CHANGE_TO_TL1
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c9a  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9a, %hpstate
cpu_intr_3_118:
	setx	0x2b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_70:
	mov	0xe, %r14
	.word 0xfef384a0  ! 1484: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_119:
	setx	0x280032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_120:
	setx	0x2b013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 1500: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xb4b5e14d  ! 1501: SUBCcc_I	orncc 	%r23, 0x014d, %r26
	.word 0xfcf5215b  ! 1503: STXA_I	stxa	%r30, [%r20 + 0x015b] %asi
	.word 0xbc054000  ! 1506: ADD_R	add 	%r21, %r0, %r30
T3_asi_reg_rd_62:
	mov	0xa, %r14
	.word 0xf4db8e40  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbf2ca001  ! 1509: SLL_I	sll 	%r18, 0x0001, %r31
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 27)
	.word 0xf435202d  ! 1514: STH_I	sth	%r26, [%r20 + 0x002d]
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_121:
	setx	0x29010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_71:
	mov	0x3, %r14
	.word 0xf4f38400  ! 1524: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf825601b  ! 1527: STW_I	stw	%r28, [%r21 + 0x001b]
cpu_intr_3_122:
	setx	0x2b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d90  ! 1529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d90, %hpstate
	.word 0xf024e1ee  ! 1530: STW_I	stw	%r24, [%r19 + 0x01ee]
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_72:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 1539: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_123:
	setx	0x29002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6252155  ! 1542: STW_I	stw	%r27, [%r20 + 0x0155]
	.word 0xfa352185  ! 1543: STH_I	sth	%r29, [%r20 + 0x0185]
	.word 0xfcac0020  ! 1544: STBA_R	stba	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_63:
	mov	0xd, %r14
	.word 0xf0db8400  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf0f5e0e1  ! 1546: STXA_I	stxa	%r24, [%r23 + 0x00e1] %asi
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_TO_TL0
	.word 0xf2ac2046  ! 1549: STBA_I	stba	%r25, [%r16 + 0x0046] %asi
	.word 0xf42ca19c  ! 1554: STB_I	stb	%r26, [%r18 + 0x019c]
T3_asi_reg_wr_73:
	mov	0x29, %r14
	.word 0xfaf38e80  ! 1557: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_124:
	setx	0x2a0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 1561: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf22de0f5  ! 1564: STB_I	stb	%r25, [%r23 + 0x00f5]
	.word 0xfa2cc000  ! 1567: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf8240000  ! 1568: STW_R	stw	%r28, [%r16 + %r0]
cpu_intr_3_125:
	setx	0x2a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_126:
	setx	0x2a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2746188  ! 1572: STX_I	stx	%r25, [%r17 + 0x0188]
	.word 0xf22c60db  ! 1576: STB_I	stb	%r25, [%r17 + 0x00db]
	.word 0xb2bd4000  ! 1578: XNORcc_R	xnorcc 	%r21, %r0, %r25
	ta	T_CHANGE_NONHPRIV
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 3)
	.word 0xf8f520fc  ! 1588: STXA_I	stxa	%r28, [%r20 + 0x00fc] %asi
	.word 0xf234e0f0  ! 1590: STH_I	sth	%r25, [%r19 + 0x00f0]
	.word 0xf82cc000  ! 1596: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf025a0fd  ! 1598: STW_I	stw	%r24, [%r22 + 0x00fd]
	.word 0xfa354000  ! 1599: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_wr_74:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 1601: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_64:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb22c60e6  ! 1603: ANDN_I	andn 	%r17, 0x00e6, %r25
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, f)
	.word 0xfcf5219d  ! 1607: STXA_I	stxa	%r30, [%r20 + 0x019d] %asi
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 34)
	.word 0xf6f52118  ! 1610: STXA_I	stxa	%r27, [%r20 + 0x0118] %asi
	.word 0xf8358000  ! 1611: STH_R	sth	%r28, [%r22 + %r0]
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_75:
	mov	0x36, %r14
	.word 0xf8f38e80  ! 1617: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf6344000  ! 1620: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf834201f  ! 1624: STH_I	sth	%r28, [%r16 + 0x001f]
	.word 0xf8b40020  ! 1626: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfa256039  ! 1628: STW_I	stw	%r29, [%r21 + 0x0039]
	.word 0xfa7421a5  ! 1629: STX_I	stx	%r29, [%r16 + 0x01a5]
	.word 0xf6a4a072  ! 1631: STWA_I	stwa	%r27, [%r18 + 0x0072] %asi
	.word 0xfeb4217c  ! 1633: STHA_I	stha	%r31, [%r16 + 0x017c] %asi
T3_asi_reg_rd_65:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf67421f4  ! 1635: STX_I	stx	%r27, [%r16 + 0x01f4]
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983882  ! 1638: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1882, %hpstate
cpu_intr_3_127:
	setx	0x2b003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c0000  ! 1643: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfe7461c8  ! 1644: STX_I	stx	%r31, [%r17 + 0x01c8]
	.word 0xf4ad60d8  ! 1645: STBA_I	stba	%r26, [%r21 + 0x00d8] %asi
	.word 0xb37c4400  ! 1649: MOVR_R	movre	%r17, %r0, %r25
cpu_intr_3_128:
	setx	0x29012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca46082  ! 1651: STWA_I	stwa	%r30, [%r17 + 0x0082] %asi
T3_asi_reg_wr_76:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 1653: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_77:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 1655: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0ac6013  ! 1657: STBA_I	stba	%r24, [%r17 + 0x0013] %asi
cpu_intr_3_129:
	setx	0x2a0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_78:
	mov	0xb, %r14
	.word 0xfcf384a0  ! 1663: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 1f)
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982900  ! 1666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
	.word 0xbc0cc000  ! 1667: AND_R	and 	%r19, %r0, %r30
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_130:
	setx	0x29003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4e018  ! 1674: STWA_I	stwa	%r27, [%r19 + 0x0018] %asi
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_66:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 17)
	.word 0xb8a4216d  ! 1684: SUBcc_I	subcc 	%r16, 0x016d, %r28
T3_asi_reg_wr_79:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 1687: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 2a)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b02  ! 1694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b02, %hpstate
	.word 0xf6244000  ! 1695: STW_R	stw	%r27, [%r17 + %r0]
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf2f521d6  ! 1698: STXA_I	stxa	%r25, [%r20 + 0x01d6] %asi
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 18)
	.word 0xfab4e191  ! 1702: STHA_I	stha	%r29, [%r19 + 0x0191] %asi
T3_asi_reg_wr_80:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 1703: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6f4a17e  ! 1704: STXA_I	stxa	%r27, [%r18 + 0x017e] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_67:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf8ac8020  ! 1708: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xb5643801  ! 1709: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0xf2ad8020  ! 1713: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xf8348000  ! 1714: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf6a460a8  ! 1717: STWA_I	stwa	%r27, [%r17 + 0x00a8] %asi
	.word 0xf4244000  ! 1720: STW_R	stw	%r26, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_81:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 1726: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_68:
	mov	0xc, %r14
	.word 0xfedb8e80  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8a4a166  ! 1733: STWA_I	stwa	%r28, [%r18 + 0x0166] %asi
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 17)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4b5c000  ! 1737: SUBCcc_R	orncc 	%r23, %r0, %r26
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_82:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 1739: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	.word 0xf8adc020  ! 1749: STBA_R	stba	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_69:
	mov	0x16, %r14
	.word 0xf4db8e80  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, f)
	.word 0xb23d0000  ! 1752: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xf07521c6  ! 1755: STX_I	stx	%r24, [%r20 + 0x01c6]
	.word 0xbb540000  ! 1756: RDPR_GL	rdpr	%-, %r29
cpu_intr_3_131:
	setx	0x2a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_70:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 1759: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf6ada1a6  ! 1760: STBA_I	stba	%r27, [%r22 + 0x01a6] %asi
	.word 0xb4048000  ! 1764: ADD_R	add 	%r18, %r0, %r26
	.word 0xf2b44020  ! 1765: STHA_R	stha	%r25, [%r17 + %r0] 0x01
T3_asi_reg_rd_71:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 1766: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_132:
	setx	0x2b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_133:
	setx	0x2a0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4e14f  ! 1776: STWA_I	stwa	%r24, [%r19 + 0x014f] %asi
T3_asi_reg_rd_72:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 1779: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982fc2  ! 1781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc2, %hpstate
cpu_intr_3_134:
	setx	0x28001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_83:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 1784: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfca4e07a  ! 1788: STWA_I	stwa	%r30, [%r19 + 0x007a] %asi
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_73:
	mov	0x2e, %r14
	.word 0xf0db89e0  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf8acc020  ! 1795: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xb3342001  ! 1797: SRL_I	srl 	%r16, 0x0001, %r25
T3_asi_reg_wr_84:
	mov	0x18, %r14
	.word 0xf4f38e40  ! 1799: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198398a  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198a, %hpstate
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_135:
	setx	0x290104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a48020  ! 1811: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982fd0  ! 1814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
cpu_intr_3_136:
	setx	0x28031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfcad8020  ! 1817: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xbcad0000  ! 1820: ANDNcc_R	andncc 	%r20, %r0, %r30
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 16)
	.word 0xf2ac0020  ! 1827: STBA_R	stba	%r25, [%r16 + %r0] 0x01
	.word 0xf6248000  ! 1829: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf82ce161  ! 1830: STB_I	stb	%r28, [%r19 + 0x0161]
cpu_intr_3_137:
	setx	0x280339, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbe0c60bf  ! 1835: AND_I	and 	%r17, 0x00bf, %r31
cpu_intr_3_138:
	setx	0x29002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_139:
	setx	0x28023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33d9000  ! 1840: SRAX_R	srax	%r22, %r0, %r25
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b52  ! 1843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_85:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 1850: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa25c000  ! 1853: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_rd_74:
	mov	0x36, %r14
	.word 0xfcdb8e80  ! 1854: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_HPRIV
	.word 0xfc2de118  ! 1859: STB_I	stb	%r30, [%r23 + 0x0118]
	.word 0xbea50000  ! 1862: SUBcc_R	subcc 	%r20, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfe742058  ! 1867: STX_I	stx	%r31, [%r16 + 0x0058]
	.word 0xf8a4616f  ! 1869: STWA_I	stwa	%r28, [%r17 + 0x016f] %asi
	.word 0xbec44000  ! 1871: ADDCcc_R	addccc 	%r17, %r0, %r31
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_140:
	setx	0x2d030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_86:
	mov	0x16, %r14
	.word 0xfaf38400  ! 1875: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_141:
	setx	0x2f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb025a0d2  ! 1879: SUB_I	sub 	%r22, 0x00d2, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_87:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 1886: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_75:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 1888: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe750000  ! 1893: STX_R	stx	%r31, [%r20 + %r0]
T3_asi_reg_wr_88:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 1895: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbb2d1000  ! 1899: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xf2240000  ! 1900: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf02de1bb  ! 1902: STB_I	stb	%r24, [%r23 + 0x01bb]
cpu_intr_3_142:
	setx	0x2c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 1908: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_76:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 1910: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_77:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_143:
	setx	0x2e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3ce001  ! 1926: SRA_I	sra 	%r19, 0x0001, %r29
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 20)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e1a  ! 1928: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1a, %hpstate
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_144:
	setx	0x2c020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ac8000  ! 1931: ANDNcc_R	andncc 	%r18, %r0, %r27
cpu_intr_3_145:
	setx	0x2c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88d8000  ! 1934: ANDcc_R	andcc 	%r22, %r0, %r28
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfe2c6180  ! 1936: STB_I	stb	%r31, [%r17 + 0x0180]
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983bc0  ! 1937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc0, %hpstate
	.word 0xb6144000  ! 1938: OR_R	or 	%r17, %r0, %r27
cpu_intr_3_146:
	setx	0x2d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_147:
	setx	0x2d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_78:
	mov	0x14, %r14
	.word 0xf4db84a0  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_148:
	setx	0x10129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, a)
	.word 0xf2aca014  ! 1953: STBA_I	stba	%r25, [%r18 + 0x0014] %asi
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfc34a182  ! 1959: STH_I	sth	%r30, [%r18 + 0x0182]
	.word 0xb2258000  ! 1961: SUB_R	sub 	%r22, %r0, %r25
	.word 0xb1508000  ! 1962: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xbf340000  ! 1964: SRL_R	srl 	%r16, %r0, %r31
	ta	T_CHANGE_NONHPRIV
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 19)
	.word 0xf634e0d4  ! 1972: STH_I	sth	%r27, [%r19 + 0x00d4]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_149:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_150:
	setx	0x2f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_89:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 1981: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_151:
	setx	0x2e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b40020  ! 1987: STHA_R	stha	%r28, [%r16 + %r0] 0x01
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_152:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 1)
	.word 0xba84e126  ! 1994: ADDcc_I	addcc 	%r19, 0x0126, %r29
	.word 0xbe948000  ! 1996: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0xbd3c2001  ! 1997: SRA_I	sra 	%r16, 0x0001, %r30
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, c)
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, a)
	.word 0xba0ce0c2  ! 2010: AND_I	and 	%r19, 0x00c2, %r29
	.word 0xf6ad0020  ! 2011: STBA_R	stba	%r27, [%r20 + %r0] 0x01
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb1350000  ! 2013: SRL_R	srl 	%r20, %r0, %r24
	.word 0xf6f460a5  ! 2014: STXA_I	stxa	%r27, [%r17 + 0x00a5] %asi
	.word 0xfc2d2169  ! 2017: STB_I	stb	%r30, [%r20 + 0x0169]
	.word 0xf8a54020  ! 2020: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_90:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2022: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_153:
	setx	0x2e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf6b4c020  ! 2030: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xb335b001  ! 2032: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xbc15c000  ! 2036: OR_R	or 	%r23, %r0, %r30
	.word 0xfca40020  ! 2039: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_79:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_154:
	setx	0x2f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f56055  ! 2047: STXA_I	stxa	%r28, [%r21 + 0x0055] %asi
T3_asi_reg_rd_80:
	mov	0x0, %r14
	.word 0xfcdb8e80  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf4b44020  ! 2052: STHA_R	stha	%r26, [%r17 + %r0] 0x01
T3_asi_reg_rd_81:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 2053: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfcb5c020  ! 2054: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198391a  ! 2056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191a, %hpstate
	.word 0xfa3520c3  ! 2057: STH_I	sth	%r29, [%r20 + 0x00c3]
T3_asi_reg_wr_91:
	mov	0x37, %r14
	.word 0xf6f38e40  ! 2065: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_155:
	setx	0x2c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_82:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfaf52008  ! 2072: STXA_I	stxa	%r29, [%r20 + 0x0008] %asi
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_83:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 2076: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 22)
	.word 0xb9510000  ! 2079: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfc34e0c7  ! 2080: STH_I	sth	%r30, [%r19 + 0x00c7]
	.word 0xf825a19f  ! 2081: STW_I	stw	%r28, [%r22 + 0x019f]
T3_asi_reg_rd_84:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 2084: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_rd_85:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_156:
	setx	0x2e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 4)
	.word 0xf4f42071  ! 2091: STXA_I	stxa	%r26, [%r16 + 0x0071] %asi
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf4ade098  ! 2094: STBA_I	stba	%r26, [%r23 + 0x0098] %asi
	.word 0xfaa44020  ! 2095: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xfa740000  ! 2096: STX_R	stx	%r29, [%r16 + %r0]
T3_asi_reg_rd_86:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0750000  ! 2099: STX_R	stx	%r24, [%r20 + %r0]
cpu_intr_3_157:
	setx	0x2c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf0f4e136  ! 2104: STXA_I	stxa	%r24, [%r19 + 0x0136] %asi
	.word 0xfea4c020  ! 2108: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d80  ! 2112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
	.word 0xf4ac8020  ! 2113: STBA_R	stba	%r26, [%r18 + %r0] 0x01
T3_asi_reg_wr_92:
	mov	0x1a, %r14
	.word 0xf8f384a0  ! 2116: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfe2dc000  ! 2117: STB_R	stb	%r31, [%r23 + %r0]
cpu_intr_3_158:
	setx	0x2d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa354000  ! 2119: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_wr_93:
	mov	0x21, %r14
	.word 0xfef38e40  ! 2121: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_87:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb12ca001  ! 2130: SLL_I	sll 	%r18, 0x0001, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfab52076  ! 2134: STHA_I	stha	%r29, [%r20 + 0x0076] %asi
cpu_intr_3_159:
	setx	0x2f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834e061  ! 2137: STH_I	sth	%r28, [%r19 + 0x0061]
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6252024  ! 2143: STW_I	stw	%r27, [%r20 + 0x0024]
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 31)
	.word 0xf82461c7  ! 2146: STW_I	stw	%r28, [%r17 + 0x01c7]
	.word 0xfca44020  ! 2147: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 15)
	.word 0xb2046065  ! 2149: ADD_I	add 	%r17, 0x0065, %r25
	.word 0xf42d8000  ! 2150: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfeb421f6  ! 2152: STHA_I	stha	%r31, [%r16 + 0x01f6] %asi
	.word 0xfa2560d2  ! 2157: STW_I	stw	%r29, [%r21 + 0x00d2]
cpu_intr_3_160:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8348000  ! 2159: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf025c000  ! 2160: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf274c000  ! 2162: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf03560f2  ! 2165: STH_I	sth	%r24, [%r21 + 0x00f2]
	.word 0xf8ada131  ! 2166: STBA_I	stba	%r28, [%r22 + 0x0131] %asi
	.word 0xfeac6033  ! 2169: STBA_I	stba	%r31, [%r17 + 0x0033] %asi
cpu_intr_3_161:
	setx	0x2d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 20)
	.word 0xbd34c000  ! 2172: SRL_R	srl 	%r19, %r0, %r30
T3_asi_reg_wr_94:
	mov	0x36, %r14
	.word 0xf0f389e0  ! 2173: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf2b4e188  ! 2174: STHA_I	stha	%r25, [%r19 + 0x0188] %asi
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_88:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_95:
	mov	0x25, %r14
	.word 0xf8f389e0  ! 2179: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8354000  ! 2180: STH_R	sth	%r28, [%r21 + %r0]
T3_asi_reg_rd_89:
	mov	0x2c, %r14
	.word 0xfcdb89e0  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbf7dc400  ! 2192: MOVR_R	movre	%r23, %r0, %r31
	.word 0xf4ad2150  ! 2194: STBA_I	stba	%r26, [%r20 + 0x0150] %asi
	.word 0xf4b4e0bd  ! 2197: STHA_I	stha	%r26, [%r19 + 0x00bd] %asi
	.word 0xf6f561b1  ! 2198: STXA_I	stxa	%r27, [%r21 + 0x01b1] %asi
T3_asi_reg_wr_96:
	mov	0x2c, %r14
	.word 0xf6f38e80  ! 2200: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_wr_97:
	mov	0x28, %r14
	.word 0xfef38400  ! 2201: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_162:
	setx	0x2e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_98:
	mov	0x11, %r14
	.word 0xf2f389e0  ! 2205: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_90:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 2207: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_163:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6342082  ! 2215: STH_I	sth	%r27, [%r16 + 0x0082]
cpu_intr_3_164:
	setx	0x2d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_91:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_165:
	setx	0x2e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfe34c000  ! 2223: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfa344000  ! 2225: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb9518000  ! 2226: RDPR_PSTATE	rdpr	%pstate, %r28
T3_asi_reg_rd_92:
	mov	0x1a, %r14
	.word 0xfadb89e0  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b5a  ! 2232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
	.word 0xf4344000  ! 2233: STH_R	sth	%r26, [%r17 + %r0]
T3_asi_reg_rd_93:
	mov	0x16, %r14
	.word 0xf2db89e0  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_99:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 2235: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_rd_94:
	mov	0x2e, %r14
	.word 0xf6db84a0  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983bd2  ! 2239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd2, %hpstate
	.word 0xfcb5a1a8  ! 2240: STHA_I	stha	%r30, [%r22 + 0x01a8] %asi
	.word 0xf8758000  ! 2241: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf624e01c  ! 2244: STW_I	stw	%r27, [%r19 + 0x001c]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_100:
	mov	0x2, %r14
	.word 0xf8f38400  ! 2249: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_95:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_96:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 2252: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_97:
	mov	0x34, %r14
	.word 0xf6db89e0  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_166:
	setx	0x2f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_167:
	setx	0x2c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_101:
	mov	0x2, %r14
	.word 0xf4f389e0  ! 2273: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf8752026  ! 2274: STX_I	stx	%r28, [%r20 + 0x0026]
	.word 0xf82c0000  ! 2275: STB_R	stb	%r28, [%r16 + %r0]
cpu_intr_3_168:
	setx	0x2f0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 2278: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xfc350000  ! 2280: STH_R	sth	%r30, [%r20 + %r0]
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819829c8  ! 2283: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
T3_asi_reg_wr_102:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2285: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf4b48020  ! 2286: STHA_R	stha	%r26, [%r18 + %r0] 0x01
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_98:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_169:
	setx	0x2e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_103:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 2294: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8748000  ! 2295: STX_R	stx	%r28, [%r18 + %r0]
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_104:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 2299: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_170:
	setx	0x32021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_99:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_rd_100:
	mov	0x13, %r14
	.word 0xf6db84a0  ! 2306: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 26)
	.word 0xf834c000  ! 2317: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xba154000  ! 2320: OR_R	or 	%r21, %r0, %r29
	.word 0xbcbd8000  ! 2321: XNORcc_R	xnorcc 	%r22, %r0, %r30
	.word 0xf0adc020  ! 2322: STBA_R	stba	%r24, [%r23 + %r0] 0x01
T3_asi_reg_wr_105:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2325: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_101:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2329: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf834e050  ! 2331: STH_I	sth	%r28, [%r19 + 0x0050]
	.word 0xf8b5c020  ! 2332: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf4b58020  ! 2338: STHA_R	stha	%r26, [%r22 + %r0] 0x01
cpu_intr_3_171:
	setx	0x320226, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b5a  ! 2341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5a, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_102:
	mov	0x23, %r14
	.word 0xf6db8e60  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_106:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 2348: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_172:
	setx	0x320320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_173:
	setx	0x320002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c4000  ! 2357: SLL_R	sll 	%r17, %r0, %r27
T3_asi_reg_rd_103:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 2358: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf2242185  ! 2359: STW_I	stw	%r25, [%r16 + 0x0185]
	.word 0xb4a561bb  ! 2360: SUBcc_I	subcc 	%r21, 0x01bb, %r26
	.word 0xf2b5c020  ! 2363: STHA_R	stha	%r25, [%r23 + %r0] 0x01
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_174:
	setx	0x330125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x300200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf461ca  ! 2375: STXA_I	stxa	%r30, [%r17 + 0x01ca] %asi
	.word 0xf6f46007  ! 2378: STXA_I	stxa	%r27, [%r17 + 0x0007] %asi
T3_asi_reg_wr_107:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 2379: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf4a52088  ! 2380: STWA_I	stwa	%r26, [%r20 + 0x0088] %asi
T3_asi_reg_rd_104:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_176:
	setx	0x320335, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a88  ! 2390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
cpu_intr_3_177:
	setx	0x300204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25e060  ! 2394: STW_I	stw	%r29, [%r23 + 0x0060]
cpu_intr_3_178:
	setx	0x300119, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_179:
	setx	0x33000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35e069  ! 2401: STH_I	sth	%r30, [%r23 + 0x0069]
T3_asi_reg_wr_108:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 2402: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_105:
	mov	0x1b, %r14
	.word 0xfadb8e80  ! 2404: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb83ce146  ! 2405: XNOR_I	xnor 	%r19, 0x0146, %r28
T3_asi_reg_wr_109:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 2410: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_wr_110:
	mov	0xc, %r14
	.word 0xf4f38e80  ! 2411: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf0f42075  ! 2414: STXA_I	stxa	%r24, [%r16 + 0x0075] %asi
cpu_intr_3_180:
	setx	0x310310, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_111:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 2417: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfa24a01a  ! 2422: STW_I	stw	%r29, [%r18 + 0x001a]
	.word 0xfef56035  ! 2426: STXA_I	stxa	%r31, [%r21 + 0x0035] %asi
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_106:
	mov	0x31, %r14
	.word 0xf0db8e80  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_107:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_108:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf63460d1  ! 2433: STH_I	sth	%r27, [%r17 + 0x00d1]
	.word 0xfcb5c020  ! 2435: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_181:
	setx	0x320312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_112:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2442: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfc74207b  ! 2443: STX_I	stx	%r30, [%r16 + 0x007b]
	.word 0xf635206c  ! 2444: STH_I	sth	%r27, [%r20 + 0x006c]
T3_asi_reg_wr_113:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 2445: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa758000  ! 2447: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf2a5211d  ! 2448: STWA_I	stwa	%r25, [%r20 + 0x011d] %asi
	.word 0xf875c000  ! 2449: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xfab40020  ! 2452: STHA_R	stha	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_109:
	mov	0x13, %r14
	.word 0xf4db8e60  ! 2453: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_114:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 2455: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_115:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 2457: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf235605b  ! 2459: STH_I	sth	%r25, [%r21 + 0x005b]
T3_asi_reg_wr_116:
	mov	0x4, %r14
	.word 0xfef38400  ! 2460: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_110:
	mov	0x2b, %r14
	.word 0xfadb8e80  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfaa5c020  ! 2462: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xfe2da088  ! 2463: STB_I	stb	%r31, [%r22 + 0x0088]
T3_asi_reg_wr_117:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 2464: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_182:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_183:
	setx	0x330311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_184:
	setx	0x30021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2d1000  ! 2471: SLLX_R	sllx	%r20, %r0, %r30
T3_asi_reg_rd_111:
	mov	0x2e, %r14
	.word 0xfedb8400  ! 2472: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 25)
	.word 0xf625e045  ! 2475: STW_I	stw	%r27, [%r23 + 0x0045]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_118:
	mov	0x1, %r14
	.word 0xf6f384a0  ! 2479: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf2a4a09a  ! 2480: STWA_I	stwa	%r25, [%r18 + 0x009a] %asi
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 31)
	.word 0xbc1c8000  ! 2483: XOR_R	xor 	%r18, %r0, %r30
T3_asi_reg_rd_112:
	mov	0x11, %r14
	.word 0xfedb89e0  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf8f52139  ! 2487: STXA_I	stxa	%r28, [%r20 + 0x0139] %asi
cpu_intr_3_185:
	setx	0x31032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_113:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfeb40020  ! 2493: STHA_R	stha	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_114:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_119:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 2498: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfaad4020  ! 2500: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xf0b40020  ! 2502: STHA_R	stha	%r24, [%r16 + %r0] 0x01
cpu_intr_3_186:
	setx	0x300026, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_120:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 2506: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_115:
	mov	0x8, %r14
	.word 0xfedb89e0  ! 2508: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_116:
	mov	0xc, %r14
	.word 0xf2db8e60  ! 2509: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf435602a  ! 2510: STH_I	sth	%r26, [%r21 + 0x002a]
	.word 0xf42c6163  ! 2511: STB_I	stb	%r26, [%r17 + 0x0163]
	ta	T_CHANGE_NONHPRIV
	.word 0xf2ac4020  ! 2513: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_117:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 2515: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf875c000  ! 2520: STX_R	stx	%r28, [%r23 + %r0]
T3_asi_reg_rd_118:
	mov	0x31, %r14
	.word 0xf2db89e0  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_187:
	setx	0x330321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_188:
	setx	0x300124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaada188  ! 2528: STBA_I	stba	%r29, [%r22 + 0x0188] %asi
	.word 0xf22d0000  ! 2530: STB_R	stb	%r25, [%r20 + %r0]
T3_asi_reg_wr_121:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 2531: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_122:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 2532: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, d)
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_123:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 2541: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 1)
	.word 0xfa348000  ! 2545: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf27521bc  ! 2546: STX_I	stx	%r25, [%r20 + 0x01bc]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_189:
	setx	0x32021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d2103  ! 2549: XOR_I	xor 	%r20, 0x0103, %r31
	.word 0xb2350000  ! 2550: SUBC_R	orn 	%r20, %r0, %r25
	.word 0xfc344000  ! 2551: STH_R	sth	%r30, [%r17 + %r0]
T3_asi_reg_rd_119:
	mov	0x16, %r14
	.word 0xf6db84a0  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_190:
	setx	0x30010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b561cf  ! 2557: STHA_I	stha	%r26, [%r21 + 0x01cf] %asi
T3_asi_reg_rd_120:
	mov	0xa, %r14
	.word 0xfadb89e0  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_121:
	mov	0x1f, %r14
	.word 0xf4db8400  ! 2566: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, e)
	.word 0xfa74e111  ! 2569: STX_I	stx	%r29, [%r19 + 0x0111]
cpu_intr_3_191:
	setx	0x310029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_192:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2358000  ! 2572: STH_R	sth	%r25, [%r22 + %r0]
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_193:
	setx	0x31032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb8144000  ! 2581: OR_R	or 	%r17, %r0, %r28
T3_asi_reg_wr_124:
	mov	0x19, %r14
	.word 0xf0f384a0  ! 2584: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfeb50020  ! 2589: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_194:
	setx	0x31033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_122:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf2250000  ! 2594: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xfca4c020  ! 2595: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 2)
	.word 0xb6bc20a1  ! 2597: XNORcc_I	xnorcc 	%r16, 0x00a1, %r27
	.word 0xfc758000  ! 2601: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf634e0b3  ! 2602: STH_I	sth	%r27, [%r19 + 0x00b3]
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 8)
	.word 0xb8042107  ! 2609: ADD_I	add 	%r16, 0x0107, %r28
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_195:
	setx	0x300018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075e17e  ! 2612: STX_I	stx	%r24, [%r23 + 0x017e]
	.word 0xfe3560c4  ! 2613: STH_I	sth	%r31, [%r21 + 0x00c4]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_196:
	setx	0x300237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4a123  ! 2618: STHA_I	stha	%r26, [%r18 + 0x0123] %asi
	.word 0xf434a1de  ! 2619: STH_I	sth	%r26, [%r18 + 0x01de]
	.word 0xb6b58000  ! 2621: ORNcc_R	orncc 	%r22, %r0, %r27
	.word 0xfea421e7  ! 2622: STWA_I	stwa	%r31, [%r16 + 0x01e7] %asi
	.word 0xf0a52197  ! 2625: STWA_I	stwa	%r24, [%r20 + 0x0197] %asi
	.word 0xbcada045  ! 2627: ANDNcc_I	andncc 	%r22, 0x0045, %r30
	.word 0xfa2ce0e0  ! 2628: STB_I	stb	%r29, [%r19 + 0x00e0]
	.word 0xb92d8000  ! 2632: SLL_R	sll 	%r22, %r0, %r28
cpu_intr_3_197:
	setx	0x300120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_123:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf82d6163  ! 2638: STB_I	stb	%r28, [%r21 + 0x0163]
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_124:
	mov	0x1b, %r14
	.word 0xf6db89e0  ! 2648: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_198:
	setx	0x31020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5e1cc  ! 2655: STXA_I	stxa	%r25, [%r23 + 0x01cc] %asi
	.word 0xf625e186  ! 2656: STW_I	stw	%r27, [%r23 + 0x0186]
cpu_intr_3_199:
	setx	0x320113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad611e  ! 2660: STBA_I	stba	%r28, [%r21 + 0x011e] %asi
	.word 0xb5345000  ! 2661: SRLX_R	srlx	%r17, %r0, %r26
cpu_intr_3_200:
	setx	0x320217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 11)
	.word 0xb5343001  ! 2665: SRLX_I	srlx	%r16, 0x0001, %r26
T3_asi_reg_rd_125:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb495a131  ! 2676: ORcc_I	orcc 	%r22, 0x0131, %r26
	.word 0xfc74c000  ! 2677: STX_R	stx	%r30, [%r19 + %r0]
cpu_intr_3_201:
	setx	0x33003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_125:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 2686: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf8b460ea  ! 2689: STHA_I	stha	%r28, [%r17 + 0x00ea] %asi
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 24)
	.word 0xfc354000  ! 2700: STH_R	sth	%r30, [%r21 + %r0]
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 0)
	.word 0xf4244000  ! 2706: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf42d8000  ! 2708: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xf0ac4020  ! 2709: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xf82d2076  ! 2710: STB_I	stb	%r28, [%r20 + 0x0076]
	.word 0xbcc54000  ! 2711: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xbe158000  ! 2712: OR_R	or 	%r22, %r0, %r31
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 21)
	.word 0xfc358000  ! 2715: STH_R	sth	%r30, [%r22 + %r0]
T3_asi_reg_wr_126:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 2716: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_126:
	mov	0x8, %r14
	.word 0xf2db8400  ! 2717: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_rd_127:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 2719: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_202:
	setx	0x30000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_127:
	mov	0x19, %r14
	.word 0xf8f38e40  ! 2724: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_128:
	mov	0x13, %r14
	.word 0xfcf38e40  ! 2725: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfaa46033  ! 2727: STWA_I	stwa	%r29, [%r17 + 0x0033] %asi
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b00  ! 2730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b00, %hpstate
T3_asi_reg_wr_129:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 2731: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2742132  ! 2735: STX_I	stx	%r25, [%r16 + 0x0132]
cpu_intr_3_203:
	setx	0x360322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ce0c8  ! 2739: STB_I	stb	%r29, [%r19 + 0x00c8]
	.word 0xf4340000  ! 2742: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xba0d6118  ! 2744: AND_I	and 	%r21, 0x0118, %r29
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d9a  ! 2746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9a, %hpstate
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_204:
	setx	0x350131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 3d)
	.word 0xa1902000  ! 2755: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xfe2de066  ! 2756: STB_I	stb	%r31, [%r23 + 0x0066]
cpu_intr_3_205:
	setx	0x360027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c61e3  ! 2758: STB_I	stb	%r31, [%r17 + 0x01e3]
	ta	T_CHANGE_TO_TL0
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_130:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 2762: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe248000  ! 2771: STW_R	stw	%r31, [%r18 + %r0]
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_128:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf4aca0ac  ! 2775: STBA_I	stba	%r26, [%r18 + 0x00ac] %asi
	.word 0xbf3c4000  ! 2776: SRA_R	sra 	%r17, %r0, %r31
	.word 0xfc748000  ! 2778: STX_R	stx	%r30, [%r18 + %r0]
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 23)
	.word 0xf675c000  ! 2783: STX_R	stx	%r27, [%r23 + %r0]
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 31)
	.word 0xf2a5e0d1  ! 2793: STWA_I	stwa	%r25, [%r23 + 0x00d1] %asi
cpu_intr_3_206:
	setx	0x350111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 25)
	.word 0xf0a46037  ! 2797: STWA_I	stwa	%r24, [%r17 + 0x0037] %asi
	.word 0xf8b4a1b0  ! 2799: STHA_I	stha	%r28, [%r18 + 0x01b0] %asi
T3_asi_reg_wr_131:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 2804: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe240000  ! 2807: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfe24e001  ! 2809: STW_I	stw	%r31, [%r19 + 0x0001]
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf22ca164  ! 2815: STB_I	stb	%r25, [%r18 + 0x0164]
	.word 0xfe7420ad  ! 2817: STX_I	stx	%r31, [%r16 + 0x00ad]
T3_asi_reg_rd_129:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_207:
	setx	0x370121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 3)
	.word 0xf2adc020  ! 2823: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xb2c5a186  ! 2825: ADDCcc_I	addccc 	%r22, 0x0186, %r25
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_208:
	setx	0x370203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe248000  ! 2829: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xf4ade0cb  ! 2831: STBA_I	stba	%r26, [%r23 + 0x00cb] %asi
	.word 0xfead8020  ! 2832: STBA_R	stba	%r31, [%r22 + %r0] 0x01
cpu_intr_3_209:
	setx	0x370224, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ed2  ! 2835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed2, %hpstate
	.word 0xf2348000  ! 2838: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xfc74602b  ! 2839: STX_I	stx	%r30, [%r17 + 0x002b]
cpu_intr_3_210:
	setx	0x340104, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_130:
	mov	0x1a, %r14
	.word 0xfcdb8e60  ! 2843: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb895609f  ! 2845: ORcc_I	orcc 	%r21, 0x009f, %r28
T3_asi_reg_wr_132:
	mov	0xd, %r14
	.word 0xf8f38e80  ! 2846: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_133:
	mov	0x12, %r14
	.word 0xf2f38e80  ! 2847: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_134:
	mov	0x1, %r14
	.word 0xf4f38400  ! 2848: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_211:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 19)
	.word 0xb33d2001  ! 2852: SRA_I	sra 	%r20, 0x0001, %r25
cpu_intr_3_212:
	setx	0x350111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5215b  ! 2855: STHA_I	stha	%r25, [%r20 + 0x015b] %asi
cpu_intr_3_213:
	setx	0x350115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad2103  ! 2857: STBA_I	stba	%r25, [%r20 + 0x0103] %asi
T3_asi_reg_rd_131:
	mov	0x6, %r14
	.word 0xf8db8400  ! 2858: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_135:
	mov	0x2c, %r14
	.word 0xfcf389e0  ! 2859: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_136:
	mov	0x1e, %r14
	.word 0xfcf384a0  ! 2864: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_214:
	setx	0x360312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2844000  ! 2866: ADDcc_R	addcc 	%r17, %r0, %r25
	.word 0xb951c000  ! 2867: RDPR_TL	rdpr	%tl, %r28
cpu_intr_3_215:
	setx	0x360135, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_137:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 2870: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xa1902001  ! 2871: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_132:
	mov	0x1a, %r14
	.word 0xfadb8e80  ! 2874: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xba456055  ! 2876: ADDC_I	addc 	%r21, 0x0055, %r29
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a42  ! 2877: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a42, %hpstate
	.word 0x8f902001  ! 2878: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xfa75e107  ! 2881: STX_I	stx	%r29, [%r23 + 0x0107]
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_138:
	mov	0xd, %r14
	.word 0xf8f38e60  ! 2885: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_133:
	mov	0x14, %r14
	.word 0xf0db8e60  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_216:
	setx	0x370139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d4000  ! 2892: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xb7520000  ! 2893: RDPR_PIL	rdpr	%pil, %r27
cpu_intr_3_217:
	setx	0x37033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_218:
	setx	0x370015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_134:
	mov	0x1b, %r14
	.word 0xf0db8e60  ! 2897: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_219:
	setx	0x36033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624a045  ! 2900: STW_I	stw	%r27, [%r18 + 0x0045]
cpu_intr_3_220:
	setx	0x370124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6350000  ! 2905: STH_R	sth	%r27, [%r20 + %r0]
cpu_intr_3_221:
	setx	0x360216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 22)
	.word 0xf434e026  ! 2909: STH_I	sth	%r26, [%r19 + 0x0026]
cpu_intr_3_222:
	setx	0x340125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_223:
	setx	0x36012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa52162  ! 2916: SUBcc_I	subcc 	%r20, 0x0162, %r29
T3_asi_reg_rd_135:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 2919: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfa24e05d  ! 2921: STW_I	stw	%r29, [%r19 + 0x005d]
cpu_intr_3_224:
	setx	0x370219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc244000  ! 2924: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf8240000  ! 2929: STW_R	stw	%r28, [%r16 + %r0]
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa358000  ! 2934: STH_R	sth	%r29, [%r22 + %r0]
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 7)
	.word 0xf4b50020  ! 2939: STHA_R	stha	%r26, [%r20 + %r0] 0x01
T3_asi_reg_wr_139:
	mov	0x10, %r14
	.word 0xfaf38400  ! 2940: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfcb52027  ! 2944: STHA_I	stha	%r30, [%r20 + 0x0027] %asi
T3_asi_reg_rd_136:
	mov	0x1f, %r14
	.word 0xf8db8e80  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf6358000  ! 2948: STH_R	sth	%r27, [%r22 + %r0]
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_140:
	mov	0x3, %r14
	.word 0xfef38e60  ! 2957: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_wr_141:
	mov	0x10, %r14
	.word 0xf6f38e40  ! 2959: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_225:
	setx	0x35030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f560d0  ! 2965: STXA_I	stxa	%r28, [%r21 + 0x00d0] %asi
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfa35c000  ! 2968: STH_R	sth	%r29, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_142:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 2970: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_137:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbcbca099  ! 2973: XNORcc_I	xnorcc 	%r18, 0x0099, %r30
cpu_intr_3_226:
	setx	0x340320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_227:
	setx	0x34020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2348000  ! 2976: STH_R	sth	%r25, [%r18 + %r0]
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_138:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 2979: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_143:
	mov	0x2a, %r14
	.word 0xfef38e60  ! 2983: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_139:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfe35a0cb  ! 2987: STH_I	sth	%r31, [%r22 + 0x00cb]
T3_asi_reg_rd_140:
	mov	0x33, %r14
	.word 0xf4db8400  ! 2988: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 2990: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_228:
	setx	0x340323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2994: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xfaf4a0dd  ! 2998: STXA_I	stxa	%r29, [%r18 + 0x00dd] %asi
T3_asi_reg_wr_145:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 3000: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_rd_141:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfc34c000  ! 3003: STH_R	sth	%r30, [%r19 + %r0]
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf6340000  ! 3005: STH_R	sth	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc354000  ! 3009: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfe34616b  ! 3011: STH_I	sth	%r31, [%r17 + 0x016b]
cpu_intr_3_229:
	setx	0x340134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad8020  ! 3013: STBA_R	stba	%r29, [%r22 + %r0] 0x01
cpu_intr_3_230:
	setx	0x34010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34c000  ! 3015: STH_R	sth	%r29, [%r19 + %r0]
T3_asi_reg_rd_142:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_143:
	mov	0x15, %r14
	.word 0xf2db8e80  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf2740000  ! 3019: STX_R	stx	%r25, [%r16 + %r0]
T3_asi_reg_rd_144:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6f5e0b7  ! 3024: STXA_I	stxa	%r27, [%r23 + 0x00b7] %asi
cpu_intr_3_231:
	setx	0x37000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_232:
	setx	0x350031, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_145:
	mov	0x23, %r14
	.word 0xf2db8e40  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc244000  ! 3031: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xfea58020  ! 3032: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfead607b  ! 3038: STBA_I	stba	%r31, [%r21 + 0x007b] %asi
	.word 0xf0b40020  ! 3040: STHA_R	stha	%r24, [%r16 + %r0] 0x01
T3_asi_reg_rd_146:
	mov	0x5, %r14
	.word 0xfedb8e40  ! 3042: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe1c20b1  ! 3043: XOR_I	xor 	%r16, 0x00b1, %r31
T3_asi_reg_wr_146:
	mov	0x8, %r14
	.word 0xf2f38400  ! 3044: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb6c5a183  ! 3045: ADDCcc_I	addccc 	%r22, 0x0183, %r27
	.word 0xf2ac0020  ! 3047: STBA_R	stba	%r25, [%r16 + %r0] 0x01
cpu_intr_3_233:
	setx	0x340004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a48000  ! 3054: SUBcc_R	subcc 	%r18, %r0, %r24
	.word 0xfc35c000  ! 3055: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xfca5a063  ! 3058: STWA_I	stwa	%r30, [%r22 + 0x0063] %asi
	.word 0xf4f4609c  ! 3060: STXA_I	stxa	%r26, [%r17 + 0x009c] %asi
	.word 0xf02c8000  ! 3063: STB_R	stb	%r24, [%r18 + %r0]
T3_asi_reg_rd_147:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 3064: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0344000  ! 3068: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf2f5616e  ! 3069: STXA_I	stxa	%r25, [%r21 + 0x016e] %asi
cpu_intr_3_234:
	setx	0x370130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_147:
	mov	0x0, %r14
	.word 0xfef38e40  ! 3071: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbb643801  ! 3072: MOVcc_I	<illegal instruction>
	.word 0xfc248000  ! 3073: STW_R	stw	%r30, [%r18 + %r0]
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 20)
	.word 0xf2a4c020  ! 3082: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 1)
	.word 0xb93d0000  ! 3085: SRA_R	sra 	%r20, %r0, %r28
	.word 0x919560c2  ! 3088: WRPR_PIL_I	wrpr	%r21, 0x00c2, %pil
	.word 0xf0a58020  ! 3091: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
T3_asi_reg_rd_148:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf075e0fb  ! 3093: STX_I	stx	%r24, [%r23 + 0x00fb]
	.word 0xf0ace010  ! 3098: STBA_I	stba	%r24, [%r19 + 0x0010] %asi
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 3)
	.word 0xf835c000  ! 3101: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xbe9dc000  ! 3103: XORcc_R	xorcc 	%r23, %r0, %r31
cpu_intr_3_235:
	setx	0x37021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe952058  ! 3105: ORcc_I	orcc 	%r20, 0x0058, %r31
	.word 0xf42c20c9  ! 3106: STB_I	stb	%r26, [%r16 + 0x00c9]
	.word 0xf0a56069  ! 3108: STWA_I	stwa	%r24, [%r21 + 0x0069] %asi
T3_asi_reg_wr_148:
	mov	0x2e, %r14
	.word 0xf0f384a0  ! 3112: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_149:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 3119: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf8ad2151  ! 3120: STBA_I	stba	%r28, [%r20 + 0x0151] %asi
	.word 0xfa75e1e4  ! 3121: STX_I	stx	%r29, [%r23 + 0x01e4]
	.word 0xfe74e10d  ! 3124: STX_I	stx	%r31, [%r19 + 0x010d]
cpu_intr_3_236:
	setx	0x36010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_150:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 3127: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_151:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 3129: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf4a4a1b6  ! 3133: STWA_I	stwa	%r26, [%r18 + 0x01b6] %asi
	.word 0xfc34e123  ! 3134: STH_I	sth	%r30, [%r19 + 0x0123]
	.word 0xb685e03c  ! 3135: ADDcc_I	addcc 	%r23, 0x003c, %r27
	.word 0xb41d212b  ! 3138: XOR_I	xor 	%r20, 0x012b, %r26
T3_asi_reg_rd_149:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_150:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_237:
	setx	0x36031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 6)
	.word 0xfa244000  ! 3149: STW_R	stw	%r29, [%r17 + %r0]
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 34)
	.word 0xfe35c000  ! 3153: STH_R	sth	%r31, [%r23 + %r0]
cpu_intr_3_238:
	setx	0x340335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa254000  ! 3157: STW_R	stw	%r29, [%r21 + %r0]
cpu_intr_3_239:
	setx	0x36022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 27)
	.word 0xb7504000  ! 3162: RDPR_TNPC	rdpr	%tnpc, %r27
T3_asi_reg_rd_151:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfea58020  ! 3164: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xb6bd8000  ! 3165: XNORcc_R	xnorcc 	%r22, %r0, %r27
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_152:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_152:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 3175: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf0a44020  ! 3176: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a58  ! 3177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a58, %hpstate
T3_asi_reg_rd_153:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 3179: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 14)
	.word 0xb0244000  ! 3183: SUB_R	sub 	%r17, %r0, %r24
	.word 0xfc25a00a  ! 3185: STW_I	stw	%r30, [%r22 + 0x000a]
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 10)
	.word 0xf22d4000  ! 3190: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xfcf521df  ! 3192: STXA_I	stxa	%r30, [%r20 + 0x01df] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa7520aa  ! 3201: STX_I	stx	%r29, [%r20 + 0x00aa]
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
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 23)
	.word 0xb7480000  ! 3208: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
T3_asi_reg_rd_154:
	mov	0x36, %r14
	.word 0xfcdb89e0  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbebde000  ! 3210: XNORcc_I	xnorcc 	%r23, 0x0000, %r31
T3_asi_reg_wr_153:
	mov	0xb, %r14
	.word 0xf6f38e60  ! 3215: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_154:
	mov	0x2f, %r14
	.word 0xf4f384a0  ! 3218: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf22d4000  ! 3219: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf0b5e0b9  ! 3220: STHA_I	stha	%r24, [%r23 + 0x00b9] %asi
cpu_intr_3_240:
	setx	0x3b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_241:
	setx	0x3a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_155:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf87421a8  ! 3226: STX_I	stx	%r28, [%r16 + 0x01a8]
T3_asi_reg_wr_155:
	mov	0x3c0, %r14
	.word 0xfef38400  ! 3227: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf6a5e1ad  ! 3228: STWA_I	stwa	%r27, [%r23 + 0x01ad] %asi
	ta	T_CHANGE_HPRIV
	.word 0xf0a4c020  ! 3230: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xfaacc020  ! 3232: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xb68c2163  ! 3233: ANDcc_I	andcc 	%r16, 0x0163, %r27
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 16)
	.word 0xf2f560f1  ! 3237: STXA_I	stxa	%r25, [%r21 + 0x00f1] %asi
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 1)
	.word 0xfeb48020  ! 3241: STHA_R	stha	%r31, [%r18 + %r0] 0x01
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982fd8  ! 3243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
T3_asi_reg_rd_156:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbf7d8400  ! 3246: MOVR_R	movre	%r22, %r0, %r31
cpu_intr_3_242:
	setx	0x3b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_157:
	mov	0x26, %r14
	.word 0xf0db84a0  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbc35e1f4  ! 3251: ORN_I	orn 	%r23, 0x01f4, %r30
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_243:
	setx	0x3a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72cb001  ! 3260: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xfab54020  ! 3262: STHA_R	stha	%r29, [%r21 + %r0] 0x01
cpu_intr_3_244:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_158:
	mov	0x28, %r14
	.word 0xf0db8e40  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfead0020  ! 3276: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xb42d0000  ! 3277: ANDN_R	andn 	%r20, %r0, %r26
T3_asi_reg_rd_159:
	mov	0x16, %r14
	.word 0xfcdb8e40  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0254000  ! 3281: STW_R	stw	%r24, [%r21 + %r0]
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_160:
	mov	0x32, %r14
	.word 0xfadb8e60  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf075a1c2  ! 3287: STX_I	stx	%r24, [%r22 + 0x01c2]
	.word 0xf02cc000  ! 3288: STB_R	stb	%r24, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_161:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 2)
	.word 0xb685a1f8  ! 3293: ADDcc_I	addcc 	%r22, 0x01f8, %r27
	.word 0xf4b5a0b5  ! 3295: STHA_I	stha	%r26, [%r22 + 0x00b5] %asi
T3_asi_reg_wr_156:
	mov	0x2e, %r14
	.word 0xf2f38400  ! 3299: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 24)
	.word 0xfa34e0a3  ! 3301: STH_I	sth	%r29, [%r19 + 0x00a3]
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 18)
	.word 0xfaa520f5  ! 3304: STWA_I	stwa	%r29, [%r20 + 0x00f5] %asi
T3_asi_reg_rd_162:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_163:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 3310: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_157:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 3313: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_245:
	setx	0x390335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad0020  ! 3315: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	.word 0xf62c4000  ! 3316: STB_R	stb	%r27, [%r17 + %r0]
T3_asi_reg_wr_158:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 3320: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8256094  ! 3321: STW_I	stw	%r28, [%r21 + 0x0094]
	.word 0xf42ce135  ! 3322: STB_I	stb	%r26, [%r19 + 0x0135]
T3_asi_reg_wr_159:
	mov	0x2d, %r14
	.word 0xf0f38e60  ! 3323: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_246:
	setx	0x39012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb4a5c000  ! 3330: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0xfe2ca05c  ! 3332: STB_I	stb	%r31, [%r18 + 0x005c]
	.word 0xfc25e1a9  ! 3333: STW_I	stw	%r30, [%r23 + 0x01a9]
	.word 0xf035a064  ! 3334: STH_I	sth	%r24, [%r22 + 0x0064]
	.word 0xf4a4c020  ! 3335: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_247:
	setx	0x3a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8248000  ! 3342: SUB_R	sub 	%r18, %r0, %r28
T3_asi_reg_rd_164:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_248:
	setx	0x3a033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_160:
	mov	0x14, %r14
	.word 0xf2f38e80  ! 3355: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbc040000  ! 3358: ADD_R	add 	%r16, %r0, %r30
cpu_intr_3_249:
	setx	0x3b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 3370: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf83560fc  ! 3371: STH_I	sth	%r28, [%r21 + 0x00fc]
	.word 0xf8ac8020  ! 3375: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_161:
	mov	0xc, %r14
	.word 0xfaf38e60  ! 3378: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf2ad0020  ! 3381: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	.word 0xf2a48020  ! 3383: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
T3_asi_reg_rd_165:
	mov	0x1e, %r14
	.word 0xfcdb8e60  ! 3385: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_166:
	mov	0x24, %r14
	.word 0xf4db8400  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_250:
	setx	0x39033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 10)
	.word 0xbabc6064  ! 3391: XNORcc_I	xnorcc 	%r17, 0x0064, %r29
	.word 0xbf3cf001  ! 3393: SRAX_I	srax	%r19, 0x0001, %r31
cpu_intr_3_251:
	setx	0x380021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22ca033  ! 3397: STB_I	stb	%r25, [%r18 + 0x0033]
cpu_intr_3_252:
	setx	0x390214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5206b  ! 3401: STHA_I	stha	%r27, [%r20 + 0x006b] %asi
T3_asi_reg_wr_162:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 3403: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf6ad6049  ! 3406: STBA_I	stba	%r27, [%r21 + 0x0049] %asi
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf22d2120  ! 3408: STB_I	stb	%r25, [%r20 + 0x0120]
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_253:
	setx	0x380128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_163:
	mov	0x15, %r14
	.word 0xf4f38e60  ! 3415: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_167:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_164:
	mov	0x7, %r14
	.word 0xfaf389e0  ! 3420: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2a40020  ! 3421: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_254:
	setx	0x3b022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_255:
	setx	0x390320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_256:
	setx	0x3a0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4c020  ! 3428: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
	.word 0xf6a5a108  ! 3429: STWA_I	stwa	%r27, [%r22 + 0x0108] %asi
	.word 0xf6b48020  ! 3430: STHA_R	stha	%r27, [%r18 + %r0] 0x01
T3_asi_reg_wr_165:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 3431: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_wr_166:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 3435: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb234c000  ! 3436: ORN_R	orn 	%r19, %r0, %r25
	.word 0xf42c8000  ! 3437: STB_R	stb	%r26, [%r18 + %r0]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 33)
	.word 0xfa2d0000  ! 3441: STB_R	stb	%r29, [%r20 + %r0]
T3_asi_reg_wr_167:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 3442: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb52ce001  ! 3444: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xfc2d0000  ! 3445: STB_R	stb	%r30, [%r20 + %r0]
cpu_intr_3_257:
	setx	0x39010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d7001  ! 3448: SLLX_I	sllx	%r21, 0x0001, %r25
	.word 0xfa2c4000  ! 3449: STB_R	stb	%r29, [%r17 + %r0]
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_168:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 3452: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf8750000  ! 3454: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xf22d8000  ! 3456: STB_R	stb	%r25, [%r22 + %r0]
T3_asi_reg_wr_169:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 3457: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfc2c0000  ! 3458: STB_R	stb	%r30, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf8ac0020  ! 3462: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf0acc020  ! 3466: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_170:
	mov	0x16, %r14
	.word 0xfcf38e60  ! 3468: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_171:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 3469: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_168:
	mov	0x1, %r14
	.word 0xfedb8e80  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_172:
	mov	0x18, %r14
	.word 0xf4f38e80  ! 3471: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_169:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe2d21e8  ! 3479: STB_I	stb	%r31, [%r20 + 0x01e8]
	.word 0xf8748000  ! 3480: STX_R	stx	%r28, [%r18 + %r0]
T3_asi_reg_wr_173:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 3481: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf0b4c020  ! 3485: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xf4b54020  ! 3486: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b50  ! 3495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
	.word 0xfa25c000  ! 3497: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xf02461a4  ! 3498: STW_I	stw	%r24, [%r17 + 0x01a4]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_258:
	setx	0x380306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_259:
	setx	0x390316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_260:
	setx	0x3b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_170:
	mov	0x2a, %r14
	.word 0xf6db89e0  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_261:
	setx	0x3a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b54020  ! 3511: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	.word 0xf22dc000  ! 3512: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xfa24a014  ! 3514: STW_I	stw	%r29, [%r18 + 0x0014]
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 2)
	.word 0xf2a46046  ! 3517: STWA_I	stwa	%r25, [%r17 + 0x0046] %asi
T3_asi_reg_rd_171:
	mov	0x12, %r14
	.word 0xf4db8e80  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_262:
	setx	0x390317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x3a0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_174:
	mov	0x13, %r14
	.word 0xf8f38e80  ! 3523: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_264:
	setx	0x3b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_265:
	setx	0x3a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89952098  ! 3531: WRPR_TICK_I	wrpr	%r20, 0x0098, %tick
T3_asi_reg_rd_172:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 3532: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xba0c4000  ! 3533: AND_R	and 	%r17, %r0, %r29
	.word 0xf835e1e7  ! 3534: STH_I	sth	%r28, [%r23 + 0x01e7]
	.word 0xf024e063  ! 3535: STW_I	stw	%r24, [%r19 + 0x0063]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_173:
	mov	0x15, %r14
	.word 0xf8db8e40  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf224c000  ! 3540: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xb62d20fc  ! 3542: ANDN_I	andn 	%r20, 0x00fc, %r27
	.word 0xfaac4020  ! 3544: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xf4ade007  ! 3546: STBA_I	stba	%r26, [%r23 + 0x0007] %asi
	.word 0xfead8020  ! 3547: STBA_R	stba	%r31, [%r22 + %r0] 0x01
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 14)
	.word 0xf8b50020  ! 3549: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xf0a44020  ! 3551: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xbb340000  ! 3556: SRL_R	srl 	%r16, %r0, %r29
cpu_intr_3_266:
	setx	0x380120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42de00f  ! 3564: STB_I	stb	%r26, [%r23 + 0x000f]
	.word 0xb0c5c000  ! 3566: ADDCcc_R	addccc 	%r23, %r0, %r24
cpu_intr_3_267:
	setx	0x3b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bda  ! 3570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bda, %hpstate
	.word 0xf0b40020  ! 3572: STHA_R	stha	%r24, [%r16 + %r0] 0x01
T3_asi_reg_wr_175:
	mov	0x29, %r14
	.word 0xf8f389e0  ! 3574: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_174:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf22ce10f  ! 3576: STB_I	stb	%r25, [%r19 + 0x010f]
	ta	T_CHANGE_TO_TL0
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_176:
	mov	0x32, %r14
	.word 0xf2f384a0  ! 3581: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf6ac20f9  ! 3582: STBA_I	stba	%r27, [%r16 + 0x00f9] %asi
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_268:
	setx	0x390129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb6148000  ! 3588: OR_R	or 	%r18, %r0, %r27
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cd0  ! 3590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd0, %hpstate
T3_asi_reg_rd_175:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_269:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_270:
	setx	0x3a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81dc000  ! 3602: XOR_R	xor 	%r23, %r0, %r28
	.word 0xf22d2166  ! 3606: STB_I	stb	%r25, [%r20 + 0x0166]
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, b)
	.word 0xf875a0cd  ! 3608: STX_I	stx	%r28, [%r22 + 0x00cd]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_176:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 3617: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb17d8400  ! 3620: MOVR_R	movre	%r22, %r0, %r24
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e10  ! 3621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
cpu_intr_3_271:
	setx	0x3c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_3_272:
	setx	0x3f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35a1ca  ! 3635: STH_I	sth	%r29, [%r22 + 0x01ca]
T3_asi_reg_wr_177:
	mov	0x15, %r14
	.word 0xf2f38400  ! 3636: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfe2d8000  ! 3637: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xb224e16e  ! 3639: SUB_I	sub 	%r19, 0x016e, %r25
	.word 0xfe7421b9  ! 3644: STX_I	stx	%r31, [%r16 + 0x01b9]
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 35)
	.word 0xf6b5e1a1  ! 3651: STHA_I	stha	%r27, [%r23 + 0x01a1] %asi
	.word 0xfeb50020  ! 3653: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 19)
	.word 0xb834a158  ! 3655: ORN_I	orn 	%r18, 0x0158, %r28
	ta	T_CHANGE_HPRIV
	.word 0xfeb5e17d  ! 3666: STHA_I	stha	%r31, [%r23 + 0x017d] %asi
	.word 0xf834c000  ! 3670: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xfcb50020  ! 3671: STHA_R	stha	%r30, [%r20 + %r0] 0x01
	.word 0xfca4a136  ! 3672: STWA_I	stwa	%r30, [%r18 + 0x0136] %asi
	.word 0xfeb44020  ! 3674: STHA_R	stha	%r31, [%r17 + %r0] 0x01
T3_asi_reg_wr_178:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 3677: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_179:
	mov	0x31, %r14
	.word 0xfef38400  ! 3678: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf235e05c  ! 3679: STH_I	sth	%r25, [%r23 + 0x005c]
	.word 0xf2b48020  ! 3682: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0xbe948000  ! 3683: ORcc_R	orcc 	%r18, %r0, %r31
T3_asi_reg_wr_180:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 3684: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8740000  ! 3685: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfaad8020  ! 3688: STBA_R	stba	%r29, [%r22 + %r0] 0x01
cpu_intr_3_273:
	setx	0x3e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_274:
	setx	0x3e0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_275:
	setx	0x3d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_276:
	setx	0x3c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf2a4202f  ! 3697: STWA_I	stwa	%r25, [%r16 + 0x002f] %asi
	.word 0xb23d8000  ! 3698: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xbd50c000  ! 3699: RDPR_TT	rdpr	%tt, %r30
cpu_intr_3_277:
	setx	0x3c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_278:
	setx	0x3e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_279:
	setx	0x3e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_280:
	setx	0x3d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 3713: STW_R	stw	%r26, [%r17 + %r0]
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 6)
	.word 0xf424609e  ! 3721: STW_I	stw	%r26, [%r17 + 0x009e]
	.word 0xf0240000  ! 3726: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf8acc020  ! 3728: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xf2250000  ! 3729: STW_R	stw	%r25, [%r20 + %r0]
cpu_intr_3_281:
	setx	0x3f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac0020  ! 3733: STBA_R	stba	%r27, [%r16 + %r0] 0x01
T3_asi_reg_wr_181:
	mov	0x1d, %r14
	.word 0xfcf38400  ! 3734: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfa34215e  ! 3735: STH_I	sth	%r29, [%r16 + 0x015e]
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 2)
	.word 0xbaada0a3  ! 3740: ANDNcc_I	andncc 	%r22, 0x00a3, %r29
T3_asi_reg_wr_182:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 3741: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfc2d4000  ! 3745: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf0ad6006  ! 3748: STBA_I	stba	%r24, [%r21 + 0x0006] %asi
cpu_intr_3_282:
	setx	0x3f033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_283:
	setx	0x3d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_284:
	setx	0x3e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_285:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc756193  ! 3759: STX_I	stx	%r30, [%r21 + 0x0193]
cpu_intr_3_286:
	setx	0x3d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc344000  ! 3761: ORN_R	orn 	%r17, %r0, %r30
	.word 0xfc24618c  ! 3767: STW_I	stw	%r30, [%r17 + 0x018c]
T3_asi_reg_wr_183:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 3768: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfc25a1da  ! 3774: STW_I	stw	%r30, [%r22 + 0x01da]
T3_asi_reg_rd_178:
	mov	0x1d, %r14
	.word 0xfcdb8e80  ! 3776: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf6ac4020  ! 3777: STBA_R	stba	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 3778: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf075a1b8  ! 3779: STX_I	stx	%r24, [%r22 + 0x01b8]
cpu_intr_3_287:
	setx	0x3c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 3783: MOVcc_I	<illegal instruction>
	.word 0xf8ad0020  ! 3784: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	.word 0xfc24e03d  ! 3785: STW_I	stw	%r30, [%r19 + 0x003d]
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 36)
	.word 0xfe75a146  ! 3787: STX_I	stx	%r31, [%r22 + 0x0146]
T3_asi_reg_wr_184:
	mov	0x1c, %r14
	.word 0xf2f38400  ! 3790: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfab42101  ! 3791: STHA_I	stha	%r29, [%r16 + 0x0101] %asi
T3_asi_reg_rd_180:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_288:
	setx	0x3e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_289:
	setx	0x3d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_181:
	mov	0x30, %r14
	.word 0xf0db8e80  ! 3796: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc2d8000  ! 3799: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf8348000  ! 3800: STH_R	sth	%r28, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_185:
	mov	0x12, %r14
	.word 0xf2f38400  ! 3803: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3500000  ! 3805: RDPR_TPC	<illegal instruction>
cpu_intr_3_290:
	setx	0x3e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_291:
	setx	0x3d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a4c020  ! 3812: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_186:
	mov	0x13, %r14
	.word 0xf6f38e60  ! 3814: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 29)
	.word 0xbf3c2001  ! 3820: SRA_I	sra 	%r16, 0x0001, %r31
T3_asi_reg_wr_187:
	mov	0x37, %r14
	.word 0xf4f38e60  ! 3822: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_292:
	setx	0x3e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_293:
	setx	0x3c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce1a0  ! 3830: STB_I	stb	%r27, [%r19 + 0x01a0]
	.word 0xf42c20a4  ! 3834: STB_I	stb	%r26, [%r16 + 0x00a4]
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf8a52075  ! 3836: STWA_I	stwa	%r28, [%r20 + 0x0075] %asi
T3_asi_reg_rd_182:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf8adc020  ! 3839: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xfe24a046  ! 3840: STW_I	stw	%r31, [%r18 + 0x0046]
	.word 0xb92d9000  ! 3841: SLLX_R	sllx	%r22, %r0, %r28
T3_asi_reg_rd_183:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb4858000  ! 3844: ADDcc_R	addcc 	%r22, %r0, %r26
cpu_intr_3_294:
	setx	0x3e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5c020  ! 3846: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
cpu_intr_3_295:
	setx	0x3d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_296:
	setx	0x3f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_297:
	setx	0x3f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a420c1  ! 3853: STWA_I	stwa	%r25, [%r16 + 0x00c1] %asi
T3_asi_reg_wr_188:
	mov	0x13, %r14
	.word 0xfef384a0  ! 3855: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb805c000  ! 3856: ADD_R	add 	%r23, %r0, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf0ad8020  ! 3864: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xb2c4616c  ! 3865: ADDCcc_I	addccc 	%r17, 0x016c, %r25
	.word 0xfe740000  ! 3868: STX_R	stx	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, b)
	.word 0xf2f5e059  ! 3880: STXA_I	stxa	%r25, [%r23 + 0x0059] %asi
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 35)
	.word 0xf0a44020  ! 3885: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
T3_asi_reg_rd_184:
	mov	0x35, %r14
	.word 0xf6db89e0  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf8acc020  ! 3888: STBA_R	stba	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_185:
	mov	0x2, %r14
	.word 0xf8db89e0  ! 3892: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfaa48020  ! 3894: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 30)
	.word 0xb085a059  ! 3898: ADDcc_I	addcc 	%r22, 0x0059, %r24
	.word 0xb4358000  ! 3899: ORN_R	orn 	%r22, %r0, %r26
cpu_intr_3_298:
	setx	0x3f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_189:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 3901: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_299:
	setx	0x3c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_300:
	setx	0x3d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_301:
	setx	0x3f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf67461e7  ! 3910: STX_I	stx	%r27, [%r17 + 0x01e7]
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_186:
	mov	0x19, %r14
	.word 0xfcdb8400  ! 3915: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_rd_187:
	mov	0x5, %r14
	.word 0xfcdb89e0  ! 3917: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_rd_188:
	mov	0x1a, %r14
	.word 0xf8db89e0  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_190:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 3922: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_191:
	mov	0x29, %r14
	.word 0xfaf38e60  ! 3926: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_rd_189:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_302:
	setx	0x3c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac4020  ! 3931: STBA_R	stba	%r29, [%r17 + %r0] 0x01
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 16)
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
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a80  ! 3937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
	.word 0xf0240000  ! 3941: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfa2c609d  ! 3944: STB_I	stb	%r29, [%r17 + 0x009d]
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_303:
	setx	0x3d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_192:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 3956: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfeac61ed  ! 3957: STBA_I	stba	%r31, [%r17 + 0x01ed] %asi
cpu_intr_3_304:
	setx	0x3c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_305:
	setx	0x3e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3cc000  ! 3962: SRA_R	sra 	%r19, %r0, %r30
T3_asi_reg_wr_193:
	mov	0x29, %r14
	.word 0xfcf384a0  ! 3964: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_194:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 3970: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_190:
	mov	0x6, %r14
	.word 0xf4db8e80  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_rd_191:
	mov	0x9, %r14
	.word 0xfcdb8e60  ! 3975: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf4a460cb  ! 3976: STWA_I	stwa	%r26, [%r17 + 0x00cb] %asi
	.word 0xf4b4a061  ! 3978: STHA_I	stha	%r26, [%r18 + 0x0061] %asi
T3_asi_reg_rd_192:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfeb4208c  ! 3980: STHA_I	stha	%r31, [%r16 + 0x008c] %asi
	.word 0xf224a1d9  ! 3981: STW_I	stw	%r25, [%r18 + 0x01d9]
	.word 0xfcb4c020  ! 3983: STHA_R	stha	%r30, [%r19 + %r0] 0x01
cpu_intr_3_306:
	setx	0x3c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_193:
	mov	0x2f, %r14
	.word 0xf8db8e60  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfcf5a05e  ! 3996: STXA_I	stxa	%r30, [%r22 + 0x005e] %asi
T3_asi_reg_wr_195:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 4000: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc2d0000  ! 4001: STB_R	stb	%r30, [%r20 + %r0]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, e)
	.word 0xbe15c000  ! 4003: OR_R	or 	%r23, %r0, %r31
	.word 0xf435e151  ! 4004: STH_I	sth	%r26, [%r23 + 0x0151]
	.word 0xfa75c000  ! 4005: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xfea5e14b  ! 4006: STWA_I	stwa	%r31, [%r23 + 0x014b] %asi
cpu_intr_3_307:
	setx	0x3e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa346080  ! 4010: STH_I	sth	%r29, [%r17 + 0x0080]
T3_asi_reg_rd_194:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_196:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 4016: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfc342051  ! 4017: STH_I	sth	%r30, [%r16 + 0x0051]
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 25)
	.word 0xf82cc000  ! 4019: STB_R	stb	%r28, [%r19 + %r0]
cpu_intr_3_308:
	setx	0x3f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4c020  ! 4022: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xf2248000  ! 4027: STW_R	stw	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1518000  ! 4031: RDPR_PSTATE	rdpr	%pstate, %r24
T3_asi_reg_wr_197:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 4032: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_309:
	setx	0x3c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0340000  ! 4034: STH_R	sth	%r24, [%r16 + %r0]
cpu_intr_3_310:
	setx	0x3e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf035c000  ! 4040: STH_R	sth	%r24, [%r23 + %r0]
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_311:
	setx	0x3c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_198:
	mov	0x2, %r14
	.word 0xf4f389e0  ! 4050: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_312:
	setx	0x3c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6744000  ! 4054: STX_R	stx	%r27, [%r17 + %r0]
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_313:
	setx	0x3f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674c000  ! 4071: STX_R	stx	%r27, [%r19 + %r0]
T3_asi_reg_wr_199:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 4072: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_200:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 4074: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_314:
	setx	0x3f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 38)
	.word 0xfab52143  ! 4079: STHA_I	stha	%r29, [%r20 + 0x0143] %asi
	.word 0xb8bda16a  ! 4082: XNORcc_I	xnorcc 	%r22, 0x016a, %r28
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_201:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 4093: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 39)
	.word 0xb694a086  ! 4096: ORcc_I	orcc 	%r18, 0x0086, %r27
cpu_intr_3_315:
	setx	0x43012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_316:
	setx	0x410105, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_195:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_196:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_317:
	setx	0x420215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6248000  ! 4109: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf62c4000  ! 4110: STB_R	stb	%r27, [%r17 + %r0]
cpu_intr_3_318:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_197:
	mov	0x8, %r14
	.word 0xf2db84a0  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_319:
	setx	0x410135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_202:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 4122: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf024211b  ! 4127: STW_I	stw	%r24, [%r16 + 0x011b]
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfaf5a063  ! 4130: STXA_I	stxa	%r29, [%r22 + 0x0063] %asi
	.word 0xf4ac6162  ! 4135: STBA_I	stba	%r26, [%r17 + 0x0162] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 33)
	.word 0xfaad204a  ! 4151: STBA_I	stba	%r29, [%r20 + 0x004a] %asi
T3_asi_reg_rd_198:
	mov	0x27, %r14
	.word 0xf6db84a0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_wr_203:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 4154: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_320:
	setx	0x400312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_321:
	setx	0x400324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa54020  ! 4161: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
cpu_intr_3_322:
	setx	0x420232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb1358000  ! 4165: SRL_R	srl 	%r22, %r0, %r24
	.word 0xf6ac4020  ! 4167: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xf6f560e8  ! 4171: STXA_I	stxa	%r27, [%r21 + 0x00e8] %asi
cpu_intr_3_323:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 2)
	.word 0xf42cc000  ! 4176: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xb1348000  ! 4177: SRL_R	srl 	%r18, %r0, %r24
cpu_intr_3_324:
	setx	0x430236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_204:
	mov	0x17, %r14
	.word 0xfef38e60  ! 4182: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf4a4e032  ! 4184: STWA_I	stwa	%r26, [%r19 + 0x0032] %asi
	.word 0xfa3560bb  ! 4187: STH_I	sth	%r29, [%r21 + 0x00bb]
cpu_intr_3_325:
	setx	0x43013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4613b  ! 4189: STWA_I	stwa	%r25, [%r17 + 0x013b] %asi
T3_asi_reg_rd_199:
	mov	0x38, %r14
	.word 0xf2db89e0  ! 4190: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_205:
	mov	0x32, %r14
	.word 0xf2f38e60  ! 4191: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_206:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 4192: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc75c000  ! 4193: STX_R	stx	%r30, [%r23 + %r0]
cpu_intr_3_326:
	setx	0x42022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 0)
	.word 0xf6a5c020  ! 4205: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xf4f561d7  ! 4207: STXA_I	stxa	%r26, [%r21 + 0x01d7] %asi
cpu_intr_3_327:
	setx	0x41012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c40  ! 4212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c40, %hpstate
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d10  ! 4215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d10, %hpstate
T3_asi_reg_wr_207:
	mov	0x1e, %r14
	.word 0xf0f389e0  ! 4216: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8742063  ! 4217: STX_I	stx	%r28, [%r16 + 0x0063]
cpu_intr_3_328:
	setx	0x420210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_329:
	setx	0x42022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_200:
	mov	0xd, %r14
	.word 0xf8db8400  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 37)
	.word 0xfe34e037  ! 4226: STH_I	sth	%r31, [%r19 + 0x0037]
	.word 0xb8848000  ! 4229: ADDcc_R	addcc 	%r18, %r0, %r28
	.word 0xfc754000  ! 4231: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfe244000  ! 4233: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf8adc020  ! 4235: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_330:
	setx	0x420106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819461ab  ! 4241: WRPR_TPC_I	wrpr	%r17, 0x01ab, %tpc
	.word 0xf02dc000  ! 4243: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf2b44020  ! 4244: STHA_R	stha	%r25, [%r17 + %r0] 0x01
T3_asi_reg_rd_201:
	mov	0x28, %r14
	.word 0xf6db8e60  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf434a127  ! 4248: STH_I	sth	%r26, [%r18 + 0x0127]
	.word 0xf475e1e9  ! 4249: STX_I	stx	%r26, [%r23 + 0x01e9]
	.word 0xfc344000  ! 4250: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfea4a0d0  ! 4252: STWA_I	stwa	%r31, [%r18 + 0x00d0] %asi
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, f)
	.word 0xf035214a  ! 4256: STH_I	sth	%r24, [%r20 + 0x014a]
	.word 0xf22d8000  ! 4258: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf4f5a08a  ! 4261: STXA_I	stxa	%r26, [%r22 + 0x008a] %asi
	.word 0xbf35d000  ! 4262: SRLX_R	srlx	%r23, %r0, %r31
cpu_intr_3_331:
	setx	0x400029, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_208:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 4265: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_202:
	mov	0x1e, %r14
	.word 0xf2db8e80  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_203:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb22ca193  ! 4270: ANDN_I	andn 	%r18, 0x0193, %r25
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 3)
	.word 0xf2b5608f  ! 4273: STHA_I	stha	%r25, [%r21 + 0x008f] %asi
	.word 0xfca44020  ! 4275: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 31)
	.word 0xf8a40020  ! 4279: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
T3_asi_reg_rd_204:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf825c000  ! 4283: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf4ad8020  ! 4284: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xfaac8020  ! 4285: STBA_R	stba	%r29, [%r18 + %r0] 0x01
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, b)
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_332:
	setx	0x430222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d0000  ! 4294: STB_R	stb	%r31, [%r20 + %r0]
T3_asi_reg_wr_209:
	mov	0x2, %r14
	.word 0xfaf38e60  ! 4295: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_333:
	setx	0x43032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_334:
	setx	0x400021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5e029  ! 4302: STXA_I	stxa	%r26, [%r23 + 0x0029] %asi
	.word 0xbcb48000  ! 4303: SUBCcc_R	orncc 	%r18, %r0, %r30
T3_asi_reg_wr_210:
	mov	0x2f, %r14
	.word 0xfcf389e0  ! 4309: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf6ac21a7  ! 4311: STBA_I	stba	%r27, [%r16 + 0x01a7] %asi
	.word 0xfe350000  ! 4312: STH_R	sth	%r31, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
	.word 0xf4ad4020  ! 4321: STBA_R	stba	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_211:
	mov	0x24, %r14
	.word 0xf2f384a0  ! 4322: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_335:
	setx	0x43033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24a13c  ! 4325: STW_I	stw	%r31, [%r18 + 0x013c]
	.word 0xfc24c000  ! 4326: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf2b4215d  ! 4328: STHA_I	stha	%r25, [%r16 + 0x015d] %asi
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_336:
	setx	0x41033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_212:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 4334: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf0b56095  ! 4338: STHA_I	stha	%r24, [%r21 + 0x0095] %asi
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_TO_TL1
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa75218b  ! 4344: STX_I	stx	%r29, [%r20 + 0x018b]
	.word 0xf0f5e1f3  ! 4345: STXA_I	stxa	%r24, [%r23 + 0x01f3] %asi
	.word 0xfe34e1ec  ! 4346: STH_I	sth	%r31, [%r19 + 0x01ec]
	ta	T_CHANGE_HPRIV
cpu_intr_3_337:
	setx	0x40030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d8000  ! 4349: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf82c0000  ! 4355: STB_R	stb	%r28, [%r16 + %r0]
T3_asi_reg_rd_205:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_338:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x430327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 28)
	.word 0xf425a01c  ! 4367: STW_I	stw	%r26, [%r22 + 0x001c]
	.word 0xf8b5c020  ! 4368: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xb8bca119  ! 4371: XNORcc_I	xnorcc 	%r18, 0x0119, %r28
cpu_intr_3_340:
	setx	0x430005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_206:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 4376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb69d4000  ! 4377: XORcc_R	xorcc 	%r21, %r0, %r27
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 8)
	.word 0xf82d0000  ! 4381: STB_R	stb	%r28, [%r20 + %r0]
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 29)
	.word 0xf475c000  ! 4384: STX_R	stx	%r26, [%r23 + %r0]
cpu_intr_3_341:
	setx	0x430216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_342:
	setx	0x43021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_343:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_207:
	mov	0x5, %r14
	.word 0xfedb8400  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb6b58000  ! 4396: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xf2a5e05c  ! 4397: STWA_I	stwa	%r25, [%r23 + 0x005c] %asi
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_344:
	setx	0x430204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_345:
	setx	0x400202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_213:
	mov	0x1e, %r14
	.word 0xf2f384a0  ! 4406: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf63521a6  ! 4408: STH_I	sth	%r27, [%r20 + 0x01a6]
cpu_intr_3_346:
	setx	0x43020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_208:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_3_347:
	setx	0x400211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad0020  ! 4421: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	.word 0xfe75a09e  ! 4427: STX_I	stx	%r31, [%r22 + 0x009e]
	.word 0xf275606e  ! 4429: STX_I	stx	%r25, [%r21 + 0x006e]
T3_asi_reg_rd_209:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfe25603e  ! 4432: STW_I	stw	%r31, [%r21 + 0x003e]
T3_asi_reg_wr_214:
	mov	0x32, %r14
	.word 0xf0f38e60  ! 4433: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf8a58020  ! 4434: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
	.word 0xf2ad0020  ! 4435: STBA_R	stba	%r25, [%r20 + %r0] 0x01
cpu_intr_3_348:
	setx	0x430234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f52023  ! 4437: STXA_I	stxa	%r26, [%r20 + 0x0023] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a46075  ! 4441: STWA_I	stwa	%r27, [%r17 + 0x0075] %asi
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a08  ! 4442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a08, %hpstate
	.word 0xf22d8000  ! 4444: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xfea421f0  ! 4445: STWA_I	stwa	%r31, [%r16 + 0x01f0] %asi
cpu_intr_3_349:
	setx	0x410335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4244000  ! 4448: SUB_R	sub 	%r17, %r0, %r26
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_215:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4450: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_216:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 4451: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_217:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 4453: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb63ce138  ! 4454: XNOR_I	xnor 	%r19, 0x0138, %r27
	.word 0xb8ac4000  ! 4456: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xb4954000  ! 4458: ORcc_R	orcc 	%r21, %r0, %r26
cpu_intr_3_350:
	setx	0x41013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_218:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 4460: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf6b420fb  ! 4462: STHA_I	stha	%r27, [%r16 + 0x00fb] %asi
	.word 0xf624a186  ! 4464: STW_I	stw	%r27, [%r18 + 0x0186]
cpu_intr_3_351:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674a0fb  ! 4468: STX_I	stx	%r27, [%r18 + 0x00fb]
	.word 0xfea48020  ! 4470: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xfca54020  ! 4471: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_219:
	mov	0xc, %r14
	.word 0xf8f384a0  ! 4474: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa344000  ! 4476: STH_R	sth	%r29, [%r17 + %r0]
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 0)
	.word 0xfc24e1b5  ! 4479: STW_I	stw	%r30, [%r19 + 0x01b5]
	.word 0xfab560ed  ! 4480: STHA_I	stha	%r29, [%r21 + 0x00ed] %asi
	.word 0xbd643801  ! 4484: MOVcc_I	<illegal instruction>
	.word 0xf6242156  ! 4488: STW_I	stw	%r27, [%r16 + 0x0156]
	.word 0xf4a4206c  ! 4489: STWA_I	stwa	%r26, [%r16 + 0x006c] %asi
cpu_intr_3_352:
	setx	0x410216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03420a0  ! 4495: STH_I	sth	%r24, [%r16 + 0x00a0]
T3_asi_reg_wr_220:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 4497: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa350000  ! 4498: STH_R	sth	%r29, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_353:
	setx	0x40020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074200a  ! 4503: STX_I	stx	%r24, [%r16 + 0x000a]
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 1b)
	.word 0x8594a1ab  ! 4506: WRPR_TSTATE_I	wrpr	%r18, 0x01ab, %tstate
	.word 0xf8ac6168  ! 4515: STBA_I	stba	%r28, [%r17 + 0x0168] %asi
	.word 0xfe35c000  ! 4516: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb350c000  ! 4518: RDPR_TT	rdpr	%tt, %r25
	.word 0xf6ac6152  ! 4519: STBA_I	stba	%r27, [%r17 + 0x0152] %asi
	.word 0xfe34a1a3  ! 4524: STH_I	sth	%r31, [%r18 + 0x01a3]
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 11)
	.word 0xf8a50020  ! 4533: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xfc24e056  ! 4534: STW_I	stw	%r30, [%r19 + 0x0056]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_210:
	mov	0x2d, %r14
	.word 0xfadb89e0  ! 4537: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9520000  ! 4539: RDPR_PIL	<illegal instruction>
T3_asi_reg_rd_211:
	mov	0x27, %r14
	.word 0xf4db8400  ! 4541: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 37)
	.word 0xf6a48020  ! 4543: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
T3_asi_reg_rd_212:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_354:
	setx	0x410339, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_221:
	mov	0x11, %r14
	.word 0xf2f38400  ! 4549: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf8f561ae  ! 4550: STXA_I	stxa	%r28, [%r21 + 0x01ae] %asi
	.word 0xb635201a  ! 4551: ORN_I	orn 	%r20, 0x001a, %r27
T3_asi_reg_wr_222:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 4554: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0b5e02a  ! 4557: STHA_I	stha	%r24, [%r23 + 0x002a] %asi
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_355:
	setx	0x450228, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbcc50000  ! 4563: ADDCcc_R	addccc 	%r20, %r0, %r30
	.word 0xb52c7001  ! 4564: SLLX_I	sllx	%r17, 0x0001, %r26
cpu_intr_3_356:
	setx	0x440206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_357:
	setx	0x45032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_358:
	setx	0x440326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25216c  ! 4569: STW_I	stw	%r31, [%r20 + 0x016c]
	.word 0xf2b58020  ! 4570: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	.word 0xf0ac20e9  ! 4571: STBA_I	stba	%r24, [%r16 + 0x00e9] %asi
	.word 0xb41da01c  ! 4574: XOR_I	xor 	%r22, 0x001c, %r26
	.word 0xb2b48000  ! 4575: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xf02c614d  ! 4577: STB_I	stb	%r24, [%r17 + 0x014d]
T3_asi_reg_wr_223:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 4579: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb635a092  ! 4584: ORN_I	orn 	%r22, 0x0092, %r27
	.word 0xfc2da113  ! 4585: STB_I	stb	%r30, [%r22 + 0x0113]
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 27)
	.word 0xfe744000  ! 4589: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf22c6167  ! 4590: STB_I	stb	%r25, [%r17 + 0x0167]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6b40000  ! 4597: ORNcc_R	orncc 	%r16, %r0, %r27
	.word 0xb9358000  ! 4601: SRL_R	srl 	%r22, %r0, %r28
	.word 0xb6840000  ! 4602: ADDcc_R	addcc 	%r16, %r0, %r27
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a5a  ! 4606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5a, %hpstate
	.word 0xf4a54020  ! 4610: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 30)
	.word 0xb885e102  ! 4616: ADDcc_I	addcc 	%r23, 0x0102, %r28
	.word 0xfe2cc000  ! 4620: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xfc2d8000  ! 4622: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfa25c000  ! 4623: STW_R	stw	%r29, [%r23 + %r0]
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_213:
	mov	0x23, %r14
	.word 0xfedb8e80  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_214:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_224:
	mov	0x1e, %r14
	.word 0xf4f389e0  ! 4641: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_215:
	mov	0x18, %r14
	.word 0xf0db8400  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfa2c8000  ! 4643: STB_R	stb	%r29, [%r18 + %r0]
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_NONHPRIV
	.word 0xb09cc000  ! 4646: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xfea44020  ! 4647: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
cpu_intr_3_359:
	setx	0x450325, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e80  ! 4653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb60da0d2  ! 4655: AND_I	and 	%r22, 0x00d2, %r27
	.word 0xf2f56138  ! 4658: STXA_I	stxa	%r25, [%r21 + 0x0138] %asi
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 18)
	.word 0xf62cc000  ! 4662: STB_R	stb	%r27, [%r19 + %r0]
cpu_intr_3_360:
	setx	0x450128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_216:
	mov	0x23, %r14
	.word 0xfadb8400  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_rd_217:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 4672: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_225:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 4678: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_361:
	setx	0x450329, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_218:
	mov	0xc, %r14
	.word 0xfedb8e60  ! 4680: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_219:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfcb4e03d  ! 4687: STHA_I	stha	%r30, [%r19 + 0x003d] %asi
T3_asi_reg_rd_220:
	mov	0x2c, %r14
	.word 0xf6db8e40  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc754000  ! 4693: STX_R	stx	%r30, [%r21 + %r0]
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 8)
	.word 0xf0ac6168  ! 4698: STBA_I	stba	%r24, [%r17 + 0x0168] %asi
	.word 0xfcad20f5  ! 4701: STBA_I	stba	%r30, [%r20 + 0x00f5] %asi
	.word 0xfea521f7  ! 4704: STWA_I	stwa	%r31, [%r20 + 0x01f7] %asi
	.word 0xb1641800  ! 4705: MOVcc_R	<illegal instruction>
	.word 0xf83460f5  ! 4710: STH_I	sth	%r28, [%r17 + 0x00f5]
	.word 0xf0f4206c  ! 4712: STXA_I	stxa	%r24, [%r16 + 0x006c] %asi
	.word 0xf0b5c020  ! 4713: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xb225e12e  ! 4716: SUB_I	sub 	%r23, 0x012e, %r25
T3_asi_reg_wr_226:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 4720: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf8a5c020  ! 4721: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	.word 0xb40c6194  ! 4722: AND_I	and 	%r17, 0x0194, %r26
T3_asi_reg_rd_221:
	mov	0x31, %r14
	.word 0xf6db84a0  ! 4723: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_362:
	setx	0x460002, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_227:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 4729: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_228:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 4730: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 5)
	.word 0xb03ca144  ! 4732: XNOR_I	xnor 	%r18, 0x0144, %r24
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d8a  ! 4735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8a, %hpstate
T3_asi_reg_rd_222:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 4738: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_229:
	mov	0x25, %r14
	.word 0xf2f38e60  ! 4739: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf02d202b  ! 4741: STB_I	stb	%r24, [%r20 + 0x002b]
	.word 0xfc24e0b4  ! 4747: STW_I	stw	%r30, [%r19 + 0x00b4]
cpu_intr_3_363:
	setx	0x450208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74a1c4  ! 4752: STX_I	stx	%r29, [%r18 + 0x01c4]
T3_asi_reg_wr_230:
	mov	0x2c, %r14
	.word 0xfef38e60  ! 4753: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6b5c020  ! 4761: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xf834e0e3  ! 4765: STH_I	sth	%r28, [%r19 + 0x00e3]
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c10  ! 4768: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
cpu_intr_3_364:
	setx	0x46031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434e032  ! 4774: STH_I	sth	%r26, [%r19 + 0x0032]
	.word 0xf6340000  ! 4776: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf8752082  ! 4777: STX_I	stx	%r28, [%r20 + 0x0082]
	.word 0xba1c4000  ! 4780: XOR_R	xor 	%r17, %r0, %r29
cpu_intr_3_365:
	setx	0x460311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_231:
	mov	0x11, %r14
	.word 0xfef389e0  ! 4790: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_366:
	setx	0x47022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a58000  ! 4793: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0xb62ca186  ! 4798: ANDN_I	andn 	%r18, 0x0186, %r27
cpu_intr_3_367:
	setx	0x440337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 5)
	.word 0xf4758000  ! 4806: STX_R	stx	%r26, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_368:
	setx	0x450330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_232:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 4818: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf075613a  ! 4820: STX_I	stx	%r24, [%r21 + 0x013a]
	.word 0xf074e1a6  ! 4823: STX_I	stx	%r24, [%r19 + 0x01a6]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 28)
	.word 0xb5500000  ! 4828: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf6b44020  ! 4829: STHA_R	stha	%r27, [%r17 + %r0] 0x01
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_369:
	setx	0x450328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674c000  ! 4833: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xbe9d0000  ! 4834: XORcc_R	xorcc 	%r20, %r0, %r31
cpu_intr_3_370:
	setx	0x44030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025e157  ! 4838: STW_I	stw	%r24, [%r23 + 0x0157]
	.word 0xf6a50020  ! 4840: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_371:
	setx	0x450115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 30)
	.word 0xfa35c000  ! 4852: STH_R	sth	%r29, [%r23 + %r0]
T3_asi_reg_rd_223:
	mov	0x32, %r14
	.word 0xf8db8e60  ! 4854: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_372:
	setx	0x450009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_373:
	setx	0x450307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004c000  ! 4859: ADD_R	add 	%r19, %r0, %r24
	.word 0xfc758000  ! 4861: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_rd_224:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_374:
	setx	0x450038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, 3f)
	.word 0xbc24a1b8  ! 4870: SUB_I	sub 	%r18, 0x01b8, %r30
	.word 0xf62461a1  ! 4871: STW_I	stw	%r27, [%r17 + 0x01a1]
	.word 0xfe34a003  ! 4872: STH_I	sth	%r31, [%r18 + 0x0003]
T3_asi_reg_rd_225:
	mov	0xb, %r14
	.word 0xf2db8400  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf035e078  ! 4874: STH_I	sth	%r24, [%r23 + 0x0078]
cpu_intr_3_375:
	setx	0x450014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 4877: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf834c000  ! 4880: STH_R	sth	%r28, [%r19 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b52097  ! 4884: STHA_I	stha	%r25, [%r20 + 0x0097] %asi
	.word 0xfa2521ab  ! 4887: STW_I	stw	%r29, [%r20 + 0x01ab]
	.word 0xf62d20ef  ! 4888: STB_I	stb	%r27, [%r20 + 0x00ef]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
iob_intr_3_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_406), 16, 16)) -> intp(3, 0, 5)
	.word 0xf0f4e0e2  ! 4894: STXA_I	stxa	%r24, [%r19 + 0x00e2] %asi
T3_asi_reg_wr_233:
	mov	0x1b, %r14
	.word 0xf6f384a0  ! 4895: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_407), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_376:
	setx	0x470329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac60c8  ! 4899: STBA_I	stba	%r27, [%r17 + 0x00c8] %asi
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c9a  ! 4900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9a, %hpstate
cpu_intr_3_377:
	setx	0x450114, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_234:
	mov	0x26, %r14
	.word 0xf0f384a0  ! 4902: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_235:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4903: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf62521f8  ! 4904: STW_I	stw	%r27, [%r20 + 0x01f8]
	.word 0xfc744000  ! 4905: STX_R	stx	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_236:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 4911: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_378:
	setx	0x440307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02da04c  ! 4914: STB_I	stb	%r24, [%r22 + 0x004c]
iob_intr_3_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_408), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_409), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_379:
	setx	0x460230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235c000  ! 4921: STH_R	sth	%r25, [%r23 + %r0]
T3_asi_reg_wr_237:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 4925: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_410), 16, 16)) -> intp(3, 0, 9)
	.word 0xf02cc000  ! 4932: STB_R	stb	%r24, [%r19 + %r0]
T3_asi_reg_wr_238:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 4934: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_226:
	mov	0x14, %r14
	.word 0xf2db89e0  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5510000  ! 4944: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb21c8000  ! 4945: XOR_R	xor 	%r18, %r0, %r25
cpu_intr_3_380:
	setx	0x47000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_227:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 4948: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_411), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_381:
	setx	0x44002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5611b  ! 4952: STXA_I	stxa	%r31, [%r21 + 0x011b] %asi
iob_intr_3_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_412), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf8b5616c  ! 4955: STHA_I	stha	%r28, [%r21 + 0x016c] %asi
iob_intr_3_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_413), 16, 16)) -> intp(3, 0, 18)
	.word 0xfe7520c9  ! 4960: STX_I	stx	%r31, [%r20 + 0x00c9]
	.word 0xfc2d0000  ! 4961: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf275c000  ! 4963: STX_R	stx	%r25, [%r23 + %r0]
T3_asi_reg_wr_239:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 4968: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_382:
	setx	0x460222, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819838d2  ! 4972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d2, %hpstate
	.word 0xf834a131  ! 4973: STH_I	sth	%r28, [%r18 + 0x0131]
cpu_intr_3_383:
	setx	0x46021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_384:
	setx	0x450123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37dc400  ! 4979: MOVR_R	movre	%r23, %r0, %r25
	.word 0xbe1c4000  ! 4980: XOR_R	xor 	%r17, %r0, %r31
cpu_intr_3_385:
	setx	0x46020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_414), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2adc020  ! 4987: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xf474e1ac  ! 4989: STX_I	stx	%r26, [%r19 + 0x01ac]
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d80  ! 4990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_240:
	mov	0x23, %r14
	.word 0xf8f38e80  ! 4993: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf02d2193  ! 4995: STB_I	stb	%r24, [%r20 + 0x0193]
cpu_intr_3_386:
	setx	0x47001a, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xfcd56149  ! 1: LDSHA_I	ldsha	[%r21, + 0x0149] %asi, %r30
	.word 0xf64cc000  ! 3: LDSB_R	ldsb	[%r19 + %r0], %r27
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_0:
	setx	0x1a0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd357001  ! 9: SRLX_I	srlx	%r21, 0x0001, %r30
T2_asi_reg_wr_0:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 13: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_0:
	mov	0xc, %r14
	.word 0xfcdb8400  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf6cca106  ! 17: LDSBA_I	ldsba	[%r18, + 0x0106] %asi, %r27
T2_asi_reg_wr_1:
	mov	0x23, %r14
	.word 0xfef384a0  ! 18: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfc148000  ! 20: LDUH_R	lduh	[%r18 + %r0], %r30
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_HPRIV
	.word 0xf65c2023  ! 26: LDX_I	ldx	[%r16 + 0x0023], %r27
T2_asi_reg_wr_2:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 27: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_1:
	setx	0x1e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60d8000  ! 35: LDUB_R	ldub	[%r22 + %r0], %r27
T2_asi_reg_wr_3:
	mov	0xf, %r14
	.word 0xf6f389e0  ! 36: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf28cc020  ! 38: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
cpu_intr_2_2:
	setx	0x1d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_4:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 47: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0cd20d7  ! 48: LDSBA_I	ldsba	[%r20, + 0x00d7] %asi, %r24
	.word 0xf6c44020  ! 49: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
	.word 0xf40521d8  ! 51: LDUW_I	lduw	[%r20 + 0x01d8], %r26
	.word 0xbc0ca176  ! 54: AND_I	and 	%r18, 0x0176, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_3:
	setx	0x1c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c98  ! 59: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c98, %hpstate
	.word 0xf644215c  ! 61: LDSW_I	ldsw	[%r16 + 0x015c], %r27
cpu_intr_2_4:
	setx	0x1d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe558000  ! 64: LDSH_R	ldsh	[%r22 + %r0], %r31
cpu_intr_2_5:
	setx	0x1f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_5:
	mov	0x14, %r14
	.word 0xfaf38400  ! 69: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_1:
	mov	0xa, %r14
	.word 0xf0db8e80  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf6844020  ! 78: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
	.word 0xf694e0cb  ! 80: LDUHA_I	lduha	[%r19, + 0x00cb] %asi, %r27
	.word 0xf65c614e  ! 81: LDX_I	ldx	[%r17 + 0x014e], %r27
	.word 0xb29d0000  ! 82: XORcc_R	xorcc 	%r20, %r0, %r25
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 25)
	.word 0xfa4cc000  ! 88: LDSB_R	ldsb	[%r19 + %r0], %r29
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_2:
	mov	0x27, %r14
	.word 0xf0db8e80  ! 91: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe0c8000  ! 95: LDUB_R	ldub	[%r18 + %r0], %r31
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_3:
	mov	0x1, %r14
	.word 0xfedb89e0  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_4:
	mov	0x16, %r14
	.word 0xf4db8e60  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf615603b  ! 101: LDUH_I	lduh	[%r21 + 0x003b], %r27
cpu_intr_2_6:
	setx	0x1f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xbeaca07d  ! 105: ANDNcc_I	andncc 	%r18, 0x007d, %r31
T2_asi_reg_wr_6:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 106: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_7:
	setx	0x1e010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 39)
	.word 0xf4140000  ! 116: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xf6cd4020  ! 117: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_7:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 119: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb17d8400  ! 120: MOVR_R	movre	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_5:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1347001  ! 128: SRLX_I	srlx	%r17, 0x0001, %r24
	.word 0xfe8c21f6  ! 130: LDUBA_I	lduba	[%r16, + 0x01f6] %asi, %r31
cpu_intr_2_8:
	setx	0x1c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf2d521b0  ! 135: LDSHA_I	ldsha	[%r20, + 0x01b0] %asi, %r25
T2_asi_reg_wr_8:
	mov	0x31, %r14
	.word 0xf6f389e0  ! 137: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf845e113  ! 138: LDSW_I	ldsw	[%r23 + 0x0113], %r28
	.word 0xfc0c0000  ! 139: LDUB_R	ldub	[%r16 + %r0], %r30
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_6:
	mov	0x1e, %r14
	.word 0xfadb84a0  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbc34e118  ! 147: SUBC_I	orn 	%r19, 0x0118, %r30
	.word 0xfc95209d  ! 149: LDUHA_I	lduha	[%r20, + 0x009d] %asi, %r30
cpu_intr_2_9:
	setx	0x1e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d8000  ! 152: LDSB_R	ldsb	[%r22 + %r0], %r31
	.word 0xfcd56036  ! 153: LDSHA_I	ldsha	[%r21, + 0x0036] %asi, %r30
	.word 0xfe550000  ! 154: LDSH_R	ldsh	[%r20 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe954000  ! 158: ORcc_R	orcc 	%r21, %r0, %r31
	.word 0xf20dc000  ! 160: LDUB_R	ldub	[%r23 + %r0], %r25
cpu_intr_2_10:
	setx	0x1f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_11:
	setx	0x1d0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_12:
	setx	0x1e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_13:
	setx	0x1c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4c54020  ! 177: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
T2_asi_reg_wr_9:
	mov	0x1c, %r14
	.word 0xfaf389e0  ! 181: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6458000  ! 182: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf64d609f  ! 186: LDSB_I	ldsb	[%r21 + 0x009f], %r27
	.word 0xf2548000  ! 189: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf25d0000  ! 193: LDX_R	ldx	[%r20 + %r0], %r25
cpu_intr_2_14:
	setx	0x1e0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d617c  ! 197: LDUBA_I	lduba	[%r21, + 0x017c] %asi, %r27
	.word 0xfe94a156  ! 199: LDUHA_I	lduha	[%r18, + 0x0156] %asi, %r31
T2_asi_reg_rd_7:
	mov	0x26, %r14
	.word 0xfadb8400  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_15:
	setx	0x1c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_16:
	setx	0x1e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe95a181  ! 208: ORcc_I	orcc 	%r22, 0x0181, %r31
T2_asi_reg_wr_10:
	mov	0x2d, %r14
	.word 0xf2f389e0  ! 209: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf6848020  ! 210: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf2cd21e2  ! 213: LDSBA_I	ldsba	[%r20, + 0x01e2] %asi, %r25
cpu_intr_2_17:
	setx	0x1e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_18:
	setx	0x1d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_19:
	setx	0x1e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_11:
	mov	0x2d, %r14
	.word 0xf8f38e60  ! 225: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_wr_12:
	mov	0xa, %r14
	.word 0xfef38e60  ! 227: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6454000  ! 229: LDSW_R	ldsw	[%r21 + %r0], %r27
cpu_intr_2_20:
	setx	0x1f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_21:
	setx	0x1d0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_22:
	setx	0x1d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 236: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xba340000  ! 237: ORN_R	orn 	%r16, %r0, %r29
	.word 0xf8dca1cd  ! 238: LDXA_I	ldxa	[%r18, + 0x01cd] %asi, %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_2_23:
	setx	0x1c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe844020  ! 244: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
	.word 0xb0c58000  ! 245: ADDCcc_R	addccc 	%r22, %r0, %r24
cpu_intr_2_24:
	setx	0x1c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_13:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 250: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4452107  ! 252: LDSW_I	ldsw	[%r20 + 0x0107], %r26
	.word 0xf4d520f8  ! 254: LDSHA_I	ldsha	[%r20, + 0x00f8] %asi, %r26
	.word 0xf095a1f3  ! 256: LDUHA_I	lduha	[%r22, + 0x01f3] %asi, %r24
cpu_intr_2_25:
	setx	0x1c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_14:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 259: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_8:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, a)
	.word 0xb93c2001  ! 262: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xf045a14e  ! 263: LDSW_I	ldsw	[%r22 + 0x014e], %r24
T2_asi_reg_wr_15:
	mov	0x15, %r14
	.word 0xfef38e40  ! 266: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf6540000  ! 270: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xf0dc603d  ! 271: LDXA_I	ldxa	[%r17, + 0x003d] %asi, %r24
T2_asi_reg_rd_9:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 274: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc5421d7  ! 276: LDSH_I	ldsh	[%r16 + 0x01d7], %r30
T2_asi_reg_rd_10:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_16:
	mov	0x24, %r14
	.word 0xf0f38e80  ! 283: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_26:
	setx	0x1c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_27:
	setx	0x3002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095a0eb  ! 286: LDUHA_I	lduha	[%r22, + 0x00eb] %asi, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 14)
	.word 0xfcc48020  ! 290: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	.word 0xb494214b  ! 291: ORcc_I	orcc 	%r16, 0x014b, %r26
	.word 0xf015e018  ! 292: LDUH_I	lduh	[%r23 + 0x0018], %r24
	.word 0xf6d4612d  ! 293: LDSHA_I	ldsha	[%r17, + 0x012d] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_28:
	setx	0x1d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_17:
	mov	0x25, %r14
	.word 0xfef384a0  ! 299: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf0dc2028  ! 303: LDXA_I	ldxa	[%r16, + 0x0028] %asi, %r24
	.word 0xf2540000  ! 304: LDSH_R	ldsh	[%r16 + %r0], %r25
cpu_intr_2_29:
	setx	0x1c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb814c000  ! 307: OR_R	or 	%r19, %r0, %r28
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_11:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 313: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbead8000  ! 314: ANDNcc_R	andncc 	%r22, %r0, %r31
	.word 0xbaac4000  ! 315: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xbd346001  ! 316: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xf2c54020  ! 318: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
cpu_intr_2_30:
	setx	0x1d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc44020  ! 321: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
	.word 0xba840000  ! 323: ADDcc_R	addcc 	%r16, %r0, %r29
	.word 0xf814e0e0  ! 324: LDUH_I	lduh	[%r19 + 0x00e0], %r28
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_31:
	setx	0x1c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf055e08b  ! 336: LDSH_I	ldsh	[%r23 + 0x008b], %r24
cpu_intr_2_32:
	setx	0x1d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c58020  ! 338: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf0c50020  ! 347: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_12:
	mov	0x32, %r14
	.word 0xf8db8e60  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_33:
	setx	0x1c0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_34:
	setx	0x1e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d5c020  ! 358: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_13:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 363: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_35:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_36:
	setx	0x1d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_14:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf4548000  ! 375: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf00cc000  ! 377: LDUB_R	ldub	[%r19 + %r0], %r24
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 37)
	.word 0xb92cf001  ! 381: SLLX_I	sllx	%r19, 0x0001, %r28
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 5)
	ta	T_CHANGE_HPRIV
	.word 0xbe048000  ! 386: ADD_R	add 	%r18, %r0, %r31
cpu_intr_2_37:
	setx	0x1e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a08  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a08, %hpstate
cpu_intr_2_38:
	setx	0x1e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf48d4020  ! 391: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xfc458000  ! 394: LDSW_R	ldsw	[%r22 + %r0], %r30
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb93cb001  ! 397: SRAX_I	srax	%r18, 0x0001, %r28
cpu_intr_2_39:
	setx	0x1c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 38)
	.word 0xf85c4000  ! 406: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xb22c0000  ! 408: ANDN_R	andn 	%r16, %r0, %r25
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 33)
	.word 0xf495c020  ! 410: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xfe0ca036  ! 416: LDUB_I	ldub	[%r18 + 0x0036], %r31
	ta	T_CHANGE_TO_TL1
cpu_intr_2_40:
	setx	0x1f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 422: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_19:
	mov	0x34, %r14
	.word 0xfcf38e40  ! 428: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_15:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf414a08d  ! 430: LDUH_I	lduh	[%r18 + 0x008d], %r26
	.word 0xb2c52007  ! 431: ADDCcc_I	addccc 	%r20, 0x0007, %r25
	.word 0xfec420c0  ! 432: LDSWA_I	ldswa	[%r16, + 0x00c0] %asi, %r31
	.word 0xb7518000  ! 433: RDPR_PSTATE	<illegal instruction>
cpu_intr_2_41:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4440000  ! 438: LDSW_R	ldsw	[%r16 + %r0], %r26
T2_asi_reg_rd_16:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_20:
	mov	0x14, %r14
	.word 0xf2f38e60  ! 444: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf2858020  ! 449: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	.word 0xf4c44020  ! 451: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983848  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1848, %hpstate
	.word 0xfcc461f6  ! 455: LDSWA_I	ldswa	[%r17, + 0x01f6] %asi, %r30
cpu_intr_2_42:
	setx	0x1d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb815e142  ! 458: OR_I	or 	%r23, 0x0142, %r28
cpu_intr_2_43:
	setx	0x1d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba354000  ! 461: ORN_R	orn 	%r21, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfac460cd  ! 463: LDSWA_I	ldswa	[%r17, + 0x00cd] %asi, %r29
cpu_intr_2_44:
	setx	0x1e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfc1520ff  ! 469: LDUH_I	lduh	[%r20 + 0x00ff], %r30
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 8)
	.word 0xb9508000  ! 472: RDPR_TSTATE	<illegal instruction>
	.word 0xf044e137  ! 475: LDSW_I	ldsw	[%r19 + 0x0137], %r24
	.word 0xfc046094  ! 481: LDUW_I	lduw	[%r17 + 0x0094], %r30
T2_asi_reg_wr_21:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 482: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_22:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 484: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf2858020  ! 485: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982818  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0818, %hpstate
	.word 0xf015a06b  ! 490: LDUH_I	lduh	[%r22 + 0x006b], %r24
	.word 0xf854a09f  ! 491: LDSH_I	ldsh	[%r18 + 0x009f], %r28
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 14)
	.word 0xf8858020  ! 496: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_45:
	setx	0x230027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_46:
	setx	0x210200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_17:
	mov	0x33, %r14
	.word 0xfedb8400  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf0d40020  ! 510: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
	.word 0xfac4e0a5  ! 512: LDSWA_I	ldswa	[%r19, + 0x00a5] %asi, %r29
cpu_intr_2_47:
	setx	0x210110, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_18:
	mov	0x19, %r14
	.word 0xfcdb8400  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_48:
	setx	0x230318, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c82  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
	.word 0xf40da0a8  ! 524: LDUB_I	ldub	[%r22 + 0x00a8], %r26
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 2)
	.word 0xfa048000  ! 529: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf25da05f  ! 530: LDX_I	ldx	[%r22 + 0x005f], %r25
cpu_intr_2_49:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_50:
	setx	0x23032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 15)
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983ad2  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad2, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xf0540000  ! 543: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xfcd4c020  ! 544: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_23:
	mov	0x9, %r14
	.word 0xfef384a0  ! 552: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_24:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 553: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe8c4020  ! 555: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	.word 0xfec54020  ! 559: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfcccc020  ! 562: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
	.word 0xf88c2103  ! 563: LDUBA_I	lduba	[%r16, + 0x0103] %asi, %r28
T2_asi_reg_rd_19:
	mov	0x37, %r14
	.word 0xfcdb84a0  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfa85c020  ! 565: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
	.word 0xf2cc2173  ! 566: LDSBA_I	ldsba	[%r16, + 0x0173] %asi, %r25
	.word 0xf2158000  ! 567: LDUH_R	lduh	[%r22 + %r0], %r25
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 11)
	.word 0xbe8d0000  ! 573: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xbc354000  ! 574: ORN_R	orn 	%r21, %r0, %r30
	.word 0xfe0d61c8  ! 575: LDUB_I	ldub	[%r21 + 0x01c8], %r31
T2_asi_reg_rd_20:
	mov	0x26, %r14
	.word 0xf8db8e80  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfacc4020  ! 583: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
T2_asi_reg_wr_25:
	mov	0x0, %r14
	.word 0xf6f384a0  ! 584: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf2cd608d  ! 587: LDSBA_I	ldsba	[%r21, + 0x008d] %asi, %r25
	.word 0xf88c4020  ! 588: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
	.word 0xf80c4000  ! 589: LDUB_R	ldub	[%r17 + %r0], %r28
T2_asi_reg_rd_21:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_wr_26:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 591: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_27:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 593: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_28:
	mov	0x18, %r14
	.word 0xf2f384a0  ! 596: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf215c000  ! 599: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf8844020  ! 601: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_51:
	setx	0x21012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x230238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, d)
	.word 0xb02ce061  ! 613: ANDN_I	andn 	%r19, 0x0061, %r24
cpu_intr_2_53:
	setx	0x200200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44e104  ! 618: LDSW_I	ldsw	[%r19 + 0x0104], %r31
	.word 0xf694a05d  ! 619: LDUHA_I	lduha	[%r18, + 0x005d] %asi, %r27
	.word 0xf815e08a  ! 620: LDUH_I	lduh	[%r23 + 0x008a], %r28
T2_asi_reg_rd_22:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 631: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf495c020  ! 637: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b92  ! 638: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_29:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 645: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb43c0000  ! 646: XNOR_R	xnor 	%r16, %r0, %r26
	.word 0xf614c000  ! 650: LDUH_R	lduh	[%r19 + %r0], %r27
T2_asi_reg_rd_23:
	mov	0xb, %r14
	.word 0xf0db8e80  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_24:
	mov	0x35, %r14
	.word 0xfcdb89e0  ! 657: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_30:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 659: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_25:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_54:
	setx	0x220030, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_26:
	mov	0x16, %r14
	.word 0xfcdb8e40  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_55:
	setx	0x210023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_56:
	setx	0x200122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_57:
	setx	0x210214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa054000  ! 670: LDUW_R	lduw	[%r21 + %r0], %r29
T2_asi_reg_rd_27:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_NONHPRIV
	.word 0xb6c56079  ! 679: ADDCcc_I	addccc 	%r21, 0x0079, %r27
T2_asi_reg_wr_31:
	mov	0x30, %r14
	.word 0xf8f384a0  ! 680: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3520000  ! 681: RDPR_PIL	<illegal instruction>
T2_asi_reg_wr_32:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 683: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_33:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 685: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf40c6185  ! 686: LDUB_I	ldub	[%r17 + 0x0185], %r26
	.word 0xf6cc2127  ! 687: LDSBA_I	ldsba	[%r16, + 0x0127] %asi, %r27
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 37)
	.word 0xf094c020  ! 690: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
cpu_intr_2_58:
	setx	0x23010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc84e1fd  ! 698: LDUWA_I	lduwa	[%r19, + 0x01fd] %asi, %r30
cpu_intr_2_59:
	setx	0x230022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a092  ! 704: WRPR_PIL_I	wrpr	%r22, 0x0092, %pil
T2_asi_reg_wr_34:
	mov	0x2b, %r14
	.word 0xf0f389e0  ! 705: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_60:
	setx	0x220102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe050000  ! 710: LDUW_R	lduw	[%r20 + %r0], %r31
cpu_intr_2_61:
	setx	0x20011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55c000  ! 714: LDSH_R	ldsh	[%r23 + %r0], %r30
T2_asi_reg_wr_35:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 715: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_62:
	setx	0x220230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_28:
	mov	0x10, %r14
	.word 0xfadb8400  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf20c4000  ! 725: LDUB_R	ldub	[%r17 + %r0], %r25
T2_asi_reg_rd_29:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 24)
	.word 0xf4d44020  ! 733: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
cpu_intr_2_63:
	setx	0x200131, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e58  ! 738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e58, %hpstate
	.word 0xf84d60a0  ! 739: LDSB_I	ldsb	[%r21 + 0x00a0], %r28
	.word 0xbd2cc000  ! 740: SLL_R	sll 	%r19, %r0, %r30
	.word 0xbf508000  ! 741: RDPR_TSTATE	<illegal instruction>
	.word 0xfacce060  ! 743: LDSBA_I	ldsba	[%r19, + 0x0060] %asi, %r29
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 25)
	.word 0xf6548000  ! 745: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xf88c20e1  ! 747: LDUBA_I	lduba	[%r16, + 0x00e1] %asi, %r28
	.word 0xfe5c0000  ! 748: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf4148000  ! 751: LDUH_R	lduh	[%r18 + %r0], %r26
cpu_intr_2_64:
	setx	0x23020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794e036  ! 753: WRPR_TT_I	wrpr	%r19, 0x0036, %tt
	.word 0xfc944020  ! 754: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	.word 0xbe14c000  ! 756: OR_R	or 	%r19, %r0, %r31
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc444000  ! 758: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xb2b4c000  ! 761: SUBCcc_R	orncc 	%r19, %r0, %r25
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfc540000  ! 765: LDSH_R	ldsh	[%r16 + %r0], %r30
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfed4c020  ! 776: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 1)
	.word 0xf4d44020  ! 778: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_30:
	mov	0x31, %r14
	.word 0xf0db8e60  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb204600e  ! 785: ADD_I	add 	%r17, 0x000e, %r25
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_65:
	setx	0x21031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_36:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 790: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 24)
	.word 0x919521ed  ! 794: WRPR_PIL_I	wrpr	%r20, 0x01ed, %pil
cpu_intr_2_66:
	setx	0x22011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_67:
	setx	0x200206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88521c3  ! 804: LDUWA_I	lduwa	[%r20, + 0x01c3] %asi, %r28
T2_asi_reg_wr_37:
	mov	0xf, %r14
	.word 0xf0f38e80  ! 805: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e88  ! 806: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e88, %hpstate
	.word 0xb245e1f2  ! 808: ADDC_I	addc 	%r23, 0x01f2, %r25
	.word 0xf4950020  ! 809: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
	.word 0xf0c5c020  ! 811: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
T2_asi_reg_rd_31:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 19)
	.word 0xf4954020  ! 814: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
T2_asi_reg_rd_32:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982850  ! 817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0850, %hpstate
cpu_intr_2_68:
	setx	0x220214, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4858020  ! 821: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r26
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 26)
	.word 0xf645c000  ! 824: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xfc454000  ! 827: LDSW_R	ldsw	[%r21 + %r0], %r30
	.word 0xfa84e128  ! 829: LDUWA_I	lduwa	[%r19, + 0x0128] %asi, %r29
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_TO_TL1
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f08  ! 833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f08, %hpstate
	.word 0xfa4c8000  ! 834: LDSB_R	ldsb	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
cpu_intr_2_69:
	setx	0x210305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, b)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 25)
	.word 0xfccca172  ! 845: LDSBA_I	ldsba	[%r18, + 0x0172] %asi, %r30
	.word 0xfcdc2045  ! 847: LDXA_I	ldxa	[%r16, + 0x0045] %asi, %r30
cpu_intr_2_70:
	setx	0x20001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6948020  ! 849: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	.word 0xf6cd20b4  ! 850: LDSBA_I	ldsba	[%r20, + 0x00b4] %asi, %r27
cpu_intr_2_71:
	setx	0x220020, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_38:
	mov	0x0, %r14
	.word 0xf6f389e0  ! 857: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_72:
	setx	0x21001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c52101  ! 859: ADDCcc_I	addccc 	%r20, 0x0101, %r24
	.word 0xf6442024  ! 862: LDSW_I	ldsw	[%r16 + 0x0024], %r27
	.word 0xfc4d607f  ! 865: LDSB_I	ldsb	[%r21 + 0x007f], %r30
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe4dc000  ! 869: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf4448000  ! 871: LDSW_R	ldsw	[%r18 + %r0], %r26
T2_asi_reg_rd_33:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_73:
	setx	0x22010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4444000  ! 876: LDSW_R	ldsw	[%r17 + %r0], %r26
T2_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 878: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a92  ! 880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a92, %hpstate
	.word 0xbf7d2401  ! 881: MOVR_I	movre	%r20, 0x1, %r31
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_34:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8dd21a6  ! 889: LDXA_I	ldxa	[%r20, + 0x01a6] %asi, %r28
T2_asi_reg_rd_35:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_74:
	setx	0x22012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982950  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
T2_asi_reg_wr_40:
	mov	0x0, %r14
	.word 0xf4f389e0  ! 897: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_41:
	mov	0x12, %r14
	.word 0xf2f38e40  ! 901: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf00d0000  ! 902: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xf28da137  ! 905: LDUBA_I	lduba	[%r22, + 0x0137] %asi, %r25
	.word 0xf2150000  ! 907: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xfa84e118  ! 909: LDUWA_I	lduwa	[%r19, + 0x0118] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf694206f  ! 911: LDUHA_I	lduha	[%r16, + 0x006f] %asi, %r27
cpu_intr_2_75:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_36:
	mov	0x30, %r14
	.word 0xf6db8e80  ! 921: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb52c3001  ! 924: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xb2ac8000  ! 926: ANDNcc_R	andncc 	%r18, %r0, %r25
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_42:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 931: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_76:
	setx	0x27002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8846189  ! 951: LDUWA_I	lduwa	[%r17, + 0x0189] %asi, %r28
	.word 0xf84d4000  ! 957: LDSB_R	ldsb	[%r21 + %r0], %r28
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_TO_TL1
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_77:
	setx	0x260107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_78:
	setx	0x260335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29dc000  ! 965: XORcc_R	xorcc 	%r23, %r0, %r25
cpu_intr_2_79:
	setx	0x24021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_37:
	mov	0x3, %r14
	.word 0xf8db8e40  ! 967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_80:
	setx	0x270102, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_38:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 973: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_81:
	setx	0x27022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_43:
	mov	0x19, %r14
	.word 0xfef38e60  ! 981: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_wr_44:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 982: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_45:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 984: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf005a177  ! 985: LDUW_I	lduw	[%r22 + 0x0177], %r24
	.word 0xf64c6075  ! 988: LDSB_I	ldsb	[%r17 + 0x0075], %r27
T2_asi_reg_rd_39:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf84d0000  ! 991: LDSB_R	ldsb	[%r20 + %r0], %r28
cpu_intr_2_82:
	setx	0x250001, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_40:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 30)
	.word 0xbd3dc000  ! 1002: SRA_R	sra 	%r23, %r0, %r30
T2_asi_reg_rd_41:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_83:
	setx	0x26032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 35)
	.word 0xfc554000  ! 1008: LDSH_R	ldsh	[%r21 + %r0], %r30
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_84:
	setx	0x27021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_42:
	mov	0x21, %r14
	.word 0xf0db8e80  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf6c4216b  ! 1018: LDSWA_I	ldswa	[%r16, + 0x016b] %asi, %r27
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_46:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 1021: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf24c2146  ! 1022: LDSB_I	ldsb	[%r16 + 0x0146], %r25
	.word 0xfc0c201d  ! 1025: LDUB_I	ldub	[%r16 + 0x001d], %r30
	.word 0xf005a0c0  ! 1026: LDUW_I	lduw	[%r22 + 0x00c0], %r24
	.word 0xf4852016  ! 1031: LDUWA_I	lduwa	[%r20, + 0x0016] %asi, %r26
	.word 0xfccd6183  ! 1032: LDSBA_I	ldsba	[%r21, + 0x0183] %asi, %r30
cpu_intr_2_85:
	setx	0x260126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf605e16d  ! 1034: LDUW_I	lduw	[%r23 + 0x016d], %r27
T2_asi_reg_wr_47:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 1036: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbd3c1000  ! 1039: SRAX_R	srax	%r16, %r0, %r30
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983950  ! 1040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1950, %hpstate
	.word 0xf655a1a0  ! 1042: LDSH_I	ldsh	[%r22 + 0x01a0], %r27
cpu_intr_2_86:
	setx	0x240121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_87:
	setx	0x270208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d0000  ! 1046: LDX_R	ldx	[%r20 + %r0], %r30
cpu_intr_2_88:
	setx	0x270003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81521d0  ! 1048: LDUH_I	lduh	[%r20 + 0x01d0], %r28
	.word 0xf6854020  ! 1049: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
	.word 0xbb34f001  ! 1051: SRLX_I	srlx	%r19, 0x0001, %r29
	.word 0xf6c5c020  ! 1055: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
	.word 0xfc05c000  ! 1061: LDUW_R	lduw	[%r23 + %r0], %r30
cpu_intr_2_89:
	setx	0x260239, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_48:
	mov	0x23, %r14
	.word 0xf0f38e80  ! 1068: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819838ca  ! 1069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18ca, %hpstate
	.word 0xfa0dc000  ! 1070: LDUB_R	ldub	[%r23 + %r0], %r29
cpu_intr_2_90:
	setx	0x24002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe54a0f5  ! 1074: LDSH_I	ldsh	[%r18 + 0x00f5], %r31
T2_asi_reg_wr_49:
	mov	0x26, %r14
	.word 0xf0f384a0  ! 1076: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf454a183  ! 1081: LDSH_I	ldsh	[%r18 + 0x0183], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf88d604d  ! 1083: LDUBA_I	lduba	[%r21, + 0x004d] %asi, %r28
	.word 0xf684a17b  ! 1084: LDUWA_I	lduwa	[%r18, + 0x017b] %asi, %r27
cpu_intr_2_91:
	setx	0x260338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba05c000  ! 1087: ADD_R	add 	%r23, %r0, %r29
	.word 0xbb346001  ! 1088: SRL_I	srl 	%r17, 0x0001, %r29
T2_asi_reg_wr_50:
	mov	0x38, %r14
	.word 0xf0f38400  ! 1089: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4d5c020  ! 1090: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_51:
	mov	0x2e, %r14
	.word 0xf2f38e60  ! 1096: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_92:
	setx	0x260100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_52:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 1099: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_93:
	setx	0x260005, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_53:
	mov	0x32, %r14
	.word 0xf4f38400  ! 1101: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_rd_43:
	mov	0x23, %r14
	.word 0xf8db8e60  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_94:
	setx	0x260124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84ce133  ! 1105: LDSB_I	ldsb	[%r19 + 0x0133], %r28
cpu_intr_2_95:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf80561c3  ! 1111: LDUW_I	lduw	[%r21 + 0x01c3], %r28
T2_asi_reg_rd_44:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf094a095  ! 1118: LDUHA_I	lduha	[%r18, + 0x0095] %asi, %r24
	.word 0x859460f8  ! 1119: WRPR_TSTATE_I	wrpr	%r17, 0x00f8, %tstate
	.word 0xfe4460fe  ! 1121: LDSW_I	ldsw	[%r17 + 0x00fe], %r31
T2_asi_reg_rd_45:
	mov	0x16, %r14
	.word 0xf6db89e0  ! 1123: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 6)
	.word 0xf0948020  ! 1127: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xf44d0000  ! 1130: LDSB_R	ldsb	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_96:
	setx	0x250328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_54:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 1140: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf814a0b5  ! 1143: LDUH_I	lduh	[%r18 + 0x00b5], %r28
T2_asi_reg_wr_55:
	mov	0x21, %r14
	.word 0xfaf38400  ! 1146: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf6cca12e  ! 1147: LDSBA_I	ldsba	[%r18, + 0x012e] %asi, %r27
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 2)
	.word 0xb4950000  ! 1150: ORcc_R	orcc 	%r20, %r0, %r26
cpu_intr_2_97:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_46:
	mov	0x22, %r14
	.word 0xf2db84a0  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfed4a1f0  ! 1154: LDSHA_I	ldsha	[%r18, + 0x01f0] %asi, %r31
cpu_intr_2_98:
	setx	0x250332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004a18d  ! 1159: ADD_I	add 	%r18, 0x018d, %r24
T2_asi_reg_wr_56:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 1163: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf4cdc020  ! 1166: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
cpu_intr_2_99:
	setx	0x240101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c4a0dc  ! 1168: LDSWA_I	ldswa	[%r18, + 0x00dc] %asi, %r27
T2_asi_reg_wr_57:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 1169: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf4c58020  ! 1172: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_58:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 1173: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf405a16f  ! 1175: LDUW_I	lduw	[%r22 + 0x016f], %r26
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_59:
	mov	0x21, %r14
	.word 0xfaf384a0  ! 1178: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_100:
	setx	0x260012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24de144  ! 1182: LDSB_I	ldsb	[%r23 + 0x0144], %r25
	.word 0xf2c5a1ce  ! 1185: LDSWA_I	ldswa	[%r22, + 0x01ce] %asi, %r25
	.word 0xfc840020  ! 1186: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
T2_asi_reg_rd_47:
	mov	0x2c, %r14
	.word 0xfadb8e40  ! 1187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 3d)
	.word 0xbb2c4000  ! 1189: SLL_R	sll 	%r17, %r0, %r29
cpu_intr_2_101:
	setx	0x270112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_60:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 1196: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_48:
	mov	0x35, %r14
	.word 0xf6db89e0  ! 1197: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf6dd219c  ! 1199: LDXA_I	ldxa	[%r20, + 0x019c] %asi, %r27
T2_asi_reg_rd_49:
	mov	0x13, %r14
	.word 0xf6db8400  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_102:
	setx	0x26013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20da095  ! 1209: AND_I	and 	%r22, 0x0095, %r25
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, b)
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc5d0000  ! 1216: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xf0458000  ! 1217: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xfe8560ea  ! 1218: LDUWA_I	lduwa	[%r21, + 0x00ea] %asi, %r31
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 31)
	.word 0xf80c4000  ! 1225: LDUB_R	ldub	[%r17 + %r0], %r28
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 32)
	.word 0xfa554000  ! 1229: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xf4dda100  ! 1234: LDXA_I	ldxa	[%r22, + 0x0100] %asi, %r26
T2_asi_reg_rd_50:
	mov	0x2f, %r14
	.word 0xfedb8e60  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_103:
	setx	0x27011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_61:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 1238: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_62:
	mov	0x0, %r14
	.word 0xf8f38e40  ! 1247: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_104:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_51:
	mov	0x21, %r14
	.word 0xf0db8400  ! 1252: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, f)
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 5)
	.word 0xb9540000  ! 1257: RDPR_GL	<illegal instruction>
T2_asi_reg_rd_52:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_105:
	setx	0x240004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf094a176  ! 1266: LDUHA_I	lduha	[%r18, + 0x0176] %asi, %r24
	.word 0xf415618c  ! 1270: LDUH_I	lduh	[%r21 + 0x018c], %r26
	.word 0xbf7d6401  ! 1271: MOVR_I	movre	%r21, 0x1, %r31
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_53:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf4c4c020  ! 1282: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r26
	.word 0xf4856092  ! 1283: LDUWA_I	lduwa	[%r21, + 0x0092] %asi, %r26
T2_asi_reg_rd_54:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_55:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 1289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_106:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e119  ! 1292: WRPR_TICK_I	wrpr	%r19, 0x0119, %tick
T2_asi_reg_wr_63:
	mov	0x2e, %r14
	.word 0xf0f38e60  ! 1293: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, f)
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_56:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfacdc020  ! 1303: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
T2_asi_reg_wr_64:
	mov	0x28, %r14
	.word 0xfcf38e60  ! 1304: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf60c4000  ! 1309: LDUB_R	ldub	[%r17 + %r0], %r27
cpu_intr_2_107:
	setx	0x27000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x260115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65c2048  ! 1316: LDX_I	ldx	[%r16 + 0x0048], %r27
	.word 0xb0c4a08a  ! 1318: ADDCcc_I	addccc 	%r18, 0x008a, %r24
T2_asi_reg_rd_57:
	mov	0x10, %r14
	.word 0xfadb8e40  ! 1319: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe0c4000  ! 1320: AND_R	and 	%r17, %r0, %r31
	.word 0xf4d4601f  ! 1323: LDSHA_I	ldsha	[%r17, + 0x001f] %asi, %r26
	.word 0xf05c21e9  ! 1325: LDX_I	ldx	[%r16 + 0x01e9], %r24
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d88  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 1)
	.word 0xf20d21c9  ! 1334: LDUB_I	ldub	[%r20 + 0x01c9], %r25
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_109:
	setx	0x240103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c40020  ! 1338: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
	.word 0xfedc61d2  ! 1341: LDXA_I	ldxa	[%r17, + 0x01d2] %asi, %r31
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 22)
	.word 0xfec5a152  ! 1346: LDSWA_I	ldswa	[%r22, + 0x0152] %asi, %r31
T2_asi_reg_wr_65:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 1347: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_110:
	setx	0x24020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4842179  ! 1351: LDUWA_I	lduwa	[%r16, + 0x0179] %asi, %r26
	.word 0xf4150000  ! 1352: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xb2054000  ! 1357: ADD_R	add 	%r21, %r0, %r25
	.word 0xfa85e07a  ! 1359: LDUWA_I	lduwa	[%r23, + 0x007a] %asi, %r29
	.word 0xf415e1b7  ! 1362: LDUH_I	lduh	[%r23 + 0x01b7], %r26
	.word 0xfa5cc000  ! 1364: LDX_R	ldx	[%r19 + %r0], %r29
T2_asi_reg_rd_58:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 1365: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 19)
	.word 0xf4ccc020  ! 1370: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
	.word 0xfc4da02a  ! 1372: LDSB_I	ldsb	[%r22 + 0x002a], %r30
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_111:
	setx	0x270011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_112:
	setx	0x27033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_66:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 1387: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_67:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 1388: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_113:
	setx	0x280216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc0020  ! 1392: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_114:
	setx	0x2b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfed58020  ! 1399: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	.word 0xb8258000  ! 1400: SUB_R	sub 	%r22, %r0, %r28
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198390a  ! 1401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190a, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xf85d6184  ! 1405: LDX_I	ldx	[%r21 + 0x0184], %r28
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_68:
	mov	0x2d, %r14
	.word 0xfaf38e80  ! 1417: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_115:
	setx	0x28013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0140000  ! 1422: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xfccc60aa  ! 1423: LDSBA_I	ldsba	[%r17, + 0x00aa] %asi, %r30
cpu_intr_2_116:
	setx	0x2b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_59:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf88ca041  ! 1433: LDUBA_I	lduba	[%r18, + 0x0041] %asi, %r28
T2_asi_reg_wr_69:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 1434: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb62c0000  ! 1435: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xbb3cc000  ! 1437: SRA_R	sra 	%r19, %r0, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf8c5a110  ! 1443: LDSWA_I	ldswa	[%r22, + 0x0110] %asi, %r28
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb4350000  ! 1448: ORN_R	orn 	%r20, %r0, %r26
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, b)
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_117:
	setx	0x2a0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc24c000  ! 1458: SUB_R	sub 	%r19, %r0, %r30
	.word 0xf29560fa  ! 1461: LDUHA_I	lduha	[%r21, + 0x00fa] %asi, %r25
	.word 0xf615a125  ! 1463: LDUH_I	lduh	[%r22 + 0x0125], %r27
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_61:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 1468: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, f)
	.word 0xf0ccc020  ! 1470: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb88d6064  ! 1472: ANDcc_I	andcc 	%r21, 0x0064, %r28
	ta	T_CHANGE_TO_TL1
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819828c0  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
cpu_intr_2_118:
	setx	0x2a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_70:
	mov	0x29, %r14
	.word 0xf4f38e40  ! 1484: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe94e0f2  ! 1485: LDUHA_I	lduha	[%r19, + 0x00f2] %asi, %r31
	.word 0xfcc4c020  ! 1488: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
cpu_intr_2_119:
	setx	0x29033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 2)
	.word 0xfa5de1a2  ! 1493: LDX_I	ldx	[%r23 + 0x01a2], %r29
cpu_intr_2_120:
	setx	0x280328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c206c  ! 1498: LDUBA_I	lduba	[%r16, + 0x006c] %asi, %r30
	.word 0xbf518000  ! 1500: RDPR_PSTATE	<illegal instruction>
	.word 0xbab4204f  ! 1501: SUBCcc_I	orncc 	%r16, 0x004f, %r29
	.word 0xb4058000  ! 1506: ADD_R	add 	%r22, %r0, %r26
	.word 0xf0840020  ! 1507: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
T2_asi_reg_rd_62:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb72d6001  ! 1509: SLL_I	sll 	%r21, 0x0001, %r27
	.word 0xf2448000  ! 1511: LDSW_R	ldsw	[%r18 + %r0], %r25
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 28)
	.word 0xfc4da098  ! 1515: LDSB_I	ldsb	[%r22 + 0x0098], %r30
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_121:
	setx	0x2b013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0858020  ! 1522: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_71:
	mov	0x33, %r14
	.word 0xf2f38e80  ! 1524: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfe15a174  ! 1526: LDUH_I	lduh	[%r22 + 0x0174], %r31
cpu_intr_2_122:
	setx	0x280125, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983808  ! 1529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1808, %hpstate
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 0)
	.word 0xfe0d4000  ! 1536: LDUB_R	ldub	[%r21 + %r0], %r31
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_72:
	mov	0x21, %r14
	.word 0xfaf38e60  ! 1539: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc94e1ad  ! 1540: LDUHA_I	lduha	[%r19, + 0x01ad] %asi, %r30
cpu_intr_2_123:
	setx	0x2b0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_63:
	mov	0xa, %r14
	.word 0xf4db8e40  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_TO_TL0
	.word 0xf05c8000  ! 1550: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xfcd42179  ! 1553: LDSHA_I	ldsha	[%r16, + 0x0179] %asi, %r30
T2_asi_reg_wr_73:
	mov	0x27, %r14
	.word 0xf2f38e40  ! 1557: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_124:
	setx	0x2b021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0158000  ! 1559: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xfc4d0000  ! 1562: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xf45561e1  ! 1563: LDSH_I	ldsh	[%r21 + 0x01e1], %r26
	.word 0xfe4560c8  ! 1565: LDSW_I	ldsw	[%r21 + 0x00c8], %r31
cpu_intr_2_125:
	setx	0x2b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_126:
	setx	0x290011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa05e11d  ! 1573: LDUW_I	lduw	[%r23 + 0x011d], %r29
	.word 0xf805a07a  ! 1574: LDUW_I	lduw	[%r22 + 0x007a], %r28
	.word 0xb4bc0000  ! 1578: XNORcc_R	xnorcc 	%r16, %r0, %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfac5c020  ! 1584: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r29
	.word 0xf495e1a7  ! 1585: LDUHA_I	lduha	[%r23, + 0x01a7] %asi, %r26
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, e)
	.word 0xf054e17f  ! 1587: LDSH_I	ldsh	[%r19 + 0x017f], %r24
	.word 0xf4c421a5  ! 1594: LDSWA_I	ldswa	[%r16, + 0x01a5] %asi, %r26
T2_asi_reg_wr_74:
	mov	0x1, %r14
	.word 0xfcf38e80  ! 1601: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_64:
	mov	0xd, %r14
	.word 0xfadb84a0  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xba2ca0f1  ! 1603: ANDN_I	andn 	%r18, 0x00f1, %r29
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 31)
	.word 0xf4dd217b  ! 1606: LDXA_I	ldxa	[%r20, + 0x017b] %asi, %r26
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 27)
	.word 0xf6152168  ! 1614: LDUH_I	lduh	[%r20 + 0x0168], %r27
T2_asi_reg_wr_75:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 1617: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf8d5e18f  ! 1618: LDSHA_I	ldsha	[%r23, + 0x018f] %asi, %r28
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 37)
	.word 0xfc94e0f6  ! 1621: LDUHA_I	lduha	[%r19, + 0x00f6] %asi, %r30
	.word 0xf2854020  ! 1630: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
T2_asi_reg_rd_65:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf04ce0fe  ! 1636: LDSB_I	ldsb	[%r19 + 0x00fe], %r24
	.word 0xf6550000  ! 1637: LDSH_R	ldsh	[%r20 + %r0], %r27
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cd8  ! 1638: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd8, %hpstate
cpu_intr_2_127:
	setx	0x28010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec58020  ! 1640: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
	.word 0xf4d40020  ! 1647: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	.word 0xbf7d4400  ! 1649: MOVR_R	movre	%r21, %r0, %r31
cpu_intr_2_128:
	setx	0x2a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa050000  ! 1652: LDUW_R	lduw	[%r20 + %r0], %r29
T2_asi_reg_wr_76:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1653: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2dc61db  ! 1654: LDXA_I	ldxa	[%r17, + 0x01db] %asi, %r25
T2_asi_reg_wr_77:
	mov	0x12, %r14
	.word 0xfcf38400  ! 1655: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_129:
	setx	0x280317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4dc000  ! 1661: LDSB_R	ldsb	[%r23 + %r0], %r30
T2_asi_reg_wr_78:
	mov	0x13, %r14
	.word 0xf4f38400  ! 1663: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 2b)
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d52  ! 1666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d52, %hpstate
	.word 0xba0dc000  ! 1667: AND_R	and 	%r23, %r0, %r29
	.word 0xf45c0000  ! 1668: LDX_R	ldx	[%r16 + %r0], %r26
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_130:
	setx	0x290007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe85a1e5  ! 1677: LDUWA_I	lduwa	[%r22, + 0x01e5] %asi, %r31
	.word 0xf48cc020  ! 1678: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
	.word 0xf015c000  ! 1680: LDUH_R	lduh	[%r23 + %r0], %r24
T2_asi_reg_rd_66:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf84d4000  ! 1682: LDSB_R	ldsb	[%r21 + %r0], %r28
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 3)
	.word 0xb4a461b3  ! 1684: SUBcc_I	subcc 	%r17, 0x01b3, %r26
	.word 0xfe0da013  ! 1686: LDUB_I	ldub	[%r22 + 0x0013], %r31
T2_asi_reg_wr_79:
	mov	0x2d, %r14
	.word 0xfcf384a0  ! 1687: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 34)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983fd0  ! 1694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd0, %hpstate
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_80:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 1703: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_67:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5643801  ! 1709: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0xf8c54020  ! 1715: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	.word 0xf4554000  ! 1716: LDSH_R	ldsh	[%r21 + %r0], %r26
	ta	T_CHANGE_TO_TL1
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 35)
	.word 0xf0540000  ! 1724: LDSH_R	ldsh	[%r16 + %r0], %r24
T2_asi_reg_wr_81:
	mov	0x1e, %r14
	.word 0xf2f38e60  ! 1726: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_rd_68:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe948020  ! 1730: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbab5c000  ! 1737: SUBCcc_R	orncc 	%r23, %r0, %r29
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_82:
	mov	0x1f, %r14
	.word 0xfcf38400  ! 1739: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfe15200c  ! 1740: LDUH_I	lduh	[%r20 + 0x000c], %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_69:
	mov	0x24, %r14
	.word 0xf8db8400  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 10)
	.word 0xb23d4000  ! 1752: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xf6d4c020  ! 1753: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
	.word 0xb9540000  ! 1756: RDPR_GL	<illegal instruction>
cpu_intr_2_131:
	setx	0x280036, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_70:
	mov	0xe, %r14
	.word 0xf6db8e60  ! 1759: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf445a19b  ! 1761: LDSW_I	ldsw	[%r22 + 0x019b], %r26
	.word 0xf05cc000  ! 1762: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xb205c000  ! 1764: ADD_R	add 	%r23, %r0, %r25
T2_asi_reg_rd_71:
	mov	0x17, %r14
	.word 0xfadb84a0  ! 1766: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf6c5e156  ! 1767: LDSWA_I	ldswa	[%r23, + 0x0156] %asi, %r27
cpu_intr_2_132:
	setx	0x28003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_133:
	setx	0x2a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_72:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1779: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d18  ! 1781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d18, %hpstate
	.word 0xf08dc020  ! 1782: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
cpu_intr_2_134:
	setx	0x29001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_83:
	mov	0x12, %r14
	.word 0xf8f38e60  ! 1784: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf285217c  ! 1786: LDUWA_I	lduwa	[%r20, + 0x017c] %asi, %r25
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 9)
	.word 0xfccd20d6  ! 1790: LDSBA_I	ldsba	[%r20, + 0x00d6] %asi, %r30
T2_asi_reg_rd_73:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfa44203d  ! 1794: LDSW_I	ldsw	[%r16 + 0x003d], %r29
	.word 0xb9352001  ! 1797: SRL_I	srl 	%r20, 0x0001, %r28
T2_asi_reg_wr_84:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 1799: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982948  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 9)
	.word 0xf4958020  ! 1807: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
	.word 0xfe4de0c6  ! 1808: LDSB_I	ldsb	[%r23 + 0x00c6], %r31
cpu_intr_2_135:
	setx	0x290303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2542001  ! 1813: LDSH_I	ldsh	[%r16 + 0x0001], %r25
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982892  ! 1814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
cpu_intr_2_136:
	setx	0x280222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_TO_TL0
	.word 0xbcac0000  ! 1820: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xf604c000  ! 1822: LDUW_R	lduw	[%r19 + %r0], %r27
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, c)
	.word 0xf0946094  ! 1826: LDUHA_I	lduha	[%r17, + 0x0094] %asi, %r24
	.word 0xf0554000  ! 1828: LDSH_R	ldsh	[%r21 + %r0], %r24
cpu_intr_2_137:
	setx	0x28032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb80de012  ! 1835: AND_I	and 	%r23, 0x0012, %r28
	.word 0xf4cc4020  ! 1836: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
cpu_intr_2_138:
	setx	0x280100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_139:
	setx	0x2b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73cd000  ! 1840: SRAX_R	srax	%r19, %r0, %r27
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819828d0  ! 1843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d0, %hpstate
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa4c216a  ! 1845: LDSB_I	ldsb	[%r16 + 0x016a], %r29
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_85:
	mov	0x32, %r14
	.word 0xfef38e40  ! 1850: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf804c000  ! 1851: LDUW_R	lduw	[%r19 + %r0], %r28
T2_asi_reg_rd_74:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 1854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc556139  ! 1856: LDSH_I	ldsh	[%r21 + 0x0139], %r30
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_HPRIV
	.word 0xf8d58020  ! 1860: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
	.word 0xb6a5c000  ! 1862: SUBcc_R	subcc 	%r23, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf65521e7  ! 1870: LDSH_I	ldsh	[%r20 + 0x01e7], %r27
	.word 0xbac54000  ! 1871: ADDCcc_R	addccc 	%r21, %r0, %r29
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_140:
	setx	0x2d0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0x12, %r14
	.word 0xfef38e60  ! 1875: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_141:
	setx	0x2f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48dc020  ! 1878: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
	.word 0xbe24a12d  ! 1879: SUB_I	sub 	%r18, 0x012d, %r31
	.word 0xf454e104  ! 1881: LDSH_I	ldsh	[%r19 + 0x0104], %r26
	.word 0xfc04a18d  ! 1884: LDUW_I	lduw	[%r18 + 0x018d], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_87:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 1886: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_75:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 1888: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_88:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 1895: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf04dc000  ! 1898: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xbd2d1000  ! 1899: SLLX_R	sllx	%r20, %r0, %r30
	.word 0xf8850020  ! 1904: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
cpu_intr_2_142:
	setx	0x2d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_76:
	mov	0x2e, %r14
	.word 0xf4db84a0  ! 1910: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfe8460db  ! 1911: LDUWA_I	lduwa	[%r17, + 0x00db] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_77:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 33)
	.word 0xf0cd0020  ! 1920: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
	.word 0xf80d0000  ! 1921: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xfe550000  ! 1923: LDSH_R	ldsh	[%r20 + %r0], %r31
cpu_intr_2_143:
	setx	0x2e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c6001  ! 1926: SRA_I	sra 	%r17, 0x0001, %r26
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 3d)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982950  ! 1928: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_144:
	setx	0x2c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeac0000  ! 1931: ANDNcc_R	andncc 	%r16, %r0, %r31
cpu_intr_2_145:
	setx	0x2d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28cc000  ! 1934: ANDcc_R	andcc 	%r19, %r0, %r25
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 37)
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e10  ! 1937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
	.word 0xb015c000  ! 1938: OR_R	or 	%r23, %r0, %r24
cpu_intr_2_146:
	setx	0x2e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_147:
	setx	0x2c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15e1fc  ! 1942: LDUH_I	lduh	[%r23 + 0x01fc], %r31
T2_asi_reg_rd_78:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf2cd4020  ! 1945: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xf0952195  ! 1946: LDUHA_I	lduha	[%r20, + 0x0195] %asi, %r24
	.word 0xf24c0000  ! 1947: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xf294c020  ! 1948: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
cpu_intr_2_148:
	setx	0x2e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, b)
	.word 0xf00d8000  ! 1957: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xb2248000  ! 1961: SUB_R	sub 	%r18, %r0, %r25
	.word 0xb7508000  ! 1962: RDPR_TSTATE	<illegal instruction>
	.word 0xf24da04f  ! 1963: LDSB_I	ldsb	[%r22 + 0x004f], %r25
	.word 0xb735c000  ! 1964: SRL_R	srl 	%r23, %r0, %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8de07d  ! 1976: LDUBA_I	lduba	[%r23, + 0x007d] %asi, %r30
cpu_intr_2_149:
	setx	0x2c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_150:
	setx	0x2c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_89:
	mov	0x12, %r14
	.word 0xfef38400  ! 1981: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfecd202d  ! 1984: LDSBA_I	ldsba	[%r20, + 0x002d] %asi, %r31
cpu_intr_2_151:
	setx	0x2f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_152:
	setx	0x2e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb484619f  ! 1994: ADDcc_I	addcc 	%r17, 0x019f, %r26
	.word 0xb4944000  ! 1996: ORcc_R	orcc 	%r17, %r0, %r26
	.word 0xb73c6001  ! 1997: SRA_I	sra 	%r17, 0x0001, %r27
	.word 0xf8cc8020  ! 2003: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 33)
	.word 0xfa0d20e9  ! 2007: LDUB_I	ldub	[%r20 + 0x00e9], %r29
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 20)
	.word 0xba0c2058  ! 2010: AND_I	and 	%r16, 0x0058, %r29
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 21)
	.word 0xb5350000  ! 2013: SRL_R	srl 	%r20, %r0, %r26
	.word 0xfcd42103  ! 2019: LDSHA_I	ldsha	[%r16, + 0x0103] %asi, %r30
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_90:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 2022: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfedc21e3  ! 2025: LDXA_I	ldxa	[%r16, + 0x01e3] %asi, %r31
cpu_intr_2_153:
	setx	0x2d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf8d4c020  ! 2028: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe8561bd  ! 2031: LDUWA_I	lduwa	[%r21, + 0x01bd] %asi, %r31
	.word 0xbb35f001  ! 2032: SRLX_I	srlx	%r23, 0x0001, %r29
	.word 0xb4150000  ! 2036: OR_R	or 	%r20, %r0, %r26
	.word 0xf2948020  ! 2038: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
T2_asi_reg_rd_79:
	mov	0x17, %r14
	.word 0xf4db8400  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf8cce017  ! 2042: LDSBA_I	ldsba	[%r19, + 0x0017] %asi, %r28
	.word 0xf0c5a1e0  ! 2044: LDSWA_I	ldswa	[%r22, + 0x01e0] %asi, %r24
cpu_intr_2_154:
	setx	0x2d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0454000  ! 2046: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xfccd4020  ! 2048: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
	.word 0xf2450000  ! 2049: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xfa44a10e  ! 2050: LDSW_I	ldsw	[%r18 + 0x010e], %r29
T2_asi_reg_rd_80:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_81:
	mov	0x30, %r14
	.word 0xfadb84a0  ! 2053: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d92  ! 2056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d92, %hpstate
	.word 0xf68cc020  ! 2058: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	.word 0xf0c4e0b4  ! 2060: LDSWA_I	ldswa	[%r19, + 0x00b4] %asi, %r24
	.word 0xfa55a025  ! 2062: LDSH_I	ldsh	[%r22 + 0x0025], %r29
	.word 0xf45cc000  ! 2064: LDX_R	ldx	[%r19 + %r0], %r26
T2_asi_reg_wr_91:
	mov	0x8, %r14
	.word 0xf2f38e40  ! 2065: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_155:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_82:
	mov	0x26, %r14
	.word 0xf4db84a0  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfe0ca105  ! 2069: LDUB_I	ldub	[%r18 + 0x0105], %r31
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_83:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 2076: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0154000  ! 2077: LDUH_R	lduh	[%r21 + %r0], %r24
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 33)
	.word 0xbd510000  ! 2079: RDPR_TICK	<illegal instruction>
T2_asi_reg_rd_84:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 2084: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_85:
	mov	0x37, %r14
	.word 0xf2db8e60  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_156:
	setx	0x2c0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_86:
	mov	0x14, %r14
	.word 0xf8db8e60  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_157:
	setx	0x2f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 32)
	.word 0xf615a14f  ! 2103: LDUH_I	lduh	[%r22 + 0x014f], %r27
	.word 0xf244e0ed  ! 2105: LDSW_I	ldsw	[%r19 + 0x00ed], %r25
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 1)
	.word 0xf244a098  ! 2111: LDSW_I	ldsw	[%r18 + 0x0098], %r25
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983eda  ! 2112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1eda, %hpstate
	.word 0xf2154000  ! 2114: LDUH_R	lduh	[%r21 + %r0], %r25
T2_asi_reg_wr_92:
	mov	0x2d, %r14
	.word 0xf0f38e80  ! 2116: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_158:
	setx	0x2f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04de0dd  ! 2120: LDSB_I	ldsb	[%r23 + 0x00dd], %r24
T2_asi_reg_wr_93:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 2121: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf285a06b  ! 2122: LDUWA_I	lduwa	[%r22, + 0x006b] %asi, %r25
	.word 0xfc840020  ! 2124: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
T2_asi_reg_rd_87:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf08c4020  ! 2127: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
	.word 0xfe15c000  ! 2128: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xfe944020  ! 2129: LDUHA_R	lduha	[%r17, %r0] 0x01, %r31
	.word 0xb52ca001  ! 2130: SLL_I	sll 	%r18, 0x0001, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_159:
	setx	0x2f0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 28)
	.word 0xba04e0dd  ! 2149: ADD_I	add 	%r19, 0x00dd, %r29
	.word 0xfa14a12d  ! 2151: LDUH_I	lduh	[%r18 + 0x012d], %r29
cpu_intr_2_160:
	setx	0x2c0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dc610d  ! 2167: LDXA_I	ldxa	[%r17, + 0x010d] %asi, %r26
cpu_intr_2_161:
	setx	0x2d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 8)
	.word 0xbd350000  ! 2172: SRL_R	srl 	%r20, %r0, %r30
T2_asi_reg_wr_94:
	mov	0xf, %r14
	.word 0xfcf389e0  ! 2173: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_88:
	mov	0x1e, %r14
	.word 0xf0db84a0  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_95:
	mov	0x1f, %r14
	.word 0xf6f38e40  ! 2179: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa4d4000  ! 2181: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf8c561f1  ! 2184: LDSWA_I	ldswa	[%r21, + 0x01f1] %asi, %r28
	.word 0xfc0da019  ! 2185: LDUB_I	ldub	[%r22 + 0x0019], %r30
T2_asi_reg_rd_89:
	mov	0x15, %r14
	.word 0xfedb8e60  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb77cc400  ! 2192: MOVR_R	movre	%r19, %r0, %r27
	.word 0xf4c4606d  ! 2193: LDSWA_I	ldswa	[%r17, + 0x006d] %asi, %r26
T2_asi_reg_wr_96:
	mov	0x1d, %r14
	.word 0xf2f38e60  ! 2200: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_97:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 2201: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_162:
	setx	0x2f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d8000  ! 2203: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xf04de1be  ! 2204: LDSB_I	ldsb	[%r23 + 0x01be], %r24
T2_asi_reg_wr_98:
	mov	0x2c, %r14
	.word 0xf4f389e0  ! 2205: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_90:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2207: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_163:
	setx	0x2c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd20da  ! 2214: LDSBA_I	ldsba	[%r20, + 0x00da] %asi, %r29
cpu_intr_2_164:
	setx	0x2d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4452070  ! 2218: LDSW_I	ldsw	[%r20 + 0x0070], %r26
T2_asi_reg_rd_91:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfcc48020  ! 2220: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
cpu_intr_2_165:
	setx	0x2c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfe85e038  ! 2224: LDUWA_I	lduwa	[%r23, + 0x0038] %asi, %r31
	.word 0xbb518000  ! 2226: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_rd_92:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982802  ! 2232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
T2_asi_reg_rd_93:
	mov	0x2e, %r14
	.word 0xf4db8e80  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_wr_99:
	mov	0x33, %r14
	.word 0xfaf389e0  ! 2235: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_94:
	mov	0x24, %r14
	.word 0xfcdb8e80  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf285e186  ! 2238: LDUWA_I	lduwa	[%r23, + 0x0186] %asi, %r25
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b40  ! 2239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_100:
	mov	0x20, %r14
	.word 0xf4f38e60  ! 2249: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_95:
	mov	0x20, %r14
	.word 0xfedb84a0  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_rd_96:
	mov	0x9, %r14
	.word 0xf8db89e0  ! 2252: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf40dc000  ! 2253: LDUB_R	ldub	[%r23 + %r0], %r26
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, e)
	.word 0xfad48020  ! 2256: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_97:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf21561ee  ! 2261: LDUH_I	lduh	[%r21 + 0x01ee], %r25
cpu_intr_2_166:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2842052  ! 2266: LDUWA_I	lduwa	[%r16, + 0x0052] %asi, %r25
	.word 0xfc8c0020  ! 2267: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
cpu_intr_2_167:
	setx	0x2d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_101:
	mov	0x9, %r14
	.word 0xf6f384a0  ! 2273: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf8450000  ! 2276: LDSW_R	ldsw	[%r20 + %r0], %r28
cpu_intr_2_168:
	setx	0x2e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4da0aa  ! 2279: LDSB_I	ldsb	[%r22 + 0x00aa], %r30
	.word 0xf84c21c0  ! 2281: LDSB_I	ldsb	[%r16 + 0x01c0], %r28
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 0)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983898  ! 2283: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1898, %hpstate
T2_asi_reg_wr_102:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 2285: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 27)
	.word 0xfcd46052  ! 2289: LDSHA_I	ldsha	[%r17, + 0x0052] %asi, %r30
T2_asi_reg_rd_98:
	mov	0x6, %r14
	.word 0xf8db8e80  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_169:
	setx	0x2d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 2294: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_104:
	mov	0x27, %r14
	.word 0xf6f389e0  ! 2299: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf88d0020  ! 2300: LDUBA_R	lduba	[%r20, %r0] 0x01, %r28
cpu_intr_2_170:
	setx	0x320238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_99:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_rd_100:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 2306: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf8c5c020  ! 2312: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xfcc44020  ! 2314: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 25)
	.word 0xf6554000  ! 2316: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xb6140000  ! 2320: OR_R	or 	%r16, %r0, %r27
	.word 0xb0bd0000  ! 2321: XNORcc_R	xnorcc 	%r20, %r0, %r24
T2_asi_reg_wr_105:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 2325: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_101:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2329: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfe548000  ! 2330: LDSH_R	ldsh	[%r18 + %r0], %r31
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, a)
	.word 0xf4056109  ! 2334: LDUW_I	lduw	[%r21 + 0x0109], %r26
cpu_intr_2_171:
	setx	0x320100, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f9a  ! 2341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9a, %hpstate
	.word 0xfcccc020  ! 2343: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_102:
	mov	0x21, %r14
	.word 0xf2db8400  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2d5c020  ! 2346: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_106:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 2348: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_172:
	setx	0x320313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_173:
	setx	0x32011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2dc000  ! 2357: SLL_R	sll 	%r23, %r0, %r29
T2_asi_reg_rd_103:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 2358: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbea5e0ef  ! 2360: SUBcc_I	subcc 	%r23, 0x00ef, %r31
	.word 0xfcd4c020  ! 2361: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf40d0000  ! 2366: LDUB_R	ldub	[%r20 + %r0], %r26
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_174:
	setx	0x310239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64c217e  ! 2373: LDSB_I	ldsb	[%r16 + 0x017e], %r27
cpu_intr_2_175:
	setx	0x33000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c4020  ! 2376: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_107:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 2379: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_104:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfc94e06f  ! 2384: LDUHA_I	lduha	[%r19, + 0x006f] %asi, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf88c609e  ! 2388: LDUBA_I	lduba	[%r17, + 0x009e] %asi, %r28
cpu_intr_2_176:
	setx	0x330304, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d90  ! 2390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d90, %hpstate
cpu_intr_2_177:
	setx	0x300308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0544000  ! 2393: LDSH_R	ldsh	[%r17 + %r0], %r24
cpu_intr_2_178:
	setx	0x330234, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_179:
	setx	0x30022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4421d2  ! 2399: LDSW_I	ldsw	[%r16 + 0x01d2], %r31
T2_asi_reg_wr_108:
	mov	0x35, %r14
	.word 0xf6f389e0  ! 2402: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_105:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 2404: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb63c6019  ! 2405: XNOR_I	xnor 	%r17, 0x0019, %r27
	.word 0xfacd8020  ! 2407: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xf6c5a135  ! 2409: LDSWA_I	ldswa	[%r22, + 0x0135] %asi, %r27
T2_asi_reg_wr_109:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 2410: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_wr_110:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 2411: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_180:
	setx	0x300035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_111:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2417: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc858020  ! 2419: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	.word 0xf28da1d5  ! 2421: LDUBA_I	lduba	[%r22, + 0x01d5] %asi, %r25
	.word 0xfc44e105  ! 2425: LDSW_I	ldsw	[%r19 + 0x0105], %r30
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_106:
	mov	0x23, %r14
	.word 0xf0db8e60  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_107:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa84208c  ! 2431: LDUWA_I	lduwa	[%r16, + 0x008c] %asi, %r29
T2_asi_reg_rd_108:
	mov	0x3, %r14
	.word 0xf2db8400  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfac4a08e  ! 2438: LDSWA_I	ldswa	[%r18, + 0x008e] %asi, %r29
cpu_intr_2_181:
	setx	0x300104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_112:
	mov	0x31, %r14
	.word 0xf6f38e60  ! 2442: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_113:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 2445: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_109:
	mov	0x13, %r14
	.word 0xfadb8e60  ! 2453: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_114:
	mov	0x1, %r14
	.word 0xfcf38400  ! 2455: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_115:
	mov	0x35, %r14
	.word 0xf4f38400  ! 2457: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfec56074  ! 2458: LDSWA_I	ldswa	[%r21, + 0x0074] %asi, %r31
T2_asi_reg_wr_116:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 2460: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_110:
	mov	0x18, %r14
	.word 0xf0db8400  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_117:
	mov	0xb, %r14
	.word 0xf8f384a0  ! 2464: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa942179  ! 2465: LDUHA_I	lduha	[%r16, + 0x0179] %asi, %r29
cpu_intr_2_182:
	setx	0x330237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_183:
	setx	0x300018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_184:
	setx	0x300008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c60c9  ! 2469: LDX_I	ldx	[%r17 + 0x00c9], %r26
	.word 0xbf2dd000  ! 2471: SLLX_R	sllx	%r23, %r0, %r31
T2_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 2472: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6c560d9  ! 2476: LDSWA_I	ldswa	[%r21, + 0x00d9] %asi, %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_118:
	mov	0x22, %r14
	.word 0xf4f38e80  ! 2479: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 16)
	.word 0xbe1c4000  ! 2483: XOR_R	xor 	%r17, %r0, %r31
T2_asi_reg_rd_112:
	mov	0x2e, %r14
	.word 0xfedb8e60  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_185:
	setx	0x30032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dc613b  ! 2489: LDXA_I	ldxa	[%r17, + 0x013b] %asi, %r25
T2_asi_reg_rd_113:
	mov	0x2a, %r14
	.word 0xf8db8e60  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf605a131  ! 2492: LDUW_I	lduw	[%r22 + 0x0131], %r27
T2_asi_reg_rd_114:
	mov	0x10, %r14
	.word 0xfadb8e40  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa0d4000  ! 2497: LDUB_R	ldub	[%r21 + %r0], %r29
T2_asi_reg_wr_119:
	mov	0x8, %r14
	.word 0xfcf389e0  ! 2498: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc8da138  ! 2501: LDUBA_I	lduba	[%r22, + 0x0138] %asi, %r30
cpu_intr_2_186:
	setx	0x31022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_120:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 2506: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_rd_115:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 2508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_116:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 2509: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_117:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 2515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8040000  ! 2516: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xf204604f  ! 2521: LDUW_I	lduw	[%r17 + 0x004f], %r25
T2_asi_reg_rd_118:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_187:
	setx	0x310125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x33002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00420c0  ! 2527: LDUW_I	lduw	[%r16 + 0x00c0], %r24
T2_asi_reg_wr_121:
	mov	0x34, %r14
	.word 0xfcf38e80  ! 2531: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_122:
	mov	0x34, %r14
	.word 0xf6f38e80  ! 2532: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 33)
	.word 0xfec4e125  ! 2536: LDSWA_I	ldswa	[%r19, + 0x0125] %asi, %r31
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 29)
	.word 0xf88d6104  ! 2539: LDUBA_I	lduba	[%r21, + 0x0104] %asi, %r28
T2_asi_reg_wr_123:
	mov	0x24, %r14
	.word 0xf8f38e60  ! 2541: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_189:
	setx	0x320239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81ce11d  ! 2549: XOR_I	xor 	%r19, 0x011d, %r28
	.word 0xbc358000  ! 2550: SUBC_R	orn 	%r22, %r0, %r30
T2_asi_reg_rd_119:
	mov	0xd, %r14
	.word 0xf2db8e60  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_190:
	setx	0x300007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc4020  ! 2556: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	.word 0xfa044000  ! 2562: LDUW_R	lduw	[%r17 + %r0], %r29
T2_asi_reg_rd_120:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_121:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 2566: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_191:
	setx	0x31020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_192:
	setx	0x320306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_193:
	setx	0x330030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfc0da0d1  ! 2578: LDUB_I	ldub	[%r22 + 0x00d1], %r30
	.word 0xfa55c000  ! 2579: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xfecda19c  ! 2580: LDSBA_I	ldsba	[%r22, + 0x019c] %asi, %r31
	.word 0xb2140000  ! 2581: OR_R	or 	%r16, %r0, %r25
	.word 0xf48d6003  ! 2582: LDUBA_I	lduba	[%r21, + 0x0003] %asi, %r26
	.word 0xfc058000  ! 2583: LDUW_R	lduw	[%r22 + %r0], %r30
T2_asi_reg_wr_124:
	mov	0x37, %r14
	.word 0xfaf389e0  ! 2584: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_194:
	setx	0x300125, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_122:
	mov	0x10, %r14
	.word 0xf8db89e0  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 1)
	.word 0xbcbd20d9  ! 2597: XNORcc_I	xnorcc 	%r20, 0x00d9, %r30
	.word 0xf2858020  ! 2604: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	.word 0xfe548000  ! 2605: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xf48d617b  ! 2606: LDUBA_I	lduba	[%r21, + 0x017b] %asi, %r26
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 30)
	.word 0xb805201e  ! 2609: ADD_I	add 	%r20, 0x001e, %r28
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_195:
	setx	0x330016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa848020  ! 2614: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_196:
	setx	0x31033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5c000  ! 2621: ORNcc_R	orncc 	%r23, %r0, %r28
	.word 0xb6ac6056  ! 2627: ANDNcc_I	andncc 	%r17, 0x0056, %r27
	.word 0xf4054000  ! 2630: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xb92d0000  ! 2632: SLL_R	sll 	%r20, %r0, %r28
cpu_intr_2_197:
	setx	0x30022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615a079  ! 2634: LDUH_I	lduh	[%r22 + 0x0079], %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_123:
	mov	0x23, %r14
	.word 0xf0db8400  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfe150000  ! 2640: LDUH_R	lduh	[%r20 + %r0], %r31
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa15e1ae  ! 2644: LDUH_I	lduh	[%r23 + 0x01ae], %r29
T2_asi_reg_rd_124:
	mov	0x13, %r14
	.word 0xf6db89e0  ! 2648: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_198:
	setx	0x30032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_199:
	setx	0x320333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb345000  ! 2661: SRLX_R	srlx	%r17, %r0, %r29
cpu_intr_2_200:
	setx	0x30010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 3)
	.word 0xb934b001  ! 2665: SRLX_I	srlx	%r18, 0x0001, %r28
T2_asi_reg_rd_125:
	mov	0x5, %r14
	.word 0xf6db84a0  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 19)
	.word 0xfe55e102  ! 2671: LDSH_I	ldsh	[%r23 + 0x0102], %r31
	.word 0xf60c8000  ! 2673: LDUB_R	ldub	[%r18 + %r0], %r27
	.word 0xf684605a  ! 2675: LDUWA_I	lduwa	[%r17, + 0x005a] %asi, %r27
	.word 0xb895a1b3  ! 2676: ORcc_I	orcc 	%r22, 0x01b3, %r28
cpu_intr_2_201:
	setx	0x330327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4842070  ! 2679: LDUWA_I	lduwa	[%r16, + 0x0070] %asi, %r26
	.word 0xfa946083  ! 2683: LDUHA_I	lduha	[%r17, + 0x0083] %asi, %r29
	.word 0xfa4d2167  ! 2685: LDSB_I	ldsb	[%r20 + 0x0167], %r29
T2_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 2686: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8cc8020  ! 2690: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 33)
	.word 0xfcc5a1c6  ! 2696: LDSWA_I	ldswa	[%r22, + 0x01c6] %asi, %r30
	.word 0xf25461d3  ! 2698: LDSH_I	ldsh	[%r17 + 0x01d3], %r25
	.word 0xf44de144  ! 2699: LDSB_I	ldsb	[%r23 + 0x0144], %r26
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 32)
	.word 0xf055c000  ! 2704: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xb8c48000  ! 2711: ADDCcc_R	addccc 	%r18, %r0, %r28
	.word 0xb0158000  ! 2712: OR_R	or 	%r22, %r0, %r24
	.word 0xf2c50020  ! 2713: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_126:
	mov	0x35, %r14
	.word 0xf6f389e0  ! 2716: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_126:
	mov	0x3, %r14
	.word 0xfedb8400  ! 2717: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_rd_127:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 2719: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_202:
	setx	0x32002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf855e0b2  ! 2723: LDSH_I	ldsh	[%r23 + 0x00b2], %r28
T2_asi_reg_wr_127:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 2724: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_128:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 2725: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf08d4020  ! 2729: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982cd0  ! 2730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
T2_asi_reg_wr_129:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 2731: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc55e155  ! 2732: LDSH_I	ldsh	[%r23 + 0x0155], %r30
	.word 0xf6cc603a  ! 2733: LDSBA_I	ldsba	[%r17, + 0x003a] %asi, %r27
	.word 0xf2dc610c  ! 2737: LDXA_I	ldxa	[%r17, + 0x010c] %asi, %r25
cpu_intr_2_203:
	setx	0x370304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc0020  ! 2740: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
	.word 0xfc856116  ! 2741: LDUWA_I	lduwa	[%r21, + 0x0116] %asi, %r30
	.word 0xb40da144  ! 2744: AND_I	and 	%r22, 0x0144, %r26
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983bda  ! 2746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bda, %hpstate
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 16)
	.word 0xfa852003  ! 2749: LDUWA_I	lduwa	[%r20, + 0x0003] %asi, %r29
cpu_intr_2_204:
	setx	0x360113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8958020  ! 2752: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 24)
	.word 0xa1902000  ! 2755: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_2_205:
	setx	0x36010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_130:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 2762: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf8042084  ! 2766: LDUW_I	lduw	[%r16 + 0x0084], %r28
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfc958020  ! 2772: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_128:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb13cc000  ! 2776: SRA_R	sra 	%r19, %r0, %r24
	.word 0xf48ce189  ! 2777: LDUBA_I	lduba	[%r19, + 0x0189] %asi, %r26
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, f)
	.word 0xfad58020  ! 2785: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r29
	.word 0xfedde0b9  ! 2787: LDXA_I	ldxa	[%r23, + 0x00b9] %asi, %r31
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2140000  ! 2790: LDUH_R	lduh	[%r16 + %r0], %r25
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_206:
	setx	0x37013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 0)
	.word 0xfa5cc000  ! 2798: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf0954020  ! 2801: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
	.word 0xfc44e1ea  ! 2802: LDSW_I	ldsw	[%r19 + 0x01ea], %r30
T2_asi_reg_wr_131:
	mov	0x25, %r14
	.word 0xf0f384a0  ! 2804: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf044a1a9  ! 2808: LDSW_I	ldsw	[%r18 + 0x01a9], %r24
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf4cda0b6  ! 2814: LDSBA_I	ldsba	[%r22, + 0x00b6] %asi, %r26
T2_asi_reg_rd_129:
	mov	0x25, %r14
	.word 0xf4db8e80  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_207:
	setx	0x350310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb2c4608f  ! 2825: ADDCcc_I	addccc 	%r17, 0x008f, %r25
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_208:
	setx	0x35013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cdc020  ! 2830: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
cpu_intr_2_209:
	setx	0x340201, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f88  ! 2835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
	.word 0xfa94a13d  ! 2836: LDUHA_I	lduha	[%r18, + 0x013d] %asi, %r29
	.word 0xfe54a03a  ! 2837: LDSH_I	ldsh	[%r18 + 0x003a], %r31
cpu_intr_2_210:
	setx	0x340314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa940020  ! 2842: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
T2_asi_reg_rd_130:
	mov	0x1d, %r14
	.word 0xfcdb89e0  ! 2843: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb09421ad  ! 2845: ORcc_I	orcc 	%r16, 0x01ad, %r24
T2_asi_reg_wr_132:
	mov	0x15, %r14
	.word 0xf0f38e60  ! 2846: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_133:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2847: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_134:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 2848: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_211:
	setx	0x34020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 2850: LDSB_R	ldsb	[%r16 + %r0], %r29
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 6)
	.word 0xbd3ce001  ! 2852: SRA_I	sra 	%r19, 0x0001, %r30
cpu_intr_2_212:
	setx	0x37001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_213:
	setx	0x35020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_131:
	mov	0x30, %r14
	.word 0xf0db8e60  ! 2858: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_135:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 2859: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf4cc0020  ! 2860: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
T2_asi_reg_wr_136:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 2864: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_214:
	setx	0x37010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe844000  ! 2866: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xbf51c000  ! 2867: RDPR_TL	<illegal instruction>
	.word 0xf28d4020  ! 2868: LDUBA_R	lduba	[%r21, %r0] 0x01, %r25
cpu_intr_2_215:
	setx	0x36020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_137:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 2870: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xa1902000  ! 2871: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_132:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 2874: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb844207f  ! 2876: ADDC_I	addc 	%r16, 0x007f, %r28
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a82  ! 2877: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
	.word 0x8f902000  ! 2878: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf60d8000  ! 2880: LDUB_R	ldub	[%r22 + %r0], %r27
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_138:
	mov	0x1a, %r14
	.word 0xf2f38400  ! 2885: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_133:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_216:
	setx	0x340133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2893: RDPR_PIL	<illegal instruction>
cpu_intr_2_217:
	setx	0x370201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_218:
	setx	0x34022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_134:
	mov	0x18, %r14
	.word 0xf4db8400  ! 2897: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf6d4c020  ! 2898: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
cpu_intr_2_219:
	setx	0x34030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_220:
	setx	0x370338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d42152  ! 2903: LDSHA_I	ldsha	[%r16, + 0x0152] %asi, %r24
cpu_intr_2_221:
	setx	0x34033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_222:
	setx	0x35003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe0c8000  ! 2914: LDUB_R	ldub	[%r18 + %r0], %r31
cpu_intr_2_223:
	setx	0x360203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a5e0c8  ! 2916: SUBcc_I	subcc 	%r23, 0x00c8, %r28
T2_asi_reg_rd_135:
	mov	0x1, %r14
	.word 0xf2db8e80  ! 2919: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_224:
	setx	0x37013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccd6188  ! 2923: LDSBA_I	ldsba	[%r21, + 0x0188] %asi, %r30
	.word 0xfadde12c  ! 2930: LDXA_I	ldxa	[%r23, + 0x012c] %asi, %r29
	.word 0xfc4ce07b  ! 2932: LDSB_I	ldsb	[%r19 + 0x007b], %r30
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 2940: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa4d4000  ! 2943: LDSB_R	ldsb	[%r21 + %r0], %r29
T2_asi_reg_rd_136:
	mov	0x32, %r14
	.word 0xf4db84a0  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfc14e045  ! 2951: LDUH_I	lduh	[%r19 + 0x0045], %r30
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_140:
	mov	0x2f, %r14
	.word 0xf2f389e0  ! 2957: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf605c000  ! 2958: LDUW_R	lduw	[%r23 + %r0], %r27
T2_asi_reg_wr_141:
	mov	0x1f, %r14
	.word 0xf4f38e80  ! 2959: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf295e15e  ! 2960: LDUHA_I	lduha	[%r23, + 0x015e] %asi, %r25
cpu_intr_2_225:
	setx	0x360129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad5c020  ! 2966: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_142:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 2970: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_137:
	mov	0x2d, %r14
	.word 0xf2db8e80  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb6bc60fc  ! 2973: XNORcc_I	xnorcc 	%r17, 0x00fc, %r27
cpu_intr_2_226:
	setx	0x34023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_227:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_138:
	mov	0x2f, %r14
	.word 0xf8db84a0  ! 2979: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc4461e8  ! 2982: LDSW_I	ldsw	[%r17 + 0x01e8], %r30
T2_asi_reg_wr_143:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 2983: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_rd_139:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_rd_140:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 2988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_144:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 2990: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_228:
	setx	0x34000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 2994: RDPR_TPC	<illegal instruction>
	.word 0xfacc61e8  ! 2996: LDSBA_I	ldsba	[%r17, + 0x01e8] %asi, %r29
T2_asi_reg_wr_145:
	mov	0x27, %r14
	.word 0xfcf38400  ! 3000: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_rd_141:
	mov	0x14, %r14
	.word 0xf4db8400  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfe4c8000  ! 3002: LDSB_R	ldsb	[%r18 + %r0], %r31
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfecdc020  ! 3007: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_229:
	setx	0x37021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_230:
	setx	0x350135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_142:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_143:
	mov	0x4, %r14
	.word 0xf2db89e0  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_144:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf64ce13b  ! 3021: LDSB_I	ldsb	[%r19 + 0x013b], %r27
	.word 0xf045c000  ! 3022: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf4544000  ! 3025: LDSH_R	ldsh	[%r17 + %r0], %r26
cpu_intr_2_231:
	setx	0x360306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_232:
	setx	0x340037, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_145:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6c5e17d  ! 3030: LDSWA_I	ldswa	[%r23, + 0x017d] %asi, %r27
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_146:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 3042: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb41d203d  ! 3043: XOR_I	xor 	%r20, 0x003d, %r26
T2_asi_reg_wr_146:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 3044: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb6c5617a  ! 3045: ADDCcc_I	addccc 	%r21, 0x017a, %r27
	.word 0xf44d20f8  ! 3048: LDSB_I	ldsb	[%r20 + 0x00f8], %r26
cpu_intr_2_233:
	setx	0x35023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a44000  ! 3054: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xf48ca0ab  ! 3061: LDUBA_I	lduba	[%r18, + 0x00ab] %asi, %r26
	.word 0xfe95e097  ! 3062: LDUHA_I	lduha	[%r23, + 0x0097] %asi, %r31
T2_asi_reg_rd_147:
	mov	0x24, %r14
	.word 0xfedb89e0  ! 3064: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_234:
	setx	0x360308, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_147:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 3071: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbb643801  ! 3072: MOVcc_I	<illegal instruction>
	.word 0xf25de07c  ! 3076: LDX_I	ldx	[%r23 + 0x007c], %r25
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, f)
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 30)
	.word 0xb93dc000  ! 3085: SRA_R	sra 	%r23, %r0, %r28
	.word 0xf805e0bc  ! 3086: LDUW_I	lduw	[%r23 + 0x00bc], %r28
	.word 0x919461c5  ! 3088: WRPR_PIL_I	wrpr	%r17, 0x01c5, %pil
T2_asi_reg_rd_148:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf48d201f  ! 3095: LDUBA_I	lduba	[%r20, + 0x001f] %asi, %r26
	.word 0xfcc5e0aa  ! 3097: LDSWA_I	ldswa	[%r23, + 0x00aa] %asi, %r30
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 24)
	.word 0xf48d8020  ! 3102: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
	.word 0xba9d8000  ! 3103: XORcc_R	xorcc 	%r22, %r0, %r29
cpu_intr_2_235:
	setx	0x340135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb094a015  ! 3105: ORcc_I	orcc 	%r18, 0x0015, %r24
	.word 0xf2842155  ! 3107: LDUWA_I	lduwa	[%r16, + 0x0155] %asi, %r25
T2_asi_reg_wr_148:
	mov	0x20, %r14
	.word 0xf8f384a0  ! 3112: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8444000  ! 3115: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf0d521f8  ! 3117: LDSHA_I	ldsha	[%r20, + 0x01f8] %asi, %r24
	.word 0xf28c8020  ! 3118: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_149:
	mov	0x5, %r14
	.word 0xfcf38400  ! 3119: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_236:
	setx	0x340306, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_150:
	mov	0x10, %r14
	.word 0xfcf38e60  ! 3127: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_wr_151:
	mov	0x3, %r14
	.word 0xfef38e40  ! 3129: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf844a0d6  ! 3131: LDSW_I	ldsw	[%r18 + 0x00d6], %r28
	.word 0xb68460d7  ! 3135: ADDcc_I	addcc 	%r17, 0x00d7, %r27
	.word 0xb01ce0d7  ! 3138: XOR_I	xor 	%r19, 0x00d7, %r24
	.word 0xfc050000  ! 3141: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfe054000  ! 3142: LDUW_R	lduw	[%r21 + %r0], %r31
T2_asi_reg_rd_149:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_150:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_237:
	setx	0x370024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc84c020  ! 3146: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_238:
	setx	0x340226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_239:
	setx	0x360137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 17)
	.word 0xb9504000  ! 3162: RDPR_TNPC	<illegal instruction>
T2_asi_reg_rd_151:
	mov	0x23, %r14
	.word 0xf8db8e40  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbebd4000  ! 3165: XNORcc_R	xnorcc 	%r21, %r0, %r31
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_152:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfeccc020  ! 3174: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
T2_asi_reg_wr_152:
	mov	0x15, %r14
	.word 0xf0f38e80  ! 3175: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ec8  ! 3177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec8, %hpstate
T2_asi_reg_rd_153:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3179: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 26)
	.word 0xb6244000  ! 3183: SUB_R	sub 	%r17, %r0, %r27
	.word 0xf4dce1a3  ! 3184: LDXA_I	ldxa	[%r19, + 0x01a3] %asi, %r26
	.word 0xf455a070  ! 3186: LDSH_I	ldsh	[%r22 + 0x0070], %r26
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa14e027  ! 3194: LDUH_I	lduh	[%r19 + 0x0027], %r29
	.word 0xfccda02d  ! 3195: LDSBA_I	ldsba	[%r22, + 0x002d] %asi, %r30
	.word 0xf0c4e06f  ! 3199: LDSWA_I	ldswa	[%r19, + 0x006f] %asi, %r24
	.word 0xfa852104  ! 3203: LDUWA_I	lduwa	[%r20, + 0x0104] %asi, %r29
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
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 22)
	.word 0xb7480000  ! 3208: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
T2_asi_reg_rd_154:
	mov	0x2f, %r14
	.word 0xfadb8e80  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb6bc215d  ! 3210: XNORcc_I	xnorcc 	%r16, 0x015d, %r27
T2_asi_reg_wr_153:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 3215: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_154:
	mov	0x31, %r14
	.word 0xfcf384a0  ! 3218: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_240:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_241:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 3223: LDUH_R	lduh	[%r16 + %r0], %r25
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_155:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 3225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_155:
	mov	0xf, %r14
	.word 0xfaf38e80  ! 3227: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xba8c6063  ! 3233: ANDcc_I	andcc 	%r17, 0x0063, %r29
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6550000  ! 3235: LDSH_R	ldsh	[%r20 + %r0], %r27
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfadda121  ! 3242: LDXA_I	ldxa	[%r22, + 0x0121] %asi, %r29
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198294a  ! 3243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
T2_asi_reg_rd_156:
	mov	0x1d, %r14
	.word 0xf4db89e0  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbb7dc400  ! 3246: MOVR_R	movre	%r23, %r0, %r29
cpu_intr_2_242:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_157:
	mov	0x24, %r14
	.word 0xf8db8e40  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb435610e  ! 3251: ORN_I	orn 	%r21, 0x010e, %r26
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 3)
	.word 0xfecd21a9  ! 3254: LDSBA_I	ldsba	[%r20, + 0x01a9] %asi, %r31
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_243:
	setx	0x380202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf454606a  ! 3258: LDSH_I	ldsh	[%r17 + 0x006a], %r26
	.word 0xb92d3001  ! 3260: SLLX_I	sllx	%r20, 0x0001, %r28
	.word 0xf6d40020  ! 3261: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	.word 0xf8048000  ! 3263: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf4d5a19b  ! 3265: LDSHA_I	ldsha	[%r22, + 0x019b] %asi, %r26
	.word 0xf4c4e08e  ! 3266: LDSWA_I	ldswa	[%r19, + 0x008e] %asi, %r26
	.word 0xf894608d  ! 3271: LDUHA_I	lduha	[%r17, + 0x008d] %asi, %r28
cpu_intr_2_244:
	setx	0x38032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8561c5  ! 3273: LDUWA_I	lduwa	[%r21, + 0x01c5] %asi, %r31
T2_asi_reg_rd_158:
	mov	0x1d, %r14
	.word 0xf4db89e0  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb02d0000  ! 3277: ANDN_R	andn 	%r20, %r0, %r24
T2_asi_reg_rd_159:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_160:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_161:
	mov	0x1a, %r14
	.word 0xf4db89e0  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 13)
	.word 0xb08420d3  ! 3293: ADDcc_I	addcc 	%r16, 0x00d3, %r24
	.word 0xf05ce0bc  ! 3297: LDX_I	ldx	[%r19 + 0x00bc], %r24
T2_asi_reg_wr_156:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 3299: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 37)
	.word 0xfe8ce1be  ! 3302: LDUBA_I	lduba	[%r19, + 0x01be] %asi, %r31
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_162:
	mov	0x2a, %r14
	.word 0xf4db89e0  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf604e19d  ! 3309: LDUW_I	lduw	[%r19 + 0x019d], %r27
T2_asi_reg_rd_163:
	mov	0x7, %r14
	.word 0xfcdb89e0  ! 3310: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_157:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 3313: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_245:
	setx	0x380319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd5a0c5  ! 3318: LDSHA_I	ldsha	[%r22, + 0x00c5] %asi, %r30
	.word 0xf49420f6  ! 3319: LDUHA_I	lduha	[%r16, + 0x00f6] %asi, %r26
T2_asi_reg_wr_158:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 3320: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_159:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 3323: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_246:
	setx	0x3a0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbaa48000  ! 3330: SUBcc_R	subcc 	%r18, %r0, %r29
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_247:
	setx	0x3a0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb825c000  ! 3342: SUB_R	sub 	%r23, %r0, %r28
T2_asi_reg_rd_164:
	mov	0x2c, %r14
	.word 0xf0db8e80  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_248:
	setx	0x3b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadda0d1  ! 3346: LDXA_I	ldxa	[%r22, + 0x00d1] %asi, %r29
	.word 0xf05c60cf  ! 3348: LDX_I	ldx	[%r17 + 0x00cf], %r24
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_160:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 3355: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf2944020  ! 3356: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	.word 0xfc540000  ! 3357: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xb605c000  ! 3358: ADD_R	add 	%r23, %r0, %r27
	.word 0xf8c4e178  ! 3359: LDSWA_I	ldswa	[%r19, + 0x0178] %asi, %r28
cpu_intr_2_249:
	setx	0x3a020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 3363: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf8940020  ! 3364: LDUHA_R	lduha	[%r16, %r0] 0x01, %r28
	.word 0xf844c000  ! 3365: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xfe5c0000  ! 3366: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xfe85c020  ! 3367: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
	.word 0xf20da118  ! 3374: LDUB_I	ldub	[%r22 + 0x0118], %r25
T2_asi_reg_wr_161:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 3378: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_165:
	mov	0x1e, %r14
	.word 0xfcdb8e60  ! 3385: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_166:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf0d4a093  ! 3387: LDSHA_I	ldsha	[%r18, + 0x0093] %asi, %r24
cpu_intr_2_250:
	setx	0x3b011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 32)
	.word 0xbebc2157  ! 3391: XNORcc_I	xnorcc 	%r16, 0x0157, %r31
	.word 0xb93cf001  ! 3393: SRAX_I	srax	%r19, 0x0001, %r28
cpu_intr_2_251:
	setx	0x3a0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40ca102  ! 3398: LDUB_I	ldub	[%r18 + 0x0102], %r26
cpu_intr_2_252:
	setx	0x3a022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_162:
	mov	0x31, %r14
	.word 0xf8f38e60  ! 3403: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 6)
	.word 0xfc548000  ! 3411: LDSH_R	ldsh	[%r18 + %r0], %r30
cpu_intr_2_253:
	setx	0x3a0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d2103  ! 3413: LDUB_I	ldub	[%r20 + 0x0103], %r31
T2_asi_reg_wr_163:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 3415: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfecd0020  ! 3417: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xf6cd8020  ! 3418: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
T2_asi_reg_rd_167:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_wr_164:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 3420: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_254:
	setx	0x3b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_255:
	setx	0x380216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf484e084  ! 3426: LDUWA_I	lduwa	[%r19, + 0x0084] %asi, %r26
cpu_intr_2_256:
	setx	0x380004, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_165:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 3431: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_166:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 3435: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb6340000  ! 3436: ORN_R	orn 	%r16, %r0, %r27
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_167:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 3442: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8cc2089  ! 3443: LDSBA_I	ldsba	[%r16, + 0x0089] %asi, %r28
	.word 0xb72de001  ! 3444: SLL_I	sll 	%r23, 0x0001, %r27
cpu_intr_2_257:
	setx	0x380126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52c7001  ! 3448: SLLX_I	sllx	%r17, 0x0001, %r26
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_168:
	mov	0x10, %r14
	.word 0xf6f384a0  ! 3452: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_169:
	mov	0x21, %r14
	.word 0xf4f38e80  ! 3457: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xf4d48020  ! 3464: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xfc554000  ! 3467: LDSH_R	ldsh	[%r21 + %r0], %r30
T2_asi_reg_wr_170:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3468: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_171:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 3469: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_168:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_172:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 3471: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf0c5e0c4  ! 3474: LDSWA_I	ldswa	[%r23, + 0x00c4] %asi, %r24
T2_asi_reg_rd_169:
	mov	0x1e, %r14
	.word 0xfedb84a0  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_173:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 3481: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfc448000  ! 3484: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf8158000  ! 3489: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xf0c5c020  ! 3492: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a92  ! 3495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_258:
	setx	0x39002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x39000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc84a153  ! 3505: LDUWA_I	lduwa	[%r18, + 0x0153] %asi, %r30
cpu_intr_2_260:
	setx	0x380237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_170:
	mov	0x18, %r14
	.word 0xf2db8400  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_261:
	setx	0x3b022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6cd4020  ! 3515: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_171:
	mov	0x32, %r14
	.word 0xf0db8e60  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_262:
	setx	0x3a0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x3a0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_174:
	mov	0x5, %r14
	.word 0xf8f38e60  ! 3523: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_264:
	setx	0x3b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_265:
	setx	0x3b0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c50020  ! 3529: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
	.word 0xf854c000  ! 3530: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0x8995a1b8  ! 3531: WRPR_TICK_I	wrpr	%r22, 0x01b8, %tick
T2_asi_reg_rd_172:
	mov	0x25, %r14
	.word 0xfcdb89e0  ! 3532: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbc0d8000  ! 3533: AND_R	and 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_173:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbc2ce024  ! 3542: ANDN_I	andn 	%r19, 0x0024, %r30
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 34)
	.word 0xf2d4616e  ! 3550: LDSHA_I	ldsha	[%r17, + 0x016e] %asi, %r25
	.word 0xfa14e117  ! 3553: LDUH_I	lduh	[%r19 + 0x0117], %r29
	.word 0xb7354000  ! 3556: SRL_R	srl 	%r21, %r0, %r27
	.word 0xf49561a8  ! 3557: LDUHA_I	lduha	[%r21, + 0x01a8] %asi, %r26
cpu_intr_2_266:
	setx	0x390339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cce056  ! 3562: LDSBA_I	ldsba	[%r19, + 0x0056] %asi, %r24
	.word 0xf6158000  ! 3565: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xb0c50000  ! 3566: ADDCcc_R	addccc 	%r20, %r0, %r24
cpu_intr_2_267:
	setx	0x380124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c4000  ! 3568: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf20de078  ! 3569: LDUB_I	ldub	[%r23 + 0x0078], %r25
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d1a  ! 3570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d1a, %hpstate
	.word 0xfe45a1c6  ! 3571: LDSW_I	ldsw	[%r22 + 0x01c6], %r31
	.word 0xf895a11f  ! 3573: LDUHA_I	lduha	[%r22, + 0x011f] %asi, %r28
T2_asi_reg_wr_175:
	mov	0xf, %r14
	.word 0xfef38e40  ! 3574: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_174:
	mov	0x2e, %r14
	.word 0xfadb8e80  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_176:
	mov	0x29, %r14
	.word 0xf2f384a0  ! 3581: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_268:
	setx	0x38001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695a142  ! 3586: LDUHA_I	lduha	[%r22, + 0x0142] %asi, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb4140000  ! 3588: OR_R	or 	%r16, %r0, %r26
	.word 0xfed460a3  ! 3589: LDSHA_I	ldsha	[%r17, + 0x00a3] %asi, %r31
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819839d8  ! 3590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d8, %hpstate
T2_asi_reg_rd_175:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_269:
	setx	0x38011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 23)
	.word 0xfccca126  ! 3596: LDSBA_I	ldsba	[%r18, + 0x0126] %asi, %r30
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_270:
	setx	0x38032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41d4000  ! 3602: XOR_R	xor 	%r21, %r0, %r26
	.word 0xf08c6162  ! 3603: LDUBA_I	lduba	[%r17, + 0x0162] %asi, %r24
	.word 0xf285a0e5  ! 3604: LDUWA_I	lduwa	[%r22, + 0x00e5] %asi, %r25
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_HPRIV
	.word 0xfcdd2112  ! 3612: LDXA_I	ldxa	[%r20, + 0x0112] %asi, %r30
	.word 0xf85d0000  ! 3613: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xf0cde0e2  ! 3614: LDSBA_I	ldsba	[%r23, + 0x00e2] %asi, %r24
T2_asi_reg_rd_176:
	mov	0x4, %r14
	.word 0xfedb89e0  ! 3617: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb97d4400  ! 3620: MOVR_R	movre	%r21, %r0, %r28
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a88  ! 3621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
	.word 0xf8850020  ! 3626: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xf2158000  ! 3628: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xf4d4e08b  ! 3629: LDSHA_I	ldsha	[%r19, + 0x008b] %asi, %r26
	.word 0xf08d61f5  ! 3630: LDUBA_I	lduba	[%r21, + 0x01f5] %asi, %r24
cpu_intr_2_271:
	setx	0x3e0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_2_272:
	setx	0x3f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_177:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 3636: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb62520ce  ! 3639: SUB_I	sub 	%r20, 0x00ce, %r27
	.word 0xfa944020  ! 3640: LDUHA_R	lduha	[%r17, %r0] 0x01, %r29
	.word 0xf28d8020  ! 3643: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xfcc4600a  ! 3645: LDSWA_I	ldswa	[%r17, + 0x000a] %asi, %r30
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 2b)
	.word 0xba35a0b3  ! 3655: ORN_I	orn 	%r22, 0x00b3, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf8840020  ! 3657: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r28
	.word 0xf4d52137  ! 3658: LDSHA_I	ldsha	[%r20, + 0x0137] %asi, %r26
	.word 0xf00d0000  ! 3659: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xf45ca09d  ! 3660: LDX_I	ldx	[%r18 + 0x009d], %r26
	.word 0xf08c2192  ! 3665: LDUBA_I	lduba	[%r16, + 0x0192] %asi, %r24
	.word 0xf25d4000  ! 3668: LDX_R	ldx	[%r21 + %r0], %r25
T2_asi_reg_wr_178:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 3677: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_179:
	mov	0x21, %r14
	.word 0xfaf389e0  ! 3678: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf8148000  ! 3681: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xbe954000  ! 3683: ORcc_R	orcc 	%r21, %r0, %r31
T2_asi_reg_wr_180:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 3684: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_273:
	setx	0x3e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_274:
	setx	0x3e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x3e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_276:
	setx	0x3e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb43d8000  ! 3698: XNOR_R	xnor 	%r22, %r0, %r26
	.word 0xb350c000  ! 3699: RDPR_TT	<illegal instruction>
cpu_intr_2_277:
	setx	0x3d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe856042  ! 3703: LDUWA_I	lduwa	[%r21, + 0x0042] %asi, %r31
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_278:
	setx	0x3c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_279:
	setx	0x3c0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_280:
	setx	0x3e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04a078  ! 3714: LDUW_I	lduw	[%r18 + 0x0078], %r29
	.word 0xfcd4e187  ! 3717: LDSHA_I	ldsha	[%r19, + 0x0187] %asi, %r30
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 36)
	.word 0xf685e1f4  ! 3723: LDUWA_I	lduwa	[%r23, + 0x01f4] %asi, %r27
	.word 0xfa0ce0f9  ! 3727: LDUB_I	ldub	[%r19 + 0x00f9], %r29
	.word 0xf68c4020  ! 3730: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
cpu_intr_2_281:
	setx	0x3e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_181:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 3734: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, c)
	.word 0xf604c000  ! 3738: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xbeade068  ! 3740: ANDNcc_I	andncc 	%r23, 0x0068, %r31
T2_asi_reg_wr_182:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 3741: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf694e0ed  ! 3743: LDUHA_I	lduha	[%r19, + 0x00ed] %asi, %r27
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, d)
	.word 0xf6d54020  ! 3747: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
cpu_intr_2_282:
	setx	0x3e0004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_283:
	setx	0x3f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_284:
	setx	0x3c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_285:
	setx	0x3d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0x34, %r14
	.word 0xf6db89e0  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_286:
	setx	0x3e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6340000  ! 3761: ORN_R	orn 	%r16, %r0, %r27
	.word 0xf0950020  ! 3764: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	.word 0xfc5cc000  ! 3765: LDX_R	ldx	[%r19 + %r0], %r30
T2_asi_reg_wr_183:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 3768: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfc55c000  ! 3770: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xfe4dc000  ! 3771: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf45da125  ! 3772: LDX_I	ldx	[%r22 + 0x0125], %r26
	.word 0xf68ce1d8  ! 3773: LDUBA_I	lduba	[%r19, + 0x01d8] %asi, %r27
	.word 0xf854c000  ! 3775: LDSH_R	ldsh	[%r19 + %r0], %r28
T2_asi_reg_rd_178:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 3776: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_287:
	setx	0x3e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0142003  ! 3782: LDUH_I	lduh	[%r16 + 0x0003], %r24
	.word 0xb7643801  ! 3783: MOVcc_I	<illegal instruction>
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfecde042  ! 3788: LDSBA_I	ldsba	[%r23, + 0x0042] %asi, %r31
T2_asi_reg_wr_184:
	mov	0x2b, %r14
	.word 0xfcf38e60  ! 3790: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_180:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_288:
	setx	0x3c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_289:
	setx	0x3c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_181:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 3796: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa8c8020  ! 3798: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_185:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 3803: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf88c6007  ! 3804: LDUBA_I	lduba	[%r17, + 0x0007] %asi, %r28
	.word 0xb3500000  ! 3805: RDPR_TPC	<illegal instruction>
cpu_intr_2_290:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_291:
	setx	0x3c0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe45213a  ! 3811: LDSW_I	ldsw	[%r20 + 0x013a], %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_186:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 3814: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf6548000  ! 3817: LDSH_R	ldsh	[%r18 + %r0], %r27
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 9)
	.word 0xf2858020  ! 3819: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	.word 0xb73d2001  ! 3820: SRA_I	sra 	%r20, 0x0001, %r27
T2_asi_reg_wr_187:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3822: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_292:
	setx	0x3c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe954020  ! 3824: LDUHA_R	lduha	[%r21, %r0] 0x01, %r31
cpu_intr_2_293:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c60c5  ! 3826: LDSB_I	ldsb	[%r17 + 0x00c5], %r31
	.word 0xf8cd0020  ! 3828: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xf25ce1c4  ! 3831: LDX_I	ldx	[%r19 + 0x01c4], %r25
	.word 0xf4458000  ! 3832: LDSW_R	ldsw	[%r22 + %r0], %r26
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_182:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfe8de12d  ! 3838: LDUBA_I	lduba	[%r23, + 0x012d] %asi, %r31
	.word 0xb32cd000  ! 3841: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xfa95e169  ! 3842: LDUHA_I	lduha	[%r23, + 0x0169] %asi, %r29
T2_asi_reg_rd_183:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbe858000  ! 3844: ADDcc_R	addcc 	%r22, %r0, %r31
cpu_intr_2_294:
	setx	0x3c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_295:
	setx	0x3f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_296:
	setx	0x3e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_297:
	setx	0x3d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_188:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 3855: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb4054000  ! 3856: ADD_R	add 	%r21, %r0, %r26
	.word 0xfc0c8000  ! 3859: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xf404e02c  ! 3861: LDUW_I	lduw	[%r19 + 0x002c], %r26
	ta	T_CHANGE_TO_TL1
	.word 0xbac4613c  ! 3865: ADDCcc_I	addccc 	%r17, 0x013c, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4142018  ! 3871: LDUH_I	lduh	[%r16 + 0x0018], %r26
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 32)
	.word 0xfacd8020  ! 3882: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xfa45a0b7  ! 3883: LDSW_I	ldsw	[%r22 + 0x00b7], %r29
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_184:
	mov	0xd, %r14
	.word 0xf0db8400  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_185:
	mov	0x6, %r14
	.word 0xfedb89e0  ! 3892: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf6dca0d6  ! 3893: LDXA_I	ldxa	[%r18, + 0x00d6] %asi, %r27
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 9)
	.word 0xbc84e13b  ! 3898: ADDcc_I	addcc 	%r19, 0x013b, %r30
	.word 0xb035c000  ! 3899: ORN_R	orn 	%r23, %r0, %r24
cpu_intr_2_298:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_189:
	mov	0x27, %r14
	.word 0xfef38e60  ! 3901: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf80ce1c9  ! 3902: LDUB_I	ldub	[%r19 + 0x01c9], %r28
cpu_intr_2_299:
	setx	0x3d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_300:
	setx	0x3d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2458000  ! 3907: LDSW_R	ldsw	[%r22 + %r0], %r25
cpu_intr_2_301:
	setx	0x3c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85e151  ! 3911: LDUWA_I	lduwa	[%r23, + 0x0151] %asi, %r30
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, b)
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_186:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 3915: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_187:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 3917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_188:
	mov	0x23, %r14
	.word 0xf8db8e40  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4440000  ! 3921: LDSW_R	ldsw	[%r16 + %r0], %r26
T2_asi_reg_wr_190:
	mov	0x2d, %r14
	.word 0xf0f38400  ! 3922: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfcc5c020  ! 3923: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_191:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 3926: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_189:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_302:
	setx	0x3c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 22)
	.word 0xf095e169  ! 3933: LDUHA_I	lduha	[%r23, + 0x0169] %asi, %r24
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
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f4a  ! 3937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
	.word 0xf00561f7  ! 3942: LDUW_I	lduw	[%r21 + 0x01f7], %r24
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 2)
	.word 0xf0848020  ! 3947: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfa8ce0bc  ! 3949: LDUBA_I	lduba	[%r19, + 0x00bc] %asi, %r29
	.word 0xfa540000  ! 3950: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf6440000  ! 3951: LDSW_R	ldsw	[%r16 + %r0], %r27
cpu_intr_2_303:
	setx	0x3c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc219a  ! 3954: LDSBA_I	ldsba	[%r16, + 0x019a] %asi, %r25
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_192:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 3956: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_304:
	setx	0x3e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec50020  ! 3959: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
cpu_intr_2_305:
	setx	0x3d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93dc000  ! 3962: SRA_R	sra 	%r23, %r0, %r28
T2_asi_reg_wr_193:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 3964: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 16)
	.word 0xf604214e  ! 3968: LDUW_I	lduw	[%r16 + 0x014e], %r27
	.word 0xf8dd60cf  ! 3969: LDXA_I	ldxa	[%r21, + 0x00cf] %asi, %r28
T2_asi_reg_wr_194:
	mov	0x4, %r14
	.word 0xfcf389e0  ! 3970: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfecd603a  ! 3971: LDSBA_I	ldsba	[%r21, + 0x003a] %asi, %r31
T2_asi_reg_rd_190:
	mov	0x33, %r14
	.word 0xf8db89e0  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_191:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 3975: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_192:
	mov	0x33, %r14
	.word 0xf6db8e80  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf08cc020  ! 3985: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
cpu_intr_2_306:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_193:
	mov	0x16, %r14
	.word 0xfadb8e80  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_195:
	mov	0x33, %r14
	.word 0xfcf38e40  ! 4000: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb0150000  ! 4003: OR_R	or 	%r20, %r0, %r24
cpu_intr_2_307:
	setx	0x3f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_194:
	mov	0x7, %r14
	.word 0xf6db8e60  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf28c8020  ! 4015: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_196:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 4016: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 0)
	.word 0xfe5c8000  ! 4020: LDX_R	ldx	[%r18 + %r0], %r31
cpu_intr_2_308:
	setx	0x3c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf49520b3  ! 4028: LDUHA_I	lduha	[%r20, + 0x00b3] %asi, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf25d8000  ! 4030: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xbd518000  ! 4031: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_wr_197:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 4032: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_309:
	setx	0x3e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_310:
	setx	0x3f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf255604a  ! 4039: LDSH_I	ldsh	[%r21 + 0x004a], %r25
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_311:
	setx	0x3d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad4e0ec  ! 4046: LDSHA_I	ldsha	[%r19, + 0x00ec] %asi, %r29
	.word 0xf684a060  ! 4047: LDUWA_I	lduwa	[%r18, + 0x0060] %asi, %r27
	.word 0xfe94e0ee  ! 4048: LDUHA_I	lduha	[%r19, + 0x00ee] %asi, %r31
	.word 0xfc0c0000  ! 4049: LDUB_R	ldub	[%r16 + %r0], %r30
T2_asi_reg_wr_198:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 4050: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_312:
	setx	0x3c0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf295e15a  ! 4052: LDUHA_I	lduha	[%r23, + 0x015a] %asi, %r25
	.word 0xf4848020  ! 4058: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf614a173  ! 4062: LDUH_I	lduh	[%r18 + 0x0173], %r27
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_313:
	setx	0x3c030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d2036  ! 4069: LDUB_I	ldub	[%r20 + 0x0036], %r28
T2_asi_reg_wr_199:
	mov	0x6, %r14
	.word 0xf0f38e80  ! 4072: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_200:
	mov	0xe, %r14
	.word 0xf0f38400  ! 4074: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_314:
	setx	0x3f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 28)
	.word 0xf00d4000  ! 4077: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xb0bde0d4  ! 4082: XNORcc_I	xnorcc 	%r23, 0x00d4, %r24
	.word 0xf44c8000  ! 4085: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xf604e15d  ! 4087: LDUW_I	lduw	[%r19 + 0x015d], %r27
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 33)
	.word 0xfa948020  ! 4091: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	.word 0xfa040000  ! 4092: LDUW_R	lduw	[%r16 + %r0], %r29
T2_asi_reg_wr_201:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 4093: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf24c0000  ! 4094: LDSB_R	ldsb	[%r16 + %r0], %r25
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb094e0e3  ! 4096: ORcc_I	orcc 	%r19, 0x00e3, %r24
cpu_intr_2_315:
	setx	0x420124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_316:
	setx	0x420034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_195:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe548000  ! 4106: LDSH_R	ldsh	[%r18 + %r0], %r31
T2_asi_reg_rd_196:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_317:
	setx	0x43010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84561d3  ! 4113: LDSW_I	ldsw	[%r21 + 0x01d3], %r28
	.word 0xfa4461d9  ! 4115: LDSW_I	ldsw	[%r17 + 0x01d9], %r29
cpu_intr_2_318:
	setx	0x40011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_197:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_319:
	setx	0x410109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_202:
	mov	0x2c, %r14
	.word 0xf4f38400  ! 4122: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 38)
	.word 0xfa94a018  ! 4125: LDUHA_I	lduha	[%r18, + 0x0018] %asi, %r29
	.word 0xf41520c9  ! 4128: LDUH_I	lduh	[%r20 + 0x00c9], %r26
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 26)
	.word 0xf0046096  ! 4133: LDUW_I	lduw	[%r17 + 0x0096], %r24
	.word 0xf40421a6  ! 4134: LDUW_I	lduw	[%r16 + 0x01a6], %r26
	.word 0xf044a034  ! 4138: LDSW_I	ldsw	[%r18 + 0x0034], %r24
	.word 0xf85da084  ! 4140: LDX_I	ldx	[%r22 + 0x0084], %r28
	.word 0xfc4da1a0  ! 4142: LDSB_I	ldsb	[%r22 + 0x01a0], %r30
	.word 0xfed4611c  ! 4146: LDSHA_I	ldsha	[%r17, + 0x011c] %asi, %r31
	ta	T_CHANGE_TO_TL1
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_198:
	mov	0x1e, %r14
	.word 0xf4db8400  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf65c4000  ! 4153: LDX_R	ldx	[%r17 + %r0], %r27
T2_asi_reg_wr_203:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 4154: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_320:
	setx	0x42023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_321:
	setx	0x420213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48d8020  ! 4158: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
cpu_intr_2_322:
	setx	0x42001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccdc020  ! 4163: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 14)
	.word 0xb1340000  ! 4165: SRL_R	srl 	%r16, %r0, %r24
	.word 0xfe144000  ! 4168: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xf0148000  ! 4169: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf8dca13d  ! 4170: LDXA_I	ldxa	[%r18, + 0x013d] %asi, %r28
cpu_intr_2_323:
	setx	0x410227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 30)
	.word 0xfa94e1a4  ! 4175: LDUHA_I	lduha	[%r19, + 0x01a4] %asi, %r29
	.word 0xb3354000  ! 4177: SRL_R	srl 	%r21, %r0, %r25
cpu_intr_2_324:
	setx	0x420031, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_204:
	mov	0x32, %r14
	.word 0xf2f38400  ! 4182: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf60420f9  ! 4183: LDUW_I	lduw	[%r16 + 0x00f9], %r27
	.word 0xf64da15e  ! 4185: LDSB_I	ldsb	[%r22 + 0x015e], %r27
	.word 0xf44de149  ! 4186: LDSB_I	ldsb	[%r23 + 0x0149], %r26
cpu_intr_2_325:
	setx	0x43023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_199:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 4190: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_205:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 4191: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_206:
	mov	0x2f, %r14
	.word 0xfcf38e80  ! 4192: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_326:
	setx	0x42012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48d20b5  ! 4195: LDUBA_I	lduba	[%r20, + 0x00b5] %asi, %r26
	.word 0xf45ce12a  ! 4196: LDX_I	ldx	[%r19 + 0x012a], %r26
	.word 0xf214c000  ! 4199: LDUH_R	lduh	[%r19 + %r0], %r25
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 38)
	.word 0xfad54020  ! 4203: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
	.word 0xf25ca086  ! 4206: LDX_I	ldx	[%r18 + 0x0086], %r25
	.word 0xf0154000  ! 4208: LDUH_R	lduh	[%r21 + %r0], %r24
cpu_intr_2_327:
	setx	0x42002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc940020  ! 4210: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
	.word 0xf48d20f0  ! 4211: LDUBA_I	lduba	[%r20, + 0x00f0] %asi, %r26
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c10  ! 4212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c10, %hpstate
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c50  ! 4215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c50, %hpstate
T2_asi_reg_wr_207:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 4216: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_328:
	setx	0x420025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_329:
	setx	0x400332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_200:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, e)
	.word 0xf894a06e  ! 4228: LDUHA_I	lduha	[%r18, + 0x006e] %asi, %r28
	.word 0xb0854000  ! 4229: ADDcc_R	addcc 	%r21, %r0, %r24
	.word 0xfad521ec  ! 4236: LDSHA_I	ldsha	[%r20, + 0x01ec] %asi, %r29
	.word 0xfcd520b4  ! 4238: LDSHA_I	ldsha	[%r20, + 0x00b4] %asi, %r30
cpu_intr_2_330:
	setx	0x420020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a0f4  ! 4241: WRPR_TPC_I	wrpr	%r22, 0x00f4, %tpc
	.word 0xf0c460e6  ! 4246: LDSWA_I	ldswa	[%r17, + 0x00e6] %asi, %r24
T2_asi_reg_rd_201:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 6)
	.word 0xfa0c21b3  ! 4259: LDUB_I	ldub	[%r16 + 0x01b3], %r29
	.word 0xf8440000  ! 4260: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xbb355000  ! 4262: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xf214c000  ! 4263: LDUH_R	lduh	[%r19 + %r0], %r25
cpu_intr_2_331:
	setx	0x41002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_208:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4265: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_202:
	mov	0x6, %r14
	.word 0xf0db8e80  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfa848020  ! 4267: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_203:
	mov	0x28, %r14
	.word 0xfedb84a0  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xba2d616a  ! 4270: ANDN_I	andn 	%r21, 0x016a, %r29
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 14)
	.word 0xf8d5c020  ! 4274: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 21)
	.word 0xf095608e  ! 4278: LDUHA_I	lduha	[%r21, + 0x008e] %asi, %r24
	.word 0xfedc20f8  ! 4280: LDXA_I	ldxa	[%r16, + 0x00f8] %asi, %r31
T2_asi_reg_rd_204:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfa144000  ! 4286: LDUH_R	lduh	[%r17 + %r0], %r29
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 37)
	.word 0xf4cda14c  ! 4290: LDSBA_I	ldsba	[%r22, + 0x014c] %asi, %r26
cpu_intr_2_332:
	setx	0x430212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_209:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 4295: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_333:
	setx	0x43012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_334:
	setx	0x400327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6558000  ! 4301: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xb6b58000  ! 4303: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xfacd21ff  ! 4306: LDSBA_I	ldsba	[%r20, + 0x01ff] %asi, %r29
	.word 0xf284c020  ! 4308: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
T2_asi_reg_wr_210:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 4309: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_211:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 4322: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_335:
	setx	0x42031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d52081  ! 4324: LDSHA_I	ldsha	[%r20, + 0x0081] %asi, %r27
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_336:
	setx	0x400334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_212:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 4334: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_TO_TL1
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_HPRIV
cpu_intr_2_337:
	setx	0x430121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245a090  ! 4350: LDSW_I	ldsw	[%r22 + 0x0090], %r25
	.word 0xfad5e0f0  ! 4351: LDSHA_I	ldsha	[%r23, + 0x00f0] %asi, %r29
	.word 0xf2942012  ! 4352: LDUHA_I	lduha	[%r16, + 0x0012] %asi, %r25
T2_asi_reg_rd_205:
	mov	0x24, %r14
	.word 0xf2db8400  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_338:
	setx	0x40021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x420138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 36)
	.word 0xf8cc2099  ! 4364: LDSBA_I	ldsba	[%r16, + 0x0099] %asi, %r28
	.word 0xb8bce0da  ! 4371: XNORcc_I	xnorcc 	%r19, 0x00da, %r28
cpu_intr_2_340:
	setx	0x40031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_206:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 4376: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb89c0000  ! 4377: XORcc_R	xorcc 	%r16, %r0, %r28
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 28)
	.word 0xf4cd0020  ! 4380: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 12)
	.word 0xf2940020  ! 4385: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
cpu_intr_2_341:
	setx	0x400238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_342:
	setx	0x430307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_343:
	setx	0x400338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed58020  ! 4393: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_207:
	mov	0x2, %r14
	.word 0xf8db84a0  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfa0c0000  ! 4395: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xbab50000  ! 4396: SUBCcc_R	orncc 	%r20, %r0, %r29
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_344:
	setx	0x430026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_345:
	setx	0x430224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_213:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 4406: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf40560c5  ! 4407: LDUW_I	lduw	[%r21 + 0x00c5], %r26
cpu_intr_2_346:
	setx	0x42001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_208:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2558000  ! 4415: LDSH_R	ldsh	[%r22 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0xfccda0d7  ! 4417: LDSBA_I	ldsba	[%r22, + 0x00d7] %asi, %r30
cpu_intr_2_347:
	setx	0x400305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d6193  ! 4426: LDUB_I	ldub	[%r21 + 0x0193], %r28
	.word 0xf08520b4  ! 4428: LDUWA_I	lduwa	[%r20, + 0x00b4] %asi, %r24
T2_asi_reg_rd_209:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfe54208f  ! 4431: LDSH_I	ldsh	[%r16 + 0x008f], %r31
T2_asi_reg_wr_214:
	mov	0x21, %r14
	.word 0xf6f38e60  ! 4433: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_348:
	setx	0x400222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c2097  ! 4439: LDUBA_I	lduba	[%r16, + 0x0097] %asi, %r27
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982942  ! 4442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0942, %hpstate
	.word 0xfc0c204a  ! 4446: LDUB_I	ldub	[%r16 + 0x004a], %r30
cpu_intr_2_349:
	setx	0x41003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0248000  ! 4448: SUB_R	sub 	%r18, %r0, %r24
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_215:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 4450: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_216:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 4451: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_217:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 4453: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb23de180  ! 4454: XNOR_I	xnor 	%r23, 0x0180, %r25
	.word 0xb4ac0000  ! 4456: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xb2954000  ! 4458: ORcc_R	orcc 	%r21, %r0, %r25
cpu_intr_2_350:
	setx	0x420004, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_218:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 4460: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfe54e1fb  ! 4461: LDSH_I	ldsh	[%r19 + 0x01fb], %r31
	.word 0xf044e16b  ! 4463: LDSW_I	ldsw	[%r19 + 0x016b], %r24
	.word 0xfa04e0aa  ! 4465: LDUW_I	lduw	[%r19 + 0x00aa], %r29
cpu_intr_2_351:
	setx	0x410130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa44e1b4  ! 4469: LDSW_I	ldsw	[%r19 + 0x01b4], %r29
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 38)
	.word 0xf08d4020  ! 4473: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
T2_asi_reg_wr_219:
	mov	0x31, %r14
	.word 0xf2f38e80  ! 4474: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, e)
	.word 0xf84d20c0  ! 4482: LDSB_I	ldsb	[%r20 + 0x00c0], %r28
	.word 0xb9643801  ! 4484: MOVcc_I	<illegal instruction>
	.word 0xf445c000  ! 4485: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xf2cc21cc  ! 4490: LDSBA_I	ldsba	[%r16, + 0x01cc] %asi, %r25
cpu_intr_2_352:
	setx	0x410028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c4e00a  ! 4494: LDSWA_I	ldswa	[%r19, + 0x000a] %asi, %r27
T2_asi_reg_wr_220:
	mov	0x2, %r14
	.word 0xfef38e60  ! 4497: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
	.word 0xf0554000  ! 4500: LDSH_R	ldsh	[%r21 + %r0], %r24
cpu_intr_2_353:
	setx	0x410238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 2c)
	.word 0x8594a1fa  ! 4506: WRPR_TSTATE_I	wrpr	%r18, 0x01fa, %tstate
	.word 0xf64c2086  ! 4509: LDSB_I	ldsb	[%r16 + 0x0086], %r27
	.word 0xfa5de037  ! 4510: LDX_I	ldx	[%r23 + 0x0037], %r29
	.word 0xf085a150  ! 4512: LDUWA_I	lduwa	[%r22, + 0x0150] %asi, %r24
	.word 0xf60420d3  ! 4513: LDUW_I	lduw	[%r16 + 0x00d3], %r27
	.word 0xbf50c000  ! 4518: RDPR_TT	<illegal instruction>
	.word 0xf09561f9  ! 4521: LDUHA_I	lduha	[%r21, + 0x01f9] %asi, %r24
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 24)
	.word 0xf6c42151  ! 4527: LDSWA_I	ldswa	[%r16, + 0x0151] %asi, %r27
	.word 0xf054a0d8  ! 4530: LDSH_I	ldsh	[%r18 + 0x00d8], %r24
	.word 0xfc85c020  ! 4532: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_210:
	mov	0x2d, %r14
	.word 0xf0db8e80  ! 4537: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe0d206d  ! 4538: LDUB_I	ldub	[%r20 + 0x006d], %r31
	.word 0xb1520000  ! 4539: RDPR_PIL	<illegal instruction>
	.word 0xf6148000  ! 4540: LDUH_R	lduh	[%r18 + %r0], %r27
T2_asi_reg_rd_211:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 4541: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_212:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfac5e191  ! 4545: LDSWA_I	ldswa	[%r23, + 0x0191] %asi, %r29
cpu_intr_2_354:
	setx	0x43013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_221:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 4549: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb83421ec  ! 4551: ORN_I	orn 	%r16, 0x01ec, %r28
	.word 0xf48cc020  ! 4553: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
T2_asi_reg_wr_222:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 4554: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfa046186  ! 4556: LDUW_I	lduw	[%r17 + 0x0186], %r29
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_355:
	setx	0x45010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf485a0f9  ! 4562: LDUWA_I	lduwa	[%r22, + 0x00f9] %asi, %r26
	.word 0xb0c44000  ! 4563: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xb92d3001  ! 4564: SLLX_I	sllx	%r20, 0x0001, %r28
cpu_intr_2_356:
	setx	0x470117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_357:
	setx	0x470131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d8000  ! 4567: LDX_R	ldx	[%r22 + %r0], %r25
cpu_intr_2_358:
	setx	0x45000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1de03d  ! 4574: XOR_I	xor 	%r23, 0x003d, %r30
	.word 0xbcb5c000  ! 4575: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0xfc444000  ! 4578: LDSW_R	ldsw	[%r17 + %r0], %r30
T2_asi_reg_wr_223:
	mov	0x1a, %r14
	.word 0xfcf38e80  ! 4579: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf6cdc020  ! 4580: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 24)
	.word 0xb235e011  ! 4584: ORN_I	orn 	%r23, 0x0011, %r25
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, f)
	.word 0xf044a1f0  ! 4588: LDSW_I	ldsw	[%r18 + 0x01f0], %r24
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
	.word 0xbcb50000  ! 4597: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xbd340000  ! 4601: SRL_R	srl 	%r16, %r0, %r30
	.word 0xb8854000  ! 4602: ADDcc_R	addcc 	%r21, %r0, %r28
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c50  ! 4606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c50, %hpstate
	.word 0xf844602f  ! 4607: LDSW_I	ldsw	[%r17 + 0x002f], %r28
	.word 0xfc44c000  ! 4608: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf48de0c8  ! 4611: LDUBA_I	lduba	[%r23, + 0x00c8] %asi, %r26
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, b)
	.word 0xf08c61e8  ! 4614: LDUBA_I	lduba	[%r17, + 0x01e8] %asi, %r24
	.word 0xb08560ca  ! 4616: ADDcc_I	addcc 	%r21, 0x00ca, %r24
	.word 0xfa4d4000  ! 4617: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf6450000  ! 4618: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xfe14a1f5  ! 4624: LDUH_I	lduh	[%r18 + 0x01f5], %r31
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 33)
	.word 0xf64d4000  ! 4626: LDSB_R	ldsb	[%r21 + %r0], %r27
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 15)
	.word 0xfa05e014  ! 4628: LDUW_I	lduw	[%r23 + 0x0014], %r29
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_213:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_214:
	mov	0x10, %r14
	.word 0xfadb84a0  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfecde1e2  ! 4639: LDSBA_I	ldsba	[%r23, + 0x01e2] %asi, %r31
T2_asi_reg_wr_224:
	mov	0x28, %r14
	.word 0xfef384a0  ! 4641: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_215:
	mov	0x14, %r14
	.word 0xf2db89e0  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_NONHPRIV
	.word 0xbe9dc000  ! 4646: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xf85d6026  ! 4650: LDX_I	ldx	[%r21 + 0x0026], %r28
cpu_intr_2_359:
	setx	0x46030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a12  ! 4653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a12, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba0da106  ! 4655: AND_I	and 	%r22, 0x0106, %r29
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_360:
	setx	0x46033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd8020  ! 4665: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
	.word 0xf6c40020  ! 4668: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
	.word 0xf65c2070  ! 4670: LDX_I	ldx	[%r16 + 0x0070], %r27
T2_asi_reg_rd_216:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_217:
	mov	0x16, %r14
	.word 0xfedb8e60  ! 4672: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf44d0000  ! 4673: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xfa44a05c  ! 4674: LDSW_I	ldsw	[%r18 + 0x005c], %r29
	.word 0xfcc4a18f  ! 4676: LDSWA_I	ldswa	[%r18, + 0x018f] %asi, %r30
T2_asi_reg_wr_225:
	mov	0x37, %r14
	.word 0xf8f389e0  ! 4678: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_361:
	setx	0x47021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_218:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_219:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 15)
	.word 0xf6c40020  ! 4684: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_220:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc5c61ad  ! 4692: LDX_I	ldx	[%r17 + 0x01ad], %r30
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 36)
	.word 0xbf641800  ! 4705: MOVcc_R	<illegal instruction>
	.word 0xfad4605e  ! 4708: LDSHA_I	ldsha	[%r17, + 0x005e] %asi, %r29
	.word 0xf004c000  ! 4709: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf68ca059  ! 4714: LDUBA_I	lduba	[%r18, + 0x0059] %asi, %r27
	.word 0xf295e1aa  ! 4715: LDUHA_I	lduha	[%r23, + 0x01aa] %asi, %r25
	.word 0xb824612d  ! 4716: SUB_I	sub 	%r17, 0x012d, %r28
	.word 0xf68c613d  ! 4717: LDUBA_I	lduba	[%r17, + 0x013d] %asi, %r27
T2_asi_reg_wr_226:
	mov	0x32, %r14
	.word 0xf8f38e60  ! 4720: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb00ca1a9  ! 4722: AND_I	and 	%r18, 0x01a9, %r24
T2_asi_reg_rd_221:
	mov	0x8, %r14
	.word 0xfadb8e40  ! 4723: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_362:
	setx	0x450134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_227:
	mov	0x11, %r14
	.word 0xf4f38400  ! 4729: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_228:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 4730: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb03ca11c  ! 4732: XNOR_I	xnor 	%r18, 0x011c, %r24
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982982  ! 4735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
T2_asi_reg_rd_222:
	mov	0x16, %r14
	.word 0xf2db89e0  ! 4738: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_229:
	mov	0x23, %r14
	.word 0xfcf384a0  ! 4739: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf8948020  ! 4746: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	.word 0xfa54a083  ! 4748: LDSH_I	ldsh	[%r18 + 0x0083], %r29
cpu_intr_2_363:
	setx	0x450116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_230:
	mov	0x2, %r14
	.word 0xf2f384a0  ! 4753: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf6c420f9  ! 4755: LDSWA_I	ldswa	[%r16, + 0x00f9] %asi, %r27
	.word 0xfe0da1c0  ! 4758: LDUB_I	ldub	[%r22 + 0x01c0], %r31
	.word 0xfc950020  ! 4762: LDUHA_R	lduha	[%r20, %r0] 0x01, %r30
	.word 0xf004e159  ! 4767: LDUW_I	lduw	[%r19 + 0x0159], %r24
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c02  ! 4768: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
	.word 0xf8950020  ! 4771: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
cpu_intr_2_364:
	setx	0x47033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604e0ca  ! 4778: LDUW_I	lduw	[%r19 + 0x00ca], %r27
	.word 0xbe1dc000  ! 4780: XOR_R	xor 	%r23, %r0, %r31
	.word 0xfe44a142  ! 4784: LDSW_I	ldsw	[%r18 + 0x0142], %r31
	.word 0xf804a18a  ! 4785: LDUW_I	lduw	[%r18 + 0x018a], %r28
cpu_intr_2_365:
	setx	0x460212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa14c000  ! 4788: LDUH_R	lduh	[%r19 + %r0], %r29
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_231:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 4790: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfacc4020  ! 4791: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r29
cpu_intr_2_366:
	setx	0x44002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a50000  ! 4793: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0xb42ce1b4  ! 4798: ANDN_I	andn 	%r19, 0x01b4, %r26
cpu_intr_2_367:
	setx	0x460231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 26)
	.word 0xf6c58020  ! 4805: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_2_368:
	setx	0x47020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, e)
	.word 0xfa8ca140  ! 4814: LDUBA_I	lduba	[%r18, + 0x0140] %asi, %r29
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf84521ca  ! 4816: LDSW_I	ldsw	[%r20 + 0x01ca], %r28
T2_asi_reg_wr_232:
	mov	0x1e, %r14
	.word 0xf0f38e60  ! 4818: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfed5e145  ! 4819: LDSHA_I	ldsha	[%r23, + 0x0145] %asi, %r31
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 18)
	.word 0xf4cc20d0  ! 4826: LDSBA_I	ldsba	[%r16, + 0x00d0] %asi, %r26
	.word 0xbf500000  ! 4828: RDPR_TPC	<illegal instruction>
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_369:
	setx	0x460131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2152193  ! 4832: LDUH_I	lduh	[%r20 + 0x0193], %r25
	.word 0xb29dc000  ! 4834: XORcc_R	xorcc 	%r23, %r0, %r25
cpu_intr_2_370:
	setx	0x46022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204611c  ! 4839: LDUW_I	lduw	[%r17 + 0x011c], %r25
	.word 0xfa14e1c0  ! 4842: LDUH_I	lduh	[%r19 + 0x01c0], %r29
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_371:
	setx	0x46021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_223:
	mov	0x18, %r14
	.word 0xf8db8e60  ! 4854: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_372:
	setx	0x440108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d4c020  ! 4856: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_373:
	setx	0x44030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb005c000  ! 4859: ADD_R	add 	%r23, %r0, %r24
	.word 0xf28ca024  ! 4860: LDUBA_I	lduba	[%r18, + 0x0024] %asi, %r25
T2_asi_reg_rd_224:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 29)
	.word 0xf2d4a038  ! 4865: LDSHA_I	ldsha	[%r18, + 0x0038] %asi, %r25
cpu_intr_2_374:
	setx	0x46032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, a)
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, 25)
	.word 0xba24e129  ! 4870: SUB_I	sub 	%r19, 0x0129, %r29
T2_asi_reg_rd_225:
	mov	0x2a, %r14
	.word 0xf0db8e60  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_375:
	setx	0x46030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04521f8  ! 4876: LDSW_I	ldsw	[%r20 + 0x01f8], %r24
	.word 0xf2dd219d  ! 4882: LDXA_I	ldxa	[%r20, + 0x019d] %asi, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf8944020  ! 4885: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf494a0b5  ! 4891: LDUHA_I	lduha	[%r18, + 0x00b5] %asi, %r26
	.word 0xf0c5a08b  ! 4892: LDSWA_I	ldswa	[%r22, + 0x008b] %asi, %r24
iob_intr_2_406:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_406), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_233:
	mov	0x7, %r14
	.word 0xfef38e40  ! 4895: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_407:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_407), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_376:
	setx	0x440009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14c000  ! 4898: LDUH_R	lduh	[%r19 + %r0], %r31
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819838c0  ! 4900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c0, %hpstate
cpu_intr_2_377:
	setx	0x450302, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_234:
	mov	0x24, %r14
	.word 0xfaf384a0  ! 4902: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_235:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 4903: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf0c4a101  ! 4906: LDSWA_I	ldswa	[%r18, + 0x0101] %asi, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf60d0000  ! 4909: LDUB_R	ldub	[%r20 + %r0], %r27
T2_asi_reg_wr_236:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 4911: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_378:
	setx	0x440320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5c020  ! 4915: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
	.word 0xf40d6025  ! 4916: LDUB_I	ldub	[%r21 + 0x0025], %r26
iob_intr_2_408:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_408), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_409:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_409), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_379:
	setx	0x440225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24ca0c3  ! 4923: LDSB_I	ldsb	[%r18 + 0x00c3], %r25
T2_asi_reg_wr_237:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 4925: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfc550000  ! 4926: LDSH_R	ldsh	[%r20 + %r0], %r30
iob_intr_2_410:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_410), 16, 16)) -> intp(2, 0, 5)
	.word 0xf6cd8020  ! 4933: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
T2_asi_reg_wr_238:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 4934: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf88cc020  ! 4935: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
	.word 0xfc95e0f2  ! 4936: LDUHA_I	lduha	[%r23, + 0x00f2] %asi, %r30
	.word 0xf0554000  ! 4937: LDSH_R	ldsh	[%r21 + %r0], %r24
T2_asi_reg_rd_226:
	mov	0x1e, %r14
	.word 0xf6db84a0  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfc848020  ! 4940: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
	.word 0xb3510000  ! 4944: RDPR_TICK	<illegal instruction>
	.word 0xb81d8000  ! 4945: XOR_R	xor 	%r22, %r0, %r28
cpu_intr_2_380:
	setx	0x44011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_227:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 4948: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_411:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_411), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_381:
	setx	0x45011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_412:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_412), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfa55e172  ! 4957: LDSH_I	ldsh	[%r23 + 0x0172], %r29
iob_intr_2_413:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_413), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf64d2145  ! 4965: LDSB_I	ldsb	[%r20 + 0x0145], %r27
	.word 0xfc54a1ff  ! 4967: LDSH_I	ldsh	[%r18 + 0x01ff], %r30
T2_asi_reg_wr_239:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 4968: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_382:
	setx	0x460331, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e42  ! 4972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
cpu_intr_2_383:
	setx	0x440237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdca01e  ! 4977: LDXA_I	ldxa	[%r18, + 0x001e] %asi, %r30
cpu_intr_2_384:
	setx	0x450203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d0400  ! 4979: MOVR_R	movre	%r20, %r0, %r28
	.word 0xb61cc000  ! 4980: XOR_R	xor 	%r19, %r0, %r27
cpu_intr_2_385:
	setx	0x45020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_414:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_414), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf80d0000  ! 4988: LDUB_R	ldub	[%r20 + %r0], %r28
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983908  ! 4990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1908, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_240:
	mov	0x27, %r14
	.word 0xfef38400  ! 4993: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_386:
	setx	0x46031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 26)
	.word 0xb3aa8820  ! 6: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_0:
	setx	0x190018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35f001  ! 9: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xb5a489a0  ! 11: FDIVs	fdivs	%f18, %f0, %f26
T1_asi_reg_wr_0:
	mov	0x1f, %r14
	.word 0xfef38e60  ! 13: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_0:
	mov	0xf, %r14
	.word 0xf4db8400  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_1:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 18: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfa48860  ! 19: FADDq	dis not found

iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a90820  ! 23: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_2:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 27: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_1:
	setx	0x1c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50840  ! 29: FADDd	faddd	%f20, %f0, %f56
	.word 0xb9a54960  ! 33: FMULq	dis not found

	.word 0xbba80820  ! 34: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_3:
	mov	0xf, %r14
	.word 0xfcf389e0  ! 36: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbda81420  ! 37: FMOVRNZ	dis not found

cpu_intr_1_2:
	setx	0x1f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_4:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 47: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7aa8820  ! 52: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbe0d20ce  ! 54: AND_I	and 	%r20, 0x00ce, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_3:
	setx	0x1e021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 57: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa9c820  ! 60: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbba5c9c0  ! 62: FDIVd	fdivd	%f54, %f0, %f60
cpu_intr_1_4:
	setx	0x1f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba489a0  ! 67: FDIVs	fdivs	%f18, %f0, %f29
cpu_intr_1_5:
	setx	0x1d0124, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_5:
	mov	0x12, %r14
	.word 0xf8f38e60  ! 69: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a549e0  ! 73: FDIVq	dis not found

	.word 0xb5a489c0  ! 79: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xb29d0000  ! 82: XORcc_R	xorcc 	%r20, %r0, %r25
	.word 0xbfa00020  ! 84: FMOVs	fmovs	%f0, %f31
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_2:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 91: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_3:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 97: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_4:
	mov	0xd, %r14
	.word 0xf6db8e40  ! 100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_6:
	setx	0x1c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 103: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb6ac609f  ! 105: ANDNcc_I	andncc 	%r17, 0x009f, %r27
T1_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 106: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_7:
	setx	0x1f0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a58820  ! 112: FADDs	fadds	%f22, %f0, %f24
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1a81420  ! 114: FMOVRNZ	dis not found

	.word 0xb5a00540  ! 118: FSQRTd	fsqrt	
T1_asi_reg_wr_7:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 119: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbf7d4400  ! 120: MOVR_R	movre	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_5:
	mov	0x7, %r14
	.word 0xf0db8e80  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbba81820  ! 126: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb1343001  ! 128: SRLX_I	srlx	%r16, 0x0001, %r24
cpu_intr_1_8:
	setx	0x1e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449c0  ! 133: FDIVd	fdivd	%f48, %f0, %f56
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_8:
	mov	0x37, %r14
	.word 0xfcf38400  ! 137: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3a44940  ! 140: FMULd	fmuld	%f48, %f0, %f56
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_6:
	mov	0x26, %r14
	.word 0xfadb8e40  ! 143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb63421a6  ! 147: SUBC_I	orn 	%r16, 0x01a6, %r27
cpu_intr_1_9:
	setx	0x1c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba95c000  ! 158: ORcc_R	orcc 	%r23, %r0, %r29
	.word 0xbfab8820  ! 161: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a4c8a0  ! 163: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xbfa58820  ! 165: FADDs	fadds	%f22, %f0, %f31
cpu_intr_1_10:
	setx	0x1c0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda589c0  ! 167: FDIVd	fdivd	%f22, %f0, %f30
cpu_intr_1_11:
	setx	0x1c013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50860  ! 169: FADDq	dis not found

cpu_intr_1_12:
	setx	0x1e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_13:
	setx	0x1c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_9:
	mov	0x29, %r14
	.word 0xf0f38400  ! 181: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5a48840  ! 185: FADDd	faddd	%f18, %f0, %f26
cpu_intr_1_14:
	setx	0x1e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 196: FMOVRLZ	dis not found

	.word 0xbba00540  ! 200: FSQRTd	fsqrt	
T1_asi_reg_rd_7:
	mov	0x2, %r14
	.word 0xfadb8e60  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_15:
	setx	0x1d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 203: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba54840  ! 205: FADDd	faddd	%f52, %f0, %f60
cpu_intr_1_16:
	setx	0x1d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9520d9  ! 208: ORcc_I	orcc 	%r20, 0x00d9, %r30
T1_asi_reg_wr_10:
	mov	0x32, %r14
	.word 0xf4f38e80  ! 209: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba9c820  ! 212: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_17:
	setx	0x1c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 215: FMOVCS	fmovs	%fcc1, %f0, %f31
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_18:
	setx	0x1c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 223: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_19:
	setx	0x1e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_11:
	mov	0x7, %r14
	.word 0xfcf38e80  ! 225: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_12:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 227: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_20:
	setx	0x1c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48960  ! 231: FMULq	dis not found

cpu_intr_1_21:
	setx	0x1e0227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_22:
	setx	0x1c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 236: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb0354000  ! 237: ORN_R	orn 	%r21, %r0, %r24
cpu_intr_1_23:
	setx	0x1e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c58000  ! 245: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xb5a00540  ! 246: FSQRTd	fsqrt	
cpu_intr_1_24:
	setx	0x1e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_13:
	mov	0x34, %r14
	.word 0xf2f38400  ! 250: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb1a84820  ! 251: FMOVE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_25:
	setx	0x1f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_14:
	mov	0x18, %r14
	.word 0xf4f384a0  ! 259: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_rd_8:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 260: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, d)
	.word 0xbf3ce001  ! 262: SRA_I	sra 	%r19, 0x0001, %r31
	.word 0xb7ab8820  ! 264: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_15:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 266: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a58920  ! 267: FMULs	fmuls	%f22, %f0, %f24
	.word 0xbda00520  ! 269: FSQRTs	fsqrt	
	.word 0xb1a5c9c0  ! 272: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb9a00040  ! 273: FMOVd	fmovd	%f0, %f28
T1_asi_reg_rd_9:
	mov	0x37, %r14
	.word 0xfcdb8400  ! 274: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_10:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 278: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a5c940  ! 279: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb7a50960  ! 281: FMULq	dis not found

iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_16:
	mov	0x37, %r14
	.word 0xfef38e80  ! 283: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_26:
	setx	0x1f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_27:
	setx	0x1c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 37)
	.word 0xbc956014  ! 291: ORcc_I	orcc 	%r21, 0x0014, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5aa4820  ! 295: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_28:
	setx	0x1f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58920  ! 298: FMULs	fmuls	%f22, %f0, %f28
T1_asi_reg_wr_17:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 299: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbdaa0820  ! 300: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb9aac820  ! 302: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_29:
	setx	0x1d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2144000  ! 307: OR_R	or 	%r17, %r0, %r25
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1a4c8e0  ! 311: FSUBq	dis not found

	.word 0xbfa00560  ! 312: FSQRTq	fsqrt	
T1_asi_reg_rd_11:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 313: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb0ac4000  ! 314: ANDNcc_R	andncc 	%r17, %r0, %r24
	.word 0xb8ac0000  ! 315: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xb334e001  ! 316: SRL_I	srl 	%r19, 0x0001, %r25
cpu_intr_1_30:
	setx	0x1c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48960  ! 322: FMULq	dis not found

	.word 0xb2858000  ! 323: ADDcc_R	addcc 	%r22, %r0, %r25
	.word 0xbdabc820  ! 327: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_31:
	setx	0x1d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 332: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_32:
	setx	0x1e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 340: FMOVRZ	dis not found

	.word 0xbba5c9c0  ! 345: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xbda409c0  ! 346: FDIVd	fdivd	%f16, %f0, %f30
T1_asi_reg_rd_12:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbaac820  ! 351: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_33:
	setx	0x1e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_34:
	setx	0x1c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 357: FMOVRNZ	dis not found

	.word 0xb1a84820  ! 359: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_13:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 363: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbdaa4820  ! 367: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a4c9e0  ! 368: FDIVq	dis not found

cpu_intr_1_35:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x1f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_14:
	mov	0x1d, %r14
	.word 0xf4db8e60  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbfa00560  ! 376: FSQRTq	fsqrt	
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 34)
	.word 0xb52cf001  ! 381: SLLX_I	sllx	%r19, 0x0001, %r26
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a4c8e0  ! 384: FSUBq	dis not found

	.word 0xb4040000  ! 386: ADD_R	add 	%r16, %r0, %r26
cpu_intr_1_37:
	setx	0x1c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a409e0  ! 393: FDIVq	dis not found

iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 21)
	.word 0xbba80c20  ! 396: FMOVRLZ	dis not found

	.word 0xb53c7001  ! 397: SRAX_I	srax	%r17, 0x0001, %r26
cpu_intr_1_39:
	setx	0x1e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1a00560  ! 407: FSQRTq	fsqrt	
	.word 0xbc2d8000  ! 408: ANDN_R	andn 	%r22, %r0, %r30
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a80c20  ! 411: FMOVRLZ	dis not found

	.word 0xb7a508e0  ! 412: FSUBq	dis not found

	.word 0xb7a00540  ! 415: FSQRTd	fsqrt	
cpu_intr_1_40:
	setx	0x1c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 421: FMOVRGEZ	dis not found

T1_asi_reg_wr_18:
	mov	0x0, %r14
	.word 0xfef38e40  ! 422: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa81c20  ! 423: FMOVRGEZ	dis not found

	.word 0xb3a80420  ! 427: FMOVRZ	dis not found

T1_asi_reg_wr_19:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 428: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_15:
	mov	0x4, %r14
	.word 0xf8db84a0  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb6c4a089  ! 431: ADDCcc_I	addccc 	%r18, 0x0089, %r27
	.word 0xbd518000  ! 433: RDPR_PSTATE	<illegal instruction>
	.word 0xb5aac820  ! 434: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_41:
	setx	0x1d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa8820  ! 440: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_16:
	mov	0x1c, %r14
	.word 0xfadb89e0  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_20:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 444: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5a00560  ! 450: FSQRTq	fsqrt	
cpu_intr_1_42:
	setx	0x1d0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba15a139  ! 458: OR_I	or 	%r22, 0x0139, %r29
cpu_intr_1_43:
	setx	0x1d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6344000  ! 461: ORN_R	orn 	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_44:
	setx	0x1f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3a00020  ! 467: FMOVs	fmovs	%f0, %f25
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbf508000  ! 472: RDPR_TSTATE	<illegal instruction>
	.word 0xbba508a0  ! 478: FSUBs	fsubs	%f20, %f0, %f29
T1_asi_reg_wr_21:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 482: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_22:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 484: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1a94820  ! 493: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_45:
	setx	0x200111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409a0  ! 501: FDIVs	fdivs	%f16, %f0, %f24
cpu_intr_1_46:
	setx	0x200037, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_17:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbdab4820  ! 507: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a5c820  ! 509: FADDs	fadds	%f23, %f0, %f28
cpu_intr_1_47:
	setx	0x21022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588a0  ! 515: FSUBs	fsubs	%f22, %f0, %f30
	.word 0xb9a00020  ! 516: FMOVs	fmovs	%f0, %f28
T1_asi_reg_rd_18:
	mov	0x32, %r14
	.word 0xfadb8e60  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_48:
	setx	0x200236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 37)
	.word 0xb9a8c820  ! 526: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7a80c20  ! 531: FMOVRLZ	dis not found

cpu_intr_1_49:
	setx	0x210020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_50:
	setx	0x230134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 537: FSQRTs	fsqrt	
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, e)
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a81c20  ! 546: FMOVRGEZ	dis not found

	.word 0xb3a80420  ! 547: FMOVRZ	dis not found

	.word 0xb3aa0820  ! 548: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbba509c0  ! 549: FDIVd	fdivd	%f20, %f0, %f60
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_23:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 552: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_24:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 553: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a48840  ! 557: FADDd	faddd	%f18, %f0, %f56
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_19:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a88820  ! 571: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 11)
	.word 0xb68d4000  ! 573: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xbc358000  ! 574: ORN_R	orn 	%r22, %r0, %r30
T1_asi_reg_rd_20:
	mov	0x37, %r14
	.word 0xf2db89e0  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb5a54940  ! 582: FMULd	fmuld	%f52, %f0, %f26
T1_asi_reg_wr_25:
	mov	0xa, %r14
	.word 0xfcf38400  ! 584: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5a80820  ! 586: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_21:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 590: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_26:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 591: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_27:
	mov	0x28, %r14
	.word 0xfef38e40  ! 593: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a489e0  ! 594: FDIVq	dis not found

	.word 0xbda409c0  ! 595: FDIVd	fdivd	%f16, %f0, %f30
T1_asi_reg_wr_28:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 596: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_51:
	setx	0x200123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_52:
	setx	0x22031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 608: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1a00560  ! 611: FSQRTq	fsqrt	
	.word 0xba2da06b  ! 613: ANDN_I	andn 	%r22, 0x006b, %r29
cpu_intr_1_53:
	setx	0x210237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 625: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a588e0  ! 627: FSUBq	dis not found

	.word 0xb3a409c0  ! 630: FDIVd	fdivd	%f16, %f0, %f56
T1_asi_reg_rd_22:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 631: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a409a0  ! 639: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb1a5c860  ! 642: FADDq	dis not found

	.word 0xb5a90820  ! 644: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_29:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 645: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbc3cc000  ! 646: XNOR_R	xnor 	%r19, %r0, %r30
T1_asi_reg_rd_23:
	mov	0x11, %r14
	.word 0xf2db8e60  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_24:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_wr_30:
	mov	0x33, %r14
	.word 0xf4f384a0  ! 659: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_rd_25:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_54:
	setx	0x220011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_26:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_55:
	setx	0x23033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_56:
	setx	0x20001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_57:
	setx	0x22023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_27:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb3a00520  ! 676: FSQRTs	fsqrt	
	.word 0xb3a80420  ! 677: FMOVRZ	dis not found

	.word 0xbcc421c3  ! 679: ADDCcc_I	addccc 	%r16, 0x01c3, %r30
T1_asi_reg_wr_31:
	mov	0x10, %r14
	.word 0xf4f38400  ! 680: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7520000  ! 681: RDPR_PIL	<illegal instruction>
	.word 0xbdab8820  ! 682: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_32:
	mov	0x27, %r14
	.word 0xfef38e60  ! 683: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_33:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 685: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_58:
	setx	0x200020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, c)
	.word 0xb5a88820  ! 699: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 701: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
cpu_intr_1_59:
	setx	0x21011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e165  ! 704: WRPR_PIL_I	wrpr	%r23, 0x0165, %pil
T1_asi_reg_wr_34:
	mov	0x1c, %r14
	.word 0xf4f38400  ! 705: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbba81820  ! 706: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb7a00540  ! 707: FSQRTd	fsqrt	
cpu_intr_1_60:
	setx	0x200312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x21031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda449a0  ! 713: FDIVs	fdivs	%f17, %f0, %f30
T1_asi_reg_wr_35:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 715: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_62:
	setx	0x230100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 718: FMOVRZ	dis not found

iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_28:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a00520  ! 721: FSQRTs	fsqrt	
	.word 0xbbabc820  ! 722: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a4c9c0  ! 723: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xbfaa8820  ! 724: FMOVG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_29:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 726: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9a88820  ! 727: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba488e0  ! 734: FSUBq	dis not found

cpu_intr_1_63:
	setx	0x21003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52cc000  ! 740: SLL_R	sll 	%r19, %r0, %r26
	.word 0xb7508000  ! 741: RDPR_TSTATE	<illegal instruction>
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a00520  ! 746: FSQRTs	fsqrt	
cpu_intr_1_64:
	setx	0x21011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879420b4  ! 753: WRPR_TT_I	wrpr	%r16, 0x00b4, %tt
	.word 0xbba4c9a0  ! 755: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xb2150000  ! 756: OR_R	or 	%r20, %r0, %r25
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1aa8820  ! 760: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb4b58000  ! 761: SUBCcc_R	orncc 	%r22, %r0, %r26
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbda84820  ! 772: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a80820  ! 774: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_30:
	mov	0x17, %r14
	.word 0xfadb8e40  ! 783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfa40920  ! 784: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb60521a3  ! 785: ADD_I	add 	%r20, 0x01a3, %r27
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_65:
	setx	0x20021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_36:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 790: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1a94820  ! 791: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbdaac820  ! 792: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 2e)
	.word 0x9195a1e7  ! 794: WRPR_PIL_I	wrpr	%r22, 0x01e7, %pil
cpu_intr_1_66:
	setx	0x210114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_67:
	setx	0x230221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 805: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb244e01d  ! 808: ADDC_I	addc 	%r19, 0x001d, %r25
T1_asi_reg_rd_31:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 812: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_32:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_68:
	setx	0x200008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 819: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 9)
	.word 0xbdaa8820  ! 823: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a4c8e0  ! 825: FSUBq	dis not found

	.word 0xbfa48940  ! 826: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb9a54960  ! 828: FMULq	dis not found

iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_69:
	setx	0x200319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 32)
	.word 0xb1a94820  ! 839: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_70:
	setx	0x200021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44860  ! 851: FADDq	dis not found

cpu_intr_1_71:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 853: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80420  ! 855: FMOVRZ	dis not found

T1_asi_reg_wr_38:
	mov	0xe, %r14
	.word 0xf6f38e80  ! 857: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_72:
	setx	0x200004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c461a7  ! 859: ADDCcc_I	addccc 	%r17, 0x01a7, %r25
	.word 0xb9a44820  ! 863: FADDs	fadds	%f17, %f0, %f28
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a449a0  ! 868: FDIVs	fdivs	%f17, %f0, %f27
T1_asi_reg_rd_33:
	mov	0x15, %r14
	.word 0xf6db8e60  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfa00520  ! 874: FSQRTs	fsqrt	
cpu_intr_1_73:
	setx	0x23032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_39:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 878: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbb7d6401  ! 881: MOVR_I	movre	%r21, 0x1, %r29
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1aa8820  ! 884: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_34:
	mov	0x1b, %r14
	.word 0xf0db8e80  ! 886: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbfa00560  ! 888: FSQRTq	fsqrt	
T1_asi_reg_rd_35:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a81420  ! 891: FMOVRNZ	dis not found

cpu_intr_1_74:
	setx	0x21001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 895: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_40:
	mov	0x7, %r14
	.word 0xf4f38e40  ! 897: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfa549c0  ! 898: FDIVd	fdivd	%f52, %f0, %f62
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a44940  ! 900: FMULd	fmuld	%f48, %f0, %f56
T1_asi_reg_wr_41:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 901: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1a40840  ! 904: FADDd	faddd	%f16, %f0, %f24
	.word 0xb1a81820  ! 906: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb7a80420  ! 908: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_75:
	setx	0x21002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 913: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a5c840  ! 916: FADDd	faddd	%f54, %f0, %f26
	.word 0xbda94820  ! 918: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 8)
	.word 0xb9ab8820  ! 920: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_36:
	mov	0x31, %r14
	.word 0xfedb8400  ! 921: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbda508e0  ! 922: FSUBq	dis not found

	.word 0xb12d3001  ! 924: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xb4ac0000  ! 926: ANDNcc_R	andncc 	%r16, %r0, %r26
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 0)
	.word 0xbda58860  ! 930: FADDq	dis not found

T1_asi_reg_wr_42:
	mov	0xa, %r14
	.word 0xf4f389e0  ! 931: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a9c820  ! 937: FMOVVS	fmovs	%fcc1, %f0, %f25
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_76:
	setx	0x270036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44860  ! 953: FADDq	dis not found

	.word 0xb7ab0820  ! 954: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a81820  ! 958: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, e)
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_77:
	setx	0x250306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_78:
	setx	0x25013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29d0000  ! 965: XORcc_R	xorcc 	%r20, %r0, %r25
cpu_intr_1_79:
	setx	0x260301, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_37:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 967: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbba94820  ! 968: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_80:
	setx	0x240006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_38:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 973: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfa00560  ! 974: FSQRTq	fsqrt	
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a5c840  ! 976: FADDd	faddd	%f54, %f0, %f28
cpu_intr_1_81:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_43:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 981: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_44:
	mov	0x3, %r14
	.word 0xfcf384a0  ! 982: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_45:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 984: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_39:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_82:
	setx	0x240306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 994: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a81820  ! 995: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb9a98820  ! 996: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a81820  ! 998: FMOVRGZ	fmovs	%fcc3, %f0, %f26
T1_asi_reg_rd_40:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb73c4000  ! 1002: SRA_R	sra 	%r17, %r0, %r27
	.word 0xbfa00560  ! 1004: FSQRTq	fsqrt	
T1_asi_reg_rd_41:
	mov	0x17, %r14
	.word 0xf0db8e80  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_83:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_84:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_42:
	mov	0x23, %r14
	.word 0xf6db8400  ! 1014: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbba54860  ! 1015: FADDq	dis not found

	.word 0xb7a508a0  ! 1016: FSUBs	fsubs	%f20, %f0, %f27
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 1021: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7ab4820  ! 1030: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_85:
	setx	0x260226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1035: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_47:
	mov	0x20, %r14
	.word 0xfcf389e0  ! 1036: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbdaa4820  ! 1037: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb53cd000  ! 1039: SRAX_R	srax	%r19, %r0, %r26
	.word 0xb7ab8820  ! 1041: FMOVPOS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_86:
	setx	0x240324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x250011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 1045: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_88:
	setx	0x260118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 1050: FMOVRZ	dis not found

	.word 0xb735f001  ! 1051: SRLX_I	srlx	%r23, 0x0001, %r27
	.word 0xb1aac820  ! 1053: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a94820  ! 1056: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80820  ! 1057: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbbabc820  ! 1062: FMOVVC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_89:
	setx	0x260306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 1067: FMOVd	fmovd	%f0, %f30
T1_asi_reg_wr_48:
	mov	0x1, %r14
	.word 0xf4f389e0  ! 1068: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1a58960  ! 1071: FMULq	dis not found

	.word 0xbfa81c20  ! 1072: FMOVRGEZ	dis not found

cpu_intr_1_90:
	setx	0x27023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 1075: FMOVRLZ	dis not found

T1_asi_reg_wr_49:
	mov	0xd, %r14
	.word 0xfef389e0  ! 1076: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbfaa0820  ! 1077: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00540  ! 1080: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3ab8820  ! 1085: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_91:
	setx	0x270121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb405c000  ! 1087: ADD_R	add 	%r23, %r0, %r26
	.word 0xb7352001  ! 1088: SRL_I	srl 	%r20, 0x0001, %r27
T1_asi_reg_wr_50:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 1089: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 16)
	.word 0xb7a98820  ! 1094: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_51:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 1096: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_92:
	setx	0x24000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_52:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 1099: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_93:
	setx	0x270107, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x5, %r14
	.word 0xfef389e0  ! 1101: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_43:
	mov	0x18, %r14
	.word 0xf4db84a0  ! 1102: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a88820  ! 1103: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_94:
	setx	0x270215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_95:
	setx	0x270204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 1108: FMOVRLZ	dis not found

	.word 0xb5a509c0  ! 1109: FDIVd	fdivd	%f20, %f0, %f26
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_44:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 1113: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1a58860  ! 1115: FADDq	dis not found

	.word 0xb1aa8820  ! 1116: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0x8594e151  ! 1119: WRPR_TSTATE_I	wrpr	%r19, 0x0151, %tstate
T1_asi_reg_rd_45:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 1123: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a4c940  ! 1125: FMULd	fmuld	%f50, %f0, %f58
	.word 0xbda00040  ! 1128: FMOVd	fmovd	%f0, %f30
	.word 0xb5a508e0  ! 1129: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_96:
	setx	0x260131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a98820  ! 1139: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_54:
	mov	0x10, %r14
	.word 0xf8f38e40  ! 1140: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7a00560  ! 1141: FSQRTq	fsqrt	
T1_asi_reg_wr_55:
	mov	0xc, %r14
	.word 0xf4f384a0  ! 1146: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 8)
	.word 0xbc954000  ! 1150: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xb5a4c8e0  ! 1151: FSUBq	dis not found

cpu_intr_1_97:
	setx	0x26033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_46:
	mov	0x16, %r14
	.word 0xf8db84a0  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_98:
	setx	0x250007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50840  ! 1157: FADDd	faddd	%f20, %f0, %f62
	.word 0xb5ab4820  ! 1158: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb2056189  ! 1159: ADD_I	add 	%r21, 0x0189, %r25
	.word 0xb5a40920  ! 1160: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb9aac820  ! 1162: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_56:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 1163: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbfa4c940  ! 1164: FMULd	fmuld	%f50, %f0, %f62
cpu_intr_1_99:
	setx	0x25010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_57:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 1169: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1a00560  ! 1170: FSQRTq	fsqrt	
	.word 0xbba80c20  ! 1171: FMOVRLZ	dis not found

T1_asi_reg_wr_58:
	mov	0xf, %r14
	.word 0xf8f38e80  ! 1173: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_59:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 1178: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_100:
	setx	0x260202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 1184: FMOVRGEZ	dis not found

T1_asi_reg_rd_47:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 1187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 36)
	.word 0xb52d8000  ! 1189: SLL_R	sll 	%r22, %r0, %r26
cpu_intr_1_101:
	setx	0x250323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 1192: FSQRTs	fsqrt	
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_60:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 1196: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_48:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 1197: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbda44840  ! 1206: FADDd	faddd	%f48, %f0, %f30
T1_asi_reg_rd_49:
	mov	0x20, %r14
	.word 0xfadb84a0  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_102:
	setx	0x1001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00ca057  ! 1209: AND_I	and 	%r18, 0x0057, %r24
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a00540  ! 1212: FSQRTd	fsqrt	
	.word 0xb9a00540  ! 1214: FSQRTd	fsqrt	
	.word 0xb3ab8820  ! 1219: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, f)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbfa5c960  ! 1232: FMULq	dis not found

	.word 0xb3a588c0  ! 1233: FSUBd	fsubd	%f22, %f0, %f56
T1_asi_reg_rd_50:
	mov	0x30, %r14
	.word 0xf0db8400  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1a488a0  ! 1236: FSUBs	fsubs	%f18, %f0, %f24
cpu_intr_1_103:
	setx	0x260038, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 1238: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, a)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbda488e0  ! 1243: FSUBq	dis not found

	.word 0xb7a94820  ! 1245: FMOVCS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_62:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 1247: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbba448c0  ! 1248: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbba00020  ! 1250: FMOVs	fmovs	%f0, %f29
cpu_intr_1_104:
	setx	0x240019, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_51:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 1252: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda4c8e0  ! 1253: FSUBq	dis not found

iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, c)
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3540000  ! 1257: RDPR_GL	<illegal instruction>
T1_asi_reg_rd_52:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a48840  ! 1259: FADDd	faddd	%f18, %f0, %f24
cpu_intr_1_105:
	setx	0x24033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 1261: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 10)
	.word 0xbfa00520  ! 1263: FSQRTs	fsqrt	
	.word 0xb17c6401  ! 1271: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xbfa98820  ! 1272: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 1c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_53:
	mov	0x36, %r14
	.word 0xf4db8400  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5a00520  ! 1280: FSQRTs	fsqrt	
T1_asi_reg_rd_54:
	mov	0x9, %r14
	.word 0xfedb84a0  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 9)
	.word 0xb5a80420  ! 1287: FMOVRZ	dis not found

	.word 0xb5a90820  ! 1288: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_55:
	mov	0x22, %r14
	.word 0xf4db8e80  ! 1289: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_106:
	setx	0x27021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995612c  ! 1292: WRPR_TICK_I	wrpr	%r21, 0x012c, %tick
T1_asi_reg_wr_63:
	mov	0x1f, %r14
	.word 0xfaf38e80  ! 1293: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, f)
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a90820  ! 1299: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_56:
	mov	0x1b, %r14
	.word 0xfedb8e80  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3abc820  ! 1302: FMOVVC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_64:
	mov	0x31, %r14
	.word 0xfef38e40  ! 1304: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_107:
	setx	0x26001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 1311: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a90820  ! 1312: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_108:
	setx	0x250000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 1314: FSQRTd	fsqrt	
	.word 0xbda8c820  ! 1315: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbcc5e123  ! 1318: ADDCcc_I	addccc 	%r23, 0x0123, %r30
T1_asi_reg_rd_57:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 1319: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb80dc000  ! 1320: AND_R	and 	%r23, %r0, %r28
	.word 0xb1aac820  ! 1324: FMOVGE	fmovs	%fcc1, %f0, %f24
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda81820  ! 1329: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb7a5c920  ! 1330: FMULs	fmuls	%f23, %f0, %f27
	.word 0xb9a84820  ! 1331: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a94820  ! 1332: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_109:
	setx	0x24000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 33)
	.word 0xb1a00520  ! 1344: FSQRTs	fsqrt	
T1_asi_reg_wr_65:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1347: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a8c820  ! 1349: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_110:
	setx	0x270209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 1355: FSQRTq	fsqrt	
	.word 0xb3a90820  ! 1356: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb805c000  ! 1357: ADD_R	add 	%r23, %r0, %r28
	.word 0xb9a4c9c0  ! 1358: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xbba00520  ! 1363: FSQRTs	fsqrt	
T1_asi_reg_rd_58:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 1365: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a9c820  ! 1366: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a549a0  ! 1368: FDIVs	fdivs	%f21, %f0, %f27
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a408e0  ! 1371: FSUBq	dis not found

	.word 0xbba00520  ! 1373: FSQRTs	fsqrt	
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_111:
	setx	0x260301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_112:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a488e0  ! 1383: FSUBq	dis not found

T1_asi_reg_wr_66:
	mov	0x0, %r14
	.word 0xf0f389e0  ! 1387: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_67:
	mov	0xe, %r14
	.word 0xf8f389e0  ! 1388: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb3a4c940  ! 1389: FMULd	fmuld	%f50, %f0, %f56
cpu_intr_1_113:
	setx	0x290030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_114:
	setx	0x2b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2250000  ! 1400: SUB_R	sub 	%r20, %r0, %r25
	.word 0xbba449c0  ! 1409: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xb1aac820  ! 1410: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbfaac820  ! 1411: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_68:
	mov	0x12, %r14
	.word 0xfef38e40  ! 1417: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfab0820  ! 1418: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a50840  ! 1419: FADDd	faddd	%f20, %f0, %f58
	.word 0xb9a00040  ! 1420: FMOVd	fmovd	%f0, %f28
cpu_intr_1_115:
	setx	0x2b020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_116:
	setx	0x290314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_59:
	mov	0x13, %r14
	.word 0xfcdb8e60  ! 1429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_69:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 1434: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbe2dc000  ! 1435: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xb73c0000  ! 1437: SRA_R	sra 	%r16, %r0, %r27
	.word 0xb3a448a0  ! 1441: FSUBs	fsubs	%f17, %f0, %f25
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 27)
	.word 0xbba81820  ! 1446: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb6358000  ! 1448: ORN_R	orn 	%r22, %r0, %r27
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a489c0  ! 1451: FDIVd	fdivd	%f18, %f0, %f28
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_117:
	setx	0x29033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6248000  ! 1458: SUB_R	sub 	%r18, %r0, %r27
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_61:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 1468: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 3)
	.word 0xb88c21db  ! 1472: ANDcc_I	andcc 	%r16, 0x01db, %r28
	.word 0xb5a44860  ! 1478: FADDq	dis not found

cpu_intr_1_118:
	setx	0x2b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 1482: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a54860  ! 1483: FADDq	dis not found

T1_asi_reg_wr_70:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 1484: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7aac820  ! 1487: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_119:
	setx	0x28022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 4)
	.word 0xbba488e0  ! 1491: FSUBq	dis not found

iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_120:
	setx	0x28032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 1495: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb9a5c860  ! 1496: FADDq	dis not found

	.word 0xb9a81420  ! 1499: FMOVRNZ	dis not found

	.word 0xb1518000  ! 1500: RDPR_PSTATE	<illegal instruction>
	.word 0xbab5a00f  ! 1501: SUBCcc_I	orncc 	%r22, 0x000f, %r29
	.word 0xb0054000  ! 1506: ADD_R	add 	%r21, %r0, %r24
T1_asi_reg_rd_62:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 1508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb12d6001  ! 1509: SLL_I	sll 	%r21, 0x0001, %r24
	.word 0xbda90820  ! 1510: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00520  ! 1512: FSQRTs	fsqrt	
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_121:
	setx	0x2b0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_71:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 1524: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfaa4820  ! 1525: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_122:
	setx	0x2a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb5a409e0  ! 1533: FDIVq	dis not found

iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3a5c8e0  ! 1538: FSUBq	dis not found

T1_asi_reg_wr_72:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 1539: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_123:
	setx	0x29021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_63:
	mov	0x16, %r14
	.word 0xf6db8e60  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfa48860  ! 1551: FADDq	dis not found

	.word 0xb7a00540  ! 1552: FSQRTd	fsqrt	
	.word 0xb5a58840  ! 1555: FADDd	faddd	%f22, %f0, %f26
T1_asi_reg_wr_73:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 1557: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_124:
	setx	0x2b0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_125:
	setx	0x28022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_126:
	setx	0x2b0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54920  ! 1575: FMULs	fmuls	%f21, %f0, %f24
	.word 0xbabd8000  ! 1578: XNORcc_R	xnorcc 	%r22, %r0, %r29
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba589a0  ! 1583: FDIVs	fdivs	%f22, %f0, %f29
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3ab0820  ! 1591: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb1a84820  ! 1592: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a4c9a0  ! 1593: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb3a588e0  ! 1597: FSUBq	dis not found

	.word 0xb9a00520  ! 1600: FSQRTs	fsqrt	
T1_asi_reg_wr_74:
	mov	0xa, %r14
	.word 0xfcf38400  ! 1601: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_64:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb62d61e0  ! 1603: ANDN_I	andn 	%r21, 0x01e0, %r27
	.word 0xb9a4c820  ! 1604: FADDs	fadds	%f19, %f0, %f28
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 0)
	.word 0xbfa00540  ! 1609: FSQRTd	fsqrt	
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa58860  ! 1616: FADDq	dis not found

T1_asi_reg_wr_75:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 1617: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1aac820  ! 1627: FMOVGE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_65:
	mov	0x9, %r14
	.word 0xf6db8e60  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_127:
	setx	0x280114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58940  ! 1646: FMULd	fmuld	%f22, %f0, %f56
	.word 0xbf7c0400  ! 1649: MOVR_R	movre	%r16, %r0, %r31
cpu_intr_1_128:
	setx	0x2a0339, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_76:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 1653: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_77:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 1655: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_129:
	setx	0x2a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589e0  ! 1660: FDIVq	dis not found

	.word 0xb5aa4820  ! 1662: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_78:
	mov	0x26, %r14
	.word 0xfef38e60  ! 1663: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb9ab8820  ! 1664: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 28)
	.word 0xba0d4000  ! 1667: AND_R	and 	%r21, %r0, %r29
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_130:
	setx	0x290234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 1671: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb5aa0820  ! 1672: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_66:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 12)
	.word 0xb8a521f1  ! 1684: SUBcc_I	subcc 	%r20, 0x01f1, %r28
T1_asi_reg_wr_79:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 1687: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_80:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 1703: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3643801  ! 1709: MOVcc_I	<illegal instruction>
	.word 0xb3a449e0  ! 1712: FDIVq	dis not found

	.word 0xbfa94820  ! 1718: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a588e0  ! 1719: FSUBq	dis not found

iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb9aac820  ! 1725: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_81:
	mov	0x37, %r14
	.word 0xf6f38e80  ! 1726: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_68:
	mov	0x35, %r14
	.word 0xfcdb8400  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 22)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6b48000  ! 1737: SUBCcc_R	orncc 	%r18, %r0, %r27
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_82:
	mov	0x2, %r14
	.word 0xf4f38e60  ! 1739: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5a81c20  ! 1741: FMOVRGEZ	dis not found

	.word 0xbba548c0  ! 1742: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xb9a5c9a0  ! 1743: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbfa548a0  ! 1747: FSUBs	fsubs	%f21, %f0, %f31
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_69:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 20)
	.word 0xba3c0000  ! 1752: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xb9a48940  ! 1754: FMULd	fmuld	%f18, %f0, %f28
	.word 0xb1540000  ! 1756: RDPR_GL	<illegal instruction>
	.word 0xbba94820  ! 1757: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_131:
	setx	0x2b0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_70:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 1759: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb004c000  ! 1764: ADD_R	add 	%r19, %r0, %r24
T1_asi_reg_rd_71:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 1766: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_132:
	setx	0x28001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 1769: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00540  ! 1770: FSQRTd	fsqrt	
	.word 0xb7a48960  ! 1771: FMULq	dis not found

cpu_intr_1_133:
	setx	0x280109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 1778: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_rd_72:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 1779: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5a00520  ! 1780: FSQRTs	fsqrt	
cpu_intr_1_134:
	setx	0x28030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_83:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 1784: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbba81820  ! 1785: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb3a5c940  ! 1787: FMULd	fmuld	%f54, %f0, %f56
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_73:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb335e001  ! 1797: SRL_I	srl 	%r23, 0x0001, %r25
T1_asi_reg_wr_84:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 1799: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbba00520  ! 1801: FSQRTs	fsqrt	
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a50940  ! 1806: FMULd	fmuld	%f20, %f0, %f28
cpu_intr_1_135:
	setx	0x29000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488c0  ! 1812: FSUBd	fsubd	%f18, %f0, %f24
cpu_intr_1_136:
	setx	0x280005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 28)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbaacc000  ! 1820: ANDNcc_R	andncc 	%r19, %r0, %r29
	.word 0xb9a98820  ! 1823: FMOVNEG	fmovs	%fcc1, %f0, %f28
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a44960  ! 1832: FMULq	dis not found

cpu_intr_1_137:
	setx	0x2b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00ce1c8  ! 1835: AND_I	and 	%r19, 0x01c8, %r24
cpu_intr_1_138:
	setx	0x2a003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_139:
	setx	0x2b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 1839: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb73cd000  ! 1840: SRAX_R	srax	%r19, %r0, %r27
	.word 0xb7aa8820  ! 1841: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbbab4820  ! 1842: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5a88820  ! 1846: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_85:
	mov	0x7, %r14
	.word 0xf6f38e60  ! 1850: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_74:
	mov	0x15, %r14
	.word 0xf6db8e60  ! 1854: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa00540  ! 1861: FSQRTd	fsqrt	
	.word 0xb6a58000  ! 1862: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xbfaac820  ! 1864: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a4c8a0  ! 1866: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb6c58000  ! 1871: ADDCcc_R	addccc 	%r22, %r0, %r27
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a80420  ! 1873: FMOVRZ	dis not found

cpu_intr_1_140:
	setx	0x2d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_86:
	mov	0x28, %r14
	.word 0xfcf384a0  ! 1875: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_141:
	setx	0x2c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc25e08a  ! 1879: SUB_I	sub 	%r23, 0x008a, %r30
	.word 0xb1a50840  ! 1880: FADDd	faddd	%f20, %f0, %f24
	.word 0xbda44960  ! 1882: FMULq	dis not found

	.word 0xbba98820  ! 1883: FMOVNEG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_87:
	mov	0x29, %r14
	.word 0xf8f38400  ! 1886: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_75:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 1888: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba00040  ! 1889: FMOVd	fmovd	%f0, %f60
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfaa0820  ! 1894: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_88:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 1895: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbab0820  ! 1896: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a448c0  ! 1897: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb92d1000  ! 1899: SLLX_R	sllx	%r20, %r0, %r28
cpu_intr_1_142:
	setx	0x2c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_76:
	mov	0x19, %r14
	.word 0xfadb89e0  ! 1910: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1a4c8a0  ! 1912: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb5a80820  ! 1913: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda44860  ! 1915: FADDq	dis not found

T1_asi_reg_rd_77:
	mov	0x31, %r14
	.word 0xf8db89e0  ! 1916: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbba549c0  ! 1917: FDIVd	fdivd	%f52, %f0, %f60
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_143:
	setx	0x2e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a409c0  ! 1925: FDIVd	fdivd	%f16, %f0, %f26
	.word 0xbd3de001  ! 1926: SRA_I	sra 	%r23, 0x0001, %r30
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_144:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2ac8000  ! 1931: ANDNcc_R	andncc 	%r18, %r0, %r25
cpu_intr_1_145:
	setx	0x2d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 1933: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb48c4000  ! 1934: ANDcc_R	andcc 	%r17, %r0, %r26
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 33)
	.word 0xba144000  ! 1938: OR_R	or 	%r17, %r0, %r29
cpu_intr_1_146:
	setx	0x2f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_147:
	setx	0x2c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54820  ! 1943: FADDs	fadds	%f21, %f0, %f28
T1_asi_reg_rd_78:
	mov	0x19, %r14
	.word 0xf2db8e60  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_148:
	setx	0x2c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 9)
	.word 0xbdab0820  ! 1952: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb7a98820  ! 1958: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbda48920  ! 1960: FMULs	fmuls	%f18, %f0, %f30
	.word 0xbe248000  ! 1961: SUB_R	sub 	%r18, %r0, %r31
	.word 0xb7508000  ! 1962: RDPR_TSTATE	<illegal instruction>
	.word 0xb7358000  ! 1964: SRL_R	srl 	%r22, %r0, %r27
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb9a84820  ! 1968: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7a80820  ! 1971: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa4820  ! 1977: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_149:
	setx	0x2d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_150:
	setx	0x2d022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_89:
	mov	0x6, %r14
	.word 0xf8f38e60  ! 1981: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbdaa0820  ! 1982: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_151:
	setx	0x2f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a408e0  ! 1988: FSUBq	dis not found

iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_152:
	setx	0x2e032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589a0  ! 1991: FDIVs	fdivs	%f22, %f0, %f25
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3aa4820  ! 1993: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb885a0e0  ! 1994: ADDcc_I	addcc 	%r22, 0x00e0, %r28
	.word 0xb5a508c0  ! 1995: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb8958000  ! 1996: ORcc_R	orcc 	%r22, %r0, %r28
	.word 0xb33ca001  ! 1997: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xb3a00540  ! 2002: FSQRTd	fsqrt	
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 19)
	.word 0xbbaa0820  ! 2006: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 28)
	.word 0xbc0da08c  ! 2010: AND_I	and 	%r22, 0x008c, %r30
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3358000  ! 2013: SRL_R	srl 	%r22, %r0, %r25
	.word 0xb5aa4820  ! 2015: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa44960  ! 2016: FMULq	dis not found

iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_90:
	mov	0x11, %r14
	.word 0xfef384a0  ! 2022: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb7aa4820  ! 2023: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a588c0  ! 2024: FSUBd	fsubd	%f22, %f0, %f28
cpu_intr_1_153:
	setx	0x2e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 7)
	.word 0xb534f001  ! 2032: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xbba94820  ! 2033: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa0820  ! 2034: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00020  ! 2035: FMOVs	fmovs	%f0, %f27
	.word 0xb0150000  ! 2036: OR_R	or 	%r20, %r0, %r24
	.word 0xbfa54940  ! 2037: FMULd	fmuld	%f52, %f0, %f62
T1_asi_reg_rd_79:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_154:
	setx	0x2e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_80:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_81:
	mov	0x26, %r14
	.word 0xfadb8400  ! 2053: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5a80420  ! 2059: FMOVRZ	dis not found

T1_asi_reg_wr_91:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 2065: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_155:
	setx	0x2c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_82:
	mov	0x35, %r14
	.word 0xf2db8e60  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1a5c920  ! 2070: FMULs	fmuls	%f23, %f0, %f24
	.word 0xb1aa4820  ! 2071: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a489c0  ! 2075: FDIVd	fdivd	%f18, %f0, %f58
T1_asi_reg_rd_83:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 2076: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb1510000  ! 2079: RDPR_TICK	<illegal instruction>
T1_asi_reg_rd_84:
	mov	0x29, %r14
	.word 0xfadb8e60  ! 2084: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3a408e0  ! 2085: FSUBq	dis not found

T1_asi_reg_rd_85:
	mov	0x2, %r14
	.word 0xf6db8400  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_156:
	setx	0x2e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 33)
	.word 0xb9abc820  ! 2097: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_86:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_157:
	setx	0x2d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a00560  ! 2102: FSQRTq	fsqrt	
	.word 0xb9aa4820  ! 2107: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a5c960  ! 2115: FMULq	dis not found

T1_asi_reg_wr_92:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 2116: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_158:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_93:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 2121: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_87:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3a80c20  ! 2126: FMOVRLZ	dis not found

	.word 0xb72ca001  ! 2130: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xbfa9c820  ! 2131: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_159:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a00020  ! 2144: FMOVs	fmovs	%f0, %f26
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 17)
	.word 0xb40521a4  ! 2149: ADD_I	add 	%r20, 0x01a4, %r26
	.word 0xbfa448a0  ! 2154: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xbfa00020  ! 2155: FMOVs	fmovs	%f0, %f31
cpu_intr_1_160:
	setx	0x2c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa84820  ! 2161: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_161:
	setx	0x2c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb1350000  ! 2172: SRL_R	srl 	%r20, %r0, %r24
T1_asi_reg_wr_94:
	mov	0x32, %r14
	.word 0xfcf38e60  ! 2173: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_88:
	mov	0x9, %r14
	.word 0xf4db89e0  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_wr_95:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 2179: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfa81c20  ! 2182: FMOVRGEZ	dis not found

T1_asi_reg_rd_89:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3a8c820  ! 2187: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb3a81820  ! 2189: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbfa488a0  ! 2191: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb97cc400  ! 2192: MOVR_R	movre	%r19, %r0, %r28
T1_asi_reg_wr_96:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 2200: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_97:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 2201: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_162:
	setx	0x2c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_98:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 2205: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_90:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 2207: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba50920  ! 2208: FMULs	fmuls	%f20, %f0, %f29
cpu_intr_1_163:
	setx	0x2c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a588c0  ! 2211: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb5a4c9e0  ! 2212: FDIVq	dis not found

	.word 0xbfa509c0  ! 2213: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xbdab0820  ! 2216: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_164:
	setx	0x2f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_91:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 2219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_165:
	setx	0x2f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 2226: RDPR_PSTATE	<illegal instruction>
	.word 0xbdaa8820  ! 2228: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_92:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5a5c920  ! 2230: FMULs	fmuls	%f23, %f0, %f26
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_rd_93:
	mov	0x24, %r14
	.word 0xf6db8e40  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_99:
	mov	0x3, %r14
	.word 0xfcf38e60  ! 2235: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5a90820  ! 2236: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_94:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1ab8820  ! 2243: FMOVPOS	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_100:
	mov	0x3, %r14
	.word 0xfaf38e80  ! 2249: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_95:
	mov	0x8, %r14
	.word 0xf0db84a0  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_rd_96:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 2252: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a549a0  ! 2257: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xb5a00540  ! 2259: FSQRTd	fsqrt	
T1_asi_reg_rd_97:
	mov	0x19, %r14
	.word 0xf6db8e80  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_166:
	setx	0x2f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 2263: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a81c20  ! 2264: FMOVRGEZ	dis not found

cpu_intr_1_167:
	setx	0x2c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 6)
	.word 0xbda98820  ! 2271: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb7a5c960  ! 2272: FMULq	dis not found

T1_asi_reg_wr_101:
	mov	0x12, %r14
	.word 0xfcf389e0  ! 2273: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_168:
	setx	0x2d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, d)
	.word 0xbba5c940  ! 2284: FMULd	fmuld	%f54, %f0, %f60
T1_asi_reg_wr_102:
	mov	0x2c, %r14
	.word 0xf4f38400  ! 2285: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_98:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a81c20  ! 2292: FMOVRGEZ	dis not found

cpu_intr_1_169:
	setx	0x2d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0xb, %r14
	.word 0xf0f38e80  ! 2294: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9a00040  ! 2296: FMOVd	fmovd	%f0, %f28
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_104:
	mov	0x24, %r14
	.word 0xfef384a0  ! 2299: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb1abc820  ! 2301: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_170:
	setx	0x300209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_99:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_100:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 2306: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda00540  ! 2309: FSQRTd	fsqrt	
	.word 0xbba509e0  ! 2310: FDIVq	dis not found

iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 2d)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb4150000  ! 2320: OR_R	or 	%r20, %r0, %r26
	.word 0xb6bc8000  ! 2321: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xbfaac820  ! 2324: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_105:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 2325: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9aa0820  ! 2328: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_101:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 2329: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba408a0  ! 2335: FSUBs	fsubs	%f16, %f0, %f29
cpu_intr_1_171:
	setx	0x300017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8e0  ! 2340: FSUBq	dis not found

	.word 0xbda81c20  ! 2342: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_102:
	mov	0x5, %r14
	.word 0xf8db84a0  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1a8c820  ! 2347: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_106:
	mov	0x6, %r14
	.word 0xf2f38400  ! 2348: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_172:
	setx	0x32030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_173:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 2352: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9a80420  ! 2353: FMOVRZ	dis not found

	.word 0xb3a40960  ! 2354: FMULq	dis not found

	.word 0xb9a488c0  ! 2355: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xbb2d0000  ! 2357: SLL_R	sll 	%r20, %r0, %r29
T1_asi_reg_rd_103:
	mov	0x16, %r14
	.word 0xfcdb89e0  ! 2358: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb4a52177  ! 2360: SUBcc_I	subcc 	%r20, 0x0177, %r26
	.word 0xbfa589a0  ! 2362: FDIVs	fdivs	%f22, %f0, %f31
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda81c20  ! 2365: FMOVRGEZ	dis not found

	.word 0xb1a80820  ! 2367: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_174:
	setx	0x33012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 2372: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_175:
	setx	0x330000, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2379: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_104:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 2381: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5a409e0  ! 2383: FDIVq	dis not found

cpu_intr_1_176:
	setx	0x330133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x32021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_178:
	setx	0x310303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 2397: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_179:
	setx	0x300315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_108:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 2402: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_105:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 2404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbe3de178  ! 2405: XNOR_I	xnor 	%r23, 0x0178, %r31
	.word 0xb1a90820  ! 2406: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_109:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 2410: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_110:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 2411: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbba00520  ! 2412: FSQRTs	fsqrt	
	.word 0xbda48840  ! 2413: FADDd	faddd	%f18, %f0, %f30
cpu_intr_1_180:
	setx	0x30031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_111:
	mov	0xa, %r14
	.word 0xf0f38e60  ! 2417: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1a54940  ! 2418: FMULd	fmuld	%f52, %f0, %f24
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_106:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_107:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_108:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_181:
	setx	0x33012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 2441: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_112:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 2442: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_113:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 2445: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a44920  ! 2446: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb5a84820  ! 2451: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_109:
	mov	0x2b, %r14
	.word 0xf4db8400  ! 2453: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb9a81820  ! 2454: FMOVRGZ	fmovs	%fcc3, %f0, %f28
T1_asi_reg_wr_114:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 2455: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_115:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 2457: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_116:
	mov	0x3, %r14
	.word 0xf2f38e60  ! 2460: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_110:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 2464: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_182:
	setx	0x30010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_183:
	setx	0x32030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_184:
	setx	0x30030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2cd000  ! 2471: SLLX_R	sllx	%r19, %r0, %r31
T1_asi_reg_rd_111:
	mov	0x23, %r14
	.word 0xf2db8e60  ! 2472: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa81820  ! 2478: FMOVRGZ	fmovs	%fcc3, %f0, %f31
T1_asi_reg_wr_118:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 2479: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb3a80820  ! 2481: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 25)
	.word 0xbc1dc000  ! 2483: XOR_R	xor 	%r23, %r0, %r30
T1_asi_reg_rd_112:
	mov	0x2d, %r14
	.word 0xfedb8400  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfa44960  ! 2486: FMULq	dis not found

cpu_intr_1_185:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 2490: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_113:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_114:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 2494: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a488c0  ! 2495: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xb5a48960  ! 2496: FMULq	dis not found

T1_asi_reg_wr_119:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 2498: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfa80820  ! 2504: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_186:
	setx	0x310305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_120:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 2506: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_115:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 2508: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_116:
	mov	0x2c, %r14
	.word 0xfadb89e0  ! 2509: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_117:
	mov	0x2a, %r14
	.word 0xfedb84a0  ! 2515: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_118:
	mov	0xc, %r14
	.word 0xf0db8400  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb5aa4820  ! 2523: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_187:
	setx	0x31003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c8e0  ! 2525: FSUBq	dis not found

cpu_intr_1_188:
	setx	0x310129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x7, %r14
	.word 0xfaf38e80  ! 2531: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_122:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 2532: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3a00540  ! 2535: FSQRTd	fsqrt	
	.word 0xb1a00020  ! 2537: FMOVs	fmovs	%f0, %f24
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_123:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 2541: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1ab4820  ! 2542: FMOVCC	fmovs	%fcc1, %f0, %f24
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa00560  ! 2544: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_189:
	setx	0x310239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1ce1bd  ! 2549: XOR_I	xor 	%r19, 0x01bd, %r29
	.word 0xba348000  ! 2550: SUBC_R	orn 	%r18, %r0, %r29
T1_asi_reg_rd_119:
	mov	0x1c, %r14
	.word 0xf4db8400  ! 2552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3a589c0  ! 2553: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xbba50920  ! 2554: FMULs	fmuls	%f20, %f0, %f29
cpu_intr_1_190:
	setx	0x31002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 2558: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbbaa0820  ! 2560: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa48960  ! 2561: FMULq	dis not found

T1_asi_reg_rd_120:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 2563: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a88820  ! 2564: FMOVLE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_121:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 2566: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfa44860  ! 2567: FADDq	dis not found

iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_191:
	setx	0x300127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_192:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_193:
	setx	0x300339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4148000  ! 2581: OR_R	or 	%r18, %r0, %r26
T1_asi_reg_wr_124:
	mov	0x15, %r14
	.word 0xfaf38400  ! 2584: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbba88820  ! 2587: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a80820  ! 2588: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
cpu_intr_1_194:
	setx	0x30012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 2592: FSQRTq	fsqrt	
T1_asi_reg_rd_122:
	mov	0x26, %r14
	.word 0xf4db84a0  ! 2593: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, d)
	.word 0xb8bce11d  ! 2597: XNORcc_I	xnorcc 	%r19, 0x011d, %r28
	.word 0xbda94820  ! 2599: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a58860  ! 2600: FADDq	dis not found

	.word 0xb1a5c820  ! 2603: FADDs	fadds	%f23, %f0, %f24
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb005607f  ! 2609: ADD_I	add 	%r21, 0x007f, %r24
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_195:
	setx	0x33023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a8c820  ! 2616: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_196:
	setx	0x30003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 2620: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb2b48000  ! 2621: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xbfa58960  ! 2626: FMULq	dis not found

	.word 0xbaac208f  ! 2627: ANDNcc_I	andncc 	%r16, 0x008f, %r29
	.word 0xb7a5c840  ! 2631: FADDd	faddd	%f54, %f0, %f58
	.word 0xbd2c8000  ! 2632: SLL_R	sll 	%r18, %r0, %r30
cpu_intr_1_197:
	setx	0x32013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_123:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbda5c8c0  ! 2637: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xbda90820  ! 2639: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb3abc820  ! 2641: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_124:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 2648: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_198:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c840  ! 2650: FADDd	faddd	%f50, %f0, %f28
	.word 0xb5a4c9c0  ! 2651: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xb1a88820  ! 2658: FMOVLE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_199:
	setx	0x33032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35d000  ! 2661: SRLX_R	srlx	%r23, %r0, %r30
cpu_intr_1_200:
	setx	0x310028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c9c0  ! 2663: FDIVd	fdivd	%f54, %f0, %f24
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 36)
	.word 0xbf357001  ! 2665: SRLX_I	srlx	%r21, 0x0001, %r31
T1_asi_reg_rd_125:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfa00540  ! 2668: FSQRTd	fsqrt	
	.word 0xbfa509e0  ! 2669: FDIVq	dis not found

iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a9c820  ! 2672: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb495e071  ! 2676: ORcc_I	orcc 	%r23, 0x0071, %r26
cpu_intr_1_201:
	setx	0x330227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 2680: FMOVRNZ	dis not found

	.word 0xb7a4c920  ! 2681: FMULs	fmuls	%f19, %f0, %f27
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_125:
	mov	0x2d, %r14
	.word 0xfef38e60  ! 2686: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a509a0  ! 2695: FDIVs	fdivs	%f20, %f0, %f24
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a58940  ! 2705: FMULd	fmuld	%f22, %f0, %f56
	.word 0xb9a408a0  ! 2707: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb4c4c000  ! 2711: ADDCcc_R	addccc 	%r19, %r0, %r26
	.word 0xbc144000  ! 2712: OR_R	or 	%r17, %r0, %r30
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_126:
	mov	0x21, %r14
	.word 0xf8f38400  ! 2716: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_126:
	mov	0x0, %r14
	.word 0xfcdb84a0  ! 2717: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7a80420  ! 2718: FMOVRZ	dis not found

T1_asi_reg_rd_127:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 2719: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_202:
	setx	0x33000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_127:
	mov	0x9, %r14
	.word 0xf2f384a0  ! 2724: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_128:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 2725: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a9c820  ! 2728: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_129:
	mov	0x14, %r14
	.word 0xf0f384a0  ! 2731: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfa4c960  ! 2736: FMULq	dis not found

cpu_intr_1_203:
	setx	0x35031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a489e0  ! 2743: FDIVq	dis not found

	.word 0xbe0da16c  ! 2744: AND_I	and 	%r22, 0x016c, %r31
	.word 0xb3a589e0  ! 2747: FDIVq	dis not found

iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_204:
	setx	0x350324, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 3f)
	.word 0xa1902000  ! 2755: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_1_205:
	setx	0x35002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda84820  ! 2761: FMOVE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_130:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2762: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, e)
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_128:
	mov	0x2a, %r14
	.word 0xf8db8e60  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbb3c0000  ! 2776: SRA_R	sra 	%r16, %r0, %r29
	.word 0xb5aa0820  ! 2779: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 10)
	.word 0xbbab4820  ! 2786: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_206:
	setx	0x350315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40840  ! 2795: FADDd	faddd	%f16, %f0, %f62
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a00560  ! 2803: FSQRTq	fsqrt	
T1_asi_reg_wr_131:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2804: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7a00520  ! 2806: FSQRTs	fsqrt	
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 20)
	.word 0xb1a00020  ! 2813: FMOVs	fmovs	%f0, %f24
	.word 0xb9a80820  ! 2816: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_129:
	mov	0x32, %r14
	.word 0xfedb8e60  ! 2819: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda80420  ! 2820: FMOVRZ	dis not found

cpu_intr_1_207:
	setx	0x370032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 27)
	.word 0xbfa489a0  ! 2824: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xb0c4a000  ! 2825: ADDCcc_I	addccc 	%r18, 0x0000, %r24
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_208:
	setx	0x350102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_209:
	setx	0x340203, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb3a00040  ! 2840: FMOVd	fmovd	%f0, %f56
cpu_intr_1_210:
	setx	0x350234, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_130:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 2843: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9a409e0  ! 2844: FDIVq	dis not found

	.word 0xb495e089  ! 2845: ORcc_I	orcc 	%r23, 0x0089, %r26
T1_asi_reg_wr_132:
	mov	0x1f, %r14
	.word 0xf2f384a0  ! 2846: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_133:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 2847: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_134:
	mov	0x2c, %r14
	.word 0xf2f389e0  ! 2848: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_211:
	setx	0x34033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 7)
	.word 0xb93da001  ! 2852: SRA_I	sra 	%r22, 0x0001, %r28
cpu_intr_1_212:
	setx	0x36022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_213:
	setx	0x370332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_131:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 2858: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_135:
	mov	0x6, %r14
	.word 0xfaf384a0  ! 2859: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9a4c940  ! 2861: FMULd	fmuld	%f50, %f0, %f28
T1_asi_reg_wr_136:
	mov	0x1d, %r14
	.word 0xf2f38e60  ! 2864: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_214:
	setx	0x370322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684c000  ! 2866: ADDcc_R	addcc 	%r19, %r0, %r27
	.word 0xb351c000  ! 2867: RDPR_TL	<illegal instruction>
cpu_intr_1_215:
	setx	0x36002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_137:
	mov	0x1, %r14
	.word 0xf2f38400  ! 2870: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xa1902001  ! 2871: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T1_asi_reg_rd_132:
	mov	0x3, %r14
	.word 0xf4db8400  ! 2874: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb64521b1  ! 2876: ADDC_I	addc 	%r20, 0x01b1, %r27
	.word 0x8f902002  ! 2878: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbda44920  ! 2879: FMULs	fmuls	%f17, %f0, %f30
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 7)
	.word 0xb9a489c0  ! 2883: FDIVd	fdivd	%f18, %f0, %f28
T1_asi_reg_wr_138:
	mov	0x19, %r14
	.word 0xf2f389e0  ! 2885: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_133:
	mov	0x28, %r14
	.word 0xf4db8e60  ! 2886: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5a80820  ! 2887: FMOVN	fmovs	%fcc1, %f0, %f26
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a88820  ! 2890: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_216:
	setx	0x36033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 2893: RDPR_PIL	<illegal instruction>
	.word 0xbba90820  ! 2894: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_217:
	setx	0x340000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_218:
	setx	0x360239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_134:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 2897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_219:
	setx	0x360029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_220:
	setx	0x340200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 2904: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa409e0  ! 2906: FDIVq	dis not found

cpu_intr_1_221:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_222:
	setx	0x370112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_223:
	setx	0x340134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa42034  ! 2916: SUBcc_I	subcc 	%r16, 0x0034, %r29
	.word 0xb1a81c20  ! 2917: FMOVRGEZ	dis not found

T1_asi_reg_rd_135:
	mov	0x22, %r14
	.word 0xf6db8e40  ! 2919: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa489a0  ! 2920: FDIVs	fdivs	%f18, %f0, %f31
cpu_intr_1_224:
	setx	0x350214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a84820  ! 2935: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a00560  ! 2938: FSQRTq	fsqrt	
T1_asi_reg_wr_139:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 2940: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbaac820  ! 2941: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_136:
	mov	0x28, %r14
	.word 0xf8db8400  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3a00520  ! 2946: FSQRTs	fsqrt	
	.word 0xb9a98820  ! 2947: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbda50920  ! 2949: FMULs	fmuls	%f20, %f0, %f30
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba50860  ! 2953: FADDq	dis not found

T1_asi_reg_wr_140:
	mov	0x2e, %r14
	.word 0xfcf38e80  ! 2957: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_141:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 2959: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfa00040  ! 2961: FMOVd	fmovd	%f0, %f62
	.word 0xb9a5c840  ! 2962: FADDd	faddd	%f54, %f0, %f28
cpu_intr_1_225:
	setx	0x37022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_142:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 2970: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_137:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 2972: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbabca1bb  ! 2973: XNORcc_I	xnorcc 	%r18, 0x01bb, %r29
cpu_intr_1_226:
	setx	0x35001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_227:
	setx	0x35021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_138:
	mov	0xd, %r14
	.word 0xf2db8e60  ! 2979: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9a88820  ! 2980: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_143:
	mov	0x6, %r14
	.word 0xf0f38e40  ! 2983: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_139:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 2986: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_140:
	mov	0x10, %r14
	.word 0xf2db8e60  ! 2988: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9a509e0  ! 2989: FDIVq	dis not found

T1_asi_reg_wr_144:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 2990: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_228:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 2994: RDPR_TPC	<illegal instruction>
	.word 0xbda81820  ! 2995: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_wr_145:
	mov	0x12, %r14
	.word 0xf0f384a0  ! 3000: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_141:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_229:
	setx	0x35011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_230:
	setx	0x340006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_142:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_143:
	mov	0x23, %r14
	.word 0xf4db89e0  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_144:
	mov	0x3, %r14
	.word 0xf0db84a0  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb3a409e0  ! 3023: FDIVq	dis not found

cpu_intr_1_231:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_232:
	setx	0x36023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_145:
	mov	0x15, %r14
	.word 0xf0db84a0  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 0)
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_rd_146:
	mov	0x2c, %r14
	.word 0xf2db8e60  ! 3042: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb21de053  ! 3043: XOR_I	xor 	%r23, 0x0053, %r25
T1_asi_reg_wr_146:
	mov	0x6, %r14
	.word 0xf8f38e80  ! 3044: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb2c5e017  ! 3045: ADDCcc_I	addccc 	%r23, 0x0017, %r25
	.word 0xb3a00560  ! 3046: FSQRTq	fsqrt	
cpu_intr_1_233:
	setx	0x370219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48840  ! 3053: FADDd	faddd	%f18, %f0, %f26
	.word 0xb4a58000  ! 3054: SUBcc_R	subcc 	%r22, %r0, %r26
	.word 0xb7a5c860  ! 3056: FADDq	dis not found

	.word 0xb3a81420  ! 3057: FMOVRNZ	dis not found

	.word 0xb3ab8820  ! 3059: FMOVPOS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_147:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 3064: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00520  ! 3067: FSQRTs	fsqrt	
cpu_intr_1_234:
	setx	0x340130, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_147:
	mov	0x4, %r14
	.word 0xf8f38e60  ! 3071: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbb643801  ! 3072: MOVcc_I	<illegal instruction>
	.word 0xb5a80820  ! 3074: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbda98820  ! 3075: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5a5c8c0  ! 3079: FSUBd	fsubd	%f54, %f0, %f26
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb73c0000  ! 3085: SRA_R	sra 	%r16, %r0, %r27
	.word 0xb1a81420  ! 3087: FMOVRNZ	dis not found

	.word 0x9195619c  ! 3088: WRPR_PIL_I	wrpr	%r21, 0x019c, %pil
	.word 0xb3a58920  ! 3089: FMULs	fmuls	%f22, %f0, %f25
	.word 0xb1a80c20  ! 3090: FMOVRLZ	dis not found

T1_asi_reg_rd_148:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5a48820  ! 3094: FADDs	fadds	%f18, %f0, %f26
	.word 0xb7aa8820  ! 3096: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 30)
	.word 0xb69d8000  ! 3103: XORcc_R	xorcc 	%r22, %r0, %r27
cpu_intr_1_235:
	setx	0x350239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba95a12d  ! 3105: ORcc_I	orcc 	%r22, 0x012d, %r29
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_148:
	mov	0x1d, %r14
	.word 0xf4f38e80  ! 3112: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb9a8c820  ! 3113: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_149:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 3119: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbba489a0  ! 3122: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xbfa50940  ! 3123: FMULd	fmuld	%f20, %f0, %f62
cpu_intr_1_236:
	setx	0x34013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_150:
	mov	0x26, %r14
	.word 0xf0f38400  ! 3127: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9a40860  ! 3128: FADDq	dis not found

T1_asi_reg_wr_151:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 3129: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbba44920  ! 3132: FMULs	fmuls	%f17, %f0, %f29
	.word 0xba85207f  ! 3135: ADDcc_I	addcc 	%r20, 0x007f, %r29
	.word 0xb5a00520  ! 3136: FSQRTs	fsqrt	
	.word 0xbda80420  ! 3137: FMOVRZ	dis not found

	.word 0xbc1d60e4  ! 3138: XOR_I	xor 	%r21, 0x00e4, %r30
	.word 0xb7a4c820  ! 3139: FADDs	fadds	%f19, %f0, %f27
T1_asi_reg_rd_149:
	mov	0xd, %r14
	.word 0xfadb8400  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_150:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3144: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_237:
	setx	0x360114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a81820  ! 3154: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_238:
	setx	0x350002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54820  ! 3156: FADDs	fadds	%f21, %f0, %f30
cpu_intr_1_239:
	setx	0x35001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbd504000  ! 3162: RDPR_TNPC	<illegal instruction>
T1_asi_reg_rd_151:
	mov	0xd, %r14
	.word 0xf2db84a0  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb2bc0000  ! 3165: XNORcc_R	xnorcc 	%r16, %r0, %r25
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 32)
	.word 0xb3aa0820  ! 3168: FMOVA	fmovs	%fcc1, %f0, %f25
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a509c0  ! 3171: FDIVd	fdivd	%f20, %f0, %f26
T1_asi_reg_rd_152:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfa509c0  ! 3173: FDIVd	fdivd	%f20, %f0, %f62
T1_asi_reg_wr_152:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 3175: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1a00540  ! 3178: FSQRTd	fsqrt	
T1_asi_reg_rd_153:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 3179: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 13)
	.word 0xbfa409a0  ! 3182: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb0240000  ! 3183: SUB_R	sub 	%r16, %r0, %r24
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba5c9c0  ! 3191: FDIVd	fdivd	%f54, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a58920  ! 3196: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb9abc820  ! 3197: FMOVVC	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a40840  ! 3205: FADDd	faddd	%f16, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, b)
	.word 0xb1480000  ! 3208: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
T1_asi_reg_rd_154:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbcbda07d  ! 3210: XNORcc_I	xnorcc 	%r22, 0x007d, %r30
	.word 0xbfa81820  ! 3211: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbda509a0  ! 3212: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xbfa00020  ! 3214: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_153:
	mov	0x25, %r14
	.word 0xf0f38e80  ! 3215: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3a00560  ! 3216: FSQRTq	fsqrt	
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_154:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 3218: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_240:
	setx	0x39023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_241:
	setx	0x3a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_155:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 3225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_155:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3227: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe8c204e  ! 3233: ANDcc_I	andcc 	%r16, 0x004e, %r31
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_156:
	mov	0x9, %r14
	.word 0xf2db8e40  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda88820  ! 3245: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb57d0400  ! 3246: MOVR_R	movre	%r20, %r0, %r26
	.word 0xbfabc820  ! 3247: FMOVVC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_242:
	setx	0x380228, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_157:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbe3461ab  ! 3251: ORN_I	orn 	%r17, 0x01ab, %r31
	.word 0xbba88820  ! 3252: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7a94820  ! 3255: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_243:
	setx	0x380135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d3001  ! 3260: SLLX_I	sllx	%r20, 0x0001, %r25
	.word 0xb3a409e0  ! 3264: FDIVq	dis not found

	.word 0xbfa548e0  ! 3268: FSUBq	dis not found

	.word 0xbba80820  ! 3269: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_244:
	setx	0x3b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44960  ! 3274: FMULq	dis not found

T1_asi_reg_rd_158:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbc2d4000  ! 3277: ANDN_R	andn 	%r21, %r0, %r30
T1_asi_reg_rd_159:
	mov	0x2d, %r14
	.word 0xfedb8e60  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_160:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a80820  ! 3284: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba50840  ! 3285: FADDd	faddd	%f20, %f0, %f60
	.word 0xb5a54840  ! 3286: FADDd	faddd	%f52, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_161:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 2)
	.word 0xb2842121  ! 3293: ADDcc_I	addcc 	%r16, 0x0121, %r25
	.word 0xb3a50820  ! 3294: FADDs	fadds	%f20, %f0, %f25
T1_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 3299: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 33)
	.word 0xbda00040  ! 3306: FMOVd	fmovd	%f0, %f30
T1_asi_reg_rd_162:
	mov	0x22, %r14
	.word 0xfadb8400  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_163:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 3310: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_157:
	mov	0x7, %r14
	.word 0xfef38e60  ! 3313: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_245:
	setx	0x3b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 3317: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_158:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 3320: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_159:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 3323: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbdaa4820  ! 3325: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_246:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a58000  ! 3330: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0xbdaa0820  ! 3336: FMOVA	fmovs	%fcc1, %f0, %f30
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 37)
	.word 0xb9a44920  ! 3338: FMULs	fmuls	%f17, %f0, %f28
cpu_intr_1_247:
	setx	0x3b0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a548e0  ! 3340: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc258000  ! 3342: SUB_R	sub 	%r22, %r0, %r30
T1_asi_reg_rd_164:
	mov	0x15, %r14
	.word 0xfcdb89e0  ! 3344: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_248:
	setx	0x3a033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 3349: FSQRTd	fsqrt	
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_160:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 3355: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc040000  ! 3358: ADD_R	add 	%r16, %r0, %r30
cpu_intr_1_249:
	setx	0x39032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 3361: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba40860  ! 3368: FADDq	dis not found

	.word 0xbdaa8820  ! 3369: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbba548e0  ! 3372: FSUBq	dis not found

	.word 0xbda88820  ! 3373: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a81820  ! 3377: FMOVRGZ	fmovs	%fcc3, %f0, %f25
T1_asi_reg_wr_161:
	mov	0x4, %r14
	.word 0xf0f384a0  ! 3378: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfa00540  ! 3380: FSQRTd	fsqrt	
	.word 0xb9a80820  ! 3384: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_165:
	mov	0x2, %r14
	.word 0xf6db8400  ! 3385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_166:
	mov	0xc, %r14
	.word 0xfcdb89e0  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb9a48940  ! 3388: FMULd	fmuld	%f18, %f0, %f28
cpu_intr_1_250:
	setx	0x3a012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 38)
	.word 0xb0bde0f5  ! 3391: XNORcc_I	xnorcc 	%r23, 0x00f5, %r24
	.word 0xbfa50860  ! 3392: FADDq	dis not found

	.word 0xb93df001  ! 3393: SRAX_I	srax	%r23, 0x0001, %r28
cpu_intr_1_251:
	setx	0x3b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_252:
	setx	0x3b020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 3400: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_162:
	mov	0x1d, %r14
	.word 0xfaf38400  ! 3403: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9a00560  ! 3404: FSQRTq	fsqrt	
	.word 0xb1a548c0  ! 3405: FSUBd	fsubd	%f52, %f0, %f24
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_253:
	setx	0x3b0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 3414: FMOVRGEZ	dis not found

T1_asi_reg_wr_163:
	mov	0x2d, %r14
	.word 0xfef38400  ! 3415: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_167:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_164:
	mov	0x20, %r14
	.word 0xf8f384a0  ! 3420: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_254:
	setx	0x380136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_255:
	setx	0x3b0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_256:
	setx	0x3a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_165:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 3431: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfa44960  ! 3432: FMULq	dis not found

	.word 0xb5a508e0  ! 3434: FSUBq	dis not found

T1_asi_reg_wr_166:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 3435: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb834c000  ! 3436: ORN_R	orn 	%r19, %r0, %r28
	.word 0xbda00540  ! 3439: FSQRTd	fsqrt	
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_167:
	mov	0x4, %r14
	.word 0xf2f38400  ! 3442: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbf2ce001  ! 3444: SLL_I	sll 	%r19, 0x0001, %r31
cpu_intr_1_257:
	setx	0x380017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c920  ! 3447: FMULs	fmuls	%f19, %f0, %f26
	.word 0xbb2c3001  ! 3448: SLLX_I	sllx	%r16, 0x0001, %r29
	.word 0xb7a00560  ! 3450: FSQRTq	fsqrt	
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_168:
	mov	0x7, %r14
	.word 0xf8f38400  ! 3452: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_169:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 3457: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1a448e0  ! 3461: FSUBq	dis not found

T1_asi_reg_wr_170:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 3468: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_wr_171:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 3469: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_168:
	mov	0x28, %r14
	.word 0xf0db8e40  ! 3470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_172:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 3471: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbba81c20  ! 3476: FMOVRGEZ	dis not found

T1_asi_reg_rd_169:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_wr_173:
	mov	0x19, %r14
	.word 0xf4f389e0  ! 3481: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbdaa8820  ! 3483: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb1a508e0  ! 3491: FSUBq	dis not found

	.word 0xb3a00520  ! 3494: FSQRTs	fsqrt	
	.word 0xb9a44940  ! 3496: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb9aa8820  ! 3499: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbfaac820  ! 3500: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbba5c820  ! 3501: FADDs	fadds	%f23, %f0, %f29
cpu_intr_1_258:
	setx	0x3b0104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_259:
	setx	0x3b0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_260:
	setx	0x39001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 3507: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_261:
	setx	0x3a030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a58960  ! 3513: FMULq	dis not found

iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba00560  ! 3518: FSQRTq	fsqrt	
T1_asi_reg_rd_171:
	mov	0x9, %r14
	.word 0xfadb89e0  ! 3519: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_262:
	setx	0x3a023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_263:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_174:
	mov	0x20, %r14
	.word 0xfef38e60  ! 3523: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_264:
	setx	0x380323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_265:
	setx	0x39001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 3528: FSQRTd	fsqrt	
	.word 0x89952005  ! 3531: WRPR_TICK_I	wrpr	%r20, 0x0005, %tick
T1_asi_reg_rd_172:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 3532: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe0d0000  ! 3533: AND_R	and 	%r20, %r0, %r31
	.word 0xbfa80c20  ! 3537: FMOVRLZ	dis not found

T1_asi_reg_rd_173:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbc2de0bc  ! 3542: ANDN_I	andn 	%r23, 0x00bc, %r30
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 0)
	.word 0xb134c000  ! 3556: SRL_R	srl 	%r19, %r0, %r24
	.word 0xb1a509c0  ! 3559: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xbda8c820  ! 3560: FMOVL	fmovs	%fcc1, %f0, %f30
cpu_intr_1_266:
	setx	0x3a013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 3563: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb6c40000  ! 3566: ADDCcc_R	addccc 	%r16, %r0, %r27
cpu_intr_1_267:
	setx	0x3a0015, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_175:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 3574: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_rd_174:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 3575: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a4c860  ! 3580: FADDq	dis not found

T1_asi_reg_wr_176:
	mov	0x28, %r14
	.word 0xfaf38e60  ! 3581: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_268:
	setx	0x38030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda589c0  ! 3585: FDIVd	fdivd	%f22, %f0, %f30
	.word 0xb615c000  ! 3588: OR_R	or 	%r23, %r0, %r27
	.word 0xb1a90820  ! 3591: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_175:
	mov	0x23, %r14
	.word 0xfadb8400  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_269:
	setx	0x3a002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_270:
	setx	0x3a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 3600: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb5a589c0  ! 3601: FDIVd	fdivd	%f22, %f0, %f26
	.word 0xb01c4000  ! 3602: XOR_R	xor 	%r17, %r0, %r24
	.word 0xb5a00560  ! 3605: FSQRTq	fsqrt	
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb1a00020  ! 3609: FMOVs	fmovs	%f0, %f24
	.word 0xbda80820  ! 3610: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbda448e0  ! 3616: FSUBq	dis not found

T1_asi_reg_rd_176:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3617: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7a5c960  ! 3619: FMULq	dis not found

	.word 0xb37c8400  ! 3620: MOVR_R	movre	%r18, %r0, %r25
	.word 0xb7a81420  ! 3622: FMOVRNZ	dis not found

	.word 0xbfa80c20  ! 3623: FMOVRLZ	dis not found

	.word 0xb3a94820  ! 3624: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a488a0  ! 3625: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xb3aa8820  ! 3627: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_271:
	setx	0x3c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_272:
	setx	0x3e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_177:
	mov	0xa, %r14
	.word 0xfef389e0  ! 3636: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb02560b9  ! 3639: SUB_I	sub 	%r21, 0x00b9, %r24
	.word 0xb3a81820  ! 3646: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 9)
	.word 0xb7a00560  ! 3648: FSQRTq	fsqrt	
	.word 0xb7ab0820  ! 3652: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 35)
	.word 0xb2342016  ! 3655: ORN_I	orn 	%r16, 0x0016, %r25
	.word 0xbba80420  ! 3661: FMOVRZ	dis not found

	.word 0xb1aa8820  ! 3662: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa8820  ! 3667: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbda589e0  ! 3669: FDIVq	dis not found

	.word 0xb3aa0820  ! 3673: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb5a88820  ! 3676: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_178:
	mov	0x1c, %r14
	.word 0xf4f38e80  ! 3677: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_179:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 3678: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb4954000  ! 3683: ORcc_R	orcc 	%r21, %r0, %r26
T1_asi_reg_wr_180:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3684: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda48820  ! 3687: FADDs	fadds	%f18, %f0, %f30
cpu_intr_1_273:
	setx	0x3d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_274:
	setx	0x3d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x3c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488a0  ! 3692: FSUBs	fsubs	%f18, %f0, %f30
cpu_intr_1_276:
	setx	0x3c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d0000  ! 3698: XNOR_R	xnor 	%r20, %r0, %r29
	.word 0xb350c000  ! 3699: RDPR_TT	<illegal instruction>
	.word 0xbda00560  ! 3700: FSQRTq	fsqrt	
	.word 0xbfaa0820  ! 3701: FMOVA	fmovs	%fcc1, %f0, %f31
cpu_intr_1_277:
	setx	0x3f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_278:
	setx	0x3e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 3706: FMOVLE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_279:
	setx	0x3f0235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_280:
	setx	0x3f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 3715: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3aac820  ! 3716: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda00560  ! 3720: FSQRTq	fsqrt	
	.word 0xb7a00520  ! 3722: FSQRTs	fsqrt	
	.word 0xb3abc820  ! 3725: FMOVVC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_281:
	setx	0x3e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_181:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 3734: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 22)
	.word 0xbaac6085  ! 3740: ANDNcc_I	andncc 	%r17, 0x0085, %r29
T1_asi_reg_wr_182:
	mov	0x24, %r14
	.word 0xf8f38e80  ! 3741: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7aa4820  ! 3742: FMOVNE	fmovs	%fcc1, %f0, %f27
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7a00520  ! 3746: FSQRTs	fsqrt	
cpu_intr_1_282:
	setx	0x3e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8a0  ! 3751: FSUBs	fsubs	%f19, %f0, %f31
cpu_intr_1_283:
	setx	0x3e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_284:
	setx	0x3f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 3755: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_285:
	setx	0x3e0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 3757: FMOVRNZ	dis not found

T1_asi_reg_rd_177:
	mov	0xe, %r14
	.word 0xfadb89e0  ! 3758: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_286:
	setx	0x3c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe340000  ! 3761: ORN_R	orn 	%r16, %r0, %r31
	.word 0xb9a4c8c0  ! 3763: FSUBd	fsubd	%f50, %f0, %f28
T1_asi_reg_wr_183:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 3768: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9a94820  ! 3769: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_178:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3776: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_179:
	mov	0x1b, %r14
	.word 0xf2db89e0  ! 3778: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_287:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 3783: MOVcc_I	<illegal instruction>
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 13)
	.word 0xb9a50820  ! 3789: FADDs	fadds	%f20, %f0, %f28
T1_asi_reg_wr_184:
	mov	0x27, %r14
	.word 0xf4f384a0  ! 3790: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_rd_180:
	mov	0x33, %r14
	.word 0xf0db84a0  ! 3792: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_288:
	setx	0x3d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_289:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_181:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3796: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa449c0  ! 3797: FDIVd	fdivd	%f48, %f0, %f62
T1_asi_reg_wr_185:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 3803: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7500000  ! 3805: RDPR_TPC	<illegal instruction>
cpu_intr_1_290:
	setx	0x3d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_291:
	setx	0x3f012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_186:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 3814: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 32)
	.word 0xb13ca001  ! 3820: SRA_I	sra 	%r18, 0x0001, %r24
T1_asi_reg_wr_187:
	mov	0x18, %r14
	.word 0xfef38400  ! 3822: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_292:
	setx	0x3f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_293:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_182:
	mov	0x25, %r14
	.word 0xf8db8400  ! 3837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb72d5000  ! 3841: SLLX_R	sllx	%r21, %r0, %r27
T1_asi_reg_rd_183:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb6858000  ! 3844: ADDcc_R	addcc 	%r22, %r0, %r27
cpu_intr_1_294:
	setx	0x3d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_295:
	setx	0x3c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_296:
	setx	0x3f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_297:
	setx	0x3e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 3854: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_188:
	mov	0x35, %r14
	.word 0xf2f38e80  ! 3855: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbc05c000  ! 3856: ADD_R	add 	%r23, %r0, %r30
	.word 0xb7a81c20  ! 3858: FMOVRGEZ	dis not found

	.word 0xb9a9c820  ! 3860: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb8c4e150  ! 3865: ADDCcc_I	addccc 	%r19, 0x0150, %r28
	.word 0xb7a9c820  ! 3866: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00560  ! 3867: FSQRTq	fsqrt	
	.word 0xb9ab0820  ! 3869: FMOVGU	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba489a0  ! 3873: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xb3a4c9a0  ! 3875: FDIVs	fdivs	%f19, %f0, %f25
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa58840  ! 3879: FADDd	faddd	%f22, %f0, %f62
	.word 0xb5a90820  ! 3881: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_184:
	mov	0x2d, %r14
	.word 0xf4db89e0  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfa50860  ! 3887: FADDq	dis not found

	.word 0xb7a4c8c0  ! 3890: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xbfa80820  ! 3891: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_185:
	mov	0x0, %r14
	.word 0xf8db8400  ! 3892: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a00540  ! 3897: FSQRTd	fsqrt	
	.word 0xb4846155  ! 3898: ADDcc_I	addcc 	%r17, 0x0155, %r26
	.word 0xb034c000  ! 3899: ORN_R	orn 	%r19, %r0, %r24
cpu_intr_1_298:
	setx	0x3f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_189:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 3901: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_299:
	setx	0x3f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_300:
	setx	0x3d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_301:
	setx	0x3e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_186:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 3915: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa00540  ! 3916: FSQRTd	fsqrt	
T1_asi_reg_rd_187:
	mov	0x2e, %r14
	.word 0xf0db8e60  ! 3917: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_rd_188:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a80c20  ! 3920: FMOVRLZ	dis not found

T1_asi_reg_wr_190:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 3922: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_191:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 3926: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_189:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_302:
	setx	0x3f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548a0  ! 3930: FSUBs	fsubs	%f21, %f0, %f30
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a90820  ! 3934: FMOVLEU	fmovs	%fcc1, %f0, %f28
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
	.word 0xbbab0820  ! 3938: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbfabc820  ! 3939: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00540  ! 3943: FSQRTd	fsqrt	
	.word 0xb3a90820  ! 3945: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, d)
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba40860  ! 3952: FADDq	dis not found

cpu_intr_1_303:
	setx	0x3d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_wr_192:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 3956: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_304:
	setx	0x3d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_305:
	setx	0x3c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d4000  ! 3962: SRA_R	sra 	%r21, %r0, %r31
T1_asi_reg_wr_193:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 3964: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_194:
	mov	0xf, %r14
	.word 0xf2f38e80  ! 3970: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_190:
	mov	0x31, %r14
	.word 0xf6db8400  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_191:
	mov	0x3c4, %r14
	.word 0xf2db89e0  ! 3975: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_192:
	mov	0x12, %r14
	.word 0xf2db89e0  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3a4c860  ! 3984: FADDq	dis not found

	.word 0xb3a80820  ! 3986: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_306:
	setx	0x3d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 3992: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_193:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 3993: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_195:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 4000: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb214c000  ! 4003: OR_R	or 	%r19, %r0, %r25
cpu_intr_1_307:
	setx	0x3f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 4009: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_194:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 4012: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_196:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 4016: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_308:
	setx	0x3f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 4023: FMOVRZ	dis not found

	.word 0xbba00020  ! 4024: FMOVs	fmovs	%f0, %f29
	.word 0xbda00560  ! 4025: FSQRTq	fsqrt	
	.word 0xbbab4820  ! 4026: FMOVCC	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7518000  ! 4031: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_wr_197:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 4032: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_309:
	setx	0x3c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_310:
	setx	0x3e0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3aa0820  ! 4037: FMOVA	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda80820  ! 4042: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a48940  ! 4043: FMULd	fmuld	%f18, %f0, %f26
cpu_intr_1_311:
	setx	0x3c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_198:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 4050: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_312:
	setx	0x3f0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4056: FMOVd	fmovd	%f0, %f24
	.word 0xbdab0820  ! 4057: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3a00540  ! 4060: FSQRTd	fsqrt	
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a488e0  ! 4063: FSUBq	dis not found

	.word 0xbfa9c820  ! 4064: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a88820  ! 4065: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa508c0  ! 4067: FSUBd	fsubd	%f20, %f0, %f62
cpu_intr_1_313:
	setx	0x3c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_199:
	mov	0x20, %r14
	.word 0xf0f38e80  ! 4072: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_200:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 4074: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_314:
	setx	0x3d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a81420  ! 4078: FMOVRNZ	dis not found

	.word 0xbba88820  ! 4081: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb2bd6013  ! 4082: XNORcc_I	xnorcc 	%r21, 0x0013, %r25
	.word 0xbfa5c960  ! 4083: FMULq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa50960  ! 4086: FMULq	dis not found

iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a409a0  ! 4089: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xbfaac820  ! 4090: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_201:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4093: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 34)
	.word 0xb095a136  ! 4096: ORcc_I	orcc 	%r22, 0x0136, %r24
cpu_intr_1_315:
	setx	0x410122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_316:
	setx	0x400129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_195:
	mov	0x2b, %r14
	.word 0xf0db8e40  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_196:
	mov	0x16, %r14
	.word 0xfedb89e0  ! 4107: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_317:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 4112: FMOVRZ	dis not found

cpu_intr_1_318:
	setx	0x420203, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_197:
	mov	0x24, %r14
	.word 0xf2db8e40  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_319:
	setx	0x430114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_202:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 4122: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a8c820  ! 4124: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 11)
	.word 0xbda54820  ! 4131: FADDs	fadds	%f21, %f0, %f30
	.word 0xb3a80820  ! 4132: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba549c0  ! 4137: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb5a80c20  ! 4141: FMOVRLZ	dis not found

	.word 0xbda489a0  ! 4143: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xbda84820  ! 4145: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a84820  ! 4147: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_198:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_wr_203:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 4154: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_320:
	setx	0x410219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_321:
	setx	0x430100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58920  ! 4160: FMULs	fmuls	%f22, %f0, %f28
cpu_intr_1_322:
	setx	0x410303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb335c000  ! 4165: SRL_R	srl 	%r23, %r0, %r25
	.word 0xb7a409c0  ! 4166: FDIVd	fdivd	%f16, %f0, %f58
cpu_intr_1_323:
	setx	0x430025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1340000  ! 4177: SRL_R	srl 	%r16, %r0, %r24
cpu_intr_1_324:
	setx	0x420214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54920  ! 4181: FMULs	fmuls	%f21, %f0, %f26
T1_asi_reg_wr_204:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 4182: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_325:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_199:
	mov	0x34, %r14
	.word 0xf6db8e80  ! 4190: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_205:
	mov	0x27, %r14
	.word 0xfcf389e0  ! 4191: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_206:
	mov	0x2f, %r14
	.word 0xf8f389e0  ! 4192: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_326:
	setx	0x42023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 4198: FMOVs	fmovs	%f0, %f25
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_327:
	setx	0x430004, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a508c0  ! 4214: FSUBd	fsubd	%f20, %f0, %f56
T1_asi_reg_wr_207:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 4216: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_328:
	setx	0x41023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_329:
	setx	0x420338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_200:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 25)
	.word 0xbfa00020  ! 4225: FMOVs	fmovs	%f0, %f31
	.word 0xb1a00520  ! 4227: FSQRTs	fsqrt	
	.word 0xbe854000  ! 4229: ADDcc_R	addcc 	%r21, %r0, %r31
	.word 0xb9a588c0  ! 4232: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xbfa448c0  ! 4237: FSUBd	fsubd	%f48, %f0, %f62
cpu_intr_1_330:
	setx	0x400009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81952000  ! 4241: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
T1_asi_reg_rd_201:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 20)
	.word 0xb1a40840  ! 4255: FADDd	faddd	%f16, %f0, %f24
	.word 0xb9abc820  ! 4257: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb7359000  ! 4262: SRLX_R	srlx	%r22, %r0, %r27
cpu_intr_1_331:
	setx	0x40023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_208:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 4265: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_202:
	mov	0x3, %r14
	.word 0xf0db8e60  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_rd_203:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb62ce1dc  ! 4270: ANDN_I	andn 	%r19, 0x01dc, %r27
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa9c820  ! 4277: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_204:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb3a81420  ! 4288: FMOVRNZ	dis not found

iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_332:
	setx	0x400331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8a0  ! 4292: FSUBs	fsubs	%f23, %f0, %f27
T1_asi_reg_wr_209:
	mov	0x1d, %r14
	.word 0xf2f38e60  ! 4295: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_333:
	setx	0x43021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_334:
	setx	0x41031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b44000  ! 4303: SUBCcc_R	orncc 	%r17, %r0, %r24
T1_asi_reg_wr_210:
	mov	0x34, %r14
	.word 0xfef38e60  ! 4309: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbda80420  ! 4310: FMOVRZ	dis not found

	.word 0xbba80820  ! 4316: FMOVN	fmovs	%fcc1, %f0, %f29
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_211:
	mov	0xb, %r14
	.word 0xfef38e40  ! 4322: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_335:
	setx	0x43010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 4327: FMOVLEU	fmovs	%fcc1, %f0, %f27
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_336:
	setx	0x430101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48860  ! 4333: FADDq	dis not found

T1_asi_reg_wr_212:
	mov	0xa, %r14
	.word 0xf8f38e80  ! 4334: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbfaac820  ! 4335: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa98820  ! 4337: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, c)
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a54960  ! 4343: FMULq	dis not found

cpu_intr_1_337:
	setx	0x42020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4354: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_205:
	mov	0x21, %r14
	.word 0xf2db8e40  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7a44840  ! 4358: FADDd	faddd	%f48, %f0, %f58
cpu_intr_1_338:
	setx	0x410226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x430010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a9c820  ! 4365: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a449c0  ! 4366: FDIVd	fdivd	%f48, %f0, %f26
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbfabc820  ! 4370: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb6bde089  ! 4371: XNORcc_I	xnorcc 	%r23, 0x0089, %r27
	.word 0xb3a80420  ! 4372: FMOVRZ	dis not found

cpu_intr_1_340:
	setx	0x430034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0xf, %r14
	.word 0xf4db84a0  ! 4376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb69c0000  ! 4377: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xb9a54960  ! 4378: FMULq	dis not found

iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a48940  ! 4387: FMULd	fmuld	%f18, %f0, %f26
cpu_intr_1_341:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_342:
	setx	0x410025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_343:
	setx	0x42010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_207:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbab48000  ! 4396: SUBCcc_R	orncc 	%r18, %r0, %r29
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_344:
	setx	0x400321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_345:
	setx	0x420226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58820  ! 4402: FADDs	fadds	%f22, %f0, %f29
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_213:
	mov	0x22, %r14
	.word 0xf0f38400  ! 4406: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_346:
	setx	0x42013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_208:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbda58920  ! 4413: FMULs	fmuls	%f22, %f0, %f30
	.word 0xbba81420  ! 4414: FMOVRNZ	dis not found

cpu_intr_1_347:
	setx	0x410300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c9e0  ! 4419: FDIVq	dis not found

	.word 0xb9a9c820  ! 4422: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a94820  ! 4423: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a88820  ! 4424: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbba5c8c0  ! 4425: FSUBd	fsubd	%f54, %f0, %f60
T1_asi_reg_rd_209:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 4430: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_214:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 4433: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_348:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_349:
	setx	0x40000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba254000  ! 4448: SUB_R	sub 	%r21, %r0, %r29
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_215:
	mov	0x2b, %r14
	.word 0xfef38e80  ! 4450: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_216:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 4451: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_217:
	mov	0x23, %r14
	.word 0xf6f389e0  ! 4453: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb63da023  ! 4454: XNOR_I	xnor 	%r22, 0x0023, %r27
	.word 0xb8ac8000  ! 4456: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0xb3a448e0  ! 4457: FSUBq	dis not found

	.word 0xba940000  ! 4458: ORcc_R	orcc 	%r16, %r0, %r29
cpu_intr_1_350:
	setx	0x420029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_218:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 4460: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7ab8820  ! 4466: FMOVPOS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_351:
	setx	0x42010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_219:
	mov	0x13, %r14
	.word 0xfef38e40  ! 4474: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7aa0820  ! 4475: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba489e0  ! 4481: FDIVq	dis not found

	.word 0xb7a589e0  ! 4483: FDIVq	dis not found

	.word 0xbd643801  ! 4484: MOVcc_I	<illegal instruction>
	.word 0xbfa4c940  ! 4486: FMULd	fmuld	%f50, %f0, %f62
	.word 0xbda80820  ! 4492: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_352:
	setx	0x41003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_220:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 4497: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_353:
	setx	0x400032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 3)
	.word 0x8595a182  ! 4506: WRPR_TSTATE_I	wrpr	%r22, 0x0182, %tstate
	.word 0xbba54960  ! 4507: FMULq	dis not found

	.word 0xb3a00560  ! 4514: FSQRTq	fsqrt	
	.word 0xb1a81c20  ! 4517: FMOVRGEZ	dis not found

	.word 0xb350c000  ! 4518: RDPR_TT	<illegal instruction>
	.word 0xb1a80420  ! 4522: FMOVRZ	dis not found

iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba90820  ! 4528: FMOVLEU	fmovs	%fcc1, %f0, %f29
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_rd_210:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 4537: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3520000  ! 4539: RDPR_PIL	<illegal instruction>
T1_asi_reg_rd_211:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 4541: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_212:
	mov	0x35, %r14
	.word 0xf4db8e80  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_354:
	setx	0x40033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_221:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 4549: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb035607c  ! 4551: ORN_I	orn 	%r21, 0x007c, %r24
	.word 0xb5a00520  ! 4552: FSQRTs	fsqrt	
T1_asi_reg_wr_222:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 4554: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a508c0  ! 4555: FSUBd	fsubd	%f20, %f0, %f58
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbda589e0  ! 4559: FDIVq	dis not found

cpu_intr_1_355:
	setx	0x46023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac4c000  ! 4563: ADDCcc_R	addccc 	%r19, %r0, %r29
	.word 0xbf2db001  ! 4564: SLLX_I	sllx	%r22, 0x0001, %r31
cpu_intr_1_356:
	setx	0x45010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_357:
	setx	0x440216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_358:
	setx	0x44031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58960  ! 4573: FMULq	dis not found

	.word 0xb81d2081  ! 4574: XOR_I	xor 	%r20, 0x0081, %r28
	.word 0xbab48000  ! 4575: SUBCcc_R	orncc 	%r18, %r0, %r29
	.word 0xb3a8c820  ! 4576: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_223:
	mov	0xf, %r14
	.word 0xf8f384a0  ! 4579: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 3c)
	.word 0xba3521cf  ! 4584: ORN_I	orn 	%r20, 0x01cf, %r29
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5a00560  ! 4591: FSQRTq	fsqrt	
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
	.word 0xbdaac820  ! 4594: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81c20  ! 4595: FMOVRGEZ	dis not found

	.word 0xb8b40000  ! 4597: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xbba90820  ! 4599: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a548a0  ! 4600: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb9340000  ! 4601: SRL_R	srl 	%r16, %r0, %r28
	.word 0xb6848000  ! 4602: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xb7a408e0  ! 4603: FSUBq	dis not found

	.word 0xb1a588e0  ! 4612: FSUBq	dis not found

iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 6)
	.word 0xbba00560  ! 4615: FSQRTq	fsqrt	
	.word 0xb885e118  ! 4616: ADDcc_I	addcc 	%r23, 0x0118, %r28
	.word 0xb7a8c820  ! 4621: FMOVL	fmovs	%fcc1, %f0, %f27
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda509e0  ! 4630: FDIVq	dis not found

	.word 0xbda00020  ! 4631: FMOVs	fmovs	%f0, %f30
	.word 0xbfa00020  ! 4633: FMOVs	fmovs	%f0, %f31
T1_asi_reg_rd_213:
	mov	0x32, %r14
	.word 0xf8db84a0  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_rd_214:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5a00040  ! 4637: FMOVd	fmovd	%f0, %f26
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 4)
	.word 0xb1a48960  ! 4640: FMULq	dis not found

T1_asi_reg_wr_224:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 4641: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_215:
	mov	0x0, %r14
	.word 0xfedb8e80  ! 4642: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 24)
	.word 0xbe9d0000  ! 4646: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xb5aa4820  ! 4648: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_359:
	setx	0x440131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 4652: FMOVLEU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb60c21dc  ! 4655: AND_I	and 	%r16, 0x01dc, %r27
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_360:
	setx	0x470116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44920  ! 4666: FMULs	fmuls	%f17, %f0, %f28
	.word 0xbfa81420  ! 4667: FMOVRNZ	dis not found

	.word 0xb3a54940  ! 4669: FMULd	fmuld	%f52, %f0, %f56
T1_asi_reg_rd_216:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_217:
	mov	0x33, %r14
	.word 0xf0db8e80  ! 4672: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbda00560  ! 4677: FSQRTq	fsqrt	
T1_asi_reg_wr_225:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 4678: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_361:
	setx	0x470333, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_218:
	mov	0xd, %r14
	.word 0xf0db8e60  ! 4680: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_rd_219:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbfa88820  ! 4685: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a549c0  ! 4686: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb5a40860  ! 4688: FADDq	dis not found

T1_asi_reg_rd_220:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda48860  ! 4691: FADDq	dis not found

iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 16)
	.word 0xb1a80c20  ! 4697: FMOVRLZ	dis not found

	.word 0xb9a58860  ! 4700: FADDq	dis not found

	.word 0xbfa84820  ! 4702: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbb641800  ! 4705: MOVcc_R	<illegal instruction>
	.word 0xb9a54960  ! 4706: FMULq	dis not found

	.word 0xba25216e  ! 4716: SUB_I	sub 	%r20, 0x016e, %r29
	.word 0xbda48960  ! 4718: FMULq	dis not found

	.word 0xbfa00020  ! 4719: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_226:
	mov	0x4, %r14
	.word 0xf4f384a0  ! 4720: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb80c2181  ! 4722: AND_I	and 	%r16, 0x0181, %r28
T1_asi_reg_rd_221:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 4723: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb7a409c0  ! 4725: FDIVd	fdivd	%f16, %f0, %f58
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_362:
	setx	0x450325, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_227:
	mov	0x33, %r14
	.word 0xf4f384a0  ! 4729: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_228:
	mov	0x17, %r14
	.word 0xf6f38400  ! 4730: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 2)
	.word 0xbe3ca16e  ! 4732: XNOR_I	xnor 	%r18, 0x016e, %r31
	.word 0xb9a90820  ! 4734: FMOVLEU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_222:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 4738: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_229:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4739: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda5c8e0  ! 4745: FSUBq	dis not found

cpu_intr_1_363:
	setx	0x47030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_230:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 4753: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba90820  ! 4754: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb1a98820  ! 4756: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a80c20  ! 4757: FMOVRLZ	dis not found

	.word 0xb7a81c20  ! 4760: FMOVRGEZ	dis not found

	.word 0xb5aa8820  ! 4763: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a408c0  ! 4764: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb9a408e0  ! 4766: FSUBq	dis not found

	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_364:
	setx	0x460232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 4775: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbba00040  ! 4779: FMOVd	fmovd	%f0, %f60
	.word 0xb81c4000  ! 4780: XOR_R	xor 	%r17, %r0, %r28
	.word 0xb7a488c0  ! 4781: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xbba81820  ! 4783: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_365:
	setx	0x46021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c820  ! 4787: FADDs	fadds	%f23, %f0, %f30
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_231:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 4790: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_366:
	setx	0x460236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a5c000  ! 4793: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xb3a00540  ! 4794: FSQRTd	fsqrt	
	.word 0xb1a4c840  ! 4796: FADDd	faddd	%f50, %f0, %f24
	.word 0xba2d2103  ! 4798: ANDN_I	andn 	%r20, 0x0103, %r29
cpu_intr_1_367:
	setx	0x460100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a80820  ! 4803: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa4820  ! 4807: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_368:
	setx	0x46032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_232:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 4818: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a8c820  ! 4825: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb1a54820  ! 4827: FADDs	fadds	%f21, %f0, %f24
	.word 0xbd500000  ! 4828: RDPR_TPC	<illegal instruction>
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_369:
	setx	0x470102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09cc000  ! 4834: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xb3a44840  ! 4835: FADDd	faddd	%f48, %f0, %f56
cpu_intr_1_370:
	setx	0x470203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 4837: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a81c20  ! 4844: FMOVRGEZ	dis not found

cpu_intr_1_371:
	setx	0x470037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 27)
	.word 0xbba50840  ! 4853: FADDd	faddd	%f20, %f0, %f60
T1_asi_reg_rd_223:
	mov	0x15, %r14
	.word 0xf2db84a0  ! 4854: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_372:
	setx	0x470334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_373:
	setx	0x470014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb405c000  ! 4859: ADD_R	add 	%r23, %r0, %r26
T1_asi_reg_rd_224:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_374:
	setx	0x470220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 1b)
	.word 0xba24211e  ! 4870: SUB_I	sub 	%r16, 0x011e, %r29
T1_asi_reg_rd_225:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_375:
	setx	0x460218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 4878: FSQRTq	fsqrt	
	.word 0xb7a00540  ! 4886: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_406:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_406), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_233:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 4895: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_407:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_407), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_376:
	setx	0x47000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_377:
	setx	0x460334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_234:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 4902: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_235:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 4903: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbba80c20  ! 4910: FMOVRLZ	dis not found

T1_asi_reg_wr_236:
	mov	0x1a, %r14
	.word 0xfef38e60  ! 4911: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbfa81820  ! 4912: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_378:
	setx	0x44020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_408:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_408), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_409:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_409), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_379:
	setx	0x470318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_237:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 4925: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5a40960  ! 4927: FMULq	dis not found

iob_intr_1_410:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_410), 16, 16)) -> intp(1, 0, 22)
	.word 0xb3a00040  ! 4929: FMOVd	fmovd	%f0, %f56
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb7a00540  ! 4931: FSQRTd	fsqrt	
T1_asi_reg_wr_238:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 4934: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_226:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbda54920  ! 4942: FMULs	fmuls	%f21, %f0, %f30
	.word 0xb9510000  ! 4944: RDPR_TICK	<illegal instruction>
	.word 0xbc1dc000  ! 4945: XOR_R	xor 	%r23, %r0, %r30
cpu_intr_1_380:
	setx	0x470330, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_227:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 4948: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_411:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_411), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_381:
	setx	0x47001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 4953: FSQRTs	fsqrt	
iob_intr_1_412:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_412), 16, 16)) -> intp(1, 0, d)
iob_intr_1_413:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_413), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda84820  ! 4966: FMOVE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_239:
	mov	0x5, %r14
	.word 0xf0f38400  ! 4968: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_382:
	setx	0x44010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 4971: FMOVRGEZ	dis not found

cpu_intr_1_383:
	setx	0x450023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 4975: FSQRTd	fsqrt	
	.word 0xbba80820  ! 4976: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_384:
	setx	0x45010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7dc400  ! 4979: MOVR_R	movre	%r23, %r0, %r29
	.word 0xbe1d0000  ! 4980: XOR_R	xor 	%r20, %r0, %r31
cpu_intr_1_385:
	setx	0x450130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_414:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_414), 16, 16)) -> intp(1, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a80420  ! 4992: FMOVRZ	dis not found

T1_asi_reg_wr_240:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 4993: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfa489e0  ! 4996: FDIVq	dis not found

cpu_intr_1_386:
	setx	0x44023c, %g1, %o0
	ta	T_SEND_THRD_INTR

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

	.xword	0x04cd299d839e991d
	.xword	0x8970cd159a4c502e
	.xword	0xd8cc6619f64c7fbb
	.xword	0x25bec3768a7a4dd3
	.xword	0x6fda334fc6c6f59f
	.xword	0x26c1b5092382bc2a
	.xword	0x26d67271168a9ba4
	.xword	0x13ef626905117c49
	.xword	0x9c2b4b0289b9ac44
	.xword	0x97b32feb9591abbf
	.xword	0xd404c09c80b854da
	.xword	0x3269a65f873f9d03
	.xword	0xf4b05a428185b9fd
	.xword	0x97aa7adf780beb84
	.xword	0x7ff8fa12361295b5
	.xword	0x174c38aebbee0ef8
	.xword	0x30b3c4a4e866adce
	.xword	0xbe7037038b76c79d
	.xword	0xaf21c20dd4723e63
	.xword	0x124346bec7f83d81
	.xword	0x8a15784df6502aed
	.xword	0x468c3a30527a6b42
	.xword	0x321fee4fc81b952e
	.xword	0xbc3ee8bca0eef973
	.xword	0x7ef7487b81ebbc5f
	.xword	0x6d822ffe8bfcca2e
	.xword	0x7051da6bd39a80a1
	.xword	0xbb4de01425838faa
	.xword	0xbfa5da64c9ad4f33
	.xword	0x95eeb720aee4412c
	.xword	0xc8a60fc76b90b017
	.xword	0x871b1983073bc34d
	.xword	0x66ce83b018653d9f
	.xword	0x994e42e2599836f7
	.xword	0x384b6e866bf48595
	.xword	0xba32930db8db0f66
	.xword	0xfca43b3fac546e76
	.xword	0x9ec81f4af44f9fff
	.xword	0xfc4b5007f73690e5
	.xword	0x6598eabfc9ddae2e
	.xword	0xc174b43b9e1dea6d
	.xword	0xc44f3261e2f99674
	.xword	0x2177be40dd41d267
	.xword	0x54ede1b7310a9653
	.xword	0x3630305565db79e3
	.xword	0xea5dd0e5b64d5aed
	.xword	0xe7624ba2ca008acd
	.xword	0xcf2d11935c05c56e
	.xword	0x64906ef7ab8b9e86
	.xword	0x4779b68aee3ea752
	.xword	0x9f62a067e7e4a0c2
	.xword	0x7b078fc9226c3fa1
	.xword	0x14b858b76aca0050
	.xword	0x8bd7edacc6471054
	.xword	0x1848b7d6a7aa169c
	.xword	0x44d24ffe64e0d387
	.xword	0x20cfc541a7cdcd3f
	.xword	0x97269f7b44e1a458
	.xword	0xa8e0caf16a3a8362
	.xword	0x3d54c14341ae9ec1
	.xword	0x25e2cd1ed0e20afc
	.xword	0xcda3a7179006f340
	.xword	0x583cac8871ada351
	.xword	0x47ac50eb72f34fb0
	.xword	0x80b725326a0cb3d5
	.xword	0x4afb336f6ae68f21
	.xword	0xc1b269ad81d4272e
	.xword	0xda9e98e22f145cdc
	.xword	0xa7e592267644d9dc
	.xword	0x1100ef95e7ce05ec
	.xword	0xfe99f5ffcd16549d
	.xword	0x46c85e903a8b0abe
	.xword	0xac28c48d37e8173d
	.xword	0xca1d2efdfd5fa261
	.xword	0x5383425410dc4f9d
	.xword	0x81fbc7ceecd85914
	.xword	0x22adae2d4f47658f
	.xword	0xc929507d916189f6
	.xword	0x13f679645713950c
	.xword	0x02ecd9eb6486fbf9
	.xword	0x4b8fd37198836b42
	.xword	0xfc36a42019db56ec
	.xword	0xab02f661f3e0928f
	.xword	0x7d935b25da67c2b0
	.xword	0xd0459921b384bcc6
	.xword	0x327725d938d0c170
	.xword	0x0e1965e26f89e82e
	.xword	0x5bf40f1d847b2bce
	.xword	0xfa2fb126d4b91a85
	.xword	0xea77b427154b4135
	.xword	0x90beb5a9ba080f83
	.xword	0x4fd0bc4a5d11624d
	.xword	0xd2b40500e40e4e9a
	.xword	0xaa4fbeee7029a88c
	.xword	0xa9b2de64cf0f1f69
	.xword	0xb1fac94d5bedbe76
	.xword	0x5cf2e9c8573cc874
	.xword	0xfad72268ce2dcecd
	.xword	0x1506ee9bbcb72422
	.xword	0x5db6f9d911a111a1
	.xword	0x7a01703de4d9a9ad
	.xword	0x47169d3f1c8158c0
	.xword	0x3f173a1d5625925f
	.xword	0x6d2edd07096712ca
	.xword	0x49c4d0a75caab9ef
	.xword	0xec41c5cb8140f598
	.xword	0x94bf0b699c075336
	.xword	0x67adaab235d5b60f
	.xword	0x696fc817aba68221
	.xword	0xcb0718237dad7df7
	.xword	0x705d24a7d6554bd8
	.xword	0x52d7096a1065d09e
	.xword	0x549194f7ab03b837
	.xword	0x44959971cc9d5ffa
	.xword	0xe41506028cf79a1d
	.xword	0x67f305aae46c30e3
	.xword	0x31f8126662c8bb6e
	.xword	0x835686c0765e82a8
	.xword	0xa57e2b35d9424e4e
	.xword	0x70ed1490fcbfd1f0
	.xword	0x5dd18f31eca900a3
	.xword	0xd9222ab0c7e64df6
	.xword	0xe5e374c87561937c
	.xword	0xce0ee9c8a3f0b758
	.xword	0xdad5da5b84cd679d
	.xword	0xd09d7e3a35550ca3
	.xword	0xa894f1643658c3ef
	.xword	0xbc2c7f01c61887ec
	.xword	0xcd2ca817bd75cb5e
	.xword	0x847417685e7388f7
	.xword	0x9b7d9801faadabad
	.xword	0x7c49cf02e800b4fd
	.xword	0xecd23997b340f074
	.xword	0xee4d020d30bf3d2c
	.xword	0xd3b808ce2d005993
	.xword	0xa02cd15f4d76b118
	.xword	0xc8727e212021bdf6
	.xword	0xa5a71f73dff9aa5f
	.xword	0x5523f52bfb0ccd3b
	.xword	0xb5930301d9ab17e4
	.xword	0x1a830f4d69a044a3
	.xword	0xdaf692db4770fa8d
	.xword	0xd1b88e93207dea23
	.xword	0xc71aa0bb3eb7e874
	.xword	0x4b2d4842ab6bd238
	.xword	0xfee99d4afea35f85
	.xword	0x27a56ce5dfc772da
	.xword	0x9c4f4ab744df55c0
	.xword	0xb79dd4b0eb8d0562
	.xword	0xd9d9c343d160a2de
	.xword	0xd3bc56f38708b3e2
	.xword	0xb7987258edc54cca
	.xword	0xd4959ae6dddccea2
	.xword	0x64a121db55e11bfc
	.xword	0x493e97c566da0621
	.xword	0xd85fb1add15fecff
	.xword	0x633bed802d289437
	.xword	0x51ec97fe9b2e13b1
	.xword	0x3023326246f74258
	.xword	0xbe41c84c598f622a
	.xword	0x4c265b9965789d69
	.xword	0xe8d074aaa8a74fa4
	.xword	0xe208f252409f9382
	.xword	0x34338cff6898add0
	.xword	0x62a3378f2fccbcba
	.xword	0xec7ec2d112a1ab5e
	.xword	0x2aea3d2ccf7ec4df
	.xword	0x32b490a8889f5fa3
	.xword	0x300d05af324f7da8
	.xword	0x813f2efab524ce58
	.xword	0x07d1d4a1e99b767b
	.xword	0xd1cc2f8f4d5b3ea3
	.xword	0xfa951688b80ce34a
	.xword	0x093c01d836099898
	.xword	0xa7229142bef4ccd4
	.xword	0xa22376c7bbcddda2
	.xword	0x143810a4b0ddd152
	.xword	0x696109fd8e9e31e7
	.xword	0x7ce10f28a7bcda8a
	.xword	0xbfe36d9859c7f825
	.xword	0x45ad0fe7aaab0f14
	.xword	0x156d0dbe6022c633
	.xword	0x02ac03b068716836
	.xword	0x43a104d166b16a71
	.xword	0xa71209e7b12be366
	.xword	0xe41d502015e4144a
	.xword	0x2da95ec837c018ce
	.xword	0x55f7a2dc924118b3
	.xword	0x09a932ba425afedc
	.xword	0x34819cc7a1c222c7
	.xword	0x7a84e1cac13b2c5a
	.xword	0x29c6887ef800f967
	.xword	0x07546b67fa51b5d3
	.xword	0x049bcdbe85c581e0
	.xword	0x79eb5e8fd0740f8e
	.xword	0x98928efbea48760d
	.xword	0x0c16759069def5ed
	.xword	0x8405653c9e689849
	.xword	0x088b69189ffbed51
	.xword	0xbad9f5dd9577f272
	.xword	0x19ea1251bf32705f
	.xword	0x13e11907d8017d0c
	.xword	0xe7cdbfd2ae9d6887
	.xword	0x8d40cd73f0ac37dc
	.xword	0x1786353a0492cf42
	.xword	0xf8970a2862cf0af1
	.xword	0xe6e1f92d2961fa67
	.xword	0x03ec4eb797a4c5b8
	.xword	0xeaceffe9661ab58e
	.xword	0x0f9e209cc483192b
	.xword	0x9ea28b03d96f996d
	.xword	0x97fb52480c3c1a63
	.xword	0x53bae63043e59bdb
	.xword	0xee4806f891d956cf
	.xword	0x707afc2c67a7c03b
	.xword	0x32fe05d24ded7772
	.xword	0xac76dd3c70dccc0c
	.xword	0x9e1cdbbdcb8d213f
	.xword	0x9c887fab53db098f
	.xword	0xffba67eb34a7bc4e
	.xword	0x04835e8894621d5b
	.xword	0xa0b9d5e31ff6015b
	.xword	0x0dc511d9ceb35082
	.xword	0x9ad5e84bad69d9b3
	.xword	0xd7caea2a75af1024
	.xword	0xd1ece70448e0b1e1
	.xword	0x7ee8f4dfa708586c
	.xword	0x37d77ab126ebf59e
	.xword	0x8cc9802a72b5c4a9
	.xword	0x0deac422b3074fc0
	.xword	0xdc01ef40ab2a8706
	.xword	0xf88ffaca5d878c5d
	.xword	0xfead46f6048466c0
	.xword	0x733229ca54daecb8
	.xword	0x1ad3382a54d98bf9
	.xword	0x1aeb7689ed06fa5c
	.xword	0x8eff90f866293092
	.xword	0x5528bb6871ed54a0
	.xword	0xa770637e47254de0
	.xword	0x44b934eaaab830e6
	.xword	0x1c5bdc1cc2c6c07c
	.xword	0xe6be4f27c3f65030
	.xword	0x9c94ffbaebe48872
	.xword	0x467ad24d6e9bcded
	.xword	0x5057f0374f222845
	.xword	0x88795ba7133c88b5
	.xword	0x8a44f995f961f448
	.xword	0xd72b7a4b76cc1217
	.xword	0x0a1a370f5d8f919c
	.xword	0x3fb393d96817d4b7
	.xword	0x76bd0bb6ebf2fcef
	.xword	0x9655037ea8751a1b
	.xword	0xda5f4d1a6d5d27fc
	.xword	0xc26422933bd4646b
	.xword	0x3fc2d57d44e8e749
	.xword	0xbcb52a7a05f37503
	.align 0x2000
	.data
data_start_1:

	.xword	0x07f6611b7519b1b1
	.xword	0x29ab0474d0bda9e9
	.xword	0xcedd758639ed3ed5
	.xword	0x51372e4fd4594854
	.xword	0x3d57456b1260cb4f
	.xword	0x4ddf0586637a65c6
	.xword	0x84b7e62658f8e823
	.xword	0xf296acff347f67f0
	.xword	0xd8c7c2fdea19a13d
	.xword	0x4bb054b084857ffa
	.xword	0x87ceaa8af92d3fdf
	.xword	0xc4c327b96adf359f
	.xword	0x76d22a0cfb68d9dc
	.xword	0x1eb54f3c87f78501
	.xword	0x380adf58dee5b8c2
	.xword	0x5ccdc171824c1b12
	.xword	0x6938e33525adc7fd
	.xword	0x4881c7ef1e2f42bc
	.xword	0x7e63386b5ef919c0
	.xword	0x93bf8fe84aa7c9c4
	.xword	0x6de52482d43861a0
	.xword	0xd1867019c2511742
	.xword	0xfeec7a3b2e409893
	.xword	0x889b1bbea9520a35
	.xword	0x2951d2088ce5d65f
	.xword	0xd9cd65f982166a06
	.xword	0xbcff263f08563a23
	.xword	0x655cf68e5c413a2e
	.xword	0x4783fda7d3551a6b
	.xword	0xe150299bea9fc9a3
	.xword	0xc6b78b4d8993fbfa
	.xword	0x287b8c7e94f89165
	.xword	0x2b7e2dd23731cd70
	.xword	0x708697b70eacd842
	.xword	0xd01d9aed0c4fa249
	.xword	0xe276f6f60f40991a
	.xword	0x89ad67e3b15b9488
	.xword	0xc5e258d5ee593b06
	.xword	0xb528fc1f2c5d6bbb
	.xword	0x0e2948bbfbea490b
	.xword	0xd153b4c99b5f1088
	.xword	0x72d9f79d3dad09f7
	.xword	0x8b633d9ef6ffb2da
	.xword	0xa9a7e91aa5891667
	.xword	0x1e3ecef44720302f
	.xword	0xebc39253ab547deb
	.xword	0x7f82ac4c05fff290
	.xword	0x7160d7c34226cb9d
	.xword	0x490084f289ac0cf8
	.xword	0x6eab5b965ec23790
	.xword	0x5ca3dbd7597ffaf4
	.xword	0x17215546ee12ac35
	.xword	0x0b85adca14a8e8af
	.xword	0x22b15782b3dab91b
	.xword	0x4556137190fd89c2
	.xword	0xfc74ee8e0841732f
	.xword	0xd7f950307810fab3
	.xword	0x8b1d5df99de28cce
	.xword	0xb2f842d876b36c1b
	.xword	0x85d96350dd280344
	.xword	0xbb7cc65ad49a22a7
	.xword	0xc4b93f3d9b0024ec
	.xword	0x1612142727b35560
	.xword	0x6eb311d9f55c9fef
	.xword	0x76d1ad20744c7077
	.xword	0xb32d22d7bd014bf1
	.xword	0x51aaad2cc80baaee
	.xword	0x08f6f8fa147904c1
	.xword	0x3d4502a01d149615
	.xword	0x153869334fac8db9
	.xword	0xe0682fa72c71138d
	.xword	0x258aa5608a240b5d
	.xword	0x013a066a1867f221
	.xword	0xe836907bea3dc2f0
	.xword	0x49b2080f2f0d4a41
	.xword	0x9e5ac26ee9b74163
	.xword	0x6035a37bdc5cb7d4
	.xword	0x59937e5438c51b2e
	.xword	0x233debf2c18ecc47
	.xword	0xd89af55b36b255e3
	.xword	0x7105917b621279ce
	.xword	0x3fb521e3e2364062
	.xword	0x5e12f0c403e7118d
	.xword	0x0f7319fd276a92a4
	.xword	0x87ed9c08d25958d7
	.xword	0xd9c6ff9824094b38
	.xword	0xae8f1b4f55056f7b
	.xword	0xf942310cab6e00cf
	.xword	0x43c09b559ad85865
	.xword	0x2c2ddf9896aed030
	.xword	0x0c333b57bdf85b9a
	.xword	0x9b5eb9744217b7fe
	.xword	0x0b70c06ba3128d6b
	.xword	0x18cac1f3b45c464f
	.xword	0x364dfa2d457a0002
	.xword	0xfe8f4cf5df67041b
	.xword	0x010f4369c518ce58
	.xword	0xf6b7969298f73154
	.xword	0xe57b6dcc9baa4685
	.xword	0xcfb51d509f2c19e8
	.xword	0x7ec7e16e301f3949
	.xword	0xc2a67c7c898fa4b5
	.xword	0xa5430ea4f6783ff1
	.xword	0x629104cab4b56e9f
	.xword	0xb7527ee310e1d91f
	.xword	0xb4b68eb8c615d7ec
	.xword	0xabacf9f6b819c755
	.xword	0x43b237922bf8379b
	.xword	0x02b540caab6c037a
	.xword	0xb78ae03a5384dd7c
	.xword	0x1998a0f46a818ed3
	.xword	0x0103602c24a2fce7
	.xword	0x565da35943ffa355
	.xword	0x03f3a6f01d969d72
	.xword	0xd8cbf7ddde51aded
	.xword	0x98ef102389c603eb
	.xword	0x2ff9c7fe15a2bcfa
	.xword	0x03cfbc01b9fd7d9a
	.xword	0x544bf32d58ca01ee
	.xword	0x75a6f76e5df2ceba
	.xword	0x4b82b193a261f179
	.xword	0xe18d86fe5a2b22a9
	.xword	0x8c99662a55160d23
	.xword	0xc4896a0b0846d43f
	.xword	0xc2cfb668a75b662d
	.xword	0xb25580824a9f06f0
	.xword	0x59fff8de120a96b1
	.xword	0x36337b3a3b39d00d
	.xword	0xb9c7a666a4f40d04
	.xword	0x6f7acb1587b09575
	.xword	0x0ba5bbc81e1aea7e
	.xword	0x1aa08c6a726fcb36
	.xword	0x72f5e9e22e89b217
	.xword	0x03a689d9ba692a47
	.xword	0x2946e21bf559e45d
	.xword	0x1384c4a887f0fe35
	.xword	0x568890bafe554754
	.xword	0x9ebff5221ef845cc
	.xword	0x50f609eb69b6e890
	.xword	0xf7fbcba818ddf6aa
	.xword	0x289407aeadf6e526
	.xword	0xcdd8d29072d93b95
	.xword	0x99c21c087c20506a
	.xword	0xe25877f8f380f139
	.xword	0x05a0948a209252d8
	.xword	0x79501d584ead0b8a
	.xword	0x7e45768fe614dfab
	.xword	0x15e70abbb4adfb3a
	.xword	0x3358735249d20f9a
	.xword	0xb7b3518fd73cdc14
	.xword	0x2f7ebdf518db09e0
	.xword	0x2f84306d5d8b06c0
	.xword	0xac12fdb242b38514
	.xword	0x0736b131ce07a502
	.xword	0x73fc2ece3d237da2
	.xword	0x51b5792db696d27f
	.xword	0x5e8787a52cdcde00
	.xword	0x894f76c4a0a685f4
	.xword	0x39286df72c5072df
	.xword	0x906b6416718ac022
	.xword	0x513c4e05502913d8
	.xword	0x502e93144854858f
	.xword	0xf2228bd82d4eaa29
	.xword	0xaa465385d9c9c47f
	.xword	0x5fc0dd55821e568b
	.xword	0x4fa88631ad240b99
	.xword	0x1b2cd39ef742ae34
	.xword	0x00f5ace181f45905
	.xword	0x02546a351d4dcc81
	.xword	0x5d4bcd52e806bf5c
	.xword	0x5b6ecdf934c60523
	.xword	0x316d4c66007c343b
	.xword	0xda16cbd693f16b98
	.xword	0xf11b58134d85ef1b
	.xword	0x5c76a8f9a2387ba0
	.xword	0x72a970c3edb42c69
	.xword	0x985e8b848d4d1546
	.xword	0x4ab29e8dac9e6e6e
	.xword	0xdc464134a7553490
	.xword	0x4da6a0ba53379334
	.xword	0xe8cae3f68097e4bf
	.xword	0x7918a2e0b915dc00
	.xword	0x75290bdf268e7323
	.xword	0x47a241ca831e3ac6
	.xword	0x707f2c03caaded20
	.xword	0x2ac790542bb1e581
	.xword	0x1bb629b8233f94e6
	.xword	0xca4e2a2f6709e6db
	.xword	0x46f9ed0d3019431b
	.xword	0xb7cb995a1681dce7
	.xword	0x9e48f94a675981d7
	.xword	0xa4579d965a00bd9c
	.xword	0x26bdf8af60c120ed
	.xword	0xe2697124c17b1952
	.xword	0x4eee4bacfe0e44a9
	.xword	0x7495f930e7cf60c8
	.xword	0x6fe65cb92be902eb
	.xword	0xadf3dc039be05b77
	.xword	0x6563037a01921373
	.xword	0xb2223300b44ebd8e
	.xword	0x1d7f76e04f92b773
	.xword	0xde536f26c7a7c481
	.xword	0x47843fd31d457cbd
	.xword	0x21b1220a250310a1
	.xword	0x01107cc9a96037c4
	.xword	0x8a6072c26c553b4a
	.xword	0x5cdc4bcd92d0b209
	.xword	0xcba08a070fc21770
	.xword	0x00af30d2a1c1ca44
	.xword	0xf8d7bf885e53f56d
	.xword	0xefb86cb44e43092a
	.xword	0x732d7cf4b1bf044f
	.xword	0x002de3d0f6450681
	.xword	0x6f822d9dd8baeb36
	.xword	0x7aab1e0a82d87bb9
	.xword	0x85a6d272cca04015
	.xword	0xe3920cdf4402ebbe
	.xword	0xbe5f060d2dc5cc99
	.xword	0x145037fc5c509ef6
	.xword	0xaad355ed1853b644
	.xword	0xcbb7c0441c7e2a0a
	.xword	0xac99c9adfe5d6a86
	.xword	0x4019eac3a4848eb0
	.xword	0xe5ec92da79829207
	.xword	0xb5a6363184f584e8
	.xword	0x2603406b92a73173
	.xword	0x7deca023272052fa
	.xword	0x4483d03452797f2a
	.xword	0x9dc8c809438f9de0
	.xword	0x48fbd80ad2732554
	.xword	0x11fa54ffe6d96ab8
	.xword	0x6e3a01da4f91f2a1
	.xword	0x94b861b0e97be330
	.xword	0xb682790268dbb8b4
	.xword	0x1a16524dcb985d76
	.xword	0x77a07a669299f7a0
	.xword	0x75bea404b0b2abd2
	.xword	0x04854f8c5f53879d
	.xword	0x9c8d12f19524179d
	.xword	0x26cb714a8dd10690
	.xword	0x5226923d7e762932
	.xword	0x8c72a0b5c33aa512
	.xword	0xd422568cd1c59ac6
	.xword	0x169577526a4aac42
	.xword	0x83a881d0aa2ecd71
	.xword	0x749f6c7324a33f58
	.xword	0xf72890eb981774e5
	.xword	0x0bfbcf511dd0894c
	.xword	0x6096006a669458e8
	.xword	0x5ac2fd3f09ecd06a
	.xword	0x781766f392358454
	.xword	0xf500a048bdd70a6b
	.xword	0x428ce0e17675b921
	.xword	0x3a81d20fab641029
	.xword	0xe365f51cfc6aed32
	.xword	0xccb1981748201450
	.align 0x4000
	.data
data_start_2:

	.xword	0x4dcf90d04732cc87
	.xword	0x599649c3eba0a7c5
	.xword	0xab3c95c9c11ea67f
	.xword	0xc521a770596f58ab
	.xword	0x0f08374a0795f99c
	.xword	0x8c2d21c80407f380
	.xword	0xb25ea39c2f400009
	.xword	0x2520cb77a4dadc4d
	.xword	0x3ad7da8b18dda55e
	.xword	0x04c767a945182f90
	.xword	0x3f273f98dff5f172
	.xword	0x9cf6f3d4f4af6ace
	.xword	0xb586dc40bc8e5e92
	.xword	0xeb2a477d0aefeb15
	.xword	0x0e2fd52f0b93d3e8
	.xword	0x64b27148e04ffc91
	.xword	0xc1c88391cf2beadd
	.xword	0x2b912b1b6ddfad80
	.xword	0x97bfca4862857aa1
	.xword	0xfa47e9b06adbb006
	.xword	0x7002f6a16b17a738
	.xword	0x4df35d3c1bfa4616
	.xword	0xc8defb6c16ddd972
	.xword	0xd280ac8f557dff89
	.xword	0x044584b748e95b53
	.xword	0x73abaf48d5536f43
	.xword	0x68d0b53d1b8e3f32
	.xword	0x015e098fb479c4cc
	.xword	0xb84db0890b007a24
	.xword	0xa3484dc8693fc740
	.xword	0x86ace90ae861ddde
	.xword	0x22344720f0bcbe20
	.xword	0x39c239858cb680fc
	.xword	0x5158dec5b91ed0fb
	.xword	0x753831cb8b7779a2
	.xword	0xa488fc2245150413
	.xword	0x95dbdb3aa2d1f52c
	.xword	0x2aacb79b6b8bfd08
	.xword	0x7a23ce1ca36cfb91
	.xword	0xf476a9da6f34fad0
	.xword	0x18dc1cab167dfe58
	.xword	0xfb40ad67e92179b8
	.xword	0x9cec5f2623b76fd3
	.xword	0x6deeb9ef48b91a6b
	.xword	0x6cd87dd554724098
	.xword	0x09457eac60952849
	.xword	0xeb66d79ca74b2437
	.xword	0x829affafa651c2ff
	.xword	0xe89811ff87b50cfd
	.xword	0x12e3765e3d183150
	.xword	0x560d975e01c96c22
	.xword	0xf5afe6f222522374
	.xword	0x1f7d4626c43dc25a
	.xword	0xe3d9354d4b078892
	.xword	0x824c49145e6668cf
	.xword	0xe515e1b8ece40307
	.xword	0xa29923cad4cd42b0
	.xword	0x89aab54a400d2eef
	.xword	0xc7f1be7b674c3d71
	.xword	0xdae34cfbba8ef275
	.xword	0xb321da1fbc720833
	.xword	0xc00dcaf37dc040df
	.xword	0xb32068ec52fe9146
	.xword	0x770d58036d4244bb
	.xword	0x9a31a8f8ee30f607
	.xword	0x6487d8dbab09e669
	.xword	0x251c4b7f623090a3
	.xword	0xf63247365a3f91b0
	.xword	0x5ff157569b9b9c3b
	.xword	0x7f18ab39e74175f6
	.xword	0x1c2bb90da3129daf
	.xword	0xc7819837c83cb8f6
	.xword	0x500cc21f7ef08d55
	.xword	0xdb31a2cf9873c08a
	.xword	0x118e685d99680163
	.xword	0x85a75f563cdb0add
	.xword	0xf514f6a6e3da842f
	.xword	0x0c03cd9c5ea773a6
	.xword	0x757223e8571bbf92
	.xword	0xdb090d1405da9f53
	.xword	0x231135baf8eb593c
	.xword	0xb76aa9be070e1035
	.xword	0x42da04e5f6606ce9
	.xword	0x407dd23c8679e339
	.xword	0x761595f410525d39
	.xword	0x349da1c82f411fa2
	.xword	0x78e4d031e518c591
	.xword	0xc16cf10ee822560b
	.xword	0xb738f160ce9a11fe
	.xword	0x238d60ac99f37782
	.xword	0x5116b5c7f66efe44
	.xword	0x621f74b00245d72e
	.xword	0x69870c89956c9826
	.xword	0x1860dd45468fa995
	.xword	0x6826ee02c9b015f2
	.xword	0x4b3d3e02a95372ba
	.xword	0xe033c689086cf2c6
	.xword	0x41640edfdd18b37e
	.xword	0xf5c0f7d67c2e0782
	.xword	0xbd7b9e55d2cae536
	.xword	0x768164d94ea70928
	.xword	0x7d2e00abe1aa8cb4
	.xword	0xa19e540cfb21901b
	.xword	0xd690922293ad4a89
	.xword	0x49a2d78b90a08167
	.xword	0x8eb3a7ed79d99251
	.xword	0x8926a313c7211403
	.xword	0x467e0a32f2fa135d
	.xword	0x8f993cacf8c89f98
	.xword	0x4c5bb0ddc7c435b5
	.xword	0xeb117db08627135e
	.xword	0xd329b4e0c61f3c22
	.xword	0xf52e7d64db5b3a5f
	.xword	0x4e6f184086811d8e
	.xword	0x54441c04fe884c83
	.xword	0xad1d102ee1981803
	.xword	0x2272f86770b58fdd
	.xword	0x53f6ba436140035a
	.xword	0xd6fe54f0ddce6d0f
	.xword	0x8184ac01c8f78abb
	.xword	0x06ff1268f2f14c5e
	.xword	0x05176512c0554016
	.xword	0x1937b299aca5e959
	.xword	0xbef8e6fa102c7d83
	.xword	0xc1b5b5e8405a0c12
	.xword	0x46d700bfbe3925f8
	.xword	0x42b09dc0f4f6064c
	.xword	0xc97b1445d86ef2dc
	.xword	0x4510672481b08545
	.xword	0x6187f95078afd1ab
	.xword	0x85894678a24cab23
	.xword	0xed5c9be731f1a77c
	.xword	0x71502ddd41ecbe0e
	.xword	0x1b27ffebc5304b4b
	.xword	0x8d5af0a8cc83bb3d
	.xword	0x8be50aa7d328245d
	.xword	0x02c23dc8dddea068
	.xword	0x71e8523d110718a7
	.xword	0x866ddf7381a63dad
	.xword	0xe3b0e0f767915ca6
	.xword	0xf1e430daa771c77c
	.xword	0xfb5dfb0a79e35ee3
	.xword	0x74089038124a5195
	.xword	0x3154fda735e968e3
	.xword	0x31406dfe20890985
	.xword	0xfbaefef9e695ac4f
	.xword	0x402add0a32bfacbd
	.xword	0x316129e3899378c9
	.xword	0xc91473865189547c
	.xword	0x05a856210b9884a9
	.xword	0x016a22fe4189d571
	.xword	0x5d1f5eff0ec4c8fd
	.xword	0xcc0edb39b9eefaa0
	.xword	0x759c680337827e02
	.xword	0x03436856abc8ed42
	.xword	0x5252702fb67bf7d1
	.xword	0x6a4ddeaba80f4afe
	.xword	0x36c86c8ceaf11d23
	.xword	0x228c26caeabac321
	.xword	0x2944d2278272684b
	.xword	0x547db7f6a24a12a2
	.xword	0xf78563c1523302c1
	.xword	0x1bb4b04e3d252ed2
	.xword	0x0c6df950c0c56f23
	.xword	0x336e1daf71349d0d
	.xword	0x87b349dad278b9fb
	.xword	0x57557faea4a2fe87
	.xword	0x3a82191d0a663d0c
	.xword	0xb04f19b92d226cc0
	.xword	0x7820dcb95361bebd
	.xword	0x424b4b43d852fa29
	.xword	0xb63dcb3a34b788ea
	.xword	0x8faebcfcd2310b1b
	.xword	0x12e5c351a040bc1d
	.xword	0xf0610204f4ac6504
	.xword	0x4933b181e10aef59
	.xword	0xe5b6fc6384729b5e
	.xword	0x97ed8939ce030ded
	.xword	0xabd80f009e13cd11
	.xword	0x4f1a423ff1a5b0a0
	.xword	0xba510d0439f37f79
	.xword	0x1de15aba07e3d02c
	.xword	0x65ad37f7067cada8
	.xword	0x02bbf4de054abbd2
	.xword	0x58c35a93690db866
	.xword	0x09e2fcd7a698d952
	.xword	0xf0de131f9fc09039
	.xword	0x3e078be747ec4f88
	.xword	0x32f8f0cc7f815f6b
	.xword	0x07a48c98c43f3769
	.xword	0x68024cf2e534b3e0
	.xword	0x0ca948004d594451
	.xword	0xfd3f7fad405d6393
	.xword	0x828dff872c8fe103
	.xword	0x4f61fd05a97c8953
	.xword	0xe3008610cfb10677
	.xword	0x66dad80d7316b353
	.xword	0xb8451c8d9280ea6c
	.xword	0x45bc963dba9ecad8
	.xword	0x416b93897933b506
	.xword	0xcc80560e21b31ebb
	.xword	0x1701a7530f8aeb7b
	.xword	0xeed541ca0a40346d
	.xword	0xb36ecbbb92b7fd4f
	.xword	0x331b931ee04569a3
	.xword	0x3c9c2454befe7719
	.xword	0xb984538a663f160e
	.xword	0x7559a9fb6b89e8ea
	.xword	0x2ce6d8a2e51d48f3
	.xword	0x308964a9882b1fb3
	.xword	0xe83cfc6a25c71f44
	.xword	0x53f10d886e4311d2
	.xword	0x6f4e35dc95bb7909
	.xword	0xa042e15758335872
	.xword	0x2ed6c7f16a206bfc
	.xword	0x2a513b60d46c4791
	.xword	0x39ea95773c531bc2
	.xword	0x1862d0b2be78f7b3
	.xword	0x9596fc3cd922a8a1
	.xword	0x4723ce87cdf3c22f
	.xword	0x04f8cec74606894a
	.xword	0xc0535ce5f9cdc73e
	.xword	0x715e2ba407571294
	.xword	0xab72c518a5aeceaa
	.xword	0x9783932dd603748d
	.xword	0xf2e6c744df02314a
	.xword	0x4f54743e7f24f268
	.xword	0x5f0badf041ab00c2
	.xword	0x241912f1da889a84
	.xword	0xcd99b17f61a95937
	.xword	0x2c03280805d7a3ae
	.xword	0x9f9cd06fde468d93
	.xword	0x956fc563b0eed76f
	.xword	0xb03f24bb80c29c25
	.xword	0x6b79a0b1ffe1de04
	.xword	0x77191217893f2a7e
	.xword	0xf28859ec1eab9a99
	.xword	0xd61a5b67d9aee26c
	.xword	0xbbb8f6958dcac1fb
	.xword	0xe00ee1d03e57f651
	.xword	0xa11d3c636fc0da07
	.xword	0x19f8a60e39593099
	.xword	0xcb2672da926624bc
	.xword	0x05570202b5995e1a
	.xword	0x548acc343330b8b2
	.xword	0xd65b8c7ed2aaf262
	.xword	0xada74a8e93278630
	.xword	0xb84d32b8b2f40910
	.xword	0x8e15eca3d8cc56e9
	.xword	0xb7809e3312f692bd
	.xword	0x0c60ad7d43bd55ad
	.xword	0x3377803387691444
	.xword	0x42d5c620bf0f0202
	.xword	0xa8d09afb66b68559
	.xword	0xd4a1d0e849a0de51
	.xword	0x79b7cca0f0cc3b19
	.align 0x8000
	.data
data_start_3:

	.xword	0x64804a5fe0196d39
	.xword	0x9ddbf0a1e1a04f60
	.xword	0xc1f29b70d3efb21c
	.xword	0xcd6e063cc9b48329
	.xword	0x5d020c33364a3323
	.xword	0x428fa75e7e27613c
	.xword	0x87ce36107a0b53e0
	.xword	0xdb61bd7d12684091
	.xword	0xe3926b4228a17c10
	.xword	0xcc51a33b9bece212
	.xword	0x98610845c3fe862f
	.xword	0x6f5ed53806cf2da5
	.xword	0xe0ded273e06d4f73
	.xword	0x362e75319dc0771f
	.xword	0x1d27b7bbe48e7e65
	.xword	0x05045c866d48cd27
	.xword	0xe98f29cf3b98eea7
	.xword	0x97503e2815335d56
	.xword	0xed4e3aa6fc52e8c6
	.xword	0x67a97255eac8aafb
	.xword	0xf2d6de32d2a8ec8e
	.xword	0x9d669e48622ddde3
	.xword	0xa30255a03e187f93
	.xword	0x9ce939ecd7d7fc71
	.xword	0x5eda21353053c8bf
	.xword	0xba19b2c2fbe3c9e8
	.xword	0xafd4262e0b0c03d1
	.xword	0x563c5e335aaa3dd9
	.xword	0xbf9c96b0ed417e55
	.xword	0x15e69e9cc4a65fd6
	.xword	0xbc64e0abb7296395
	.xword	0x6378aee80d6dd7f0
	.xword	0xa3f8ae9a3a6a9382
	.xword	0x8f31f3cf0745a00d
	.xword	0x245538b7d250ad5f
	.xword	0xbd4826e3f55eaa49
	.xword	0xba2328d7d0912646
	.xword	0x50305bd9cd9ccbe8
	.xword	0x023c5f06bf73873b
	.xword	0x4cab8e1740e21dde
	.xword	0xedc176b1932eb5ef
	.xword	0x1d40b553a3d4bd0a
	.xword	0x7c5ffe7f1aec0aec
	.xword	0x13721d59c68c6efe
	.xword	0xb33b6d3b351caea1
	.xword	0x841b22db4df810ba
	.xword	0x85a7869a577a60ce
	.xword	0x6253b58382b23874
	.xword	0x030184dc4a129771
	.xword	0x9cf04a1fce3e2b02
	.xword	0x4a535a6c5743fcd7
	.xword	0xe4843b06013cb3c5
	.xword	0x8cb5d4b9ebbf865b
	.xword	0x4a01fd1d255699a8
	.xword	0x9dcf35e4f4ac9f02
	.xword	0x5fa5844afe885b27
	.xword	0x92b2e705789284d6
	.xword	0xf030242bd947c01c
	.xword	0x8176b46312f1ac7f
	.xword	0xa8fd298347fba7a4
	.xword	0x36a2814d2a62d954
	.xword	0x37caefc65b836333
	.xword	0x2e1a20fb8706ad0b
	.xword	0x79dff71fedd9f9c5
	.xword	0x1c8c7301399912ec
	.xword	0x29c4a6cc082c8fdd
	.xword	0x62d43569a8cb11b0
	.xword	0x19e0943e987fdf89
	.xword	0x51411a0c921777ff
	.xword	0x78163468980d3ba2
	.xword	0xf59c5dad4ee98dd0
	.xword	0x8ca7e08e51fa19aa
	.xword	0x34a1ac254a1ed5fd
	.xword	0x5b2c4881dcfc00ca
	.xword	0x1c4d39a7e2303e84
	.xword	0xa230ef0c75a7b9c6
	.xword	0xc75724fe6699276e
	.xword	0x9e3fbce6498aa016
	.xword	0x997984a891f85d6c
	.xword	0x1eb5de2177a0cca9
	.xword	0x90c371659a9f6156
	.xword	0xd9afbf6adac0dbb4
	.xword	0x090e30d347173682
	.xword	0xc510cf84e85149c6
	.xword	0x26deef8f157458b3
	.xword	0x5bd371e2ecd6df47
	.xword	0xcc80bef6bdffbfed
	.xword	0x0998c5f3221166d7
	.xword	0x71c61911c8ac8a76
	.xword	0xff703f883dff89e4
	.xword	0xb1b04ebb0c31b534
	.xword	0x480db33eec07055c
	.xword	0x57f03583da35b1f3
	.xword	0xa1f9e1d5654cf3c4
	.xword	0xddddc530b6de990a
	.xword	0xc93b621eafbd1162
	.xword	0x04a4acaeef6036f4
	.xword	0xd31c05002e2adc34
	.xword	0xe5dac3cd3b0a77c3
	.xword	0x756342f1e8d01a39
	.xword	0xddd8e7e9ab97c5e9
	.xword	0x72118adc7bb91cc7
	.xword	0x62a66a22606fae4d
	.xword	0x01962301146bdc00
	.xword	0x789f95a6d9fc5e92
	.xword	0xa1cfe5bb74db5bdb
	.xword	0x13c22e9df0b7c1e5
	.xword	0x666e00f47885e5f2
	.xword	0xb08e5565bc6e25c4
	.xword	0xa72dde0f97380e98
	.xword	0xfd393cd0ebc7acee
	.xword	0x659a86747c0d26c2
	.xword	0xe698dca5e8733175
	.xword	0x06e2f654a7cc3788
	.xword	0xbbae6f3669d3727d
	.xword	0xc3a3349d27be0e62
	.xword	0xf50c5a862cbb54e7
	.xword	0xaecbb443c53510c5
	.xword	0x7dc9d37ef04ed981
	.xword	0x927ab0363d3c247d
	.xword	0xf948585db76dccba
	.xword	0x0fa0c39d724eb144
	.xword	0x8484c818f9c6dc8a
	.xword	0xdb06aa56186cdd88
	.xword	0xfdd918f6cc4298c4
	.xword	0x8162353f9d9f2470
	.xword	0x6332632eae6537d6
	.xword	0xc404ad6f78210096
	.xword	0x21d75a886c2de357
	.xword	0x4a647b9b38dd5319
	.xword	0xb7357a0b9718af74
	.xword	0x3e1907fbded57987
	.xword	0x5a6e6bc5e84cfd47
	.xword	0x6120bccb6a9b62b0
	.xword	0xfcfc2ea7a962b3c3
	.xword	0x7cbd7a007ae4a373
	.xword	0xcf44735bf0d97b74
	.xword	0xe0d1146de9994267
	.xword	0x34e5a094850d98a3
	.xword	0x33b2f89b4e66f453
	.xword	0x790f1fa2ea103dc9
	.xword	0x1e81288266d7e83b
	.xword	0xe33994044cc40f70
	.xword	0x37cc98548e45dcdc
	.xword	0x2f005a05511b5e5e
	.xword	0x436e42d14a5e5307
	.xword	0x983d197077226a93
	.xword	0x636a387ede93f1cb
	.xword	0xec2ad657d9c0c60c
	.xword	0x486fbdc444a0cb86
	.xword	0xcb47dbcd80a51d9b
	.xword	0xc44ba52b1c7cefb0
	.xword	0x573d454f55629dca
	.xword	0xcebbbc9320a8c103
	.xword	0x1da16de417709225
	.xword	0xce2d0cf209540e0f
	.xword	0xc2d53b71728d9170
	.xword	0x85e6f8e59079ad76
	.xword	0x354aaaab1d80b92f
	.xword	0x42498021b1ef11aa
	.xword	0x9072c14835b60edb
	.xword	0xca2a6c2e2206940c
	.xword	0x6dd65f52d51689f5
	.xword	0x66cabb605f004465
	.xword	0x44817b8aef32c79c
	.xword	0x84b8ec40c3aa46ce
	.xword	0x9bbdad190bd6b17d
	.xword	0xeccafa5f65d21307
	.xword	0x6100644077739270
	.xword	0x8ef80994dc7a1533
	.xword	0x5b39c3243bd3954c
	.xword	0xfd78a4e7530b6a29
	.xword	0xafc0160cf0612755
	.xword	0xf7678aba903595f5
	.xword	0xe79e9a73ebcf04c1
	.xword	0x6a205039bf677730
	.xword	0x5ce5b3c1c7dd8cd1
	.xword	0xc6293e90b7073926
	.xword	0x6abd56b244a5da96
	.xword	0x6f8bbd06a6076605
	.xword	0x55459c7f927a2a3c
	.xword	0x560c4294adf9cfc2
	.xword	0xcd2d65b906165424
	.xword	0x016621bd26004435
	.xword	0x860343a7a4cd6d37
	.xword	0xfa6ce532e0654342
	.xword	0x4ec43d42d72c6a62
	.xword	0xcfb57159a2f37968
	.xword	0xbd2a00a5eba7a8ed
	.xword	0xe44c8008822db29a
	.xword	0x50073b67da9326da
	.xword	0x84e3605b6d7ad6ee
	.xword	0x5e063c9aa2bbefe9
	.xword	0x6e430f8c87292f2a
	.xword	0x019ba191a31a81e6
	.xword	0xc68234ceae800543
	.xword	0x976f894b9243b462
	.xword	0x6f4a76097cfce024
	.xword	0xfbcd7a350f19b5b0
	.xword	0xb583c604a011323f
	.xword	0xc5f9eaada7c09f5c
	.xword	0xd8169e83aafbcd7f
	.xword	0xd399f48cccaaf121
	.xword	0x14bcf3a0476c392e
	.xword	0x25f2e84c622fcabb
	.xword	0x154efd5d71dfa67e
	.xword	0xe60cf00a125d4a8b
	.xword	0xca7459454a9e08af
	.xword	0x4a0f4c30d0d26116
	.xword	0xd346478baa9ec1d6
	.xword	0x2072248b7b28390c
	.xword	0xed23bd6815ff0b34
	.xword	0x0b42b87420286aa6
	.xword	0xfacce943997e88a8
	.xword	0x89cc1df6cfaec9a7
	.xword	0xfc988d27d558eaf5
	.xword	0x79584cb107fab09d
	.xword	0x3497b7c4f25bca27
	.xword	0x824605ca657910c3
	.xword	0x0b4628c3ad2e7c99
	.xword	0x79347f32750b6ec2
	.xword	0xd436b6b3d8a4bef1
	.xword	0xd78e4dc7454d1a24
	.xword	0x6cb4583b66234e44
	.xword	0x923fae187270a950
	.xword	0x47bb3601c28a38f2
	.xword	0x03ad0131219f2513
	.xword	0xe0f692fbfe556514
	.xword	0x1cc40ab307afab8a
	.xword	0xcf02f3c7e4895282
	.xword	0x2225b8e5e6b3c4d4
	.xword	0x49e281625a3dd1e9
	.xword	0x2de220f6e2ce2c48
	.xword	0x6180df5d40150d38
	.xword	0x1554f2fcfbb26929
	.xword	0x28dfcf689f246376
	.xword	0x5a05086139654cad
	.xword	0x06c6d83765405966
	.xword	0x056a6f42ef1bcd9d
	.xword	0xf8fcb4671575278d
	.xword	0x3aa10b6760453f78
	.xword	0x63eaadc7918d181b
	.xword	0xa1e998c881a00f61
	.xword	0x2957b5d6590ba2e0
	.xword	0x58eb033de335a80a
	.xword	0x04796d0280bbc155
	.xword	0x71d656ebb82bc234
	.xword	0xf684948273830580
	.xword	0x75d3bb75a2278ca7
	.xword	0xa76037bca0ac049c
	.xword	0xabae7292bf006a1f
	.xword	0x00ab0c83b05538bb
	.xword	0xdd607e2e44cc535f
	.xword	0x0c7cf5f99f325380
	.xword	0x37a99bfef13793cb
	.xword	0x7c6d16e4d11c9ec9
	.align 0x10000
	.data
data_start_4:

	.xword	0xbe8dcd14fcf7e689
	.xword	0xaca2236878eb4075
	.xword	0x633ccefcf5421ace
	.xword	0xbade814b9d3d8df4
	.xword	0x794212a77776b195
	.xword	0x5e96348cac3cb3ea
	.xword	0x1f245cf40a949620
	.xword	0x9b309549455a8bca
	.xword	0x85a1953aa01e03bb
	.xword	0x4a97755a2b2bf222
	.xword	0xfc1d87358ddd0778
	.xword	0x48e0fa765b08a799
	.xword	0xd0636bcf34390860
	.xword	0x62b739e6a28e8fd7
	.xword	0x21196586fc13906f
	.xword	0xec1c43cce36c936b
	.xword	0xa03f3ab08c35a472
	.xword	0xcde9ab18afd7dcb9
	.xword	0x7e4269d6a47f84e2
	.xword	0x90dc4415a795ae4d
	.xword	0x8f6d93dba8fc7735
	.xword	0x0db3dd7b3a3189e7
	.xword	0x9ef0c816d5e22f7c
	.xword	0xedc5617f0ed266fa
	.xword	0x360b72450a581917
	.xword	0x3217537901d20449
	.xword	0xf34709529ca59230
	.xword	0x1109b61c46956d93
	.xword	0x7f2f08e8a01b7c97
	.xword	0x842133b7aa479b82
	.xword	0xe8523c71c627ca38
	.xword	0xa80a788fdea04f71
	.xword	0x6abc88b509fdffe5
	.xword	0x304c95528b8c188c
	.xword	0x8c93691b5fe1ba9c
	.xword	0x4b489d553621a460
	.xword	0x7eeef5cce09b9a5d
	.xword	0x1123979d34162c3d
	.xword	0xb62558db193c0ca1
	.xword	0x3ace766ab9cea009
	.xword	0x93e18050548b52c7
	.xword	0xf502cc059447f62d
	.xword	0xa261ef929a357a36
	.xword	0x8ec118a3a6acae57
	.xword	0xd9a5fa969bfa76ea
	.xword	0x0dc72e7fac4df009
	.xword	0x62dcadb158b0eae6
	.xword	0x55643b4d9f916277
	.xword	0x388f034898b639f7
	.xword	0x23792a539aaec01c
	.xword	0xabb6022c3fb87388
	.xword	0x3bd9b3e7d198a899
	.xword	0xb34a8a85759a0fc9
	.xword	0xb0d8e4a6c2d3c1ae
	.xword	0x4c14c069f063d578
	.xword	0x2cb00a0710eaee96
	.xword	0xc9d8540d7eb00091
	.xword	0x8d7b94bf64242786
	.xword	0x37cfd052c521ad66
	.xword	0xb4b2cbb8cf48d622
	.xword	0x6a6a78e835cfd997
	.xword	0x5f91ae196f49c5ca
	.xword	0xd289d0bfc9923a53
	.xword	0xbb1f200fdfb32180
	.xword	0xc807a8c85f547c67
	.xword	0x5da89b4ac21f5549
	.xword	0x08c35a478def6bb0
	.xword	0x2967397ed7453af1
	.xword	0x3e99e768db653093
	.xword	0x7750603077000510
	.xword	0xc39edb63b459f4ff
	.xword	0x0719df9340f22f0b
	.xword	0x2fe0390419f2f8d3
	.xword	0x34c54d5edd50df53
	.xword	0xb54c70ce5be26d06
	.xword	0x2c0d4733df1eb111
	.xword	0xe496758ba3429820
	.xword	0xcae6952fb8300297
	.xword	0xba30d356bda44337
	.xword	0x31eb1942c6ad8fc2
	.xword	0x8af5cfa73c2715cf
	.xword	0xa2c3c02df6865b9c
	.xword	0x73b109a9a2d7e4b6
	.xword	0x6e0093a3e645122c
	.xword	0xf14c0e5068d2eed0
	.xword	0xac9192d9faec9bd4
	.xword	0x1050072c454bf52c
	.xword	0x1217c0bf120cfedc
	.xword	0x77783a4f1e2e9d56
	.xword	0x4f9f9bdaf8ec544e
	.xword	0xd9967e5c5d251690
	.xword	0x1f5a95fb825a0c96
	.xword	0xb608aa8bc2c33aec
	.xword	0x6be4373d08cae071
	.xword	0x8d472be593f3d89f
	.xword	0xc36f4d265fd846ab
	.xword	0x75de429b9fc2fa1f
	.xword	0x91cbd565b81731cf
	.xword	0xda572e57f4fa26da
	.xword	0x25892ba0f9431615
	.xword	0x266fbc9773ddd25d
	.xword	0x2f65a59ab22cee1d
	.xword	0x6fdd5c18da141492
	.xword	0xd3befc0dd5038f3e
	.xword	0x0b83fb71181eaef5
	.xword	0x151e8db22c74000e
	.xword	0xd64d13c0ac38ea65
	.xword	0x71e8566f5d58251e
	.xword	0xae7818db220aa6b8
	.xword	0xe968f1d1bd61c909
	.xword	0x115d828d705fcc20
	.xword	0x3035175725d3b46e
	.xword	0xb12612bbb37c87b0
	.xword	0x4e0b58691f5e4b18
	.xword	0xdebc566ba0eed4bd
	.xword	0x4ea9c40d34870983
	.xword	0xd112c35718516efc
	.xword	0x3d15c5b0ce8952e0
	.xword	0xc5bd83df59faad41
	.xword	0xc34abf8185fedf71
	.xword	0xc9f117956096d23c
	.xword	0x2bfd9639b2ac0f01
	.xword	0x460e330cf3c0b750
	.xword	0x064f19d7d2e6c346
	.xword	0x691db64803f96145
	.xword	0x4c80a3610abbd226
	.xword	0x3b36504899c6ac56
	.xword	0x81a274bc026ffaca
	.xword	0xf296558301e7d2ff
	.xword	0xdbb64d02b1166753
	.xword	0x4ab1e84e96430fdc
	.xword	0x76b98e17ed459ec5
	.xword	0xbfb689fdd142f97e
	.xword	0xb5cb558c1af04bb2
	.xword	0x9d7841dc860a2725
	.xword	0x6b0ece84654ae266
	.xword	0x8f27dbdc1a16c80b
	.xword	0xa6e55a25ca74e269
	.xword	0x9f2991e75d5f181f
	.xword	0x8fcd67b1c6ebea5d
	.xword	0x3def27536d62386a
	.xword	0x6f757b2669a833c6
	.xword	0x2f19ce453bf8bc12
	.xword	0xc7a581595adc9dd6
	.xword	0x454574f57d94583a
	.xword	0x4212c446bb8c31de
	.xword	0x852d9186ff430d53
	.xword	0xb0aa3352c6591b1d
	.xword	0x19b0005aff7c1e7a
	.xword	0x6a1760239e3e85d2
	.xword	0x6be0fa4f950e106b
	.xword	0x69cd09f8cb763d81
	.xword	0xd71da859659776f6
	.xword	0x15ebc667606b3d96
	.xword	0x1ce9b95e05e12454
	.xword	0xa045ba0df9152c01
	.xword	0xdf10fd7ca469611d
	.xword	0x0e2c873f8de901ca
	.xword	0xa88cf3fe37dbe0fb
	.xword	0x2683e82f3685deba
	.xword	0x2af90e726bf223c7
	.xword	0x46170d98016418c6
	.xword	0x0c9a2799043f9c4d
	.xword	0x5f7ced89f28307d3
	.xword	0xe9a82d0637bbb2c1
	.xword	0xf8a55c822a7aee1b
	.xword	0x6e77778398f9a7e2
	.xword	0xbb20b6663326ef00
	.xword	0xb34b32c997834735
	.xword	0xef06da6f20e92ea1
	.xword	0x8969cf402c0fb965
	.xword	0x78c764cca80149bb
	.xword	0x9f10d21fb678aa5f
	.xword	0x0eb0df43981e4cdd
	.xword	0x9fbe0a34d537d064
	.xword	0xc9d66a90aa015306
	.xword	0x6837e5596d295110
	.xword	0x239c198dc097ed36
	.xword	0x94563966f50d3d54
	.xword	0x429eb5c900190024
	.xword	0x1cf229f2f7f26d14
	.xword	0xf565875af6d51a07
	.xword	0x1e36eaf2b96a9011
	.xword	0xdc054b01317dcbfd
	.xword	0x4f1270229c15e3d2
	.xword	0x47a92c3244a677c7
	.xword	0x2336799e6271875f
	.xword	0x5e1cc69912670af6
	.xword	0x43136469fe3ff8cc
	.xword	0x344020eca4a51498
	.xword	0x409260b27558249a
	.xword	0x08239f38b2a1ecd9
	.xword	0xf493c46be3e8d1b8
	.xword	0x0131c557fff3aa4b
	.xword	0x6dfbe3791d10815f
	.xword	0xf1657449bcba7854
	.xword	0xe297665701a9e4e7
	.xword	0xa8c874680e6da3cc
	.xword	0xf6e71b11a34ad139
	.xword	0x2c2a1ad87829e918
	.xword	0xce24e6c0ad544291
	.xword	0x0702905bd031dfc8
	.xword	0xb65dd2803533f370
	.xword	0xb3f2d8b28966023e
	.xword	0xe884757d2dd539b3
	.xword	0x9378a7b129509fec
	.xword	0xb5519cc350ee8c0b
	.xword	0x7a294bf348e1305b
	.xword	0x0fd36f2f715e9b64
	.xword	0xb54ea1d189b94f00
	.xword	0xd8d501f717066f83
	.xword	0x7d68424ba878630a
	.xword	0xe7f79ac668f01303
	.xword	0x8f59de097f7f6b46
	.xword	0x01fc014b4d14cbcf
	.xword	0xb4303e55ebd39891
	.xword	0xd34ee5494ce03b6c
	.xword	0xbf3a6a8ad5054626
	.xword	0x2686720aaa84b259
	.xword	0x476f1f7c2985d996
	.xword	0x243c90533f679623
	.xword	0x17597c61cb71cc28
	.xword	0x10b9eb85d658dbbb
	.xword	0xd774d524dcdda4f0
	.xword	0x9c11ae7540eccc65
	.xword	0xa0749465c8b105c1
	.xword	0x220a42997f88946b
	.xword	0x6ac28529f889ac1f
	.xword	0x10d73ea60e7a2054
	.xword	0xe481f943d4cd3b81
	.xword	0xaa0f13315ef07364
	.xword	0xcd29e90306a7a153
	.xword	0xef803ce69e03cab3
	.xword	0xb6cc1e3b8bc76fa6
	.xword	0x657de554b321ceae
	.xword	0x4f06278e177b503a
	.xword	0xc15e0a052e225df6
	.xword	0xfbff94480b68a9e9
	.xword	0xef461e2e74956fc4
	.xword	0xaa4931acf6b73f76
	.xword	0x444ffc6cff57712d
	.xword	0xbce905116c7e299c
	.xword	0xeb86d7ab3d1b2373
	.xword	0x773abf69ea5d48a7
	.xword	0xc7eff6e9023d5d69
	.xword	0xbbf7e6d860cf2e67
	.xword	0xf0a3fc386899dffc
	.xword	0xf4556a89e767d55e
	.xword	0x23427893583c4b60
	.xword	0xdb125df09cd8aa95
	.xword	0x87aaa68a8ce49c27
	.xword	0x959a30a06c2e1fa2
	.xword	0xe348781d929710ab
	.xword	0x48d5a0e41980ee32
	.xword	0x703e01b0c960a0b6
	.xword	0xd5b5ff9d5fa40db9
	.align 0x20000
	.data
data_start_5:

	.xword	0xd99c70202a2ab956
	.xword	0x8f63cae4ac416b7d
	.xword	0x29ba37190de0b828
	.xword	0xf725ca526fe23f1d
	.xword	0x20fc024c22ecff9f
	.xword	0xa0cbb75825fa0030
	.xword	0x13f9131b657ff4c7
	.xword	0x5ea80331dbfeb718
	.xword	0x638fc70c99367626
	.xword	0x6d449a9a97b8910c
	.xword	0xba364a79c80bcb5a
	.xword	0xf3e733f6219d8e02
	.xword	0xb4b252fc4ca450c5
	.xword	0x68fc890b1d88e049
	.xword	0x9da886ace2b16b5d
	.xword	0x1bb628eb42f7c810
	.xword	0xbc66f9791ed24b63
	.xword	0x7b7fdbbac0002ba5
	.xword	0xd4c209f565a96248
	.xword	0x594f1ae421d34a76
	.xword	0xffa6428c75defb1b
	.xword	0xb51d12c0a6258fc4
	.xword	0xce1c979fdfa6c79b
	.xword	0xad20279d1b1bd002
	.xword	0xd34e656776a65cf4
	.xword	0x566972b1852d349f
	.xword	0x753db5b974fec2d9
	.xword	0xe371c757f01ce3af
	.xword	0x6d9639e3134a44f3
	.xword	0xf9746fcb7e9aecc0
	.xword	0xe58c359bd89d2261
	.xword	0xeef560021ec3b959
	.xword	0xbfb8863292a01ad8
	.xword	0x1d360da851ed25bd
	.xword	0xa06a5e2b6563dcc2
	.xword	0x6059375dd994715a
	.xword	0xeb9d1b8c17e71c48
	.xword	0xb3bc801e3a23fc91
	.xword	0x229217b326f2be98
	.xword	0xf16c9cb45e45fe48
	.xword	0xbc23953467327d5d
	.xword	0xefb29b53fda6d825
	.xword	0xef9a6d540048dd79
	.xword	0x1f190a40486830aa
	.xword	0xbe08ed120e34f935
	.xword	0xa8f3534ff38c57fe
	.xword	0xc821940dd1db219f
	.xword	0x383630998b4f1a94
	.xword	0xbbaabadff3ce5f47
	.xword	0x41be2e9b615fd3c3
	.xword	0x2a15f9f3874fea04
	.xword	0xb3112eebd2fd3fa9
	.xword	0xcc6041156a72377b
	.xword	0x37d5fd5e6995246b
	.xword	0xfd95e9b1c35b820d
	.xword	0x300fa3a5b78e66c7
	.xword	0x7ab4c66e169fa127
	.xword	0xf5e2bbafb3650c24
	.xword	0x80654a6de68cae5e
	.xword	0x82b1dab329474635
	.xword	0xbdf9965b80b81abd
	.xword	0x31945a03724f4217
	.xword	0xea112afc4bab0f66
	.xword	0x5451d95a1e5f2efe
	.xword	0x00a3653442e29531
	.xword	0x4a7558098af7bd22
	.xword	0x6c4d6ab25794205b
	.xword	0x8c2f21f5849a5c90
	.xword	0x230be22733519828
	.xword	0xe1c2c31ccbf7af81
	.xword	0x159b1dbc789deaac
	.xword	0xee68c4ee71b8317a
	.xword	0x28c7f1c7df96afac
	.xword	0xaa93cfb518f6bcc5
	.xword	0x17c32aa8713e5c7c
	.xword	0xc246a9f2cbbdc063
	.xword	0x8d3d15f0fee50ad1
	.xword	0x0c332297d38d2e9b
	.xword	0x9d3f4c4e3b80b8c9
	.xword	0x6863118a795a20d4
	.xword	0xeb759f91e8b69941
	.xword	0xd72332858c470a25
	.xword	0x50e1ce5281ea4df0
	.xword	0x606429039464eec6
	.xword	0x7bdb14cd2b5f9773
	.xword	0x85bba08529a1cc0d
	.xword	0x9927e74263e56227
	.xword	0x8c8dc52ea247a40c
	.xword	0x117d0aafd2070f7d
	.xword	0x4ebc513d9b5d424d
	.xword	0x4deb6737ee923d04
	.xword	0x97a3a6f7845136f9
	.xword	0xa3c45505e8c15172
	.xword	0x54714d87cb24e19a
	.xword	0x6a2eaa5c7fc8908c
	.xword	0x2fef8821ca59c613
	.xword	0xfadf7419929b94be
	.xword	0x9d237fa7540bae1a
	.xword	0xbf5ee8557b4f8aa0
	.xword	0x5ddc0b95f95bd24c
	.xword	0x06981bb6d9e2cccf
	.xword	0x162435317c1f528a
	.xword	0x29f15e8c44dd3c71
	.xword	0x82f13a0c300dd628
	.xword	0xb2ed839b120ee88d
	.xword	0x135074c2022d8ff2
	.xword	0x333dd39acc33ba2e
	.xword	0xba092b6fbc1676bf
	.xword	0x02c2bc499aeff85e
	.xword	0x31c18a1e0829e8c8
	.xword	0xf4105ac2b0657a11
	.xword	0xd43e7cc805029254
	.xword	0x0a4787a1f2c15543
	.xword	0x038db8acb133cfd8
	.xword	0x80a5fbfc3792b3fd
	.xword	0x6e8e13f6a79d161f
	.xword	0xee8c1ac1e27761ff
	.xword	0x74831c3214f30731
	.xword	0x1cf161261aff1abe
	.xword	0x87de141b5343dcc6
	.xword	0x8ad35cddcd4dd6b7
	.xword	0xd86fce86c08cfaec
	.xword	0xb8e311bed4e2a609
	.xword	0x8571773a1d682c24
	.xword	0x4588c85b8fcd434e
	.xword	0xd9467247ed4f0893
	.xword	0x3f3c5a6cfa1d7bfd
	.xword	0xbd175e3a756f7ba5
	.xword	0xd4d3930486c47d51
	.xword	0xbf2b41bcb4dee73b
	.xword	0xe6c62dd840a969b0
	.xword	0xb0a8c24c72c4a4a1
	.xword	0xbe9f75f9b717db22
	.xword	0xadb131ce633f706b
	.xword	0x2592e4302b58d60a
	.xword	0x7acac6fa87ed1e71
	.xword	0x5a39d1c870f22318
	.xword	0x15f852b4e0e924e6
	.xword	0xdd09c9808b3f777a
	.xword	0x85ce74c0f0ec950f
	.xword	0xdd5db1ad0765bf1e
	.xword	0x0668035ce30ef049
	.xword	0x35d0320e3f97606c
	.xword	0xc06a584b991c89f5
	.xword	0xb5f4138de959f01b
	.xword	0xbb21ec8fc9f2cbd2
	.xword	0xc8dd95c2b054a281
	.xword	0xc5cc3491604e9370
	.xword	0xd65bf8af6aa8ed21
	.xword	0xf4de57dcc1e1b31b
	.xword	0x8b5da7f1ee916d88
	.xword	0xcebf7319f9dbe8fa
	.xword	0xe069db11d7519dc1
	.xword	0xc7e15b82a5e2e5bb
	.xword	0x3eee54c19d72a86a
	.xword	0x5f62a16f6a27615e
	.xword	0xd5ed78c2373253ae
	.xword	0x37f5d7ebbb94c538
	.xword	0x39879d15fce3d780
	.xword	0xf685f33537e0660c
	.xword	0x1397f2acaaa5d555
	.xword	0x8c743c58bf679f90
	.xword	0xa368dad07d596cbb
	.xword	0xcf43050d7372477d
	.xword	0x265dc97d05bd6a1a
	.xword	0x1b034f0a25fff960
	.xword	0x437e7a8e34acd2d8
	.xword	0xfb637c3ba0d35c67
	.xword	0x13581212fc22ae20
	.xword	0xb3c832c223c5df74
	.xword	0x0d700e1ab34cb609
	.xword	0x1f0b0bd5e6b8f4c8
	.xword	0x5c2291bfa86fb3fb
	.xword	0x3059c3a0b3f4e8af
	.xword	0x0c13f4e9e68f76e8
	.xword	0xf92db06eece695ce
	.xword	0x55a2b9338989b4bc
	.xword	0x4c568bd5f9499f2f
	.xword	0x360103b7912964ac
	.xword	0x6eb127eb5302e95c
	.xword	0x7c941129624b4782
	.xword	0x79dbc12d8bb0b5ed
	.xword	0x204bcb2992d78727
	.xword	0x3de1280db9bbefe0
	.xword	0x12ba668c8994a7d4
	.xword	0x6da246fba4a41b0a
	.xword	0x8caa564ad4e6fa2f
	.xword	0x94430652e44f1c14
	.xword	0x2c5e022562565e96
	.xword	0xe9b70b4a26c3b5a6
	.xword	0x3a6deede4d4d0f62
	.xword	0x5516d6336d8d6683
	.xword	0x9d7c2232ae78efbf
	.xword	0xaab6287115fa5292
	.xword	0x8b207770e2056570
	.xword	0x2530fdcef2589f86
	.xword	0x5e57def4caed92fc
	.xword	0x26d005043a8e478e
	.xword	0x767af1bdfe9ed4aa
	.xword	0x90b0e0c284c0ee30
	.xword	0x412c2d786206d65b
	.xword	0x57cd07425f889baa
	.xword	0x09eaccbb3873e034
	.xword	0xe0095a83fa27e6c0
	.xword	0xf8fd39ae232add3d
	.xword	0x0556391c40f52e16
	.xword	0x060f8f79d8ad7dd4
	.xword	0x016cdb0996825b4a
	.xword	0x964cc26711249c4a
	.xword	0xf2b855869c585938
	.xword	0x3281efd6783e4fb6
	.xword	0x3c47e9c78dfc62da
	.xword	0x2be80bb021829458
	.xword	0x9bbeac7e79bc24f8
	.xword	0xb04caec89efac775
	.xword	0x124cd964e3f95078
	.xword	0xf6ca44b20b8f8f11
	.xword	0x4584bae916628292
	.xword	0x020276b0b437abaf
	.xword	0x4508ba2745397599
	.xword	0xd410fd656f2f61a7
	.xword	0x6bce62eed7f8139c
	.xword	0xe50ff8350f89bdff
	.xword	0x3e55961473fe3b88
	.xword	0x5bc6d62c4540ea68
	.xword	0xe7413f23e2cf6ff8
	.xword	0x71025db9b296c184
	.xword	0x2329e7bafbb276d6
	.xword	0x46de848ef17334d4
	.xword	0x3084a98acbb4b81a
	.xword	0x01e2b0c1b76fb735
	.xword	0x6cf57166223bf45e
	.xword	0xaf948b33bd127939
	.xword	0x1124683f0fb2737c
	.xword	0xca819a2f2b0264f8
	.xword	0xe05016aef427ba9f
	.xword	0xf5f33486f5d438b9
	.xword	0x3cbbff5dc10d5421
	.xword	0x5e02d7a6623d3425
	.xword	0x6039aa6ff863cba0
	.xword	0xe51d65716a529e1c
	.xword	0xcf3a16d002514ea1
	.xword	0xe0f379221f318474
	.xword	0x8e5e14f73c92cb2f
	.xword	0xd74e6a7a8a20e540
	.xword	0xe1e86ecffd047ac3
	.xword	0xd89163875709bb71
	.xword	0x5b6d1d79fb04363a
	.xword	0x56318d0f3d056eb2
	.xword	0x693f9b6ef26dd926
	.xword	0x3473ac29e7928b08
	.xword	0x3a36dbdb2cdaa84d
	.xword	0xbe7899e397c9b758
	.xword	0x289dbb7067d02752
	.xword	0x655c9348ea2d71b6
	.xword	0x212639ddc1adaae7
	.align 0x40000
	.data
data_start_6:

	.xword	0xd2c574784b129656
	.xword	0x73827b67504eb7b5
	.xword	0x80a3da206171d818
	.xword	0x21d14d514a609465
	.xword	0xd331888e90c63eb9
	.xword	0x5af5f8d9104b620a
	.xword	0x7f11a9013a9a6eb4
	.xword	0x8a3fcf1e7680f88c
	.xword	0x05879c8d21a3e1e3
	.xword	0x986f4e5519a46f1d
	.xword	0xc3c1044a7056b6a8
	.xword	0x22330f9ae75964ce
	.xword	0xaecf245e58584f2a
	.xword	0x258ffae72e3eccdc
	.xword	0x99a356040729fc2e
	.xword	0x3d939f578e2d18b3
	.xword	0x992221e0982c8fa4
	.xword	0x8ee5c55a232168b2
	.xword	0xf093ecff45232247
	.xword	0x6ee96d01e09ac746
	.xword	0x5e901cab82433341
	.xword	0xf725ab3aef61e42c
	.xword	0xdfe1a2d21cff86bc
	.xword	0x8923d59a440d77f8
	.xword	0xd1fec2edc9ee4244
	.xword	0x5f36e03210b397ce
	.xword	0x04960ded5a56e0ff
	.xword	0x178cbf76f32daa87
	.xword	0xd43a9d99727121f2
	.xword	0x52a93cf68a9fab85
	.xword	0xe88c1a40901582e3
	.xword	0x6a56c7053d66ea35
	.xword	0x3eb8415a66b4996f
	.xword	0xedbb7fbff38e3ced
	.xword	0xf2c01704f3332346
	.xword	0x61416090daaa1bd5
	.xword	0xce210df3a33b09ea
	.xword	0x5cc4e61273e88fe4
	.xword	0x02e09d7b72b67fd2
	.xword	0xa85e6f8b0ab7f165
	.xword	0xf72b470e5e23be04
	.xword	0x70f8cd0491bbb956
	.xword	0x672d650a7e28655f
	.xword	0xb19c208c11d6c574
	.xword	0x307f00277f866680
	.xword	0x7fbd556949483413
	.xword	0xefd65d88460c70c0
	.xword	0xc839f1a599221d23
	.xword	0x79a96f7f4ee003c6
	.xword	0x8bc21643687e4130
	.xword	0x764505dd36b2b697
	.xword	0xad4161409bf6c206
	.xword	0xfba2b8d8039b79cf
	.xword	0x7c9188ca72fc441b
	.xword	0x24ce53a650eec7f8
	.xword	0xd924c6731a6dc18f
	.xword	0xb3bddb100f227bf3
	.xword	0xcbbe08dc6e25bd02
	.xword	0xb8bc5753fa637bce
	.xword	0xa2c7913ce2527f53
	.xword	0x21a8db645d1657d0
	.xword	0x787c5ae0b4dcb33a
	.xword	0xce94888bc20e92ad
	.xword	0x67e2588e5fc24389
	.xword	0xe66ce50b90c03b97
	.xword	0xe23d0a8a0dfb741c
	.xword	0x2acf55f0f7c104da
	.xword	0x51b4192a729ac9f1
	.xword	0x6dcacbed426952e0
	.xword	0x3fe52e84a467bfda
	.xword	0xae6ce5a3d5adab6d
	.xword	0x0ca1b47a6054d35c
	.xword	0x23415e245851678d
	.xword	0x61d2a6754b56d3c3
	.xword	0xa24af85562faceea
	.xword	0xeda83ba96d6fb9d3
	.xword	0x07a0624bbb5cbf4b
	.xword	0xd1c0ab0e77c2f092
	.xword	0xbeabd4edbf6e3eae
	.xword	0xd794bda2bcc2b5f8
	.xword	0x67850edfecf6b901
	.xword	0x84d0ba62d72513a6
	.xword	0x2bcd30bff2afcc93
	.xword	0x7f7f5efc9ef82594
	.xword	0x5c323164781f037a
	.xword	0x5e8c36ef3b9dc1ce
	.xword	0x91d7cd9fceb0b7f4
	.xword	0xec95b0d89f0a0f24
	.xword	0x6d7cb18507559357
	.xword	0x2c22635f1d56addd
	.xword	0x45233529e0db492e
	.xword	0xd7032e7a05861405
	.xword	0xd933d27cfef08f38
	.xword	0xe524604783a5c6ab
	.xword	0x2bfa8e57d7bea9c3
	.xword	0xc575fed2d72534d8
	.xword	0x7f9d6e3122283e7c
	.xword	0x39b6257dd5040e32
	.xword	0x4ea961c18921a67f
	.xword	0x870f8672f078bc54
	.xword	0xa7a70d94d4a4fc44
	.xword	0x0706dd0e98e63485
	.xword	0x759f4d15f356b70b
	.xword	0x872531aead395c64
	.xword	0x6d8ac4ef2490d219
	.xword	0x7f780322a3893930
	.xword	0x5d6c11860877e98c
	.xword	0x17ef0416f499f572
	.xword	0x5e9385ce0b9cb992
	.xword	0xd21d2f8d177b51bf
	.xword	0x8cbffe82a92edd6f
	.xword	0x69ec06585a78515a
	.xword	0x882d7efe76c2f94d
	.xword	0x503dd22235e00f44
	.xword	0xa99632d39daa00f2
	.xword	0x869349485d781228
	.xword	0x6e47bc5d26516ca3
	.xword	0x447c749014f2cae1
	.xword	0x52dd27b8d6fb63d6
	.xword	0x03ed0898098cf94b
	.xword	0x278c07371cbf570d
	.xword	0x82f69ef95d9ededf
	.xword	0x8f8ed9a3ca918891
	.xword	0xc9d06801aa00d194
	.xword	0xe6d5f2192e01b184
	.xword	0x340d927059ec6047
	.xword	0x23b9625f259bcb9f
	.xword	0xa932b5ffd6272b05
	.xword	0xfce82c7271a1a23f
	.xword	0x4220de0030ebbfe2
	.xword	0xc20cd3861ad350bb
	.xword	0xf7c7651267ac4243
	.xword	0xee78ea332791f620
	.xword	0x7841e5fedad9bb1b
	.xword	0xef337b2256a9767e
	.xword	0x1c7b7120a97885a3
	.xword	0x948a83b6abbd0bf3
	.xword	0x0285ef2101b6833e
	.xword	0x9e73f65fea2c141c
	.xword	0x1e9f365b6518c569
	.xword	0x66e429fa13ee6176
	.xword	0x24f1c7817895bac7
	.xword	0x118ec6d5a5a80f41
	.xword	0xc0a5e860e91ceead
	.xword	0x768b9bcf545b42e5
	.xword	0xaa34258d17dd22b8
	.xword	0x2be23ce9b50d7a68
	.xword	0x089a635b5c626571
	.xword	0x9db03e9cc8671abd
	.xword	0xa86ced622a569fe8
	.xword	0x617779efa6b22f1c
	.xword	0x6c342e3ddd617cb7
	.xword	0x52fca9faa110e063
	.xword	0x252ad9db9c8ad0dc
	.xword	0xd57b382e7a7d1920
	.xword	0x735c54bc2d34ba41
	.xword	0x54c888f94fa3f84f
	.xword	0x4aea4a737f210c75
	.xword	0xfe343a1d397b3dfb
	.xword	0x33151a5813a5dc65
	.xword	0xb9eae4629ec2d990
	.xword	0xde46f6bf8ad4ccf6
	.xword	0xf29b3e63ee88a93e
	.xword	0xc2db5e9a22b11052
	.xword	0x5a89b79435653d93
	.xword	0x18fb15eca011d08c
	.xword	0xe46b5db1068c8fea
	.xword	0x02c6fc54a6799c45
	.xword	0xaf10ebec475cc8bc
	.xword	0x2136456273a6b5ae
	.xword	0xd7e4277f4c62e52b
	.xword	0x66a43f11066a9a31
	.xword	0xf010d9d9462defc6
	.xword	0x553035703673b8b8
	.xword	0xc284d95edbf51014
	.xword	0xbc19c3cfdfbf2623
	.xword	0xf98c03f2e7ad8329
	.xword	0x25e33f8ee6c2af12
	.xword	0x09bdc22f4d993c60
	.xword	0xcb607e23292ab0ea
	.xword	0x9f117c7df4add051
	.xword	0x2db792cee6608e4f
	.xword	0x686b56745cf17c3e
	.xword	0xdd0cf301e7f18845
	.xword	0x86137a8545bba364
	.xword	0x38aaf9d6f41b3ec8
	.xword	0x559fffdf7ee212c4
	.xword	0x55598360757526b7
	.xword	0x5d374dc8a56c4ec0
	.xword	0xbe22574b3235702b
	.xword	0x5290718575c218c5
	.xword	0x8cea6ae3b38a7afb
	.xword	0xc8401eaf8213b6f4
	.xword	0xaef53bc365a5b3b0
	.xword	0x30853b0f63769ad5
	.xword	0x281e458cde80cdd7
	.xword	0x8cfe9bfaad4e046e
	.xword	0x37a0f4bbbadbae83
	.xword	0xb28fbaf926391d3e
	.xword	0x49e43341bfc4f358
	.xword	0xf3a1a02ac1162ec1
	.xword	0x175a5554a33f909e
	.xword	0x4c355ebb376f3f4e
	.xword	0x2b6d9c8aaa9f49fd
	.xword	0x569b02778bfc1526
	.xword	0x7f344aa1add7374f
	.xword	0x6a71ef8074ed5180
	.xword	0x7ebb6bb6afd5ba21
	.xword	0xb48e7121a44a1cf8
	.xword	0x7b72aa30362ffecc
	.xword	0xe3dbbd0bc8cece4a
	.xword	0xba963fd46a3ecd48
	.xword	0xc66102ffef989fea
	.xword	0x6c06fe7901a9523e
	.xword	0xa09d7182737645c5
	.xword	0x8be3cb6d3c6f29d3
	.xword	0xc4fe864f39c90329
	.xword	0xcb8b8484ff2952a3
	.xword	0x1f8418557904a1cd
	.xword	0x776f697131cb97d5
	.xword	0x842f8692f32c99d6
	.xword	0x02234723c62b921b
	.xword	0x6bdea42f561b80ac
	.xword	0xca44002af8c6cb88
	.xword	0xc8a12438fae633e2
	.xword	0x89cfa37e38c3c909
	.xword	0xb175c74b532eadbe
	.xword	0x3facef6a94842776
	.xword	0x81ab5e8c23eebf54
	.xword	0x050cb161009f5801
	.xword	0x208ebdcacf9203ce
	.xword	0xc2d982d781d0e8eb
	.xword	0x27c76185a49fbaf5
	.xword	0x77e9b6a61f0efced
	.xword	0x4d070d4ccc7972c5
	.xword	0xec1a5fb492518e4e
	.xword	0x497f983d18b7bd99
	.xword	0x34994271bfff2b25
	.xword	0x46e809fae9a66ad4
	.xword	0x16cb9f04ca08199b
	.xword	0x21bcf6c30b3ac303
	.xword	0x0f22b39788a46214
	.xword	0x37b03c426e83a65c
	.xword	0x9b138656797d5277
	.xword	0xf001c11aaceb4e9a
	.xword	0x866dd5e072d8d6a8
	.xword	0xf84104339744548b
	.xword	0xec377f35006ee56d
	.xword	0x9b359a78d1576746
	.xword	0xadde565265e3099b
	.xword	0xe042c1cb3224fb79
	.xword	0x9f957c86f03c8836
	.xword	0x7cd0b2bda150a65d
	.xword	0x012db19ee86ff49c
	.xword	0x1696b7c3096e07b0
	.xword	0x9ec3f38e5b15c479
	.align 0x80000
	.data
data_start_7:

	.xword	0xcbf8413c188e02bd
	.xword	0x5f934c1a4e95aee8
	.xword	0xa9f743a274294023
	.xword	0x1135b6784583570a
	.xword	0xef41c4d52cbb5847
	.xword	0x293c38984b504bbe
	.xword	0x0ff3cb2d7110a74b
	.xword	0x7dec7e1f892b3997
	.xword	0xccb0bb1003e7833e
	.xword	0xdbe33bdd851a1c13
	.xword	0xe1c550247b92b1c2
	.xword	0xd8b5d7f090535eab
	.xword	0x32f58cdd74251341
	.xword	0x36064fb634f4eede
	.xword	0xd8371dee6b33a29a
	.xword	0xc58b967533ffebb1
	.xword	0x183e12f9b1ec0bca
	.xword	0xf64c3fd277a99ada
	.xword	0xed23216776446a1e
	.xword	0xc19a649792af7f13
	.xword	0x810251e33559dd52
	.xword	0xc7b282bb1c413a69
	.xword	0xc1638a08ead0f073
	.xword	0x5f43cde622b0b649
	.xword	0xef004306413eea5c
	.xword	0x5f76e161d8289094
	.xword	0x232e6731ef4a12fa
	.xword	0x80722d897cc491b4
	.xword	0x689446d7f565d57f
	.xword	0xf33d1b7c42676754
	.xword	0xf40d361549f94d57
	.xword	0xfd9add1d710f4562
	.xword	0x2c9e82de25c475db
	.xword	0x75354d28e616d126
	.xword	0x46f5c9f51b989cc5
	.xword	0x05723e9680aad15d
	.xword	0x33439b856bb24e3f
	.xword	0x1c8854e92c675600
	.xword	0x8438da4a4a34e47a
	.xword	0x7900771a213d6549
	.xword	0xd5a780e867c0953a
	.xword	0x35e07c7badd435c1
	.xword	0xa3a3a3dece89bdb2
	.xword	0x86077fb743175fce
	.xword	0x0431d00e81f3ead8
	.xword	0x39154bc69dd54f01
	.xword	0x1d9d101f85f17af2
	.xword	0x2105335b5c692c90
	.xword	0xe5a0c7191dce318a
	.xword	0xe1d286202047a5e8
	.xword	0x242119590a61d6d8
	.xword	0x1162d6fa26878777
	.xword	0x00741a69e316c8b5
	.xword	0x9e1ddaa15e6fb104
	.xword	0x11e5936755a1e70d
	.xword	0xf2969f64bec7b1da
	.xword	0xdfbee53f4e15f17d
	.xword	0x195ef07d3440018c
	.xword	0xbfaeb2e3f70bf829
	.xword	0xc9961f21ea0e74ce
	.xword	0x4eb27b17885a0f8d
	.xword	0x1605702d86374035
	.xword	0xcd9c230a6c7618fc
	.xword	0x934eb2cd2e5a7580
	.xword	0xa6045bdb318741d5
	.xword	0xdd0afa8a4f22be35
	.xword	0xd15a106b34001c93
	.xword	0xf9b620e5f7785f29
	.xword	0xf728f88eadc6e6b3
	.xword	0xbb0f6c4ef6330541
	.xword	0xfb78efbe00a9d9b5
	.xword	0x1566b3e021731db2
	.xword	0x3b836274aa2e130c
	.xword	0x57947962ae21bc6d
	.xword	0x2879656f2edef0e4
	.xword	0xd40d7928b16e5053
	.xword	0xdf706e8294b397b8
	.xword	0x74a76c0e2f24151f
	.xword	0x2c29b631737a288b
	.xword	0xf68c9df97809ef12
	.xword	0xb68db8330c5ef96b
	.xword	0x2dec3d6fc61ad42a
	.xword	0x4c8aacd0fc479aa5
	.xword	0xf3f8f81599615a21
	.xword	0xff5a4950718cc5bc
	.xword	0x6156bfeb25ac27ff
	.xword	0x9e30e899e1f39b37
	.xword	0x9c9ed008d8311c6a
	.xword	0xb23140af57b9a432
	.xword	0xd1455c68f8d221d0
	.xword	0x0cd245352a281c64
	.xword	0x219972ee5f3474f9
	.xword	0xc60307cf186bb49b
	.xword	0xf38eaf9ffe4bcf60
	.xword	0xb3ee5ffd53055adc
	.xword	0xfe1b610e4b7e10b9
	.xword	0xad255ce2cee805d7
	.xword	0xfb314726470b6b1c
	.xword	0x231b23dda10481d5
	.xword	0xb9aa40d350c5cca7
	.xword	0xf93139f4beb2b63e
	.xword	0x7285d451f46c3fb3
	.xword	0xcc9d7a7571d94701
	.xword	0xf5b47daba14606e1
	.xword	0x8e5a5ab28c5935f0
	.xword	0xe6dfd10993e20ea5
	.xword	0xb35cf0c9197a0e4f
	.xword	0x5cb2e396230cf9d8
	.xword	0x4cf07b7a5de83737
	.xword	0x8e2a6bbd34464f01
	.xword	0x3dac8339871d53b3
	.xword	0xe33637ef909f2155
	.xword	0x0702d466e11b592d
	.xword	0xa17adef7ef0bc49a
	.xword	0x793a2de195c10d14
	.xword	0x0499a582a8e2af5b
	.xword	0x8a72aef94eb9b6b3
	.xword	0x8abff9ec8737c013
	.xword	0x244d0858b16a9193
	.xword	0x8a78fe29946e7321
	.xword	0xe9071ee996bee0e1
	.xword	0x1011048844a8c315
	.xword	0xa80a2d3bbd58c85b
	.xword	0x15207b3c56871a6b
	.xword	0xe22685a32d50c3c1
	.xword	0x17d58081553f1f50
	.xword	0xcc77d4a7d58c1ef5
	.xword	0x20377961f0fdd5ab
	.xword	0x68e3e44c17ad7e9b
	.xword	0x3f99bcbde5c7d9d2
	.xword	0x414d3c1e808c8bf9
	.xword	0x978d6bd4e9f5c2eb
	.xword	0x65c1f55bb226f987
	.xword	0x7024ba869535ba69
	.xword	0xf946126bed6bc2f9
	.xword	0xf4679d162ff028e6
	.xword	0xe03154ddb6987d92
	.xword	0x4b3593ccb1bf9380
	.xword	0xf10f4fcd17e379e4
	.xword	0xaed5912e0cf35080
	.xword	0xa4f34506c1670147
	.xword	0xedb23b6dfcf40d7d
	.xword	0x4da24dc0c7b28607
	.xword	0x884a019c8a7e6990
	.xword	0x5844e6c445cf72cc
	.xword	0x22ef9cf1dba67c54
	.xword	0x1670a3c81463c260
	.xword	0xd42879baf76822c6
	.xword	0xc6c6d4f1d6fec14c
	.xword	0x48f049f21237ba1b
	.xword	0xad20af739287c11c
	.xword	0xa333722b031b03aa
	.xword	0x294bd950878798b5
	.xword	0x558ea21097bcd03f
	.xword	0x285d839299a63dca
	.xword	0x0c1f8cb6b0487f63
	.xword	0xf090f60fcb3a3465
	.xword	0xd4ea4cb126ce3d14
	.xword	0x7cd7279a3f08c530
	.xword	0x80d6f944852c4c13
	.xword	0x10fce94c31d31167
	.xword	0x866577afb2709ca8
	.xword	0xcaf4fdb331c45f1a
	.xword	0x9b2537b1c6843bd9
	.xword	0xe0347e3a8666ba04
	.xword	0x7f79170abf7e9f32
	.xword	0x11b3adfc14db094d
	.xword	0x675f0066df0fe4db
	.xword	0x8e47da6ab6412dc1
	.xword	0xd12896288401fde9
	.xword	0xe84d094c9041f26d
	.xword	0x1b8d5277281c5a5a
	.xword	0x6830081f5c318142
	.xword	0x581b26cbd6d8286d
	.xword	0x07b555e8fd35dcc6
	.xword	0x01f58c97a332c500
	.xword	0x8f6a34f915d38b73
	.xword	0x59db0e28bbc41191
	.xword	0x28c509f1f63b0130
	.xword	0x9f712e23f5be0288
	.xword	0x0e318550caa66fbd
	.xword	0x78dd353c324a0344
	.xword	0xc57644ef4d65dffa
	.xword	0x0ae85fb58e78d19f
	.xword	0x194e9ee5e11dc143
	.xword	0xf16a6d1ac9ed211a
	.xword	0xa7711125ce8537ed
	.xword	0x7862b9b9ba4c9d09
	.xword	0xa0f27d12ae351185
	.xword	0x446e1b5e241febc2
	.xword	0x189c6f9c7a2c6045
	.xword	0xf4bdd6d640bf3ee5
	.xword	0x9cabc00235901922
	.xword	0xa63ea8ba9cf3adb5
	.xword	0x2249ef3943ce1fbd
	.xword	0x99d32dce174693c0
	.xword	0x32aa2dfa4bd13d81
	.xword	0x863ab7e43dd89fd3
	.xword	0xad007657019bf396
	.xword	0x5b085a0ab19c660d
	.xword	0xcce2e0b216b0aea1
	.xword	0xae8d1811aad53e66
	.xword	0x5ca181a0e44655f9
	.xword	0x141055200ff3543f
	.xword	0x9860359976d8d966
	.xword	0xbf94a75f9478675b
	.xword	0x3962c8d182bffe6f
	.xword	0x0db3fb0716c74162
	.xword	0x64cd20309349fccc
	.xword	0x5526197eb2320cb0
	.xword	0x8c0a928eaca10360
	.xword	0x4808d049aa858788
	.xword	0xd41474b7c1ac48f6
	.xword	0x1bab85765eaf63dd
	.xword	0x8c6d328b5752673a
	.xword	0x770e4caa68a10f0b
	.xword	0x758c833ea9bcdf3e
	.xword	0xfe6de7c5206c83a9
	.xword	0x401971bdbd3a9cbc
	.xword	0x19ec052a836c8fac
	.xword	0xc14a72a0bfd43e11
	.xword	0xdb82b5281ad0298f
	.xword	0xbb7c474e13d4377e
	.xword	0x92be6bf11461611f
	.xword	0x2e4dcc3ae5f404f7
	.xword	0x1d8f31b67af6c30b
	.xword	0xe1f9bfc2ec00d2ad
	.xword	0xae46589c1db9c9be
	.xword	0xee9f7b37da997b49
	.xword	0xfc49fcec125420e1
	.xword	0xe7cd0e77c8db887f
	.xword	0x394a8ce0faa1d37d
	.xword	0x65315f9186341f4d
	.xword	0x7cb5c0c453b3497a
	.xword	0xa89261a58b61466f
	.xword	0x00380777dcc18941
	.xword	0x7b814a5060c09cc9
	.xword	0x1d3d9d13646da884
	.xword	0x2f0aad6b99c21398
	.xword	0xbe0ee28db2fa5edc
	.xword	0xbf65fb194bab3519
	.xword	0xd139d9e6417c00b2
	.xword	0xc3e78c486b6b6517
	.xword	0x0ecb9ac697b5ef10
	.xword	0xb9fd436a3d117d1f
	.xword	0xf3408c85b3b44e28
	.xword	0x8cdfad9401e668a4
	.xword	0xb1b1b202512bd93d
	.xword	0xfba0df5a008655f4
	.xword	0x12b765b8fdfc73de
	.xword	0x3cff5f8f910196c6
	.xword	0x52a815a587c89791
	.xword	0x5e1538200edb5949
	.xword	0x72ba4ec0f21efb27
	.xword	0xcbd0d85ef4c83f14
	.xword	0xe62bbe0a20c8f93d



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
