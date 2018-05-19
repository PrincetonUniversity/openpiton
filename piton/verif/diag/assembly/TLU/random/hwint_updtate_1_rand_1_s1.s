// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_1_s1.s
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
   random seed:	786198412
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

	setx 0xa433f42c30ec1f5d, %g1, %g0
	setx 0x8212884e5b50ea4b, %g1, %g1
	setx 0x00152b64b28375f9, %g1, %g2
	setx 0x9dcd6aa3e72a35aa, %g1, %g3
	setx 0xee4a3d277c7f07db, %g1, %g4
	setx 0x33efdf4c62df3d82, %g1, %g5
	setx 0x7bd40ee8a24024c9, %g1, %g6
	setx 0x393ed3f4d2c2fff0, %g1, %g7
	setx 0x81b66e74549cf3e6, %g1, %r16
	setx 0xf6f991ebef0d0695, %g1, %r17
	setx 0xaa9ace563fc2675e, %g1, %r18
	setx 0xd385a2e948354b5d, %g1, %r19
	setx 0xb4dbd5274153cde3, %g1, %r20
	setx 0x90c58cba8127908d, %g1, %r21
	setx 0x0c493a1e33e7df08, %g1, %r22
	setx 0xe0dc9b4bc667ba09, %g1, %r23
	setx 0x84dd19cd7de92dcc, %g1, %r24
	setx 0xd89451b8daaf2a2b, %g1, %r25
	setx 0x2c90cab224487a5e, %g1, %r26
	setx 0x200c6867804e074c, %g1, %r27
	setx 0x17910d829198bdd7, %g1, %r28
	setx 0xd0b602e9edbd62a2, %g1, %r29
	setx 0xb9cbd8e75d7474e4, %g1, %r30
	setx 0xae7dab05b746d7d7, %g1, %r31
	save
	setx 0x5ab8290a97dd3fd3, %g1, %r16
	setx 0x79927c8d4277c670, %g1, %r17
	setx 0xc34ea6043acbd4f9, %g1, %r18
	setx 0xd3b9a8fe4fbcc40c, %g1, %r19
	setx 0x35af030b5847f661, %g1, %r20
	setx 0x34f4f70807e9c7ee, %g1, %r21
	setx 0x9c23e6a05fb9dc43, %g1, %r22
	setx 0xe53e860705d876fa, %g1, %r23
	setx 0xcb9233b63f25db3d, %g1, %r24
	setx 0xa4d86e81efb6f982, %g1, %r25
	setx 0x18ab35577681344d, %g1, %r26
	setx 0x30fcc12d0eaae75c, %g1, %r27
	setx 0x398cf07b60168d14, %g1, %r28
	setx 0xcc7c13151e2dda5b, %g1, %r29
	setx 0xfc74f5a0286ae393, %g1, %r30
	setx 0x65c33dede40b0aa3, %g1, %r31
	save
	setx 0x1b0daa3046de9f25, %g1, %r16
	setx 0x242dde82c9f59aa0, %g1, %r17
	setx 0xef1a0aaec77cbc58, %g1, %r18
	setx 0x7cfd662bff4011be, %g1, %r19
	setx 0xbbb61fe56acf2f11, %g1, %r20
	setx 0x06f64a154b035d94, %g1, %r21
	setx 0xe08720395f793821, %g1, %r22
	setx 0x135dce1ac2774de8, %g1, %r23
	setx 0xf74d42051f11ff19, %g1, %r24
	setx 0x52786df094f2377c, %g1, %r25
	setx 0x919be65e07ac6da0, %g1, %r26
	setx 0xf2fd622fd1d7310e, %g1, %r27
	setx 0x0ac6524ad19d5c98, %g1, %r28
	setx 0x53db90fa3d223b81, %g1, %r29
	setx 0x4f08d88ff03378a7, %g1, %r30
	setx 0xbcfd97a151222a7a, %g1, %r31
	save
	setx 0xdaff909749ae986f, %g1, %r16
	setx 0x9b3a6f6141bf4d49, %g1, %r17
	setx 0x5690fa493e033958, %g1, %r18
	setx 0x2382950be5c8c444, %g1, %r19
	setx 0x2af5bee9c0baa303, %g1, %r20
	setx 0xe80c4abcb7bd9e93, %g1, %r21
	setx 0xac3277cba27a807c, %g1, %r22
	setx 0xffdd711b11f3ea5e, %g1, %r23
	setx 0xa039e3b1018f0950, %g1, %r24
	setx 0x27ddf5c2783423db, %g1, %r25
	setx 0x871a3a124bf5dff1, %g1, %r26
	setx 0x9bd16770f52cc5dc, %g1, %r27
	setx 0xb7449c5d578365d5, %g1, %r28
	setx 0x0843d35aca836ff6, %g1, %r29
	setx 0x1409a3b8373f0543, %g1, %r30
	setx 0x9ed5584d35660f4d, %g1, %r31
	save
	setx 0x093ae1adfc614228, %g1, %r16
	setx 0x0403f83d485b9e83, %g1, %r17
	setx 0x564506f2b181c630, %g1, %r18
	setx 0x25fb1aa8bd6dfa9b, %g1, %r19
	setx 0x6038a855efa06497, %g1, %r20
	setx 0x81656b304bd2e6f1, %g1, %r21
	setx 0xab0dc9e0a2c5e9f2, %g1, %r22
	setx 0x71b52254b1dc03a0, %g1, %r23
	setx 0x1577f2281eb7aca7, %g1, %r24
	setx 0x2c2d189cb6ae855a, %g1, %r25
	setx 0x8a2ff3e07a985215, %g1, %r26
	setx 0xa42e1e34f8a00a4c, %g1, %r27
	setx 0xf38173827273b796, %g1, %r28
	setx 0xcd2daa7286dd09eb, %g1, %r29
	setx 0x639c5c8c337035a6, %g1, %r30
	setx 0x0c996d57a2e76cbc, %g1, %r31
	save
	setx 0xe58e3fee31229ed2, %g1, %r16
	setx 0x9be4d10255f7ab02, %g1, %r17
	setx 0x573573245ae3f026, %g1, %r18
	setx 0xa28a2066ac9dad48, %g1, %r19
	setx 0x91ea06f539d6a14e, %g1, %r20
	setx 0xcb91d578701643ca, %g1, %r21
	setx 0x5cc0ad8a21aa2608, %g1, %r22
	setx 0xbf86c2143a3891bf, %g1, %r23
	setx 0x34c6c7631f34c409, %g1, %r24
	setx 0xe2f5264625593722, %g1, %r25
	setx 0x1c9f0ee69ab49538, %g1, %r26
	setx 0x7379a1981bb13832, %g1, %r27
	setx 0x7d25e5eb208237c3, %g1, %r28
	setx 0x9724f3f94a4eadae, %g1, %r29
	setx 0x63dbb94de8c7096c, %g1, %r30
	setx 0x75e2bf56cf5bcd79, %g1, %r31
	save
	setx 0x84fe2f537bf2a1dc, %g1, %r16
	setx 0xa777c61ed7802a05, %g1, %r17
	setx 0x89f7c78eff08314a, %g1, %r18
	setx 0xbc93b11768cecf21, %g1, %r19
	setx 0x903c21113e8d98bd, %g1, %r20
	setx 0x4faf5158defa4f4a, %g1, %r21
	setx 0x844deeeaf19a4ecb, %g1, %r22
	setx 0x66e29ecd44454665, %g1, %r23
	setx 0x1919a93a2605ab4a, %g1, %r24
	setx 0x0acbcf3fabea4651, %g1, %r25
	setx 0x7e47ab84a1c8b4be, %g1, %r26
	setx 0x6196df2be4b54367, %g1, %r27
	setx 0x63c5ef9a7ec3c09e, %g1, %r28
	setx 0x7900b3a83f659664, %g1, %r29
	setx 0x163c1cfcf559f0c9, %g1, %r30
	setx 0x18d6fe83095586ec, %g1, %r31
	save
	setx 0xe311134d24d3b6f9, %g1, %r16
	setx 0x9073de37065d9c9e, %g1, %r17
	setx 0xdd9834bcc9cca96a, %g1, %r18
	setx 0x6852bba6ebf9bdb8, %g1, %r19
	setx 0x982548e6b0cb1963, %g1, %r20
	setx 0x8eab2767c33930fc, %g1, %r21
	setx 0xab46242ed21197a7, %g1, %r22
	setx 0x303767b3528a3242, %g1, %r23
	setx 0x25e790271bb50315, %g1, %r24
	setx 0x093549e20f9d1404, %g1, %r25
	setx 0xc0148758b7115846, %g1, %r26
	setx 0x1ee83d10aaf034c4, %g1, %r27
	setx 0x6615955844a2a8e2, %g1, %r28
	setx 0x30047cbfb85ecb14, %g1, %r29
	setx 0xd05632e853609011, %g1, %r30
	setx 0xe5f355629dda684f, %g1, %r31
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
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 5: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_0:
	setx	0x1e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_1:
	setx	0x1f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a035  ! 16: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_1:
	mov	0x38, %r14
	.word 0xfaf38e80  ! 19: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb5e5e09e  ! 24: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, b)
	.word 0xb9e50000  ! 28: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e4209f  ! 34: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e40000  ! 37: SAVE_R	save	%r16, %r0, %r25
	.word 0xba2d6031  ! 40: ANDN_I	andn 	%r21, 0x0031, %r29
T0_asi_reg_wr_2:
	mov	0x2d, %r14
	.word 0xf8f38400  ! 43: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_2:
	setx	0x1f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 46: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3641800  ! 51: MOVcc_R	<illegal instruction>
	.word 0xb1e5c000  ! 52: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9e58000  ! 55: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_3:
	setx	0x1c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 20)
	.word 0xb80d614c  ! 62: AND_I	and 	%r21, 0x014c, %r28
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e5c000  ! 66: SAVE_R	save	%r23, %r0, %r25
	.word 0xbde521ff  ! 67: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_0:
	mov	0x1b, %r14
	.word 0xfcdb89e0  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_1:
	mov	0x23, %r14
	.word 0xf4db89e0  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1e58000  ! 72: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_4:
	setx	0x1c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0c9  ! 78: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e48000  ! 80: SAVE_R	save	%r18, %r0, %r24
	.word 0xb494a1fd  ! 81: ORcc_I	orcc 	%r18, 0x01fd, %r26
T0_asi_reg_wr_3:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 83: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e50000  ! 91: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_6:
	setx	0x1e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3540000  ! 96: RDPR_GL	<illegal instruction>
	.word 0xbfe48000  ! 97: SAVE_R	save	%r18, %r0, %r31
	.word 0xb1e54000  ! 99: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_2:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 102: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_7:
	setx	0x1f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e4e121  ! 106: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_4:
	mov	0x2c, %r14
	.word 0xf4f38e80  ! 107: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_8:
	setx	0x1f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_9:
	setx	0x1f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42161  ! 116: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_3:
	mov	0x10, %r14
	.word 0xfadb8400  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_4:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfe48000  ! 132: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3e54000  ! 133: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_10:
	setx	0x1f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 135: SAVE_R	save	%r20, %r0, %r27
	.word 0xba048000  ! 137: ADD_R	add 	%r18, %r0, %r29
cpu_intr_0_11:
	setx	0x1d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_5:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 139: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb5e54000  ! 140: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e521bb  ! 143: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb4244000  ! 144: SUB_R	sub 	%r17, %r0, %r26
	.word 0xbc14e1e5  ! 145: OR_I	or 	%r19, 0x01e5, %r30
	.word 0xbfe44000  ! 146: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe5c000  ! 147: SAVE_R	save	%r23, %r0, %r31
	.word 0xbbe48000  ! 148: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_12:
	setx	0x1c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 150: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_6:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 153: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 16)
	.word 0xb7e5218d  ! 161: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5a0d8  ! 162: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3643801  ! 166: MOVcc_I	<illegal instruction>
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 33)
	.word 0xb1e4a093  ! 168: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde52099  ! 170: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e5c000  ! 173: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_13:
	setx	0x1e0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a461c1  ! 178: SUBcc_I	subcc 	%r17, 0x01c1, %r26
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_14:
	setx	0x1d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_15:
	setx	0x1d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0e3  ! 188: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbc3421e3  ! 195: SUBC_I	orn 	%r16, 0x01e3, %r30
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_5:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_6:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_7:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7540000  ! 206: RDPR_GL	<illegal instruction>
	.word 0xb8b54000  ! 211: SUBCcc_R	orncc 	%r21, %r0, %r28
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e48000  ! 213: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde420c7  ! 215: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb09521ac  ! 220: ORcc_I	orcc 	%r20, 0x01ac, %r24
	.word 0xb9e54000  ! 221: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_7:
	mov	0x6, %r14
	.word 0xf2f38e80  ! 222: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_16:
	setx	0x1d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_8:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 227: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_17:
	setx	0x1f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_18:
	setx	0x1f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520e2  ! 232: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e44000  ! 238: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_9:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 239: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3e4e1ca  ! 245: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e4c000  ! 247: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 5)
	.word 0xbfe4a0ce  ! 252: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_19:
	setx	0x1e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520a3  ! 254: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e560fd  ! 255: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e40000  ! 256: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_20:
	setx	0x1c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_8:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 260: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e40000  ! 266: SAVE_R	save	%r16, %r0, %r27
	.word 0xb52d5000  ! 267: SLLX_R	sllx	%r21, %r0, %r26
	.word 0xb7e48000  ! 271: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_21:
	setx	0x1c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 280: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_10:
	mov	0x3, %r14
	.word 0xf8db8400  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1e4a1e2  ! 284: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe4a1a3  ! 286: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_11:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e42145  ! 290: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_22:
	setx	0x1d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68d4000  ! 293: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xb1e40000  ! 294: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_12:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e40000  ! 296: SAVE_R	save	%r16, %r0, %r26
	.word 0xb7e4a1ae  ! 297: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_23:
	setx	0x1c032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_9:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 302: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e52031  ! 303: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e520e9  ! 304: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_13:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_14:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 306: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbe3d4000  ! 309: XNOR_R	xnor 	%r21, %r0, %r31
cpu_intr_0_24:
	setx	0x1d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e14e  ! 312: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e56102  ! 313: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4e1d0  ! 314: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5e1af  ! 316: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e50000  ! 318: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_10:
	mov	0x38, %r14
	.word 0xfef38e60  ! 321: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb4854000  ! 325: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xb7e4e0f8  ! 328: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5a075  ! 329: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_11:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 331: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe54000  ! 336: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_25:
	setx	0x1d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0fd  ! 342: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5c000  ! 343: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9e5a135  ! 347: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbca4e09c  ! 349: SUBcc_I	subcc 	%r19, 0x009c, %r30
	.word 0xb3e48000  ! 350: SAVE_R	save	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_15:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 358: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e5a0a3  ! 363: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_16:
	mov	0x19, %r14
	.word 0xf4db8e40  ! 365: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_17:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 375: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e40000  ! 380: SAVE_R	save	%r16, %r0, %r26
	.word 0xb43d20e4  ! 383: XNOR_I	xnor 	%r20, 0x00e4, %r26
T0_asi_reg_wr_12:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 387: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfe50000  ! 388: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_13:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 390: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe56182  ! 401: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_26:
	setx	0x1c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 406: SAVE_R	save	%r19, %r0, %r30
	.word 0xbea58000  ! 407: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xb1e54000  ! 408: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e50000  ! 411: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_18:
	mov	0x1f, %r14
	.word 0xfcdb84a0  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbde5218e  ! 413: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e54000  ! 414: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e50000  ! 415: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_27:
	setx	0x1c0302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, a)
	.word 0xb1e52006  ! 424: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e4202e  ! 426: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_28:
	setx	0x1c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 433: SAVE_R	save	%r17, %r0, %r27
	.word 0xb20d0000  ! 436: AND_R	and 	%r20, %r0, %r25
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, e)
	.word 0xbd3d5000  ! 438: SRAX_R	srax	%r21, %r0, %r30
	.word 0xb3e4e100  ! 440: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e5e0d0  ! 446: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_19:
	mov	0x2c, %r14
	.word 0xfedb84a0  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_29:
	setx	0x1c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 450: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_30:
	setx	0x1e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_20:
	mov	0x18, %r14
	.word 0xf8db8400  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_31:
	setx	0x1c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c4000  ! 457: ANDcc_R	andcc 	%r17, %r0, %r25
	.word 0xbbe44000  ! 461: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe4604f  ! 464: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_14:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 465: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_32:
	setx	0x210103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e50000  ! 468: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_15:
	mov	0x4, %r14
	.word 0xfef38400  ! 470: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb7e4610b  ! 471: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_21:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 472: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_33:
	setx	0x220309, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_22:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_16:
	mov	0x14, %r14
	.word 0xfcf384a0  ! 479: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb4b44000  ! 481: SUBCcc_R	orncc 	%r17, %r0, %r26
T0_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 483: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_rd_23:
	mov	0x12, %r14
	.word 0xf0db89e0  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_18:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 489: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbde5a13a  ! 494: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe54000  ! 495: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_34:
	setx	0x220008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 500: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe5a10d  ! 503: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e54000  ! 506: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e4e1a6  ! 511: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbebc201b  ! 512: XNORcc_I	xnorcc 	%r16, 0x001b, %r31
T0_asi_reg_rd_24:
	mov	0x1f, %r14
	.word 0xf2db8e60  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 16)
	.word 0xb62420e5  ! 522: SUB_I	sub 	%r16, 0x00e5, %r27
	.word 0xbbe4c000  ! 525: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_35:
	setx	0x220317, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_19:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 528: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde50000  ! 529: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_25:
	mov	0x7, %r14
	.word 0xf2db8e80  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe46097  ! 540: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e48000  ! 545: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_36:
	setx	0x20011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0x36, %r14
	.word 0xf2f38e80  ! 550: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_21:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 551: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_37:
	setx	0x220001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e5608f  ! 560: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbc84c000  ! 561: ADDcc_R	addcc 	%r19, %r0, %r30
T0_asi_reg_rd_26:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1e5c000  ! 565: SAVE_R	save	%r23, %r0, %r24
	.word 0xbeac8000  ! 566: ANDNcc_R	andncc 	%r18, %r0, %r31
T0_asi_reg_rd_27:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_38:
	setx	0x220321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420d7  ! 570: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_39:
	setx	0x230316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8421e9  ! 573: ADDcc_I	addcc 	%r16, 0x01e9, %r30
	.word 0xbe05c000  ! 574: ADD_R	add 	%r23, %r0, %r31
	.word 0xbbe460d6  ! 575: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe48000  ! 576: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_40:
	setx	0x200133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_22:
	mov	0x12, %r14
	.word 0xfef384a0  ! 578: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_28:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb3e560cb  ! 581: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e5a12a  ! 586: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_41:
	setx	0x35, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 590: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_42:
	setx	0x210200, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_29:
	mov	0xd, %r14
	.word 0xf4db84a0  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbde58000  ! 599: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_30:
	mov	0x3c0, %r14
	.word 0xfedb89e0  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7e4212e  ! 604: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_43:
	setx	0x1b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_23:
	mov	0x7, %r14
	.word 0xf0f38e60  ! 607: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e420d5  ! 612: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb48c21d4  ! 613: ANDcc_I	andcc 	%r16, 0x01d4, %r26
	.word 0xbbe5e003  ! 614: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbbe5205b  ! 615: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb6248000  ! 617: SUB_R	sub 	%r18, %r0, %r27
	.word 0xb1e40000  ! 619: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_44:
	setx	0x230004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_45:
	setx	0x220336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_46:
	setx	0x230305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 626: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_31:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 627: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb49de122  ! 629: XORcc_I	xorcc 	%r23, 0x0122, %r26
T0_asi_reg_rd_32:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 5)
	.word 0xbde50000  ! 645: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_33:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_34:
	mov	0x1c, %r14
	.word 0xf6db8400  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5e4212c  ! 651: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_47:
	setx	0x220031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_35:
	mov	0x1a, %r14
	.word 0xf6db8e60  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbbe4e002  ! 661: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_48:
	setx	0x23000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5203d  ! 664: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e560dc  ! 670: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_36:
	mov	0x31, %r14
	.word 0xf2db8400  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 2)
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
	.word 0xb69c2038  ! 681: XORcc_I	xorcc 	%r16, 0x0038, %r27
T0_asi_reg_wr_24:
	mov	0x16, %r14
	.word 0xfaf384a0  ! 684: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbbe4217d  ! 685: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_49:
	setx	0x23010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4211a  ! 692: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_25:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 694: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e4a07e  ! 695: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e44000  ! 701: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe4a091  ! 706: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb12ce001  ! 707: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xbde4e179  ! 708: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xba954000  ! 710: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xb9e4a091  ! 711: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_50:
	setx	0x230018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_51:
	setx	0x200234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_52:
	setx	0x210223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbfe50000  ! 725: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_53:
	setx	0x200138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_54:
	setx	0x20032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0x13, %r14
	.word 0xf4db8e60  ! 731: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbfe4e064  ! 736: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e48000  ! 738: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_wr_26:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 739: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbe44a12d  ! 742: ADDC_I	addc 	%r18, 0x012d, %r31
	.word 0xb1e4c000  ! 744: SAVE_R	save	%r19, %r0, %r24
	.word 0xbde4a06d  ! 745: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_55:
	setx	0x230120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe5607a  ! 751: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a042  ! 752: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4e1ae  ! 760: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_56:
	setx	0x20033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_57:
	setx	0x210125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_58:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 768: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_27:
	mov	0x17, %r14
	.word 0xfcf38e80  ! 769: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_59:
	setx	0x230314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_38:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, e)
	.word 0xb5e520ed  ! 779: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_39:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_28:
	mov	0x5, %r14
	.word 0xf6f38400  ! 786: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_60:
	setx	0x21032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_61:
	setx	0x20031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 791: SAVE_R	save	%r22, %r0, %r25
	.word 0xbe950000  ! 794: ORcc_R	orcc 	%r20, %r0, %r31
	.word 0xb7e54000  ! 797: SAVE_R	save	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_62:
	setx	0x200233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 800: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e4a0e6  ! 803: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e4c000  ! 807: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_63:
	setx	0x220202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_64:
	setx	0x23003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_65:
	setx	0x22020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e01d  ! 814: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8794a0dc  ! 815: WRPR_TT_I	wrpr	%r18, 0x00dc, %tt
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 5)
	.word 0xbbe4a0b8  ! 820: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe56113  ! 822: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb884e1cf  ! 824: ADDcc_I	addcc 	%r19, 0x01cf, %r28
	.word 0xb7e5e0ab  ! 825: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde40000  ! 827: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_40:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 829: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7e48000  ! 831: SAVE_R	save	%r18, %r0, %r27
	.word 0xb5e5207b  ! 832: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb72de001  ! 833: SLL_I	sll 	%r23, 0x0001, %r27
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb3e54000  ! 836: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe40000  ! 839: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_66:
	setx	0x230238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe14e00d  ! 844: OR_I	or 	%r19, 0x000d, %r31
T0_asi_reg_rd_41:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_42:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbf2ce001  ! 847: SLL_I	sll 	%r19, 0x0001, %r31
T0_asi_reg_wr_29:
	mov	0x3c7, %r14
	.word 0xfaf38e80  ! 850: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb7e54000  ! 855: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_43:
	mov	0x33, %r14
	.word 0xfadb89e0  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_44:
	mov	0x17, %r14
	.word 0xf2db84a0  ! 857: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_67:
	setx	0x200204, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_45:
	mov	0x33, %r14
	.word 0xf4db89e0  ! 870: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbde4a098  ! 871: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_30:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 873: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7e420fc  ! 874: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e4605a  ! 876: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_46:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 879: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1e40000  ! 880: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_47:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_68:
	setx	0x210122, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_69:
	setx	0x200201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e5e10f  ! 897: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_48:
	mov	0x1d, %r14
	.word 0xf4db8e80  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbfe50000  ! 904: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe5a086  ! 905: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde4e11a  ! 908: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb52d5000  ! 911: SLLX_R	sllx	%r21, %r0, %r26
	.word 0xb1e5e01e  ! 917: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_70:
	setx	0x270125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 923: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 38)
	.word 0xb28dc000  ! 926: ANDcc_R	andcc 	%r23, %r0, %r25
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_71:
	setx	0x260116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_72:
	setx	0x270030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_49:
	mov	0xe, %r14
	.word 0xfadb8e80  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7e58000  ! 941: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_50:
	mov	0x0, %r14
	.word 0xfadb8400  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1540000  ! 948: RDPR_GL	<illegal instruction>
	.word 0xbbe560c5  ! 949: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_73:
	setx	0x260005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_31:
	mov	0x2c, %r14
	.word 0xf2f389e0  ! 952: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb4348000  ! 953: ORN_R	orn 	%r18, %r0, %r26
cpu_intr_0_74:
	setx	0x250330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba850000  ! 956: ADDcc_R	addcc 	%r20, %r0, %r29
cpu_intr_0_75:
	setx	0x26010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_76:
	setx	0x260220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 16)
	.word 0xb0c44000  ! 967: ADDCcc_R	addccc 	%r17, %r0, %r24
cpu_intr_0_77:
	setx	0x270310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_78:
	setx	0x270307, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, f)
	.word 0xb5e52140  ! 981: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 37)
	.word 0xbbe4c000  ! 984: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_79:
	setx	0x260135, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e58000  ! 988: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e50000  ! 1000: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe54000  ! 1004: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_80:
	setx	0x260116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 1008: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e5c000  ! 1009: SAVE_R	save	%r23, %r0, %r24
	.word 0xb335b001  ! 1013: SRLX_I	srlx	%r22, 0x0001, %r25
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e58000  ! 1015: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 37)
	.word 0xbfe5e0a0  ! 1019: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e4607b  ! 1024: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_81:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1dd  ! 1029: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e4a1b9  ! 1030: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde40000  ! 1031: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_82:
	setx	0x27003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_83:
	setx	0x27000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_51:
	mov	0xa, %r14
	.word 0xf0db8e60  ! 1038: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe54000  ! 1042: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe5a01a  ! 1049: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde54000  ! 1053: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e58000  ! 1058: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_32:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 1059: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e40000  ! 1060: SAVE_R	save	%r16, %r0, %r27
	.word 0xb5e421b9  ! 1063: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe5217f  ! 1065: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe58000  ! 1072: SAVE_R	save	%r22, %r0, %r29
	.word 0xb7e56118  ! 1073: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_52:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_33:
	mov	0x8, %r14
	.word 0xf2f38400  ! 1077: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_34:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 1080: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_84:
	setx	0x212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e420c4  ! 1087: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e42192  ! 1088: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e5202c  ! 1090: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_53:
	mov	0x32, %r14
	.word 0xf6db8e60  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_85:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0150000  ! 1093: OR_R	or 	%r20, %r0, %r24
	.word 0xb3e5e159  ! 1094: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_54:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbe0420d9  ! 1096: ADD_I	add 	%r16, 0x00d9, %r31
	.word 0xb7e5e16c  ! 1097: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_86:
	setx	0x270213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 1099: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_87:
	setx	0x260238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde4a0ab  ! 1109: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e561c9  ! 1111: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_55:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_88:
	setx	0x240235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 1121: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_89:
	setx	0x270119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe48000  ! 1128: SAVE_R	save	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_35:
	mov	0x35, %r14
	.word 0xf2f389e0  ! 1132: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb1e56182  ! 1133: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_36:
	mov	0x33, %r14
	.word 0xf0f38400  ! 1135: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_90:
	setx	0x26032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_91:
	setx	0x240329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_56:
	mov	0x1b, %r14
	.word 0xf0db84a0  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_57:
	mov	0x30, %r14
	.word 0xfcdb8e80  ! 1154: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3e46039  ! 1156: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4a1ad  ! 1159: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe46077  ! 1161: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb03ce174  ! 1165: XNOR_I	xnor 	%r19, 0x0174, %r24
	.word 0xbde5213f  ! 1169: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_92:
	setx	0x250329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_93:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_58:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_94:
	setx	0x24013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_95:
	setx	0x250038, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_59:
	mov	0x10, %r14
	.word 0xfedb84a0  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb3e4a179  ! 1187: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe50000  ! 1189: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, b)
	.word 0xb2b56094  ! 1197: SUBCcc_I	orncc 	%r21, 0x0094, %r25
	.word 0xb0140000  ! 1198: OR_R	or 	%r16, %r0, %r24
T0_asi_reg_wr_37:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 1200: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a151  ! 1207: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e5a1c7  ! 1208: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4c000  ! 1209: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde560ac  ! 1214: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5e014  ! 1221: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4603f  ! 1222: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4c000  ! 1225: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 3)
	.word 0xbfe420b1  ! 1237: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_61:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3e5e0df  ! 1244: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e5c000  ! 1249: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe44000  ! 1253: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e4a1ae  ! 1259: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_96:
	setx	0x26013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e0b7  ! 1267: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e40000  ! 1268: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e4618b  ! 1269: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_97:
	setx	0x250224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_62:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1273: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde56196  ! 1282: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e44000  ! 1283: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_38:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 1286: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_39:
	mov	0x26, %r14
	.word 0xf6f384a0  ! 1288: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_98:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_63:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb8a4a144  ! 1295: SUBcc_I	subcc 	%r18, 0x0144, %r28
	.word 0xbde4e187  ! 1296: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e5a1cf  ! 1298: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4c000  ! 1300: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_64:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde48000  ! 1302: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_65:
	mov	0x1b, %r14
	.word 0xf8db8e80  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e54000  ! 1308: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_99:
	setx	0x25000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_100:
	setx	0x24000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5611b  ! 1315: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e50000  ! 1317: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde44000  ! 1320: SAVE_R	save	%r17, %r0, %r30
	.word 0xb7e44000  ! 1321: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_101:
	setx	0x24023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_102:
	setx	0x250225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 1337: MOVcc_I	<illegal instruction>
cpu_intr_0_103:
	setx	0x27030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e4e16f  ! 1341: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_66:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3e44000  ! 1347: SAVE_R	save	%r17, %r0, %r25
	.word 0xbb346001  ! 1348: SRL_I	srl 	%r17, 0x0001, %r29
T0_asi_reg_rd_67:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_104:
	setx	0x24032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_68:
	mov	0x7, %r14
	.word 0xf8db8400  ! 1353: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_40:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 1357: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_105:
	setx	0x25013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_106:
	setx	0x240307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_107:
	setx	0x27013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 1368: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_108:
	setx	0x250319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebd4000  ! 1372: XNORcc_R	xnorcc 	%r21, %r0, %r31
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 31)
	.word 0xb3e5e0ac  ! 1374: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_109:
	setx	0x26010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 32)
	.word 0xb7e4c000  ! 1378: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_110:
	setx	0x24011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_111:
	setx	0x260014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_41:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 1383: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 1384: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e460c5  ! 1385: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e4c000  ! 1386: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_112:
	setx	0x26000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e54000  ! 1390: SAVE_R	save	%r21, %r0, %r24
	.word 0xbfe50000  ! 1391: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e54000  ! 1392: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e4a138  ! 1396: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e40000  ! 1397: SAVE_R	save	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e5e004  ! 1400: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe54000  ! 1401: SAVE_R	save	%r21, %r0, %r31
	.word 0xb5e52150  ! 1403: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, c)
	.word 0xb4942091  ! 1405: ORcc_I	orcc 	%r16, 0x0091, %r26
	.word 0xbfe4e0b1  ! 1406: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_113:
	setx	0x2a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_69:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 1417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe4c000  ! 1418: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_70:
	mov	0x7, %r14
	.word 0xf4db8400  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_114:
	setx	0x2a021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 1422: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_71:
	mov	0x22, %r14
	.word 0xfcdb8400  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbcc44000  ! 1427: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0xb9e42002  ! 1429: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_115:
	setx	0x2b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd351000  ! 1433: SRLX_R	srlx	%r20, %r0, %r30
	.word 0xbde5c000  ! 1436: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e40000  ! 1441: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_116:
	setx	0x29032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_117:
	setx	0x2b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_72:
	mov	0xc, %r14
	.word 0xf0db8e40  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_43:
	mov	0x2d, %r14
	.word 0xfcf38400  ! 1450: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7e48000  ! 1451: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_118:
	setx	0x2b0237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_44:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 1461: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde54000  ! 1464: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e5e034  ! 1466: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e50000  ! 1469: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_119:
	setx	0x29011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 1472: SAVE_R	save	%r16, %r0, %r31
	.word 0xb9e54000  ! 1474: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e58000  ! 1479: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_120:
	setx	0x2b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_45:
	mov	0x9, %r14
	.word 0xf2f38400  ! 1488: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_73:
	mov	0x10, %r14
	.word 0xf8db8e60  ! 1489: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_121:
	setx	0x280112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_122:
	setx	0x2a0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c4000  ! 1492: ANDcc_R	andcc 	%r17, %r0, %r28
cpu_intr_0_123:
	setx	0x290131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56164  ! 1495: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e52053  ! 1496: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_124:
	setx	0x28011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e48000  ! 1502: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_125:
	setx	0x2b0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1507: SAVE_R	save	%r22, %r0, %r25
	.word 0xb7e4e011  ! 1508: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_46:
	mov	0x29, %r14
	.word 0xfef38e40  ! 1510: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbe35a0f6  ! 1513: SUBC_I	orn 	%r22, 0x00f6, %r31
	.word 0xb3e4c000  ! 1514: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e48000  ! 1516: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe4e163  ! 1526: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xba8cc000  ! 1527: ANDcc_R	andcc 	%r19, %r0, %r29
T0_asi_reg_wr_47:
	mov	0x13, %r14
	.word 0xfef38e60  ! 1529: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e5a17a  ! 1531: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_126:
	setx	0x2b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_74:
	mov	0x9, %r14
	.word 0xfcdb8e60  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 18)
	.word 0xbd354000  ! 1539: SRL_R	srl 	%r21, %r0, %r30
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e4619d  ! 1545: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_75:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbf34e001  ! 1547: SRL_I	srl 	%r19, 0x0001, %r31
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e54000  ! 1549: SAVE_R	save	%r21, %r0, %r27
	.word 0xbd340000  ! 1553: SRL_R	srl 	%r16, %r0, %r30
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_127:
	setx	0x2a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe460f2  ! 1558: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde5a06c  ! 1562: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_76:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 1567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e50000  ! 1569: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde5e01a  ! 1571: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1518000  ! 1577: RDPR_PSTATE	<illegal instruction>
cpu_intr_0_128:
	setx	0x280328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4605d  ! 1582: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe5e0be  ! 1586: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe4e1f1  ! 1589: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_129:
	setx	0x29021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 1591: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde4a1b1  ! 1592: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e54000  ! 1593: SAVE_R	save	%r21, %r0, %r25
	.word 0xb2244000  ! 1595: SUB_R	sub 	%r17, %r0, %r25
	.word 0xbde5a1fa  ! 1596: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_130:
	setx	0x2b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_48:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 1609: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbca44000  ! 1610: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xbde5c000  ! 1612: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_77:
	mov	0x36, %r14
	.word 0xfadb8400  ! 1619: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_49:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 1622: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_50:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 1623: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 1626: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_131:
	setx	0x2b011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435c000  ! 1631: ORN_R	orn 	%r23, %r0, %r26
	.word 0xbbe58000  ! 1633: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_78:
	mov	0xf, %r14
	.word 0xf0db84a0  ! 1635: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_132:
	setx	0x290337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1640: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e58000  ! 1641: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_133:
	setx	0x29001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_79:
	mov	0x2, %r14
	.word 0xf6db8e80  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e58000  ! 1645: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e46045  ! 1652: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe46045  ! 1653: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_80:
	mov	0x19, %r14
	.word 0xfcdb89e0  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_81:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb17d8400  ! 1661: MOVR_R	movre	%r22, %r0, %r24
	.word 0xb1e5c000  ! 1662: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e40000  ! 1666: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7e40000  ! 1668: SAVE_R	save	%r16, %r0, %r27
	.word 0xbbe421bf  ! 1669: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe461d1  ! 1671: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb43ca1ed  ! 1675: XNOR_I	xnor 	%r18, 0x01ed, %r26
	.word 0xb934f001  ! 1676: SRLX_I	srlx	%r19, 0x0001, %r28
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_82:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 1683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfe56124  ! 1684: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_51:
	mov	0x3, %r14
	.word 0xf4f38400  ! 1688: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb9e4203f  ! 1689: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e48000  ! 1690: SAVE_R	save	%r18, %r0, %r24
	.word 0xba254000  ! 1693: SUB_R	sub 	%r21, %r0, %r29
T0_asi_reg_wr_52:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 1695: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfe52086  ! 1699: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x9195a11f  ! 1707: WRPR_PIL_I	wrpr	%r22, 0x011f, %pil
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb93d4000  ! 1717: SRA_R	sra 	%r21, %r0, %r28
	.word 0xbbe5202e  ! 1724: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb6b42190  ! 1729: SUBCcc_I	orncc 	%r16, 0x0190, %r27
T0_asi_reg_rd_83:
	mov	0x25, %r14
	.word 0xf8db8400  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb5e48000  ! 1735: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e54000  ! 1738: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e4216d  ! 1740: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_134:
	setx	0x2b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_53:
	mov	0x28, %r14
	.word 0xf8f38400  ! 1746: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_54:
	mov	0x3, %r14
	.word 0xfef38400  ! 1748: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe4610e  ! 1750: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e54000  ! 1751: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_55:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 1753: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 1754: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_135:
	setx	0x2a020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 1757: SAVE_R	save	%r20, %r0, %r24
	.word 0xbde460a6  ! 1758: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_136:
	setx	0x2b0200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_137:
	setx	0x29032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 1765: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_138:
	setx	0x10202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e4a0fe  ! 1770: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5c000  ! 1772: SAVE_R	save	%r23, %r0, %r31
	.word 0xbfe52068  ! 1773: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_57:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 1782: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_rd_84:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb4444000  ! 1787: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xb9e5615f  ! 1791: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe40000  ! 1792: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_58:
	mov	0xc, %r14
	.word 0xf0f384a0  ! 1793: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbe0c613f  ! 1794: AND_I	and 	%r17, 0x013f, %r31
	.word 0xb1e4a0e9  ! 1795: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_139:
	setx	0x2a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_85:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e4c000  ! 1803: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e421f1  ! 1805: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_140:
	setx	0x280224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 1808: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde4c000  ! 1809: SAVE_R	save	%r19, %r0, %r30
	.word 0xb004e04e  ! 1810: ADD_I	add 	%r19, 0x004e, %r24
T0_asi_reg_wr_59:
	mov	0xa, %r14
	.word 0xf4f389e0  ! 1813: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbbe4e1c7  ! 1818: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_86:
	mov	0x1c, %r14
	.word 0xf0db84a0  ! 1819: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_141:
	setx	0x2a0115, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_87:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_142:
	setx	0x2a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_143:
	setx	0x290102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 1826: RDPR_GL	<illegal instruction>
	.word 0xb7e40000  ! 1828: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e4205a  ! 1837: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbe14a12e  ! 1843: OR_I	or 	%r18, 0x012e, %r31
	.word 0xb5e5a18e  ! 1844: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe48000  ! 1847: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe42040  ! 1848: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_60:
	mov	0x2c, %r14
	.word 0xfef389e0  ! 1851: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e44000  ! 1857: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_61:
	mov	0x25, %r14
	.word 0xfcf38e80  ! 1859: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_62:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 1862: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_63:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 1867: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e5e161  ! 1871: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5e14c  ! 1873: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde58000  ! 1877: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_144:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_145:
	setx	0x2d023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e039  ! 1886: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_88:
	mov	0x11, %r14
	.word 0xf0db84a0  ! 1890: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb33d8000  ! 1894: SRA_R	sra 	%r22, %r0, %r25
	.word 0xbfe4a0fd  ! 1897: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_146:
	setx	0x2d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 1902: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe4a1c6  ! 1903: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e40000  ! 1906: SAVE_R	save	%r16, %r0, %r27
	.word 0xb9e5c000  ! 1907: SAVE_R	save	%r23, %r0, %r28
	.word 0xbbe5a128  ! 1908: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_64:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 1909: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe5e04c  ! 1912: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe50000  ! 1916: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_147:
	setx	0x2e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2444000  ! 1918: ADDC_R	addc 	%r17, %r0, %r25
cpu_intr_0_148:
	setx	0x2d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 1923: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe40000  ! 1924: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e5a166  ! 1925: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_149:
	setx	0x2d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_89:
	mov	0x25, %r14
	.word 0xf8db8e80  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7e46197  ! 1934: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4e049  ! 1935: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_90:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_91:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_65:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 1945: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_92:
	mov	0xc, %r14
	.word 0xf2db89e0  ! 1946: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_150:
	setx	0x2e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 1953: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_151:
	setx	0x2d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_66:
	mov	0x1b, %r14
	.word 0xfaf38e80  ! 1958: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 10)
	.word 0xbf7c4400  ! 1962: MOVR_R	movre	%r17, %r0, %r31
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1e48000  ! 1964: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde42105  ! 1965: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e421f5  ! 1967: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_93:
	mov	0x1f, %r14
	.word 0xf2db89e0  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfe460b8  ! 1970: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbfe5a1fc  ! 1971: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e5e178  ! 1973: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_94:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde52186  ! 1979: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb2346083  ! 1985: SUBC_I	orn 	%r17, 0x0083, %r25
T0_asi_reg_rd_95:
	mov	0x12, %r14
	.word 0xf2db8400  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e4205b  ! 1990: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e5600e  ! 1993: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e4c000  ! 1997: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e54000  ! 1998: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_67:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2001: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_96:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 2003: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb0a4e128  ! 2005: SUBcc_I	subcc 	%r19, 0x0128, %r24
T0_asi_reg_wr_68:
	mov	0x2, %r14
	.word 0xf4f38e60  ! 2007: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_97:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 2008: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_98:
	mov	0x29, %r14
	.word 0xf0db8400  ! 2009: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbde4a0b2  ! 2024: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_69:
	mov	0x21, %r14
	.word 0xfcf38400  ! 2026: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbde5c000  ! 2030: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_152:
	setx	0x2d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e5e0ee  ! 2038: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e5c000  ! 2045: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe40000  ! 2047: SAVE_R	save	%r16, %r0, %r31
	.word 0xb3e4e147  ! 2048: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde52073  ! 2053: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e40000  ! 2056: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe5a138  ! 2059: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb93da001  ! 2064: SRA_I	sra 	%r22, 0x0001, %r28
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_99:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_70:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 2073: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbaada12e  ! 2074: ANDNcc_I	andncc 	%r22, 0x012e, %r29
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_153:
	setx	0x2f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 2079: SAVE_R	save	%r16, %r0, %r27
	.word 0xb7e4e02c  ! 2081: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5c000  ! 2085: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_100:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2089: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_rd_101:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 2090: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_71:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 2091: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbbe5c000  ! 2093: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, c)
	.word 0xbeac0000  ! 2098: ANDNcc_R	andncc 	%r16, %r0, %r31
cpu_intr_0_154:
	setx	0x2e013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 2102: SAVE_R	save	%r16, %r0, %r27
	.word 0xbb2c4000  ! 2104: SLL_R	sll 	%r17, %r0, %r29
	.word 0xbfe560df  ! 2105: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbde4e1f9  ! 2107: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde44000  ! 2113: SAVE_R	save	%r17, %r0, %r30
	.word 0xbde5c000  ! 2114: SAVE_R	save	%r23, %r0, %r30
	.word 0xbf345000  ! 2116: SRLX_R	srlx	%r17, %r0, %r31
	.word 0xb9e5c000  ! 2119: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_155:
	setx	0x2d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_103:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 2127: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe4205f  ! 2130: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e58000  ! 2131: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e58000  ! 2135: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_104:
	mov	0x37, %r14
	.word 0xfadb89e0  ! 2141: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_156:
	setx	0x2f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e460d3  ! 2146: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbcbca0e2  ! 2148: XNORcc_I	xnorcc 	%r18, 0x00e2, %r30
T0_asi_reg_wr_72:
	mov	0x11, %r14
	.word 0xf6f384a0  ! 2149: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbf3d8000  ! 2150: SRA_R	sra 	%r22, %r0, %r31
	.word 0xb5e5e070  ! 2151: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e5c000  ! 2154: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_105:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_157:
	setx	0x2d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 2171: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_158:
	setx	0x2c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde561f7  ! 2180: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb4ad4000  ! 2181: ANDNcc_R	andncc 	%r21, %r0, %r26
T0_asi_reg_rd_106:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xba0c61ec  ! 2183: AND_I	and 	%r17, 0x01ec, %r29
T0_asi_reg_wr_73:
	mov	0x1c, %r14
	.word 0xf8f389e0  ! 2184: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7342001  ! 2186: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0xbbe5c000  ! 2191: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_159:
	setx	0x2f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_160:
	setx	0x2d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_161:
	setx	0x2e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e44000  ! 2200: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_107:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_108:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_162:
	setx	0x2e0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e07a  ! 2209: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe561f9  ! 2210: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e50000  ! 2212: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e50000  ! 2218: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_163:
	setx	0x2d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_109:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_110:
	mov	0x1a, %r14
	.word 0xf0db84a0  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e5c000  ! 2227: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_164:
	setx	0x2f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb9e44000  ! 2250: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e5a128  ! 2254: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe44000  ! 2255: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_165:
	setx	0x2e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_74:
	mov	0xb, %r14
	.word 0xf8f38e60  ! 2259: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, b)
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_166:
	setx	0x2e023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2265: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_75:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 2266: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_167:
	setx	0x2e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e40000  ! 2271: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe44000  ! 2272: SAVE_R	save	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_111:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 2278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_76:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 2279: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_112:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 2281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb52d1000  ! 2283: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xb9e5a0ee  ! 2284: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_168:
	setx	0x2e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_169:
	setx	0x2e010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf352001  ! 2290: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xb7e52009  ! 2291: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe4a133  ! 2296: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_170:
	setx	0x2d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe854000  ! 2301: ADDcc_R	addcc 	%r21, %r0, %r31
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb0042059  ! 2304: ADD_I	add 	%r16, 0x0059, %r24
	.word 0xb5e58000  ! 2307: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 34)
	.word 0xba846073  ! 2310: ADDcc_I	addcc 	%r17, 0x0073, %r29
	.word 0xb1e4c000  ! 2311: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 2312: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e5e0c9  ! 2314: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_77:
	mov	0xd, %r14
	.word 0xf2f384a0  ! 2319: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e4a0b4  ! 2322: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_171:
	setx	0x33001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 2324: SAVE_R	save	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb49c0000  ! 2328: XORcc_R	xorcc 	%r16, %r0, %r26
T0_asi_reg_wr_78:
	mov	0x37, %r14
	.word 0xf4f38400  ! 2329: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_79:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 2330: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_172:
	setx	0x31021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5c000  ! 2332: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xb5e44000  ! 2334: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_114:
	mov	0x35, %r14
	.word 0xf8db84a0  ! 2335: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9520000  ! 2338: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde46020  ! 2340: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 23)
	.word 0xb5e54000  ! 2343: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_115:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e460a7  ! 2349: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb8b44000  ! 2350: SUBCcc_R	orncc 	%r17, %r0, %r28
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbde421fc  ! 2354: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e5e1aa  ! 2356: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_80:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 2359: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_173:
	setx	0x33013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_174:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x320220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_81:
	mov	0x14, %r14
	.word 0xf0f38e80  ! 2365: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3e58000  ! 2366: SAVE_R	save	%r22, %r0, %r25
	.word 0xb2956189  ! 2367: ORcc_I	orcc 	%r21, 0x0189, %r25
	.word 0xb1e42032  ! 2368: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5c000  ! 2369: SAVE_R	save	%r23, %r0, %r25
	.word 0xb5e5a146  ! 2371: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e40000  ! 2376: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde58000  ! 2378: SAVE_R	save	%r22, %r0, %r30
	.word 0xbfe4e135  ! 2381: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbe1d8000  ! 2383: XOR_R	xor 	%r22, %r0, %r31
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5e4a1d8  ! 2387: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe58000  ! 2389: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e4c000  ! 2393: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_176:
	setx	0x300300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_177:
	setx	0x300025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 2400: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_82:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 2403: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_116:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7e460fa  ! 2408: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb0a50000  ! 2409: SUBcc_R	subcc 	%r20, %r0, %r24
T0_asi_reg_rd_117:
	mov	0x14, %r14
	.word 0xf6db8400  ! 2414: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_118:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1e4a0ef  ! 2417: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb834a013  ! 2418: SUBC_I	orn 	%r18, 0x0013, %r28
T0_asi_reg_rd_119:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e4e1c4  ! 2423: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_83:
	mov	0x2f, %r14
	.word 0xfcf38e80  ! 2424: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_84:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 2426: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbbe5c000  ! 2429: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e4618a  ! 2431: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb03de148  ! 2433: XNOR_I	xnor 	%r23, 0x0148, %r24
	.word 0xbfe460ed  ! 2436: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_120:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 2437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfe48000  ! 2443: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_121:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1e58000  ! 2446: SAVE_R	save	%r22, %r0, %r24
	.word 0xbfe58000  ! 2447: SAVE_R	save	%r22, %r0, %r31
	.word 0xb7e44000  ! 2450: SAVE_R	save	%r17, %r0, %r27
	.word 0xbde5a062  ! 2452: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4c000  ! 2453: SAVE_R	save	%r19, %r0, %r25
	.word 0xb1e5e1c5  ! 2454: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e561e4  ! 2459: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e460b8  ! 2464: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_178:
	setx	0x330017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 2467: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e44000  ! 2468: SAVE_R	save	%r17, %r0, %r25
	.word 0xb92cf001  ! 2469: SLLX_I	sllx	%r19, 0x0001, %r28
cpu_intr_0_179:
	setx	0x30003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e044  ! 2475: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e50000  ! 2476: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3345000  ! 2479: SRLX_R	srlx	%r17, %r0, %r25
T0_asi_reg_wr_85:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 2480: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e4e1e9  ! 2482: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e5a017  ! 2485: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_86:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 2486: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb1e48000  ! 2487: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_180:
	setx	0x320125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a18d  ! 2493: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_181:
	setx	0x330205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_182:
	setx	0x30012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0af  ! 2501: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_122:
	mov	0x6, %r14
	.word 0xfadb8e60  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_183:
	setx	0x32001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 2505: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_184:
	setx	0x33031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004e074  ! 2513: ADD_I	add 	%r19, 0x0074, %r24
T0_asi_reg_wr_87:
	mov	0x33, %r14
	.word 0xf6f38e60  ! 2515: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_88:
	mov	0x17, %r14
	.word 0xf6f38e60  ! 2516: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_185:
	setx	0x320116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e092  ! 2519: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb6b58000  ! 2520: SUBCcc_R	orncc 	%r22, %r0, %r27
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e4e1d4  ! 2526: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5c000  ! 2527: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_186:
	setx	0x310236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbabc0000  ! 2533: XNORcc_R	xnorcc 	%r16, %r0, %r29
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e4a0b8  ! 2535: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5e031  ! 2536: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_123:
	mov	0x2, %r14
	.word 0xfcdb89e0  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbbe4a0c3  ! 2544: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_89:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 2546: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbe44a053  ! 2547: ADDC_I	addc 	%r18, 0x0053, %r31
T0_asi_reg_rd_124:
	mov	0x34, %r14
	.word 0xf8db8e60  ! 2548: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_187:
	setx	0x33023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e126  ! 2551: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_125:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e4216b  ! 2558: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_126:
	mov	0x15, %r14
	.word 0xf0db89e0  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_188:
	setx	0x330310, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_127:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2565: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_189:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_90:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 2575: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe5e124  ! 2577: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_91:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 2578: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb0ac6045  ! 2579: ANDNcc_I	andncc 	%r17, 0x0045, %r24
T0_asi_reg_wr_92:
	mov	0x2a, %r14
	.word 0xfef389e0  ! 2580: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbde5a067  ! 2582: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_190:
	setx	0x32011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 10)
	.word 0xb72d6001  ! 2586: SLL_I	sll 	%r21, 0x0001, %r27
	.word 0xbde5612c  ! 2587: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb6b4c000  ! 2590: ORNcc_R	orncc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_93:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 2597: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbde4e047  ! 2600: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e58000  ! 2602: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_94:
	mov	0x5, %r14
	.word 0xfef389e0  ! 2604: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb1e4c000  ! 2605: SAVE_R	save	%r19, %r0, %r24
	.word 0xbfe4c000  ! 2606: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e58000  ! 2608: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe40000  ! 2609: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_128:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_191:
	setx	0x310233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d4400  ! 2616: MOVR_R	movre	%r21, %r0, %r27
	.word 0x8394a11f  ! 2617: WRPR_TNPC_I	wrpr	%r18, 0x011f, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_192:
	setx	0x310006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a07e  ! 2628: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e48000  ! 2631: SAVE_R	save	%r18, %r0, %r24
	.word 0xbfe5e17c  ! 2632: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5e5a163  ! 2642: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe54000  ! 2644: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_95:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 2645: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_96:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 2647: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1e4e0cb  ! 2648: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_193:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 2655: SAVE_R	save	%r19, %r0, %r25
	.word 0xbbe54000  ! 2656: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_97:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 2657: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_194:
	setx	0x300124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e44000  ! 2666: SAVE_R	save	%r17, %r0, %r28
	.word 0xbac50000  ! 2667: ADDCcc_R	addccc 	%r20, %r0, %r29
	.word 0xb1e4a08a  ! 2669: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe44000  ! 2670: SAVE_R	save	%r17, %r0, %r29
	.word 0x8f902001  ! 2671: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cpu_intr_0_195:
	setx	0x31031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0e6  ! 2678: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 34)
	.word 0xbe9c8000  ! 2683: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xb3e521c7  ! 2685: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb4050000  ! 2688: ADD_R	add 	%r20, %r0, %r26
T0_asi_reg_wr_98:
	mov	0x2b, %r14
	.word 0xf8f384a0  ! 2689: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0x8f902000  ! 2691: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T0_asi_reg_rd_129:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e5e1ba  ! 2695: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 16)
	.word 0xb7e5a045  ! 2697: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde48000  ! 2701: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7347001  ! 2706: SRLX_I	srlx	%r17, 0x0001, %r27
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_196:
	setx	0x310224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4603a  ! 2718: ORNcc_I	orncc 	%r17, 0x003a, %r25
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb8450000  ! 2721: ADDC_R	addc 	%r20, %r0, %r28
cpu_intr_0_197:
	setx	0x320038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_198:
	setx	0x310133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_199:
	setx	0x30031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 2732: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_200:
	setx	0x30001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_99:
	mov	0x35, %r14
	.word 0xfef38e40  ! 2739: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e54000  ! 2741: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_201:
	setx	0x33003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561be  ! 2743: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e44000  ! 2744: SAVE_R	save	%r17, %r0, %r27
	.word 0xbde461bd  ! 2747: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde44000  ! 2750: SAVE_R	save	%r17, %r0, %r30
	.word 0xbec54000  ! 2752: ADDCcc_R	addccc 	%r21, %r0, %r31
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_100:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 2759: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb00520c5  ! 2760: ADD_I	add 	%r20, 0x00c5, %r24
	.word 0xbfe5c000  ! 2763: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_130:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_202:
	setx	0x33011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_131:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5e44000  ! 2774: SAVE_R	save	%r17, %r0, %r26
	.word 0xba45c000  ! 2776: ADDC_R	addc 	%r23, %r0, %r29
cpu_intr_0_203:
	setx	0x350231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_101:
	mov	0x9, %r14
	.word 0xf4f384a0  ! 2780: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e44000  ! 2782: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_204:
	setx	0x34031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2789: SAVE_R	save	%r20, %r0, %r27
	.word 0x91942101  ! 2791: WRPR_PIL_I	wrpr	%r16, 0x0101, %pil
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e4611a  ! 2795: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e54000  ! 2797: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e50000  ! 2801: SAVE_R	save	%r20, %r0, %r25
	.word 0x8d94a18a  ! 2802: WRPR_PSTATE_I	wrpr	%r18, 0x018a, %pstate
	.word 0xbfe48000  ! 2803: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_205:
	setx	0x35033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 32)
	.word 0xb3e4a19b  ! 2822: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_132:
	mov	0x26, %r14
	.word 0xfedb84a0  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9e5c000  ! 2827: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_133:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_206:
	setx	0x360024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 2833: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde420cb  ! 2837: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde5e0c8  ! 2840: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5c000  ! 2845: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 17)
	.word 0xb9e4c000  ! 2850: SAVE_R	save	%r19, %r0, %r28
	.word 0xb3e5a07f  ! 2853: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb624a054  ! 2855: SUB_I	sub 	%r18, 0x0054, %r27
	.word 0xb3e5e0cd  ! 2859: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_207:
	setx	0x360204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 2862: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_208:
	setx	0x360208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 2865: SAVE_R	save	%r23, %r0, %r30
	.word 0xb7e44000  ! 2869: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_209:
	setx	0x370215, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_210:
	setx	0x350321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_102:
	mov	0x34, %r14
	.word 0xfef389e0  ! 2889: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5e5608e  ! 2890: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 20)
	.word 0xbfe40000  ! 2894: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e50000  ! 2898: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e4c000  ! 2900: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_211:
	setx	0x370138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32db001  ! 2908: SLLX_I	sllx	%r22, 0x0001, %r25
T0_asi_reg_rd_134:
	mov	0x1b, %r14
	.word 0xfcdb8e80  ! 2909: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 8)
	.word 0xb4bd61ab  ! 2913: XNORcc_I	xnorcc 	%r21, 0x01ab, %r26
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_212:
	setx	0x350033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 2919: ORNcc_R	orncc 	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e56106  ! 2923: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e42089  ! 2925: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_213:
	setx	0x37031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_214:
	setx	0x35033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2248000  ! 2931: SUB_R	sub 	%r18, %r0, %r25
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_215:
	setx	0x20115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 39)
	.word 0xb2154000  ! 2939: OR_R	or 	%r21, %r0, %r25
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_135:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_136:
	mov	0x1a, %r14
	.word 0xfcdb89e0  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_103:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 2948: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_104:
	mov	0x9, %r14
	.word 0xfef38e40  ! 2951: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_105:
	mov	0x1d, %r14
	.word 0xfaf38e80  ! 2953: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_106:
	mov	0x12, %r14
	.word 0xf4f38e80  ! 2957: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_216:
	setx	0x370327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_217:
	setx	0x370101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 2960: SAVE_R	save	%r17, %r0, %r25
	.word 0xb3e4a082  ! 2961: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_137:
	mov	0x20, %r14
	.word 0xf6db8e80  ! 2962: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_218:
	setx	0x350002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e5616f  ! 2967: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde560b9  ! 2970: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbe456145  ! 2971: ADDC_I	addc 	%r21, 0x0145, %r31
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_219:
	setx	0x340026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 2975: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_220:
	setx	0x35023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5609e  ! 2981: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_221:
	setx	0x36013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_222:
	setx	0x340303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 19)
	.word 0xbb540000  ! 2986: RDPR_GL	<illegal instruction>
cpu_intr_0_223:
	setx	0x350101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa50000  ! 2993: SUBcc_R	subcc 	%r20, %r0, %r29
cpu_intr_0_224:
	setx	0x370129, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x7, %r14
	.word 0xfef38400  ! 2995: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e521de  ! 2998: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4e1e4  ! 2999: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_108:
	mov	0x33, %r14
	.word 0xfcf389e0  ! 3000: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb3e5217d  ! 3005: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_138:
	mov	0x18, %r14
	.word 0xf8db8400  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1e5c000  ! 3009: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_139:
	mov	0x37, %r14
	.word 0xfedb8e40  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_225:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb044e140  ! 3019: ADDC_I	addc 	%r19, 0x0140, %r24
	.word 0xb7e4c000  ! 3020: SAVE_R	save	%r19, %r0, %r27
	.word 0xb8b54000  ! 3021: ORNcc_R	orncc 	%r21, %r0, %r28
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe4c000  ! 3023: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 10)
	.word 0xb23560dd  ! 3034: SUBC_I	orn 	%r21, 0x00dd, %r25
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, e)
	.word 0xbbe5e0b9  ! 3037: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe5a0a0  ! 3039: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb32d3001  ! 3042: SLLX_I	sllx	%r20, 0x0001, %r25
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 23)
	.word 0xb3e5e164  ! 3047: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde50000  ! 3055: SAVE_R	save	%r20, %r0, %r30
	.word 0xb7e4e178  ! 3056: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e4c000  ! 3063: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e52022  ! 3066: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_140:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 3067: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_109:
	mov	0x20, %r14
	.word 0xfaf38e60  ! 3068: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe4602b  ! 3071: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e5e121  ! 3074: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5202d  ! 3075: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_226:
	setx	0x35031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 3079: SAVE_R	save	%r17, %r0, %r26
	.word 0xbbe5a18c  ! 3085: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e54000  ! 3088: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e44000  ! 3096: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_141:
	mov	0x1b, %r14
	.word 0xf6db8400  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_227:
	setx	0x350102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46096  ! 3108: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e4219c  ! 3109: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5a1c0  ! 3111: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e48000  ! 3112: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde4c000  ! 3113: SAVE_R	save	%r19, %r0, %r30
	.word 0xb1e58000  ! 3114: SAVE_R	save	%r22, %r0, %r24
	.word 0xbc2de135  ! 3116: ANDN_I	andn 	%r23, 0x0135, %r30
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 13)
	.word 0xb5e58000  ! 3119: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_110:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 3121: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbca420c3  ! 3124: SUBcc_I	subcc 	%r16, 0x00c3, %r30
cpu_intr_0_228:
	setx	0x37003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_229:
	setx	0x360107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_142:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_230:
	setx	0x350200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 3131: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_143:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 3133: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbbe40000  ! 3137: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e58000  ! 3138: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_231:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08de0d3  ! 3141: ANDcc_I	andcc 	%r23, 0x00d3, %r24
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e58000  ! 3145: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe50000  ! 3147: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_232:
	setx	0x350211, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_111:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 3159: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_233:
	setx	0x370238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_234:
	setx	0x34002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42082  ! 3164: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e56147  ! 3165: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e46138  ! 3169: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb92d4000  ! 3170: SLL_R	sll 	%r21, %r0, %r28
	.word 0xb1e520c5  ! 3171: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_112:
	mov	0x2f, %r14
	.word 0xfcf389e0  ! 3176: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfe50000  ! 3177: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_235:
	setx	0x340337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_236:
	setx	0x360125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561b1  ! 3184: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb2cc000  ! 3188: SLL_R	sll 	%r19, %r0, %r29
	.word 0xb1e48000  ! 3189: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e461d2  ! 3191: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb684a130  ! 3194: ADDcc_I	addcc 	%r18, 0x0130, %r27
	.word 0xb1e4c000  ! 3195: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e42153  ! 3196: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e54000  ! 3198: SAVE_R	save	%r21, %r0, %r25
	.word 0xbabcc000  ! 3199: XNORcc_R	xnorcc 	%r19, %r0, %r29
	.word 0xb4b461d4  ! 3201: SUBCcc_I	orncc 	%r17, 0x01d4, %r26
	.word 0xbb3cb001  ! 3202: SRAX_I	srax	%r18, 0x0001, %r29
T0_asi_reg_wr_113:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 3209: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_237:
	setx	0x370336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e560b9  ! 3214: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbab5e12e  ! 3216: SUBCcc_I	orncc 	%r23, 0x012e, %r29
	.word 0xb7e4a186  ! 3217: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe44000  ! 3219: SAVE_R	save	%r17, %r0, %r29
	.word 0xb01c2184  ! 3221: XOR_I	xor 	%r16, 0x0184, %r24
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_238:
	setx	0x35002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_239:
	setx	0x35012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_114:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3233: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_240:
	setx	0x340238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e54000  ! 3239: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_115:
	mov	0x34, %r14
	.word 0xf6f38e80  ! 3242: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_241:
	setx	0x390117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_242:
	setx	0x38011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_116:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 3248: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_243:
	setx	0x3b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_244:
	setx	0x3a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3ce171  ! 3252: XNOR_I	xnor 	%r19, 0x0171, %r29
	.word 0xbbe4603c  ! 3253: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xba05a172  ! 3255: ADD_I	add 	%r22, 0x0172, %r29
	.word 0xb7e44000  ! 3257: SAVE_R	save	%r17, %r0, %r27
	.word 0xb92cc000  ! 3258: SLL_R	sll 	%r19, %r0, %r28
	.word 0xbbe52083  ! 3259: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_245:
	setx	0x380001, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_144:
	mov	0x2d, %r14
	.word 0xfadb89e0  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7e40000  ! 3267: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe58000  ! 3275: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_246:
	setx	0x3b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3279: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe58000  ! 3280: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_247:
	setx	0x390339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_117:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 3286: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_145:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 3288: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbfe54000  ! 3293: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e420ea  ! 3297: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_248:
	setx	0x38031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_249:
	setx	0x3b0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3302: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde54000  ! 3303: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_250:
	setx	0x380031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_146:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e50000  ! 3308: SAVE_R	save	%r20, %r0, %r28
	.word 0xb1e44000  ! 3311: SAVE_R	save	%r17, %r0, %r24
	.word 0xb1e5a0e0  ! 3313: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_118:
	mov	0x5, %r14
	.word 0xf4f38e60  ! 3315: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e44000  ! 3317: SAVE_R	save	%r17, %r0, %r24
	.word 0xb1508000  ! 3321: RDPR_TSTATE	<illegal instruction>
T0_asi_reg_rd_147:
	mov	0x21, %r14
	.word 0xf2db8e60  ! 3323: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_119:
	mov	0x34, %r14
	.word 0xfef384a0  ! 3325: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_wr_120:
	mov	0x28, %r14
	.word 0xfaf38e80  ! 3327: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_148:
	mov	0x35, %r14
	.word 0xfcdb84a0  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb33d7001  ! 3330: SRAX_I	srax	%r21, 0x0001, %r25
cpu_intr_0_251:
	setx	0x3b0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_149:
	mov	0x2a, %r14
	.word 0xf4db8e80  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbde46090  ! 3339: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_252:
	setx	0x3a0325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_253:
	setx	0x3b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e521ca  ! 3348: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e5a119  ! 3349: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb2b58000  ! 3350: ORNcc_R	orncc 	%r22, %r0, %r25
T0_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_151:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 3357: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_254:
	setx	0x3a0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_152:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7e561f4  ! 3368: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_121:
	mov	0x16, %r14
	.word 0xf0f38e60  ! 3370: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_122:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3373: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_153:
	mov	0x38, %r14
	.word 0xf6db8400  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9e50000  ! 3380: SAVE_R	save	%r20, %r0, %r28
	.word 0xbde4a1c6  ! 3382: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_255:
	setx	0x3b0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 3384: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_256:
	setx	0x39033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 36)
	.word 0xb7e5c000  ! 3394: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_154:
	mov	0x19, %r14
	.word 0xf8db84a0  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb415e15c  ! 3397: OR_I	or 	%r23, 0x015c, %r26
	.word 0xbbe4a08b  ! 3400: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbe84c000  ! 3401: ADDcc_R	addcc 	%r19, %r0, %r31
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, b)
	.word 0xbde4e0a8  ! 3412: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5e068  ! 3415: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e50000  ! 3416: SAVE_R	save	%r20, %r0, %r28
	.word 0xb2340000  ! 3417: ORN_R	orn 	%r16, %r0, %r25
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_257:
	setx	0x3a021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a10b  ! 3427: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e58000  ! 3432: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e44000  ! 3434: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_258:
	setx	0x38020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x38022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7e42016  ! 3442: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5a05d  ! 3446: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_123:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 3448: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb8142106  ! 3449: OR_I	or 	%r16, 0x0106, %r28
	.word 0xb1e5c000  ! 3451: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_156:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 22)
	.word 0xb49560a9  ! 3456: ORcc_I	orcc 	%r21, 0x00a9, %r26
	.word 0xb73c1000  ! 3457: SRAX_R	srax	%r16, %r0, %r27
	.word 0xb1e4e134  ! 3459: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe56196  ! 3462: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_260:
	setx	0x3a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561a8  ! 3471: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_261:
	setx	0x380132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a119  ! 3474: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbe3c0000  ! 3477: XNOR_R	xnor 	%r16, %r0, %r31
	.word 0xb68de19f  ! 3480: ANDcc_I	andcc 	%r23, 0x019f, %r27
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_157:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_158:
	mov	0xf, %r14
	.word 0xfedb89e0  ! 3493: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfe52109  ! 3496: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e50000  ! 3497: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_124:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 3501: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_159:
	mov	0x2c, %r14
	.word 0xfedb84a0  ! 3503: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfe4c000  ! 3504: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e4c000  ! 3505: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde48000  ! 3509: SAVE_R	save	%r18, %r0, %r30
	.word 0xbfe4e08c  ! 3510: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_262:
	setx	0x380214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 3513: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e50000  ! 3517: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e40000  ! 3519: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde4c000  ! 3524: SAVE_R	save	%r19, %r0, %r30
	.word 0xb1e4c000  ! 3527: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_160:
	mov	0x25, %r14
	.word 0xfedb84a0  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb81c0000  ! 3532: XOR_R	xor 	%r16, %r0, %r28
T0_asi_reg_wr_125:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 3535: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 3536: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_263:
	setx	0x39031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_161:
	mov	0x2f, %r14
	.word 0xf2db84a0  ! 3541: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_264:
	setx	0x3b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a16e  ! 3544: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e5a0e9  ! 3545: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb8bd8000  ! 3546: XNORcc_R	xnorcc 	%r22, %r0, %r28
	.word 0xbde520f1  ! 3552: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_162:
	mov	0x2e, %r14
	.word 0xf6db84a0  ! 3553: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb42d61e3  ! 3555: ANDN_I	andn 	%r21, 0x01e3, %r26
T0_asi_reg_wr_126:
	mov	0xc, %r14
	.word 0xf0f38e80  ! 3556: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_wr_127:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 3557: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e4a0e9  ! 3558: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_265:
	setx	0x3a0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_266:
	setx	0x380105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_267:
	setx	0x3a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_163:
	mov	0x13, %r14
	.word 0xfcdb89e0  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_268:
	setx	0x390311, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_164:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 3581: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7e48000  ! 3582: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde461d8  ! 3592: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_269:
	setx	0x3b0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a065  ! 3594: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_128:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 3597: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_129:
	mov	0x24, %r14
	.word 0xf4f38400  ! 3598: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 12)
	.word 0xb3e560d7  ! 3603: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_130:
	mov	0x11, %r14
	.word 0xfcf389e0  ! 3604: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1e4e016  ! 3605: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe5e0e6  ! 3606: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_131:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 3608: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e40000  ! 3609: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 2)
	.word 0xbeb5a0cc  ! 3614: ORNcc_I	orncc 	%r22, 0x00cc, %r31
T0_asi_reg_wr_132:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 3615: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe44000  ! 3616: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe50000  ! 3622: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_165:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_166:
	mov	0x2a, %r14
	.word 0xf2db8e40  ! 3624: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e54000  ! 3625: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e54000  ! 3628: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e4c000  ! 3629: SAVE_R	save	%r19, %r0, %r28
	.word 0xb7e4e0c6  ! 3635: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_167:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 3637: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbde58000  ! 3639: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_168:
	mov	0x31, %r14
	.word 0xfadb8e60  ! 3640: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9e54000  ! 3643: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e48000  ! 3645: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_270:
	setx	0x3b011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a148  ! 3652: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_271:
	setx	0x3b0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_272:
	setx	0x3b000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_133:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 3665: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbde4a005  ! 3667: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_273:
	setx	0x390314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_274:
	setx	0x39032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a16a  ! 3674: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4613f  ! 3676: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e5a154  ! 3677: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4c000  ! 3681: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 30)
	.word 0xbbe5a0c2  ! 3688: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_169:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde5e0fd  ! 3699: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_275:
	setx	0x390306, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_170:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 3703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_134:
	mov	0x1d, %r14
	.word 0xf6f38e60  ! 3705: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde4e0d1  ! 3706: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_276:
	setx	0x3d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_277:
	setx	0x3e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e4a0f0  ! 3726: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_171:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_172:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbe24c000  ! 3733: SUB_R	sub 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4ac4000  ! 3736: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xba0c4000  ! 3739: AND_R	and 	%r17, %r0, %r29
cpu_intr_0_278:
	setx	0x3d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 16)
	.word 0xbde44000  ! 3746: SAVE_R	save	%r17, %r0, %r30
	.word 0xbc244000  ! 3747: SUB_R	sub 	%r17, %r0, %r30
	.word 0xb615607a  ! 3748: OR_I	or 	%r21, 0x007a, %r27
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_279:
	setx	0x10338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_280:
	setx	0x3d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_281:
	setx	0x3e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0b5  ! 3758: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe40000  ! 3759: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe58000  ! 3764: SAVE_R	save	%r22, %r0, %r31
	.word 0xb8b460de  ! 3765: ORNcc_I	orncc 	%r17, 0x00de, %r28
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e40000  ! 3769: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde48000  ! 3773: SAVE_R	save	%r18, %r0, %r30
	.word 0xb4140000  ! 3780: OR_R	or 	%r16, %r0, %r26
	.word 0xb60c8000  ! 3785: AND_R	and 	%r18, %r0, %r27
T0_asi_reg_rd_173:
	mov	0xa, %r14
	.word 0xf4db8400  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbbe4a112  ! 3789: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e50000  ! 3793: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde44000  ! 3796: SAVE_R	save	%r17, %r0, %r30
	.word 0xbde561e5  ! 3797: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_282:
	setx	0x3d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 3800: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e40000  ! 3801: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_135:
	mov	0x1b, %r14
	.word 0xfaf38400  ! 3803: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e4a05c  ! 3807: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e4e06c  ! 3808: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e40000  ! 3810: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_283:
	setx	0x3e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3813: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e5c000  ! 3817: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_136:
	mov	0x19, %r14
	.word 0xf0f38e80  ! 3818: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb7e561d5  ! 3820: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e44000  ! 3821: SAVE_R	save	%r17, %r0, %r25
	.word 0xbca4e115  ! 3822: SUBcc_I	subcc 	%r19, 0x0115, %r30
T0_asi_reg_wr_137:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 3824: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 34)
	.word 0xb9e48000  ! 3828: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_138:
	mov	0x1a, %r14
	.word 0xf6f38e60  ! 3832: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9e58000  ! 3834: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_284:
	setx	0x3c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a1f9  ! 3839: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_285:
	setx	0x3c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbbe5c000  ! 3847: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe40000  ! 3848: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe5e1f2  ! 3855: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_174:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb8b44000  ! 3871: SUBCcc_R	orncc 	%r17, %r0, %r28
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe50000  ! 3873: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe5609c  ! 3877: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_286:
	setx	0x3d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 3886: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe5c000  ! 3887: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe50000  ! 3890: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_175:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7e520f8  ! 3898: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5a191  ! 3900: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_287:
	setx	0x3d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1dd  ! 3904: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_288:
	setx	0x3d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 3914: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_176:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 3920: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3e520d7  ! 3921: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe40000  ! 3923: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_289:
	setx	0x3d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_177:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 3927: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5e112  ! 3931: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_290:
	setx	0x3f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a191  ! 3935: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_291:
	setx	0x3f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52165  ! 3943: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, b)
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe58000  ! 3948: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e561a1  ! 3950: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe5e160  ! 3953: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_292:
	setx	0x3e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_293:
	setx	0x3d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_294:
	setx	0x3f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_295:
	setx	0x3e0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4204f  ! 3963: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5217e  ! 3965: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe46073  ! 3966: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb214a1df  ! 3967: OR_I	or 	%r18, 0x01df, %r25
T0_asi_reg_rd_178:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbbe4e076  ! 3971: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb43560c1  ! 3974: ORN_I	orn 	%r21, 0x00c1, %r26
	.word 0xbfe5a050  ! 3975: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_296:
	setx	0x3f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 3979: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_139:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 3981: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_297:
	setx	0x3c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a06c  ! 3984: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e40000  ! 3987: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe50000  ! 3989: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe58000  ! 3992: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_298:
	setx	0x3f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_299:
	setx	0x3f0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e4a125  ! 3998: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe48000  ! 4004: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_300:
	setx	0x3e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb285a09a  ! 4008: ADDcc_I	addcc 	%r22, 0x009a, %r25
	.word 0xb3e520ac  ! 4013: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde421d3  ! 4016: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde54000  ! 4018: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_301:
	setx	0x3d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 4022: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_179:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb72cc000  ! 4025: SLL_R	sll 	%r19, %r0, %r27
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_302:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_303:
	setx	0x3f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e460d7  ! 4032: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5c000  ! 4033: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_304:
	setx	0x3f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 4037: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e5213d  ! 4039: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5c000  ! 4040: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde5c000  ! 4041: SAVE_R	save	%r23, %r0, %r30
	.word 0xb3e56159  ! 4045: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e4c000  ! 4058: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_140:
	mov	0x2a, %r14
	.word 0xf8f38e60  ! 4060: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde44000  ! 4064: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_141:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4065: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_305:
	setx	0x3e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46090  ! 4067: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe40000  ! 4068: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_306:
	setx	0x3d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e5e0cb  ! 4072: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5350000  ! 4079: SRL_R	srl 	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_307:
	setx	0x3d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e40000  ! 4085: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e4a18a  ! 4087: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_180:
	mov	0x1c, %r14
	.word 0xf2db8400  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9e4c000  ! 4090: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_142:
	mov	0x37, %r14
	.word 0xf2f38400  ! 4093: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbde54000  ! 4094: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_308:
	setx	0x3d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_181:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_309:
	setx	0x3f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4100: SAVE_R	save	%r20, %r0, %r29
	.word 0xbc040000  ! 4106: ADD_R	add 	%r16, %r0, %r30
T0_asi_reg_wr_143:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 4107: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5e58000  ! 4109: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 4114: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb7e58000  ! 4116: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe56031  ! 4119: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbe0ca040  ! 4120: AND_I	and 	%r18, 0x0040, %r31
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 21)
	.word 0xb5e44000  ! 4128: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_145:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 4133: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_182:
	mov	0x12, %r14
	.word 0xf6db89e0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbde4607a  ! 4141: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbe1c0000  ! 4144: XOR_R	xor 	%r16, %r0, %r31
cpu_intr_0_310:
	setx	0x3d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_146:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 4148: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_183:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7e5a0df  ! 4154: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe420f5  ! 4158: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb53d2001  ! 4159: SRA_I	sra 	%r20, 0x0001, %r26
T0_asi_reg_wr_147:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 4164: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_184:
	mov	0xb, %r14
	.word 0xfcdb8e60  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 0)
	.word 0xbbe40000  ! 4178: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e46156  ! 4180: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e44000  ! 4183: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e48000  ! 4187: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e56034  ! 4191: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_148:
	mov	0x24, %r14
	.word 0xf4f38400  ! 4193: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbf350000  ! 4197: SRL_R	srl 	%r20, %r0, %r31
	.word 0xba850000  ! 4201: ADDcc_R	addcc 	%r20, %r0, %r29
cpu_intr_0_311:
	setx	0x420110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42038  ! 4204: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_312:
	setx	0x420236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c8000  ! 4208: SLL_R	sll 	%r18, %r0, %r25
	.word 0xb5e5206f  ! 4211: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_313:
	setx	0x42001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_149:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 4221: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbfe44000  ! 4222: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe40000  ! 4223: SAVE_R	save	%r16, %r0, %r31
	.word 0xbd3dc000  ! 4225: SRA_R	sra 	%r23, %r0, %r30
T0_asi_reg_rd_185:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe48000  ! 4233: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e52133  ! 4234: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e46043  ! 4238: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e52172  ! 4239: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_wr_150:
	mov	0x18, %r14
	.word 0xf0f38400  ! 4241: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_151:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 4244: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_186:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e54000  ! 4246: SAVE_R	save	%r21, %r0, %r27
	.word 0xb7e42182  ! 4247: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e4615a  ! 4249: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5a013  ! 4250: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x91956172  ! 4253: WRPR_PIL_I	wrpr	%r21, 0x0172, %pil
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbfe5c000  ! 4255: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e561b6  ! 4261: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4e1af  ! 4262: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_187:
	mov	0x10, %r14
	.word 0xf8db89e0  ! 4263: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_152:
	mov	0xa, %r14
	.word 0xfef38e40  ! 4267: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb12d7001  ! 4268: SLLX_I	sllx	%r21, 0x0001, %r24
	.word 0xbbe58000  ! 4269: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_188:
	mov	0x1b, %r14
	.word 0xf4db8e80  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3e42199  ! 4276: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_189:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe58000  ! 4283: SAVE_R	save	%r22, %r0, %r31
	.word 0xb9e54000  ! 4284: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde50000  ! 4287: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_153:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 4290: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_154:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 4293: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e4c000  ! 4295: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_190:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0x899420ad  ! 4299: WRPR_TICK_I	wrpr	%r16, 0x00ad, %tick
	.word 0xbde5e0a0  ! 4300: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_155:
	mov	0x0, %r14
	.word 0xf0f38400  ! 4302: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_wr_156:
	mov	0xb, %r14
	.word 0xf2f38e60  ! 4309: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e5c000  ! 4310: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e4c000  ! 4312: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_314:
	setx	0x430229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e024  ! 4315: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe421ec  ! 4317: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb42d0000  ! 4319: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xbde5c000  ! 4320: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb5e5a081  ! 4329: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe52133  ! 4330: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_191:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e48000  ! 4332: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde40000  ! 4335: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_315:
	setx	0x410102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 24)
	.word 0xbd641800  ! 4342: MOVcc_R	<illegal instruction>
cpu_intr_0_316:
	setx	0x420202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52150  ! 4347: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe5e0fa  ! 4350: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7e4c000  ! 4354: SAVE_R	save	%r19, %r0, %r27
	.word 0xb57c4400  ! 4355: MOVR_R	movre	%r17, %r0, %r26
	.word 0xbfe5a122  ! 4358: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, f)
	.word 0xbb480000  ! 4364: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
cpu_intr_0_317:
	setx	0x430334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_318:
	setx	0x430008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7d0400  ! 4370: MOVR_R	movre	%r20, %r0, %r30
	.word 0xb7e5e087  ! 4372: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7e50000  ! 4374: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e561ab  ! 4376: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_319:
	setx	0x420222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 4382: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_192:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_320:
	setx	0x430225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_157:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 4388: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_193:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbde5c000  ! 4391: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_321:
	setx	0x420222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_322:
	setx	0x42011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4397: SAVE_R	save	%r17, %r0, %r28
	.word 0xbbe50000  ! 4401: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_323:
	setx	0x410139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_324:
	setx	0x400005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 34)
	.word 0xb9e4a152  ! 4406: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e5c000  ! 4407: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 29)
	.word 0xbde50000  ! 4411: SAVE_R	save	%r20, %r0, %r30
	.word 0xbfe44000  ! 4412: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e4205b  ! 4416: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_325:
	setx	0x430014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_326:
	setx	0x400315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4c000  ! 4420: SUBCcc_R	orncc 	%r19, %r0, %r25
cpu_intr_0_327:
	setx	0x40001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 4423: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 3f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 33)
	.word 0xb3e5e1e2  ! 4430: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_158:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 4431: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_328:
	setx	0x420205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabd2072  ! 4433: XNORcc_I	xnorcc 	%r20, 0x0072, %r29
	.word 0xbfe4e1a9  ! 4434: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe58000  ! 4438: SAVE_R	save	%r22, %r0, %r31
	.word 0xb6b5c000  ! 4440: ORNcc_R	orncc 	%r23, %r0, %r27
T0_asi_reg_wr_159:
	mov	0x1c, %r14
	.word 0xfef38400  ! 4443: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfe4a0a8  ! 4444: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_160:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 4449: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_329:
	setx	0x410311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52067  ! 4457: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e4e148  ! 4459: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e5c000  ! 4465: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e4a020  ! 4469: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 4)
	.word 0xbc1d21ad  ! 4473: XOR_I	xor 	%r20, 0x01ad, %r30
	.word 0xba8460c6  ! 4474: ADDcc_I	addcc 	%r17, 0x00c6, %r29
	.word 0xb3e4c000  ! 4478: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_161:
	mov	0x12, %r14
	.word 0xf2f389e0  ! 4479: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_194:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7e4e1db  ! 4482: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb12d4000  ! 4488: SLL_R	sll 	%r21, %r0, %r24
	.word 0xb1e5e005  ! 4490: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 16)
	.word 0xb6bce115  ! 4492: XNORcc_I	xnorcc 	%r19, 0x0115, %r27
	.word 0xbde42056  ! 4493: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_195:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9e5207c  ! 4498: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_330:
	setx	0x40002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_162:
	mov	0x17, %r14
	.word 0xfaf38e80  ! 4501: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbabca175  ! 4508: XNORcc_I	xnorcc 	%r18, 0x0175, %r29
	.word 0xbde4c000  ! 4509: SAVE_R	save	%r19, %r0, %r30
	.word 0xb235c000  ! 4515: ORN_R	orn 	%r23, %r0, %r25
T0_asi_reg_rd_196:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5e4a0b6  ! 4517: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5a1c5  ! 4518: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_331:
	setx	0x40003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e560f6  ! 4524: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_332:
	setx	0x400319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe421bf  ! 4526: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e48000  ! 4530: SAVE_R	save	%r18, %r0, %r25
	.word 0xb3480000  ! 4531: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
T0_asi_reg_wr_163:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 4535: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_333:
	setx	0x430106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4215d  ! 4537: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb4a50000  ! 4538: SUBcc_R	subcc 	%r20, %r0, %r26
T0_asi_reg_wr_164:
	mov	0x11, %r14
	.word 0xf0f389e0  ! 4539: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 23)
	.word 0xb4aca011  ! 4543: ANDNcc_I	andncc 	%r18, 0x0011, %r26
	.word 0xbc256134  ! 4545: SUB_I	sub 	%r21, 0x0134, %r30
	.word 0xbde46071  ! 4546: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe40000  ! 4550: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_197:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_334:
	setx	0x400219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 4556: SAVE_R	save	%r18, %r0, %r26
	.word 0xb32c7001  ! 4559: SLLX_I	sllx	%r17, 0x0001, %r25
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_198:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e5a080  ! 4568: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e50000  ! 4578: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_165:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 4580: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_166:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 4583: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9e5e12a  ! 4585: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_335:
	setx	0x40002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_167:
	mov	0x1f, %r14
	.word 0xfef384a0  ! 4587: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_wr_168:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 4588: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 4590: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe4a08c  ! 4593: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4616c  ! 4598: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e56123  ! 4603: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_336:
	setx	0x43013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e5a022  ! 4611: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe44000  ! 4616: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde4207e  ! 4617: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7641800  ! 4618: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_169:
	mov	0x10, %r14
	.word 0xf6f38e80  ! 4619: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_199:
	mov	0x2a, %r14
	.word 0xf6db8400  ! 4625: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e4614d  ! 4627: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_200:
	mov	0x3, %r14
	.word 0xf6db8e80  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbde46073  ! 4637: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_337:
	setx	0x450038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a0ab  ! 4642: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_338:
	setx	0x450000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 4647: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e54000  ! 4652: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_339:
	setx	0x460225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 27)
	.word 0x8195e080  ! 4657: WRPR_TPC_I	wrpr	%r23, 0x0080, %tpc
	.word 0xb5e46112  ! 4658: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e50000  ! 4661: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1e4a1fe  ! 4664: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e48000  ! 4666: SAVE_R	save	%r18, %r0, %r28
	.word 0xbbe58000  ! 4669: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_340:
	setx	0x450003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e17b  ! 4672: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4e169  ! 4673: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_170:
	mov	0x35, %r14
	.word 0xf6f38e40  ! 4674: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfe4a048  ! 4675: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4c000  ! 4686: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9e4611e  ! 4689: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_171:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 4690: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb83de117  ! 4691: XNOR_I	xnor 	%r23, 0x0117, %r28
	.word 0xbde4e01c  ! 4693: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe5202a  ! 4696: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_341:
	setx	0x47020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbd2132  ! 4702: XNORcc_I	xnorcc 	%r20, 0x0132, %r30
T0_asi_reg_rd_201:
	mov	0x22, %r14
	.word 0xf6db8e60  ! 4704: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfe44000  ! 4705: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e48000  ! 4706: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 11)
	.word 0xb3e461bf  ! 4713: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_202:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbc948000  ! 4723: ORcc_R	orcc 	%r18, %r0, %r30
T0_asi_reg_rd_203:
	mov	0x21, %r14
	.word 0xf0db8400  ! 4724: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_172:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 4727: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_342:
	setx	0x460136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_173:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 4730: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbbe58000  ! 4731: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 33)
	.word 0xb3e58000  ! 4736: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_343:
	setx	0x47031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 4745: RDPR_TT	<illegal instruction>
	.word 0xba3c8000  ! 4746: XNOR_R	xnor 	%r18, %r0, %r29
cpu_intr_0_344:
	setx	0x460304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_345:
	setx	0x470033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_346:
	setx	0x45022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4756: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e561bd  ! 4759: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb20d20ba  ! 4761: AND_I	and 	%r20, 0x00ba, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_174:
	mov	0x14, %r14
	.word 0xf6f38e80  ! 4768: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbde4c000  ! 4773: SAVE_R	save	%r19, %r0, %r30
	.word 0xb0044000  ! 4774: ADD_R	add 	%r17, %r0, %r24
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe5207d  ! 4776: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e520aa  ! 4779: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb2348000  ! 4781: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xbd641800  ! 4784: MOVcc_R	<illegal instruction>
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e46049  ! 4786: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb520000  ! 4787: RDPR_PIL	<illegal instruction>
	.word 0xb2958000  ! 4791: ORcc_R	orcc 	%r22, %r0, %r25
cpu_intr_0_347:
	setx	0x460104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_204:
	mov	0x10, %r14
	.word 0xfcdb8400  ! 4800: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_348:
	setx	0x450300, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe4c000  ! 4811: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, f)
	.word 0xb151c000  ! 4815: RDPR_TL	<illegal instruction>
T0_asi_reg_wr_175:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 4817: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe4c000  ! 4820: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe58000  ! 4821: SAVE_R	save	%r22, %r0, %r31
	.word 0xb7e4e188  ! 4822: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_176:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 4824: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e4a15f  ! 4827: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbe34c000  ! 4830: ORN_R	orn 	%r19, %r0, %r31
cpu_intr_0_349:
	setx	0x44012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 15)
	.word 0xbcbdc000  ! 4833: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xb7e560b6  ! 4835: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e50000  ! 4837: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7508000  ! 4842: RDPR_TSTATE	<illegal instruction>
T0_asi_reg_wr_177:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 4843: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 33)
	.word 0xb13d8000  ! 4846: SRA_R	sra 	%r22, %r0, %r24
	.word 0xbac5a057  ! 4848: ADDCcc_I	addccc 	%r22, 0x0057, %r29
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe58000  ! 4852: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e4a1f7  ! 4855: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e40000  ! 4858: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_205:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 4859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_206:
	mov	0x0, %r14
	.word 0xf0db8e80  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4862: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e54000  ! 4863: SAVE_R	save	%r21, %r0, %r25
	.word 0xb8254000  ! 4869: SUB_R	sub 	%r21, %r0, %r28
	.word 0xb9e54000  ! 4870: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_350:
	setx	0x45012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_351:
	setx	0x460015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb415a0cf  ! 4882: OR_I	or 	%r22, 0x00cf, %r26
	.word 0xb5e5e1ec  ! 4883: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_352:
	setx	0x45033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_353:
	setx	0x450113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 4891: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_207:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_354:
	setx	0x47010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13ce001  ! 4899: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xb3e40000  ! 4903: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_355:
	setx	0x46001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 4906: SAVE_R	save	%r23, %r0, %r31
	.word 0xbaac6072  ! 4907: ANDNcc_I	andncc 	%r17, 0x0072, %r29
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_179:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 4912: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb0c4e02e  ! 4914: ADDCcc_I	addccc 	%r19, 0x002e, %r24
cpu_intr_0_356:
	setx	0x450039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_208:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_209:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 4917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe5e165  ! 4919: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde4a1cd  ! 4920: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_210:
	mov	0x5, %r14
	.word 0xf8db8e40  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e520c9  ! 4929: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde42092  ! 4934: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_211:
	mov	0x25, %r14
	.word 0xf4db8e40  ! 4936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e44000  ! 4938: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe48000  ! 4939: SAVE_R	save	%r18, %r0, %r31
	.word 0xbfe5e15e  ! 4942: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_357:
	setx	0x440037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_358:
	setx	0x460003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_359:
	setx	0x460327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_360:
	setx	0x450034, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_212:
	mov	0x1a, %r14
	.word 0xfadb8e80  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_361:
	setx	0x47001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_213:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e58000  ! 4956: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_362:
	setx	0x45032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a094  ! 4961: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_363:
	setx	0x47010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1ff  ! 4963: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe44000  ! 4964: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_214:
	mov	0x10, %r14
	.word 0xfedb8e80  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7e40000  ! 4968: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_215:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 4974: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_wr_180:
	mov	0x1d, %r14
	.word 0xf6f384a0  ! 4977: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbde4a13e  ! 4980: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb2b4c000  ! 4981: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xb61ce04e  ! 4986: XOR_I	xor 	%r19, 0x004e, %r27
	.word 0xbde44000  ! 4988: SAVE_R	save	%r17, %r0, %r30
	.word 0xbfe54000  ! 4990: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_364:
	setx	0x47021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7518000  ! 4994: RDPR_PSTATE	<illegal instruction>
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e58000  ! 4998: SAVE_R	save	%r22, %r0, %r28
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
	.word 0xf22c8000  ! 4: STB_R	stb	%r25, [%r18 + %r0]
T3_asi_reg_wr_0:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 5: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829d0  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d0, %hpstate
cpu_intr_3_0:
	setx	0x1c0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_1:
	setx	0x1c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d2026  ! 15: STB_I	stb	%r28, [%r20 + 0x0026]
	.word 0xf42d4000  ! 17: STB_R	stb	%r26, [%r21 + %r0]
T3_asi_reg_wr_1:
	mov	0x5, %r14
	.word 0xf2f38e60  ! 19: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf4248000  ! 22: STW_R	stw	%r26, [%r18 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf475e0a5  ! 31: STX_I	stx	%r26, [%r23 + 0x00a5]
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, b)
	.word 0xf02d8000  ! 35: STB_R	stb	%r24, [%r22 + %r0]
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_NONHPRIV
	.word 0xf824604b  ! 39: STW_I	stw	%r28, [%r17 + 0x004b]
	.word 0xbc2c61d8  ! 40: ANDN_I	andn 	%r17, 0x01d8, %r30
	.word 0xf8344000  ! 42: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_2:
	mov	0x25, %r14
	.word 0xf0f38400  ! 43: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_2:
	setx	0x1c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a50020  ! 48: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 33)
	.word 0xf82d2083  ! 50: STB_I	stb	%r28, [%r20 + 0x0083]
	.word 0xbf641800  ! 51: MOVcc_R	<illegal instruction>
cpu_intr_3_3:
	setx	0x1c023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf82da1cf  ! 61: STB_I	stb	%r28, [%r22 + 0x01cf]
	.word 0xbc0d207a  ! 62: AND_I	and 	%r20, 0x007a, %r30
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983dca  ! 63: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dca, %hpstate
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 18)
	.word 0xfab50020  ! 65: STHA_R	stha	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_0:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf62ca032  ! 70: STB_I	stb	%r27, [%r18 + 0x0032]
T3_asi_reg_rd_1:
	mov	0x33, %r14
	.word 0xf8db8e80  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf825c000  ! 73: STW_R	stw	%r28, [%r23 + %r0]
cpu_intr_3_4:
	setx	0x1c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_5:
	setx	0x1f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0946016  ! 81: ORcc_I	orcc 	%r17, 0x0016, %r24
T3_asi_reg_wr_3:
	mov	0x11, %r14
	.word 0xfef38e80  ! 83: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf22c219c  ! 84: STB_I	stb	%r25, [%r16 + 0x019c]
	.word 0xf634c000  ! 88: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf2258000  ! 90: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf4744000  ! 92: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf2b5c020  ! 93: STHA_R	stha	%r25, [%r23 + %r0] 0x01
cpu_intr_3_6:
	setx	0x1c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 96: RDPR_GL	rdpr	%-, %r27
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_2:
	mov	0xc, %r14
	.word 0xfadb84a0  ! 102: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_7:
	setx	0x1c0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_4:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 107: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_8:
	setx	0x1c032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf42106  ! 109: STXA_I	stxa	%r29, [%r16 + 0x0106] %asi
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_9:
	setx	0x1e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_3:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfc24e095  ! 126: STW_I	stw	%r30, [%r19 + 0x0095]
T3_asi_reg_rd_4:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_10:
	setx	0x2033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe044000  ! 137: ADD_R	add 	%r17, %r0, %r31
cpu_intr_3_11:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_5:
	mov	0x26, %r14
	.word 0xfaf38e40  ! 139: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc244000  ! 144: SUB_R	sub 	%r17, %r0, %r30
	.word 0xbc14e1b1  ! 145: OR_I	or 	%r19, 0x01b1, %r30
cpu_intr_3_12:
	setx	0x1e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d8000  ! 151: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfea5c020  ! 152: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_6:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 153: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfc2ca11d  ! 157: STB_I	stb	%r30, [%r18 + 0x011d]
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 5)
	.word 0xfca4e0b0  ! 160: STWA_I	stwa	%r30, [%r19 + 0x00b0] %asi
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 36)
	.word 0xb1643801  ! 166: MOVcc_I	<illegal instruction>
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe24e01d  ! 174: STW_I	stw	%r31, [%r19 + 0x001d]
	.word 0xf035c000  ! 175: STH_R	sth	%r24, [%r23 + %r0]
cpu_intr_3_13:
	setx	0x1f0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a421c7  ! 178: SUBcc_I	subcc 	%r16, 0x01c7, %r24
	.word 0xf4acc020  ! 179: STBA_R	stba	%r26, [%r19 + %r0] 0x01
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_14:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_15:
	setx	0x1f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434a0d8  ! 195: SUBC_I	orn 	%r18, 0x00d8, %r26
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 12)
	.word 0xf4a5e08d  ! 197: STWA_I	stwa	%r26, [%r23 + 0x008d] %asi
	.word 0xf6a4a165  ! 198: STWA_I	stwa	%r27, [%r18 + 0x0165] %asi
	.word 0xfc758000  ! 199: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_rd_5:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819839d0  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
	.word 0xf8ac4020  ! 202: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xfab4e136  ! 203: STHA_I	stha	%r29, [%r19 + 0x0136] %asi
T3_asi_reg_rd_6:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_7:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbf540000  ! 206: RDPR_GL	rdpr	%-, %r31
	.word 0xfeb5217e  ! 209: STHA_I	stha	%r31, [%r20 + 0x017e] %asi
	.word 0xbcb4c000  ! 211: SUBCcc_R	orncc 	%r19, %r0, %r30
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfe2d0000  ! 216: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf634616c  ! 218: STH_I	sth	%r27, [%r17 + 0x016c]
	.word 0xfca4600f  ! 219: STWA_I	stwa	%r30, [%r17 + 0x000f] %asi
	.word 0xb294219a  ! 220: ORcc_I	orcc 	%r16, 0x019a, %r25
T3_asi_reg_wr_7:
	mov	0x38, %r14
	.word 0xf2f38400  ! 222: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_16:
	setx	0x1c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac8020  ! 225: STBA_R	stba	%r27, [%r18 + %r0] 0x01
T3_asi_reg_rd_8:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 227: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_17:
	setx	0x1e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8242071  ! 230: STW_I	stw	%r28, [%r16 + 0x0071]
cpu_intr_3_18:
	setx	0x1c030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4250000  ! 236: STW_R	stw	%r26, [%r20 + %r0]
T3_asi_reg_rd_9:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf234e194  ! 240: STH_I	sth	%r25, [%r19 + 0x0194]
	.word 0xf6acc020  ! 244: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xf23421da  ! 246: STH_I	sth	%r25, [%r16 + 0x01da]
	.word 0xf6ad4020  ! 248: STBA_R	stba	%r27, [%r21 + %r0] 0x01
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, f)
	.word 0xf8b46051  ! 251: STHA_I	stha	%r28, [%r17 + 0x0051] %asi
cpu_intr_3_19:
	setx	0x1e0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_20:
	setx	0x1d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_8:
	mov	0x10, %r14
	.word 0xf4f384a0  ! 260: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf0b40020  ! 265: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xbd2c9000  ! 267: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xf075c000  ! 273: STX_R	stx	%r24, [%r23 + %r0]
cpu_intr_3_21:
	setx	0x1f0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4752045  ! 275: STX_I	stx	%r26, [%r20 + 0x0045]
T3_asi_reg_rd_10:
	mov	0x26, %r14
	.word 0xfedb89e0  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_11:
	mov	0x23, %r14
	.word 0xf4db89e0  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_22:
	setx	0x1f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c0000  ! 293: ANDcc_R	andcc 	%r16, %r0, %r30
T3_asi_reg_rd_12:
	mov	0xa, %r14
	.word 0xf4db89e0  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_23:
	setx	0x1f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaace054  ! 299: STBA_I	stba	%r29, [%r19 + 0x0054] %asi
	.word 0xf2b460c0  ! 301: STHA_I	stha	%r25, [%r17 + 0x00c0] %asi
T3_asi_reg_wr_9:
	mov	0x1f, %r14
	.word 0xf4f389e0  ! 302: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_13:
	mov	0x1c, %r14
	.word 0xf8db84a0  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_14:
	mov	0xe, %r14
	.word 0xfcdb84a0  ! 306: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf6adc020  ! 308: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xb03c8000  ! 309: XNOR_R	xnor 	%r18, %r0, %r24
cpu_intr_3_24:
	setx	0x1f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_10:
	mov	0x2a, %r14
	.word 0xf4f389e0  ! 321: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	.word 0xb0850000  ! 325: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xf074e1bc  ! 326: STX_I	stx	%r24, [%r19 + 0x01bc]
T3_asi_reg_wr_11:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 331: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf275c000  ! 335: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf2350000  ! 337: STH_R	sth	%r25, [%r20 + %r0]
cpu_intr_3_25:
	setx	0x1d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_NONHPRIV
	.word 0xb0a4e100  ! 349: SUBcc_I	subcc 	%r19, 0x0100, %r24
	.word 0xfe258000  ! 356: STW_R	stw	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_15:
	mov	0x9, %r14
	.word 0xf6db8e80  ! 358: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf6758000  ! 360: STX_R	stx	%r27, [%r22 + %r0]
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 24)
	.word 0xf4748000  ! 364: STX_R	stx	%r26, [%r18 + %r0]
T3_asi_reg_rd_16:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 365: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf0f5e120  ! 366: STXA_I	stxa	%r24, [%r23 + 0x0120] %asi
	.word 0xf02c8000  ! 368: STB_R	stb	%r24, [%r18 + %r0]
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_17:
	mov	0x20, %r14
	.word 0xf6db8400  ! 375: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0ade1d7  ! 382: STBA_I	stba	%r24, [%r23 + 0x01d7] %asi
	.word 0xb63ca06a  ! 383: XNOR_I	xnor 	%r18, 0x006a, %r27
	.word 0xf22cc000  ! 385: STB_R	stb	%r25, [%r19 + %r0]
T3_asi_reg_wr_12:
	mov	0x2b, %r14
	.word 0xf2f38e40  ! 387: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_13:
	mov	0x23, %r14
	.word 0xf2f38400  ! 390: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfe258000  ! 391: STW_R	stw	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f42  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f42, %hpstate
	.word 0xfca4e191  ! 398: STWA_I	stwa	%r30, [%r19 + 0x0191] %asi
	.word 0xf0a4c020  ! 399: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_26:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa48000  ! 407: SUBcc_R	subcc 	%r18, %r0, %r29
	.word 0xfe75a05e  ! 409: STX_I	stx	%r31, [%r22 + 0x005e]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_18:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfa2561ae  ! 416: STW_I	stw	%r29, [%r21 + 0x01ae]
	ta	T_CHANGE_NONHPRIV
	.word 0xf2248000  ! 419: STW_R	stw	%r25, [%r18 + %r0]
cpu_intr_3_27:
	setx	0x1f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_28:
	setx	0x1f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074a1a6  ! 434: STX_I	stx	%r24, [%r18 + 0x01a6]
	.word 0xb00d8000  ! 436: AND_R	and 	%r22, %r0, %r24
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb33d9000  ! 438: SRAX_R	srax	%r22, %r0, %r25
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_19:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_29:
	setx	0x1c0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_30:
	setx	0x1c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d8000  ! 452: STB_R	stb	%r30, [%r22 + %r0]
T3_asi_reg_rd_20:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_31:
	setx	0x1e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88cc000  ! 457: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xfe24c000  ! 459: STW_R	stw	%r31, [%r19 + %r0]
T3_asi_reg_wr_14:
	mov	0x2d, %r14
	.word 0xfaf384a0  ! 465: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_32:
	setx	0x200026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_15:
	mov	0x1f, %r14
	.word 0xfaf38e80  ! 470: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_rd_21:
	mov	0x23, %r14
	.word 0xf0db8400  ! 472: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_33:
	setx	0x200032, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_22:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_16:
	mov	0x24, %r14
	.word 0xf8f384a0  ! 479: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfef5a135  ! 480: STXA_I	stxa	%r31, [%r22 + 0x0135] %asi
	.word 0xb8b58000  ! 481: SUBCcc_R	orncc 	%r22, %r0, %r28
T3_asi_reg_wr_17:
	mov	0x27, %r14
	.word 0xf0f38400  ! 483: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_23:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0240000  ! 485: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf02dc000  ! 488: STB_R	stb	%r24, [%r23 + %r0]
T3_asi_reg_wr_18:
	mov	0x37, %r14
	.word 0xf6f38e40  ! 489: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfef5218c  ! 492: STXA_I	stxa	%r31, [%r20 + 0x018c] %asi
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198385a  ! 493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185a, %hpstate
	ta	T_CHANGE_TO_TL0
cpu_intr_3_34:
	setx	0x220316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5c020  ! 498: STHA_R	stha	%r27, [%r23 + %r0] 0x01
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 14)
	.word 0xfe356058  ! 507: STH_I	sth	%r31, [%r21 + 0x0058]
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982fc2  ! 508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc2, %hpstate
	.word 0xbabde1a2  ! 512: XNORcc_I	xnorcc 	%r23, 0x01a2, %r29
	.word 0xfe2d8000  ! 514: STB_R	stb	%r31, [%r22 + %r0]
T3_asi_reg_rd_24:
	mov	0x0, %r14
	.word 0xfedb84a0  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a5a  ! 517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5a, %hpstate
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0a46188  ! 520: STWA_I	stwa	%r24, [%r17 + 0x0188] %asi
	.word 0xfc342164  ! 521: STH_I	sth	%r30, [%r16 + 0x0164]
	.word 0xba24e063  ! 522: SUB_I	sub 	%r19, 0x0063, %r29
	.word 0xfe2420a2  ! 526: STW_I	stw	%r31, [%r16 + 0x00a2]
cpu_intr_3_35:
	setx	0x220111, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_19:
	mov	0x2c, %r14
	.word 0xf2f384a0  ! 528: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_25:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfc74c000  ! 532: STX_R	stx	%r30, [%r19 + %r0]
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 0)
	.word 0xf034c000  ! 543: STH_R	sth	%r24, [%r19 + %r0]
cpu_intr_3_36:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_20:
	mov	0x23, %r14
	.word 0xfcf38400  ! 550: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_wr_21:
	mov	0x20, %r14
	.word 0xfcf38e40  ! 551: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_37:
	setx	0x210129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, c)
	.word 0xb0850000  ! 561: ADDcc_R	addcc 	%r20, %r0, %r24
T3_asi_reg_rd_26:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf874e03e  ! 564: STX_I	stx	%r28, [%r19 + 0x003e]
	.word 0xbaac4000  ! 566: ANDNcc_R	andncc 	%r17, %r0, %r29
T3_asi_reg_rd_27:
	mov	0x4, %r14
	.word 0xfcdb8e60  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_38:
	setx	0x200101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_39:
	setx	0x220014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb285e1e6  ! 573: ADDcc_I	addcc 	%r23, 0x01e6, %r25
	.word 0xb0058000  ! 574: ADD_R	add 	%r22, %r0, %r24
cpu_intr_3_40:
	setx	0x200010, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_22:
	mov	0x5, %r14
	.word 0xf8f389e0  ! 578: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_28:
	mov	0x5, %r14
	.word 0xfedb8e80  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 29)
	.word 0xfeb4a187  ! 585: STHA_I	stha	%r31, [%r18 + 0x0187] %asi
	.word 0xf6ac20d6  ! 588: STBA_I	stba	%r27, [%r16 + 0x00d6] %asi
cpu_intr_3_41:
	setx	0x230336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_42:
	setx	0x22033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_29:
	mov	0x30, %r14
	.word 0xf6db8400  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfaf5e10a  ! 595: STXA_I	stxa	%r29, [%r23 + 0x010a] %asi
	.word 0xf4742012  ! 598: STX_I	stx	%r26, [%r16 + 0x0012]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_30:
	mov	0x20, %r14
	.word 0xf0db84a0  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf8758000  ! 603: STX_R	stx	%r28, [%r22 + %r0]
cpu_intr_3_43:
	setx	0x200213, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_23:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 607: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf6ace06f  ! 608: STBA_I	stba	%r27, [%r19 + 0x006f] %asi
	.word 0xfab46130  ! 609: STHA_I	stha	%r29, [%r17 + 0x0130] %asi
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb08de1f4  ! 613: ANDcc_I	andcc 	%r23, 0x01f4, %r24
	.word 0xfe2ce02f  ! 616: STB_I	stb	%r31, [%r19 + 0x002f]
	.word 0xb6258000  ! 617: SUB_R	sub 	%r22, %r0, %r27
	.word 0xf42c8000  ! 618: STB_R	stb	%r26, [%r18 + %r0]
cpu_intr_3_44:
	setx	0x220339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_45:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_46:
	setx	0x21013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_31:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 627: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf075616a  ! 628: STX_I	stx	%r24, [%r21 + 0x016a]
	.word 0xba9c2010  ! 629: XORcc_I	xorcc 	%r16, 0x0010, %r29
	.word 0xf225e1b6  ! 633: STW_I	stw	%r25, [%r23 + 0x01b6]
	.word 0xfc75618f  ! 636: STX_I	stx	%r30, [%r21 + 0x018f]
T3_asi_reg_rd_32:
	mov	0x1a, %r14
	.word 0xf0db8e60  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 35)
	.word 0xf8ac0020  ! 643: STBA_R	stba	%r28, [%r16 + %r0] 0x01
T3_asi_reg_rd_33:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 14)
	.word 0xf4b5c020  ! 648: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_rd_34:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_47:
	setx	0x220327, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_35:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0ad0020  ! 659: STBA_R	stba	%r24, [%r20 + %r0] 0x01
cpu_intr_3_48:
	setx	0x220017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa7520ec  ! 665: STX_I	stx	%r29, [%r20 + 0x00ec]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982988  ! 666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0988, %hpstate
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 6)
	.word 0xfcb46018  ! 668: STHA_I	stha	%r30, [%r17 + 0x0018] %asi
T3_asi_reg_rd_36:
	mov	0x12, %r14
	.word 0xf6db8e60  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 4)
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
	ta	T_CHANGE_TO_TL1
	.word 0xf624218e  ! 679: STW_I	stw	%r27, [%r16 + 0x018e]
	.word 0xb29da157  ! 681: XORcc_I	xorcc 	%r22, 0x0157, %r25
	.word 0xf675e029  ! 682: STX_I	stx	%r27, [%r23 + 0x0029]
T3_asi_reg_wr_24:
	mov	0x32, %r14
	.word 0xf2f38e60  ! 684: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_49:
	setx	0x230117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_25:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 694: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 17)
	.word 0xf6250000  ! 698: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfcb58020  ! 705: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xb92ce001  ! 707: SLL_I	sll 	%r19, 0x0001, %r28
	.word 0xfeb5c020  ! 709: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xb6954000  ! 710: ORcc_R	orcc 	%r21, %r0, %r27
	.word 0xfeb58020  ! 712: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xf67521a1  ! 713: STX_I	stx	%r27, [%r20 + 0x01a1]
cpu_intr_3_50:
	setx	0x230308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_51:
	setx	0x230125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_52:
	setx	0x210028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_53:
	setx	0x23032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_54:
	setx	0x200127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_37:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 731: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfcad21c1  ! 732: STBA_I	stba	%r30, [%r20 + 0x01c1] %asi
	.word 0xfaf4e10c  ! 733: STXA_I	stxa	%r29, [%r19 + 0x010c] %asi
	.word 0xfe3521b3  ! 734: STH_I	sth	%r31, [%r20 + 0x01b3]
	.word 0xf8b4a03c  ! 735: STHA_I	stha	%r28, [%r18 + 0x003c] %asi
T3_asi_reg_wr_26:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 739: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 33)
	.word 0xbc45a11a  ! 742: ADDC_I	addc 	%r22, 0x011a, %r30
	.word 0xf2b5c020  ! 743: STHA_R	stha	%r25, [%r23 + %r0] 0x01
cpu_intr_3_55:
	setx	0x220218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b48020  ! 748: STHA_R	stha	%r28, [%r18 + %r0] 0x01
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 11)
	.word 0xf87460a5  ! 753: STX_I	stx	%r28, [%r17 + 0x00a5]
	.word 0xfc754000  ! 755: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf4758000  ! 758: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfaa44020  ! 759: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f90  ! 761: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f90, %hpstate
cpu_intr_3_56:
	setx	0x23001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_57:
	setx	0x210000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_58:
	setx	0x200133, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_27:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 769: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
cpu_intr_3_59:
	setx	0x21011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_38:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 29)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c18  ! 777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	.word 0xf8b58020  ! 778: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xf8350000  ! 780: STH_R	sth	%r28, [%r20 + %r0]
T3_asi_reg_rd_39:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_28:
	mov	0x10, %r14
	.word 0xf0f38e60  ! 786: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_60:
	setx	0x200100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_61:
	setx	0x230024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d8000  ! 792: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xb094c000  ! 794: ORcc_R	orcc 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_62:
	setx	0x230322, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d42  ! 801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d42, %hpstate
	.word 0xf074c000  ! 802: STX_R	stx	%r24, [%r19 + %r0]
cpu_intr_3_63:
	setx	0x22013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_64:
	setx	0x210110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_65:
	setx	0x22011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224e0e8  ! 813: STW_I	stw	%r25, [%r19 + 0x00e8]
	.word 0x8794e1aa  ! 815: WRPR_TT_I	wrpr	%r19, 0x01aa, %tt
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 26)
	.word 0xf6ad617e  ! 821: STBA_I	stba	%r27, [%r21 + 0x017e] %asi
	.word 0xbe85a0d5  ! 824: ADDcc_I	addcc 	%r22, 0x00d5, %r31
T3_asi_reg_rd_40:
	mov	0x0, %r14
	.word 0xfadb84a0  ! 829: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb52c6001  ! 833: SLL_I	sll 	%r17, 0x0001, %r26
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 37)
	.word 0xf43461c1  ! 835: STH_I	sth	%r26, [%r17 + 0x01c1]
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_66:
	setx	0x21013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe156095  ! 844: OR_I	or 	%r21, 0x0095, %r31
T3_asi_reg_rd_41:
	mov	0x1c, %r14
	.word 0xfadb8e60  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_42:
	mov	0x27, %r14
	.word 0xfedb8400  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbf2d6001  ! 847: SLL_I	sll 	%r21, 0x0001, %r31
T3_asi_reg_wr_29:
	mov	0x32, %r14
	.word 0xfcf38e60  ! 850: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf8b40020  ! 851: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xf42c8000  ! 852: STB_R	stb	%r26, [%r18 + %r0]
T3_asi_reg_rd_43:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_44:
	mov	0x29, %r14
	.word 0xf2db8400  ! 857: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf834a12d  ! 861: STH_I	sth	%r28, [%r18 + 0x012d]
	.word 0xf6756001  ! 862: STX_I	stx	%r27, [%r21 + 0x0001]
	.word 0xfc35217a  ! 865: STH_I	sth	%r30, [%r20 + 0x017a]
	.word 0xf4744000  ! 866: STX_R	stx	%r26, [%r17 + %r0]
cpu_intr_3_67:
	setx	0x220129, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_45:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0a44020  ! 872: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
T3_asi_reg_wr_30:
	mov	0xe, %r14
	.word 0xf8f389e0  ! 873: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_46:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 879: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_47:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_68:
	setx	0x20021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeaca0ac  ! 884: STBA_I	stba	%r31, [%r18 + 0x00ac] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_69:
	setx	0x230315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa740000  ! 890: STX_R	stx	%r29, [%r16 + %r0]
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe75c000  ! 892: STX_R	stx	%r31, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_48:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf875e101  ! 902: STX_I	stx	%r28, [%r23 + 0x0101]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 12)
	.word 0xf8a50020  ! 910: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xbd2c9000  ! 911: SLLX_R	sllx	%r18, %r0, %r30
	.word 0xf6356164  ! 912: STH_I	sth	%r27, [%r21 + 0x0164]
	.word 0xf2a4e0de  ! 914: STWA_I	stwa	%r25, [%r19 + 0x00de] %asi
	.word 0xfa7561f2  ! 918: STX_I	stx	%r29, [%r21 + 0x01f2]
	.word 0xf0ac8020  ! 919: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xf2b56142  ! 920: STHA_I	stha	%r25, [%r21 + 0x0142] %asi
cpu_intr_3_70:
	setx	0x24022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 9)
	.word 0xb28d0000  ! 926: ANDcc_R	andcc 	%r20, %r0, %r25
	ta	T_CHANGE_NONHPRIV
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 32)
	.word 0xf22d201d  ! 930: STB_I	stb	%r25, [%r20 + 0x001d]
cpu_intr_3_71:
	setx	0x260012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_72:
	setx	0x24020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_49:
	mov	0x12, %r14
	.word 0xf6db8e80  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf6b44020  ! 942: STHA_R	stha	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_50:
	mov	0x35, %r14
	.word 0xfedb84a0  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf025c000  ! 944: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xfc2d6172  ! 945: STB_I	stb	%r30, [%r21 + 0x0172]
	.word 0xfaac0020  ! 947: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	.word 0xb1540000  ! 948: RDPR_GL	rdpr	%-, %r24
cpu_intr_3_73:
	setx	0x24032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_31:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 952: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb2358000  ! 953: ORN_R	orn 	%r22, %r0, %r25
	.word 0xfeb421db  ! 954: STHA_I	stha	%r31, [%r16 + 0x01db] %asi
cpu_intr_3_74:
	setx	0x250205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba854000  ! 956: ADDcc_R	addcc 	%r21, %r0, %r29
cpu_intr_3_75:
	setx	0x24031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_76:
	setx	0x260109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8348000  ! 960: STH_R	sth	%r28, [%r18 + %r0]
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, c)
	.word 0xf425c000  ! 963: STW_R	stw	%r26, [%r23 + %r0]
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfc24212e  ! 965: STW_I	stw	%r30, [%r16 + 0x012e]
	ta	T_CHANGE_TO_TL0
	.word 0xb4c50000  ! 967: ADDCcc_R	addccc 	%r20, %r0, %r26
	.word 0xf2344000  ! 968: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xf8adc020  ! 969: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_77:
	setx	0x1a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_78:
	setx	0x26022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf2244000  ! 977: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf0b44020  ! 978: STHA_R	stha	%r24, [%r17 + %r0] 0x01
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_79:
	setx	0x270131, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfeac0020  ! 989: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf8ada073  ! 991: STBA_I	stba	%r28, [%r22 + 0x0073] %asi
	.word 0xf474a025  ! 994: STX_I	stx	%r26, [%r18 + 0x0025]
	.word 0xfe25e096  ! 995: STW_I	stw	%r31, [%r23 + 0x0096]
	.word 0xfeacc020  ! 999: STBA_R	stba	%r31, [%r19 + %r0] 0x01
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
cpu_intr_3_80:
	setx	0x25032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c4000  ! 1007: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfc2c61a8  ! 1011: STB_I	stb	%r30, [%r17 + 0x01a8]
	.word 0xf425e0f8  ! 1012: STW_I	stw	%r26, [%r23 + 0x00f8]
	.word 0xbb353001  ! 1013: SRLX_I	srlx	%r20, 0x0001, %r29
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, b)
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 9)
	.word 0xf2250000  ! 1021: STW_R	stw	%r25, [%r20 + %r0]
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_81:
	setx	0x26001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4a04b  ! 1027: STWA_I	stwa	%r28, [%r18 + 0x004b] %asi
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 16)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982810  ! 1033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
cpu_intr_3_82:
	setx	0x260310, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982852  ! 1036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
cpu_intr_3_83:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_51:
	mov	0x1, %r14
	.word 0xf2db8400  ! 1038: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf02c21fc  ! 1041: STB_I	stb	%r24, [%r16 + 0x01fc]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 21)
	.word 0xf024e1f4  ! 1046: STW_I	stw	%r24, [%r19 + 0x01f4]
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf02c0000  ! 1048: STB_R	stb	%r24, [%r16 + %r0]
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 31)
	.word 0xfead61d7  ! 1056: STBA_I	stba	%r31, [%r21 + 0x01d7] %asi
T3_asi_reg_wr_32:
	mov	0x34, %r14
	.word 0xfef38e60  ! 1059: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
	.word 0xf82da1d1  ! 1067: STB_I	stb	%r28, [%r22 + 0x01d1]
	.word 0xfeac8020  ! 1069: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xf635c000  ! 1070: STH_R	sth	%r27, [%r23 + %r0]
T3_asi_reg_rd_52:
	mov	0x34, %r14
	.word 0xfcdb8e60  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc2de1cf  ! 1075: STB_I	stb	%r30, [%r23 + 0x01cf]
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f4a  ! 1076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
T3_asi_reg_wr_33:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1077: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf834a101  ! 1078: STH_I	sth	%r28, [%r18 + 0x0101]
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_34:
	mov	0x12, %r14
	.word 0xfef38e60  ! 1080: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_84:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 37)
	.word 0xf2b5e056  ! 1089: STHA_I	stha	%r25, [%r23 + 0x0056] %asi
T3_asi_reg_rd_53:
	mov	0x37, %r14
	.word 0xf0db84a0  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_85:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe148000  ! 1093: OR_R	or 	%r18, %r0, %r31
T3_asi_reg_rd_54:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb204e1a2  ! 1096: ADD_I	add 	%r19, 0x01a2, %r25
cpu_intr_3_86:
	setx	0x240029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_87:
	setx	0x27000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfcb4c020  ! 1110: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xf0758000  ! 1113: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf62c61a7  ! 1114: STB_I	stb	%r27, [%r17 + 0x01a7]
T3_asi_reg_rd_55:
	mov	0x9, %r14
	.word 0xfedb8400  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_88:
	setx	0x270332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42dc000  ! 1119: STB_R	stb	%r26, [%r23 + %r0]
cpu_intr_3_89:
	setx	0x270024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82cc000  ! 1125: STB_R	stb	%r28, [%r19 + %r0]
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 7)
	.word 0xfcb46190  ! 1127: STHA_I	stha	%r30, [%r17 + 0x0190] %asi
	.word 0xf0acc020  ! 1130: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_35:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 1132: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2b4213c  ! 1134: STHA_I	stha	%r25, [%r16 + 0x013c] %asi
T3_asi_reg_wr_36:
	mov	0x21, %r14
	.word 0xf2f38400  ! 1135: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_90:
	setx	0x26021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a46178  ! 1141: STWA_I	stwa	%r24, [%r17 + 0x0178] %asi
	.word 0xf0740000  ! 1142: STX_R	stx	%r24, [%r16 + %r0]
cpu_intr_3_91:
	setx	0x270225, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e50  ! 1144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e50, %hpstate
	.word 0xf62d8000  ! 1148: STB_R	stb	%r27, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_56:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf6f5a1b0  ! 1153: STXA_I	stxa	%r27, [%r22 + 0x01b0] %asi
T3_asi_reg_rd_57:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 1154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfef5a191  ! 1155: STXA_I	stxa	%r31, [%r22 + 0x0191] %asi
	.word 0xf4b40020  ! 1157: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xf4b54020  ! 1164: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	.word 0xb23c21a6  ! 1165: XNOR_I	xnor 	%r16, 0x01a6, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf2b46093  ! 1168: STHA_I	stha	%r25, [%r17 + 0x0093] %asi
	.word 0xf8a560ad  ! 1170: STWA_I	stwa	%r28, [%r21 + 0x00ad] %asi
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_92:
	setx	0x250013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_93:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_94:
	setx	0x25022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_95:
	setx	0x250033, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_59:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfa34e189  ! 1195: STH_I	sth	%r29, [%r19 + 0x0189]
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 10)
	.word 0xb2b56054  ! 1197: SUBCcc_I	orncc 	%r21, 0x0054, %r25
	.word 0xb8140000  ! 1198: OR_R	or 	%r16, %r0, %r28
T3_asi_reg_wr_37:
	mov	0x25, %r14
	.word 0xf0f384a0  ! 1200: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_60:
	mov	0x15, %r14
	.word 0xf2db8400  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 25)
	.word 0xfcb5e154  ! 1216: STHA_I	stha	%r30, [%r23 + 0x0154] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb50020  ! 1218: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xf6748000  ! 1219: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf82ce16e  ! 1229: STB_I	stb	%r28, [%r19 + 0x016e]
	.word 0xfeb52107  ! 1230: STHA_I	stha	%r31, [%r20 + 0x0107] %asi
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf875e0ae  ! 1232: STX_I	stx	%r28, [%r23 + 0x00ae]
	.word 0xf6740000  ! 1234: STX_R	stx	%r27, [%r16 + %r0]
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 16)
	.word 0xf8a4a0fa  ! 1236: STWA_I	stwa	%r28, [%r18 + 0x00fa] %asi
T3_asi_reg_rd_61:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa25a10f  ! 1242: STW_I	stw	%r29, [%r22 + 0x010f]
	.word 0xf0b4a104  ! 1243: STHA_I	stha	%r24, [%r18 + 0x0104] %asi
	.word 0xfa3561fc  ! 1247: STH_I	sth	%r29, [%r21 + 0x01fc]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, c)
	.word 0xf2b421c4  ! 1256: STHA_I	stha	%r25, [%r16 + 0x01c4] %asi
	.word 0xf675204b  ! 1261: STX_I	stx	%r27, [%r20 + 0x004b]
	.word 0xf62de114  ! 1262: STB_I	stb	%r27, [%r23 + 0x0114]
	.word 0xf2f4a0fb  ! 1263: STXA_I	stxa	%r25, [%r18 + 0x00fb] %asi
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_96:
	setx	0x240204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 1270: STW_R	stw	%r26, [%r17 + %r0]
cpu_intr_3_97:
	setx	0x250224, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_62:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 1273: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 2e)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819839d0  ! 1275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 8)
	.word 0xf474e043  ! 1279: STX_I	stx	%r26, [%r19 + 0x0043]
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfeb40020  ! 1284: STHA_R	stha	%r31, [%r16 + %r0] 0x01
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_38:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 1286: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_39:
	mov	0xd, %r14
	.word 0xfaf384a0  ! 1288: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_98:
	setx	0x27001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_63:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4240000  ! 1294: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb8a421c7  ! 1295: SUBcc_I	subcc 	%r16, 0x01c7, %r28
T3_asi_reg_rd_64:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_65:
	mov	0x1, %r14
	.word 0xfadb8400  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, a)
	.word 0xfeac0020  ! 1309: STBA_R	stba	%r31, [%r16 + %r0] 0x01
cpu_intr_3_99:
	setx	0x24013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_100:
	setx	0x270005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b54020  ! 1316: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	.word 0xf8a4a0ee  ! 1318: STWA_I	stwa	%r28, [%r18 + 0x00ee] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_101:
	setx	0x270128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfeb4c020  ! 1327: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xf6b50020  ! 1328: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4a5a12c  ! 1332: STWA_I	stwa	%r26, [%r22 + 0x012c] %asi
cpu_intr_3_102:
	setx	0x270133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0356134  ! 1335: STH_I	sth	%r24, [%r21 + 0x0134]
	.word 0xbd643801  ! 1337: MOVcc_I	<illegal instruction>
cpu_intr_3_103:
	setx	0x260239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_66:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfea5c020  ! 1344: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xbb34a001  ! 1348: SRL_I	srl 	%r18, 0x0001, %r29
T3_asi_reg_rd_67:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_104:
	setx	0x240118, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_68:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 1353: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfea48020  ! 1354: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_40:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 1357: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_105:
	setx	0x260337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d8000  ! 1365: STB_R	stb	%r30, [%r22 + %r0]
cpu_intr_3_106:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_107:
	setx	0x260239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_108:
	setx	0x250021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebd8000  ! 1372: XNORcc_R	xnorcc 	%r22, %r0, %r31
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_109:
	setx	0x24003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_HPRIV
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_110:
	setx	0x25013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_111:
	setx	0x240214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_41:
	mov	0x1, %r14
	.word 0xf0f389e0  ! 1383: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_42:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 1384: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_112:
	setx	0x260127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe75c000  ! 1399: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf834a036  ! 1402: STH_I	sth	%r28, [%r18 + 0x0036]
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 1f)
	.word 0xba95206c  ! 1405: ORcc_I	orcc 	%r20, 0x006c, %r29
	.word 0xf2ad2005  ! 1408: STBA_I	stba	%r25, [%r20 + 0x0005] %asi
	.word 0xf8b40020  ! 1409: STHA_R	stha	%r28, [%r16 + %r0] 0x01
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_113:
	setx	0x28000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b5600d  ! 1416: STHA_I	stha	%r28, [%r21 + 0x000d] %asi
T3_asi_reg_rd_69:
	mov	0x5, %r14
	.word 0xfedb8e60  ! 1417: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_70:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_114:
	setx	0x2b011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_71:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb2c40000  ! 1427: ADDCcc_R	addccc 	%r16, %r0, %r25
cpu_intr_3_115:
	setx	0x280332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9349000  ! 1433: SRLX_R	srlx	%r18, %r0, %r28
	.word 0xf0250000  ! 1437: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xfe24a165  ! 1439: STW_I	stw	%r31, [%r18 + 0x0165]
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 23)
	.word 0xf22d61fc  ! 1442: STB_I	stb	%r25, [%r21 + 0x01fc]
	.word 0xf22dc000  ! 1443: STB_R	stb	%r25, [%r23 + %r0]
cpu_intr_3_116:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_117:
	setx	0x2b0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_72:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_43:
	mov	0x16, %r14
	.word 0xf2f38e80  ! 1450: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf2b5c020  ! 1453: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf4a5c020  ! 1454: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
cpu_intr_3_118:
	setx	0x2b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, c)
	.word 0xfc25c000  ! 1460: STW_R	stw	%r30, [%r23 + %r0]
T3_asi_reg_wr_44:
	mov	0x30, %r14
	.word 0xf2f38e80  ! 1461: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfef56040  ! 1462: STXA_I	stxa	%r31, [%r21 + 0x0040] %asi
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_119:
	setx	0x290124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_120:
	setx	0x2b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_45:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 1488: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_73:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 1489: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_121:
	setx	0x290228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_122:
	setx	0x280314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8d8000  ! 1492: ANDcc_R	andcc 	%r22, %r0, %r29
cpu_intr_3_123:
	setx	0x280331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_124:
	setx	0x2a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_125:
	setx	0x2b032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_46:
	mov	0x8, %r14
	.word 0xf6f38400  ! 1510: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfc2dc000  ! 1512: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xb235a1a6  ! 1513: SUBC_I	orn 	%r22, 0x01a6, %r25
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 38)
	.word 0xf4acc020  ! 1518: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xfaf4e1e5  ! 1519: STXA_I	stxa	%r29, [%r19 + 0x01e5] %asi
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, a)
	.word 0xf2350000  ! 1521: STH_R	sth	%r25, [%r20 + %r0]
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 37)
	.word 0xf035e130  ! 1525: STH_I	sth	%r24, [%r23 + 0x0130]
	.word 0xbc8cc000  ! 1527: ANDcc_R	andcc 	%r19, %r0, %r30
T3_asi_reg_wr_47:
	mov	0x27, %r14
	.word 0xfef38e60  ! 1529: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 25)
	.word 0xfe348000  ! 1534: STH_R	sth	%r31, [%r18 + %r0]
cpu_intr_3_126:
	setx	0x280129, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_74:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2b4a13f  ! 1538: STHA_I	stha	%r25, [%r18 + 0x013f] %asi
	.word 0xb9358000  ! 1539: SRL_R	srl 	%r22, %r0, %r28
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 4)
	.word 0xf2ada057  ! 1542: STBA_I	stba	%r25, [%r22 + 0x0057] %asi
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_75:
	mov	0x14, %r14
	.word 0xfcdb84a0  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbb342001  ! 1547: SRL_I	srl 	%r16, 0x0001, %r29
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf8754000  ! 1550: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xbd354000  ! 1553: SRL_R	srl 	%r21, %r0, %r30
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_127:
	setx	0x2a0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e07e  ! 1556: STX_I	stx	%r30, [%r23 + 0x007e]
	.word 0xf8a54020  ! 1560: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xfcf5207f  ! 1564: STXA_I	stxa	%r30, [%r20 + 0x007f] %asi
T3_asi_reg_rd_76:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 1567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 2d)
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983858  ! 1573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1858, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9518000  ! 1577: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfc258000  ! 1578: STW_R	stw	%r30, [%r22 + %r0]
cpu_intr_3_128:
	setx	0x280012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc256068  ! 1580: STW_I	stw	%r30, [%r21 + 0x0068]
	.word 0xf4a5c020  ! 1585: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
cpu_intr_3_129:
	setx	0x28021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe258000  ! 1595: SUB_R	sub 	%r22, %r0, %r31
cpu_intr_3_130:
	setx	0x2b0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24214f  ! 1602: STW_I	stw	%r31, [%r16 + 0x014f]
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 5)
	.word 0xf035c000  ! 1606: STH_R	sth	%r24, [%r23 + %r0]
T3_asi_reg_wr_48:
	mov	0x1e, %r14
	.word 0xf4f38e80  ! 1609: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbaa40000  ! 1610: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xf0a4c020  ! 1613: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_77:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 1619: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfcac20bb  ! 1620: STBA_I	stba	%r30, [%r16 + 0x00bb] %asi
	.word 0xf62da0ab  ! 1621: STB_I	stb	%r27, [%r22 + 0x00ab]
T3_asi_reg_wr_49:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 1622: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_50:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 1623: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf0acc020  ! 1628: STBA_R	stba	%r24, [%r19 + %r0] 0x01
cpu_intr_3_131:
	setx	0x2b0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4354000  ! 1631: ORN_R	orn 	%r21, %r0, %r26
T3_asi_reg_rd_78:
	mov	0x23, %r14
	.word 0xf8db8e40  ! 1635: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_132:
	setx	0x2b0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_133:
	setx	0x2a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4210e  ! 1643: STXA_I	stxa	%r28, [%r16 + 0x010e] %asi
T3_asi_reg_rd_79:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf0a4a017  ! 1648: STWA_I	stwa	%r24, [%r18 + 0x0017] %asi
	.word 0xf2a40020  ! 1650: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8742072  ! 1657: STX_I	stx	%r28, [%r16 + 0x0072]
T3_asi_reg_rd_80:
	mov	0x28, %r14
	.word 0xfcdb84a0  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_rd_81:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbd7c4400  ! 1661: MOVR_R	movre	%r17, %r0, %r30
	.word 0xfea421c9  ! 1664: STWA_I	stwa	%r31, [%r16 + 0x01c9] %asi
	.word 0xf025a0f2  ! 1665: STW_I	stw	%r24, [%r22 + 0x00f2]
	.word 0xb63d21db  ! 1675: XNOR_I	xnor 	%r20, 0x01db, %r27
	.word 0xbd347001  ! 1676: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xf424a0fa  ! 1677: STW_I	stw	%r26, [%r18 + 0x00fa]
	.word 0xf634c000  ! 1680: STH_R	sth	%r27, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_82:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 1683: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198298a  ! 1685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 14)
	.word 0xf035c000  ! 1687: STH_R	sth	%r24, [%r23 + %r0]
T3_asi_reg_wr_51:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 1688: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfcad8020  ! 1691: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xbe244000  ! 1693: SUB_R	sub 	%r17, %r0, %r31
T3_asi_reg_wr_52:
	mov	0x25, %r14
	.word 0xf2f38400  ! 1695: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf2a48020  ! 1696: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xfe350000  ! 1697: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf4254000  ! 1700: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfa3461e7  ! 1704: STH_I	sth	%r29, [%r17 + 0x01e7]
	.word 0x9195a026  ! 1707: WRPR_PIL_I	wrpr	%r22, 0x0026, %pil
	.word 0xf4b4e1e6  ! 1708: STHA_I	stha	%r26, [%r19 + 0x01e6] %asi
	.word 0xf8b5c020  ! 1709: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_NONHPRIV
	.word 0xbb3c8000  ! 1717: SRA_R	sra 	%r18, %r0, %r29
	.word 0xf0f5219b  ! 1718: STXA_I	stxa	%r24, [%r20 + 0x019b] %asi
	.word 0xf4acc020  ! 1719: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xf4a48020  ! 1720: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xf0adc020  ! 1722: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xb4b4a160  ! 1729: SUBCcc_I	orncc 	%r18, 0x0160, %r26
	.word 0xfaf561f9  ! 1731: STXA_I	stxa	%r29, [%r21 + 0x01f9] %asi
	.word 0xf22d0000  ! 1732: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf22d20fe  ! 1733: STB_I	stb	%r25, [%r20 + 0x00fe]
T3_asi_reg_rd_83:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf82cc000  ! 1739: STB_R	stb	%r28, [%r19 + %r0]
cpu_intr_3_134:
	setx	0x2b021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b58020  ! 1744: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xfe35e12f  ! 1745: STH_I	sth	%r31, [%r23 + 0x012f]
T3_asi_reg_wr_53:
	mov	0x1b, %r14
	.word 0xfcf384a0  ! 1746: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_54:
	mov	0x27, %r14
	.word 0xfaf38e40  ! 1748: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfaf5a0cf  ! 1749: STXA_I	stxa	%r29, [%r22 + 0x00cf] %asi
	.word 0xfc740000  ! 1752: STX_R	stx	%r30, [%r16 + %r0]
T3_asi_reg_wr_55:
	mov	0x1, %r14
	.word 0xf4f389e0  ! 1753: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf675e078  ! 1755: STX_I	stx	%r27, [%r23 + 0x0078]
cpu_intr_3_135:
	setx	0x29022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02461d1  ! 1759: STW_I	stw	%r24, [%r17 + 0x01d1]
cpu_intr_3_136:
	setx	0x290229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_137:
	setx	0x28033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_56:
	mov	0x27, %r14
	.word 0xfaf384a0  ! 1765: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_138:
	setx	0x2b0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 11)
	.word 0xf62c0000  ! 1780: STB_R	stb	%r27, [%r16 + %r0]
T3_asi_reg_wr_57:
	mov	0x1e, %r14
	.word 0xfaf38400  ! 1782: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_84:
	mov	0x1, %r14
	.word 0xf4db84a0  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfaf4a099  ! 1785: STXA_I	stxa	%r29, [%r18 + 0x0099] %asi
	.word 0xb6458000  ! 1787: ADDC_R	addc 	%r22, %r0, %r27
	.word 0xfe2de108  ! 1789: STB_I	stb	%r31, [%r23 + 0x0108]
	.word 0xfcb5a1e0  ! 1790: STHA_I	stha	%r30, [%r22 + 0x01e0] %asi
T3_asi_reg_wr_58:
	mov	0x12, %r14
	.word 0xf8f38400  ! 1793: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbc0ca0fb  ! 1794: AND_I	and 	%r18, 0x00fb, %r30
cpu_intr_3_139:
	setx	0x28031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfca5c020  ! 1799: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
T3_asi_reg_rd_85:
	mov	0x13, %r14
	.word 0xfadb89e0  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_140:
	setx	0x290035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4056191  ! 1810: ADD_I	add 	%r21, 0x0191, %r26
	.word 0xfeace11e  ! 1811: STBA_I	stba	%r31, [%r19 + 0x011e] %asi
	.word 0xfcac61c6  ! 1812: STBA_I	stba	%r30, [%r17 + 0x01c6] %asi
T3_asi_reg_wr_59:
	mov	0x24, %r14
	.word 0xf4f389e0  ! 1813: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf4a56020  ! 1816: STWA_I	stwa	%r26, [%r21 + 0x0020] %asi
T3_asi_reg_rd_86:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 1819: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_141:
	setx	0x290324, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_87:
	mov	0x1, %r14
	.word 0xf8db8e80  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_142:
	setx	0x290224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_143:
	setx	0x28031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 1826: RDPR_GL	rdpr	%-, %r26
	.word 0xf22d8000  ! 1832: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xfeadc020  ! 1842: STBA_R	stba	%r31, [%r23 + %r0] 0x01
	.word 0xba14a198  ! 1843: OR_I	or 	%r18, 0x0198, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfead0020  ! 1849: STBA_R	stba	%r31, [%r20 + %r0] 0x01
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_60:
	mov	0x12, %r14
	.word 0xfcf38400  ! 1851: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_61:
	mov	0x7, %r14
	.word 0xf4f38e40  ! 1859: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8a44020  ! 1861: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_62:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 1862: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xf8744000  ! 1866: STX_R	stx	%r28, [%r17 + %r0]
T3_asi_reg_wr_63:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 1867: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982dca  ! 1874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dca, %hpstate
cpu_intr_3_144:
	setx	0x2e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_145:
	setx	0x2c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_88:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfca4e1f5  ! 1893: STWA_I	stwa	%r30, [%r19 + 0x01f5] %asi
	.word 0xb33d8000  ! 1894: SRA_R	sra 	%r22, %r0, %r25
	.word 0xf82c4000  ! 1895: STB_R	stb	%r28, [%r17 + %r0]
cpu_intr_3_146:
	setx	0x2f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d4000  ! 1901: STB_R	stb	%r26, [%r21 + %r0]
T3_asi_reg_wr_64:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 1909: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_147:
	setx	0x2c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe450000  ! 1918: ADDC_R	addc 	%r20, %r0, %r31
	.word 0xf4ac0020  ! 1919: STBA_R	stba	%r26, [%r16 + %r0] 0x01
cpu_intr_3_148:
	setx	0x2c013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x2c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 0)
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e0a  ! 1929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0a, %hpstate
	.word 0xf624a130  ! 1930: STW_I	stw	%r27, [%r18 + 0x0130]
T3_asi_reg_rd_89:
	mov	0x37, %r14
	.word 0xfedb8400  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_90:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xfead8020  ! 1941: STBA_R	stba	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_91:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_65:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 1945: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_92:
	mov	0x1d, %r14
	.word 0xfedb8e80  ! 1946: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf074e06e  ! 1947: STX_I	stx	%r24, [%r19 + 0x006e]
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_150:
	setx	0x2e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4a021  ! 1951: STWA_I	stwa	%r24, [%r18 + 0x0021] %asi
cpu_intr_3_151:
	setx	0x2f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_66:
	mov	0xf, %r14
	.word 0xfaf38e80  ! 1958: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 6)
	.word 0xb37d8400  ! 1962: MOVR_R	movre	%r22, %r0, %r25
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 15)
	.word 0xf634a0ae  ! 1966: STH_I	sth	%r27, [%r18 + 0x00ae]
	.word 0xfead21b3  ! 1968: STBA_I	stba	%r31, [%r20 + 0x01b3] %asi
T3_asi_reg_rd_93:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 36)
	.word 0xfa244000  ! 1975: STW_R	stw	%r29, [%r17 + %r0]
T3_asi_reg_rd_94:
	mov	0x7, %r14
	.word 0xf2db8e40  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6a58020  ! 1981: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfc748000  ! 1983: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xb4342019  ! 1985: SUBC_I	orn 	%r16, 0x0019, %r26
	.word 0xf675e126  ! 1987: STX_I	stx	%r27, [%r23 + 0x0126]
T3_asi_reg_rd_95:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf6744000  ! 1996: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf8ad0020  ! 1999: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_67:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 2001: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfaac6155  ! 2002: STBA_I	stba	%r29, [%r17 + 0x0155] %asi
T3_asi_reg_rd_96:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 2003: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb4a56153  ! 2005: SUBcc_I	subcc 	%r21, 0x0153, %r26
	.word 0xf6f5e122  ! 2006: STXA_I	stxa	%r27, [%r23 + 0x0122] %asi
T3_asi_reg_wr_68:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 2007: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_97:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 2008: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_rd_98:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 2009: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfca54020  ! 2014: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	.word 0xfcad2180  ! 2015: STBA_I	stba	%r30, [%r20 + 0x0180] %asi
	.word 0xf4b54020  ! 2020: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf6a5c020  ! 2023: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xf4744000  ! 2025: STX_R	stx	%r26, [%r17 + %r0]
T3_asi_reg_wr_69:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 2026: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf824a037  ! 2027: STW_I	stw	%r28, [%r18 + 0x0037]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_152:
	setx	0x2e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf2350000  ! 2037: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf8340000  ! 2042: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfc348000  ! 2043: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xfa750000  ! 2046: STX_R	stx	%r29, [%r20 + %r0]
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 11)
	.word 0xf8750000  ! 2051: STX_R	stx	%r28, [%r20 + %r0]
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 20)
	.word 0xfaf560d0  ! 2060: STXA_I	stxa	%r29, [%r21 + 0x00d0] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xb33de001  ! 2064: SRA_I	sra 	%r23, 0x0001, %r25
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_99:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_70:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 2073: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb2ada071  ! 2074: ANDNcc_I	andncc 	%r22, 0x0071, %r25
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_153:
	setx	0x2d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0740000  ! 2080: STX_R	stx	%r24, [%r16 + %r0]
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819839d2  ! 2083: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d2, %hpstate
	.word 0xf6f5e105  ! 2087: STXA_I	stxa	%r27, [%r23 + 0x0105] %asi
	.word 0xf625e026  ! 2088: STW_I	stw	%r27, [%r23 + 0x0026]
T3_asi_reg_rd_100:
	mov	0xb, %r14
	.word 0xf0db8400  ! 2089: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_101:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 2090: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_71:
	mov	0x18, %r14
	.word 0xf0f38e60  ! 2091: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 3f)
	.word 0xbaacc000  ! 2098: ANDNcc_R	andncc 	%r19, %r0, %r29
	.word 0xfaac21dc  ! 2099: STBA_I	stba	%r29, [%r16 + 0x01dc] %asi
cpu_intr_3_154:
	setx	0x2c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d8000  ! 2104: SLL_R	sll 	%r22, %r0, %r24
T3_asi_reg_rd_102:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1349000  ! 2116: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xf0ad4020  ! 2117: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xf22ca156  ! 2120: STB_I	stb	%r25, [%r18 + 0x0156]
	.word 0xf0f5e1f7  ! 2121: STXA_I	stxa	%r24, [%r23 + 0x01f7] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_155:
	setx	0x2f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_103:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 2127: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 18)
	.word 0xf0ace11e  ! 2137: STBA_I	stba	%r24, [%r19 + 0x011e] %asi
	.word 0xf4b40020  ! 2138: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c52  ! 2140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
T3_asi_reg_rd_104:
	mov	0x2b, %r14
	.word 0xf8db8e60  ! 2141: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 9)
	.word 0xf03421de  ! 2143: STH_I	sth	%r24, [%r16 + 0x01de]
cpu_intr_3_156:
	setx	0x2f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983910  ! 2145: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1910, %hpstate
	.word 0xb2bde1d2  ! 2148: XNORcc_I	xnorcc 	%r23, 0x01d2, %r25
T3_asi_reg_wr_72:
	mov	0x10, %r14
	.word 0xf0f38e40  ! 2149: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb33c0000  ! 2150: SRA_R	sra 	%r16, %r0, %r25
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b90  ! 2155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b90, %hpstate
T3_asi_reg_rd_105:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf2b4a1af  ! 2158: STHA_I	stha	%r25, [%r18 + 0x01af] %asi
	.word 0xfef5e04e  ! 2161: STXA_I	stxa	%r31, [%r23 + 0x004e] %asi
	.word 0xf8a521be  ! 2162: STWA_I	stwa	%r28, [%r20 + 0x01be] %asi
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf0ad0020  ! 2165: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xfc2da090  ! 2166: STB_I	stb	%r30, [%r22 + 0x0090]
	.word 0xf4254000  ! 2167: STW_R	stw	%r26, [%r21 + %r0]
cpu_intr_3_157:
	setx	0x2c0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_158:
	setx	0x2d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ad4000  ! 2181: ANDNcc_R	andncc 	%r21, %r0, %r26
T3_asi_reg_rd_106:
	mov	0xc, %r14
	.word 0xf8db8e60  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbe0c2174  ! 2183: AND_I	and 	%r16, 0x0174, %r31
T3_asi_reg_wr_73:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 2184: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9342001  ! 2186: SRL_I	srl 	%r16, 0x0001, %r28
	.word 0xf8ad613d  ! 2187: STBA_I	stba	%r28, [%r21 + 0x013d] %asi
	.word 0xfa758000  ! 2188: STX_R	stx	%r29, [%r22 + %r0]
cpu_intr_3_159:
	setx	0x2c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_160:
	setx	0x2c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_161:
	setx	0x2e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2746058  ! 2197: STX_I	stx	%r25, [%r17 + 0x0058]
	.word 0xf6b58020  ! 2198: STHA_R	stha	%r27, [%r22 + %r0] 0x01
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_107:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_108:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfcf5e01d  ! 2205: STXA_I	stxa	%r30, [%r23 + 0x001d] %asi
cpu_intr_3_162:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a54020  ! 2216: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf6348000  ! 2217: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_163:
	setx	0x2e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_109:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_110:
	mov	0x19, %r14
	.word 0xf6db8e40  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	.word 0xf2344000  ! 2231: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_164:
	setx	0x2e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4250000  ! 2234: STW_R	stw	%r26, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 19)
	.word 0xf82d60e3  ! 2244: STB_I	stb	%r28, [%r21 + 0x00e3]
	.word 0xf2ada068  ! 2246: STBA_I	stba	%r25, [%r22 + 0x0068] %asi
	.word 0xf425614c  ! 2252: STW_I	stw	%r26, [%r21 + 0x014c]
cpu_intr_3_165:
	setx	0x2f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d4000  ! 2257: STB_R	stb	%r31, [%r21 + %r0]
T3_asi_reg_wr_74:
	mov	0x34, %r14
	.word 0xfef389e0  ! 2259: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 39)
	.word 0xf63461ff  ! 2262: STH_I	sth	%r27, [%r17 + 0x01ff]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_166:
	setx	0x2d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_75:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 2266: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_167:
	setx	0x2d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 36)
	.word 0xf6ac4020  ! 2273: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4748000  ! 2275: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf0248000  ! 2276: STW_R	stw	%r24, [%r18 + %r0]
T3_asi_reg_rd_111:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 2278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_76:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 2279: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_112:
	mov	0xd, %r14
	.word 0xf4db8400  ! 2281: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb92d1000  ! 2283: SLLX_R	sllx	%r20, %r0, %r28
cpu_intr_3_168:
	setx	0x2e0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634e0d9  ! 2286: STH_I	sth	%r27, [%r19 + 0x00d9]
cpu_intr_3_169:
	setx	0x2e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1342001  ! 2290: SRL_I	srl 	%r16, 0x0001, %r24
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_170:
	setx	0x2d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4858000  ! 2301: ADDcc_R	addcc 	%r22, %r0, %r26
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 2)
	.word 0xb204211b  ! 2304: ADD_I	add 	%r16, 0x011b, %r25
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 3)
	.word 0xb285e12c  ! 2310: ADDcc_I	addcc 	%r23, 0x012c, %r25
T3_asi_reg_rd_113:
	mov	0x1, %r14
	.word 0xf8db8e60  ! 2312: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_77:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 2319: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_171:
	setx	0x320130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42d4000  ! 2327: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xb69dc000  ! 2328: XORcc_R	xorcc 	%r23, %r0, %r27
T3_asi_reg_wr_78:
	mov	0x4, %r14
	.word 0xfef38e60  ! 2329: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_wr_79:
	mov	0x2a, %r14
	.word 0xfef38400  ! 2330: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_172:
	setx	0x310204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b44000  ! 2332: SUBCcc_R	orncc 	%r17, %r0, %r25
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_114:
	mov	0x3, %r14
	.word 0xf6db84a0  ! 2335: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 33)
	.word 0xbd520000  ! 2338: RDPR_PIL	rdpr	%pil, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_115:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbab44000  ! 2350: SUBCcc_R	orncc 	%r17, %r0, %r29
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_80:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 2359: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_173:
	setx	0x310219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_174:
	setx	0x320334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x310025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874e0d2  ! 2364: STX_I	stx	%r28, [%r19 + 0x00d2]
T3_asi_reg_wr_81:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 2365: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb294615b  ! 2367: ORcc_I	orcc 	%r17, 0x015b, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf4ade1d6  ! 2374: STBA_I	stba	%r26, [%r23 + 0x01d6] %asi
	.word 0xf2b52062  ! 2379: STHA_I	stha	%r25, [%r20 + 0x0062] %asi
	.word 0xfc2cc000  ! 2380: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xfcf5a089  ! 2382: STXA_I	stxa	%r30, [%r22 + 0x0089] %asi
	.word 0xb61dc000  ! 2383: XOR_R	xor 	%r23, %r0, %r27
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4a54020  ! 2388: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f08  ! 2390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f08, %hpstate
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfeb54020  ! 2392: STHA_R	stha	%r31, [%r21 + %r0] 0x01
cpu_intr_3_176:
	setx	0x310338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_177:
	setx	0x330138, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983988  ! 2401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1988, %hpstate
	.word 0xfcaca0c9  ! 2402: STBA_I	stba	%r30, [%r18 + 0x00c9] %asi
T3_asi_reg_wr_82:
	mov	0xf, %r14
	.word 0xf2f38400  ! 2403: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_116:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb2a58000  ! 2409: SUBcc_R	subcc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfea560e4  ! 2411: STWA_I	stwa	%r31, [%r21 + 0x00e4] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_117:
	mov	0x29, %r14
	.word 0xfedb84a0  ! 2414: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfc7461f1  ! 2415: STX_I	stx	%r30, [%r17 + 0x01f1]
T3_asi_reg_rd_118:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbe34e0e6  ! 2418: SUBC_I	orn 	%r19, 0x00e6, %r31
T3_asi_reg_rd_119:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa25219b  ! 2420: STW_I	stw	%r29, [%r20 + 0x019b]
	.word 0xfef5a1a7  ! 2421: STXA_I	stxa	%r31, [%r22 + 0x01a7] %asi
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 2424: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfe244000  ! 2425: STW_R	stw	%r31, [%r17 + %r0]
T3_asi_reg_wr_84:
	mov	0x18, %r14
	.word 0xf4f38e60  ! 2426: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbe3da049  ! 2433: XNOR_I	xnor 	%r22, 0x0049, %r31
T3_asi_reg_rd_120:
	mov	0x27, %r14
	.word 0xf0db84a0  ! 2437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf6f5a1e1  ! 2439: STXA_I	stxa	%r27, [%r22 + 0x01e1] %asi
	.word 0xf6ad0020  ! 2441: STBA_R	stba	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_121:
	mov	0x16, %r14
	.word 0xf0db89e0  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf27420e1  ! 2449: STX_I	stx	%r25, [%r16 + 0x00e1]
	.word 0xfcb44020  ! 2456: STHA_R	stha	%r30, [%r17 + %r0] 0x01
	.word 0xfa25c000  ! 2460: STW_R	stw	%r29, [%r23 + %r0]
cpu_intr_3_178:
	setx	0x310212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb46110  ! 2466: STHA_I	stha	%r30, [%r17 + 0x0110] %asi
	.word 0xbf2d3001  ! 2469: SLLX_I	sllx	%r20, 0x0001, %r31
cpu_intr_3_179:
	setx	0x32012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf02de1bb  ! 2474: STB_I	stb	%r24, [%r23 + 0x01bb]
	.word 0xfab46040  ! 2478: STHA_I	stha	%r29, [%r17 + 0x0040] %asi
	.word 0xb7345000  ! 2479: SRLX_R	srlx	%r17, %r0, %r27
T3_asi_reg_wr_85:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 2480: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_86:
	mov	0x32, %r14
	.word 0xf8f38e60  ! 2486: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_180:
	setx	0x310233, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_181:
	setx	0x310026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b40020  ! 2495: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xf2aca1e6  ! 2497: STBA_I	stba	%r25, [%r18 + 0x01e6] %asi
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_182:
	setx	0x33003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_122:
	mov	0x1c, %r14
	.word 0xf0db8e60  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_183:
	setx	0x30001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_184:
	setx	0x32011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb604a047  ! 2513: ADD_I	add 	%r18, 0x0047, %r27
T3_asi_reg_wr_87:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 2515: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_wr_88:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 2516: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa2c2133  ! 2517: STB_I	stb	%r29, [%r16 + 0x0133]
cpu_intr_3_185:
	setx	0x300118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab5c000  ! 2520: SUBCcc_R	orncc 	%r23, %r0, %r29
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 2)
	.word 0xfc2d21c5  ! 2522: STB_I	stb	%r30, [%r20 + 0x01c5]
cpu_intr_3_186:
	setx	0x300020, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d12  ! 2531: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d12, %hpstate
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 13)
	.word 0xb2bdc000  ! 2533: XNORcc_R	xnorcc 	%r23, %r0, %r25
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 12)
	.word 0xf824c000  ! 2538: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf874a0c3  ! 2539: STX_I	stx	%r28, [%r18 + 0x00c3]
T3_asi_reg_rd_123:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfcace13e  ! 2541: STBA_I	stba	%r30, [%r19 + 0x013e] %asi
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_89:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 2546: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb044615b  ! 2547: ADDC_I	addc 	%r17, 0x015b, %r24
T3_asi_reg_rd_124:
	mov	0x5, %r14
	.word 0xfadb89e0  ! 2548: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_187:
	setx	0x310228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_125:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_126:
	mov	0x2a, %r14
	.word 0xfadb8e40  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc348000  ! 2563: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_188:
	setx	0x32000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_127:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 2565: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2b560c6  ! 2568: STHA_I	stha	%r25, [%r21 + 0x00c6] %asi
cpu_intr_3_189:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5e0bd  ! 2572: STHA_I	stha	%r30, [%r23 + 0x00bd] %asi
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_90:
	mov	0x12, %r14
	.word 0xfef38e40  ! 2575: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8ac8020  ! 2576: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_91:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 2578: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbcad21d4  ! 2579: ANDNcc_I	andncc 	%r20, 0x01d4, %r30
T3_asi_reg_wr_92:
	mov	0x2c, %r14
	.word 0xfef38e60  ! 2580: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_190:
	setx	0x30000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb72de001  ! 2586: SLL_I	sll 	%r23, 0x0001, %r27
	.word 0xf8ac8020  ! 2589: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xb4b54000  ! 2590: ORNcc_R	orncc 	%r21, %r0, %r26
	.word 0xfab44020  ! 2591: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_93:
	mov	0xb, %r14
	.word 0xf2f38e80  ! 2597: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfcb4a154  ! 2603: STHA_I	stha	%r30, [%r18 + 0x0154] %asi
T3_asi_reg_wr_94:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2604: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_128:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_191:
	setx	0x310305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0aca07a  ! 2613: STBA_I	stba	%r24, [%r18 + 0x007a] %asi
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b88  ! 2614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b88, %hpstate
	.word 0xf4356083  ! 2615: STH_I	sth	%r26, [%r21 + 0x0083]
	.word 0xb37c4400  ! 2616: MOVR_R	movre	%r17, %r0, %r25
	.word 0x8394215b  ! 2617: WRPR_TNPC_I	wrpr	%r16, 0x015b, %tnpc
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d42  ! 2618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d42, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf6b40020  ! 2623: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_192:
	setx	0x310111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa740000  ! 2629: STX_R	stx	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4744000  ! 2641: STX_R	stx	%r26, [%r17 + %r0]
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_95:
	mov	0x36, %r14
	.word 0xf0f38400  ! 2645: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf6b44020  ! 2646: STHA_R	stha	%r27, [%r17 + %r0] 0x01
T3_asi_reg_wr_96:
	mov	0x1, %r14
	.word 0xf6f38e60  ! 2647: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_193:
	setx	0x31003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfef420b4  ! 2654: STXA_I	stxa	%r31, [%r16 + 0x00b4] %asi
T3_asi_reg_wr_97:
	mov	0xb, %r14
	.word 0xfcf389e0  ! 2657: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf2b50020  ! 2658: STHA_R	stha	%r25, [%r20 + %r0] 0x01
	.word 0xfcb58020  ! 2661: STHA_R	stha	%r30, [%r22 + %r0] 0x01
cpu_intr_3_194:
	setx	0x300202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 30)
	.word 0xbec5c000  ! 2667: ADDCcc_R	addccc 	%r23, %r0, %r31
	.word 0x8f902002  ! 2671: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
cpu_intr_3_195:
	setx	0x330031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 3)
	.word 0xb89c0000  ! 2683: XORcc_R	xorcc 	%r16, %r0, %r28
	.word 0xf6346141  ! 2684: STH_I	sth	%r27, [%r17 + 0x0141]
	.word 0xbc054000  ! 2688: ADD_R	add 	%r21, %r0, %r30
T3_asi_reg_wr_98:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 2689: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0x8f902002  ! 2691: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
T3_asi_reg_rd_129:
	mov	0x27, %r14
	.word 0xf8db8400  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_NONHPRIV
	.word 0xf2346165  ! 2699: STH_I	sth	%r25, [%r17 + 0x0165]
	.word 0xf6b4a0b0  ! 2703: STHA_I	stha	%r27, [%r18 + 0x00b0] %asi
	.word 0xbd353001  ! 2706: SRLX_I	srlx	%r20, 0x0001, %r30
	.word 0xf4258000  ! 2709: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xf0250000  ! 2710: STW_R	stw	%r24, [%r20 + %r0]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 36)
	.word 0xf825a126  ! 2713: STW_I	stw	%r28, [%r22 + 0x0126]
cpu_intr_3_196:
	setx	0x310038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75c000  ! 2717: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xb6b42054  ! 2718: ORNcc_I	orncc 	%r16, 0x0054, %r27
	.word 0xf4a4a01e  ! 2719: STWA_I	stwa	%r26, [%r18 + 0x001e] %asi
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 9)
	.word 0xba444000  ! 2721: ADDC_R	addc 	%r17, %r0, %r29
	.word 0xf8344000  ! 2723: STH_R	sth	%r28, [%r17 + %r0]
cpu_intr_3_197:
	setx	0x32011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_198:
	setx	0x300123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_199:
	setx	0x320317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6acc020  ! 2727: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xfc2d0000  ! 2733: STB_R	stb	%r30, [%r20 + %r0]
cpu_intr_3_200:
	setx	0x31012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_99:
	mov	0x27, %r14
	.word 0xf6f384a0  ! 2739: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfa2d21fb  ! 2740: STB_I	stb	%r29, [%r20 + 0x01fb]
cpu_intr_3_201:
	setx	0x310308, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf0356177  ! 2746: STH_I	sth	%r24, [%r21 + 0x0177]
	.word 0xf8acc020  ! 2751: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xb0c50000  ! 2752: ADDCcc_R	addccc 	%r20, %r0, %r24
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, a)
	.word 0xf0342080  ! 2758: STH_I	sth	%r24, [%r16 + 0x0080]
T3_asi_reg_wr_100:
	mov	0x31, %r14
	.word 0xf8f38e80  ! 2759: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb205a0a4  ! 2760: ADD_I	add 	%r22, 0x00a4, %r25
	.word 0xfa35c000  ! 2761: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_130:
	mov	0x37, %r14
	.word 0xfadb8400  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_202:
	setx	0x30023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_131:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfcb5c020  ! 2773: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf0258000  ! 2775: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xbe45c000  ! 2776: ADDC_R	addc 	%r23, %r0, %r31
	.word 0xfeada17a  ! 2777: STBA_I	stba	%r31, [%r22 + 0x017a] %asi
cpu_intr_3_203:
	setx	0x35012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_101:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 2780: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2a44020  ! 2785: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
cpu_intr_3_204:
	setx	0x340111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91952165  ! 2791: WRPR_PIL_I	wrpr	%r20, 0x0165, %pil
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 5)
	.word 0x8d95a034  ! 2802: WRPR_PSTATE_I	wrpr	%r22, 0x0034, %pstate
cpu_intr_3_205:
	setx	0x370339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4e173  ! 2806: STWA_I	stwa	%r29, [%r19 + 0x0173] %asi
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfcb4a1f1  ! 2808: STHA_I	stha	%r30, [%r18 + 0x01f1] %asi
	.word 0xf6a4e1db  ! 2810: STWA_I	stwa	%r27, [%r19 + 0x01db] %asi
	.word 0xfc350000  ! 2811: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf8f5a13b  ! 2815: STXA_I	stxa	%r28, [%r22 + 0x013b] %asi
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b18  ! 2819: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b18, %hpstate
	.word 0xfe748000  ! 2821: STX_R	stx	%r31, [%r18 + %r0]
T3_asi_reg_rd_132:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_133:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_206:
	setx	0x35013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad8020  ! 2835: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xfe350000  ! 2836: STH_R	sth	%r31, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d48  ! 2839: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d48, %hpstate
	.word 0xf0f461fd  ! 2843: STXA_I	stxa	%r24, [%r17 + 0x01fd] %asi
	.word 0xf0a40020  ! 2846: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 26)
	.word 0xfa2d2094  ! 2854: STB_I	stb	%r29, [%r20 + 0x0094]
	.word 0xbe24e107  ! 2855: SUB_I	sub 	%r19, 0x0107, %r31
	.word 0xf8ada124  ! 2856: STBA_I	stba	%r28, [%r22 + 0x0124] %asi
	.word 0xfe258000  ! 2857: STW_R	stw	%r31, [%r22 + %r0]
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f02  ! 2858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f02, %hpstate
	.word 0xfc74c000  ! 2860: STX_R	stx	%r30, [%r19 + %r0]
cpu_intr_3_207:
	setx	0x34032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_208:
	setx	0x36013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f4a  ! 2867: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
	.word 0xf275c000  ! 2868: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf074e146  ! 2872: STX_I	stx	%r24, [%r19 + 0x0146]
cpu_intr_3_209:
	setx	0x36033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf82ce1de  ! 2878: STB_I	stb	%r28, [%r19 + 0x01de]
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 37)
	.word 0xfe24a184  ! 2883: STW_I	stw	%r31, [%r18 + 0x0184]
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_210:
	setx	0x36031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_102:
	mov	0x35, %r14
	.word 0xfaf38e40  ! 2889: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, b)
	.word 0xfcb44020  ! 2892: STHA_R	stha	%r30, [%r17 + %r0] 0x01
	.word 0xfa354000  ! 2895: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf2b4e0f7  ! 2896: STHA_I	stha	%r25, [%r19 + 0x00f7] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_211:
	setx	0x34023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72df001  ! 2908: SLLX_I	sllx	%r23, 0x0001, %r27
T3_asi_reg_rd_134:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 2909: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 29)
	.word 0xfaa4c020  ! 2911: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb4bda1e4  ! 2913: XNORcc_I	xnorcc 	%r22, 0x01e4, %r26
	.word 0xf2244000  ! 2916: STW_R	stw	%r25, [%r17 + %r0]
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_212:
	setx	0x350218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b4c000  ! 2919: ORNcc_R	orncc 	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8f42127  ! 2924: STXA_I	stxa	%r28, [%r16 + 0x0127] %asi
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982808  ! 2926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0808, %hpstate
	.word 0xfe7461a7  ! 2927: STX_I	stx	%r31, [%r17 + 0x01a7]
cpu_intr_3_213:
	setx	0x350301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_214:
	setx	0x350323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4254000  ! 2931: SUB_R	sub 	%r21, %r0, %r26
	.word 0xf42ca0be  ! 2932: STB_I	stb	%r26, [%r18 + 0x00be]
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_215:
	setx	0x340205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfaf42010  ! 2938: STXA_I	stxa	%r29, [%r16 + 0x0010] %asi
	.word 0xbc140000  ! 2939: OR_R	or 	%r16, %r0, %r30
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf22ce10b  ! 2944: STB_I	stb	%r25, [%r19 + 0x010b]
T3_asi_reg_rd_135:
	mov	0x2a, %r14
	.word 0xfedb89e0  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_136:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_103:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 2948: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_104:
	mov	0x27, %r14
	.word 0xfaf38e40  ! 2951: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_105:
	mov	0x1b, %r14
	.word 0xf6f38e80  ! 2953: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0244000  ! 2956: STW_R	stw	%r24, [%r17 + %r0]
T3_asi_reg_wr_106:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2957: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_216:
	setx	0x37023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_217:
	setx	0x34000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 2962: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf6ade07a  ! 2963: STBA_I	stba	%r27, [%r23 + 0x007a] %asi
cpu_intr_3_218:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2758000  ! 2965: STX_R	stx	%r25, [%r22 + %r0]
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb845a11d  ! 2971: ADDC_I	addc 	%r22, 0x011d, %r28
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_219:
	setx	0x34033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_220:
	setx	0x370022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_221:
	setx	0x37020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_222:
	setx	0x36001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 3)
	.word 0xb1540000  ! 2986: RDPR_GL	rdpr	%-, %r24
	.word 0xfc74e118  ! 2987: STX_I	stx	%r30, [%r19 + 0x0118]
	ta	T_CHANGE_NONHPRIV
	.word 0xf2f560ac  ! 2989: STXA_I	stxa	%r25, [%r21 + 0x00ac] %asi
cpu_intr_3_223:
	setx	0x350105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a58000  ! 2993: SUBcc_R	subcc 	%r22, %r0, %r25
cpu_intr_3_224:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_107:
	mov	0x17, %r14
	.word 0xfcf38e80  ! 2995: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfe34e16d  ! 2997: STH_I	sth	%r31, [%r19 + 0x016d]
T3_asi_reg_wr_108:
	mov	0x1c, %r14
	.word 0xf2f38e40  ! 3000: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2b40020  ! 3002: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xf83461c9  ! 3004: STH_I	sth	%r28, [%r17 + 0x01c9]
T3_asi_reg_rd_138:
	mov	0x8, %r14
	.word 0xfcdb8e60  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfaa5a064  ! 3012: STWA_I	stwa	%r29, [%r22 + 0x0064] %asi
T3_asi_reg_rd_139:
	mov	0x35, %r14
	.word 0xfedb8e60  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf6f4e19a  ! 3015: STXA_I	stxa	%r27, [%r19 + 0x019a] %asi
cpu_intr_3_225:
	setx	0x35030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb845a18c  ! 3019: ADDC_I	addc 	%r22, 0x018c, %r28
	.word 0xb4b5c000  ! 3021: ORNcc_R	orncc 	%r23, %r0, %r26
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 12)
	.word 0xf435c000  ! 3024: STH_R	sth	%r26, [%r23 + %r0]
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfe75e110  ! 3033: STX_I	stx	%r31, [%r23 + 0x0110]
	.word 0xb43420e7  ! 3034: SUBC_I	orn 	%r16, 0x00e7, %r26
	.word 0xf62421e4  ! 3035: STW_I	stw	%r27, [%r16 + 0x01e4]
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 1d)
	.word 0xbd2c3001  ! 3042: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xfef42010  ! 3043: STXA_I	stxa	%r31, [%r16 + 0x0010] %asi
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf4240000  ! 3048: STW_R	stw	%r26, [%r16 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf8b4a135  ! 3052: STHA_I	stha	%r28, [%r18 + 0x0135] %asi
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 16)
	.word 0xfcac6032  ! 3061: STBA_I	stba	%r30, [%r17 + 0x0032] %asi
	.word 0xf0b4a13d  ! 3062: STHA_I	stha	%r24, [%r18 + 0x013d] %asi
T3_asi_reg_rd_140:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 3067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_109:
	mov	0x3, %r14
	.word 0xfef38e40  ! 3068: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfeacc020  ! 3069: STBA_R	stba	%r31, [%r19 + %r0] 0x01
	.word 0xfc2c4000  ! 3070: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf424c000  ! 3072: STW_R	stw	%r26, [%r19 + %r0]
cpu_intr_3_226:
	setx	0x340336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6240000  ! 3078: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf035a0dc  ! 3080: STH_I	sth	%r24, [%r22 + 0x00dc]
	.word 0xfc75c000  ! 3081: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xf0acc020  ! 3084: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xf0f4a1dc  ! 3087: STXA_I	stxa	%r24, [%r18 + 0x01dc] %asi
	.word 0xf0b50020  ! 3094: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xfa2dc000  ! 3095: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfe2d0000  ! 3097: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfaf4a0b6  ! 3102: STXA_I	stxa	%r29, [%r18 + 0x00b6] %asi
T3_asi_reg_rd_141:
	mov	0x8, %r14
	.word 0xfcdb8e60  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_227:
	setx	0x34022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe2c2063  ! 3116: ANDN_I	andn 	%r16, 0x0063, %r31
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 12)
	.word 0xf6b56080  ! 3118: STHA_I	stha	%r27, [%r21 + 0x0080] %asi
T3_asi_reg_wr_110:
	mov	0xf, %r14
	.word 0xf0f384a0  ! 3121: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf0ad0020  ! 3122: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xbea520ea  ! 3124: SUBcc_I	subcc 	%r20, 0x00ea, %r31
cpu_intr_3_228:
	setx	0x340013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_229:
	setx	0x350328, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_142:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_230:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_143:
	mov	0x35, %r14
	.word 0xfedb8400  ! 3133: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf22d0000  ! 3136: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf434215c  ! 3139: STH_I	sth	%r26, [%r16 + 0x015c]
cpu_intr_3_231:
	setx	0x340001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c6190  ! 3141: ANDcc_I	andcc 	%r17, 0x0190, %r28
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfcb5a18e  ! 3146: STHA_I	stha	%r30, [%r22 + 0x018e] %asi
cpu_intr_3_232:
	setx	0x34020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a5e143  ! 3150: STWA_I	stwa	%r26, [%r23 + 0x0143] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_111:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 3159: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6ac60e9  ! 3160: STBA_I	stba	%r27, [%r17 + 0x00e9] %asi
cpu_intr_3_233:
	setx	0x340015, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b52  ! 3162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b52, %hpstate
cpu_intr_3_234:
	setx	0x35000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4e083  ! 3166: STWA_I	stwa	%r25, [%r19 + 0x0083] %asi
	.word 0xf8f4a045  ! 3167: STXA_I	stxa	%r28, [%r18 + 0x0045] %asi
	.word 0xf02d2147  ! 3168: STB_I	stb	%r24, [%r20 + 0x0147]
	.word 0xb72dc000  ! 3170: SLL_R	sll 	%r23, %r0, %r27
	.word 0xf0b4611e  ! 3173: STHA_I	stha	%r24, [%r17 + 0x011e] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfcad603b  ! 3175: STBA_I	stba	%r30, [%r21 + 0x003b] %asi
T3_asi_reg_wr_112:
	mov	0x23, %r14
	.word 0xfef384a0  ! 3176: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_235:
	setx	0x360327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_236:
	setx	0x360208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02560c5  ! 3185: STW_I	stw	%r24, [%r21 + 0x00c5]
	.word 0xb12d4000  ! 3188: SLL_R	sll 	%r21, %r0, %r24
	.word 0xf825c000  ! 3192: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xb884a039  ! 3194: ADDcc_I	addcc 	%r18, 0x0039, %r28
	.word 0xf434a088  ! 3197: STH_I	sth	%r26, [%r18 + 0x0088]
	.word 0xbcbdc000  ! 3199: XNORcc_R	xnorcc 	%r23, %r0, %r30
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982bd0  ! 3200: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd0, %hpstate
	.word 0xb8b4a039  ! 3201: SUBCcc_I	orncc 	%r18, 0x0039, %r28
	.word 0xb93df001  ! 3202: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xf625e043  ! 3204: STW_I	stw	%r27, [%r23 + 0x0043]
	.word 0xfef4a049  ! 3205: STXA_I	stxa	%r31, [%r18 + 0x0049] %asi
	.word 0xfa2da14b  ! 3206: STB_I	stb	%r29, [%r22 + 0x014b]
	.word 0xf8ace0e0  ! 3207: STBA_I	stba	%r28, [%r19 + 0x00e0] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_113:
	mov	0x2f, %r14
	.word 0xfef389e0  ! 3209: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_237:
	setx	0x360209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825e0d7  ! 3212: STW_I	stw	%r28, [%r23 + 0x00d7]
	.word 0xbab4607b  ! 3216: SUBCcc_I	orncc 	%r17, 0x007b, %r29
	.word 0xf6b58020  ! 3220: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xbe1ca106  ! 3221: XOR_I	xor 	%r18, 0x0106, %r31
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf8a46047  ! 3224: STWA_I	stwa	%r28, [%r17 + 0x0047] %asi
cpu_intr_3_238:
	setx	0x35013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235c000  ! 3228: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xfead0020  ! 3229: STBA_R	stba	%r31, [%r20 + %r0] 0x01
cpu_intr_3_239:
	setx	0x36023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8348000  ! 3231: STH_R	sth	%r28, [%r18 + %r0]
T3_asi_reg_wr_114:
	mov	0x15, %r14
	.word 0xf4f38e80  ! 3233: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf8a4e179  ! 3234: STWA_I	stwa	%r28, [%r19 + 0x0179] %asi
cpu_intr_3_240:
	setx	0x340337, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_115:
	mov	0x20, %r14
	.word 0xf0f38e60  ! 3242: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf62c204e  ! 3243: STB_I	stb	%r27, [%r16 + 0x004e]
cpu_intr_3_241:
	setx	0x380121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_242:
	setx	0x3a0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_116:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 3248: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf424603c  ! 3249: STW_I	stw	%r26, [%r17 + 0x003c]
cpu_intr_3_243:
	setx	0x3b023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_244:
	setx	0x3a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3ce03d  ! 3252: XNOR_I	xnor 	%r19, 0x003d, %r30
	.word 0xbe0420b8  ! 3255: ADD_I	add 	%r16, 0x00b8, %r31
	.word 0xf4b48020  ! 3256: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xb32c8000  ! 3258: SLL_R	sll 	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_3_245:
	setx	0x3a023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_144:
	mov	0x26, %r14
	.word 0xf8db8e60  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf22cc000  ! 3271: STB_R	stb	%r25, [%r19 + %r0]
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 12)
	.word 0xf835a1a4  ! 3274: STH_I	sth	%r28, [%r22 + 0x01a4]
cpu_intr_3_246:
	setx	0x380336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 3278: STH_R	sth	%r29, [%r16 + %r0]
cpu_intr_3_247:
	setx	0x390122, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_117:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3286: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_145:
	mov	0x1b, %r14
	.word 0xfedb89e0  ! 3288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfe2d0000  ! 3292: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf6ad4020  ! 3295: STBA_R	stba	%r27, [%r21 + %r0] 0x01
cpu_intr_3_248:
	setx	0x38000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_249:
	setx	0x39001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_250:
	setx	0x3b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_146:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 3305: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfeac61c8  ! 3309: STBA_I	stba	%r31, [%r17 + 0x01c8] %asi
	.word 0xfeac0020  ! 3314: STBA_R	stba	%r31, [%r16 + %r0] 0x01
T3_asi_reg_wr_118:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 3315: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf4a5e07b  ! 3318: STWA_I	stwa	%r26, [%r23 + 0x007b] %asi
	.word 0xf4aca161  ! 3319: STBA_I	stba	%r26, [%r18 + 0x0161] %asi
	.word 0xbb508000  ! 3321: RDPR_TSTATE	rdpr	%tstate, %r29
T3_asi_reg_rd_147:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 3323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_119:
	mov	0x1c, %r14
	.word 0xf0f384a0  ! 3325: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_120:
	mov	0x1c, %r14
	.word 0xf0f38e60  ! 3327: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_148:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbf3df001  ! 3330: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0xfe358000  ! 3332: STH_R	sth	%r31, [%r22 + %r0]
cpu_intr_3_251:
	setx	0x3a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_149:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8a5c020  ! 3338: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_252:
	setx	0x3a0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, e)
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_253:
	setx	0x380136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b58000  ! 3350: ORNcc_R	orncc 	%r22, %r0, %r27
T3_asi_reg_rd_150:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf42c20cd  ! 3356: STB_I	stb	%r26, [%r16 + 0x00cd]
T3_asi_reg_rd_151:
	mov	0x2e, %r14
	.word 0xf0db8e60  ! 3357: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf2f5a11f  ! 3359: STXA_I	stxa	%r25, [%r22 + 0x011f] %asi
	.word 0xfeac0020  ! 3360: STBA_R	stba	%r31, [%r16 + %r0] 0x01
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_254:
	setx	0x380307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_152:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf62de16a  ! 3366: STB_I	stb	%r27, [%r23 + 0x016a]
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982cda  ! 3367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cda, %hpstate
T3_asi_reg_wr_121:
	mov	0x3, %r14
	.word 0xf0f38400  ! 3370: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfe2cc000  ! 3371: STB_R	stb	%r31, [%r19 + %r0]
T3_asi_reg_wr_122:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 3373: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf474c000  ! 3374: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfc740000  ! 3377: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf8ada002  ! 3378: STBA_I	stba	%r28, [%r22 + 0x0002] %asi
T3_asi_reg_rd_153:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf2258000  ! 3381: STW_R	stw	%r25, [%r22 + %r0]
cpu_intr_3_255:
	setx	0x380006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_256:
	setx	0x380225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_154:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbc14a12b  ! 3397: OR_I	or 	%r18, 0x012b, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xbc840000  ! 3401: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xfe340000  ! 3406: STH_R	sth	%r31, [%r16 + %r0]
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 15)
	.word 0xf834e175  ! 3408: STH_I	sth	%r28, [%r19 + 0x0175]
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, b)
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 34)
	.word 0xf8f5e088  ! 3413: STXA_I	stxa	%r28, [%r23 + 0x0088] %asi
	.word 0xb0344000  ! 3417: ORN_R	orn 	%r17, %r0, %r24
	.word 0xfc2ca18c  ! 3418: STB_I	stb	%r30, [%r18 + 0x018c]
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_HPRIV
	.word 0xfe348000  ! 3421: STH_R	sth	%r31, [%r18 + %r0]
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 1d)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819828c0  ! 3424: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
cpu_intr_3_257:
	setx	0x3b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad0020  ! 3429: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_258:
	setx	0x380038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_259:
	setx	0x3a0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c90  ! 3438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c90, %hpstate
T3_asi_reg_rd_155:
	mov	0x2c, %r14
	.word 0xf8db84a0  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_123:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 3448: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb414a1bb  ! 3449: OR_I	or 	%r18, 0x01bb, %r26
T3_asi_reg_rd_156:
	mov	0x11, %r14
	.word 0xfadb89e0  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb29420cf  ! 3456: ORcc_I	orcc 	%r16, 0x00cf, %r25
	.word 0xb53d5000  ! 3457: SRAX_R	srax	%r21, %r0, %r26
	.word 0xf4f521e3  ! 3460: STXA_I	stxa	%r26, [%r20 + 0x01e3] %asi
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 24)
	.word 0xfaa46146  ! 3463: STWA_I	stwa	%r29, [%r17 + 0x0146] %asi
	.word 0xf22561bf  ! 3466: STW_I	stw	%r25, [%r21 + 0x01bf]
cpu_intr_3_260:
	setx	0x3a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac8020  ! 3469: STBA_R	stba	%r28, [%r18 + %r0] 0x01
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_261:
	setx	0x380322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3461b9  ! 3476: STH_I	sth	%r30, [%r17 + 0x01b9]
	.word 0xbc3c8000  ! 3477: XNOR_R	xnor 	%r18, %r0, %r30
	.word 0xfab421f4  ! 3478: STHA_I	stha	%r29, [%r16 + 0x01f4] %asi
	.word 0xfc248000  ! 3479: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xbc8c604f  ! 3480: ANDcc_I	andcc 	%r17, 0x004f, %r30
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_157:
	mov	0x2c, %r14
	.word 0xf8db8e60  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_158:
	mov	0x20, %r14
	.word 0xfcdb8e60  ! 3493: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6ad4020  ! 3495: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	.word 0xf4b50020  ! 3500: STHA_R	stha	%r26, [%r20 + %r0] 0x01
T3_asi_reg_wr_124:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 3501: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_159:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 3503: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_262:
	setx	0x3a010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa348000  ! 3514: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfa74c000  ! 3515: STX_R	stx	%r29, [%r19 + %r0]
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982eca  ! 3516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983942  ! 3521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1942, %hpstate
	.word 0xf6758000  ! 3525: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf8f4e186  ! 3526: STXA_I	stxa	%r28, [%r19 + 0x0186] %asi
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_160:
	mov	0x2b, %r14
	.word 0xfedb8400  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb61dc000  ! 3532: XOR_R	xor 	%r23, %r0, %r27
	.word 0xf8b561e0  ! 3533: STHA_I	stha	%r28, [%r21 + 0x01e0] %asi
T3_asi_reg_wr_125:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 3535: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_3_263:
	setx	0x3b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 3539: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_rd_161:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 3541: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_3_264:
	setx	0x3a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabd8000  ! 3546: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xf22d8000  ! 3547: STB_R	stb	%r25, [%r22 + %r0]
T3_asi_reg_rd_162:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 3553: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb42c204a  ! 3555: ANDN_I	andn 	%r16, 0x004a, %r26
T3_asi_reg_wr_126:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 3556: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_127:
	mov	0x2c, %r14
	.word 0xf0f38e80  ! 3557: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf074a16e  ! 3559: STX_I	stx	%r24, [%r18 + 0x016e]
cpu_intr_3_265:
	setx	0x3b021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_266:
	setx	0x3a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24c000  ! 3564: STW_R	stw	%r31, [%r19 + %r0]
cpu_intr_3_267:
	setx	0x3b0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf4ad6129  ! 3571: STBA_I	stba	%r26, [%r21 + 0x0129] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa74e0fa  ! 3574: STX_I	stx	%r29, [%r19 + 0x00fa]
	.word 0xf2a5210c  ! 3576: STWA_I	stwa	%r25, [%r20 + 0x010c] %asi
T3_asi_reg_rd_163:
	mov	0x1e, %r14
	.word 0xfadb89e0  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_268:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_164:
	mov	0x1f, %r14
	.word 0xfadb89e0  ! 3581: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf8b4e12d  ! 3583: STHA_I	stha	%r28, [%r19 + 0x012d] %asi
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfe742156  ! 3588: STX_I	stx	%r31, [%r16 + 0x0156]
	.word 0xfc74c000  ! 3589: STX_R	stx	%r30, [%r19 + %r0]
cpu_intr_3_269:
	setx	0x39021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75c000  ! 3596: STX_R	stx	%r30, [%r23 + %r0]
T3_asi_reg_wr_128:
	mov	0xc, %r14
	.word 0xf4f38400  ! 3597: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_129:
	mov	0x2b, %r14
	.word 0xfaf38e60  ! 3598: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf4b40020  ! 3599: STHA_R	stha	%r26, [%r16 + %r0] 0x01
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 1)
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ac2  ! 3601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac2, %hpstate
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_130:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 3604: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_131:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 3608: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, c)
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 22)
	.word 0xb2b560bb  ! 3614: ORNcc_I	orncc 	%r21, 0x00bb, %r25
T3_asi_reg_wr_132:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 3615: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 19)
	.word 0xf62dc000  ! 3618: STB_R	stb	%r27, [%r23 + %r0]
T3_asi_reg_rd_165:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_rd_166:
	mov	0x32, %r14
	.word 0xf8db89e0  ! 3624: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf0b52148  ! 3627: STHA_I	stha	%r24, [%r20 + 0x0148] %asi
	.word 0xf4a5a171  ! 3633: STWA_I	stwa	%r26, [%r22 + 0x0171] %asi
T3_asi_reg_rd_167:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 3637: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_168:
	mov	0x30, %r14
	.word 0xf0db89e0  ! 3640: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfa744000  ! 3641: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xf824a0d8  ! 3644: STW_I	stw	%r28, [%r18 + 0x00d8]
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_270:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5c020  ! 3654: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
cpu_intr_3_271:
	setx	0x3a011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac8020  ! 3661: STBA_R	stba	%r29, [%r18 + %r0] 0x01
cpu_intr_3_272:
	setx	0x380007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_133:
	mov	0x2, %r14
	.word 0xfaf38400  ! 3665: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfaf5a161  ! 3669: STXA_I	stxa	%r29, [%r22 + 0x0161] %asi
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_273:
	setx	0x3b0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_274:
	setx	0x390011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ace100  ! 3679: STBA_I	stba	%r25, [%r19 + 0x0100] %asi
	.word 0xf6ace142  ! 3680: STBA_I	stba	%r27, [%r19 + 0x0142] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 37)
	.word 0xf8b58020  ! 3690: STHA_R	stha	%r28, [%r22 + %r0] 0x01
T3_asi_reg_rd_169:
	mov	0x29, %r14
	.word 0xf2db8e40  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 28)
	.word 0xf22c0000  ! 3698: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfa358000  ! 3700: STH_R	sth	%r29, [%r22 + %r0]
cpu_intr_3_275:
	setx	0x390225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_170:
	mov	0xf, %r14
	.word 0xf4db8e80  ! 3703: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_134:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 3705: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0b5a0df  ! 3709: STHA_I	stha	%r24, [%r22 + 0x00df] %asi
	.word 0xf4b5e18a  ! 3711: STHA_I	stha	%r26, [%r23 + 0x018a] %asi
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c98  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c98, %hpstate
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 20)
	.word 0xfca52057  ! 3716: STWA_I	stwa	%r30, [%r20 + 0x0057] %asi
	.word 0xf4a40020  ! 3717: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_276:
	setx	0x3d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d5a  ! 3721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5a, %hpstate
cpu_intr_3_277:
	setx	0x3f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 21)
	.word 0xf82de0fb  ! 3725: STB_I	stb	%r28, [%r23 + 0x00fb]
T3_asi_reg_rd_171:
	mov	0x1c, %r14
	.word 0xfedb8400  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_172:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf0254000  ! 3732: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xb4240000  ! 3733: SUB_R	sub 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6ac4000  ! 3736: ANDNcc_R	andncc 	%r17, %r0, %r27
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e80  ! 3737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
	.word 0xb20d8000  ! 3739: AND_R	and 	%r22, %r0, %r25
cpu_intr_3_278:
	setx	0x3e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4f520a1  ! 3743: STXA_I	stxa	%r26, [%r20 + 0x00a1] %asi
	.word 0xb8244000  ! 3747: SUB_R	sub 	%r17, %r0, %r28
	.word 0xb215a142  ! 3748: OR_I	or 	%r22, 0x0142, %r25
	.word 0xf6240000  ! 3749: STW_R	stw	%r27, [%r16 + %r0]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_279:
	setx	0x3d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_280:
	setx	0x3e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4e177  ! 3753: STWA_I	stwa	%r29, [%r19 + 0x0177] %asi
	.word 0xfa358000  ! 3755: STH_R	sth	%r29, [%r22 + %r0]
cpu_intr_3_281:
	setx	0x3f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a56076  ! 3757: STWA_I	stwa	%r24, [%r21 + 0x0076] %asi
	.word 0xf2b4c020  ! 3760: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xb2b421f5  ! 3765: ORNcc_I	orncc 	%r16, 0x01f5, %r25
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 27)
	.word 0xf8b4e139  ! 3771: STHA_I	stha	%r28, [%r19 + 0x0139] %asi
	.word 0xf4b4a1df  ! 3772: STHA_I	stha	%r26, [%r18 + 0x01df] %asi
	.word 0xf6f421f2  ! 3774: STXA_I	stxa	%r27, [%r16 + 0x01f2] %asi
	.word 0xf234c000  ! 3775: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf03420d0  ! 3778: STH_I	sth	%r24, [%r16 + 0x00d0]
	.word 0xb4150000  ! 3780: OR_R	or 	%r20, %r0, %r26
	.word 0xfa352183  ! 3781: STH_I	sth	%r29, [%r20 + 0x0183]
	.word 0xfcadc020  ! 3784: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xb80d4000  ! 3785: AND_R	and 	%r21, %r0, %r28
T3_asi_reg_rd_173:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfa34e086  ! 3792: STH_I	sth	%r29, [%r19 + 0x0086]
cpu_intr_3_282:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_135:
	mov	0x0, %r14
	.word 0xf0f389e0  ! 3803: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_283:
	setx	0x3f032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf4a58020  ! 3816: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
T3_asi_reg_wr_136:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 3818: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe748000  ! 3819: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xb0a4610b  ! 3822: SUBcc_I	subcc 	%r17, 0x010b, %r24
T3_asi_reg_wr_137:
	mov	0x15, %r14
	.word 0xf2f38e60  ! 3824: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_138:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 3832: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_284:
	setx	0x3e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4e1d8  ! 3838: STWA_I	stwa	%r30, [%r19 + 0x01d8] %asi
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_285:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624e050  ! 3844: STW_I	stw	%r27, [%r19 + 0x0050]
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 10)
	.word 0xfcad4020  ! 3852: STBA_R	stba	%r30, [%r21 + %r0] 0x01
	.word 0xf6a42075  ! 3853: STWA_I	stwa	%r27, [%r16 + 0x0075] %asi
	.word 0xfc74e142  ! 3856: STX_I	stx	%r30, [%r19 + 0x0142]
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_174:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf4752112  ! 3865: STX_I	stx	%r26, [%r20 + 0x0112]
	.word 0xbeb50000  ! 3871: SUBCcc_R	orncc 	%r20, %r0, %r31
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 20)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_286:
	setx	0x3f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_175:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf0258000  ! 3897: STW_R	stw	%r24, [%r22 + %r0]
cpu_intr_3_287:
	setx	0x3d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b9a  ! 3903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9a, %hpstate
	.word 0xfaac209b  ! 3906: STBA_I	stba	%r29, [%r16 + 0x009b] %asi
	.word 0xf6b50020  ! 3907: STHA_R	stha	%r27, [%r20 + %r0] 0x01
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_288:
	setx	0x3e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2adc020  ! 3910: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xfeb5613b  ! 3913: STHA_I	stha	%r31, [%r21 + 0x013b] %asi
T3_asi_reg_rd_176:
	mov	0x23, %r14
	.word 0xf6db89e0  ! 3920: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 24)
	.word 0xf2348000  ! 3924: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xf8adc020  ! 3925: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_289:
	setx	0x3f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0x17, %r14
	.word 0xf6db84a0  ! 3927: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_290:
	setx	0x3c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca48020  ! 3934: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfaac4020  ! 3937: STBA_R	stba	%r29, [%r17 + %r0] 0x01
cpu_intr_3_291:
	setx	0x3e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa242093  ! 3941: STW_I	stw	%r29, [%r16 + 0x0093]
	.word 0xfeb5c020  ! 3944: STHA_R	stha	%r31, [%r23 + %r0] 0x01
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_292:
	setx	0x3c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_293:
	setx	0x3f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_294:
	setx	0x3d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_295:
	setx	0x3f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b40020  ! 3960: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xb4152020  ! 3967: OR_I	or 	%r20, 0x0020, %r26
	.word 0xfca5c020  ! 3969: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
T3_asi_reg_rd_178:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xba3461c8  ! 3974: ORN_I	orn 	%r17, 0x01c8, %r29
cpu_intr_3_296:
	setx	0x3e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_139:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 3981: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_297:
	setx	0x3c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d8000  ! 3990: STB_R	stb	%r28, [%r22 + %r0]
cpu_intr_3_298:
	setx	0x3c0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_299:
	setx	0x3f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2d8000  ! 4002: STB_R	stb	%r30, [%r22 + %r0]
cpu_intr_3_300:
	setx	0x3e022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4adc020  ! 4007: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	.word 0xb08521ca  ! 4008: ADDcc_I	addcc 	%r20, 0x01ca, %r24
	.word 0xf6b46095  ! 4009: STHA_I	stha	%r27, [%r17 + 0x0095] %asi
	.word 0xfa2d2171  ! 4011: STB_I	stb	%r29, [%r20 + 0x0171]
	.word 0xf62cc000  ! 4012: STB_R	stb	%r27, [%r19 + %r0]
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, a)
	.word 0xf0ac8020  ! 4019: STBA_R	stba	%r24, [%r18 + %r0] 0x01
cpu_intr_3_301:
	setx	0x3e0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e115  ! 4021: STX_I	stx	%r30, [%r23 + 0x0115]
T3_asi_reg_rd_179:
	mov	0x9, %r14
	.word 0xf0db8e80  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbf2d0000  ! 4025: SLL_R	sll 	%r20, %r0, %r31
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_302:
	setx	0x3f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead60c5  ! 4029: STBA_I	stba	%r31, [%r21 + 0x00c5] %asi
cpu_intr_3_303:
	setx	0x3d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_304:
	setx	0x3e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4242108  ! 4049: STW_I	stw	%r26, [%r16 + 0x0108]
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfe25a0d0  ! 4057: STW_I	stw	%r31, [%r22 + 0x00d0]
	.word 0xf8258000  ! 4059: STW_R	stw	%r28, [%r22 + %r0]
T3_asi_reg_wr_140:
	mov	0x15, %r14
	.word 0xfaf38400  ! 4060: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfcac8020  ! 4062: STBA_R	stba	%r30, [%r18 + %r0] 0x01
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_wr_141:
	mov	0x0, %r14
	.word 0xf0f38e80  ! 4065: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_305:
	setx	0x3d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_306:
	setx	0x3d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfa2c2181  ! 4075: STB_I	stb	%r29, [%r16 + 0x0181]
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 0)
	.word 0xf0ac4020  ! 4078: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xbd350000  ! 4079: SRL_R	srl 	%r20, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_307:
	setx	0x3e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 3)
	.word 0xf0ac219a  ! 4086: STBA_I	stba	%r24, [%r16 + 0x019a] %asi
T3_asi_reg_rd_180:
	mov	0x35, %r14
	.word 0xf4db89e0  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_142:
	mov	0x20, %r14
	.word 0xfef38e80  ! 4093: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_308:
	setx	0x3c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_181:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_309:
	setx	0x3d012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf8350000  ! 4099: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf225e0ba  ! 4101: STW_I	stw	%r25, [%r23 + 0x00ba]
	ta	T_CHANGE_HPRIV
	.word 0xf0a5a152  ! 4104: STWA_I	stwa	%r24, [%r22 + 0x0152] %asi
	.word 0xb605c000  ! 4106: ADD_R	add 	%r23, %r0, %r27
T3_asi_reg_wr_143:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 4107: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf224c000  ! 4113: STW_R	stw	%r25, [%r19 + %r0]
T3_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 4114: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2b561bc  ! 4115: STHA_I	stha	%r25, [%r21 + 0x01bc] %asi
	.word 0xb20de166  ! 4120: AND_I	and 	%r23, 0x0166, %r25
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 28)
	.word 0xf02c6088  ! 4124: STB_I	stb	%r24, [%r17 + 0x0088]
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b90  ! 4130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b90, %hpstate
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_145:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 4133: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfcb54020  ! 4135: STHA_R	stha	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_182:
	mov	0x27, %r14
	.word 0xfcdb89e0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb61cc000  ! 4144: XOR_R	xor 	%r19, %r0, %r27
cpu_intr_3_310:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_146:
	mov	0x1, %r14
	.word 0xf4f384a0  ! 4148: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfcad0020  ! 4149: STBA_R	stba	%r30, [%r20 + %r0] 0x01
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_183:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e52  ! 4157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
	.word 0xb73da001  ! 4159: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xf4acc020  ! 4163: STBA_R	stba	%r26, [%r19 + %r0] 0x01
T3_asi_reg_wr_147:
	mov	0x1e, %r14
	.word 0xf6f384a0  ! 4164: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_184:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe2c617d  ! 4169: STB_I	stb	%r31, [%r17 + 0x017d]
	.word 0xfea5a051  ! 4171: STWA_I	stwa	%r31, [%r22 + 0x0051] %asi
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, e)
	.word 0xfcb4e0b0  ! 4175: STHA_I	stha	%r30, [%r19 + 0x00b0] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xfe754000  ! 4188: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xf635614d  ! 4189: STH_I	sth	%r27, [%r21 + 0x014d]
T3_asi_reg_wr_148:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 4193: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 29)
	.word 0xb1348000  ! 4197: SRL_R	srl 	%r18, %r0, %r24
	.word 0xf235e1bd  ! 4198: STH_I	sth	%r25, [%r23 + 0x01bd]
	.word 0xba85c000  ! 4201: ADDcc_R	addcc 	%r23, %r0, %r29
	.word 0xfef52094  ! 4202: STXA_I	stxa	%r31, [%r20 + 0x0094] %asi
cpu_intr_3_311:
	setx	0x410004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_312:
	setx	0x400203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d4000  ! 4208: SLL_R	sll 	%r21, %r0, %r25
	.word 0xfa2c0000  ! 4209: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfe740000  ! 4217: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xfef4e03f  ! 4218: STXA_I	stxa	%r31, [%r19 + 0x003f] %asi
cpu_intr_3_313:
	setx	0x430318, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_149:
	mov	0x34, %r14
	.word 0xfef38e60  ! 4221: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfc74615c  ! 4224: STX_I	stx	%r30, [%r17 + 0x015c]
	.word 0xb93d4000  ! 4225: SRA_R	sra 	%r21, %r0, %r28
T3_asi_reg_rd_185:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_150:
	mov	0x30, %r14
	.word 0xfef38e60  ! 4241: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 34)
	.word 0xfab4c020  ! 4243: STHA_R	stha	%r29, [%r19 + %r0] 0x01
T3_asi_reg_wr_151:
	mov	0x38, %r14
	.word 0xfcf38400  ! 4244: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_rd_186:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc25a176  ! 4251: STW_I	stw	%r30, [%r22 + 0x0176]
	.word 0x91956040  ! 4253: WRPR_PIL_I	wrpr	%r21, 0x0040, %pil
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_TO_TL0
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf6340000  ! 4258: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf4ace0d2  ! 4259: STBA_I	stba	%r26, [%r19 + 0x00d2] %asi
	.word 0xf22d2012  ! 4260: STB_I	stb	%r25, [%r20 + 0x0012]
T3_asi_reg_rd_187:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 4263: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_152:
	mov	0x9, %r14
	.word 0xf0f389e0  ! 4267: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb32d7001  ! 4268: SLLX_I	sllx	%r21, 0x0001, %r25
	.word 0xf42d20ff  ! 4272: STB_I	stb	%r26, [%r20 + 0x00ff]
T3_asi_reg_rd_188:
	mov	0x16, %r14
	.word 0xf8db89e0  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_rd_189:
	mov	0x12, %r14
	.word 0xf8db8e60  ! 4279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf224a008  ! 4282: STW_I	stw	%r25, [%r18 + 0x0008]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa248000  ! 4286: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xfead4020  ! 4289: STBA_R	stba	%r31, [%r21 + %r0] 0x01
T3_asi_reg_wr_153:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 4290: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 22)
	.word 0xf2358000  ! 4292: STH_R	sth	%r25, [%r22 + %r0]
T3_asi_reg_wr_154:
	mov	0x0, %r14
	.word 0xf0f389e0  ! 4293: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_190:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0x899460d5  ! 4299: WRPR_TICK_I	wrpr	%r17, 0x00d5, %tick
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_155:
	mov	0xa, %r14
	.word 0xf0f389e0  ! 4302: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
	.word 0xf67460b2  ! 4305: STX_I	stx	%r27, [%r17 + 0x00b2]
T3_asi_reg_wr_156:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 4309: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfe250000  ! 4311: STW_R	stw	%r31, [%r20 + %r0]
cpu_intr_3_314:
	setx	0x420016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62da0f7  ! 4316: STB_I	stb	%r27, [%r22 + 0x00f7]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb82cc000  ! 4319: ANDN_R	andn 	%r19, %r0, %r28
	.word 0xf0344000  ! 4321: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf8ad0020  ! 4322: STBA_R	stba	%r28, [%r20 + %r0] 0x01
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 3)
	.word 0xf0a48020  ! 4326: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_191:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_315:
	setx	0x430110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe342115  ! 4337: STH_I	sth	%r31, [%r16 + 0x0115]
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 5)
	.word 0xfcb4e0e4  ! 4341: STHA_I	stha	%r30, [%r19 + 0x00e4] %asi
	.word 0xb1641800  ! 4342: MOVcc_R	<illegal instruction>
	.word 0xfef5a144  ! 4343: STXA_I	stxa	%r31, [%r22 + 0x0144] %asi
cpu_intr_3_316:
	setx	0x410108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a44020  ! 4346: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4744000  ! 4352: STX_R	stx	%r26, [%r17 + %r0]
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 37)
	.word 0xbf7d0400  ! 4355: MOVR_R	movre	%r20, %r0, %r31
	.word 0xf62d4000  ! 4360: STB_R	stb	%r27, [%r21 + %r0]
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfc750000  ! 4362: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xb9480000  ! 4364: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
cpu_intr_3_317:
	setx	0x420108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d0000  ! 4367: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xf82ce02d  ! 4368: STB_I	stb	%r28, [%r19 + 0x002d]
cpu_intr_3_318:
	setx	0x420307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7d4400  ! 4370: MOVR_R	movre	%r21, %r0, %r31
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf4b5a1b7  ! 4377: STHA_I	stha	%r26, [%r22 + 0x01b7] %asi
cpu_intr_3_319:
	setx	0x420220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 4381: STW_R	stw	%r28, [%r20 + %r0]
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_192:
	mov	0x11, %r14
	.word 0xf0db8400  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_320:
	setx	0x400201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_157:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 4388: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_193:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf82c8000  ! 4392: STB_R	stb	%r28, [%r18 + %r0]
cpu_intr_3_321:
	setx	0x420038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_322:
	setx	0x43010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8346140  ! 4399: STH_I	sth	%r28, [%r17 + 0x0140]
	.word 0xf2b50020  ! 4400: STHA_R	stha	%r25, [%r20 + %r0] 0x01
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_323:
	setx	0x410038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_324:
	setx	0x42023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf82c8000  ! 4408: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf23461c9  ! 4417: STH_I	sth	%r25, [%r17 + 0x01c9]
cpu_intr_3_325:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_326:
	setx	0x410215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b44000  ! 4420: SUBCcc_R	orncc 	%r17, %r0, %r24
cpu_intr_3_327:
	setx	0x420137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfe754000  ! 4424: STX_R	stx	%r31, [%r21 + %r0]
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_158:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 4431: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_328:
	setx	0x420208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bce000  ! 4433: XNORcc_I	xnorcc 	%r19, 0x0000, %r24
	.word 0xfa240000  ! 4435: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf43521ae  ! 4439: STH_I	sth	%r26, [%r20 + 0x01ae]
	.word 0xb0b48000  ! 4440: ORNcc_R	orncc 	%r18, %r0, %r24
T3_asi_reg_wr_159:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 4443: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4a4e06a  ! 4448: STWA_I	stwa	%r26, [%r19 + 0x006a] %asi
T3_asi_reg_wr_160:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4449: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_329:
	setx	0x410228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8acc020  ! 4458: STBA_R	stba	%r28, [%r19 + %r0] 0x01
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 35)
	.word 0xbe1da1db  ! 4473: XOR_I	xor 	%r22, 0x01db, %r31
	.word 0xba8560e8  ! 4474: ADDcc_I	addcc 	%r21, 0x00e8, %r29
	.word 0xf874601e  ! 4475: STX_I	stx	%r28, [%r17 + 0x001e]
T3_asi_reg_wr_161:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 4479: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_194:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfe2c8000  ! 4481: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xbf2cc000  ! 4488: SLL_R	sll 	%r19, %r0, %r31
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb6bca0ac  ! 4492: XNORcc_I	xnorcc 	%r18, 0x00ac, %r27
T3_asi_reg_rd_195:
	mov	0x2e, %r14
	.word 0xf4db8e80  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_330:
	setx	0x42022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6adc020  ! 4500: STBA_R	stba	%r27, [%r23 + %r0] 0x01
T3_asi_reg_wr_162:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 4501: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb0bde1b6  ! 4508: XNORcc_I	xnorcc 	%r23, 0x01b6, %r24
	.word 0xfe75618f  ! 4511: STX_I	stx	%r31, [%r21 + 0x018f]
	ta	T_CHANGE_TO_TL0
	.word 0xf474c000  ! 4513: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xb6358000  ! 4515: ORN_R	orn 	%r22, %r0, %r27
T3_asi_reg_rd_196:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfef5e174  ! 4519: STXA_I	stxa	%r31, [%r23 + 0x0174] %asi
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf63420ce  ! 4521: STH_I	sth	%r27, [%r16 + 0x00ce]
	.word 0xf8a50020  ! 4522: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_331:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_332:
	setx	0x410031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5c020  ! 4528: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xb3480000  ! 4531: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf8758000  ! 4532: STX_R	stx	%r28, [%r22 + %r0]
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a8a  ! 4533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
T3_asi_reg_wr_163:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 4535: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_333:
	setx	0x410217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a58000  ! 4538: SUBcc_R	subcc 	%r22, %r0, %r25
T3_asi_reg_wr_164:
	mov	0x2f, %r14
	.word 0xf2f38e60  ! 4539: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfc2d8000  ! 4540: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfe74a105  ! 4541: STX_I	stx	%r31, [%r18 + 0x0105]
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 13)
	.word 0xb2ac6110  ! 4543: ANDNcc_I	andncc 	%r17, 0x0110, %r25
	.word 0xb625e19b  ! 4545: SUB_I	sub 	%r23, 0x019b, %r27
	.word 0xf2ad61e1  ! 4547: STBA_I	stba	%r25, [%r21 + 0x01e1] %asi
	.word 0xfc2de0e4  ! 4549: STB_I	stb	%r30, [%r23 + 0x00e4]
T3_asi_reg_rd_197:
	mov	0x1b, %r14
	.word 0xf6db89e0  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_334:
	setx	0x43032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb92db001  ! 4559: SLLX_I	sllx	%r22, 0x0001, %r28
	.word 0xf62c8000  ! 4561: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_198:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfaa4a180  ! 4566: STWA_I	stwa	%r29, [%r18 + 0x0180] %asi
	.word 0xfaa54020  ! 4567: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xf075c000  ! 4569: STX_R	stx	%r24, [%r23 + %r0]
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 7)
	.word 0xf0b5a1b5  ! 4571: STHA_I	stha	%r24, [%r22 + 0x01b5] %asi
	.word 0xfc2460f6  ! 4577: STW_I	stw	%r30, [%r17 + 0x00f6]
	.word 0xfc2d2116  ! 4579: STB_I	stb	%r30, [%r20 + 0x0116]
T3_asi_reg_wr_165:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 4580: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf22d4000  ! 4581: STB_R	stb	%r25, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_166:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 4583: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_335:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_167:
	mov	0x37, %r14
	.word 0xfcf38e60  ! 4587: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_168:
	mov	0x23, %r14
	.word 0xfcf38e60  ! 4588: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0756007  ! 4591: STX_I	stx	%r24, [%r21 + 0x0007]
	.word 0xf8b48020  ! 4594: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xf82cc000  ! 4595: STB_R	stb	%r28, [%r19 + %r0]
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 38)
	.word 0xf6ad0020  ! 4600: STBA_R	stba	%r27, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
cpu_intr_3_336:
	setx	0x420019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f4e1a8  ! 4608: STXA_I	stxa	%r26, [%r19 + 0x01a8] %asi
	.word 0xf62d0000  ! 4609: STB_R	stb	%r27, [%r20 + %r0]
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_TO_TL0
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, f)
	.word 0xf6a48020  ! 4615: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xb1641800  ! 4618: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_169:
	mov	0x28, %r14
	.word 0xfef38e80  ! 4619: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf2f42104  ! 4620: STXA_I	stxa	%r25, [%r16 + 0x0104] %asi
	.word 0xf6752131  ! 4621: STX_I	stx	%r27, [%r20 + 0x0131]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfea4209d  ! 4623: STWA_I	stwa	%r31, [%r16 + 0x009d] %asi
T3_asi_reg_rd_199:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 4625: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 34)
	.word 0xf0b46006  ! 4629: STHA_I	stha	%r24, [%r17 + 0x0006] %asi
	.word 0xfe75615b  ! 4634: STX_I	stx	%r31, [%r21 + 0x015b]
T3_asi_reg_rd_200:
	mov	0x33, %r14
	.word 0xf2db84a0  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_3_337:
	setx	0x45010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_338:
	setx	0x440216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 4644: STB_R	stb	%r29, [%r19 + %r0]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf8ad8020  ! 4653: STBA_R	stba	%r28, [%r22 + %r0] 0x01
cpu_intr_3_339:
	setx	0x44020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 11)
	.word 0x81952199  ! 4657: WRPR_TPC_I	wrpr	%r20, 0x0199, %tpc
	.word 0xfcadc020  ! 4662: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xf8b4217a  ! 4668: STHA_I	stha	%r28, [%r16 + 0x017a] %asi
cpu_intr_3_340:
	setx	0x450218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_170:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 4674: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfea5210a  ! 4678: STWA_I	stwa	%r31, [%r20 + 0x010a] %asi
	.word 0xf0354000  ! 4680: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf0b56197  ! 4681: STHA_I	stha	%r24, [%r21 + 0x0197] %asi
	.word 0xf8f5a1a0  ! 4684: STXA_I	stxa	%r28, [%r22 + 0x01a0] %asi
	.word 0xf8b4605e  ! 4685: STHA_I	stha	%r28, [%r17 + 0x005e] %asi
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_wr_171:
	mov	0x27, %r14
	.word 0xf2f38e40  ! 4690: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb63ca19d  ! 4691: XNOR_I	xnor 	%r18, 0x019d, %r27
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983852  ! 4700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1852, %hpstate
cpu_intr_3_341:
	setx	0x470336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc2007  ! 4702: XNORcc_I	xnorcc 	%r16, 0x0007, %r31
	.word 0xf8a420c1  ! 4703: STWA_I	stwa	%r28, [%r16 + 0x00c1] %asi
T3_asi_reg_rd_201:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 4704: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfaad4020  ! 4707: STBA_R	stba	%r29, [%r21 + %r0] 0x01
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf0344000  ! 4719: STH_R	sth	%r24, [%r17 + %r0]
T3_asi_reg_rd_202:
	mov	0x35, %r14
	.word 0xf8db8e60  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf87460b6  ! 4721: STX_I	stx	%r28, [%r17 + 0x00b6]
	.word 0xb894c000  ! 4723: ORcc_R	orcc 	%r19, %r0, %r28
T3_asi_reg_rd_203:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 4724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_172:
	mov	0x1, %r14
	.word 0xf0f38e40  ! 4727: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_342:
	setx	0x46031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_173:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 4730: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfa75615c  ! 4732: STX_I	stx	%r29, [%r21 + 0x015c]
	.word 0xfe740000  ! 4733: STX_R	stx	%r31, [%r16 + %r0]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_343:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb56159  ! 4741: STHA_I	stha	%r30, [%r21 + 0x0159] %asi
	.word 0xf0f4e1f8  ! 4742: STXA_I	stxa	%r24, [%r19 + 0x01f8] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xb950c000  ! 4745: RDPR_TT	rdpr	%tt, %r28
	.word 0xb03c0000  ! 4746: XNOR_R	xnor 	%r16, %r0, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf02560b3  ! 4748: STW_I	stw	%r24, [%r21 + 0x00b3]
cpu_intr_3_344:
	setx	0x440119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_345:
	setx	0x440331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_346:
	setx	0x44031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834c000  ! 4752: STH_R	sth	%r28, [%r19 + %r0]
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 34)
	.word 0xbc0d21f9  ! 4761: AND_I	and 	%r20, 0x01f9, %r30
	.word 0xf2f461fa  ! 4763: STXA_I	stxa	%r25, [%r17 + 0x01fa] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf62da172  ! 4765: STB_I	stb	%r27, [%r22 + 0x0172]
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_174:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 4768: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf225a0e9  ! 4770: STW_I	stw	%r25, [%r22 + 0x00e9]
	.word 0xf6756130  ! 4771: STX_I	stx	%r27, [%r21 + 0x0130]
	.word 0xfe24e1a5  ! 4772: STW_I	stw	%r31, [%r19 + 0x01a5]
	.word 0xb2040000  ! 4774: ADD_R	add 	%r16, %r0, %r25
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfe2ce0b0  ! 4778: STB_I	stb	%r31, [%r19 + 0x00b0]
	.word 0xba350000  ! 4781: SUBC_R	orn 	%r20, %r0, %r29
	.word 0xb5641800  ! 4784: MOVcc_R	<illegal instruction>
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, c)
	.word 0xbf520000  ! 4787: RDPR_PIL	<illegal instruction>
	.word 0xbe954000  ! 4791: ORcc_R	orcc 	%r21, %r0, %r31
cpu_intr_3_347:
	setx	0x460038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e073  ! 4796: STX_I	stx	%r27, [%r23 + 0x0073]
	.word 0xf6ace120  ! 4797: STBA_I	stba	%r27, [%r19 + 0x0120] %asi
	.word 0xf8744000  ! 4799: STX_R	stx	%r28, [%r17 + %r0]
T3_asi_reg_rd_204:
	mov	0x34, %r14
	.word 0xf2db8400  ! 4800: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_348:
	setx	0x470235, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfa746065  ! 4806: STX_I	stx	%r29, [%r17 + 0x0065]
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, a)
	.word 0xb551c000  ! 4815: RDPR_TL	rdpr	%tl, %r26
T3_asi_reg_wr_175:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 4817: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2a56163  ! 4819: STWA_I	stwa	%r25, [%r21 + 0x0163] %asi
T3_asi_reg_wr_176:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 4824: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf2740000  ! 4829: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xb4358000  ! 4830: ORN_R	orn 	%r22, %r0, %r26
cpu_intr_3_349:
	setx	0x47032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 5)
	.word 0xb6bc0000  ! 4833: XNORcc_R	xnorcc 	%r16, %r0, %r27
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_TO_TL1
	.word 0xfeb5c020  ! 4840: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xb5508000  ! 4842: RDPR_TSTATE	<illegal instruction>
T3_asi_reg_wr_177:
	mov	0x30, %r14
	.word 0xf4f384a0  ! 4843: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 13)
	.word 0xbf3cc000  ! 4846: SRA_R	sra 	%r19, %r0, %r31
	.word 0xbec56191  ! 4848: ADDCcc_I	addccc 	%r21, 0x0191, %r31
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa344000  ! 4857: STH_R	sth	%r29, [%r17 + %r0]
T3_asi_reg_rd_205:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 4859: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_206:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_178:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 4862: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xba244000  ! 4869: SUB_R	sub 	%r17, %r0, %r29
	.word 0xfab48020  ! 4874: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xfe758000  ! 4875: STX_R	stx	%r31, [%r22 + %r0]
cpu_intr_3_350:
	setx	0x460006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f561f6  ! 4877: STXA_I	stxa	%r28, [%r21 + 0x01f6] %asi
cpu_intr_3_351:
	setx	0x44033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb814a1fc  ! 4882: OR_I	or 	%r18, 0x01fc, %r28
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 19)
	.word 0xf6aca09c  ! 4886: STBA_I	stba	%r27, [%r18 + 0x009c] %asi
cpu_intr_3_352:
	setx	0x460005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_353:
	setx	0x450225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc7461e6  ! 4890: STX_I	stx	%r30, [%r17 + 0x01e6]
T3_asi_reg_rd_207:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfab4e02a  ! 4894: STHA_I	stha	%r29, [%r19 + 0x002a] %asi
	.word 0xf02dc000  ! 4895: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf634a058  ! 4896: STH_I	sth	%r27, [%r18 + 0x0058]
	.word 0xf6250000  ! 4897: STW_R	stw	%r27, [%r20 + %r0]
cpu_intr_3_354:
	setx	0x450026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c2001  ! 4899: SRA_I	sra 	%r16, 0x0001, %r28
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_355:
	setx	0x450100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ad6167  ! 4907: ANDNcc_I	andncc 	%r21, 0x0167, %r26
	.word 0xf2240000  ! 4908: STW_R	stw	%r25, [%r16 + %r0]
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_179:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 4912: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0248000  ! 4913: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xb8c5616e  ! 4914: ADDCcc_I	addccc 	%r21, 0x016e, %r28
cpu_intr_3_356:
	setx	0x47001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_208:
	mov	0x15, %r14
	.word 0xf6db89e0  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_rd_209:
	mov	0x17, %r14
	.word 0xfadb8400  ! 4917: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c52  ! 4918: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c52, %hpstate
T3_asi_reg_rd_210:
	mov	0x2c, %r14
	.word 0xf6db89e0  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e90  ! 4925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e90, %hpstate
	.word 0xf4b44020  ! 4928: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xf4acc020  ! 4930: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xf82cc000  ! 4931: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xfa2da013  ! 4935: STB_I	stb	%r29, [%r22 + 0x0013]
T3_asi_reg_rd_211:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 4936: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_357:
	setx	0x470334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_358:
	setx	0x46033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_359:
	setx	0x45023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a48020  ! 4947: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
cpu_intr_3_360:
	setx	0x460013, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_212:
	mov	0x5, %r14
	.word 0xfedb8e40  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_361:
	setx	0x440204, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_213:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_362:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_363:
	setx	0x440212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac20d4  ! 4965: STBA_I	stba	%r26, [%r16 + 0x00d4] %asi
T3_asi_reg_rd_214:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf2240000  ! 4970: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf2252037  ! 4971: STW_I	stw	%r25, [%r20 + 0x0037]
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_215:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 4974: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf4b5a109  ! 4976: STHA_I	stha	%r26, [%r22 + 0x0109] %asi
T3_asi_reg_wr_180:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4977: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a1a  ! 4979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
	.word 0xb4b44000  ! 4981: SUBCcc_R	orncc 	%r17, %r0, %r26
	.word 0xf0a42174  ! 4983: STWA_I	stwa	%r24, [%r16 + 0x0174] %asi
	.word 0xfaada102  ! 4984: STBA_I	stba	%r29, [%r22 + 0x0102] %asi
	.word 0xb01ce0c1  ! 4986: XOR_I	xor 	%r19, 0x00c1, %r24
cpu_intr_3_364:
	setx	0x46003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 22)
	.word 0xbd518000  ! 4994: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xf42c6195  ! 4995: STB_I	stb	%r26, [%r17 + 0x0195]
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 15)
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
	.word 0xfe048000  ! 2: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf605a043  ! 3: LDUW_I	lduw	[%r22 + 0x0043], %r27
T2_asi_reg_wr_0:
	mov	0x38, %r14
	.word 0xfef38e60  ! 5: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e8a  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
cpu_intr_2_0:
	setx	0x1d0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6940020  ! 10: LDUHA_R	lduha	[%r16, %r0] 0x01, %r27
	.word 0xfa544000  ! 13: LDSH_R	ldsh	[%r17 + %r0], %r29
cpu_intr_2_1:
	setx	0x1c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_1:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 19: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa5d2059  ! 20: LDX_I	ldx	[%r20 + 0x0059], %r29
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 34)
	.word 0xfacc0020  ! 29: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xf04c2153  ! 30: LDSB_I	ldsb	[%r16 + 0x0153], %r24
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, e)
	.word 0xf2d4a01b  ! 33: LDSHA_I	ldsha	[%r18, + 0x001b] %asi, %r25
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_NONHPRIV
	.word 0xbe2da0b2  ! 40: ANDN_I	andn 	%r22, 0x00b2, %r31
T2_asi_reg_wr_2:
	mov	0x18, %r14
	.word 0xf8f38400  ! 43: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_2:
	setx	0x1f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc440000  ! 47: LDSW_R	ldsw	[%r16 + %r0], %r30
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 16)
	.word 0xb7641800  ! 51: MOVcc_R	<illegal instruction>
	.word 0xf6cc0020  ! 54: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
	.word 0xf8dd6003  ! 57: LDXA_I	ldxa	[%r21, + 0x0003] %asi, %r28
cpu_intr_2_3:
	setx	0x1d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe44a159  ! 60: LDSW_I	ldsw	[%r18 + 0x0159], %r31
	.word 0xb00ca1ba  ! 62: AND_I	and 	%r18, 0x01ba, %r24
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f40  ! 63: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f40, %hpstate
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_0:
	mov	0x8, %r14
	.word 0xf8db8e40  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_1:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_4:
	setx	0x1d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf69460cb  ! 75: LDUHA_I	lduha	[%r17, + 0x00cb] %asi, %r27
cpu_intr_2_5:
	setx	0x1e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d6121  ! 77: LDSB_I	ldsb	[%r21 + 0x0121], %r27
	.word 0xf20c8000  ! 79: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xba94a1b4  ! 81: ORcc_I	orcc 	%r18, 0x01b4, %r29
T2_asi_reg_wr_3:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 83: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf894a1e0  ! 85: LDUHA_I	lduha	[%r18, + 0x01e0] %asi, %r28
cpu_intr_2_6:
	setx	0x1f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285e1be  ! 95: LDUWA_I	lduwa	[%r23, + 0x01be] %asi, %r25
	.word 0xbd540000  ! 96: RDPR_GL	<illegal instruction>
	.word 0xf8cce171  ! 98: LDSBA_I	ldsba	[%r19, + 0x0171] %asi, %r28
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_2:
	mov	0x2c, %r14
	.word 0xf0db8e80  ! 102: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_7:
	setx	0x1e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_4:
	mov	0x19, %r14
	.word 0xf6f384a0  ! 107: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_8:
	setx	0x1d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6150000  ! 110: LDUH_R	lduh	[%r20 + %r0], %r27
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_9:
	setx	0x1f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4560ed  ! 117: LDSW_I	ldsw	[%r21 + 0x00ed], %r29
	.word 0xfe4ca0db  ! 119: LDSB_I	ldsb	[%r18 + 0x00db], %r31
	.word 0xf65dc000  ! 120: LDX_R	ldx	[%r23 + %r0], %r27
T2_asi_reg_rd_3:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, c)
	.word 0xf64de1ae  ! 128: LDSB_I	ldsb	[%r23 + 0x01ae], %r27
	.word 0xfcd4203b  ! 129: LDSHA_I	ldsha	[%r16, + 0x003b] %asi, %r30
T2_asi_reg_rd_4:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_10:
	setx	0x1c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d0000  ! 136: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xb6058000  ! 137: ADD_R	add 	%r22, %r0, %r27
cpu_intr_2_11:
	setx	0x1e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_5:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 139: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf25c21eb  ! 141: LDX_I	ldx	[%r16 + 0x01eb], %r25
	.word 0xb4258000  ! 144: SUB_R	sub 	%r22, %r0, %r26
	.word 0xb41461ce  ! 145: OR_I	or 	%r17, 0x01ce, %r26
cpu_intr_2_12:
	setx	0x1d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_6:
	mov	0x33, %r14
	.word 0xf6f38e80  ! 153: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0d4e09c  ! 158: LDSHA_I	ldsha	[%r19, + 0x009c] %asi, %r24
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 22)
	.word 0xfa0ce1a6  ! 163: LDUB_I	ldub	[%r19 + 0x01a6], %r29
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 5)
	.word 0xbd643801  ! 166: MOVcc_I	<illegal instruction>
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 39)
	.word 0xf08c0020  ! 171: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
cpu_intr_2_13:
	setx	0x1e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a4618e  ! 178: SUBcc_I	subcc 	%r17, 0x018e, %r28
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_14:
	setx	0x1d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe048000  ! 182: LDUW_R	lduw	[%r18 + %r0], %r31
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_15:
	setx	0x1c031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c60ca  ! 191: LDUB_I	ldub	[%r17 + 0x00ca], %r30
	.word 0xf25d613c  ! 194: LDX_I	ldx	[%r21 + 0x013c], %r25
	.word 0xb6356036  ! 195: SUBC_I	orn 	%r21, 0x0036, %r27
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_5:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f48  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
T2_asi_reg_rd_6:
	mov	0x4, %r14
	.word 0xf0db89e0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_rd_7:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 205: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbb540000  ! 206: RDPR_GL	rdpr	%-, %r29
	.word 0xfecca170  ! 208: LDSBA_I	ldsba	[%r18, + 0x0170] %asi, %r31
	.word 0xbeb54000  ! 211: SUBCcc_R	orncc 	%r21, %r0, %r31
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf8dc2099  ! 217: LDXA_I	ldxa	[%r16, + 0x0099] %asi, %r28
	.word 0xb695a093  ! 220: ORcc_I	orcc 	%r22, 0x0093, %r27
T2_asi_reg_wr_7:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 222: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_16:
	setx	0x1e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_8:
	mov	0x30, %r14
	.word 0xf0db8400  ! 227: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_17:
	setx	0x1e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_18:
	setx	0x1f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5c020  ! 234: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
	.word 0xf615a06d  ! 235: LDUH_I	lduh	[%r22 + 0x006d], %r27
T2_asi_reg_rd_9:
	mov	0x1, %r14
	.word 0xf4db8e80  ! 239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfa5c8000  ! 241: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf4cd604a  ! 243: LDSBA_I	ldsba	[%r21, + 0x004a] %asi, %r26
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_19:
	setx	0x1f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_20:
	setx	0x1d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_8:
	mov	0x12, %r14
	.word 0xf8f38400  ! 260: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf80d6143  ! 262: LDUB_I	ldub	[%r21 + 0x0143], %r28
	.word 0xfecc201a  ! 263: LDSBA_I	ldsba	[%r16, + 0x001a] %asi, %r31
	.word 0xfc5de035  ! 264: LDX_I	ldx	[%r23 + 0x0035], %r30
	.word 0xbb2d9000  ! 267: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xf8d4a0e1  ! 269: LDSHA_I	ldsha	[%r18, + 0x00e1] %asi, %r28
	.word 0xf4446128  ! 270: LDSW_I	ldsw	[%r17 + 0x0128], %r26
cpu_intr_2_21:
	setx	0x1f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dda045  ! 277: LDXA_I	ldxa	[%r22, + 0x0045] %asi, %r27
	.word 0xf00c8000  ! 278: LDUB_R	ldub	[%r18 + %r0], %r24
T2_asi_reg_rd_10:
	mov	0x20, %r14
	.word 0xf4db84a0  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 12)
	.word 0xf845e0ea  ! 287: LDSW_I	ldsw	[%r23 + 0x00ea], %r28
T2_asi_reg_rd_11:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_22:
	setx	0x1d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08c4000  ! 293: ANDcc_R	andcc 	%r17, %r0, %r24
T2_asi_reg_rd_12:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_23:
	setx	0x1f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_9:
	mov	0x17, %r14
	.word 0xfcf38e80  ! 302: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_13:
	mov	0x14, %r14
	.word 0xfadb8e80  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_rd_14:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 306: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb23dc000  ! 309: XNOR_R	xnor 	%r23, %r0, %r25
cpu_intr_2_24:
	setx	0x1f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_10:
	mov	0x1b, %r14
	.word 0xf6f38400  ! 321: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xf8cc4020  ! 324: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
	.word 0xb4858000  ! 325: ADDcc_R	addcc 	%r22, %r0, %r26
	.word 0xf28ce1ea  ! 327: LDUBA_I	lduba	[%r19, + 0x01ea] %asi, %r25
T2_asi_reg_wr_11:
	mov	0x21, %r14
	.word 0xf2f38400  ! 331: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf4c54020  ! 332: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
	.word 0xf6dda009  ! 333: LDXA_I	ldxa	[%r22, + 0x0009] %asi, %r27
cpu_intr_2_25:
	setx	0x1f0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_NONHPRIV
	.word 0xbaa5e079  ! 349: SUBcc_I	subcc 	%r23, 0x0079, %r29
	.word 0xfc448000  ! 351: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xfe8c2014  ! 352: LDUBA_I	lduba	[%r16, + 0x0014] %asi, %r31
	.word 0xf20d0000  ! 353: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xf20ce045  ! 355: LDUB_I	ldub	[%r19 + 0x0045], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_15:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 358: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 15)
	.word 0xfccd4020  ! 362: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
T2_asi_reg_rd_16:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 365: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 15)
	.word 0xf45c8000  ! 373: LDX_R	ldx	[%r18 + %r0], %r26
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_17:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfc8dc020  ! 378: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe4c60d9  ! 381: LDSB_I	ldsb	[%r17 + 0x00d9], %r31
	.word 0xb83d21a8  ! 383: XNOR_I	xnor 	%r20, 0x01a8, %r28
	.word 0xf80de076  ! 384: LDUB_I	ldub	[%r23 + 0x0076], %r28
	.word 0xf2540000  ! 386: LDSH_R	ldsh	[%r16 + %r0], %r25
T2_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 387: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfed4e15f  ! 389: LDSHA_I	ldsha	[%r19, + 0x015f] %asi, %r31
T2_asi_reg_wr_13:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 390: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf28d8020  ! 393: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982dda  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dda, %hpstate
	.word 0xfa5de161  ! 396: LDX_I	ldx	[%r23 + 0x0161], %r29
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_26:
	setx	0x1f0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa44000  ! 407: SUBcc_R	subcc 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_18:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf6cd0020  ! 417: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_27:
	setx	0x1e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c44020  ! 422: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_NONHPRIV
	.word 0xf2940020  ! 429: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
cpu_intr_2_28:
	setx	0x1c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc94212d  ! 431: LDUHA_I	lduha	[%r16, + 0x012d] %asi, %r30
	.word 0xb60d8000  ! 436: AND_R	and 	%r22, %r0, %r27
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb13cd000  ! 438: SRAX_R	srax	%r19, %r0, %r24
	.word 0xfe8561f3  ! 439: LDUWA_I	lduwa	[%r21, + 0x01f3] %asi, %r31
	.word 0xf40dc000  ! 441: LDUB_R	ldub	[%r23 + %r0], %r26
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 5)
	.word 0xf855c000  ! 444: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xf00d4000  ! 445: LDUB_R	ldub	[%r21 + %r0], %r24
T2_asi_reg_rd_19:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_29:
	setx	0x1c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_30:
	setx	0x1c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_20:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_31:
	setx	0x1e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa558000  ! 456: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xbc8c8000  ! 457: ANDcc_R	andcc 	%r18, %r0, %r30
	.word 0xf2c50020  ! 458: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
	.word 0xfe4421d2  ! 460: LDSW_I	ldsw	[%r16 + 0x01d2], %r31
	.word 0xf8c4e086  ! 462: LDSWA_I	ldswa	[%r19, + 0x0086] %asi, %r28
T2_asi_reg_wr_14:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 465: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_32:
	setx	0x23031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe0ce092  ! 469: LDUB_I	ldub	[%r19 + 0x0092], %r31
T2_asi_reg_wr_15:
	mov	0x2d, %r14
	.word 0xf2f38400  ! 470: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_21:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 472: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf8dc60fe  ! 473: LDXA_I	ldxa	[%r17, + 0x00fe] %asi, %r28
	.word 0xfad44020  ! 474: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_33:
	setx	0x200338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_22:
	mov	0x13, %r14
	.word 0xfedb8e40  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_16:
	mov	0x26, %r14
	.word 0xf0f38400  ! 479: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb4b48000  ! 481: SUBCcc_R	orncc 	%r18, %r0, %r26
	.word 0xf2dc2169  ! 482: LDXA_I	ldxa	[%r16, + 0x0169] %asi, %r25
T2_asi_reg_wr_17:
	mov	0x2b, %r14
	.word 0xfcf38e80  ! 483: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_23:
	mov	0xd, %r14
	.word 0xf4db89e0  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_18:
	mov	0x1b, %r14
	.word 0xf6f38e80  ! 489: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf88c21bc  ! 490: LDUBA_I	lduba	[%r16, + 0x01bc] %asi, %r28
	.word 0xf215c000  ! 491: LDUH_R	lduh	[%r23 + %r0], %r25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982880  ! 493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
	ta	T_CHANGE_TO_TL0
cpu_intr_2_34:
	setx	0x22003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 32)
	.word 0xf084e185  ! 502: LDUWA_I	lduwa	[%r19, + 0x0185] %asi, %r24
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 28)
	.word 0xf0150000  ! 505: LDUH_R	lduh	[%r20 + %r0], %r24
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a0a  ! 508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0a, %hpstate
	.word 0xfecce0c0  ! 510: LDSBA_I	ldsba	[%r19, + 0x00c0] %asi, %r31
	.word 0xb2bce1c9  ! 512: XNORcc_I	xnorcc 	%r19, 0x01c9, %r25
	.word 0xfad54020  ! 513: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
T2_asi_reg_rd_24:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bda  ! 517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bda, %hpstate
	.word 0xf88c0020  ! 518: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 1)
	.word 0xb62520fe  ! 522: SUB_I	sub 	%r20, 0x00fe, %r27
cpu_intr_2_35:
	setx	0x200000, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_19:
	mov	0xe, %r14
	.word 0xf4f384a0  ! 528: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_25:
	mov	0x7, %r14
	.word 0xfadb84a0  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfc04a088  ! 534: LDUW_I	lduw	[%r18 + 0x0088], %r30
	.word 0xf8c5c020  ! 535: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xf4d54020  ! 536: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r26
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, a)
	.word 0xf2558000  ! 542: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf04461cb  ! 544: LDSW_I	ldsw	[%r17 + 0x01cb], %r24
	.word 0xf68c603b  ! 546: LDUBA_I	lduba	[%r17, + 0x003b] %asi, %r27
cpu_intr_2_36:
	setx	0x200321, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x13, %r14
	.word 0xf2f38400  ! 550: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_21:
	mov	0x28, %r14
	.word 0xfaf38400  ! 551: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf64c4000  ! 552: LDSB_R	ldsb	[%r17 + %r0], %r27
cpu_intr_2_37:
	setx	0x230108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 11)
	.word 0xbc850000  ! 561: ADDcc_R	addcc 	%r20, %r0, %r30
T2_asi_reg_rd_26:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf2c561cc  ! 563: LDSWA_I	ldswa	[%r21, + 0x01cc] %asi, %r25
	.word 0xb8adc000  ! 566: ANDNcc_R	andncc 	%r23, %r0, %r28
T2_asi_reg_rd_27:
	mov	0x16, %r14
	.word 0xf0db8e40  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_38:
	setx	0x23003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_39:
	setx	0x230018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb484e0b2  ! 573: ADDcc_I	addcc 	%r19, 0x00b2, %r26
	.word 0xba050000  ! 574: ADD_R	add 	%r20, %r0, %r29
cpu_intr_2_40:
	setx	0x200218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_22:
	mov	0x25, %r14
	.word 0xf0f38e80  ! 578: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_28:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa8d0020  ! 582: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 15)
	.word 0xf6d561cd  ! 587: LDSHA_I	ldsha	[%r21, + 0x01cd] %asi, %r27
cpu_intr_2_41:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0458000  ! 591: LDSW_R	ldsw	[%r22 + %r0], %r24
cpu_intr_2_42:
	setx	0x230220, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_29:
	mov	0x9, %r14
	.word 0xf4db8400  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfe4ce0c2  ! 601: LDSB_I	ldsb	[%r19 + 0x00c2], %r31
T2_asi_reg_rd_30:
	mov	0x2d, %r14
	.word 0xf2db89e0  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_43:
	setx	0x21010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_23:
	mov	0x9, %r14
	.word 0xf0f38e80  ! 607: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 4)
	.word 0xb08c6148  ! 613: ANDcc_I	andcc 	%r17, 0x0148, %r24
	.word 0xb0240000  ! 617: SUB_R	sub 	%r16, %r0, %r24
cpu_intr_2_44:
	setx	0x200036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_45:
	setx	0x200337, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_46:
	setx	0x22001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_31:
	mov	0x1f, %r14
	.word 0xf6db8e80  ! 627: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb09c60ef  ! 629: XORcc_I	xorcc 	%r17, 0x00ef, %r24
	.word 0xf20d4000  ! 630: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xf4850020  ! 631: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
	.word 0xf20ca144  ! 632: LDUB_I	ldub	[%r18 + 0x0144], %r25
	.word 0xf055c000  ! 634: LDSH_R	ldsh	[%r23 + %r0], %r24
T2_asi_reg_rd_32:
	mov	0xc, %r14
	.word 0xf8db84a0  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf0c46060  ! 638: LDSWA_I	ldswa	[%r17, + 0x0060] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf6152144  ! 642: LDUH_I	lduh	[%r20 + 0x0144], %r27
	.word 0xf2140000  ! 644: LDUH_R	lduh	[%r16 + %r0], %r25
T2_asi_reg_rd_33:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_34:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_47:
	setx	0x200129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845203c  ! 654: LDSW_I	ldsw	[%r20 + 0x003c], %r28
T2_asi_reg_rd_35:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf8c5206e  ! 662: LDSWA_I	ldswa	[%r20, + 0x006e] %asi, %r28
cpu_intr_2_48:
	setx	0x210131, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c90  ! 666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c90, %hpstate
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfc0c61cd  ! 669: LDUB_I	ldub	[%r17 + 0x01cd], %r30
T2_asi_reg_rd_36:
	mov	0x23, %r14
	.word 0xf6db89e0  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5de029  ! 674: LDX_I	ldx	[%r23 + 0x0029], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf64521de  ! 678: LDSW_I	ldsw	[%r20 + 0x01de], %r27
	.word 0xbc9c214c  ! 681: XORcc_I	xorcc 	%r16, 0x014c, %r30
	.word 0xfcc4a104  ! 683: LDSWA_I	ldswa	[%r18, + 0x0104] %asi, %r30
T2_asi_reg_wr_24:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 684: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2dda11f  ! 686: LDXA_I	ldxa	[%r22, + 0x011f] %asi, %r25
cpu_intr_2_49:
	setx	0x20013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2840020  ! 689: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
	.word 0xf294a1d4  ! 691: LDUHA_I	lduha	[%r18, + 0x01d4] %asi, %r25
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_25:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 694: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfad58020  ! 696: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r29
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, b)
	.word 0xf655212c  ! 699: LDSH_I	ldsh	[%r20 + 0x012c], %r27
	.word 0xf40ce0c3  ! 704: LDUB_I	ldub	[%r19 + 0x00c3], %r26
	.word 0xbf2d6001  ! 707: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xb4954000  ! 710: ORcc_R	orcc 	%r21, %r0, %r26
cpu_intr_2_50:
	setx	0x210033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 718: LDUB_R	ldub	[%r17 + %r0], %r27
cpu_intr_2_51:
	setx	0x21032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_52:
	setx	0x20010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d54020  ! 723: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 29)
	.word 0xf20d0000  ! 726: LDUB_R	ldub	[%r20 + %r0], %r25
cpu_intr_2_53:
	setx	0x230028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_54:
	setx	0x210025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ca19c  ! 730: LDX_I	ldx	[%r18 + 0x019c], %r27
T2_asi_reg_rd_37:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 731: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_26:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 739: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 17)
	.word 0xb245a064  ! 742: ADDC_I	addc 	%r22, 0x0064, %r25
	.word 0xfc554000  ! 746: LDSH_R	ldsh	[%r21 + %r0], %r30
cpu_intr_2_55:
	setx	0x23022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 18)
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f80  ! 761: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
cpu_intr_2_56:
	setx	0x230334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dde016  ! 763: LDXA_I	ldxa	[%r23, + 0x0016] %asi, %r28
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_57:
	setx	0x22030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_58:
	setx	0x23022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 769: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
cpu_intr_2_59:
	setx	0x230102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4550000  ! 772: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xfe558000  ! 773: LDSH_R	ldsh	[%r22 + %r0], %r31
T2_asi_reg_rd_38:
	mov	0x31, %r14
	.word 0xfedb8400  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 2)
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198390a  ! 777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190a, %hpstate
	.word 0xf0c4c020  ! 781: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r24
	.word 0xf81560b6  ! 782: LDUH_I	lduh	[%r21 + 0x00b6], %r28
	.word 0xfe0d6018  ! 784: LDUB_I	ldub	[%r21 + 0x0018], %r31
T2_asi_reg_rd_39:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_28:
	mov	0x38, %r14
	.word 0xfaf38400  ! 786: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_60:
	setx	0x220018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_61:
	setx	0x20001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2950000  ! 794: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xfec5e147  ! 796: LDSWA_I	ldswa	[%r23, + 0x0147] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_62:
	setx	0x23020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198284a  ! 801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084a, %hpstate
	.word 0xfa5460f3  ! 805: LDSH_I	ldsh	[%r17 + 0x00f3], %r29
	.word 0xfeccc020  ! 806: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
cpu_intr_2_63:
	setx	0x200126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe95a084  ! 809: LDUHA_I	lduha	[%r22, + 0x0084] %asi, %r31
cpu_intr_2_64:
	setx	0x220019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_65:
	setx	0x220104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952053  ! 815: WRPR_TT_I	wrpr	%r20, 0x0053, %tt
	.word 0xfe05a047  ! 816: LDUW_I	lduw	[%r22 + 0x0047], %r31
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfacc2124  ! 823: LDSBA_I	ldsba	[%r16, + 0x0124] %asi, %r29
	.word 0xb085614a  ! 824: ADDcc_I	addcc 	%r21, 0x014a, %r24
	.word 0xf8158000  ! 826: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xf454e0da  ! 828: LDSH_I	ldsh	[%r19 + 0x00da], %r26
T2_asi_reg_rd_40:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 829: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, a)
	.word 0xb52c6001  ! 833: SLL_I	sll 	%r17, 0x0001, %r26
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 26)
	.word 0xf4cc4020  ! 838: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
cpu_intr_2_66:
	setx	0x200123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5a1e3  ! 842: LDSHA_I	ldsha	[%r22, + 0x01e3] %asi, %r25
	.word 0xb815a105  ! 844: OR_I	or 	%r22, 0x0105, %r28
T2_asi_reg_rd_41:
	mov	0x12, %r14
	.word 0xf8db84a0  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_rd_42:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbf2da001  ! 847: SLL_I	sll 	%r22, 0x0001, %r31
T2_asi_reg_wr_29:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 850: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc04a13f  ! 853: LDUW_I	lduw	[%r18 + 0x013f], %r30
	.word 0xf6152133  ! 854: LDUH_I	lduh	[%r20 + 0x0133], %r27
T2_asi_reg_rd_43:
	mov	0x23, %r14
	.word 0xf8db8e40  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_44:
	mov	0x37, %r14
	.word 0xf6db84a0  ! 857: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfc440000  ! 858: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf6cce1e6  ! 859: LDSBA_I	ldsba	[%r19, + 0x01e6] %asi, %r27
cpu_intr_2_67:
	setx	0x220319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d58020  ! 869: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_45:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_30:
	mov	0x16, %r14
	.word 0xfaf384a0  ! 873: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf4558000  ! 875: LDSH_R	ldsh	[%r22 + %r0], %r26
T2_asi_reg_rd_46:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 879: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf414202f  ! 881: LDUH_I	lduh	[%r16 + 0x002f], %r26
T2_asi_reg_rd_47:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_68:
	setx	0x23013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 25)
	.word 0xf45561ac  ! 888: LDSH_I	ldsh	[%r21 + 0x01ac], %r26
cpu_intr_2_69:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf60d4000  ! 894: LDUB_R	ldub	[%r21 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfccd8020  ! 896: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_48:
	mov	0x14, %r14
	.word 0xfedb89e0  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf455e1c5  ! 900: LDSH_I	ldsh	[%r23 + 0x01c5], %r26
	.word 0xfc150000  ! 906: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf055e027  ! 907: LDSH_I	ldsh	[%r23 + 0x0027], %r24
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 11)
	.word 0xbb2c1000  ! 911: SLLX_R	sllx	%r16, %r0, %r29
	.word 0xf044e1f4  ! 915: LDSW_I	ldsw	[%r19 + 0x01f4], %r24
	.word 0xf40c8000  ! 916: LDUB_R	ldub	[%r18 + %r0], %r26
cpu_intr_2_70:
	setx	0x250105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb28c0000  ! 926: ANDcc_R	andcc 	%r16, %r0, %r25
	ta	T_CHANGE_NONHPRIV
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_71:
	setx	0x260301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf69520e9  ! 932: LDUHA_I	lduha	[%r20, + 0x00e9] %asi, %r27
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf485614f  ! 935: LDUWA_I	lduwa	[%r21, + 0x014f] %asi, %r26
cpu_intr_2_72:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_49:
	mov	0xa, %r14
	.word 0xfedb89e0  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf8d5c020  ! 940: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
T2_asi_reg_rd_50:
	mov	0x1f, %r14
	.word 0xf0db84a0  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1540000  ! 948: RDPR_GL	<illegal instruction>
	.word 0xf6440000  ! 950: LDSW_R	ldsw	[%r16 + %r0], %r27
cpu_intr_2_73:
	setx	0x250003, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_31:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 952: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb2358000  ! 953: ORN_R	orn 	%r22, %r0, %r25
cpu_intr_2_74:
	setx	0x270301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe85c000  ! 956: ADDcc_R	addcc 	%r23, %r0, %r31
cpu_intr_2_75:
	setx	0x250324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_76:
	setx	0x260207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf0958020  ! 962: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_TO_TL0
	.word 0xb0c54000  ! 967: ADDCcc_R	addccc 	%r21, %r0, %r24
	.word 0xfa0ce195  ! 970: LDUB_I	ldub	[%r19 + 0x0195], %r29
cpu_intr_2_77:
	setx	0x26000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_78:
	setx	0x270038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 11)
	.word 0xf48d8020  ! 983: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
cpu_intr_2_79:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc05c000  ! 987: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xfc4ca130  ! 993: LDSB_I	ldsb	[%r18 + 0x0130], %r30
	.word 0xfe5d4000  ! 996: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xfc5ce093  ! 998: LDX_I	ldx	[%r19 + 0x0093], %r30
	.word 0xf8942153  ! 1001: LDUHA_I	lduha	[%r16, + 0x0153] %asi, %r28
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 20)
	.word 0xf68d21d6  ! 1003: LDUBA_I	lduba	[%r20, + 0x01d6] %asi, %r27
	ta	T_CHANGE_HPRIV
cpu_intr_2_80:
	setx	0x27011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535b001  ! 1013: SRLX_I	srlx	%r22, 0x0001, %r26
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf445a145  ! 1018: LDSW_I	ldsw	[%r22 + 0x0145], %r26
	.word 0xfe5da0d1  ! 1020: LDX_I	ldx	[%r22 + 0x00d1], %r31
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_81:
	setx	0x26021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d4000  ! 1028: LDSB_R	ldsb	[%r21 + %r0], %r26
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 2f)
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b92  ! 1033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b92, %hpstate
cpu_intr_2_82:
	setx	0x240038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829ca  ! 1036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
cpu_intr_2_83:
	setx	0x240328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_51:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 1038: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc458000  ! 1043: LDSW_R	ldsw	[%r22 + %r0], %r30
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, b)
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 37)
	.word 0xf68520bf  ! 1054: LDUWA_I	lduwa	[%r20, + 0x00bf] %asi, %r27
	.word 0xfc0d6164  ! 1057: LDUB_I	ldub	[%r21 + 0x0164], %r30
T2_asi_reg_wr_32:
	mov	0x16, %r14
	.word 0xfcf384a0  ! 1059: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf694a16d  ! 1061: LDUHA_I	lduha	[%r18, + 0x016d] %asi, %r27
	.word 0xfe0da15e  ! 1064: LDUB_I	ldub	[%r22 + 0x015e], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfe940020  ! 1071: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
T2_asi_reg_rd_52:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b12  ! 1076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b12, %hpstate
T2_asi_reg_wr_33:
	mov	0xd, %r14
	.word 0xfef38e80  ! 1077: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_34:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 1080: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_84:
	setx	0x240108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacda0c6  ! 1084: LDSBA_I	ldsba	[%r22, + 0x00c6] %asi, %r29
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_53:
	mov	0x19, %r14
	.word 0xf8db89e0  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_85:
	setx	0x26013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe14c000  ! 1093: OR_R	or 	%r19, %r0, %r31
T2_asi_reg_rd_54:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb60461d2  ! 1096: ADD_I	add 	%r17, 0x01d2, %r27
cpu_intr_2_86:
	setx	0x270336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 28)
	.word 0xfa8460ea  ! 1101: LDUWA_I	lduwa	[%r17, + 0x00ea] %asi, %r29
cpu_intr_2_87:
	setx	0x240315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf89421ab  ! 1103: LDUHA_I	lduha	[%r16, + 0x01ab] %asi, %r28
	ta	T_CHANGE_HPRIV
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 21)
	.word 0xf4cc208f  ! 1107: LDSBA_I	ldsba	[%r16, + 0x008f] %asi, %r26
	.word 0xfc5da18d  ! 1112: LDX_I	ldx	[%r22 + 0x018d], %r30
T2_asi_reg_rd_55:
	mov	0x25, %r14
	.word 0xf4db8e60  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_88:
	setx	0x26022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204a01c  ! 1117: LDUW_I	lduw	[%r18 + 0x001c], %r25
	.word 0xf2dc61fd  ! 1122: LDXA_I	ldxa	[%r17, + 0x01fd] %asi, %r25
cpu_intr_2_89:
	setx	0x240322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_35:
	mov	0x22, %r14
	.word 0xfaf38e80  ! 1132: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_36:
	mov	0x7, %r14
	.word 0xf4f389e0  ! 1135: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfe050000  ! 1136: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xf8d4c020  ! 1137: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
	.word 0xf014214a  ! 1138: LDUH_I	lduh	[%r16 + 0x014a], %r24
	.word 0xfa1561ca  ! 1139: LDUH_I	lduh	[%r21 + 0x01ca], %r29
cpu_intr_2_90:
	setx	0x25022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_91:
	setx	0x240221, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a8a  ! 1144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0xfcc54020  ! 1145: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
	.word 0xf05de1b9  ! 1147: LDX_I	ldx	[%r23 + 0x01b9], %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_56:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 1154: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfacce12c  ! 1158: LDSBA_I	ldsba	[%r19, + 0x012c] %asi, %r29
	.word 0xfe95a146  ! 1160: LDUHA_I	lduha	[%r22, + 0x0146] %asi, %r31
	.word 0xbe3d2136  ! 1165: XNOR_I	xnor 	%r20, 0x0136, %r31
	.word 0xf68cc020  ! 1166: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_92:
	setx	0x260205, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2dd60a6  ! 1177: LDXA_I	ldxa	[%r21, + 0x00a6] %asi, %r25
	.word 0xf8c52074  ! 1178: LDSWA_I	ldswa	[%r20, + 0x0074] %asi, %r28
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_93:
	setx	0x270200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_58:
	mov	0xb, %r14
	.word 0xf4db8e80  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_94:
	setx	0x24003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_95:
	setx	0x260334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_59:
	mov	0x2b, %r14
	.word 0xf4db8e40  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfadce188  ! 1188: LDXA_I	ldxa	[%r19, + 0x0188] %asi, %r29
	.word 0xf65c8000  ! 1190: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xf44cc000  ! 1191: LDSB_R	ldsb	[%r19 + %r0], %r26
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 11)
	.word 0xbeb521af  ! 1197: SUBCcc_I	orncc 	%r20, 0x01af, %r31
	.word 0xb6140000  ! 1198: OR_R	or 	%r16, %r0, %r27
T2_asi_reg_wr_37:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 1200: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0cd21fa  ! 1206: LDSBA_I	ldsba	[%r20, + 0x01fa] %asi, %r24
T2_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf0142049  ! 1212: LDUH_I	lduh	[%r16 + 0x0049], %r24
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfed560d7  ! 1220: LDSHA_I	ldsha	[%r21, + 0x00d7] %asi, %r31
	.word 0xfe94c020  ! 1224: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf68de05f  ! 1233: LDUBA_I	lduba	[%r23, + 0x005f] %asi, %r27
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 27)
	.word 0xf604e061  ! 1238: LDUW_I	lduw	[%r19 + 0x0061], %r27
T2_asi_reg_rd_61:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, a)
	.word 0xfecd601b  ! 1251: LDSBA_I	ldsba	[%r21, + 0x001b] %asi, %r31
	.word 0xfa946126  ! 1255: LDUHA_I	lduha	[%r17, + 0x0126] %asi, %r29
	.word 0xfc4cc000  ! 1257: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xfe450000  ! 1260: LDSW_R	ldsw	[%r20 + %r0], %r31
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_96:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_97:
	setx	0x270106, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_62:
	mov	0x3, %r14
	.word 0xf0db8e60  ! 1273: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 25)
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ada  ! 1275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ada, %hpstate
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6cca02b  ! 1278: LDSBA_I	ldsba	[%r18, + 0x002b] %asi, %r27
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_38:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 1286: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_39:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 1288: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_98:
	setx	0x24003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c4020  ! 1291: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_63:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb0a46150  ! 1295: SUBcc_I	subcc 	%r17, 0x0150, %r24
	.word 0xf65ca0b6  ! 1297: LDX_I	ldx	[%r18 + 0x00b6], %r27
	.word 0xf645a00d  ! 1299: LDSW_I	ldsw	[%r22 + 0x000d], %r27
T2_asi_reg_rd_64:
	mov	0x6, %r14
	.word 0xf0db8e80  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf6544000  ! 1303: LDSH_R	ldsh	[%r17 + %r0], %r27
T2_asi_reg_rd_65:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4d6072  ! 1306: LDSB_I	ldsb	[%r21 + 0x0072], %r29
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf005c000  ! 1310: LDUW_R	lduw	[%r23 + %r0], %r24
cpu_intr_2_99:
	setx	0x270100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8440000  ! 1313: LDSW_R	ldsw	[%r16 + %r0], %r28
cpu_intr_2_100:
	setx	0x24022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa84a1ff  ! 1319: LDUWA_I	lduwa	[%r18, + 0x01ff] %asi, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfa144000  ! 1323: LDUH_R	lduh	[%r17 + %r0], %r29
cpu_intr_2_101:
	setx	0x240324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe8c8020  ! 1331: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
	.word 0xf25dc000  ! 1333: LDX_R	ldx	[%r23 + %r0], %r25
cpu_intr_2_102:
	setx	0x260332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c0000  ! 1336: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xb7643801  ! 1337: MOVcc_I	<illegal instruction>
cpu_intr_2_103:
	setx	0x27032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c4e19a  ! 1339: LDSWA_I	ldswa	[%r19, + 0x019a] %asi, %r26
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, c)
	.word 0xfe442061  ! 1342: LDSW_I	ldsw	[%r16 + 0x0061], %r31
T2_asi_reg_rd_66:
	mov	0x31, %r14
	.word 0xfcdb89e0  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf28c61a6  ! 1346: LDUBA_I	lduba	[%r17, + 0x01a6] %asi, %r25
	.word 0xb5356001  ! 1348: SRL_I	srl 	%r21, 0x0001, %r26
	.word 0xf08ce1a9  ! 1349: LDUBA_I	lduba	[%r19, + 0x01a9] %asi, %r24
	.word 0xfed48020  ! 1350: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
T2_asi_reg_rd_67:
	mov	0x2b, %r14
	.word 0xfedb8400  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_104:
	setx	0x240133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_68:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 1353: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf00da059  ! 1355: LDUB_I	ldub	[%r22 + 0x0059], %r24
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_40:
	mov	0x27, %r14
	.word 0xf8f384a0  ! 1357: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf05ca0b7  ! 1359: LDX_I	ldx	[%r18 + 0x00b7], %r24
	.word 0xf28460af  ! 1361: LDUWA_I	lduwa	[%r17, + 0x00af] %asi, %r25
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_105:
	setx	0x27010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_106:
	setx	0x27003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_107:
	setx	0x240119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_108:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd4000  ! 1372: XNORcc_R	xnorcc 	%r21, %r0, %r25
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_109:
	setx	0x27022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_HPRIV
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 17)
	.word 0xfa5cc000  ! 1380: LDX_R	ldx	[%r19 + %r0], %r29
cpu_intr_2_110:
	setx	0x240233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_111:
	setx	0x26031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_41:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 1383: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_wr_42:
	mov	0x29, %r14
	.word 0xfef38e40  ! 1384: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_112:
	setx	0x240237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 34)
	.word 0xfa14a0d0  ! 1389: LDUH_I	lduh	[%r18 + 0x00d0], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, e)
	.word 0xb694e14d  ! 1405: ORcc_I	orcc 	%r19, 0x014d, %r27
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe454000  ! 1411: LDSW_R	ldsw	[%r21 + %r0], %r31
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfe5ca134  ! 1413: LDX_I	ldx	[%r18 + 0x0134], %r31
cpu_intr_2_113:
	setx	0x2a0304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_69:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 1417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_70:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_114:
	setx	0x280238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec52037  ! 1423: LDSWA_I	ldswa	[%r20, + 0x0037] %asi, %r31
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 8)
	.word 0xf2d44020  ! 1425: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
T2_asi_reg_rd_71:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb6c58000  ! 1427: ADDCcc_R	addccc 	%r22, %r0, %r27
	.word 0xfa45a070  ! 1428: LDSW_I	ldsw	[%r22 + 0x0070], %r29
	.word 0xfcd560e5  ! 1431: LDSHA_I	ldsha	[%r21, + 0x00e5] %asi, %r30
cpu_intr_2_115:
	setx	0x29030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3355000  ! 1433: SRLX_R	srlx	%r21, %r0, %r25
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_116:
	setx	0x280336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_117:
	setx	0x290204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_72:
	mov	0x34, %r14
	.word 0xf2db84a0  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_43:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 1450: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf4d4c020  ! 1455: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
cpu_intr_2_118:
	setx	0x290218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dda062  ! 1458: LDXA_I	ldxa	[%r22, + 0x0062] %asi, %r28
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_44:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 1461: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 12)
	.word 0xf68cc020  ! 1465: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	.word 0xf005c000  ! 1468: LDUW_R	lduw	[%r23 + %r0], %r24
cpu_intr_2_119:
	setx	0x2b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf44d8000  ! 1477: LDSB_R	ldsb	[%r22 + %r0], %r26
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 37)
	.word 0xfc852035  ! 1480: LDUWA_I	lduwa	[%r20, + 0x0035] %asi, %r30
cpu_intr_2_120:
	setx	0x28002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_45:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 1488: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_73:
	mov	0x37, %r14
	.word 0xfadb8400  ! 1489: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_121:
	setx	0x280223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_122:
	setx	0x280021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28cc000  ! 1492: ANDcc_R	andcc 	%r19, %r0, %r25
	.word 0xfa4cc000  ! 1493: LDSB_R	ldsb	[%r19 + %r0], %r29
cpu_intr_2_123:
	setx	0x28020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_124:
	setx	0x2b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85c020  ! 1499: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, b)
	.word 0xf0044000  ! 1503: LDUW_R	lduw	[%r17 + %r0], %r24
	.word 0xfe05c000  ! 1504: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xfc140000  ! 1505: LDUH_R	lduh	[%r16 + %r0], %r30
cpu_intr_2_125:
	setx	0x290037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04dc000  ! 1509: LDSB_R	ldsb	[%r23 + %r0], %r24
T2_asi_reg_wr_46:
	mov	0x13, %r14
	.word 0xfcf38e80  ! 1510: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbc3520bc  ! 1513: SUBC_I	orn 	%r20, 0x00bc, %r30
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, c)
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, a)
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 3c)
	.word 0xbe8d8000  ! 1527: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xf24dc000  ! 1528: LDSB_R	ldsb	[%r23 + %r0], %r25
T2_asi_reg_wr_47:
	mov	0x12, %r14
	.word 0xf2f389e0  ! 1529: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 10)
	.word 0xf4c4216b  ! 1533: LDSWA_I	ldswa	[%r16, + 0x016b] %asi, %r26
cpu_intr_2_126:
	setx	0x2b0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_74:
	mov	0xd, %r14
	.word 0xfedb89e0  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 13)
	.word 0xb5354000  ! 1539: SRL_R	srl 	%r21, %r0, %r26
	.word 0xf005e066  ! 1540: LDUW_I	lduw	[%r23 + 0x0066], %r24
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_75:
	mov	0x34, %r14
	.word 0xf4db89e0  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbd342001  ! 1547: SRL_I	srl 	%r16, 0x0001, %r30
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 4)
	.word 0xfed5c020  ! 1551: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xb7354000  ! 1553: SRL_R	srl 	%r21, %r0, %r27
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_127:
	setx	0x28001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c4217d  ! 1561: LDSWA_I	ldswa	[%r16, + 0x017d] %asi, %r27
	ta	T_CHANGE_HPRIV
	.word 0xfc8d0020  ! 1565: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_76:
	mov	0x27, %r14
	.word 0xfcdb84a0  ! 1567: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf08c2131  ! 1568: LDUBA_I	lduba	[%r16, + 0x0131] %asi, %r24
	.word 0xf0cc8020  ! 1570: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 20)
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982910  ! 1573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0910, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf605a106  ! 1575: LDUW_I	lduw	[%r22 + 0x0106], %r27
	.word 0xbd518000  ! 1577: RDPR_PSTATE	<illegal instruction>
cpu_intr_2_128:
	setx	0x280214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54c000  ! 1583: LDSH_R	ldsh	[%r19 + %r0], %r29
	ta	T_CHANGE_TO_TL1
cpu_intr_2_129:
	setx	0x2b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455e1cf  ! 1594: LDSH_I	ldsh	[%r23 + 0x01cf], %r26
	.word 0xb4244000  ! 1595: SUB_R	sub 	%r17, %r0, %r26
cpu_intr_2_130:
	setx	0x28030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf2cc4020  ! 1607: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_48:
	mov	0x36, %r14
	.word 0xfcf384a0  ! 1609: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb4a40000  ! 1610: SUBcc_R	subcc 	%r16, %r0, %r26
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf25dc000  ! 1617: LDX_R	ldx	[%r23 + %r0], %r25
T2_asi_reg_rd_77:
	mov	0xa, %r14
	.word 0xfedb8e60  ! 1619: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_49:
	mov	0x13, %r14
	.word 0xf6f384a0  ! 1622: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_50:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 1623: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe94a05d  ! 1625: LDUHA_I	lduha	[%r18, + 0x005d] %asi, %r31
	.word 0xf0944020  ! 1627: LDUHA_R	lduha	[%r17, %r0] 0x01, %r24
cpu_intr_2_131:
	setx	0x28031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc15a0de  ! 1630: LDUH_I	lduh	[%r22 + 0x00de], %r30
	.word 0xbc358000  ! 1631: ORN_R	orn 	%r22, %r0, %r30
	.word 0xf284a1f6  ! 1634: LDUWA_I	lduwa	[%r18, + 0x01f6] %asi, %r25
T2_asi_reg_rd_78:
	mov	0x17, %r14
	.word 0xfedb84a0  ! 1635: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_132:
	setx	0x2b0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec52065  ! 1638: LDSWA_I	ldswa	[%r20, + 0x0065] %asi, %r31
cpu_intr_2_133:
	setx	0x290114, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_79:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	.word 0xfe05c000  ! 1647: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf25d60df  ! 1651: LDX_I	ldx	[%r21 + 0x00df], %r25
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 18)
	.word 0xfc0ce14f  ! 1656: LDUB_I	ldub	[%r19 + 0x014f], %r30
T2_asi_reg_rd_80:
	mov	0xf, %r14
	.word 0xf0db84a0  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_81:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf64c61ad  ! 1660: LDSB_I	ldsb	[%r17 + 0x01ad], %r27
	.word 0xb97d8400  ! 1661: MOVR_R	movre	%r22, %r0, %r28
	.word 0xf844e0f0  ! 1663: LDSW_I	ldsw	[%r19 + 0x00f0], %r28
	.word 0xf0d46133  ! 1667: LDSHA_I	ldsha	[%r17, + 0x0133] %asi, %r24
	.word 0xf6054000  ! 1670: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xfa4c6177  ! 1672: LDSB_I	ldsb	[%r17 + 0x0177], %r29
	.word 0xfc048000  ! 1673: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xb23ce18b  ! 1675: XNOR_I	xnor 	%r19, 0x018b, %r25
	.word 0xb334b001  ! 1676: SRLX_I	srlx	%r18, 0x0001, %r25
	.word 0xfe4c8000  ! 1679: LDSB_R	ldsb	[%r18 + %r0], %r31
	ta	T_CHANGE_TO_TL1
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_82:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 1683: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982ac0  ! 1685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac0, %hpstate
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_51:
	mov	0x5, %r14
	.word 0xf6f38e60  ! 1688: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb2248000  ! 1693: SUB_R	sub 	%r18, %r0, %r25
T2_asi_reg_wr_52:
	mov	0x38, %r14
	.word 0xfef38e60  ! 1695: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfec48020  ! 1698: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	.word 0xf8dc61dc  ! 1702: LDXA_I	ldxa	[%r17, + 0x01dc] %asi, %r28
	.word 0xf08461ef  ! 1705: LDUWA_I	lduwa	[%r17, + 0x01ef] %asi, %r24
	.word 0xf20ca1ed  ! 1706: LDUB_I	ldub	[%r18 + 0x01ed], %r25
	.word 0x919461e0  ! 1707: WRPR_PIL_I	wrpr	%r17, 0x01e0, %pil
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, d)
	.word 0xf244e0c1  ! 1714: LDSW_I	ldsw	[%r19 + 0x00c1], %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xbd3c4000  ! 1717: SRA_R	sra 	%r17, %r0, %r30
	.word 0xf64c0000  ! 1725: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xf4144000  ! 1728: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xbcb4a1cb  ! 1729: SUBCcc_I	orncc 	%r18, 0x01cb, %r30
	.word 0xf0558000  ! 1730: LDSH_R	ldsh	[%r22 + %r0], %r24
T2_asi_reg_rd_83:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 20)
	.word 0xf895210e  ! 1737: LDUHA_I	lduha	[%r20, + 0x010e] %asi, %r28
	.word 0xf0046035  ! 1741: LDUW_I	lduw	[%r17 + 0x0035], %r24
cpu_intr_2_134:
	setx	0x2b023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2546144  ! 1743: LDSH_I	ldsh	[%r17 + 0x0144], %r25
T2_asi_reg_wr_53:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 1746: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_54:
	mov	0x12, %r14
	.word 0xfef389e0  ! 1748: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_55:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1753: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_135:
	setx	0x2a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_136:
	setx	0x2b0227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_137:
	setx	0x2a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_56:
	mov	0x15, %r14
	.word 0xf0f38e80  ! 1765: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf684a1b2  ! 1766: LDUWA_I	lduwa	[%r18, + 0x01b2] %asi, %r27
	.word 0xf85d8000  ! 1767: LDX_R	ldx	[%r22 + %r0], %r28
cpu_intr_2_138:
	setx	0x290027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf2940020  ! 1774: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xfa8c60ea  ! 1776: LDUBA_I	lduba	[%r17, + 0x00ea] %asi, %r29
	.word 0xf6d5e18e  ! 1777: LDSHA_I	ldsha	[%r23, + 0x018e] %asi, %r27
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 38)
	.word 0xf88c2117  ! 1779: LDUBA_I	lduba	[%r16, + 0x0117] %asi, %r28
T2_asi_reg_wr_57:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 1782: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_84:
	mov	0xf, %r14
	.word 0xfedb8400  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf2d4e095  ! 1784: LDSHA_I	ldsha	[%r19, + 0x0095] %asi, %r25
	.word 0xb045c000  ! 1787: ADDC_R	addc 	%r23, %r0, %r24
	.word 0xfa0d4000  ! 1788: LDUB_R	ldub	[%r21 + %r0], %r29
T2_asi_reg_wr_58:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 1793: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbe0da09c  ! 1794: AND_I	and 	%r22, 0x009c, %r31
cpu_intr_2_139:
	setx	0x2a0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_85:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf45ca1b8  ! 1801: LDX_I	ldx	[%r18 + 0x01b8], %r26
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_140:
	setx	0x290316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404606f  ! 1807: LDUW_I	lduw	[%r17 + 0x006f], %r26
	.word 0xbc04a0e2  ! 1810: ADD_I	add 	%r18, 0x00e2, %r30
T2_asi_reg_wr_59:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 1813: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfe14c000  ! 1814: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xfe558000  ! 1817: LDSH_R	ldsh	[%r22 + %r0], %r31
T2_asi_reg_rd_86:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 1819: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfe85c020  ! 1820: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
cpu_intr_2_141:
	setx	0x28021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_87:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe5561c9  ! 1823: LDSH_I	ldsh	[%r21 + 0x01c9], %r31
cpu_intr_2_142:
	setx	0x290109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_143:
	setx	0x280121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf540000  ! 1826: RDPR_GL	<illegal instruction>
	.word 0xfa5d2026  ! 1831: LDX_I	ldx	[%r20 + 0x0026], %r29
	.word 0xfcd4a011  ! 1835: LDSHA_I	ldsha	[%r18, + 0x0011] %asi, %r30
	.word 0xf60c4000  ! 1838: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfe444000  ! 1840: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xfe0c0000  ! 1841: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xb01521c5  ! 1843: OR_I	or 	%r20, 0x01c5, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_60:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 1851: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfe95c020  ! 1854: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xfa45214a  ! 1856: LDSW_I	ldsw	[%r20 + 0x014a], %r29
T2_asi_reg_wr_61:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 1859: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf694a04f  ! 1860: LDUHA_I	lduha	[%r18, + 0x004f] %asi, %r27
T2_asi_reg_wr_62:
	mov	0x22, %r14
	.word 0xfaf384a0  ! 1862: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfaccc020  ! 1864: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_63:
	mov	0x2b, %r14
	.word 0xf0f38400  ! 1867: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xfc454000  ! 1869: LDSW_R	ldsw	[%r21 + %r0], %r30
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d00  ! 1874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
	.word 0xf8cca0c9  ! 1875: LDSBA_I	ldsba	[%r18, + 0x00c9] %asi, %r28
	.word 0xfec4c020  ! 1878: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xf0148000  ! 1879: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf64d8000  ! 1880: LDSB_R	ldsb	[%r22 + %r0], %r27
cpu_intr_2_144:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_145:
	setx	0x2c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 17)
	.word 0xfa8461f2  ! 1888: LDUWA_I	lduwa	[%r17, + 0x01f2] %asi, %r29
T2_asi_reg_rd_88:
	mov	0x24, %r14
	.word 0xf8db84a0  ! 1890: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe95a182  ! 1891: LDUHA_I	lduha	[%r22, + 0x0182] %asi, %r31
	.word 0xf8540000  ! 1892: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xbb3d4000  ! 1894: SRA_R	sra 	%r21, %r0, %r29
	.word 0xf4044000  ! 1898: LDUW_R	lduw	[%r17 + %r0], %r26
cpu_intr_2_146:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68da054  ! 1900: LDUBA_I	lduba	[%r22, + 0x0054] %asi, %r27
	.word 0xfa4de056  ! 1904: LDSB_I	ldsb	[%r23 + 0x0056], %r29
	.word 0xf685616c  ! 1905: LDUWA_I	lduwa	[%r21, + 0x016c] %asi, %r27
T2_asi_reg_wr_64:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 1909: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_147:
	setx	0x2f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6440000  ! 1918: ADDC_R	addc 	%r16, %r0, %r27
cpu_intr_2_148:
	setx	0x2d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf255a1da  ! 1922: LDSH_I	ldsh	[%r22 + 0x01da], %r25
cpu_intr_2_149:
	setx	0x2c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 3d)
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983bc8  ! 1929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc8, %hpstate
T2_asi_reg_rd_89:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe948020  ! 1932: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
T2_asi_reg_rd_90:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc15e194  ! 1937: LDUH_I	lduh	[%r23 + 0x0194], %r30
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_91:
	mov	0x1, %r14
	.word 0xf6db8400  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_65:
	mov	0x27, %r14
	.word 0xf8f389e0  ! 1945: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_rd_92:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 1946: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 24)
	.word 0xfe5da043  ! 1949: LDX_I	ldx	[%r22 + 0x0043], %r31
cpu_intr_2_150:
	setx	0x2e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d2088  ! 1952: LDX_I	ldx	[%r20 + 0x0088], %r30
cpu_intr_2_151:
	setx	0x2f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455e1a2  ! 1956: LDSH_I	ldsh	[%r23 + 0x01a2], %r26
T2_asi_reg_wr_66:
	mov	0x5, %r14
	.word 0xf8f38e40  ! 1958: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0446002  ! 1959: LDSW_I	ldsw	[%r17 + 0x0002], %r24
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 2d)
	.word 0xbf7c4400  ! 1962: MOVR_R	movre	%r17, %r0, %r31
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_93:
	mov	0x12, %r14
	.word 0xf8db89e0  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf855e10a  ! 1972: LDSH_I	ldsh	[%r23 + 0x010a], %r28
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfc4da0f8  ! 1976: LDSB_I	ldsb	[%r22 + 0x00f8], %r30
T2_asi_reg_rd_94:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfc5d8000  ! 1982: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xb834a09f  ! 1985: SUBC_I	orn 	%r18, 0x009f, %r28
	.word 0xf00cc000  ! 1986: LDUB_R	ldub	[%r19 + %r0], %r24
T2_asi_reg_rd_95:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 10)
	.word 0xf80d215e  ! 1991: LDUB_I	ldub	[%r20 + 0x015e], %r28
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_67:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 2001: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_96:
	mov	0x1e, %r14
	.word 0xfcdb8400  ! 2003: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb4a5610d  ! 2005: SUBcc_I	subcc 	%r21, 0x010d, %r26
T2_asi_reg_wr_68:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 2007: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_97:
	mov	0x25, %r14
	.word 0xf4db89e0  ! 2008: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_98:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 2009: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe4d0000  ! 2010: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xfc0520ef  ! 2013: LDUW_I	lduw	[%r20 + 0x00ef], %r30
	.word 0xf4444000  ! 2016: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xf60c0000  ! 2017: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xf65dc000  ! 2019: LDX_R	ldx	[%r23 + %r0], %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_69:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 2026: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf294c020  ! 2031: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_152:
	setx	0x2e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfe040000  ! 2036: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xfac44020  ! 2039: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
	.word 0xfedce1fe  ! 2041: LDXA_I	ldxa	[%r19, + 0x01fe] %asi, %r31
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 30)
	.word 0xf8cde0ca  ! 2054: LDSBA_I	ldsba	[%r23, + 0x00ca] %asi, %r28
	.word 0xf8c52059  ! 2055: LDSWA_I	ldswa	[%r20, + 0x0059] %asi, %r28
	.word 0xfedda1b7  ! 2057: LDXA_I	ldxa	[%r22, + 0x01b7] %asi, %r31
	.word 0xf845c000  ! 2058: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xfe15e1e4  ! 2061: LDUH_I	lduh	[%r23 + 0x01e4], %r31
	ta	T_CHANGE_TO_TL1
	.word 0xb13d6001  ! 2064: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xf45ce0c2  ! 2065: LDX_I	ldx	[%r19 + 0x00c2], %r26
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfe05c000  ! 2069: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xfa44e111  ! 2070: LDSW_I	ldsw	[%r19 + 0x0111], %r29
T2_asi_reg_rd_99:
	mov	0x26, %r14
	.word 0xf8db8400  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_70:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2073: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb0ade19b  ! 2074: ANDNcc_I	andncc 	%r23, 0x019b, %r24
	.word 0xf005c000  ! 2075: LDUW_R	lduw	[%r23 + %r0], %r24
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_153:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc4a0d8  ! 2082: LDSWA_I	ldswa	[%r18, + 0x00d8] %asi, %r30
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f52  ! 2083: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f52, %hpstate
T2_asi_reg_rd_100:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 2089: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_101:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 2090: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_71:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 2091: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfcd58020  ! 2095: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf2940020  ! 2097: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xbaad0000  ! 2098: ANDNcc_R	andncc 	%r20, %r0, %r29
cpu_intr_2_154:
	setx	0x2e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf454a019  ! 2101: LDSH_I	ldsh	[%r18 + 0x0019], %r26
	.word 0xf6cd8020  ! 2103: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
	.word 0xbb2dc000  ! 2104: SLL_R	sll 	%r23, %r0, %r29
T2_asi_reg_rd_102:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf4040000  ! 2108: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xfc5d6017  ! 2109: LDX_I	ldx	[%r21 + 0x0017], %r30
	.word 0xf0548000  ! 2111: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xb734d000  ! 2116: SRLX_R	srlx	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_155:
	setx	0x2e013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_103:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 2127: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 38)
	.word 0xf28d8020  ! 2134: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xf44d4000  ! 2139: LDSB_R	ldsb	[%r21 + %r0], %r26
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982cca  ! 2140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
T2_asi_reg_rd_104:
	mov	0x7, %r14
	.word 0xf6db89e0  ! 2141: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_156:
	setx	0x2c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d40  ! 2145: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d40, %hpstate
	.word 0xfc94e1b6  ! 2147: LDUHA_I	lduha	[%r19, + 0x01b6] %asi, %r30
	.word 0xbebca111  ! 2148: XNORcc_I	xnorcc 	%r18, 0x0111, %r31
T2_asi_reg_wr_72:
	mov	0x1a, %r14
	.word 0xfaf38400  ! 2149: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb73d4000  ! 2150: SRA_R	sra 	%r21, %r0, %r27
	.word 0xfacd0020  ! 2152: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d1a  ! 2155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d1a, %hpstate
T2_asi_reg_rd_105:
	mov	0x29, %r14
	.word 0xf0db8e80  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xfe5ce076  ! 2163: LDX_I	ldx	[%r19 + 0x0076], %r31
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_157:
	setx	0x2e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dc2165  ! 2172: LDXA_I	ldxa	[%r16, + 0x0165] %asi, %r24
	ta	T_CHANGE_TO_TL0
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_158:
	setx	0x2d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad8000  ! 2181: ANDNcc_R	andncc 	%r22, %r0, %r29
T2_asi_reg_rd_106:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb40ce11d  ! 2183: AND_I	and 	%r19, 0x011d, %r26
T2_asi_reg_wr_73:
	mov	0x2b, %r14
	.word 0xfaf38e60  ! 2184: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf844e0aa  ! 2185: LDSW_I	ldsw	[%r19 + 0x00aa], %r28
	.word 0xb335e001  ! 2186: SRL_I	srl 	%r23, 0x0001, %r25
	.word 0xf88c0020  ! 2190: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
cpu_intr_2_159:
	setx	0x3010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_160:
	setx	0x2e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20d4000  ! 2195: LDUB_R	ldub	[%r21 + %r0], %r25
cpu_intr_2_161:
	setx	0x2c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_107:
	mov	0x2c, %r14
	.word 0xf4db8e40  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 39)
	.word 0xf205e15f  ! 2203: LDUW_I	lduw	[%r23 + 0x015f], %r25
T2_asi_reg_rd_108:
	mov	0x30, %r14
	.word 0xfcdb84a0  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf68c8020  ! 2206: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	.word 0xfec5a047  ! 2207: LDSWA_I	ldswa	[%r22, + 0x0047] %asi, %r31
cpu_intr_2_162:
	setx	0x2d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d8020  ! 2213: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
	.word 0xf00d20f2  ! 2214: LDUB_I	ldub	[%r20 + 0x00f2], %r24
	.word 0xf88d61ec  ! 2215: LDUBA_I	lduba	[%r21, + 0x01ec] %asi, %r28
	.word 0xf6cd215a  ! 2219: LDSBA_I	ldsba	[%r20, + 0x015a] %asi, %r27
cpu_intr_2_163:
	setx	0x2c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_109:
	mov	0x1f, %r14
	.word 0xfcdb89e0  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_110:
	mov	0x4, %r14
	.word 0xf0db89e0  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf0954020  ! 2228: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
	.word 0xf44da0c3  ! 2232: LDSB_I	ldsb	[%r22 + 0x00c3], %r26
cpu_intr_2_164:
	setx	0x2e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfa4c6029  ! 2237: LDSB_I	ldsb	[%r17 + 0x0029], %r29
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_165:
	setx	0x2e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_74:
	mov	0xc, %r14
	.word 0xf6f38e40  ! 2259: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_166:
	setx	0x2c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_75:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 2266: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe5da0fc  ! 2267: LDX_I	ldx	[%r22 + 0x00fc], %r31
cpu_intr_2_167:
	setx	0x2f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 6)
	.word 0xfacd21d7  ! 2270: LDSBA_I	ldsba	[%r20, + 0x01d7] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0442115  ! 2277: LDSW_I	ldsw	[%r16 + 0x0115], %r24
T2_asi_reg_rd_111:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 2278: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_wr_76:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2279: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe0ca06d  ! 2280: LDUB_I	ldub	[%r18 + 0x006d], %r31
T2_asi_reg_rd_112:
	mov	0xa, %r14
	.word 0xf8db8e60  ! 2281: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf40c0000  ! 2282: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xb52cd000  ! 2283: SLLX_R	sllx	%r19, %r0, %r26
cpu_intr_2_168:
	setx	0x2c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4850020  ! 2287: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
cpu_intr_2_169:
	setx	0x2c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3346001  ! 2290: SRL_I	srl 	%r17, 0x0001, %r25
	.word 0xfc8c0020  ! 2292: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	.word 0xf04d8000  ! 2294: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf2c40020  ! 2295: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xfac42098  ! 2297: LDSWA_I	ldswa	[%r16, + 0x0098] %asi, %r29
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_170:
	setx	0x2c0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6850000  ! 2301: ADDcc_R	addcc 	%r20, %r0, %r27
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 7)
	.word 0xf4550000  ! 2303: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xbe04e1e1  ! 2304: ADD_I	add 	%r19, 0x01e1, %r31
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 12)
	.word 0xfed50020  ! 2309: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r31
	.word 0xbe85e17a  ! 2310: ADDcc_I	addcc 	%r23, 0x017a, %r31
T2_asi_reg_rd_113:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 2312: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6448000  ! 2313: LDSW_R	ldsw	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0xf2d560f5  ! 2318: LDSHA_I	ldsha	[%r21, + 0x00f5] %asi, %r25
T2_asi_reg_wr_77:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2319: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_171:
	setx	0x300107, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb29c4000  ! 2328: XORcc_R	xorcc 	%r17, %r0, %r25
T2_asi_reg_wr_78:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 2329: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_79:
	mov	0x6, %r14
	.word 0xf4f384a0  ! 2330: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_172:
	setx	0x320107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4c000  ! 2332: SUBCcc_R	orncc 	%r19, %r0, %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_114:
	mov	0x37, %r14
	.word 0xfcdb89e0  ! 2335: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 25)
	.word 0xf40d8000  ! 2337: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xbd520000  ! 2338: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfe544000  ! 2342: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf28d8020  ! 2344: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xf8458000  ! 2345: LDSW_R	ldsw	[%r22 + %r0], %r28
T2_asi_reg_rd_115:
	mov	0x3, %r14
	.word 0xf2db8400  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb6b48000  ! 2350: SUBCcc_R	orncc 	%r18, %r0, %r27
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, c)
	.word 0xfc040000  ! 2353: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf205a0d0  ! 2355: LDUW_I	lduw	[%r22 + 0x00d0], %r25
	.word 0xfedda1a0  ! 2358: LDXA_I	ldxa	[%r22, + 0x01a0] %asi, %r31
T2_asi_reg_wr_80:
	mov	0x2b, %r14
	.word 0xf0f38e80  ! 2359: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_173:
	setx	0x320212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_174:
	setx	0x30030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe558000  ! 2362: LDSH_R	ldsh	[%r22 + %r0], %r31
cpu_intr_2_175:
	setx	0x310319, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_81:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 2365: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb295e191  ! 2367: ORcc_I	orcc 	%r23, 0x0191, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf08cc020  ! 2373: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
	.word 0xfa8de189  ! 2377: LDUBA_I	lduba	[%r23, + 0x0189] %asi, %r29
	.word 0xb61c4000  ! 2383: XOR_R	xor 	%r17, %r0, %r27
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, e)
	.word 0xfa4c60e7  ! 2385: LDSB_I	ldsb	[%r17 + 0x00e7], %r29
	.word 0xf0156195  ! 2386: LDUH_I	lduh	[%r21 + 0x0195], %r24
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982998  ! 2390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, c)
	.word 0xfe14a064  ! 2395: LDUH_I	lduh	[%r18 + 0x0064], %r31
	.word 0xf8d58020  ! 2397: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
cpu_intr_2_176:
	setx	0x320223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_177:
	setx	0x31003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a4a  ! 2401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
T2_asi_reg_wr_82:
	mov	0x12, %r14
	.word 0xf8f38400  ! 2403: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_116:
	mov	0x14, %r14
	.word 0xf4db8e80  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf68d4020  ! 2406: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
	.word 0xb8a44000  ! 2409: SUBcc_R	subcc 	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf215e1e2  ! 2413: LDUH_I	lduh	[%r23 + 0x01e2], %r25
T2_asi_reg_rd_117:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 2414: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_118:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbc3560b1  ! 2418: SUBC_I	orn 	%r21, 0x00b1, %r30
T2_asi_reg_rd_119:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_83:
	mov	0x1b, %r14
	.word 0xfef384a0  ! 2424: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_84:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 2426: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf2d52018  ! 2430: LDSHA_I	ldsha	[%r20, + 0x0018] %asi, %r25
	.word 0xbc3c60b3  ! 2433: XNOR_I	xnor 	%r17, 0x00b3, %r30
	.word 0xf615e109  ! 2434: LDUH_I	lduh	[%r23 + 0x0109], %r27
	.word 0xf05d4000  ! 2435: LDX_R	ldx	[%r21 + %r0], %r24
T2_asi_reg_rd_120:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 2437: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfecd0020  ! 2438: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
T2_asi_reg_rd_121:
	mov	0x17, %r14
	.word 0xfadb8400  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf814c000  ! 2451: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf45d2130  ! 2463: LDX_I	ldx	[%r20 + 0x0130], %r26
cpu_intr_2_178:
	setx	0x330323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2cb001  ! 2469: SLLX_I	sllx	%r18, 0x0001, %r30
	.word 0xf4546040  ! 2470: LDSH_I	ldsh	[%r17 + 0x0040], %r26
	.word 0xf0140000  ! 2471: LDUH_R	lduh	[%r16 + %r0], %r24
cpu_intr_2_179:
	setx	0x32012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbd341000  ! 2479: SRLX_R	srlx	%r16, %r0, %r30
T2_asi_reg_wr_85:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 2480: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf285e0a4  ! 2481: LDUWA_I	lduwa	[%r23, + 0x00a4] %asi, %r25
	.word 0xf45ca06d  ! 2483: LDX_I	ldx	[%r18 + 0x006d], %r26
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_86:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 2486: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_180:
	setx	0x330006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe150000  ! 2489: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xfc858020  ! 2490: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL0
cpu_intr_2_181:
	setx	0x30010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2550000  ! 2496: LDSH_R	ldsh	[%r20 + %r0], %r25
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_182:
	setx	0x310020, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_122:
	mov	0x22, %r14
	.word 0xf6db8e40  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_183:
	setx	0x32003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa558000  ! 2506: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf214a081  ! 2508: LDUH_I	lduh	[%r18 + 0x0081], %r25
	.word 0xfc448000  ! 2509: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf804608c  ! 2510: LDUW_I	lduw	[%r17 + 0x008c], %r28
cpu_intr_2_184:
	setx	0x300312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88cc020  ! 2512: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
	.word 0xb204e097  ! 2513: ADD_I	add 	%r19, 0x0097, %r25
	.word 0xf08cc020  ! 2514: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_87:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 2515: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_wr_88:
	mov	0x5, %r14
	.word 0xf0f384a0  ! 2516: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_185:
	setx	0x330033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb54000  ! 2520: SUBCcc_R	orncc 	%r21, %r0, %r31
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa844020  ! 2524: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
	.word 0xf455e058  ! 2525: LDSH_I	ldsh	[%r23 + 0x0058], %r26
cpu_intr_2_186:
	setx	0x320233, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982882  ! 2531: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0882, %hpstate
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb2bc4000  ! 2533: XNORcc_R	xnorcc 	%r17, %r0, %r25
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 1)
	.word 0xf4dce13d  ! 2537: LDXA_I	ldxa	[%r19, + 0x013d] %asi, %r26
T2_asi_reg_rd_123:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_89:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 2546: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb24521b3  ! 2547: ADDC_I	addc 	%r20, 0x01b3, %r25
T2_asi_reg_rd_124:
	mov	0x38, %r14
	.word 0xf0db8400  ! 2548: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_187:
	setx	0x310302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_125:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf0140000  ! 2555: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xfe4d60b4  ! 2556: LDSB_I	ldsb	[%r21 + 0x00b4], %r31
T2_asi_reg_rd_126:
	mov	0x2a, %r14
	.word 0xf8db8400  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfc154000  ! 2561: LDUH_R	lduh	[%r21 + %r0], %r30
cpu_intr_2_188:
	setx	0x300307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_127:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 2565: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_189:
	setx	0x320030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cdc020  ! 2570: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
	.word 0xf8cc6105  ! 2573: LDSBA_I	ldsba	[%r17, + 0x0105] %asi, %r28
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_90:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 2575: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_wr_91:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 2578: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbeada006  ! 2579: ANDNcc_I	andncc 	%r22, 0x0006, %r31
T2_asi_reg_wr_92:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2580: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfedca0db  ! 2581: LDXA_I	ldxa	[%r18, + 0x00db] %asi, %r31
cpu_intr_2_190:
	setx	0x330027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf485e009  ! 2584: LDUWA_I	lduwa	[%r23, + 0x0009] %asi, %r26
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 28)
	.word 0xb52ce001  ! 2586: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xfecc8020  ! 2588: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
	.word 0xbcb50000  ! 2590: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xf0144000  ! 2592: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf415a12b  ! 2593: LDUH_I	lduh	[%r22 + 0x012b], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c48020  ! 2595: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xf4850020  ! 2596: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_93:
	mov	0x1, %r14
	.word 0xfaf38e80  ! 2597: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf2c5a0b0  ! 2598: LDSWA_I	ldswa	[%r22, + 0x00b0] %asi, %r25
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_94:
	mov	0x12, %r14
	.word 0xf2f38e80  ! 2604: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf64c4000  ! 2607: LDSB_R	ldsb	[%r17 + %r0], %r27
T2_asi_reg_rd_128:
	mov	0x2b, %r14
	.word 0xfedb8e60  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_191:
	setx	0x320321, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829ca  ! 2614: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
	.word 0xbb7c4400  ! 2616: MOVR_R	movre	%r17, %r0, %r29
	.word 0x8394201d  ! 2617: WRPR_TNPC_I	wrpr	%r16, 0x001d, %tnpc
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829c0  ! 2618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xfec44020  ! 2621: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xf0cc4020  ! 2622: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_192:
	setx	0x320206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf6c48020  ! 2635: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0c520ab  ! 2639: LDSWA_I	ldswa	[%r20, + 0x00ab] %asi, %r24
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_95:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 2645: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_96:
	mov	0x2d, %r14
	.word 0xf2f38400  ! 2647: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfcc4c020  ! 2649: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
	.word 0xfcc40020  ! 2650: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
cpu_intr_2_193:
	setx	0x310031, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfa14603a  ! 2653: LDUH_I	lduh	[%r17 + 0x003a], %r29
T2_asi_reg_wr_97:
	mov	0x5, %r14
	.word 0xf4f38e40  ! 2657: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0552076  ! 2662: LDSH_I	ldsh	[%r20 + 0x0076], %r24
cpu_intr_2_194:
	setx	0x330015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, b)
	.word 0xb0c44000  ! 2667: ADDCcc_R	addccc 	%r17, %r0, %r24
	.word 0xf44cc000  ! 2668: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0x8f902001  ! 2671: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cpu_intr_2_195:
	setx	0x32030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0050000  ! 2673: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xfa54a1ee  ! 2674: LDSH_I	ldsh	[%r18 + 0x01ee], %r29
	.word 0xfe444000  ! 2676: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf0c4c020  ! 2679: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r24
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 1c)
	.word 0xb69d0000  ! 2683: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xf284c020  ! 2687: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
	.word 0xb405c000  ! 2688: ADD_R	add 	%r23, %r0, %r26
T2_asi_reg_wr_98:
	mov	0x1b, %r14
	.word 0xf6f38e80  ! 2689: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0x8f902001  ! 2691: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T2_asi_reg_rd_129:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_NONHPRIV
	.word 0xf2150000  ! 2704: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xbd34b001  ! 2706: SRLX_I	srlx	%r18, 0x0001, %r30
	.word 0xf685208b  ! 2708: LDUWA_I	lduwa	[%r20, + 0x008b] %asi, %r27
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 7)
	.word 0xf415a144  ! 2714: LDUH_I	lduh	[%r22 + 0x0144], %r26
cpu_intr_2_196:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4202d  ! 2718: ORNcc_I	orncc 	%r16, 0x002d, %r27
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 36)
	.word 0xba444000  ! 2721: ADDC_R	addc 	%r17, %r0, %r29
cpu_intr_2_197:
	setx	0x310000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_198:
	setx	0x30022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_199:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf25c8000  ! 2734: LDX_R	ldx	[%r18 + %r0], %r25
cpu_intr_2_200:
	setx	0x310321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 24)
	.word 0xf485c020  ! 2738: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_99:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2739: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_201:
	setx	0x330209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf6840020  ! 2748: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	.word 0xf8c4c020  ! 2749: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	.word 0xb6c4c000  ! 2752: ADDCcc_R	addccc 	%r19, %r0, %r27
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 36)
	.word 0xf2458000  ! 2754: LDSW_R	ldsw	[%r22 + %r0], %r25
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_100:
	mov	0x1b, %r14
	.word 0xf4f38400  ! 2759: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb204a0f8  ! 2760: ADD_I	add 	%r18, 0x00f8, %r25
	.word 0xfac4e071  ! 2762: LDSWA_I	ldswa	[%r19, + 0x0071] %asi, %r29
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_130:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_202:
	setx	0x33031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_131:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb8440000  ! 2776: ADDC_R	addc 	%r16, %r0, %r28
cpu_intr_2_203:
	setx	0x370222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0de195  ! 2779: LDUB_I	ldub	[%r23 + 0x0195], %r31
T2_asi_reg_wr_101:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 2780: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfe84a175  ! 2783: LDUWA_I	lduwa	[%r18, + 0x0175] %asi, %r31
	.word 0xfa0c8000  ! 2786: LDUB_R	ldub	[%r18 + %r0], %r29
cpu_intr_2_204:
	setx	0x340027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195613c  ! 2791: WRPR_PIL_I	wrpr	%r21, 0x013c, %pil
	.word 0xf284a18d  ! 2792: LDUWA_I	lduwa	[%r18, + 0x018d] %asi, %r25
	.word 0xf28d0020  ! 2793: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 31)
	.word 0xf00c0000  ! 2796: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xf6d48020  ! 2798: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xf05c4000  ! 2800: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0x8d942037  ! 2802: WRPR_PSTATE_I	wrpr	%r16, 0x0037, %pstate
cpu_intr_2_205:
	setx	0x370324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60ce156  ! 2805: LDUB_I	ldub	[%r19 + 0x0156], %r27
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfe5da06f  ! 2814: LDX_I	ldx	[%r22 + 0x006f], %r31
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c80  ! 2819: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c80, %hpstate
T2_asi_reg_rd_132:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfacd4020  ! 2825: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf654611d  ! 2828: LDSH_I	ldsh	[%r17 + 0x011d], %r27
	.word 0xfac4a0b2  ! 2830: LDSWA_I	ldswa	[%r18, + 0x00b2] %asi, %r29
T2_asi_reg_rd_133:
	mov	0x2c, %r14
	.word 0xf2db8e80  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_206:
	setx	0x360237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d217e  ! 2834: LDSB_I	ldsb	[%r20 + 0x017e], %r26
	ta	T_CHANGE_TO_TL0
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f9a  ! 2839: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9a, %hpstate
	.word 0xfa14a039  ! 2841: LDUH_I	lduh	[%r18 + 0x0039], %r29
	.word 0xf8d54020  ! 2842: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
	.word 0xf65cc000  ! 2844: LDX_R	ldx	[%r19 + %r0], %r27
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 13)
	.word 0xf2c560c8  ! 2848: LDSWA_I	ldswa	[%r21, + 0x00c8] %asi, %r25
	.word 0xba252189  ! 2855: SUB_I	sub 	%r20, 0x0189, %r29
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f10  ! 2858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f10, %hpstate
cpu_intr_2_207:
	setx	0x340337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_208:
	setx	0x370037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cde1f8  ! 2866: LDSBA_I	ldsba	[%r23, + 0x01f8] %asi, %r27
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e98  ! 2867: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
cpu_intr_2_209:
	setx	0x35003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4850020  ! 2876: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 38)
	.word 0xf4450000  ! 2884: LDSW_R	ldsw	[%r20 + %r0], %r26
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_210:
	setx	0x360129, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_102:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2889: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf8cde19a  ! 2893: LDSBA_I	ldsba	[%r23, + 0x019a] %asi, %r28
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_211:
	setx	0x37001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40cc000  ! 2903: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xfec5e1d9  ! 2907: LDSWA_I	ldswa	[%r23, + 0x01d9] %asi, %r31
	.word 0xbd2cb001  ! 2908: SLLX_I	sllx	%r18, 0x0001, %r30
T2_asi_reg_rd_134:
	mov	0x37, %r14
	.word 0xfcdb8400  ! 2909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 4)
	.word 0xb4bd6110  ! 2913: XNORcc_I	xnorcc 	%r21, 0x0110, %r26
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_212:
	setx	0x37011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb54000  ! 2919: ORNcc_R	orncc 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c8a  ! 2926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8a, %hpstate
	.word 0xf44dc000  ! 2928: LDSB_R	ldsb	[%r23 + %r0], %r26
cpu_intr_2_213:
	setx	0x36033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_214:
	setx	0x34023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe244000  ! 2931: SUB_R	sub 	%r17, %r0, %r31
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 27)
	.word 0xfe44e11b  ! 2934: LDSW_I	ldsw	[%r19 + 0x011b], %r31
cpu_intr_2_215:
	setx	0x360234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, b)
	.word 0xbc158000  ! 2939: OR_R	or 	%r22, %r0, %r30
	.word 0xf8d4e12a  ! 2941: LDSHA_I	ldsha	[%r19, + 0x012a] %asi, %r28
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_135:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_136:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 2948: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_104:
	mov	0x11, %r14
	.word 0xf8f38400  ! 2951: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_105:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 2953: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe55e17f  ! 2954: LDSH_I	ldsh	[%r23 + 0x017f], %r31
T2_asi_reg_wr_106:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 2957: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_216:
	setx	0x350029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_217:
	setx	0x34020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_137:
	mov	0x17, %r14
	.word 0xf4db8400  ! 2962: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_218:
	setx	0x350231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 0)
	.word 0xf65c20fc  ! 2969: LDX_I	ldx	[%r16 + 0x00fc], %r27
	.word 0xb445208c  ! 2971: ADDC_I	addc 	%r20, 0x008c, %r26
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_219:
	setx	0x340016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404c000  ! 2974: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf2dc2121  ! 2976: LDXA_I	ldxa	[%r16, + 0x0121] %asi, %r25
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_220:
	setx	0x350237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4de0fb  ! 2980: LDSB_I	ldsb	[%r23 + 0x00fb], %r30
cpu_intr_2_221:
	setx	0x370111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_222:
	setx	0x37003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 2f)
	.word 0xbb540000  ! 2986: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_223:
	setx	0x350205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60cc000  ! 2991: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xf40d8000  ! 2992: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xbaa5c000  ! 2993: SUBcc_R	subcc 	%r23, %r0, %r29
cpu_intr_2_224:
	setx	0x37033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_107:
	mov	0x16, %r14
	.word 0xf0f38400  ! 2995: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_108:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3000: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc548000  ! 3003: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfe4d8000  ! 3006: LDSB_R	ldsb	[%r22 + %r0], %r31
T2_asi_reg_rd_138:
	mov	0x6, %r14
	.word 0xfedb8400  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf24c8000  ! 3008: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xf854c000  ! 3011: LDSH_R	ldsh	[%r19 + %r0], %r28
T2_asi_reg_rd_139:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc148000  ! 3014: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xfe4ca13a  ! 3016: LDSB_I	ldsb	[%r18 + 0x013a], %r31
cpu_intr_2_225:
	setx	0x340317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45a1ab  ! 3019: ADDC_I	addc 	%r22, 0x01ab, %r29
	.word 0xb0b58000  ! 3021: ORNcc_R	orncc 	%r22, %r0, %r24
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 15)
	.word 0xf055217f  ! 3029: LDSH_I	ldsh	[%r20 + 0x017f], %r24
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, a)
	.word 0xb43561cb  ! 3034: SUBC_I	orn 	%r21, 0x01cb, %r26
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 10)
	.word 0xfc44e0be  ! 3038: LDSW_I	ldsw	[%r19 + 0x00be], %r30
	.word 0xf80dc000  ! 3040: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xfe548000  ! 3041: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xbb2cb001  ! 3042: SLLX_I	sllx	%r18, 0x0001, %r29
	.word 0xf844a180  ! 3045: LDSW_I	ldsw	[%r18 + 0x0180], %r28
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_TO_TL0
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 36)
	.word 0xf6054000  ! 3054: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xfecc20a0  ! 3058: LDSBA_I	ldsba	[%r16, + 0x00a0] %asi, %r31
	.word 0xf4dca0e7  ! 3059: LDXA_I	ldxa	[%r18, + 0x00e7] %asi, %r26
	.word 0xf085205e  ! 3060: LDUWA_I	lduwa	[%r20, + 0x005e] %asi, %r24
	.word 0xf24d60fe  ! 3064: LDSB_I	ldsb	[%r21 + 0x00fe], %r25
	.word 0xf684e057  ! 3065: LDUWA_I	lduwa	[%r19, + 0x0057] %asi, %r27
T2_asi_reg_rd_140:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_109:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3068: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa44a07d  ! 3073: LDSW_I	ldsw	[%r18 + 0x007d], %r29
cpu_intr_2_226:
	setx	0x350025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe452106  ! 3082: LDSW_I	ldsw	[%r20 + 0x0106], %r31
	.word 0xf8dc60a6  ! 3086: LDXA_I	ldxa	[%r17, + 0x00a6] %asi, %r28
	.word 0xf24de12e  ! 3090: LDSB_I	ldsb	[%r23 + 0x012e], %r25
	.word 0xf0dce1b3  ! 3100: LDXA_I	ldxa	[%r19, + 0x01b3] %asi, %r24
	.word 0xfc848020  ! 3101: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
	.word 0xf0cd219c  ! 3103: LDSBA_I	ldsba	[%r20, + 0x019c] %asi, %r24
T2_asi_reg_rd_141:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_227:
	setx	0x350338, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf284e0dd  ! 3115: LDUWA_I	lduwa	[%r19, + 0x00dd] %asi, %r25
	.word 0xbe2d6094  ! 3116: ANDN_I	andn 	%r21, 0x0094, %r31
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 6)
	.word 0xf2158000  ! 3120: LDUH_R	lduh	[%r22 + %r0], %r25
T2_asi_reg_wr_110:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 3121: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa05e1d6  ! 3123: LDUW_I	lduw	[%r23 + 0x01d6], %r29
	.word 0xb0a4e16f  ! 3124: SUBcc_I	subcc 	%r19, 0x016f, %r24
cpu_intr_2_228:
	setx	0x340308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_229:
	setx	0x370038, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_142:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_230:
	setx	0x37012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_143:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 3133: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_231:
	setx	0x34033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c20d2  ! 3141: ANDcc_I	andcc 	%r16, 0x00d2, %r25
	.word 0xf48d6004  ! 3142: LDUBA_I	lduba	[%r21, + 0x0004] %asi, %r26
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_232:
	setx	0x370208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d21c2  ! 3151: LDUBA_I	lduba	[%r20, + 0x01c2] %asi, %r31
	.word 0xf60ca1cb  ! 3155: LDUB_I	ldub	[%r18 + 0x01cb], %r27
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_111:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 3159: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_233:
	setx	0x340119, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983fc8  ! 3162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc8, %hpstate
cpu_intr_2_234:
	setx	0x36000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c0000  ! 3170: SLL_R	sll 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_112:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 3176: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0ccc020  ! 3178: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
cpu_intr_2_235:
	setx	0x360137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_236:
	setx	0x36030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55e1c9  ! 3186: LDSH_I	ldsh	[%r23 + 0x01c9], %r29
	.word 0xbd2c0000  ! 3188: SLL_R	sll 	%r16, %r0, %r30
	.word 0xf85c0000  ! 3190: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xbc856092  ! 3194: ADDcc_I	addcc 	%r21, 0x0092, %r30
	.word 0xbebcc000  ! 3199: XNORcc_R	xnorcc 	%r19, %r0, %r31
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d02  ! 3200: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d02, %hpstate
	.word 0xb6b4a03b  ! 3201: SUBCcc_I	orncc 	%r18, 0x003b, %r27
	.word 0xb53c3001  ! 3202: SRAX_I	srax	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_113:
	mov	0x2b, %r14
	.word 0xf4f38e60  ! 3209: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_237:
	setx	0x350205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4e046  ! 3216: SUBCcc_I	orncc 	%r19, 0x0046, %r25
	.word 0xf8158000  ! 3218: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xb81ce05d  ! 3221: XOR_I	xor 	%r19, 0x005d, %r28
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf25d2081  ! 3225: LDX_I	ldx	[%r20 + 0x0081], %r25
cpu_intr_2_238:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c0000  ! 3227: LDX_R	ldx	[%r16 + %r0], %r29
cpu_intr_2_239:
	setx	0x35023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_114:
	mov	0x21, %r14
	.word 0xf6f38e40  ! 3233: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_240:
	setx	0x350016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6544000  ! 3238: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xf2848020  ! 3241: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_115:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 3242: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_241:
	setx	0x3b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_242:
	setx	0x3a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c20bb  ! 3246: LDUB_I	ldub	[%r16 + 0x00bb], %r25
	.word 0xf684e1ee  ! 3247: LDUWA_I	lduwa	[%r19, + 0x01ee] %asi, %r27
T2_asi_reg_wr_116:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 3248: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_243:
	setx	0x390201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_244:
	setx	0x3a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d601e  ! 3252: XNOR_I	xnor 	%r21, 0x001e, %r25
	.word 0xf4c4216c  ! 3254: LDSWA_I	ldswa	[%r16, + 0x016c] %asi, %r26
	.word 0xb805e0ba  ! 3255: ADD_I	add 	%r23, 0x00ba, %r28
	.word 0xb32c8000  ! 3258: SLL_R	sll 	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_245:
	setx	0x3a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc044000  ! 3262: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xfa45a1bf  ! 3263: LDSW_I	ldsw	[%r22 + 0x01bf], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0858020  ! 3265: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_144:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf454615a  ! 3268: LDSH_I	ldsh	[%r17 + 0x015a], %r26
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 16)
	.word 0xfe45a031  ! 3276: LDSW_I	ldsw	[%r22 + 0x0031], %r31
cpu_intr_2_246:
	setx	0x3b013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x39001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe056068  ! 3282: LDUW_I	lduw	[%r21 + 0x0068], %r31
	.word 0xf085e15a  ! 3283: LDUWA_I	lduwa	[%r23, + 0x015a] %asi, %r24
T2_asi_reg_wr_117:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 3286: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_145:
	mov	0x0, %r14
	.word 0xf8db8e80  ! 3288: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf454e09b  ! 3289: LDSH_I	ldsh	[%r19 + 0x009b], %r26
	.word 0xfecce148  ! 3294: LDSBA_I	ldsba	[%r19, + 0x0148] %asi, %r31
	.word 0xf0cc4020  ! 3298: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
	.word 0xfc4ca045  ! 3299: LDSB_I	ldsb	[%r18 + 0x0045], %r30
cpu_intr_2_248:
	setx	0x3b0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x3b031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_250:
	setx	0x390137, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_146:
	mov	0x2c, %r14
	.word 0xf0db8e60  ! 3305: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf814a134  ! 3306: LDUH_I	lduh	[%r18 + 0x0134], %r28
	.word 0xfa0d21e4  ! 3307: LDUB_I	ldub	[%r20 + 0x01e4], %r29
	.word 0xf4dd20a5  ! 3310: LDXA_I	ldxa	[%r20, + 0x00a5] %asi, %r26
T2_asi_reg_wr_118:
	mov	0x1b, %r14
	.word 0xf2f389e0  ! 3315: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf24ca15e  ! 3316: LDSB_I	ldsb	[%r18 + 0x015e], %r25
	.word 0xf404a11e  ! 3320: LDUW_I	lduw	[%r18 + 0x011e], %r26
	.word 0xb9508000  ! 3321: RDPR_TSTATE	<illegal instruction>
	.word 0xfcdce066  ! 3322: LDXA_I	ldxa	[%r19, + 0x0066] %asi, %r30
T2_asi_reg_rd_147:
	mov	0x10, %r14
	.word 0xf8db8400  ! 3323: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_119:
	mov	0x10, %r14
	.word 0xf2f38e80  ! 3325: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_wr_120:
	mov	0x19, %r14
	.word 0xf0f38e60  ! 3327: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_rd_148:
	mov	0x1c, %r14
	.word 0xf6db8400  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbd3d3001  ! 3330: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xf64521f8  ! 3331: LDSW_I	ldsw	[%r20 + 0x01f8], %r27
	.word 0xf4d5c020  ! 3333: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
cpu_intr_2_251:
	setx	0x390212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe844020  ! 3335: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
	.word 0xf8cc21a7  ! 3336: LDSBA_I	ldsba	[%r16, + 0x01a7] %asi, %r28
T2_asi_reg_rd_149:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_2_252:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_253:
	setx	0x380326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b58000  ! 3350: ORNcc_R	orncc 	%r22, %r0, %r27
	.word 0xfcc4a140  ! 3351: LDSWA_I	ldswa	[%r18, + 0x0140] %asi, %r30
	.word 0xfe94613d  ! 3354: LDUHA_I	lduha	[%r17, + 0x013d] %asi, %r31
T2_asi_reg_rd_150:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_151:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 3357: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf254200a  ! 3358: LDSH_I	ldsh	[%r16 + 0x000a], %r25
	.word 0xfe84c020  ! 3361: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_254:
	setx	0x3a0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_152:
	mov	0x31, %r14
	.word 0xf8db8e60  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf804a15f  ! 3365: LDUW_I	lduw	[%r18 + 0x015f], %r28
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d40  ! 3367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d40, %hpstate
	.word 0xfadde071  ! 3369: LDXA_I	ldxa	[%r23, + 0x0071] %asi, %r29
T2_asi_reg_wr_121:
	mov	0x11, %r14
	.word 0xf0f38e80  ! 3370: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfa05a04d  ! 3372: LDUW_I	lduw	[%r22 + 0x004d], %r29
T2_asi_reg_wr_122:
	mov	0x19, %r14
	.word 0xfef38e60  ! 3373: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfc4c0000  ! 3376: LDSB_R	ldsb	[%r16 + %r0], %r30
T2_asi_reg_rd_153:
	mov	0x37, %r14
	.word 0xfcdb8e80  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_255:
	setx	0x39001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_256:
	setx	0x3b0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 9)
	.word 0xf2850020  ! 3392: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
T2_asi_reg_rd_154:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfe84c020  ! 3396: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xbc14619f  ! 3397: OR_I	or 	%r17, 0x019f, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xba854000  ! 3401: ADDcc_R	addcc 	%r21, %r0, %r29
	.word 0xfad54020  ! 3404: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
	.word 0xf45c0000  ! 3405: LDX_R	ldx	[%r16 + %r0], %r26
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf2042106  ! 3410: LDUW_I	lduw	[%r16 + 0x0106], %r25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 1c)
	.word 0xbe358000  ! 3417: ORN_R	orn 	%r22, %r0, %r31
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, f)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ec0  ! 3424: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec0, %hpstate
cpu_intr_2_257:
	setx	0x380024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec4210e  ! 3426: LDSWA_I	ldswa	[%r16, + 0x010e] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf45da0e9  ! 3433: LDX_I	ldx	[%r22 + 0x00e9], %r26
cpu_intr_2_258:
	setx	0x380301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x38032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e90  ! 3438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e90, %hpstate
T2_asi_reg_rd_155:
	mov	0x15, %r14
	.word 0xf4db8400  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_123:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 3448: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xba1560a5  ! 3449: OR_I	or 	%r21, 0x00a5, %r29
T2_asi_reg_rd_156:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa058000  ! 3454: LDUW_R	lduw	[%r22 + %r0], %r29
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb895a0d2  ! 3456: ORcc_I	orcc 	%r22, 0x00d2, %r28
	.word 0xb53d5000  ! 3457: SRAX_R	srax	%r21, %r0, %r26
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 36)
	.word 0xf80d0000  ! 3465: LDUB_R	ldub	[%r20 + %r0], %r28
cpu_intr_2_260:
	setx	0x380308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5a00e  ! 3468: LDSWA_I	ldswa	[%r22, + 0x000e] %asi, %r25
	.word 0xf805601f  ! 3470: LDUW_I	lduw	[%r21 + 0x001f], %r28
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_261:
	setx	0x380205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d4000  ! 3477: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xba8d6035  ! 3480: ANDcc_I	andcc 	%r21, 0x0035, %r29
	.word 0xfc0c0000  ! 3483: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf4146006  ! 3484: LDUH_I	lduh	[%r17 + 0x0006], %r26
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfc142073  ! 3487: LDUH_I	lduh	[%r16 + 0x0073], %r30
T2_asi_reg_rd_157:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf294c020  ! 3490: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	.word 0xf84de1f6  ! 3491: LDSB_I	ldsb	[%r23 + 0x01f6], %r28
T2_asi_reg_rd_158:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3493: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf694e128  ! 3494: LDUHA_I	lduha	[%r19, + 0x0128] %asi, %r27
	.word 0xf4cdc020  ! 3498: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	.word 0xf655c000  ! 3499: LDSH_R	ldsh	[%r23 + %r0], %r27
T2_asi_reg_wr_124:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 3501: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_159:
	mov	0x1e, %r14
	.word 0xfadb8e60  ! 3503: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf2d54020  ! 3506: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
cpu_intr_2_262:
	setx	0x39013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ac0  ! 3516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac0, %hpstate
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f00  ! 3521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f00, %hpstate
	.word 0xfa952163  ! 3523: LDUHA_I	lduha	[%r20, + 0x0163] %asi, %r29
	.word 0xfe44a074  ! 3528: LDSW_I	ldsw	[%r18 + 0x0074], %r31
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_160:
	mov	0xf, %r14
	.word 0xf8db8e60  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb81c4000  ! 3532: XOR_R	xor 	%r17, %r0, %r28
	.word 0xf284a1c8  ! 3534: LDUWA_I	lduwa	[%r18, + 0x01c8] %asi, %r25
T2_asi_reg_wr_125:
	mov	0x6, %r14
	.word 0xf8f389e0  ! 3535: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
cpu_intr_2_263:
	setx	0x38023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_161:
	mov	0x25, %r14
	.word 0xfadb8e80  ! 3541: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL0
cpu_intr_2_264:
	setx	0x390110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbdc000  ! 3546: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xfecda10d  ! 3548: LDSBA_I	ldsba	[%r22, + 0x010d] %asi, %r31
T2_asi_reg_rd_162:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 3553: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf294c020  ! 3554: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	.word 0xb22d6032  ! 3555: ANDN_I	andn 	%r21, 0x0032, %r25
T2_asi_reg_wr_126:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 3556: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_127:
	mov	0x2a, %r14
	.word 0xfaf38400  ! 3557: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_265:
	setx	0x390218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cdc020  ! 3561: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
cpu_intr_2_266:
	setx	0x3a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15a1ac  ! 3563: LDUH_I	lduh	[%r22 + 0x01ac], %r29
	.word 0xf4052114  ! 3566: LDUW_I	lduw	[%r20 + 0x0114], %r26
cpu_intr_2_267:
	setx	0x3a0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe844020  ! 3568: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf204a0b8  ! 3577: LDUW_I	lduw	[%r18 + 0x00b8], %r25
T2_asi_reg_rd_163:
	mov	0x9, %r14
	.word 0xf4db8e60  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf68c8020  ! 3579: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
cpu_intr_2_268:
	setx	0x39020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_164:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 3581: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf4840020  ! 3584: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf895a10b  ! 3586: LDUHA_I	lduha	[%r22, + 0x010b] %asi, %r28
	.word 0xf4050000  ! 3591: LDUW_R	lduw	[%r20 + %r0], %r26
cpu_intr_2_269:
	setx	0x390118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48561b2  ! 3595: LDUWA_I	lduwa	[%r21, + 0x01b2] %asi, %r26
T2_asi_reg_wr_128:
	mov	0x7, %r14
	.word 0xf2f389e0  ! 3597: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_wr_129:
	mov	0x12, %r14
	.word 0xfef389e0  ! 3598: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 2a)
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c92  ! 3601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c92, %hpstate
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_130:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 3604: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_131:
	mov	0x37, %r14
	.word 0xf2f38400  ! 3608: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf0cc60b4  ! 3612: LDSBA_I	ldsba	[%r17, + 0x00b4] %asi, %r24
	.word 0xf484a0c0  ! 3613: LDUWA_I	lduwa	[%r18, + 0x00c0] %asi, %r26
	.word 0xbab461dc  ! 3614: ORNcc_I	orncc 	%r17, 0x01dc, %r29
T2_asi_reg_wr_132:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 3615: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 23)
	.word 0xfa5da0fe  ! 3619: LDX_I	ldx	[%r22 + 0x00fe], %r29
	.word 0xf44dc000  ! 3621: LDSB_R	ldsb	[%r23 + %r0], %r26
T2_asi_reg_rd_165:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_166:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3624: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0048000  ! 3626: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf4d40020  ! 3630: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	.word 0xf2154000  ! 3631: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xfcdd215f  ! 3632: LDXA_I	ldxa	[%r20, + 0x015f] %asi, %r30
	.word 0xfe54a063  ! 3636: LDSH_I	ldsh	[%r18 + 0x0063], %r31
T2_asi_reg_rd_167:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3637: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_168:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3640: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc5d4000  ! 3646: LDX_R	ldx	[%r21 + %r0], %r30
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_270:
	setx	0x3b0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c61b9  ! 3656: LDX_I	ldx	[%r17 + 0x01b9], %r29
cpu_intr_2_271:
	setx	0x3a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec44020  ! 3660: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xfa044000  ! 3662: LDUW_R	lduw	[%r17 + %r0], %r29
cpu_intr_2_272:
	setx	0x3a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_133:
	mov	0x16, %r14
	.word 0xfef38400  ! 3665: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_273:
	setx	0x3a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_274:
	setx	0x390022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c4000  ! 3675: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xfcc5e036  ! 3678: LDSWA_I	ldswa	[%r23, + 0x0036] %asi, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 21)
	.word 0xf45d8000  ! 3687: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xf64da141  ! 3691: LDSB_I	ldsb	[%r22 + 0x0141], %r27
	.word 0xfc55e175  ! 3692: LDSH_I	ldsh	[%r23 + 0x0175], %r30
	.word 0xf4848020  ! 3695: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
T2_asi_reg_rd_169:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 10)
	.word 0xfe8d60bb  ! 3701: LDUBA_I	lduba	[%r21, + 0x00bb] %asi, %r31
cpu_intr_2_275:
	setx	0x380022, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_170:
	mov	0x1f, %r14
	.word 0xf4db89e0  ! 3703: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_134:
	mov	0x13, %r14
	.word 0xfaf384a0  ! 3705: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfac44020  ! 3708: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
	.word 0xfc8c0020  ! 3712: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983dc0  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc0, %hpstate
	.word 0xf004a085  ! 3714: LDUW_I	lduw	[%r18 + 0x0085], %r24
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_276:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a0a  ! 3721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0a, %hpstate
cpu_intr_2_277:
	setx	0x3f020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_171:
	mov	0x2d, %r14
	.word 0xf8db84a0  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa84219c  ! 3729: LDUWA_I	lduwa	[%r16, + 0x019c] %asi, %r29
	.word 0xf0dda0bf  ! 3730: LDXA_I	ldxa	[%r22, + 0x00bf] %asi, %r24
T2_asi_reg_rd_172:
	mov	0x24, %r14
	.word 0xf2db8400  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb8248000  ! 3733: SUB_R	sub 	%r18, %r0, %r28
	.word 0xf4958020  ! 3734: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2ad0000  ! 3736: ANDNcc_R	andncc 	%r20, %r0, %r25
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d88  ! 3737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
	.word 0xbe0c4000  ! 3739: AND_R	and 	%r17, %r0, %r31
cpu_intr_2_278:
	setx	0x3c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfcd58020  ! 3744: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
	.word 0xf454e177  ! 3745: LDSH_I	ldsh	[%r19 + 0x0177], %r26
	.word 0xb8240000  ! 3747: SUB_R	sub 	%r16, %r0, %r28
	.word 0xb214e0bf  ! 3748: OR_I	or 	%r19, 0x00bf, %r25
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_279:
	setx	0x3e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_280:
	setx	0x3c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x3c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbab52134  ! 3765: ORNcc_I	orncc 	%r20, 0x0134, %r29
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 33)
	.word 0xfcd421dc  ! 3777: LDSHA_I	ldsha	[%r16, + 0x01dc] %asi, %r30
	.word 0xb6154000  ! 3780: OR_R	or 	%r21, %r0, %r27
	.word 0xb20cc000  ! 3785: AND_R	and 	%r19, %r0, %r25
	.word 0xf215a1a4  ! 3786: LDUH_I	lduh	[%r22 + 0x01a4], %r25
T2_asi_reg_rd_173:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf4c46136  ! 3788: LDSWA_I	ldswa	[%r17, + 0x0136] %asi, %r26
	.word 0xf2848020  ! 3794: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xf85dc000  ! 3795: LDX_R	ldx	[%r23 + %r0], %r28
cpu_intr_2_282:
	setx	0x3c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_135:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 3803: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe5d205f  ! 3805: LDX_I	ldx	[%r20 + 0x005f], %r31
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_283:
	setx	0x3e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_136:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 3818: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbea5a02a  ! 3822: SUBcc_I	subcc 	%r22, 0x002a, %r31
	.word 0xfa0c60e7  ! 3823: LDUB_I	ldub	[%r17 + 0x00e7], %r29
T2_asi_reg_wr_137:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 3824: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 11)
	.word 0xf8154000  ! 3826: LDUH_R	lduh	[%r21 + %r0], %r28
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_138:
	mov	0x9, %r14
	.word 0xfcf38e60  ! 3832: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_284:
	setx	0x3c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf815c000  ! 3836: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xf64c6040  ! 3837: LDSB_I	ldsb	[%r17 + 0x0040], %r27
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 32)
	.word 0xf605609a  ! 3842: LDUW_I	lduw	[%r21 + 0x009a], %r27
cpu_intr_2_285:
	setx	0x3c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, d)
	.word 0xfa4c6109  ! 3846: LDSB_I	ldsb	[%r17 + 0x0109], %r29
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 0)
	.word 0xf2d5a0bd  ! 3862: LDSHA_I	ldsha	[%r22, + 0x00bd] %asi, %r25
T2_asi_reg_rd_174:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfc04614d  ! 3864: LDUW_I	lduw	[%r17 + 0x014d], %r30
	.word 0xfe550000  ! 3866: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf2d50020  ! 3868: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
	.word 0xfecda0be  ! 3870: LDSBA_I	ldsba	[%r22, + 0x00be] %asi, %r31
	.word 0xb8b58000  ! 3871: SUBCcc_R	orncc 	%r22, %r0, %r28
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 5)
	.word 0xf684c020  ! 3874: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf095a168  ! 3879: LDUHA_I	lduha	[%r22, + 0x0168] %asi, %r24
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_TO_TL1
	.word 0xfa148000  ! 3883: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xfe1521e7  ! 3884: LDUH_I	lduh	[%r20 + 0x01e7], %r31
cpu_intr_2_286:
	setx	0x3c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495a057  ! 3889: LDUHA_I	lduha	[%r22, + 0x0057] %asi, %r26
T2_asi_reg_rd_175:
	mov	0x1, %r14
	.word 0xf4db8e60  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf0d4c020  ! 3892: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf08d0020  ! 3895: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
	.word 0xf8c54020  ! 3896: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
cpu_intr_2_287:
	setx	0x3f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08461cf  ! 3902: LDUWA_I	lduwa	[%r17, + 0x01cf] %asi, %r24
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983918  ! 3903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1918, %hpstate
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_288:
	setx	0x3d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6854020  ! 3911: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
	.word 0xf655e10a  ! 3917: LDSH_I	ldsh	[%r23 + 0x010a], %r27
	.word 0xf4c40020  ! 3919: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
T2_asi_reg_rd_176:
	mov	0x2f, %r14
	.word 0xfcdb8e60  ! 3920: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_289:
	setx	0x3e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0x24, %r14
	.word 0xfcdb8400  ! 3927: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf0856120  ! 3928: LDUWA_I	lduwa	[%r21, + 0x0120] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf00ca051  ! 3930: LDUB_I	ldub	[%r18 + 0x0051], %r24
	.word 0xf80dc000  ! 3932: LDUB_R	ldub	[%r23 + %r0], %r28
cpu_intr_2_290:
	setx	0x3e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_291:
	setx	0x3d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d8020  ! 3940: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfacd2001  ! 3952: LDSBA_I	ldsba	[%r20, + 0x0001] %asi, %r29
cpu_intr_2_292:
	setx	0x3e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_293:
	setx	0x3e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_294:
	setx	0x3f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_295:
	setx	0x3f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2058000  ! 3961: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xfccc20ec  ! 3962: LDSBA_I	ldsba	[%r16, + 0x00ec] %asi, %r30
	.word 0xf2c44020  ! 3964: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
	.word 0xbc146198  ! 3967: OR_I	or 	%r17, 0x0198, %r30
T2_asi_reg_rd_178:
	mov	0x37, %r14
	.word 0xf2db84a0  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xba34e118  ! 3974: ORN_I	orn 	%r19, 0x0118, %r29
cpu_intr_2_296:
	setx	0x3d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94c020  ! 3978: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_139:
	mov	0x21, %r14
	.word 0xf2f38e40  ! 3981: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_297:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd8020  ! 3985: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	.word 0xf04d8000  ! 3986: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf885214c  ! 3988: LDUWA_I	lduwa	[%r20, + 0x014c] %asi, %r28
	.word 0xfcc52051  ! 3991: LDSWA_I	ldswa	[%r20, + 0x0051] %asi, %r30
cpu_intr_2_298:
	setx	0x3c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_299:
	setx	0x3f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2840020  ! 4003: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
cpu_intr_2_300:
	setx	0x3d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0852167  ! 4008: ADDcc_I	addcc 	%r20, 0x0167, %r24
	.word 0xfa14a15e  ! 4010: LDUH_I	lduh	[%r18 + 0x015e], %r29
	.word 0xf4d50020  ! 4014: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_301:
	setx	0x3c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_179:
	mov	0x2c, %r14
	.word 0xfedb89e0  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfe84a1bc  ! 4024: LDUWA_I	lduwa	[%r18, + 0x01bc] %asi, %r31
	.word 0xb52c8000  ! 4025: SLL_R	sll 	%r18, %r0, %r26
	.word 0xfa15a132  ! 4026: LDUH_I	lduh	[%r22 + 0x0132], %r29
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_302:
	setx	0x3d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55c000  ! 4030: LDSH_R	ldsh	[%r23 + %r0], %r30
cpu_intr_2_303:
	setx	0x3d030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_304:
	setx	0x3d0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084e184  ! 4035: LDUWA_I	lduwa	[%r19, + 0x0184] %asi, %r24
	.word 0xf0d58020  ! 4046: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xf685a1b3  ! 4050: LDUWA_I	lduwa	[%r22, + 0x01b3] %asi, %r27
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, f)
	.word 0xfed420ed  ! 4052: LDSHA_I	ldsha	[%r16, + 0x00ed] %asi, %r31
	.word 0xfe4c4000  ! 4054: LDSB_R	ldsb	[%r17 + %r0], %r31
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_140:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 4060: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfadc20ab  ! 4061: LDXA_I	ldxa	[%r16, + 0x00ab] %asi, %r29
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_141:
	mov	0x18, %r14
	.word 0xf2f38e60  ! 4065: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_305:
	setx	0x3c010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c54020  ! 4069: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
cpu_intr_2_306:
	setx	0x3c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, a)
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf8cde1eb  ! 4074: LDSBA_I	ldsba	[%r23, + 0x01eb] %asi, %r28
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 36)
	.word 0xb3354000  ! 4079: SRL_R	srl 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_307:
	setx	0x3f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495c020  ! 4082: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, a)
	.word 0xf4548000  ! 4084: LDSH_R	ldsh	[%r18 + %r0], %r26
T2_asi_reg_rd_180:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf4858020  ! 4091: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r26
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_142:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 4093: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_308:
	setx	0x3d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_181:
	mov	0x32, %r14
	.word 0xfadb8400  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_309:
	setx	0x3d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xf2144000  ! 4105: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xbe05c000  ! 4106: ADD_R	add 	%r23, %r0, %r31
T2_asi_reg_wr_143:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 4107: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf854a06e  ! 4110: LDSH_I	ldsh	[%r18 + 0x006e], %r28
	.word 0xfc54a1fc  ! 4112: LDSH_I	ldsh	[%r18 + 0x01fc], %r30
T2_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 4114: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8150000  ! 4117: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xb60c60bf  ! 4120: AND_I	and 	%r17, 0x00bf, %r27
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 37)
	.word 0xf45d20cc  ! 4122: LDX_I	ldx	[%r20 + 0x00cc], %r26
	.word 0xfa542111  ! 4125: LDSH_I	ldsh	[%r16 + 0x0111], %r29
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 24)
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e48  ! 4130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e48, %hpstate
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_145:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 4133: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_182:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfc0dc000  ! 4137: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xfa5521ea  ! 4142: LDSH_I	ldsh	[%r20 + 0x01ea], %r29
	.word 0xb61cc000  ! 4144: XOR_R	xor 	%r19, %r0, %r27
	.word 0xf8c5e126  ! 4145: LDSWA_I	ldswa	[%r23, + 0x0126] %asi, %r28
cpu_intr_2_310:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_146:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4148: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_183:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfa14a1fb  ! 4153: LDUH_I	lduh	[%r18 + 0x01fb], %r29
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819828c0  ! 4157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
	.word 0xb33c2001  ! 4159: SRA_I	sra 	%r16, 0x0001, %r25
T2_asi_reg_wr_147:
	mov	0x21, %r14
	.word 0xfcf38e80  ! 4164: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_184:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfa95a0e1  ! 4167: LDUHA_I	lduha	[%r22, + 0x00e1] %asi, %r29
	.word 0xfe5420cd  ! 4170: LDSH_I	ldsh	[%r16 + 0x00cd], %r31
	.word 0xfecca024  ! 4172: LDSBA_I	ldsba	[%r18, + 0x0024] %asi, %r31
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 23)
	.word 0xfa948020  ! 4174: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf4040000  ! 4177: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xfc148000  ! 4181: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xf8146116  ! 4182: LDUH_I	lduh	[%r17 + 0x0116], %r28
	.word 0xfe95c020  ! 4184: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xf245600c  ! 4186: LDSW_I	ldsw	[%r21 + 0x000c], %r25
	.word 0xf2cc205f  ! 4190: LDSBA_I	ldsba	[%r16, + 0x005f] %asi, %r25
	.word 0xf20d8000  ! 4192: LDUB_R	ldub	[%r22 + %r0], %r25
T2_asi_reg_wr_148:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 4193: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 11)
	.word 0xbd340000  ! 4197: SRL_R	srl 	%r16, %r0, %r30
	.word 0xf495213b  ! 4200: LDUHA_I	lduha	[%r20, + 0x013b] %asi, %r26
	.word 0xb2850000  ! 4201: ADDcc_R	addcc 	%r20, %r0, %r25
cpu_intr_2_311:
	setx	0x420118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45460f4  ! 4205: LDSH_I	ldsh	[%r17 + 0x00f4], %r26
cpu_intr_2_312:
	setx	0x420138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d8020  ! 4207: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
	.word 0xbb2d0000  ! 4208: SLL_R	sll 	%r20, %r0, %r29
	.word 0xf094c020  ! 4210: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
	.word 0xf68cc020  ! 4213: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	.word 0xf8854020  ! 4216: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r28
	.word 0xf81421ae  ! 4219: LDUH_I	lduh	[%r16 + 0x01ae], %r28
cpu_intr_2_313:
	setx	0x400113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_149:
	mov	0x15, %r14
	.word 0xf8f38e40  ! 4221: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbf3d4000  ! 4225: SRA_R	sra 	%r21, %r0, %r31
T2_asi_reg_rd_185:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf68cc020  ! 4229: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	.word 0xf2d50020  ! 4230: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 31)
	.word 0xf29461f5  ! 4236: LDUHA_I	lduha	[%r17, + 0x01f5] %asi, %r25
T2_asi_reg_wr_150:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 4241: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_151:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 4244: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_186:
	mov	0x17, %r14
	.word 0xfedb8e80  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf28d61ef  ! 4252: LDUBA_I	lduba	[%r21, + 0x01ef] %asi, %r25
	.word 0x9195e01d  ! 4253: WRPR_PIL_I	wrpr	%r23, 0x001d, %pil
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_TO_TL0
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_187:
	mov	0x34, %r14
	.word 0xfedb89e0  ! 4263: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf2c58020  ! 4266: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
T2_asi_reg_wr_152:
	mov	0xf, %r14
	.word 0xfef38e40  ! 4267: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb92db001  ! 4268: SLLX_I	sllx	%r22, 0x0001, %r28
	.word 0xf8850020  ! 4273: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
T2_asi_reg_rd_188:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe446108  ! 4277: LDSW_I	ldsw	[%r17 + 0x0108], %r31
	.word 0xf614e028  ! 4278: LDUH_I	lduh	[%r19 + 0x0028], %r27
T2_asi_reg_rd_189:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 4279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_153:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 4290: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_154:
	mov	0xc, %r14
	.word 0xfaf38e60  ! 4293: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_190:
	mov	0x14, %r14
	.word 0xfedb8e80  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0x8995e134  ! 4299: WRPR_TICK_I	wrpr	%r23, 0x0134, %tick
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_155:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 4302: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf6452080  ! 4306: LDSW_I	ldsw	[%r20 + 0x0080], %r27
T2_asi_reg_wr_156:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 4309: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_314:
	setx	0x420103, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc2c0000  ! 4319: ANDN_R	andn 	%r16, %r0, %r30
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf08da1bd  ! 4325: LDUBA_I	lduba	[%r22, + 0x01bd] %asi, %r24
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf64ce15c  ! 4328: LDSB_I	ldsb	[%r19 + 0x015c], %r27
T2_asi_reg_rd_191:
	mov	0x32, %r14
	.word 0xf0db8e60  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf4c48020  ! 4334: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
cpu_intr_2_315:
	setx	0x41000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, f)
	.word 0xf0d4212f  ! 4340: LDSHA_I	ldsha	[%r16, + 0x012f] %asi, %r24
	.word 0xbb641800  ! 4342: MOVcc_R	<illegal instruction>
	.word 0xf0cdc020  ! 4344: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
cpu_intr_2_316:
	setx	0x410139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c0000  ! 4348: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf294a0af  ! 4349: LDUHA_I	lduha	[%r18, + 0x00af] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, c)
	.word 0xbf7c0400  ! 4355: MOVR_R	movre	%r16, %r0, %r31
	.word 0xf295a1f7  ! 4356: LDUHA_I	lduha	[%r22, + 0x01f7] %asi, %r25
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 1)
	.word 0xf0148000  ! 4363: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xbb480000  ! 4364: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
cpu_intr_2_317:
	setx	0x430039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe9561c7  ! 4366: LDUHA_I	lduha	[%r21, + 0x01c7] %asi, %r31
cpu_intr_2_318:
	setx	0x400111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7d8400  ! 4370: MOVR_R	movre	%r22, %r0, %r31
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 4)
	.word 0xfad48020  ! 4378: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
cpu_intr_2_319:
	setx	0x43011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_192:
	mov	0x21, %r14
	.word 0xf4db84a0  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8556198  ! 4385: LDSH_I	ldsh	[%r21 + 0x0198], %r28
cpu_intr_2_320:
	setx	0x430223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe856198  ! 4387: LDUWA_I	lduwa	[%r21, + 0x0198] %asi, %r31
T2_asi_reg_wr_157:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 4388: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_193:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_321:
	setx	0x400317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf655e010  ! 4395: LDSH_I	ldsh	[%r23 + 0x0010], %r27
cpu_intr_2_322:
	setx	0x42012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614e08c  ! 4398: LDUH_I	lduh	[%r19 + 0x008c], %r27
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_323:
	setx	0x420103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_324:
	setx	0x41022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 6)
	.word 0xfc4520b7  ! 4410: LDSW_I	ldsw	[%r20 + 0x00b7], %r30
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_2_325:
	setx	0x400135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_326:
	setx	0x40000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b50000  ! 4420: SUBCcc_R	orncc 	%r20, %r0, %r26
cpu_intr_2_327:
	setx	0x400213, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_158:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 4431: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_328:
	setx	0x410203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd2092  ! 4433: XNORcc_I	xnorcc 	%r20, 0x0092, %r27
	.word 0xf204e073  ! 4436: LDUW_I	lduw	[%r19 + 0x0073], %r25
	.word 0xbeb40000  ! 4440: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xf8dc60a6  ! 4441: LDXA_I	ldxa	[%r17, + 0x00a6] %asi, %r28
T2_asi_reg_wr_159:
	mov	0x23, %r14
	.word 0xf4f38e60  ! 4443: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_160:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 4449: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0dd61a2  ! 4450: LDXA_I	ldxa	[%r21, + 0x01a2] %asi, %r24
	.word 0xf6448000  ! 4452: LDSW_R	ldsw	[%r18 + %r0], %r27
cpu_intr_2_329:
	setx	0x420102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695c020  ! 4460: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	.word 0xf00d4000  ! 4462: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xf645e124  ! 4463: LDSW_I	ldsw	[%r23 + 0x0124], %r27
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, e)
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf4144000  ! 4468: LDUH_R	lduh	[%r17 + %r0], %r26
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 1)
	.word 0xba1de12e  ! 4473: XOR_I	xor 	%r23, 0x012e, %r29
	.word 0xb885608b  ! 4474: ADDcc_I	addcc 	%r21, 0x008b, %r28
	.word 0xf8dc2121  ! 4476: LDXA_I	ldxa	[%r16, + 0x0121] %asi, %r28
T2_asi_reg_wr_161:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 4479: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_194:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc4d20e1  ! 4483: LDSB_I	ldsb	[%r20 + 0x00e1], %r30
	.word 0xfe150000  ! 4486: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xfe8ca0c8  ! 4487: LDUBA_I	lduba	[%r18, + 0x00c8] %asi, %r31
	.word 0xb32d8000  ! 4488: SLL_R	sll 	%r22, %r0, %r25
	.word 0xf405c000  ! 4489: LDUW_R	lduw	[%r23 + %r0], %r26
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 39)
	.word 0xbcbd20b5  ! 4492: XNORcc_I	xnorcc 	%r20, 0x00b5, %r30
	.word 0xf005205c  ! 4494: LDUW_I	lduw	[%r20 + 0x005c], %r24
	.word 0xfe5d21e8  ! 4495: LDX_I	ldx	[%r20 + 0x01e8], %r31
T2_asi_reg_rd_195:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_330:
	setx	0x420106, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_162:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 4501: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa0da035  ! 4502: LDUB_I	ldub	[%r22 + 0x0035], %r29
	.word 0xfe946021  ! 4503: LDUHA_I	lduha	[%r17, + 0x0021] %asi, %r31
	.word 0xf2cd4020  ! 4504: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xb4bc6007  ! 4508: XNORcc_I	xnorcc 	%r17, 0x0007, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf68561a4  ! 4514: LDUWA_I	lduwa	[%r21, + 0x01a4] %asi, %r27
	.word 0xba354000  ! 4515: ORN_R	orn 	%r21, %r0, %r29
T2_asi_reg_rd_196:
	mov	0xf, %r14
	.word 0xf8db89e0  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_331:
	setx	0x40012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_332:
	setx	0x420101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa540000  ! 4529: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xb9480000  ! 4531: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f18  ! 4533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f18, %hpstate
	.word 0xf0958020  ! 4534: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
T2_asi_reg_wr_163:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 4535: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_333:
	setx	0x430008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a44000  ! 4538: SUBcc_R	subcc 	%r17, %r0, %r25
T2_asi_reg_wr_164:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4539: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 21)
	.word 0xb8ac60e4  ! 4543: ANDNcc_I	andncc 	%r17, 0x00e4, %r28
	.word 0xfc0cc000  ! 4544: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xb02520fe  ! 4545: SUB_I	sub 	%r20, 0x00fe, %r24
	.word 0xf045c000  ! 4548: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xfcc5e08b  ! 4551: LDSWA_I	ldswa	[%r23, + 0x008b] %asi, %r30
T2_asi_reg_rd_197:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_334:
	setx	0x43031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf485c020  ! 4555: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xbd2c7001  ! 4559: SLLX_I	sllx	%r17, 0x0001, %r30
	.word 0xf20c20cb  ! 4560: LDUB_I	ldub	[%r16 + 0x00cb], %r25
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 23)
	.word 0xf60d0000  ! 4563: LDUB_R	ldub	[%r20 + %r0], %r27
T2_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf895e196  ! 4575: LDUHA_I	lduha	[%r23, + 0x0196] %asi, %r28
	.word 0xfc94a074  ! 4576: LDUHA_I	lduha	[%r18, + 0x0074] %asi, %r30
T2_asi_reg_wr_165:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4580: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_166:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 4583: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_335:
	setx	0x410313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_167:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 4587: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_168:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4588: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf4c4e028  ! 4596: LDSWA_I	ldswa	[%r19, + 0x0028] %asi, %r26
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfe0ce07d  ! 4602: LDUB_I	ldub	[%r19 + 0x007d], %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_336:
	setx	0x430300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, f)
	ta	T_CHANGE_TO_TL0
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 39)
	.word 0xb5641800  ! 4618: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_169:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 4619: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8c5c020  ! 4624: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
T2_asi_reg_rd_199:
	mov	0x1, %r14
	.word 0xf4db8e80  ! 4625: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 38)
	.word 0xfc5dc000  ! 4630: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xfecc0020  ! 4632: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
T2_asi_reg_rd_200:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfa9521aa  ! 4636: LDUHA_I	lduha	[%r20, + 0x01aa] %asi, %r29
	.word 0xfe5d4000  ! 4638: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf28dc020  ! 4639: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_337:
	setx	0x44030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_338:
	setx	0x440104, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe94a0d1  ! 4646: LDUHA_I	lduha	[%r18, + 0x00d1] %asi, %r31
	.word 0xfacde01e  ! 4648: LDSBA_I	ldsba	[%r23, + 0x001e] %asi, %r29
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf48de16f  ! 4650: LDUBA_I	lduba	[%r23, + 0x016f] %asi, %r26
	.word 0xf6d58020  ! 4654: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
cpu_intr_2_339:
	setx	0x450026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 31)
	.word 0x819420c4  ! 4657: WRPR_TPC_I	wrpr	%r16, 0x00c4, %tpc
	.word 0xfa4c2171  ! 4659: LDSB_I	ldsb	[%r16 + 0x0171], %r29
	.word 0xf00c608b  ! 4660: LDUB_I	ldub	[%r17 + 0x008b], %r24
	.word 0xf20d0000  ! 4663: LDUB_R	ldub	[%r20 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0xf45d6100  ! 4667: LDX_I	ldx	[%r21 + 0x0100], %r26
	.word 0xf08ca003  ! 4670: LDUBA_I	lduba	[%r18, + 0x0003] %asi, %r24
cpu_intr_2_340:
	setx	0x460339, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_170:
	mov	0x24, %r14
	.word 0xf4f38e80  ! 4674: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf88d2048  ! 4676: LDUBA_I	lduba	[%r20, + 0x0048] %asi, %r28
	.word 0xfe14611c  ! 4677: LDUH_I	lduh	[%r17 + 0x011c], %r31
	.word 0xf0c44020  ! 4679: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
	.word 0xf8c560ae  ! 4682: LDSWA_I	ldswa	[%r21, + 0x00ae] %asi, %r28
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_171:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 4690: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb63d6004  ! 4691: XNOR_I	xnor 	%r21, 0x0004, %r27
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a18  ! 4700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a18, %hpstate
cpu_intr_2_341:
	setx	0x460303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbc205c  ! 4702: XNORcc_I	xnorcc 	%r16, 0x005c, %r30
T2_asi_reg_rd_201:
	mov	0x19, %r14
	.word 0xf8db8e80  ! 4704: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 27)
	.word 0xfa5c4000  ! 4709: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf2848020  ! 4710: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xf05da11a  ! 4711: LDX_I	ldx	[%r22 + 0x011a], %r24
	.word 0xfcc44020  ! 4715: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
	.word 0xf05ca085  ! 4716: LDX_I	ldx	[%r18 + 0x0085], %r24
	.word 0xfe85e07a  ! 4717: LDUWA_I	lduwa	[%r23, + 0x007a] %asi, %r31
T2_asi_reg_rd_202:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xba950000  ! 4723: ORcc_R	orcc 	%r20, %r0, %r29
T2_asi_reg_rd_203:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 4724: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_wr_172:
	mov	0x2e, %r14
	.word 0xf6f384a0  ! 4727: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_342:
	setx	0x470321, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_173:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 4730: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_343:
	setx	0x470001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645c000  ! 4738: LDSW_R	ldsw	[%r23 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xbf50c000  ! 4745: RDPR_TT	<illegal instruction>
	.word 0xbe3dc000  ! 4746: XNOR_R	xnor 	%r23, %r0, %r31
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_344:
	setx	0x46013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_345:
	setx	0x44023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_346:
	setx	0x460236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf694210d  ! 4754: LDUHA_I	lduha	[%r16, + 0x010d] %asi, %r27
	.word 0xf00c8000  ! 4755: LDUB_R	ldub	[%r18 + %r0], %r24
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf0d44020  ! 4760: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xb40da08e  ! 4761: AND_I	and 	%r22, 0x008e, %r26
	.word 0xfa95c020  ! 4762: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, a)
	.word 0xf68dc020  ! 4767: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
T2_asi_reg_wr_174:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 4768: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbc054000  ! 4774: ADD_R	add 	%r21, %r0, %r30
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 21)
	.word 0xbc354000  ! 4781: SUBC_R	orn 	%r21, %r0, %r30
	.word 0xb7641800  ! 4784: MOVcc_R	<illegal instruction>
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, c)
	.word 0xb1520000  ! 4787: RDPR_PIL	<illegal instruction>
	.word 0xf4454000  ! 4788: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xb094c000  ! 4791: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0xfe540000  ! 4792: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf24ce1e1  ! 4794: LDSB_I	ldsb	[%r19 + 0x01e1], %r25
cpu_intr_2_347:
	setx	0x450216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6958020  ! 4798: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
T2_asi_reg_rd_204:
	mov	0x15, %r14
	.word 0xf2db8e60  ! 4800: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_348:
	setx	0x450305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfacca055  ! 4805: LDSBA_I	ldsba	[%r18, + 0x0055] %asi, %r29
	.word 0xf20cc000  ! 4807: LDUB_R	ldub	[%r19 + %r0], %r25
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe044000  ! 4813: LDUW_R	lduw	[%r17 + %r0], %r31
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 28)
	.word 0xbf51c000  ! 4815: RDPR_TL	<illegal instruction>
T2_asi_reg_wr_175:
	mov	0x5, %r14
	.word 0xfaf38e60  ! 4817: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf6d50020  ! 4823: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
T2_asi_reg_wr_176:
	mov	0x31, %r14
	.word 0xf4f384a0  ! 4824: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc0de10c  ! 4825: LDUB_I	ldub	[%r23 + 0x010c], %r30
	.word 0xf045e134  ! 4828: LDSW_I	ldsw	[%r23 + 0x0134], %r24
	.word 0xb8354000  ! 4830: ORN_R	orn 	%r21, %r0, %r28
cpu_intr_2_349:
	setx	0x44010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 33)
	.word 0xb6bd0000  ! 4833: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xf48520e4  ! 4834: LDUWA_I	lduwa	[%r20, + 0x00e4] %asi, %r26
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_TO_TL1
	.word 0xf2954020  ! 4841: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
	.word 0xb7508000  ! 4842: RDPR_TSTATE	<illegal instruction>
T2_asi_reg_wr_177:
	mov	0x19, %r14
	.word 0xf0f389e0  ! 4843: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf64c20ff  ! 4845: LDSB_I	ldsb	[%r16 + 0x00ff], %r27
	.word 0xb13c8000  ! 4846: SRA_R	sra 	%r18, %r0, %r24
	.word 0xbec46105  ! 4848: ADDCcc_I	addccc 	%r17, 0x0105, %r31
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_205:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 4859: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_206:
	mov	0x2b, %r14
	.word 0xfcdb89e0  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfc0dc000  ! 4861: LDUB_R	ldub	[%r23 + %r0], %r30
T2_asi_reg_wr_178:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 4862: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe0dc000  ! 4864: LDUB_R	ldub	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0xb2240000  ! 4869: SUB_R	sub 	%r16, %r0, %r25
	.word 0xf6c44020  ! 4871: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
	.word 0xf4948020  ! 4873: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
cpu_intr_2_350:
	setx	0x46033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_351:
	setx	0x460121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644e05f  ! 4881: LDSW_I	ldsw	[%r19 + 0x005f], %r27
	.word 0xb415e084  ! 4882: OR_I	or 	%r23, 0x0084, %r26
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf0dd6000  ! 4885: LDXA_I	ldxa	[%r21, + 0x0000] %asi, %r24
cpu_intr_2_352:
	setx	0x45020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_353:
	setx	0x470113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_207:
	mov	0x1f, %r14
	.word 0xf6db8e80  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf244a183  ! 4893: LDSW_I	ldsw	[%r18 + 0x0183], %r25
cpu_intr_2_354:
	setx	0x44033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3ce001  ! 4899: SRA_I	sra 	%r19, 0x0001, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf004a088  ! 4901: LDUW_I	lduw	[%r18 + 0x0088], %r24
	.word 0xf4450000  ! 4902: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf48d6073  ! 4904: LDUBA_I	lduba	[%r21, + 0x0073] %asi, %r26
cpu_intr_2_355:
	setx	0x44031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ad6032  ! 4907: ANDNcc_I	andncc 	%r21, 0x0032, %r26
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_179:
	mov	0x2b, %r14
	.word 0xf2f38e60  ! 4912: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb8c56064  ! 4914: ADDCcc_I	addccc 	%r21, 0x0064, %r28
cpu_intr_2_356:
	setx	0x460328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_208:
	mov	0x2d, %r14
	.word 0xf2db84a0  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_rd_209:
	mov	0x5, %r14
	.word 0xf2db8e60  ! 4917: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982948  ! 4918: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
T2_asi_reg_rd_210:
	mov	0x21, %r14
	.word 0xfadb8e80  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc548000  ! 4923: LDSH_R	ldsh	[%r18 + %r0], %r30
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983dd2  ! 4925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd2, %hpstate
	.word 0xfedda0c2  ! 4932: LDXA_I	ldxa	[%r22, + 0x00c2] %asi, %r31
T2_asi_reg_rd_211:
	mov	0x25, %r14
	.word 0xf4db89e0  ! 4936: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_357:
	setx	0x470128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_358:
	setx	0x450314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_359:
	setx	0x470308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_360:
	setx	0x470303, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_212:
	mov	0x13, %r14
	.word 0xf8db8400  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_361:
	setx	0x450216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c44020  ! 4953: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
	.word 0xf4952131  ! 4954: LDUHA_I	lduha	[%r20, + 0x0131] %asi, %r26
T2_asi_reg_rd_213:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfad46071  ! 4958: LDSHA_I	ldsha	[%r17, + 0x0071] %asi, %r29
	.word 0xfe04611b  ! 4959: LDUW_I	lduw	[%r17 + 0x011b], %r31
cpu_intr_2_362:
	setx	0x450224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_363:
	setx	0x47013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_214:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf0442092  ! 4967: LDSW_I	ldsw	[%r16 + 0x0092], %r24
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 23)
	.word 0xf8d5e1b7  ! 4973: LDSHA_I	ldsha	[%r23, + 0x01b7] %asi, %r28
T2_asi_reg_rd_215:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 4974: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_wr_180:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 4977: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf04cc000  ! 4978: LDSB_R	ldsb	[%r19 + %r0], %r24
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c10  ! 4979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
	.word 0xbcb4c000  ! 4981: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xf00561ce  ! 4982: LDUW_I	lduw	[%r21 + 0x01ce], %r24
	.word 0xfacd4020  ! 4985: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
	.word 0xb41ce136  ! 4986: XOR_I	xor 	%r19, 0x0136, %r26
	.word 0xf6c4e1d1  ! 4987: LDSWA_I	ldswa	[%r19, + 0x01d1] %asi, %r27
	.word 0xf805a189  ! 4989: LDUW_I	lduw	[%r22 + 0x0189], %r28
cpu_intr_2_364:
	setx	0x46020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe5de0a8  ! 4993: LDX_I	ldx	[%r23 + 0x00a8], %r31
	.word 0xb7518000  ! 4994: RDPR_PSTATE	<illegal instruction>
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, e)
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 2f)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbda409e0  ! 1: FDIVq	dis not found

T1_asi_reg_wr_0:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 5: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_0:
	setx	0x1e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488e0  ! 8: FSUBq	dis not found

	.word 0xb3a00540  ! 9: FSQRTd	fsqrt	
	lda	[%r17 + %g0] 0xf0, %f2
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_1:
	setx	0x1e0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 18: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_1:
	mov	0xc, %r14
	.word 0xf6f389e0  ! 19: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbda449a0  ! 21: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xbdaa4820  ! 23: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa90820  ! 25: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb62c615b  ! 40: ANDN_I	andn 	%r17, 0x015b, %r27
	.word 0xbfa4c8a0  ! 41: FSUBs	fsubs	%f19, %f0, %f31
T1_asi_reg_wr_2:
	mov	0x19, %r14
	.word 0xf6f38e60  ! 43: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_2:
	setx	0x1e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9641800  ! 51: MOVcc_R	<illegal instruction>
	.word 0xb1aac820  ! 53: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a94820  ! 56: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_3:
	setx	0x1c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 20)
	.word 0xb40d60c0  ! 62: AND_I	and 	%r21, 0x00c0, %r26
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 28)
	.word 0xbfa589c0  ! 68: FDIVd	fdivd	%f22, %f0, %f62
T1_asi_reg_rd_0:
	mov	0x22, %r14
	.word 0xf4db8e80  ! 69: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_1:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 71: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_4:
	setx	0x1e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_5:
	setx	0x1d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba94e01c  ! 81: ORcc_I	orcc 	%r19, 0x001c, %r29
	.word 0xb9a94820  ! 82: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_3:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 83: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1a00520  ! 86: FSQRTs	fsqrt	
	.word 0xb5a58920  ! 87: FMULs	fmuls	%f22, %f0, %f26
	.word 0xb9a00540  ! 89: FSQRTd	fsqrt	
cpu_intr_1_6:
	setx	0x1c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 96: RDPR_GL	<illegal instruction>
	.word 0xbba8c820  ! 100: FMOVL	fmovs	%fcc1, %f0, %f29
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_2:
	mov	0x24, %r14
	.word 0xfedb89e0  ! 102: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfa489e0  ! 103: FDIVq	dis not found

cpu_intr_1_7:
	setx	0x1d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_4:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 107: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_8:
	setx	0x1d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a449a0  ! 111: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xb1a5c9a0  ! 112: FDIVs	fdivs	%f23, %f0, %f24
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_9:
	setx	0x1f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 115: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00540  ! 118: FSQRTd	fsqrt	
	.word 0xb3a81c20  ! 121: FMOVRGEZ	dis not found

T1_asi_reg_rd_3:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 122: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb9a00540  ! 124: FSQRTd	fsqrt	
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a409e0  ! 127: FDIVq	dis not found

T1_asi_reg_rd_4:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 130: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbfa00540  ! 131: FSQRTd	fsqrt	
cpu_intr_1_10:
	setx	0x1f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb605c000  ! 137: ADD_R	add 	%r23, %r0, %r27
cpu_intr_1_11:
	setx	0x1f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_5:
	mov	0x3, %r14
	.word 0xfaf384a0  ! 139: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb3a54840  ! 142: FADDd	faddd	%f52, %f0, %f56
	.word 0xb0254000  ! 144: SUB_R	sub 	%r21, %r0, %r24
	.word 0xb615605c  ! 145: OR_I	or 	%r21, 0x005c, %r27
cpu_intr_1_12:
	setx	0x1e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_6:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 153: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfa58960  ! 154: FMULq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbda94820  ! 156: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a9c820  ! 164: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3643801  ! 166: MOVcc_I	<illegal instruction>
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5a9c820  ! 169: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5aa8820  ! 172: FMOVG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_13:
	setx	0x1d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 177: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbea5e07f  ! 178: SUBcc_I	subcc 	%r23, 0x007f, %r31
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_14:
	setx	0x1f0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a508c0  ! 184: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb3a98820  ! 185: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a88820  ! 186: FMOVLE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_15:
	setx	0x1f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 189: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80c20  ! 190: FMOVRLZ	dis not found

	.word 0xb1a54840  ! 192: FADDd	faddd	%f52, %f0, %f24
	.word 0xb7abc820  ! 193: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbe352186  ! 195: SUBC_I	orn 	%r20, 0x0186, %r31
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_5:
	mov	0x21, %r14
	.word 0xf6db8e60  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_rd_6:
	mov	0x4, %r14
	.word 0xfcdb84a0  ! 204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_7:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 205: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5540000  ! 206: RDPR_GL	<illegal instruction>
	.word 0xb7abc820  ! 207: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb1a4c920  ! 210: FMULs	fmuls	%f19, %f0, %f24
	.word 0xbcb40000  ! 211: SUBCcc_R	orncc 	%r16, %r0, %r30
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb295e0c6  ! 220: ORcc_I	orcc 	%r23, 0x00c6, %r25
T1_asi_reg_wr_7:
	mov	0x34, %r14
	.word 0xfaf38e40  ! 222: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a00520  ! 223: FSQRTs	fsqrt	
cpu_intr_1_16:
	setx	0x1e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 226: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_8:
	mov	0xa, %r14
	.word 0xf4db8e40  ! 227: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_17:
	setx	0x1e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_18:
	setx	0x1e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 233: FSQRTs	fsqrt	
	.word 0xbba94820  ! 237: FMOVCS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_9:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a5c8e0  ! 242: FSUBq	dis not found

	.word 0xb5ab0820  ! 249: FMOVGU	fmovs	%fcc1, %f0, %f26
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_19:
	setx	0x1d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 258: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_20:
	setx	0x1c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_8:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 260: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb7a81820  ! 261: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb32d1000  ! 267: SLLX_R	sllx	%r20, %r0, %r25
	.word 0xb3a98820  ! 268: FMOVNEG	fmovs	%fcc1, %f0, %f25
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_21:
	setx	0x1d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c9e0  ! 276: FDIVq	dis not found

	.word 0xbda00540  ! 279: FSQRTd	fsqrt	
	.word 0xb3a489c0  ! 281: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xbda81c20  ! 282: FMOVRGEZ	dis not found

T1_asi_reg_rd_10:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 283: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_11:
	mov	0xc, %r14
	.word 0xf0db89e0  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, c)
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_22:
	setx	0x1c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48d8000  ! 293: ANDcc_R	andcc 	%r22, %r0, %r26
T1_asi_reg_rd_12:
	mov	0x36, %r14
	.word 0xfedb8e80  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_23:
	setx	0x1c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 300: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_9:
	mov	0x0, %r14
	.word 0xfaf38e60  ! 302: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_13:
	mov	0x32, %r14
	.word 0xf2db89e0  ! 305: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_14:
	mov	0x1f, %r14
	.word 0xfedb8400  ! 306: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfa00560  ! 307: FSQRTq	fsqrt	
	.word 0xbe3c0000  ! 309: XNOR_R	xnor 	%r16, %r0, %r31
cpu_intr_1_24:
	setx	0x1d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 311: FSQRTs	fsqrt	
	.word 0xbbab8820  ! 315: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba00040  ! 319: FMOVd	fmovd	%f0, %f60
	.word 0xb5a00520  ! 320: FSQRTs	fsqrt	
T1_asi_reg_wr_10:
	mov	0xd, %r14
	.word 0xfef384a0  ! 321: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb1a50920  ! 322: FMULs	fmuls	%f20, %f0, %f24
	.word 0xba858000  ! 325: ADDcc_R	addcc 	%r22, %r0, %r29
	.word 0xb5aac820  ! 330: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_11:
	mov	0x8, %r14
	.word 0xfef384a0  ! 331: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5a00520  ! 334: FSQRTs	fsqrt	
cpu_intr_1_25:
	setx	0x1c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588e0  ! 340: FSUBq	dis not found

	.word 0xb1a80820  ! 341: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbda00040  ! 344: FMOVd	fmovd	%f0, %f30
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a9c820  ! 346: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb0a4e0e9  ! 349: SUBcc_I	subcc 	%r19, 0x00e9, %r24
	.word 0xb3a00520  ! 354: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_15:
	mov	0x36, %r14
	.word 0xfedb8e60  ! 358: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1a00560  ! 359: FSQRTq	fsqrt	
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_16:
	mov	0x8, %r14
	.word 0xfcdb8e40  ! 365: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5a80820  ! 367: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb7a589c0  ! 369: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb7a489a0  ! 370: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xbfab8820  ! 371: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_17:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 375: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9aa8820  ! 376: FMOVG	fmovs	%fcc1, %f0, %f28
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 4)
	.word 0xbc3de1f1  ! 383: XNOR_I	xnor 	%r23, 0x01f1, %r30
T1_asi_reg_wr_12:
	mov	0x36, %r14
	.word 0xfaf384a0  ! 387: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_wr_13:
	mov	0x12, %r14
	.word 0xf6f384a0  ! 390: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb7a4c8e0  ! 392: FSUBq	dis not found

	.word 0xb3a9c820  ! 397: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbda00020  ! 402: FMOVs	fmovs	%f0, %f30
	.word 0xb9a81420  ! 403: FMOVRNZ	dis not found

cpu_intr_1_26:
	setx	0x1f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 405: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb4a40000  ! 407: SUBcc_R	subcc 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_18:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_27:
	setx	0x1d033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba408a0  ! 421: FSUBs	fsubs	%f16, %f0, %f29
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7a81820  ! 425: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb5a40940  ! 427: FMULd	fmuld	%f16, %f0, %f26
cpu_intr_1_28:
	setx	0x1d022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 432: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbba80820  ! 435: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb60d8000  ! 436: AND_R	and 	%r22, %r0, %r27
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 21)
	.word 0xb73c1000  ! 438: SRAX_R	srax	%r16, %r0, %r27
	.word 0xb9a40940  ! 442: FMULd	fmuld	%f16, %f0, %f28
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_19:
	mov	0x1e, %r14
	.word 0xfcdb84a0  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_29:
	setx	0x1d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_30:
	setx	0x1f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548c0  ! 453: FSUBd	fsubd	%f52, %f0, %f56
T1_asi_reg_rd_20:
	mov	0x32, %r14
	.word 0xf4db89e0  ! 454: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_31:
	setx	0x1c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c0000  ! 457: ANDcc_R	andcc 	%r16, %r0, %r29
	.word 0xbdab4820  ! 463: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_14:
	mov	0x2e, %r14
	.word 0xfef38e80  ! 465: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_32:
	setx	0x210235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 470: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_21:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 472: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbda98820  ! 475: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_33:
	setx	0x200025, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_22:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_16:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 479: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb4b4c000  ! 481: SUBCcc_R	orncc 	%r19, %r0, %r26
T1_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 483: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_23:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1a4c9a0  ! 486: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb1aa8820  ! 487: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_18:
	mov	0x31, %r14
	.word 0xf6f389e0  ! 489: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_34:
	setx	0x220223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 499: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb7ab0820  ! 509: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb2bd2037  ! 512: XNORcc_I	xnorcc 	%r20, 0x0037, %r25
T1_asi_reg_rd_24:
	mov	0x17, %r14
	.word 0xf0db8e60  ! 515: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbfa5c820  ! 516: FADDs	fadds	%f23, %f0, %f31
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 19)
	.word 0xba2420a3  ! 522: SUB_I	sub 	%r16, 0x00a3, %r29
	.word 0xb7aa0820  ! 523: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00540  ! 524: FSQRTd	fsqrt	
cpu_intr_1_35:
	setx	0x230020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_19:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 528: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_25:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 530: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba449c0  ! 531: FDIVd	fdivd	%f48, %f0, %f60
	.word 0xbda589e0  ! 533: FDIVq	dis not found

	.word 0xb9ab4820  ! 537: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a88820  ! 538: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a489a0  ! 539: FDIVs	fdivs	%f18, %f0, %f28
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_36:
	setx	0x23002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40860  ! 548: FADDq	dis not found

	.word 0xbda5c9c0  ! 549: FDIVd	fdivd	%f54, %f0, %f30
T1_asi_reg_wr_20:
	mov	0x20, %r14
	.word 0xf6f389e0  ! 550: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_21:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 551: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_37:
	setx	0x200318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 554: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, a)
	.word 0xb1a88820  ! 556: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba90820  ! 559: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbe848000  ! 561: ADDcc_R	addcc 	%r18, %r0, %r31
T1_asi_reg_rd_26:
	mov	0x33, %r14
	.word 0xfadb8e40  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb2ad0000  ! 566: ANDNcc_R	andncc 	%r20, %r0, %r25
T1_asi_reg_rd_27:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_38:
	setx	0x22013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_39:
	setx	0x200032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48860  ! 572: FADDq	dis not found

	.word 0xb485e1d7  ! 573: ADDcc_I	addcc 	%r23, 0x01d7, %r26
	.word 0xbe050000  ! 574: ADD_R	add 	%r20, %r0, %r31
cpu_intr_1_40:
	setx	0x200238, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_22:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 578: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_28:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a4c9c0  ! 583: FDIVd	fdivd	%f50, %f0, %f58
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_41:
	setx	0x230035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_42:
	setx	0x20011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5abc820  ! 593: FMOVVC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_29:
	mov	0x20, %r14
	.word 0xfadb8400  ! 594: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda00560  ! 596: FSQRTq	fsqrt	
	.word 0xbbab8820  ! 597: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_30:
	mov	0x2f, %r14
	.word 0xf2db84a0  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5a00520  ! 605: FSQRTs	fsqrt	
cpu_intr_1_43:
	setx	0x210132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_23:
	mov	0x19, %r14
	.word 0xfaf38400  ! 607: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb48ce15e  ! 613: ANDcc_I	andcc 	%r19, 0x015e, %r26
	.word 0xba254000  ! 617: SUB_R	sub 	%r21, %r0, %r29
cpu_intr_1_44:
	setx	0x200338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 621: FMOVVC	fmovs	%fcc1, %f0, %f24
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_45:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_46:
	setx	0x210238, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_31:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 627: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb09c2037  ! 629: XORcc_I	xorcc 	%r16, 0x0037, %r24
	.word 0xbfa588e0  ! 635: FSUBq	dis not found

T1_asi_reg_rd_32:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 637: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a80820  ! 640: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_33:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_34:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 649: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3aac820  ! 650: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a4c940  ! 652: FMULd	fmuld	%f50, %f0, %f24
cpu_intr_1_47:
	setx	0x220128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 655: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbba80c20  ! 656: FMOVRLZ	dis not found

	.word 0xb7a5c920  ! 657: FMULs	fmuls	%f23, %f0, %f27
T1_asi_reg_rd_35:
	mov	0x34, %r14
	.word 0xf4db8e60  ! 658: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9a94820  ! 660: FMOVCS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_48:
	setx	0x21011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_36:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 20)
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
	.word 0xb5a80420  ! 676: FMOVRZ	dis not found

	.word 0xb7a80420  ! 680: FMOVRZ	dis not found

	.word 0xb09c2047  ! 681: XORcc_I	xorcc 	%r16, 0x0047, %r24
T1_asi_reg_wr_24:
	mov	0x8, %r14
	.word 0xfaf389e0  ! 684: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_49:
	setx	0x200317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 688: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba588c0  ! 690: FSUBd	fsubd	%f22, %f0, %f60
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_25:
	mov	0xb, %r14
	.word 0xf8f38e80  ! 694: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbda40820  ! 700: FADDs	fadds	%f16, %f0, %f30
	.word 0xb5a40960  ! 702: FMULq	dis not found

	.word 0xbba81820  ! 703: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb92c2001  ! 707: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xb2940000  ! 710: ORcc_R	orcc 	%r16, %r0, %r25
cpu_intr_1_50:
	setx	0x220235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508c0  ! 715: FSUBd	fsubd	%f20, %f0, %f28
	.word 0xb5a408a0  ! 716: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xb3ab8820  ! 717: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a48960  ! 719: FMULq	dis not found

cpu_intr_1_51:
	setx	0x21020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_52:
	setx	0x23022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_53:
	setx	0x210005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_54:
	setx	0x230010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_37:
	mov	0x2b, %r14
	.word 0xf6db8400  ! 731: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3a00540  ! 737: FSQRTd	fsqrt	
T1_asi_reg_wr_26:
	mov	0x2e, %r14
	.word 0xf4f38e80  ! 739: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1ab8820  ! 741: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb24561b7  ! 742: ADDC_I	addc 	%r21, 0x01b7, %r25
cpu_intr_1_55:
	setx	0x210317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a44820  ! 754: FADDs	fadds	%f17, %f0, %f26
	.word 0xbda88820  ! 756: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbdab4820  ! 757: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_56:
	setx	0x200309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_57:
	setx	0x230133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_58:
	setx	0x230030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44840  ! 767: FADDd	faddd	%f48, %f0, %f28
T1_asi_reg_wr_27:
	mov	0x11, %r14
	.word 0xfef384a0  ! 769: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_59:
	setx	0x21003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 774: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_38:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, f)
	.word 0xb3a00020  ! 783: FMOVs	fmovs	%f0, %f25
T1_asi_reg_rd_39:
	mov	0x34, %r14
	.word 0xf2db8400  ! 785: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_28:
	mov	0x36, %r14
	.word 0xf0f384a0  ! 786: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_60:
	setx	0x23003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_61:
	setx	0x23032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 790: FMOVs	fmovs	%f0, %f26
	.word 0xbba00040  ! 793: FMOVd	fmovd	%f0, %f60
	.word 0xb6944000  ! 794: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xb7a80820  ! 795: FMOVN	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_62:
	setx	0x23022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 804: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_63:
	setx	0x21032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_64:
	setx	0x210303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 811: FMOVRNZ	dis not found

cpu_intr_1_65:
	setx	0x22021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a0a7  ! 815: WRPR_TT_I	wrpr	%r18, 0x00a7, %tt
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda80820  ! 819: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbc84e187  ! 824: ADDcc_I	addcc 	%r19, 0x0187, %r30
T1_asi_reg_rd_40:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 14)
	.word 0xb32da001  ! 833: SLL_I	sll 	%r22, 0x0001, %r25
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_66:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 841: FSQRTs	fsqrt	
	.word 0xb9aa8820  ! 843: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xbe1520b9  ! 844: OR_I	or 	%r20, 0x00b9, %r31
T1_asi_reg_rd_41:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_42:
	mov	0x2a, %r14
	.word 0xf0db84a0  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb12ca001  ! 847: SLL_I	sll 	%r18, 0x0001, %r24
	.word 0xbdaa0820  ! 848: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5a5c920  ! 849: FMULs	fmuls	%f23, %f0, %f26
T1_asi_reg_wr_29:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 850: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_43:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_44:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 857: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a81820  ! 860: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba00040  ! 863: FMOVd	fmovd	%f0, %f60
	.word 0xbdaa0820  ! 864: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_67:
	setx	0x230334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 868: FSQRTs	fsqrt	
T1_asi_reg_rd_45:
	mov	0x1f, %r14
	.word 0xf8db8e80  ! 870: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_30:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 873: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1a509e0  ! 877: FDIVq	dis not found

	.word 0xbda88820  ! 878: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_46:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 879: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_47:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 882: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_68:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb7a5c860  ! 887: FADDq	dis not found

cpu_intr_1_69:
	setx	0x200114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 35)
	.word 0xb9aac820  ! 893: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_48:
	mov	0x19, %r14
	.word 0xfadb8e80  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3a90820  ! 901: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80820  ! 903: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 2)
	.word 0xbf2c1000  ! 911: SLLX_R	sllx	%r16, %r0, %r31
	.word 0xbda54960  ! 913: FMULq	dis not found

cpu_intr_1_70:
	setx	0x26013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9a0  ! 922: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xbdab0820  ! 924: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 26)
	.word 0xbc8cc000  ! 926: ANDcc_R	andcc 	%r19, %r0, %r30
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_71:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40920  ! 933: FMULs	fmuls	%f16, %f0, %f29
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_72:
	setx	0x27020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589e0  ! 937: FDIVq	dis not found

	.word 0xbfa80c20  ! 938: FMOVRLZ	dis not found

T1_asi_reg_rd_49:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_50:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7a00020  ! 946: FMOVs	fmovs	%f0, %f27
	.word 0xb9540000  ! 948: RDPR_GL	<illegal instruction>
cpu_intr_1_73:
	setx	0x240014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_31:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 952: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb8344000  ! 953: ORN_R	orn 	%r17, %r0, %r28
cpu_intr_1_74:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe844000  ! 956: ADDcc_R	addcc 	%r17, %r0, %r31
cpu_intr_1_75:
	setx	0x250032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_76:
	setx	0x24001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50960  ! 959: FMULq	dis not found

iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb2c48000  ! 967: ADDCcc_R	addccc 	%r18, %r0, %r25
cpu_intr_1_77:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_78:
	setx	0x240221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 973: FMOVNE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_79:
	setx	0x27000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a40860  ! 990: FADDq	dis not found

	.word 0xbfa409e0  ! 992: FDIVq	dis not found

	.word 0xb9a84820  ! 997: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_80:
	setx	0x250037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba449a0  ! 1010: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb134b001  ! 1013: SRLX_I	srlx	%r18, 0x0001, %r24
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 2c)
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, f)
	.word 0xb5aa4820  ! 1022: FMOVNE	fmovs	%fcc1, %f0, %f26
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3a84820  ! 1025: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_81:
	setx	0x260212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_82:
	setx	0x24021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_83:
	setx	0x26011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_51:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 1038: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa58840  ! 1039: FADDd	faddd	%f22, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a90820  ! 1044: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, d)
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda5c820  ! 1050: FADDs	fadds	%f23, %f0, %f30
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba98820  ! 1052: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a40840  ! 1055: FADDd	faddd	%f16, %f0, %f26
T1_asi_reg_wr_32:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 1059: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7a80c20  ! 1062: FMOVRLZ	dis not found

	.word 0xbba98820  ! 1068: FMOVNEG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_52:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 1074: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_33:
	mov	0x31, %r14
	.word 0xf8f389e0  ! 1077: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_34:
	mov	0x4, %r14
	.word 0xfcf38e40  ! 1080: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfa488e0  ! 1081: FSUBq	dis not found

	.word 0xb5a44920  ! 1082: FMULs	fmuls	%f17, %f0, %f26
cpu_intr_1_84:
	setx	0x27003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 12)
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_53:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_85:
	setx	0x26002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2150000  ! 1093: OR_R	or 	%r20, %r0, %r25
T1_asi_reg_rd_54:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xba0420a7  ! 1096: ADD_I	add 	%r16, 0x00a7, %r29
cpu_intr_1_86:
	setx	0x25013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_87:
	setx	0x250026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 1104: FSQRTd	fsqrt	
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda588e0  ! 1108: FSUBq	dis not found

T1_asi_reg_rd_55:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 1115: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_88:
	setx	0x26012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50820  ! 1118: FADDs	fadds	%f20, %f0, %f31
	.word 0xbdab0820  ! 1120: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb3ab4820  ! 1123: FMOVCC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_89:
	setx	0x260036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 0)
	.word 0xbba588c0  ! 1129: FSUBd	fsubd	%f22, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_35:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 1132: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_36:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 1135: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_90:
	setx	0x260033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_91:
	setx	0x240328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548c0  ! 1146: FSUBd	fsubd	%f52, %f0, %f30
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_56:
	mov	0x13, %r14
	.word 0xf0db8400  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfa8c820  ! 1152: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_57:
	mov	0x6, %r14
	.word 0xf2db8400  ! 1154: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9ab8820  ! 1162: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a94820  ! 1163: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xba3c209d  ! 1165: XNOR_I	xnor 	%r16, 0x009d, %r29
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_92:
	setx	0x24010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50960  ! 1173: FMULq	dis not found

	.word 0xb1ab8820  ! 1174: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a44820  ! 1175: FADDs	fadds	%f17, %f0, %f24
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_93:
	setx	0x27010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_94:
	setx	0x27000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_95:
	setx	0x24023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda44960  ! 1185: FMULq	dis not found

T1_asi_reg_rd_59:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9abc820  ! 1192: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb8b561d4  ! 1197: SUBCcc_I	orncc 	%r21, 0x01d4, %r28
	.word 0xb815c000  ! 1198: OR_R	or 	%r23, %r0, %r28
	.word 0xb1a44920  ! 1199: FMULs	fmuls	%f17, %f0, %f24
T1_asi_reg_wr_37:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 1200: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a80820  ! 1202: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbfa98820  ! 1203: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb7aa0820  ! 1204: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbfaa4820  ! 1205: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a548c0  ! 1210: FSUBd	fsubd	%f52, %f0, %f26
T1_asi_reg_rd_60:
	mov	0x11, %r14
	.word 0xf6db84a0  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a00560  ! 1213: FSQRTq	fsqrt	
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a8c820  ! 1223: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9aa4820  ! 1226: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a5c8a0  ! 1227: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb7a5c840  ! 1228: FADDd	faddd	%f54, %f0, %f58
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_61:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba48860  ! 1240: FADDq	dis not found

	.word 0xbbab4820  ! 1241: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa80820  ! 1245: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80c20  ! 1246: FMOVRLZ	dis not found

	.word 0xb9ab8820  ! 1248: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda80820  ! 1252: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbba88820  ! 1254: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a81420  ! 1258: FMOVRNZ	dis not found

	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_96:
	setx	0x240213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 1271: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_97:
	setx	0x250135, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_62:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 1273: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfa94820  ! 1281: FMOVCS	fmovs	%fcc1, %f0, %f31
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_38:
	mov	0x23, %r14
	.word 0xfef38e80  ! 1286: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_39:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 1288: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_98:
	setx	0x24021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_63:
	mov	0xa, %r14
	.word 0xf4db8400  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbda58820  ! 1293: FADDs	fadds	%f22, %f0, %f30
	.word 0xb6a46033  ! 1295: SUBcc_I	subcc 	%r17, 0x0033, %r27
T1_asi_reg_rd_64:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 1301: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_65:
	mov	0x8, %r14
	.word 0xf8db8e80  ! 1304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_99:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 1312: FMOVPOS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_100:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_101:
	setx	0x250300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 20)
	.word 0xb5a00520  ! 1326: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbaac820  ! 1330: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_102:
	setx	0x24010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 1337: MOVcc_I	<illegal instruction>
cpu_intr_1_103:
	setx	0x260323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_66:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a549c0  ! 1345: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xbf35e001  ! 1348: SRL_I	srl 	%r23, 0x0001, %r31
T1_asi_reg_rd_67:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_104:
	setx	0x270029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_68:
	mov	0x22, %r14
	.word 0xf2db84a0  ! 1353: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_40:
	mov	0xc, %r14
	.word 0xfaf38e40  ! 1357: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a5c960  ! 1358: FMULq	dis not found

	.word 0xb7a489a0  ! 1360: FDIVs	fdivs	%f18, %f0, %f27
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_105:
	setx	0x26030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8a0  ! 1364: FSUBs	fsubs	%f19, %f0, %f24
cpu_intr_1_106:
	setx	0x25030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_107:
	setx	0x240234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 1369: FMOVRGEZ	dis not found

iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_108:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bc0000  ! 1372: XNORcc_R	xnorcc 	%r16, %r0, %r24
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_109:
	setx	0x24001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, b)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_110:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_111:
	setx	0x25020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_41:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 1383: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_42:
	mov	0xe, %r14
	.word 0xf4f384a0  ! 1384: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_112:
	setx	0x25000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba00040  ! 1395: FMOVd	fmovd	%f0, %f60
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 25)
	.word 0xbe9420a4  ! 1405: ORcc_I	orcc 	%r16, 0x00a4, %r31
	.word 0xb7aa4820  ! 1407: FMOVNE	fmovs	%fcc1, %f0, %f27
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa9c820  ! 1414: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_113:
	setx	0x2a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_69:
	mov	0x3, %r14
	.word 0xf4db8e60  ! 1417: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_rd_70:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa54840  ! 1420: FADDd	faddd	%f52, %f0, %f62
cpu_intr_1_114:
	setx	0x2a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_71:
	mov	0x7, %r14
	.word 0xfedb8400  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbac5c000  ! 1427: ADDCcc_R	addccc 	%r23, %r0, %r29
	.word 0xb9a589a0  ! 1430: FDIVs	fdivs	%f22, %f0, %f28
cpu_intr_1_115:
	setx	0x280009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9345000  ! 1433: SRLX_R	srlx	%r17, %r0, %r28
	.word 0xbda00560  ! 1434: FSQRTq	fsqrt	
	.word 0xbfa00560  ! 1435: FSQRTq	fsqrt	
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_116:
	setx	0x290230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_117:
	setx	0x280235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 1446: FMOVRZ	dis not found

iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_72:
	mov	0x25, %r14
	.word 0xf4db8400  ! 1448: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1a81820  ! 1449: FMOVRGZ	fmovs	%fcc3, %f0, %f24
T1_asi_reg_wr_43:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 1450: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_118:
	setx	0x29033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58920  ! 1457: FMULs	fmuls	%f22, %f0, %f28
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_44:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 1461: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 16)
	.word 0xb7a48940  ! 1467: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb9a44820  ! 1470: FADDs	fadds	%f17, %f0, %f28
cpu_intr_1_119:
	setx	0x2b013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44940  ! 1473: FMULd	fmuld	%f48, %f0, %f24
	.word 0xbfa5c8e0  ! 1476: FSUBq	dis not found

iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a4c8a0  ! 1481: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb3a4c9c0  ! 1482: FDIVd	fdivd	%f50, %f0, %f56
	.word 0xb1a5c920  ! 1483: FMULs	fmuls	%f23, %f0, %f24
	.word 0xb1a80420  ! 1484: FMOVRZ	dis not found

cpu_intr_1_120:
	setx	0x28011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 1486: FSQRTd	fsqrt	
	.word 0xb9a80820  ! 1487: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_45:
	mov	0x29, %r14
	.word 0xf2f38e40  ! 1488: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_73:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 1489: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_121:
	setx	0x2b022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_122:
	setx	0x2a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88cc000  ! 1492: ANDcc_R	andcc 	%r19, %r0, %r28
cpu_intr_1_123:
	setx	0x2a030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_124:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 1498: FMOVs	fmovs	%f0, %f30
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_125:
	setx	0x280237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_46:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 1510: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1aa0820  ! 1511: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb635207a  ! 1513: SUBC_I	orn 	%r20, 0x007a, %r27
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a40820  ! 1517: FADDs	fadds	%f16, %f0, %f28
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba88820  ! 1523: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 16)
	.word 0xb28c8000  ! 1527: ANDcc_R	andcc 	%r18, %r0, %r25
T1_asi_reg_wr_47:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 1529: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, e)
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_126:
	setx	0x290227, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_74:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 2)
	.word 0xbb344000  ! 1539: SRL_R	srl 	%r17, %r0, %r29
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, c)
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a90820  ! 1544: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_75:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 1546: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7346001  ! 1547: SRL_I	srl 	%r17, 0x0001, %r27
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda508a0  ! 1552: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xb134c000  ! 1553: SRL_R	srl 	%r19, %r0, %r24
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_127:
	setx	0x29003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 1557: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00520  ! 1559: FSQRTs	fsqrt	
	.word 0xb3a81420  ! 1566: FMOVRNZ	dis not found

T1_asi_reg_rd_76:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba80420  ! 1576: FMOVRZ	dis not found

	.word 0xb5518000  ! 1577: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_128:
	setx	0x2a012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb9a5c860  ! 1584: FADDq	dis not found

	.word 0xb9a50840  ! 1587: FADDd	faddd	%f20, %f0, %f28
cpu_intr_1_129:
	setx	0x290235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc258000  ! 1595: SUB_R	sub 	%r22, %r0, %r30
	.word 0xb7a489a0  ! 1597: FDIVs	fdivs	%f18, %f0, %f27
cpu_intr_1_130:
	setx	0x280308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 1599: FMOVd	fmovd	%f0, %f26
	.word 0xb9a40940  ! 1600: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb7a8c820  ! 1601: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb9a5c860  ! 1603: FADDq	dis not found

iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba9c820  ! 1605: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa5c9c0  ! 1608: FDIVd	fdivd	%f54, %f0, %f62
T1_asi_reg_wr_48:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 1609: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbea50000  ! 1610: SUBcc_R	subcc 	%r20, %r0, %r31
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 29)
	.word 0xbda00520  ! 1615: FSQRTs	fsqrt	
	.word 0xb1a00560  ! 1616: FSQRTq	fsqrt	
	.word 0xb7a00040  ! 1618: FMOVd	fmovd	%f0, %f58
T1_asi_reg_rd_77:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 1619: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_49:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 1622: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_50:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 1623: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbda488a0  ! 1624: FSUBs	fsubs	%f18, %f0, %f30
cpu_intr_1_131:
	setx	0x2b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba340000  ! 1631: ORN_R	orn 	%r16, %r0, %r29
	.word 0xbdaa8820  ! 1632: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_78:
	mov	0x31, %r14
	.word 0xf0db84a0  ! 1635: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_132:
	setx	0x28013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 1637: FMOVRLZ	dis not found

	.word 0xbda80420  ! 1639: FMOVRZ	dis not found

cpu_intr_1_133:
	setx	0x290216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_79:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a54940  ! 1649: FMULd	fmuld	%f52, %f0, %f26
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 21)
	.word 0xb7a5c9a0  ! 1655: FDIVs	fdivs	%f23, %f0, %f27
T1_asi_reg_rd_80:
	mov	0x21, %r14
	.word 0xf0db8400  ! 1658: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_81:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbb7d0400  ! 1661: MOVR_R	movre	%r20, %r0, %r29
	.word 0xbda80420  ! 1674: FMOVRZ	dis not found

	.word 0xba3c6059  ! 1675: XNOR_I	xnor 	%r17, 0x0059, %r29
	.word 0xb5343001  ! 1676: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xbda5c8c0  ! 1678: FSUBd	fsubd	%f54, %f0, %f30
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_82:
	mov	0x26, %r14
	.word 0xfadb8e60  ! 1683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_51:
	mov	0xb, %r14
	.word 0xf0f389e0  ! 1688: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7ab0820  ! 1692: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbc254000  ! 1693: SUB_R	sub 	%r21, %r0, %r30
	.word 0xb1aac820  ! 1694: FMOVGE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_52:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 1695: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9a44960  ! 1701: FMULq	dis not found

	.word 0xb3aac820  ! 1703: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0x9194a051  ! 1707: WRPR_PIL_I	wrpr	%r18, 0x0051, %pil
	.word 0xb7a84820  ! 1710: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a4c860  ! 1712: FADDq	dis not found

	.word 0xb5a549e0  ! 1713: FDIVq	dis not found

	.word 0xb9a54920  ! 1716: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb93cc000  ! 1717: SRA_R	sra 	%r19, %r0, %r28
	.word 0xbbab8820  ! 1721: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a80c20  ! 1723: FMOVRLZ	dis not found

	.word 0xbfa98820  ! 1726: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa80820  ! 1727: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb0b46065  ! 1729: SUBCcc_I	orncc 	%r17, 0x0065, %r24
T1_asi_reg_rd_83:
	mov	0x8, %r14
	.word 0xf0db8e60  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_134:
	setx	0x2a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 1746: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbfa80820  ! 1747: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_54:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 1748: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_55:
	mov	0x30, %r14
	.word 0xfcf389e0  ! 1753: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_135:
	setx	0x2a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_136:
	setx	0x2a022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3a80420  ! 1762: FMOVRZ	dis not found

cpu_intr_1_137:
	setx	0x2b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_56:
	mov	0x26, %r14
	.word 0xf0f389e0  ! 1765: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_138:
	setx	0x29033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5a00520  ! 1771: FSQRTs	fsqrt	
	.word 0xbfa00540  ! 1775: FSQRTd	fsqrt	
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa81c20  ! 1781: FMOVRGEZ	dis not found

T1_asi_reg_wr_57:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 1782: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_84:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa58940  ! 1786: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb0448000  ! 1787: ADDC_R	addc 	%r18, %r0, %r24
T1_asi_reg_wr_58:
	mov	0x7, %r14
	.word 0xfcf38e80  ! 1793: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbc0da041  ! 1794: AND_I	and 	%r22, 0x0041, %r30
cpu_intr_1_139:
	setx	0x2a0134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a50940  ! 1798: FMULd	fmuld	%f20, %f0, %f26
T1_asi_reg_rd_85:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 1800: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba44960  ! 1804: FMULq	dis not found

cpu_intr_1_140:
	setx	0x2a0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20560bf  ! 1810: ADD_I	add 	%r21, 0x00bf, %r25
T1_asi_reg_wr_59:
	mov	0x15, %r14
	.word 0xf2f389e0  ! 1813: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3a4c9c0  ! 1815: FDIVd	fdivd	%f50, %f0, %f56
T1_asi_reg_rd_86:
	mov	0x2e, %r14
	.word 0xfadb8e60  ! 1819: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_141:
	setx	0x280009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_87:
	mov	0x14, %r14
	.word 0xfedb8e80  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_142:
	setx	0x290219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_143:
	setx	0x2b0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 1826: RDPR_GL	<illegal instruction>
	.word 0xb9a50920  ! 1827: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb9a5c8e0  ! 1829: FSUBq	dis not found

	.word 0xb5a50860  ! 1830: FADDq	dis not found

	.word 0xbba5c9e0  ! 1833: FDIVq	dis not found

	.word 0xb1a84820  ! 1834: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a94820  ! 1836: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a4c8e0  ! 1839: FSUBq	dis not found

	.word 0xb814617b  ! 1843: OR_I	or 	%r17, 0x017b, %r28
	.word 0xb3a00560  ! 1846: FSQRTq	fsqrt	
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_60:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 1851: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3a508a0  ! 1852: FSUBs	fsubs	%f20, %f0, %f25
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a84820  ! 1855: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00020  ! 1858: FMOVs	fmovs	%f0, %f24
T1_asi_reg_wr_61:
	mov	0x2b, %r14
	.word 0xf0f389e0  ! 1859: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_62:
	mov	0x26, %r14
	.word 0xfcf38e80  ! 1862: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a50960  ! 1863: FMULq	dis not found

T1_asi_reg_wr_63:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 1867: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7ab0820  ! 1870: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a81c20  ! 1872: FMOVRGEZ	dis not found

	.word 0xb5a4c940  ! 1876: FMULd	fmuld	%f50, %f0, %f26
	.word 0xb1a58820  ! 1881: FADDs	fadds	%f22, %f0, %f24
cpu_intr_1_144:
	setx	0x2e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa4c8c0  ! 1884: FSUBd	fsubd	%f50, %f0, %f62
cpu_intr_1_145:
	setx	0x2f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9ab4820  ! 1889: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_88:
	mov	0x5, %r14
	.word 0xf4db8e60  ! 1890: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb33cc000  ! 1894: SRA_R	sra 	%r19, %r0, %r25
	.word 0xbfab0820  ! 1896: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_146:
	setx	0x2f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_64:
	mov	0x15, %r14
	.word 0xfaf38e40  ! 1909: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a80c20  ! 1910: FMOVRLZ	dis not found

	.word 0xb9aa4820  ! 1911: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a90820  ! 1913: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1ab4820  ! 1914: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa0820  ! 1915: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_147:
	setx	0x2c0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4458000  ! 1918: ADDC_R	addc 	%r22, %r0, %r26
cpu_intr_1_148:
	setx	0x2e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c860  ! 1921: FADDq	dis not found

cpu_intr_1_149:
	setx	0x2c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1a00020  ! 1928: FMOVs	fmovs	%f0, %f24
T1_asi_reg_rd_89:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5a8c820  ! 1933: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_90:
	mov	0xa, %r14
	.word 0xfadb8400  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda80c20  ! 1938: FMOVRLZ	dis not found

	.word 0xb3a44920  ! 1939: FMULs	fmuls	%f17, %f0, %f25
T1_asi_reg_rd_91:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 1942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9a489a0  ! 1943: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xbda00020  ! 1944: FMOVs	fmovs	%f0, %f30
T1_asi_reg_wr_65:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 1945: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_92:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 1946: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_150:
	setx	0x2d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 1954: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_151:
	setx	0x2d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 1957: FSQRTs	fsqrt	
T1_asi_reg_wr_66:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 1958: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbda81820  ! 1960: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 9)
	.word 0xb97c4400  ! 1962: MOVR_R	movre	%r17, %r0, %r28
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_93:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_94:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3a54840  ! 1978: FADDd	faddd	%f52, %f0, %f56
	.word 0xb9a90820  ! 1980: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa98820  ! 1984: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb434a0cf  ! 1985: SUBC_I	orn 	%r18, 0x00cf, %r26
T1_asi_reg_rd_95:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3a81c20  ! 1992: FMOVRGEZ	dis not found

iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfaa4820  ! 1995: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3aa8820  ! 2000: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_67:
	mov	0x15, %r14
	.word 0xfcf38400  ! 2001: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_96:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 2003: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfa88820  ! 2004: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbea5a047  ! 2005: SUBcc_I	subcc 	%r22, 0x0047, %r31
T1_asi_reg_wr_68:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 2007: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_97:
	mov	0x12, %r14
	.word 0xf4db8e40  ! 2008: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_98:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 2009: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbba00560  ! 2011: FSQRTq	fsqrt	
	.word 0xb5a80820  ! 2012: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbda54920  ! 2018: FMULs	fmuls	%f21, %f0, %f30
	.word 0xbba81820  ! 2021: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_wr_69:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 2026: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfa94820  ! 2028: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa80420  ! 2029: FMOVRZ	dis not found

cpu_intr_1_152:
	setx	0x2f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 2034: FMOVLEU	fmovs	%fcc1, %f0, %f30
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a4c9e0  ! 2040: FDIVq	dis not found

	.word 0xb9a00020  ! 2044: FMOVs	fmovs	%f0, %f28
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a54860  ! 2062: FADDq	dis not found

	.word 0xbf3de001  ! 2064: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xbbaa4820  ! 2066: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb9a00520  ! 2068: FSQRTs	fsqrt	
	.word 0xb7a48860  ! 2071: FADDq	dis not found

T1_asi_reg_rd_99:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 2072: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_wr_70:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 2073: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb2ac201c  ! 2074: ANDNcc_I	andncc 	%r16, 0x001c, %r25
	.word 0xb5a5c840  ! 2076: FADDd	faddd	%f54, %f0, %f26
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_153:
	setx	0x2f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 2084: FMOVd	fmovd	%f0, %f24
	.word 0xbba00540  ! 2086: FSQRTd	fsqrt	
T1_asi_reg_rd_100:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 2089: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_rd_101:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 2090: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_71:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 2091: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5aa8820  ! 2092: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c9e0  ! 2094: FDIVq	dis not found

iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 3)
	.word 0xbaad0000  ! 2098: ANDNcc_R	andncc 	%r20, %r0, %r29
cpu_intr_1_154:
	setx	0x2e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d8000  ! 2104: SLL_R	sll 	%r22, %r0, %r25
T1_asi_reg_rd_102:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3a80820  ! 2110: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb9a48840  ! 2112: FADDd	faddd	%f18, %f0, %f28
	.word 0xbba84820  ! 2115: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9351000  ! 2116: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xbba88820  ! 2118: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, d)
	lda	[%r19 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_155:
	setx	0x2e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_103:
	mov	0x1f, %r14
	.word 0xf0db8400  ! 2127: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb3a508a0  ! 2128: FSUBs	fsubs	%f20, %f0, %f25
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a9c820  ! 2132: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a4c8c0  ! 2133: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xb3ab4820  ! 2136: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_104:
	mov	0x21, %r14
	.word 0xf4db8400  ! 2141: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_156:
	setx	0x2c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebce169  ! 2148: XNORcc_I	xnorcc 	%r19, 0x0169, %r31
T1_asi_reg_wr_72:
	mov	0xc, %r14
	.word 0xfef38e80  ! 2149: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbb3d8000  ! 2150: SRA_R	sra 	%r22, %r0, %r29
	.word 0xb5a5c920  ! 2153: FMULs	fmuls	%f23, %f0, %f26
T1_asi_reg_rd_105:
	mov	0x1f, %r14
	.word 0xf2db89e0  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfa90820  ! 2159: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a588c0  ! 2160: FSUBd	fsubd	%f22, %f0, %f58
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_157:
	setx	0x2d0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 2169: FSQRTq	fsqrt	
	.word 0xb5a4c960  ! 2170: FMULq	dis not found

	.word 0xb7a549c0  ! 2173: FDIVd	fdivd	%f52, %f0, %f58
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_158:
	setx	0x2d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 2178: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00540  ! 2179: FSQRTd	fsqrt	
	.word 0xb6ac0000  ! 2181: ANDNcc_R	andncc 	%r16, %r0, %r27
T1_asi_reg_rd_106:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbe0de144  ! 2183: AND_I	and 	%r23, 0x0144, %r31
T1_asi_reg_wr_73:
	mov	0x6, %r14
	.word 0xf8f389e0  ! 2184: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb734e001  ! 2186: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xb7a84820  ! 2189: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_159:
	setx	0x2f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 2193: FMOVs	fmovs	%f0, %f27
cpu_intr_1_160:
	setx	0x2e0017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_161:
	setx	0x2c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_107:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_108:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 2204: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_162:
	setx	0x2e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a94820  ! 2211: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a44960  ! 2220: FMULq	dis not found

cpu_intr_1_163:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_109:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbba4c9c0  ! 2223: FDIVd	fdivd	%f50, %f0, %f60
T1_asi_reg_rd_110:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 2224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9a40940  ! 2226: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb9a94820  ! 2229: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbda48940  ! 2230: FMULd	fmuld	%f18, %f0, %f30
cpu_intr_1_164:
	setx	0x2e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448e0  ! 2236: FSUBq	dis not found

iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a588c0  ! 2239: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb1a00040  ! 2240: FMOVd	fmovd	%f0, %f24
	.word 0xbdaa4820  ! 2241: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a44940  ! 2242: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb5abc820  ! 2243: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 2245: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00040  ! 2247: FMOVd	fmovd	%f0, %f24
	.word 0xb9a548e0  ! 2248: FSUBq	dis not found

	.word 0xbda50920  ! 2249: FMULs	fmuls	%f20, %f0, %f30
	.word 0xb9a58960  ! 2251: FMULq	dis not found

	.word 0xb1a00540  ! 2253: FSQRTd	fsqrt	
cpu_intr_1_165:
	setx	0x2d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8c0  ! 2258: FSUBd	fsubd	%f54, %f0, %f26
T1_asi_reg_wr_74:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 2259: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, a)
	.word 0xb9a80420  ! 2261: FMOVRZ	dis not found

iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_166:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_75:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 2266: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_167:
	setx	0x2c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_111:
	mov	0xe, %r14
	.word 0xf0db8e60  ! 2278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_wr_76:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 2279: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_112:
	mov	0xb, %r14
	.word 0xfcdb84a0  ! 2281: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbd2c1000  ! 2283: SLLX_R	sllx	%r16, %r0, %r30
cpu_intr_1_168:
	setx	0x2c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_169:
	setx	0x2f0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 2289: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb734e001  ! 2290: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xb7a588c0  ! 2293: FSUBd	fsubd	%f22, %f0, %f58
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_170:
	setx	0x2e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6850000  ! 2301: ADDcc_R	addcc 	%r20, %r0, %r27
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 20)
	.word 0xb80560b4  ! 2304: ADD_I	add 	%r21, 0x00b4, %r28
	.word 0xb1a44940  ! 2305: FMULd	fmuld	%f48, %f0, %f24
	.word 0xb5a408a0  ! 2306: FSUBs	fsubs	%f16, %f0, %f26
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 30)
	.word 0xb0852119  ! 2310: ADDcc_I	addcc 	%r20, 0x0119, %r24
T1_asi_reg_rd_113:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 2312: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a00560  ! 2317: FSQRTq	fsqrt	
T1_asi_reg_wr_77:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 2319: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb1abc820  ! 2321: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_171:
	setx	0x30010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9aa0820  ! 2326: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb69dc000  ! 2328: XORcc_R	xorcc 	%r23, %r0, %r27
T1_asi_reg_wr_78:
	mov	0x12, %r14
	.word 0xf0f389e0  ! 2329: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_79:
	mov	0xd, %r14
	.word 0xfaf389e0  ! 2330: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_172:
	setx	0x30033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab4c000  ! 2332: SUBCcc_R	orncc 	%r19, %r0, %r29
T1_asi_reg_rd_114:
	mov	0x9, %r14
	.word 0xfcdb8e60  ! 2335: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5520000  ! 2338: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, d)
	.word 0xb7aac820  ! 2346: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a5c9a0  ! 2347: FDIVs	fdivs	%f23, %f0, %f28
T1_asi_reg_rd_115:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbeb48000  ! 2350: SUBCcc_R	orncc 	%r18, %r0, %r31
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a488a0  ! 2357: FSUBs	fsubs	%f18, %f0, %f25
T1_asi_reg_wr_80:
	mov	0x5, %r14
	.word 0xf0f384a0  ! 2359: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_173:
	setx	0x31031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_174:
	setx	0x31012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_81:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 2365: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb095a01c  ! 2367: ORcc_I	orcc 	%r22, 0x001c, %r24
	.word 0xb5a81420  ! 2370: FMOVRNZ	dis not found

	.word 0xb9a00540  ! 2375: FSQRTd	fsqrt	
	.word 0xb81d4000  ! 2383: XOR_R	xor 	%r21, %r0, %r28
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a54840  ! 2394: FADDd	faddd	%f52, %f0, %f24
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_176:
	setx	0x33031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x300314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_82:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 2403: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_116:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 2405: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1a449e0  ! 2407: FDIVq	dis not found

	.word 0xbca44000  ! 2409: SUBcc_R	subcc 	%r17, %r0, %r30
T1_asi_reg_rd_117:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 2414: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_rd_118:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb234a140  ! 2418: SUBC_I	orn 	%r18, 0x0140, %r25
T1_asi_reg_rd_119:
	mov	0x16, %r14
	.word 0xf2db89e0  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_83:
	mov	0x2d, %r14
	.word 0xfef389e0  ! 2424: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_84:
	mov	0x38, %r14
	.word 0xf6f38e60  ! 2426: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1a80420  ! 2427: FMOVRZ	dis not found

	.word 0xb3a50940  ! 2428: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbfa44840  ! 2432: FADDd	faddd	%f48, %f0, %f62
	.word 0xbc3d6128  ! 2433: XNOR_I	xnor 	%r21, 0x0128, %r30
T1_asi_reg_rd_120:
	mov	0x1b, %r14
	.word 0xf8db84a0  ! 2437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb3a4c920  ! 2440: FMULs	fmuls	%f19, %f0, %f25
	.word 0xb1a8c820  ! 2442: FMOVL	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_121:
	mov	0x28, %r14
	.word 0xf8db84a0  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5ab4820  ! 2445: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbbab4820  ! 2448: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa8820  ! 2455: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbba00020  ! 2457: FMOVs	fmovs	%f0, %f29
	.word 0xbda54820  ! 2458: FADDs	fadds	%f21, %f0, %f30
	.word 0xb3a00020  ! 2461: FMOVs	fmovs	%f0, %f25
	.word 0xbba50920  ! 2462: FMULs	fmuls	%f20, %f0, %f29
cpu_intr_1_178:
	setx	0x320224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c3001  ! 2469: SLLX_I	sllx	%r16, 0x0001, %r24
cpu_intr_1_179:
	setx	0x330223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 2477: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb5349000  ! 2479: SRLX_R	srlx	%r18, %r0, %r26
T1_asi_reg_wr_85:
	mov	0x1b, %r14
	.word 0xfef384a0  ! 2480: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_wr_86:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 2486: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_180:
	setx	0x31002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 2491: FSQRTd	fsqrt	
cpu_intr_1_181:
	setx	0x32001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 0)
	.word 0xb1a4c9c0  ! 2499: FDIVd	fdivd	%f50, %f0, %f24
cpu_intr_1_182:
	setx	0x300218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54820  ! 2502: FADDs	fadds	%f21, %f0, %f26
T1_asi_reg_rd_122:
	mov	0xf, %r14
	.word 0xf4db8e80  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_183:
	setx	0x31012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 2507: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
cpu_intr_1_184:
	setx	0x320115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba042006  ! 2513: ADD_I	add 	%r16, 0x0006, %r29
T1_asi_reg_wr_87:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2515: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_88:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 2516: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_185:
	setx	0x320219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb40000  ! 2520: SUBCcc_R	orncc 	%r16, %r0, %r30
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbba5c860  ! 2523: FADDq	dis not found

	.word 0xb7aa4820  ! 2528: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_186:
	setx	0x31030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c860  ! 2530: FADDq	dis not found

iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb2bd8000  ! 2533: XNORcc_R	xnorcc 	%r22, %r0, %r25
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_123:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb1a94820  ! 2542: FMOVCS	fmovs	%fcc1, %f0, %f24
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_89:
	mov	0x37, %r14
	.word 0xfef384a0  ! 2546: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbc45e07d  ! 2547: ADDC_I	addc 	%r23, 0x007d, %r30
T1_asi_reg_rd_124:
	mov	0x2e, %r14
	.word 0xf6db8e40  ! 2548: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa48820  ! 2549: FADDs	fadds	%f18, %f0, %f31
cpu_intr_1_187:
	setx	0x300118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_125:
	mov	0xc, %r14
	.word 0xfcdb8e80  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3a88820  ! 2554: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbba4c9c0  ! 2557: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xbda00540  ! 2559: FSQRTd	fsqrt	
T1_asi_reg_rd_126:
	mov	0x0, %r14
	.word 0xfadb89e0  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9a00520  ! 2562: FSQRTs	fsqrt	
cpu_intr_1_188:
	setx	0x320216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_127:
	mov	0xf, %r14
	.word 0xfadb8e40  ! 2565: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3aa8820  ! 2566: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a00520  ! 2567: FSQRTs	fsqrt	
cpu_intr_1_189:
	setx	0x310322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c9e0  ! 2571: FDIVq	dis not found

iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_90:
	mov	0x1b, %r14
	.word 0xfaf384a0  ! 2575: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_wr_91:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 2578: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb8ad2135  ! 2579: ANDNcc_I	andncc 	%r20, 0x0135, %r28
T1_asi_reg_wr_92:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2580: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_190:
	setx	0x30032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb92c6001  ! 2586: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xb8b54000  ! 2590: ORNcc_R	orncc 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_93:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 2597: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1a00520  ! 2599: FSQRTs	fsqrt	
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_94:
	mov	0x28, %r14
	.word 0xfef38e80  ! 2604: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_128:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_191:
	setx	0x32000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57c4400  ! 2616: MOVR_R	movre	%r17, %r0, %r26
	.word 0x83952172  ! 2617: WRPR_TNPC_I	wrpr	%r20, 0x0172, %tnpc
	.word 0xb3aa8820  ! 2620: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a81420  ! 2624: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_192:
	setx	0x30031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 2627: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a50940  ! 2630: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbfa80420  ! 2634: FMOVRZ	dis not found

	.word 0xbfa50920  ! 2636: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb3aac820  ! 2637: FMOVGE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba80420  ! 2640: FMOVRZ	dis not found

iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_95:
	mov	0x1e, %r14
	.word 0xf4f384a0  ! 2645: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_96:
	mov	0x37, %r14
	.word 0xf4f38e80  ! 2647: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_193:
	setx	0x330232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_97:
	mov	0x1e, %r14
	.word 0xfef38e80  ! 2657: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda81420  ! 2659: FMOVRNZ	dis not found

	.word 0xb1a409c0  ! 2660: FDIVd	fdivd	%f16, %f0, %f24
cpu_intr_1_194:
	setx	0x320313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3aa8820  ! 2665: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb8c54000  ! 2667: ADDCcc_R	addccc 	%r21, %r0, %r28
	.word 0x8f902001  ! 2671: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cpu_intr_1_195:
	setx	0x330029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba54960  ! 2675: FMULq	dis not found

	.word 0xb1a81420  ! 2677: FMOVRNZ	dis not found

iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5a81420  ! 2682: FMOVRNZ	dis not found

	.word 0xba9c4000  ! 2683: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xbda00520  ! 2686: FSQRTs	fsqrt	
	.word 0xbe05c000  ! 2688: ADD_R	add 	%r23, %r0, %r31
T1_asi_reg_wr_98:
	mov	0x1f, %r14
	.word 0xf4f38e80  ! 2689: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbbaa4820  ! 2690: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0x8f902001  ! 2691: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T1_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 2692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7aac820  ! 2693: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbda409c0  ! 2700: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xbfa549a0  ! 2702: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xb3a80820  ! 2705: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb3343001  ! 2706: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xb3aac820  ! 2707: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a9c820  ! 2712: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c8c0  ! 2715: FSUBd	fsubd	%f54, %f0, %f56
cpu_intr_1_196:
	setx	0x310224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb56107  ! 2718: ORNcc_I	orncc 	%r21, 0x0107, %r30
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 35)
	.word 0xb245c000  ! 2721: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xb5a00040  ! 2722: FMOVd	fmovd	%f0, %f26
cpu_intr_1_197:
	setx	0x33001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_198:
	setx	0x330018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_199:
	setx	0x330010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 2728: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb1abc820  ! 2729: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00520  ! 2731: FSQRTs	fsqrt	
cpu_intr_1_200:
	setx	0x33010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c820  ! 2736: FADDs	fadds	%f19, %f0, %f24
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_99:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2739: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_201:
	setx	0x32032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc50000  ! 2752: ADDCcc_R	addccc 	%r20, %r0, %r30
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a4c820  ! 2755: FADDs	fadds	%f19, %f0, %f25
	.word 0xb3a90820  ! 2756: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_100:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 2759: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb204a07b  ! 2760: ADD_I	add 	%r18, 0x007b, %r25
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfa58940  ! 2765: FMULd	fmuld	%f22, %f0, %f62
T1_asi_reg_rd_130:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_202:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81820  ! 2769: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbba58820  ! 2770: FADDs	fadds	%f22, %f0, %f29
	.word 0xb3a5c9a0  ! 2771: FDIVs	fdivs	%f23, %f0, %f25
T1_asi_reg_rd_131:
	mov	0x13, %r14
	.word 0xf6db8e60  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbe454000  ! 2776: ADDC_R	addc 	%r21, %r0, %r31
cpu_intr_1_203:
	setx	0x36031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_101:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 2780: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba00020  ! 2781: FMOVs	fmovs	%f0, %f29
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb9abc820  ! 2787: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_204:
	setx	0x34023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 2790: FMOVRLZ	dis not found

	.word 0x9194219a  ! 2791: WRPR_PIL_I	wrpr	%r16, 0x019a, %pil
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a4c920  ! 2799: FMULs	fmuls	%f19, %f0, %f25
	.word 0x8d94a1c7  ! 2802: WRPR_PSTATE_I	wrpr	%r18, 0x01c7, %pstate
cpu_intr_1_205:
	setx	0x36030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 2)
	.word 0xb7a00560  ! 2809: FSQRTq	fsqrt	
	.word 0xb3aac820  ! 2812: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb5a54860  ! 2813: FADDq	dis not found

	.word 0xbda549c0  ! 2816: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xbfaa8820  ! 2817: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa00560  ! 2818: FSQRTq	fsqrt	
	.word 0xbba94820  ! 2820: FMOVCS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_132:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbda508c0  ! 2824: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xb5a9c820  ! 2829: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_133:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 2831: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_206:
	setx	0x350236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb3aa4820  ! 2849: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00020  ! 2851: FMOVs	fmovs	%f0, %f28
	.word 0xb1ab8820  ! 2852: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb824e0c8  ! 2855: SUB_I	sub 	%r19, 0x00c8, %r28
cpu_intr_1_207:
	setx	0x35013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_208:
	setx	0x340212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 2870: FSQRTd	fsqrt	
	.word 0xbda00540  ! 2871: FSQRTd	fsqrt	
	.word 0xbfa9c820  ! 2873: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a409c0  ! 2874: FDIVd	fdivd	%f16, %f0, %f56
cpu_intr_1_209:
	setx	0x340106, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a40960  ! 2879: FMULq	dis not found

iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5aa4820  ! 2881: FMOVNE	fmovs	%fcc1, %f0, %f26
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a4c920  ! 2886: FMULs	fmuls	%f19, %f0, %f25
	.word 0xbba409e0  ! 2887: FDIVq	dis not found

cpu_intr_1_210:
	setx	0x37001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_102:
	mov	0x3, %r14
	.word 0xf0f38e80  ! 2889: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7aa4820  ! 2899: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_211:
	setx	0x340309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c960  ! 2902: FMULq	dis not found

	.word 0xb1a449e0  ! 2904: FDIVq	dis not found

	.word 0xb7a00540  ! 2905: FSQRTd	fsqrt	
	.word 0xbfab8820  ! 2906: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb92c7001  ! 2908: SLLX_I	sllx	%r17, 0x0001, %r28
T1_asi_reg_rd_134:
	mov	0x30, %r14
	.word 0xf6db8400  ! 2909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, a)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb2bc60b9  ! 2913: XNORcc_I	xnorcc 	%r17, 0x00b9, %r25
	.word 0xb1ab0820  ! 2914: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb7abc820  ! 2915: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_212:
	setx	0x350327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb50000  ! 2919: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xb9a9c820  ! 2920: FMOVVS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a81c20  ! 2922: FMOVRGEZ	dis not found

cpu_intr_1_213:
	setx	0x360011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_214:
	setx	0x360216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2250000  ! 2931: SUB_R	sub 	%r20, %r0, %r25
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_215:
	setx	0x37032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a8c820  ! 2937: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbc154000  ! 2939: OR_R	or 	%r21, %r0, %r30
	.word 0xbfa5c820  ! 2940: FADDs	fadds	%f23, %f0, %f31
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9a50860  ! 2943: FADDq	dis not found

T1_asi_reg_rd_135:
	mov	0x10, %r14
	.word 0xfadb8e80  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_136:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_103:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 2948: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_wr_104:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 2951: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9a4c960  ! 2952: FMULq	dis not found

T1_asi_reg_wr_105:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 2953: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb1a80820  ! 2955: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_106:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 2957: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_216:
	setx	0x36022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_217:
	setx	0x360320, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_137:
	mov	0x2c, %r14
	.word 0xf8db89e0  ! 2962: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_218:
	setx	0x360225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a94820  ! 2968: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb444613e  ! 2971: ADDC_I	addc 	%r17, 0x013e, %r26
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_219:
	setx	0x370017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_220:
	setx	0x340007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c960  ! 2982: FMULq	dis not found

cpu_intr_1_221:
	setx	0x37002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_222:
	setx	0x350130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 19)
	.word 0xbf540000  ! 2986: RDPR_GL	<illegal instruction>
cpu_intr_1_223:
	setx	0x360332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca58000  ! 2993: SUBcc_R	subcc 	%r22, %r0, %r30
cpu_intr_1_224:
	setx	0x360332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0x35, %r14
	.word 0xf8f38e60  ! 2995: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_108:
	mov	0x2e, %r14
	.word 0xf8f384a0  ! 3000: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfa44820  ! 3001: FADDs	fadds	%f17, %f0, %f31
T1_asi_reg_rd_138:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 3007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbda00560  ! 3010: FSQRTq	fsqrt	
T1_asi_reg_rd_139:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_225:
	setx	0x34013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58960  ! 3018: FMULq	dis not found

	.word 0xbc44a0c4  ! 3019: ADDC_I	addc 	%r18, 0x00c4, %r30
	.word 0xbeb54000  ! 3021: ORNcc_R	orncc 	%r21, %r0, %r31
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 5)
	.word 0xbda90820  ! 3025: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbfa4c8e0  ! 3026: FSUBq	dis not found

	.word 0xbfa549e0  ! 3027: FDIVq	dis not found

	.word 0xb9a00520  ! 3028: FSQRTs	fsqrt	
	.word 0xb1a80820  ! 3030: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7a50940  ! 3032: FMULd	fmuld	%f20, %f0, %f58
	.word 0xba3460a6  ! 3034: SUBC_I	orn 	%r17, 0x00a6, %r29
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 32)
	.word 0xb52c7001  ! 3042: SLLX_I	sllx	%r17, 0x0001, %r26
	.word 0xbdaa8820  ! 3044: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbba408a0  ! 3049: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xbba50940  ! 3050: FMULd	fmuld	%f20, %f0, %f60
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba80c20  ! 3057: FMOVRLZ	dis not found

T1_asi_reg_rd_140:
	mov	0xa, %r14
	.word 0xf6db84a0  ! 3067: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_109:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 3068: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1a80c20  ! 3076: FMOVRLZ	dis not found

cpu_intr_1_226:
	setx	0x370113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58840  ! 3083: FADDd	faddd	%f22, %f0, %f60
	.word 0xbba5c960  ! 3089: FMULq	dis not found

	.word 0xbfa4c9e0  ! 3091: FDIVq	dis not found

	.word 0xb9a5c960  ! 3092: FMULq	dis not found

	.word 0xb9a4c960  ! 3093: FMULq	dis not found

	.word 0xb1a588c0  ! 3098: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xbfa5c9e0  ! 3099: FDIVq	dis not found

T1_asi_reg_rd_141:
	mov	0x0, %r14
	.word 0xf0db8e80  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7a50840  ! 3105: FADDd	faddd	%f20, %f0, %f58
	.word 0xb3aa8820  ! 3106: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_227:
	setx	0x350204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb62c60c8  ! 3116: ANDN_I	andn 	%r17, 0x00c8, %r27
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_110:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 3121: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb6a4a069  ! 3124: SUBcc_I	subcc 	%r18, 0x0069, %r27
	.word 0xbda44860  ! 3125: FADDq	dis not found

	.word 0xb9a50840  ! 3126: FADDd	faddd	%f20, %f0, %f28
cpu_intr_1_228:
	setx	0x37031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_229:
	setx	0x350002, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_142:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_230:
	setx	0x350006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48820  ! 3132: FADDs	fadds	%f18, %f0, %f28
T1_asi_reg_rd_143:
	mov	0x1, %r14
	.word 0xfedb8400  ! 3133: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9a548a0  ! 3134: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xbba80820  ! 3135: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_231:
	setx	0x36001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68ca114  ! 3141: ANDcc_I	andcc 	%r18, 0x0114, %r27
	.word 0xb9a489a0  ! 3143: FDIVs	fdivs	%f18, %f0, %f28
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 10)
	.word 0xbfa88820  ! 3148: FMOVLE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_232:
	setx	0x370014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 3152: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbba5c9c0  ! 3153: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xbfab8820  ! 3154: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb9ab0820  ! 3156: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb3a00020  ! 3158: FMOVs	fmovs	%f0, %f25
T1_asi_reg_wr_111:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 3159: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_233:
	setx	0x37030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_234:
	setx	0x35011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72dc000  ! 3170: SLL_R	sll 	%r23, %r0, %r27
	.word 0xb1a5c9e0  ! 3172: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_112:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 3176: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_235:
	setx	0x340019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7a94820  ! 3181: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_236:
	setx	0x350326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54920  ! 3187: FMULs	fmuls	%f21, %f0, %f30
	.word 0xb32d8000  ! 3188: SLL_R	sll 	%r22, %r0, %r25
	.word 0xbfa00560  ! 3193: FSQRTq	fsqrt	
	.word 0xb285e174  ! 3194: ADDcc_I	addcc 	%r23, 0x0174, %r25
	.word 0xb8bc0000  ! 3199: XNORcc_R	xnorcc 	%r16, %r0, %r28
	.word 0xb4b4207f  ! 3201: SUBCcc_I	orncc 	%r16, 0x007f, %r26
	.word 0xb73c7001  ! 3202: SRAX_I	srax	%r17, 0x0001, %r27
	.word 0xb1aa4820  ! 3203: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_113:
	mov	0x10, %r14
	.word 0xfcf38e80  ! 3209: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb5a00560  ! 3210: FSQRTq	fsqrt	
cpu_intr_1_237:
	setx	0x360107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 3213: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbda80820  ! 3215: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbeb5607e  ! 3216: SUBCcc_I	orncc 	%r21, 0x007e, %r31
	.word 0xbe1ca0c7  ! 3221: XOR_I	xor 	%r18, 0x00c7, %r31
	.word 0xb3a50940  ! 3222: FMULd	fmuld	%f20, %f0, %f56
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_238:
	setx	0x350116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_239:
	setx	0x360109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 3232: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_114:
	mov	0x11, %r14
	.word 0xf2f38e60  ! 3233: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_240:
	setx	0x36021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488e0  ! 3236: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a50960  ! 3240: FMULq	dis not found

T1_asi_reg_wr_115:
	mov	0x12, %r14
	.word 0xfef38400  ! 3242: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_241:
	setx	0x3a012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_242:
	setx	0x3a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_116:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 3248: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_243:
	setx	0x3b0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_244:
	setx	0x390106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63ca179  ! 3252: XNOR_I	xnor 	%r18, 0x0179, %r27
	.word 0xbc05a194  ! 3255: ADD_I	add 	%r22, 0x0194, %r30
	.word 0xbb2d4000  ! 3258: SLL_R	sll 	%r21, %r0, %r29
cpu_intr_1_245:
	setx	0x380327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_144:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbba5c940  ! 3269: FMULd	fmuld	%f54, %f0, %f60
	.word 0xb3a80820  ! 3270: FMOVN	fmovs	%fcc1, %f0, %f25
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a9c820  ! 3273: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_246:
	setx	0x390306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_247:
	setx	0x39003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 3284: FSQRTd	fsqrt	
	.word 0xb1a84820  ! 3285: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_117:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 3286: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbda449a0  ! 3287: FDIVs	fdivs	%f17, %f0, %f30
T1_asi_reg_rd_145:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 3288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda509e0  ! 3290: FDIVq	dis not found

	.word 0xb7a8c820  ! 3291: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbdaa0820  ! 3296: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_248:
	setx	0x3b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_249:
	setx	0x3a0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_250:
	setx	0x390332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_146:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 3305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3a549e0  ! 3312: FDIVq	dis not found

T1_asi_reg_wr_118:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 3315: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbb508000  ! 3321: RDPR_TSTATE	<illegal instruction>
T1_asi_reg_rd_147:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 3323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda58840  ! 3324: FADDd	faddd	%f22, %f0, %f30
T1_asi_reg_wr_119:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 3325: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1aa4820  ! 3326: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_120:
	mov	0x1e, %r14
	.word 0xf4f38e60  ! 3327: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1ab8820  ! 3328: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_148:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb53d3001  ! 3330: SRAX_I	srax	%r20, 0x0001, %r26
cpu_intr_1_251:
	setx	0x380208, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_149:
	mov	0xf, %r14
	.word 0xf2db89e0  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1a00520  ! 3341: FSQRTs	fsqrt	
cpu_intr_1_252:
	setx	0x390207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_253:
	setx	0x3a0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 3346: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a00540  ! 3347: FSQRTd	fsqrt	
	.word 0xbab58000  ! 3350: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xb5a4c8a0  ! 3352: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xbfa84820  ! 3353: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_150:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_151:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 3357: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_254:
	setx	0x380237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_152:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_121:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 3370: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_122:
	mov	0x31, %r14
	.word 0xf6f38400  ! 3373: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7a98820  ! 3375: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_153:
	mov	0x22, %r14
	.word 0xf4db84a0  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_255:
	setx	0x380221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_256:
	setx	0x390329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a448c0  ! 3387: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb5a44840  ! 3388: FADDd	faddd	%f48, %f0, %f26
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a549e0  ! 3390: FDIVq	dis not found

	.word 0xb3a448c0  ! 3391: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xb5a54940  ! 3393: FMULd	fmuld	%f52, %f0, %f26
T1_asi_reg_rd_154:
	mov	0xb, %r14
	.word 0xf8db8e80  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb815215b  ! 3397: OR_I	or 	%r20, 0x015b, %r28
	.word 0xb9a00040  ! 3399: FMOVd	fmovd	%f0, %f28
	.word 0xb684c000  ! 3401: ADDcc_R	addcc 	%r19, %r0, %r27
	.word 0xbda00540  ! 3402: FSQRTd	fsqrt	
	.word 0xbba4c9c0  ! 3403: FDIVd	fdivd	%f50, %f0, %f60
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda488c0  ! 3414: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xb0344000  ! 3417: ORN_R	orn 	%r17, %r0, %r24
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba58820  ! 3423: FADDs	fadds	%f22, %f0, %f29
cpu_intr_1_257:
	setx	0x39012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48820  ! 3428: FADDs	fadds	%f18, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda8c820  ! 3431: FMOVL	fmovs	%fcc1, %f0, %f30
cpu_intr_1_258:
	setx	0x3b033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_259:
	setx	0x390024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 3437: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_155:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 3439: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a508c0  ! 3440: FSUBd	fsubd	%f20, %f0, %f24
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb3a00560  ! 3443: FSQRTq	fsqrt	
	.word 0xbfa90820  ! 3444: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a50820  ! 3445: FADDs	fadds	%f20, %f0, %f27
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_123:
	mov	0x33, %r14
	.word 0xf8f38e60  ! 3448: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xba1460ce  ! 3449: OR_I	or 	%r17, 0x00ce, %r29
	.word 0xb9a489e0  ! 3450: FDIVq	dis not found

	.word 0xb3a81820  ! 3452: FMOVRGZ	fmovs	%fcc3, %f0, %f25
T1_asi_reg_rd_156:
	mov	0x31, %r14
	.word 0xfcdb8e60  ! 3453: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 16)
	.word 0xba95e0b0  ! 3456: ORcc_I	orcc 	%r23, 0x00b0, %r29
	.word 0xbb3c1000  ! 3457: SRAX_R	srax	%r16, %r0, %r29
	.word 0xb3a509a0  ! 3458: FDIVs	fdivs	%f20, %f0, %f25
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 7)
	.word 0xbdaa8820  ! 3464: FMOVG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_260:
	setx	0x380015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_261:
	setx	0x39023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48940  ! 3475: FMULd	fmuld	%f18, %f0, %f60
	.word 0xb83c0000  ! 3477: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xb88d60b4  ! 3480: ANDcc_I	andcc 	%r21, 0x00b4, %r28
	.word 0xb3a81420  ! 3481: FMOVRNZ	dis not found

	.word 0xb7aa0820  ! 3482: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba48960  ! 3485: FMULq	dis not found

iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_157:
	mov	0x38, %r14
	.word 0xf6db8e60  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5a98820  ! 3489: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a409e0  ! 3492: FDIVq	dis not found

T1_asi_reg_rd_158:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 3493: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_124:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 3501: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1a00020  ! 3502: FMOVs	fmovs	%f0, %f24
T1_asi_reg_rd_159:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 3503: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9a81820  ! 3507: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb1a81420  ! 3508: FMOVRNZ	dis not found

cpu_intr_1_262:
	setx	0x390306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 3512: FSQRTs	fsqrt	
	.word 0xbba4c9e0  ! 3518: FDIVq	dis not found

	.word 0xbda88820  ! 3520: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00560  ! 3522: FSQRTq	fsqrt	
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_160:
	mov	0x3, %r14
	.word 0xfedb8400  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbdaa0820  ! 3531: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb21d8000  ! 3532: XOR_R	xor 	%r22, %r0, %r25
T1_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xf0f38e80  ! 3535: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_263:
	setx	0x38001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 3540: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_161:
	mov	0x2a, %r14
	.word 0xf0db84a0  ! 3541: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_264:
	setx	0x380306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bdc000  ! 3546: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xbba00520  ! 3549: FSQRTs	fsqrt	
	.word 0xb7a54860  ! 3550: FADDq	dis not found

	.word 0xb3a94820  ! 3551: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_162:
	mov	0x10, %r14
	.word 0xf0db8400  ! 3553: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb42d6005  ! 3555: ANDN_I	andn 	%r21, 0x0005, %r26
T1_asi_reg_wr_126:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 3556: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_127:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 3557: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_265:
	setx	0x380019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_266:
	setx	0x380313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 3565: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_267:
	setx	0x3b0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a489c0  ! 3569: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xb3a81820  ! 3572: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a80420  ! 3575: FMOVRZ	dis not found

T1_asi_reg_rd_163:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 3578: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_268:
	setx	0x39002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_164:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 3581: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9a50960  ! 3587: FMULq	dis not found

	.word 0xbfa509c0  ! 3590: FDIVd	fdivd	%f20, %f0, %f62
cpu_intr_1_269:
	setx	0x38012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_128:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 3597: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_129:
	mov	0x17, %r14
	.word 0xf0f38e60  ! 3598: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_130:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 3604: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_131:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 3608: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 16)
	.word 0xb2b4e1c9  ! 3614: ORNcc_I	orncc 	%r19, 0x01c9, %r25
T1_asi_reg_wr_132:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 3615: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3a54960  ! 3620: FMULq	dis not found

T1_asi_reg_rd_165:
	mov	0x1, %r14
	.word 0xfadb8e60  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_rd_166:
	mov	0x6, %r14
	.word 0xf0db8400  ! 3624: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbba00520  ! 3634: FSQRTs	fsqrt	
T1_asi_reg_rd_167:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 3637: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_168:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 3640: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5a4c840  ! 3642: FADDd	faddd	%f50, %f0, %f26
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_270:
	setx	0x3b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 3650: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a409a0  ! 3651: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xb7ab4820  ! 3653: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5ab4820  ! 3655: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a50940  ! 3657: FMULd	fmuld	%f20, %f0, %f24
cpu_intr_1_271:
	setx	0x390321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a408e0  ! 3659: FSUBq	dis not found

cpu_intr_1_272:
	setx	0x38031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 3664: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_133:
	mov	0x4, %r14
	.word 0xf6f38400  ! 3665: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3a9c820  ! 3666: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80820  ! 3668: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_273:
	setx	0x3b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_274:
	setx	0x3b0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa549c0  ! 3683: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xb3a81820  ! 3684: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a81c20  ! 3686: FMOVRGEZ	dis not found

	.word 0xbda90820  ! 3689: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a408e0  ! 3693: FSUBq	dis not found

	.word 0xb5a81420  ! 3694: FMOVRNZ	dis not found

T1_asi_reg_rd_169:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_275:
	setx	0x3a021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_170:
	mov	0x13, %r14
	.word 0xfedb8e60  ! 3703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_134:
	mov	0xf, %r14
	.word 0xf8f38e60  ! 3705: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb7a80820  ! 3707: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbbab4820  ! 3710: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_276:
	setx	0x3e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c9c0  ! 3720: FDIVd	fdivd	%f54, %f0, %f60
cpu_intr_1_277:
	setx	0x3d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5aa0820  ! 3724: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_171:
	mov	0x28, %r14
	.word 0xf6db8e40  ! 3727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_172:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xba250000  ! 3733: SUB_R	sub 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0ad8000  ! 3736: ANDNcc_R	andncc 	%r22, %r0, %r24
	.word 0xb5a81420  ! 3738: FMOVRNZ	dis not found

	.word 0xb00d0000  ! 3739: AND_R	and 	%r20, %r0, %r24
cpu_intr_1_278:
	setx	0x3e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 37)
	.word 0xbe24c000  ! 3747: SUB_R	sub 	%r19, %r0, %r31
	.word 0xb414e02d  ! 3748: OR_I	or 	%r19, 0x002d, %r26
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_279:
	setx	0x3c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_280:
	setx	0x3d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 3754: FSQRTs	fsqrt	
cpu_intr_1_281:
	setx	0x3f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda409c0  ! 3761: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xb5a549e0  ! 3762: FDIVq	dis not found

	.word 0xb0b521e8  ! 3765: ORNcc_I	orncc 	%r20, 0x01e8, %r24
	.word 0xb3a00560  ! 3766: FSQRTq	fsqrt	
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 1d)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbda5c920  ! 3770: FMULs	fmuls	%f23, %f0, %f30
	.word 0xbda81820  ! 3776: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbfa588e0  ! 3779: FSUBq	dis not found

	.word 0xb4140000  ! 3780: OR_R	or 	%r16, %r0, %r26
	.word 0xbba80c20  ! 3782: FMOVRLZ	dis not found

	.word 0xb9a80820  ! 3783: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbc0cc000  ! 3785: AND_R	and 	%r19, %r0, %r30
T1_asi_reg_rd_173:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 3787: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5a84820  ! 3790: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbba00020  ! 3791: FMOVs	fmovs	%f0, %f29
cpu_intr_1_282:
	setx	0x3e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 3799: FSQRTq	fsqrt	
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_135:
	mov	0x21, %r14
	.word 0xf4f38400  ! 3803: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfa548e0  ! 3804: FSUBq	dis not found

iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb7a5c9a0  ! 3809: FDIVs	fdivs	%f23, %f0, %f27
cpu_intr_1_283:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a448e0  ! 3815: FSUBq	dis not found

T1_asi_reg_wr_136:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 3818: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbea4e1be  ! 3822: SUBcc_I	subcc 	%r19, 0x01be, %r31
T1_asi_reg_wr_137:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 3824: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a00520  ! 3827: FSQRTs	fsqrt	
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb3a88820  ! 3830: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_138:
	mov	0x21, %r14
	.word 0xf6f38400  ! 3832: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_284:
	setx	0x3d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_285:
	setx	0x3c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, b)
	.word 0xb3a54820  ! 3851: FADDs	fadds	%f21, %f0, %f25
	.word 0xb1a58940  ! 3854: FMULd	fmuld	%f22, %f0, %f24
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfa449e0  ! 3858: FDIVq	dis not found

	.word 0xb5a50820  ! 3859: FADDs	fadds	%f20, %f0, %f26
	.word 0xbfa90820  ! 3860: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbfa4c920  ! 3861: FMULs	fmuls	%f19, %f0, %f31
T1_asi_reg_rd_174:
	mov	0x25, %r14
	.word 0xf0db8400  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbbaa0820  ! 3867: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00540  ! 3869: FSQRTd	fsqrt	
	.word 0xbab48000  ! 3871: SUBCcc_R	orncc 	%r18, %r0, %r29
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, f)
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a80820  ! 3876: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb5a81420  ! 3878: FMOVRNZ	dis not found

iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 30)
	.word 0xb9a549a0  ! 3881: FDIVs	fdivs	%f21, %f0, %f28
cpu_intr_1_286:
	setx	0x3d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 3888: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_175:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda81c20  ! 3893: FMOVRGEZ	dis not found

	.word 0xb7a588a0  ! 3899: FSUBs	fsubs	%f22, %f0, %f27
cpu_intr_1_287:
	setx	0x3f0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408a0  ! 3905: FSUBs	fsubs	%f16, %f0, %f28
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_288:
	setx	0x3c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 3912: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbda588e0  ! 3915: FSUBq	dis not found

	.word 0xb3a00520  ! 3916: FSQRTs	fsqrt	
	.word 0xbda81c20  ! 3918: FMOVRGEZ	dis not found

T1_asi_reg_rd_176:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 3920: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_289:
	setx	0x3d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_177:
	mov	0x28, %r14
	.word 0xfadb8400  ! 3927: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_290:
	setx	0x3c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_291:
	setx	0x20312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48860  ! 3939: FADDq	dis not found

	.word 0xbba548a0  ! 3942: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xbba81c20  ! 3945: FMOVRGEZ	dis not found

iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 9)
	.word 0xb5a00520  ! 3949: FSQRTs	fsqrt	
	.word 0xb5a00520  ! 3951: FSQRTs	fsqrt	
cpu_intr_1_292:
	setx	0x3f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_293:
	setx	0x3e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a00040  ! 3957: FMOVd	fmovd	%f0, %f28
cpu_intr_1_294:
	setx	0x3e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_295:
	setx	0x3c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba14e070  ! 3967: OR_I	or 	%r19, 0x0070, %r29
	.word 0xb7aa8820  ! 3968: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_178:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7a80820  ! 3972: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81c20  ! 3973: FMOVRGEZ	dis not found

	.word 0xbc356170  ! 3974: ORN_I	orn 	%r21, 0x0170, %r30
	.word 0xb9a88820  ! 3976: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_296:
	setx	0x3d0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 3980: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_139:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 3981: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_297:
	setx	0x3d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_298:
	setx	0x3c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_299:
	setx	0x3d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 3995: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a80420  ! 3997: FMOVRZ	dis not found

	.word 0xbda94820  ! 4000: FMOVCS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_300:
	setx	0x3d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a549c0  ! 4006: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb4842111  ! 4008: ADDcc_I	addcc 	%r16, 0x0111, %r26
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda44820  ! 4017: FADDs	fadds	%f17, %f0, %f30
cpu_intr_1_301:
	setx	0x3c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_179:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb72d8000  ! 4025: SLL_R	sll 	%r22, %r0, %r27
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_302:
	setx	0x3e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_303:
	setx	0x3e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_304:
	setx	0x3f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 4036: FMOVs	fmovs	%f0, %f26
	.word 0xbfa00540  ! 4038: FSQRTd	fsqrt	
	.word 0xb5a90820  ! 4042: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbfa84820  ! 4043: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81c20  ! 4044: FMOVRGEZ	dis not found

	.word 0xbba50940  ! 4047: FMULd	fmuld	%f20, %f0, %f60
	.word 0xbda80820  ! 4048: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 15)
	.word 0xb9a58840  ! 4053: FADDd	faddd	%f22, %f0, %f28
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 35)
	.word 0xbbab8820  ! 4056: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_140:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 4060: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_141:
	mov	0xd, %r14
	.word 0xf2f38400  ! 4065: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_305:
	setx	0x3f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_306:
	setx	0x3f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a00560  ! 4076: FSQRTq	fsqrt	
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb7358000  ! 4079: SRL_R	srl 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_307:
	setx	0x3f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a58820  ! 4088: FADDs	fadds	%f22, %f0, %f28
T1_asi_reg_rd_180:
	mov	0x37, %r14
	.word 0xfadb8e80  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_142:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 4093: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_308:
	setx	0x3d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_181:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_309:
	setx	0x3c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54940  ! 4102: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb404c000  ! 4106: ADD_R	add 	%r19, %r0, %r26
T1_asi_reg_wr_143:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 4107: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3a81c20  ! 4108: FMOVRGEZ	dis not found

	.word 0xb7aa4820  ! 4111: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_144:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 4114: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda40920  ! 4118: FMULs	fmuls	%f16, %f0, %f30
	.word 0xb20ce184  ! 4120: AND_I	and 	%r19, 0x0184, %r25
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a00040  ! 4123: FMOVd	fmovd	%f0, %f58
	.word 0xb9a00540  ! 4126: FSQRTd	fsqrt	
	.word 0xb1a449a0  ! 4127: FDIVs	fdivs	%f17, %f0, %f24
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfa58860  ! 4132: FADDq	dis not found

T1_asi_reg_wr_145:
	mov	0x38, %r14
	.word 0xfef38e40  ! 4133: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_182:
	mov	0x1a, %r14
	.word 0xf8db84a0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbba50920  ! 4138: FMULs	fmuls	%f20, %f0, %f29
	.word 0xbdaa4820  ! 4139: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a449e0  ! 4140: FDIVq	dis not found

	.word 0xb1a9c820  ! 4143: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb01c4000  ! 4144: XOR_R	xor 	%r17, %r0, %r24
cpu_intr_1_310:
	setx	0x3e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_146:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 4148: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbda449e0  ! 4150: FDIVq	dis not found

iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_183:
	mov	0x13, %r14
	.word 0xf8db8e80  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5a48840  ! 4155: FADDd	faddd	%f18, %f0, %f26
	.word 0xb5a9c820  ! 4156: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbf3de001  ! 4159: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xbfa4c9a0  ! 4160: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb7a4c920  ! 4161: FMULs	fmuls	%f19, %f0, %f27
	.word 0xbfaa4820  ! 4162: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_147:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 4164: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7a4c940  ! 4165: FMULd	fmuld	%f50, %f0, %f58
T1_asi_reg_rd_184:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3a4c840  ! 4168: FADDd	faddd	%f50, %f0, %f56
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, a)
	.word 0xbda00040  ! 4179: FMOVd	fmovd	%f0, %f30
	.word 0xbba88820  ! 4185: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_148:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 4193: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 29)
	.word 0xbda8c820  ! 4196: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbd35c000  ! 4197: SRL_R	srl 	%r23, %r0, %r30
	.word 0xb1a81820  ! 4199: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbc840000  ! 4201: ADDcc_R	addcc 	%r16, %r0, %r30
cpu_intr_1_311:
	setx	0x410304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_312:
	setx	0x40031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72cc000  ! 4208: SLL_R	sll 	%r19, %r0, %r27
	.word 0xbfa58940  ! 4212: FMULd	fmuld	%f22, %f0, %f62
	.word 0xbbaac820  ! 4214: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00540  ! 4215: FSQRTd	fsqrt	
cpu_intr_1_313:
	setx	0x410304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_149:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 4221: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb33c0000  ! 4225: SRA_R	sra 	%r16, %r0, %r25
T1_asi_reg_rd_185:
	mov	0x11, %r14
	.word 0xfedb89e0  ! 4226: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbba80820  ! 4227: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbda409c0  ! 4231: FDIVd	fdivd	%f16, %f0, %f30
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, f)
	.word 0xb1a449a0  ! 4235: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xb3abc820  ! 4237: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a549e0  ! 4240: FDIVq	dis not found

T1_asi_reg_wr_150:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 4241: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_151:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 4244: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_186:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbda80820  ! 4248: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0x9195a164  ! 4253: WRPR_PIL_I	wrpr	%r22, 0x0164, %pil
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_187:
	mov	0x1a, %r14
	.word 0xf0db84a0  ! 4263: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a81420  ! 4265: FMOVRNZ	dis not found

T1_asi_reg_wr_152:
	mov	0x37, %r14
	.word 0xf6f38400  ! 4267: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbb2df001  ! 4268: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xb1a58820  ! 4270: FADDs	fadds	%f22, %f0, %f24
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbba5c8e0  ! 4274: FSUBq	dis not found

T1_asi_reg_rd_188:
	mov	0x38, %r14
	.word 0xf6db84a0  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_189:
	mov	0x19, %r14
	.word 0xfcdb8e60  ! 4279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9a94820  ! 4280: FMOVCS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a4c840  ! 4288: FADDd	faddd	%f50, %f0, %f56
T1_asi_reg_wr_153:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4290: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_154:
	mov	0x2f, %r14
	.word 0xf0f38e60  ! 4293: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5a48920  ! 4294: FMULs	fmuls	%f18, %f0, %f26
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_190:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 4297: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbda4c840  ! 4298: FADDd	faddd	%f50, %f0, %f30
	.word 0x899561e5  ! 4299: WRPR_TICK_I	wrpr	%r21, 0x01e5, %tick
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_155:
	mov	0x30, %r14
	.word 0xf2f384a0  ! 4302: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7a58940  ! 4304: FMULd	fmuld	%f22, %f0, %f58
	.word 0xbdab4820  ! 4307: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c8a0  ! 4308: FSUBs	fsubs	%f19, %f0, %f26
T1_asi_reg_wr_156:
	mov	0x1d, %r14
	.word 0xf0f38e80  ! 4309: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3a88820  ! 4313: FMOVLE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_314:
	setx	0x410101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb82c0000  ! 4319: ANDN_R	andn 	%r16, %r0, %r28
	.word 0xb9a00560  ! 4323: FSQRTq	fsqrt	
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_191:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfa81c20  ! 4333: FMOVRGEZ	dis not found

cpu_intr_1_315:
	setx	0x410200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 4338: FMOVCC	fmovs	%fcc1, %f0, %f25
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7641800  ! 4342: MOVcc_R	<illegal instruction>
cpu_intr_1_316:
	setx	0x430015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 26)
	.word 0xb77dc400  ! 4355: MOVR_R	movre	%r23, %r0, %r27
	.word 0xb7aa4820  ! 4357: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbda94820  ! 4359: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 9)
	.word 0xbb480000  ! 4364: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
cpu_intr_1_317:
	setx	0x41022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_318:
	setx	0x400021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77dc400  ! 4370: MOVR_R	movre	%r23, %r0, %r27
	.word 0xbbaa8820  ! 4371: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba40940  ! 4375: FMULd	fmuld	%f16, %f0, %f60
	.word 0xb5a00540  ! 4379: FSQRTd	fsqrt	
cpu_intr_1_319:
	setx	0x410318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_192:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_320:
	setx	0x410333, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_157:
	mov	0x38, %r14
	.word 0xfef38400  ! 4388: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_193:
	mov	0x2d, %r14
	.word 0xf6db8400  ! 4389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbbab8820  ! 4390: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa80c20  ! 4393: FMOVRLZ	dis not found

cpu_intr_1_321:
	setx	0x420336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_322:
	setx	0x400224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_323:
	setx	0x430228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_324:
	setx	0x400313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa44840  ! 4414: FADDd	faddd	%f48, %f0, %f62
cpu_intr_1_325:
	setx	0x43000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_326:
	setx	0x43001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb48000  ! 4420: SUBCcc_R	orncc 	%r18, %r0, %r31
cpu_intr_1_327:
	setx	0x42020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58860  ! 4425: FADDq	dis not found

iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81820  ! 4428: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_158:
	mov	0x33, %r14
	.word 0xf6f384a0  ! 4431: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_328:
	setx	0x41000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabca1d3  ! 4433: XNORcc_I	xnorcc 	%r18, 0x01d3, %r29
	.word 0xb1a84820  ! 4437: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbcb5c000  ! 4440: ORNcc_R	orncc 	%r23, %r0, %r30
	.word 0xb7aa0820  ! 4442: FMOVA	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_159:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 4443: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1a489e0  ! 4445: FDIVq	dis not found

	.word 0xb3a90820  ! 4446: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa489a0  ! 4447: FDIVs	fdivs	%f18, %f0, %f31
T1_asi_reg_wr_160:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 4449: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1a58940  ! 4451: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb1a80820  ! 4453: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa4c9c0  ! 4454: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xb1abc820  ! 4455: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_329:
	setx	0x43020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 4461: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbda44840  ! 4466: FADDd	faddd	%f48, %f0, %f30
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5a84820  ! 4470: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00520  ! 4471: FSQRTs	fsqrt	
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 17)
	.word 0xbe1d2148  ! 4473: XOR_I	xor 	%r20, 0x0148, %r31
	.word 0xb0856150  ! 4474: ADDcc_I	addcc 	%r21, 0x0150, %r24
	.word 0xbba00560  ! 4477: FSQRTq	fsqrt	
T1_asi_reg_wr_161:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 4479: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_194:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a81420  ! 4484: FMOVRNZ	dis not found

	.word 0xb5a84820  ! 4485: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbb2c4000  ! 4488: SLL_R	sll 	%r17, %r0, %r29
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 4)
	.word 0xb2bda030  ! 4492: XNORcc_I	xnorcc 	%r22, 0x0030, %r25
	.word 0xb3a5c920  ! 4496: FMULs	fmuls	%f23, %f0, %f25
T1_asi_reg_rd_195:
	mov	0x5, %r14
	.word 0xf4db8e80  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_330:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_162:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 4501: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5a00560  ! 4505: FSQRTq	fsqrt	
	.word 0xb1a4c8c0  ! 4506: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb3ab8820  ! 4507: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb8bd20c9  ! 4508: XNORcc_I	xnorcc 	%r20, 0x00c9, %r28
	.word 0xb9ab4820  ! 4510: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb4358000  ! 4515: ORN_R	orn 	%r22, %r0, %r26
T1_asi_reg_rd_196:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 4516: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_331:
	setx	0x420208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_332:
	setx	0x40001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 4527: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7480000  ! 4531: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
T1_asi_reg_wr_163:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 4535: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_333:
	setx	0x410215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea58000  ! 4538: SUBcc_R	subcc 	%r22, %r0, %r31
T1_asi_reg_wr_164:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 4539: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, f)
	.word 0xb8ad619d  ! 4543: ANDNcc_I	andncc 	%r21, 0x019d, %r28
	.word 0xb2256158  ! 4545: SUB_I	sub 	%r21, 0x0158, %r25
T1_asi_reg_rd_197:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_334:
	setx	0x400124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 4554: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbda44940  ! 4558: FMULd	fmuld	%f48, %f0, %f30
	.word 0xbb2d7001  ! 4559: SLLX_I	sllx	%r21, 0x0001, %r29
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_198:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 4564: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbda40860  ! 4565: FADDq	dis not found

iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfa44920  ! 4572: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb1a00560  ! 4573: FSQRTq	fsqrt	
	.word 0xb7a84820  ! 4574: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_165:
	mov	0x1f, %r14
	.word 0xf4f38e60  ! 4580: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_166:
	mov	0x3, %r14
	.word 0xfef38e40  ! 4583: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5a88820  ! 4584: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_335:
	setx	0x410108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_167:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 4587: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_168:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 4588: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb3aa0820  ! 4589: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7a4c860  ! 4592: FADDq	dis not found

	.word 0xb3a449a0  ! 4597: FDIVs	fdivs	%f17, %f0, %f25
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda509c0  ! 4601: FDIVd	fdivd	%f20, %f0, %f30
cpu_intr_1_336:
	setx	0x42013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbba80c20  ! 4607: FMOVRLZ	dis not found

iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 23)
	.word 0xbb641800  ! 4618: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_169:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 4619: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_199:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 4625: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbfa00560  ! 4631: FSQRTq	fsqrt	
	.word 0xb1a58860  ! 4633: FADDq	dis not found

T1_asi_reg_rd_200:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 4635: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_337:
	setx	0x45020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_338:
	setx	0x450022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a90820  ! 4651: FMOVLEU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_339:
	setx	0x460038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 17)
	.word 0x8195e063  ! 4657: WRPR_TPC_I	wrpr	%r23, 0x0063, %tpc
cpu_intr_1_340:
	setx	0x45023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_170:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 4674: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a80820  ! 4683: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbda48960  ! 4687: FMULq	dis not found

iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_171:
	mov	0x1b, %r14
	.word 0xf6f38e60  ! 4690: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xba3de134  ! 4691: XNOR_I	xnor 	%r23, 0x0134, %r29
	.word 0xb5ab8820  ! 4692: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00040  ! 4694: FMOVd	fmovd	%f0, %f26
	.word 0xbfa408e0  ! 4695: FSUBq	dis not found

	.word 0xb7a00540  ! 4697: FSQRTd	fsqrt	
	.word 0xbda81c20  ! 4698: FMOVRGEZ	dis not found

	.word 0xbfa548c0  ! 4699: FSUBd	fsubd	%f52, %f0, %f62
cpu_intr_1_341:
	setx	0x470117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bda094  ! 4702: XNORcc_I	xnorcc 	%r22, 0x0094, %r28
T1_asi_reg_rd_201:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4704: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 34)
	.word 0xbfa8c820  ! 4712: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb9aa0820  ! 4714: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb9ab0820  ! 4718: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_202:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda00040  ! 4722: FMOVd	fmovd	%f0, %f30
	.word 0xba95c000  ! 4723: ORcc_R	orcc 	%r23, %r0, %r29
T1_asi_reg_rd_203:
	mov	0x18, %r14
	.word 0xfcdb8e40  ! 4724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbab4820  ! 4725: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a40820  ! 4726: FADDs	fadds	%f16, %f0, %f26
T1_asi_reg_wr_172:
	mov	0x30, %r14
	.word 0xf6f38e80  ! 4727: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9a00540  ! 4728: FSQRTd	fsqrt	
cpu_intr_1_342:
	setx	0x460231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_173:
	mov	0xe, %r14
	.word 0xf0f384a0  ! 4730: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_343:
	setx	0x45032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 4739: FSQRTd	fsqrt	
	.word 0xbdaa8820  ! 4740: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbda80c20  ! 4743: FMOVRLZ	dis not found

	.word 0xbd50c000  ! 4745: RDPR_TT	<illegal instruction>
	.word 0xba3d4000  ! 4746: XNOR_R	xnor 	%r21, %r0, %r29
cpu_intr_1_344:
	setx	0x470205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_345:
	setx	0x470231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x470301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 4753: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbba589a0  ! 4757: FDIVs	fdivs	%f22, %f0, %f29
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, f)
	.word 0xbc0ce0fc  ! 4761: AND_I	and 	%r19, 0x00fc, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_174:
	mov	0x23, %r14
	.word 0xfef38e60  ! 4768: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbba409e0  ! 4769: FDIVq	dis not found

	.word 0xba048000  ! 4774: ADD_R	add 	%r18, %r0, %r29
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba548a0  ! 4777: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xb1a00040  ! 4780: FMOVd	fmovd	%f0, %f24
	.word 0xb834c000  ! 4781: SUBC_R	orn 	%r19, %r0, %r28
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbdab4820  ! 4783: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9641800  ! 4784: MOVcc_R	<illegal instruction>
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1520000  ! 4787: RDPR_PIL	<illegal instruction>
	.word 0xbfaac820  ! 4789: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbda80c20  ! 4790: FMOVRLZ	dis not found

	.word 0xb0958000  ! 4791: ORcc_R	orcc 	%r22, %r0, %r24
	.word 0xbfa9c820  ! 4793: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_347:
	setx	0x470211, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_204:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 4800: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_348:
	setx	0x46002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00020  ! 4803: FMOVs	fmovs	%f0, %f27
	.word 0xbfa80820  ! 4808: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbfa8c820  ! 4809: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa00560  ! 4812: FSQRTq	fsqrt	
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbf51c000  ! 4815: RDPR_TL	<illegal instruction>
	.word 0xb7aa8820  ! 4816: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_175:
	mov	0x12, %r14
	.word 0xfcf389e0  ! 4817: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfa5c860  ! 4818: FADDq	dis not found

T1_asi_reg_wr_176:
	mov	0xb, %r14
	.word 0xf6f38e80  ! 4824: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a98820  ! 4826: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xba350000  ! 4830: ORN_R	orn 	%r20, %r0, %r29
cpu_intr_1_349:
	setx	0x470036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 38)
	.word 0xb6bc0000  ! 4833: XNORcc_R	xnorcc 	%r16, %r0, %r27
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa9c820  ! 4839: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb5508000  ! 4842: RDPR_TSTATE	<illegal instruction>
T1_asi_reg_wr_177:
	mov	0x1b, %r14
	.word 0xf0f38e80  ! 4843: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbb3c0000  ! 4846: SRA_R	sra 	%r16, %r0, %r29
	.word 0xbdaa4820  ! 4847: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbec520c5  ! 4848: ADDCcc_I	addccc 	%r20, 0x00c5, %r31
	.word 0xb3aac820  ! 4849: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1a84820  ! 4851: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbba4c8a0  ! 4853: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xb1a54820  ! 4854: FADDs	fadds	%f21, %f0, %f24
	.word 0xbfa00560  ! 4856: FSQRTq	fsqrt	
T1_asi_reg_rd_205:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 4859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_206:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 4860: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_wr_178:
	mov	0x32, %r14
	.word 0xfef384a0  ! 4862: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb1a488c0  ! 4866: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xbda80420  ! 4868: FMOVRZ	dis not found

	.word 0xb0240000  ! 4869: SUB_R	sub 	%r16, %r0, %r24
	.word 0xbfa00520  ! 4872: FSQRTs	fsqrt	
cpu_intr_1_350:
	setx	0x46030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 4878: FMOVRNZ	dis not found

	.word 0xbda94820  ! 4879: FMOVCS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_351:
	setx	0x470320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba14e194  ! 4882: OR_I	or 	%r19, 0x0194, %r29
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_352:
	setx	0x450221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 4888: FMOVLEU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_353:
	setx	0x460010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_207:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_354:
	setx	0x450036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d6001  ! 4899: SRA_I	sra 	%r21, 0x0001, %r29
cpu_intr_1_355:
	setx	0x460202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaac2189  ! 4907: ANDNcc_I	andncc 	%r16, 0x0189, %r29
	.word 0xbfa548c0  ! 4909: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xb1a00560  ! 4910: FSQRTq	fsqrt	
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_179:
	mov	0x29, %r14
	.word 0xfcf38e60  ! 4912: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb0c4a0c2  ! 4914: ADDCcc_I	addccc 	%r18, 0x00c2, %r24
cpu_intr_1_356:
	setx	0x440233, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_208:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_rd_209:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4917: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_210:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba9c820  ! 4922: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a94820  ! 4924: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb3a00020  ! 4926: FMOVs	fmovs	%f0, %f25
	.word 0xb5a5c9e0  ! 4927: FDIVq	dis not found

	.word 0xbba509c0  ! 4933: FDIVd	fdivd	%f20, %f0, %f60
T1_asi_reg_rd_211:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 4936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7a9c820  ! 4937: FMOVVS	fmovs	%fcc1, %f0, %f27
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb9a00540  ! 4941: FSQRTd	fsqrt	
	.word 0xbda88820  ! 4943: FMOVLE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_357:
	setx	0x470323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_358:
	setx	0x46010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_359:
	setx	0x460104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_360:
	setx	0x47013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_212:
	mov	0xa, %r14
	.word 0xfedb89e0  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_361:
	setx	0x46021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 4951: FSQRTd	fsqrt	
	.word 0xbfa4c820  ! 4952: FADDs	fadds	%f19, %f0, %f31
T1_asi_reg_rd_213:
	mov	0x1e, %r14
	.word 0xfedb89e0  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbbab8820  ! 4957: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_362:
	setx	0x440304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_363:
	setx	0x450011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_214:
	mov	0x2f, %r14
	.word 0xfcdb89e0  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbba4c9a0  ! 4969: FDIVs	fdivs	%f19, %f0, %f29
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_215:
	mov	0x10, %r14
	.word 0xfedb84a0  ! 4974: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_180:
	mov	0x13, %r14
	.word 0xf8f38e80  ! 4977: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbeb44000  ! 4981: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xbc1da02b  ! 4986: XOR_I	xor 	%r22, 0x002b, %r30
cpu_intr_1_364:
	setx	0x46032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1518000  ! 4994: RDPR_PSTATE	<illegal instruction>
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 18)

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

	.xword	0x86c2a00cda5d5514
	.xword	0xe6475adaed5dff32
	.xword	0x6b33970710d18214
	.xword	0x853dddee698d8c50
	.xword	0x5ef39587a24d0a70
	.xword	0x55203c2417a5cb2f
	.xword	0x2c2355044a6c54bc
	.xword	0x45c7fe54cd368571
	.xword	0x4dec49a8addbf0a6
	.xword	0x584f8229bb4e6ed1
	.xword	0x7aac440352e9ce56
	.xword	0xd582af6f2fa90800
	.xword	0x0bbe54fed4dc64aa
	.xword	0x39c2d1373184202c
	.xword	0xbd44f1dbf35adb4c
	.xword	0x4616a516860b7c55
	.xword	0xb0a4feeb8892dab7
	.xword	0x7c4e76bd47b338dd
	.xword	0x1d8bc913bb889433
	.xword	0x65790c20c29b592b
	.xword	0x9f2607b3b5af5f31
	.xword	0xd092e06cd1e01181
	.xword	0xc656e113a01c3a65
	.xword	0xdf3d26c45ed267dc
	.xword	0xa6dea582c08faf91
	.xword	0x4e565361bf6fec11
	.xword	0xc9b8e74496f6094c
	.xword	0x26fd7b01198ea589
	.xword	0xe369f353f55da735
	.xword	0x17070af940b32d16
	.xword	0xf0a20de161b66103
	.xword	0x6064092bed6a424f
	.xword	0x04db54835a43f290
	.xword	0x724d5afac192d309
	.xword	0x5045598dcc914c98
	.xword	0x31c9604eea287df5
	.xword	0xf23e0004b59f6b3d
	.xword	0x47990ce1ed85cfe7
	.xword	0xb84bbf332dc068b2
	.xword	0xbfc327554d2d1e3b
	.xword	0x6f91d3238aa00bf4
	.xword	0x8218345fa9567bdd
	.xword	0x4fc763368c71c1c3
	.xword	0xfc5f06f8ab4d3780
	.xword	0x1ac32ec5af0dfc83
	.xword	0x220c93f72e881137
	.xword	0xb04d8b2e180f783f
	.xword	0x0bb107d9109456b2
	.xword	0x3140f062b482c85c
	.xword	0x4c1e8e8e567f8ad8
	.xword	0x7a8704a02f527707
	.xword	0xe6e1f909025f0e2b
	.xword	0x652f7d89569c859e
	.xword	0xf0256631df026b3c
	.xword	0x83539f9c9a5d5d4d
	.xword	0xe14e3d426e4c848a
	.xword	0xfae31063503f35b2
	.xword	0x56703348e16f24e7
	.xword	0x98dd29c745183b82
	.xword	0x6e735c45cfdefc72
	.xword	0xcef6a8fa865fe4c3
	.xword	0x096a00fb475a30cc
	.xword	0xaa483bd56296e978
	.xword	0x8010c961ac695db5
	.xword	0xd8e758f7eef4f65a
	.xword	0x7aa8fbbc463d7966
	.xword	0xc191355b7e4e46ad
	.xword	0x3b475e9e4858fc7c
	.xword	0x7dc6312d5c51fe17
	.xword	0x69022aa46a017627
	.xword	0x707b374547f733ab
	.xword	0xbcc97cfb3c05465f
	.xword	0x1b36a6217f9c207e
	.xword	0x08fa975336c40dae
	.xword	0xa9e6d3c7cc0d30cd
	.xword	0x890e88e2cf0ccb43
	.xword	0xe1806245ff749ee0
	.xword	0x0bee431840a93cb7
	.xword	0x9106503c1da84c26
	.xword	0x43aff87542be723b
	.xword	0xc53cbf6de8c04845
	.xword	0xe58175acb6607807
	.xword	0x9aba18d99bf915f6
	.xword	0x24f7ac89eedb5683
	.xword	0x0fa524076d32b8af
	.xword	0x4e3bf620498e6b00
	.xword	0xc0bc78ee3e1c5f73
	.xword	0xde16e0e3ece97e3b
	.xword	0x04a350944c4bd924
	.xword	0x5aa2130dd505d6c6
	.xword	0x18e60a526b0f11a0
	.xword	0x393560e9faceee63
	.xword	0x7d07721f9cea52b4
	.xword	0xc1b5fbf45c307e0b
	.xword	0xd8fa0e63daa8c1e2
	.xword	0x80429aad1dae3f45
	.xword	0xc02a4b19add99914
	.xword	0x579296537290cc1f
	.xword	0x07c0de8a348138a6
	.xword	0x911a1eb8994bad0d
	.xword	0x32d9899e5c2daf4b
	.xword	0xc5f74551923fad8b
	.xword	0xe6a09115dd73447c
	.xword	0x35dabe5d0eab06a6
	.xword	0x210083cef3d75978
	.xword	0x33dbd796effb32fd
	.xword	0xa65e7f005a50a793
	.xword	0x97af139f9497193d
	.xword	0x4b5924ebca955333
	.xword	0x74815de779cdb478
	.xword	0x44d49ec47e2cc2e8
	.xword	0x941387f42354541e
	.xword	0x032a6f762660cc54
	.xword	0x3165c7366402ade5
	.xword	0xfb25e6432d8584b7
	.xword	0x18e1de6c5b9db853
	.xword	0x00df3256d7239fc8
	.xword	0x4ed54dd32b6187d2
	.xword	0xa839ac55d1badf7d
	.xword	0xc7e5800947eb6b6d
	.xword	0x6a11899a5cbd8579
	.xword	0x37eedc9ada635e30
	.xword	0x60a15c00c2a41ee0
	.xword	0xeb480af4de6b3912
	.xword	0xc864571abfc0f250
	.xword	0x6e45e219a75cf613
	.xword	0x24ef4f35040216d0
	.xword	0x3c5f32aabbe37900
	.xword	0x61119e285c1dca96
	.xword	0x2a01bd4a1c3aabae
	.xword	0x9d9892e5f01488d9
	.xword	0x452d5947531ca483
	.xword	0x4be4b0ae0adac20c
	.xword	0x3f9dda00af01956d
	.xword	0x835b8f0c68916f3e
	.xword	0xa4f74c9254fea1f4
	.xword	0x73d1c354d2cab6fe
	.xword	0x2f15bb177ec293f4
	.xword	0x4c02f7ed926ae2c1
	.xword	0xe3d2fb3bd4b6fde6
	.xword	0xa0d6b52ebfa0eaff
	.xword	0x4c4ba0b8b0215825
	.xword	0x68bfd2c357481e3f
	.xword	0xdb1c066d841f4e46
	.xword	0xe574cc766f629187
	.xword	0x3661b15c31ee8ecc
	.xword	0x180940829fe02bce
	.xword	0x4cbfc9a2167fd95b
	.xword	0x8cce71c49448f973
	.xword	0x152ca9dbef0e97a8
	.xword	0xcf66f90b49052fc9
	.xword	0x11739832a400ac04
	.xword	0x0d52470a4f1d7dc9
	.xword	0xdf7066f69565193d
	.xword	0x7c2e12f966e31ce2
	.xword	0x359420eacc2c3c52
	.xword	0x55fb401e7800b238
	.xword	0xcaecc0a8e9f4eae0
	.xword	0xf0d8abe6b36d3282
	.xword	0x332d2827af96e9f9
	.xword	0xa806202529151f7c
	.xword	0x5238830caa3e7caa
	.xword	0x44df3e384be65165
	.xword	0x804d7ca841c11c5b
	.xword	0x8a92c53a55822792
	.xword	0x8a65519948eac91f
	.xword	0xc92b47b0c7b061bb
	.xword	0x0359a445449eb0d2
	.xword	0xfc58a2307e71823a
	.xword	0xdaa2f4663d5a4dd5
	.xword	0x8e1138e44302bb51
	.xword	0xb70d2549b670d95e
	.xword	0xfd4647e7add9931b
	.xword	0xa686e02c77eb300a
	.xword	0x3c46d2eaabdc251f
	.xword	0x456ab54048146b3e
	.xword	0xcc5c147ac20ca271
	.xword	0x94bcc711e71aff2e
	.xword	0x43ebef73c8c5b028
	.xword	0xa76a8924423de9b0
	.xword	0x788fc5ed16bbfa56
	.xword	0x5153db0357f5a0f0
	.xword	0x82436c590d35ac14
	.xword	0xc0ed6a9aa5019b1d
	.xword	0x9db8280b9f0c0948
	.xword	0xff05cf2d8f75ec9c
	.xword	0x39e23d915c859fed
	.xword	0x6a183c19ee7b64cb
	.xword	0x978d07988b9e2f97
	.xword	0x2576879ca5b93535
	.xword	0xa939e9df22ab843b
	.xword	0xee6faccbd19d6039
	.xword	0x4facdd4be47e534b
	.xword	0x4d8b1c678b08f0b0
	.xword	0xdff4a7ba9f7d8b4f
	.xword	0xcb661931145405cf
	.xword	0xe655ee6d7267ca84
	.xword	0x2c4a10dd9f580007
	.xword	0x1f32a1912fa36336
	.xword	0xdc0bc7fb601dbab6
	.xword	0x1cdd283ba4e40e2a
	.xword	0x5f1073bce6429d8f
	.xword	0x8874b0e96750f62b
	.xword	0x9c577d6236282417
	.xword	0xecd91a3955882fb1
	.xword	0xa18e9461bab23de6
	.xword	0x0ffd2ddb752c9223
	.xword	0x1143cda25f2c2118
	.xword	0xbd0bc2821fd49f7c
	.xword	0xd66e6770ba22e43e
	.xword	0x0fdde0cd19243f6b
	.xword	0xf62a20724f820e66
	.xword	0x6c007584ccd62876
	.xword	0x7f05b0e541586792
	.xword	0xfd41d8e12edb047b
	.xword	0x549521c69ac8f5cf
	.xword	0x00a80f0c27829ef6
	.xword	0x174e7cb55ca0382f
	.xword	0x71c431361bbc2e37
	.xword	0x1748528a22e95fa4
	.xword	0x55f8048b2bf0cde4
	.xword	0x82d5e300cd53ccdb
	.xword	0xbfb9fd08d6f86e02
	.xword	0xc1c5579266ef253a
	.xword	0x25bdb256449c45dc
	.xword	0xc2958e08f83750d3
	.xword	0x36bf093b4399c000
	.xword	0xd63277f26ba7c084
	.xword	0x28ef0aa884b76b3a
	.xword	0xfb2061255e23e943
	.xword	0xbdb880b7136547dd
	.xword	0xb9aaed9e2d846fd7
	.xword	0x480f8bede0d718a6
	.xword	0x6cb125b59f863cc0
	.xword	0x9ce08089ac567615
	.xword	0xb296a45f32ba938e
	.xword	0x85f2f93e0f6250c4
	.xword	0xe2f3b4473bc40f74
	.xword	0x8b44e9505ed54bf7
	.xword	0x1f8e5438976e37ac
	.xword	0x64e9df7bcd521cc2
	.xword	0x2dd7ea853ca08a92
	.xword	0x429fee9dab0948fa
	.xword	0x994d60ca9e733af7
	.xword	0x32839da8db191a84
	.xword	0xe11ecc59a66f5dd2
	.xword	0xb334bb07088bf0b5
	.xword	0x9f881df1acf71437
	.xword	0x75021cc9e1fdc2de
	.xword	0xd9051e6161c7166f
	.xword	0xc715381946b9351f
	.xword	0xcc25599792879b33
	.xword	0xe6ba417f3482d58d
	.xword	0xacfb02a155771d10
	.xword	0xdd4e9c41809d9afa
	.xword	0x7a9bd8eb2cda626f
	.align 0x2000
	.data
data_start_1:

	.xword	0xb6eac559d10d327b
	.xword	0xdf9f7b4d8ba03292
	.xword	0x9f51f084f9bcf6a9
	.xword	0xcc7189ad374b924b
	.xword	0x9ef59037c4456e93
	.xword	0xed1c2c00d9212e82
	.xword	0xdbb553214f005520
	.xword	0xd349a35ce90261ab
	.xword	0x6a959a2eb5667d86
	.xword	0x3f07d40dc47da2d0
	.xword	0x16003d7fdd3b0573
	.xword	0x1c06ade3096344e5
	.xword	0xbaa81f08e311d3fd
	.xword	0xc72270b3e6baa6df
	.xword	0x209469573d5a1c06
	.xword	0x77680db5ba9d4e01
	.xword	0xc528a28e2065e8b3
	.xword	0xc06e5bf20fa0c6f8
	.xword	0x62a5fa7f259d7751
	.xword	0xacc4f685d65f0b0a
	.xword	0xd88ae687367c6131
	.xword	0xdd7b6ea9f7134d8d
	.xword	0x29462cf46713e90a
	.xword	0xa6b3efe9f95638d8
	.xword	0x88f3648ad8313bf3
	.xword	0x9cc2960ba918a94c
	.xword	0xba253dd936d88d9a
	.xword	0xab067da6cd137c71
	.xword	0x774f06f7a4d55e98
	.xword	0x3a78bea1f4632b70
	.xword	0xca0afd52f296eb2c
	.xword	0xd33383920fff28d9
	.xword	0xf7e27a5112eddc5c
	.xword	0x4be1446f81bbfef4
	.xword	0xcd9249f8e0887a37
	.xword	0x62469d6451327fe9
	.xword	0x00579136565b80d7
	.xword	0x2a227038a01ccd82
	.xword	0xf60f2f3f9c48dbdb
	.xword	0x0eb2309c229711fb
	.xword	0x6780c3ae96039b49
	.xword	0x37349bca72571007
	.xword	0x1e72fe7497b9d1c1
	.xword	0xbd346a2951e2019f
	.xword	0x75ccb097da0f93a3
	.xword	0x7da0d0dca186e215
	.xword	0x1032610d4853c542
	.xword	0x550184c81e9fbf9d
	.xword	0x2e22a48b3af9e7a8
	.xword	0x2742403f2f27e846
	.xword	0x50808b9ceaa74fc6
	.xword	0x246885a24fec9e5d
	.xword	0xef6b69c861bc8a26
	.xword	0xdb695b2178bb0f09
	.xword	0xe2075552629c6486
	.xword	0x2ee814c04aeaf27b
	.xword	0xb91aeee39c53a124
	.xword	0xeb67d1cf9db01a2c
	.xword	0xbd7d90385281ec8b
	.xword	0xf9c7861639f47ae9
	.xword	0xdb7d7248d4ccfc49
	.xword	0x88b394f54158689a
	.xword	0x9383ee6599038d5e
	.xword	0x12e78dd7d12000f8
	.xword	0x2cbaae3dedb717c7
	.xword	0xbd0d6da11e5a00d9
	.xword	0x66fa4303a52817fb
	.xword	0x983980adab7412a0
	.xword	0x2a21ef8e818500f7
	.xword	0xa1b8061edaedac62
	.xword	0x1ccefc36584a3005
	.xword	0xc2f0384849cf62bc
	.xword	0x2af8dc3235ad7920
	.xword	0x63dd99b914d5a975
	.xword	0x1ab6533ad7718613
	.xword	0x70a42e54f2a9308c
	.xword	0xfc6a256f901398bf
	.xword	0x709cbe363ca3164c
	.xword	0xa0d0776ed3815adc
	.xword	0x79e38d28e2643436
	.xword	0x5fb322822eb15b4f
	.xword	0xbfe786abdc0e6305
	.xword	0x3594bfba534ceb5e
	.xword	0x14b13e5cb0f67be7
	.xword	0xa3b00f3248006815
	.xword	0x892fb25fd2426a6b
	.xword	0x9d9208d44aaa5826
	.xword	0x0a80bb43d9681b0d
	.xword	0x8c1789e7e08fe9d6
	.xword	0xaf95f20717bd07bb
	.xword	0xe9daee0b31b5bc83
	.xword	0x83a7cba8b5d62de6
	.xword	0x3c4e8cf5d42f56f6
	.xword	0xa25e1f5de16f0aba
	.xword	0x70feee27f3ea9d3c
	.xword	0xb3181a6162586f7f
	.xword	0x151b733b91b29564
	.xword	0x327d8a02dabe1024
	.xword	0xd32b8b1ade77e7f1
	.xword	0x32a229fee55bb24b
	.xword	0x2f98c850f56ce661
	.xword	0x85d202d7a469ffda
	.xword	0x00417096715b7ade
	.xword	0x3d76c909617139fa
	.xword	0xbc59310d8ed22301
	.xword	0x55f595c86e9e6996
	.xword	0xb302ecd31105759f
	.xword	0x112d9cc74b6946e8
	.xword	0x2b38c20b9a68e1c0
	.xword	0x2065a26845538269
	.xword	0x742ed94c74ab75b7
	.xword	0x5441cddf442790dc
	.xword	0x7fb546408f3a1186
	.xword	0x523027805611ed53
	.xword	0x04b63d4d343d7a1b
	.xword	0x6c32b3876b1dd5e9
	.xword	0x4ba83e1cd443a086
	.xword	0xeae662efc1f17f39
	.xword	0x34214316fb430dea
	.xword	0x6c87875a7a1512ca
	.xword	0x532534f44edccaa0
	.xword	0xc5c49efb0e2885e5
	.xword	0xb8050fbe11b80675
	.xword	0xcac8ee332d6425e8
	.xword	0x00b6025b6269d959
	.xword	0x3981b6940d0810bc
	.xword	0x727868c70bbeeffe
	.xword	0xd08f7c81162f1d6c
	.xword	0x354cc3163db2acea
	.xword	0x657ebee047b1e3ab
	.xword	0x1a633b402a298207
	.xword	0xb9a8b4cb3c8a5f4c
	.xword	0x1ee354df67e4d10d
	.xword	0x9f303923ec31a85f
	.xword	0x9c50a332bf9e644a
	.xword	0x2abf28257c859d71
	.xword	0xe8b028510f5b12dc
	.xword	0xa0912dd4af1ad6fa
	.xword	0x4218db5ef79d191d
	.xword	0x28dffe0c60accb13
	.xword	0x373c5ba2e74330ee
	.xword	0xdc8d8fbe1b5441fd
	.xword	0x2faeb2f5227ad66a
	.xword	0x37313ecf36ad11af
	.xword	0xd1f0d2c45a8208a4
	.xword	0x53ad1560cb2423fc
	.xword	0x498293ae5c10db36
	.xword	0x013bb070e0f01b31
	.xword	0x003ea726f70f1b21
	.xword	0x69bb44168bc67665
	.xword	0x1ce434804191d324
	.xword	0xe76a1abd73fd4309
	.xword	0x4d53150c3b609906
	.xword	0x19fd00a7f27f5df5
	.xword	0xa38d10fda7e3f442
	.xword	0x66e499eee953ad23
	.xword	0x0c03990114c0dc21
	.xword	0x5778a9376a2a2535
	.xword	0x52defceb0304d377
	.xword	0xfc4dfa3a70745b01
	.xword	0xb71a5cffcae0dfb7
	.xword	0x87ab9e0545822f43
	.xword	0xa8c89ae125a665ff
	.xword	0xca2ab8b21590d6e9
	.xword	0xb1783052b565c5da
	.xword	0xec3f58e8bbbfab3b
	.xword	0x53c70d969524cd5f
	.xword	0xce4e6e3db25131f2
	.xword	0x7e9ca814166e8e12
	.xword	0xc68889414870ddfb
	.xword	0xb761dc9e263f0d66
	.xword	0xf2feeb0e44adad1a
	.xword	0x646b37226bb9ee53
	.xword	0xda9167716ae22d7d
	.xword	0x3ae24a8daae3122d
	.xword	0x19a926b1418a1a5e
	.xword	0x5422bb5c189cf78c
	.xword	0xf34bd3dd68f89412
	.xword	0x6edb57c7b2b70b42
	.xword	0xf2cf18e0bc1bc313
	.xword	0xb9e5fc5e0ef94c19
	.xword	0xf591634672cda59f
	.xword	0xa72c748c5a5c72b1
	.xword	0x453b1606fc87017f
	.xword	0xbcd44502f1ee9612
	.xword	0x8ee5ffdc6e868ae3
	.xword	0x150084fb7426b90f
	.xword	0x2442a6a2c1592b13
	.xword	0x13d11ae21b3aafeb
	.xword	0xe7f0fb9344359ef2
	.xword	0x493b887f61764992
	.xword	0x0d3361d52a8252bf
	.xword	0x937b2068be44d7e5
	.xword	0xc2bae61f3595244b
	.xword	0x5f783d62821e932a
	.xword	0x384ca16fd2599bb4
	.xword	0x48f9b0b7c0acf721
	.xword	0xa991c873b5ba3512
	.xword	0xa61f908572cb5afe
	.xword	0xcb7fdcd23dc896b2
	.xword	0x3254cf653a42f955
	.xword	0x4de1cd0e6755e211
	.xword	0x23f480f9ee79cbc5
	.xword	0x2142adaae3940208
	.xword	0x47eeecb70003f682
	.xword	0x6c28770564ad7a16
	.xword	0x839b3aab0ab538b4
	.xword	0xa83871548b4433b9
	.xword	0xa7d17418266d8e98
	.xword	0xd787cf7c2cffd21f
	.xword	0xee3d82bb8ee39aa6
	.xword	0x52c2bd430a99fe55
	.xword	0x746c8ca5eee8451b
	.xword	0xa81013cd2532574b
	.xword	0x04679277ec09d52e
	.xword	0x4fbe242e1113bce1
	.xword	0xba63aa43aa9520f9
	.xword	0xe9d0b084e90a2989
	.xword	0x153ef7e569e4f9a8
	.xword	0x51976fcaf3fa78fe
	.xword	0x7a09956532c9af58
	.xword	0x77527396e965aeb3
	.xword	0xb53b4c7e70486e48
	.xword	0xd8b050338250a65d
	.xword	0xb181c6c1bc79a640
	.xword	0xe1221494a6d898e7
	.xword	0x5e2fb058de9362a9
	.xword	0x83764f1f1bf5d214
	.xword	0x5487aa731d0f9056
	.xword	0x4c1a256342508f58
	.xword	0xd2827a386121783b
	.xword	0x84cdef6dd4190636
	.xword	0x2ebeae34aa99bcf3
	.xword	0x715dc413a81f87af
	.xword	0x41cfbe6c403fa5b8
	.xword	0xfdc8696c41b41355
	.xword	0xfb65612c0f053f17
	.xword	0x98f5a1e8d162fcc9
	.xword	0x5dc77062b33d852b
	.xword	0x79bb92257b021243
	.xword	0xa996d79a54dada0d
	.xword	0xbbad8f19218be8fb
	.xword	0x4b75b642fe340c18
	.xword	0xa24e96e4b817350d
	.xword	0x31a7232e422e4387
	.xword	0x7e4a976ecc3aa733
	.xword	0xf15d3a598a5cc315
	.xword	0xc250f18395eb5461
	.xword	0x3abc17f4a333097e
	.xword	0x7420612e86993c16
	.xword	0x1b9162ec3998d02b
	.xword	0x66737f25121a0182
	.xword	0xa4035d924aa158d7
	.xword	0x0718661a9dfb3e8a
	.xword	0x2c403f5fda5e6d1f
	.xword	0x8ff81aa9c806d2f3
	.align 0x4000
	.data
data_start_2:

	.xword	0xe5403f1618f9a7a5
	.xword	0x1244272daeabf34b
	.xword	0x2096c58b1b9a7871
	.xword	0xabf7fbc23b921ffd
	.xword	0x7b4fce8301b357fd
	.xword	0x4dfcdb164d0d420c
	.xword	0x940a00d9c600d557
	.xword	0xa167c079e2e3e0e5
	.xword	0x8a7923ba2149429c
	.xword	0xa2ff3eb63f3e5ec9
	.xword	0x53164c7d1a441b9e
	.xword	0x84bb52d1e136e709
	.xword	0x2f5b68f1b26d07e5
	.xword	0x462a643f1cef3ed9
	.xword	0x745f1e92ae14b015
	.xword	0x600271eb06431578
	.xword	0xe11fbf5f58e191c1
	.xword	0x2a8fc0dbc5dcbfd6
	.xword	0xf3d8802e462358b2
	.xword	0xed68a0cd8fb03dfc
	.xword	0x919b8e7e50396a8f
	.xword	0x028aea47be9652d2
	.xword	0x1984967faabdc76a
	.xword	0x3cf8bbd4e4a8734f
	.xword	0x44f84b92a402890e
	.xword	0xaa07fd8d6a6fa031
	.xword	0x6906bcf48b574722
	.xword	0x0fce65fc9f5d7ae0
	.xword	0x4a03e89ba02a7bc9
	.xword	0x4fc286b02d93d71c
	.xword	0xfc5444e1d13fd15f
	.xword	0xc8e6721ca13311d6
	.xword	0x5736a3c25b6cc4f3
	.xword	0xf327f060055916fd
	.xword	0x01c3162508922449
	.xword	0xac186fc0d3f45c60
	.xword	0xdc5e7017eee9e430
	.xword	0xc429863bab95366d
	.xword	0x1bd94a4d50900b0d
	.xword	0xc5d1882dca7a0f0e
	.xword	0x8e942615b267a3be
	.xword	0x85fd4894f648d33f
	.xword	0x30033cfd3795248b
	.xword	0x1bd8f44351140f91
	.xword	0x292f810eb76c2e7f
	.xword	0x7a6ed2d9eb79bce6
	.xword	0x42360f485dc278b3
	.xword	0x2f86002341b03c6d
	.xword	0x02cee7ec403422dc
	.xword	0x0f95841b4f6e649a
	.xword	0x524b511d52a5e807
	.xword	0x77c7121dea1c3088
	.xword	0xec0b14ec4ab63404
	.xword	0x4d7778c85ba04206
	.xword	0xb1d17e29b919239a
	.xword	0xc7ea57aa46e326cd
	.xword	0x82dcfc103d40b3d1
	.xword	0x69ff6b80d9c8237e
	.xword	0xb49040bf1ddcac68
	.xword	0x4a2bac66713a18b4
	.xword	0xcf9d520f0c5eadad
	.xword	0x870f3fd09b99d83a
	.xword	0xff0d0aa890cac2e2
	.xword	0x0adb1f8c59cf08f1
	.xword	0xc55ae71cad179ada
	.xword	0x38896a1a620265a0
	.xword	0x24189e8dce6b8cf4
	.xword	0x4d8630c7803c6039
	.xword	0x528795a6302af515
	.xword	0xd9d3e8006816e0c3
	.xword	0xf83aee4b2c167d97
	.xword	0xaf44feadf8b9e676
	.xword	0x4c89dc5ff8ec88d1
	.xword	0x2d8d972086f4309f
	.xword	0x2cc9393ebb0bdd7e
	.xword	0xeba621cf03c8e9e4
	.xword	0x38fd3715ebbb89e2
	.xword	0xbc1de76a6fdbffc2
	.xword	0x9db60566879f3322
	.xword	0x7d3268fe4eec0d87
	.xword	0x0f62b0305d79746e
	.xword	0xeaf66e12dc4df773
	.xword	0x7b9e7b23e4387b47
	.xword	0x52174815f446667b
	.xword	0x478a9d134213d6a8
	.xword	0x2c2e034824c61216
	.xword	0x2d2bd5d1ad2ab885
	.xword	0xc34cbc02a2e8747a
	.xword	0xe803df72ce760067
	.xword	0xa3313fc079588df6
	.xword	0xe342e6b85c3a2cdc
	.xword	0xc857f6c248dac0df
	.xword	0x4ae4d74af73a2d71
	.xword	0x8725dfd222c3fa97
	.xword	0x5a237fc150a1b783
	.xword	0x8501dc0815b97d12
	.xword	0x92e32c418992f598
	.xword	0xc5df36c7adbaf96d
	.xword	0xf095400aa7441429
	.xword	0xb80de4341bc1b163
	.xword	0x979b6cb611337567
	.xword	0x641212954dbc0a13
	.xword	0x2900e1376067528d
	.xword	0x9df3774e6c19834c
	.xword	0xf54126ae543fc191
	.xword	0xa2b942aa95599f3d
	.xword	0x87974cf5ddfdaadb
	.xword	0xc3f9dc9499bfa095
	.xword	0x3d748ce46f30f811
	.xword	0x9e0dfe9ebc72415d
	.xword	0xccfb987aaac80b25
	.xword	0x976b06dbea424ea9
	.xword	0x187df9eb1f53b524
	.xword	0xb68b61ceac87063c
	.xword	0x0173bcb4d569ceff
	.xword	0x556b122f8dfb975d
	.xword	0x323b0fc9ad067a5f
	.xword	0xd0ea649d8a439c0c
	.xword	0x10a19b826a5bafd3
	.xword	0x3d13822c6ec81e5f
	.xword	0x6ee3cc6c9314ecf2
	.xword	0x2e4997352040660a
	.xword	0x2288fc70404e5605
	.xword	0x07a581898408d6b9
	.xword	0x524416c7076d1bfd
	.xword	0x1307a93930df9b68
	.xword	0xc42d09559ebfe344
	.xword	0x314f5ae2d60c134a
	.xword	0xc7abc0d0239a00f1
	.xword	0x0395d5d3b9fed262
	.xword	0xe2357333f98829f4
	.xword	0x3c80e30dfe816c0b
	.xword	0x62bf1b1909b85a81
	.xword	0x8d997240fa6d2c39
	.xword	0xbf1d8994f312c26b
	.xword	0x4501c5047b1025e9
	.xword	0x7d9e09ad4059ec9e
	.xword	0x33cd163f1e5cd249
	.xword	0x41202ab9645e3b75
	.xword	0xda0ae1989a06b857
	.xword	0x83ef785968d88221
	.xword	0xb43f106c7e737a82
	.xword	0xf28d691dfa28de8b
	.xword	0x41c6b34e4e2744e5
	.xword	0xb14c9c21c744d176
	.xword	0x5ba8f33bff942b6d
	.xword	0x2e579c77cc7ab035
	.xword	0xf554d523ecc737ea
	.xword	0x3ec2faafa6442368
	.xword	0x9fb14e5007b759db
	.xword	0x854acb4dcdc42947
	.xword	0x6ed06bc54bdc7d7d
	.xword	0x5ae95fe2a71a80d2
	.xword	0x038207a8c4cdecf0
	.xword	0xe9bc4816a1335c16
	.xword	0x0e4905c6c11437e9
	.xword	0xb32ae9fa760a6206
	.xword	0x5958c311a504820f
	.xword	0x150dce0530922047
	.xword	0xd89db518b56aa447
	.xword	0x3c668d011a216881
	.xword	0x97f03a376748f5f2
	.xword	0xf82f63b7bcd5dcfe
	.xword	0xf4169fdbf5f847ac
	.xword	0x8c7087726c95d8aa
	.xword	0x65ca0cef54772528
	.xword	0xb5ec002754973cf2
	.xword	0x87b81a001d2127e8
	.xword	0x388d80bf219addca
	.xword	0x7bd47c34a7e74805
	.xword	0x05ff2ffc8e1e2aa7
	.xword	0x0bbbf3b4c9b80f59
	.xword	0xcb61b5546a605015
	.xword	0xfd9729d30f454eb2
	.xword	0x169b2541cb9e7831
	.xword	0x6cb971fc3d64f3a4
	.xword	0xde968c7829b504ed
	.xword	0xe24806ec9b096c7f
	.xword	0x907066b8fe2afd9c
	.xword	0x6cb0bcac471c5563
	.xword	0x626c3f5958c916f8
	.xword	0x329e151b02080736
	.xword	0x492e384f1b388d4b
	.xword	0x2738ade51151a3f1
	.xword	0xd6d01c4fc9acea77
	.xword	0xad50590a6a44e6b8
	.xword	0x9c28883f86398124
	.xword	0x13171add122cb8c7
	.xword	0x0219bd15381b2062
	.xword	0xc2e2c169d8e848a8
	.xword	0x047b80033c72e85e
	.xword	0xa8068c6ec7347573
	.xword	0xd54d6d6a1db541b3
	.xword	0x1449c829b7dda684
	.xword	0x4ee07a93a23bcb6d
	.xword	0xad4d4bb340ae8f95
	.xword	0x369d9b35687f9d2d
	.xword	0x1804ff34e4e7b81d
	.xword	0x715fef215872eff0
	.xword	0x9d2cadd7b52cb2fd
	.xword	0xa0c32540a160f359
	.xword	0xd31f1d872ca8fdfd
	.xword	0x3e141a226670dd8e
	.xword	0x1b460d83d8f10d65
	.xword	0x0d3799a51eca20d0
	.xword	0x490594ad1969845a
	.xword	0xfca2ba8bede3ff6f
	.xword	0x0c7e5e6190b67edf
	.xword	0x24e653d5782a37c4
	.xword	0xf65fb90b2b0c5d8e
	.xword	0x1a4df147865fb5a7
	.xword	0x4f9ad35c3d9557f2
	.xword	0xca7364899bbd61df
	.xword	0xebe78261bfd2e800
	.xword	0x24f4189bc5972cf2
	.xword	0x65ccd7f52e2c0eec
	.xword	0xf026482686fb367b
	.xword	0x468fd1f838d00de7
	.xword	0xf0854e15dc01ed8a
	.xword	0xfc79e0acd9f72b71
	.xword	0x71ed7afe5d940312
	.xword	0xb8911b38be2fa19a
	.xword	0x87aaad24ff48e810
	.xword	0x0c4f883ac37ffb10
	.xword	0x33dfab654b236ef8
	.xword	0xdcef3294d618fa84
	.xword	0x019ac43ec67d9e94
	.xword	0x563c3f72271c62e3
	.xword	0xd1d5423297ad34bd
	.xword	0x293fd689f0b55cf3
	.xword	0x245c48950ecae35f
	.xword	0x1c4a1aea8e6c4098
	.xword	0x73b6a06dc6246cc4
	.xword	0xcb945f8ee64d1115
	.xword	0x8766df7dbae96f9e
	.xword	0x8cf6b332ec63a1cd
	.xword	0x48d936b97b2a28bd
	.xword	0x9962fd1d3df0324f
	.xword	0x8babe5885ff5b4aa
	.xword	0x103f3ae4ac861108
	.xword	0x64fac95e939b0387
	.xword	0x54e704f18774af27
	.xword	0xd5d4563b7bd756aa
	.xword	0xf41bdafe9a69db9a
	.xword	0xd5a87dfdcdd36fab
	.xword	0x25f46482ee8c56ab
	.xword	0x4c7495e371bfff79
	.xword	0xd794faccb78ed51f
	.xword	0x9622dafaa1a1091d
	.xword	0x370cc081a878dcf2
	.xword	0xca0715277373213f
	.xword	0xf7ae6b40e67b8233
	.xword	0xeffa5e10e4f5a7b0
	.xword	0x255ab79927d27f9c
	.xword	0x88b67994916ce304
	.xword	0x0f0177c0a34f94c5
	.align 0x8000
	.data
data_start_3:

	.xword	0x1ed1e110dfe01b2d
	.xword	0x4ee2c8470afd0688
	.xword	0x3462437f912663c6
	.xword	0x9570f926af134ea8
	.xword	0xc01110ce5c424c2b
	.xword	0xab9379d4c8a4447b
	.xword	0x342ab3368c7e61af
	.xword	0xbebd58717fb795bb
	.xword	0x7651872769b218e2
	.xword	0xb9f70afe13c8cafb
	.xword	0x948f1d4439931394
	.xword	0x565557f4f822ddbd
	.xword	0xdd243f4ce34a599c
	.xword	0x0ea5e26ce2db2b49
	.xword	0xbbc456151649d2f0
	.xword	0x6e5af940b0324061
	.xword	0x70cb38e13b201a5f
	.xword	0x1eb778d34f89f174
	.xword	0x1ebde7e07bcc0ce1
	.xword	0x10f6c0370ebe2662
	.xword	0x2d32030d313e7e38
	.xword	0xbf8400eb243671d7
	.xword	0xe8da562ca8071add
	.xword	0xd8da274f10f72d5a
	.xword	0xa3415eb28f5800c8
	.xword	0x0e3f188fcf47ae0c
	.xword	0x912e544d6e13221a
	.xword	0x92ff163010b8a8ab
	.xword	0xcbca3f73d0c9788f
	.xword	0x62e2f94c894de27d
	.xword	0x62f851162d564b0d
	.xword	0x7aa6abac725afb14
	.xword	0x5be6a7e0f8d3c3a8
	.xword	0xe8f24e980ca25057
	.xword	0xd5a1f96139ae0eb7
	.xword	0xdc113325da670e23
	.xword	0x71d4b9f5b4a8ecfb
	.xword	0xc4e70bf90e2697fb
	.xword	0xc248f3611ba0eab9
	.xword	0x483ebbb631b14601
	.xword	0xe1dd733325d207b3
	.xword	0x27d99fdfb637e40b
	.xword	0x7a639a2def9c999e
	.xword	0x0aa556398ad03fbf
	.xword	0xfde7544182a3d208
	.xword	0x7ffab8f97201e2d4
	.xword	0x99bb80bd2bb908bf
	.xword	0xec1b49d5c204558d
	.xword	0xd4616f4f08e57a48
	.xword	0x26883d595e5d060d
	.xword	0x6164b7c5707d6d17
	.xword	0x0820b7906eeadea1
	.xword	0x8da0b2017449111d
	.xword	0xc408e538ba983da0
	.xword	0xae2fb3806a941731
	.xword	0xc39049b5d13acc60
	.xword	0x84bb3cca66b60e2d
	.xword	0x9b2ece6cf2adb4fd
	.xword	0x0e66b5ebba98b19a
	.xword	0xee0f3c4b788cb18d
	.xword	0xcc14ac60190166c1
	.xword	0x54cb0f88a42cc40c
	.xword	0xe9a5c79feac752b7
	.xword	0x5213a881b0c0f907
	.xword	0x9d84a9bb78164a90
	.xword	0x0aee5f649f20fc68
	.xword	0x7e366b94db49841a
	.xword	0x16c1f5690451b389
	.xword	0x9f1673c361660331
	.xword	0x0b7689f5c6053205
	.xword	0x0ca63b8706e6ca6c
	.xword	0x8e8cb2cc754e107b
	.xword	0x8f70da6a131b49cc
	.xword	0x6908069c6042f117
	.xword	0x16fd1a33c498b967
	.xword	0x92f2263aa18e4cc7
	.xword	0x888492eea971fe1a
	.xword	0x8a65992e51d243da
	.xword	0x15f02f4bec860656
	.xword	0x606119bc5b8cb34e
	.xword	0xf84cb1813615383e
	.xword	0x68b7cafeb4643df0
	.xword	0x1ad7bc46064e29b6
	.xword	0x695975d6b6f4316a
	.xword	0x2a4728acf6c91218
	.xword	0xd32e8ffdd5078f76
	.xword	0x7905d735085e9b4a
	.xword	0x2035bc24698a450e
	.xword	0xf633bd3c2d0c3abf
	.xword	0x55300be58105889c
	.xword	0x6b8418a87a050caf
	.xword	0x335d16086329fde2
	.xword	0xbc23a53755fd120a
	.xword	0x7b5be3f62fff494e
	.xword	0xbfdc746408afd97e
	.xword	0xa8db15deb505f91d
	.xword	0xfcef5c8737964f86
	.xword	0x185dca4c6faf4735
	.xword	0x90e037473538d9d8
	.xword	0xb63b7fce479f64d9
	.xword	0x50ee341ce99c66f3
	.xword	0x27b645c00608708c
	.xword	0xa8b07b92898d1228
	.xword	0x18ff6e61a04048db
	.xword	0x326f34d72c453da3
	.xword	0x6989b912ae68140f
	.xword	0xed0dcd4a40e9457e
	.xword	0xd151174d1c8c82c3
	.xword	0x41c49b5584e00eba
	.xword	0xa5b49d8dad357d22
	.xword	0x0eb39b9a025c036f
	.xword	0xc725a9add44d75da
	.xword	0xd9a5d56d758b4795
	.xword	0xd11f620ccb00da43
	.xword	0x4df025650b89a7cc
	.xword	0x8b12053a055a54c1
	.xword	0xfe0fa28fb404b0ce
	.xword	0x521872108f0b150f
	.xword	0x7adfc3000a8a1daf
	.xword	0xb75bfb673e7dc313
	.xword	0x3e71a7196abc900f
	.xword	0xfb6b48ede13097d7
	.xword	0x3b6f2c1bdb56e800
	.xword	0x017cec4fb4f10304
	.xword	0x1f697389c9e5d1a5
	.xword	0xdf3e62c8aef85dc4
	.xword	0x7aa1ef55cb0ab961
	.xword	0xdc0e62f9352c09f0
	.xword	0x3ba2f2cdf9297aca
	.xword	0x75b02e7b5c281da2
	.xword	0x2bfd50c8c5e4d534
	.xword	0xbe738748a47d2691
	.xword	0x051fc67a99fbf05c
	.xword	0xfb566de0bce2f866
	.xword	0xb35ee30cc5d26168
	.xword	0xe3d815d5c47e62e4
	.xword	0x035ec9d56a4df23e
	.xword	0xd289427732533ba0
	.xword	0x30a1804506dee78b
	.xword	0xf341e506fce15253
	.xword	0x7e6fe8c017ad284f
	.xword	0x7a9db7a33203cd44
	.xword	0xb71c6eccb18310ae
	.xword	0x443f06eb7281f299
	.xword	0x6b455580f0d05d55
	.xword	0xf2e3e540346ddf60
	.xword	0x7607a4ed2d8517ba
	.xword	0x72d373655ce2f46d
	.xword	0x364c57c74fa5bb04
	.xword	0x5c61793a771efe6d
	.xword	0xfcd86a9f52a4f5c8
	.xword	0x33ae613a60443e00
	.xword	0x6d2535543eca61cb
	.xword	0x40f9a53042065cb8
	.xword	0xcb0d634a1c4f682e
	.xword	0xc390470bac2933ed
	.xword	0x633fd0169dea33e8
	.xword	0xff6d7275beba7927
	.xword	0xe369fc25bdd3db79
	.xword	0x7c5074a0024ebbbf
	.xword	0x1ce6b89c015efd2c
	.xword	0x69bfd9959e9a35c1
	.xword	0x60f6908278db462c
	.xword	0x1813a3e587632eee
	.xword	0xafa4a7c64de8d174
	.xword	0x237d949c4429692f
	.xword	0x1165472bb6c78722
	.xword	0x44daf7412461e3ec
	.xword	0x38ac40839f8406a3
	.xword	0x68964e6e438c4589
	.xword	0x5f015fb690ccd178
	.xword	0x6f551a9220c89e7a
	.xword	0x67e9e2611afb983d
	.xword	0x27013bfba49de08a
	.xword	0x13b8e7a501c1d8c0
	.xword	0x6a77c389014a6366
	.xword	0x669a2db12e832ad5
	.xword	0x7e0d6cee9a900669
	.xword	0xbf1bf38d1c8cf8af
	.xword	0xfe9484c92c374d1a
	.xword	0x753a74be53c5196d
	.xword	0xc11e9b64307d07a2
	.xword	0x2aa94b1090e01b84
	.xword	0xd67e5104ff7ef12d
	.xword	0xf3c23fc8068ba3f3
	.xword	0x9836a50377b33115
	.xword	0xec1403eee4af71d5
	.xword	0xa7a0631ccccaf79b
	.xword	0xb151377c09906de5
	.xword	0x89569fa7ef9a6593
	.xword	0x26bc80b27900063c
	.xword	0x2e03eb5c0aa27490
	.xword	0xc785ff124e81cc1c
	.xword	0x681db27ff5dca7df
	.xword	0x067241854ce0af55
	.xword	0x124a16b9c47d27db
	.xword	0x23bc9cd1dbe06332
	.xword	0x5e6bf9303ea98d86
	.xword	0xc8bde4c08d0017c3
	.xword	0xc4ed729e4351e327
	.xword	0xdc84a821437ce7fa
	.xword	0x265538d4fdb04d0b
	.xword	0xb1876bb54720f5bc
	.xword	0x4a9af47ad26844ba
	.xword	0xe91a5daf89a05016
	.xword	0x8224f43ebe691cb1
	.xword	0x8843f68d57206400
	.xword	0x7215b5ece2bf90a3
	.xword	0x66ca001ca4eafc9f
	.xword	0x91c511ab7d719d4a
	.xword	0xabc13090fd5050bb
	.xword	0xaae20dd9221caf6a
	.xword	0xddc9f8e3e2f1787f
	.xword	0x0019815f0b35116a
	.xword	0x544fc1a415ec629c
	.xword	0x93ecf361ed24ff68
	.xword	0x1d07d50c3f88c230
	.xword	0x876496e051dfea24
	.xword	0x2f67a39f4dd33041
	.xword	0xfd8b044d620d5222
	.xword	0x165686049da0d511
	.xword	0x41586359765fb59e
	.xword	0xf472a3b61ca22cba
	.xword	0x918856e041186704
	.xword	0x3b66ab25ad147b1e
	.xword	0xd56e7f7970120d1c
	.xword	0xaf1ada9d1a6e0880
	.xword	0x67a9d4aec16a636d
	.xword	0x450b838fe08739a9
	.xword	0x083109f2581b8c54
	.xword	0xe2dc638e1463a4a2
	.xword	0x669dff42b5b9a506
	.xword	0x33c86ae16237f77d
	.xword	0x0e84e2fa08f415a1
	.xword	0x953841e4a420903e
	.xword	0xb812e58a809ee0b8
	.xword	0x45b9984c3a97cced
	.xword	0x14bc76698ae32af5
	.xword	0x84b34b7648c2b11b
	.xword	0x6ad2e53c7beca8b9
	.xword	0x3a8382694af41eaa
	.xword	0x737c200d7a882111
	.xword	0x24e03ce53c3d79e0
	.xword	0xecdfd513c31da137
	.xword	0x0f4135df805f4bf6
	.xword	0xfea2b4cb425cbb85
	.xword	0x9fd366927f227066
	.xword	0xd2bfbc5b2abf2031
	.xword	0x785e9222c7008dd8
	.xword	0xf5a59d66d9c3dc40
	.xword	0x9f33ac54fb59c5f3
	.xword	0x1a57b7095acebdce
	.xword	0x30e0d4aeaeb001a0
	.xword	0xf20a62897f42d90f
	.xword	0x555d4aaf7d4ee33c
	.xword	0x41cc6bcdfa584945
	.align 0x10000
	.data
data_start_4:

	.xword	0xa73f5b5b8d2f1de7
	.xword	0xb7ef90c6e81d838f
	.xword	0x415ced259d579d1b
	.xword	0x32a76073ed1f8a42
	.xword	0xc37753035bc3738b
	.xword	0x586907454e007af7
	.xword	0x6a69b432486f12a9
	.xword	0x2b92f875bc58ffa2
	.xword	0x9fd2d09b589ed925
	.xword	0xe7a6c8a26729cfd3
	.xword	0x5a2fe9ba7a710a0a
	.xword	0x9efdf4f234bdffe6
	.xword	0x4f2a365d7d4fffcb
	.xword	0x36412104f1809944
	.xword	0xbd946d4fbe2d6f73
	.xword	0x9054e984c13a3c0a
	.xword	0x22eed4ace45e03d1
	.xword	0x48b54b88340f3931
	.xword	0x9e7cc08977359d71
	.xword	0xcd3ab08f850ac2fa
	.xword	0xa4c871ee92a7318a
	.xword	0xef12f1dd827eaca8
	.xword	0x036603fc00872e6c
	.xword	0x0f0e6cf1015a21c0
	.xword	0x5b1e84cf0dc12e5b
	.xword	0xdc3d774f33f9ed0f
	.xword	0xc4f23cfa1f1eb862
	.xword	0xa8c7746ff7a262ed
	.xword	0x238b37e8f2cf7451
	.xword	0x4490ac663617c8b8
	.xword	0x31b952bc11669973
	.xword	0x98d40bbf60b5653a
	.xword	0x734fa025dd2828a6
	.xword	0x0b25235d26fe90ab
	.xword	0x20c718234aefdef6
	.xword	0xa315c3aa25575293
	.xword	0x664a862dd85d565f
	.xword	0x8cb327892435db4a
	.xword	0xa680e9e8ac516263
	.xword	0x1f68e1f5fb13147b
	.xword	0xfc8bc1206874fbaa
	.xword	0xa94998ff1ce25f5c
	.xword	0x0f2bd583c4bf9635
	.xword	0x0ce00c880ed8b918
	.xword	0x806603cf061aa1c8
	.xword	0xa8cfa27fa1f491ff
	.xword	0xc995086455fc9078
	.xword	0x7cc4713e62f04558
	.xword	0x36e5ca74c6b5a849
	.xword	0x114389ba1e3a4ff0
	.xword	0x9ca58181b0384422
	.xword	0x7869276d508a653b
	.xword	0x3b335af153042e83
	.xword	0x01a062bed3d9baa2
	.xword	0x2efd7c2ae85f8ede
	.xword	0xbf8f940479e0a7ad
	.xword	0xc2deb0a561b0a0c2
	.xword	0x6a34f1a68368fc7a
	.xword	0xcbda61881e788c8d
	.xword	0x0fd6c77cc83198d7
	.xword	0x57bfd001dcb153b2
	.xword	0xa8bc574cdc7b87de
	.xword	0xd258bd35859947a4
	.xword	0xa36209b15b3f827d
	.xword	0xa49626a45090bdbd
	.xword	0x8f84e4f750488950
	.xword	0xec15d9139defcd8a
	.xword	0xde54ca29b24f7870
	.xword	0x39ecf77867a91007
	.xword	0xa5bf4bae75b13449
	.xword	0x4691e0f8b0e3645d
	.xword	0xcecc16834070d20b
	.xword	0x130b24d7863153b6
	.xword	0x44df50f75c682577
	.xword	0x3548cf5922abed9b
	.xword	0xb6483a55d1ea3af0
	.xword	0xfc67838915d4e7a2
	.xword	0xabc1044319ba5392
	.xword	0x9c1d3798fdf2f420
	.xword	0x30e6878e7f388f6f
	.xword	0xdef7da3b3d57450c
	.xword	0x6bbd1142d7f7a046
	.xword	0x2475e9625e0d2cc7
	.xword	0x2eae7f6a749fdbf5
	.xword	0xead57dcba9a26250
	.xword	0x91ce18d4a4c811de
	.xword	0x94ed4d88637e44d2
	.xword	0x6f38a9a1859d9e7c
	.xword	0x3013747b6da8b526
	.xword	0x26f86466d5260c94
	.xword	0xd5effae2ab0a0fdd
	.xword	0x859b9c445debdeba
	.xword	0xe9bbedbc49109f64
	.xword	0x5b952536a6d3c5b3
	.xword	0x75d05d1bc1d6182c
	.xword	0xc40398d3bca750fc
	.xword	0xee9d84035880fe79
	.xword	0x5e96136319c7369c
	.xword	0x59e4309d0f25567d
	.xword	0xbabe51face0533af
	.xword	0x16a3b911f338d846
	.xword	0xabea9d9b6c02e6f5
	.xword	0xfd8285c6074210a2
	.xword	0x6afe2eb248d07d22
	.xword	0x6866b1dbc0e6f3cc
	.xword	0x217764146aff93b3
	.xword	0x1f12970e6b6edcd1
	.xword	0xb0f1d9011117733f
	.xword	0x25700f037ea4a81c
	.xword	0x71424538a42ea701
	.xword	0xcbc1133becc21f70
	.xword	0xaa8f20af54c96a06
	.xword	0x5f1f42d07ea2c826
	.xword	0x909e0ed6d0a70986
	.xword	0x13699ca44f76ef23
	.xword	0xde6d123e751e9977
	.xword	0x438847b49aa71ac2
	.xword	0x1d9239b580f33873
	.xword	0x6e918bc042f417e2
	.xword	0x1088518d52dfaac8
	.xword	0x64d3ca5c3991fc1a
	.xword	0x1162d3b0b8f0e1c3
	.xword	0x1747828c02b7ad4e
	.xword	0xe467daf1b0b5fbcf
	.xword	0x50d23bcc150b084f
	.xword	0x3e6b34dfbcaf864c
	.xword	0x4f9eb3d09e76a838
	.xword	0x77de2c05f7cf5a31
	.xword	0x9b75048f7307b4a6
	.xword	0xb4bde7737dba5c77
	.xword	0xedc815e0937515e3
	.xword	0x9adbf1b4652ca161
	.xword	0x558a5d2e33567132
	.xword	0x3f7e099b5c99b0f0
	.xword	0x1b2d5679f265aa21
	.xword	0x1dd63b97eade2315
	.xword	0x14c3e3ac8b8d5d8d
	.xword	0xe7e6f9c12f7304e2
	.xword	0xbb04f8643730af12
	.xword	0xc30215760d02cee0
	.xword	0xfc660e8bd9a0a165
	.xword	0xb8aded71edd78139
	.xword	0x3047b4db559736e8
	.xword	0xbd607b78f09a0ae0
	.xword	0x50f99011cbfa90d0
	.xword	0xccfd494cc734ded1
	.xword	0x92d3c0ced5dafa6c
	.xword	0x81bcb1e9366b77d0
	.xword	0x246d10a0720ef011
	.xword	0x2665f6c435c57235
	.xword	0x23879691dda0dac9
	.xword	0xa69f6a83cea203ea
	.xword	0x7061b6553240bcd6
	.xword	0x31c67cd418f6b270
	.xword	0xf8b57d2ec356fb87
	.xword	0x735e9afc6cbb8a5f
	.xword	0xd0f5972e058867e5
	.xword	0x4e3d8383be9dfb51
	.xword	0x717480788b22f339
	.xword	0x7ca9f683939b8439
	.xword	0xfdb1da60b5e79437
	.xword	0xfc3114db845df8e1
	.xword	0x155bbe2680191022
	.xword	0x20d94a94a6334bb7
	.xword	0xc876e7a57a32fb1b
	.xword	0x4409342d9e1faa60
	.xword	0x23ae7f97e2b97b5a
	.xword	0xb28a0d0776220969
	.xword	0x165549b4cfc9df06
	.xword	0xcb383e566abd5501
	.xword	0x5bb32dd1ffa695f5
	.xword	0xd2f8d3b788f0e7d5
	.xword	0x72af0199068a2537
	.xword	0xaa4323b6fbacaba2
	.xword	0xfccf223e8a546b93
	.xword	0x8166dd8abe177743
	.xword	0x9dd85d4019f90c91
	.xword	0xb813c04078f78720
	.xword	0x5df63c12e96e86cd
	.xword	0xc8ad7e0df234c4eb
	.xword	0x6539a75ddcd734d3
	.xword	0x2d7cdaeedd474555
	.xword	0x388d287d958e6e5a
	.xword	0xa5d98b29e96bc3f4
	.xword	0x7fb6ec1fc2d602ec
	.xword	0x816676c91ef67e7b
	.xword	0xac666b1427eec295
	.xword	0x8e532afcb4b87bab
	.xword	0xa1714c7bb9f4d7c2
	.xword	0xaa2cf3116c443891
	.xword	0xee344903fcb1525b
	.xword	0x1d343b0f65e78610
	.xword	0x5ffc15451f39c901
	.xword	0xf3db5c9d5f842533
	.xword	0x0d615d1a69cd926a
	.xword	0x78d93693b17e495f
	.xword	0x510eab6cf148243a
	.xword	0x4b269daf441542c8
	.xword	0x118a9f6e374cf37d
	.xword	0xe6afd010b62030ae
	.xword	0x07b4950bc06b4ddd
	.xword	0x221da4b50f8fa07e
	.xword	0xe7d485d2907cd70d
	.xword	0x39364dc0b3ae9c2e
	.xword	0x19a9ab82a6516297
	.xword	0x2d4dbf6424b78384
	.xword	0xc214a0c79e5cf15c
	.xword	0x09224200647d8dbb
	.xword	0xb41371cc5774c1a9
	.xword	0x6d4a2498f04be83a
	.xword	0xa2ce934b71e8305c
	.xword	0x8ea3e9598e2e47a6
	.xword	0xa3f8d4929c9e5816
	.xword	0xe79f62e8bdf8606f
	.xword	0x1b3f950b0ad9b324
	.xword	0xf7dbd91a2cdf909f
	.xword	0x0d9b804584ca0e09
	.xword	0x25771fb84ccc8e55
	.xword	0x7a396e8a2f6c6b8a
	.xword	0x2113049a664a7269
	.xword	0x0eb9829747e2356c
	.xword	0x7d5558dfae5edda2
	.xword	0x8ed54117ffe0dd20
	.xword	0xa4852a16dae471c2
	.xword	0x656f2dd5f21ae26a
	.xword	0x88e2dabc682c42f2
	.xword	0xbd1c8ee250406867
	.xword	0xe165bd656b699c52
	.xword	0x5cd0eb93e69c812d
	.xword	0x5b288befc0e65d7f
	.xword	0xfec6500afb8ac571
	.xword	0x31cf78a6b1677a46
	.xword	0x1b877fce5cc0a751
	.xword	0x4f40ab4323bae1b2
	.xword	0x76064091d3e0b8df
	.xword	0x95c5e4bd3f3c6f8b
	.xword	0x7b03df5be3e520e5
	.xword	0xa9f1e16a3d78bc52
	.xword	0xb9c5f293ec9802e3
	.xword	0x128e8bd322ab14f3
	.xword	0x9ca18ba1a6193120
	.xword	0x8f9dfd1bf64ed6b6
	.xword	0x0a810fd2ea93e9ce
	.xword	0xaa40944d3788e2b8
	.xword	0x182df68484a7aa06
	.xword	0xbc15b4149ad54883
	.xword	0x264e6b44693789b8
	.xword	0x08159b1652eea306
	.xword	0x2f9a98456297d8ea
	.xword	0xa23cf11cbaab4270
	.xword	0xc0f4420087125fef
	.xword	0x861027bb0f2c8c05
	.xword	0xd146d30d064b711a
	.xword	0x42c4f903be641f16
	.xword	0xff1a970910dabb44
	.xword	0x5c5ecf400d79c6dc
	.align 0x20000
	.data
data_start_5:

	.xword	0x98643704a052ad65
	.xword	0x1802e8df5684307f
	.xword	0x4abe3f5bf0b8b9ed
	.xword	0x2e668dfcc7852e27
	.xword	0x838136f6518d8651
	.xword	0x17e2fba996a976fd
	.xword	0x476d32fef5ddea7a
	.xword	0x8a587681969c940f
	.xword	0xa047ffa25f108f4b
	.xword	0x85050785bedf06f2
	.xword	0x33aa31efa44b1c5c
	.xword	0x992c7ee2a7603cab
	.xword	0xcfcc65cf13cbd0f8
	.xword	0xdc720386ed67c46e
	.xword	0xdaf82e8854487398
	.xword	0x0b3e3e97a8205936
	.xword	0x4e10921768939868
	.xword	0x9ae8073fe17ccb34
	.xword	0x09f3ec7d34f6bbff
	.xword	0xd36f2f036a9197c3
	.xword	0x6f55bb8606d969c7
	.xword	0x0351bf3cc8027057
	.xword	0xeaa9077127ff01c0
	.xword	0x01478a2ec739b36b
	.xword	0x08994d9b429118f7
	.xword	0x808849cca37662b6
	.xword	0x68d2c2227df53779
	.xword	0x4c1829b6980eaa87
	.xword	0x75baa3798120ca20
	.xword	0xb2f056f9701294f0
	.xword	0x7baf67633818fde1
	.xword	0x1488eeb5a7b55cdc
	.xword	0xfe670466f4a12a7d
	.xword	0x5377568a2bd712b8
	.xword	0xd527fdf960ca97b6
	.xword	0x5e5df1179cfaf939
	.xword	0xd2c1556ae05fe531
	.xword	0xb4252742e3125ef4
	.xword	0xfad044e39714fd43
	.xword	0x0bf35544ea3ae65c
	.xword	0x31283f7d6456ece1
	.xword	0xbe0e891b3a04d400
	.xword	0x35c3fbc4c703cee7
	.xword	0x86566c90dafd10b9
	.xword	0x80253e6773ec4284
	.xword	0x95940e292ddb21a3
	.xword	0xfbf660b1d2552c65
	.xword	0x64427c9a6388e100
	.xword	0xfd2249d481ad72a0
	.xword	0xd72b6d68ed86b34e
	.xword	0xa65a9bb58cbb4363
	.xword	0x840cce8f19728e0d
	.xword	0x7f8c7c8dde508cdf
	.xword	0x3d0018450447a399
	.xword	0x8043937aba952de2
	.xword	0xb9603b0aaee42b05
	.xword	0x077764b8fbc6a7f8
	.xword	0xcef12441ca2424cc
	.xword	0x82c7342caf61dd01
	.xword	0xdaa31e9f684ca360
	.xword	0xefeab2f1c1c14b76
	.xword	0xb17e921cf22fcbc0
	.xword	0xce7ab091d55b8f3e
	.xword	0xc570d02a59132cdb
	.xword	0x2291fce0fa438ca3
	.xword	0x89fa51f8d7d92430
	.xword	0x819dfd3a21f74a9b
	.xword	0x811f2572e59f3439
	.xword	0xae51abc3e64467b6
	.xword	0x2f839069eeb55dd9
	.xword	0x5bc041e0ca4dd491
	.xword	0x044fee2beb8d80a2
	.xword	0x3b4565488d2f976a
	.xword	0xaebcfcd353271778
	.xword	0xbe0e01598d9a1307
	.xword	0x64ead7588461ee7e
	.xword	0x94c2919de059ccf5
	.xword	0x03da7295215ff35d
	.xword	0x603b64eb4824824c
	.xword	0xe1022bf3b42c9cb6
	.xword	0x2007be78dc681d32
	.xword	0xb526c0145a66b0ab
	.xword	0x4c69a2f10aaf9e04
	.xword	0xd8a44091a0b3739e
	.xword	0xd2050ee386b28957
	.xword	0x58261b5d290dddc8
	.xword	0x0ea94840acdddd52
	.xword	0x95560d175e57fcfe
	.xword	0x2d5e9ffbaf7bd16b
	.xword	0x3c301ddfe26587ad
	.xword	0xd731b8b2a0cae47e
	.xword	0x5e52c3a9012dd62a
	.xword	0x64861f6151fbef8f
	.xword	0x67a85f16ebb681a3
	.xword	0xf1c65904de533ba8
	.xword	0x42bdfb929c0d0231
	.xword	0xf527dfc33c3e7826
	.xword	0xf01f933a99ec630a
	.xword	0x18cfe9092c97ac67
	.xword	0xf1154e4125bbc950
	.xword	0xee7bbdb04a252938
	.xword	0xb281839c5742afa1
	.xword	0x99ab1c206d23d1cc
	.xword	0xd12886ceebbd405e
	.xword	0x276de8ba8a01cabd
	.xword	0x3e7be2bdff31ef74
	.xword	0xfeb21f9ddb258b14
	.xword	0x77e39d155e58c7fd
	.xword	0x42fc0e04a554e30b
	.xword	0xfa32678d5495ffaf
	.xword	0xd3821e2a3e5d4828
	.xword	0x930e6f99831af94f
	.xword	0x15630fb86d8b3ee9
	.xword	0x462ecd5de3a04a26
	.xword	0xd10c4ac56e5ed726
	.xword	0x8c61686f0cc53293
	.xword	0xc11866cdcd958f35
	.xword	0xc0553089ad80f249
	.xword	0xa2d42063406a865a
	.xword	0x502533fb47dd1ed0
	.xword	0x7e905ca8832e2033
	.xword	0x680ec930fef04b16
	.xword	0x3edad64a50c67355
	.xword	0x380e039385e44884
	.xword	0x8a5cec339ed0aed6
	.xword	0x09c719e9222555a4
	.xword	0xd041103dfe1b7c0e
	.xword	0xea7eef8dab5feef7
	.xword	0x86f175989a53cf52
	.xword	0x68111f86dbaf5e9f
	.xword	0x432812d26ae5bc54
	.xword	0x84f49c41ae91b958
	.xword	0x3f252c6eb19df992
	.xword	0x1dfe65c9ee82b0e1
	.xword	0x5787a4d69eec0301
	.xword	0xd31d7cbb8d0fe225
	.xword	0xc9cc893efcd7d3a8
	.xword	0x1c7b20ae17ada5dc
	.xword	0x7017a1417fd46fc9
	.xword	0x6dde86d20d8d91ec
	.xword	0x707c9029a5642f71
	.xword	0x0135b21ef36021e7
	.xword	0x32e2b9faf087278c
	.xword	0x72b9a1ac06ca8d65
	.xword	0xb26954ed95c40b83
	.xword	0x8756e2477e67d2be
	.xword	0x45937594f4f31ee2
	.xword	0xe5b7bdfe6d211e2e
	.xword	0x86a47367e5e6f00a
	.xword	0x1774d55627159d5e
	.xword	0xf28c1a6cc6e30363
	.xword	0x47aa8b0309df1e5e
	.xword	0x67cd0be648b40cde
	.xword	0x4400f1f03bb65b20
	.xword	0x6964af95472fdaf7
	.xword	0x9909f777a1ccd966
	.xword	0xd5e46a3c0ba87002
	.xword	0xac4d5a9bc2a4f9e8
	.xword	0x06907b9a6e95c668
	.xword	0xe60b2170e59827ee
	.xword	0xa93ff38a8aa8724a
	.xword	0x7d3159b24c91300a
	.xword	0x6714a9d3c30c4ba0
	.xword	0x77cff999533b3595
	.xword	0x0af6142251e90cb3
	.xword	0xb4d860e6a3f7db23
	.xword	0x73283a09a8f3fdbb
	.xword	0x3843c7355d60d8be
	.xword	0xa952c5c88bc221b8
	.xword	0x368dd04ed19af9c1
	.xword	0x445778a96f331673
	.xword	0x5305e9454ac8e314
	.xword	0xcb111097c1975ff4
	.xword	0xf5d9aec3ebc62f79
	.xword	0x61657aa75f1d43dc
	.xword	0x00f28d25680e85a9
	.xword	0x7775df93e011e776
	.xword	0x6852faba01c59b88
	.xword	0x48a027c1fa5fe1e3
	.xword	0xe0b6abcceed086bf
	.xword	0x7e52f07095bd0a35
	.xword	0xa5c48194a4469f61
	.xword	0xd0b80e8f7b864f29
	.xword	0xf2ca5e598422f6e5
	.xword	0xe9bda6df32158721
	.xword	0x290b97bbebe1e7dc
	.xword	0xf3a4cf797b3479c1
	.xword	0x1a795bf3130c7723
	.xword	0xddcc2d7aea237a7d
	.xword	0xd55687e649e4de0a
	.xword	0xc266ffcc028ee075
	.xword	0x3a5dbb55093dc1b9
	.xword	0xaf3a3d3491336d55
	.xword	0xe37d30af911d4928
	.xword	0xd45d901a2635aa8e
	.xword	0x3757afd4e98580bb
	.xword	0x07bd20ee770cdf9d
	.xword	0x9911f55fd73cc8af
	.xword	0x8f6d59be86386068
	.xword	0xa15c6e5a9023e1e0
	.xword	0x56dde420041f991a
	.xword	0xf9b9954adea98e45
	.xword	0x42dadaccec10f9f6
	.xword	0xfe3f4dd224d2e6f9
	.xword	0xe869e62480f465b1
	.xword	0xb2c787d3c05f06f0
	.xword	0x63e1b49a9edc6344
	.xword	0x5b912d12e9d40c95
	.xword	0x4ede758834ab641b
	.xword	0x07b0a23293fa1317
	.xword	0xe01af849679201ff
	.xword	0x71bb213c146e12c7
	.xword	0x0d19cc2e04cc1035
	.xword	0xe09a3d65111c4f49
	.xword	0x652bfc0d6d7abd59
	.xword	0x4fc9376fa0daea38
	.xword	0x0d83823cc101373e
	.xword	0x5d31bbcc024ffb3e
	.xword	0x0cd43f1f97bddcbb
	.xword	0x66b1fbb785931ae6
	.xword	0xaa082b373fa7b832
	.xword	0x48400425d066c498
	.xword	0x551afdf85ab4b2ba
	.xword	0x69f92f87548bc119
	.xword	0x7c438d9ab2b50f2c
	.xword	0xd27c7c37e2ff9de3
	.xword	0x9e023ab180d0e5a1
	.xword	0x80b910d3449d76ee
	.xword	0x614c965c818fa609
	.xword	0x15584e39e76e3e0d
	.xword	0x34397bbd09ece260
	.xword	0x455e93bcebe41d40
	.xword	0x87b4d3872103bec4
	.xword	0x207b33f9be8f4c27
	.xword	0xacc3e7ea6dd4b850
	.xword	0x374b951ada355dca
	.xword	0x1a8b6d182e9bb461
	.xword	0xd8b2fe9e6443852e
	.xword	0xcedb216cc58b1c56
	.xword	0xc93c443a4f47c47e
	.xword	0xab107b632f04dbe9
	.xword	0x3f8ecfd3e43a64de
	.xword	0x4084229b53711a82
	.xword	0x18c11ffe651430e0
	.xword	0x7c8074018e13d196
	.xword	0x4e246d05b39025de
	.xword	0x0638b82b929ac0fd
	.xword	0x4d3ca31753466c12
	.xword	0x3470b446b53b4057
	.xword	0xd52b56dd4c570e79
	.xword	0xe9e42a8150f4e6fc
	.xword	0xcbbda54a43865573
	.xword	0x069920009bf39da2
	.xword	0xbe931141e02d508f
	.xword	0x2faff9cb0c05fde4
	.xword	0x6879559ddb3fdcaf
	.align 0x40000
	.data
data_start_6:

	.xword	0x0c9abe0813987926
	.xword	0x708a4828a9d65dc4
	.xword	0x7730160cc98c1553
	.xword	0x1f15c8edac472433
	.xword	0xd78bfbb8d33da57b
	.xword	0xfcba20ac68b20cfe
	.xword	0xbd938ad44c744d3a
	.xword	0x518517e99c4085ef
	.xword	0xc86fd5c973dba151
	.xword	0x6861f8eb7a84bbc6
	.xword	0xde8f08fdf18ca874
	.xword	0x1211b3c7f79421d8
	.xword	0xe928a85e2e3f81d5
	.xword	0xbf080707dcb9ee24
	.xword	0x49cb96665269598a
	.xword	0x9317b525c67ea062
	.xword	0x7bddc2b346db8080
	.xword	0x6b5bd8fb9098ee1d
	.xword	0x7d4d4fa7c7123026
	.xword	0x8c7097df7656d91c
	.xword	0x5cb3a3a230bfb767
	.xword	0x2efd6954e573514d
	.xword	0x6ecb2cdeb053cd0d
	.xword	0x80f9cae9ca1f4afd
	.xword	0x0c043a8bb8c67a1c
	.xword	0xde56a2cbb0ef380e
	.xword	0xbb253eb859a4050a
	.xword	0x4804527c48b6672a
	.xword	0x41c66a2b63b193b0
	.xword	0x7114d1bae6756644
	.xword	0x6a6bce185a9a749f
	.xword	0x56e99939c447107a
	.xword	0x004d4c2f2bd7169f
	.xword	0x34d4d543f80850f2
	.xword	0xd3cc8ca6305b5dd8
	.xword	0x7e2e2ceb3b1ddb45
	.xword	0xb29481cc2aca155a
	.xword	0x92e93e2c3c39598f
	.xword	0xa3a04c4f4be68b91
	.xword	0x264c14a0390da6a9
	.xword	0x36f7703244f7a8af
	.xword	0x8972b99be82ca8f4
	.xword	0x1e3700dc222f76a8
	.xword	0x98752fceb3ec3de2
	.xword	0xdc92e587c937422d
	.xword	0x758202b0da904bae
	.xword	0xf045919573112dab
	.xword	0xef5d53d09a3719ad
	.xword	0xbe59879b50f69830
	.xword	0x78d41a93c2d977f4
	.xword	0x0717c7b1e6d6a5fe
	.xword	0x1fa1edc6bca691c5
	.xword	0xb66f8b876b502cff
	.xword	0x1f0f1b93b27d5efa
	.xword	0x6ca58e55ad569c58
	.xword	0x78855b793df0fdbd
	.xword	0xe5036a7b7cb21c96
	.xword	0x8fadd14dd6a5d287
	.xword	0xf0a10b9be5ed8bd4
	.xword	0xaaf65dabda05a4eb
	.xword	0x737a0a6f654a5e57
	.xword	0x909520bcec5a8c59
	.xword	0x3ecaa0990290deda
	.xword	0xbfba5c81d42b9afd
	.xword	0xb97a5cfb1c304fde
	.xword	0xa538f2f644a6e0f0
	.xword	0x73cde62a8c9f0e87
	.xword	0x1efbe339cd227398
	.xword	0x1adaf9a59125569c
	.xword	0xb525d54d6b1928d2
	.xword	0x2dbd6f4690b098ea
	.xword	0x8d2b7484672659f6
	.xword	0xf53bdcbc34ea553c
	.xword	0xee2906a23d20435f
	.xword	0x196effc0c07471e8
	.xword	0x5172fbd865bba27f
	.xword	0xffcb0c4c901908c1
	.xword	0x9943fed7ff03710f
	.xword	0xedac3a19e3b18bb2
	.xword	0xba9abf47b9abca7e
	.xword	0xa9ed6ad810283014
	.xword	0x2312156a0522e101
	.xword	0x09f3b0bf5b0f4067
	.xword	0x7c6670bc5893e065
	.xword	0x417317a881ac9bd2
	.xword	0xc63eec94060b4e4b
	.xword	0x2502b6d8391758af
	.xword	0x5db409b8845b830b
	.xword	0x0d38f5a42acca6ae
	.xword	0xa4d9a61c9478a902
	.xword	0xf3db6a3165444594
	.xword	0x2c3a1693c0450336
	.xword	0x996c7facee6da3f8
	.xword	0x3641f99704cb7711
	.xword	0xaacab4894503ccdb
	.xword	0x220f609a23c2f24d
	.xword	0x2a66b0fe3b8d311b
	.xword	0xc93d3dbc3ee6f5de
	.xword	0xbec3cd4aa12d91db
	.xword	0x42a607f50a8250ab
	.xword	0xa85a8b82d67a5a55
	.xword	0xf296339ffbf50efc
	.xword	0x06146edc5883f3d8
	.xword	0x2e408f8542152a25
	.xword	0x32421b96ef4ef3ad
	.xword	0xdbe530807d531aef
	.xword	0x3036323cbbee28a8
	.xword	0xf205140d99be02d4
	.xword	0x8ee8493936e669be
	.xword	0x6144d87b59734790
	.xword	0x4f9ec6518ff7f7ca
	.xword	0xd94212e55d705466
	.xword	0x83558a6ddfae4343
	.xword	0x8e44874dbaa5d106
	.xword	0x3df9b9e84f8ef8f7
	.xword	0x1559ca6c863683b1
	.xword	0x0aff8717497c6952
	.xword	0x184202e429bc7110
	.xword	0xc97f4e81ad9a42e0
	.xword	0x98a2e64ba1439c74
	.xword	0xbe88bf5fce426755
	.xword	0x802d30bbf67fe350
	.xword	0x321b41d08eb81518
	.xword	0x5da462c40c2bd9af
	.xword	0x49456331f6c62163
	.xword	0x4cf91e497748f1ce
	.xword	0x8cba94467489c23a
	.xword	0x6b50b4dcb181d6ad
	.xword	0x2be0ef51144166b3
	.xword	0x44a49c0df47f2a85
	.xword	0x097800a313da6337
	.xword	0x6eec99d253357e33
	.xword	0xbcef3dee970a89e8
	.xword	0xcda6632c5b687c22
	.xword	0x70a123cef825077a
	.xword	0x245ec8f148aafe66
	.xword	0x8f0e4d1831bc535e
	.xword	0x8faadd71970890f6
	.xword	0xacba527417a69ab5
	.xword	0x65525563dfd531e3
	.xword	0xa6724929c58f0645
	.xword	0x5508137e2e1a085f
	.xword	0x5a5bbb51130b3882
	.xword	0x0576d4746207bd58
	.xword	0x84384a970d01e167
	.xword	0x9de20d3537e70e7c
	.xword	0x56b42e8b07f9fd8b
	.xword	0xc63155a3dca9ff6a
	.xword	0xe377d00d2711c4e0
	.xword	0xf189b44fdfa8c729
	.xword	0x36e3cdef40e792ea
	.xword	0xef079d03aad40e60
	.xword	0x4d6cf568c887fd0e
	.xword	0xc9418e05c7937181
	.xword	0xe3435308d29088f2
	.xword	0x4b3dd9af3d58fb94
	.xword	0x3365872050d2b85a
	.xword	0xcedc5e97c0b23f42
	.xword	0x856be4630ee72888
	.xword	0xd6a3d2d2c8f4e656
	.xword	0x7df4356546b89c9f
	.xword	0x55fd86ba0dee69e2
	.xword	0x14439461335e109c
	.xword	0x14f3eac264f97517
	.xword	0x3e5f54413c72a139
	.xword	0xeafb41d24b30a8a5
	.xword	0x668c2021aff24c53
	.xword	0xbf39b357e18b25ba
	.xword	0xdf1f3f1b89717e77
	.xword	0xf9e736ff56d451f4
	.xword	0x9276dbb1e8ef18b1
	.xword	0x36df5e8383b7dd6f
	.xword	0xde7fb531377efc42
	.xword	0x11683f5a88a03d6f
	.xword	0x8f29b9667e2d6a04
	.xword	0x2576d102216d584b
	.xword	0xb5cadba68fb38c3b
	.xword	0x89fbbdb683f282ab
	.xword	0x865d61910f970737
	.xword	0x8f6162f1551b4683
	.xword	0xdf4d871404627412
	.xword	0xf3ab459aeb3e45c2
	.xword	0x3cf57dd475ccff24
	.xword	0x7bb1352ba95161c8
	.xword	0x99417128be79b0c2
	.xword	0xe3d9a05604e2b789
	.xword	0x9d821099d3dcf151
	.xword	0xbca7fd56f719c1c1
	.xword	0x5e200c1388392bfb
	.xword	0x779b7266ef1ad7f9
	.xword	0xf142f93c485ce6b7
	.xword	0x5718dc4861673922
	.xword	0xdf9e422fd0953245
	.xword	0x134aa7e65361d7c9
	.xword	0x37a60753ab6a9455
	.xword	0x05c5aab274cb0476
	.xword	0x2ac56171a6e5d7b7
	.xword	0xdb759db49f3d2061
	.xword	0x46fc4cf3acfec739
	.xword	0x7b1838d7359fa3e3
	.xword	0x0d6b8947fb347e40
	.xword	0x5aa3259752bba82d
	.xword	0xec7edc5fcac02783
	.xword	0xa7c52e3c6f57b15f
	.xword	0xc38817192f02c3ea
	.xword	0x1221833860583e83
	.xword	0xe2c1c622ff12cc53
	.xword	0x1a7beac8f23559df
	.xword	0xa76bc5198ed21766
	.xword	0xc0c188ebf1811a22
	.xword	0x7e87fa43325a0365
	.xword	0x0805d20941da7c80
	.xword	0xc843b5547abaf14e
	.xword	0x94f5cb5472c242c9
	.xword	0x66949663eb52ce54
	.xword	0x09a443fd9a19c4b9
	.xword	0x8686150145a71199
	.xword	0xc79b9dc083789e92
	.xword	0xb1311b4dfe849582
	.xword	0xdd8a6f31e5ec9f77
	.xword	0x8bb166305cf44596
	.xword	0xb625287a95637a4f
	.xword	0xe876d334e0060b2f
	.xword	0xe45593b41b33a16d
	.xword	0x3e1920e5b3936e87
	.xword	0xd7da0b12c5f15ccb
	.xword	0xfcca41061292fa61
	.xword	0x03534b525ae9ebea
	.xword	0x92284a45ca7102bf
	.xword	0xa04d31f33ce531af
	.xword	0xbe0a82ac2cd3aaec
	.xword	0xd69dd99d51227617
	.xword	0xf59159bb87b80716
	.xword	0x21e1736cf315e20b
	.xword	0x665c3e8b343c2225
	.xword	0x0c168cc00bd6272f
	.xword	0xca88c418bec84b83
	.xword	0x9ef67304ca600a3a
	.xword	0x9bde89b97ea38a9d
	.xword	0xdc491ab3eccdabbd
	.xword	0x266148923b6db830
	.xword	0xd16a5a8fc875719c
	.xword	0x01a09c90295263dd
	.xword	0x3beca2f336dbfcc1
	.xword	0xdd2753d4726a8965
	.xword	0x7d0e6201ce6c7339
	.xword	0x7a2c26aad5362d7e
	.xword	0x7da611d530a318ae
	.xword	0x22b8e83331b15d80
	.xword	0x72c10aa33f5e3a89
	.xword	0xd41854104617cf28
	.xword	0xc651e98186bed3fc
	.xword	0x6c55df536e3ec8a4
	.xword	0x19f111d3a9751104
	.xword	0x6c79f9e76193b0bd
	.xword	0xf27947d9a79535be
	.align 0x80000
	.data
data_start_7:

	.xword	0x3b6333fca014d7be
	.xword	0x7b1aec88bcde23ca
	.xword	0x6aa2108ec4b26bc5
	.xword	0x790ac8ba8f5aeb50
	.xword	0xb2f93ebc282122cf
	.xword	0xabc971e3e6b3e922
	.xword	0xd82f427bf61fe037
	.xword	0x7edb92f345c9ae24
	.xword	0x062446c94c384f85
	.xword	0x29d2cee1db0f5938
	.xword	0xf972f530de4d9f03
	.xword	0x600f95d5fad02a02
	.xword	0x52f251380234964f
	.xword	0xbc02781d32c25c6b
	.xword	0xdd8105ec706ff8bd
	.xword	0x9b474f8cc0ae42a3
	.xword	0x20973945a9b4beeb
	.xword	0xb7dd93e18316964d
	.xword	0x91d442a9bcc5a00c
	.xword	0xf8d55b8aa61626a9
	.xword	0x34ce7f5610260d77
	.xword	0x44e98c736d01280e
	.xword	0xb2ffcda127adfcaa
	.xword	0xc5405daeb6cca645
	.xword	0x850edceddcb0777e
	.xword	0xfbe1d627cad995f9
	.xword	0x518f075f274b7624
	.xword	0x1409a046b7802764
	.xword	0xd60d1f4a12d076ef
	.xword	0x8788b0f2a21d9a46
	.xword	0x4b8638ef1d96911d
	.xword	0xd616924c255adee1
	.xword	0x9bc1445cb181bf47
	.xword	0x7bd2866d98a8078b
	.xword	0x59a100917199ed60
	.xword	0x3ba5f5d7c1af22b9
	.xword	0x8ee643bad74e2b46
	.xword	0xf732bad644e21b26
	.xword	0x1860b990968613d8
	.xword	0xab8362faabad8dc4
	.xword	0x01d451133c5a6e34
	.xword	0xb20b32647aee97f1
	.xword	0x0c0521ae9a5cc337
	.xword	0x53ee96ee6b2786a6
	.xword	0xcd6984ab6f18782b
	.xword	0x42db91e45e510259
	.xword	0x90c695954e7fdee1
	.xword	0x284aa42cec4f69a0
	.xword	0xc850074bffaec1e1
	.xword	0x12242611fa9984c2
	.xword	0x9b64733c76a56e95
	.xword	0xcebbefbe916a85da
	.xword	0x0b0d613505da07a7
	.xword	0xc62cf2bd272defb8
	.xword	0xc28ee333c70923ee
	.xword	0xfbfc462fb27687e2
	.xword	0xb52ceab2061c99b3
	.xword	0x1e90c8cdd83e57e2
	.xword	0x46d25e358fa3fed1
	.xword	0xd696f342e5d4929f
	.xword	0x440c2e06439920d5
	.xword	0xbc4993e1b6c7a720
	.xword	0x4567adc8726a589d
	.xword	0xbc1932cff567bf77
	.xword	0x5c7b7d1fe4201a7e
	.xword	0x3866ad1b3bf9b0f1
	.xword	0xc3e7b8551c37a41e
	.xword	0xf192297268c84502
	.xword	0xe5e883c31270f2f2
	.xword	0x0b797463558f0b24
	.xword	0x514042b91356ca8f
	.xword	0xcf04ed784148b934
	.xword	0xaa0a4fd0e53d0f4b
	.xword	0xbe6f2512633a3b3f
	.xword	0x1adcfcd753697f11
	.xword	0x22b0dbf177dadc5d
	.xword	0x3be1739253e8a42b
	.xword	0x6d5cf782db188aab
	.xword	0x0c4de1839247f73f
	.xword	0x8ed7cc4a8accd45d
	.xword	0x82eab035963721c9
	.xword	0x268e33a4f3bfa40a
	.xword	0xdbfa9aa91c198751
	.xword	0x8e91615fee5f8b80
	.xword	0xd90415ebf3f76a42
	.xword	0x21efa5f64787a992
	.xword	0x1715d65def0225e9
	.xword	0x8c963b7591f962e2
	.xword	0x09440a2e723ffbfc
	.xword	0x541e747cfcdb9aa8
	.xword	0x47a10dffeb3fcaab
	.xword	0xc9b88b16d486b06d
	.xword	0x01cb8be4fb46738a
	.xword	0x7ca0ec94ed589ca8
	.xword	0xaa389dae7291baad
	.xword	0xad15d0e5b4f8ace3
	.xword	0xec17a9cb77cab15c
	.xword	0xfd0375f89fbffff7
	.xword	0xf205bedc27861f23
	.xword	0x23751899207eb607
	.xword	0x2ed31cc3a9cb3ce3
	.xword	0xbfcb5ad0c8f703f8
	.xword	0x61bfec0325087737
	.xword	0x91df8a389b4c042c
	.xword	0xfaa4ccb3ba6e9845
	.xword	0x7ca3a110ff1b96fd
	.xword	0x0a1d5d865bfda2d6
	.xword	0x4a0a550cbf734903
	.xword	0xdbd04bcb2bc46a89
	.xword	0x5c8736197e0f10cc
	.xword	0x510a219c5933a707
	.xword	0x40ac0505564629e2
	.xword	0x54009d34e28796d9
	.xword	0x9a54adc766095b32
	.xword	0xc06a6f76a687d0ee
	.xword	0x7cf978cab1925dc5
	.xword	0x4074b10da9031f69
	.xword	0x25403e931504f10c
	.xword	0x212b6ad6e4d90490
	.xword	0x10db786f77f95fa7
	.xword	0x95fa9d6f5591204f
	.xword	0xf78c7300011a920d
	.xword	0x1b99ca0d2f81d44b
	.xword	0x3785419256bdf152
	.xword	0x08e5b5612d01fef6
	.xword	0x66dc4e558c91886e
	.xword	0xc8a5b5b02bc36ddf
	.xword	0x4d2f5ec74b3de711
	.xword	0x4051f8b5936af2f6
	.xword	0xa0e4dcd8d5f2ddf2
	.xword	0xb4d3826b205ed7e7
	.xword	0x29df0079649de543
	.xword	0x9e9667e7e7b89d8f
	.xword	0x523ff2595825b18e
	.xword	0x11c3a0c496a27327
	.xword	0x75b03c245e116227
	.xword	0xf589dc414da88e18
	.xword	0xb718564f4fe940fb
	.xword	0x295922ec25332821
	.xword	0x58a04a4c96f7a483
	.xword	0xa73c9878e2776007
	.xword	0x1b7bd68f6b517e92
	.xword	0xf597ccd58381c661
	.xword	0x104ef47cde188a81
	.xword	0x2c3e245b9375173d
	.xword	0x447e7406e2309441
	.xword	0x50eaaf7dfbab9132
	.xword	0xeae7189d6de3b2cf
	.xword	0xe81db8bb440e16e4
	.xword	0xa3b8def1bbd73bc6
	.xword	0x8ee98f6bbbed91e4
	.xword	0x1cf682adc333fd78
	.xword	0x73ba99d98196d16e
	.xword	0xb3100cab7707a586
	.xword	0xee7a433e2e79ce6f
	.xword	0xf2f8b7861c757386
	.xword	0xf18274e230d0459a
	.xword	0x0ac0c89bab0a0f38
	.xword	0x364365b62cef0bab
	.xword	0xb5006f1ab5566972
	.xword	0xecd428ca188abf32
	.xword	0x078bf7aa18a0d435
	.xword	0xfd956fff2fdac9ce
	.xword	0x9ba90a6b0df08d2b
	.xword	0x125fb6d47a8502c2
	.xword	0x3b0ba9db4570f557
	.xword	0x0e9f06da9e94241b
	.xword	0x5289d8bc46a6c762
	.xword	0x4b452531909e843e
	.xword	0xd31f913cceb83466
	.xword	0xf2d1be78ae51d056
	.xword	0x6f42afd0fbe80a0b
	.xword	0xa116de7cbcd5f5d5
	.xword	0x7e350dcb7be15d98
	.xword	0x70cd2a17f74efb79
	.xword	0xaf286406ab0df096
	.xword	0x5c0fab9fa53be953
	.xword	0xba6b9dc352bb0787
	.xword	0x25425981cc3731fd
	.xword	0xbd3938f8005d3e4c
	.xword	0x975fdedb56967a6c
	.xword	0xe5b6e99163ee0523
	.xword	0x03a6479bbd4d4c8d
	.xword	0x7c994084fd95884d
	.xword	0xeeae21d86247c823
	.xword	0xb07a3a04e033a910
	.xword	0x8057a6f7621e481a
	.xword	0x15a0cb942b28fc5e
	.xword	0x36815c51d73fa3a7
	.xword	0x4bf461039d0b932f
	.xword	0xd15349b41b65b59d
	.xword	0x62bdc2520d35bdeb
	.xword	0x87ec3e1f46dc0d0f
	.xword	0xb2e1621f5dda0b47
	.xword	0x7e67a33d530cb63e
	.xword	0xa8deea254c767219
	.xword	0x033892b69bf6160f
	.xword	0x5faa96a90be0ba17
	.xword	0xa77e4fe10d131e38
	.xword	0xaf298f4ffc949bdb
	.xword	0x8b097816ab9a49b2
	.xword	0xa5f2e8d80aed17e8
	.xword	0x833d6aa870dbdc38
	.xword	0x55056dce33f30e30
	.xword	0x0e1f2217e3e24ac1
	.xword	0x7398c77fbda9018e
	.xword	0x418ac79df5ce29fc
	.xword	0x5101b6260223163d
	.xword	0xda24766ae336537b
	.xword	0x9fef5014cfdfc1ea
	.xword	0x870d3f8b45adf068
	.xword	0x72c6f3a46a225b14
	.xword	0x79b914e0d22da6f0
	.xword	0x823173f10583bc01
	.xword	0xa7c437f7be1f2807
	.xword	0x6e5692d7fcb76e99
	.xword	0x230d36ca2da83eac
	.xword	0xe6c544e47cb18b8d
	.xword	0x47d11c8e1aecb87a
	.xword	0x9dbdc080d195ac1c
	.xword	0xf95d4f6731a58049
	.xword	0xe1b69ca5920e4c8a
	.xword	0xe4faa36a96e2d5ef
	.xword	0x750bdc367da98d90
	.xword	0x0ee28a9159acae41
	.xword	0x72c67a7a7c3447e2
	.xword	0xb545cb3477333bf3
	.xword	0x0e562ce3933c7770
	.xword	0x1cd868cae6c7ff68
	.xword	0xe340c2e088761afd
	.xword	0x2d138780d70dad87
	.xword	0x224ce9d9e88e8cd0
	.xword	0xfbf02efc931122bb
	.xword	0x0e46aba12abcae45
	.xword	0x8d468b63c7acb5c7
	.xword	0x03a606474f1a6081
	.xword	0x832f6a68dccf09b1
	.xword	0x7ec780f128021615
	.xword	0xef34f42157a5ef4e
	.xword	0xf299cbabc0817a67
	.xword	0xebb7e27a99c08726
	.xword	0xfbffc99a4ebd1eb4
	.xword	0x619949fca2b6dba0
	.xword	0xa0cdba1e0a9159c1
	.xword	0x07fc2e57b3f50698
	.xword	0x0a41af2509a1dcfb
	.xword	0x52180b235ccd938a
	.xword	0xd152f0731dc5aa93
	.xword	0x2442f233514314f6
	.xword	0xfbd0ca9f25909472
	.xword	0x14e58bde3ae27149
	.xword	0xe3abbd3980ff93ca
	.xword	0x974847d2d9013497
	.xword	0x1b8ffe9ae1ae3d24
	.xword	0xa24c4dbff8cabeff
	.xword	0xfc3fe2895ae96a23



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
