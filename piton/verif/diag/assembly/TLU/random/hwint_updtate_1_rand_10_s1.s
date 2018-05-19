// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_10_s1.s
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
   random seed:	546797372
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

	setx 0x659d5d645db1dd0d, %g1, %g0
	setx 0xf38fb786ebda7953, %g1, %g1
	setx 0x7f64abd4ae0683c9, %g1, %g2
	setx 0xc2b7c9f3ce563cc2, %g1, %g3
	setx 0x1f27664f5212cdbb, %g1, %g4
	setx 0xfb2eb1440a9ab1ca, %g1, %g5
	setx 0x63d06d386701e4f9, %g1, %g6
	setx 0xf25294b4f9e64688, %g1, %g7
	setx 0x8c52871c568a936e, %g1, %r16
	setx 0x646a519321900855, %g1, %r17
	setx 0x59216cbe1571b56e, %g1, %r18
	setx 0xa55aad29d4e36e45, %g1, %r19
	setx 0x1c8fd26703219a8b, %g1, %r20
	setx 0x30cf87f28ed46ea5, %g1, %r21
	setx 0x71c8b856edddd488, %g1, %r22
	setx 0xd26d5db3f9bde5c1, %g1, %r23
	setx 0x0eaefef59e5c7e94, %g1, %r24
	setx 0x0eba6d885f9e1243, %g1, %r25
	setx 0xf212f62277b2078e, %g1, %r26
	setx 0x60287347fd0484e4, %g1, %r27
	setx 0x1342f9421d7b3177, %g1, %r28
	setx 0x8135fc097f5a6bb2, %g1, %r29
	setx 0xa3e894dff11e8084, %g1, %r30
	setx 0xbf87d1c52fce7e2f, %g1, %r31
	save
	setx 0xa978762a78020bd3, %g1, %r16
	setx 0x440c5bcd2f7309e8, %g1, %r17
	setx 0x7dc5c04cdd340629, %g1, %r18
	setx 0x338091fe7bc175cc, %g1, %r19
	setx 0x4b3e7a5bf93f1841, %g1, %r20
	setx 0x37f05ad0c24e1f4e, %g1, %r21
	setx 0x0377bc201b530543, %g1, %r22
	setx 0x2578950f7f4d742a, %g1, %r23
	setx 0xec0c7b2e8bdc4b65, %g1, %r24
	setx 0x1d5923318bc52f5a, %g1, %r25
	setx 0x6324b3376704e5f5, %g1, %r26
	setx 0x8a3ee35de7634664, %g1, %r27
	setx 0x4501da3361ce39e4, %g1, %r28
	setx 0xf9987bfd77796f6b, %g1, %r29
	setx 0x3900ee107be7bb13, %g1, %r30
	setx 0xeeff18153097fb7b, %g1, %r31
	save
	setx 0xb99a7ca833be356d, %g1, %r16
	setx 0x30fc2d4a0ddbefb0, %g1, %r17
	setx 0xf129ebf602ae7b60, %g1, %r18
	setx 0x7f2f00b31ca4a6b6, %g1, %r19
	setx 0xe45e2f05593e3e49, %g1, %r20
	setx 0x5d9fba6db60c4f1c, %g1, %r21
	setx 0x15493761e0399801, %g1, %r22
	setx 0xabbadbe2e0643190, %g1, %r23
	setx 0x4ecf96ed9e861261, %g1, %r24
	setx 0x79d2e11885b6554c, %g1, %r25
	setx 0xa1605d6675a1cc58, %g1, %r26
	setx 0x3db217d7c4baf2ae, %g1, %r27
	setx 0xcfad2ea22e892f00, %g1, %r28
	setx 0x183eb90a1f2cc4f1, %g1, %r29
	setx 0x9688ccaf1db0eef7, %g1, %r30
	setx 0x0fc2643904da08d2, %g1, %r31
	save
	setx 0xdb7c7d0f273ecb2f, %g1, %r16
	setx 0x21144e49fb351851, %g1, %r17
	setx 0x022dfc3141f4fab8, %g1, %r18
	setx 0x674a7913f491b6ec, %g1, %r19
	setx 0xaf9d6e0971c77423, %g1, %r20
	setx 0x8ece57fc157be5bb, %g1, %r21
	setx 0xa7d560fb927462bc, %g1, %r22
	setx 0x3c38a923612ab3be, %g1, %r23
	setx 0x2c25244912ee1e50, %g1, %r24
	setx 0x768de4423c0b3693, %g1, %r25
	setx 0xf45d3662b4a3ead1, %g1, %r26
	setx 0x8a31f410f9c612f4, %g1, %r27
	setx 0xfceb2115d13b2ad5, %g1, %r28
	setx 0x48daac92cec1ebfe, %g1, %r29
	setx 0xa3f2318055216aeb, %g1, %r30
	setx 0x18bd22bdb93704a5, %g1, %r31
	save
	setx 0xaae7a5e5b2b1c180, %g1, %r16
	setx 0x3353a9a51fe1ca23, %g1, %r17
	setx 0x8b7fffda130901e8, %g1, %r18
	setx 0x0c24ea00fac6c843, %g1, %r19
	setx 0x4f347bb56882223f, %g1, %r20
	setx 0xa09fd1b8a350d259, %g1, %r21
	setx 0x5b22fbb8c11c9bf2, %g1, %r22
	setx 0xba3d41fce8f5ba98, %g1, %r23
	setx 0x920dc608c8d2cac7, %g1, %r24
	setx 0x1909bcf412c011da, %g1, %r25
	setx 0x2794e018b56056fd, %g1, %r26
	setx 0x7746a70c298471bc, %g1, %r27
	setx 0x47d9919aac9d066e, %g1, %r28
	setx 0x2d3eed6a441102ab, %g1, %r29
	setx 0x04dfea3c9919dd86, %g1, %r30
	setx 0x128d4cffd3553954, %g1, %r31
	save
	setx 0x25e05766c47a2f62, %g1, %r16
	setx 0xe8a61feab2edcbda, %g1, %r17
	setx 0x97bf4164ad26f08e, %g1, %r18
	setx 0x5237546691792f88, %g1, %r19
	setx 0xe9c411ad8f418616, %g1, %r20
	setx 0x9f116bc092add74a, %g1, %r21
	setx 0x46c28702f1a9c060, %g1, %r22
	setx 0x86eae294f2c83ddf, %g1, %r23
	setx 0x7aebd5d349a91549, %g1, %r24
	setx 0x301348eea6b2bd5a, %g1, %r25
	setx 0x2cf8df2e858e2fe8, %g1, %r26
	setx 0xd10b3de01bd74b6a, %g1, %r27
	setx 0x582afa4bdf8aa3eb, %g1, %r28
	setx 0x7df6f551ceea3106, %g1, %r29
	setx 0xaa1242fd8e70c28c, %g1, %r30
	setx 0xab16bf06528fc081, %g1, %r31
	save
	setx 0xdb934c73e74b3ebc, %g1, %r16
	setx 0xadfe636690467675, %g1, %r17
	setx 0x6fdbdc9ea636960a, %g1, %r18
	setx 0xfa07a6efc1e5c3e9, %g1, %r19
	setx 0xd5f735492659715d, %g1, %r20
	setx 0x632f6640df23d662, %g1, %r21
	setx 0x21cbbd9ab3e3d983, %g1, %r22
	setx 0xe753ccad3654abd5, %g1, %r23
	setx 0x96005e0a597e8aea, %g1, %r24
	setx 0x0b86e0271d9b6571, %g1, %r25
	setx 0x5666cb64b568300e, %g1, %r26
	setx 0x60369f3bbf666a3f, %g1, %r27
	setx 0x1cd2bffae8fd3856, %g1, %r28
	setx 0xbbfa4ed88e6966d4, %g1, %r29
	setx 0xf734349431b36b31, %g1, %r30
	setx 0x7a9f93d303f3772c, %g1, %r31
	save
	setx 0xcd29622d06f5f739, %g1, %r16
	setx 0x810a244ff1b3780e, %g1, %r17
	setx 0xfd811c64c6d07b7a, %g1, %r18
	setx 0xd83aca5ecc781470, %g1, %r19
	setx 0x835567b6df653b9b, %g1, %r20
	setx 0xfccf7ccfebf417f4, %g1, %r21
	setx 0xe5fb2d9eb18556ff, %g1, %r22
	setx 0x26b5054b2bef4eaa, %g1, %r23
	setx 0xe316f08f6deff795, %g1, %r24
	setx 0x3afe88faa5fed1d4, %g1, %r25
	setx 0x8c0e63b884070f36, %g1, %r26
	setx 0xe030d8b0237babfc, %g1, %r27
	setx 0x1d9784a82f856622, %g1, %r28
	setx 0xe483699f6feba20c, %g1, %r29
	setx 0x2d288858243c8369, %g1, %r30
	setx 0x32371b923f63e4ff, %g1, %r31
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
	setx	0x190022, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_0:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 7: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e4e1d3  ! 10: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5c000  ! 17: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde5c000  ! 23: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb9e48000  ! 25: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_1:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 26: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3e44000  ! 27: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_0:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 31: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_1:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e44000  ! 34: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e48000  ! 40: SAVE_R	save	%r18, %r0, %r25
	.word 0xb03d0000  ! 42: XNOR_R	xnor 	%r20, %r0, %r24
T0_asi_reg_rd_2:
	mov	0x2b, %r14
	.word 0xf4db8400  ! 43: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_1:
	setx	0x1e0308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_3:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfe520c4  ! 56: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_4:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 57: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb1e4c000  ! 66: SAVE_R	save	%r19, %r0, %r24
	.word 0xbfe42033  ! 74: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e56121  ! 84: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_5:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 88: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_2:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 90: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e561e8  ! 95: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe58000  ! 97: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_3:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 99: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb2c4a1c7  ! 102: ADDCcc_I	addccc 	%r18, 0x01c7, %r25
	.word 0xb3e4c000  ! 105: SAVE_R	save	%r19, %r0, %r25
	.word 0xbbe52129  ! 108: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_2:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_6:
	mov	0x4, %r14
	.word 0xf0db8e80  ! 112: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbfe50000  ! 113: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_3:
	setx	0x1c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_4:
	mov	0x6, %r14
	.word 0xfaf389e0  ! 117: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xba948000  ! 122: ORcc_R	orcc 	%r18, %r0, %r29
T0_asi_reg_rd_7:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbde5c000  ! 127: SAVE_R	save	%r23, %r0, %r30
	.word 0xb5e44000  ! 132: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_8:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbcac0000  ! 135: ANDNcc_R	andncc 	%r16, %r0, %r30
cpu_intr_0_4:
	setx	0x1d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 138: SAVE_R	save	%r16, %r0, %r30
	.word 0xb0954000  ! 142: ORcc_R	orcc 	%r21, %r0, %r24
T0_asi_reg_wr_5:
	mov	0x4, %r14
	.word 0xf8f38e60  ! 143: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3e54000  ! 144: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e46199  ! 145: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb93c2001  ! 148: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb3e48000  ! 149: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_5:
	setx	0x1c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89ca086  ! 157: XORcc_I	xorcc 	%r18, 0x0086, %r28
	.word 0xbd7c8400  ! 158: MOVR_R	movre	%r18, %r0, %r30
	.word 0xb7e5203b  ! 159: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_6:
	setx	0x1c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb2b5a112  ! 165: ORNcc_I	orncc 	%r22, 0x0112, %r25
T0_asi_reg_wr_6:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 168: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3e5c000  ! 169: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_7:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 171: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_8:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 181: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5e4e071  ! 188: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 0)
	.word 0xb09561c2  ! 194: ORcc_I	orcc 	%r21, 0x01c2, %r24
	.word 0xbbe54000  ! 195: SAVE_R	save	%r21, %r0, %r29
	.word 0xbfe5201f  ! 196: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe5c000  ! 197: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_9:
	mov	0x1c, %r14
	.word 0xf8db8e80  ! 198: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, c)
	.word 0xb884c000  ! 200: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xb3e5602c  ! 203: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e44000  ! 205: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e5a119  ! 209: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_7:
	setx	0x1c0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1342001  ! 211: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xb9e5a16e  ! 212: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_8:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_9:
	setx	0x1c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a4a065  ! 215: SUBcc_I	subcc 	%r18, 0x0065, %r27
	.word 0xb7e4a065  ! 219: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_9:
	mov	0x5, %r14
	.word 0xf4f384a0  ! 221: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_10:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_10:
	setx	0x1d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 233: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 33)
	.word 0xb13cf001  ! 241: SRAX_I	srax	%r19, 0x0001, %r24
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, c)
	.word 0xbfe46128  ! 246: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_11:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1c5  ! 253: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_10:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 254: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe4c000  ! 259: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e44000  ! 263: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_12:
	setx	0x1d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 266: SAVE_R	save	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e50000  ! 270: SAVE_R	save	%r20, %r0, %r24
	.word 0xb3e40000  ! 272: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_11:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 275: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_13:
	setx	0x1e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_14:
	setx	0x1c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_15:
	setx	0x1f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_12:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 282: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_16:
	setx	0x1e002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42106  ! 286: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_11:
	mov	0x10, %r14
	.word 0xf4db89e0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0x83956035  ! 288: WRPR_TNPC_I	wrpr	%r21, 0x0035, %tnpc
	.word 0x8d94e120  ! 290: WRPR_PSTATE_I	wrpr	%r19, 0x0120, %pstate
	.word 0xb5e48000  ! 291: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_17:
	setx	0x1d0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 297: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe40000  ! 298: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe4c000  ! 300: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e58000  ! 306: SAVE_R	save	%r22, %r0, %r28
	.word 0xbde521cb  ! 309: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 21)
	.word 0xb7e54000  ! 317: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, a)
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 17)
	.word 0xb5e58000  ! 325: SAVE_R	save	%r22, %r0, %r26
	.word 0xb0c4a029  ! 326: ADDCcc_I	addccc 	%r18, 0x0029, %r24
T0_asi_reg_rd_12:
	mov	0x28, %r14
	.word 0xf8db89e0  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbfe560b4  ! 330: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_13:
	mov	0x36, %r14
	.word 0xf2f384a0  ! 333: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_14:
	mov	0x14, %r14
	.word 0xfef38e80  ! 334: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_13:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 338: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe50000  ! 339: SAVE_R	save	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, e)
	.word 0xbfe48000  ! 349: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_18:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521de  ! 354: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_19:
	setx	0x1e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_15:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 357: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_20:
	setx	0x1e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 362: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e40000  ! 363: SAVE_R	save	%r16, %r0, %r25
	.word 0xbc1dc000  ! 364: XOR_R	xor 	%r23, %r0, %r30
	.word 0xbbe521d8  ! 366: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_21:
	setx	0x1e013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_22:
	setx	0x1f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_16:
	mov	0x1b, %r14
	.word 0xf4f38e60  ! 375: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_14:
	mov	0x9, %r14
	.word 0xf6db8e80  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_rd_15:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_16:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_17:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbcad4000  ! 389: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0xbbe5209c  ! 391: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe54000  ! 393: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_17:
	mov	0x2f, %r14
	.word 0xf2f38e80  ! 395: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5e42177  ! 396: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_18:
	mov	0xe, %r14
	.word 0xfadb8e60  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb2b5e0ee  ! 400: ORNcc_I	orncc 	%r23, 0x00ee, %r25
cpu_intr_0_23:
	setx	0x1f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460f5  ! 402: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_18:
	mov	0x5, %r14
	.word 0xfaf38400  ! 408: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_24:
	setx	0x1e0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52c4000  ! 412: SLL_R	sll 	%r17, %r0, %r26
cpu_intr_0_25:
	setx	0x1f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42015  ! 414: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb8240000  ! 416: SUB_R	sub 	%r16, %r0, %r28
	.word 0xb3e58000  ! 418: SAVE_R	save	%r22, %r0, %r25
	.word 0x8d94614b  ! 419: WRPR_PSTATE_I	wrpr	%r17, 0x014b, %pstate
	.word 0xb1e4e1a7  ! 423: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_19:
	mov	0x13, %r14
	.word 0xfcf38400  ! 428: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_19:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e50000  ! 430: SAVE_R	save	%r20, %r0, %r27
	.word 0xb97d2401  ! 432: MOVR_I	movre	%r20, 0x1, %r28
	.word 0xbde54000  ! 433: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1355000  ! 440: SRLX_R	srlx	%r21, %r0, %r24
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_26:
	setx	0x200009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 452: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_20:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e4c000  ! 459: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_27:
	setx	0x220320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_28:
	setx	0x200003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520dc  ! 465: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_20:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 466: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_21:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 467: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbde4a18a  ! 468: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e4a0ac  ! 469: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_22:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_23:
	mov	0x19, %r14
	.word 0xf4db8e60  ! 474: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_29:
	setx	0x23031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 484: SAVE_R	save	%r17, %r0, %r27
	.word 0xb6c44000  ! 485: ADDCcc_R	addccc 	%r17, %r0, %r27
T0_asi_reg_rd_24:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 486: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde40000  ! 488: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_30:
	setx	0x21000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_31:
	setx	0x220036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bc61f9  ! 497: XNORcc_I	xnorcc 	%r17, 0x01f9, %r28
cpu_intr_0_32:
	setx	0x20002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_33:
	setx	0x220201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 512: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_34:
	setx	0x230027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_35:
	setx	0x220030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_36:
	setx	0x20032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e011  ! 525: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e54000  ! 527: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e40000  ! 528: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 35)
	.word 0xbe348000  ! 531: SUBC_R	orn 	%r18, %r0, %r31
T0_asi_reg_rd_25:
	mov	0x20, %r14
	.word 0xf2db8e80  ! 533: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 36)
	.word 0xb20d8000  ! 535: AND_R	and 	%r22, %r0, %r25
	.word 0xb7e4a08a  ! 536: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_37:
	setx	0x200113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb624c000  ! 539: SUB_R	sub 	%r19, %r0, %r27
	.word 0x8195a108  ! 540: WRPR_TPC_I	wrpr	%r22, 0x0108, %tpc
T0_asi_reg_rd_26:
	mov	0x34, %r14
	.word 0xfadb8e80  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 7)
	.word 0x9195207f  ! 547: WRPR_PIL_I	wrpr	%r20, 0x007f, %pil
	.word 0xb1e5a129  ! 548: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_38:
	setx	0x200014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520d4  ! 550: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_27:
	mov	0xb, %r14
	.word 0xf2db8400  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbde44000  ! 559: SAVE_R	save	%r17, %r0, %r30
	.word 0xb9e5a076  ! 560: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde520ab  ! 561: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe42071  ! 562: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_39:
	setx	0x230011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_40:
	setx	0x200028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde40000  ! 574: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_41:
	setx	0x230307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_42:
	setx	0x230013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec5e09c  ! 580: ADDCcc_I	addccc 	%r23, 0x009c, %r31
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, e)
	.word 0xb7e54000  ! 583: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_28:
	mov	0x1d, %r14
	.word 0xf2db8e60  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbf7dc400  ! 592: MOVR_R	movre	%r23, %r0, %r31
	.word 0xb2bd206f  ! 597: XNORcc_I	xnorcc 	%r20, 0x006f, %r25
cpu_intr_0_43:
	setx	0x220226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_21:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 599: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e42087  ! 601: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb02d8000  ! 603: ANDN_R	andn 	%r22, %r0, %r24
	.word 0xb3e460a2  ! 609: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe48000  ! 610: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e560fa  ! 611: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbeb4e1b7  ! 612: SUBCcc_I	orncc 	%r19, 0x01b7, %r31
T0_asi_reg_wr_22:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 621: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb00421cd  ! 622: ADD_I	add 	%r16, 0x01cd, %r24
	.word 0xb9e521c8  ! 624: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e40000  ! 627: SAVE_R	save	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_29:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfe56135  ! 638: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_23:
	mov	0x9, %r14
	.word 0xf0f389e0  ! 640: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_30:
	mov	0xc, %r14
	.word 0xf2db84a0  ! 641: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_44:
	setx	0x22020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_24:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 646: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfe5a0e9  ! 648: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_45:
	setx	0x230039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 23)
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
cpu_intr_0_46:
	setx	0x21012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 660: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbde5c000  ! 661: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e521e1  ! 662: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_26:
	mov	0x27, %r14
	.word 0xf0f384a0  ! 664: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb6b5a0e5  ! 671: ORNcc_I	orncc 	%r22, 0x00e5, %r27
	.word 0xb9e4e17d  ! 674: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbeb5c000  ! 675: SUBCcc_R	orncc 	%r23, %r0, %r31
cpu_intr_0_47:
	setx	0x20001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_48:
	setx	0x23023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560a9  ! 679: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_49:
	setx	0x230002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d0000  ! 686: SLL_R	sll 	%r20, %r0, %r27
T0_asi_reg_wr_27:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 687: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_28:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 689: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e40000  ! 690: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe54000  ! 691: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_29:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 693: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e50000  ! 695: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_50:
	setx	0x210123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_30:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 699: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_51:
	setx	0x22032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_31:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 703: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_32:
	mov	0x2a, %r14
	.word 0xf2f38e60  ! 707: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_31:
	mov	0x26, %r14
	.word 0xf4db8e60  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_52:
	setx	0x200219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 715: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_33:
	mov	0x18, %r14
	.word 0xf4f38e40  ! 718: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9518000  ! 721: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_rd_32:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_33:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e40000  ! 728: SAVE_R	save	%r16, %r0, %r26
	.word 0xbb7d8400  ! 730: MOVR_R	movre	%r22, %r0, %r29
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_34:
	mov	0x3, %r14
	.word 0xf4db84a0  ! 732: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_35:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_53:
	setx	0x210203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 737: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_34:
	mov	0x14, %r14
	.word 0xf8f389e0  ! 738: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5e5a093  ! 740: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_35:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 743: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_rd_36:
	mov	0x14, %r14
	.word 0xf4db8e80  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5e54000  ! 747: SAVE_R	save	%r21, %r0, %r26
	.word 0xb6b4c000  ! 749: SUBCcc_R	orncc 	%r19, %r0, %r27
T0_asi_reg_wr_36:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 752: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9e44000  ! 753: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e4a16c  ! 754: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e4e059  ! 759: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e421d3  ! 764: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e4610f  ! 767: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e4c000  ! 771: SAVE_R	save	%r19, %r0, %r25
	.word 0xbc34a1a0  ! 772: SUBC_I	orn 	%r18, 0x01a0, %r30
	.word 0xb5e5e1f7  ! 773: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbac44000  ! 775: ADDCcc_R	addccc 	%r17, %r0, %r29
	.word 0xb7e52143  ! 776: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbbe44000  ! 777: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_37:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 778: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_54:
	setx	0x22003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73cf001  ! 787: SRAX_I	srax	%r19, 0x0001, %r27
T0_asi_reg_wr_38:
	mov	0x22, %r14
	.word 0xf2f384a0  ! 793: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_55:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 8)
	.word 0xb2246112  ! 802: SUB_I	sub 	%r17, 0x0112, %r25
cpu_intr_0_56:
	setx	0x220216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0140000  ! 804: OR_R	or 	%r16, %r0, %r24
	.word 0xb1e5e1ed  ! 809: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 27)
	.word 0xb3e4e063  ! 814: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e54000  ! 817: SAVE_R	save	%r21, %r0, %r26
	.word 0xb92d8000  ! 818: SLL_R	sll 	%r22, %r0, %r28
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e58000  ! 821: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_57:
	setx	0x210229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561d3  ! 823: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_37:
	mov	0x2d, %r14
	.word 0xf2db8e60  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbe0c0000  ! 829: AND_R	and 	%r16, %r0, %r31
	.word 0xb7e4e180  ! 830: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_58:
	setx	0x210122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 832: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9e58000  ! 836: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_39:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 838: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_59:
	setx	0x23020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e4e1c5  ! 850: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe50000  ! 852: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_40:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 857: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_38:
	mov	0x2, %r14
	.word 0xf2db84a0  ! 862: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbbe56055  ! 863: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e54000  ! 864: SAVE_R	save	%r21, %r0, %r28
	.word 0xb5e50000  ! 865: SAVE_R	save	%r20, %r0, %r26
	.word 0xb4a44000  ! 866: SUBcc_R	subcc 	%r17, %r0, %r26
	.word 0xbf2c2001  ! 867: SLL_I	sll 	%r16, 0x0001, %r31
	.word 0xb1e40000  ! 869: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e48000  ! 872: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_39:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 874: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb151c000  ! 881: RDPR_TL	<illegal instruction>
T0_asi_reg_rd_40:
	mov	0x22, %r14
	.word 0xf6db84a0  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_60:
	setx	0x230018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46195  ! 886: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe40000  ! 887: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe4216d  ! 888: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe521ed  ! 891: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_61:
	setx	0x270222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 16)
	.word 0xbe3d20dc  ! 899: XNOR_I	xnor 	%r20, 0x00dc, %r31
cpu_intr_0_62:
	setx	0x26033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 901: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e460e4  ! 902: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd508000  ! 905: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe56051  ! 906: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe44000  ! 908: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_41:
	mov	0x38, %r14
	.word 0xfef389e0  ! 909: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3e5a1c0  ! 910: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5609f  ! 911: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_63:
	setx	0x27032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec421bd  ! 914: ADDCcc_I	addccc 	%r16, 0x01bd, %r31
T0_asi_reg_wr_42:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 917: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_64:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d946160  ! 927: WRPR_PSTATE_I	wrpr	%r17, 0x0160, %pstate
T0_asi_reg_wr_43:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 928: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_wr_44:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 930: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_65:
	setx	0x260216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_45:
	mov	0x4, %r14
	.word 0xf4f38400  ! 942: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe5e02d  ! 946: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_66:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 948: RDPR_TNPC	<illegal instruction>
cpu_intr_0_67:
	setx	0x260129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e01b  ! 958: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e44000  ! 960: SAVE_R	save	%r17, %r0, %r28
	.word 0xb63560e5  ! 961: ORN_I	orn 	%r21, 0x00e5, %r27
T0_asi_reg_wr_46:
	mov	0x27, %r14
	.word 0xf6f38400  ! 962: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1e4e075  ! 964: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e52149  ! 966: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_68:
	setx	0x26030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 969: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e50000  ! 972: SAVE_R	save	%r20, %r0, %r24
	.word 0xb0354000  ! 973: ORN_R	orn 	%r21, %r0, %r24
	.word 0xb6ad0000  ! 975: ANDNcc_R	andncc 	%r20, %r0, %r27
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 23)
	.word 0xb82c2047  ! 978: ANDN_I	andn 	%r16, 0x0047, %r28
T0_asi_reg_rd_41:
	mov	0x26, %r14
	.word 0xf2db8e80  ! 979: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_wr_48:
	mov	0xd, %r14
	.word 0xf4f384a0  ! 980: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e5c000  ! 982: SAVE_R	save	%r23, %r0, %r24
	.word 0x8194e188  ! 986: WRPR_TPC_I	wrpr	%r19, 0x0188, %tpc
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_69:
	setx	0x26000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_42:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_43:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0x83946131  ! 999: WRPR_TNPC_I	wrpr	%r17, 0x0131, %tnpc
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_70:
	setx	0x25022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1d5  ! 1004: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbd3ce001  ! 1005: SRA_I	sra 	%r19, 0x0001, %r30
	.word 0xbde4a0fd  ! 1006: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_71:
	setx	0x27020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 1011: SAVE_R	save	%r20, %r0, %r28
	.word 0xb5e42010  ! 1013: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_72:
	setx	0x26021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_73:
	setx	0x240219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_44:
	mov	0x17, %r14
	.word 0xf4db89e0  ! 1021: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_49:
	mov	0x26, %r14
	.word 0xfef38e80  ! 1024: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e5a0e7  ! 1026: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_50:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1027: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe54000  ! 1028: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_74:
	setx	0x25031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 1030: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e5c000  ! 1031: SAVE_R	save	%r23, %r0, %r25
	.word 0xb3e44000  ! 1033: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5e56025  ! 1035: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_45:
	mov	0x2c, %r14
	.word 0xf4db8e40  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e5e012  ! 1042: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_46:
	mov	0x30, %r14
	.word 0xfadb8e40  ! 1047: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb33c0000  ! 1049: SRA_R	sra 	%r16, %r0, %r25
cpu_intr_0_75:
	setx	0x124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e4a0f6  ! 1058: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_76:
	setx	0x27022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_51:
	mov	0x26, %r14
	.word 0xfef38e40  ! 1063: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_77:
	setx	0x270032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_78:
	setx	0x24012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a058  ! 1067: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e5e150  ! 1070: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_52:
	mov	0x34, %r14
	.word 0xf4f38e60  ! 1071: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb9e44000  ! 1074: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_47:
	mov	0x18, %r14
	.word 0xf0db89e0  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_79:
	setx	0x260235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_53:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 1081: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3e5202f  ! 1082: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_80:
	setx	0x24021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56178  ! 1088: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e4a17f  ! 1090: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_54:
	mov	0x24, %r14
	.word 0xf4f38e60  ! 1091: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_55:
	mov	0x8, %r14
	.word 0xf2f38e80  ! 1094: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_48:
	mov	0x8, %r14
	.word 0xf0db8400  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb0c5c000  ! 1098: ADDCcc_R	addccc 	%r23, %r0, %r24
cpu_intr_0_81:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0f9  ! 1100: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_56:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 1102: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbde44000  ! 1105: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7e44000  ! 1106: SAVE_R	save	%r17, %r0, %r27
	.word 0xb41da1b1  ! 1107: XOR_I	xor 	%r22, 0x01b1, %r26
	.word 0xb3e42053  ! 1108: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e4e0ad  ! 1109: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb805a169  ! 1110: ADD_I	add 	%r22, 0x0169, %r28
	.word 0xbde58000  ! 1112: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_82:
	setx	0x260119, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_57:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 1116: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe40000  ! 1117: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e54000  ! 1120: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e40000  ! 1124: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e42080  ! 1126: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e40000  ! 1127: SAVE_R	save	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe560b6  ! 1132: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_58:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 1139: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_83:
	setx	0x24033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 1143: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e4e1ec  ! 1145: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbb641800  ! 1146: MOVcc_R	<illegal instruction>
	.word 0xb3e46173  ! 1147: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e5e197  ! 1149: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e5a165  ! 1157: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_84:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_49:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_59:
	mov	0x7, %r14
	.word 0xf2f384a0  ! 1167: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbde5c000  ! 1169: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e4606d  ! 1172: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e42087  ! 1174: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_85:
	setx	0x250322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 1179: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_86:
	setx	0x240114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 1186: SAVE_R	save	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5213b  ! 1191: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_87:
	setx	0x26032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_60:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 1194: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e50000  ! 1195: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e5e165  ! 1207: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_61:
	mov	0xd, %r14
	.word 0xfaf384a0  ! 1210: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde44000  ! 1213: SAVE_R	save	%r17, %r0, %r30
	.word 0xbe3561ce  ! 1215: SUBC_I	orn 	%r21, 0x01ce, %r31
T0_asi_reg_rd_50:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_88:
	setx	0x240102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_89:
	setx	0x260107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73dc000  ! 1220: SRA_R	sra 	%r23, %r0, %r27
	.word 0xb9e4c000  ! 1221: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e48000  ! 1222: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 39)
	.word 0x8f902001  ! 1226: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T0_asi_reg_rd_51:
	mov	0x10, %r14
	.word 0xf2db84a0  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e421c7  ! 1235: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4c000  ! 1236: SAVE_R	save	%r19, %r0, %r27
	.word 0xbe05c000  ! 1237: ADD_R	add 	%r23, %r0, %r31
T0_asi_reg_rd_52:
	mov	0x15, %r14
	.word 0xfadb84a0  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3e4a17f  ! 1241: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e5a061  ! 1245: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5c000  ! 1246: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_62:
	mov	0x1b, %r14
	.word 0xf0f38400  ! 1247: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_wr_63:
	mov	0x30, %r14
	.word 0xfaf38400  ! 1249: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7e4c000  ! 1252: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_53:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3504000  ! 1256: RDPR_TNPC	<illegal instruction>
cpu_intr_0_90:
	setx	0x25022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_91:
	setx	0x26022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56146  ! 1260: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e5e159  ! 1262: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb0bc0000  ! 1265: XNORcc_R	xnorcc 	%r16, %r0, %r24
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9e40000  ! 1267: SAVE_R	save	%r16, %r0, %r28
	.word 0xb62d6096  ! 1268: ANDN_I	andn 	%r21, 0x0096, %r27
T0_asi_reg_wr_64:
	mov	0x16, %r14
	.word 0xf0f38e80  ! 1269: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_92:
	setx	0x260024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 1272: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e4c000  ! 1276: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e58000  ! 1277: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_54:
	mov	0x38, %r14
	.word 0xfcdb89e0  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_93:
	setx	0x250235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_65:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 1285: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3e5e155  ! 1286: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1348000  ! 1287: SRL_R	srl 	%r18, %r0, %r24
cpu_intr_0_94:
	setx	0x270202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1289: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e5e1d1  ! 1290: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb445605e  ! 1291: ADDC_I	addc 	%r21, 0x005e, %r26
T0_asi_reg_rd_55:
	mov	0x1, %r14
	.word 0xf4db8400  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_56:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb3e48000  ! 1296: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_95:
	setx	0x27002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 1301: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_66:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 1307: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbf3ca001  ! 1308: SRA_I	sra 	%r18, 0x0001, %r31
T0_asi_reg_rd_57:
	mov	0x17, %r14
	.word 0xf8db84a0  ! 1311: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb9510000  ! 1313: RDPR_TICK	<illegal instruction>
	.word 0xb3e52012  ! 1315: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_96:
	setx	0x27000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_58:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_59:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_97:
	setx	0x27003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_98:
	setx	0x240109, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_60:
	mov	0x32, %r14
	.word 0xfadb8e80  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3e5e080  ! 1326: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe48000  ! 1327: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_61:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 1329: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb6b48000  ! 1332: SUBCcc_R	orncc 	%r18, %r0, %r27
	.word 0xb1e4e1ff  ! 1333: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_62:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_99:
	setx	0x250130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35a0f1  ! 1340: ORN_I	orn 	%r22, 0x00f1, %r31
	.word 0xbfe5218a  ! 1344: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_67:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 1345: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde48000  ! 1347: SAVE_R	save	%r18, %r0, %r30
	.word 0xbde561c8  ! 1351: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_100:
	setx	0x270327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_101:
	setx	0x25031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe40000  ! 1357: SAVE_R	save	%r16, %r0, %r29
	.word 0xb2840000  ! 1358: ADDcc_R	addcc 	%r16, %r0, %r25
	.word 0xb1e4c000  ! 1360: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_102:
	setx	0x29010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_63:
	mov	0x21, %r14
	.word 0xf2db8e40  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e44000  ! 1367: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e54000  ! 1370: SAVE_R	save	%r21, %r0, %r27
	.word 0xb57c0400  ! 1372: MOVR_R	movre	%r16, %r0, %r26
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_103:
	setx	0x28032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_68:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1375: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_104:
	setx	0x2b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_69:
	mov	0x26, %r14
	.word 0xf8f38400  ! 1377: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_70:
	mov	0x35, %r14
	.word 0xfaf38e80  ! 1379: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_71:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 1380: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_105:
	setx	0x2b0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1383: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_72:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 1384: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_73:
	mov	0x2f, %r14
	.word 0xf0f38e60  ! 1386: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_64:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_106:
	setx	0x2a013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde5c000  ! 1393: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_74:
	mov	0x35, %r14
	.word 0xf4f384a0  ! 1397: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_107:
	setx	0x2b0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e520ee  ! 1400: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e4e15f  ! 1402: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e420da  ! 1403: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe5210a  ! 1406: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_65:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 1408: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb3e4c000  ! 1409: SAVE_R	save	%r19, %r0, %r25
	.word 0xb3e58000  ! 1410: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde54000  ! 1414: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e48000  ! 1415: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e42124  ! 1416: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_66:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe5605f  ! 1420: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xba34e1c5  ! 1423: SUBC_I	orn 	%r19, 0x01c5, %r29
cpu_intr_0_108:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_75:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 1425: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde44000  ! 1427: SAVE_R	save	%r17, %r0, %r30
	.word 0xbe444000  ! 1428: ADDC_R	addc 	%r17, %r0, %r31
	.word 0xbfe4e1a8  ! 1430: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_76:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 1431: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_67:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 1433: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_rd_68:
	mov	0x3c0, %r14
	.word 0xfedb89e0  ! 1434: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb57cc400  ! 1435: MOVR_R	movre	%r19, %r0, %r26
T0_asi_reg_rd_69:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb951c000  ! 1438: RDPR_TL	<illegal instruction>
cpu_intr_0_109:
	setx	0x280226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e00f  ! 1442: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde54000  ! 1446: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_70:
	mov	0x35, %r14
	.word 0xf4db89e0  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7e44000  ! 1455: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e54000  ! 1456: SAVE_R	save	%r21, %r0, %r26
	.word 0xbde44000  ! 1460: SAVE_R	save	%r17, %r0, %r30
	.word 0xb5e5a1d9  ! 1461: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_110:
	setx	0x290006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_77:
	mov	0x10, %r14
	.word 0xfaf389e0  ! 1464: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbd3c3001  ! 1468: SRAX_I	srax	%r16, 0x0001, %r30
	.word 0xb3e4a083  ! 1471: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e48000  ! 1474: SAVE_R	save	%r18, %r0, %r25
	.word 0xb2158000  ! 1475: OR_R	or 	%r22, %r0, %r25
T0_asi_reg_wr_78:
	mov	0x2, %r14
	.word 0xfcf384a0  ! 1477: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbbe54000  ! 1479: SAVE_R	save	%r21, %r0, %r29
	.word 0xbfe44000  ! 1480: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_71:
	mov	0x23, %r14
	.word 0xf0db8e60  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_wr_79:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 1483: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e54000  ! 1485: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe54000  ! 1488: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e4e0d7  ! 1489: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e58000  ! 1495: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_111:
	setx	0x290136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_72:
	mov	0x12, %r14
	.word 0xfadb8e80  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1e4e079  ! 1501: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_73:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde58000  ! 1504: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e4a1cf  ! 1505: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e4c000  ! 1506: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_112:
	setx	0x2a0219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_113:
	setx	0x2a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_80:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 1517: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbd7de401  ! 1520: MOVR_I	movre	%r23, 0x1, %r30
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_114:
	setx	0x280122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_115:
	setx	0x2b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_116:
	setx	0x2a0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_117:
	setx	0x2b0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 4)
	.word 0xb295e11b  ! 1539: ORcc_I	orcc 	%r23, 0x011b, %r25
	.word 0xb7e4c000  ! 1542: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_118:
	setx	0x2b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 1545: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e5a0eb  ! 1549: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe50000  ! 1550: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_74:
	mov	0x24, %r14
	.word 0xfedb84a0  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb1e4a068  ! 1555: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_81:
	mov	0x26, %r14
	.word 0xf8f38400  ! 1556: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_82:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 1557: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfe58000  ! 1558: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb09d4000  ! 1567: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0xb3e421f5  ! 1568: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_119:
	setx	0x2b0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_120:
	setx	0x2b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d8000  ! 1583: SRA_R	sra 	%r22, %r0, %r31
cpu_intr_0_121:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_75:
	mov	0x38, %r14
	.word 0xf8db84a0  ! 1586: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb6b58000  ! 1588: ORNcc_R	orncc 	%r22, %r0, %r27
T0_asi_reg_rd_76:
	mov	0x32, %r14
	.word 0xfedb89e0  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbbe460da  ! 1590: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e44000  ! 1591: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_77:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe46122  ! 1593: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_83:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 1595: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e5c000  ! 1596: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb5e50000  ! 1604: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde42165  ! 1608: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_84:
	mov	0x13, %r14
	.word 0xfcf389e0  ! 1609: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5c000  ! 1622: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_122:
	setx	0x20222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42108  ! 1628: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e5619d  ! 1629: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e42182  ! 1631: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb8050000  ! 1632: ADD_R	add 	%r20, %r0, %r28
	.word 0xb5e48000  ! 1638: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e5607a  ! 1640: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, c)
	.word 0xbfe461ea  ! 1644: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbd643801  ! 1651: MOVcc_I	<illegal instruction>
	.word 0xbbe40000  ! 1652: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_78:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_123:
	setx	0x2a012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 1659: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde5a0e9  ! 1662: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_79:
	mov	0x2f, %r14
	.word 0xfadb84a0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_124:
	setx	0x290032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e461ef  ! 1666: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_80:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb5e44000  ! 1669: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e4e001  ! 1673: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xba352108  ! 1676: SUBC_I	orn 	%r20, 0x0108, %r29
cpu_intr_0_125:
	setx	0x280001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_85:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 1681: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7e50000  ! 1689: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe50000  ! 1690: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe48000  ! 1691: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_86:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 1695: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbcb4604f  ! 1698: ORNcc_I	orncc 	%r17, 0x004f, %r30
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_81:
	mov	0x1d, %r14
	.word 0xfadb8e60  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_126:
	setx	0x28010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c4000  ! 1712: XNOR_R	xnor 	%r17, %r0, %r30
T0_asi_reg_rd_82:
	mov	0xa, %r14
	.word 0xf8db8e60  ! 1714: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfe4c000  ! 1717: SAVE_R	save	%r19, %r0, %r31
	.word 0xb7e5c000  ! 1718: SAVE_R	save	%r23, %r0, %r27
	.word 0xb53cc000  ! 1722: SRA_R	sra 	%r19, %r0, %r26
T0_asi_reg_wr_87:
	mov	0x7, %r14
	.word 0xf4f38e60  ! 1723: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbbe4a085  ! 1725: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e4a08b  ! 1734: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 20)
	.word 0xbfe50000  ! 1740: SAVE_R	save	%r20, %r0, %r31
	.word 0xb1e46142  ! 1741: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde40000  ! 1742: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_127:
	setx	0x2a0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_83:
	mov	0x1d, %r14
	.word 0xf0db84a0  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1e5e1b4  ! 1747: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe58000  ! 1748: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_128:
	setx	0x280112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 1750: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xbbe44000  ! 1752: SAVE_R	save	%r17, %r0, %r29
	.word 0xbec5e163  ! 1758: ADDCcc_I	addccc 	%r23, 0x0163, %r31
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e4e1a9  ! 1765: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_88:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 1767: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_129:
	setx	0x290316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1770: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e5e0b3  ! 1771: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_84:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 1773: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_89:
	mov	0x23, %r14
	.word 0xf2f38400  ! 1776: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb4bd6031  ! 1781: XNORcc_I	xnorcc 	%r21, 0x0031, %r26
cpu_intr_0_130:
	setx	0x28011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d8000  ! 1788: SRA_R	sra 	%r22, %r0, %r26
T0_asi_reg_wr_90:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 1790: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbfe4c000  ! 1791: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_85:
	mov	0x18, %r14
	.word 0xfcdb84a0  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb4b40000  ! 1793: SUBCcc_R	orncc 	%r16, %r0, %r26
T0_asi_reg_wr_91:
	mov	0x5, %r14
	.word 0xf4f384a0  ! 1796: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbbe561f7  ! 1797: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 9)
	.word 0xb49d200e  ! 1799: XORcc_I	xorcc 	%r20, 0x000e, %r26
	.word 0xbde421bf  ! 1800: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e460fe  ! 1801: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e40000  ! 1802: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_92:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 1806: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb53d0000  ! 1807: SRA_R	sra 	%r20, %r0, %r26
	.word 0xb92cc000  ! 1809: SLL_R	sll 	%r19, %r0, %r28
T0_asi_reg_rd_86:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e4c000  ! 1812: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e460cc  ! 1813: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_93:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 1814: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9e4c000  ! 1823: SAVE_R	save	%r19, %r0, %r28
	.word 0xb7e561c5  ! 1824: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_94:
	mov	0xb, %r14
	.word 0xfef384a0  ! 1825: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_87:
	mov	0x7, %r14
	.word 0xf6db84a0  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 4)
	.word 0xbfe4c000  ! 1834: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e5c000  ! 1835: SAVE_R	save	%r23, %r0, %r28
	.word 0xbe3cc000  ! 1837: XNOR_R	xnor 	%r19, %r0, %r31
	.word 0xb1e44000  ! 1839: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_88:
	mov	0x10, %r14
	.word 0xf6db8400  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbde50000  ! 1842: SAVE_R	save	%r20, %r0, %r30
	.word 0xbbe58000  ! 1845: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_89:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e5c000  ! 1850: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e58000  ! 1852: SAVE_R	save	%r22, %r0, %r28
	.word 0xbde44000  ! 1853: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e420ca  ! 1855: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_131:
	setx	0x2d030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e561ea  ! 1859: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_90:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 1861: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_132:
	setx	0x2c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a108  ! 1863: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5e5a1af  ! 1870: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e52195  ! 1872: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_wr_95:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1878: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e56171  ! 1880: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5603f  ! 1883: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_133:
	setx	0x2d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e48000  ! 1889: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 13)
	.word 0xb1e5c000  ! 1891: SAVE_R	save	%r23, %r0, %r24
	.word 0xb7e5c000  ! 1892: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe5a1e2  ! 1893: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e48000  ! 1894: SAVE_R	save	%r18, %r0, %r26
	.word 0xbbe5c000  ! 1895: SAVE_R	save	%r23, %r0, %r29
	.word 0xb5e50000  ! 1899: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e50000  ! 1904: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_134:
	setx	0x2c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_135:
	setx	0x2d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_136:
	setx	0x2e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 1915: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe5e16a  ! 1916: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e46114  ! 1918: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5c000  ! 1920: SAVE_R	save	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5e1d6  ! 1923: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e521bf  ! 1924: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e50000  ! 1929: SAVE_R	save	%r20, %r0, %r26
	.word 0xb1e560ea  ! 1930: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe54000  ! 1931: SAVE_R	save	%r21, %r0, %r31
	.word 0xb73df001  ! 1934: SRAX_I	srax	%r23, 0x0001, %r27
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_137:
	setx	0x2c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 1938: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5341000  ! 1939: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xb9e48000  ! 1942: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_138:
	setx	0x2f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1944: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e50000  ! 1947: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe54000  ! 1950: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_96:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 1951: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe460e6  ! 1956: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe42033  ! 1960: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e44000  ! 1962: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_91:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde4a1e7  ! 1970: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e44000  ! 1971: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_97:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 1972: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7520000  ! 1974: RDPR_PIL	<illegal instruction>
	.word 0xb1643801  ! 1976: MOVcc_I	<illegal instruction>
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb1e5c000  ! 1982: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_98:
	mov	0x30, %r14
	.word 0xfef38e40  ! 1985: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde4c000  ! 1986: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_99:
	mov	0x9, %r14
	.word 0xf2f38e80  ! 1993: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_92:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 1997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_100:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 1998: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbfe5c000  ! 1999: SAVE_R	save	%r23, %r0, %r31
	.word 0xb1e58000  ! 2000: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e5a0b4  ! 2002: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e40000  ! 2007: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e4e151  ! 2012: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_139:
	setx	0x2d020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe5c000  ! 2018: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e4a0a4  ! 2022: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, c)
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_140:
	setx	0x2e033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e167  ! 2030: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_93:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e4e1f4  ! 2036: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe58000  ! 2037: SAVE_R	save	%r22, %r0, %r31
	.word 0xb0c4a12a  ! 2038: ADDCcc_I	addccc 	%r18, 0x012a, %r24
T0_asi_reg_wr_101:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 2040: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb01de0df  ! 2044: XOR_I	xor 	%r23, 0x00df, %r24
	.word 0xbbe46152  ! 2048: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_141:
	setx	0x2f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2051: SAVE_R	save	%r21, %r0, %r31
	.word 0xbf2c7001  ! 2054: SLLX_I	sllx	%r17, 0x0001, %r31
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_142:
	setx	0x2d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561c9  ! 2057: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5e1f5  ! 2059: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb97ce401  ! 2061: MOVR_I	movre	%r19, 0x1, %r28
T0_asi_reg_wr_102:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 2062: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbd2ce001  ! 2063: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xbbe4e03b  ! 2064: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e50000  ! 2068: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5e5a183  ! 2069: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_143:
	setx	0x2c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_94:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe4a1bb  ! 2074: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_95:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb01d8000  ! 2081: XOR_R	xor 	%r22, %r0, %r24
	.word 0xb5e48000  ! 2082: SAVE_R	save	%r18, %r0, %r26
	.word 0xbe34a185  ! 2084: SUBC_I	orn 	%r18, 0x0185, %r31
cpu_intr_0_144:
	setx	0x2e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb014206c  ! 2087: OR_I	or 	%r16, 0x006c, %r24
	.word 0xb8b5e159  ! 2089: ORNcc_I	orncc 	%r23, 0x0159, %r28
	.word 0xb9e5c000  ! 2092: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_103:
	mov	0x3, %r14
	.word 0xf8f38e80  ! 2096: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_145:
	setx	0x2f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_96:
	mov	0xa, %r14
	.word 0xf8db89e0  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_104:
	mov	0xe, %r14
	.word 0xfcf389e0  ! 2104: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_rd_97:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_146:
	setx	0x30c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2109: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb4258000  ! 2114: SUB_R	sub 	%r22, %r0, %r26
cpu_intr_0_147:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_148:
	setx	0x2f0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2121: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e4e0c3  ! 2127: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_98:
	mov	0x6, %r14
	.word 0xf6db8e60  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbbe58000  ! 2129: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e4a1c5  ! 2132: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e50000  ! 2133: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5e48000  ! 2134: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_99:
	mov	0x1a, %r14
	.word 0xfadb89e0  ! 2137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_100:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_149:
	setx	0x2d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a01d  ! 2143: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 10)
	.word 0xb12d8000  ! 2147: SLL_R	sll 	%r22, %r0, %r24
	.word 0xb1e5e0d9  ! 2149: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_150:
	setx	0x2d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_151:
	setx	0x2e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 10)
	.word 0xbbe4e07a  ! 2159: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd35e001  ! 2160: SRL_I	srl 	%r23, 0x0001, %r30
	.word 0xb5e4c000  ! 2163: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_101:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe52064  ! 2167: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde50000  ! 2169: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_152:
	setx	0x2f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_102:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_154:
	setx	0x2d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42033  ! 2179: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_155:
	setx	0x2d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe560f9  ! 2188: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_105:
	mov	0x23, %r14
	.word 0xf6f38400  ! 2189: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e58000  ! 2190: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e5e1b6  ! 2192: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e50000  ! 2194: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9e4e021  ! 2195: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e5a0c6  ! 2196: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_156:
	setx	0x2f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 2201: SAVE_R	save	%r16, %r0, %r27
	.word 0xb5e40000  ! 2208: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_157:
	setx	0x2f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2217: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe4c000  ! 2223: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e4a0d8  ! 2225: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe54000  ! 2227: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_103:
	mov	0x33, %r14
	.word 0xf6db8400  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_158:
	setx	0x2d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42024  ! 2238: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7500000  ! 2241: RDPR_TPC	<illegal instruction>
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_159:
	setx	0x2f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52197  ! 2247: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb2b5600a  ! 2248: ORNcc_I	orncc 	%r21, 0x000a, %r25
T0_asi_reg_wr_106:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 2249: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbde44000  ! 2251: SAVE_R	save	%r17, %r0, %r30
	.word 0xbbe44000  ! 2254: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_107:
	mov	0x1, %r14
	.word 0xf0f384a0  ! 2255: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e44000  ! 2259: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e5e00b  ! 2269: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e56102  ! 2273: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbc0ca158  ! 2275: AND_I	and 	%r18, 0x0158, %r30
	.word 0xb3e5c000  ! 2282: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb9e461ed  ! 2288: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_104:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e460ef  ! 2299: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_108:
	mov	0x38, %r14
	.word 0xfef38e80  ! 2300: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbfe5616c  ! 2301: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbab54000  ! 2302: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xb5e4a189  ! 2303: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_109:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 2309: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_160:
	setx	0x320213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560b4  ! 2313: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb8b54000  ! 2315: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0xbbe5a1f4  ! 2318: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_110:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 2320: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9e520c2  ! 2323: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe44000  ! 2327: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e5c000  ! 2334: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 38)
	.word 0xb7e58000  ! 2341: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_111:
	mov	0x3, %r14
	.word 0xf8f38e60  ! 2343: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_161:
	setx	0x33022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0aa  ! 2349: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_105:
	mov	0x1f, %r14
	.word 0xf0db8e80  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbbe50000  ! 2358: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e56011  ! 2361: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e5e1aa  ! 2362: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb4b44000  ! 2363: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xb3e46113  ! 2365: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e42005  ! 2366: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_162:
	setx	0x31000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb4a060  ! 2371: SUBCcc_I	orncc 	%r18, 0x0060, %r31
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_106:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 2383: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_wr_112:
	mov	0x26, %r14
	.word 0xf6f38400  ! 2388: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e40000  ! 2390: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_163:
	setx	0x330117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1d4  ! 2392: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb3c1000  ! 2396: SRAX_R	srax	%r16, %r0, %r29
T0_asi_reg_wr_113:
	mov	0x12, %r14
	.word 0xf4f38e60  ! 2399: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e58000  ! 2402: SAVE_R	save	%r22, %r0, %r24
	.word 0xb9e48000  ! 2403: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e48000  ! 2405: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_114:
	mov	0x35, %r14
	.word 0xf0f389e0  ! 2406: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5e40000  ! 2407: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5e5a0ba  ! 2410: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_164:
	setx	0x300308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_165:
	setx	0x33023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_115:
	mov	0x7, %r14
	.word 0xfcf38e60  ! 2417: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbde54000  ! 2418: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_116:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 2426: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 24)
	.word 0xbde561d8  ! 2433: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde58000  ! 2435: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e520c1  ! 2439: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 2445: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_118:
	mov	0xe, %r14
	.word 0xfcf38400  ! 2449: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbfe58000  ! 2450: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 8)
	.word 0x9195a011  ! 2458: WRPR_PIL_I	wrpr	%r22, 0x0011, %pil
T0_asi_reg_rd_107:
	mov	0x38, %r14
	.word 0xf6db8e60  ! 2463: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1e4e04e  ! 2468: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4a07e  ! 2469: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_166:
	setx	0x300005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e1e1  ! 2476: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e44000  ! 2477: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e58000  ! 2479: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e58000  ! 2485: SAVE_R	save	%r22, %r0, %r25
	.word 0xb7e46024  ! 2487: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_167:
	setx	0x330118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a12b  ! 2491: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e52042  ! 2492: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe54000  ! 2499: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_119:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 2501: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_168:
	setx	0x300302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3ca001  ! 2506: SRA_I	sra 	%r18, 0x0001, %r31
cpu_intr_0_169:
	setx	0x320300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e560c5  ! 2512: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_170:
	setx	0x33023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_120:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 2523: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_121:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 2524: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_171:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_122:
	mov	0x1f, %r14
	.word 0xf2f384a0  ! 2526: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 22)
	.word 0xbbe4a1a0  ! 2534: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_wr_123:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 2536: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_172:
	setx	0x330308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc34a05e  ! 2543: SUBC_I	orn 	%r18, 0x005e, %r30
	.word 0xbfe5c000  ! 2545: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_173:
	setx	0x310217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 2547: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde521ff  ! 2549: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e4e035  ! 2550: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_174:
	setx	0x320029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 2565: SAVE_R	save	%r22, %r0, %r30
	.word 0xbfe4c000  ! 2566: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde5a14e  ! 2570: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_175:
	setx	0x30003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5209c  ! 2579: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde5c000  ! 2580: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_124:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2583: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e520bc  ! 2584: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e5205f  ! 2590: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_176:
	setx	0x320320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e158  ! 2593: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e54000  ! 2595: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_177:
	setx	0x330306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b52075  ! 2597: SUBCcc_I	orncc 	%r20, 0x0075, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4c000  ! 2600: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e40000  ! 2601: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_125:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 2604: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe521a2  ! 2607: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_178:
	setx	0x330111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_108:
	mov	0x2d, %r14
	.word 0xf2db8400  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb2c461d5  ! 2615: ADDCcc_I	addccc 	%r17, 0x01d5, %r25
cpu_intr_0_179:
	setx	0x330100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_109:
	mov	0x1a, %r14
	.word 0xfadb89e0  ! 2619: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_180:
	setx	0x330310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_181:
	setx	0x310035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e124  ! 2630: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_110:
	mov	0x17, %r14
	.word 0xf2db8e80  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_182:
	setx	0x300123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22c8000  ! 2633: ANDN_R	andn 	%r18, %r0, %r25
T0_asi_reg_wr_126:
	mov	0x35, %r14
	.word 0xf0f389e0  ! 2634: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7e4215e  ! 2636: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e44000  ! 2639: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 2647: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1e4c000  ! 2648: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe4c000  ! 2649: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_183:
	setx	0x310220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_184:
	setx	0x310026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_185:
	setx	0x310326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_186:
	setx	0x320035, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_127:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 2672: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe50000  ! 2673: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e54000  ! 2676: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 0)
	.word 0xbf3c0000  ! 2679: SRA_R	sra 	%r16, %r0, %r31
	.word 0xb1e4a179  ! 2681: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe460bd  ! 2682: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e561f4  ! 2684: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, f)
	.word 0xbde5a178  ! 2687: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_128:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 2688: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e5a01e  ! 2689: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb40d8000  ! 2690: AND_R	and 	%r22, %r0, %r26
	.word 0xbc85a055  ! 2695: ADDcc_I	addcc 	%r22, 0x0055, %r30
	.word 0xb3e4e0fe  ! 2696: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_129:
	mov	0x10, %r14
	.word 0xf0f38e60  ! 2698: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb80ca098  ! 2700: AND_I	and 	%r18, 0x0098, %r28
T0_asi_reg_wr_130:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 2701: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_112:
	mov	0x2d, %r14
	.word 0xf2db89e0  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_131:
	mov	0x1a, %r14
	.word 0xf6f38400  ! 2706: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_132:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 2707: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9480000  ! 2708: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T0_asi_reg_rd_113:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_114:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 2710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_115:
	mov	0x24, %r14
	.word 0xfedb8e60  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3e58000  ! 2712: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe461f8  ! 2716: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e50000  ! 2717: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_187:
	setx	0x330222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2719: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e50000  ! 2721: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e40000  ! 2722: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 26)
	.word 0xb2244000  ! 2726: SUB_R	sub 	%r17, %r0, %r25
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_133:
	mov	0x5, %r14
	.word 0xfaf384a0  ! 2728: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_wr_134:
	mov	0x1f, %r14
	.word 0xfcf384a0  ! 2731: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_188:
	setx	0x370127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_135:
	mov	0x18, %r14
	.word 0xfef38e40  ! 2736: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb4842086  ! 2737: ADDcc_I	addcc 	%r16, 0x0086, %r26
	.word 0xb42d204b  ! 2738: ANDN_I	andn 	%r20, 0x004b, %r26
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e4e1bb  ! 2740: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_189:
	setx	0x34013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_190:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88d61d7  ! 2747: ANDcc_I	andcc 	%r21, 0x01d7, %r28
cpu_intr_0_191:
	setx	0x370224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e0bc  ! 2751: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_136:
	mov	0x0, %r14
	.word 0xf0f38e60  ! 2753: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7e4218b  ! 2755: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb0942173  ! 2756: ORcc_I	orcc 	%r16, 0x0173, %r24
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, e)
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 10)
	.word 0xbc45a1f2  ! 2763: ADDC_I	addc 	%r22, 0x01f2, %r30
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_192:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb134f001  ! 2768: SRLX_I	srlx	%r19, 0x0001, %r24
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba1d0000  ! 2771: XOR_R	xor 	%r20, %r0, %r29
cpu_intr_0_193:
	setx	0x34023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e072  ! 2775: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe5c000  ! 2777: SAVE_R	save	%r23, %r0, %r31
	.word 0xb42c8000  ! 2779: ANDN_R	andn 	%r18, %r0, %r26
cpu_intr_0_194:
	setx	0x350226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_195:
	setx	0x360308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 2792: SAVE_R	save	%r17, %r0, %r31
	.word 0xbd2c7001  ! 2797: SLLX_I	sllx	%r17, 0x0001, %r30
	.word 0xb1e420d6  ! 2798: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe56021  ! 2799: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb8146160  ! 2805: OR_I	or 	%r17, 0x0160, %r28
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_137:
	mov	0x34, %r14
	.word 0xf2f384a0  ! 2809: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e560ae  ! 2810: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_138:
	mov	0x7, %r14
	.word 0xf0f38e80  ! 2813: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb2c4c000  ! 2814: ADDCcc_R	addccc 	%r19, %r0, %r25
	.word 0xb60ca0c3  ! 2815: AND_I	and 	%r18, 0x00c3, %r27
	.word 0xb9e44000  ! 2818: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_196:
	setx	0x34030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_197:
	setx	0x34013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e175  ! 2833: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb2852117  ! 2834: ADDcc_I	addcc 	%r20, 0x0117, %r25
cpu_intr_0_198:
	setx	0x35010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42092  ! 2837: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e42017  ! 2838: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5a11e  ! 2839: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_116:
	mov	0x32, %r14
	.word 0xf0db84a0  ! 2842: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_199:
	setx	0x35011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2844: SAVE_R	save	%r20, %r0, %r28
	.word 0xb5e5a130  ! 2846: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe52036  ! 2848: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, e)
	.word 0xb6b40000  ! 2851: SUBCcc_R	orncc 	%r16, %r0, %r27
cpu_intr_0_200:
	setx	0x370214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5219c  ! 2856: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_117:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 2859: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_wr_139:
	mov	0xa, %r14
	.word 0xfaf389e0  ! 2861: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbbe5a127  ! 2863: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e48000  ! 2864: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e420b1  ! 2871: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_201:
	setx	0x350211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1ec  ! 2874: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e520d3  ! 2877: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_118:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_202:
	setx	0x350028, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, e)
	.word 0xb57d0400  ! 2901: MOVR_R	movre	%r20, %r0, %r26
	.word 0xbe3dc000  ! 2902: XNOR_R	xnor 	%r23, %r0, %r31
T0_asi_reg_rd_119:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe5c000  ! 2905: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_140:
	mov	0x5, %r14
	.word 0xf4f38e80  ! 2907: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5e5a03c  ! 2908: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_120:
	mov	0x14, %r14
	.word 0xf2db8e80  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfe5e0c1  ! 2912: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe4a0dd  ! 2918: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e58000  ! 2924: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 27)
	.word 0xbde50000  ! 2930: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e5c000  ! 2934: SAVE_R	save	%r23, %r0, %r25
	.word 0xb2440000  ! 2935: ADDC_R	addc 	%r16, %r0, %r25
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e421b8  ! 2946: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_203:
	setx	0x350018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_204:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_141:
	mov	0x19, %r14
	.word 0xf2f38e60  ! 2956: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbf3d4000  ! 2959: SRA_R	sra 	%r21, %r0, %r31
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde4c000  ! 2974: SAVE_R	save	%r19, %r0, %r30
	.word 0xbde4a107  ! 2975: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbca58000  ! 2977: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xb33c4000  ! 2980: SRA_R	sra 	%r17, %r0, %r25
	.word 0xbde4c000  ! 2981: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_205:
	setx	0x370301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe05c000  ! 2985: ADD_R	add 	%r23, %r0, %r31
	.word 0xbbe56122  ! 2986: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e48000  ! 2988: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e4204b  ! 2991: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_206:
	setx	0x340037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_207:
	setx	0x360015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435a0d4  ! 3000: ORN_I	orn 	%r22, 0x00d4, %r26
cpu_intr_0_208:
	setx	0x360229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3002: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_209:
	setx	0x340303, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_121:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 3010: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5e54000  ! 3012: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e48000  ! 3013: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 4)
	.word 0xb7e5a0f0  ! 3015: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_210:
	setx	0x37000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_122:
	mov	0xf, %r14
	.word 0xfedb89e0  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9e44000  ! 3025: SAVE_R	save	%r17, %r0, %r28
	.word 0xb8a5e0db  ! 3027: SUBcc_I	subcc 	%r23, 0x00db, %r28
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_211:
	setx	0x370338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_212:
	setx	0x370304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_213:
	setx	0x36012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_142:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 3048: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbb2d5000  ! 3049: SLLX_R	sllx	%r21, %r0, %r29
	.word 0xb1e40000  ! 3052: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_123:
	mov	0x7, %r14
	.word 0xf6db8e40  ! 3053: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb4858000  ! 3055: ADDcc_R	addcc 	%r22, %r0, %r26
cpu_intr_0_214:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3062: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_215:
	setx	0x350128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87942006  ! 3064: WRPR_TT_I	wrpr	%r16, 0x0006, %tt
T0_asi_reg_rd_124:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 14)
	.word 0xbea461ea  ! 3073: SUBcc_I	subcc 	%r17, 0x01ea, %r31
	.word 0xbbe42083  ! 3076: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_216:
	setx	0x350201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde4c000  ! 3082: SAVE_R	save	%r19, %r0, %r30
	.word 0xb40c60e1  ! 3083: AND_I	and 	%r17, 0x00e1, %r26
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_217:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 3087: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_144:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 3089: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_218:
	setx	0x34023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_219:
	setx	0x37020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_220:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_145:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 3099: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_221:
	setx	0x340007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 3103: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e5a167  ! 3106: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4c000  ! 3108: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e40000  ! 3109: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_125:
	mov	0x16, %r14
	.word 0xf8db8e80  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5e520e2  ! 3112: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_222:
	setx	0x370336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_223:
	setx	0x350138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_224:
	setx	0x37010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1c0000  ! 3120: XOR_R	xor 	%r16, %r0, %r31
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb21dc000  ! 3124: XOR_R	xor 	%r23, %r0, %r25
	.word 0xbfe4a1e9  ! 3131: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_126:
	mov	0xa, %r14
	.word 0xfcdb89e0  ! 3132: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb6bdc000  ! 3133: XNORcc_R	xnorcc 	%r23, %r0, %r27
	.word 0xb3e40000  ! 3138: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_225:
	setx	0x37002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf357001  ! 3142: SRLX_I	srlx	%r21, 0x0001, %r31
T0_asi_reg_wr_146:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3144: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_226:
	setx	0x350200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0da  ! 3147: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_147:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 3150: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbde4a171  ! 3152: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde54000  ! 3153: SAVE_R	save	%r21, %r0, %r30
	.word 0xb3e50000  ! 3154: SAVE_R	save	%r20, %r0, %r25
	.word 0xbfe4e00d  ! 3156: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe52165  ! 3158: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5a066  ! 3160: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e44000  ! 3161: SAVE_R	save	%r17, %r0, %r25
	.word 0xb42da013  ! 3164: ANDN_I	andn 	%r22, 0x0013, %r26
T0_asi_reg_rd_127:
	mov	0x2d, %r14
	.word 0xfadb8e80  ! 3167: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e58000  ! 3171: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_227:
	setx	0x34021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe940000  ! 3177: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xbbe4a117  ! 3179: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe5c000  ! 3180: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e4a1c7  ! 3182: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde44000  ! 3184: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_128:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e4a17d  ! 3192: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe5e0dc  ! 3194: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_129:
	mov	0x0, %r14
	.word 0xf6db8e60  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbde460ac  ! 3199: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_148:
	mov	0x30, %r14
	.word 0xf0f38400  ! 3201: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_228:
	setx	0x380039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_229:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_230:
	setx	0x3b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 3211: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7e4c000  ! 3212: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_231:
	setx	0x3b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb094c000  ! 3216: ORcc_R	orcc 	%r19, %r0, %r24
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e5c000  ! 3219: SAVE_R	save	%r23, %r0, %r28
	.word 0xb9e48000  ! 3220: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e50000  ! 3221: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_232:
	setx	0x3b0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3227: SAVE_R	save	%r16, %r0, %r24
	.word 0xb9342001  ! 3228: SRL_I	srl 	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5a115  ! 3238: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_233:
	setx	0x3b0222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_234:
	setx	0x38022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9e5e055  ! 3252: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_130:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 3253: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_rd_131:
	mov	0x34, %r14
	.word 0xf6db89e0  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_235:
	setx	0x380225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1bd  ! 3259: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_149:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 3262: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5e4c000  ! 3264: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e4e072  ! 3267: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_132:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e4a0fa  ! 3270: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_236:
	setx	0x3a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e50000  ! 3273: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde5608e  ! 3275: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e561d0  ! 3276: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_150:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 3277: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_133:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_134:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 26)
	.word 0xbbe5e056  ! 3282: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_151:
	mov	0x21, %r14
	.word 0xfaf38e80  ! 3284: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb62d6094  ! 3287: ANDN_I	andn 	%r21, 0x0094, %r27
cpu_intr_0_237:
	setx	0x380009, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_238:
	setx	0x3b0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe5a0b7  ! 3305: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe54000  ! 3307: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_135:
	mov	0xa, %r14
	.word 0xfcdb8400  ! 3308: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_239:
	setx	0x380112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 3315: SAVE_R	save	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_240:
	setx	0x390128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_241:
	setx	0x390132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, e)
	.word 0xb405a007  ! 3323: ADD_I	add 	%r22, 0x0007, %r26
	.word 0xbfe58000  ! 3324: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_242:
	setx	0x390025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_243:
	setx	0x380135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 3338: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_152:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 3344: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbaa42080  ! 3345: SUBcc_I	subcc 	%r16, 0x0080, %r29
	.word 0xb1e4e02c  ! 3346: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe4e1a3  ! 3350: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_136:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_153:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 3357: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb9e4e14a  ! 3362: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_154:
	mov	0x8, %r14
	.word 0xf4f38400  ! 3364: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_244:
	setx	0x38010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 3367: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_245:
	setx	0x3b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_246:
	setx	0x380013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_247:
	setx	0x390213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 3372: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde40000  ! 3378: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7e46192  ! 3383: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_248:
	setx	0x3b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x19, %r14
	.word 0xf4db8400  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e50000  ! 3388: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e5a1eb  ! 3389: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe5e1e9  ! 3391: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e54000  ! 3392: SAVE_R	save	%r21, %r0, %r26
	.word 0xbde5e02a  ! 3393: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e5e098  ! 3396: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_138:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e520e0  ! 3403: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_155:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 3405: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_156:
	mov	0x18, %r14
	.word 0xfcf38e80  ! 3410: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_249:
	setx	0x39021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_250:
	setx	0x390128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_251:
	setx	0x390329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e016  ! 3435: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e42055  ! 3439: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb88da11f  ! 3442: ANDcc_I	andcc 	%r22, 0x011f, %r28
	.word 0xb0940000  ! 3448: ORcc_R	orcc 	%r16, %r0, %r24
	.word 0xb7e54000  ! 3449: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_252:
	setx	0x380305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_253:
	setx	0x3a0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0448000  ! 3460: ADDC_R	addc 	%r18, %r0, %r24
cpu_intr_0_254:
	setx	0x3a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb245c000  ! 3463: ADDC_R	addc 	%r23, %r0, %r25
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_255:
	setx	0x3b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a130  ! 3468: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_157:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 3469: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb7e48000  ! 3470: SAVE_R	save	%r18, %r0, %r27
	.word 0xbe9d8000  ! 3471: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xb9e44000  ! 3472: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, e)
	.word 0xb6aca162  ! 3474: ANDNcc_I	andncc 	%r18, 0x0162, %r27
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb60d4000  ! 3481: AND_R	and 	%r21, %r0, %r27
	.word 0xbde50000  ! 3482: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_139:
	mov	0x37, %r14
	.word 0xfadb84a0  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e4c000  ! 3485: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e4c000  ! 3491: SAVE_R	save	%r19, %r0, %r26
	.word 0xb0bc8000  ! 3493: XNORcc_R	xnorcc 	%r18, %r0, %r24
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 23)
	.word 0xb3e4a1c7  ! 3504: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb80c4000  ! 3505: AND_R	and 	%r17, %r0, %r28
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 3e)
	.word 0x89942036  ! 3507: WRPR_TICK_I	wrpr	%r16, 0x0036, %tick
	.word 0xbfe5a128  ! 3508: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e58000  ! 3510: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e48000  ! 3512: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_158:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 3513: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_256:
	setx	0x3a011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb934d000  ! 3520: SRLX_R	srlx	%r19, %r0, %r28
	.word 0xb1e4203a  ! 3521: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe48000  ! 3522: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_257:
	setx	0x3b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_159:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3524: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_140:
	mov	0x30, %r14
	.word 0xf4db8e80  ! 3525: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_160:
	mov	0x33, %r14
	.word 0xf6f389e0  ! 3526: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 5)
	.word 0xb0c4c000  ! 3529: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xb09cc000  ! 3530: XORcc_R	xorcc 	%r19, %r0, %r24
cpu_intr_0_258:
	setx	0x39011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 23)
	.word 0xb3e44000  ! 3535: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe48000  ! 3536: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_161:
	mov	0x1b, %r14
	.word 0xf2f38e80  ! 3537: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_162:
	mov	0x17, %r14
	.word 0xfaf38e80  ! 3546: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xba14c000  ! 3547: OR_R	or 	%r19, %r0, %r29
	.word 0xb41da1e9  ! 3548: XOR_I	xor 	%r22, 0x01e9, %r26
T0_asi_reg_wr_163:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 3553: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_259:
	setx	0x3b0211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_260:
	setx	0x380311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0a0  ! 3559: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e50000  ! 3561: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 2)
	.word 0xb485e1ab  ! 3565: ADDcc_I	addcc 	%r23, 0x01ab, %r26
	.word 0xb3e42097  ! 3566: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_261:
	setx	0x38032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x390327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_263:
	setx	0x3b0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_265:
	setx	0x39011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 3576: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e50000  ! 3580: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_141:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde5618b  ! 3583: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_266:
	setx	0x3b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_164:
	mov	0x27, %r14
	.word 0xf4f389e0  ! 3586: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb5e5e15a  ! 3590: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb8b44000  ! 3592: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xb9e5607a  ! 3593: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde58000  ! 3594: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_267:
	setx	0x39013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb244a01c  ! 3600: ADDC_I	addc 	%r18, 0x001c, %r25
	.word 0xbb7c2401  ! 3601: MOVR_I	movre	%r16, 0x1, %r29
T0_asi_reg_rd_142:
	mov	0x17, %r14
	.word 0xf0db8e60  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e48000  ! 3611: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e54000  ! 3614: SAVE_R	save	%r21, %r0, %r24
	.word 0xb1e50000  ! 3615: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_268:
	setx	0x380208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56151  ! 3618: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbaa54000  ! 3623: SUBcc_R	subcc 	%r21, %r0, %r29
	.word 0xbfe4c000  ! 3624: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe40000  ! 3631: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe5a12d  ! 3645: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_165:
	mov	0x2f, %r14
	.word 0xfaf38400  ! 3646: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_269:
	setx	0x390321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 3649: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_166:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 3651: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_270:
	setx	0x3b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde560c3  ! 3653: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_167:
	mov	0x3c6, %r14
	.word 0xf0f38e80  ! 3655: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_271:
	setx	0x3a032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_272:
	setx	0x3a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_168:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3665: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_143:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 3667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_273:
	setx	0x3a0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_274:
	setx	0x380314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a01a  ! 3671: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_275:
	setx	0x3d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, a)
	.word 0xb5e54000  ! 3675: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_276:
	setx	0x3f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 3683: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_169:
	mov	0x2c, %r14
	.word 0xf4f38e80  ! 3685: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_144:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 36)
	.word 0xb6c56063  ! 3688: ADDCcc_I	addccc 	%r21, 0x0063, %r27
cpu_intr_0_277:
	setx	0x3f0212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_145:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_278:
	setx	0x3e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_146:
	mov	0x1a, %r14
	.word 0xfedb8e40  ! 3700: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_147:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_148:
	mov	0x2a, %r14
	.word 0xf6db89e0  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbbe5203b  ! 3707: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_170:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3708: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e5e091  ! 3709: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_149:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e42191  ! 3712: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb8b48000  ! 3717: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xbde4c000  ! 3718: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_279:
	setx	0x3c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_280:
	setx	0x3f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_171:
	mov	0x3, %r14
	.word 0xf4f384a0  ! 3721: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfe52161  ! 3723: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_281:
	setx	0x3c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_282:
	setx	0x3e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_283:
	setx	0x3c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 3729: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_172:
	mov	0x2b, %r14
	.word 0xf6f384a0  ! 3735: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_173:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 3739: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_150:
	mov	0x35, %r14
	.word 0xfedb8e60  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5c000  ! 3745: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e520e4  ! 3751: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_151:
	mov	0x2d, %r14
	.word 0xf8db8e60  ! 3752: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_284:
	setx	0x3e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_285:
	setx	0x3e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_286:
	setx	0x3e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e58000  ! 3761: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_287:
	setx	0x3f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4202a  ! 3768: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e54000  ! 3770: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e40000  ! 3771: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_152:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_174:
	mov	0x1d, %r14
	.word 0xf4f38e80  ! 3774: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb8844000  ! 3775: ADDcc_R	addcc 	%r17, %r0, %r28
	.word 0xb0344000  ! 3776: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xbbe5a0c3  ! 3777: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e5c000  ! 3778: SAVE_R	save	%r23, %r0, %r26
	.word 0xb4454000  ! 3779: ADDC_R	addc 	%r21, %r0, %r26
	.word 0xb5e54000  ! 3781: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_175:
	mov	0x30, %r14
	.word 0xfaf389e0  ! 3783: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_288:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 3789: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_153:
	mov	0x2f, %r14
	.word 0xf0db8e60  ! 3791: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb1e421d3  ! 3797: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e54000  ! 3798: SAVE_R	save	%r21, %r0, %r24
	.word 0xb81560a8  ! 3800: OR_I	or 	%r21, 0x00a8, %r28
cpu_intr_0_289:
	setx	0x3d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe40000  ! 3808: SAVE_R	save	%r16, %r0, %r31
	.word 0xbe2dc000  ! 3809: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xb9e5c000  ! 3810: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e42060  ! 3812: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e48000  ! 3814: SAVE_R	save	%r18, %r0, %r26
	.word 0xb1e5a1cd  ! 3815: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_290:
	setx	0x3f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 3819: SAVE_R	save	%r17, %r0, %r30
	.word 0xb5e46091  ! 3820: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e4e0a8  ! 3825: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e4e146  ! 3828: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_176:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 3829: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7e5e101  ! 3831: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e42054  ! 3833: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e4a079  ! 3835: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e5a093  ! 3836: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_291:
	setx	0x3e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 3849: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_177:
	mov	0x11, %r14
	.word 0xf4f38e80  ! 3859: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_154:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe521af  ! 3864: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_292:
	setx	0x3c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e560a9  ! 3868: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_293:
	setx	0x3f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46025  ! 3874: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e561a3  ! 3876: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e0ff  ! 3877: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_155:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e4e145  ! 3882: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe4c000  ! 3884: SAVE_R	save	%r19, %r0, %r29
	.word 0xbfe44000  ! 3885: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_156:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e561af  ! 3887: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e44000  ! 3888: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e521ec  ! 3891: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_294:
	setx	0x3d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_157:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_178:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 3895: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5e5202a  ! 3896: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb2b420d8  ! 3898: SUBCcc_I	orncc 	%r16, 0x00d8, %r25
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 5)
	.word 0xbfe54000  ! 3904: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e48000  ! 3905: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde5e04c  ! 3907: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_295:
	setx	0x3d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd351000  ! 3911: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xb5e4c000  ! 3914: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde4a091  ! 3915: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_158:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e4c000  ! 3920: SAVE_R	save	%r19, %r0, %r25
	.word 0xbd51c000  ! 3921: RDPR_TL	<illegal instruction>
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_296:
	setx	0x3f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e0a9  ! 3926: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_159:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1e4a11f  ! 3940: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_160:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_179:
	mov	0x2b, %r14
	.word 0xf2f38400  ! 3946: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_180:
	mov	0x0, %r14
	.word 0xf2f389e0  ! 3947: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e560f5  ! 3949: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_161:
	mov	0x1b, %r14
	.word 0xf0db8400  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_162:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 3955: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7346001  ! 3958: SRL_I	srl 	%r17, 0x0001, %r27
T0_asi_reg_rd_163:
	mov	0x3, %r14
	.word 0xfadb8e80  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_164:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 3962: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5e4c000  ! 3963: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbea5c000  ! 3969: SUBcc_R	subcc 	%r23, %r0, %r31
T0_asi_reg_rd_165:
	mov	0x2d, %r14
	.word 0xfadb89e0  ! 3972: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_166:
	mov	0x2c, %r14
	.word 0xf4db89e0  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb40c0000  ! 3984: AND_R	and 	%r16, %r0, %r26
	.word 0xbde4a158  ! 3985: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_167:
	mov	0xc, %r14
	.word 0xfadb8e80  ! 3987: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_181:
	mov	0x12, %r14
	.word 0xf2f384a0  ! 3992: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb3e420ea  ! 3995: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_297:
	setx	0x3d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_298:
	setx	0x3e0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_299:
	setx	0x3d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4009: SAVE_R	save	%r17, %r0, %r24
	.word 0xb49d0000  ! 4011: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xb1e4e027  ! 4013: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_300:
	setx	0x3e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4016: SAVE_R	save	%r21, %r0, %r27
	.word 0xbbe46146  ! 4017: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e58000  ! 4019: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb52d1000  ! 4021: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xb5e50000  ! 4023: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_301:
	setx	0x3c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a0b4  ! 4029: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde40000  ! 4036: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde50000  ! 4037: SAVE_R	save	%r20, %r0, %r30
	.word 0xbf2c3001  ! 4038: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0xb004c000  ! 4041: ADD_R	add 	%r19, %r0, %r24
cpu_intr_0_302:
	setx	0x3c0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4045: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_168:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 4046: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb3e4a08c  ! 4048: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e48000  ! 4050: SAVE_R	save	%r18, %r0, %r25
	.word 0xbbe5a01e  ! 4053: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e460d1  ! 4054: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_303:
	setx	0x3f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e4c000  ! 4069: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_304:
	setx	0x3d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb950c000  ! 4072: RDPR_TT	<illegal instruction>
	.word 0xb9e4c000  ! 4073: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_305:
	setx	0x3e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a0b3  ! 4076: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde420a5  ! 4078: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_182:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 4079: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e5e1a6  ! 4081: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe460a1  ! 4082: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e560d8  ! 4083: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_183:
	mov	0x2b, %r14
	.word 0xfaf389e0  ! 4084: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde4e191  ! 4086: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_184:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 4087: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbb2c0000  ! 4089: SLL_R	sll 	%r16, %r0, %r29
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_185:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 4094: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_169:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb0c44000  ! 4097: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xb1e48000  ! 4099: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_306:
	setx	0x3e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4103: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_307:
	setx	0x3c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_170:
	mov	0x1c, %r14
	.word 0xf4db8400  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_171:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 4110: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e54000  ! 4113: SAVE_R	save	%r21, %r0, %r24
	.word 0xbeb4e005  ! 4117: SUBCcc_I	orncc 	%r19, 0x0005, %r31
	.word 0xb845e144  ! 4122: ADDC_I	addc 	%r23, 0x0144, %r28
	.word 0xb1e4c000  ! 4123: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_308:
	setx	0x42013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561cc  ! 4126: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e48000  ! 4127: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e420b8  ! 4131: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_186:
	mov	0x15, %r14
	.word 0xfaf38e40  ! 4134: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e5c000  ! 4135: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e58000  ! 4142: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_309:
	setx	0x420111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_187:
	mov	0x5, %r14
	.word 0xfaf384a0  ! 4148: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb57c6401  ! 4149: MOVR_I	movre	%r17, 0x1, %r26
	.word 0xb4846088  ! 4150: ADDcc_I	addcc 	%r17, 0x0088, %r26
T0_asi_reg_rd_172:
	mov	0x14, %r14
	.word 0xfedb89e0  ! 4151: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_173:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_188:
	mov	0x36, %r14
	.word 0xfef38e60  ! 4154: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbf3c8000  ! 4155: SRA_R	sra 	%r18, %r0, %r31
cpu_intr_0_310:
	setx	0x410232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe5a000  ! 4159: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe46164  ! 4161: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_174:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 4162: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e4c000  ! 4167: SAVE_R	save	%r19, %r0, %r26
	.word 0xb3e4a1f6  ! 4171: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_311:
	setx	0x420104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0f3  ! 4176: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe58000  ! 4180: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e5a1c6  ! 4181: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_189:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 4184: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e4e0ed  ! 4185: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5215a  ! 4187: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e46085  ! 4190: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbc2c4000  ! 4194: ANDN_R	andn 	%r17, %r0, %r30
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_175:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 4197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe40000  ! 4198: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_312:
	setx	0x430237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 4200: SAVE_R	save	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e48000  ! 4203: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e5e061  ! 4204: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x899460e5  ! 4206: WRPR_TICK_I	wrpr	%r17, 0x00e5, %tick
	.word 0xb9e5a0c7  ! 4207: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_176:
	mov	0x26, %r14
	.word 0xf0db8e80  ! 4210: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7e5e097  ! 4212: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb32c9000  ! 4215: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xb9e461ba  ! 4216: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_177:
	mov	0x27, %r14
	.word 0xf0db89e0  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_313:
	setx	0x40023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5207a  ! 4224: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_190:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 4225: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 4227: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e4a08b  ! 4228: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_178:
	mov	0x10, %r14
	.word 0xf4db89e0  ! 4230: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde40000  ! 4235: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e44000  ! 4237: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e44000  ! 4238: SAVE_R	save	%r17, %r0, %r25
	.word 0xb844e086  ! 4239: ADDC_I	addc 	%r19, 0x0086, %r28
	.word 0xb62d0000  ! 4241: ANDN_R	andn 	%r20, %r0, %r27
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_314:
	setx	0x430227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46172  ! 4244: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e520f2  ! 4247: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e4c000  ! 4248: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde54000  ! 4251: SAVE_R	save	%r21, %r0, %r30
	.word 0xb9e54000  ! 4252: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_179:
	mov	0x31, %r14
	.word 0xfedb84a0  ! 4259: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbde420ab  ! 4261: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_191:
	mov	0x14, %r14
	.word 0xfef38e80  ! 4263: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_315:
	setx	0x410211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 4268: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_316:
	setx	0x400224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_180:
	mov	0x37, %r14
	.word 0xfadb8e60  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_317:
	setx	0x40000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 4282: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_181:
	mov	0x4, %r14
	.word 0xfadb8e80  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1e5a184  ! 4285: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_192:
	mov	0x15, %r14
	.word 0xfaf389e0  ! 4286: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb9e4e02b  ! 4287: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_193:
	mov	0x1d, %r14
	.word 0xfef389e0  ! 4293: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7e5a01d  ! 4296: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e5c000  ! 4302: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_318:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe560e1  ! 4316: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e4e1c2  ! 4318: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_194:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 4320: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_319:
	setx	0x400208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_320:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a033  ! 4326: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_182:
	mov	0x1c, %r14
	.word 0xf8db8e60  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb1e4e0e0  ! 4330: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_195:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 4331: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb6bde0b0  ! 4333: XNORcc_I	xnorcc 	%r23, 0x00b0, %r27
T0_asi_reg_rd_183:
	mov	0x4, %r14
	.word 0xfedb89e0  ! 4338: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_196:
	mov	0x8, %r14
	.word 0xf2f389e0  ! 4339: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe4c000  ! 4340: SAVE_R	save	%r19, %r0, %r29
	.word 0xbf34b001  ! 4344: SRLX_I	srlx	%r18, 0x0001, %r31
cpu_intr_0_321:
	setx	0x42013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_184:
	mov	0x30, %r14
	.word 0xfedb89e0  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_185:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde5c000  ! 4349: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde4216c  ! 4352: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4e07a  ! 4353: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_322:
	setx	0x43011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_323:
	setx	0x400222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93da001  ! 4359: SRA_I	sra 	%r22, 0x0001, %r28
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e54000  ! 4361: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_324:
	setx	0x400037, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_186:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfe5a1a3  ! 4372: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe4e050  ! 4373: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_197:
	mov	0x1e, %r14
	.word 0xf6f389e0  ! 4379: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_325:
	setx	0x41023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1d6  ! 4389: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e421d6  ! 4390: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_326:
	setx	0x420326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42183  ! 4392: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe4a055  ! 4394: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5a13b  ! 4395: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe4c000  ! 4399: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_327:
	setx	0x40000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb33d5000  ! 4403: SRAX_R	srax	%r21, %r0, %r25
T0_asi_reg_wr_198:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 4410: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1e40000  ! 4411: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_328:
	setx	0x410229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 4413: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde44000  ! 4414: SAVE_R	save	%r17, %r0, %r30
	.word 0xbbe44000  ! 4416: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_329:
	setx	0x410138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1f1  ! 4418: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_330:
	setx	0x41023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 4420: SAVE_R	save	%r16, %r0, %r31
	.word 0xbbe54000  ! 4421: SAVE_R	save	%r21, %r0, %r29
	.word 0xb635c000  ! 4422: ORN_R	orn 	%r23, %r0, %r27
T0_asi_reg_rd_187:
	mov	0x1, %r14
	.word 0xf4db8400  ! 4423: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_188:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_331:
	setx	0x420122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4435: SAVE_R	save	%r17, %r0, %r24
	.word 0xb29d8000  ! 4436: XORcc_R	xorcc 	%r22, %r0, %r25
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 38)
	.word 0xbde58000  ! 4442: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_189:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 4444: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e4c000  ! 4449: SAVE_R	save	%r19, %r0, %r27
	.word 0xb0044000  ! 4453: ADD_R	add 	%r17, %r0, %r24
T0_asi_reg_wr_199:
	mov	0x15, %r14
	.word 0xf2f38e80  ! 4454: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5613a  ! 4456: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e4a1b2  ! 4462: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_332:
	setx	0x410326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52037  ! 4464: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_190:
	mov	0x12, %r14
	.word 0xf6db8400  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3e42038  ! 4468: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e44000  ! 4476: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_333:
	setx	0x43032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0e2  ! 4483: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e46138  ! 4484: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_200:
	mov	0x26, %r14
	.word 0xfef389e0  ! 4487: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_334:
	setx	0x400230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_191:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 4492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_335:
	setx	0x43022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46194  ! 4495: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe520c2  ! 4503: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e54000  ! 4505: SAVE_R	save	%r21, %r0, %r28
	.word 0xb1e4c000  ! 4507: SAVE_R	save	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_192:
	mov	0x34, %r14
	.word 0xf4db8e60  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9e5205c  ! 4510: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e5a18c  ! 4511: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe58000  ! 4515: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e521ce  ! 4516: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb8b5e082  ! 4526: SUBCcc_I	orncc 	%r23, 0x0082, %r28
T0_asi_reg_wr_201:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 4527: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 6)
	.word 0xbfe40000  ! 4535: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde44000  ! 4536: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_202:
	mov	0xb, %r14
	.word 0xfaf38400  ! 4537: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_203:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 4542: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb7e58000  ! 4544: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_193:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_336:
	setx	0x43013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4551: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_337:
	setx	0x41000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_194:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 4554: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfe40000  ! 4560: SAVE_R	save	%r16, %r0, %r31
	.word 0xb0c4e011  ! 4561: ADDCcc_I	addccc 	%r19, 0x0011, %r24
cpu_intr_0_338:
	setx	0x410330, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_195:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_339:
	setx	0x420014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_196:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_197:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb03460a8  ! 4571: SUBC_I	orn 	%r17, 0x00a8, %r24
cpu_intr_0_340:
	setx	0x43032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb094c000  ! 4573: ORcc_R	orcc 	%r19, %r0, %r24
cpu_intr_0_341:
	setx	0x42012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9358000  ! 4575: SRL_R	srl 	%r22, %r0, %r28
cpu_intr_0_342:
	setx	0x470219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 4578: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_204:
	mov	0x1d, %r14
	.word 0xfcf38400  ! 4582: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbe44e0d7  ! 4583: ADDC_I	addc 	%r19, 0x00d7, %r31
	.word 0xb9e521b9  ! 4584: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_343:
	setx	0x440020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 4586: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a1b5  ! 4590: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe4601f  ! 4591: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e48000  ! 4592: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde48000  ! 4594: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e420a3  ! 4595: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e54000  ! 4596: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_344:
	setx	0x450236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4598: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe40000  ! 4603: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_198:
	mov	0x16, %r14
	.word 0xf2db8400  ! 4604: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_345:
	setx	0x440238, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_199:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e5e016  ! 4607: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe44000  ! 4614: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe44000  ! 4615: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_346:
	setx	0x46033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 4618: MOVcc_I	<illegal instruction>
T0_asi_reg_rd_200:
	mov	0x13, %r14
	.word 0xfedb8e60  ! 4624: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_347:
	setx	0x460039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_201:
	mov	0x1c, %r14
	.word 0xf8db8e80  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_348:
	setx	0x47011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_349:
	setx	0x440329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_202:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1510000  ! 4651: RDPR_TICK	<illegal instruction>
T0_asi_reg_wr_205:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 4652: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7480000  ! 4657: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
cpu_intr_0_350:
	setx	0x470136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 4659: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_351:
	setx	0x460331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_206:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 4669: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_203:
	mov	0x1e, %r14
	.word 0xfadb84a0  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_207:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 4675: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 0)
	.word 0xbbe4a060  ! 4678: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_352:
	setx	0x46010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42061  ! 4680: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e46119  ! 4682: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e4205d  ! 4684: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe54000  ! 4689: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_204:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_208:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 4692: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_353:
	setx	0x47002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe5a17c  ! 4696: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_354:
	setx	0x46003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1a0  ! 4702: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_205:
	mov	0x9, %r14
	.word 0xf2db8e60  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb734e001  ! 4704: SRL_I	srl 	%r19, 0x0001, %r27
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb3e5e088  ! 4708: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde54000  ! 4714: SAVE_R	save	%r21, %r0, %r30
	.word 0xb9e4215e  ! 4715: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_355:
	setx	0x47012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_206:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 4717: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_356:
	setx	0x470329, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_207:
	mov	0x2a, %r14
	.word 0xf2db8e40  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfe4a012  ! 4721: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_208:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb4b4c000  ! 4725: SUBCcc_R	orncc 	%r19, %r0, %r26
T0_asi_reg_wr_209:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 4727: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e50000  ! 4728: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_210:
	mov	0x31, %r14
	.word 0xf4f38400  ! 4736: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_357:
	setx	0x460215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e54000  ! 4742: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_358:
	setx	0x44023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 4744: SAVE_R	save	%r18, %r0, %r30
	.word 0xb9e48000  ! 4745: SAVE_R	save	%r18, %r0, %r28
	.word 0xb5e4e0d1  ! 4746: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e46008  ! 4747: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_209:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5e50000  ! 4753: SAVE_R	save	%r20, %r0, %r26
	.word 0xb6b54000  ! 4754: ORNcc_R	orncc 	%r21, %r0, %r27
T0_asi_reg_rd_210:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7e56130  ! 4761: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_359:
	setx	0x46001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_360:
	setx	0x450339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe461e3  ! 4766: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_211:
	mov	0x21, %r14
	.word 0xfef389e0  ! 4769: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_361:
	setx	0x45022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_212:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 4773: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_362:
	setx	0x45001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4778: SAVE_R	save	%r18, %r0, %r29
	.word 0xb23de19f  ! 4781: XNOR_I	xnor 	%r23, 0x019f, %r25
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_211:
	mov	0x21, %r14
	.word 0xf6db8e80  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e4e0b5  ! 4786: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb4b460d5  ! 4789: ORNcc_I	orncc 	%r17, 0x00d5, %r26
T0_asi_reg_wr_213:
	mov	0x1a, %r14
	.word 0xf8f384a0  ! 4792: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_363:
	setx	0x460109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_364:
	setx	0x44003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_212:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_365:
	setx	0x440107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_213:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe4c000  ! 4806: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_366:
	setx	0x440113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56166  ! 4808: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_214:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 4809: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfe52040  ! 4811: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 14)
	.word 0xbe348000  ! 4816: SUBC_R	orn 	%r18, %r0, %r31
T0_asi_reg_wr_215:
	mov	0x35, %r14
	.word 0xfaf38e60  ! 4818: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_rd_214:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 4820: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbfe5a16e  ! 4821: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_215:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb13d0000  ! 4823: SRA_R	sra 	%r20, %r0, %r24
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_216:
	mov	0x1, %r14
	.word 0xfaf384a0  ! 4826: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_367:
	setx	0x460300, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_217:
	mov	0x37, %r14
	.word 0xf6f389e0  ! 4829: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9641800  ! 4831: MOVcc_R	<illegal instruction>
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_368:
	setx	0x470205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba950000  ! 4836: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xb89c61fa  ! 4837: XORcc_I	xorcc 	%r17, 0x01fa, %r28
	.word 0xb0bc8000  ! 4838: XNORcc_R	xnorcc 	%r18, %r0, %r24
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_216:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbde50000  ! 4842: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_369:
	setx	0x44000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_218:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 4849: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_370:
	setx	0x440300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 33)
	.word 0xbbe58000  ! 4857: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_371:
	setx	0x470130, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_219:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 4862: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e4616a  ! 4864: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_217:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7e461b9  ! 4868: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4e0bc  ! 4870: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e54000  ! 4875: SAVE_R	save	%r21, %r0, %r27
	.word 0xb7e4e1b3  ! 4876: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4c000  ! 4882: SAVE_R	save	%r19, %r0, %r31
	.word 0xb7e58000  ! 4883: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e58000  ! 4884: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_218:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 4885: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb635202e  ! 4888: SUBC_I	orn 	%r20, 0x002e, %r27
	.word 0xb7e56134  ! 4891: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde52119  ! 4893: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e56046  ! 4894: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e5a1e4  ! 4896: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e5c000  ! 4899: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_372:
	setx	0x470226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_220:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 4901: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5e44000  ! 4903: SAVE_R	save	%r17, %r0, %r26
	.word 0x9195a0c8  ! 4910: WRPR_PIL_I	wrpr	%r22, 0x00c8, %pil
	.word 0x8994603e  ! 4912: WRPR_TICK_I	wrpr	%r17, 0x003e, %tick
cpu_intr_0_373:
	setx	0x470024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_374:
	setx	0x450321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 4920: RDPR_TNPC	<illegal instruction>
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, c)
	.word 0xb83d4000  ! 4924: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xb5e421e6  ! 4926: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_221:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 4927: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_222:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 4929: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xba8da08b  ! 4933: ANDcc_I	andcc 	%r22, 0x008b, %r29
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_223:
	mov	0x27, %r14
	.word 0xf4f38e80  ! 4938: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_wr_224:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 4940: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_375:
	setx	0x470004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 4943: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_376:
	setx	0x44033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e00d  ! 4949: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe4e0f1  ! 4951: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_225:
	mov	0x2c, %r14
	.word 0xfcf389e0  ! 4954: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_377:
	setx	0x470204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_378:
	setx	0x470131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 4958: SAVE_R	save	%r21, %r0, %r31
	.word 0xbeb5a10a  ! 4959: ORNcc_I	orncc 	%r22, 0x010a, %r31
	.word 0xb1e44000  ! 4960: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_379:
	setx	0x47023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_380:
	setx	0x440017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa50000  ! 4964: SUBcc_R	subcc 	%r20, %r0, %r29
	.word 0xb7e58000  ! 4965: SAVE_R	save	%r22, %r0, %r27
	.word 0xbb349000  ! 4966: SRLX_R	srlx	%r18, %r0, %r29
T0_asi_reg_wr_226:
	mov	0x26, %r14
	.word 0xfaf384a0  ! 4967: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_219:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e4a13f  ! 4971: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e5a16d  ! 4972: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_381:
	setx	0x440332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5605e  ! 4974: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_382:
	setx	0x470127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46050  ! 4976: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_383:
	setx	0x450007, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_220:
	mov	0x29, %r14
	.word 0xf6db84a0  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_227:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 4983: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbfe4208d  ! 4992: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_384:
	setx	0x47010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 4996: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_385:
	setx	0x460105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_221:
	mov	0x19, %r14
	.word 0xf4db84a0  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
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
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982fd0  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0xfea44020  ! 3: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
cpu_intr_3_0:
	setx	0x18030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_0:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 7: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf0240000  ! 9: STW_R	stw	%r24, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf4a52122  ! 13: STWA_I	stwa	%r26, [%r20 + 0x0122] %asi
	.word 0xf0adc020  ! 14: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xf0ada15e  ! 21: STBA_I	stba	%r24, [%r22 + 0x015e] %asi
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_1:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 26: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_0:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 31: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_1:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfa75e1be  ! 35: STX_I	stx	%r29, [%r23 + 0x01be]
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 15)
	.word 0xf874c000  ! 39: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xb63d8000  ! 42: XNOR_R	xnor 	%r22, %r0, %r27
T3_asi_reg_rd_2:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 43: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf0246105  ! 44: STW_I	stw	%r24, [%r17 + 0x0105]
cpu_intr_3_1:
	setx	0x1d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf225610f  ! 50: STW_I	stw	%r25, [%r21 + 0x010f]
	.word 0xf4346134  ! 54: STH_I	sth	%r26, [%r17 + 0x0134]
T3_asi_reg_rd_3:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_4:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 57: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf0a58020  ! 59: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2de098  ! 65: STB_I	stb	%r30, [%r23 + 0x0098]
	.word 0xfc25600a  ! 67: STW_I	stw	%r30, [%r21 + 0x000a]
	.word 0xfa748000  ! 70: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xfcac61ac  ! 75: STBA_I	stba	%r30, [%r17 + 0x01ac] %asi
	.word 0xfa75a003  ! 76: STX_I	stx	%r29, [%r22 + 0x0003]
	.word 0xf8a5a0c1  ! 78: STWA_I	stwa	%r28, [%r22 + 0x00c1] %asi
	.word 0xf8f4e049  ! 80: STXA_I	stxa	%r28, [%r19 + 0x0049] %asi
	.word 0xf0a50020  ! 81: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 19)
	.word 0xf4b5e0d8  ! 86: STHA_I	stha	%r26, [%r23 + 0x00d8] %asi
T3_asi_reg_rd_5:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 88: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_2:
	mov	0xa, %r14
	.word 0xfef38400  ! 90: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf8f5a144  ! 91: STXA_I	stxa	%r28, [%r22 + 0x0144] %asi
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_3:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 99: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf62c0000  ! 101: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xbec5a06e  ! 102: ADDCcc_I	addccc 	%r22, 0x006e, %r31
	.word 0xf275e16b  ! 103: STX_I	stx	%r25, [%r23 + 0x016b]
cpu_intr_3_2:
	setx	0x1f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_6:
	mov	0x15, %r14
	.word 0xf0db8e80  ! 112: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_3:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_4:
	mov	0x1a, %r14
	.word 0xfaf38e80  ! 117: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfaa421cb  ! 120: STWA_I	stwa	%r29, [%r16 + 0x01cb] %asi
	.word 0xb6944000  ! 122: ORcc_R	orcc 	%r17, %r0, %r27
T3_asi_reg_rd_7:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf02c4000  ! 128: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf425a184  ! 130: STW_I	stw	%r26, [%r22 + 0x0184]
	.word 0xfe24a17e  ! 131: STW_I	stw	%r31, [%r18 + 0x017e]
T3_asi_reg_rd_8:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb4ad4000  ! 135: ANDNcc_R	andncc 	%r21, %r0, %r26
cpu_intr_3_4:
	setx	0x1e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82420ee  ! 139: STW_I	stw	%r28, [%r16 + 0x00ee]
	.word 0xf43421e5  ! 140: STH_I	sth	%r26, [%r16 + 0x01e5]
	.word 0xfab5e140  ! 141: STHA_I	stha	%r29, [%r23 + 0x0140] %asi
	.word 0xbc958000  ! 142: ORcc_R	orcc 	%r22, %r0, %r30
T3_asi_reg_wr_5:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 143: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbf3ce001  ! 148: SRA_I	sra 	%r19, 0x0001, %r31
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983dd2  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd2, %hpstate
cpu_intr_3_5:
	setx	0x1c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0754000  ! 156: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xb29c60e3  ! 157: XORcc_I	xorcc 	%r17, 0x00e3, %r25
	.word 0xbb7c0400  ! 158: MOVR_R	movre	%r16, %r0, %r29
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 28)
	.word 0xfaa5e095  ! 161: STWA_I	stwa	%r29, [%r23 + 0x0095] %asi
cpu_intr_3_6:
	setx	0x1f012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0252125  ! 164: STW_I	stw	%r24, [%r20 + 0x0125]
	.word 0xb2b4617f  ! 165: ORNcc_I	orncc 	%r17, 0x017f, %r25
	.word 0xf02de154  ! 166: STB_I	stb	%r24, [%r23 + 0x0154]
T3_asi_reg_wr_6:
	mov	0x29, %r14
	.word 0xfef38e40  ! 168: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_7:
	mov	0x26, %r14
	.word 0xf0f384a0  ! 171: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8ad0020  ! 173: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	.word 0xf8ade094  ! 175: STBA_I	stba	%r28, [%r23 + 0x0094] %asi
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, e)
	.word 0xfc758000  ! 177: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_wr_8:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 181: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6250000  ! 182: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf82cc000  ! 184: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf4750000  ! 185: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xfc248000  ! 186: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xfca5a070  ! 187: STWA_I	stwa	%r30, [%r22 + 0x0070] %asi
	.word 0xfab5e1d1  ! 189: STHA_I	stha	%r29, [%r23 + 0x01d1] %asi
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 23)
	.word 0xf8f520e8  ! 193: STXA_I	stxa	%r28, [%r20 + 0x00e8] %asi
	.word 0xb6952015  ! 194: ORcc_I	orcc 	%r20, 0x0015, %r27
T3_asi_reg_rd_9:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, d)
	.word 0xb2840000  ! 200: ADDcc_R	addcc 	%r16, %r0, %r25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a08  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a08, %hpstate
	.word 0xfab42172  ! 206: STHA_I	stha	%r29, [%r16 + 0x0172] %asi
	.word 0xf82d2012  ! 208: STB_I	stb	%r28, [%r20 + 0x0012]
cpu_intr_3_7:
	setx	0x1f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34a001  ! 211: SRL_I	srl 	%r18, 0x0001, %r29
cpu_intr_3_8:
	setx	0x1d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_9:
	setx	0x1e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa521ef  ! 215: SUBcc_I	subcc 	%r20, 0x01ef, %r29
	.word 0xfca40020  ! 218: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_9:
	mov	0xd, %r14
	.word 0xf6f389e0  ! 221: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, e)
	.word 0xf4ad8020  ! 224: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xfc74e1c5  ! 225: STX_I	stx	%r30, [%r19 + 0x01c5]
T3_asi_reg_rd_10:
	mov	0x22, %r14
	.word 0xf6db89e0  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 24)
	.word 0xf424c000  ! 228: STW_R	stw	%r26, [%r19 + %r0]
cpu_intr_3_10:
	setx	0x1d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035210c  ! 236: STH_I	sth	%r24, [%r20 + 0x010c]
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 33)
	.word 0xf4b5213f  ! 238: STHA_I	stha	%r26, [%r20 + 0x013f] %asi
	.word 0xf83560cd  ! 239: STH_I	sth	%r28, [%r21 + 0x00cd]
	.word 0xbf3c7001  ! 241: SRAX_I	srax	%r17, 0x0001, %r31
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 23)
	.word 0xfa358000  ! 244: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf8b44020  ! 247: STHA_R	stha	%r28, [%r17 + %r0] 0x01
cpu_intr_3_11:
	setx	0x1f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf8a5e134  ! 250: STWA_I	stwa	%r28, [%r23 + 0x0134] %asi
	.word 0xf42521bd  ! 251: STW_I	stw	%r26, [%r20 + 0x01bd]
T3_asi_reg_wr_10:
	mov	0x7, %r14
	.word 0xfef38e40  ! 254: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfca58020  ! 256: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d92  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d92, %hpstate
	.word 0xf02dc000  ! 261: STB_R	stb	%r24, [%r23 + %r0]
cpu_intr_3_12:
	setx	0x1d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 268: STH_R	sth	%r24, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb58020  ! 271: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xf82c20c5  ! 274: STB_I	stb	%r28, [%r16 + 0x00c5]
T3_asi_reg_wr_11:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 275: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_13:
	setx	0x1f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982fd0  ! 277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0xfcf5e172  ! 278: STXA_I	stxa	%r30, [%r23 + 0x0172] %asi
cpu_intr_3_14:
	setx	0x1d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad2005  ! 280: STBA_I	stba	%r29, [%r20 + 0x0005] %asi
cpu_intr_3_15:
	setx	0x1c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_12:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 282: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_16:
	setx	0x1c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_11:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0x8394205c  ! 288: WRPR_TNPC_I	wrpr	%r16, 0x005c, %tnpc
	.word 0x8d94a060  ! 290: WRPR_PSTATE_I	wrpr	%r18, 0x0060, %pstate
	.word 0xfeb4c020  ! 292: STHA_R	stha	%r31, [%r19 + %r0] 0x01
cpu_intr_3_17:
	setx	0x1e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a50020  ! 302: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xfaacc020  ! 303: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf2258000  ! 308: STW_R	stw	%r25, [%r22 + %r0]
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf4ac61f3  ! 315: STBA_I	stba	%r26, [%r17 + 0x01f3] %asi
	.word 0xf82cc000  ! 316: STB_R	stb	%r28, [%r19 + %r0]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_TO_TL0
	.word 0xfa2c206e  ! 323: STB_I	stb	%r29, [%r16 + 0x006e]
	.word 0xfaa5c020  ! 324: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xb2c4a132  ! 326: ADDCcc_I	addccc 	%r18, 0x0132, %r25
T3_asi_reg_rd_12:
	mov	0x1f, %r14
	.word 0xf6db8e60  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf6ac8020  ! 329: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xf47560cd  ! 331: STX_I	stx	%r26, [%r21 + 0x00cd]
T3_asi_reg_wr_13:
	mov	0x1f, %r14
	.word 0xf6f38e40  ! 333: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_14:
	mov	0x10, %r14
	.word 0xf8f38e80  ! 334: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_13:
	mov	0x22, %r14
	.word 0xf8db8e60  ! 338: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2354000  ! 342: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf2b4e1a6  ! 346: STHA_I	stha	%r25, [%r19 + 0x01a6] %asi
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_18:
	setx	0x1f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa752086  ! 353: STX_I	stx	%r29, [%r20 + 0x0086]
cpu_intr_3_19:
	setx	0x1e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_15:
	mov	0x15, %r14
	.word 0xf2f38e80  ! 357: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_20:
	setx	0x1d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21c0000  ! 364: XOR_R	xor 	%r16, %r0, %r25
cpu_intr_3_21:
	setx	0x1f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2da0d4  ! 368: STB_I	stb	%r31, [%r22 + 0x00d4]
	.word 0xf0252056  ! 369: STW_I	stw	%r24, [%r20 + 0x0056]
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_22:
	setx	0x1f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_16:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 375: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_14:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_15:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_16:
	mov	0x12, %r14
	.word 0xfedb8e60  ! 383: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_17:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf42de12e  ! 387: STB_I	stb	%r26, [%r23 + 0x012e]
	.word 0xf42cc000  ! 388: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xb6ac4000  ! 389: ANDNcc_R	andncc 	%r17, %r0, %r27
	.word 0xf4b5c020  ! 390: STHA_R	stha	%r26, [%r23 + %r0] 0x01
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_17:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 395: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfeb521d0  ! 398: STHA_I	stha	%r31, [%r20 + 0x01d0] %asi
T3_asi_reg_rd_18:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb8b4e0e2  ! 400: ORNcc_I	orncc 	%r19, 0x00e2, %r28
cpu_intr_3_23:
	setx	0x1d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 24)
	.word 0xfaf561a5  ! 404: STXA_I	stxa	%r29, [%r21 + 0x01a5] %asi
	.word 0xf0740000  ! 407: STX_R	stx	%r24, [%r16 + %r0]
T3_asi_reg_wr_18:
	mov	0x31, %r14
	.word 0xf0f384a0  ! 408: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_24:
	setx	0x1e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c4000  ! 412: SLL_R	sll 	%r17, %r0, %r31
cpu_intr_3_25:
	setx	0x1e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0250000  ! 416: SUB_R	sub 	%r20, %r0, %r24
	.word 0x8d95e1a5  ! 419: WRPR_PSTATE_I	wrpr	%r23, 0x01a5, %pstate
	.word 0xf07561d2  ! 421: STX_I	stx	%r24, [%r21 + 0x01d2]
	ta	T_CHANGE_HPRIV
	.word 0xf824e111  ! 425: STW_I	stw	%r28, [%r19 + 0x0111]
	.word 0xf2b40020  ! 426: STHA_R	stha	%r25, [%r16 + %r0] 0x01
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_19:
	mov	0x1c, %r14
	.word 0xf0f38e40  ! 428: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_19:
	mov	0x16, %r14
	.word 0xfadb84a0  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb57c6401  ! 432: MOVR_I	movre	%r17, 0x1, %r26
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, c)
	.word 0xbf345000  ! 440: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xfc354000  ! 443: STH_R	sth	%r30, [%r21 + %r0]
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 35)
	.word 0xfe2d8000  ! 446: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xfcac0020  ! 448: STBA_R	stba	%r30, [%r16 + %r0] 0x01
cpu_intr_3_26:
	setx	0x210018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_20:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 8)
	.word 0xfeadc020  ! 456: STBA_R	stba	%r31, [%r23 + %r0] 0x01
	.word 0xfcb52166  ! 458: STHA_I	stha	%r30, [%r20 + 0x0166] %asi
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
cpu_intr_3_27:
	setx	0x21023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_28:
	setx	0x210324, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_20:
	mov	0xc, %r14
	.word 0xf2f38e80  ! 466: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_21:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 467: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_22:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_23:
	mov	0x30, %r14
	.word 0xfedb8400  ! 474: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfa75c000  ! 475: STX_R	stx	%r29, [%r23 + %r0]
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf2f420d8  ! 477: STXA_I	stxa	%r25, [%r16 + 0x00d8] %asi
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_29:
	setx	0x23001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf6ad8020  ! 481: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xb0c58000  ! 485: ADDCcc_R	addccc 	%r22, %r0, %r24
T3_asi_reg_rd_24:
	mov	0x32, %r14
	.word 0xf8db8e60  ! 486: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf02dc000  ! 492: STB_R	stb	%r24, [%r23 + %r0]
cpu_intr_3_30:
	setx	0x23021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_31:
	setx	0x200037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaade137  ! 495: STBA_I	stba	%r29, [%r23 + 0x0137] %asi
	.word 0xb2bd2046  ! 497: XNORcc_I	xnorcc 	%r20, 0x0046, %r25
	.word 0xf8b46096  ! 499: STHA_I	stha	%r28, [%r17 + 0x0096] %asi
	.word 0xf4348000  ! 500: STH_R	sth	%r26, [%r18 + %r0]
cpu_intr_3_32:
	setx	0x23031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_33:
	setx	0x210325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 507: STW_R	stw	%r29, [%r23 + %r0]
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e02  ! 508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e02, %hpstate
	.word 0xfc2c0000  ! 511: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfe2d60b7  ! 513: STB_I	stb	%r31, [%r21 + 0x00b7]
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_34:
	setx	0x22013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_35:
	setx	0x200325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac0020  ! 519: STBA_R	stba	%r26, [%r16 + %r0] 0x01
cpu_intr_3_36:
	setx	0x20001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4752050  ! 524: STX_I	stx	%r26, [%r20 + 0x0050]
	.word 0xf4350000  ! 529: STH_R	sth	%r26, [%r20 + %r0]
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb4358000  ! 531: SUBC_R	orn 	%r22, %r0, %r26
	.word 0xf2754000  ! 532: STX_R	stx	%r25, [%r21 + %r0]
T3_asi_reg_rd_25:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 533: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, d)
	.word 0xb40d8000  ! 535: AND_R	and 	%r22, %r0, %r26
cpu_intr_3_37:
	setx	0x22001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62dc000  ! 538: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xb2248000  ! 539: SUB_R	sub 	%r18, %r0, %r25
	.word 0x8195e083  ! 540: WRPR_TPC_I	wrpr	%r23, 0x0083, %tpc
	.word 0xf22421e9  ! 541: STW_I	stw	%r25, [%r16 + 0x01e9]
T3_asi_reg_rd_26:
	mov	0x12, %r14
	.word 0xfadb89e0  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 3b)
	.word 0x919521ca  ! 547: WRPR_PIL_I	wrpr	%r20, 0x01ca, %pil
cpu_intr_3_38:
	setx	0x23013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_27:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf02c0000  ! 557: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xfab44020  ! 558: STHA_R	stha	%r29, [%r17 + %r0] 0x01
cpu_intr_3_39:
	setx	0x21000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d6198  ! 566: STB_I	stb	%r31, [%r21 + 0x0198]
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_40:
	setx	0x21012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5e06e  ! 569: STHA_I	stha	%r26, [%r23 + 0x006e] %asi
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_41:
	setx	0x23012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac8020  ! 578: STBA_R	stba	%r29, [%r18 + %r0] 0x01
cpu_intr_3_42:
	setx	0x21001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc5617c  ! 580: ADDCcc_I	addccc 	%r21, 0x017c, %r30
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_28:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf2f52101  ! 590: STXA_I	stxa	%r25, [%r20 + 0x0101] %asi
	.word 0xfe2dc000  ! 591: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xbf7d4400  ! 592: MOVR_R	movre	%r21, %r0, %r31
	.word 0xf234e1c3  ! 593: STH_I	sth	%r25, [%r19 + 0x01c3]
	.word 0xfcad8020  ! 595: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xf074e1d5  ! 596: STX_I	stx	%r24, [%r19 + 0x01d5]
	.word 0xbabc6069  ! 597: XNORcc_I	xnorcc 	%r17, 0x0069, %r29
cpu_intr_3_43:
	setx	0x20033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_21:
	mov	0xc, %r14
	.word 0xfcf389e0  ! 599: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf8258000  ! 600: STW_R	stw	%r28, [%r22 + %r0]
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 27)
	.word 0xb82d0000  ! 603: ANDN_R	andn 	%r20, %r0, %r28
	.word 0xfa75e045  ! 604: STX_I	stx	%r29, [%r23 + 0x0045]
	ta	T_CHANGE_HPRIV
	.word 0xf8b4a1f3  ! 606: STHA_I	stha	%r28, [%r18 + 0x01f3] %asi
	.word 0xf6b54020  ! 607: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	.word 0xb2b46003  ! 612: SUBCcc_I	orncc 	%r17, 0x0003, %r25
	.word 0xfcf5a01a  ! 616: STXA_I	stxa	%r30, [%r22 + 0x001a] %asi
T3_asi_reg_wr_22:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 621: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb404a0f7  ! 622: ADD_I	add 	%r18, 0x00f7, %r26
	.word 0xfe358000  ! 623: STH_R	sth	%r31, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf4a40020  ! 630: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf4ade0a3  ! 631: STBA_I	stba	%r26, [%r23 + 0x00a3] %asi
	.word 0xf22d0000  ! 632: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf0354000  ! 633: STH_R	sth	%r24, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_29:
	mov	0x35, %r14
	.word 0xfcdb8e80  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_wr_23:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 640: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_30:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 641: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_44:
	setx	0x210333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d4000  ! 645: STB_R	stb	%r28, [%r21 + %r0]
T3_asi_reg_wr_24:
	mov	0x2c, %r14
	.word 0xf2f38400  ! 646: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf6a4a0d6  ! 650: STWA_I	stwa	%r27, [%r18 + 0x00d6] %asi
	.word 0xf8b42090  ! 651: STHA_I	stha	%r28, [%r16 + 0x0090] %asi
cpu_intr_3_45:
	setx	0x22023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 37)
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
	.word 0xfcf5e131  ! 658: STXA_I	stxa	%r30, [%r23 + 0x0131] %asi
cpu_intr_3_46:
	setx	0x22023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_25:
	mov	0x19, %r14
	.word 0xf2f384a0  ! 660: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_26:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 664: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, d)
	.word 0xf42de19d  ! 669: STB_I	stb	%r26, [%r23 + 0x019d]
	.word 0xbeb5a1e2  ! 671: ORNcc_I	orncc 	%r22, 0x01e2, %r31
	.word 0xb6b40000  ! 675: SUBCcc_R	orncc 	%r16, %r0, %r27
cpu_intr_3_47:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_48:
	setx	0x21021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 13)
	.word 0xf82c8000  ! 682: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xfe748000  ! 683: STX_R	stx	%r31, [%r18 + %r0]
cpu_intr_3_49:
	setx	0x230114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12dc000  ! 686: SLL_R	sll 	%r23, %r0, %r24
T3_asi_reg_wr_27:
	mov	0x29, %r14
	.word 0xfcf38e60  ! 687: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_28:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 689: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 693: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6344000  ! 696: STH_R	sth	%r27, [%r17 + %r0]
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_50:
	setx	0x210023, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_30:
	mov	0xa, %r14
	.word 0xf8f384a0  ! 699: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_51:
	setx	0x220002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6340000  ! 702: STH_R	sth	%r27, [%r16 + %r0]
T3_asi_reg_wr_31:
	mov	0x14, %r14
	.word 0xf6f38e60  ! 703: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 30)
	.word 0xf2a58020  ! 705: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_32:
	mov	0x0, %r14
	.word 0xf6f38e80  ! 707: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_31:
	mov	0xb, %r14
	.word 0xf2db8e80  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfc344000  ! 711: STH_R	sth	%r30, [%r17 + %r0]
cpu_intr_3_52:
	setx	0x200224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_33:
	mov	0x1b, %r14
	.word 0xf0f38e60  ! 718: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5518000  ! 721: RDPR_PSTATE	rdpr	%pstate, %r26
T3_asi_reg_rd_32:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_33:
	mov	0x32, %r14
	.word 0xf6db8400  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8740000  ! 727: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfc750000  ! 729: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xb97c8400  ! 730: MOVR_R	movre	%r18, %r0, %r28
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_34:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 732: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_rd_35:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_53:
	setx	0x23023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_34:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 738: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf035a0df  ! 742: STH_I	sth	%r24, [%r22 + 0x00df]
T3_asi_reg_wr_35:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 743: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_36:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf8342154  ! 745: STH_I	sth	%r28, [%r16 + 0x0154]
	.word 0xfca5c020  ! 746: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xb4b5c000  ! 749: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xfc348000  ! 751: STH_R	sth	%r30, [%r18 + %r0]
T3_asi_reg_wr_36:
	mov	0x8, %r14
	.word 0xf4f38e40  ! 752: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8358000  ! 756: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf0340000  ! 760: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf8f4a1bc  ! 761: STXA_I	stxa	%r28, [%r18 + 0x01bc] %asi
	.word 0xf8a48020  ! 762: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xfe356024  ! 766: STH_I	sth	%r31, [%r21 + 0x0024]
	.word 0xfea56030  ! 768: STWA_I	stwa	%r31, [%r21 + 0x0030] %asi
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, e)
	.word 0xb035a032  ! 772: SUBC_I	orn 	%r22, 0x0032, %r24
	.word 0xfcb4e00e  ! 774: STHA_I	stha	%r30, [%r19 + 0x000e] %asi
	.word 0xb2c54000  ! 775: ADDCcc_R	addccc 	%r21, %r0, %r25
T3_asi_reg_wr_37:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 778: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfcac2010  ! 780: STBA_I	stba	%r30, [%r16 + 0x0010] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_54:
	setx	0x21033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824a07a  ! 786: STW_I	stw	%r28, [%r18 + 0x007a]
	.word 0xbf3cf001  ! 787: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0xfa750000  ! 788: STX_R	stx	%r29, [%r20 + %r0]
T3_asi_reg_wr_38:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 793: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_55:
	setx	0x230007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2b48020  ! 799: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0xf82c6168  ! 800: STB_I	stb	%r28, [%r17 + 0x0168]
	.word 0xf0f4e09c  ! 801: STXA_I	stxa	%r24, [%r19 + 0x009c] %asi
	.word 0xbe25e1a5  ! 802: SUB_I	sub 	%r23, 0x01a5, %r31
cpu_intr_3_56:
	setx	0x200215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0154000  ! 804: OR_R	or 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf42de027  ! 808: STB_I	stb	%r26, [%r23 + 0x0027]
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 11)
	.word 0xb92c8000  ! 818: SLL_R	sll 	%r18, %r0, %r28
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_57:
	setx	0x210335, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_37:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba0c4000  ! 829: AND_R	and 	%r17, %r0, %r29
cpu_intr_3_58:
	setx	0x220206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 28)
	.word 0xf62560dc  ! 837: STW_I	stw	%r27, [%r21 + 0x00dc]
T3_asi_reg_wr_39:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 838: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfe740000  ! 839: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xfe35e0a9  ! 840: STH_I	sth	%r31, [%r23 + 0x00a9]
	ta	T_CHANGE_HPRIV
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 12)
	.word 0xf024a0b4  ! 844: STW_I	stw	%r24, [%r18 + 0x00b4]
cpu_intr_3_59:
	setx	0x200122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 15)
	.word 0xf0740000  ! 847: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xfc2d8000  ! 849: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfcf42006  ! 855: STXA_I	stxa	%r30, [%r16 + 0x0006] %asi
T3_asi_reg_wr_40:
	mov	0xa, %r14
	.word 0xf8f38e80  ! 857: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 36)
	.word 0xf02ca1af  ! 861: STB_I	stb	%r24, [%r18 + 0x01af]
T3_asi_reg_rd_38:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 862: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbaa5c000  ! 866: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xb92de001  ! 867: SLL_I	sll 	%r23, 0x0001, %r28
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_39:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 874: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb551c000  ! 881: RDPR_TL	<illegal instruction>
T3_asi_reg_rd_40:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_60:
	setx	0x210130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c8000  ! 885: STB_R	stb	%r25, [%r18 + %r0]
cpu_intr_3_61:
	setx	0x270330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02dc000  ! 894: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf8ace0a4  ! 897: STBA_I	stba	%r28, [%r19 + 0x00a4] %asi
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 14)
	.word 0xbe3d6092  ! 899: XNOR_I	xnor 	%r21, 0x0092, %r31
cpu_intr_3_62:
	setx	0x270337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 905: RDPR_TSTATE	<illegal instruction>
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_41:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 909: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6ac2152  ! 912: STBA_I	stba	%r27, [%r16 + 0x0152] %asi
cpu_intr_3_63:
	setx	0x24022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c4e053  ! 914: ADDCcc_I	addccc 	%r19, 0x0053, %r24
	.word 0xf2b4a103  ! 915: STHA_I	stha	%r25, [%r18 + 0x0103] %asi
	.word 0xfe74603d  ! 916: STX_I	stx	%r31, [%r17 + 0x003d]
T3_asi_reg_wr_42:
	mov	0x35, %r14
	.word 0xf4f389e0  ! 917: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf4246044  ! 923: STW_I	stw	%r26, [%r17 + 0x0044]
	.word 0xf6a4a137  ! 925: STWA_I	stwa	%r27, [%r18 + 0x0137] %asi
cpu_intr_3_64:
	setx	0x25011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9461da  ! 927: WRPR_PSTATE_I	wrpr	%r17, 0x01da, %pstate
T3_asi_reg_wr_43:
	mov	0x26, %r14
	.word 0xf4f389e0  ! 928: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_44:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 930: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_65:
	setx	0x260213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a48020  ! 935: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, c)
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 10)
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983aca  ! 940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1aca, %hpstate
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_45:
	mov	0x24, %r14
	.word 0xfcf38400  ! 942: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 16)
	.word 0xfa74a0e5  ! 945: STX_I	stx	%r29, [%r18 + 0x00e5]
cpu_intr_3_66:
	setx	0x270310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 948: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf0258000  ! 949: STW_R	stw	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf6f4e036  ! 955: STXA_I	stxa	%r27, [%r19 + 0x0036] %asi
cpu_intr_3_67:
	setx	0x26033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad0020  ! 957: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xb834a077  ! 961: ORN_I	orn 	%r18, 0x0077, %r28
T3_asi_reg_wr_46:
	mov	0x26, %r14
	.word 0xfef38e60  ! 962: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe2cc000  ! 965: STB_R	stb	%r31, [%r19 + %r0]
cpu_intr_3_68:
	setx	0x270011, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0x25, %r14
	.word 0xfef389e0  ! 969: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf8b5e06f  ! 971: STHA_I	stha	%r28, [%r23 + 0x006f] %asi
	.word 0xbc34c000  ! 973: ORN_R	orn 	%r19, %r0, %r30
	.word 0xf23420ee  ! 974: STH_I	sth	%r25, [%r16 + 0x00ee]
	.word 0xb0acc000  ! 975: ANDNcc_R	andncc 	%r19, %r0, %r24
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 5)
	.word 0xb02c6015  ! 978: ANDN_I	andn 	%r17, 0x0015, %r24
T3_asi_reg_rd_41:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_48:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 980: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0x8194e18e  ! 986: WRPR_TPC_I	wrpr	%r19, 0x018e, %tpc
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, b)
	.word 0xf2342183  ! 988: STH_I	sth	%r25, [%r16 + 0x0183]
	.word 0xfc740000  ! 990: STX_R	stx	%r30, [%r16 + %r0]
cpu_intr_3_69:
	setx	0x240220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24c000  ! 992: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf6754000  ! 993: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf23521d6  ! 994: STH_I	sth	%r25, [%r20 + 0x01d6]
T3_asi_reg_rd_42:
	mov	0x5, %r14
	.word 0xf2db8e60  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfa2420c1  ! 996: STW_I	stw	%r29, [%r16 + 0x00c1]
T3_asi_reg_rd_43:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf2b5e067  ! 998: STHA_I	stha	%r25, [%r23 + 0x0067] %asi
	.word 0x8395e077  ! 999: WRPR_TNPC_I	wrpr	%r23, 0x0077, %tnpc
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_70:
	setx	0x3001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33da001  ! 1005: SRA_I	sra 	%r22, 0x0001, %r25
cpu_intr_3_71:
	setx	0x270121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35e018  ! 1008: STH_I	sth	%r29, [%r23 + 0x0018]
	.word 0xfca5608b  ! 1009: STWA_I	stwa	%r30, [%r21 + 0x008b] %asi
	.word 0xf2a461ea  ! 1010: STWA_I	stwa	%r25, [%r17 + 0x01ea] %asi
cpu_intr_3_72:
	setx	0x24012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_73:
	setx	0x24013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_44:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 1021: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf8f46013  ! 1022: STXA_I	stxa	%r28, [%r17 + 0x0013] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_49:
	mov	0x24, %r14
	.word 0xf4f384a0  ! 1024: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_50:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 1027: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_74:
	setx	0x270331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac8020  ! 1032: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xfcb46151  ! 1034: STHA_I	stha	%r30, [%r17 + 0x0151] %asi
	.word 0xfea58020  ! 1036: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf2a46199  ! 1038: STWA_I	stwa	%r25, [%r17 + 0x0199] %asi
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_45:
	mov	0x1b, %r14
	.word 0xf0db8400  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf0340000  ! 1043: STH_R	sth	%r24, [%r16 + %r0]
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_46:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 1047: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbd3c8000  ! 1049: SRA_R	sra 	%r18, %r0, %r30
	.word 0xf0248000  ! 1050: STW_R	stw	%r24, [%r18 + %r0]
cpu_intr_3_75:
	setx	0x27012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 35)
	.word 0xf0ada037  ! 1056: STBA_I	stba	%r24, [%r22 + 0x0037] %asi
cpu_intr_3_76:
	setx	0x250238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b44020  ! 1061: STHA_R	stha	%r25, [%r17 + %r0] 0x01
	.word 0xf22d6006  ! 1062: STB_I	stb	%r25, [%r21 + 0x0006]
T3_asi_reg_wr_51:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1063: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_77:
	setx	0x270009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_78:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa58020  ! 1069: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
T3_asi_reg_wr_52:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 1071: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfc24c000  ! 1073: STW_R	stw	%r30, [%r19 + %r0]
T3_asi_reg_rd_47:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_79:
	setx	0x24023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_53:
	mov	0x30, %r14
	.word 0xf8f38e40  ! 1081: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_80:
	setx	0x26000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad2059  ! 1086: STBA_I	stba	%r28, [%r20 + 0x0059] %asi
	.word 0xf4b58020  ! 1087: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf42ce16e  ! 1089: STB_I	stb	%r26, [%r19 + 0x016e]
T3_asi_reg_wr_54:
	mov	0x1f, %r14
	.word 0xfaf38e80  ! 1091: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_55:
	mov	0x3, %r14
	.word 0xf0f389e0  ! 1094: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_48:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 10)
	.word 0xbcc54000  ! 1098: ADDCcc_R	addccc 	%r21, %r0, %r30
cpu_intr_3_81:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_56:
	mov	0xe, %r14
	.word 0xf2f38e80  ! 1102: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
	.word 0xb01de1c0  ! 1107: XOR_I	xor 	%r23, 0x01c0, %r24
	.word 0xbc05a19a  ! 1110: ADD_I	add 	%r22, 0x019a, %r30
	.word 0xf4258000  ! 1111: STW_R	stw	%r26, [%r22 + %r0]
cpu_intr_3_82:
	setx	0x240332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_57:
	mov	0xe, %r14
	.word 0xfcf38e60  ! 1116: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xfa240000  ! 1128: STW_R	stw	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b5c020  ! 1131: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	.word 0xf8a5209a  ! 1134: STWA_I	stwa	%r28, [%r20 + 0x009a] %asi
	.word 0xf0aca076  ! 1136: STBA_I	stba	%r24, [%r18 + 0x0076] %asi
	.word 0xf674e1d4  ! 1138: STX_I	stx	%r27, [%r19 + 0x01d4]
T3_asi_reg_wr_58:
	mov	0x2c, %r14
	.word 0xfcf389e0  ! 1139: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf435a1ca  ! 1140: STH_I	sth	%r26, [%r22 + 0x01ca]
	ta	T_CHANGE_HPRIV
cpu_intr_3_83:
	setx	0x240215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 1146: MOVcc_R	<illegal instruction>
	.word 0xf4a48020  ! 1148: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 28)
	.word 0xf2250000  ! 1156: STW_R	stw	%r25, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf275216f  ! 1160: STX_I	stx	%r25, [%r20 + 0x016f]
cpu_intr_3_84:
	setx	0x26031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_49:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_59:
	mov	0x5, %r14
	.word 0xfcf38e80  ! 1167: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfc2d6076  ! 1171: STB_I	stb	%r30, [%r21 + 0x0076]
	.word 0xf8a48020  ! 1173: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
cpu_intr_3_85:
	setx	0x26020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaace05f  ! 1176: STBA_I	stba	%r29, [%r19 + 0x005f] %asi
	.word 0xf0ac0020  ! 1177: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xf8b40020  ! 1178: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfeb5a118  ! 1180: STHA_I	stha	%r31, [%r22 + 0x0118] %asi
cpu_intr_3_86:
	setx	0x27001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0356197  ! 1184: STH_I	sth	%r24, [%r21 + 0x0197]
	.word 0xf0a5a077  ! 1185: STWA_I	stwa	%r24, [%r22 + 0x0077] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2a54020  ! 1188: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf62d4000  ! 1189: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf2a5c020  ! 1190: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
cpu_intr_3_87:
	setx	0x26013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_60:
	mov	0x21, %r14
	.word 0xfef38e60  ! 1194: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf62c8000  ! 1196: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfa350000  ! 1198: STH_R	sth	%r29, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 33)
	.word 0xfcaca19c  ! 1204: STBA_I	stba	%r30, [%r18 + 0x019c] %asi
	.word 0xf6f5a174  ! 1205: STXA_I	stxa	%r27, [%r22 + 0x0174] %asi
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_61:
	mov	0x5, %r14
	.word 0xfef384a0  ! 1210: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4b40020  ! 1212: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xba3460d3  ! 1215: SUBC_I	orn 	%r17, 0x00d3, %r29
T3_asi_reg_rd_50:
	mov	0x21, %r14
	.word 0xfadb8e60  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf2ada144  ! 1217: STBA_I	stba	%r25, [%r22 + 0x0144] %asi
cpu_intr_3_88:
	setx	0x260014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_89:
	setx	0x270117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3dc000  ! 1220: SRA_R	sra 	%r23, %r0, %r31
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 28)
	.word 0x8f902000  ! 1226: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T3_asi_reg_rd_51:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfea56106  ! 1231: STWA_I	stwa	%r31, [%r21 + 0x0106] %asi
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb0048000  ! 1237: ADD_R	add 	%r18, %r0, %r24
T3_asi_reg_rd_52:
	mov	0x25, %r14
	.word 0xf0db8e40  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, f)
	.word 0xfc758000  ! 1243: STX_R	stx	%r30, [%r22 + %r0]
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e9a  ! 1244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9a, %hpstate
T3_asi_reg_wr_62:
	mov	0xd, %r14
	.word 0xfcf38400  ! 1247: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfcb54020  ! 1248: STHA_R	stha	%r30, [%r21 + %r0] 0x01
T3_asi_reg_wr_63:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 1249: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_53:
	mov	0x2c, %r14
	.word 0xf0db84a0  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5504000  ! 1256: RDPR_TNPC	rdpr	%tnpc, %r26
cpu_intr_3_90:
	setx	0x24031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_91:
	setx	0x270039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 10)
	.word 0xb6bc0000  ! 1265: XNORcc_R	xnorcc 	%r16, %r0, %r27
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 38)
	.word 0xb22ce019  ! 1268: ANDN_I	andn 	%r19, 0x0019, %r25
T3_asi_reg_wr_64:
	mov	0xb, %r14
	.word 0xf0f38e60  ! 1269: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_92:
	setx	0x25002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_54:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf8b5c020  ! 1281: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_93:
	setx	0x250203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2cc000  ! 1284: STB_R	stb	%r30, [%r19 + %r0]
T3_asi_reg_wr_65:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 1285: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5344000  ! 1287: SRL_R	srl 	%r17, %r0, %r26
cpu_intr_3_94:
	setx	0x27023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6452067  ! 1291: ADDC_I	addc 	%r20, 0x0067, %r27
T3_asi_reg_rd_55:
	mov	0x37, %r14
	.word 0xf8db89e0  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_rd_56:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf42d0000  ! 1297: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf4250000  ! 1298: STW_R	stw	%r26, [%r20 + %r0]
cpu_intr_3_95:
	setx	0x26031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 0)
	.word 0xfaad6090  ! 1305: STBA_I	stba	%r29, [%r21 + 0x0090] %asi
T3_asi_reg_wr_66:
	mov	0x21, %r14
	.word 0xf6f384a0  ! 1307: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb73de001  ! 1308: SRA_I	sra 	%r23, 0x0001, %r27
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_57:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 1311: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7510000  ! 1313: RDPR_TICK	<illegal instruction>
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_96:
	setx	0x240026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_58:
	mov	0xb, %r14
	.word 0xf8db84a0  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_59:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_97:
	setx	0x270124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_98:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_61:
	mov	0x10, %r14
	.word 0xf0db8400  ! 1329: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb8b4c000  ! 1332: SUBCcc_R	orncc 	%r19, %r0, %r28
T3_asi_reg_rd_62:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf675219d  ! 1335: STX_I	stx	%r27, [%r20 + 0x019d]
cpu_intr_3_99:
	setx	0x250326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 1339: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb435a1e0  ! 1340: ORN_I	orn 	%r22, 0x01e0, %r26
	.word 0xf4a5e06c  ! 1342: STWA_I	stwa	%r26, [%r23 + 0x006c] %asi
T3_asi_reg_wr_67:
	mov	0x17, %r14
	.word 0xf8f389e0  ! 1345: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf42d0000  ! 1346: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf6244000  ! 1348: STW_R	stw	%r27, [%r17 + %r0]
cpu_intr_3_100:
	setx	0x250006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_101:
	setx	0x270207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22da147  ! 1355: STB_I	stb	%r25, [%r22 + 0x0147]
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 24)
	.word 0xb2858000  ! 1358: ADDcc_R	addcc 	%r22, %r0, %r25
cpu_intr_3_102:
	setx	0x2a0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4615c  ! 1363: STWA_I	stwa	%r24, [%r17 + 0x015c] %asi
T3_asi_reg_rd_63:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 23)
	.word 0xfeb58020  ! 1369: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xf0a4e035  ! 1371: STWA_I	stwa	%r24, [%r19 + 0x0035] %asi
	.word 0xb97d8400  ! 1372: MOVR_R	movre	%r22, %r0, %r28
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_103:
	setx	0x2a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_68:
	mov	0x12, %r14
	.word 0xfaf38e80  ! 1375: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_104:
	setx	0x2a0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_69:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 1377: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_70:
	mov	0x29, %r14
	.word 0xf4f389e0  ! 1379: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_71:
	mov	0x19, %r14
	.word 0xf2f38e60  ! 1380: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfcf5a07d  ! 1381: STXA_I	stxa	%r30, [%r22 + 0x007d] %asi
cpu_intr_3_105:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_72:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 1384: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf275219c  ! 1385: STX_I	stx	%r25, [%r20 + 0x019c]
T3_asi_reg_wr_73:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 1386: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_64:
	mov	0x1e, %r14
	.word 0xf8db89e0  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_106:
	setx	0x29010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf83520a8  ! 1394: STH_I	sth	%r28, [%r20 + 0x00a8]
	.word 0xfa754000  ! 1395: STX_R	stx	%r29, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_74:
	mov	0x34, %r14
	.word 0xfaf384a0  ! 1397: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfcb48020  ! 1398: STHA_R	stha	%r30, [%r18 + %r0] 0x01
cpu_intr_3_107:
	setx	0x290110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8acc020  ! 1401: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xf6ac8020  ! 1404: STBA_R	stba	%r27, [%r18 + %r0] 0x01
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_65:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 1408: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf82d21b2  ! 1411: STB_I	stb	%r28, [%r20 + 0x01b2]
	.word 0xfea561db  ! 1412: STWA_I	stwa	%r31, [%r21 + 0x01db] %asi
T3_asi_reg_rd_66:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb434e11e  ! 1423: SUBC_I	orn 	%r19, 0x011e, %r26
cpu_intr_3_108:
	setx	0x2a013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_75:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 1425: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb4458000  ! 1428: ADDC_R	addc 	%r22, %r0, %r26
T3_asi_reg_wr_76:
	mov	0x2c, %r14
	.word 0xf8f38e60  ! 1431: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_67:
	mov	0xc, %r14
	.word 0xfedb8e80  ! 1433: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_68:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 1434: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbf7c4400  ! 1435: MOVR_R	movre	%r17, %r0, %r31
T3_asi_reg_rd_69:
	mov	0x24, %r14
	.word 0xf8db8e40  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb351c000  ! 1438: RDPR_TL	rdpr	%tl, %r25
cpu_intr_3_109:
	setx	0x2b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4c020  ! 1440: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xf42dc000  ! 1445: STB_R	stb	%r26, [%r23 + %r0]
T3_asi_reg_rd_70:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 36)
	.word 0xfa74617b  ! 1452: STX_I	stx	%r29, [%r17 + 0x017b]
	.word 0xfab48020  ! 1453: STHA_R	stha	%r29, [%r18 + %r0] 0x01
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfaa58020  ! 1457: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xfc2d4000  ! 1459: STB_R	stb	%r30, [%r21 + %r0]
cpu_intr_3_110:
	setx	0x29022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_77:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 1464: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfe34c000  ! 1467: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xb73d3001  ! 1468: SRAX_I	srax	%r20, 0x0001, %r27
	.word 0xfc344000  ! 1472: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf8a50020  ! 1473: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xb4154000  ! 1475: OR_R	or 	%r21, %r0, %r26
T3_asi_reg_wr_78:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 1477: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_71:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_79:
	mov	0xf, %r14
	.word 0xfcf38400  ! 1483: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ac206a  ! 1487: STBA_I	stba	%r27, [%r16 + 0x006a] %asi
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_111:
	setx	0x28020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_72:
	mov	0x1d, %r14
	.word 0xf0db8e80  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_73:
	mov	0x0, %r14
	.word 0xf6db84a0  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf6a48020  ! 1508: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_112:
	setx	0x10317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_113:
	setx	0x29033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_80:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 1517: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf2b58020  ! 1518: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	.word 0xf0b4615c  ! 1519: STHA_I	stha	%r24, [%r17 + 0x015c] %asi
	.word 0xb17d6401  ! 1520: MOVR_I	movre	%r21, 0x1, %r24
	.word 0xf0ac6043  ! 1522: STBA_I	stba	%r24, [%r17 + 0x0043] %asi
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_114:
	setx	0x280239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_115:
	setx	0x2b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_116:
	setx	0x290020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_117:
	setx	0x29033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe754000  ! 1537: STX_R	stx	%r31, [%r21 + %r0]
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 6)
	.word 0xbc956147  ! 1539: ORcc_I	orcc 	%r21, 0x0147, %r30
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_118:
	setx	0x29002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5a07b  ! 1551: STXA_I	stxa	%r26, [%r22 + 0x007b] %asi
T3_asi_reg_rd_74:
	mov	0xb, %r14
	.word 0xf4db8400  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf8a48020  ! 1554: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_81:
	mov	0x14, %r14
	.word 0xf8f38e60  ! 1556: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_wr_82:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 1557: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf02d0000  ! 1560: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf6a461e6  ! 1563: STWA_I	stwa	%r27, [%r17 + 0x01e6] %asi
	.word 0xf4a54020  ! 1564: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, a)
	.word 0xbc9c4000  ! 1567: XORcc_R	xorcc 	%r17, %r0, %r30
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 34)
	.word 0xf274a17c  ! 1570: STX_I	stx	%r25, [%r18 + 0x017c]
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, f)
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_119:
	setx	0x2b0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_120:
	setx	0x2a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13dc000  ! 1583: SRA_R	sra 	%r23, %r0, %r24
	.word 0xfa24a179  ! 1584: STW_I	stw	%r29, [%r18 + 0x0179]
cpu_intr_3_121:
	setx	0x2b021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_75:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1586: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8adc020  ! 1587: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xb8b48000  ! 1588: ORNcc_R	orncc 	%r18, %r0, %r28
T3_asi_reg_rd_76:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_rd_77:
	mov	0x11, %r14
	.word 0xf0db8e40  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_83:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 1595: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0a5c020  ! 1599: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xfa2dc000  ! 1602: STB_R	stb	%r29, [%r23 + %r0]
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_84:
	mov	0x1d, %r14
	.word 0xf8f389e0  ! 1609: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf6ad4020  ! 1611: STBA_R	stba	%r27, [%r21 + %r0] 0x01
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfeb50020  ! 1614: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8246178  ! 1621: STW_I	stw	%r28, [%r17 + 0x0178]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_122:
	setx	0x2b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d80  ! 1626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
	.word 0xfcad8020  ! 1627: STBA_R	stba	%r30, [%r22 + %r0] 0x01
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb2040000  ! 1632: ADD_R	add 	%r16, %r0, %r25
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_TO_TL1
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 27)
	.word 0xf4b48020  ! 1646: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xf2a421bd  ! 1647: STWA_I	stwa	%r25, [%r16 + 0x01bd] %asi
	.word 0xb1643801  ! 1651: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_78:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_123:
	setx	0x2b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_79:
	mov	0x37, %r14
	.word 0xf2db8e60  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_124:
	setx	0x29023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_80:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 37)
	.word 0xba34e15e  ! 1676: SUBC_I	orn 	%r19, 0x015e, %r29
cpu_intr_3_125:
	setx	0x290008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_85:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 1681: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe25600e  ! 1686: STW_I	stw	%r31, [%r21 + 0x000e]
	.word 0xf0a520b0  ! 1692: STWA_I	stwa	%r24, [%r20 + 0x00b0] %asi
	.word 0xf0358000  ! 1693: STH_R	sth	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_86:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 1695: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf4b5205b  ! 1697: STHA_I	stha	%r26, [%r20 + 0x005b] %asi
	.word 0xbab4e08a  ! 1698: ORNcc_I	orncc 	%r19, 0x008a, %r29
	.word 0xfc258000  ! 1699: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf0a4200e  ! 1702: STWA_I	stwa	%r24, [%r16 + 0x000e] %asi
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 38)
	.word 0xf02d8000  ! 1704: STB_R	stb	%r24, [%r22 + %r0]
T3_asi_reg_rd_81:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf2f5e0ec  ! 1709: STXA_I	stxa	%r25, [%r23 + 0x00ec] %asi
cpu_intr_3_126:
	setx	0x28033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3dc000  ! 1712: XNOR_R	xnor 	%r23, %r0, %r31
	.word 0xfc246013  ! 1713: STW_I	stw	%r30, [%r17 + 0x0013]
T3_asi_reg_rd_82:
	mov	0x5, %r14
	.word 0xf2db8e80  ! 1714: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf0a5c020  ! 1716: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xf22dc000  ! 1719: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xbf3d8000  ! 1722: SRA_R	sra 	%r22, %r0, %r31
T3_asi_reg_wr_87:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 1723: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 15)
	.word 0xf6b52146  ! 1732: STHA_I	stha	%r27, [%r20 + 0x0146] %asi
	.word 0xfea561fa  ! 1736: STWA_I	stwa	%r31, [%r21 + 0x01fa] %asi
	.word 0xf8254000  ! 1737: STW_R	stw	%r28, [%r21 + %r0]
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_127:
	setx	0x2a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_83:
	mov	0x34, %r14
	.word 0xf6db84a0  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_128:
	setx	0x28002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb4c000  ! 1750: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xf2242069  ! 1751: STW_I	stw	%r25, [%r16 + 0x0069]
	.word 0xfe75c000  ! 1757: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xb4c42135  ! 1758: ADDCcc_I	addccc 	%r16, 0x0135, %r26
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 39)
	.word 0xf62c2054  ! 1762: STB_I	stb	%r27, [%r16 + 0x0054]
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4244000  ! 1764: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xfa248000  ! 1766: STW_R	stw	%r29, [%r18 + %r0]
T3_asi_reg_wr_88:
	mov	0xe, %r14
	.word 0xfaf384a0  ! 1767: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_129:
	setx	0x2a0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac8020  ! 1772: STBA_R	stba	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_84:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 1773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_89:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1776: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 0)
	.word 0xf2a5212f  ! 1779: STWA_I	stwa	%r25, [%r20 + 0x012f] %asi
	.word 0xfc75a1ea  ! 1780: STX_I	stx	%r30, [%r22 + 0x01ea]
	.word 0xbebc61a6  ! 1781: XNORcc_I	xnorcc 	%r17, 0x01a6, %r31
cpu_intr_3_130:
	setx	0x290122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675614b  ! 1784: STX_I	stx	%r27, [%r21 + 0x014b]
	.word 0xfa240000  ! 1785: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xb53dc000  ! 1788: SRA_R	sra 	%r23, %r0, %r26
T3_asi_reg_wr_90:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 1790: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_85:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbcb58000  ! 1793: SUBCcc_R	orncc 	%r22, %r0, %r30
	.word 0xfa24e0cc  ! 1795: STW_I	stw	%r29, [%r19 + 0x00cc]
T3_asi_reg_wr_91:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 1796: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 12)
	.word 0xba9d20b5  ! 1799: XORcc_I	xorcc 	%r20, 0x00b5, %r29
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_92:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 1806: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb53c8000  ! 1807: SRA_R	sra 	%r18, %r0, %r26
	.word 0xb72d0000  ! 1809: SLL_R	sll 	%r20, %r0, %r27
T3_asi_reg_rd_86:
	mov	0x7, %r14
	.word 0xfedb8e60  ! 1810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_93:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 1814: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf0a44020  ! 1815: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983858  ! 1817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1858, %hpstate
	.word 0xf0ac6177  ! 1818: STBA_I	stba	%r24, [%r17 + 0x0177] %asi
	.word 0xf834e0ff  ! 1820: STH_I	sth	%r28, [%r19 + 0x00ff]
T3_asi_reg_wr_94:
	mov	0x1f, %r14
	.word 0xf2f38e80  ! 1825: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf0a58020  ! 1827: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	.word 0xfcb56094  ! 1829: STHA_I	stha	%r30, [%r21 + 0x0094] %asi
T3_asi_reg_rd_87:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 25)
	.word 0xba3c8000  ! 1837: XNOR_R	xnor 	%r18, %r0, %r29
	.word 0xf02c4000  ! 1838: STB_R	stb	%r24, [%r17 + %r0]
T3_asi_reg_rd_88:
	mov	0x19, %r14
	.word 0xf6db8400  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf8b54020  ! 1846: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_89:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 1847: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_131:
	setx	0x2f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a54020  ! 1860: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_90:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 1861: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_132:
	setx	0x2d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 29)
	.word 0xf8a520f9  ! 1869: STWA_I	stwa	%r28, [%r20 + 0x00f9] %asi
	.word 0xf02460c7  ! 1871: STW_I	stw	%r24, [%r17 + 0x00c7]
	.word 0xfc252099  ! 1874: STW_I	stw	%r30, [%r20 + 0x0099]
	.word 0xfc2d21f5  ! 1876: STB_I	stb	%r30, [%r20 + 0x01f5]
	.word 0xf8b58020  ! 1877: STHA_R	stha	%r28, [%r22 + %r0] 0x01
T3_asi_reg_wr_95:
	mov	0x5, %r14
	.word 0xfcf38e60  ! 1878: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983852  ! 1879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1852, %hpstate
cpu_intr_3_133:
	setx	0x2e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0aca0ed  ! 1886: STBA_I	stba	%r24, [%r18 + 0x00ed] %asi
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfeb50020  ! 1888: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 30)
	.word 0xfcb54020  ! 1900: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982ed0  ! 1902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed0, %hpstate
cpu_intr_3_134:
	setx	0x10033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_135:
	setx	0x2c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_136:
	setx	0x2c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xf42c4000  ! 1925: STB_R	stb	%r26, [%r17 + %r0]
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb73cf001  ! 1934: SRAX_I	srax	%r19, 0x0001, %r27
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 1)
	.word 0xf6248000  ! 1936: STW_R	stw	%r27, [%r18 + %r0]
cpu_intr_3_137:
	setx	0x2f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34d000  ! 1939: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xf425a06a  ! 1940: STW_I	stw	%r26, [%r22 + 0x006a]
cpu_intr_3_138:
	setx	0x2c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_96:
	mov	0x28, %r14
	.word 0xf8f38e40  ! 1951: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 16)
	.word 0xf475e01f  ! 1958: STX_I	stx	%r26, [%r23 + 0x001f]
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, c)
	.word 0xf2aca0f6  ! 1966: STBA_I	stba	%r25, [%r18 + 0x00f6] %asi
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_91:
	mov	0xf, %r14
	.word 0xfcdb8e60  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_97:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 1972: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7520000  ! 1974: RDPR_PIL	rdpr	%pil, %r27
	.word 0xbb643801  ! 1976: MOVcc_I	<illegal instruction>
	.word 0xf2acc020  ! 1977: STBA_R	stba	%r25, [%r19 + %r0] 0x01
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 14)
	.word 0xf624c000  ! 1981: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xfcb4a076  ! 1984: STHA_I	stha	%r30, [%r18 + 0x0076] %asi
T3_asi_reg_wr_98:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 1985: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d02  ! 1989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d02, %hpstate
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_99:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 1993: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_92:
	mov	0x1f, %r14
	.word 0xf8db8e60  ! 1997: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_100:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 1998: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 24)
	.word 0xfcb4608c  ! 2003: STHA_I	stha	%r30, [%r17 + 0x008c] %asi
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf0246103  ! 2009: STW_I	stw	%r24, [%r17 + 0x0103]
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 22)
	.word 0xfc34e141  ! 2015: STH_I	sth	%r30, [%r19 + 0x0141]
cpu_intr_3_139:
	setx	0x2f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 16)
	.word 0xf8a4a08e  ! 2019: STWA_I	stwa	%r28, [%r18 + 0x008e] %asi
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, a)
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_140:
	setx	0x2e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983980  ! 2032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1980, %hpstate
T3_asi_reg_rd_93:
	mov	0x28, %r14
	.word 0xf6db84a0  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfef5a1ee  ! 2034: STXA_I	stxa	%r31, [%r22 + 0x01ee] %asi
	.word 0xb2c461a2  ! 2038: ADDCcc_I	addccc 	%r17, 0x01a2, %r25
T3_asi_reg_wr_101:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 2040: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfca4a006  ! 2043: STWA_I	stwa	%r30, [%r18 + 0x0006] %asi
	.word 0xb61ca0b5  ! 2044: XOR_I	xor 	%r18, 0x00b5, %r27
	.word 0xf824c000  ! 2045: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf4b5a136  ! 2047: STHA_I	stha	%r26, [%r22 + 0x0136] %asi
cpu_intr_3_141:
	setx	0x2d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe758000  ! 2052: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xbf2d3001  ! 2054: SLLX_I	sllx	%r20, 0x0001, %r31
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_142:
	setx	0x2c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb77ce401  ! 2061: MOVR_I	movre	%r19, 0x1, %r27
T3_asi_reg_wr_102:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 2062: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb12d6001  ! 2063: SLL_I	sll 	%r21, 0x0001, %r24
	.word 0xfa750000  ! 2067: STX_R	stx	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_143:
	setx	0x2c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_94:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_95:
	mov	0x0, %r14
	.word 0xf6db8e60  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf4ade1bc  ! 2077: STBA_I	stba	%r26, [%r23 + 0x01bc] %asi
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a5a  ! 2080: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5a, %hpstate
	.word 0xb81c4000  ! 2081: XOR_R	xor 	%r17, %r0, %r28
	.word 0xb8352023  ! 2084: SUBC_I	orn 	%r20, 0x0023, %r28
cpu_intr_3_144:
	setx	0x2f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21460dc  ! 2087: OR_I	or 	%r17, 0x00dc, %r25
	.word 0xfeb5606e  ! 2088: STHA_I	stha	%r31, [%r21 + 0x006e] %asi
	.word 0xbeb52015  ! 2089: ORNcc_I	orncc 	%r20, 0x0015, %r31
	.word 0xf2ac8020  ! 2091: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xf62c4000  ! 2095: STB_R	stb	%r27, [%r17 + %r0]
T3_asi_reg_wr_103:
	mov	0x22, %r14
	.word 0xf0f38e80  ! 2096: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf0350000  ! 2097: STH_R	sth	%r24, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_145:
	setx	0x2c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_96:
	mov	0x2d, %r14
	.word 0xf2db8e80  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_104:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 2104: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_97:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_146:
	setx	0x2d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f4a0e3  ! 2110: STXA_I	stxa	%r27, [%r18 + 0x00e3] %asi
	.word 0xfaada066  ! 2111: STBA_I	stba	%r29, [%r22 + 0x0066] %asi
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb4258000  ! 2114: SUB_R	sub 	%r22, %r0, %r26
	.word 0xfa74a015  ! 2115: STX_I	stx	%r29, [%r18 + 0x0015]
cpu_intr_3_147:
	setx	0x2c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_148:
	setx	0x2d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe2da038  ! 2126: STB_I	stb	%r31, [%r22 + 0x0038]
T3_asi_reg_rd_98:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfc34a101  ! 2136: STH_I	sth	%r30, [%r18 + 0x0101]
T3_asi_reg_rd_99:
	mov	0x22, %r14
	.word 0xf6db84a0  ! 2137: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_rd_100:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_149:
	setx	0x2c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034a0fa  ! 2141: STH_I	sth	%r24, [%r18 + 0x00fa]
	.word 0xf075a040  ! 2142: STX_I	stx	%r24, [%r22 + 0x0040]
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb92c4000  ! 2147: SLL_R	sll 	%r17, %r0, %r28
	.word 0xfe25c000  ! 2148: STW_R	stw	%r31, [%r23 + %r0]
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_150:
	setx	0x2d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_151:
	setx	0x2e033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf075214e  ! 2158: STX_I	stx	%r24, [%r20 + 0x014e]
	.word 0xbb34e001  ! 2160: SRL_I	srl 	%r19, 0x0001, %r29
	.word 0xf8350000  ! 2161: STH_R	sth	%r28, [%r20 + %r0]
T3_asi_reg_rd_101:
	mov	0x34, %r14
	.word 0xfedb8e80  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a48  ! 2170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a48, %hpstate
cpu_intr_3_152:
	setx	0x2c032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_102:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 5)
	.word 0xf6a461cd  ! 2177: STWA_I	stwa	%r27, [%r17 + 0x01cd] %asi
cpu_intr_3_154:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaada18d  ! 2181: STBA_I	stba	%r29, [%r22 + 0x018d] %asi
	.word 0xfaa42087  ! 2182: STWA_I	stwa	%r29, [%r16 + 0x0087] %asi
cpu_intr_3_155:
	setx	0x2f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad4020  ! 2186: STBA_R	stba	%r24, [%r21 + %r0] 0x01
T3_asi_reg_wr_105:
	mov	0x31, %r14
	.word 0xf4f38400  ! 2189: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf27421da  ! 2191: STX_I	stx	%r25, [%r16 + 0x01da]
	ta	T_CHANGE_TO_TL0
	.word 0xf0a5c020  ! 2197: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_156:
	setx	0x2f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4202e  ! 2202: STXA_I	stxa	%r28, [%r16 + 0x002e] %asi
	.word 0xf22d0000  ! 2207: STB_R	stb	%r25, [%r20 + %r0]
cpu_intr_3_157:
	setx	0x2f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b4a  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4a, %hpstate
	.word 0xf4adc020  ! 2219: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	.word 0xfe252148  ! 2226: STW_I	stw	%r31, [%r20 + 0x0148]
T3_asi_reg_rd_103:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf82de16e  ! 2230: STB_I	stb	%r28, [%r23 + 0x016e]
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 6)
	.word 0xf4752113  ! 2232: STX_I	stx	%r26, [%r20 + 0x0113]
cpu_intr_3_158:
	setx	0x2d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab44020  ! 2240: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xbd500000  ! 2241: RDPR_TPC	rdpr	%tpc, %r30
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfe2de164  ! 2244: STB_I	stb	%r31, [%r23 + 0x0164]
cpu_intr_3_159:
	setx	0x2e0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b5213b  ! 2248: ORNcc_I	orncc 	%r20, 0x013b, %r27
T3_asi_reg_wr_106:
	mov	0x2d, %r14
	.word 0xf0f38e60  ! 2249: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf4ad2139  ! 2250: STBA_I	stba	%r26, [%r20 + 0x0139] %asi
	.word 0xf22ca1bd  ! 2253: STB_I	stb	%r25, [%r18 + 0x01bd]
T3_asi_reg_wr_107:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2255: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8b5e147  ! 2256: STHA_I	stha	%r28, [%r23 + 0x0147] %asi
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 27)
	.word 0xf0f4a0a7  ! 2258: STXA_I	stxa	%r24, [%r18 + 0x00a7] %asi
	.word 0xfcb54020  ! 2260: STHA_R	stha	%r30, [%r21 + %r0] 0x01
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_HPRIV
	.word 0xfa3421d1  ! 2267: STH_I	sth	%r29, [%r16 + 0x01d1]
	.word 0xfaf4a041  ! 2270: STXA_I	stxa	%r29, [%r18 + 0x0041] %asi
	.word 0xfca4e07d  ! 2274: STWA_I	stwa	%r30, [%r19 + 0x007d] %asi
	.word 0xbc0d201b  ! 2275: AND_I	and 	%r20, 0x001b, %r30
	.word 0xf2a5e0c2  ! 2276: STWA_I	stwa	%r25, [%r23 + 0x00c2] %asi
	.word 0xf82dc000  ! 2280: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfa2d60d3  ! 2283: STB_I	stb	%r29, [%r21 + 0x00d3]
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0246129  ! 2285: STW_I	stw	%r24, [%r17 + 0x0129]
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_104:
	mov	0x26, %r14
	.word 0xf8db8e80  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	.word 0xfc240000  ! 2292: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_108:
	mov	0x10, %r14
	.word 0xf6f384a0  ! 2300: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbeb4c000  ! 2302: ORNcc_R	orncc 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0xfa356020  ! 2308: STH_I	sth	%r29, [%r21 + 0x0020]
T3_asi_reg_wr_109:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 2309: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe75e04e  ! 2310: STX_I	stx	%r31, [%r23 + 0x004e]
cpu_intr_3_160:
	setx	0x33013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 2315: ORNcc_R	orncc 	%r23, %r0, %r25
	.word 0xf4ac2124  ! 2317: STBA_I	stba	%r26, [%r16 + 0x0124] %asi
	.word 0xfa244000  ! 2319: STW_R	stw	%r29, [%r17 + %r0]
T3_asi_reg_wr_110:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 2320: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf4b521ac  ! 2321: STHA_I	stha	%r26, [%r20 + 0x01ac] %asi
	.word 0xf0a5a031  ! 2330: STWA_I	stwa	%r24, [%r22 + 0x0031] %asi
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf23421b1  ! 2335: STH_I	sth	%r25, [%r16 + 0x01b1]
	.word 0xfcb44020  ! 2336: STHA_R	stha	%r30, [%r17 + %r0] 0x01
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_TO_TL0
	.word 0xf8ac61ea  ! 2340: STBA_I	stba	%r28, [%r17 + 0x01ea] %asi
	.word 0xfe75e091  ! 2342: STX_I	stx	%r31, [%r23 + 0x0091]
T3_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2343: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc25c000  ! 2344: STW_R	stw	%r30, [%r23 + %r0]
cpu_intr_3_161:
	setx	0x330315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_105:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982942  ! 2357: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0942, %hpstate
	.word 0xf0b58020  ! 2360: STHA_R	stha	%r24, [%r22 + %r0] 0x01
	.word 0xb6b50000  ! 2363: SUBCcc_R	orncc 	%r20, %r0, %r27
	.word 0xf634a005  ! 2364: STH_I	sth	%r27, [%r18 + 0x0005]
	.word 0xfa244000  ! 2368: STW_R	stw	%r29, [%r17 + %r0]
cpu_intr_3_162:
	setx	0x300105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb46185  ! 2371: SUBCcc_I	orncc 	%r17, 0x0185, %r30
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 38)
	.word 0xf8ac21fc  ! 2377: STBA_I	stba	%r28, [%r16 + 0x01fc] %asi
	.word 0xf8f460ef  ! 2378: STXA_I	stxa	%r28, [%r17 + 0x00ef] %asi
	.word 0xfc256184  ! 2382: STW_I	stw	%r30, [%r21 + 0x0184]
T3_asi_reg_rd_106:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 2383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe25e1c1  ! 2384: STW_I	stw	%r31, [%r23 + 0x01c1]
	.word 0xfcb40020  ! 2385: STHA_R	stha	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_112:
	mov	0x18, %r14
	.word 0xfaf389e0  ! 2388: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfc2c2191  ! 2389: STB_I	stb	%r30, [%r16 + 0x0191]
cpu_intr_3_163:
	setx	0x31033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0354000  ! 2393: STH_R	sth	%r24, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xb93dd000  ! 2396: SRAX_R	srax	%r23, %r0, %r28
	.word 0xfaac8020  ! 2398: STBA_R	stba	%r29, [%r18 + %r0] 0x01
T3_asi_reg_wr_113:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 2399: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a42  ! 2400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a42, %hpstate
T3_asi_reg_wr_114:
	mov	0xf, %r14
	.word 0xf8f38400  ! 2406: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfe2c4000  ! 2409: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf6352125  ! 2411: STH_I	sth	%r27, [%r20 + 0x0125]
cpu_intr_3_164:
	setx	0x300212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_165:
	setx	0x310331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d0000  ! 2414: STB_R	stb	%r29, [%r20 + %r0]
T3_asi_reg_wr_115:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 2417: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6256141  ! 2420: STW_I	stw	%r27, [%r21 + 0x0141]
	.word 0xfe342161  ! 2421: STH_I	sth	%r31, [%r16 + 0x0161]
	.word 0xf6250000  ! 2424: STW_R	stw	%r27, [%r20 + %r0]
T3_asi_reg_wr_116:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 2426: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf474c000  ! 2427: STX_R	stx	%r26, [%r19 + %r0]
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf8348000  ! 2429: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xfaad0020  ! 2431: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8f460d4  ! 2437: STXA_I	stxa	%r28, [%r17 + 0x00d4] %asi
	.word 0xfe2de1c4  ! 2438: STB_I	stb	%r31, [%r23 + 0x01c4]
T3_asi_reg_wr_117:
	mov	0x21, %r14
	.word 0xf2f38e40  ! 2445: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_118:
	mov	0xc, %r14
	.word 0xf2f389e0  ! 2449: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf224c000  ! 2455: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf43420ad  ! 2457: STH_I	sth	%r26, [%r16 + 0x00ad]
	.word 0x919460d2  ! 2458: WRPR_PIL_I	wrpr	%r17, 0x00d2, %pil
	ta	T_CHANGE_NONHPRIV
	.word 0xfe75c000  ! 2461: STX_R	stx	%r31, [%r23 + %r0]
T3_asi_reg_rd_107:
	mov	0xe, %r14
	.word 0xfedb8e40  ! 2463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
cpu_intr_3_166:
	setx	0x32033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b48020  ! 2478: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a9a  ! 2480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9a, %hpstate
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, d)
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_167:
	setx	0x310136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaadc020  ! 2493: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xf634e03e  ! 2494: STH_I	sth	%r27, [%r19 + 0x003e]
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 7)
	.word 0xf6b5a0b9  ! 2500: STHA_I	stha	%r27, [%r22 + 0x00b9] %asi
T3_asi_reg_wr_119:
	mov	0x1b, %r14
	.word 0xfef38400  ! 2501: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf8a40020  ! 2502: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xfaa4c020  ! 2503: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf6a5e0df  ! 2504: STWA_I	stwa	%r27, [%r23 + 0x00df] %asi
cpu_intr_3_168:
	setx	0x320203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33da001  ! 2506: SRA_I	sra 	%r22, 0x0001, %r25
cpu_intr_3_169:
	setx	0x330019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe2c0000  ! 2517: STB_R	stb	%r31, [%r16 + %r0]
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_170:
	setx	0x310209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_120:
	mov	0x0, %r14
	.word 0xfef389e0  ! 2523: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_121:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 2524: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_171:
	setx	0x320214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_122:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 2526: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 35)
	.word 0xf6750000  ! 2530: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xfe2d61c2  ! 2533: STB_I	stb	%r31, [%r21 + 0x01c2]
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_123:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2536: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_172:
	setx	0x300121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b42006  ! 2540: STHA_I	stha	%r26, [%r16 + 0x0006] %asi
	.word 0xf8246100  ! 2542: STW_I	stw	%r28, [%r17 + 0x0100]
	.word 0xbc34202f  ! 2543: SUBC_I	orn 	%r16, 0x002f, %r30
	.word 0xf6ad4020  ! 2544: STBA_R	stba	%r27, [%r21 + %r0] 0x01
cpu_intr_3_173:
	setx	0x320133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_174:
	setx	0x320007, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf22ca041  ! 2564: STB_I	stb	%r25, [%r18 + 0x0041]
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2d4000  ! 2568: STB_R	stb	%r30, [%r21 + %r0]
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 36)
	.word 0xf6748000  ! 2572: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf0746006  ! 2573: STX_I	stx	%r24, [%r17 + 0x0006]
	.word 0xfaa58020  ! 2574: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xf4a52198  ! 2575: STWA_I	stwa	%r26, [%r20 + 0x0198] %asi
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf2a5a170  ! 2577: STWA_I	stwa	%r25, [%r22 + 0x0170] %asi
cpu_intr_3_175:
	setx	0x300134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5a1fb  ! 2582: STWA_I	stwa	%r31, [%r22 + 0x01fb] %asi
T3_asi_reg_wr_124:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 2583: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf0ada0d9  ! 2587: STBA_I	stba	%r24, [%r22 + 0x00d9] %asi
cpu_intr_3_176:
	setx	0x320222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b58020  ! 2592: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf82c0000  ! 2594: STB_R	stb	%r28, [%r16 + %r0]
cpu_intr_3_177:
	setx	0x31012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab5e1ae  ! 2597: SUBCcc_I	orncc 	%r23, 0x01ae, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa244000  ! 2599: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf6ade17d  ! 2602: STBA_I	stba	%r27, [%r23 + 0x017d] %asi
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_125:
	mov	0xa, %r14
	.word 0xfef384a0  ! 2604: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfc24614e  ! 2606: STW_I	stw	%r30, [%r17 + 0x014e]
cpu_intr_3_178:
	setx	0x33013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf6b421a7  ! 2612: STHA_I	stha	%r27, [%r16 + 0x01a7] %asi
T3_asi_reg_rd_108:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb8c5a07d  ! 2615: ADDCcc_I	addccc 	%r22, 0x007d, %r28
	.word 0xf82de102  ! 2617: STB_I	stb	%r28, [%r23 + 0x0102]
cpu_intr_3_179:
	setx	0x300317, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_109:
	mov	0x1e, %r14
	.word 0xf4db89e0  ! 2619: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf4ade091  ! 2620: STBA_I	stba	%r26, [%r23 + 0x0091] %asi
	.word 0xf82d0000  ! 2621: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xf2352016  ! 2622: STH_I	sth	%r25, [%r20 + 0x0016]
	.word 0xf0b40020  ! 2623: STHA_R	stha	%r24, [%r16 + %r0] 0x01
cpu_intr_3_180:
	setx	0x30022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac0020  ! 2627: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_181:
	setx	0x31013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_110:
	mov	0x38, %r14
	.word 0xf0db8e60  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_182:
	setx	0x31031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2c8000  ! 2633: ANDN_R	andn 	%r18, %r0, %r29
T3_asi_reg_wr_126:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 2634: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf835e026  ! 2635: STH_I	sth	%r28, [%r23 + 0x0026]
	.word 0xfa754000  ! 2637: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf4b4c020  ! 2638: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	.word 0xfaaca06a  ! 2642: STBA_I	stba	%r29, [%r18 + 0x006a] %asi
	.word 0xf034a0a3  ! 2645: STH_I	sth	%r24, [%r18 + 0x00a3]
T3_asi_reg_rd_111:
	mov	0x14, %r14
	.word 0xf2db84a0  ! 2647: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf2a58020  ! 2655: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
cpu_intr_3_183:
	setx	0x30022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 2657: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf42ce025  ! 2658: STB_I	stb	%r26, [%r19 + 0x0025]
cpu_intr_3_184:
	setx	0x310014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_185:
	setx	0x320005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75215e  ! 2664: STX_I	stx	%r31, [%r20 + 0x015e]
	.word 0xf8adc020  ! 2666: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_186:
	setx	0x310232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf625e054  ! 2670: STW_I	stw	%r27, [%r23 + 0x0054]
	.word 0xf6b4a0b9  ! 2671: STHA_I	stha	%r27, [%r18 + 0x00b9] %asi
T3_asi_reg_wr_127:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 2672: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4a4e027  ! 2674: STWA_I	stwa	%r26, [%r19 + 0x0027] %asi
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, f)
	.word 0xfeac20b9  ! 2678: STBA_I	stba	%r31, [%r16 + 0x00b9] %asi
	.word 0xb53cc000  ! 2679: SRA_R	sra 	%r19, %r0, %r26
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a8a  ! 2685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_128:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 2688: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbe0d4000  ! 2690: AND_R	and 	%r21, %r0, %r31
	.word 0xfca44020  ! 2691: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	.word 0xb084207b  ! 2695: ADDcc_I	addcc 	%r16, 0x007b, %r24
T3_asi_reg_wr_129:
	mov	0x26, %r14
	.word 0xf2f38e80  ! 2698: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6b4a0cc  ! 2699: STHA_I	stha	%r27, [%r18 + 0x00cc] %asi
	.word 0xb00c215d  ! 2700: AND_I	and 	%r16, 0x015d, %r24
T3_asi_reg_wr_130:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 2701: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf4a4c020  ! 2702: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_112:
	mov	0x18, %r14
	.word 0xfcdb89e0  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfa2de12e  ! 2704: STB_I	stb	%r29, [%r23 + 0x012e]
T3_asi_reg_wr_131:
	mov	0x1d, %r14
	.word 0xf6f384a0  ! 2706: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_132:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 2707: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3480000  ! 2708: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
T3_asi_reg_rd_113:
	mov	0x27, %r14
	.word 0xfadb89e0  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_114:
	mov	0x2d, %r14
	.word 0xf6db8400  ! 2710: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_115:
	mov	0x10, %r14
	.word 0xf8db8e60  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfab4c020  ! 2715: STHA_R	stha	%r29, [%r19 + %r0] 0x01
cpu_intr_3_187:
	setx	0x33002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 22)
	.word 0xb625c000  ! 2726: SUB_R	sub 	%r23, %r0, %r27
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_133:
	mov	0x4, %r14
	.word 0xf8f384a0  ! 2728: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf42d21e9  ! 2730: STB_I	stb	%r26, [%r20 + 0x01e9]
T3_asi_reg_wr_134:
	mov	0x2a, %r14
	.word 0xfef38400  ! 2731: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_188:
	setx	0x360127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_135:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 2736: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb284a16d  ! 2737: ADDcc_I	addcc 	%r18, 0x016d, %r25
	.word 0xba2de0d3  ! 2738: ANDN_I	andn 	%r23, 0x00d3, %r29
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_189:
	setx	0x36010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_190:
	setx	0x340134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68da00a  ! 2747: ANDcc_I	andcc 	%r22, 0x000a, %r27
	.word 0xf4240000  ! 2748: STW_R	stw	%r26, [%r16 + %r0]
cpu_intr_3_191:
	setx	0x340007, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_136:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 2753: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf0aca0dc  ! 2754: STBA_I	stba	%r24, [%r18 + 0x00dc] %asi
	.word 0xb894a070  ! 2756: ORcc_I	orcc 	%r18, 0x0070, %r28
	.word 0xf2348000  ! 2757: STH_R	sth	%r25, [%r18 + %r0]
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 13)
	.word 0xba44e155  ! 2763: ADDC_I	addc 	%r19, 0x0155, %r29
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf82d8000  ! 2765: STB_R	stb	%r28, [%r22 + %r0]
cpu_intr_3_192:
	setx	0x34012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7347001  ! 2768: SRLX_I	srlx	%r17, 0x0001, %r27
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe1c4000  ! 2771: XOR_R	xor 	%r17, %r0, %r31
cpu_intr_3_193:
	setx	0x350236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ce011  ! 2774: STB_I	stb	%r26, [%r19 + 0x0011]
	.word 0xf82c20dd  ! 2776: STB_I	stb	%r28, [%r16 + 0x00dd]
	.word 0xbe2c4000  ! 2779: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xfcb58020  ! 2780: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xfc348000  ! 2781: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf4f5e027  ! 2782: STXA_I	stxa	%r26, [%r23 + 0x0027] %asi
	.word 0xf2258000  ! 2783: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf8b50020  ! 2784: STHA_R	stha	%r28, [%r20 + %r0] 0x01
cpu_intr_3_194:
	setx	0x37022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_195:
	setx	0x340118, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf6ac4020  ! 2790: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xfeb46140  ! 2791: STHA_I	stha	%r31, [%r17 + 0x0140] %asi
	.word 0xf8242045  ! 2796: STW_I	stw	%r28, [%r16 + 0x0045]
	.word 0xb72d7001  ! 2797: SLLX_I	sllx	%r21, 0x0001, %r27
	.word 0xbc15a0e2  ! 2805: OR_I	or 	%r22, 0x00e2, %r30
	.word 0xf02c4000  ! 2806: STB_R	stb	%r24, [%r17 + %r0]
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_137:
	mov	0x2b, %r14
	.word 0xfef38400  ! 2809: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_138:
	mov	0x18, %r14
	.word 0xf0f384a0  ! 2813: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb2c5c000  ! 2814: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xb20d6070  ! 2815: AND_I	and 	%r21, 0x0070, %r25
	.word 0xf6340000  ! 2816: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf42ce09b  ! 2819: STB_I	stb	%r26, [%r19 + 0x009b]
	.word 0xf474c000  ! 2821: STX_R	stx	%r26, [%r19 + %r0]
cpu_intr_3_196:
	setx	0x36031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2a4215d  ! 2828: STWA_I	stwa	%r25, [%r16 + 0x015d] %asi
	.word 0xf2242192  ! 2830: STW_I	stw	%r25, [%r16 + 0x0192]
cpu_intr_3_197:
	setx	0x360132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a54020  ! 2832: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xba84e1e5  ! 2834: ADDcc_I	addcc 	%r19, 0x01e5, %r29
cpu_intr_3_198:
	setx	0x37002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 2840: STX_R	stx	%r26, [%r17 + %r0]
T3_asi_reg_rd_116:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2842: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_199:
	setx	0x340326, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf475c000  ! 2847: STX_R	stx	%r26, [%r23 + %r0]
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 3)
	.word 0xb8b5c000  ! 2851: SUBCcc_R	orncc 	%r23, %r0, %r28
	.word 0xf2a5216c  ! 2853: STWA_I	stwa	%r25, [%r20 + 0x016c] %asi
cpu_intr_3_200:
	setx	0x35012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 2859: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_139:
	mov	0x3, %r14
	.word 0xfef38e40  ! 2861: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8aca086  ! 2865: STBA_I	stba	%r28, [%r18 + 0x0086] %asi
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf474211a  ! 2870: STX_I	stx	%r26, [%r16 + 0x011a]
cpu_intr_3_201:
	setx	0x370306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5a124  ! 2873: STHA_I	stha	%r28, [%r22 + 0x0124] %asi
T3_asi_reg_rd_118:
	mov	0x19, %r14
	.word 0xfedb89e0  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf8a4e15c  ! 2882: STWA_I	stwa	%r28, [%r19 + 0x015c] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_202:
	setx	0x350303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4c020  ! 2888: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xf4744000  ! 2889: STX_R	stx	%r26, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb5207a  ! 2891: STHA_I	stha	%r31, [%r20 + 0x007a] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfaa4e058  ! 2894: STWA_I	stwa	%r29, [%r19 + 0x0058] %asi
	.word 0xfc35c000  ! 2895: STH_R	sth	%r30, [%r23 + %r0]
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 1a)
	ta	T_CHANGE_HPRIV
	.word 0xb17dc400  ! 2901: MOVR_R	movre	%r23, %r0, %r24
	.word 0xbe3dc000  ! 2902: XNOR_R	xnor 	%r23, %r0, %r31
T3_asi_reg_rd_119:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc75212e  ! 2906: STX_I	stx	%r30, [%r20 + 0x012e]
T3_asi_reg_wr_140:
	mov	0x24, %r14
	.word 0xfef38e80  ! 2907: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_120:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 32)
	.word 0xfe2d8000  ! 2917: STB_R	stb	%r31, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, b)
	.word 0xf2a461f4  ! 2929: STWA_I	stwa	%r25, [%r17 + 0x01f4] %asi
	.word 0xb2448000  ! 2935: ADDC_R	addc 	%r18, %r0, %r25
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 14)
	.word 0xf6250000  ! 2939: STW_R	stw	%r27, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_203:
	setx	0x34031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_204:
	setx	0x350134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_141:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2956: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf2f42167  ! 2957: STXA_I	stxa	%r25, [%r16 + 0x0167] %asi
	.word 0xbd3d8000  ! 2959: SRA_R	sra 	%r22, %r0, %r30
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa246167  ! 2962: STW_I	stw	%r29, [%r17 + 0x0167]
	.word 0xfca58020  ! 2963: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
	.word 0xf224e0d1  ! 2966: STW_I	stw	%r25, [%r19 + 0x00d1]
	.word 0xfaf5e1e8  ! 2967: STXA_I	stxa	%r29, [%r23 + 0x01e8] %asi
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 4)
	.word 0xb2a48000  ! 2977: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xfa2c8000  ! 2978: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xbb3d4000  ! 2980: SRA_R	sra 	%r21, %r0, %r29
cpu_intr_3_205:
	setx	0x35022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4050000  ! 2985: ADD_R	add 	%r20, %r0, %r26
	.word 0xf8b5c020  ! 2987: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_206:
	setx	0x370118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_207:
	setx	0x370304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b48020  ! 2995: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xf4b48020  ! 2997: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xfca5e1f6  ! 2998: STWA_I	stwa	%r30, [%r23 + 0x01f6] %asi
	.word 0xbc35a03b  ! 3000: ORN_I	orn 	%r22, 0x003b, %r30
cpu_intr_3_208:
	setx	0x350138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_209:
	setx	0x370213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c4000  ! 3005: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfc250000  ! 3007: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf635a1d9  ! 3008: STH_I	sth	%r27, [%r22 + 0x01d9]
	.word 0xf0358000  ! 3009: STH_R	sth	%r24, [%r22 + %r0]
T3_asi_reg_rd_121:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 3010: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_210:
	setx	0x34032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4c020  ! 3018: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xf8b48020  ! 3021: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_122:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbea52173  ! 3027: SUBcc_I	subcc 	%r20, 0x0173, %r31
	.word 0xf0354000  ! 3029: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xfe754000  ! 3030: STX_R	stx	%r31, [%r21 + %r0]
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b8a  ! 3031: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8a, %hpstate
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 28)
	.word 0xf07420be  ! 3035: STX_I	stx	%r24, [%r16 + 0x00be]
	.word 0xf0f42009  ! 3037: STXA_I	stxa	%r24, [%r16 + 0x0009] %asi
cpu_intr_3_211:
	setx	0x340005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_212:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf0a42073  ! 3042: STWA_I	stwa	%r24, [%r16 + 0x0073] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f520d7  ! 3045: STXA_I	stxa	%r27, [%r20 + 0x00d7] %asi
cpu_intr_3_213:
	setx	0x370124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_142:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 3048: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb92c5000  ! 3049: SLLX_R	sllx	%r17, %r0, %r28
	.word 0xf834e15a  ! 3051: STH_I	sth	%r28, [%r19 + 0x015a]
T3_asi_reg_rd_123:
	mov	0x12, %r14
	.word 0xfadb8e80  ! 3053: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf4a48020  ! 3054: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xb4844000  ! 3055: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xf0f52012  ! 3056: STXA_I	stxa	%r24, [%r20 + 0x0012] %asi
cpu_intr_3_214:
	setx	0x340239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b58020  ! 3059: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xf2344000  ! 3060: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_215:
	setx	0x340039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879420e5  ! 3064: WRPR_TT_I	wrpr	%r16, 0x00e5, %tt
	.word 0xf8f4619c  ! 3065: STXA_I	stxa	%r28, [%r17 + 0x019c] %asi
	.word 0xfe2c2132  ! 3070: STB_I	stb	%r31, [%r16 + 0x0132]
T3_asi_reg_rd_124:
	mov	0x1, %r14
	.word 0xfadb8e80  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 8)
	.word 0xb8a5e1c4  ! 3073: SUBcc_I	subcc 	%r23, 0x01c4, %r28
cpu_intr_3_216:
	setx	0x34033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0350000  ! 3078: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xfef5a050  ! 3080: STXA_I	stxa	%r31, [%r22 + 0x0050] %asi
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 7)
	.word 0xba0c61ac  ! 3083: AND_I	and 	%r17, 0x01ac, %r29
	.word 0xf62c60fa  ! 3084: STB_I	stb	%r27, [%r17 + 0x00fa]
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_217:
	setx	0x350239, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_143:
	mov	0x26, %r14
	.word 0xf6f38e40  ! 3087: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfcb48020  ! 3088: STHA_R	stha	%r30, [%r18 + %r0] 0x01
T3_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 3089: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_218:
	setx	0x37013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_219:
	setx	0x340302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_220:
	setx	0x350027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb48020  ! 3098: STHA_R	stha	%r30, [%r18 + %r0] 0x01
T3_asi_reg_wr_145:
	mov	0x36, %r14
	.word 0xf2f38e80  ! 3099: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_221:
	setx	0x370305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b520f0  ! 3102: STHA_I	stha	%r24, [%r20 + 0x00f0] %asi
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, c)
	.word 0xf22c612b  ! 3107: STB_I	stb	%r25, [%r17 + 0x012b]
T3_asi_reg_rd_125:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_222:
	setx	0x340224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_223:
	setx	0x35003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_224:
	setx	0x340104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81d8000  ! 3120: XOR_R	xor 	%r22, %r0, %r28
	.word 0xf0b40020  ! 3122: STHA_R	stha	%r24, [%r16 + %r0] 0x01
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb01c4000  ! 3124: XOR_R	xor 	%r17, %r0, %r24
	.word 0xfab54020  ! 3128: STHA_R	stha	%r29, [%r21 + %r0] 0x01
T3_asi_reg_rd_126:
	mov	0x1b, %r14
	.word 0xfedb8e80  ! 3132: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb4bc8000  ! 3133: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xf6b5a131  ! 3134: STHA_I	stha	%r27, [%r22 + 0x0131] %asi
	.word 0xfa24219c  ! 3135: STW_I	stw	%r29, [%r16 + 0x019c]
	.word 0xf4b40020  ! 3140: STHA_R	stha	%r26, [%r16 + %r0] 0x01
cpu_intr_3_225:
	setx	0x36021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735b001  ! 3142: SRLX_I	srlx	%r22, 0x0001, %r27
T3_asi_reg_wr_146:
	mov	0x23, %r14
	.word 0xfef38400  ! 3144: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_226:
	setx	0x34020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad213a  ! 3148: STBA_I	stba	%r26, [%r20 + 0x013a] %asi
T3_asi_reg_wr_147:
	mov	0x3, %r14
	.word 0xfef384a0  ! 3150: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8acc020  ! 3151: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xfc25a1d9  ! 3155: STW_I	stw	%r30, [%r22 + 0x01d9]
	.word 0xbc2d61b7  ! 3164: ANDN_I	andn 	%r21, 0x01b7, %r30
T3_asi_reg_rd_127:
	mov	0x21, %r14
	.word 0xfedb8400  ! 3167: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4a52111  ! 3170: STWA_I	stwa	%r26, [%r20 + 0x0111] %asi
cpu_intr_3_227:
	setx	0x370234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42da02f  ! 3176: STB_I	stb	%r26, [%r22 + 0x002f]
	.word 0xbc954000  ! 3177: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xf8248000  ! 3181: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf4254000  ! 3183: STW_R	stw	%r26, [%r21 + %r0]
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819838da  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18da, %hpstate
T3_asi_reg_rd_128:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8ad0020  ! 3191: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	.word 0xf22c0000  ! 3193: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf8354000  ! 3195: STH_R	sth	%r28, [%r21 + %r0]
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_129:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_148:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 3201: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_228:
	setx	0x2023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 34)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983cc8  ! 3206: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
cpu_intr_3_229:
	setx	0x38022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_230:
	setx	0x38022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_231:
	setx	0x3b033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba944000  ! 3216: ORcc_R	orcc 	%r17, %r0, %r29
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf8752155  ! 3222: STX_I	stx	%r28, [%r20 + 0x0155]
cpu_intr_3_232:
	setx	0x380000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6aca16d  ! 3226: STBA_I	stba	%r27, [%r18 + 0x016d] %asi
	.word 0xbf356001  ! 3228: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xfa35e1b5  ! 3229: STH_I	sth	%r29, [%r23 + 0x01b5]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ac607f  ! 3239: STBA_I	stba	%r27, [%r17 + 0x007f] %asi
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe25c000  ! 3246: STW_R	stw	%r31, [%r23 + %r0]
cpu_intr_3_233:
	setx	0x3a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34a1a3  ! 3248: STH_I	sth	%r31, [%r18 + 0x01a3]
cpu_intr_3_234:
	setx	0x3a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_130:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 3253: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_rd_131:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf4344000  ! 3257: STH_R	sth	%r26, [%r17 + %r0]
cpu_intr_3_235:
	setx	0x390336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, f)
	.word 0xf4a4a144  ! 3261: STWA_I	stwa	%r26, [%r18 + 0x0144] %asi
T3_asi_reg_wr_149:
	mov	0x1, %r14
	.word 0xf0f38e60  ! 3262: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfab58020  ! 3265: STHA_R	stha	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_132:
	mov	0x11, %r14
	.word 0xf2db89e0  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_236:
	setx	0x380138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_150:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 3277: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_133:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_134:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_151:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 3284: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbc2ca0da  ! 3287: ANDN_I	andn 	%r18, 0x00da, %r30
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982982  ! 3288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
	.word 0xfab56091  ! 3293: STHA_I	stha	%r29, [%r21 + 0x0091] %asi
	.word 0xf475a00d  ! 3294: STX_I	stx	%r26, [%r22 + 0x000d]
cpu_intr_3_237:
	setx	0x3b0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6a4a0c4  ! 3301: STWA_I	stwa	%r27, [%r18 + 0x00c4] %asi
	.word 0xf474605f  ! 3302: STX_I	stx	%r26, [%r17 + 0x005f]
cpu_intr_3_238:
	setx	0x390214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 14)
	.word 0xfe2cc000  ! 3306: STB_R	stb	%r31, [%r19 + %r0]
T3_asi_reg_rd_135:
	mov	0x1b, %r14
	.word 0xfadb89e0  ! 3308: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf6258000  ! 3309: STW_R	stw	%r27, [%r22 + %r0]
cpu_intr_3_239:
	setx	0x390110, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_240:
	setx	0x3a030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_241:
	setx	0x38020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 22)
	.word 0xb8052063  ! 3323: ADD_I	add 	%r20, 0x0063, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_3_242:
	setx	0x390328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_243:
	setx	0x3a0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983fd8  ! 3335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd8, %hpstate
	.word 0xf624c000  ! 3336: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf834200f  ! 3337: STH_I	sth	%r28, [%r16 + 0x000f]
	.word 0xf6758000  ! 3340: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf2f520ba  ! 3341: STXA_I	stxa	%r25, [%r20 + 0x00ba] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_152:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 3344: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbaa42101  ! 3345: SUBcc_I	subcc 	%r16, 0x0101, %r29
	.word 0xf275e03c  ! 3347: STX_I	stx	%r25, [%r23 + 0x003c]
	.word 0xf22d0000  ! 3349: STB_R	stb	%r25, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_136:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_153:
	mov	0x16, %r14
	.word 0xf0f384a0  ! 3357: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf4ace0ad  ! 3359: STBA_I	stba	%r26, [%r19 + 0x00ad] %asi
	.word 0xfe74e019  ! 3361: STX_I	stx	%r31, [%r19 + 0x0019]
T3_asi_reg_wr_154:
	mov	0xd, %r14
	.word 0xf4f38400  ! 3364: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_244:
	setx	0x3a0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_245:
	setx	0x3a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_246:
	setx	0x3b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_247:
	setx	0x3b0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 21)
	.word 0xf0f5a15e  ! 3376: STXA_I	stxa	%r24, [%r22 + 0x015e] %asi
	.word 0xf634e1b5  ! 3380: STH_I	sth	%r27, [%r19 + 0x01b5]
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, c)
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198381a  ! 3382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
cpu_intr_3_248:
	setx	0x390211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x18, %r14
	.word 0xfcdb89e0  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_138:
	mov	0x34, %r14
	.word 0xfedb89e0  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfa74e005  ! 3404: STX_I	stx	%r29, [%r19 + 0x0005]
T3_asi_reg_wr_155:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 3405: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfeacc020  ! 3407: STBA_R	stba	%r31, [%r19 + %r0] 0x01
	.word 0xfeac4020  ! 3409: STBA_R	stba	%r31, [%r17 + %r0] 0x01
T3_asi_reg_wr_156:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 3410: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_249:
	setx	0x3a003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe7520ff  ! 3413: STX_I	stx	%r31, [%r20 + 0x00ff]
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 1)
	.word 0xfaac2196  ! 3415: STBA_I	stba	%r29, [%r16 + 0x0196] %asi
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_250:
	setx	0x38013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 3424: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf4b58020  ! 3426: STHA_R	stha	%r26, [%r22 + %r0] 0x01
cpu_intr_3_251:
	setx	0x390035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435a0d2  ! 3430: STH_I	sth	%r26, [%r22 + 0x00d2]
	.word 0xfcadc020  ! 3431: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf2244000  ! 3433: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf2346183  ! 3438: STH_I	sth	%r25, [%r17 + 0x0183]
	.word 0xf6f56125  ! 3441: STXA_I	stxa	%r27, [%r21 + 0x0125] %asi
	.word 0xbc8c2148  ! 3442: ANDcc_I	andcc 	%r16, 0x0148, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b40020  ! 3444: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xf4344000  ! 3447: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xb0944000  ! 3448: ORcc_R	orcc 	%r17, %r0, %r24
cpu_intr_3_252:
	setx	0x380239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5e144  ! 3452: STHA_I	stha	%r27, [%r23 + 0x0144] %asi
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982982  ! 3453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
	.word 0xf02d20ca  ! 3454: STB_I	stb	%r24, [%r20 + 0x00ca]
	.word 0xf6a50020  ! 3455: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	.word 0xf42d4000  ! 3457: STB_R	stb	%r26, [%r21 + %r0]
cpu_intr_3_253:
	setx	0x3a0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2458000  ! 3460: ADDC_R	addc 	%r22, %r0, %r25
cpu_intr_3_254:
	setx	0x390004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35208f  ! 3462: STH_I	sth	%r30, [%r20 + 0x008f]
	.word 0xb2440000  ! 3463: ADDC_R	addc 	%r16, %r0, %r25
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_255:
	setx	0x3b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3520e2  ! 3466: STH_I	sth	%r30, [%r20 + 0x00e2]
T3_asi_reg_wr_157:
	mov	0x29, %r14
	.word 0xf0f389e0  ! 3469: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb89dc000  ! 3471: XORcc_R	xorcc 	%r23, %r0, %r28
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 3)
	.word 0xbaac20e8  ! 3474: ANDNcc_I	andncc 	%r16, 0x00e8, %r29
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 10)
	.word 0xbe0cc000  ! 3481: AND_R	and 	%r19, %r0, %r31
	.word 0xfaf4a1df  ! 3483: STXA_I	stxa	%r29, [%r18 + 0x01df] %asi
T3_asi_reg_rd_139:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f5a  ! 3486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5a, %hpstate
	.word 0xf8254000  ! 3487: STW_R	stw	%r28, [%r21 + %r0]
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, f)
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 26)
	.word 0xb2bd4000  ! 3493: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0xfa248000  ! 3496: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf8b5a19d  ! 3498: STHA_I	stha	%r28, [%r22 + 0x019d] %asi
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 13)
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c80  ! 3500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
	.word 0xfea5604d  ! 3502: STWA_I	stwa	%r31, [%r21 + 0x004d] %asi
	.word 0xf2ad4020  ! 3503: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xb80d4000  ! 3505: AND_R	and 	%r21, %r0, %r28
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 4)
	.word 0x8994a19f  ! 3507: WRPR_TICK_I	wrpr	%r18, 0x019f, %tick
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_158:
	mov	0x29, %r14
	.word 0xf8f38400  ! 3513: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_256:
	setx	0x3a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c214b  ! 3517: STB_I	stb	%r29, [%r16 + 0x014b]
	.word 0xb334d000  ! 3520: SRLX_R	srlx	%r19, %r0, %r25
cpu_intr_3_257:
	setx	0x390321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_159:
	mov	0x0, %r14
	.word 0xf0f38e60  ! 3524: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_140:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 3525: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_160:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3526: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 2f)
	.word 0xbac4c000  ! 3529: ADDCcc_R	addccc 	%r19, %r0, %r29
	.word 0xb29d0000  ! 3530: XORcc_R	xorcc 	%r20, %r0, %r25
cpu_intr_3_258:
	setx	0x3b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a461e1  ! 3532: STWA_I	stwa	%r26, [%r17 + 0x01e1] %asi
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_161:
	mov	0x34, %r14
	.word 0xf6f384a0  ! 3537: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ad20d4  ! 3539: STBA_I	stba	%r24, [%r20 + 0x00d4] %asi
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 11)
	.word 0xfc746014  ! 3544: STX_I	stx	%r30, [%r17 + 0x0014]
T3_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3546: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbc148000  ! 3547: OR_R	or 	%r18, %r0, %r30
	.word 0xb61ce09b  ! 3548: XOR_I	xor 	%r19, 0x009b, %r27
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_163:
	mov	0x24, %r14
	.word 0xfaf384a0  ! 3553: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_259:
	setx	0x3b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_260:
	setx	0x390227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa252170  ! 3558: STW_I	stw	%r29, [%r20 + 0x0170]
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 3d)
	.word 0xba842170  ! 3565: ADDcc_I	addcc 	%r16, 0x0170, %r29
cpu_intr_3_261:
	setx	0x3b0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8adc020  ! 3569: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_262:
	setx	0x3b0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x3b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_264:
	setx	0x3b000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_265:
	setx	0x3b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024c000  ! 3577: STW_R	stw	%r24, [%r19 + %r0]
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6b5e0e9  ! 3581: STHA_I	stha	%r27, [%r23 + 0x00e9] %asi
T3_asi_reg_rd_141:
	mov	0x29, %r14
	.word 0xfcdb84a0  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe344000  ! 3584: STH_R	sth	%r31, [%r17 + %r0]
cpu_intr_3_266:
	setx	0x3b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_164:
	mov	0x28, %r14
	.word 0xfaf38e60  ! 3586: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf4244000  ! 3587: STW_R	stw	%r26, [%r17 + %r0]
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, d)
	.word 0xb4b44000  ! 3592: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xf234a01f  ! 3595: STH_I	sth	%r25, [%r18 + 0x001f]
cpu_intr_3_267:
	setx	0x38030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb645e100  ! 3600: ADDC_I	addc 	%r23, 0x0100, %r27
	.word 0xbd7c6401  ! 3601: MOVR_I	movre	%r17, 0x1, %r30
T3_asi_reg_rd_142:
	mov	0x14, %r14
	.word 0xf6db8e60  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfc244000  ! 3603: STW_R	stw	%r30, [%r17 + %r0]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_268:
	setx	0x3a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, f)
	.word 0xf2f42001  ! 3622: STXA_I	stxa	%r25, [%r16 + 0x0001] %asi
	.word 0xb0a44000  ! 3623: SUBcc_R	subcc 	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 34)
	.word 0xf634e1b1  ! 3633: STH_I	sth	%r27, [%r19 + 0x01b1]
	.word 0xf475e03a  ! 3634: STX_I	stx	%r26, [%r23 + 0x003a]
	.word 0xf074201b  ! 3635: STX_I	stx	%r24, [%r16 + 0x001b]
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_165:
	mov	0x33, %r14
	.word 0xf4f38400  ! 3646: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_269:
	setx	0x3a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 3651: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_270:
	setx	0x390206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_167:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 3655: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa2ce084  ! 3656: STB_I	stb	%r29, [%r19 + 0x0084]
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_271:
	setx	0x3a001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_272:
	setx	0x380130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad20a5  ! 3664: STBA_I	stba	%r29, [%r20 + 0x00a5] %asi
T3_asi_reg_wr_168:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 3665: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfca561c3  ! 3666: STWA_I	stwa	%r30, [%r21 + 0x01c3] %asi
T3_asi_reg_rd_143:
	mov	0x25, %r14
	.word 0xf4db84a0  ! 3667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_273:
	setx	0x3a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_274:
	setx	0x3b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_275:
	setx	0x3c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 14)
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ed2  ! 3678: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed2, %hpstate
	.word 0xf0ad8020  ! 3679: STBA_R	stba	%r24, [%r22 + %r0] 0x01
cpu_intr_3_276:
	setx	0x3d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_169:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 3685: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_144:
	mov	0x13, %r14
	.word 0xfcdb8400  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 0)
	.word 0xb2c5a027  ! 3688: ADDCcc_I	addccc 	%r22, 0x0027, %r25
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a52  ! 3690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a52, %hpstate
cpu_intr_3_277:
	setx	0x3e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_145:
	mov	0xd, %r14
	.word 0xf8db84a0  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf0f461b6  ! 3696: STXA_I	stxa	%r24, [%r17 + 0x01b6] %asi
cpu_intr_3_278:
	setx	0x3f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, d)
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_146:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 3700: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_147:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfa74a099  ! 3703: STX_I	stx	%r29, [%r18 + 0x0099]
T3_asi_reg_rd_148:
	mov	0x27, %r14
	.word 0xf0db89e0  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_170:
	mov	0x9, %r14
	.word 0xf8f389e0  ! 3708: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_149:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfcb4a13a  ! 3711: STHA_I	stha	%r30, [%r18 + 0x013a] %asi
	.word 0xf02ca143  ! 3715: STB_I	stb	%r24, [%r18 + 0x0143]
	.word 0xbab50000  ! 3717: ORNcc_R	orncc 	%r20, %r0, %r29
cpu_intr_3_279:
	setx	0x3e0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_280:
	setx	0x3f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_171:
	mov	0x2, %r14
	.word 0xf8f38e40  ! 3721: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf824a066  ! 3722: STW_I	stw	%r28, [%r18 + 0x0066]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_281:
	setx	0x3e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_282:
	setx	0x3e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_283:
	setx	0x3c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfef460ad  ! 3733: STXA_I	stxa	%r31, [%r17 + 0x00ad] %asi
T3_asi_reg_wr_172:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 3735: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_wr_173:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 3739: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_150:
	mov	0x2f, %r14
	.word 0xf6db8400  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 37)
	.word 0xfe24a1cc  ! 3750: STW_I	stw	%r31, [%r18 + 0x01cc]
T3_asi_reg_rd_151:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 3752: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfaa40020  ! 3753: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
cpu_intr_3_284:
	setx	0x3e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_285:
	setx	0x3d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_286:
	setx	0x3f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983840  ! 3759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1840, %hpstate
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe2c8000  ! 3764: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfe34e188  ! 3765: STH_I	sth	%r31, [%r19 + 0x0188]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_287:
	setx	0x3e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa354000  ! 3769: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_rd_152:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_174:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 3774: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb085c000  ! 3775: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xbe340000  ! 3776: SUBC_R	orn 	%r16, %r0, %r31
	.word 0xb844c000  ! 3779: ADDC_R	addc 	%r19, %r0, %r28
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_175:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 3783: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_288:
	setx	0x3d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf2754000  ! 3786: STX_R	stx	%r25, [%r21 + %r0]
T3_asi_reg_rd_153:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 3791: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfc242136  ! 3793: STW_I	stw	%r30, [%r16 + 0x0136]
	.word 0xfca50020  ! 3794: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xb41460c6  ! 3800: OR_I	or 	%r17, 0x00c6, %r26
cpu_intr_3_289:
	setx	0x3f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf224a167  ! 3805: STW_I	stw	%r25, [%r18 + 0x0167]
	.word 0xfaa560eb  ! 3807: STWA_I	stwa	%r29, [%r21 + 0x00eb] %asi
	.word 0xb82dc000  ! 3809: ANDN_R	andn 	%r23, %r0, %r28
	.word 0xfca40020  ! 3816: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
cpu_intr_3_290:
	setx	0x3e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075e02e  ! 3818: STX_I	stx	%r24, [%r23 + 0x002e]
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 23)
	.word 0xf6246089  ! 3822: STW_I	stw	%r27, [%r17 + 0x0089]
T3_asi_reg_wr_176:
	mov	0x2c, %r14
	.word 0xf2f38e80  ! 3829: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4248000  ! 3845: STW_R	stw	%r26, [%r18 + %r0]
cpu_intr_3_291:
	setx	0x3f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac60eb  ! 3847: STBA_I	stba	%r31, [%r17 + 0x00eb] %asi
	.word 0xf2a4a14a  ! 3850: STWA_I	stwa	%r25, [%r18 + 0x014a] %asi
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf82c2141  ! 3857: STB_I	stb	%r28, [%r16 + 0x0141]
	.word 0xf22c0000  ! 3858: STB_R	stb	%r25, [%r16 + %r0]
T3_asi_reg_wr_177:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 3859: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_154:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf0248000  ! 3863: STW_R	stw	%r24, [%r18 + %r0]
cpu_intr_3_292:
	setx	0x3c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0754000  ! 3869: STX_R	stx	%r24, [%r21 + %r0]
cpu_intr_3_293:
	setx	0x3e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_155:
	mov	0x34, %r14
	.word 0xfedb8400  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b54020  ! 3883: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_156:
	mov	0x35, %r14
	.word 0xf8db8e80  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf2b5208f  ! 3889: STHA_I	stha	%r25, [%r20 + 0x008f] %asi
	.word 0xfe2c8000  ! 3890: STB_R	stb	%r31, [%r18 + %r0]
cpu_intr_3_294:
	setx	0x3c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c6013  ! 3893: STB_I	stb	%r26, [%r17 + 0x0013]
T3_asi_reg_rd_157:
	mov	0x34, %r14
	.word 0xfadb8400  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_178:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 3895: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb4b5216a  ! 3898: SUBCcc_I	orncc 	%r20, 0x016a, %r26
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 22)
	.word 0xf2ace1d7  ! 3903: STBA_I	stba	%r25, [%r19 + 0x01d7] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_295:
	setx	0x3d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb935d000  ! 3911: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xf6340000  ! 3912: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf62ce1dc  ! 3913: STB_I	stb	%r27, [%r19 + 0x01dc]
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_158:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb751c000  ! 3921: RDPR_TL	rdpr	%tl, %r27
	.word 0xf22ca07b  ! 3922: STB_I	stb	%r25, [%r18 + 0x007b]
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_296:
	setx	0x3d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac8020  ! 3927: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xf8254000  ! 3929: STW_R	stw	%r28, [%r21 + %r0]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf0a52172  ! 3931: STWA_I	stwa	%r24, [%r20 + 0x0172] %asi
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_159:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfa25e06b  ! 3936: STW_I	stw	%r29, [%r23 + 0x006b]
	.word 0xf2b5e07a  ! 3937: STHA_I	stha	%r25, [%r23 + 0x007a] %asi
	.word 0xf2f56020  ! 3939: STXA_I	stxa	%r25, [%r21 + 0x0020] %asi
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_160:
	mov	0x38, %r14
	.word 0xfadb8400  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_179:
	mov	0x27, %r14
	.word 0xf2f38400  ! 3946: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_wr_180:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 3947: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_161:
	mov	0x22, %r14
	.word 0xfedb84a0  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfe750000  ! 3952: STX_R	stx	%r31, [%r20 + %r0]
T3_asi_reg_rd_162:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 3955: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc2de158  ! 3956: STB_I	stb	%r30, [%r23 + 0x0158]
	.word 0xbf346001  ! 3958: SRL_I	srl 	%r17, 0x0001, %r31
T3_asi_reg_rd_163:
	mov	0x1, %r14
	.word 0xf6db8e60  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf624c000  ! 3960: STW_R	stw	%r27, [%r19 + %r0]
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_164:
	mov	0x16, %r14
	.word 0xfedb84a0  ! 3962: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 7)
	.word 0xbca44000  ! 3969: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xf2a46014  ! 3970: STWA_I	stwa	%r25, [%r17 + 0x0014] %asi
T3_asi_reg_rd_165:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 3972: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_rd_166:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 2)
	.word 0xb80d8000  ! 3984: AND_R	and 	%r22, %r0, %r28
T3_asi_reg_rd_167:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 3987: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf675c000  ! 3990: STX_R	stx	%r27, [%r23 + %r0]
T3_asi_reg_wr_181:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 3992: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
cpu_intr_3_297:
	setx	0x3c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4e187  ! 3997: STHA_I	stha	%r31, [%r19 + 0x0187] %asi
cpu_intr_3_298:
	setx	0x3f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac8020  ! 4001: STBA_R	stba	%r28, [%r18 + %r0] 0x01
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_299:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac4020  ! 4004: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xfc2d2094  ! 4005: STB_I	stb	%r30, [%r20 + 0x0094]
	.word 0xf0348000  ! 4007: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf4a5c020  ! 4008: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
	.word 0xf4f5a084  ! 4010: STXA_I	stxa	%r26, [%r22 + 0x0084] %asi
	.word 0xb29c8000  ! 4011: XORcc_R	xorcc 	%r18, %r0, %r25
	.word 0xf6ac8020  ! 4014: STBA_R	stba	%r27, [%r18 + %r0] 0x01
cpu_intr_3_300:
	setx	0x3d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, b)
	.word 0xb92c5000  ! 4021: SLLX_R	sllx	%r17, %r0, %r28
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_301:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b1a  ! 4028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
	.word 0xf6344000  ! 4030: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xfcad2120  ! 4031: STBA_I	stba	%r30, [%r20 + 0x0120] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd2cb001  ! 4038: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xfeb4e16b  ! 4039: STHA_I	stha	%r31, [%r19 + 0x016b] %asi
	.word 0xbc040000  ! 4041: ADD_R	add 	%r16, %r0, %r30
cpu_intr_3_302:
	setx	0x3f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 4046: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf624c000  ! 4049: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xfaa5a1ba  ! 4052: STWA_I	stwa	%r29, [%r22 + 0x01ba] %asi
	.word 0xf8a5e06b  ! 4056: STWA_I	stwa	%r28, [%r23 + 0x006b] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_303:
	setx	0x3e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635a0c2  ! 4063: STH_I	sth	%r27, [%r22 + 0x00c2]
	.word 0xfaa44020  ! 4064: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_304:
	setx	0x3f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 4072: RDPR_TT	rdpr	%tt, %r29
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_305:
	setx	0x3e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_182:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 4079: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_183:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4084: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_184:
	mov	0x34, %r14
	.word 0xfcf384a0  ! 4087: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfa352095  ! 4088: STH_I	sth	%r29, [%r20 + 0x0095]
	.word 0xbb2c4000  ! 4089: SLL_R	sll 	%r17, %r0, %r29
	.word 0xf474c000  ! 4091: STX_R	stx	%r26, [%r19 + %r0]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_185:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 4094: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_169:
	mov	0x15, %r14
	.word 0xf8db89e0  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb2c44000  ! 4097: ADDCcc_R	addccc 	%r17, %r0, %r25
cpu_intr_3_306:
	setx	0x3d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d6102  ! 4104: STB_I	stb	%r29, [%r21 + 0x0102]
cpu_intr_3_307:
	setx	0x3c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_170:
	mov	0x4, %r14
	.word 0xf6db8e60  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf2ad21b1  ! 4108: STBA_I	stba	%r25, [%r20 + 0x01b1] %asi
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_171:
	mov	0x23, %r14
	.word 0xf2db84a0  ! 4110: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6b5c020  ! 4114: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xb2b5e16b  ! 4117: SUBCcc_I	orncc 	%r23, 0x016b, %r25
	.word 0xf6b58020  ! 4119: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xfc346108  ! 4121: STH_I	sth	%r30, [%r17 + 0x0108]
	.word 0xba45e0eb  ! 4122: ADDC_I	addc 	%r23, 0x00eb, %r29
cpu_intr_3_308:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac8020  ! 4128: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xf834a1ad  ! 4132: STH_I	sth	%r28, [%r18 + 0x01ad]
	.word 0xf4ad0020  ! 4133: STBA_R	stba	%r26, [%r20 + %r0] 0x01
T3_asi_reg_wr_186:
	mov	0x35, %r14
	.word 0xf4f389e0  ! 4134: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_309:
	setx	0x41022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5a1e4  ! 4147: STXA_I	stxa	%r31, [%r22 + 0x01e4] %asi
T3_asi_reg_wr_187:
	mov	0x36, %r14
	.word 0xf0f38e80  ! 4148: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb57ce401  ! 4149: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xba84a147  ! 4150: ADDcc_I	addcc 	%r18, 0x0147, %r29
T3_asi_reg_rd_172:
	mov	0x8, %r14
	.word 0xf2db8e80  ! 4151: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_rd_173:
	mov	0x17, %r14
	.word 0xf2db84a0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_188:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 4154: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb73dc000  ! 4155: SRA_R	sra 	%r23, %r0, %r27
	.word 0xf62d0000  ! 4156: STB_R	stb	%r27, [%r20 + %r0]
cpu_intr_3_310:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_174:
	mov	0x2, %r14
	.word 0xfedb89e0  ! 4162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf6b54020  ! 4163: STHA_R	stha	%r27, [%r21 + %r0] 0x01
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 34)
	.word 0xf4250000  ! 4166: STW_R	stw	%r26, [%r20 + %r0]
cpu_intr_3_311:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf0ad4020  ! 4178: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xf224c000  ! 4179: STW_R	stw	%r25, [%r19 + %r0]
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982848  ! 4182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
	.word 0xfe346061  ! 4183: STH_I	sth	%r31, [%r17 + 0x0061]
T3_asi_reg_wr_189:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 4184: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf235a0ed  ! 4188: STH_I	sth	%r25, [%r22 + 0x00ed]
	.word 0xb42dc000  ! 4194: ANDN_R	andn 	%r23, %r0, %r26
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_175:
	mov	0x2f, %r14
	.word 0xf4db8e80  ! 4197: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_312:
	setx	0x41031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2a44020  ! 4202: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0x89946072  ! 4206: WRPR_TICK_I	wrpr	%r17, 0x0072, %tick
T3_asi_reg_rd_176:
	mov	0x5, %r14
	.word 0xfedb8e40  ! 4210: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2246116  ! 4214: STW_I	stw	%r25, [%r17 + 0x0116]
	.word 0xb12dd000  ! 4215: SLLX_R	sllx	%r23, %r0, %r24
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_rd_177:
	mov	0x34, %r14
	.word 0xfedb8e60  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_313:
	setx	0x42032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_190:
	mov	0x1c, %r14
	.word 0xfef389e0  ! 4225: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf6b4a122  ! 4226: STHA_I	stha	%r27, [%r18 + 0x0122] %asi
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_178:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 4230: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf82ce0e9  ! 4233: STB_I	stb	%r28, [%r19 + 0x00e9]
	.word 0xfea4c020  ! 4236: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xb045e17a  ! 4239: ADDC_I	addc 	%r23, 0x017a, %r24
	.word 0xfef421e5  ! 4240: STXA_I	stxa	%r31, [%r16 + 0x01e5] %asi
	.word 0xb22c4000  ! 4241: ANDN_R	andn 	%r17, %r0, %r25
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_314:
	setx	0x400204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a1db  ! 4245: STH_I	sth	%r30, [%r22 + 0x01db]
	.word 0xf674a1a5  ! 4250: STX_I	stx	%r27, [%r18 + 0x01a5]
	.word 0xf6340000  ! 4253: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xfa35e0df  ! 4255: STH_I	sth	%r29, [%r23 + 0x00df]
	.word 0xf4b5612f  ! 4256: STHA_I	stha	%r26, [%r21 + 0x012f] %asi
	.word 0xf62d4000  ! 4258: STB_R	stb	%r27, [%r21 + %r0]
T3_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 4259: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_191:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 4263: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc74c000  ! 4264: STX_R	stx	%r30, [%r19 + %r0]
cpu_intr_3_315:
	setx	0x410016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8358000  ! 4266: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf425c000  ! 4271: STW_R	stw	%r26, [%r23 + %r0]
cpu_intr_3_316:
	setx	0x430007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_180:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_317:
	setx	0x40020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_181:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_192:
	mov	0xb, %r14
	.word 0xfef38e40  ! 4286: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2348000  ! 4288: STH_R	sth	%r25, [%r18 + %r0]
T3_asi_reg_wr_193:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 4293: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198285a  ! 4294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085a, %hpstate
	.word 0xf0742047  ! 4297: STX_I	stx	%r24, [%r16 + 0x0047]
	.word 0xfca50020  ! 4301: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf02c2160  ! 4306: STB_I	stb	%r24, [%r16 + 0x0160]
cpu_intr_3_318:
	setx	0x420116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4e151  ! 4308: STXA_I	stxa	%r24, [%r19 + 0x0151] %asi
	.word 0xfe2d8000  ! 4309: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf825c000  ! 4312: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfe2dc000  ! 4313: STB_R	stb	%r31, [%r23 + %r0]
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 38)
	.word 0xfeb4a0a4  ! 4315: STHA_I	stha	%r31, [%r18 + 0x00a4] %asi
	.word 0xf6248000  ! 4319: STW_R	stw	%r27, [%r18 + %r0]
T3_asi_reg_wr_194:
	mov	0x26, %r14
	.word 0xf0f389e0  ! 4320: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_319:
	setx	0x43033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_320:
	setx	0x42022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4e032  ! 4324: STHA_I	stha	%r30, [%r19 + 0x0032] %asi
T3_asi_reg_rd_182:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf234c000  ! 4329: STH_R	sth	%r25, [%r19 + %r0]
T3_asi_reg_wr_195:
	mov	0x7, %r14
	.word 0xf2f384a0  ! 4331: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb0bc219d  ! 4333: XNORcc_I	xnorcc 	%r16, 0x019d, %r24
	.word 0xf02ce1b5  ! 4334: STB_I	stb	%r24, [%r19 + 0x01b5]
T3_asi_reg_rd_183:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 4338: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_wr_196:
	mov	0x0, %r14
	.word 0xf8f38e80  ! 4339: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf8758000  ! 4341: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xb735b001  ! 4344: SRLX_I	srlx	%r22, 0x0001, %r27
	.word 0xfcb4e09c  ! 4345: STHA_I	stha	%r30, [%r19 + 0x009c] %asi
cpu_intr_3_321:
	setx	0x420129, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_184:
	mov	0x6, %r14
	.word 0xf8db8e80  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_rd_185:
	mov	0xe, %r14
	.word 0xf8db89e0  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_322:
	setx	0x400129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_323:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a421dc  ! 4357: STWA_I	stwa	%r25, [%r16 + 0x01dc] %asi
	.word 0xb53c6001  ! 4359: SRA_I	sra 	%r17, 0x0001, %r26
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf6254000  ! 4362: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfa750000  ! 4363: STX_R	stx	%r29, [%r20 + %r0]
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfa2c8000  ! 4366: STB_R	stb	%r29, [%r18 + %r0]
cpu_intr_3_324:
	setx	0x400222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_186:
	mov	0x1e, %r14
	.word 0xfadb8400  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf874200a  ! 4374: STX_I	stx	%r28, [%r16 + 0x000a]
T3_asi_reg_wr_197:
	mov	0x1a, %r14
	.word 0xf2f384a0  ! 4379: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_325:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_326:
	setx	0x430101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a40020  ! 4397: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xfef5a165  ! 4398: STXA_I	stxa	%r31, [%r22 + 0x0165] %asi
cpu_intr_3_327:
	setx	0x43003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 1)
	.word 0xb53c1000  ! 4403: SRAX_R	srax	%r16, %r0, %r26
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_198:
	mov	0x4, %r14
	.word 0xfef38e40  ! 4410: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_328:
	setx	0x3011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a58020  ! 4415: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
cpu_intr_3_329:
	setx	0x420234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_330:
	setx	0x40000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034c000  ! 4422: ORN_R	orn 	%r19, %r0, %r24
T3_asi_reg_rd_187:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 4423: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2cc000  ! 4431: STB_R	stb	%r31, [%r19 + %r0]
T3_asi_reg_rd_188:
	mov	0x23, %r14
	.word 0xf2db8e60  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_331:
	setx	0x40010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69d0000  ! 4436: XORcc_R	xorcc 	%r20, %r0, %r27
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_189:
	mov	0x6, %r14
	.word 0xf4db89e0  ! 4444: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8254000  ! 4451: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xb6058000  ! 4453: ADD_R	add 	%r22, %r0, %r27
T3_asi_reg_wr_199:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 4454: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a50020  ! 4457: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_332:
	setx	0x410008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5e149  ! 4465: STWA_I	stwa	%r25, [%r23 + 0x0149] %asi
T3_asi_reg_rd_190:
	mov	0xc, %r14
	.word 0xf8db84a0  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf2240000  ! 4467: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfa2de150  ! 4470: STB_I	stb	%r29, [%r23 + 0x0150]
	.word 0xf675c000  ! 4472: STX_R	stx	%r27, [%r23 + %r0]
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_TO_TL1
	.word 0xf0750000  ! 4475: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xfc2c0000  ! 4481: STB_R	stb	%r30, [%r16 + %r0]
cpu_intr_3_333:
	setx	0x410002, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_200:
	mov	0x10, %r14
	.word 0xf2f38e40  ! 4487: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_334:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfe75e02f  ! 4490: STX_I	stx	%r31, [%r23 + 0x002f]
T3_asi_reg_rd_191:
	mov	0x26, %r14
	.word 0xf6db89e0  ! 4492: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_335:
	setx	0x400332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024e09d  ! 4494: STW_I	stw	%r24, [%r19 + 0x009d]
	.word 0xf6a4c020  ! 4496: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
	.word 0xf8350000  ! 4500: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfeb48020  ! 4501: STHA_R	stha	%r31, [%r18 + %r0] 0x01
	.word 0xf8a5a15d  ! 4502: STWA_I	stwa	%r28, [%r22 + 0x015d] %asi
	.word 0xf2a48020  ! 4504: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_192:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf02cc000  ! 4518: STB_R	stb	%r24, [%r19 + %r0]
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c48  ! 4521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
	.word 0xfc75e045  ! 4525: STX_I	stx	%r30, [%r23 + 0x0045]
	.word 0xbcb46183  ! 4526: SUBCcc_I	orncc 	%r17, 0x0183, %r30
T3_asi_reg_wr_201:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 4527: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf4a5a0c6  ! 4528: STWA_I	stwa	%r26, [%r22 + 0x00c6] %asi
	.word 0xfef561ba  ! 4532: STXA_I	stxa	%r31, [%r21 + 0x01ba] %asi
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 39)
	.word 0xfe75c000  ! 4534: STX_R	stx	%r31, [%r23 + %r0]
T3_asi_reg_wr_202:
	mov	0x4, %r14
	.word 0xf0f38400  ! 4537: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfe75a112  ! 4538: STX_I	stx	%r31, [%r22 + 0x0112]
	.word 0xf234a0ae  ! 4539: STH_I	sth	%r25, [%r18 + 0x00ae]
	.word 0xfeac8020  ! 4540: STBA_R	stba	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_203:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 4542: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_193:
	mov	0x1d, %r14
	.word 0xfedb8e60  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf2242122  ! 4549: STW_I	stw	%r25, [%r16 + 0x0122]
cpu_intr_3_336:
	setx	0x410227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_337:
	setx	0x201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaaca1b4  ! 4553: STBA_I	stba	%r29, [%r18 + 0x01b4] %asi
T3_asi_reg_rd_194:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 4554: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb2c5a1c3  ! 4561: ADDCcc_I	addccc 	%r22, 0x01c3, %r25
cpu_intr_3_338:
	setx	0x41033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf225a10a  ! 4563: STW_I	stw	%r25, [%r22 + 0x010a]
	.word 0xfaac0020  ! 4564: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_195:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_339:
	setx	0x400027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_196:
	mov	0x1d, %r14
	.word 0xfcdb84a0  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_rd_197:
	mov	0x2b, %r14
	.word 0xfedb8e60  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb234a113  ! 4571: SUBC_I	orn 	%r18, 0x0113, %r25
cpu_intr_3_340:
	setx	0x40012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0954000  ! 4573: ORcc_R	orcc 	%r21, %r0, %r24
cpu_intr_3_341:
	setx	0x43001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1348000  ! 4575: SRL_R	srl 	%r18, %r0, %r24
cpu_intr_3_342:
	setx	0x460218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 22)
	.word 0xf234c000  ! 4581: STH_R	sth	%r25, [%r19 + %r0]
T3_asi_reg_wr_204:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 4582: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb4452019  ! 4583: ADDC_I	addc 	%r20, 0x0019, %r26
cpu_intr_3_343:
	setx	0x440235, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819839d0  ! 4588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa48020  ! 4593: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
cpu_intr_3_344:
	setx	0x460019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f5e19c  ! 4601: STXA_I	stxa	%r27, [%r23 + 0x019c] %asi
	.word 0xf6ad0020  ! 4602: STBA_R	stba	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 4604: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_345:
	setx	0x47033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_199:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, a)
	.word 0xf8b40020  ! 4612: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfcf52032  ! 4613: STXA_I	stxa	%r30, [%r20 + 0x0032] %asi
cpu_intr_3_346:
	setx	0x460338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 4618: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_200:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 4624: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_347:
	setx	0x450019, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_201:
	mov	0x8, %r14
	.word 0xf4db89e0  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfe2d8000  ! 4631: STB_R	stb	%r31, [%r22 + %r0]
cpu_intr_3_348:
	setx	0x440028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa40020  ! 4633: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xf2242066  ! 4634: STW_I	stw	%r25, [%r16 + 0x0066]
	.word 0xf42de039  ! 4636: STB_I	stb	%r26, [%r23 + 0x0039]
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f10  ! 4637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f10, %hpstate
	.word 0xf625c000  ! 4639: STW_R	stw	%r27, [%r23 + %r0]
cpu_intr_3_349:
	setx	0x460022, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b08  ! 4642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b08, %hpstate
	.word 0xf2f4e1a4  ! 4643: STXA_I	stxa	%r25, [%r19 + 0x01a4] %asi
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, c)
	.word 0xf824a051  ! 4647: STW_I	stw	%r28, [%r18 + 0x0051]
T3_asi_reg_rd_202:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 1)
	.word 0xb3510000  ! 4651: RDPR_TICK	rdpr	%tick, %r25
T3_asi_reg_wr_205:
	mov	0x25, %r14
	.word 0xf0f38400  ! 4652: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf2b560f3  ! 4655: STHA_I	stha	%r25, [%r21 + 0x00f3] %asi
	.word 0xb7480000  ! 4657: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
cpu_intr_3_350:
	setx	0x450336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_351:
	setx	0x450017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 32)
	.word 0xfc750000  ! 4664: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xfcb4e179  ! 4666: STHA_I	stha	%r30, [%r19 + 0x0179] %asi
	.word 0xfaa44020  ! 4667: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
T3_asi_reg_wr_206:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 4669: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_203:
	mov	0x2d, %r14
	.word 0xf8db89e0  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_207:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 4675: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_352:
	setx	0x470301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 7)
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c10  ! 4686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c10, %hpstate
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf82c20d7  ! 4688: STB_I	stb	%r28, [%r16 + 0x00d7]
T3_asi_reg_rd_204:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_208:
	mov	0x13, %r14
	.word 0xf8f389e0  ! 4692: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_353:
	setx	0x44022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_354:
	setx	0x450132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_205:
	mov	0x3, %r14
	.word 0xf6db8e60  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb9346001  ! 4704: SRL_I	srl 	%r17, 0x0001, %r28
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 35)
	.word 0xfa74215c  ! 4706: STX_I	stx	%r29, [%r16 + 0x015c]
	.word 0xf075215e  ! 4707: STX_I	stx	%r24, [%r20 + 0x015e]
cpu_intr_3_355:
	setx	0x46032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_206:
	mov	0x2, %r14
	.word 0xf4db84a0  ! 4717: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_356:
	setx	0x44000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcaca09b  ! 4719: STBA_I	stba	%r30, [%r18 + 0x009b] %asi
T3_asi_reg_rd_207:
	mov	0x24, %r14
	.word 0xfadb8e60  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_208:
	mov	0x35, %r14
	.word 0xfcdb8e60  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfab40020  ! 4723: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	.word 0xbeb58000  ! 4725: SUBCcc_R	orncc 	%r22, %r0, %r31
T3_asi_reg_wr_209:
	mov	0x3, %r14
	.word 0xfef38e40  ! 4727: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, b)
	.word 0xf2354000  ! 4730: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xfab5a0c0  ! 4733: STHA_I	stha	%r29, [%r22 + 0x00c0] %asi
	.word 0xfc2c8000  ! 4735: STB_R	stb	%r30, [%r18 + %r0]
T3_asi_reg_wr_210:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 4736: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_357:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf4ad8020  ! 4741: STBA_R	stba	%r26, [%r22 + %r0] 0x01
cpu_intr_3_358:
	setx	0x450237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_209:
	mov	0x2d, %r14
	.word 0xfadb8e60  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfea4c020  ! 4752: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xb0b4c000  ! 4754: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xf435c000  ! 4756: STH_R	sth	%r26, [%r23 + %r0]
T3_asi_reg_rd_210:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0f4e041  ! 4759: STXA_I	stxa	%r24, [%r19 + 0x0041] %asi
	.word 0xf635c000  ! 4760: STH_R	sth	%r27, [%r23 + %r0]
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_359:
	setx	0x460204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_360:
	setx	0x45000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_211:
	mov	0x3, %r14
	.word 0xfef38400  ! 4769: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_361:
	setx	0x44032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_212:
	mov	0x2f, %r14
	.word 0xf2f384a0  ! 4773: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf0f42157  ! 4775: STXA_I	stxa	%r24, [%r16 + 0x0157] %asi
cpu_intr_3_362:
	setx	0x450232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43da103  ! 4781: XNOR_I	xnor 	%r22, 0x0103, %r26
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_211:
	mov	0x37, %r14
	.word 0xf4db89e0  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfc7461cf  ! 4784: STX_I	stx	%r30, [%r17 + 0x01cf]
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 37)
	.word 0xf2b48020  ! 4787: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0xbab5201f  ! 4789: ORNcc_I	orncc 	%r20, 0x001f, %r29
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983bda  ! 4791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bda, %hpstate
T3_asi_reg_wr_213:
	mov	0x2f, %r14
	.word 0xf4f38e40  ! 4792: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
cpu_intr_3_363:
	setx	0x460307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_364:
	setx	0x46010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe358000  ! 4800: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xfe2d0000  ! 4801: STB_R	stb	%r31, [%r20 + %r0]
T3_asi_reg_rd_212:
	mov	0x23, %r14
	.word 0xf4db89e0  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_365:
	setx	0x450219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_213:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_366:
	setx	0x45001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_214:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 4809: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf024a09b  ! 4812: STW_I	stw	%r24, [%r18 + 0x009b]
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfe2d0000  ! 4815: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xb6350000  ! 4816: SUBC_R	orn 	%r20, %r0, %r27
T3_asi_reg_wr_215:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 4818: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_rd_214:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 4820: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_215:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbf3cc000  ! 4823: SRA_R	sra 	%r19, %r0, %r31
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_216:
	mov	0x36, %r14
	.word 0xfaf38e80  ! 4826: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_367:
	setx	0x460210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_217:
	mov	0xa, %r14
	.word 0xf2f38e80  ! 4829: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf0ac216c  ! 4830: STBA_I	stba	%r24, [%r16 + 0x016c] %asi
	.word 0xbf641800  ! 4831: MOVcc_R	<illegal instruction>
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_368:
	setx	0x440328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6958000  ! 4836: ORcc_R	orcc 	%r22, %r0, %r27
	.word 0xb89da02a  ! 4837: XORcc_I	xorcc 	%r22, 0x002a, %r28
	.word 0xbabcc000  ! 4838: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xfe24e01a  ! 4839: STW_I	stw	%r31, [%r19 + 0x001a]
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_216:
	mov	0x2f, %r14
	.word 0xfedb8400  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfab4209b  ! 4844: STHA_I	stha	%r29, [%r16 + 0x009b] %asi
cpu_intr_3_369:
	setx	0x450238, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_218:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4849: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_370:
	setx	0x470000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 7)
	.word 0xf0252141  ! 4855: STW_I	stw	%r24, [%r20 + 0x0141]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_371:
	setx	0x460232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_219:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 4862: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_217:
	mov	0x37, %r14
	.word 0xfadb8e60  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf6740000  ! 4867: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf624c000  ! 4872: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xfc346060  ! 4873: STH_I	sth	%r30, [%r17 + 0x0060]
	.word 0xfa2c200d  ! 4874: STB_I	stb	%r29, [%r16 + 0x000d]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ade01c  ! 4881: STBA_I	stba	%r24, [%r23 + 0x001c] %asi
T3_asi_reg_rd_218:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 4885: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6744000  ! 4886: STX_R	stx	%r27, [%r17 + %r0]
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983cd0  ! 4887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd0, %hpstate
	.word 0xb834a1b9  ! 4888: SUBC_I	orn 	%r18, 0x01b9, %r28
	.word 0xfa250000  ! 4892: STW_R	stw	%r29, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf4744000  ! 4898: STX_R	stx	%r26, [%r17 + %r0]
cpu_intr_3_372:
	setx	0x470128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_220:
	mov	0xc, %r14
	.word 0xf8f38400  ! 4901: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc35c000  ! 4902: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xf0f560af  ! 4904: STXA_I	stxa	%r24, [%r21 + 0x00af] %asi
	.word 0xf2ad4020  ! 4905: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xfc2dc000  ! 4908: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf6b40020  ! 4909: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0x9195610b  ! 4910: WRPR_PIL_I	wrpr	%r21, 0x010b, %pil
	.word 0xfea5c020  ! 4911: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0x8995e1b2  ! 4912: WRPR_TICK_I	wrpr	%r23, 0x01b2, %tick
cpu_intr_3_373:
	setx	0x440038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 11)
	.word 0xfe2d21eb  ! 4917: STB_I	stb	%r31, [%r20 + 0x01eb]
	.word 0xfca4c020  ! 4918: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
cpu_intr_3_374:
	setx	0x470022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 4920: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xf4354000  ! 4921: STH_R	sth	%r26, [%r21 + %r0]
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf47421d6  ! 4923: STX_I	stx	%r26, [%r16 + 0x01d6]
	.word 0xb43cc000  ! 4924: XNOR_R	xnor 	%r19, %r0, %r26
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_221:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 4927: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_222:
	mov	0x10, %r14
	.word 0xfef38e40  ! 4929: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa25e0ba  ! 4932: STW_I	stw	%r29, [%r23 + 0x00ba]
	.word 0xbc8da02e  ! 4933: ANDcc_I	andcc 	%r22, 0x002e, %r30
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 27)
	.word 0xf4256000  ! 4935: STW_I	stw	%r26, [%r21 + 0x0000]
	.word 0xfead61cc  ! 4936: STBA_I	stba	%r31, [%r21 + 0x01cc] %asi
	.word 0xf8758000  ! 4937: STX_R	stx	%r28, [%r22 + %r0]
T3_asi_reg_wr_223:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 4938: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfeb5e09a  ! 4939: STHA_I	stha	%r31, [%r23 + 0x009a] %asi
T3_asi_reg_wr_224:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 4940: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf82ce1ad  ! 4941: STB_I	stb	%r28, [%r19 + 0x01ad]
cpu_intr_3_375:
	setx	0x47000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa350000  ! 4944: STH_R	sth	%r29, [%r20 + %r0]
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf8a40020  ! 4946: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
cpu_intr_3_376:
	setx	0x470200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a50020  ! 4948: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_225:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 4954: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_377:
	setx	0x44011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a40020  ! 4956: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
cpu_intr_3_378:
	setx	0x470133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5207e  ! 4959: ORNcc_I	orncc 	%r20, 0x007e, %r25
cpu_intr_3_379:
	setx	0x460120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_380:
	setx	0x47032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcace114  ! 4963: STBA_I	stba	%r30, [%r19 + 0x0114] %asi
	.word 0xbaa5c000  ! 4964: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xb9345000  ! 4966: SRLX_R	srlx	%r17, %r0, %r28
T3_asi_reg_wr_226:
	mov	0xb, %r14
	.word 0xfaf389e0  ! 4967: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_rd_219:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_381:
	setx	0x46012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_382:
	setx	0x10322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_383:
	setx	0x460315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_220:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_227:
	mov	0xb, %r14
	.word 0xf0f38e60  ! 4983: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf6ace159  ! 4985: STBA_I	stba	%r27, [%r19 + 0x0159] %asi
	.word 0xfa2c4000  ! 4986: STB_R	stb	%r29, [%r17 + %r0]
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c5a  ! 4987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5a, %hpstate
	.word 0xfcade162  ! 4988: STBA_I	stba	%r30, [%r23 + 0x0162] %asi
	.word 0xf674e091  ! 4989: STX_I	stx	%r27, [%r19 + 0x0091]
	.word 0xfc258000  ! 4993: STW_R	stw	%r30, [%r22 + %r0]
cpu_intr_3_384:
	setx	0x470217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5a0fe  ! 4995: STWA_I	stwa	%r24, [%r22 + 0x00fe] %asi
cpu_intr_3_385:
	setx	0x45021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_221:
	mov	0x10, %r14
	.word 0xfadb8e80  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
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
	.word 0xfe440000  ! 1: LDSW_R	ldsw	[%r16 + %r0], %r31
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983ed8  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed8, %hpstate
cpu_intr_2_0:
	setx	0x1a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_0:
	mov	0x13, %r14
	.word 0xf8f38e40  ! 7: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xfa5561f3  ! 12: LDSH_I	ldsh	[%r21 + 0x01f3], %r29
	.word 0xfe0461bf  ! 15: LDUW_I	lduw	[%r17 + 0x01bf], %r31
	.word 0xfe5c60c2  ! 16: LDX_I	ldx	[%r17 + 0x00c2], %r31
	.word 0xf2156045  ! 18: LDUH_I	lduh	[%r21 + 0x0045], %r25
	.word 0xf6dd211d  ! 19: LDXA_I	ldxa	[%r20, + 0x011d] %asi, %r27
	.word 0xf85de09d  ! 20: LDX_I	ldx	[%r23 + 0x009d], %r28
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_1:
	mov	0x5, %r14
	.word 0xf4f384a0  ! 26: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf255a1c5  ! 28: LDSH_I	ldsh	[%r22 + 0x01c5], %r25
	.word 0xf8c56117  ! 30: LDSWA_I	ldswa	[%r21, + 0x0117] %asi, %r28
T2_asi_reg_rd_0:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 31: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_1:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc95a0f9  ! 37: LDUHA_I	lduha	[%r22, + 0x00f9] %asi, %r30
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 3)
	.word 0xb63c4000  ! 42: XNOR_R	xnor 	%r17, %r0, %r27
T2_asi_reg_rd_2:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 43: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc1520f8  ! 46: LDUH_I	lduh	[%r20 + 0x00f8], %r30
	.word 0xfacdc020  ! 47: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	.word 0xf2958020  ! 48: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
cpu_intr_2_1:
	setx	0x1f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa858020  ! 53: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
T2_asi_reg_rd_3:
	mov	0x23, %r14
	.word 0xf4db8400  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_4:
	mov	0x0, %r14
	.word 0xf0db89e0  ! 57: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf20ce177  ! 58: LDUB_I	ldub	[%r19 + 0x0177], %r25
	.word 0xf85cc000  ! 60: LDX_R	ldx	[%r19 + %r0], %r28
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_NONHPRIV
	.word 0xf84cc000  ! 63: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf6850020  ! 68: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
	.word 0xfac5e018  ! 69: LDSWA_I	ldswa	[%r23, + 0x0018] %asi, %r29
	.word 0xf6542043  ! 71: LDSH_I	ldsh	[%r16 + 0x0043], %r27
	.word 0xfe948020  ! 72: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	.word 0xf694c020  ! 79: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 12)
	.word 0xf6446008  ! 87: LDSW_I	ldsw	[%r17 + 0x0008], %r27
T2_asi_reg_rd_5:
	mov	0x15, %r14
	.word 0xfcdb8e40  ! 88: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf24ce1e4  ! 89: LDSB_I	ldsb	[%r19 + 0x01e4], %r25
T2_asi_reg_wr_2:
	mov	0x2a, %r14
	.word 0xf8f38e60  ! 90: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf68d217a  ! 92: LDUBA_I	lduba	[%r20, + 0x017a] %asi, %r27
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfacd61c3  ! 96: LDSBA_I	ldsba	[%r21, + 0x01c3] %asi, %r29
T2_asi_reg_wr_3:
	mov	0x18, %r14
	.word 0xfef384a0  ! 99: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb6c421af  ! 102: ADDCcc_I	addccc 	%r16, 0x01af, %r27
	.word 0xf0956103  ! 104: LDUHA_I	lduha	[%r21, + 0x0103] %asi, %r24
cpu_intr_2_2:
	setx	0x1d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_6:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 112: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_3:
	setx	0x1f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_4:
	mov	0x34, %r14
	.word 0xfef38e40  ! 117: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2d5c020  ! 118: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
	.word 0xf69421cc  ! 121: LDUHA_I	lduha	[%r16, + 0x01cc] %asi, %r27
	.word 0xb6948000  ! 122: ORcc_R	orcc 	%r18, %r0, %r27
T2_asi_reg_rd_7:
	mov	0x2a, %r14
	.word 0xfcdb8400  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfe4c6179  ! 126: LDSB_I	ldsb	[%r17 + 0x0179], %r31
T2_asi_reg_rd_8:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb6ad8000  ! 135: ANDNcc_R	andncc 	%r22, %r0, %r27
cpu_intr_2_4:
	setx	0x1d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc0020  ! 137: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xb695c000  ! 142: ORcc_R	orcc 	%r23, %r0, %r27
T2_asi_reg_wr_5:
	mov	0x2b, %r14
	.word 0xf0f38e80  ! 143: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb13d6001  ! 148: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xf45c21b6  ! 150: LDX_I	ldx	[%r16 + 0x01b6], %r26
	.word 0xf6cda130  ! 151: LDSBA_I	ldsba	[%r22, + 0x0130] %asi, %r27
	.word 0xfacc8020  ! 152: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ec8  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec8, %hpstate
cpu_intr_2_5:
	setx	0x1c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9ca047  ! 157: XORcc_I	xorcc 	%r18, 0x0047, %r31
	.word 0xb57d8400  ! 158: MOVR_R	movre	%r22, %r0, %r26
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_6:
	setx	0x1e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbeb4a1a9  ! 165: ORNcc_I	orncc 	%r18, 0x01a9, %r31
	.word 0xf4d4e14a  ! 167: LDSHA_I	ldsha	[%r19, + 0x014a] %asi, %r26
T2_asi_reg_wr_6:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 168: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_7:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 171: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfa94e003  ! 172: LDUHA_I	lduha	[%r19, + 0x0003] %asi, %r29
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, a)
	.word 0xf04cc000  ! 179: LDSB_R	ldsb	[%r19 + %r0], %r24
T2_asi_reg_wr_8:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 181: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf8dca19d  ! 183: LDXA_I	ldxa	[%r18, + 0x019d] %asi, %r28
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 14)
	.word 0xf25c203f  ! 191: LDX_I	ldx	[%r16 + 0x003f], %r25
	.word 0xb294a038  ! 194: ORcc_I	orcc 	%r18, 0x0038, %r25
T2_asi_reg_rd_9:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 198: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb2848000  ! 200: ADDcc_R	addcc 	%r18, %r0, %r25
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b02  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b02, %hpstate
	.word 0xfe55215c  ! 202: LDSH_I	ldsh	[%r20 + 0x015c], %r31
	.word 0xfc44217f  ! 204: LDSW_I	ldsw	[%r16 + 0x017f], %r30
	.word 0xf0d5a009  ! 207: LDSHA_I	ldsha	[%r22, + 0x0009] %asi, %r24
cpu_intr_2_7:
	setx	0x1c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb342001  ! 211: SRL_I	srl 	%r16, 0x0001, %r29
cpu_intr_2_8:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_9:
	setx	0x1e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a4e1b2  ! 215: SUBcc_I	subcc 	%r19, 0x01b2, %r26
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_9:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 221: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_rd_10:
	mov	0x14, %r14
	.word 0xf2db84a0  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_10:
	setx	0x1f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4421c8  ! 231: LDSW_I	ldsw	[%r16 + 0x01c8], %r31
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 0)
	.word 0xbf3cb001  ! 241: SRAX_I	srax	%r18, 0x0001, %r31
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 16)
	.word 0xfe95a06a  ! 245: LDUHA_I	lduha	[%r22, + 0x006a] %asi, %r31
cpu_intr_2_11:
	setx	0x1f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_10:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 254: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf68c4020  ! 255: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982bd2  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd2, %hpstate
	.word 0xf255617a  ! 260: LDSH_I	ldsh	[%r21 + 0x017a], %r25
	.word 0xf2c48020  ! 262: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
cpu_intr_2_12:
	setx	0x1c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_11:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 275: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_13:
	setx	0x1e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983892  ! 277: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1892, %hpstate
cpu_intr_2_14:
	setx	0x1c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_15:
	setx	0x1f002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_12:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 282: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_16:
	setx	0x1c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4ca14d  ! 284: LDSB_I	ldsb	[%r18 + 0x014d], %r29
	.word 0xfc8561a8  ! 285: LDUWA_I	lduwa	[%r21, + 0x01a8] %asi, %r30
T2_asi_reg_rd_11:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x83946174  ! 288: WRPR_TNPC_I	wrpr	%r17, 0x0174, %tnpc
	.word 0x8d952152  ! 290: WRPR_PSTATE_I	wrpr	%r20, 0x0152, %pstate
	.word 0xf2050000  ! 293: LDUW_R	lduw	[%r20 + %r0], %r25
cpu_intr_2_17:
	setx	0x1f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80c0000  ! 299: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf85c8000  ! 301: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xfc840020  ! 305: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
	.word 0xf0046094  ! 307: LDUW_I	lduw	[%r17 + 0x0094], %r24
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_TO_TL0
	.word 0xbec521e1  ! 326: ADDCcc_I	addccc 	%r20, 0x01e1, %r31
T2_asi_reg_rd_12:
	mov	0x33, %r14
	.word 0xf4db89e0  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfcd56106  ! 328: LDSHA_I	ldsha	[%r21, + 0x0106] %asi, %r30
	.word 0xf884607b  ! 332: LDUWA_I	lduwa	[%r17, + 0x007b] %asi, %r28
T2_asi_reg_wr_13:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 333: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_14:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 334: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf215c000  ! 335: LDUH_R	lduh	[%r23 + %r0], %r25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_13:
	mov	0x13, %r14
	.word 0xf0db89e0  ! 338: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2848020  ! 341: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xfa85204a  ! 343: LDUWA_I	lduwa	[%r20, + 0x004a] %asi, %r29
	.word 0xf0846110  ! 344: LDUWA_I	lduwa	[%r17, + 0x0110] %asi, %r24
	.word 0xfa5d8000  ! 345: LDX_R	ldx	[%r22 + %r0], %r29
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, c)
	.word 0xf40561f0  ! 350: LDUW_I	lduw	[%r21 + 0x01f0], %r26
cpu_intr_2_18:
	setx	0x1c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4de1a6  ! 352: LDSB_I	ldsb	[%r23 + 0x01a6], %r30
	.word 0xf6d48020  ! 355: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
cpu_intr_2_19:
	setx	0x1d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_15:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 357: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_20:
	setx	0x1c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d613a  ! 359: LDX_I	ldx	[%r21 + 0x013a], %r26
	.word 0xf4054000  ! 361: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xbc1cc000  ! 364: XOR_R	xor 	%r19, %r0, %r30
cpu_intr_2_21:
	setx	0x1e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_22:
	setx	0x1f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_16:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 375: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xf6d421b2  ! 377: LDSHA_I	ldsha	[%r16, + 0x01b2] %asi, %r27
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_14:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_15:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_16:
	mov	0x26, %r14
	.word 0xfcdb8e40  ! 383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf44c4000  ! 384: LDSB_R	ldsb	[%r17 + %r0], %r26
T2_asi_reg_rd_17:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb6ac0000  ! 389: ANDNcc_R	andncc 	%r16, %r0, %r27
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_17:
	mov	0x16, %r14
	.word 0xf6f38400  ! 395: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfed58020  ! 397: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_18:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbeb5a0ae  ! 400: ORNcc_I	orncc 	%r22, 0x00ae, %r31
cpu_intr_2_23:
	setx	0x1c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 36)
	.word 0xf88c4020  ! 406: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
T2_asi_reg_wr_18:
	mov	0x16, %r14
	.word 0xfcf389e0  ! 408: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfc5da1dd  ! 409: LDX_I	ldx	[%r22 + 0x01dd], %r30
cpu_intr_2_24:
	setx	0x1c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52cc000  ! 412: SLL_R	sll 	%r19, %r0, %r26
cpu_intr_2_25:
	setx	0x1e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4254000  ! 416: SUB_R	sub 	%r21, %r0, %r26
	.word 0x8d94612d  ! 419: WRPR_PSTATE_I	wrpr	%r17, 0x012d, %pstate
	.word 0xf0c4e129  ! 420: LDSWA_I	ldswa	[%r19, + 0x0129] %asi, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf00ca0b5  ! 424: LDUB_I	ldub	[%r18 + 0x00b5], %r24
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_19:
	mov	0x4, %r14
	.word 0xfaf38e80  ! 428: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_19:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0054000  ! 431: LDUW_R	lduw	[%r21 + %r0], %r24
	.word 0xb97c2401  ! 432: MOVR_I	movre	%r16, 0x1, %r28
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, b)
	.word 0xbf359000  ! 440: SRLX_R	srlx	%r22, %r0, %r31
	.word 0xf455a178  ! 441: LDSH_I	ldsh	[%r22 + 0x0178], %r26
	.word 0xf85dc000  ! 444: LDX_R	ldx	[%r23 + %r0], %r28
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 27)
	.word 0xfa5c4000  ! 449: LDX_R	ldx	[%r17 + %r0], %r29
cpu_intr_2_26:
	setx	0x220037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814c000  ! 451: LDUH_R	lduh	[%r19 + %r0], %r28
T2_asi_reg_rd_20:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf84c21dd  ! 454: LDSB_I	ldsb	[%r16 + 0x01dd], %r28
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 19)
	.word 0xf60dc000  ! 457: LDUB_R	ldub	[%r23 + %r0], %r27
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_HPRIV
cpu_intr_2_27:
	setx	0x22021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x220318, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 466: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_21:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 467: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf24d0000  ! 470: LDSB_R	ldsb	[%r20 + %r0], %r25
T2_asi_reg_rd_22:
	mov	0x9, %r14
	.word 0xf8db8e60  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf60c2009  ! 472: LDUB_I	ldub	[%r16 + 0x0009], %r27
	.word 0xf25c21f3  ! 473: LDX_I	ldx	[%r16 + 0x01f3], %r25
T2_asi_reg_rd_23:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_29:
	setx	0x210023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf8542021  ! 482: LDSH_I	ldsh	[%r16 + 0x0021], %r28
	.word 0xbac4c000  ! 485: ADDCcc_R	addccc 	%r19, %r0, %r29
T2_asi_reg_rd_24:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 486: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_30:
	setx	0x210119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_31:
	setx	0x200306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bde11c  ! 497: XNORcc_I	xnorcc 	%r23, 0x011c, %r28
	.word 0xf6158000  ! 498: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xfadca150  ! 501: LDXA_I	ldxa	[%r18, + 0x0150] %asi, %r29
	.word 0xf2948020  ! 503: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
cpu_intr_2_32:
	setx	0x23023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dde169  ! 505: LDXA_I	ldxa	[%r23, + 0x0169] %asi, %r27
cpu_intr_2_33:
	setx	0x200012, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ad2  ! 508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad2, %hpstate
	.word 0xfa8ca039  ! 514: LDUBA_I	lduba	[%r18, + 0x0039] %asi, %r29
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_34:
	setx	0x21010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_35:
	setx	0x230034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_36:
	setx	0x21033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c2179  ! 521: LDUB_I	ldub	[%r16 + 0x0179], %r27
	.word 0xf4046138  ! 522: LDUW_I	lduw	[%r17 + 0x0138], %r26
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 1b)
	.word 0xba35c000  ! 531: SUBC_R	orn 	%r23, %r0, %r29
T2_asi_reg_rd_25:
	mov	0x35, %r14
	.word 0xf0db84a0  ! 533: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 3b)
	.word 0xba0c0000  ! 535: AND_R	and 	%r16, %r0, %r29
cpu_intr_2_37:
	setx	0x210334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe248000  ! 539: SUB_R	sub 	%r18, %r0, %r31
	.word 0x8194a198  ! 540: WRPR_TPC_I	wrpr	%r18, 0x0198, %tpc
T2_asi_reg_rd_26:
	mov	0x4, %r14
	.word 0xfedb84a0  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 29)
	.word 0x9195a05e  ! 547: WRPR_PIL_I	wrpr	%r22, 0x005e, %pil
cpu_intr_2_38:
	setx	0x210005, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_27:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa8d8020  ! 553: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
	.word 0xfcc5a103  ! 554: LDSWA_I	ldswa	[%r22, + 0x0103] %asi, %r30
	.word 0xf6cd209a  ! 563: LDSBA_I	ldsba	[%r20, + 0x009a] %asi, %r27
cpu_intr_2_39:
	setx	0x200102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_40:
	setx	0x230327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 38)
	.word 0xfc944020  ! 572: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
cpu_intr_2_41:
	setx	0x21020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_42:
	setx	0x23020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5a05f  ! 580: ADDCcc_I	addccc 	%r22, 0x005f, %r28
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 15)
	.word 0xf885c020  ! 582: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
T2_asi_reg_rd_28:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf014a122  ! 587: LDUH_I	lduh	[%r18 + 0x0122], %r24
	ta	T_CHANGE_HPRIV
	.word 0xfe9520c9  ! 589: LDUHA_I	lduha	[%r20, + 0x00c9] %asi, %r31
	.word 0xb17cc400  ! 592: MOVR_R	movre	%r19, %r0, %r24
	.word 0xf64d4000  ! 594: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xbabda145  ! 597: XNORcc_I	xnorcc 	%r22, 0x0145, %r29
cpu_intr_2_43:
	setx	0x220202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_21:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 599: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 29)
	.word 0xbe2c4000  ! 603: ANDN_R	andn 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0xbcb4a17e  ! 612: SUBCcc_I	orncc 	%r18, 0x017e, %r30
	.word 0xfc5d4000  ! 613: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xf88d212b  ! 614: LDUBA_I	lduba	[%r20, + 0x012b] %asi, %r28
	.word 0xf48d4020  ! 619: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xfac5e0af  ! 620: LDSWA_I	ldswa	[%r23, + 0x00af] %asi, %r29
T2_asi_reg_wr_22:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 621: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb005e1b8  ! 622: ADD_I	add 	%r23, 0x01b8, %r24
	.word 0xf04c20f3  ! 626: LDSB_I	ldsb	[%r16 + 0x00f3], %r24
	.word 0xf0c560b2  ! 628: LDSWA_I	ldswa	[%r21, + 0x00b2] %asi, %r24
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_29:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_23:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 640: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_30:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 641: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_44:
	setx	0x22023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2040000  ! 643: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xfc852083  ! 644: LDUWA_I	lduwa	[%r20, + 0x0083] %asi, %r30
T2_asi_reg_wr_24:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 646: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf694613b  ! 649: LDUHA_I	lduha	[%r17, + 0x013b] %asi, %r27
cpu_intr_2_45:
	setx	0x22013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 35)
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
cpu_intr_2_46:
	setx	0x210227, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_25:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 660: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_wr_26:
	mov	0x36, %r14
	.word 0xf8f384a0  ! 664: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 35)
	.word 0xf8948020  ! 668: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	.word 0xb6b521a3  ! 671: ORNcc_I	orncc 	%r20, 0x01a3, %r27
	.word 0xbab50000  ! 675: SUBCcc_R	orncc 	%r20, %r0, %r29
cpu_intr_2_47:
	setx	0x21023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c54020  ! 677: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
cpu_intr_2_48:
	setx	0x230238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd2128  ! 680: LDSBA_I	ldsba	[%r20, + 0x0128] %asi, %r27
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 0)
	.word 0xf45ca1d5  ! 684: LDX_I	ldx	[%r18 + 0x01d5], %r26
cpu_intr_2_49:
	setx	0x230218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c8000  ! 686: SLL_R	sll 	%r18, %r0, %r24
T2_asi_reg_wr_27:
	mov	0x1c, %r14
	.word 0xfef38e80  ! 687: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe444000  ! 688: LDSW_R	ldsw	[%r17 + %r0], %r31
T2_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 689: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_29:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 693: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_50:
	setx	0x200324, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_30:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 699: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_51:
	setx	0x21023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_31:
	mov	0x25, %r14
	.word 0xf2f38e80  ! 703: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_32:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 707: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_31:
	mov	0x7, %r14
	.word 0xf6db8e40  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_52:
	setx	0x22013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc540000  ! 714: LDSH_R	ldsh	[%r16 + %r0], %r30
	.word 0xfa0cc000  ! 716: LDUB_R	ldub	[%r19 + %r0], %r29
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_33:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 718: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb3518000  ! 721: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_rd_32:
	mov	0x28, %r14
	.word 0xf8db8e60  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_33:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb77d0400  ! 730: MOVR_R	movre	%r20, %r0, %r27
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_34:
	mov	0xa, %r14
	.word 0xfcdb84a0  ! 732: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_35:
	mov	0x2b, %r14
	.word 0xf0db84a0  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfcd50020  ! 734: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
cpu_intr_2_53:
	setx	0x23033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_34:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 738: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_35:
	mov	0x1f, %r14
	.word 0xf2f384a0  ! 743: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_36:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb6b50000  ! 749: SUBCcc_R	orncc 	%r20, %r0, %r27
T2_asi_reg_wr_36:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 752: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf80d6163  ! 758: LDUB_I	ldub	[%r21 + 0x0163], %r28
	.word 0xf44d8000  ! 763: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xfec58020  ! 765: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
	.word 0xfad58020  ! 769: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r29
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, d)
	.word 0xb634a13c  ! 772: SUBC_I	orn 	%r18, 0x013c, %r27
	.word 0xb0c54000  ! 775: ADDCcc_R	addccc 	%r21, %r0, %r24
T2_asi_reg_wr_37:
	mov	0x2b, %r14
	.word 0xfef389e0  ! 778: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf80ce126  ! 779: LDUB_I	ldub	[%r19 + 0x0126], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa458000  ! 783: LDSW_R	ldsw	[%r22 + %r0], %r29
cpu_intr_2_54:
	setx	0x220302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c7001  ! 787: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xf6044000  ! 790: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xf4d5a1c4  ! 792: LDSHA_I	ldsha	[%r22, + 0x01c4] %asi, %r26
T2_asi_reg_wr_38:
	mov	0x1a, %r14
	.word 0xf2f38400  ! 793: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_55:
	setx	0x22000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb625e10b  ! 802: SUB_I	sub 	%r23, 0x010b, %r27
cpu_intr_2_56:
	setx	0x230301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb615c000  ! 804: OR_R	or 	%r23, %r0, %r27
	.word 0xf2d4e05d  ! 805: LDSHA_I	ldsha	[%r19, + 0x005d] %asi, %r25
	ta	T_CHANGE_HPRIV
	.word 0xf014217a  ! 807: LDUH_I	lduh	[%r16 + 0x017a], %r24
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf044606c  ! 813: LDSW_I	ldsw	[%r17 + 0x006c], %r24
	.word 0xf845a132  ! 816: LDSW_I	ldsw	[%r22 + 0x0132], %r28
	.word 0xb92d4000  ! 818: SLL_R	sll 	%r21, %r0, %r28
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_57:
	setx	0x21003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_37:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf6858020  ! 828: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
	.word 0xba0cc000  ! 829: AND_R	and 	%r19, %r0, %r29
cpu_intr_2_58:
	setx	0x210328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc5c020  ! 833: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
	.word 0xfc0d6190  ! 834: LDUB_I	ldub	[%r21 + 0x0190], %r30
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 838: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	.word 0xf8cdc020  ! 842: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_59:
	setx	0x21023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfc8c2182  ! 856: LDUBA_I	lduba	[%r16, + 0x0182] %asi, %r30
T2_asi_reg_wr_40:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 857: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf6150000  ! 858: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xfa0c6030  ! 859: LDUB_I	ldub	[%r17 + 0x0030], %r29
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_38:
	mov	0x1, %r14
	.word 0xf4db8e60  ! 862: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb4a50000  ! 866: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0xbb2c6001  ! 867: SLL_I	sll 	%r17, 0x0001, %r29
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_39:
	mov	0x33, %r14
	.word 0xfedb89e0  ! 874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf4d5e1c9  ! 876: LDSHA_I	ldsha	[%r23, + 0x01c9] %asi, %r26
	.word 0xbb51c000  ! 881: RDPR_TL	<illegal instruction>
T2_asi_reg_rd_40:
	mov	0x10, %r14
	.word 0xfadb8400  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_60:
	setx	0x22020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5e1c9  ! 889: LDSWA_I	ldswa	[%r23, + 0x01c9] %asi, %r31
cpu_intr_2_61:
	setx	0x27020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0146018  ! 895: LDUH_I	lduh	[%r17 + 0x0018], %r24
	.word 0xfc4c0000  ! 896: LDSB_R	ldsb	[%r16 + %r0], %r30
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 1d)
	.word 0xba3c60ea  ! 899: XNOR_I	xnor 	%r17, 0x00ea, %r29
cpu_intr_2_62:
	setx	0x250308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c21ff  ! 903: LDUBA_I	lduba	[%r16, + 0x01ff] %asi, %r27
	.word 0xb3508000  ! 905: RDPR_TSTATE	<illegal instruction>
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_41:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 909: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_63:
	setx	0x260139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c56121  ! 914: ADDCcc_I	addccc 	%r21, 0x0121, %r28
T2_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xf0f38400  ! 917: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf005e09e  ! 924: LDUW_I	lduw	[%r23 + 0x009e], %r24
cpu_intr_2_64:
	setx	0x270333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9460fb  ! 927: WRPR_PSTATE_I	wrpr	%r17, 0x00fb, %pstate
T2_asi_reg_wr_43:
	mov	0x3, %r14
	.word 0xfef38e60  ! 928: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_wr_44:
	mov	0x37, %r14
	.word 0xf0f389e0  ! 930: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_65:
	setx	0x250123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 26)
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b80  ! 940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_45:
	mov	0x2, %r14
	.word 0xf4f38400  ! 942: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 39)
	.word 0xf24d8000  ! 944: LDSB_R	ldsb	[%r22 + %r0], %r25
cpu_intr_2_66:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 948: RDPR_TNPC	<illegal instruction>
	.word 0xf64ca145  ! 950: LDSB_I	ldsb	[%r18 + 0x0145], %r27
	.word 0xfc95e0f6  ! 951: LDUHA_I	lduha	[%r23, + 0x00f6] %asi, %r30
	.word 0xfe950020  ! 953: LDUHA_R	lduha	[%r20, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
cpu_intr_2_67:
	setx	0x240217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434e1ca  ! 961: ORN_I	orn 	%r19, 0x01ca, %r26
T2_asi_reg_wr_46:
	mov	0x37, %r14
	.word 0xf0f389e0  ! 962: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_68:
	setx	0x26020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0x21, %r14
	.word 0xf2f384a0  ! 969: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xba354000  ! 973: ORN_R	orn 	%r21, %r0, %r29
	.word 0xb0acc000  ! 975: ANDNcc_R	andncc 	%r19, %r0, %r24
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, c)
	.word 0xb82ce092  ! 978: ANDN_I	andn 	%r19, 0x0092, %r28
T2_asi_reg_rd_41:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 979: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_48:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 980: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfcdda053  ! 981: LDXA_I	ldxa	[%r22, + 0x0053] %asi, %r30
	.word 0xf2c4e078  ! 985: LDSWA_I	ldswa	[%r19, + 0x0078] %asi, %r25
	.word 0x8194a16d  ! 986: WRPR_TPC_I	wrpr	%r18, 0x016d, %tpc
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_69:
	setx	0x240129, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_42:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_43:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x8395e1b3  ! 999: WRPR_TNPC_I	wrpr	%r23, 0x01b3, %tnpc
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_70:
	setx	0x270102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5de012  ! 1002: LDX_I	ldx	[%r23 + 0x0012], %r31
	.word 0xfa144000  ! 1003: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xb13ca001  ! 1005: SRA_I	sra 	%r18, 0x0001, %r24
cpu_intr_2_71:
	setx	0x240327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_72:
	setx	0x27013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cde070  ! 1016: LDSBA_I	ldsba	[%r23, + 0x0070] %asi, %r27
cpu_intr_2_73:
	setx	0x270129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c5e015  ! 1018: LDSWA_I	ldswa	[%r23, + 0x0015] %asi, %r28
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_44:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1021: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_49:
	mov	0x33, %r14
	.word 0xfef38e80  ! 1024: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_50:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 1027: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_74:
	setx	0x260104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_45:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 33)
	.word 0xf65421f6  ! 1045: LDSH_I	ldsh	[%r16 + 0x01f6], %r27
T2_asi_reg_rd_46:
	mov	0x12, %r14
	.word 0xfcdb8e80  ! 1047: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa5c4000  ! 1048: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xbd3d8000  ! 1049: SRA_R	sra 	%r22, %r0, %r30
cpu_intr_2_75:
	setx	0x240107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, b)
	.word 0xf6dc2012  ! 1059: LDXA_I	ldxa	[%r16, + 0x0012] %asi, %r27
cpu_intr_2_76:
	setx	0x27013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_51:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 1063: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_77:
	setx	0x270323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_78:
	setx	0x240006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf895a133  ! 1066: LDUHA_I	lduha	[%r22, + 0x0133] %asi, %r28
T2_asi_reg_wr_52:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 1071: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf4440000  ! 1072: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf0948020  ! 1075: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
T2_asi_reg_rd_47:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfcc421bb  ! 1079: LDSWA_I	ldswa	[%r16, + 0x01bb] %asi, %r30
cpu_intr_2_79:
	setx	0x240335, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_53:
	mov	0x2e, %r14
	.word 0xf8f38e60  ! 1081: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf28ca1c8  ! 1083: LDUBA_I	lduba	[%r18, + 0x01c8] %asi, %r25
	.word 0xfc15c000  ! 1084: LDUH_R	lduh	[%r23 + %r0], %r30
cpu_intr_2_80:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_54:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 1091: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfa5d4000  ! 1092: LDX_R	ldx	[%r21 + %r0], %r29
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_55:
	mov	0x11, %r14
	.word 0xf6f389e0  ! 1094: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_48:
	mov	0x20, %r14
	.word 0xf6db8e80  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb0c44000  ! 1098: ADDCcc_R	addccc 	%r17, %r0, %r24
cpu_intr_2_81:
	setx	0x250107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_56:
	mov	0x3, %r14
	.word 0xf8f38e80  ! 1102: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf28dc020  ! 1103: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xb01ce176  ! 1107: XOR_I	xor 	%r19, 0x0176, %r24
	.word 0xb605216d  ! 1110: ADD_I	add 	%r20, 0x016d, %r27
cpu_intr_2_82:
	setx	0x24011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d8000  ! 1114: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xf8146063  ! 1115: LDUH_I	lduh	[%r17 + 0x0063], %r28
T2_asi_reg_wr_57:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1116: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0c4000  ! 1129: LDUB_R	ldub	[%r17 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf80c8000  ! 1133: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xf295c020  ! 1135: LDUHA_R	lduha	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_58:
	mov	0xb, %r14
	.word 0xf8f38e60  ! 1139: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
cpu_intr_2_83:
	setx	0x25031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 1146: MOVcc_R	<illegal instruction>
	.word 0xfa840020  ! 1151: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 21)
	.word 0xfa4dc000  ! 1154: LDSB_R	ldsb	[%r23 + %r0], %r29
	ta	T_CHANGE_TO_TL1
cpu_intr_2_84:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe948020  ! 1163: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_49:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_59:
	mov	0x12, %r14
	.word 0xf2f38400  ! 1167: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_85:
	setx	0x260000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_86:
	setx	0x240316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_87:
	setx	0x270035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_60:
	mov	0x2c, %r14
	.word 0xf4f38e60  ! 1194: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf00c217d  ! 1197: LDUB_I	ldub	[%r16 + 0x017d], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf405e09d  ! 1202: LDUW_I	lduw	[%r23 + 0x009d], %r26
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 6)
	.word 0xf8cc4020  ! 1208: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
	.word 0xf0056044  ! 1209: LDUW_I	lduw	[%r21 + 0x0044], %r24
T2_asi_reg_wr_61:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 1210: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 1)
	.word 0xba346145  ! 1215: SUBC_I	orn 	%r17, 0x0145, %r29
T2_asi_reg_rd_50:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_88:
	setx	0x26012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_89:
	setx	0x250135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73cc000  ! 1220: SRA_R	sra 	%r19, %r0, %r27
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 37)
	.word 0x8f902000  ! 1226: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xfe4c6106  ! 1227: LDSB_I	ldsb	[%r17 + 0x0106], %r31
T2_asi_reg_rd_51:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf6d46188  ! 1229: LDSHA_I	ldsha	[%r17, + 0x0188] %asi, %r27
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 18)
	.word 0xb4054000  ! 1237: ADD_R	add 	%r21, %r0, %r26
T2_asi_reg_rd_52:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf0cc4020  ! 1240: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 0)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a92  ! 1244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
T2_asi_reg_wr_62:
	mov	0x1b, %r14
	.word 0xfef38400  ! 1247: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_63:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 1249: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6152039  ! 1250: LDUH_I	lduh	[%r20 + 0x0039], %r27
T2_asi_reg_rd_53:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc45c000  ! 1255: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xb9504000  ! 1256: RDPR_TNPC	<illegal instruction>
cpu_intr_2_90:
	setx	0x250323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88de19c  ! 1258: LDUBA_I	lduba	[%r23, + 0x019c] %asi, %r28
cpu_intr_2_91:
	setx	0x240310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 38)
	.word 0xb0bc4000  ! 1265: XNORcc_R	xnorcc 	%r17, %r0, %r24
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 16)
	.word 0xb02c6144  ! 1268: ANDN_I	andn 	%r17, 0x0144, %r24
T2_asi_reg_wr_64:
	mov	0x12, %r14
	.word 0xf2f384a0  ! 1269: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_92:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedd204e  ! 1271: LDXA_I	ldxa	[%r20, + 0x004e] %asi, %r31
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe552181  ! 1274: LDSH_I	ldsh	[%r20 + 0x0181], %r31
	.word 0xf6d50020  ! 1275: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_54:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_93:
	setx	0x26002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_65:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 1285: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb9340000  ! 1287: SRL_R	srl 	%r16, %r0, %r28
cpu_intr_2_94:
	setx	0x250126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb24520e6  ! 1291: ADDC_I	addc 	%r20, 0x00e6, %r25
	.word 0xfc5d61a9  ! 1292: LDX_I	ldx	[%r21 + 0x01a9], %r30
T2_asi_reg_rd_55:
	mov	0xb, %r14
	.word 0xf2db84a0  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_rd_56:
	mov	0x2c, %r14
	.word 0xf8db89e0  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_95:
	setx	0x250320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c561ba  ! 1300: LDSWA_I	ldswa	[%r21, + 0x01ba] %asi, %r27
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 26)
	.word 0xf0c4212b  ! 1306: LDSWA_I	ldswa	[%r16, + 0x012b] %asi, %r24
T2_asi_reg_wr_66:
	mov	0x28, %r14
	.word 0xf2f38400  ! 1307: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb93de001  ! 1308: SRA_I	sra 	%r23, 0x0001, %r28
	.word 0xf6c4a07e  ! 1309: LDSWA_I	ldswa	[%r18, + 0x007e] %asi, %r27
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_57:
	mov	0x1f, %r14
	.word 0xf0db89e0  ! 1311: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3510000  ! 1313: RDPR_TICK	<illegal instruction>
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_96:
	setx	0x270321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf855c000  ! 1319: LDSH_R	ldsh	[%r23 + %r0], %r28
T2_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_59:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_97:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_98:
	setx	0x240114, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_60:
	mov	0x15, %r14
	.word 0xf6db8400  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfa8d0020  ! 1328: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_61:
	mov	0x31, %r14
	.word 0xf0db8e80  ! 1329: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc54c000  ! 1330: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xf0150000  ! 1331: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb6b50000  ! 1332: SUBCcc_R	orncc 	%r20, %r0, %r27
T2_asi_reg_rd_62:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf24d8000  ! 1336: LDSB_R	ldsb	[%r22 + %r0], %r25
cpu_intr_2_99:
	setx	0x260215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe444000  ! 1338: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xbe34e191  ! 1340: ORN_I	orn 	%r19, 0x0191, %r31
T2_asi_reg_wr_67:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 1345: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_100:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095e1bf  ! 1353: LDUHA_I	lduha	[%r23, + 0x01bf] %asi, %r24
cpu_intr_2_101:
	setx	0x240117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb484c000  ! 1358: ADDcc_R	addcc 	%r19, %r0, %r26
cpu_intr_2_102:
	setx	0x29021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64c60de  ! 1362: LDSB_I	ldsb	[%r17 + 0x00de], %r27
T2_asi_reg_rd_63:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 27)
	.word 0xfecd60a6  ! 1366: LDSBA_I	ldsba	[%r21, + 0x00a6] %asi, %r31
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 2)
	.word 0xbd7d0400  ! 1372: MOVR_R	movre	%r20, %r0, %r30
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_103:
	setx	0x29031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_68:
	mov	0x16, %r14
	.word 0xfcf38e80  ! 1375: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_104:
	setx	0x290011, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_69:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 1377: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_70:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 1379: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_wr_71:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 1380: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_105:
	setx	0x290218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_72:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 1384: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_wr_73:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 1386: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, b)
	.word 0xfcd4a17d  ! 1388: LDSHA_I	ldsha	[%r18, + 0x017d] %asi, %r30
T2_asi_reg_rd_64:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_106:
	setx	0x2b0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_74:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 1397: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_107:
	setx	0x29021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfac50020  ! 1407: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_65:
	mov	0x4, %r14
	.word 0xfadb84a0  ! 1408: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfe4da08d  ! 1413: LDSB_I	ldsb	[%r22 + 0x008d], %r31
	.word 0xf20d6154  ! 1417: LDUB_I	ldub	[%r21 + 0x0154], %r25
T2_asi_reg_rd_66:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfe4ce081  ! 1421: LDSB_I	ldsb	[%r19 + 0x0081], %r31
	.word 0xb0356005  ! 1423: SUBC_I	orn 	%r21, 0x0005, %r24
cpu_intr_2_108:
	setx	0x29012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_75:
	mov	0x14, %r14
	.word 0xfef38e60  ! 1425: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb4448000  ! 1428: ADDC_R	addc 	%r18, %r0, %r26
	.word 0xf2850020  ! 1429: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
T2_asi_reg_wr_76:
	mov	0x7, %r14
	.word 0xf0f38e60  ! 1431: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf0058000  ! 1432: LDUW_R	lduw	[%r22 + %r0], %r24
T2_asi_reg_rd_67:
	mov	0x1c, %r14
	.word 0xfcdb8e80  ! 1433: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_68:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 1434: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb17d0400  ! 1435: MOVR_R	movre	%r20, %r0, %r24
T2_asi_reg_rd_69:
	mov	0x38, %r14
	.word 0xfcdb8400  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb951c000  ! 1438: RDPR_TL	<illegal instruction>
cpu_intr_2_109:
	setx	0x2a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c61e1  ! 1441: LDSB_I	ldsb	[%r17 + 0x01e1], %r30
	.word 0xfa4d20f2  ! 1443: LDSB_I	ldsb	[%r20 + 0x00f2], %r29
	.word 0xfe5de029  ! 1444: LDX_I	ldx	[%r23 + 0x0029], %r31
T2_asi_reg_rd_70:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 31)
	.word 0xfc840020  ! 1450: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
	.word 0xfc84a1ea  ! 1451: LDUWA_I	lduwa	[%r18, + 0x01ea] %asi, %r30
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 20)
	.word 0xfc0c4000  ! 1458: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xfe15a05e  ! 1462: LDUH_I	lduh	[%r22 + 0x005e], %r31
cpu_intr_2_110:
	setx	0x2b000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_77:
	mov	0x1d, %r14
	.word 0xfef38400  ! 1464: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf884c020  ! 1465: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r28
	.word 0xf4544000  ! 1466: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb73cb001  ! 1468: SRAX_I	srax	%r18, 0x0001, %r27
	.word 0xfc8ca120  ! 1469: LDUBA_I	lduba	[%r18, + 0x0120] %asi, %r30
	.word 0xfe05e116  ! 1470: LDUW_I	lduw	[%r23 + 0x0116], %r31
	.word 0xb0158000  ! 1475: OR_R	or 	%r22, %r0, %r24
T2_asi_reg_wr_78:
	mov	0x2f, %r14
	.word 0xfcf38400  ! 1477: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_rd_71:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_79:
	mov	0x1d, %r14
	.word 0xfaf389e0  ! 1483: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, d)
	.word 0xf455c000  ! 1491: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xfe952018  ! 1493: LDUHA_I	lduha	[%r20, + 0x0018] %asi, %r31
	.word 0xf855217f  ! 1496: LDSH_I	ldsh	[%r20 + 0x017f], %r28
cpu_intr_2_111:
	setx	0x2a0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_72:
	mov	0x10, %r14
	.word 0xfadb8e40  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa556157  ! 1502: LDSH_I	ldsh	[%r21 + 0x0157], %r29
T2_asi_reg_rd_73:
	mov	0x22, %r14
	.word 0xf2db84a0  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe05c000  ! 1507: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xfc05204e  ! 1509: LDUW_I	lduw	[%r20 + 0x004e], %r30
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_112:
	setx	0x2a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_113:
	setx	0x29010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_80:
	mov	0x16, %r14
	.word 0xf0f38400  ! 1517: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbf7c2401  ! 1520: MOVR_I	movre	%r16, 0x1, %r31
	.word 0xfacda13f  ! 1525: LDSBA_I	ldsba	[%r22, + 0x013f] %asi, %r29
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_114:
	setx	0x290028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_115:
	setx	0x280228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_116:
	setx	0x2a0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_117:
	setx	0x2b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 19)
	.word 0xb294a062  ! 1539: ORcc_I	orcc 	%r18, 0x0062, %r25
	.word 0xfe04216d  ! 1540: LDUW_I	lduw	[%r16 + 0x016d], %r31
	.word 0xfccca15d  ! 1541: LDSBA_I	ldsba	[%r18, + 0x015d] %asi, %r30
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_118:
	setx	0x2a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2042105  ! 1546: LDUW_I	lduw	[%r16 + 0x0105], %r25
	.word 0xfe44e0cf  ! 1547: LDSW_I	ldsw	[%r19 + 0x00cf], %r31
	.word 0xf084a1f6  ! 1548: LDUWA_I	lduwa	[%r18, + 0x01f6] %asi, %r24
T2_asi_reg_rd_74:
	mov	0x26, %r14
	.word 0xf2db84a0  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_81:
	mov	0x32, %r14
	.word 0xfef38e40  ! 1556: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_82:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 1557: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf68d4020  ! 1559: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
	.word 0xf095e0a9  ! 1565: LDUHA_I	lduha	[%r23, + 0x00a9] %asi, %r24
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 32)
	.word 0xb29dc000  ! 1567: XORcc_R	xorcc 	%r23, %r0, %r25
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf0d48020  ! 1572: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
	.word 0xf45d2162  ! 1573: LDX_I	ldx	[%r20 + 0x0162], %r26
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 7)
	.word 0xf2dce12b  ! 1575: LDXA_I	ldxa	[%r19, + 0x012b] %asi, %r25
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_119:
	setx	0x2b0010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_120:
	setx	0x280306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d8000  ! 1583: SRA_R	sra 	%r22, %r0, %r26
cpu_intr_2_121:
	setx	0x290007, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_75:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 1586: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbab4c000  ! 1588: ORNcc_R	orncc 	%r19, %r0, %r29
T2_asi_reg_rd_76:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_77:
	mov	0x35, %r14
	.word 0xf2db84a0  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf654c000  ! 1594: LDSH_R	ldsh	[%r19 + %r0], %r27
T2_asi_reg_wr_83:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 1595: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 36)
	.word 0xf84ce19c  ! 1606: LDSB_I	ldsb	[%r19 + 0x019c], %r28
	.word 0xf20cc000  ! 1607: LDUB_R	ldub	[%r19 + %r0], %r25
T2_asi_reg_wr_84:
	mov	0x20, %r14
	.word 0xf0f38e80  ! 1609: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfc550000  ! 1610: LDSH_R	ldsh	[%r20 + %r0], %r30
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 28)
	.word 0xf64dc000  ! 1615: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf4442062  ! 1616: LDSW_I	ldsw	[%r16 + 0x0062], %r26
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_2_122:
	setx	0x28002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4854020  ! 1625: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f82  ! 1626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f82, %hpstate
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 36)
	.word 0xb4048000  ! 1632: ADD_R	add 	%r18, %r0, %r26
	.word 0xf854a11f  ! 1633: LDSH_I	ldsh	[%r18 + 0x011f], %r28
	.word 0xfe4d0000  ! 1637: LDSB_R	ldsb	[%r20 + %r0], %r31
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_TO_TL1
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 31)
	.word 0xf20d2025  ! 1643: LDUB_I	ldub	[%r20 + 0x0025], %r25
	.word 0xf005214c  ! 1645: LDUW_I	lduw	[%r20 + 0x014c], %r24
	.word 0xfa55a02a  ! 1649: LDSH_I	ldsh	[%r22 + 0x002a], %r29
	.word 0xfe0c0000  ! 1650: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xbf643801  ! 1651: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_78:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfc8dc020  ! 1655: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
	.word 0xfccc8020  ! 1656: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
cpu_intr_2_123:
	setx	0x2b020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_79:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_124:
	setx	0x2a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_80:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf6840020  ! 1668: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	.word 0xf2c44020  ! 1671: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 11)
	.word 0xfa04604f  ! 1674: LDUW_I	lduw	[%r17 + 0x004f], %r29
	.word 0xb034a1c0  ! 1676: SUBC_I	orn 	%r18, 0x01c0, %r24
cpu_intr_2_125:
	setx	0x2a0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_85:
	mov	0x14, %r14
	.word 0xf6f384a0  ! 1681: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf4940020  ! 1682: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xf05da0a0  ! 1683: LDX_I	ldx	[%r22 + 0x00a0], %r24
	.word 0xf854c000  ! 1688: LDSH_R	ldsh	[%r19 + %r0], %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_86:
	mov	0x38, %r14
	.word 0xfcf38e60  ! 1695: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbab4e1e0  ! 1698: ORNcc_I	orncc 	%r19, 0x01e0, %r29
	.word 0xf8544000  ! 1700: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xfc0d2198  ! 1701: LDUB_I	ldub	[%r20 + 0x0198], %r30
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_81:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe440000  ! 1708: LDSW_R	ldsw	[%r16 + %r0], %r31
cpu_intr_2_126:
	setx	0x280324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d8000  ! 1712: XNOR_R	xnor 	%r22, %r0, %r25
T2_asi_reg_rd_82:
	mov	0x22, %r14
	.word 0xfcdb84a0  ! 1714: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf45d2049  ! 1721: LDX_I	ldx	[%r20 + 0x0049], %r26
	.word 0xb33dc000  ! 1722: SRA_R	sra 	%r23, %r0, %r25
T2_asi_reg_wr_87:
	mov	0x27, %r14
	.word 0xf4f389e0  ! 1723: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 12)
	.word 0xf65ce132  ! 1730: LDX_I	ldx	[%r19 + 0x0132], %r27
	.word 0xf8dc2009  ! 1731: LDXA_I	ldxa	[%r16, + 0x0009] %asi, %r28
	.word 0xf25d4000  ! 1735: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xfe44c000  ! 1738: LDSW_R	ldsw	[%r19 + %r0], %r31
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_127:
	setx	0x2a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_83:
	mov	0x13, %r14
	.word 0xfedb8e40  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_128:
	setx	0x280012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b58000  ! 1750: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xf4c5616c  ! 1753: LDSWA_I	ldswa	[%r21, + 0x016c] %asi, %r26
	.word 0xfc958020  ! 1756: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xb6c460c4  ! 1758: ADDCcc_I	addccc 	%r17, 0x00c4, %r27
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 24)
	.word 0xf0550000  ! 1760: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf44d61b7  ! 1761: LDSB_I	ldsb	[%r21 + 0x01b7], %r26
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_88:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 1767: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_129:
	setx	0x28003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c8020  ! 1769: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
T2_asi_reg_rd_84:
	mov	0x36, %r14
	.word 0xf6db84a0  ! 1773: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfa4c4000  ! 1774: LDSB_R	ldsb	[%r17 + %r0], %r29
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_89:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 1776: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 6)
	.word 0xbabd60e9  ! 1781: XNORcc_I	xnorcc 	%r21, 0x00e9, %r29
cpu_intr_2_130:
	setx	0x29023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa14e00e  ! 1786: LDUH_I	lduh	[%r19 + 0x000e], %r29
	.word 0xb33c8000  ! 1788: SRA_R	sra 	%r18, %r0, %r25
	.word 0xf0d5c020  ! 1789: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_90:
	mov	0x18, %r14
	.word 0xf6f384a0  ! 1790: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_85:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb6b54000  ! 1793: SUBCcc_R	orncc 	%r21, %r0, %r27
T2_asi_reg_wr_91:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 1796: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, a)
	.word 0xb69ca0c8  ! 1799: XORcc_I	xorcc 	%r18, 0x00c8, %r27
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_92:
	mov	0x30, %r14
	.word 0xfaf38e60  ! 1806: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb93d8000  ! 1807: SRA_R	sra 	%r22, %r0, %r28
	.word 0xf28c8020  ! 1808: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
	.word 0xb92d0000  ! 1809: SLL_R	sll 	%r20, %r0, %r28
T2_asi_reg_rd_86:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 1810: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_93:
	mov	0x1e, %r14
	.word 0xfcf38e80  ! 1814: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f5a  ! 1817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5a, %hpstate
	.word 0xfa944020  ! 1822: LDUHA_R	lduha	[%r17, %r0] 0x01, %r29
T2_asi_reg_wr_94:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 1825: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf00ce1e6  ! 1828: LDUB_I	ldub	[%r19 + 0x01e6], %r24
T2_asi_reg_rd_87:
	mov	0x22, %r14
	.word 0xf6db8400  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 32)
	.word 0xbe3cc000  ! 1837: XNOR_R	xnor 	%r19, %r0, %r31
T2_asi_reg_rd_88:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_89:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 1847: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_131:
	setx	0x2d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd50020  ! 1857: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_90:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 1861: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_132:
	setx	0x2f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5e0e4  ! 1865: LDSHA_I	ldsha	[%r23, + 0x00e4] %asi, %r24
	.word 0xfe146186  ! 1866: LDUH_I	lduh	[%r17 + 0x0186], %r31
	ta	T_CHANGE_NONHPRIV
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf2cd2005  ! 1873: LDSBA_I	ldsba	[%r20, + 0x0005] %asi, %r25
	.word 0xf2554000  ! 1875: LDSH_R	ldsh	[%r21 + %r0], %r25
T2_asi_reg_wr_95:
	mov	0x20, %r14
	.word 0xf2f38e60  ! 1878: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819828ca  ! 1879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
cpu_intr_2_133:
	setx	0x2d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 12)
	.word 0xf8cd20b0  ! 1896: LDSBA_I	ldsba	[%r20, + 0x00b0] %asi, %r28
	.word 0xf0950020  ! 1897: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	.word 0xf2dc614e  ! 1898: LDXA_I	ldxa	[%r17, + 0x014e] %asi, %r25
	.word 0xfc85a0a7  ! 1901: LDUWA_I	lduwa	[%r22, + 0x00a7] %asi, %r30
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982902  ! 1902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0902, %hpstate
cpu_intr_2_134:
	setx	0x2f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf885216e  ! 1907: LDUWA_I	lduwa	[%r20, + 0x016e] %asi, %r28
cpu_intr_2_135:
	setx	0x2e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa154000  ! 1909: LDUH_R	lduh	[%r21 + %r0], %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf8cdc020  ! 1913: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
cpu_intr_2_136:
	setx	0x2d010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe140000  ! 1917: LDUH_R	lduh	[%r16 + %r0], %r31
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
	.word 0xfcc5a17e  ! 1922: LDSWA_I	ldswa	[%r22, + 0x017e] %asi, %r30
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 33)
	.word 0xf895e139  ! 1928: LDUHA_I	lduha	[%r23, + 0x0139] %asi, %r28
	.word 0xbd3db001  ! 1934: SRAX_I	srax	%r22, 0x0001, %r30
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_137:
	setx	0x2e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334d000  ! 1939: SRLX_R	srlx	%r19, %r0, %r25
cpu_intr_2_138:
	setx	0x2f0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_96:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 1951: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfc040000  ! 1952: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xfe5d4000  ! 1953: LDX_R	ldx	[%r21 + %r0], %r31
	ta	T_CHANGE_TO_TL1
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 13)
	.word 0xf6558000  ! 1965: LDSH_R	ldsh	[%r22 + %r0], %r27
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 0)
	.word 0xf8c56019  ! 1968: LDSWA_I	ldswa	[%r21, + 0x0019] %asi, %r28
T2_asi_reg_rd_91:
	mov	0xa, %r14
	.word 0xfadb89e0  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_97:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 1972: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9520000  ! 1974: RDPR_PIL	<illegal instruction>
	.word 0xf4154000  ! 1975: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xb7643801  ! 1976: MOVcc_I	<illegal instruction>
	.word 0xf28d6119  ! 1979: LDUBA_I	lduba	[%r21, + 0x0119] %asi, %r25
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa8c610a  ! 1983: LDUBA_I	lduba	[%r17, + 0x010a] %asi, %r29
T2_asi_reg_wr_98:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 1985: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfecca02e  ! 1987: LDSBA_I	ldsba	[%r18, + 0x002e] %asi, %r31
	.word 0xfe0dc000  ! 1988: LDUB_R	ldub	[%r23 + %r0], %r31
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e8a  ! 1989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 8)
	.word 0xf2952191  ! 1992: LDUHA_I	lduha	[%r20, + 0x0191] %asi, %r25
T2_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 1993: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_92:
	mov	0xb, %r14
	.word 0xf6db8e40  ! 1997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_100:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 1998: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa5d6025  ! 2005: LDX_I	ldx	[%r21 + 0x0025], %r29
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 31)
	.word 0xf0cd0020  ! 2008: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 1)
	.word 0xf48c8020  ! 2011: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
	.word 0xf415e19b  ! 2013: LDUH_I	lduh	[%r23 + 0x019b], %r26
	.word 0xf6854020  ! 2014: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
cpu_intr_2_139:
	setx	0x2e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe84a1fe  ! 2020: LDUWA_I	lduwa	[%r18, + 0x01fe] %asi, %r31
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 13)
	.word 0xf28cc020  ! 2025: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
cpu_intr_2_140:
	setx	0x2f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198394a  ! 2032: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
T2_asi_reg_rd_93:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf24d6075  ! 2035: LDSB_I	ldsb	[%r21 + 0x0075], %r25
	.word 0xb4c4a116  ! 2038: ADDCcc_I	addccc 	%r18, 0x0116, %r26
T2_asi_reg_wr_101:
	mov	0x22, %r14
	.word 0xfaf389e0  ! 2040: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf0dd61d2  ! 2042: LDXA_I	ldxa	[%r21, + 0x01d2] %asi, %r24
	.word 0xb61c60f9  ! 2044: XOR_I	xor 	%r17, 0x00f9, %r27
	.word 0xf6c50020  ! 2046: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
	.word 0xfc858020  ! 2049: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
cpu_intr_2_141:
	setx	0x2d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d52120  ! 2053: LDSHA_I	ldsha	[%r20, + 0x0120] %asi, %r26
	.word 0xb72c7001  ! 2054: SLLX_I	sllx	%r17, 0x0001, %r27
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_142:
	setx	0x2e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbf7c6401  ! 2061: MOVR_I	movre	%r17, 0x1, %r31
T2_asi_reg_wr_102:
	mov	0xc, %r14
	.word 0xf6f38e80  ! 2062: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb12d2001  ! 2063: SLL_I	sll 	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_143:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_94:
	mov	0x33, %r14
	.word 0xf8db89e0  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_95:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf885617f  ! 2079: LDUWA_I	lduwa	[%r21, + 0x017f] %asi, %r28
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982fd8  ! 2080: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
	.word 0xb81d4000  ! 2081: XOR_R	xor 	%r21, %r0, %r28
	.word 0xb0352154  ! 2084: SUBC_I	orn 	%r20, 0x0154, %r24
cpu_intr_2_144:
	setx	0x2f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe15a0fe  ! 2087: OR_I	or 	%r22, 0x00fe, %r31
	.word 0xbeb52143  ! 2089: ORNcc_I	orncc 	%r20, 0x0143, %r31
	.word 0xf4544000  ! 2093: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xfe04a179  ! 2094: LDUW_I	lduw	[%r18 + 0x0179], %r31
T2_asi_reg_wr_103:
	mov	0x4, %r14
	.word 0xf6f38e80  ! 2096: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2442054  ! 2099: LDSW_I	ldsw	[%r16 + 0x0054], %r25
cpu_intr_2_145:
	setx	0x2e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_96:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_104:
	mov	0x9, %r14
	.word 0xf2f384a0  ! 2104: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc94c020  ! 2105: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
T2_asi_reg_rd_97:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6c58020  ! 2107: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
cpu_intr_2_146:
	setx	0x2d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 4)
	.word 0xfe8d21b2  ! 2113: LDUBA_I	lduba	[%r20, + 0x01b2] %asi, %r31
	.word 0xbe250000  ! 2114: SUB_R	sub 	%r20, %r0, %r31
cpu_intr_2_147:
	setx	0x2c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604e014  ! 2118: LDUW_I	lduw	[%r19 + 0x0014], %r27
cpu_intr_2_148:
	setx	0x2d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4556138  ! 2120: LDSH_I	ldsh	[%r21 + 0x0138], %r26
	.word 0xf6d4209d  ! 2122: LDSHA_I	ldsha	[%r16, + 0x009d] %asi, %r27
	.word 0xf2cdc020  ! 2123: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_98:
	mov	0x34, %r14
	.word 0xfcdb8e80  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfe5c4000  ! 2130: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xf64c0000  ! 2135: LDSB_R	ldsb	[%r16 + %r0], %r27
T2_asi_reg_rd_99:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 2137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_100:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_149:
	setx	0x2d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d61e1  ! 2144: LDX_I	ldx	[%r21 + 0x01e1], %r30
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbf2d0000  ! 2147: SLL_R	sll 	%r20, %r0, %r31
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_150:
	setx	0x2c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_151:
	setx	0x2d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dde157  ! 2153: LDXA_I	ldxa	[%r23, + 0x0157] %asi, %r27
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 30)
	.word 0xbf35a001  ! 2160: SRL_I	srl 	%r22, 0x0001, %r31
	.word 0xf8cdc020  ! 2162: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
T2_asi_reg_rd_101:
	mov	0x2f, %r14
	.word 0xf8db8e40  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ed2  ! 2170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
cpu_intr_2_152:
	setx	0x2f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_153:
	setx	0x2e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_154:
	setx	0x2e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5ce086  ! 2180: LDX_I	ldx	[%r19 + 0x0086], %r30
	.word 0xf6540000  ! 2184: LDSH_R	ldsh	[%r16 + %r0], %r27
cpu_intr_2_155:
	setx	0x2c0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_105:
	mov	0x1c, %r14
	.word 0xfef38400  ! 2189: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
cpu_intr_2_156:
	setx	0x2e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8ce09b  ! 2204: LDUBA_I	lduba	[%r19, + 0x009b] %asi, %r29
	.word 0xf004e16d  ! 2206: LDUW_I	lduw	[%r19 + 0x016d], %r24
	.word 0xf28461b5  ! 2209: LDUWA_I	lduwa	[%r17, + 0x01b5] %asi, %r25
cpu_intr_2_157:
	setx	0x2c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cca197  ! 2215: LDSBA_I	ldsba	[%r18, + 0x0197] %asi, %r26
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b08  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b08, %hpstate
	.word 0xf8dd21af  ! 2218: LDXA_I	ldxa	[%r20, + 0x01af] %asi, %r28
	.word 0xfe84a095  ! 2228: LDUWA_I	lduwa	[%r18, + 0x0095] %asi, %r31
T2_asi_reg_rd_103:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf845e176  ! 2233: LDSW_I	ldsw	[%r23 + 0x0176], %r28
	.word 0xf0cc8020  ! 2234: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
	.word 0xf6054000  ! 2236: LDUW_R	lduw	[%r21 + %r0], %r27
cpu_intr_2_158:
	setx	0x2e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad54020  ! 2239: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
	.word 0xbd500000  ! 2241: RDPR_TPC	<illegal instruction>
	.word 0xfccda03e  ! 2242: LDSBA_I	ldsba	[%r22, + 0x003e] %asi, %r30
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf0cc61ca  ! 2245: LDSBA_I	ldsba	[%r17, + 0x01ca] %asi, %r24
cpu_intr_2_159:
	setx	0x2c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b52152  ! 2248: ORNcc_I	orncc 	%r20, 0x0152, %r28
T2_asi_reg_wr_106:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 2249: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_wr_107:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 2255: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 1)
	.word 0xf4854020  ! 2262: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 9)
	.word 0xfc450000  ! 2264: LDSW_R	ldsw	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0xf2cd20a9  ! 2272: LDSBA_I	ldsba	[%r20, + 0x00a9] %asi, %r25
	.word 0xb20d21d1  ! 2275: AND_I	and 	%r20, 0x01d1, %r25
	.word 0xf485a01d  ! 2278: LDUWA_I	lduwa	[%r22, + 0x001d] %asi, %r26
	.word 0xfe95c020  ! 2279: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_104:
	mov	0x33, %r14
	.word 0xfcdb8400  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf80d0000  ! 2298: LDUB_R	ldub	[%r20 + %r0], %r28
T2_asi_reg_wr_108:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 2300: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb8b48000  ! 2302: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xf0d48020  ! 2305: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf04d0000  ! 2307: LDSB_R	ldsb	[%r20 + %r0], %r24
T2_asi_reg_wr_109:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 2309: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4c48020  ! 2311: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
cpu_intr_2_160:
	setx	0x300105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dda028  ! 2314: LDXA_I	ldxa	[%r22, + 0x0028] %asi, %r28
	.word 0xbab58000  ! 2315: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xf25c2010  ! 2316: LDX_I	ldx	[%r16 + 0x0010], %r25
T2_asi_reg_wr_110:
	mov	0xb, %r14
	.word 0xfcf38e60  ! 2320: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf25cc000  ! 2324: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf2c48020  ! 2329: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 11)
	.word 0xf0548000  ! 2332: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf485c020  ! 2333: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 22)
	.word 0xfa4ce166  ! 2338: LDSB_I	ldsb	[%r19 + 0x0166], %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_111:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 2343: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe0c0000  ! 2345: LDUB_R	ldub	[%r16 + %r0], %r31
cpu_intr_2_161:
	setx	0x310109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd2168  ! 2348: LDSBA_I	ldsba	[%r20, + 0x0168] %asi, %r28
	.word 0xf4148000  ! 2351: LDUH_R	lduh	[%r18 + %r0], %r26
T2_asi_reg_rd_105:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf6dc61e4  ! 2355: LDXA_I	ldxa	[%r17, + 0x01e4] %asi, %r27
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a02  ! 2357: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a02, %hpstate
	.word 0xbcb54000  ! 2363: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xf2148000  ! 2367: LDUH_R	lduh	[%r18 + %r0], %r25
cpu_intr_2_162:
	setx	0x330311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084c020  ! 2370: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xbeb5212a  ! 2371: SUBCcc_I	orncc 	%r20, 0x012a, %r31
	.word 0xfc950020  ! 2372: LDUHA_R	lduha	[%r20, %r0] 0x01, %r30
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 3)
	.word 0xf28c0020  ! 2374: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
	.word 0xf40d61f5  ! 2375: LDUB_I	ldub	[%r21 + 0x01f5], %r26
	.word 0xf8c58020  ! 2380: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_106:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 2383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe458000  ! 2386: LDSW_R	ldsw	[%r22 + %r0], %r31
T2_asi_reg_wr_112:
	mov	0x25, %r14
	.word 0xfaf38e80  ! 2388: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_163:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb93dd000  ! 2396: SRAX_R	srax	%r23, %r0, %r28
	.word 0xf015a103  ! 2397: LDUH_I	lduh	[%r22 + 0x0103], %r24
T2_asi_reg_wr_113:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 2399: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d4a  ! 2400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4a, %hpstate
	.word 0xf0ccc020  ! 2401: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_114:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 2406: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_164:
	setx	0x310305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_165:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5cc000  ! 2415: LDX_R	ldx	[%r19 + %r0], %r31
	.word 0xf685e0b3  ! 2416: LDUWA_I	lduwa	[%r23, + 0x00b3] %asi, %r27
T2_asi_reg_wr_115:
	mov	0x1d, %r14
	.word 0xf2f384a0  ! 2417: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf4cc2193  ! 2422: LDSBA_I	ldsba	[%r16, + 0x0193] %asi, %r26
T2_asi_reg_wr_116:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 2426: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2450000  ! 2436: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xfc554000  ! 2440: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf014c000  ! 2442: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xfc4d8000  ! 2443: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xfe45c000  ! 2444: LDSW_R	ldsw	[%r23 + %r0], %r31
T2_asi_reg_wr_117:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 2445: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_118:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 2449: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfedca069  ! 2451: LDXA_I	ldxa	[%r18, + 0x0069] %asi, %r31
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 12)
	.word 0x9195a0ff  ! 2458: WRPR_PIL_I	wrpr	%r22, 0x00ff, %pil
	ta	T_CHANGE_NONHPRIV
	.word 0xf44de01d  ! 2460: LDSB_I	ldsb	[%r23 + 0x001d], %r26
	.word 0xf68ca11c  ! 2462: LDUBA_I	lduba	[%r18, + 0x011c] %asi, %r27
T2_asi_reg_rd_107:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 2463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa852061  ! 2466: LDUWA_I	lduwa	[%r20, + 0x0061] %asi, %r29
	.word 0xfc154000  ! 2472: LDUH_R	lduh	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
cpu_intr_2_166:
	setx	0x330118, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a58  ! 2480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a58, %hpstate
	.word 0xf4d50020  ! 2482: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, b)
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 12)
	.word 0xf6c54020  ! 2486: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r27
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf48d21ef  ! 2489: LDUBA_I	lduba	[%r20, + 0x01ef] %asi, %r26
cpu_intr_2_167:
	setx	0x330036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d2040  ! 2496: LDUB_I	ldub	[%r20 + 0x0040], %r24
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_119:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 2501: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_168:
	setx	0x33011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3da001  ! 2506: SRA_I	sra 	%r22, 0x0001, %r31
cpu_intr_2_169:
	setx	0x310114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd0020  ! 2511: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa8c4020  ! 2515: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 13)
	.word 0xfa15c000  ! 2519: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xf28cc020  ! 2520: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
cpu_intr_2_170:
	setx	0x31030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_120:
	mov	0x17, %r14
	.word 0xf6f38400  ! 2523: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_121:
	mov	0x2, %r14
	.word 0xfaf38e80  ! 2524: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_171:
	setx	0x30011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_122:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 2526: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 31)
	.word 0xfa9521e6  ! 2531: LDUHA_I	lduha	[%r20, + 0x01e6] %asi, %r29
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_123:
	mov	0x16, %r14
	.word 0xfcf384a0  ! 2536: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfa544000  ! 2537: LDSH_R	ldsh	[%r17 + %r0], %r29
cpu_intr_2_172:
	setx	0x31003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63521d2  ! 2543: SUBC_I	orn 	%r20, 0x01d2, %r27
cpu_intr_2_173:
	setx	0x300013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf055a0c4  ! 2548: LDSH_I	ldsh	[%r22 + 0x00c4], %r24
	.word 0xfa948020  ! 2552: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
cpu_intr_2_174:
	setx	0x3021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe846144  ! 2556: LDUWA_I	lduwa	[%r17, + 0x0144] %asi, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf64c4000  ! 2558: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xf49561d1  ! 2560: LDUHA_I	lduha	[%r21, + 0x01d1] %asi, %r26
	.word 0xfc858020  ! 2562: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	.word 0xfe54c000  ! 2563: LDSH_R	ldsh	[%r19 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, e)
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_175:
	setx	0x330235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_124:
	mov	0x13, %r14
	.word 0xfaf389e0  ! 2583: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf8858020  ! 2586: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
cpu_intr_2_176:
	setx	0x320101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_177:
	setx	0x320331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4e0ae  ! 2597: SUBCcc_I	orncc 	%r19, 0x00ae, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_125:
	mov	0x34, %r14
	.word 0xf8f38400  ! 2604: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_178:
	setx	0x310125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_108:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 35)
	.word 0xb6c5e109  ! 2615: ADDCcc_I	addccc 	%r23, 0x0109, %r27
	.word 0xfacda026  ! 2616: LDSBA_I	ldsba	[%r22, + 0x0026] %asi, %r29
cpu_intr_2_179:
	setx	0x310221, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_109:
	mov	0x1, %r14
	.word 0xf0db8e40  ! 2619: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_180:
	setx	0x320116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc4020  ! 2626: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_2_181:
	setx	0x330238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_110:
	mov	0x14, %r14
	.word 0xfedb8e60  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_182:
	setx	0x232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2d0000  ! 2633: ANDN_R	andn 	%r20, %r0, %r31
T2_asi_reg_wr_126:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 2634: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf444e1da  ! 2641: LDSW_I	ldsw	[%r19 + 0x01da], %r26
	.word 0xf494e192  ! 2646: LDUHA_I	lduha	[%r19, + 0x0192] %asi, %r26
T2_asi_reg_rd_111:
	mov	0x24, %r14
	.word 0xfcdb8e80  ! 2647: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfe8ca032  ! 2651: LDUBA_I	lduba	[%r18, + 0x0032] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_183:
	setx	0x300038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_184:
	setx	0x300104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d48020  ! 2660: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xfed54020  ! 2661: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
cpu_intr_2_185:
	setx	0x310321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d8000  ! 2665: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf8cdc020  ! 2667: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
cpu_intr_2_186:
	setx	0x320236, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_127:
	mov	0x1d, %r14
	.word 0xfcf38e60  ! 2672: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb53c8000  ! 2679: SRA_R	sra 	%r18, %r0, %r26
	.word 0xf88ce1c4  ! 2680: LDUBA_I	lduba	[%r19, + 0x01c4] %asi, %r28
	.word 0xf6c5a157  ! 2683: LDSWA_I	ldswa	[%r22, + 0x0157] %asi, %r27
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982ac8  ! 2685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac8, %hpstate
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_128:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 2688: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb40cc000  ! 2690: AND_R	and 	%r19, %r0, %r26
	.word 0xf0554000  ! 2693: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xb685a1ab  ! 2695: ADDcc_I	addcc 	%r22, 0x01ab, %r27
	.word 0xfe848020  ! 2697: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 2698: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb20ca0ca  ! 2700: AND_I	and 	%r18, 0x00ca, %r25
T2_asi_reg_wr_130:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 2701: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_rd_112:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_131:
	mov	0xd, %r14
	.word 0xf6f38e80  ! 2706: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_wr_132:
	mov	0x1a, %r14
	.word 0xf0f389e0  ! 2707: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9480000  ! 2708: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T2_asi_reg_rd_113:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_114:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 2710: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_115:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_187:
	setx	0x32010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4e0f2  ! 2720: LDSHA_I	ldsha	[%r19, + 0x00f2] %asi, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 37)
	.word 0xbc244000  ! 2726: SUB_R	sub 	%r17, %r0, %r30
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_133:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 2728: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc9460bf  ! 2729: LDUHA_I	lduha	[%r17, + 0x00bf] %asi, %r30
T2_asi_reg_wr_134:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 2731: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_188:
	setx	0x34022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48de1f5  ! 2734: LDUBA_I	lduba	[%r23, + 0x01f5] %asi, %r26
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_135:
	mov	0x34, %r14
	.word 0xf6f384a0  ! 2736: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xba852007  ! 2737: ADDcc_I	addcc 	%r20, 0x0007, %r29
	.word 0xb82da00e  ! 2738: ANDN_I	andn 	%r22, 0x000e, %r28
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_189:
	setx	0x360029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_190:
	setx	0x360006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe948020  ! 2745: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	.word 0xf8c4a17e  ! 2746: LDSWA_I	ldswa	[%r18, + 0x017e] %asi, %r28
	.word 0xbc8d6198  ! 2747: ANDcc_I	andcc 	%r21, 0x0198, %r30
cpu_intr_2_191:
	setx	0x36010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_136:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2753: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb494a002  ! 2756: ORcc_I	orcc 	%r18, 0x0002, %r26
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 17)
	.word 0xbc44618d  ! 2763: ADDC_I	addc 	%r17, 0x018d, %r30
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_192:
	setx	0x34021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c2147  ! 2767: LDUBA_I	lduba	[%r16, + 0x0147] %asi, %r25
	.word 0xb735f001  ! 2768: SRLX_I	srlx	%r23, 0x0001, %r27
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba1dc000  ! 2771: XOR_R	xor 	%r23, %r0, %r29
cpu_intr_2_193:
	setx	0x360311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac58020  ! 2773: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xf085e0f0  ! 2778: LDUWA_I	lduwa	[%r23, + 0x00f0] %asi, %r24
	.word 0xb82cc000  ! 2779: ANDN_R	andn 	%r19, %r0, %r28
cpu_intr_2_194:
	setx	0x370030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_195:
	setx	0x340319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414a0f7  ! 2788: LDUH_I	lduh	[%r18 + 0x00f7], %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf04da0d8  ! 2794: LDSB_I	ldsb	[%r22 + 0x00d8], %r24
	.word 0xf8c4e141  ! 2795: LDSWA_I	ldswa	[%r19, + 0x0141] %asi, %r28
	.word 0xbf2d7001  ! 2797: SLLX_I	sllx	%r21, 0x0001, %r31
	.word 0xf8d4a18f  ! 2801: LDSHA_I	ldsha	[%r18, + 0x018f] %asi, %r28
	.word 0xf0cd0020  ! 2804: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
	.word 0xb61520f9  ! 2805: OR_I	or 	%r20, 0x00f9, %r27
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_137:
	mov	0x2c, %r14
	.word 0xf2f384a0  ! 2809: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_138:
	mov	0x27, %r14
	.word 0xf2f38e80  ! 2813: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb8c4c000  ! 2814: ADDCcc_R	addccc 	%r19, %r0, %r28
	.word 0xbc0d60e8  ! 2815: AND_I	and 	%r21, 0x00e8, %r30
	.word 0xf204c000  ! 2817: LDUW_R	lduw	[%r19 + %r0], %r25
cpu_intr_2_196:
	setx	0x360301, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf08d0020  ! 2829: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
cpu_intr_2_197:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb685e142  ! 2834: ADDcc_I	addcc 	%r23, 0x0142, %r27
cpu_intr_2_198:
	setx	0x340124, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_116:
	mov	0x2e, %r14
	.word 0xf6db8e40  ! 2842: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_199:
	setx	0x36012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 23)
	.word 0xbeb5c000  ! 2851: SUBCcc_R	orncc 	%r23, %r0, %r31
	.word 0xfc144000  ! 2852: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xfa54202a  ! 2854: LDSH_I	ldsh	[%r16 + 0x002a], %r29
cpu_intr_2_200:
	setx	0x34033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc854020  ! 2858: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
T2_asi_reg_rd_117:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 2859: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2861: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc4de05c  ! 2867: LDSB_I	ldsb	[%r23 + 0x005c], %r30
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_201:
	setx	0x36021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_118:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe4da176  ! 2886: LDSB_I	ldsb	[%r22 + 0x0176], %r31
cpu_intr_2_202:
	setx	0x36010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 14)
	ta	T_CHANGE_HPRIV
	.word 0xfc148000  ! 2900: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xb77d8400  ! 2901: MOVR_R	movre	%r22, %r0, %r27
	.word 0xb03dc000  ! 2902: XNOR_R	xnor 	%r23, %r0, %r24
T2_asi_reg_rd_119:
	mov	0x18, %r14
	.word 0xf8db8e60  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_wr_140:
	mov	0x26, %r14
	.word 0xf8f389e0  ! 2907: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf08de183  ! 2910: LDUBA_I	lduba	[%r23, + 0x0183] %asi, %r24
T2_asi_reg_rd_120:
	mov	0x1e, %r14
	.word 0xfcdb8e40  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe04c000  ! 2913: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xf8cda078  ! 2914: LDSBA_I	ldsba	[%r22, + 0x0078] %asi, %r28
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 29)
	.word 0xf684c020  ! 2919: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
	.word 0xf0448000  ! 2922: LDSW_R	ldsw	[%r18 + %r0], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf454c000  ! 2925: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xf2854020  ! 2926: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 19)
	.word 0xfa4d8000  ! 2931: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf00d4000  ! 2932: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xbe45c000  ! 2935: ADDC_R	addc 	%r23, %r0, %r31
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 12)
	.word 0xf6940020  ! 2940: LDUHA_R	lduha	[%r16, %r0] 0x01, %r27
	.word 0xf445c000  ! 2941: LDSW_R	ldsw	[%r23 + %r0], %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf4dca129  ! 2943: LDXA_I	ldxa	[%r18, + 0x0129] %asi, %r26
cpu_intr_2_203:
	setx	0x350217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_204:
	setx	0x37022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, b)
	.word 0xfe15c000  ! 2952: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xf2d54020  ! 2955: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
T2_asi_reg_wr_141:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 2956: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf6cdc020  ! 2958: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xb53dc000  ! 2959: SRA_R	sra 	%r23, %r0, %r26
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 7)
	.word 0xfc0c0000  ! 2964: LDUB_R	ldub	[%r16 + %r0], %r30
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf6c48020  ! 2970: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
	.word 0xf415e1ee  ! 2971: LDUH_I	lduh	[%r23 + 0x01ee], %r26
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfe0ce1e0  ! 2973: LDUB_I	ldub	[%r19 + 0x01e0], %r31
	.word 0xb8a58000  ! 2977: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0xfc4de014  ! 2979: LDSB_I	ldsb	[%r23 + 0x0014], %r30
	.word 0xb53dc000  ! 2980: SRA_R	sra 	%r23, %r0, %r26
	.word 0xfc5c0000  ! 2982: LDX_R	ldx	[%r16 + %r0], %r30
cpu_intr_2_205:
	setx	0x34023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc054000  ! 2985: ADD_R	add 	%r21, %r0, %r30
	.word 0xf45d210f  ! 2989: LDX_I	ldx	[%r20 + 0x010f], %r26
	.word 0xf2cd8020  ! 2990: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_206:
	setx	0x36001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_207:
	setx	0x360308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe95e02a  ! 2999: LDUHA_I	lduha	[%r23, + 0x002a] %asi, %r31
	.word 0xb63561c1  ! 3000: ORN_I	orn 	%r21, 0x01c1, %r27
cpu_intr_2_208:
	setx	0x34023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_209:
	setx	0x370135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285e1fc  ! 3006: LDUWA_I	lduwa	[%r23, + 0x01fc] %asi, %r25
T2_asi_reg_rd_121:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 3010: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 36)
	.word 0xf204a111  ! 3016: LDUW_I	lduw	[%r18 + 0x0111], %r25
cpu_intr_2_210:
	setx	0x360234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dd601f  ! 3020: LDXA_I	ldxa	[%r21, + 0x001f] %asi, %r24
	.word 0xfa05212a  ! 3022: LDUW_I	lduw	[%r20 + 0x012a], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_122:
	mov	0x28, %r14
	.word 0xf0db8e60  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbea4a03e  ! 3027: SUBcc_I	subcc 	%r18, 0x003e, %r31
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a92  ! 3031: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 33)
	.word 0xfc8c0020  ! 3034: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	.word 0xf885e1b8  ! 3036: LDUWA_I	lduwa	[%r23, + 0x01b8] %asi, %r28
cpu_intr_2_211:
	setx	0x35011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d54020  ! 3039: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
cpu_intr_2_212:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_213:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_142:
	mov	0x35, %r14
	.word 0xf8f38e80  ! 3048: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb72d5000  ! 3049: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xf05d8000  ! 3050: LDX_R	ldx	[%r22 + %r0], %r24
T2_asi_reg_rd_123:
	mov	0x1f, %r14
	.word 0xf6db8400  ! 3053: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb284c000  ! 3055: ADDcc_R	addcc 	%r19, %r0, %r25
cpu_intr_2_214:
	setx	0x340333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dda118  ! 3058: LDXA_I	ldxa	[%r22, + 0x0118] %asi, %r27
cpu_intr_2_215:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795207c  ! 3064: WRPR_TT_I	wrpr	%r20, 0x007c, %tt
	.word 0xfe858020  ! 3066: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
	.word 0xf6dca0dc  ! 3068: LDXA_I	ldxa	[%r18, + 0x00dc] %asi, %r27
T2_asi_reg_rd_124:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbca5e022  ! 3073: SUBcc_I	subcc 	%r23, 0x0022, %r30
	.word 0xf8c5c020  ! 3075: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
cpu_intr_2_216:
	setx	0x34012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa144000  ! 3079: LDUH_R	lduh	[%r17 + %r0], %r29
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 1e)
	.word 0xba0c610c  ! 3083: AND_I	and 	%r17, 0x010c, %r29
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_217:
	setx	0x350219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_143:
	mov	0x2b, %r14
	.word 0xf6f38400  ! 3087: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_144:
	mov	0x10, %r14
	.word 0xfcf38e80  ! 3089: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfe9421e8  ! 3090: LDUHA_I	lduha	[%r16, + 0x01e8] %asi, %r31
cpu_intr_2_218:
	setx	0x370212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_219:
	setx	0x36023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d0000  ! 3093: LDSB_R	ldsb	[%r20 + %r0], %r29
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_220:
	setx	0x35012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8940020  ! 3096: LDUHA_R	lduha	[%r16, %r0] 0x01, %r28
	.word 0xf615a184  ! 3097: LDUH_I	lduh	[%r22 + 0x0184], %r27
T2_asi_reg_wr_145:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 3099: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfacc0020  ! 3100: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
cpu_intr_2_221:
	setx	0x370323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8554000  ! 3104: LDSH_R	ldsh	[%r21 + %r0], %r28
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_125:
	mov	0x1c, %r14
	.word 0xfcdb84a0  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf2c50020  ! 3111: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
cpu_intr_2_222:
	setx	0x360327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c8000  ! 3114: LDUB_R	ldub	[%r18 + %r0], %r29
cpu_intr_2_223:
	setx	0x35023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_224:
	setx	0x37013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645c000  ! 3119: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xb41d0000  ! 3120: XOR_R	xor 	%r20, %r0, %r26
	.word 0xf0040000  ! 3121: LDUW_R	lduw	[%r16 + %r0], %r24
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 1b)
	.word 0xba1c0000  ! 3124: XOR_R	xor 	%r16, %r0, %r29
	.word 0xfc5de0fb  ! 3126: LDX_I	ldx	[%r23 + 0x00fb], %r30
	.word 0xf894c020  ! 3127: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	.word 0xf68dc020  ! 3129: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_126:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 3132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb0bd0000  ! 3133: XNORcc_R	xnorcc 	%r20, %r0, %r24
cpu_intr_2_225:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335f001  ! 3142: SRLX_I	srlx	%r23, 0x0001, %r25
T2_asi_reg_wr_146:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 3144: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_226:
	setx	0x350336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294603f  ! 3149: LDUHA_I	lduha	[%r17, + 0x003f] %asi, %r25
T2_asi_reg_wr_147:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 3150: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfed40020  ! 3157: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
	.word 0xf24d0000  ! 3163: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xb42d21a1  ! 3164: ANDN_I	andn 	%r20, 0x01a1, %r26
T2_asi_reg_rd_127:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 3167: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf805e1f6  ! 3172: LDUW_I	lduw	[%r23 + 0x01f6], %r28
	.word 0xf0d4e05e  ! 3173: LDSHA_I	ldsha	[%r19, + 0x005e] %asi, %r24
cpu_intr_2_227:
	setx	0x370209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4948000  ! 3177: ORcc_R	orcc 	%r18, %r0, %r26
	.word 0xf64dc000  ! 3185: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xfec5a0fd  ! 3186: LDSWA_I	ldswa	[%r22, + 0x00fd] %asi, %r31
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d00  ! 3187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
T2_asi_reg_rd_128:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf65c8000  ! 3189: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xf2158000  ! 3190: LDUH_R	lduh	[%r22 + %r0], %r25
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf045e0f7  ! 3200: LDSW_I	ldsw	[%r23 + 0x00f7], %r24
T2_asi_reg_wr_148:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 3201: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_228:
	setx	0x3a0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 31)
	.word 0xf6140000  ! 3205: LDUH_R	lduh	[%r16 + %r0], %r27
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c98  ! 3206: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c98, %hpstate
cpu_intr_2_229:
	setx	0x3a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_230:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_231:
	setx	0x38001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2940000  ! 3216: ORcc_R	orcc 	%r16, %r0, %r25
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_232:
	setx	0x3b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa44c000  ! 3225: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xb934e001  ! 3228: SRL_I	srl 	%r19, 0x0001, %r28
	.word 0xfa5d0000  ! 3232: LDX_R	ldx	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfec54020  ! 3235: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
	.word 0xf8c4c020  ! 3240: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, b)
	.word 0xf845e195  ! 3242: LDSW_I	ldsw	[%r23 + 0x0195], %r28
	.word 0xf20d4000  ! 3243: LDUB_R	ldub	[%r21 + %r0], %r25
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_233:
	setx	0x3a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_234:
	setx	0x390118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_130:
	mov	0x7, %r14
	.word 0xf6db8e40  ! 3253: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_131:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf20c8000  ! 3256: LDUB_R	ldub	[%r18 + %r0], %r25
cpu_intr_2_235:
	setx	0x3b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_149:
	mov	0xa, %r14
	.word 0xf4f384a0  ! 3262: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_132:
	mov	0x4, %r14
	.word 0xf2db8400  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf60dc000  ! 3269: LDUB_R	ldub	[%r23 + %r0], %r27
cpu_intr_2_236:
	setx	0x3a0200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf84d6165  ! 3274: LDSB_I	ldsb	[%r21 + 0x0165], %r28
T2_asi_reg_wr_150:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3277: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_133:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_134:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_151:
	mov	0x1a, %r14
	.word 0xf0f384a0  ! 3284: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfc444000  ! 3285: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xba2c2024  ! 3287: ANDN_I	andn 	%r16, 0x0024, %r29
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e80  ! 3288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
	.word 0xfc04e135  ! 3289: LDUW_I	lduw	[%r19 + 0x0135], %r30
	.word 0xf4454000  ! 3290: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf68ca076  ! 3291: LDUBA_I	lduba	[%r18, + 0x0076] %asi, %r27
	.word 0xf8cce157  ! 3292: LDSBA_I	ldsba	[%r19, + 0x0157] %asi, %r28
cpu_intr_2_237:
	setx	0x38031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf684a11f  ! 3297: LDUWA_I	lduwa	[%r18, + 0x011f] %asi, %r27
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf44460f0  ! 3299: LDSW_I	ldsw	[%r17 + 0x00f0], %r26
cpu_intr_2_238:
	setx	0x390311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_135:
	mov	0x1e, %r14
	.word 0xf2db8400  ! 3308: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_239:
	setx	0x390322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf04460b8  ! 3313: LDSW_I	ldsw	[%r17 + 0x00b8], %r24
	.word 0xf8952091  ! 3314: LDUHA_I	lduha	[%r20, + 0x0091] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_240:
	setx	0x3a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_241:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf6d40020  ! 3320: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 3)
	.word 0xb205a103  ! 3323: ADD_I	add 	%r22, 0x0103, %r25
	.word 0xf4cca0b3  ! 3325: LDSBA_I	ldsba	[%r18, + 0x00b3] %asi, %r26
	.word 0xf08c0020  ! 3326: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_242:
	setx	0x39012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_243:
	setx	0x390313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0848020  ! 3334: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e98  ! 3335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
	.word 0xf28da096  ! 3339: LDUBA_I	lduba	[%r22, + 0x0096] %asi, %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_152:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 3344: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbea4e18e  ! 3345: SUBcc_I	subcc 	%r19, 0x018e, %r31
	.word 0xfc4cc000  ! 3348: LDSB_R	ldsb	[%r19 + %r0], %r30
	ta	T_CHANGE_TO_TL1
	.word 0xfa8c60b6  ! 3352: LDUBA_I	lduba	[%r17, + 0x00b6] %asi, %r29
	.word 0xf0c50020  ! 3353: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_136:
	mov	0x2, %r14
	.word 0xf6db84a0  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_wr_153:
	mov	0x24, %r14
	.word 0xf8f38400  ! 3357: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfed44020  ! 3360: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
	.word 0xf8d54020  ! 3363: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
T2_asi_reg_wr_154:
	mov	0x2, %r14
	.word 0xf4f384a0  ! 3364: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_244:
	setx	0x390313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_245:
	setx	0x3a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc940020  ! 3369: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
cpu_intr_2_246:
	setx	0x390217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x3b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8ce024  ! 3374: LDUBA_I	lduba	[%r19, + 0x0024] %asi, %r29
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 9)
	.word 0xf4542048  ! 3379: LDSH_I	ldsh	[%r16 + 0x0048], %r26
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, d)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f58  ! 3382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f58, %hpstate
cpu_intr_2_248:
	setx	0x38020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_137:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 35)
	.word 0xfecd4020  ! 3390: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 32)
	.word 0xf2544000  ! 3398: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xfa048000  ! 3400: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xfa5d2118  ! 3401: LDX_I	ldx	[%r20 + 0x0118], %r29
T2_asi_reg_rd_138:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_155:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3405: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_156:
	mov	0x9, %r14
	.word 0xf8f38e60  ! 3410: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_249:
	setx	0x390328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 14)
	.word 0xf094a0cc  ! 3417: LDUHA_I	lduha	[%r18, + 0x00cc] %asi, %r24
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_250:
	setx	0x3b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21561c6  ! 3425: LDUH_I	lduh	[%r21 + 0x01c6], %r25
	.word 0xfc4dc000  ! 3427: LDSB_R	ldsb	[%r23 + %r0], %r30
cpu_intr_2_251:
	setx	0x39033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414208e  ! 3434: LDUH_I	lduh	[%r16 + 0x008e], %r26
	.word 0xf6c5e05a  ! 3437: LDSWA_I	ldswa	[%r23, + 0x005a] %asi, %r27
	.word 0xb08da06e  ! 3442: ANDcc_I	andcc 	%r22, 0x006e, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfccde021  ! 3446: LDSBA_I	ldsba	[%r23, + 0x0021] %asi, %r30
	.word 0xb8958000  ! 3448: ORcc_R	orcc 	%r22, %r0, %r28
cpu_intr_2_252:
	setx	0x38030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a08  ! 3453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a08, %hpstate
cpu_intr_2_253:
	setx	0x3b0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb645c000  ! 3460: ADDC_R	addc 	%r23, %r0, %r27
cpu_intr_2_254:
	setx	0x3b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8444000  ! 3463: ADDC_R	addc 	%r17, %r0, %r28
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_255:
	setx	0x3a0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_157:
	mov	0x2a, %r14
	.word 0xfcf384a0  ! 3469: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb29d4000  ! 3471: XORcc_R	xorcc 	%r21, %r0, %r25
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 9)
	.word 0xb0ac610d  ! 3474: ANDNcc_I	andncc 	%r17, 0x010d, %r24
	.word 0xf0858020  ! 3476: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbe0d0000  ! 3481: AND_R	and 	%r20, %r0, %r31
T2_asi_reg_rd_139:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c58  ! 3486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c58, %hpstate
	.word 0xf65c0000  ! 3488: LDX_R	ldx	[%r16 + %r0], %r27
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 37)
	.word 0xfc8cc020  ! 3492: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
	.word 0xb2bcc000  ! 3493: XNORcc_R	xnorcc 	%r19, %r0, %r25
	.word 0xfc554000  ! 3494: LDSH_R	ldsh	[%r21 + %r0], %r30
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 24)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d12  ! 3500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d12, %hpstate
	.word 0xfa044000  ! 3501: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xba0d8000  ! 3505: AND_R	and 	%r22, %r0, %r29
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 0)
	.word 0x89942036  ! 3507: WRPR_TICK_I	wrpr	%r16, 0x0036, %tick
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf4542022  ! 3511: LDSH_I	ldsh	[%r16 + 0x0022], %r26
T2_asi_reg_wr_158:
	mov	0x16, %r14
	.word 0xfcf38e60  ! 3513: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_256:
	setx	0x3a002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095e01b  ! 3518: LDUHA_I	lduha	[%r23, + 0x001b] %asi, %r24
	.word 0xb1351000  ! 3520: SRLX_R	srlx	%r20, %r0, %r24
cpu_intr_2_257:
	setx	0x390234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_159:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 3524: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_140:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 3525: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_160:
	mov	0xf, %r14
	.word 0xf0f389e0  ! 3526: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 1c)
	.word 0xbcc5c000  ! 3529: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0xb49c8000  ! 3530: XORcc_R	xorcc 	%r18, %r0, %r26
cpu_intr_2_258:
	setx	0x3b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc0da01b  ! 3534: LDUB_I	ldub	[%r22 + 0x001b], %r30
T2_asi_reg_wr_161:
	mov	0x2, %r14
	.word 0xf6f389e0  ! 3537: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xfed58020  ! 3540: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_162:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 3546: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb0154000  ! 3547: OR_R	or 	%r21, %r0, %r24
	.word 0xba1de03a  ! 3548: XOR_I	xor 	%r23, 0x003a, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf4048000  ! 3550: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xfec5e0ee  ! 3551: LDSWA_I	ldswa	[%r23, + 0x00ee] %asi, %r31
	.word 0xfc5c0000  ! 3552: LDX_R	ldx	[%r16 + %r0], %r30
T2_asi_reg_wr_163:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 3553: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_259:
	setx	0x390204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_260:
	setx	0x3a013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0548000  ! 3557: LDSH_R	ldsh	[%r18 + %r0], %r24
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 38)
	.word 0xf60cc000  ! 3562: LDUB_R	ldub	[%r19 + %r0], %r27
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 8)
	.word 0xbc85603b  ! 3565: ADDcc_I	addcc 	%r21, 0x003b, %r30
cpu_intr_2_261:
	setx	0x38020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_262:
	setx	0x39022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x390333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6150000  ! 3573: LDUH_R	lduh	[%r20 + %r0], %r27
cpu_intr_2_264:
	setx	0x39021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_265:
	setx	0x390036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_141:
	mov	0x1c, %r14
	.word 0xf8db8e60  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_266:
	setx	0x380103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_164:
	mov	0x26, %r14
	.word 0xf6f384a0  ! 3586: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfcd5202f  ! 3588: LDSHA_I	ldsha	[%r20, + 0x002f] %asi, %r30
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 15)
	.word 0xb0b5c000  ! 3592: SUBCcc_R	orncc 	%r23, %r0, %r24
	.word 0xfa54a166  ! 3596: LDSH_I	ldsh	[%r18 + 0x0166], %r29
cpu_intr_2_267:
	setx	0x3a0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05c000  ! 3598: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf08c4020  ! 3599: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
	.word 0xb6442196  ! 3600: ADDC_I	addc 	%r16, 0x0196, %r27
	.word 0xb37ca401  ! 3601: MOVR_I	movre	%r18, 0x1, %r25
T2_asi_reg_rd_142:
	mov	0x1b, %r14
	.word 0xf0db89e0  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfadc6007  ! 3605: LDXA_I	ldxa	[%r17, + 0x0007] %asi, %r29
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 30)
	.word 0xfec5e07d  ! 3610: LDSWA_I	ldswa	[%r23, + 0x007d] %asi, %r31
	.word 0xfa5ca128  ! 3612: LDX_I	ldx	[%r18 + 0x0128], %r29
	.word 0xfa0dc000  ! 3613: LDUB_R	ldub	[%r23 + %r0], %r29
cpu_intr_2_268:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6856182  ! 3619: LDUWA_I	lduwa	[%r21, + 0x0182] %asi, %r27
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 5)
	.word 0xf6048000  ! 3621: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb0a54000  ! 3623: SUBcc_R	subcc 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf654e0b8  ! 3626: LDSH_I	ldsh	[%r19 + 0x00b8], %r27
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 30)
	.word 0xf6042187  ! 3629: LDUW_I	lduw	[%r16 + 0x0187], %r27
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf2d460b3  ! 3642: LDSHA_I	ldsha	[%r17, + 0x00b3] %asi, %r25
T2_asi_reg_wr_165:
	mov	0x22, %r14
	.word 0xf6f389e0  ! 3646: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_269:
	setx	0x39031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d420ba  ! 3650: LDSHA_I	ldsha	[%r16, + 0x00ba] %asi, %r26
T2_asi_reg_wr_166:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 3651: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_270:
	setx	0x38000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_167:
	mov	0x1b, %r14
	.word 0xf6f384a0  ! 3655: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf80c602b  ! 3658: LDUB_I	ldub	[%r17 + 0x002b], %r28
	.word 0xfa144000  ! 3659: LDUH_R	lduh	[%r17 + %r0], %r29
cpu_intr_2_271:
	setx	0x3b0112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_272:
	setx	0x3a0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_168:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 3665: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_143:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 3667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_273:
	setx	0x3a010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_274:
	setx	0x3a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x3f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 17)
	.word 0xf20c211b  ! 3674: LDUB_I	ldub	[%r16 + 0x011b], %r25
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983802  ! 3678: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1802, %hpstate
	.word 0xf215c000  ! 3680: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xfa15a135  ! 3681: LDUH_I	lduh	[%r22 + 0x0135], %r29
cpu_intr_2_276:
	setx	0x3e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_169:
	mov	0x12, %r14
	.word 0xf4f384a0  ! 3685: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 15)
	.word 0xb0c461ab  ! 3688: ADDCcc_I	addccc 	%r17, 0x01ab, %r24
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982908  ! 3690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
cpu_intr_2_277:
	setx	0x3e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_145:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_278:
	setx	0x3e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_rd_146:
	mov	0xa, %r14
	.word 0xf8db89e0  ! 3700: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_147:
	mov	0x2b, %r14
	.word 0xfcdb89e0  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf00d4000  ! 3704: LDUB_R	ldub	[%r21 + %r0], %r24
T2_asi_reg_rd_148:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf84c60bd  ! 3706: LDSB_I	ldsb	[%r17 + 0x00bd], %r28
T2_asi_reg_wr_170:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 3708: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_149:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf445a1c2  ! 3713: LDSW_I	ldsw	[%r22 + 0x01c2], %r26
	.word 0xfe84a0f7  ! 3714: LDUWA_I	lduwa	[%r18, + 0x00f7] %asi, %r31
	.word 0xfe14c000  ! 3716: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xb8b5c000  ! 3717: ORNcc_R	orncc 	%r23, %r0, %r28
cpu_intr_2_279:
	setx	0x3f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_280:
	setx	0x3d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_171:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 3721: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_281:
	setx	0x3e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_282:
	setx	0x30033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_283:
	setx	0x3c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf84ce0cb  ! 3734: LDSB_I	ldsb	[%r19 + 0x00cb], %r28
T2_asi_reg_wr_172:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 3735: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_173:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 3739: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_150:
	mov	0x0, %r14
	.word 0xf6db8400  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf454a1fd  ! 3746: LDSH_I	ldsh	[%r18 + 0x01fd], %r26
	.word 0xf00c0000  ! 3747: LDUB_R	ldub	[%r16 + %r0], %r24
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_151:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 3752: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_284:
	setx	0x3e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_285:
	setx	0x3e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_286:
	setx	0x3d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819838d8  ! 3759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d8, %hpstate
	.word 0xf8c50020  ! 3762: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_287:
	setx	0x3d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa058000  ! 3772: LDUW_R	lduw	[%r22 + %r0], %r29
T2_asi_reg_rd_152:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_174:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 3774: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb2848000  ! 3775: ADDcc_R	addcc 	%r18, %r0, %r25
	.word 0xb0358000  ! 3776: SUBC_R	orn 	%r22, %r0, %r24
	.word 0xb244c000  ! 3779: ADDC_R	addc 	%r19, %r0, %r25
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_175:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 3783: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_288:
	setx	0x3e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfa5cc000  ! 3790: LDX_R	ldx	[%r19 + %r0], %r29
T2_asi_reg_rd_153:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3791: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe54c000  ! 3795: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xb814e070  ! 3800: OR_I	or 	%r19, 0x0070, %r28
cpu_intr_2_289:
	setx	0x3e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb42dc000  ! 3809: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xfa142101  ! 3811: LDUH_I	lduh	[%r16 + 0x0101], %r29
cpu_intr_2_290:
	setx	0x3f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf24d4000  ! 3823: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf8dc6084  ! 3826: LDXA_I	ldxa	[%r17, + 0x0084] %asi, %r28
	.word 0xfcd5a1e1  ! 3827: LDSHA_I	ldsha	[%r22, + 0x01e1] %asi, %r30
T2_asi_reg_wr_176:
	mov	0x9, %r14
	.word 0xfef38e40  ! 3829: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa4d8000  ! 3830: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf48c8020  ! 3832: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
	.word 0xf60cc000  ! 3834: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xf05c61de  ! 3838: LDX_I	ldx	[%r17 + 0x01de], %r24
	.word 0xfad50020  ! 3842: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
cpu_intr_2_291:
	setx	0x3c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8448000  ! 3851: LDSW_R	ldsw	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf0d5c020  ! 3856: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_177:
	mov	0x30, %r14
	.word 0xfaf38e60  ! 3859: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc8d61a9  ! 3860: LDUBA_I	lduba	[%r21, + 0x01a9] %asi, %r30
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_154:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf0544000  ! 3865: LDSH_R	ldsh	[%r17 + %r0], %r24
cpu_intr_2_292:
	setx	0x3c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c4a1d5  ! 3867: LDSWA_I	ldswa	[%r18, + 0x01d5] %asi, %r27
	.word 0xf294e033  ! 3871: LDUHA_I	lduha	[%r19, + 0x0033] %asi, %r25
cpu_intr_2_293:
	setx	0x3c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_155:
	mov	0x22, %r14
	.word 0xf4db89e0  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf4454000  ! 3880: LDSW_R	ldsw	[%r21 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_156:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_294:
	setx	0x3e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_157:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_178:
	mov	0x1b, %r14
	.word 0xfcf384a0  ! 3895: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbcb4e08a  ! 3898: SUBCcc_I	orncc 	%r19, 0x008a, %r30
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 17)
	.word 0xf2840020  ! 3901: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4dd60e9  ! 3909: LDXA_I	ldxa	[%r21, + 0x00e9] %asi, %r26
cpu_intr_2_295:
	setx	0x3d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1351000  ! 3911: SRLX_R	srlx	%r20, %r0, %r24
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_158:
	mov	0x2c, %r14
	.word 0xf6db8e80  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb951c000  ! 3921: RDPR_TL	rdpr	%tl, %r28
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 39)
	.word 0xf8cd0020  ! 3924: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
cpu_intr_2_296:
	setx	0x3c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf44c8000  ! 3932: LDSB_R	ldsb	[%r18 + %r0], %r26
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_159:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfa55e017  ! 3942: LDSH_I	ldsh	[%r23 + 0x0017], %r29
	.word 0xf65da155  ! 3943: LDX_I	ldx	[%r22 + 0x0155], %r27
	.word 0xf0054000  ! 3944: LDUW_R	lduw	[%r21 + %r0], %r24
T2_asi_reg_rd_160:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_179:
	mov	0x14, %r14
	.word 0xf6f384a0  ! 3946: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_180:
	mov	0x1f, %r14
	.word 0xf6f384a0  ! 3947: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_161:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_162:
	mov	0x20, %r14
	.word 0xf0db8400  ! 3955: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1352001  ! 3958: SRL_I	srl 	%r20, 0x0001, %r24
T2_asi_reg_rd_163:
	mov	0x9, %r14
	.word 0xf4db8e80  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_164:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3962: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 10)
	.word 0xf44dc000  ! 3967: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xf215e041  ! 3968: LDUH_I	lduh	[%r23 + 0x0041], %r25
	.word 0xbca54000  ! 3969: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xfe154000  ! 3971: LDUH_R	lduh	[%r21 + %r0], %r31
T2_asi_reg_rd_165:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 3972: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_166:
	mov	0x36, %r14
	.word 0xfadb8400  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfcc4e132  ! 3974: LDSWA_I	ldswa	[%r19, + 0x0132] %asi, %r30
	.word 0xfec54020  ! 3976: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf684c020  ! 3979: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 23)
	.word 0xf205a172  ! 3981: LDUW_I	lduw	[%r22 + 0x0172], %r25
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 2c)
	.word 0xba0c8000  ! 3984: AND_R	and 	%r18, %r0, %r29
T2_asi_reg_rd_167:
	mov	0x2f, %r14
	.word 0xf2db8e80  ! 3987: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf6d5a1c9  ! 3988: LDSHA_I	ldsha	[%r22, + 0x01c9] %asi, %r27
T2_asi_reg_wr_181:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 3992: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
cpu_intr_2_297:
	setx	0x3c0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894e0bf  ! 3998: LDUHA_I	lduha	[%r19, + 0x00bf] %asi, %r28
cpu_intr_2_298:
	setx	0x3f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_299:
	setx	0x3e032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d0000  ! 4011: XORcc_R	xorcc 	%r20, %r0, %r31
cpu_intr_2_300:
	setx	0x3e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64c4000  ! 4018: LDSB_R	ldsb	[%r17 + %r0], %r27
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 25)
	.word 0xb92cd000  ! 4021: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xf0848020  ! 4024: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 8)
	.word 0xf24ca0c3  ! 4026: LDSB_I	ldsb	[%r18 + 0x00c3], %r25
cpu_intr_2_301:
	setx	0x3f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a52  ! 4028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf48d4020  ! 4033: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xb12c7001  ! 4038: SLLX_I	sllx	%r17, 0x0001, %r24
	.word 0xb8050000  ! 4041: ADD_R	add 	%r20, %r0, %r28
	.word 0xfcc4a177  ! 4043: LDSWA_I	ldswa	[%r18, + 0x0177] %asi, %r30
cpu_intr_2_302:
	setx	0x3d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x21, %r14
	.word 0xf8db8e60  ! 4046: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa55c000  ! 4047: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf28c4020  ! 4051: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	.word 0xf85c8000  ! 4055: LDX_R	ldx	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa450000  ! 4058: LDSW_R	ldsw	[%r20 + %r0], %r29
cpu_intr_2_303:
	setx	0x3c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c21fb  ! 4062: LDSB_I	ldsb	[%r16 + 0x01fb], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_304:
	setx	0x3f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 4072: RDPR_TT	<illegal instruction>
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_305:
	setx	0x3f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8142049  ! 4077: LDUH_I	lduh	[%r16 + 0x0049], %r28
T2_asi_reg_wr_182:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 4079: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_183:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 4084: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_184:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 4087: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb52d0000  ! 4089: SLL_R	sll 	%r20, %r0, %r26
	.word 0xf60c2192  ! 4090: LDUB_I	ldub	[%r16 + 0x0192], %r27
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_185:
	mov	0x1b, %r14
	.word 0xfef38400  ! 4094: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_169:
	mov	0x33, %r14
	.word 0xfcdb8e80  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb2c5c000  ! 4097: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xf4440000  ! 4098: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xfa440000  ! 4100: LDSW_R	ldsw	[%r16 + %r0], %r29
cpu_intr_2_306:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245e06a  ! 4102: LDSW_I	ldsw	[%r23 + 0x006a], %r25
cpu_intr_2_307:
	setx	0x3f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_170:
	mov	0x3, %r14
	.word 0xfcdb8e60  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_171:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 4110: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf28ce09d  ! 4115: LDUBA_I	lduba	[%r19, + 0x009d] %asi, %r25
	.word 0xb6b42020  ! 4117: SUBCcc_I	orncc 	%r16, 0x0020, %r27
	.word 0xb84520c5  ! 4122: ADDC_I	addc 	%r20, 0x00c5, %r28
cpu_intr_2_308:
	setx	0x42032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4556165  ! 4130: LDSH_I	ldsh	[%r21 + 0x0165], %r26
T2_asi_reg_wr_186:
	mov	0x16, %r14
	.word 0xfaf38e40  ! 4134: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0052008  ! 4136: LDUW_I	lduw	[%r20 + 0x0008], %r24
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 24)
	.word 0xf0d56121  ! 4138: LDSHA_I	ldsha	[%r21, + 0x0121] %asi, %r24
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf8840020  ! 4141: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r28
cpu_intr_2_309:
	setx	0x41033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d4000  ! 4144: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf8d40020  ! 4145: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r28
T2_asi_reg_wr_187:
	mov	0x1f, %r14
	.word 0xf0f389e0  ! 4148: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbd7d6401  ! 4149: MOVR_I	movre	%r21, 0x1, %r30
	.word 0xb085a115  ! 4150: ADDcc_I	addcc 	%r22, 0x0115, %r24
T2_asi_reg_rd_172:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 4151: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_173:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_188:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 4154: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbf3c4000  ! 4155: SRA_R	sra 	%r17, %r0, %r31
cpu_intr_2_310:
	setx	0x420007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 8)
	.word 0xfc542184  ! 4160: LDSH_I	ldsh	[%r16 + 0x0184], %r30
T2_asi_reg_rd_174:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 4162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf0d4c020  ! 4164: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_311:
	setx	0x420026, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c52  ! 4182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
T2_asi_reg_wr_189:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4184: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf25ca11b  ! 4192: LDX_I	ldx	[%r18 + 0x011b], %r25
	.word 0xb62c8000  ! 4194: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xf6dce13d  ! 4195: LDXA_I	ldxa	[%r19, + 0x013d] %asi, %r27
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_175:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 4197: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_312:
	setx	0x40013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa8c617b  ! 4205: LDUBA_I	lduba	[%r17, + 0x017b] %asi, %r29
	.word 0x8994a1c6  ! 4206: WRPR_TICK_I	wrpr	%r18, 0x01c6, %tick
	.word 0xf28c20fa  ! 4208: LDUBA_I	lduba	[%r16, + 0x00fa] %asi, %r25
	.word 0xf2550000  ! 4209: LDSH_R	ldsh	[%r20 + %r0], %r25
T2_asi_reg_rd_176:
	mov	0x36, %r14
	.word 0xf8db8e80  ! 4210: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf88ce020  ! 4211: LDUBA_I	lduba	[%r19, + 0x0020] %asi, %r28
	.word 0xf65c0000  ! 4213: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xb52cd000  ! 4215: SLLX_R	sllx	%r19, %r0, %r26
	.word 0xfadce1bc  ! 4217: LDXA_I	ldxa	[%r19, + 0x01bc] %asi, %r29
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 25)
	.word 0xf455203a  ! 4220: LDSH_I	ldsh	[%r20 + 0x003a], %r26
T2_asi_reg_rd_177:
	mov	0x8, %r14
	.word 0xf8db8400  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf494a02c  ! 4222: LDUHA_I	lduha	[%r18, + 0x002c] %asi, %r26
cpu_intr_2_313:
	setx	0x420219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_190:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4225: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_178:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 4230: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf4942124  ! 4231: LDUHA_I	lduha	[%r16, + 0x0124] %asi, %r26
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 22)
	.word 0xfe5c8000  ! 4234: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xbc44a096  ! 4239: ADDC_I	addc 	%r18, 0x0096, %r30
	.word 0xb82d4000  ! 4241: ANDN_R	andn 	%r21, %r0, %r28
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_314:
	setx	0x430033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05561d1  ! 4246: LDSH_I	ldsh	[%r21 + 0x01d1], %r24
	.word 0xf4d4a122  ! 4257: LDSHA_I	ldsha	[%r18, + 0x0122] %asi, %r26
T2_asi_reg_rd_179:
	mov	0x25, %r14
	.word 0xf8db84a0  ! 4259: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_191:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 4263: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_315:
	setx	0x41001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d8000  ! 4267: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf0ccc020  ! 4270: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
	.word 0xf44cc000  ! 4274: LDSB_R	ldsb	[%r19 + %r0], %r26
cpu_intr_2_316:
	setx	0x41011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_317:
	setx	0x400017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64ca0a6  ! 4280: LDSB_I	ldsb	[%r18 + 0x00a6], %r27
	.word 0xfac48020  ! 4281: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_181:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_192:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 4286: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfe146016  ! 4290: LDUH_I	lduh	[%r17 + 0x0016], %r31
	.word 0xfccc0020  ! 4291: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xfcc520fd  ! 4292: LDSWA_I	ldswa	[%r20, + 0x00fd] %asi, %r30
T2_asi_reg_wr_193:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 4293: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f08  ! 4294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f08, %hpstate
	.word 0xf60c4000  ! 4299: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xf6154000  ! 4300: LDUH_R	lduh	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_318:
	setx	0x400211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_194:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4320: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_319:
	setx	0x40022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_320:
	setx	0x42023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25421d9  ! 4323: LDSH_I	ldsh	[%r16 + 0x01d9], %r25
	.word 0xf6dc6083  ! 4327: LDXA_I	ldxa	[%r17, + 0x0083] %asi, %r27
T2_asi_reg_rd_182:
	mov	0x38, %r14
	.word 0xfcdb89e0  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_195:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 4331: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf4854020  ! 4332: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
	.word 0xb0bd21ae  ! 4333: XNORcc_I	xnorcc 	%r20, 0x01ae, %r24
	.word 0xf4cd61a1  ! 4335: LDSBA_I	ldsba	[%r21, + 0x01a1] %asi, %r26
	.word 0xf4144000  ! 4336: LDUH_R	lduh	[%r17 + %r0], %r26
T2_asi_reg_rd_183:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 4338: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_196:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 4339: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0150000  ! 4342: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb1357001  ! 4344: SRLX_I	srlx	%r21, 0x0001, %r24
cpu_intr_2_321:
	setx	0x40021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_184:
	mov	0x6, %r14
	.word 0xfedb8e80  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_185:
	mov	0x32, %r14
	.word 0xf6db8e80  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfa156095  ! 4351: LDUH_I	lduh	[%r21 + 0x0095], %r29
cpu_intr_2_322:
	setx	0x42001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_323:
	setx	0x420121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c4020  ! 4356: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
	.word 0xf4946194  ! 4358: LDUHA_I	lduha	[%r17, + 0x0194] %asi, %r26
	.word 0xb33c2001  ! 4359: SRA_I	sra 	%r16, 0x0001, %r25
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc5c4000  ! 4364: LDX_R	ldx	[%r17 + %r0], %r30
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_324:
	setx	0x420100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_186:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf044c000  ! 4369: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xfec4c020  ! 4370: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xf8140000  ! 4375: LDUH_R	lduh	[%r16 + %r0], %r28
T2_asi_reg_wr_197:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 4379: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_325:
	setx	0x410004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c0020  ! 4383: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	.word 0xfe540000  ! 4385: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf2dd61c4  ! 4386: LDXA_I	ldxa	[%r21, + 0x01c4] %asi, %r25
cpu_intr_2_326:
	setx	0x41002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8048000  ! 4393: LDUW_R	lduw	[%r18 + %r0], %r28
cpu_intr_2_327:
	setx	0x420323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc84e08f  ! 4402: LDUWA_I	lduwa	[%r19, + 0x008f] %asi, %r30
	.word 0xb93d5000  ! 4403: SRAX_R	srax	%r21, %r0, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf88da142  ! 4407: LDUBA_I	lduba	[%r22, + 0x0142] %asi, %r28
	.word 0xfa9520a2  ! 4408: LDUHA_I	lduha	[%r20, + 0x00a2] %asi, %r29
	.word 0xf8950020  ! 4409: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
T2_asi_reg_wr_198:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 4410: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_328:
	setx	0x420334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_329:
	setx	0x400037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_330:
	setx	0x400032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0358000  ! 4422: ORN_R	orn 	%r22, %r0, %r24
T2_asi_reg_rd_187:
	mov	0x9, %r14
	.word 0xf6db8e40  ! 4423: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf40d61b8  ! 4428: LDUB_I	ldub	[%r21 + 0x01b8], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8556065  ! 4430: LDSH_I	ldsh	[%r21 + 0x0065], %r28
T2_asi_reg_rd_188:
	mov	0x23, %r14
	.word 0xf2db8400  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf215c000  ! 4433: LDUH_R	lduh	[%r23 + %r0], %r25
cpu_intr_2_331:
	setx	0x41030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89d0000  ! 4436: XORcc_R	xorcc 	%r20, %r0, %r28
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa05c000  ! 4441: LDUW_R	lduw	[%r23 + %r0], %r29
T2_asi_reg_rd_189:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 4444: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 16)
	.word 0xfacdc020  ! 4447: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 27)
	.word 0xb8044000  ! 4453: ADD_R	add 	%r17, %r0, %r28
T2_asi_reg_wr_199:
	mov	0x21, %r14
	.word 0xfef38400  ! 4454: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe4c0000  ! 4458: LDSB_R	ldsb	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_332:
	setx	0x420036, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_190:
	mov	0x2c, %r14
	.word 0xf8db8e60  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf684a031  ! 4469: LDUWA_I	lduwa	[%r18, + 0x0031] %asi, %r27
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_TO_TL1
	.word 0xfc548000  ! 4478: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xf084e138  ! 4479: LDUWA_I	lduwa	[%r19, + 0x0138] %asi, %r24
cpu_intr_2_333:
	setx	0x41002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814e0e1  ! 4485: LDUH_I	lduh	[%r19 + 0x00e1], %r28
T2_asi_reg_wr_200:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 4487: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_334:
	setx	0x40013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 1)
	.word 0xf44d4000  ! 4491: LDSB_R	ldsb	[%r21 + %r0], %r26
T2_asi_reg_rd_191:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 4492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_335:
	setx	0x41000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe94a14a  ! 4497: LDUHA_I	lduha	[%r18, + 0x014a] %asi, %r31
	.word 0xfc94a1e5  ! 4506: LDUHA_I	lduha	[%r18, + 0x01e5] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_192:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe05a0dd  ! 4512: LDUW_I	lduw	[%r22 + 0x00dd], %r31
	.word 0xf4dda05b  ! 4513: LDXA_I	ldxa	[%r22, + 0x005b] %asi, %r26
	.word 0xf4dda047  ! 4514: LDXA_I	ldxa	[%r22, + 0x0047] %asi, %r26
	.word 0xf4556080  ! 4517: LDSH_I	ldsh	[%r21 + 0x0080], %r26
	.word 0xfa55a0bd  ! 4519: LDSH_I	ldsh	[%r22 + 0x00bd], %r29
	.word 0xfe058000  ! 4520: LDUW_R	lduw	[%r22 + %r0], %r31
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f52  ! 4521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f52, %hpstate
	.word 0xf2042063  ! 4523: LDUW_I	lduw	[%r16 + 0x0063], %r25
	.word 0xf60d21f9  ! 4524: LDUB_I	ldub	[%r20 + 0x01f9], %r27
	.word 0xb4b56196  ! 4526: SUBCcc_I	orncc 	%r21, 0x0196, %r26
T2_asi_reg_wr_201:
	mov	0x32, %r14
	.word 0xfcf38e60  ! 4527: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfa0ce123  ! 4531: LDUB_I	ldub	[%r19 + 0x0123], %r29
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_202:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 4537: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_wr_203:
	mov	0x1c, %r14
	.word 0xf4f38e80  ! 4542: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_193:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf0d48020  ! 4548: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
cpu_intr_2_336:
	setx	0x430137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_337:
	setx	0x41002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_194:
	mov	0x29, %r14
	.word 0xf4db8e40  ! 4554: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0cd61ce  ! 4555: LDSBA_I	ldsba	[%r21, + 0x01ce] %asi, %r24
	.word 0xf08d4020  ! 4556: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xf2950020  ! 4559: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
	.word 0xb6c52095  ! 4561: ADDCcc_I	addccc 	%r20, 0x0095, %r27
cpu_intr_2_338:
	setx	0x410227, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_195:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_339:
	setx	0x430336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_196:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf80d8000  ! 4569: LDUB_R	ldub	[%r22 + %r0], %r28
T2_asi_reg_rd_197:
	mov	0x14, %r14
	.word 0xf2db89e0  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb035e0d0  ! 4571: SUBC_I	orn 	%r23, 0x00d0, %r24
cpu_intr_2_340:
	setx	0x400101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc950000  ! 4573: ORcc_R	orcc 	%r20, %r0, %r30
cpu_intr_2_341:
	setx	0x400225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534c000  ! 4575: SRL_R	srl 	%r19, %r0, %r26
	.word 0xfac520eb  ! 4576: LDSWA_I	ldswa	[%r20, + 0x00eb] %asi, %r29
cpu_intr_2_342:
	setx	0x450012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_204:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 4582: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb445616e  ! 4583: ADDC_I	addc 	%r21, 0x016e, %r26
cpu_intr_2_343:
	setx	0x460231, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f8a  ! 4588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f8a, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_344:
	setx	0x470334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_198:
	mov	0x25, %r14
	.word 0xfcdb8e80  ! 4604: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_345:
	setx	0x44003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_199:
	mov	0x26, %r14
	.word 0xfcdb89e0  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf40d8000  ! 4608: LDUB_R	ldub	[%r22 + %r0], %r26
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 8)
	.word 0xf844c000  ! 4616: LDSW_R	ldsw	[%r19 + %r0], %r28
cpu_intr_2_346:
	setx	0x440237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 4618: MOVcc_I	<illegal instruction>
	.word 0xfccc0020  ! 4620: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xf24d0000  ! 4621: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xf484a142  ! 4623: LDUWA_I	lduwa	[%r18, + 0x0142] %asi, %r26
T2_asi_reg_rd_200:
	mov	0x19, %r14
	.word 0xf4db8400  ! 4624: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_347:
	setx	0x450023, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_201:
	mov	0x3, %r14
	.word 0xf0db8e80  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_348:
	setx	0x47020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8de189  ! 4635: LDUBA_I	lduba	[%r23, + 0x0189] %asi, %r29
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e98  ! 4637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
	.word 0xf6956092  ! 4638: LDUHA_I	lduha	[%r21, + 0x0092] %asi, %r27
cpu_intr_2_349:
	setx	0x460216, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e10  ! 4642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e10, %hpstate
	.word 0xfac50020  ! 4644: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
	.word 0xfccc4020  ! 4645: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r30
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_rd_202:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 24)
	.word 0xb1510000  ! 4651: RDPR_TICK	<illegal instruction>
T2_asi_reg_wr_205:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 4652: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf40d205d  ! 4654: LDUB_I	ldub	[%r20 + 0x005d], %r26
	.word 0xb1480000  ! 4657: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
cpu_intr_2_350:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_351:
	setx	0x460327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ce160  ! 4661: LDX_I	ldx	[%r19 + 0x0160], %r27
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 26)
	.word 0xfe9460a5  ! 4665: LDUHA_I	lduha	[%r17, + 0x00a5] %asi, %r31
	.word 0xfac40020  ! 4668: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
T2_asi_reg_wr_206:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 4669: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_203:
	mov	0x13, %r14
	.word 0xfcdb8e60  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6044000  ! 4673: LDUW_R	lduw	[%r17 + %r0], %r27
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_207:
	mov	0x33, %r14
	.word 0xfcf389e0  ! 4675: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_352:
	setx	0x450322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfe8d4020  ! 4685: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c10  ! 4686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_204:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_208:
	mov	0x2, %r14
	.word 0xf2f384a0  ! 4692: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf85d4000  ! 4693: LDX_R	ldx	[%r21 + %r0], %r28
cpu_intr_2_353:
	setx	0x47013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_354:
	setx	0x45010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d5e06c  ! 4698: LDSHA_I	ldsha	[%r23, + 0x006c] %asi, %r28
	.word 0xf0d5e161  ! 4699: LDSHA_I	ldsha	[%r23, + 0x0161] %asi, %r24
	.word 0xfa848020  ! 4700: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
	.word 0xf8dce14c  ! 4701: LDXA_I	ldxa	[%r19, + 0x014c] %asi, %r28
T2_asi_reg_rd_205:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb934e001  ! 4704: SRL_I	srl 	%r19, 0x0001, %r28
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf6cc0020  ! 4709: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
	.word 0xf28c4020  ! 4711: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	.word 0xfc0ce18c  ! 4713: LDUB_I	ldub	[%r19 + 0x018c], %r30
cpu_intr_2_355:
	setx	0x450201, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0x1a, %r14
	.word 0xfedb8e60  ! 4717: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_356:
	setx	0x470208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_207:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_208:
	mov	0x5, %r14
	.word 0xf4db8e40  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbab4c000  ! 4725: SUBCcc_R	orncc 	%r19, %r0, %r29
T2_asi_reg_wr_209:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 4727: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_210:
	mov	0xe, %r14
	.word 0xfaf38e60  ! 4736: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_357:
	setx	0x470304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_358:
	setx	0x440200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294c020  ! 4748: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	.word 0xfa5c4000  ! 4749: LDX_R	ldx	[%r17 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_209:
	mov	0x29, %r14
	.word 0xfadb8e40  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb4b48000  ! 4754: ORNcc_R	orncc 	%r18, %r0, %r26
T2_asi_reg_rd_210:
	mov	0x17, %r14
	.word 0xf8db8e80  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 33)
	.word 0xf815a04e  ! 4763: LDUH_I	lduh	[%r22 + 0x004e], %r28
cpu_intr_2_359:
	setx	0x440102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_360:
	setx	0x47030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_211:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 4769: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf8956131  ! 4770: LDUHA_I	lduha	[%r21, + 0x0131] %asi, %r28
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_361:
	setx	0x46002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_212:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 4773: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf8c5212e  ! 4774: LDSWA_I	ldswa	[%r20, + 0x012e] %asi, %r28
cpu_intr_2_362:
	setx	0x450113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55c000  ! 4777: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xb63d21e7  ! 4781: XNOR_I	xnor 	%r20, 0x01e7, %r27
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_211:
	mov	0x37, %r14
	.word 0xf0db8400  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 3)
	.word 0xb4b5210b  ! 4789: ORNcc_I	orncc 	%r20, 0x010b, %r26
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982950  ! 4791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
T2_asi_reg_wr_213:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 4792: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xf4458000  ! 4796: LDSW_R	ldsw	[%r22 + %r0], %r26
cpu_intr_2_363:
	setx	0x44012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_364:
	setx	0x440108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_212:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_365:
	setx	0x460306, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_213:
	mov	0x26, %r14
	.word 0xfedb84a0  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_366:
	setx	0x45021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_214:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 4809: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6d50020  ! 4810: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf4c5e0a3  ! 4814: LDSWA_I	ldswa	[%r23, + 0x00a3] %asi, %r26
	.word 0xb2348000  ! 4816: SUBC_R	orn 	%r18, %r0, %r25
T2_asi_reg_wr_215:
	mov	0x31, %r14
	.word 0xfef38e60  ! 4818: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf445a1c5  ! 4819: LDSW_I	ldsw	[%r22 + 0x01c5], %r26
T2_asi_reg_rd_214:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 4820: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_215:
	mov	0x37, %r14
	.word 0xf4db8e80  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb73c0000  ! 4823: SRA_R	sra 	%r16, %r0, %r27
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_216:
	mov	0x3, %r14
	.word 0xf0f38400  ! 4826: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_367:
	setx	0x44030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc942029  ! 4828: LDUHA_I	lduha	[%r16, + 0x0029] %asi, %r30
T2_asi_reg_wr_217:
	mov	0xc, %r14
	.word 0xf6f38e60  ! 4829: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbb641800  ! 4831: MOVcc_R	<illegal instruction>
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_368:
	setx	0x44031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5da112  ! 4835: LDX_I	ldx	[%r22 + 0x0112], %r29
	.word 0xbe948000  ! 4836: ORcc_R	orcc 	%r18, %r0, %r31
	.word 0xb49c6005  ! 4837: XORcc_I	xorcc 	%r17, 0x0005, %r26
	.word 0xb6bd8000  ! 4838: XNORcc_R	xnorcc 	%r22, %r0, %r27
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_216:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf6958020  ! 4845: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xf6046188  ! 4846: LDUW_I	lduw	[%r17 + 0x0188], %r27
cpu_intr_2_369:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844e026  ! 4848: LDSW_I	ldsw	[%r19 + 0x0026], %r28
T2_asi_reg_wr_218:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 4849: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_370:
	setx	0x470032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d0000  ! 4851: LDX_R	ldx	[%r20 + %r0], %r27
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_371:
	setx	0x460108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c211c  ! 4860: LDUBA_I	lduba	[%r16, + 0x011c] %asi, %r29
	.word 0xfa440000  ! 4861: LDSW_R	ldsw	[%r16 + %r0], %r29
T2_asi_reg_wr_219:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 4862: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_217:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe55a158  ! 4866: LDSH_I	ldsh	[%r22 + 0x0158], %r31
	.word 0xf485e196  ! 4871: LDUWA_I	lduwa	[%r23, + 0x0196] %asi, %r26
	.word 0xf48da1fc  ! 4877: LDUBA_I	lduba	[%r22, + 0x01fc] %asi, %r26
	.word 0xf0d4e00f  ! 4878: LDSHA_I	ldsha	[%r19, + 0x000f] %asi, %r24
	.word 0xf404a09b  ! 4879: LDUW_I	lduw	[%r18 + 0x009b], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_218:
	mov	0x13, %r14
	.word 0xf8db84a0  ! 4885: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a52  ! 4887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
	.word 0xba35e0f7  ! 4888: SUBC_I	orn 	%r23, 0x00f7, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf65dc000  ! 4897: LDX_R	ldx	[%r23 + %r0], %r27
cpu_intr_2_372:
	setx	0x46000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_220:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 4901: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcd5a011  ! 4907: LDSHA_I	ldsha	[%r22, + 0x0011] %asi, %r30
	.word 0x91956051  ! 4910: WRPR_PIL_I	wrpr	%r21, 0x0051, %pil
	.word 0x89942074  ! 4912: WRPR_TICK_I	wrpr	%r16, 0x0074, %tick
cpu_intr_2_373:
	setx	0x470332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 21)
	.word 0xfad4c020  ! 4915: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
	.word 0xf20c2066  ! 4916: LDUB_I	ldub	[%r16 + 0x0066], %r25
cpu_intr_2_374:
	setx	0x44023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 4920: RDPR_TNPC	<illegal instruction>
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb63dc000  ! 4924: XNOR_R	xnor 	%r23, %r0, %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_221:
	mov	0x36, %r14
	.word 0xf6f38400  ! 4927: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_222:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 4929: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf245e1ef  ! 4930: LDSW_I	ldsw	[%r23 + 0x01ef], %r25
	.word 0xb88d208f  ! 4933: ANDcc_I	andcc 	%r20, 0x008f, %r28
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_223:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 4938: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_224:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 4940: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_375:
	setx	0x45023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_376:
	setx	0x45013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf4dc21b2  ! 4953: LDXA_I	ldxa	[%r16, + 0x01b2] %asi, %r26
T2_asi_reg_wr_225:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 4954: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_377:
	setx	0x460005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_378:
	setx	0x440209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5a046  ! 4959: ORNcc_I	orncc 	%r22, 0x0046, %r28
cpu_intr_2_379:
	setx	0x450113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_380:
	setx	0x47012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a58000  ! 4964: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xbb345000  ! 4966: SRLX_R	srlx	%r17, %r0, %r29
T2_asi_reg_wr_226:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 4967: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_219:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf2c56097  ! 4969: LDSWA_I	ldswa	[%r21, + 0x0097] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_381:
	setx	0x450026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_382:
	setx	0x440333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_383:
	setx	0x47033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_220:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_227:
	mov	0x3, %r14
	.word 0xf8f38e80  ! 4983: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf29420f5  ! 4984: LDUHA_I	lduha	[%r16, + 0x00f5] %asi, %r25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b88  ! 4987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b88, %hpstate
cpu_intr_2_384:
	setx	0x46001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_385:
	setx	0x460329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_221:
	mov	0x18, %r14
	.word 0xf8db8400  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
cpu_intr_1_0:
	setx	0x1b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00040  ! 6: FMOVd	fmovd	%f0, %f56
T1_asi_reg_wr_0:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 7: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1aa0820  ! 8: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab8820  ! 22: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_1:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 26: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5a94820  ! 29: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_0:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 31: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_1:
	mov	0x38, %r14
	.word 0xf0db8e40  ! 33: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa44960  ! 36: FMULq	dis not found

iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9a489e0  ! 41: FDIVq	dis not found

	.word 0xba3c8000  ! 42: XNOR_R	xnor 	%r18, %r0, %r29
T1_asi_reg_rd_2:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 43: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb9a90820  ! 45: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_1:
	setx	0x1c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 51: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb7a489a0  ! 52: FDIVs	fdivs	%f18, %f0, %f27
T1_asi_reg_rd_3:
	mov	0x18, %r14
	.word 0xfcdb8400  ! 55: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_4:
	mov	0x4, %r14
	.word 0xf0db8400  ! 57: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbbaa8820  ! 64: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbda40820  ! 73: FADDs	fadds	%f16, %f0, %f30
	.word 0xb7a4c8a0  ! 77: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xbda4c8a0  ! 82: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xbda80820  ! 83: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_5:
	mov	0xd, %r14
	.word 0xf2db8e60  ! 88: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_2:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 90: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb7a4c8a0  ! 94: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb9a548c0  ! 98: FSUBd	fsubd	%f52, %f0, %f28
T1_asi_reg_wr_3:
	mov	0x5, %r14
	.word 0xfaf384a0  ! 99: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfa81c20  ! 100: FMOVRGEZ	dis not found

	.word 0xb8c5a191  ! 102: ADDCcc_I	addccc 	%r22, 0x0191, %r28
	.word 0xb3a4c960  ! 106: FMULq	dis not found

	.word 0xbfa58840  ! 107: FADDd	faddd	%f22, %f0, %f62
	.word 0xb3a44820  ! 109: FADDs	fadds	%f17, %f0, %f25
cpu_intr_1_2:
	setx	0x1d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 111: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_6:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 112: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_3:
	setx	0x1d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 116: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_4:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 117: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfa4c920  ! 119: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb2940000  ! 122: ORcc_R	orcc 	%r16, %r0, %r25
T1_asi_reg_rd_7:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb9a80c20  ! 124: FMOVRLZ	dis not found

	.word 0xb9a489c0  ! 125: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xb5a9c820  ! 129: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_8:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 133: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1a80820  ! 134: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbeacc000  ! 135: ANDNcc_R	andncc 	%r19, %r0, %r31
cpu_intr_1_4:
	setx	0x1c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb295c000  ! 142: ORcc_R	orcc 	%r23, %r0, %r25
T1_asi_reg_wr_5:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 143: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb3a9c820  ! 146: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbbaac820  ! 147: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbd3da001  ! 148: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xbdab8820  ! 154: FMOVPOS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_5:
	setx	0x1c0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9ca034  ! 157: XORcc_I	xorcc 	%r18, 0x0034, %r31
	.word 0xbb7c0400  ! 158: MOVR_R	movre	%r16, %r0, %r29
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_6:
	setx	0x1d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbcb5e1c5  ! 165: ORNcc_I	orncc 	%r23, 0x01c5, %r30
T1_asi_reg_wr_6:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 168: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_7:
	mov	0x1d, %r14
	.word 0xfcf38e40  ! 171: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a80820  ! 174: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 22)
	.word 0xb1a00560  ! 178: FSQRTq	fsqrt	
	.word 0xb3aa0820  ! 180: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_8:
	mov	0xb, %r14
	.word 0xfaf38e60  ! 181: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba449a0  ! 192: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb095a1ce  ! 194: ORcc_I	orcc 	%r22, 0x01ce, %r24
T1_asi_reg_rd_9:
	mov	0x22, %r14
	.word 0xfedb84a0  ! 198: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, e)
	.word 0xba84c000  ! 200: ADDcc_R	addcc 	%r19, %r0, %r29
cpu_intr_1_7:
	setx	0x1f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb356001  ! 211: SRL_I	srl 	%r21, 0x0001, %r29
cpu_intr_1_8:
	setx	0x1f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5603a  ! 215: SUBcc_I	subcc 	%r21, 0x003a, %r30
	.word 0xbda88820  ! 216: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa8c820  ! 217: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_9:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 221: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbdab0820  ! 222: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_10:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_10:
	setx	0x1c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a90820  ! 230: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbba5c9e0  ! 232: FDIVq	dis not found

	.word 0xb3aac820  ! 234: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a98820  ! 235: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1aa4820  ! 240: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb73db001  ! 241: SRAX_I	srax	%r22, 0x0001, %r27
	.word 0xbfa589e0  ! 242: FDIVq	dis not found

iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_11:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 252: FSQRTq	fsqrt	
T1_asi_reg_wr_10:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 254: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbfa80820  ! 258: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81820  ! 264: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_12:
	setx	0x1e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 267: FMOVG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbabc820  ! 273: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_11:
	mov	0x25, %r14
	.word 0xfaf38400  ! 275: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_13:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_15:
	setx	0x1d030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_12:
	mov	0x2a, %r14
	.word 0xf6f389e0  ! 282: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_16:
	setx	0x20038, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_11:
	mov	0x15, %r14
	.word 0xfedb8e60  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0x83942198  ! 288: WRPR_TNPC_I	wrpr	%r16, 0x0198, %tnpc
	.word 0xb5a94820  ! 289: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0x8d9420ba  ! 290: WRPR_PSTATE_I	wrpr	%r16, 0x00ba, %pstate
	.word 0xb5a50940  ! 294: FMULd	fmuld	%f20, %f0, %f26
	.word 0xbba80c20  ! 295: FMOVRLZ	dis not found

cpu_intr_1_17:
	setx	0x1c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 304: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81820  ! 310: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb9a94820  ! 312: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, e)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a48920  ! 321: FMULs	fmuls	%f18, %f0, %f24
	.word 0xb5a5c8e0  ! 322: FSUBq	dis not found

	.word 0xb6c56119  ! 326: ADDCcc_I	addccc 	%r21, 0x0119, %r27
T1_asi_reg_rd_12:
	mov	0x23, %r14
	.word 0xf0db8400  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_13:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 333: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_14:
	mov	0x35, %r14
	.word 0xf6f38400  ! 334: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3aa8820  ! 337: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_13:
	mov	0x13, %r14
	.word 0xf6db8400  ! 338: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_18:
	setx	0x1f003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_19:
	setx	0x1d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_15:
	mov	0x21, %r14
	.word 0xfef38e60  ! 357: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_20:
	setx	0x1f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8c0  ! 360: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb81c0000  ! 364: XOR_R	xor 	%r16, %r0, %r28
	.word 0xb5a8c820  ! 365: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_21:
	setx	0x1d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58860  ! 370: FADDq	dis not found

	.word 0xbda548c0  ! 371: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xbda48840  ! 372: FADDd	faddd	%f18, %f0, %f30
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_22:
	setx	0x1f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_16:
	mov	0x19, %r14
	.word 0xf6f38e60  ! 375: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_14:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_15:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_16:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 383: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_17:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a00520  ! 386: FSQRTs	fsqrt	
	.word 0xb6ac4000  ! 389: ANDNcc_R	andncc 	%r17, %r0, %r27
	.word 0xb5a4c940  ! 392: FMULd	fmuld	%f50, %f0, %f26
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_17:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 395: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_18:
	mov	0x16, %r14
	.word 0xf0db84a0  ! 399: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb4b5e1b4  ! 400: ORNcc_I	orncc 	%r23, 0x01b4, %r26
cpu_intr_1_23:
	setx	0x1e0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbba408a0  ! 405: FSUBs	fsubs	%f16, %f0, %f29
T1_asi_reg_wr_18:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 408: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_24:
	setx	0x1d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 411: FMOVRNZ	dis not found

	.word 0xb32c8000  ! 412: SLL_R	sll 	%r18, %r0, %r25
cpu_intr_1_25:
	setx	0x1e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xba244000  ! 416: SUB_R	sub 	%r17, %r0, %r29
	.word 0xbfa489e0  ! 417: FDIVq	dis not found

	.word 0x8d9460e3  ! 419: WRPR_PSTATE_I	wrpr	%r17, 0x00e3, %pstate
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_19:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 428: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_19:
	mov	0x2f, %r14
	.word 0xf0db89e0  ! 429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb17c6401  ! 432: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xbfa5c860  ! 434: FADDq	dis not found

iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbfa5c840  ! 437: FADDd	faddd	%f54, %f0, %f62
	.word 0xb7a4c8a0  ! 438: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xbdaa0820  ! 439: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbd349000  ! 440: SRLX_R	srlx	%r18, %r0, %r30
	.word 0xb1a80420  ! 442: FMOVRZ	dis not found

iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 35)
	.word 0xbfab0820  ! 447: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_26:
	setx	0x230204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_20:
	mov	0x8, %r14
	.word 0xfcdb8e80  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3ab0820  ! 461: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_27:
	setx	0x21023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_28:
	setx	0x21032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_20:
	mov	0x7, %r14
	.word 0xf8f38e40  ! 466: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_21:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 467: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_22:
	mov	0x5, %r14
	.word 0xf8db8e60  ! 471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_23:
	mov	0x2c, %r14
	.word 0xf4db8400  ! 474: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_29:
	setx	0x20023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aac820  ! 483: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbec44000  ! 485: ADDCcc_R	addccc 	%r17, %r0, %r31
T1_asi_reg_rd_24:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 486: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9a00520  ! 487: FSQRTs	fsqrt	
	.word 0xb5a489e0  ! 489: FDIVq	dis not found

	.word 0xbdaa0820  ! 490: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb3a4c9a0  ! 491: FDIVs	fdivs	%f19, %f0, %f25
cpu_intr_1_30:
	setx	0x230028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_31:
	setx	0x220019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 496: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbcbca1d8  ! 497: XNORcc_I	xnorcc 	%r18, 0x01d8, %r30
	.word 0xb7a488e0  ! 502: FSUBq	dis not found

cpu_intr_1_32:
	setx	0x210231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_33:
	setx	0x230332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44940  ! 509: FMULd	fmuld	%f48, %f0, %f24
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb3ab8820  ! 515: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_34:
	setx	0x21002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_35:
	setx	0x200307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x230331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 523: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb1a84820  ! 526: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 11)
	.word 0xb0354000  ! 531: SUBC_R	orn 	%r21, %r0, %r24
T1_asi_reg_rd_25:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 533: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb60c0000  ! 535: AND_R	and 	%r16, %r0, %r27
cpu_intr_1_37:
	setx	0x1030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb025c000  ! 539: SUB_R	sub 	%r23, %r0, %r24
	.word 0x8195e141  ! 540: WRPR_TPC_I	wrpr	%r23, 0x0141, %tpc
T1_asi_reg_rd_26:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 7)
	.word 0xbba00540  ! 545: FSQRTd	fsqrt	
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 1e)
	.word 0x91956022  ! 547: WRPR_PIL_I	wrpr	%r21, 0x0022, %pil
cpu_intr_1_38:
	setx	0x230337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 551: FMOVRZ	dis not found

T1_asi_reg_rd_27:
	mov	0x1e, %r14
	.word 0xf6db84a0  ! 552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbba98820  ! 555: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a84820  ! 556: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa4820  ! 564: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_39:
	setx	0x20033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_40:
	setx	0x23022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3a5c960  ! 571: FMULq	dis not found

	.word 0xbba80820  ! 573: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbba448c0  ! 575: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb5a589c0  ! 576: FDIVd	fdivd	%f22, %f0, %f26
cpu_intr_1_41:
	setx	0x230115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_42:
	setx	0x200339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5204f  ! 580: ADDCcc_I	addccc 	%r20, 0x004f, %r27
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba549e0  ! 584: FDIVq	dis not found

	.word 0xb5a448c0  ! 585: FSUBd	fsubd	%f48, %f0, %f26
T1_asi_reg_rd_28:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb57d8400  ! 592: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb8bde15a  ! 597: XNORcc_I	xnorcc 	%r23, 0x015a, %r28
cpu_intr_1_43:
	setx	0x20022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_21:
	mov	0xf, %r14
	.word 0xfef384a0  ! 599: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 32)
	.word 0xb42c4000  ! 603: ANDN_R	andn 	%r17, %r0, %r26
	.word 0xbfa00540  ! 608: FSQRTd	fsqrt	
	.word 0xb0b5219e  ! 612: SUBCcc_I	orncc 	%r20, 0x019e, %r24
	.word 0xb3abc820  ! 615: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbda00540  ! 617: FSQRTd	fsqrt	
	.word 0xb7a448a0  ! 618: FSUBs	fsubs	%f17, %f0, %f27
T1_asi_reg_wr_22:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 621: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb2046173  ! 622: ADD_I	add 	%r17, 0x0173, %r25
	.word 0xb1aa0820  ! 625: FMOVA	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_29:
	mov	0x36, %r14
	.word 0xf2db89e0  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbda94820  ! 639: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_23:
	mov	0x2e, %r14
	.word 0xf6f38e60  ! 640: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_30:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 641: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_44:
	setx	0x220108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_24:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 646: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbfa58920  ! 647: FMULs	fmuls	%f22, %f0, %f31
cpu_intr_1_45:
	setx	0x200223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3a81820  ! 654: FMOVRGZ	fmovs	%fcc3, %f0, %f25
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
	.word 0xbda00540  ! 657: FSQRTd	fsqrt	
cpu_intr_1_46:
	setx	0x210309, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_25:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 660: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7a48840  ! 663: FADDd	faddd	%f18, %f0, %f58
T1_asi_reg_wr_26:
	mov	0x31, %r14
	.word 0xf4f384a0  ! 664: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, f)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbba409e0  ! 667: FDIVq	dis not found

	.word 0xb5a588c0  ! 670: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb8b5218e  ! 671: ORNcc_I	orncc 	%r20, 0x018e, %r28
	.word 0xb9a80420  ! 672: FMOVRZ	dis not found

	.word 0xb5a509c0  ! 673: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xb8b40000  ! 675: SUBCcc_R	orncc 	%r16, %r0, %r28
cpu_intr_1_47:
	setx	0x23023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_48:
	setx	0x210021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_49:
	setx	0x230304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c8000  ! 686: SLL_R	sll 	%r18, %r0, %r24
T1_asi_reg_wr_27:
	mov	0x16, %r14
	.word 0xf2f38e60  ! 687: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 689: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba80420  ! 692: FMOVRZ	dis not found

T1_asi_reg_wr_29:
	mov	0x36, %r14
	.word 0xfcf384a0  ! 693: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_50:
	setx	0x210001, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_30:
	mov	0xe, %r14
	.word 0xfef38400  ! 699: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9a58860  ! 700: FADDq	dis not found

cpu_intr_1_51:
	setx	0x230133, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_31:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 703: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_32:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 707: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_31:
	mov	0x2a, %r14
	.word 0xf2db8400  ! 710: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_52:
	setx	0x210214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa8820  ! 713: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_33:
	mov	0x10, %r14
	.word 0xf6f38e60  ! 718: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9a80420  ! 719: FMOVRZ	dis not found

	.word 0xbdaa0820  ! 720: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbb518000  ! 721: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_rd_32:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3a81420  ! 723: FMOVRNZ	dis not found

T1_asi_reg_rd_33:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a90820  ! 726: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb17c8400  ! 730: MOVR_R	movre	%r18, %r0, %r24
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_34:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 732: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_35:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 733: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_53:
	setx	0x210229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9a0  ! 736: FDIVs	fdivs	%f19, %f0, %f25
T1_asi_reg_wr_34:
	mov	0x34, %r14
	.word 0xf8f389e0  ! 738: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfa489c0  ! 739: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xb5aac820  ! 741: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_35:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 743: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_36:
	mov	0x32, %r14
	.word 0xf2db8e40  ! 744: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5aa8820  ! 748: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb8b5c000  ! 749: SUBCcc_R	orncc 	%r23, %r0, %r28
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_36:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 752: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a488c0  ! 755: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb5a50860  ! 757: FADDq	dis not found

iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 26)
	.word 0xb6342074  ! 772: SUBC_I	orn 	%r16, 0x0074, %r27
	.word 0xb0c5c000  ! 775: ADDCcc_R	addccc 	%r23, %r0, %r24
T1_asi_reg_wr_37:
	mov	0x9, %r14
	.word 0xfcf38e80  ! 778: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa80c20  ! 782: FMOVRLZ	dis not found

cpu_intr_1_54:
	setx	0x21002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 785: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb53cf001  ! 787: SRAX_I	srax	%r19, 0x0001, %r26
	.word 0xbfa549e0  ! 789: FDIVq	dis not found

	.word 0xb3ab8820  ! 791: FMOVPOS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_38:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 793: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_55:
	setx	0x210324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a4c8a0  ! 797: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb7a80c20  ! 798: FMOVRLZ	dis not found

	.word 0xb024e1cc  ! 802: SUB_I	sub 	%r19, 0x01cc, %r24
cpu_intr_1_56:
	setx	0x21012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8158000  ! 804: OR_R	or 	%r22, %r0, %r28
	.word 0xb7ab0820  ! 810: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a48840  ! 812: FADDd	faddd	%f18, %f0, %f26
	.word 0xbda00520  ! 815: FSQRTs	fsqrt	
	.word 0xbd2c8000  ! 818: SLL_R	sll 	%r18, %r0, %r30
	.word 0xb1a409a0  ! 819: FDIVs	fdivs	%f16, %f0, %f24
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_57:
	setx	0x220018, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a80820  ! 825: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_37:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 826: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5a84820  ! 827: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbc0d8000  ! 829: AND_R	and 	%r22, %r0, %r30
cpu_intr_1_58:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_39:
	mov	0x23, %r14
	.word 0xfef38400  ! 838: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_59:
	setx	0x21003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda80420  ! 848: FMOVRZ	dis not found

	.word 0xb7a4c8c0  ! 851: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xbda589c0  ! 853: FDIVd	fdivd	%f22, %f0, %f30
	.word 0xb5a48820  ! 854: FADDs	fadds	%f18, %f0, %f26
T1_asi_reg_wr_40:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 857: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_38:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb8a40000  ! 866: SUBcc_R	subcc 	%r16, %r0, %r28
	.word 0xbd2d2001  ! 867: SLL_I	sll 	%r20, 0x0001, %r30
	.word 0xbda8c820  ! 868: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, b)
	.word 0xbda54920  ! 871: FMULs	fmuls	%f21, %f0, %f30
	.word 0xb5aa0820  ! 873: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_39:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 874: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5a98820  ! 875: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbba4c9e0  ! 877: FDIVq	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb7ab0820  ! 879: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb1a40920  ! 880: FMULs	fmuls	%f16, %f0, %f24
	.word 0xbd51c000  ! 881: RDPR_TL	<illegal instruction>
	.word 0xb7a81c20  ! 882: FMOVRGEZ	dis not found

T1_asi_reg_rd_40:
	mov	0x2a, %r14
	.word 0xf4db8e60  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_60:
	setx	0x21030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 890: FMOVRNZ	dis not found

cpu_intr_1_61:
	setx	0x260016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9c0  ! 893: FDIVd	fdivd	%f54, %f0, %f56
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 32)
	.word 0xbe3de17b  ! 899: XNOR_I	xnor 	%r23, 0x017b, %r31
cpu_intr_1_62:
	setx	0x24030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 904: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3508000  ! 905: RDPR_TSTATE	<illegal instruction>
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_41:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 909: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_63:
	setx	0x250026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec5a0e5  ! 914: ADDCcc_I	addccc 	%r22, 0x00e5, %r31
T1_asi_reg_wr_42:
	mov	0x1d, %r14
	.word 0xfaf38400  ! 917: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbfa4c940  ! 918: FMULd	fmuld	%f50, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 38)
	.word 0xb9a90820  ! 922: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_64:
	setx	0x250221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94214a  ! 927: WRPR_PSTATE_I	wrpr	%r16, 0x014a, %pstate
T1_asi_reg_wr_43:
	mov	0x2e, %r14
	.word 0xfaf38e40  ! 928: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda54820  ! 929: FADDs	fadds	%f21, %f0, %f30
T1_asi_reg_wr_44:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 930: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_65:
	setx	0x250310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa40860  ! 934: FADDq	dis not found

iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_45:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 942: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_66:
	setx	0x240024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 948: RDPR_TNPC	<illegal instruction>
	.word 0xb1a88820  ! 952: FMOVLE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_67:
	setx	0x260024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54860  ! 959: FADDq	dis not found

	.word 0xba34204b  ! 961: ORN_I	orn 	%r16, 0x004b, %r29
T1_asi_reg_wr_46:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 962: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1a00540  ! 963: FSQRTd	fsqrt	
	.word 0xbfa8c820  ! 967: FMOVL	fmovs	%fcc1, %f0, %f31
cpu_intr_1_68:
	setx	0x260323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_47:
	mov	0x8, %r14
	.word 0xfcf38400  ! 969: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbba54860  ! 970: FADDq	dis not found

	.word 0xbc354000  ! 973: ORN_R	orn 	%r21, %r0, %r30
	.word 0xb8adc000  ! 975: ANDNcc_R	andncc 	%r23, %r0, %r28
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb7ab4820  ! 977: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb02da198  ! 978: ANDN_I	andn 	%r22, 0x0198, %r24
T1_asi_reg_rd_41:
	mov	0x14, %r14
	.word 0xfadb8400  ! 979: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_wr_48:
	mov	0x2b, %r14
	.word 0xf2f38e80  ! 980: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9a00540  ! 983: FSQRTd	fsqrt	
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0x81946164  ! 986: WRPR_TPC_I	wrpr	%r17, 0x0164, %tpc
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a00020  ! 989: FMOVs	fmovs	%f0, %f28
cpu_intr_1_69:
	setx	0x25001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_42:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_43:
	mov	0x2d, %r14
	.word 0xf2db8e60  ! 997: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0x839521a7  ! 999: WRPR_TNPC_I	wrpr	%r20, 0x01a7, %tnpc
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_70:
	setx	0x27013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3da001  ! 1005: SRA_I	sra 	%r22, 0x0001, %r31
cpu_intr_1_71:
	setx	0x240135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488c0  ! 1012: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xb9aac820  ! 1014: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_72:
	setx	0x260133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_73:
	setx	0x24013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba489e0  ! 1019: FDIVq	dis not found

iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_44:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 1021: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_49:
	mov	0x19, %r14
	.word 0xfcf38e80  ! 1024: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_50:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 1027: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_74:
	setx	0x270203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 1037: FMOVN	fmovs	%fcc1, %f0, %f31
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_45:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 1041: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbbab8820  ! 1046: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_46:
	mov	0x15, %r14
	.word 0xf6db84a0  ! 1047: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb53dc000  ! 1049: SRA_R	sra 	%r23, %r0, %r26
cpu_intr_1_75:
	setx	0x26000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 1052: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda50820  ! 1054: FADDs	fadds	%f20, %f0, %f30
	.word 0xbbabc820  ! 1055: FMOVVC	fmovs	%fcc1, %f0, %f29
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_76:
	setx	0x260023, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_51:
	mov	0x21, %r14
	.word 0xfcf38400  ! 1063: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_77:
	setx	0x260209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_78:
	setx	0x240234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 1068: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_52:
	mov	0x0, %r14
	.word 0xf8f38e40  ! 1071: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_47:
	mov	0x1a, %r14
	.word 0xf0db89e0  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1a00540  ! 1077: FSQRTd	fsqrt	
	.word 0xbba50820  ! 1078: FADDs	fadds	%f20, %f0, %f29
cpu_intr_1_79:
	setx	0x25011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x2a, %r14
	.word 0xfaf38400  ! 1081: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_80:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 1091: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_55:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 1094: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_48:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfa4c860  ! 1096: FADDq	dis not found

iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 18)
	.word 0xb8c44000  ! 1098: ADDCcc_R	addccc 	%r17, %r0, %r28
cpu_intr_1_81:
	setx	0x250332, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_wr_56:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 1102: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb01de028  ! 1107: XOR_I	xor 	%r23, 0x0028, %r24
	.word 0xbe04e139  ! 1110: ADD_I	add 	%r19, 0x0139, %r31
cpu_intr_1_82:
	setx	0x260132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_57:
	mov	0x1d, %r14
	.word 0xfef384a0  ! 1116: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1a00520  ! 1123: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a409c0  ! 1137: FDIVd	fdivd	%f16, %f0, %f24
T1_asi_reg_wr_58:
	mov	0x10, %r14
	.word 0xf8f38e60  ! 1139: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_83:
	setx	0x27021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 1144: FMOVRNZ	dis not found

	.word 0xb9641800  ! 1146: MOVcc_R	<illegal instruction>
	.word 0xb3ab4820  ! 1150: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb3a5c8c0  ! 1152: FSUBd	fsubd	%f54, %f0, %f56
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a00560  ! 1155: FSQRTq	fsqrt	
	.word 0xb7a00040  ! 1159: FMOVd	fmovd	%f0, %f58
	.word 0xbba5c840  ! 1161: FADDd	faddd	%f54, %f0, %f60
cpu_intr_1_84:
	setx	0x260102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_49:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 1166: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_59:
	mov	0x33, %r14
	.word 0xfef38e40  ! 1167: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa50920  ! 1168: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb7a58840  ! 1170: FADDd	faddd	%f22, %f0, %f58
cpu_intr_1_85:
	setx	0x270325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a508c0  ! 1181: FSUBd	fsubd	%f20, %f0, %f58
cpu_intr_1_86:
	setx	0x270214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9e0  ! 1183: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_87:
	setx	0x270229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 1193: FMOVs	fmovs	%f0, %f24
T1_asi_reg_wr_60:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 1194: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbda8c820  ! 1199: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbda548c0  ! 1200: FSUBd	fsubd	%f52, %f0, %f30
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_61:
	mov	0x13, %r14
	.word 0xf2f38e80  ! 1210: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a4c860  ! 1214: FADDq	dis not found

	.word 0xb23520ba  ! 1215: SUBC_I	orn 	%r20, 0x00ba, %r25
T1_asi_reg_rd_50:
	mov	0x10, %r14
	.word 0xf2db8e40  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_88:
	setx	0x260121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_89:
	setx	0x240224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d4000  ! 1220: SRA_R	sra 	%r21, %r0, %r31
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, b)
	.word 0xbdaa8820  ! 1225: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x8f902001  ! 1226: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T1_asi_reg_rd_51:
	mov	0x1, %r14
	.word 0xfedb8e80  ! 1228: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb3ab8820  ! 1232: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa489a0  ! 1233: FDIVs	fdivs	%f18, %f0, %f31
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 15)
	.word 0xb4048000  ! 1237: ADD_R	add 	%r18, %r0, %r26
	.word 0xb9a9c820  ! 1238: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_52:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_62:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 1247: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_63:
	mov	0xa, %r14
	.word 0xfef38400  ! 1249: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1a00040  ! 1251: FMOVd	fmovd	%f0, %f24
	.word 0xb3a509e0  ! 1253: FDIVq	dis not found

T1_asi_reg_rd_53:
	mov	0x29, %r14
	.word 0xf4db8e60  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9504000  ! 1256: RDPR_TNPC	<illegal instruction>
cpu_intr_1_90:
	setx	0x250002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_91:
	setx	0x26021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 1261: FMOVd	fmovd	%f0, %f62
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa90820  ! 1264: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbabc8000  ! 1265: XNORcc_R	xnorcc 	%r18, %r0, %r29
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb42c6112  ! 1268: ANDN_I	andn 	%r17, 0x0112, %r26
T1_asi_reg_wr_64:
	mov	0x2c, %r14
	.word 0xf0f38400  ! 1269: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_92:
	setx	0x270214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a44960  ! 1279: FMULq	dis not found

T1_asi_reg_rd_54:
	mov	0x14, %r14
	.word 0xfedb84a0  ! 1280: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_93:
	setx	0x260319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_65:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 1285: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3348000  ! 1287: SRL_R	srl 	%r18, %r0, %r25
cpu_intr_1_94:
	setx	0x27023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb844e096  ! 1291: ADDC_I	addc 	%r19, 0x0096, %r28
T1_asi_reg_rd_55:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_56:
	mov	0x2c, %r14
	.word 0xfadb8e60  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_95:
	setx	0x270334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, b)
	.word 0xb5a4c840  ! 1303: FADDd	faddd	%f50, %f0, %f26
	.word 0xb5a00540  ! 1304: FSQRTd	fsqrt	
T1_asi_reg_wr_66:
	mov	0xa, %r14
	.word 0xfef38400  ! 1307: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb13ce001  ! 1308: SRA_I	sra 	%r19, 0x0001, %r24
T1_asi_reg_rd_57:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 1311: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbba408c0  ! 1312: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xbf510000  ! 1313: RDPR_TICK	<illegal instruction>
	.word 0xb7a00540  ! 1314: FSQRTd	fsqrt	
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_96:
	setx	0x270135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 1320: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_59:
	mov	0x38, %r14
	.word 0xfcdb8e80  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_97:
	setx	0x24012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449a0  ! 1323: FDIVs	fdivs	%f17, %f0, %f31
cpu_intr_1_98:
	setx	0x270332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_60:
	mov	0x2c, %r14
	.word 0xf4db8e60  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_rd_61:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 1329: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb6b54000  ! 1332: SUBCcc_R	orncc 	%r21, %r0, %r27
T1_asi_reg_rd_62:
	mov	0x15, %r14
	.word 0xf4db8e60  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_99:
	setx	0x240327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba35616d  ! 1340: ORN_I	orn 	%r21, 0x016d, %r29
	.word 0xb1a408e0  ! 1341: FSUBq	dis not found

	.word 0xb9a5c9c0  ! 1343: FDIVd	fdivd	%f54, %f0, %f28
T1_asi_reg_wr_67:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 1345: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbdaa4820  ! 1349: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbba8c820  ! 1350: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_100:
	setx	0x25033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_101:
	setx	0x27033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 39)
	.word 0xb4850000  ! 1358: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xbbaac820  ! 1359: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_102:
	setx	0x2a0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_63:
	mov	0x2b, %r14
	.word 0xf2db8400  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 10)
	.word 0xb17c8400  ! 1372: MOVR_R	movre	%r18, %r0, %r24
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_103:
	setx	0x2b031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_68:
	mov	0x17, %r14
	.word 0xfcf389e0  ! 1375: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_104:
	setx	0x2b0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_69:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 1377: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_70:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1379: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_71:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 1380: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_105:
	setx	0x2b0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_72:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 1384: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_73:
	mov	0x22, %r14
	.word 0xfcf38400  ! 1386: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_64:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_106:
	setx	0x2b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbdab4820  ! 1392: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_74:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 1397: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_107:
	setx	0x2a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_65:
	mov	0x35, %r14
	.word 0xf4db89e0  ! 1408: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_66:
	mov	0x1f, %r14
	.word 0xf4db8400  ! 1418: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7a58940  ! 1419: FMULd	fmuld	%f22, %f0, %f58
	.word 0xbfa409a0  ! 1422: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xbe356121  ! 1423: SUBC_I	orn 	%r21, 0x0121, %r31
cpu_intr_1_108:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_75:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 1425: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1a4c9c0  ! 1426: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xbe45c000  ! 1428: ADDC_R	addc 	%r23, %r0, %r31
T1_asi_reg_wr_76:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 1431: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_67:
	mov	0x1f, %r14
	.word 0xf2db89e0  ! 1433: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_68:
	mov	0xf, %r14
	.word 0xfedb8e80  ! 1434: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb77d0400  ! 1435: MOVR_R	movre	%r20, %r0, %r27
	.word 0xbba588c0  ! 1436: FSUBd	fsubd	%f22, %f0, %f60
T1_asi_reg_rd_69:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb951c000  ! 1438: RDPR_TL	<illegal instruction>
cpu_intr_1_109:
	setx	0x2a0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_70:
	mov	0x5, %r14
	.word 0xf6db8e80  ! 1447: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a548c0  ! 1449: FSUBd	fsubd	%f52, %f0, %f58
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_110:
	setx	0x2b0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_77:
	mov	0x27, %r14
	.word 0xfef389e0  ! 1464: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb93d7001  ! 1468: SRAX_I	srax	%r21, 0x0001, %r28
	.word 0xb414c000  ! 1475: OR_R	or 	%r19, %r0, %r26
	.word 0xb9a50920  ! 1476: FMULs	fmuls	%f20, %f0, %f28
T1_asi_reg_wr_78:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1477: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa9c820  ! 1478: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_71:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 1481: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a5c8e0  ! 1482: FSUBq	dis not found

T1_asi_reg_wr_79:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1483: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7a80820  ! 1492: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00040  ! 1494: FMOVd	fmovd	%f0, %f28
cpu_intr_1_111:
	setx	0x280016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44840  ! 1498: FADDd	faddd	%f48, %f0, %f62
T1_asi_reg_rd_72:
	mov	0x26, %r14
	.word 0xf2db89e0  ! 1499: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9a58960  ! 1500: FMULq	dis not found

T1_asi_reg_rd_73:
	mov	0x2, %r14
	.word 0xf8db8e60  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, b)
	.word 0xb7ab0820  ! 1511: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_112:
	setx	0x290230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_113:
	setx	0x2a0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 1515: FMOVRGEZ	dis not found

T1_asi_reg_wr_80:
	mov	0xa, %r14
	.word 0xfef38e40  ! 1517: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb17ce401  ! 1520: MOVR_I	movre	%r19, 0x1, %r24
	.word 0xbfa5c920  ! 1521: FMULs	fmuls	%f23, %f0, %f31
	.word 0xb5a588e0  ! 1523: FSUBq	dis not found

	.word 0xb1a4c8c0  ! 1524: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb7a00520  ! 1526: FSQRTs	fsqrt	
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 2d)
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_114:
	setx	0x290030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_115:
	setx	0x2a0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_116:
	setx	0x29023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_117:
	setx	0x2a0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 1536: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 21)
	.word 0xb2952155  ! 1539: ORcc_I	orcc 	%r20, 0x0155, %r25
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_118:
	setx	0x290135, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_74:
	mov	0x6, %r14
	.word 0xf8db8e80  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7ab8820  ! 1553: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1556: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_82:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 1557: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb5a00020  ! 1562: FMOVs	fmovs	%f0, %f26
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb89dc000  ! 1567: XORcc_R	xorcc 	%r23, %r0, %r28
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 7)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb7a589c0  ! 1577: FDIVd	fdivd	%f22, %f0, %f58
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a00540  ! 1579: FSQRTd	fsqrt	
cpu_intr_1_119:
	setx	0x29011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40840  ! 1581: FADDd	faddd	%f16, %f0, %f28
cpu_intr_1_120:
	setx	0x2b0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73c8000  ! 1583: SRA_R	sra 	%r18, %r0, %r27
cpu_intr_1_121:
	setx	0x29010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_75:
	mov	0x24, %r14
	.word 0xf8db84a0  ! 1586: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb4b40000  ! 1588: ORNcc_R	orncc 	%r16, %r0, %r26
T1_asi_reg_rd_76:
	mov	0xb, %r14
	.word 0xfcdb84a0  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_77:
	mov	0x27, %r14
	.word 0xf4db8400  ! 1592: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_83:
	mov	0xe, %r14
	.word 0xfaf38e40  ! 1595: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa54860  ! 1597: FADDq	dis not found

	.word 0xb5ab4820  ! 1598: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a40860  ! 1600: FADDq	dis not found

	.word 0xb5ab8820  ! 1601: FMOVPOS	fmovs	%fcc1, %f0, %f26
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 22)
	.word 0xbdaa0820  ! 1605: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_84:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 1609: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 24)
	.word 0xbba00540  ! 1613: FSQRTd	fsqrt	
	.word 0xbdab0820  ! 1617: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 13)
	lda	[%r19 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_122:
	setx	0x2a0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbe058000  ! 1632: ADD_R	add 	%r22, %r0, %r31
	.word 0xb7a00040  ! 1634: FMOVd	fmovd	%f0, %f58
	.word 0xbdab0820  ! 1635: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a508c0  ! 1636: FSUBd	fsubd	%f20, %f0, %f24
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3a50960  ! 1648: FMULq	dis not found

	.word 0xb7643801  ! 1651: MOVcc_I	<illegal instruction>
T1_asi_reg_rd_78:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 1653: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a81420  ! 1654: FMOVRNZ	dis not found

cpu_intr_1_123:
	setx	0x29022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 1658: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbba408c0  ! 1660: FSUBd	fsubd	%f16, %f0, %f60
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_79:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbba40920  ! 1664: FMULs	fmuls	%f16, %f0, %f29
cpu_intr_1_124:
	setx	0x2b001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_80:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9a88820  ! 1670: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a81820  ! 1675: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb635a0f4  ! 1676: SUBC_I	orn 	%r22, 0x00f4, %r27
	.word 0xb5a00040  ! 1677: FMOVd	fmovd	%f0, %f26
	.word 0xb5a80820  ! 1678: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_125:
	setx	0x2b0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 1680: FMOVRLZ	dis not found

T1_asi_reg_wr_85:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 1681: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a80420  ! 1684: FMOVRZ	dis not found

	.word 0xbfa00540  ! 1685: FSQRTd	fsqrt	
	.word 0xbfaa4820  ! 1687: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_86:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 1695: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbdab8820  ! 1696: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbab4e0ac  ! 1698: ORNcc_I	orncc 	%r19, 0x00ac, %r29
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb1a84820  ! 1706: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_81:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa00560  ! 1710: FSQRTq	fsqrt	
cpu_intr_1_126:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3d8000  ! 1712: XNOR_R	xnor 	%r22, %r0, %r30
T1_asi_reg_rd_82:
	mov	0x19, %r14
	.word 0xfedb89e0  ! 1714: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1a80420  ! 1715: FMOVRZ	dis not found

	.word 0xbda8c820  ! 1720: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbb3c4000  ! 1722: SRA_R	sra 	%r17, %r0, %r29
T1_asi_reg_wr_87:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 1723: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba409c0  ! 1724: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb5a8c820  ! 1726: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb5a4c9e0  ! 1727: FDIVq	dis not found

	.word 0xbda88820  ! 1728: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb5a4c860  ! 1733: FADDq	dis not found

iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_127:
	setx	0x2b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_83:
	mov	0x18, %r14
	.word 0xf6db8e60  ! 1746: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_128:
	setx	0x2a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b44000  ! 1750: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xbda80420  ! 1754: FMOVRZ	dis not found

	.word 0xb5a48960  ! 1755: FMULq	dis not found

	.word 0xb6c42076  ! 1758: ADDCcc_I	addccc 	%r16, 0x0076, %r27
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_88:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 1767: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_129:
	setx	0x29010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_84:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 1773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_89:
	mov	0x27, %r14
	.word 0xf8f38400  ! 1776: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3aa4820  ! 1777: FMOVNE	fmovs	%fcc1, %f0, %f25
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 21)
	.word 0xbabce07c  ! 1781: XNORcc_I	xnorcc 	%r19, 0x007c, %r29
	.word 0xb3ab0820  ! 1782: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_130:
	setx	0x280025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 1787: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbd3d0000  ! 1788: SRA_R	sra 	%r20, %r0, %r30
T1_asi_reg_wr_90:
	mov	0x26, %r14
	.word 0xfef38e40  ! 1790: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_85:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 1792: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb4b5c000  ! 1793: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xbda488c0  ! 1794: FSUBd	fsubd	%f18, %f0, %f30
T1_asi_reg_wr_91:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 1796: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 35)
	.word 0xbe9de0cb  ! 1799: XORcc_I	xorcc 	%r23, 0x00cb, %r31
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a508c0  ! 1805: FSUBd	fsubd	%f20, %f0, %f24
T1_asi_reg_wr_92:
	mov	0x24, %r14
	.word 0xf2f38e60  ! 1806: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb13c0000  ! 1807: SRA_R	sra 	%r16, %r0, %r24
	.word 0xb52d0000  ! 1809: SLL_R	sll 	%r20, %r0, %r26
T1_asi_reg_rd_86:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 1810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_93:
	mov	0x22, %r14
	.word 0xfcf38e80  ! 1814: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbda81c20  ! 1816: FMOVRGEZ	dis not found

	.word 0xb7abc820  ! 1819: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa4c8e0  ! 1821: FSUBq	dis not found

T1_asi_reg_wr_94:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 1825: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbda58860  ! 1826: FADDq	dis not found

T1_asi_reg_rd_87:
	mov	0x33, %r14
	.word 0xf4db89e0  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 1)
	.word 0xbfa80c20  ! 1832: FMOVRLZ	dis not found

	.word 0xb9a488a0  ! 1833: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xb5a5c820  ! 1836: FADDs	fadds	%f23, %f0, %f26
	.word 0xbc3d8000  ! 1837: XNOR_R	xnor 	%r22, %r0, %r30
T1_asi_reg_rd_88:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a81c20  ! 1841: FMOVRGEZ	dis not found

	.word 0xb1a58860  ! 1844: FADDq	dis not found

T1_asi_reg_rd_89:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 1847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a4c9a0  ! 1849: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb3aac820  ! 1851: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_131:
	setx	0x2e033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 1858: FMOVs	fmovs	%f0, %f31
T1_asi_reg_rd_90:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 1861: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_132:
	setx	0x2d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8c0  ! 1864: FSUBd	fsubd	%f54, %f0, %f58
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_95:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 1878: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba54860  ! 1881: FADDq	dis not found

	.word 0xbfa81c20  ! 1882: FMOVRGEZ	dis not found

	.word 0xbba81420  ! 1884: FMOVRNZ	dis not found

cpu_intr_1_133:
	setx	0x2c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 37)
	.word 0xb9a409c0  ! 1903: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb3a00020  ! 1905: FMOVs	fmovs	%f0, %f25
cpu_intr_1_134:
	setx	0x2c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_135:
	setx	0x2c0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 1911: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00520  ! 1912: FSQRTs	fsqrt	
cpu_intr_1_136:
	setx	0x2c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
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
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 27)
	.word 0xbba90820  ! 1932: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab4820  ! 1933: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb33db001  ! 1934: SRAX_I	srax	%r22, 0x0001, %r25
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_137:
	setx	0x2c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd359000  ! 1939: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xbda58840  ! 1941: FADDd	faddd	%f22, %f0, %f30
cpu_intr_1_138:
	setx	0x2f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 1945: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1a54840  ! 1948: FADDd	faddd	%f52, %f0, %f24
	.word 0xb7a00520  ! 1949: FSQRTs	fsqrt	
T1_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1951: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, c)
	.word 0xbda80420  ! 1957: FMOVRZ	dis not found

	.word 0xbba81c20  ! 1959: FMOVRGEZ	dis not found

	.word 0xb7a58960  ! 1961: FMULq	dis not found

	.word 0xb3a50960  ! 1963: FMULq	dis not found

iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_91:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_97:
	mov	0x1f, %r14
	.word 0xf6f38e60  ! 1972: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb7abc820  ! 1973: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb5520000  ! 1974: RDPR_PIL	<illegal instruction>
	.word 0xb5643801  ! 1976: MOVcc_I	<illegal instruction>
	.word 0xbba81820  ! 1978: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_98:
	mov	0x26, %r14
	.word 0xf0f389e0  ! 1985: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbbab4820  ! 1990: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_99:
	mov	0x2e, %r14
	.word 0xf2f384a0  ! 1993: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5a5c8a0  ! 1994: FSUBs	fsubs	%f23, %f0, %f26
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_92:
	mov	0x26, %r14
	.word 0xf2db84a0  ! 1997: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_wr_100:
	mov	0x12, %r14
	.word 0xfaf38e80  ! 1998: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 2)
	.word 0xbbab8820  ! 2004: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_139:
	setx	0x2f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_140:
	setx	0x2d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 2027: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a80820  ! 2028: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbda509c0  ! 2029: FDIVd	fdivd	%f20, %f0, %f30
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_rd_93:
	mov	0x1d, %r14
	.word 0xf4db8e60  ! 2033: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb8c561de  ! 2038: ADDCcc_I	addccc 	%r21, 0x01de, %r28
	.word 0xb5a80820  ! 2039: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_101:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 2040: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb9aa0820  ! 2041: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb41de159  ! 2044: XOR_I	xor 	%r23, 0x0159, %r26
cpu_intr_1_141:
	setx	0x2e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2cb001  ! 2054: SLLX_I	sllx	%r18, 0x0001, %r29
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_142:
	setx	0x2c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40840  ! 2058: FADDd	faddd	%f16, %f0, %f56
	.word 0xb57ca401  ! 2061: MOVR_I	movre	%r18, 0x1, %r26
T1_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 2062: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbb2d2001  ! 2063: SLL_I	sll 	%r20, 0x0001, %r29
	.word 0xb9a88820  ! 2065: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80c20  ! 2066: FMOVRLZ	dis not found

	.word 0xb3a81420  ! 2070: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_143:
	setx	0x2c0018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x25, %r14
	.word 0xf8db8e60  ! 2073: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_95:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 2075: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9a4c860  ! 2076: FADDq	dis not found

	.word 0xb3a88820  ! 2078: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xba1d8000  ! 2081: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb7a80c20  ! 2083: FMOVRLZ	dis not found

	.word 0xb0356095  ! 2084: SUBC_I	orn 	%r21, 0x0095, %r24
cpu_intr_1_144:
	setx	0x2e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 2086: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb215a1bc  ! 2087: OR_I	or 	%r22, 0x01bc, %r25
	.word 0xbeb4a069  ! 2089: ORNcc_I	orncc 	%r18, 0x0069, %r31
	.word 0xb9ab0820  ! 2090: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_103:
	mov	0xb, %r14
	.word 0xfef38400  ! 2096: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_145:
	setx	0x2c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 2101: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_96:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_104:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 2104: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_97:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_146:
	setx	0x2f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb0244000  ! 2114: SUB_R	sub 	%r17, %r0, %r24
cpu_intr_1_147:
	setx	0x2c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50860  ! 2117: FADDq	dis not found

cpu_intr_1_148:
	setx	0x2d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 2124: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_98:
	mov	0xe, %r14
	.word 0xfcdb8e80  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb1a8c820  ! 2131: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 2137: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_100:
	mov	0x29, %r14
	.word 0xf0db8e80  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbda8c820  ! 2139: FMOVL	fmovs	%fcc1, %f0, %f30
cpu_intr_1_149:
	setx	0x2e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba54840  ! 2145: FADDd	faddd	%f52, %f0, %f60
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb12c8000  ! 2147: SLL_R	sll 	%r18, %r0, %r24
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_150:
	setx	0x2e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_151:
	setx	0x2d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba00020  ! 2155: FMOVs	fmovs	%f0, %f29
	.word 0xb9a81420  ! 2156: FMOVRNZ	dis not found

	.word 0xbda54840  ! 2157: FADDd	faddd	%f52, %f0, %f30
	.word 0xb935a001  ! 2160: SRL_I	srl 	%r22, 0x0001, %r28
	.word 0xb1a54940  ! 2164: FMULd	fmuld	%f52, %f0, %f24
T1_asi_reg_rd_101:
	mov	0x6, %r14
	.word 0xf2db8e60  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbba548a0  ! 2166: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xb7a5c9a0  ! 2168: FDIVs	fdivs	%f23, %f0, %f27
cpu_intr_1_152:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 2172: FMOVRZ	dis not found

cpu_intr_1_153:
	setx	0x2d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_102:
	mov	0x37, %r14
	.word 0xf0db8e60  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_154:
	setx	0x2c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 2183: FMOVs	fmovs	%f0, %f24
cpu_intr_1_155:
	setx	0x2e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c840  ! 2187: FADDd	faddd	%f54, %f0, %f28
T1_asi_reg_wr_105:
	mov	0x7, %r14
	.word 0xf6f38e80  ! 2189: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a00540  ! 2198: FSQRTd	fsqrt	
cpu_intr_1_156:
	setx	0x2c021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50860  ! 2200: FADDq	dis not found

	.word 0xb9a81c20  ! 2203: FMOVRGEZ	dis not found

	.word 0xb1a4c860  ! 2205: FADDq	dis not found

	.word 0xb7a81c20  ! 2210: FMOVRGEZ	dis not found

	.word 0xb7a409a0  ! 2211: FDIVs	fdivs	%f16, %f0, %f27
cpu_intr_1_157:
	setx	0x2c0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 2213: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbba50960  ! 2214: FMULq	dis not found

	.word 0xb5a4c8a0  ! 2220: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb1a00520  ! 2221: FSQRTs	fsqrt	
	.word 0xb7abc820  ! 2222: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a8c820  ! 2224: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_103:
	mov	0x38, %r14
	.word 0xfedb84a0  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 21)
	.word 0xbdab0820  ! 2235: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_158:
	setx	0x2f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 2241: RDPR_TPC	<illegal instruction>
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_159:
	setx	0x2e0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4a03b  ! 2248: ORNcc_I	orncc 	%r18, 0x003b, %r27
T1_asi_reg_wr_106:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 2249: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1a00540  ! 2252: FSQRTd	fsqrt	
T1_asi_reg_wr_107:
	mov	0x2f, %r14
	.word 0xfaf38e40  ! 2255: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1a489e0  ! 2261: FDIVq	dis not found

iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbdaa4820  ! 2266: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa44960  ! 2268: FMULq	dis not found

	.word 0xb9a00540  ! 2271: FSQRTd	fsqrt	
	.word 0xba0ca037  ! 2275: AND_I	and 	%r18, 0x0037, %r29
	.word 0xbba54860  ! 2277: FADDq	dis not found

	.word 0xbba98820  ! 2281: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, b)
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a88820  ! 2287: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_104:
	mov	0x34, %r14
	.word 0xfcdb8e80  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbfa48840  ! 2290: FADDd	faddd	%f18, %f0, %f62
	.word 0xbba50860  ! 2293: FADDq	dis not found

	.word 0xb7a50940  ! 2294: FMULd	fmuld	%f20, %f0, %f58
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda80820  ! 2296: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb9a4c8e0  ! 2297: FSUBq	dis not found

T1_asi_reg_wr_108:
	mov	0x38, %r14
	.word 0xfaf38e80  ! 2300: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb8b58000  ! 2302: ORNcc_R	orncc 	%r22, %r0, %r28
	.word 0xb1a48840  ! 2304: FADDd	faddd	%f18, %f0, %f24
T1_asi_reg_wr_109:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 2309: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_160:
	setx	0x33020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb40000  ! 2315: ORNcc_R	orncc 	%r16, %r0, %r30
T1_asi_reg_wr_110:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 2320: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5a00520  ! 2322: FSQRTs	fsqrt	
	.word 0xb7a5c8e0  ! 2325: FSUBq	dis not found

	.word 0xbba80c20  ! 2326: FMOVRLZ	dis not found

	.word 0xbba409a0  ! 2328: FDIVs	fdivs	%f16, %f0, %f29
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_111:
	mov	0x27, %r14
	.word 0xf4f384a0  ! 2343: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_161:
	setx	0x30012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 2347: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbda9c820  ! 2350: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_105:
	mov	0x24, %r14
	.word 0xf4db84a0  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a8c820  ! 2353: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3a589c0  ! 2354: FDIVd	fdivd	%f22, %f0, %f56
	.word 0xbfa94820  ! 2356: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbba80c20  ! 2359: FMOVRLZ	dis not found

	.word 0xbab5c000  ! 2363: SUBCcc_R	orncc 	%r23, %r0, %r29
cpu_intr_1_162:
	setx	0x330118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4e06b  ! 2371: SUBCcc_I	orncc 	%r19, 0x006b, %r27
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda448a0  ! 2376: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb5a54820  ! 2379: FADDs	fadds	%f21, %f0, %f26
	.word 0xb3a40920  ! 2381: FMULs	fmuls	%f16, %f0, %f25
T1_asi_reg_rd_106:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 2383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3a9c820  ! 2387: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_112:
	mov	0x34, %r14
	.word 0xf0f389e0  ! 2388: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_163:
	setx	0x320222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c960  ! 2395: FMULq	dis not found

	.word 0xbb3d9000  ! 2396: SRAX_R	srax	%r22, %r0, %r29
T1_asi_reg_wr_113:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 2399: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbba449a0  ! 2404: FDIVs	fdivs	%f17, %f0, %f29
T1_asi_reg_wr_114:
	mov	0x36, %r14
	.word 0xfcf38e60  ! 2406: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbba548e0  ! 2408: FSUBq	dis not found

cpu_intr_1_164:
	setx	0x330304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_165:
	setx	0x32022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_115:
	mov	0x31, %r14
	.word 0xf8f384a0  ! 2417: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5a94820  ! 2419: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb5aa0820  ! 2423: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbfa98820  ! 2425: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_116:
	mov	0x2a, %r14
	.word 0xfaf38e80  ! 2426: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a448a0  ! 2430: FSUBs	fsubs	%f17, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1aa0820  ! 2441: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_117:
	mov	0x0, %r14
	.word 0xfcf389e0  ! 2445: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 2d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba4c8a0  ! 2448: FSUBs	fsubs	%f19, %f0, %f29
T1_asi_reg_wr_118:
	mov	0x29, %r14
	.word 0xfcf38400  ! 2449: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7a81c20  ! 2452: FMOVRGEZ	dis not found

	.word 0xb3a00560  ! 2453: FSQRTq	fsqrt	
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa58960  ! 2456: FMULq	dis not found

	.word 0x9195a007  ! 2458: WRPR_PIL_I	wrpr	%r22, 0x0007, %pil
T1_asi_reg_rd_107:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2463: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9ab8820  ! 2464: FMOVPOS	fmovs	%fcc1, %f0, %f28
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb9a80820  ! 2467: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbfab0820  ! 2470: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbba00540  ! 2471: FSQRTd	fsqrt	
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_166:
	setx	0x32032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, b)
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_167:
	setx	0x320238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9c0  ! 2495: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xbfa548e0  ! 2497: FSUBq	dis not found

iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_119:
	mov	0x0, %r14
	.word 0xf0f38400  ! 2501: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_168:
	setx	0x320000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c2001  ! 2506: SRA_I	sra 	%r16, 0x0001, %r31
	.word 0xb7a54940  ! 2507: FMULd	fmuld	%f52, %f0, %f58
	.word 0xbfa98820  ! 2508: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfaa0820  ! 2509: FMOVA	fmovs	%fcc1, %f0, %f31
cpu_intr_1_169:
	setx	0x320212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 2513: FMOVd	fmovd	%f0, %f28
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 35)
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_170:
	setx	0x30001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 2522: FMOVCS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_120:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 2523: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_121:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 2524: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_171:
	setx	0x310024, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_122:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 2526: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 35)
	.word 0xb9aa8820  ! 2529: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbba50960  ! 2532: FMULq	dis not found

iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_123:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 2536: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_172:
	setx	0x320219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 2539: FMOVRLZ	dis not found

	.word 0xb3abc820  ! 2541: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbe356184  ! 2543: SUBC_I	orn 	%r21, 0x0184, %r31
cpu_intr_1_173:
	setx	0x30012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 2551: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb9a448a0  ! 2553: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb7a44960  ! 2554: FMULq	dis not found

cpu_intr_1_174:
	setx	0x320331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 2559: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00540  ! 2561: FSQRTd	fsqrt	
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbfa8c820  ! 2571: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_175:
	setx	0x330134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 2581: FSQRTq	fsqrt	
T1_asi_reg_wr_124:
	mov	0x12, %r14
	.word 0xf6f389e0  ! 2583: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbba4c8c0  ! 2585: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb3a00020  ! 2588: FMOVs	fmovs	%f0, %f25
	.word 0xb3a81c20  ! 2589: FMOVRGEZ	dis not found

cpu_intr_1_176:
	setx	0x32021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x310332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5e0f9  ! 2597: SUBCcc_I	orncc 	%r23, 0x00f9, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_125:
	mov	0x2d, %r14
	.word 0xf0f38e80  ! 2604: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9a00560  ! 2605: FSQRTq	fsqrt	
	.word 0xb3a549c0  ! 2608: FDIVd	fdivd	%f52, %f0, %f56
cpu_intr_1_178:
	setx	0x330129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a509e0  ! 2610: FDIVq	dis not found

iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_108:
	mov	0x34, %r14
	.word 0xfadb8400  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb0c4611a  ! 2615: ADDCcc_I	addccc 	%r17, 0x011a, %r24
cpu_intr_1_179:
	setx	0x330321, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_109:
	mov	0x1, %r14
	.word 0xfedb8e80  ! 2619: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9a5c8c0  ! 2624: FSUBd	fsubd	%f54, %f0, %f28
cpu_intr_1_180:
	setx	0x300307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_181:
	setx	0x320334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_110:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_182:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02c0000  ! 2633: ANDN_R	andn 	%r16, %r0, %r24
T1_asi_reg_wr_126:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 2634: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7ab8820  ! 2640: FMOVPOS	fmovs	%fcc1, %f0, %f27
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb9a44940  ! 2644: FMULd	fmuld	%f48, %f0, %f28
T1_asi_reg_rd_111:
	mov	0x1d, %r14
	.word 0xf0db8e80  ! 2647: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a48920  ! 2652: FMULs	fmuls	%f18, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_183:
	setx	0x320325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_184:
	setx	0x320231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 2662: FSQRTq	fsqrt	
cpu_intr_1_185:
	setx	0x320109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_186:
	setx	0x330107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 2669: FMOVRLZ	dis not found

T1_asi_reg_wr_127:
	mov	0x4, %r14
	.word 0xf0f38e60  ! 2672: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5ab0820  ! 2675: FMOVGU	fmovs	%fcc1, %f0, %f26
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 32)
	.word 0xb13d0000  ! 2679: SRA_R	sra 	%r20, %r0, %r24
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_128:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 2688: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc0c4000  ! 2690: AND_R	and 	%r17, %r0, %r30
	.word 0xbbab8820  ! 2692: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbda81c20  ! 2694: FMOVRGEZ	dis not found

	.word 0xb284e0e0  ! 2695: ADDcc_I	addcc 	%r19, 0x00e0, %r25
T1_asi_reg_wr_129:
	mov	0x30, %r14
	.word 0xfef38e60  ! 2698: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xba0d60b9  ! 2700: AND_I	and 	%r21, 0x00b9, %r29
T1_asi_reg_wr_130:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 2701: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_112:
	mov	0x2c, %r14
	.word 0xf4db89e0  ! 2703: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7a4c960  ! 2705: FMULq	dis not found

T1_asi_reg_wr_131:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2706: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_132:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 2707: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbb480000  ! 2708: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
T1_asi_reg_rd_113:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 2709: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_114:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 2710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_115:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 2711: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb5a5c920  ! 2713: FMULs	fmuls	%f23, %f0, %f26
	.word 0xb7a54840  ! 2714: FADDd	faddd	%f52, %f0, %f58
cpu_intr_1_187:
	setx	0x300021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, d)
	.word 0xbba588e0  ! 2725: FSUBq	dis not found

	.word 0xb424c000  ! 2726: SUB_R	sub 	%r19, %r0, %r26
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_133:
	mov	0x2b, %r14
	.word 0xfef38400  ! 2728: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_wr_134:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 2731: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_188:
	setx	0x35011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_135:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 2736: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbc856056  ! 2737: ADDcc_I	addcc 	%r21, 0x0056, %r30
	.word 0xb42ca046  ! 2738: ANDN_I	andn 	%r18, 0x0046, %r26
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_189:
	setx	0x35022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbba00040  ! 2743: FMOVd	fmovd	%f0, %f60
cpu_intr_1_190:
	setx	0x34030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28ce1d1  ! 2747: ANDcc_I	andcc 	%r19, 0x01d1, %r25
cpu_intr_1_191:
	setx	0x370111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 2752: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_136:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 2753: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xba95604f  ! 2756: ORcc_I	orcc 	%r21, 0x004f, %r29
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, c)
	.word 0xbba00040  ! 2759: FMOVd	fmovd	%f0, %f60
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3a90820  ! 2761: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 1d)
	.word 0xba45e1af  ! 2763: ADDC_I	addc 	%r23, 0x01af, %r29
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_192:
	setx	0x370116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34f001  ! 2768: SRLX_I	srlx	%r19, 0x0001, %r31
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe1d0000  ! 2771: XOR_R	xor 	%r20, %r0, %r31
cpu_intr_1_193:
	setx	0x350033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2c4000  ! 2779: ANDN_R	andn 	%r17, %r0, %r30
	.word 0xb1a58860  ! 2785: FADDq	dis not found

cpu_intr_1_194:
	setx	0x36020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_195:
	setx	0x37002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54860  ! 2793: FADDq	dis not found

	.word 0xbd2db001  ! 2797: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xb3ab8820  ! 2800: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbfab0820  ! 2802: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa8820  ! 2803: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb415e0fa  ! 2805: OR_I	or 	%r23, 0x00fa, %r26
	.word 0xb3aa8820  ! 2807: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_137:
	mov	0x6, %r14
	.word 0xf6f389e0  ! 2809: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbba58840  ! 2812: FADDd	faddd	%f22, %f0, %f60
T1_asi_reg_wr_138:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 2813: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb6c44000  ! 2814: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0xb40d61ae  ! 2815: AND_I	and 	%r21, 0x01ae, %r26
	.word 0xbba81820  ! 2820: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb9a80c20  ! 2822: FMOVRLZ	dis not found

	.word 0xbdabc820  ! 2823: FMOVVC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_196:
	setx	0x37032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 2825: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a58860  ! 2827: FADDq	dis not found

cpu_intr_1_197:
	setx	0x35021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb485a049  ! 2834: ADDcc_I	addcc 	%r22, 0x0049, %r26
	.word 0xb9a00560  ! 2835: FSQRTq	fsqrt	
cpu_intr_1_198:
	setx	0x37003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54840  ! 2841: FADDd	faddd	%f52, %f0, %f26
T1_asi_reg_rd_116:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 2842: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_199:
	setx	0x340300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a94820  ! 2850: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbab40000  ! 2851: SUBCcc_R	orncc 	%r16, %r0, %r29
cpu_intr_1_200:
	setx	0x34013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40940  ! 2857: FMULd	fmuld	%f16, %f0, %f56
T1_asi_reg_rd_117:
	mov	0x9, %r14
	.word 0xf2db8400  ! 2859: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_139:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 2861: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda98820  ! 2862: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a50840  ! 2866: FADDd	faddd	%f20, %f0, %f56
	.word 0xb7a80420  ! 2868: FMOVRZ	dis not found

iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_201:
	setx	0x370207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 2875: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa48960  ! 2876: FMULq	dis not found

T1_asi_reg_rd_118:
	mov	0x20, %r14
	.word 0xf2db8400  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbfa81820  ! 2879: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfa548e0  ! 2880: FSUBq	dis not found

	.word 0xb3aac820  ! 2881: FMOVGE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7a4c860  ! 2885: FADDq	dis not found

cpu_intr_1_202:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbaa0820  ! 2893: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a4c8a0  ! 2898: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xb7a80820  ! 2899: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb97c4400  ! 2901: MOVR_R	movre	%r17, %r0, %r28
	.word 0xba3cc000  ! 2902: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xbfa548a0  ! 2903: FSUBs	fsubs	%f21, %f0, %f31
T1_asi_reg_rd_119:
	mov	0x14, %r14
	.word 0xf4db8e60  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_140:
	mov	0xd, %r14
	.word 0xf6f38e80  ! 2907: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbda8c820  ! 2909: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_120:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5a44960  ! 2915: FMULq	dis not found

iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 22)
	.word 0xb9a84820  ! 2920: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00020  ! 2921: FMOVs	fmovs	%f0, %f31
	.word 0xb5a84820  ! 2927: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3a9c820  ! 2933: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb844c000  ! 2935: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xbda00560  ! 2936: FSQRTq	fsqrt	
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa588a0  ! 2938: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb7a94820  ! 2944: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a58820  ! 2945: FADDs	fadds	%f22, %f0, %f25
cpu_intr_1_203:
	setx	0x370228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_204:
	setx	0x36002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a80820  ! 2951: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbda4c8a0  ! 2953: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb9a80420  ! 2954: FMOVRZ	dis not found

T1_asi_reg_wr_141:
	mov	0x31, %r14
	.word 0xf8f38400  ! 2956: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb13d8000  ! 2959: SRA_R	sra 	%r22, %r0, %r24
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a90820  ! 2961: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbba00560  ! 2965: FSQRTq	fsqrt	
	.word 0xb9a409c0  ! 2968: FDIVd	fdivd	%f16, %f0, %f28
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb9a00520  ! 2976: FSQRTs	fsqrt	
	.word 0xb0a50000  ! 2977: SUBcc_R	subcc 	%r20, %r0, %r24
	.word 0xb33d4000  ! 2980: SRA_R	sra 	%r21, %r0, %r25
cpu_intr_1_205:
	setx	0x36001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44920  ! 2984: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb2040000  ! 2985: ADD_R	add 	%r16, %r0, %r25
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_206:
	setx	0x35003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_207:
	setx	0x360106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 2996: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbc35605f  ! 3000: ORN_I	orn 	%r21, 0x005f, %r30
cpu_intr_1_208:
	setx	0x35013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_209:
	setx	0x37012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_121:
	mov	0x29, %r14
	.word 0xfadb8e80  ! 3010: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3a81c20  ! 3011: FMOVRGEZ	dis not found

iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_210:
	setx	0x37022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 3019: FMOVLEU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_122:
	mov	0x1e, %r14
	.word 0xf6db8400  ! 3024: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1aa0820  ! 3026: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb2a4e0b0  ! 3027: SUBcc_I	subcc 	%r19, 0x00b0, %r25
	.word 0xb3a4c860  ! 3028: FADDq	dis not found

iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a448a0  ! 3033: FSUBs	fsubs	%f17, %f0, %f25
cpu_intr_1_211:
	setx	0x340110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_212:
	setx	0x350014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a4c940  ! 3044: FMULd	fmuld	%f50, %f0, %f58
cpu_intr_1_213:
	setx	0x360010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_142:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 3048: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb92c1000  ! 3049: SLLX_R	sllx	%r16, %r0, %r28
T1_asi_reg_rd_123:
	mov	0x14, %r14
	.word 0xfcdb89e0  ! 3053: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb2854000  ! 3055: ADDcc_R	addcc 	%r21, %r0, %r25
cpu_intr_1_214:
	setx	0x36002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 3061: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_215:
	setx	0x350331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87946005  ! 3064: WRPR_TT_I	wrpr	%r17, 0x0005, %tt
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb9a589c0  ! 3069: FDIVd	fdivd	%f22, %f0, %f28
T1_asi_reg_rd_124:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 32)
	.word 0xb2a4a068  ! 3073: SUBcc_I	subcc 	%r18, 0x0068, %r25
	.word 0xbba00540  ! 3074: FSQRTd	fsqrt	
cpu_intr_1_216:
	setx	0x350104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 37)
	.word 0xb40ca12a  ! 3083: AND_I	and 	%r18, 0x012a, %r26
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_217:
	setx	0x340134, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_143:
	mov	0x19, %r14
	.word 0xfcf38e60  ! 3087: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 3089: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_218:
	setx	0x36011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_219:
	setx	0x370333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_220:
	setx	0x350204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_145:
	mov	0xc, %r14
	.word 0xf2f384a0  ! 3099: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_221:
	setx	0x37032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_125:
	mov	0x28, %r14
	.word 0xfcdb8e60  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_222:
	setx	0x350015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 3115: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_223:
	setx	0x36010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_224:
	setx	0x35001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 3118: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb61dc000  ! 3120: XOR_R	xor 	%r23, %r0, %r27
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 31)
	.word 0xbe1c4000  ! 3124: XOR_R	xor 	%r17, %r0, %r31
	.word 0xb7a00560  ! 3125: FSQRTq	fsqrt	
	.word 0xb5ab8820  ! 3130: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_126:
	mov	0x2c, %r14
	.word 0xf6db8e80  ! 3132: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb4bcc000  ! 3133: XNORcc_R	xnorcc 	%r19, %r0, %r26
	.word 0xb3a4c8e0  ! 3136: FSUBq	dis not found

	.word 0xb1a94820  ! 3137: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbba408a0  ! 3139: FSUBs	fsubs	%f16, %f0, %f29
cpu_intr_1_225:
	setx	0x360016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34f001  ! 3142: SRLX_I	srlx	%r19, 0x0001, %r31
	.word 0xbba81c20  ! 3143: FMOVRGEZ	dis not found

T1_asi_reg_wr_146:
	mov	0x1b, %r14
	.word 0xfcf38400  ! 3144: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_226:
	setx	0x360034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_147:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 3150: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3a54860  ! 3159: FADDq	dis not found

	.word 0xb5ab4820  ! 3162: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb02d6004  ! 3164: ANDN_I	andn 	%r21, 0x0004, %r24
	.word 0xb3a9c820  ! 3165: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbba80420  ! 3166: FMOVRZ	dis not found

T1_asi_reg_rd_127:
	mov	0x0, %r14
	.word 0xfcdb8e80  ! 3167: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba40940  ! 3169: FMULd	fmuld	%f16, %f0, %f60
	.word 0xbfa489e0  ! 3174: FDIVq	dis not found

cpu_intr_1_227:
	setx	0x340026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0940000  ! 3177: ORcc_R	orcc 	%r16, %r0, %r24
	.word 0xb5a80c20  ! 3178: FMOVRLZ	dis not found

T1_asi_reg_rd_128:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_129:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1a449c0  ! 3198: FDIVd	fdivd	%f48, %f0, %f24
T1_asi_reg_wr_148:
	mov	0x12, %r14
	.word 0xf6f389e0  ! 3201: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_228:
	setx	0x39033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_229:
	setx	0x380222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 3208: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_230:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 3210: FMOVCS	fmovs	%fcc1, %f0, %f30
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_231:
	setx	0x3a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54920  ! 3215: FMULs	fmuls	%f21, %f0, %f31
	.word 0xb095c000  ! 3216: ORcc_R	orcc 	%r23, %r0, %r24
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a58960  ! 3218: FMULq	dis not found

	.word 0xb1a00560  ! 3223: FSQRTq	fsqrt	
cpu_intr_1_232:
	setx	0x3b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5346001  ! 3228: SRL_I	srl 	%r17, 0x0001, %r26
	.word 0xb9a409c0  ! 3230: FDIVd	fdivd	%f16, %f0, %f28
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbfa84820  ! 3233: FMOVE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a509a0  ! 3236: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xbfa5c860  ! 3237: FADDq	dis not found

iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, a)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_233:
	setx	0x3b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_234:
	setx	0x38030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba4c8e0  ! 3251: FSUBq	dis not found

T1_asi_reg_rd_130:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 3253: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_131:
	mov	0x18, %r14
	.word 0xfadb8e60  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5ab0820  ! 3255: FMOVGU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_235:
	setx	0x3a0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_149:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 3262: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba589e0  ! 3263: FDIVq	dis not found

	.word 0xbfa90820  ! 3266: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_132:
	mov	0x32, %r14
	.word 0xf6db8e80  ! 3268: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_236:
	setx	0x3b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_150:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 3277: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a5c840  ! 3278: FADDd	faddd	%f54, %f0, %f26
T1_asi_reg_rd_133:
	mov	0x12, %r14
	.word 0xf0db8400  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 5)
	.word 0xbba84820  ! 3283: FMOVE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_151:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 3284: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1a80820  ! 3286: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb22de14f  ! 3287: ANDN_I	andn 	%r23, 0x014f, %r25
cpu_intr_1_237:
	setx	0x3a0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 38)
	.word 0xb5a549e0  ! 3300: FDIVq	dis not found

cpu_intr_1_238:
	setx	0x3b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_135:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 3308: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a00560  ! 3310: FSQRTq	fsqrt	
cpu_intr_1_239:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_240:
	setx	0x39021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_241:
	setx	0x3a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb9a589e0  ! 3321: FDIVq	dis not found

iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 5)
	.word 0xb005a07b  ! 3323: ADD_I	add 	%r22, 0x007b, %r24
	.word 0xbda408a0  ! 3327: FSUBs	fsubs	%f16, %f0, %f30
cpu_intr_1_242:
	setx	0x390007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 3330: FSQRTq	fsqrt	
	.word 0xbda88820  ! 3331: FMOVLE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_243:
	setx	0x3a0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 3333: FMOVd	fmovd	%f0, %f28
	.word 0xbda549c0  ! 3342: FDIVd	fdivd	%f52, %f0, %f30
T1_asi_reg_wr_152:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 3344: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb6a560d0  ! 3345: SUBcc_I	subcc 	%r21, 0x00d0, %r27
T1_asi_reg_rd_136:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 3354: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5a98820  ! 3355: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a589a0  ! 3356: FDIVs	fdivs	%f22, %f0, %f26
T1_asi_reg_wr_153:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 3357: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_154:
	mov	0x3, %r14
	.word 0xf0f389e0  ! 3364: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7a508a0  ! 3365: FSUBs	fsubs	%f20, %f0, %f27
cpu_intr_1_244:
	setx	0x380304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_245:
	setx	0x390129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_246:
	setx	0x3a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_247:
	setx	0x390230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 3373: FMOVVC	fmovs	%fcc1, %f0, %f24
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda508a0  ! 3377: FSUBs	fsubs	%f20, %f0, %f30
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a00520  ! 3384: FSQRTs	fsqrt	
cpu_intr_1_248:
	setx	0x390302, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_137:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 3386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 31)
	.word 0xb7a5c860  ! 3395: FADDq	dis not found

	.word 0xb9a4c9e0  ! 3397: FDIVq	dis not found

	.word 0xbda589c0  ! 3399: FDIVd	fdivd	%f22, %f0, %f30
T1_asi_reg_rd_138:
	mov	0x20, %r14
	.word 0xfadb84a0  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_155:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 3405: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5a00520  ! 3406: FSQRTs	fsqrt	
	.word 0xb7ab8820  ! 3408: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_156:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3410: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_249:
	setx	0x3a0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda80820  ! 3416: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_250:
	setx	0x380117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 3421: FMOVRGEZ	dis not found

	.word 0xb7a00520  ! 3422: FSQRTs	fsqrt	
	.word 0xb1a48920  ! 3423: FMULs	fmuls	%f18, %f0, %f24
cpu_intr_1_251:
	setx	0x3b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 3429: FSQRTs	fsqrt	
	.word 0xb7a80420  ! 3432: FMOVRZ	dis not found

	.word 0xbbaa8820  ! 3436: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab8820  ! 3440: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb88d20d6  ! 3442: ANDcc_I	andcc 	%r20, 0x00d6, %r28
	.word 0xb3a00560  ! 3445: FSQRTq	fsqrt	
	.word 0xb694c000  ! 3448: ORcc_R	orcc 	%r19, %r0, %r27
cpu_intr_1_252:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 3451: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb9aa0820  ! 3456: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_253:
	setx	0x3a0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a408a0  ! 3459: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xb6440000  ! 3460: ADDC_R	addc 	%r16, %r0, %r27
cpu_intr_1_254:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe444000  ! 3463: ADDC_R	addc 	%r17, %r0, %r31
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_255:
	setx	0x3a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 3467: FMOVVC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_157:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 3469: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb09c0000  ! 3471: XORcc_R	xorcc 	%r16, %r0, %r24
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 34)
	.word 0xbeac60d6  ! 3474: ANDNcc_I	andncc 	%r17, 0x00d6, %r31
	.word 0xb3a50940  ! 3475: FMULd	fmuld	%f20, %f0, %f56
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a40840  ! 3478: FADDd	faddd	%f16, %f0, %f56
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbc0d8000  ! 3481: AND_R	and 	%r22, %r0, %r30
T1_asi_reg_rd_139:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 3)
	.word 0xbabc4000  ! 3493: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xb5a90820  ! 3495: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a81420  ! 3497: FMOVRNZ	dis not found

iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, b)
	.word 0xba0d4000  ! 3505: AND_R	and 	%r21, %r0, %r29
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, d)
	.word 0x8995e190  ! 3507: WRPR_TICK_I	wrpr	%r23, 0x0190, %tick
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_158:
	mov	0x33, %r14
	.word 0xf2f389e0  ! 3513: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7a00540  ! 3514: FSQRTd	fsqrt	
	.word 0xb1a5c8a0  ! 3515: FSUBs	fsubs	%f23, %f0, %f24
cpu_intr_1_256:
	setx	0x38022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c820  ! 3519: FADDs	fadds	%f23, %f0, %f29
	.word 0xb9341000  ! 3520: SRLX_R	srlx	%r16, %r0, %r28
cpu_intr_1_257:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_159:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 3524: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_140:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 3525: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_160:
	mov	0x13, %r14
	.word 0xf6f38e80  ! 3526: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a81420  ! 3528: FMOVRNZ	dis not found

	.word 0xb4c54000  ! 3529: ADDCcc_R	addccc 	%r21, %r0, %r26
	.word 0xb29d8000  ! 3530: XORcc_R	xorcc 	%r22, %r0, %r25
cpu_intr_1_258:
	setx	0x3a010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_161:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 3537: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a00540  ! 3542: FSQRTd	fsqrt	
	.word 0xb7a58920  ! 3543: FMULs	fmuls	%f22, %f0, %f27
	.word 0xbbaa8820  ! 3545: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_162:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 3546: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb0144000  ! 3547: OR_R	or 	%r17, %r0, %r24
	.word 0xba1da060  ! 3548: XOR_I	xor 	%r22, 0x0060, %r29
T1_asi_reg_wr_163:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 3553: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_259:
	setx	0x3a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449e0  ! 3555: FDIVq	dis not found

cpu_intr_1_260:
	setx	0x390029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 30)
	.word 0xb7a4c820  ! 3563: FADDs	fadds	%f19, %f0, %f27
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 39)
	.word 0xb2842010  ! 3565: ADDcc_I	addcc 	%r16, 0x0010, %r25
	.word 0xbda80420  ! 3567: FMOVRZ	dis not found

cpu_intr_1_261:
	setx	0x39020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x38012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_263:
	setx	0x38021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba54840  ! 3572: FADDd	faddd	%f52, %f0, %f60
cpu_intr_1_264:
	setx	0x390038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_265:
	setx	0x390109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 6)
	.word 0xbfa9c820  ! 3579: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_141:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 3582: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_266:
	setx	0x3a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_164:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 3586: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda54940  ! 3589: FMULd	fmuld	%f52, %f0, %f30
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, b)
	.word 0xbeb4c000  ! 3592: SUBCcc_R	orncc 	%r19, %r0, %r31
cpu_intr_1_267:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb645e170  ! 3600: ADDC_I	addc 	%r23, 0x0170, %r27
	.word 0xbf7c6401  ! 3601: MOVR_I	movre	%r17, 0x1, %r31
T1_asi_reg_rd_142:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 3)
	.word 0xbba5c8c0  ! 3608: FSUBd	fsubd	%f54, %f0, %f60
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda58960  ! 3616: FMULq	dis not found

cpu_intr_1_268:
	setx	0x3b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbca48000  ! 3623: SUBcc_R	subcc 	%r18, %r0, %r30
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb1aac820  ! 3628: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbda44860  ! 3630: FADDq	dis not found

	.word 0xbda81820  ! 3632: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb7a80820  ! 3636: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a5c9c0  ! 3639: FDIVd	fdivd	%f54, %f0, %f56
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a54920  ! 3641: FMULs	fmuls	%f21, %f0, %f24
	.word 0xbba80420  ! 3643: FMOVRZ	dis not found

	.word 0xb7a00520  ! 3644: FSQRTs	fsqrt	
T1_asi_reg_wr_165:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 3646: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_269:
	setx	0x3a0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_166:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 3651: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_270:
	setx	0x3a011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_167:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 3655: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_271:
	setx	0x390324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 3661: FMOVRLZ	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_272:
	setx	0x3b031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_168:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 3665: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_143:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 3667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_273:
	setx	0x380225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 3669: FSQRTq	fsqrt	
cpu_intr_1_274:
	setx	0x3a0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x3d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a81820  ! 3676: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbfa40820  ! 3677: FADDs	fadds	%f16, %f0, %f31
cpu_intr_1_276:
	setx	0x3d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58840  ! 3684: FADDd	faddd	%f22, %f0, %f58
T1_asi_reg_wr_169:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 3685: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_144:
	mov	0xb, %r14
	.word 0xf8db84a0  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 4)
	.word 0xb0c5e1a6  ! 3688: ADDCcc_I	addccc 	%r23, 0x01a6, %r24
	.word 0xb7a58960  ! 3689: FMULq	dis not found

cpu_intr_1_277:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 3692: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7a00560  ! 3694: FSQRTq	fsqrt	
T1_asi_reg_rd_145:
	mov	0x6, %r14
	.word 0xf4db84a0  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_278:
	setx	0x3d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_146:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 3700: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_147:
	mov	0x2c, %r14
	.word 0xfcdb8e60  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbda94820  ! 3702: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_148:
	mov	0x26, %r14
	.word 0xf0db89e0  ! 3705: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_170:
	mov	0x16, %r14
	.word 0xf0f389e0  ! 3708: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_149:
	mov	0xa, %r14
	.word 0xfedb89e0  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb8b40000  ! 3717: ORNcc_R	orncc 	%r16, %r0, %r28
cpu_intr_1_279:
	setx	0x3f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_280:
	setx	0x3e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_171:
	mov	0x29, %r14
	.word 0xf6f38400  ! 3721: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9a588e0  ! 3724: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_281:
	setx	0x3e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_282:
	setx	0x3f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_283:
	setx	0x3c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a408e0  ! 3730: FSUBq	dis not found

	.word 0xbfa48840  ! 3732: FADDd	faddd	%f18, %f0, %f62
T1_asi_reg_wr_172:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 3735: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbdabc820  ! 3736: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbba588a0  ! 3737: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb5a50860  ! 3738: FADDq	dis not found

T1_asi_reg_wr_173:
	mov	0x3, %r14
	.word 0xf2f389e0  ! 3739: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9a00020  ! 3740: FMOVs	fmovs	%f0, %f28
	.word 0xbdaa8820  ! 3741: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00520  ! 3742: FSQRTs	fsqrt	
T1_asi_reg_rd_150:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 3743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a84820  ! 3748: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_151:
	mov	0x2a, %r14
	.word 0xf0db8400  ! 3752: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_284:
	setx	0x3c000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_285:
	setx	0x3d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_286:
	setx	0x3e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 3757: FMOVGU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a5c840  ! 3760: FADDd	faddd	%f54, %f0, %f56
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_287:
	setx	0x3e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_152:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 3773: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_174:
	mov	0x11, %r14
	.word 0xf2f38e80  ! 3774: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb4844000  ! 3775: ADDcc_R	addcc 	%r17, %r0, %r26
	.word 0xba344000  ! 3776: SUBC_R	orn 	%r17, %r0, %r29
	.word 0xb4448000  ! 3779: ADDC_R	addc 	%r18, %r0, %r26
	.word 0xbba90820  ! 3780: FMOVLEU	fmovs	%fcc1, %f0, %f29
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_175:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 3783: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_288:
	setx	0x3d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 3787: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00520  ! 3788: FSQRTs	fsqrt	
T1_asi_reg_rd_153:
	mov	0x32, %r14
	.word 0xf4db8400  ! 3791: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7a9c820  ! 3792: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbba80820  ! 3796: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbda8c820  ! 3799: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb215e112  ! 3800: OR_I	or 	%r23, 0x0112, %r25
	.word 0xbba48920  ! 3801: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb7a50860  ! 3802: FADDq	dis not found

cpu_intr_1_289:
	setx	0x3e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda90820  ! 3806: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbc2c0000  ! 3809: ANDN_R	andn 	%r16, %r0, %r30
	.word 0xb9aac820  ! 3813: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_290:
	setx	0x3e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a00560  ! 3824: FSQRTq	fsqrt	
T1_asi_reg_wr_176:
	mov	0x0, %r14
	.word 0xfef38e40  ! 3829: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda88820  ! 3837: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbba489a0  ! 3839: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xb3abc820  ! 3840: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xbfa40820  ! 3841: FADDs	fadds	%f16, %f0, %f31
	.word 0xb1a5c960  ! 3843: FMULq	dis not found

	.word 0xb1a8c820  ! 3844: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_291:
	setx	0x3c012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409a0  ! 3848: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xb5a48960  ! 3854: FMULq	dis not found

T1_asi_reg_wr_177:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 3859: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_154:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_292:
	setx	0x3f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8e0  ! 3870: FSUBq	dis not found

cpu_intr_1_293:
	setx	0x3f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 3873: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_155:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_156:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_294:
	setx	0x3d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_157:
	mov	0x5, %r14
	.word 0xf8db8e80  ! 3894: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_178:
	mov	0x2c, %r14
	.word 0xf2f38e80  ! 3895: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5a94820  ! 3897: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb8b5e066  ! 3898: SUBCcc_I	orncc 	%r23, 0x0066, %r28
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 16)
	.word 0xbba4c8c0  ! 3900: FSUBd	fsubd	%f50, %f0, %f60
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a81820  ! 3906: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_295:
	setx	0x3f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3349000  ! 3911: SRLX_R	srlx	%r18, %r0, %r25
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 20)
	.word 0xb9a5c920  ! 3917: FMULs	fmuls	%f23, %f0, %f28
T1_asi_reg_rd_158:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 3918: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a00020  ! 3919: FMOVs	fmovs	%f0, %f26
	.word 0xb951c000  ! 3921: RDPR_TL	<illegal instruction>
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_296:
	setx	0x3e011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3928: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 5)
	.word 0xb3a4c8e0  ! 3934: FSUBq	dis not found

T1_asi_reg_rd_159:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3a50860  ! 3938: FADDq	dis not found

iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 3945: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_179:
	mov	0x10, %r14
	.word 0xf2f389e0  ! 3946: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_180:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 3947: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_161:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbbab4820  ! 3951: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa4820  ! 3953: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbba508e0  ! 3954: FSUBq	dis not found

T1_asi_reg_rd_162:
	mov	0x12, %r14
	.word 0xf8db8400  ! 3955: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfa5c8c0  ! 3957: FSUBd	fsubd	%f54, %f0, %f62
	.word 0xbf34a001  ! 3958: SRL_I	srl 	%r18, 0x0001, %r31
T1_asi_reg_rd_163:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_164:
	mov	0x1f, %r14
	.word 0xf6db89e0  ! 3962: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7a58860  ! 3964: FADDq	dis not found

iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba5c9c0  ! 3966: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb6a54000  ! 3969: SUBcc_R	subcc 	%r21, %r0, %r27
T1_asi_reg_rd_165:
	mov	0x1e, %r14
	.word 0xfedb89e0  ! 3972: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_166:
	mov	0x1b, %r14
	.word 0xf2db84a0  ! 3973: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3ab0820  ! 3975: FMOVGU	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba44840  ! 3978: FADDd	faddd	%f48, %f0, %f60
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a449e0  ! 3982: FDIVq	dis not found

iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 18)
	.word 0xb00c8000  ! 3984: AND_R	and 	%r18, %r0, %r24
	.word 0xb7a4c8e0  ! 3986: FSUBq	dis not found

T1_asi_reg_rd_167:
	mov	0x4, %r14
	.word 0xfadb8400  ! 3987: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7a9c820  ! 3989: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a90820  ! 3991: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_181:
	mov	0x12, %r14
	.word 0xfcf38e40  ! 3992: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9a90820  ! 3993: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_297:
	setx	0x3d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_298:
	setx	0x3c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 4000: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_299:
	setx	0x3e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 4006: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbe9c8000  ! 4011: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xb5a84820  ! 4012: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_300:
	setx	0x3c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 11)
	.word 0xbd2c5000  ! 4021: SLLX_R	sllx	%r17, %r0, %r30
	.word 0xb3a4c9c0  ! 4022: FDIVd	fdivd	%f50, %f0, %f56
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_301:
	setx	0x3e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a5c960  ! 4034: FMULq	dis not found

	.word 0xb9a508e0  ! 4035: FSUBq	dis not found

	.word 0xbd2cf001  ! 4038: SLLX_I	sllx	%r19, 0x0001, %r30
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb2048000  ! 4041: ADD_R	add 	%r18, %r0, %r25
	.word 0xb9a509a0  ! 4042: FDIVs	fdivs	%f20, %f0, %f28
cpu_intr_1_302:
	setx	0x3f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 4046: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_303:
	setx	0x3d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40920  ! 4060: FMULs	fmuls	%f16, %f0, %f25
	.word 0xb7a81420  ! 4061: FMOVRNZ	dis not found

	lda	[%r19 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a00560  ! 4067: FSQRTq	fsqrt	
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda40940  ! 4070: FMULd	fmuld	%f16, %f0, %f30
cpu_intr_1_304:
	setx	0x3d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4072: RDPR_TT	<illegal instruction>
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_305:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_182:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 4079: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_183:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 4084: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_184:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 4087: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb32c8000  ! 4089: SLL_R	sll 	%r18, %r0, %r25
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_185:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 4094: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_169:
	mov	0x9, %r14
	.word 0xf2db89e0  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbec58000  ! 4097: ADDCcc_R	addccc 	%r22, %r0, %r31
cpu_intr_1_306:
	setx	0x3e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_307:
	setx	0x3d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_170:
	mov	0x28, %r14
	.word 0xf4db84a0  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3ab8820  ! 4107: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_171:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 4110: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7a40960  ! 4111: FMULq	dis not found

	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbfa00020  ! 4116: FMOVs	fmovs	%f0, %f31
	.word 0xbcb52103  ! 4117: SUBCcc_I	orncc 	%r20, 0x0103, %r30
	.word 0xb5aac820  ! 4118: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a50820  ! 4120: FADDs	fadds	%f20, %f0, %f28
	.word 0xb04560f7  ! 4122: ADDC_I	addc 	%r21, 0x00f7, %r24
	.word 0xbfa4c940  ! 4124: FMULd	fmuld	%f50, %f0, %f62
cpu_intr_1_308:
	setx	0x410320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 4129: FMOVs	fmovs	%f0, %f28
T1_asi_reg_wr_186:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 4134: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a80820  ! 4140: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_309:
	setx	0x400106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 4146: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_187:
	mov	0x7, %r14
	.word 0xfaf38400  ! 4148: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb37da401  ! 4149: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xb484e054  ! 4150: ADDcc_I	addcc 	%r19, 0x0054, %r26
T1_asi_reg_rd_172:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 4151: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_rd_173:
	mov	0x32, %r14
	.word 0xfedb89e0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb5a448e0  ! 4153: FSUBq	dis not found

T1_asi_reg_wr_188:
	mov	0x35, %r14
	.word 0xfcf384a0  ! 4154: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb93d0000  ! 4155: SRA_R	sra 	%r20, %r0, %r28
cpu_intr_1_310:
	setx	0x30312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_174:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 4162: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a4c9a0  ! 4168: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xb9a549a0  ! 4169: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb7a409e0  ! 4170: FDIVq	dis not found

cpu_intr_1_311:
	setx	0x420200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba508a0  ! 4173: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbfa00560  ! 4175: FSQRTq	fsqrt	
	.word 0xb5a508e0  ! 4177: FSUBq	dis not found

T1_asi_reg_wr_189:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 4184: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9a5c820  ! 4186: FADDs	fadds	%f23, %f0, %f28
	.word 0xbfa00520  ! 4189: FSQRTs	fsqrt	
	.word 0xb1a4c9e0  ! 4191: FDIVq	dis not found

	.word 0xbfa80420  ! 4193: FMOVRZ	dis not found

	.word 0xb02c4000  ! 4194: ANDN_R	andn 	%r17, %r0, %r24
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_175:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 4197: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_312:
	setx	0x43011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x899561de  ! 4206: WRPR_TICK_I	wrpr	%r21, 0x01de, %tick
T1_asi_reg_rd_176:
	mov	0x2e, %r14
	.word 0xfadb8e40  ! 4210: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb92d5000  ! 4215: SLLX_R	sllx	%r21, %r0, %r28
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb9a5c940  ! 4219: FMULd	fmuld	%f54, %f0, %f28
T1_asi_reg_rd_177:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_313:
	setx	0x400009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_190:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4225: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_178:
	mov	0xe, %r14
	.word 0xfcdb89e0  ! 4230: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb444e1df  ! 4239: ADDC_I	addc 	%r19, 0x01df, %r26
	.word 0xbe2d8000  ! 4241: ANDN_R	andn 	%r22, %r0, %r31
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_314:
	setx	0x420036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 4249: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb7a44960  ! 4254: FMULq	dis not found

T1_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4259: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1ab4820  ! 4260: FMOVCC	fmovs	%fcc1, %f0, %f24
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_191:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 4263: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_315:
	setx	0x410031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c960  ! 4269: FMULq	dis not found

	.word 0xbfa00020  ! 4272: FMOVs	fmovs	%f0, %f31
	.word 0xb5a48920  ! 4273: FMULs	fmuls	%f18, %f0, %f26
	.word 0xb1a548e0  ! 4275: FSUBq	dis not found

	.word 0xb3a00520  ! 4276: FSQRTs	fsqrt	
cpu_intr_1_316:
	setx	0x43022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_180:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_317:
	setx	0x400117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 4283: FMOVs	fmovs	%f0, %f30
T1_asi_reg_rd_181:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_192:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 4286: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb9a98820  ! 4289: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_193:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4293: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa81820  ! 4295: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xbfa4c960  ! 4298: FMULq	dis not found

iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_318:
	setx	0x43003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589a0  ! 4310: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xb9a00540  ! 4311: FSQRTd	fsqrt	
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a409a0  ! 4317: FDIVs	fdivs	%f16, %f0, %f25
T1_asi_reg_wr_194:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 4320: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_319:
	setx	0x420037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_320:
	setx	0x430325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 4325: FSQRTs	fsqrt	
T1_asi_reg_rd_182:
	mov	0x11, %r14
	.word 0xfedb8400  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_195:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 4331: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb0bd2087  ! 4333: XNORcc_I	xnorcc 	%r20, 0x0087, %r24
	.word 0xb9a58860  ! 4337: FADDq	dis not found

T1_asi_reg_rd_183:
	mov	0x3, %r14
	.word 0xf8db8e40  ! 4338: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_196:
	mov	0x3, %r14
	.word 0xf8f389e0  ! 4339: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb3a5c9e0  ! 4343: FDIVq	dis not found

	.word 0xbf347001  ! 4344: SRLX_I	srlx	%r17, 0x0001, %r31
cpu_intr_1_321:
	setx	0x400113, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_184:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_185:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9a8c820  ! 4350: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_322:
	setx	0x430016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_323:
	setx	0x40002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d6001  ! 4359: SRA_I	sra 	%r21, 0x0001, %r31
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_324:
	setx	0x400110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_186:
	mov	0x14, %r14
	.word 0xfadb89e0  ! 4368: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3a448a0  ! 4371: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb5a588c0  ! 4376: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb1a4c8a0  ! 4377: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbba00560  ! 4378: FSQRTq	fsqrt	
T1_asi_reg_wr_197:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 4379: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_325:
	setx	0x430312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50860  ! 4384: FADDq	dis not found

	.word 0xb5ab0820  ! 4387: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbba44840  ! 4388: FADDd	faddd	%f48, %f0, %f60
cpu_intr_1_326:
	setx	0x400001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 4396: FMOVRNZ	dis not found

cpu_intr_1_327:
	setx	0x410024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 35)
	.word 0xb53d1000  ! 4403: SRAX_R	srax	%r20, %r0, %r26
	.word 0xb7a84820  ! 4405: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb3aac820  ! 4406: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_198:
	mov	0x29, %r14
	.word 0xf8f38e80  ! 4410: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_328:
	setx	0x42012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_329:
	setx	0x42020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_330:
	setx	0x410335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba354000  ! 4422: ORN_R	orn 	%r21, %r0, %r29
T1_asi_reg_rd_187:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4423: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5a94820  ! 4424: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a588e0  ! 4425: FSUBq	dis not found

	.word 0xbda00540  ! 4426: FSQRTd	fsqrt	
	.word 0xbfa00520  ! 4427: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_188:
	mov	0xa, %r14
	.word 0xfadb8e80  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_331:
	setx	0x43000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c8000  ! 4436: XORcc_R	xorcc 	%r18, %r0, %r24
	.word 0xb1aa8820  ! 4437: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb5abc820  ! 4438: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa80820  ! 4440: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb7a54960  ! 4443: FMULq	dis not found

T1_asi_reg_rd_189:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 4444: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1a50920  ! 4445: FMULs	fmuls	%f20, %f0, %f24
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, c)
	.word 0xbba00560  ! 4450: FSQRTq	fsqrt	
	.word 0xb5a44940  ! 4452: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb004c000  ! 4453: ADD_R	add 	%r19, %r0, %r24
T1_asi_reg_wr_199:
	mov	0x21, %r14
	.word 0xf4f38400  ! 4454: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a58960  ! 4460: FMULq	dis not found

iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_332:
	setx	0x410130, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_190:
	mov	0x1b, %r14
	.word 0xf0db8e80  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbda00540  ! 4471: FSQRTd	fsqrt	
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a5c8e0  ! 4477: FSUBq	dis not found

	.word 0xbba40940  ! 4480: FMULd	fmuld	%f16, %f0, %f60
cpu_intr_1_333:
	setx	0x40022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48940  ! 4486: FMULd	fmuld	%f18, %f0, %f24
T1_asi_reg_wr_200:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 4487: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_334:
	setx	0x410038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_191:
	mov	0x10, %r14
	.word 0xf6db8400  ! 4492: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_335:
	setx	0x41010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 4498: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3ab4820  ! 4499: FMOVCC	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_192:
	mov	0x4, %r14
	.word 0xf4db8400  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7aac820  ! 4522: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb0b4602c  ! 4526: SUBCcc_I	orncc 	%r17, 0x002c, %r24
T1_asi_reg_wr_201:
	mov	0x0, %r14
	.word 0xf2f38e80  ! 4527: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5a88820  ! 4529: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a84820  ! 4530: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_202:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 4537: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa98820  ! 4541: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_203:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 4542: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5aa8820  ! 4543: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_193:
	mov	0x38, %r14
	.word 0xf0db8400  ! 4545: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbda80820  ! 4546: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_336:
	setx	0x410223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_337:
	setx	0x400230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_194:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 4554: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1a00540  ! 4557: FSQRTd	fsqrt	
	.word 0xb3a98820  ! 4558: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb8c5611e  ! 4561: ADDCcc_I	addccc 	%r21, 0x011e, %r28
cpu_intr_1_338:
	setx	0x40000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_195:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 4566: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_339:
	setx	0x41013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_196:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_197:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 4570: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbc34609c  ! 4571: SUBC_I	orn 	%r17, 0x009c, %r30
cpu_intr_1_340:
	setx	0x430304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6948000  ! 4573: ORcc_R	orcc 	%r18, %r0, %r27
cpu_intr_1_341:
	setx	0x41023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf348000  ! 4575: SRL_R	srl 	%r18, %r0, %r31
cpu_intr_1_342:
	setx	0x450006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 4579: FMOVs	fmovs	%f0, %f28
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_204:
	mov	0x7, %r14
	.word 0xf8f389e0  ! 4582: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb444e081  ! 4583: ADDC_I	addc 	%r19, 0x0081, %r26
cpu_intr_1_343:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 4587: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_344:
	setx	0x460327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa548c0  ! 4599: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xb9a94820  ! 4600: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_198:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 4604: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_345:
	setx	0x47033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_199:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 4606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3ab0820  ! 4609: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbda44860  ! 4610: FADDq	dis not found

iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_346:
	setx	0x46023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 4618: MOVcc_I	<illegal instruction>
	.word 0xbfa8c820  ! 4619: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb5a488e0  ! 4622: FSUBq	dis not found

T1_asi_reg_rd_200:
	mov	0x1f, %r14
	.word 0xfadb8400  ! 4624: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7a80420  ! 4625: FMOVRZ	dis not found

iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa00560  ! 4627: FSQRTq	fsqrt	
cpu_intr_1_347:
	setx	0x460006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_201:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb3a589e0  ! 4630: FDIVq	dis not found

cpu_intr_1_348:
	setx	0x47030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_349:
	setx	0x46030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 4641: FMOVGU	fmovs	%fcc1, %f0, %f24
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_202:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 4648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a5c8c0  ! 4649: FSUBd	fsubd	%f54, %f0, %f28
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbd510000  ! 4651: RDPR_TICK	<illegal instruction>
T1_asi_reg_wr_205:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 4652: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a81c20  ! 4656: FMOVRGEZ	dis not found

	.word 0xb9480000  ! 4657: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
cpu_intr_1_350:
	setx	0x44023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_351:
	setx	0x460037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5ab8820  ! 4663: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_206:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 4669: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a549a0  ! 4670: FDIVs	fdivs	%f21, %f0, %f24
T1_asi_reg_rd_203:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 4671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9a81420  ! 4672: FMOVRNZ	dis not found

iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_207:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 4675: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_352:
	setx	0x450232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa408e0  ! 4681: FSUBq	dis not found

iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_204:
	mov	0x4, %r14
	.word 0xf6db8e40  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_208:
	mov	0x28, %r14
	.word 0xf8f38400  ! 4692: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_353:
	setx	0x460320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_354:
	setx	0x44021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_205:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbb35a001  ! 4704: SRL_I	srl 	%r22, 0x0001, %r29
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 12)
	.word 0xbdabc820  ! 4710: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00520  ! 4712: FSQRTs	fsqrt	
cpu_intr_1_355:
	setx	0x450201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0x31, %r14
	.word 0xf4db89e0  ! 4717: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_356:
	setx	0x450226, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_207:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_rd_208:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 4722: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbdabc820  ! 4724: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb2b40000  ! 4725: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xb7a488c0  ! 4726: FSUBd	fsubd	%f18, %f0, %f58
T1_asi_reg_wr_209:
	mov	0x36, %r14
	.word 0xfaf38e80  ! 4727: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb9a00020  ! 4731: FMOVs	fmovs	%f0, %f28
	.word 0xb3a50820  ! 4732: FADDs	fadds	%f20, %f0, %f25
	.word 0xbba00040  ! 4734: FMOVd	fmovd	%f0, %f60
T1_asi_reg_wr_210:
	mov	0x25, %r14
	.word 0xf2f38e80  ! 4736: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_357:
	setx	0x470028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448a0  ! 4738: FSUBs	fsubs	%f17, %f0, %f30
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3a80820  ! 4740: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_358:
	setx	0x47000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_209:
	mov	0x17, %r14
	.word 0xf4db8400  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbeb40000  ! 4754: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xbfa58860  ! 4755: FADDq	dis not found

	.word 0xb5a80c20  ! 4757: FMOVRLZ	dis not found

T1_asi_reg_rd_210:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_359:
	setx	0x44003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_360:
	setx	0x47011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 4767: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_211:
	mov	0x2a, %r14
	.word 0xf0f38400  ! 4769: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_361:
	setx	0x450208, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_212:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 4773: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_362:
	setx	0x470005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 4779: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a81c20  ! 4780: FMOVRGEZ	dis not found

	.word 0xb63ce15b  ! 4781: XNOR_I	xnor 	%r19, 0x015b, %r27
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_211:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 4783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3aac820  ! 4788: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbeb4604a  ! 4789: ORNcc_I	orncc 	%r17, 0x004a, %r31
	.word 0xb1a84820  ! 4790: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_213:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 4792: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfaa8820  ! 4793: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00540  ! 4795: FSQRTd	fsqrt	
cpu_intr_1_363:
	setx	0x440328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_364:
	setx	0x47010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_212:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a8c820  ! 4803: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_365:
	setx	0x470128, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_213:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_366:
	setx	0x45001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_214:
	mov	0x2d, %r14
	.word 0xfcf38400  ! 4809: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, d)
	.word 0xbc34c000  ! 4816: SUBC_R	orn 	%r19, %r0, %r30
	.word 0xb1abc820  ! 4817: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_215:
	mov	0x9, %r14
	.word 0xf4f38400  ! 4818: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_214:
	mov	0x2b, %r14
	.word 0xfcdb8e80  ! 4820: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_215:
	mov	0x7, %r14
	.word 0xfedb8400  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb53d4000  ! 4823: SRA_R	sra 	%r21, %r0, %r26
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbbaa0820  ! 4825: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_216:
	mov	0x29, %r14
	.word 0xf2f38400  ! 4826: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_367:
	setx	0x460116, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_217:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 4829: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3641800  ! 4831: MOVcc_R	<illegal instruction>
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, b)
	.word 0xb7a549e0  ! 4833: FDIVq	dis not found

cpu_intr_1_368:
	setx	0x460308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe954000  ! 4836: ORcc_R	orcc 	%r21, %r0, %r31
	.word 0xbc9d6051  ! 4837: XORcc_I	xorcc 	%r21, 0x0051, %r30
	.word 0xbebc4000  ! 4838: XNORcc_R	xnorcc 	%r17, %r0, %r31
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_216:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 4841: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9a00540  ! 4843: FSQRTd	fsqrt	
cpu_intr_1_369:
	setx	0x440107, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_218:
	mov	0x23, %r14
	.word 0xf2f38e60  ! 4849: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_370:
	setx	0x470320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 4852: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 31)
	.word 0xbfa00540  ! 4854: FSQRTd	fsqrt	
	.word 0xb1a40940  ! 4856: FMULd	fmuld	%f16, %f0, %f24
cpu_intr_1_371:
	setx	0x470125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_219:
	mov	0x2b, %r14
	.word 0xf6f38e80  ! 4862: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_217:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 4865: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7a88820  ! 4869: FMOVLE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_218:
	mov	0x17, %r14
	.word 0xf0db8e60  ! 4885: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbc34e1c8  ! 4888: SUBC_I	orn 	%r19, 0x01c8, %r30
	.word 0xbda54920  ! 4889: FMULs	fmuls	%f21, %f0, %f30
	.word 0xb9a508c0  ! 4890: FSUBd	fsubd	%f20, %f0, %f28
cpu_intr_1_372:
	setx	0x10311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_220:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 4901: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9aac820  ! 4906: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0x9194a030  ! 4910: WRPR_PIL_I	wrpr	%r18, 0x0030, %pil
	.word 0x89952181  ! 4912: WRPR_TICK_I	wrpr	%r20, 0x0181, %tick
cpu_intr_1_373:
	setx	0x460127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_374:
	setx	0x47001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd504000  ! 4920: RDPR_TNPC	<illegal instruction>
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 4)
	.word 0xba3d4000  ! 4924: XNOR_R	xnor 	%r21, %r0, %r29
T1_asi_reg_wr_221:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 4927: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_222:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 4929: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5a48840  ! 4931: FADDd	faddd	%f18, %f0, %f26
	.word 0xbc8d2010  ! 4933: ANDcc_I	andcc 	%r20, 0x0010, %r30
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_223:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 4938: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_224:
	mov	0xa, %r14
	.word 0xf4f38e80  ! 4940: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_375:
	setx	0x460024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_376:
	setx	0x460110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8e0  ! 4950: FSUBq	dis not found

T1_asi_reg_wr_225:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 4954: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_377:
	setx	0x45013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_378:
	setx	0x440133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb4605f  ! 4959: ORNcc_I	orncc 	%r17, 0x005f, %r30
cpu_intr_1_379:
	setx	0x450232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_380:
	setx	0x470118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea5c000  ! 4964: SUBcc_R	subcc 	%r23, %r0, %r31
	.word 0xb5359000  ! 4966: SRLX_R	srlx	%r22, %r0, %r26
T1_asi_reg_wr_226:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 4967: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_219:
	mov	0xb, %r14
	.word 0xf6db84a0  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_381:
	setx	0x47023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_382:
	setx	0x440220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_383:
	setx	0x460125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_220:
	mov	0x21, %r14
	.word 0xf0db8e80  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 29)
	.word 0xb5abc820  ! 4981: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba88820  ! 4982: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_227:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 4983: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbfab0820  ! 4990: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a588e0  ! 4991: FSUBq	dis not found

cpu_intr_1_384:
	setx	0x470105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_385:
	setx	0x47032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_221:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 4998: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26

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

	.xword	0x93090ee451a206cc
	.xword	0x84fc4ffbee70d656
	.xword	0x39a3609791226bdd
	.xword	0x224afa9a454825a0
	.xword	0x13a6af1dbc385992
	.xword	0x5d8651619dcac9d5
	.xword	0x4310d7902002f607
	.xword	0xcf96a02b4c074c90
	.xword	0x25a410f290f87a9e
	.xword	0xbaaa210e48d9e6c8
	.xword	0x301d971baf1219e1
	.xword	0x42558fd62cee8b59
	.xword	0xfb653e9342880fa9
	.xword	0x1f9bd29fabde5592
	.xword	0x05e5eb4a1f3360fa
	.xword	0x6fa65ec3c8993db6
	.xword	0x9c820f8b4fd2f59e
	.xword	0x9841d8e255f1c26e
	.xword	0x917291dc8d93d74b
	.xword	0x495aaacd3530266c
	.xword	0x2fb48c8893bf6079
	.xword	0x70cdd860d899b459
	.xword	0x69d0d99f0775b59c
	.xword	0x72d35ad0db0b67aa
	.xword	0xdb5c55203d58493b
	.xword	0x15875f41b9189aee
	.xword	0x364de2186310f5e8
	.xword	0xeefd539293122018
	.xword	0x9b9065bbb410403d
	.xword	0x24fd9a2b4aa3fa27
	.xword	0xf80272fad9495877
	.xword	0x8132a046164c62ed
	.xword	0x4634f3a575eb751f
	.xword	0x1d21e8a2141d3daa
	.xword	0x6f5d17824e4bb38d
	.xword	0x72dcd05d9825bc0b
	.xword	0x29264f8fa41292a7
	.xword	0xeb45633a10fa9f62
	.xword	0x806b3ae6a5b0b158
	.xword	0xf531fc2483376ebf
	.xword	0xa187ce15dd9dee8b
	.xword	0x3786963d67942bf9
	.xword	0xc5a950883d7ba951
	.xword	0xcc4fe01a1e5cf28b
	.xword	0x05184cf8aa4cbcf7
	.xword	0xefb78017b0ad8d68
	.xword	0x2d52027111c9963f
	.xword	0x798096fd49ecedb7
	.xword	0xb2dd0cbb7e766723
	.xword	0x089ab8bec0e916eb
	.xword	0xf28ff747ab497600
	.xword	0x9c26e4c3973b520a
	.xword	0xf2f24228885d2923
	.xword	0x4411fd42e5736b94
	.xword	0x2cc9758a6d4fd99b
	.xword	0xd222cff8d65ae4b1
	.xword	0x0063b4f7f1944a14
	.xword	0x0667742c7b91be3d
	.xword	0xd6f0ec86b0e5d0cb
	.xword	0x3fba911fd4d9b041
	.xword	0x5e11ba35cc2de4c8
	.xword	0x45b73910ed4ad3f7
	.xword	0xbeeaa2ce4e30a5b5
	.xword	0x6c83760a4fe775dc
	.xword	0xfdb6dfb4c87d5a0a
	.xword	0x95242ece99d6cf47
	.xword	0xec50f29ccf0a67c5
	.xword	0x953247dd5df1d27a
	.xword	0x86d1caf2873a6781
	.xword	0x4d19e8ac7613e503
	.xword	0x42781f73cd86cb4e
	.xword	0x8c32b0641d84d68a
	.xword	0xbb3c698c7927f92d
	.xword	0x1faffc092ae94910
	.xword	0x6ffc06c4e4c4e85d
	.xword	0xb5a3bf0dde370aa7
	.xword	0x97573c3735a11daa
	.xword	0x4b3160fe540d181d
	.xword	0xf19f7495f5b0d335
	.xword	0x7ea7d1a2eceb6ea7
	.xword	0x3d3c3a6236c3e385
	.xword	0xee498a3c59375f6f
	.xword	0x405e9aebfa41739d
	.xword	0x2651953182098e4d
	.xword	0xd68b7f9794fdfe3e
	.xword	0x530a57143e6d0531
	.xword	0x0ac954e930332fcf
	.xword	0x478aad301c0ac756
	.xword	0x65d73c367fd8f648
	.xword	0xd367fa3e459e342d
	.xword	0x689c5766d96610f7
	.xword	0x3e99271bf476d7a3
	.xword	0x25cbf06703579905
	.xword	0xbfef493a09cd0045
	.xword	0xa209984b85ca243d
	.xword	0xc4d0ac8a19b863be
	.xword	0x5c59f97833b8a57f
	.xword	0xfa179d520c88051c
	.xword	0x58d47ab3c3f4dc8a
	.xword	0x796db74e9e1b5932
	.xword	0x284c2f4fdd8f4509
	.xword	0xfa73809f928eca70
	.xword	0xac72d8f41bb6301f
	.xword	0x2c058860c3f4f8aa
	.xword	0x18e653b1d76fb14e
	.xword	0x8737d10ea5af25ba
	.xword	0x88fae017042072ca
	.xword	0xbde1a963211c55ab
	.xword	0x19a398d1fb3b5030
	.xword	0x802c43b2d31089e8
	.xword	0xcf2103807de70685
	.xword	0x434c7681cac4e03a
	.xword	0x1eefdd6560c8e99f
	.xword	0x8ca00a551d4a0528
	.xword	0x9f02e8da439c7596
	.xword	0x8dfadc0ae3f5a19b
	.xword	0xd7c06da011e3e505
	.xword	0xa498fd7d716c8797
	.xword	0x00daf60965b8fe51
	.xword	0xa7a758a0467f6666
	.xword	0x335c32d81963c0ee
	.xword	0x009479505df5677c
	.xword	0xb5a0d8a9729e7628
	.xword	0xb845069ce28a6080
	.xword	0x60a734b09b6be1e1
	.xword	0xe90fa0d16cd5fc2b
	.xword	0x9657992d238b761e
	.xword	0xbf67a5e1eaff6563
	.xword	0xa7d7b9e2219c61c9
	.xword	0x2ca84d6e5480f2bc
	.xword	0xe83a1c08ab166575
	.xword	0x0696233f7085f76e
	.xword	0xb3f125379707a03b
	.xword	0xe5d52d15df2719ae
	.xword	0x70bae009ea6c9388
	.xword	0xe16b1e7982e30fa3
	.xword	0x60cca9296ba4a64c
	.xword	0x85f434cfdc0d74b6
	.xword	0xeeb75989f70a4ae5
	.xword	0x5e302122479569fa
	.xword	0xaaeec63792f89aa3
	.xword	0x4e64a33357d3be0a
	.xword	0xaf9493d80d921132
	.xword	0x32ad910a90f7ef1d
	.xword	0x604394d1853c79f3
	.xword	0x45d16c1e5323f2e6
	.xword	0x4cab6ad9167401b9
	.xword	0x0e237f7d38ee2f23
	.xword	0x1c18a9b5dabe36db
	.xword	0x08c4c8b72cfa0a4c
	.xword	0x3ec85b72c5bd211c
	.xword	0x7401208b037f7c9b
	.xword	0x21644b1b940309b5
	.xword	0xfeb806e9813e5b7e
	.xword	0x7a2398887d0eeee2
	.xword	0xbd485b85b862659c
	.xword	0x67d59f9360acf3f2
	.xword	0xc9a0d5330aa72835
	.xword	0xd09c0e8d8a0e791a
	.xword	0xe446ca52d0366382
	.xword	0xa5726b1c9ee32e39
	.xword	0xa7e24b8ce1823eae
	.xword	0xc902725385f122b3
	.xword	0x09e292dd0e2dc5ea
	.xword	0x2ca8effbd84fc6fc
	.xword	0xe7b16faa01544ee4
	.xword	0xabc1c381582d2f76
	.xword	0x3aef4c2347bbc3fb
	.xword	0x411438d8583db0b1
	.xword	0x616613f9cade338c
	.xword	0x5664b42b21243f90
	.xword	0xe7cb90d25cfd5b5e
	.xword	0x918e1a9f3544ac68
	.xword	0xcb527ea25ac45465
	.xword	0x2e7352e8adec2a0a
	.xword	0x3fcf0ded4112c62f
	.xword	0x3ee8863e7317dc85
	.xword	0xfbf17da50667b41e
	.xword	0x084b0bee71d8ad5f
	.xword	0x349aa6159cbda978
	.xword	0xa14c82ced34dbc70
	.xword	0xd4dcb20fc8dd7783
	.xword	0xe2eb4b3c9777dc9a
	.xword	0x235e06e48d872ba7
	.xword	0x20c75a3ba6b70884
	.xword	0xeb6743910f0febf1
	.xword	0xfc0b96d2d9a36e03
	.xword	0xc843599499308e41
	.xword	0xd07d0d1ea78520de
	.xword	0xaab0ee36cba8fd54
	.xword	0x4cc0166796bd4f4b
	.xword	0x68b400ac3cb01c1b
	.xword	0x6ba2ccef5fe8876e
	.xword	0xf51ce721cbb41f76
	.xword	0x8808948dc84b32c5
	.xword	0x086658ba53ebcb96
	.xword	0x1f83b081b4e5f79e
	.xword	0x7bb9f47c6e997e08
	.xword	0x43f73ce23648b4c1
	.xword	0x65c45030c4e43478
	.xword	0x0e6dc2aa009c2044
	.xword	0x8c248c3a0d1d8985
	.xword	0x530ac982243b8bf3
	.xword	0xeffff14f729a9782
	.xword	0x9552c19240eb307d
	.xword	0x9bcafdb532cac363
	.xword	0x0ea82a3f09886d60
	.xword	0x858c0049bbfcb754
	.xword	0x0154faae16eff30b
	.xword	0x5abb0cc193eb9487
	.xword	0xdc575aaa911a03f8
	.xword	0xe87e37cf24c54471
	.xword	0x17ef3d8b1116cbe8
	.xword	0xaf520a157bcfe7e4
	.xword	0x5eee2d3abcca4703
	.xword	0x16449b2bcedd776e
	.xword	0x4cafcbfbb26525a0
	.xword	0xb14353b05ba7cd04
	.xword	0xce76fc6e50dc474a
	.xword	0x9feef1b61d93b590
	.xword	0x51e51e8852767201
	.xword	0xb1e44d7ea1ac7117
	.xword	0x990d2f1bdcbf4fc5
	.xword	0xc27edd087bcc3bf1
	.xword	0xad3e463e3d07da7f
	.xword	0xc027f68211778b65
	.xword	0xe8cc0d609c31b5a9
	.xword	0xdbfe9ad79d406df2
	.xword	0x1ae03395639c640a
	.xword	0x8938126237c37abc
	.xword	0x13b1d066ab70d40f
	.xword	0x182ade34c510f0b5
	.xword	0x5f3777141d8b2430
	.xword	0xfaa6098dbcfbca2f
	.xword	0x6c518bb76e85ac09
	.xword	0x9dd3cff531663111
	.xword	0x728512d7b0e34fa3
	.xword	0x81b452f1f1f217db
	.xword	0x69407f4dde193008
	.xword	0x216bb9d275fda539
	.xword	0x7afa2de78c5dce65
	.xword	0x8c84bd93f6f43ae1
	.xword	0xd6fa709a357e88a2
	.xword	0x9ba38464ea0bc5e2
	.xword	0x3b877973268ddda5
	.xword	0x74a18478dfd23c9c
	.xword	0xcafc5b76e81b4cf7
	.xword	0x88b69fc096dff962
	.xword	0x04c1d176f5589aaf
	.xword	0x6d9c2070eb9e4df5
	.xword	0xc68a285cac35c93a
	.xword	0xa805ce4f59373e8a
	.xword	0x5ddf284bad6b12a4
	.xword	0xf73d31cf4ded0446
	.xword	0x1a272e57b8e90977
	.xword	0x9b6e2ab8d02146fe
	.align 0x2000
	.data
data_start_1:

	.xword	0xea49ed535de46f5e
	.xword	0x249856d7dc4a59f5
	.xword	0xf984725e88628547
	.xword	0xf1b51be9a2dbcd0f
	.xword	0x2c12c567409ed72e
	.xword	0x3d5d2e78026eae59
	.xword	0x10d1e888a8918f8b
	.xword	0x247f7a39879da253
	.xword	0x640c3b0cf439455e
	.xword	0x3782e7252d743983
	.xword	0xdbb111c0f80ae648
	.xword	0x1f04d5a60458aa81
	.xword	0xe4577e29022ecc25
	.xword	0x3902260944339a68
	.xword	0xe7ae7fa4649ec9bc
	.xword	0xa094b0631e3f0639
	.xword	0x93b2bc4cd6defa53
	.xword	0x2b3d789957e7e4dc
	.xword	0xdab0e1f02db83bfc
	.xword	0x58235af751b7fde6
	.xword	0x04fa09b1c90a24bc
	.xword	0x3aa55fa43ae75dac
	.xword	0x6c5a02d35de392cf
	.xword	0xb3896e2d1448d5df
	.xword	0x3e3a538003502a2c
	.xword	0xa6a32530c0f70d11
	.xword	0x1b66c8b640fd70bc
	.xword	0x5d377703315b9d79
	.xword	0x1eb9db6d32473a3c
	.xword	0x1417d5b737a06528
	.xword	0x60e06dc91fa5d933
	.xword	0x1e2b74f2d3453528
	.xword	0x3075bb1dbabe15c5
	.xword	0x7947b138e6df5e00
	.xword	0x421e5f346b1606dc
	.xword	0x9c7e12b184125016
	.xword	0xb0ca8b600d624ea1
	.xword	0x7e3f505641c3caf9
	.xword	0x7d46cd482338d766
	.xword	0x2d1bbc96b2254f30
	.xword	0x436eac2312b1bc32
	.xword	0x3976e9e3282d9213
	.xword	0x0de13c90105248f2
	.xword	0x8bb5744312fbf943
	.xword	0x8fdb73e98f30607a
	.xword	0x45bac02ec036996f
	.xword	0xc8605ce928bcae2f
	.xword	0x7c2d5159cd3d9ce6
	.xword	0x03ea492ae450e322
	.xword	0xc2224a5a8d53f33e
	.xword	0xe58e3b78bc873558
	.xword	0xbf59e8c72de061ad
	.xword	0x6ebc470ede4c048f
	.xword	0xd142e1f5084a4b68
	.xword	0xe2b629c540c03863
	.xword	0x0ff1e454cf12e158
	.xword	0x06ed6566236e9204
	.xword	0x133fd38aeb0c3c5e
	.xword	0xcdcf8b6be6e2e703
	.xword	0xaf9f86fc0e2b9c28
	.xword	0x85e7174671270e37
	.xword	0x30a75d0762f8e524
	.xword	0x8c62edd89a601d14
	.xword	0x40bac3c2643fd791
	.xword	0xe91e2a4e465aeb89
	.xword	0xa1046993174ab6d1
	.xword	0x7a921c158fc47b0d
	.xword	0x8a48f2ee49287032
	.xword	0xfb86652a92ec25be
	.xword	0x004f58ef903ebd19
	.xword	0x21eacb9b6e1d0325
	.xword	0x3d64ae78e43f8d1a
	.xword	0xb1c29129b4974338
	.xword	0xeab1cd86d1c9b71d
	.xword	0xf5ad0d8a0a5ab2ad
	.xword	0xe1d6061f17885bfd
	.xword	0xbf3ca6f09b9f5faa
	.xword	0x4feca4d06ecd25be
	.xword	0xe6ee4209dc5930ff
	.xword	0x848f3564ab8147e2
	.xword	0x2aedb6d6af398f91
	.xword	0xf0ac629569cb65ac
	.xword	0xb784f62c5089f285
	.xword	0xe87c0fac22d2ebd5
	.xword	0x3b572a15d006959f
	.xword	0xba0cb34bb92506eb
	.xword	0x44d56e377ccf151f
	.xword	0x410a62f8d223aa0a
	.xword	0xbcb599ef7150d4af
	.xword	0xe43969d1c2e8231e
	.xword	0xc099e8863336f10c
	.xword	0x312048661c19d1dc
	.xword	0x6c7620fb705dddbd
	.xword	0x2483c78df8675beb
	.xword	0x98c0b5a90d73c331
	.xword	0xde6ed1ea41594c46
	.xword	0x2c423360731617d7
	.xword	0xc4626fdb02bf85ce
	.xword	0x241a475e654f8a78
	.xword	0x18644ec58e7a226b
	.xword	0xb2dc1d24cd069729
	.xword	0x59dc61b6d7a80d26
	.xword	0x345df0f467a58901
	.xword	0x0e0f72c6d9f73000
	.xword	0x2d0bae4f4052b15e
	.xword	0xdba8f3f208b4b87e
	.xword	0x72efa037d67a24c5
	.xword	0x0cc84f741e30a043
	.xword	0x992f215879d448cb
	.xword	0x49dfd9d2fc88230a
	.xword	0x3b0ed3c931e6724e
	.xword	0x370273f186d27c81
	.xword	0xd741ef152861148a
	.xword	0x0586b8b895d54783
	.xword	0xe19af5e4018f0790
	.xword	0x43e6dce9daf4aa84
	.xword	0x8f4545c4c967e747
	.xword	0x538f2a69a686f5c3
	.xword	0xdc0381f709fac887
	.xword	0xe686555cd04dc285
	.xword	0xad12caa5d466d391
	.xword	0xdf1e65d34dcde7e6
	.xword	0x354daf2e6d868eae
	.xword	0x9f5d04da93610673
	.xword	0xada0e76e4323bb9b
	.xword	0x507d9072ca75740d
	.xword	0x7ae82cae8b4a39bb
	.xword	0x9d16617b6bf6d794
	.xword	0x14570206d030fe14
	.xword	0x99063b06501b019c
	.xword	0xff710298af7d0820
	.xword	0x4a864d5f7065fe2f
	.xword	0x8b7c8feeb8809896
	.xword	0xaa2c54ca8baa70e7
	.xword	0x67ad4818866f58a2
	.xword	0x80c96bc058fa8904
	.xword	0x00bb032e95168ddc
	.xword	0xe65bbfaae9c34096
	.xword	0xf57f0222339bafb4
	.xword	0x6e90255864010db0
	.xword	0x5a349f256833eb9c
	.xword	0x19bd00cbe6c35e7c
	.xword	0x1db60b53de70c0af
	.xword	0xbf40a913a89ad60e
	.xword	0x95a1771ecb81925e
	.xword	0xaa33cfe8121dadb0
	.xword	0xd3c3f0e95d2b8d83
	.xword	0xef2b0c9351da911a
	.xword	0x39e35704a14f47de
	.xword	0x972c115c34e6fcf1
	.xword	0xc103fde1ea844f76
	.xword	0xfb70f87c49a68fce
	.xword	0x81397219edb33693
	.xword	0x919fd99ec9217170
	.xword	0x1cfd72d80260de6c
	.xword	0xcd4c7b4b85387aea
	.xword	0x065120e73531d3a2
	.xword	0x82e39fa50d9fb4e1
	.xword	0x8eda0129c1ec05ec
	.xword	0x699b2bf1401506ac
	.xword	0x787dd4ed584f3600
	.xword	0xe00fb4e15d2596e5
	.xword	0x5fbebb047f9587cf
	.xword	0xbc5d4e99a6271e06
	.xword	0xd397fc7b5e045c7d
	.xword	0x0f1467050221ba3b
	.xword	0x7ad972ea1b6f58e0
	.xword	0x4af90d451564840c
	.xword	0x7acd42d12c0af0f7
	.xword	0x87f1b1757e145e1f
	.xword	0xba0dc1b8b95a3700
	.xword	0xdae0f496e507b45f
	.xword	0x9ed3409b67d6180b
	.xword	0xc13840951340848e
	.xword	0x22d58ac7ce4e5172
	.xword	0xdc18fb88802f0d66
	.xword	0x5fa726c033fd1ee5
	.xword	0x7080c90a7f88e463
	.xword	0x0b0acd85cf7afd91
	.xword	0x330732d62f0282b4
	.xword	0x59170b1161e8f228
	.xword	0xb3f95be12db481e4
	.xword	0xefa755282c7c9a9f
	.xword	0x64264c8454d78359
	.xword	0x41c54755baff5ed8
	.xword	0xde8fb1338245b296
	.xword	0xd8e0476745905dfe
	.xword	0x5d67615f36af0fbe
	.xword	0x77f3988f61ac2f37
	.xword	0x89508cd5fd43d672
	.xword	0xf08ed9b96341c244
	.xword	0xda136c4958b3f6a9
	.xword	0xc686c69886178224
	.xword	0x12d98f260d86aaa2
	.xword	0x2008a85e362e35f4
	.xword	0x2b05d4db6b2339d3
	.xword	0xc00005c64ec8bb44
	.xword	0x3d3b3ce29520dad1
	.xword	0x42602be86790e1a8
	.xword	0x68356c822e2531a6
	.xword	0xa99ddbd17302fc8e
	.xword	0xf997c5ecdf391ee6
	.xword	0xbe34f9db5a12cc7d
	.xword	0xbf7181218f1af04e
	.xword	0x1002084e118d58fd
	.xword	0x1f6c876992ae6727
	.xword	0x4914dfcde6fb3771
	.xword	0x68588f80de79e2c3
	.xword	0x231b79f07c8a854d
	.xword	0xf76ec9e48994e6d5
	.xword	0xc33e3307dfdc7cdf
	.xword	0xa5b51fd8639acb2e
	.xword	0xa02f27729f63fb24
	.xword	0xb5dec7592b760e8e
	.xword	0x38dccb46aba7035a
	.xword	0x82d8062ec0d30b66
	.xword	0x699db36e25e635b7
	.xword	0x7ab5f729f1daefab
	.xword	0x47d0b7b621762d4b
	.xword	0x1f983d124860823c
	.xword	0x282966086decc68c
	.xword	0x6d849b062cad5828
	.xword	0xc7888056503e19b1
	.xword	0x31e48a9d64155642
	.xword	0x900e27425de5cd0f
	.xword	0x07aef59fc630c0b9
	.xword	0xc1c2f381d3336dfb
	.xword	0xb2f663fc4f79a7ee
	.xword	0x3f7325d39d2fd72b
	.xword	0x534e237a36d54fcc
	.xword	0xbe3d953f23282421
	.xword	0x7c7767047a626cb3
	.xword	0xb656fb27b5d5f8ac
	.xword	0x5b03d6d61031920e
	.xword	0x1b7f909cf4133f81
	.xword	0x7f887f33c0c09a83
	.xword	0xb3bde14b4218d68b
	.xword	0xae42db6b157d11a3
	.xword	0x3055e3b65dc017c6
	.xword	0x8e10decafcb5ccf0
	.xword	0x0da230875aa90b89
	.xword	0x1b10bcd1043c3557
	.xword	0x1b1645b620033efe
	.xword	0xbbf926b464df8e5c
	.xword	0x77b163e0aede14b2
	.xword	0xa454722549a07778
	.xword	0xda7bee84cdcb50d5
	.xword	0xa501a6522c2f3db6
	.xword	0xada6b81a26f55227
	.xword	0x8ba9d2b81e574c01
	.xword	0xe853890559062254
	.xword	0x61a02d467993cbd4
	.xword	0x9576ebbca615c3d6
	.xword	0xc2b67c174bbc0db4
	.xword	0xd21bb40ddf982f0a
	.xword	0xf2c33f5de0a25de7
	.align 0x4000
	.data
data_start_2:

	.xword	0xcd85527599031bba
	.xword	0x70965e2c52e5707c
	.xword	0xdb6262c649bf901b
	.xword	0x22e72d5a1042124b
	.xword	0x975401aa7b5c02ad
	.xword	0xea498438dc83e315
	.xword	0x343ebf8c74c58fc9
	.xword	0x610d0ac744acd4c6
	.xword	0xbadb8372ddb287b4
	.xword	0x2503a98f3402fa5b
	.xword	0x5a4f0f62710d3877
	.xword	0xb8a9a238240ec8a7
	.xword	0x5b5a0b55ea34375e
	.xword	0x244c2bd2fed6e13a
	.xword	0x6162481792d877b3
	.xword	0x9aa0756943a16ef2
	.xword	0x4ff55f814257156b
	.xword	0xd253c997811e84e8
	.xword	0xde22c14cfd128223
	.xword	0x1fe92988788b9b9a
	.xword	0x63a12712d3a29b2a
	.xword	0x59fb5be516487563
	.xword	0x36c6bd0e8f00dbae
	.xword	0xf261d92b1777dd27
	.xword	0xa81105ddc6089d06
	.xword	0x29f29d98df7ed61b
	.xword	0xf5e70f9c67c898ca
	.xword	0xcee4080eaf31b6d2
	.xword	0x57359ef55ef722f8
	.xword	0x67c8a9576c1c6cc0
	.xword	0xf48db3921583a13a
	.xword	0xbb4b55e0a0c202b5
	.xword	0xc4b4095585a2d006
	.xword	0xfe13aa9665b21b8d
	.xword	0x15b9b637725f0a98
	.xword	0xbda0c30caea6b136
	.xword	0x354c4ecba7a355bc
	.xword	0x86427497f5ef3a7d
	.xword	0x1485c6495c3a4b6a
	.xword	0xf1037282b303753c
	.xword	0xba25e2956d2a66a5
	.xword	0x052a2c9ecc577abc
	.xword	0x66379ad0acaeb170
	.xword	0x3490169f25e70dae
	.xword	0xf1db2838b80551d9
	.xword	0xfda91dac76026a77
	.xword	0x605b0d32f6e6d3b8
	.xword	0xa9ed68720997a78c
	.xword	0xb4e23c4601941eca
	.xword	0x679b437c12e287ef
	.xword	0xfb2528b79466292f
	.xword	0x0e66c6c0f19fd358
	.xword	0xcd9d27e73a5363f4
	.xword	0x43a099a94860c18c
	.xword	0x72f0d9c7e6eb00de
	.xword	0x17accbaa3f369b3e
	.xword	0x50037fae125907c0
	.xword	0x5c6855ecb9245553
	.xword	0x61048f61ef034a82
	.xword	0xe523ceef78c584dd
	.xword	0xd55b2bdda00f4c96
	.xword	0xb493a1fa20c098a5
	.xword	0xf17d78aba41b38ac
	.xword	0xf5c0f2172e346f19
	.xword	0x14a4e7fbf6664f4e
	.xword	0x07f9a0b689ce3861
	.xword	0x05349dfae78971ef
	.xword	0x3f630bd4017c5e43
	.xword	0x35330816287a78d5
	.xword	0xce0e392000e80014
	.xword	0x3dab1eb1bf4c9fb9
	.xword	0xb08cc59b270cd37c
	.xword	0x829828c51d87f96a
	.xword	0x4c3569b35c90f1b8
	.xword	0x71d8ddc67d3d0c6b
	.xword	0xd63657d3a245716f
	.xword	0x0c3ac9a315dffbac
	.xword	0x2174dffda751e1d5
	.xword	0x3a850a1c04143278
	.xword	0xd81b60f8002f8760
	.xword	0x893a04fd91e567a6
	.xword	0x513e553d88493a8c
	.xword	0x1d1f380fbec47976
	.xword	0xf3cdd6e8170ca3c8
	.xword	0x12f0f68cde9050c7
	.xword	0xbe5d1dae140b04b5
	.xword	0x74a8d3e06d7693b4
	.xword	0x10a855521f6a6f52
	.xword	0xd87d4e86eee893b8
	.xword	0x100236dbe21252ab
	.xword	0xb74714fe565d7dac
	.xword	0x95a1dc2fcc834000
	.xword	0x0fb1e79182b0d2f2
	.xword	0x65404d026e7c7005
	.xword	0xba3c7a108a70915c
	.xword	0xcbb83220812dff26
	.xword	0xa19c5ebca142d337
	.xword	0x06827715be31c262
	.xword	0x64467ad89e6f4fe7
	.xword	0x90abdd988cb5c04a
	.xword	0x3a6cc4efd179c56b
	.xword	0x42352c1b0fb423d1
	.xword	0x6afd72364c880900
	.xword	0x887f3d922fa643aa
	.xword	0x13ac505db24f186b
	.xword	0xc695c81bffe9b763
	.xword	0x7f6ed67d73591041
	.xword	0xd4533e0f07736569
	.xword	0xc5ecec53fb07d9ce
	.xword	0xf1df2bf8c339461e
	.xword	0x1f7a054a69ea5290
	.xword	0x8c7d9afa81b9b497
	.xword	0x9ec7bcdecb2915a4
	.xword	0x8052329e5cea9dea
	.xword	0xad9457fec9206d05
	.xword	0x560aa46d8cbff628
	.xword	0xb18f9b4378181181
	.xword	0xe6cf6865a05111b3
	.xword	0xbd4ab6ff12f99c67
	.xword	0x9a7243627b222811
	.xword	0x8877a060c5905e53
	.xword	0xbfb89307601c0b44
	.xword	0x6a4daffc36fc0754
	.xword	0x01030cb3df1d084e
	.xword	0x5aa162a2c584788f
	.xword	0x972501d0ec409c15
	.xword	0xfe342fe9dbf379b6
	.xword	0x22f5fe0a1fa37a75
	.xword	0x50d2c9e00f2a282a
	.xword	0x34aedde6dfbff274
	.xword	0x73569af96cf5928f
	.xword	0xb7843b52c6fa2f65
	.xword	0xde7872ec2f563b80
	.xword	0x77037162591abec9
	.xword	0x6e5c476a8152f9bb
	.xword	0xd8855a1058b35645
	.xword	0x0e30ab367e7ecabe
	.xword	0x69ade1d7bc119267
	.xword	0x74b4b68a6bf34da7
	.xword	0xaa24d7dc8347936d
	.xword	0xc2a9bf077f1a490d
	.xword	0xfde79649c90123a4
	.xword	0x41f28d85e6296e4a
	.xword	0x5268b80b6522e7a1
	.xword	0x6556da3222a7499d
	.xword	0xf038004fc94044b1
	.xword	0x7de75764824e576a
	.xword	0x357dcd21db4c6777
	.xword	0x1e647bd7d0b9b304
	.xword	0xa5f110da226ccbd0
	.xword	0x8382502f0dad673e
	.xword	0x74a7718c019f4897
	.xword	0x85cecdebc82678be
	.xword	0xffd1bcd35ada8980
	.xword	0x6dd01be3f19beee5
	.xword	0xa1ba49bf1454c739
	.xword	0xed69393b3304dc3a
	.xword	0xa491399a7615eec0
	.xword	0x34b8875a07197025
	.xword	0x4a689a1cf066f41c
	.xword	0x5bf2e108b0aaef4e
	.xword	0xdb82cbcab2e67fbd
	.xword	0x00d8a6e9c7882cd0
	.xword	0x501fbab1126fa907
	.xword	0xe9032001d3391764
	.xword	0x4b44e923f49605ea
	.xword	0x302008692cb18af5
	.xword	0x3b6f687f7df5214c
	.xword	0xdee7f99a0d152599
	.xword	0xd0e6909daea6d552
	.xword	0x7dc100d13adb0ec2
	.xword	0xee86a94de4f93d68
	.xword	0xb2449eee74751afa
	.xword	0xf01c61bfea33cfbb
	.xword	0x23cfcb217b9875ab
	.xword	0x211e63d1daedc49b
	.xword	0xc245d97baf456a0b
	.xword	0xd916dea0fb1b27af
	.xword	0x7ff16c1d30117f6b
	.xword	0x9987f9d31264c8a2
	.xword	0x06d822776084811a
	.xword	0xb40c9422b07bede6
	.xword	0xacfeed6b16de2902
	.xword	0xd96afe0b300fe72f
	.xword	0x62d1cf1f2c72ab1f
	.xword	0x1184965eb34dede9
	.xword	0xef8b966a61576366
	.xword	0x782cf28d72133e56
	.xword	0x3abab9c0eb6be1b8
	.xword	0x8603ca36af198d6b
	.xword	0x69659e51dfeb3b25
	.xword	0xce052b44221579de
	.xword	0xcbb2b9c12bddd6df
	.xword	0xc27d6dd9b5465aae
	.xword	0x3c5e1eca1b3a9925
	.xword	0x1297d332e2ad768b
	.xword	0xd158a637b398337b
	.xword	0xe566e7ce5f98b622
	.xword	0xb83d9eaf5d1c8244
	.xword	0x47b24dff79f8c82c
	.xword	0x30bc527d444b2c57
	.xword	0x2f53bdff4c28402e
	.xword	0x34b1712b9656d6b0
	.xword	0x91027e012af2294d
	.xword	0xdb2b7e7aff48aa30
	.xword	0xf565e71f734f951a
	.xword	0x07a697b7e0e8733c
	.xword	0xc9c518bc8408131e
	.xword	0xe7816b1f1e316caa
	.xword	0xa2135b46309f8c4e
	.xword	0x188b94531a0a6cf6
	.xword	0x57a1ac1d454af57b
	.xword	0x983077073ce39edf
	.xword	0xbd56f483a4fcb61a
	.xword	0x6e1f46d24cf4397c
	.xword	0x14aba79d13d1d004
	.xword	0xcb8e88adf11c8822
	.xword	0xd928cab08752d8ee
	.xword	0x2e74bc84245469be
	.xword	0xbcd4ba25f586f55c
	.xword	0x4f7073e9cfcc4673
	.xword	0x5246221530b4c336
	.xword	0xdf23aaf99d0d66e2
	.xword	0x930af30e7cea0274
	.xword	0x020fbf7ec01d0d56
	.xword	0x1f6b6448b2638a3a
	.xword	0x52329281d28142ff
	.xword	0x5a9e3ae8f86c14e3
	.xword	0xa6aad794d9cc95cb
	.xword	0x268dd79456d5501b
	.xword	0x2b7a95ec5b7bfa6c
	.xword	0xfbdb66fdf0bcc997
	.xword	0x8b98a54e23c1e991
	.xword	0x1b6ae6b6850e6e01
	.xword	0x5cb8bc7293ee6095
	.xword	0x12c6c0d50954a174
	.xword	0x3486dc607b114645
	.xword	0x7c5229cfb7a7132f
	.xword	0xf77c4b92b813fd8b
	.xword	0x0be42d5fec19afcf
	.xword	0x3d7442bc7eed1339
	.xword	0x3a2334dd9a602a1a
	.xword	0x2c56fdb8f615eac1
	.xword	0x5e885e5b64a6600e
	.xword	0xee73901288627fc7
	.xword	0x141d66df54fd3e23
	.xword	0x86d4f01318152e16
	.xword	0x490d941505296c67
	.xword	0xf494fb239093f039
	.xword	0x70c57663a73abdb2
	.xword	0x9f7961f54f51850e
	.xword	0xbdb4c774e882e126
	.xword	0x6a2478b1860f8bc7
	.xword	0x856ae1bfc7c5611a
	.xword	0x90062e26f3165f47
	.xword	0xb9c1ede265e73949
	.align 0x8000
	.data
data_start_3:

	.xword	0xcb3851151e9e96ee
	.xword	0x594a27d6744f2b78
	.xword	0x18cf2cf966b33d48
	.xword	0x74809374c43c8da2
	.xword	0xaeb278acf003162a
	.xword	0x9b309f3f24ffe0dc
	.xword	0xbeeb0c9e43e89bb8
	.xword	0x6ca4e04dfa46c107
	.xword	0x70d729a12bc9e44c
	.xword	0x98552c67c411806c
	.xword	0xff0cc20b412cabc5
	.xword	0x16f494f07da96350
	.xword	0x261ab7c91902f938
	.xword	0x1f5b905654b837f5
	.xword	0x5ef5319ec3f589d9
	.xword	0x22201bf86e033ec2
	.xword	0x71862f14c56d1ba3
	.xword	0x7a85d1acdd10525f
	.xword	0xf09cc711505c7764
	.xword	0x62d6576f3bc8b7e8
	.xword	0xe8f19706272d7e83
	.xword	0x71113dbb5db736c8
	.xword	0x253467299ebbc988
	.xword	0x635de791ffbb51a7
	.xword	0x8bf6a568c51f30d1
	.xword	0x88e50ec132b54985
	.xword	0x82653c2246aaaa90
	.xword	0x9d2d9325b6d48cd5
	.xword	0x1f46a2522bd69c91
	.xword	0xcaa20957fdfc9749
	.xword	0xc5801198135edcd6
	.xword	0x3a9bf77651686b65
	.xword	0x443e418295468f56
	.xword	0xb3b8870b40df7394
	.xword	0x176ec49252ac2826
	.xword	0x04c181b1541f61f2
	.xword	0x790cf067556aa55a
	.xword	0x5c3ac455a844dc5d
	.xword	0xe84200183beb2e43
	.xword	0xeb60b36d1c467695
	.xword	0x01e0ad6f61652477
	.xword	0x694f167ee80baab2
	.xword	0xcf7d3cc9e0da6612
	.xword	0x9032ee2e56fcad9f
	.xword	0xef5cf02a29ee03b2
	.xword	0x7cdd08ba6fbd0f51
	.xword	0x3cc587d4d894f5d8
	.xword	0xa7127f2f57173cd4
	.xword	0x88100ab46b8668e7
	.xword	0xc04d35ab5149ddd8
	.xword	0xb394256727c3782d
	.xword	0xd3dd82898df6ce21
	.xword	0x9816f5ad0aeb00dc
	.xword	0xf0ed015b3b900dbb
	.xword	0xaefb9f632d5e21d6
	.xword	0x974673df8497cb65
	.xword	0xad7bb47597f1b9f7
	.xword	0x89bdf55942da01ba
	.xword	0xa06d1c1260b52773
	.xword	0x3874487993dea273
	.xword	0x50a338d0da0d3c10
	.xword	0x81572ca2fd97049f
	.xword	0x623a71628f774d77
	.xword	0x3af701091e24b3fa
	.xword	0xd442fb0aebc90bff
	.xword	0x758f24b490b4f13d
	.xword	0xc29cf9888d652f98
	.xword	0xcd9c13933d7b293e
	.xword	0x8202840d6cfac37a
	.xword	0xdd0d582aacffc57f
	.xword	0xe4749790a87805ac
	.xword	0x4087de2dbdbf20e6
	.xword	0x0b5c381b9b9d8a97
	.xword	0x556bd6747b985d7d
	.xword	0xb732783788ad8cf0
	.xword	0x3a5361db9e4871cd
	.xword	0xd2b4be5ff618e051
	.xword	0x59bed6d32e8dd67f
	.xword	0x6f66a9581af23cf2
	.xword	0xedf653df00694f9d
	.xword	0x1d53aec4751cc065
	.xword	0x81a7425d68eb5d84
	.xword	0x3bc8176dd4cfe535
	.xword	0x3d09f3167fb2ab6a
	.xword	0x8fc3334b6c3cc548
	.xword	0xaf4a5669130e3624
	.xword	0xb2baf864b589bfbb
	.xword	0x73757bffceebe77f
	.xword	0xe2921bc29dfe15f3
	.xword	0xe77af391455b1b8c
	.xword	0x8dd3040af91e6227
	.xword	0x120c96ee2a0d7c86
	.xword	0xa6c3aff585fbafcc
	.xword	0x20783c71a438f89d
	.xword	0x5aacfb9416fdfd80
	.xword	0x7351d618b07c1567
	.xword	0xf2955687e31edab7
	.xword	0x48c86d7f8017598a
	.xword	0xaf48b43dc9074927
	.xword	0x6082c12b8eedb15f
	.xword	0x5a895be2fa7f5a26
	.xword	0xe89fee4e8e956813
	.xword	0xa93d64164a472ea6
	.xword	0x8bcaa6d70ad08ac7
	.xword	0xac21b301c7bf7746
	.xword	0xd275b6164008b353
	.xword	0x6f82ca7292a82b5d
	.xword	0xf9228ebfb76d3908
	.xword	0xb4ee9fdb94dbb5d6
	.xword	0x92a76abf9f5ec6c0
	.xword	0x41bdb8768edaf28d
	.xword	0xcdcca31f068a18dc
	.xword	0xeecd5c0faed7f5f9
	.xword	0xfb828700191ec7e3
	.xword	0x31357f931d9eb463
	.xword	0x779f5dc18689dbbc
	.xword	0x9f0d2d436c4ebdc7
	.xword	0x3cb9d3471a944e00
	.xword	0xb3e61a8ab6532fae
	.xword	0xb51c72291179c77c
	.xword	0xb96ca2199df0aa8b
	.xword	0x308bbc5d01a6d4a3
	.xword	0x5480b0e151e3c042
	.xword	0xd7bc836ac1b8a0c0
	.xword	0x673f551f03c445be
	.xword	0x2d6e4504ef924bb7
	.xword	0xa9615b8647ec5f30
	.xword	0xa087a3b442a5a013
	.xword	0xdaee95380720ddf8
	.xword	0x136f4b8e68e6af1c
	.xword	0x8d19e516deb849cb
	.xword	0xc421035febdb33da
	.xword	0x3fde495e058e2492
	.xword	0xbeb1182ac4010d28
	.xword	0xcf9867d82b626e49
	.xword	0x8b37ad0305482484
	.xword	0x0e99fc6aab6d60a7
	.xword	0x543fc0a2fda50009
	.xword	0x6c49764d84b9dab5
	.xword	0x411cd946dca0935b
	.xword	0xbe75bb9bc7ab4dce
	.xword	0x45a891aa87aa1d13
	.xword	0x3124d30f46952d25
	.xword	0x11f434430f0b77f5
	.xword	0xb0b910c2955bfd6c
	.xword	0x512d371690fc30b6
	.xword	0x47b04db6e326c669
	.xword	0xfe018a1edcdc9b11
	.xword	0xad5e56bb9e6fc0f3
	.xword	0x40206e856c19f0e2
	.xword	0xaf4bdb0866b5d881
	.xword	0x317cb151f18e8b14
	.xword	0x17a0855eb4121ec3
	.xword	0x74ba5c233f16d507
	.xword	0x726d20ff171af902
	.xword	0x21d7c3cd0dccba2f
	.xword	0x53e528f432656ed3
	.xword	0xb83d71dcb97769ed
	.xword	0x7059391b578b9df8
	.xword	0xb8c39c2d86864dd4
	.xword	0xc7651065af53e20f
	.xword	0x32c26ce3ed728031
	.xword	0x0a4d61c81e318476
	.xword	0x227e2c82a815a30c
	.xword	0x014fcecec74a94d2
	.xword	0xcfd1073798dcdb27
	.xword	0x6452fb4ffd0f402b
	.xword	0x11f21a257d6be21f
	.xword	0x047083e3f15b8569
	.xword	0x83bc1147205232b0
	.xword	0x5aca927769126648
	.xword	0x8200d61e2b4558d1
	.xword	0x0501a339d0551562
	.xword	0x0888372795812a08
	.xword	0x09a6783777b56f94
	.xword	0xaa2b3de02d1f407a
	.xword	0x133eda93a6f4dd34
	.xword	0x636453c2de988db3
	.xword	0xcaaf04707b838dd4
	.xword	0x604f5668c8a2d7ce
	.xword	0xd11fe418434e6768
	.xword	0x1ffc3041fcfd6bd4
	.xword	0x17e60d9e3873c3aa
	.xword	0x6f7ecc0c8cb2c721
	.xword	0x620d1c8d953f2999
	.xword	0xbbb235a353465347
	.xword	0x2d46d7028fab8499
	.xword	0x3a8bb970f344a18a
	.xword	0x10ebc7bc2001d625
	.xword	0xc0eb2cb0d0dbecc9
	.xword	0x1463dc0187fdc906
	.xword	0xe5a3321725b0c341
	.xword	0xc1ae2c49d9a1b286
	.xword	0x564d5e14d6e318ea
	.xword	0x6acd543dc39ccc58
	.xword	0x59296b6268b8d1bd
	.xword	0x4fd77aac7969bb0d
	.xword	0xd97425012f4f9b6b
	.xword	0x238f97f2479e54dc
	.xword	0x90d76b27e6ca0445
	.xword	0x7f1996d097392ed2
	.xword	0x7678214149e44af9
	.xword	0x4861c0fae05afeb2
	.xword	0x792c6a9b28b18880
	.xword	0x8f158058d0674ee2
	.xword	0xcb18f7503e801bf0
	.xword	0x58e3c4edbfe2e15f
	.xword	0x12a9b09fe44f49d6
	.xword	0x3b8333a0e757b0e0
	.xword	0xfec8de6ba43d573f
	.xword	0x2de6a81d70cfb1f4
	.xword	0xe77eb9a796527267
	.xword	0xd6e4987905049c92
	.xword	0x2ee057d14b0510a0
	.xword	0x06e65fbdae36c460
	.xword	0x286d78ae3e918d22
	.xword	0x27c85f87e4f8eb76
	.xword	0xa747a866f0094ef3
	.xword	0x3d430ccccfefa7d4
	.xword	0x90cb05908043afd1
	.xword	0x06dfed09fa06b470
	.xword	0x75f2d2783c538a6e
	.xword	0x79dee33367a774eb
	.xword	0x5e7067da53ee7d80
	.xword	0x3e20da537474e9d7
	.xword	0x59f00f6e125d8cd2
	.xword	0xb03feec26ea90a17
	.xword	0x81f88151d97fb707
	.xword	0x34b72dd2ab0a2f8a
	.xword	0x105fb55f7d59f111
	.xword	0x3a774bd42ea5c971
	.xword	0xc813e5efea9c6bf9
	.xword	0x6055946b07c20ed9
	.xword	0xf50939953b4b95a6
	.xword	0xc015878ed8b5ca6d
	.xword	0xded9b3e4b9d92fe0
	.xword	0x10b29c7f5cfd5fd0
	.xword	0x5930865fbf83b494
	.xword	0x0448cdeb3c8cba44
	.xword	0x116b7829088510da
	.xword	0xcd0f93de85c9f3e1
	.xword	0xffd66b65e67c9d87
	.xword	0xa76cb97fdef0ac94
	.xword	0x461da63e5bf8d3f7
	.xword	0x3bc37c8129f4cfdd
	.xword	0x9aa3c748454d0dc4
	.xword	0x9d327046732881ab
	.xword	0xd813b1864844da51
	.xword	0x2e8ce11e7d865353
	.xword	0x61aa32e0302937ce
	.xword	0x459e4fdbdd79bebe
	.xword	0xb0b54d80de31b9e0
	.xword	0x733fe63ab4017651
	.xword	0x9cf41f58ee5e3e35
	.xword	0x2cc65d570ee2493c
	.xword	0xd811da6c17c1e6c5
	.align 0x10000
	.data
data_start_4:

	.xword	0xd6ce999f7bfd11e0
	.xword	0x34c95e202e010e53
	.xword	0xf914539592cdaf21
	.xword	0x65926b122ed36c47
	.xword	0xae76eebc403b6cc3
	.xword	0x9dfba60935f77d6a
	.xword	0xae08d93f8f13d3f5
	.xword	0x60a6774ea2b78989
	.xword	0x65f15a1cc83b0b03
	.xword	0xf0e98043527a697d
	.xword	0x43c8db7d19e9f678
	.xword	0xd507cfb294f2add3
	.xword	0xc32af352a637fa36
	.xword	0xa8d72aed40ad3bc7
	.xword	0xd07a12ab0f2e48b4
	.xword	0xc939dc2330fcfa69
	.xword	0x8830c19195f3dc28
	.xword	0xb7d730865d50b65c
	.xword	0xeb07cac211a6caba
	.xword	0x5d4685c0e6910a81
	.xword	0xb63986d62d23f215
	.xword	0xfa9c8ff87ace71c7
	.xword	0xa39ee4acdaa5b50b
	.xword	0x3b866a253932efd4
	.xword	0x1945485bf36d71f8
	.xword	0x8667bbe928a9bafa
	.xword	0x973e03e39bb24ce7
	.xword	0xf69365ea91556a83
	.xword	0xa9273f369b719460
	.xword	0x99bb4bb30b6c7e42
	.xword	0xa997a6ec4b4a70e3
	.xword	0xa11c18b7dc053603
	.xword	0x1f96f071c6f597a9
	.xword	0x2eae8225d91679b0
	.xword	0x4d6768ffbd995c46
	.xword	0x5f9b9d20dd6daaaa
	.xword	0x9e0c977b266d0f76
	.xword	0x88cda66e35b64bb3
	.xword	0xeddbb6a19dd40c1a
	.xword	0xf740148622339a90
	.xword	0x5ea2c701edb7a2ed
	.xword	0x862ed81a54a23d8a
	.xword	0x0b7485a997d5a7ac
	.xword	0xf5532ce08849cb0d
	.xword	0x6dec970620e7c9bf
	.xword	0xd99cf0b76ab38113
	.xword	0xc0fc1f544b0b7f9a
	.xword	0x033194a0fd50d456
	.xword	0x81c382f6646b795f
	.xword	0x3dd3531b571baf71
	.xword	0xfd2bb98310716d25
	.xword	0x49e0797797334b7c
	.xword	0x05944d621086dea8
	.xword	0x32e445ba81be6776
	.xword	0x569eeb7689df80f2
	.xword	0xf0253f4b4442e0e8
	.xword	0xc59baa24e619da71
	.xword	0x7dd55fb5f152290a
	.xword	0x5bec3df4e19b1434
	.xword	0x7a429e2c2498e217
	.xword	0xd4f8b1b7513b243d
	.xword	0xbdaeb9dad3431dfc
	.xword	0x79b30110e635af57
	.xword	0x013984d792641821
	.xword	0x42f9e5bb2619ee5e
	.xword	0x09178b2ab55ef48d
	.xword	0xab8481d12f3b5c0c
	.xword	0x4e246bdd96d83265
	.xword	0x6b6874fc85175ba2
	.xword	0xc339cb918cd8eb96
	.xword	0x4049b64079589e3a
	.xword	0x836f9e796dd176be
	.xword	0xae4d27f3bf842702
	.xword	0x705a8a32ee75fde4
	.xword	0xc3e66f4b18ac68be
	.xword	0xeb5d3fd65a302fd2
	.xword	0x46e5f51ff9c71c91
	.xword	0x32a897956b871f68
	.xword	0x98e53fbfefdc80d3
	.xword	0x7e6fe790d2a71d96
	.xword	0xb5256da10767d57a
	.xword	0x3c9e59ec4f2eab54
	.xword	0xe5618d53856aadc6
	.xword	0x692b7a8cc951a59e
	.xword	0xc9c58c235021508c
	.xword	0x1daf49513eafbbae
	.xword	0xd9ac5f9704ff80a5
	.xword	0xd62aaf8f5c0cb9aa
	.xword	0x7e71a87626552922
	.xword	0xd1f70783888509a2
	.xword	0x2dce844902608691
	.xword	0x7f946ca95f9307a4
	.xword	0x9e0a02e34f4638e3
	.xword	0x1ea308d431480769
	.xword	0xfa57713921f0594d
	.xword	0xd1bb702c307462fa
	.xword	0x71d3569296e660a7
	.xword	0x0a697ca8f1e6dd71
	.xword	0xbef5b57b72d4e8ea
	.xword	0x0ae304a6889c77f4
	.xword	0x3299c7e6570a87db
	.xword	0xfb404dedca419e63
	.xword	0xc15960a1eaf90cf6
	.xword	0x51dc94dcdd68517b
	.xword	0x25a84924efc9054a
	.xword	0x6615f5233f38eb65
	.xword	0xc042eea18633669a
	.xword	0x4f0c81177beffd77
	.xword	0xf3aa8374543fabce
	.xword	0x50846eb5038300d0
	.xword	0x06c24a38f977ae26
	.xword	0xe479004d5abdf180
	.xword	0x63d653840d4552c2
	.xword	0x151879c8b7153de6
	.xword	0xb9570e1b85fc15e7
	.xword	0x307755dbc2e956b0
	.xword	0x3e186c3ed3e77a2b
	.xword	0xd7f9d2870fd60d18
	.xword	0xa13ed0b8292c495b
	.xword	0x24ad34625e225b85
	.xword	0x34e7d4ebbd07628a
	.xword	0x93b967a95231fd51
	.xword	0x297b00530d29b218
	.xword	0xe80b17fa8624f351
	.xword	0x1c6c374b60a55b0a
	.xword	0x30688d334a4b54b1
	.xword	0xdd560c4dde85a344
	.xword	0x3b41c71a5545f139
	.xword	0x79004393914aa0f2
	.xword	0x2cafd01dd1f1fae2
	.xword	0x25fd0960f7e569f2
	.xword	0xd7b62a1c14f6b0c0
	.xword	0x0cf8fb9bfa78fa74
	.xword	0xbfd0eb1770e6b1db
	.xword	0xbb3672ca64ce9c93
	.xword	0x09b7a1e9005b323a
	.xword	0x644d0db08c62f2bd
	.xword	0xb193f0d0948fd976
	.xword	0xea11cb571ecca992
	.xword	0x677b86cc4bcdc178
	.xword	0xcfb42e0dba6ff5bc
	.xword	0xa925148c9989a0af
	.xword	0x4330ea8ec8728c1a
	.xword	0xdb00630f7c92eec2
	.xword	0x5e28afc0af9e54ff
	.xword	0x3adeab53dfade078
	.xword	0xa4f9df6fd95fc1c1
	.xword	0x9c6ad3bdc54b253a
	.xword	0xb73ebd62d4f95564
	.xword	0x3ba73b68a30250b7
	.xword	0xfe25df8e7392df53
	.xword	0x0c492ccbd2b56ca6
	.xword	0xd30c8ba948381656
	.xword	0xe1699e903b2d8f1f
	.xword	0x8ce00df4ebfdcd9a
	.xword	0xcb1a6dd963ffe219
	.xword	0x8276a2bb4c3a55f9
	.xword	0xd4b221087e04cbe1
	.xword	0x79a97c99ba708407
	.xword	0x89aa570d502959d3
	.xword	0x02d5612f92212be4
	.xword	0xbe3a1d417cc5663c
	.xword	0x618c1c4178c06971
	.xword	0x9c2c89053b8be257
	.xword	0x9cb23b1d2234657a
	.xword	0x27cb67cde2795be0
	.xword	0x75e4a664927a4bb4
	.xword	0x68fe3aa3441ecc2d
	.xword	0x1dc454384a8321e5
	.xword	0xfa426ecdbc9c1644
	.xword	0x69b55da83a7f6ced
	.xword	0xef749f559765d316
	.xword	0x50e8b3678df62f67
	.xword	0xaa70e9e11bb33862
	.xword	0x23a3b80c41d2f189
	.xword	0x61445519fa2808bb
	.xword	0xb15a5e7f555c7461
	.xword	0x94b18ff4334b57a1
	.xword	0x7479dfae80a01284
	.xword	0x77430fef998669eb
	.xword	0x7baa8bac3ae9b576
	.xword	0xdf2dc5db4a69b36f
	.xword	0xc95e10dcc0afe7a9
	.xword	0x7b6831d51a2c5de4
	.xword	0x0cfafe6a25e80708
	.xword	0x35e9f2a25f2c2671
	.xword	0xac9ade608835986e
	.xword	0xb78f92c04eef0b59
	.xword	0x1c771a00ef3c1f0d
	.xword	0x96abd4cdac2be350
	.xword	0xf18b6b4e7c7f7e4f
	.xword	0x1532a130f4761b23
	.xword	0x9e7afd111bedac97
	.xword	0xcffad2778bae4cc9
	.xword	0x9bc7b763720136de
	.xword	0x550ba56d261d059a
	.xword	0xa308fee7b298c9b8
	.xword	0x39a4b1e1d4164cc5
	.xword	0x83f4188f4e7ef438
	.xword	0x8a61f26f9ba3bb62
	.xword	0x73475bb8e9552985
	.xword	0x52abf1538bf8e0e6
	.xword	0xedcf781954497157
	.xword	0x12987dd568811cf5
	.xword	0x8102db8c77b1bdd7
	.xword	0x97541bcb79b2fab0
	.xword	0xb72377dd990ac755
	.xword	0xa5033d62829671f9
	.xword	0x75b5b0959502ef4f
	.xword	0x6276a3ef124d4bb4
	.xword	0x41c045039a60146a
	.xword	0x49cf2592429de4cf
	.xword	0xf978e59edb8ae2e6
	.xword	0x3c33c36b3af4f91b
	.xword	0x020868ccda28881c
	.xword	0x2b86fbc37e7319c1
	.xword	0x39959050d1e9988e
	.xword	0xd34d8745bd6bfa64
	.xword	0x81eb3b821a044145
	.xword	0xd539164a303c5ecf
	.xword	0x0123467f080a6a37
	.xword	0xcbcdb539d4fb0e9a
	.xword	0xcece18806cf6ce7c
	.xword	0xbab6d5ae0485c425
	.xword	0x29afd1dd87ead3ec
	.xword	0x47a82086739d0a63
	.xword	0xc9805de45441832a
	.xword	0xc97590d21db980d5
	.xword	0xe89547b922f137e0
	.xword	0x76dfe6b9c5582532
	.xword	0x1cf1f093666069da
	.xword	0x3f3fb85dd965ed9d
	.xword	0x00dd57e45b88ff99
	.xword	0xd153cab40d7f3b0b
	.xword	0x9ed49a1848eff7ee
	.xword	0x5c0ffb718a09092e
	.xword	0xe861fa0a82e6ba83
	.xword	0xf60cb35ab0a6119b
	.xword	0x6766b336d39818ed
	.xword	0x2ba7ba077279d97f
	.xword	0x5618a4195a61a31a
	.xword	0x338eeb8ecabba223
	.xword	0x4432f32f2a40785e
	.xword	0xfe4989f2b5e51785
	.xword	0x88c764216c1f2201
	.xword	0x38965f033c5df22c
	.xword	0x78b7ed5514161f3a
	.xword	0x64dde12f62c5d59b
	.xword	0xe309c08db810cba5
	.xword	0x58466b51f2deb80f
	.xword	0x52214ea1c3f1d9d7
	.xword	0x921a0303f8f44616
	.xword	0xa4cc91639b760ea7
	.xword	0x9745b43317a807ef
	.xword	0xcf2c666f1a92d10a
	.xword	0x3b529fed6580c5fb
	.align 0x20000
	.data
data_start_5:

	.xword	0x1ca897abb4a12cbf
	.xword	0x1c9ca55901632a6b
	.xword	0x7c32ab9253b1597e
	.xword	0x8abb088edd5a3cb3
	.xword	0x7ad13ec1cc24058f
	.xword	0x17864d47d76d5d6a
	.xword	0xc8de2e1464f7d487
	.xword	0x56e9fd2554159758
	.xword	0xb397086be8bb65fc
	.xword	0xb4b0eb8e14153d49
	.xword	0x970c35d8baa90096
	.xword	0x31d47eba27ad76bc
	.xword	0xc4da30f82450078d
	.xword	0x02ea1342e741d2e1
	.xword	0xb42fd052ab1d3ed6
	.xword	0xd2f0da5d2d00b5bc
	.xword	0xc5c5b28179cd20aa
	.xword	0xa28d3ea9d669c45f
	.xword	0xa50c8fc7793589aa
	.xword	0xf8254294574e001a
	.xword	0x44b3c8a72193b86d
	.xword	0xbe69f7049d054c68
	.xword	0x0ab332b04f70422a
	.xword	0xf1c21c4e8f99c3a7
	.xword	0x0048a43b68b149c5
	.xword	0x217b2985558cd0cb
	.xword	0x78a4162027e0a987
	.xword	0xb41d3b3e5c49c468
	.xword	0x291d3148440eb829
	.xword	0x3789880cd7dcb417
	.xword	0xd2693d7b0191f4f4
	.xword	0x29fc0ba6979f8885
	.xword	0xad20a5989dc1f837
	.xword	0x2e3907fea166a9d8
	.xword	0x2936bb85ef3ab3e3
	.xword	0xeb9440c6ce28575c
	.xword	0xc3ec27ad5b27caff
	.xword	0xb79836589a980401
	.xword	0x269b6c38e617202a
	.xword	0x0e582a3065caa405
	.xword	0x536852203d9f5d4a
	.xword	0x4edd329a920f08fc
	.xword	0xacb803a29e58fe29
	.xword	0x015e0f047eb0e5be
	.xword	0xffda51f0eb08e174
	.xword	0xe1b40c6facf1425d
	.xword	0xeb6ba0a9c4ad293e
	.xword	0x0037063c31fa6f08
	.xword	0xd2a2d501a6ebfce1
	.xword	0x797bbb06143e8182
	.xword	0xf31908a7f775eeda
	.xword	0x7790ae4b7f6bc766
	.xword	0x21c9ad00ae96ddf0
	.xword	0x57e668d11ec47d27
	.xword	0x82f1222ba4b4da6f
	.xword	0x64f0cb2bfcf548c0
	.xword	0x84616c59382d209b
	.xword	0xbad6d3920753c286
	.xword	0xcf8baad434e811f8
	.xword	0x49e5b926059f64f1
	.xword	0xf9da554da626246c
	.xword	0xa3b55b9e4a9fdcd2
	.xword	0xe7b7d204e8f2bb68
	.xword	0xd2a843f0282253b0
	.xword	0xa6890a932ba97308
	.xword	0x834b97778c94d773
	.xword	0x389e1d7d2a09230e
	.xword	0x9fe5212430863446
	.xword	0xb0bd07805bd5ce8a
	.xword	0xc95b070e71569461
	.xword	0x7136f7b7b4e94286
	.xword	0x9a8087164073e983
	.xword	0x8820515563deec25
	.xword	0x3040a4d97cc9c62f
	.xword	0x7abc65d6e11ff36f
	.xword	0x8722081cde32d293
	.xword	0xb06a8438f81ca0d2
	.xword	0x9f1d5f1545d7cda1
	.xword	0x4899e6f44cc40f4e
	.xword	0x38ce2d8219a1e35a
	.xword	0x07ddc5270f4b9909
	.xword	0x8762f2ae1b23cff9
	.xword	0x8527313f325d223d
	.xword	0xe980d21182c77128
	.xword	0x4f63182c11fd591a
	.xword	0xebbec2248d4270ff
	.xword	0xf26a9beb30cb08ae
	.xword	0x5c3c8afdf6e72ff3
	.xword	0x489a1618d4a5fe86
	.xword	0x9c1610f627d81a88
	.xword	0x20b30137475c2036
	.xword	0x35a7d021b34c412d
	.xword	0x1582addd1f16fa92
	.xword	0x1adc49d3d78f4ea9
	.xword	0x8bda9908648fc37c
	.xword	0xd7eae0c4486a75ce
	.xword	0xaa88dbaee7c0a7ca
	.xword	0x03dafa4337d4c358
	.xword	0x4d5ec6b20de18461
	.xword	0xe7f5b330c6d386a9
	.xword	0x3ef669c7bea7c022
	.xword	0x667566d4ca6df5f0
	.xword	0x59fe0b99076de38b
	.xword	0xc22aa4e2543601f8
	.xword	0x2bab8be50b89b283
	.xword	0xab9e2991ddffa56c
	.xword	0x947d584b283047dd
	.xword	0x38d5daa2ec6d0276
	.xword	0xed47772ef4102031
	.xword	0xe3a35991a6b42705
	.xword	0x18143c5257c4ceb9
	.xword	0xde4f84b37bdb9f14
	.xword	0x7fdd7c101ad700aa
	.xword	0xf7773d69f0459dff
	.xword	0xdccdbb9501ae7b54
	.xword	0x9f5b57e6249f000d
	.xword	0xc590957c1f1a9428
	.xword	0x43fd84bb02143449
	.xword	0x36d41d01ab1bf786
	.xword	0x82b0b417f7f38b41
	.xword	0xad33cf7b9bbc3678
	.xword	0x0455e7750836fba1
	.xword	0x2b5fd38dbc9ca5fe
	.xword	0xea7aa18750069764
	.xword	0xa3e6172154d1ed8d
	.xword	0x044553e66db6e347
	.xword	0x4dcd023a704e2543
	.xword	0x63321c4275153788
	.xword	0xe1ddaf3dff5ff595
	.xword	0xef6f16978c9b60cc
	.xword	0xcff754443f1a118c
	.xword	0x6d1d703bdcf35aff
	.xword	0x35d730b6ccd1aac0
	.xword	0xb9fbdb1da8af01f3
	.xword	0xedb8e36fc952ff79
	.xword	0x26ad786224e8564c
	.xword	0x138b8c094ed8878d
	.xword	0x0c61522986dfbea0
	.xword	0xa7dcc0703fe54d26
	.xword	0x133ebe42ed76bd03
	.xword	0xf085ba2382bfd457
	.xword	0x25b1d6ae5d11ac52
	.xword	0xda57dc31b51f167a
	.xword	0xb5eb9bbe4394b782
	.xword	0xd50de2a52b0dac5b
	.xword	0x19db065380f968bd
	.xword	0x54745b2989ff37c8
	.xword	0x342a721e2a452916
	.xword	0x809423c80cf05d03
	.xword	0x24578e31f878c1ba
	.xword	0x23e695e86f896f5d
	.xword	0x2abf4df326a9398f
	.xword	0x0e3e32e6394711f8
	.xword	0xbc08cb79abd66623
	.xword	0x94508b3901e0c8b9
	.xword	0x0db62d452a9b5a29
	.xword	0xc85151390d645d8a
	.xword	0x2b11148c23be409b
	.xword	0x8c82ff04edeed4d3
	.xword	0x162257d3e9699898
	.xword	0xa9b17a7c9ab69cef
	.xword	0xd13b18b215d749ec
	.xword	0x5c2bb9407d77ee8a
	.xword	0x245fb5368f30a3c0
	.xword	0x42dc200e8f89aa11
	.xword	0xacdfcd8e9a2fe7a7
	.xword	0x9f307f1907cda722
	.xword	0x4512b58e84792c84
	.xword	0x75468fe1a33f6791
	.xword	0x2b6dd2f607813625
	.xword	0x6b852b28d98250b2
	.xword	0x4d9e3ba00cc85ada
	.xword	0xe373c44fa9113c7e
	.xword	0x13afe654d86f5331
	.xword	0xe70f520fbaf0b84b
	.xword	0x865998c2c31c1f7f
	.xword	0x27e8bee1362864c4
	.xword	0x967997af3785555b
	.xword	0x2293c0122e018443
	.xword	0x8155b7aa24b2b5f6
	.xword	0xb0b87c0ce088fa15
	.xword	0xc54e462144915e8d
	.xword	0x9c4d34ff6dd0df18
	.xword	0x107369a15e6127de
	.xword	0xbe263655130a2523
	.xword	0xeea3926d40858003
	.xword	0x95f2a88c0c5e3b20
	.xword	0xa996cd8dcae479e4
	.xword	0xfb5cc9b63aa62c27
	.xword	0x2be3d4953af0560d
	.xword	0xf449fd037b6dcbb7
	.xword	0xda3ea0a8315271f6
	.xword	0x440a0e620b116ab2
	.xword	0x09845f83fde246f3
	.xword	0x57cc15ef1db73753
	.xword	0x69a5e239e9e8d85c
	.xword	0x4a710e1ec3216ec3
	.xword	0x35e28bf9e89bc1e6
	.xword	0xe2433656d45de087
	.xword	0x3d634aaa30b97cce
	.xword	0x1996f41e4d70e66f
	.xword	0x3bccb8b4b49f830a
	.xword	0x7f8c129d45bf16f0
	.xword	0xd1e1c37ef1ced529
	.xword	0x6515e20ea8f34f7b
	.xword	0xa94da08962d63dff
	.xword	0xce6c8f7175321eca
	.xword	0x54096ed06e1d62f5
	.xword	0x590cd0037648f1e9
	.xword	0x6b4d6377cb632511
	.xword	0xeb12971a5d67fd9e
	.xword	0x2cc5aaff1c79b782
	.xword	0xe6dd6a0c8a3e4a35
	.xword	0x82a1db55104c62e9
	.xword	0x39f2584663e26096
	.xword	0xb973b970eb0cd192
	.xword	0x459863cc0470387a
	.xword	0x215ceacbd16dedbb
	.xword	0x2a6abcb0fe60ee9f
	.xword	0x96593993e8d66496
	.xword	0xcdd2c1f9757de992
	.xword	0xb992f3b9e6153c8b
	.xword	0x50a089463972ad01
	.xword	0x57eb27f4cb44203c
	.xword	0x91abc92a09c54ebf
	.xword	0x23c4b8c7819267da
	.xword	0x5987d3011c004c6e
	.xword	0x57d3324564e7b9f8
	.xword	0x6d581293b13d6cde
	.xword	0x05dd1fe9e19d899c
	.xword	0x62a089650b70c07a
	.xword	0x8881e1455b864972
	.xword	0x0f3669b9697a1401
	.xword	0x782f23aca300fc1d
	.xword	0x7629429790ef087e
	.xword	0xc034cdca0466c823
	.xword	0x8096a83d04d75664
	.xword	0x9b35346f7dbfae17
	.xword	0x84d0410513203de0
	.xword	0xd2d36bbba20074d3
	.xword	0xcf31f6fed51834c8
	.xword	0xeeafa9ecd5117026
	.xword	0xab95cdbccff8acec
	.xword	0x7fffec0d08ba7d0a
	.xword	0xb432d312a7515f12
	.xword	0x6c726f306b8a1c32
	.xword	0x263f4c4dfa7d00a2
	.xword	0x84e8dda00173390e
	.xword	0xca8749d9b61bbfcf
	.xword	0xd5c249b6d07a3e96
	.xword	0x7d35c17e6f6eee9a
	.xword	0x7cdf5e44369d7d0b
	.xword	0x428e37c7e8b22ff7
	.xword	0x53a720818d345c92
	.xword	0x6169162601e14916
	.xword	0x4e538e9d45d02eb8
	.align 0x40000
	.data
data_start_6:

	.xword	0xc8e3bd8c9c9d9bd8
	.xword	0xa358908b342f996c
	.xword	0x2c682b519effd5e1
	.xword	0x31e7a1071bb5372c
	.xword	0x99939b4c489cd8af
	.xword	0xc414fd5e58967056
	.xword	0x21bf22e032be39a6
	.xword	0x3473d2f64e5cfd98
	.xword	0x39dd30f2adf7bbe2
	.xword	0x49925215597039d9
	.xword	0x8dfa539d9d98ba88
	.xword	0xed5c938ea40b2e4d
	.xword	0x1748be0c39e276b3
	.xword	0xe654484fa1bf6ce8
	.xword	0xfc49c658900ab31b
	.xword	0xbd76eff408a293c2
	.xword	0x460cdb711d42b343
	.xword	0xa28cef85e97f3002
	.xword	0xed5f89da904252e8
	.xword	0xab98097e271e1f13
	.xword	0x12655f795b4a618a
	.xword	0x5ddf3a278fc80e54
	.xword	0x75859fc2a4d495e2
	.xword	0x7513b5297de65344
	.xword	0x82c9277cd2a3a200
	.xword	0x28dc5cd0afebbb1c
	.xword	0x867a2cb2d0187a25
	.xword	0x5191f02b85a425f1
	.xword	0xc988fca16b549a1d
	.xword	0x39e2256b209cb527
	.xword	0x4633dca8fcc5eecc
	.xword	0xc5af278d1ab1cb69
	.xword	0xad7b15535fdf19c4
	.xword	0x1379d79eb68b6885
	.xword	0xdb7b569f6302a9ad
	.xword	0xa098c79b5555d730
	.xword	0xd5117566198b467b
	.xword	0xcfb1960d7f0b0ca0
	.xword	0xd7696c02ee1575dd
	.xword	0x63125e237e3fb390
	.xword	0x75954b8feab8c27d
	.xword	0xddbbd21c95353a28
	.xword	0x10378b476ed25bb8
	.xword	0x9f0dd9560f2c6571
	.xword	0xdc7ce12591aad22e
	.xword	0x389fcca185189c53
	.xword	0x650ca7d3babb0dc8
	.xword	0x72f54e0a9616d630
	.xword	0x695a1e49efdfb2fa
	.xword	0x51f633234d260ec8
	.xword	0xa51bfb4cb1d8e3fa
	.xword	0xc9450ab265066d87
	.xword	0x7686d8683399fda8
	.xword	0x01e7820ddc5ed166
	.xword	0xeebd8350ed99e969
	.xword	0xcc5f7d62577fbd0e
	.xword	0xe6a798c67f363a64
	.xword	0xf147aeca9fe7e7ae
	.xword	0x95dec13e83d68592
	.xword	0x85d1f27926e3d3c7
	.xword	0x385a9dc51c6b1eff
	.xword	0xcf5aa20beb3d0af4
	.xword	0xd4179a5b7ca4ae08
	.xword	0xc4c40ccd446fd085
	.xword	0xce659b8b388c6f3f
	.xword	0x4033b8e84d8ea0bc
	.xword	0x8a1ba26f0594d719
	.xword	0xb166074df4c10373
	.xword	0xf0b1a076170e0669
	.xword	0xf675689d2069ed20
	.xword	0x166af2d0a64212aa
	.xword	0xc5eee54c1ac0fa6c
	.xword	0xd7f14eb77eb51902
	.xword	0xba74795241abd8c4
	.xword	0x67334deb1336217e
	.xword	0x62cb220e805b5982
	.xword	0xe0e4a8fe3227096c
	.xword	0xa466893d59d908a9
	.xword	0xf9cd9bac91843666
	.xword	0xdb7604eb3de8c5ec
	.xword	0xf7b1127e5db38ac8
	.xword	0xe8e49708686d0209
	.xword	0x8eb1a308b067a7c8
	.xword	0x2edee2d78858f995
	.xword	0xe67b7760c0d47616
	.xword	0xc8534d1fa7d076d8
	.xword	0xd77f2561c5d7f188
	.xword	0x979fd6d7e87a5a09
	.xword	0x9745e4ed5aadf022
	.xword	0xba846f3a2bd30b62
	.xword	0xccd2ff8108ce40d1
	.xword	0xf2674cb2c5066688
	.xword	0xd4b48efced6af48a
	.xword	0x5a5c3e850b923f7f
	.xword	0x3800f1bb02f9b026
	.xword	0x530196f800db32b7
	.xword	0x72867192d45173b7
	.xword	0x33a53d07c1b5be44
	.xword	0xbfd8430a5d290805
	.xword	0xb316e2fce0227611
	.xword	0x4acf017a2ae13449
	.xword	0x99c1a2f0a0f516c8
	.xword	0x8cd6500134682caa
	.xword	0x898da3f4d74272b9
	.xword	0x5b661888df391c87
	.xword	0x5814f79e3f5dc494
	.xword	0x99cfe42fe49d5cef
	.xword	0x4e0604bab6f31cf9
	.xword	0xbeef68dcc4b7b927
	.xword	0x8fa89e78d46a57df
	.xword	0xf66d4dd9c05e9ce2
	.xword	0x6a783626bc7e4582
	.xword	0xb882b0c620a19251
	.xword	0x61534bc20520e060
	.xword	0x177df6df59414d2e
	.xword	0xc6eafddb816f3356
	.xword	0x7c3f34e81369526b
	.xword	0x684d6c8c0c37f86a
	.xword	0x1b28718472c5a799
	.xword	0xe42564c8feba0c6a
	.xword	0x92d05e1a9fd4a25b
	.xword	0x03bb86f100fcf816
	.xword	0xfba5b68a3d4824fb
	.xword	0xca00c3af5275b8b7
	.xword	0x166a182616ebb25a
	.xword	0x7a772ef620406d95
	.xword	0x3c6c3c2f1fa8066e
	.xword	0x4d8dfeeb68200970
	.xword	0x82016ac6b0e3235d
	.xword	0xd914d356ed1f1e12
	.xword	0x86603b4aaba16517
	.xword	0x0c4f1e6dfa91b7e7
	.xword	0x6f858344a8d3163b
	.xword	0x81ab45080ea8c610
	.xword	0x878500f1b86c747e
	.xword	0xcbab69032d9d75e9
	.xword	0x8f4c6538c278087d
	.xword	0xdf0bc9cb6b9ebfc6
	.xword	0x7a6310b468d4e4fc
	.xword	0xa1c09f919e746e1a
	.xword	0x29343c4f4b84c1d9
	.xword	0xba1e8e3d41d3fa2f
	.xword	0xaf919fe77971601c
	.xword	0x01dcb3b46ecc329e
	.xword	0xa382fc30bc12d235
	.xword	0xab92a42fa8d95918
	.xword	0xd140b78631afbdfb
	.xword	0xf8897d62db150af0
	.xword	0x1aa045dfbeee4b03
	.xword	0x8ccd915e56215435
	.xword	0x9ea0ede123b99825
	.xword	0x3af55e877e209434
	.xword	0x2f722bda7ea1af0c
	.xword	0x0285063a72f5da6a
	.xword	0xe8b74d491b5704ce
	.xword	0x805015cb9e5600e6
	.xword	0x8c0b1a877b601c94
	.xword	0x57d27d59b7e79167
	.xword	0xb42bafaf68019559
	.xword	0x2cbcb83510175723
	.xword	0x61f0f77ef8d8afb6
	.xword	0x4f0c182e5e3a7a95
	.xword	0x0bb158f7d14f483c
	.xword	0x4175c817d8bed5ed
	.xword	0xd76e8a27630be70d
	.xword	0x986d255fd817b43e
	.xword	0xf8fda537f3203133
	.xword	0x319f53f897749d51
	.xword	0xcf0854abc2fb7c82
	.xword	0xec93586a2917d0cb
	.xword	0x5cb2eedfd6ac733e
	.xword	0xbb3100422684dca5
	.xword	0xce726ae439ba8fe6
	.xword	0xffe1b7409bcdbb95
	.xword	0x0f019d06c7a26033
	.xword	0x69f4e847fad3941e
	.xword	0x5fbe9acfbe985629
	.xword	0xf435656681634e6c
	.xword	0x0d4191b70ab1796b
	.xword	0x88122d2c83967131
	.xword	0x808cc1d196fd67ff
	.xword	0xc9323e307b14f78b
	.xword	0xe0236729ab9e49d9
	.xword	0xc1ac5693d9a4c5e6
	.xword	0x76ae9a4f6d0e064e
	.xword	0x472aa6a9e1c63077
	.xword	0xe5e7e60c0cce2591
	.xword	0x764e5f0f607696b9
	.xword	0x94d17c886c0beec9
	.xword	0xa24ee0fd8264e375
	.xword	0x4217d37bf49fabfe
	.xword	0xd7604ff772bbdb4a
	.xword	0xc2ca884a973918c3
	.xword	0x415d70e1bf59adb3
	.xword	0xf03c152c0d9fce04
	.xword	0xbee777eaef0ee11e
	.xword	0x13c537ec93601c0e
	.xword	0xa935aca00a977d4a
	.xword	0xcb9147f5ef60129e
	.xword	0xcf53777c4bb47363
	.xword	0xcf344af5cbbc6d77
	.xword	0xa0feac8344acf512
	.xword	0x0cfcd1d614722cbe
	.xword	0x4b47f6b8aaa5813c
	.xword	0xb250a508015a30de
	.xword	0xcabf192ad8e21e48
	.xword	0x9c3dab92be16c27a
	.xword	0xdf61da1f2be6d355
	.xword	0x62a43d420e0008fd
	.xword	0x6217777ed6b05da8
	.xword	0x059b13fb66e94cd5
	.xword	0x61e9aade254ad360
	.xword	0x089fc24862af11c7
	.xword	0x9a26debcbee9527c
	.xword	0xb7d9b91edb0b6aed
	.xword	0x66a7dc72d0f21cd6
	.xword	0x29ed287840797640
	.xword	0xf76c6f79bfab7774
	.xword	0x1308a92d82104fd5
	.xword	0xad2f14ca7d28f1a3
	.xword	0x920b666b1b9293d3
	.xword	0xecf9011c433b61c4
	.xword	0x2f1b28e61e1d179c
	.xword	0xff5ddea73943ec73
	.xword	0x0019cffa96817a1a
	.xword	0x8f30d053c812d87e
	.xword	0xd3e30d5b5c9eb9bd
	.xword	0xb47d976bb17efb8e
	.xword	0xab0a31912cad9515
	.xword	0xce13f75c1b5970f7
	.xword	0x009fb3a966ae6fbd
	.xword	0x7a2312992c5be28e
	.xword	0xa5d1bb5783a4d1b9
	.xword	0x2440f8b040d3daa8
	.xword	0xc46e5f3fe75e7c21
	.xword	0x7ab4ec63bc8df7c3
	.xword	0x8b9ac5cf2baabe91
	.xword	0xef5e8fc6669c6c76
	.xword	0x210e2a65b4f94ec6
	.xword	0x956c50b5d1ca048c
	.xword	0xc680d14fb8f9c6d3
	.xword	0x66d700e7da18494b
	.xword	0x4033e6a6d92d8abf
	.xword	0x0918c382ac8457f4
	.xword	0x656548c36ba34fb3
	.xword	0xa1f30b32c0097791
	.xword	0x01c9df4f19f66cc1
	.xword	0xc3e9d25c37d29952
	.xword	0xcb70d69cfeda870d
	.xword	0xed7fb0aca676552e
	.xword	0x4f63af705ab228e1
	.xword	0x50afde72ebc613e0
	.xword	0x9b84f773b3ce1c1e
	.xword	0x1cd5088b3a3ddc1d
	.xword	0x33e61a7ba01eef31
	.xword	0xb5b80fd92d742298
	.align 0x80000
	.data
data_start_7:

	.xword	0xc388dae05c822e0a
	.xword	0xd8f001555edf4a4d
	.xword	0x5d9b1e0794d94a2f
	.xword	0x0a7343025b9015fa
	.xword	0xf17a9ea6c017e761
	.xword	0xdba52fb0a8593ced
	.xword	0x0dc69d88ae8d1736
	.xword	0xaa31a31eed3f5ec8
	.xword	0x1e7ec2937be6c611
	.xword	0xdb5ff75cacf00663
	.xword	0x6b2f08f334d29144
	.xword	0x783e8e287140bd4d
	.xword	0x40a53cc884c70a49
	.xword	0x955b7f9f830dcfb7
	.xword	0xce20702e78f217b3
	.xword	0xcac70dd483e8fc53
	.xword	0xe9b95c4f5fdc2201
	.xword	0x4561c8e404870fd1
	.xword	0x04f7f49cff2a9bcc
	.xword	0x5c79ff85b6de33c3
	.xword	0x3afb004cd5853d05
	.xword	0xdb84bf6e400fa6d3
	.xword	0xc61b81792088d93f
	.xword	0xf638f9df3cdd6972
	.xword	0x4ae0512d3d653353
	.xword	0x347b9643582ea989
	.xword	0xd19af210ca9adf34
	.xword	0xa02db101922bd5ce
	.xword	0x6f8245c28fedb083
	.xword	0xa1b202695a05b1b2
	.xword	0xb8283df018dd8604
	.xword	0x2daa6b304cb16db1
	.xword	0x4c344a14d2494a73
	.xword	0x9add4d9c2561c791
	.xword	0x4cc019e01475dd63
	.xword	0xa26d6f2fc7776817
	.xword	0x52580aff8e9091b1
	.xword	0xdc81aa073b014454
	.xword	0xc833a635dfc62ade
	.xword	0x199f9c6ace89bf1d
	.xword	0xfb9d426147509f8e
	.xword	0xd761481cfb65abe4
	.xword	0x9903a85ffd679fb8
	.xword	0x90eef86c8e6f0110
	.xword	0xced5e4439a318ba5
	.xword	0x092306bd6df6318d
	.xword	0xf7ea544595a5e4eb
	.xword	0x00681e9de62bb371
	.xword	0xd7c4498381b8a2d8
	.xword	0xd4d49116a31c0bee
	.xword	0xfc3f43a6a52fc13a
	.xword	0x4e01995863ae7b44
	.xword	0xe417f6656993f366
	.xword	0xd1e39e506397a7bb
	.xword	0xd2b21b877b9e4743
	.xword	0x746e37a0fb4917bb
	.xword	0xa673f64bee38179e
	.xword	0xf80c957544770ab5
	.xword	0xcfc33c36604d14b6
	.xword	0x3eb00e26dd147068
	.xword	0x59d9ac4ae87335ee
	.xword	0x30b334a84988d8c9
	.xword	0x3468810af6a95467
	.xword	0x168d573ce15d09c9
	.xword	0x2a0fe7c68c5d7eb4
	.xword	0x44e828c6bbb3f050
	.xword	0x0a9d668ce4c0437e
	.xword	0xa819c99222e20e9c
	.xword	0xbdd106824b970ecd
	.xword	0xe813270e038d99ad
	.xword	0x7d096b2c8b6b2e50
	.xword	0x89af282e7f9e0ef0
	.xword	0x685179368d64888f
	.xword	0x0fe7f47d59ef5e63
	.xword	0xcabb4bbcf4cb15be
	.xword	0x2ad1e85b354ed684
	.xword	0xf33a78bf2b0b6835
	.xword	0x86c50c019660c06e
	.xword	0x533d6f4b2fb76f00
	.xword	0x74571e4c143a3de8
	.xword	0xd56b34d839eaa5ce
	.xword	0x06caec9b347425b7
	.xword	0x06e63520f9ed47cd
	.xword	0xccdf88e5f848d35c
	.xword	0x13fe2d5b9ad82839
	.xword	0x6bf059c12772f681
	.xword	0x5350d7bca0a1fda9
	.xword	0x38dd9fa221f49cb0
	.xword	0x3bb98f3d8534fb74
	.xword	0x0ad3a22e93f8045d
	.xword	0x643880ef7f600e90
	.xword	0xbdf15c37dc1fb77f
	.xword	0x34d804bcf528a0f9
	.xword	0xd614f541b5eafd78
	.xword	0x44b186c83f597563
	.xword	0x8a3307d84024e454
	.xword	0x59d7eb02ec6438d2
	.xword	0x49084675a1270a85
	.xword	0xbe69e23d2e609a68
	.xword	0x1f2de37dc7aad379
	.xword	0xf1c5e0c306379726
	.xword	0xa1115b5c27f51d8c
	.xword	0xf06ed541bc1bd827
	.xword	0xb17f7c8e46751348
	.xword	0x0dfaf688bfe5a33d
	.xword	0xf9e7c6e9a9293490
	.xword	0x40e783955143bd4e
	.xword	0x3185b3f5fa933638
	.xword	0xf772a503c36c1ea2
	.xword	0x16d69e8a508268b0
	.xword	0xcd402eba6f08cb2f
	.xword	0x3409d7003e7c122e
	.xword	0x9c3f6a17f17c08c7
	.xword	0x424e86d57a4a483c
	.xword	0xcd7fec0a64da68f5
	.xword	0x427c2cf8d8d7f7d1
	.xword	0x961e6400ef55a9eb
	.xword	0x2f629d6012fcffc3
	.xword	0x60bb0aa909cc740e
	.xword	0x230db7b3118c4f3d
	.xword	0x9a8deda717c4834f
	.xword	0xd4f86f4c7f8cbd6f
	.xword	0xf1b5907c1b7f05e3
	.xword	0xf88cffde62f293e1
	.xword	0x5acf1195de4ac94e
	.xword	0x8d4e87db8525af81
	.xword	0x4f16108952250d7b
	.xword	0x48725d75cd2482b1
	.xword	0xa7ec4df0f75d36bf
	.xword	0x11f04154102a7d45
	.xword	0xdc4b1867462a20f6
	.xword	0x6b1cf6ff84c2380e
	.xword	0x539442d927dd81bd
	.xword	0x3e76e6b69599b605
	.xword	0xaa4b970dc406bdca
	.xword	0x6e76f25c86822f13
	.xword	0xe1b5662f5363b444
	.xword	0xef0599f4aab3bb94
	.xword	0x141350a3cc4ba74a
	.xword	0x1c87009ead1efc07
	.xword	0x8c6f257a3bc765e6
	.xword	0x6d1a515db525e3ec
	.xword	0x4a9abc537d018cff
	.xword	0xefe708a6c80140a6
	.xword	0x5592f8672333f9bb
	.xword	0x40dc879ad9d2e0ee
	.xword	0xaa2da28a0a0cba83
	.xword	0xb7d13740dfed3106
	.xword	0x3f9881d0cd510373
	.xword	0xfbecda9873c1f865
	.xword	0xbd669cca99b4d291
	.xword	0x955a827288aeff92
	.xword	0xcf963e90e08d5007
	.xword	0x4291fb392c985f16
	.xword	0x150b5579db877283
	.xword	0x6e811f34999f682e
	.xword	0x835a1821f045974e
	.xword	0xe1506c6e6f5623b8
	.xword	0x0d16b1e13dd4ade2
	.xword	0xac517688e66cf931
	.xword	0xc788110e3220a32a
	.xword	0x0bbc1b75a7effaa0
	.xword	0x4f7288cf99130bc3
	.xword	0x67994e5ceea81efb
	.xword	0xd9abc7439ffe92bf
	.xword	0x4e14320647f0e9ed
	.xword	0xd55ed99d9286200d
	.xword	0x52761f87a65bdfb2
	.xword	0x5f93f3dec8434511
	.xword	0xc63bb03adfd74017
	.xword	0xdb52b875b819955a
	.xword	0x073821770cbb46c9
	.xword	0x4a837fcea40bcf05
	.xword	0x89e35db28384d90a
	.xword	0xb65671cc96de15ab
	.xword	0x42883fc5bdd8a6df
	.xword	0x28c305ce211bc967
	.xword	0x657a089f9099aefe
	.xword	0x9f9f317f5d5e2e21
	.xword	0x0cbcaee2dcbf1b7f
	.xword	0x56ce0a8f5bd12c4e
	.xword	0xab7d0e0b09be8dbf
	.xword	0x65711831fe229dcf
	.xword	0x0759a0980c540830
	.xword	0xc546bccd82ba5906
	.xword	0x657e92a1f39e2454
	.xword	0x22724ebb15cda1a3
	.xword	0x099fe3a27652094e
	.xword	0xfa03a67788d22732
	.xword	0x9aa79184420b4c9b
	.xword	0xe1085ffd22d3c000
	.xword	0x8cbe41e591123acd
	.xword	0x48deaf81a8c4fbba
	.xword	0x19bae969770ef510
	.xword	0x7d3a3a219cfd708f
	.xword	0xcc285c5a2c393308
	.xword	0x8619163c709e9d5d
	.xword	0xe6c90975ec25f453
	.xword	0x93db21687e94e1b4
	.xword	0x1a27c019d20f67a1
	.xword	0x25eb89b46cfb7f64
	.xword	0x5ee135f1bedfab9b
	.xword	0x1943ebadf60311bb
	.xword	0x32c037187bd08a35
	.xword	0xb1f2e9f5bbd10df0
	.xword	0x4369441a5aafafce
	.xword	0x73c071d3fcd4de77
	.xword	0x5fd5925989eb6d64
	.xword	0xb40a857f8dc4f08d
	.xword	0xd3e247ce9db87c3a
	.xword	0x42a5f9b06f35a6b6
	.xword	0x59c4f083e0732a8f
	.xword	0x569182edb6e22d82
	.xword	0x9b59cdd54eb4deda
	.xword	0xd919d0f200481488
	.xword	0x002821da89997431
	.xword	0x19821faa47568c93
	.xword	0x3a76ccfbb394185e
	.xword	0x19efa9df72c7e4e9
	.xword	0x5fc24977825e774c
	.xword	0xd38b6e670d4cd2ea
	.xword	0xed6384f09483a919
	.xword	0x6b0d972faf30c82c
	.xword	0xa281eef1dc9bea84
	.xword	0x45117b1e55258559
	.xword	0xde2f361d70cdbf12
	.xword	0x612598681aafbf8f
	.xword	0xefb5b16e7f7a9783
	.xword	0x42eb87385dc6bccb
	.xword	0x1329e52a88e1f86b
	.xword	0xba9e64f386f8b3d9
	.xword	0x56f7a9999ceff82f
	.xword	0x114ef31b671ad7bb
	.xword	0xa1b8276eef650a54
	.xword	0x680c7b68957b9352
	.xword	0xb804059b3bf92ba2
	.xword	0x8e3923789d7389c7
	.xword	0xabf9aaf58ab5de48
	.xword	0xd94c3a273ff767a5
	.xword	0x1b6808c75fd802be
	.xword	0x477418cd667ee28b
	.xword	0x6665ed584d14763f
	.xword	0x70017fc8b41b48d7
	.xword	0x3375ef724a38ddf6
	.xword	0xe02dcb2df88d9bfe
	.xword	0x96a691c647ebb1d1
	.xword	0x6bf2edf27ce79240
	.xword	0xf938c03686ef02dc
	.xword	0x13e0bab687fdb256
	.xword	0xf6c577cae6348435
	.xword	0xb947d3cae728b94e
	.xword	0x7cd8f3408041509b
	.xword	0x6037f38464ccbaa7
	.xword	0xc22993460fa1620d
	.xword	0xfdb83bdeef0949d3
	.xword	0xbbc104b7ebae6ce4



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
