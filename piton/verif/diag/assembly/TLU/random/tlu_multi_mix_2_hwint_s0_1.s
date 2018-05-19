// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_1.s
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
   random seed:	202850341
   Jal tlu_multi_mix_2_hwint.j:	
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

	setx 0x55bba4fa40994b5a, %g1, %g0
	setx 0x4899e770834fb4c0, %g1, %g1
	setx 0xa89e4b8512830290, %g1, %g2
	setx 0x3967cec8d1e6e908, %g1, %g3
	setx 0xd39aed549ae9d66c, %g1, %g4
	setx 0xae13cfa9dbb942b0, %g1, %g5
	setx 0x4f97c980dad69323, %g1, %g6
	setx 0x40dda575ec327192, %g1, %g7
	setx 0x09f7203a4132f4b0, %g1, %r16
	setx 0x9bde2fe5cb12627c, %g1, %r17
	setx 0xfee43d50809364a7, %g1, %r18
	setx 0x01cb75b9cc2dbe38, %g1, %r19
	setx 0xafbf50e9f220f13c, %g1, %r20
	setx 0x5193bdd2debb076b, %g1, %r21
	setx 0xa5a60264b9d809d2, %g1, %r22
	setx 0x1b6b33f729d6c7ce, %g1, %r23
	setx 0x713b12fe2ed0d3b1, %g1, %r24
	setx 0x489f7f662c6f4676, %g1, %r25
	setx 0xb796e969f090c2f5, %g1, %r26
	setx 0x64aaccc151107109, %g1, %r27
	setx 0xb6703d7fc3cd1444, %g1, %r28
	setx 0x535750b5ee2b91d9, %g1, %r29
	setx 0xdf96ff782192e289, %g1, %r30
	setx 0xb33f2a8e7bd9ea8c, %g1, %r31
	save
	setx 0xbfb8b7c1459f8539, %g1, %r16
	setx 0x32050f1106663543, %g1, %r17
	setx 0xe27da4d89eec11c0, %g1, %r18
	setx 0x95721bcdb345aa3e, %g1, %r19
	setx 0x8046a44998a95f9f, %g1, %r20
	setx 0xc21bad7eda91b006, %g1, %r21
	setx 0x211168d2205f2984, %g1, %r22
	setx 0xd31248a0dd498061, %g1, %r23
	setx 0xbc428e1c1f40357a, %g1, %r24
	setx 0x2129e19c582f2996, %g1, %r25
	setx 0xb7d4dafd7c548e79, %g1, %r26
	setx 0x6defb9a1394b4523, %g1, %r27
	setx 0x638d3f7daeb11e03, %g1, %r28
	setx 0xc4176a905866ad3b, %g1, %r29
	setx 0x14854d5cff8a8037, %g1, %r30
	setx 0xe775fc61eb7cf0b5, %g1, %r31
	save
	setx 0x96ab5b37b1ce80c5, %g1, %r16
	setx 0xe781ec0ae3c70b92, %g1, %r17
	setx 0x34eb195644fc0bcb, %g1, %r18
	setx 0x272fbc56a380efc0, %g1, %r19
	setx 0xd31f6a9c88a451c5, %g1, %r20
	setx 0x249d9c0549a02350, %g1, %r21
	setx 0x61428c2658f79633, %g1, %r22
	setx 0xe615b05034906031, %g1, %r23
	setx 0x807a88e3465a3071, %g1, %r24
	setx 0x9ea01b77ccc79912, %g1, %r25
	setx 0x96cd98f7975d33ef, %g1, %r26
	setx 0xbb0b2f33d15b0c65, %g1, %r27
	setx 0x895f8ed09e511ab7, %g1, %r28
	setx 0xde7fe8846f691b39, %g1, %r29
	setx 0x2e3c0a167ac9a637, %g1, %r30
	setx 0x9c0d0a955cb3805a, %g1, %r31
	save
	setx 0xe38408b23b6e36cd, %g1, %r16
	setx 0x7cf994a2127393a6, %g1, %r17
	setx 0xd01f798f5a82822a, %g1, %r18
	setx 0x4782348380510aae, %g1, %r19
	setx 0x09badec0e7c40819, %g1, %r20
	setx 0x246957831fe18e2d, %g1, %r21
	setx 0xf8b5f259cb3f1c92, %g1, %r22
	setx 0x3f754c3fc6b6b6ce, %g1, %r23
	setx 0x1e9e6be2ba86b681, %g1, %r24
	setx 0x7bb5f0f1cb3e6ff0, %g1, %r25
	setx 0x019a8fd5ab761aa1, %g1, %r26
	setx 0xc559803a025d0854, %g1, %r27
	setx 0x0f925e7a3f5a394b, %g1, %r28
	setx 0xc3dd7cbd1f75d075, %g1, %r29
	setx 0x5c87c374b9c89f78, %g1, %r30
	setx 0xd9d34c341c61b383, %g1, %r31
	save
	setx 0x431c2860c9340b1a, %g1, %r16
	setx 0xcf0d1ded209d017a, %g1, %r17
	setx 0x33c5687f374af7af, %g1, %r18
	setx 0x6e53d953bc0125f9, %g1, %r19
	setx 0x6b56054710b56d30, %g1, %r20
	setx 0xab344ed4df1ab72b, %g1, %r21
	setx 0x84afb10a554ff642, %g1, %r22
	setx 0x02238a486a9cfee1, %g1, %r23
	setx 0x45834e720484162d, %g1, %r24
	setx 0x4693c1de9937f0cb, %g1, %r25
	setx 0xf126723052782a29, %g1, %r26
	setx 0x00a4da3d7087c22d, %g1, %r27
	setx 0x5a2c674b46a8f21e, %g1, %r28
	setx 0x4395515284a1ca8d, %g1, %r29
	setx 0xb3c20faada0bc73d, %g1, %r30
	setx 0xe8aab1f71064d4bf, %g1, %r31
	save
	setx 0x344a733415d2254d, %g1, %r16
	setx 0x98c363ffcc6be176, %g1, %r17
	setx 0x95eece52fded8e77, %g1, %r18
	setx 0x0e820600f182d7e2, %g1, %r19
	setx 0x2d1f98a219152779, %g1, %r20
	setx 0xfa099efa5f77b9e4, %g1, %r21
	setx 0xdb202bdcc35e52b9, %g1, %r22
	setx 0x532a1550c13a4815, %g1, %r23
	setx 0xf7a82ba54442f60e, %g1, %r24
	setx 0x24fabc7c5b2d4312, %g1, %r25
	setx 0x1e7955cd634f02e2, %g1, %r26
	setx 0x9a9bc833d46eaeb8, %g1, %r27
	setx 0xa81a302aefe9a7dc, %g1, %r28
	setx 0xc02464cc949afee1, %g1, %r29
	setx 0x7363f320042e7704, %g1, %r30
	setx 0x87035a325e2b3b95, %g1, %r31
	save
	setx 0xe695c49a494b22ba, %g1, %r16
	setx 0x70502bdcb2342831, %g1, %r17
	setx 0x3e40ebe7a46d931c, %g1, %r18
	setx 0x1dda602951b40f67, %g1, %r19
	setx 0xd1248125f0b77976, %g1, %r20
	setx 0x21958bc372640f7a, %g1, %r21
	setx 0x441a25dc7a19f063, %g1, %r22
	setx 0x2caedc1a04d0f1d2, %g1, %r23
	setx 0x4ca2ef4aec99cb83, %g1, %r24
	setx 0x25674051026e2acb, %g1, %r25
	setx 0x2e68fb86fe822ee9, %g1, %r26
	setx 0x834838f34a2a8e62, %g1, %r27
	setx 0x20b9566b903b4f6f, %g1, %r28
	setx 0xdb38b9f7fd90114d, %g1, %r29
	setx 0xccaf9ac8a6195ea4, %g1, %r30
	setx 0x5e6daad11651a747, %g1, %r31
	save
	setx 0xe191de8302df1f96, %g1, %r16
	setx 0x87368bbbdcf45a36, %g1, %r17
	setx 0x434d8fac2f3be267, %g1, %r18
	setx 0xf696c76f2b840cc5, %g1, %r19
	setx 0x98cc7c7f0fb0576a, %g1, %r20
	setx 0x1cbe9ae75b2a6dba, %g1, %r21
	setx 0x7ada41271e3eb485, %g1, %r22
	setx 0x9143bc78ec4149bc, %g1, %r23
	setx 0xb042ddc56bed8be9, %g1, %r24
	setx 0xe021dbb7fd467617, %g1, %r25
	setx 0x42f6b7fa67f5fec0, %g1, %r26
	setx 0xef362a36ed9ba4a2, %g1, %r27
	setx 0x94c6b0a028c34080, %g1, %r28
	setx 0x3907b55b8a82603b, %g1, %r29
	setx 0x999ee2cb4e46776a, %g1, %r30
	setx 0x1617aa15199ee60d, %g1, %r31
	ta	%icc, T_CHANGE_HPRIV
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
	.word 0xb1e4e1bc  ! 1: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e52043  ! 3: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e461a0  ! 7: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e460c4  ! 15: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_0, %g1, %r16
	setx	data_start_5, %g1, %r21
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 18)
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbd510000  ! 27: RDPR_TICK	<illegal instruction>
	.word 0xb7e42111  ! 28: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde46094  ! 35: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbb51c000  ! 38: RDPR_TL	<illegal instruction>
	.word 0xbbe42091  ! 40: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe4a0d6  ! 46: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5a14b  ! 47: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e561d0  ! 51: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8794a1d0  ! 52: WRPR_TT_I	wrpr	%r18, 0x01d0, %tt
	.word 0x879461e8  ! 63: WRPR_TT_I	wrpr	%r17, 0x01e8, %tt
	.word 0xb1e42131  ! 64: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 3)
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe5210b  ! 72: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb00da0a5  ! 78: AND_I	and 	%r22, 0x00a5, %r24
	.word 0xbde5a039  ! 79: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb044615b  ! 80: ADDC_I	addc 	%r17, 0x015b, %r24
	.word 0xb1e521b3  ! 81: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe5e10c  ! 91: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb151c000  ! 92: RDPR_TL	<illegal instruction>
	.word 0xb7510000  ! 97: RDPR_TICK	<illegal instruction>
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 25)
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 22)
	.word 0xbe35a014  ! 104: SUBC_I	orn 	%r22, 0x0014, %r31
	.word 0xb3508000  ! 106: RDPR_TSTATE	<illegal instruction>
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 35)
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, e)
	mov	2, %r12
	.word 0xa1930000  ! 110: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb82d4000  ! 111: ANDN_R	andn 	%r21, %r0, %r28
	.word 0x8d94e1ec  ! 113: WRPR_PSTATE_I	wrpr	%r19, 0x01ec, %pstate
	.word 0xbf500000  ! 114: RDPR_TPC	<illegal instruction>
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 22)
	.word 0xbab48000  ! 119: ORNcc_R	orncc 	%r18, %r0, %r29
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb1e52027  ! 123: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7540000  ! 127: RDPR_GL	<illegal instruction>
	.word 0xb5343001  ! 130: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xb5e4216b  ! 134: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8594609f  ! 139: WRPR_TSTATE_I	wrpr	%r17, 0x009f, %tstate
	.word 0xb9e561aa  ! 140: SAVE_I	save	%r21, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 144: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e5a1ee  ! 148: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbf500000  ! 150: RDPR_TPC	<illegal instruction>
	.word 0xbbe520cc  ! 154: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbf641800  ! 156: MOVcc_R	<illegal instruction>
	.word 0xb7e4e18b  ! 157: SAVE_I	save	%r19, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb57ce401  ! 160: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xb3e521a3  ! 162: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde560c7  ! 163: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7641800  ! 164: MOVcc_R	<illegal instruction>
	.word 0xbde4a149  ! 165: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x325a64390000094d, %g1, %r10
	.word 0x819a8000  ! 170: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x666032e200004a12, %g1, %r10
	.word 0x839a8000  ! 171: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xb4901a6900006fc9, %g1, %r10
	.word 0x839a8000  ! 172: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e560ec  ! 173: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb224e0c9  ! 175: SUB_I	sub 	%r19, 0x00c9, %r25
	.word 0xb2b5c000  ! 176: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xb77c0400  ! 177: MOVR_R	movre	%r16, %r0, %r27
	.word 0xb5e4e0b2  ! 178: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a1fa  ! 182: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8794215e  ! 184: WRPR_TT_I	wrpr	%r16, 0x015e, %tt
	.word 0xbd51c000  ! 185: RDPR_TL	<illegal instruction>
	.word 0xb1508000  ! 187: RDPR_TSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r21
	.word 0xb7e5e062  ! 194: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e46072  ! 196: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5504000  ! 197: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5e14d  ! 198: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5a074  ! 201: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde5e16e  ! 203: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e4217c  ! 205: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe52004  ! 207: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5e10b  ! 209: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbd51c000  ! 214: RDPR_TL	<illegal instruction>
	.word 0xbbe4e127  ! 215: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb48d6089  ! 219: ANDcc_I	andcc 	%r21, 0x0089, %r26
	.word 0xb3e46109  ! 220: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x9194a1ea  ! 221: WRPR_PIL_I	wrpr	%r18, 0x01ea, %pil
	.word 0xbbe5616d  ! 222: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_1, %g1, %r20
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbde4e131  ! 227: SAVE_I	save	%r19, 0x0001, %r30
	setx	0xa18fcc8b00003fcc, %g1, %r10
	.word 0x819a8000  ! 228: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe4a0d2  ! 234: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb12d1000  ! 235: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xb1e5200c  ! 239: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe4e1e2  ! 241: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe561b8  ! 242: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 6)
	setx	data_start_2, %g1, %r23
	.word 0xbb504000  ! 246: RDPR_TNPC	<illegal instruction>
	setx	0xf8bcd3b000002f0c, %g1, %r10
	.word 0x839a8000  ! 254: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9500000  ! 257: RDPR_TPC	<illegal instruction>
	.word 0xbc442182  ! 261: ADDC_I	addc 	%r16, 0x0182, %r30
	.word 0xb9e4a13b  ! 266: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb4a58000  ! 269: SUBcc_R	subcc 	%r22, %r0, %r26
	.word 0xbde5213e  ! 270: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe56120  ! 273: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e5a175  ! 274: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_5, %g1, %r19
	.word 0xb21d6038  ! 278: XOR_I	xor 	%r21, 0x0038, %r25
	.word 0xb01461ff  ! 281: OR_I	or 	%r17, 0x01ff, %r24
	.word 0xbbe5a1c0  ! 286: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e5a15a  ! 289: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe5e0ef  ! 292: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd508000  ! 293: RDPR_TSTATE	<illegal instruction>
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e421a3  ! 297: SAVE_I	save	%r16, 0x0001, %r25
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe461c5  ! 304: SAVE_I	save	%r17, 0x0001, %r31
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 2d)
	.word 0x8995e0cd  ! 309: WRPR_TICK_I	wrpr	%r23, 0x00cd, %tick
	.word 0xba44e1f5  ! 315: ADDC_I	addc 	%r19, 0x01f5, %r29
	.word 0xb9e42044  ! 316: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8994e0d9  ! 319: WRPR_TICK_I	wrpr	%r19, 0x00d9, %tick
	.word 0xb92c8000  ! 322: SLL_R	sll 	%r18, %r0, %r28
	.word 0xb5e520f0  ! 323: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5a16d  ! 324: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5e1ad  ! 329: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4e108  ! 334: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e46163  ! 339: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e46088  ! 340: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb235e049  ! 345: SUBC_I	orn 	%r23, 0x0049, %r25
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 29)
	.word 0xbe1d8000  ! 348: XOR_R	xor 	%r22, %r0, %r31
	.word 0xb1510000  ! 350: RDPR_TICK	<illegal instruction>
	.word 0xbbe460ff  ! 354: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde460cb  ! 355: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e56059  ! 357: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, b)
	.word 0xbbe4a1df  ! 363: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e52193  ! 365: SAVE_I	save	%r20, 0x0001, %r25
	setx	0xbd57026000002f1b, %g1, %r10
	.word 0x839a8000  ! 368: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x919521b4  ! 369: WRPR_PIL_I	wrpr	%r20, 0x01b4, %pil
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e4e1ea  ! 374: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8d9421a3  ! 375: WRPR_PSTATE_I	wrpr	%r16, 0x01a3, %pstate
	.word 0xb42c61ea  ! 376: ANDN_I	andn 	%r17, 0x01ea, %r26
	.word 0xbbe5a137  ! 378: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e4e00a  ! 382: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e5e02f  ! 383: SAVE_I	save	%r23, 0x0001, %r26
	setx	0x78aeacb500001a57, %g1, %r10
	.word 0x819a8000  ! 387: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 6)
	.word 0xb7e5e0d1  ! 390: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe4e12b  ! 393: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbeb4a0ad  ! 394: SUBCcc_I	orncc 	%r18, 0x00ad, %r31
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9e56128  ! 403: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe5607d  ! 406: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e5a153  ! 407: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5e024  ! 411: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8d94619a  ! 412: WRPR_PSTATE_I	wrpr	%r17, 0x019a, %pstate
	.word 0xb9e4a15d  ! 413: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4a0e0  ! 416: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e56058  ! 419: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e42177  ! 421: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb02ca083  ! 422: ANDN_I	andn 	%r18, 0x0083, %r24
	.word 0xb7e5e1f3  ! 426: SAVE_I	save	%r23, 0x0001, %r27
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde4a079  ! 434: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe560d1  ! 435: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbd51c000  ! 439: RDPR_TL	<illegal instruction>
	.word 0xb73d2001  ! 443: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xb3e42023  ! 444: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5e02b  ! 445: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb32ca001  ! 448: SLL_I	sll 	%r18, 0x0001, %r25
	.word 0xb5480000  ! 453: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbbe42107  ! 458: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e46045  ! 463: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5603d  ! 469: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e5208d  ! 473: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbf480000  ! 475: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	data_start_5, %g1, %r18
	.word 0xbde5216f  ! 480: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x87942101  ! 484: WRPR_TT_I	wrpr	%r16, 0x0101, %tt
	.word 0xb2340000  ! 486: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xbc346045  ! 487: SUBC_I	orn 	%r17, 0x0045, %r30
	.word 0xb3e4e1b4  ! 489: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbc8d2150  ! 492: ANDcc_I	andcc 	%r20, 0x0150, %r30
	.word 0xb1e460e3  ! 494: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb550c000  ! 495: RDPR_TT	<illegal instruction>
	.word 0xb9e5a014  ! 500: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe46054  ! 502: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5a119  ! 508: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5540000  ! 509: RDPR_GL	<illegal instruction>
	.word 0x85946008  ! 511: WRPR_TSTATE_I	wrpr	%r17, 0x0008, %tstate
	.word 0xbf540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xb3510000  ! 518: RDPR_TICK	<illegal instruction>
	.word 0xb09da0d8  ! 521: XORcc_I	xorcc 	%r22, 0x00d8, %r24
	.word 0xbfe4a157  ! 522: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x8d1b1ac0000a983, %g1, %r10
	.word 0x819a8000  ! 524: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_3, %g1, %r19
	.word 0xbbe56018  ! 527: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 15)
	mov	2, %r12
	.word 0x8f930000  ! 534: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2c)
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 39)
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 33)
	.word 0xbbe5e1ad  ! 547: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde52115  ! 551: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xb0a5e1cb  ! 556: SUBcc_I	subcc 	%r23, 0x01cb, %r24
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e5e0d7  ! 564: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4e02c  ! 575: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7480000  ! 576: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5e46023  ! 578: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e4e115  ! 580: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8d95a18d  ! 581: WRPR_PSTATE_I	wrpr	%r22, 0x018d, %pstate
	.word 0x8995e07c  ! 584: WRPR_TICK_I	wrpr	%r23, 0x007c, %tick
	.word 0xb550c000  ! 588: RDPR_TT	<illegal instruction>
	.word 0xb3e561ef  ! 589: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e5e0bc  ! 590: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbab560d1  ! 592: ORNcc_I	orncc 	%r21, 0x00d1, %r29
	.word 0xb81da0e5  ! 594: XOR_I	xor 	%r22, 0x00e5, %r28
	.word 0xbbe52045  ! 595: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbabd8000  ! 596: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xb3480000  ! 597: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbac5c000  ! 598: ADDCcc_R	addccc 	%r23, %r0, %r29
	mov	2, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe420b4  ! 600: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb3cd000  ! 602: SRAX_R	srax	%r19, %r0, %r29
	setx	0xfb8da4f900007d0d, %g1, %r10
	.word 0x819a8000  ! 607: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb480000  ! 612: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde4a1e6  ! 618: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe5a164  ! 619: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5a069  ! 622: SAVE_I	save	%r22, 0x0001, %r31
	setx	0xce6a8f2600002993, %g1, %r10
	.word 0x839a8000  ! 625: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e4e05b  ! 632: SAVE_I	save	%r19, 0x0001, %r26
	setx	data_start_0, %g1, %r20
	.word 0xb9e5e1d5  ! 636: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe520ce  ! 642: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbb504000  ! 644: RDPR_TNPC	<illegal instruction>
	.word 0xbfe4a09d  ! 645: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb750c000  ! 647: RDPR_TT	<illegal instruction>
	.word 0xbde56133  ! 651: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde5219a  ! 653: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xba4560a9  ! 654: ADDC_I	addc 	%r21, 0x00a9, %r29
	.word 0xb82d4000  ! 658: ANDN_R	andn 	%r21, %r0, %r28
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 23)
	.word 0xb1e5e030  ! 661: SAVE_I	save	%r23, 0x0001, %r24
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 3f)
	setx	0x4bf1a4d90000388f, %g1, %r10
	.word 0x839a8000  ! 663: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc3ce19c  ! 665: XNOR_I	xnor 	%r19, 0x019c, %r30
	.word 0xb351c000  ! 671: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e5214a  ! 675: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_4, %g1, %r16
	.word 0xb7510000  ! 682: RDPR_TICK	<illegal instruction>
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 2a)
	setx	data_start_3, %g1, %r16
	.word 0xbbe5a1c7  ! 689: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5a0ff  ! 691: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4a057  ! 695: SAVE_I	save	%r18, 0x0001, %r25
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 18)
	.word 0xbe1dc000  ! 704: XOR_R	xor 	%r23, %r0, %r31
	.word 0xb5e56036  ! 706: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e52066  ! 711: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd500000  ! 712: RDPR_TPC	<illegal instruction>
	.word 0xbf520000  ! 713: RDPR_PIL	<illegal instruction>
	.word 0xb23da1f4  ! 717: XNOR_I	xnor 	%r22, 0x01f4, %r25
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe42158  ! 721: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e4200d  ! 723: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e460fd  ! 724: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbc95c000  ! 726: ORcc_R	orcc 	%r23, %r0, %r30
	.word 0xb1e4e190  ! 728: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb33df001  ! 729: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xb52d2001  ! 731: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xb5508000  ! 732: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e0a1  ! 734: WRPR_TSTATE_I	wrpr	%r23, 0x00a1, %tstate
	.word 0xbde46033  ! 738: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde461f7  ! 740: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd510000  ! 742: RDPR_TICK	<illegal instruction>
	.word 0xb5e561f3  ! 743: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 11)
	.word 0xbd540000  ! 748: RDPR_GL	<illegal instruction>
	.word 0xb1e4e03a  ! 751: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde420f1  ! 752: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5203a  ! 755: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe5202f  ! 760: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe5a073  ! 763: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e5a0c5  ! 767: SAVE_I	save	%r22, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 769: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb73d5000  ! 772: SRAX_R	srax	%r21, %r0, %r27
	.word 0xbb643801  ! 781: MOVcc_I	<illegal instruction>
	.word 0xbbe5a02c  ! 788: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e461c5  ! 790: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e460d7  ! 794: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e56133  ! 800: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e4a12c  ! 801: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe5a065  ! 802: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e4e13c  ! 803: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a1c2  ! 804: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4e045  ! 805: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe42055  ! 807: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e520ef  ! 809: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7480000  ! 812: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb425c000  ! 816: SUB_R	sub 	%r23, %r0, %r26
	setx	data_start_7, %g1, %r19
	.word 0x919521c3  ! 827: WRPR_PIL_I	wrpr	%r20, 0x01c3, %pil
	.word 0xbfe5a17b  ! 830: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1508000  ! 831: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4a044  ! 832: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4e1ee  ! 834: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xbde460b9  ! 836: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbf540000  ! 838: RDPR_GL	<illegal instruction>
	.word 0xbde520a7  ! 839: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0x8f930000  ! 841: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x81942109  ! 846: WRPR_TPC_I	wrpr	%r16, 0x0109, %tpc
	.word 0x8594616f  ! 851: WRPR_TSTATE_I	wrpr	%r17, 0x016f, %tstate
	.word 0xb5e4a146  ! 856: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e56143  ! 858: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x8994e094  ! 861: WRPR_TICK_I	wrpr	%r19, 0x0094, %tick
	.word 0xb43c8000  ! 867: XNOR_R	xnor 	%r18, %r0, %r26
	.word 0xb3e5617a  ! 868: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbbe4a1f2  ! 875: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4e038  ! 878: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x859520a6  ! 882: WRPR_TSTATE_I	wrpr	%r20, 0x00a6, %tstate
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 27)
	.word 0x8194a08d  ! 886: WRPR_TPC_I	wrpr	%r18, 0x008d, %tpc
	.word 0xbfe5618f  ! 887: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e5209b  ! 889: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e4e001  ! 890: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e4611d  ! 897: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb2c5c000  ! 899: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xbb540000  ! 900: RDPR_GL	<illegal instruction>
	.word 0xb28ce122  ! 903: ANDcc_I	andcc 	%r19, 0x0122, %r25
	.word 0xb9e5e02b  ! 905: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 25)
	.word 0xbd518000  ! 907: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4e151  ! 909: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e4a014  ! 910: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e5e07f  ! 912: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb8b54000  ! 914: ORNcc_R	orncc 	%r21, %r0, %r28
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 1e)
	.word 0x83952074  ! 918: WRPR_TNPC_I	wrpr	%r20, 0x0074, %tnpc
	.word 0xbb480000  ! 919: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb151c000  ! 923: RDPR_TL	<illegal instruction>
	.word 0xb3540000  ! 924: RDPR_GL	<illegal instruction>
	.word 0xbd643801  ! 925: MOVcc_I	<illegal instruction>
	.word 0xb151c000  ! 926: RDPR_TL	<illegal instruction>
	.word 0xbbe460ef  ! 930: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x85952190  ! 931: WRPR_TSTATE_I	wrpr	%r20, 0x0190, %tstate
	.word 0xbd540000  ! 936: RDPR_GL	<illegal instruction>
	.word 0xb3e5206f  ! 938: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5604a  ! 940: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8d95a03c  ! 946: WRPR_PSTATE_I	wrpr	%r22, 0x003c, %pstate
	.word 0xb9e5a07c  ! 947: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4e003  ! 948: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5a119  ! 949: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e5e08e  ! 951: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e461f3  ! 953: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 1e)
	setx	0xe179312f00002d85, %g1, %r10
	.word 0x839a8000  ! 960: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e4e0d7  ! 961: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 36)
	.word 0xbd504000  ! 965: RDPR_TNPC	<illegal instruction>
	.word 0xb23c6185  ! 968: XNOR_I	xnor 	%r17, 0x0185, %r25
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 13)
	.word 0xb1e5a04d  ! 974: SAVE_I	save	%r22, 0x0001, %r24
	mov	2, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e4e06d  ! 984: SAVE_I	save	%r19, 0x0001, %r25
	setx	data_start_2, %g1, %r16
	.word 0xb62da1f1  ! 989: ANDN_I	andn 	%r22, 0x01f1, %r27
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e4a16b  ! 991: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e179  ! 993: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8d94619f  ! 995: WRPR_PSTATE_I	wrpr	%r17, 0x019f, %pstate
	.word 0xbbe5e185  ! 997: SAVE_I	save	%r23, 0x0001, %r29
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
	.word 0xf435c000  ! 4: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf33d603f  ! 5: STDF_I	std	%f25, [0x003f, %r21]
	.word 0xf474a05a  ! 6: STX_I	stx	%r26, [%r18 + 0x005a]
	.word 0xf675e0ea  ! 8: STX_I	stx	%r27, [%r23 + 0x00ea]
	.word 0xf83de0b3  ! 12: STD_I	std	%r28, [%r23 + 0x00b3]
	.word 0xf83d8000  ! 16: STD_R	std	%r28, [%r22 + %r0]
	.word 0xf625a033  ! 18: STW_I	stw	%r27, [%r22 + 0x0033]
	setx	data_start_3, %g1, %r16
	.word 0xfe2c0000  ! 20: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf82560f7  ! 21: STW_I	stw	%r28, [%r21 + 0x00f7]
	setx	data_start_3, %g1, %r19
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 34)
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 23)
	.word 0xff3cc000  ! 26: STDF_R	std	%f31, [%r0, %r19]
	.word 0xbd510000  ! 27: RDPR_TICK	rdpr	%tick, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2da1f3  ! 31: STB_I	stb	%r30, [%r22 + 0x01f3]
	.word 0xff3ce0e9  ! 33: STDF_I	std	%f31, [0x00e9, %r19]
	.word 0xbf51c000  ! 38: RDPR_TL	<illegal instruction>
	.word 0xf62561a5  ! 42: STW_I	stw	%r27, [%r21 + 0x01a5]
	.word 0xf33d0000  ! 44: STDF_R	std	%f25, [%r0, %r20]
	.word 0xf0748000  ! 48: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf875601a  ! 49: STX_I	stx	%r28, [%r21 + 0x001a]
	.word 0x8795e1fa  ! 52: WRPR_TT_I	wrpr	%r23, 0x01fa, %tt
	.word 0xf03d4000  ! 53: STD_R	std	%r24, [%r21 + %r0]
	.word 0xf825614c  ! 54: STW_I	stw	%r28, [%r21 + 0x014c]
	.word 0xfe75c000  ! 55: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfa75c000  ! 58: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf8758000  ! 62: STX_R	stx	%r28, [%r22 + %r0]
	.word 0x8794e184  ! 63: WRPR_TT_I	wrpr	%r19, 0x0184, %tt
	.word 0xfc2ca105  ! 65: STB_I	stb	%r30, [%r18 + 0x0105]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 4)
	.word 0xf834e088  ! 69: STH_I	sth	%r28, [%r19 + 0x0088]
	.word 0xfb3c4000  ! 70: STDF_R	std	%f29, [%r0, %r17]
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 29)
	.word 0xf62cc000  ! 73: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf43c4000  ! 75: STD_R	std	%r26, [%r17 + %r0]
	.word 0xfa758000  ! 76: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xbc0d211d  ! 78: AND_I	and 	%r20, 0x011d, %r30
	.word 0xb045a1c9  ! 80: ADDC_I	addc 	%r22, 0x01c9, %r24
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 1)
	.word 0xf73c613d  ! 87: STDF_I	std	%f27, [0x013d, %r17]
	.word 0xb951c000  ! 92: RDPR_TL	rdpr	%tl, %r28
	.word 0xf624c000  ! 94: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xbb510000  ! 97: RDPR_TICK	<illegal instruction>
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 5)
	.word 0xf43c20c1  ! 100: STD_I	std	%r26, [%r16 + 0x00c1]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 15)
	.word 0xb63561b0  ! 104: SUBC_I	orn 	%r21, 0x01b0, %r27
	.word 0xb3508000  ! 106: RDPR_TSTATE	<illegal instruction>
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 1b)
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, c)
	mov	2, %r12
	.word 0xa1930000  ! 110: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb02c8000  ! 111: ANDN_R	andn 	%r18, %r0, %r24
	.word 0xf475e073  ! 112: STX_I	stx	%r26, [%r23 + 0x0073]
	.word 0x8d94a082  ! 113: WRPR_PSTATE_I	wrpr	%r18, 0x0082, %pstate
	.word 0xb1500000  ! 114: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfc35a0f6  ! 116: STH_I	sth	%r30, [%r22 + 0x00f6]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 3)
	.word 0xff3d6123  ! 118: STDF_I	std	%f31, [0x0123, %r21]
	.word 0xb4b58000  ! 119: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xfa254000  ! 120: STW_R	stw	%r29, [%r21 + %r0]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf03c610d  ! 124: STD_I	std	%r24, [%r17 + 0x010d]
	.word 0xf63ca0e1  ! 125: STD_I	std	%r27, [%r18 + 0x00e1]
	.word 0xf33d4000  ! 126: STDF_R	std	%f25, [%r0, %r21]
	.word 0xbf540000  ! 127: RDPR_GL	<illegal instruction>
	.word 0xb7353001  ! 130: SRLX_I	srlx	%r20, 0x0001, %r27
	.word 0xfa3460e1  ! 131: STH_I	sth	%r29, [%r17 + 0x00e1]
	.word 0xf4354000  ! 133: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf23c0000  ! 135: STD_R	std	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf63ce1eb  ! 137: STD_I	std	%r27, [%r19 + 0x01eb]
	.word 0x859460d1  ! 139: WRPR_TSTATE_I	wrpr	%r17, 0x00d1, %tstate
	.word 0xf22c603d  ! 143: STB_I	stb	%r25, [%r17 + 0x003d]
	mov	2, %r12
	.word 0x8f930000  ! 144: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf82d4000  ! 146: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfe25e080  ! 149: STW_I	stw	%r31, [%r23 + 0x0080]
	.word 0xb5500000  ! 150: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf13d200f  ! 153: STDF_I	std	%f24, [0x000f, %r20]
	.word 0xb9641800  ! 156: MOVcc_R	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb77c6401  ! 160: MOVR_I	movre	%r17, 0x1, %r27
	.word 0xbb641800  ! 164: MOVcc_R	<illegal instruction>
	.word 0xf234e150  ! 167: STH_I	sth	%r25, [%r19 + 0x0150]
	.word 0xf13ca034  ! 168: STDF_I	std	%f24, [0x0034, %r18]
	setx	0xfb208bd400008bc3, %g1, %r10
	.word 0x819a8000  ! 170: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x728877b300001f85, %g1, %r10
	.word 0x839a8000  ! 171: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xb9e992a0000ad96, %g1, %r10
	.word 0x839a8000  ! 172: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb424a117  ! 175: SUB_I	sub 	%r18, 0x0117, %r26
	.word 0xb8b40000  ! 176: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xbf7dc400  ! 177: MOVR_R	movre	%r23, %r0, %r31
	.word 0xf22dc000  ! 179: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xfe24e1ad  ! 180: STW_I	stw	%r31, [%r19 + 0x01ad]
	.word 0x879560c7  ! 184: WRPR_TT_I	wrpr	%r21, 0x00c7, %tt
	.word 0xbd51c000  ! 185: RDPR_TL	rdpr	%tl, %r30
	.word 0xb7508000  ! 187: RDPR_TSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xfc244000  ! 189: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf02c2060  ! 191: STB_I	stb	%r24, [%r16 + 0x0060]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 39)
	.word 0xbf504000  ! 197: RDPR_TNPC	<illegal instruction>
	.word 0xf2240000  ! 206: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfe7461c7  ! 210: STX_I	stx	%r31, [%r17 + 0x01c7]
	.word 0xb151c000  ! 214: RDPR_TL	<illegal instruction>
	.word 0xf82cc000  ! 216: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xb08ce1bd  ! 219: ANDcc_I	andcc 	%r19, 0x01bd, %r24
	.word 0x91956027  ! 221: WRPR_PIL_I	wrpr	%r21, 0x0027, %pil
	setx	data_start_1, %g1, %r17
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 9)
	setx	0x98f6b2a20000384d, %g1, %r10
	.word 0x819a8000  ! 228: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf4744000  ! 230: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xb72cd000  ! 235: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xf23d0000  ! 236: STD_R	std	%r25, [%r20 + %r0]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 37)
	setx	data_start_4, %g1, %r18
	.word 0xbb504000  ! 246: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfe25c000  ! 247: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xf82cc000  ! 249: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf275e1c8  ! 250: STX_I	stx	%r25, [%r23 + 0x01c8]
	.word 0xfe748000  ! 251: STX_R	stx	%r31, [%r18 + %r0]
	setx	0xc8939d4000005b81, %g1, %r10
	.word 0x839a8000  ! 254: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf62520e1  ! 255: STW_I	stw	%r27, [%r20 + 0x00e1]
	.word 0xf03d0000  ! 256: STD_R	std	%r24, [%r20 + %r0]
	.word 0xb1500000  ! 257: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb844a04c  ! 261: ADDC_I	addc 	%r18, 0x004c, %r28
	.word 0xbaa54000  ! 269: SUBcc_R	subcc 	%r21, %r0, %r29
	.word 0xf02cc000  ! 275: STB_R	stb	%r24, [%r19 + %r0]
	setx	data_start_4, %g1, %r18
	.word 0xf62c8000  ! 277: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xb21d20f1  ! 278: XOR_I	xor 	%r20, 0x00f1, %r25
	.word 0xfa2c0000  ! 280: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xba15e06e  ! 281: OR_I	or 	%r23, 0x006e, %r29
	.word 0xfa344000  ! 290: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb3508000  ! 293: RDPR_TSTATE	<illegal instruction>
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 37)
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 31)
	.word 0xfc74c000  ! 300: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf82da079  ! 303: STB_I	stb	%r28, [%r22 + 0x0079]
	.word 0xf62cc000  ! 305: STB_R	stb	%r27, [%r19 + %r0]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 14)
	.word 0x8995615e  ! 309: WRPR_TICK_I	wrpr	%r21, 0x015e, %tick
	.word 0xfa74a07d  ! 314: STX_I	stx	%r29, [%r18 + 0x007d]
	.word 0xb6442067  ! 315: ADDC_I	addc 	%r16, 0x0067, %r27
	.word 0x8995a069  ! 319: WRPR_TICK_I	wrpr	%r22, 0x0069, %tick
	.word 0xfc744000  ! 321: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xbf2d8000  ! 322: SLL_R	sll 	%r22, %r0, %r31
	.word 0xf8750000  ! 328: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xf225a173  ! 330: STW_I	stw	%r25, [%r22 + 0x0173]
	.word 0xf074e11b  ! 333: STX_I	stx	%r24, [%r19 + 0x011b]
	.word 0xfa3c2125  ! 335: STD_I	std	%r29, [%r16 + 0x0125]
	.word 0xfe24c000  ! 336: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf835a178  ! 344: STH_I	sth	%r28, [%r22 + 0x0178]
	.word 0xb63520ea  ! 345: SUBC_I	orn 	%r20, 0x00ea, %r27
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 32)
	.word 0xb41c0000  ! 348: XOR_R	xor 	%r16, %r0, %r26
	.word 0xbf510000  ! 350: RDPR_TICK	rdpr	%tick, %r31
	.word 0xfe24215d  ! 351: STW_I	stw	%r31, [%r16 + 0x015d]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 29)
	setx	0x31717aa200008fc7, %g1, %r10
	.word 0x839a8000  ! 368: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x91952038  ! 369: WRPR_PIL_I	wrpr	%r20, 0x0038, %pil
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 9)
	.word 0xfe2d4000  ! 373: STB_R	stb	%r31, [%r21 + %r0]
	.word 0x8d95e16d  ! 375: WRPR_PSTATE_I	wrpr	%r23, 0x016d, %pstate
	.word 0xbe2ce018  ! 376: ANDN_I	andn 	%r19, 0x0018, %r31
	.word 0xf42c200b  ! 377: STB_I	stb	%r26, [%r16 + 0x000b]
	.word 0xf82de128  ! 385: STB_I	stb	%r28, [%r23 + 0x0128]
	.word 0xf024e19b  ! 386: STW_I	stw	%r24, [%r19 + 0x019b]
	setx	0xecec554e00005b18, %g1, %r10
	.word 0x819a8000  ! 387: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfc354000  ! 391: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xb4b421f8  ! 394: SUBCcc_I	orncc 	%r16, 0x01f8, %r26
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 29)
	.word 0xf23d618e  ! 402: STD_I	std	%r25, [%r21 + 0x018e]
	.word 0xf83c0000  ! 404: STD_R	std	%r28, [%r16 + %r0]
	.word 0xfe2420fc  ! 409: STW_I	stw	%r31, [%r16 + 0x00fc]
	.word 0x8d94e1a1  ! 412: WRPR_PSTATE_I	wrpr	%r19, 0x01a1, %pstate
	.word 0xf62cc000  ! 420: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xb62ca1ab  ! 422: ANDN_I	andn 	%r18, 0x01ab, %r27
	.word 0xf8746161  ! 428: STX_I	stx	%r28, [%r17 + 0x0161]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 9)
	.word 0xfe354000  ! 431: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf13c4000  ! 436: STDF_R	std	%f24, [%r0, %r17]
	.word 0xb551c000  ! 439: RDPR_TL	rdpr	%tl, %r26
	.word 0xf33de155  ! 441: STDF_I	std	%f25, [0x0155, %r23]
	.word 0xb53d6001  ! 443: SRA_I	sra 	%r21, 0x0001, %r26
	.word 0xb32c6001  ! 448: SLL_I	sll 	%r17, 0x0001, %r25
	.word 0xfa2c0000  ! 449: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xb9480000  ! 453: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfa24e00b  ! 454: STW_I	stw	%r29, [%r19 + 0x000b]
	.word 0xf02da137  ! 459: STB_I	stb	%r24, [%r22 + 0x0137]
	.word 0xf33ce19d  ! 460: STDF_I	std	%f25, [0x019d, %r19]
	.word 0xf4248000  ! 462: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xfa2c61b1  ! 468: STB_I	stb	%r29, [%r17 + 0x01b1]
	.word 0xf625a112  ! 474: STW_I	stw	%r27, [%r22 + 0x0112]
	.word 0xbf480000  ! 475: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	data_start_6, %g1, %r18
	.word 0xfc25c000  ! 483: STW_R	stw	%r30, [%r23 + %r0]
	.word 0x8795a0ed  ! 484: WRPR_TT_I	wrpr	%r22, 0x00ed, %tt
	.word 0xb0348000  ! 486: SUBC_R	orn 	%r18, %r0, %r24
	.word 0xbc346048  ! 487: SUBC_I	orn 	%r17, 0x0048, %r30
	.word 0xbe8d2063  ! 492: ANDcc_I	andcc 	%r20, 0x0063, %r31
	.word 0xb750c000  ! 495: RDPR_TT	rdpr	%tt, %r27
	.word 0xf82d216b  ! 497: STB_I	stb	%r28, [%r20 + 0x016b]
	.word 0xf8258000  ! 499: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xf62d0000  ! 507: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xb7540000  ! 509: RDPR_GL	<illegal instruction>
	.word 0x85956109  ! 511: WRPR_TSTATE_I	wrpr	%r21, 0x0109, %tstate
	.word 0xfe250000  ! 513: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xff3cc000  ! 515: STDF_R	std	%f31, [%r0, %r19]
	.word 0xb3540000  ! 517: RDPR_GL	rdpr	%-, %r25
	.word 0xbb510000  ! 518: RDPR_TICK	<illegal instruction>
	.word 0xfa25612d  ! 520: STW_I	stw	%r29, [%r21 + 0x012d]
	.word 0xbc9ca004  ! 521: XORcc_I	xorcc 	%r18, 0x0004, %r30
	setx	0x42698e0100000c4b, %g1, %r10
	.word 0x819a8000  ! 524: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf874e177  ! 525: STX_I	stx	%r28, [%r19 + 0x0177]
	setx	data_start_7, %g1, %r20
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 3)
	.word 0xf82ce1ca  ! 530: STB_I	stb	%r28, [%r19 + 0x01ca]
	mov	2, %r12
	.word 0x8f930000  ! 534: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 3a)
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfa3d4000  ! 538: STD_R	std	%r29, [%r21 + %r0]
	.word 0xf635c000  ! 541: STH_R	sth	%r27, [%r23 + %r0]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 1)
	.word 0xf075a0a9  ! 544: STX_I	stx	%r24, [%r22 + 0x00a9]
	.word 0xf425e1c8  ! 545: STW_I	stw	%r26, [%r23 + 0x01c8]
	.word 0xbd504000  ! 555: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xb6a46096  ! 556: SUBcc_I	subcc 	%r17, 0x0096, %r27
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 36)
	.word 0xfb3ce101  ! 561: STDF_I	std	%f29, [0x0101, %r19]
	.word 0xfd3de11a  ! 569: STDF_I	std	%f30, [0x011a, %r23]
	.word 0xf23c8000  ! 572: STD_R	std	%r25, [%r18 + %r0]
	.word 0xf475e08d  ! 573: STX_I	stx	%r26, [%r23 + 0x008d]
	.word 0xf42c0000  ! 574: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xb7480000  ! 576: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfa2c6028  ! 577: STB_I	stb	%r29, [%r17 + 0x0028]
	.word 0xfa252113  ! 579: STW_I	stw	%r29, [%r20 + 0x0113]
	.word 0x8d95e191  ! 581: WRPR_PSTATE_I	wrpr	%r23, 0x0191, %pstate
	.word 0xf87461cc  ! 583: STX_I	stx	%r28, [%r17 + 0x01cc]
	.word 0x8994e14a  ! 584: WRPR_TICK_I	wrpr	%r19, 0x014a, %tick
	.word 0xfc254000  ! 587: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xbd50c000  ! 588: RDPR_TT	rdpr	%tt, %r30
	.word 0xf474e19a  ! 591: STX_I	stx	%r26, [%r19 + 0x019a]
	.word 0xbcb5e02b  ! 592: ORNcc_I	orncc 	%r23, 0x002b, %r30
	.word 0xbe1d60d9  ! 594: XOR_I	xor 	%r21, 0x00d9, %r31
	.word 0xbabc4000  ! 596: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xbf480000  ! 597: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbcc54000  ! 598: ADDCcc_R	addccc 	%r21, %r0, %r30
	mov	1, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb13d9000  ! 602: SRAX_R	srax	%r22, %r0, %r24
	.word 0xff3de031  ! 605: STDF_I	std	%f31, [0x0031, %r23]
	setx	0xebdbf62a0000490f, %g1, %r10
	.word 0x819a8000  ! 607: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf03d4000  ! 609: STD_R	std	%r24, [%r21 + %r0]
	.word 0xbd480000  ! 612: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfb3de179  ! 615: STDF_I	std	%f29, [0x0179, %r23]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 14)
	.word 0xf634a1b2  ! 617: STH_I	sth	%r27, [%r18 + 0x01b2]
	.word 0xfb3d60b4  ! 620: STDF_I	std	%f29, [0x00b4, %r21]
	.word 0xfd3c8000  ! 623: STDF_R	std	%f30, [%r0, %r18]
	.word 0xf93c2079  ! 624: STDF_I	std	%f28, [0x0079, %r16]
	setx	0xadee5a7400008d48, %g1, %r10
	.word 0x839a8000  ! 625: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf4256089  ! 629: STW_I	stw	%r26, [%r21 + 0x0089]
	.word 0xf03c0000  ! 630: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf0752094  ! 631: STX_I	stx	%r24, [%r20 + 0x0094]
	setx	data_start_6, %g1, %r21
	.word 0xf8744000  ! 640: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xfc7420e0  ! 643: STX_I	stx	%r30, [%r16 + 0x00e0]
	.word 0xb1504000  ! 644: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb950c000  ! 647: RDPR_TT	<illegal instruction>
	.word 0xb44461d7  ! 654: ADDC_I	addc 	%r17, 0x01d7, %r26
	.word 0xf53dc000  ! 657: STDF_R	std	%f26, [%r0, %r23]
	.word 0xbc2dc000  ! 658: ANDN_R	andn 	%r23, %r0, %r30
	.word 0xfe758000  ! 659: STX_R	stx	%r31, [%r22 + %r0]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, d)
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 11)
	setx	0x41512f4200005e40, %g1, %r10
	.word 0x839a8000  ! 663: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb23d6124  ! 665: XNOR_I	xnor 	%r21, 0x0124, %r25
	.word 0xbf51c000  ! 671: RDPR_TL	rdpr	%tl, %r31
	.word 0xf6340000  ! 672: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf225200d  ! 673: STW_I	stw	%r25, [%r20 + 0x000d]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_2, %g1, %r17
	.word 0xf73d4000  ! 678: STDF_R	std	%f27, [%r0, %r21]
	.word 0xfa3d0000  ! 679: STD_R	std	%r29, [%r20 + %r0]
	.word 0xbd510000  ! 682: RDPR_TICK	<illegal instruction>
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 12)
	setx	data_start_5, %g1, %r21
	.word 0xf62d61b0  ! 686: STB_I	stb	%r27, [%r21 + 0x01b0]
	.word 0xfc74e134  ! 694: STX_I	stx	%r30, [%r19 + 0x0134]
	.word 0xfe3d6133  ! 696: STD_I	std	%r31, [%r21 + 0x0133]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 5)
	.word 0xb01c0000  ! 704: XOR_R	xor 	%r16, %r0, %r24
	.word 0xfc24c000  ! 708: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xbf500000  ! 712: RDPR_TPC	<illegal instruction>
	.word 0xb5520000  ! 713: RDPR_PIL	<illegal instruction>
	.word 0xb63de19e  ! 717: XNOR_I	xnor 	%r23, 0x019e, %r27
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfc25e132  ! 725: STW_I	stw	%r30, [%r23 + 0x0132]
	.word 0xb2940000  ! 726: ORcc_R	orcc 	%r16, %r0, %r25
	.word 0xf4344000  ! 727: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xb33c7001  ! 729: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xbd2d2001  ! 731: SLL_I	sll 	%r20, 0x0001, %r30
	.word 0xb1508000  ! 732: RDPR_TSTATE	<illegal instruction>
	.word 0xfa7420ec  ! 733: STX_I	stx	%r29, [%r16 + 0x00ec]
	.word 0x859521b7  ! 734: WRPR_TSTATE_I	wrpr	%r20, 0x01b7, %tstate
	.word 0xfe75e152  ! 736: STX_I	stx	%r31, [%r23 + 0x0152]
	.word 0xb9510000  ! 742: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfe2da0e6  ! 744: STB_I	stb	%r31, [%r22 + 0x00e6]
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf4254000  ! 747: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xb7540000  ! 748: RDPR_GL	<illegal instruction>
	.word 0xf62ca057  ! 750: STB_I	stb	%r27, [%r18 + 0x0057]
	.word 0xf625e070  ! 758: STW_I	stw	%r27, [%r23 + 0x0070]
	.word 0xf73c6072  ! 764: STDF_I	std	%f27, [0x0072, %r17]
	.word 0xfc2da165  ! 768: STB_I	stb	%r30, [%r22 + 0x0165]
	mov	0, %r12
	.word 0x8f930000  ! 769: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb93c5000  ! 772: SRAX_R	srax	%r17, %r0, %r28
	.word 0xf0242157  ! 777: STW_I	stw	%r24, [%r16 + 0x0157]
	.word 0xf235a106  ! 779: STH_I	sth	%r25, [%r22 + 0x0106]
	.word 0xbd643801  ! 781: MOVcc_I	<illegal instruction>
	.word 0xfb3ca0a3  ! 787: STDF_I	std	%f29, [0x00a3, %r18]
	.word 0xf02420f5  ! 791: STW_I	stw	%r24, [%r16 + 0x00f5]
	.word 0xf824e105  ! 793: STW_I	stw	%r28, [%r19 + 0x0105]
	.word 0xf8758000  ! 797: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xfe24a083  ! 799: STW_I	stw	%r31, [%r18 + 0x0083]
	.word 0xf23c60be  ! 808: STD_I	std	%r25, [%r17 + 0x00be]
	.word 0xb3480000  ! 812: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf8244000  ! 815: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xb424c000  ! 816: SUB_R	sub 	%r19, %r0, %r26
	.word 0xfe2c4000  ! 817: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfa3c61a5  ! 821: STD_I	std	%r29, [%r17 + 0x01a5]
	.word 0xf4746157  ! 822: STX_I	stx	%r26, [%r17 + 0x0157]
	setx	data_start_0, %g1, %r23
	.word 0x9195605a  ! 827: WRPR_PIL_I	wrpr	%r21, 0x005a, %pil
	.word 0xfe254000  ! 828: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfe2ce0d8  ! 829: STB_I	stb	%r31, [%r19 + 0x00d8]
	.word 0xb7508000  ! 831: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb1500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xf33dc000  ! 837: STDF_R	std	%f25, [%r0, %r23]
	.word 0xbf540000  ! 838: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f930000  ! 841: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf53ca181  ! 843: STDF_I	std	%f26, [0x0181, %r18]
	.word 0x8194e086  ! 846: WRPR_TPC_I	wrpr	%r19, 0x0086, %tpc
	.word 0xf8744000  ! 847: STX_R	stx	%r28, [%r17 + %r0]
	.word 0x8595e06a  ! 851: WRPR_TSTATE_I	wrpr	%r23, 0x006a, %tstate
	.word 0xfc244000  ! 860: STW_R	stw	%r30, [%r17 + %r0]
	.word 0x89942113  ! 861: WRPR_TICK_I	wrpr	%r16, 0x0113, %tick
	.word 0xf02c4000  ! 862: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf13c603c  ! 866: STDF_I	std	%f24, [0x003c, %r17]
	.word 0xb23d4000  ! 867: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xb1480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf035a12b  ! 872: STH_I	sth	%r24, [%r22 + 0x012b]
	.word 0xf63c4000  ! 874: STD_R	std	%r27, [%r17 + %r0]
	.word 0xfd3ca05c  ! 881: STDF_I	std	%f30, [0x005c, %r18]
	.word 0x8594213f  ! 882: WRPR_TSTATE_I	wrpr	%r16, 0x013f, %tstate
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 1b)
	.word 0x8195e1a5  ! 886: WRPR_TPC_I	wrpr	%r23, 0x01a5, %tpc
	.word 0xf2344000  ! 891: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xf93d2177  ! 896: STDF_I	std	%f28, [0x0177, %r20]
	.word 0xf33d8000  ! 898: STDF_R	std	%f25, [%r0, %r22]
	.word 0xb6c48000  ! 899: ADDCcc_R	addccc 	%r18, %r0, %r27
	.word 0xb5540000  ! 900: RDPR_GL	rdpr	%-, %r26
	.word 0xf824e146  ! 901: STW_I	stw	%r28, [%r19 + 0x0146]
	.word 0xb48d21e1  ! 903: ANDcc_I	andcc 	%r20, 0x01e1, %r26
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, c)
	.word 0xb9518000  ! 907: RDPR_PSTATE	<illegal instruction>
	.word 0xf23c205e  ! 908: STD_I	std	%r25, [%r16 + 0x005e]
	.word 0xbcb54000  ! 914: ORNcc_R	orncc 	%r21, %r0, %r30
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfa2d0000  ! 916: STB_R	stb	%r29, [%r20 + %r0]
	.word 0x8395211d  ! 918: WRPR_TNPC_I	wrpr	%r20, 0x011d, %tnpc
	.word 0xb9480000  ! 919: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf93d8000  ! 921: STDF_R	std	%f28, [%r0, %r22]
	.word 0xf475e08b  ! 922: STX_I	stx	%r26, [%r23 + 0x008b]
	.word 0xbf51c000  ! 923: RDPR_TL	<illegal instruction>
	.word 0xb7540000  ! 924: RDPR_GL	<illegal instruction>
	.word 0xb3643801  ! 925: MOVcc_I	<illegal instruction>
	.word 0xb751c000  ! 926: RDPR_TL	<illegal instruction>
	.word 0xf0350000  ! 927: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf025c000  ! 929: STW_R	stw	%r24, [%r23 + %r0]
	.word 0x8594e1a7  ! 931: WRPR_TSTATE_I	wrpr	%r19, 0x01a7, %tstate
	.word 0xfc746046  ! 935: STX_I	stx	%r30, [%r17 + 0x0046]
	.word 0xb1540000  ! 936: RDPR_GL	rdpr	%-, %r24
	.word 0xf73c0000  ! 942: STDF_R	std	%f27, [%r0, %r16]
	.word 0xfc2c2034  ! 943: STB_I	stb	%r30, [%r16 + 0x0034]
	.word 0x8d9461a0  ! 946: WRPR_PSTATE_I	wrpr	%r17, 0x01a0, %pstate
	.word 0xf62cc000  ! 950: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf42dc000  ! 954: STB_R	stb	%r26, [%r23 + %r0]
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, f)
	.word 0xf4246155  ! 957: STW_I	stw	%r26, [%r17 + 0x0155]
	setx	0xeb781f8a0000888b, %g1, %r10
	.word 0x839a8000  ! 960: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf03c2134  ! 962: STD_I	std	%r24, [%r16 + 0x0134]
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 2c)
	.word 0xbd504000  ! 965: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xfa3c21e5  ! 966: STD_I	std	%r29, [%r16 + 0x01e5]
	.word 0xb63da122  ! 968: XNOR_I	xnor 	%r22, 0x0122, %r27
	.word 0xfa2d2172  ! 971: STB_I	stb	%r29, [%r20 + 0x0172]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 26)
	mov	1, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe3de0db  ! 981: STD_I	std	%r31, [%r23 + 0x00db]
	.word 0xf274e0ce  ! 982: STX_I	stx	%r25, [%r19 + 0x00ce]
	.word 0xfd3c4000  ! 985: STDF_R	std	%f30, [%r0, %r17]
	setx	data_start_7, %g1, %r21
	.word 0xb82da109  ! 989: ANDN_I	andn 	%r22, 0x0109, %r28
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, c)
	.word 0x8d946005  ! 995: WRPR_PSTATE_I	wrpr	%r17, 0x0005, %pstate
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
	.word 0xfe0ca0dc  ! 2: LDUB_I	ldub	[%r18 + 0x00dc], %r31
	.word 0xf4454000  ! 10: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf8058000  ! 14: LDUW_R	lduw	[%r22 + %r0], %r28
	setx	data_start_7, %g1, %r16
	setx	data_start_5, %g1, %r22
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf6054000  ! 24: LDUW_R	lduw	[%r21 + %r0], %r27
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb3510000  ! 27: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf91dc000  ! 30: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xfa0c20dd  ! 32: LDUB_I	ldub	[%r16 + 0x00dd], %r29
	.word 0xfc1de191  ! 34: LDD_I	ldd	[%r23 + 0x0191], %r30
	.word 0xfe040000  ! 36: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xb351c000  ! 38: RDPR_TL	<illegal instruction>
	.word 0xfc1d60b8  ! 39: LDD_I	ldd	[%r21 + 0x00b8], %r30
	.word 0xfc0dc000  ! 41: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xfa040000  ! 43: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0x8794209d  ! 52: WRPR_TT_I	wrpr	%r16, 0x009d, %tt
	.word 0xf254604c  ! 60: LDSH_I	ldsh	[%r17 + 0x004c], %r25
	.word 0xfe45a060  ! 61: LDSW_I	ldsw	[%r22 + 0x0060], %r31
	.word 0x87956199  ! 63: WRPR_TT_I	wrpr	%r21, 0x0199, %tt
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 21)
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 12)
	.word 0xf25d0000  ! 77: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xb80da05d  ! 78: AND_I	and 	%r22, 0x005d, %r28
	.word 0xb645602f  ! 80: ADDC_I	addc 	%r21, 0x002f, %r27
	.word 0xfc5c8000  ! 82: LDX_R	ldx	[%r18 + %r0], %r30
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc040000  ! 89: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf405207b  ! 90: LDUW_I	lduw	[%r20 + 0x007b], %r26
	.word 0xb351c000  ! 92: RDPR_TL	<illegal instruction>
	.word 0xf31c0000  ! 95: LDDF_R	ldd	[%r16, %r0], %f25
	.word 0xbb510000  ! 97: RDPR_TICK	<illegal instruction>
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2)
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, e)
	.word 0xb43420ad  ! 104: SUBC_I	orn 	%r16, 0x00ad, %r26
	.word 0xbf508000  ! 106: RDPR_TSTATE	<illegal instruction>
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 11)
	.word 0xf00c8000  ! 108: LDUB_R	ldub	[%r18 + %r0], %r24
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 36)
	mov	1, %r12
	.word 0xa1930000  ! 110: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb82d8000  ! 111: ANDN_R	andn 	%r22, %r0, %r28
	.word 0x8d942020  ! 113: WRPR_PSTATE_I	wrpr	%r16, 0x0020, %pstate
	.word 0xb7500000  ! 114: RDPR_TPC	<illegal instruction>
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, f)
	.word 0xbab48000  ! 119: ORNcc_R	orncc 	%r18, %r0, %r29
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 36)
	.word 0xb1540000  ! 127: RDPR_GL	<illegal instruction>
	.word 0xff1c8000  ! 128: LDDF_R	ldd	[%r18, %r0], %f31
	.word 0xb334f001  ! 130: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xf614a03a  ! 132: LDUH_I	lduh	[%r18 + 0x003a], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8594a08c  ! 139: WRPR_TSTATE_I	wrpr	%r18, 0x008c, %tstate
	.word 0xf04ce05f  ! 141: LDSB_I	ldsb	[%r19 + 0x005f], %r24
	mov	1, %r12
	.word 0x8f930000  ! 144: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc458000  ! 145: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfa15e0bd  ! 147: LDUH_I	lduh	[%r23 + 0x00bd], %r29
	.word 0xb1500000  ! 150: RDPR_TPC	<illegal instruction>
	.word 0xf0544000  ! 155: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xb9641800  ! 156: MOVcc_R	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb77da401  ! 160: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xfc4de1c1  ! 161: LDSB_I	ldsb	[%r23 + 0x01c1], %r30
	.word 0xb3641800  ! 164: MOVcc_R	<illegal instruction>
	.word 0xf31c8000  ! 169: LDDF_R	ldd	[%r18, %r0], %f25
	setx	0xf1f9289b00006a87, %g1, %r10
	.word 0x819a8000  ! 170: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x6d200d8200006fcd, %g1, %r10
	.word 0x839a8000  ! 171: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x1a676ad900009848, %g1, %r10
	.word 0x839a8000  ! 172: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb624e1b2  ! 175: SUB_I	sub 	%r19, 0x01b2, %r27
	.word 0xb4b5c000  ! 176: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0xb57d4400  ! 177: MOVR_R	movre	%r21, %r0, %r26
	.word 0xf41c0000  ! 181: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xf8458000  ! 183: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0x8795e1f6  ! 184: WRPR_TT_I	wrpr	%r23, 0x01f6, %tt
	.word 0xbd51c000  ! 185: RDPR_TL	<illegal instruction>
	.word 0xb3508000  ! 187: RDPR_TSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r21
	.word 0xf71d4000  ! 190: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xfc0c8000  ! 192: LDUB_R	ldub	[%r18 + %r0], %r30
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 0)
	.word 0xb7504000  ! 197: RDPR_TNPC	<illegal instruction>
	.word 0xfc0de1c4  ! 200: LDUB_I	ldub	[%r23 + 0x01c4], %r30
	.word 0xfa4ce0da  ! 202: LDSB_I	ldsb	[%r19 + 0x00da], %r29
	.word 0xf11c8000  ! 211: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xf85dc000  ! 212: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb951c000  ! 214: RDPR_TL	<illegal instruction>
	.word 0xb48c21a7  ! 219: ANDcc_I	andcc 	%r16, 0x01a7, %r26
	.word 0x91946157  ! 221: WRPR_PIL_I	wrpr	%r17, 0x0157, %pil
	setx	data_start_6, %g1, %r20
	.word 0xfe448000  ! 224: LDSW_R	ldsw	[%r18 + %r0], %r31
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 3c)
	setx	0xe35578cf000018c8, %g1, %r10
	.word 0x819a8000  ! 228: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf0048000  ! 229: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xb92c9000  ! 235: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xf814c000  ! 237: LDUH_R	lduh	[%r19 + %r0], %r28
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 8)
	setx	data_start_1, %g1, %r16
	.word 0xb7504000  ! 246: RDPR_TNPC	<illegal instruction>
	.word 0xf255e0d3  ! 248: LDSH_I	ldsh	[%r23 + 0x00d3], %r25
	setx	0xe8f204d90000cf9e, %g1, %r10
	.word 0x839a8000  ! 254: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb500000  ! 257: RDPR_TPC	<illegal instruction>
	.word 0xf71d4000  ! 258: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xb445a0e4  ! 261: ADDC_I	addc 	%r22, 0x00e4, %r26
	.word 0xf445a070  ! 262: LDSW_I	ldsw	[%r22 + 0x0070], %r26
	.word 0xfe1c0000  ! 265: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xfe05e1e0  ! 268: LDUW_I	lduw	[%r23 + 0x01e0], %r31
	.word 0xb8a5c000  ! 269: SUBcc_R	subcc 	%r23, %r0, %r28
	setx	data_start_2, %g1, %r20
	.word 0xb01de188  ! 278: XOR_I	xor 	%r23, 0x0188, %r24
	.word 0xb814a16c  ! 281: OR_I	or 	%r18, 0x016c, %r28
	.word 0xfa154000  ! 284: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xfe446004  ! 285: LDSW_I	ldsw	[%r17 + 0x0004], %r31
	.word 0xfe450000  ! 287: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xfc4c0000  ! 288: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xbb508000  ! 293: RDPR_TSTATE	<illegal instruction>
	.word 0xf8448000  ! 294: LDSW_R	ldsw	[%r18 + %r0], %r28
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 2c)
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf855c000  ! 299: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xf805c000  ! 301: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xfa0cc000  ! 306: LDUB_R	ldub	[%r19 + %r0], %r29
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 17)
	.word 0xf25dc000  ! 308: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0x89946105  ! 309: WRPR_TICK_I	wrpr	%r17, 0x0105, %tick
	.word 0xf8158000  ! 310: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xf0142195  ! 313: LDUH_I	lduh	[%r16 + 0x0195], %r24
	.word 0xb645a1d9  ! 315: ADDC_I	addc 	%r22, 0x01d9, %r27
	.word 0xf61d21d9  ! 317: LDD_I	ldd	[%r20 + 0x01d9], %r27
	.word 0x8994e19d  ! 319: WRPR_TICK_I	wrpr	%r19, 0x019d, %tick
	.word 0xfc0ca0b1  ! 320: LDUB_I	ldub	[%r18 + 0x00b1], %r30
	.word 0xb52c0000  ! 322: SLL_R	sll 	%r16, %r0, %r26
	.word 0xfe058000  ! 326: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf61ca045  ! 337: LDD_I	ldd	[%r18 + 0x0045], %r27
	.word 0xf4544000  ! 338: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf80ce01e  ! 341: LDUB_I	ldub	[%r19 + 0x001e], %r28
	.word 0xbc34e163  ! 345: SUBC_I	orn 	%r19, 0x0163, %r30
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 5)
	.word 0xb81c4000  ! 348: XOR_R	xor 	%r17, %r0, %r28
	.word 0xb9510000  ! 350: RDPR_TICK	rdpr	%tick, %r28
	.word 0xfe558000  ! 353: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xf215e061  ! 356: LDUH_I	lduh	[%r23 + 0x0061], %r25
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf404c000  ! 359: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf41cc000  ! 364: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xfa15c000  ! 366: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xfa0c8000  ! 367: LDUB_R	ldub	[%r18 + %r0], %r29
	setx	0x3e2961760000ec0f, %g1, %r10
	.word 0x839a8000  ! 368: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9195207d  ! 369: WRPR_PIL_I	wrpr	%r20, 0x007d, %pil
	.word 0xfc4cc000  ! 370: LDSB_R	ldsb	[%r19 + %r0], %r30
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 17)
	.word 0xf04dc000  ! 372: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0x8d942002  ! 375: WRPR_PSTATE_I	wrpr	%r16, 0x0002, %pstate
	.word 0xb22c600d  ! 376: ANDN_I	andn 	%r17, 0x000d, %r25
	.word 0xfe45e1bc  ! 380: LDSW_I	ldsw	[%r23 + 0x01bc], %r31
	.word 0xfe050000  ! 381: LDUW_R	lduw	[%r20 + %r0], %r31
	setx	0xfe08c8db00005bd3, %g1, %r10
	.word 0x819a8000  ! 387: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc4460c2  ! 392: LDSW_I	ldsw	[%r17 + 0x00c2], %r30
	.word 0xb0b46179  ! 394: SUBCcc_I	orncc 	%r17, 0x0179, %r24
	.word 0xf04de043  ! 396: LDSB_I	ldsb	[%r23 + 0x0043], %r24
	.word 0xf804e093  ! 398: LDUW_I	lduw	[%r19 + 0x0093], %r28
	.word 0xf65de0f2  ! 399: LDX_I	ldx	[%r23 + 0x00f2], %r27
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf6048000  ! 401: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xf014c000  ! 405: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xfe0c208a  ! 408: LDUB_I	ldub	[%r16 + 0x008a], %r31
	.word 0x8d9521d2  ! 412: WRPR_PSTATE_I	wrpr	%r20, 0x01d2, %pstate
	.word 0xf004c000  ! 418: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xb02d209d  ! 422: ANDN_I	andn 	%r20, 0x009d, %r24
	.word 0xfc4c4000  ! 424: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xfb1d8000  ! 425: LDDF_R	ldd	[%r22, %r0], %f29
	.word 0xfc5c0000  ! 429: LDX_R	ldx	[%r16 + %r0], %r30
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe1da107  ! 432: LDD_I	ldd	[%r22 + 0x0107], %r31
	.word 0xf40c4000  ! 438: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xb351c000  ! 439: RDPR_TL	<illegal instruction>
	.word 0xf0550000  ! 440: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf2158000  ! 442: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xb33c2001  ! 443: SRA_I	sra 	%r16, 0x0001, %r25
	.word 0xb72ca001  ! 448: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xfc1d4000  ! 452: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xbb480000  ! 453: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfc5da0ce  ! 455: LDX_I	ldx	[%r22 + 0x00ce], %r30
	.word 0xfc1c215a  ! 464: LDD_I	ldd	[%r16 + 0x015a], %r30
	.word 0xfe55e077  ! 470: LDSH_I	ldsh	[%r23 + 0x0077], %r31
	.word 0xfa4d8000  ! 471: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf4546092  ! 472: LDSH_I	ldsh	[%r17 + 0x0092], %r26
	.word 0xbd480000  ! 475: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfa45e0a4  ! 478: LDSW_I	ldsw	[%r23 + 0x00a4], %r29
	setx	data_start_0, %g1, %r22
	.word 0x8795e090  ! 484: WRPR_TT_I	wrpr	%r23, 0x0090, %tt
	.word 0xf055e1cf  ! 485: LDSH_I	ldsh	[%r23 + 0x01cf], %r24
	.word 0xbc348000  ! 486: SUBC_R	orn 	%r18, %r0, %r30
	.word 0xb8352017  ! 487: SUBC_I	orn 	%r20, 0x0017, %r28
	.word 0xfa15e0ce  ! 488: LDUH_I	lduh	[%r23 + 0x00ce], %r29
	.word 0xfd1da1ae  ! 490: LDDF_I	ldd	[%r22, 0x01ae], %f30
	.word 0xb48ca162  ! 492: ANDcc_I	andcc 	%r18, 0x0162, %r26
	.word 0xfe4ce1ba  ! 493: LDSB_I	ldsb	[%r19 + 0x01ba], %r31
	.word 0xbb50c000  ! 495: RDPR_TT	<illegal instruction>
	.word 0xf44da1f0  ! 498: LDSB_I	ldsb	[%r22 + 0x01f0], %r26
	.word 0xf61c2090  ! 501: LDD_I	ldd	[%r16 + 0x0090], %r27
	.word 0xf40d4000  ! 506: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xbf540000  ! 509: RDPR_GL	<illegal instruction>
	.word 0x859421ef  ! 511: WRPR_TSTATE_I	wrpr	%r16, 0x01ef, %tstate
	.word 0xf11d0000  ! 512: LDDF_R	ldd	[%r20, %r0], %f24
	.word 0xf805a069  ! 514: LDUW_I	lduw	[%r22 + 0x0069], %r28
	.word 0xf8140000  ! 516: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xb9540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xbb510000  ! 518: RDPR_TICK	<illegal instruction>
	.word 0xfc4da0d2  ! 519: LDSB_I	ldsb	[%r22 + 0x00d2], %r30
	.word 0xbc9ca1eb  ! 521: XORcc_I	xorcc 	%r18, 0x01eb, %r30
	.word 0xfc5dc000  ! 523: LDX_R	ldx	[%r23 + %r0], %r30
	setx	0x9cc8e8a3000038df, %g1, %r10
	.word 0x819a8000  ! 524: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_1, %g1, %r21
	.word 0xf6556009  ! 528: LDSH_I	ldsh	[%r21 + 0x0009], %r27
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfe4c0000  ! 532: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xfc0d8000  ! 533: LDUB_R	ldub	[%r22 + %r0], %r30
	mov	2, %r12
	.word 0x8f930000  ! 534: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 23)
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 33)
	.word 0xf80c8000  ! 539: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xfc14e048  ! 540: LDUH_I	lduh	[%r19 + 0x0048], %r30
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, a)
	.word 0xf45ce11b  ! 546: LDX_I	ldx	[%r19 + 0x011b], %r26
	.word 0xf60d212b  ! 549: LDUB_I	ldub	[%r20 + 0x012b], %r27
	.word 0xfe5cc000  ! 550: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xbb504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xb0a4609a  ! 556: SUBcc_I	subcc 	%r17, 0x009a, %r24
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, f)
	.word 0xfe4560b0  ! 562: LDSW_I	ldsw	[%r21 + 0x00b0], %r31
	.word 0xfc540000  ! 566: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xf2058000  ! 567: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xf21c8000  ! 568: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xb3480000  ! 576: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8d95e042  ! 581: WRPR_PSTATE_I	wrpr	%r23, 0x0042, %pstate
	.word 0x8994a067  ! 584: WRPR_TICK_I	wrpr	%r18, 0x0067, %tick
	.word 0xf20d20c4  ! 586: LDUB_I	ldub	[%r20 + 0x00c4], %r25
	.word 0xb950c000  ! 588: RDPR_TT	<illegal instruction>
	.word 0xb0b4e084  ! 592: ORNcc_I	orncc 	%r19, 0x0084, %r24
	.word 0xb81c6094  ! 594: XOR_I	xor 	%r17, 0x0094, %r28
	.word 0xbcbc0000  ! 596: XNORcc_R	xnorcc 	%r16, %r0, %r30
	.word 0xb3480000  ! 597: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbec48000  ! 598: ADDCcc_R	addccc 	%r18, %r0, %r31
	mov	1, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb3c9000  ! 602: SRAX_R	srax	%r18, %r0, %r29
	.word 0xf84c8000  ! 603: LDSB_R	ldsb	[%r18 + %r0], %r28
	setx	0x5d7a9e4f00008d1b, %g1, %r10
	.word 0x819a8000  ! 607: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe4520a7  ! 610: LDSW_I	ldsw	[%r20 + 0x00a7], %r31
	.word 0xf6148000  ! 611: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0xb5480000  ! 612: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfd1dc000  ! 613: LDDF_R	ldd	[%r23, %r0], %f30
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 39)
	.word 0xf11d2053  ! 621: LDDF_I	ldd	[%r20, 0x0053], %f24
	setx	0x25c0176700007dc3, %g1, %r10
	.word 0x839a8000  ! 625: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc0ca1c3  ! 627: LDUB_I	ldub	[%r18 + 0x01c3], %r30
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf20d4000  ! 633: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xf45d8000  ! 634: LDX_R	ldx	[%r22 + %r0], %r26
	setx	data_start_7, %g1, %r19
	.word 0xf045c000  ! 638: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xb9504000  ! 644: RDPR_TNPC	<illegal instruction>
	.word 0xf40ca1b4  ! 646: LDUB_I	ldub	[%r18 + 0x01b4], %r26
	.word 0xb350c000  ! 647: RDPR_TT	<illegal instruction>
	.word 0xf24d618d  ! 648: LDSB_I	ldsb	[%r21 + 0x018d], %r25
	.word 0xfa1420d6  ! 649: LDUH_I	lduh	[%r16 + 0x00d6], %r29
	.word 0xba44a114  ! 654: ADDC_I	addc 	%r18, 0x0114, %r29
	.word 0xfa5c4000  ! 655: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf01de023  ! 656: LDD_I	ldd	[%r23 + 0x0023], %r24
	.word 0xbc2d8000  ! 658: ANDN_R	andn 	%r22, %r0, %r30
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 1c)
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 2b)
	setx	0x35f5d2db0000a8d0, %g1, %r10
	.word 0x839a8000  ! 663: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf80d8000  ! 664: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xba3d6185  ! 665: XNOR_I	xnor 	%r21, 0x0185, %r29
	.word 0xfc140000  ! 669: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xfa040000  ! 670: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb951c000  ! 671: RDPR_TL	rdpr	%tl, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa44e0eb  ! 676: LDSW_I	ldsw	[%r19 + 0x00eb], %r29
	setx	data_start_7, %g1, %r16
	.word 0xbb510000  ! 682: RDPR_TICK	<illegal instruction>
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, b)
	setx	data_start_6, %g1, %r23
	.word 0xfc1c0000  ! 692: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xfa54c000  ! 693: LDSH_R	ldsh	[%r19 + %r0], %r29
	.word 0xf015a18b  ! 697: LDUH_I	lduh	[%r22 + 0x018b], %r24
	.word 0xf255a143  ! 699: LDSH_I	ldsh	[%r22 + 0x0143], %r25
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 18)
	.word 0xb21c0000  ! 704: XOR_R	xor 	%r16, %r0, %r25
	.word 0xf65d0000  ! 710: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xb5500000  ! 712: RDPR_TPC	<illegal instruction>
	.word 0xbb520000  ! 713: RDPR_PIL	<illegal instruction>
	.word 0xb03ca041  ! 717: XNOR_I	xnor 	%r18, 0x0041, %r24
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 29)
	.word 0xf20ca17f  ! 719: LDUB_I	ldub	[%r18 + 0x017f], %r25
	.word 0xfe04a0fa  ! 720: LDUW_I	lduw	[%r18 + 0x00fa], %r31
	.word 0xb6940000  ! 726: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xb73db001  ! 729: SRAX_I	srax	%r22, 0x0001, %r27
	.word 0xbf2c2001  ! 731: SLL_I	sll 	%r16, 0x0001, %r31
	.word 0xb9508000  ! 732: RDPR_TSTATE	<illegal instruction>
	.word 0x859520a5  ! 734: WRPR_TSTATE_I	wrpr	%r20, 0x00a5, %tstate
	.word 0xf405e179  ! 737: LDUW_I	lduw	[%r23 + 0x0179], %r26
	.word 0xf91c60ba  ! 739: LDDF_I	ldd	[%r17, 0x00ba], %f28
	.word 0xf71d0000  ! 741: LDDF_R	ldd	[%r20, %r0], %f27
	.word 0xb5510000  ! 742: RDPR_TICK	<illegal instruction>
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 33)
	.word 0xb9540000  ! 748: RDPR_GL	<illegal instruction>
	.word 0xfa14c000  ! 749: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xfa45c000  ! 753: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf65dc000  ! 754: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xf004614c  ! 757: LDUW_I	lduw	[%r17 + 0x014c], %r24
	.word 0xfc45e095  ! 759: LDSW_I	ldsw	[%r23 + 0x0095], %r30
	.word 0xfa04e18c  ! 765: LDUW_I	lduw	[%r19 + 0x018c], %r29
	mov	0, %r12
	.word 0x8f930000  ! 769: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf255e1a1  ! 771: LDSH_I	ldsh	[%r23 + 0x01a1], %r25
	.word 0xb73dd000  ! 772: SRAX_R	srax	%r23, %r0, %r27
	.word 0xf00d4000  ! 773: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xf61ce005  ! 774: LDD_I	ldd	[%r19 + 0x0005], %r27
	.word 0xf21ca1ef  ! 776: LDD_I	ldd	[%r18 + 0x01ef], %r25
	.word 0xf60c61b8  ! 780: LDUB_I	ldub	[%r17 + 0x01b8], %r27
	.word 0xbd643801  ! 781: MOVcc_I	<illegal instruction>
	.word 0xfe15c000  ! 783: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xf0040000  ! 786: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xf85d0000  ! 789: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xf8548000  ! 795: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xfa048000  ! 798: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf6054000  ! 806: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf40560d8  ! 811: LDUW_I	lduw	[%r21 + 0x00d8], %r26
	.word 0xb1480000  ! 812: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa55e176  ! 813: LDSH_I	ldsh	[%r23 + 0x0176], %r29
	.word 0xfe04619b  ! 814: LDUW_I	lduw	[%r17 + 0x019b], %r31
	.word 0xbe254000  ! 816: SUB_R	sub 	%r21, %r0, %r31
	.word 0xf21dc000  ! 819: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xfd1ca053  ! 820: LDDF_I	ldd	[%r18, 0x0053], %f30
	setx	data_start_1, %g1, %r17
	.word 0xfe1cc000  ! 825: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0x919460fc  ! 827: WRPR_PIL_I	wrpr	%r17, 0x00fc, %pil
	.word 0xbf508000  ! 831: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xbd540000  ! 838: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	1, %r12
	.word 0x8f930000  ! 841: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf31d60c4  ! 842: LDDF_I	ldd	[%r21, 0x00c4], %f25
	.word 0xf655a0af  ! 844: LDSH_I	ldsh	[%r22 + 0x00af], %r27
	.word 0xf8556157  ! 845: LDSH_I	ldsh	[%r21 + 0x0157], %r28
	.word 0x819560c6  ! 846: WRPR_TPC_I	wrpr	%r21, 0x00c6, %tpc
	.word 0xfe0c2024  ! 849: LDUB_I	ldub	[%r16 + 0x0024], %r31
	.word 0x8595e1b4  ! 851: WRPR_TSTATE_I	wrpr	%r23, 0x01b4, %tstate
	.word 0xf21c2102  ! 854: LDD_I	ldd	[%r16 + 0x0102], %r25
	.word 0x8995617d  ! 861: WRPR_TICK_I	wrpr	%r21, 0x017d, %tick
	.word 0xf01c8000  ! 863: LDD_R	ldd	[%r18 + %r0], %r24
	.word 0xf81d0000  ! 864: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xbc3c4000  ! 867: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xb3480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf65ca08b  ! 870: LDX_I	ldx	[%r18 + 0x008b], %r27
	.word 0xfc5d60c9  ! 877: LDX_I	ldx	[%r21 + 0x00c9], %r30
	.word 0xfc1d0000  ! 880: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0x85946056  ! 882: WRPR_TSTATE_I	wrpr	%r17, 0x0056, %tstate
	.word 0xf40da0e3  ! 883: LDUB_I	ldub	[%r22 + 0x00e3], %r26
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 30)
	.word 0x81946053  ! 886: WRPR_TPC_I	wrpr	%r17, 0x0053, %tpc
	.word 0xfc1ca055  ! 888: LDD_I	ldd	[%r18 + 0x0055], %r30
	.word 0xf804c000  ! 893: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xf6458000  ! 894: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xfc4d0000  ! 895: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xb6c40000  ! 899: ADDCcc_R	addccc 	%r16, %r0, %r27
	.word 0xb7540000  ! 900: RDPR_GL	<illegal instruction>
	.word 0xfa0c4000  ! 902: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xb28d21b2  ! 903: ANDcc_I	andcc 	%r20, 0x01b2, %r25
	.word 0xf91d21f6  ! 904: LDDF_I	ldd	[%r20, 0x01f6], %f28
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 3f)
	.word 0xbb518000  ! 907: RDPR_PSTATE	<illegal instruction>
	.word 0xf01421a5  ! 911: LDUH_I	lduh	[%r16 + 0x01a5], %r24
	.word 0xbeb4c000  ! 914: ORNcc_R	orncc 	%r19, %r0, %r31
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, b)
	.word 0x839520c0  ! 918: WRPR_TNPC_I	wrpr	%r20, 0x00c0, %tnpc
	.word 0xb7480000  ! 919: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb551c000  ! 923: RDPR_TL	<illegal instruction>
	.word 0xb1540000  ! 924: RDPR_GL	<illegal instruction>
	.word 0xb5643801  ! 925: MOVcc_I	<illegal instruction>
	.word 0xb751c000  ! 926: RDPR_TL	<illegal instruction>
	.word 0x8595a06e  ! 931: WRPR_TSTATE_I	wrpr	%r22, 0x006e, %tstate
	.word 0xb7540000  ! 936: RDPR_GL	<illegal instruction>
	.word 0xf054a013  ! 939: LDSH_I	ldsh	[%r18 + 0x0013], %r24
	.word 0xfa4d4000  ! 944: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xfe450000  ! 945: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0x8d9421ee  ! 946: WRPR_PSTATE_I	wrpr	%r16, 0x01ee, %pstate
	.word 0xfe4d4000  ! 952: LDSB_R	ldsb	[%r21 + %r0], %r31
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 5)
	setx	0x3023aba300007993, %g1, %r10
	.word 0x839a8000  ! 960: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 26)
	.word 0xfe0c2163  ! 964: LDUB_I	ldub	[%r16 + 0x0163], %r31
	.word 0xbd504000  ! 965: RDPR_TNPC	<illegal instruction>
	.word 0xb03d201c  ! 968: XNOR_I	xnor 	%r20, 0x001c, %r24
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, d)
	.word 0xf64d0000  ! 975: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xf054e1ec  ! 976: LDSH_I	ldsh	[%r19 + 0x01ec], %r24
	.word 0xf0050000  ! 977: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xf44c218a  ! 979: LDSB_I	ldsb	[%r16 + 0x018a], %r26
	mov	0, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf31c4000  ! 986: LDDF_R	ldd	[%r17, %r0], %f25
	.word 0xfc0421e5  ! 987: LDUW_I	lduw	[%r16 + 0x01e5], %r30
	setx	data_start_4, %g1, %r16
	.word 0xbc2da0f6  ! 989: ANDN_I	andn 	%r22, 0x00f6, %r30
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 18)
	.word 0xf0540000  ! 994: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0x8d94a13b  ! 995: WRPR_PSTATE_I	wrpr	%r18, 0x013b, %pstate
	.word 0xf6154000  ! 998: LDUH_R	lduh	[%r21 + %r0], %r27
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbda98820  ! 9: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbda9c820  ! 11: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a48860  ! 13: FADDq	dis not found

	.word 0xb5ab4820  ! 17: FMOVCC	fmovs	%fcc1, %f0, %f26
	setx	data_start_4, %g1, %r16
	setx	data_start_1, %g1, %r21
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 2b)
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5510000  ! 27: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3ab0820  ! 37: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbd51c000  ! 38: RDPR_TL	<illegal instruction>
	.word 0xb5a84820  ! 45: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbda88820  ! 50: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0x8795e1ba  ! 52: WRPR_TT_I	wrpr	%r23, 0x01ba, %tt
	.word 0xbfa4c8a0  ! 56: FSUBs	fsubs	%f19, %f0, %f31
	.word 0xb7a4c940  ! 57: FMULd	fmuld	%f50, %f0, %f58
	.word 0xb9a588a0  ! 59: FSUBs	fsubs	%f22, %f0, %f28
	.word 0x87952011  ! 63: WRPR_TT_I	wrpr	%r20, 0x0011, %tt
	.word 0xbfa00540  ! 66: FSQRTd	fsqrt	
	.word 0xbfa4c940  ! 67: FMULd	fmuld	%f50, %f0, %f62
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 22)
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a489c0  ! 74: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb40ce073  ! 78: AND_I	and 	%r19, 0x0073, %r26
	.word 0xba44e170  ! 80: ADDC_I	addc 	%r19, 0x0170, %r29
	.word 0xb7a80820  ! 83: FMOVN	fmovs	%fcc1, %f0, %f27
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5aa8820  ! 85: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbba44960  ! 86: FMULq	dis not found

	.word 0xb9a549c0  ! 88: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xb751c000  ! 92: RDPR_TL	<illegal instruction>
	.word 0xbda00540  ! 93: FSQRTd	fsqrt	
	.word 0xb5a00520  ! 96: FSQRTs	fsqrt	
	.word 0xb9510000  ! 97: RDPR_TICK	<illegal instruction>
	.word 0xb3a81820  ! 98: FMOVRGZ	fmovs	%fcc3, %f0, %f25
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a88820  ! 101: FMOVLE	fmovs	%fcc1, %f0, %f27
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbfa4c840  ! 103: FADDd	faddd	%f50, %f0, %f62
	.word 0xb635e031  ! 104: SUBC_I	orn 	%r23, 0x0031, %r27
	.word 0xbda489c0  ! 105: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xbd508000  ! 106: RDPR_TSTATE	<illegal instruction>
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 13)
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 2e)
	mov	1, %r12
	.word 0xa1930000  ! 110: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb42c4000  ! 111: ANDN_R	andn 	%r17, %r0, %r26
	.word 0x8d95a08c  ! 113: WRPR_PSTATE_I	wrpr	%r22, 0x008c, %pstate
	.word 0xb9500000  ! 114: RDPR_TPC	<illegal instruction>
	.word 0xb7a81820  ! 115: FMOVRGZ	fmovs	%fcc3, %f0, %f27
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 3)
	.word 0xb8b50000  ! 119: ORNcc_R	orncc 	%r20, %r0, %r28
	.word 0xb3aa4820  ! 121: FMOVNE	fmovs	%fcc1, %f0, %f25
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbd540000  ! 127: RDPR_GL	<illegal instruction>
	.word 0xbfa48840  ! 129: FADDd	faddd	%f18, %f0, %f62
	.word 0xb735f001  ! 130: SRLX_I	srlx	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a94820  ! 138: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0x85942007  ! 139: WRPR_TSTATE_I	wrpr	%r16, 0x0007, %tstate
	.word 0xb7a54860  ! 142: FADDq	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 144: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbf500000  ! 150: RDPR_TPC	<illegal instruction>
	.word 0xbda00520  ! 151: FSQRTs	fsqrt	
	.word 0xbba448e0  ! 152: FSUBq	dis not found

	.word 0xbd641800  ! 156: MOVcc_R	<illegal instruction>
	.word 0xb1a8c820  ! 158: FMOVL	fmovs	%fcc1, %f0, %f24
	mov	2, %r12
	.word 0xa1930000  ! 159: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd7da401  ! 160: MOVR_I	movre	%r22, 0x1, %r30
	.word 0xb7641800  ! 164: MOVcc_R	<illegal instruction>
	.word 0xb5a54920  ! 166: FMULs	fmuls	%f21, %f0, %f26
	setx	0xb98d19ad0000f995, %g1, %r10
	.word 0x819a8000  ! 170: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xb6153cbc00001e06, %g1, %r10
	.word 0x839a8000  ! 171: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x92acc9ca00004c0c, %g1, %r10
	.word 0x839a8000  ! 172: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda44940  ! 174: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb6256091  ! 175: SUB_I	sub 	%r21, 0x0091, %r27
	.word 0xb0b4c000  ! 176: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xb37c4400  ! 177: MOVR_R	movre	%r17, %r0, %r25
	.word 0x8795a08b  ! 184: WRPR_TT_I	wrpr	%r22, 0x008b, %tt
	.word 0xbb51c000  ! 185: RDPR_TL	<illegal instruction>
	.word 0xbda54940  ! 186: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb3508000  ! 187: RDPR_TSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r19
	.word 0xb9a90820  ! 193: FMOVLEU	fmovs	%fcc1, %f0, %f28
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5504000  ! 197: RDPR_TNPC	<illegal instruction>
	.word 0xb3a84820  ! 199: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbda9c820  ! 204: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a44960  ! 208: FMULq	dis not found

	.word 0xb5a00040  ! 213: FMOVd	fmovd	%f0, %f26
	.word 0xbb51c000  ! 214: RDPR_TL	<illegal instruction>
	.word 0xbba80c20  ! 217: FMOVRLZ	dis not found

	.word 0xbbaa8820  ! 218: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbe8d609d  ! 219: ANDcc_I	andcc 	%r21, 0x009d, %r31
	.word 0x91946003  ! 221: WRPR_PIL_I	wrpr	%r17, 0x0003, %pil
	setx	data_start_1, %g1, %r21
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a84820  ! 226: FMOVE	fmovs	%fcc1, %f0, %f27
	setx	0x1f32f1ef00003aca, %g1, %r10
	.word 0x819a8000  ! 228: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a80820  ! 231: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80c20  ! 232: FMOVRLZ	dis not found

	.word 0xb3a549c0  ! 233: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb72d9000  ! 235: SLLX_R	sllx	%r22, %r0, %r27
	.word 0xb3a44860  ! 238: FADDq	dis not found

	.word 0xb9a00540  ! 240: FSQRTd	fsqrt	
	.word 0xbfa589a0  ! 243: FDIVs	fdivs	%f22, %f0, %f31
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 2e)
	setx	data_start_6, %g1, %r18
	.word 0xbf504000  ! 246: RDPR_TNPC	<illegal instruction>
	.word 0xbba40820  ! 252: FADDs	fadds	%f16, %f0, %f29
	.word 0xb7a98820  ! 253: FMOVNEG	fmovs	%fcc1, %f0, %f27
	setx	0x7c18054c0000fb55, %g1, %r10
	.word 0x839a8000  ! 254: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9500000  ! 257: RDPR_TPC	<illegal instruction>
	.word 0xbdaa0820  ! 259: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbba80420  ! 260: FMOVRZ	dis not found

	.word 0xba45e074  ! 261: ADDC_I	addc 	%r23, 0x0074, %r29
	.word 0xb9a58960  ! 263: FMULq	dis not found

	.word 0xb3a00040  ! 264: FMOVd	fmovd	%f0, %f56
	.word 0xbda589e0  ! 267: FDIVq	dis not found

	.word 0xbca48000  ! 269: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0xb9a54920  ! 271: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb7a44960  ! 272: FMULq	dis not found

	setx	data_start_2, %g1, %r17
	.word 0xb21ce1bf  ! 278: XOR_I	xor 	%r19, 0x01bf, %r25
	.word 0xb9a509c0  ! 279: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xbc15e167  ! 281: OR_I	or 	%r23, 0x0167, %r30
	.word 0xbba509a0  ! 282: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xbba58920  ! 283: FMULs	fmuls	%f22, %f0, %f29
	.word 0xbba80820  ! 291: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb5508000  ! 293: RDPR_TSTATE	<illegal instruction>
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 31)
	.word 0xbba94820  ! 296: FMOVCS	fmovs	%fcc1, %f0, %f29
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 32)
	.word 0xb1a58960  ! 302: FMULq	dis not found

hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 15)
	.word 0x8995a003  ! 309: WRPR_TICK_I	wrpr	%r22, 0x0003, %tick
	.word 0xbfa00520  ! 311: FSQRTs	fsqrt	
	.word 0xb9a80820  ! 312: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb044608d  ! 315: ADDC_I	addc 	%r17, 0x008d, %r24
	.word 0xb3a4c8e0  ! 318: FSUBq	dis not found

	.word 0x8995a11b  ! 319: WRPR_TICK_I	wrpr	%r22, 0x011b, %tick
	.word 0xbf2d4000  ! 322: SLL_R	sll 	%r21, %r0, %r31
	.word 0xbba84820  ! 325: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbdaac820  ! 327: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbbab8820  ! 331: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab8820  ! 332: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a58940  ! 342: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb7a4c9a0  ! 343: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xba34216a  ! 345: SUBC_I	orn 	%r16, 0x016a, %r29
	.word 0xb1a80820  ! 346: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 4)
	.word 0xbe1d0000  ! 348: XOR_R	xor 	%r20, %r0, %r31
	.word 0xb9a588e0  ! 349: FSUBq	dis not found

	.word 0xb3510000  ! 350: RDPR_TICK	<illegal instruction>
	.word 0xb9a00560  ! 352: FSQRTq	fsqrt	
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3a508a0  ! 360: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb1ab4820  ! 361: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb5a48840  ! 362: FADDd	faddd	%f18, %f0, %f26
	setx	0x5eb3b97c00003e83, %g1, %r10
	.word 0x839a8000  ! 368: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x919421dd  ! 369: WRPR_PIL_I	wrpr	%r16, 0x01dd, %pil
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 25)
	.word 0x8d94a11c  ! 375: WRPR_PSTATE_I	wrpr	%r18, 0x011c, %pstate
	.word 0xb42d6015  ! 376: ANDN_I	andn 	%r21, 0x0015, %r26
	.word 0xb7a588e0  ! 379: FSUBq	dis not found

	.word 0xbba00560  ! 384: FSQRTq	fsqrt	
	setx	0x5e24dc5d00001d50, %g1, %r10
	.word 0x819a8000  ! 387: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a4c8e0  ! 388: FSUBq	dis not found

hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, a)
	.word 0xb0b4e0a8  ! 394: SUBCcc_I	orncc 	%r19, 0x00a8, %r24
	.word 0xbbabc820  ! 395: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbba54820  ! 397: FADDs	fadds	%f21, %f0, %f29
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 26)
	.word 0xb3a4c9c0  ! 410: FDIVd	fdivd	%f50, %f0, %f56
	.word 0x8d95a008  ! 412: WRPR_PSTATE_I	wrpr	%r22, 0x0008, %pstate
	.word 0xb3a44920  ! 414: FMULs	fmuls	%f17, %f0, %f25
	.word 0xb3a88820  ! 415: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa80c20  ! 417: FMOVRLZ	dis not found

	.word 0xbc2ca01c  ! 422: ANDN_I	andn 	%r18, 0x001c, %r30
	.word 0xbda88820  ! 423: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a88820  ! 427: FMOVLE	fmovs	%fcc1, %f0, %f27
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 2)
	.word 0xb5a80820  ! 433: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3ab4820  ! 437: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb751c000  ! 439: RDPR_TL	<illegal instruction>
	.word 0xb33de001  ! 443: SRA_I	sra 	%r23, 0x0001, %r25
	.word 0xbba00040  ! 446: FMOVd	fmovd	%f0, %f60
	.word 0xb1a448e0  ! 447: FSUBq	dis not found

	.word 0xb32de001  ! 448: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xbba54860  ! 450: FADDq	dis not found

	.word 0xb5abc820  ! 451: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbf480000  ! 453: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7a81820  ! 456: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb9a00520  ! 457: FSQRTs	fsqrt	
	.word 0xb7a4c940  ! 461: FMULd	fmuld	%f50, %f0, %f58
	.word 0xb9a80420  ! 465: FMOVRZ	dis not found

	.word 0xb5a448a0  ! 466: FSUBs	fsubs	%f17, %f0, %f26
	.word 0xbbab0820  ! 467: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbb480000  ! 475: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb9a94820  ! 476: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a90820  ! 477: FMOVLEU	fmovs	%fcc1, %f0, %f24
	setx	data_start_2, %g1, %r17
	.word 0xbfa449e0  ! 481: FDIVq	dis not found

	.word 0xbba00540  ! 482: FSQRTd	fsqrt	
	.word 0x87952026  ! 484: WRPR_TT_I	wrpr	%r20, 0x0026, %tt
	.word 0xb2348000  ! 486: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xba342180  ! 487: SUBC_I	orn 	%r16, 0x0180, %r29
	.word 0xb9a00040  ! 491: FMOVd	fmovd	%f0, %f28
	.word 0xba8c2042  ! 492: ANDcc_I	andcc 	%r16, 0x0042, %r29
	.word 0xb350c000  ! 495: RDPR_TT	<illegal instruction>
	.word 0xb9a98820  ! 496: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00540  ! 503: FSQRTd	fsqrt	
	.word 0xbda00540  ! 504: FSQRTd	fsqrt	
	.word 0xbda48960  ! 505: FMULq	dis not found

	.word 0xb9540000  ! 509: RDPR_GL	<illegal instruction>
	.word 0xb1a5c940  ! 510: FMULd	fmuld	%f54, %f0, %f24
	.word 0x859560b5  ! 511: WRPR_TSTATE_I	wrpr	%r21, 0x00b5, %tstate
	.word 0xbf540000  ! 517: RDPR_GL	<illegal instruction>
	.word 0xbd510000  ! 518: RDPR_TICK	<illegal instruction>
	.word 0xbe9d2088  ! 521: XORcc_I	xorcc 	%r20, 0x0088, %r31
	setx	0x49b192a900006d88, %g1, %r10
	.word 0x819a8000  ! 524: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_0, %g1, %r19
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a98820  ! 531: FMOVNEG	fmovs	%fcc1, %f0, %f25
	mov	0, %r12
	.word 0x8f930000  ! 534: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 4)
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, c)
	.word 0xb7a00540  ! 537: FSQRTd	fsqrt	
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb5a84820  ! 543: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbfaa0820  ! 548: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbda80820  ! 552: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00540  ! 553: FSQRTd	fsqrt	
	.word 0xbda44860  ! 554: FADDq	dis not found

	.word 0xbf504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xbea5a196  ! 556: SUBcc_I	subcc 	%r22, 0x0196, %r31
	.word 0xb5a48940  ! 557: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb5a50840  ! 558: FADDd	faddd	%f20, %f0, %f26
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3ab0820  ! 560: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa81420  ! 563: FMOVRNZ	dis not found

	.word 0xbda80820  ! 565: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbfa94820  ! 570: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a90820  ! 571: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb9480000  ! 576: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x8d95e166  ! 581: WRPR_PSTATE_I	wrpr	%r23, 0x0166, %pstate
	.word 0xb3a00560  ! 582: FSQRTq	fsqrt	
	.word 0x899561cd  ! 584: WRPR_TICK_I	wrpr	%r21, 0x01cd, %tick
	.word 0xbda54940  ! 585: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb550c000  ! 588: RDPR_TT	<illegal instruction>
	.word 0xb8b46140  ! 592: ORNcc_I	orncc 	%r17, 0x0140, %r28
	.word 0xbfa81c20  ! 593: FMOVRGEZ	dis not found

	.word 0xbc1d2140  ! 594: XOR_I	xor 	%r20, 0x0140, %r30
	.word 0xb2bc4000  ! 596: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xb5480000  ! 597: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbcc44000  ! 598: ADDCcc_R	addccc 	%r17, %r0, %r30
	mov	2, %r12
	.word 0x8f930000  ! 599: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbba9c820  ! 601: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbb3cd000  ! 602: SRAX_R	srax	%r19, %r0, %r29
	.word 0xb1aa0820  ! 604: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb1a44940  ! 606: FMULd	fmuld	%f48, %f0, %f24
	setx	0x90089d4000007f42, %g1, %r10
	.word 0x819a8000  ! 607: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a588c0  ! 608: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb1480000  ! 612: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb1a50920  ! 614: FMULs	fmuls	%f20, %f0, %f24
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 32)
	setx	0x20e5c66c0000df5f, %g1, %r10
	.word 0x839a8000  ! 625: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 626: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 18)
	setx	data_start_5, %g1, %r20
	.word 0xbba94820  ! 637: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a8c820  ! 639: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb9a449a0  ! 641: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xbd504000  ! 644: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 647: RDPR_TT	<illegal instruction>
	.word 0xb7a4c960  ! 650: FMULq	dis not found

	.word 0xbda00520  ! 652: FSQRTs	fsqrt	
	.word 0xb045212a  ! 654: ADDC_I	addc 	%r20, 0x012a, %r24
	.word 0xb02d0000  ! 658: ANDN_R	andn 	%r20, %r0, %r24
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 3d)
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, f)
	setx	0x80daa4ea00000b15, %g1, %r10
	.word 0x839a8000  ! 663: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb03ca171  ! 665: XNOR_I	xnor 	%r18, 0x0171, %r24
	.word 0xbdaa0820  ! 666: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb1a48840  ! 667: FADDd	faddd	%f18, %f0, %f24
	.word 0xb7a54960  ! 668: FMULq	dis not found

	.word 0xb151c000  ! 671: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_6, %g1, %r16
	.word 0xb3a80820  ! 680: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb7a4c920  ! 681: FMULs	fmuls	%f19, %f0, %f27
	.word 0xbd510000  ! 682: RDPR_TICK	<illegal instruction>
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 7)
	setx	data_start_2, %g1, %r21
	.word 0xbba509e0  ! 685: FDIVq	dis not found

	.word 0xbba80420  ! 687: FMOVRZ	dis not found

	.word 0xb5a5c9c0  ! 688: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xb5a548a0  ! 690: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xbba00540  ! 698: FSQRTd	fsqrt	
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb7a44860  ! 701: FADDq	dis not found

	.word 0xb5a44860  ! 702: FADDq	dis not found

	.word 0xbfa80820  ! 703: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb61d4000  ! 704: XOR_R	xor 	%r21, %r0, %r27
	.word 0xb7a589a0  ! 705: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xbfa9c820  ! 707: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa84820  ! 709: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb3500000  ! 712: RDPR_TPC	<illegal instruction>
	.word 0xb3520000  ! 713: RDPR_PIL	<illegal instruction>
	.word 0xb9abc820  ! 714: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa5c8e0  ! 715: FSUBq	dis not found

	.word 0xbfa509c0  ! 716: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xb63de13d  ! 717: XNOR_I	xnor 	%r23, 0x013d, %r27
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba00560  ! 722: FSQRTq	fsqrt	
	.word 0xb4944000  ! 726: ORcc_R	orcc 	%r17, %r0, %r26
	.word 0xbf3cb001  ! 729: SRAX_I	srax	%r18, 0x0001, %r31
	.word 0xb3a90820  ! 730: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbd2de001  ! 731: SLL_I	sll 	%r23, 0x0001, %r30
	.word 0xbb508000  ! 732: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e1d7  ! 734: WRPR_TSTATE_I	wrpr	%r23, 0x01d7, %tstate
	.word 0xb3a44860  ! 735: FADDq	dis not found

	.word 0xb5510000  ! 742: RDPR_TICK	<illegal instruction>
	.word 0xbba81c20  ! 745: FMOVRGEZ	dis not found

hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 34)
	.word 0xbb540000  ! 748: RDPR_GL	<illegal instruction>
	.word 0xbba50820  ! 756: FADDs	fadds	%f20, %f0, %f29
	.word 0xb1a81420  ! 761: FMOVRNZ	dis not found

	.word 0xb9a4c8e0  ! 762: FSUBq	dis not found

	.word 0xbfa509a0  ! 766: FDIVs	fdivs	%f20, %f0, %f31
	mov	2, %r12
	.word 0x8f930000  ! 769: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9a54840  ! 770: FADDd	faddd	%f52, %f0, %f28
	.word 0xb13d5000  ! 772: SRAX_R	srax	%r21, %r0, %r24
	.word 0xb7a00560  ! 775: FSQRTq	fsqrt	
	.word 0xb1a508c0  ! 778: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb5643801  ! 781: MOVcc_I	<illegal instruction>
	.word 0xb1aa0820  ! 782: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbba44860  ! 784: FADDq	dis not found

	.word 0xbbab8820  ! 785: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbbab8820  ! 792: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a489e0  ! 796: FDIVq	dis not found

	.word 0xb3a5c920  ! 810: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb5480000  ! 812: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb2250000  ! 816: SUB_R	sub 	%r20, %r0, %r25
	.word 0xb7a80c20  ! 818: FMOVRLZ	dis not found

	setx	data_start_0, %g1, %r23
	.word 0xb5a549a0  ! 824: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xbda90820  ! 826: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0x91952117  ! 827: WRPR_PIL_I	wrpr	%r20, 0x0117, %pil
	.word 0xb9508000  ! 831: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a4c9a0  ! 833: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xbb500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xbf540000  ! 838: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f930000  ! 841: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x819421b6  ! 846: WRPR_TPC_I	wrpr	%r16, 0x01b6, %tpc
	.word 0xb9a40840  ! 848: FADDd	faddd	%f16, %f0, %f28
	.word 0xb9a81c20  ! 850: FMOVRGEZ	dis not found

	.word 0x859560bb  ! 851: WRPR_TSTATE_I	wrpr	%r21, 0x00bb, %tstate
	.word 0xb9a40960  ! 852: FMULq	dis not found

	.word 0xb3a58860  ! 853: FADDq	dis not found

	.word 0xb5ab8820  ! 855: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a48840  ! 857: FADDd	faddd	%f18, %f0, %f24
	.word 0xb7a58860  ! 859: FADDq	dis not found

	.word 0x8994a059  ! 861: WRPR_TICK_I	wrpr	%r18, 0x0059, %tick
	.word 0xbda5c860  ! 865: FADDq	dis not found

	.word 0xb43d4000  ! 867: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xbd480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa84820  ! 871: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbba508c0  ! 873: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xbfa00540  ! 876: FSQRTd	fsqrt	
	.word 0xbfa90820  ! 879: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0x85946152  ! 882: WRPR_TSTATE_I	wrpr	%r17, 0x0152, %tstate
	.word 0xbba548c0  ! 884: FSUBd	fsubd	%f52, %f0, %f60
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, c)
	.word 0x8194e099  ! 886: WRPR_TPC_I	wrpr	%r19, 0x0099, %tpc
	.word 0xb7a00560  ! 892: FSQRTq	fsqrt	
	.word 0xbac50000  ! 899: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0xbd540000  ! 900: RDPR_GL	<illegal instruction>
	.word 0xbe8d2189  ! 903: ANDcc_I	andcc 	%r20, 0x0189, %r31
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5518000  ! 907: RDPR_PSTATE	<illegal instruction>
	.word 0xbba81c20  ! 913: FMOVRGEZ	dis not found

	.word 0xb8b54000  ! 914: ORNcc_R	orncc 	%r21, %r0, %r28
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 23)
	.word 0xbfa50840  ! 917: FADDd	faddd	%f20, %f0, %f62
	.word 0x8395e1aa  ! 918: WRPR_TNPC_I	wrpr	%r23, 0x01aa, %tnpc
	.word 0xb1480000  ! 919: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7a50840  ! 920: FADDd	faddd	%f20, %f0, %f58
	.word 0xb151c000  ! 923: RDPR_TL	<illegal instruction>
	.word 0xb7540000  ! 924: RDPR_GL	<illegal instruction>
	.word 0xbd643801  ! 925: MOVcc_I	<illegal instruction>
	.word 0xb351c000  ! 926: RDPR_TL	<illegal instruction>
	.word 0xbba548e0  ! 928: FSUBq	dis not found

	.word 0x8595606d  ! 931: WRPR_TSTATE_I	wrpr	%r21, 0x006d, %tstate
	.word 0xb9a00560  ! 932: FSQRTq	fsqrt	
	.word 0xb3a00560  ! 933: FSQRTq	fsqrt	
	.word 0xb3a40920  ! 934: FMULs	fmuls	%f16, %f0, %f25
	.word 0xbf540000  ! 936: RDPR_GL	<illegal instruction>
	.word 0xbba80420  ! 937: FMOVRZ	dis not found

	.word 0xbfa8c820  ! 941: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0x8d94e144  ! 946: WRPR_PSTATE_I	wrpr	%r19, 0x0144, %pstate
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 10)
	.word 0xb3a58820  ! 956: FADDs	fadds	%f22, %f0, %f25
	.word 0xb5a58860  ! 958: FADDq	dis not found

	.word 0xb5a589e0  ! 959: FDIVq	dis not found

	setx	0x4f35088a00002c4b, %g1, %r10
	.word 0x839a8000  ! 960: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbb504000  ! 965: RDPR_TNPC	<illegal instruction>
	.word 0xbda81820  ! 967: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbe3d6197  ! 968: XNOR_I	xnor 	%r21, 0x0197, %r31
	.word 0xb3a81820  ! 969: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9a80420  ! 970: FMOVRZ	dis not found

hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3ab8820  ! 973: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a44920  ! 978: FMULs	fmuls	%f17, %f0, %f28
	mov	0, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7abc820  ! 983: FMOVVC	fmovs	%fcc1, %f0, %f27
	setx	data_start_6, %g1, %r20
	.word 0xba2d20d1  ! 989: ANDN_I	andn 	%r20, 0x00d1, %r29
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 32)
	.word 0xbfa449e0  ! 992: FDIVq	dis not found

	.word 0x8d94e0e2  ! 995: WRPR_PSTATE_I	wrpr	%r19, 0x00e2, %pstate
	.word 0xb7a00560  ! 996: FSQRTq	fsqrt	

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

	.xword	0x27d66c28d0923043
	.xword	0x8d86a5dedd7a49d7
	.xword	0x4491af56b3fd0b03
	.xword	0xf102150380a962fd
	.xword	0x00520445621e4667
	.xword	0xeb21aa6194fe4ea6
	.xword	0xfeb51adb1c65700f
	.xword	0x7ac7b61d4d14af1a
	.xword	0xda213d79c3cd2fc6
	.xword	0xf68299f062cc6800
	.xword	0x9d501d6fe164d2be
	.xword	0x352fcfb09fdc3766
	.xword	0xeb735aa0f5034588
	.xword	0x218211d2c69a716d
	.xword	0x342ae5fa13db6db8
	.xword	0xca056a067dc60982
	.xword	0x422b3867e3e4923b
	.xword	0xd1eb3f49b1e168d1
	.xword	0x281e3782c3bc0c7f
	.xword	0xc198a930fc26b545
	.xword	0xa28ffb0494760719
	.xword	0x433b9538e017ab07
	.xword	0x9a68c72b27b80fa3
	.xword	0x4b2835087f86a105
	.xword	0xf0d4d0f27bba1716
	.xword	0xbe57d92f41fc3ffc
	.xword	0x2a3152a8ef142009
	.xword	0x3c48187c87226d71
	.xword	0xd4b8d2127fb4f989
	.xword	0xfc744a18c07fb223
	.xword	0x347962f53c2130b1
	.xword	0x07943809a53ae3eb
	.xword	0x9caf4e6ad43434d0
	.xword	0x146c63b8ee352e62
	.xword	0xeacfdd37ac5f294d
	.xword	0x26f955121fb9ad38
	.xword	0xee05f2658c010a2a
	.xword	0xdd31515841aa3d6e
	.xword	0x52d9cfde8825786e
	.xword	0xdbee53081f12f048
	.xword	0x2f095711dcf8fbcd
	.xword	0xd086d287bfc86025
	.xword	0xe0d031f8d15c85f5
	.xword	0xa1e3b18cb0a49a2f
	.xword	0xa9ac43498e9e81ba
	.xword	0x44fe1c6103593e22
	.xword	0x3685a94c071aa1f8
	.xword	0x1c280611ca32c3be
	.xword	0xfc52d9fc5fc2db9c
	.xword	0x6b0904549edbc723
	.xword	0x74e297d39e8a19ee
	.xword	0x9ac025c81ddbc254
	.xword	0xc188e98f22d3558c
	.xword	0x1edbb5b31a475395
	.xword	0x080ed6e429adafa9
	.xword	0x4925dff05f5eb38a
	.xword	0x070bce4c2a55ae67
	.xword	0x2b8a8a4d6fc8e355
	.xword	0xea038b8dcf2e16dd
	.xword	0x33859715ec62e69e
	.xword	0x07712f4f0ef32af3
	.xword	0x52ed050cb406d74f
	.xword	0xbb172131b9fbfa24
	.xword	0xbbddd559cd8abfa6
	.xword	0x4e9874aa3b2fbdb0
	.xword	0x3194458f118601cd
	.xword	0x8b005358c92314d4
	.xword	0x3851cf124fefcd36
	.xword	0xcd8351510f78cf27
	.xword	0x6f23bc49c6578caf
	.xword	0xf5535ae17611d8c7
	.xword	0x31e91a41cba49dce
	.xword	0xf88d244be8ebb6ea
	.xword	0x20907432f0cc695f
	.xword	0x1982166bcbb42d15
	.xword	0xc8bd43a60a419ae7
	.xword	0x11fdc56ab67497d6
	.xword	0x6d53287ca9f96340
	.xword	0xb760bc3e8ea8b58a
	.xword	0xdd44de9ac17238de
	.xword	0x49d846166a053001
	.xword	0x5a60df18fdd135a3
	.xword	0xc11a1c79db5d043c
	.xword	0xc36d61b66f0668f6
	.xword	0x72f0126f7b514962
	.xword	0x9d611615a1350f95
	.xword	0x5c895081464ab914
	.xword	0x936ae056ceac6edb
	.xword	0xc7df589acd9beffa
	.xword	0x0cb3de105d69284c
	.xword	0x20fa24035c6d7100
	.xword	0x1b57896f4131005d
	.xword	0x91d11e0eda9da678
	.xword	0xe683cb6da2d34735
	.xword	0x52c587d5582a23a7
	.xword	0x69618ccc93d877fb
	.xword	0x8614e41f89b5aa73
	.xword	0xd6e38482ab2e154b
	.xword	0x7528623dca63d31a
	.xword	0x92620139f84d8d15
	.xword	0x9d68418798c8a4f8
	.xword	0x7fd76a487ac023dd
	.xword	0x3bdd06bf79758338
	.xword	0xb873bff0e621cb11
	.xword	0xef46e37a1ef379ba
	.xword	0x156647ec712783f8
	.xword	0x9e481d8f7110711a
	.xword	0xf6f70a40be871a85
	.xword	0xfeff503f2efb71c3
	.xword	0x3cd3e154934e1ebd
	.xword	0xab573a821ef17a68
	.xword	0x65c63a53b76e71e7
	.xword	0xd063eb145ea6d474
	.xword	0x9fed38669d5f0968
	.xword	0x7daa8a263565ec8b
	.xword	0x0d4c1d436f2863b2
	.xword	0xbb1ed03f1c4f610c
	.xword	0x1dd68f2ced4e68ae
	.xword	0x7d824ebed6802323
	.xword	0x684d9513ae368b7d
	.xword	0xea8799d67078e69c
	.xword	0x2ee2fe781295bf95
	.xword	0xcc145689de01f370
	.xword	0x1957b488eb1876a7
	.xword	0xcdd806c1b7c572ff
	.xword	0x07be0ee3e092eac7
	.xword	0x2f540b0ea8a84ee8
	.xword	0xba924a3c2a1c71f0
	.xword	0x353f36dc72019bf4
	.xword	0xa899888cbe5a76d6
	.xword	0xebaeb5e68728178d
	.xword	0xe36102ae602f1b74
	.xword	0xe2a4f1fdc0ed9f94
	.xword	0x968fa788a369cc95
	.xword	0x7c825f9022cf5fa6
	.xword	0x7edf4c8c5b07deea
	.xword	0x497fdf5759dd2bcf
	.xword	0x00e0169b4ea2d2b5
	.xword	0x82e406402484677b
	.xword	0xe44ed4da720e7f93
	.xword	0x3e2d2d58ce3c4b95
	.xword	0x2ff7fa80687a0076
	.xword	0x19a96413fa17945f
	.xword	0x1f58762a32c171b8
	.xword	0x0fdc395ed0a25ed3
	.xword	0xa859aa5a75f76927
	.xword	0x55fbc16eee2d3c52
	.xword	0xf20ee1e83eb38446
	.xword	0xc8df79cebb7e93b7
	.xword	0xac4b659da2804d7d
	.xword	0x57ba90976b08aa78
	.xword	0xee1f93bfc2465610
	.xword	0x92f10770a5f43069
	.xword	0xdce7be15b92dd47f
	.xword	0x94b515a13237cc79
	.xword	0x709b4e45318fb5de
	.xword	0xe87de26afa4fc92b
	.xword	0x9d61b6ae07bc63f6
	.xword	0xaee48fffa3296a96
	.xword	0x27cb712cd55a456f
	.xword	0x6d215b5badfa28cd
	.xword	0x2828d23033096c30
	.xword	0x213b7ca0045aeb35
	.xword	0x2c913b861aa371fc
	.xword	0x875600406a7548d1
	.xword	0x5c614939c9fbfc79
	.xword	0xb375dcb64902a11e
	.xword	0xeb55bc2835254ac1
	.xword	0x7e237c4b13e8d9b3
	.xword	0xc1e12bfdb8f229ee
	.xword	0x37b1af593a93057a
	.xword	0x494ede891ad758c6
	.xword	0x344c01b763e46a8a
	.xword	0xa356551340e24e42
	.xword	0xff5f65d1936da698
	.xword	0x325c7b957fbd50c5
	.xword	0x9143e928003600e0
	.xword	0x225f043f79866986
	.xword	0x6056ef948069762a
	.xword	0x0c31cd4ba44882c7
	.xword	0xfe068b6dd633b237
	.xword	0x2837f67aa83d123e
	.xword	0xc9e897da20859ef3
	.xword	0x98aeb34a6c8f3ca6
	.xword	0xfdab6757f04aaf6a
	.xword	0x20372438b02d0b92
	.xword	0x70171ec56dac9cc9
	.xword	0xc2e9ec306dfba315
	.xword	0xf9c20d1791eb4c56
	.xword	0x2a0f40bc17421132
	.xword	0xbfb8489a09b3720c
	.xword	0xf8c5b6be32d36082
	.xword	0x65984de6e6afe863
	.xword	0xdedb506f9acfd379
	.xword	0x15a1392366698faa
	.xword	0x4e1d341eff23a806
	.xword	0x9f77b78cc110d450
	.xword	0xb556b36c5f538016
	.xword	0xf0afb3091f970acc
	.xword	0xce97be901f748ff0
	.xword	0xb65ea1ee020d7597
	.xword	0xe6104a5d4009beef
	.xword	0xcaa3924889417b89
	.xword	0x2e8073f4b98f4160
	.xword	0x7b63e611a12c2474
	.xword	0x7a640dc7aad79414
	.xword	0x12310312863c8d42
	.xword	0x04181ef2533d3755
	.xword	0xe85cb139bfd627ee
	.xword	0x6afb27c269ba6974
	.xword	0xd75797cbe62647fc
	.xword	0x1848a34c15f479d8
	.xword	0x87764a2446090b53
	.xword	0x4fb009bf489dce38
	.xword	0x6122f207e10cb854
	.xword	0x81dee9055193be0a
	.xword	0x7baf0b2577056c78
	.xword	0x3a03c6d8c1f2de2d
	.xword	0x9784857768da1337
	.xword	0xe9e06cd4efd96980
	.xword	0x5e21ed6c33e43135
	.xword	0xb5221e86787e1f10
	.xword	0x53dd844083103e69
	.xword	0xaa2b2c033eed4248
	.xword	0x7763273cff6b1e28
	.xword	0xaa5174f261aae82b
	.xword	0x3485f0eb23e2083c
	.xword	0xf3e647b7d61983b6
	.xword	0xfc691b724e4a5b06
	.xword	0x1a8c628779c8a13f
	.xword	0xc191824fa3721c1a
	.xword	0xf29ee0343c0010b5
	.xword	0x2024f0cd4a79fc53
	.xword	0x1797f52d37e27d4f
	.xword	0x4604d584811a800e
	.xword	0x44c5938a312d2966
	.xword	0x54408aa94bb43daa
	.xword	0xb8393362bf18dd28
	.xword	0x24ef65d5b8fae520
	.xword	0xc2b15cac10e903a6
	.xword	0xc8ba26cc99299b04
	.xword	0x5f6ff5b5be2c3e1b
	.xword	0x33c39aad71374833
	.xword	0xb53524d8b6dcff2b
	.xword	0xfe0c2f8f669f73dc
	.xword	0xc56eb07b449c2f93
	.xword	0x70f0539df49ca957
	.xword	0x367d418087ce1785
	.xword	0xb894acd443f8f8a5
	.xword	0xe59684498e64ed5e
	.xword	0x064f0ae87a11fd57
	.xword	0x5d93f524bf1e9d17
	.xword	0x440b7840b653f819
	.xword	0x31cc5630b89e798a
	.xword	0xe45c56f8dec6a3c3
	.xword	0x494767bb532ff9a2
	.align 0x2000
	.data
data_start_1:

	.xword	0x3f0eec2ff170c2b9
	.xword	0x131349c81e049f4e
	.xword	0xcd625fb8907fbffe
	.xword	0x41fba6e93b787e0a
	.xword	0xd2b9198194de7f05
	.xword	0xed3c1a2303bba1c3
	.xword	0x9535b89850b1f98c
	.xword	0x0d9b437a25471e81
	.xword	0xc3c32630bc9c07b9
	.xword	0x50013f6eb33047b2
	.xword	0xc4685505f638e9eb
	.xword	0xc9b19e87834c4d99
	.xword	0xb82f1d63da7a592b
	.xword	0xa1a3676dd4bf5923
	.xword	0x020493e688ac36b0
	.xword	0x8572300028fadcc9
	.xword	0x2313d3a26f8bdd99
	.xword	0x278869c9fdef1628
	.xword	0x2676553e9504f9e3
	.xword	0x0c99586b71af9e31
	.xword	0x1f3daf86d1da9658
	.xword	0xde63af344a93a0ec
	.xword	0x8fdc48e1f1e1ad12
	.xword	0x6c0cf80fbd443e71
	.xword	0x13e3c32e2aa2f6f2
	.xword	0xc767633a7356b4ab
	.xword	0x54fad22157fbb18f
	.xword	0xb843f24ba6304384
	.xword	0xe4e0c348fa25e479
	.xword	0x7e6ce8d8a5d1a00b
	.xword	0x8ff0fb48c119d854
	.xword	0xd79ee6c84bf2d3a6
	.xword	0x224dc81da240b409
	.xword	0x85136c497826c030
	.xword	0x7013425fcb7714aa
	.xword	0x4f90ee9efeca766e
	.xword	0x2b676bc5c24393e3
	.xword	0x1cb73bb37a0704d0
	.xword	0x71517ac273260cba
	.xword	0x5770923030f72857
	.xword	0xc0cf98a11dd083c9
	.xword	0x247b5a270dedaf83
	.xword	0xbf6c7e67b7925914
	.xword	0x0149370971122bbf
	.xword	0x230dbf81505cf938
	.xword	0x09aa4184b09d8a13
	.xword	0x2c70287769387876
	.xword	0xc935848015c82cfb
	.xword	0x1f9a15e957c291bf
	.xword	0x9b509e95eeffb329
	.xword	0xab8d5efc976147e9
	.xword	0xcbd722f9052e8a32
	.xword	0x7bc070ee8960284f
	.xword	0x75bcd63def22bb2e
	.xword	0xd486b4e83587c28f
	.xword	0x0b8fb4b2e050c8f6
	.xword	0xb3397e5d03bdc515
	.xword	0x2ffb5a0c3e841b91
	.xword	0xbe96dfd6e2a9eafe
	.xword	0x8ddaa12aa9f2253a
	.xword	0xb46c4289a7bf9bc2
	.xword	0xfad10f8a58a729bd
	.xword	0x6dd4d0fa012317be
	.xword	0xb9a54be633b248af
	.xword	0xee3a4b2d9adfaebe
	.xword	0x7cc89cdf3859409b
	.xword	0xb648027c723ec0ef
	.xword	0xa5d91b2848b4b66b
	.xword	0xb351a6ae07ef2e22
	.xword	0xe9ea40b069778b41
	.xword	0x07640c8a722347f6
	.xword	0xdeaa2a8cc9fa6f1e
	.xword	0x116e51021b6c87b8
	.xword	0x0938fd7a40902f58
	.xword	0x30ca80998a1631d3
	.xword	0x8e15717aac82de8b
	.xword	0xd976291df91fc221
	.xword	0x2aa483a9c20417ef
	.xword	0x532e11fe7d6d54f1
	.xword	0x2a3e090dbbdcdafc
	.xword	0xe90c19d8e4eefe4e
	.xword	0x68d7d0b389f757a4
	.xword	0x3f9d96319d0dc81f
	.xword	0x9b5a32a93d980dd3
	.xword	0x38716961acfa3c94
	.xword	0x187b040d5450318e
	.xword	0x1100f0ee5f88ca8f
	.xword	0xfd045a036bd78e6c
	.xword	0x1856be7f44a4c3c2
	.xword	0x4ec62679946e1aaf
	.xword	0xb08da9692f2bf652
	.xword	0x68a098a73468ae16
	.xword	0x3d98d90f1246b337
	.xword	0x0f1a2e2bd39b67e3
	.xword	0x192d8b17b4aba62f
	.xword	0x44f08a4b5b4be823
	.xword	0x4d97117f1b9128ca
	.xword	0x37731ed304bcd707
	.xword	0xd8f55eabc85283cb
	.xword	0xcd624d6f9117566c
	.xword	0x9924d81a0a5be69c
	.xword	0xa99a5385c320ef6b
	.xword	0x77d4bbaecfb0760f
	.xword	0xa24789c66333a514
	.xword	0x6810a448ed804308
	.xword	0x33ab18e46b36191b
	.xword	0x775b8c005110d902
	.xword	0xe435815938e0cc18
	.xword	0xa2314754d9707851
	.xword	0x85985263dcdcf821
	.xword	0x9d176f476369efc9
	.xword	0x49ab79e9070e083b
	.xword	0xedfd124fa4c3955e
	.xword	0x16844efe995a8fc0
	.xword	0xf9631b79825ef4c3
	.xword	0x84e7675341aeccee
	.xword	0x6fc50284de623cfe
	.xword	0x3c82272ebb858741
	.xword	0x18e4d800325527a2
	.xword	0xe56f1e1e7d1e67ae
	.xword	0xc01edeb074e1140b
	.xword	0x39929c2c6810340f
	.xword	0x0c198b054e1e98b3
	.xword	0xeee64ef6eec06565
	.xword	0xa9930d77999afdad
	.xword	0x45db054e7f7e8d66
	.xword	0x782b26fa86d34f0f
	.xword	0x148f65b2c19e4f5b
	.xword	0x41d33abb6698c92f
	.xword	0x168fadc419d3edf2
	.xword	0x07076ce1822cc106
	.xword	0xf3aa8220ef193cc2
	.xword	0x5a578676a4168d44
	.xword	0x292b3bceecf4a17f
	.xword	0x30a1fe7f7a2075d8
	.xword	0x4b25c8a5402bc6f0
	.xword	0x70a6c35100048113
	.xword	0xbb066beb2547ef25
	.xword	0x087468171c65c450
	.xword	0xb65e09475c888cca
	.xword	0x6e42a1450ac82fce
	.xword	0x87ec33caa3779262
	.xword	0x11fdf369334be4ab
	.xword	0x30ed51f3b7e4f21b
	.xword	0x480d9ebe6330b914
	.xword	0xe5ac7b64e3a93a63
	.xword	0x495dbffa2705b1fe
	.xword	0x76fb67079a06500c
	.xword	0x747df8cebe9aeedc
	.xword	0xce8a2d3229cb3657
	.xword	0xa9031a080b9cd43d
	.xword	0x8e3ceb1c1302c85d
	.xword	0x16117bcab3e66d4d
	.xword	0x9267506f36200fa5
	.xword	0xc4e45a81d7c1cad4
	.xword	0x822dc58fa1b582a6
	.xword	0x0df3c034cc91128a
	.xword	0xf2e4c0834acca378
	.xword	0xa94b39f8c7629d60
	.xword	0x88604a349d7e3c7e
	.xword	0x312c5bd4819dd724
	.xword	0x0dd1700e3bdb0f18
	.xword	0xd878d5c62a077158
	.xword	0x7f5eb1b3faea9d8f
	.xword	0x238a7e59947c899c
	.xword	0x43799cf4cac8e60a
	.xword	0x73a792417ec37344
	.xword	0x6295066caf8799ca
	.xword	0x02b2ef1953aca92d
	.xword	0x6109a2be26540548
	.xword	0x6e6ec126fc01453c
	.xword	0x51c914f5e8dca8b7
	.xword	0xc2978f6fab1eb997
	.xword	0x0b464489f3e9189c
	.xword	0x18af641fa8185b44
	.xword	0x424d51f7b4c532fa
	.xword	0x1240732593a50f47
	.xword	0x40ee61f0b6cfe4a3
	.xword	0xc42d963f4f71af8d
	.xword	0xd8aa5d4fe83d19bf
	.xword	0x889917901807eafa
	.xword	0x1de73d5adb1eb080
	.xword	0xc0c39bc85585a77d
	.xword	0x769ec29f710210e8
	.xword	0x233637cbafd92b28
	.xword	0x9c6fc2a302c1266c
	.xword	0x5ebd99c86e666c32
	.xword	0xa9cc97b7809cab28
	.xword	0x8969f9da436f7c2c
	.xword	0x449033a392d69256
	.xword	0xdcc482e137ec5e27
	.xword	0x14f61c62f525ce77
	.xword	0xb368efe1232c7bce
	.xword	0xf2b3b1940603f3d3
	.xword	0x41462e0a4920457a
	.xword	0xc53f9f37675147a3
	.xword	0xce7304c0e590e1d3
	.xword	0x6b8667161938db32
	.xword	0x448b2a7def9bc5dc
	.xword	0xf38ae269777bd798
	.xword	0x7c458128917c8abe
	.xword	0x9ca49c8bfab27bb3
	.xword	0xd0fe4a4ed453e435
	.xword	0x1205bf0b5f846c5f
	.xword	0xb5d4ae8795e5b648
	.xword	0x5533cdfa8e59a2d6
	.xword	0xf002d718e84f02e8
	.xword	0x50fa26d76d7f0a12
	.xword	0x6798dce43f467468
	.xword	0x4077b78adfc5f467
	.xword	0x5c9e5d1ebc65301e
	.xword	0x9235e9d39b909bd2
	.xword	0xb3b52c856cb3bd6d
	.xword	0xe21ec78660c71334
	.xword	0xd39db341ac5efb0c
	.xword	0x6a595ad79473d9f4
	.xword	0x2eeba9600f66dfaf
	.xword	0xd7c884ea1e67a6c3
	.xword	0xb887eeab5cbd561b
	.xword	0x6300e9fca783a199
	.xword	0x47847ad396769664
	.xword	0x66b38aad6fdcdf38
	.xword	0xac5b1402dd2c339c
	.xword	0x4a42e3d24eef3e2a
	.xword	0xa19a840bc2d8a4ac
	.xword	0x69fe930c94796608
	.xword	0x047fc566f06ac796
	.xword	0x4bea8326af5fc1c3
	.xword	0x79611cca7a378f85
	.xword	0x805ce67e37245eb0
	.xword	0xa67f5db26297a54b
	.xword	0x7b08fe1aab3a6f66
	.xword	0x1352e1e0e285c659
	.xword	0x43f48a219cedfafa
	.xword	0xde825913745415c3
	.xword	0x4242b54f8acd1f1d
	.xword	0x7449859da601d1bb
	.xword	0xfd8f926bb13033d2
	.xword	0xc10e9e55315becdd
	.xword	0xce91de0146760948
	.xword	0x7457cc6f47205a5a
	.xword	0x7336431d48b55cfd
	.xword	0x7c57f1db59560cfb
	.xword	0xe67ad7e0c74b5b11
	.xword	0x866dce3807dc2ee9
	.xword	0x60f9d8c15e8fa5bc
	.xword	0x8744c0fb40be1b31
	.xword	0x7d50a4e50856dad7
	.xword	0x4761988ec5ba3627
	.xword	0x69ca35fa678d3e4d
	.xword	0xafaec8efa21c47be
	.xword	0x33182a1323f3c9a3
	.xword	0xb3bb1f43edf83b01
	.xword	0x080e9c1fd3dd3c05
	.xword	0x45e63940959a9bdb
	.xword	0xbab1dff40223176e
	.align 0x4000
	.data
data_start_2:

	.xword	0x9ae4cd85adfd2bd5
	.xword	0xd0910fd5b859a45d
	.xword	0x9aa97f99bd9d0c19
	.xword	0xea1438e25edaa4fb
	.xword	0x69ae13f1a273117f
	.xword	0xb8064063d1c3c68b
	.xword	0x9cce6c1782b3ab47
	.xword	0xee4e63702dec3d5b
	.xword	0x5d9342feef22f5bc
	.xword	0x0ad9febfffe337fc
	.xword	0x2d60e73366f3f61a
	.xword	0x21a155e6addde303
	.xword	0x56e2edfe8cfa1ab6
	.xword	0x3ad8cee6f408f220
	.xword	0x32416c4d3fb34aa9
	.xword	0x4c957b2a8a9dded5
	.xword	0xdf70b961b0a0bb2d
	.xword	0x0f5c4a9591df20d4
	.xword	0xd0f76626b20c011b
	.xword	0x6c79060bb02d43b3
	.xword	0xf0d86b41b172242b
	.xword	0xf282181dcbbd72a9
	.xword	0xee7dca537acc5175
	.xword	0x1f50a871e2afddca
	.xword	0x7be7cdd4c1ae3337
	.xword	0x130f9af45617de5f
	.xword	0xdac904962933010c
	.xword	0x5826bca7440da08b
	.xword	0xccda5b4aec3fc7ed
	.xword	0x59a19adf1578f11f
	.xword	0xe2e0d9845115fe46
	.xword	0xac54ce8869422239
	.xword	0xbeaf916e237ada11
	.xword	0x39cf12022712cdee
	.xword	0xc4717278ba398bb9
	.xword	0x91d68f72bae2d69b
	.xword	0x6936b61102ba12e6
	.xword	0x680aef2d3b73631f
	.xword	0xa75ee0b6225e2803
	.xword	0x4ae192d7e53c7b09
	.xword	0x773a4298ed20ebaf
	.xword	0x935cdf81ae1aa36a
	.xword	0xf8865786595006b5
	.xword	0x474887811ac312b2
	.xword	0xfa1edf334a6468e8
	.xword	0x4178fb26d3137d09
	.xword	0x5cb383ae497c0a2d
	.xword	0xcd5acec82d4dbdd4
	.xword	0x54ef42a0b0dc235c
	.xword	0x8f3631430a4865fc
	.xword	0x07f4b803c1b37bdd
	.xword	0x953177a0322f985e
	.xword	0xeb593d8f04f9e115
	.xword	0x78fe8da8eaa67bc0
	.xword	0x601c8f7eee724808
	.xword	0x1a092e0b696fbf51
	.xword	0x02d056f5f533e989
	.xword	0x4063a2c956a4e657
	.xword	0xfc3244d9af6b94c9
	.xword	0x66749673ee8c8292
	.xword	0x0f30a3bde0f946a9
	.xword	0x79d15d341dfa8dcd
	.xword	0x8db488a1dca2616b
	.xword	0xfac0df4128da5b99
	.xword	0x70e0deb701d17e57
	.xword	0xdd5fa2eda6603373
	.xword	0xd4b936d12cc7735f
	.xword	0x6f89cdeb3f59262f
	.xword	0x668f16f4da5e15f0
	.xword	0x89f091c69bfe9e00
	.xword	0x99b28d3dba5e6207
	.xword	0x7a5813de86476bfb
	.xword	0x685713e0d0df743e
	.xword	0x7fc1d02bf1233eb4
	.xword	0x8d44abbab3a671b7
	.xword	0xe8262fa7c5cbb341
	.xword	0xde71c07d71b088f8
	.xword	0x30e653bcb6163528
	.xword	0x23c7890aa2c83074
	.xword	0x1bb06260f9412887
	.xword	0xe068e7ed09f4b5f8
	.xword	0x4b8def725ca6ada4
	.xword	0xc1b56b558c17976a
	.xword	0x80bcf6294d7a0cfa
	.xword	0x460f1e08de79d836
	.xword	0x1561be00149af637
	.xword	0x74518947f0f901a8
	.xword	0xd45bdc43e02a5f22
	.xword	0xe5f87d9a6a86bfa7
	.xword	0x5048a348654a1113
	.xword	0xdf7ed5f24dbcd65c
	.xword	0xead7da236c5408a2
	.xword	0xeacb9d1b88aba294
	.xword	0x38d8e2ad2b5cd85e
	.xword	0x06728e81540fca34
	.xword	0x85d36b26ac903500
	.xword	0x2262e979fe7358f3
	.xword	0x91ca4bf3791902d7
	.xword	0xf8f1b034dbb821a3
	.xword	0xbc8dfe8f904c97fd
	.xword	0x1960af2d81dbeedf
	.xword	0x1edac77b94e2aacc
	.xword	0xb1ac53a12e9ea4df
	.xword	0x153264e0c51a7d58
	.xword	0x5c7c2488d46e6078
	.xword	0x5cf4121a7703566b
	.xword	0x1e94600dcd0578a3
	.xword	0xbbac81c9a5e7208d
	.xword	0xc1e3ebf6103f67ee
	.xword	0x84f064d58287dee6
	.xword	0x8b94b7ecd1f2c6a0
	.xword	0xe1780412767b9ecc
	.xword	0x551afc3b499ef0d1
	.xword	0x07a9da7516147cb8
	.xword	0x4633844620404d50
	.xword	0x1174d35a49f6ca24
	.xword	0xdb0ec2eb3dff9673
	.xword	0x5d0aca2e62fdae0b
	.xword	0x583682a3f48928c5
	.xword	0x17f61d8cf7112137
	.xword	0x69c2e532663af636
	.xword	0xf4650744d4cb5013
	.xword	0xa59e5779266b31f8
	.xword	0xf6bb3412d0532fdf
	.xword	0x3bcc272308a97778
	.xword	0xe26434abdfa4669c
	.xword	0xf1d92aa52b1e1a7b
	.xword	0xd504b7a1dced6153
	.xword	0x8913f8aa8035e7aa
	.xword	0x391787396d18695a
	.xword	0x81379b2fa0815622
	.xword	0xf129fea24e69196f
	.xword	0x5cdf77551ba87a98
	.xword	0x44baef057801bfd6
	.xword	0xd49ad9e313f8aa4b
	.xword	0xa8893aea15273ff3
	.xword	0xea927cdc112edfce
	.xword	0x781a8182d6b37682
	.xword	0xf026a538a6d8e6b3
	.xword	0x7296dcd61459810a
	.xword	0x0c79d5da99a2eded
	.xword	0x387b1f1b96f36aea
	.xword	0xa7228fb2e9910c28
	.xword	0xe603502ad3c08350
	.xword	0x18937c38d5a7ceb0
	.xword	0x2754efce47b28b28
	.xword	0x0f548ec6546c1a61
	.xword	0x72c25718690bce00
	.xword	0x1f178a521d4c94be
	.xword	0xa407fe5185642199
	.xword	0x498848b0230c5e27
	.xword	0xc5a731583a44ced5
	.xword	0x2385de69dc4e2fb5
	.xword	0x50c53744e113272b
	.xword	0x2f290243df1a524f
	.xword	0xe37b5b10b65b518d
	.xword	0x460d5b7f65ed32c6
	.xword	0x8e7e0d6140a7b400
	.xword	0x5b3fdf1a43c8a686
	.xword	0x58366a060315f425
	.xword	0x68cd70f43478583a
	.xword	0x2ddbc837f2acd3e9
	.xword	0xe38c24753e4984bc
	.xword	0xe337b02070846b3e
	.xword	0x527f98ebb2afe66c
	.xword	0xe92572f8cb6d2d08
	.xword	0xc47a42d72dc5a3c2
	.xword	0xcb26670622614356
	.xword	0xc22a398d0cadac04
	.xword	0x08db983f5dd8cd3c
	.xword	0xf10966ae1ef744a8
	.xword	0xd37ddddc232f7f22
	.xword	0x9adfd27176a78fc4
	.xword	0xcd8c5ce80065ece8
	.xword	0x04b2e69a8ae27f23
	.xword	0x5ac01807cf462a32
	.xword	0xc68f2d213f23ccc5
	.xword	0xa8d93ae467362c96
	.xword	0x156ed847bbef11f1
	.xword	0xd8d7db880cbd5cdf
	.xword	0x5fc8068a86880d61
	.xword	0x200ba2652047098a
	.xword	0x764ddb8c663983dc
	.xword	0xaffbf08080a4a2e9
	.xword	0x670d43e1e11f9822
	.xword	0xfc42df892d78cb4c
	.xword	0x7534fbfa72ac816e
	.xword	0xc6c00e66ac45b9cd
	.xword	0xcd0b04a1bea86b58
	.xword	0x0f39cd9b448b5211
	.xword	0xc980ba09860c3184
	.xword	0x09572cb1073821f0
	.xword	0x9f468544e428d781
	.xword	0x809bb48181536c95
	.xword	0xa5c884ca0dc7eecd
	.xword	0x776c2a4950d5e040
	.xword	0x45fd03050976d06c
	.xword	0x9b57933705aaea61
	.xword	0x77a33b3c4b69f543
	.xword	0x0549052a53c96487
	.xword	0x7e73ff3928e7aafa
	.xword	0x80e3e1b382e06fd2
	.xword	0x904f4b638cd44d3f
	.xword	0x4dd51036fc7ec544
	.xword	0x8a39980928b883b7
	.xword	0x4f5dd58d80f27d87
	.xword	0x9d74aea57974d6c0
	.xword	0x3799fd3e57b9682f
	.xword	0x6cd401668895ac05
	.xword	0x011c3db2b9f1aa55
	.xword	0x00be10ec7661c8e9
	.xword	0xe5cbb78c54d5332d
	.xword	0x391faf9861546a49
	.xword	0x44a8a64428b02917
	.xword	0x7993fd194ea2d727
	.xword	0xece265e164f61281
	.xword	0xef0518a3b9febb2d
	.xword	0xe86ed3322bc6256c
	.xword	0x68b2e10087946819
	.xword	0xd841817aa9bade93
	.xword	0xa2a22e6f896f545f
	.xword	0xcb1571ecccafa08c
	.xword	0x8f34de102e5d3ec6
	.xword	0xc639c78c3898b06d
	.xword	0x8b4d33d30a56a083
	.xword	0x0e9d5f09d7ea9200
	.xword	0xf8f68a28f1ada5b6
	.xword	0xe1afd079520e4d03
	.xword	0x28f7c0cf1845296b
	.xword	0x4442e7b1f22b1a8c
	.xword	0x275a919646301159
	.xword	0x65f53b202b30fc81
	.xword	0x9b12be896631831a
	.xword	0x96053b1c3f11c799
	.xword	0xf192d825e41dd613
	.xword	0x4d372aec2a6f31a5
	.xword	0x750cd4bcc702c549
	.xword	0x7344ace48dcdb9b6
	.xword	0x036ee92a90aadb2a
	.xword	0x2a6ddaef734f8349
	.xword	0x3c0e2e72eeab3718
	.xword	0x1ba8a0fa9ded6e6a
	.xword	0xcc2a0db61a646442
	.xword	0xd3ab15043d922369
	.xword	0x726d20e83543295f
	.xword	0xc4c988a004fcaa6b
	.xword	0x13eb5cf23519773a
	.xword	0x568c224e03ea3986
	.xword	0xca96fbff5d7d16cd
	.xword	0x854fac02b61d35a4
	.xword	0xe1a174281e789e01
	.xword	0x66a570087e504338
	.xword	0xd4d49c410d745195
	.xword	0xa7d5ef54b95e4324
	.xword	0x80a03d636e9284df
	.xword	0xd797ac30a0d2aa26
	.align 0x8000
	.data
data_start_3:

	.xword	0x35813cb108a34420
	.xword	0x27998e2cdb8ed083
	.xword	0x6326a0b454136ef3
	.xword	0xe7b9dd7eb04abb86
	.xword	0x5f6b75e7f093c797
	.xword	0x5823dd67b0607edf
	.xword	0x42f1b85ae545a8b5
	.xword	0x249f3c40d320170f
	.xword	0xe8e02bb0f7ac09b5
	.xword	0x088ed509d9e8621d
	.xword	0xfbe0d39f8910a8b9
	.xword	0x5d540cdf05e12554
	.xword	0x424ce4c40c45d4f3
	.xword	0x8f6d5d458fae3155
	.xword	0x80fc41ab47419e77
	.xword	0x5d4663b37c2ce922
	.xword	0xf84596fccfcd663e
	.xword	0xdba55ffb3305417f
	.xword	0xf37821049cae1728
	.xword	0x27d8c9bc2bb63b27
	.xword	0x609865ace126fe3e
	.xword	0xfc5c5a420ae028af
	.xword	0x9cc91ca7d344f6ce
	.xword	0x960eefb19780331e
	.xword	0x1475e0e4c7702643
	.xword	0x976d312e7298c6a8
	.xword	0x05af2273fcd61ef5
	.xword	0x398f572fbb603d2b
	.xword	0x32d92e71302450dd
	.xword	0xe8b12722c9649482
	.xword	0xe38c28e228536ad5
	.xword	0xfdd957fb1284d453
	.xword	0xcb8e02aaeb8dff8b
	.xword	0x94cdc85f71d73a27
	.xword	0x1c46edc6c3547f0d
	.xword	0x0503b3953a921b4c
	.xword	0x9a26e735140d2457
	.xword	0x85f60dd4d1446eea
	.xword	0xd13f966fb2132be9
	.xword	0x93a001df6540e489
	.xword	0xe22a9b799b224a78
	.xword	0x19866d7e06911789
	.xword	0x6b34e3be241dfc50
	.xword	0x2fff7bc21f1c366b
	.xword	0x80b443b4647fb345
	.xword	0xa52080bd94f9ab5b
	.xword	0x78afff41839d7ce0
	.xword	0x7f62e98294d5cfe0
	.xword	0x95a6fb0090472312
	.xword	0x6ea287b13ece17b0
	.xword	0xb8919d24fd87524e
	.xword	0xd87c1d82578661e0
	.xword	0x43d079c9e8ee0e28
	.xword	0x50cad7f33c359141
	.xword	0x9d55ee7779a75d97
	.xword	0x01799031b6bad0ea
	.xword	0xe211a968765e8607
	.xword	0xab9b61b6578b8aaf
	.xword	0xb987defb601c5b4e
	.xword	0xe2c15b0f71ef8298
	.xword	0x5e77a860a2857b05
	.xword	0xbbaba49ad623e4a9
	.xword	0x6995dd7c6d4d3d6e
	.xword	0x6f8637a10da48df5
	.xword	0xcf15a2329a045ce1
	.xword	0xdbf5fe0f97b456a3
	.xword	0x4ec4640a15f92080
	.xword	0xc5487df2b6924a9d
	.xword	0xab352c594e4fa5da
	.xword	0x25f15d959061dd6a
	.xword	0x4b497a5851b00b77
	.xword	0x85eb75e196791503
	.xword	0x066673b46c7f33ca
	.xword	0x33a30cb836e464f5
	.xword	0x78ebad8e79c6c5b3
	.xword	0xdfe811d98508f8c8
	.xword	0xb9473fb8e8ad59f0
	.xword	0xb6d5f23c6d8007bb
	.xword	0xf645bf462eea7e04
	.xword	0x4f3e8f96fd5eb538
	.xword	0xa94c84b0b6991446
	.xword	0x05e97687e6aa8c24
	.xword	0x5ba57e9cbe225ae9
	.xword	0x46c9a01ba270c390
	.xword	0xbcb6b1b3e3428d83
	.xword	0x7e82032ee371e27e
	.xword	0x3f5a581838c576ea
	.xword	0x413c3481e93c8d51
	.xword	0x712dcb0b0e7e5a19
	.xword	0xfe467e6d9bd30803
	.xword	0xdf58006cf4473006
	.xword	0x3ad0513abf8f07f2
	.xword	0xf361b744b722c8d0
	.xword	0x4538c2b05ec8f3a4
	.xword	0x20ec1e3d5da12065
	.xword	0xaa5d45fdd79c05bd
	.xword	0xa848d90c3fc53583
	.xword	0xa3b45791f962297c
	.xword	0x4e1e6556a1020726
	.xword	0x0d4919bd9d81750f
	.xword	0xe7fa46445c929772
	.xword	0x8bbb4e8dfd3168b2
	.xword	0x6721a78896444579
	.xword	0x4a6ef8b0205484ff
	.xword	0x5ef64483b78dc2b5
	.xword	0x892f2cb42b6f6326
	.xword	0x1e0b5ca463829e6a
	.xword	0x92a13011e67e31c8
	.xword	0xf4a61ab625e575e1
	.xword	0x6683b0a12d7afe31
	.xword	0xe3855df5cd6494c6
	.xword	0x87c9d16d1f41c14e
	.xword	0xae177c7839577b1c
	.xword	0x485c8c0296c7a88c
	.xword	0xc66ada2fd24ba8bd
	.xword	0x3165d5bac62536d9
	.xword	0xc621513568b399ac
	.xword	0xee6d08fd5469cef1
	.xword	0xcb0a8b6dc9c0cd82
	.xword	0xddd91cf498bf9c46
	.xword	0xcd38b5f2fd8e095c
	.xword	0xe1b27ce5e0ed151c
	.xword	0x261aca872f1625a0
	.xword	0xa17f665fe51456bf
	.xword	0x6bfc0b5584eb8a98
	.xword	0xdc28019b0509107c
	.xword	0xad83269df3cd98c1
	.xword	0x2cc4da436c6feecf
	.xword	0xdb4393b9eb1c09aa
	.xword	0x11a646e52d0d520b
	.xword	0xb410f043b1a9f045
	.xword	0x4e0b4be3eb5dc3bf
	.xword	0xa876858523644699
	.xword	0xcb2b42ea92b9819a
	.xword	0x0832e19d52d113c2
	.xword	0x664979e7ab1cc3b3
	.xword	0xff98863519df91ab
	.xword	0xd37ce8cd20db4c25
	.xword	0xff2cfe18cdf98282
	.xword	0x177fc9659ea1973f
	.xword	0x8cb446d556a8ff51
	.xword	0x47d1a93ac5ed9037
	.xword	0x4ed7bf245119170e
	.xword	0xe135cf09e6bdc7dd
	.xword	0x7d24a249076e8f3f
	.xword	0x6666d797cf703f86
	.xword	0x4cacb40c34006fb4
	.xword	0xf44800b3d0234c7d
	.xword	0x9195f8927452a167
	.xword	0xe71a830f4d61f9f3
	.xword	0xa68d639591038159
	.xword	0x2dd9e7fe2e4ba4b1
	.xword	0x9fe2ff3d44821cc3
	.xword	0x21475bc139b6dc96
	.xword	0x0459734354eacc61
	.xword	0xaf01192a2e0d1add
	.xword	0xf983d82c446fbd7f
	.xword	0x65d2feed1a701858
	.xword	0xf6267eb08c55dda9
	.xword	0xc47eddfd5b467cca
	.xword	0xf354f272b9b3780b
	.xword	0x0394df80b65a06e6
	.xword	0x6f7dcf3137faca84
	.xword	0x79394c69f19ae696
	.xword	0xe134f524288d9f00
	.xword	0x5b3b0dce738ed314
	.xword	0x396cabba7b2683b5
	.xword	0x6378d25fafa4f46a
	.xword	0xde5acce8a36204ef
	.xword	0xd482b8d09a2f662e
	.xword	0xb58aafb5adb15c1a
	.xword	0x666675ff6b61e8b7
	.xword	0x62c0120581ea8095
	.xword	0xc41318e4029fd720
	.xword	0x09d53ce37bc12dec
	.xword	0xd2f044bd6b4fe066
	.xword	0xa93d8771adcad2fa
	.xword	0xac14463e758f2f7b
	.xword	0x78034d41bb5d486a
	.xword	0x738bbec52850830e
	.xword	0x915140f33dd8a327
	.xword	0x76d315dcb00da966
	.xword	0xc35657a97db6c614
	.xword	0x31ec0c0be1db60ab
	.xword	0xddbaffa1ac9fa3b2
	.xword	0x5f3e7fbf92226b7d
	.xword	0x6f9cb24dd342c947
	.xword	0x48069cae27d28601
	.xword	0xd27c450ff43e6740
	.xword	0x52ed47b83f34f797
	.xword	0xcc46a363c87e5188
	.xword	0x956d41bab64c3e7a
	.xword	0xf3d4368f779286bf
	.xword	0x8edafe99902c1cc1
	.xword	0x6cfd28d377153679
	.xword	0xbad12d719241f40f
	.xword	0x8eef0c1dde667bad
	.xword	0xe4995cf06c784b0d
	.xword	0xf2c73499dd838a3e
	.xword	0xf0586ba7c5bd63bd
	.xword	0xec1ad854ed896ebb
	.xword	0xff6909d36403ab28
	.xword	0x8fe8aabe323be0f2
	.xword	0xd8c1e3999da901c8
	.xword	0x0a7864e16a789a7e
	.xword	0x825bc6ca24c6ae90
	.xword	0xcde55b72276fc2a4
	.xword	0xd5f467ef697c1216
	.xword	0xd25c5ac27cdaa2b0
	.xword	0x3021bd44d5d40fef
	.xword	0x70a363715b8fcef9
	.xword	0xf1d67f8c94768482
	.xword	0x87332c96fe389c9c
	.xword	0xa74a18c3b6c9d813
	.xword	0x56cd590766e3f194
	.xword	0x88658bb015c3914e
	.xword	0xdcd28be6e72fe22f
	.xword	0x3b3ff8914ea037b5
	.xword	0x0b063939b32deb02
	.xword	0x5694a030d9ae258a
	.xword	0x2719021808ee6acc
	.xword	0x9aef07b3f22de31d
	.xword	0x3072e6fdaca09c04
	.xword	0xf9768925fa17dcee
	.xword	0xfebeadc3e94e0deb
	.xword	0x399903a7ac85a54c
	.xword	0xdbcb45b27548fe89
	.xword	0xe449891d9dd7346f
	.xword	0xdb439b18c9867f4d
	.xword	0xe3f65de02d09e98e
	.xword	0x3f92307e8c7eda7f
	.xword	0xba97f21a1d8dbdc7
	.xword	0x8ccbd66fceabfc15
	.xword	0xa0dc46c092f1df4a
	.xword	0x434992628268c705
	.xword	0xcba4cf9b7e1fb605
	.xword	0x0c67ca4344b64715
	.xword	0xf573cbc3e9ce9453
	.xword	0x8817013e15a5e4f8
	.xword	0x38400fafc67ce4c4
	.xword	0x876979c6d3075045
	.xword	0xb4932d77b1237bb4
	.xword	0xbacfaaf9bc834874
	.xword	0x6d8f4286df9ad8c0
	.xword	0xf29de44d865d38b9
	.xword	0x1bfcff6764c16180
	.xword	0xa96f5e4b6a5e1c39
	.xword	0xdb1c93ede42514cf
	.xword	0x7ebccb5cbc9dd7b7
	.xword	0x685a7720a12211ed
	.xword	0x9e9e2c18b662bd91
	.xword	0x8667ca63a593ad88
	.xword	0xba62c6ef42227288
	.xword	0x3a0c90530434c9e0
	.xword	0x80aff47e72750798
	.xword	0xc6a5e268b85d7db7
	.align 0x10000
	.data
data_start_4:

	.xword	0x5599460b374de5c0
	.xword	0xda8ce3bf750b4992
	.xword	0x6f7b5f7815ff1fd0
	.xword	0xb461f6f593439133
	.xword	0xde73dac123c69b70
	.xword	0x95ed12be29a5bac8
	.xword	0x2830301a1e67ea7c
	.xword	0xaa79b2f8d15dd260
	.xword	0x45e4c30a74b9e7bc
	.xword	0xef2893cc147517f5
	.xword	0x87108a27318e6b14
	.xword	0x1a970642496fbf74
	.xword	0xfc0893337071b7c9
	.xword	0x050a02abb62d2e1c
	.xword	0x3f081f249230f430
	.xword	0x480842817fe9de46
	.xword	0x6919c39bc489cd12
	.xword	0xc539fcda6fa7f729
	.xword	0xa77797c4d8cd0c43
	.xword	0x1d2e42d5c7d3e720
	.xword	0xb880670ac056151a
	.xword	0x1f5113d771958d5d
	.xword	0xd8ad63725b430aa3
	.xword	0x1a75482ce4c387fe
	.xword	0x812239b44af7cae8
	.xword	0x0eb5b89ebf16521b
	.xword	0xe0863252b83873b7
	.xword	0x88d1008ff013abc8
	.xword	0xaf50394e1d2c48ef
	.xword	0x357de6955840237f
	.xword	0x483e194eb2d2c99b
	.xword	0x9d488e462aef29f8
	.xword	0x1d30fb40bbe55e51
	.xword	0xb07f0a29d00d433f
	.xword	0xba3683857a31391e
	.xword	0x1b20845d2a7d8738
	.xword	0xc13c3e77c0ebc543
	.xword	0x01c20dcb8c0cdddf
	.xword	0x300e154eb50d41dd
	.xword	0x65fddf7a71805dd7
	.xword	0x3a487cbdf902d461
	.xword	0xac75812a7a2e2103
	.xword	0xcdc70d2f65a9c136
	.xword	0x0f054b1d6bee1082
	.xword	0x26cc7871829a815e
	.xword	0x1f7e95be4c2ca1d5
	.xword	0xf3b4002612a94be1
	.xword	0x3c79dce5d7ae026e
	.xword	0x81ece0c38616de5c
	.xword	0xcb160bab82689e3e
	.xword	0xed7c78d5ed7083d9
	.xword	0x80b87e632b0580e9
	.xword	0x0547dccf36f09d0d
	.xword	0x6012316c3780d199
	.xword	0xcc3d0a80927c3437
	.xword	0x841a192bd1831f87
	.xword	0x4a34adc14d8c9c99
	.xword	0x6ebd65cdad1407a9
	.xword	0xddf46f8f9a6da768
	.xword	0xc42afeaf3adb9b40
	.xword	0xc4f443f785665d8e
	.xword	0xdfb26a5cf8ae9d9a
	.xword	0x4096daa4354b8ab1
	.xword	0x75fdc5fc94e3dd7e
	.xword	0x45c5e26b4220d068
	.xword	0x3bebbbf09426f5ac
	.xword	0x77577900213b0db6
	.xword	0x10bc7db027de6092
	.xword	0x59aef04b101a4350
	.xword	0x4221fe1401a7770d
	.xword	0x357cd3f103a9e62e
	.xword	0x9205232572e5efa2
	.xword	0xf89fab1955894122
	.xword	0x97dfa98d593fe95f
	.xword	0xef45f205170a12fc
	.xword	0x171df33ce1d7760b
	.xword	0xa6e959bc899f93e6
	.xword	0x3ca61366d1821588
	.xword	0x1a15e15369be8478
	.xword	0x9be9be6a68414be9
	.xword	0xf6a7fd02f177fcd8
	.xword	0x7fa89fe5b903fa07
	.xword	0x57694ffbffc38b8c
	.xword	0x35b9ed55cbd5521f
	.xword	0xabcdd6c4d013e290
	.xword	0x70fa5245febf0bf6
	.xword	0x99cca792a44084a9
	.xword	0x3d6e9f2fc0bdebbd
	.xword	0x8f8f3fda5515784c
	.xword	0xf6efa1f6960cacdf
	.xword	0x77df09db909bc0bb
	.xword	0xf8760a93d18aeb78
	.xword	0x947e85ac9a99262e
	.xword	0x66f6953c1c78fb0b
	.xword	0x3e810b31ae09867c
	.xword	0xd29dae6c77b774d0
	.xword	0x3ac1250e654ff995
	.xword	0x37d0330d4ad4804e
	.xword	0xec559785eea51aa7
	.xword	0x2fac878a84b1ea85
	.xword	0x8ac803d16131b521
	.xword	0xf444cbd372c84d6f
	.xword	0xa054a19a0c20dd06
	.xword	0x64f58a4d49612ac8
	.xword	0xa76ca7a89b7eff2b
	.xword	0x98e3105abdab50ec
	.xword	0x1e4a20435e5f7a98
	.xword	0xa018daf73553fc3d
	.xword	0x795d126e04947e5b
	.xword	0xf0ee0a1f1d40c57a
	.xword	0xfe849b983d8491a1
	.xword	0xc12ec7a7b59a33ef
	.xword	0xb020f9537c02df1a
	.xword	0x278be2125474e8dc
	.xword	0x0615dc43ec48990e
	.xword	0x7fff20c31ade58fd
	.xword	0xc0cdade2754f8601
	.xword	0xf41345092b3a21e4
	.xword	0x124e754765d2f816
	.xword	0x2d98d4cddef0f012
	.xword	0xf335da1cc0468c6b
	.xword	0x08f5b7cf8185c18d
	.xword	0x31ee030fe2ad9408
	.xword	0x44a2f9991b53488a
	.xword	0xad3ede9be7f3200d
	.xword	0xd47dd9418e0376c2
	.xword	0xb59267750349d264
	.xword	0x0bb6ae33a8ff8415
	.xword	0x39d0599c5192bdbd
	.xword	0x2f552028c7312961
	.xword	0x9b9137fbe5decc88
	.xword	0xb67117ef7f1bc50d
	.xword	0xf771dabccc630410
	.xword	0x8cc274b75b2aca51
	.xword	0xf2b0614d4be49164
	.xword	0xd07063b57fbe1970
	.xword	0x9b351e206d851c0b
	.xword	0x5c30ef64c2e3ea32
	.xword	0x1d9a97205ae0382f
	.xword	0xc408c9d6592e07fe
	.xword	0xad619f8ca8cb438b
	.xword	0x11d9aaf83dfa42ef
	.xword	0xc9042fc15a952e06
	.xword	0xddef5ea761174c56
	.xword	0x72cd6a59865887f3
	.xword	0x0ee1b096d7987a5f
	.xword	0x842b2eb7cf7d8e1a
	.xword	0x4dc70222c66e0ea3
	.xword	0x81938eeb19bdce38
	.xword	0x9a81d4bfc2ebe885
	.xword	0x7d007699a5cde749
	.xword	0x134ca5fc1168053d
	.xword	0xcda062032f6e3292
	.xword	0xf1dc1e13fef17748
	.xword	0x3b29957fb64fbbdb
	.xword	0x44a39f8595f79b1b
	.xword	0xef41f6ad532a35ab
	.xword	0xb211a9b974987541
	.xword	0xe98d95a642f87096
	.xword	0x0b4c473c04fc5b1a
	.xword	0xebf0813868317c7b
	.xword	0xf3ae66eb17a2b631
	.xword	0xe581a61c3039e674
	.xword	0x076e46931ef8808a
	.xword	0x3c185d92a7017799
	.xword	0x25ad8c0a8e8c8aa4
	.xword	0x1b572ad53627eaae
	.xword	0x178dbaf0473cf285
	.xword	0xb9d4ccda7832e833
	.xword	0x5d1559aea5a4d770
	.xword	0x1100fbd337601960
	.xword	0xc40d1f5146f0b5da
	.xword	0x48b8a54db6d289ca
	.xword	0x94fe667b672e6b73
	.xword	0xf81e87c99b319084
	.xword	0x13c7d485e45e8a09
	.xword	0xa99f934d58f610a7
	.xword	0x0111ab4c74a878e7
	.xword	0x8fd75c147713db1a
	.xword	0xd6de6a8a867cbfbd
	.xword	0x2633d94169e5657f
	.xword	0x3cfc83b0803825a4
	.xword	0x90d33b170763df77
	.xword	0xb6467d93bc4b04e6
	.xword	0xeda6173291dcad65
	.xword	0x4cb0bb8d9ff6f7d7
	.xword	0x19d86c05d2a1f4b6
	.xword	0x87c9a82834ba636d
	.xword	0x9ffdeba0792f4371
	.xword	0x280e712f1f9d7f12
	.xword	0xdfc151f0d06c6ecd
	.xword	0x7f5b282f98c4ae7f
	.xword	0x6caf65a118aee228
	.xword	0x47c935430d130efa
	.xword	0x430a5948b0b85aad
	.xword	0xcc1c647a4b5aff3f
	.xword	0x13ddca3ec732e95c
	.xword	0x4fa0cf3d0d81e39b
	.xword	0xcd108b75c5acd6d1
	.xword	0xa0585422bfd42d95
	.xword	0xba093e075f0b3832
	.xword	0x49c44ad95ecb395f
	.xword	0xf9a3ec25704b2cc7
	.xword	0x881966865568b4ff
	.xword	0x7f26f7fb5425788a
	.xword	0x9e41a8dbbd39accf
	.xword	0x5d73a7cfb729206c
	.xword	0x2f10da70ba1bc7be
	.xword	0xd91e69c108f6ee0d
	.xword	0xf2dd14783d485aa5
	.xword	0x4115d56a7d5eb405
	.xword	0xa69cc6f8edb1c521
	.xword	0x583b75ca4f85fd86
	.xword	0x23a0782379504ff6
	.xword	0xc606c2e1bee60f16
	.xword	0x335acd4fa66bc7dc
	.xword	0x8ca7acab81312909
	.xword	0xd3051c8df5d45a52
	.xword	0xf9b420ee3e4c287b
	.xword	0x44355aac5945e12d
	.xword	0x7fadef5636bee169
	.xword	0x8fd22a76c47b3a3a
	.xword	0xfc5a189d7e888215
	.xword	0x1c9ea94d38631e70
	.xword	0xf11785108e09a091
	.xword	0xd53b4173e4b22fae
	.xword	0x8f6f8172ab92a53f
	.xword	0x82d83c7e7acb5430
	.xword	0x683be695edf31482
	.xword	0x17d8a395605d3737
	.xword	0x7fad8e0e5ec9a863
	.xword	0xe140d8b62fc15b20
	.xword	0x1aed1347378eaa0f
	.xword	0x171fe8daf166f096
	.xword	0x7b917d43fd6bd10a
	.xword	0x09152a640b2daefc
	.xword	0x8b600535f9270f3d
	.xword	0xddf3a5f601633ff7
	.xword	0xaa0ea3c198403c3c
	.xword	0x5314552f11123c05
	.xword	0xfe6de11304650a1d
	.xword	0xe56fbe6bb9c60712
	.xword	0x017271d4b120b0bf
	.xword	0xc38a6a726de5595c
	.xword	0x7b9923e4ea5677af
	.xword	0x7bc6b5e3ba88f78d
	.xword	0x8651d13c4a6a05c2
	.xword	0xd5b805abc2d1f8df
	.xword	0x67b4ee0346cfcabe
	.xword	0x6e28ec1b8a43469e
	.xword	0xa6564046eb30c9b3
	.xword	0x37c76968f8de8585
	.xword	0x2e3cdb90dfad8c59
	.xword	0xd73b67add28dafb9
	.xword	0xd7cfe2622ea980cb
	.xword	0x3f4a125fd26a3276
	.align 0x20000
	.data
data_start_5:

	.xword	0x05dec288523cf7a1
	.xword	0x1c8afc9b40484040
	.xword	0x1d848005080ddf33
	.xword	0x19c3569f734f66e2
	.xword	0xdeee6faa9880a8e6
	.xword	0x1c18146e2f50521e
	.xword	0x58c50c624f7c36f3
	.xword	0xc5c54b2bb8de07f3
	.xword	0x1055395cfd199009
	.xword	0x314d3d403c099c30
	.xword	0x78dc4ce5d5e2aff3
	.xword	0xce0759ed980ded75
	.xword	0x0fa6a87d9cb4f153
	.xword	0x98edd126d79914e3
	.xword	0x1c51981d5ec061c4
	.xword	0xc6bb4c1359f7734f
	.xword	0x0f3ff115597993bb
	.xword	0x40d835cced04276a
	.xword	0x4f69000265d95b90
	.xword	0xe21d5e646440bf80
	.xword	0xbb2c5c9357e207b5
	.xword	0xf2b3b2565853f584
	.xword	0x805e6cb698d8e88e
	.xword	0x7bd225506924c43f
	.xword	0x443fe2f07a76e443
	.xword	0xe580aeb8d6e2af55
	.xword	0x2d7b0143231c8dcc
	.xword	0x56f9d3aaa0a3c099
	.xword	0xef8d1704b2853f22
	.xword	0x8cc88d15d5d3d9bf
	.xword	0xed22f4cb70958cb4
	.xword	0x7219516e51e51457
	.xword	0xd3ba59ef561aa94b
	.xword	0x037281f49233ceb7
	.xword	0xe28f6dd537ac0363
	.xword	0x022e237c16125c68
	.xword	0x2d1d8333421910e5
	.xword	0x04fddf083c00b07e
	.xword	0x18f1768c40d9ea76
	.xword	0xbc48f3d88feded5d
	.xword	0xebf4ed1dd01238a8
	.xword	0xffb873521b5541bd
	.xword	0x99a2485cd2eaa955
	.xword	0x8ec3585a5f5acee1
	.xword	0xa3da8ecf2208cf64
	.xword	0x7b6985813cc49163
	.xword	0x9ea3ea25f1604712
	.xword	0xa896adec92a0fea1
	.xword	0x3ea35ceb1a00184d
	.xword	0x40ce041c81752a44
	.xword	0x5131082e2ab3f438
	.xword	0x23e58cfaaab64d27
	.xword	0x30c5b8f173c97dd3
	.xword	0x6d82a764c7027ad9
	.xword	0x6ea434bd16ace408
	.xword	0x71f2e23aad887fa0
	.xword	0x5aa075316caa7eb2
	.xword	0xc544985f2ee8ae5b
	.xword	0xeb6c2a8bd1025f7f
	.xword	0xd568aead112406f2
	.xword	0xdbccec5883b32b40
	.xword	0xb9e9f560e3857488
	.xword	0x07c475d3f0704183
	.xword	0xbb3cdc6581f41dba
	.xword	0xc582a3f795297d95
	.xword	0xc249b68b761f693b
	.xword	0x04524fbacbedfd21
	.xword	0x6ca4ce8fba7ff0d7
	.xword	0x912acb5f5c5fb4db
	.xword	0x60b60373d41089df
	.xword	0x400fbf9b3e8befe2
	.xword	0xa1ac033bc3729a70
	.xword	0x7e8e0721e1b70316
	.xword	0x02e0f10343a43ce1
	.xword	0x4559959d78151581
	.xword	0x1527d090af027335
	.xword	0x1ca902dc845100f4
	.xword	0x1e4b3db79b0d7be0
	.xword	0x3e2e28ee1b8a0a1f
	.xword	0xd3a26065cc9c2a25
	.xword	0x921e96fb810623c9
	.xword	0x06ad44f013337940
	.xword	0xe1d17a3e34d1668c
	.xword	0xbafb5576f158f63c
	.xword	0x6e7577370eeb0b5a
	.xword	0xc090605e6557443e
	.xword	0x1a359a7fc51bbb74
	.xword	0xdacd324483db7738
	.xword	0xbe03a47bc3ed4f8d
	.xword	0x64ceda247226fc84
	.xword	0x247a9fe3a89693b7
	.xword	0x2ccef94c56b4c607
	.xword	0x0b30f85bd2ccc29e
	.xword	0xa3b973a79c877166
	.xword	0xf1b1d7bac3614d08
	.xword	0x9cd31b46b8ad4289
	.xword	0xead984b57b5e2157
	.xword	0x7567fcf82423eb36
	.xword	0xc4ada0d50bb879f6
	.xword	0xee029300dd10bb05
	.xword	0x53245e72e8e472d9
	.xword	0x80ec9c2b8d95c54e
	.xword	0x530c528f25723dbb
	.xword	0x472a7f468dd23b74
	.xword	0xfc3dd5d02b6f9907
	.xword	0x7f14b88bc40eb0e9
	.xword	0x936f6ff194eabdc2
	.xword	0xd17a82ae8e394e24
	.xword	0xf8fdefb6c26200c0
	.xword	0xbae72d1a8db3066a
	.xword	0x95b5a8ef3b2250f7
	.xword	0xc8492c2bc4b41058
	.xword	0xb7cc318cf011e5d8
	.xword	0x0a336970adbe6b88
	.xword	0x2429913e74977aea
	.xword	0xa32422c861c13c72
	.xword	0xbf91a4ca6b393afe
	.xword	0x47fb502a284617da
	.xword	0x7030bc7fee73afde
	.xword	0xc808445949e20c16
	.xword	0xd8f4f85b5aaf95fc
	.xword	0xbdb1c81d8665d33c
	.xword	0x4fb4da28c1699b5f
	.xword	0xa1724e136aa4a1bf
	.xword	0xa93054b6b89e7ebe
	.xword	0x1ceec2175a93d294
	.xword	0xb06506aacc1ca35d
	.xword	0xa94f149679a2326f
	.xword	0x14076944893d66cf
	.xword	0xa2a19ce34cd0cb58
	.xword	0xbcb4066687da1eac
	.xword	0x725c4d8efdac3a23
	.xword	0xfe7d51655a7664e6
	.xword	0x95bb17bb612d8cfb
	.xword	0xa710f8ea171f976c
	.xword	0x2b481b77ef884785
	.xword	0xbcf6c0447fec5557
	.xword	0xb2e648f8e8c03b47
	.xword	0xf95da81d6c4dd79e
	.xword	0xaea03721bb64f173
	.xword	0x2a8b408b1d69e7c3
	.xword	0x5ef7c3715c2378cc
	.xword	0xff2b4fdc2409a011
	.xword	0x2e30a334cbc313af
	.xword	0x257ef0a130d012e8
	.xword	0xcfe3377c797af77a
	.xword	0x41c6f08832bb609e
	.xword	0xfb1826d121d5450e
	.xword	0x40b8cb0d996c2541
	.xword	0x1e59a2ba2f7524d3
	.xword	0xa1495d18c680bcec
	.xword	0x46c9d064b58b94f2
	.xword	0xe7633bb5ef3e1488
	.xword	0x0b297c9da9c19a46
	.xword	0x89c9f3bf55298a60
	.xword	0x476d10046334a850
	.xword	0x78dd39e7740a7a84
	.xword	0x6d24700080fcc1ca
	.xword	0x0f8bc0f5985086b3
	.xword	0x257ec5dead47b82c
	.xword	0xd09509d0ce3ec8dd
	.xword	0x8f7c19cfbc394151
	.xword	0xef7f1bd30bfc9d24
	.xword	0x052cf896fe8bb452
	.xword	0xf10f86b416f9e259
	.xword	0xd4ff79c06b1eca48
	.xword	0x53b7444bacf44754
	.xword	0xf7d0a334e7ae48db
	.xword	0x3320a8ad2b1d29a8
	.xword	0x8404f15eabf75952
	.xword	0x3b99514dc1fa9e67
	.xword	0xbefb5ac14f8a0eaf
	.xword	0xf0e9932d9eb5ebc1
	.xword	0xd49b19ffb24f6847
	.xword	0xb2b29aedff13865a
	.xword	0xb97b221c63207da1
	.xword	0x302eae8712a39db0
	.xword	0xdcf8aac4226e2656
	.xword	0x0577ec06d4d8f7cf
	.xword	0x134a04d4b639a2a3
	.xword	0xd59013bb086cda90
	.xword	0x2649b2707e3d4148
	.xword	0xf5946aaad79dd899
	.xword	0x9cfd056dba1b3236
	.xword	0x6e1b199e62fd19df
	.xword	0x6961aabc6d9bceb0
	.xword	0x3b2924e877d9a23b
	.xword	0x99b7eddb4acb7ded
	.xword	0x9a06cd05d3b8dbf6
	.xword	0x86b6f000b9fdb894
	.xword	0xb1f09db8b66fb95d
	.xword	0x45e2be72aca6609d
	.xword	0xd1eaa09f48cb5a19
	.xword	0x576b2a3b7c5c8fbf
	.xword	0x7c9d871c400724c8
	.xword	0xb1cf033be9b1e3fd
	.xword	0xa38590a6c252ead0
	.xword	0x09b95eb1bf6c25c8
	.xword	0xf914aac06b89495c
	.xword	0xdacd13e50224efbd
	.xword	0xe14dc83a61b48ab4
	.xword	0xe3bb84d2f88e6038
	.xword	0x52a74839e32139c8
	.xword	0x6e430fb1b16bcb9e
	.xword	0xd336cbc1b6b7ca9e
	.xword	0xdae9e6036b17c7c8
	.xword	0x3e324d4463bfac65
	.xword	0x578933addc42e91f
	.xword	0x504aceb344c295ef
	.xword	0xc7ee0671cfa9d265
	.xword	0x8d8742bd1b48a4d6
	.xword	0xe4af1060c3f27d93
	.xword	0x559a4d37333f3701
	.xword	0x058f062df295560c
	.xword	0x60fe7a94837fc2e4
	.xword	0x47b1a34af68219ad
	.xword	0x6105ce84bc9985ac
	.xword	0x9759f6dd104d0ff6
	.xword	0x61bd971d65eae31b
	.xword	0x37a77ac1744c9416
	.xword	0x886686a4310bca3e
	.xword	0x15a5d8b4e82d67ee
	.xword	0xd1bc91a355fe6040
	.xword	0xb1bde459e478b742
	.xword	0xd68bdc8d34e195ce
	.xword	0x31fca378ddce891e
	.xword	0x29b33414b6708ead
	.xword	0x8e5573667dbc5d1c
	.xword	0x0c2558287e98a715
	.xword	0x6be21a784c9bd770
	.xword	0x4699bcd077ed9c0d
	.xword	0xc9fb6b21dd5bc535
	.xword	0x12acb7dc48a65355
	.xword	0xc9dc9263d9aff847
	.xword	0xe3b306a2469ccd49
	.xword	0x82dc379f80f8ffe9
	.xword	0x588f263b28f84943
	.xword	0x9e042a2b2b5c88cc
	.xword	0x9018d8ea42d8ca1f
	.xword	0x5584616bc4d504e9
	.xword	0x073128223be28669
	.xword	0xd400fb2703738f76
	.xword	0x7fd83c177cee15bf
	.xword	0x966ec654f75bbdc9
	.xword	0x41291fcc3d129be8
	.xword	0x8a9d2b86e467147d
	.xword	0x57e14f1e65354794
	.xword	0x4403a701648d2c71
	.xword	0x6efc87cadaad49e7
	.xword	0x2f34ff63ae9e2ea5
	.xword	0xc28db7fe8df2dc99
	.xword	0xe68ba47e03b86c2d
	.xword	0x6ccd55e7d1d4cf85
	.xword	0x3cdf26971eaed10f
	.xword	0x6a26a7cf661ffc01
	.xword	0x7b79c5a2171d6f3f
	.align 0x40000
	.data
data_start_6:

	.xword	0xbbcac40af624663f
	.xword	0xd2a8c8eedc205967
	.xword	0xc57b994bb1db5faa
	.xword	0x60610c54c80bd072
	.xword	0xee82a4a289628951
	.xword	0x5999d04133fb6382
	.xword	0x13d34733cd08b6dc
	.xword	0xb3557615b97e7216
	.xword	0xdc7ecc8d331d5373
	.xword	0x2d1459e299b073e9
	.xword	0x7b686d0f02817721
	.xword	0xfbb179cd252c5cf2
	.xword	0x2f50b27f15ec0e04
	.xword	0x21ff0a6abbffd22a
	.xword	0xe6430082a4826ec3
	.xword	0x0076501359ebb352
	.xword	0xf7711468d886cac7
	.xword	0x5eb75c50eacbd619
	.xword	0x909fa26134c6688d
	.xword	0xae433c592a6b5baf
	.xword	0x58930f860f96372b
	.xword	0xeae476944ae1f8d7
	.xword	0x9b7e1a8967841433
	.xword	0xbf0331660920f535
	.xword	0xc3e48a88289aa57e
	.xword	0xd0d6c1b6a77dacb5
	.xword	0x2ef7c81c9fa43bc1
	.xword	0xbd6753901b312eaa
	.xword	0x8326f94386821aec
	.xword	0xd4821f90471a9aaf
	.xword	0x1dbb9f7f1f1e58f9
	.xword	0xd52c8083b77036ee
	.xword	0x767675d18bf72577
	.xword	0x6139e95634e029b3
	.xword	0x6b0929abe5b8ea36
	.xword	0x5a9b91eb11797677
	.xword	0x61dcf82d0c44a5ad
	.xword	0xb155bdc93f3a21f5
	.xword	0xf932508278b0d779
	.xword	0x1c8c2b4e857b6a01
	.xword	0x617d4ae06572d5f6
	.xword	0xa502b28b82e18395
	.xword	0xd5c440b1572f2960
	.xword	0xa530ec5c138f742a
	.xword	0x1591a7dbec93dbd9
	.xword	0x09c33f08f2f4e6b2
	.xword	0xe2282e922767ae7c
	.xword	0x25ef29d179ca7d13
	.xword	0x42ee81044aee5b28
	.xword	0xe5a5b713112e7ac9
	.xword	0x55af227587da0f22
	.xword	0x32973138880578f4
	.xword	0x23849bf7c0a48852
	.xword	0xfd75cd2ff73da2cb
	.xword	0x65b1161801f123f7
	.xword	0x6a666dd8fa123e0e
	.xword	0x1eb1e220ba6ed32b
	.xword	0x192c34b0d3209029
	.xword	0x204baa834f09db9f
	.xword	0xcb96ba29dc8e9909
	.xword	0x6b97f7af9f7d9fb4
	.xword	0x096f7218dfecb08b
	.xword	0xa86cb6a50b76dae9
	.xword	0x6ac27e8040f65e02
	.xword	0xf4490519f2bfead0
	.xword	0xed807026e9a68973
	.xword	0x6109790655418ee4
	.xword	0x585fd9af28ffe72f
	.xword	0x5dac2be66f125372
	.xword	0x0f517f75ffc5b9fd
	.xword	0x08194d3c92edf992
	.xword	0x9a4a96aba662d6b9
	.xword	0x558e23a0acf51704
	.xword	0x4c4f77be7ea43260
	.xword	0x7d590653f33eb713
	.xword	0xe0c53469f08121fc
	.xword	0xc52d66250b29b506
	.xword	0x13916acaf2e4dca7
	.xword	0x4690e6d8b7bf4be0
	.xword	0x6790fc2d83c6b565
	.xword	0x90cf8a250b4571e8
	.xword	0x2618074fa30d7121
	.xword	0xed7560d40e8dfb54
	.xword	0x332a6d546be1f984
	.xword	0x99d33e6488576ac8
	.xword	0x4a1afb0b0ca460ea
	.xword	0x45e48063991bab14
	.xword	0x057c52b7cdc5672a
	.xword	0xfcbc6290b5387d71
	.xword	0x2bf716691241f4fe
	.xword	0xc27a4b8d8413d211
	.xword	0x9c97fffc25fafe3b
	.xword	0xe61276b2a9ba8a45
	.xword	0xfaebd82e6792519f
	.xword	0xdcfa44a8c596279c
	.xword	0xb24d697c740233bc
	.xword	0x0b1fa9cbf0be1281
	.xword	0x3efa47256972e6c9
	.xword	0xe0c22452f7f6229e
	.xword	0x7af05aed19bba945
	.xword	0x4c90678fa91cf0d4
	.xword	0x171f9ff0e530910e
	.xword	0x63394a4343f816c7
	.xword	0x8df622f76f1a617c
	.xword	0x4af3834a60986016
	.xword	0xb7b22085979b3643
	.xword	0xc8a88565499052d2
	.xword	0x17939de4d15571df
	.xword	0x8e0351e62ba693d7
	.xword	0x24c570dfe193da71
	.xword	0xf888b7ad57063a39
	.xword	0xef087a0d1f2cb869
	.xword	0xd6740ead7fc724ef
	.xword	0x5c632246059c7ad7
	.xword	0x4072c30318ddd1cd
	.xword	0x2f37c4793410bde1
	.xword	0x0daa3ccc4ed5b684
	.xword	0x8aa50f3fc8b7c7d7
	.xword	0x860deeee78fb12cc
	.xword	0x724c02aa1e17202d
	.xword	0x698b632cdb56ad66
	.xword	0x12d17f567ff1006a
	.xword	0x10913e0e8137a829
	.xword	0x804eeceb219fc354
	.xword	0x0aa8804dd6c7bb94
	.xword	0x6bb4b60584ec7619
	.xword	0x42f3c9cc1f2c0bb9
	.xword	0xee7efe8aa08d455e
	.xword	0xc8ded03e2dd1a5ee
	.xword	0x8b51497e6e8400d2
	.xword	0xc2093464a792e01b
	.xword	0xe805b73038655e21
	.xword	0x942cba8dce5052a0
	.xword	0x71ec2eb39a6a75f2
	.xword	0xf3d0946deb5dad1d
	.xword	0xc8ea942feea6863e
	.xword	0xfd69213d1329f647
	.xword	0xfcd28228c699e9f4
	.xword	0xa03fa683c31bc47f
	.xword	0x650d5827b963530d
	.xword	0x40b83a98463167b3
	.xword	0x9bd3ec0b1946c868
	.xword	0x66d177035a7f3a6f
	.xword	0x1428ee71f73de0ae
	.xword	0xd98d884822e488e2
	.xword	0xd9b6c9ccbcca60c1
	.xword	0x48269ffccc4cb3d1
	.xword	0x5115e0a23aee6644
	.xword	0xb7d2c7ae21050b53
	.xword	0x3cae1fce92200f48
	.xword	0x7bde7423b7523f38
	.xword	0x7df4ba8e4498dcd9
	.xword	0x87ef23574c495bce
	.xword	0x88ebc3a578e23826
	.xword	0x9cc2884a487d2169
	.xword	0x2490b44798d68c5d
	.xword	0x631ed0f272d17e88
	.xword	0xcabe5a5e00c6218b
	.xword	0x319632ee0d913810
	.xword	0xff4df99f4d86144a
	.xword	0x9e1bdf36d5444968
	.xword	0xfb9e45a0a5cc2380
	.xword	0x2f51db81ecf3f96d
	.xword	0x574b3b1a70b3437d
	.xword	0xea778c18dae6054f
	.xword	0x67522c4bc5d42bc8
	.xword	0x32b873a023a127e8
	.xword	0xbdd15713b410ed2f
	.xword	0xd37f24a3ca55e23b
	.xword	0x20a3053124433e4c
	.xword	0x2a9a7fe0b415c2d6
	.xword	0xc0c657c70931f28e
	.xword	0xde587c6cc3bc84f9
	.xword	0x1c123b795b32f7c8
	.xword	0x16a4df1013b7134e
	.xword	0xf8c3ae322d71889e
	.xword	0x62b77932017a1001
	.xword	0x955a961ca8bead78
	.xword	0xc960b8d95bca0c17
	.xword	0x2e5aeaa80e0cdaac
	.xword	0x0b9bf230d7f38ce3
	.xword	0xd7318e86980459b4
	.xword	0x3daeb7b219546bd7
	.xword	0x2cd2609105b95bc5
	.xword	0x51ab5e71db0c87d4
	.xword	0x61be04fdc92c3a4e
	.xword	0x381c88b0b1a8d21f
	.xword	0xef9136ec1568e660
	.xword	0x1dcf337487700394
	.xword	0x782e0d1625cf31ac
	.xword	0x6d7f042229d5d2bb
	.xword	0xb2a50e9e8023672d
	.xword	0x9ba7339e6cb252e5
	.xword	0x75696784125dd375
	.xword	0xd4f7f6fcaa4fd9f9
	.xword	0x08a9f055dd333096
	.xword	0x1adf393a3687cb41
	.xword	0x265bef20fdc055d2
	.xword	0x900bd97283daac1a
	.xword	0x898c55de8337353f
	.xword	0xf17a2630b8b4bf80
	.xword	0x5809d5aaf9c7d332
	.xword	0x362676efbbe9900a
	.xword	0x580f1246df17e974
	.xword	0xf23cff3967645cff
	.xword	0x96e50ae7cc58481e
	.xword	0x567bb4992ad7de7d
	.xword	0xb96ea81a108cab95
	.xword	0x7d9a4fd913e1329b
	.xword	0x425e9e29c1b8e761
	.xword	0x66e4671556b26ec6
	.xword	0x16e63954fa45de12
	.xword	0x0c717923d8071a8e
	.xword	0x65a0f0580db4a8d4
	.xword	0xa764d37245dc983a
	.xword	0xa8df4d7f4b98bd21
	.xword	0x2978072c21211de6
	.xword	0x9bf32c06301f9d64
	.xword	0x2b6a91eb27d1b53e
	.xword	0x1beb8f52621aa9f6
	.xword	0xc726822652859afd
	.xword	0x840f0d8605dca975
	.xword	0xb99048747bd6afa8
	.xword	0x7a8f291d8bf963f9
	.xword	0xc01d62c118c509aa
	.xword	0x293a87c7267f5383
	.xword	0x911e7614350b44b1
	.xword	0xb74cb016df4beece
	.xword	0x87e858fbaf213b96
	.xword	0x28ada84e228c5e8d
	.xword	0x0b6c4e58e562c245
	.xword	0x9a87606836af30fa
	.xword	0x99f8944e9bf05922
	.xword	0xf908a1f850bc751d
	.xword	0xaaed130f44a836de
	.xword	0xefc113f22d8bd8b7
	.xword	0x78aaf334d5388b86
	.xword	0xe2093d9296fe0461
	.xword	0x20f53d2e2cf46b2b
	.xword	0xeba82109e449aa78
	.xword	0xdf85d0ae2eb214dc
	.xword	0xb5427ee2a3011e27
	.xword	0x456b9f42d395e18b
	.xword	0x9776b8ac9d8ef46d
	.xword	0xc45c9179dfc3b106
	.xword	0xdc213467f4e08cb9
	.xword	0x75d3e641f06c5174
	.xword	0x535a3ba2a8461b42
	.xword	0x87ee4f35f5f9528c
	.xword	0x1583c114eccf6e65
	.xword	0x9ccb007122088463
	.xword	0x88ffc85f51100abc
	.xword	0x9d55b1b50f44791c
	.xword	0xe8b3b5ff4e4c4931
	.xword	0x84eb29775d1e0d4a
	.xword	0x014cf751a4452376
	.align 0x80000
	.data
data_start_7:

	.xword	0xd421350b44fac882
	.xword	0x72da9323c4f25fb1
	.xword	0xdc0c8da0bbb9bf41
	.xword	0xee41a04b9e800ca0
	.xword	0x610596c162961b99
	.xword	0x75396fec4e318247
	.xword	0xd3dd65278f9ff53f
	.xword	0xdc482c80b7bfe1fa
	.xword	0x143b992012bb0754
	.xword	0xb956563c893f477f
	.xword	0x9457b9b56f10f700
	.xword	0x876c748d4efcafee
	.xword	0x129d2eb113e9c6cf
	.xword	0xb0459307c43a782f
	.xword	0x32c4472440c7e315
	.xword	0x64f653be9ee2fec9
	.xword	0x6f77359c5086914e
	.xword	0x383781f92ab2d81c
	.xword	0xc5d3130a13c1a86d
	.xword	0xad99912a7daab15a
	.xword	0xc6d46e916dfea1f2
	.xword	0xd11a8dabf49d9d86
	.xword	0xc484510e7cfe2d90
	.xword	0x401ccecef7a713c9
	.xword	0xd3025b411fd48ba3
	.xword	0x8d6a450ec58aa316
	.xword	0x07a0a7ef19f8d261
	.xword	0x746050c088fc30d7
	.xword	0xde0fddf249b87e92
	.xword	0x9204d878cd8b1034
	.xword	0x3708493a22d2b8f1
	.xword	0xf84c52fe5711b8b1
	.xword	0x3e7cb33e81ccf5ec
	.xword	0x7083b12ef37308e8
	.xword	0x4d735d16a8ca2dda
	.xword	0x014b947c3ecb1041
	.xword	0xa0ce668a7a2621d8
	.xword	0x454923ebad34880a
	.xword	0xf96e9c9b27a0f460
	.xword	0x36fdcd2bf73603ca
	.xword	0x0ac9427c37c9a07e
	.xword	0x6468bf2b9308555b
	.xword	0x6dbf7e3c6641f102
	.xword	0x512e8742eba0d772
	.xword	0x625172b4845b8d68
	.xword	0x000e67dd4ee74be5
	.xword	0x0c044d48582745d5
	.xword	0x669f04fba33016b2
	.xword	0xcae8779156157da5
	.xword	0x3f1c02b51602c454
	.xword	0x66e37026cfdd6c56
	.xword	0xacfb372cbc35deaa
	.xword	0xa98052e7b95a862d
	.xword	0x401c7acf78efe8eb
	.xword	0x6bb6809bb0143196
	.xword	0x32943dd718304cce
	.xword	0xad53a6f1c56fff92
	.xword	0x7deceb4197a9cf10
	.xword	0x45baa86986fd7b15
	.xword	0x4883dc43a7ae8d07
	.xword	0x4cb034769a4bbfc0
	.xword	0x548154a074f792c2
	.xword	0x7931bc2e1fc45a3b
	.xword	0x8202fbc035b7d4dd
	.xword	0x8a86d600fd8ea8a4
	.xword	0x945f63998607e26d
	.xword	0xd30086354171060b
	.xword	0x8ae1e002fd3ea252
	.xword	0x1e66a352e9b3676f
	.xword	0xbae8e63a11c2bb12
	.xword	0x42eef73b479b7452
	.xword	0x124fb295464dc141
	.xword	0x31a791079faa8ca4
	.xword	0xcb84ccd6d9bfc321
	.xword	0x6cbb523c552c6ed9
	.xword	0xb7c059e52548b7fa
	.xword	0xdc1a4ae9f1c2bd8c
	.xword	0x478fb78eeb31e8d4
	.xword	0x43289f16dd1e6bfc
	.xword	0x3c90c3dc795f6ee0
	.xword	0xf4ec904a95218cb6
	.xword	0x6de00cbddb26ab6f
	.xword	0x73c5c750dc59da85
	.xword	0xf49eeee4967595bb
	.xword	0xcdc4ccd930c0783f
	.xword	0x8fb9169ff46775a1
	.xword	0x498068c608633831
	.xword	0x5b233964bc034dae
	.xword	0xab224e3fbea12005
	.xword	0x326edff2245612fd
	.xword	0x0af7b7862e924998
	.xword	0x81104a6d1e4c2433
	.xword	0xdfe39a87f55ae76d
	.xword	0x6225651b4075af04
	.xword	0xa1c2977b01bf2569
	.xword	0x26bc394e915c9ada
	.xword	0x043d96b508a6d79b
	.xword	0x406eb488cea523b2
	.xword	0x8681115471eec2a0
	.xword	0x8dd88412e1e5d6e6
	.xword	0x17d4830e8f066e07
	.xword	0x4fd53440767d30cb
	.xword	0xe500f5e0d7a0fe80
	.xword	0x5dd45a1c5466c0c1
	.xword	0x756a348faef46aab
	.xword	0xc19823413e3b9f30
	.xword	0x0a87bf324b3b8857
	.xword	0x0433bf87f08b789c
	.xword	0xa2211e32dc6c86a9
	.xword	0x25027d7c53da8d9c
	.xword	0x056e354e9e8c3a76
	.xword	0x8d851e0faf0263b0
	.xword	0x2a092f3c74bffeb2
	.xword	0x738a5c91d8a47856
	.xword	0x839472dd7444e57e
	.xword	0x69aea08c04325c61
	.xword	0x4f5954f55f3f4508
	.xword	0x07edc6be068c0f33
	.xword	0x0a64c16f2e5d64f8
	.xword	0xada08811875da363
	.xword	0x0e5b69d7d3240138
	.xword	0x3ddb0ebcf53a5288
	.xword	0x2ee1672edda4cb50
	.xword	0x1c1ed496626c3896
	.xword	0x78a6003d7dcb3ed1
	.xword	0x3110bcb0f825a698
	.xword	0xb236e9a91d8cbb36
	.xword	0xcb799fa77f7ca3b2
	.xword	0x06a68ea953f7d62f
	.xword	0x23dfae4565ea4278
	.xword	0xe8eec60e5f9077b8
	.xword	0xfb058483785923ec
	.xword	0x9a243d4eecfc2e22
	.xword	0x4add1821dd412fcf
	.xword	0xbcf920d33248889b
	.xword	0xc38a1cd8ac4dd0b7
	.xword	0x5fbad11cbb5fce1d
	.xword	0x18b8bfc89f47a0b5
	.xword	0x0c1cf4af1ee3129c
	.xword	0x877d80952a1ac531
	.xword	0x03cde652132f5e68
	.xword	0x34d2badf8ce37f2d
	.xword	0x6e0ddec3a3a334b5
	.xword	0x1c032c241107371e
	.xword	0xaf7f64cc1e24519c
	.xword	0xe5b4814c7527d10d
	.xword	0x6bead22ee99396c2
	.xword	0x611c58b69fbc1d7b
	.xword	0x4df45e5c6ec6f4f0
	.xword	0x7655e8a6af133146
	.xword	0xa974a2fb05afdc74
	.xword	0x90a1e8eba12a2996
	.xword	0xb1c1431857db0825
	.xword	0x102a22ba4dd35afd
	.xword	0xc59da482229f79c6
	.xword	0x2d7df8ac7726f6a4
	.xword	0x79b9d8be1f04acf5
	.xword	0xd2282b61082a0051
	.xword	0x96afb3ada8fdae07
	.xword	0x307d43feb1fd9cc4
	.xword	0xc600615ca417e6c7
	.xword	0x95f6b8b640d3bcc3
	.xword	0xa1efaafcf56f8aee
	.xword	0x2dfca9cc87c716e3
	.xword	0xdc10ed9d2b62b348
	.xword	0x7106d2a1cde4fd3e
	.xword	0xce455641321ee20f
	.xword	0xa671e141bf3a50f8
	.xword	0xf56630d2d80811bc
	.xword	0x329ca1e25e57a491
	.xword	0xa3bedaf7115ed249
	.xword	0x5692dfd5c91d4d85
	.xword	0x7d5ecc67e735d73b
	.xword	0x9acad1b265ed5fd6
	.xword	0x2b9f32df412cd361
	.xword	0x70ec9b58736a594d
	.xword	0x1d80916d12eb221e
	.xword	0xb04162ec6fae483a
	.xword	0xa120dae36a186ce8
	.xword	0xdeb1e2aecfd5e695
	.xword	0xdac377be746c5090
	.xword	0x5b4eff8150fdae53
	.xword	0x378a321b79c1ee9a
	.xword	0x997bc0de746de589
	.xword	0xec09c5030bd46677
	.xword	0x6e805cbf9240ac3d
	.xword	0x32a48b6f5de5a09b
	.xword	0x50d8714eda7c39c9
	.xword	0x88508fe17028ec06
	.xword	0xfb3c637305502fc7
	.xword	0xa4cbec207360cd04
	.xword	0xbf7eaa62aa204e57
	.xword	0xc67cc55240555bb6
	.xword	0xe271ead1bbc7066a
	.xword	0xa694c5467203f24b
	.xword	0x70d78ffd58dfd391
	.xword	0x1e2a23e701f69475
	.xword	0x19b33bd761e4adee
	.xword	0x8acbc2f6ab9f9b88
	.xword	0x812b8bf17bb7eb6c
	.xword	0xa15f46ebbffb1057
	.xword	0x3c1e9740c4b2eb5f
	.xword	0xadf060505e4a5787
	.xword	0xd884f16834756c88
	.xword	0x51110b0219d9112e
	.xword	0x8f513960378ae224
	.xword	0x333e4fd2c21b5501
	.xword	0x1809b823a9d6218a
	.xword	0x7b72d161f8818b5b
	.xword	0x43983bb93d4e4b66
	.xword	0x66de3b1271cb2457
	.xword	0x18e55fb68a2698bd
	.xword	0x02e8b24a326c17de
	.xword	0xe908a53339bc1694
	.xword	0xe5bf325797d47776
	.xword	0x2dcfb9de923bfe47
	.xword	0x60b53bc09fcb1c8b
	.xword	0xe707f943ce0f98e6
	.xword	0xe87a8a779f8b5289
	.xword	0x541e646f73b94648
	.xword	0x097026abaa359002
	.xword	0x934d9c835a171ec2
	.xword	0xb2ef8786c1eee693
	.xword	0x6bf5248cd9b93a7a
	.xword	0x7beb406202409c69
	.xword	0x57211eb7443a6f97
	.xword	0x1f0bddc881acfe7e
	.xword	0x69ac1ed81a04f1f3
	.xword	0x586304a9a84e0897
	.xword	0xe67abf093ece37e7
	.xword	0xf94ce11b663fb22c
	.xword	0x963f521c12c2f745
	.xword	0x7e1068299a894ff7
	.xword	0x5b3ddd073b717785
	.xword	0x48df4fceebcd9a6f
	.xword	0x18e450ca9e88b0a8
	.xword	0xdb174eed1a628872
	.xword	0xd0e1e77525ad05e1
	.xword	0xf2ebb0843ef2107a
	.xword	0xc73b3733b52fb09b
	.xword	0xf04cb3c25e1e2e14
	.xword	0x491d1eb32d5f1ee9
	.xword	0x2acf495acd0a3928
	.xword	0x7764f825100cc732
	.xword	0x33afc7cec6926c7f
	.xword	0xf2cd29a4ea6f1630
	.xword	0x1e68e6d9e3bd1544
	.xword	0x52bfba7eecd2b16f
	.xword	0x3b90a6d93bc01b7e
	.xword	0xe5cbc07d9f7dad68
	.xword	0xa7f52e7ebdfbb3db
	.xword	0x23d4f34281821967
	.xword	0x966f2dcd8e0a994a
	.xword	0x3006a5713b63d276
	.xword	0x84df802098291dc5
	.xword	0xe3ee7b19f09789bc



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
!!#   int loop_cnt = 0;
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
!!#   IJ_bind_thread_group("diag.j", 34, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 35, th_0,    0x1);
!!#   IJ_bind_thread_group("diag.j", 36, th_1,    0x2);
!!#   IJ_bind_thread_group("diag.j", 37, th_2,    0x4);
!!#   IJ_bind_thread_group("diag.j", 38, th_3,    0x8);
!!#   IJ_bind_thread_group("diag.j", 39, th_2_3,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 41,"{16}" );
!!#   IJ_set_rvar ("diag.j", 42, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 43, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 45, Rv_thrdint_param, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'brrrrr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!#   IJ_set_rvar ("diag.j", 53, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 56, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 59, Rv_intr_vect, "6'brr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 62, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 63, Rv_ldst_var, "{16..23}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 65, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 66, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 67, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 68, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   IJ_set_rvar ("diag.j", 71, Rv_hpstate, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rr0r rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 72, Rop_hpstate_rs1, Ft_Rs1, "{10}");
!!#   IJ_set_rvar ("diag.j", 73, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 74, Rop_tl_rs1, Ft_Rs1, "{12}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 76, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 79, th_all, "\tta\t%%icc, T_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 80, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 81, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 83, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 85, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 86, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 87, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 88, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 89, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 90, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 91, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   IJ_th_fork("diag.j", 94,0x2, 0x4, 0x8, -1);;
!!# 
!!#      // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 98, th_2_3, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
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
!!#   IJ_th_join("diag.j", 105,0xf);
!!#   IJ_th_start ("diag.j", 106,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 108, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 109, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 111, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 112, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 114, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 152, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 		IJ_generate ("diag.j", 156, th_0, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 		IJ_generate ("diag.j", 160, th_1, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 		IJ_generate ("diag.j", 164, th_2, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 		IJ_generate ("diag.j", 168, th_3, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 		IJ_generate ("diag.j", 172, th_2_3, $1);
!!# 	}
!!# 	| write_hpstate %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 176, th_all, $1);
!!# 	}
!!# ;
!!# 
!!# comm_inst:
!!# 	hw_intr
!!# 	| write_priv_asr
!!# 	| read_priv_asr
!!# 	| alu
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap %rvar  Rv_low_wt
!!# ;
!!# 
!!# set_va: mSET_VA
!!# 	{
!!# 	  IJ_printf ("diag.j", 191, th_all, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#         } ;
!!# 
!!# write_hpstate:
!!# 	tWRHPR_HPSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 197, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HTSTATE_R %ropr  Rop_hpstate_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 201, th_all, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# ;
!!# 
!!# write_priv_asr:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 214, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_GL_R %ropr  Rop_tl_rs1
!!# 	{
!!# 	  IJ_printf ("diag.j", 218, th_all, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_asr: 
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
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R 
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I
!!# 	| tLDDF_I | tLDDF_R
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTD_R | tSTB_I | tSTH_I 
!!# 	| tSTW_I | tSTX_I | tSTD_I 
!!# 	| tSTDF_I | tSTDF_R
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
!!# 	tSAVE_I
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 272, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 273, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 274, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 275, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 276, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 281, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 282, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 283, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 284, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 285, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 286, th_all, "\tflush\n");
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
!!# 	  IJ_printf ("diag.j", 300, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 301, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 303, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 304, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# hw_intr:
!!# 	mHWINT
!!#         {
!!#           IJ_printf ("diag.j", 310, th_all, "hwintr_%y_%d:\n", loop_cnt);
!!#           IJ_printf ("diag.j", 311, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", loop_cnt, Rv_intr_vect);
!!#           loop_cnt++;
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
