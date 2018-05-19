// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_17_s1.s
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
   random seed:	259124955
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

	setx 0xefafa10aa61a40b4, %g1, %g0
	setx 0x4b69db8c60bd5b01, %g1, %g1
	setx 0x34de894df3f0624a, %g1, %g2
	setx 0x37433f3429db5921, %g1, %g3
	setx 0x2becfeaf90f2d44d, %g1, %g4
	setx 0x531a558eb91a276d, %g1, %g5
	setx 0x8c5bf5bf87ece2de, %g1, %g6
	setx 0x6425a7d8482f9bee, %g1, %g7
	setx 0x3b92392868841dbc, %g1, %r16
	setx 0x43558c8f67243d29, %g1, %r17
	setx 0x191d39d6a3dbe8df, %g1, %r18
	setx 0x19b013c59d683e31, %g1, %r19
	setx 0x63a8be236169c5cb, %g1, %r20
	setx 0x6be29f80808dfeb5, %g1, %r21
	setx 0x40221bc4f2c1dc88, %g1, %r22
	setx 0x1288bd83f4a902de, %g1, %r23
	setx 0xc5450fea95e9128f, %g1, %r24
	setx 0xfef9987b78bc5ed6, %g1, %r25
	setx 0x9adfca8d810d6245, %g1, %r26
	setx 0x978db1b18e9d6a2f, %g1, %r27
	setx 0x93e60afe38985cb9, %g1, %r28
	setx 0xafe2fa3b6fdedd35, %g1, %r29
	setx 0xb2fc7221c04e2852, %g1, %r30
	setx 0xb9638db1282aba04, %g1, %r31
	save
	setx 0x77fac180acdf3853, %g1, %r16
	setx 0x075180d124f3c074, %g1, %r17
	setx 0x4751cbce78f2ca88, %g1, %r18
	setx 0x7e09532e6143d1a8, %g1, %r19
	setx 0x1023936ceec5890f, %g1, %r20
	setx 0x0d52b6ebde662a18, %g1, %r21
	setx 0x3e6c4fa8eb088813, %g1, %r22
	setx 0xdc5500fd240d37c1, %g1, %r23
	setx 0x11a92d3014bfc710, %g1, %r24
	setx 0xca73149686ed55b0, %g1, %r25
	setx 0x62f11d493dd498cd, %g1, %r26
	setx 0x7accadd81ff41c8c, %g1, %r27
	setx 0xda705078fdd6471f, %g1, %r28
	setx 0xbed1e8b95bc733a6, %g1, %r29
	setx 0x067f25310ebedf3b, %g1, %r30
	setx 0x1f97cf4f5e4a4719, %g1, %r31
	save
	setx 0x1d45e5097daf07d7, %g1, %r16
	setx 0xa942112ce7c474e5, %g1, %r17
	setx 0x5c6a9817a4cd431b, %g1, %r18
	setx 0x808a2e506727b718, %g1, %r19
	setx 0xbf4f957f099b79df, %g1, %r20
	setx 0x6f225d84529d827a, %g1, %r21
	setx 0xaf2c3b9b36511aaf, %g1, %r22
	setx 0xfde82160f7eb3508, %g1, %r23
	setx 0xb2fc07aa337cf72f, %g1, %r24
	setx 0x3ac254d9f5859a19, %g1, %r25
	setx 0xdac0e0404106b315, %g1, %r26
	setx 0x42f6c2a3ebb2bf64, %g1, %r27
	setx 0xcfd55c5147c9609d, %g1, %r28
	setx 0x2228e6a5ae596928, %g1, %r29
	setx 0x019083c9e1263db8, %g1, %r30
	setx 0x2565e6fd923f369e, %g1, %r31
	save
	setx 0x04f3e6c9cc3cf8eb, %g1, %r16
	setx 0x5b614d4aa64d6bf6, %g1, %r17
	setx 0x7fd1c9015378d172, %g1, %r18
	setx 0x194be0ca9ce0ac65, %g1, %r19
	setx 0x3f2f770bb93e2441, %g1, %r20
	setx 0x8807f338d19e1b08, %g1, %r21
	setx 0x2c8ef47c7efd8868, %g1, %r22
	setx 0x72fdc6a151222874, %g1, %r23
	setx 0x7f3cb02a32fe50f8, %g1, %r24
	setx 0xf834295a932f5fd8, %g1, %r25
	setx 0x4395a34f1659dc63, %g1, %r26
	setx 0x9c6ac07621967d6b, %g1, %r27
	setx 0xd6d9f64a25a1b8bd, %g1, %r28
	setx 0x7f57f000a04bf9ad, %g1, %r29
	setx 0x3d3a83fa12594037, %g1, %r30
	setx 0x156a6ed479d62a69, %g1, %r31
	save
	setx 0xb0f3ad3a1d86b7e7, %g1, %r16
	setx 0x286ad461f30ed959, %g1, %r17
	setx 0xc3727a860f954cfd, %g1, %r18
	setx 0x9b9d0c28686e3ff6, %g1, %r19
	setx 0xa85183c3506a0340, %g1, %r20
	setx 0x3e31057e8b7c4bed, %g1, %r21
	setx 0xc0771a05fd65f7ca, %g1, %r22
	setx 0x2297ca14ca8092de, %g1, %r23
	setx 0xaf6637363c541ccd, %g1, %r24
	setx 0xe949a8101aef6502, %g1, %r25
	setx 0x98b2b3033c66bb95, %g1, %r26
	setx 0x7da10ac7dd601641, %g1, %r27
	setx 0x9ce2f7bda6dea581, %g1, %r28
	setx 0xe9b30a84592e8f37, %g1, %r29
	setx 0xd45ad2c7757e9d38, %g1, %r30
	setx 0x988e560f268c5b33, %g1, %r31
	save
	setx 0x1c257d8f72a0a84f, %g1, %r16
	setx 0x08426cd64d83af31, %g1, %r17
	setx 0x82141ff88567bad3, %g1, %r18
	setx 0x1bf6abee32d5f7c4, %g1, %r19
	setx 0xe79c7e84a03d4d68, %g1, %r20
	setx 0x95ce91d6b6284c2a, %g1, %r21
	setx 0xdfad6133e0cad763, %g1, %r22
	setx 0xf2b7be6c65cfb775, %g1, %r23
	setx 0x86b57b9abf519c65, %g1, %r24
	setx 0x60d4c0ebfc88e6be, %g1, %r25
	setx 0xaf2ccbd928eba1cf, %g1, %r26
	setx 0xc3632403b812d248, %g1, %r27
	setx 0x1bf00ba9e8ea8f4f, %g1, %r28
	setx 0x77b0ec486a5ee7fd, %g1, %r29
	setx 0x46cafb38584cc46a, %g1, %r30
	setx 0x1ba05a0d95a69f31, %g1, %r31
	save
	setx 0xab4544b519c4a77e, %g1, %r16
	setx 0x46279b1c0a7da394, %g1, %r17
	setx 0x9080567b32d2a17e, %g1, %r18
	setx 0x5c65c6caa133897b, %g1, %r19
	setx 0x5727f97f07b1bda3, %g1, %r20
	setx 0x81c1a97e35a3f47d, %g1, %r21
	setx 0x5d6737af8f933770, %g1, %r22
	setx 0x00cb4567a5cce9e2, %g1, %r23
	setx 0xa519106d44854800, %g1, %r24
	setx 0x8d13eeac272f324f, %g1, %r25
	setx 0x8760c2b686709c79, %g1, %r26
	setx 0xbc0409eedd3ee08e, %g1, %r27
	setx 0x99b9801469a2db14, %g1, %r28
	setx 0x177e46539ca69011, %g1, %r29
	setx 0x9d04258c9fd10771, %g1, %r30
	setx 0x7777d67cf39f5240, %g1, %r31
	save
	setx 0xe772dc6303a75485, %g1, %r16
	setx 0x8662052da53d2d89, %g1, %r17
	setx 0x9332f32656ab7d2d, %g1, %r18
	setx 0xc59d943a6e4a151d, %g1, %r19
	setx 0xa6c0b0adb74eff7f, %g1, %r20
	setx 0x4974e9f8b34f3f0d, %g1, %r21
	setx 0xe22b8ae14750b66c, %g1, %r22
	setx 0xa830e95ecc65391e, %g1, %r23
	setx 0xa5f51f5b728aa635, %g1, %r24
	setx 0x929cfbf477c763eb, %g1, %r25
	setx 0xfe36603a0808b04b, %g1, %r26
	setx 0x5dec785a5b04eace, %g1, %r27
	setx 0x979820e3a166f5a6, %g1, %r28
	setx 0xfb66a15566c545bf, %g1, %r29
	setx 0xeccf699dace2fd16, %g1, %r30
	setx 0x951ee411c49b98ac, %g1, %r31
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
	setx	0x1a0034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_1:
	setx	0x1b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5a159  ! 9: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_0:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 10: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e5c000  ! 13: SAVE_R	save	%r23, %r0, %r27
	.word 0xbde4a173  ! 15: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbf3c2001  ! 16: SRA_I	sra 	%r16, 0x0001, %r31
T0_asi_reg_rd_0:
	mov	0x2a, %r14
	.word 0xf2db84a0  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e4c000  ! 20: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe54000  ! 22: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e4e1c0  ! 25: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbca5c000  ! 26: SUBcc_R	subcc 	%r23, %r0, %r30
	.word 0xb7e4214d  ! 28: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_1:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 30: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e560af  ! 31: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe46132  ! 32: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb234e031  ! 33: SUBC_I	orn 	%r19, 0x0031, %r25
	.word 0xb9e58000  ! 36: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe4c000  ! 38: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde5614e  ! 42: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_1:
	mov	0x34, %r14
	.word 0xf0f389e0  ! 43: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_2:
	setx	0x1f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_2:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 46: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5358000  ! 49: SRL_R	srl 	%r22, %r0, %r26
cpu_intr_0_3:
	setx	0x1c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_3:
	mov	0x1c, %r14
	.word 0xf4f38400  ! 55: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_4:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 58: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb7e5a1a7  ! 60: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_5:
	mov	0x25, %r14
	.word 0xf2f384a0  ! 62: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 23)
	.word 0xb1e58000  ! 65: SAVE_R	save	%r22, %r0, %r24
	.word 0xb0840000  ! 69: ADDcc_R	addcc 	%r16, %r0, %r24
cpu_intr_0_4:
	setx	0x1d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1d0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1b5  ! 75: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5c000  ! 78: SAVE_R	save	%r23, %r0, %r30
	.word 0xb7e48000  ! 79: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_6:
	setx	0x1c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3352001  ! 83: SRL_I	srl 	%r20, 0x0001, %r25
	.word 0xb3e44000  ! 84: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_6:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 88: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe42057  ! 89: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_7:
	mov	0x27, %r14
	.word 0xf6f38e80  ! 94: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7e4e0be  ! 96: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_8:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 98: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_9:
	mov	0x5, %r14
	.word 0xfef38e40  ! 102: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e44000  ! 103: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_7:
	setx	0x1f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89d0000  ! 107: XORcc_R	xorcc 	%r20, %r0, %r28
	.word 0xbde4e17a  ! 111: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbca46110  ! 113: SUBcc_I	subcc 	%r17, 0x0110, %r30
	.word 0xb7e44000  ! 114: SAVE_R	save	%r17, %r0, %r27
	.word 0xb83da1f9  ! 115: XNOR_I	xnor 	%r22, 0x01f9, %r28
T0_asi_reg_rd_2:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 116: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5e5c000  ! 117: SAVE_R	save	%r23, %r0, %r26
	.word 0xb5e48000  ! 118: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e5a190  ! 122: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e54000  ! 129: SAVE_R	save	%r21, %r0, %r24
	.word 0xb02d4000  ! 130: ANDN_R	andn 	%r21, %r0, %r24
T0_asi_reg_wr_10:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 131: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_3:
	mov	0x37, %r14
	.word 0xfadb8400  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 19)
	.word 0xbde4a041  ! 136: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_4:
	mov	0x11, %r14
	.word 0xfedb89e0  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbde5a1f5  ! 141: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_8:
	setx	0x1e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_5:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_9:
	setx	0x1c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_10:
	setx	0x1c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_11:
	mov	0x38, %r14
	.word 0xfef38e60  ! 151: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_11:
	setx	0x1c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe56003  ! 159: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 0)
	.word 0xb3e4e087  ! 162: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_12:
	setx	0x1c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1ab  ! 166: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_12:
	mov	0x1e, %r14
	.word 0xf2f38e60  ! 167: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e4e12d  ! 169: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_6:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 172: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_13:
	setx	0x1c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 176: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_14:
	setx	0x1c0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 179: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe4a11b  ! 180: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_13:
	mov	0x1a, %r14
	.word 0xfaf38400  ! 186: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5e58000  ! 187: SAVE_R	save	%r22, %r0, %r26
	.word 0xbde4a130  ! 191: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe5c000  ! 192: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_15:
	setx	0x1f0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 13)
	.word 0xb4044000  ! 197: ADD_R	add 	%r17, %r0, %r26
cpu_intr_0_16:
	setx	0x1d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_17:
	setx	0x1e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a067  ! 202: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4c000  ! 203: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe420e6  ! 204: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e5c000  ! 206: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_14:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 207: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_18:
	setx	0x1c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 211: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_7:
	mov	0x2c, %r14
	.word 0xf4db8e40  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_19:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_15:
	mov	0x1f, %r14
	.word 0xf6f38e40  ! 222: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_16:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 225: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_20:
	setx	0x1f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_8:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 237: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e46072  ! 241: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e4a1e9  ! 247: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e4203f  ! 248: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e48000  ! 250: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e44000  ! 252: SAVE_R	save	%r17, %r0, %r26
	.word 0x9195e065  ! 253: WRPR_PIL_I	wrpr	%r23, 0x0065, %pil
T0_asi_reg_rd_9:
	mov	0x7, %r14
	.word 0xf0db8400  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_17:
	mov	0x25, %r14
	.word 0xf0f389e0  ! 256: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_10:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 258: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_18:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 264: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbde48000  ! 266: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e460e9  ! 267: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_19:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 270: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_21:
	setx	0x1f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_11:
	mov	0x34, %r14
	.word 0xf4db8e40  ! 277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e40000  ! 279: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e58000  ! 280: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_20:
	mov	0xc, %r14
	.word 0xfaf38e40  ! 281: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3e5605f  ! 282: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 1)
	.word 0xbd641800  ! 284: MOVcc_R	<illegal instruction>
cpu_intr_0_22:
	setx	0x1d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_12:
	mov	0x38, %r14
	.word 0xfadb8e80  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5e54000  ! 287: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_13:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb225a049  ! 291: SUB_I	sub 	%r22, 0x0049, %r25
cpu_intr_0_23:
	setx	0x1c030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_24:
	setx	0x1f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 301: SAVE_R	save	%r20, %r0, %r26
	.word 0xb7345000  ! 302: SRLX_R	srlx	%r17, %r0, %r27
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_14:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_21:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 305: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe5208c  ! 309: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 32)
	.word 0xb3e5c000  ! 313: SAVE_R	save	%r23, %r0, %r25
	.word 0xb5e58000  ! 315: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e4606a  ! 321: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_25:
	setx	0x1d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_26:
	setx	0x3013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_27:
	setx	0x1f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde54000  ! 336: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_28:
	setx	0x1f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_29:
	setx	0x1e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56049  ! 342: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_22:
	mov	0x2f, %r14
	.word 0xf2f38400  ! 343: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_30:
	setx	0x1c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20521b6  ! 346: ADD_I	add 	%r20, 0x01b6, %r25
	.word 0xb7e50000  ! 349: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e46033  ! 351: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe4c000  ! 352: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_31:
	setx	0x1d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, c)
	.word 0xb084618f  ! 361: ADDcc_I	addcc 	%r17, 0x018f, %r24
cpu_intr_0_32:
	setx	0x1d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1e9  ! 371: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_33:
	setx	0x1f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba1dc000  ! 377: XOR_R	xor 	%r23, %r0, %r29
cpu_intr_0_34:
	setx	0x1f003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e1da  ! 383: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_35:
	setx	0x1f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_36:
	setx	0x1c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_23:
	mov	0x11, %r14
	.word 0xf6f384a0  ! 390: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_37:
	setx	0x1f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 392: SAVE_R	save	%r22, %r0, %r28
	.word 0xbbe50000  ! 395: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_24:
	mov	0xf, %r14
	.word 0xf6f38400  ! 396: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe44000  ! 398: SAVE_R	save	%r17, %r0, %r29
	.word 0xb9e4e177  ! 400: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_38:
	setx	0x1c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e40000  ! 407: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_39:
	setx	0x1e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5610f  ! 413: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_15:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 11)
	.word 0xbde420db  ! 420: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb22dc000  ! 421: ANDN_R	andn 	%r23, %r0, %r25
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
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbe3460c3  ! 431: ORN_I	orn 	%r17, 0x00c3, %r31
T0_asi_reg_rd_16:
	mov	0x1e, %r14
	.word 0xfedb8e60  ! 433: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_wr_25:
	mov	0x14, %r14
	.word 0xf4f38e80  ! 436: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_17:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 440: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb4bcc000  ! 441: XNORcc_R	xnorcc 	%r19, %r0, %r26
	.word 0xbbe48000  ! 443: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_18:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 446: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe50000  ! 447: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_19:
	mov	0xd, %r14
	.word 0xf6db8400  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
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
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0ad8000  ! 456: ANDNcc_R	andncc 	%r22, %r0, %r24
	.word 0xbc9cc000  ! 461: XORcc_R	xorcc 	%r19, %r0, %r30
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e56170  ! 463: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_26:
	mov	0x2a, %r14
	.word 0xf4f389e0  ! 464: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_27:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 466: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7e5204f  ! 468: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb0b58000  ! 469: ORNcc_R	orncc 	%r22, %r0, %r24
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_20:
	mov	0x34, %r14
	.word 0xf0db8e40  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_40:
	setx	0x22020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_28:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 482: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb4b42001  ! 483: SUBCcc_I	orncc 	%r16, 0x0001, %r26
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_41:
	setx	0x22020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_42:
	setx	0x21002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a003  ! 491: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_43:
	setx	0x230126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 495: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e5a082  ! 497: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5a09e  ! 498: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb834a14d  ! 502: ORN_I	orn 	%r18, 0x014d, %r28
cpu_intr_0_44:
	setx	0x21020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3da001  ! 504: SRA_I	sra 	%r22, 0x0001, %r30
T0_asi_reg_rd_21:
	mov	0x4, %r14
	.word 0xf6db8400  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_22:
	mov	0xf, %r14
	.word 0xf4db8e80  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_45:
	setx	0x230228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 511: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_29:
	mov	0x2, %r14
	.word 0xfaf38400  ! 513: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_30:
	mov	0x2d, %r14
	.word 0xf4f384a0  ! 514: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbde5c000  ! 515: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_31:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 518: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3e420e5  ! 524: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_46:
	setx	0x22030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e4a03b  ! 529: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe40000  ! 533: SAVE_R	save	%r16, %r0, %r29
	.word 0xbde5a042  ! 535: SAVE_I	save	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e46169  ! 540: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb41c6173  ! 541: XOR_I	xor 	%r17, 0x0173, %r26
	.word 0xb5e4610a  ! 542: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_23:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 546: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e56054  ! 548: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_47:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_24:
	mov	0x30, %r14
	.word 0xfadb8e60  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_wr_33:
	mov	0x10, %r14
	.word 0xfef38e40  ! 557: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e5a004  ! 559: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe48000  ! 560: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e50000  ! 561: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_34:
	mov	0x21, %r14
	.word 0xf6f38e40  ! 563: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_48:
	setx	0x23002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_25:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e4c000  ! 578: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe58000  ! 581: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_26:
	mov	0x32, %r14
	.word 0xfadb8e80  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_49:
	setx	0x23013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e48000  ! 596: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_27:
	mov	0x18, %r14
	.word 0xf8db8e60  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe4a080  ! 602: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7643801  ! 605: MOVcc_I	<illegal instruction>
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_50:
	setx	0x220011, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_28:
	mov	0x11, %r14
	.word 0xf6db8400  ! 609: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_35:
	mov	0xa, %r14
	.word 0xfef38e40  ! 610: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e48000  ! 612: SAVE_R	save	%r18, %r0, %r24
	.word 0xb33cb001  ! 613: SRAX_I	srax	%r18, 0x0001, %r25
cpu_intr_0_51:
	setx	0x230326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_36:
	mov	0x2c, %r14
	.word 0xfcf38400  ! 619: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_29:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7e5a0fa  ! 622: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 0)
	.word 0xb7e561f7  ! 625: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_30:
	mov	0xb, %r14
	.word 0xf8db89e0  ! 628: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_52:
	setx	0x220319, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 631: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_31:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbc25c000  ! 634: SUB_R	sub 	%r23, %r0, %r30
cpu_intr_0_53:
	setx	0x22033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 636: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_54:
	setx	0x21033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_38:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 643: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_39:
	mov	0x28, %r14
	.word 0xfef38400  ! 652: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb7e54000  ! 655: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_55:
	setx	0x210000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 661: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_56:
	setx	0x200326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_32:
	mov	0x2c, %r14
	.word 0xf8db8400  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3e48000  ! 670: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_57:
	setx	0x210126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e521d1  ! 672: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_40:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 677: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e520b4  ! 679: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_58:
	setx	0x23011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_41:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 681: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbbe560a9  ! 683: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 30)
	.word 0xbbe56107  ! 689: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e5e082  ! 690: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e54000  ! 695: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_33:
	mov	0xd, %r14
	.word 0xf0db89e0  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3e4a195  ! 698: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5616e  ! 702: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb83d4000  ! 703: XNOR_R	xnor 	%r21, %r0, %r28
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_59:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_34:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 708: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_35:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_60:
	setx	0x210209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, c)
	.word 0xbe3ce0bd  ! 718: XNOR_I	xnor 	%r19, 0x00bd, %r31
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_36:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 723: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde40000  ! 724: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe58000  ! 726: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_61:
	setx	0x210006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_62:
	setx	0x22032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_63:
	setx	0x220032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_64:
	setx	0x220005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_65:
	setx	0x200339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe05e09b  ! 746: ADD_I	add 	%r23, 0x009b, %r31
	.word 0xb7e5e018  ! 748: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_42:
	mov	0xd, %r14
	.word 0xfef389e0  ! 750: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbde40000  ! 755: SAVE_R	save	%r16, %r0, %r30
	.word 0xbbe50000  ! 756: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, b)
	.word 0xbde54000  ! 759: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_66:
	setx	0x23010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 761: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb0b48000  ! 763: SUBCcc_R	orncc 	%r18, %r0, %r24
	.word 0xb1e5c000  ! 765: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_43:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 766: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfe58000  ! 768: SAVE_R	save	%r22, %r0, %r31
	.word 0xb6b5c000  ! 772: ORNcc_R	orncc 	%r23, %r0, %r27
	.word 0xb88c0000  ! 773: ANDcc_R	andcc 	%r16, %r0, %r28
cpu_intr_0_67:
	setx	0x20003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_44:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 779: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e40000  ! 780: SAVE_R	save	%r16, %r0, %r26
	.word 0xb57c6401  ! 781: MOVR_I	movre	%r17, 0x1, %r26
	.word 0xbbe4a097  ! 786: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e58000  ! 787: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_38:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 789: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb335f001  ! 792: SRLX_I	srlx	%r23, 0x0001, %r25
	.word 0xbbe48000  ! 794: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde5c000  ! 796: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_68:
	setx	0x20011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521bc  ! 798: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e48000  ! 799: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_39:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_45:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 801: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe4c000  ! 804: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5518000  ! 805: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe4e144  ! 806: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_69:
	setx	0x20021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a016  ! 809: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_40:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe5a117  ! 811: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb205a07e  ! 812: ADD_I	add 	%r22, 0x007e, %r25
	.word 0xbfe54000  ! 814: SAVE_R	save	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_41:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_70:
	setx	0x210220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_46:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 825: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb8a5a1ff  ! 830: SUBcc_I	subcc 	%r22, 0x01ff, %r28
T0_asi_reg_rd_42:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb3e4a1c2  ! 832: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_43:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_71:
	setx	0x22013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5207a  ! 838: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e4e1d4  ! 839: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e46171  ! 840: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e5c000  ! 842: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_47:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 845: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3e4e00a  ! 846: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_48:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 847: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5e46018  ! 849: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_44:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_72:
	setx	0x21010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_73:
	setx	0x200232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0f0  ! 859: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_74:
	setx	0x220120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e46101  ! 869: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e5a058  ! 870: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe4a1ed  ! 871: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_75:
	setx	0x20021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561c1  ! 874: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e4a16e  ! 878: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5c000  ! 882: SAVE_R	save	%r23, %r0, %r29
	.word 0xb5e4e1cf  ! 887: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe5a048  ! 898: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_76:
	setx	0x26010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_77:
	setx	0x240309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3cd000  ! 903: SRAX_R	srax	%r19, %r0, %r29
	.word 0xb7e4a0a4  ! 904: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_49:
	mov	0x34, %r14
	.word 0xf8f38e60  ! 906: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbde5c000  ! 909: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde420ca  ! 914: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e4a15d  ! 916: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e58000  ! 917: SAVE_R	save	%r22, %r0, %r26
	.word 0xbc9460d6  ! 922: ORcc_I	orcc 	%r17, 0x00d6, %r30
	.word 0xbde42115  ! 923: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_78:
	setx	0x270326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 925: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde421c2  ! 929: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_50:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 932: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_51:
	mov	0x1e, %r14
	.word 0xfef384a0  ! 933: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 11)
	.word 0xbde58000  ! 937: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_79:
	setx	0x25010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_80:
	setx	0x260328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e421c5  ! 945: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_45:
	mov	0x37, %r14
	.word 0xfedb8e40  ! 947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1e5a036  ! 953: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e40000  ! 954: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb60461ea  ! 956: ADD_I	add 	%r17, 0x01ea, %r27
T0_asi_reg_rd_46:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde5c000  ! 963: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_52:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 965: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb7540000  ! 971: RDPR_GL	<illegal instruction>
cpu_intr_0_81:
	setx	0x250301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_82:
	setx	0x260232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 977: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_47:
	mov	0xf, %r14
	.word 0xfadb8400  ! 980: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3e5c000  ! 982: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e54000  ! 986: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_48:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 987: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7e4c000  ! 988: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_83:
	setx	0x24020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_53:
	mov	0x15, %r14
	.word 0xf2f389e0  ! 992: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_49:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_50:
	mov	0x37, %r14
	.word 0xfedb8e40  ! 1003: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e40000  ! 1004: SAVE_R	save	%r16, %r0, %r25
	.word 0xb1641800  ! 1007: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_54:
	mov	0x2d, %r14
	.word 0xfaf38400  ! 1008: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbe58000  ! 1015: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe4e016  ! 1017: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_51:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 1018: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_84:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbbe560b4  ! 1025: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbb35e001  ! 1026: SRL_I	srl 	%r23, 0x0001, %r29
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 0)
	.word 0xba35a17b  ! 1030: SUBC_I	orn 	%r22, 0x017b, %r29
	.word 0xbbe46173  ! 1034: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_85:
	setx	0x26033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0a6  ! 1039: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e40000  ! 1042: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_55:
	mov	0x24, %r14
	.word 0xf0f384a0  ! 1045: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_53:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, a)
	.word 0xbde5a1a4  ! 1055: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e5c000  ! 1060: SAVE_R	save	%r23, %r0, %r28
	.word 0xb7e4c000  ! 1061: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e40000  ! 1062: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e5e0d3  ! 1063: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_56:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 1064: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb00da098  ! 1066: AND_I	and 	%r22, 0x0098, %r24
cpu_intr_0_86:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x260127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_57:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 1077: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_58:
	mov	0x1f, %r14
	.word 0xf4f384a0  ! 1081: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 18)
	.word 0xbbe42116  ! 1087: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e54000  ! 1089: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e40000  ! 1091: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7342001  ! 1095: SRL_I	srl 	%r16, 0x0001, %r27
cpu_intr_0_88:
	setx	0x270115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 1097: SAVE_R	save	%r20, %r0, %r30
	.word 0xbfe521b3  ! 1099: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e5a189  ! 1100: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_89:
	setx	0x250105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520e4  ! 1102: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 29)
	.word 0xbac4e081  ! 1109: ADDCcc_I	addccc 	%r19, 0x0081, %r29
T0_asi_reg_wr_59:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 1110: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb8440000  ! 1113: ADDC_R	addc 	%r16, %r0, %r28
T0_asi_reg_rd_54:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_90:
	setx	0x270338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 1119: SAVE_R	save	%r16, %r0, %r27
	.word 0xbbe5614c  ! 1123: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb37d8400  ! 1125: MOVR_R	movre	%r22, %r0, %r25
	.word 0xb1e5e168  ! 1127: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e5e025  ! 1129: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e44000  ! 1131: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e50000  ! 1136: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e50000  ! 1137: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_91:
	setx	0x250235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1ea  ! 1142: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe520d6  ! 1145: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 26)
	.word 0xb7e5a08c  ! 1150: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_92:
	setx	0x250031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_93:
	setx	0x260201, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_60:
	mov	0x33, %r14
	.word 0xfaf389e0  ! 1165: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_94:
	setx	0x24001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e067  ! 1167: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_61:
	mov	0x15, %r14
	.word 0xf6f38400  ! 1169: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3e50000  ! 1175: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe54000  ! 1176: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_95:
	setx	0x260308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 8)
	.word 0xba44611f  ! 1183: ADDC_I	addc 	%r17, 0x011f, %r29
	.word 0xb0bdc000  ! 1186: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xb3e50000  ! 1189: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_96:
	setx	0x260310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1194: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde54000  ! 1198: SAVE_R	save	%r21, %r0, %r30
	.word 0xbc25a0c0  ! 1199: SUB_I	sub 	%r22, 0x00c0, %r30
cpu_intr_0_97:
	setx	0x250129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e08f  ! 1203: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbd510000  ! 1207: RDPR_TICK	<illegal instruction>
	.word 0xb9e44000  ! 1208: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_98:
	setx	0x250003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8348000  ! 1210: SUBC_R	orn 	%r18, %r0, %r28
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_99:
	setx	0x25010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1219: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_100:
	setx	0x270105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_55:
	mov	0x3, %r14
	.word 0xf2db89e0  ! 1224: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb89420cd  ! 1228: ORcc_I	orcc 	%r16, 0x00cd, %r28
T0_asi_reg_rd_56:
	mov	0x0, %r14
	.word 0xfcdb84a0  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_62:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 1234: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbb3c6001  ! 1239: SRA_I	sra 	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e54000  ! 1245: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_101:
	setx	0x240108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e009  ! 1249: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_102:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1252: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e40000  ! 1254: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_103:
	setx	0x270018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e082  ! 1259: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbd2d2001  ! 1261: SLL_I	sll 	%r20, 0x0001, %r30
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 28)
	.word 0xb3e4a1e2  ! 1263: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e4e178  ! 1265: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_104:
	setx	0x27022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_105:
	setx	0x260032, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4c000  ! 1283: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_57:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_58:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb7e54000  ! 1290: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe4e063  ! 1291: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_106:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82de0f6  ! 1295: ANDN_I	andn 	%r23, 0x00f6, %r28
	.word 0xb7e50000  ! 1296: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e560fd  ! 1297: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_107:
	setx	0x240301, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_59:
	mov	0x15, %r14
	.word 0xf2db8e40  ! 1299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_108:
	setx	0x240230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_109:
	setx	0x250214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 1312: SAVE_R	save	%r20, %r0, %r30
	.word 0xb52cd000  ! 1313: SLLX_R	sllx	%r19, %r0, %r26
T0_asi_reg_rd_60:
	mov	0x1f, %r14
	.word 0xfadb8e60  ! 1315: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe50000  ! 1317: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_110:
	setx	0x25010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2844000  ! 1325: ADDcc_R	addcc 	%r17, %r0, %r25
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe5601e  ! 1327: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4c000  ! 1328: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_63:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 1329: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb634208d  ! 1331: SUBC_I	orn 	%r16, 0x008d, %r27
cpu_intr_0_111:
	setx	0x25001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_61:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_64:
	mov	0x29, %r14
	.word 0xf4f38e40  ! 1344: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_112:
	setx	0x260218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e198  ! 1346: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde50000  ! 1348: SAVE_R	save	%r20, %r0, %r30
	.word 0xb7e50000  ! 1353: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_65:
	mov	0x37, %r14
	.word 0xf6f38e60  ! 1356: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5e4e1a1  ! 1359: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe4c000  ! 1364: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e5c000  ! 1368: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e4e045  ! 1370: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e40000  ! 1373: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 17)
	.word 0xb5e50000  ! 1377: SAVE_R	save	%r20, %r0, %r26
	.word 0xbfe4e02b  ! 1379: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_66:
	mov	0x35, %r14
	.word 0xf4f38e80  ! 1384: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_62:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbbe42052  ! 1387: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_113:
	setx	0x2a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_63:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 1394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_114:
	setx	0x2b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 1401: SAVE_R	save	%r23, %r0, %r30
	.word 0xb7e40000  ! 1403: SAVE_R	save	%r16, %r0, %r27
	.word 0x8995e182  ! 1404: WRPR_TICK_I	wrpr	%r23, 0x0182, %tick
	.word 0xbde58000  ! 1406: SAVE_R	save	%r22, %r0, %r30
	.word 0xb4ac8000  ! 1408: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0xb52c2001  ! 1409: SLL_I	sll 	%r16, 0x0001, %r26
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb9e58000  ! 1419: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_115:
	setx	0x29001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, d)
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_67:
	mov	0x8, %r14
	.word 0xf8f38400  ! 1425: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_64:
	mov	0x23, %r14
	.word 0xfadb8400  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3e4a1e9  ! 1428: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe50000  ! 1432: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe4216e  ! 1433: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_116:
	setx	0x2b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42045  ! 1439: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb53d2001  ! 1440: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xbbe5a1bf  ! 1443: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_68:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 1445: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_117:
	setx	0x2b0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52092  ! 1448: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_65:
	mov	0xc, %r14
	.word 0xfedb8e80  ! 1452: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5e5612c  ! 1459: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_118:
	setx	0x2b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 29)
	.word 0xb28d0000  ! 1466: ANDcc_R	andcc 	%r20, %r0, %r25
cpu_intr_0_119:
	setx	0x2b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_120:
	setx	0x2b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_69:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 1472: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_70:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 1477: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_121:
	setx	0x2b020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 1483: SAVE_R	save	%r17, %r0, %r30
	.word 0xb9e48000  ! 1484: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e46004  ! 1487: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbb2ca001  ! 1493: SLL_I	sll 	%r18, 0x0001, %r29
T0_asi_reg_wr_71:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 1497: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e561ff  ! 1498: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_72:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 1499: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5e5200a  ! 1500: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_122:
	setx	0x2a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_123:
	setx	0x2a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe58000  ! 1507: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe58000  ! 1508: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_73:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 1509: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe4611e  ! 1511: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_124:
	setx	0x290033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 1515: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_66:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 1517: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb5e5c000  ! 1518: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde48000  ! 1520: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_125:
	setx	0x2b0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520f6  ! 1523: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_74:
	mov	0x7, %r14
	.word 0xf0f389e0  ! 1525: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7e4c000  ! 1526: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_126:
	setx	0x290133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 1529: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_75:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 1531: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe4a10e  ! 1532: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_76:
	mov	0x33, %r14
	.word 0xfcf38e40  ! 1538: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_77:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 1539: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_67:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe5a1a8  ! 1544: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e58000  ! 1545: SAVE_R	save	%r22, %r0, %r27
	.word 0xb32d5000  ! 1547: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xb8358000  ! 1548: ORN_R	orn 	%r22, %r0, %r28
T0_asi_reg_wr_78:
	mov	0x2d, %r14
	.word 0xfaf38400  ! 1551: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb6bc20b5  ! 1553: XNORcc_I	xnorcc 	%r16, 0x00b5, %r27
cpu_intr_0_127:
	setx	0x280116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_79:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 1555: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5e48000  ! 1556: SAVE_R	save	%r18, %r0, %r26
	.word 0xb8ad6194  ! 1566: ANDNcc_I	andncc 	%r21, 0x0194, %r28
	.word 0xbde50000  ! 1568: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_80:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 1569: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 32)
	.word 0xb97d4400  ! 1573: MOVR_R	movre	%r21, %r0, %r28
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, e)
	.word 0xbcac6064  ! 1584: ANDNcc_I	andncc 	%r17, 0x0064, %r30
	.word 0xbfe5c000  ! 1585: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_68:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 1588: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbe5c000  ! 1591: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_81:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1594: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb53c0000  ! 1595: SRA_R	sra 	%r16, %r0, %r26
cpu_intr_0_128:
	setx	0x28030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 1599: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_129:
	setx	0x280118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1606: SAVE_R	save	%r21, %r0, %r27
	.word 0xb7e5e1a8  ! 1608: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde54000  ! 1609: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe4a0cf  ! 1610: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe40000  ! 1611: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e44000  ! 1613: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe56099  ! 1616: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_69:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_130:
	setx	0x2b030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1619: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe48000  ! 1620: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_82:
	mov	0x0, %r14
	.word 0xf8f384a0  ! 1621: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_70:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 1622: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_83:
	mov	0x5, %r14
	.word 0xf2f38e60  ! 1623: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb5e5e058  ! 1625: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_131:
	setx	0x2a0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1627: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_71:
	mov	0x6, %r14
	.word 0xf2db8e60  ! 1628: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1e5a12a  ! 1629: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_132:
	setx	0x2a0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56036  ! 1636: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e40000  ! 1637: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_84:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 1640: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3e4e136  ! 1641: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e44000  ! 1642: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_133:
	setx	0x2a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_134:
	setx	0x29002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e16e  ! 1647: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe54000  ! 1658: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_135:
	setx	0x2b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_136:
	setx	0x2b022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 1669: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_85:
	mov	0x1f, %r14
	.word 0xf8f389e0  ! 1671: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 4)
	.word 0xb8140000  ! 1674: OR_R	or 	%r16, %r0, %r28
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_137:
	setx	0x2a0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0xf, %r14
	.word 0xf0f38400  ! 1678: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_72:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_138:
	setx	0x29031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e022  ! 1685: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_87:
	mov	0x36, %r14
	.word 0xfef389e0  ! 1687: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_139:
	setx	0x290305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a19c  ! 1691: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8995a144  ! 1694: WRPR_TICK_I	wrpr	%r22, 0x0144, %tick
cpu_intr_0_140:
	setx	0x29033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_141:
	setx	0x280332, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_88:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 1700: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_89:
	mov	0xe, %r14
	.word 0xf4f38e40  ! 1701: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_73:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 1702: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe4c000  ! 1704: SAVE_R	save	%r19, %r0, %r31
	.word 0xb7e58000  ! 1707: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_74:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 1709: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_rd_75:
	mov	0x19, %r14
	.word 0xf4db8e80  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbb3c9000  ! 1713: SRAX_R	srax	%r18, %r0, %r29
	.word 0x81956035  ! 1714: WRPR_TPC_I	wrpr	%r21, 0x0035, %tpc
T0_asi_reg_rd_76:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_142:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_90:
	mov	0x9, %r14
	.word 0xfcf38e60  ! 1723: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1e4c000  ! 1725: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e4a18d  ! 1730: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb4154000  ! 1739: OR_R	or 	%r21, %r0, %r26
cpu_intr_0_143:
	setx	0x2a010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46193  ! 1742: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_77:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_91:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 1748: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xba95a196  ! 1752: ORcc_I	orcc 	%r22, 0x0196, %r29
cpu_intr_0_144:
	setx	0x28032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 1757: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe40000  ! 1758: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_145:
	setx	0x290115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3340000  ! 1767: SRL_R	srl 	%r16, %r0, %r25
T0_asi_reg_rd_78:
	mov	0x3c0, %r14
	.word 0xfedb89e0  ! 1768: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e58000  ! 1774: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e4a0c0  ! 1775: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e5c000  ! 1778: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 25)
	.word 0xba3c8000  ! 1782: XNOR_R	xnor 	%r18, %r0, %r29
T0_asi_reg_rd_79:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbcb4a0c6  ! 1787: ORNcc_I	orncc 	%r18, 0x00c6, %r30
	.word 0xbbe5a142  ! 1788: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7641800  ! 1789: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_92:
	mov	0xd, %r14
	.word 0xf2f38e60  ! 1790: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_80:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 1791: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbd3de001  ! 1793: SRA_I	sra 	%r23, 0x0001, %r30
	.word 0xb13d1000  ! 1796: SRAX_R	srax	%r20, %r0, %r24
	.word 0xb0b50000  ! 1799: ORNcc_R	orncc 	%r20, %r0, %r24
T0_asi_reg_rd_81:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e5a079  ! 1801: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e5e1b6  ! 1803: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_93:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 1804: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb005a027  ! 1805: ADD_I	add 	%r22, 0x0027, %r24
cpu_intr_0_146:
	setx	0x2d0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0x22, %r14
	.word 0xf0db8e80  ! 1814: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1e421c7  ! 1815: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_147:
	setx	0x2f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 1821: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e48000  ! 1824: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e5c000  ! 1829: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e4e14b  ! 1830: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e54000  ! 1831: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_83:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_148:
	setx	0x2c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_149:
	setx	0x2f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a151  ! 1839: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_84:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe4e0e4  ! 1855: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb5e5e108  ! 1858: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_150:
	setx	0x2e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_85:
	mov	0x2a, %r14
	.word 0xfcdb8e60  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe520fd  ! 1864: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe5e167  ! 1866: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_86:
	mov	0x5, %r14
	.word 0xfedb8e80  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_wr_94:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 1868: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_95:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 1875: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbcbce187  ! 1876: XNORcc_I	xnorcc 	%r19, 0x0187, %r30
	.word 0xbde50000  ! 1879: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e4e156  ! 1880: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_87:
	mov	0x5, %r14
	.word 0xf2db8400  ! 1881: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9e48000  ! 1883: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_88:
	mov	0x2, %r14
	.word 0xf4db8e80  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1e4a017  ! 1890: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe421c6  ! 1891: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e5e047  ! 1892: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb0c5c000  ! 1893: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0xb204a0a4  ! 1894: ADD_I	add 	%r18, 0x00a4, %r25
	.word 0xb9e40000  ! 1895: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe4c000  ! 1897: SAVE_R	save	%r19, %r0, %r31
	.word 0xba2d2072  ! 1898: ANDN_I	andn 	%r20, 0x0072, %r29
cpu_intr_0_151:
	setx	0x2f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1f4  ! 1904: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_152:
	setx	0x2f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e017  ! 1906: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_153:
	setx	0x2f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_154:
	setx	0x2f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_96:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 1912: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbbe5e14f  ! 1917: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_155:
	setx	0x2c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_89:
	mov	0x31, %r14
	.word 0xf6db84a0  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e52028  ! 1923: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e4e1b5  ! 1924: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_156:
	setx	0x2c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 1929: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e50000  ! 1931: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_157:
	setx	0x2e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_98:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 1935: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_99:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 1937: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfe5a0d7  ! 1939: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_158:
	setx	0x2d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_159:
	setx	0x2c020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe244000  ! 1943: SUB_R	sub 	%r17, %r0, %r31
cpu_intr_0_160:
	setx	0x2f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_90:
	mov	0x26, %r14
	.word 0xf6db89e0  ! 1945: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb5e5a041  ! 1946: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_100:
	mov	0x18, %r14
	.word 0xf6f384a0  ! 1949: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_161:
	setx	0x2f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 3)
	.word 0xba0de00f  ! 1962: AND_I	and 	%r23, 0x000f, %r29
T0_asi_reg_wr_101:
	mov	0x31, %r14
	.word 0xfcf38e40  ! 1963: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfe5a0c3  ! 1965: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_162:
	setx	0x2c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1967: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_102:
	mov	0x9, %r14
	.word 0xf0f38e40  ! 1969: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_103:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 1971: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_163:
	setx	0x2e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_164:
	setx	0x2f0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_91:
	mov	0x2d, %r14
	.word 0xfcdb8e80  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbfe52057  ! 1979: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_165:
	setx	0x2f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_166:
	setx	0x2c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, e)
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 33)
	.word 0xbbe4202c  ! 1988: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_167:
	setx	0x2f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf357001  ! 1991: SRLX_I	srlx	%r21, 0x0001, %r31
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e58000  ! 1994: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_104:
	mov	0x28, %r14
	.word 0xfef384a0  ! 1996: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe4c000  ! 1999: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_168:
	setx	0x2c0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa48000  ! 2004: SUBcc_R	subcc 	%r18, %r0, %r29
T0_asi_reg_rd_92:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9346001  ! 2008: SRL_I	srl 	%r17, 0x0001, %r28
	.word 0xb1e48000  ! 2012: SAVE_R	save	%r18, %r0, %r24
	.word 0xbb344000  ! 2013: SRL_R	srl 	%r17, %r0, %r29
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_93:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 2023: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba44e154  ! 2026: ADDC_I	addc 	%r19, 0x0154, %r29
	.word 0xbde44000  ! 2028: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_169:
	setx	0x2e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_94:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1643801  ! 2039: MOVcc_I	<illegal instruction>
	.word 0xbb508000  ! 2044: RDPR_TSTATE	<illegal instruction>
	.word 0xb8c520ee  ! 2046: ADDCcc_I	addccc 	%r20, 0x00ee, %r28
	.word 0xbbe50000  ! 2047: SAVE_R	save	%r20, %r0, %r29
	.word 0xb40ce12a  ! 2048: AND_I	and 	%r19, 0x012a, %r26
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 21)
	.word 0xb7e54000  ! 2054: SAVE_R	save	%r21, %r0, %r27
	.word 0xb9e4a150  ! 2056: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e4e11a  ! 2058: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb92c5000  ! 2060: SLLX_R	sllx	%r17, %r0, %r28
T0_asi_reg_rd_95:
	mov	0x1a, %r14
	.word 0xf4db8400  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_170:
	setx	0x2d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46081  ! 2064: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e4c000  ! 2065: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e40000  ! 2066: SAVE_R	save	%r16, %r0, %r28
	.word 0xb5e4218e  ! 2069: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_105:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 2073: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e420cd  ! 2078: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e50000  ! 2080: SAVE_R	save	%r20, %r0, %r25
	.word 0xb7e58000  ! 2084: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_171:
	setx	0x2e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_172:
	setx	0x2f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_106:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 2091: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T0_asi_reg_rd_96:
	mov	0x20, %r14
	.word 0xfedb8400  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_173:
	setx	0x2f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_97:
	mov	0x19, %r14
	.word 0xf4db89e0  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb8158000  ! 2103: OR_R	or 	%r22, %r0, %r28
cpu_intr_0_174:
	setx	0x2e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x8, %r14
	.word 0xf2f38e40  ! 2107: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_108:
	mov	0x14, %r14
	.word 0xfef38e40  ! 2109: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_109:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 2111: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb52ce001  ! 2112: SLL_I	sll 	%r19, 0x0001, %r26
T0_asi_reg_rd_98:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb52ca001  ! 2119: SLL_I	sll 	%r18, 0x0001, %r26
cpu_intr_0_175:
	setx	0x2d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_176:
	setx	0x2e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_177:
	setx	0x2f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e44000  ! 2141: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_178:
	setx	0x2e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a188  ! 2146: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_110:
	mov	0x10, %r14
	.word 0xfaf384a0  ! 2148: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbbe4e07d  ! 2149: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_179:
	setx	0x2d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_180:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 2153: SAVE_R	save	%r19, %r0, %r29
	.word 0xbd520000  ! 2156: RDPR_PIL	<illegal instruction>
T0_asi_reg_wr_111:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 2158: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e42007  ! 2160: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_181:
	setx	0x2f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc948000  ! 2170: ORcc_R	orcc 	%r18, %r0, %r30
T0_asi_reg_wr_112:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 2174: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe520ae  ! 2175: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e40000  ! 2176: SAVE_R	save	%r16, %r0, %r25
	.word 0xb5500000  ! 2178: RDPR_TPC	<illegal instruction>
	.word 0xbc3c4000  ! 2180: XNOR_R	xnor 	%r17, %r0, %r30
T0_asi_reg_rd_99:
	mov	0x29, %r14
	.word 0xf2db8e80  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb42d4000  ! 2183: ANDN_R	andn 	%r21, %r0, %r26
	.word 0xbbe5e0ff  ! 2184: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb57d2401  ! 2187: MOVR_I	movre	%r20, 0x1, %r26
	.word 0xb3e56124  ! 2189: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_113:
	mov	0x3c0, %r14
	.word 0xf0f38e80  ! 2190: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xba94c000  ! 2192: ORcc_R	orcc 	%r19, %r0, %r29
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_114:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 2195: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_100:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e5a00a  ! 2202: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_115:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 2204: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_182:
	setx	0x2c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 2208: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_101:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_116:
	mov	0xd, %r14
	.word 0xf8f384a0  ! 2212: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5e560b8  ! 2213: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe4c000  ! 2215: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e52129  ! 2218: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 6)
	.word 0xb5e50000  ! 2221: SAVE_R	save	%r20, %r0, %r26
	.word 0xbbe48000  ! 2224: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e4c000  ! 2226: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde40000  ! 2227: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e421b7  ! 2230: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_102:
	mov	0x14, %r14
	.word 0xf4db8e40  ! 2232: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e4a11a  ! 2233: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_183:
	setx	0x2c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e56008  ! 2242: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe40000  ! 2243: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_117:
	mov	0x18, %r14
	.word 0xf6f389e0  ! 2244: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e56067  ! 2246: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_184:
	setx	0x2d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 32)
	.word 0xb1e46040  ! 2251: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e56157  ! 2253: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_118:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 2255: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e5203b  ! 2256: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde54000  ! 2258: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_185:
	setx	0x2f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_186:
	setx	0x2d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_103:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe5e13b  ! 2265: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbc140000  ! 2267: OR_R	or 	%r16, %r0, %r30
	.word 0xbbe44000  ! 2270: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_104:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e4c000  ! 2279: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe4e028  ! 2280: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbc254000  ! 2281: SUB_R	sub 	%r21, %r0, %r30
	.word 0xbbe50000  ! 2283: SAVE_R	save	%r20, %r0, %r29
	.word 0xb33c9000  ! 2287: SRAX_R	srax	%r18, %r0, %r25
	.word 0xb3e4e05f  ! 2288: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_119:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2289: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde4c000  ! 2290: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_187:
	setx	0x320107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c6001  ! 2293: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xbbe521be  ! 2294: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5a127  ! 2297: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_105:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 2299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e58000  ! 2300: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e4e107  ! 2304: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbb50c000  ! 2307: RDPR_TT	<illegal instruction>
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, a)
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 3)
	.word 0xb7e42128  ! 2312: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_120:
	mov	0xb, %r14
	.word 0xfaf389e0  ! 2314: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_106:
	mov	0xc, %r14
	.word 0xf2db84a0  ! 2325: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_188:
	setx	0x310029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 2327: RDPR_PIL	<illegal instruction>
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, b)
	.word 0xbf3d7001  ! 2329: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xb5e54000  ! 2332: SAVE_R	save	%r21, %r0, %r26
	.word 0x8594e13b  ! 2334: WRPR_TSTATE_I	wrpr	%r19, 0x013b, %tstate
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, a)
	.word 0xbde40000  ! 2341: SAVE_R	save	%r16, %r0, %r30
	.word 0xb93c1000  ! 2343: SRAX_R	srax	%r16, %r0, %r28
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_189:
	setx	0x30033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb245c000  ! 2349: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xbbe4211e  ! 2353: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e5a04d  ! 2354: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_190:
	setx	0x330034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e1fc  ! 2357: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e46110  ! 2359: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_121:
	mov	0x13, %r14
	.word 0xf0f384a0  ! 2361: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e56188  ! 2366: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe421a2  ! 2367: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e4e000  ! 2372: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbcad4000  ! 2374: ANDNcc_R	andncc 	%r21, %r0, %r30
T0_asi_reg_wr_122:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 2380: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_191:
	setx	0x30021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a134  ! 2384: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_192:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_123:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 2396: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_124:
	mov	0xd, %r14
	.word 0xfef38e60  ! 2397: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_rd_107:
	mov	0xc, %r14
	.word 0xf4db8e60  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_193:
	setx	0x330036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_194:
	setx	0x33000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_125:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 2407: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde4e01a  ! 2410: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e40000  ! 2411: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_195:
	setx	0x310222, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_126:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 2414: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbfe5a06c  ! 2417: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e5a159  ! 2426: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e4e185  ! 2427: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e50000  ! 2442: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe560b9  ! 2445: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe44000  ! 2447: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_127:
	mov	0xc, %r14
	.word 0xf8f38400  ! 2449: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3e50000  ! 2450: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_108:
	mov	0x6, %r14
	.word 0xf4db84a0  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_196:
	setx	0x300218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 2453: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e5c000  ! 2455: SAVE_R	save	%r23, %r0, %r24
	.word 0xb5e48000  ! 2456: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde4c000  ! 2458: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_128:
	mov	0xc, %r14
	.word 0xf2f38400  ! 2460: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_109:
	mov	0x28, %r14
	.word 0xfcdb84a0  ! 2469: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, d)
	.word 0xb33c3001  ! 2472: SRAX_I	srax	%r16, 0x0001, %r25
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e4e0c7  ! 2482: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_129:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 2487: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_130:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 2488: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbcb5a088  ! 2489: ORNcc_I	orncc 	%r22, 0x0088, %r30
	.word 0xb72cc000  ! 2491: SLL_R	sll 	%r19, %r0, %r27
	.word 0xb83c0000  ! 2493: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xb5e4c000  ! 2494: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e50000  ! 2495: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_197:
	setx	0x300316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460d8  ! 2507: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_198:
	setx	0x30001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45e041  ! 2512: ADDC_I	addc 	%r23, 0x0041, %r29
T0_asi_reg_rd_110:
	mov	0x1, %r14
	.word 0xf6db8e60  ! 2514: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_199:
	setx	0x33011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0aa  ! 2517: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_111:
	mov	0xa, %r14
	.word 0xf6db8400  ! 2519: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_200:
	setx	0x300118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20c600a  ! 2523: AND_I	and 	%r17, 0x000a, %r25
T0_asi_reg_wr_131:
	mov	0xe, %r14
	.word 0xf8f38e80  ! 2524: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbe1d20d4  ! 2528: XOR_I	xor 	%r20, 0x00d4, %r31
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_112:
	mov	0x14, %r14
	.word 0xfadb89e0  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7e4202f  ! 2534: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e48000  ! 2536: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e5a0d4  ! 2539: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe58000  ! 2540: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_132:
	mov	0x14, %r14
	.word 0xf4f38400  ! 2543: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e54000  ! 2547: SAVE_R	save	%r21, %r0, %r28
	.word 0xb83c4000  ! 2548: XNOR_R	xnor 	%r17, %r0, %r28
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 16)
	.word 0xb32d8000  ! 2551: SLL_R	sll 	%r22, %r0, %r25
cpu_intr_0_201:
	setx	0x30001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 2553: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e4a06c  ! 2557: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e56114  ! 2558: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_133:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 2561: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe5a05b  ! 2562: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_113:
	mov	0x12, %r14
	.word 0xf6db8e60  ! 2564: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5e54000  ! 2568: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e4202e  ! 2569: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde560d1  ! 2571: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7342001  ! 2573: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xbbe5a023  ! 2575: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 27)
	.word 0xb03c0000  ! 2578: XNOR_R	xnor 	%r16, %r0, %r24
	.word 0xb9e46133  ! 2579: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_134:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 2584: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 8)
	.word 0xb2950000  ! 2589: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xb4bcc000  ! 2590: XNORcc_R	xnorcc 	%r19, %r0, %r26
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe5e19a  ! 2598: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e521f8  ! 2600: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, a)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_202:
	setx	0x33032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_135:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 2605: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_203:
	setx	0x310238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0940000  ! 2607: ORcc_R	orcc 	%r16, %r0, %r24
T0_asi_reg_wr_136:
	mov	0x23, %r14
	.word 0xf6f384a0  ! 2613: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_rd_114:
	mov	0x11, %r14
	.word 0xfedb8e40  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe5a0f2  ! 2616: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4a022  ! 2618: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_204:
	setx	0x320228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_115:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 2621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbca48000  ! 2622: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0x8994205e  ! 2625: WRPR_TICK_I	wrpr	%r16, 0x005e, %tick
T0_asi_reg_wr_137:
	mov	0x26, %r14
	.word 0xfaf38e80  ! 2626: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_138:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 2629: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb33c6001  ! 2636: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0xb6ad200a  ! 2637: ANDNcc_I	andncc 	%r20, 0x000a, %r27
	.word 0xbde5604e  ! 2640: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 26)
	.word 0xbbe58000  ! 2644: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_205:
	setx	0x32021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_139:
	mov	0x8, %r14
	.word 0xf0f389e0  ! 2660: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_116:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 2662: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfe4e0e9  ! 2666: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_206:
	setx	0x31010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_207:
	setx	0x330233, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_140:
	mov	0x19, %r14
	.word 0xfef38e40  ! 2670: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_141:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2672: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_142:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 2673: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb4b4e0fe  ! 2678: SUBCcc_I	orncc 	%r19, 0x00fe, %r26
cpu_intr_0_208:
	setx	0x33001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_143:
	mov	0x17, %r14
	.word 0xfef38e40  ! 2685: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_117:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 2688: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3e5a0ab  ! 2693: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_209:
	setx	0x320003, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_144:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 2699: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_210:
	setx	0x37031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 2715: MOVcc_I	<illegal instruction>
	.word 0xb5e48000  ! 2717: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_211:
	setx	0x360108, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_145:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 2722: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_146:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 2724: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_118:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_212:
	setx	0x370318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 2730: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_213:
	setx	0x340333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_214:
	setx	0x350206, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x1c, %r14
	.word 0xf0db8e80  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e48000  ! 2738: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_147:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 2739: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe5a035  ! 2742: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4614c  ! 2747: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe4a18f  ! 2748: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_215:
	setx	0x36011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_148:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2756: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_216:
	setx	0x340211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e101  ! 2769: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_120:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 2776: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, b)
	.word 0xb8aca0da  ! 2781: ANDNcc_I	andncc 	%r18, 0x00da, %r28
T0_asi_reg_rd_121:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 2784: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbde5e173  ! 2785: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_149:
	mov	0x2b, %r14
	.word 0xf4f389e0  ! 2789: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_217:
	setx	0x37000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_150:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 2791: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbfe5c000  ! 2793: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_122:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_218:
	setx	0x360214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_151:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2799: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4a12e  ! 2801: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe461ba  ! 2803: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_219:
	setx	0x340125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_123:
	mov	0x16, %r14
	.word 0xfcdb8400  ! 2809: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1e54000  ! 2810: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e54000  ! 2811: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_220:
	setx	0x35000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_221:
	setx	0x35033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_222:
	setx	0x37011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_223:
	setx	0x370122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819521f5  ! 2834: WRPR_TPC_I	wrpr	%r20, 0x01f5, %tpc
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_152:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 2837: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_224:
	setx	0x37032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_225:
	setx	0x340204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1e1  ! 2847: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb69c6088  ! 2850: XORcc_I	xorcc 	%r17, 0x0088, %r27
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 3)
	.word 0xb72c0000  ! 2856: SLL_R	sll 	%r16, %r0, %r27
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_124:
	mov	0x8, %r14
	.word 0xfcdb8e80  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e58000  ! 2872: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e58000  ! 2873: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe5c000  ! 2879: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_125:
	mov	0x16, %r14
	.word 0xf8db8e80  ! 2884: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 25)
	.word 0xbc858000  ! 2886: ADDcc_R	addcc 	%r22, %r0, %r30
cpu_intr_0_226:
	setx	0x36022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_153:
	mov	0x33, %r14
	.word 0xf4f389e0  ! 2889: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_227:
	setx	0x360302, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_154:
	mov	0xc, %r14
	.word 0xfaf38400  ! 2893: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_155:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 2895: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe5e006  ! 2902: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_228:
	setx	0x340204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2904: SAVE_R	save	%r20, %r0, %r29
	.word 0xb80d60f4  ! 2907: AND_I	and 	%r21, 0x00f4, %r28
cpu_intr_0_229:
	setx	0x340329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2914: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_126:
	mov	0x22, %r14
	.word 0xf6db8e40  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc04e1e8  ! 2918: ADD_I	add 	%r19, 0x01e8, %r30
	.word 0xb5e48000  ! 2919: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_230:
	setx	0x350330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_231:
	setx	0x36020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e5e1cc  ! 2926: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_156:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 2931: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbbe54000  ! 2933: SAVE_R	save	%r21, %r0, %r29
	.word 0xb9e4c000  ! 2934: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_232:
	setx	0x350222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_233:
	setx	0x370322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_234:
	setx	0x340316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22ce02f  ! 2942: ANDN_I	andn 	%r19, 0x002f, %r25
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_235:
	setx	0x340138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 2945: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde4c000  ! 2946: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_127:
	mov	0x2a, %r14
	.word 0xfedb8400  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_236:
	setx	0x35010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a191  ! 2950: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 30)
	.word 0xbb2d7001  ! 2953: SLLX_I	sllx	%r21, 0x0001, %r29
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_237:
	setx	0x370330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2962: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_238:
	setx	0x370037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe50000  ! 2966: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, d)
	.word 0xb3e44000  ! 2972: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_157:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 2975: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 2976: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e50000  ! 2979: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e48000  ! 2980: SAVE_R	save	%r18, %r0, %r25
	.word 0xb72d0000  ! 2982: SLL_R	sll 	%r20, %r0, %r27
cpu_intr_0_239:
	setx	0x36012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03de156  ! 2986: XNOR_I	xnor 	%r23, 0x0156, %r24
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 36)
	.word 0xb3e4c000  ! 2988: SAVE_R	save	%r19, %r0, %r25
	.word 0xb5e4c000  ! 2990: SAVE_R	save	%r19, %r0, %r26
	.word 0xb804c000  ! 2996: ADD_R	add 	%r19, %r0, %r28
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 16)
	.word 0xb7e42036  ! 3006: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 17)
	.word 0xb52c9000  ! 3009: SLLX_R	sllx	%r18, %r0, %r26
	.word 0xbde58000  ! 3012: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_128:
	mov	0x1f, %r14
	.word 0xfedb8400  ! 3014: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb93d1000  ! 3015: SRAX_R	srax	%r20, %r0, %r28
	.word 0xbbe5c000  ! 3017: SAVE_R	save	%r23, %r0, %r29
	.word 0xb8c48000  ! 3020: ADDCcc_R	addccc 	%r18, %r0, %r28
T0_asi_reg_wr_158:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 3022: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_129:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbe858000  ! 3026: ADDcc_R	addcc 	%r22, %r0, %r31
T0_asi_reg_wr_159:
	mov	0x2b, %r14
	.word 0xfcf38400  ! 3027: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_240:
	setx	0x350203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3035: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7e54000  ! 3038: SAVE_R	save	%r21, %r0, %r27
	.word 0xbde40000  ! 3039: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_130:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbfe40000  ! 3048: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_241:
	setx	0x35033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_242:
	setx	0x350223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb224a160  ! 3052: SUB_I	sub 	%r18, 0x0160, %r25
T0_asi_reg_wr_160:
	mov	0x2f, %r14
	.word 0xf0f389e0  ! 3058: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_243:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_244:
	setx	0x36002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3062: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e50000  ! 3063: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e46010  ! 3065: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe46183  ! 3068: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_131:
	mov	0x8, %r14
	.word 0xf2db84a0  ! 3069: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7e56195  ! 3070: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_161:
	mov	0x2b, %r14
	.word 0xfaf38e60  ! 3073: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe5c000  ! 3078: SAVE_R	save	%r23, %r0, %r31
	.word 0xbbe5e1c6  ! 3079: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e50000  ! 3081: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_245:
	setx	0x370213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 3083: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_162:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 3084: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbb3c0000  ! 3085: SRA_R	sra 	%r16, %r0, %r29
	.word 0xbab44000  ! 3086: ORNcc_R	orncc 	%r17, %r0, %r29
T0_asi_reg_rd_132:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3090: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbe4c000  ! 3093: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_133:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbd3dc000  ! 3099: SRA_R	sra 	%r23, %r0, %r30
	.word 0xb7e54000  ! 3100: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_134:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 3101: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbde4e19e  ! 3102: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_135:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb52c1000  ! 3111: SLLX_R	sllx	%r16, %r0, %r26
	.word 0xbde4200a  ! 3112: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_246:
	setx	0x370307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_247:
	setx	0x340018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_163:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 3117: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_164:
	mov	0x17, %r14
	.word 0xf0f38400  ! 3122: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1e42144  ! 3126: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4607e  ! 3127: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_248:
	setx	0x36021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc84612d  ! 3129: ADDcc_I	addcc 	%r17, 0x012d, %r30
cpu_intr_0_249:
	setx	0x350131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1e4c000  ! 3134: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe44000  ! 3135: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e44000  ! 3137: SAVE_R	save	%r17, %r0, %r24
	.word 0xb8b5c000  ! 3139: ORNcc_R	orncc 	%r23, %r0, %r28
cpu_intr_0_250:
	setx	0x340120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52147  ! 3141: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_251:
	setx	0x340314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0dd  ! 3144: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_136:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3148: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_252:
	setx	0x360115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 3152: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e5a108  ! 3153: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_253:
	setx	0x370337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3155: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e52156  ! 3156: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe4e029  ! 3159: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb2d8000  ! 3162: SLL_R	sll 	%r22, %r0, %r29
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_254:
	setx	0x370009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a01b  ! 3169: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e5c000  ! 3173: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_138:
	mov	0x9, %r14
	.word 0xf2db89e0  ! 3174: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde46090  ! 3175: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4e0fe  ! 3176: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb20de039  ! 3179: AND_I	and 	%r23, 0x0039, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5e122  ! 3183: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_139:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3e4c000  ! 3194: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e560a1  ! 3196: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_140:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 3199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_165:
	mov	0x2, %r14
	.word 0xf0f38e60  ! 3200: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbe35c000  ! 3201: SUBC_R	orn 	%r23, %r0, %r31
cpu_intr_0_255:
	setx	0x39003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e48000  ! 3211: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_166:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 3212: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe56160  ! 3213: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde40000  ! 3214: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe4a187  ! 3216: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_167:
	mov	0x37, %r14
	.word 0xfaf384a0  ! 3229: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_wr_168:
	mov	0x1b, %r14
	.word 0xfef38400  ! 3231: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbe356152  ! 3235: SUBC_I	orn 	%r21, 0x0152, %r31
cpu_intr_0_256:
	setx	0x39031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2054000  ! 3237: ADD_R	add 	%r21, %r0, %r25
	.word 0xb7e5207b  ! 3241: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde40000  ! 3242: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde54000  ! 3243: SAVE_R	save	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_169:
	mov	0x17, %r14
	.word 0xfaf384a0  ! 3245: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9e40000  ! 3249: SAVE_R	save	%r16, %r0, %r28
	.word 0xba34a1c4  ! 3250: ORN_I	orn 	%r18, 0x01c4, %r29
T0_asi_reg_wr_170:
	mov	0x2, %r14
	.word 0xf4f384a0  ! 3252: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1643801  ! 3255: MOVcc_I	<illegal instruction>
	.word 0xb7e42175  ! 3257: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_171:
	mov	0x6, %r14
	.word 0xfcf38400  ! 3260: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, e)
	.word 0xbde50000  ! 3262: SAVE_R	save	%r20, %r0, %r30
	.word 0xbfe40000  ! 3264: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e48000  ! 3265: SAVE_R	save	%r18, %r0, %r26
	.word 0xb5e5c000  ! 3266: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e56118  ! 3269: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e54000  ! 3272: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e5c000  ! 3274: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e4c000  ! 3275: SAVE_R	save	%r19, %r0, %r28
	.word 0xbfe50000  ! 3277: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_257:
	setx	0x3b0321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_172:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3287: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_258:
	setx	0x3a012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e5e051  ! 3291: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_259:
	setx	0x390138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 3295: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e4c000  ! 3296: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde44000  ! 3303: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 34)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_141:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5e44000  ! 3312: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde5209a  ! 3316: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_260:
	setx	0x3b0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7344000  ! 3324: SRL_R	srl 	%r17, %r0, %r27
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb81421c4  ! 3328: OR_I	or 	%r16, 0x01c4, %r28
T0_asi_reg_wr_173:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 3330: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e5a1d9  ! 3331: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_261:
	setx	0x3b0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, d)
	.word 0xb6948000  ! 3342: ORcc_R	orcc 	%r18, %r0, %r27
	.word 0xbde50000  ! 3345: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_262:
	setx	0x3a022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e5a0e0  ! 3349: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5e14f  ! 3350: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4c000  ! 3351: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_142:
	mov	0x29, %r14
	.word 0xf6db8400  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1e5c000  ! 3358: SAVE_R	save	%r23, %r0, %r24
	.word 0xb77cc400  ! 3359: MOVR_R	movre	%r19, %r0, %r27
	.word 0xbbe5c000  ! 3361: SAVE_R	save	%r23, %r0, %r29
	.word 0xb7e40000  ! 3366: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_263:
	setx	0x3b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x3b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, a)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e461ab  ! 3375: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_174:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 3379: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_175:
	mov	0x1c, %r14
	.word 0xf4f38e80  ! 3380: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5e5e0ef  ! 3381: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e52011  ! 3384: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e48000  ! 3387: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_176:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 3388: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_177:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 3389: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbe58000  ! 3390: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e4a0d3  ! 3395: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4c000  ! 3397: SAVE_R	save	%r19, %r0, %r27
	.word 0xb08c203d  ! 3400: ANDcc_I	andcc 	%r16, 0x003d, %r24
	.word 0xb7e40000  ! 3404: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_265:
	setx	0x3b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3408: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, b)
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb134b001  ! 3414: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xb550c000  ! 3415: RDPR_TT	<illegal instruction>
cpu_intr_0_266:
	setx	0x3a0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e17f  ! 3419: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_143:
	mov	0x22, %r14
	.word 0xfedb84a0  ! 3421: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7e4a0c8  ! 3427: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbcad21fd  ! 3430: ANDNcc_I	andncc 	%r20, 0x01fd, %r30
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_178:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 3438: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e4e0ce  ! 3443: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe44000  ! 3446: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_144:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb61d606c  ! 3451: XOR_I	xor 	%r21, 0x006c, %r27
	.word 0xb7e4a054  ! 3453: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4e0ec  ! 3456: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e42057  ! 3459: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe4e1d3  ! 3463: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe4e028  ! 3464: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_179:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 3466: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_267:
	setx	0x3a0321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_180:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 3469: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 21)
	.word 0xb23d0000  ! 3473: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xb23ce0fd  ! 3474: XNOR_I	xnor 	%r19, 0x00fd, %r25
	.word 0xbde42131  ! 3475: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbabc209e  ! 3483: XNORcc_I	xnorcc 	%r16, 0x009e, %r29
cpu_intr_0_268:
	setx	0x39021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3488: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_269:
	setx	0x3a0318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_270:
	setx	0x390203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3492: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 3494: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_wr_182:
	mov	0x2a, %r14
	.word 0xfaf389e0  ! 3496: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde460ad  ! 3499: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e5200f  ! 3500: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_271:
	setx	0x390105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3502: SAVE_R	save	%r18, %r0, %r26
	.word 0xbe34e01b  ! 3503: SUBC_I	orn 	%r19, 0x001b, %r31
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_272:
	setx	0x3b001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3513: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5a0c6  ! 3516: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_273:
	setx	0x3b023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea50000  ! 3523: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0xb5e4a1cd  ! 3524: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 4)
	.word 0xb7504000  ! 3528: RDPR_TNPC	<illegal instruction>
	.word 0xbde50000  ! 3530: SAVE_R	save	%r20, %r0, %r30
	.word 0xbfe54000  ! 3532: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e54000  ! 3539: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_183:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 3541: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_184:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 3544: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb3e4e123  ! 3546: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_185:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 3547: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1e4e1d5  ! 3548: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e44000  ! 3549: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe58000  ! 3559: SAVE_R	save	%r22, %r0, %r31
	.word 0xb7e58000  ! 3560: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe5e1a6  ! 3564: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde40000  ! 3565: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_186:
	mov	0x19, %r14
	.word 0xf4f38e80  ! 3569: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfe40000  ! 3572: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e54000  ! 3573: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_187:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 3578: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_274:
	setx	0x3b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a15a  ! 3582: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_188:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 3583: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_189:
	mov	0x24, %r14
	.word 0xf6f38400  ! 3585: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3e58000  ! 3587: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_275:
	setx	0x39020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_276:
	setx	0x3a0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1d60a8  ! 3595: XOR_I	xor 	%r21, 0x00a8, %r30
cpu_intr_0_277:
	setx	0x390104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72dc000  ! 3597: SLL_R	sll 	%r23, %r0, %r27
T0_asi_reg_rd_145:
	mov	0x1c, %r14
	.word 0xf8db89e0  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_190:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 3599: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, f)
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_146:
	mov	0x1f, %r14
	.word 0xfcdb8e60  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbbe4617a  ! 3609: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_278:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_147:
	mov	0x21, %r14
	.word 0xf0db8400  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_148:
	mov	0x2f, %r14
	.word 0xfcdb8e80  ! 3616: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_191:
	mov	0x2e, %r14
	.word 0xf6f38400  ! 3618: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_149:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 3619: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe48000  ! 3620: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_150:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb9e54000  ! 3624: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde50000  ! 3626: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_192:
	mov	0x38, %r14
	.word 0xf8f38e60  ! 3627: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5e48000  ! 3628: SAVE_R	save	%r18, %r0, %r26
	.word 0xbb358000  ! 3636: SRL_R	srl 	%r22, %r0, %r29
T0_asi_reg_wr_193:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 3639: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_279:
	setx	0x3d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_194:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 3642: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbbe52190  ! 3644: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e5c000  ! 3648: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_195:
	mov	0x11, %r14
	.word 0xfef38400  ! 3651: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe5e074  ! 3652: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde421da  ! 3653: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_151:
	mov	0x23, %r14
	.word 0xfadb8e60  ! 3655: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfe5e0ad  ! 3657: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_196:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 3660: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e4e0da  ! 3668: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_152:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_153:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 3670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_280:
	setx	0x3c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635c000  ! 3677: ORN_R	orn 	%r23, %r0, %r27
	.word 0xb3e44000  ! 3679: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_281:
	setx	0x3d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 3686: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_197:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 3687: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_282:
	setx	0x3f032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_198:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 3699: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb57c0400  ! 3700: MOVR_R	movre	%r16, %r0, %r26
	.word 0xb1e5c000  ! 3702: SAVE_R	save	%r23, %r0, %r24
	.word 0xb6b4e011  ! 3704: SUBCcc_I	orncc 	%r19, 0x0011, %r27
	.word 0xbde4a1e9  ! 3708: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_199:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 3709: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_283:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 3711: SAVE_R	save	%r20, %r0, %r27
	.word 0xb29420e3  ! 3717: ORcc_I	orcc 	%r16, 0x00e3, %r25
	.word 0xbc34c000  ! 3718: SUBC_R	orn 	%r19, %r0, %r30
	.word 0xb3e4c000  ! 3719: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_284:
	setx	0x3d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_200:
	mov	0x1, %r14
	.word 0xf6f38e80  ! 3722: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_201:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 3723: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e58000  ! 3725: SAVE_R	save	%r22, %r0, %r24
	.word 0xbbe460f2  ! 3726: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe46159  ! 3727: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_202:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 3728: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_rd_154:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_285:
	setx	0x3d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_286:
	setx	0x3e0004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_287:
	setx	0x3f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_288:
	setx	0x3c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x34, %r14
	.word 0xf2db8400  ! 3748: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbde4e168  ! 3754: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_156:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbc8c6192  ! 3756: ANDcc_I	andcc 	%r17, 0x0192, %r30
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, e)
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_157:
	mov	0x30, %r14
	.word 0xf4db8e60  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_289:
	setx	0x3c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_203:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 3776: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb8350000  ! 3778: ORN_R	orn 	%r20, %r0, %r28
	.word 0xb3e40000  ! 3779: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_158:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e54000  ! 3784: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_290:
	setx	0x3c030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 3789: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_159:
	mov	0x37, %r14
	.word 0xf6db89e0  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e40000  ! 3794: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e5209d  ! 3798: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_204:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 3799: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_291:
	setx	0x3f0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_160:
	mov	0x2b, %r14
	.word 0xfedb8e80  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_161:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbbe50000  ! 3805: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e56128  ! 3808: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe46147  ! 3816: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_205:
	mov	0x8, %r14
	.word 0xf6f38e60  ! 3818: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3e50000  ! 3819: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe50000  ! 3820: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_162:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 3821: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_206:
	mov	0x2, %r14
	.word 0xfef384a0  ! 3822: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb6ada05a  ! 3823: ANDNcc_I	andncc 	%r22, 0x005a, %r27
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 20)
	.word 0xbde40000  ! 3826: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde50000  ! 3827: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde4204d  ! 3828: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_292:
	setx	0x3c031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534d000  ! 3832: SRLX_R	srlx	%r19, %r0, %r26
T0_asi_reg_wr_207:
	mov	0x17, %r14
	.word 0xfaf389e0  ! 3835: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_293:
	setx	0x3c0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_163:
	mov	0x14, %r14
	.word 0xf6db89e0  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 16)
	.word 0xbb3c7001  ! 3848: SRAX_I	srax	%r17, 0x0001, %r29
cpu_intr_0_294:
	setx	0x3f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 3856: SAVE_R	save	%r17, %r0, %r24
	.word 0xbbe5a083  ! 3859: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbb520000  ! 3860: RDPR_PIL	<illegal instruction>
	.word 0xb7e5e11e  ! 3866: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb3dc000  ! 3867: SRA_R	sra 	%r23, %r0, %r29
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_295:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_296:
	setx	0x3c0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 3877: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_297:
	setx	0x3d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 3886: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_298:
	setx	0x3e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_208:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 3888: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb7e4c000  ! 3890: SAVE_R	save	%r19, %r0, %r27
	.word 0xb1e5c000  ! 3891: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_299:
	setx	0x3d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2844000  ! 3896: ADDcc_R	addcc 	%r17, %r0, %r25
T0_asi_reg_wr_209:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 3899: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_210:
	mov	0x29, %r14
	.word 0xf4f38e80  ! 3901: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_300:
	setx	0x3d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_301:
	setx	0x3e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe50000  ! 3913: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe5c000  ! 3916: SAVE_R	save	%r23, %r0, %r31
	.word 0xb3e4602e  ! 3918: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_302:
	setx	0x3e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e54000  ! 3926: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e50000  ! 3929: SAVE_R	save	%r20, %r0, %r25
	.word 0xba2421c5  ! 3930: SUB_I	sub 	%r16, 0x01c5, %r29
	.word 0xb9e54000  ! 3931: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde40000  ! 3932: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_303:
	setx	0x3e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_304:
	setx	0x3f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_164:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 3939: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e5c000  ! 3941: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde54000  ! 3943: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e44000  ! 3949: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_305:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e58000  ! 3953: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, e)
	.word 0xba250000  ! 3955: SUB_R	sub 	%r20, %r0, %r29
cpu_intr_0_306:
	setx	0x3f0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3961: SAVE_R	save	%r21, %r0, %r31
	.word 0xb12d2001  ! 3962: SLL_I	sll 	%r20, 0x0001, %r24
cpu_intr_0_307:
	setx	0x3c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e011  ! 3967: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e58000  ! 3969: SAVE_R	save	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_308:
	setx	0x3f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_165:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1e52033  ! 3984: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e5e079  ! 3986: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_166:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 3989: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_211:
	mov	0x1f, %r14
	.word 0xfef38400  ! 3997: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_309:
	setx	0x3d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd60b3  ! 4003: XNORcc_I	xnorcc 	%r21, 0x00b3, %r25
T0_asi_reg_wr_212:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 4004: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_167:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_310:
	setx	0x3e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46020  ! 4015: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_168:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbc1ce0a9  ! 4017: XOR_I	xor 	%r19, 0x00a9, %r30
	.word 0xb3e48000  ! 4018: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 2b)
	.word 0xa1902000  ! 4022: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T0_asi_reg_rd_169:
	mov	0xb, %r14
	.word 0xf4db8e80  ! 4027: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e5c000  ! 4032: SAVE_R	save	%r23, %r0, %r24
	.word 0xb8b4612a  ! 4034: SUBCcc_I	orncc 	%r17, 0x012a, %r28
T0_asi_reg_wr_213:
	mov	0x5, %r14
	.word 0xfaf384a0  ! 4037: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_311:
	setx	0x3d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c461e1  ! 4040: ADDCcc_I	addccc 	%r17, 0x01e1, %r28
	.word 0xb81d6155  ! 4045: XOR_I	xor 	%r21, 0x0155, %r28
cpu_intr_0_312:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_313:
	setx	0x3d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_314:
	setx	0x3d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb084e1a5  ! 4053: ADDcc_I	addcc 	%r19, 0x01a5, %r24
	.word 0xbbe40000  ! 4055: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_315:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_316:
	setx	0x3f021f, %g1, %o0
	ta	T_SEND_THRD_INTR
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
T0_asi_reg_rd_170:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_317:
	setx	0x3e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, b)
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e561b2  ! 4075: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_214:
	mov	0x31, %r14
	.word 0xf2f38e60  ! 4078: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_171:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 4082: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_318:
	setx	0x3e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 4085: SAVE_R	save	%r19, %r0, %r26
	.word 0xb8944000  ! 4088: ORcc_R	orcc 	%r17, %r0, %r28
	.word 0xb4b58000  ! 4089: SUBCcc_R	orncc 	%r22, %r0, %r26
	.word 0xa1902002  ! 4090: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T0_asi_reg_rd_172:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 4091: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb8b421d0  ! 4092: ORNcc_I	orncc 	%r16, 0x01d0, %r28
cpu_intr_0_319:
	setx	0x43020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_215:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 4095: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_173:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5e420be  ! 4097: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_320:
	setx	0x410215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_321:
	setx	0x400017, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_216:
	mov	0x35, %r14
	.word 0xfef38e80  ! 4105: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbf3d7001  ! 4107: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xb7e421ef  ! 4112: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_174:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_322:
	setx	0x430120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde44000  ! 4125: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_217:
	mov	0x32, %r14
	.word 0xfef38e60  ! 4126: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_rd_175:
	mov	0x2d, %r14
	.word 0xf0db8e60  ! 4128: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_176:
	mov	0x1d, %r14
	.word 0xf2db89e0  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_rd_177:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5e5c000  ! 4135: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_178:
	mov	0x9, %r14
	.word 0xf2db8e60  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbde56193  ! 4140: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde48000  ! 4141: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_323:
	setx	0x420236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 4144: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_324:
	setx	0x42033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_218:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 4149: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbde421a1  ! 4151: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_325:
	setx	0x42022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe460de  ! 4158: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_326:
	setx	0x400020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e109  ! 4164: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4c000  ! 4170: SAVE_R	save	%r19, %r0, %r24
	.word 0xb02d8000  ! 4172: ANDN_R	andn 	%r22, %r0, %r24
T0_asi_reg_rd_179:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7e58000  ! 4176: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 2d)
	.word 0x8f902001  ! 4183: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T0_asi_reg_wr_219:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 4189: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_220:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 4195: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e4a177  ! 4199: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde54000  ! 4200: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde4e0d6  ! 4204: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_327:
	setx	0x41023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 4214: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 2f)
	.word 0x859421ae  ! 4226: WRPR_TSTATE_I	wrpr	%r16, 0x01ae, %tstate
	.word 0xb9e5c000  ! 4227: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_328:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 1)
	.word 0xb9e5a1e6  ! 4236: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e46039  ! 4242: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_221:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 4249: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb494e0ca  ! 4250: ORcc_I	orcc 	%r19, 0x00ca, %r26
cpu_intr_0_329:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_330:
	setx	0x400107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02c61c0  ! 4257: ANDN_I	andn 	%r17, 0x01c0, %r24
	.word 0xb3e48000  ! 4258: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_331:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bda1a8  ! 4263: XNORcc_I	xnorcc 	%r22, 0x01a8, %r25
	.word 0xba458000  ! 4265: ADDC_R	addc 	%r22, %r0, %r29
T0_asi_reg_wr_222:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4266: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 14)
	.word 0xb5e44000  ! 4269: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_332:
	setx	0x430004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5213a  ! 4272: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_180:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde40000  ! 4284: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_333:
	setx	0x430206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_181:
	mov	0x29, %r14
	.word 0xfedb89e0  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb0a420b8  ! 4291: SUBcc_I	subcc 	%r16, 0x00b8, %r24
T0_asi_reg_rd_182:
	mov	0x5, %r14
	.word 0xfadb8e60  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3e42107  ! 4293: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_334:
	setx	0x420111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_335:
	setx	0x400235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 4297: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e421e2  ! 4298: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_183:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_184:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4300: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 19)
	.word 0xbc058000  ! 4306: ADD_R	add 	%r22, %r0, %r30
	.word 0xb3e40000  ! 4307: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e4c000  ! 4308: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe4211d  ! 4309: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_336:
	setx	0x42011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bd2157  ! 4318: XNORcc_I	xnorcc 	%r20, 0x0157, %r26
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3e58000  ! 4323: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_337:
	setx	0x400319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 4326: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e40000  ! 4327: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe46002  ! 4329: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e561ae  ! 4333: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5c000  ! 4334: SAVE_R	save	%r23, %r0, %r27
	.word 0xbc0cc000  ! 4338: AND_R	and 	%r19, %r0, %r30
cpu_intr_0_338:
	setx	0x410135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 4342: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e54000  ! 4351: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e4a0a5  ! 4352: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_339:
	setx	0x43000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a049  ! 4358: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4a0e4  ! 4362: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde48000  ! 4363: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_340:
	setx	0x410000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_185:
	mov	0x26, %r14
	.word 0xfcdb8e40  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_186:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4369: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9e58000  ! 4374: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e4214a  ! 4377: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_187:
	mov	0x36, %r14
	.word 0xf2db89e0  ! 4378: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e54000  ! 4382: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe58000  ! 4386: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_223:
	mov	0x7, %r14
	.word 0xf4f38e40  ! 4388: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e40000  ! 4389: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_341:
	setx	0x40013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57ce401  ! 4393: MOVR_I	movre	%r19, 0x1, %r26
T0_asi_reg_rd_188:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_189:
	mov	0x34, %r14
	.word 0xfcdb8400  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb3e520eb  ! 4402: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e5c000  ! 4403: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb17d0400  ! 4405: MOVR_R	movre	%r20, %r0, %r24
T0_asi_reg_rd_190:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_191:
	mov	0x5, %r14
	.word 0xfedb8400  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfe521fd  ! 4408: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_192:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e58000  ! 4413: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_wr_224:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 4416: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe4e0bb  ! 4417: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_225:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 4420: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_wr_226:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 4425: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_227:
	mov	0x1, %r14
	.word 0xfef384a0  ! 4432: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_wr_228:
	mov	0x34, %r14
	.word 0xf2f389e0  ! 4433: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb150c000  ! 4434: RDPR_TT	<illegal instruction>
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_342:
	setx	0x420023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_343:
	setx	0x430208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e5a184  ! 4441: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_344:
	setx	0x40023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_345:
	setx	0x410133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_229:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 4448: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb41dc000  ! 4449: XOR_R	xor 	%r23, %r0, %r26
	.word 0xb7e40000  ! 4450: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_193:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_194:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e48000  ! 4460: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e50000  ! 4467: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e5e06b  ! 4470: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_346:
	setx	0x420129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49da035  ! 4474: XORcc_I	xorcc 	%r22, 0x0035, %r26
	.word 0xbfe4e1ba  ! 4476: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbcac21f9  ! 4479: ANDNcc_I	andncc 	%r16, 0x01f9, %r30
	.word 0xb1e4c000  ! 4481: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, a)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_347:
	setx	0x430025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ac617d  ! 4493: ANDNcc_I	andncc 	%r17, 0x017d, %r24
T0_asi_reg_wr_230:
	mov	0x21, %r14
	.word 0xfaf38400  ! 4494: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbe48000  ! 4496: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e5c000  ! 4497: SAVE_R	save	%r23, %r0, %r24
	.word 0xb7e48000  ! 4498: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_348:
	setx	0x43022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc4c000  ! 4501: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xbb342001  ! 4502: SRL_I	srl 	%r16, 0x0001, %r29
T0_asi_reg_wr_231:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 4503: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, b)
	.word 0xb9e521ea  ! 4507: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbe2d4000  ! 4510: ANDN_R	andn 	%r21, %r0, %r31
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde5e1b1  ! 4518: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde44000  ! 4519: SAVE_R	save	%r17, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e42018  ! 4523: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_349:
	setx	0x420203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x430003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994a002  ! 4528: WRPR_TICK_I	wrpr	%r18, 0x0002, %tick
cpu_intr_0_351:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_352:
	setx	0x42003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_232:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 4535: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_233:
	mov	0x9, %r14
	.word 0xf6f38400  ! 4537: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_234:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4547: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbbe44000  ! 4548: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe50000  ! 4549: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_353:
	setx	0x46022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_354:
	setx	0x460107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_235:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 4566: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe48000  ! 4569: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_355:
	setx	0x460202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_356:
	setx	0x450210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_357:
	setx	0x44001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5211f  ! 4583: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb2b4219b  ! 4586: SUBCcc_I	orncc 	%r16, 0x019b, %r25
	.word 0xb81420a9  ! 4587: OR_I	or 	%r16, 0x00a9, %r28
	.word 0xb1e5c000  ! 4588: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_195:
	mov	0x15, %r14
	.word 0xf6db84a0  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde48000  ! 4598: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_358:
	setx	0x450203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4e08c  ! 4609: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e44000  ! 4611: SAVE_R	save	%r17, %r0, %r25
	.word 0xb9e4e1c8  ! 4612: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_236:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 4615: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbfe4a104  ! 4619: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_359:
	setx	0x44000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_360:
	setx	0x440120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_361:
	setx	0x440107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb495609f  ! 4626: ORcc_I	orcc 	%r21, 0x009f, %r26
cpu_intr_0_362:
	setx	0x44003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde4c000  ! 4630: SAVE_R	save	%r19, %r0, %r30
	.word 0xb1e4c000  ! 4634: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_237:
	mov	0xc, %r14
	.word 0xfaf38400  ! 4635: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_196:
	mov	0x7, %r14
	.word 0xfadb8e60  ! 4637: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_wr_238:
	mov	0x1, %r14
	.word 0xfcf389e0  ! 4638: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_363:
	setx	0x450103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 4641: SAVE_R	save	%r22, %r0, %r31
	.word 0xb83c602a  ! 4643: XNOR_I	xnor 	%r17, 0x002a, %r28
	.word 0xbbe4e1cd  ! 4646: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_239:
	mov	0x19, %r14
	.word 0xfef38e40  ! 4652: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 4658: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5e4a09f  ! 4660: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_198:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_364:
	setx	0x47010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_199:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_365:
	setx	0x44030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_366:
	setx	0x470124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_367:
	setx	0x450300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_368:
	setx	0x46013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_240:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 4688: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbca4a074  ! 4689: SUBcc_I	subcc 	%r18, 0x0074, %r30
cpu_intr_0_369:
	setx	0x440110, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_200:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbe8ce106  ! 4699: ANDcc_I	andcc 	%r19, 0x0106, %r31
	.word 0xb635a175  ! 4701: ORN_I	orn 	%r22, 0x0175, %r27
	.word 0xbde58000  ! 4702: SAVE_R	save	%r22, %r0, %r30
	.word 0xb5e4e1c0  ! 4703: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e40000  ! 4706: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 39)
	.word 0xbfe5c000  ! 4711: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_201:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 4714: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_370:
	setx	0x47010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe5a074  ! 4725: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe4a1fa  ! 4726: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_241:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 4729: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5e58000  ! 4730: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe5a0e4  ! 4731: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e54000  ! 4732: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_202:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4733: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_203:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_204:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3504000  ! 4741: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5e081  ! 4743: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_371:
	setx	0x44000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_372:
	setx	0x450135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_242:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 4748: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5e460a1  ! 4753: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_373:
	setx	0x45031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe420b2  ! 4758: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb62da1ca  ! 4759: ANDN_I	andn 	%r22, 0x01ca, %r27
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e54000  ! 4761: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_243:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 4762: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_244:
	mov	0x35, %r14
	.word 0xf4f38e40  ! 4763: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe5c000  ! 4764: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_374:
	setx	0x450219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1e54000  ! 4767: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e40000  ! 4772: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_245:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 4777: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_205:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_375:
	setx	0x470037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 4786: SAVE_R	save	%r20, %r0, %r25
	.word 0xb2ac6138  ! 4788: ANDNcc_I	andncc 	%r17, 0x0138, %r25
T0_asi_reg_rd_206:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 4789: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_376:
	setx	0x46021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_377:
	setx	0x44020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e521ae  ! 4796: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb13cb001  ! 4802: SRAX_I	srax	%r18, 0x0001, %r24
	.word 0xb5e5c000  ! 4803: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_246:
	mov	0x11, %r14
	.word 0xf2f38e60  ! 4806: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbbe5607f  ! 4808: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_247:
	mov	0x2, %r14
	.word 0xf2f38e60  ! 4809: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbbe48000  ! 4811: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9e42011  ! 4812: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_378:
	setx	0x450307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e40000  ! 4816: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_379:
	setx	0x450237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_380:
	setx	0x45033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 4823: SAVE_R	save	%r23, %r0, %r29
	.word 0xb2252131  ! 4826: SUB_I	sub 	%r20, 0x0131, %r25
	.word 0xb6258000  ! 4828: SUB_R	sub 	%r22, %r0, %r27
T0_asi_reg_rd_207:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde58000  ! 4830: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_381:
	setx	0x45033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_248:
	mov	0x24, %r14
	.word 0xfef38e40  ! 4833: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_rd_208:
	mov	0x31, %r14
	.word 0xfadb89e0  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xba158000  ! 4839: OR_R	or 	%r22, %r0, %r29
T0_asi_reg_rd_209:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9e4a086  ! 4842: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_249:
	mov	0x16, %r14
	.word 0xfef38e60  ! 4843: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_rd_210:
	mov	0x7, %r14
	.word 0xfcdb84a0  ! 4844: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb3e4618d  ! 4845: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_382:
	setx	0x440224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 4849: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7e421a4  ! 4850: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e40000  ! 4853: SAVE_R	save	%r16, %r0, %r24
	.word 0xb48c4000  ! 4856: ANDcc_R	andcc 	%r17, %r0, %r26
cpu_intr_0_383:
	setx	0x450322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 4859: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_211:
	mov	0x25, %r14
	.word 0xf8db89e0  ! 4861: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbde4e023  ! 4864: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_384:
	setx	0x460130, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_212:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 4867: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_385:
	setx	0x440012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_250:
	mov	0x2a, %r14
	.word 0xfef389e0  ! 4877: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e54000  ! 4880: SAVE_R	save	%r21, %r0, %r24
	.word 0xbe1d4000  ! 4881: XOR_R	xor 	%r21, %r0, %r31
T0_asi_reg_rd_213:
	mov	0x5, %r14
	.word 0xf6db8e40  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e4a099  ! 4883: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_251:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 4885: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbde54000  ! 4888: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_252:
	mov	0x23, %r14
	.word 0xfef38e80  ! 4889: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_386:
	setx	0x440233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4896: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_214:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_387:
	setx	0x45023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_215:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 4907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e520af  ! 4908: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e50000  ! 4910: SAVE_R	save	%r20, %r0, %r28
	.word 0xb5520000  ! 4911: RDPR_PIL	<illegal instruction>
	.word 0xbde40000  ! 4912: SAVE_R	save	%r16, %r0, %r30
	.word 0xb5e4a107  ! 4913: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e560bd  ! 4914: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5e011  ! 4917: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_253:
	mov	0x8, %r14
	.word 0xf2f38e40  ! 4923: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_388:
	setx	0x460220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d8000  ! 4927: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb7e521bf  ! 4928: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_389:
	setx	0x46033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 4934: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e58000  ! 4938: SAVE_R	save	%r22, %r0, %r24
	.word 0xb9e4c000  ! 4940: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_254:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 4941: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbd3c3001  ! 4942: SRAX_I	srax	%r16, 0x0001, %r30
T0_asi_reg_rd_216:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 4943: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_390:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4948: SAVE_R	save	%r22, %r0, %r30
	.word 0xb5e56079  ! 4951: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_391:
	setx	0x440033, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_255:
	mov	0xa, %r14
	.word 0xf4f384a0  ! 4956: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0x8195a0d6  ! 4957: WRPR_TPC_I	wrpr	%r22, 0x00d6, %tpc
	.word 0xbfe46176  ! 4959: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbd3c2001  ! 4963: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xb7e5e1ff  ! 4964: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5540000  ! 4965: RDPR_GL	<illegal instruction>
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe46161  ! 4968: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_256:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 4969: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_392:
	setx	0x440123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe94c000  ! 4975: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xb5e40000  ! 4976: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_217:
	mov	0x1, %r14
	.word 0xf0db89e0  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb884c000  ! 4981: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xb1e5e04d  ! 4983: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_393:
	setx	0x450122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5616b  ! 4986: SAVE_I	save	%r21, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e56065  ! 4992: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbc95a140  ! 4994: ORcc_I	orcc 	%r22, 0x0140, %r30
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
	setx	0x190318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_1:
	setx	0x1b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_0:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 10: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_TO_TL0
	.word 0xf4ac613b  ! 14: STBA_I	stba	%r26, [%r17 + 0x013b] %asi
	.word 0xbb3ca001  ! 16: SRA_I	sra 	%r18, 0x0001, %r29
T3_asi_reg_rd_0:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, c)
	.word 0xf0a44020  ! 23: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xfc2da142  ! 24: STB_I	stb	%r30, [%r22 + 0x0142]
	.word 0xb4a48000  ! 26: SUBcc_R	subcc 	%r18, %r0, %r26
T3_asi_reg_rd_1:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 30: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb83561be  ! 33: SUBC_I	orn 	%r21, 0x01be, %r28
	.word 0xf275219e  ! 34: STX_I	stx	%r25, [%r20 + 0x019e]
	.word 0xf23561aa  ! 37: STH_I	sth	%r25, [%r21 + 0x01aa]
	.word 0xf2acc020  ! 39: STBA_R	stba	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_1:
	mov	0x15, %r14
	.word 0xfcf38e40  ! 43: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_2:
	setx	0x1d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_2:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 46: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbf35c000  ! 49: SRL_R	srl 	%r23, %r0, %r31
cpu_intr_3_3:
	setx	0x1d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_3:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 55: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_4:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 58: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_5:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 62: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 8)
	.word 0xf4f521bc  ! 67: STXA_I	stxa	%r26, [%r20 + 0x01bc] %asi
	.word 0xb684c000  ! 69: ADDcc_R	addcc 	%r19, %r0, %r27
cpu_intr_3_4:
	setx	0x1d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_5:
	setx	0x1d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a48020  ! 80: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_6:
	setx	0x1d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb342001  ! 83: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xf024e1e6  ! 86: STW_I	stw	%r24, [%r19 + 0x01e6]
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_6:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 88: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_7:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 94: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198381a  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
T3_asi_reg_wr_8:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 98: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0748000  ! 99: STX_R	stx	%r24, [%r18 + %r0]
T3_asi_reg_wr_9:
	mov	0x20, %r14
	.word 0xf0f384a0  ! 102: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfea4e0b2  ! 105: STWA_I	stwa	%r31, [%r19 + 0x00b2] %asi
cpu_intr_3_7:
	setx	0x1d0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c4000  ! 107: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xf0244000  ! 109: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf0adc020  ! 112: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xb8a560bf  ! 113: SUBcc_I	subcc 	%r21, 0x00bf, %r28
	.word 0xb23da0d6  ! 115: XNOR_I	xnor 	%r22, 0x00d6, %r25
T3_asi_reg_rd_2:
	mov	0x5, %r14
	.word 0xfcdb89e0  ! 116: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfcb4e04a  ! 123: STHA_I	stha	%r30, [%r19 + 0x004a] %asi
	.word 0xfca50020  ! 124: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb62cc000  ! 130: ANDN_R	andn 	%r19, %r0, %r27
T3_asi_reg_wr_10:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 131: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf2a5e0f9  ! 132: STWA_I	stwa	%r25, [%r23 + 0x00f9] %asi
T3_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d50  ! 134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_4:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf0340000  ! 140: STH_R	sth	%r24, [%r16 + %r0]
cpu_intr_3_8:
	setx	0x1c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_5:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_9:
	setx	0x1f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3560b3  ! 147: STH_I	sth	%r31, [%r21 + 0x00b3]
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_10:
	setx	0x1d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac20b1  ! 150: STBA_I	stba	%r29, [%r16 + 0x00b1] %asi
T3_asi_reg_wr_11:
	mov	0x17, %r14
	.word 0xf4f389e0  ! 151: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf235619e  ! 152: STH_I	sth	%r25, [%r21 + 0x019e]
cpu_intr_3_11:
	setx	0x1f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 22)
	.word 0xfc240000  ! 158: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_12:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 164: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf02c0000  ! 165: STB_R	stb	%r24, [%r16 + %r0]
T3_asi_reg_wr_12:
	mov	0x7, %r14
	.word 0xf6f389e0  ! 167: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfa24a119  ! 170: STW_I	stw	%r29, [%r18 + 0x0119]
T3_asi_reg_rd_6:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 172: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_13:
	setx	0x1d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_14:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_13:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 186: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfc75c000  ! 189: STX_R	stx	%r30, [%r23 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_15:
	setx	0x1c0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, a)
	.word 0xbc04c000  ! 197: ADD_R	add 	%r19, %r0, %r30
cpu_intr_3_16:
	setx	0x1f0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_17:
	setx	0x1e0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_14:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 207: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_18:
	setx	0x1e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2de136  ! 213: STB_I	stb	%r29, [%r23 + 0x0136]
	.word 0xf0f4205e  ! 214: STXA_I	stxa	%r24, [%r16 + 0x005e] %asi
	.word 0xf6f5e09d  ! 216: STXA_I	stxa	%r27, [%r23 + 0x009d] %asi
T3_asi_reg_rd_7:
	mov	0x27, %r14
	.word 0xfedb8e80  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf2358000  ! 219: STH_R	sth	%r25, [%r22 + %r0]
cpu_intr_3_19:
	setx	0x1e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_15:
	mov	0x3, %r14
	.word 0xf6f389e0  ! 222: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfab46110  ! 223: STHA_I	stha	%r29, [%r17 + 0x0110] %asi
T3_asi_reg_wr_16:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 225: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb54020  ! 227: STHA_R	stha	%r31, [%r21 + %r0] 0x01
	.word 0xf02d20c1  ! 228: STB_I	stb	%r24, [%r20 + 0x00c1]
	.word 0xf4adc020  ! 230: STBA_R	stba	%r26, [%r23 + %r0] 0x01
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 18)
	.word 0xf4b521be  ! 232: STHA_I	stha	%r26, [%r20 + 0x01be] %asi
cpu_intr_3_20:
	setx	0x1f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_8:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 25)
	.word 0x91942044  ! 253: WRPR_PIL_I	wrpr	%r16, 0x0044, %pil
	.word 0xf834a05a  ! 254: STH_I	sth	%r28, [%r18 + 0x005a]
T3_asi_reg_rd_9:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_17:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 256: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4754000  ! 257: STX_R	stx	%r26, [%r21 + %r0]
T3_asi_reg_rd_10:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 258: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf235c000  ! 260: STH_R	sth	%r25, [%r23 + %r0]
T3_asi_reg_wr_18:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 264: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_19:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 270: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_21:
	setx	0x1c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f56156  ! 274: STXA_I	stxa	%r26, [%r21 + 0x0156] %asi
	.word 0xf8f4e1c7  ! 275: STXA_I	stxa	%r28, [%r19 + 0x01c7] %asi
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_11:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 277: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_20:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 281: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 2b)
	.word 0xbd641800  ! 284: MOVcc_R	<illegal instruction>
cpu_intr_3_22:
	setx	0x1c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_12:
	mov	0x12, %r14
	.word 0xf4db84a0  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_13:
	mov	0x20, %r14
	.word 0xf6db8400  ! 289: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbe25a08b  ! 291: SUB_I	sub 	%r22, 0x008b, %r31
cpu_intr_3_23:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d0000  ! 293: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf2a44020  ! 294: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
cpu_intr_3_24:
	setx	0x1c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a40020  ! 300: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xbd359000  ! 302: SRLX_R	srlx	%r22, %r0, %r30
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_14:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_21:
	mov	0x7, %r14
	.word 0xf8f384a0  ! 305: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf8750000  ! 307: STX_R	stx	%r28, [%r20 + %r0]
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfa2cc000  ! 314: STB_R	stb	%r29, [%r19 + %r0]
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b08  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b08, %hpstate
cpu_intr_3_25:
	setx	0x1d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_26:
	setx	0x1c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_27:
	setx	0x1f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_28:
	setx	0x1e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac8020  ! 340: STBA_R	stba	%r26, [%r18 + %r0] 0x01
cpu_intr_3_29:
	setx	0x1c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_22:
	mov	0x34, %r14
	.word 0xfcf389e0  ! 343: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_30:
	setx	0x1d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40560ab  ! 346: ADD_I	add 	%r21, 0x00ab, %r26
	.word 0xf835c000  ! 347: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfcac20df  ! 350: STBA_I	stba	%r30, [%r16 + 0x00df] %asi
cpu_intr_3_31:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 4)
	.word 0xf0754000  ! 360: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xbe85218f  ! 361: ADDcc_I	addcc 	%r20, 0x018f, %r31
cpu_intr_3_32:
	setx	0x1c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad6088  ! 367: STBA_I	stba	%r30, [%r21 + 0x0088] %asi
	.word 0xfc748000  ! 370: STX_R	stx	%r30, [%r18 + %r0]
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_33:
	setx	0x1f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb81d8000  ! 377: XOR_R	xor 	%r22, %r0, %r28
cpu_intr_3_34:
	setx	0x1f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_35:
	setx	0x1f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_36:
	setx	0x1d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc354000  ! 389: STH_R	sth	%r30, [%r21 + %r0]
T3_asi_reg_wr_23:
	mov	0xe, %r14
	.word 0xfef38e60  ! 390: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_37:
	setx	0x1e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2cc000  ! 394: STB_R	stb	%r31, [%r19 + %r0]
T3_asi_reg_wr_24:
	mov	0x1a, %r14
	.word 0xf8f38e60  ! 396: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf635c000  ! 397: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfea4c020  ! 401: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_38:
	setx	0x1e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 7)
	.word 0xf075e085  ! 406: STX_I	stx	%r24, [%r23 + 0x0085]
cpu_intr_3_39:
	setx	0x20133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_15:
	mov	0x33, %r14
	.word 0xfadb84a0  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfcf5a071  ! 419: STXA_I	stxa	%r30, [%r22 + 0x0071] %asi
	.word 0xbe2d8000  ! 421: ANDN_R	andn 	%r22, %r0, %r31
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
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_NONHPRIV
	.word 0xb035e06b  ! 431: ORN_I	orn 	%r23, 0x006b, %r24
T3_asi_reg_rd_16:
	mov	0x8, %r14
	.word 0xf8db84a0  ! 433: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_25:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 436: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_17:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 440: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb6bc4000  ! 441: XNORcc_R	xnorcc 	%r17, %r0, %r27
	.word 0xf2758000  ! 445: STX_R	stx	%r25, [%r22 + %r0]
T3_asi_reg_rd_18:
	mov	0x30, %r14
	.word 0xfcdb8e80  ! 446: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_19:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
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
	.word 0xfe2d4000  ! 453: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf0b44020  ! 454: STHA_R	stha	%r24, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbead4000  ! 456: ANDNcc_R	andncc 	%r21, %r0, %r31
	.word 0xbc9c4000  ! 461: XORcc_R	xorcc 	%r17, %r0, %r30
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_26:
	mov	0x25, %r14
	.word 0xf6f38e60  ! 464: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_27:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 466: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf2a4608b  ! 467: STWA_I	stwa	%r25, [%r17 + 0x008b] %asi
	.word 0xb6b4c000  ! 469: ORNcc_R	orncc 	%r19, %r0, %r27
	.word 0xfc25206b  ! 470: STW_I	stw	%r30, [%r20 + 0x006b]
	.word 0xfea520e8  ! 472: STWA_I	stwa	%r31, [%r20 + 0x00e8] %asi
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_20:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfef5e0f6  ! 478: STXA_I	stxa	%r31, [%r23 + 0x00f6] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_40:
	setx	0x230121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 482: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbcb4e0cf  ! 483: SUBCcc_I	orncc 	%r19, 0x00cf, %r30
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_41:
	setx	0x210022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83460eb  ! 486: STH_I	sth	%r28, [%r17 + 0x00eb]
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_42:
	setx	0x22011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 492: STX_R	stx	%r29, [%r20 + %r0]
cpu_intr_3_43:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8344000  ! 496: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf0a54020  ! 499: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	.word 0xb435e005  ! 502: ORN_I	orn 	%r23, 0x0005, %r26
cpu_intr_3_44:
	setx	0x230121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3ca001  ! 504: SRA_I	sra 	%r18, 0x0001, %r29
T3_asi_reg_rd_21:
	mov	0x22, %r14
	.word 0xfadb84a0  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_22:
	mov	0x37, %r14
	.word 0xfcdb89e0  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_45:
	setx	0x210125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5e11a  ! 512: STHA_I	stha	%r27, [%r23 + 0x011a] %asi
T3_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 513: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_30:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 514: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc24e06f  ! 517: STW_I	stw	%r30, [%r19 + 0x006f]
T3_asi_reg_wr_31:
	mov	0xa, %r14
	.word 0xf4f384a0  ! 518: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf6740000  ! 522: STX_R	stx	%r27, [%r16 + %r0]
cpu_intr_3_46:
	setx	0x210332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0a48020  ! 527: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf0a58020  ! 528: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b5a  ! 536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5a, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b4a04c  ! 539: STHA_I	stha	%r26, [%r18 + 0x004c] %asi
	.word 0xbc1da062  ! 541: XOR_I	xor 	%r22, 0x0062, %r30
T3_asi_reg_rd_23:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_32:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 546: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2ad2051  ! 549: STBA_I	stba	%r25, [%r20 + 0x0051] %asi
cpu_intr_3_47:
	setx	0x210030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 553: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf8ad0020  ! 554: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_24:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_33:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 557: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf2750000  ! 562: STX_R	stx	%r25, [%r20 + %r0]
T3_asi_reg_wr_34:
	mov	0x33, %r14
	.word 0xf0f38400  ! 563: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfead218b  ! 564: STBA_I	stba	%r31, [%r20 + 0x018b] %asi
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_48:
	setx	0x220330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab40020  ! 568: STHA_R	stha	%r29, [%r16 + %r0] 0x01
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 26)
	.word 0xf4350000  ! 572: STH_R	sth	%r26, [%r20 + %r0]
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6b5e06f  ! 576: STHA_I	stha	%r27, [%r23 + 0x006f] %asi
T3_asi_reg_rd_25:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_26:
	mov	0xd, %r14
	.word 0xfedb8400  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6ade1bd  ! 588: STBA_I	stba	%r27, [%r23 + 0x01bd] %asi
	.word 0xf4a420be  ! 589: STWA_I	stwa	%r26, [%r16 + 0x00be] %asi
cpu_intr_3_49:
	setx	0x23012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 9)
	.word 0xf0b48020  ! 594: STHA_R	stha	%r24, [%r18 + %r0] 0x01
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_27:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, c)
	.word 0xfe244000  ! 604: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xb3643801  ! 605: MOVcc_I	<illegal instruction>
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_50:
	setx	0x200102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275a05e  ! 608: STX_I	stx	%r25, [%r22 + 0x005e]
T3_asi_reg_rd_28:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 609: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_35:
	mov	0x11, %r14
	.word 0xfef38e40  ! 610: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 2a)
	.word 0xbd3db001  ! 613: SRAX_I	srax	%r22, 0x0001, %r30
cpu_intr_3_51:
	setx	0x22011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2dc000  ! 618: STB_R	stb	%r30, [%r23 + %r0]
T3_asi_reg_wr_36:
	mov	0x24, %r14
	.word 0xf0f389e0  ! 619: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_29:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_30:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 628: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_52:
	setx	0x210136, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0x2, %r14
	.word 0xfef38e60  ! 631: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_31:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf2740000  ! 633: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xb224c000  ! 634: SUB_R	sub 	%r19, %r0, %r25
cpu_intr_3_53:
	setx	0x20002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c612e  ! 640: STB_I	stb	%r29, [%r17 + 0x012e]
cpu_intr_3_54:
	setx	0x220008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_38:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 643: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0b5a17a  ! 649: STHA_I	stha	%r24, [%r22 + 0x017a] %asi
	.word 0xfa75c000  ! 651: STX_R	stx	%r29, [%r23 + %r0]
T3_asi_reg_wr_39:
	mov	0x37, %r14
	.word 0xf6f389e0  ! 652: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_55:
	setx	0x200125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf8b40020  ! 662: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfc74a031  ! 663: STX_I	stx	%r30, [%r18 + 0x0031]
	.word 0xf0740000  ! 665: STX_R	stx	%r24, [%r16 + %r0]
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_56:
	setx	0x23030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_32:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_57:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_40:
	mov	0x14, %r14
	.word 0xf0f38e40  ! 677: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_58:
	setx	0x210106, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_41:
	mov	0x8, %r14
	.word 0xfaf38400  ! 681: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfca58020  ! 685: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfe254000  ! 691: STW_R	stw	%r31, [%r21 + %r0]
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_33:
	mov	0xf, %r14
	.word 0xfcdb89e0  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfc354000  ! 697: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfa2c6187  ! 700: STB_I	stb	%r29, [%r17 + 0x0187]
	.word 0xb43cc000  ! 703: XNOR_R	xnor 	%r19, %r0, %r26
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa74e031  ! 706: STX_I	stx	%r29, [%r19 + 0x0031]
cpu_intr_3_59:
	setx	0x23032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_34:
	mov	0x14, %r14
	.word 0xf6db8e40  ! 708: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_35:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf42ca1e9  ! 711: STB_I	stb	%r26, [%r18 + 0x01e9]
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_60:
	setx	0x210232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, f)
	.word 0xbc3ca0dc  ! 718: XNOR_I	xnor 	%r18, 0x00dc, %r30
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfe358000  ! 721: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf4ace0b1  ! 722: STBA_I	stba	%r26, [%r19 + 0x00b1] %asi
T3_asi_reg_rd_36:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 723: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfcac0020  ! 728: STBA_R	stba	%r30, [%r16 + %r0] 0x01
cpu_intr_3_61:
	setx	0x230038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62dc000  ! 731: STB_R	stb	%r27, [%r23 + %r0]
cpu_intr_3_62:
	setx	0x230124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8752049  ! 734: STX_I	stx	%r28, [%r20 + 0x0049]
cpu_intr_3_63:
	setx	0x230330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 739: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xfeac0020  ! 740: STBA_R	stba	%r31, [%r16 + %r0] 0x01
cpu_intr_3_64:
	setx	0x22022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_37:
	mov	0x3, %r14
	.word 0xfadb8e60  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_65:
	setx	0x220238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb205a098  ! 746: ADD_I	add 	%r22, 0x0098, %r25
	.word 0xfeb5c020  ! 749: STHA_R	stha	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_42:
	mov	0xd, %r14
	.word 0xf4f38e80  ! 750: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf62c0000  ! 753: STB_R	stb	%r27, [%r16 + %r0]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_66:
	setx	0x230102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 26)
	.word 0xb0b58000  ! 763: SUBCcc_R	orncc 	%r22, %r0, %r24
T3_asi_reg_wr_43:
	mov	0x11, %r14
	.word 0xfcf38e80  ! 766: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf62d2177  ! 767: STB_I	stb	%r27, [%r20 + 0x0177]
	.word 0xb8b4c000  ! 772: ORNcc_R	orncc 	%r19, %r0, %r28
	.word 0xb08cc000  ! 773: ANDcc_R	andcc 	%r19, %r0, %r24
cpu_intr_3_67:
	setx	0x200333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_44:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 779: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb77de401  ! 781: MOVR_I	movre	%r23, 0x1, %r27
T3_asi_reg_rd_38:
	mov	0xb, %r14
	.word 0xfedb8e40  ! 789: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc3520f8  ! 790: STH_I	sth	%r30, [%r20 + 0x00f8]
	.word 0xbb35f001  ! 792: SRLX_I	srlx	%r23, 0x0001, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_68:
	setx	0x200211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_39:
	mov	0x35, %r14
	.word 0xfcdb84a0  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_wr_45:
	mov	0x9, %r14
	.word 0xf0f38400  ! 801: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 7)
	.word 0xbf518000  ! 805: RDPR_PSTATE	rdpr	%pstate, %r31
cpu_intr_3_69:
	setx	0x210128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_40:
	mov	0x2b, %r14
	.word 0xf8db8e60  ! 810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xba05215d  ! 812: ADD_I	add 	%r20, 0x015d, %r29
	.word 0xfa24e108  ! 813: STW_I	stw	%r29, [%r19 + 0x0108]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_41:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_70:
	setx	0x20021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_46:
	mov	0x3, %r14
	.word 0xf4f38e80  ! 825: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfe2d60f5  ! 826: STB_I	stb	%r31, [%r21 + 0x00f5]
	.word 0xf035e149  ! 827: STH_I	sth	%r24, [%r23 + 0x0149]
	.word 0xfe2c8000  ! 828: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xb4a5a0fb  ! 830: SUBcc_I	subcc 	%r22, 0x00fb, %r26
T3_asi_reg_rd_42:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_43:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_71:
	setx	0x210316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034e090  ! 841: STH_I	sth	%r24, [%r19 + 0x0090]
	.word 0xf62d6103  ! 844: STB_I	stb	%r27, [%r21 + 0x0103]
T3_asi_reg_wr_47:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 845: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_48:
	mov	0x10, %r14
	.word 0xf4f38400  ! 847: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf82d6150  ! 848: STB_I	stb	%r28, [%r21 + 0x0150]
T3_asi_reg_rd_44:
	mov	0x1d, %r14
	.word 0xf2db8400  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_72:
	setx	0x22002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_73:
	setx	0x22032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425e10b  ! 858: STW_I	stw	%r26, [%r23 + 0x010b]
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_74:
	setx	0x210325, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02c6035  ! 867: STB_I	stb	%r24, [%r17 + 0x0035]
cpu_intr_3_75:
	setx	0x230304, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf4750000  ! 875: STX_R	stx	%r26, [%r20 + %r0]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 20)
	.word 0xf2ac60ed  ! 880: STBA_I	stba	%r25, [%r17 + 0x00ed] %asi
	.word 0xfe756046  ! 881: STX_I	stx	%r31, [%r21 + 0x0046]
	.word 0xfe35c000  ! 883: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf074e15c  ! 886: STX_I	stx	%r24, [%r19 + 0x015c]
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_HPRIV
	.word 0xfc2da095  ! 894: STB_I	stb	%r30, [%r22 + 0x0095]
	.word 0xf4254000  ! 895: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf42d0000  ! 897: STB_R	stb	%r26, [%r20 + %r0]
cpu_intr_3_76:
	setx	0x26032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_77:
	setx	0x260236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93d1000  ! 903: SRAX_R	srax	%r20, %r0, %r28
	.word 0xf62d4000  ! 905: STB_R	stb	%r27, [%r21 + %r0]
T3_asi_reg_wr_49:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 906: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf6b58020  ! 907: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xfab5e041  ! 908: STHA_I	stha	%r29, [%r23 + 0x0041] %asi
	.word 0xf0758000  ! 912: STX_R	stx	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfa2d8000  ! 921: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xba95e173  ! 922: ORcc_I	orcc 	%r23, 0x0173, %r29
cpu_intr_3_78:
	setx	0x240022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d610b  ! 927: STB_I	stb	%r29, [%r21 + 0x010b]
	.word 0xf2a5c020  ! 928: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xfa348000  ! 930: STH_R	sth	%r29, [%r18 + %r0]
T3_asi_reg_wr_50:
	mov	0x9, %r14
	.word 0xfcf38400  ! 932: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_wr_51:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 933: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_79:
	setx	0x260020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_80:
	setx	0x250323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 35)
	.word 0xfa250000  ! 943: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf2b4a096  ! 946: STHA_I	stha	%r25, [%r18 + 0x0096] %asi
T3_asi_reg_rd_45:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4b4a00f  ! 949: STHA_I	stha	%r26, [%r18 + 0x000f] %asi
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb204e0b5  ! 956: ADD_I	add 	%r19, 0x00b5, %r25
	.word 0xf6ad20ef  ! 957: STBA_I	stba	%r27, [%r20 + 0x00ef] %asi
T3_asi_reg_rd_46:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6aca174  ! 959: STBA_I	stba	%r27, [%r18 + 0x0174] %asi
T3_asi_reg_wr_52:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 965: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb9540000  ! 971: RDPR_GL	rdpr	%-, %r28
	.word 0xf624210f  ! 972: STW_I	stw	%r27, [%r16 + 0x010f]
cpu_intr_3_81:
	setx	0x24002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 975: STX_R	stx	%r24, [%r18 + %r0]
cpu_intr_3_82:
	setx	0x250305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac8020  ! 979: STBA_R	stba	%r29, [%r18 + %r0] 0x01
T3_asi_reg_rd_47:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_48:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 987: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_83:
	setx	0x26020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674611c  ! 990: STX_I	stx	%r27, [%r17 + 0x011c]
	.word 0xf0744000  ! 991: STX_R	stx	%r24, [%r17 + %r0]
T3_asi_reg_wr_53:
	mov	0x2e, %r14
	.word 0xfaf384a0  ! 992: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfca5e001  ! 997: STWA_I	stwa	%r30, [%r23 + 0x0001] %asi
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfa340000  ! 1000: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf2ad4020  ! 1001: STBA_R	stba	%r25, [%r21 + %r0] 0x01
T3_asi_reg_rd_49:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_50:
	mov	0x13, %r14
	.word 0xf8db8e60  ! 1003: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfe34e1be  ! 1006: STH_I	sth	%r31, [%r19 + 0x01be]
	.word 0xb5641800  ! 1007: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 1008: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf6a5e126  ! 1009: STWA_I	stwa	%r27, [%r23 + 0x0126] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf824a0df  ! 1014: STW_I	stw	%r28, [%r18 + 0x00df]
T3_asi_reg_rd_51:
	mov	0x31, %r14
	.word 0xfadb8400  ! 1018: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_84:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5a078  ! 1020: STWA_I	stwa	%r28, [%r22 + 0x0078] %asi
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d82  ! 1022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d82, %hpstate
T3_asi_reg_rd_52:
	mov	0x32, %r14
	.word 0xf4db8e80  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb935a001  ! 1026: SRL_I	srl 	%r22, 0x0001, %r28
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfe256096  ! 1028: STW_I	stw	%r31, [%r21 + 0x0096]
	.word 0xfa742135  ! 1029: STX_I	stx	%r29, [%r16 + 0x0135]
	.word 0xb434a111  ! 1030: SUBC_I	orn 	%r18, 0x0111, %r26
	.word 0xfc340000  ! 1031: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xf6b54020  ! 1032: STHA_R	stha	%r27, [%r21 + %r0] 0x01
cpu_intr_3_85:
	setx	0x26001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_55:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 1045: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_53:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf2b40020  ! 1049: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xfe34c000  ! 1051: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xfc75a15e  ! 1052: STX_I	stx	%r30, [%r22 + 0x015e]
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_TO_TL1
	.word 0xfc2d4000  ! 1058: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf6340000  ! 1059: STH_R	sth	%r27, [%r16 + %r0]
T3_asi_reg_wr_56:
	mov	0xa, %r14
	.word 0xf8f389e0  ! 1064: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb60ce1bc  ! 1066: AND_I	and 	%r19, 0x01bc, %r27
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d88  ! 1067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
	.word 0xf234c000  ! 1068: STH_R	sth	%r25, [%r19 + %r0]
cpu_intr_3_86:
	setx	0x26000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x240225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2aca1c7  ! 1072: STBA_I	stba	%r25, [%r18 + 0x01c7] %asi
T3_asi_reg_wr_57:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 1077: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_58:
	mov	0x15, %r14
	.word 0xf8f389e0  ! 1081: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0244000  ! 1090: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf6f56059  ! 1093: STXA_I	stxa	%r27, [%r21 + 0x0059] %asi
	.word 0xb1352001  ! 1095: SRL_I	srl 	%r20, 0x0001, %r24
cpu_intr_3_88:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25e131  ! 1098: STW_I	stw	%r30, [%r23 + 0x0131]
cpu_intr_3_89:
	setx	0x270308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634e145  ! 1103: STH_I	sth	%r27, [%r19 + 0x0145]
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfeb58020  ! 1105: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xf2ac205d  ! 1107: STBA_I	stba	%r25, [%r16 + 0x005d] %asi
	.word 0xb8c5204b  ! 1109: ADDCcc_I	addccc 	%r20, 0x004b, %r28
T3_asi_reg_wr_59:
	mov	0x1a, %r14
	.word 0xfaf384a0  ! 1110: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfc244000  ! 1111: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xba444000  ! 1113: ADDC_R	addc 	%r17, %r0, %r29
T3_asi_reg_rd_54:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfcb5e17a  ! 1115: STHA_I	stha	%r30, [%r23 + 0x017a] %asi
cpu_intr_3_90:
	setx	0x260030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57d0400  ! 1125: MOVR_R	movre	%r20, %r0, %r26
	.word 0xf6b52001  ! 1126: STHA_I	stha	%r27, [%r20 + 0x0001] %asi
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c48  ! 1128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c48, %hpstate
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_91:
	setx	0x270325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34e179  ! 1144: STH_I	sth	%r29, [%r19 + 0x0179]
	.word 0xf4aca17e  ! 1147: STBA_I	stba	%r26, [%r18 + 0x017e] %asi
	.word 0xf2344000  ! 1148: STH_R	sth	%r25, [%r17 + %r0]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_92:
	setx	0x26002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c20a8  ! 1153: STB_I	stb	%r27, [%r16 + 0x00a8]
	.word 0xf0ac207f  ! 1154: STBA_I	stba	%r24, [%r16 + 0x007f] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_93:
	setx	0x25000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4350000  ! 1163: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf2342067  ! 1164: STH_I	sth	%r25, [%r16 + 0x0067]
T3_asi_reg_wr_60:
	mov	0x5, %r14
	.word 0xf2f38400  ! 1165: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_94:
	setx	0x3033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_61:
	mov	0x31, %r14
	.word 0xfef38e40  ! 1169: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfea4c020  ! 1171: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xfcad0020  ! 1172: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	.word 0xf6a44020  ! 1178: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
cpu_intr_3_95:
	setx	0x260326, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a50  ! 1181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 13)
	.word 0xb645e0c8  ! 1183: ADDC_I	addc 	%r23, 0x00c8, %r27
	.word 0xf0ad21ec  ! 1185: STBA_I	stba	%r24, [%r20 + 0x01ec] %asi
	.word 0xb2bdc000  ! 1186: XNORcc_R	xnorcc 	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_3_96:
	setx	0x250133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb224218d  ! 1199: SUB_I	sub 	%r16, 0x018d, %r25
	.word 0xf474619d  ! 1200: STX_I	stx	%r26, [%r17 + 0x019d]
cpu_intr_3_97:
	setx	0x27023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa56128  ! 1202: STWA_I	stwa	%r29, [%r21 + 0x0128] %asi
	.word 0xb9510000  ! 1207: RDPR_TICK	rdpr	%tick, %r28
cpu_intr_3_98:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6354000  ! 1210: SUBC_R	orn 	%r21, %r0, %r27
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 29)
	.word 0xf4f4a139  ! 1212: STXA_I	stxa	%r26, [%r18 + 0x0139] %asi
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 12)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982ac0  ! 1216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac0, %hpstate
cpu_intr_3_99:
	setx	0x26013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_100:
	setx	0x26022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_55:
	mov	0x24, %r14
	.word 0xfedb89e0  ! 1224: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf2f4e118  ! 1226: STXA_I	stxa	%r25, [%r19 + 0x0118] %asi
	.word 0xba95e016  ! 1228: ORcc_I	orcc 	%r23, 0x0016, %r29
T3_asi_reg_rd_56:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_62:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 1234: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xbf3ca001  ! 1239: SRA_I	sra 	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf025c000  ! 1241: STW_R	stw	%r24, [%r23 + %r0]
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_101:
	setx	0x260210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_102:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_TO_TL0
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_103:
	setx	0x24030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12da001  ! 1261: SLL_I	sll 	%r22, 0x0001, %r24
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf6a460b5  ! 1266: STWA_I	stwa	%r27, [%r17 + 0x00b5] %asi
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf8b48020  ! 1268: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_104:
	setx	0x260218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf625a05b  ! 1271: STW_I	stw	%r27, [%r22 + 0x005b]
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982bda  ! 1272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bda, %hpstate
	.word 0xf4348000  ! 1275: STH_R	sth	%r26, [%r18 + %r0]
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, c)
	.word 0xfe2d8000  ! 1277: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf2b5c020  ! 1279: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf2b40020  ! 1280: STHA_R	stha	%r25, [%r16 + %r0] 0x01
cpu_intr_3_105:
	setx	0x24032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_57:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_58:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 33)
	.word 0xfcf4202c  ! 1288: STXA_I	stxa	%r30, [%r16 + 0x002c] %asi
	.word 0xfeada172  ! 1289: STBA_I	stba	%r31, [%r22 + 0x0172] %asi
cpu_intr_3_106:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb42d607f  ! 1295: ANDN_I	andn 	%r21, 0x007f, %r26
cpu_intr_3_107:
	setx	0x26013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_59:
	mov	0xe, %r14
	.word 0xf8db8e40  ! 1299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c82  ! 1300: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c82, %hpstate
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982bc0  ! 1301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc0, %hpstate
	.word 0xf2744000  ! 1303: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf62d8000  ! 1306: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf02d4000  ! 1307: STB_R	stb	%r24, [%r21 + %r0]
cpu_intr_3_108:
	setx	0x250328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024e178  ! 1310: STW_I	stw	%r24, [%r19 + 0x0178]
cpu_intr_3_109:
	setx	0x250000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d5000  ! 1313: SLLX_R	sllx	%r21, %r0, %r26
T3_asi_reg_rd_60:
	mov	0x18, %r14
	.word 0xf4db84a0  ! 1315: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b521f6  ! 1318: STHA_I	stha	%r25, [%r20 + 0x01f6] %asi
cpu_intr_3_110:
	setx	0x26003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835a186  ! 1322: STH_I	sth	%r28, [%r22 + 0x0186]
	.word 0xb484c000  ! 1325: ADDcc_R	addcc 	%r19, %r0, %r26
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_63:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 1329: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xba34a1af  ! 1331: SUBC_I	orn 	%r18, 0x01af, %r29
	.word 0xfa2ce018  ! 1332: STB_I	stb	%r29, [%r19 + 0x0018]
	.word 0xfef4212f  ! 1335: STXA_I	stxa	%r31, [%r16 + 0x012f] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_111:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_61:
	mov	0x3, %r14
	.word 0xf2db8e60  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_64:
	mov	0x24, %r14
	.word 0xf0f38e80  ! 1344: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_112:
	setx	0x27020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075217e  ! 1355: STX_I	stx	%r24, [%r20 + 0x017e]
T3_asi_reg_wr_65:
	mov	0x32, %r14
	.word 0xfaf38e60  ! 1356: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfcac8020  ! 1358: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xfe24610b  ! 1360: STW_I	stw	%r31, [%r17 + 0x010b]
	.word 0xf82c8000  ! 1363: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf42c21df  ! 1371: STB_I	stb	%r26, [%r16 + 0x01df]
	.word 0xfab5a0f7  ! 1372: STHA_I	stha	%r29, [%r22 + 0x00f7] %asi
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 28)
	.word 0xf634e081  ! 1380: STH_I	sth	%r27, [%r19 + 0x0081]
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_66:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 1384: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_62:
	mov	0x30, %r14
	.word 0xf6db8400  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_113:
	setx	0x2b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f56056  ! 1391: STXA_I	stxa	%r27, [%r21 + 0x0056] %asi
	.word 0xfc350000  ! 1392: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xfcade0f3  ! 1393: STBA_I	stba	%r30, [%r23 + 0x00f3] %asi
T3_asi_reg_rd_63:
	mov	0x7, %r14
	.word 0xf8db8400  ! 1394: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_114:
	setx	0x290018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a56053  ! 1399: STWA_I	stwa	%r26, [%r21 + 0x0053] %asi
	.word 0x8995e1c3  ! 1404: WRPR_TICK_I	wrpr	%r23, 0x01c3, %tick
	.word 0xfc2c4000  ! 1407: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xb8adc000  ! 1408: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xb12c2001  ! 1409: SLL_I	sll 	%r16, 0x0001, %r24
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
	.word 0xf6a44020  ! 1415: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_115:
	setx	0x280212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 0)
	.word 0xfab5e1ae  ! 1422: STHA_I	stha	%r29, [%r23 + 0x01ae] %asi
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_67:
	mov	0x2f, %r14
	.word 0xfcf389e0  ! 1425: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_64:
	mov	0x18, %r14
	.word 0xfedb8400  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_116:
	setx	0x2a033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73da001  ! 1440: SRA_I	sra 	%r22, 0x0001, %r27
T3_asi_reg_wr_68:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 1445: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_117:
	setx	0x29003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac60bd  ! 1450: STBA_I	stba	%r24, [%r17 + 0x00bd] %asi
T3_asi_reg_rd_65:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 1452: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfcb48020  ! 1455: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xf0750000  ! 1456: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xf8b4e09c  ! 1457: STHA_I	stha	%r28, [%r19 + 0x009c] %asi
cpu_intr_3_118:
	setx	0x2a031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4e11b  ! 1462: STHA_I	stha	%r28, [%r19 + 0x011b] %asi
	.word 0xfe35c000  ! 1464: STH_R	sth	%r31, [%r23 + %r0]
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, e)
	.word 0xb48d4000  ! 1466: ANDcc_R	andcc 	%r21, %r0, %r26
cpu_intr_3_119:
	setx	0x280002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_120:
	setx	0x2a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce1a0  ! 1471: STB_I	stb	%r27, [%r19 + 0x01a0]
T3_asi_reg_wr_69:
	mov	0xa, %r14
	.word 0xf2f38e40  ! 1472: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf625e1cc  ! 1474: STW_I	stw	%r27, [%r23 + 0x01cc]
	.word 0xf2f5a082  ! 1475: STXA_I	stxa	%r25, [%r22 + 0x0082] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_70:
	mov	0xf, %r14
	.word 0xfcf384a0  ! 1477: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_121:
	setx	0x28023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 4)
	.word 0xf4f5218f  ! 1486: STXA_I	stxa	%r26, [%r20 + 0x018f] %asi
	.word 0xf6a50020  ! 1490: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	.word 0xbf2c6001  ! 1493: SLL_I	sll 	%r17, 0x0001, %r31
	.word 0xfcf56089  ! 1494: STXA_I	stxa	%r30, [%r21 + 0x0089] %asi
T3_asi_reg_wr_71:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 1497: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_72:
	mov	0x24, %r14
	.word 0xfef38e80  ! 1499: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_122:
	setx	0x2a0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_123:
	setx	0x29032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_73:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 1509: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc258000  ! 1510: STW_R	stw	%r30, [%r22 + %r0]
cpu_intr_3_124:
	setx	0x2b030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 1513: STX_R	stx	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d92  ! 1516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d92, %hpstate
T3_asi_reg_rd_66:
	mov	0x15, %r14
	.word 0xf6db8e60  ! 1517: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c00  ! 1519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c00, %hpstate
cpu_intr_3_125:
	setx	0x280011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_74:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 1525: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_126:
	setx	0x29032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_75:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 1531: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_76:
	mov	0x2e, %r14
	.word 0xfef38e60  ! 1538: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_wr_77:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 1539: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_67:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xbb2c5000  ! 1547: SLLX_R	sllx	%r17, %r0, %r29
	.word 0xbe35c000  ! 1548: ORN_R	orn 	%r23, %r0, %r31
T3_asi_reg_wr_78:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 1551: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfeb4a1ec  ! 1552: STHA_I	stha	%r31, [%r18 + 0x01ec] %asi
	.word 0xb0bc2070  ! 1553: XNORcc_I	xnorcc 	%r16, 0x0070, %r24
cpu_intr_3_127:
	setx	0x2a0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_79:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 1555: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa358000  ! 1557: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf4a4c020  ! 1558: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	.word 0xf22c60e5  ! 1563: STB_I	stb	%r25, [%r17 + 0x00e5]
	.word 0xb8ada0e6  ! 1566: ANDNcc_I	andncc 	%r22, 0x00e6, %r28
T3_asi_reg_wr_80:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 1569: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfab54020  ! 1570: STHA_R	stha	%r29, [%r21 + %r0] 0x01
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 2)
	.word 0xb37d8400  ! 1573: MOVR_R	movre	%r22, %r0, %r25
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfc34c000  ! 1579: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xbeac61fc  ! 1584: ANDNcc_I	andncc 	%r17, 0x01fc, %r31
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_68:
	mov	0x10, %r14
	.word 0xfcdb8400  ! 1588: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_81:
	mov	0x1e, %r14
	.word 0xf6f38e60  ! 1594: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb73c0000  ! 1595: SRA_R	sra 	%r16, %r0, %r27
cpu_intr_3_128:
	setx	0x280322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_129:
	setx	0x290115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea40020  ! 1601: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	.word 0xf474e1b2  ! 1604: STX_I	stx	%r26, [%r19 + 0x01b2]
	.word 0xfa35e014  ! 1605: STH_I	sth	%r29, [%r23 + 0x0014]
	.word 0xf62d6149  ! 1607: STB_I	stb	%r27, [%r21 + 0x0149]
T3_asi_reg_rd_69:
	mov	0x3, %r14
	.word 0xfedb8400  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_130:
	setx	0x2b0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_82:
	mov	0x14, %r14
	.word 0xf6f38e60  ! 1621: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_70:
	mov	0x29, %r14
	.word 0xf0db89e0  ! 1622: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_83:
	mov	0x2f, %r14
	.word 0xf6f38e40  ! 1623: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfc346135  ! 1624: STH_I	sth	%r30, [%r17 + 0x0135]
cpu_intr_3_131:
	setx	0x280004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_71:
	mov	0x11, %r14
	.word 0xf6db84a0  ! 1628: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_132:
	setx	0x280229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03421cb  ! 1635: STH_I	sth	%r24, [%r16 + 0x01cb]
	.word 0xfc354000  ! 1639: STH_R	sth	%r30, [%r21 + %r0]
T3_asi_reg_wr_84:
	mov	0x29, %r14
	.word 0xf8f389e0  ! 1640: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_133:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_134:
	setx	0x29010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_135:
	setx	0x28033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74e0a7  ! 1661: STX_I	stx	%r30, [%r19 + 0x00a7]
cpu_intr_3_136:
	setx	0x290325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4e080  ! 1666: STHA_I	stha	%r28, [%r19 + 0x0080] %asi
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982840  ! 1668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
T3_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1671: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 25)
	.word 0xb815c000  ! 1674: OR_R	or 	%r23, %r0, %r28
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_137:
	setx	0x28023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_86:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 1678: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_rd_72:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_138:
	setx	0x290338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ada143  ! 1683: STBA_I	stba	%r27, [%r22 + 0x0143] %asi
T3_asi_reg_wr_87:
	mov	0xe, %r14
	.word 0xfaf384a0  ! 1687: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_139:
	setx	0x280104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5a0b2  ! 1690: STWA_I	stwa	%r25, [%r22 + 0x00b2] %asi
	.word 0xf424c000  ! 1692: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf6a48020  ! 1693: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0x8995612c  ! 1694: WRPR_TICK_I	wrpr	%r21, 0x012c, %tick
cpu_intr_3_140:
	setx	0x2a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8742159  ! 1697: STX_I	stx	%r28, [%r16 + 0x0159]
cpu_intr_3_141:
	setx	0x2a0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x24, %r14
	.word 0xf6f38400  ! 1700: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_89:
	mov	0x1f, %r14
	.word 0xf4f38e60  ! 1701: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_73:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 1702: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e90  ! 1703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e90, %hpstate
	.word 0xf0a44020  ! 1705: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
T3_asi_reg_rd_74:
	mov	0x15, %r14
	.word 0xfedb89e0  ! 1709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_75:
	mov	0x8, %r14
	.word 0xfadb8e40  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6748000  ! 1712: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xb33c5000  ! 1713: SRAX_R	srax	%r17, %r0, %r25
	.word 0x81946144  ! 1714: WRPR_TPC_I	wrpr	%r17, 0x0144, %tpc
T3_asi_reg_rd_76:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_142:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca50020  ! 1720: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_90:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 1723: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf27460d3  ! 1724: STX_I	stx	%r25, [%r17 + 0x00d3]
	.word 0xfeada068  ! 1726: STBA_I	stba	%r31, [%r22 + 0x0068] %asi
	.word 0xf0350000  ! 1727: STH_R	sth	%r24, [%r20 + %r0]
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 11)
	.word 0xf6a50020  ! 1729: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	.word 0xf4ad4020  ! 1733: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xfc2c21f9  ! 1734: STB_I	stb	%r30, [%r16 + 0x01f9]
	.word 0xf8a4e0a9  ! 1738: STWA_I	stwa	%r28, [%r19 + 0x00a9] %asi
	.word 0xba150000  ! 1739: OR_R	or 	%r20, %r0, %r29
cpu_intr_3_143:
	setx	0x29011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234a1c6  ! 1741: STH_I	sth	%r25, [%r18 + 0x01c6]
	.word 0xf034a0b0  ! 1743: STH_I	sth	%r24, [%r18 + 0x00b0]
T3_asi_reg_rd_77:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_91:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 1748: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf8746100  ! 1751: STX_I	stx	%r28, [%r17 + 0x0100]
	.word 0xba956145  ! 1752: ORcc_I	orcc 	%r21, 0x0145, %r29
cpu_intr_3_144:
	setx	0x2b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_145:
	setx	0x2b0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf8a46184  ! 1766: STWA_I	stwa	%r28, [%r17 + 0x0184] %asi
	.word 0xbf35c000  ! 1767: SRL_R	srl 	%r23, %r0, %r31
T3_asi_reg_rd_78:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 1768: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2740000  ! 1770: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf2ac20fd  ! 1772: STBA_I	stba	%r25, [%r16 + 0x00fd] %asi
	ta	T_CHANGE_HPRIV
	.word 0xf0248000  ! 1776: STW_R	stw	%r24, [%r18 + %r0]
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_HPRIV
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 1e)
	.word 0xbc3c0000  ! 1782: XNOR_R	xnor 	%r16, %r0, %r30
T3_asi_reg_rd_79:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb6b560b4  ! 1787: ORNcc_I	orncc 	%r21, 0x00b4, %r27
	.word 0xbd641800  ! 1789: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_92:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 1790: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_80:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 1791: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb13c6001  ! 1793: SRA_I	sra 	%r17, 0x0001, %r24
	.word 0xf4b4e1db  ! 1795: STHA_I	stha	%r26, [%r19 + 0x01db] %asi
	.word 0xb93d9000  ! 1796: SRAX_R	srax	%r22, %r0, %r28
	.word 0xf6740000  ! 1798: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xb4b4c000  ! 1799: ORNcc_R	orncc 	%r19, %r0, %r26
T3_asi_reg_rd_81:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf42520f9  ! 1802: STW_I	stw	%r26, [%r20 + 0x00f9]
T3_asi_reg_wr_93:
	mov	0x1d, %r14
	.word 0xf8f384a0  ! 1804: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbc05610a  ! 1805: ADD_I	add 	%r21, 0x010a, %r30
cpu_intr_3_146:
	setx	0x2c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe244000  ! 1807: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfaac4020  ! 1808: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xfa25e0b8  ! 1809: STW_I	stw	%r29, [%r23 + 0x00b8]
	.word 0xf02c8000  ! 1810: STB_R	stb	%r24, [%r18 + %r0]
T3_asi_reg_rd_82:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 1814: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_147:
	setx	0x2d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0a5e065  ! 1820: STWA_I	stwa	%r24, [%r23 + 0x0065] %asi
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f0a  ! 1822: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
	.word 0xf6b520db  ! 1823: STHA_I	stha	%r27, [%r20 + 0x00db] %asi
	.word 0xf8354000  ! 1826: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf4b52164  ! 1832: STHA_I	stha	%r26, [%r20 + 0x0164] %asi
T3_asi_reg_rd_83:
	mov	0x2e, %r14
	.word 0xf6db8e40  ! 1833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_148:
	setx	0x2d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x2e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d6149  ! 1840: STB_I	stb	%r31, [%r21 + 0x0149]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_84:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2d4000  ! 1851: STB_R	stb	%r30, [%r21 + %r0]
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 13)
	.word 0xf8ac0020  ! 1853: STBA_R	stba	%r28, [%r16 + %r0] 0x01
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_150:
	setx	0x2e011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_85:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf02421c8  ! 1865: STW_I	stw	%r24, [%r16 + 0x01c8]
T3_asi_reg_rd_86:
	mov	0xf, %r14
	.word 0xf6db8e40  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_94:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 1868: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf824a137  ! 1872: STW_I	stw	%r28, [%r18 + 0x0137]
T3_asi_reg_wr_95:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 1875: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb0bd205d  ! 1876: XNORcc_I	xnorcc 	%r20, 0x005d, %r24
T3_asi_reg_rd_87:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 1881: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 35)
	.word 0xfaa50020  ! 1886: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_88:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfeace1d3  ! 1888: STBA_I	stba	%r31, [%r19 + 0x01d3] %asi
	.word 0xb0c40000  ! 1893: ADDCcc_R	addccc 	%r16, %r0, %r24
	.word 0xb004e196  ! 1894: ADD_I	add 	%r19, 0x0196, %r24
	.word 0xb42d610d  ! 1898: ANDN_I	andn 	%r21, 0x010d, %r26
	.word 0xf4a48020  ! 1899: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
cpu_intr_3_151:
	setx	0x2e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_152:
	setx	0x2d0101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_154:
	setx	0x2e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_96:
	mov	0x1b, %r14
	.word 0xf2f38400  ! 1912: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf034e0c2  ! 1913: STH_I	sth	%r24, [%r19 + 0x00c2]
	.word 0xf0252020  ! 1916: STW_I	stw	%r24, [%r20 + 0x0020]
cpu_intr_3_155:
	setx	0x2d000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_89:
	mov	0x32, %r14
	.word 0xf2db8e60  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_156:
	setx	0x2f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_97:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 1929: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2ac8020  ! 1930: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828d8  ! 1932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d8, %hpstate
cpu_intr_3_157:
	setx	0x2c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_98:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 1935: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_99:
	mov	0x36, %r14
	.word 0xf8f389e0  ! 1937: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f40  ! 1938: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f40, %hpstate
cpu_intr_3_158:
	setx	0x2f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc244000  ! 1943: SUB_R	sub 	%r17, %r0, %r30
cpu_intr_3_160:
	setx	0x2d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_90:
	mov	0x20, %r14
	.word 0xf2db8e80  ! 1945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf2746034  ! 1947: STX_I	stx	%r25, [%r17 + 0x0034]
T3_asi_reg_wr_100:
	mov	0x6, %r14
	.word 0xfef384a0  ! 1949: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_161:
	setx	0x2e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824c000  ! 1955: STW_R	stw	%r28, [%r19 + %r0]
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf674e07a  ! 1957: STX_I	stx	%r27, [%r19 + 0x007a]
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_HPRIV
	.word 0xb40c21a1  ! 1962: AND_I	and 	%r16, 0x01a1, %r26
T3_asi_reg_wr_101:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 1963: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_162:
	setx	0x2d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_102:
	mov	0x1c, %r14
	.word 0xf0f38e80  ! 1969: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_103:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 1971: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_163:
	setx	0x2c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_164:
	setx	0x2c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead214b  ! 1975: STBA_I	stba	%r31, [%r20 + 0x014b] %asi
T3_asi_reg_rd_91:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe2c61b7  ! 1978: STB_I	stb	%r31, [%r17 + 0x01b7]
cpu_intr_3_165:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 1981: STH_R	sth	%r29, [%r17 + %r0]
cpu_intr_3_166:
	setx	0x2f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe740000  ! 1984: STX_R	stx	%r31, [%r16 + %r0]
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf4b5219d  ! 1987: STHA_I	stha	%r26, [%r20 + 0x019d] %asi
cpu_intr_3_167:
	setx	0x2d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf347001  ! 1991: SRLX_I	srlx	%r17, 0x0001, %r31
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_104:
	mov	0x30, %r14
	.word 0xfaf384a0  ! 1996: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 5)
	.word 0xf42d6009  ! 1998: STB_I	stb	%r26, [%r21 + 0x0009]
	.word 0xfe758000  ! 2000: STX_R	stx	%r31, [%r22 + %r0]
cpu_intr_3_168:
	setx	0x2d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a4c000  ! 2004: SUBcc_R	subcc 	%r19, %r0, %r28
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b92  ! 2006: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b92, %hpstate
T3_asi_reg_rd_92:
	mov	0x14, %r14
	.word 0xfedb84a0  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5352001  ! 2008: SRL_I	srl 	%r20, 0x0001, %r26
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b8a  ! 2009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8a, %hpstate
	.word 0xb3344000  ! 2013: SRL_R	srl 	%r17, %r0, %r25
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 2)
	.word 0xfe25e0e2  ! 2018: STW_I	stw	%r31, [%r23 + 0x00e2]
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf0a4c020  ! 2021: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_93:
	mov	0x1d, %r14
	.word 0xfedb8e80  ! 2023: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb6452135  ! 2026: ADDC_I	addc 	%r20, 0x0135, %r27
cpu_intr_3_169:
	setx	0x2e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8744000  ! 2033: STX_R	stx	%r28, [%r17 + %r0]
T3_asi_reg_rd_94:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf224e013  ! 2037: STW_I	stw	%r25, [%r19 + 0x0013]
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 11)
	.word 0xb1643801  ! 2039: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL1
	.word 0xf6f4a0c3  ! 2041: STXA_I	stxa	%r27, [%r18 + 0x00c3] %asi
	.word 0xfeb50020  ! 2043: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xb5508000  ! 2044: RDPR_TSTATE	rdpr	%tstate, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xbcc461fc  ! 2046: ADDCcc_I	addccc 	%r17, 0x01fc, %r30
	.word 0xb00d6113  ! 2048: AND_I	and 	%r21, 0x0113, %r24
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 7)
	.word 0xf8adc020  ! 2059: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xb52c5000  ! 2060: SLLX_R	sllx	%r17, %r0, %r26
T3_asi_reg_rd_95:
	mov	0x24, %r14
	.word 0xf8db8400  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_170:
	setx	0x2c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5c020  ! 2063: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xfab48020  ! 2067: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xf0742030  ! 2070: STX_I	stx	%r24, [%r16 + 0x0030]
	.word 0xf224210c  ! 2071: STW_I	stw	%r25, [%r16 + 0x010c]
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_105:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 2073: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_171:
	setx	0x2d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a48020  ! 2087: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xfcf4a11b  ! 2088: STXA_I	stxa	%r30, [%r18 + 0x011b] %asi
	.word 0xf4ad8020  ! 2089: STBA_R	stba	%r26, [%r22 + %r0] 0x01
cpu_intr_3_172:
	setx	0x2e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_106:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 2091: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfa754000  ! 2092: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf82cc000  ! 2093: STB_R	stb	%r28, [%r19 + %r0]
T3_asi_reg_rd_96:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_173:
	setx	0x2f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_97:
	mov	0x11, %r14
	.word 0xf6db8e60  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb2140000  ! 2103: OR_R	or 	%r16, %r0, %r25
cpu_intr_3_174:
	setx	0x2f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62da0f2  ! 2106: STB_I	stb	%r27, [%r22 + 0x00f2]
T3_asi_reg_wr_107:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 2107: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_108:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 2109: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf6354000  ! 2110: STH_R	sth	%r27, [%r21 + %r0]
T3_asi_reg_wr_109:
	mov	0x5, %r14
	.word 0xf2f38e80  ! 2111: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb52de001  ! 2112: SLL_I	sll 	%r23, 0x0001, %r26
T3_asi_reg_rd_98:
	mov	0x26, %r14
	.word 0xfadb8400  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf075a1e1  ! 2117: STX_I	stx	%r24, [%r22 + 0x01e1]
	.word 0xbb2da001  ! 2119: SLL_I	sll 	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf8b4c020  ! 2121: STHA_R	stha	%r28, [%r19 + %r0] 0x01
	.word 0xf424607f  ! 2123: STW_I	stw	%r26, [%r17 + 0x007f]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_175:
	setx	0x2c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe240000  ! 2126: STW_R	stw	%r31, [%r16 + %r0]
cpu_intr_3_176:
	setx	0x2c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f52105  ! 2130: STXA_I	stxa	%r28, [%r20 + 0x0105] %asi
cpu_intr_3_177:
	setx	0x2c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad8020  ! 2132: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xfc2c0000  ! 2133: STB_R	stb	%r30, [%r16 + %r0]
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_HPRIV
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_TO_TL1
	.word 0xf8b40020  ! 2139: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xf42d8000  ! 2143: STB_R	stb	%r26, [%r22 + %r0]
cpu_intr_3_178:
	setx	0x2f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_110:
	mov	0xc, %r14
	.word 0xfcf38e60  ! 2148: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_179:
	setx	0x2f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_180:
	setx	0x2d021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982bd0  ! 2154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd0, %hpstate
	.word 0xb3520000  ! 2156: RDPR_PIL	rdpr	%pil, %r25
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f92  ! 2157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f92, %hpstate
T3_asi_reg_wr_111:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 2158: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_181:
	setx	0x2f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc348000  ! 2168: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xfcad60af  ! 2169: STBA_I	stba	%r30, [%r21 + 0x00af] %asi
	.word 0xb4958000  ! 2170: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xf0a461c9  ! 2171: STWA_I	stwa	%r24, [%r17 + 0x01c9] %asi
	.word 0xf42d0000  ! 2172: STB_R	stb	%r26, [%r20 + %r0]
T3_asi_reg_wr_112:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 2174: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1500000  ! 2178: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf8a521a1  ! 2179: STWA_I	stwa	%r28, [%r20 + 0x01a1] %asi
	.word 0xbe3c8000  ! 2180: XNOR_R	xnor 	%r18, %r0, %r31
T3_asi_reg_rd_99:
	mov	0x1c, %r14
	.word 0xf0db8e60  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xba2d8000  ! 2183: ANDN_R	andn 	%r22, %r0, %r29
	.word 0xfa2c61d7  ! 2185: STB_I	stb	%r29, [%r17 + 0x01d7]
	.word 0xb57d2401  ! 2187: MOVR_I	movre	%r20, 0x1, %r26
T3_asi_reg_wr_113:
	mov	0x13, %r14
	.word 0xfaf38e60  ! 2190: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf8358000  ! 2191: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xb0954000  ! 2192: ORcc_R	orcc 	%r21, %r0, %r24
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_114:
	mov	0xc, %r14
	.word 0xf6f38400  ! 2195: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_rd_100:
	mov	0x1b, %r14
	.word 0xfcdb8e60  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfe75e1fa  ! 2198: STX_I	stx	%r31, [%r23 + 0x01fa]
	ta	T_CHANGE_TO_TL0
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 16)
	.word 0xf2358000  ! 2201: STH_R	sth	%r25, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_115:
	mov	0x7, %r14
	.word 0xf0f384a0  ! 2204: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_182:
	setx	0x2d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 2208: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_101:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_116:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 2212: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa750000  ! 2223: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xf424c000  ! 2228: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf2a5e1e0  ! 2229: STWA_I	stwa	%r25, [%r23 + 0x01e0] %asi
	.word 0xf474e1c2  ! 2231: STX_I	stx	%r26, [%r19 + 0x01c2]
T3_asi_reg_rd_102:
	mov	0x2b, %r14
	.word 0xfadb84a0  ! 2232: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfe352118  ! 2235: STH_I	sth	%r31, [%r20 + 0x0118]
cpu_intr_3_183:
	setx	0x2e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, d)
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_117:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 2244: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_184:
	setx	0x2f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_118:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 2255: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_185:
	setx	0x2d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_186:
	setx	0x2f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_103:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfeb4e178  ! 2266: STHA_I	stha	%r31, [%r19 + 0x0178] %asi
	.word 0xba150000  ! 2267: OR_R	or 	%r20, %r0, %r29
	.word 0xfa25e01d  ! 2271: STW_I	stw	%r29, [%r23 + 0x001d]
	.word 0xf0246002  ! 2272: STW_I	stw	%r24, [%r17 + 0x0002]
	.word 0xfe250000  ! 2273: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xfef5a111  ! 2274: STXA_I	stxa	%r31, [%r22 + 0x0111] %asi
T3_asi_reg_rd_104:
	mov	0x13, %r14
	.word 0xf0db8e80  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb625c000  ! 2281: SUB_R	sub 	%r23, %r0, %r27
	.word 0xbd3c9000  ! 2287: SRAX_R	srax	%r18, %r0, %r30
T3_asi_reg_wr_119:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 2289: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_187:
	setx	0x320314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbf3c2001  ! 2293: SRA_I	sra 	%r16, 0x0001, %r31
	.word 0xf82460bf  ! 2295: STW_I	stw	%r28, [%r17 + 0x00bf]
	.word 0xfab44020  ! 2296: STHA_R	stha	%r29, [%r17 + %r0] 0x01
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_105:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 2299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 18)
	.word 0xbd50c000  ! 2307: RDPR_TT	rdpr	%tt, %r30
	.word 0xfa258000  ! 2308: STW_R	stw	%r29, [%r22 + %r0]
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfa35209a  ! 2311: STH_I	sth	%r29, [%r20 + 0x009a]
	.word 0xf434c000  ! 2313: STH_R	sth	%r26, [%r19 + %r0]
T3_asi_reg_wr_120:
	mov	0x29, %r14
	.word 0xf6f389e0  ! 2314: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 35)
	.word 0xfcb5604d  ! 2318: STHA_I	stha	%r30, [%r21 + 0x004d] %asi
T3_asi_reg_rd_106:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 2325: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_188:
	setx	0x310222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 2327: RDPR_PIL	rdpr	%pil, %r28
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb33cb001  ! 2329: SRAX_I	srax	%r18, 0x0001, %r25
	.word 0xf2358000  ! 2330: STH_R	sth	%r25, [%r22 + %r0]
	.word 0x85942112  ! 2334: WRPR_TSTATE_I	wrpr	%r16, 0x0112, %tstate
	.word 0xf8f52038  ! 2335: STXA_I	stxa	%r28, [%r20 + 0x0038] %asi
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 5)
	.word 0xf0356066  ! 2337: STH_I	sth	%r24, [%r21 + 0x0066]
	.word 0xf074607b  ! 2340: STX_I	stx	%r24, [%r17 + 0x007b]
	.word 0xf0ad8020  ! 2342: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xb93d1000  ! 2343: SRAX_R	srax	%r20, %r0, %r28
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_189:
	setx	0x30011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 17)
	.word 0xb8448000  ! 2349: ADDC_R	addc 	%r18, %r0, %r28
	.word 0xf2742116  ! 2351: STX_I	stx	%r25, [%r16 + 0x0116]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_190:
	setx	0x330234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5c020  ! 2358: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_121:
	mov	0x8, %r14
	.word 0xf8f384a0  ! 2361: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfab48020  ! 2362: STHA_R	stha	%r29, [%r18 + %r0] 0x01
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 27)
	.word 0xf6756021  ! 2371: STX_I	stx	%r27, [%r21 + 0x0021]
	ta	T_CHANGE_TO_TL1
	.word 0xbeac0000  ! 2374: ANDNcc_R	andncc 	%r16, %r0, %r31
	.word 0xf0ad61c2  ! 2375: STBA_I	stba	%r24, [%r21 + 0x01c2] %asi
	.word 0xf6f461f4  ! 2376: STXA_I	stxa	%r27, [%r17 + 0x01f4] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_122:
	mov	0xa, %r14
	.word 0xf6f38e60  ! 2380: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_191:
	setx	0x330315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac4020  ! 2382: STBA_R	stba	%r31, [%r17 + %r0] 0x01
	.word 0xf03420de  ! 2385: STH_I	sth	%r24, [%r16 + 0x00de]
cpu_intr_3_192:
	setx	0x30000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_TO_TL0
	.word 0xf0a5209a  ! 2392: STWA_I	stwa	%r24, [%r20 + 0x009a] %asi
	.word 0xf8340000  ! 2395: STH_R	sth	%r28, [%r16 + %r0]
T3_asi_reg_wr_123:
	mov	0x1f, %r14
	.word 0xfaf38e60  ! 2396: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_124:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 2397: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_107:
	mov	0x29, %r14
	.word 0xfedb8e40  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_193:
	setx	0x32012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_194:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475617f  ! 2404: STX_I	stx	%r26, [%r21 + 0x017f]
	.word 0xfcac60cb  ! 2406: STBA_I	stba	%r30, [%r17 + 0x00cb] %asi
T3_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 2407: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_195:
	setx	0x31011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_126:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 2414: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfea4c020  ! 2415: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xf67561c7  ! 2416: STX_I	stx	%r27, [%r21 + 0x01c7]
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d0a  ! 2419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0a, %hpstate
	.word 0xf4ad4020  ! 2420: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xf8740000  ! 2421: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf0b58020  ! 2422: STHA_R	stha	%r24, [%r22 + %r0] 0x01
	.word 0xf8b48020  ! 2425: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4a50020  ! 2432: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	.word 0xfa248000  ! 2435: STW_R	stw	%r29, [%r18 + %r0]
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf62c2017  ! 2441: STB_I	stb	%r27, [%r16 + 0x0017]
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf4f5a0bf  ! 2446: STXA_I	stxa	%r26, [%r22 + 0x00bf] %asi
T3_asi_reg_wr_127:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 2449: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_108:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_196:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5c020  ! 2459: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
T3_asi_reg_wr_128:
	mov	0x32, %r14
	.word 0xfef38400  ! 2460: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfcb4a060  ! 2464: STHA_I	stha	%r30, [%r18 + 0x0060] %asi
T3_asi_reg_rd_109:
	mov	0x2d, %r14
	.word 0xf6db8e60  ! 2469: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 1b)
	.word 0xbb3c3001  ! 2472: SRAX_I	srax	%r16, 0x0001, %r29
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, b)
	.word 0xf4aca18c  ! 2479: STBA_I	stba	%r26, [%r18 + 0x018c] %asi
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0354000  ! 2486: STH_R	sth	%r24, [%r21 + %r0]
T3_asi_reg_wr_129:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 2487: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_130:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 2488: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbab5a1b1  ! 2489: ORNcc_I	orncc 	%r22, 0x01b1, %r29
	.word 0xbf2c4000  ! 2491: SLL_R	sll 	%r17, %r0, %r31
	.word 0xb03c4000  ! 2493: XNOR_R	xnor 	%r17, %r0, %r24
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, d)
	.word 0xf27520f1  ! 2497: STX_I	stx	%r25, [%r20 + 0x00f1]
	.word 0xf2754000  ! 2498: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf874217f  ! 2502: STX_I	stx	%r28, [%r16 + 0x017f]
	.word 0xfcaca0d6  ! 2503: STBA_I	stba	%r30, [%r18 + 0x00d6] %asi
	.word 0xf8b50020  ! 2504: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xf0ace1e6  ! 2505: STBA_I	stba	%r24, [%r19 + 0x01e6] %asi
cpu_intr_3_197:
	setx	0x330321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b50020  ! 2509: STHA_R	stha	%r27, [%r20 + %r0] 0x01
cpu_intr_3_198:
	setx	0x30002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe44e130  ! 2512: ADDC_I	addc 	%r19, 0x0130, %r31
T3_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 2514: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_199:
	setx	0x320014, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_111:
	mov	0x19, %r14
	.word 0xf6db8e60  ! 2519: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_200:
	setx	0x217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0c202b  ! 2523: AND_I	and 	%r16, 0x002b, %r31
T3_asi_reg_wr_131:
	mov	0x8, %r14
	.word 0xfcf384a0  ! 2524: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfa75e14f  ! 2526: STX_I	stx	%r29, [%r23 + 0x014f]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 23)
	.word 0xb01c2154  ! 2528: XOR_I	xor 	%r16, 0x0154, %r24
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_112:
	mov	0x0, %r14
	.word 0xf0db89e0  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf6b48020  ! 2535: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xfe25a08b  ! 2542: STW_I	stw	%r31, [%r22 + 0x008b]
T3_asi_reg_wr_132:
	mov	0x5, %r14
	.word 0xf2f384a0  ! 2543: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 29)
	.word 0xf2340000  ! 2546: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb03dc000  ! 2548: XNOR_R	xnor 	%r23, %r0, %r24
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 27)
	.word 0xb32c0000  ! 2551: SLL_R	sll 	%r16, %r0, %r25
cpu_intr_3_201:
	setx	0x330319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_133:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 2561: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_113:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 2564: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbd342001  ! 2573: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xf0ac4020  ! 2574: STBA_R	stba	%r24, [%r17 + %r0] 0x01
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, f)
	.word 0xb23c8000  ! 2578: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0xf635e032  ! 2581: STH_I	sth	%r27, [%r23 + 0x0032]
T3_asi_reg_wr_134:
	mov	0x16, %r14
	.word 0xfef38e60  ! 2584: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_TO_TL0
	.word 0xf02c61ef  ! 2588: STB_I	stb	%r24, [%r17 + 0x01ef]
	.word 0xbe950000  ! 2589: ORcc_R	orcc 	%r20, %r0, %r31
	.word 0xbebc4000  ! 2590: XNORcc_R	xnorcc 	%r17, %r0, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf8ad8020  ! 2594: STBA_R	stba	%r28, [%r22 + %r0] 0x01
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 29)
	.word 0xf2b4a0d1  ! 2599: STHA_I	stha	%r25, [%r18 + 0x00d1] %asi
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, f)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_202:
	setx	0x31031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_135:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 2605: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_203:
	setx	0x310023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb095c000  ! 2607: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xf4ad6046  ! 2609: STBA_I	stba	%r26, [%r21 + 0x0046] %asi
T3_asi_reg_wr_136:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2613: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_114:
	mov	0xf, %r14
	.word 0xf4db8e80  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 37)
	.word 0xfeb5e019  ! 2619: STHA_I	stha	%r31, [%r23 + 0x0019] %asi
cpu_intr_3_204:
	setx	0x32011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_115:
	mov	0x7, %r14
	.word 0xfadb89e0  ! 2621: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbea48000  ! 2622: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0x8995e076  ! 2625: WRPR_TICK_I	wrpr	%r23, 0x0076, %tick
T3_asi_reg_wr_137:
	mov	0xf, %r14
	.word 0xf8f38e80  ! 2626: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf4248000  ! 2627: STW_R	stw	%r26, [%r18 + %r0]
T3_asi_reg_wr_138:
	mov	0x34, %r14
	.word 0xfef38e40  ! 2629: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xf4a44020  ! 2633: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xf6f52197  ! 2634: STXA_I	stxa	%r27, [%r20 + 0x0197] %asi
	.word 0xb13d6001  ! 2636: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xb0ac61fa  ! 2637: ANDNcc_I	andncc 	%r17, 0x01fa, %r24
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_205:
	setx	0x33012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaada115  ! 2646: STBA_I	stba	%r29, [%r22 + 0x0115] %asi
	.word 0xf4b56198  ! 2647: STHA_I	stha	%r26, [%r21 + 0x0198] %asi
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2740000  ! 2653: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfeb5c020  ! 2656: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_139:
	mov	0x22, %r14
	.word 0xf6f38e60  ! 2660: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfe75601b  ! 2661: STX_I	stx	%r31, [%r21 + 0x001b]
T3_asi_reg_rd_116:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 2662: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_3_206:
	setx	0x310325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_207:
	setx	0x310003, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_140:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 2670: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_141:
	mov	0x2b, %r14
	.word 0xf0f38e60  ! 2672: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_wr_142:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 2673: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf4352013  ! 2675: STH_I	sth	%r26, [%r20 + 0x0013]
	.word 0xb0b52096  ! 2678: SUBCcc_I	orncc 	%r20, 0x0096, %r24
cpu_intr_3_208:
	setx	0x300023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_143:
	mov	0x18, %r14
	.word 0xfcf38400  ! 2685: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 34)
	.word 0xf674e08d  ! 2687: STX_I	stx	%r27, [%r19 + 0x008d]
T3_asi_reg_rd_117:
	mov	0x30, %r14
	.word 0xf8db89e0  ! 2688: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf4b5e13d  ! 2689: STHA_I	stha	%r26, [%r23 + 0x013d] %asi
	.word 0xf22c4000  ! 2690: STB_R	stb	%r25, [%r17 + %r0]
cpu_intr_3_209:
	setx	0x320121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4e045  ! 2697: STWA_I	stwa	%r26, [%r19 + 0x0045] %asi
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983cda  ! 2698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cda, %hpstate
T3_asi_reg_wr_144:
	mov	0x30, %r14
	.word 0xf2f389e0  ! 2699: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfcade0a6  ! 2704: STBA_I	stba	%r30, [%r23 + 0x00a6] %asi
	.word 0xfc2d8000  ! 2706: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf42dc000  ! 2708: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xfea44020  ! 2709: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_210:
	setx	0x340115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 2715: MOVcc_I	<illegal instruction>
cpu_intr_3_211:
	setx	0x360013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a50020  ! 2721: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
T3_asi_reg_wr_145:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 2722: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_146:
	mov	0x36, %r14
	.word 0xfcf384a0  ! 2724: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_118:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf024e01c  ! 2726: STW_I	stw	%r24, [%r19 + 0x001c]
	.word 0xf8a44020  ! 2727: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
cpu_intr_3_212:
	setx	0x34011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf47521ce  ! 2729: STX_I	stx	%r26, [%r20 + 0x01ce]
cpu_intr_3_213:
	setx	0x37002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_214:
	setx	0x370212, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_119:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf075c000  ! 2735: STX_R	stx	%r24, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_147:
	mov	0xe, %r14
	.word 0xfaf38e60  ! 2739: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_215:
	setx	0x35010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_148:
	mov	0x14, %r14
	.word 0xfaf38e60  ! 2756: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_216:
	setx	0x370203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b50020  ! 2760: STHA_R	stha	%r26, [%r20 + %r0] 0x01
	.word 0xf02c4000  ! 2761: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xfaa4e1f4  ! 2763: STWA_I	stwa	%r29, [%r19 + 0x01f4] %asi
	.word 0xfe2420f2  ! 2768: STW_I	stw	%r31, [%r16 + 0x00f2]
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 11)
	.word 0xf02d4000  ! 2772: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf8b4a099  ! 2773: STHA_I	stha	%r28, [%r18 + 0x0099] %asi
	.word 0xf635c000  ! 2775: STH_R	sth	%r27, [%r23 + %r0]
T3_asi_reg_rd_120:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 2776: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf035c000  ! 2778: STH_R	sth	%r24, [%r23 + %r0]
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 27)
	.word 0xb6ade198  ! 2781: ANDNcc_I	andncc 	%r23, 0x0198, %r27
	.word 0xf4ac8020  ! 2782: STBA_R	stba	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_121:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 2784: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfef4209d  ! 2787: STXA_I	stxa	%r31, [%r16 + 0x009d] %asi
T3_asi_reg_wr_149:
	mov	0x12, %r14
	.word 0xf8f38400  ! 2789: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_217:
	setx	0x350018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_150:
	mov	0x6, %r14
	.word 0xf0f384a0  ! 2791: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf2a5e15a  ! 2792: STWA_I	stwa	%r25, [%r23 + 0x015a] %asi
T3_asi_reg_rd_122:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_218:
	setx	0x360103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025c000  ! 2797: STW_R	stw	%r24, [%r23 + %r0]
T3_asi_reg_wr_151:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 2799: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_219:
	setx	0x36002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2de19b  ! 2806: STB_I	stb	%r30, [%r23 + 0x019b]
	.word 0xf42c2015  ! 2808: STB_I	stb	%r26, [%r16 + 0x0015]
T3_asi_reg_rd_123:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 2809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_220:
	setx	0x37021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_221:
	setx	0x350214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c0000  ! 2816: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xfc25208a  ! 2818: STW_I	stw	%r30, [%r20 + 0x008a]
	.word 0xfea52051  ! 2819: STWA_I	stwa	%r31, [%r20 + 0x0051] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_222:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6ac2031  ! 2828: STBA_I	stba	%r27, [%r16 + 0x0031] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_223:
	setx	0x36021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5e138  ! 2832: STHA_I	stha	%r29, [%r23 + 0x0138] %asi
	.word 0x8194a0c7  ! 2834: WRPR_TPC_I	wrpr	%r18, 0x00c7, %tpc
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_152:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 2837: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_224:
	setx	0x340308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5a08b  ! 2842: STWA_I	stwa	%r25, [%r22 + 0x008b] %asi
	.word 0xf8b5219b  ! 2843: STHA_I	stha	%r28, [%r20 + 0x019b] %asi
	.word 0xf2b5a19f  ! 2844: STHA_I	stha	%r25, [%r22 + 0x019f] %asi
cpu_intr_3_225:
	setx	0x360317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29ca02a  ! 2850: XORcc_I	xorcc 	%r18, 0x002a, %r25
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 15)
	.word 0xf82d210f  ! 2854: STB_I	stb	%r28, [%r20 + 0x010f]
	.word 0xbf2d8000  ! 2856: SLL_R	sll 	%r22, %r0, %r31
	.word 0xf6f521b2  ! 2857: STXA_I	stxa	%r27, [%r20 + 0x01b2] %asi
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983810  ! 2859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_124:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfa75c000  ! 2868: STX_R	stx	%r29, [%r23 + %r0]
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_125:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 2884: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 37)
	.word 0xb0844000  ! 2886: ADDcc_R	addcc 	%r17, %r0, %r24
cpu_intr_3_226:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_153:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 2889: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_227:
	setx	0x35021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d0000  ! 2892: STB_R	stb	%r26, [%r20 + %r0]
T3_asi_reg_wr_154:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 2893: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_155:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 2895: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, e)
	.word 0xf8b5c020  ! 2897: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xf8744000  ! 2900: STX_R	stx	%r28, [%r17 + %r0]
cpu_intr_3_228:
	setx	0x37000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb60de13e  ! 2907: AND_I	and 	%r23, 0x013e, %r27
cpu_intr_3_229:
	setx	0x37000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf474c000  ! 2915: STX_R	stx	%r26, [%r19 + %r0]
T3_asi_reg_rd_126:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb604e184  ! 2918: ADD_I	add 	%r19, 0x0184, %r27
cpu_intr_3_230:
	setx	0x360013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a50020  ! 2921: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_231:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 24)
	.word 0xfaf4e13b  ! 2925: STXA_I	stxa	%r29, [%r19 + 0x013b] %asi
	.word 0xf6754000  ! 2927: STX_R	stx	%r27, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_156:
	mov	0x32, %r14
	.word 0xfaf38400  ! 2931: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf0240000  ! 2932: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf475a10d  ! 2935: STX_I	stx	%r26, [%r22 + 0x010d]
cpu_intr_3_232:
	setx	0x36033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_233:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_234:
	setx	0x34030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c61a6  ! 2942: ANDN_I	andn 	%r17, 0x01a6, %r31
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_235:
	setx	0x370134, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_127:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf0240000  ! 2948: STW_R	stw	%r24, [%r16 + %r0]
cpu_intr_3_236:
	setx	0x340112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf6ad8020  ! 2952: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xbf2cb001  ! 2953: SLLX_I	sllx	%r18, 0x0001, %r31
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_237:
	setx	0x340139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a58020  ! 2960: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf2a4c020  ! 2961: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
cpu_intr_3_238:
	setx	0x370035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 32)
	.word 0xfa2c4000  ! 2967: STB_R	stb	%r29, [%r17 + %r0]
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_TO_TL0
	.word 0xf034208e  ! 2971: STH_I	sth	%r24, [%r16 + 0x008e]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_157:
	mov	0x2, %r14
	.word 0xf2f38e80  ! 2975: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819829da  ! 2978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09da, %hpstate
	.word 0xfab4e1e9  ! 2981: STHA_I	stha	%r29, [%r19 + 0x01e9] %asi
	.word 0xb72c8000  ! 2982: SLL_R	sll 	%r18, %r0, %r27
cpu_intr_3_239:
	setx	0x360125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75c000  ! 2985: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xb03d6159  ! 2986: XNOR_I	xnor 	%r21, 0x0159, %r24
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfe25c000  ! 2989: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xf4758000  ! 2994: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbc058000  ! 2996: ADD_R	add 	%r22, %r0, %r30
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 34)
	.word 0xfef56046  ! 2998: STXA_I	stxa	%r31, [%r21 + 0x0046] %asi
	.word 0xf6a4213e  ! 3001: STWA_I	stwa	%r27, [%r16 + 0x013e] %asi
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 14)
	.word 0xf82d61e5  ! 3007: STB_I	stb	%r28, [%r21 + 0x01e5]
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 7)
	.word 0xb12c1000  ! 3009: SLLX_R	sllx	%r16, %r0, %r24
T3_asi_reg_rd_128:
	mov	0x14, %r14
	.word 0xfadb8e80  ! 3014: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb73cd000  ! 3015: SRAX_R	srax	%r19, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xb2c5c000  ! 3020: ADDCcc_R	addccc 	%r23, %r0, %r25
T3_asi_reg_wr_158:
	mov	0x13, %r14
	.word 0xf2f389e0  ! 3022: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_129:
	mov	0x2a, %r14
	.word 0xfedb84a0  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb2858000  ! 3026: ADDcc_R	addcc 	%r22, %r0, %r25
T3_asi_reg_wr_159:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 3027: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
cpu_intr_3_240:
	setx	0x350318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, f)
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, a)
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 7)
	.word 0xfe2cc000  ! 3042: STB_R	stb	%r31, [%r19 + %r0]
T3_asi_reg_rd_130:
	mov	0x28, %r14
	.word 0xfcdb8e80  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa2ca0da  ! 3049: STB_I	stb	%r29, [%r18 + 0x00da]
cpu_intr_3_241:
	setx	0x340126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_242:
	setx	0x37031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb425e0cc  ! 3052: SUB_I	sub 	%r23, 0x00cc, %r26
	.word 0xfa74a104  ! 3053: STX_I	stx	%r29, [%r18 + 0x0104]
	.word 0xf02de07a  ! 3055: STB_I	stb	%r24, [%r23 + 0x007a]
T3_asi_reg_wr_160:
	mov	0x20, %r14
	.word 0xf4f38e60  ! 3058: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_243:
	setx	0x36002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_244:
	setx	0x350227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35c000  ! 3061: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3069: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_161:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 3073: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 19)
	.word 0xf62d8000  ! 3077: STB_R	stb	%r27, [%r22 + %r0]
cpu_intr_3_245:
	setx	0x37013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_162:
	mov	0x23, %r14
	.word 0xfaf38400  ! 3084: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb73c8000  ! 3085: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb0b58000  ! 3086: ORNcc_R	orncc 	%r22, %r0, %r24
	.word 0xf0754000  ! 3087: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf6754000  ! 3088: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf4b4c020  ! 3089: STHA_R	stha	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_132:
	mov	0xf, %r14
	.word 0xfedb8400  ! 3090: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982998  ! 3091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_133:
	mov	0x9, %r14
	.word 0xf2db8e80  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb73dc000  ! 3099: SRA_R	sra 	%r23, %r0, %r27
T3_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 3101: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe754000  ! 3104: STX_R	stx	%r31, [%r21 + %r0]
T3_asi_reg_rd_135:
	mov	0xd, %r14
	.word 0xfedb84a0  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf6b4e05d  ! 3109: STHA_I	stha	%r27, [%r19 + 0x005d] %asi
	.word 0xbf2c9000  ! 3111: SLLX_R	sllx	%r18, %r0, %r31
	.word 0xf22ce160  ! 3114: STB_I	stb	%r25, [%r19 + 0x0160]
cpu_intr_3_246:
	setx	0x340130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_247:
	setx	0x340008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_163:
	mov	0x1c, %r14
	.word 0xfaf384a0  ! 3117: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_164:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 3122: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf8a44020  ! 3124: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
cpu_intr_3_248:
	setx	0x35013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684e005  ! 3129: ADDcc_I	addcc 	%r19, 0x0005, %r27
cpu_intr_3_249:
	setx	0x34032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 3)
	.word 0xb6b40000  ! 3139: ORNcc_R	orncc 	%r16, %r0, %r27
cpu_intr_3_250:
	setx	0x350136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24c000  ! 3142: STW_R	stw	%r30, [%r19 + %r0]
cpu_intr_3_251:
	setx	0x360235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d20d6  ! 3145: STB_I	stb	%r27, [%r20 + 0x00d6]
T3_asi_reg_rd_136:
	mov	0x9, %r14
	.word 0xfcdb8e60  ! 3148: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc342177  ! 3149: STH_I	sth	%r30, [%r16 + 0x0177]
cpu_intr_3_252:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_253:
	setx	0x370003, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 3155: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2754000  ! 3157: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfcb58020  ! 3161: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xb72d0000  ! 3162: SLL_R	sll 	%r20, %r0, %r27
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_254:
	setx	0x340301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a40020  ! 3166: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xfca4a0f9  ! 3168: STWA_I	stwa	%r30, [%r18 + 0x00f9] %asi
	.word 0xfea4200c  ! 3170: STWA_I	stwa	%r31, [%r16 + 0x000c] %asi
	.word 0xf2240000  ! 3171: STW_R	stw	%r25, [%r16 + %r0]
T3_asi_reg_rd_138:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3174: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, e)
	.word 0xfe240000  ! 3178: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xb80da083  ! 3179: AND_I	and 	%r22, 0x0083, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b5a1ec  ! 3182: STHA_I	stha	%r28, [%r22 + 0x01ec] %asi
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, c)
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b0a  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0a, %hpstate
T3_asi_reg_rd_139:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983bca  ! 3189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bca, %hpstate
	.word 0xf8758000  ! 3190: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xfe2c8000  ! 3191: STB_R	stb	%r31, [%r18 + %r0]
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf42c0000  ! 3198: STB_R	stb	%r26, [%r16 + %r0]
T3_asi_reg_rd_140:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 3199: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_165:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 3200: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb835c000  ! 3201: SUBC_R	orn 	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_3_255:
	setx	0x3b0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 29)
	.word 0xfc354000  ! 3208: STH_R	sth	%r30, [%r21 + %r0]
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_166:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 3212: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6254000  ! 3220: STW_R	stw	%r27, [%r21 + %r0]
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 20)
	.word 0xf4b44020  ! 3226: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xfcb4a1ff  ! 3228: STHA_I	stha	%r30, [%r18 + 0x01ff] %asi
T3_asi_reg_wr_167:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 3229: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf8ac4020  ! 3230: STBA_R	stba	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_168:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 3231: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf4a50020  ! 3233: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	.word 0xbe352027  ! 3235: SUBC_I	orn 	%r20, 0x0027, %r31
cpu_intr_3_256:
	setx	0x39022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0044000  ! 3237: ADD_R	add 	%r17, %r0, %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_169:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3245: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb235a1bd  ! 3250: ORN_I	orn 	%r22, 0x01bd, %r25
T3_asi_reg_wr_170:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 3252: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfe35a103  ! 3253: STH_I	sth	%r31, [%r22 + 0x0103]
	.word 0xbf643801  ! 3255: MOVcc_I	<illegal instruction>
T3_asi_reg_wr_171:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 3260: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 22)
	.word 0xf0b48020  ! 3270: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xf2ade17c  ! 3276: STBA_I	stba	%r25, [%r23 + 0x017c] %asi
cpu_intr_3_257:
	setx	0x38001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad21ef  ! 3279: STBA_I	stba	%r25, [%r20 + 0x01ef] %asi
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_172:
	mov	0x20, %r14
	.word 0xf0f38400  ! 3287: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_258:
	setx	0x390311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_259:
	setx	0x3b023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 22)
	.word 0xf2b42192  ! 3307: STHA_I	stha	%r25, [%r16 + 0x0192] %asi
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_141:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 27)
	.word 0xfe346101  ! 3321: STH_I	sth	%r31, [%r17 + 0x0101]
cpu_intr_3_260:
	setx	0x380229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb344000  ! 3324: SRL_R	srl 	%r17, %r0, %r29
	.word 0xf2ad0020  ! 3325: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	.word 0xfca42172  ! 3326: STWA_I	stwa	%r30, [%r16 + 0x0172] %asi
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 22)
	.word 0xbe1421c7  ! 3328: OR_I	or 	%r16, 0x01c7, %r31
T3_asi_reg_wr_173:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 3330: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf0340000  ! 3334: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf6750000  ! 3335: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf6358000  ! 3337: STH_R	sth	%r27, [%r22 + %r0]
cpu_intr_3_261:
	setx	0x390124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb694c000  ! 3342: ORcc_R	orcc 	%r19, %r0, %r27
	.word 0xf2256065  ! 3344: STW_I	stw	%r25, [%r21 + 0x0065]
cpu_intr_3_262:
	setx	0x3a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 32)
	.word 0xfc748000  ! 3352: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf8a4c020  ! 3353: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_142:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf8b56069  ! 3357: STHA_I	stha	%r28, [%r21 + 0x0069] %asi
	.word 0xb97d4400  ! 3359: MOVR_R	movre	%r21, %r0, %r28
	.word 0xfaad20a8  ! 3362: STBA_I	stba	%r29, [%r20 + 0x00a8] %asi
	.word 0xf0350000  ! 3363: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf62d612e  ! 3367: STB_I	stb	%r27, [%r21 + 0x012e]
cpu_intr_3_263:
	setx	0x39030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_264:
	setx	0x380104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2b5208c  ! 3373: STHA_I	stha	%r25, [%r20 + 0x008c] %asi
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 9)
	.word 0xf6adc020  ! 3377: STBA_R	stba	%r27, [%r23 + %r0] 0x01
T3_asi_reg_wr_174:
	mov	0x22, %r14
	.word 0xf2f384a0  ! 3379: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_175:
	mov	0xd, %r14
	.word 0xf8f389e0  ! 3380: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_176:
	mov	0x19, %r14
	.word 0xfcf38e80  ! 3388: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_177:
	mov	0xb, %r14
	.word 0xfcf38e60  ! 3389: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 32)
	.word 0xfaac4020  ! 3392: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xfeb44020  ! 3394: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	.word 0xf62d605e  ! 3398: STB_I	stb	%r27, [%r21 + 0x005e]
	.word 0xbe8c20f2  ! 3400: ANDcc_I	andcc 	%r16, 0x00f2, %r31
	.word 0xfa744000  ! 3403: STX_R	stx	%r29, [%r17 + %r0]
cpu_intr_3_265:
	setx	0x3b0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, e)
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, c)
	.word 0xf6244000  ! 3413: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xbd35b001  ! 3414: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xb750c000  ! 3415: RDPR_TT	rdpr	%tt, %r27
	.word 0xfa2d200d  ! 3417: STB_I	stb	%r29, [%r20 + 0x000d]
cpu_intr_3_266:
	setx	0x390308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_143:
	mov	0x27, %r14
	.word 0xfadb8400  ! 3421: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf0350000  ! 3422: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xfc25a18e  ! 3424: STW_I	stw	%r30, [%r22 + 0x018e]
	.word 0xbcac201c  ! 3430: ANDNcc_I	andncc 	%r16, 0x001c, %r30
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 11)
	.word 0xf075e1bf  ! 3435: STX_I	stx	%r24, [%r23 + 0x01bf]
	.word 0xf6b5c020  ! 3437: STHA_R	stha	%r27, [%r23 + %r0] 0x01
T3_asi_reg_wr_178:
	mov	0x8, %r14
	.word 0xf0f389e0  ! 3438: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, d)
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 2)
	.word 0xf02c0000  ! 3442: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf0a44020  ! 3445: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_144:
	mov	0x24, %r14
	.word 0xf2db8400  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfa74a0a6  ! 3449: STX_I	stx	%r29, [%r18 + 0x00a6]
	.word 0xfa24c000  ! 3450: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xb21c60fa  ! 3451: XOR_I	xor 	%r17, 0x00fa, %r25
	.word 0xfeac4020  ! 3454: STBA_R	stba	%r31, [%r17 + %r0] 0x01
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983800  ! 3455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1800, %hpstate
	.word 0xf8b58020  ! 3457: STHA_R	stha	%r28, [%r22 + %r0] 0x01
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_179:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 3466: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_267:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_180:
	mov	0x22, %r14
	.word 0xfef38e40  ! 3469: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 26)
	.word 0xb43c8000  ! 3473: XNOR_R	xnor 	%r18, %r0, %r26
	.word 0xb03c602b  ! 3474: XNOR_I	xnor 	%r17, 0x002b, %r24
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfca521ec  ! 3477: STWA_I	stwa	%r30, [%r20 + 0x01ec] %asi
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d50  ! 3480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
	.word 0xf8ac203b  ! 3482: STBA_I	stba	%r28, [%r16 + 0x003b] %asi
	.word 0xb6bd2054  ! 3483: XNORcc_I	xnorcc 	%r20, 0x0054, %r27
cpu_intr_3_268:
	setx	0x3a021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24e034  ! 3485: STW_I	stw	%r29, [%r19 + 0x0034]
	.word 0xf434e117  ! 3487: STH_I	sth	%r26, [%r19 + 0x0117]
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_269:
	setx	0x39031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_270:
	setx	0x3b0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ade010  ! 3493: STBA_I	stba	%r26, [%r23 + 0x0010] %asi
T3_asi_reg_wr_181:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 3494: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0ad4020  ! 3495: STBA_R	stba	%r24, [%r21 + %r0] 0x01
T3_asi_reg_wr_182:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 3496: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfcad6108  ! 3497: STBA_I	stba	%r30, [%r21 + 0x0108] %asi
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_271:
	setx	0x3a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb634e165  ! 3503: SUBC_I	orn 	%r19, 0x0165, %r27
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 24)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983940  ! 3506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1940, %hpstate
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf03460e5  ! 3511: STH_I	sth	%r24, [%r17 + 0x00e5]
cpu_intr_3_272:
	setx	0x3b021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_273:
	setx	0x390015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5c000  ! 3523: SUBcc_R	subcc 	%r23, %r0, %r30
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 11)
	.word 0xbf504000  ! 3528: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xfc2dc000  ! 3534: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfab5c020  ! 3535: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	.word 0xf0744000  ! 3536: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xfe258000  ! 3537: STW_R	stw	%r31, [%r22 + %r0]
T3_asi_reg_wr_183:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 3541: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_184:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 3544: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_185:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 3547: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf4a4e07c  ! 3550: STWA_I	stwa	%r26, [%r19 + 0x007c] %asi
	.word 0xf6756108  ! 3554: STX_I	stx	%r27, [%r21 + 0x0108]
	.word 0xf4a421c2  ! 3555: STWA_I	stwa	%r26, [%r16 + 0x01c2] %asi
	.word 0xf2ac2099  ! 3557: STBA_I	stba	%r25, [%r16 + 0x0099] %asi
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d50  ! 3567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
T3_asi_reg_wr_186:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 3569: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf8a48020  ! 3576: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_187:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 3578: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_274:
	setx	0x390224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635212c  ! 3581: STH_I	sth	%r27, [%r20 + 0x012c]
T3_asi_reg_wr_188:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 3583: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_189:
	mov	0xb, %r14
	.word 0xf6f389e0  ! 3585: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
cpu_intr_3_275:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_276:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1de027  ! 3595: XOR_I	xor 	%r23, 0x0027, %r30
cpu_intr_3_277:
	setx	0x3b0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c0000  ! 3597: SLL_R	sll 	%r16, %r0, %r24
T3_asi_reg_rd_145:
	mov	0x1b, %r14
	.word 0xfedb8e80  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_190:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 3599: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0258000  ! 3601: STW_R	stw	%r24, [%r22 + %r0]
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_146:
	mov	0xb, %r14
	.word 0xf8db84a0  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf0b5a048  ! 3605: STHA_I	stha	%r24, [%r22 + 0x0048] %asi
	.word 0xfc35e094  ! 3606: STH_I	sth	%r30, [%r23 + 0x0094]
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_278:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_147:
	mov	0x23, %r14
	.word 0xf6db8e60  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf63421b7  ! 3613: STH_I	sth	%r27, [%r16 + 0x01b7]
	.word 0xf8ac4020  ! 3615: STBA_R	stba	%r28, [%r17 + %r0] 0x01
T3_asi_reg_rd_148:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 3616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf624e1ee  ! 3617: STW_I	stw	%r27, [%r19 + 0x01ee]
T3_asi_reg_wr_191:
	mov	0x4, %r14
	.word 0xfef38e80  ! 3618: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_149:
	mov	0x4, %r14
	.word 0xfcdb8e80  ! 3619: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfaad4020  ! 3622: STBA_R	stba	%r29, [%r21 + %r0] 0x01
T3_asi_reg_rd_150:
	mov	0x12, %r14
	.word 0xf4db8e80  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_192:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 3627: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf024e188  ! 3630: STW_I	stw	%r24, [%r19 + 0x0188]
	ta	T_CHANGE_NONHPRIV
	.word 0xb5354000  ! 3636: SRL_R	srl 	%r21, %r0, %r26
T3_asi_reg_wr_193:
	mov	0x17, %r14
	.word 0xf4f38e80  ! 3639: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_279:
	setx	0x3c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_194:
	mov	0x1e, %r14
	.word 0xf4f38e60  ! 3642: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 4)
	.word 0xfc2d60ee  ! 3649: STB_I	stb	%r30, [%r21 + 0x00ee]
T3_asi_reg_wr_195:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 3651: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_151:
	mov	0x0, %r14
	.word 0xf8db8e80  ! 3655: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_wr_196:
	mov	0x2, %r14
	.word 0xfef38e60  ! 3660: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 3f)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_152:
	mov	0x33, %r14
	.word 0xf2db84a0  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_153:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6f560bb  ! 3671: STXA_I	stxa	%r27, [%r21 + 0x00bb] %asi
	.word 0xf0a4600c  ! 3672: STWA_I	stwa	%r24, [%r17 + 0x000c] %asi
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_280:
	setx	0x3e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba354000  ! 3677: ORN_R	orn 	%r21, %r0, %r29
	.word 0xf424a0c0  ! 3678: STW_I	stw	%r26, [%r18 + 0x00c0]
	.word 0xf4b5a116  ! 3681: STHA_I	stha	%r26, [%r22 + 0x0116] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_281:
	setx	0x3d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e52  ! 3685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
T3_asi_reg_wr_197:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 3687: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_282:
	setx	0x3f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfa740000  ! 3698: STX_R	stx	%r29, [%r16 + %r0]
T3_asi_reg_wr_198:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 3699: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb77dc400  ! 3700: MOVR_R	movre	%r23, %r0, %r27
	.word 0xfcade19f  ! 3701: STBA_I	stba	%r30, [%r23 + 0x019f] %asi
	.word 0xbcb42196  ! 3704: SUBCcc_I	orncc 	%r16, 0x0196, %r30
	.word 0xf6f46106  ! 3707: STXA_I	stxa	%r27, [%r17 + 0x0106] %asi
T3_asi_reg_wr_199:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 3709: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_283:
	setx	0x3c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ade135  ! 3712: STBA_I	stba	%r26, [%r23 + 0x0135] %asi
	.word 0xba95a143  ! 3717: ORcc_I	orcc 	%r22, 0x0143, %r29
	.word 0xb835c000  ! 3718: SUBC_R	orn 	%r23, %r0, %r28
	.word 0xfab42086  ! 3720: STHA_I	stha	%r29, [%r16 + 0x0086] %asi
cpu_intr_3_284:
	setx	0x3c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_200:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 3722: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_201:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 3723: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ec8  ! 3724: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec8, %hpstate
T3_asi_reg_wr_202:
	mov	0xe, %r14
	.word 0xf6f38e60  ! 3728: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf8b460fb  ! 3729: STHA_I	stha	%r28, [%r17 + 0x00fb] %asi
T3_asi_reg_rd_154:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_285:
	setx	0x3d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_286:
	setx	0x3c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 14)
	.word 0xfe240000  ! 3735: STW_R	stw	%r31, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6250000  ! 3738: STW_R	stw	%r27, [%r20 + %r0]
cpu_intr_3_287:
	setx	0x3c0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb40020  ! 3744: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_288:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_155:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 3748: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfab58020  ! 3750: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xf0a4a1e0  ! 3753: STWA_I	stwa	%r24, [%r18 + 0x01e0] %asi
T3_asi_reg_rd_156:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb68de166  ! 3756: ANDcc_I	andcc 	%r23, 0x0166, %r27
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, e)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 18)
	.word 0xfaf4605e  ! 3760: STXA_I	stxa	%r29, [%r17 + 0x005e] %asi
T3_asi_reg_rd_157:
	mov	0x32, %r14
	.word 0xf0db8e80  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf6a58020  ! 3762: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
cpu_intr_3_289:
	setx	0x3d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf4e030  ! 3766: STXA_I	stxa	%r29, [%r19 + 0x0030] %asi
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983fd2  ! 3769: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd2, %hpstate
	.word 0xfc356053  ! 3770: STH_I	sth	%r30, [%r21 + 0x0053]
T3_asi_reg_wr_203:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 3776: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xb8340000  ! 3778: ORN_R	orn 	%r16, %r0, %r28
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_158:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_290:
	setx	0x3d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c4000  ! 3786: STB_R	stb	%r28, [%r17 + %r0]
T3_asi_reg_rd_159:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf2a4c020  ! 3792: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_204:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 3799: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_291:
	setx	0x3c0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_161:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf0a4207d  ! 3803: STWA_I	stwa	%r24, [%r16 + 0x007d] %asi
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 28)
	.word 0xf6254000  ! 3809: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf2a4c020  ! 3812: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xf475c000  ! 3814: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf224e162  ! 3815: STW_I	stw	%r25, [%r19 + 0x0162]
T3_asi_reg_wr_205:
	mov	0x8, %r14
	.word 0xf4f38e60  ! 3818: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_162:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 3821: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_206:
	mov	0x13, %r14
	.word 0xf2f384a0  ! 3822: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb2ac6098  ! 3823: ANDNcc_I	andncc 	%r17, 0x0098, %r25
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_292:
	setx	0x3f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7345000  ! 3832: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xfc75215f  ! 3834: STX_I	stx	%r30, [%r20 + 0x015f]
T3_asi_reg_wr_207:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 3835: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_293:
	setx	0x3d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_163:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf4b44020  ! 3844: STHA_R	stha	%r26, [%r17 + %r0] 0x01
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 36)
	.word 0xb73d3001  ! 3848: SRAX_I	srax	%r20, 0x0001, %r27
	.word 0xfaac6187  ! 3851: STBA_I	stba	%r29, [%r17 + 0x0187] %asi
	.word 0xf6ada166  ! 3854: STBA_I	stba	%r27, [%r22 + 0x0166] %asi
cpu_intr_3_294:
	setx	0x3e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2750000  ! 3858: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xb7520000  ! 3860: RDPR_PIL	rdpr	%pil, %r27
	.word 0xb33cc000  ! 3867: SRA_R	sra 	%r19, %r0, %r25
	.word 0xf4a4c020  ! 3869: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_295:
	setx	0x3c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_296:
	setx	0x3e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfcad4020  ! 3880: STBA_R	stba	%r30, [%r21 + %r0] 0x01
	.word 0xf8f5a01e  ! 3884: STXA_I	stxa	%r28, [%r22 + 0x001e] %asi
cpu_intr_3_297:
	setx	0x3e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_298:
	setx	0x3e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_208:
	mov	0xe, %r14
	.word 0xf8f38e80  ! 3888: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, c)
	.word 0xfe74c000  ! 3894: STX_R	stx	%r31, [%r19 + %r0]
cpu_intr_3_299:
	setx	0x3f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6844000  ! 3896: ADDcc_R	addcc 	%r17, %r0, %r27
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d0a  ! 3897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0a, %hpstate
T3_asi_reg_wr_209:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 3899: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_210:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 3901: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_300:
	setx	0x3c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_301:
	setx	0x3d0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475c000  ! 3905: STX_R	stx	%r26, [%r23 + %r0]
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfcf5e10a  ! 3909: STXA_I	stxa	%r30, [%r23 + 0x010a] %asi
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 7)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982fd0  ! 3915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0xf024e15f  ! 3917: STW_I	stw	%r24, [%r19 + 0x015f]
cpu_intr_3_302:
	setx	0x3d0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a042  ! 3921: STXA_I	stxa	%r25, [%r18 + 0x0042] %asi
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 4)
	.word 0xf235a054  ! 3924: STH_I	sth	%r25, [%r22 + 0x0054]
	.word 0xba252068  ! 3930: SUB_I	sub 	%r20, 0x0068, %r29
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfaad4020  ! 3934: STBA_R	stba	%r29, [%r21 + %r0] 0x01
cpu_intr_3_303:
	setx	0x3e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_304:
	setx	0x3e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_164:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3939: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4a52070  ! 3942: STWA_I	stwa	%r26, [%r20 + 0x0070] %asi
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfc74e092  ! 3948: STX_I	stx	%r30, [%r19 + 0x0092]
cpu_intr_3_305:
	setx	0x3c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb2254000  ! 3955: SUB_R	sub 	%r21, %r0, %r25
	.word 0xf22c4000  ! 3956: STB_R	stb	%r25, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_306:
	setx	0x20010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92de001  ! 3962: SLL_I	sll 	%r23, 0x0001, %r28
cpu_intr_3_307:
	setx	0x3d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
cpu_intr_3_308:
	setx	0x3e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe250000  ! 3975: STW_R	stw	%r31, [%r20 + %r0]
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_165:
	mov	0x37, %r14
	.word 0xf8db84a0  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfeb54020  ! 3981: STHA_R	stha	%r31, [%r21 + %r0] 0x01
	.word 0xf8b5e1d7  ! 3988: STHA_I	stha	%r28, [%r23 + 0x01d7] %asi
T3_asi_reg_rd_166:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 3989: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf424c000  ! 3990: STW_R	stw	%r26, [%r19 + %r0]
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfa744000  ! 3994: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf87421fc  ! 3995: STX_I	stx	%r28, [%r16 + 0x01fc]
T3_asi_reg_wr_211:
	mov	0x27, %r14
	.word 0xf8f38400  ! 3997: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_309:
	setx	0x3d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc6143  ! 4003: XNORcc_I	xnorcc 	%r17, 0x0143, %r31
T3_asi_reg_wr_212:
	mov	0x15, %r14
	.word 0xf0f38400  ! 4004: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_167:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf62d8000  ! 4011: STB_R	stb	%r27, [%r22 + %r0]
cpu_intr_3_310:
	setx	0x3d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbc1c616c  ! 4017: XOR_I	xor 	%r17, 0x016c, %r30
	.word 0xfc25e08c  ! 4019: STW_I	stw	%r30, [%r23 + 0x008c]
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 23)
	.word 0xa1902000  ! 4022: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf4240000  ! 4025: STW_R	stw	%r26, [%r16 + %r0]
T3_asi_reg_rd_169:
	mov	0x1d, %r14
	.word 0xfadb84a0  ! 4027: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb0b4a117  ! 4034: SUBCcc_I	orncc 	%r18, 0x0117, %r24
	.word 0xfa350000  ! 4035: STH_R	sth	%r29, [%r20 + %r0]
T3_asi_reg_wr_213:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 4037: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfa358000  ! 4038: STH_R	sth	%r29, [%r22 + %r0]
cpu_intr_3_311:
	setx	0x3e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc4a163  ! 4040: ADDCcc_I	addccc 	%r18, 0x0163, %r30
	.word 0xfe750000  ! 4042: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb21d610e  ! 4045: XOR_I	xor 	%r21, 0x010e, %r25
	.word 0xfa24c000  ! 4047: STW_R	stw	%r29, [%r19 + %r0]
cpu_intr_3_312:
	setx	0x3e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_313:
	setx	0x3d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42dc000  ! 4051: STB_R	stb	%r26, [%r23 + %r0]
cpu_intr_3_314:
	setx	0x3c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc84a004  ! 4053: ADDcc_I	addcc 	%r18, 0x0004, %r30
cpu_intr_3_315:
	setx	0x3d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5c020  ! 4057: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xfa2d2051  ! 4058: STB_I	stb	%r29, [%r20 + 0x0051]
cpu_intr_3_316:
	setx	0x3d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_170:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_317:
	setx	0x3f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, d)
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 38)
	.word 0xfc24e079  ! 4073: STW_I	stw	%r30, [%r19 + 0x0079]
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_214:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 4078: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf6ac8020  ! 4080: STBA_R	stba	%r27, [%r18 + %r0] 0x01
T3_asi_reg_rd_171:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 4082: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_318:
	setx	0x3e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb6940000  ! 4088: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xb6b50000  ! 4089: SUBCcc_R	orncc 	%r20, %r0, %r27
	.word 0xa1902001  ! 4090: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T3_asi_reg_rd_172:
	mov	0x29, %r14
	.word 0xf6db8e60  ! 4091: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb8b4a06b  ! 4092: ORNcc_I	orncc 	%r18, 0x006b, %r28
cpu_intr_3_319:
	setx	0x400236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_215:
	mov	0x14, %r14
	.word 0xfef384a0  ! 4095: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_173:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_320:
	setx	0x430214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 4099: STW_R	stw	%r26, [%r19 + %r0]
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 18)
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c4a  ! 4103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
cpu_intr_3_321:
	setx	0x400128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_216:
	mov	0xd, %r14
	.word 0xfaf384a0  ! 4105: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb93cb001  ! 4107: SRAX_I	srax	%r18, 0x0001, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xfe3561ed  ! 4109: STH_I	sth	%r31, [%r21 + 0x01ed]
	.word 0xf6a56012  ! 4113: STWA_I	stwa	%r27, [%r21 + 0x0012] %asi
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6b4c020  ! 4117: STHA_R	stha	%r27, [%r19 + %r0] 0x01
T3_asi_reg_rd_174:
	mov	0x6, %r14
	.word 0xf8db84a0  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf825a061  ! 4119: STW_I	stw	%r28, [%r22 + 0x0061]
cpu_intr_3_322:
	setx	0x400116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 2d)
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b82  ! 4123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
	.word 0xf83561d6  ! 4124: STH_I	sth	%r28, [%r21 + 0x01d6]
T3_asi_reg_wr_217:
	mov	0x18, %r14
	.word 0xf0f38400  ! 4126: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2ade03a  ! 4127: STBA_I	stba	%r25, [%r23 + 0x003a] %asi
T3_asi_reg_rd_175:
	mov	0x8, %r14
	.word 0xf6db89e0  ! 4128: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_rd_176:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_177:
	mov	0x24, %r14
	.word 0xf0db8e40  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc348000  ! 4133: STH_R	sth	%r30, [%r18 + %r0]
T3_asi_reg_rd_178:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf22dc000  ! 4142: STB_R	stb	%r25, [%r23 + %r0]
cpu_intr_3_323:
	setx	0x2022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_324:
	setx	0x430311, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_218:
	mov	0x21, %r14
	.word 0xf0f38e60  ! 4149: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_325:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_326:
	setx	0x43011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb02d8000  ! 4172: ANDN_R	andn 	%r22, %r0, %r24
T3_asi_reg_rd_179:
	mov	0x13, %r14
	.word 0xf2db8e60  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 0)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982a4a  ! 4179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 25)
	.word 0x8f902002  ! 4183: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_TO_TL1
	.word 0xfea46144  ! 4188: STWA_I	stwa	%r31, [%r17 + 0x0144] %asi
T3_asi_reg_wr_219:
	mov	0x1, %r14
	.word 0xf4f38400  ! 4189: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf6250000  ! 4190: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfca4c020  ! 4192: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_wr_220:
	mov	0xc, %r14
	.word 0xf2f384a0  ! 4195: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf234207c  ! 4201: STH_I	sth	%r25, [%r16 + 0x007c]
	.word 0xfe2ca092  ! 4202: STB_I	stb	%r31, [%r18 + 0x0092]
cpu_intr_3_327:
	setx	0x40033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82dc000  ! 4210: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfe34e1b4  ! 4216: STH_I	sth	%r31, [%r19 + 0x01b4]
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 22)
	.word 0xf0b5c020  ! 4220: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xf0ac4020  ! 4222: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xfaac8020  ! 4223: STBA_R	stba	%r29, [%r18 + %r0] 0x01
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 18)
	.word 0x8594a1d2  ! 4226: WRPR_TSTATE_I	wrpr	%r18, 0x01d2, %tstate
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983958  ! 4229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1958, %hpstate
	.word 0xfab5a098  ! 4230: STHA_I	stha	%r29, [%r22 + 0x0098] %asi
cpu_intr_3_328:
	setx	0x41000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 25)
	.word 0xf6b5c020  ! 4235: STHA_R	stha	%r27, [%r23 + %r0] 0x01
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 8)
	.word 0xf6b4e11f  ! 4240: STHA_I	stha	%r27, [%r19 + 0x011f] %asi
	.word 0xf025202c  ! 4243: STW_I	stw	%r24, [%r20 + 0x002c]
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 32)
	.word 0xfcb4612a  ! 4248: STHA_I	stha	%r30, [%r17 + 0x012a] %asi
T3_asi_reg_wr_221:
	mov	0x29, %r14
	.word 0xfef38400  ! 4249: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb095e1fe  ! 4250: ORcc_I	orcc 	%r23, 0x01fe, %r24
	.word 0xf625e1ba  ! 4252: STW_I	stw	%r27, [%r23 + 0x01ba]
	.word 0xfc240000  ! 4253: STW_R	stw	%r30, [%r16 + %r0]
cpu_intr_3_329:
	setx	0x430124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_330:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62ca06a  ! 4257: ANDN_I	andn 	%r18, 0x006a, %r27
	.word 0xf0a48020  ! 4259: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xfcf46013  ! 4260: STXA_I	stxa	%r30, [%r17 + 0x0013] %asi
	.word 0xf635a07e  ! 4261: STH_I	sth	%r27, [%r22 + 0x007e]
cpu_intr_3_331:
	setx	0x400128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bda01d  ! 4263: XNORcc_I	xnorcc 	%r22, 0x001d, %r25
	.word 0xf2a58020  ! 4264: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xba450000  ! 4265: ADDC_R	addc 	%r20, %r0, %r29
T3_asi_reg_wr_222:
	mov	0x33, %r14
	.word 0xf2f384a0  ! 4266: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 4)
	.word 0xfc34c000  ! 4268: STH_R	sth	%r30, [%r19 + %r0]
cpu_intr_3_332:
	setx	0x42033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25a143  ! 4271: STW_I	stw	%r29, [%r22 + 0x0143]
	.word 0xfead0020  ! 4273: STBA_R	stba	%r31, [%r20 + %r0] 0x01
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6a54020  ! 4277: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xfcac6185  ! 4278: STBA_I	stba	%r30, [%r17 + 0x0185] %asi
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 2)
	.word 0xfab420b8  ! 4280: STHA_I	stha	%r29, [%r16 + 0x00b8] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_180:
	mov	0x3c3, %r14
	.word 0xf0db8400  ! 4283: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_333:
	setx	0x410207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_181:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf0744000  ! 4288: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf8b5c020  ! 4289: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xf6aca089  ! 4290: STBA_I	stba	%r27, [%r18 + 0x0089] %asi
	.word 0xb2a4a1fd  ! 4291: SUBcc_I	subcc 	%r18, 0x01fd, %r25
T3_asi_reg_rd_182:
	mov	0xc, %r14
	.word 0xfadb89e0  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_334:
	setx	0x40031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d8000  ! 4295: STB_R	stb	%r31, [%r22 + %r0]
cpu_intr_3_335:
	setx	0x43011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_183:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_184:
	mov	0xf, %r14
	.word 0xf2db8e60  ! 4300: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb0058000  ! 4306: ADD_R	add 	%r22, %r0, %r24
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_336:
	setx	0x430116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 4317: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xb4bd6064  ! 4318: XNORcc_I	xnorcc 	%r21, 0x0064, %r26
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_337:
	setx	0x43013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2748000  ! 4325: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xf4744000  ! 4330: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xfab5a023  ! 4331: STHA_I	stha	%r29, [%r22 + 0x0023] %asi
	.word 0xf27420f6  ! 4335: STX_I	stx	%r25, [%r16 + 0x00f6]
	.word 0xf22c8000  ! 4336: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf6744000  ! 4337: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xb60d0000  ! 4338: AND_R	and 	%r20, %r0, %r27
	.word 0xf0340000  ! 4339: STH_R	sth	%r24, [%r16 + %r0]
cpu_intr_3_338:
	setx	0x43010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0750000  ! 4343: STX_R	stx	%r24, [%r20 + %r0]
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_339:
	setx	0x41031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a40020  ! 4354: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xfaac8020  ! 4355: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf62de19b  ! 4359: STB_I	stb	%r27, [%r23 + 0x019b]
	.word 0xfcad8020  ! 4361: STBA_R	stba	%r30, [%r22 + %r0] 0x01
cpu_intr_3_340:
	setx	0x400316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 4367: STH_R	sth	%r29, [%r17 + %r0]
T3_asi_reg_rd_185:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_186:
	mov	0x18, %r14
	.word 0xfedb8e60  ! 4369: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf2240000  ! 4371: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfc744000  ! 4373: STX_R	stx	%r30, [%r17 + %r0]
T3_asi_reg_rd_187:
	mov	0x2b, %r14
	.word 0xfadb8e60  ! 4378: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0b54020  ! 4379: STHA_R	stha	%r24, [%r21 + %r0] 0x01
	.word 0xf4ac4020  ! 4384: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf875e13c  ! 4385: STX_I	stx	%r28, [%r23 + 0x013c]
T3_asi_reg_wr_223:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 4388: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_341:
	setx	0x410219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbb7d2401  ! 4393: MOVR_I	movre	%r20, 0x1, %r29
T3_asi_reg_rd_188:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_189:
	mov	0x1b, %r14
	.word 0xf6db8400  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf82c4000  ! 4400: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfa3460fd  ! 4401: STH_I	sth	%r29, [%r17 + 0x00fd]
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 37)
	.word 0xb77dc400  ! 4405: MOVR_R	movre	%r23, %r0, %r27
T3_asi_reg_rd_190:
	mov	0xc, %r14
	.word 0xf0db84a0  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_rd_191:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfcf461af  ! 4409: STXA_I	stxa	%r30, [%r17 + 0x01af] %asi
	.word 0xf624e09d  ! 4410: STW_I	stw	%r27, [%r19 + 0x009d]
T3_asi_reg_rd_192:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_224:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4416: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf825c000  ! 4418: STW_R	stw	%r28, [%r23 + %r0]
T3_asi_reg_wr_225:
	mov	0xa, %r14
	.word 0xf0f38400  ! 4420: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_wr_226:
	mov	0xe, %r14
	.word 0xfaf384a0  ! 4425: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819839d0  ! 4431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
T3_asi_reg_wr_227:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 4432: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_wr_228:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4433: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb550c000  ! 4434: RDPR_TT	rdpr	%tt, %r26
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_342:
	setx	0x400115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_343:
	setx	0x410319, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf82d0000  ! 4442: STB_R	stb	%r28, [%r20 + %r0]
cpu_intr_3_344:
	setx	0x42022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_345:
	setx	0x410315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_229:
	mov	0x5, %r14
	.word 0xfef38e60  ! 4448: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xba1cc000  ! 4449: XOR_R	xor 	%r19, %r0, %r29
T3_asi_reg_rd_193:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_194:
	mov	0x4, %r14
	.word 0xf2db89e0  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf8a5e1b8  ! 4456: STWA_I	stwa	%r28, [%r23 + 0x01b8] %asi
	.word 0xf675613e  ! 4465: STX_I	stx	%r27, [%r21 + 0x013e]
	.word 0xfc35e10a  ! 4471: STH_I	sth	%r30, [%r23 + 0x010a]
cpu_intr_3_346:
	setx	0x43001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9c604a  ! 4474: XORcc_I	xorcc 	%r17, 0x004a, %r29
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d52  ! 4475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d52, %hpstate
	.word 0xbaace064  ! 4479: ANDNcc_I	andncc 	%r19, 0x0064, %r29
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 29)
	.word 0xfc2d4000  ! 4483: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf0a5e1f1  ! 4484: STWA_I	stwa	%r24, [%r23 + 0x01f1] %asi
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 38)
	.word 0xf434e17c  ! 4488: STH_I	sth	%r26, [%r19 + 0x017c]
cpu_intr_3_347:
	setx	0x420322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4a1da  ! 4490: STHA_I	stha	%r27, [%r18 + 0x01da] %asi
	.word 0xb4ad6061  ! 4493: ANDNcc_I	andncc 	%r21, 0x0061, %r26
T3_asi_reg_wr_230:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 4494: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_348:
	setx	0x420306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c58000  ! 4501: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xbb34a001  ! 4502: SRL_I	srl 	%r18, 0x0001, %r29
T3_asi_reg_wr_231:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 4503: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 11)
	.word 0xf22c6120  ! 4506: STB_I	stb	%r25, [%r17 + 0x0120]
	.word 0xb22d0000  ! 4510: ANDN_R	andn 	%r20, %r0, %r25
	.word 0xf4ac4020  ! 4512: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf8742049  ! 4513: STX_I	stx	%r28, [%r16 + 0x0049]
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf87421bd  ! 4522: STX_I	stx	%r28, [%r16 + 0x01bd]
cpu_intr_3_349:
	setx	0x430331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x40002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a00  ! 4526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a00, %hpstate
	.word 0xf025e0f6  ! 4527: STW_I	stw	%r24, [%r23 + 0x00f6]
	.word 0x89952166  ! 4528: WRPR_TICK_I	wrpr	%r20, 0x0166, %tick
cpu_intr_3_351:
	setx	0x400210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5206b  ! 4530: STHA_I	stha	%r27, [%r20 + 0x006b] %asi
cpu_intr_3_352:
	setx	0x420234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_232:
	mov	0x4, %r14
	.word 0xf6f38e80  ! 4535: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_wr_233:
	mov	0x13, %r14
	.word 0xf8f384a0  ! 4537: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983988  ! 4538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1988, %hpstate
	.word 0xfa2d61cf  ! 4539: STB_I	stb	%r29, [%r21 + 0x01cf]
T3_asi_reg_wr_234:
	mov	0x6, %r14
	.word 0xf0f38e40  ! 4547: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 16)
	.word 0xf0b5a0a2  ! 4559: STHA_I	stha	%r24, [%r22 + 0x00a2] %asi
cpu_intr_3_353:
	setx	0x450326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_354:
	setx	0x470217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf8ac4020  ! 4564: STBA_R	stba	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_235:
	mov	0x2d, %r14
	.word 0xf6f38e80  ! 4566: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfcad20f4  ! 4568: STBA_I	stba	%r30, [%r20 + 0x00f4] %asi
	.word 0xfab40020  ! 4570: STHA_R	stha	%r29, [%r16 + %r0] 0x01
cpu_intr_3_355:
	setx	0x44002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa250000  ! 4575: STW_R	stw	%r29, [%r20 + %r0]
cpu_intr_3_356:
	setx	0x46003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_357:
	setx	0x470221, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983810  ! 4584: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
	.word 0xbeb4a18c  ! 4586: SUBCcc_I	orncc 	%r18, 0x018c, %r31
	.word 0xb6152073  ! 4587: OR_I	or 	%r20, 0x0073, %r27
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_195:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6348000  ! 4592: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xfef4e0e3  ! 4593: STXA_I	stxa	%r31, [%r19 + 0x00e3] %asi
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_358:
	setx	0x470315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf0a5e152  ! 4604: STWA_I	stwa	%r24, [%r23 + 0x0152] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_236:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 4615: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_359:
	setx	0x450302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2de081  ! 4621: STB_I	stb	%r31, [%r23 + 0x0081]
	.word 0xfca46054  ! 4622: STWA_I	stwa	%r30, [%r17 + 0x0054] %asi
cpu_intr_3_360:
	setx	0x470003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_361:
	setx	0x460224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024c000  ! 4625: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb09461be  ! 4626: ORcc_I	orcc 	%r17, 0x01be, %r24
cpu_intr_3_362:
	setx	0x45000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d21fd  ! 4628: STB_I	stb	%r27, [%r20 + 0x01fd]
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 39)
	.word 0xf4254000  ! 4631: STW_R	stw	%r26, [%r21 + %r0]
T3_asi_reg_wr_237:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4635: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_196:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4637: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_238:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 4638: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_363:
	setx	0x470238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83da000  ! 4643: XNOR_I	xnor 	%r22, 0x0000, %r28
	.word 0xfa7421ca  ! 4645: STX_I	stx	%r29, [%r16 + 0x01ca]
	.word 0xf8b5c020  ! 4647: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_239:
	mov	0x1a, %r14
	.word 0xf4f38400  ! 4652: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfe350000  ! 4653: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xfca48020  ! 4656: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
T3_asi_reg_rd_197:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 4658: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf6a54020  ! 4659: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0a58020  ! 4664: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
T3_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_364:
	setx	0x45001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_199:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfea54020  ! 4671: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b40020  ! 4676: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0xfca40020  ! 4677: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xf42da180  ! 4678: STB_I	stb	%r26, [%r22 + 0x0180]
	.word 0xf4ac21e3  ! 4681: STBA_I	stba	%r26, [%r16 + 0x01e3] %asi
cpu_intr_3_365:
	setx	0x440108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_366:
	setx	0x46031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_367:
	setx	0x47011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_368:
	setx	0x440336, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_240:
	mov	0x31, %r14
	.word 0xf6f38e60  ! 4688: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb4a4e1e4  ! 4689: SUBcc_I	subcc 	%r19, 0x01e4, %r26
	.word 0xf8acc020  ! 4690: STBA_R	stba	%r28, [%r19 + %r0] 0x01
cpu_intr_3_369:
	setx	0x47021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac8020  ! 4692: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_200:
	mov	0xe, %r14
	.word 0xf6db8400  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	.word 0xbe8d2073  ! 4699: ANDcc_I	andcc 	%r20, 0x0073, %r31
	.word 0xf6b4c020  ! 4700: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xb23561cd  ! 4701: ORN_I	orn 	%r21, 0x01cd, %r25
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf024c000  ! 4705: STW_R	stw	%r24, [%r19 + %r0]
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 10)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfe354000  ! 4710: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf4b5617f  ! 4712: STHA_I	stha	%r26, [%r21 + 0x017f] %asi
	.word 0xf82d0000  ! 4713: STB_R	stb	%r28, [%r20 + %r0]
T3_asi_reg_rd_201:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 4714: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_370:
	setx	0x470115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8356102  ! 4721: STH_I	sth	%r28, [%r21 + 0x0102]
	.word 0xf0354000  ! 4722: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xfc248000  ! 4724: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf2a42035  ! 4728: STWA_I	stwa	%r25, [%r16 + 0x0035] %asi
T3_asi_reg_wr_241:
	mov	0x22, %r14
	.word 0xf6f38e60  ! 4729: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_202:
	mov	0x2d, %r14
	.word 0xfedb8400  ! 4733: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_203:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9504000  ! 4741: RDPR_TNPC	rdpr	%tnpc, %r28
cpu_intr_3_371:
	setx	0x46001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_372:
	setx	0x47010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_242:
	mov	0x15, %r14
	.word 0xf8f38e60  ! 4748: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfe75e08d  ! 4750: STX_I	stx	%r31, [%r23 + 0x008d]
	.word 0xf0f421c4  ! 4754: STXA_I	stxa	%r24, [%r16 + 0x01c4] %asi
cpu_intr_3_373:
	setx	0x460004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b42119  ! 4757: STHA_I	stha	%r26, [%r16 + 0x0119] %asi
	.word 0xba2de1ab  ! 4759: ANDN_I	andn 	%r23, 0x01ab, %r29
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_243:
	mov	0x2a, %r14
	.word 0xfcf38e40  ! 4762: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_244:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 4763: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_374:
	setx	0x440121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 31)
	.word 0xf835a0b0  ! 4768: STH_I	sth	%r28, [%r22 + 0x00b0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d4000  ! 4771: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf024210d  ! 4774: STW_I	stw	%r24, [%r16 + 0x010d]
T3_asi_reg_wr_245:
	mov	0x37, %r14
	.word 0xfaf384a0  ! 4777: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_205:
	mov	0x25, %r14
	.word 0xf8db8400  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 37)
	.word 0xf2ace0b2  ! 4781: STBA_I	stba	%r25, [%r19 + 0x00b2] %asi
	.word 0xf0744000  ! 4782: STX_R	stx	%r24, [%r17 + %r0]
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_375:
	setx	0x470328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d6189  ! 4785: STB_I	stb	%r30, [%r21 + 0x0189]
	.word 0xf224206d  ! 4787: STW_I	stw	%r25, [%r16 + 0x006d]
	.word 0xb2ace055  ! 4788: ANDNcc_I	andncc 	%r19, 0x0055, %r25
T3_asi_reg_rd_206:
	mov	0x1, %r14
	.word 0xfcdb8400  ! 4789: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_376:
	setx	0x45000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_377:
	setx	0x46022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c8000  ! 4800: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xbd3c3001  ! 4802: SRAX_I	srax	%r16, 0x0001, %r30
T3_asi_reg_wr_246:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 4806: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_247:
	mov	0x14, %r14
	.word 0xf2f38e80  ! 4809: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_378:
	setx	0x45030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 34)
	.word 0xfca40020  ! 4820: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
cpu_intr_3_379:
	setx	0x45033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_380:
	setx	0x46033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02520b1  ! 4826: SUB_I	sub 	%r20, 0x00b1, %r24
	.word 0xbe244000  ! 4828: SUB_R	sub 	%r17, %r0, %r31
T3_asi_reg_rd_207:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_381:
	setx	0x450004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a46156  ! 4832: STWA_I	stwa	%r24, [%r17 + 0x0156] %asi
T3_asi_reg_wr_248:
	mov	0xa, %r14
	.word 0xf6f38e60  ! 4833: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_208:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfe35c000  ! 4837: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xb614c000  ! 4839: OR_R	or 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_209:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_249:
	mov	0x15, %r14
	.word 0xf8f38e60  ! 4843: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_210:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 4844: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_382:
	setx	0x440207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48d0000  ! 4856: ANDcc_R	andcc 	%r20, %r0, %r26
cpu_intr_3_383:
	setx	0x46030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4a07d  ! 4858: STHA_I	stha	%r28, [%r18 + 0x007d] %asi
T3_asi_reg_rd_211:
	mov	0x6, %r14
	.word 0xf0db84a0  ! 4861: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf225a0e9  ! 4862: STW_I	stw	%r25, [%r22 + 0x00e9]
cpu_intr_3_384:
	setx	0x47031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_212:
	mov	0xd, %r14
	.word 0xfcdb8e80  ! 4867: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_385:
	setx	0x470216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_250:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 4877: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 37)
	.word 0xb21d0000  ! 4881: XOR_R	xor 	%r20, %r0, %r25
T3_asi_reg_rd_213:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_251:
	mov	0x21, %r14
	.word 0xf2f389e0  ! 4885: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_wr_252:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 4889: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_3_386:
	setx	0x44021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad0020  ! 4897: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf2240000  ! 4901: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf0244000  ! 4902: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf6350000  ! 4904: STH_R	sth	%r27, [%r20 + %r0]
T3_asi_reg_rd_214:
	mov	0x20, %r14
	.word 0xf6db8e60  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_387:
	setx	0x470312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_215:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfaade10d  ! 4909: STBA_I	stba	%r29, [%r23 + 0x010d] %asi
	.word 0xbb520000  ! 4911: RDPR_PIL	<illegal instruction>
	.word 0xf42d0000  ! 4915: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf4356109  ! 4916: STH_I	sth	%r26, [%r21 + 0x0109]
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 6)
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d12  ! 4921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d12, %hpstate
T3_asi_reg_wr_253:
	mov	0x1, %r14
	.word 0xf4f389e0  ! 4923: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_388:
	setx	0x30222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d8000  ! 4927: SLL_R	sll 	%r22, %r0, %r28
cpu_intr_3_389:
	setx	0x450026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d8000  ! 4932: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfab54020  ! 4939: STHA_R	stha	%r29, [%r21 + %r0] 0x01
T3_asi_reg_wr_254:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 4941: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb73c7001  ! 4942: SRAX_I	srax	%r17, 0x0001, %r27
T3_asi_reg_rd_216:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 4943: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_390:
	setx	0x440006, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982892  ! 4949: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
cpu_intr_3_391:
	setx	0x450108, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_255:
	mov	0x2a, %r14
	.word 0xf4f38e80  ! 4956: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0x819520bc  ! 4957: WRPR_TPC_I	wrpr	%r20, 0x00bc, %tpc
	.word 0xfe34c000  ! 4958: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf234e1b9  ! 4960: STH_I	sth	%r25, [%r19 + 0x01b9]
	.word 0xfc35605e  ! 4962: STH_I	sth	%r30, [%r21 + 0x005e]
	.word 0xb53c2001  ! 4963: SRA_I	sra 	%r16, 0x0001, %r26
	.word 0xb1540000  ! 4965: RDPR_GL	rdpr	%-, %r24
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_wr_256:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 4969: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf2b521c6  ! 4970: STHA_I	stha	%r25, [%r20 + 0x01c6] %asi
	.word 0xf07560f1  ! 4971: STX_I	stx	%r24, [%r21 + 0x00f1]
	.word 0xf8754000  ! 4972: STX_R	stx	%r28, [%r21 + %r0]
cpu_intr_3_392:
	setx	0x450109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5605a  ! 4974: STXA_I	stxa	%r28, [%r21 + 0x005a] %asi
	.word 0xbc948000  ! 4975: ORcc_R	orcc 	%r18, %r0, %r30
	.word 0xf475e17d  ! 4978: STX_I	stx	%r26, [%r23 + 0x017d]
T3_asi_reg_rd_217:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb4848000  ! 4981: ADDcc_R	addcc 	%r18, %r0, %r26
cpu_intr_3_393:
	setx	0x450011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad0020  ! 4987: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xf824a013  ! 4988: STW_I	stw	%r28, [%r18 + 0x0013]
	.word 0xf6258000  ! 4989: STW_R	stw	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xbe94a128  ! 4994: ORcc_I	orcc 	%r18, 0x0128, %r31
	ta	T_CHANGE_HPRIV
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
	.word 0xf844a130  ! 1: LDSW_I	ldsw	[%r18 + 0x0130], %r28
cpu_intr_2_0:
	setx	0x190227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_1:
	setx	0x1a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6d48020  ! 7: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xfe94e1b3  ! 8: LDUHA_I	lduha	[%r19, + 0x01b3] %asi, %r31
T2_asi_reg_wr_0:
	mov	0x1c, %r14
	.word 0xfef384a0  ! 10: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_TO_TL0
	.word 0xb13ce001  ! 16: SRA_I	sra 	%r19, 0x0001, %r24
T2_asi_reg_rd_0:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 8)
	.word 0xb6a58000  ! 26: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xf454c000  ! 27: LDSH_R	ldsh	[%r19 + %r0], %r26
T2_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 30: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb034e070  ! 33: SUBC_I	orn 	%r19, 0x0070, %r24
	.word 0xfe4c6025  ! 35: LDSB_I	ldsb	[%r17 + 0x0025], %r31
	.word 0xfe8c4020  ! 40: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xf404e155  ! 41: LDUW_I	lduw	[%r19 + 0x0155], %r26
T2_asi_reg_wr_1:
	mov	0x17, %r14
	.word 0xf4f38e60  ! 43: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_2:
	setx	0x1e010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_2:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 46: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5354000  ! 49: SRL_R	srl 	%r21, %r0, %r26
cpu_intr_2_3:
	setx	0x1f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_3:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 55: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_4:
	mov	0x9, %r14
	.word 0xfcf38e80  ! 58: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 62: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 36)
	.word 0xfc544000  ! 66: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf25560d8  ! 68: LDSH_I	ldsh	[%r21 + 0x00d8], %r25
	.word 0xbe85c000  ! 69: ADDcc_R	addcc 	%r23, %r0, %r31
	.word 0xfa05a116  ! 70: LDUW_I	lduw	[%r22 + 0x0116], %r29
	.word 0xfe1460c7  ! 71: LDUH_I	lduh	[%r17 + 0x00c7], %r31
cpu_intr_2_4:
	setx	0x1e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_5:
	setx	0x1e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadda0f6  ! 77: LDXA_I	ldxa	[%r22, + 0x00f6] %asi, %r29
	ta	T_CHANGE_HPRIV
cpu_intr_2_6:
	setx	0x1d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd34a001  ! 83: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xfa458000  ! 85: LDSW_R	ldsw	[%r22 + %r0], %r29
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_6:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 88: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe958020  ! 93: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
T2_asi_reg_wr_7:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 94: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c08  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c08, %hpstate
T2_asi_reg_wr_8:
	mov	0x22, %r14
	.word 0xfef38400  ! 98: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_9:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 102: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_7:
	setx	0x1f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d0000  ! 107: XORcc_R	xorcc 	%r20, %r0, %r29
	.word 0xf4c5c020  ! 108: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
	.word 0xb4a4601d  ! 113: SUBcc_I	subcc 	%r17, 0x001d, %r26
	.word 0xb43da02b  ! 115: XNOR_I	xnor 	%r22, 0x002b, %r26
T2_asi_reg_rd_2:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 116: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfe4de17a  ! 121: LDSB_I	ldsb	[%r23 + 0x017a], %r31
	.word 0xf40d8000  ! 126: LDUB_R	ldub	[%r22 + %r0], %r26
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 34)
	.word 0xbc2c4000  ! 130: ANDN_R	andn 	%r17, %r0, %r30
T2_asi_reg_wr_10:
	mov	0x14, %r14
	.word 0xfaf38e80  ! 131: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_3:
	mov	0x18, %r14
	.word 0xf4db8400  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e82  ! 134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e82, %hpstate
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_4:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_8:
	setx	0x1f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedde00b  ! 143: LDXA_I	ldxa	[%r23, + 0x000b] %asi, %r31
T2_asi_reg_rd_5:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_9:
	setx	0x1e0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_10:
	setx	0x1d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_11:
	mov	0x28, %r14
	.word 0xfcf38e80  ! 151: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_11:
	setx	0x1f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0844020  ! 154: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_12:
	setx	0x10301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_12:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 167: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf8540000  ! 171: LDSH_R	ldsh	[%r16 + %r0], %r28
T2_asi_reg_rd_6:
	mov	0x24, %r14
	.word 0xf0db89e0  ! 172: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf2cd8020  ! 173: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_13:
	setx	0x1e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_14:
	setx	0x1f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc848020  ! 183: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_13:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 186: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xf8948020  ! 193: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
cpu_intr_2_15:
	setx	0x1c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe442196  ! 195: LDSW_I	ldsw	[%r16 + 0x0196], %r31
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 22)
	.word 0xbc058000  ! 197: ADD_R	add 	%r22, %r0, %r30
cpu_intr_2_16:
	setx	0x1e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c0000  ! 199: LDUB_R	ldub	[%r16 + %r0], %r30
cpu_intr_2_17:
	setx	0x1d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d8020  ! 201: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
	.word 0xf804a199  ! 205: LDUW_I	lduw	[%r18 + 0x0199], %r28
T2_asi_reg_wr_14:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 207: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_18:
	setx	0x1c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dc2036  ! 209: LDXA_I	ldxa	[%r16, + 0x0036] %asi, %r25
	.word 0xf404a19e  ! 212: LDUW_I	lduw	[%r18 + 0x019e], %r26
	.word 0xf8858020  ! 215: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_7:
	mov	0x19, %r14
	.word 0xf2db8400  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_19:
	setx	0x1e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_15:
	mov	0x29, %r14
	.word 0xf4f38e80  ! 222: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_16:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 225: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf88ce04c  ! 229: LDUBA_I	lduba	[%r19, + 0x004c] %asi, %r28
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_20:
	setx	0x1f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_8:
	mov	0x17, %r14
	.word 0xf8db89e0  ! 237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf0548000  ! 238: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xfac58020  ! 239: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 16)
	.word 0x919420f2  ! 253: WRPR_PIL_I	wrpr	%r16, 0x00f2, %pil
T2_asi_reg_rd_9:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_17:
	mov	0x17, %r14
	.word 0xf4f389e0  ! 256: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_10:
	mov	0x26, %r14
	.word 0xf4db89e0  ! 258: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfc158000  ! 259: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf6548000  ! 261: LDSH_R	ldsh	[%r18 + %r0], %r27
T2_asi_reg_wr_18:
	mov	0x19, %r14
	.word 0xfaf38400  ! 264: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfe0d8000  ! 268: LDUB_R	ldub	[%r22 + %r0], %r31
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_19:
	mov	0x15, %r14
	.word 0xf8f38e40  ! 270: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_21:
	setx	0x1f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4448000  ! 273: LDSW_R	ldsw	[%r18 + %r0], %r26
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_11:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_20:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 281: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb1641800  ! 284: MOVcc_R	<illegal instruction>
cpu_intr_2_22:
	setx	0x1c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_12:
	mov	0x2, %r14
	.word 0xfadb89e0  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_13:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf614e0d8  ! 290: LDUH_I	lduh	[%r19 + 0x00d8], %r27
	.word 0xba2520e3  ! 291: SUB_I	sub 	%r20, 0x00e3, %r29
cpu_intr_2_23:
	setx	0x1d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55e098  ! 295: LDSH_I	ldsh	[%r23 + 0x0098], %r30
cpu_intr_2_24:
	setx	0x1d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d44020  ! 299: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
	.word 0xbf351000  ! 302: SRLX_R	srlx	%r20, %r0, %r31
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_14:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 305: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 4)
	.word 0xf4c44020  ! 310: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 13)
	.word 0xf6958020  ! 318: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xf204c000  ! 319: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf85d8000  ! 320: LDX_R	ldx	[%r22 + %r0], %r28
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e1a  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1a, %hpstate
cpu_intr_2_25:
	setx	0x1c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_26:
	setx	0x1f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c4000  ! 331: LDSB_R	ldsb	[%r17 + %r0], %r25
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_27:
	setx	0x1e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0440000  ! 337: LDSW_R	ldsw	[%r16 + %r0], %r24
cpu_intr_2_28:
	setx	0x1d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_29:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_22:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 343: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_30:
	setx	0x1c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20561cd  ! 346: ADD_I	add 	%r21, 0x01cd, %r25
	.word 0xf8440000  ! 353: LDSW_R	ldsw	[%r16 + %r0], %r28
cpu_intr_2_31:
	setx	0x1e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4cc000  ! 355: LDSB_R	ldsb	[%r19 + %r0], %r29
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 12)
	.word 0xf84d21d4  ! 359: LDSB_I	ldsb	[%r20 + 0x01d4], %r28
	.word 0xb684606c  ! 361: ADDcc_I	addcc 	%r17, 0x006c, %r27
	.word 0xf80520ee  ! 362: LDUW_I	lduw	[%r20 + 0x00ee], %r28
	.word 0xfed54020  ! 363: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
cpu_intr_2_32:
	setx	0x1e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_33:
	setx	0x1e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d609e  ! 374: LDX_I	ldx	[%r21 + 0x009e], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb21cc000  ! 377: XOR_R	xor 	%r19, %r0, %r25
	.word 0xf654a0ba  ! 379: LDSH_I	ldsh	[%r18 + 0x00ba], %r27
cpu_intr_2_34:
	setx	0x1f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844e075  ! 381: LDSW_I	ldsw	[%r19 + 0x0075], %r28
	.word 0xf4d40020  ! 382: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	.word 0xf884e177  ! 384: LDUWA_I	lduwa	[%r19, + 0x0177] %asi, %r28
cpu_intr_2_35:
	setx	0x1e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_36:
	setx	0x1c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_23:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 390: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_37:
	setx	0x1c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_24:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 396: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_38:
	setx	0x1f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 28)
	.word 0xfac4c020  ! 405: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
	.word 0xfe84c020  ! 409: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xfc84e0b1  ! 410: LDUWA_I	lduwa	[%r19, + 0x00b1] %asi, %r30
cpu_intr_2_39:
	setx	0x1d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c2088  ! 412: LDX_I	ldx	[%r16 + 0x0088], %r26
	.word 0xf6852136  ! 414: LDUWA_I	lduwa	[%r20, + 0x0136] %asi, %r27
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_15:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb42d8000  ! 421: ANDN_R	andn 	%r22, %r0, %r26
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
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_NONHPRIV
	.word 0xf80d2166  ! 429: LDUB_I	ldub	[%r20 + 0x0166], %r28
	.word 0xf4c58020  ! 430: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
	.word 0xbc35e083  ! 431: ORN_I	orn 	%r23, 0x0083, %r30
T2_asi_reg_rd_16:
	mov	0xa, %r14
	.word 0xf6db8e80  ! 433: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf40420bc  ! 434: LDUW_I	lduw	[%r16 + 0x00bc], %r26
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_25:
	mov	0x1e, %r14
	.word 0xfef38e60  ! 436: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_17:
	mov	0x24, %r14
	.word 0xfcdb89e0  ! 440: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb8bd0000  ! 441: XNORcc_R	xnorcc 	%r20, %r0, %r28
T2_asi_reg_rd_18:
	mov	0x14, %r14
	.word 0xf0db8400  ! 446: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_19:
	mov	0xe, %r14
	.word 0xf4db84a0  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
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
	.word 0xfed44020  ! 452: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbcad8000  ! 456: ANDNcc_R	andncc 	%r22, %r0, %r30
	.word 0xfa944020  ! 457: LDUHA_R	lduha	[%r17, %r0] 0x01, %r29
	.word 0xfc8d8020  ! 458: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
	.word 0xb09d8000  ! 461: XORcc_R	xorcc 	%r22, %r0, %r24
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_26:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 464: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfacd21d2  ! 465: LDSBA_I	ldsba	[%r20, + 0x01d2] %asi, %r29
T2_asi_reg_wr_27:
	mov	0x22, %r14
	.word 0xf0f38e80  ! 466: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbcb44000  ! 469: ORNcc_R	orncc 	%r17, %r0, %r30
	.word 0xf25c8000  ! 473: LDX_R	ldx	[%r18 + %r0], %r25
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_20:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf855c000  ! 480: LDSH_R	ldsh	[%r23 + %r0], %r28
cpu_intr_2_40:
	setx	0x21002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_28:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 482: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb2b460c1  ! 483: SUBCcc_I	orncc 	%r17, 0x00c1, %r25
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_41:
	setx	0x230336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65c4000  ! 488: LDX_R	ldx	[%r17 + %r0], %r27
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_42:
	setx	0x210118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_43:
	setx	0x200135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d4c020  ! 494: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
	.word 0xf8cd8020  ! 500: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	.word 0xf84c4000  ! 501: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xb635e161  ! 502: ORN_I	orn 	%r23, 0x0161, %r27
cpu_intr_2_44:
	setx	0x20003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93d2001  ! 504: SRA_I	sra 	%r20, 0x0001, %r28
T2_asi_reg_rd_21:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 39)
	.word 0xfec4a192  ! 507: LDSWA_I	ldswa	[%r18, + 0x0192] %asi, %r31
T2_asi_reg_rd_22:
	mov	0x2a, %r14
	.word 0xf2db8e40  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf895611b  ! 509: LDUHA_I	lduha	[%r21, + 0x011b] %asi, %r28
cpu_intr_2_45:
	setx	0x22012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 513: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_30:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 514: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf40461de  ! 516: LDUW_I	lduw	[%r17 + 0x01de], %r26
T2_asi_reg_wr_31:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 518: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf604606a  ! 519: LDUW_I	lduw	[%r17 + 0x006a], %r27
	.word 0xfe55e0cb  ! 520: LDSH_I	ldsh	[%r23 + 0x00cb], %r31
	.word 0xf0cc603e  ! 521: LDSBA_I	ldsba	[%r17, + 0x003e] %asi, %r24
cpu_intr_2_46:
	setx	0x200013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfadc2051  ! 532: LDXA_I	ldxa	[%r16, + 0x0051] %asi, %r29
	.word 0xf4d4c020  ! 534: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c40  ! 536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c40, %hpstate
	.word 0xf854609a  ! 537: LDSH_I	ldsh	[%r17 + 0x009a], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc1ca01f  ! 541: XOR_I	xor 	%r18, 0x001f, %r30
	.word 0xfe8dc020  ! 544: LDUBA_R	lduba	[%r23, %r0] 0x01, %r31
T2_asi_reg_rd_23:
	mov	0x16, %r14
	.word 0xfedb8400  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 546: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf854c000  ! 547: LDSH_R	ldsh	[%r19 + %r0], %r28
cpu_intr_2_47:
	setx	0x22033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604a0b0  ! 555: LDUW_I	lduw	[%r18 + 0x00b0], %r27
T2_asi_reg_rd_24:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_33:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 557: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf65d0000  ! 558: LDX_R	ldx	[%r20 + %r0], %r27
T2_asi_reg_wr_34:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 563: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_48:
	setx	0x22023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfc0d8000  ! 570: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xfa5de0fd  ! 571: LDX_I	ldx	[%r23 + 0x00fd], %r29
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe854020  ! 575: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
T2_asi_reg_rd_25:
	mov	0x23, %r14
	.word 0xf8db8e60  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf60de1be  ! 580: LDUB_I	ldub	[%r23 + 0x01be], %r27
	.word 0xfa0d4000  ! 582: LDUB_R	ldub	[%r21 + %r0], %r29
T2_asi_reg_rd_26:
	mov	0x11, %r14
	.word 0xfcdb8e80  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 16)
	.word 0xfe840020  ! 585: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xf2c4e1ee  ! 586: LDSWA_I	ldswa	[%r19, + 0x01ee] %asi, %r25
cpu_intr_2_49:
	setx	0x21012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf44d613a  ! 597: LDSB_I	ldsb	[%r21 + 0x013a], %r26
T2_asi_reg_rd_27:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 39)
	.word 0xbf643801  ! 605: MOVcc_I	<illegal instruction>
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_50:
	setx	0x230218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_28:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 609: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_35:
	mov	0x2f, %r14
	.word 0xf8f38e80  ! 610: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 32)
	.word 0xbb3df001  ! 613: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xf404c000  ! 614: LDUW_R	lduw	[%r19 + %r0], %r26
cpu_intr_2_51:
	setx	0x230302, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe04c000  ! 617: LDUW_R	lduw	[%r19 + %r0], %r31
T2_asi_reg_wr_36:
	mov	0x1b, %r14
	.word 0xfcf38e80  ! 619: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_29:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_30:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 628: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_52:
	setx	0x23020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_37:
	mov	0xe, %r14
	.word 0xfcf38e40  ! 631: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_31:
	mov	0xf, %r14
	.word 0xf8db84a0  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb224c000  ! 634: SUB_R	sub 	%r19, %r0, %r25
cpu_intr_2_53:
	setx	0x210136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dc202d  ! 637: LDXA_I	ldxa	[%r16, + 0x002d] %asi, %r26
	.word 0xfc8d0020  ! 638: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
cpu_intr_2_54:
	setx	0x230128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_38:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 643: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa948020  ! 644: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	.word 0xfc058000  ! 645: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xfe058000  ! 647: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf055c000  ! 648: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xfe150000  ! 650: LDUH_R	lduh	[%r20 + %r0], %r31
T2_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 652: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfcd5a12b  ! 653: LDSHA_I	ldsha	[%r22, + 0x012b] %asi, %r30
	.word 0xf65c8000  ! 654: LDX_R	ldx	[%r18 + %r0], %r27
cpu_intr_2_55:
	setx	0x20003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf8c46034  ! 664: LDSWA_I	ldswa	[%r17, + 0x0034] %asi, %r28
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 21)
	.word 0xf64420cb  ! 667: LDSW_I	ldsw	[%r16 + 0x00cb], %r27
cpu_intr_2_56:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_32:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_57:
	setx	0x200027, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0958020  ! 674: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
	.word 0xfc54a1a5  ! 675: LDSH_I	ldsh	[%r18 + 0x01a5], %r30
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_40:
	mov	0x1c, %r14
	.word 0xfcf384a0  ! 677: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_58:
	setx	0x20013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_41:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 681: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 14)
	.word 0xfed4200a  ! 692: LDSHA_I	ldsha	[%r16, + 0x000a] %asi, %r31
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_33:
	mov	0x20, %r14
	.word 0xf4db84a0  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfedc61f1  ! 699: LDXA_I	ldxa	[%r17, + 0x01f1] %asi, %r31
	.word 0xf4950020  ! 701: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
	.word 0xbc3cc000  ! 703: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0xf694c020  ! 704: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_59:
	setx	0x220028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_34:
	mov	0x1a, %r14
	.word 0xf2db84a0  ! 708: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfc544000  ! 709: LDSH_R	ldsh	[%r17 + %r0], %r30
T2_asi_reg_rd_35:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_60:
	setx	0x20021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb43c615c  ! 718: XNOR_I	xnor 	%r17, 0x015c, %r26
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_36:
	mov	0x2f, %r14
	.word 0xf2db84a0  ! 723: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf24d8000  ! 727: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xfe448000  ! 729: LDSW_R	ldsw	[%r18 + %r0], %r31
cpu_intr_2_61:
	setx	0x230221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_62:
	setx	0x230023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4040000  ! 735: LDUW_R	lduw	[%r16 + %r0], %r26
cpu_intr_2_63:
	setx	0x220006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05a140  ! 738: LDUW_I	lduw	[%r22 + 0x0140], %r31
cpu_intr_2_64:
	setx	0x220231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_37:
	mov	0x1, %r14
	.word 0xfadb89e0  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_65:
	setx	0x220218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20520c1  ! 746: ADD_I	add 	%r20, 0x00c1, %r25
	.word 0xfcd50020  ! 747: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_42:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 750: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf45dc000  ! 758: LDX_R	ldx	[%r23 + %r0], %r26
cpu_intr_2_66:
	setx	0x300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 23)
	.word 0xbab58000  ! 763: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xfac40020  ! 764: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
T2_asi_reg_wr_43:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 766: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf45dc000  ! 769: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf64c0000  ! 770: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xb2b50000  ! 772: ORNcc_R	orncc 	%r20, %r0, %r25
	.word 0xb28c4000  ! 773: ANDcc_R	andcc 	%r17, %r0, %r25
cpu_intr_2_67:
	setx	0x230202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf6cde0aa  ! 778: LDSBA_I	ldsba	[%r23, + 0x00aa] %asi, %r27
T2_asi_reg_wr_44:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 779: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb37d2401  ! 781: MOVR_I	movre	%r20, 0x1, %r25
T2_asi_reg_rd_38:
	mov	0x2d, %r14
	.word 0xf2db89e0  ! 789: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf8458000  ! 791: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xb9353001  ! 792: SRLX_I	srlx	%r20, 0x0001, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4ce1e3  ! 795: LDSB_I	ldsb	[%r19 + 0x01e3], %r29
cpu_intr_2_68:
	setx	0x230327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_39:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_45:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 801: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 3)
	.word 0xb7518000  ! 805: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xfc94a1d0  ! 807: LDUHA_I	lduha	[%r18, + 0x01d0] %asi, %r30
cpu_intr_2_69:
	setx	0x230337, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_40:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb2052126  ! 812: ADD_I	add 	%r20, 0x0126, %r25
	.word 0xf444a1d2  ! 816: LDSW_I	ldsw	[%r18 + 0x01d2], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_41:
	mov	0x22, %r14
	.word 0xf4db8400  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_70:
	setx	0x210220, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_46:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 825: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbca5e080  ! 830: SUBcc_I	subcc 	%r23, 0x0080, %r30
T2_asi_reg_rd_42:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_rd_43:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfecde0a4  ! 835: LDSBA_I	ldsba	[%r23, + 0x00a4] %asi, %r31
	.word 0xf2cd4020  ! 836: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
cpu_intr_2_71:
	setx	0x210111, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0x5, %r14
	.word 0xfef38e40  ! 845: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_48:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 847: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_rd_44:
	mov	0x38, %r14
	.word 0xf4db89e0  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_72:
	setx	0x210307, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_73:
	setx	0x220200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d8000  ! 860: LDSB_R	ldsb	[%r22 + %r0], %r29
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 18)
	.word 0xfccca0eb  ! 863: LDSBA_I	ldsba	[%r18, + 0x00eb] %asi, %r30
cpu_intr_2_74:
	setx	0x23000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_75:
	setx	0x210116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 20)
	.word 0xf0cd8020  ! 877: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
	.word 0xf4c54020  ! 879: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
	.word 0xfcd4a1c8  ! 889: LDSHA_I	ldsha	[%r18, + 0x01c8] %asi, %r30
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 20)
	.word 0xf645211b  ! 892: LDSW_I	ldsw	[%r20 + 0x011b], %r27
	ta	T_CHANGE_HPRIV
cpu_intr_2_76:
	setx	0x27030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac48020  ! 900: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
	.word 0xf4c52113  ! 901: LDSWA_I	ldswa	[%r20, + 0x0113] %asi, %r26
cpu_intr_2_77:
	setx	0x260308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13cd000  ! 903: SRAX_R	srax	%r19, %r0, %r24
T2_asi_reg_wr_49:
	mov	0x1, %r14
	.word 0xfef38e60  ! 906: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf2d521e3  ! 910: LDSHA_I	ldsha	[%r20, + 0x01e3] %asi, %r25
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xb894e124  ! 922: ORcc_I	orcc 	%r19, 0x0124, %r28
cpu_intr_2_78:
	setx	0x26012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6448000  ! 931: LDSW_R	ldsw	[%r18 + %r0], %r27
T2_asi_reg_wr_50:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 932: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_51:
	mov	0x1e, %r14
	.word 0xf2f38e80  ! 933: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_79:
	setx	0x260013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_80:
	setx	0x270325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_45:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf8cc61a3  ! 950: LDSBA_I	ldsba	[%r17, + 0x01a3] %asi, %r28
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 23)
	.word 0xfcc58020  ! 952: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4046117  ! 956: ADD_I	add 	%r17, 0x0117, %r26
T2_asi_reg_rd_46:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf055607a  ! 962: LDSH_I	ldsh	[%r21 + 0x007a], %r24
	.word 0xfa0520d3  ! 964: LDUW_I	lduw	[%r20 + 0x00d3], %r29
T2_asi_reg_wr_52:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 965: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 5)
	.word 0xfc540000  ! 967: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xfc0420c6  ! 970: LDUW_I	lduw	[%r16 + 0x00c6], %r30
	.word 0xbd540000  ! 971: RDPR_GL	<illegal instruction>
cpu_intr_2_81:
	setx	0x270130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_82:
	setx	0x26002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d42189  ! 978: LDSHA_I	ldsha	[%r16, + 0x0189] %asi, %r28
T2_asi_reg_rd_47:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 980: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	.word 0xfecd211e  ! 984: LDSBA_I	ldsba	[%r20, + 0x011e] %asi, %r31
T2_asi_reg_rd_48:
	mov	0x2f, %r14
	.word 0xf4db8400  ! 987: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_83:
	setx	0x25031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_53:
	mov	0x22, %r14
	.word 0xf4f389e0  ! 992: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2c5c020  ! 996: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_49:
	mov	0x1a, %r14
	.word 0xf8db8400  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_50:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 1003: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb1641800  ! 1007: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_54:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 1008: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfc550000  ! 1010: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf6d40020  ! 1011: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0d4000  ! 1013: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf4146116  ! 1016: LDUH_I	lduh	[%r17 + 0x0116], %r26
T2_asi_reg_rd_51:
	mov	0x29, %r14
	.word 0xf6db89e0  ! 1018: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_84:
	setx	0x250032, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d8a  ! 1022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8a, %hpstate
T2_asi_reg_rd_52:
	mov	0x1c, %r14
	.word 0xf6db8e60  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb934e001  ! 1026: SRL_I	srl 	%r19, 0x0001, %r28
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 26)
	.word 0xba342198  ! 1030: SUBC_I	orn 	%r16, 0x0198, %r29
	.word 0xfe45c000  ! 1033: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf015a0f9  ! 1035: LDUH_I	lduh	[%r22 + 0x00f9], %r24
cpu_intr_2_85:
	setx	0x25011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254e0f6  ! 1038: LDSH_I	ldsh	[%r19 + 0x00f6], %r25
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 14)
	.word 0xf8144000  ! 1043: LDUH_R	lduh	[%r17 + %r0], %r28
T2_asi_reg_wr_55:
	mov	0x1b, %r14
	.word 0xf0f38e60  ! 1045: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_53:
	mov	0x36, %r14
	.word 0xf4db89e0  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_56:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 1064: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf0d56016  ! 1065: LDSHA_I	ldsha	[%r21, + 0x0016] %asi, %r24
	.word 0xb80ca0dd  ! 1066: AND_I	and 	%r18, 0x00dd, %r28
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d82  ! 1067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d82, %hpstate
cpu_intr_2_86:
	setx	0x270100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_87:
	setx	0x260308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245608d  ! 1075: LDSW_I	ldsw	[%r21 + 0x008d], %r25
T2_asi_reg_wr_57:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 1077: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf444c000  ! 1078: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xf65da152  ! 1079: LDX_I	ldx	[%r22 + 0x0152], %r27
T2_asi_reg_wr_58:
	mov	0x1f, %r14
	.word 0xfaf389e0  ! 1081: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf255a0cd  ! 1083: LDSH_I	ldsh	[%r22 + 0x00cd], %r25
	.word 0xfadde137  ! 1084: LDXA_I	ldxa	[%r23, + 0x0137] %asi, %r29
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8d44020  ! 1094: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
	.word 0xb9346001  ! 1095: SRL_I	srl 	%r17, 0x0001, %r28
cpu_intr_2_88:
	setx	0x27011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_89:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 17)
	.word 0xbac4609e  ! 1109: ADDCcc_I	addccc 	%r17, 0x009e, %r29
T2_asi_reg_wr_59:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 1110: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbe458000  ! 1113: ADDC_R	addc 	%r22, %r0, %r31
T2_asi_reg_rd_54:
	mov	0x36, %r14
	.word 0xf0db8400  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_90:
	setx	0x250118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d4c020  ! 1121: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
	.word 0xf214a108  ! 1122: LDUH_I	lduh	[%r18 + 0x0108], %r25
	.word 0xf0048000  ! 1124: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xbf7d8400  ! 1125: MOVR_R	movre	%r22, %r0, %r31
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982840  ! 1128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
	.word 0xf8c58020  ! 1130: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
	.word 0xf68d4020  ! 1132: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
	.word 0xfcdd212d  ! 1133: LDXA_I	ldxa	[%r20, + 0x012d] %asi, %r30
	.word 0xfc5c4000  ! 1134: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xf2040000  ! 1135: LDUW_R	lduw	[%r16 + %r0], %r25
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_91:
	setx	0x250028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44e021  ! 1140: LDSW_I	ldsw	[%r19 + 0x0021], %r30
	.word 0xf0c42122  ! 1141: LDSWA_I	ldswa	[%r16, + 0x0122] %asi, %r24
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_92:
	setx	0x240129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa45c000  ! 1156: LDSW_R	ldsw	[%r23 + %r0], %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf005a041  ! 1158: LDUW_I	lduw	[%r22 + 0x0041], %r24
	.word 0xf6554000  ! 1159: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xf6454000  ! 1160: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf685c020  ! 1161: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
cpu_intr_2_93:
	setx	0x240004, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_60:
	mov	0xb, %r14
	.word 0xf6f38e60  ! 1165: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_94:
	setx	0x250217, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_61:
	mov	0x17, %r14
	.word 0xf8f389e0  ! 1169: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf6cd607e  ! 1170: LDSBA_I	ldsba	[%r21, + 0x007e] %asi, %r27
cpu_intr_2_95:
	setx	0x24020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982ad0  ! 1181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad0, %hpstate
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 1d)
	.word 0xb24560f4  ! 1183: ADDC_I	addc 	%r21, 0x00f4, %r25
	.word 0xb4bc0000  ! 1186: XNORcc_R	xnorcc 	%r16, %r0, %r26
	.word 0xfc5d4000  ! 1187: LDX_R	ldx	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0xf204e04e  ! 1191: LDUW_I	lduw	[%r19 + 0x004e], %r25
cpu_intr_2_96:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d0000  ! 1195: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xbe2520d7  ! 1199: SUB_I	sub 	%r20, 0x00d7, %r31
cpu_intr_2_97:
	setx	0x260113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01421f8  ! 1205: LDUH_I	lduh	[%r16 + 0x01f8], %r24
	.word 0xbf510000  ! 1207: RDPR_TICK	<illegal instruction>
cpu_intr_2_98:
	setx	0x27031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34c000  ! 1210: SUBC_R	orn 	%r19, %r0, %r31
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, b)
	.word 0xfc440000  ! 1213: LDSW_R	ldsw	[%r16 + %r0], %r30
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 9)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982950  ! 1216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
cpu_intr_2_99:
	setx	0x250038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_100:
	setx	0x25020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28dc020  ! 1221: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_55:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 1224: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe840020  ! 1225: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xf8dc2102  ! 1227: LDXA_I	ldxa	[%r16, + 0x0102] %asi, %r28
	.word 0xba9420d6  ! 1228: ORcc_I	orcc 	%r16, 0x00d6, %r29
T2_asi_reg_rd_56:
	mov	0x32, %r14
	.word 0xfcdb8400  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfadd206e  ! 1230: LDXA_I	ldxa	[%r20, + 0x006e] %asi, %r29
	.word 0xfc0ce10a  ! 1232: LDUB_I	ldub	[%r19 + 0x010a], %r30
T2_asi_reg_wr_62:
	mov	0x2d, %r14
	.word 0xf0f389e0  ! 1234: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfa152170  ! 1235: LDUH_I	lduh	[%r20 + 0x0170], %r29
	.word 0xf6d56120  ! 1236: LDSHA_I	ldsha	[%r21, + 0x0120] %asi, %r27
	.word 0xf2cd609d  ! 1237: LDSBA_I	ldsba	[%r21, + 0x009d] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xb33da001  ! 1239: SRA_I	sra 	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4d460e1  ! 1243: LDSHA_I	ldsha	[%r17, + 0x00e1] %asi, %r26
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_101:
	setx	0x260210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d4000  ! 1250: LDSB_R	ldsb	[%r21 + %r0], %r31
cpu_intr_2_102:
	setx	0x270103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_TO_TL0
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_103:
	setx	0x270233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c2001  ! 1261: SLL_I	sll 	%r16, 0x0001, %r24
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_104:
	setx	0x240225, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b02  ! 1272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b02, %hpstate
	.word 0xfc14c000  ! 1273: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xf28c0020  ! 1274: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 19)
	.word 0xf25dc000  ! 1278: LDX_R	ldx	[%r23 + %r0], %r25
cpu_intr_2_105:
	setx	0x24012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_57:
	mov	0xe, %r14
	.word 0xf6db8e80  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_58:
	mov	0x33, %r14
	.word 0xf2db84a0  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_106:
	setx	0x260102, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb62d6120  ! 1295: ANDN_I	andn 	%r21, 0x0120, %r27
cpu_intr_2_107:
	setx	0x1032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_59:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 1299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983aca  ! 1300: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1aca, %hpstate
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983cd8  ! 1301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd8, %hpstate
cpu_intr_2_108:
	setx	0x24001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_109:
	setx	0x250239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d5000  ! 1313: SLLX_R	sllx	%r21, %r0, %r26
	.word 0xf415a00a  ! 1314: LDUH_I	lduh	[%r22 + 0x000a], %r26
T2_asi_reg_rd_60:
	mov	0x24, %r14
	.word 0xfcdb8e80  ! 1315: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_110:
	setx	0x270135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c2168  ! 1321: LDUB_I	ldub	[%r16 + 0x0168], %r27
	.word 0xb4854000  ! 1325: ADDcc_R	addcc 	%r21, %r0, %r26
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_63:
	mov	0x1b, %r14
	.word 0xf2f38e80  ! 1329: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf2148000  ! 1330: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xb634a11b  ! 1331: SUBC_I	orn 	%r18, 0x011b, %r27
	.word 0xfe8c618f  ! 1336: LDUBA_I	lduba	[%r17, + 0x018f] %asi, %r31
	ta	T_CHANGE_HPRIV
cpu_intr_2_111:
	setx	0x240024, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_61:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_64:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 1344: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_112:
	setx	0x25010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614c000  ! 1350: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xfe0c8000  ! 1352: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xfc154000  ! 1354: LDUH_R	lduh	[%r21 + %r0], %r30
T2_asi_reg_wr_65:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 1356: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8050000  ! 1357: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf4c52042  ! 1365: LDSWA_I	ldswa	[%r20, + 0x0042] %asi, %r26
	.word 0xf65cc000  ! 1369: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf8c48020  ! 1374: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_66:
	mov	0x36, %r14
	.word 0xf6f38e80  ! 1384: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_rd_62:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf48cc020  ! 1389: LDUBA_R	lduba	[%r19, %r0] 0x01, %r26
cpu_intr_2_113:
	setx	0x280339, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_63:
	mov	0x34, %r14
	.word 0xf6db8e80  ! 1394: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe1521b2  ! 1395: LDUH_I	lduh	[%r20 + 0x01b2], %r31
	.word 0xf4448000  ! 1396: LDSW_R	ldsw	[%r18 + %r0], %r26
cpu_intr_2_114:
	setx	0x2b0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645215a  ! 1398: LDSW_I	ldsw	[%r20 + 0x015a], %r27
	.word 0xf45c8000  ! 1402: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0x89956058  ! 1404: WRPR_TICK_I	wrpr	%r21, 0x0058, %tick
	.word 0xf414e01e  ! 1405: LDUH_I	lduh	[%r19 + 0x001e], %r26
	.word 0xbaad0000  ! 1408: ANDNcc_R	andncc 	%r20, %r0, %r29
	.word 0xb72ce001  ! 1409: SLL_I	sll 	%r19, 0x0001, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf4cdc020  ! 1412: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf6948020  ! 1417: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
cpu_intr_2_115:
	setx	0x290133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_67:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 1425: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_64:
	mov	0x6, %r14
	.word 0xf8db8400  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf2d5e1f4  ! 1429: LDSHA_I	ldsha	[%r23, + 0x01f4] %asi, %r25
	.word 0xfc8c4020  ! 1431: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
	.word 0xf45d6095  ! 1434: LDX_I	ldx	[%r21 + 0x0095], %r26
	.word 0xfe15a142  ! 1436: LDUH_I	lduh	[%r22 + 0x0142], %r31
cpu_intr_2_116:
	setx	0x2a0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73d2001  ! 1440: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xf684c020  ! 1441: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
	.word 0xfe4dc000  ! 1442: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf88d8020  ! 1444: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
T2_asi_reg_wr_68:
	mov	0x0, %r14
	.word 0xfcf38400  ! 1445: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_117:
	setx	0x2b030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf014c000  ! 1451: LDUH_R	lduh	[%r19 + %r0], %r24
T2_asi_reg_rd_65:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 1452: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe84e16d  ! 1454: LDUWA_I	lduwa	[%r19, + 0x016d] %asi, %r31
cpu_intr_2_118:
	setx	0x28011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 25)
	.word 0xba8c4000  ! 1466: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xf8154000  ! 1467: LDUH_R	lduh	[%r21 + %r0], %r28
cpu_intr_2_119:
	setx	0x2b0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_120:
	setx	0x2a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_69:
	mov	0x36, %r14
	.word 0xf0f38e80  ! 1472: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_70:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 1477: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 0)
	.word 0xfcdce099  ! 1479: LDXA_I	ldxa	[%r19, + 0x0099] %asi, %r30
cpu_intr_2_121:
	setx	0x2a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, d)
	.word 0xf815e1b7  ! 1492: LDUH_I	lduh	[%r23 + 0x01b7], %r28
	.word 0xb12c2001  ! 1493: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0xf8d460df  ! 1495: LDSHA_I	ldsha	[%r17, + 0x00df] %asi, %r28
T2_asi_reg_wr_71:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 1497: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_72:
	mov	0xb, %r14
	.word 0xfef384a0  ! 1499: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_122:
	setx	0x280218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455605e  ! 1503: LDSH_I	ldsh	[%r21 + 0x005e], %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_123:
	setx	0x2b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_73:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 1509: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_124:
	setx	0x280315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828d0  ! 1516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d0, %hpstate
T2_asi_reg_rd_66:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 1517: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198280a  ! 1519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080a, %hpstate
cpu_intr_2_125:
	setx	0x2b023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_74:
	mov	0x28, %r14
	.word 0xfaf38e80  ! 1525: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_126:
	setx	0x2a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 1530: LDUB_R	ldub	[%r17 + %r0], %r27
T2_asi_reg_wr_75:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1531: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfcc4a0ad  ! 1533: LDSWA_I	ldswa	[%r18, + 0x00ad] %asi, %r30
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 29)
	.word 0xf6d4a1ec  ! 1536: LDSHA_I	ldsha	[%r18, + 0x01ec] %asi, %r27
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_76:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 1538: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_77:
	mov	0x23, %r14
	.word 0xfaf38400  ! 1539: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf255a08a  ! 1540: LDSH_I	ldsh	[%r22 + 0x008a], %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_67:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfa4d212f  ! 1546: LDSB_I	ldsb	[%r20 + 0x012f], %r29
	.word 0xb32d1000  ! 1547: SLLX_R	sllx	%r20, %r0, %r25
	.word 0xb0344000  ! 1548: ORN_R	orn 	%r17, %r0, %r24
	.word 0xf0cc8020  ! 1549: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
	.word 0xfe45c000  ! 1550: LDSW_R	ldsw	[%r23 + %r0], %r31
T2_asi_reg_wr_78:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 1551: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb6bde17a  ! 1553: XNORcc_I	xnorcc 	%r23, 0x017a, %r27
cpu_intr_2_127:
	setx	0x2b0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_79:
	mov	0x12, %r14
	.word 0xf0f38e80  ! 1555: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf25cc000  ! 1559: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf654e05a  ! 1560: LDSH_I	ldsh	[%r19 + 0x005a], %r27
	.word 0xfa8cc020  ! 1561: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
	.word 0xfc140000  ! 1562: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xfc8d6045  ! 1565: LDUBA_I	lduba	[%r21, + 0x0045] %asi, %r30
	.word 0xb0ace014  ! 1566: ANDNcc_I	andncc 	%r19, 0x0014, %r24
	.word 0xf24d4000  ! 1567: LDSB_R	ldsb	[%r21 + %r0], %r25
T2_asi_reg_wr_80:
	mov	0xf, %r14
	.word 0xf8f38e80  ! 1569: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 5)
	.word 0xb77cc400  ! 1573: MOVR_R	movre	%r19, %r0, %r27
	.word 0xfc54a058  ! 1575: LDSH_I	ldsh	[%r18 + 0x0058], %r30
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf244e1f2  ! 1580: LDSW_I	ldsw	[%r19 + 0x01f2], %r25
	.word 0xbead6041  ! 1584: ANDNcc_I	andncc 	%r21, 0x0041, %r31
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_68:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1588: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe45a0d7  ! 1589: LDSW_I	ldsw	[%r22 + 0x00d7], %r31
	.word 0xf8d5e1f9  ! 1590: LDSHA_I	ldsha	[%r23, + 0x01f9] %asi, %r28
	.word 0xf8144000  ! 1592: LDUH_R	lduh	[%r17 + %r0], %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_81:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 1594: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbf3c8000  ! 1595: SRA_R	sra 	%r18, %r0, %r31
cpu_intr_2_128:
	setx	0x2a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_129:
	setx	0x2a0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf884c020  ! 1603: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r28
	.word 0xfa45e184  ! 1612: LDSW_I	ldsw	[%r23 + 0x0184], %r29
	.word 0xf6d40020  ! 1615: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_69:
	mov	0x18, %r14
	.word 0xfedb8e60  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_130:
	setx	0x280102, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_82:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 1621: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_70:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 1622: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_83:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 1623: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_131:
	setx	0x290202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_71:
	mov	0x0, %r14
	.word 0xf2db89e0  ! 1628: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf8dc21bd  ! 1630: LDXA_I	ldxa	[%r16, + 0x01bd] %asi, %r28
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa5d4000  ! 1633: LDX_R	ldx	[%r21 + %r0], %r29
cpu_intr_2_132:
	setx	0x290031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8858020  ! 1638: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
T2_asi_reg_wr_84:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 1640: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_133:
	setx	0x2a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_134:
	setx	0x290100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc14219e  ! 1654: LDUH_I	lduh	[%r16 + 0x019e], %r30
	.word 0xf414a1b2  ! 1655: LDUH_I	lduh	[%r18 + 0x01b2], %r26
	.word 0xf28ca0e3  ! 1656: LDUBA_I	lduba	[%r18, + 0x00e3] %asi, %r25
	.word 0xf80ca157  ! 1657: LDUB_I	ldub	[%r18 + 0x0157], %r28
cpu_intr_2_135:
	setx	0x2b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5607d  ! 1662: LDSWA_I	ldswa	[%r21, + 0x007d] %asi, %r25
cpu_intr_2_136:
	setx	0x2b0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d9a  ! 1668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
	.word 0xf2c40020  ! 1670: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
T2_asi_reg_wr_85:
	mov	0x14, %r14
	.word 0xf0f38e60  ! 1671: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 3b)
	.word 0xbc158000  ! 1674: OR_R	or 	%r22, %r0, %r30
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_137:
	setx	0x290206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 1678: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfadde168  ! 1679: LDXA_I	ldxa	[%r23, + 0x0168] %asi, %r29
	.word 0xf41520b0  ! 1680: LDUH_I	lduh	[%r20 + 0x00b0], %r26
T2_asi_reg_rd_72:
	mov	0x9, %r14
	.word 0xf6db8e80  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_138:
	setx	0x280223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d4e0f6  ! 1684: LDSHA_I	ldsha	[%r19, + 0x00f6] %asi, %r27
	.word 0xf20d60e9  ! 1686: LDUB_I	ldub	[%r21 + 0x00e9], %r25
T2_asi_reg_wr_87:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 1687: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_139:
	setx	0x28021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995e015  ! 1694: WRPR_TICK_I	wrpr	%r23, 0x0015, %tick
cpu_intr_2_140:
	setx	0x2a0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2552125  ! 1698: LDSH_I	ldsh	[%r20 + 0x0125], %r25
cpu_intr_2_141:
	setx	0x280014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_88:
	mov	0x33, %r14
	.word 0xf8f384a0  ! 1700: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_wr_89:
	mov	0x24, %r14
	.word 0xfaf389e0  ! 1701: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_73:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 1702: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983848  ! 1703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1848, %hpstate
	.word 0xf4052112  ! 1706: LDUW_I	lduw	[%r20 + 0x0112], %r26
	.word 0xf6044000  ! 1708: LDUW_R	lduw	[%r17 + %r0], %r27
T2_asi_reg_rd_74:
	mov	0x37, %r14
	.word 0xf8db89e0  ! 1709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_75:
	mov	0x35, %r14
	.word 0xfadb8400  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfc0d2049  ! 1711: LDUB_I	ldub	[%r20 + 0x0049], %r30
	.word 0xbb3c1000  ! 1713: SRAX_R	srax	%r16, %r0, %r29
	.word 0x819420fb  ! 1714: WRPR_TPC_I	wrpr	%r16, 0x00fb, %tpc
	.word 0xf64c0000  ! 1716: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf0c5a040  ! 1717: LDSWA_I	ldswa	[%r22, + 0x0040] %asi, %r24
T2_asi_reg_rd_76:
	mov	0x2e, %r14
	.word 0xf6db8e80  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_142:
	setx	0x2a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_90:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 1723: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 29)
	.word 0xfecc60a0  ! 1732: LDSBA_I	ldsba	[%r17, + 0x00a0] %asi, %r31
	.word 0xf4154000  ! 1737: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xba150000  ! 1739: OR_R	or 	%r20, %r0, %r29
cpu_intr_2_143:
	setx	0x280319, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfa45213a  ! 1747: LDSW_I	ldsw	[%r20 + 0x013a], %r29
T2_asi_reg_wr_91:
	mov	0xa, %r14
	.word 0xf6f38400  ! 1748: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf24c4000  ! 1750: LDSB_R	ldsb	[%r17 + %r0], %r25
	.word 0xbe95a125  ! 1752: ORcc_I	orcc 	%r22, 0x0125, %r31
cpu_intr_2_144:
	setx	0x2a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00cc000  ! 1756: LDUB_R	ldub	[%r19 + %r0], %r24
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf4cc207e  ! 1761: LDSBA_I	ldsba	[%r16, + 0x007e] %asi, %r26
	.word 0xf48c4020  ! 1762: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
cpu_intr_2_145:
	setx	0x290031, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb135c000  ! 1767: SRL_R	srl 	%r23, %r0, %r24
T2_asi_reg_rd_78:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 1768: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_HPRIV
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 28)
	.word 0xbe3d4000  ! 1782: XNOR_R	xnor 	%r21, %r0, %r31
T2_asi_reg_rd_79:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8950020  ! 1785: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
	.word 0xf49460b9  ! 1786: LDUHA_I	lduha	[%r17, + 0x00b9] %asi, %r26
	.word 0xb6b4602a  ! 1787: ORNcc_I	orncc 	%r17, 0x002a, %r27
	.word 0xbb641800  ! 1789: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_92:
	mov	0x9, %r14
	.word 0xfef38e40  ! 1790: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_80:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 1791: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf0458000  ! 1792: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xb53d2001  ! 1793: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xbf3cd000  ! 1796: SRAX_R	srax	%r19, %r0, %r31
	.word 0xb8b40000  ! 1799: ORNcc_R	orncc 	%r16, %r0, %r28
T2_asi_reg_rd_81:
	mov	0x27, %r14
	.word 0xf0db8e60  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_93:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 1804: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xba04e111  ! 1805: ADD_I	add 	%r19, 0x0111, %r29
cpu_intr_2_146:
	setx	0x2f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c8020  ! 1811: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_82:
	mov	0x7, %r14
	.word 0xf0db8400  ! 1814: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_147:
	setx	0x2e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ec0  ! 1822: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec0, %hpstate
T2_asi_reg_rd_83:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 1833: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_148:
	setx	0x2c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_149:
	setx	0x2f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf88d0020  ! 1844: LDUBA_R	lduba	[%r20, %r0] 0x01, %r28
	.word 0xf654c000  ! 1845: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xf80ca1c3  ! 1847: LDUB_I	ldub	[%r18 + 0x01c3], %r28
T2_asi_reg_rd_84:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf88da1d0  ! 1849: LDUBA_I	lduba	[%r22, + 0x01d0] %asi, %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_150:
	setx	0x2e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c4020  ! 1860: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_85:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_86:
	mov	0xa, %r14
	.word 0xf0db8400  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_94:
	mov	0x1d, %r14
	.word 0xf8f38e60  ! 1868: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfc45a119  ! 1873: LDSW_I	ldsw	[%r22 + 0x0119], %r30
	.word 0xf2d4c020  ! 1874: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
T2_asi_reg_wr_95:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 1875: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb2bce035  ! 1876: XNORcc_I	xnorcc 	%r19, 0x0035, %r25
	.word 0xfc05c000  ! 1877: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf0cc2184  ! 1878: LDSBA_I	ldsba	[%r16, + 0x0184] %asi, %r24
T2_asi_reg_rd_87:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 1881: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 31)
	.word 0xf8958020  ! 1885: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_88:
	mov	0x2a, %r14
	.word 0xf0db84a0  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb2c4c000  ! 1893: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0xb20461eb  ! 1894: ADD_I	add 	%r17, 0x01eb, %r25
	.word 0xbc2c2196  ! 1898: ANDN_I	andn 	%r16, 0x0196, %r30
	.word 0xf6d50020  ! 1901: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
cpu_intr_2_151:
	setx	0x2f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_152:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6052185  ! 1908: LDUW_I	lduw	[%r20 + 0x0185], %r27
cpu_intr_2_153:
	setx	0x2c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_154:
	setx	0x2c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_96:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 1912: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfccda18e  ! 1914: LDSBA_I	ldsba	[%r22, + 0x018e] %asi, %r30
cpu_intr_2_155:
	setx	0x2f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c6079  ! 1919: LDUBA_I	lduba	[%r17, + 0x0079] %asi, %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_89:
	mov	0x1c, %r14
	.word 0xfadb89e0  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf094a116  ! 1926: LDUHA_I	lduha	[%r18, + 0x0116] %asi, %r24
cpu_intr_2_156:
	setx	0x2e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_97:
	mov	0x15, %r14
	.word 0xf0f38e40  ! 1929: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b80  ! 1932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b80, %hpstate
cpu_intr_2_157:
	setx	0x2f0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_98:
	mov	0xe, %r14
	.word 0xfcf384a0  ! 1935: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_99:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 1937: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e0a  ! 1938: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
cpu_intr_2_158:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2e0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2248000  ! 1943: SUB_R	sub 	%r18, %r0, %r25
cpu_intr_2_160:
	setx	0x2f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_90:
	mov	0x32, %r14
	.word 0xf2db8e80  ! 1945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_100:
	mov	0x16, %r14
	.word 0xfaf38e60  ! 1949: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_161:
	setx	0x2c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5a16f  ! 1952: LDSWA_I	ldswa	[%r22, + 0x016f] %asi, %r25
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 31)
	.word 0xf44cc000  ! 1958: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf605c000  ! 1959: LDUW_R	lduw	[%r23 + %r0], %r27
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_HPRIV
	.word 0xb80ce088  ! 1962: AND_I	and 	%r19, 0x0088, %r28
T2_asi_reg_wr_101:
	mov	0xe, %r14
	.word 0xf4f38e80  ! 1963: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfc0521ca  ! 1964: LDUW_I	lduw	[%r20 + 0x01ca], %r30
cpu_intr_2_162:
	setx	0x2f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe554000  ! 1968: LDSH_R	ldsh	[%r21 + %r0], %r31
T2_asi_reg_wr_102:
	mov	0x1c, %r14
	.word 0xf8f38e60  ! 1969: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_103:
	mov	0x25, %r14
	.word 0xf8f38e60  ! 1971: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_163:
	setx	0x2d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_164:
	setx	0x2d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_91:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_165:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_166:
	setx	0x2d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_167:
	setx	0x2f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf494e128  ! 1990: LDUHA_I	lduha	[%r19, + 0x0128] %asi, %r26
	.word 0xb5357001  ! 1991: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xf0c58020  ! 1992: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r24
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf65c8000  ! 1995: LDX_R	ldx	[%r18 + %r0], %r27
T2_asi_reg_wr_104:
	mov	0xc, %r14
	.word 0xf4f38e80  ! 1996: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_168:
	setx	0x2e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5e0d3  ! 2002: LDSHA_I	ldsha	[%r23, + 0x00d3] %asi, %r24
	.word 0xfc948020  ! 2003: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
	.word 0xbea50000  ! 2004: SUBcc_R	subcc 	%r20, %r0, %r31
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d50  ! 2006: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d50, %hpstate
T2_asi_reg_rd_92:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb934a001  ! 2008: SRL_I	srl 	%r18, 0x0001, %r28
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d98  ! 2009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d98, %hpstate
	.word 0xf894c020  ! 2010: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	.word 0xb134c000  ! 2013: SRL_R	srl 	%r19, %r0, %r24
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 34)
	.word 0xf4448000  ! 2015: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xf644e0be  ! 2016: LDSW_I	ldsw	[%r19 + 0x00be], %r27
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 8)
	.word 0xf68cc020  ! 2022: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
T2_asi_reg_rd_93:
	mov	0x12, %r14
	.word 0xf2db8e60  ! 2023: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6d50020  ! 2025: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
	.word 0xb444a0a1  ! 2026: ADDC_I	addc 	%r18, 0x00a1, %r26
	.word 0xf4cc6060  ! 2029: LDSBA_I	ldsba	[%r17, + 0x0060] %asi, %r26
cpu_intr_2_169:
	setx	0x2e0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 5)
	.word 0xf6cc4020  ! 2035: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
T2_asi_reg_rd_94:
	mov	0x10, %r14
	.word 0xf6db8e80  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, d)
	.word 0xb3643801  ! 2039: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL1
	.word 0xb3508000  ! 2044: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xb8c4a116  ! 2046: ADDCcc_I	addccc 	%r18, 0x0116, %r28
	.word 0xb80c20c2  ! 2048: AND_I	and 	%r16, 0x00c2, %r28
	.word 0xf85d4000  ! 2049: LDX_R	ldx	[%r21 + %r0], %r28
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 22)
	.word 0xf655601f  ! 2051: LDSH_I	ldsh	[%r21 + 0x001f], %r27
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 21)
	.word 0xf0456093  ! 2053: LDSW_I	ldsw	[%r21 + 0x0093], %r24
	.word 0xbf2d1000  ! 2060: SLLX_R	sllx	%r20, %r0, %r31
T2_asi_reg_rd_95:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_170:
	setx	0x2e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404c000  ! 2068: LDUW_R	lduw	[%r19 + %r0], %r26
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_105:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 2073: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf2d48020  ! 2074: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
	.word 0xf415c000  ! 2075: LDUH_R	lduh	[%r23 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_171:
	setx	0x2c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_172:
	setx	0x2f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_106:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 2091: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf28c8020  ! 2094: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
	.word 0xf4d4e159  ! 2095: LDSHA_I	ldsha	[%r19, + 0x0159] %asi, %r26
T2_asi_reg_rd_96:
	mov	0x2f, %r14
	.word 0xf6db8e40  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_173:
	setx	0x2e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_97:
	mov	0x19, %r14
	.word 0xf8db8e60  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfc054000  ! 2099: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xf2442034  ! 2100: LDSW_I	ldsw	[%r16 + 0x0034], %r25
	.word 0xfa856198  ! 2102: LDUWA_I	lduwa	[%r21, + 0x0198] %asi, %r29
	.word 0xb015c000  ! 2103: OR_R	or 	%r23, %r0, %r24
cpu_intr_2_174:
	setx	0x2c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2454000  ! 2105: LDSW_R	ldsw	[%r21 + %r0], %r25
T2_asi_reg_wr_107:
	mov	0x1e, %r14
	.word 0xfef389e0  ! 2107: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_108:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 2109: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_109:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 2111: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbd2ce001  ! 2112: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xfc8da12e  ! 2113: LDUBA_I	lduba	[%r22, + 0x012e] %asi, %r30
	.word 0xf405207e  ! 2115: LDUW_I	lduw	[%r20 + 0x007e], %r26
T2_asi_reg_rd_98:
	mov	0x23, %r14
	.word 0xf4db8e60  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb92c6001  ! 2119: SLL_I	sll 	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf015611b  ! 2122: LDUH_I	lduh	[%r21 + 0x011b], %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_175:
	setx	0x2c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc5e0cb  ! 2127: LDSWA_I	ldswa	[%r23, + 0x00cb] %asi, %r30
	.word 0xfedda0d2  ! 2128: LDXA_I	ldxa	[%r22, + 0x00d2] %asi, %r31
cpu_intr_2_176:
	setx	0x2f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_177:
	setx	0x2d0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 3a)
	ta	T_CHANGE_HPRIV
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_TO_TL1
	.word 0xf25c4000  ! 2140: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf414a104  ! 2144: LDUH_I	lduh	[%r18 + 0x0104], %r26
cpu_intr_2_178:
	setx	0x2e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65de0b3  ! 2147: LDX_I	ldx	[%r23 + 0x00b3], %r27
T2_asi_reg_wr_110:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 2148: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_179:
	setx	0x2c030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_180:
	setx	0x2d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f48  ! 2154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
	.word 0xf61561af  ! 2155: LDUH_I	lduh	[%r21 + 0x01af], %r27
	.word 0xb3520000  ! 2156: RDPR_PIL	<illegal instruction>
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ec0  ! 2157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec0, %hpstate
T2_asi_reg_wr_111:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 2158: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 11)
	.word 0xfacd6085  ! 2163: LDSBA_I	ldsba	[%r21, + 0x0085] %asi, %r29
cpu_intr_2_181:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb6944000  ! 2170: ORcc_R	orcc 	%r17, %r0, %r27
T2_asi_reg_wr_112:
	mov	0x2c, %r14
	.word 0xf4f38e60  ! 2174: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb9500000  ! 2178: RDPR_TPC	<illegal instruction>
	.word 0xbe3d4000  ! 2180: XNOR_R	xnor 	%r21, %r0, %r31
T2_asi_reg_rd_99:
	mov	0x23, %r14
	.word 0xfedb8400  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfed4e15a  ! 2182: LDSHA_I	ldsha	[%r19, + 0x015a] %asi, %r31
	.word 0xb62d0000  ! 2183: ANDN_R	andn 	%r20, %r0, %r27
	.word 0xb77de401  ! 2187: MOVR_I	movre	%r23, 0x1, %r27
T2_asi_reg_wr_113:
	mov	0x2, %r14
	.word 0xfef38e80  ! 2190: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbc944000  ! 2192: ORcc_R	orcc 	%r17, %r0, %r30
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 21)
	.word 0xfcdc61ad  ! 2194: LDXA_I	ldxa	[%r17, + 0x01ad] %asi, %r30
T2_asi_reg_wr_114:
	mov	0x23, %r14
	.word 0xf8f38e80  ! 2195: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf00c0000  ! 2196: LDUB_R	ldub	[%r16 + %r0], %r24
T2_asi_reg_rd_100:
	mov	0x1d, %r14
	.word 0xf0db84a0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_TO_TL0
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_115:
	mov	0x1c, %r14
	.word 0xfaf384a0  ! 2204: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_182:
	setx	0x2c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285e00c  ! 2206: LDUWA_I	lduwa	[%r23, + 0x000c] %asi, %r25
	.word 0xf88d8020  ! 2207: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
	.word 0xbd641800  ! 2208: MOVcc_R	<illegal instruction>
T2_asi_reg_rd_101:
	mov	0x4, %r14
	.word 0xfcdb84a0  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_116:
	mov	0xf, %r14
	.word 0xf4f38400  ! 2212: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf4050000  ! 2214: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xf48ce07f  ! 2216: LDUBA_I	lduba	[%r19, + 0x007f] %asi, %r26
	.word 0xf8c4e02c  ! 2217: LDSWA_I	ldswa	[%r19, + 0x002c] %asi, %r28
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_102:
	mov	0x15, %r14
	.word 0xf6db8e60  ! 2232: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_183:
	setx	0x2e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_117:
	mov	0x33, %r14
	.word 0xf0f389e0  ! 2244: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_184:
	setx	0x2d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 8)
	.word 0xfe0ce05a  ! 2250: LDUB_I	ldub	[%r19 + 0x005a], %r31
T2_asi_reg_wr_118:
	mov	0x14, %r14
	.word 0xfaf38e80  ! 2255: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_185:
	setx	0x2d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe944020  ! 2261: LDUHA_R	lduha	[%r17, %r0] 0x01, %r31
cpu_intr_2_186:
	setx	0x2c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_103:
	mov	0x15, %r14
	.word 0xf8db8e40  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb0148000  ! 2267: OR_R	or 	%r18, %r0, %r24
	.word 0xf20cc000  ! 2269: LDUB_R	ldub	[%r19 + %r0], %r25
T2_asi_reg_rd_104:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, e)
	.word 0xf0c48020  ! 2277: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc25c000  ! 2281: SUB_R	sub 	%r23, %r0, %r30
	.word 0xfcc460a2  ! 2282: LDSWA_I	ldswa	[%r17, + 0x00a2] %asi, %r30
	.word 0xfac4205d  ! 2284: LDSWA_I	ldswa	[%r16, + 0x005d] %asi, %r29
	.word 0xb93d9000  ! 2287: SRAX_R	srax	%r22, %r0, %r28
T2_asi_reg_wr_119:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 2289: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_187:
	setx	0x31031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb13c6001  ! 2293: SRA_I	sra 	%r17, 0x0001, %r24
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_105:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 2299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2cce0bc  ! 2301: LDSBA_I	ldsba	[%r19, + 0x00bc] %asi, %r25
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 31)
	.word 0xf00c6196  ! 2303: LDUB_I	ldub	[%r17 + 0x0196], %r24
	.word 0xf2c461cb  ! 2306: LDSWA_I	ldswa	[%r17, + 0x01cb] %asi, %r25
	.word 0xbb50c000  ! 2307: RDPR_TT	<illegal instruction>
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_120:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 2314: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 32)
	.word 0xf2944020  ! 2321: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	.word 0xf484a0a9  ! 2322: LDUWA_I	lduwa	[%r18, + 0x00a9] %asi, %r26
T2_asi_reg_rd_106:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 2325: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_188:
	setx	0x33013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 2327: RDPR_PIL	<illegal instruction>
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 1d)
	.word 0xb13cf001  ! 2329: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xfccd0020  ! 2331: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
	.word 0xf4cc0020  ! 2333: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
	.word 0x8594e1df  ! 2334: WRPR_TSTATE_I	wrpr	%r19, 0x01df, %tstate
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf245c000  ! 2338: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb13cd000  ! 2343: SRAX_R	srax	%r19, %r0, %r24
	.word 0xfc5de1d4  ! 2344: LDX_I	ldx	[%r23 + 0x01d4], %r30
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_189:
	setx	0x31010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe548000  ! 2347: LDSH_R	ldsh	[%r18 + %r0], %r31
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 2)
	.word 0xb844c000  ! 2349: ADDC_R	addc 	%r19, %r0, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf4454000  ! 2355: LDSW_R	ldsw	[%r21 + %r0], %r26
cpu_intr_2_190:
	setx	0x32032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_121:
	mov	0xd, %r14
	.word 0xf4f38400  ! 2361: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfcd4e03c  ! 2363: LDSHA_I	ldsha	[%r19, + 0x003c] %asi, %r30
	.word 0xf855a080  ! 2364: LDSH_I	ldsh	[%r22 + 0x0080], %r28
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, d)
	.word 0xf4948020  ! 2368: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_TO_TL1
	.word 0xb0ad0000  ! 2374: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xf40c4000  ! 2378: LDUB_R	ldub	[%r17 + %r0], %r26
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_122:
	mov	0x30, %r14
	.word 0xf8f384a0  ! 2380: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_191:
	setx	0x310326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_192:
	setx	0x330332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_TO_TL0
	.word 0xfc844020  ! 2394: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
T2_asi_reg_wr_123:
	mov	0x16, %r14
	.word 0xf0f38e60  ! 2396: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_124:
	mov	0x20, %r14
	.word 0xfef384a0  ! 2397: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8554000  ! 2398: LDSH_R	ldsh	[%r21 + %r0], %r28
T2_asi_reg_rd_107:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_193:
	setx	0x320312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_194:
	setx	0x30023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_125:
	mov	0x19, %r14
	.word 0xf4f384a0  ! 2407: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfacdc020  ! 2409: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
cpu_intr_2_195:
	setx	0x32000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf655204e  ! 2413: LDSH_I	ldsh	[%r20 + 0x004e], %r27
T2_asi_reg_wr_126:
	mov	0xc, %r14
	.word 0xf8f384a0  ! 2414: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf65d6136  ! 2418: LDX_I	ldx	[%r21 + 0x0136], %r27
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819838ca  ! 2419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18ca, %hpstate
	.word 0xf8550000  ! 2423: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xfac54020  ! 2428: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcd44020  ! 2431: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
	.word 0xf685c020  ! 2434: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa4c60c0  ! 2439: LDSB_I	ldsb	[%r17 + 0x00c0], %r29
	.word 0xf2544000  ! 2440: LDSH_R	ldsh	[%r17 + %r0], %r25
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf4940020  ! 2444: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xf4156158  ! 2448: LDUH_I	lduh	[%r21 + 0x0158], %r26
T2_asi_reg_wr_127:
	mov	0x1b, %r14
	.word 0xfcf389e0  ! 2449: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_108:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_196:
	setx	0x300227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecde11b  ! 2454: LDSBA_I	ldsba	[%r23, + 0x011b] %asi, %r31
T2_asi_reg_wr_128:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 2460: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf40ce02b  ! 2461: LDUB_I	ldub	[%r19 + 0x002b], %r26
	.word 0xfc954020  ! 2465: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
	.word 0xfacc2169  ! 2467: LDSBA_I	ldsba	[%r16, + 0x0169] %asi, %r29
T2_asi_reg_rd_109:
	mov	0x36, %r14
	.word 0xfcdb8e40  ! 2469: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4840020  ! 2470: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 13)
	.word 0xbd3d3001  ! 2472: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xfa0d8000  ! 2473: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf2146164  ! 2474: LDUH_I	lduh	[%r17 + 0x0164], %r25
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa95a1cf  ! 2478: LDUHA_I	lduha	[%r22, + 0x01cf] %asi, %r29
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 3)
	.word 0xf0444000  ! 2481: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf285e1bb  ! 2483: LDUWA_I	lduwa	[%r23, + 0x01bb] %asi, %r25
	.word 0xf04460c8  ! 2484: LDSW_I	ldsw	[%r17 + 0x00c8], %r24
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_129:
	mov	0x23, %r14
	.word 0xf0f38e80  ! 2487: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_wr_130:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 2488: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb2b5e130  ! 2489: ORNcc_I	orncc 	%r23, 0x0130, %r25
	.word 0xfe4c2174  ! 2490: LDSB_I	ldsb	[%r16 + 0x0174], %r31
	.word 0xbf2d8000  ! 2491: SLL_R	sll 	%r22, %r0, %r31
	.word 0xfa146167  ! 2492: LDUH_I	lduh	[%r17 + 0x0167], %r29
	.word 0xb43c0000  ! 2493: XNOR_R	xnor 	%r16, %r0, %r26
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 25)
	.word 0xf495c020  ! 2500: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xf4950020  ! 2501: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
cpu_intr_2_197:
	setx	0x31012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c8020  ! 2508: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
cpu_intr_2_198:
	setx	0x31020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb244e122  ! 2512: ADDC_I	addc 	%r19, 0x0122, %r25
	.word 0xfac4e0b0  ! 2513: LDSWA_I	ldswa	[%r19, + 0x00b0] %asi, %r29
T2_asi_reg_rd_110:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 2514: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_199:
	setx	0x310336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_111:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 2519: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0cca02b  ! 2520: LDSBA_I	ldsba	[%r18, + 0x002b] %asi, %r24
cpu_intr_2_200:
	setx	0x30020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0d61ff  ! 2523: AND_I	and 	%r21, 0x01ff, %r31
T2_asi_reg_wr_131:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 2524: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6c58020  ! 2525: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 6)
	.word 0xb81ce00b  ! 2528: XOR_I	xor 	%r19, 0x000b, %r28
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 26)
	.word 0xf414618d  ! 2530: LDUH_I	lduh	[%r17 + 0x018d], %r26
	.word 0xf4144000  ! 2532: LDUH_R	lduh	[%r17 + %r0], %r26
T2_asi_reg_rd_112:
	mov	0x3, %r14
	.word 0xf8db8e80  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf80520b6  ! 2537: LDUW_I	lduw	[%r20 + 0x00b6], %r28
	.word 0xfedda1a8  ! 2541: LDXA_I	ldxa	[%r22, + 0x01a8] %asi, %r31
T2_asi_reg_wr_132:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 2543: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 23)
	.word 0xbe3d8000  ! 2548: XNOR_R	xnor 	%r22, %r0, %r31
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 29)
	.word 0xf6954020  ! 2550: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
	.word 0xb52c4000  ! 2551: SLL_R	sll 	%r17, %r0, %r26
cpu_intr_2_201:
	setx	0x300212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6540000  ! 2554: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xf05c61a8  ! 2555: LDX_I	ldx	[%r17 + 0x01a8], %r24
	.word 0xfa8c21da  ! 2556: LDUBA_I	lduba	[%r16, + 0x01da] %asi, %r29
	.word 0xfe8d4020  ! 2559: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
T2_asi_reg_wr_133:
	mov	0x14, %r14
	.word 0xfaf38400  ! 2561: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf84dc000  ! 2563: LDSB_R	ldsb	[%r23 + %r0], %r28
T2_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 2564: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf8c56094  ! 2566: LDSWA_I	ldswa	[%r21, + 0x0094] %asi, %r28
	.word 0xfa84e1f0  ! 2567: LDUWA_I	lduwa	[%r19, + 0x01f0] %asi, %r29
	.word 0xfa44207d  ! 2570: LDSW_I	ldsw	[%r16 + 0x007d], %r29
	.word 0xf25d0000  ! 2572: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xb9346001  ! 2573: SRL_I	srl 	%r17, 0x0001, %r28
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 20)
	.word 0xb83c0000  ! 2578: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xf40ce1d4  ! 2582: LDUB_I	ldub	[%r19 + 0x01d4], %r26
T2_asi_reg_wr_134:
	mov	0x12, %r14
	.word 0xf0f38400  ! 2584: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa5c607e  ! 2585: LDX_I	ldx	[%r17 + 0x007e], %r29
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_TO_TL0
	.word 0xb4948000  ! 2589: ORcc_R	orcc 	%r18, %r0, %r26
	.word 0xbcbd4000  ! 2590: XNORcc_R	xnorcc 	%r21, %r0, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf8558000  ! 2592: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xfc158000  ! 2593: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xfe4ce1ed  ! 2595: LDSB_I	ldsb	[%r19 + 0x01ed], %r31
	.word 0xf4144000  ! 2596: LDUH_R	lduh	[%r17 + %r0], %r26
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_202:
	setx	0x300019, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_135:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 2605: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_203:
	setx	0x30023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494c000  ! 2607: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xfe95c020  ! 2610: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xf2054000  ! 2611: LDUW_R	lduw	[%r21 + %r0], %r25
T2_asi_reg_wr_136:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 2613: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_114:
	mov	0x1e, %r14
	.word 0xf0db8e60  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_204:
	setx	0x300128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_115:
	mov	0x30, %r14
	.word 0xfadb8e40  ! 2621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb2a5c000  ! 2622: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0x8994e1df  ! 2625: WRPR_TICK_I	wrpr	%r19, 0x01df, %tick
T2_asi_reg_wr_137:
	mov	0x4, %r14
	.word 0xf0f38e40  ! 2626: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_138:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 2629: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc442138  ! 2630: LDSW_I	ldsw	[%r16 + 0x0138], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf004c000  ! 2632: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf00ca08e  ! 2635: LDUB_I	ldub	[%r18 + 0x008e], %r24
	.word 0xbb3ca001  ! 2636: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0xb8ac20e3  ! 2637: ANDNcc_I	andncc 	%r16, 0x00e3, %r28
	.word 0xf0d5a01a  ! 2639: LDSHA_I	ldsha	[%r22, + 0x001a] %asi, %r24
	.word 0xf445e105  ! 2641: LDSW_I	ldsw	[%r23 + 0x0105], %r26
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_205:
	setx	0x310330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, c)
	.word 0xf244c000  ! 2651: LDSW_R	ldsw	[%r19 + %r0], %r25
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 26)
	.word 0xf6544000  ! 2654: LDSH_R	ldsh	[%r17 + %r0], %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_139:
	mov	0x25, %r14
	.word 0xf2f38e80  ! 2660: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_116:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 2662: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_206:
	setx	0x32030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_207:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c8000  ! 2669: LDX_R	ldx	[%r18 + %r0], %r25
T2_asi_reg_wr_140:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 2670: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_141:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 2672: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_142:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 2673: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe848020  ! 2674: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
	.word 0xf605c000  ! 2676: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xb2b5a0ed  ! 2678: SUBCcc_I	orncc 	%r22, 0x00ed, %r25
	.word 0xf84d0000  ! 2679: LDSB_R	ldsb	[%r20 + %r0], %r28
cpu_intr_2_208:
	setx	0x31022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c4000  ! 2681: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xf8c52142  ! 2682: LDSWA_I	ldswa	[%r20, + 0x0142] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_143:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2685: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_117:
	mov	0x18, %r14
	.word 0xfedb8e60  ! 2688: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf08c0020  ! 2692: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
cpu_intr_2_209:
	setx	0x300023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cca073  ! 2696: LDSBA_I	ldsba	[%r18, + 0x0073] %asi, %r26
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982810  ! 2698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
T2_asi_reg_wr_144:
	mov	0x12, %r14
	.word 0xf0f38400  ! 2699: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf085e08b  ! 2700: LDUWA_I	lduwa	[%r23, + 0x008b] %asi, %r24
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 33)
	.word 0xf2140000  ! 2707: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xfa0de1ff  ! 2710: LDUB_I	ldub	[%r23 + 0x01ff], %r29
	.word 0xfac4c020  ! 2711: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_210:
	setx	0x370326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4846158  ! 2714: LDUWA_I	lduwa	[%r17, + 0x0158] %asi, %r26
	.word 0xb3643801  ! 2715: MOVcc_I	<illegal instruction>
	.word 0xf2cd214e  ! 2719: LDSBA_I	ldsba	[%r20, + 0x014e] %asi, %r25
cpu_intr_2_211:
	setx	0x360130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_145:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 2722: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf085a0eb  ! 2723: LDUWA_I	lduwa	[%r22, + 0x00eb] %asi, %r24
T2_asi_reg_wr_146:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 2724: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_118:
	mov	0xd, %r14
	.word 0xf2db8e60  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_212:
	setx	0x36000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_213:
	setx	0x360306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_214:
	setx	0x370313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_119:
	mov	0x17, %r14
	.word 0xf4db89e0  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_147:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 2739: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe4c8000  ! 2744: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xfc8de1cf  ! 2745: LDUBA_I	lduba	[%r23, + 0x01cf] %asi, %r30
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 9)
	.word 0xf85520b8  ! 2750: LDSH_I	ldsh	[%r20 + 0x00b8], %r28
	.word 0xf2844020  ! 2752: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r25
	.word 0xf2044000  ! 2753: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xf0150000  ! 2754: LDUH_R	lduh	[%r20 + %r0], %r24
cpu_intr_2_215:
	setx	0x36000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_148:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 2756: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_216:
	setx	0x340109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20dc000  ! 2762: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xfedc60bd  ! 2764: LDXA_I	ldxa	[%r17, + 0x00bd] %asi, %r31
	.word 0xf2cc0020  ! 2766: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
	.word 0xf64d0000  ! 2767: LDSB_R	ldsb	[%r20 + %r0], %r27
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_120:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2776: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf6848020  ! 2777: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 6)
	.word 0xb2ac60ef  ! 2781: ANDNcc_I	andncc 	%r17, 0x00ef, %r25
	.word 0xf0d58020  ! 2783: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_121:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 2784: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf2454000  ! 2786: LDSW_R	ldsw	[%r21 + %r0], %r25
T2_asi_reg_wr_149:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 2789: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_217:
	setx	0x350119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_150:
	mov	0x22, %r14
	.word 0xf0f38e80  ! 2791: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_122:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfac421fe  ! 2795: LDSWA_I	ldswa	[%r16, + 0x01fe] %asi, %r29
cpu_intr_2_218:
	setx	0x350307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_151:
	mov	0xc, %r14
	.word 0xf6f38e40  ! 2799: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc85a161  ! 2804: LDUWA_I	lduwa	[%r22, + 0x0161] %asi, %r30
cpu_intr_2_219:
	setx	0x360327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_123:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 2809: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_220:
	setx	0x360139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_221:
	setx	0x370034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe046197  ! 2821: LDUW_I	lduw	[%r17 + 0x0197], %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_222:
	setx	0x340108, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
cpu_intr_2_223:
	setx	0x340230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8194e0b7  ! 2834: WRPR_TPC_I	wrpr	%r19, 0x00b7, %tpc
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 31)
	.word 0xf60de185  ! 2836: LDUB_I	ldub	[%r23 + 0x0185], %r27
T2_asi_reg_wr_152:
	mov	0xb, %r14
	.word 0xfcf38e60  ! 2837: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfa15619a  ! 2839: LDUH_I	lduh	[%r21 + 0x019a], %r29
cpu_intr_2_224:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_225:
	setx	0x340305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2154000  ! 2848: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xb29d209a  ! 2850: XORcc_I	xorcc 	%r20, 0x009a, %r25
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 6)
	.word 0xfe44e099  ! 2852: LDSW_I	ldsw	[%r19 + 0x0099], %r31
	.word 0xbb2c0000  ! 2856: SLL_R	sll 	%r16, %r0, %r29
	.word 0xf4d4c020  ! 2858: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819838d8  ! 2859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d8, %hpstate
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 18)
	.word 0xf8448000  ! 2863: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xf24c0000  ! 2864: LDSB_R	ldsb	[%r16 + %r0], %r25
T2_asi_reg_rd_124:
	mov	0x38, %r14
	.word 0xf2db84a0  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf68d8020  ! 2866: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 33)
	.word 0xf8448000  ! 2871: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfa55c000  ! 2874: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xfa95e1cc  ! 2877: LDUHA_I	lduha	[%r23, + 0x01cc] %asi, %r29
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_125:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 2884: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, d)
	.word 0xbe840000  ! 2886: ADDcc_R	addcc 	%r16, %r0, %r31
cpu_intr_2_226:
	setx	0x37012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_153:
	mov	0x2a, %r14
	.word 0xfaf38e60  ! 2889: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf45c8000  ! 2890: LDX_R	ldx	[%r18 + %r0], %r26
cpu_intr_2_227:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_154:
	mov	0x18, %r14
	.word 0xfef38e40  ! 2893: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_155:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 2895: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf64c0000  ! 2901: LDSB_R	ldsb	[%r16 + %r0], %r27
cpu_intr_2_228:
	setx	0x340228, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfe8c4020  ! 2906: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xb20c60cf  ! 2907: AND_I	and 	%r17, 0x00cf, %r25
cpu_intr_2_229:
	setx	0x360202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8458000  ! 2910: LDSW_R	ldsw	[%r22 + %r0], %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfa8dc020  ! 2913: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
T2_asi_reg_rd_126:
	mov	0x26, %r14
	.word 0xf6db8e80  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe14c000  ! 2917: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xb604201a  ! 2918: ADD_I	add 	%r16, 0x001a, %r27
cpu_intr_2_230:
	setx	0x360225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_231:
	setx	0x370121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_156:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 2931: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_232:
	setx	0x340002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_233:
	setx	0x370006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_234:
	setx	0x36011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02c21f6  ! 2942: ANDN_I	andn 	%r16, 0x01f6, %r24
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_235:
	setx	0x36021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_127:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_236:
	setx	0x350015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 11)
	.word 0xb12cb001  ! 2953: SLLX_I	sllx	%r18, 0x0001, %r24
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_237:
	setx	0x370234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415206b  ! 2958: LDUH_I	lduh	[%r20 + 0x006b], %r26
cpu_intr_2_238:
	setx	0x36002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	.word 0xfe8c20a6  ! 2974: LDUBA_I	lduba	[%r16, + 0x00a6] %asi, %r31
T2_asi_reg_wr_157:
	mov	0x23, %r14
	.word 0xfef38e40  ! 2975: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0cd4020  ! 2977: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e8a  ! 2978: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
	.word 0xb12d4000  ! 2982: SLL_R	sll 	%r21, %r0, %r24
cpu_intr_2_239:
	setx	0x340102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03de0d6  ! 2986: XNOR_I	xnor 	%r23, 0x00d6, %r24
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 5)
	.word 0xf0dde157  ! 2991: LDXA_I	ldxa	[%r23, + 0x0157] %asi, %r24
	.word 0xf8948020  ! 2993: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	.word 0xf4d461fa  ! 2995: LDSHA_I	ldsha	[%r17, + 0x01fa] %asi, %r26
	.word 0xba04c000  ! 2996: ADD_R	add 	%r19, %r0, %r29
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 29)
	.word 0xf205c000  ! 2999: LDUW_R	lduw	[%r23 + %r0], %r25
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 5)
	.word 0xb32c5000  ! 3009: SLLX_R	sllx	%r17, %r0, %r25
	.word 0xf2dc2185  ! 3010: LDXA_I	ldxa	[%r16, + 0x0185] %asi, %r25
	.word 0xf095c020  ! 3013: LDUHA_R	lduha	[%r23, %r0] 0x01, %r24
T2_asi_reg_rd_128:
	mov	0x17, %r14
	.word 0xfedb8e60  ! 3014: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb53d9000  ! 3015: SRAX_R	srax	%r22, %r0, %r26
	.word 0xf6548000  ! 3016: LDSH_R	ldsh	[%r18 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xb4c54000  ! 3020: ADDCcc_R	addccc 	%r21, %r0, %r26
T2_asi_reg_wr_158:
	mov	0x28, %r14
	.word 0xf6f38400  ! 3022: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_rd_129:
	mov	0x2c, %r14
	.word 0xf8db8400  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb0854000  ! 3026: ADDcc_R	addcc 	%r21, %r0, %r24
T2_asi_reg_wr_159:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 3027: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
	.word 0xfc8ca0ce  ! 3031: LDUBA_I	lduba	[%r18, + 0x00ce] %asi, %r30
	.word 0xfcd42001  ! 3032: LDSHA_I	ldsha	[%r16, + 0x0001] %asi, %r30
cpu_intr_2_240:
	setx	0x340035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2548000  ! 3034: LDSH_R	ldsh	[%r18 + %r0], %r25
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, d)
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 18)
	.word 0xf004c000  ! 3043: LDUW_R	lduw	[%r19 + %r0], %r24
T2_asi_reg_rd_130:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4c4e0b3  ! 3046: LDSWA_I	ldswa	[%r19, + 0x00b3] %asi, %r26
	.word 0xf64ca0ca  ! 3047: LDSB_I	ldsb	[%r18 + 0x00ca], %r27
cpu_intr_2_241:
	setx	0x340110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_242:
	setx	0x360012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24e198  ! 3052: SUB_I	sub 	%r19, 0x0198, %r29
	.word 0xf614e121  ! 3056: LDUH_I	lduh	[%r19 + 0x0121], %r27
	.word 0xf4c5213f  ! 3057: LDSWA_I	ldswa	[%r20, + 0x013f] %asi, %r26
T2_asi_reg_wr_160:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 3058: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_243:
	setx	0x34031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_244:
	setx	0x35021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_131:
	mov	0x1b, %r14
	.word 0xfedb84a0  ! 3069: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfa5460f5  ! 3072: LDSH_I	ldsh	[%r17 + 0x00f5], %r29
T2_asi_reg_wr_161:
	mov	0x13, %r14
	.word 0xfef384a0  ! 3073: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa850020  ! 3074: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r29
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_245:
	setx	0x340134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_162:
	mov	0x4, %r14
	.word 0xf6f38400  ! 3084: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbd3c8000  ! 3085: SRA_R	sra 	%r18, %r0, %r30
	.word 0xb6b58000  ! 3086: ORNcc_R	orncc 	%r22, %r0, %r27
T2_asi_reg_rd_132:
	mov	0x26, %r14
	.word 0xfedb89e0  ! 3090: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983fd0  ! 3091: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd0, %hpstate
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe54c000  ! 3096: LDSH_R	ldsh	[%r19 + %r0], %r31
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_133:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb33d0000  ! 3099: SRA_R	sra 	%r20, %r0, %r25
T2_asi_reg_rd_134:
	mov	0x24, %r14
	.word 0xfadb89e0  ! 3101: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 4)
	.word 0xf8440000  ! 3106: LDSW_R	ldsw	[%r16 + %r0], %r28
T2_asi_reg_rd_135:
	mov	0xe, %r14
	.word 0xfcdb8e80  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf88d2034  ! 3110: LDUBA_I	lduba	[%r20, + 0x0034] %asi, %r28
	.word 0xb12dd000  ! 3111: SLLX_R	sllx	%r23, %r0, %r24
cpu_intr_2_246:
	setx	0x370134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x36021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_163:
	mov	0x20, %r14
	.word 0xfcf38e60  ! 3117: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_164:
	mov	0x26, %r14
	.word 0xfef38e80  ! 3122: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfec5c020  ! 3125: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
cpu_intr_2_248:
	setx	0x36011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba84e0cd  ! 3129: ADDcc_I	addcc 	%r19, 0x00cd, %r29
cpu_intr_2_249:
	setx	0x34011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe840020  ! 3132: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 0)
	.word 0xf85d218f  ! 3136: LDX_I	ldx	[%r20 + 0x018f], %r28
	.word 0xb2b5c000  ! 3139: ORNcc_R	orncc 	%r23, %r0, %r25
cpu_intr_2_250:
	setx	0x360307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_251:
	setx	0x370234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_136:
	mov	0x30, %r14
	.word 0xf2db8e60  ! 3148: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_252:
	setx	0x360123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_253:
	setx	0x350300, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_137:
	mov	0x10, %r14
	.word 0xf8db8e60  ! 3155: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb32c8000  ! 3162: SLL_R	sll 	%r18, %r0, %r25
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_254:
	setx	0x35001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe852025  ! 3167: LDUWA_I	lduwa	[%r20, + 0x0025] %asi, %r31
	.word 0xf605200b  ! 3172: LDUW_I	lduw	[%r20 + 0x000b], %r27
T2_asi_reg_rd_138:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 3174: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb40c61bb  ! 3179: AND_I	and 	%r17, 0x01bb, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 36)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819829ca  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
T2_asi_reg_rd_139:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f1a  ! 3189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1a, %hpstate
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 12)
	.word 0xf655a106  ! 3197: LDSH_I	ldsh	[%r22 + 0x0106], %r27
T2_asi_reg_rd_140:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 3199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_165:
	mov	0x4, %r14
	.word 0xf6f38e60  ! 3200: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbc358000  ! 3201: SUBC_R	orn 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0xf2cde0bf  ! 3203: LDSBA_I	ldsba	[%r23, + 0x00bf] %asi, %r25
cpu_intr_2_255:
	setx	0x3a0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf454e0bb  ! 3206: LDSH_I	ldsh	[%r19 + 0x00bb], %r26
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_166:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 3212: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf055e06c  ! 3219: LDSH_I	ldsh	[%r23 + 0x006c], %r24
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf44ca00b  ! 3227: LDSB_I	ldsb	[%r18 + 0x000b], %r26
T2_asi_reg_wr_167:
	mov	0x26, %r14
	.word 0xf4f38e60  ! 3229: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_168:
	mov	0x36, %r14
	.word 0xfef38e40  ! 3231: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfecc4020  ! 3232: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r31
	.word 0xb43561b7  ! 3235: SUBC_I	orn 	%r21, 0x01b7, %r26
cpu_intr_2_256:
	setx	0x380200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe050000  ! 3237: ADD_R	add 	%r20, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_169:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 3245: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa048000  ! 3248: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xb035e1d2  ! 3250: ORN_I	orn 	%r23, 0x01d2, %r24
T2_asi_reg_wr_170:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 3252: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbf643801  ! 3255: MOVcc_I	<illegal instruction>
T2_asi_reg_wr_171:
	mov	0x4, %r14
	.word 0xfaf38400  ! 3260: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe546184  ! 3263: LDSH_I	ldsh	[%r17 + 0x0184], %r31
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfe956155  ! 3271: LDUHA_I	lduha	[%r21, + 0x0155] %asi, %r31
	.word 0xf88cc020  ! 3273: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
cpu_intr_2_257:
	setx	0x390339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa858020  ! 3280: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
	.word 0xf6540000  ! 3281: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xf4050000  ! 3283: LDUW_R	lduw	[%r20 + %r0], %r26
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_172:
	mov	0x31, %r14
	.word 0xf4f38e60  ! 3287: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_258:
	setx	0x390130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa85616d  ! 3292: LDUWA_I	lduwa	[%r21, + 0x016d] %asi, %r29
cpu_intr_2_259:
	setx	0x38010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dce117  ! 3297: LDXA_I	ldxa	[%r19, + 0x0117] %asi, %r27
	.word 0xf44de074  ! 3299: LDSB_I	ldsb	[%r23 + 0x0074], %r26
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 26)
	.word 0xf68c4020  ! 3301: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
	.word 0xfcc4202f  ! 3302: LDSWA_I	ldswa	[%r16, + 0x002f] %asi, %r30
	.word 0xfe85a163  ! 3304: LDUWA_I	lduwa	[%r22, + 0x0163] %asi, %r31
	.word 0xf24d8000  ! 3305: LDSB_R	ldsb	[%r22 + %r0], %r25
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_141:
	mov	0x27, %r14
	.word 0xfcdb89e0  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfcc5619b  ! 3315: LDSWA_I	ldswa	[%r21, + 0x019b] %asi, %r30
	.word 0xfec46170  ! 3317: LDSWA_I	ldswa	[%r17, + 0x0170] %asi, %r31
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 37)
	.word 0xf244e003  ! 3320: LDSW_I	ldsw	[%r19 + 0x0003], %r25
cpu_intr_2_260:
	setx	0x3a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335c000  ! 3324: SRL_R	srl 	%r23, %r0, %r25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 37)
	.word 0xba1460ea  ! 3328: OR_I	or 	%r17, 0x00ea, %r29
T2_asi_reg_wr_173:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 3330: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_261:
	setx	0x3b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, c)
	.word 0xf6558000  ! 3340: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf0cce089  ! 3341: LDSBA_I	ldsba	[%r19, + 0x0089] %asi, %r24
	.word 0xb6958000  ! 3342: ORcc_R	orcc 	%r22, %r0, %r27
cpu_intr_2_262:
	setx	0x3a021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_142:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf6cc202c  ! 3356: LDSBA_I	ldsba	[%r16, + 0x002c] %asi, %r27
	.word 0xb17cc400  ! 3359: MOVR_R	movre	%r19, %r0, %r24
	.word 0xf8540000  ! 3360: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xfa15c000  ! 3365: LDUH_R	lduh	[%r23 + %r0], %r29
cpu_intr_2_263:
	setx	0x3a022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_264:
	setx	0x390129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, e)
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 24)
	.word 0xf25d8000  ! 3378: LDX_R	ldx	[%r22 + %r0], %r25
T2_asi_reg_wr_174:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 3379: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_wr_175:
	mov	0x37, %r14
	.word 0xfcf38e80  ! 3380: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf08da1ed  ! 3382: LDUBA_I	lduba	[%r22, + 0x01ed] %asi, %r24
	.word 0xfec42087  ! 3383: LDSWA_I	ldswa	[%r16, + 0x0087] %asi, %r31
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_176:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3388: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_177:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 3389: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 5)
	.word 0xf48460f0  ! 3396: LDUWA_I	lduwa	[%r17, + 0x00f0] %asi, %r26
	.word 0xba8ce039  ! 3400: ANDcc_I	andcc 	%r19, 0x0039, %r29
	.word 0xf605a124  ! 3401: LDUW_I	lduw	[%r22 + 0x0124], %r27
	.word 0xf4946121  ! 3402: LDUHA_I	lduha	[%r17, + 0x0121] %asi, %r26
	.word 0xf45d60ae  ! 3405: LDX_I	ldx	[%r21 + 0x00ae], %r26
cpu_intr_2_265:
	setx	0x39033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ccc020  ! 3407: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r28
	.word 0xf0158000  ! 3409: LDUH_R	lduh	[%r22 + %r0], %r24
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 11)
	.word 0xbf357001  ! 3414: SRLX_I	srlx	%r21, 0x0001, %r31
	.word 0xbb50c000  ! 3415: RDPR_TT	<illegal instruction>
cpu_intr_2_266:
	setx	0x3b0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_143:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 3421: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf4940020  ! 3425: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xf0544000  ! 3429: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xb6ace05d  ! 3430: ANDNcc_I	andncc 	%r19, 0x005d, %r27
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_178:
	mov	0x11, %r14
	.word 0xf2f389e0  ! 3438: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf8144000  ! 3439: LDUH_R	lduh	[%r17 + %r0], %r28
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, c)
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_144:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb81ce106  ! 3451: XOR_I	xor 	%r19, 0x0106, %r28
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e9a  ! 3455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9a, %hpstate
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 2)
	.word 0xf40de025  ! 3460: LDUB_I	ldub	[%r23 + 0x0025], %r26
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 38)
	.word 0xfc84c020  ! 3462: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
T2_asi_reg_wr_179:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 3466: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf24c61fe  ! 3467: LDSB_I	ldsb	[%r17 + 0x01fe], %r25
cpu_intr_2_267:
	setx	0x3a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_180:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 3469: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 3c)
	.word 0xbc3cc000  ! 3473: XNOR_R	xnor 	%r19, %r0, %r30
	.word 0xb83ca176  ! 3474: XNOR_I	xnor 	%r18, 0x0176, %r28
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 29)
	.word 0xf694a1fb  ! 3478: LDUHA_I	lduha	[%r18, + 0x01fb] %asi, %r27
	.word 0xf484c020  ! 3479: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819828d0  ! 3480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d0, %hpstate
	.word 0xfa15a116  ! 3481: LDUH_I	lduh	[%r22 + 0x0116], %r29
	.word 0xb2bce07b  ! 3483: XNORcc_I	xnorcc 	%r19, 0x007b, %r25
cpu_intr_2_268:
	setx	0x3a033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415e1c4  ! 3486: LDUH_I	lduh	[%r23 + 0x01c4], %r26
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_269:
	setx	0x39003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_270:
	setx	0x380003, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_181:
	mov	0x8, %r14
	.word 0xfcf38400  ! 3494: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_182:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 3496: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_271:
	setx	0x390305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba35616a  ! 3503: SUBC_I	orn 	%r21, 0x016a, %r29
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 12)
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982998  ! 3506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 9)
	.word 0xf24d21c0  ! 3509: LDSB_I	ldsb	[%r20 + 0x01c0], %r25
	.word 0xf805601e  ! 3510: LDUW_I	lduw	[%r21 + 0x001e], %r28
cpu_intr_2_272:
	setx	0x3b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 12)
	.word 0xf6056000  ! 3520: LDUW_I	lduw	[%r21 + 0x0000], %r27
cpu_intr_2_273:
	setx	0x380338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5c000  ! 3523: SUBcc_R	subcc 	%r23, %r0, %r30
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 16)
	.word 0xb1504000  ! 3528: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xfa940020  ! 3533: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
	.word 0xf0146092  ! 3538: LDUH_I	lduh	[%r17 + 0x0092], %r24
T2_asi_reg_wr_183:
	mov	0x8, %r14
	.word 0xf2f38e60  ! 3541: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfac5c020  ! 3543: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r29
T2_asi_reg_wr_184:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 3544: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_185:
	mov	0x0, %r14
	.word 0xfef38e60  ! 3547: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe5c60a2  ! 3551: LDX_I	ldx	[%r17 + 0x00a2], %r31
	.word 0xfe8cc020  ! 3553: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a0a  ! 3567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0a, %hpstate
T2_asi_reg_wr_186:
	mov	0x1a, %r14
	.word 0xf8f38e40  ! 3569: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe940020  ! 3571: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
	.word 0xfa5cc000  ! 3577: LDX_R	ldx	[%r19 + %r0], %r29
T2_asi_reg_wr_187:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 3578: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_274:
	setx	0x3a0215, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_188:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 3583: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_189:
	mov	0x38, %r14
	.word 0xf0f38e60  ! 3585: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf284c020  ! 3588: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_275:
	setx	0x380026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21521ee  ! 3592: LDUH_I	lduh	[%r20 + 0x01ee], %r25
	.word 0xf85c615f  ! 3593: LDX_I	ldx	[%r17 + 0x015f], %r28
cpu_intr_2_276:
	setx	0x390031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d212b  ! 3595: XOR_I	xor 	%r20, 0x012b, %r24
cpu_intr_2_277:
	setx	0x390219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cc000  ! 3597: SLL_R	sll 	%r19, %r0, %r24
T2_asi_reg_rd_145:
	mov	0x2b, %r14
	.word 0xf8db8400  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_190:
	mov	0x10, %r14
	.word 0xf0f38e40  ! 3599: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfed5a06d  ! 3600: LDSHA_I	ldsha	[%r22, + 0x006d] %asi, %r31
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_146:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf094e157  ! 3607: LDUHA_I	lduha	[%r19, + 0x0157] %asi, %r24
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_278:
	setx	0x3a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_147:
	mov	0x18, %r14
	.word 0xfadb8400  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfc4c6195  ! 3614: LDSB_I	ldsb	[%r17 + 0x0195], %r30
T2_asi_reg_rd_148:
	mov	0xe, %r14
	.word 0xf0db8e60  ! 3616: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_191:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 3618: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_149:
	mov	0xe, %r14
	.word 0xf6db89e0  ! 3619: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf055c000  ! 3621: LDSH_R	ldsh	[%r23 + %r0], %r24
T2_asi_reg_rd_150:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_wr_192:
	mov	0xc, %r14
	.word 0xf2f38e80  ! 3627: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4d58020  ! 3629: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
	.word 0xf0c5c020  ! 3631: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf284a11e  ! 3634: LDUWA_I	lduwa	[%r18, + 0x011e] %asi, %r25
	.word 0xfa842107  ! 3635: LDUWA_I	lduwa	[%r16, + 0x0107] %asi, %r29
	.word 0xb5354000  ! 3636: SRL_R	srl 	%r21, %r0, %r26
	.word 0xfe4561ee  ! 3637: LDSW_I	ldsw	[%r21 + 0x01ee], %r31
T2_asi_reg_wr_193:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 3639: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_279:
	setx	0x3d0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_194:
	mov	0x21, %r14
	.word 0xfcf38e80  ! 3642: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf8cd4020  ! 3646: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_195:
	mov	0x2b, %r14
	.word 0xfcf38e60  ! 3651: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_151:
	mov	0x2e, %r14
	.word 0xf2db8e80  ! 3655: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfcdda01c  ! 3656: LDXA_I	ldxa	[%r22, + 0x001c] %asi, %r30
	.word 0xfa4ca049  ! 3658: LDSB_I	ldsb	[%r18 + 0x0049], %r29
T2_asi_reg_wr_196:
	mov	0x25, %r14
	.word 0xf8f389e0  ! 3660: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf2856055  ! 3661: LDUWA_I	lduwa	[%r21, + 0x0055] %asi, %r25
	.word 0xfe5521a8  ! 3664: LDSH_I	ldsh	[%r20 + 0x01a8], %r31
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_152:
	mov	0x5, %r14
	.word 0xf0db8400  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_153:
	mov	0x3, %r14
	.word 0xf6db84a0  ! 3670: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_280:
	setx	0x3c0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0348000  ! 3677: ORN_R	orn 	%r18, %r0, %r24
	.word 0xfa04c000  ! 3680: LDUW_R	lduw	[%r19 + %r0], %r29
	ta	T_CHANGE_HPRIV
cpu_intr_2_281:
	setx	0x3d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f1a  ! 3685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f1a, %hpstate
T2_asi_reg_wr_197:
	mov	0x28, %r14
	.word 0xf6f38e80  ! 3687: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_282:
	setx	0x3e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa550000  ! 3690: LDSH_R	ldsh	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_198:
	mov	0xf, %r14
	.word 0xf6f38e80  ! 3699: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbf7c0400  ! 3700: MOVR_R	movre	%r16, %r0, %r31
	.word 0xb2b4216a  ! 3704: SUBCcc_I	orncc 	%r16, 0x016a, %r25
	.word 0xf895c020  ! 3705: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_199:
	mov	0x1d, %r14
	.word 0xf0f38400  ! 3709: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_283:
	setx	0x3e0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d216a  ! 3713: LDUBA_I	lduba	[%r20, + 0x016a] %asi, %r31
	.word 0xf0d54020  ! 3715: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	.word 0xb294e15b  ! 3717: ORcc_I	orcc 	%r19, 0x015b, %r25
	.word 0xb4344000  ! 3718: SUBC_R	orn 	%r17, %r0, %r26
cpu_intr_2_284:
	setx	0x3d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_200:
	mov	0x18, %r14
	.word 0xfef384a0  ! 3722: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_201:
	mov	0x1, %r14
	.word 0xf2f38e60  ! 3723: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f52  ! 3724: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f52, %hpstate
T2_asi_reg_wr_202:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3728: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_154:
	mov	0x22, %r14
	.word 0xf0db89e0  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_285:
	setx	0x3e0034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_286:
	setx	0x3c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0de1a8  ! 3740: LDUB_I	ldub	[%r23 + 0x01a8], %r30
cpu_intr_2_287:
	setx	0x3c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c58020  ! 3742: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_288:
	setx	0x3e0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_155:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3748: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6844020  ! 3749: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
	.word 0xfad5e0b7  ! 3751: LDSHA_I	ldsha	[%r23, + 0x00b7] %asi, %r29
T2_asi_reg_rd_156:
	mov	0x0, %r14
	.word 0xfedb8400  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xba8c209b  ! 3756: ANDcc_I	andcc 	%r16, 0x009b, %r29
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_157:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_289:
	setx	0x3c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2944020  ! 3765: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	.word 0xf6dd6015  ! 3767: LDXA_I	ldxa	[%r21, + 0x0015] %asi, %r27
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819839da  ! 3769: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19da, %hpstate
	.word 0xf45c605e  ! 3771: LDX_I	ldx	[%r17 + 0x005e], %r26
T2_asi_reg_wr_203:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 3776: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xb4344000  ! 3778: ORN_R	orn 	%r17, %r0, %r26
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_158:
	mov	0x7, %r14
	.word 0xfadb8e80  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_290:
	setx	0x3e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c42067  ! 3787: LDSWA_I	ldswa	[%r16, + 0x0067] %asi, %r26
T2_asi_reg_rd_159:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfe150000  ! 3791: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xfc5d4000  ! 3796: LDX_R	ldx	[%r21 + %r0], %r30
T2_asi_reg_wr_204:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3799: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_291:
	setx	0x3c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_160:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_161:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfcc50020  ! 3806: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, f)
	.word 0xf045c000  ! 3811: LDSW_R	ldsw	[%r23 + %r0], %r24
T2_asi_reg_wr_205:
	mov	0x22, %r14
	.word 0xfcf38400  ! 3818: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_rd_162:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 3821: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_206:
	mov	0x9, %r14
	.word 0xf0f38400  ! 3822: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb6ada0ca  ! 3823: ANDNcc_I	andncc 	%r22, 0x00ca, %r27
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_292:
	setx	0x3f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa540000  ! 3831: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xb9355000  ! 3832: SRLX_R	srlx	%r21, %r0, %r28
	.word 0xf0d420e0  ! 3833: LDSHA_I	ldsha	[%r16, + 0x00e0] %asi, %r24
T2_asi_reg_wr_207:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 3835: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf6cde08d  ! 3837: LDSBA_I	ldsba	[%r23, + 0x008d] %asi, %r27
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_293:
	setx	0x3c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d61da  ! 3841: LDX_I	ldx	[%r21 + 0x01da], %r28
	.word 0xf8040000  ! 3842: LDUW_R	lduw	[%r16 + %r0], %r28
T2_asi_reg_rd_163:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf484e041  ! 3845: LDUWA_I	lduwa	[%r19, + 0x0041] %asi, %r26
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 12)
	.word 0xbd3d3001  ! 3848: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xf4c50020  ! 3850: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
	.word 0xf08cc020  ! 3852: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
	.word 0xf6140000  ! 3853: LDUH_R	lduh	[%r16 + %r0], %r27
cpu_intr_2_294:
	setx	0x3d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 3860: RDPR_PIL	<illegal instruction>
	.word 0xf65c4000  ! 3861: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf45c21b4  ! 3864: LDX_I	ldx	[%r16 + 0x01b4], %r26
	.word 0xfed4e0ea  ! 3865: LDSHA_I	ldsha	[%r19, + 0x00ea] %asi, %r31
	.word 0xb13d8000  ! 3867: SRA_R	sra 	%r22, %r0, %r24
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_295:
	setx	0x3d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8454000  ! 3875: LDSW_R	ldsw	[%r21 + %r0], %r28
cpu_intr_2_296:
	setx	0x3f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc558000  ! 3881: LDSH_R	ldsh	[%r22 + %r0], %r30
cpu_intr_2_297:
	setx	0x3c0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_298:
	setx	0x3c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_208:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 3888: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 16)
	.word 0xfad4c020  ! 3893: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
cpu_intr_2_299:
	setx	0x3e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0850000  ! 3896: ADDcc_R	addcc 	%r20, %r0, %r24
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d52  ! 3897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d52, %hpstate
T2_asi_reg_wr_209:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 3899: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc4c8000  ! 3900: LDSB_R	ldsb	[%r18 + %r0], %r30
T2_asi_reg_wr_210:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 3901: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_300:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_301:
	setx	0x3d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 1)
	.word 0xf6c4e094  ! 3908: LDSWA_I	ldswa	[%r19, + 0x0094] %asi, %r27
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 5)
	.word 0xfa440000  ! 3911: LDSW_R	ldsw	[%r16 + %r0], %r29
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f82  ! 3915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f82, %hpstate
cpu_intr_2_302:
	setx	0x3d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf244e128  ! 3925: LDSW_I	ldsw	[%r19 + 0x0128], %r25
	.word 0xf24d8000  ! 3928: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xb824a104  ! 3930: SUB_I	sub 	%r18, 0x0104, %r28
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf2940020  ! 3935: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
cpu_intr_2_303:
	setx	0x3e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc048000  ! 3937: LDUW_R	lduw	[%r18 + %r0], %r30
cpu_intr_2_304:
	setx	0x3c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_164:
	mov	0x1a, %r14
	.word 0xf0db8e60  ! 3939: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfe8c4020  ! 3940: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2c54020  ! 3945: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
	.word 0xfccc0020  ! 3946: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
cpu_intr_2_305:
	setx	0x3d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf4948020  ! 3952: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 11)
	.word 0xba250000  ! 3955: SUB_R	sub 	%r20, %r0, %r29
	.word 0xfc8de1dd  ! 3957: LDUBA_I	lduba	[%r23, + 0x01dd] %asi, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_306:
	setx	0x3d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d2001  ! 3962: SLL_I	sll 	%r20, 0x0001, %r25
	.word 0xfc0d8000  ! 3963: LDUB_R	ldub	[%r22 + %r0], %r30
cpu_intr_2_307:
	setx	0x3d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa554000  ! 3968: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xf85de15c  ! 3970: LDX_I	ldx	[%r23 + 0x015c], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
cpu_intr_2_308:
	setx	0x3c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84ca05c  ! 3976: LDSB_I	ldsb	[%r18 + 0x005c], %r28
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_165:
	mov	0x2a, %r14
	.word 0xfedb89e0  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf4146111  ! 3982: LDUH_I	lduh	[%r17 + 0x0111], %r26
	.word 0xfa0dc000  ! 3985: LDUB_R	ldub	[%r23 + %r0], %r29
T2_asi_reg_rd_166:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 3989: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_211:
	mov	0x24, %r14
	.word 0xf8f389e0  ! 3997: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_309:
	setx	0x3f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8944020  ! 4002: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	.word 0xbabd6048  ! 4003: XNORcc_I	xnorcc 	%r21, 0x0048, %r29
T2_asi_reg_wr_212:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 4004: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf2450000  ! 4005: LDSW_R	ldsw	[%r20 + %r0], %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_167:
	mov	0x10, %r14
	.word 0xf0db8e40  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe844020  ! 4008: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
	.word 0xfa146080  ! 4012: LDUH_I	lduh	[%r17 + 0x0080], %r29
cpu_intr_2_310:
	setx	0x3e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbe1ca051  ! 4017: XOR_I	xor 	%r18, 0x0051, %r31
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, c)
	.word 0xfc154000  ! 4021: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xa1902002  ! 4022: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xf245c000  ! 4026: LDSW_R	ldsw	[%r23 + %r0], %r25
T2_asi_reg_rd_169:
	mov	0x20, %r14
	.word 0xf6db8e60  ! 4027: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfc4d0000  ! 4031: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xfc154000  ! 4033: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xbeb5e18f  ! 4034: SUBCcc_I	orncc 	%r23, 0x018f, %r31
T2_asi_reg_wr_213:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 4037: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_311:
	setx	0x3c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c56115  ! 4040: ADDCcc_I	addccc 	%r21, 0x0115, %r28
	.word 0xf2c4e1be  ! 4043: LDSWA_I	ldswa	[%r19, + 0x01be] %asi, %r25
	.word 0xb01ca1fb  ! 4045: XOR_I	xor 	%r18, 0x01fb, %r24
cpu_intr_2_312:
	setx	0x3d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_313:
	setx	0x3e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x3e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6852049  ! 4053: ADDcc_I	addcc 	%r20, 0x0049, %r27
cpu_intr_2_315:
	setx	0x3f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_316:
	setx	0x3e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd0020  ! 4060: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
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
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_170:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_317:
	setx	0x3c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 39)
	.word 0xf0c4e1bc  ! 4068: LDSWA_I	ldswa	[%r19, + 0x01bc] %asi, %r24
	.word 0xfe1561bf  ! 4069: LDUH_I	lduh	[%r21 + 0x01bf], %r31
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 39)
	.word 0xf2cd605c  ! 4076: LDSBA_I	ldsba	[%r21, + 0x005c] %asi, %r25
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_214:
	mov	0x37, %r14
	.word 0xfcf384a0  ! 4078: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf285202b  ! 4081: LDUWA_I	lduwa	[%r20, + 0x002b] %asi, %r25
T2_asi_reg_rd_171:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 4082: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_318:
	setx	0x3e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb0940000  ! 4088: ORcc_R	orcc 	%r16, %r0, %r24
	.word 0xb4b50000  ! 4089: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xa1902002  ! 4090: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T2_asi_reg_rd_172:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 4091: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb2b4e1bf  ! 4092: ORNcc_I	orncc 	%r19, 0x01bf, %r25
	.word 0xf2d50020  ! 4093: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
cpu_intr_2_319:
	setx	0x420135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_215:
	mov	0x21, %r14
	.word 0xf0f38e80  ! 4095: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_173:
	mov	0x2a, %r14
	.word 0xfadb8e60  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_320:
	setx	0x41020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf2c44020  ! 4102: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f58  ! 4103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f58, %hpstate
cpu_intr_2_321:
	setx	0x430326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_216:
	mov	0x34, %r14
	.word 0xf0f389e0  ! 4105: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf6cc0020  ! 4106: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
	.word 0xbb3d7001  ! 4107: SRAX_I	srax	%r21, 0x0001, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfe058000  ! 4110: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf0d46133  ! 4111: LDSHA_I	ldsha	[%r17, + 0x0133] %asi, %r24
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_174:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_322:
	setx	0x420305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 8)
	.word 0xf854c000  ! 4122: LDSH_R	ldsh	[%r19 + %r0], %r28
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a90  ! 4123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a90, %hpstate
T2_asi_reg_wr_217:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4126: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_175:
	mov	0x9, %r14
	.word 0xf6db89e0  ! 4128: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_rd_176:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_177:
	mov	0xd, %r14
	.word 0xf0db8e80  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_178:
	mov	0x28, %r14
	.word 0xfadb8e80  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc050000  ! 4137: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfe5d60c6  ! 4138: LDX_I	ldx	[%r21 + 0x00c6], %r31
	.word 0xf48421dd  ! 4139: LDUWA_I	lduwa	[%r16, + 0x01dd] %asi, %r26
cpu_intr_2_323:
	setx	0x42022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_324:
	setx	0x410311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc4e1d6  ! 4147: LDSWA_I	ldswa	[%r19, + 0x01d6] %asi, %r30
T2_asi_reg_wr_218:
	mov	0x11, %r14
	.word 0xf6f389e0  ! 4149: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf00c0000  ! 4150: LDUB_R	ldub	[%r16 + %r0], %r24
cpu_intr_2_325:
	setx	0x42023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 9)
	.word 0xfcd44020  ! 4154: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
	.word 0xfcdd2159  ! 4155: LDXA_I	ldxa	[%r20, + 0x0159] %asi, %r30
	.word 0xf08c8020  ! 4156: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
cpu_intr_2_326:
	setx	0x43031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c21b1  ! 4163: LDUBA_I	lduba	[%r16, + 0x01b1] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6d4e0a0  ! 4169: LDSHA_I	ldsha	[%r19, + 0x00a0] %asi, %r27
	.word 0xf20c61a7  ! 4171: LDUB_I	ldub	[%r17 + 0x01a7], %r25
	.word 0xb82d0000  ! 4172: ANDN_R	andn 	%r20, %r0, %r28
T2_asi_reg_rd_179:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 2c)
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c88  ! 4179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c88, %hpstate
	.word 0xfe4cc000  ! 4181: LDSB_R	ldsb	[%r19 + %r0], %r31
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 18)
	.word 0x8f902000  ! 4183: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf8946013  ! 4184: LDUHA_I	lduha	[%r17, + 0x0013] %asi, %r28
	.word 0xf214a1f3  ! 4186: LDUH_I	lduh	[%r18 + 0x01f3], %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_219:
	mov	0x24, %r14
	.word 0xfaf38400  ! 4189: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfc45e1c8  ! 4191: LDSW_I	ldsw	[%r23 + 0x01c8], %r30
T2_asi_reg_wr_220:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 4195: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf40ce10c  ! 4197: LDUB_I	ldub	[%r19 + 0x010c], %r26
cpu_intr_2_327:
	setx	0x430339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1460ee  ! 4206: LDUH_I	lduh	[%r17 + 0x00ee], %r29
	.word 0xfa840020  ! 4207: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xf8d5e039  ! 4211: LDSHA_I	ldsha	[%r23, + 0x0039] %asi, %r28
	.word 0xf04de076  ! 4212: LDSB_I	ldsb	[%r23 + 0x0076], %r24
	.word 0xfacd21b5  ! 4215: LDSBA_I	ldsba	[%r20, + 0x01b5] %asi, %r29
	.word 0xfed48020  ! 4217: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 0)
	.word 0x85956152  ! 4226: WRPR_TSTATE_I	wrpr	%r21, 0x0152, %tstate
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e98  ! 4229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
cpu_intr_2_328:
	setx	0x410314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 6)
	.word 0xf0cd8020  ! 4234: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, b)
	.word 0xf44520fb  ! 4241: LDSW_I	ldsw	[%r20 + 0x00fb], %r26
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf84dc000  ! 4246: LDSB_R	ldsb	[%r23 + %r0], %r28
	.word 0xf454a0b9  ! 4247: LDSH_I	ldsh	[%r18 + 0x00b9], %r26
T2_asi_reg_wr_221:
	mov	0x22, %r14
	.word 0xf6f389e0  ! 4249: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb6956187  ! 4250: ORcc_I	orcc 	%r21, 0x0187, %r27
	.word 0xf8c561b0  ! 4251: LDSWA_I	ldswa	[%r21, + 0x01b0] %asi, %r28
cpu_intr_2_329:
	setx	0x41023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_330:
	setx	0x430036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62da1b6  ! 4257: ANDN_I	andn 	%r22, 0x01b6, %r27
cpu_intr_2_331:
	setx	0x20236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebda010  ! 4263: XNORcc_I	xnorcc 	%r22, 0x0010, %r31
	.word 0xb4458000  ! 4265: ADDC_R	addc 	%r22, %r0, %r26
T2_asi_reg_wr_222:
	mov	0xa, %r14
	.word 0xf8f389e0  ! 4266: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_332:
	setx	0x42011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805e00e  ! 4274: LDUW_I	lduw	[%r23 + 0x000e], %r28
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, f)
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 28)
	.word 0xfe85c020  ! 4281: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_180:
	mov	0x1d, %r14
	.word 0xf2db8e60  ! 4283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_333:
	setx	0x41020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_181:
	mov	0x3, %r14
	.word 0xf8db8e40  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb4a4a09c  ! 4291: SUBcc_I	subcc 	%r18, 0x009c, %r26
T2_asi_reg_rd_182:
	mov	0x10, %r14
	.word 0xf0db8400  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_334:
	setx	0x400132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_335:
	setx	0x410209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_183:
	mov	0x0, %r14
	.word 0xf4db8400  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_184:
	mov	0x16, %r14
	.word 0xf2db8e80  ! 4300: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf484e082  ! 4302: LDUWA_I	lduwa	[%r19, + 0x0082] %asi, %r26
	.word 0xf085c020  ! 4303: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r24
	.word 0xb4048000  ! 4306: ADD_R	add 	%r18, %r0, %r26
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_336:
	setx	0x40021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc944020  ! 4315: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	.word 0xbebc218b  ! 4318: XNORcc_I	xnorcc 	%r16, 0x018b, %r31
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa94214f  ! 4320: LDUHA_I	lduha	[%r16, + 0x014f] %asi, %r29
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_337:
	setx	0x41033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc4020  ! 4328: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	.word 0xba0d8000  ! 4338: AND_R	and 	%r22, %r0, %r29
cpu_intr_2_338:
	setx	0x40001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c61b6  ! 4341: LDSB_I	ldsb	[%r17 + 0x01b6], %r30
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 16)
	.word 0xf0550000  ! 4347: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf8942067  ! 4349: LDUHA_I	lduha	[%r16, + 0x0067] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_339:
	setx	0x43032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa148000  ! 4360: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf48560d7  ! 4365: LDUWA_I	lduwa	[%r21, + 0x00d7] %asi, %r26
cpu_intr_2_340:
	setx	0x43000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_185:
	mov	0xe, %r14
	.word 0xf2db8e40  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_186:
	mov	0xb, %r14
	.word 0xf2db8e80  ! 4369: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf2548000  ! 4376: LDSH_R	ldsh	[%r18 + %r0], %r25
T2_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 4378: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfa85e173  ! 4380: LDUWA_I	lduwa	[%r23, + 0x0173] %asi, %r29
T2_asi_reg_wr_223:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 4388: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_341:
	setx	0x40031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbf7ca401  ! 4393: MOVR_I	movre	%r18, 0x1, %r31
T2_asi_reg_rd_188:
	mov	0xd, %r14
	.word 0xfedb89e0  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, e)
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 25)
	.word 0xfadca1d6  ! 4397: LDXA_I	ldxa	[%r18, + 0x01d6] %asi, %r29
T2_asi_reg_rd_189:
	mov	0x30, %r14
	.word 0xf2db84a0  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 6)
	.word 0xb97c4400  ! 4405: MOVR_R	movre	%r17, %r0, %r28
T2_asi_reg_rd_190:
	mov	0x14, %r14
	.word 0xfcdb89e0  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_191:
	mov	0x2e, %r14
	.word 0xf8db89e0  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_192:
	mov	0x0, %r14
	.word 0xfadb8400  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_224:
	mov	0x12, %r14
	.word 0xfef38e80  ! 4416: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_225:
	mov	0x12, %r14
	.word 0xfef38e80  ! 4420: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf294a082  ! 4422: LDUHA_I	lduha	[%r18, + 0x0082] %asi, %r25
	.word 0xf48d0020  ! 4423: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_226:
	mov	0x5, %r14
	.word 0xf6f38400  ! 4425: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf604c000  ! 4430: LDUW_R	lduw	[%r19 + %r0], %r27
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982900  ! 4431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
T2_asi_reg_wr_227:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 4432: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_228:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 4433: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb150c000  ! 4434: RDPR_TT	<illegal instruction>
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_342:
	setx	0x400014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_343:
	setx	0x43021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 3)
	.word 0xf4dca1c6  ! 4443: LDXA_I	ldxa	[%r18, + 0x01c6] %asi, %r26
cpu_intr_2_344:
	setx	0x400103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_345:
	setx	0x40030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_229:
	mov	0x23, %r14
	.word 0xfaf38e80  ! 4448: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb21dc000  ! 4449: XOR_R	xor 	%r23, %r0, %r25
T2_asi_reg_rd_193:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf88c4020  ! 4454: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_194:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfc5ce058  ! 4457: LDX_I	ldx	[%r19 + 0x0058], %r30
	.word 0xf28d2169  ! 4458: LDUBA_I	lduba	[%r20, + 0x0169] %asi, %r25
	.word 0xfcc5e0d8  ! 4459: LDSWA_I	ldswa	[%r23, + 0x00d8] %asi, %r30
	.word 0xf20ce106  ! 4462: LDUB_I	ldub	[%r19 + 0x0106], %r25
	.word 0xfa8ca111  ! 4463: LDUBA_I	lduba	[%r18, + 0x0111] %asi, %r29
cpu_intr_2_346:
	setx	0x420301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44461de  ! 4473: LDSW_I	ldsw	[%r17 + 0x01de], %r26
	.word 0xba9d60c0  ! 4474: XORcc_I	xorcc 	%r21, 0x00c0, %r29
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982948  ! 4475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
	.word 0xb4ad21f4  ! 4479: ANDNcc_I	andncc 	%r20, 0x01f4, %r26
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_347:
	setx	0x42012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc546102  ! 4491: LDSH_I	ldsh	[%r17 + 0x0102], %r30
	.word 0xf4d58020  ! 4492: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
	.word 0xb0ace19b  ! 4493: ANDNcc_I	andncc 	%r19, 0x019b, %r24
T2_asi_reg_wr_230:
	mov	0x26, %r14
	.word 0xfcf384a0  ! 4494: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf40c4000  ! 4495: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf8cd6190  ! 4499: LDSBA_I	ldsba	[%r21, + 0x0190] %asi, %r28
cpu_intr_2_348:
	setx	0x420000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5c000  ! 4501: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xb534a001  ! 4502: SRL_I	srl 	%r18, 0x0001, %r26
T2_asi_reg_wr_231:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 4503: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, a)
	.word 0xfe0d0000  ! 4505: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xf0050000  ! 4508: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xf08dc020  ! 4509: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
	.word 0xba2c0000  ! 4510: ANDN_R	andn 	%r16, %r0, %r29
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, e)
	.word 0xfa5420fe  ! 4516: LDSH_I	ldsh	[%r16 + 0x00fe], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4dd2100  ! 4521: LDXA_I	ldxa	[%r20, + 0x0100] %asi, %r26
cpu_intr_2_349:
	setx	0x430338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x420329, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983fca  ! 4526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
	.word 0x899461eb  ! 4528: WRPR_TICK_I	wrpr	%r17, 0x01eb, %tick
cpu_intr_2_351:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_352:
	setx	0x420128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5da172  ! 4534: LDX_I	ldx	[%r22 + 0x0172], %r30
T2_asi_reg_wr_232:
	mov	0xe, %r14
	.word 0xf2f38e80  ! 4535: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf645c000  ! 4536: LDSW_R	ldsw	[%r23 + %r0], %r27
T2_asi_reg_wr_233:
	mov	0x2f, %r14
	.word 0xf2f384a0  ! 4537: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982918  ! 4538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
	.word 0xf815e18f  ! 4542: LDUH_I	lduh	[%r23 + 0x018f], %r28
	.word 0xf894a051  ! 4546: LDUHA_I	lduha	[%r18, + 0x0051] %asi, %r28
T2_asi_reg_wr_234:
	mov	0x16, %r14
	.word 0xf8f384a0  ! 4547: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 39)
	.word 0xf41521ec  ! 4552: LDUH_I	lduh	[%r20 + 0x01ec], %r26
	.word 0xf44da062  ! 4553: LDSB_I	ldsb	[%r22 + 0x0062], %r26
	.word 0xf6154000  ! 4555: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf6150000  ! 4557: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xfe0c217d  ! 4558: LDUB_I	ldub	[%r16 + 0x017d], %r31
cpu_intr_2_353:
	setx	0x47020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_354:
	setx	0x450010, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf895a16d  ! 4565: LDUHA_I	lduha	[%r22, + 0x016d] %asi, %r28
T2_asi_reg_wr_235:
	mov	0x1e, %r14
	.word 0xfaf38400  ! 4566: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf4044000  ! 4567: LDUW_R	lduw	[%r17 + %r0], %r26
cpu_intr_2_355:
	setx	0x460000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dde036  ! 4573: LDXA_I	ldxa	[%r23, + 0x0036] %asi, %r27
	.word 0xfa5c8000  ! 4574: LDX_R	ldx	[%r18 + %r0], %r29
cpu_intr_2_356:
	setx	0x440329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_357:
	setx	0x440127, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983948  ! 4584: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1948, %hpstate
	.word 0xb4b5e092  ! 4586: SUBCcc_I	orncc 	%r23, 0x0092, %r26
	.word 0xba14a10c  ! 4587: OR_I	or 	%r18, 0x010c, %r29
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_195:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe0d0000  ! 4591: LDUB_R	ldub	[%r20 + %r0], %r31
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfadce065  ! 4596: LDXA_I	ldxa	[%r19, + 0x0065] %asi, %r29
	.word 0xf4142020  ! 4597: LDUH_I	lduh	[%r16 + 0x0020], %r26
cpu_intr_2_358:
	setx	0x450108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 23)
	.word 0xf44c60d4  ! 4602: LDSB_I	ldsb	[%r17 + 0x00d4], %r26
	.word 0xfed44020  ! 4603: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2c4e1a3  ! 4608: LDSWA_I	ldswa	[%r19, + 0x01a3] %asi, %r25
	.word 0xf885a08a  ! 4614: LDUWA_I	lduwa	[%r22, + 0x008a] %asi, %r28
T2_asi_reg_wr_236:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 4615: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_359:
	setx	0x440121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_360:
	setx	0x440124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_361:
	setx	0x45011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2952167  ! 4626: ORcc_I	orcc 	%r20, 0x0167, %r25
cpu_intr_2_362:
	setx	0x450331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_237:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4635: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_196:
	mov	0x13, %r14
	.word 0xf6db89e0  ! 4637: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_238:
	mov	0x6, %r14
	.word 0xfaf38e60  ! 4638: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf284c020  ! 4639: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
cpu_intr_2_363:
	setx	0x47021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d2071  ! 4642: LDSB_I	ldsb	[%r20 + 0x0071], %r30
	.word 0xbe3de1a9  ! 4643: XNOR_I	xnor 	%r23, 0x01a9, %r31
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_239:
	mov	0x6, %r14
	.word 0xfef38e40  ! 4652: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf6cc0020  ! 4657: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 31)
	.word 0xf04c8000  ! 4662: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xfac50020  ! 4666: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_198:
	mov	0x33, %r14
	.word 0xfcdb89e0  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf28d8020  ! 4668: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
cpu_intr_2_364:
	setx	0x460010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_199:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf48de0bc  ! 4672: LDUBA_I	lduba	[%r23, + 0x00bc] %asi, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_365:
	setx	0x45021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dda0a6  ! 4683: LDXA_I	ldxa	[%r22, + 0x00a6] %asi, %r24
cpu_intr_2_366:
	setx	0x440025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_367:
	setx	0x45023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_368:
	setx	0x470224, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_240:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 4688: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb0a460f7  ! 4689: SUBcc_I	subcc 	%r17, 0x00f7, %r24
cpu_intr_2_369:
	setx	0x450209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88d8020  ! 4693: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_200:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_HPRIV
	.word 0xba8c6157  ! 4699: ANDcc_I	andcc 	%r17, 0x0157, %r29
	.word 0xbc34612a  ! 4701: ORN_I	orn 	%r17, 0x012a, %r30
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_201:
	mov	0x1d, %r14
	.word 0xfcdb8e60  ! 4714: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_370:
	setx	0x470134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_241:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 4729: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_202:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 4733: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf004e0db  ! 4734: LDUW_I	lduw	[%r19 + 0x00db], %r24
T2_asi_reg_rd_203:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9504000  ! 4741: RDPR_TNPC	<illegal instruction>
	.word 0xfc8d8020  ! 4742: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
cpu_intr_2_371:
	setx	0x460230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5e15f  ! 4745: LDSWA_I	ldswa	[%r23, + 0x015f] %asi, %r27
cpu_intr_2_372:
	setx	0x47000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_242:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 4748: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_373:
	setx	0x450004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c6193  ! 4759: ANDN_I	andn 	%r17, 0x0193, %r28
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_243:
	mov	0x5, %r14
	.word 0xfaf38400  ! 4762: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_244:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 4763: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_374:
	setx	0x460026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf29521b5  ! 4770: LDUHA_I	lduha	[%r20, + 0x01b5] %asi, %r25
T2_asi_reg_wr_245:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 4777: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf05c4000  ! 4779: LDX_R	ldx	[%r17 + %r0], %r24
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_375:
	setx	0x470110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ada023  ! 4788: ANDNcc_I	andncc 	%r22, 0x0023, %r24
T2_asi_reg_rd_206:
	mov	0x15, %r14
	.word 0xfedb8e80  ! 4789: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_376:
	setx	0x46020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c2144  ! 4792: LDUBA_I	lduba	[%r16, + 0x0144] %asi, %r24
cpu_intr_2_377:
	setx	0x470138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94e150  ! 4795: LDUHA_I	lduha	[%r19, + 0x0150] %asi, %r29
	.word 0xf45d61d2  ! 4797: LDX_I	ldx	[%r21 + 0x01d2], %r26
	.word 0xf445a026  ! 4798: LDSW_I	ldsw	[%r22 + 0x0026], %r26
	.word 0xbb3c7001  ! 4802: SRAX_I	srax	%r17, 0x0001, %r29
	.word 0xfccca06f  ! 4805: LDSBA_I	ldsba	[%r18, + 0x006f] %asi, %r30
T2_asi_reg_wr_246:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 4806: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc540000  ! 4807: LDSH_R	ldsh	[%r16 + %r0], %r30
T2_asi_reg_wr_247:
	mov	0x36, %r14
	.word 0xf0f389e0  ! 4809: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8cd0020  ! 4810: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
cpu_intr_2_378:
	setx	0x460237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_379:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_380:
	setx	0x450220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe24a062  ! 4826: SUB_I	sub 	%r18, 0x0062, %r31
	.word 0xf80d8000  ! 4827: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xb8250000  ! 4828: SUB_R	sub 	%r20, %r0, %r28
T2_asi_reg_rd_207:
	mov	0x2b, %r14
	.word 0xf8db8e80  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_381:
	setx	0x440134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_248:
	mov	0x28, %r14
	.word 0xf8f38e80  ! 4833: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_208:
	mov	0x37, %r14
	.word 0xfadb89e0  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb2148000  ! 4839: OR_R	or 	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_209:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_249:
	mov	0xc, %r14
	.word 0xf2f389e0  ! 4843: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_210:
	mov	0x15, %r14
	.word 0xf8db84a0  ! 4844: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf68d210d  ! 4846: LDUBA_I	lduba	[%r20, + 0x010d] %asi, %r27
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_382:
	setx	0x470133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc20e8  ! 4851: LDSBA_I	ldsba	[%r16, + 0x00e8] %asi, %r29
	.word 0xf444a01c  ! 4852: LDSW_I	ldsw	[%r18 + 0x001c], %r26
	.word 0xf655209c  ! 4855: LDSH_I	ldsh	[%r20 + 0x009c], %r27
	.word 0xb68d0000  ! 4856: ANDcc_R	andcc 	%r20, %r0, %r27
cpu_intr_2_383:
	setx	0x45012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa854020  ! 4860: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
T2_asi_reg_rd_211:
	mov	0x1a, %r14
	.word 0xf4db8e60  ! 4861: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf204c000  ! 4863: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf0cc8020  ! 4865: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
cpu_intr_2_384:
	setx	0x450033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_212:
	mov	0x31, %r14
	.word 0xf2db8e80  ! 4867: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfe050000  ! 4868: LDUW_R	lduw	[%r20 + %r0], %r31
cpu_intr_2_385:
	setx	0x44001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf20ca116  ! 4876: LDUB_I	ldub	[%r18 + 0x0116], %r25
T2_asi_reg_wr_250:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 4877: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf494e18a  ! 4878: LDUHA_I	lduha	[%r19, + 0x018a] %asi, %r26
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 37)
	.word 0xb01c4000  ! 4881: XOR_R	xor 	%r17, %r0, %r24
T2_asi_reg_rd_213:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_251:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 4885: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8848020  ! 4887: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
T2_asi_reg_wr_252:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 4889: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf40c4000  ! 4890: LDUB_R	ldub	[%r17 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4548000  ! 4892: LDSH_R	ldsh	[%r18 + %r0], %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_386:
	setx	0x45002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 25)
	.word 0xf0c5a144  ! 4903: LDSWA_I	ldswa	[%r22, + 0x0144] %asi, %r24
T2_asi_reg_rd_214:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_387:
	setx	0x440231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_215:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 4907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7520000  ! 4911: RDPR_PIL	<illegal instruction>
	.word 0xf4cc205c  ! 4918: LDSBA_I	ldsba	[%r16, + 0x005c] %asi, %r26
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 3e)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a0a  ! 4921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0a, %hpstate
	.word 0xfad48020  ! 4922: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
T2_asi_reg_wr_253:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 4923: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_388:
	setx	0x46032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2cc000  ! 4927: SLL_R	sll 	%r19, %r0, %r31
	.word 0xf4c40020  ! 4930: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
cpu_intr_2_389:
	setx	0x460135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_254:
	mov	0x1c, %r14
	.word 0xfaf38e60  ! 4941: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb53df001  ! 4942: SRAX_I	srax	%r23, 0x0001, %r26
T2_asi_reg_rd_216:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 4943: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf01561f0  ! 4944: LDUH_I	lduh	[%r21 + 0x01f0], %r24
cpu_intr_2_390:
	setx	0x440325, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983958  ! 4949: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1958, %hpstate
	.word 0xf0c5a1af  ! 4950: LDSWA_I	ldswa	[%r22, + 0x01af] %asi, %r24
cpu_intr_2_391:
	setx	0x470234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d48020  ! 4953: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xf885c020  ! 4955: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_255:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 4956: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0x819521d4  ! 4957: WRPR_TPC_I	wrpr	%r20, 0x01d4, %tpc
	.word 0xf40d20f1  ! 4961: LDUB_I	ldub	[%r20 + 0x00f1], %r26
	.word 0xbf3da001  ! 4963: SRA_I	sra 	%r22, 0x0001, %r31
	.word 0xb5540000  ! 4965: RDPR_GL	<illegal instruction>
	.word 0xf6540000  ! 4966: LDSH_R	ldsh	[%r16 + %r0], %r27
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_256:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 4969: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_392:
	setx	0x44013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2958000  ! 4975: ORcc_R	orcc 	%r22, %r0, %r25
T2_asi_reg_rd_217:
	mov	0xf, %r14
	.word 0xf6db8e40  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe4d0000  ! 4980: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xba844000  ! 4981: ADDcc_R	addcc 	%r17, %r0, %r29
	.word 0xf8cde0da  ! 4982: LDSBA_I	ldsba	[%r23, + 0x00da] %asi, %r28
cpu_intr_2_393:
	setx	0x45012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf48c4020  ! 4991: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xbe942177  ! 4994: ORcc_I	orcc 	%r16, 0x0177, %r31
	.word 0xf4840020  ! 4996: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
	.word 0xfa446171  ! 4997: LDSW_I	ldsw	[%r17 + 0x0171], %r29
	ta	T_CHANGE_HPRIV
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb7a48940  ! 2: FMULd	fmuld	%f18, %f0, %f58
cpu_intr_1_0:
	setx	0x1b0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_1:
	setx	0x19003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_0:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 10: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 22)
	.word 0xbf3de001  ! 16: SRA_I	sra 	%r23, 0x0001, %r31
T1_asi_reg_rd_0:
	mov	0x7, %r14
	.word 0xf2db8e80  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3a84820  ! 19: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb9abc820  ! 21: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbaa5c000  ! 26: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xb9a48840  ! 29: FADDd	faddd	%f18, %f0, %f28
T1_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 30: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbc35212d  ! 33: SUBC_I	orn 	%r20, 0x012d, %r30
T1_asi_reg_wr_1:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 43: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_2:
	setx	0x1f020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_2:
	mov	0x13, %r14
	.word 0xf8f38e80  ! 46: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9a548c0  ! 47: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xb7a58920  ! 48: FMULs	fmuls	%f22, %f0, %f27
	.word 0xbb358000  ! 49: SRL_R	srl 	%r22, %r0, %r29
	.word 0xb1a58960  ! 50: FMULq	dis not found

cpu_intr_1_3:
	setx	0x1c0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48920  ! 52: FMULs	fmuls	%f18, %f0, %f24
	.word 0xbba84820  ! 53: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_3:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 55: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_4:
	mov	0xf, %r14
	.word 0xf8f384a0  ! 58: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5a80c20  ! 59: FMOVRLZ	dis not found

iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_5:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 62: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7a81420  ! 64: FMOVRNZ	dis not found

	.word 0xbe85c000  ! 69: ADDcc_R	addcc 	%r23, %r0, %r31
cpu_intr_1_4:
	setx	0x1e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a449c0  ! 73: FDIVd	fdivd	%f48, %f0, %f26
cpu_intr_1_5:
	setx	0x1e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 76: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_6:
	setx	0x1e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9356001  ! 83: SRL_I	srl 	%r21, 0x0001, %r28
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_6:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 88: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a408e0  ! 91: FSUBq	dis not found

	.word 0xb1a81420  ! 92: FMOVRNZ	dis not found

T1_asi_reg_wr_7:
	mov	0x23, %r14
	.word 0xf8f38e80  ! 94: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb1a48920  ! 95: FMULs	fmuls	%f18, %f0, %f24
T1_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 98: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7a408a0  ! 100: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbba5c9a0  ! 101: FDIVs	fdivs	%f23, %f0, %f29
T1_asi_reg_wr_9:
	mov	0x16, %r14
	.word 0xf6f38400  ! 102: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7a489a0  ! 104: FDIVs	fdivs	%f18, %f0, %f27
cpu_intr_1_7:
	setx	0x1c000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49d0000  ! 107: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xb9aa4820  ! 110: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb4a4616c  ! 113: SUBcc_I	subcc 	%r17, 0x016c, %r26
	.word 0xb03da1de  ! 115: XNOR_I	xnor 	%r22, 0x01de, %r24
T1_asi_reg_rd_2:
	mov	0x29, %r14
	.word 0xf6db8e60  ! 116: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb3a84820  ! 119: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbba00540  ! 120: FSQRTd	fsqrt	
	.word 0xb3aa8820  ! 125: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, f)
	.word 0xb42d0000  ! 130: ANDN_R	andn 	%r20, %r0, %r26
T1_asi_reg_wr_10:
	mov	0x14, %r14
	.word 0xf6f384a0  ! 131: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_3:
	mov	0x2f, %r14
	.word 0xf8db8e40  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 3b)
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_4:
	mov	0x37, %r14
	.word 0xf8db84a0  ! 139: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_8:
	setx	0x1e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a509e0  ! 144: FDIVq	dis not found

T1_asi_reg_rd_5:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_9:
	setx	0x1c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_10:
	setx	0x1c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_11:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 151: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_11:
	setx	0x1e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a44860  ! 156: FADDq	dis not found

	.word 0xbda589c0  ! 157: FDIVd	fdivd	%f22, %f0, %f30
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, c)
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_12:
	setx	0x1f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_12:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 167: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_6:
	mov	0x22, %r14
	.word 0xfadb89e0  ! 172: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_13:
	setx	0x1d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a8c820  ! 182: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_13:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 186: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfaa8820  ! 188: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_15:
	setx	0x1d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 38)
	.word 0xbe04c000  ! 197: ADD_R	add 	%r19, %r0, %r31
cpu_intr_1_16:
	setx	0x1c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_17:
	setx	0x1c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_14:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 207: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_18:
	setx	0x1d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81820  ! 210: FMOVRGZ	fmovs	%fcc3, %f0, %f28
T1_asi_reg_rd_7:
	mov	0x2a, %r14
	.word 0xfcdb8e80  ! 217: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbfa408a0  ! 218: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xb5a54860  ! 220: FADDq	dis not found

cpu_intr_1_19:
	setx	0x1f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_15:
	mov	0x3, %r14
	.word 0xf8f384a0  ! 222: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfab0820  ! 224: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 225: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a80420  ! 233: FMOVRZ	dis not found

	.word 0xb9a00520  ! 234: FSQRTs	fsqrt	
cpu_intr_1_20:
	setx	0x1e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_8:
	mov	0x16, %r14
	.word 0xfedb89e0  ! 237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbba44960  ! 240: FMULq	dis not found

	.word 0xb9abc820  ! 242: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbba50940  ! 243: FMULd	fmuld	%f20, %f0, %f60
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a448c0  ! 245: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xbfa48820  ! 246: FADDs	fadds	%f18, %f0, %f31
	.word 0xb9a80820  ! 249: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb7a94820  ! 251: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0x9195a0b8  ! 253: WRPR_PIL_I	wrpr	%r22, 0x00b8, %pil
T1_asi_reg_rd_9:
	mov	0x20, %r14
	.word 0xfcdb8400  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_17:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 256: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_10:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 258: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba50840  ! 262: FADDd	faddd	%f20, %f0, %f60
	.word 0xbfa588a0  ! 263: FSUBs	fsubs	%f22, %f0, %f31
T1_asi_reg_wr_18:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 264: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbba80c20  ! 265: FMOVRLZ	dis not found

iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_19:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 270: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_21:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a508e0  ! 272: FSUBq	dis not found

iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_11:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba00520  ! 278: FSQRTs	fsqrt	
T1_asi_reg_wr_20:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 281: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbb641800  ! 284: MOVcc_R	<illegal instruction>
cpu_intr_1_22:
	setx	0x1f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_12:
	mov	0x1, %r14
	.word 0xf4db8e40  ! 286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_13:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 289: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb224e157  ! 291: SUB_I	sub 	%r19, 0x0157, %r25
cpu_intr_1_23:
	setx	0x1c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8e0  ! 296: FSUBq	dis not found

	.word 0xb5a80820  ! 297: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_24:
	setx	0x1e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334d000  ! 302: SRLX_R	srlx	%r19, %r0, %r25
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_14:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 304: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 305: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbbaa0820  ! 308: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb5a81420  ! 311: FMOVRNZ	dis not found

iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 10)
	.word 0xbfa9c820  ! 316: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a90820  ! 317: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab0820  ! 322: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa4820  ! 323: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_25:
	setx	0x1c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_26:
	setx	0x1e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 328: FMOVRZ	dis not found

	.word 0xbda00540  ! 329: FSQRTd	fsqrt	
	.word 0xb1a8c820  ! 330: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_27:
	setx	0x1e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a5c8e0  ! 335: FSUBq	dis not found

cpu_intr_1_28:
	setx	0x1c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 339: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_29:
	setx	0x1f0215, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_22:
	mov	0x2a, %r14
	.word 0xf6f384a0  ! 343: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_30:
	setx	0x1e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c8e0  ! 345: FSUBq	dis not found

	.word 0xb2056129  ! 346: ADD_I	add 	%r21, 0x0129, %r25
	.word 0xbfa00020  ! 348: FMOVs	fmovs	%f0, %f31
cpu_intr_1_31:
	setx	0x1c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a549e0  ! 356: FDIVq	dis not found

	.word 0xbfaa0820  ! 357: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb8852008  ! 361: ADDcc_I	addcc 	%r20, 0x0008, %r28
cpu_intr_1_32:
	setx	0x1d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 365: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbfa00040  ! 366: FMOVd	fmovd	%f0, %f62
	.word 0xb7a489c0  ! 368: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbdaa8820  ! 369: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_33:
	setx	0x1f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48860  ! 375: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb61dc000  ! 377: XOR_R	xor 	%r23, %r0, %r27
	.word 0xb5a00040  ! 378: FMOVd	fmovd	%f0, %f26
cpu_intr_1_34:
	setx	0x1c001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_35:
	setx	0x1d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 386: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_36:
	setx	0x1c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_23:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 390: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_37:
	setx	0x1e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 393: FMOVA	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_24:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 396: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_38:
	setx	0x1e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb1abc820  ! 408: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_39:
	setx	0x1f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, e)
	.word 0xbda4c8a0  ! 416: FSUBs	fsubs	%f19, %f0, %f30
T1_asi_reg_rd_15:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, c)
	.word 0xb82dc000  ! 421: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xb7a80420  ! 422: FMOVRZ	dis not found

	.word 0xbba00560  ! 423: FSQRTq	fsqrt	
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
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a84820  ! 428: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbc34a036  ! 431: ORN_I	orn 	%r18, 0x0036, %r30
	.word 0xb9a81c20  ! 432: FMOVRGEZ	dis not found

T1_asi_reg_rd_16:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 433: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_wr_25:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 436: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbda80820  ! 438: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbda48920  ! 439: FMULs	fmuls	%f18, %f0, %f30
T1_asi_reg_rd_17:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 440: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb4bd8000  ! 441: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xb1a508a0  ! 442: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xbba54940  ! 444: FMULd	fmuld	%f52, %f0, %f60
T1_asi_reg_rd_18:
	mov	0x15, %r14
	.word 0xfedb8e80  ! 446: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_19:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
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
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6acc000  ! 456: ANDNcc_R	andncc 	%r19, %r0, %r27
	.word 0xbbabc820  ! 459: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a508e0  ! 460: FSUBq	dis not found

	.word 0xba9d8000  ! 461: XORcc_R	xorcc 	%r22, %r0, %r29
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_26:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 464: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_27:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 466: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4b48000  ! 469: ORNcc_R	orncc 	%r18, %r0, %r26
	.word 0xbbab4820  ! 471: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_20:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 476: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7a80820  ! 477: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
cpu_intr_1_40:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_28:
	mov	0x1c, %r14
	.word 0xfef38e60  ! 482: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb4b56140  ! 483: SUBCcc_I	orncc 	%r21, 0x0140, %r26
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_41:
	setx	0x20001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 487: FSQRTd	fsqrt	
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_42:
	setx	0x22013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x230139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb235a0ff  ! 502: ORN_I	orn 	%r22, 0x00ff, %r25
cpu_intr_1_44:
	setx	0x220326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73d6001  ! 504: SRA_I	sra 	%r21, 0x0001, %r27
T1_asi_reg_rd_21:
	mov	0xf, %r14
	.word 0xf4db8e80  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_22:
	mov	0x3c4, %r14
	.word 0xf2db89e0  ! 508: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_45:
	setx	0x23033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_29:
	mov	0x1f, %r14
	.word 0xfef38400  ! 513: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_wr_30:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 514: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_31:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 518: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb5a9c820  ! 523: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_46:
	setx	0x20011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a80c20  ! 530: FMOVRLZ	dis not found

	.word 0xb9a40860  ! 531: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba1de09b  ! 541: XOR_I	xor 	%r23, 0x009b, %r29
	.word 0xbfa80c20  ! 543: FMOVRLZ	dis not found

T1_asi_reg_rd_23:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_32:
	mov	0xc, %r14
	.word 0xf4f38e40  ! 546: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9a84820  ! 550: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_47:
	setx	0x230238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa0820  ! 552: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_24:
	mov	0x19, %r14
	.word 0xf6db8e80  ! 556: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_33:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 557: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_34:
	mov	0x1c, %r14
	.word 0xfcf389e0  ! 563: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1ab4820  ! 566: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_48:
	setx	0x20033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 31)
	.word 0xbfa44820  ! 573: FADDs	fadds	%f17, %f0, %f31
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_25:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 577: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a509a0  ! 579: FDIVs	fdivs	%f20, %f0, %f26
T1_asi_reg_rd_26:
	mov	0xc, %r14
	.word 0xf6db8e40  ! 583: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a80820  ! 587: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_49:
	setx	0x220021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58960  ! 591: FMULq	dis not found

	.word 0xbba00020  ! 592: FMOVs	fmovs	%f0, %f29
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_27:
	mov	0x0, %r14
	.word 0xf8db8400  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7a80820  ! 599: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb1a98820  ! 600: FMOVNEG	fmovs	%fcc1, %f0, %f24
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a4c820  ! 603: FADDs	fadds	%f19, %f0, %f24
	.word 0xb7643801  ! 605: MOVcc_I	<illegal instruction>
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_50:
	setx	0x220123, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_28:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 609: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_wr_35:
	mov	0x32, %r14
	.word 0xf2f38e60  ! 610: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb33df001  ! 613: SRAX_I	srax	%r23, 0x0001, %r25
cpu_intr_1_51:
	setx	0x220307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_36:
	mov	0x7, %r14
	.word 0xf6f38400  ! 619: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbfa4c860  ! 620: FADDq	dis not found

T1_asi_reg_rd_29:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a00540  ! 623: FSQRTd	fsqrt	
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbfa98820  ! 626: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 628: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_52:
	setx	0x220229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58920  ! 630: FMULs	fmuls	%f22, %f0, %f25
T1_asi_reg_wr_37:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 631: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_31:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 632: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb2258000  ! 634: SUB_R	sub 	%r22, %r0, %r25
cpu_intr_1_53:
	setx	0x200024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 639: FMOVLE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_54:
	setx	0x220116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 642: FSQRTd	fsqrt	
T1_asi_reg_wr_38:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 643: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3a54960  ! 646: FMULq	dis not found

T1_asi_reg_wr_39:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 652: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_55:
	setx	0x23032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54960  ! 659: FMULq	dis not found

	.word 0xb3a409c0  ! 660: FDIVd	fdivd	%f16, %f0, %f56
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_56:
	setx	0x210009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_32:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_57:
	setx	0x22000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_40:
	mov	0x18, %r14
	.word 0xf4f389e0  ! 677: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_58:
	setx	0x220318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_41:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 681: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3a9c820  ! 682: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbba4c8c0  ! 684: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xbba508e0  ! 686: FSUBq	dis not found

	.word 0xbfa84820  ! 687: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 11)
	.word 0xbfa00540  ! 693: FSQRTd	fsqrt	
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_33:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 696: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbe3c8000  ! 703: XNOR_R	xnor 	%r18, %r0, %r31
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_59:
	setx	0x20021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_34:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 708: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_rd_35:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a00020  ! 712: FMOVs	fmovs	%f0, %f27
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 35)
	.word 0xbfa58860  ! 714: FADDq	dis not found

cpu_intr_1_60:
	setx	0x210303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 716: FSQRTd	fsqrt	
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb63da02b  ! 718: XNOR_I	xnor 	%r22, 0x002b, %r27
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_36:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 723: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbba40960  ! 725: FMULq	dis not found

cpu_intr_1_61:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_62:
	setx	0x210317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 733: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a488e0  ! 736: FSUBq	dis not found

cpu_intr_1_63:
	setx	0x200331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 741: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa8820  ! 742: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_64:
	setx	0x200022, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_37:
	mov	0x37, %r14
	.word 0xfcdb84a0  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_65:
	setx	0x21020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00521e0  ! 746: ADD_I	add 	%r20, 0x01e0, %r24
T1_asi_reg_wr_42:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 750: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a00540  ! 751: FSQRTd	fsqrt	
	.word 0xbba84820  ! 752: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbda58920  ! 754: FMULs	fmuls	%f22, %f0, %f30
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_66:
	setx	0x22011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 19)
	.word 0xb6b54000  ! 763: SUBCcc_R	orncc 	%r21, %r0, %r27
T1_asi_reg_wr_43:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 766: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda5c9e0  ! 771: FDIVq	dis not found

	.word 0xb6b58000  ! 772: ORNcc_R	orncc 	%r22, %r0, %r27
	.word 0xb08cc000  ! 773: ANDcc_R	andcc 	%r19, %r0, %r24
cpu_intr_1_67:
	setx	0x210012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c860  ! 775: FADDq	dis not found

	.word 0xbfa00560  ! 776: FSQRTq	fsqrt	
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_44:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 779: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbd7c6401  ! 781: MOVR_I	movre	%r17, 0x1, %r30
	.word 0xb7a81c20  ! 782: FMOVRGEZ	dis not found

	.word 0xbba90820  ! 783: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a54940  ! 784: FMULd	fmuld	%f52, %f0, %f26
	.word 0xbfa50860  ! 785: FADDq	dis not found

	.word 0xb7a84820  ! 788: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_38:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 789: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5353001  ! 792: SRLX_I	srlx	%r20, 0x0001, %r26
cpu_intr_1_68:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_45:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 801: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, e)
	.word 0xb3518000  ! 805: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_69:
	setx	0x230304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_40:
	mov	0x3, %r14
	.word 0xfadb8e60  ! 810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb00560aa  ! 812: ADD_I	add 	%r21, 0x00aa, %r24
	.word 0xb3a80420  ! 815: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfa81c20  ! 819: FMOVRGEZ	dis not found

	.word 0xb9a44920  ! 820: FMULs	fmuls	%f17, %f0, %f28
	.word 0xbfa5c940  ! 821: FMULd	fmuld	%f54, %f0, %f62
T1_asi_reg_rd_41:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_70:
	setx	0x20030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_46:
	mov	0x1c, %r14
	.word 0xfef38e80  ! 825: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb7a81420  ! 829: FMOVRNZ	dis not found

	.word 0xb8a5607c  ! 830: SUBcc_I	subcc 	%r21, 0x007c, %r28
T1_asi_reg_rd_42:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_43:
	mov	0x27, %r14
	.word 0xfadb89e0  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3a4c8c0  ! 834: FSUBd	fsubd	%f50, %f0, %f56
cpu_intr_1_71:
	setx	0x210137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9c0  ! 843: FDIVd	fdivd	%f50, %f0, %f58
T1_asi_reg_wr_47:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 845: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_48:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 847: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_rd_44:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a80820  ! 851: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
cpu_intr_1_72:
	setx	0x230311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 853: FMOVPOS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_73:
	setx	0x21002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50820  ! 861: FADDs	fadds	%f20, %f0, %f27
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbba4c840  ! 864: FADDd	faddd	%f50, %f0, %f60
cpu_intr_1_74:
	setx	0x20031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a81c20  ! 868: FMOVRGEZ	dis not found

cpu_intr_1_75:
	setx	0x200211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a00560  ! 884: FSQRTq	fsqrt	
	.word 0xbba48860  ! 885: FADDq	dis not found

	.word 0xb3ab4820  ! 888: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb3a81c20  ! 890: FMOVRGEZ	dis not found

iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1aac820  ! 896: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_76:
	setx	0x250219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_77:
	setx	0x27001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73cd000  ! 903: SRAX_R	srax	%r19, %r0, %r27
T1_asi_reg_wr_49:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 906: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5a80820  ! 911: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7ab0820  ! 915: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb295210a  ! 922: ORcc_I	orcc 	%r20, 0x010a, %r25
cpu_intr_1_78:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a549c0  ! 926: FDIVd	fdivd	%f52, %f0, %f28
T1_asi_reg_wr_50:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 932: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_51:
	mov	0xe, %r14
	.word 0xfcf389e0  ! 933: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a5c8a0  ! 934: FSUBs	fsubs	%f23, %f0, %f28
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_79:
	setx	0x240202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 939: FMOVRGEZ	dis not found

iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_80:
	setx	0x240036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 29)
	.word 0xb7a94820  ! 944: FMOVCS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_45:
	mov	0x16, %r14
	.word 0xf2db8e60  ! 947: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3a589c0  ! 948: FDIVd	fdivd	%f22, %f0, %f56
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe05e11c  ! 956: ADD_I	add 	%r23, 0x011c, %r31
T1_asi_reg_rd_46:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfab8820  ! 960: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c9e0  ! 961: FDIVq	dis not found

T1_asi_reg_wr_52:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 965: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 1)
	.word 0xbda588c0  ! 968: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb7a00040  ! 969: FMOVd	fmovd	%f0, %f58
	.word 0xbf540000  ! 971: RDPR_GL	<illegal instruction>
cpu_intr_1_81:
	setx	0x26013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_82:
	setx	0x24031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_47:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1a54840  ! 983: FADDd	faddd	%f52, %f0, %f24
	.word 0xb3a8c820  ! 985: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_48:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 987: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_83:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x35, %r14
	.word 0xf8f38e60  ! 992: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfabc820  ! 993: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a489c0  ! 994: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb5a94820  ! 995: FMOVCS	fmovs	%fcc1, %f0, %f26
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba44940  ! 999: FMULd	fmuld	%f48, %f0, %f60
T1_asi_reg_rd_49:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_rd_50:
	mov	0x1d, %r14
	.word 0xf8db8400  ! 1003: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7a40940  ! 1005: FMULd	fmuld	%f16, %f0, %f58
	.word 0xb9641800  ! 1007: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_54:
	mov	0xa, %r14
	.word 0xf6f38e80  ! 1008: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_51:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 1018: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_84:
	setx	0x240216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 1021: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb3a9c820  ! 1023: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_52:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb535e001  ! 1026: SRL_I	srl 	%r23, 0x0001, %r26
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb035e0c5  ! 1030: SUBC_I	orn 	%r23, 0x00c5, %r24
	.word 0xb1ab0820  ! 1036: FMOVGU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_85:
	setx	0x26003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa00040  ! 1041: FMOVd	fmovd	%f0, %f62
	.word 0xb3a58940  ! 1044: FMULd	fmuld	%f22, %f0, %f56
T1_asi_reg_wr_55:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 1045: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbda80420  ! 1046: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_53:
	mov	0x31, %r14
	.word 0xf2db89e0  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbba00520  ! 1050: FSQRTs	fsqrt	
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 9)
	.word 0xb5a508a0  ! 1056: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xbfa81420  ! 1057: FMOVRNZ	dis not found

T1_asi_reg_wr_56:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 1064: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb80d2151  ! 1066: AND_I	and 	%r20, 0x0151, %r28
cpu_intr_1_86:
	setx	0x25010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x27033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48960  ! 1071: FMULq	dis not found

	.word 0xb3a58960  ! 1073: FMULq	dis not found

	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbfab8820  ! 1076: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_57:
	mov	0x29, %r14
	.word 0xf0f38400  ! 1077: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5a448e0  ! 1080: FSUBq	dis not found

T1_asi_reg_wr_58:
	mov	0xf, %r14
	.word 0xf0f384a0  ! 1081: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbaac820  ! 1082: FMOVGE	fmovs	%fcc1, %f0, %f29
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a81820  ! 1086: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5ab8820  ! 1092: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbd35a001  ! 1095: SRL_I	srl 	%r22, 0x0001, %r30
cpu_intr_1_88:
	setx	0x270206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_89:
	setx	0x24033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 22)
	.word 0xb1aa0820  ! 1106: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb1ab0820  ! 1108: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb0c5a0df  ! 1109: ADDCcc_I	addccc 	%r22, 0x00df, %r24
T1_asi_reg_wr_59:
	mov	0x34, %r14
	.word 0xf6f389e0  ! 1110: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbda449a0  ! 1112: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xbe440000  ! 1113: ADDC_R	addc 	%r16, %r0, %r31
T1_asi_reg_rd_54:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 1114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa50940  ! 1116: FMULd	fmuld	%f20, %f0, %f62
cpu_intr_1_90:
	setx	0x250309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 1118: FMOVRGEZ	dis not found

	.word 0xb1a548c0  ! 1120: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb37c4400  ! 1125: MOVR_R	movre	%r17, %r0, %r25
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_91:
	setx	0x270001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488c0  ! 1143: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xbfa98820  ! 1146: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_92:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 1155: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_93:
	setx	0x260013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_60:
	mov	0x3, %r14
	.word 0xfaf384a0  ! 1165: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_94:
	setx	0x250002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 1168: FSQRTd	fsqrt	
T1_asi_reg_wr_61:
	mov	0x24, %r14
	.word 0xfaf38e60  ! 1169: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7a00520  ! 1173: FSQRTs	fsqrt	
	.word 0xb9a48940  ! 1174: FMULd	fmuld	%f18, %f0, %f28
	.word 0xbda5c8c0  ! 1177: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb3a44840  ! 1179: FADDd	faddd	%f48, %f0, %f56
cpu_intr_1_95:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 30)
	.word 0xba456140  ! 1183: ADDC_I	addc 	%r21, 0x0140, %r29
	.word 0xbda4c940  ! 1184: FMULd	fmuld	%f50, %f0, %f30
	.word 0xb4bd8000  ! 1186: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xb1aa4820  ! 1188: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa8820  ! 1192: FMOVG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_96:
	setx	0x25000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54920  ! 1196: FMULs	fmuls	%f21, %f0, %f31
	.word 0xbfa00040  ! 1197: FMOVd	fmovd	%f0, %f62
	.word 0xb624e0b9  ! 1199: SUB_I	sub 	%r19, 0x00b9, %r27
cpu_intr_1_97:
	setx	0x250200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40960  ! 1204: FMULq	dis not found

	.word 0xb1a489a0  ! 1206: FDIVs	fdivs	%f18, %f0, %f24
	.word 0xb7510000  ! 1207: RDPR_TICK	<illegal instruction>
cpu_intr_1_98:
	setx	0x27010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe344000  ! 1210: SUBC_R	orn 	%r17, %r0, %r31
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 19)
	.word 0xbda80820  ! 1215: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
cpu_intr_1_99:
	setx	0x250318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 1218: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_100:
	setx	0x27023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 15)
	.word 0xbfa9c820  ! 1223: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_55:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 1224: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb09421d1  ! 1228: ORcc_I	orcc 	%r16, 0x01d1, %r24
T1_asi_reg_rd_56:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 1229: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5a80820  ! 1231: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a9c820  ! 1233: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_62:
	mov	0x2c, %r14
	.word 0xfef38400  ! 1234: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb93ce001  ! 1239: SRA_I	sra 	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda50860  ! 1242: FADDq	dis not found

	.word 0xb5a81420  ! 1244: FMOVRNZ	dis not found

iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba548a0  ! 1247: FSUBs	fsubs	%f21, %f0, %f29
cpu_intr_1_101:
	setx	0x24003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_102:
	setx	0x27032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_103:
	setx	0x24013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a48840  ! 1258: FADDd	faddd	%f18, %f0, %f56
	.word 0xb3a5c820  ! 1260: FADDs	fadds	%f23, %f0, %f25
	.word 0xbb2c6001  ! 1261: SLL_I	sll 	%r17, 0x0001, %r29
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a589c0  ! 1264: FDIVd	fdivd	%f22, %f0, %f58
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda80c20  ! 1269: FMOVRLZ	dis not found

cpu_intr_1_104:
	setx	0x24033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_105:
	setx	0x240202, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_57:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 1284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_58:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 1285: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 9)
	.word 0xb5a00520  ! 1287: FSQRTs	fsqrt	
	.word 0xb5a81420  ! 1292: FMOVRNZ	dis not found

cpu_intr_1_106:
	setx	0x250130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42de068  ! 1295: ANDN_I	andn 	%r23, 0x0068, %r26
cpu_intr_1_107:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_59:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 1299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9aa8820  ! 1302: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbda588c0  ! 1304: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xbba4c9e0  ! 1305: FDIVq	dis not found

cpu_intr_1_108:
	setx	0x270138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 1309: FSQRTq	fsqrt	
cpu_intr_1_109:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2cd000  ! 1313: SLLX_R	sllx	%r19, %r0, %r31
T1_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 1315: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3ab8820  ! 1319: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_110:
	setx	0x250117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 1323: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbba88820  ! 1324: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xba840000  ! 1325: ADDcc_R	addcc 	%r16, %r0, %r29
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_63:
	mov	0x1a, %r14
	.word 0xf4f38e80  ! 1329: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb6352065  ! 1331: SUBC_I	orn 	%r20, 0x0065, %r27
	.word 0xb1a509a0  ! 1333: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xbba80420  ! 1334: FMOVRZ	dis not found

	.word 0xb9a589e0  ! 1337: FDIVq	dis not found

cpu_intr_1_111:
	setx	0x270106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 1341: FMOVd	fmovd	%f0, %f24
T1_asi_reg_rd_61:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_64:
	mov	0x30, %r14
	.word 0xf4f38e40  ! 1344: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_112:
	setx	0x250123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548a0  ! 1347: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xbbabc820  ! 1349: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a4c860  ! 1351: FADDq	dis not found

T1_asi_reg_wr_65:
	mov	0x1b, %r14
	.word 0xfef384a0  ! 1356: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9a4c9e0  ! 1361: FDIVq	dis not found

	.word 0xb5a81820  ! 1362: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb7a81c20  ! 1366: FMOVRGEZ	dis not found

	.word 0xb1a588e0  ! 1367: FSUBq	dis not found

	.word 0xb9a00560  ! 1375: FSQRTq	fsqrt	
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb1a589c0  ! 1378: FDIVd	fdivd	%f22, %f0, %f24
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a409c0  ! 1382: FDIVd	fdivd	%f16, %f0, %f24
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_66:
	mov	0x1c, %r14
	.word 0xf0f38e80  ! 1384: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_62:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9a80420  ! 1386: FMOVRZ	dis not found

	.word 0xb1a509e0  ! 1388: FDIVq	dis not found

cpu_intr_1_113:
	setx	0x2a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_63:
	mov	0xf, %r14
	.word 0xfcdb89e0  ! 1394: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_114:
	setx	0x2a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40820  ! 1400: FADDs	fadds	%f16, %f0, %f25
	.word 0x8994210d  ! 1404: WRPR_TICK_I	wrpr	%r16, 0x010d, %tick
	.word 0xb6ad4000  ! 1408: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xb12da001  ! 1409: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xbda5c8a0  ! 1411: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xb9a81420  ! 1413: FMOVRNZ	dis not found

iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, d)
	.word 0xb9a58960  ! 1418: FMULq	dis not found

cpu_intr_1_115:
	setx	0x280302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5a549a0  ! 1423: FDIVs	fdivs	%f21, %f0, %f26
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_67:
	mov	0x1d, %r14
	.word 0xf2f38e60  ! 1425: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_64:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a4c860  ! 1430: FADDq	dis not found

	.word 0xb5a449a0  ! 1435: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xb9a00520  ! 1437: FSQRTs	fsqrt	
cpu_intr_1_116:
	setx	0x2a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3ca001  ! 1440: SRA_I	sra 	%r18, 0x0001, %r31
T1_asi_reg_wr_68:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 1445: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_117:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba448a0  ! 1449: FSUBs	fsubs	%f17, %f0, %f29
T1_asi_reg_rd_65:
	mov	0x38, %r14
	.word 0xfadb8400  ! 1452: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1a00540  ! 1453: FSQRTd	fsqrt	
	.word 0xbda80820  ! 1458: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb7a50860  ! 1460: FADDq	dis not found

cpu_intr_1_118:
	setx	0x2a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 1463: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 0)
	.word 0xb48c8000  ! 1466: ANDcc_R	andcc 	%r18, %r0, %r26
	.word 0xb3a84820  ! 1468: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_119:
	setx	0x290136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_120:
	setx	0x2b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_69:
	mov	0x11, %r14
	.word 0xf8f384a0  ! 1472: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9a408e0  ! 1473: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_70:
	mov	0x31, %r14
	.word 0xf8f384a0  ! 1477: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a449a0  ! 1480: FDIVs	fdivs	%f17, %f0, %f28
cpu_intr_1_121:
	setx	0x290228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a84820  ! 1488: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a81c20  ! 1489: FMOVRGEZ	dis not found

	.word 0xb9a589c0  ! 1491: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xbb2d6001  ! 1493: SLL_I	sll 	%r21, 0x0001, %r29
	.word 0xb7a509e0  ! 1496: FDIVq	dis not found

T1_asi_reg_wr_71:
	mov	0xd, %r14
	.word 0xf6f38400  ! 1497: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_wr_72:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 1499: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_122:
	setx	0x290122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_123:
	setx	0x28032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_73:
	mov	0x1b, %r14
	.word 0xfef38e60  ! 1509: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_124:
	setx	0x280327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_66:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 1517: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_125:
	setx	0x2a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 1522: FSQRTd	fsqrt	
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_74:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 1525: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa81420  ! 1527: FMOVRNZ	dis not found

cpu_intr_1_126:
	setx	0x2a013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_75:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 1531: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a80820  ! 1535: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_76:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 1538: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_77:
	mov	0x33, %r14
	.word 0xf8f384a0  ! 1539: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_rd_67:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 1542: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb92c9000  ! 1547: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xbc348000  ! 1548: ORN_R	orn 	%r18, %r0, %r30
T1_asi_reg_wr_78:
	mov	0x34, %r14
	.word 0xf4f38e80  ! 1551: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb8bca11e  ! 1553: XNORcc_I	xnorcc 	%r18, 0x011e, %r28
cpu_intr_1_127:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_79:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 1555: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb9a488a0  ! 1564: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xbaac6110  ! 1566: ANDNcc_I	andncc 	%r17, 0x0110, %r29
T1_asi_reg_wr_80:
	mov	0x25, %r14
	.word 0xfef389e0  ! 1569: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3a80820  ! 1571: FMOVN	fmovs	%fcc1, %f0, %f25
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb97c4400  ! 1573: MOVR_R	movre	%r17, %r0, %r28
	.word 0xb7ab0820  ! 1574: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, f)
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbba54960  ! 1582: FMULq	dis not found

	.word 0xbba81420  ! 1583: FMOVRNZ	dis not found

	.word 0xbeade1fd  ! 1584: ANDNcc_I	andncc 	%r23, 0x01fd, %r31
	.word 0xb7a449a0  ! 1586: FDIVs	fdivs	%f17, %f0, %f27
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_68:
	mov	0xe, %r14
	.word 0xf2db84a0  ! 1588: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 1594: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbb3c8000  ! 1595: SRA_R	sra 	%r18, %r0, %r29
cpu_intr_1_128:
	setx	0x2a0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 1597: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbba84820  ! 1598: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_129:
	setx	0x2b0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8a0  ! 1602: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb1a5c8e0  ! 1614: FSUBq	dis not found

T1_asi_reg_rd_69:
	mov	0x2c, %r14
	.word 0xf4db8e60  ! 1617: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_130:
	setx	0x2a0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_82:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 1621: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_70:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 1622: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_83:
	mov	0x26, %r14
	.word 0xf6f38e60  ! 1623: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_1_131:
	setx	0x290006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_71:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 1628: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_132:
	setx	0x290201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_84:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 1640: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_1_133:
	setx	0x2a001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_134:
	setx	0x2b0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 1646: FMOVRZ	dis not found

iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb1a5c940  ! 1650: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb9aa0820  ! 1651: FMOVA	fmovs	%fcc1, %f0, %f28
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 31)
	.word 0xb3a00520  ! 1653: FSQRTs	fsqrt	
	.word 0xb3a80420  ! 1659: FMOVRZ	dis not found

cpu_intr_1_135:
	setx	0x2b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58920  ! 1663: FMULs	fmuls	%f22, %f0, %f29
cpu_intr_1_136:
	setx	0x280114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 1665: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c960  ! 1667: FMULq	dis not found

T1_asi_reg_wr_85:
	mov	0x2f, %r14
	.word 0xf0f38e60  ! 1671: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9a00560  ! 1672: FSQRTq	fsqrt	
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 7)
	.word 0xb4154000  ! 1674: OR_R	or 	%r21, %r0, %r26
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_137:
	setx	0x2b0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 1677: FMOVRNZ	dis not found

T1_asi_reg_wr_86:
	mov	0x2d, %r14
	.word 0xf8f389e0  ! 1678: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_rd_72:
	mov	0x1d, %r14
	.word 0xf4db89e0  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_138:
	setx	0x280312, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_87:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 1687: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_139:
	setx	0x2a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 1689: FMOVRZ	dis not found

	.word 0x899421ea  ! 1694: WRPR_TICK_I	wrpr	%r16, 0x01ea, %tick
cpu_intr_1_140:
	setx	0x280134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 1696: FSQRTq	fsqrt	
cpu_intr_1_141:
	setx	0x2b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 1700: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_89:
	mov	0x28, %r14
	.word 0xf2f389e0  ! 1701: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_73:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 1702: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_74:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 1709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_75:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb73dd000  ! 1713: SRAX_R	srax	%r23, %r0, %r27
	.word 0x819520cb  ! 1714: WRPR_TPC_I	wrpr	%r20, 0x00cb, %tpc
	.word 0xbdab0820  ! 1715: FMOVGU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_76:
	mov	0x31, %r14
	.word 0xf2db8e60  ! 1718: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_142:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 1722: FSQRTq	fsqrt	
T1_asi_reg_wr_90:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 1723: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb3a48960  ! 1731: FMULq	dis not found

	.word 0xb3a8c820  ! 1735: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7a9c820  ! 1736: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbc150000  ! 1739: OR_R	or 	%r20, %r0, %r30
cpu_intr_1_143:
	setx	0x28010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_77:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbda98820  ! 1745: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba88820  ! 1746: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_91:
	mov	0xc, %r14
	.word 0xf0f384a0  ! 1748: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfa84820  ! 1749: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb294a092  ! 1752: ORcc_I	orcc 	%r18, 0x0092, %r25
	.word 0xbba00540  ! 1753: FSQRTd	fsqrt	
cpu_intr_1_144:
	setx	0x280117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 1755: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00560  ! 1759: FSQRTq	fsqrt	
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_145:
	setx	0x2b0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a508c0  ! 1765: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb1354000  ! 1767: SRL_R	srl 	%r21, %r0, %r24
T1_asi_reg_rd_78:
	mov	0x1b, %r14
	.word 0xf2db84a0  ! 1768: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 3)
	.word 0xbfa549a0  ! 1771: FDIVs	fdivs	%f21, %f0, %f31
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb1a81820  ! 1779: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 24)
	.word 0xb43d4000  ! 1782: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xb3a409c0  ! 1783: FDIVd	fdivd	%f16, %f0, %f56
T1_asi_reg_rd_79:
	mov	0x29, %r14
	.word 0xf6db8e60  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb6b4a1e3  ! 1787: ORNcc_I	orncc 	%r18, 0x01e3, %r27
	.word 0xb9641800  ! 1789: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_92:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 1790: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_80:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 1791: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb73d6001  ! 1793: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xb9a589a0  ! 1794: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xb13d5000  ! 1796: SRAX_R	srax	%r21, %r0, %r24
	.word 0xbbabc820  ! 1797: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbcb48000  ! 1799: ORNcc_R	orncc 	%r18, %r0, %r30
T1_asi_reg_rd_81:
	mov	0x7, %r14
	.word 0xf2db8e40  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_93:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 1804: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xba04614d  ! 1805: ADD_I	add 	%r17, 0x014d, %r29
cpu_intr_1_146:
	setx	0x2e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508e0  ! 1812: FSUBq	dis not found

	.word 0xbba44820  ! 1813: FADDs	fadds	%f17, %f0, %f29
T1_asi_reg_rd_82:
	mov	0x5, %r14
	.word 0xf6db8e80  ! 1814: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a81820  ! 1816: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_147:
	setx	0x2d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 1818: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbdab0820  ! 1825: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3a509a0  ! 1827: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb7a00560  ! 1828: FSQRTq	fsqrt	
T1_asi_reg_rd_83:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 1833: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9aa0820  ! 1834: FMOVA	fmovs	%fcc1, %f0, %f28
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_148:
	setx	0x2d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_149:
	setx	0x2e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c960  ! 1841: FMULq	dis not found

	.word 0xb7a408c0  ! 1843: FSUBd	fsubd	%f16, %f0, %f58
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_84:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, d)
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb7a00560  ! 1857: FSQRTq	fsqrt	
cpu_intr_1_150:
	setx	0x2c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_85:
	mov	0x35, %r14
	.word 0xf4db89e0  ! 1862: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbba489a0  ! 1863: FDIVs	fdivs	%f18, %f0, %f29
T1_asi_reg_rd_86:
	mov	0x17, %r14
	.word 0xf6db8e60  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_94:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 1868: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbfa40960  ! 1869: FMULq	dis not found

	.word 0xbba00560  ! 1870: FSQRTq	fsqrt	
	.word 0xb7aa4820  ! 1871: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_95:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 1875: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb2bd613d  ! 1876: XNORcc_I	xnorcc 	%r21, 0x013d, %r25
T1_asi_reg_rd_87:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 1881: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1a00540  ! 1882: FSQRTd	fsqrt	
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_88:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 1887: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbdaa8820  ! 1889: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbcc4c000  ! 1893: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xb205e048  ! 1894: ADD_I	add 	%r23, 0x0048, %r25
	.word 0xb5a5c8e0  ! 1896: FSUBq	dis not found

	.word 0xbe2de1f3  ! 1898: ANDN_I	andn 	%r23, 0x01f3, %r31
	.word 0xb7a00560  ! 1900: FSQRTq	fsqrt	
cpu_intr_1_151:
	setx	0x2d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda509c0  ! 1903: FDIVd	fdivd	%f20, %f0, %f30
cpu_intr_1_152:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c940  ! 1907: FMULd	fmuld	%f54, %f0, %f58
cpu_intr_1_153:
	setx	0x2d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_154:
	setx	0x2c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44920  ! 1911: FMULs	fmuls	%f17, %f0, %f28
T1_asi_reg_wr_96:
	mov	0x23, %r14
	.word 0xf4f389e0  ! 1912: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9a50940  ! 1915: FMULd	fmuld	%f20, %f0, %f28
cpu_intr_1_155:
	setx	0x2d022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_89:
	mov	0x2c, %r14
	.word 0xf8db89e0  ! 1921: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda448e0  ! 1925: FSUBq	dis not found

cpu_intr_1_156:
	setx	0x2d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48820  ! 1928: FADDs	fadds	%f18, %f0, %f29
T1_asi_reg_wr_97:
	mov	0x37, %r14
	.word 0xf8f384a0  ! 1929: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_157:
	setx	0x2e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 1934: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_98:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1935: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1ab0820  ! 1936: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_99:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 1937: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb5a5c9c0  ! 1940: FDIVd	fdivd	%f54, %f0, %f26
cpu_intr_1_158:
	setx	0x2c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2258000  ! 1943: SUB_R	sub 	%r22, %r0, %r25
cpu_intr_1_160:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_90:
	mov	0x22, %r14
	.word 0xf2db89e0  ! 1945: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1a81c20  ! 1948: FMOVRGEZ	dis not found

T1_asi_reg_wr_100:
	mov	0x9, %r14
	.word 0xf0f38400  ! 1949: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfa4c960  ! 1950: FMULq	dis not found

cpu_intr_1_161:
	setx	0x2e0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 1953: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb3a81c20  ! 1954: FMOVRGEZ	dis not found

iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 25)
	.word 0xb60ca12f  ! 1962: AND_I	and 	%r18, 0x012f, %r27
T1_asi_reg_wr_101:
	mov	0xc, %r14
	.word 0xf4f389e0  ! 1963: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_162:
	setx	0x2c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_102:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 1969: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_103:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 1971: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_163:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_164:
	setx	0x2c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 1976: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_91:
	mov	0x16, %r14
	.word 0xf6db84a0  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_165:
	setx	0x2f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_166:
	setx	0x2d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_167:
	setx	0x2e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf353001  ! 1991: SRLX_I	srlx	%r20, 0x0001, %r31
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_104:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 1996: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_168:
	setx	0x2c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a44000  ! 2004: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xb7a81420  ! 2005: FMOVRNZ	dis not found

T1_asi_reg_rd_92:
	mov	0x14, %r14
	.word 0xfcdb8e60  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbf34e001  ! 2008: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xbfa81c20  ! 2011: FMOVRGEZ	dis not found

	.word 0xb934c000  ! 2013: SRL_R	srl 	%r19, %r0, %r28
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbba5c9c0  ! 2017: FDIVd	fdivd	%f54, %f0, %f60
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 17)
	.word 0xb1aa4820  ! 2020: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_93:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 2023: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbda5c920  ! 2024: FMULs	fmuls	%f23, %f0, %f30
	.word 0xbe45a188  ! 2026: ADDC_I	addc 	%r22, 0x0188, %r31
	.word 0xbfaa4820  ! 2027: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_169:
	setx	0x2c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb9a00520  ! 2032: FSQRTs	fsqrt	
	.word 0xb7a58940  ! 2034: FMULd	fmuld	%f22, %f0, %f58
T1_asi_reg_rd_94:
	mov	0x31, %r14
	.word 0xf6db8e80  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 30)
	.word 0xbb643801  ! 2039: MOVcc_I	<illegal instruction>
	.word 0xb5a00540  ! 2042: FSQRTd	fsqrt	
	.word 0xb7508000  ! 2044: RDPR_TSTATE	<illegal instruction>
	.word 0xb8c5a1a9  ! 2046: ADDCcc_I	addccc 	%r22, 0x01a9, %r28
	.word 0xb80ce11d  ! 2048: AND_I	and 	%r19, 0x011d, %r28
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3aa8820  ! 2055: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a8c820  ! 2057: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb32d1000  ! 2060: SLLX_R	sllx	%r20, %r0, %r25
T1_asi_reg_rd_95:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_170:
	setx	0x2f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_105:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 2073: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa00560  ! 2077: FSQRTq	fsqrt	
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 12)
	.word 0xbda8c820  ! 2081: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbfa81820  ! 2082: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfaa0820  ! 2083: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbfa98820  ! 2085: FMOVNEG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_171:
	setx	0x2e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_172:
	setx	0x2d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_106:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 2091: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_96:
	mov	0xe, %r14
	.word 0xfadb84a0  ! 2096: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_173:
	setx	0x2c0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_97:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 2098: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3a54940  ! 2101: FMULd	fmuld	%f52, %f0, %f56
	.word 0xba158000  ! 2103: OR_R	or 	%r22, %r0, %r29
cpu_intr_1_174:
	setx	0x2d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0x2e, %r14
	.word 0xf6f38e80  ! 2107: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5a5c9a0  ! 2108: FDIVs	fdivs	%f23, %f0, %f26
T1_asi_reg_wr_108:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 2109: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_109:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 2111: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbf2da001  ! 2112: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xbba488a0  ! 2114: FSUBs	fsubs	%f18, %f0, %f29
T1_asi_reg_rd_98:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda48840  ! 2118: FADDd	faddd	%f18, %f0, %f30
	.word 0xb72ce001  ! 2119: SLL_I	sll 	%r19, 0x0001, %r27
cpu_intr_1_175:
	setx	0x2f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_176:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x2c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba489c0  ! 2134: FDIVd	fdivd	%f18, %f0, %f60
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a80c20  ! 2142: FMOVRLZ	dis not found

cpu_intr_1_178:
	setx	0x2e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_110:
	mov	0x7, %r14
	.word 0xf6f384a0  ! 2148: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3a00520  ! 2150: FSQRTs	fsqrt	
cpu_intr_1_179:
	setx	0x2f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_180:
	setx	0x2e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 2156: RDPR_PIL	<illegal instruction>
T1_asi_reg_wr_111:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 2158: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a94820  ! 2159: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a54860  ! 2162: FADDq	dis not found

cpu_intr_1_181:
	setx	0x2c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 2166: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a5c840  ! 2167: FADDd	faddd	%f54, %f0, %f56
	.word 0xb6944000  ! 2170: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xbdaa0820  ! 2173: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_112:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 2174: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7a588c0  ! 2177: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb1500000  ! 2178: RDPR_TPC	<illegal instruction>
	.word 0xbc3d8000  ! 2180: XNOR_R	xnor 	%r22, %r0, %r30
T1_asi_reg_rd_99:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 2181: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb42c0000  ! 2183: ANDN_R	andn 	%r16, %r0, %r26
	.word 0xb3a48860  ! 2186: FADDq	dis not found

	.word 0xb97ca401  ! 2187: MOVR_I	movre	%r18, 0x1, %r28
	.word 0xb7a508c0  ! 2188: FSUBd	fsubd	%f20, %f0, %f58
T1_asi_reg_wr_113:
	mov	0x5, %r14
	.word 0xfcf38400  ! 2190: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb2948000  ! 2192: ORcc_R	orcc 	%r18, %r0, %r25
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_114:
	mov	0x18, %r14
	.word 0xf8f38e80  ! 2195: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_rd_100:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_115:
	mov	0x1c, %r14
	.word 0xf8f384a0  ! 2204: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_182:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 2208: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_101:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5a94820  ! 2210: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3aa4820  ! 2211: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_116:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 2212: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9aa0820  ! 2222: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba00020  ! 2225: FMOVs	fmovs	%f0, %f29
T1_asi_reg_rd_102:
	mov	0x10, %r14
	.word 0xf4db8e80  ! 2232: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_183:
	setx	0x2d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58860  ! 2237: FADDq	dis not found

iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb9a509e0  ! 2240: FDIVq	dis not found

iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_117:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 2244: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbdaa8820  ! 2245: FMOVG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_184:
	setx	0x2c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58960  ! 2248: FMULq	dis not found

iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba80820  ! 2252: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbfa5c9a0  ! 2254: FDIVs	fdivs	%f23, %f0, %f31
T1_asi_reg_wr_118:
	mov	0x11, %r14
	.word 0xfaf38400  ! 2255: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbba90820  ! 2257: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_185:
	setx	0x2c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50960  ! 2262: FMULq	dis not found

cpu_intr_1_186:
	setx	0x2c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_103:
	mov	0x20, %r14
	.word 0xfadb8e60  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbc148000  ! 2267: OR_R	or 	%r18, %r0, %r30
	.word 0xbda409a0  ! 2268: FDIVs	fdivs	%f16, %f0, %f30
T1_asi_reg_rd_104:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb425c000  ! 2281: SUB_R	sub 	%r23, %r0, %r26
	.word 0xbfa00040  ! 2285: FMOVd	fmovd	%f0, %f62
	.word 0xbba50820  ! 2286: FADDs	fadds	%f20, %f0, %f29
	.word 0xb93c9000  ! 2287: SRAX_R	srax	%r18, %r0, %r28
T1_asi_reg_wr_119:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 2289: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_187:
	setx	0x33001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d6001  ! 2293: SRA_I	sra 	%r21, 0x0001, %r29
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_105:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 2299: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 36)
	.word 0xb7a4c8c0  ! 2305: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xbd50c000  ! 2307: RDPR_TT	<illegal instruction>
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_120:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 2314: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9a589e0  ! 2315: FDIVq	dis not found

	.word 0xbda50960  ! 2316: FMULq	dis not found

iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7a90820  ! 2319: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbbab8820  ! 2320: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a58960  ! 2323: FMULq	dis not found

	.word 0xb7a58920  ! 2324: FMULs	fmuls	%f22, %f0, %f27
T1_asi_reg_rd_106:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 2325: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_188:
	setx	0x320025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2327: RDPR_PIL	<illegal instruction>
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 15)
	.word 0xb73c7001  ! 2329: SRAX_I	srax	%r17, 0x0001, %r27
	.word 0x8594a072  ! 2334: WRPR_TSTATE_I	wrpr	%r18, 0x0072, %tstate
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 25)
	.word 0xbdaa8820  ! 2339: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbb3cd000  ! 2343: SRAX_R	srax	%r19, %r0, %r29
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_189:
	setx	0x310219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 2f)
	.word 0xba444000  ! 2349: ADDC_R	addc 	%r17, %r0, %r29
	.word 0xb9ab8820  ! 2350: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_190:
	setx	0x30023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549c0  ! 2360: FDIVd	fdivd	%f52, %f0, %f26
T1_asi_reg_wr_121:
	mov	0x2b, %r14
	.word 0xf6f389e0  ! 2361: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a408a0  ! 2369: FSUBs	fsubs	%f16, %f0, %f26
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, d)
	.word 0xb6ac8000  ! 2374: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xb5a94820  ! 2377: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_122:
	mov	0x16, %r14
	.word 0xfef38400  ! 2380: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_191:
	setx	0x330338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 2383: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_192:
	setx	0x320007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 2387: FMOVRGEZ	dis not found

	.word 0xb9aac820  ! 2388: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda80c20  ! 2393: FMOVRLZ	dis not found

T1_asi_reg_wr_123:
	mov	0x26, %r14
	.word 0xf6f384a0  ! 2396: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_124:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 2397: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_107:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3a44820  ! 2400: FADDs	fadds	%f17, %f0, %f25
cpu_intr_1_193:
	setx	0x320236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_194:
	setx	0x300222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 2405: FSQRTd	fsqrt	
T1_asi_reg_wr_125:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 2407: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_195:
	setx	0x320022, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_126:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2414: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9a00040  ! 2424: FMOVd	fmovd	%f0, %f28
	.word 0xb5a44840  ! 2429: FADDd	faddd	%f48, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7ab0820  ! 2433: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7a4c8e0  ! 2437: FSUBq	dis not found

iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, f)
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_127:
	mov	0x5, %r14
	.word 0xf6f389e0  ! 2449: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_108:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_196:
	setx	0x30031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 2457: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_128:
	mov	0x19, %r14
	.word 0xfcf389e0  ! 2460: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfa549e0  ! 2462: FDIVq	dis not found

	.word 0xb7a00560  ! 2463: FSQRTq	fsqrt	
	.word 0xb5a84820  ! 2466: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbba00540  ! 2468: FSQRTd	fsqrt	
T1_asi_reg_rd_109:
	mov	0x1a, %r14
	.word 0xf2db84a0  ! 2469: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb13c7001  ! 2472: SRAX_I	srax	%r17, 0x0001, %r24
	.word 0xb9a40920  ! 2475: FMULs	fmuls	%f16, %f0, %f28
	.word 0xb9a40940  ! 2476: FMULd	fmuld	%f16, %f0, %f28
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_129:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 2487: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_130:
	mov	0x23, %r14
	.word 0xf8f38400  ! 2488: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb4b5e044  ! 2489: ORNcc_I	orncc 	%r23, 0x0044, %r26
	.word 0xbf2c4000  ! 2491: SLL_R	sll 	%r17, %r0, %r31
	.word 0xbc3c4000  ! 2493: XNOR_R	xnor 	%r17, %r0, %r30
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a00560  ! 2499: FSQRTq	fsqrt	
cpu_intr_1_197:
	setx	0x31023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 2510: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_198:
	setx	0x330325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2442100  ! 2512: ADDC_I	addc 	%r16, 0x0100, %r25
T1_asi_reg_rd_110:
	mov	0x2e, %r14
	.word 0xf8db8400  ! 2514: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7a00540  ! 2515: FSQRTd	fsqrt	
cpu_intr_1_199:
	setx	0x30021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_111:
	mov	0x10, %r14
	.word 0xf8db8400  ! 2519: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7a488a0  ! 2521: FSUBs	fsubs	%f18, %f0, %f27
cpu_intr_1_200:
	setx	0x330308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0ca1e5  ! 2523: AND_I	and 	%r18, 0x01e5, %r31
T1_asi_reg_wr_131:
	mov	0x32, %r14
	.word 0xfef384a0  ! 2524: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 27)
	.word 0xba1da160  ! 2528: XOR_I	xor 	%r22, 0x0160, %r29
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, b)
	.word 0xb7aa4820  ! 2531: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_112:
	mov	0x31, %r14
	.word 0xfadb8400  ! 2533: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbbab4820  ! 2538: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_132:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 2543: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1a50860  ! 2544: FADDq	dis not found

iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb63d0000  ! 2548: XNOR_R	xnor 	%r20, %r0, %r27
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 21)
	.word 0xb12c0000  ! 2551: SLL_R	sll 	%r16, %r0, %r24
cpu_intr_1_201:
	setx	0x330100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 2560: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_133:
	mov	0x2c, %r14
	.word 0xfef38e40  ! 2561: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_113:
	mov	0x2e, %r14
	.word 0xfedb84a0  ! 2564: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbba81c20  ! 2565: FMOVRGEZ	dis not found

	.word 0xb534e001  ! 2573: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0xb5a80c20  ! 2576: FMOVRLZ	dis not found

iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbe3d8000  ! 2578: XNOR_R	xnor 	%r22, %r0, %r31
	.word 0xb1a40940  ! 2580: FMULd	fmuld	%f16, %f0, %f24
	.word 0xbda5c840  ! 2583: FADDd	faddd	%f54, %f0, %f30
T1_asi_reg_wr_134:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 2584: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 14)
	.word 0xba948000  ! 2589: ORcc_R	orcc 	%r18, %r0, %r29
	.word 0xbcbd0000  ! 2590: XNORcc_R	xnorcc 	%r20, %r0, %r30
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, a)
	.word 0xbfab4820  ! 2602: FMOVCC	fmovs	%fcc1, %f0, %f31
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_202:
	setx	0x32021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_135:
	mov	0x4, %r14
	.word 0xf2f389e0  ! 2605: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_203:
	setx	0x320303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc950000  ! 2607: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xbfa80c20  ! 2608: FMOVRLZ	dis not found

	.word 0xb1a48820  ! 2612: FADDs	fadds	%f18, %f0, %f24
T1_asi_reg_wr_136:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 2613: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_114:
	mov	0x32, %r14
	.word 0xf6db8e80  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb9a4c840  ! 2617: FADDd	faddd	%f50, %f0, %f28
cpu_intr_1_204:
	setx	0x31022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_115:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 2621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb4a48000  ! 2622: SUBcc_R	subcc 	%r18, %r0, %r26
	.word 0xb7a8c820  ! 2623: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00040  ! 2624: FMOVd	fmovd	%f0, %f24
	.word 0x8994e1f0  ! 2625: WRPR_TICK_I	wrpr	%r19, 0x01f0, %tick
T1_asi_reg_wr_137:
	mov	0x37, %r14
	.word 0xfcf38e80  ! 2626: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a00560  ! 2628: FSQRTq	fsqrt	
T1_asi_reg_wr_138:
	mov	0x1e, %r14
	.word 0xf0f38e60  ! 2629: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbd3d2001  ! 2636: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xb6ad21ef  ! 2637: ANDNcc_I	andncc 	%r20, 0x01ef, %r27
	.word 0xb3a4c940  ! 2638: FMULd	fmuld	%f50, %f0, %f56
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1a80c20  ! 2643: FMOVRLZ	dis not found

cpu_intr_1_205:
	setx	0x330009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a90820  ! 2649: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa84820  ! 2650: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a4c820  ! 2655: FADDs	fadds	%f19, %f0, %f27
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_139:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2660: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_116:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 2662: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1a00020  ! 2664: FMOVs	fmovs	%f0, %f24
	.word 0xb3a81820  ! 2665: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_206:
	setx	0x320328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_207:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_140:
	mov	0x2f, %r14
	.word 0xf6f389e0  ! 2670: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_141:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 2672: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_142:
	mov	0x1, %r14
	.word 0xf2f38e40  ! 2673: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbba48840  ! 2677: FADDd	faddd	%f18, %f0, %f60
	.word 0xb8b4210f  ! 2678: SUBCcc_I	orncc 	%r16, 0x010f, %r28
cpu_intr_1_208:
	setx	0x330218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 2683: FMOVLEU	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_143:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 2685: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_117:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 2688: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbdaa0820  ! 2691: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_209:
	setx	0x320136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 2695: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 2699: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfaa8820  ! 2701: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa54840  ! 2703: FADDd	faddd	%f52, %f0, %f62
	.word 0xbfa90820  ! 2705: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_210:
	setx	0x350235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 2715: MOVcc_I	<illegal instruction>
	.word 0xbba80420  ! 2716: FMOVRZ	dis not found

	.word 0xb7a80c20  ! 2718: FMOVRLZ	dis not found

cpu_intr_1_211:
	setx	0x37033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_145:
	mov	0x2f, %r14
	.word 0xfef384a0  ! 2722: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_wr_146:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 2724: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_118:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_212:
	setx	0x370333, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_213:
	setx	0x340018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_214:
	setx	0x350012, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x7, %r14
	.word 0xfedb89e0  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_147:
	mov	0x29, %r14
	.word 0xfaf384a0  ! 2739: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5a509c0  ! 2740: FDIVd	fdivd	%f20, %f0, %f26
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00540  ! 2746: FSQRTd	fsqrt	
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a94820  ! 2751: FMOVCS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_215:
	setx	0x360307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_148:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 2756: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_216:
	setx	0x350222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 2758: FSQRTq	fsqrt	
	.word 0xbba44960  ! 2759: FMULq	dis not found

	.word 0xbba84820  ! 2765: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a40840  ! 2774: FADDd	faddd	%f16, %f0, %f28
T1_asi_reg_rd_120:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 2776: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1aac820  ! 2779: FMOVGE	fmovs	%fcc1, %f0, %f24
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 27)
	.word 0xb2aca0f1  ! 2781: ANDNcc_I	andncc 	%r18, 0x00f1, %r25
T1_asi_reg_rd_121:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 2784: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1a94820  ! 2788: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_149:
	mov	0x0, %r14
	.word 0xf2f38e80  ! 2789: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_217:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_150:
	mov	0xf, %r14
	.word 0xfaf38e60  ! 2791: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_122:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_218:
	setx	0x340200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58840  ! 2798: FADDd	faddd	%f22, %f0, %f60
T1_asi_reg_wr_151:
	mov	0x0, %r14
	.word 0xf2f38e40  ! 2799: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda58940  ! 2802: FMULd	fmuld	%f22, %f0, %f30
cpu_intr_1_219:
	setx	0x36011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58820  ! 2807: FADDs	fadds	%f22, %f0, %f26
T1_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2809: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_220:
	setx	0x36022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_221:
	setx	0x36013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 2815: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3a4c960  ! 2817: FMULq	dis not found

	.word 0xb3a81c20  ! 2820: FMOVRGEZ	dis not found

cpu_intr_1_222:
	setx	0x370239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 2824: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81420  ! 2825: FMOVRNZ	dis not found

	.word 0xb1ab8820  ! 2827: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbda449a0  ! 2829: FDIVs	fdivs	%f17, %f0, %f30
cpu_intr_1_223:
	setx	0x34001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a448a0  ! 2833: FSUBs	fsubs	%f17, %f0, %f27
	.word 0x8195a0cc  ! 2834: WRPR_TPC_I	wrpr	%r22, 0x00cc, %tpc
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_152:
	mov	0x6, %r14
	.word 0xf0f38400  ! 2837: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1a549e0  ! 2838: FDIVq	dis not found

	.word 0xb9a40920  ! 2840: FMULs	fmuls	%f16, %f0, %f28
cpu_intr_1_224:
	setx	0x36010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_225:
	setx	0x370134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 2846: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1ab4820  ! 2849: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xba9de1d1  ! 2850: XORcc_I	xorcc 	%r23, 0x01d1, %r29
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5a44840  ! 2853: FADDd	faddd	%f48, %f0, %f26
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbd2d8000  ! 2856: SLL_R	sll 	%r22, %r0, %r30
	.word 0xb3a80820  ! 2860: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbda00520  ! 2861: FSQRTs	fsqrt	
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_124:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1aa8820  ! 2867: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a448a0  ! 2869: FSUBs	fsubs	%f17, %f0, %f27
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a98820  ! 2875: FMOVNEG	fmovs	%fcc1, %f0, %f25
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7a509c0  ! 2878: FDIVd	fdivd	%f20, %f0, %f58
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba4c8a0  ! 2881: FSUBs	fsubs	%f19, %f0, %f29
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, f)
	.word 0xb1a548c0  ! 2883: FSUBd	fsubd	%f52, %f0, %f24
T1_asi_reg_rd_125:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 2884: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 12)
	.word 0xb8840000  ! 2886: ADDcc_R	addcc 	%r16, %r0, %r28
cpu_intr_1_226:
	setx	0x35022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 2888: FSQRTq	fsqrt	
T1_asi_reg_wr_153:
	mov	0x13, %r14
	.word 0xf4f38400  ! 2889: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_227:
	setx	0x360322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_154:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 2893: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_155:
	mov	0x3, %r14
	.word 0xf0f38400  ! 2895: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7a88820  ! 2898: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a5c8c0  ! 2899: FSUBd	fsubd	%f54, %f0, %f26
cpu_intr_1_228:
	setx	0x340008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0ca1aa  ! 2907: AND_I	and 	%r18, 0x01aa, %r30
cpu_intr_1_229:
	setx	0x360331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 2909: FMOVRLZ	dis not found

	.word 0xb5a588c0  ! 2911: FSUBd	fsubd	%f22, %f0, %f26
T1_asi_reg_rd_126:
	mov	0x28, %r14
	.word 0xfcdb8400  ! 2916: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbe056198  ! 2918: ADD_I	add 	%r21, 0x0198, %r31
cpu_intr_1_230:
	setx	0x350316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_231:
	setx	0x360025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba00040  ! 2928: FMOVd	fmovd	%f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_156:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 2931: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbda81420  ! 2936: FMOVRNZ	dis not found

	.word 0xbba40960  ! 2937: FMULq	dis not found

cpu_intr_1_232:
	setx	0x34002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_233:
	setx	0x350029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_234:
	setx	0x36000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62d606a  ! 2942: ANDN_I	andn 	%r21, 0x006a, %r27
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_235:
	setx	0x34030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_127:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_236:
	setx	0x35012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb12d3001  ! 2953: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xb5abc820  ! 2954: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_237:
	setx	0x340027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c840  ! 2957: FADDd	faddd	%f50, %f0, %f24
	.word 0xb5a488e0  ! 2959: FSUBq	dis not found

cpu_intr_1_238:
	setx	0x350208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 2964: FMOVd	fmovd	%f0, %f26
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb7abc820  ! 2969: FMOVVC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_157:
	mov	0x19, %r14
	.word 0xfef38e60  ! 2975: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb72dc000  ! 2982: SLL_R	sll 	%r23, %r0, %r27
cpu_intr_1_239:
	setx	0x37000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548a0  ! 2984: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xbc3ca12d  ! 2986: XNOR_I	xnor 	%r18, 0x012d, %r30
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 32)
	.word 0xb3a4c960  ! 2992: FMULq	dis not found

	.word 0xb2040000  ! 2996: ADD_R	add 	%r16, %r0, %r25
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 1)
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba548e0  ! 3003: FSUBq	dis not found

iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb72c5000  ! 3009: SLLX_R	sllx	%r17, %r0, %r27
	.word 0xbda489c0  ! 3011: FDIVd	fdivd	%f18, %f0, %f30
T1_asi_reg_rd_128:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 3014: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbb3d9000  ! 3015: SRAX_R	srax	%r22, %r0, %r29
	.word 0xbec58000  ! 3020: ADDCcc_R	addccc 	%r22, %r0, %r31
	.word 0xbda80420  ! 3021: FMOVRZ	dis not found

T1_asi_reg_wr_158:
	mov	0x1b, %r14
	.word 0xf2f38400  ! 3022: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbba84820  ! 3023: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81c20  ! 3024: FMOVRGEZ	dis not found

T1_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbc850000  ! 3026: ADDcc_R	addcc 	%r20, %r0, %r30
T1_asi_reg_wr_159:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 3027: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5a84820  ! 3029: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a40860  ! 3030: FADDq	dis not found

cpu_intr_1_240:
	setx	0x35001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_130:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 3044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a00520  ! 3045: FSQRTs	fsqrt	
cpu_intr_1_241:
	setx	0x340329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_242:
	setx	0x370118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24614e  ! 3052: SUB_I	sub 	%r17, 0x014e, %r29
	.word 0xbba9c820  ! 3054: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_160:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 3058: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_243:
	setx	0x360034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_244:
	setx	0x350300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 3064: FMOVCC	fmovs	%fcc1, %f0, %f24
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a00020  ! 3067: FMOVs	fmovs	%f0, %f27
T1_asi_reg_rd_131:
	mov	0x25, %r14
	.word 0xf8db8400  ! 3069: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7ab8820  ! 3071: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_161:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 3073: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a4c8a0  ! 3075: FSUBs	fsubs	%f19, %f0, %f28
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a449e0  ! 3080: FDIVq	dis not found

cpu_intr_1_245:
	setx	0x370125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 3084: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb53dc000  ! 3085: SRA_R	sra 	%r23, %r0, %r26
	.word 0xb8b58000  ! 3086: ORNcc_R	orncc 	%r22, %r0, %r28
T1_asi_reg_rd_132:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 3090: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a44820  ! 3092: FADDs	fadds	%f17, %f0, %f25
	.word 0xb5aa0820  ! 3094: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_133:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb73dc000  ! 3099: SRA_R	sra 	%r23, %r0, %r27
T1_asi_reg_rd_134:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 3101: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a409e0  ! 3105: FDIVq	dis not found

	.word 0xb1a00560  ! 3107: FSQRTq	fsqrt	
T1_asi_reg_rd_135:
	mov	0x30, %r14
	.word 0xf2db8400  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbb2cd000  ! 3111: SLLX_R	sllx	%r19, %r0, %r29
	.word 0xb9a549a0  ! 3113: FDIVs	fdivs	%f21, %f0, %f28
cpu_intr_1_246:
	setx	0x360037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_247:
	setx	0x34013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_163:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 3117: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a50920  ! 3119: FMULs	fmuls	%f20, %f0, %f27
	.word 0xb5a48940  ! 3120: FMULd	fmuld	%f18, %f0, %f26
T1_asi_reg_wr_164:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 3122: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a4c9c0  ! 3123: FDIVd	fdivd	%f50, %f0, %f58
cpu_intr_1_248:
	setx	0x360108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe85a093  ! 3129: ADDcc_I	addcc 	%r22, 0x0093, %r31
	.word 0xbda588c0  ! 3130: FSUBd	fsubd	%f22, %f0, %f30
cpu_intr_1_249:
	setx	0x34021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 28)
	.word 0xb9a00520  ! 3138: FSQRTs	fsqrt	
	.word 0xbeb5c000  ! 3139: ORNcc_R	orncc 	%r23, %r0, %r31
cpu_intr_1_250:
	setx	0x36030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_251:
	setx	0x370126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 3146: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbba80c20  ! 3147: FMOVRLZ	dis not found

T1_asi_reg_rd_136:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 3148: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a54840  ! 3150: FADDd	faddd	%f52, %f0, %f24
cpu_intr_1_252:
	setx	0x37032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_253:
	setx	0x370136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_137:
	mov	0x2a, %r14
	.word 0xf2db8400  ! 3155: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1a408c0  ! 3158: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb1a80c20  ! 3160: FMOVRLZ	dis not found

	.word 0xb32c0000  ! 3162: SLL_R	sll 	%r16, %r0, %r25
	.word 0xbbaa0820  ! 3163: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_254:
	setx	0x360229, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_138:
	mov	0x21, %r14
	.word 0xfadb89e0  ! 3174: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, c)
	.word 0xb40c6007  ! 3179: AND_I	and 	%r17, 0x0007, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba8c820  ! 3181: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1a44840  ! 3184: FADDd	faddd	%f48, %f0, %f24
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a80820  ! 3186: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_139:
	mov	0x17, %r14
	.word 0xfcdb8e80  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3a88820  ! 3192: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c860  ! 3193: FADDq	dis not found

iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_140:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 3199: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_165:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 3200: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb0340000  ! 3201: SUBC_R	orn 	%r16, %r0, %r24
cpu_intr_1_255:
	setx	0x38033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 3205: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1aa0820  ! 3210: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_166:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 3212: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb7ab0820  ! 3215: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00020  ! 3217: FMOVs	fmovs	%f0, %f28
	.word 0xbda80420  ! 3218: FMOVRZ	dis not found

iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba94820  ! 3223: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbba44860  ! 3224: FADDq	dis not found

iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_167:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 3229: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_168:
	mov	0x27, %r14
	.word 0xfcf384a0  ! 3231: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb3a80c20  ! 3234: FMOVRLZ	dis not found

	.word 0xbc35617b  ! 3235: SUBC_I	orn 	%r21, 0x017b, %r30
cpu_intr_1_256:
	setx	0x103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba04c000  ! 3237: ADD_R	add 	%r19, %r0, %r29
	.word 0xb1a44960  ! 3238: FMULq	dis not found

	.word 0xb3a48860  ! 3239: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_169:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 3245: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a50820  ! 3246: FADDs	fadds	%f20, %f0, %f28
	.word 0xbba80c20  ! 3247: FMOVRLZ	dis not found

	.word 0xb235619a  ! 3250: ORN_I	orn 	%r21, 0x019a, %r25
	.word 0xbfa4c9c0  ! 3251: FDIVd	fdivd	%f50, %f0, %f62
T1_asi_reg_wr_170:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 3252: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa00540  ! 3254: FSQRTd	fsqrt	
	.word 0xb9643801  ! 3255: MOVcc_I	<illegal instruction>
	.word 0xbbaa8820  ! 3256: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbdaa4820  ! 3258: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a488a0  ! 3259: FSUBs	fsubs	%f18, %f0, %f24
T1_asi_reg_wr_171:
	mov	0xd, %r14
	.word 0xf2f38e60  ! 3260: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a80820  ! 3268: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_257:
	setx	0x39012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50860  ! 3282: FADDq	dis not found

	.word 0xb3a58960  ! 3284: FMULq	dis not found

iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a9c820  ! 3286: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_172:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 3287: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa80820  ! 3288: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_258:
	setx	0x380202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a5c8a0  ! 3293: FSUBs	fsubs	%f23, %f0, %f26
cpu_intr_1_259:
	setx	0x3b030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 3298: FMOVRLZ	dis not found

iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa5c9a0  ! 3310: FDIVs	fdivs	%f23, %f0, %f31
T1_asi_reg_rd_141:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 3311: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a81820  ! 3314: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb7a84820  ! 3318: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 38)
	.word 0xb9a4c960  ! 3322: FMULq	dis not found

cpu_intr_1_260:
	setx	0x38031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb340000  ! 3324: SRL_R	srl 	%r16, %r0, %r29
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 25)
	.word 0xbc1520b8  ! 3328: OR_I	or 	%r20, 0x00b8, %r30
	.word 0xb1ab4820  ! 3329: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_173:
	mov	0x10, %r14
	.word 0xfcf389e0  ! 3330: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa4c9a0  ! 3333: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb1a8c820  ! 3336: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_261:
	setx	0x380210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 10)
	.word 0xba940000  ! 3342: ORcc_R	orcc 	%r16, %r0, %r29
	.word 0xbda5c9a0  ! 3343: FDIVs	fdivs	%f23, %f0, %f30
cpu_intr_1_262:
	setx	0x3a031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_142:
	mov	0x24, %r14
	.word 0xf8db89e0  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbba44920  ! 3355: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbb7dc400  ! 3359: MOVR_R	movre	%r23, %r0, %r29
	.word 0xbfa44960  ! 3364: FMULq	dis not found

	.word 0xbfaa8820  ! 3368: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_263:
	setx	0x3b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_264:
	setx	0x3b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda549c0  ! 3372: FDIVd	fdivd	%f52, %f0, %f30
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_174:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 3379: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_175:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 3380: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a00560  ! 3385: FSQRTq	fsqrt	
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_176:
	mov	0x34, %r14
	.word 0xf0f38e60  ! 3388: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_177:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 3389: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 3)
	.word 0xb5a5c940  ! 3393: FMULd	fmuld	%f54, %f0, %f26
	.word 0xbba98820  ! 3399: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbc8ce1cc  ! 3400: ANDcc_I	andcc 	%r19, 0x01cc, %r30
cpu_intr_1_265:
	setx	0x3b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 3410: FMOVVS	fmovs	%fcc1, %f0, %f29
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb1343001  ! 3414: SRLX_I	srlx	%r16, 0x0001, %r24
	.word 0xb950c000  ! 3415: RDPR_TT	<illegal instruction>
	.word 0xb5a5c960  ! 3416: FMULq	dis not found

cpu_intr_1_266:
	setx	0x390308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_143:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 3421: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb3abc820  ! 3423: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbfa5c9e0  ! 3426: FDIVq	dis not found

	.word 0xbda00540  ! 3428: FSQRTd	fsqrt	
	.word 0xbcada017  ! 3430: ANDNcc_I	andncc 	%r22, 0x0017, %r30
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, a)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbba98820  ! 3433: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbbab4820  ! 3436: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_178:
	mov	0x8, %r14
	.word 0xf8f38400  ! 3438: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a5c9a0  ! 3444: FDIVs	fdivs	%f23, %f0, %f24
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbe1da0d2  ! 3451: XOR_I	xor 	%r22, 0x00d2, %r31
	.word 0xbda81c20  ! 3452: FMOVRGEZ	dis not found

iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 3b)
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_179:
	mov	0x26, %r14
	.word 0xfaf38e40  ! 3466: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_267:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_180:
	mov	0x1, %r14
	.word 0xf6f38400  ! 3469: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7a00540  ! 3470: FSQRTd	fsqrt	
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 35)
	.word 0xb1a58840  ! 3472: FADDd	faddd	%f22, %f0, %f24
	.word 0xbc3c0000  ! 3473: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0xb23ce0d9  ! 3474: XNOR_I	xnor 	%r19, 0x00d9, %r25
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb6bc2085  ! 3483: XNORcc_I	xnorcc 	%r16, 0x0085, %r27
cpu_intr_1_268:
	setx	0x380004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_269:
	setx	0x3b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_270:
	setx	0x390327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_181:
	mov	0xc, %r14
	.word 0xfef38e40  ! 3494: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_182:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 3496: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_271:
	setx	0x3b0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23461e4  ! 3503: SUBC_I	orn 	%r17, 0x01e4, %r25
	.word 0xbfa588c0  ! 3504: FSUBd	fsubd	%f22, %f0, %f62
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, c)
	.word 0xb7aa8820  ! 3507: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_272:
	setx	0x39013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda80420  ! 3517: FMOVRZ	dis not found

	.word 0xb1a80820  ! 3518: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_273:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 3522: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb4a40000  ! 3523: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xbda81820  ! 3525: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb9a81c20  ! 3526: FMOVRGEZ	dis not found

iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 29)
	.word 0xb9504000  ! 3528: RDPR_TNPC	<illegal instruction>
	.word 0xbba90820  ! 3529: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbba81c20  ! 3531: FMOVRGEZ	dis not found

	.word 0xb5a00040  ! 3540: FMOVd	fmovd	%f0, %f26
T1_asi_reg_wr_183:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 3541: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_184:
	mov	0x35, %r14
	.word 0xf8f38400  ! 3544: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7aac820  ! 3545: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_185:
	mov	0x2b, %r14
	.word 0xf4f38400  ! 3547: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb9a5c9c0  ! 3552: FDIVd	fdivd	%f54, %f0, %f28
	.word 0xbfa4c9c0  ! 3556: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xb3a81820  ! 3558: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa88820  ! 3562: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a5c8c0  ! 3563: FSUBd	fsubd	%f54, %f0, %f26
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_186:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 3569: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbba88820  ! 3570: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbba58820  ! 3574: FADDs	fadds	%f22, %f0, %f29
	.word 0xb3a5c8a0  ! 3575: FSUBs	fsubs	%f23, %f0, %f25
T1_asi_reg_wr_187:
	mov	0x37, %r14
	.word 0xf4f38e80  ! 3578: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba40860  ! 3579: FADDq	dis not found

cpu_intr_1_274:
	setx	0x3b0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_188:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 3583: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_189:
	mov	0x26, %r14
	.word 0xf4f38e40  ! 3585: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfa509e0  ! 3586: FDIVq	dis not found

	.word 0xbba80820  ! 3589: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
cpu_intr_1_275:
	setx	0x3b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_276:
	setx	0x38011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01da1d0  ! 3595: XOR_I	xor 	%r22, 0x01d0, %r24
cpu_intr_1_277:
	setx	0x39003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2dc000  ! 3597: SLL_R	sll 	%r23, %r0, %r30
T1_asi_reg_rd_145:
	mov	0x10, %r14
	.word 0xfcdb8400  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_190:
	mov	0x18, %r14
	.word 0xf4f389e0  ! 3599: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_146:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 3604: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3a90820  ! 3608: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_278:
	setx	0x3a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_147:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_148:
	mov	0x13, %r14
	.word 0xf6db8e60  ! 3616: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_191:
	mov	0x1, %r14
	.word 0xfef384a0  ! 3618: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_149:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 3619: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_150:
	mov	0x29, %r14
	.word 0xf2db8e40  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbba80820  ! 3625: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_192:
	mov	0x17, %r14
	.word 0xf2f38400  ! 3627: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5a80c20  ! 3633: FMOVRLZ	dis not found

	.word 0xb735c000  ! 3636: SRL_R	srl 	%r23, %r0, %r27
	.word 0xb5a00040  ! 3638: FMOVd	fmovd	%f0, %f26
T1_asi_reg_wr_193:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 3639: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_279:
	setx	0x3d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c920  ! 3641: FMULs	fmuls	%f19, %f0, %f28
T1_asi_reg_wr_194:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 3642: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbba98820  ! 3643: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a58840  ! 3645: FADDd	faddd	%f22, %f0, %f28
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 3)
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_195:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 3651: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1a81420  ! 3654: FMOVRNZ	dis not found

T1_asi_reg_rd_151:
	mov	0xa, %r14
	.word 0xf8db8400  ! 3655: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbda81820  ! 3659: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_wr_196:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 3660: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3a5c940  ! 3662: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb9a58840  ! 3663: FADDd	faddd	%f22, %f0, %f28
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 0)
	.word 0xb1a84820  ! 3667: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_152:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 3669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_153:
	mov	0x8, %r14
	.word 0xf8db8e60  ! 3670: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbba00560  ! 3673: FSQRTq	fsqrt	
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_280:
	setx	0x3f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 3676: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbc354000  ! 3677: ORN_R	orn 	%r21, %r0, %r30
cpu_intr_1_281:
	setx	0x3e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 3684: FMOVRZ	dis not found

T1_asi_reg_wr_197:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 3687: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb9a4c920  ! 3688: FMULs	fmuls	%f19, %f0, %f28
cpu_intr_1_282:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 3691: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a80820  ! 3693: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb5a88820  ! 3694: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c8e0  ! 3695: FSUBq	dis not found

	.word 0xb5a00020  ! 3696: FMOVs	fmovs	%f0, %f26
	.word 0xb9a00560  ! 3697: FSQRTq	fsqrt	
T1_asi_reg_wr_198:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 3699: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbd7c8400  ! 3700: MOVR_R	movre	%r18, %r0, %r30
	.word 0xb9a58820  ! 3703: FADDs	fadds	%f22, %f0, %f28
	.word 0xbab4e05d  ! 3704: SUBCcc_I	orncc 	%r19, 0x005d, %r29
	.word 0xb1a80c20  ! 3706: FMOVRLZ	dis not found

T1_asi_reg_wr_199:
	mov	0x1b, %r14
	.word 0xfef38e60  ! 3709: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_283:
	setx	0x3d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 3714: FMOVRNZ	dis not found

	.word 0xb7a98820  ! 3716: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xba94a1fb  ! 3717: ORcc_I	orcc 	%r18, 0x01fb, %r29
	.word 0xbc354000  ! 3718: SUBC_R	orn 	%r21, %r0, %r30
cpu_intr_1_284:
	setx	0x3d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_200:
	mov	0x1a, %r14
	.word 0xf0f38400  ! 3722: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_wr_201:
	mov	0xf, %r14
	.word 0xf0f38e60  ! 3723: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_202:
	mov	0x2, %r14
	.word 0xf2f384a0  ! 3728: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_rd_154:
	mov	0x13, %r14
	.word 0xfedb8400  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb7a4c960  ! 3731: FMULq	dis not found

cpu_intr_1_285:
	setx	0x3f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_286:
	setx	0x3e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 6)
	.word 0xbda98820  ! 3736: FMOVNEG	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a448e0  ! 3739: FSUBq	dis not found

cpu_intr_1_287:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50940  ! 3743: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb5aa0820  ! 3745: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_288:
	setx	0x3c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_155:
	mov	0x30, %r14
	.word 0xfedb84a0  ! 3748: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbda508c0  ! 3752: FSUBd	fsubd	%f20, %f0, %f30
T1_asi_reg_rd_156:
	mov	0xc, %r14
	.word 0xf6db8e60  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbe8d61c6  ! 3756: ANDcc_I	andcc 	%r21, 0x01c6, %r31
	.word 0xbfab8820  ! 3757: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_157:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 3761: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1aa4820  ! 3763: FMOVNE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_289:
	setx	0x3d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9a0  ! 3768: FDIVs	fdivs	%f23, %f0, %f31
	.word 0xbba00520  ! 3772: FSQRTs	fsqrt	
	.word 0xbfa00520  ! 3773: FSQRTs	fsqrt	
	.word 0xbda5c920  ! 3774: FMULs	fmuls	%f23, %f0, %f30
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_203:
	mov	0x2d, %r14
	.word 0xf6f38400  ! 3776: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb4344000  ! 3778: ORN_R	orn 	%r17, %r0, %r26
	.word 0xb7a548e0  ! 3780: FSUBq	dis not found

iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_158:
	mov	0x22, %r14
	.word 0xf6db84a0  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_290:
	setx	0x3e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 3788: FMOVRZ	dis not found

T1_asi_reg_rd_159:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1a9c820  ! 3793: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbda5c820  ! 3795: FADDs	fadds	%f23, %f0, %f30
	.word 0xbfa9c820  ! 3797: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_204:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 3799: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_291:
	setx	0x3e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_rd_161:
	mov	0x30, %r14
	.word 0xfedb84a0  ! 3802: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 28)
	.word 0xbda408a0  ! 3810: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xb3a4c820  ! 3813: FADDs	fadds	%f19, %f0, %f25
	.word 0xb9a409e0  ! 3817: FDIVq	dis not found

T1_asi_reg_wr_205:
	mov	0x16, %r14
	.word 0xf6f38e60  ! 3818: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_162:
	mov	0x33, %r14
	.word 0xfcdb8400  ! 3821: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_206:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 3822: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbeade060  ! 3823: ANDNcc_I	andncc 	%r23, 0x0060, %r31
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a88820  ! 3825: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbba4c860  ! 3829: FADDq	dis not found

cpu_intr_1_292:
	setx	0x3f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3345000  ! 3832: SRLX_R	srlx	%r17, %r0, %r25
T1_asi_reg_wr_207:
	mov	0x28, %r14
	.word 0xfef38400  ! 3835: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5a449a0  ! 3836: FDIVs	fdivs	%f17, %f0, %f26
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_293:
	setx	0x3c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_163:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 3843: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a00540  ! 3847: FSQRTd	fsqrt	
	.word 0xb13cb001  ! 3848: SRAX_I	srax	%r18, 0x0001, %r24
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_294:
	setx	0x3d0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3857: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb1520000  ! 3860: RDPR_PIL	<illegal instruction>
	.word 0xbda00560  ! 3862: FSQRTq	fsqrt	
	.word 0xbfab8820  ! 3863: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb93d8000  ! 3867: SRA_R	sra 	%r22, %r0, %r28
	.word 0xbba4c960  ! 3868: FMULq	dis not found

iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_295:
	setx	0x3d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c940  ! 3872: FMULd	fmuld	%f50, %f0, %f30
	.word 0xb9aa0820  ! 3873: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb1a40960  ! 3874: FMULq	dis not found

cpu_intr_1_296:
	setx	0x3f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 3878: FSQRTd	fsqrt	
	.word 0xb5aa0820  ! 3882: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00040  ! 3883: FMOVd	fmovd	%f0, %f26
cpu_intr_1_297:
	setx	0x3d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_298:
	setx	0x3c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_208:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3888: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a00560  ! 3892: FSQRTq	fsqrt	
cpu_intr_1_299:
	setx	0x3d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2848000  ! 3896: ADDcc_R	addcc 	%r18, %r0, %r25
	.word 0xb3a509c0  ! 3898: FDIVd	fdivd	%f20, %f0, %f56
T1_asi_reg_wr_209:
	mov	0x35, %r14
	.word 0xfef38e40  ! 3899: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_210:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 3901: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_300:
	setx	0x3c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_301:
	setx	0x3e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c920  ! 3906: FMULs	fmuls	%f19, %f0, %f25
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 30)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbda488c0  ! 3914: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xbba00560  ! 3919: FSQRTq	fsqrt	
cpu_intr_1_302:
	setx	0x3f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb5a98820  ! 3923: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00560  ! 3927: FSQRTq	fsqrt	
	.word 0xbe2560e2  ! 3930: SUB_I	sub 	%r21, 0x00e2, %r31
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_303:
	setx	0x3c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_304:
	setx	0x3e010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_164:
	mov	0xc, %r14
	.word 0xf0db89e0  ! 3939: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a449a0  ! 3947: FDIVs	fdivs	%f17, %f0, %f25
cpu_intr_1_305:
	setx	0x3f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb4250000  ! 3955: SUB_R	sub 	%r20, %r0, %r26
	.word 0xb7aac820  ! 3958: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_306:
	setx	0x3e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52ce001  ! 3962: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xb7a84820  ! 3964: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb5abc820  ! 3965: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_307:
	setx	0x3e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda8c820  ! 3973: FMOVL	fmovs	%fcc1, %f0, %f30
cpu_intr_1_308:
	setx	0x3d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb5a00520  ! 3978: FSQRTs	fsqrt	
T1_asi_reg_rd_165:
	mov	0x32, %r14
	.word 0xf0db8400  ! 3979: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbdaac820  ! 3980: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbba00560  ! 3983: FSQRTq	fsqrt	
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_166:
	mov	0xf, %r14
	.word 0xf2db8e40  ! 3989: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a589e0  ! 3992: FDIVq	dis not found

	.word 0xbfa81420  ! 3993: FMOVRNZ	dis not found

	.word 0xb1a00540  ! 3996: FSQRTd	fsqrt	
T1_asi_reg_wr_211:
	mov	0x16, %r14
	.word 0xf8f38e80  ! 3997: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5a81420  ! 3998: FMOVRNZ	dis not found

	.word 0xb3ab4820  ! 3999: FMOVCC	fmovs	%fcc1, %f0, %f25
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_309:
	setx	0x3d003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc604d  ! 4003: XNORcc_I	xnorcc 	%r17, 0x004d, %r27
T1_asi_reg_wr_212:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 4004: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_167:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 4007: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbda40840  ! 4009: FADDd	faddd	%f16, %f0, %f30
	.word 0xb1a80c20  ! 4010: FMOVRLZ	dis not found

	.word 0xbfab8820  ! 4013: FMOVPOS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_310:
	setx	0x3e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 4016: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb21c21fd  ! 4017: XOR_I	xor 	%r16, 0x01fd, %r25
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 15)
	.word 0xa1902001  ! 4022: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb7a80820  ! 4023: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 4024: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_169:
	mov	0x10, %r14
	.word 0xf4db8400  ! 4027: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7a98820  ! 4028: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80820  ! 4029: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 4)
	.word 0xb2b5a194  ! 4034: SUBCcc_I	orncc 	%r22, 0x0194, %r25
	.word 0xbda94820  ! 4036: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_213:
	mov	0x26, %r14
	.word 0xf6f38e40  ! 4037: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_311:
	setx	0x3e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc5207e  ! 4040: ADDCcc_I	addccc 	%r20, 0x007e, %r30
	.word 0xb5a81420  ! 4041: FMOVRNZ	dis not found

	.word 0xb1a50840  ! 4044: FADDd	faddd	%f20, %f0, %f24
	.word 0xb21de1be  ! 4045: XOR_I	xor 	%r23, 0x01be, %r25
	.word 0xb9a00560  ! 4046: FSQRTq	fsqrt	
	.word 0xb9a408a0  ! 4048: FSUBs	fsubs	%f16, %f0, %f28
cpu_intr_1_312:
	setx	0x3e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_313:
	setx	0x3d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_314:
	setx	0x3d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb284e113  ! 4053: ADDcc_I	addcc 	%r19, 0x0113, %r25
	.word 0xb3a5c8c0  ! 4054: FSUBd	fsubd	%f54, %f0, %f56
cpu_intr_1_315:
	setx	0x3d0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_316:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_170:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbba5c9c0  ! 4065: FDIVd	fdivd	%f54, %f0, %f60
cpu_intr_1_317:
	setx	0x3d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbda549e0  ! 4074: FDIVq	dis not found

iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_214:
	mov	0x38, %r14
	.word 0xf2f384a0  ! 4078: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbbaa8820  ! 4079: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_171:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 4082: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3a408a0  ! 4083: FSUBs	fsubs	%f16, %f0, %f25
cpu_intr_1_318:
	setx	0x3c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48940  ! 4087: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb294c000  ! 4088: ORcc_R	orcc 	%r19, %r0, %r25
	.word 0xbcb4c000  ! 4089: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xa1902002  ! 4090: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T1_asi_reg_rd_172:
	mov	0xa, %r14
	.word 0xfedb84a0  ! 4091: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb2b5200a  ! 4092: ORNcc_I	orncc 	%r20, 0x000a, %r25
cpu_intr_1_319:
	setx	0x41022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_215:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 4095: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_173:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_320:
	setx	0x400339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 4100: FMOVRGEZ	dis not found

iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_321:
	setx	0x40021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_216:
	mov	0x11, %r14
	.word 0xf6f38e60  ! 4105: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb53c3001  ! 4107: SRAX_I	srax	%r16, 0x0001, %r26
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbbabc820  ! 4116: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_174:
	mov	0x1a, %r14
	.word 0xf4db89e0  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_322:
	setx	0x410237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_wr_217:
	mov	0x26, %r14
	.word 0xf6f38e60  ! 4126: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_175:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4128: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9a40840  ! 4130: FADDd	faddd	%f16, %f0, %f28
	.word 0xb7a00540  ! 4131: FSQRTd	fsqrt	
T1_asi_reg_rd_177:
	mov	0x18, %r14
	.word 0xfadb8400  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7a00560  ! 4134: FSQRTq	fsqrt	
T1_asi_reg_rd_178:
	mov	0x1b, %r14
	.word 0xf8db8400  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_323:
	setx	0x400032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c840  ! 4145: FADDd	faddd	%f54, %f0, %f60
cpu_intr_1_324:
	setx	0x400037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a489e0  ! 4148: FDIVq	dis not found

T1_asi_reg_wr_218:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 4149: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_325:
	setx	0x420108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a80820  ! 4157: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00040  ! 4159: FMOVd	fmovd	%f0, %f24
	.word 0xb1a48860  ! 4160: FADDq	dis not found

	.word 0xb1a00020  ! 4161: FMOVs	fmovs	%f0, %f24
cpu_intr_1_326:
	setx	0x430122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a48840  ! 4165: FADDd	faddd	%f18, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5abc820  ! 4167: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba00520  ! 4168: FSQRTs	fsqrt	
	.word 0xbc2cc000  ! 4172: ANDN_R	andn 	%r19, %r0, %r30
	.word 0xb5a54860  ! 4173: FADDq	dis not found

	.word 0xbba40840  ! 4174: FADDd	faddd	%f16, %f0, %f60
T1_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 4175: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a80420  ! 4178: FMOVRZ	dis not found

	.word 0xb9a54820  ! 4180: FADDs	fadds	%f21, %f0, %f28
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, e)
	.word 0x8f902002  ! 4183: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbda48860  ! 4185: FADDq	dis not found

T1_asi_reg_wr_219:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 4189: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a409a0  ! 4193: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xbda88820  ! 4194: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_220:
	mov	0x1d, %r14
	.word 0xf6f38e60  ! 4195: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbfa509a0  ! 4196: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xbba549c0  ! 4198: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xb5a4c940  ! 4203: FMULd	fmuld	%f50, %f0, %f26
cpu_intr_1_327:
	setx	0x430022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58940  ! 4208: FMULd	fmuld	%f22, %f0, %f58
	.word 0xb9a40860  ! 4209: FADDq	dis not found

	.word 0xb7a508a0  ! 4213: FSUBs	fsubs	%f20, %f0, %f27
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1a81420  ! 4219: FMOVRNZ	dis not found

	.word 0xbda80c20  ! 4221: FMOVRLZ	dis not found

iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a5c8c0  ! 4225: FSUBd	fsubd	%f54, %f0, %f28
	.word 0x8594e093  ! 4226: WRPR_TSTATE_I	wrpr	%r19, 0x0093, %tstate
	.word 0xbba488a0  ! 4228: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xb5a81820  ! 4231: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_328:
	setx	0x430226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbba488e0  ! 4238: FSUBq	dis not found

iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 1c)
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_221:
	mov	0x20, %r14
	.word 0xf2f389e0  ! 4249: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xba9420b3  ! 4250: ORcc_I	orcc 	%r16, 0x00b3, %r29
	.word 0xbda489e0  ! 4254: FDIVq	dis not found

cpu_intr_1_329:
	setx	0x43010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_330:
	setx	0x400123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42de130  ! 4257: ANDN_I	andn 	%r23, 0x0130, %r26
cpu_intr_1_331:
	setx	0x400225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bc60fe  ! 4263: XNORcc_I	xnorcc 	%r17, 0x00fe, %r28
	.word 0xb8450000  ! 4265: ADDC_R	addc 	%r20, %r0, %r28
T1_asi_reg_wr_222:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 4266: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_332:
	setx	0x40032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44920  ! 4275: FMULs	fmuls	%f17, %f0, %f25
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_180:
	mov	0x12, %r14
	.word 0xf4db8e80  ! 4283: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_333:
	setx	0x40003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_181:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 4287: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbca5609b  ! 4291: SUBcc_I	subcc 	%r21, 0x009b, %r30
T1_asi_reg_rd_182:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_334:
	setx	0x410024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_335:
	setx	0x42030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_183:
	mov	0xd, %r14
	.word 0xf6db8400  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_184:
	mov	0x1c, %r14
	.word 0xfcdb8e80  ! 4300: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a81c20  ! 4304: FMOVRGEZ	dis not found

	.word 0xbfa489a0  ! 4305: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xbc05c000  ! 4306: ADD_R	add 	%r23, %r0, %r30
	.word 0xb7a81c20  ! 4310: FMOVRGEZ	dis not found

iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 2)
	.word 0xbda81820  ! 4312: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_336:
	setx	0x420018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 4314: FSQRTd	fsqrt	
	.word 0xb7aa0820  ! 4316: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb6bc20fa  ! 4318: XNORcc_I	xnorcc 	%r16, 0x00fa, %r27
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 35)
	.word 0xbbabc820  ! 4321: FMOVVC	fmovs	%fcc1, %f0, %f29
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_337:
	setx	0x410306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 4332: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb40cc000  ! 4338: AND_R	and 	%r19, %r0, %r26
cpu_intr_1_338:
	setx	0x420204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 1e)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a9c820  ! 4348: FMOVVS	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_339:
	setx	0x420210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 4356: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a4c940  ! 4364: FMULd	fmuld	%f50, %f0, %f56
cpu_intr_1_340:
	setx	0x42011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_185:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_186:
	mov	0x1e, %r14
	.word 0xfcdb8e80  ! 4369: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5aa8820  ! 4370: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00520  ! 4372: FSQRTs	fsqrt	
	.word 0xb1a4c840  ! 4375: FADDd	faddd	%f50, %f0, %f24
T1_asi_reg_rd_187:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 4378: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5a00520  ! 4381: FSQRTs	fsqrt	
	.word 0xb9a508a0  ! 4383: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbfa4c8c0  ! 4387: FSUBd	fsubd	%f50, %f0, %f62
T1_asi_reg_wr_223:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 4388: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_341:
	setx	0x400037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 4392: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb57de401  ! 4393: MOVR_I	movre	%r23, 0x1, %r26
T1_asi_reg_rd_188:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, f)
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_189:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9a90820  ! 4399: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbf7d4400  ! 4405: MOVR_R	movre	%r21, %r0, %r31
T1_asi_reg_rd_190:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_191:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 4407: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1aa0820  ! 4411: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_192:
	mov	0x1, %r14
	.word 0xf8db84a0  ! 4412: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_224:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 4416: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5a50960  ! 4419: FMULq	dis not found

T1_asi_reg_wr_225:
	mov	0x15, %r14
	.word 0xf8f38400  ! 4420: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbda4c860  ! 4421: FADDq	dis not found

	.word 0xbda4c8a0  ! 4424: FSUBs	fsubs	%f19, %f0, %f30
T1_asi_reg_wr_226:
	mov	0x30, %r14
	.word 0xfef38400  ! 4425: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9aa8820  ! 4426: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa58960  ! 4427: FMULq	dis not found

	.word 0xb5a408e0  ! 4428: FSUBq	dis not found

	.word 0xbfa00540  ! 4429: FSQRTd	fsqrt	
T1_asi_reg_wr_227:
	mov	0x2f, %r14
	.word 0xfef389e0  ! 4432: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_228:
	mov	0x14, %r14
	.word 0xfef38e40  ! 4433: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbd50c000  ! 4434: RDPR_TT	<illegal instruction>
	.word 0xb5a548e0  ! 4435: FSUBq	dis not found

iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_342:
	setx	0x410230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_343:
	setx	0x430113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a44840  ! 4444: FADDd	faddd	%f48, %f0, %f26
	.word 0xb9a80420  ! 4445: FMOVRZ	dis not found

cpu_intr_1_344:
	setx	0x420215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_345:
	setx	0x400101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_229:
	mov	0x2c, %r14
	.word 0xf8f384a0  ! 4448: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb41d8000  ! 4449: XOR_R	xor 	%r22, %r0, %r26
T1_asi_reg_rd_193:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb5a00520  ! 4453: FSQRTs	fsqrt	
T1_asi_reg_rd_194:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbdab0820  ! 4461: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a8c820  ! 4464: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3ab0820  ! 4466: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbba80c20  ! 4468: FMOVRLZ	dis not found

	.word 0xbda80820  ! 4469: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_346:
	setx	0x430226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c209d  ! 4474: XORcc_I	xorcc 	%r16, 0x009d, %r24
	.word 0xb9aa8820  ! 4477: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbfaa4820  ! 4478: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb0ac2037  ! 4479: ANDNcc_I	andncc 	%r16, 0x0037, %r24
	.word 0xb5a9c820  ! 4480: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a5c940  ! 4486: FMULd	fmuld	%f54, %f0, %f28
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_347:
	setx	0x40032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaada1c5  ! 4493: ANDNcc_I	andncc 	%r22, 0x01c5, %r29
T1_asi_reg_wr_230:
	mov	0x1a, %r14
	.word 0xfcf384a0  ! 4494: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_348:
	setx	0x400111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec5c000  ! 4501: ADDCcc_R	addccc 	%r23, %r0, %r31
	.word 0xb534e001  ! 4502: SRL_I	srl 	%r19, 0x0001, %r26
T1_asi_reg_wr_231:
	mov	0x1c, %r14
	.word 0xfaf384a0  ! 4503: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 1d)
	.word 0xba2c8000  ! 4510: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xb7a98820  ! 4511: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a98820  ! 4515: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb7a548a0  ! 4517: FSUBs	fsubs	%f21, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_349:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994616e  ! 4528: WRPR_TICK_I	wrpr	%r17, 0x016e, %tick
cpu_intr_1_351:
	setx	0x41002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 4531: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a448c0  ! 4532: FSUBd	fsubd	%f48, %f0, %f26
cpu_intr_1_352:
	setx	0x400208, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_232:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 4535: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_wr_233:
	mov	0x10, %r14
	.word 0xf6f38400  ! 4537: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5ab0820  ! 4540: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a4c8a0  ! 4541: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb1a448e0  ! 4543: FSUBq	dis not found

	.word 0xbfa54840  ! 4544: FADDd	faddd	%f52, %f0, %f62
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_234:
	mov	0x15, %r14
	.word 0xfaf38400  ! 4547: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbda84820  ! 4550: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, e)
	.word 0xbfa589a0  ! 4554: FDIVs	fdivs	%f22, %f0, %f31
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_353:
	setx	0x450337, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_354:
	setx	0x450223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_235:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 4566: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_355:
	setx	0x45003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4572: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_356:
	setx	0x440027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbdabc820  ! 4578: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb7a548e0  ! 4579: FSUBq	dis not found

	.word 0xbda5c8a0  ! 4580: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xbba5c8c0  ! 4581: FSUBd	fsubd	%f54, %f0, %f60
cpu_intr_1_357:
	setx	0x460312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 4585: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb4b5e156  ! 4586: SUBCcc_I	orncc 	%r23, 0x0156, %r26
	.word 0xb015a07e  ! 4587: OR_I	or 	%r22, 0x007e, %r24
T1_asi_reg_rd_195:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 0)
	.word 0xbda94820  ! 4595: FMOVCS	fmovs	%fcc1, %f0, %f30
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_358:
	setx	0x47021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 28)
	.word 0xbbaa8820  ! 4605: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a40840  ! 4606: FADDd	faddd	%f16, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a5c860  ! 4610: FADDq	dis not found

	.word 0xb1a48960  ! 4613: FMULq	dis not found

T1_asi_reg_wr_236:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4615: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a408c0  ! 4616: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xbfa80420  ! 4617: FMOVRZ	dis not found

	.word 0xb3a00040  ! 4618: FMOVd	fmovd	%f0, %f56
cpu_intr_1_359:
	setx	0x47021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_360:
	setx	0x450030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_361:
	setx	0x47011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb294e19d  ! 4626: ORcc_I	orcc 	%r19, 0x019d, %r25
cpu_intr_1_362:
	setx	0x44020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda50820  ! 4632: FADDs	fadds	%f20, %f0, %f30
	.word 0xbda9c820  ! 4633: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_237:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 4635: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbfa54820  ! 4636: FADDs	fadds	%f21, %f0, %f31
T1_asi_reg_rd_196:
	mov	0x1c, %r14
	.word 0xfcdb8e80  ! 4637: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_238:
	mov	0x1f, %r14
	.word 0xf4f38e80  ! 4638: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_363:
	setx	0x450303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d61e8  ! 4643: XNOR_I	xnor 	%r21, 0x01e8, %r29
	.word 0xb5ab0820  ! 4644: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb7a98820  ! 4648: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbda84820  ! 4649: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1a81c20  ! 4651: FMOVRGEZ	dis not found

T1_asi_reg_wr_239:
	mov	0x22, %r14
	.word 0xf8f38400  ! 4652: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbfa80820  ! 4654: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00540  ! 4655: FSQRTd	fsqrt	
T1_asi_reg_rd_197:
	mov	0x25, %r14
	.word 0xf4db8400  ! 4658: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa94820  ! 4663: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab0820  ! 4665: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_198:
	mov	0x36, %r14
	.word 0xf0db8e80  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_364:
	setx	0x440337, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_199:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 4670: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7aac820  ! 4673: FMOVGE	fmovs	%fcc1, %f0, %f27
	lda	[%r16 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a80420  ! 4679: FMOVRZ	dis not found

	.word 0xbfa80820  ! 4680: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_365:
	setx	0x460209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_366:
	setx	0x470219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_367:
	setx	0x44021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_368:
	setx	0x46010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 4687: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_wr_240:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 4688: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbaa5e1d6  ! 4689: SUBcc_I	subcc 	%r23, 0x01d6, %r29
cpu_intr_1_369:
	setx	0x440217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 4694: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a4c940  ! 4695: FMULd	fmuld	%f50, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_200:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 4697: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xba8ca0ee  ! 4699: ANDcc_I	andcc 	%r18, 0x00ee, %r29
	.word 0xb23420ad  ! 4701: ORN_I	orn 	%r16, 0x00ad, %r25
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_201:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 4714: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_370:
	setx	0x460015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a00020  ! 4717: FMOVs	fmovs	%f0, %f25
	.word 0xb3a90820  ! 4718: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a5c940  ! 4719: FMULd	fmuld	%f54, %f0, %f56
	.word 0xbbabc820  ! 4720: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a44920  ! 4723: FMULs	fmuls	%f17, %f0, %f26
	.word 0xbba588a0  ! 4727: FSUBs	fsubs	%f22, %f0, %f29
T1_asi_reg_wr_241:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 4729: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_202:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 4733: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbda54860  ! 4735: FADDq	dis not found

	.word 0xbda54840  ! 4736: FADDd	faddd	%f52, %f0, %f30
T1_asi_reg_rd_203:
	mov	0xc, %r14
	.word 0xfadb8400  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9a489c0  ! 4739: FDIVd	fdivd	%f18, %f0, %f28
T1_asi_reg_rd_204:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbf504000  ! 4741: RDPR_TNPC	<illegal instruction>
cpu_intr_1_371:
	setx	0x470102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_372:
	setx	0x440028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 4747: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_242:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 4748: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa00540  ! 4749: FSQRTd	fsqrt	
	.word 0xb7a4c820  ! 4751: FADDs	fadds	%f19, %f0, %f27
	.word 0xbba80c20  ! 4752: FMOVRLZ	dis not found

	.word 0xb7a44840  ! 4755: FADDd	faddd	%f48, %f0, %f58
cpu_intr_1_373:
	setx	0x460038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2de02f  ! 4759: ANDN_I	andn 	%r23, 0x002f, %r29
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_243:
	mov	0x27, %r14
	.word 0xf8f38e80  ! 4762: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_244:
	mov	0x28, %r14
	.word 0xfef384a0  ! 4763: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_374:
	setx	0x460011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda489c0  ! 4773: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb1a488a0  ! 4775: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xbba4c820  ! 4776: FADDs	fadds	%f19, %f0, %f29
T1_asi_reg_wr_245:
	mov	0x1d, %r14
	.word 0xf0f389e0  ! 4777: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_205:
	mov	0x24, %r14
	.word 0xfcdb84a0  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_375:
	setx	0x470001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ad611a  ! 4788: ANDNcc_I	andncc 	%r21, 0x011a, %r27
T1_asi_reg_rd_206:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 4789: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbfa549a0  ! 4790: FDIVs	fdivs	%f21, %f0, %f31
cpu_intr_1_376:
	setx	0x45012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_377:
	setx	0x450103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba508e0  ! 4794: FSUBq	dis not found

	.word 0xb5a00020  ! 4799: FMOVs	fmovs	%f0, %f26
	.word 0xb9a00540  ! 4801: FSQRTd	fsqrt	
	.word 0xb13cb001  ! 4802: SRAX_I	srax	%r18, 0x0001, %r24
	.word 0xb9a8c820  ! 4804: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_246:
	mov	0x15, %r14
	.word 0xf6f38e80  ! 4806: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_247:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 4809: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_378:
	setx	0x450114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda509e0  ! 4817: FDIVq	dis not found

	.word 0xbfaac820  ! 4818: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_379:
	setx	0x460208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_380:
	setx	0x46013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 4824: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbba58840  ! 4825: FADDd	faddd	%f22, %f0, %f60
	.word 0xb824a12a  ! 4826: SUB_I	sub 	%r18, 0x012a, %r28
	.word 0xb4250000  ! 4828: SUB_R	sub 	%r20, %r0, %r26
T1_asi_reg_rd_207:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_381:
	setx	0x450327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_248:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 4833: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_208:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda00040  ! 4836: FMOVd	fmovd	%f0, %f30
	.word 0xb1a58860  ! 4838: FADDq	dis not found

	.word 0xbc154000  ! 4839: OR_R	or 	%r21, %r0, %r30
T1_asi_reg_rd_209:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_249:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 4843: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_210:
	mov	0xf, %r14
	.word 0xfadb8400  ! 4844: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_382:
	setx	0x460028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588c0  ! 4854: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xb48d0000  ! 4856: ANDcc_R	andcc 	%r20, %r0, %r26
cpu_intr_1_383:
	setx	0x47002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_211:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4861: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_384:
	setx	0x440313, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_212:
	mov	0x2b, %r14
	.word 0xf8db8e40  ! 4867: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_385:
	setx	0x46031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a00560  ! 4871: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aac820  ! 4873: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb7ab0820  ! 4874: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_250:
	mov	0x9, %r14
	.word 0xf0f389e0  ! 4877: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 5)
	.word 0xb81cc000  ! 4881: XOR_R	xor 	%r19, %r0, %r28
T1_asi_reg_rd_213:
	mov	0x2f, %r14
	.word 0xf6db8400  ! 4882: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3a80c20  ! 4884: FMOVRLZ	dis not found

T1_asi_reg_wr_251:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 4885: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a80820  ! 4886: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_252:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 4889: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a80820  ! 4894: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_386:
	setx	0x440323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4898: FMOVd	fmovd	%f0, %f24
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_214:
	mov	0x30, %r14
	.word 0xf2db8400  ! 4905: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_387:
	setx	0x45032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_215:
	mov	0x25, %r14
	.word 0xfcdb89e0  ! 4907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb9520000  ! 4911: RDPR_PIL	<illegal instruction>
	.word 0xb7ab0820  ! 4919: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_253:
	mov	0x11, %r14
	.word 0xfef389e0  ! 4923: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_388:
	setx	0x470026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8a0  ! 4926: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb12c8000  ! 4927: SLL_R	sll 	%r18, %r0, %r24
	.word 0xb9a509e0  ! 4929: FDIVq	dis not found

cpu_intr_1_389:
	setx	0x460023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50860  ! 4933: FADDq	dis not found

	.word 0xb3a50940  ! 4935: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb3a81820  ! 4936: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb3a5c9c0  ! 4937: FDIVd	fdivd	%f54, %f0, %f56
T1_asi_reg_wr_254:
	mov	0xa, %r14
	.word 0xf6f384a0  ! 4941: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb33cf001  ! 4942: SRAX_I	srax	%r19, 0x0001, %r25
T1_asi_reg_rd_216:
	mov	0x0, %r14
	.word 0xf6db84a0  ! 4943: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbbab8820  ! 4945: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a408e0  ! 4946: FSUBq	dis not found

cpu_intr_1_390:
	setx	0x440117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_391:
	setx	0x460303, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_255:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 4956: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0x81942188  ! 4957: WRPR_TPC_I	wrpr	%r16, 0x0188, %tpc
	.word 0xb73c6001  ! 4963: SRA_I	sra 	%r17, 0x0001, %r27
	.word 0xb5540000  ! 4965: RDPR_GL	<illegal instruction>
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_256:
	mov	0x1e, %r14
	.word 0xf2f38400  ! 4969: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_392:
	setx	0x45013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb295c000  ! 4975: ORcc_R	orcc 	%r23, %r0, %r25
	.word 0xb1a00540  ! 4977: FSQRTd	fsqrt	
T1_asi_reg_rd_217:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba848000  ! 4981: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xb7ab0820  ! 4984: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_393:
	setx	0x450105, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2956078  ! 4994: ORcc_I	orcc 	%r21, 0x0078, %r25
	.word 0xb9a00040  ! 4995: FMOVd	fmovd	%f0, %f28

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

	.xword	0xc01044d7a44314e4
	.xword	0x09bc173db0a2b58a
	.xword	0xeba421b354489784
	.xword	0x9e0e8e4390d472ef
	.xword	0xcace4d0714243497
	.xword	0x98ab8bd11b9ee0c7
	.xword	0x384a6c5f0755c17d
	.xword	0x70d318ece6b63c03
	.xword	0x3cd2d4eef2af5c45
	.xword	0x30450e2651770222
	.xword	0x38ce8e43279860f4
	.xword	0x84746a2d74d14fdf
	.xword	0x8cfc38cd6ce0307a
	.xword	0x89d157dd1532e325
	.xword	0x95662e810d541381
	.xword	0x4c8e542b9d6eb993
	.xword	0x89892cdab858a646
	.xword	0xb1a4668ddbfe03c6
	.xword	0x97568b5d742485a1
	.xword	0xb1ea2249dbc40d9d
	.xword	0x698aa63c16320e4e
	.xword	0x3c96defcd76a2446
	.xword	0xca236eaac9436afe
	.xword	0xc53b8325852ac582
	.xword	0xc74d77a26a37056c
	.xword	0x6ca5f9bbf65723ba
	.xword	0x913166d674716a8e
	.xword	0xca42547831417ffd
	.xword	0xba1a79875ce56224
	.xword	0x6e8da080f4b31b15
	.xword	0x36fa60120fe07523
	.xword	0x5b438febdc1caa18
	.xword	0x1cdb63d06c4a69da
	.xword	0xa81af0b7d2fe278c
	.xword	0xdec4f81b629b5aa2
	.xword	0xbc1d85075ecf7e56
	.xword	0xd21a74897eec028f
	.xword	0x6adf34a6987bf68f
	.xword	0x37c0ffa0ba05887a
	.xword	0xce36be0ac6f44642
	.xword	0x7f06762327032785
	.xword	0x988b887994a3a6ce
	.xword	0x34ef57c359a74a77
	.xword	0x8ecc38ebfd9b0142
	.xword	0x9740b1cb1a44a9a8
	.xword	0x38c1a778f5126df2
	.xword	0xe87356a937296040
	.xword	0x29c8dbb2d67317f2
	.xword	0x0872d1aad2b9fcab
	.xword	0x63d9301c4df13a17
	.xword	0x937002657b99f85c
	.xword	0x32cf0ad4908da8d0
	.xword	0x53bddbbb982e01e0
	.xword	0xc5fc358c5c44dbd2
	.xword	0x9cc4ec8b5c5da4a5
	.xword	0xe3e462aa30a785d7
	.xword	0x83082ae033ee37c4
	.xword	0x8c32246e8c3e514b
	.xword	0x3afffcf2ae3a8b50
	.xword	0x05a8d24a61ac2394
	.xword	0x01075572dd12d672
	.xword	0x620d7d43e46a0c38
	.xword	0x4d1b43fe7a4d80f6
	.xword	0x38529033611df216
	.xword	0x9c857268c89f4f4b
	.xword	0xd577f0c50a711c5a
	.xword	0x3630810a163b4e31
	.xword	0x2caa5263ce76c417
	.xword	0x400243c1c8718dca
	.xword	0x9f3a2fb2f73b8b01
	.xword	0xcaf3f18b847167c3
	.xword	0xb4c49be3bf69b7bd
	.xword	0x983e2d6a6d8196b7
	.xword	0x5c2c7ff865ab2017
	.xword	0xfabdaa833234f639
	.xword	0xdaef1aa55ccb48c1
	.xword	0x31ce63c6847d7226
	.xword	0xfeeff4262f9950ed
	.xword	0x1635dc0455f2d9bb
	.xword	0x4c89a208cbc9334d
	.xword	0x98d6c44494c0a827
	.xword	0x6473c8dd494bf1ea
	.xword	0x49000b2b41c99145
	.xword	0x1616bea49eb5ec95
	.xword	0x13a103726a702455
	.xword	0x666c5364d51f4205
	.xword	0xfe55ec3a0cce1da0
	.xword	0xf424a75f332b1ae0
	.xword	0x6caa8dc66ece8156
	.xword	0x33a054a697e3865f
	.xword	0xe28a49beb9cbef97
	.xword	0x4590d2c2d979dccd
	.xword	0xe4fc1d08977c10a3
	.xword	0x46740f21e09015e9
	.xword	0x6fe2d1354999ea54
	.xword	0x146fdf7526ad9775
	.xword	0x9db03d11ea8ca8ea
	.xword	0x6b47cd99c6fb2912
	.xword	0xa076fa2035f3be89
	.xword	0xca5ecdf6e1a3a962
	.xword	0xbf294cc6dd957f07
	.xword	0xf245296644407483
	.xword	0x3095344fb4e7272f
	.xword	0x59350b4cdd90c154
	.xword	0x53cbe577adef375d
	.xword	0xa7f58578673f435b
	.xword	0x634c4a134024bfe9
	.xword	0x9d50277b46de08be
	.xword	0xdd52140b04ebc924
	.xword	0x75fb8dfd5ec642b2
	.xword	0x1dcc9e0c9bfe9c83
	.xword	0x82c9d6992b993fa8
	.xword	0xbad7d761e8d3ef64
	.xword	0xb6fbd3d83391d39f
	.xword	0x6f1dd8a4e3c68408
	.xword	0x881e954e3ba96944
	.xword	0x046ef29ca2eff84a
	.xword	0x50f9fd5b5f8779ad
	.xword	0x8f7797336e16ed4b
	.xword	0xdcc5ebd398655cf2
	.xword	0xbe13083553f8e8c8
	.xword	0xf3c746e6b05ab5c3
	.xword	0x425d63bf1ec3515c
	.xword	0xcc78d4c2878df85c
	.xword	0x352a5bae2131ec60
	.xword	0xbfdae06fc3d94304
	.xword	0xfd90d65161e7a3f6
	.xword	0xa47edfe43b341869
	.xword	0x45745739bce6e23a
	.xword	0x6c2fb862059df227
	.xword	0xb65ac10d42a3d952
	.xword	0xfaf3b6205f23107a
	.xword	0x5ead25b98abafc3a
	.xword	0x4cab4ed32487efc4
	.xword	0x9e41d254f7785d2a
	.xword	0x1355265ddced117d
	.xword	0xaa90ff6a1ebe9b3f
	.xword	0x9eebbe2f5bfdf7cf
	.xword	0x052600507c392d1d
	.xword	0x3d32f824d8a60bb1
	.xword	0xe25ea042aaf2ed19
	.xword	0xffb2381cd0987bb3
	.xword	0x51cd1de0b66b2824
	.xword	0xf6c2fce984c315b8
	.xword	0xca1324fcbca594cd
	.xword	0xac8fa3fb4f2ced29
	.xword	0x20342b4bc394533a
	.xword	0xcf28d805db662c4e
	.xword	0x609ff8ae57f40195
	.xword	0x44c477e077e391e8
	.xword	0x0dcebb8a454bcd8d
	.xword	0xa9171839554130fe
	.xword	0xaa96de28b5dbd7a4
	.xword	0x91692447612c9762
	.xword	0x60b257e9669f8f21
	.xword	0x628238624bb46021
	.xword	0xa33c4687b2b60f22
	.xword	0x95f56066a28db49f
	.xword	0xaeb66511d383bf23
	.xword	0xb6109ac6b807b763
	.xword	0x7f2d9f63e8cb58a8
	.xword	0x3df1354175886e79
	.xword	0x8ea5d37a291b09b2
	.xword	0x8912f4db68e29c37
	.xword	0x236afa993d5b72a5
	.xword	0xfe66c135c4ba2660
	.xword	0xb3e06eeabfda31d4
	.xword	0x1c8d437d8a153951
	.xword	0xed380c31dd73868a
	.xword	0xb6898991e85d6400
	.xword	0xa3e2eac8c88d55af
	.xword	0xee91a857432d28db
	.xword	0x0cabb7cba8621419
	.xword	0x9789a659805cfeb0
	.xword	0x8f5ae9edbe1eff78
	.xword	0x9044d2ec16874388
	.xword	0x0c7775e1bf5d05e2
	.xword	0x8efbed02ee7d491b
	.xword	0x318bd3b27e4e4392
	.xword	0xd95d006ae32c08db
	.xword	0xf0e71ee802f8886b
	.xword	0x81dd3c89350e317c
	.xword	0x63b5b54cf789f097
	.xword	0xa249be2dcc810311
	.xword	0xb105e8e594aa4428
	.xword	0xaca1b5d8853ca5a6
	.xword	0xf95ccbbb2f7c1119
	.xword	0x57e9faa38c006b08
	.xword	0x81ac63da2ee5e1e2
	.xword	0x421d50b112961b1e
	.xword	0x94f164c3d20e7db2
	.xword	0x63757c182128a109
	.xword	0x82e96f90816bc3ee
	.xword	0x4b9cc304a2cad28a
	.xword	0xc321114220b59506
	.xword	0xb441b1e505685250
	.xword	0x3ae122d89944ee15
	.xword	0x5e75acbf71ba9b97
	.xword	0xa412c734c7fd358e
	.xword	0x996e6b7c9dbbb577
	.xword	0x33719a82a4675489
	.xword	0xc845da5896844a88
	.xword	0xc4bafd29e9efcc22
	.xword	0x7f3d041e90e78891
	.xword	0x777358f681a0f7c6
	.xword	0x6f53032d47ba7aa4
	.xword	0x145d9773712d645d
	.xword	0x40c9c411f5b0ddf0
	.xword	0x02be084af04551e3
	.xword	0xfd67d5aed769c1e4
	.xword	0xc4a7becf0636c3f9
	.xword	0x00656f87f4affe3f
	.xword	0xf283f3ab8c3fd7d1
	.xword	0x9d8970848e00a62c
	.xword	0xccce4aa51d0ffae6
	.xword	0xc9ea4046f8269b9f
	.xword	0xdd9213e8d5a570e5
	.xword	0x61c014ab2b414108
	.xword	0x6d596f3cf4521e7d
	.xword	0x74981e6ed74e6ed2
	.xword	0xaee8b3a896d50e4e
	.xword	0x723330380eda3577
	.xword	0x78c23a4488f6226b
	.xword	0x4104fb2a6d801427
	.xword	0xd5e542af1172ec9b
	.xword	0xb03cae2367dbe28d
	.xword	0xf4b6973010e1507d
	.xword	0xde31573b10e38b42
	.xword	0x4f153336c38603d7
	.xword	0xbd9f4ea4f390cea7
	.xword	0xe85628d93125e278
	.xword	0x26d2f8075d342d88
	.xword	0x4931e956b045297f
	.xword	0xca605c67d811342d
	.xword	0x345d17e618fecfa2
	.xword	0x3466d429ecaa2dfe
	.xword	0x653ed0fdaa9647f1
	.xword	0xfdf886f698993b4e
	.xword	0x70496fded715d2b9
	.xword	0x77cf7a83911c24f9
	.xword	0xc256fa45d264bae7
	.xword	0xf4de5eb34ce81131
	.xword	0x8d4fe11e0cad0f92
	.xword	0x13132674340e8281
	.xword	0xf0ba5eb4b37a1e59
	.xword	0xae52ee9a38d48a8b
	.xword	0x0f0cecea6d4399d5
	.xword	0x77a37fdac5abb34c
	.xword	0x0db65bea0fc99954
	.xword	0x5c02e72d7f490a34
	.xword	0xc4eb164477aaa099
	.xword	0x8a351858e660e10d
	.xword	0x2979d7630e8dba6a
	.xword	0xf5ba3808fb6bcec2
	.xword	0x9d6ac927bd1cd89d
	.xword	0xff654ca07b8cdb93
	.align 0x2000
	.data
data_start_1:

	.xword	0x5559779bccab23d1
	.xword	0x3cf4c2b68972028b
	.xword	0xea1030549cdbc0d4
	.xword	0x17f64d14ab6cc68b
	.xword	0x0d6937dd1497cc71
	.xword	0x7b4ecc5dafb78b02
	.xword	0x2389aecfe8994959
	.xword	0x492363cd750a206a
	.xword	0x56455e62256179a4
	.xword	0x47c0834afe67002c
	.xword	0x5a8d0881bd355e33
	.xword	0x4a6bffdf4ce13c9d
	.xword	0xeff23adecf5450a2
	.xword	0xe20e63f43f4b22ad
	.xword	0x53ecb591a81a0a4c
	.xword	0x8d4c3f48a25f9a57
	.xword	0xf8c612a0e7dc433b
	.xword	0x33b91812835249e3
	.xword	0xe0e910cbb2794e8d
	.xword	0x7fc72c1fb2a08b11
	.xword	0xcfb67c5eb04efa98
	.xword	0xbc61815fd6d47648
	.xword	0x76319303e98fb176
	.xword	0xd3b8c61574b4a7d7
	.xword	0xb59d6d5c2570a661
	.xword	0x66bda991dc1154e0
	.xword	0x271ecd3adcdf5e2d
	.xword	0x64d53ada92823e76
	.xword	0xd091531db2feac97
	.xword	0x881350e0d2af8de3
	.xword	0x31a08ad58f95de84
	.xword	0x134431dcf199462d
	.xword	0x255c76692a45200d
	.xword	0x1e1495c19c2d8bb1
	.xword	0x8da1d3cf3bc2efbb
	.xword	0x6dea8e8f2aa379ef
	.xword	0x70a5f0f427b25a42
	.xword	0x77e45e74bf79d450
	.xword	0x08e2314eb5781de6
	.xword	0x466b7c37e5fa61f2
	.xword	0x0c938bff1be80765
	.xword	0x1b54c429ee5203a5
	.xword	0xc3f290c8139e634d
	.xword	0xd667360c321c7e9f
	.xword	0xf02999cecd0519c4
	.xword	0x131bddd9c78a68ec
	.xword	0x5849f05694a3effd
	.xword	0x0c4d56f89f5f00f9
	.xword	0x78b39833f507112a
	.xword	0xa9b55c5df6b1b5be
	.xword	0x398f8a8219d4c10d
	.xword	0x1596c21affa90050
	.xword	0xc3bd2fc83751f6ad
	.xword	0xfc4f0a64f40b920f
	.xword	0x11f5108e45a2b280
	.xword	0xd1dc545a5421966b
	.xword	0x6d749cb15c719113
	.xword	0xc391e4254c11aed3
	.xword	0x8fe55c7248e94689
	.xword	0x06022a52b7ee21b4
	.xword	0x48da5c13b4538661
	.xword	0x80133bf26ea9dd29
	.xword	0x9242bbc5c2956c73
	.xword	0x7c6d042434e6557c
	.xword	0x62e1ab6586bf5393
	.xword	0x37765b6bf9fa2bcd
	.xword	0x7848b54db6d5bc81
	.xword	0x0df65aa002b09d80
	.xword	0x786b6a416dba436c
	.xword	0xf5ac4ab53f44c5ff
	.xword	0x1975f3c40245d57c
	.xword	0x8ae7bc37998e2b2d
	.xword	0x4b22ba572b840cf1
	.xword	0xa0d816cd81e39c8e
	.xword	0x17019e9df78a5df1
	.xword	0x3e3089086818a9c7
	.xword	0xf97ed1b0ad87142e
	.xword	0x34f6d9e2d504fbbf
	.xword	0x6673938829a5e909
	.xword	0xc4d2d41ccce0d5c4
	.xword	0x95bdc6b3d96ac85a
	.xword	0x73d7e22ea3b7f90d
	.xword	0xa225a07bf123b082
	.xword	0x124f955e790d558b
	.xword	0xcbcf5e1494d1acc0
	.xword	0x1c64d65da12a70b5
	.xword	0x25397837d65c2cdc
	.xword	0x278de118b3addc01
	.xword	0x299f01f2f9678a47
	.xword	0x4cbf0964654fb74f
	.xword	0x9c5cfb7b18174ea0
	.xword	0xf18086e9bd8c79a9
	.xword	0x5c327ce30a154a04
	.xword	0x0824f20d4e43da6d
	.xword	0x8a36ba719867ce19
	.xword	0xc27ca3ceae4d99d6
	.xword	0xf5a0705c682865d5
	.xword	0x704ec816f91e503d
	.xword	0xb37d00cb9c0a06f4
	.xword	0x4a6b80ea822afbde
	.xword	0x26ba80cd90158311
	.xword	0x6288c57e739b33ba
	.xword	0x5a0213799f2642ab
	.xword	0x02cfe59589a73ea6
	.xword	0x31a27df189368437
	.xword	0xec5a93e98de0dd17
	.xword	0xee1ee17467ca09ce
	.xword	0x32360baf335a05a1
	.xword	0x59b439b40da00219
	.xword	0xf12622d0f71255aa
	.xword	0x45b8da9f7b02229a
	.xword	0xa9d4e1ab5dd76daf
	.xword	0x72a2d2859cfdf423
	.xword	0xcd2e4b96665b1a71
	.xword	0x4ae57cfcb07ebefa
	.xword	0xda9aab71087adffb
	.xword	0x7f8093a9ad3ccbde
	.xword	0xa538486d5f179be2
	.xword	0x5d6aebb74ceedcbe
	.xword	0xb045e9cee6485165
	.xword	0xde422e875594934a
	.xword	0xc450edb6e2bdf397
	.xword	0xa9582c5db4620787
	.xword	0x624224c5b66ea03f
	.xword	0x0ee3c5c50585edb8
	.xword	0x81491edadf8d803a
	.xword	0x3fa5aab0c4c95130
	.xword	0xf38a14d49032bacd
	.xword	0x9dbb0683793544ae
	.xword	0x50235b87239025f8
	.xword	0x9cab2860f0de0659
	.xword	0xe185f81b8263541e
	.xword	0x32dfab03d1a19c0f
	.xword	0x14c6d892a57b0d90
	.xword	0x598485943f9ffaf2
	.xword	0x76a2fae1608d5887
	.xword	0xdc6a83bc5695939f
	.xword	0xac8a55fb2a129aaa
	.xword	0x142cd9187c2c14c2
	.xword	0xef1b823f7405dcb9
	.xword	0x2b21f21a64523436
	.xword	0x4b00a46d26b9ad13
	.xword	0x31ed00a7fff180b4
	.xword	0x1732e82790cf3dba
	.xword	0x576301dbd0ef78f7
	.xword	0xacfc8ad4863dcd54
	.xword	0xb5561281c17569d4
	.xword	0x57338ace4facfc20
	.xword	0x001c3d40159594c4
	.xword	0x34748320c118d660
	.xword	0x3922e6edbb26190a
	.xword	0x702d8d9f15dd06be
	.xword	0xfb29fb7701e940a0
	.xword	0x846e83dd59ec86f4
	.xword	0xc2836e5ccf8c27dd
	.xword	0x593f137562667c7f
	.xword	0xfdb39e6d6c5c6d2a
	.xword	0x9e8d34478fd4e35c
	.xword	0x66cc681eecf12dc0
	.xword	0x7d12c5ad82f0c179
	.xword	0x802a625f5c312d7f
	.xword	0xe01642339c0735c3
	.xword	0x2a13cff2cc870e93
	.xword	0x473432b5bff45988
	.xword	0x9ec81caae83017d9
	.xword	0x2a99873812a66c44
	.xword	0x92aa6131037bf400
	.xword	0x54464d1349279d5a
	.xword	0x07e5a2d6673e0c18
	.xword	0x3a6fe7a0371e2795
	.xword	0x937d06e50f58f8b3
	.xword	0x4a8c4005f3b16dc0
	.xword	0xa38fff870436a2ad
	.xword	0x168c3f9b532257ce
	.xword	0x236ba22b5f397d39
	.xword	0x84ba981cedd3a81c
	.xword	0xde7396d72edfff88
	.xword	0x8a1893bd2825e731
	.xword	0x487765fddf530b41
	.xword	0xa27f92497598a263
	.xword	0xa76c53d9c659e2ef
	.xword	0xe5b1b84f21ec2938
	.xword	0xedc27213b02b7b38
	.xword	0xb2e461b24ee124ec
	.xword	0xf2168da5732c341c
	.xword	0x003f0ef75cc7daf3
	.xword	0x39a792ff36cbe0fe
	.xword	0x529f1953ef8d379c
	.xword	0x86a9b320ed8f4488
	.xword	0x086a64828fc8bc10
	.xword	0x2140d4a03197fc20
	.xword	0x99f7704887af71e4
	.xword	0x45dda3a5c20f869a
	.xword	0x0eef41e43013e93d
	.xword	0x17a352c4ac5abcfd
	.xword	0x9ac31d9009d499ea
	.xword	0x168b45cbd7dbd229
	.xword	0x4374095515a35948
	.xword	0x7d97bd2199fcb412
	.xword	0x736431291ae94a97
	.xword	0x37ad8c2e2978fe7b
	.xword	0x1e0b4afaab86716e
	.xword	0xdd87ae0ae53ba11c
	.xword	0xa8c790981d56a816
	.xword	0x3624106681e3e971
	.xword	0x4e65652e3742e579
	.xword	0xc0f25b51a0b33560
	.xword	0xeb13968b1e75dd46
	.xword	0x00885676bb1e8980
	.xword	0x1f9bf076c72dea52
	.xword	0x9a990fa453b46357
	.xword	0x23bd87047200f144
	.xword	0x80390e2d4d557deb
	.xword	0xf293f505987b95e9
	.xword	0xfe03f023b75a589a
	.xword	0xd3b02e93e3ea3f69
	.xword	0xb83cb174f31b70fa
	.xword	0xa184402b571e6597
	.xword	0x5653f66da18315c4
	.xword	0xe61025de437dac97
	.xword	0xab3376b39111da62
	.xword	0xbd17e2bef0789001
	.xword	0x9cc2b58b48a2394a
	.xword	0x5b7f13043fadd44b
	.xword	0x090ae69c4a5c3271
	.xword	0xa907e4764eca3609
	.xword	0xbc190b784bfc6f2e
	.xword	0x98ead210745dd343
	.xword	0x1b66945a0018c960
	.xword	0xc11cad1324823d16
	.xword	0xc83a1fb0dc2bae9e
	.xword	0x4961f9aae5912ef2
	.xword	0x617d6d3b10a9fd7f
	.xword	0xdb50f49a552219c0
	.xword	0xe41a06d6e2814ee3
	.xword	0x52ad136401daaeef
	.xword	0xf09f73342937a13d
	.xword	0xae30810207f768a6
	.xword	0x7b54e8e7bdd16b80
	.xword	0x4f175ddb77964ff3
	.xword	0xf95ffd24b0d366b2
	.xword	0xe5bd6325e250960d
	.xword	0x294f0ee49acc57b0
	.xword	0xf0447ce0eb0cf196
	.xword	0x4be4bad09af598a0
	.xword	0x8fadafbebc18bacc
	.xword	0x2ffaee72e670f3c8
	.xword	0x6a59c7a15180a6d8
	.xword	0xd83f01af1dfebb87
	.xword	0xf0d392fd9f169ee7
	.xword	0xb2532b91ead2a382
	.xword	0x476ab7f54335000d
	.xword	0x371db89c68e052d7
	.xword	0x9b6b97b9af6cf23b
	.xword	0xb613cdf144c9d9d0
	.xword	0xebfe3973b2c5a87b
	.align 0x4000
	.data
data_start_2:

	.xword	0xa9e1c6622d2aef67
	.xword	0xfa7e6230e64a2fa6
	.xword	0xf549c5c0102ee007
	.xword	0xa7864419eb28873e
	.xword	0x79cfd050f37afe9d
	.xword	0xea8ebdcc6275729d
	.xword	0x84c6f4e19b5e51bb
	.xword	0xd6493b4696dc12f8
	.xword	0x29be2101dc3e460f
	.xword	0x468494647d20c4ac
	.xword	0xa74fcee39aebbef8
	.xword	0xd0fc620735f58e55
	.xword	0x6dab7a87efa1fe52
	.xword	0x7642812a209d64bf
	.xword	0x319d5736980f85c8
	.xword	0x5547947401eca2e6
	.xword	0x64ddee3b309091d7
	.xword	0xa69111f441f6503d
	.xword	0x16953e2262454424
	.xword	0xbdd6700dd6d11bce
	.xword	0x8c0e7f27f4cece52
	.xword	0xcc02791cb52494e2
	.xword	0x6cebe5bbde525184
	.xword	0x075251d97c02a1b5
	.xword	0x7dd3fe155bdeb4d9
	.xword	0xbbcbf6badc4cf5dc
	.xword	0x3644b13a4d2707f7
	.xword	0x10c8ec240a129b95
	.xword	0x7a5cfb17e63a2966
	.xword	0x8898584076bff8ba
	.xword	0x58c8f97a25ec081d
	.xword	0xa1641c6a8d64589e
	.xword	0xf32d7b6d2dc9037d
	.xword	0xed9cbb3733582141
	.xword	0x5d6665b7c1ec748e
	.xword	0x73d5f8f25f1f7c11
	.xword	0xa34a8c68af52f211
	.xword	0x362a352fb33c3378
	.xword	0x82644497625edeba
	.xword	0xd1c44ace3346b7be
	.xword	0x3e912e489123b3ff
	.xword	0xe3416ebdd75285f0
	.xword	0x5c40a6597d1e071b
	.xword	0xc91afade867982e0
	.xword	0x8268b69da73ccc1f
	.xword	0x2481affc7a99874b
	.xword	0x91fa0f2e52c074c2
	.xword	0xcdd0ef4d819e62cd
	.xword	0x0fc7364322180258
	.xword	0x495fc2575ddd255a
	.xword	0x3c020812d636899d
	.xword	0x50509ee9ff7f0cd9
	.xword	0x115a896cacc84238
	.xword	0x8262a6c035774050
	.xword	0xb84d1d1af6f4ffe6
	.xword	0x3431f625834d78ac
	.xword	0x57c5d7d7669eaa83
	.xword	0xbf57af5c87088a81
	.xword	0x7c822f99f5aece00
	.xword	0x558c382ed6fe4ce0
	.xword	0x434a6138ef896708
	.xword	0x36dc3f64bef9f7c7
	.xword	0x7039e40b7d55ae12
	.xword	0x46689cb337f83b9c
	.xword	0xe02aec0fe08ab703
	.xword	0x84c6a04b74227ec3
	.xword	0xb85986b6f8123d04
	.xword	0x8fce66b3c8dc2498
	.xword	0xf26d92ecf2bccb29
	.xword	0xf9a52c537b2a8754
	.xword	0xe494a7e763ba32b0
	.xword	0x46afaba2fe8f2151
	.xword	0xe1fd53960bc26f80
	.xword	0x32df7802fcc66305
	.xword	0xf63ea8123e3c9382
	.xword	0xa718c93d6e03dc1a
	.xword	0xb659631c44ddf419
	.xword	0xa75ac928e11669bc
	.xword	0x61d924c95da3c4a9
	.xword	0xd7e5350aaa7a0be9
	.xword	0x00559ab654ea7380
	.xword	0x5ad836af45105424
	.xword	0x5747d69aabd909dc
	.xword	0x9f31bd82bc05c628
	.xword	0xcb0fa23b61a43dfe
	.xword	0xf401edfd9fe3a003
	.xword	0x70c3fdfe6eb65d2d
	.xword	0x831d26ef9c648e88
	.xword	0xbc731be4c9821435
	.xword	0xf0edf96e27846604
	.xword	0x31ec1e4f791253bd
	.xword	0x2a64355459efb0dc
	.xword	0x2e83c1581f235db7
	.xword	0x755180c23da697fb
	.xword	0xa247bb3fea2a2ff4
	.xword	0xb5dc0c708b5e8b60
	.xword	0x13221feaf7e6e3a2
	.xword	0xe012236c26d07b98
	.xword	0xae101163b1714e78
	.xword	0x698ebfa0911e4935
	.xword	0xa4a38060d93262a9
	.xword	0x3321677218d4fbc4
	.xword	0xe588cbbac576b47e
	.xword	0xccadf6886532e562
	.xword	0x2f6182684e62f076
	.xword	0x38be7d2dd47f54cf
	.xword	0xa28da2ea8576ff0f
	.xword	0x1c5e2e1363c86c53
	.xword	0x2af33668e10dd9cd
	.xword	0x59fbc52f647a56b9
	.xword	0x29e1c6df075ef3cf
	.xword	0x30477cc1582d77ba
	.xword	0x0823c043c860262b
	.xword	0x53291b8cc74b6885
	.xword	0x4e7cf1cd656722c1
	.xword	0x1388ba7afc480b6e
	.xword	0x980eaca57d1aafdf
	.xword	0xabd654fcc65d824a
	.xword	0x2407cb14c948a845
	.xword	0x0a69d1b8428356dc
	.xword	0x48e8659bf04fef8b
	.xword	0xa238c6db65335f69
	.xword	0x5212e6f5b854306b
	.xword	0xb1119ecbe67e8899
	.xword	0x832288a9193e6574
	.xword	0xe0115d494b728b52
	.xword	0x9e5ba03624e7e2f2
	.xword	0xb256ec81c0948b31
	.xword	0xdf603388ca2e5741
	.xword	0xf9a722d1ec66d93f
	.xword	0xd38c13132e3e7423
	.xword	0xe22658059dc0b9c0
	.xword	0x199121cad9fe2a31
	.xword	0x0a8d66e3db2aec91
	.xword	0xe8c62c69ee52bdc5
	.xword	0x2933d17dbb031eb5
	.xword	0x667d64fd0941c29e
	.xword	0xfe00a9dc561a357e
	.xword	0x3f3a99017a043ff0
	.xword	0x884f49525de29830
	.xword	0x00dac168e202577f
	.xword	0xb0deb9acd2eacc92
	.xword	0x455385085ee793b3
	.xword	0xe80bc8b155212759
	.xword	0xf78c3a2954a7bf07
	.xword	0x2ddad1d7dfcd809d
	.xword	0x9ed458ad2c4d086e
	.xword	0xbc13d9d5fed57233
	.xword	0xdc225a14470a3e60
	.xword	0x5fdb05e9c0cf5d67
	.xword	0xf0cc9e4c6263d478
	.xword	0xea260028c1d6a689
	.xword	0xfccb17b00c1241b4
	.xword	0xb4337c0c54957c84
	.xword	0x7fedc758df97e1e1
	.xword	0x0b0dc3cb5048aad0
	.xword	0x30ab35b570aba8e0
	.xword	0xb043172a05ad1a01
	.xword	0xac125d52d4387cbc
	.xword	0xf14735adf5f1cca0
	.xword	0x3eb9ff5415fd486b
	.xword	0xaa297ec77a0d279c
	.xword	0xeaad98269d9e5022
	.xword	0xc4b139a4730c3a7b
	.xword	0xdca006e95a219d43
	.xword	0xcf50e68283fb30bd
	.xword	0x07dbfa85a459896e
	.xword	0x4c148ea9fc2f5d8c
	.xword	0xa324784ba81fcaf3
	.xword	0x3049b14a98122f29
	.xword	0xe989c9715172fa7e
	.xword	0xbb13c5394404e7a9
	.xword	0xcb3b5167bfa41d20
	.xword	0xa93a0aaa520e4620
	.xword	0x032ddf1545f297fe
	.xword	0x34ac61870125f43b
	.xword	0x7af341ae8b7b1dea
	.xword	0xb5997dba08d14dcc
	.xword	0x5a85c3c1ea357129
	.xword	0xf240614c3544b6b9
	.xword	0x1e4f8da5982bfd81
	.xword	0x7a46a5e8188d6c01
	.xword	0xb3a7a102e40966f0
	.xword	0x84357523e2ea5718
	.xword	0xa808f920653d8d8a
	.xword	0x998ec877559f5975
	.xword	0x3d94699d2ae0d7c1
	.xword	0xbef6ae035652c6f6
	.xword	0x977358637c85f22b
	.xword	0x7518210aeb9cce10
	.xword	0x3a074ac9204c2aab
	.xword	0x76d9a50a884724e4
	.xword	0x4d95499ab9a2f1be
	.xword	0x9a67b1390588285b
	.xword	0xae53d555cee43c84
	.xword	0xc241fd00511a7809
	.xword	0x3b3429b70cb13df3
	.xword	0xa086ee1c6ad21669
	.xword	0x5efb4745ce1cb1dc
	.xword	0x0f2842a822c1feb4
	.xword	0x2d98ff7877539439
	.xword	0x4e165e81a3ef085d
	.xword	0xcc4fb8fa91bceb0c
	.xword	0x846e30a5a0991fd2
	.xword	0x8e2f78349dcde420
	.xword	0x7b71cb425585af3e
	.xword	0x5807c951fbcb1b8b
	.xword	0x29b0756e14cd6672
	.xword	0x4ed6f8a5d1dcfa10
	.xword	0x43061eb57c166a0c
	.xword	0x3997d74c1cf214e1
	.xword	0xb765f9bc155bcf92
	.xword	0xc2a7c7396d7b5409
	.xword	0x117eaa3ab640f516
	.xword	0x3aaab2cc72f63da0
	.xword	0xd73ea9fa8fda0561
	.xword	0x5cdcb71c4df10d6e
	.xword	0x492ea8e84cd32b67
	.xword	0xb67289effcb2ed78
	.xword	0x8414da1657f6ca61
	.xword	0x4f3c682ebc568888
	.xword	0x73a78f162c2ea08d
	.xword	0xaacc91182b158488
	.xword	0x866be7a40017e95d
	.xword	0x2434772ebbe80dcc
	.xword	0x70cd45d6d2806062
	.xword	0xc9717fa2eae9e7b5
	.xword	0x4354c52ead9d550b
	.xword	0xa76ef5c54736b96b
	.xword	0xa337aed9c172e7fc
	.xword	0x2c2916e074b2d63e
	.xword	0x613a8997305177a3
	.xword	0x579e02d188ae6a30
	.xword	0xbd726691ce8aeaa7
	.xword	0xcb740465c2b19ad8
	.xword	0x0034d7e7d8c5f05c
	.xword	0xc3df87fa7d487ff5
	.xword	0x37541694256c0fce
	.xword	0x1e5f369e4835f1d9
	.xword	0x8f71a6a78010f718
	.xword	0xc08cc42fb931992c
	.xword	0x37bb0a739c2bd4eb
	.xword	0x3e60e11ae608205e
	.xword	0x5079413aba4f071d
	.xword	0x1d77f7984ad8bd3b
	.xword	0x5b6f02e2d9572c37
	.xword	0xee2599f624bf43ee
	.xword	0xdc76682d8fa69bd0
	.xword	0x34b6e1487f1c191e
	.xword	0xc10be66fb8136dcd
	.xword	0xd38d3c97d343c711
	.xword	0x7b3dd1b4441a0c4e
	.xword	0xc487f9386a41a4f8
	.xword	0x61fe4af8f9e9fe2a
	.xword	0x005cb138c9c1d8d6
	.xword	0xed6d07fdd6aad11c
	.align 0x8000
	.data
data_start_3:

	.xword	0xa843bd8421275a96
	.xword	0x3f81fe00eba8ee46
	.xword	0x93cd7004752566b4
	.xword	0x52f8644a9afc3fe4
	.xword	0x4478f8601df66fae
	.xword	0x91b8dfa274445511
	.xword	0xe53939a04297a5a5
	.xword	0xd6c992873abb482b
	.xword	0xaae782881a826b8e
	.xword	0xde99fb516b97e252
	.xword	0x71fa05360cfdb2b3
	.xword	0x36de5577b8fa06cc
	.xword	0xf12599c06a266d4b
	.xword	0xa11b397430588ff5
	.xword	0x343bee7c944e810c
	.xword	0xeb98842816c4c68e
	.xword	0x6c5e0adbfbdbaab4
	.xword	0x01348709e9aaa6af
	.xword	0x61c51fb7a6318760
	.xword	0xe2a914956a068932
	.xword	0xbad77cbddcc5973c
	.xword	0x057bc315e6f82c12
	.xword	0xad2245507cd9fa69
	.xword	0xed1dd19285bf7bdb
	.xword	0xe42d301b576967c2
	.xword	0xde679e8a77c28aec
	.xword	0x84719d9a881039a1
	.xword	0x986510eacddcecca
	.xword	0x5ec92093a1541a6e
	.xword	0xd5633187a602c198
	.xword	0xd40501e52ee80f69
	.xword	0x92b2c6da0f5d53f4
	.xword	0xafa2b5fce1857ec9
	.xword	0xd2b0778f02f6532f
	.xword	0x857437eeccb45797
	.xword	0xb43d91a8cba216af
	.xword	0xca388addb56e02f8
	.xword	0x8ce3da99e73a72c1
	.xword	0xa208b8ddd87f628e
	.xword	0xca5466e2f45db333
	.xword	0x2071de4ff4861717
	.xword	0x8af27a8ce585e39e
	.xword	0xdfec9c54fc6793e2
	.xword	0xccbbbc2bf58bc771
	.xword	0x0f93899f08c291a8
	.xword	0xc669019e0bf5ae42
	.xword	0x5f60b50bfa7ded86
	.xword	0x2faa992b4d2f1594
	.xword	0xe098fc4703b0bf3d
	.xword	0x653f47fec7e64def
	.xword	0x369c9ba7ffc1dd84
	.xword	0xeb8101df7a1885d1
	.xword	0x29b8b96db14e5828
	.xword	0x44dc3b43d63049bb
	.xword	0xbf3191566ce7532c
	.xword	0x0528f8486222d071
	.xword	0x272d9131be0de78a
	.xword	0xb342b2550134dbcb
	.xword	0x4756f041527a992a
	.xword	0x62f69b2857b7dfff
	.xword	0x9cc74e35fa0bde55
	.xword	0x5d2410af29ac16b4
	.xword	0x338158cfb5adf309
	.xword	0xf9b301c9d201f533
	.xword	0xd6e98391a3f25438
	.xword	0xc8a4a1a64d930f79
	.xword	0x3bd800d8effe022d
	.xword	0x6ec1305c6cbeadfd
	.xword	0xd5d6026a52b1191f
	.xword	0xb67698009f65a9f3
	.xword	0x4fee099d084c2eaf
	.xword	0x8f0aca100afd320c
	.xword	0x832b15b134f06c5a
	.xword	0x961471544265e036
	.xword	0xf26b64c83e9c8673
	.xword	0xfe2034c2d750da77
	.xword	0x3713aef0c2d962d2
	.xword	0xecbaedb1080d2f5a
	.xword	0x4e02ea97bd106676
	.xword	0x9530a97177326217
	.xword	0xa07b665629b28a76
	.xword	0x5484fbe6b5c14bbe
	.xword	0x236d1a30744f51c4
	.xword	0x885d2c4dccab9d8c
	.xword	0xcc95dcfa4f5b7ad6
	.xword	0xbe8f38b169a5a122
	.xword	0xe0aaf5191e0d0b94
	.xword	0xf54e5be069c39592
	.xword	0x70f2acd3f09ae0bf
	.xword	0xeeb45c4dd7ffe09e
	.xword	0x136f299fb7a2158c
	.xword	0xef3c40ac90d8b751
	.xword	0x5847846b05efb4ec
	.xword	0x961a1de391fb1a8a
	.xword	0x750ad069f4009be6
	.xword	0x02166b82f64afe3f
	.xword	0x9bdf22bb3e32b290
	.xword	0xb525591b347e0279
	.xword	0x234ee0fcfa70c351
	.xword	0x06e46589ef4407f9
	.xword	0x921642593a0c8106
	.xword	0x467c0c33a2e590e0
	.xword	0x00edcf30dedf7843
	.xword	0x92868f2599822b50
	.xword	0x1db995dc7381cf51
	.xword	0x4b506d168736df4d
	.xword	0xa6747c2a23eb3ec5
	.xword	0x8c1a57df6c2a5fcd
	.xword	0x86597e52058f45ec
	.xword	0xfc24047690f57b3f
	.xword	0x77aee0bd798052e3
	.xword	0x477dd7ff15300b16
	.xword	0x3134a5682edabe53
	.xword	0xf71786d34d5bd078
	.xword	0x8bc874810a2dd25a
	.xword	0x07dad4cc6b61cedc
	.xword	0x690801731db5a988
	.xword	0xf910969515a62d74
	.xword	0x153d588bd7bfb1d5
	.xword	0x3d5f2c8697f7e7c4
	.xword	0xfc0a358957a2df85
	.xword	0x53faf282f92e9ae9
	.xword	0xde5205c99e24e43d
	.xword	0x6e1b8d1a7e983ce7
	.xword	0xd5e1a2810fc7cd65
	.xword	0xf90048c3912326e0
	.xword	0xb92ee250b207009b
	.xword	0x8d6a24e92883bea1
	.xword	0xe64771b7a2733de8
	.xword	0x456eef9c4c6bede9
	.xword	0x3e534b6d5c574bbb
	.xword	0xf20c9572e8ed2cd2
	.xword	0xd2c0a1d977bf3b79
	.xword	0xe873df495ab95010
	.xword	0x735b6ad7e2a65761
	.xword	0xd3348c5e73544cc0
	.xword	0xd320c1468667e594
	.xword	0x45aa5fc99e7f6165
	.xword	0x6cfaf183c799b7c6
	.xword	0xc0b3d13429e30b27
	.xword	0x6fcfbc1dc6483893
	.xword	0xf062f9cfb19c6a3c
	.xword	0x96ef21730fb2557c
	.xword	0x7a06471b709f3ce5
	.xword	0x79f591f991513ef2
	.xword	0xfa889f37a741c206
	.xword	0x4534ba7928067151
	.xword	0x32340ebc1d696a9c
	.xword	0x75d77f95effcaf0a
	.xword	0xfadd67baaeb6f3c6
	.xword	0xc8414302edb027de
	.xword	0x5d73cf7919554e6e
	.xword	0x9dfc5d3404c652c7
	.xword	0x199e125214bf8061
	.xword	0x45de8bc3438569b2
	.xword	0x3e653eb6035657f4
	.xword	0xed1f5c234bda12eb
	.xword	0xe8dac6a298adfaf1
	.xword	0x615ab600fb5aedeb
	.xword	0x0a5f840f89ef0a68
	.xword	0x7449fa5802346daa
	.xword	0x1d043417c9b12328
	.xword	0x9a5ec692d32f16f7
	.xword	0x29c0a0d02289813e
	.xword	0x5b50d7002c756584
	.xword	0xcad7ab513b34e188
	.xword	0xf60b752193dfb80e
	.xword	0xce25cc8f5e60205b
	.xword	0x450229608ffe02ce
	.xword	0xc3964bbe7e0f7b24
	.xword	0x8af24716b6cb0373
	.xword	0x8683d4d0f67cd8cc
	.xword	0x74edd33beb9bd043
	.xword	0xc279557bd736b425
	.xword	0x1d72eef24b6a5f4f
	.xword	0x30e410868cf4624c
	.xword	0xdc093d7db7b52304
	.xword	0x3588f4803cff3450
	.xword	0x3eaee6d8beb9e109
	.xword	0xe96afeafebe72d1e
	.xword	0xa19f39732820476c
	.xword	0x30341f504ca87b3e
	.xword	0x70e4e8876f172549
	.xword	0xd51b492b60687007
	.xword	0x80e3bfb269f454e4
	.xword	0x9620dbb31316d067
	.xword	0xb1274c14562b1ff1
	.xword	0x41937c18a1ae2c2b
	.xword	0xa1fd2634044e5804
	.xword	0x8c61cf9ff01e237f
	.xword	0xdb7c58df362940bb
	.xword	0xba7cf334c50cd3ca
	.xword	0x414d3ff326ca6799
	.xword	0xab361a294a08be88
	.xword	0x29f777879bf6a73f
	.xword	0xa9dd0e4a59a94ecc
	.xword	0x2dc656280a5142f0
	.xword	0x5a341a187a283795
	.xword	0x06526b9435995ada
	.xword	0xb0b3362fbe10a929
	.xword	0x54de18fb01e0b64e
	.xword	0x06a71eb4344a05b3
	.xword	0xabafc1cad35ea569
	.xword	0x2640d4a6416c8e17
	.xword	0x59e56eaae5f8fc02
	.xword	0x053ecf6fd6ed86fc
	.xword	0x2ef7210486302fb4
	.xword	0xd04f668b76353fe0
	.xword	0x271f10b0e3f13d2a
	.xword	0x066c37b8e3bbb5a1
	.xword	0x5a83e0c4d52877e0
	.xword	0x05f3213536428bbf
	.xword	0x9cfb84d00020ed25
	.xword	0x745598ac65c50d7b
	.xword	0x06c838ed206e13c2
	.xword	0xea1e23c90298dd0b
	.xword	0xbf0b75778661fd22
	.xword	0x13c26ccc8d7336a6
	.xword	0x3630d2c6505156bf
	.xword	0xd1427a02ef1b7160
	.xword	0xc4c8b6dcc9353412
	.xword	0x7aa2275365baa6f1
	.xword	0xc7897bb40077b3b9
	.xword	0x9f7d76fdbbc72c01
	.xword	0xf3707430cdde2450
	.xword	0x2b00f9770f3bb791
	.xword	0x30eda9899edb5595
	.xword	0x090ba2072ba58fab
	.xword	0x98f412b7cc7f7db5
	.xword	0xf423aefaeeafa32a
	.xword	0x6df67d96e2293147
	.xword	0x87fe83e7c5926c31
	.xword	0x6913b33fe65f72ce
	.xword	0x3d0abc907e26fae2
	.xword	0x435a51acfbb3975d
	.xword	0xd97fcb08c5845322
	.xword	0xc988e922d203e4db
	.xword	0x571e3a994bd967a8
	.xword	0xb9cbbe996fdba5c4
	.xword	0xb2a04d2b57f664b4
	.xword	0x29e75c04e3ff3369
	.xword	0x25d075d88c46246b
	.xword	0x098535912f11889c
	.xword	0xfc528bfcd12fa4c1
	.xword	0xf6f2d91f9f2d0eed
	.xword	0xdbe0c4b7c5b2f7ea
	.xword	0xa3003b27683dd310
	.xword	0x73da23cf11840618
	.xword	0x1c5869532ec2d4c4
	.xword	0xaf77ff06aca27ecb
	.xword	0x672e330341e76e82
	.xword	0x0d302ac1d2fd94f4
	.xword	0xb29c0770e8a95846
	.xword	0x4039bb22bebdba39
	.xword	0xb640db106aaa8a69
	.xword	0x4e6de390927fcd26
	.align 0x10000
	.data
data_start_4:

	.xword	0x5fd094999fc79032
	.xword	0x881f67424e84d1cc
	.xword	0xee2402baefb08850
	.xword	0xd415c3c564a9df06
	.xword	0x05175dd28323e27c
	.xword	0xeb7edfc1abe7d300
	.xword	0x933c8863f99a5df7
	.xword	0xd2be6e53a5061574
	.xword	0x677988431bd4b590
	.xword	0xc4b08fa9cc464884
	.xword	0x230da13a51c99547
	.xword	0x62c551d65f605230
	.xword	0x9844db0a0ba9c7c6
	.xword	0x9c74378005300235
	.xword	0x37972cfbbf357428
	.xword	0x21a8e8b00d511e60
	.xword	0x87914462702f2b23
	.xword	0x015a7be0a19ee32b
	.xword	0x574088e9641b0a60
	.xword	0xd525fc940c9479f5
	.xword	0x40000ca0ea4298c8
	.xword	0x1a231c6108d150c0
	.xword	0xadca47cafa60a5c3
	.xword	0xa74931a9226c655c
	.xword	0x94033810d8feb661
	.xword	0xa7c01bbf01680fc0
	.xword	0xab5cc858d4fb1871
	.xword	0xebb6b04564f21778
	.xword	0xa672a1ffa018d156
	.xword	0xf470412cb223e73e
	.xword	0xd32b44aecdeee423
	.xword	0x562b8986ee94a2ad
	.xword	0x33850215a1dd406c
	.xword	0x4ce3b0a82209050b
	.xword	0xf618f5fe6d3bf097
	.xword	0x2b62cf948985f3e0
	.xword	0xf7639697225ca44f
	.xword	0x9240e4043a0cffbd
	.xword	0xc538f3af6eb7c420
	.xword	0xf8ccd94bfd8bab85
	.xword	0xb3a27247de1cd960
	.xword	0x81d534cadd606d1d
	.xword	0x1cd51a0e2f4c0be5
	.xword	0x9e3c4cea74402185
	.xword	0xb5c64647c4b3eb27
	.xword	0x73a451a80a94cf63
	.xword	0x8e2930bc8465974c
	.xword	0x31fc3368baaa9429
	.xword	0x4a449e76d9fb1dca
	.xword	0xbc86b41a933bd9fc
	.xword	0x303d5b2c74a46726
	.xword	0xa495d9a39df999af
	.xword	0x8af04588b6ebe8e5
	.xword	0x8b99ec0bfe4d3cfb
	.xword	0x4e07dfcb3c3698f7
	.xword	0x3a5dc18cd22062bb
	.xword	0xfe4fc5304fbccdc7
	.xword	0xffbdf48b7035a67a
	.xword	0xda75b91bae6cef85
	.xword	0xc3d00bcc9872fbc6
	.xword	0x953260c859e7a0af
	.xword	0x55ff972ee10724a6
	.xword	0x1b60b6b2a4534038
	.xword	0x2d3dadc08326002f
	.xword	0x7c00cba64d452be7
	.xword	0x4c5d4bc893153735
	.xword	0x6f3614b843753014
	.xword	0x6ffab89a5cc83dfd
	.xword	0x0469d6a9caa01b2d
	.xword	0x3b474a175b90d972
	.xword	0x444e56061c570ed1
	.xword	0xbe1bd8d0c9b1507e
	.xword	0x359b8037f4f3feb6
	.xword	0xc4bac06bbed7b4e8
	.xword	0xf8cdbc1321e8b90c
	.xword	0xaa6800e3acb2c6e7
	.xword	0xf2caa16d17b16821
	.xword	0xe93bf1b472bf076d
	.xword	0x6dbd3029aa5c3602
	.xword	0xaf5900298f11662a
	.xword	0xcc03fb435deb583d
	.xword	0x9c234782f3b6d77d
	.xword	0xc35f740e8c6cae2c
	.xword	0x43b145fe422685c5
	.xword	0x3dc6e09b5977f9ff
	.xword	0x0f6e8f5e3de4af6b
	.xword	0x099cc458a8e7a551
	.xword	0xcfea5596e69ed321
	.xword	0x781f512de2e0c0a3
	.xword	0x9cbd390c61175c4d
	.xword	0x12bbceb7fc5c625f
	.xword	0x680d4fe12765547d
	.xword	0x4c6fa8b2f2c0e133
	.xword	0x9ac3fc202295df6b
	.xword	0x1b4f396f38b406cd
	.xword	0x17db5321e558a276
	.xword	0x145ed35555ea22ec
	.xword	0xd1bef99b87d2661d
	.xword	0x8916de263a734466
	.xword	0x530ebcc0bb9eaa5f
	.xword	0x44108b4084e62af2
	.xword	0xf21305bb8be79b52
	.xword	0x1751c6d1c0e34ecb
	.xword	0xdf3017c19a3e823c
	.xword	0xe434c2c45214bec6
	.xword	0xc103bb81dc676709
	.xword	0x02f6418d7c5cbf83
	.xword	0x923d7f5d4d2eb3c4
	.xword	0x6220953362a1c9d3
	.xword	0x6531bd4119d7791c
	.xword	0xd62b11fe869b02e0
	.xword	0x88bfeeb38771303b
	.xword	0x2223301443039eb1
	.xword	0x25fb4fe170878d15
	.xword	0xa489e7c4feb408fe
	.xword	0x90289ab7f1796154
	.xword	0xa7771508d998b342
	.xword	0x79aa9a42424b50d9
	.xword	0x8ef06186dbbd03c0
	.xword	0x555f401bfe7df12d
	.xword	0xe8855aaac84bcab8
	.xword	0x8d20e38b04d964d4
	.xword	0xd852ab640d34bd35
	.xword	0x351375e0cb5421ac
	.xword	0x1b9537be14c771e1
	.xword	0x16bf01ef50ee8ef5
	.xword	0x540d8adcd9e3d568
	.xword	0x5031012be722c5be
	.xword	0xb3cc87980d629944
	.xword	0xd3275e49a7498953
	.xword	0x6704cbaafbd2dd0b
	.xword	0xb85b20d1569fe785
	.xword	0xf2c64eacfcdd3d78
	.xword	0xc9b66009125d37d9
	.xword	0x89684673f432530a
	.xword	0xef4287819e0fc30f
	.xword	0x7655f717e3597eae
	.xword	0x03af0cea6c5b7e68
	.xword	0x443ebb73b6c35006
	.xword	0xa249ac4fc3798b8f
	.xword	0x244943c6743abd80
	.xword	0x622b0fbebc040f7b
	.xword	0x0183c442c97fb697
	.xword	0x21a6d045555bf7af
	.xword	0xefe2a422389113ad
	.xword	0x92b7fe8455fd4e1c
	.xword	0x01d2306248fee5ed
	.xword	0x051c0540da19e789
	.xword	0x9aa2c04e238e4a77
	.xword	0xb44414b3e89478c3
	.xword	0xbf3fce7ddfc95607
	.xword	0x00e8ffe2ce390bcb
	.xword	0xa8f35b8d8c3ad288
	.xword	0x7075239d209e7f90
	.xword	0x5e64c02aa3fbca06
	.xword	0x0c83206739cb9fb6
	.xword	0x55b03209e1bcd176
	.xword	0xe9d0dbddc3feeb32
	.xword	0xe5dd9578f6a2423b
	.xword	0x2738c0e33947fad2
	.xword	0x86ae5fdde49a98aa
	.xword	0xb772f770db721e75
	.xword	0xf95488d2d801995e
	.xword	0xde536cf4246a3c6f
	.xword	0xd38e94857047d040
	.xword	0x1afe81978da36f7c
	.xword	0x6f606350403b40c5
	.xword	0xfd0561e0cd2dc37e
	.xword	0xe11980270cc6b768
	.xword	0xd4ce6a822e967f8e
	.xword	0x259d3ea5a7a6fba7
	.xword	0xa36f14a6a57c8c36
	.xword	0xf09487c73e9df234
	.xword	0xa0e2b5ec1f335b12
	.xword	0x79fc74754aa94348
	.xword	0x6bd5e9c7f6d8e97a
	.xword	0xfe462fcd1f6a27b7
	.xword	0x1a349cb7ba7974e1
	.xword	0x1a9dbdf55c26b590
	.xword	0x26c77ab3335c2c17
	.xword	0x6ce30df991a870db
	.xword	0x9450f70b99bd88ce
	.xword	0x018f890f1c95a2c7
	.xword	0xe681a225b372dead
	.xword	0x7455a1988385343d
	.xword	0x3da9cb2ebf2fc1d0
	.xword	0x5f0ba41334ccbfd7
	.xword	0x415449318467ff09
	.xword	0x751c055d594c7ca1
	.xword	0x1ae00f153229fce1
	.xword	0x20d4eb95f4ea9304
	.xword	0xd2f1c672ad15f5b1
	.xword	0xd8f05a6e213ecf8f
	.xword	0x8f9338327f6f1df1
	.xword	0xea74c1c256a3090c
	.xword	0x08f3101122d9b4ad
	.xword	0x5a38704202b9d113
	.xword	0x88c21f8d897e3260
	.xword	0x683c2102e462a79c
	.xword	0xf7944a2638bb74ff
	.xword	0xa3f8bcd811f34d60
	.xword	0xb4a6d8740a6a1d94
	.xword	0xf43932417eb7b90b
	.xword	0xa219ab02818d4b41
	.xword	0xdf9b01e27d5d1bd1
	.xword	0xa7ad3defa6ea639d
	.xword	0x3f7dc468eea31c47
	.xword	0x1b045d853072ade9
	.xword	0x5e1da19523a5ea44
	.xword	0x9b99ff06869aa77f
	.xword	0xe2f84cce72b9854e
	.xword	0x059587046f0363c5
	.xword	0xcdafec35c2846761
	.xword	0x231afe54a2243455
	.xword	0x91cceecf0a01342a
	.xword	0x12173f49d3b5f273
	.xword	0x3aef49af8f559b73
	.xword	0xab21eaeff2945709
	.xword	0xef7fd79b0a85fc09
	.xword	0xb652000f78bf6450
	.xword	0xbd7e08c10295488a
	.xword	0x3bc58d840071a77c
	.xword	0x84cbb9aa1117587e
	.xword	0x881cdb42c1642ed9
	.xword	0x4db706b4f219d168
	.xword	0xf6da8a02521a5e6c
	.xword	0x1bd92c6dd04e564a
	.xword	0x00e4cafc2cd311ef
	.xword	0x679e41d482cc115f
	.xword	0xda6a465e4f827a3a
	.xword	0x8962a6231d2e9acb
	.xword	0x41add19370b8358b
	.xword	0x519c5162df1f0f37
	.xword	0x8b084dfb948383a7
	.xword	0x6f9dc86f7f4c78b4
	.xword	0x1508af13cfb97bd0
	.xword	0x89deb2df7635ea26
	.xword	0x1d9ad276262bdaa8
	.xword	0x05e5f1f447a25d5f
	.xword	0x1e94c54fbd20a742
	.xword	0x1828adbcb33b6c02
	.xword	0x50332a7155efe37a
	.xword	0xc6082558112428c2
	.xword	0x0554918a3a38831b
	.xword	0x91cc08ba7ee04362
	.xword	0x2a9284c5f4c077bf
	.xword	0x5a528314e18bea7b
	.xword	0x273ca133f65e6013
	.xword	0xe59fbcf74217d9c1
	.xword	0x2df78c428219628c
	.xword	0x9a389f73847728e9
	.xword	0x2acf71c0f6499bbf
	.xword	0x8e0fa99f7661881d
	.xword	0xe85fe9c22dbc15df
	.xword	0x971d0443434e9168
	.xword	0x560b11bb6ae7c729
	.align 0x20000
	.data
data_start_5:

	.xword	0x5b10dac8dd48efe2
	.xword	0x16d7e4992745568e
	.xword	0x4153a490e3095e8f
	.xword	0x067a338eb73f701e
	.xword	0xa4d63a84ffd33fab
	.xword	0xaadd0e9947db3321
	.xword	0x52e135316a54210e
	.xword	0x073db9da8ef8cdf1
	.xword	0x3940685f00d8a3d2
	.xword	0x24ecc42829a53ff0
	.xword	0xaceda112968459fb
	.xword	0x2e50361377e08d58
	.xword	0x7e797280f8c469cc
	.xword	0xb27e5d1af3816280
	.xword	0x60ce5388cdf14203
	.xword	0x68843e216e02775f
	.xword	0x58a803c245f5812c
	.xword	0xd0df2b8cb167c403
	.xword	0x318e1bef5cc28777
	.xword	0x4d54079f4b96a01c
	.xword	0x91d473c7c5602c82
	.xword	0x379f51ac30391fe5
	.xword	0x2f3e68aa7c116dde
	.xword	0xe98c8e2c2861e024
	.xword	0x60ff7481b6a2e7e5
	.xword	0x7a587d6c3a17dfbf
	.xword	0xd86dcf297bb4d027
	.xword	0x3d795f1f91e5a221
	.xword	0x61b357a9a8931bd8
	.xword	0x606aeb766f9e9f6c
	.xword	0xff5c511443a0727b
	.xword	0xaf773b26b104062c
	.xword	0xdc4b9504c8ed2b54
	.xword	0xb6ced69b6b7fd34e
	.xword	0x0a77f97d026f177c
	.xword	0xf778e81958eeea95
	.xword	0x11542fe34a204611
	.xword	0x2b775972a8eb3101
	.xword	0x35f29b79c69c5666
	.xword	0x80f403f477768ac5
	.xword	0xcbe2c39b3b04ba94
	.xword	0xd1fbc68e82b4c217
	.xword	0x7a810bb1e86c4210
	.xword	0xcb77fc9149c85255
	.xword	0x806ed052d6a02149
	.xword	0x474cea712e2fa1b6
	.xword	0x15e4b058f717e5ca
	.xword	0x1e571c39f947bbb3
	.xword	0x57cc59873cdb3314
	.xword	0x6739f85d695506a2
	.xword	0xc1f366f130614d60
	.xword	0xa7da0a4e839d4678
	.xword	0x53ac8186cdfc60ce
	.xword	0x2ea60c18a553bc3b
	.xword	0xfd4fc03ede6519cb
	.xword	0x141f4c35cc8f66fd
	.xword	0x7498c6525387ed54
	.xword	0xba83511d1f001b7c
	.xword	0x2e5426e7561ab737
	.xword	0x3d28bf05e57df9bf
	.xword	0xc6c39d8cdf0b5601
	.xword	0xdca299cd3334b6c2
	.xword	0x7b861c1663f60439
	.xword	0x5b915641f69ac9e3
	.xword	0x78a254256638292d
	.xword	0xc558031d511ce95d
	.xword	0x54993c1174cfea40
	.xword	0x7556cb5d43cef787
	.xword	0x2877a5d9383ee148
	.xword	0x983bc82d866c02aa
	.xword	0x77033105882cf56e
	.xword	0x3bb388086246a0cd
	.xword	0x462d744d596d9714
	.xword	0x4faecb28e638a207
	.xword	0xb5ad305f24820272
	.xword	0xa8f2edefb5883d19
	.xword	0xfecf7a1ce76d517b
	.xword	0xe9b41de749f9d0e1
	.xword	0x772c0be94bc3478c
	.xword	0xfc2fa7eb2e122765
	.xword	0xb4c472dcce24c2c6
	.xword	0x080f74966b84423a
	.xword	0x3433ef99b7b38b86
	.xword	0xe878d80dd65521a0
	.xword	0x4de1ff1ce4bc8e03
	.xword	0x0040c5b416393206
	.xword	0xdc10ca3694fda5fe
	.xword	0x441c30029503304d
	.xword	0x105af407b8910534
	.xword	0x3576927a39b82e02
	.xword	0x5ef5a09b3d6df731
	.xword	0x364a310ea4150e7d
	.xword	0x7db64b17a239f43b
	.xword	0xb6ac1f10e9ff1554
	.xword	0xb81ed5628964b179
	.xword	0xa7dfc6a9818c1501
	.xword	0x288da5ce55bc2f7a
	.xword	0x632a0da3504b7fed
	.xword	0x71d724d765e0ec3c
	.xword	0x9045dda30700de0c
	.xword	0x664e7fd7687dd27f
	.xword	0x605ec18bd3bae74f
	.xword	0x6fb559b8b2a570ef
	.xword	0x50206176251c2c7e
	.xword	0xd39bc881eae66ce9
	.xword	0x41db62365274ebb9
	.xword	0xa12f39fda98e8555
	.xword	0xa2ba39b02b10d5da
	.xword	0xcb16ebcf9a32c3b5
	.xword	0xafbf92c0c116a561
	.xword	0x158629fd785300f0
	.xword	0x0214c63e6f957435
	.xword	0x26865112ab30ea58
	.xword	0xa1c56641758e6e24
	.xword	0x81963bd857c875ce
	.xword	0x9e6335b60bf665ab
	.xword	0x9c7ea7e4035ee2f5
	.xword	0x8a475a7ba761a0a5
	.xword	0xa2e6d6360aa981c5
	.xword	0x77ee9673a68cf9ff
	.xword	0x9f4565c3230678c9
	.xword	0xc17aa1c712b6e50b
	.xword	0x6e1f6129b6a5e267
	.xword	0x8e8967dd2cf4c380
	.xword	0x49bf296dd392dc42
	.xword	0xc4a9bbfab368a8c5
	.xword	0x699b84fedba4ef31
	.xword	0x96b7a3d9d6448f6f
	.xword	0x41f0825b11c6bb55
	.xword	0xace166290d30054c
	.xword	0xdf99ad6b38a6f16c
	.xword	0xdb99b742f3544e52
	.xword	0x8517d13e714e1fb3
	.xword	0xf63b0304422358b8
	.xword	0xd33029a9a686117c
	.xword	0x1ea5079f7969e060
	.xword	0x94d40b4793ce05b2
	.xword	0x0c3e773ff0c0cc3e
	.xword	0x6f021f61a0de7e31
	.xword	0xfcac9c2de363f850
	.xword	0x7b55ca5aa307f8c9
	.xword	0x571b3dac39d04613
	.xword	0x8752c109557bd8a5
	.xword	0x1a57f19a45825136
	.xword	0x6583cb773488b258
	.xword	0xa58c82067dc17fcc
	.xword	0x06789a14f4c72a7e
	.xword	0xacb77a7c9c52724a
	.xword	0x351de025fb8ca6bb
	.xword	0x42fd323e8bd3476e
	.xword	0x2ddf0f689d1fd9ba
	.xword	0x91c580279f1597f0
	.xword	0x272435ea3975a418
	.xword	0x43737136a0cc2db3
	.xword	0x5db55740acc65d95
	.xword	0x08bcb3865e5b7662
	.xword	0x2967b8e8fca04a78
	.xword	0x45d33130bb04239f
	.xword	0x13ddc1089d5b75db
	.xword	0x6ab8770cf36d86d2
	.xword	0xfd616971a891e48c
	.xword	0x3f9609864645cc8f
	.xword	0x0b406f2413d25c3e
	.xword	0xe6f80a7e1ad07675
	.xword	0x8bbb0ca1d9f9c905
	.xword	0x84af6f37589fdf38
	.xword	0xdc4eb4edccd9eafa
	.xword	0x2045cdc5034dba75
	.xword	0x3a9b4aeaa6cd0e38
	.xword	0xe69cef14adef3317
	.xword	0x31fa13ac664259a6
	.xword	0xca0139f151713d53
	.xword	0x384dd44bd982f6ea
	.xword	0xbe372322f66e3e4a
	.xword	0x336105f5c0f8cc3c
	.xword	0x9af53ae2ba40b3cf
	.xword	0x467601d2f3b2359c
	.xword	0xa0cace42be9b1984
	.xword	0x1900433708c6c702
	.xword	0x768e53c3c308423c
	.xword	0xda53564ab1c0d358
	.xword	0x4fe83d71ce39a8cc
	.xword	0xa73c66cbff70c963
	.xword	0x3f7945bdefe60ad7
	.xword	0x33c9cc94b9a37189
	.xword	0x71537d4c21d8757c
	.xword	0x3566e81efa867564
	.xword	0xa8aa5a04508e745b
	.xword	0x6c7b2e9353c16bb3
	.xword	0x6a87236963ce3f67
	.xword	0x6a703d04f2666d6a
	.xword	0x0b21560f6841a13c
	.xword	0xbd051b0176abc5a8
	.xword	0x903df4e09fe0babb
	.xword	0x4217e916f2124130
	.xword	0x37902109d2842616
	.xword	0x8f6de60659dec682
	.xword	0xf28980a7e7b4b0b5
	.xword	0xbdbe846a993668f0
	.xword	0x9cfc4411120a80dd
	.xword	0xb725b3e69f406f6c
	.xword	0x5dd87fc9ed58ac6e
	.xword	0x2e79064d7ef9ce36
	.xword	0xeb63e05352fcc3e9
	.xword	0xd015b54d15e1b4f9
	.xword	0x53415d3d92063924
	.xword	0x8db3b4ee300b0fd6
	.xword	0x728d313633fa75ba
	.xword	0x41d2a02c55e1acad
	.xword	0x645ed2fc443918e6
	.xword	0xb1109f6fa2945188
	.xword	0x026c0306effd1b33
	.xword	0xb8e742b9071348cb
	.xword	0x62fb1e7b886828b8
	.xword	0xac6e52629be0313e
	.xword	0x5f17cc9de52d0063
	.xword	0x3dc9f07ef9053555
	.xword	0xfc5029aa7ed60125
	.xword	0xde97b9c58d53e461
	.xword	0x150671929368e791
	.xword	0x7554f2822b8492a6
	.xword	0xd52be202ee292057
	.xword	0x5f1e8e42e156ec70
	.xword	0xa27c1e641923df86
	.xword	0x4ff26700fe7cf95a
	.xword	0x0d8705bdaf1930ce
	.xword	0xea1ed2d75db96769
	.xword	0xf01570a5e00a7a4f
	.xword	0xce78d093195f397e
	.xword	0xc8bebeb1fe163e5f
	.xword	0xd5f9fa72910ca734
	.xword	0x4836f73d6b7ea4f7
	.xword	0x6deabebd16ddb51d
	.xword	0x63a830f817f8bc48
	.xword	0x78f3412348317004
	.xword	0x40011183b8fa5b30
	.xword	0x61b96ca3b9a0e768
	.xword	0x4a5abe23fe73d728
	.xword	0x798a98d99799e5cc
	.xword	0x9007b3df66610fd8
	.xword	0x121c1c8f50dfe820
	.xword	0xd7dec4086ae6aa98
	.xword	0x003d55373e7a5876
	.xword	0xa4f63560c1e241e1
	.xword	0xf01b59bd8e2c69f4
	.xword	0x3ba42031684346a2
	.xword	0xe8e284f85704d9b4
	.xword	0x71048421356d3fb3
	.xword	0x4a1770409609103f
	.xword	0xe7cf4692749368a6
	.xword	0x2fc3fd4026a9beb3
	.xword	0xb16e13d340a91b37
	.xword	0x5687c4ea041f89ac
	.xword	0x9995448190a95887
	.xword	0xe46388fb91012827
	.xword	0x641392874093c4b3
	.align 0x40000
	.data
data_start_6:

	.xword	0xd6b6865cd27be4ac
	.xword	0xe99974a1b99eccff
	.xword	0x340068c6ded730f4
	.xword	0x6712adae395cd59f
	.xword	0x467eda3a580c2399
	.xword	0x1a8c4760156eacca
	.xword	0x3cb97ac126137f69
	.xword	0x775c9ea3adca273e
	.xword	0xf2508ef0138a4470
	.xword	0x1406b59bf0b2819a
	.xword	0x2e3aff3c828dd07d
	.xword	0xaa60231b3a7444d3
	.xword	0x37b223a0d755b65a
	.xword	0x7452cbdf53ae4351
	.xword	0x765ec831d1586c7b
	.xword	0x1680136949c8e05a
	.xword	0x0cbf3a45b9c0bf83
	.xword	0x9e320f7c8a007823
	.xword	0x3d918b55bbb646a5
	.xword	0x39d242b072c82ca0
	.xword	0xfaccece62438d69a
	.xword	0xc87b6216c8db3e19
	.xword	0x7923dffc1358fd1d
	.xword	0x037b2bdc4f79ac1c
	.xword	0x01d78c5fa25cd00d
	.xword	0x7c251c8764efcaff
	.xword	0x5d3f9675bc579cbb
	.xword	0x17134811d2bfe73a
	.xword	0xbf1d88c327af0658
	.xword	0x8a15f134aa047d59
	.xword	0x44044b024b85b4da
	.xword	0x836e1c74d9e13e88
	.xword	0x5b278d7c8709a97d
	.xword	0x9b2d67d50dc7b949
	.xword	0x08aac276ef503aa3
	.xword	0xd24693e627d86c22
	.xword	0x7d7b012ea91dbca1
	.xword	0xdc4c5733f46dee73
	.xword	0xd5869aaee7f79308
	.xword	0x095d9c3f8511fd14
	.xword	0x38703e62b25ad288
	.xword	0x66f8e3ebcbb6b0e6
	.xword	0xd0055746fb5e5d64
	.xword	0xccb7ec650cdadf81
	.xword	0xe0b740d16b4d80d5
	.xword	0xe2ef6cbaa22e9594
	.xword	0x3366dc3055bcd867
	.xword	0xbd5e34460bc38e39
	.xword	0x2918771a0dbb363e
	.xword	0xa1cf756c9c893ba1
	.xword	0x1f88ba3b6ffde34a
	.xword	0x209def3f466c691a
	.xword	0x4e544e9d8d05bbd4
	.xword	0xd24922322739340c
	.xword	0xefda83e959658cf7
	.xword	0x4e031838e44737e8
	.xword	0xc7bacb6f1653745b
	.xword	0xce07ddfddd54c882
	.xword	0xd53fe2dec9e9a39d
	.xword	0x83ae4ab49b4dfee5
	.xword	0x5470f0c5595a0f37
	.xword	0xcbc57c877222e8a4
	.xword	0xd01a4b26bf87e29a
	.xword	0xc286ade2072c556c
	.xword	0x1899c80a8bff01bb
	.xword	0x10ce9b90448aac32
	.xword	0x26fc6ae61c862b65
	.xword	0x0b8086cbb0adb676
	.xword	0xa50cdcd0eeb6be05
	.xword	0xdd99939b04c20dec
	.xword	0xcfa94079fb4abcf2
	.xword	0x05c544407a003932
	.xword	0xa55c5d9582db1484
	.xword	0xe2859c9a74fdb11e
	.xword	0x06aa06e6baf464a5
	.xword	0x4e0023ce46e85d95
	.xword	0x3fcc0607ce6d024a
	.xword	0x4ee683f98cc6f6b5
	.xword	0xa6fa0efdbe513478
	.xword	0xae2e71d8195af93e
	.xword	0x353324fa59feeda6
	.xword	0xacfaf9246724358f
	.xword	0xcab95e489e494f6b
	.xword	0x3faecc94cea7648e
	.xword	0x7da753a3485bf7d1
	.xword	0x3f61decfff3c414d
	.xword	0x2d0443efd16626e0
	.xword	0xaf22e929b53273d8
	.xword	0x7eea982cd655a071
	.xword	0xb74a0e6fbad59709
	.xword	0xde499af1362e2d8e
	.xword	0xe39b46a9f6279011
	.xword	0x4724cd492bc2c2ec
	.xword	0x7461ee4f1da6487f
	.xword	0xfda8b9d10f3e8923
	.xword	0x53e9484965e7378c
	.xword	0xd9a6ec55dc47a79d
	.xword	0x558346ba8915cc66
	.xword	0x76beda9aa43f380d
	.xword	0x030980b0825d4bd4
	.xword	0xfe3192532da55dfe
	.xword	0x086a37acd77fe2de
	.xword	0x981c2bb757b0e4f3
	.xword	0x96ce4d406a340862
	.xword	0x4927da2eb4d318b3
	.xword	0x82d3366c5f317903
	.xword	0xf8a5019c8d0c8000
	.xword	0x9cc63b5f25d7e9cb
	.xword	0x4cebb1365e0c5767
	.xword	0x85d55aeb740dce60
	.xword	0x8b21327c7ccebb53
	.xword	0x56504a1ef2e83156
	.xword	0xb1e8b4e8927121e0
	.xword	0xa4059f684e938beb
	.xword	0x42700263bce332f1
	.xword	0xce3924d3d918bd57
	.xword	0x35dceb1d455b6d0a
	.xword	0x8e2228b218912d20
	.xword	0x7d149cb04d53bf11
	.xword	0x5e7f2b72a5842f86
	.xword	0xea7c7ff142bbd2cf
	.xword	0xdfd155a3b2649671
	.xword	0xe3c6bc13971622b8
	.xword	0x8ba0fd607f256276
	.xword	0xf3e8e1107072fe0e
	.xword	0x3ae6533361daad02
	.xword	0xa7e9e5c3bd5fc593
	.xword	0xf3af73e6ca54e8ca
	.xword	0x88b8b5c2d5a9d488
	.xword	0xaeb3ffa1db5bcf4f
	.xword	0x159ba1475c1a20b2
	.xword	0xfb725c7eab64ca8a
	.xword	0x3c79131701e97183
	.xword	0xdd1d72e20c2c3415
	.xword	0x6690a6d4a9a92ccd
	.xword	0x47c477eccde9da26
	.xword	0x3d13b7821347e6cc
	.xword	0xf638c28957d50cb5
	.xword	0x16082958d55a90a3
	.xword	0xa451374f7dbae185
	.xword	0xcf54ecec3fb298d0
	.xword	0xf4c0f3620ad7f123
	.xword	0x9c57cbeb5eb423ae
	.xword	0xdcb0d3bb716eb9d4
	.xword	0xedaf314238e92335
	.xword	0x9e82545fe0c3b81e
	.xword	0xe37287a2d600d5c1
	.xword	0x53ab600bcf14e66a
	.xword	0x924c11721d6b83cd
	.xword	0xa07b46a103daf5f4
	.xword	0xd08a4a2a99af195e
	.xword	0x7266b8bed50b2fcb
	.xword	0x08c85f89b4cd79f2
	.xword	0x35d4665abb36d850
	.xword	0x38cd20292c51e639
	.xword	0x73e29581b1cfc792
	.xword	0x0d580fdc6c2c624c
	.xword	0x3c19e9201cee017f
	.xword	0x22de98de7d657ff5
	.xword	0x87aceff209c6f5bc
	.xword	0x66176a22827f544c
	.xword	0x548b9283c4492965
	.xword	0xac7bd45ff9a2c3d5
	.xword	0x857053e710396eae
	.xword	0xe9ee2c541c6ae3fc
	.xword	0xf4c43e881eeb88f0
	.xword	0x5dbdb0ae21448a52
	.xword	0x45e838d4c5cbdc20
	.xword	0x734808a52aed7dc1
	.xword	0x799e6a7c46e5a32f
	.xword	0x889e3ed67bec8c5b
	.xword	0x56a3e1fad3991a26
	.xword	0xecf3cc25b57be6f1
	.xword	0x7cbecfdf37a1031f
	.xword	0xb53adcf7b21d0713
	.xword	0xc6e755ca511d9c25
	.xword	0x073845acb579daa9
	.xword	0x5cd5d3563bfaed16
	.xword	0xdccae2247322857e
	.xword	0x0a57dad2bb351071
	.xword	0x2dd9e75d79d4c437
	.xword	0x8136f67bdfa9169a
	.xword	0x5cc5c4f1f30adfb5
	.xword	0x82e6ee8fdcf55200
	.xword	0x2eae670728d305e1
	.xword	0x845d72490d0ac631
	.xword	0x631ba6e3b127e132
	.xword	0x6daf5e1a712adbac
	.xword	0xbf9273836feaf7ef
	.xword	0x785a3e518cdc873f
	.xword	0xf21badcfb18b19ab
	.xword	0x7b5efaeb0656bcf5
	.xword	0x4e1fa30a5e058f43
	.xword	0x8e504669d7d38c01
	.xword	0xa61019062dc46ea0
	.xword	0x7178008c72c9dadf
	.xword	0xeaae0c0a7daf21fb
	.xword	0x918cb1caa95503bf
	.xword	0xe5836561dfd72502
	.xword	0x3cebaa109ca438b1
	.xword	0x95f88dfc9eff9347
	.xword	0x2d39ed2f1a2f9ab8
	.xword	0x406a307aabc1355a
	.xword	0xdd4a4eb876e61f8b
	.xword	0x72971ce3cfdf4e8e
	.xword	0x9e86fb2299fe99bf
	.xword	0x981f28cbd8764226
	.xword	0x530d21bfb47a7f30
	.xword	0x562c77b709ad3171
	.xword	0x75ba1f547e774248
	.xword	0xa022bfb3a0b3b09c
	.xword	0x2ae7be485fc91722
	.xword	0x4cb61fe5ebcf9185
	.xword	0x1893f97da54a8a8d
	.xword	0x170113ea6607a947
	.xword	0x42e98316e3557470
	.xword	0x19726ed27f6e71b9
	.xword	0x234844c2d37af4e5
	.xword	0x6665d67c1cb714ba
	.xword	0xcac910ba5d9edd72
	.xword	0xb43b87a4dc3a4416
	.xword	0x9a8824fb296c40fa
	.xword	0x1ae27ab47dd66a6a
	.xword	0xb69de89d9e3fcc26
	.xword	0x249046ab9514bf56
	.xword	0x6d41c6206d76b7ab
	.xword	0xd57c4d325f5c542e
	.xword	0x3d67af6413e7933e
	.xword	0x1bc665f17932c9ab
	.xword	0x403ef610575337f4
	.xword	0xabc44f9c247eb58e
	.xword	0x37fc691b899ac8af
	.xword	0x52944dc7be10de58
	.xword	0xa384528bd7b93e34
	.xword	0xa6bd872120529d37
	.xword	0x114fb554636d9cc1
	.xword	0xa3c3bcc3c38ef669
	.xword	0xce91fab4fe3de3f1
	.xword	0xe6300143dfb4bbfc
	.xword	0x1aeade7f61f79727
	.xword	0xe0d6841b28fbe83c
	.xword	0xcd7cb7b1a76da678
	.xword	0x5b657c26330666da
	.xword	0x3df337bd6b7a00f8
	.xword	0x35e5f1725eb1ebc2
	.xword	0x8aa557c6ed41292c
	.xword	0xa407fab71de454a4
	.xword	0x13563bf477851378
	.xword	0x015856020429fefb
	.xword	0x8d6f036fa4d6bc81
	.xword	0x4eae6236cbcdc91f
	.xword	0x2c3d144945d9f2d5
	.xword	0x368ac4612f26b3b8
	.xword	0xa24a24e15744988c
	.xword	0xba6832a38eb5d671
	.xword	0x4a405aa627b50523
	.align 0x80000
	.data
data_start_7:

	.xword	0x2f500a4f753679a7
	.xword	0xc6ec5a506b88dcc5
	.xword	0x20aef6538bc7d316
	.xword	0x6b3b1ce557b3a36d
	.xword	0x659b2b8e015be6cb
	.xword	0x7ee2658345938a1d
	.xword	0x0353ee7762998573
	.xword	0xc023b0e8154563fd
	.xword	0xa041ae68066012c4
	.xword	0x020042d60e66d4cc
	.xword	0x569bb7b9cc09fe87
	.xword	0x105e8615f62fd47a
	.xword	0x5b9ad5a8f27fcaa0
	.xword	0x88b5011cb1986b6e
	.xword	0x3ba8aa159c829f5c
	.xword	0xa7e19c1bc00f4fef
	.xword	0x6aee3feb00365fd2
	.xword	0x966d44f8f79797ec
	.xword	0x21e11fe63501c8f5
	.xword	0x0691b87bc6127347
	.xword	0xf98cfb5b7b5c157c
	.xword	0xd677e2bffb6caaec
	.xword	0x3331188c3533e1aa
	.xword	0x0c4392b5350d3a86
	.xword	0x5b49516dd1a40523
	.xword	0x7ac05dc238319f13
	.xword	0x7240e520d18b7e0f
	.xword	0xa8c8da3ba72a9699
	.xword	0xc569d79f1d2bb593
	.xword	0x6170bad7d0c4dc77
	.xword	0xac10c330d7514df0
	.xword	0x6cb21b77172f2e8a
	.xword	0x42bac1574b012812
	.xword	0x2119e77b78f04b0f
	.xword	0x811f1e0d5363ad83
	.xword	0x58ea902a6388e3d2
	.xword	0x7faefd00710955a1
	.xword	0x8e17f50ab8ab1df6
	.xword	0x9907341bb878dbd0
	.xword	0xf78b6b54a5f4557d
	.xword	0xda967709f538c7a6
	.xword	0xc96dbc8dd000108d
	.xword	0x50f8461c8fd76381
	.xword	0xb6e0f056d3f06eb7
	.xword	0x7385db491fa2aa42
	.xword	0xadd9408891c2767d
	.xword	0x23fd1c1c55925b1a
	.xword	0x84ba7c4d2b0cd8e6
	.xword	0x89ef724eb8633c92
	.xword	0x0f12f0e33fc3b122
	.xword	0xfcc974c0791f972f
	.xword	0xe64fd6b9161e3c2a
	.xword	0xffeb2b26f5683f3c
	.xword	0x963c1e23d47b5435
	.xword	0xc3b48a8e2fbcfd0a
	.xword	0x36ab0fd4433bd7fe
	.xword	0xa22b4e8a853c2ca2
	.xword	0xbcc2e621f991dcc3
	.xword	0x1cac0cab63037b8d
	.xword	0x315cf4e377b366c3
	.xword	0x74263f46dc3f4ea8
	.xword	0x9bd9eb37d50fcc11
	.xword	0x39f6e565be4e8d3f
	.xword	0x048e3d21e849d8e0
	.xword	0x8fe83d65e1f43dfe
	.xword	0xce6589de84ca8e4e
	.xword	0xe114a85f57fa5373
	.xword	0xcdadd20e374085fc
	.xword	0x4a8d385cd775548d
	.xword	0xa309b8749891a58c
	.xword	0x3334e436dfe802ef
	.xword	0x9263dffff4ed1ef8
	.xword	0xa2a3bfe1e5b3ff81
	.xword	0x69ee05c5902ecb41
	.xword	0xb741cb4681f09865
	.xword	0xa42b2c069fb7dd7e
	.xword	0xc31a1e46987b17d2
	.xword	0x0c885ca80c56fa37
	.xword	0xe9cd4b0af4589192
	.xword	0x9071ea5cd51c6ba5
	.xword	0x0885ec440bf0c696
	.xword	0x282e71e3f93882d4
	.xword	0x34d0110b3aea05f9
	.xword	0xb9ca3e7880156850
	.xword	0x4691785433b20caa
	.xword	0x9630d9bbacb09e06
	.xword	0xea67407ff6be1279
	.xword	0xedf2b5e1e774ad07
	.xword	0x2e3cadbcf3ef187b
	.xword	0x88210dcf3bd9be2d
	.xword	0xfc0b2baeafa3b4a3
	.xword	0xec65b2a0bcdbac66
	.xword	0x298e5a6d44e90262
	.xword	0x972fce89f2d8cc66
	.xword	0xa6475ee3fe7ed25b
	.xword	0x0817170e50f11071
	.xword	0x3eb71bfdd5520df5
	.xword	0xeb1be55a55ec2821
	.xword	0xa40b9d8dcf37af2f
	.xword	0x3f2b1349b543df83
	.xword	0xdcd3443d9de73c46
	.xword	0xb8730eca6dbb1160
	.xword	0x0fd72572d359dd6a
	.xword	0xb1a2909d2f294d46
	.xword	0xf057556fc4b5c038
	.xword	0xd0784c901f5e499b
	.xword	0xbfd4708a16f9943c
	.xword	0x9b76fae0b0cecb0b
	.xword	0x157ae1bee4cbfacc
	.xword	0xe2afd462272ec3da
	.xword	0xb65ad50cd9eb07e7
	.xword	0xe3ee378cab962828
	.xword	0x586cdddfa7bb5517
	.xword	0xef895d98bc7a674c
	.xword	0x7ac03573db7be288
	.xword	0x0d282c57e7ba4589
	.xword	0xed68795070166ae2
	.xword	0x4b3aeb57125eb969
	.xword	0x17c33481285623f6
	.xword	0x6e78e7715126241c
	.xword	0xbcd68d7a64feeb44
	.xword	0x30a028cb06bf0b15
	.xword	0xdba6783320dbc052
	.xword	0x33d036a51b79403b
	.xword	0xe91e53030918c288
	.xword	0x68bff109400e1b29
	.xword	0x54c6b7149d91cbad
	.xword	0x046a4b9513b5210c
	.xword	0x333df2192bcf5810
	.xword	0x7fc5cf9c83bb4683
	.xword	0xbb0ef6696ff12494
	.xword	0xfeb73d8ddc5afca1
	.xword	0x391aa34480483937
	.xword	0xe9d42f0dd19aabce
	.xword	0x4a1f7b6f4631f843
	.xword	0x0c7feb6287d3ba82
	.xword	0x0958ccd3d9edbb39
	.xword	0x2a53cba76c5a049b
	.xword	0xc8bbcdb6faf44cf9
	.xword	0xe85978a3dd80d387
	.xword	0x6e22434c57596413
	.xword	0x201549990cab62ec
	.xword	0xce719d52428c770c
	.xword	0x8e600c4a55cccaad
	.xword	0xe25dd12e209ce4c8
	.xword	0xff62aa6dd02a415a
	.xword	0xb8aee482c0e4fe9e
	.xword	0x7dd23a0044f5c906
	.xword	0x6b189d32052320a7
	.xword	0x00b80ab2d359e439
	.xword	0xeff4e40aa4fafec6
	.xword	0x12ead9dfd4d3bb35
	.xword	0xba217604c40fb974
	.xword	0x99a6918f79c875c9
	.xword	0x26a91675f1c7272f
	.xword	0x6b4472c94690ebdb
	.xword	0x73a8a150b0e38aa8
	.xword	0xc53b9cc1ef68e943
	.xword	0xfb3b51ee713d0a58
	.xword	0x7ab2d765c45955e0
	.xword	0xc881151b76e754ab
	.xword	0x9581a5477b4c08f8
	.xword	0xf6e62a0c28d1df83
	.xword	0x7afdb08494f7aa38
	.xword	0x730d90e789cee7af
	.xword	0x10a8d8c8f7601372
	.xword	0x021aabed63d9f04d
	.xword	0x8e56d3d8bd123585
	.xword	0x6225014adccde5b7
	.xword	0xf663430c135d17dc
	.xword	0x26f2b85f602a1a4d
	.xword	0x67c109708a7d4e8d
	.xword	0xd13f76bf58307c3e
	.xword	0x0b4d1d232f64f16f
	.xword	0xac501ad1e05ae2f3
	.xword	0xb2145c85900a60f5
	.xword	0x28ac087b84bb6bb2
	.xword	0xbcf84ba83ab9d27f
	.xword	0x045f88b362a7bf96
	.xword	0xd5b4fec1ba55988a
	.xword	0x6cec0a6584b69f6f
	.xword	0x8edcd688237ca956
	.xword	0x034ca037ba04f088
	.xword	0x2ccef3e371319785
	.xword	0x1d8e55fc887b727d
	.xword	0xc24b3ad452731f87
	.xword	0x1c7461e61ae37c25
	.xword	0xb9f4c384a054ec68
	.xword	0x96993a79b3f00654
	.xword	0x45555e17dad04c6a
	.xword	0xa14bcd73e693c9ff
	.xword	0xd497780b6297ba06
	.xword	0xe4e96db36b9b3b81
	.xword	0x3ca6a6b08af910b2
	.xword	0xaf10341b57694b18
	.xword	0x257435e7e4e318bc
	.xword	0x25a28bfce3b96344
	.xword	0xe174aac236eefa9f
	.xword	0x6f952b1b7508465f
	.xword	0xded2d8e599ccce4c
	.xword	0xd4a067bdc676f6ab
	.xword	0xc5d6dab623d5ba5e
	.xword	0xf0f9dc3296a55181
	.xword	0xad8a3f93878472ff
	.xword	0x42a3640cc7d3ce62
	.xword	0x7d4b735a1d46d891
	.xword	0xd540f9d52842ffc0
	.xword	0xbf514542a915ec42
	.xword	0x275852136bfc6d0a
	.xword	0x07131d4606bbbc3e
	.xword	0xdce0073f42e2ab8e
	.xword	0xbb592813290abe04
	.xword	0x1cb1b693dacc9828
	.xword	0x8aef494e2583b454
	.xword	0x77075fb134c99cd4
	.xword	0x19c8f5afcbe482bd
	.xword	0x52ef25137dbf24b1
	.xword	0x6adb6615c8f2dfd5
	.xword	0x9c13c542e3617b74
	.xword	0xfc2343dce1007151
	.xword	0x328baf4cd3fe5924
	.xword	0xb5c4f69d07f8654a
	.xword	0x5d8452a1bd3925cc
	.xword	0x4e0c01f29457fc4a
	.xword	0xcce662371f281e98
	.xword	0xf9757fd49df68495
	.xword	0x71a729e68f55774e
	.xword	0xc7b45ccb6a81f6ce
	.xword	0x103a5b6c9ed03510
	.xword	0xe5b8d82f1b310c8c
	.xword	0xd1cfdf2eca5b6ea1
	.xword	0x6cfe88a3735d6ad1
	.xword	0xa9d825d44e792b4f
	.xword	0x357df918836b202e
	.xword	0xb409c8789d873115
	.xword	0xeec0760d5877f108
	.xword	0x755274304a3d50a7
	.xword	0x91c076113d36c8c9
	.xword	0xfedc5796f43899d1
	.xword	0x5bd093c3e8d4f0e1
	.xword	0x70f1500d51967a1c
	.xword	0x113f3bca7815a8ee
	.xword	0x228b4afcbdd28249
	.xword	0xc815f4045946c317
	.xword	0x84c2b6ee5b867376
	.xword	0x6f38fb7f40bb5dc4
	.xword	0x1e6d20965201bcac
	.xword	0x26be8f06aa39e9d9
	.xword	0x80168ac391fd71df
	.xword	0x9d52182d3f781f37
	.xword	0x461d2082049b2031
	.xword	0xee84bb5f0e6b2cee
	.xword	0x0342692dc929be15
	.xword	0x30a9e668d1084006
	.xword	0xc7fa6449ff922804
	.xword	0x57880c76fa99677e



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
