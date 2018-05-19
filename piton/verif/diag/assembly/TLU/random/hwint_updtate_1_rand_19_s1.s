// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_19_s1.s
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
   random seed:	65591873
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

	setx 0x49214c495262d16a, %g1, %g0
	setx 0x51e946eb3666ac4a, %g1, %g1
	setx 0x423c7ee772766074, %g1, %g2
	setx 0x71d014debd93cd64, %g1, %g3
	setx 0xe8085c0ce3f87791, %g1, %g4
	setx 0xc151ade59eab524e, %g1, %g5
	setx 0xebe9ed35da9b0d70, %g1, %g6
	setx 0xf8fe55a04da7b14d, %g1, %g7
	setx 0xb7ee0dcd885d7815, %g1, %r16
	setx 0x28818a44be6426e1, %g1, %r17
	setx 0xb55b98738252fce9, %g1, %r18
	setx 0x4fae2d3dc424db96, %g1, %r19
	setx 0xc03df3bb3fbfcd88, %g1, %r20
	setx 0xe0723d4f20f80648, %g1, %r21
	setx 0x58262493cb5e9f58, %g1, %r22
	setx 0x4d066b9089d4f9cd, %g1, %r23
	setx 0x43b3582f016158f0, %g1, %r24
	setx 0xf17b9d29d7ad0441, %g1, %r25
	setx 0x830d8ceb2ec5832b, %g1, %r26
	setx 0xaecb4d35f393129a, %g1, %r27
	setx 0x6d434b860f1e56ed, %g1, %r28
	setx 0xf7e0721ff41785a3, %g1, %r29
	setx 0xdcf2c2b846131dfe, %g1, %r30
	setx 0x0cc100895dccd663, %g1, %r31
	save
	setx 0x132fbe7ce909e693, %g1, %r16
	setx 0x4bd5a709a049b5ff, %g1, %r17
	setx 0xff9d312f061d35be, %g1, %r18
	setx 0xcb4c3ececc9bfcf0, %g1, %r19
	setx 0x9f60de967957caeb, %g1, %r20
	setx 0xcf691bdc60b7838c, %g1, %r21
	setx 0x98856b581da97a33, %g1, %r22
	setx 0xae9e2446a7ab3107, %g1, %r23
	setx 0x312751773456c5a1, %g1, %r24
	setx 0xff1597981cb4167f, %g1, %r25
	setx 0xd4cf8b9d79bb89aa, %g1, %r26
	setx 0xcfe232c611a8aa39, %g1, %r27
	setx 0x5242da774a10296d, %g1, %r28
	setx 0x9b55953ef5d52ab4, %g1, %r29
	setx 0xcbf2f64b83933b2b, %g1, %r30
	setx 0xaa846970e5d250b8, %g1, %r31
	save
	setx 0xc604c11044a21f88, %g1, %r16
	setx 0x97f6a5fde64c6b17, %g1, %r17
	setx 0xa57238049c727e3c, %g1, %r18
	setx 0xb4828a054f8fc62f, %g1, %r19
	setx 0xd53021932353f8fe, %g1, %r20
	setx 0xb5fdb6576452a073, %g1, %r21
	setx 0x13149dfc60c9530b, %g1, %r22
	setx 0xad492679007a4a95, %g1, %r23
	setx 0xf5de4b6f21367eb8, %g1, %r24
	setx 0xb90b6596e6bb1cab, %g1, %r25
	setx 0xc0d2b801cd3100f4, %g1, %r26
	setx 0xd283b35852ff37f0, %g1, %r27
	setx 0x73298424f68d58b2, %g1, %r28
	setx 0x41d6563326fba85e, %g1, %r29
	setx 0x502e522de6c1dca2, %g1, %r30
	setx 0xbf03bca825b8ee29, %g1, %r31
	save
	setx 0x98c45c10ddeb7953, %g1, %r16
	setx 0x7904bbf71dd8a9bb, %g1, %r17
	setx 0x6cd9d40ef6a19e86, %g1, %r18
	setx 0x1dbee5d3c31bb1c2, %g1, %r19
	setx 0x243cdd5f8eb1e41d, %g1, %r20
	setx 0x5cc43b50151770ed, %g1, %r21
	setx 0xb5a28ba657027da0, %g1, %r22
	setx 0xc569bd4a2e7b8780, %g1, %r23
	setx 0x87c66ad181d8d138, %g1, %r24
	setx 0x0363894a51595027, %g1, %r25
	setx 0xf3e64461d6a75ec7, %g1, %r26
	setx 0xdb909e42ae7eff9e, %g1, %r27
	setx 0x558c5a098f8fc25d, %g1, %r28
	setx 0xc398f23f6a6d20f6, %g1, %r29
	setx 0x7b809b1b51ba03ec, %g1, %r30
	setx 0x079c2b6a38d24474, %g1, %r31
	save
	setx 0x1e22a7c9e61728ca, %g1, %r16
	setx 0x7ae836d60c54d6a5, %g1, %r17
	setx 0xe683b6abc563657c, %g1, %r18
	setx 0xcc99c14b9da4ea67, %g1, %r19
	setx 0x755dc5affb44887d, %g1, %r20
	setx 0xed0a6c9761e02322, %g1, %r21
	setx 0xe09f1c14eec5142a, %g1, %r22
	setx 0x2f12477145e438dd, %g1, %r23
	setx 0x8da3e7b265bcc3a9, %g1, %r24
	setx 0x2cdcc6cb5cf19d12, %g1, %r25
	setx 0x04edcb1eb371bff2, %g1, %r26
	setx 0xf14692623b69af93, %g1, %r27
	setx 0x0b8bec7805b54dcc, %g1, %r28
	setx 0x3d31223b1b2aa4df, %g1, %r29
	setx 0xa9f0b6e59448fc1c, %g1, %r30
	setx 0xb200a08cae89fa46, %g1, %r31
	save
	setx 0x1a391db6859c78f1, %g1, %r16
	setx 0xebab6bfb9bad4044, %g1, %r17
	setx 0x3e09d7e0433a1548, %g1, %r18
	setx 0x193ba32e8bd0610c, %g1, %r19
	setx 0x54f16bd735a39729, %g1, %r20
	setx 0xc173524fa12de43a, %g1, %r21
	setx 0xc465ec5a647ca64e, %g1, %r22
	setx 0xfdc7e99c9f367601, %g1, %r23
	setx 0x64ccbe601d48b74d, %g1, %r24
	setx 0x38e307803c576b79, %g1, %r25
	setx 0x2729c2faa87c31d5, %g1, %r26
	setx 0x622035645a6938d7, %g1, %r27
	setx 0xfd757015c25ba474, %g1, %r28
	setx 0xd74bf4cba9fc3600, %g1, %r29
	setx 0x52263376bc1388c6, %g1, %r30
	setx 0xbf8100037983cebe, %g1, %r31
	save
	setx 0xa6e0025907aedf32, %g1, %r16
	setx 0x68de7075f2184fba, %g1, %r17
	setx 0x0bb8792d151e3236, %g1, %r18
	setx 0xb768f0d59825ddfc, %g1, %r19
	setx 0x772e75ee7892fc4f, %g1, %r20
	setx 0x02d92627b0f80bb8, %g1, %r21
	setx 0xc86fc64138a98e1f, %g1, %r22
	setx 0x77e5ce9b9ec284a4, %g1, %r23
	setx 0x8b7e81db68e7af0c, %g1, %r24
	setx 0x7d0f2ad1d0aec94b, %g1, %r25
	setx 0x08ddf05a70343157, %g1, %r26
	setx 0x48bc35bc01f55b91, %g1, %r27
	setx 0xb3e409f8795cd583, %g1, %r28
	setx 0x84548a616a80f3b3, %g1, %r29
	setx 0x0610694f7a0fc66e, %g1, %r30
	setx 0x378e820697dc9048, %g1, %r31
	save
	setx 0xdf888faf25f5632d, %g1, %r16
	setx 0x385a6c3c9b0b4ac7, %g1, %r17
	setx 0xde832497d40cca1b, %g1, %r18
	setx 0xfd5b71452d8cbcac, %g1, %r19
	setx 0x5d730e5349edd63a, %g1, %r20
	setx 0xd4f908f55372be84, %g1, %r21
	setx 0xc51ec07f23cf38ab, %g1, %r22
	setx 0xfe03bec9c3979f23, %g1, %r23
	setx 0xb77b5c70213a8245, %g1, %r24
	setx 0xf9f73a6b76bd6531, %g1, %r25
	setx 0x97470e0ed41295ad, %g1, %r26
	setx 0xd614bbee54741865, %g1, %r27
	setx 0x2378d3711e16544e, %g1, %r28
	setx 0xd00246d11fad08da, %g1, %r29
	setx 0x54c3f09fb0647d85, %g1, %r30
	setx 0xe4639d37e970d7ae, %g1, %r31
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
	.word 0xb3e460b2  ! 1: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_0:
	mov	0x13, %r14
	.word 0xf8db8e60  ! 2: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfe58000  ! 3: SAVE_R	save	%r22, %r0, %r31
	.word 0xbbe4e078  ! 4: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_0:
	setx	0x1f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_1:
	mov	0x34, %r14
	.word 0xf4db8400  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_1:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_2:
	setx	0x1f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_3:
	setx	0x1e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_0:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 17: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e5a0c1  ! 23: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe4e1ef  ! 25: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e560a1  ! 28: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_4:
	setx	0x1e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_6:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e179  ! 33: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde4e092  ! 37: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_7:
	setx	0x1c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_8:
	setx	0x1f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_9:
	setx	0x1e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 45: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe44000  ! 47: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_10:
	setx	0x1f013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c1000  ! 50: SRAX_R	srax	%r16, %r0, %r30
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_1:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 55: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 57: SAVE_R	save	%r16, %r0, %r30
	.word 0xb5e40000  ! 58: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_11:
	setx	0x1c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_2:
	mov	0x24, %r14
	.word 0xfedb8e80  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb1e4a034  ! 71: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe50000  ! 74: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe44000  ! 75: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_12:
	setx	0x1f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_2:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 82: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb0bc21be  ! 83: XNORcc_I	xnorcc 	%r16, 0x01be, %r24
T0_asi_reg_rd_3:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb5e44000  ! 87: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_13:
	setx	0x1e0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 91: MOVcc_R	<illegal instruction>
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e58000  ! 99: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe4e08e  ! 103: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe54000  ! 104: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e420e6  ! 105: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xba2c0000  ! 106: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xb1e54000  ! 107: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_3:
	mov	0x7, %r14
	.word 0xf6f38e80  ! 108: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e4c000  ! 114: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_4:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 118: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_14:
	setx	0x1010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_15:
	setx	0x1e0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e10c  ! 128: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb4a54000  ! 129: SUBcc_R	subcc 	%r21, %r0, %r26
	.word 0xbde4e1f4  ! 130: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_4:
	mov	0x2b, %r14
	.word 0xf2f389e0  ! 131: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_16:
	setx	0x1f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1b5  ! 136: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb4b48000  ! 137: ORNcc_R	orncc 	%r18, %r0, %r26
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_17:
	setx	0x1c013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46019  ! 144: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde58000  ! 150: SAVE_R	save	%r22, %r0, %r30
	.word 0xbebdc000  ! 151: XNORcc_R	xnorcc 	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_18:
	setx	0x1e010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_19:
	setx	0x1d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_20:
	setx	0x1f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a065  ! 162: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe54000  ! 164: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_5:
	mov	0x3c0, %r14
	.word 0xfedb89e0  ! 165: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb4950000  ! 166: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xb9e5e183  ! 167: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_6:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 168: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1e4c000  ! 169: SAVE_R	save	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde5a110  ! 174: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e5e063  ! 175: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e4a0a8  ! 179: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_7:
	mov	0x9, %r14
	.word 0xf8db84a0  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_rd_8:
	mov	0xb, %r14
	.word 0xf8db8e80  ! 188: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_rd_9:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e4c000  ! 196: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_5:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 197: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1e520e6  ! 200: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e5e022  ! 202: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, c)
	.word 0xbde5e11a  ! 206: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe40000  ! 208: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e5a069  ! 209: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb12c8000  ! 210: SLL_R	sll 	%r18, %r0, %r24
T0_asi_reg_rd_10:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_21:
	setx	0x1c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 216: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e44000  ! 218: SAVE_R	save	%r17, %r0, %r27
	.word 0xb9e4e06a  ! 221: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_11:
	mov	0x21, %r14
	.word 0xf6db8e40  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_22:
	setx	0x1e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735a001  ! 228: SRL_I	srl 	%r22, 0x0001, %r27
T0_asi_reg_rd_12:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 231: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1e4e06f  ! 232: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e5e1a0  ! 234: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e5c000  ! 235: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_13:
	mov	0x7, %r14
	.word 0xf6db84a0  ! 238: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0x91952044  ! 245: WRPR_PIL_I	wrpr	%r20, 0x0044, %pil
cpu_intr_0_23:
	setx	0x1f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561fa  ! 248: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_14:
	mov	0xd, %r14
	.word 0xf4db8400  ! 249: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3e5c000  ! 250: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_24:
	setx	0x1f0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 252: SAVE_R	save	%r19, %r0, %r26
	.word 0xb2954000  ! 256: ORcc_R	orcc 	%r21, %r0, %r25
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde5c000  ! 259: SAVE_R	save	%r23, %r0, %r30
	.word 0xa1902000  ! 260: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_0_25:
	setx	0x1d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_6:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 264: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_15:
	mov	0x1e, %r14
	.word 0xfcdb8e60  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe50000  ! 270: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe4e1f0  ! 271: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbb643801  ! 273: MOVcc_I	<illegal instruction>
	.word 0xb9e4a09b  ! 274: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4a070  ! 277: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb6a48000  ! 281: SUBcc_R	subcc 	%r18, %r0, %r27
	.word 0xb9e50000  ! 283: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e56076  ! 288: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_7:
	mov	0x33, %r14
	.word 0xf4f38e80  ! 290: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb204e071  ! 292: ADD_I	add 	%r19, 0x0071, %r25
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_8:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 300: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbde56015  ! 304: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_26:
	setx	0x1d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_27:
	setx	0x1e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_9:
	mov	0x2a, %r14
	.word 0xf2f38e80  ! 315: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e5e151  ! 317: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_16:
	mov	0x34, %r14
	.word 0xf0db84a0  ! 320: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde42088  ! 322: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_28:
	setx	0x1f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 325: SAVE_R	save	%r18, %r0, %r30
	.word 0xbfe58000  ! 327: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e56138  ! 329: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_29:
	setx	0x1e013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_30:
	setx	0x1f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e035  ! 333: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_17:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 336: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_18:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e54000  ! 342: SAVE_R	save	%r21, %r0, %r25
	.word 0xbfe44000  ! 346: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_10:
	mov	0x2c, %r14
	.word 0xf4f38e80  ! 347: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_31:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 352: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde5616f  ! 353: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe461a4  ! 354: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_12:
	mov	0x1d, %r14
	.word 0xf4f384a0  ! 355: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_32:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 360: SAVE_R	save	%r16, %r0, %r30
	.word 0xb3e50000  ! 362: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 363: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_33:
	setx	0x1d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_14:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 368: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e561b7  ! 370: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_19:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e5c000  ! 374: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_15:
	mov	0x2b, %r14
	.word 0xf0f38e60  ! 377: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbfe520ad  ! 381: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_34:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_35:
	setx	0x1f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 392: SAVE_R	save	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_20:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_21:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb0140000  ! 404: OR_R	or 	%r16, %r0, %r24
	.word 0xb7356001  ! 405: SRL_I	srl 	%r21, 0x0001, %r27
	.word 0xba24e1fb  ! 406: SUB_I	sub 	%r19, 0x01fb, %r29
cpu_intr_0_36:
	setx	0x1f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_22:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7e5e0f8  ! 413: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbd3de001  ! 418: SRA_I	sra 	%r23, 0x0001, %r30
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_16:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 420: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_wr_17:
	mov	0x15, %r14
	.word 0xfaf38e80  ! 422: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_37:
	setx	0x1f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_18:
	mov	0x25, %r14
	.word 0xf0f38400  ! 427: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_wr_19:
	mov	0x17, %r14
	.word 0xfaf38400  ! 429: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb40cc000  ! 435: AND_R	and 	%r19, %r0, %r26
	.word 0xb7e50000  ! 437: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e40000  ! 438: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_20:
	mov	0x0, %r14
	.word 0xf4f384a0  ! 443: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_23:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_38:
	setx	0x20003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_24:
	mov	0x1f, %r14
	.word 0xfadb8e80  ! 458: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7e58000  ! 459: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_39:
	setx	0x210105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_40:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 467: SAVE_R	save	%r21, %r0, %r30
	.word 0xb5e5c000  ! 468: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_21:
	mov	0xe, %r14
	.word 0xf6f38e80  ! 472: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_22:
	mov	0x26, %r14
	.word 0xf4f38400  ! 475: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0x89946102  ! 477: WRPR_TICK_I	wrpr	%r17, 0x0102, %tick
	.word 0xb8ad4000  ! 479: ANDNcc_R	andncc 	%r21, %r0, %r28
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe44000  ! 481: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_23:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 483: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e5602e  ! 485: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e52069  ! 490: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_41:
	setx	0x20031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 23)
	.word 0xbfe5c000  ! 494: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_42:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe244000  ! 500: SUB_R	sub 	%r17, %r0, %r31
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, a)
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe44000  ! 520: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe4211b  ! 522: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_43:
	setx	0x21032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_44:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_25:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7e54000  ! 535: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_45:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_24:
	mov	0x12, %r14
	.word 0xfef38e60  ! 539: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_rd_26:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbbe5e051  ! 542: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_25:
	mov	0xe, %r14
	.word 0xfef389e0  ! 543: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_46:
	setx	0x21010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a12d  ! 547: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5c000  ! 549: SAVE_R	save	%r23, %r0, %r28
	.word 0xb1e5c000  ! 551: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9e5e0e0  ! 553: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5c000  ! 555: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 8)
	.word 0xba440000  ! 557: ADDC_R	addc 	%r16, %r0, %r29
	.word 0xbbe5e02a  ! 561: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_26:
	mov	0x3, %r14
	.word 0xf6f389e0  ! 562: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 38)
	.word 0xbeb4e06b  ! 564: ORNcc_I	orncc 	%r19, 0x006b, %r31
	.word 0xb1e5c000  ! 566: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_47:
	setx	0x22030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_48:
	setx	0x21013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e40000  ! 574: SAVE_R	save	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb485e172  ! 579: ADDcc_I	addcc 	%r23, 0x0172, %r26
T0_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 581: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5c000  ! 591: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_49:
	setx	0x230101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46004  ! 593: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e4a17d  ! 594: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_28:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 595: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_50:
	setx	0x220033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460d4  ! 600: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4c000  ! 602: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_51:
	setx	0x23013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_52:
	setx	0x200031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56176  ! 610: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e44000  ! 611: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e4209d  ! 612: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbcc54000  ! 616: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xb9e5c000  ! 617: SAVE_R	save	%r23, %r0, %r28
	.word 0xbc1c8000  ! 618: XOR_R	xor 	%r18, %r0, %r30
T0_asi_reg_wr_29:
	mov	0x9, %r14
	.word 0xf2f38e60  ! 620: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_27:
	mov	0x4, %r14
	.word 0xf0db84a0  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_28:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 624: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e48000  ! 629: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb7e56046  ! 632: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_53:
	setx	0x21010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c2082  ! 638: XNOR_I	xnor 	%r16, 0x0082, %r30
T0_asi_reg_wr_30:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 639: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_29:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe4c000  ! 642: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e48000  ! 644: SAVE_R	save	%r18, %r0, %r28
	.word 0xb28c4000  ! 645: ANDcc_R	andcc 	%r17, %r0, %r25
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_30:
	mov	0x0, %r14
	.word 0xfedb8e40  ! 650: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_31:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 652: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3e5c000  ! 653: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_32:
	mov	0x19, %r14
	.word 0xf0db89e0  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbde4c000  ! 665: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_31:
	mov	0x2f, %r14
	.word 0xf6f38e80  ! 666: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_54:
	setx	0x210027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 672: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_33:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 677: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_32:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 678: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb9e54000  ! 680: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_34:
	mov	0x7, %r14
	.word 0xfedb8e60  ! 683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbde4e1b8  ! 685: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb0c4c000  ! 687: ADDCcc_R	addccc 	%r19, %r0, %r24
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_55:
	setx	0x22012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0cb  ! 693: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd3c2001  ! 694: SRA_I	sra 	%r16, 0x0001, %r30
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
	.word 0xbde4a0e5  ! 697: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_56:
	setx	0x21012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e461e2  ! 700: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e52166  ! 703: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e44000  ! 706: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_35:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_57:
	setx	0x230029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_58:
	setx	0x200207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_36:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e5e079  ! 718: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e4609f  ! 719: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_59:
	setx	0x200100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e1ea  ! 724: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e50000  ! 726: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_33:
	mov	0x3c3, %r14
	.word 0xfaf38e60  ! 728: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5e4c000  ! 729: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_60:
	setx	0x21012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 737: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_61:
	setx	0x200326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_62:
	setx	0x20002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e460b6  ! 743: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e52136  ! 745: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e520fb  ! 746: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe50000  ! 747: SAVE_R	save	%r20, %r0, %r29
	.word 0xbe248000  ! 748: SUB_R	sub 	%r18, %r0, %r31
T0_asi_reg_wr_34:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 750: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe5e0ce  ! 753: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e5a18e  ! 754: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb8bc0000  ! 756: XNORcc_R	xnorcc 	%r16, %r0, %r28
cpu_intr_0_63:
	setx	0x230307, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_35:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 759: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_37:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7e4c000  ! 765: SAVE_R	save	%r19, %r0, %r27
	.word 0xb5e40000  ! 767: SAVE_R	save	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_64:
	setx	0x22031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_65:
	setx	0x23030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 771: SAVE_R	save	%r20, %r0, %r24
	.word 0xbd2d1000  ! 773: SLLX_R	sllx	%r20, %r0, %r30
cpu_intr_0_66:
	setx	0x23021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe44000  ! 780: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_67:
	setx	0x210228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_36:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 783: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_68:
	setx	0x210019, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 786: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbbe52159  ! 789: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5e40000  ! 791: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_38:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_69:
	setx	0x220305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a06b  ! 797: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe50000  ! 799: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_39:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_70:
	setx	0x23012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_40:
	mov	0x35, %r14
	.word 0xfcdb89e0  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5540000  ! 803: RDPR_GL	<illegal instruction>
cpu_intr_0_71:
	setx	0x210119, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_41:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb73c8000  ! 813: SRA_R	sra 	%r18, %r0, %r27
	.word 0xbbe44000  ! 815: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e4c000  ! 825: SAVE_R	save	%r19, %r0, %r27
	.word 0xb29cc000  ! 826: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xb32c0000  ! 830: SLL_R	sll 	%r16, %r0, %r25
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_38:
	mov	0x11, %r14
	.word 0xfaf38e80  ! 833: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbd346001  ! 835: SRL_I	srl 	%r17, 0x0001, %r30
T0_asi_reg_wr_39:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 837: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbbe5610b  ! 839: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb08c4000  ! 841: ANDcc_R	andcc 	%r17, %r0, %r24
	.word 0xbfe58000  ! 843: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_72:
	setx	0x20030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 850: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_40:
	mov	0x3, %r14
	.word 0xf4f389e0  ! 851: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfe52068  ! 857: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1520000  ! 858: RDPR_PIL	<illegal instruction>
	.word 0xbde48000  ! 861: SAVE_R	save	%r18, %r0, %r30
	.word 0xbbe4216c  ! 863: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_42:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbf2c6001  ! 872: SLL_I	sll 	%r17, 0x0001, %r31
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e5200d  ! 886: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e50000  ! 890: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9e5c000  ! 892: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e4e08c  ! 893: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e5a0fa  ! 895: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe44000  ! 898: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_73:
	setx	0x210332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 901: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_74:
	setx	0x21033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 907: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_75:
	setx	0x20010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 912: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e40000  ! 914: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_43:
	mov	0x23, %r14
	.word 0xf2db89e0  ! 915: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb83c8000  ! 916: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xbfe561c8  ! 918: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e42179  ! 919: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e40000  ! 920: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_76:
	setx	0x24001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e5c000  ! 933: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe5a13d  ! 935: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_77:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe52159  ! 947: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb12c1000  ! 949: SLLX_R	sllx	%r16, %r0, %r24
	.word 0xb3e4e163  ! 951: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5a062  ! 952: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e5e1a6  ! 953: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e5e164  ! 954: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_44:
	mov	0x33, %r14
	.word 0xfedb8400  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_41:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 958: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_78:
	setx	0x260237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56041  ! 962: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e561d6  ! 965: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_79:
	setx	0x26021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_80:
	setx	0x24031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 978: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_81:
	setx	0x27020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc340000  ! 980: SUBC_R	orn 	%r16, %r0, %r30
T0_asi_reg_wr_42:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 981: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xba2ca064  ! 985: ANDN_I	andn 	%r18, 0x0064, %r29
T0_asi_reg_wr_43:
	mov	0x27, %r14
	.word 0xf4f389e0  ! 986: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9e50000  ! 987: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_45:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e44000  ! 995: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_82:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91956115  ! 997: WRPR_PIL_I	wrpr	%r21, 0x0115, %pil
	.word 0xbfe40000  ! 998: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_46:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_83:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_84:
	setx	0x270206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_85:
	setx	0x270318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3c4000  ! 1009: XNOR_R	xnor 	%r17, %r0, %r31
cpu_intr_0_86:
	setx	0x250128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1a3  ! 1013: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 27)
	.word 0xbcb421b3  ! 1016: SUBCcc_I	orncc 	%r16, 0x01b3, %r30
	.word 0xbfe4e0d0  ! 1019: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde4c000  ! 1022: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_87:
	setx	0x24023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_88:
	setx	0x250200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_89:
	setx	0x270336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1ce  ! 1031: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5c000  ! 1032: SAVE_R	save	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_90:
	setx	0x250318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e186  ! 1040: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 17)
	.word 0xb1e5c000  ! 1045: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_47:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb08ca1d6  ! 1048: ANDcc_I	andcc 	%r18, 0x01d6, %r24
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e56168  ! 1051: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xba250000  ! 1052: SUB_R	sub 	%r20, %r0, %r29
T0_asi_reg_rd_48:
	mov	0x1c, %r14
	.word 0xfedb8e60  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_91:
	setx	0x260031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0b3  ! 1058: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_92:
	setx	0x250112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5e4e159  ! 1068: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_44:
	mov	0x6, %r14
	.word 0xfef384a0  ! 1070: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3e5c000  ! 1071: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe4a121  ! 1075: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_49:
	mov	0xc, %r14
	.word 0xf6db8e60  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_50:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e4a000  ! 1090: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_51:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 1094: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9520000  ! 1102: RDPR_PIL	<illegal instruction>
	.word 0xb9e50000  ! 1103: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e4e00d  ! 1104: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_45:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 1107: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbbe48000  ! 1111: SAVE_R	save	%r18, %r0, %r29
	.word 0xb7e5e02a  ! 1112: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, c)
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e5c000  ! 1118: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e48000  ! 1122: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde58000  ! 1124: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_93:
	setx	0x270020, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_wr_46:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1131: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe4e0c5  ! 1139: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_94:
	setx	0x250335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e561af  ! 1143: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e5a1a1  ! 1144: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_95:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0xa, %r14
	.word 0xf0f38e60  ! 1147: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb6a4e0b7  ! 1149: SUBcc_I	subcc 	%r19, 0x00b7, %r27
T0_asi_reg_rd_53:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3e44000  ! 1155: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_48:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 1156: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe5c000  ! 1161: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_49:
	mov	0x16, %r14
	.word 0xf0f384a0  ! 1163: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5e4c000  ! 1164: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_54:
	mov	0x4, %r14
	.word 0xfadb8e60  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5347001  ! 1168: SRLX_I	srlx	%r17, 0x0001, %r26
	.word 0xbfe5a0b7  ! 1169: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e56070  ! 1170: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb89d20a3  ! 1172: XORcc_I	xorcc 	%r20, 0x00a3, %r28
	.word 0xb5e4e1d7  ! 1173: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5a001  ! 1174: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4610b  ! 1175: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_96:
	setx	0x270109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4204f  ! 1181: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_97:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 1187: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_98:
	setx	0x240008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_99:
	setx	0x26002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72da001  ! 1192: SLL_I	sll 	%r22, 0x0001, %r27
cpu_intr_0_100:
	setx	0x250002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e09e  ! 1194: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_55:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_101:
	setx	0x250020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_50:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 1204: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9e50000  ! 1207: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_51:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 1213: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbe50000  ! 1214: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_56:
	mov	0x37, %r14
	.word 0xf6db84a0  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_52:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 1217: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbc04e0fe  ! 1218: ADD_I	add 	%r19, 0x00fe, %r30
cpu_intr_0_102:
	setx	0x24000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_53:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 1221: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_54:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 1227: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb88c4000  ! 1229: ANDcc_R	andcc 	%r17, %r0, %r28
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 19)
	.word 0xbde4a00f  ! 1232: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, e)
	.word 0xbde5a0fa  ! 1235: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe58000  ! 1237: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_57:
	mov	0x19, %r14
	.word 0xf8db84a0  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_103:
	setx	0x26001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_58:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 1242: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e4c000  ! 1248: SAVE_R	save	%r19, %r0, %r24
	.word 0xb2ac4000  ! 1249: ANDNcc_R	andncc 	%r17, %r0, %r25
cpu_intr_0_104:
	setx	0x270220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56071  ! 1257: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe58000  ! 1259: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_105:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_106:
	setx	0x25012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 1268: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_107:
	setx	0x250021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x240026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_59:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbe844000  ! 1278: ADDcc_R	addcc 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_109:
	setx	0x240037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a190  ! 1285: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb005c000  ! 1289: ADD_R	add 	%r23, %r0, %r24
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_110:
	setx	0x26000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_111:
	setx	0x270326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1294: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_112:
	setx	0x270015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_55:
	mov	0x29, %r14
	.word 0xf0f38e40  ! 1300: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe50000  ! 1303: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_113:
	setx	0x25033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1305: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_60:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 1308: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb92ca001  ! 1310: SLL_I	sll 	%r18, 0x0001, %r28
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e4c000  ! 1314: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe4a0f1  ! 1318: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e421fb  ! 1323: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e4c000  ! 1326: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe5208d  ! 1333: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e42063  ! 1334: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e44000  ! 1336: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e44000  ! 1338: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e4a03e  ! 1339: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_56:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 1345: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbde4a19e  ! 1346: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_57:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 1348: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e5615f  ! 1350: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbb7dc400  ! 1352: MOVR_R	movre	%r23, %r0, %r29
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_61:
	mov	0x33, %r14
	.word 0xfadb84a0  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_114:
	setx	0x260204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e176  ! 1359: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_58:
	mov	0x37, %r14
	.word 0xf6f384a0  ! 1361: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_59:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 1362: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_115:
	setx	0x270009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 1370: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_60:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 1378: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde5a1e6  ! 1381: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4c000  ! 1382: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e4c000  ! 1383: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_62:
	mov	0x38, %r14
	.word 0xf6db84a0  ! 1384: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbde56182  ! 1385: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_63:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 1387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_116:
	setx	0x250030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_117:
	setx	0x290105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1395: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 9)
	.word 0xb69da04a  ! 1398: XORcc_I	xorcc 	%r22, 0x004a, %r27
cpu_intr_0_118:
	setx	0x280325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b5e174  ! 1403: ORNcc_I	orncc 	%r23, 0x0174, %r24
T0_asi_reg_rd_64:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_65:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb73c6001  ! 1406: SRA_I	sra 	%r17, 0x0001, %r27
	.word 0xbde40000  ! 1410: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe5a1ae  ! 1411: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e5a1ba  ! 1415: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_66:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e5a110  ! 1432: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_119:
	setx	0x28023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_120:
	setx	0x2a032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_67:
	mov	0x26, %r14
	.word 0xfcdb8e60  ! 1436: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb534f001  ! 1438: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb5e40000  ! 1444: SAVE_R	save	%r16, %r0, %r26
	.word 0xbaa56117  ! 1445: SUBcc_I	subcc 	%r21, 0x0117, %r29
cpu_intr_0_121:
	setx	0x2b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_122:
	setx	0x290039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 1452: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde5a047  ! 1459: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_62:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 1462: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbac5e1bc  ! 1471: ADDCcc_I	addccc 	%r23, 0x01bc, %r29
	.word 0xbfe520d2  ! 1473: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_68:
	mov	0x28, %r14
	.word 0xf6db8400  ! 1474: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_63:
	mov	0x16, %r14
	.word 0xf6f384a0  ! 1476: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbbe5c000  ! 1478: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_123:
	setx	0x2a011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 1485: SAVE_R	save	%r22, %r0, %r30
	.word 0xba3ca01a  ! 1486: XNOR_I	xnor 	%r18, 0x001a, %r29
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_69:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 1488: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_70:
	mov	0xf, %r14
	.word 0xf8db8e60  ! 1490: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e50000  ! 1492: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_64:
	mov	0x20, %r14
	.word 0xf6f38400  ! 1493: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_65:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 1494: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_124:
	setx	0x290321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_71:
	mov	0x22, %r14
	.word 0xfcdb84a0  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbde4e007  ! 1508: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_125:
	setx	0x2b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1513: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_72:
	mov	0xc, %r14
	.word 0xf0db8e80  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_66:
	mov	0x2e, %r14
	.word 0xfcf384a0  ! 1515: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_126:
	setx	0x290203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23ca1cb  ! 1522: XNOR_I	xnor 	%r18, 0x01cb, %r25
T0_asi_reg_rd_73:
	mov	0x35, %r14
	.word 0xf0db8e80  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e48000  ! 1529: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 8)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_67:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 1535: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_68:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 1543: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_69:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 1544: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 26)
	.word 0xbb51c000  ! 1551: RDPR_TL	<illegal instruction>
	.word 0xbfe48000  ! 1552: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde5a0b4  ! 1553: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_127:
	setx	0x28003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_70:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 1561: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde461d4  ! 1562: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_74:
	mov	0xb, %r14
	.word 0xf4db89e0  ! 1570: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1e42144  ! 1572: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_75:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 1574: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e5e19d  ! 1576: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbde54000  ! 1577: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe50000  ! 1578: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbde4e161  ! 1581: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_128:
	setx	0x2a0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde5c000  ! 1587: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_71:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 1589: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_76:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe42109  ! 1591: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_129:
	setx	0x290103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5617c  ! 1593: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_130:
	setx	0x280138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_131:
	setx	0x2b0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e46150  ! 1602: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_72:
	mov	0x4, %r14
	.word 0xfef389e0  ! 1605: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3e56072  ! 1606: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e4212d  ! 1611: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, d)
	.word 0xbbe48000  ! 1619: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_132:
	setx	0x2a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_73:
	mov	0x2b, %r14
	.word 0xf8f38e60  ! 1622: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfe5601e  ! 1629: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5e088  ! 1631: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe4c000  ! 1635: SAVE_R	save	%r19, %r0, %r31
	.word 0xb69520a5  ! 1638: ORcc_I	orcc 	%r20, 0x00a5, %r27
T0_asi_reg_rd_77:
	mov	0x2c, %r14
	.word 0xfcdb8400  ! 1639: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb5e5e0d4  ! 1640: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_78:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbbe58000  ! 1651: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_79:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_74:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 1654: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_133:
	setx	0x29022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56184  ! 1662: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e44000  ! 1663: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 37)
	.word 0xbfe4615c  ! 1665: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_134:
	setx	0x2b021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_135:
	setx	0x2a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_75:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 1676: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_76:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 1681: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 13)
	.word 0xb5e4e162  ! 1683: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe40000  ! 1686: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_136:
	setx	0x2b021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_77:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 1694: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_78:
	mov	0x7, %r14
	.word 0xfef389e0  ! 1698: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbf641800  ! 1700: MOVcc_R	<illegal instruction>
	.word 0xb7e5e15f  ! 1702: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e46060  ! 1709: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_80:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e4c000  ! 1711: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e54000  ! 1713: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd7de401  ! 1718: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xbbe54000  ! 1719: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, c)
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 16)
	.word 0xb1e421c2  ! 1724: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e50000  ! 1727: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e4a0ac  ! 1729: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe44000  ! 1730: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_137:
	setx	0x290337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81c20e3  ! 1732: XOR_I	xor 	%r16, 0x00e3, %r28
cpu_intr_0_138:
	setx	0x2a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4214c  ! 1737: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe460a9  ! 1740: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e40000  ! 1742: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_139:
	setx	0x280203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1e5c000  ! 1749: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb7e42108  ! 1755: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e50000  ! 1758: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe5e03d  ! 1765: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xba9cc000  ! 1768: XORcc_R	xorcc 	%r19, %r0, %r29
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb5e46042  ! 1773: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e4e116  ! 1777: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_82:
	mov	0x26, %r14
	.word 0xfedb8400  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_79:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 1779: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_rd_83:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_140:
	setx	0x2a021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 1788: SAVE_R	save	%r18, %r0, %r27
	.word 0xbbe44000  ! 1790: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_84:
	mov	0x2a, %r14
	.word 0xfadb8e40  ! 1793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_80:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 1795: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbbe58000  ! 1798: SAVE_R	save	%r22, %r0, %r29
	.word 0xb1e5c000  ! 1799: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 36)
	.word 0xbfe5c000  ! 1804: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_141:
	setx	0x2b0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_142:
	setx	0x29022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 1816: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbde48000  ! 1818: SAVE_R	save	%r18, %r0, %r30
	.word 0xbfe54000  ! 1819: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e4a1f4  ! 1820: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_82:
	mov	0x22, %r14
	.word 0xfaf38400  ! 1821: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb83d6195  ! 1823: XNOR_I	xnor 	%r21, 0x0195, %r28
	.word 0xb3e5210f  ! 1824: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_85:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 1827: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7e421fe  ! 1828: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e460a1  ! 1829: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e520a4  ! 1830: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_wr_83:
	mov	0x3, %r14
	.word 0xf8f384a0  ! 1832: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_86:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_143:
	setx	0x2e0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7e4a1c9  ! 1841: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_144:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_87:
	mov	0xc, %r14
	.word 0xf8db8e80  ! 1846: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_84:
	mov	0x10, %r14
	.word 0xfcf38400  ! 1852: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 0)
	.word 0xb82d8000  ! 1857: ANDN_R	andn 	%r22, %r0, %r28
T0_asi_reg_rd_88:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbde50000  ! 1859: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_145:
	setx	0x2d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x2e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1867: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbeb5c000  ! 1869: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xb93d8000  ! 1871: SRA_R	sra 	%r22, %r0, %r28
T0_asi_reg_wr_85:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 1872: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e461ed  ! 1874: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_86:
	mov	0x14, %r14
	.word 0xfcf38e60  ! 1876: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_89:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_87:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 1881: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfe4e0be  ! 1889: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_147:
	setx	0x2c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_148:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_149:
	setx	0x2e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_90:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_91:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 1908: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_150:
	setx	0x2c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_151:
	setx	0x2c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e461e4  ! 1914: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_152:
	setx	0x2e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_154:
	setx	0x2f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_88:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 1921: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_89:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 1923: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5e42154  ! 1926: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe44000  ! 1927: SAVE_R	save	%r17, %r0, %r29
	.word 0xb8450000  ! 1929: ADDC_R	addc 	%r20, %r0, %r28
	.word 0xb1e40000  ! 1930: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_90:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 1931: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9e56126  ! 1932: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe40000  ! 1933: SAVE_R	save	%r16, %r0, %r29
	.word 0xb0ad0000  ! 1934: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xb0c50000  ! 1935: ADDCcc_R	addccc 	%r20, %r0, %r24
T0_asi_reg_wr_91:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1937: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_155:
	setx	0x2d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5a125  ! 1951: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_92:
	mov	0x13, %r14
	.word 0xf6f38e80  ! 1953: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_93:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 1956: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_92:
	mov	0x14, %r14
	.word 0xf0db8e60  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5e4c000  ! 1960: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_156:
	setx	0x2f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb0ad4000  ! 1977: ANDNcc_R	andncc 	%r21, %r0, %r24
cpu_intr_0_157:
	setx	0x2d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde420de  ! 1979: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_94:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 1980: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_95:
	mov	0x2f, %r14
	.word 0xfef38400  ! 1982: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5c000  ! 1991: SAVE_R	save	%r23, %r0, %r25
	.word 0xbe844000  ! 1993: ADDcc_R	addcc 	%r17, %r0, %r31
cpu_intr_0_158:
	setx	0x2f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_159:
	setx	0x2d0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 1997: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_96:
	mov	0x11, %r14
	.word 0xf6f38400  ! 1998: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xba0d6021  ! 1999: AND_I	and 	%r21, 0x0021, %r29
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde4c000  ! 2001: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, c)
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_160:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e421b4  ! 2006: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde4a1a6  ! 2012: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5a167  ! 2013: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_161:
	setx	0x2e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 2019: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_162:
	setx	0x2d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a02d  ! 2024: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_163:
	setx	0x2e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40d8000  ! 2030: AND_R	and 	%r22, %r0, %r26
	.word 0xbde44000  ! 2032: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_98:
	mov	0x28, %r14
	.word 0xf6f389e0  ! 2036: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbde560a8  ! 2037: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e40000  ! 2039: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5e4e0bc  ! 2041: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_164:
	setx	0x2c0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_99:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 2044: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_165:
	setx	0x2d0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ce143  ! 2051: ANDN_I	andn 	%r19, 0x0143, %r31
cpu_intr_0_166:
	setx	0x2d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_167:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5346001  ! 2055: SRL_I	srl 	%r17, 0x0001, %r26
cpu_intr_0_168:
	setx	0x2d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_169:
	setx	0x2c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 2059: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e5e093  ! 2061: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e0ae  ! 2062: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb48de10b  ! 2063: ANDcc_I	andcc 	%r23, 0x010b, %r26
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e40000  ! 2070: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_170:
	setx	0x2d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5604c  ! 2073: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_100:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 2076: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb825a1b2  ! 2078: SUB_I	sub 	%r22, 0x01b2, %r28
	.word 0xbbe4c000  ! 2079: SAVE_R	save	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb02c8000  ! 2085: ANDN_R	andn 	%r18, %r0, %r24
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_101:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 2089: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_171:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521c2  ! 2091: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_102:
	mov	0x1e, %r14
	.word 0xf6f38400  ! 2094: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_93:
	mov	0x8, %r14
	.word 0xf0db8e60  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde4c000  ! 2107: SAVE_R	save	%r19, %r0, %r30
	.word 0xbde4e086  ! 2110: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 2)
	.word 0x8d9561f2  ! 2112: WRPR_PSTATE_I	wrpr	%r21, 0x01f2, %pstate
	.word 0xb7e50000  ! 2116: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e5e02d  ! 2117: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_103:
	mov	0x1, %r14
	.word 0xf8f38400  ! 2120: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5e5e1ab  ! 2121: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_172:
	setx	0x2d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 2130: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_94:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7353001  ! 2133: SRLX_I	srlx	%r20, 0x0001, %r27
T0_asi_reg_rd_95:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e5c000  ! 2139: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe40000  ! 2141: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_96:
	mov	0xf, %r14
	.word 0xf6db84a0  ! 2148: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfe4a13b  ! 2149: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_104:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 2150: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_rd_97:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 2152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbe4603b  ! 2153: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_98:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e4600a  ! 2157: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4c000  ! 2160: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_105:
	mov	0x14, %r14
	.word 0xfef38e40  ! 2162: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb37ca401  ! 2164: MOVR_I	movre	%r18, 0x1, %r25
T0_asi_reg_wr_106:
	mov	0x1c, %r14
	.word 0xf2f38e80  ! 2165: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9356001  ! 2170: SRL_I	srl 	%r21, 0x0001, %r28
	.word 0xbde44000  ! 2171: SAVE_R	save	%r17, %r0, %r30
	.word 0xb3e4609f  ! 2173: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_99:
	mov	0x37, %r14
	.word 0xf2db8e80  ! 2180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbd643801  ! 2182: MOVcc_I	<illegal instruction>
T0_asi_reg_rd_100:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 2183: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_173:
	setx	0x2f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 2188: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_174:
	setx	0x2f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x2f000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 2192: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_101:
	mov	0x36, %r14
	.word 0xf2db89e0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_108:
	mov	0x1a, %r14
	.word 0xf6f38e60  ! 2201: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_102:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_109:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 2205: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_103:
	mov	0x1b, %r14
	.word 0xfedb8e80  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9e50000  ! 2213: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_110:
	mov	0x1e, %r14
	.word 0xf8f389e0  ! 2215: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_rd_104:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 2216: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe5e06a  ! 2218: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_105:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbeb42192  ! 2221: SUBCcc_I	orncc 	%r16, 0x0192, %r31
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 11)
	.word 0xb3e42098  ! 2229: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e54000  ! 2230: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe4e01b  ! 2232: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5e0ca  ! 2233: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_106:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_176:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_107:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 2239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_108:
	mov	0x20, %r14
	.word 0xf4db8e80  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1e56040  ! 2245: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde5a0c1  ! 2247: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb885216d  ! 2248: ADDcc_I	addcc 	%r20, 0x016d, %r28
cpu_intr_0_177:
	setx	0x2c0312, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_111:
	mov	0x36, %r14
	.word 0xf6f384a0  ! 2250: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_112:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 2253: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7e5e057  ! 2256: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_178:
	setx	0x2d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e46145  ! 2260: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e5200c  ! 2262: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_179:
	setx	0x2d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_180:
	setx	0x2f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_113:
	mov	0x3c7, %r14
	.word 0xf0f38400  ! 2267: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3e5c000  ! 2268: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_109:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 2271: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9e40000  ! 2274: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe58000  ! 2275: SAVE_R	save	%r22, %r0, %r29
	.word 0xb48d8000  ! 2276: ANDcc_R	andcc 	%r22, %r0, %r26
	.word 0xb7e48000  ! 2278: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_181:
	setx	0x2c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde4e0b7  ! 2283: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbb34d000  ! 2287: SRLX_R	srlx	%r19, %r0, %r29
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe4a157  ! 2300: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e5c000  ! 2304: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe40000  ! 2306: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e4c000  ! 2310: SAVE_R	save	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_182:
	setx	0x31031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 2316: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e5a180  ! 2318: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e520ee  ! 2319: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e54000  ! 2321: SAVE_R	save	%r21, %r0, %r24
	.word 0xb694c000  ! 2322: ORcc_R	orcc 	%r19, %r0, %r27
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, d)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 15)
	.word 0xb93c7001  ! 2326: SRAX_I	srax	%r17, 0x0001, %r28
	.word 0xb5e56035  ! 2327: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_114:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 2329: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfe421f4  ! 2332: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e0f0  ! 2334: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4e14f  ! 2335: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e58000  ! 2336: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e48000  ! 2340: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_183:
	setx	0x310330, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_115:
	mov	0x6, %r14
	.word 0xf0f384a0  ! 2342: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 7)
	.word 0xbd342001  ! 2345: SRL_I	srl 	%r16, 0x0001, %r30
	.word 0xb3e5614f  ! 2348: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e46009  ! 2349: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e52058  ! 2351: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e50000  ! 2354: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e54000  ! 2355: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_110:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 2356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
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
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe4a099  ! 2369: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_184:
	setx	0x33002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e01f  ! 2374: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe5a004  ! 2377: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_116:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 2379: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_185:
	setx	0x9, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_186:
	setx	0x32032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_187:
	setx	0x300129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83d4000  ! 2393: XNOR_R	xnor 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 2397: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb12dc000  ! 2399: SLL_R	sll 	%r23, %r0, %r24
T0_asi_reg_wr_117:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 2401: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_188:
	setx	0x32030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_189:
	setx	0x31020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 2409: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_112:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 2410: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1e5605a  ! 2411: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe48000  ! 2414: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_113:
	mov	0x2f, %r14
	.word 0xf0db89e0  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbb2cc000  ! 2420: SLL_R	sll 	%r19, %r0, %r29
cpu_intr_0_190:
	setx	0x31021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_191:
	setx	0x33021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_192:
	setx	0x330330, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_114:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 2424: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_193:
	setx	0x310321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe560a9  ! 2434: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde4e145  ! 2436: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e54000  ! 2438: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_115:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb5e5e15f  ! 2441: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_116:
	mov	0x6, %r14
	.word 0xf6db89e0  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb0044000  ! 2445: ADD_R	add 	%r17, %r0, %r24
	.word 0xbfe5a132  ! 2449: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_117:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_194:
	setx	0x30000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_195:
	setx	0x33000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e11b  ! 2459: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_118:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 2463: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb63c60ce  ! 2464: XNOR_I	xnor 	%r17, 0x00ce, %r27
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_196:
	setx	0x320300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_197:
	setx	0x330334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_198:
	setx	0x11f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe560f5  ! 2479: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe58000  ! 2480: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_119:
	mov	0x37, %r14
	.word 0xf8f38e80  ! 2482: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7e5a183  ! 2485: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e4c000  ! 2487: SAVE_R	save	%r19, %r0, %r28
	.word 0xbbe5c000  ! 2488: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_199:
	setx	0x330016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 2494: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_120:
	mov	0x1e, %r14
	.word 0xfaf389e0  ! 2497: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_121:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 2504: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_122:
	mov	0x14, %r14
	.word 0xf4f38e80  ! 2506: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e5201e  ! 2514: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e4e0c9  ! 2519: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e50000  ! 2520: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e50000  ! 2521: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e421ee  ! 2523: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe420f5  ! 2531: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e5e0f3  ! 2535: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb69520e1  ! 2536: ORcc_I	orcc 	%r20, 0x00e1, %r27
T0_asi_reg_rd_118:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e54000  ! 2540: SAVE_R	save	%r21, %r0, %r27
	.word 0xbde4c000  ! 2542: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_200:
	setx	0x32003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e19b  ! 2550: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_201:
	setx	0x30032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2352052  ! 2552: SUBC_I	orn 	%r20, 0x0052, %r25
cpu_intr_0_202:
	setx	0x30030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_123:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 2556: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb1e56135  ! 2557: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbe052161  ! 2560: ADD_I	add 	%r20, 0x0161, %r31
T0_asi_reg_wr_124:
	mov	0x32, %r14
	.word 0xf0f389e0  ! 2565: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5e48000  ! 2566: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe46098  ! 2569: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e5a0af  ! 2571: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb29c8000  ! 2572: XORcc_R	xorcc 	%r18, %r0, %r25
cpu_intr_0_203:
	setx	0x33023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c5e1f9  ! 2574: ADDCcc_I	addccc 	%r23, 0x01f9, %r24
cpu_intr_0_204:
	setx	0x33002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0adc000  ! 2578: ANDNcc_R	andncc 	%r23, %r0, %r24
T0_asi_reg_rd_119:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 2580: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_205:
	setx	0x310205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, a)
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 21)
	.word 0xb08da0f5  ! 2590: ANDcc_I	andcc 	%r22, 0x00f5, %r24
	.word 0xb0458000  ! 2593: ADDC_R	addc 	%r22, %r0, %r24
	.word 0xb2ad617b  ! 2598: ANDNcc_I	andncc 	%r21, 0x017b, %r25
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e50000  ! 2602: SAVE_R	save	%r20, %r0, %r28
	.word 0xb1e5611f  ! 2607: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1341000  ! 2608: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xb5e58000  ! 2609: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_120:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e5e0b0  ! 2612: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_206:
	setx	0x310025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a1bc  ! 2619: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 31)
	.word 0xb89c2075  ! 2630: XORcc_I	xorcc 	%r16, 0x0075, %r28
T0_asi_reg_rd_121:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 2632: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_wr_125:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 2635: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_122:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe420d6  ! 2644: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_126:
	mov	0x0, %r14
	.word 0xfef389e0  ! 2649: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_wr_127:
	mov	0x1e, %r14
	.word 0xf0f389e0  ! 2650: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb21cc000  ! 2652: XOR_R	xor 	%r19, %r0, %r25
	.word 0xb5e42177  ! 2653: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf643801  ! 2655: MOVcc_I	<illegal instruction>
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe4c000  ! 2657: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_128:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 2659: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb81560af  ! 2660: OR_I	or 	%r21, 0x00af, %r28
	.word 0xb5e48000  ! 2661: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_207:
	setx	0x30031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a02b  ! 2666: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_123:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, d)
	.word 0xb6a54000  ! 2675: SUBcc_R	subcc 	%r21, %r0, %r27
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde5c000  ! 2677: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_124:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 2680: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_208:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_209:
	setx	0x330126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 2689: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e4606f  ! 2694: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e4a16b  ! 2695: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde460bd  ! 2701: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb48da172  ! 2702: ANDcc_I	andcc 	%r22, 0x0172, %r26
	.word 0xbc9d6067  ! 2706: XORcc_I	xorcc 	%r21, 0x0067, %r30
cpu_intr_0_210:
	setx	0x320025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_129:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 2711: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_211:
	setx	0x32022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_212:
	setx	0x310139, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_130:
	mov	0x29, %r14
	.word 0xf8f38e80  ! 2717: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb37c2401  ! 2719: MOVR_I	movre	%r16, 0x1, %r25
T0_asi_reg_wr_131:
	mov	0x38, %r14
	.word 0xfcf38e60  ! 2720: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbde58000  ! 2723: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, b)
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_213:
	setx	0x330029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_214:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_125:
	mov	0x5, %r14
	.word 0xf6db84a0  ! 2741: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1e5c000  ! 2750: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e46159  ! 2752: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_132:
	mov	0x38, %r14
	.word 0xf6f389e0  ! 2753: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5e4c000  ! 2754: SAVE_R	save	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe42156  ! 2756: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e4c000  ! 2757: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e4c000  ! 2760: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e4e0e0  ! 2761: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb750c000  ! 2762: RDPR_TT	<illegal instruction>
T0_asi_reg_rd_126:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e561c0  ! 2765: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_127:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc24c000  ! 2767: SUB_R	sub 	%r19, %r0, %r30
	.word 0xbde520dc  ! 2769: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e58000  ! 2772: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_215:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_216:
	setx	0x370339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe4219d  ! 2779: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, d)
	.word 0xbbe52118  ! 2783: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_128:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_217:
	setx	0x360210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e19f  ! 2791: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe58000  ! 2795: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde561ae  ! 2796: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_133:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 2797: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_134:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 2803: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9e5c000  ! 2804: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb6358000  ! 2808: SUBC_R	orn 	%r22, %r0, %r27
	.word 0xb3e4605f  ! 2809: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e48000  ! 2810: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_129:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 2814: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_135:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 2816: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3e5c000  ! 2817: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e5a0c5  ! 2818: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_218:
	setx	0x340323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_219:
	setx	0x37011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2822: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_136:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 2823: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_220:
	setx	0x370303, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_130:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_131:
	mov	0x2d, %r14
	.word 0xfadb8400  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1e42016  ! 2831: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e561ad  ! 2833: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_137:
	mov	0x11, %r14
	.word 0xf8f38e80  ! 2834: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7e5e1f9  ! 2837: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe50000  ! 2841: SAVE_R	save	%r20, %r0, %r31
	.word 0xb1e44000  ! 2843: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_221:
	setx	0x360235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_222:
	setx	0x360202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a1fa  ! 2847: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde4e098  ! 2849: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde54000  ! 2851: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbcc48000  ! 2856: ADDCcc_R	addccc 	%r18, %r0, %r30
cpu_intr_0_223:
	setx	0x360236, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_132:
	mov	0x22, %r14
	.word 0xfcdb8e60  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe5a1ff  ! 2868: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4e147  ! 2869: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e4e00d  ! 2871: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe5a0d5  ! 2875: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe56007  ! 2876: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_133:
	mov	0x1c, %r14
	.word 0xfcdb89e0  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3e40000  ! 2882: SAVE_R	save	%r16, %r0, %r25
	.word 0xbd2c3001  ! 2887: SLLX_I	sllx	%r16, 0x0001, %r30
	.word 0xbbe5c000  ! 2888: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe54000  ! 2892: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_224:
	setx	0x360134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 2895: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_225:
	setx	0x37030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_138:
	mov	0x3, %r14
	.word 0xfef38e40  ! 2899: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_226:
	setx	0x350323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_227:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_228:
	setx	0x340217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 15)
	.word 0xb7641800  ! 2908: MOVcc_R	<illegal instruction>
	.word 0xbbe4200e  ! 2910: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe4e0e8  ! 2911: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0x8d94e061  ! 2916: WRPR_PSTATE_I	wrpr	%r19, 0x0061, %pstate
	.word 0xb32c1000  ! 2917: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xb435a0a1  ! 2918: SUBC_I	orn 	%r22, 0x00a1, %r26
cpu_intr_0_229:
	setx	0x340033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_230:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_139:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 2933: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0x89956052  ! 2934: WRPR_TICK_I	wrpr	%r21, 0x0052, %tick
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_231:
	setx	0x370213, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e4c000  ! 2954: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_140:
	mov	0x34, %r14
	.word 0xfef389e0  ! 2955: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_135:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe54000  ! 2965: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_141:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 2967: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e48000  ! 2978: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_232:
	setx	0x340033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 2980: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_136:
	mov	0x7, %r14
	.word 0xf8db8e60  ! 2981: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e48000  ! 2982: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e420ff  ! 2984: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e44000  ! 2986: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_142:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 2992: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_233:
	setx	0x37002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 2994: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_234:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 3007: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde42060  ! 3008: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe461a5  ! 3013: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_137:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_235:
	setx	0x360211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46103  ! 3023: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e48000  ! 3024: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_138:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_236:
	setx	0x350235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bdc000  ! 3029: XNORcc_R	xnorcc 	%r23, %r0, %r24
cpu_intr_0_237:
	setx	0x350305, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_139:
	mov	0xc, %r14
	.word 0xfadb89e0  ! 3031: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9e54000  ! 3033: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde460ff  ! 3034: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_238:
	setx	0x370026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 3040: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e461f3  ! 3044: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_144:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 3046: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbde58000  ! 3047: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_239:
	setx	0x350317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_240:
	setx	0x34022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 3055: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_140:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3057: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e42027  ! 3059: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_241:
	setx	0x36010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde5e0b7  ! 3063: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 15)
	.word 0xb7e54000  ! 3067: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe54000  ! 3068: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe421c9  ! 3071: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xba3460a1  ! 3073: ORN_I	orn 	%r17, 0x00a1, %r29
	.word 0xbde5e120  ! 3074: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_145:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 3078: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_146:
	mov	0x2, %r14
	.word 0xf6f38e80  ! 3081: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_242:
	setx	0x37021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe420ca  ! 3093: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_141:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_147:
	mov	0x30, %r14
	.word 0xf8f389e0  ! 3098: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe5e168  ! 3106: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_243:
	setx	0x340005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1de  ! 3111: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 14)
	.word 0xb5e5c000  ! 3118: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_244:
	setx	0x340036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_245:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e58000  ! 3125: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe58000  ! 3126: SAVE_R	save	%r22, %r0, %r29
	.word 0xbde44000  ! 3127: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_246:
	setx	0x340238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 29)
	.word 0xbde54000  ! 3130: SAVE_R	save	%r21, %r0, %r30
	.word 0xba1d2057  ! 3134: XOR_I	xor 	%r20, 0x0057, %r29
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_142:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 3140: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_247:
	setx	0x36033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_143:
	mov	0xd, %r14
	.word 0xf2db89e0  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde461dd  ! 3145: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5e1bb  ! 3149: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_148:
	mov	0x1, %r14
	.word 0xfef38e40  ! 3150: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_248:
	setx	0x350316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_249:
	setx	0x350238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e4e1b9  ! 3159: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 3164: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_250:
	setx	0x340333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_251:
	setx	0x34021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_252:
	setx	0x36031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_253:
	setx	0x340003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 3175: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_254:
	setx	0x37011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0e2  ! 3177: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_255:
	setx	0x34012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 29)
	.word 0xb1e58000  ! 3184: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e520ff  ! 3186: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_256:
	setx	0x36031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3189: SAVE_R	save	%r23, %r0, %r27
	.word 0xb3e4e088  ! 3191: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_145:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 3192: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe54000  ! 3195: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_146:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, e)
	.word 0xbde4e1eb  ! 3204: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_257:
	setx	0x34030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_149:
	mov	0x1f, %r14
	.word 0xfcf38400  ! 3206: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_150:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3207: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_151:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 3211: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3e50000  ! 3214: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e54000  ! 3215: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e48000  ! 3223: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_147:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 3224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb9e40000  ! 3230: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe4e14a  ! 3231: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_148:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a0ea  ! 3236: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe5e124  ! 3244: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_258:
	setx	0x380118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_149:
	mov	0x26, %r14
	.word 0xfadb8400  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e58000  ! 3253: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_152:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 3254: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_259:
	setx	0x390110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba340000  ! 3257: ORN_R	orn 	%r16, %r0, %r29
	.word 0xbfe5e1dd  ! 3261: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde5c000  ! 3264: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_260:
	setx	0x3b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_261:
	setx	0x390204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 3274: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_262:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_263:
	setx	0x38033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x3a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3287: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e58000  ! 3291: SAVE_R	save	%r22, %r0, %r28
	.word 0xb5e521f6  ! 3294: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe4e048  ! 3296: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_150:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_151:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 10)
	.word 0xb92c6001  ! 3303: SLL_I	sll 	%r17, 0x0001, %r28
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe58000  ! 3312: SAVE_R	save	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_265:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_152:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 3319: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_266:
	setx	0x380208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0358000  ! 3325: SUBC_R	orn 	%r22, %r0, %r24
cpu_intr_0_267:
	setx	0x39032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0cf  ! 3328: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_268:
	setx	0x380330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 3335: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_153:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e48000  ! 3340: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_154:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e50000  ! 3349: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_269:
	setx	0x3a0302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_270:
	setx	0x380203, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_156:
	mov	0x14, %r14
	.word 0xfcdb89e0  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_153:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 3368: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfe52065  ! 3372: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_154:
	mov	0x24, %r14
	.word 0xfaf384a0  ! 3375: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb12cb001  ! 3376: SLLX_I	sllx	%r18, 0x0001, %r24
	.word 0xb645e067  ! 3377: ADDC_I	addc 	%r23, 0x0067, %r27
T0_asi_reg_rd_157:
	mov	0x17, %r14
	.word 0xfedb8e40  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e40000  ! 3385: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e40000  ! 3391: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_271:
	setx	0x38021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56157  ! 3394: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_272:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_158:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_155:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3403: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1e48000  ! 3404: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_156:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 3405: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe42182  ! 3407: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e44000  ! 3408: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_273:
	setx	0x390003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 3413: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_274:
	setx	0x3b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 3418: SAVE_R	save	%r22, %r0, %r25
	.word 0xbde5c000  ! 3419: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_275:
	setx	0x3b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 3421: RDPR_PIL	<illegal instruction>
	.word 0xbe0ce024  ! 3423: AND_I	and 	%r19, 0x0024, %r31
cpu_intr_0_276:
	setx	0x3a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_277:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 3434: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_rd_159:
	mov	0x5, %r14
	.word 0xfadb8e60  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e5e0b2  ! 3441: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb83520fb  ! 3443: SUBC_I	orn 	%r20, 0x00fb, %r28
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_278:
	setx	0x390211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_279:
	setx	0x38013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e5e1e4  ! 3461: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbd2d5000  ! 3462: SLLX_R	sllx	%r21, %r0, %r30
cpu_intr_0_280:
	setx	0x390015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5204a  ! 3469: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_281:
	setx	0x3a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 3475: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e58000  ! 3478: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_157:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 3479: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e58000  ! 3480: SAVE_R	save	%r22, %r0, %r24
	.word 0xbbe54000  ! 3482: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 34)
	.word 0xbde560d4  ! 3490: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe50000  ! 3493: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_161:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb48de1bc  ! 3496: ANDcc_I	andcc 	%r23, 0x01bc, %r26
cpu_intr_0_282:
	setx	0x3a021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a168  ! 3498: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_283:
	setx	0x3a031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_162:
	mov	0x28, %r14
	.word 0xfcdb8e40  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e48000  ! 3504: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_284:
	setx	0x3b030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_163:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 3510: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_rd_164:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_285:
	setx	0x3a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_165:
	mov	0x36, %r14
	.word 0xf2db8e80  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_wr_158:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 3522: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe50000  ! 3523: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3343001  ! 3525: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xbde42029  ! 3526: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5a0f4  ! 3527: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e54000  ! 3532: SAVE_R	save	%r21, %r0, %r27
	.word 0xb60d21f3  ! 3533: AND_I	and 	%r20, 0x01f3, %r27
T0_asi_reg_rd_166:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e48000  ! 3538: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_159:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3539: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 23)
	.word 0xbde5c000  ! 3549: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_286:
	setx	0x390224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_160:
	mov	0x36, %r14
	.word 0xf8f389e0  ! 3551: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_167:
	mov	0x1d, %r14
	.word 0xf0db8e40  ! 3554: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_161:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 3556: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e4e07c  ! 3559: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe48000  ! 3561: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_168:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 3562: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3e4a19b  ! 3567: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 19)
	.word 0xbbe420e4  ! 3571: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_287:
	setx	0x390030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a5e028  ! 3573: SUBcc_I	subcc 	%r23, 0x0028, %r26
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb1e50000  ! 3580: SAVE_R	save	%r20, %r0, %r24
	.word 0xb3e50000  ! 3581: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_162:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 3588: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_288:
	setx	0x380007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_289:
	setx	0x390027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_290:
	setx	0x3b0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a106  ! 3597: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e48000  ! 3598: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e54000  ! 3600: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e54000  ! 3602: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_163:
	mov	0x1f, %r14
	.word 0xfef38e60  ! 3604: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 8)
	.word 0xbfe5e1a5  ! 3609: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe48000  ! 3612: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde56118  ! 3613: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1346001  ! 3614: SRL_I	srl 	%r17, 0x0001, %r24
	.word 0xbfe42179  ! 3616: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e5211a  ! 3621: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 23)
	.word 0xb1e5e11a  ! 3627: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_291:
	setx	0x3a0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_164:
	mov	0x8, %r14
	.word 0xf4f38e40  ! 3633: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 14)
	.word 0xbe2c0000  ! 3643: ANDN_R	andn 	%r16, %r0, %r31
	.word 0xbfe5a0de  ! 3644: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e5c000  ! 3645: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_292:
	setx	0x3a013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83c0000  ! 3648: XNOR_R	xnor 	%r16, %r0, %r28
T0_asi_reg_rd_169:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_165:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 3650: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 32)
	.word 0xb1e461e6  ! 3652: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e40000  ! 3655: SAVE_R	save	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_293:
	setx	0x390118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 3666: RDPR_PSTATE	<illegal instruction>
cpu_intr_0_294:
	setx	0x390222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42016  ! 3669: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe520d6  ! 3673: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde46173  ! 3675: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe58000  ! 3680: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_170:
	mov	0x24, %r14
	.word 0xfadb8400  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3e461e8  ! 3683: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e56057  ! 3684: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_171:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfe48000  ! 3687: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_295:
	setx	0x380306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_166:
	mov	0x16, %r14
	.word 0xfaf389e0  ! 3693: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5e4e039  ! 3697: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e5a143  ! 3698: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_167:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 3702: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbf3db001  ! 3704: SRAX_I	srax	%r22, 0x0001, %r31
	.word 0xb9e5e18f  ! 3706: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbfe4a10d  ! 3708: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_296:
	setx	0x3e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_297:
	setx	0x3d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_168:
	mov	0x8, %r14
	.word 0xf8f38e80  ! 3714: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_172:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e4a12e  ! 3717: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_298:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a13d  ! 3721: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e421cf  ! 3722: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_169:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 3723: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_299:
	setx	0x3e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_173:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_rd_174:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe4e129  ! 3732: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xba258000  ! 3739: SUB_R	sub 	%r22, %r0, %r29
T0_asi_reg_rd_175:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 3740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x83942170  ! 3741: WRPR_TNPC_I	wrpr	%r16, 0x0170, %tnpc
cpu_intr_0_300:
	setx	0x3f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3747: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e5e07b  ! 3750: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_176:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_177:
	mov	0x28, %r14
	.word 0xf6db8e40  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_178:
	mov	0xa, %r14
	.word 0xfcdb89e0  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb52d5000  ! 3759: SLLX_R	sllx	%r21, %r0, %r26
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_301:
	setx	0x3f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 3765: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 29)
	.word 0xb09c60ec  ! 3768: XORcc_I	xorcc 	%r17, 0x00ec, %r24
	.word 0xbde4c000  ! 3769: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_170:
	mov	0xa, %r14
	.word 0xfaf389e0  ! 3770: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb8a5c000  ! 3771: SUBcc_R	subcc 	%r23, %r0, %r28
T0_asi_reg_rd_179:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 3772: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_302:
	setx	0x3e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e5e16a  ! 3783: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_171:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 3789: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_303:
	setx	0x3c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 3791: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5643801  ! 3795: MOVcc_I	<illegal instruction>
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_304:
	setx	0x3f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3807: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_180:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_305:
	setx	0x3f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_306:
	setx	0x3e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_181:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde50000  ! 3817: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_182:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3e561bc  ! 3819: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_183:
	mov	0x16, %r14
	.word 0xfadb84a0  ! 3824: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7e460c0  ! 3826: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb04420c2  ! 3827: ADDC_I	addc 	%r16, 0x00c2, %r24
	.word 0xbbe461d1  ! 3828: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_307:
	setx	0x3c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 3830: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e4e0e4  ! 3833: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4c000  ! 3834: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbde4217d  ! 3837: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb0848000  ! 3838: ADDcc_R	addcc 	%r18, %r0, %r24
	.word 0xbbe5e03e  ! 3840: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_308:
	setx	0x10105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_309:
	setx	0x3d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_310:
	setx	0x3c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1ec  ! 3853: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_184:
	mov	0x1c, %r14
	.word 0xf6db8400  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_185:
	mov	0x0, %r14
	.word 0xf4db8e80  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_186:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_187:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e460f9  ! 3865: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e4e04d  ! 3866: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_188:
	mov	0x25, %r14
	.word 0xf6db89e0  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0bc4000  ! 3873: XNORcc_R	xnorcc 	%r17, %r0, %r24
T0_asi_reg_rd_189:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1e5e1cb  ! 3875: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e44000  ! 3876: SAVE_R	save	%r17, %r0, %r26
	.word 0xb5e5c000  ! 3878: SAVE_R	save	%r23, %r0, %r26
	.word 0xb7643801  ! 3888: MOVcc_I	<illegal instruction>
	.word 0xbde4c000  ! 3889: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_172:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 3896: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_311:
	setx	0x3c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_312:
	setx	0x3d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e561c5  ! 3901: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_190:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 3902: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e420a0  ! 3903: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde40000  ! 3908: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_313:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_314:
	setx	0x3c0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_173:
	mov	0x15, %r14
	.word 0xfef38e40  ! 3913: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde52162  ! 3915: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e50000  ! 3916: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe44000  ! 3922: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_315:
	setx	0x3d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_316:
	setx	0x3e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_317:
	setx	0x3c0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e420a3  ! 3927: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_191:
	mov	0x34, %r14
	.word 0xf2db8400  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb80ca0df  ! 3929: AND_I	and 	%r18, 0x00df, %r28
T0_asi_reg_wr_174:
	mov	0x13, %r14
	.word 0xfef38e80  ! 3931: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_318:
	setx	0x3d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_192:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 3937: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_175:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 3939: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5e4e117  ! 3940: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e460f2  ! 3945: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e58000  ! 3946: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe52077  ! 3947: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e54000  ! 3952: SAVE_R	save	%r21, %r0, %r28
	.word 0xb5e44000  ! 3955: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_193:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_176:
	mov	0x28, %r14
	.word 0xf8f38e40  ! 3959: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_319:
	setx	0x3c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_177:
	mov	0x26, %r14
	.word 0xf2f38e60  ! 3963: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_194:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbde4a175  ! 3971: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe4e158  ! 3973: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8d95e139  ! 3974: WRPR_PSTATE_I	wrpr	%r23, 0x0139, %pstate
cpu_intr_0_320:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_321:
	setx	0x3f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_195:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 3982: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba3d60a3  ! 3985: XNOR_I	xnor 	%r21, 0x00a3, %r29
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 3b)
	.word 0xba1d0000  ! 3997: XOR_R	xor 	%r20, %r0, %r29
T0_asi_reg_rd_196:
	mov	0x4, %r14
	.word 0xf8db8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb00d6027  ! 4000: AND_I	and 	%r21, 0x0027, %r24
	.word 0xbeadc000  ! 4001: ANDNcc_R	andncc 	%r23, %r0, %r31
	.word 0xbc1da05a  ! 4002: XOR_I	xor 	%r22, 0x005a, %r30
	.word 0xb9e50000  ! 4003: SAVE_R	save	%r20, %r0, %r28
	.word 0xbf34e001  ! 4005: SRL_I	srl 	%r19, 0x0001, %r31
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbbe4e07a  ! 4012: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde4a086  ! 4013: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_178:
	mov	0x17, %r14
	.word 0xfaf38400  ! 4015: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb32d4000  ! 4016: SLL_R	sll 	%r21, %r0, %r25
T0_asi_reg_rd_198:
	mov	0xc, %r14
	.word 0xf8db8e80  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfe5a0b9  ! 4019: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_199:
	mov	0x17, %r14
	.word 0xf4db8e80  ! 4021: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e5e129  ! 4022: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5e079  ! 4023: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e50000  ! 4025: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_200:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_322:
	setx	0x3e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_201:
	mov	0x20, %r14
	.word 0xfadb89e0  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 4035: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e5e0d1  ! 4042: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4e131  ! 4050: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e4613a  ! 4051: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_323:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 4060: SAVE_R	save	%r16, %r0, %r26
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
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_202:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_180:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 4075: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfe5c000  ! 4078: SAVE_R	save	%r23, %r0, %r31
	.word 0xbfe560de  ! 4079: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe58000  ! 4085: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_324:
	setx	0x3c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1ec  ! 4092: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_181:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 4093: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_182:
	mov	0x33, %r14
	.word 0xfcf38e60  ! 4095: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_203:
	mov	0x27, %r14
	.word 0xf8db84a0  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_325:
	setx	0x3d0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba34e17a  ! 4098: SUBC_I	orn 	%r19, 0x017a, %r29
T0_asi_reg_wr_183:
	mov	0x2e, %r14
	.word 0xfef389e0  ! 4100: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, f)
	.word 0xbde5e03c  ! 4103: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb8b44000  ! 4105: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0xbfe50000  ! 4106: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe5615d  ! 4107: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_326:
	setx	0x3e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_204:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfe5e17f  ! 4111: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_327:
	setx	0x3f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4113: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_328:
	setx	0x3f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421a1  ! 4115: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_184:
	mov	0x10, %r14
	.word 0xf0f389e0  ! 4118: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_329:
	setx	0x420232, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_185:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4120: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 34)
	.word 0xb2c48000  ! 4123: ADDCcc_R	addccc 	%r18, %r0, %r25
	.word 0xb0bc6162  ! 4124: XNORcc_I	xnorcc 	%r17, 0x0162, %r24
	.word 0xbde58000  ! 4125: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_205:
	mov	0x2b, %r14
	.word 0xfadb8400  ! 4126: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb0a5c000  ! 4127: SUBcc_R	subcc 	%r23, %r0, %r24
	.word 0xbbe560f1  ! 4136: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe44000  ! 4138: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_330:
	setx	0x400034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 4141: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_331:
	setx	0x40033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_206:
	mov	0x2b, %r14
	.word 0xf8db84a0  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_207:
	mov	0x26, %r14
	.word 0xf4db84a0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_208:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_332:
	setx	0x420113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_333:
	setx	0x420227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52073  ! 4158: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_209:
	mov	0x2b, %r14
	.word 0xfedb89e0  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfe5e06a  ! 4161: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e52002  ! 4162: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4e0be  ! 4163: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e5e1de  ! 4164: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_334:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 4175: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e5218a  ! 4176: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_186:
	mov	0x25, %r14
	.word 0xf4f384a0  ! 4178: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb0350000  ! 4186: SUBC_R	orn 	%r20, %r0, %r24
	.word 0xbde44000  ! 4187: SAVE_R	save	%r17, %r0, %r30
	.word 0xb72cd000  ! 4188: SLLX_R	sllx	%r19, %r0, %r27
T0_asi_reg_rd_210:
	mov	0x21, %r14
	.word 0xf6db84a0  ! 4189: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_211:
	mov	0xc, %r14
	.word 0xfadb89e0  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb5e4616f  ! 4202: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_212:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 4208: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde560b7  ! 4210: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbe05e0cf  ! 4211: ADD_I	add 	%r23, 0x00cf, %r31
T0_asi_reg_wr_187:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 4213: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_213:
	mov	0x24, %r14
	.word 0xfcdb8e80  ! 4215: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb7e521c4  ! 4216: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e4e01a  ! 4217: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_188:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4221: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 31)
	.word 0xb9e56178  ! 4224: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe56026  ! 4226: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_189:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 4229: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e50000  ! 4230: SAVE_R	save	%r20, %r0, %r24
	.word 0xbde58000  ! 4231: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe5c000  ! 4232: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_190:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 4239: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9e40000  ! 4246: SAVE_R	save	%r16, %r0, %r28
	.word 0xb5e50000  ! 4248: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_214:
	mov	0x13, %r14
	.word 0xfedb8e80  ! 4251: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfe4a1a6  ! 4252: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_335:
	setx	0x430319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 4259: SAVE_R	save	%r18, %r0, %r26
	.word 0xbbe44000  ! 4261: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_336:
	setx	0x40000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520b7  ! 4264: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_337:
	setx	0x42010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_338:
	setx	0x420231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_191:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 4274: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e461e2  ! 4277: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe58000  ! 4280: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde421de  ! 4282: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_192:
	mov	0x7, %r14
	.word 0xf4f389e0  ! 4289: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e42069  ! 4295: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb4bd0000  ! 4299: XNORcc_R	xnorcc 	%r20, %r0, %r26
T0_asi_reg_wr_193:
	mov	0x2a, %r14
	.word 0xf2f38400  ! 4301: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_215:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e4a103  ! 4308: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_194:
	mov	0x6, %r14
	.word 0xf8f38400  ! 4309: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_339:
	setx	0x420238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x40022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8444000  ! 4314: ADDC_R	addc 	%r17, %r0, %r28
cpu_intr_0_341:
	setx	0x430031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_216:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xba34a095  ! 4317: ORN_I	orn 	%r18, 0x0095, %r29
	.word 0xb9480000  ! 4318: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb3e5c000  ! 4319: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e4c000  ! 4320: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e50000  ! 4323: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbde58000  ! 4327: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_342:
	setx	0x41033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e58000  ! 4333: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e5a009  ! 4334: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_343:
	setx	0x420226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1e6  ! 4337: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e58000  ! 4341: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3641800  ! 4342: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_195:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 4345: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbde4e0a8  ! 4348: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_344:
	setx	0x400206, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_217:
	mov	0x36, %r14
	.word 0xf2db84a0  ! 4351: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_wr_196:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4353: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbfe4e1ff  ! 4355: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_218:
	mov	0x26, %r14
	.word 0xf2db8e80  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba8d8000  ! 4359: ANDcc_R	andcc 	%r22, %r0, %r29
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde561f1  ! 4369: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e54000  ! 4372: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e5a11d  ! 4373: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_197:
	mov	0x4, %r14
	.word 0xfaf38400  ! 4376: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_219:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_220:
	mov	0x26, %r14
	.word 0xfedb89e0  ! 4380: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_221:
	mov	0x33, %r14
	.word 0xf8db8400  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfe58000  ! 4382: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_345:
	setx	0x430312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_346:
	setx	0x420216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9cc000  ! 4387: XORcc_R	xorcc 	%r19, %r0, %r29
	.word 0xb9e5c000  ! 4388: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_222:
	mov	0x17, %r14
	.word 0xf8db8e60  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_rd_223:
	mov	0x33, %r14
	.word 0xf0db8e60  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_347:
	setx	0x420223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_348:
	setx	0x410312, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_198:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 4396: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_349:
	setx	0x430328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x400300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_351:
	setx	0x410027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_352:
	setx	0x400130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 4406: SAVE_R	save	%r18, %r0, %r26
	.word 0xbe344000  ! 4407: ORN_R	orn 	%r17, %r0, %r31
	.word 0xb61ca08c  ! 4408: XOR_I	xor 	%r18, 0x008c, %r27
	.word 0xbbe5e141  ! 4409: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_353:
	setx	0x420127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4413: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_354:
	setx	0x420237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_199:
	mov	0x4, %r14
	.word 0xf0f389e0  ! 4416: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_200:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 4418: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_224:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe4600a  ! 4420: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5a158  ! 4421: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbc9cc000  ! 4423: XORcc_R	xorcc 	%r19, %r0, %r30
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, e)
	.word 0xb5e54000  ! 4426: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e58000  ! 4427: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_355:
	setx	0x430314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46009  ! 4431: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_356:
	setx	0x410120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 4435: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_357:
	setx	0x400321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 4442: SAVE_R	save	%r17, %r0, %r27
	.word 0xb8852103  ! 4443: ADDcc_I	addcc 	%r20, 0x0103, %r28
	.word 0xb5e5c000  ! 4445: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_358:
	setx	0x41011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e460ca  ! 4449: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_359:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 4452: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_225:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_201:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 4454: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_360:
	setx	0x420126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_226:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 4460: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e46002  ! 4461: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde5a079  ! 4462: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e42177  ! 4463: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe48000  ! 4465: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_202:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 4467: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbe0d2008  ! 4468: AND_I	and 	%r20, 0x0008, %r31
	.word 0xb1e48000  ! 4470: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, d)
	.word 0xb9e44000  ! 4472: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e54000  ! 4473: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_361:
	setx	0x43031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0fc  ! 4480: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5a0d9  ! 4483: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_227:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb9e54000  ! 4486: SAVE_R	save	%r21, %r0, %r28
	.word 0xb8854000  ! 4491: ADDcc_R	addcc 	%r21, %r0, %r28
cpu_intr_0_362:
	setx	0x410207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e042  ! 4493: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe48000  ! 4495: SAVE_R	save	%r18, %r0, %r29
	.word 0xb52c4000  ! 4496: SLL_R	sll 	%r17, %r0, %r26
cpu_intr_0_363:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_228:
	mov	0x18, %r14
	.word 0xf4db8400  ! 4500: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_229:
	mov	0xf, %r14
	.word 0xf6db8e60  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb88ce14e  ! 4505: ANDcc_I	andcc 	%r19, 0x014e, %r28
	.word 0xb9e5c000  ! 4506: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_364:
	setx	0x430323, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_203:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 4510: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb73c5000  ! 4512: SRAX_R	srax	%r17, %r0, %r27
T0_asi_reg_rd_230:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e54000  ! 4518: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e5c000  ! 4521: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_204:
	mov	0x1e, %r14
	.word 0xf6f38400  ! 4523: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1e5a161  ! 4526: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_365:
	setx	0x420234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_366:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_231:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 5)
	.word 0xb5e5c000  ! 4550: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e5a05a  ! 4554: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe48000  ! 4558: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_367:
	setx	0x40003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 4561: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_368:
	setx	0x400320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 4566: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde5e191  ! 4567: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_369:
	setx	0x420008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0c1  ! 4571: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e40000  ! 4573: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e56067  ! 4578: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_205:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 4580: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, c)
	.word 0xbd3da001  ! 4582: SRA_I	sra 	%r22, 0x0001, %r30
T0_asi_reg_wr_206:
	mov	0x1d, %r14
	.word 0xf6f38e80  ! 4583: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_207:
	mov	0x16, %r14
	.word 0xf2f38400  ! 4584: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_370:
	setx	0x44032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1fa  ! 4589: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_208:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 4592: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_209:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 4597: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5e58000  ! 4598: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_232:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_371:
	setx	0x440028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_372:
	setx	0x450301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_233:
	mov	0x10, %r14
	.word 0xfcdb89e0  ! 4618: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_373:
	setx	0x470104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e44000  ! 4624: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_374:
	setx	0x450006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00da101  ! 4628: AND_I	and 	%r22, 0x0101, %r24
	.word 0xb7e5e1d6  ! 4629: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_210:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 4632: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7e52139  ! 4637: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_375:
	setx	0x46032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_234:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_211:
	mov	0x3, %r14
	.word 0xf4f38e40  ! 4645: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e44000  ! 4646: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_212:
	mov	0x30, %r14
	.word 0xfaf389e0  ! 4648: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 13)
	.word 0xbcb48000  ! 4652: ORNcc_R	orncc 	%r18, %r0, %r30
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 11)
	.word 0xb83cc000  ! 4656: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xb3e5a13d  ! 4661: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb73cf001  ! 4662: SRAX_I	srax	%r19, 0x0001, %r27
cpu_intr_0_376:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_377:
	setx	0x450007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d0400  ! 4667: MOVR_R	movre	%r20, %r0, %r28
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 27)
	.word 0xb3e48000  ! 4670: SAVE_R	save	%r18, %r0, %r25
	.word 0xb3e58000  ! 4672: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_213:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 4674: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 20)
	.word 0xb13c0000  ! 4679: SRA_R	sra 	%r16, %r0, %r24
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_235:
	mov	0x1d, %r14
	.word 0xf2db8400  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 21)
	.word 0xb3e5a1de  ! 4691: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5c000  ! 4693: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, a)
	.word 0xb3e42107  ! 4697: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_214:
	mov	0x26, %r14
	.word 0xf2f389e0  ! 4699: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8b56057  ! 4704: SUBCcc_I	orncc 	%r21, 0x0057, %r28
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 20)
	.word 0xbbe420d5  ! 4707: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 20)
	.word 0xbd356001  ! 4710: SRL_I	srl 	%r21, 0x0001, %r30
	.word 0xb5e44000  ! 4712: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e46153  ! 4713: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_236:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 4716: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb9e5a00d  ! 4717: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_378:
	setx	0x460302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e42070  ! 4724: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_237:
	mov	0x19, %r14
	.word 0xfcdb89e0  ! 4725: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_379:
	setx	0x470205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e18a  ! 4730: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_215:
	mov	0x7, %r14
	.word 0xfcf389e0  ! 4736: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1e4a07a  ! 4738: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_216:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4742: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_wr_217:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4745: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_238:
	mov	0x2c, %r14
	.word 0xf4db8e80  ! 4748: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_380:
	setx	0x44010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e15f  ! 4759: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e5e0e9  ! 4760: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e5a00f  ! 4761: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_239:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 4764: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_218:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 4767: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_381:
	setx	0x470123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_382:
	setx	0x45011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5600d  ! 4774: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, c)
	.word 0xbde46198  ! 4782: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_240:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 4792: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbde40000  ! 4795: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_219:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 4802: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_383:
	setx	0x44012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a076  ! 4804: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e58000  ! 4805: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e5e0bb  ! 4807: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_384:
	setx	0x47021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4815: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_385:
	setx	0x46023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e03d  ! 4823: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_241:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 4825: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb6ad0000  ! 4826: ANDNcc_R	andncc 	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_242:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4828: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7e58000  ! 4829: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_386:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_220:
	mov	0x21, %r14
	.word 0xf2f38e80  ! 4833: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5e54000  ! 4834: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_387:
	setx	0x47031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 4841: SAVE_R	save	%r18, %r0, %r24
	.word 0xb134d000  ! 4842: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xbbe5a126  ! 4844: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_221:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 4846: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e461d0  ! 4854: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_388:
	setx	0x45020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_389:
	setx	0x460110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde521f0  ! 4866: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5202c  ! 4868: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4c000  ! 4869: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_243:
	mov	0x3c0, %r14
	.word 0xfedb89e0  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3e48000  ! 4875: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde4a01f  ! 4876: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_390:
	setx	0x45023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21c8000  ! 4879: XOR_R	xor 	%r18, %r0, %r25
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 30)
	.word 0xbd354000  ! 4882: SRL_R	srl 	%r21, %r0, %r30
	.word 0xbfe520eb  ! 4883: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e520a1  ! 4887: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xba3c2142  ! 4889: XNOR_I	xnor 	%r16, 0x0142, %r29
cpu_intr_0_391:
	setx	0x44031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72cb001  ! 4891: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xb7e5e143  ! 4897: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5a067  ! 4902: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_222:
	mov	0x38, %r14
	.word 0xf0f389e0  ! 4905: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbca54000  ! 4906: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xb17c2401  ! 4907: MOVR_I	movre	%r16, 0x1, %r24
cpu_intr_0_392:
	setx	0x47000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_406:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_406), 16, 16)) -> intp(0, 0, d)
iob_intr_0_407:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_407), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_244:
	mov	0x19, %r14
	.word 0xf6db8e80  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_wr_223:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 4914: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_393:
	setx	0x450315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4918: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_394:
	setx	0x45013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8da0d3  ! 4922: ANDcc_I	andcc 	%r22, 0x00d3, %r30
cpu_intr_0_395:
	setx	0x450113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_408:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_408), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde5e1f2  ! 4928: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde5c000  ! 4930: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_396:
	setx	0x450228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_409:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_409), 16, 16)) -> intp(0, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_245:
	mov	0x2e, %r14
	.word 0xf4db89e0  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbf641800  ! 4938: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_246:
	mov	0x1, %r14
	.word 0xfcdb8e80  ! 4941: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_410:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_410), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde58000  ! 4948: SAVE_R	save	%r22, %r0, %r30
	.word 0xb5e4c000  ! 4949: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_397:
	setx	0x450035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0c0  ! 4956: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4c000  ! 4957: SAVE_R	save	%r19, %r0, %r24
	.word 0xbe048000  ! 4959: ADD_R	add 	%r18, %r0, %r31
cpu_intr_0_398:
	setx	0x470304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 4961: RDPR_PIL	<illegal instruction>
	.word 0xb0aca05b  ! 4963: ANDNcc_I	andncc 	%r18, 0x005b, %r24
	.word 0xbbe40000  ! 4964: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_247:
	mov	0x30, %r14
	.word 0xfadb89e0  ! 4971: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_224:
	mov	0x28, %r14
	.word 0xf6f38e60  ! 4972: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde50000  ! 4973: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_225:
	mov	0x13, %r14
	.word 0xf6f38e60  ! 4978: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbcb4a01f  ! 4979: SUBCcc_I	orncc 	%r18, 0x001f, %r30
	.word 0xbd3dd000  ! 4980: SRAX_R	srax	%r23, %r0, %r30
iob_intr_0_411:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_411), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e50000  ! 4986: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde44000  ! 4987: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_226:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 4988: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_412:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_412), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe460fe  ! 4992: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_227:
	mov	0x14, %r14
	.word 0xfaf38400  ! 4994: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb6a4c000  ! 4995: SUBcc_R	subcc 	%r19, %r0, %r27
cpu_intr_0_399:
	setx	0x460324, %g1, %o0
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
T3_asi_reg_rd_0:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 2: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_0:
	setx	0x1c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5e16d  ! 8: STWA_I	stwa	%r25, [%r23 + 0x016d] %asi
T3_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2ad6078  ! 10: STBA_I	stba	%r25, [%r21 + 0x0078] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_1:
	setx	0x1d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_2:
	setx	0x1f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
cpu_intr_3_3:
	setx	0x1e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_0:
	mov	0x15, %r14
	.word 0xf0f38e40  ! 17: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf62da0b8  ! 18: STB_I	stb	%r27, [%r22 + 0x00b8]
	.word 0xf22c8000  ! 20: STB_R	stb	%r25, [%r18 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 24)
	.word 0xf22de018  ! 26: STB_I	stb	%r25, [%r23 + 0x0018]
cpu_intr_3_4:
	setx	0x1f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_5:
	setx	0x1f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_6:
	setx	0x1d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d2062  ! 35: STB_I	stb	%r29, [%r20 + 0x0062]
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 25)
	.word 0xfe750000  ! 38: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf6a521fd  ! 40: STWA_I	stwa	%r27, [%r20 + 0x01fd] %asi
cpu_intr_3_7:
	setx	0x1f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_8:
	setx	0x1e011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad8020  ! 43: STBA_R	stba	%r24, [%r22 + %r0] 0x01
cpu_intr_3_9:
	setx	0x1f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_10:
	setx	0x1d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c1000  ! 50: SRAX_R	srax	%r16, %r0, %r26
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_1:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 55: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2244000  ! 59: STW_R	stw	%r25, [%r17 + %r0]
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_11:
	setx	0x1f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_2:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf4a54020  ! 70: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
	.word 0xfc244000  ! 73: STW_R	stw	%r30, [%r17 + %r0]
cpu_intr_3_12:
	setx	0x1c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75e1cd  ! 81: STX_I	stx	%r29, [%r23 + 0x01cd]
T3_asi_reg_wr_2:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 82: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbebd2023  ! 83: XNORcc_I	xnorcc 	%r20, 0x0023, %r31
	.word 0xfef4e1fd  ! 84: STXA_I	stxa	%r31, [%r19 + 0x01fd] %asi
T3_asi_reg_rd_3:
	mov	0x0, %r14
	.word 0xfadb8e60  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_13:
	setx	0x1d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 91: MOVcc_R	<illegal instruction>
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 28)
	.word 0xb82d8000  ! 106: ANDN_R	andn 	%r22, %r0, %r28
T3_asi_reg_wr_3:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 108: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 7)
	ta	T_CHANGE_HPRIV
	.word 0xf474c000  ! 111: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfa252168  ! 112: STW_I	stw	%r29, [%r20 + 0x0168]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_4:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 118: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_14:
	setx	0x1e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a168  ! 121: STHA_I	stha	%r25, [%r18 + 0x0168] %asi
cpu_intr_3_15:
	setx	0x1e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35e09a  ! 124: STH_I	sth	%r30, [%r23 + 0x009a]
	.word 0xf2250000  ! 127: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xbaa50000  ! 129: SUBcc_R	subcc 	%r20, %r0, %r29
T3_asi_reg_wr_4:
	mov	0x9, %r14
	.word 0xf0f38e60  ! 131: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_16:
	setx	0x1e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b56127  ! 135: STHA_I	stha	%r26, [%r21 + 0x0127] %asi
	.word 0xb8b48000  ! 137: ORNcc_R	orncc 	%r18, %r0, %r28
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_17:
	setx	0x1d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4e109  ! 141: STWA_I	stwa	%r29, [%r19 + 0x0109] %asi
	.word 0xf6ada192  ! 143: STBA_I	stba	%r27, [%r22 + 0x0192] %asi
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf02de1c7  ! 148: STB_I	stb	%r24, [%r23 + 0x01c7]
	.word 0xbcbd8000  ! 151: XNORcc_R	xnorcc 	%r22, %r0, %r30
	.word 0xf624e1ea  ! 152: STW_I	stw	%r27, [%r19 + 0x01ea]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2ac0020  ! 155: STBA_R	stba	%r25, [%r16 + %r0] 0x01
cpu_intr_3_18:
	setx	0x1c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5e063  ! 159: STHA_I	stha	%r26, [%r23 + 0x0063] %asi
cpu_intr_3_20:
	setx	0x1c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a44020  ! 161: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_5:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 165: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb0940000  ! 166: ORcc_R	orcc 	%r16, %r0, %r24
T3_asi_reg_rd_6:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 168: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8a48020  ! 180: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819839d0  ! 181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
	.word 0xf875c000  ! 182: STX_R	stx	%r28, [%r23 + %r0]
T3_asi_reg_rd_7:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfa740000  ! 187: STX_R	stx	%r29, [%r16 + %r0]
T3_asi_reg_rd_8:
	mov	0x3, %r14
	.word 0xf2db8400  ! 188: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_rd_9:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8242111  ! 191: STW_I	stw	%r28, [%r16 + 0x0111]
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982cca  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
	.word 0xfeada0d6  ! 193: STBA_I	stba	%r31, [%r22 + 0x00d6] %asi
	.word 0xfa354000  ! 195: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 197: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6a40020  ! 198: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
	.word 0xf4348000  ! 203: STH_R	sth	%r26, [%r18 + %r0]
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 17)
	.word 0xf874c000  ! 207: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xbd2d4000  ! 210: SLL_R	sll 	%r21, %r0, %r30
T3_asi_reg_rd_10:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_21:
	setx	0x1f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_11:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_22:
	setx	0x1c0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb35a001  ! 228: SRL_I	srl 	%r22, 0x0001, %r29
T3_asi_reg_rd_12:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 231: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_13:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6a4a069  ! 240: STWA_I	stwa	%r27, [%r18 + 0x0069] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfcb5c020  ! 243: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0x9195a14c  ! 245: WRPR_PIL_I	wrpr	%r22, 0x014c, %pil
cpu_intr_3_23:
	setx	0x1d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_14:
	mov	0x1d, %r14
	.word 0xfcdb8400  ! 249: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_24:
	setx	0x1c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4940000  ! 256: ORcc_R	orcc 	%r16, %r0, %r26
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 32)
	.word 0xa1902000  ! 260: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_3_25:
	setx	0x1e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_6:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 264: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_15:
	mov	0xe, %r14
	.word 0xfcdb8e80  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb9643801  ! 273: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xf6244000  ! 276: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf2b4a0ff  ! 278: STHA_I	stha	%r25, [%r18 + 0x00ff] %asi
	.word 0xb4a58000  ! 281: SUBcc_R	subcc 	%r22, %r0, %r26
	.word 0xf63421d7  ! 285: STH_I	sth	%r27, [%r16 + 0x01d7]
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_7:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 290: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbe05e0c1  ! 292: ADD_I	add 	%r23, 0x00c1, %r31
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 35)
	.word 0xfaa44020  ! 294: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_8:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 300: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198385a  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185a, %hpstate
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983802  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1802, %hpstate
	.word 0xfc2c606b  ! 306: STB_I	stb	%r30, [%r17 + 0x006b]
cpu_intr_3_26:
	setx	0x1f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4201a  ! 310: STHA_I	stha	%r27, [%r16 + 0x001a] %asi
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_27:
	setx	0x1c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_9:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 315: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_16:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 320: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_28:
	setx	0x1d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b56070  ! 326: STHA_I	stha	%r24, [%r21 + 0x0070] %asi
cpu_intr_3_29:
	setx	0x1f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_30:
	setx	0x1e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a0ca  ! 334: STH_I	sth	%r30, [%r22 + 0x00ca]
T3_asi_reg_rd_17:
	mov	0x3c2, %r14
	.word 0xfedb8e80  ! 336: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_18:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_10:
	mov	0x29, %r14
	.word 0xf0f38e40  ! 347: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_31:
	setx	0x1d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2da064  ! 349: STB_I	stb	%r29, [%r22 + 0x0064]
	.word 0xf4ac0020  ! 350: STBA_R	stba	%r26, [%r16 + %r0] 0x01
T3_asi_reg_wr_11:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 352: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_wr_12:
	mov	0x0, %r14
	.word 0xfcf38e60  ! 355: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_32:
	setx	0x1c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_13:
	mov	0x2a, %r14
	.word 0xf0f389e0  ! 363: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_33:
	setx	0x1c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_14:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 368: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf8758000  ! 369: STX_R	stx	%r28, [%r22 + %r0]
T3_asi_reg_rd_19:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_15:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 377: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa358000  ! 380: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xfcb4e004  ! 383: STHA_I	stha	%r30, [%r19 + 0x0004] %asi
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198395a  ! 386: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195a, %hpstate
cpu_intr_3_34:
	setx	0x1f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_35:
	setx	0x1e022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa246019  ! 390: STW_I	stw	%r29, [%r17 + 0x0019]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_20:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfe75e020  ! 398: STX_I	stx	%r31, [%r23 + 0x0020]
T3_asi_reg_rd_21:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfca4e01d  ! 402: STWA_I	stwa	%r30, [%r19 + 0x001d] %asi
	.word 0xb8158000  ! 404: OR_R	or 	%r22, %r0, %r28
	.word 0xbb342001  ! 405: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xb62560c9  ! 406: SUB_I	sub 	%r21, 0x00c9, %r27
	.word 0xf6adc020  ! 408: STBA_R	stba	%r27, [%r23 + %r0] 0x01
cpu_intr_3_36:
	setx	0x1e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4acc020  ! 410: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xfa2ca195  ! 411: STB_I	stb	%r29, [%r18 + 0x0195]
T3_asi_reg_rd_22:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf675c000  ! 414: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf2a54020  ! 415: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xb73d2001  ! 418: SRA_I	sra 	%r20, 0x0001, %r27
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_16:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 420: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_17:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 422: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf6754000  ! 424: STX_R	stx	%r27, [%r21 + %r0]
cpu_intr_3_37:
	setx	0x1c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 427: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf22de15e  ! 428: STB_I	stb	%r25, [%r23 + 0x015e]
T3_asi_reg_wr_19:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 429: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829c0  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 5)
	.word 0xb20d0000  ! 435: AND_R	and 	%r20, %r0, %r25
	.word 0xf8b5a128  ! 440: STHA_I	stha	%r28, [%r22 + 0x0128] %asi
T3_asi_reg_wr_20:
	mov	0x0, %r14
	.word 0xf8f38e40  ! 443: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_23:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf075e017  ! 452: STX_I	stx	%r24, [%r23 + 0x0017]
	.word 0xf6f42021  ! 453: STXA_I	stxa	%r27, [%r16 + 0x0021] %asi
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c40  ! 454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c40, %hpstate
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 12)
	.word 0xfea5a03d  ! 456: STWA_I	stwa	%r31, [%r22 + 0x003d] %asi
cpu_intr_3_38:
	setx	0x200123, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_24:
	mov	0x7, %r14
	.word 0xf0db8400  ! 458: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_39:
	setx	0x23021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc240000  ! 464: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xfead8020  ! 465: STBA_R	stba	%r31, [%r22 + %r0] 0x01
cpu_intr_3_40:
	setx	0x220017, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983fc0  ! 470: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc0, %hpstate
T3_asi_reg_wr_21:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 472: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfead0020  ! 473: STBA_R	stba	%r31, [%r20 + %r0] 0x01
T3_asi_reg_wr_22:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 475: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0x8994a046  ! 477: WRPR_TICK_I	wrpr	%r18, 0x0046, %tick
	.word 0xbead0000  ! 479: ANDNcc_R	andncc 	%r20, %r0, %r31
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_23:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 483: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8b58020  ! 484: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xfc2d8000  ! 487: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf07560f7  ! 489: STX_I	stx	%r24, [%r21 + 0x00f7]
cpu_intr_3_41:
	setx	0x210327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 15)
	.word 0xf2ad6138  ! 495: STBA_I	stba	%r25, [%r21 + 0x0138] %asi
	.word 0xfcb4601c  ! 496: STHA_I	stha	%r30, [%r17 + 0x001c] %asi
cpu_intr_3_42:
	setx	0x210104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc244000  ! 500: SUB_R	sub 	%r17, %r0, %r30
	.word 0xf6350000  ! 501: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xfab4c020  ! 505: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xfe254000  ! 506: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf0240000  ! 507: STW_R	stw	%r24, [%r16 + %r0]
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 8)
	.word 0xfa254000  ! 509: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf0742162  ! 511: STX_I	stx	%r24, [%r16 + 0x0162]
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfa3461f6  ! 518: STH_I	sth	%r29, [%r17 + 0x01f6]
	.word 0xfc24607f  ! 519: STW_I	stw	%r30, [%r17 + 0x007f]
cpu_intr_3_43:
	setx	0x20003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_44:
	setx	0x21031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_25:
	mov	0x14, %r14
	.word 0xf4db89e0  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf2b5210d  ! 537: STHA_I	stha	%r25, [%r20 + 0x010d] %asi
cpu_intr_3_45:
	setx	0x20012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_24:
	mov	0x12, %r14
	.word 0xf4f38e60  ! 539: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_26:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_wr_25:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 543: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_46:
	setx	0x21012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 548: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 36)
	.word 0xba444000  ! 557: ADDC_R	addc 	%r17, %r0, %r29
	.word 0xf2356028  ! 558: STH_I	sth	%r25, [%r21 + 0x0028]
	.word 0xf22c4000  ! 559: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xf4a5a098  ! 560: STWA_I	stwa	%r26, [%r22 + 0x0098] %asi
T3_asi_reg_wr_26:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 562: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 39)
	.word 0xbab4a17b  ! 564: ORNcc_I	orncc 	%r18, 0x017b, %r29
cpu_intr_3_47:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_48:
	setx	0x200010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ce13f  ! 570: STB_I	stb	%r26, [%r19 + 0x013f]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982bd2  ! 572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd2, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb4e11e  ! 575: STHA_I	stha	%r31, [%r19 + 0x011e] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0b4619d  ! 577: STHA_I	stha	%r24, [%r17 + 0x019d] %asi
	.word 0xf225204d  ! 578: STW_I	stw	%r25, [%r20 + 0x004d]
	.word 0xb085e1a0  ! 579: ADDcc_I	addcc 	%r23, 0x01a0, %r24
T3_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 581: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfca44020  ! 582: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4742166  ! 587: STX_I	stx	%r26, [%r16 + 0x0166]
	ta	T_CHANGE_TO_TL0
	.word 0xf6ac4020  ! 589: STBA_R	stba	%r27, [%r17 + %r0] 0x01
cpu_intr_3_49:
	setx	0x23031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 595: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_50:
	setx	0x200135, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2352110  ! 603: STH_I	sth	%r25, [%r20 + 0x0110]
cpu_intr_3_51:
	setx	0x230332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_52:
	setx	0x220214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4a180  ! 613: STWA_I	stwa	%r28, [%r18 + 0x0180] %asi
	.word 0xf8a521e9  ! 614: STWA_I	stwa	%r28, [%r20 + 0x01e9] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xb6c4c000  ! 616: ADDCcc_R	addccc 	%r19, %r0, %r27
	.word 0xb21cc000  ! 618: XOR_R	xor 	%r19, %r0, %r25
T3_asi_reg_wr_29:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 620: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_27:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	.word 0xfc258000  ! 623: STW_R	stw	%r30, [%r22 + %r0]
T3_asi_reg_rd_28:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 624: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf275c000  ! 625: STX_R	stx	%r25, [%r23 + %r0]
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf6ac8020  ! 634: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xf0b5203b  ! 636: STHA_I	stha	%r24, [%r20 + 0x003b] %asi
cpu_intr_3_53:
	setx	0x230028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03ce15b  ! 638: XNOR_I	xnor 	%r19, 0x015b, %r24
T3_asi_reg_wr_30:
	mov	0x11, %r14
	.word 0xfcf38e60  ! 639: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_29:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f40  ! 641: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f40, %hpstate
	.word 0xb88d4000  ! 645: ANDcc_R	andcc 	%r21, %r0, %r28
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_30:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 650: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_31:
	mov	0x2e, %r14
	.word 0xf2db89e0  ! 652: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 20)
	.word 0xf224e0cf  ! 658: STW_I	stw	%r25, [%r19 + 0x00cf]
	.word 0xf0b48020  ! 659: STHA_R	stha	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_32:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_31:
	mov	0xa, %r14
	.word 0xf4f389e0  ! 666: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_54:
	setx	0x210313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2de1fd  ! 675: STB_I	stb	%r30, [%r23 + 0x01fd]
	.word 0xfa340000  ! 676: STH_R	sth	%r29, [%r16 + %r0]
T3_asi_reg_rd_33:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 677: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 678: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf4ade0e7  ! 679: STBA_I	stba	%r26, [%r23 + 0x00e7] %asi
T3_asi_reg_rd_34:
	mov	0xc, %r14
	.word 0xf0db84a0  ! 683: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb4c40000  ! 687: ADDCcc_R	addccc 	%r16, %r0, %r26
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_55:
	setx	0x22002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75e1d2  ! 691: STX_I	stx	%r29, [%r23 + 0x01d2]
	.word 0xb33ce001  ! 694: SRA_I	sra 	%r19, 0x0001, %r25
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
cpu_intr_3_56:
	setx	0x220238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 17)
	.word 0xf6a5c020  ! 701: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xfcb4c020  ! 702: STHA_R	stha	%r30, [%r19 + %r0] 0x01
T3_asi_reg_rd_35:
	mov	0x35, %r14
	.word 0xf8db8e60  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfab5a078  ! 709: STHA_I	stha	%r29, [%r22 + 0x0078] %asi
cpu_intr_3_57:
	setx	0x200217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_58:
	setx	0x230010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42460d6  ! 714: STW_I	stw	%r26, [%r17 + 0x00d6]
T3_asi_reg_rd_36:
	mov	0x11, %r14
	.word 0xfedb8e80  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf6a5e08c  ! 717: STWA_I	stwa	%r27, [%r23 + 0x008c] %asi
	.word 0xfea40020  ! 720: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	.word 0xfc24c000  ! 721: STW_R	stw	%r30, [%r19 + %r0]
cpu_intr_3_59:
	setx	0x230310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 727: STX_R	stx	%r29, [%r20 + %r0]
T3_asi_reg_wr_33:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 728: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0b56082  ! 730: STHA_I	stha	%r24, [%r21 + 0x0082] %asi
	.word 0xf6acc020  ! 731: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xf2a461c6  ! 733: STWA_I	stwa	%r25, [%r17 + 0x01c6] %asi
cpu_intr_3_60:
	setx	0x220329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5c020  ! 735: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf8adc020  ! 736: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xf4a46034  ! 738: STWA_I	stwa	%r26, [%r17 + 0x0034] %asi
cpu_intr_3_61:
	setx	0x200024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_62:
	setx	0x21001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 15)
	.word 0xb4250000  ! 748: SUB_R	sub 	%r20, %r0, %r26
T3_asi_reg_wr_34:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 750: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb2bd8000  ! 756: XNORcc_R	xnorcc 	%r22, %r0, %r25
cpu_intr_3_63:
	setx	0x220137, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_35:
	mov	0x18, %r14
	.word 0xfaf38e60  ! 759: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfcade006  ! 760: STBA_I	stba	%r30, [%r23 + 0x0006] %asi
	.word 0xfe756094  ! 762: STX_I	stx	%r31, [%r21 + 0x0094]
T3_asi_reg_rd_37:
	mov	0x36, %r14
	.word 0xf0db8e80  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfa25a1ec  ! 764: STW_I	stw	%r29, [%r22 + 0x01ec]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_64:
	setx	0x23012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_65:
	setx	0x220110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d1000  ! 773: SLLX_R	sllx	%r20, %r0, %r28
	.word 0xf22cc000  ! 774: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf634a1d9  ! 775: STH_I	sth	%r27, [%r18 + 0x01d9]
cpu_intr_3_66:
	setx	0x21010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
cpu_intr_3_67:
	setx	0x210110, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_36:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 783: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_68:
	setx	0x20003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 786: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 8)
	.word 0xfe748000  ! 792: STX_R	stx	%r31, [%r18 + %r0]
T3_asi_reg_rd_38:
	mov	0x9, %r14
	.word 0xf4db89e0  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_69:
	setx	0x210314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b40020  ! 796: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_39:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_70:
	setx	0x210212, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_40:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbf540000  ! 803: RDPR_GL	rdpr	%-, %r31
	.word 0xfc2dc000  ! 804: STB_R	stb	%r30, [%r23 + %r0]
cpu_intr_3_71:
	setx	0x220210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_41:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbb3d0000  ! 813: SRA_R	sra 	%r20, %r0, %r29
	.word 0xf224e142  ! 816: STW_I	stw	%r25, [%r19 + 0x0142]
	.word 0xf6acc020  ! 819: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xf035a15e  ! 821: STH_I	sth	%r24, [%r22 + 0x015e]
	.word 0xfe25e0fe  ! 823: STW_I	stw	%r31, [%r23 + 0x00fe]
	.word 0xba9c4000  ! 826: XORcc_R	xorcc 	%r17, %r0, %r29
	.word 0xfe758000  ! 827: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xbd2d4000  ! 830: SLL_R	sll 	%r21, %r0, %r30
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 26)
	.word 0xfaa4e11d  ! 832: STWA_I	stwa	%r29, [%r19 + 0x011d] %asi
T3_asi_reg_wr_38:
	mov	0x24, %r14
	.word 0xf8f38400  ! 833: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbf352001  ! 835: SRL_I	srl 	%r20, 0x0001, %r31
T3_asi_reg_wr_39:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 837: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfe750000  ! 838: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xbc8d8000  ! 841: ANDcc_R	andcc 	%r22, %r0, %r30
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 16)
	.word 0xfa35c000  ! 845: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_72:
	setx	0x200135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35a180  ! 848: STH_I	sth	%r31, [%r22 + 0x0180]
	.word 0xf835c000  ! 849: STH_R	sth	%r28, [%r23 + %r0]
T3_asi_reg_wr_40:
	mov	0xd, %r14
	.word 0xfcf38e60  ! 851: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf2b58020  ! 852: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	.word 0xf4a5a08a  ! 853: STWA_I	stwa	%r26, [%r22 + 0x008a] %asi
	.word 0xf8250000  ! 854: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf825c000  ! 855: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xb5520000  ! 858: RDPR_PIL	<illegal instruction>
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 19)
	.word 0xfcb5a1d9  ! 865: STHA_I	stha	%r30, [%r22 + 0x01d9] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf42d0000  ! 869: STB_R	stb	%r26, [%r20 + %r0]
T3_asi_reg_rd_42:
	mov	0x28, %r14
	.word 0xfedb8e60  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbf2de001  ! 872: SLL_I	sll 	%r23, 0x0001, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfea42051  ! 878: STWA_I	stwa	%r31, [%r16 + 0x0051] %asi
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, d)
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, a)
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_73:
	setx	0x220320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834c000  ! 900: STH_R	sth	%r28, [%r19 + %r0]
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_74:
	setx	0x210017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 906: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf8f5a042  ! 908: STXA_I	stxa	%r28, [%r22 + 0x0042] %asi
	.word 0xf02d6038  ! 910: STB_I	stb	%r24, [%r21 + 0x0038]
cpu_intr_3_75:
	setx	0x200130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_43:
	mov	0x28, %r14
	.word 0xf0db8e40  ! 915: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbe3d8000  ! 916: XNOR_R	xnor 	%r22, %r0, %r31
cpu_intr_3_76:
	setx	0x270330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 11)
	ta	T_CHANGE_NONHPRIV
	.word 0xf02da19c  ! 929: STB_I	stb	%r24, [%r22 + 0x019c]
	ta	T_CHANGE_TO_TL1
	.word 0xf2252047  ! 932: STW_I	stw	%r25, [%r20 + 0x0047]
	.word 0xf22da0a7  ! 934: STB_I	stb	%r25, [%r22 + 0x00a7]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_77:
	setx	0x250022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274616d  ! 939: STX_I	stx	%r25, [%r17 + 0x016d]
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_TO_TL0
	.word 0xb32c5000  ! 949: SLLX_R	sllx	%r17, %r0, %r25
	.word 0xf0aca0d8  ! 955: STBA_I	stba	%r24, [%r18 + 0x00d8] %asi
T3_asi_reg_rd_44:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_41:
	mov	0x2b, %r14
	.word 0xfef384a0  ! 958: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_78:
	setx	0x270033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0358000  ! 960: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf0a5c020  ! 963: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_79:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 18)
	.word 0xfea521a0  ! 969: STWA_I	stwa	%r31, [%r20 + 0x01a0] %asi
	.word 0xf4752182  ! 970: STX_I	stx	%r26, [%r20 + 0x0182]
	.word 0xf4754000  ! 972: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xf82da034  ! 973: STB_I	stb	%r28, [%r22 + 0x0034]
	.word 0xfeac209b  ! 974: STBA_I	stba	%r31, [%r16 + 0x009b] %asi
cpu_intr_3_80:
	setx	0x240102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b58020  ! 977: STHA_R	stha	%r28, [%r22 + %r0] 0x01
cpu_intr_3_81:
	setx	0x27022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe340000  ! 980: SUBC_R	orn 	%r16, %r0, %r31
T3_asi_reg_wr_42:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 981: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb22de1f0  ! 985: ANDN_I	andn 	%r23, 0x01f0, %r25
T3_asi_reg_wr_43:
	mov	0x5, %r14
	.word 0xfcf38e80  ! 986: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982ad2  ! 990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad2, %hpstate
	.word 0xf62460f4  ! 991: STW_I	stw	%r27, [%r17 + 0x00f4]
T3_asi_reg_rd_45:
	mov	0x11, %r14
	.word 0xfedb8e60  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_82:
	setx	0x26000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a061  ! 997: WRPR_PIL_I	wrpr	%r22, 0x0061, %pil
T3_asi_reg_rd_46:
	mov	0x2f, %r14
	.word 0xf0db8e60  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_83:
	setx	0x270214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_84:
	setx	0x270113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf56082  ! 1004: STXA_I	stxa	%r29, [%r21 + 0x0082] %asi
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_85:
	setx	0x25003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03dc000  ! 1009: XNOR_R	xnor 	%r23, %r0, %r24
cpu_intr_3_86:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 34)
	.word 0xb6b5e13c  ! 1016: SUBCcc_I	orncc 	%r23, 0x013c, %r27
	.word 0xf2b48020  ! 1017: STHA_R	stha	%r25, [%r18 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_87:
	setx	0x240206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_88:
	setx	0x24001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf424617e  ! 1028: STW_I	stw	%r26, [%r17 + 0x017e]
cpu_intr_3_89:
	setx	0x27001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa342155  ! 1030: STH_I	sth	%r29, [%r16 + 0x0155]
	.word 0xfeb50020  ! 1033: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xfc258000  ! 1034: STW_R	stw	%r30, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2da021  ! 1037: STB_I	stb	%r30, [%r22 + 0x0021]
cpu_intr_3_90:
	setx	0x240225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfcf420aa  ! 1042: STXA_I	stxa	%r30, [%r16 + 0x00aa] %asi
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_47:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb28d6123  ! 1048: ANDcc_I	andcc 	%r21, 0x0123, %r25
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb4244000  ! 1052: SUB_R	sub 	%r17, %r0, %r26
T3_asi_reg_rd_48:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_91:
	setx	0x240103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3521eb  ! 1059: STH_I	sth	%r30, [%r20 + 0x01eb]
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfc352114  ! 1061: STH_I	sth	%r30, [%r20 + 0x0114]
cpu_intr_3_92:
	setx	0x260226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 0)
	.word 0xf6f4a194  ! 1069: STXA_I	stxa	%r27, [%r18 + 0x0194] %asi
T3_asi_reg_wr_44:
	mov	0x6, %r14
	.word 0xf2f38400  ! 1070: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 6)
	.word 0xf0258000  ! 1073: STW_R	stw	%r24, [%r22 + %r0]
T3_asi_reg_rd_49:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_rd_50:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfc2c0000  ! 1080: STB_R	stb	%r30, [%r16 + %r0]
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 7)
	.word 0xfea46068  ! 1089: STWA_I	stwa	%r31, [%r17 + 0x0068] %asi
	.word 0xfeb5c020  ! 1092: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xf8b5a1a5  ! 1093: STHA_I	stha	%r28, [%r22 + 0x01a5] %asi
T3_asi_reg_rd_51:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1094: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, d)
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6b4a15a  ! 1101: STHA_I	stha	%r27, [%r18 + 0x015a] %asi
	.word 0xb3520000  ! 1102: RDPR_PIL	rdpr	%pil, %r25
T3_asi_reg_wr_45:
	mov	0x24, %r14
	.word 0xf8f38e80  ! 1107: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf8f560c4  ! 1109: STXA_I	stxa	%r28, [%r21 + 0x00c4] %asi
	.word 0xf82cc000  ! 1110: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf62c8000  ! 1113: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 18)
	.word 0xfaa5e1f1  ! 1119: STWA_I	stwa	%r29, [%r23 + 0x01f1] %asi
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0a48020  ! 1121: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xfc744000  ! 1123: STX_R	stx	%r30, [%r17 + %r0]
cpu_intr_3_93:
	setx	0x260032, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_52:
	mov	0x28, %r14
	.word 0xf2db84a0  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf475c000  ! 1128: STX_R	stx	%r26, [%r23 + %r0]
T3_asi_reg_wr_46:
	mov	0x1a, %r14
	.word 0xf6f389e0  ! 1131: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf874e1b1  ! 1132: STX_I	stx	%r28, [%r19 + 0x01b1]
	.word 0xfc25c000  ! 1133: STW_R	stw	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf6f5e0ff  ! 1136: STXA_I	stxa	%r27, [%r23 + 0x00ff] %asi
cpu_intr_3_94:
	setx	0x26022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_95:
	setx	0x24022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0x1e, %r14
	.word 0xf2f38e60  ! 1147: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfea5c020  ! 1148: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xb8a5a177  ! 1149: SUBcc_I	subcc 	%r22, 0x0177, %r28
T3_asi_reg_rd_53:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf275e0be  ! 1152: STX_I	stx	%r25, [%r23 + 0x00be]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_48:
	mov	0x1, %r14
	.word 0xfef38e80  ! 1156: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 38)
	.word 0xf22c0000  ! 1162: STB_R	stb	%r25, [%r16 + %r0]
T3_asi_reg_wr_49:
	mov	0x2e, %r14
	.word 0xfef389e0  ! 1163: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_54:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb335b001  ! 1168: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xb09ce030  ! 1172: XORcc_I	xorcc 	%r19, 0x0030, %r24
cpu_intr_3_96:
	setx	0x240137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d0000  ! 1182: STB_R	stb	%r30, [%r20 + %r0]
cpu_intr_3_97:
	setx	0x240201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075603b  ! 1184: STX_I	stx	%r24, [%r21 + 0x003b]
cpu_intr_3_98:
	setx	0x260320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0354000  ! 1190: STH_R	sth	%r24, [%r21 + %r0]
cpu_intr_3_99:
	setx	0x24003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2de001  ! 1192: SLL_I	sll 	%r23, 0x0001, %r29
cpu_intr_3_100:
	setx	0x24001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b50020  ! 1195: STHA_R	stha	%r26, [%r20 + %r0] 0x01
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_55:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_101:
	setx	0x260222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, f)
	.word 0xfaa4e086  ! 1201: STWA_I	stwa	%r29, [%r19 + 0x0086] %asi
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_50:
	mov	0x31, %r14
	.word 0xf4f389e0  ! 1204: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfaad6176  ! 1206: STBA_I	stba	%r29, [%r21 + 0x0176] %asi
	.word 0xf8b4a16b  ! 1210: STHA_I	stha	%r28, [%r18 + 0x016b] %asi
	.word 0xf42d8000  ! 1211: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfcb5e006  ! 1212: STHA_I	stha	%r30, [%r23 + 0x0006] %asi
T3_asi_reg_wr_51:
	mov	0x0, %r14
	.word 0xfef384a0  ! 1213: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_56:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_52:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 1217: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb00420e9  ! 1218: ADD_I	add 	%r16, 0x00e9, %r24
cpu_intr_3_102:
	setx	0x27010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_53:
	mov	0xd, %r14
	.word 0xf0f38e80  ! 1221: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_54:
	mov	0x16, %r14
	.word 0xfcf389e0  ! 1227: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 14)
	.word 0xb28dc000  ! 1229: ANDcc_R	andcc 	%r23, %r0, %r25
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_57:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982a8a  ! 1240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
cpu_intr_3_103:
	setx	0x240023, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_58:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 1242: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf8a44020  ! 1243: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb2ac8000  ! 1249: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xfeac0020  ! 1251: STBA_R	stba	%r31, [%r16 + %r0] 0x01
cpu_intr_3_104:
	setx	0x270021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_105:
	setx	0x250209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_106:
	setx	0x27021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b40020  ! 1263: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xfeac21a9  ! 1265: STBA_I	stba	%r31, [%r16 + 0x01a9] %asi
cpu_intr_3_107:
	setx	0x26003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a58020  ! 1272: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xfc740000  ! 1273: STX_R	stx	%r30, [%r16 + %r0]
cpu_intr_3_108:
	setx	0x240114, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_59:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbc85c000  ! 1278: ADDcc_R	addcc 	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfea5a003  ! 1280: STWA_I	stwa	%r31, [%r22 + 0x0003] %asi
	.word 0xf024a12a  ! 1281: STW_I	stw	%r24, [%r18 + 0x012a]
cpu_intr_3_109:
	setx	0x270001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674e127  ! 1286: STX_I	stx	%r27, [%r19 + 0x0127]
	.word 0xba044000  ! 1289: ADD_R	add 	%r17, %r0, %r29
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_110:
	setx	0x270323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_111:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_112:
	setx	0x24030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74e0a5  ! 1297: STX_I	stx	%r30, [%r19 + 0x00a5]
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_55:
	mov	0x35, %r14
	.word 0xf0f38400  ! 1300: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf8244000  ! 1301: STW_R	stw	%r28, [%r17 + %r0]
cpu_intr_3_113:
	setx	0x240317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 25)
	.word 0xfeac4020  ! 1307: STBA_R	stba	%r31, [%r17 + %r0] 0x01
T3_asi_reg_rd_60:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 1308: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf0a4c020  ! 1309: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xbf2de001  ! 1310: SLL_I	sll 	%r23, 0x0001, %r31
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfab5e0e6  ! 1313: STHA_I	stha	%r29, [%r23 + 0x00e6] %asi
	.word 0xf6250000  ! 1322: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xfc7420b2  ! 1327: STX_I	stx	%r30, [%r16 + 0x00b2]
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 24)
	.word 0xf4f5a0ed  ! 1329: STXA_I	stxa	%r26, [%r22 + 0x00ed] %asi
	.word 0xf8ad8020  ! 1330: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xf0ac4020  ! 1335: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xfef42096  ! 1340: STXA_I	stxa	%r31, [%r16 + 0x0096] %asi
	.word 0xf8758000  ! 1341: STX_R	stx	%r28, [%r22 + %r0]
T3_asi_reg_wr_56:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1345: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8f4e131  ! 1347: STXA_I	stxa	%r28, [%r19 + 0x0131] %asi
T3_asi_reg_wr_57:
	mov	0x37, %r14
	.word 0xfcf38e40  ! 1348: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 2)
	.word 0xb77dc400  ! 1352: MOVR_R	movre	%r23, %r0, %r27
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_61:
	mov	0x35, %r14
	.word 0xf4db8400  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_114:
	setx	0x26033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad8020  ! 1360: STBA_R	stba	%r26, [%r22 + %r0] 0x01
T3_asi_reg_wr_58:
	mov	0x2, %r14
	.word 0xf0f38400  ! 1361: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_wr_59:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1362: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfab44020  ! 1365: STHA_R	stha	%r29, [%r17 + %r0] 0x01
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_115:
	setx	0x260206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfaa48020  ! 1372: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xf6ada131  ! 1375: STBA_I	stba	%r27, [%r22 + 0x0131] %asi
	.word 0xfeade0a7  ! 1377: STBA_I	stba	%r31, [%r23 + 0x00a7] %asi
T3_asi_reg_wr_60:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 1378: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_62:
	mov	0x33, %r14
	.word 0xf6db8400  ! 1384: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_63:
	mov	0x2d, %r14
	.word 0xf0db8e60  ! 1387: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_116:
	setx	0x27003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0356178  ! 1390: STH_I	sth	%r24, [%r21 + 0x0178]
	.word 0xfa2de1e6  ! 1392: STB_I	stb	%r29, [%r23 + 0x01e6]
cpu_intr_3_117:
	setx	0x290135, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_61:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 1395: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf0b5200a  ! 1397: STHA_I	stha	%r24, [%r20 + 0x000a] %asi
	.word 0xba9c2060  ! 1398: XORcc_I	xorcc 	%r16, 0x0060, %r29
cpu_intr_3_118:
	setx	0x2b003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe344000  ! 1402: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xbeb560b4  ! 1403: ORNcc_I	orncc 	%r21, 0x00b4, %r31
T3_asi_reg_rd_64:
	mov	0x2c, %r14
	.word 0xfadb8e40  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_65:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb53ca001  ! 1406: SRA_I	sra 	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982992  ! 1408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0992, %hpstate
	.word 0xf2ace112  ! 1412: STBA_I	stba	%r25, [%r19 + 0x0112] %asi
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 36)
	.word 0xf6a4209c  ! 1414: STWA_I	stwa	%r27, [%r16 + 0x009c] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf834e097  ! 1417: STH_I	sth	%r28, [%r19 + 0x0097]
	.word 0xf6a5a185  ! 1418: STWA_I	stwa	%r27, [%r22 + 0x0185] %asi
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfa2d0000  ! 1422: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfcad4020  ! 1425: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_66:
	mov	0x26, %r14
	.word 0xfedb8e80  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 35)
	.word 0xfca5c020  ! 1429: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xf025e0bd  ! 1430: STW_I	stw	%r24, [%r23 + 0x00bd]
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_119:
	setx	0x2b0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02da0e3  ! 1434: STB_I	stb	%r24, [%r22 + 0x00e3]
cpu_intr_3_120:
	setx	0x2a0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_67:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1436: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf82c2192  ! 1437: STB_I	stb	%r28, [%r16 + 0x0192]
	.word 0xb335f001  ! 1438: SRLX_I	srlx	%r23, 0x0001, %r25
	.word 0xfc2cc000  ! 1442: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf02dc000  ! 1443: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb2a4a0a0  ! 1445: SUBcc_I	subcc 	%r18, 0x00a0, %r25
cpu_intr_3_121:
	setx	0x290324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_122:
	setx	0x280119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5a15a  ! 1450: STWA_I	stwa	%r27, [%r22 + 0x015a] %asi
	.word 0xf2b4209a  ! 1451: STHA_I	stha	%r25, [%r16 + 0x009a] %asi
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cc2  ! 1457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc2, %hpstate
	.word 0xf4ad61d7  ! 1458: STBA_I	stba	%r26, [%r21 + 0x01d7] %asi
	.word 0xfaac0020  ! 1460: STBA_R	stba	%r29, [%r16 + %r0] 0x01
T3_asi_reg_wr_62:
	mov	0x2a, %r14
	.word 0xf8f38e80  ! 1462: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf0754000  ! 1466: STX_R	stx	%r24, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xb6c5202c  ! 1471: ADDCcc_I	addccc 	%r20, 0x002c, %r27
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f40  ! 1472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f40, %hpstate
T3_asi_reg_rd_68:
	mov	0x1c, %r14
	.word 0xfcdb8400  ! 1474: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf4a520d5  ! 1475: STWA_I	stwa	%r26, [%r20 + 0x00d5] %asi
T3_asi_reg_wr_63:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 1476: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, e)
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 14)
	.word 0xfe74a0fe  ! 1483: STX_I	stx	%r31, [%r18 + 0x00fe]
cpu_intr_3_123:
	setx	0x2b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3de025  ! 1486: XNOR_I	xnor 	%r23, 0x0025, %r31
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_69:
	mov	0x28, %r14
	.word 0xf8db8400  ! 1488: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_70:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 1490: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf274a1fd  ! 1491: STX_I	stx	%r25, [%r18 + 0x01fd]
T3_asi_reg_wr_64:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 1493: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_65:
	mov	0xd, %r14
	.word 0xfcf38e60  ! 1494: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf8b560b3  ! 1495: STHA_I	stha	%r28, [%r21 + 0x00b3] %asi
cpu_intr_3_124:
	setx	0x2a013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef42122  ! 1498: STXA_I	stxa	%r31, [%r16 + 0x0122] %asi
	.word 0xf2b5616a  ! 1501: STHA_I	stha	%r25, [%r21 + 0x016a] %asi
	.word 0xf0ac0020  ! 1502: STBA_R	stba	%r24, [%r16 + %r0] 0x01
T3_asi_reg_rd_71:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf425604d  ! 1505: STW_I	stw	%r26, [%r21 + 0x004d]
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_125:
	setx	0x290131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_72:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 1515: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_126:
	setx	0x2a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4e03f  ! 1521: STHA_I	stha	%r25, [%r19 + 0x003f] %asi
	.word 0xba3c601b  ! 1522: XNOR_I	xnor 	%r17, 0x001b, %r29
T3_asi_reg_rd_73:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0ad4020  ! 1528: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xf8754000  ! 1530: STX_R	stx	%r28, [%r21 + %r0]
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_67:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 1535: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf0b5210e  ! 1537: STHA_I	stha	%r24, [%r20 + 0x010e] %asi
	.word 0xfaad6194  ! 1538: STBA_I	stba	%r29, [%r21 + 0x0194] %asi
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_68:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 1543: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_wr_69:
	mov	0x2f, %r14
	.word 0xf0f38e40  ! 1544: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d213c  ! 1549: STB_I	stb	%r31, [%r20 + 0x013c]
	.word 0xbd51c000  ! 1551: RDPR_TL	rdpr	%tl, %r30
cpu_intr_3_127:
	setx	0x28013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_70:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 1561: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfe34c000  ! 1563: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf8ad0020  ! 1565: STBA_R	stba	%r28, [%r20 + %r0] 0x01
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf4a50020  ! 1568: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
T3_asi_reg_rd_74:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 1570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe748000  ! 1571: STX_R	stx	%r31, [%r18 + %r0]
T3_asi_reg_rd_75:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 1574: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_HPRIV
cpu_intr_3_128:
	setx	0x28000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 1585: STW_R	stw	%r26, [%r19 + %r0]
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_71:
	mov	0x36, %r14
	.word 0xf6f38400  ! 1589: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_rd_76:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_129:
	setx	0x290304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_130:
	setx	0x290225, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_131:
	setx	0x2a0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5e0e3  ! 1599: STWA_I	stwa	%r24, [%r23 + 0x00e3] %asi
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfe256170  ! 1604: STW_I	stw	%r31, [%r21 + 0x0170]
T3_asi_reg_wr_72:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 1605: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0a4e0b2  ! 1610: STWA_I	stwa	%r24, [%r19 + 0x00b2] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_TO_TL0
	.word 0xfea44020  ! 1618: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
cpu_intr_3_132:
	setx	0x29020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 1621: STH_R	sth	%r29, [%r17 + %r0]
T3_asi_reg_wr_73:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 1622: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf6a58020  ! 1626: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfa342053  ! 1636: STH_I	sth	%r29, [%r16 + 0x0053]
	.word 0xb69421c8  ! 1638: ORcc_I	orcc 	%r16, 0x01c8, %r27
T3_asi_reg_rd_77:
	mov	0x1b, %r14
	.word 0xf4db8400  ! 1639: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 19)
	.word 0xf2ad4020  ! 1643: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xfaacc020  ! 1644: STBA_R	stba	%r29, [%r19 + %r0] 0x01
T3_asi_reg_rd_78:
	mov	0x1, %r14
	.word 0xfcdb8e60  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_79:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_74:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 1654: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_133:
	setx	0x2b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c2140  ! 1657: STB_I	stb	%r29, [%r16 + 0x0140]
	.word 0xf2b46078  ! 1661: STHA_I	stha	%r25, [%r17 + 0x0078] %asi
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_134:
	setx	0x28031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad8020  ! 1670: STBA_R	stba	%r26, [%r22 + %r0] 0x01
cpu_intr_3_135:
	setx	0x290323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead2060  ! 1674: STBA_I	stba	%r31, [%r20 + 0x0060] %asi
T3_asi_reg_wr_75:
	mov	0x6, %r14
	.word 0xfaf389e0  ! 1676: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_76:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 1681: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 26)
	.word 0xf034a054  ! 1684: STH_I	sth	%r24, [%r18 + 0x0054]
cpu_intr_3_136:
	setx	0x290139, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_77:
	mov	0x38, %r14
	.word 0xf4f38400  ! 1694: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_78:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 1698: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbd641800  ! 1700: MOVcc_R	<illegal instruction>
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982808  ! 1707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0808, %hpstate
T3_asi_reg_rd_80:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb7de401  ! 1718: MOVR_I	movre	%r23, 0x1, %r29
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 20)
	.word 0xf075c000  ! 1721: STX_R	stx	%r24, [%r23 + %r0]
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b5e1f1  ! 1728: STHA_I	stha	%r26, [%r23 + 0x01f1] %asi
cpu_intr_3_137:
	setx	0x2a022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61ce037  ! 1732: XOR_I	xor 	%r19, 0x0037, %r27
cpu_intr_3_138:
	setx	0x290033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0246061  ! 1736: STW_I	stw	%r24, [%r17 + 0x0061]
	.word 0xfa34e144  ! 1738: STH_I	sth	%r29, [%r19 + 0x0144]
	.word 0xf2a54020  ! 1741: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
cpu_intr_3_139:
	setx	0x2b0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a561e2  ! 1745: STWA_I	stwa	%r27, [%r21 + 0x01e2] %asi
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 17)
	.word 0xfaf5e07e  ! 1750: STXA_I	stxa	%r29, [%r23 + 0x007e] %asi
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_HPRIV
	.word 0xf02d8000  ! 1754: STB_R	stb	%r24, [%r22 + %r0]
T3_asi_reg_rd_81:
	mov	0x1d, %r14
	.word 0xf6db84a0  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf634c000  ! 1762: STH_R	sth	%r27, [%r19 + %r0]
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c42  ! 1767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c42, %hpstate
	.word 0xba9cc000  ! 1768: XORcc_R	xorcc 	%r19, %r0, %r29
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 1d)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b50  ! 1771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b50, %hpstate
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_82:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_79:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 1779: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_83:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfcaca187  ! 1784: STBA_I	stba	%r30, [%r18 + 0x0187] %asi
cpu_intr_3_140:
	setx	0x290301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62421de  ! 1789: STW_I	stw	%r27, [%r16 + 0x01de]
T3_asi_reg_rd_84:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 1793: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_wr_80:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 1795: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf834a1aa  ! 1797: STH_I	sth	%r28, [%r18 + 0x01aa]
	ta	T_CHANGE_HPRIV
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 27)
	ta	T_CHANGE_HPRIV
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_141:
	setx	0x2b002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_142:
	setx	0x2a013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_81:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 1816: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf27461fc  ! 1817: STX_I	stx	%r25, [%r17 + 0x01fc]
T3_asi_reg_wr_82:
	mov	0x34, %r14
	.word 0xf8f38e60  ! 1821: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbc3ce0ee  ! 1823: XNOR_I	xnor 	%r19, 0x00ee, %r30
T3_asi_reg_rd_85:
	mov	0x24, %r14
	.word 0xf8db8e40  ! 1827: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_83:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 1832: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_86:
	mov	0x35, %r14
	.word 0xf6db89e0  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_143:
	setx	0x2d021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 8)
	.word 0xf8240000  ! 1842: STW_R	stw	%r28, [%r16 + %r0]
cpu_intr_3_144:
	setx	0x2c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_87:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 1846: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf234200d  ! 1851: STH_I	sth	%r25, [%r16 + 0x000d]
T3_asi_reg_wr_84:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 1852: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc2cc000  ! 1854: STB_R	stb	%r30, [%r19 + %r0]
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 20)
	.word 0xf02da19a  ! 1856: STB_I	stb	%r24, [%r22 + 0x019a]
	.word 0xbc2d0000  ! 1857: ANDN_R	andn 	%r20, %r0, %r30
T3_asi_reg_rd_88:
	mov	0x2f, %r14
	.word 0xf0db89e0  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_145:
	setx	0x2c032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead0020  ! 1863: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf6756177  ! 1864: STX_I	stx	%r27, [%r21 + 0x0177]
cpu_intr_3_146:
	setx	0x2f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35c000  ! 1866: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 22)
	.word 0xb6b5c000  ! 1869: ORNcc_R	orncc 	%r23, %r0, %r27
	.word 0xb13dc000  ! 1871: SRA_R	sra 	%r23, %r0, %r24
T3_asi_reg_wr_85:
	mov	0x1d, %r14
	.word 0xfef389e0  ! 1872: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_86:
	mov	0x33, %r14
	.word 0xf8f38e60  ! 1876: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_89:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_87:
	mov	0xb, %r14
	.word 0xf6f38e40  ! 1881: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfab5a02f  ! 1882: STHA_I	stha	%r29, [%r22 + 0x002f] %asi
	.word 0xf22c4000  ! 1883: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfef520d9  ! 1884: STXA_I	stxa	%r31, [%r20 + 0x00d9] %asi
	.word 0xf22da009  ! 1886: STB_I	stb	%r25, [%r22 + 0x0009]
	.word 0xf0ac0020  ! 1887: STBA_R	stba	%r24, [%r16 + %r0] 0x01
cpu_intr_3_147:
	setx	0x2f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c6110  ! 1893: STB_I	stb	%r25, [%r17 + 0x0110]
	.word 0xf2344000  ! 1896: STH_R	sth	%r25, [%r17 + %r0]
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_148:
	setx	0x2d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x2d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_90:
	mov	0x11, %r14
	.word 0xfadb89e0  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf0ad0020  ! 1905: STBA_R	stba	%r24, [%r20 + %r0] 0x01
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_91:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 1908: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf8b5c020  ! 1909: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c00  ! 1910: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c00, %hpstate
cpu_intr_3_150:
	setx	0x2f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce170  ! 1912: STB_I	stb	%r27, [%r19 + 0x0170]
cpu_intr_3_151:
	setx	0x2d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_152:
	setx	0x2d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_154:
	setx	0x2f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x23, %r14
	.word 0xf4f389e0  ! 1921: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_89:
	mov	0x1c, %r14
	.word 0xf6f38e80  ! 1923: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xf0a4609a  ! 1925: STWA_I	stwa	%r24, [%r17 + 0x009a] %asi
	.word 0xf2f460c0  ! 1928: STXA_I	stxa	%r25, [%r17 + 0x00c0] %asi
	.word 0xb6448000  ! 1929: ADDC_R	addc 	%r18, %r0, %r27
T3_asi_reg_wr_90:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 1931: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb2adc000  ! 1934: ANDNcc_R	andncc 	%r23, %r0, %r25
	.word 0xbec54000  ! 1935: ADDCcc_R	addccc 	%r21, %r0, %r31
T3_asi_reg_wr_91:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 1937: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_TO_TL0
	.word 0xf8a561fb  ! 1944: STWA_I	stwa	%r28, [%r21 + 0x01fb] %asi
cpu_intr_3_155:
	setx	0x2e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_92:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 1953: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf6b520b0  ! 1954: STHA_I	stha	%r27, [%r20 + 0x00b0] %asi
T3_asi_reg_wr_93:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 1956: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, d)
	.word 0xf0f5603e  ! 1958: STXA_I	stxa	%r24, [%r21 + 0x003e] %asi
T3_asi_reg_rd_92:
	mov	0x34, %r14
	.word 0xf6db89e0  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_156:
	setx	0x2d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac0020  ! 1964: STBA_R	stba	%r31, [%r16 + %r0] 0x01
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf875a04f  ! 1967: STX_I	stx	%r28, [%r22 + 0x004f]
	.word 0xfc74a16d  ! 1970: STX_I	stx	%r30, [%r18 + 0x016d]
	.word 0xfc758000  ! 1972: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xbeac8000  ! 1977: ANDNcc_R	andncc 	%r18, %r0, %r31
cpu_intr_3_157:
	setx	0x2f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_94:
	mov	0x0, %r14
	.word 0xfef384a0  ! 1980: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf2a5c020  ! 1981: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_95:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 1982: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfc2d4000  ! 1984: STB_R	stb	%r30, [%r21 + %r0]
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 10)
	.word 0xfa2de1ff  ! 1987: STB_I	stb	%r29, [%r23 + 0x01ff]
	.word 0xf6a5e0fc  ! 1988: STWA_I	stwa	%r27, [%r23 + 0x00fc] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2c8000  ! 1990: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xf82d8000  ! 1992: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xb0858000  ! 1993: ADDcc_R	addcc 	%r22, %r0, %r24
cpu_intr_3_158:
	setx	0x2d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_96:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 1998: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb40c206e  ! 1999: AND_I	and 	%r16, 0x006e, %r26
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_160:
	setx	0x2d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 32)
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982eca  ! 2009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
	.word 0xf2f52062  ! 2010: STXA_I	stxa	%r25, [%r20 + 0x0062] %asi
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_161:
	setx	0x2d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_97:
	mov	0x4, %r14
	.word 0xfef38400  ! 2019: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	.word 0xfab5c020  ! 2021: STHA_R	stha	%r29, [%r23 + %r0] 0x01
cpu_intr_3_162:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e00  ! 2025: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
cpu_intr_3_163:
	setx	0x2c003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf475e134  ! 2028: STX_I	stx	%r26, [%r23 + 0x0134]
	.word 0xfe34e1dc  ! 2029: STH_I	sth	%r31, [%r19 + 0x01dc]
	.word 0xb60d4000  ! 2030: AND_R	and 	%r21, %r0, %r27
	.word 0xf635606c  ! 2033: STH_I	sth	%r27, [%r21 + 0x006c]
T3_asi_reg_wr_98:
	mov	0x29, %r14
	.word 0xfaf389e0  ! 2036: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_164:
	setx	0x2f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_99:
	mov	0x19, %r14
	.word 0xf6f38e60  ! 2044: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf4ad0020  ! 2045: STBA_R	stba	%r26, [%r20 + %r0] 0x01
cpu_intr_3_165:
	setx	0x2d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ade0c9  ! 2049: STBA_I	stba	%r24, [%r23 + 0x00c9] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xb62c6139  ! 2051: ANDN_I	andn 	%r17, 0x0139, %r27
cpu_intr_3_166:
	setx	0x2e0110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_167:
	setx	0x2e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb9352001  ! 2055: SRL_I	srl 	%r20, 0x0001, %r28
cpu_intr_3_168:
	setx	0x2d000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_169:
	setx	0x2d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a1b0  ! 2060: STHA_I	stha	%r25, [%r18 + 0x01b0] %asi
	.word 0xbe8d2002  ! 2063: ANDcc_I	andcc 	%r20, 0x0002, %r31
	.word 0xfaac8020  ! 2065: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf4f4e0d6  ! 2067: STXA_I	stxa	%r26, [%r19 + 0x00d6] %asi
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6ad60c0  ! 2069: STBA_I	stba	%r27, [%r21 + 0x00c0] %asi
cpu_intr_3_170:
	setx	0x2f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75c000  ! 2074: STX_R	stx	%r31, [%r23 + %r0]
T3_asi_reg_wr_100:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 2076: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb424e0ba  ! 2078: SUB_I	sub 	%r19, 0x00ba, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba2c4000  ! 2085: ANDN_R	andn 	%r17, %r0, %r29
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982dd8  ! 2086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd8, %hpstate
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_101:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 2089: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_171:
	setx	0x2d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_102:
	mov	0x31, %r14
	.word 0xfcf38e40  ! 2094: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf2b520a5  ! 2097: STHA_I	stha	%r25, [%r20 + 0x00a5] %asi
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, f)
	.word 0xf4a4e131  ! 2100: STWA_I	stwa	%r26, [%r19 + 0x0131] %asi
	.word 0xf2ade09c  ! 2102: STBA_I	stba	%r25, [%r23 + 0x009c] %asi
	.word 0xf62d60a6  ! 2104: STB_I	stb	%r27, [%r21 + 0x00a6]
T3_asi_reg_rd_93:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0b54020  ! 2109: STHA_R	stha	%r24, [%r21 + %r0] 0x01
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 2d)
	.word 0x8d942005  ! 2112: WRPR_PSTATE_I	wrpr	%r16, 0x0005, %pstate
	.word 0xf6f5a0d4  ! 2114: STXA_I	stxa	%r27, [%r22 + 0x00d4] %asi
	.word 0xfab52088  ! 2118: STHA_I	stha	%r29, [%r20 + 0x0088] %asi
	.word 0xf02461ce  ! 2119: STW_I	stw	%r24, [%r17 + 0x01ce]
T3_asi_reg_wr_103:
	mov	0x31, %r14
	.word 0xf2f38e60  ! 2120: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfcf5e173  ! 2123: STXA_I	stxa	%r30, [%r23 + 0x0173] %asi
	.word 0xf8ad8020  ! 2126: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b42  ! 2127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b42, %hpstate
cpu_intr_3_172:
	setx	0x2c0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_94:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb3357001  ! 2133: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xf0258000  ! 2136: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf8350000  ! 2137: STH_R	sth	%r28, [%r20 + %r0]
T3_asi_reg_rd_95:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf624c000  ! 2142: STW_R	stw	%r27, [%r19 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf0746186  ! 2145: STX_I	stx	%r24, [%r17 + 0x0186]
	.word 0xf0a54020  ! 2146: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_96:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 2148: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_104:
	mov	0x27, %r14
	.word 0xfcf38400  ! 2150: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_rd_97:
	mov	0x1b, %r14
	.word 0xf6db89e0  ! 2152: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_98:
	mov	0x21, %r14
	.word 0xfcdb8e40  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
	.word 0xfe75e03c  ! 2161: STX_I	stx	%r31, [%r23 + 0x003c]
T3_asi_reg_wr_105:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 2162: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb97d2401  ! 2164: MOVR_I	movre	%r20, 0x1, %r28
T3_asi_reg_wr_106:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 2165: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf4b54020  ! 2168: STHA_R	stha	%r26, [%r21 + %r0] 0x01
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, f)
	.word 0xb134e001  ! 2170: SRL_I	srl 	%r19, 0x0001, %r24
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 18)
	.word 0xfe740000  ! 2176: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf6a48020  ! 2178: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xfe24c000  ! 2179: STW_R	stw	%r31, [%r19 + %r0]
T3_asi_reg_rd_99:
	mov	0xd, %r14
	.word 0xf6db8e60  ! 2180: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf6b44020  ! 2181: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xbf643801  ! 2182: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_100:
	mov	0x28, %r14
	.word 0xf0db8e60  ! 2183: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_173:
	setx	0x2c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_174:
	setx	0x2c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x2f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_107:
	mov	0x13, %r14
	.word 0xf8f38e40  ! 2192: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf42ca0aa  ! 2193: STB_I	stb	%r26, [%r18 + 0x00aa]
	.word 0xf4ac60f3  ! 2195: STBA_I	stba	%r26, [%r17 + 0x00f3] %asi
T3_asi_reg_rd_101:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_wr_108:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 2201: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_rd_102:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_109:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 2205: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf82da1b7  ! 2206: STB_I	stb	%r28, [%r22 + 0x01b7]
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_103:
	mov	0x3, %r14
	.word 0xfedb84a0  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 2215: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 2216: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_105:
	mov	0x20, %r14
	.word 0xf8db8400  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbab5a114  ! 2221: SUBCcc_I	orncc 	%r22, 0x0114, %r29
	.word 0xf02d4000  ! 2225: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf8a50020  ! 2226: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_106:
	mov	0x18, %r14
	.word 0xf0db8400  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_176:
	setx	0x2e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_107:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 2239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf875604c  ! 2240: STX_I	stx	%r28, [%r21 + 0x004c]
	.word 0xfe348000  ! 2242: STH_R	sth	%r31, [%r18 + %r0]
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_108:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb48460bd  ! 2248: ADDcc_I	addcc 	%r17, 0x00bd, %r26
cpu_intr_3_177:
	setx	0x2e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_111:
	mov	0x15, %r14
	.word 0xfcf38e80  ! 2250: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_112:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 2253: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_178:
	setx	0x2c0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c60ba  ! 2258: STB_I	stb	%r25, [%r17 + 0x00ba]
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_179:
	setx	0x2e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_180:
	setx	0x208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6acc020  ! 2265: STBA_R	stba	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_113:
	mov	0x2d, %r14
	.word 0xfaf389e0  ! 2267: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfc240000  ! 2270: STW_R	stw	%r30, [%r16 + %r0]
T3_asi_reg_rd_109:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 2271: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe8cc000  ! 2276: ANDcc_R	andcc 	%r19, %r0, %r31
cpu_intr_3_181:
	setx	0x2d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 3)
	.word 0xbf341000  ! 2287: SRLX_R	srlx	%r16, %r0, %r31
	.word 0xf634c000  ! 2288: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf0752021  ! 2290: STX_I	stx	%r24, [%r20 + 0x0021]
	.word 0xf4250000  ! 2291: STW_R	stw	%r26, [%r20 + %r0]
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 36)
	.word 0xf62d4000  ! 2297: STB_R	stb	%r27, [%r21 + %r0]
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfaaca09d  ! 2303: STBA_I	stba	%r29, [%r18 + 0x009d] %asi
	.word 0xf4a52145  ! 2308: STWA_I	stwa	%r26, [%r20 + 0x0145] %asi
	.word 0xfc344000  ! 2309: STH_R	sth	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf82560c5  ! 2313: STW_I	stw	%r28, [%r21 + 0x00c5]
cpu_intr_3_182:
	setx	0x330208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3561b3  ! 2317: STH_I	sth	%r31, [%r21 + 0x01b3]
	.word 0xf8b5e1e4  ! 2320: STHA_I	stha	%r28, [%r23 + 0x01e4] %asi
	.word 0xb2954000  ! 2322: ORcc_R	orcc 	%r21, %r0, %r25
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 34)
	.word 0xbb3db001  ! 2326: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xfe252019  ! 2328: STW_I	stw	%r31, [%r20 + 0x0019]
T3_asi_reg_wr_114:
	mov	0xe, %r14
	.word 0xf0f38e80  ! 2329: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_183:
	setx	0x320007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_115:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2342: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 31)
	.word 0xfef52106  ! 2344: STXA_I	stxa	%r31, [%r20 + 0x0106] %asi
	.word 0xb7352001  ! 2345: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xf2b4a134  ! 2350: STHA_I	stha	%r25, [%r18 + 0x0134] %asi
	.word 0xf424e09c  ! 2352: STW_I	stw	%r26, [%r19 + 0x009c]
T3_asi_reg_rd_110:
	mov	0x28, %r14
	.word 0xf0db89e0  ! 2356: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf835a05b  ! 2358: STH_I	sth	%r28, [%r22 + 0x005b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6258000  ! 2360: STW_R	stw	%r27, [%r22 + %r0]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, c)
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfaac4020  ! 2365: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xf83520b7  ! 2366: STH_I	sth	%r28, [%r20 + 0x00b7]
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 36)
	.word 0xf22de13d  ! 2370: STB_I	stb	%r25, [%r23 + 0x013d]
cpu_intr_3_184:
	setx	0x32003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f82  ! 2373: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f82, %hpstate
T3_asi_reg_wr_116:
	mov	0x11, %r14
	.word 0xfcf38e60  ! 2379: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_185:
	setx	0x32000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025e1b2  ! 2382: STW_I	stw	%r24, [%r23 + 0x01b2]
	.word 0xf27421ba  ! 2384: STX_I	stx	%r25, [%r16 + 0x01ba]
	.word 0xf475e12e  ! 2386: STX_I	stx	%r26, [%r23 + 0x012e]
cpu_intr_3_186:
	setx	0x300123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_187:
	setx	0x33021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d4000  ! 2393: XNOR_R	xnor 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 2397: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf2b4e1e2  ! 2398: STHA_I	stha	%r25, [%r19 + 0x01e2] %asi
	.word 0xbb2c8000  ! 2399: SLL_R	sll 	%r18, %r0, %r29
	.word 0xfca44020  ! 2400: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
T3_asi_reg_wr_117:
	mov	0xb, %r14
	.word 0xf8f389e0  ! 2401: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_188:
	setx	0x33010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc244000  ! 2406: STW_R	stw	%r30, [%r17 + %r0]
cpu_intr_3_189:
	setx	0x330013, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_112:
	mov	0x2b, %r14
	.word 0xf0db84a0  ! 2410: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf2a520b0  ! 2413: STWA_I	stwa	%r25, [%r20 + 0x00b0] %asi
	.word 0xf2a40020  ! 2415: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
T3_asi_reg_rd_113:
	mov	0x10, %r14
	.word 0xf2db84a0  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfa2cc000  ! 2418: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xbd2d4000  ! 2420: SLL_R	sll 	%r21, %r0, %r30
cpu_intr_3_190:
	setx	0x320227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_191:
	setx	0x300304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_192:
	setx	0x30003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_114:
	mov	0x8, %r14
	.word 0xfcdb8e40  ! 2424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_193:
	setx	0x30002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35c000  ! 2427: STH_R	sth	%r29, [%r23 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf8a5c020  ! 2439: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_115:
	mov	0xd, %r14
	.word 0xf0db8400  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf2f421d5  ! 2442: STXA_I	stxa	%r25, [%r16 + 0x01d5] %asi
T3_asi_reg_rd_116:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb405c000  ! 2445: ADD_R	add 	%r23, %r0, %r26
	.word 0xf8b46107  ! 2448: STHA_I	stha	%r28, [%r17 + 0x0107] %asi
	.word 0xfa754000  ! 2450: STX_R	stx	%r29, [%r21 + %r0]
T3_asi_reg_rd_117:
	mov	0x27, %r14
	.word 0xfadb8400  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_194:
	setx	0x33020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_195:
	setx	0x300106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34202e  ! 2460: STH_I	sth	%r30, [%r16 + 0x002e]
	.word 0xf0a50020  ! 2461: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_118:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 2463: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb63d613d  ! 2464: XNOR_I	xnor 	%r21, 0x013d, %r27
	.word 0xf625208d  ! 2465: STW_I	stw	%r27, [%r20 + 0x008d]
	.word 0xfcad8020  ! 2470: STBA_R	stba	%r30, [%r22 + %r0] 0x01
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 28)
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819828d0  ! 2472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d0, %hpstate
cpu_intr_3_196:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe342027  ! 2475: STH_I	sth	%r31, [%r16 + 0x0027]
cpu_intr_3_197:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_198:
	setx	0x30011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_119:
	mov	0x1, %r14
	.word 0xf0f38e40  ! 2482: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0ad4020  ! 2483: STBA_R	stba	%r24, [%r21 + %r0] 0x01
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 2)
	.word 0xf635604a  ! 2489: STH_I	sth	%r27, [%r21 + 0x004a]
cpu_intr_3_199:
	setx	0x330227, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_120:
	mov	0x30, %r14
	.word 0xf8f38e60  ! 2497: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 31)
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d48  ! 2502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d48, %hpstate
T3_asi_reg_wr_121:
	mov	0x8, %r14
	.word 0xfaf38e80  ! 2504: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf0348000  ! 2505: STH_R	sth	%r24, [%r18 + %r0]
T3_asi_reg_wr_122:
	mov	0x0, %r14
	.word 0xf6f38e80  ! 2506: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4248000  ! 2508: STW_R	stw	%r26, [%r18 + %r0]
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a0a  ! 2513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0a, %hpstate
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfeb4e179  ! 2524: STHA_I	stha	%r31, [%r19 + 0x0179] %asi
	.word 0xf8f56006  ! 2525: STXA_I	stxa	%r28, [%r21 + 0x0006] %asi
	.word 0xf6a4e173  ! 2528: STWA_I	stwa	%r27, [%r19 + 0x0173] %asi
	.word 0xf0ac0020  ! 2533: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xb694e1a8  ! 2536: ORcc_I	orcc 	%r19, 0x01a8, %r27
T3_asi_reg_rd_118:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf42d21a8  ! 2539: STB_I	stb	%r26, [%r20 + 0x01a8]
	.word 0xf2b46117  ! 2541: STHA_I	stha	%r25, [%r17 + 0x0117] %asi
	.word 0xf0258000  ! 2543: STW_R	stw	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xfe34600b  ! 2548: STH_I	sth	%r31, [%r17 + 0x000b]
cpu_intr_3_200:
	setx	0x300031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_201:
	setx	0x320216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63521a6  ! 2552: SUBC_I	orn 	%r20, 0x01a6, %r27
cpu_intr_3_202:
	setx	0x310312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_123:
	mov	0x31, %r14
	.word 0xf4f389e0  ! 2556: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2aca064  ! 2558: STBA_I	stba	%r25, [%r18 + 0x0064] %asi
	.word 0xb005618f  ! 2560: ADD_I	add 	%r21, 0x018f, %r24
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_124:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2565: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf82c61e4  ! 2570: STB_I	stb	%r28, [%r17 + 0x01e4]
	.word 0xba9d8000  ! 2572: XORcc_R	xorcc 	%r22, %r0, %r29
cpu_intr_3_203:
	setx	0x30021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac5e0e5  ! 2574: ADDCcc_I	addccc 	%r23, 0x00e5, %r29
cpu_intr_3_204:
	setx	0x310337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ad8000  ! 2578: ANDNcc_R	andncc 	%r22, %r0, %r26
T3_asi_reg_rd_119:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 2580: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, d)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_205:
	setx	0x330034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 1)
	.word 0xb88da0e8  ! 2590: ANDcc_I	andcc 	%r22, 0x00e8, %r28
	.word 0xfea44020  ! 2592: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	.word 0xb4444000  ! 2593: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xf42c6028  ! 2594: STB_I	stb	%r26, [%r17 + 0x0028]
	.word 0xfe2d60c9  ! 2595: STB_I	stb	%r31, [%r21 + 0x00c9]
	.word 0xf4246150  ! 2596: STW_I	stw	%r26, [%r17 + 0x0150]
	.word 0xf02421e3  ! 2597: STW_I	stw	%r24, [%r16 + 0x01e3]
	.word 0xbaac6001  ! 2598: ANDNcc_I	andncc 	%r17, 0x0001, %r29
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf034a025  ! 2600: STH_I	sth	%r24, [%r18 + 0x0025]
	.word 0xfaa4202a  ! 2603: STWA_I	stwa	%r29, [%r16 + 0x002a] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xbb34d000  ! 2608: SRLX_R	srlx	%r19, %r0, %r29
T3_asi_reg_rd_120:
	mov	0x4, %r14
	.word 0xf8db8e40  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc748000  ! 2613: STX_R	stx	%r30, [%r18 + %r0]
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_206:
	setx	0x310218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635e122  ! 2620: STH_I	sth	%r27, [%r23 + 0x0122]
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf2b4a1a3  ! 2622: STHA_I	stha	%r25, [%r18 + 0x01a3] %asi
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfc2c8000  ! 2628: STB_R	stb	%r30, [%r18 + %r0]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb29ce0fa  ! 2630: XORcc_I	xorcc 	%r19, 0x00fa, %r25
	.word 0xf4f5e05a  ! 2631: STXA_I	stxa	%r26, [%r23 + 0x005a] %asi
T3_asi_reg_rd_121:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 2632: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 2635: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf4258000  ! 2641: STW_R	stw	%r26, [%r22 + %r0]
T3_asi_reg_rd_122:
	mov	0x34, %r14
	.word 0xfcdb84a0  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_126:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 2649: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_127:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 2650: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf22d8000  ! 2651: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xbe1dc000  ! 2652: XOR_R	xor 	%r23, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb9643801  ! 2655: MOVcc_I	<illegal instruction>
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_128:
	mov	0x28, %r14
	.word 0xf4f384a0  ! 2659: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbc15217c  ! 2660: OR_I	or 	%r20, 0x017c, %r30
cpu_intr_3_207:
	setx	0x310211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ace00e  ! 2664: STBA_I	stba	%r25, [%r19 + 0x000e] %asi
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf2b5a112  ! 2670: STHA_I	stha	%r25, [%r22 + 0x0112] %asi
T3_asi_reg_rd_123:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf8b40020  ! 2673: STHA_R	stha	%r28, [%r16 + %r0] 0x01
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 3)
	.word 0xbaa44000  ! 2675: SUBcc_R	subcc 	%r17, %r0, %r29
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf8752191  ! 2678: STX_I	stx	%r28, [%r20 + 0x0191]
	.word 0xfaa521a3  ! 2679: STWA_I	stwa	%r29, [%r20 + 0x01a3] %asi
T3_asi_reg_rd_124:
	mov	0x6, %r14
	.word 0xf0db84a0  ! 2680: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe256161  ! 2681: STW_I	stw	%r31, [%r21 + 0x0161]
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_208:
	setx	0x31013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_209:
	setx	0x330212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8350000  ! 2691: STH_R	sth	%r28, [%r20 + %r0]
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, e)
	.word 0xf0ac0020  ! 2700: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xb48c6075  ! 2702: ANDcc_I	andcc 	%r17, 0x0075, %r26
	.word 0xfea48020  ! 2703: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xf4358000  ! 2705: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xb49ce101  ! 2706: XORcc_I	xorcc 	%r19, 0x0101, %r26
cpu_intr_3_210:
	setx	0x30000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 19)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_129:
	mov	0x1b, %r14
	.word 0xfaf389e0  ! 2711: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf4ad8020  ! 2712: STBA_R	stba	%r26, [%r22 + %r0] 0x01
cpu_intr_3_211:
	setx	0x33011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_212:
	setx	0x310022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834e1da  ! 2716: STH_I	sth	%r28, [%r19 + 0x01da]
T3_asi_reg_wr_130:
	mov	0x7, %r14
	.word 0xfcf389e0  ! 2717: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf0ac0020  ! 2718: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xbb7de401  ! 2719: MOVR_I	movre	%r23, 0x1, %r29
T3_asi_reg_wr_131:
	mov	0x1e, %r14
	.word 0xf4f38400  ! 2720: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 7)
	.word 0xf6b48020  ! 2726: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xfe25615d  ! 2727: STW_I	stw	%r31, [%r21 + 0x015d]
	.word 0xfca58020  ! 2728: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 3f)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_213:
	setx	0x32003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_214:
	setx	0x330204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_125:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 2741: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 33)
	.word 0xfc25c000  ! 2746: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf0748000  ! 2748: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf8354000  ! 2749: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf62d8000  ! 2751: STB_R	stb	%r27, [%r22 + %r0]
T3_asi_reg_wr_132:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 2753: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 39)
	.word 0xb150c000  ! 2762: RDPR_TT	rdpr	%tt, %r24
T3_asi_reg_rd_126:
	mov	0x2b, %r14
	.word 0xfcdb8e80  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_rd_127:
	mov	0x12, %r14
	.word 0xfedb8400  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbe24c000  ! 2767: SUB_R	sub 	%r19, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa4e05e  ! 2770: STWA_I	stwa	%r29, [%r19 + 0x005e] %asi
	.word 0xf22c0000  ! 2771: STB_R	stb	%r25, [%r16 + %r0]
cpu_intr_3_215:
	setx	0x36031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4246199  ! 2774: STW_I	stw	%r26, [%r17 + 0x0199]
cpu_intr_3_216:
	setx	0x350300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6740000  ! 2777: STX_R	stx	%r27, [%r16 + %r0]
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_128:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_217:
	setx	0x340217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef561a3  ! 2789: STXA_I	stxa	%r31, [%r21 + 0x01a3] %asi
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_133:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2797: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_134:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 2803: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 31)
	.word 0xbe348000  ! 2808: SUBC_R	orn 	%r18, %r0, %r31
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 27)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_129:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 2814: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfcacc020  ! 2815: STBA_R	stba	%r30, [%r19 + %r0] 0x01
T3_asi_reg_wr_135:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 2816: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_218:
	setx	0x340305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_219:
	setx	0x37032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_136:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 2823: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_220:
	setx	0x34000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_130:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf834e092  ! 2827: STH_I	sth	%r28, [%r19 + 0x0092]
	.word 0xf6b4e092  ! 2828: STHA_I	stha	%r27, [%r19 + 0x0092] %asi
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_131:
	mov	0x1, %r14
	.word 0xf0db8e40  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6ac0020  ! 2832: STBA_R	stba	%r27, [%r16 + %r0] 0x01
T3_asi_reg_wr_137:
	mov	0x24, %r14
	.word 0xfef38e40  ! 2834: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcb5c020  ! 2836: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf8748000  ! 2838: STX_R	stx	%r28, [%r18 + %r0]
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_221:
	setx	0x35020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_222:
	setx	0x35002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224a0d3  ! 2848: STW_I	stw	%r25, [%r18 + 0x00d3]
	.word 0xf62dc000  ! 2852: STB_R	stb	%r27, [%r23 + %r0]
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 10)
	.word 0xb4c4c000  ! 2856: ADDCcc_R	addccc 	%r19, %r0, %r26
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a82  ! 2859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
cpu_intr_3_223:
	setx	0x37022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4e038  ! 2862: STWA_I	stwa	%r31, [%r19 + 0x0038] %asi
T3_asi_reg_rd_132:
	mov	0x20, %r14
	.word 0xfedb8e40  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, b)
	.word 0xfca4611d  ! 2872: STWA_I	stwa	%r30, [%r17 + 0x011d] %asi
	.word 0xf4ad4020  ! 2873: STBA_R	stba	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_133:
	mov	0x2e, %r14
	.word 0xf2db89e0  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf0a4e159  ! 2880: STWA_I	stwa	%r24, [%r19 + 0x0159] %asi
	.word 0xbf2cf001  ! 2887: SLLX_I	sllx	%r19, 0x0001, %r31
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 20)
	.word 0xf02c2004  ! 2891: STB_I	stb	%r24, [%r16 + 0x0004]
cpu_intr_3_224:
	setx	0x370001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_225:
	setx	0x37022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_138:
	mov	0x27, %r14
	.word 0xf0f38e60  ! 2899: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_226:
	setx	0x35001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_227:
	setx	0x34013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25217e  ! 2903: STW_I	stw	%r29, [%r20 + 0x017e]
cpu_intr_3_228:
	setx	0x34033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b52122  ! 2905: STHA_I	stha	%r28, [%r20 + 0x0122] %asi
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 16)
	.word 0xbb641800  ! 2908: MOVcc_R	<illegal instruction>
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_134:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf83421b1  ! 2915: STH_I	sth	%r28, [%r16 + 0x01b1]
	.word 0x8d95e017  ! 2916: WRPR_PSTATE_I	wrpr	%r23, 0x0017, %pstate
	.word 0xbd2dd000  ! 2917: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xb23420f1  ! 2918: SUBC_I	orn 	%r16, 0x00f1, %r25
cpu_intr_3_229:
	setx	0x360319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_230:
	setx	0x370038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeaca1ad  ! 2928: STBA_I	stba	%r31, [%r18 + 0x01ad] %asi
	.word 0xf4a54020  ! 2929: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_139:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 2933: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0x8995e1db  ! 2934: WRPR_TICK_I	wrpr	%r23, 0x01db, %tick
	ta	T_CHANGE_NONHPRIV
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 9)
	.word 0xf6b52004  ! 2942: STHA_I	stha	%r27, [%r20 + 0x0004] %asi
cpu_intr_3_231:
	setx	0x360224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4a01d  ! 2945: STWA_I	stwa	%r26, [%r18 + 0x001d] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfab4c020  ! 2948: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_140:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2955: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_135:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983d5a  ! 2961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5a, %hpstate
T3_asi_reg_wr_141:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 2967: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf02dc000  ! 2969: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xfeada1e4  ! 2970: STBA_I	stba	%r31, [%r22 + 0x01e4] %asi
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 16)
	.word 0xfa750000  ! 2972: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xf0ad6138  ! 2976: STBA_I	stba	%r24, [%r21 + 0x0138] %asi
cpu_intr_3_232:
	setx	0x350038, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_136:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 2981: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_TO_TL1
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_142:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 2992: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_233:
	setx	0x350038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f4e195  ! 2995: STXA_I	stxa	%r27, [%r19 + 0x0195] %asi
cpu_intr_3_234:
	setx	0x30216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a461dc  ! 2999: STWA_I	stwa	%r26, [%r17 + 0x01dc] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xfaacc020  ! 3001: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf62de077  ! 3004: STB_I	stb	%r27, [%r23 + 0x0077]
T3_asi_reg_wr_143:
	mov	0x23, %r14
	.word 0xf8f389e0  ! 3007: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8ac8020  ! 3014: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xfab5e13c  ! 3016: STHA_I	stha	%r29, [%r23 + 0x013c] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_137:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_235:
	setx	0x37021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_138:
	mov	0x1e, %r14
	.word 0xfadb89e0  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf6acc020  ! 3026: STBA_R	stba	%r27, [%r19 + %r0] 0x01
cpu_intr_3_236:
	setx	0x340233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f4a083  ! 3028: STXA_I	stxa	%r26, [%r18 + 0x0083] %asi
	.word 0xb2bc4000  ! 3029: XNORcc_R	xnorcc 	%r17, %r0, %r25
cpu_intr_3_237:
	setx	0x35032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_139:
	mov	0x28, %r14
	.word 0xf6db8e60  ! 3031: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfe2d4000  ! 3036: STB_R	stb	%r31, [%r21 + %r0]
cpu_intr_3_238:
	setx	0x360023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424a0c5  ! 3039: STW_I	stw	%r26, [%r18 + 0x00c5]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_144:
	mov	0x14, %r14
	.word 0xf4f38400  ! 3046: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_239:
	setx	0x1d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4e04a  ! 3050: STHA_I	stha	%r25, [%r19 + 0x004a] %asi
	.word 0xf874618e  ! 3051: STX_I	stx	%r28, [%r17 + 0x018e]
cpu_intr_3_240:
	setx	0x350123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4a178  ! 3056: STHA_I	stha	%r30, [%r18 + 0x0178] %asi
T3_asi_reg_rd_140:
	mov	0xa, %r14
	.word 0xf0db89e0  ! 3057: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf235e0b8  ! 3058: STH_I	sth	%r25, [%r23 + 0x00b8]
cpu_intr_3_241:
	setx	0x36003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa750000  ! 3064: STX_R	stx	%r29, [%r20 + %r0]
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 3)
	.word 0xb435a105  ! 3073: ORN_I	orn 	%r22, 0x0105, %r26
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_145:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 3078: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_146:
	mov	0x4, %r14
	.word 0xf4f38e80  ! 3081: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf4b4203a  ! 3085: STHA_I	stha	%r26, [%r16 + 0x003a] %asi
	.word 0xf234616d  ! 3086: STH_I	sth	%r25, [%r17 + 0x016d]
	.word 0xfe2c0000  ! 3090: STB_R	stb	%r31, [%r16 + %r0]
cpu_intr_3_242:
	setx	0x340235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad4020  ! 3092: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_141:
	mov	0x2d, %r14
	.word 0xf4db89e0  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf4254000  ! 3096: STW_R	stw	%r26, [%r21 + %r0]
T3_asi_reg_wr_147:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 3098: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf0258000  ! 3102: STW_R	stw	%r24, [%r22 + %r0]
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_243:
	setx	0x34030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a48020  ! 3112: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf4ac2043  ! 3113: STBA_I	stba	%r26, [%r16 + 0x0043] %asi
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_244:
	setx	0x360327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_245:
	setx	0x35021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2520bd  ! 3124: STW_I	stw	%r29, [%r20 + 0x00bd]
cpu_intr_3_246:
	setx	0x340233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 10)
	.word 0xf0748000  ! 3131: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xbc1d2042  ! 3134: XOR_I	xor 	%r20, 0x0042, %r30
	.word 0xfa346199  ! 3135: STH_I	sth	%r29, [%r17 + 0x0199]
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 35)
	.word 0xf0256120  ! 3139: STW_I	stw	%r24, [%r21 + 0x0120]
T3_asi_reg_rd_142:
	mov	0x1, %r14
	.word 0xfcdb8400  ! 3140: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_247:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_143:
	mov	0x24, %r14
	.word 0xfcdb84a0  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf0f4a105  ! 3143: STXA_I	stxa	%r24, [%r18 + 0x0105] %asi
	.word 0xfc250000  ! 3148: STW_R	stw	%r30, [%r20 + %r0]
T3_asi_reg_wr_148:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 3150: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_248:
	setx	0x370007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_249:
	setx	0x340138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6254000  ! 3156: STW_R	stw	%r27, [%r21 + %r0]
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_144:
	mov	0x0, %r14
	.word 0xf8db8e60  ! 3164: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_250:
	setx	0x360012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_251:
	setx	0x34002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_252:
	setx	0x360019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_253:
	setx	0x340120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_254:
	setx	0x35001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_255:
	setx	0x340339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_256:
	setx	0x370006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac8020  ! 3190: STBA_R	stba	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_145:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 3192: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_146:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_257:
	setx	0x36023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_149:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 3206: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_150:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 3207: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 11)
	.word 0xf0a4608c  ! 3209: STWA_I	stwa	%r24, [%r17 + 0x008c] %asi
	.word 0xf6b44020  ! 3210: STHA_R	stha	%r27, [%r17 + %r0] 0x01
T3_asi_reg_wr_151:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 3211: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf0246088  ! 3221: STW_I	stw	%r24, [%r17 + 0x0088]
T3_asi_reg_rd_147:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 3224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0b50020  ! 3225: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xf2b4a145  ! 3228: STHA_I	stha	%r25, [%r18 + 0x0145] %asi
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_148:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 2d)
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b10  ! 3239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b10, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xfcb50020  ! 3245: STHA_R	stha	%r30, [%r20 + %r0] 0x01
cpu_intr_3_258:
	setx	0x3a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_149:
	mov	0x30, %r14
	.word 0xf0db8400  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfcace1bc  ! 3249: STBA_I	stba	%r30, [%r19 + 0x01bc] %asi
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_152:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 3254: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_259:
	setx	0x390135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb835c000  ! 3257: ORN_R	orn 	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0xfaa54020  ! 3259: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xf4a5212d  ! 3260: STWA_I	stwa	%r26, [%r20 + 0x012d] %asi
	.word 0xfc750000  ! 3263: STX_R	stx	%r30, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_260:
	setx	0x3b031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_261:
	setx	0x380105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074c000  ! 3273: STX_R	stx	%r24, [%r19 + %r0]
cpu_intr_3_262:
	setx	0x39002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8244000  ! 3276: STW_R	stw	%r28, [%r17 + %r0]
cpu_intr_3_263:
	setx	0x3b000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_264:
	setx	0x3a012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b54020  ! 3284: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf425e07c  ! 3292: STW_I	stw	%r26, [%r23 + 0x007c]
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_150:
	mov	0x24, %r14
	.word 0xf0db8e40  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2348000  ! 3299: STH_R	sth	%r25, [%r18 + %r0]
T3_asi_reg_rd_151:
	mov	0x3, %r14
	.word 0xf8db8e40  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 12)
	.word 0xbb2ca001  ! 3303: SLL_I	sll 	%r18, 0x0001, %r29
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 30)
	.word 0xf425a0a9  ! 3306: STW_I	stw	%r26, [%r22 + 0x00a9]
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf2ace0ed  ! 3313: STBA_I	stba	%r25, [%r19 + 0x00ed] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfaadc020  ! 3315: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xf0ad0020  ! 3316: STBA_R	stba	%r24, [%r20 + %r0] 0x01
cpu_intr_3_265:
	setx	0x3a022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_152:
	mov	0x2a, %r14
	.word 0xf2db8400  ! 3319: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_266:
	setx	0x38000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2344000  ! 3325: SUBC_R	orn 	%r17, %r0, %r25
	.word 0xf4748000  ! 3326: STX_R	stx	%r26, [%r18 + %r0]
cpu_intr_3_267:
	setx	0x39023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b50  ! 3329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
	.word 0xf4a48020  ! 3330: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
cpu_intr_3_268:
	setx	0x3a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 3334: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf4242152  ! 3336: STW_I	stw	%r26, [%r16 + 0x0152]
T3_asi_reg_rd_153:
	mov	0x12, %r14
	.word 0xf6db8400  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_154:
	mov	0x11, %r14
	.word 0xf2db8e40  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf42d4000  ! 3344: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xfe34a018  ! 3346: STH_I	sth	%r31, [%r18 + 0x0018]
	.word 0xf2348000  ! 3347: STH_R	sth	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_269:
	setx	0x3a0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c600d  ! 3353: STB_I	stb	%r28, [%r17 + 0x000d]
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 39)
	.word 0xfe2d219d  ! 3357: STB_I	stb	%r31, [%r20 + 0x019d]
cpu_intr_3_270:
	setx	0x38032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_155:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_156:
	mov	0x8, %r14
	.word 0xf6db8400  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_153:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 3368: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe75e039  ! 3369: STX_I	stx	%r31, [%r23 + 0x0039]
T3_asi_reg_wr_154:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 3375: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb12cf001  ! 3376: SLLX_I	sllx	%r19, 0x0001, %r24
	.word 0xb645e1e4  ! 3377: ADDC_I	addc 	%r23, 0x01e4, %r27
	.word 0xf8a5c020  ! 3378: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_157:
	mov	0x8, %r14
	.word 0xf4db84a0  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfa74206d  ! 3381: STX_I	stx	%r29, [%r16 + 0x006d]
	ta	T_CHANGE_TO_TL0
	.word 0xfc75e17b  ! 3384: STX_I	stx	%r30, [%r23 + 0x017b]
	.word 0xf4ad4020  ! 3387: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xfaace11b  ! 3392: STBA_I	stba	%r29, [%r19 + 0x011b] %asi
cpu_intr_3_271:
	setx	0x3b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_272:
	setx	0x39011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_158:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_155:
	mov	0x26, %r14
	.word 0xf8f38e80  ! 3403: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_156:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3405: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfead61bd  ! 3406: STBA_I	stba	%r31, [%r21 + 0x01bd] %asi
	.word 0xf4746116  ! 3409: STX_I	stx	%r26, [%r17 + 0x0116]
	.word 0xf625c000  ! 3410: STW_R	stw	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_273:
	setx	0x39011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8746090  ! 3414: STX_I	stx	%r28, [%r17 + 0x0090]
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_274:
	setx	0x38001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_275:
	setx	0x390003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 3421: RDPR_PIL	rdpr	%pil, %r28
	.word 0xb20c21e3  ! 3423: AND_I	and 	%r16, 0x01e3, %r25
	.word 0xf025c000  ! 3424: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xfcb5e130  ! 3428: STHA_I	stha	%r30, [%r23 + 0x0130] %asi
	.word 0xf22c0000  ! 3429: STB_R	stb	%r25, [%r16 + %r0]
cpu_intr_3_276:
	setx	0x3b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_277:
	setx	0x38000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_159:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfc35e0a8  ! 3442: STH_I	sth	%r30, [%r23 + 0x00a8]
	.word 0xbc35a0c0  ! 3443: SUBC_I	orn 	%r22, 0x00c0, %r30
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfab50020  ! 3446: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xfaad0020  ! 3447: STBA_R	stba	%r29, [%r20 + %r0] 0x01
cpu_intr_3_278:
	setx	0x38021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa350000  ! 3449: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf8ac4020  ! 3451: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_279:
	setx	0x380014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2242127  ! 3454: STW_I	stw	%r25, [%r16 + 0x0127]
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_TO_TL0
	.word 0xbf2d9000  ! 3462: SLLX_R	sllx	%r22, %r0, %r31
	.word 0xfc2461b3  ! 3465: STW_I	stw	%r30, [%r17 + 0x01b3]
cpu_intr_3_280:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 20)
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982880  ! 3471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
cpu_intr_3_281:
	setx	0x39031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 6)
	.word 0xf22da076  ! 3474: STB_I	stb	%r25, [%r22 + 0x0076]
T3_asi_reg_rd_160:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 3475: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfca54020  ! 3477: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
T3_asi_reg_wr_157:
	mov	0x1d, %r14
	.word 0xfaf38e80  ! 3479: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_TO_TL1
	.word 0xf8a56009  ! 3486: STWA_I	stwa	%r28, [%r21 + 0x0009] %asi
	.word 0xfca421e5  ! 3487: STWA_I	stwa	%r30, [%r16 + 0x01e5] %asi
	.word 0xfa254000  ! 3489: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf2b4a0a8  ! 3494: STHA_I	stha	%r25, [%r18 + 0x00a8] %asi
T3_asi_reg_rd_161:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbc8ca1ed  ! 3496: ANDcc_I	andcc 	%r18, 0x01ed, %r30
cpu_intr_3_282:
	setx	0x3b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_283:
	setx	0x39020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_162:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_284:
	setx	0x380110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe244000  ! 3506: STW_R	stw	%r31, [%r17 + %r0]
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, a)
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_163:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3510: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_164:
	mov	0xa, %r14
	.word 0xf2db8400  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf0b5c020  ! 3512: STHA_R	stha	%r24, [%r23 + %r0] 0x01
cpu_intr_3_285:
	setx	0x390137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24e058  ! 3514: STW_I	stw	%r30, [%r19 + 0x0058]
	.word 0xf02d202b  ! 3515: STB_I	stb	%r24, [%r20 + 0x002b]
	.word 0xfa2d8000  ! 3516: STB_R	stb	%r29, [%r22 + %r0]
T3_asi_reg_rd_165:
	mov	0xd, %r14
	.word 0xf4db8e40  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf2244000  ! 3519: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf2a48020  ! 3520: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
T3_asi_reg_wr_158:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 3522: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf2754000  ! 3524: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xb934f001  ! 3525: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xf6adc020  ! 3529: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xba0ca17d  ! 3533: AND_I	and 	%r18, 0x017d, %r29
T3_asi_reg_rd_166:
	mov	0x33, %r14
	.word 0xf8db84a0  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d12  ! 3535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d12, %hpstate
T3_asi_reg_wr_159:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 3539: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_286:
	setx	0x3a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_160:
	mov	0x2c, %r14
	.word 0xf2f38400  ! 3551: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_167:
	mov	0x33, %r14
	.word 0xfadb8400  ! 3554: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_161:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 3556: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c80  ! 3557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_168:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 3562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4746034  ! 3565: STX_I	stx	%r26, [%r17 + 0x0034]
	ta	T_CHANGE_TO_TL0
	.word 0xfa75c000  ! 3568: STX_R	stx	%r29, [%r23 + %r0]
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_287:
	setx	0x39033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a5e12c  ! 3573: SUBcc_I	subcc 	%r23, 0x012c, %r27
	.word 0xf674e0d3  ! 3574: STX_I	stx	%r27, [%r19 + 0x00d3]
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 5)
	.word 0xf035608f  ! 3577: STH_I	sth	%r24, [%r21 + 0x008f]
	.word 0xfab4a108  ! 3578: STHA_I	stha	%r29, [%r18 + 0x0108] %asi
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 23)
	.word 0xf82da06d  ! 3587: STB_I	stb	%r28, [%r22 + 0x006d]
T3_asi_reg_wr_162:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 3588: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_288:
	setx	0x39030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634a025  ! 3592: STH_I	sth	%r27, [%r18 + 0x0025]
cpu_intr_3_289:
	setx	0x3a0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_290:
	setx	0x3b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_163:
	mov	0x37, %r14
	.word 0xfcf38e60  ! 3604: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf2f461ab  ! 3605: STXA_I	stxa	%r25, [%r17 + 0x01ab] %asi
	.word 0xf2b52145  ! 3606: STHA_I	stha	%r25, [%r20 + 0x0145] %asi
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, c)
	.word 0xbf35a001  ! 3614: SRL_I	srl 	%r22, 0x0001, %r31
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982fca  ! 3618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fca, %hpstate
	.word 0xf07560c5  ! 3619: STX_I	stx	%r24, [%r21 + 0x00c5]
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 25)
	.word 0xfc34a135  ! 3626: STH_I	sth	%r30, [%r18 + 0x0135]
cpu_intr_3_291:
	setx	0x3a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_164:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3633: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, b)
	.word 0xf82c8000  ! 3641: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xb62c8000  ! 3643: ANDN_R	andn 	%r18, %r0, %r27
cpu_intr_3_292:
	setx	0x390131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3dc000  ! 3648: XNOR_R	xnor 	%r23, %r0, %r29
T3_asi_reg_rd_169:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_165:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 3650: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 2)
	.word 0xfaa5610c  ! 3654: STWA_I	stwa	%r29, [%r21 + 0x010c] %asi
	.word 0xf6b54020  ! 3656: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_293:
	setx	0x3a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4256027  ! 3664: STW_I	stw	%r26, [%r21 + 0x0027]
	.word 0xb9518000  ! 3666: RDPR_PSTATE	rdpr	%pstate, %r28
cpu_intr_3_294:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834e0ab  ! 3671: STH_I	sth	%r28, [%r19 + 0x00ab]
	.word 0xfe3461b0  ! 3672: STH_I	sth	%r31, [%r17 + 0x01b0]
	.word 0xfeb5c020  ! 3674: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xfca460fa  ! 3677: STWA_I	stwa	%r30, [%r17 + 0x00fa] %asi
	.word 0xf2f5a17c  ! 3679: STXA_I	stxa	%r25, [%r22 + 0x017c] %asi
T3_asi_reg_rd_170:
	mov	0x9, %r14
	.word 0xfadb84a0  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_171:
	mov	0xd, %r14
	.word 0xfcdb89e0  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_295:
	setx	0x38020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_166:
	mov	0x1, %r14
	.word 0xf6f38400  ! 3693: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf2a44020  ! 3699: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_167:
	mov	0x2f, %r14
	.word 0xf8f389e0  ! 3702: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb33db001  ! 3704: SRAX_I	srax	%r22, 0x0001, %r25
	.word 0xfaade10a  ! 3705: STBA_I	stba	%r29, [%r23 + 0x010a] %asi
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_296:
	setx	0x3f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_297:
	setx	0x3e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_168:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 3714: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_172:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfc34e058  ! 3719: STH_I	sth	%r30, [%r19 + 0x0058]
cpu_intr_3_298:
	setx	0x3f0109, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_169:
	mov	0x25, %r14
	.word 0xf4f38400  ! 3723: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_299:
	setx	0x3d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_173:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_174:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfeaca1dd  ! 3735: STBA_I	stba	%r31, [%r18 + 0x01dd] %asi
	.word 0xb4254000  ! 3739: SUB_R	sub 	%r21, %r0, %r26
T3_asi_reg_rd_175:
	mov	0x0, %r14
	.word 0xf4db8e80  ! 3740: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0x8394e171  ! 3741: WRPR_TNPC_I	wrpr	%r19, 0x0171, %tnpc
cpu_intr_3_300:
	setx	0x3f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35600c  ! 3744: STH_I	sth	%r29, [%r21 + 0x000c]
	.word 0xf4b5214a  ! 3745: STHA_I	stha	%r26, [%r20 + 0x014a] %asi
T3_asi_reg_rd_176:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 3751: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf4248000  ! 3752: STW_R	stw	%r26, [%r18 + %r0]
T3_asi_reg_rd_177:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf0a40020  ! 3755: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
T3_asi_reg_rd_178:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf82ca0e7  ! 3757: STB_I	stb	%r28, [%r18 + 0x00e7]
	.word 0xb52cd000  ! 3759: SLLX_R	sllx	%r19, %r0, %r26
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 29)
	.word 0xf8b4c020  ! 3761: STHA_R	stha	%r28, [%r19 + %r0] 0x01
cpu_intr_3_301:
	setx	0x3f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 3c)
	.word 0xbe9da1ce  ! 3768: XORcc_I	xorcc 	%r22, 0x01ce, %r31
T3_asi_reg_wr_170:
	mov	0x15, %r14
	.word 0xfef38e60  ! 3770: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb4a5c000  ! 3771: SUBcc_R	subcc 	%r23, %r0, %r26
T3_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 3772: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6740000  ! 3773: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf435a146  ! 3774: STH_I	sth	%r26, [%r22 + 0x0146]
cpu_intr_3_302:
	setx	0x3d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf2754000  ! 3778: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfe346084  ! 3779: STH_I	sth	%r31, [%r17 + 0x0084]
	.word 0xf82c20f4  ! 3780: STB_I	stb	%r28, [%r16 + 0x00f4]
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 23)
	.word 0xf634605e  ! 3784: STH_I	sth	%r27, [%r17 + 0x005e]
	.word 0xf22c4000  ! 3785: STB_R	stb	%r25, [%r17 + %r0]
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_171:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 3789: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_303:
	setx	0x3e0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 3795: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f4217c  ! 3798: STXA_I	stxa	%r27, [%r16 + 0x017c] %asi
	.word 0xf6250000  ! 3799: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf835a1bc  ! 3800: STH_I	sth	%r28, [%r22 + 0x01bc]
	.word 0xf4f56100  ! 3802: STXA_I	stxa	%r26, [%r21 + 0x0100] %asi
	.word 0xf2a4606a  ! 3803: STWA_I	stwa	%r25, [%r17 + 0x006a] %asi
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_304:
	setx	0x3c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad0020  ! 3808: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_180:
	mov	0x2c, %r14
	.word 0xfedb8e60  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_305:
	setx	0x3e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_306:
	setx	0x3d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a44020  ! 3814: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
T3_asi_reg_rd_181:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_182:
	mov	0x1b, %r14
	.word 0xf6db89e0  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfa348000  ! 3823: STH_R	sth	%r29, [%r18 + %r0]
T3_asi_reg_rd_183:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 3824: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbe45a1be  ! 3827: ADDC_I	addc 	%r22, 0x01be, %r31
cpu_intr_3_307:
	setx	0x3e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfc2c4000  ! 3835: STB_R	stb	%r30, [%r17 + %r0]
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 32)
	.word 0xb0858000  ! 3838: ADDcc_R	addcc 	%r22, %r0, %r24
cpu_intr_3_308:
	setx	0x3d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_309:
	setx	0x3f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_310:
	setx	0x3c030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198381a  ! 3852: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
T3_asi_reg_rd_184:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_rd_185:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2a58020  ! 3858: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf8b48020  ! 3860: STHA_R	stha	%r28, [%r18 + %r0] 0x01
T3_asi_reg_rd_186:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_187:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_188:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f9a  ! 3871: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9a, %hpstate
	.word 0xb8bd0000  ! 3873: XNORcc_R	xnorcc 	%r20, %r0, %r28
T3_asi_reg_rd_189:
	mov	0x2a, %r14
	.word 0xfadb84a0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf8b5207b  ! 3877: STHA_I	stha	%r28, [%r20 + 0x007b] %asi
	.word 0xf0a5a1ef  ! 3880: STWA_I	stwa	%r24, [%r22 + 0x01ef] %asi
	.word 0xf4b520ca  ! 3881: STHA_I	stha	%r26, [%r20 + 0x00ca] %asi
	.word 0xf4248000  ! 3884: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xf6b5a1bc  ! 3887: STHA_I	stha	%r27, [%r22 + 0x01bc] %asi
	.word 0xbf643801  ! 3888: MOVcc_I	<illegal instruction>
	.word 0xfc354000  ! 3890: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xf0244000  ! 3891: STW_R	stw	%r24, [%r17 + %r0]
T3_asi_reg_wr_172:
	mov	0x17, %r14
	.word 0xfef38e80  ! 3896: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_311:
	setx	0x3d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac610d  ! 3898: STBA_I	stba	%r31, [%r17 + 0x010d] %asi
cpu_intr_3_312:
	setx	0x3d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_190:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 3902: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_313:
	setx	0x3e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x3e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_173:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 3913: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0b5c020  ! 3914: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xf4ad20ec  ! 3918: STBA_I	stba	%r26, [%r20 + 0x00ec] %asi
	.word 0xfaadc020  ! 3919: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xf2248000  ! 3920: STW_R	stw	%r25, [%r18 + %r0]
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_315:
	setx	0x3e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_316:
	setx	0x3c0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_317:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf625e1cc  ! 3926: STW_I	stw	%r27, [%r23 + 0x01cc]
T3_asi_reg_rd_191:
	mov	0x2b, %r14
	.word 0xf0db8400  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb80c60a8  ! 3929: AND_I	and 	%r17, 0x00a8, %r28
T3_asi_reg_wr_174:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 3931: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_318:
	setx	0x3c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_192:
	mov	0x2d, %r14
	.word 0xf0db8e60  ! 3937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 3939: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982eda  ! 3943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eda, %hpstate
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_193:
	mov	0x2e, %r14
	.word 0xf4db8e80  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 3959: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
cpu_intr_3_319:
	setx	0x3d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35e01e  ! 3962: STH_I	sth	%r30, [%r23 + 0x001e]
T3_asi_reg_wr_177:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 3963: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf425c000  ! 3965: STW_R	stw	%r26, [%r23 + %r0]
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982bd8  ! 3966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd8, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_194:
	mov	0x14, %r14
	.word 0xf2db8400  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0x8d94e155  ! 3974: WRPR_PSTATE_I	wrpr	%r19, 0x0155, %pstate
cpu_intr_3_320:
	setx	0x3e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42cc000  ! 3978: STB_R	stb	%r26, [%r19 + %r0]
cpu_intr_3_321:
	setx	0x3d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_195:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 3982: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb03ce06e  ! 3985: XNOR_I	xnor 	%r19, 0x006e, %r24
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e58  ! 3986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e58, %hpstate
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfe24a1cd  ! 3990: STW_I	stw	%r31, [%r18 + 0x01cd]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfeb5a034  ! 3992: STHA_I	stha	%r31, [%r22 + 0x0034] %asi
	.word 0xfc74e0b9  ! 3993: STX_I	stx	%r30, [%r19 + 0x00b9]
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, b)
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 20)
	.word 0xba1cc000  ! 3997: XOR_R	xor 	%r19, %r0, %r29
T3_asi_reg_rd_196:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb80da08c  ! 4000: AND_I	and 	%r22, 0x008c, %r28
	.word 0xbcadc000  ! 4001: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0xbc1d215f  ! 4002: XOR_I	xor 	%r20, 0x015f, %r30
	.word 0xb5352001  ! 4005: SRL_I	srl 	%r20, 0x0001, %r26
	.word 0xf82c8000  ! 4009: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_197:
	mov	0x23, %r14
	.word 0xf8db8e40  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_178:
	mov	0xa, %r14
	.word 0xf2f38e80  ! 4015: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb32d4000  ! 4016: SLL_R	sll 	%r21, %r0, %r25
T3_asi_reg_rd_198:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_rd_199:
	mov	0x38, %r14
	.word 0xf8db89e0  ! 4021: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf6a4617c  ! 4024: STWA_I	stwa	%r27, [%r17 + 0x017c] %asi
T3_asi_reg_rd_200:
	mov	0x1b, %r14
	.word 0xf0db8e80  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_322:
	setx	0x3e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_201:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_179:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 4035: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xfe24e1c8  ! 4037: STW_I	stw	%r31, [%r19 + 0x01c8]
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf07421e6  ! 4047: STX_I	stx	%r24, [%r16 + 0x01e6]
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982900  ! 4053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
	.word 0xf6248000  ! 4054: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xfef5e10a  ! 4055: STXA_I	stxa	%r31, [%r23 + 0x010a] %asi
	.word 0xfcb560a0  ! 4056: STHA_I	stha	%r30, [%r21 + 0x00a0] %asi
	.word 0xf6f4e120  ! 4057: STXA_I	stxa	%r27, [%r19 + 0x0120] %asi
	.word 0xf67421cb  ! 4058: STX_I	stx	%r27, [%r16 + 0x01cb]
cpu_intr_3_323:
	setx	0x3c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4c020  ! 4064: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
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
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfcb4e1bf  ! 4072: STHA_I	stha	%r30, [%r19 + 0x01bf] %asi
T3_asi_reg_rd_202:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_180:
	mov	0x2b, %r14
	.word 0xfcf38e80  ! 4075: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf8acc020  ! 4076: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e42  ! 4080: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e42, %hpstate
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf074a11b  ! 4083: STX_I	stx	%r24, [%r18 + 0x011b]
	.word 0xf4758000  ! 4086: STX_R	stx	%r26, [%r22 + %r0]
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 10)
	.word 0xfeb4615d  ! 4088: STHA_I	stha	%r31, [%r17 + 0x015d] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_324:
	setx	0x3c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_181:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 4093: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_wr_182:
	mov	0x24, %r14
	.word 0xfaf38e60  ! 4095: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_rd_203:
	mov	0x2e, %r14
	.word 0xfadb84a0  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_325:
	setx	0x3d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba346004  ! 4098: SUBC_I	orn 	%r17, 0x0004, %r29
T3_asi_reg_wr_183:
	mov	0x2, %r14
	.word 0xfef38e40  ! 4100: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 11)
	.word 0xb6b44000  ! 4105: ORNcc_R	orncc 	%r17, %r0, %r27
cpu_intr_3_326:
	setx	0x3c003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_204:
	mov	0x28, %r14
	.word 0xf6db8e40  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_327:
	setx	0x3f0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_328:
	setx	0x3c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635a19d  ! 4116: STH_I	sth	%r27, [%r22 + 0x019d]
	.word 0xfc34e1e7  ! 4117: STH_I	sth	%r30, [%r19 + 0x01e7]
T3_asi_reg_wr_184:
	mov	0xb, %r14
	.word 0xf6f389e0  ! 4118: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_329:
	setx	0x43011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_185:
	mov	0x21, %r14
	.word 0xfaf384a0  ! 4120: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf6b4212c  ! 4121: STHA_I	stha	%r27, [%r16 + 0x012c] %asi
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 2)
	.word 0xb0c5c000  ! 4123: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0xb4bc61b3  ! 4124: XNORcc_I	xnorcc 	%r17, 0x01b3, %r26
T3_asi_reg_rd_205:
	mov	0x21, %r14
	.word 0xf2db84a0  ! 4126: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb8a40000  ! 4127: SUBcc_R	subcc 	%r16, %r0, %r28
	.word 0xf474a05c  ! 4128: STX_I	stx	%r26, [%r18 + 0x005c]
	.word 0xf2aca0b5  ! 4137: STBA_I	stba	%r25, [%r18 + 0x00b5] %asi
cpu_intr_3_330:
	setx	0x42000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_331:
	setx	0x400308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 3b)
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d1a  ! 4146: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1a, %hpstate
T3_asi_reg_rd_206:
	mov	0x32, %r14
	.word 0xf0db8400  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_207:
	mov	0x19, %r14
	.word 0xf4db84a0  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_208:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_332:
	setx	0x420307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_333:
	setx	0x430327, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_209:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf6b5a0b3  ! 4165: STHA_I	stha	%r27, [%r22 + 0x00b3] %asi
	.word 0xf0258000  ! 4169: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xfc25a09a  ! 4170: STW_I	stw	%r30, [%r22 + 0x009a]
cpu_intr_3_334:
	setx	0x40032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b460e1  ! 4172: STHA_I	stha	%r25, [%r17 + 0x00e1] %asi
	.word 0xf62d60dd  ! 4173: STB_I	stb	%r27, [%r21 + 0x00dd]
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_186:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 4178: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfaacc020  ! 4180: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xfa2ca0f4  ! 4182: STB_I	stb	%r29, [%r18 + 0x00f4]
	.word 0xf2258000  ! 4185: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xb2340000  ! 4186: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xbb2c9000  ! 4188: SLLX_R	sllx	%r18, %r0, %r29
T3_asi_reg_rd_210:
	mov	0x20, %r14
	.word 0xfedb84a0  ! 4189: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 0)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982bd8  ! 4191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd8, %hpstate
	.word 0xf434e0c3  ! 4192: STH_I	sth	%r26, [%r19 + 0x00c3]
T3_asi_reg_rd_211:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc2c0000  ! 4199: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf4f5206b  ! 4201: STXA_I	stxa	%r26, [%r20 + 0x006b] %asi
T3_asi_reg_rd_212:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 4208: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf0b5e1f6  ! 4209: STHA_I	stha	%r24, [%r23 + 0x01f6] %asi
	.word 0xb005e0f3  ! 4211: ADD_I	add 	%r23, 0x00f3, %r24
T3_asi_reg_wr_187:
	mov	0x17, %r14
	.word 0xf4f38e80  ! 4213: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_rd_213:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 4215: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf835a098  ! 4219: STH_I	sth	%r28, [%r22 + 0x0098]
T3_asi_reg_wr_188:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4221: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_189:
	mov	0xf, %r14
	.word 0xf8f38e60  ! 4229: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf675c000  ! 4233: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf4b44020  ! 4235: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_190:
	mov	0x37, %r14
	.word 0xfef38e40  ! 4239: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2ace119  ! 4245: STBA_I	stba	%r25, [%r19 + 0x0119] %asi
	.word 0xfaace0e0  ! 4247: STBA_I	stba	%r29, [%r19 + 0x00e0] %asi
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 12)
	.word 0xf8b461cc  ! 4250: STHA_I	stha	%r28, [%r17 + 0x01cc] %asi
T3_asi_reg_rd_214:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 4251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf274e1d5  ! 4254: STX_I	stx	%r25, [%r19 + 0x01d5]
cpu_intr_3_335:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_336:
	setx	0x41000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef4a167  ! 4265: STXA_I	stxa	%r31, [%r18 + 0x0167] %asi
cpu_intr_3_337:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_338:
	setx	0x400214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3520c0  ! 4272: STH_I	sth	%r29, [%r20 + 0x00c0]
T3_asi_reg_wr_191:
	mov	0x27, %r14
	.word 0xfef38e80  ! 4274: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf674205a  ! 4276: STX_I	stx	%r27, [%r16 + 0x005a]
	.word 0xf425a121  ! 4278: STW_I	stw	%r26, [%r22 + 0x0121]
	.word 0xfa350000  ! 4281: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfc3421ee  ! 4284: STH_I	sth	%r30, [%r16 + 0x01ee]
	.word 0xfeb5614c  ! 4288: STHA_I	stha	%r31, [%r21 + 0x014c] %asi
T3_asi_reg_wr_192:
	mov	0x1c, %r14
	.word 0xf2f38e80  ! 4289: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 1a)
	ta	T_CHANGE_TO_TL0
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfc25c000  ! 4296: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf4ad8020  ! 4297: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xb4bdc000  ! 4299: XNORcc_R	xnorcc 	%r23, %r0, %r26
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_193:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 4301: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_215:
	mov	0xd, %r14
	.word 0xf4db8e80  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_194:
	mov	0x8, %r14
	.word 0xf6f38400  ! 4309: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_339:
	setx	0x430123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x400320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6444000  ! 4314: ADDC_R	addc 	%r17, %r0, %r27
cpu_intr_3_341:
	setx	0x430011, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_216:
	mov	0x2b, %r14
	.word 0xf4db8e80  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb634a110  ! 4317: ORN_I	orn 	%r18, 0x0110, %r27
	.word 0xb9480000  ! 4318: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf0740000  ! 4321: STX_R	stx	%r24, [%r16 + %r0]
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 36)
	.word 0xf02d8000  ! 4328: STB_R	stb	%r24, [%r22 + %r0]
cpu_intr_3_342:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ada038  ! 4332: STBA_I	stba	%r27, [%r22 + 0x0038] %asi
cpu_intr_3_343:
	setx	0x41001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75a0ef  ! 4338: STX_I	stx	%r31, [%r22 + 0x00ef]
	.word 0xfc248000  ! 4339: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xfa24217a  ! 4340: STW_I	stw	%r29, [%r16 + 0x017a]
	.word 0xb3641800  ! 4342: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_195:
	mov	0x11, %r14
	.word 0xf8f38e60  ! 4345: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf6348000  ! 4347: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_344:
	setx	0x420021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_217:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 4351: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_196:
	mov	0x0, %r14
	.word 0xfcf38e80  ! 4353: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_218:
	mov	0xe, %r14
	.word 0xfedb8400  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf4748000  ! 4357: STX_R	stx	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb68c0000  ! 4359: ANDcc_R	andcc 	%r16, %r0, %r27
	.word 0xfa2c8000  ! 4360: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfe25a14b  ! 4361: STW_I	stw	%r31, [%r22 + 0x014b]
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf42c6194  ! 4368: STB_I	stb	%r26, [%r17 + 0x0194]
	.word 0xf425e099  ! 4371: STW_I	stw	%r26, [%r23 + 0x0099]
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_197:
	mov	0x8, %r14
	.word 0xf6f389e0  ! 4376: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf024e041  ! 4377: STW_I	stw	%r24, [%r19 + 0x0041]
T3_asi_reg_rd_219:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_220:
	mov	0x36, %r14
	.word 0xf2db89e0  ! 4380: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_221:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_345:
	setx	0x400318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_346:
	setx	0x41011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69d0000  ! 4387: XORcc_R	xorcc 	%r20, %r0, %r27
T3_asi_reg_rd_222:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_rd_223:
	mov	0xf, %r14
	.word 0xf8db84a0  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f80  ! 4392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
cpu_intr_3_347:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_348:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_198:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4396: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfc2c0000  ! 4397: STB_R	stb	%r30, [%r16 + %r0]
cpu_intr_3_349:
	setx	0x430135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x430125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_351:
	setx	0x420300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_352:
	setx	0x430309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 4405: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb4344000  ! 4407: ORN_R	orn 	%r17, %r0, %r26
	.word 0xb41ca12b  ! 4408: XOR_I	xor 	%r18, 0x012b, %r26
	.word 0xf8b560c0  ! 4410: STHA_I	stha	%r28, [%r21 + 0x00c0] %asi
cpu_intr_3_353:
	setx	0x430036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_354:
	setx	0x400312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_199:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 4416: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_200:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 4418: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_224:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 4419: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbc9cc000  ! 4423: XORcc_R	xorcc 	%r19, %r0, %r30
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_355:
	setx	0x410107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_356:
	setx	0x430019, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_357:
	setx	0x42030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4846062  ! 4443: ADDcc_I	addcc 	%r17, 0x0062, %r26
cpu_intr_3_358:
	setx	0x43000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 4448: STH_R	sth	%r29, [%r16 + %r0]
cpu_intr_3_359:
	setx	0x41021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_225:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_201:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 4454: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_360:
	setx	0x410010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf0ada12d  ! 4459: STBA_I	stba	%r24, [%r22 + 0x012d] %asi
T3_asi_reg_rd_226:
	mov	0x32, %r14
	.word 0xfedb8400  ! 4460: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf0a520e5  ! 4466: STWA_I	stwa	%r24, [%r20 + 0x00e5] %asi
T3_asi_reg_wr_202:
	mov	0x20, %r14
	.word 0xfcf384a0  ! 4467: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xba0c21a4  ! 4468: AND_I	and 	%r16, 0x01a4, %r29
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, a)
	.word 0xf82dc000  ! 4477: STB_R	stb	%r28, [%r23 + %r0]
cpu_intr_3_361:
	setx	0x420310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac4020  ! 4482: STBA_R	stba	%r31, [%r17 + %r0] 0x01
T3_asi_reg_rd_227:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb6848000  ! 4491: ADDcc_R	addcc 	%r18, %r0, %r27
cpu_intr_3_362:
	setx	0x430114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2dc000  ! 4496: SLL_R	sll 	%r23, %r0, %r29
cpu_intr_3_363:
	setx	0x43000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea560ea  ! 4498: STWA_I	stwa	%r31, [%r21 + 0x00ea] %asi
	.word 0xf6256024  ! 4499: STW_I	stw	%r27, [%r21 + 0x0024]
T3_asi_reg_rd_228:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 4500: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_229:
	mov	0x5, %r14
	.word 0xf0db89e0  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb68c2134  ! 4505: ANDcc_I	andcc 	%r16, 0x0134, %r27
	.word 0xf425c000  ! 4508: STW_R	stw	%r26, [%r23 + %r0]
cpu_intr_3_364:
	setx	0x420138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_203:
	mov	0x1c, %r14
	.word 0xf4f38e60  ! 4510: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb93c1000  ! 4512: SRAX_R	srax	%r16, %r0, %r28
	.word 0xfead0020  ! 4514: STBA_R	stba	%r31, [%r20 + %r0] 0x01
T3_asi_reg_rd_230:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf0a5610b  ! 4517: STWA_I	stwa	%r24, [%r21 + 0x010b] %asi
	.word 0xf4a460da  ! 4520: STWA_I	stwa	%r26, [%r17 + 0x00da] %asi
T3_asi_reg_wr_204:
	mov	0x1b, %r14
	.word 0xfef384a0  ! 4523: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf02c4000  ! 4524: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xfab58020  ! 4527: STHA_R	stha	%r29, [%r22 + %r0] 0x01
cpu_intr_3_365:
	setx	0x40002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_366:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 34)
	.word 0xf4a54020  ! 4534: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_231:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, c)
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 34)
	.word 0xfcaca02f  ! 4545: STBA_I	stba	%r30, [%r18 + 0x002f] %asi
	.word 0xfe750000  ! 4546: STX_R	stx	%r31, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_367:
	setx	0x40023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f40  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f40, %hpstate
cpu_intr_3_368:
	setx	0x420129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4e0a8  ! 4564: STXA_I	stxa	%r25, [%r19 + 0x00a8] %asi
	.word 0xf42c4000  ! 4565: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf674e076  ! 4569: STX_I	stx	%r27, [%r19 + 0x0076]
cpu_intr_3_369:
	setx	0x400209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4c020  ! 4576: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_205:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 4580: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 1d)
	.word 0xbf3de001  ! 4582: SRA_I	sra 	%r23, 0x0001, %r31
T3_asi_reg_wr_206:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 4583: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_wr_207:
	mov	0x5, %r14
	.word 0xfaf38e60  ! 4584: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf635e1e6  ! 4585: STH_I	sth	%r27, [%r23 + 0x01e6]
cpu_intr_3_370:
	setx	0x450304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d0000  ! 4587: STB_R	stb	%r26, [%r20 + %r0]
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, a)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a8a  ! 4591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
T3_asi_reg_wr_208:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 4592: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_209:
	mov	0x5, %r14
	.word 0xfcf38e60  ! 4597: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_232:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_371:
	setx	0x440121, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf435a049  ! 4606: STH_I	sth	%r26, [%r22 + 0x0049]
	.word 0xf0a54020  ! 4607: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_372:
	setx	0x440230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875a085  ! 4615: STX_I	stx	%r28, [%r22 + 0x0085]
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_233:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 4618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_373:
	setx	0x46020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_374:
	setx	0x470205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5217d  ! 4627: STWA_I	stwa	%r24, [%r20 + 0x017d] %asi
	.word 0xb60da186  ! 4628: AND_I	and 	%r22, 0x0186, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_210:
	mov	0x1a, %r14
	.word 0xfef384a0  ! 4632: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf635a196  ! 4636: STH_I	sth	%r27, [%r22 + 0x0196]
cpu_intr_3_375:
	setx	0x46011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_234:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8744000  ! 4644: STX_R	stx	%r28, [%r17 + %r0]
T3_asi_reg_wr_211:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 4645: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_212:
	mov	0x35, %r14
	.word 0xfaf38e60  ! 4648: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	.word 0xf2ad0020  ! 4650: STBA_R	stba	%r25, [%r20 + %r0] 0x01
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 21)
	.word 0xb4b40000  ! 4652: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xfead60c1  ! 4654: STBA_I	stba	%r31, [%r21 + 0x00c1] %asi
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 2d)
	.word 0xba3dc000  ! 4656: XNOR_R	xnor 	%r23, %r0, %r29
	.word 0xfef56128  ! 4658: STXA_I	stxa	%r31, [%r21 + 0x0128] %asi
	.word 0xb33d7001  ! 4662: SRAX_I	srax	%r21, 0x0001, %r25
	.word 0xf4ade113  ! 4663: STBA_I	stba	%r26, [%r23 + 0x0113] %asi
cpu_intr_3_376:
	setx	0x460303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_377:
	setx	0x460234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ade165  ! 4666: STBA_I	stba	%r26, [%r23 + 0x0165] %asi
	.word 0xbf7d4400  ! 4667: MOVR_R	movre	%r21, %r0, %r31
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_213:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 4674: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0a54020  ! 4677: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb13c8000  ! 4679: SRA_R	sra 	%r18, %r0, %r24
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_235:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 34)
	.word 0xfaa58020  ! 4685: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xfef4e0cd  ! 4687: STXA_I	stxa	%r31, [%r19 + 0x00cd] %asi
	.word 0xf22d615b  ! 4689: STB_I	stb	%r25, [%r21 + 0x015b]
	.word 0xf0b5a002  ! 4694: STHA_I	stha	%r24, [%r22 + 0x0002] %asi
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_214:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 4699: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfca561d2  ! 4702: STWA_I	stwa	%r30, [%r21 + 0x01d2] %asi
	.word 0xfe24a0a6  ! 4703: STW_I	stw	%r31, [%r18 + 0x00a6]
	.word 0xbeb52004  ! 4704: SUBCcc_I	orncc 	%r20, 0x0004, %r31
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb935e001  ! 4710: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0xf6344000  ! 4715: STH_R	sth	%r27, [%r17 + %r0]
T3_asi_reg_rd_236:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 4716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_378:
	setx	0x46001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_237:
	mov	0x0, %r14
	.word 0xf6db8e60  ! 4725: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_379:
	setx	0x47020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4e1b2  ! 4728: STXA_I	stxa	%r30, [%r19 + 0x01b2] %asi
	.word 0xfe2d4000  ! 4731: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf8ad60ba  ! 4733: STBA_I	stba	%r28, [%r21 + 0x00ba] %asi
	.word 0xfe7420a3  ! 4734: STX_I	stx	%r31, [%r16 + 0x00a3]
	.word 0xf02c0000  ! 4735: STB_R	stb	%r24, [%r16 + %r0]
T3_asi_reg_wr_215:
	mov	0x8, %r14
	.word 0xf2f38e80  ! 4736: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfeb5a0ef  ! 4740: STHA_I	stha	%r31, [%r22 + 0x00ef] %asi
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_216:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 4742: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf234c000  ! 4743: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf8ac8020  ! 4744: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_217:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 4745: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_238:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 4748: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf02c207b  ! 4752: STB_I	stb	%r24, [%r16 + 0x007b]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_380:
	setx	0x460205, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a58  ! 4755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a58, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xf8b54020  ! 4758: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_239:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 4764: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_218:
	mov	0x14, %r14
	.word 0xfaf38e60  ! 4767: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_381:
	setx	0x450324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_382:
	setx	0x460313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc2d0000  ! 4779: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf275a088  ! 4781: STX_I	stx	%r25, [%r22 + 0x0088]
	.word 0xf2354000  ! 4784: STH_R	sth	%r25, [%r21 + %r0]
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_240:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4792: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_219:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 4802: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_383:
	setx	0x440008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_384:
	setx	0x450318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcacc020  ! 4812: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xf4b40020  ! 4813: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xfc750000  ! 4820: STX_R	stx	%r30, [%r20 + %r0]
cpu_intr_3_385:
	setx	0x450103, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_241:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 4825: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb4ad8000  ! 4826: ANDNcc_R	andncc 	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_242:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 4828: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_386:
	setx	0x44010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_220:
	mov	0x33, %r14
	.word 0xfef38e60  ! 4833: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_387:
	setx	0x45020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac60b1  ! 4840: STBA_I	stba	%r31, [%r17 + 0x00b1] %asi
	.word 0xb1359000  ! 4842: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xf4f521c8  ! 4843: STXA_I	stxa	%r26, [%r20 + 0x01c8] %asi
	.word 0xf82d4000  ! 4845: STB_R	stb	%r28, [%r21 + %r0]
T3_asi_reg_wr_221:
	mov	0x13, %r14
	.word 0xfcf384a0  ! 4846: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_HPRIV
	.word 0xf235c000  ! 4852: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf474e1f3  ! 4853: STX_I	stx	%r26, [%r19 + 0x01f3]
	.word 0xf835c000  ! 4856: STH_R	sth	%r28, [%r23 + %r0]
cpu_intr_3_388:
	setx	0x460317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ce0e0  ! 4861: STB_I	stb	%r24, [%r19 + 0x00e0]
cpu_intr_3_389:
	setx	0x47020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfa34c000  ! 4871: STH_R	sth	%r29, [%r19 + %r0]
T3_asi_reg_rd_243:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf0b4e0f3  ! 4874: STHA_I	stha	%r24, [%r19 + 0x00f3] %asi
cpu_intr_3_390:
	setx	0x46010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1d4000  ! 4879: XOR_R	xor 	%r21, %r0, %r30
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 27)
	.word 0xb3344000  ! 4882: SRL_R	srl 	%r17, %r0, %r25
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf2b54020  ! 4888: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	.word 0xb03ca0a4  ! 4889: XNOR_I	xnor 	%r18, 0x00a4, %r24
cpu_intr_3_391:
	setx	0x45001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12df001  ! 4891: SLLX_I	sllx	%r23, 0x0001, %r24
	.word 0xf625e1e1  ! 4892: STW_I	stw	%r27, [%r23 + 0x01e1]
	.word 0xf4750000  ! 4893: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xfa340000  ! 4894: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfa248000  ! 4895: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xfe35a064  ! 4896: STH_I	sth	%r31, [%r22 + 0x0064]
	.word 0xfc3420a9  ! 4900: STH_I	sth	%r30, [%r16 + 0x00a9]
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d00  ! 4903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
T3_asi_reg_wr_222:
	mov	0x14, %r14
	.word 0xfef38400  ! 4905: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbca48000  ! 4906: SUBcc_R	subcc 	%r18, %r0, %r30
	.word 0xb77c6401  ! 4907: MOVR_I	movre	%r17, 0x1, %r27
cpu_intr_3_392:
	setx	0x44002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_406), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_407), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_244:
	mov	0x36, %r14
	.word 0xf0db8e60  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_wr_223:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 4914: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_393:
	setx	0x470332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35c000  ! 4919: STH_R	sth	%r31, [%r23 + %r0]
cpu_intr_3_394:
	setx	0x440220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8ca040  ! 4922: ANDcc_I	andcc 	%r18, 0x0040, %r31
	.word 0xf0f4201e  ! 4925: STXA_I	stxa	%r24, [%r16 + 0x001e] %asi
cpu_intr_3_395:
	setx	0x460001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_408), 16, 16)) -> intp(3, 0, 26)
	.word 0xf024213e  ! 4929: STW_I	stw	%r24, [%r16 + 0x013e]
	.word 0xfa2d0000  ! 4931: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xf6a4c020  ! 4932: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
cpu_intr_3_396:
	setx	0x450026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_409), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_245:
	mov	0x1e, %r14
	.word 0xfcdb84a0  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9641800  ! 4938: MOVcc_R	<illegal instruction>
	.word 0xfcf4a16e  ! 4940: STXA_I	stxa	%r30, [%r18 + 0x016e] %asi
T3_asi_reg_rd_246:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 4941: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_410), 16, 16)) -> intp(3, 0, 1a)
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d82  ! 4946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	.word 0xf6a5a1ee  ! 4952: STWA_I	stwa	%r27, [%r22 + 0x01ee] %asi
cpu_intr_3_397:
	setx	0x46033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a461b2  ! 4955: STWA_I	stwa	%r27, [%r17 + 0x01b2] %asi
	.word 0xbc04c000  ! 4959: ADD_R	add 	%r19, %r0, %r30
cpu_intr_3_398:
	setx	0x470214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 4961: RDPR_PIL	rdpr	%pil, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xbead21ea  ! 4963: ANDNcc_I	andncc 	%r20, 0x01ea, %r31
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819829ca  ! 4965: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
	.word 0xf42de0ad  ! 4967: STB_I	stb	%r26, [%r23 + 0x00ad]
T3_asi_reg_rd_247:
	mov	0x2a, %r14
	.word 0xf8db8e60  ! 4971: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_224:
	mov	0x7, %r14
	.word 0xf4f389e0  ! 4972: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_225:
	mov	0x1e, %r14
	.word 0xf2f38e80  ! 4978: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbeb4208e  ! 4979: SUBCcc_I	orncc 	%r16, 0x008e, %r31
	.word 0xbb3c9000  ! 4980: SRAX_R	srax	%r18, %r0, %r29
	.word 0xfeac619e  ! 4982: STBA_I	stba	%r31, [%r17 + 0x019e] %asi
iob_intr_3_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_411), 16, 16)) -> intp(3, 0, 27)
	.word 0xf07420ed  ! 4985: STX_I	stx	%r24, [%r16 + 0x00ed]
T3_asi_reg_wr_226:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 4988: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf2b48020  ! 4989: STHA_R	stha	%r25, [%r18 + %r0] 0x01
iob_intr_3_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_412), 16, 16)) -> intp(3, 0, d)
	.word 0xfa754000  ! 4991: STX_R	stx	%r29, [%r21 + %r0]
T3_asi_reg_wr_227:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 4994: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb8a48000  ! 4995: SUBcc_R	subcc 	%r18, %r0, %r28
	.word 0xfeb5a0c4  ! 4997: STHA_I	stha	%r31, [%r22 + 0x00c4] %asi
cpu_intr_3_399:
	setx	0x470118, %g1, %o0
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
T2_asi_reg_rd_0:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 2: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_0:
	setx	0x1d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_1:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_1:
	setx	0x1e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_2:
	setx	0x1f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
cpu_intr_2_3:
	setx	0x1d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_0:
	mov	0x1a, %r14
	.word 0xf8f38400  ! 17: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf095a1d8  ! 19: LDUHA_I	lduha	[%r22, + 0x01d8] %asi, %r24
	.word 0xf2048000  ! 21: LDUW_R	lduw	[%r18 + %r0], %r25
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_4:
	setx	0x1c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_5:
	setx	0x1c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_6:
	setx	0x1d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc0020  ! 34: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa144000  ! 39: LDUH_R	lduh	[%r17 + %r0], %r29
cpu_intr_2_7:
	setx	0x1e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_8:
	setx	0x1d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_9:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa458000  ! 46: LDSW_R	ldsw	[%r22 + %r0], %r29
cpu_intr_2_10:
	setx	0x1f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53cd000  ! 50: SRAX_R	srax	%r19, %r0, %r26
	.word 0xf6858020  ! 53: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_1:
	mov	0x12, %r14
	.word 0xfef389e0  ! 55: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf80d203c  ! 56: LDUB_I	ldub	[%r20 + 0x003c], %r28
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_11:
	setx	0x1d000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 7)
	.word 0xf68d0020  ! 65: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	.word 0xfc5c6197  ! 66: LDX_I	ldx	[%r17 + 0x0197], %r30
T2_asi_reg_rd_2:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf2dda089  ! 68: LDXA_I	ldxa	[%r22, + 0x0089] %asi, %r25
	.word 0xf615e0d9  ! 72: LDUH_I	lduh	[%r23 + 0x00d9], %r27
cpu_intr_2_12:
	setx	0x1c003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c6149  ! 78: LDSB_I	ldsb	[%r17 + 0x0149], %r28
T2_asi_reg_wr_2:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 82: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb8bd606c  ! 83: XNORcc_I	xnorcc 	%r21, 0x006c, %r28
	.word 0xf2858020  ! 85: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
T2_asi_reg_rd_3:
	mov	0x2c, %r14
	.word 0xfcdb84a0  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf40520ee  ! 88: LDUW_I	lduw	[%r20 + 0x00ee], %r26
cpu_intr_2_13:
	setx	0x1d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 91: MOVcc_R	<illegal instruction>
	.word 0xf08d6055  ! 92: LDUBA_I	lduba	[%r21, + 0x0055] %asi, %r24
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 3)
	.word 0xba2c4000  ! 106: ANDN_R	andn 	%r17, %r0, %r29
T2_asi_reg_wr_3:
	mov	0x0, %r14
	.word 0xf8f38e60  ! 108: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfc5520c6  ! 115: LDSH_I	ldsh	[%r20 + 0x00c6], %r30
T2_asi_reg_rd_4:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 118: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_14:
	setx	0x1f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c4000  ! 120: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xf4150000  ! 122: LDUH_R	lduh	[%r20 + %r0], %r26
cpu_intr_2_15:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dde12c  ! 126: LDXA_I	ldxa	[%r23, + 0x012c] %asi, %r24
	.word 0xb8a44000  ! 129: SUBcc_R	subcc 	%r17, %r0, %r28
T2_asi_reg_wr_4:
	mov	0x1b, %r14
	.word 0xf0f38e80  ! 131: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfacca022  ! 133: LDSBA_I	ldsba	[%r18, + 0x0022] %asi, %r29
cpu_intr_2_16:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b48000  ! 137: ORNcc_R	orncc 	%r18, %r0, %r24
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_17:
	setx	0x1c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4cda108  ! 149: LDSBA_I	ldsba	[%r22, + 0x0108] %asi, %r26
	.word 0xb6bd0000  ! 151: XNORcc_R	xnorcc 	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf08dc020  ! 156: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
cpu_intr_2_18:
	setx	0x1e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_19:
	setx	0x1f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_20:
	setx	0x1d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_5:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 165: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb8958000  ! 166: ORcc_R	orcc 	%r22, %r0, %r28
T2_asi_reg_rd_6:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 168: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf854e07a  ! 172: LDSH_I	ldsh	[%r19 + 0x007a], %r28
	.word 0xf4044000  ! 173: LDUW_R	lduw	[%r17 + %r0], %r26
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, a)
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198298a  ! 181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
	.word 0xfa9560f3  ! 183: LDUHA_I	lduha	[%r21, + 0x00f3] %asi, %r29
	.word 0xfe14a140  ! 184: LDUH_I	lduh	[%r18 + 0x0140], %r31
T2_asi_reg_rd_7:
	mov	0x9, %r14
	.word 0xf2db8e80  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_8:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 188: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_9:
	mov	0x13, %r14
	.word 0xfadb8400  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf2150000  ! 190: LDUH_R	lduh	[%r20 + %r0], %r25
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a1a  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
T2_asi_reg_wr_5:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 197: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfe5de11c  ! 199: LDX_I	ldx	[%r23 + 0x011c], %r31
	.word 0xfe4da07c  ! 201: LDSB_I	ldsb	[%r22 + 0x007c], %r31
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 9)
	.word 0xb12dc000  ! 210: SLL_R	sll 	%r23, %r0, %r24
	.word 0xf6c40020  ! 211: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
	.word 0xf68c0020  ! 213: LDUBA_R	lduba	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_10:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_21:
	setx	0x1f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c21fa  ! 219: LDSB_I	ldsb	[%r16 + 0x01fa], %r28
	.word 0xfa0c8000  ! 220: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xfe052083  ! 223: LDUW_I	lduw	[%r20 + 0x0083], %r31
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_11:
	mov	0x18, %r14
	.word 0xfcdb84a0  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_22:
	setx	0x1c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf352001  ! 228: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xfad4608b  ! 229: LDSHA_I	ldsha	[%r17, + 0x008b] %asi, %r29
	.word 0xf24ca044  ! 230: LDSB_I	ldsb	[%r18 + 0x0044], %r25
T2_asi_reg_rd_12:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 231: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_13:
	mov	0x9, %r14
	.word 0xfcdb8400  ! 238: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf0dce07a  ! 241: LDXA_I	ldxa	[%r19, + 0x007a] %asi, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf8dca0e0  ! 244: LDXA_I	ldxa	[%r18, + 0x00e0] %asi, %r28
	.word 0x9195e1a5  ! 245: WRPR_PIL_I	wrpr	%r23, 0x01a5, %pil
cpu_intr_2_23:
	setx	0x1c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c0000  ! 247: LDUB_R	ldub	[%r16 + %r0], %r29
T2_asi_reg_rd_14:
	mov	0x5, %r14
	.word 0xf2db8e40  ! 249: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_24:
	setx	0x1f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf215e17d  ! 254: LDUH_I	lduh	[%r23 + 0x017d], %r25
	.word 0xf8552158  ! 255: LDSH_I	ldsh	[%r20 + 0x0158], %r28
	.word 0xbc940000  ! 256: ORcc_R	orcc 	%r16, %r0, %r30
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 39)
	.word 0xf40c0000  ! 258: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xa1902000  ! 260: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_2_25:
	setx	0x1c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_6:
	mov	0x1c, %r14
	.word 0xf6f384a0  ! 264: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfa848020  ! 266: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_15:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb7643801  ! 273: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xbca48000  ! 281: SUBcc_R	subcc 	%r18, %r0, %r30
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, e)
	.word 0xf6dda117  ! 289: LDXA_I	ldxa	[%r22, + 0x0117] %asi, %r27
T2_asi_reg_wr_7:
	mov	0x29, %r14
	.word 0xfef38e60  ! 290: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xba04619c  ! 292: ADD_I	add 	%r17, 0x019c, %r29
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf4d40020  ! 295: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 21)
	.word 0xf4856048  ! 297: LDUWA_I	lduwa	[%r21, + 0x0048] %asi, %r26
	.word 0xf85d0000  ! 299: LDX_R	ldx	[%r20 + %r0], %r28
T2_asi_reg_wr_8:
	mov	0x4, %r14
	.word 0xf6f38e80  ! 300: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c10  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c10, %hpstate
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a52  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
cpu_intr_2_26:
	setx	0x1f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf014e0f2  ! 309: LDUH_I	lduh	[%r19 + 0x00f2], %r24
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfe4c2042  ! 312: LDSB_I	ldsb	[%r16 + 0x0042], %r31
	.word 0xf8140000  ! 313: LDUH_R	lduh	[%r16 + %r0], %r28
cpu_intr_2_27:
	setx	0x1f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_9:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 315: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_16:
	mov	0x38, %r14
	.word 0xfadb8400  ! 320: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_28:
	setx	0x1e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2458000  ! 324: LDSW_R	ldsw	[%r22 + %r0], %r25
	.word 0xf28461ea  ! 328: LDUWA_I	lduwa	[%r17, + 0x01ea] %asi, %r25
cpu_intr_2_29:
	setx	0x1f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894a13e  ! 331: LDUHA_I	lduha	[%r18, + 0x013e] %asi, %r28
cpu_intr_2_30:
	setx	0x1e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_17:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 336: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf2c58020  ! 338: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
T2_asi_reg_rd_18:
	mov	0xa, %r14
	.word 0xf0db8e80  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf68c4020  ! 344: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
	.word 0xf2cd8020  ! 345: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
T2_asi_reg_wr_10:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 347: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_31:
	setx	0x1c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_11:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 352: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_12:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 355: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_32:
	setx	0x1e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf815618b  ! 357: LDUH_I	lduh	[%r21 + 0x018b], %r28
	.word 0xf8844020  ! 359: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
T2_asi_reg_wr_13:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 363: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_33:
	setx	0x1d030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_14:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 368: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_rd_19:
	mov	0xb, %r14
	.word 0xf4db8e60  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_15:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 377: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf004a066  ! 382: LDUW_I	lduw	[%r18 + 0x0066], %r24
	.word 0xf0dda158  ! 384: LDXA_I	ldxa	[%r22, + 0x0158] %asi, %r24
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 18)
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d5a  ! 386: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5a, %hpstate
cpu_intr_2_34:
	setx	0x1c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_35:
	setx	0x1e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55c000  ! 391: LDSH_R	ldsh	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_20:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfe844020  ! 396: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
	.word 0xfed50020  ! 397: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r31
T2_asi_reg_rd_21:
	mov	0xc, %r14
	.word 0xf8db8e60  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa5d8000  ! 403: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xb4150000  ! 404: OR_R	or 	%r20, %r0, %r26
	.word 0xb134a001  ! 405: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xb025617d  ! 406: SUB_I	sub 	%r21, 0x017d, %r24
cpu_intr_2_36:
	setx	0x1f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_22:
	mov	0x28, %r14
	.word 0xf4db8e80  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbb3c2001  ! 418: SRA_I	sra 	%r16, 0x0001, %r29
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_16:
	mov	0x6, %r14
	.word 0xf2f389e0  ! 420: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfa8c8020  ! 421: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
T2_asi_reg_wr_17:
	mov	0x13, %r14
	.word 0xf8f384a0  ! 422: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf08ca03b  ! 423: LDUBA_I	lduba	[%r18, + 0x003b] %asi, %r24
	.word 0xfe8420c5  ! 425: LDUWA_I	lduwa	[%r16, + 0x00c5] %asi, %r31
cpu_intr_2_37:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 427: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_19:
	mov	0x2a, %r14
	.word 0xfcf384a0  ! 429: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b42  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b42, %hpstate
	.word 0xf044a000  ! 432: LDSW_I	ldsw	[%r18 + 0x0000], %r24
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, a)
	.word 0xba0d0000  ! 435: AND_R	and 	%r20, %r0, %r29
	.word 0xfc55e170  ! 436: LDSH_I	ldsh	[%r23 + 0x0170], %r30
	.word 0xf4c42011  ! 439: LDSWA_I	ldswa	[%r16, + 0x0011] %asi, %r26
	.word 0xf4dd2046  ! 441: LDXA_I	ldxa	[%r20, + 0x0046] %asi, %r26
	.word 0xf68d8020  ! 442: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
T2_asi_reg_wr_20:
	mov	0x2f, %r14
	.word 0xf6f389e0  ! 443: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, d)
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 0)
	.word 0xf8558000  ! 448: LDSH_R	ldsh	[%r22 + %r0], %r28
T2_asi_reg_rd_23:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf04d0000  ! 450: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xfc94c020  ! 451: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983980  ! 454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1980, %hpstate
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_38:
	setx	0x23031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_24:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 458: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_39:
	setx	0x210114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_40:
	setx	0x200218, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a0a  ! 470: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
T2_asi_reg_wr_21:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 472: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_22:
	mov	0x23, %r14
	.word 0xfcf38e80  ! 475: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf8ccc020  ! 476: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r28
	.word 0x899421f9  ! 477: WRPR_TICK_I	wrpr	%r16, 0x01f9, %tick
	.word 0xf055a007  ! 478: LDSH_I	ldsh	[%r22 + 0x0007], %r24
	.word 0xbcad8000  ! 479: ANDNcc_R	andncc 	%r22, %r0, %r30
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 12)
	.word 0xf2944020  ! 482: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_23:
	mov	0x1f, %r14
	.word 0xf4f384a0  ! 483: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf49520bb  ! 488: LDUHA_I	lduha	[%r20, + 0x00bb] %asi, %r26
cpu_intr_2_41:
	setx	0x21021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_42:
	setx	0x230319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24c000  ! 500: SUB_R	sub 	%r19, %r0, %r29
	.word 0xfa54a18a  ! 504: LDSH_I	ldsh	[%r18 + 0x018a], %r29
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf8d4c020  ! 513: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa15e19c  ! 521: LDUH_I	lduh	[%r23 + 0x019c], %r29
cpu_intr_2_43:
	setx	0x210126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8052184  ! 524: LDUW_I	lduw	[%r20 + 0x0184], %r28
cpu_intr_2_44:
	setx	0x200029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_25:
	mov	0x32, %r14
	.word 0xf0db8e80  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_45:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_24:
	mov	0x11, %r14
	.word 0xfef38e40  ! 539: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_26:
	mov	0x2d, %r14
	.word 0xf2db8e60  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_25:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 543: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_46:
	setx	0x22033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf094e07a  ! 546: LDUHA_I	lduha	[%r19, + 0x007a] %asi, %r24
	.word 0xfc452096  ! 552: LDSW_I	ldsw	[%r20 + 0x0096], %r30
	.word 0xfc8c4020  ! 554: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, b)
	.word 0xb644c000  ! 557: ADDC_R	addc 	%r19, %r0, %r27
T2_asi_reg_wr_26:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 562: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 7)
	.word 0xbab5a14f  ! 564: ORNcc_I	orncc 	%r22, 0x014f, %r29
cpu_intr_2_47:
	setx	0x200313, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_48:
	setx	0x200128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6840020  ! 571: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f50  ! 572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f50, %hpstate
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
	.word 0xbc8521d5  ! 579: ADDcc_I	addcc 	%r20, 0x01d5, %r30
	.word 0xf64d0000  ! 580: LDSB_R	ldsb	[%r20 + %r0], %r27
T2_asi_reg_wr_27:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 581: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf205c000  ! 583: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xfadde04f  ! 584: LDXA_I	ldxa	[%r23, + 0x004f] %asi, %r29
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
cpu_intr_2_49:
	setx	0x20030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_28:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 595: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfecc61a2  ! 598: LDSBA_I	ldsba	[%r17, + 0x01a2] %asi, %r31
cpu_intr_2_50:
	setx	0x23011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2148000  ! 605: LDUH_R	lduh	[%r18 + %r0], %r25
cpu_intr_2_51:
	setx	0x210322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_52:
	setx	0x230011, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbac48000  ! 616: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xbc1dc000  ! 618: XOR_R	xor 	%r23, %r0, %r30
T2_asi_reg_wr_29:
	mov	0x2f, %r14
	.word 0xf0f38e40  ! 620: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_27:
	mov	0x2e, %r14
	.word 0xf4db8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_28:
	mov	0x38, %r14
	.word 0xf6db8400  ! 624: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf29561c4  ! 626: LDUHA_I	lduha	[%r21, + 0x01c4] %asi, %r25
	.word 0xf8c58020  ! 627: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
	.word 0xf04dc000  ! 628: LDSB_R	ldsb	[%r23 + %r0], %r24
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf0c5a1fc  ! 633: LDSWA_I	ldswa	[%r22, + 0x01fc] %asi, %r24
cpu_intr_2_53:
	setx	0x220308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43ca100  ! 638: XNOR_I	xnor 	%r18, 0x0100, %r26
T2_asi_reg_wr_30:
	mov	0x23, %r14
	.word 0xfef38400  ! 639: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_29:
	mov	0x16, %r14
	.word 0xf6db89e0  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819838c2  ! 641: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
	.word 0xfe058000  ! 643: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xbc8c4000  ! 645: ANDcc_R	andcc 	%r17, %r0, %r30
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_30:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 650: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4c48020  ! 651: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
T2_asi_reg_rd_31:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 652: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa5da00b  ! 660: LDX_I	ldx	[%r22 + 0x000b], %r29
T2_asi_reg_rd_32:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf2544000  ! 663: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xfe8c0020  ! 664: LDUBA_R	lduba	[%r16, %r0] 0x01, %r31
T2_asi_reg_wr_31:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 666: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf84de11f  ! 667: LDSB_I	ldsb	[%r23 + 0x011f], %r28
	.word 0xf6554000  ! 668: LDSH_R	ldsh	[%r21 + %r0], %r27
cpu_intr_2_54:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d44020  ! 673: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_33:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 677: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_32:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 678: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf815e150  ! 682: LDUH_I	lduh	[%r23 + 0x0150], %r28
T2_asi_reg_rd_34:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 683: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfad4e199  ! 684: LDSHA_I	ldsha	[%r19, + 0x0199] %asi, %r29
	.word 0xfc156189  ! 686: LDUH_I	lduh	[%r21 + 0x0189], %r30
	.word 0xbac50000  ! 687: ADDCcc_R	addccc 	%r20, %r0, %r29
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_55:
	setx	0x200312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33ca001  ! 694: SRA_I	sra 	%r18, 0x0001, %r25
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
cpu_intr_2_56:
	setx	0x210109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_35:
	mov	0x36, %r14
	.word 0xfcdb8400  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_57:
	setx	0x220137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_58:
	setx	0x20003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_59:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_33:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 728: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf04d8000  ! 732: LDSB_R	ldsb	[%r22 + %r0], %r24
cpu_intr_2_60:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_61:
	setx	0x210339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_62:
	setx	0x200210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe546079  ! 741: LDSH_I	ldsh	[%r17 + 0x0079], %r31
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, e)
	.word 0xbe250000  ! 748: SUB_R	sub 	%r20, %r0, %r31
	.word 0xf204c000  ! 749: LDUW_R	lduw	[%r19 + %r0], %r25
T2_asi_reg_wr_34:
	mov	0x22, %r14
	.word 0xfef389e0  ! 750: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf4146004  ! 752: LDUH_I	lduh	[%r17 + 0x0004], %r26
	.word 0xf8050000  ! 755: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xbabc0000  ! 756: XNORcc_R	xnorcc 	%r16, %r0, %r29
	.word 0xf4058000  ! 757: LDUW_R	lduw	[%r22 + %r0], %r26
cpu_intr_2_63:
	setx	0x210323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_35:
	mov	0x5, %r14
	.word 0xf0f389e0  ! 759: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_37:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2c5c020  ! 766: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_64:
	setx	0x20013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_65:
	setx	0x210026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72dd000  ! 773: SLLX_R	sllx	%r23, %r0, %r27
cpu_intr_2_66:
	setx	0x23010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf405c000  ! 777: LDUW_R	lduw	[%r23 + %r0], %r26
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
cpu_intr_2_67:
	setx	0x22011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_36:
	mov	0x34, %r14
	.word 0xfef38e60  ! 783: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_68:
	setx	0x21031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_37:
	mov	0x2d, %r14
	.word 0xfaf38400  ! 786: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_38:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_69:
	setx	0x220112, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_39:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_70:
	setx	0x220231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_40:
	mov	0x2, %r14
	.word 0xf8db8e80  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5540000  ! 803: RDPR_GL	rdpr	%-, %r26
cpu_intr_2_71:
	setx	0x220012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894e05f  ! 806: LDUHA_I	lduha	[%r19, + 0x005f] %asi, %r28
T2_asi_reg_rd_41:
	mov	0x37, %r14
	.word 0xfedb8e60  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf0540000  ! 810: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xb73d4000  ! 813: SRA_R	sra 	%r21, %r0, %r27
	.word 0xf0d5c020  ! 814: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
	.word 0xfc150000  ! 817: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf28cc020  ! 820: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
	.word 0xf68de1ea  ! 822: LDUBA_I	lduba	[%r23, + 0x01ea] %asi, %r27
	.word 0xf20d2063  ! 824: LDUB_I	ldub	[%r20 + 0x0063], %r25
	.word 0xbe9c0000  ! 826: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0xf48d0020  ! 828: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
	.word 0xf484e123  ! 829: LDUWA_I	lduwa	[%r19, + 0x0123] %asi, %r26
	.word 0xb92c0000  ! 830: SLL_R	sll 	%r16, %r0, %r28
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_38:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 833: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbb352001  ! 835: SRL_I	srl 	%r20, 0x0001, %r29
	.word 0xfa44216a  ! 836: LDSW_I	ldsw	[%r16 + 0x016a], %r29
T2_asi_reg_wr_39:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 837: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb48c0000  ! 841: ANDcc_R	andcc 	%r16, %r0, %r26
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_72:
	setx	0x210011, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_40:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 851: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc04a025  ! 856: LDUW_I	lduw	[%r18 + 0x0025], %r30
	.word 0xb3520000  ! 858: RDPR_PIL	<illegal instruction>
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 15)
	.word 0xf814e196  ! 866: LDUH_I	lduh	[%r19 + 0x0196], %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_42:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb32c2001  ! 872: SLL_I	sll 	%r16, 0x0001, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfe542065  ! 874: LDSH_I	ldsh	[%r16 + 0x0065], %r31
	.word 0xf0550000  ! 875: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xfa940020  ! 876: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfecd4020  ! 883: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf8cc8020  ! 888: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 25)
	.word 0xf4c48020  ! 894: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xfc5c4000  ! 896: LDX_R	ldx	[%r17 + %r0], %r30
	.word 0xf80d8000  ! 897: LDUB_R	ldub	[%r22 + %r0], %r28
cpu_intr_2_73:
	setx	0x200230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_74:
	setx	0x230011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc544000  ! 905: LDSH_R	ldsh	[%r17 + %r0], %r30
cpu_intr_2_75:
	setx	0x21001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_43:
	mov	0x2, %r14
	.word 0xfedb8e80  ! 915: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb63dc000  ! 916: XNOR_R	xnor 	%r23, %r0, %r27
cpu_intr_2_76:
	setx	0x250005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa040000  ! 925: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfc55a1ed  ! 927: LDSH_I	ldsh	[%r22 + 0x01ed], %r30
	ta	T_CHANGE_TO_TL1
	.word 0xfc8de1bf  ! 931: LDUBA_I	lduba	[%r23, + 0x01bf] %asi, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_77:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2154000  ! 941: LDUH_R	lduh	[%r21 + %r0], %r25
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 9)
	.word 0xfcdc20e6  ! 944: LDXA_I	ldxa	[%r16, + 0x00e6] %asi, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xb32c5000  ! 949: SLLX_R	sllx	%r17, %r0, %r25
	.word 0xfe55e1e7  ! 950: LDSH_I	ldsh	[%r23 + 0x01e7], %r31
	.word 0xf495c020  ! 956: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_44:
	mov	0x23, %r14
	.word 0xfedb8400  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_41:
	mov	0x2f, %r14
	.word 0xf0f38e40  ! 958: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_78:
	setx	0x24031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294c020  ! 961: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	.word 0xf45c8000  ! 964: LDX_R	ldx	[%r18 + %r0], %r26
cpu_intr_2_79:
	setx	0x270006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, d)
	.word 0xf60d4000  ! 971: LDUB_R	ldub	[%r21 + %r0], %r27
cpu_intr_2_80:
	setx	0x270114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05da180  ! 976: LDX_I	ldx	[%r22 + 0x0180], %r24
cpu_intr_2_81:
	setx	0x270321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4358000  ! 980: SUBC_R	orn 	%r22, %r0, %r26
T2_asi_reg_wr_42:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 981: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc550000  ! 983: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xfe04a1f9  ! 984: LDUW_I	lduw	[%r18 + 0x01f9], %r31
	.word 0xba2da1f5  ! 985: ANDN_I	andn 	%r22, 0x01f5, %r29
T2_asi_reg_wr_43:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 986: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 2a)
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b8a  ! 990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8a, %hpstate
T2_asi_reg_rd_45:
	mov	0x1b, %r14
	.word 0xf8db89e0  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_82:
	setx	0x26021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e162  ! 997: WRPR_PIL_I	wrpr	%r23, 0x0162, %pil
	.word 0xfccd61ed  ! 999: LDSBA_I	ldsba	[%r21, + 0x01ed] %asi, %r30
T2_asi_reg_rd_46:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_83:
	setx	0x25031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_84:
	setx	0x240004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfa55a183  ! 1006: LDSH_I	ldsh	[%r22 + 0x0183], %r29
cpu_intr_2_85:
	setx	0x240022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8440000  ! 1008: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xb43cc000  ! 1009: XNOR_R	xnor 	%r19, %r0, %r26
	.word 0xf64cc000  ! 1011: LDSB_R	ldsb	[%r19 + %r0], %r27
cpu_intr_2_86:
	setx	0x250318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb4b4a046  ! 1016: SUBCcc_I	orncc 	%r18, 0x0046, %r26
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_87:
	setx	0x240237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_88:
	setx	0x240101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf65c0000  ! 1027: LDX_R	ldx	[%r16 + %r0], %r27
cpu_intr_2_89:
	setx	0x270001, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfac521e8  ! 1036: LDSWA_I	ldswa	[%r20, + 0x01e8] %asi, %r29
cpu_intr_2_90:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 39)
	.word 0xfec56140  ! 1043: LDSWA_I	ldswa	[%r21, + 0x0140] %asi, %r31
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_47:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb88d607f  ! 1048: ANDcc_I	andcc 	%r21, 0x007f, %r28
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbe250000  ! 1052: SUB_R	sub 	%r20, %r0, %r31
	.word 0xf8cd4020  ! 1053: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
T2_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_91:
	setx	0x260019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_92:
	setx	0x27031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf65d2012  ! 1067: LDX_I	ldx	[%r20 + 0x0012], %r27
T2_asi_reg_wr_44:
	mov	0x26, %r14
	.word 0xf2f38400  ! 1070: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf6c521e1  ! 1074: LDSWA_I	ldswa	[%r20, + 0x01e1] %asi, %r27
T2_asi_reg_rd_49:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf80d8000  ! 1077: LDUB_R	ldub	[%r22 + %r0], %r28
T2_asi_reg_rd_50:
	mov	0x2c, %r14
	.word 0xfcdb8e60  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf2850020  ! 1079: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
	.word 0xfec46035  ! 1081: LDSWA_I	ldswa	[%r17, + 0x0035] %asi, %r31
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 3)
	.word 0xf054c000  ! 1088: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xf8d5a03c  ! 1091: LDSHA_I	ldsha	[%r22, + 0x003c] %asi, %r28
T2_asi_reg_rd_51:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 1094: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd520000  ! 1102: RDPR_PIL	<illegal instruction>
	.word 0xf8d520a6  ! 1105: LDSHA_I	ldsha	[%r20, + 0x00a6] %asi, %r28
T2_asi_reg_wr_45:
	mov	0x0, %r14
	.word 0xf6f38e60  ! 1107: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf885a060  ! 1115: LDUWA_I	lduwa	[%r22, + 0x0060] %asi, %r28
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_93:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe454000  ! 1126: LDSW_R	ldsw	[%r21 + %r0], %r31
T2_asi_reg_rd_52:
	mov	0x4, %r14
	.word 0xf0db84a0  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf6cda06b  ! 1130: LDSBA_I	ldsba	[%r22, + 0x006b] %asi, %r27
T2_asi_reg_wr_46:
	mov	0x3, %r14
	.word 0xf8f38400  ! 1131: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf65561d5  ! 1134: LDSH_I	ldsh	[%r21 + 0x01d5], %r27
	ta	T_CHANGE_HPRIV
	.word 0xf6cc6015  ! 1138: LDSBA_I	ldsba	[%r17, + 0x0015] %asi, %r27
cpu_intr_2_94:
	setx	0x270000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_95:
	setx	0x27013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 1147: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb6a4a0ec  ! 1149: SUBcc_I	subcc 	%r18, 0x00ec, %r27
T2_asi_reg_rd_53:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_48:
	mov	0xb, %r14
	.word 0xf6f38e40  ! 1156: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_49:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 1163: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_54:
	mov	0x1e, %r14
	.word 0xf8db8e80  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf6c50020  ! 1166: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
	.word 0xfe55213e  ! 1167: LDSH_I	ldsh	[%r20 + 0x013e], %r31
	.word 0xb3353001  ! 1168: SRLX_I	srlx	%r20, 0x0001, %r25
	.word 0xf8cd4020  ! 1171: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
	.word 0xba9da17b  ! 1172: XORcc_I	xorcc 	%r22, 0x017b, %r29
cpu_intr_2_96:
	setx	0x250119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_97:
	setx	0x270121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_98:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe84c020  ! 1189: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
cpu_intr_2_99:
	setx	0x250322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d2001  ! 1192: SLL_I	sll 	%r20, 0x0001, %r28
cpu_intr_2_100:
	setx	0x250134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_55:
	mov	0x12, %r14
	.word 0xf6db8400  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_101:
	setx	0x270122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_50:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 1204: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfcc46086  ! 1208: LDSWA_I	ldswa	[%r17, + 0x0086] %asi, %r30
	.word 0xfccde1b0  ! 1209: LDSBA_I	ldsba	[%r23, + 0x01b0] %asi, %r30
T2_asi_reg_wr_51:
	mov	0x2e, %r14
	.word 0xf8f38e80  ! 1213: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_56:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_52:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 1217: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbc042195  ! 1218: ADD_I	add 	%r16, 0x0195, %r30
	.word 0xf2d4214d  ! 1219: LDSHA_I	ldsha	[%r16, + 0x014d] %asi, %r25
cpu_intr_2_102:
	setx	0x250238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_53:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 1221: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf6c5a14e  ! 1222: LDSWA_I	ldswa	[%r22, + 0x014e] %asi, %r27
	.word 0xf08dc020  ! 1223: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1227: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 19)
	.word 0xb28c8000  ! 1229: ANDcc_R	andcc 	%r18, %r0, %r25
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa154000  ! 1236: LDUH_R	lduh	[%r21 + %r0], %r29
T2_asi_reg_rd_57:
	mov	0x9, %r14
	.word 0xf8db89e0  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f00  ! 1240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f00, %hpstate
cpu_intr_2_103:
	setx	0x250002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_58:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 1242: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf895c020  ! 1244: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, d)
	.word 0xf20c8000  ! 1246: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xbaac4000  ! 1249: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xfc0d20c5  ! 1250: LDUB_I	ldub	[%r20 + 0x00c5], %r30
cpu_intr_2_104:
	setx	0x270016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa152114  ! 1254: LDUH_I	lduh	[%r20 + 0x0114], %r29
	.word 0xfe048000  ! 1255: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf8d4e0ef  ! 1256: LDSHA_I	ldsha	[%r19, + 0x00ef] %asi, %r28
	.word 0xf0940020  ! 1260: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
cpu_intr_2_105:
	setx	0x25010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_106:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85ca1a9  ! 1266: LDX_I	ldx	[%r18 + 0x01a9], %r28
	.word 0xf2140000  ! 1269: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf005e06f  ! 1270: LDUW_I	lduw	[%r23 + 0x006f], %r24
cpu_intr_2_107:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805c000  ! 1274: LDUW_R	lduw	[%r23 + %r0], %r28
cpu_intr_2_108:
	setx	0x250113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_59:
	mov	0x8, %r14
	.word 0xfadb8e60  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb0854000  ! 1278: ADDcc_R	addcc 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6952173  ! 1282: LDUHA_I	lduha	[%r20, + 0x0173] %asi, %r27
cpu_intr_2_109:
	setx	0x24001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4048000  ! 1289: ADD_R	add 	%r18, %r0, %r26
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_110:
	setx	0x240238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_111:
	setx	0x240111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_112:
	setx	0x26010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c5a180  ! 1296: LDSWA_I	ldswa	[%r22, + 0x0180] %asi, %r24
	.word 0xf65dc000  ! 1298: LDX_R	ldx	[%r23 + %r0], %r27
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_55:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 1300: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_113:
	setx	0x27002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_60:
	mov	0x13, %r14
	.word 0xfcdb89e0  ! 1308: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb32de001  ! 1310: SLL_I	sll 	%r23, 0x0001, %r25
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfcdce116  ! 1317: LDXA_I	ldxa	[%r19, + 0x0116] %asi, %r30
	.word 0xf68da12e  ! 1320: LDUBA_I	lduba	[%r22, + 0x012e] %asi, %r27
	.word 0xfe8c0020  ! 1325: LDUBA_R	lduba	[%r16, %r0] 0x01, %r31
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 31)
	.word 0xf4c52135  ! 1331: LDSWA_I	ldswa	[%r20, + 0x0135] %asi, %r26
	.word 0xf60c617d  ! 1343: LDUB_I	ldub	[%r17 + 0x017d], %r27
T2_asi_reg_wr_56:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 1345: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_57:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 1348: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 14)
	.word 0xf0958020  ! 1351: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
	.word 0xb37dc400  ! 1352: MOVR_R	movre	%r23, %r0, %r25
	.word 0xf0858020  ! 1353: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	.word 0xfa5d4000  ! 1354: LDX_R	ldx	[%r21 + %r0], %r29
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_61:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2d5e0da  ! 1357: LDSHA_I	ldsha	[%r23, + 0x00da] %asi, %r25
cpu_intr_2_114:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_58:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 1361: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_59:
	mov	0x2b, %r14
	.word 0xf6f38e40  ! 1362: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf015a1c2  ! 1363: LDUH_I	lduh	[%r22 + 0x01c2], %r24
	.word 0xf0d461f2  ! 1367: LDSHA_I	ldsha	[%r17, + 0x01f2] %asi, %r24
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_115:
	setx	0x260203, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf4148000  ! 1373: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf89560d9  ! 1376: LDUHA_I	lduha	[%r21, + 0x00d9] %asi, %r28
T2_asi_reg_wr_60:
	mov	0x13, %r14
	.word 0xf6f389e0  ! 1378: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, b)
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_62:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 1384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf2958020  ! 1386: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
T2_asi_reg_rd_63:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 1387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_116:
	setx	0x27022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf04c0000  ! 1391: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xf004c000  ! 1393: LDUW_R	lduw	[%r19 + %r0], %r24
cpu_intr_2_117:
	setx	0x29031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_61:
	mov	0x33, %r14
	.word 0xf6f38e80  ! 1395: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 29)
	.word 0xb29d6155  ! 1398: XORcc_I	xorcc 	%r21, 0x0155, %r25
	.word 0xf2558000  ! 1399: LDSH_R	ldsh	[%r22 + %r0], %r25
cpu_intr_2_118:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4a1bf  ! 1403: ORNcc_I	orncc 	%r18, 0x01bf, %r27
T2_asi_reg_rd_64:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_65:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb53de001  ! 1406: SRA_I	sra 	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982948  ! 1408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5c4000  ! 1419: LDX_R	ldx	[%r17 + %r0], %r29
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, c)
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 14)
	.word 0xf885e0a2  ! 1423: LDUWA_I	lduwa	[%r23, + 0x00a2] %asi, %r28
T2_asi_reg_rd_66:
	mov	0x16, %r14
	.word 0xfadb8e60  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_119:
	setx	0x290226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_120:
	setx	0x280116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_67:
	mov	0x23, %r14
	.word 0xf4db8e60  ! 1436: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb935b001  ! 1438: SRLX_I	srlx	%r22, 0x0001, %r28
	.word 0xf60dc000  ! 1439: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf24dc000  ! 1441: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xb4a52068  ! 1445: SUBcc_I	subcc 	%r20, 0x0068, %r26
cpu_intr_2_121:
	setx	0x2b0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_122:
	setx	0x2b001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b18  ! 1457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b18, %hpstate
T2_asi_reg_wr_62:
	mov	0xb, %r14
	.word 0xf0f38400  ! 1462: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf64d8000  ! 1464: LDSB_R	ldsb	[%r22 + %r0], %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfe850020  ! 1468: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r31
	.word 0xfc544000  ! 1469: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xb4c4a105  ! 1471: ADDCcc_I	addccc 	%r18, 0x0105, %r26
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f92  ! 1472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f92, %hpstate
T2_asi_reg_rd_68:
	mov	0x5, %r14
	.word 0xf8db8e40  ! 1474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_63:
	mov	0x34, %r14
	.word 0xf2f384a0  ! 1476: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_123:
	setx	0x290008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83da0cd  ! 1486: XNOR_I	xnor 	%r22, 0x00cd, %r28
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_69:
	mov	0x24, %r14
	.word 0xf6db8400  ! 1488: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_70:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 1490: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_wr_64:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 1493: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_65:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 1494: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_124:
	setx	0x290233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc14a047  ! 1499: LDUH_I	lduh	[%r18 + 0x0047], %r30
	.word 0xf0cdc020  ! 1500: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
T2_asi_reg_rd_71:
	mov	0x38, %r14
	.word 0xf6db8e60  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf6c40020  ! 1504: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
	.word 0xfecc0020  ! 1506: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_125:
	setx	0x29030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_72:
	mov	0x23, %r14
	.word 0xf2db8e40  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_66:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1515: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf05d601f  ! 1516: LDX_I	ldx	[%r21 + 0x001f], %r24
cpu_intr_2_126:
	setx	0x280005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3de1b6  ! 1522: XNOR_I	xnor 	%r23, 0x01b6, %r31
	.word 0xfc140000  ! 1523: LDUH_R	lduh	[%r16 + %r0], %r30
T2_asi_reg_rd_73:
	mov	0x38, %r14
	.word 0xf2db84a0  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe04e112  ! 1526: LDUW_I	lduw	[%r19 + 0x0112], %r31
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4d4214c  ! 1534: LDSHA_I	ldsha	[%r16, + 0x014c] %asi, %r26
T2_asi_reg_wr_67:
	mov	0x20, %r14
	.word 0xfaf389e0  ! 1535: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 7)
	.word 0xf8958020  ! 1542: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
T2_asi_reg_wr_68:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 1543: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_69:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 1544: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfe0dc000  ! 1545: LDUB_R	ldub	[%r23 + %r0], %r31
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 23)
	.word 0xf04ca086  ! 1547: LDSB_I	ldsb	[%r18 + 0x0086], %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xbd51c000  ! 1551: RDPR_TL	<illegal instruction>
	.word 0xfa8d6058  ! 1555: LDUBA_I	lduba	[%r21, + 0x0058] %asi, %r29
	.word 0xf284c020  ! 1557: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
	.word 0xf2cc4020  ! 1558: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
	.word 0xf05c8000  ! 1559: LDX_R	ldx	[%r18 + %r0], %r24
cpu_intr_2_127:
	setx	0x2b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_70:
	mov	0x0, %r14
	.word 0xf2f38400  ! 1561: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfccd4020  ! 1564: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_74:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 1570: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_rd_75:
	mov	0x2c, %r14
	.word 0xf0db84a0  ! 1574: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf04c4000  ! 1575: LDSB_R	ldsb	[%r17 + %r0], %r24
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_HPRIV
	.word 0xf4d50020  ! 1582: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
cpu_intr_2_128:
	setx	0x2b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_71:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1589: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_76:
	mov	0x26, %r14
	.word 0xf2db8e60  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_129:
	setx	0x2b032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0548000  ! 1594: LDSH_R	ldsh	[%r18 + %r0], %r24
cpu_intr_2_130:
	setx	0x290204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_131:
	setx	0x2b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 27)
	.word 0xfcc48020  ! 1601: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
T2_asi_reg_wr_72:
	mov	0x1f, %r14
	.word 0xfef384a0  ! 1605: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 1)
	.word 0xf0848020  ! 1612: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 8)
	.word 0xf4d48020  ! 1615: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL0
cpu_intr_2_132:
	setx	0x2a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_73:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 1622: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6cce099  ! 1630: LDSBA_I	ldsba	[%r19, + 0x0099] %asi, %r27
	.word 0xf8c44020  ! 1632: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
	.word 0xf45420f4  ! 1633: LDSH_I	ldsh	[%r16 + 0x00f4], %r26
	.word 0xf415a169  ! 1634: LDUH_I	lduh	[%r22 + 0x0169], %r26
	.word 0xf00ce14d  ! 1637: LDUB_I	ldub	[%r19 + 0x014d], %r24
	.word 0xbc94a061  ! 1638: ORcc_I	orcc 	%r18, 0x0061, %r30
T2_asi_reg_rd_77:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 1639: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf2854020  ! 1648: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
	.word 0xfa8ce043  ! 1649: LDUBA_I	lduba	[%r19, + 0x0043] %asi, %r29
T2_asi_reg_rd_78:
	mov	0x0, %r14
	.word 0xfcdb89e0  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_79:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_74:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 1654: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa4d0000  ! 1655: LDSB_R	ldsb	[%r20 + %r0], %r29
cpu_intr_2_133:
	setx	0x2a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c46054  ! 1659: LDSWA_I	ldswa	[%r17, + 0x0054] %asi, %r28
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, a)
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_134:
	setx	0x280313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d208c  ! 1669: LDX_I	ldx	[%r20 + 0x008c], %r29
cpu_intr_2_135:
	setx	0x280301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2048000  ! 1675: LDUW_R	lduw	[%r18 + %r0], %r25
T2_asi_reg_wr_75:
	mov	0x2f, %r14
	.word 0xf0f389e0  ! 1676: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_76:
	mov	0x16, %r14
	.word 0xfcf38e60  ! 1681: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_136:
	setx	0x2a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfcc58020  ! 1692: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	.word 0xfc146001  ! 1693: LDUH_I	lduh	[%r17 + 0x0001], %r30
T2_asi_reg_wr_77:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 1694: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
	.word 0xfc5c0000  ! 1697: LDX_R	ldx	[%r16 + %r0], %r30
T2_asi_reg_wr_78:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 1698: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf284c020  ! 1699: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
	.word 0xb1641800  ! 1700: MOVcc_R	<illegal instruction>
	.word 0xfe840020  ! 1703: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xf204c000  ! 1704: LDUW_R	lduw	[%r19 + %r0], %r25
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c1a  ! 1707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1a, %hpstate
	.word 0xfccdc020  ! 1708: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_80:
	mov	0x30, %r14
	.word 0xfedb8e80  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb57d6401  ! 1718: MOVR_I	movre	%r21, 0x1, %r26
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe5c60e4  ! 1722: LDX_I	ldx	[%r17 + 0x00e4], %r31
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 15)
	.word 0xf08cc020  ! 1725: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_137:
	setx	0x2b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d2038  ! 1732: XOR_I	xor 	%r20, 0x0038, %r31
cpu_intr_2_138:
	setx	0x2b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d2191  ! 1735: LDX_I	ldx	[%r20 + 0x0191], %r26
cpu_intr_2_139:
	setx	0x2b0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecd0020  ! 1744: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 13)
	.word 0xf6040000  ! 1748: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf25ce150  ! 1751: LDX_I	ldx	[%r19 + 0x0150], %r25
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_81:
	mov	0x25, %r14
	.word 0xf0db8400  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 0)
	.word 0xf815e1e1  ! 1760: LDUH_I	lduh	[%r23 + 0x01e1], %r28
	.word 0xfadc209b  ! 1761: LDXA_I	ldxa	[%r16, + 0x009b] %asi, %r29
	.word 0xf68d0020  ! 1763: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	.word 0xf8c4c020  ! 1764: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e8a  ! 1767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
	.word 0xbc9c0000  ! 1768: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xf4c5600b  ! 1769: LDSWA_I	ldswa	[%r21, + 0x000b] %asi, %r26
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 2b)
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982dc0  ! 1771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
	.word 0xf004c000  ! 1772: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf84d2129  ! 1774: LDSB_I	ldsb	[%r20 + 0x0129], %r28
	.word 0xf24d0000  ! 1775: LDSB_R	ldsb	[%r20 + %r0], %r25
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_82:
	mov	0x12, %r14
	.word 0xf2db8400  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_wr_79:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 1779: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf044c000  ! 1780: LDSW_R	ldsw	[%r19 + %r0], %r24
T2_asi_reg_rd_83:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc4c4000  ! 1783: LDSB_R	ldsb	[%r17 + %r0], %r30
cpu_intr_2_140:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe94a1d8  ! 1791: LDUHA_I	lduha	[%r18, + 0x01d8] %asi, %r31
	.word 0xf454c000  ! 1792: LDSH_R	ldsh	[%r19 + %r0], %r26
T2_asi_reg_rd_84:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 1793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc55e052  ! 1794: LDSH_I	ldsh	[%r23 + 0x0052], %r30
T2_asi_reg_wr_80:
	mov	0x0, %r14
	.word 0xf2f38e80  ! 1795: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf2850020  ! 1796: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_HPRIV
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_141:
	setx	0x2b0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dc614b  ! 1812: LDXA_I	ldxa	[%r17, + 0x014b] %asi, %r28
cpu_intr_2_142:
	setx	0x290130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48ce1be  ! 1814: LDUBA_I	lduba	[%r19, + 0x01be] %asi, %r26
	.word 0xf88da114  ! 1815: LDUBA_I	lduba	[%r22, + 0x0114] %asi, %r28
T2_asi_reg_wr_81:
	mov	0x36, %r14
	.word 0xf2f38e80  ! 1816: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_wr_82:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 1821: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf2852129  ! 1822: LDUWA_I	lduwa	[%r20, + 0x0129] %asi, %r25
	.word 0xb03d21df  ! 1823: XNOR_I	xnor 	%r20, 0x01df, %r24
	.word 0xfa84c020  ! 1826: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
T2_asi_reg_rd_85:
	mov	0xa, %r14
	.word 0xf6db8e80  ! 1827: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_83:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 1832: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_86:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 17)
	.word 0xf0158000  ! 1837: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf4556124  ! 1838: LDSH_I	ldsh	[%r21 + 0x0124], %r26
cpu_intr_2_143:
	setx	0x2c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_144:
	setx	0x2d012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c0020  ! 1844: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
	.word 0xfa8da194  ! 1845: LDUBA_I	lduba	[%r22, + 0x0194] %asi, %r29
T2_asi_reg_rd_87:
	mov	0x30, %r14
	.word 0xf2db84a0  ! 1846: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfc944020  ! 1847: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	.word 0xf88cc020  ! 1848: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
	.word 0xfedd60b0  ! 1849: LDXA_I	ldxa	[%r21, + 0x00b0] %asi, %r31
T2_asi_reg_wr_84:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 1852: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf2cd4020  ! 1853: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 11)
	.word 0xbc2cc000  ! 1857: ANDN_R	andn 	%r19, %r0, %r30
T2_asi_reg_rd_88:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfc5ca038  ! 1860: LDX_I	ldx	[%r18 + 0x0038], %r30
cpu_intr_2_145:
	setx	0x2c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c6070  ! 1862: LDUBA_I	lduba	[%r17, + 0x0070] %asi, %r31
cpu_intr_2_146:
	setx	0x2d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 28)
	.word 0xb4b4c000  ! 1869: ORNcc_R	orncc 	%r19, %r0, %r26
	.word 0xbd3c0000  ! 1871: SRA_R	sra 	%r16, %r0, %r30
T2_asi_reg_wr_85:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1872: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa55c000  ! 1875: LDSH_R	ldsh	[%r23 + %r0], %r29
T2_asi_reg_wr_86:
	mov	0x28, %r14
	.word 0xfcf384a0  ! 1876: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf64d8000  ! 1878: LDSB_R	ldsb	[%r22 + %r0], %r27
T2_asi_reg_rd_89:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_87:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 1881: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc4c0000  ! 1885: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xfa548000  ! 1888: LDSH_R	ldsh	[%r18 + %r0], %r29
cpu_intr_2_147:
	setx	0x2c020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20461b3  ! 1897: LDUW_I	lduw	[%r17 + 0x01b3], %r25
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_148:
	setx	0x2e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_149:
	setx	0x2d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d420ea  ! 1903: LDSHA_I	ldsha	[%r16, + 0x00ea] %asi, %r25
T2_asi_reg_rd_90:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_91:
	mov	0x29, %r14
	.word 0xfadb8e60  ! 1908: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f8a  ! 1910: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f8a, %hpstate
cpu_intr_2_150:
	setx	0x2e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_151:
	setx	0x2d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_152:
	setx	0x2d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_153:
	setx	0x2d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_154:
	setx	0x2e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_88:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 1921: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_89:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 1923: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xb2458000  ! 1929: ADDC_R	addc 	%r22, %r0, %r25
T2_asi_reg_wr_90:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 1931: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbaacc000  ! 1934: ANDNcc_R	andncc 	%r19, %r0, %r29
	.word 0xbcc44000  ! 1935: ADDCcc_R	addccc 	%r17, %r0, %r30
T2_asi_reg_wr_91:
	mov	0x21, %r14
	.word 0xf4f38e60  ! 1937: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_TO_TL0
	.word 0xfe558000  ! 1942: LDSH_R	ldsh	[%r22 + %r0], %r31
cpu_intr_2_155:
	setx	0x2e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80461a7  ! 1946: LDUW_I	lduw	[%r17 + 0x01a7], %r28
	.word 0xfc4da016  ! 1947: LDSB_I	ldsb	[%r22 + 0x0016], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa04c000  ! 1950: LDUW_R	lduw	[%r19 + %r0], %r29
	.word 0xfc0d0000  ! 1952: LDUB_R	ldub	[%r20 + %r0], %r30
T2_asi_reg_wr_92:
	mov	0x35, %r14
	.word 0xf4f38400  ! 1953: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_93:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 1956: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_92:
	mov	0x29, %r14
	.word 0xf2db84a0  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf654c000  ! 1962: LDSH_R	ldsh	[%r19 + %r0], %r27
cpu_intr_2_156:
	setx	0x2f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 37)
	.word 0xf48420fb  ! 1966: LDUWA_I	lduwa	[%r16, + 0x00fb] %asi, %r26
	.word 0xf4c54020  ! 1974: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
	.word 0xfc15a1ff  ! 1976: LDUH_I	lduh	[%r22 + 0x01ff], %r30
	.word 0xbcad4000  ! 1977: ANDNcc_R	andncc 	%r21, %r0, %r30
cpu_intr_2_157:
	setx	0x2c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_94:
	mov	0x1, %r14
	.word 0xf4f38e80  ! 1980: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_95:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 1982: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc0c61b1  ! 1983: LDUB_I	ldub	[%r17 + 0x01b1], %r30
	.word 0xf6d48020  ! 1985: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4840000  ! 1993: ADDcc_R	addcc 	%r16, %r0, %r26
cpu_intr_2_158:
	setx	0x2d0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_96:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 1998: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe0da1a7  ! 1999: AND_I	and 	%r22, 0x01a7, %r31
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 6)
	.word 0xf88c6019  ! 2004: LDUBA_I	lduba	[%r17, + 0x0019] %asi, %r28
cpu_intr_2_160:
	setx	0x2d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 15)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f4a  ! 2009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
	.word 0xf8558000  ! 2014: LDSH_R	ldsh	[%r22 + %r0], %r28
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_161:
	setx	0x2e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0948020  ! 2017: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xfe140000  ! 2018: LDUH_R	lduh	[%r16 + %r0], %r31
T2_asi_reg_wr_97:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 2019: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_162:
	setx	0x2c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982952  ! 2025: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
cpu_intr_2_163:
	setx	0x2c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb00d4000  ! 2030: AND_R	and 	%r21, %r0, %r24
	.word 0xf45d8000  ! 2034: LDX_R	ldx	[%r22 + %r0], %r26
T2_asi_reg_wr_98:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 2036: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_164:
	setx	0x2c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 2044: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_165:
	setx	0x2e0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb62d2124  ! 2051: ANDN_I	andn 	%r20, 0x0124, %r27
cpu_intr_2_166:
	setx	0x2c002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_167:
	setx	0x2d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb1352001  ! 2055: SRL_I	srl 	%r20, 0x0001, %r24
cpu_intr_2_168:
	setx	0x2e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccd0020  ! 2057: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
cpu_intr_2_169:
	setx	0x2f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08de127  ! 2063: ANDcc_I	andcc 	%r23, 0x0127, %r24
	.word 0xfe8d0020  ! 2064: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc858020  ! 2071: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
cpu_intr_2_170:
	setx	0x2d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_100:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 2076: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe8ca05a  ! 2077: LDUBA_I	lduba	[%r18, + 0x005a] %asi, %r31
	.word 0xb62521ea  ! 2078: SUB_I	sub 	%r20, 0x01ea, %r27
	.word 0xfc058000  ! 2080: LDUW_R	lduw	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8546142  ! 2084: LDSH_I	ldsh	[%r17 + 0x0142], %r28
	.word 0xb42d8000  ! 2085: ANDN_R	andn 	%r22, %r0, %r26
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982ec2  ! 2086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec2, %hpstate
	.word 0xfa14c000  ! 2087: LDUH_R	lduh	[%r19 + %r0], %r29
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_101:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 2089: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_171:
	setx	0x2f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedca056  ! 2092: LDXA_I	ldxa	[%r18, + 0x0056] %asi, %r31
	.word 0xfa44601d  ! 2093: LDSW_I	ldsw	[%r17 + 0x001d], %r29
T2_asi_reg_wr_102:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 2094: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 0)
	.word 0xf28c4020  ! 2105: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
T2_asi_reg_rd_93:
	mov	0x8, %r14
	.word 0xf0db84a0  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 2e)
	.word 0x8d94e015  ! 2112: WRPR_PSTATE_I	wrpr	%r19, 0x0015, %pstate
	.word 0xfc054000  ! 2113: LDUW_R	lduw	[%r21 + %r0], %r30
T2_asi_reg_wr_103:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 2120: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf20da14c  ! 2122: LDUB_I	ldub	[%r22 + 0x014c], %r25
	.word 0xf015a1ea  ! 2124: LDUH_I	lduh	[%r22 + 0x01ea], %r24
	.word 0xfc450000  ! 2125: LDSW_R	ldsw	[%r20 + %r0], %r30
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d1a  ! 2127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d1a, %hpstate
	.word 0xfa94a119  ! 2128: LDUHA_I	lduha	[%r18, + 0x0119] %asi, %r29
cpu_intr_2_172:
	setx	0x2d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd2170  ! 2131: LDSBA_I	ldsba	[%r20, + 0x0170] %asi, %r28
T2_asi_reg_rd_94:
	mov	0x16, %r14
	.word 0xfcdb8e60  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb134b001  ! 2133: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xf20c6041  ! 2134: LDUB_I	ldub	[%r17 + 0x0041], %r25
	.word 0xfad4e145  ! 2135: LDSHA_I	ldsha	[%r19, + 0x0145] %asi, %r29
T2_asi_reg_rd_95:
	mov	0x13, %r14
	.word 0xfadb8e80  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_96:
	mov	0x1c, %r14
	.word 0xf2db8e60  ! 2148: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_104:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 2150: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_97:
	mov	0x0, %r14
	.word 0xf8db8e40  ! 2152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_98:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf4444000  ! 2159: LDSW_R	ldsw	[%r17 + %r0], %r26
T2_asi_reg_wr_105:
	mov	0x29, %r14
	.word 0xf0f38400  ! 2162: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf0544000  ! 2163: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xbb7de401  ! 2164: MOVR_I	movre	%r23, 0x1, %r29
T2_asi_reg_wr_106:
	mov	0x17, %r14
	.word 0xf0f38e80  ! 2165: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, f)
	.word 0xb9346001  ! 2170: SRL_I	srl 	%r17, 0x0001, %r28
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 25)
	.word 0xf055e0ed  ! 2175: LDSH_I	ldsh	[%r23 + 0x00ed], %r24
	.word 0xf6540000  ! 2177: LDSH_R	ldsh	[%r16 + %r0], %r27
T2_asi_reg_rd_99:
	mov	0x21, %r14
	.word 0xfedb8400  ! 2180: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbf643801  ! 2182: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_100:
	mov	0x1b, %r14
	.word 0xf0db8400  ! 2183: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_173:
	setx	0x2c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6550000  ! 2187: LDSH_R	ldsh	[%r20 + %r0], %r27
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_174:
	setx	0x2d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_175:
	setx	0x2e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_107:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 2192: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf055c000  ! 2196: LDSH_R	ldsh	[%r23 + %r0], %r24
T2_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf814a02f  ! 2198: LDUH_I	lduh	[%r18 + 0x002f], %r28
	.word 0xfe0520ae  ! 2199: LDUW_I	lduw	[%r20 + 0x00ae], %r31
T2_asi_reg_wr_108:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 2201: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf6d44020  ! 2202: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
T2_asi_reg_rd_102:
	mov	0x11, %r14
	.word 0xf8db8e80  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf0054000  ! 2204: LDUW_R	lduw	[%r21 + %r0], %r24
T2_asi_reg_wr_109:
	mov	0xe, %r14
	.word 0xf2f38e80  ! 2205: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6054000  ! 2207: LDUW_R	lduw	[%r21 + %r0], %r27
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_103:
	mov	0x19, %r14
	.word 0xfedb8400  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf0544000  ! 2214: LDSH_R	ldsh	[%r17 + %r0], %r24
T2_asi_reg_wr_110:
	mov	0x11, %r14
	.word 0xf8f384a0  ! 2215: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_rd_104:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 2216: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 27)
	.word 0xf65ce035  ! 2219: LDX_I	ldx	[%r19 + 0x0035], %r27
T2_asi_reg_rd_105:
	mov	0x29, %r14
	.word 0xf2db8e60  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb0b521be  ! 2221: SUBCcc_I	orncc 	%r20, 0x01be, %r24
	.word 0xfc856104  ! 2222: LDUWA_I	lduwa	[%r21, + 0x0104] %asi, %r30
	.word 0xfa04a0b6  ! 2223: LDUW_I	lduw	[%r18 + 0x00b6], %r29
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf6cdc020  ! 2235: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_106:
	mov	0x36, %r14
	.word 0xf8db84a0  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_176:
	setx	0x2c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_107:
	mov	0x1, %r14
	.word 0xfedb84a0  ! 2239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfc55a0d4  ! 2241: LDSH_I	ldsh	[%r22 + 0x00d4], %r30
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_108:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf884612b  ! 2246: LDUWA_I	lduwa	[%r17, + 0x012b] %asi, %r28
	.word 0xb28420d1  ! 2248: ADDcc_I	addcc 	%r16, 0x00d1, %r25
cpu_intr_2_177:
	setx	0x2d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_111:
	mov	0x38, %r14
	.word 0xf0f384a0  ! 2250: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf6040000  ! 2251: LDUW_R	lduw	[%r16 + %r0], %r27
T2_asi_reg_wr_112:
	mov	0x37, %r14
	.word 0xfef384a0  ! 2253: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_178:
	setx	0x2f0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_179:
	setx	0x2d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_180:
	setx	0x2e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_113:
	mov	0x35, %r14
	.word 0xf0f384a0  ! 2267: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf694e055  ! 2269: LDUHA_I	lduha	[%r19, + 0x0055] %asi, %r27
T2_asi_reg_rd_109:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2271: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa05a048  ! 2272: LDUW_I	lduw	[%r22 + 0x0048], %r29
	.word 0xf0948020  ! 2273: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xb88c8000  ! 2276: ANDcc_R	andcc 	%r18, %r0, %r28
	.word 0xfc44a101  ! 2279: LDSW_I	ldsw	[%r18 + 0x0101], %r30
cpu_intr_2_181:
	setx	0x2f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 3)
	.word 0xfa05a152  ! 2284: LDUW_I	lduw	[%r22 + 0x0152], %r29
	.word 0xf4458000  ! 2285: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xbd359000  ! 2287: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xf084a0d7  ! 2289: LDUWA_I	lduwa	[%r18, + 0x00d7] %asi, %r24
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf8cd8020  ! 2294: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	.word 0xfecd0020  ! 2296: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xfe140000  ! 2298: LDUH_R	lduh	[%r16 + %r0], %r31
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 0)
	.word 0xfcd58020  ! 2305: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_182:
	setx	0x33001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0158000  ! 2315: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xb494c000  ! 2322: ORcc_R	orcc 	%r19, %r0, %r26
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 8)
	.word 0xb33cf001  ! 2326: SRAX_I	srax	%r19, 0x0001, %r25
T2_asi_reg_wr_114:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2329: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4048000  ! 2339: LDUW_R	lduw	[%r18 + %r0], %r26
cpu_intr_2_183:
	setx	0x33023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_115:
	mov	0x1, %r14
	.word 0xfef389e0  ! 2342: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 39)
	.word 0xb935e001  ! 2345: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0xfa5c8000  ! 2346: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf645c000  ! 2353: LDSW_R	ldsw	[%r23 + %r0], %r27
T2_asi_reg_rd_110:
	mov	0x29, %r14
	.word 0xfadb8e80  ! 2356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
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
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 1)
	.word 0xf0c5c020  ! 2363: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_184:
	setx	0x320307, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b50  ! 2373: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
T2_asi_reg_wr_116:
	mov	0x28, %r14
	.word 0xfef38e40  ! 2379: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0cdc020  ! 2380: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
cpu_intr_2_185:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d4219f  ! 2383: LDSHA_I	ldsha	[%r16, + 0x019f] %asi, %r27
cpu_intr_2_186:
	setx	0x30002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_187:
	setx	0x33021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0050000  ! 2390: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xb63c8000  ! 2393: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xf4d5c020  ! 2394: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4054000  ! 2396: LDUW_R	lduw	[%r21 + %r0], %r26
T2_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 2397: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb72c8000  ! 2399: SLL_R	sll 	%r18, %r0, %r27
T2_asi_reg_wr_117:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 2401: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfa148000  ! 2402: LDUH_R	lduh	[%r18 + %r0], %r29
cpu_intr_2_188:
	setx	0x30033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_189:
	setx	0x330215, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_112:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 2410: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf494a0ca  ! 2412: LDUHA_I	lduha	[%r18, + 0x00ca] %asi, %r26
T2_asi_reg_rd_113:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf215e1c7  ! 2419: LDUH_I	lduh	[%r23 + 0x01c7], %r25
	.word 0xbd2c4000  ! 2420: SLL_R	sll 	%r17, %r0, %r30
cpu_intr_2_190:
	setx	0x33003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_191:
	setx	0x330025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_192:
	setx	0x33000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_114:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 2424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_193:
	setx	0x330033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe1520cb  ! 2426: LDUH_I	lduh	[%r20 + 0x00cb], %r31
	.word 0xfe44e162  ! 2432: LDSW_I	ldsw	[%r19 + 0x0162], %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfa550000  ! 2437: LDSH_R	ldsh	[%r20 + %r0], %r29
T2_asi_reg_rd_115:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_rd_116:
	mov	0x1e, %r14
	.word 0xf6db8e60  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbc050000  ! 2445: ADD_R	add 	%r20, %r0, %r30
	.word 0xf0dde184  ! 2446: LDXA_I	ldxa	[%r23, + 0x0184] %asi, %r24
T2_asi_reg_rd_117:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_194:
	setx	0x320024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08ca16f  ! 2455: LDUBA_I	lduba	[%r18, + 0x016f] %asi, %r24
cpu_intr_2_195:
	setx	0x33031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d614c  ! 2457: LDUB_I	ldub	[%r21 + 0x014c], %r30
	.word 0xf484a124  ! 2458: LDUWA_I	lduwa	[%r18, + 0x0124] %asi, %r26
T2_asi_reg_wr_118:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 2463: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xba3d20e2  ! 2464: XNOR_I	xnor 	%r20, 0x00e2, %r29
	.word 0xfa54e022  ! 2467: LDSH_I	ldsh	[%r19 + 0x0022], %r29
	.word 0xfecd0020  ! 2468: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xf04560f9  ! 2469: LDSW_I	ldsw	[%r21 + 0x00f9], %r24
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 30)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983dc0  ! 2472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc0, %hpstate
	.word 0xfa05e1e9  ! 2473: LDUW_I	lduw	[%r23 + 0x01e9], %r29
cpu_intr_2_196:
	setx	0x330334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_197:
	setx	0x310124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_198:
	setx	0x32010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_119:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 2482: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc5c8000  ! 2484: LDX_R	ldx	[%r18 + %r0], %r30
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 8)
	.word 0xf2c460b2  ! 2491: LDSWA_I	ldswa	[%r17, + 0x00b2] %asi, %r25
cpu_intr_2_199:
	setx	0x310223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_120:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 2497: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 24)
	.word 0xf6550000  ! 2499: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfc954020  ! 2500: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982918  ! 2502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
T2_asi_reg_wr_121:
	mov	0x34, %r14
	.word 0xfaf38400  ! 2504: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_122:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 2506: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf405c000  ! 2511: LDUW_R	lduw	[%r23 + %r0], %r26
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 23)
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983998  ! 2513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1998, %hpstate
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 27)
	.word 0xf68c6057  ! 2516: LDUBA_I	lduba	[%r17, + 0x0057] %asi, %r27
	.word 0xf494e102  ! 2517: LDUHA_I	lduha	[%r19, + 0x0102] %asi, %r26
	.word 0xfc8d8020  ! 2522: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
	.word 0xfaccc020  ! 2527: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	.word 0xfe140000  ! 2530: LDUH_R	lduh	[%r16 + %r0], %r31
	.word 0xfc5c2188  ! 2532: LDX_I	ldx	[%r16 + 0x0188], %r30
	.word 0xfa058000  ! 2534: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xb69560d4  ! 2536: ORcc_I	orcc 	%r21, 0x00d4, %r27
	.word 0xf8440000  ! 2537: LDSW_R	ldsw	[%r16 + %r0], %r28
T2_asi_reg_rd_118:
	mov	0x21, %r14
	.word 0xf4db84a0  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_200:
	setx	0x300321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_201:
	setx	0x320031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe342040  ! 2552: SUBC_I	orn 	%r16, 0x0040, %r31
cpu_intr_2_202:
	setx	0x310335, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_123:
	mov	0x30, %r14
	.word 0xfcf38e60  ! 2556: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbe05a11c  ! 2560: ADD_I	add 	%r22, 0x011c, %r31
	.word 0xf0c48020  ! 2561: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_124:
	mov	0x24, %r14
	.word 0xfaf38e80  ! 2565: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfc044000  ! 2567: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xfe554000  ! 2568: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xbe9d0000  ! 2572: XORcc_R	xorcc 	%r20, %r0, %r31
cpu_intr_2_203:
	setx	0x330116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c4a00f  ! 2574: ADDCcc_I	addccc 	%r18, 0x000f, %r28
	.word 0xfcc44020  ! 2576: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
cpu_intr_2_204:
	setx	0x310127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeadc000  ! 2578: ANDNcc_R	andncc 	%r23, %r0, %r31
	.word 0xfa8ce19e  ! 2579: LDUBA_I	lduba	[%r19, + 0x019e] %asi, %r29
T2_asi_reg_rd_119:
	mov	0x1a, %r14
	.word 0xfadb8e80  ! 2580: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_205:
	setx	0x310005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c611b  ! 2584: LDUBA_I	lduba	[%r17, + 0x011b] %asi, %r29
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, d)
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, f)
	.word 0xf044e193  ! 2589: LDSW_I	ldsw	[%r19 + 0x0193], %r24
	.word 0xb68ce06b  ! 2590: ANDcc_I	andcc 	%r19, 0x006b, %r27
	.word 0xf44ce095  ! 2591: LDSB_I	ldsb	[%r19 + 0x0095], %r26
	.word 0xb8444000  ! 2593: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xb8ada0f2  ! 2598: ANDNcc_I	andncc 	%r22, 0x00f2, %r28
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 5)
	.word 0xf845c000  ! 2605: LDSW_R	ldsw	[%r23 + %r0], %r28
	ta	T_CHANGE_TO_TL1
	.word 0xbb359000  ! 2608: SRLX_R	srlx	%r22, %r0, %r29
T2_asi_reg_rd_120:
	mov	0x8, %r14
	.word 0xf2db8e60  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfc4d206a  ! 2614: LDSB_I	ldsb	[%r20 + 0x006a], %r30
	.word 0xf854c000  ! 2616: LDSH_R	ldsh	[%r19 + %r0], %r28
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_206:
	setx	0x320138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8942173  ! 2624: LDUHA_I	lduha	[%r16, + 0x0173] %asi, %r28
	.word 0xf4cdc020  ! 2625: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	.word 0xf0940020  ! 2627: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 23)
	.word 0xba9de13f  ! 2630: XORcc_I	xorcc 	%r23, 0x013f, %r29
T2_asi_reg_rd_121:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 2632: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf8550000  ! 2634: LDSH_R	ldsh	[%r20 + %r0], %r28
T2_asi_reg_wr_125:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 2635: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf48da176  ! 2638: LDUBA_I	lduba	[%r22, + 0x0176] %asi, %r26
	.word 0xf00c0000  ! 2639: LDUB_R	ldub	[%r16 + %r0], %r24
T2_asi_reg_rd_122:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_126:
	mov	0x22, %r14
	.word 0xfaf389e0  ! 2649: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_wr_127:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 2650: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb61c8000  ! 2652: XOR_R	xor 	%r18, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb1643801  ! 2655: MOVcc_I	<illegal instruction>
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 32)
	.word 0xf28ca1d1  ! 2658: LDUBA_I	lduba	[%r18, + 0x01d1] %asi, %r25
T2_asi_reg_wr_128:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 2659: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbc15e070  ! 2660: OR_I	or 	%r23, 0x0070, %r30
cpu_intr_2_207:
	setx	0x33022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88ce14c  ! 2665: LDUBA_I	lduba	[%r19, + 0x014c] %asi, %r28
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf80d8000  ! 2669: LDUB_R	ldub	[%r22 + %r0], %r28
T2_asi_reg_rd_123:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8450000  ! 2672: LDSW_R	ldsw	[%r20 + %r0], %r28
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbca48000  ! 2675: SUBcc_R	subcc 	%r18, %r0, %r30
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_124:
	mov	0x21, %r14
	.word 0xf6db8e40  ! 2680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe440000  ! 2683: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xf48d0020  ! 2685: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_208:
	setx	0x32003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_209:
	setx	0x320037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6854020  ! 2690: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, e)
	.word 0xfe4de1a5  ! 2693: LDSB_I	ldsb	[%r23 + 0x01a5], %r31
	.word 0xf084a0dd  ! 2696: LDUWA_I	lduwa	[%r18, + 0x00dd] %asi, %r24
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 0)
	.word 0xf4544000  ! 2698: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf6940020  ! 2699: LDUHA_R	lduha	[%r16, %r0] 0x01, %r27
	.word 0xb48c2113  ! 2702: ANDcc_I	andcc 	%r16, 0x0113, %r26
	.word 0xfa858020  ! 2704: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r29
	.word 0xb09da027  ! 2706: XORcc_I	xorcc 	%r22, 0x0027, %r24
cpu_intr_2_210:
	setx	0x33020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 2711: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_211:
	setx	0x300129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_212:
	setx	0x33023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed420ef  ! 2715: LDSHA_I	ldsha	[%r16, + 0x00ef] %asi, %r31
T2_asi_reg_wr_130:
	mov	0x5, %r14
	.word 0xf2f384a0  ! 2717: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb57de401  ! 2719: MOVR_I	movre	%r23, 0x1, %r26
T2_asi_reg_wr_131:
	mov	0x14, %r14
	.word 0xfaf38e80  ! 2720: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa85211c  ! 2722: LDUWA_I	lduwa	[%r20, + 0x011c] %asi, %r29
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_213:
	setx	0x320120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_214:
	setx	0x330021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004e166  ! 2738: LDUW_I	lduw	[%r19 + 0x0166], %r24
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_125:
	mov	0x24, %r14
	.word 0xfedb8e80  ! 2741: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf6d521ab  ! 2742: LDSHA_I	ldsha	[%r20, + 0x01ab] %asi, %r27
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa04a02f  ! 2745: LDUW_I	lduw	[%r18 + 0x002f], %r29
	.word 0xf05c8000  ! 2747: LDX_R	ldx	[%r18 + %r0], %r24
T2_asi_reg_wr_132:
	mov	0x30, %r14
	.word 0xfef38400  ! 2753: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 2e)
	.word 0xbb50c000  ! 2762: RDPR_TT	<illegal instruction>
T2_asi_reg_rd_126:
	mov	0x20, %r14
	.word 0xf4db8400  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_127:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb2250000  ! 2767: SUB_R	sub 	%r20, %r0, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_215:
	setx	0x360321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8540000  ! 2775: LDSH_R	ldsh	[%r16 + %r0], %r28
cpu_intr_2_216:
	setx	0x350009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 20)
	.word 0xf444615f  ! 2780: LDSW_I	ldsw	[%r17 + 0x015f], %r26
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, f)
	.word 0xfa554000  ! 2782: LDSH_R	ldsh	[%r21 + %r0], %r29
T2_asi_reg_rd_128:
	mov	0xc, %r14
	.word 0xf0db89e0  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf4550000  ! 2787: LDSH_R	ldsh	[%r20 + %r0], %r26
cpu_intr_2_217:
	setx	0x36030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 16)
	.word 0xf24c4000  ! 2793: LDSB_R	ldsb	[%r17 + %r0], %r25
T2_asi_reg_wr_133:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 2797: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 6)
	.word 0xf24d0000  ! 2799: LDSB_R	ldsb	[%r20 + %r0], %r25
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_134:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 2803: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb2340000  ! 2808: SUBC_R	orn 	%r16, %r0, %r25
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_129:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 2814: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_135:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 2816: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_218:
	setx	0x370024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_219:
	setx	0x340110, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_136:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 2823: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_220:
	setx	0x360212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_130:
	mov	0x24, %r14
	.word 0xf6db8e60  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_131:
	mov	0x13, %r14
	.word 0xf0db8e60  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_137:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 2834: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfccca114  ! 2835: LDSBA_I	ldsba	[%r18, + 0x0114] %asi, %r30
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 33)
	.word 0xf4c5c020  ! 2844: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
cpu_intr_2_221:
	setx	0x350236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_222:
	setx	0x340113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 1)
	.word 0xb0c58000  ! 2856: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xf0cc21e2  ! 2857: LDSBA_I	ldsba	[%r16, + 0x01e2] %asi, %r24
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819839c0  ! 2859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c0, %hpstate
cpu_intr_2_223:
	setx	0x350319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60cc000  ! 2861: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xfa44c000  ! 2863: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf65c6174  ! 2864: LDX_I	ldx	[%r17 + 0x0174], %r27
T2_asi_reg_rd_132:
	mov	0xe, %r14
	.word 0xfcdb84a0  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe0c4000  ! 2867: LDUB_R	ldub	[%r17 + %r0], %r31
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf6ccc020  ! 2874: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
T2_asi_reg_rd_133:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6c46110  ! 2881: LDSWA_I	ldswa	[%r17, + 0x0110] %asi, %r27
	.word 0xfccd4020  ! 2883: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
	.word 0xb12c3001  ! 2887: SLLX_I	sllx	%r16, 0x0001, %r24
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_224:
	setx	0x370304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d54020  ! 2894: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
	.word 0xf2c44020  ! 2896: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_225:
	setx	0x360316, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_138:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 2899: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_226:
	setx	0x34033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_227:
	setx	0x37031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_228:
	setx	0x350313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 2b)
	.word 0xbb641800  ! 2908: MOVcc_R	<illegal instruction>
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 21)
	.word 0xf0c5a1f6  ! 2913: LDSWA_I	ldswa	[%r22, + 0x01f6] %asi, %r24
T2_asi_reg_rd_134:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0x8d94200c  ! 2916: WRPR_PSTATE_I	wrpr	%r16, 0x000c, %pstate
	.word 0xbd2d9000  ! 2917: SLLX_R	sllx	%r22, %r0, %r30
	.word 0xba35e027  ! 2918: SUBC_I	orn 	%r23, 0x0027, %r29
cpu_intr_2_229:
	setx	0x340002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_230:
	setx	0x34030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_139:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 2933: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0x8995203e  ! 2934: WRPR_TICK_I	wrpr	%r20, 0x003e, %tick
	.word 0xf05d219d  ! 2935: LDX_I	ldx	[%r20 + 0x019d], %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf885a078  ! 2937: LDUWA_I	lduwa	[%r22, + 0x0078] %asi, %r28
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 11)
	.word 0xf045e094  ! 2940: LDSW_I	ldsw	[%r23 + 0x0094], %r24
cpu_intr_2_231:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa8ce0c6  ! 2952: LDUBA_I	lduba	[%r19, + 0x00c6] %asi, %r29
	.word 0xf605e011  ! 2953: LDUW_I	lduw	[%r23 + 0x0011], %r27
T2_asi_reg_wr_140:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 2955: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_135:
	mov	0x32, %r14
	.word 0xf2db8e80  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfc5d609e  ! 2959: LDX_I	ldx	[%r21 + 0x009e], %r30
	.word 0xf24d6076  ! 2960: LDSB_I	ldsb	[%r21 + 0x0076], %r25
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c18  ! 2961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	.word 0xfcc5a1e1  ! 2966: LDSWA_I	ldswa	[%r22, + 0x01e1] %asi, %r30
T2_asi_reg_wr_141:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 2967: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, f)
	.word 0xfacd0020  ! 2977: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
cpu_intr_2_232:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_136:
	mov	0xd, %r14
	.word 0xfedb8e60  ! 2981: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xfed5a1eb  ! 2987: LDSHA_I	ldsha	[%r22, + 0x01eb] %asi, %r31
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 38)
	.word 0xfc0ce08e  ! 2990: LDUB_I	ldub	[%r19 + 0x008e], %r30
	.word 0xf69560d7  ! 2991: LDUHA_I	lduha	[%r21, + 0x00d7] %asi, %r27
T2_asi_reg_wr_142:
	mov	0x10, %r14
	.word 0xf0f38400  ! 2992: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_233:
	setx	0x370230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_234:
	setx	0x340119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495e0c5  ! 2997: LDUHA_I	lduha	[%r23, + 0x00c5] %asi, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf68c616b  ! 3002: LDUBA_I	lduba	[%r17, + 0x016b] %asi, %r27
	.word 0xfc840020  ! 3003: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
	.word 0xf854c000  ! 3005: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf844604c  ! 3006: LDSW_I	ldsw	[%r17 + 0x004c], %r28
T2_asi_reg_wr_143:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 3007: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf84cc000  ! 3012: LDSB_R	ldsb	[%r19 + %r0], %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_137:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_235:
	setx	0x350017, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_138:
	mov	0x2, %r14
	.word 0xf6db8400  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_236:
	setx	0x340000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bd8000  ! 3029: XNORcc_R	xnorcc 	%r22, %r0, %r28
cpu_intr_2_237:
	setx	0x370322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_139:
	mov	0x4, %r14
	.word 0xf6db8e60  ! 3031: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfc0d0000  ! 3035: LDUB_R	ldub	[%r20 + %r0], %r30
cpu_intr_2_238:
	setx	0x340209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80de090  ! 3038: LDUB_I	ldub	[%r23 + 0x0090], %r28
	.word 0xfe8ca14b  ! 3041: LDUBA_I	lduba	[%r18, + 0x014b] %asi, %r31
	.word 0xfe44a136  ! 3042: LDSW_I	ldsw	[%r18 + 0x0136], %r31
	.word 0xf2048000  ! 3043: LDUW_R	lduw	[%r18 + %r0], %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_144:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 3046: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_239:
	setx	0x37011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_240:
	setx	0x34023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c20a1  ! 3053: LDUBA_I	lduba	[%r16, + 0x00a1] %asi, %r27
	.word 0xfc4de10f  ! 3054: LDSB_I	ldsb	[%r23 + 0x010f], %r30
T2_asi_reg_rd_140:
	mov	0xa, %r14
	.word 0xf4db8e40  ! 3057: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_241:
	setx	0x340021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, f)
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 12)
	.word 0xfc0d6183  ! 3066: LDUB_I	ldub	[%r21 + 0x0183], %r30
	.word 0xfaccc020  ! 3069: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	.word 0xf6c4e1d1  ! 3070: LDSWA_I	ldswa	[%r19, + 0x01d1] %asi, %r27
	.word 0xf25520ff  ! 3072: LDSH_I	ldsh	[%r20 + 0x00ff], %r25
	.word 0xbc356036  ! 3073: ORN_I	orn 	%r21, 0x0036, %r30
	.word 0xfe554000  ! 3075: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xf25ce15b  ! 3076: LDX_I	ldx	[%r19 + 0x015b], %r25
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_145:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 3078: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfad5e1c0  ! 3079: LDSHA_I	ldsha	[%r23, + 0x01c0] %asi, %r29
T2_asi_reg_wr_146:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 3081: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4dca0e1  ! 3083: LDXA_I	ldxa	[%r18, + 0x00e1] %asi, %r26
	.word 0xf2444000  ! 3087: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xf61421e5  ! 3088: LDUH_I	lduh	[%r16 + 0x01e5], %r27
	.word 0xf655c000  ! 3089: LDSH_R	ldsh	[%r23 + %r0], %r27
cpu_intr_2_242:
	setx	0x340238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_141:
	mov	0xe, %r14
	.word 0xfcdb84a0  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf25c21e1  ! 3097: LDX_I	ldx	[%r16 + 0x01e1], %r25
T2_asi_reg_wr_147:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 3098: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_243:
	setx	0x360320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd48020  ! 3114: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfc85c020  ! 3116: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
cpu_intr_2_244:
	setx	0x340332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_245:
	setx	0x340309, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4948020  ! 3123: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
cpu_intr_2_246:
	setx	0x340107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 20)
	.word 0xf4cc60f3  ! 3132: LDSBA_I	ldsba	[%r17, + 0x00f3] %asi, %r26
	.word 0xb81de09d  ! 3134: XOR_I	xor 	%r23, 0x009d, %r28
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_142:
	mov	0x27, %r14
	.word 0xf6db8e60  ! 3140: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_247:
	setx	0x36002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_143:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf4948020  ! 3146: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
	.word 0xfa8d8020  ! 3147: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
T2_asi_reg_wr_148:
	mov	0x16, %r14
	.word 0xfaf38e40  ! 3150: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6d5200a  ! 3151: LDSHA_I	ldsha	[%r20, + 0x000a] %asi, %r27
cpu_intr_2_248:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x350039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf4cd8020  ! 3160: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
	.word 0xf254a075  ! 3161: LDSH_I	ldsh	[%r18 + 0x0075], %r25
	.word 0xf4556194  ! 3162: LDSH_I	ldsh	[%r21 + 0x0194], %r26
	.word 0xf6c5a0a9  ! 3163: LDSWA_I	ldswa	[%r22, + 0x00a9] %asi, %r27
T2_asi_reg_rd_144:
	mov	0x1b, %r14
	.word 0xf4db84a0  ! 3164: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf80dc000  ! 3166: LDUB_R	ldub	[%r23 + %r0], %r28
cpu_intr_2_250:
	setx	0x360024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_251:
	setx	0x360304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_252:
	setx	0x340238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_253:
	setx	0x360204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_254:
	setx	0x340335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_255:
	setx	0x370206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 26)
	.word 0xf405605d  ! 3181: LDUW_I	lduw	[%r21 + 0x005d], %r26
	.word 0xf04ca1a1  ! 3183: LDSB_I	ldsb	[%r18 + 0x01a1], %r24
	.word 0xfed4c020  ! 3185: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
cpu_intr_2_256:
	setx	0x340039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_145:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 3192: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf044c000  ! 3193: LDSW_R	ldsw	[%r19 + %r0], %r24
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_146:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa5de106  ! 3198: LDX_I	ldx	[%r23 + 0x0106], %r29
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_257:
	setx	0x2022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_149:
	mov	0x24, %r14
	.word 0xf4f38e60  ! 3206: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_150:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3207: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_151:
	mov	0x26, %r14
	.word 0xfaf38e60  ! 3211: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf00de025  ! 3216: LDUB_I	ldub	[%r23 + 0x0025], %r24
T2_asi_reg_rd_147:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 3224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf2cd4020  ! 3226: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xfa04c000  ! 3227: LDUW_R	lduw	[%r19 + %r0], %r29
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_148:
	mov	0x8, %r14
	.word 0xf0db8e80  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf605a00b  ! 3235: LDUW_I	lduw	[%r22 + 0x000b], %r27
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 14)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983bc8  ! 3239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc8, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xf0cd4020  ! 3243: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
cpu_intr_2_258:
	setx	0x3a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_149:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 30)
	.word 0xfc450000  ! 3251: LDSW_R	ldsw	[%r20 + %r0], %r30
T2_asi_reg_wr_152:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 3254: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_259:
	setx	0x3b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4350000  ! 3257: ORN_R	orn 	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_260:
	setx	0x3a0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadca0cb  ! 3267: LDXA_I	ldxa	[%r18, + 0x00cb] %asi, %r29
cpu_intr_2_261:
	setx	0x3a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d0000  ! 3271: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xfed5600d  ! 3272: LDSHA_I	ldsha	[%r21, + 0x000d] %asi, %r31
cpu_intr_2_262:
	setx	0x3b011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x390011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8858020  ! 3280: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
cpu_intr_2_264:
	setx	0x3a0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf81421ca  ! 3288: LDUH_I	lduh	[%r16 + 0x01ca], %r28
	.word 0xf2944020  ! 3289: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_150:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6846145  ! 3298: LDUWA_I	lduwa	[%r17, + 0x0145] %asi, %r27
T2_asi_reg_rd_151:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf2952019  ! 3301: LDUHA_I	lduha	[%r20, + 0x0019] %asi, %r25
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb32c2001  ! 3303: SLL_I	sll 	%r16, 0x0001, %r25
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 11)
	.word 0xf00de0d0  ! 3308: LDUB_I	ldub	[%r23 + 0x00d0], %r24
	.word 0xf0d5e154  ! 3309: LDSHA_I	ldsha	[%r23, + 0x0154] %asi, %r24
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_265:
	setx	0x3a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_152:
	mov	0x2c, %r14
	.word 0xfedb89e0  ! 3319: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_266:
	setx	0x3b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2444000  ! 3324: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xb8348000  ! 3325: SUBC_R	orn 	%r18, %r0, %r28
cpu_intr_2_267:
	setx	0x3a020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a0a  ! 3329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0a, %hpstate
cpu_intr_2_268:
	setx	0x38010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_153:
	mov	0x34, %r14
	.word 0xf4db8e40  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf04c6035  ! 3338: LDSB_I	ldsb	[%r17 + 0x0035], %r24
	.word 0xf0950020  ! 3341: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	.word 0xf24ca18c  ! 3342: LDSB_I	ldsb	[%r18 + 0x018c], %r25
T2_asi_reg_rd_154:
	mov	0x8, %r14
	.word 0xf8db84a0  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_269:
	setx	0x390115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25ca0fc  ! 3352: LDX_I	ldx	[%r18 + 0x00fc], %r25
	.word 0xfe0dc000  ! 3354: LDUB_R	ldub	[%r23 + %r0], %r31
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf25dc000  ! 3358: LDX_R	ldx	[%r23 + %r0], %r25
cpu_intr_2_270:
	setx	0x3b0308, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_155:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_156:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfecd610d  ! 3365: LDSBA_I	ldsba	[%r21, + 0x010d] %asi, %r31
	.word 0xf6c48020  ! 3366: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_153:
	mov	0x9, %r14
	.word 0xf8f38400  ! 3368: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfa958020  ! 3371: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xf20d8000  ! 3373: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf084a1f7  ! 3374: LDUWA_I	lduwa	[%r18, + 0x01f7] %asi, %r24
T2_asi_reg_wr_154:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 3375: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb52cb001  ! 3376: SLLX_I	sllx	%r18, 0x0001, %r26
	.word 0xb2446190  ! 3377: ADDC_I	addc 	%r17, 0x0190, %r25
T2_asi_reg_rd_157:
	mov	0x2d, %r14
	.word 0xf2db8400  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf894c020  ! 3380: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	.word 0xf6c5c020  ! 3382: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf0c461b3  ! 3386: LDSWA_I	ldswa	[%r17, + 0x01b3] %asi, %r24
	.word 0xf205a028  ! 3389: LDUW_I	lduw	[%r22 + 0x0028], %r25
cpu_intr_2_271:
	setx	0x3a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_272:
	setx	0x380301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 19)
	.word 0xfecda174  ! 3397: LDSBA_I	ldsba	[%r22, + 0x0174] %asi, %r31
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 33)
	.word 0xf04560c0  ! 3401: LDSW_I	ldsw	[%r21 + 0x00c0], %r24
T2_asi_reg_rd_158:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_155:
	mov	0x10, %r14
	.word 0xfef389e0  ! 3403: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_156:
	mov	0x23, %r14
	.word 0xfcf384a0  ! 3405: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
cpu_intr_2_273:
	setx	0x38010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_274:
	setx	0x39023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x390008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 3421: RDPR_PIL	<illegal instruction>
	.word 0xb00ca15d  ! 3423: AND_I	and 	%r18, 0x015d, %r24
	.word 0xfa0c4000  ! 3425: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xf8cc0020  ! 3430: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
cpu_intr_2_276:
	setx	0x3a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_277:
	setx	0x3b0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804e153  ! 3433: LDUW_I	lduw	[%r19 + 0x0153], %r28
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 8)
	.word 0xf254c000  ! 3436: LDSH_R	ldsh	[%r19 + %r0], %r25
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_159:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb03420a6  ! 3443: SUBC_I	orn 	%r16, 0x00a6, %r24
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_278:
	setx	0x380034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_279:
	setx	0x3a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 21)
	.word 0xf20d4000  ! 3457: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xfa5dc000  ! 3458: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf6954020  ! 3459: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xbf2d9000  ! 3462: SLLX_R	sllx	%r22, %r0, %r31
cpu_intr_2_280:
	setx	0x390311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 3d)
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b52  ! 3471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
cpu_intr_2_281:
	setx	0x3b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_160:
	mov	0x22, %r14
	.word 0xf8db8e60  ! 3475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_157:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 3479: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf80c0000  ! 3483: LDUB_R	ldub	[%r16 + %r0], %r28
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_161:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb88c214f  ! 3496: ANDcc_I	andcc 	%r16, 0x014f, %r28
cpu_intr_2_282:
	setx	0x3b021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_283:
	setx	0x38010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_162:
	mov	0x21, %r14
	.word 0xf4db84a0  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_284:
	setx	0x3b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 26)
	.word 0xf80d0000  ! 3509: LDUB_R	ldub	[%r20 + %r0], %r28
T2_asi_reg_rd_163:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 3510: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_164:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_285:
	setx	0x380115, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_165:
	mov	0x3, %r14
	.word 0xfadb8400  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_158:
	mov	0x17, %r14
	.word 0xf4f38e80  ! 3522: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb934b001  ! 3525: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xf8044000  ! 3531: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xb20c21fe  ! 3533: AND_I	and 	%r16, 0x01fe, %r25
T2_asi_reg_rd_166:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f10  ! 3535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f10, %hpstate
	.word 0xfc85e1ff  ! 3536: LDUWA_I	lduwa	[%r23, + 0x01ff] %asi, %r30
T2_asi_reg_wr_159:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 3539: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2d52158  ! 3540: LDSHA_I	ldsha	[%r20, + 0x0158] %asi, %r25
	.word 0xfedde0ac  ! 3541: LDXA_I	ldxa	[%r23, + 0x00ac] %asi, %r31
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, d)
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf815e028  ! 3546: LDUH_I	lduh	[%r23 + 0x0028], %r28
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_286:
	setx	0x3b0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_160:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 3551: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0cdc020  ! 3552: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_167:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 3554: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_161:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 3556: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b52  ! 3557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b52, %hpstate
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_168:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 3562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_287:
	setx	0x3b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a4e11e  ! 3573: SUBcc_I	subcc 	%r19, 0x011e, %r26
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 37)
	.word 0xfa5560d6  ! 3583: LDSH_I	ldsh	[%r21 + 0x00d6], %r29
T2_asi_reg_wr_162:
	mov	0xd, %r14
	.word 0xf4f38400  ! 3588: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_288:
	setx	0x3b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe152164  ! 3591: LDUH_I	lduh	[%r20 + 0x0164], %r31
	.word 0xfe0d8000  ! 3593: LDUB_R	ldub	[%r22 + %r0], %r31
cpu_intr_2_289:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_290:
	setx	0x390220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85ca1bc  ! 3599: LDX_I	ldx	[%r18 + 0x01bc], %r28
	.word 0xf2544000  ! 3601: LDSH_R	ldsh	[%r17 + %r0], %r25
T2_asi_reg_wr_163:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 3604: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 37)
	.word 0xf2dd61e3  ! 3608: LDXA_I	ldxa	[%r21, + 0x01e3] %asi, %r25
	.word 0xf44420df  ! 3611: LDSW_I	ldsw	[%r16 + 0x00df], %r26
	.word 0xb134e001  ! 3614: SRL_I	srl 	%r19, 0x0001, %r24
	.word 0xf20c2180  ! 3615: LDUB_I	ldub	[%r16 + 0x0180], %r25
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a18  ! 3618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a18, %hpstate
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf44d607e  ! 3624: LDSB_I	ldsb	[%r21 + 0x007e], %r26
	.word 0xf01420b6  ! 3625: LDUH_I	lduh	[%r16 + 0x00b6], %r24
	.word 0xfa14a19b  ! 3630: LDUH_I	lduh	[%r18 + 0x019b], %r29
cpu_intr_2_291:
	setx	0x3a0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d8000  ! 3632: LDUB_R	ldub	[%r22 + %r0], %r29
T2_asi_reg_wr_164:
	mov	0x14, %r14
	.word 0xfcf38e40  ! 3633: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, a)
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 38)
	.word 0xf284e0b4  ! 3637: LDUWA_I	lduwa	[%r19, + 0x00b4] %asi, %r25
	.word 0xfc848020  ! 3638: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 31)
	.word 0xba2cc000  ! 3643: ANDN_R	andn 	%r19, %r0, %r29
	.word 0xfc8d4020  ! 3646: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
cpu_intr_2_292:
	setx	0x380224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43dc000  ! 3648: XNOR_R	xnor 	%r23, %r0, %r26
T2_asi_reg_rd_169:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_165:
	mov	0x10, %r14
	.word 0xf6f389e0  ! 3650: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_293:
	setx	0x3b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 3666: RDPR_PSTATE	<illegal instruction>
cpu_intr_2_294:
	setx	0x38022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf684a06a  ! 3670: LDUWA_I	lduwa	[%r18, + 0x006a] %asi, %r27
T2_asi_reg_rd_170:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_171:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_295:
	setx	0x3a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64da1bb  ! 3689: LDSB_I	ldsb	[%r22 + 0x01bb], %r27
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_166:
	mov	0x2e, %r14
	.word 0xfcf38400  ! 3693: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf605612a  ! 3695: LDUW_I	lduw	[%r21 + 0x012a], %r27
	.word 0xf0048000  ! 3700: LDUW_R	lduw	[%r18 + %r0], %r24
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_167:
	mov	0x10, %r14
	.word 0xf0f38e80  ! 3702: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb53d7001  ! 3704: SRAX_I	srax	%r21, 0x0001, %r26
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_296:
	setx	0x3e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_297:
	setx	0x3f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc5c020  ! 3711: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_168:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 3714: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_172:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_298:
	setx	0x3f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_169:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 3723: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfe55c000  ! 3724: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xf484c020  ! 3725: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
cpu_intr_2_299:
	setx	0x3e0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_173:
	mov	0x34, %r14
	.word 0xf2db8e60  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_rd_174:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfcd4619e  ! 3736: LDSHA_I	ldsha	[%r17, + 0x019e] %asi, %r30
	.word 0xf6044000  ! 3737: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xb0244000  ! 3739: SUB_R	sub 	%r17, %r0, %r24
T2_asi_reg_rd_175:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 3740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0x8394a183  ! 3741: WRPR_TNPC_I	wrpr	%r18, 0x0183, %tnpc
cpu_intr_2_300:
	setx	0x3e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04c000  ! 3746: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xf20c0000  ! 3748: LDUB_R	ldub	[%r16 + %r0], %r25
T2_asi_reg_rd_176:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 3751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc5de096  ! 3753: LDX_I	ldx	[%r23 + 0x0096], %r30
T2_asi_reg_rd_177:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_178:
	mov	0x28, %r14
	.word 0xf8db84a0  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbb2d9000  ! 3759: SLLX_R	sllx	%r22, %r0, %r29
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_301:
	setx	0x3e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cdc020  ! 3763: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 4)
	.word 0xb69de0e0  ! 3768: XORcc_I	xorcc 	%r23, 0x00e0, %r27
T2_asi_reg_wr_170:
	mov	0x10, %r14
	.word 0xf2f38e60  ! 3770: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb8a4c000  ! 3771: SUBcc_R	subcc 	%r19, %r0, %r28
T2_asi_reg_rd_179:
	mov	0x32, %r14
	.word 0xf0db84a0  ! 3772: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf2446004  ! 3775: LDSW_I	ldsw	[%r17 + 0x0004], %r25
cpu_intr_2_302:
	setx	0x3d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, f)
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_171:
	mov	0xb, %r14
	.word 0xf0f38e60  ! 3789: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_303:
	setx	0x3d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5a11a  ! 3792: LDSWA_I	ldswa	[%r22, + 0x011a] %asi, %r27
	.word 0xfc44c000  ! 3794: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xbb643801  ! 3795: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xf28dc020  ! 3797: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 34)
	.word 0xf6c42005  ! 3805: LDSWA_I	ldswa	[%r16, + 0x0005] %asi, %r27
cpu_intr_2_304:
	setx	0x3f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_305:
	setx	0x3f0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_306:
	setx	0x3e010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404c000  ! 3813: LDUW_R	lduw	[%r19 + %r0], %r26
T2_asi_reg_rd_181:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_182:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf4dda006  ! 3820: LDXA_I	ldxa	[%r22, + 0x0006] %asi, %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_183:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3824: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb645e13c  ! 3827: ADDC_I	addc 	%r23, 0x013c, %r27
cpu_intr_2_307:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 14)
	.word 0xb2848000  ! 3838: ADDcc_R	addcc 	%r18, %r0, %r25
	.word 0xfa4d4000  ! 3839: LDSB_R	ldsb	[%r21 + %r0], %r29
cpu_intr_2_308:
	setx	0x3f0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_309:
	setx	0x3c0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa4c8000  ! 3846: LDSB_R	ldsb	[%r18 + %r0], %r29
cpu_intr_2_310:
	setx	0x3c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0950020  ! 3851: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828c2  ! 3852: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c2, %hpstate
	.word 0xf0548000  ! 3854: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xfcd50020  ! 3855: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_184:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_185:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf4ccc020  ! 3861: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
T2_asi_reg_rd_186:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_187:
	mov	0x28, %r14
	.word 0xfadb89e0  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_188:
	mov	0x4, %r14
	.word 0xfadb8e80  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf8c56016  ! 3869: LDSWA_I	ldswa	[%r21, + 0x0016] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d4a  ! 3871: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4a, %hpstate
	.word 0xb8bc4000  ! 3873: XNORcc_R	xnorcc 	%r17, %r0, %r28
T2_asi_reg_rd_189:
	mov	0x29, %r14
	.word 0xf0db89e0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf84d4000  ! 3879: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xfe0c8000  ! 3883: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf6cda08b  ! 3885: LDSBA_I	ldsba	[%r22, + 0x008b] %asi, %r27
	.word 0xf8058000  ! 3886: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xb5643801  ! 3888: MOVcc_I	<illegal instruction>
T2_asi_reg_wr_172:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 3896: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_311:
	setx	0x3e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2546077  ! 3899: LDSH_I	ldsh	[%r17 + 0x0077], %r25
cpu_intr_2_312:
	setx	0x3d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_190:
	mov	0x2e, %r14
	.word 0xfadb89e0  ! 3902: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf005a049  ! 3904: LDUW_I	lduw	[%r22 + 0x0049], %r24
	.word 0xfad4e15a  ! 3905: LDSHA_I	ldsha	[%r19, + 0x015a] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2d5c020  ! 3907: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
	.word 0xfa5d6160  ! 3909: LDX_I	ldx	[%r21 + 0x0160], %r29
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_313:
	setx	0x3c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_173:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 3913: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf85c60fe  ! 3917: LDX_I	ldx	[%r17 + 0x00fe], %r28
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_315:
	setx	0x3c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_316:
	setx	0x3f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_317:
	setx	0x3f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_191:
	mov	0x1a, %r14
	.word 0xf4db84a0  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb00ca17e  ! 3929: AND_I	and 	%r18, 0x017e, %r24
T2_asi_reg_wr_174:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 3931: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf854c000  ! 3934: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf495c020  ! 3935: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
cpu_intr_2_318:
	setx	0x3c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_192:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 3937: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_175:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3939: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcd4607a  ! 3941: LDSHA_I	ldsha	[%r17, + 0x007a] %asi, %r30
	ta	T_CHANGE_TO_TL0
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983fda  ! 3943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
	.word 0xf0d58020  ! 3948: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfacd4020  ! 3951: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
	.word 0xf2cdc020  ! 3953: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r25
	.word 0xf45da12a  ! 3954: LDX_I	ldx	[%r22 + 0x012a], %r26
T2_asi_reg_rd_193:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe94e0e8  ! 3958: LDUHA_I	lduha	[%r19, + 0x00e8] %asi, %r31
T2_asi_reg_wr_176:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 3959: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_319:
	setx	0x3e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_177:
	mov	0x30, %r14
	.word 0xf8f38e40  ! 3963: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf81420a0  ! 3964: LDUH_I	lduh	[%r16 + 0x00a0], %r28
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cca  ! 3966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
	.word 0xfe5d213e  ! 3967: LDX_I	ldx	[%r20 + 0x013e], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_194:
	mov	0x13, %r14
	.word 0xf2db84a0  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0x8d94e11d  ! 3974: WRPR_PSTATE_I	wrpr	%r19, 0x011d, %pstate
cpu_intr_2_320:
	setx	0x3d0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf045a1e1  ! 3976: LDSW_I	ldsw	[%r22 + 0x01e1], %r24
cpu_intr_2_321:
	setx	0x3e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05a16c  ! 3980: LDUW_I	lduw	[%r22 + 0x016c], %r31
T2_asi_reg_rd_195:
	mov	0x17, %r14
	.word 0xfcdb8400  ! 3982: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2d40020  ! 3984: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
	.word 0xb83ca14d  ! 3985: XNOR_I	xnor 	%r18, 0x014d, %r28
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e9a  ! 3986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9a, %hpstate
	.word 0xfa54a070  ! 3987: LDSH_I	ldsh	[%r18 + 0x0070], %r29
	.word 0xf44d602f  ! 3988: LDSB_I	ldsb	[%r21 + 0x002f], %r26
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 18)
	.word 0xba1c0000  ! 3997: XOR_R	xor 	%r16, %r0, %r29
	.word 0xf8c5e0a8  ! 3998: LDSWA_I	ldswa	[%r23, + 0x00a8] %asi, %r28
T2_asi_reg_rd_196:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbe0ce1dc  ! 4000: AND_I	and 	%r19, 0x01dc, %r31
	.word 0xb4acc000  ! 4001: ANDNcc_R	andncc 	%r19, %r0, %r26
	.word 0xba1d206a  ! 4002: XOR_I	xor 	%r20, 0x006a, %r29
	.word 0xf845c000  ! 4004: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xb134a001  ! 4005: SRL_I	srl 	%r18, 0x0001, %r24
	.word 0xf45ce14e  ! 4006: LDX_I	ldx	[%r19 + 0x014e], %r26
	.word 0xf245a039  ! 4008: LDSW_I	ldsw	[%r22 + 0x0039], %r25
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_197:
	mov	0x28, %r14
	.word 0xf0db8e80  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_178:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 4015: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb72d4000  ! 4016: SLL_R	sll 	%r21, %r0, %r27
T2_asi_reg_rd_198:
	mov	0x1b, %r14
	.word 0xf4db8e60  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_rd_199:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 4021: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_200:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_322:
	setx	0x3f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5c20c1  ! 4030: LDX_I	ldx	[%r16 + 0x00c1], %r30
T2_asi_reg_rd_201:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6948020  ! 4033: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	.word 0xf085a03f  ! 4034: LDUWA_I	lduwa	[%r22, + 0x003f] %asi, %r24
T2_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 4035: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf815614a  ! 4038: LDUH_I	lduh	[%r21 + 0x014a], %r28
	.word 0xfe5c8000  ! 4040: LDX_R	ldx	[%r18 + %r0], %r31
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0d4a1bd  ! 4044: LDSHA_I	ldsha	[%r18, + 0x01bd] %asi, %r24
	.word 0xfa152067  ! 4046: LDUH_I	lduh	[%r20 + 0x0067], %r29
	.word 0xfad50020  ! 4049: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
	.word 0xf85de046  ! 4052: LDX_I	ldx	[%r23 + 0x0046], %r28
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198394a  ! 4053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
cpu_intr_2_323:
	setx	0x3c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8cc020  ! 4063: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
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
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfe540000  ! 4071: LDSH_R	ldsh	[%r16 + %r0], %r31
T2_asi_reg_rd_202:
	mov	0x9, %r14
	.word 0xf2db8e40  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_180:
	mov	0x24, %r14
	.word 0xf8f384a0  ! 4075: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ad0  ! 4080: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad0, %hpstate
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 5)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_324:
	setx	0x3f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_181:
	mov	0x20, %r14
	.word 0xf6f38400  ! 4093: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfc8d0020  ! 4094: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_182:
	mov	0x0, %r14
	.word 0xf6f389e0  ! 4095: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_203:
	mov	0x6, %r14
	.word 0xf0db84a0  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_325:
	setx	0x3f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3460fe  ! 4098: SUBC_I	orn 	%r17, 0x00fe, %r30
	.word 0xf814c000  ! 4099: LDUH_R	lduh	[%r19 + %r0], %r28
T2_asi_reg_wr_183:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4100: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfac44020  ! 4102: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
	.word 0xf2848020  ! 4104: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xbcb58000  ! 4105: ORNcc_R	orncc 	%r22, %r0, %r30
cpu_intr_2_326:
	setx	0x3e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_204:
	mov	0x8, %r14
	.word 0xf0db89e0  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfc148000  ! 4110: LDUH_R	lduh	[%r18 + %r0], %r30
cpu_intr_2_327:
	setx	0x3c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_328:
	setx	0x3c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_184:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 4118: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_329:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_185:
	mov	0x1, %r14
	.word 0xfef384a0  ! 4120: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 29)
	.word 0xb6c58000  ! 4123: ADDCcc_R	addccc 	%r22, %r0, %r27
	.word 0xb2bce1be  ! 4124: XNORcc_I	xnorcc 	%r19, 0x01be, %r25
T2_asi_reg_rd_205:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4126: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb4a40000  ! 4127: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xfec54020  ! 4129: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
	.word 0xfc0cc000  ! 4132: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xfa8c0020  ! 4135: LDUBA_R	lduba	[%r16, %r0] 0x01, %r29
cpu_intr_2_330:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_331:
	setx	0x40000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 2f)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982900  ! 4146: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
T2_asi_reg_rd_206:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfe0c8000  ! 4148: LDUB_R	ldub	[%r18 + %r0], %r31
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 11)
	.word 0xfc844020  ! 4151: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_207:
	mov	0x17, %r14
	.word 0xfedb8400  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_208:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_332:
	setx	0x430321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_333:
	setx	0x410100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf855c000  ! 4157: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xfe046181  ! 4159: LDUW_I	lduw	[%r17 + 0x0181], %r31
T2_asi_reg_rd_209:
	mov	0x24, %r14
	.word 0xf4db8e80  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf0c4a138  ! 4166: LDSWA_I	ldswa	[%r18, + 0x0138] %asi, %r24
	.word 0xfe0d21ef  ! 4167: LDUB_I	ldub	[%r20 + 0x01ef], %r31
cpu_intr_2_334:
	setx	0x400208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_186:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 4178: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf28c6169  ! 4179: LDUBA_I	lduba	[%r17, + 0x0169] %asi, %r25
	.word 0xf45c8000  ! 4181: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xf45da11f  ! 4184: LDX_I	ldx	[%r22 + 0x011f], %r26
	.word 0xb8340000  ! 4186: SUBC_R	orn 	%r16, %r0, %r28
	.word 0xb12d1000  ! 4188: SLLX_R	sllx	%r20, %r0, %r24
T2_asi_reg_rd_210:
	mov	0x18, %r14
	.word 0xf6db8e80  ! 4189: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 24)
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c18  ! 4191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c18, %hpstate
	.word 0xf4958020  ! 4193: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
	.word 0xfe4de0e1  ! 4194: LDSB_I	ldsb	[%r23 + 0x00e1], %r31
	.word 0xf4050000  ! 4195: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xf045c000  ! 4196: LDSW_R	ldsw	[%r23 + %r0], %r24
T2_asi_reg_rd_211:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfac48020  ! 4200: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
	.word 0xfe448000  ! 4207: LDSW_R	ldsw	[%r18 + %r0], %r31
T2_asi_reg_rd_212:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 4208: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb604e043  ! 4211: ADD_I	add 	%r19, 0x0043, %r27
T2_asi_reg_wr_187:
	mov	0x1a, %r14
	.word 0xf4f38e60  ! 4213: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf4158000  ! 4214: LDUH_R	lduh	[%r22 + %r0], %r26
T2_asi_reg_rd_213:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 4215: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfa948020  ! 4218: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	.word 0xf04d8000  ! 4220: LDSB_R	ldsb	[%r22 + %r0], %r24
T2_asi_reg_wr_188:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 4221: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_HPRIV
	.word 0xf6d4e15c  ! 4227: LDSHA_I	ldsha	[%r19, + 0x015c] %asi, %r27
	.word 0xf8c420bf  ! 4228: LDSWA_I	ldswa	[%r16, + 0x00bf] %asi, %r28
T2_asi_reg_wr_189:
	mov	0x34, %r14
	.word 0xfaf38e80  ! 4229: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xf495c020  ! 4237: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xf2842186  ! 4238: LDUWA_I	lduwa	[%r16, + 0x0186] %asi, %r25
T2_asi_reg_wr_190:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4239: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc858020  ! 4242: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_214:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 4251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_335:
	setx	0x400109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c8000  ! 4258: LDSB_R	ldsb	[%r18 + %r0], %r30
cpu_intr_2_336:
	setx	0x400309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa44c000  ! 4268: LDSW_R	ldsw	[%r19 + %r0], %r29
cpu_intr_2_337:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_338:
	setx	0x430121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15a10b  ! 4273: LDUH_I	lduh	[%r22 + 0x010b], %r31
T2_asi_reg_wr_191:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 4274: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfcc58020  ! 4275: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	.word 0xf04da0c3  ! 4285: LDSB_I	ldsb	[%r22 + 0x00c3], %r24
	.word 0xf8d4e034  ! 4286: LDSHA_I	ldsha	[%r19, + 0x0034] %asi, %r28
	.word 0xfccda029  ! 4287: LDSBA_I	ldsba	[%r22, + 0x0029] %asi, %r30
T2_asi_reg_wr_192:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 4289: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 11)
	ta	T_CHANGE_TO_TL0
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 4)
	.word 0xbebcc000  ! 4299: XNORcc_R	xnorcc 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_193:
	mov	0x24, %r14
	.word 0xfaf38e80  ! 4301: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfe040000  ! 4302: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xf495e0a7  ! 4303: LDUHA_I	lduha	[%r23, + 0x00a7] %asi, %r26
T2_asi_reg_rd_215:
	mov	0x19, %r14
	.word 0xfadb8e60  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0d40020  ! 4307: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
T2_asi_reg_wr_194:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 4309: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa144000  ! 4311: LDUH_R	lduh	[%r17 + %r0], %r29
cpu_intr_2_339:
	setx	0x420331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_340:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4444000  ! 4314: ADDC_R	addc 	%r17, %r0, %r26
cpu_intr_2_341:
	setx	0x420037, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_216:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xba35e0a2  ! 4317: ORN_I	orn 	%r23, 0x00a2, %r29
	.word 0xbd480000  ! 4318: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf6d5e16b  ! 4322: LDSHA_I	ldsha	[%r23, + 0x016b] %asi, %r27
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 17)
	.word 0xfc548000  ! 4329: LDSH_R	ldsh	[%r18 + %r0], %r30
cpu_intr_2_342:
	setx	0x430227, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_343:
	setx	0x420004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 4342: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_195:
	mov	0x26, %r14
	.word 0xf2f38e40  ! 4345: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6d5c020  ! 4346: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
cpu_intr_2_344:
	setx	0x41000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4954020  ! 4350: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
T2_asi_reg_rd_217:
	mov	0x1, %r14
	.word 0xfcdb8e60  ! 4351: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_196:
	mov	0xe, %r14
	.word 0xfcf38e40  ! 4353: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_218:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbe8c0000  ! 4359: ANDcc_R	andcc 	%r16, %r0, %r31
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 30)
	.word 0xf24ce013  ! 4366: LDSB_I	ldsb	[%r19 + 0x0013], %r25
	.word 0xf28dc020  ! 4367: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_197:
	mov	0x34, %r14
	.word 0xfaf38e40  ! 4376: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_219:
	mov	0x0, %r14
	.word 0xfcdb8e60  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_220:
	mov	0x13, %r14
	.word 0xf0db8e80  ! 4380: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_221:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_345:
	setx	0x410111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8de0eb  ! 4384: LDUBA_I	lduba	[%r23, + 0x00eb] %asi, %r30
cpu_intr_2_346:
	setx	0x430230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414c000  ! 4386: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xbe9d8000  ! 4387: XORcc_R	xorcc 	%r22, %r0, %r31
	.word 0xfa4ca064  ! 4389: LDSB_I	ldsb	[%r18 + 0x0064], %r29
T2_asi_reg_rd_222:
	mov	0x14, %r14
	.word 0xf4db84a0  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_rd_223:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983bd0  ! 4392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
cpu_intr_2_347:
	setx	0x430105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_348:
	setx	0x430327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_198:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 4396: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_349:
	setx	0x430215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x400027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c6143  ! 4400: LDSB_I	ldsb	[%r17 + 0x0143], %r28
	.word 0xfa0d0000  ! 4401: LDUB_R	ldub	[%r20 + %r0], %r29
cpu_intr_2_351:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_352:
	setx	0x40023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc048000  ! 4404: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xb2340000  ! 4407: ORN_R	orn 	%r16, %r0, %r25
	.word 0xb21c21bc  ! 4408: XOR_I	xor 	%r16, 0x01bc, %r25
cpu_intr_2_353:
	setx	0x400100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04520c9  ! 4414: LDSW_I	ldsw	[%r20 + 0x00c9], %r24
cpu_intr_2_354:
	setx	0x410309, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_199:
	mov	0xd, %r14
	.word 0xfcf389e0  ! 4416: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfc0c21d9  ! 4417: LDUB_I	ldub	[%r16 + 0x01d9], %r30
T2_asi_reg_wr_200:
	mov	0x32, %r14
	.word 0xfcf389e0  ! 4418: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_224:
	mov	0x17, %r14
	.word 0xf2db89e0  ! 4419: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb09c8000  ! 4423: XORcc_R	xorcc 	%r18, %r0, %r24
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_355:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_356:
	setx	0x42033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604e12d  ! 4437: LDUW_I	lduw	[%r19 + 0x012d], %r27
	.word 0xfad460bc  ! 4439: LDSHA_I	ldsha	[%r17, + 0x00bc] %asi, %r29
	ta	T_CHANGE_HPRIV
cpu_intr_2_357:
	setx	0x42031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb084207f  ! 4443: ADDcc_I	addcc 	%r16, 0x007f, %r24
	.word 0xf00c6034  ! 4446: LDUB_I	ldub	[%r17 + 0x0034], %r24
cpu_intr_2_358:
	setx	0x42010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_359:
	setx	0x41000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2058000  ! 4451: LDUW_R	lduw	[%r22 + %r0], %r25
T2_asi_reg_rd_225:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_201:
	mov	0x28, %r14
	.word 0xf8f38e60  ! 4454: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_360:
	setx	0x430017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0954020  ! 4456: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_226:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 4460: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_202:
	mov	0x15, %r14
	.word 0xf0f38e40  ! 4467: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb20ca132  ! 4468: AND_I	and 	%r18, 0x0132, %r25
	.word 0xf285608c  ! 4469: LDUWA_I	lduwa	[%r21, + 0x008c] %asi, %r25
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe048000  ! 4478: LDUW_R	lduw	[%r18 + %r0], %r31
cpu_intr_2_361:
	setx	0x30200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_227:
	mov	0xa, %r14
	.word 0xfedb8e60  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfe4c2134  ! 4487: LDSB_I	ldsb	[%r16 + 0x0134], %r31
	.word 0xf8c5a0ac  ! 4489: LDSWA_I	ldswa	[%r22, + 0x00ac] %asi, %r28
	.word 0xb0844000  ! 4491: ADDcc_R	addcc 	%r17, %r0, %r24
cpu_intr_2_362:
	setx	0x430113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa048000  ! 4494: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xb12c0000  ! 4496: SLL_R	sll 	%r16, %r0, %r24
cpu_intr_2_363:
	setx	0x43013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_228:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 4500: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_229:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xba8c20ec  ! 4505: ANDcc_I	andcc 	%r16, 0x00ec, %r29
cpu_intr_2_364:
	setx	0x41020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_203:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 4510: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbb3d1000  ! 4512: SRAX_R	srax	%r20, %r0, %r29
T2_asi_reg_rd_230:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe0dc000  ! 4522: LDUB_R	ldub	[%r23 + %r0], %r31
T2_asi_reg_wr_204:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 4523: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfe456187  ! 4525: LDSW_I	ldsw	[%r21 + 0x0187], %r31
cpu_intr_2_365:
	setx	0x410234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa8c4020  ! 4531: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
cpu_intr_2_366:
	setx	0x42031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 26)
	.word 0xf85d4000  ! 4536: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xfa0cc000  ! 4538: LDUB_R	ldub	[%r19 + %r0], %r29
T2_asi_reg_rd_231:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe44a194  ! 4547: LDSW_I	ldsw	[%r18 + 0x0194], %r31
	.word 0xf814a10d  ! 4553: LDUH_I	lduh	[%r18 + 0x010d], %r28
	.word 0xfcdda06b  ! 4555: LDXA_I	ldxa	[%r22, + 0x006b] %asi, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_367:
	setx	0x420331, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982958  ! 4560: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0958, %hpstate
cpu_intr_2_368:
	setx	0x40011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_369:
	setx	0x400225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf485c020  ! 4574: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
	.word 0xf884a166  ! 4575: LDUWA_I	lduwa	[%r18, + 0x0166] %asi, %r28
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 13)
	.word 0xfed48020  ! 4579: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_205:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 4580: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb93ce001  ! 4582: SRA_I	sra 	%r19, 0x0001, %r28
T2_asi_reg_wr_206:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 4583: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_wr_207:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 4584: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_370:
	setx	0x460103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 2e)
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d18  ! 4591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d18, %hpstate
T2_asi_reg_wr_208:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 4592: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 32)
	.word 0xf65c60cb  ! 4595: LDX_I	ldx	[%r17 + 0x00cb], %r27
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_209:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 4597: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_rd_232:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_371:
	setx	0x460104, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_372:
	setx	0x470217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc20d5  ! 4611: LDSBA_I	ldsba	[%r16, + 0x00d5] %asi, %r29
	.word 0xfe45c000  ! 4612: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xfa45c000  ! 4614: LDSW_R	ldsw	[%r23 + %r0], %r29
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_233:
	mov	0x1b, %r14
	.word 0xfcdb8400  ! 4618: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_373:
	setx	0x450005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4ca14b  ! 4621: LDSB_I	ldsb	[%r18 + 0x014b], %r31
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_374:
	setx	0x470232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40d6131  ! 4628: AND_I	and 	%r21, 0x0131, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_210:
	mov	0x7, %r14
	.word 0xf8f38e40  ! 4632: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_375:
	setx	0x46021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dc602d  ! 4639: LDXA_I	ldxa	[%r17, + 0x002d] %asi, %r24
	.word 0xfecca041  ! 4641: LDSBA_I	ldsba	[%r18, + 0x0041] %asi, %r31
	.word 0xf2058000  ! 4642: LDUW_R	lduw	[%r22 + %r0], %r25
T2_asi_reg_rd_234:
	mov	0x2b, %r14
	.word 0xf4db8e60  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_211:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 4645: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_212:
	mov	0x18, %r14
	.word 0xf8f38400  ! 4648: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 10)
	.word 0xbcb48000  ! 4652: ORNcc_R	orncc 	%r18, %r0, %r30
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 3)
	.word 0xb83c0000  ! 4656: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xfe454000  ! 4657: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xb93d3001  ! 4662: SRAX_I	srax	%r20, 0x0001, %r28
cpu_intr_2_376:
	setx	0x440323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_377:
	setx	0x440138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37c4400  ! 4667: MOVR_R	movre	%r17, %r0, %r25
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf64cc000  ! 4669: LDSB_R	ldsb	[%r19 + %r0], %r27
T2_asi_reg_wr_213:
	mov	0x24, %r14
	.word 0xfcf38400  ! 4674: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, a)
	.word 0xb53c8000  ! 4679: SRA_R	sra 	%r18, %r0, %r26
	.word 0xf88da0fd  ! 4680: LDUBA_I	lduba	[%r22, + 0x00fd] %asi, %r28
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_235:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf0cda0a9  ! 4686: LDSBA_I	ldsba	[%r22, + 0x00a9] %asi, %r24
	.word 0xfec521bc  ! 4690: LDSWA_I	ldswa	[%r20, + 0x01bc] %asi, %r31
	.word 0xfe94e167  ! 4692: LDUHA_I	lduha	[%r19, + 0x0167] %asi, %r31
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_214:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 4699: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf6d461ef  ! 4701: LDSHA_I	ldsha	[%r17, + 0x01ef] %asi, %r27
	.word 0xb4b4e020  ! 4704: SUBCcc_I	orncc 	%r19, 0x0020, %r26
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 20)
	.word 0xf0448000  ! 4706: LDSW_R	ldsw	[%r18 + %r0], %r24
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 5)
	.word 0xb935e001  ! 4710: SRL_I	srl 	%r23, 0x0001, %r28
	.word 0xf094a06a  ! 4711: LDUHA_I	lduha	[%r18, + 0x006a] %asi, %r24
	.word 0xfecde0de  ! 4714: LDSBA_I	ldsba	[%r23, + 0x00de] %asi, %r31
T2_asi_reg_rd_236:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 4716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_378:
	setx	0x460004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4ca15b  ! 4719: LDSB_I	ldsb	[%r18 + 0x015b], %r29
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8c44020  ! 4723: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_237:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 4725: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_379:
	setx	0x47031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dd20b3  ! 4729: LDXA_I	ldxa	[%r20, + 0x00b3] %asi, %r26
	.word 0xfe0ce009  ! 4732: LDUB_I	ldub	[%r19 + 0x0009], %r31
T2_asi_reg_wr_215:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 4736: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa8d4020  ! 4739: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_216:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 4742: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_217:
	mov	0x8, %r14
	.word 0xfef38e60  ! 4745: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_rd_238:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 4748: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe5d6138  ! 4750: LDX_I	ldx	[%r21 + 0x0138], %r31
	.word 0xf855e106  ! 4751: LDSH_I	ldsh	[%r23 + 0x0106], %r28
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_380:
	setx	0x460221, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982ec0  ! 4755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec0, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xf28cc020  ! 4757: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
	.word 0xfa9460fc  ! 4762: LDUHA_I	lduha	[%r17, + 0x00fc] %asi, %r29
	.word 0xf205a06e  ! 4763: LDUW_I	lduw	[%r22 + 0x006e], %r25
T2_asi_reg_rd_239:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4764: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_218:
	mov	0x38, %r14
	.word 0xf6f384a0  ! 4767: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_381:
	setx	0x470221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c0000  ! 4769: LDSB_R	ldsb	[%r16 + %r0], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfa452187  ! 4771: LDSW_I	ldsw	[%r20 + 0x0187], %r29
cpu_intr_2_382:
	setx	0x46003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dca07c  ! 4775: LDXA_I	ldxa	[%r18, + 0x007c] %asi, %r28
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, d)
	.word 0xf4040000  ! 4780: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xfa5c219a  ! 4783: LDX_I	ldx	[%r16 + 0x019a], %r29
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, f)
	.word 0xfacce0b0  ! 4787: LDSBA_I	ldsba	[%r19, + 0x00b0] %asi, %r29
	.word 0xf4d48020  ! 4788: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xf0dda09f  ! 4790: LDXA_I	ldxa	[%r22, + 0x009f] %asi, %r24
	.word 0xfa8c8020  ! 4791: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_240:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4792: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8144000  ! 4794: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfecca11f  ! 4798: LDSBA_I	ldsba	[%r18, + 0x011f] %asi, %r31
	.word 0xfe8c4020  ! 4801: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_219:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 4802: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_383:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5c020  ! 4806: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
	.word 0xf2556190  ! 4808: LDSH_I	ldsh	[%r21 + 0x0190], %r25
cpu_intr_2_384:
	setx	0x450035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c4020  ! 4816: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfaccc020  ! 4818: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
cpu_intr_2_385:
	setx	0x440100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_241:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 4825: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb8acc000  ! 4826: ANDNcc_R	andncc 	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_242:
	mov	0x3, %r14
	.word 0xf6db8e80  ! 4828: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_386:
	setx	0x45020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe95a111  ! 4832: LDUHA_I	lduha	[%r22, + 0x0111] %asi, %r31
T2_asi_reg_wr_220:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 4833: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_387:
	setx	0x45020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9345000  ! 4842: SRLX_R	srlx	%r17, %r0, %r28
T2_asi_reg_wr_221:
	mov	0x16, %r14
	.word 0xfef38e60  ! 4846: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, 1)
	.word 0xf645e15e  ! 4849: LDSW_I	ldsw	[%r23 + 0x015e], %r27
	.word 0xf644219d  ! 4850: LDSW_I	ldsw	[%r16 + 0x019d], %r27
	ta	T_CHANGE_HPRIV
cpu_intr_2_388:
	setx	0x44020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc44020  ! 4858: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
	.word 0xf08da039  ! 4860: LDUBA_I	lduba	[%r22, + 0x0039] %asi, %r24
cpu_intr_2_389:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24de0fd  ! 4864: LDSB_I	ldsb	[%r23 + 0x00fd], %r25
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, e)
	.word 0xfc05e0eb  ! 4872: LDUW_I	lduw	[%r23 + 0x00eb], %r30
T2_asi_reg_rd_243:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_390:
	setx	0x470113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d4000  ! 4878: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xb61dc000  ! 4879: XOR_R	xor 	%r23, %r0, %r27
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb535c000  ! 4882: SRL_R	srl 	%r23, %r0, %r26
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, 0)
	.word 0xba3d21b8  ! 4889: XNOR_I	xnor 	%r20, 0x01b8, %r29
cpu_intr_2_391:
	setx	0x47000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c7001  ! 4891: SLLX_I	sllx	%r17, 0x0001, %r24
	.word 0xfa44c000  ! 4899: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf8d421d6  ! 4901: LDSHA_I	ldsha	[%r16, + 0x01d6] %asi, %r28
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983840  ! 4903: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1840, %hpstate
T2_asi_reg_wr_222:
	mov	0x8, %r14
	.word 0xf6f38400  ! 4905: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb2a5c000  ! 4906: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0xbf7d2401  ! 4907: MOVR_I	movre	%r20, 0x1, %r31
cpu_intr_2_392:
	setx	0x47022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_406:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_406), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_407:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_407), 16, 16)) -> intp(2, 0, 2e)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_244:
	mov	0x29, %r14
	.word 0xfedb8e40  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_223:
	mov	0x14, %r14
	.word 0xfaf38e60  ! 4914: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfecdc020  ! 4916: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
cpu_intr_2_393:
	setx	0x30108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_394:
	setx	0x440036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095217c  ! 4921: LDUHA_I	lduha	[%r20, + 0x017c] %asi, %r24
	.word 0xb48da027  ! 4922: ANDcc_I	andcc 	%r22, 0x0027, %r26
	.word 0xfa840020  ! 4923: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
cpu_intr_2_395:
	setx	0x460035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_408:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_408), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_396:
	setx	0x46030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_409:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_409), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4cd61cb  ! 4936: LDSBA_I	ldsba	[%r21, + 0x01cb] %asi, %r26
T2_asi_reg_rd_245:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbf641800  ! 4938: MOVcc_R	<illegal instruction>
	.word 0xf0cc8020  ! 4939: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
T2_asi_reg_rd_246:
	mov	0x2b, %r14
	.word 0xf8db89e0  ! 4941: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfa5da0f6  ! 4942: LDX_I	ldx	[%r22 + 0x00f6], %r29
	.word 0xf25c20e4  ! 4944: LDX_I	ldx	[%r16 + 0x00e4], %r25
iob_intr_2_410:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_410), 16, 16)) -> intp(2, 0, 1b)
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f92  ! 4946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f92, %hpstate
	.word 0xfecc8020  ! 4947: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
cpu_intr_2_397:
	setx	0x460125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0054000  ! 4959: ADD_R	add 	%r21, %r0, %r24
cpu_intr_2_398:
	setx	0x460327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 4961: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_TO_TL0
	.word 0xb8aca00d  ! 4963: ANDNcc_I	andncc 	%r18, 0x000d, %r28
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982982  ! 4965: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
	.word 0xf854613f  ! 4966: LDSH_I	ldsh	[%r17 + 0x013f], %r28
	.word 0xf0952036  ! 4969: LDUHA_I	lduha	[%r20, + 0x0036] %asi, %r24
	.word 0xfe050000  ! 4970: LDUW_R	lduw	[%r20 + %r0], %r31
T2_asi_reg_rd_247:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 4971: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_224:
	mov	0x2, %r14
	.word 0xf8f38400  ! 4972: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf00d4000  ! 4976: LDUB_R	ldub	[%r21 + %r0], %r24
T2_asi_reg_wr_225:
	mov	0x7, %r14
	.word 0xfaf389e0  ! 4978: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbab460e8  ! 4979: SUBCcc_I	orncc 	%r17, 0x00e8, %r29
	.word 0xbd3cd000  ! 4980: SRAX_R	srax	%r19, %r0, %r30
	.word 0xfec4e06d  ! 4983: LDSWA_I	ldswa	[%r19, + 0x006d] %asi, %r31
iob_intr_2_411:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_411), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_226:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 4988: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_412:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_412), 16, 16)) -> intp(2, 0, 35)
	.word 0xf4044000  ! 4993: LDUW_R	lduw	[%r17 + %r0], %r26
T2_asi_reg_wr_227:
	mov	0x11, %r14
	.word 0xfcf389e0  ! 4994: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb8a58000  ! 4995: SUBcc_R	subcc 	%r22, %r0, %r28
	.word 0xfe85e1b7  ! 4998: LDUWA_I	lduwa	[%r23, + 0x01b7] %asi, %r31
cpu_intr_2_399:
	setx	0x47012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
T1_asi_reg_rd_0:
	mov	0x20, %r14
	.word 0xf8db84a0  ! 2: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1a00040  ! 5: FMOVd	fmovd	%f0, %f24
	.word 0xb1a589e0  ! 6: FDIVq	dis not found

cpu_intr_1_0:
	setx	0x1c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_1:
	setx	0x1d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_2:
	setx	0x1c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_3:
	setx	0x1f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_0:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 17: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5a00540  ! 24: FSQRTd	fsqrt	
	.word 0xb5a00560  ! 27: FSQRTq	fsqrt	
cpu_intr_1_4:
	setx	0x1e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 30: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_5:
	setx	0x1c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_6:
	setx	0x1d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_7:
	setx	0x1f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_8:
	setx	0x1e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c9e0  ! 48: FDIVq	dis not found

cpu_intr_1_10:
	setx	0x1d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c5000  ! 50: SRAX_R	srax	%r17, %r0, %r26
	.word 0xbba00520  ! 51: FSQRTs	fsqrt	
	.word 0xbfaa8820  ! 52: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_1:
	mov	0x26, %r14
	.word 0xf6f389e0  ! 55: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb3aac820  ! 60: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_11:
	setx	0x1e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a509e0  ! 63: FDIVq	dis not found

iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_2:
	mov	0x25, %r14
	.word 0xf4db8e40  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbdaa4820  ! 69: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_12:
	setx	0x1c000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 77: FSQRTd	fsqrt	
	.word 0xb1a489c0  ! 79: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb1a88820  ! 80: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_2:
	mov	0x36, %r14
	.word 0xf4f38400  ! 82: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb4bd20b6  ! 83: XNORcc_I	xnorcc 	%r20, 0x00b6, %r26
T1_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbba44820  ! 89: FADDs	fadds	%f17, %f0, %f29
cpu_intr_1_13:
	setx	0x1c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 91: MOVcc_R	<illegal instruction>
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 21)
	.word 0xbda508a0  ! 96: FSUBs	fsubs	%f20, %f0, %f30
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a9c820  ! 100: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a40920  ! 101: FMULs	fmuls	%f16, %f0, %f28
	.word 0xbfa80820  ! 102: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb82c0000  ! 106: ANDN_R	andn 	%r16, %r0, %r28
T1_asi_reg_wr_3:
	mov	0x1b, %r14
	.word 0xf6f38e40  ! 108: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 36)
	.word 0xb7a00040  ! 116: FMOVd	fmovd	%f0, %f58
	.word 0xb3abc820  ! 117: FMOVVC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_4:
	mov	0x1e, %r14
	.word 0xfcdb84a0  ! 118: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_14:
	setx	0x1c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_15:
	setx	0x1d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 125: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb4a40000  ! 129: SUBcc_R	subcc 	%r16, %r0, %r26
T1_asi_reg_wr_4:
	mov	0x20, %r14
	.word 0xf8f38400  ! 131: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3abc820  ! 132: FMOVVC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_16:
	setx	0x1d030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5c000  ! 137: ORNcc_R	orncc 	%r23, %r0, %r28
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_17:
	setx	0x1c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 140: FMOVL	fmovs	%fcc1, %f0, %f24
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a81420  ! 146: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6bd8000  ! 151: XNORcc_R	xnorcc 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81420  ! 154: FMOVRNZ	dis not found

cpu_intr_1_18:
	setx	0x1f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_19:
	setx	0x1e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_20:
	setx	0x1c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_5:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 165: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb894c000  ! 166: ORcc_R	orcc 	%r19, %r0, %r28
T1_asi_reg_rd_6:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 168: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a88820  ! 170: FMOVLE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_7:
	mov	0xe, %r14
	.word 0xf2db8400  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb3a80c20  ! 186: FMOVRLZ	dis not found

T1_asi_reg_rd_8:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 188: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_rd_9:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda54840  ! 194: FADDd	faddd	%f52, %f0, %f30
T1_asi_reg_wr_5:
	mov	0x10, %r14
	.word 0xfaf389e0  ! 197: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1a50920  ! 204: FMULs	fmuls	%f20, %f0, %f24
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb92cc000  ! 210: SLL_R	sll 	%r19, %r0, %r28
	.word 0xb1a5c9a0  ! 212: FDIVs	fdivs	%f23, %f0, %f24
T1_asi_reg_rd_10:
	mov	0x13, %r14
	.word 0xf0db8e40  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_21:
	setx	0x1e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 217: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbba4c9c0  ! 222: FDIVd	fdivd	%f50, %f0, %f60
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3a54840  ! 225: FADDd	faddd	%f52, %f0, %f56
T1_asi_reg_rd_11:
	mov	0x2, %r14
	.word 0xf6db8e60  ! 226: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_22:
	setx	0x1e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7346001  ! 228: SRL_I	srl 	%r17, 0x0001, %r27
T1_asi_reg_rd_12:
	mov	0x38, %r14
	.word 0xf6db84a0  ! 231: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9a5c8e0  ! 233: FSUBq	dis not found

iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_13:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1a00560  ! 239: FSQRTq	fsqrt	
	.word 0x91946029  ! 245: WRPR_PIL_I	wrpr	%r17, 0x0029, %pil
cpu_intr_1_23:
	setx	0x1e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_14:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 249: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_24:
	setx	0x1d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 253: FMOVRGEZ	dis not found

	.word 0xbc94c000  ! 256: ORcc_R	orcc 	%r19, %r0, %r30
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 2b)
	.word 0xa1902000  ! 260: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbfa449c0  ! 261: FDIVd	fdivd	%f48, %f0, %f62
cpu_intr_1_25:
	setx	0x1e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 263: FADDd	faddd	%f50, %f0, %f26
T1_asi_reg_wr_6:
	mov	0x2a, %r14
	.word 0xf2f389e0  ! 264: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7a4c840  ! 265: FADDd	faddd	%f50, %f0, %f58
T1_asi_reg_rd_15:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, e)
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 36)
	.word 0xb7a5c9a0  ! 272: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb9643801  ! 273: MOVcc_I	<illegal instruction>
	.word 0xb1a54840  ! 279: FADDd	faddd	%f52, %f0, %f24
	.word 0xbba5c9a0  ! 280: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb6a4c000  ! 281: SUBcc_R	subcc 	%r19, %r0, %r27
	.word 0xb9a00560  ! 282: FSQRTq	fsqrt	
	.word 0xbfabc820  ! 284: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 286: FMOVN	fmovs	%fcc1, %f0, %f25
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_7:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 290: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1a80c20  ! 291: FMOVRLZ	dis not found

	.word 0xb00460f1  ! 292: ADD_I	add 	%r17, 0x00f1, %r24
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 29)
	.word 0xbbaa4820  ! 298: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_8:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 300: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a489e0  ! 302: FDIVq	dis not found

	.word 0xb7a9c820  ! 303: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_26:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9e0  ! 308: FDIVq	dis not found

iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_27:
	setx	0x1f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_9:
	mov	0xb, %r14
	.word 0xf4f389e0  ! 315: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1a84820  ! 316: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_16:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 320: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_28:
	setx	0x1f0225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_29:
	setx	0x1c021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_30:
	setx	0x1c0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8a0  ! 335: FSUBs	fsubs	%f19, %f0, %f30
T1_asi_reg_rd_17:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 336: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5a44860  ! 337: FADDq	dis not found

T1_asi_reg_rd_18:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbda54960  ! 341: FMULq	dis not found

	.word 0xbfa00020  ! 343: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_10:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 347: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_31:
	setx	0x1c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 351: FMOVd	fmovd	%f0, %f24
T1_asi_reg_wr_11:
	mov	0x34, %r14
	.word 0xf4f389e0  ! 352: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_12:
	mov	0xc, %r14
	.word 0xfaf38e40  ! 355: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_32:
	setx	0x1f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50940  ! 358: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb9a509a0  ! 361: FDIVs	fdivs	%f20, %f0, %f28
T1_asi_reg_wr_13:
	mov	0x4, %r14
	.word 0xfef38e40  ! 363: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3aac820  ! 364: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa4820  ! 365: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_33:
	setx	0x1d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_14:
	mov	0xd, %r14
	.word 0xf0f389e0  ! 368: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_19:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 3)
	.word 0xb5a58840  ! 373: FADDd	faddd	%f22, %f0, %f26
	.word 0xbfaa4820  ! 375: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa8820  ! 376: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_15:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 377: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a9c820  ! 378: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a4c8e0  ! 379: FSUBq	dis not found

iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_34:
	setx	0x1c0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54920  ! 388: FMULs	fmuls	%f21, %f0, %f28
cpu_intr_1_35:
	setx	0x1e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54860  ! 393: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_20:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 395: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbba00040  ! 399: FMOVd	fmovd	%f0, %f60
T1_asi_reg_rd_21:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9a00560  ! 401: FSQRTq	fsqrt	
	.word 0xba144000  ! 404: OR_R	or 	%r17, %r0, %r29
	.word 0xb9346001  ! 405: SRL_I	srl 	%r17, 0x0001, %r28
	.word 0xb8246156  ! 406: SUB_I	sub 	%r17, 0x0156, %r28
	.word 0xb3a80c20  ! 407: FMOVRLZ	dis not found

cpu_intr_1_36:
	setx	0x1d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_22:
	mov	0x1a, %r14
	.word 0xfedb89e0  ! 412: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfa00520  ! 416: FSQRTs	fsqrt	
	.word 0xbba58860  ! 417: FADDq	dis not found

	.word 0xb13c2001  ! 418: SRA_I	sra 	%r16, 0x0001, %r24
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_16:
	mov	0x34, %r14
	.word 0xf4f389e0  ! 420: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_17:
	mov	0x38, %r14
	.word 0xfaf389e0  ! 422: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_37:
	setx	0x1f030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x30, %r14
	.word 0xf8f384a0  ! 427: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_19:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 429: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1a00520  ! 431: FSQRTs	fsqrt	
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, e)
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 3)
	.word 0xb60c0000  ! 435: AND_R	and 	%r16, %r0, %r27
T1_asi_reg_wr_20:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 443: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, d)
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a90820  ! 447: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_23:
	mov	0x38, %r14
	.word 0xfedb8e80  ! 449: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_38:
	setx	0x20013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_24:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 458: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9a00560  ! 460: FSQRTq	fsqrt	
cpu_intr_1_39:
	setx	0x200232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 462: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9abc820  ! 463: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_40:
	setx	0x220311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 469: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb3a90820  ! 471: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_21:
	mov	0x37, %r14
	.word 0xf2f38400  ! 472: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb1a4c8c0  ! 474: FSUBd	fsubd	%f50, %f0, %f24
T1_asi_reg_wr_22:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 475: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0x8995e063  ! 477: WRPR_TICK_I	wrpr	%r23, 0x0063, %tick
	.word 0xb6ad4000  ! 479: ANDNcc_R	andncc 	%r21, %r0, %r27
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_23:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 483: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a8c820  ! 486: FMOVL	fmovs	%fcc1, %f0, %f27
cpu_intr_1_41:
	setx	0x21010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 492: FMOVd	fmovd	%f0, %f58
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a54840  ! 497: FADDd	faddd	%f52, %f0, %f24
	.word 0xbba00520  ! 498: FSQRTs	fsqrt	
cpu_intr_1_42:
	setx	0x200022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc244000  ! 500: SUB_R	sub 	%r17, %r0, %r30
	.word 0xb3a449a0  ! 502: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xb1abc820  ! 503: FMOVVC	fmovs	%fcc1, %f0, %f24
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a548e0  ! 510: FSUBq	dis not found

iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 8)
	.word 0xbbaa8820  ! 517: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_43:
	setx	0x20032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c9e0  ! 525: FDIVq	dis not found

cpu_intr_1_44:
	setx	0x210333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 527: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa589e0  ! 528: FDIVq	dis not found

	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 1e)
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_25:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 532: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfa588c0  ! 533: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xbbaa8820  ! 534: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a81420  ! 536: FMOVRNZ	dis not found

cpu_intr_1_45:
	setx	0x210321, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_24:
	mov	0x26, %r14
	.word 0xfef38e60  ! 539: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7a508a0  ! 540: FSUBs	fsubs	%f20, %f0, %f27
T1_asi_reg_rd_26:
	mov	0xd, %r14
	.word 0xfedb8e80  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_25:
	mov	0x1, %r14
	.word 0xfef38400  ! 543: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1aa4820  ! 544: FMOVNE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_46:
	setx	0x210120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 550: FMOVRNZ	dis not found

iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb6450000  ! 557: ADDC_R	addc 	%r20, %r0, %r27
T1_asi_reg_wr_26:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 562: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 23)
	.word 0xb6b420a3  ! 564: ORNcc_I	orncc 	%r16, 0x00a3, %r27
	.word 0xb7a81820  ! 565: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_47:
	setx	0x220023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_48:
	setx	0x200005, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xb48521a5  ! 579: ADDcc_I	addcc 	%r20, 0x01a5, %r26
T1_asi_reg_wr_27:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 581: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 3a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aa8820  ! 590: FMOVG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_49:
	setx	0x200017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_28:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 595: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a408e0  ! 596: FSUBq	dis not found

	.word 0xb7a54960  ! 597: FMULq	dis not found

cpu_intr_1_50:
	setx	0x220302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 604: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_51:
	setx	0x230101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c8c0  ! 607: FSUBd	fsubd	%f50, %f0, %f58
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_52:
	setx	0x200036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c58000  ! 616: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xb61d0000  ! 618: XOR_R	xor 	%r20, %r0, %r27
	.word 0xbba449e0  ! 619: FDIVq	dis not found

T1_asi_reg_wr_29:
	mov	0x21, %r14
	.word 0xf6f38e60  ! 620: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_27:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_28:
	mov	0x1a, %r14
	.word 0xf8db8e60  ! 624: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5a80420  ! 630: FMOVRZ	dis not found

iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3a00560  ! 635: FSQRTq	fsqrt	
cpu_intr_1_53:
	setx	0x20000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3c619d  ! 638: XNOR_I	xnor 	%r17, 0x019d, %r29
T1_asi_reg_wr_30:
	mov	0x13, %r14
	.word 0xfcf384a0  ! 639: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_29:
	mov	0x12, %r14
	.word 0xfadb8e60  ! 640: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb28c0000  ! 645: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xb7a54840  ! 646: FADDd	faddd	%f52, %f0, %f58
	.word 0xb9a58840  ! 647: FADDd	faddd	%f22, %f0, %f28
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 3a)
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_30:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 650: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_31:
	mov	0x5, %r14
	.word 0xf0db8e60  ! 652: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7aa8820  ! 654: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, a)
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_32:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a509c0  ! 662: FDIVd	fdivd	%f20, %f0, %f28
T1_asi_reg_wr_31:
	mov	0x1d, %r14
	.word 0xfaf384a0  ! 666: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7a00520  ! 669: FSQRTs	fsqrt	
	.word 0xbba00040  ! 670: FMOVd	fmovd	%f0, %f60
cpu_intr_1_54:
	setx	0x210211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 674: FMOVRLZ	dis not found

T1_asi_reg_rd_33:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 677: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_32:
	mov	0x8, %r14
	.word 0xf2f38e80  ! 678: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb3a508c0  ! 681: FSUBd	fsubd	%f20, %f0, %f56
T1_asi_reg_rd_34:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 683: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbac50000  ! 687: ADDCcc_R	addccc 	%r20, %r0, %r29
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_55:
	setx	0x200123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c8a0  ! 692: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb73da001  ! 694: SRA_I	sra 	%r22, 0x0001, %r27
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
cpu_intr_1_56:
	setx	0x210321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 34)
	.word 0xbba80820  ! 704: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a448e0  ! 705: FSUBq	dis not found

T1_asi_reg_rd_35:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb5a489a0  ! 708: FDIVs	fdivs	%f18, %f0, %f26
	.word 0xb5a44820  ! 710: FADDs	fadds	%f17, %f0, %f26
cpu_intr_1_57:
	setx	0x220019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 712: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_58:
	setx	0x220132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548c0  ! 715: FSUBd	fsubd	%f52, %f0, %f28
T1_asi_reg_rd_36:
	mov	0xe, %r14
	.word 0xfedb8e80  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_59:
	setx	0x22033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 723: FSQRTd	fsqrt	
	.word 0xbba8c820  ! 725: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_33:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 728: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_60:
	setx	0x210300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x22020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_62:
	setx	0x23002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 19)
	.word 0xbc240000  ! 748: SUB_R	sub 	%r16, %r0, %r30
T1_asi_reg_wr_34:
	mov	0x38, %r14
	.word 0xfaf38e80  ! 750: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbda44820  ! 751: FADDs	fadds	%f17, %f0, %f30
	.word 0xb0bc0000  ! 756: XNORcc_R	xnorcc 	%r16, %r0, %r24
cpu_intr_1_63:
	setx	0x23010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_35:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 759: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a48940  ! 761: FMULd	fmuld	%f18, %f0, %f28
T1_asi_reg_rd_37:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 763: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_64:
	setx	0x230128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_65:
	setx	0x22001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 772: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb92d9000  ! 773: SLLX_R	sllx	%r22, %r0, %r28
cpu_intr_1_66:
	setx	0x200300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_67:
	setx	0x230223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50840  ! 782: FADDd	faddd	%f20, %f0, %f26
T1_asi_reg_wr_36:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 783: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1a90820  ! 784: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_68:
	setx	0x220033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x0, %r14
	.word 0xfcf389e0  ! 786: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbba00520  ! 787: FSQRTs	fsqrt	
	.word 0xb3ab4820  ! 788: FMOVCC	fmovs	%fcc1, %f0, %f25
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_38:
	mov	0x33, %r14
	.word 0xf4db89e0  ! 793: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_69:
	setx	0x22011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0xc, %r14
	.word 0xf8db8e60  ! 800: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_70:
	setx	0x200328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_40:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbb540000  ! 803: RDPR_GL	<illegal instruction>
cpu_intr_1_71:
	setx	0x21001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 807: FADDd	faddd	%f50, %f0, %f26
T1_asi_reg_rd_41:
	mov	0x12, %r14
	.word 0xf6db89e0  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb9a00520  ! 809: FSQRTs	fsqrt	
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb3a54940  ! 812: FMULd	fmuld	%f52, %f0, %f56
	.word 0xb93d4000  ! 813: SRA_R	sra 	%r21, %r0, %r28
	.word 0xb3a90820  ! 818: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb49d4000  ! 826: XORcc_R	xorcc 	%r21, %r0, %r26
	.word 0xbb2cc000  ! 830: SLL_R	sll 	%r19, %r0, %r29
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_38:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 833: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbba489e0  ! 834: FDIVq	dis not found

	.word 0xb534a001  ! 835: SRL_I	srl 	%r18, 0x0001, %r26
T1_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 837: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7a48860  ! 840: FADDq	dis not found

	.word 0xbc8d8000  ! 841: ANDcc_R	andcc 	%r22, %r0, %r30
	.word 0xb9aac820  ! 842: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_72:
	setx	0x23010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_40:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 851: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5520000  ! 858: RDPR_PIL	<illegal instruction>
	.word 0xbba5c960  ! 859: FMULq	dis not found

	.word 0xb9a58940  ! 860: FMULd	fmuld	%f22, %f0, %f28
	.word 0xbda50920  ! 862: FMULs	fmuls	%f20, %f0, %f30
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3a54860  ! 867: FADDq	dis not found

	.word 0xb1a4c8e0  ! 870: FSUBq	dis not found

T1_asi_reg_rd_42:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 871: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbf2d6001  ! 872: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xbba40820  ! 877: FADDs	fadds	%f16, %f0, %f29
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba80420  ! 880: FMOVRZ	dis not found

iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 25)
	.word 0xb3a9c820  ! 882: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a90820  ! 887: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbba5c9c0  ! 891: FDIVd	fdivd	%f54, %f0, %f60
cpu_intr_1_73:
	setx	0x22002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5a40860  ! 903: FADDq	dis not found

cpu_intr_1_74:
	setx	0x200111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa0820  ! 909: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_75:
	setx	0x220224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_43:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 915: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb03c0000  ! 916: XNOR_R	xnor 	%r16, %r0, %r24
	.word 0xbfa00520  ! 917: FSQRTs	fsqrt	
cpu_intr_1_76:
	setx	0x24012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, f)
	.word 0xbfaa8820  ! 924: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb7a88820  ! 926: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a5c9e0  ! 928: FDIVq	dis not found

cpu_intr_1_77:
	setx	0x240002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 938: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00040  ! 940: FMOVd	fmovd	%f0, %f26
	.word 0xbba00020  ! 942: FMOVs	fmovs	%f0, %f29
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 4)
	.word 0xb1a489c0  ! 945: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb1a588e0  ! 948: FSUBq	dis not found

	.word 0xb12c1000  ! 949: SLLX_R	sllx	%r16, %r0, %r24
T1_asi_reg_rd_44:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_41:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 958: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_78:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_79:
	setx	0x270228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, c)
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_80:
	setx	0x240209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_81:
	setx	0x260204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6354000  ! 980: SUBC_R	orn 	%r21, %r0, %r27
T1_asi_reg_wr_42:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 981: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9a409c0  ! 982: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xb82c2070  ! 985: ANDN_I	andn 	%r16, 0x0070, %r28
T1_asi_reg_wr_43:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 986: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5a84820  ! 988: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_45:
	mov	0x25, %r14
	.word 0xf2db89e0  ! 992: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7a50940  ! 993: FMULd	fmuld	%f20, %f0, %f58
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_82:
	setx	0x25032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194203b  ! 997: WRPR_PIL_I	wrpr	%r16, 0x003b, %pil
T1_asi_reg_rd_46:
	mov	0x21, %r14
	.word 0xfcdb84a0  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_83:
	setx	0x240016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_84:
	setx	0x270031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 1003: FSQRTs	fsqrt	
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_85:
	setx	0x24012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3c8000  ! 1009: XNOR_R	xnor 	%r18, %r0, %r29
	.word 0xb1a44920  ! 1010: FMULs	fmuls	%f17, %f0, %f24
cpu_intr_1_86:
	setx	0x24013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a54920  ! 1015: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb2b561d5  ! 1016: SUBCcc_I	orncc 	%r21, 0x01d5, %r25
	.word 0xbda44960  ! 1018: FMULq	dis not found

iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 0)
	.word 0xbba8c820  ! 1021: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb1a5c820  ! 1023: FADDs	fadds	%f23, %f0, %f24
cpu_intr_1_87:
	setx	0x250326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_88:
	setx	0x270338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_89:
	setx	0x250114, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda54860  ! 1038: FADDq	dis not found

cpu_intr_1_90:
	setx	0x260310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_47:
	mov	0x7, %r14
	.word 0xfcdb84a0  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb3a489e0  ! 1047: FDIVq	dis not found

	.word 0xba8c2015  ! 1048: ANDcc_I	andcc 	%r16, 0x0015, %r29
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda00040  ! 1050: FMOVd	fmovd	%f0, %f30
	.word 0xbe258000  ! 1052: SUB_R	sub 	%r22, %r0, %r31
	.word 0xb9a9c820  ! 1054: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_48:
	mov	0x19, %r14
	.word 0xfcdb8e80  ! 1055: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb7a409c0  ! 1056: FDIVd	fdivd	%f16, %f0, %f58
cpu_intr_1_91:
	setx	0x270227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_92:
	setx	0x260027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48860  ! 1063: FADDq	dis not found

	.word 0xb9ab0820  ! 1064: FMOVGU	fmovs	%fcc1, %f0, %f28
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_44:
	mov	0x15, %r14
	.word 0xfaf38e60  ! 1070: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_49:
	mov	0x21, %r14
	.word 0xf6db8e80  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_50:
	mov	0xc, %r14
	.word 0xf2db89e0  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfa50940  ! 1083: FMULd	fmuld	%f20, %f0, %f62
	.word 0xb5aa8820  ! 1084: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a5c9e0  ! 1085: FDIVq	dis not found

	.word 0xb5a44960  ! 1086: FMULq	dis not found

	.word 0xb3a50920  ! 1087: FMULs	fmuls	%f20, %f0, %f25
T1_asi_reg_rd_51:
	mov	0x33, %r14
	.word 0xfcdb84a0  ! 1094: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7ab8820  ! 1095: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a9c820  ! 1096: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9520000  ! 1102: RDPR_PIL	<illegal instruction>
	.word 0xbfa509e0  ! 1106: FDIVq	dis not found

T1_asi_reg_wr_45:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 1107: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbdaac820  ! 1108: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 17)
	.word 0xb1a409a0  ! 1117: FDIVs	fdivs	%f16, %f0, %f24
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_93:
	setx	0x260031, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_52:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 1127: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9a54920  ! 1129: FMULs	fmuls	%f21, %f0, %f28
T1_asi_reg_wr_46:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1131: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7a00040  ! 1137: FMOVd	fmovd	%f0, %f58
cpu_intr_1_94:
	setx	0x250209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9aac820  ! 1142: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_95:
	setx	0x270307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 1146: FSQRTs	fsqrt	
T1_asi_reg_wr_47:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 1147: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb0a421fd  ! 1149: SUBcc_I	subcc 	%r16, 0x01fd, %r24
	.word 0xbda80820  ! 1150: FMOVN	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_53:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 1151: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a80c20  ! 1154: FMOVRLZ	dis not found

T1_asi_reg_wr_48:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 1156: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfa90820  ! 1157: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c9e0  ! 1158: FDIVq	dis not found

iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_49:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 1163: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_54:
	mov	0xa, %r14
	.word 0xfedb8e60  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb134b001  ! 1168: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xb89c2176  ! 1172: XORcc_I	xorcc 	%r16, 0x0176, %r28
	.word 0xb1a40820  ! 1176: FADDs	fadds	%f16, %f0, %f24
cpu_intr_1_96:
	setx	0x270128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 1178: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda58920  ! 1179: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb9a00040  ! 1180: FMOVd	fmovd	%f0, %f28
cpu_intr_1_97:
	setx	0x240036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 1185: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80820  ! 1186: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_98:
	setx	0x250030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_99:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d6001  ! 1192: SLL_I	sll 	%r21, 0x0001, %r28
cpu_intr_1_100:
	setx	0x260108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_55:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_101:
	setx	0x250313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_50:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 1204: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7a00020  ! 1205: FMOVs	fmovs	%f0, %f27
T1_asi_reg_wr_51:
	mov	0x32, %r14
	.word 0xfcf38400  ! 1213: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbfa84820  ! 1215: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_56:
	mov	0x13, %r14
	.word 0xfadb84a0  ! 1216: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_52:
	mov	0x5, %r14
	.word 0xf2f38e80  ! 1217: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb8056102  ! 1218: ADD_I	add 	%r21, 0x0102, %r28
cpu_intr_1_102:
	setx	0x270227, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 1221: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5a58960  ! 1224: FMULq	dis not found

	.word 0xb9a408c0  ! 1225: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xbda00560  ! 1226: FSQRTq	fsqrt	
T1_asi_reg_wr_54:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 1227: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 17)
	.word 0xbc8dc000  ! 1229: ANDcc_R	andcc 	%r23, %r0, %r30
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbbaac820  ! 1231: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a81420  ! 1233: FMOVRNZ	dis not found

iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda4c8c0  ! 1238: FSUBd	fsubd	%f50, %f0, %f30
T1_asi_reg_rd_57:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_103:
	setx	0x27021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_58:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 1242: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a00040  ! 1247: FMOVd	fmovd	%f0, %f56
	.word 0xb8adc000  ! 1249: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xb9a9c820  ! 1252: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_104:
	setx	0x250117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 1258: FMOVPOS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_105:
	setx	0x250329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_106:
	setx	0x270305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a48960  ! 1264: FMULq	dis not found

	.word 0xb7a81c20  ! 1267: FMOVRGEZ	dis not found

cpu_intr_1_107:
	setx	0x26002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 1275: FMOVRZ	dis not found

cpu_intr_1_108:
	setx	0x260235, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_59:
	mov	0xb, %r14
	.word 0xfedb8e60  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb884c000  ! 1278: ADDcc_R	addcc 	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a48960  ! 1283: FMULq	dis not found

cpu_intr_1_109:
	setx	0x26033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a449c0  ! 1287: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb1a80420  ! 1288: FMOVRZ	dis not found

	.word 0xb2058000  ! 1289: ADD_R	add 	%r22, %r0, %r25
	.word 0xb1a54920  ! 1290: FMULs	fmuls	%f21, %f0, %f24
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_110:
	setx	0x24000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_111:
	setx	0x24022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_112:
	setx	0x27031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_55:
	mov	0x26, %r14
	.word 0xfef38e80  ! 1300: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb7a80420  ! 1302: FMOVRZ	dis not found

cpu_intr_1_113:
	setx	0x250216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_60:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 1308: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb92da001  ! 1310: SLL_I	sll 	%r22, 0x0001, %r28
	.word 0xbdab4820  ! 1311: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 1e)
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb5a9c820  ! 1316: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbba4c820  ! 1319: FADDs	fadds	%f19, %f0, %f29
	.word 0xb3a81420  ! 1321: FMOVRNZ	dis not found

	.word 0xbfa548a0  ! 1324: FSUBs	fsubs	%f21, %f0, %f31
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 1)
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb5a00560  ! 1337: FSQRTq	fsqrt	
	.word 0xb1a548a0  ! 1342: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb3a58960  ! 1344: FMULq	dis not found

T1_asi_reg_wr_56:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 1345: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_57:
	mov	0x19, %r14
	.word 0xfaf38400  ! 1348: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, b)
	.word 0xb97c8400  ! 1352: MOVR_R	movre	%r18, %r0, %r28
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_61:
	mov	0x5, %r14
	.word 0xfedb8400  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_114:
	setx	0x270000, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_58:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 1361: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_59:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 1362: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5a80820  ! 1364: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbba54960  ! 1366: FMULq	dis not found

iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_115:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 1374: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_60:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 1378: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_62:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 1384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_63:
	mov	0xe, %r14
	.word 0xf8db8e80  ! 1387: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_116:
	setx	0x24022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_117:
	setx	0x29030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0x19, %r14
	.word 0xfcf38400  ! 1395: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 39)
	.word 0xb29c204a  ! 1398: XORcc_I	xorcc 	%r16, 0x004a, %r25
	.word 0xb7a5c9a0  ! 1400: FDIVs	fdivs	%f23, %f0, %f27
cpu_intr_1_118:
	setx	0x2a003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4a1ce  ! 1403: ORNcc_I	orncc 	%r18, 0x01ce, %r27
T1_asi_reg_rd_64:
	mov	0x2b, %r14
	.word 0xf8db8e40  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_65:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 1405: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb93ca001  ! 1406: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xb1a4c920  ! 1409: FMULs	fmuls	%f19, %f0, %f24
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba8c820  ! 1424: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_66:
	mov	0x18, %r14
	.word 0xf6db8e60  ! 1426: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbda8c820  ! 1428: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_119:
	setx	0x2b0339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_120:
	setx	0x2a0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_67:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 1436: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb934f001  ! 1438: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xbfa00540  ! 1440: FSQRTd	fsqrt	
	.word 0xbca5a03a  ! 1445: SUBcc_I	subcc 	%r22, 0x003a, %r30
	.word 0xbda40840  ! 1446: FADDd	faddd	%f16, %f0, %f30
cpu_intr_1_121:
	setx	0x2b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_122:
	setx	0x290002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 1453: FSQRTs	fsqrt	
	.word 0xb5a488c0  ! 1454: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xbda9c820  ! 1455: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa81820  ! 1456: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb9a80820  ! 1461: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_62:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 1462: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9a80420  ! 1463: FMOVRZ	dis not found

	.word 0xbba98820  ! 1465: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbdaa8820  ! 1470: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbcc46013  ! 1471: ADDCcc_I	addccc 	%r17, 0x0013, %r30
T1_asi_reg_rd_68:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 1474: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_63:
	mov	0xe, %r14
	.word 0xf2f38400  ! 1476: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3a81c20  ! 1477: FMOVRGEZ	dis not found

iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 0)
	.word 0xbda548a0  ! 1481: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb5a48960  ! 1482: FMULq	dis not found

cpu_intr_1_123:
	setx	0x290217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d61ce  ! 1486: XNOR_I	xnor 	%r21, 0x01ce, %r25
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_69:
	mov	0x4, %r14
	.word 0xf0db89e0  ! 1488: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_70:
	mov	0x2a, %r14
	.word 0xf0db8400  ! 1490: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_64:
	mov	0x31, %r14
	.word 0xf2f384a0  ! 1493: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_65:
	mov	0x5, %r14
	.word 0xfcf38400  ! 1494: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_124:
	setx	0x290325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa0820  ! 1497: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_71:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 1503: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5aa0820  ! 1507: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 36)
	.word 0xb7a588e0  ! 1510: FSUBq	dis not found

cpu_intr_1_125:
	setx	0x29032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_72:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_66:
	mov	0x1c, %r14
	.word 0xf2f38e60  ! 1515: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_126:
	setx	0x2b0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c920  ! 1518: FMULs	fmuls	%f23, %f0, %f26
	.word 0xbfa5c940  ! 1519: FMULd	fmuld	%f54, %f0, %f62
	.word 0xbda00520  ! 1520: FSQRTs	fsqrt	
	.word 0xbe3c60ad  ! 1522: XNOR_I	xnor 	%r17, 0x00ad, %r31
T1_asi_reg_rd_73:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3a48860  ! 1525: FADDq	dis not found

	.word 0xb5a84820  ! 1527: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a4c8c0  ! 1533: FSUBd	fsubd	%f50, %f0, %f24
T1_asi_reg_wr_67:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 1535: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5abc820  ! 1536: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a9c820  ! 1539: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa44940  ! 1540: FMULd	fmuld	%f48, %f0, %f62
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_68:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 1543: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_69:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 1544: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 30)
	.word 0xb9abc820  ! 1550: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbf51c000  ! 1551: RDPR_TL	<illegal instruction>
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb9a81420  ! 1556: FMOVRNZ	dis not found

cpu_intr_1_127:
	setx	0x2b000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_70:
	mov	0x24, %r14
	.word 0xf0f38400  ! 1561: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda48920  ! 1567: FMULs	fmuls	%f18, %f0, %f30
	.word 0xbda4c9c0  ! 1569: FDIVd	fdivd	%f50, %f0, %f30
T1_asi_reg_rd_74:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 1570: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7a5c960  ! 1573: FMULq	dis not found

T1_asi_reg_rd_75:
	mov	0x2e, %r14
	.word 0xf8db84a0  ! 1574: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_128:
	setx	0x2b022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48960  ! 1584: FMULq	dis not found

iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 16)
	.word 0xb9a4c8a0  ! 1588: FSUBs	fsubs	%f19, %f0, %f28
T1_asi_reg_wr_71:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 1589: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_76:
	mov	0x2e, %r14
	.word 0xf0db8e40  ! 1590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_129:
	setx	0x280128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x2a0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508e0  ! 1596: FSUBq	dis not found

cpu_intr_1_131:
	setx	0x290131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 15)
	.word 0xb9aa4820  ! 1603: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_72:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 1605: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a00540  ! 1607: FSQRTd	fsqrt	
	.word 0xb3a94820  ! 1608: FMOVCS	fmovs	%fcc1, %f0, %f25
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 6)
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_132:
	setx	0x28030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_73:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 1622: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1a80820  ! 1623: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb5a81420  ! 1624: FMOVRNZ	dis not found

	.word 0xb3aa4820  ! 1625: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa488a0  ! 1627: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb7a00020  ! 1628: FMOVs	fmovs	%f0, %f27
	.word 0xbe9421e9  ! 1638: ORcc_I	orcc 	%r16, 0x01e9, %r31
T1_asi_reg_rd_77:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 1639: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7a80820  ! 1645: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb1a509c0  ! 1646: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xbba588e0  ! 1647: FSUBq	dis not found

T1_asi_reg_rd_78:
	mov	0x1c, %r14
	.word 0xfcdb8e60  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_79:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_74:
	mov	0x34, %r14
	.word 0xf8f384a0  ! 1654: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_133:
	setx	0x2b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 1658: FMOVs	fmovs	%f0, %f30
	.word 0xb3a5c9e0  ! 1660: FDIVq	dis not found

iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_134:
	setx	0x28003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9a0  ! 1668: FDIVs	fdivs	%f23, %f0, %f27
cpu_intr_1_135:
	setx	0x280238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00040  ! 1672: FMOVd	fmovd	%f0, %f56
	.word 0xb5a54960  ! 1673: FMULq	dis not found

T1_asi_reg_wr_75:
	mov	0x1e, %r14
	.word 0xfef38e80  ! 1676: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda588e0  ! 1677: FSUBq	dis not found

	.word 0xb7a84820  ! 1678: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_76:
	mov	0x2, %r14
	.word 0xf4f38400  ! 1681: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a40940  ! 1685: FMULd	fmuld	%f16, %f0, %f58
cpu_intr_1_136:
	setx	0x2b0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589e0  ! 1689: FDIVq	dis not found

	.word 0xbfa90820  ! 1690: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_77:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 1694: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_78:
	mov	0x13, %r14
	.word 0xf0f38e80  ! 1698: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb5641800  ! 1700: MOVcc_R	<illegal instruction>
	.word 0xb7a00020  ! 1701: FMOVs	fmovs	%f0, %f27
	.word 0xbdaa0820  ! 1705: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00540  ! 1706: FSQRTd	fsqrt	
T1_asi_reg_rd_80:
	mov	0x2, %r14
	.word 0xf8db8e80  ! 1710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda00560  ! 1714: FSQRTq	fsqrt	
	.word 0xbbaa4820  ! 1715: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a58860  ! 1716: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb57d6401  ! 1718: MOVR_I	movre	%r21, 0x1, %r26
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_137:
	setx	0x2a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d212b  ! 1732: XOR_I	xor 	%r20, 0x012b, %r24
cpu_intr_1_138:
	setx	0x2b0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 1734: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a44840  ! 1739: FADDd	faddd	%f48, %f0, %f56
cpu_intr_1_139:
	setx	0x2b0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, e)
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a9c820  ! 1759: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa58860  ! 1766: FADDq	dis not found

	.word 0xbc9dc000  ! 1768: XORcc_R	xorcc 	%r23, %r0, %r30
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_82:
	mov	0xd, %r14
	.word 0xf2db84a0  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_wr_79:
	mov	0x10, %r14
	.word 0xf2f38e40  ! 1779: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfa54820  ! 1781: FADDs	fadds	%f21, %f0, %f31
T1_asi_reg_rd_83:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 1782: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbfa408e0  ! 1785: FSUBq	dis not found

	.word 0xbba00540  ! 1786: FSQRTd	fsqrt	
cpu_intr_1_140:
	setx	0x2b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_84:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 1793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_80:
	mov	0x26, %r14
	.word 0xfaf38e40  ! 1795: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba489a0  ! 1803: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xb5a00020  ! 1805: FMOVs	fmovs	%f0, %f26
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb1ab8820  ! 1808: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a589a0  ! 1809: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xb9a4c960  ! 1810: FMULq	dis not found

cpu_intr_1_141:
	setx	0x2a0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_142:
	setx	0x290010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_81:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 1816: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_wr_82:
	mov	0x2, %r14
	.word 0xf2f38e40  ! 1821: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb83da0a8  ! 1823: XNOR_I	xnor 	%r22, 0x00a8, %r28
	.word 0xb5a81820  ! 1825: FMOVRGZ	fmovs	%fcc3, %f0, %f26
T1_asi_reg_rd_85:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 1827: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa81420  ! 1831: FMOVRNZ	dis not found

T1_asi_reg_wr_83:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 1832: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda54820  ! 1833: FADDs	fadds	%f21, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_86:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 1835: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_143:
	setx	0x2e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_144:
	setx	0x2d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_87:
	mov	0x2, %r14
	.word 0xfadb8e60  ! 1846: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1a448c0  ! 1850: FSUBd	fsubd	%f48, %f0, %f24
T1_asi_reg_wr_84:
	mov	0x2d, %r14
	.word 0xf4f38e60  ! 1852: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 4)
	.word 0xb82d0000  ! 1857: ANDN_R	andn 	%r20, %r0, %r28
T1_asi_reg_rd_88:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 1858: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_145:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_146:
	setx	0x2c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 20)
	.word 0xbeb5c000  ! 1869: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xb1a00540  ! 1870: FSQRTd	fsqrt	
	.word 0xb33c8000  ! 1871: SRA_R	sra 	%r18, %r0, %r25
T1_asi_reg_wr_85:
	mov	0x6, %r14
	.word 0xf6f38e80  ! 1872: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1aa0820  ! 1873: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_86:
	mov	0x13, %r14
	.word 0xf8f389e0  ! 1876: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5a488c0  ! 1877: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xbda81820  ! 1879: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_rd_89:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 1880: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_87:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 1881: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9a00540  ! 1890: FSQRTd	fsqrt	
cpu_intr_1_147:
	setx	0x2c0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 1892: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbfa50940  ! 1894: FMULd	fmuld	%f20, %f0, %f62
	.word 0xbda81420  ! 1895: FMOVRNZ	dis not found

iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_148:
	setx	0x2c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_149:
	setx	0x2c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 1901: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbba80c20  ! 1902: FMOVRLZ	dis not found

T1_asi_reg_rd_90:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 1904: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba54940  ! 1907: FMULd	fmuld	%f52, %f0, %f60
T1_asi_reg_rd_91:
	mov	0x35, %r14
	.word 0xf4db8e60  ! 1908: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_150:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_151:
	setx	0x2c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 1915: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_152:
	setx	0x2f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_153:
	setx	0x2f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_154:
	setx	0x2d0124, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x20, %r14
	.word 0xf8f38e80  ! 1921: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_89:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 1923: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb8448000  ! 1929: ADDC_R	addc 	%r18, %r0, %r28
T1_asi_reg_wr_90:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 1931: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb6ac8000  ! 1934: ANDNcc_R	andncc 	%r18, %r0, %r27
	.word 0xbcc48000  ! 1935: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xb3a00540  ! 1936: FSQRTd	fsqrt	
T1_asi_reg_wr_91:
	mov	0x12, %r14
	.word 0xf4f38e60  ! 1937: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3a00560  ! 1938: FSQRTq	fsqrt	
	.word 0xb3a40840  ! 1939: FADDd	faddd	%f16, %f0, %f56
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda00540  ! 1943: FSQRTd	fsqrt	
cpu_intr_1_155:
	setx	0x2c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a488a0  ! 1949: FSUBs	fsubs	%f18, %f0, %f25
T1_asi_reg_wr_92:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 1953: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_wr_93:
	mov	0x29, %r14
	.word 0xfcf389e0  ! 1956: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_92:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1a5c9e0  ! 1961: FDIVq	dis not found

cpu_intr_1_156:
	setx	0x2c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 3)
	.word 0xb1abc820  ! 1968: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a40940  ! 1969: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb7a549e0  ! 1971: FDIVq	dis not found

	.word 0xb9a44860  ! 1973: FADDq	dis not found

	.word 0xb7aa4820  ! 1975: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb6acc000  ! 1977: ANDNcc_R	andncc 	%r19, %r0, %r27
cpu_intr_1_157:
	setx	0x2c000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_94:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 1980: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_95:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 1982: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb685c000  ! 1993: ADDcc_R	addcc 	%r23, %r0, %r27
cpu_intr_1_158:
	setx	0x2e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48960  ! 1995: FMULq	dis not found

cpu_intr_1_159:
	setx	0x2e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_96:
	mov	0x24, %r14
	.word 0xfcf389e0  ! 1998: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb60c60a6  ! 1999: AND_I	and 	%r17, 0x00a6, %r27
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_160:
	setx	0x2f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 2007: FSQRTq	fsqrt	
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda408a0  ! 2011: FSUBs	fsubs	%f16, %f0, %f30
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_161:
	setx	0x2f0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_97:
	mov	0xa, %r14
	.word 0xfef38e40  ! 2019: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_162:
	setx	0x2d0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 2023: FSQRTs	fsqrt	
cpu_intr_1_163:
	setx	0x2d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0c0000  ! 2030: AND_R	and 	%r16, %r0, %r30
	.word 0xbbab8820  ! 2031: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb7aa0820  ! 2035: FMOVA	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_98:
	mov	0x1e, %r14
	.word 0xf0f38400  ! 2036: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a40960  ! 2040: FMULq	dis not found

	.word 0xb9ab0820  ! 2042: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_164:
	setx	0x2d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_99:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 2044: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9a44860  ! 2046: FADDq	dis not found

	.word 0xbba508e0  ! 2047: FSUBq	dis not found

cpu_intr_1_165:
	setx	0x2c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22da1ac  ! 2051: ANDN_I	andn 	%r22, 0x01ac, %r25
cpu_intr_1_166:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_167:
	setx	0x2f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb35e001  ! 2055: SRL_I	srl 	%r23, 0x0001, %r29
cpu_intr_1_168:
	setx	0x2e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_169:
	setx	0x2f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d6135  ! 2063: ANDcc_I	andcc 	%r21, 0x0135, %r30
	.word 0xb7abc820  ! 2066: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_170:
	setx	0x2e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c920  ! 2075: FMULs	fmuls	%f23, %f0, %f27
T1_asi_reg_wr_100:
	mov	0xd, %r14
	.word 0xf4f38e60  ! 2076: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb225a17c  ! 2078: SUB_I	sub 	%r22, 0x017c, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5aac820  ! 2082: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba98820  ! 2083: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb02d0000  ! 2085: ANDN_R	andn 	%r20, %r0, %r24
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_101:
	mov	0x1c, %r14
	.word 0xfef38400  ! 2089: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_171:
	setx	0x2f013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_102:
	mov	0xa, %r14
	.word 0xf4f38400  ! 2094: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 0)
	.word 0xb7a48940  ! 2096: FMULd	fmuld	%f18, %f0, %f58
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbda58840  ! 2101: FADDd	faddd	%f22, %f0, %f30
	.word 0xb5a4c8a0  ! 2103: FSUBs	fsubs	%f19, %f0, %f26
T1_asi_reg_rd_93:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 2106: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbda489e0  ! 2108: FDIVq	dis not found

iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, e)
	.word 0x8d946196  ! 2112: WRPR_PSTATE_I	wrpr	%r17, 0x0196, %pstate
	.word 0xb5a5c820  ! 2115: FADDs	fadds	%f23, %f0, %f26
T1_asi_reg_wr_103:
	mov	0x23, %r14
	.word 0xf8f384a0  ! 2120: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_172:
	setx	0x2e033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x1e, %r14
	.word 0xfcdb8e60  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3357001  ! 2133: SRLX_I	srlx	%r21, 0x0001, %r25
T1_asi_reg_rd_95:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 2138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbba81c20  ! 2140: FMOVRGEZ	dis not found

	.word 0xb1a00020  ! 2143: FMOVs	fmovs	%f0, %f24
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_96:
	mov	0x2c, %r14
	.word 0xf2db8e60  ! 2148: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_104:
	mov	0x3, %r14
	.word 0xfef38e40  ! 2150: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a90820  ! 2151: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_97:
	mov	0x2b, %r14
	.word 0xfedb89e0  ! 2152: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_98:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 2156: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_105:
	mov	0x3, %r14
	.word 0xf6f38e80  ! 2162: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb77ce401  ! 2164: MOVR_I	movre	%r19, 0x1, %r27
T1_asi_reg_wr_106:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 2165: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9a00560  ! 2166: FSQRTq	fsqrt	
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb934a001  ! 2170: SRL_I	srl 	%r18, 0x0001, %r28
	.word 0xbba00020  ! 2172: FMOVs	fmovs	%f0, %f29
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_99:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 2180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5643801  ! 2182: MOVcc_I	<illegal instruction>
T1_asi_reg_rd_100:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 2183: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb5a5c820  ! 2184: FADDs	fadds	%f23, %f0, %f26
	.word 0xbda50940  ! 2185: FMULd	fmuld	%f20, %f0, %f30
cpu_intr_1_173:
	setx	0x2c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_174:
	setx	0x2c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x2c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 2192: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9a00520  ! 2194: FSQRTs	fsqrt	
T1_asi_reg_rd_101:
	mov	0x21, %r14
	.word 0xf4db84a0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a00520  ! 2200: FSQRTs	fsqrt	
T1_asi_reg_wr_108:
	mov	0x5, %r14
	.word 0xf2f384a0  ! 2201: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_rd_102:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 2203: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_109:
	mov	0x12, %r14
	.word 0xf6f38e60  ! 2205: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba50940  ! 2209: FMULd	fmuld	%f20, %f0, %f60
T1_asi_reg_rd_103:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7a88820  ! 2211: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_110:
	mov	0xc, %r14
	.word 0xfaf38400  ! 2215: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2216: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_105:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb8b5601e  ! 2221: SUBCcc_I	orncc 	%r21, 0x001e, %r28
	.word 0xbba00020  ! 2224: FMOVs	fmovs	%f0, %f29
	.word 0xb3a40920  ! 2227: FMULs	fmuls	%f16, %f0, %f25
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda48840  ! 2234: FADDd	faddd	%f18, %f0, %f30
	.word 0xb9a489e0  ! 2236: FDIVq	dis not found

T1_asi_reg_rd_106:
	mov	0x2a, %r14
	.word 0xfcdb8e60  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_176:
	setx	0x2c010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_107:
	mov	0xb, %r14
	.word 0xf6db8e40  ! 2239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_108:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 2244: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbe846096  ! 2248: ADDcc_I	addcc 	%r17, 0x0096, %r31
cpu_intr_1_177:
	setx	0x2e031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_111:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2250: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a84820  ! 2252: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_112:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 2253: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9a589e0  ! 2254: FDIVq	dis not found

	.word 0xbda58860  ! 2255: FADDq	dis not found

cpu_intr_1_178:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_179:
	setx	0x2e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_180:
	setx	0x2d030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00040  ! 2266: FMOVd	fmovd	%f0, %f56
T1_asi_reg_wr_113:
	mov	0x5, %r14
	.word 0xf6f38400  ! 2267: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_109:
	mov	0xb, %r14
	.word 0xf8db89e0  ! 2271: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xba8d8000  ! 2276: ANDcc_R	andcc 	%r22, %r0, %r29
	.word 0xbba81820  ! 2277: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb5a80c20  ! 2280: FMOVRLZ	dis not found

cpu_intr_1_181:
	setx	0x2f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a4c9a0  ! 2286: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb7359000  ! 2287: SRLX_R	srlx	%r22, %r0, %r27
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a40820  ! 2293: FADDs	fadds	%f16, %f0, %f26
	.word 0xb1a80820  ! 2295: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb5a588a0  ! 2299: FSUBs	fsubs	%f22, %f0, %f26
	.word 0xb7ab0820  ! 2301: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbdab0820  ! 2307: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbda40920  ! 2311: FMULs	fmuls	%f16, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_182:
	setx	0x33013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe944000  ! 2322: ORcc_R	orcc 	%r17, %r0, %r31
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 39)
	.word 0xb7a00520  ! 2324: FSQRTs	fsqrt	
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 12)
	.word 0xbb3d3001  ! 2326: SRAX_I	srax	%r20, 0x0001, %r29
T1_asi_reg_wr_114:
	mov	0x37, %r14
	.word 0xf0f38e60  ! 2329: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbba00560  ! 2330: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda80820  ! 2337: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_183:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_115:
	mov	0x33, %r14
	.word 0xfef38e40  ! 2342: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 25)
	.word 0xb535a001  ! 2345: SRL_I	srl 	%r22, 0x0001, %r26
	.word 0xb1ab8820  ! 2347: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_110:
	mov	0x1d, %r14
	.word 0xf8db8400  ! 2356: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
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
	.word 0xb5a88820  ! 2361: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1a80c20  ! 2367: FMOVRLZ	dis not found

iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 20)
	.word 0xb1a408e0  ! 2371: FSUBq	dis not found

cpu_intr_1_184:
	setx	0x33033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 2375: FMOVRLZ	dis not found

	.word 0xbba548c0  ! 2376: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xbda44960  ! 2378: FMULq	dis not found

T1_asi_reg_wr_116:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 2379: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_185:
	setx	0x300118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 2385: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_186:
	setx	0x320309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_187:
	setx	0x310239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c860  ! 2389: FADDq	dis not found

	.word 0xb7a509e0  ! 2391: FDIVq	dis not found

	.word 0xb1a5c8e0  ! 2392: FSUBq	dis not found

	.word 0xb23d8000  ! 2393: XNOR_R	xnor 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_111:
	mov	0x27, %r14
	.word 0xf0db89e0  ! 2397: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb92c4000  ! 2399: SLL_R	sll 	%r17, %r0, %r28
T1_asi_reg_wr_117:
	mov	0x24, %r14
	.word 0xf0f38e80  ! 2401: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_188:
	setx	0x30013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb9aa0820  ! 2405: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba548a0  ! 2407: FSUBs	fsubs	%f21, %f0, %f29
cpu_intr_1_189:
	setx	0x310004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_112:
	mov	0x13, %r14
	.word 0xf8db8400  ! 2410: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1a00520  ! 2416: FSQRTs	fsqrt	
T1_asi_reg_rd_113:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 2417: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb72d4000  ! 2420: SLL_R	sll 	%r21, %r0, %r27
cpu_intr_1_190:
	setx	0x33013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_191:
	setx	0x300301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_192:
	setx	0x33003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_114:
	mov	0x26, %r14
	.word 0xf2db89e0  ! 2424: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_193:
	setx	0x31011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 2428: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a488c0  ! 2429: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xb9a40840  ! 2430: FADDd	faddd	%f16, %f0, %f28
	.word 0xbda00540  ! 2431: FSQRTd	fsqrt	
	.word 0xbba5c9c0  ! 2433: FDIVd	fdivd	%f54, %f0, %f60
T1_asi_reg_rd_115:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9a48860  ! 2443: FADDq	dis not found

T1_asi_reg_rd_116:
	mov	0x2e, %r14
	.word 0xf8db8400  ! 2444: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbe044000  ! 2445: ADD_R	add 	%r17, %r0, %r31
	.word 0xb7a88820  ! 2447: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_117:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 2451: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda48860  ! 2453: FADDq	dis not found

cpu_intr_1_194:
	setx	0x310227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_195:
	setx	0x300018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588c0  ! 2462: FSUBd	fsubd	%f22, %f0, %f56
T1_asi_reg_wr_118:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 2463: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xba3da1c8  ! 2464: XNOR_I	xnor 	%r22, 0x01c8, %r29
	.word 0xbba00540  ! 2466: FSQRTd	fsqrt	
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_196:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_197:
	setx	0x320017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_198:
	setx	0x330328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 2478: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_119:
	mov	0x0, %r14
	.word 0xf6f38e80  ! 2482: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a48840  ! 2490: FADDd	faddd	%f18, %f0, %f26
cpu_intr_1_199:
	setx	0x33012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 2493: FSQRTs	fsqrt	
	.word 0xb9a80c20  ! 2495: FMOVRLZ	dis not found

	.word 0xbfa48860  ! 2496: FADDq	dis not found

T1_asi_reg_wr_120:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 2497: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfa00540  ! 2501: FSQRTd	fsqrt	
	.word 0xbda5c960  ! 2503: FMULq	dis not found

T1_asi_reg_wr_121:
	mov	0xf, %r14
	.word 0xfaf38400  ! 2504: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_122:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 2506: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a40820  ! 2507: FADDs	fadds	%f16, %f0, %f28
	.word 0xb9a84820  ! 2509: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa81420  ! 2510: FMOVRNZ	dis not found

iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa00020  ! 2518: FMOVs	fmovs	%f0, %f31
	.word 0xbba80c20  ! 2526: FMOVRLZ	dis not found

	.word 0xb3a94820  ! 2529: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb095a044  ! 2536: ORcc_I	orcc 	%r22, 0x0044, %r24
T1_asi_reg_rd_118:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 2538: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7aa0820  ! 2544: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda448a0  ! 2546: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb3a44840  ! 2547: FADDd	faddd	%f48, %f0, %f56
cpu_intr_1_200:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_201:
	setx	0x310037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba352073  ! 2552: SUBC_I	orn 	%r20, 0x0073, %r29
	.word 0xb3a409e0  ! 2553: FDIVq	dis not found

cpu_intr_1_202:
	setx	0x330022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a549a0  ! 2555: FDIVs	fdivs	%f21, %f0, %f25
T1_asi_reg_wr_123:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 2556: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1a408c0  ! 2559: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb00560a0  ! 2560: ADD_I	add 	%r21, 0x00a0, %r24
	.word 0xbfa84820  ! 2562: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa0820  ! 2564: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_124:
	mov	0x10, %r14
	.word 0xf2f389e0  ! 2565: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb69d4000  ! 2572: XORcc_R	xorcc 	%r21, %r0, %r27
cpu_intr_1_203:
	setx	0x330029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c460fe  ! 2574: ADDCcc_I	addccc 	%r17, 0x00fe, %r26
	.word 0xb1a54920  ! 2575: FMULs	fmuls	%f21, %f0, %f24
cpu_intr_1_204:
	setx	0x300234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2ad8000  ! 2578: ANDNcc_R	andncc 	%r22, %r0, %r25
T1_asi_reg_rd_119:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 2580: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_205:
	setx	0x33001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa80c20  ! 2586: FMOVRLZ	dis not found

iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a00520  ! 2588: FSQRTs	fsqrt	
	.word 0xb28ce0ac  ! 2590: ANDcc_I	andcc 	%r19, 0x00ac, %r25
	.word 0xb8444000  ! 2593: ADDC_R	addc 	%r17, %r0, %r28
	.word 0xbcad60ac  ! 2598: ANDNcc_I	andncc 	%r21, 0x00ac, %r30
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a54920  ! 2601: FMULs	fmuls	%f21, %f0, %f26
	.word 0xb1a00020  ! 2604: FMOVs	fmovs	%f0, %f24
	.word 0xb134d000  ! 2608: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xb7ab4820  ! 2610: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_120:
	mov	0x3c3, %r14
	.word 0xf0db8400  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a00560  ! 2615: FSQRTq	fsqrt	
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_206:
	setx	0x33013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfa54920  ! 2626: FMULs	fmuls	%f21, %f0, %f31
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 24)
	.word 0xbc9de0c1  ! 2630: XORcc_I	xorcc 	%r23, 0x00c1, %r30
T1_asi_reg_rd_121:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 2632: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3a00520  ! 2633: FSQRTs	fsqrt	
T1_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 2635: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7ab4820  ! 2637: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a98820  ! 2640: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_122:
	mov	0x1, %r14
	.word 0xfedb8400  ! 2642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 14)
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a90820  ! 2647: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80820  ! 2648: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_126:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 2649: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_127:
	mov	0x2f, %r14
	.word 0xf8f384a0  ! 2650: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbe1d4000  ! 2652: XOR_R	xor 	%r21, %r0, %r31
	.word 0xb7643801  ! 2655: MOVcc_I	<illegal instruction>
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_128:
	mov	0x10, %r14
	.word 0xfcf38400  ! 2659: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbe14e0ba  ! 2660: OR_I	or 	%r19, 0x00ba, %r31
cpu_intr_1_207:
	setx	0x300316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 2663: FSQRTd	fsqrt	
T1_asi_reg_rd_123:
	mov	0xe, %r14
	.word 0xf2db8e80  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbaa48000  ! 2675: SUBcc_R	subcc 	%r18, %r0, %r29
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_124:
	mov	0xd, %r14
	.word 0xf4db8e40  ! 2680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a81820  ! 2682: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb1ab0820  ! 2684: FMOVGU	fmovs	%fcc1, %f0, %f24
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_208:
	setx	0x32032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_209:
	setx	0x300229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 22)
	.word 0xb68da124  ! 2702: ANDcc_I	andcc 	%r22, 0x0124, %r27
	.word 0xba9ca13f  ! 2706: XORcc_I	xorcc 	%r18, 0x013f, %r29
	.word 0xb5a4c960  ! 2707: FMULq	dis not found

cpu_intr_1_210:
	setx	0x300318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_129:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 2711: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_211:
	setx	0x32000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_212:
	setx	0x320200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_130:
	mov	0x21, %r14
	.word 0xf0f389e0  ! 2717: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb17da401  ! 2719: MOVR_I	movre	%r22, 0x1, %r24
T1_asi_reg_wr_131:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 2720: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5a9c820  ! 2721: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a548e0  ! 2724: FSUBq	dis not found

iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a00540  ! 2729: FSQRTd	fsqrt	
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_213:
	setx	0x320332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 2734: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81820  ! 2735: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_214:
	setx	0x330004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548e0  ! 2737: FSUBq	dis not found

	.word 0xbda88820  ! 2739: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_125:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 2741: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbba88820  ! 2743: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_132:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 2753: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda508a0  ! 2758: FSUBs	fsubs	%f20, %f0, %f30
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 14)
	.word 0xb550c000  ! 2762: RDPR_TT	<illegal instruction>
T1_asi_reg_rd_126:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb7a448a0  ! 2764: FSUBs	fsubs	%f17, %f0, %f27
T1_asi_reg_rd_127:
	mov	0x2e, %r14
	.word 0xfcdb89e0  ! 2766: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb0240000  ! 2767: SUB_R	sub 	%r16, %r0, %r24
cpu_intr_1_215:
	setx	0x36023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_216:
	setx	0x340323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, f)
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 2)
	.word 0xb9a98820  ! 2784: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a588e0  ! 2785: FSUBq	dis not found

T1_asi_reg_rd_128:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2786: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_217:
	setx	0x340118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 2790: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a58820  ! 2794: FADDs	fadds	%f22, %f0, %f28
T1_asi_reg_wr_133:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 2797: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5a4c940  ! 2801: FMULd	fmuld	%f50, %f0, %f26
	.word 0xbfa588a0  ! 2802: FSUBs	fsubs	%f22, %f0, %f31
T1_asi_reg_wr_134:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 2803: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a8c820  ! 2805: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 3)
	.word 0xb5a00560  ! 2807: FSQRTq	fsqrt	
	.word 0xba34c000  ! 2808: SUBC_R	orn 	%r19, %r0, %r29
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_129:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 2814: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_wr_135:
	mov	0x2c, %r14
	.word 0xfef38e40  ! 2816: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbaa0820  ! 2819: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_218:
	setx	0x370239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_219:
	setx	0x360327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_136:
	mov	0x2a, %r14
	.word 0xfef38e80  ! 2823: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_220:
	setx	0x34021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_130:
	mov	0xb, %r14
	.word 0xfedb8e40  ! 2826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_131:
	mov	0x1c, %r14
	.word 0xf0db84a0  ! 2830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_137:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 2834: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, f)
	.word 0xbda00560  ! 2842: FSQRTq	fsqrt	
cpu_intr_1_221:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_222:
	setx	0x35030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa549a0  ! 2850: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xbba98820  ! 2853: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbba80820  ! 2854: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 5)
	.word 0xbcc48000  ! 2856: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xb9a54840  ! 2858: FADDd	faddd	%f52, %f0, %f28
cpu_intr_1_223:
	setx	0x370009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_132:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7ab8820  ! 2866: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5aac820  ! 2877: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_133:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbba58860  ! 2879: FADDq	dis not found

	.word 0xb5a488e0  ! 2884: FSUBq	dis not found

	.word 0xb5a8c820  ! 2885: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb7a4c9a0  ! 2886: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xbd2cb001  ! 2887: SLLX_I	sllx	%r18, 0x0001, %r30
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb9a80420  ! 2890: FMOVRZ	dis not found

cpu_intr_1_224:
	setx	0x360037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_225:
	setx	0x37031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_138:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 2899: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_226:
	setx	0x340209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 2901: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_227:
	setx	0x340114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_228:
	setx	0x340315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488a0  ! 2906: FSUBs	fsubs	%f18, %f0, %f28
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5641800  ! 2908: MOVcc_R	<illegal instruction>
	.word 0xbba8c820  ! 2909: FMOVL	fmovs	%fcc1, %f0, %f29
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_134:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0x8d95a02e  ! 2916: WRPR_PSTATE_I	wrpr	%r22, 0x002e, %pstate
	.word 0xbf2c5000  ! 2917: SLLX_R	sllx	%r17, %r0, %r31
	.word 0xb434a158  ! 2918: SUBC_I	orn 	%r18, 0x0158, %r26
	.word 0xb5a44840  ! 2919: FADDd	faddd	%f48, %f0, %f26
	.word 0xb1a00540  ! 2920: FSQRTd	fsqrt	
	.word 0xb7a589c0  ! 2921: FDIVd	fdivd	%f22, %f0, %f58
cpu_intr_1_229:
	setx	0x35012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a549a0  ! 2924: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb1a81c20  ! 2925: FMOVRGEZ	dis not found

	.word 0xbfa549c0  ! 2926: FDIVd	fdivd	%f52, %f0, %f62
cpu_intr_1_230:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbdaa8820  ! 2931: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb7ab8820  ! 2932: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_139:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 2933: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0x8995a02f  ! 2934: WRPR_TICK_I	wrpr	%r22, 0x002f, %tick
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a00540  ! 2939: FSQRTd	fsqrt	
	.word 0xb3a509a0  ! 2941: FDIVs	fdivs	%f20, %f0, %f25
cpu_intr_1_231:
	setx	0x35012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7aa8820  ! 2947: FMOVG	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb5a00020  ! 2951: FMOVs	fmovs	%f0, %f26
T1_asi_reg_wr_140:
	mov	0x19, %r14
	.word 0xf6f38e80  ! 2955: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb3a409c0  ! 2956: FDIVd	fdivd	%f16, %f0, %f56
T1_asi_reg_rd_135:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbba4c9a0  ! 2962: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xb9a54920  ! 2963: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb7a5c920  ! 2964: FMULs	fmuls	%f23, %f0, %f27
T1_asi_reg_wr_141:
	mov	0x5, %r14
	.word 0xfef389e0  ! 2967: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5a4c8a0  ! 2968: FSUBs	fsubs	%f19, %f0, %f26
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a94820  ! 2973: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00540  ! 2974: FSQRTd	fsqrt	
	.word 0xb3aa0820  ! 2975: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_232:
	setx	0x37010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_136:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 2981: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfa549c0  ! 2983: FDIVd	fdivd	%f52, %f0, %f62
	.word 0xb7a98820  ! 2988: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_142:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 2992: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_233:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_234:
	setx	0x360316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c920  ! 2998: FMULs	fmuls	%f19, %f0, %f29
T1_asi_reg_wr_143:
	mov	0x30, %r14
	.word 0xf0f38400  ! 3007: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a8c820  ! 3010: FMOVL	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aa0820  ! 3015: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb9a88820  ! 3017: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a548c0  ! 3019: FSUBd	fsubd	%f52, %f0, %f58
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_137:
	mov	0x13, %r14
	.word 0xfcdb8e80  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_235:
	setx	0x35021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_138:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 3025: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_236:
	setx	0x370006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabc4000  ! 3029: XNORcc_R	xnorcc 	%r17, %r0, %r29
cpu_intr_1_237:
	setx	0x350213, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_139:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3031: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9a5c8e0  ! 3032: FSUBq	dis not found

cpu_intr_1_238:
	setx	0x370131, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_144:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3046: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbdab0820  ! 3048: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_239:
	setx	0x370122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_240:
	setx	0x370311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_140:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 3057: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_241:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 8)
	.word 0xbda48840  ! 3062: FADDd	faddd	%f18, %f0, %f30
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 26)
	.word 0xb034a085  ! 3073: ORN_I	orn 	%r18, 0x0085, %r24
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_145:
	mov	0x2, %r14
	.word 0xfcf38e40  ! 3078: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba40960  ! 3080: FMULq	dis not found

T1_asi_reg_wr_146:
	mov	0x6, %r14
	.word 0xf8f38e60  ! 3081: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbbab0820  ! 3082: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a58840  ! 3084: FADDd	faddd	%f22, %f0, %f58
cpu_intr_1_242:
	setx	0x350215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409a0  ! 3094: FDIVs	fdivs	%f16, %f0, %f27
T1_asi_reg_rd_141:
	mov	0x5, %r14
	.word 0xfedb89e0  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_147:
	mov	0xf, %r14
	.word 0xf0f384a0  ! 3098: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 6)
	.word 0xb9a80420  ! 3100: FMOVRZ	dis not found

	.word 0xb1a80820  ! 3101: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbfa5c960  ! 3104: FMULq	dis not found

	.word 0xb7a9c820  ! 3105: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbba00560  ! 3107: FSQRTq	fsqrt	
	.word 0xbbaa8820  ! 3108: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_243:
	setx	0x340025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 3110: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 13)
	.word 0xbfaa0820  ! 3117: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00540  ! 3119: FSQRTd	fsqrt	
cpu_intr_1_244:
	setx	0x370232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_245:
	setx	0x37012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_246:
	setx	0x37012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a44920  ! 3133: FMULs	fmuls	%f17, %f0, %f28
	.word 0xb41ce1e6  ! 3134: XOR_I	xor 	%r19, 0x01e6, %r26
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_142:
	mov	0x2a, %r14
	.word 0xf8db8400  ! 3140: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_247:
	setx	0x360111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_143:
	mov	0x26, %r14
	.word 0xf2db84a0  ! 3142: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbda81820  ! 3144: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_wr_148:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 3150: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_248:
	setx	0x370126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 3153: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_249:
	setx	0x37000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588c0  ! 3155: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xbdaa8820  ! 3157: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_144:
	mov	0x14, %r14
	.word 0xf2db8400  ! 3164: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbbab0820  ! 3165: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_250:
	setx	0x360017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_251:
	setx	0x370119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409a0  ! 3169: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb7a9c820  ! 3170: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_252:
	setx	0x340319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3a00540  ! 3173: FSQRTd	fsqrt	
cpu_intr_1_253:
	setx	0x340105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_254:
	setx	0x360110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_255:
	setx	0x340001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, c)
	.word 0xbdaac820  ! 3180: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa81c20  ! 3182: FMOVRGEZ	dis not found

	.word 0xb9a509e0  ! 3187: FDIVq	dis not found

cpu_intr_1_256:
	setx	0x360222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_145:
	mov	0x26, %r14
	.word 0xfcdb89e0  ! 3192: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_146:
	mov	0x1c, %r14
	.word 0xf4db89e0  ! 3197: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5a5c9a0  ! 3199: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xbfa4c940  ! 3200: FMULd	fmuld	%f50, %f0, %f62
	.word 0xbba5c8e0  ! 3201: FSUBq	dis not found

iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_257:
	setx	0x37001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_149:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 3206: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_150:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 3207: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_151:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 3211: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3a8c820  ! 3212: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbda81420  ! 3213: FMOVRNZ	dis not found

	.word 0xb1a50840  ! 3217: FADDd	faddd	%f20, %f0, %f24
	.word 0xbfa50960  ! 3218: FMULq	dis not found

	.word 0xb9a88820  ! 3219: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbba50940  ! 3220: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb1ab8820  ! 3222: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_147:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 3224: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb7a4c920  ! 3232: FMULs	fmuls	%f19, %f0, %f27
T1_asi_reg_rd_148:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa40840  ! 3238: FADDd	faddd	%f16, %f0, %f62
	.word 0xb3a00020  ! 3240: FMOVs	fmovs	%f0, %f25
	.word 0xbfab0820  ! 3242: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_258:
	setx	0x3b0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 3247: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_149:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9a81420  ! 3252: FMOVRNZ	dis not found

T1_asi_reg_wr_152:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 3254: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbab0820  ! 3255: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_259:
	setx	0x3a032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4344000  ! 3257: ORN_R	orn 	%r17, %r0, %r26
	.word 0xbfa00520  ! 3262: FSQRTs	fsqrt	
cpu_intr_1_260:
	setx	0x3b0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 3268: FSQRTq	fsqrt	
	.word 0xb5ab4820  ! 3269: FMOVCC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_261:
	setx	0x3a0100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x390218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 3277: FSQRTd	fsqrt	
cpu_intr_1_263:
	setx	0x3b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 3279: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00520  ! 3281: FSQRTs	fsqrt	
cpu_intr_1_264:
	setx	0x390236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 3283: FSQRTs	fsqrt	
	.word 0xb9aa0820  ! 3286: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80c20  ! 3290: FMOVRLZ	dis not found

	.word 0xbfa00560  ! 3293: FSQRTq	fsqrt	
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_150:
	mov	0x32, %r14
	.word 0xfadb8e80  ! 3297: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_151:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, b)
	.word 0xb92ce001  ! 3303: SLL_I	sll 	%r19, 0x0001, %r28
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a508c0  ! 3305: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xbda98820  ! 3307: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda9c820  ! 3311: FMOVVS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_265:
	setx	0x3a0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 3318: FMOVRGEZ	dis not found

T1_asi_reg_rd_152:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3319: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_266:
	setx	0x3b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 3323: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb0354000  ! 3325: SUBC_R	orn 	%r21, %r0, %r24
cpu_intr_1_267:
	setx	0x3b0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 3331: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a4c8a0  ! 3332: FSUBs	fsubs	%f19, %f0, %f27
cpu_intr_1_268:
	setx	0x3a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_153:
	mov	0x8, %r14
	.word 0xf8db84a0  ! 3337: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_154:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 3343: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a90820  ! 3345: FMOVLEU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00020  ! 3350: FMOVs	fmovs	%f0, %f24
cpu_intr_1_269:
	setx	0x390111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58820  ! 3355: FADDs	fadds	%f22, %f0, %f30
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_270:
	setx	0x3a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 3360: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbba549a0  ! 3361: FDIVs	fdivs	%f21, %f0, %f29
T1_asi_reg_rd_155:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_156:
	mov	0x26, %r14
	.word 0xf0db8400  ! 3364: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_153:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 3368: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9a94820  ! 3370: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_154:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 3375: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb72c7001  ! 3376: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xb8446197  ! 3377: ADDC_I	addc 	%r17, 0x0197, %r28
T1_asi_reg_rd_157:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 3379: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5a80420  ! 3388: FMOVRZ	dis not found

	.word 0xbba00520  ! 3390: FSQRTs	fsqrt	
cpu_intr_1_271:
	setx	0x390209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_272:
	setx	0x38010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a5c860  ! 3398: FADDq	dis not found

iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbbaa8820  ! 3400: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_158:
	mov	0x31, %r14
	.word 0xf0db8400  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_155:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 3403: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_156:
	mov	0xe, %r14
	.word 0xf2f389e0  ! 3405: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_273:
	setx	0x3b0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_274:
	setx	0x380231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 3417: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
cpu_intr_1_275:
	setx	0x3a0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 3421: RDPR_PIL	<illegal instruction>
	.word 0xbda00020  ! 3422: FMOVs	fmovs	%f0, %f30
	.word 0xb60c2134  ! 3423: AND_I	and 	%r16, 0x0134, %r27
	.word 0xb5a58860  ! 3426: FADDq	dis not found

	.word 0xb9a80c20  ! 3427: FMOVRLZ	dis not found

cpu_intr_1_276:
	setx	0x380316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_277:
	setx	0x380317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_159:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5a50860  ! 3439: FADDq	dis not found

	.word 0xb1a90820  ! 3440: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb4342107  ! 3443: SUBC_I	orn 	%r16, 0x0107, %r26
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5a5c8a0  ! 3445: FSUBs	fsubs	%f23, %f0, %f26
cpu_intr_1_278:
	setx	0x3b032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54960  ! 3450: FMULq	dis not found

cpu_intr_1_279:
	setx	0x390226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb1a40840  ! 3456: FADDd	faddd	%f16, %f0, %f24
	.word 0xb72d9000  ! 3462: SLLX_R	sllx	%r22, %r0, %r27
	.word 0xbba50840  ! 3463: FADDd	faddd	%f20, %f0, %f60
	.word 0xbba81820  ! 3464: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb1ab8820  ! 3466: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a80820  ! 3467: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_280:
	setx	0x3a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_281:
	setx	0x390016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_160:
	mov	0x1a, %r14
	.word 0xf6db8e60  ! 3475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_157:
	mov	0x9, %r14
	.word 0xf6f389e0  ! 3479: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5ab4820  ! 3481: FMOVCC	fmovs	%fcc1, %f0, %f26
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a489c0  ! 3488: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb7a448a0  ! 3491: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xbba4c820  ! 3492: FADDs	fadds	%f19, %f0, %f29
T1_asi_reg_rd_161:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbe8ce126  ! 3496: ANDcc_I	andcc 	%r19, 0x0126, %r31
cpu_intr_1_282:
	setx	0x3b0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 3499: FMOVd	fmovd	%f0, %f26
	.word 0xbda00020  ! 3500: FMOVs	fmovs	%f0, %f30
cpu_intr_1_283:
	setx	0x39012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_162:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbba90820  ! 3503: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_284:
	setx	0x3b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_163:
	mov	0x1d, %r14
	.word 0xfadb8400  ! 3510: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_164:
	mov	0x1b, %r14
	.word 0xfadb84a0  ! 3511: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_285:
	setx	0x39030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_165:
	mov	0xe, %r14
	.word 0xf2db8400  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb5a9c820  ! 3521: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_158:
	mov	0x15, %r14
	.word 0xfcf38e60  ! 3522: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7357001  ! 3525: SRLX_I	srlx	%r21, 0x0001, %r27
	.word 0xb5aa0820  ! 3528: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbfa58820  ! 3530: FADDs	fadds	%f22, %f0, %f31
	.word 0xba0ce135  ! 3533: AND_I	and 	%r19, 0x0135, %r29
T1_asi_reg_rd_166:
	mov	0x31, %r14
	.word 0xf2db8e80  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb5a80420  ! 3537: FMOVRZ	dis not found

T1_asi_reg_wr_159:
	mov	0x2f, %r14
	.word 0xf0f38400  ! 3539: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfaac820  ! 3543: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a00040  ! 3545: FMOVd	fmovd	%f0, %f58
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_286:
	setx	0x3b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_160:
	mov	0x15, %r14
	.word 0xf8f384a0  ! 3551: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_167:
	mov	0x10, %r14
	.word 0xfedb8e60  ! 3554: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda50960  ! 3555: FMULq	dis not found

T1_asi_reg_wr_161:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 3556: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_168:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 3562: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbba5c940  ! 3563: FMULd	fmuld	%f54, %f0, %f60
	.word 0xbfaac820  ! 3564: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a4c8c0  ! 3569: FSUBd	fsubd	%f50, %f0, %f28
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_287:
	setx	0x3b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a56171  ! 3573: SUBcc_I	subcc 	%r21, 0x0171, %r26
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a88820  ! 3576: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 1)
	.word 0xbfa54940  ! 3584: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb5a00540  ! 3585: FSQRTd	fsqrt	
	.word 0xbda589a0  ! 3586: FDIVs	fdivs	%f22, %f0, %f30
T1_asi_reg_wr_162:
	mov	0x18, %r14
	.word 0xfaf389e0  ! 3588: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_288:
	setx	0x390111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_289:
	setx	0x3a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_290:
	setx	0x39032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 3596: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a5c860  ! 3603: FADDq	dis not found

T1_asi_reg_wr_163:
	mov	0x31, %r14
	.word 0xf8f38400  ! 3604: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5aa0820  ! 3610: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbf352001  ! 3614: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xb7a00560  ! 3617: FSQRTq	fsqrt	
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, b)
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7a5c9e0  ! 3623: FDIVq	dis not found

	.word 0xbba80820  ! 3628: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00560  ! 3629: FSQRTq	fsqrt	
cpu_intr_1_291:
	setx	0x390005, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_164:
	mov	0xa, %r14
	.word 0xfcf38e80  ! 3633: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb5a448e0  ! 3634: FSUBq	dis not found

iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, b)
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3a00520  ! 3642: FSQRTs	fsqrt	
	.word 0xbe2dc000  ! 3643: ANDN_R	andn 	%r23, %r0, %r31
cpu_intr_1_292:
	setx	0x380211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03cc000  ! 3648: XNOR_R	xnor 	%r19, %r0, %r24
T1_asi_reg_rd_169:
	mov	0x26, %r14
	.word 0xf6db8400  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_165:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 3650: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 32)
	.word 0xb1abc820  ! 3653: FMOVVC	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a94820  ! 3658: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb3ab4820  ! 3659: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbda508e0  ! 3660: FSUBq	dis not found

iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a81820  ! 3662: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_293:
	setx	0x3b0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 3665: FSQRTq	fsqrt	
	.word 0xb5518000  ! 3666: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_294:
	setx	0x3b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54860  ! 3668: FADDq	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb7ab8820  ! 3678: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_170:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7a40820  ! 3682: FADDs	fadds	%f16, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_171:
	mov	0x2e, %r14
	.word 0xf4db8400  ! 3686: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_295:
	setx	0x3b003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80c20  ! 3690: FMOVRLZ	dis not found

	.word 0xb5a00520  ! 3691: FSQRTs	fsqrt	
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_166:
	mov	0x1f, %r14
	.word 0xfcf384a0  ! 3693: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb1ab8820  ! 3694: FMOVPOS	fmovs	%fcc1, %f0, %f24
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_167:
	mov	0x1c, %r14
	.word 0xf2f389e0  ! 3702: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbda00540  ! 3703: FSQRTd	fsqrt	
	.word 0xbd3db001  ! 3704: SRAX_I	srax	%r22, 0x0001, %r30
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_296:
	setx	0x3d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_297:
	setx	0x3f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_168:
	mov	0x17, %r14
	.word 0xf6f384a0  ! 3714: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_172:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbda4c820  ! 3716: FADDs	fadds	%f19, %f0, %f30
cpu_intr_1_298:
	setx	0x3f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_169:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3723: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1aa4820  ! 3726: FMOVNE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_299:
	setx	0x3f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 3728: FMOVVC	fmovs	%fcc1, %f0, %f27
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_173:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_174:
	mov	0x2a, %r14
	.word 0xf0db8e80  ! 3731: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbda5c960  ! 3733: FMULq	dis not found

	.word 0xb1a80820  ! 3734: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbba8c820  ! 3738: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbe254000  ! 3739: SUB_R	sub 	%r21, %r0, %r31
T1_asi_reg_rd_175:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 3740: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0x8395a11d  ! 3741: WRPR_TNPC_I	wrpr	%r22, 0x011d, %tnpc
	.word 0xb7a9c820  ! 3742: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_300:
	setx	0x3c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54840  ! 3749: FADDd	faddd	%f52, %f0, %f26
T1_asi_reg_rd_176:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_177:
	mov	0x1c, %r14
	.word 0xf2db89e0  ! 3754: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_178:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda00520  ! 3758: FSQRTs	fsqrt	
	.word 0xb12cd000  ! 3759: SLLX_R	sllx	%r19, %r0, %r24
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_301:
	setx	0x3c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 3764: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb5a44840  ! 3767: FADDd	faddd	%f48, %f0, %f26
	.word 0xbc9c2179  ! 3768: XORcc_I	xorcc 	%r16, 0x0179, %r30
T1_asi_reg_wr_170:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 3770: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbca4c000  ! 3771: SUBcc_R	subcc 	%r19, %r0, %r30
T1_asi_reg_rd_179:
	mov	0x2d, %r14
	.word 0xf0db89e0  ! 3772: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_302:
	setx	0x3c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 3781: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_171:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 3789: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_303:
	setx	0x3c000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c840  ! 3793: FADDd	faddd	%f54, %f0, %f62
	.word 0xb3643801  ! 3795: MOVcc_I	<illegal instruction>
	.word 0xb9ab4820  ! 3801: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_304:
	setx	0x3d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 3809: FMOVRNZ	dis not found

T1_asi_reg_rd_180:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_305:
	setx	0x3f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_306:
	setx	0x3c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c8a0  ! 3815: FSUBs	fsubs	%f23, %f0, %f27
T1_asi_reg_rd_181:
	mov	0x1c, %r14
	.word 0xf8db89e0  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_rd_182:
	mov	0x30, %r14
	.word 0xfadb84a0  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb9aac820  ! 3821: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_183:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 3824: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1a98820  ! 3825: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb244e07f  ! 3827: ADDC_I	addc 	%r19, 0x007f, %r25
cpu_intr_1_307:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7ab0820  ! 3832: FMOVGU	fmovs	%fcc1, %f0, %f27
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 37)
	.word 0xba848000  ! 3838: ADDcc_R	addcc 	%r18, %r0, %r29
cpu_intr_1_308:
	setx	0x3e0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_309:
	setx	0x3e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 27)
	.word 0xbfa00560  ! 3845: FSQRTq	fsqrt	
	.word 0xb9a44860  ! 3847: FADDq	dis not found

	.word 0xb7a40960  ! 3848: FMULq	dis not found

cpu_intr_1_310:
	setx	0x3f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408e0  ! 3850: FSUBq	dis not found

T1_asi_reg_rd_184:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_rd_185:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 3857: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a548a0  ! 3859: FSUBs	fsubs	%f21, %f0, %f26
T1_asi_reg_rd_186:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 3862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_187:
	mov	0x29, %r14
	.word 0xf0db89e0  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, b)
	.word 0xbbaac820  ! 3867: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_188:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 3868: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa449a0  ! 3872: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xb4bc8000  ! 3873: XNORcc_R	xnorcc 	%r18, %r0, %r26
T1_asi_reg_rd_189:
	mov	0x14, %r14
	.word 0xf2db84a0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7a81c20  ! 3882: FMOVRGEZ	dis not found

	.word 0xbb643801  ! 3888: MOVcc_I	<illegal instruction>
	.word 0xb9a80c20  ! 3892: FMOVRLZ	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbfa589e0  ! 3894: FDIVq	dis not found

	.word 0xbbabc820  ! 3895: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_172:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 3896: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_311:
	setx	0x3f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_312:
	setx	0x3c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_190:
	mov	0x37, %r14
	.word 0xf2db8400  ! 3902: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_313:
	setx	0x3f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_314:
	setx	0x3d0306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_173:
	mov	0x3, %r14
	.word 0xfef38e60  ! 3913: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_315:
	setx	0x3f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_316:
	setx	0x3d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_317:
	setx	0x3f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_191:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb20d2166  ! 3929: AND_I	and 	%r20, 0x0166, %r25
	.word 0xb5a48840  ! 3930: FADDd	faddd	%f18, %f0, %f26
T1_asi_reg_wr_174:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 3931: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1aa4820  ! 3932: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_318:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_192:
	mov	0x0, %r14
	.word 0xfadb8e60  ! 3937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_175:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 3939: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbda449c0  ! 3944: FDIVd	fdivd	%f48, %f0, %f30
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda58820  ! 3950: FADDs	fadds	%f22, %f0, %f30
	.word 0xb1a80420  ! 3956: FMOVRZ	dis not found

T1_asi_reg_rd_193:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_176:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 3959: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_319:
	setx	0x3f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_177:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 3963: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a4c8a0  ! 3969: FSUBs	fsubs	%f19, %f0, %f25
T1_asi_reg_rd_194:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1a00540  ! 3972: FSQRTd	fsqrt	
	.word 0x8d9560f5  ! 3974: WRPR_PSTATE_I	wrpr	%r21, 0x00f5, %pstate
cpu_intr_1_320:
	setx	0x3c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 3977: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_321:
	setx	0x3f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa0820  ! 3981: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_195:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 3982: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe3ca085  ! 3985: XNOR_I	xnor 	%r18, 0x0085, %r31
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a00040  ! 3994: FMOVd	fmovd	%f0, %f58
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbc1c8000  ! 3997: XOR_R	xor 	%r18, %r0, %r30
T1_asi_reg_rd_196:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb20ca05d  ! 4000: AND_I	and 	%r18, 0x005d, %r25
	.word 0xbaad4000  ! 4001: ANDNcc_R	andncc 	%r21, %r0, %r29
	.word 0xb21ca126  ! 4002: XOR_I	xor 	%r18, 0x0126, %r25
	.word 0xbf346001  ! 4005: SRL_I	srl 	%r17, 0x0001, %r31
	.word 0xb5a80820  ! 4007: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_197:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_178:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 4015: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb92d4000  ! 4016: SLL_R	sll 	%r21, %r0, %r28
T1_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3a588a0  ! 4018: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb7a84820  ! 4020: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_199:
	mov	0x1e, %r14
	.word 0xfadb8e80  ! 4021: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_200:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbda44860  ! 4027: FADDq	dis not found

iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_322:
	setx	0x3f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 4031: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_201:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_179:
	mov	0x19, %r14
	.word 0xfef38e60  ! 4035: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbda00540  ! 4039: FSQRTd	fsqrt	
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a8c820  ! 4045: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb9a81c20  ! 4048: FMOVRGEZ	dis not found

cpu_intr_1_323:
	setx	0x3f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548c0  ! 4061: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb3a00520  ! 4062: FSQRTs	fsqrt	
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
	.word 0xb3a54840  ! 4067: FADDd	faddd	%f52, %f0, %f56
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_202:
	mov	0x17, %r14
	.word 0xf8db8e60  ! 4073: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_180:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 4075: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3a40960  ! 4077: FMULq	dis not found

iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a80820  ! 4082: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb5a5c9e0  ! 4084: FDIVq	dis not found

iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a4c940  ! 4089: FMULd	fmuld	%f50, %f0, %f24
cpu_intr_1_324:
	setx	0x3f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_181:
	mov	0xe, %r14
	.word 0xf6f38e60  ! 4093: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_wr_182:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 4095: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_203:
	mov	0xa, %r14
	.word 0xf8db8400  ! 4096: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_325:
	setx	0x3d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834a07c  ! 4098: SUBC_I	orn 	%r18, 0x007c, %r28
T1_asi_reg_wr_183:
	mov	0x2, %r14
	.word 0xf8f38e40  ! 4100: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, b)
	.word 0xbeb50000  ! 4105: ORNcc_R	orncc 	%r20, %r0, %r31
cpu_intr_1_326:
	setx	0x3d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_204:
	mov	0x1b, %r14
	.word 0xf2db8e60  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_327:
	setx	0x3c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_328:
	setx	0x3c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 4118: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_329:
	setx	0x43013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_185:
	mov	0x0, %r14
	.word 0xf4f38400  ! 4120: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb6c40000  ! 4123: ADDCcc_R	addccc 	%r16, %r0, %r27
	.word 0xbebd20bc  ! 4124: XNORcc_I	xnorcc 	%r20, 0x00bc, %r31
T1_asi_reg_rd_205:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 4126: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb8a44000  ! 4127: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xbda4c8a0  ! 4130: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb1a98820  ! 4131: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb3a80c20  ! 4133: FMOVRLZ	dis not found

	.word 0xb5ab8820  ! 4134: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_330:
	setx	0x410328, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_331:
	setx	0x430218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_206:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a00020  ! 4149: FMOVs	fmovs	%f0, %f26
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_207:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_208:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_332:
	setx	0x410221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_333:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_209:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 4160: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_334:
	setx	0x400316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 4174: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_wr_186:
	mov	0x27, %r14
	.word 0xfef38e40  ! 4178: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa509c0  ! 4183: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xb034c000  ! 4186: SUBC_R	orn 	%r19, %r0, %r24
	.word 0xbb2c9000  ! 4188: SLLX_R	sllx	%r18, %r0, %r29
T1_asi_reg_rd_210:
	mov	0x1d, %r14
	.word 0xf8db84a0  ! 4189: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 16)
	.word 0xbda00560  ! 4197: FSQRTq	fsqrt	
T1_asi_reg_rd_211:
	mov	0x15, %r14
	.word 0xfcdb8e60  ! 4198: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3a00560  ! 4203: FSQRTq	fsqrt	
	.word 0xb3ab0820  ! 4204: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb7a80820  ! 4205: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81820  ! 4206: FMOVRGZ	fmovs	%fcc3, %f0, %f24
T1_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 4208: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb0052154  ! 4211: ADD_I	add 	%r20, 0x0154, %r24
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_187:
	mov	0x0, %r14
	.word 0xf4f38400  ! 4213: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_213:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 4215: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_188:
	mov	0x27, %r14
	.word 0xf8f384a0  ! 4221: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 26)
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_189:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 4229: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1a80c20  ! 4234: FMOVRLZ	dis not found

T1_asi_reg_wr_190:
	mov	0xc, %r14
	.word 0xfef38400  ! 4239: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfa00020  ! 4240: FMOVs	fmovs	%f0, %f31
	.word 0xb3a81420  ! 4241: FMOVRNZ	dis not found

	.word 0xb9a48840  ! 4243: FADDd	faddd	%f18, %f0, %f28
	.word 0xbbab8820  ! 4244: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_214:
	mov	0x2c, %r14
	.word 0xfcdb8e80  ! 4251: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3a8c820  ! 4253: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb5ab0820  ! 4255: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00520  ! 4256: FSQRTs	fsqrt	
cpu_intr_1_335:
	setx	0x420334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 4260: FMOVRLZ	dis not found

cpu_intr_1_336:
	setx	0x430121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa509c0  ! 4263: FDIVd	fdivd	%f20, %f0, %f62
	.word 0xbdab8820  ! 4266: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a80820  ! 4267: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_337:
	setx	0x410121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48820  ! 4270: FADDs	fadds	%f18, %f0, %f28
cpu_intr_1_338:
	setx	0x410011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_191:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 4274: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a90820  ! 4279: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb1ab8820  ! 4283: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_192:
	mov	0x33, %r14
	.word 0xf4f384a0  ! 4289: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbba84820  ! 4292: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, e)
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 16)
	.word 0xb7a94820  ! 4298: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb8bc8000  ! 4299: XNORcc_R	xnorcc 	%r18, %r0, %r28
T1_asi_reg_wr_193:
	mov	0x0, %r14
	.word 0xf8f38400  ! 4301: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_215:
	mov	0x21, %r14
	.word 0xf2db89e0  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbba84820  ! 4305: FMOVE	fmovs	%fcc1, %f0, %f29
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_194:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 4309: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7a509c0  ! 4310: FDIVd	fdivd	%f20, %f0, %f58
cpu_intr_1_339:
	setx	0x420019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x400319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe444000  ! 4314: ADDC_R	addc 	%r17, %r0, %r31
cpu_intr_1_341:
	setx	0x410013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_216:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 4316: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbc34608d  ! 4317: ORN_I	orn 	%r17, 0x008d, %r30
	.word 0xb5480000  ! 4318: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa00040  ! 4326: FMOVd	fmovd	%f0, %f62
cpu_intr_1_342:
	setx	0x400327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a90820  ! 4335: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_343:
	setx	0x420015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 4342: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_195:
	mov	0x2b, %r14
	.word 0xf0f389e0  ! 4345: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_344:
	setx	0x41000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_217:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 4351: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb9a409c0  ! 4352: FDIVd	fdivd	%f16, %f0, %f28
T1_asi_reg_wr_196:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 4353: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5a00540  ! 4354: FSQRTd	fsqrt	
T1_asi_reg_rd_218:
	mov	0x20, %r14
	.word 0xf2db8e80  ! 4356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb08c8000  ! 4359: ANDcc_R	andcc 	%r18, %r0, %r24
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb3a509c0  ! 4364: FDIVd	fdivd	%f20, %f0, %f56
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a80420  ! 4370: FMOVRZ	dis not found

iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, c)
	.word 0xb3a48940  ! 4375: FMULd	fmuld	%f18, %f0, %f56
T1_asi_reg_wr_197:
	mov	0x36, %r14
	.word 0xfef38e40  ! 4376: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3abc820  ! 4378: FMOVVC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_219:
	mov	0x30, %r14
	.word 0xf0db8400  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_220:
	mov	0x36, %r14
	.word 0xfcdb8400  ! 4380: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_221:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_345:
	setx	0x410203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x43013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d0000  ! 4387: XORcc_R	xorcc 	%r20, %r0, %r31
T1_asi_reg_rd_222:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_223:
	mov	0x2e, %r14
	.word 0xf0db8400  ! 4391: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9a409c0  ! 4393: FDIVd	fdivd	%f16, %f0, %f28
cpu_intr_1_347:
	setx	0x400116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_348:
	setx	0x430020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_198:
	mov	0x8, %r14
	.word 0xfaf38e80  ! 4396: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_349:
	setx	0x420314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x410228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_351:
	setx	0x43001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_352:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe340000  ! 4407: ORN_R	orn 	%r16, %r0, %r31
	.word 0xba1da0c4  ! 4408: XOR_I	xor 	%r22, 0x00c4, %r29
	.word 0xb9a44820  ! 4411: FADDs	fadds	%f17, %f0, %f28
cpu_intr_1_353:
	setx	0x410237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_354:
	setx	0x420025, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_199:
	mov	0x29, %r14
	.word 0xf0f38e60  ! 4416: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_200:
	mov	0x1a, %r14
	.word 0xf6f389e0  ! 4418: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_224:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 4419: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a80820  ! 4422: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb29d4000  ! 4423: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xb1a00520  ! 4424: FSQRTs	fsqrt	
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a4c840  ! 4428: FADDd	faddd	%f50, %f0, %f26
	.word 0xb7a8c820  ! 4429: FMOVL	fmovs	%fcc1, %f0, %f27
cpu_intr_1_355:
	setx	0x42021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 4432: FMOVE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_356:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 4434: FMOVNE	fmovs	%fcc1, %f0, %f29
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb3a81420  ! 4438: FMOVRNZ	dis not found

cpu_intr_1_357:
	setx	0x43001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba85e1bd  ! 4443: ADDcc_I	addcc 	%r23, 0x01bd, %r29
	.word 0xb3a58940  ! 4444: FMULd	fmuld	%f22, %f0, %f56
cpu_intr_1_358:
	setx	0x410315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_359:
	setx	0x430132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_225:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 4453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_201:
	mov	0x12, %r14
	.word 0xfef38e40  ! 4454: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_360:
	setx	0x42033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4457: FMOVd	fmovd	%f0, %f24
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_226:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 4460: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9aac820  ! 4464: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_202:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4467: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb00ca1c7  ! 4468: AND_I	and 	%r18, 0x01c7, %r24
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba40920  ! 4474: FMULs	fmuls	%f16, %f0, %f29
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7ab4820  ! 4476: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_361:
	setx	0x430126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 4481: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a58840  ! 4484: FADDd	faddd	%f22, %f0, %f28
T1_asi_reg_rd_227:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9a54940  ! 4488: FMULd	fmuld	%f52, %f0, %f28
	.word 0xb9a589e0  ! 4490: FDIVq	dis not found

	.word 0xba85c000  ! 4491: ADDcc_R	addcc 	%r23, %r0, %r29
cpu_intr_1_362:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d8000  ! 4496: SLL_R	sll 	%r22, %r0, %r31
cpu_intr_1_363:
	setx	0x400123, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_228:
	mov	0xe, %r14
	.word 0xf2db89e0  ! 4500: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1a588c0  ! 4501: FSUBd	fsubd	%f22, %f0, %f24
	.word 0xb5a00540  ! 4502: FSQRTd	fsqrt	
	.word 0xb3a00040  ! 4503: FMOVd	fmovd	%f0, %f56
T1_asi_reg_rd_229:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb88da027  ! 4505: ANDcc_I	andcc 	%r22, 0x0027, %r28
	.word 0xb3a48960  ! 4507: FMULq	dis not found

cpu_intr_1_364:
	setx	0x430329, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_203:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 4510: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5a00520  ! 4511: FSQRTs	fsqrt	
	.word 0xb93c9000  ! 4512: SRAX_R	srax	%r18, %r0, %r28
	.word 0xbfa80420  ! 4513: FMOVRZ	dis not found

T1_asi_reg_rd_230:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3a00040  ! 4516: FMOVd	fmovd	%f0, %f56
	.word 0xb7a4c940  ! 4519: FMULd	fmuld	%f50, %f0, %f58
T1_asi_reg_wr_204:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 4523: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_365:
	setx	0x43023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50820  ! 4529: FADDs	fadds	%f20, %f0, %f24
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_366:
	setx	0x430221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a508e0  ! 4535: FSUBq	dis not found

	.word 0xb9aac820  ! 4537: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_231:
	mov	0x25, %r14
	.word 0xf0db8e40  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 3)
	.word 0xbda98820  ! 4541: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3a80420  ! 4543: FMOVRZ	dis not found

	.word 0xb3a489a0  ! 4544: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb1a549a0  ! 4548: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xb9aa4820  ! 4549: FMOVNE	fmovs	%fcc1, %f0, %f28
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb9a9c820  ! 4552: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbda81420  ! 4557: FMOVRNZ	dis not found

cpu_intr_1_367:
	setx	0x42033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_368:
	setx	0x400137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 4563: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbfab0820  ! 4568: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_369:
	setx	0x420212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 4572: FMOVRZ	dis not found

iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_205:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 4580: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 27)
	.word 0xbf3d6001  ! 4582: SRA_I	sra 	%r21, 0x0001, %r31
T1_asi_reg_wr_206:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 4583: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_wr_207:
	mov	0x26, %r14
	.word 0xfaf38e40  ! 4584: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_370:
	setx	0x450203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 4588: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_208:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 4592: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbda8c820  ! 4593: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_209:
	mov	0x13, %r14
	.word 0xf2f38400  ! 4597: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_rd_232:
	mov	0x26, %r14
	.word 0xfadb8e40  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_371:
	setx	0x45010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 4602: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbda81420  ! 4603: FMOVRNZ	dis not found

iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 3)
	.word 0xbdaa0820  ! 4605: FMOVA	fmovs	%fcc1, %f0, %f30
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a00040  ! 4609: FMOVd	fmovd	%f0, %f58
cpu_intr_1_372:
	setx	0x44002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab8820  ! 4613: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7a489a0  ! 4617: FDIVs	fdivs	%f18, %f0, %f27
T1_asi_reg_rd_233:
	mov	0x2e, %r14
	.word 0xf0db8e60  ! 4618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_373:
	setx	0x470000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58960  ! 4620: FMULq	dis not found

iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 26)
	.word 0xbbabc820  ! 4623: FMOVVC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_374:
	setx	0x46033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 4626: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb40c2064  ! 4628: AND_I	and 	%r16, 0x0064, %r26
	.word 0xbda00020  ! 4630: FMOVs	fmovs	%f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_210:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 4632: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa589a0  ! 4633: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xb3a449e0  ! 4634: FDIVq	dis not found

	.word 0xb1a44840  ! 4635: FADDd	faddd	%f48, %f0, %f24
cpu_intr_1_375:
	setx	0x450007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 4640: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_234:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_wr_211:
	mov	0x12, %r14
	.word 0xf2f38400  ! 4645: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbda409e0  ! 4647: FDIVq	dis not found

T1_asi_reg_wr_212:
	mov	0x2b, %r14
	.word 0xf4f38e60  ! 4648: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 17)
	.word 0xbeb54000  ! 4652: ORNcc_R	orncc 	%r21, %r0, %r31
	.word 0xb5a588a0  ! 4653: FSUBs	fsubs	%f22, %f0, %f26
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 38)
	.word 0xb83cc000  ! 4656: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xbbabc820  ! 4659: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00040  ! 4660: FMOVd	fmovd	%f0, %f26
	.word 0xb73c3001  ! 4662: SRAX_I	srax	%r16, 0x0001, %r27
cpu_intr_1_376:
	setx	0x44033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_377:
	setx	0x460000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97c8400  ! 4667: MOVR_R	movre	%r18, %r0, %r28
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a409e0  ! 4671: FDIVq	dis not found

	.word 0xb7a40840  ! 4673: FADDd	faddd	%f16, %f0, %f58
T1_asi_reg_wr_213:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 4674: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7ab0820  ! 4675: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbda4c920  ! 4676: FMULs	fmuls	%f19, %f0, %f30
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 39)
	.word 0xbd3c4000  ! 4679: SRA_R	sra 	%r17, %r0, %r30
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_235:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 4682: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7a90820  ! 4683: FMOVLEU	fmovs	%fcc1, %f0, %f27
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a88820  ! 4688: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb1aac820  ! 4695: FMOVGE	fmovs	%fcc1, %f0, %f24
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda88820  ! 4698: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_214:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 4699: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 31)
	.word 0xbcb5a124  ! 4704: SUBCcc_I	orncc 	%r22, 0x0124, %r30
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda00040  ! 4708: FMOVd	fmovd	%f0, %f30
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 17)
	.word 0xb534e001  ! 4710: SRL_I	srl 	%r19, 0x0001, %r26
T1_asi_reg_rd_236:
	mov	0x27, %r14
	.word 0xf4db89e0  ! 4716: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_378:
	setx	0x470018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 1c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a588c0  ! 4722: FSUBd	fsubd	%f22, %f0, %f26
T1_asi_reg_rd_237:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 4725: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_379:
	setx	0x450129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48820  ! 4727: FADDs	fadds	%f18, %f0, %f27
T1_asi_reg_wr_215:
	mov	0x10, %r14
	.word 0xfef38e60  ! 4736: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb1a5c820  ! 4737: FADDs	fadds	%f23, %f0, %f24
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_216:
	mov	0x3c6, %r14
	.word 0xf6f38e60  ! 4742: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_wr_217:
	mov	0x29, %r14
	.word 0xf0f384a0  ! 4745: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb7a84820  ! 4746: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa50960  ! 4747: FMULq	dis not found

T1_asi_reg_rd_238:
	mov	0x12, %r14
	.word 0xfadb8e60  ! 4748: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5a48860  ! 4749: FADDq	dis not found

iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_380:
	setx	0x46033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_239:
	mov	0x29, %r14
	.word 0xfedb8e60  ! 4764: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3a5c920  ! 4765: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb7a00540  ! 4766: FSQRTd	fsqrt	
T1_asi_reg_wr_218:
	mov	0x34, %r14
	.word 0xf4f38e80  ! 4767: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_381:
	setx	0x46022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_382:
	setx	0x450321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 4773: FMOVs	fmovs	%f0, %f29
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb9a00560  ! 4777: FSQRTq	fsqrt	
	.word 0xb1a98820  ! 4778: FMOVNEG	fmovs	%fcc1, %f0, %f24
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbfa409e0  ! 4786: FDIVq	dis not found

	.word 0xb7a00560  ! 4789: FSQRTq	fsqrt	
T1_asi_reg_rd_240:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 4792: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbba44940  ! 4793: FMULd	fmuld	%f48, %f0, %f60
	.word 0xb5a80820  ! 4796: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbba80c20  ! 4797: FMOVRLZ	dis not found

	.word 0xbba489a0  ! 4799: FDIVs	fdivs	%f18, %f0, %f29
	.word 0xb7a4c820  ! 4800: FADDs	fadds	%f19, %f0, %f27
T1_asi_reg_wr_219:
	mov	0x32, %r14
	.word 0xf8f389e0  ! 4802: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_383:
	setx	0x460220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 4809: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_384:
	setx	0x450337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c860  ! 4811: FADDq	dis not found

	.word 0xbba00560  ! 4814: FSQRTq	fsqrt	
	.word 0xbda409e0  ! 4819: FDIVq	dis not found

cpu_intr_1_385:
	setx	0x44012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a489a0  ! 4822: FDIVs	fdivs	%f18, %f0, %f25
	.word 0xb7abc820  ! 4824: FMOVVC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_241:
	mov	0x0, %r14
	.word 0xfadb84a0  ! 4825: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb4acc000  ! 4826: ANDNcc_R	andncc 	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_242:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 4828: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_386:
	setx	0x45012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_220:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 4833: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a4c9e0  ! 4835: FDIVq	dis not found

	.word 0xb1a00020  ! 4836: FMOVs	fmovs	%f0, %f24
	.word 0xb7aac820  ! 4837: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_387:
	setx	0x45020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 4839: FSQRTs	fsqrt	
	.word 0xb5355000  ! 4842: SRLX_R	srlx	%r21, %r0, %r26
T1_asi_reg_wr_221:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 4846: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb3a4c960  ! 4855: FMULq	dis not found

cpu_intr_1_388:
	setx	0x460202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 4859: FSQRTs	fsqrt	
	.word 0xbba80c20  ! 4862: FMOVRLZ	dis not found

cpu_intr_1_389:
	setx	0x46032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c840  ! 4865: FADDd	faddd	%f50, %f0, %f62
	.word 0xb9ab4820  ! 4867: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_243:
	mov	0x17, %r14
	.word 0xf6db89e0  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_390:
	setx	0x440312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1c8000  ! 4879: XOR_R	xor 	%r18, %r0, %r30
	.word 0xb5abc820  ! 4880: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, b)
	.word 0xb5348000  ! 4882: SRL_R	srl 	%r18, %r0, %r26
	.word 0xbda80420  ! 4884: FMOVRZ	dis not found

	.word 0xb7a9c820  ! 4885: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 29)
	.word 0xb63de1f3  ! 4889: XNOR_I	xnor 	%r23, 0x01f3, %r27
cpu_intr_1_391:
	setx	0x460222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d7001  ! 4891: SLLX_I	sllx	%r21, 0x0001, %r28
	.word 0xb1a58960  ! 4898: FMULq	dis not found

	.word 0xbba5c820  ! 4904: FADDs	fadds	%f23, %f0, %f29
T1_asi_reg_wr_222:
	mov	0x36, %r14
	.word 0xfaf38e40  ! 4905: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb4a40000  ! 4906: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xbd7c6401  ! 4907: MOVR_I	movre	%r17, 0x1, %r30
cpu_intr_1_392:
	setx	0x46011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_406:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_406), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_407:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_407), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda4c9e0  ! 4912: FDIVq	dis not found

T1_asi_reg_rd_244:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_223:
	mov	0x1d, %r14
	.word 0xf6f38e60  ! 4914: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbfaac820  ! 4915: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_393:
	setx	0x45011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_394:
	setx	0x450019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68ca063  ! 4922: ANDcc_I	andcc 	%r18, 0x0063, %r27
	.word 0xb3a81820  ! 4924: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_395:
	setx	0x450222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_408:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_408), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_396:
	setx	0x460110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_409:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_409), 16, 16)) -> intp(1, 0, 3f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_245:
	mov	0x25, %r14
	.word 0xfadb8e40  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3641800  ! 4938: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_246:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 4941: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbab4820  ! 4943: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_410:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_410), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7a80820  ! 4950: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbbaa4820  ! 4951: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a448a0  ! 4953: FSUBs	fsubs	%f17, %f0, %f24
cpu_intr_1_397:
	setx	0x460003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 4958: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb805c000  ! 4959: ADD_R	add 	%r23, %r0, %r28
cpu_intr_1_398:
	setx	0x440135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 4961: RDPR_PIL	<illegal instruction>
	.word 0xb6ad21e2  ! 4963: ANDNcc_I	andncc 	%r20, 0x01e2, %r27
	.word 0xb7a80c20  ! 4968: FMOVRLZ	dis not found

T1_asi_reg_rd_247:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 4971: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_224:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4972: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9a84820  ! 4974: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a58960  ! 4975: FMULq	dis not found

	.word 0xb7a408a0  ! 4977: FSUBs	fsubs	%f16, %f0, %f27
T1_asi_reg_wr_225:
	mov	0x15, %r14
	.word 0xfcf38e80  ! 4978: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb8b4e108  ! 4979: SUBCcc_I	orncc 	%r19, 0x0108, %r28
	.word 0xb13c5000  ! 4980: SRAX_R	srax	%r17, %r0, %r24
	.word 0xb3a58940  ! 4981: FMULd	fmuld	%f22, %f0, %f56
iob_intr_1_411:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_411), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_226:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 4988: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_412:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_412), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_227:
	mov	0x14, %r14
	.word 0xfef38e40  ! 4994: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb2a48000  ! 4995: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xb1a488c0  ! 4996: FSUBd	fsubd	%f18, %f0, %f24
cpu_intr_1_399:
	setx	0x460208, %g1, %o0
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

	.xword	0xeb35570215783cd7
	.xword	0x12fb2c0ad1c3188f
	.xword	0xc53e6dc4e31ffbb9
	.xword	0x250cde67721f58a6
	.xword	0xc8dc2412cab166b7
	.xword	0xc9e48febefb7116d
	.xword	0x7913990984675fe6
	.xword	0x20fe31268334a858
	.xword	0xddc43b4bc0ca5428
	.xword	0xabf0dca855bfd07d
	.xword	0x7952d7e6413a0869
	.xword	0xe562587418343d71
	.xword	0x12da2931844e1b1c
	.xword	0x573b1bc0eb1f0cf6
	.xword	0xd2395c05f350ba82
	.xword	0x34168b164777d39a
	.xword	0x4265f2087b562601
	.xword	0xae609b95547e49b8
	.xword	0x171f276fe42d884f
	.xword	0xbba8f2c02406395c
	.xword	0x2cb379eb13af47e9
	.xword	0xff79e94fe4eb1c07
	.xword	0xf5168272324beb3f
	.xword	0xcc388e1906a0c69e
	.xword	0xa91064c9d26242c4
	.xword	0x701a7a5d72fee069
	.xword	0x4d8d7f442918ad9d
	.xword	0x086b05566b1d7111
	.xword	0x80cda4c4d8929a3c
	.xword	0x3bb3d92861e7ce61
	.xword	0x002e0f50c1e29bc7
	.xword	0xa957860931dd7152
	.xword	0x779913fbc23e3780
	.xword	0xad81c1bbef51c43f
	.xword	0x7cf4f44579c46f70
	.xword	0xf4a4f1de6bd1ab15
	.xword	0x2a1dea135d2a4c98
	.xword	0x199e2a6dfa896f1d
	.xword	0x90ca8410d3698cc7
	.xword	0xd9fe04623eb55022
	.xword	0xa3a860b7f456fd4e
	.xword	0xe7b8ccc8b8149546
	.xword	0x6e8bf5c10fc955ff
	.xword	0x61ba702f133c9ba6
	.xword	0xf12243b781c3ef5b
	.xword	0x5bc680e95975a9f2
	.xword	0x9be01abc77f14945
	.xword	0xd92cdbbfab6e7044
	.xword	0x1f25318b475f897b
	.xword	0x964ca9c76ac72a95
	.xword	0x45eac45b5e1b1c5e
	.xword	0x5adbc0604c9ea68e
	.xword	0xfba23f632185070a
	.xword	0xac239f1fbe8b46d3
	.xword	0x88574ab906b0ec6f
	.xword	0x28a5afdc03f696ed
	.xword	0x9262d45465be44ef
	.xword	0x9894c49788579511
	.xword	0xbbdcaf61f0608dac
	.xword	0x47db76b2e151962c
	.xword	0xbd0dfa9c7acf3155
	.xword	0xa66ba9719d1409f4
	.xword	0x68b07d79d15a8b72
	.xword	0xd514b2d38732a311
	.xword	0x16da83d02b49b09d
	.xword	0x9a7bd0e8fd6288ad
	.xword	0xdcf3ba0ab3df72b2
	.xword	0x5f42442082ae05b9
	.xword	0x09a52aec3011244b
	.xword	0x859931200474fe7a
	.xword	0x6e520fc4e2a95a6b
	.xword	0x3fc6af2f67ee9e6c
	.xword	0x270417ec8f686e09
	.xword	0xdcc02cffbb98be18
	.xword	0x87e0b17c15881e19
	.xword	0x7de3fadbc58fb3bb
	.xword	0x8f2095714eeca52a
	.xword	0x1e6d3a0caa082313
	.xword	0x9676891424c209dd
	.xword	0x81d1bb1d7f575c5f
	.xword	0x98725364f952fc41
	.xword	0xacdd44245e5035f9
	.xword	0xae2b7a3da46c175f
	.xword	0xc6bb04cace91e59b
	.xword	0xf6c76aa65ad28bfa
	.xword	0xe31caeb4cfd578fd
	.xword	0x4337b47a7c1ab9d8
	.xword	0x007c71a1c6ce319b
	.xword	0x470ade16d84c8049
	.xword	0xc39dd03ef4c97cd2
	.xword	0x809aa1465269ea28
	.xword	0xd1c2cd55f17010b5
	.xword	0x80588548e58ffde1
	.xword	0x051645f32829a657
	.xword	0xf91ca7fc72776a7d
	.xword	0xac3e084aa6dab0ca
	.xword	0x93bbddc7657929b0
	.xword	0x08c639f153e67358
	.xword	0x0cc91a91b065c7a9
	.xword	0x7f82af1fc93d4791
	.xword	0xd481bdf7798ab83d
	.xword	0x51ab9af12ca0965a
	.xword	0x2493c765cfb51d0f
	.xword	0xfa1b79fb2e97c526
	.xword	0x6392fabb98c6d728
	.xword	0x07702ac14a81b35e
	.xword	0x82916348f026779d
	.xword	0x19770b4b42fbdfdd
	.xword	0xa1b936d3bee96454
	.xword	0x07c32c8b6633c3de
	.xword	0xa98bcc411ca08668
	.xword	0x395eef1128382d4d
	.xword	0x52132733ae619e3c
	.xword	0x1bdf1408291caa47
	.xword	0xf9446fe6076fa7c2
	.xword	0x28d4c8f3b2b2a655
	.xword	0xe2ce508d1bb5d51f
	.xword	0x4bf5ab655ba424a4
	.xword	0x1a69c87eb95d144c
	.xword	0xeafc387c5b3a1027
	.xword	0x1f4f137926313bf4
	.xword	0xa350644cb24c5663
	.xword	0x57a8209070e90ad3
	.xword	0xdf50f612972c590e
	.xword	0x5caff9430473f590
	.xword	0xd792cd68c9d3e983
	.xword	0x505b60e824e6160f
	.xword	0xffd12d145f93da53
	.xword	0x6d9f7d242b1f425f
	.xword	0x88a9afae7d8e6adf
	.xword	0x2b221cf6a88378c2
	.xword	0x252adc84114ee2c7
	.xword	0xf01d6401b4cc7ed1
	.xword	0xc00800cf4f93f5e6
	.xword	0x91a057d84d88cafe
	.xword	0x57a9603c7682d679
	.xword	0x8f57542cd9cd01de
	.xword	0x9d35eb40feccd3b5
	.xword	0x2497a07c971e30c4
	.xword	0x06082ff3a43288f9
	.xword	0xb5f38b695a4445ae
	.xword	0x95b46ed97072d460
	.xword	0x53d76637439edbae
	.xword	0xb71c1e1fdc272246
	.xword	0xd7536f1c9ed632c5
	.xword	0x26b2534e34012e58
	.xword	0xa246355a51755e8f
	.xword	0xe0b536a1821177dc
	.xword	0x8f4b76bade86ff39
	.xword	0x6b454572b96cb99b
	.xword	0xe6b25327aa88a80c
	.xword	0xb54084cd53de5174
	.xword	0xe04d9fd28220a24b
	.xword	0x4a1bbd12a6d995f1
	.xword	0x03ea471d8635e9cb
	.xword	0xe8f7c920c054389b
	.xword	0x8a20a1103482bc2d
	.xword	0x55bfffe082b95b62
	.xword	0xaa3c66411885d031
	.xword	0x68e37f03a00d0ffd
	.xword	0xe169328b17a868c0
	.xword	0xba9fcffd5b2f6087
	.xword	0x2bc871990af79306
	.xword	0x6b373df0b2b01606
	.xword	0x21e1fdff42bf415d
	.xword	0x1a40796ffe152912
	.xword	0x56b4203dcf311ed0
	.xword	0xcb6e7f429aed1f76
	.xword	0xe5c2adc616d15273
	.xword	0x562bebe70335a9cc
	.xword	0xd5fb2c6b4fd451b1
	.xword	0xf70a16a6dbad6b6a
	.xword	0xe6f9c7d1126cee5e
	.xword	0x864d3b4338626c23
	.xword	0x3b3f12a5a7ff36d9
	.xword	0x281a0b0a1188c755
	.xword	0x9798a7caa52c1dac
	.xword	0x56f19ab39b743eec
	.xword	0x2623559b8953a006
	.xword	0x58454d5d11105f75
	.xword	0x20b790c74f96b63e
	.xword	0x9be34fa732eb1b95
	.xword	0x61afbaa6d55fc0e0
	.xword	0x0414d38049549740
	.xword	0x6a95bad0f513f666
	.xword	0x410bc06933abad4d
	.xword	0x47b350be966d972e
	.xword	0x9bd5c39d5b3a2a14
	.xword	0xb76b490cb77fe30d
	.xword	0x13dede05cdf691fc
	.xword	0x93f84d7f7e6e2c3d
	.xword	0x1ef264ad9e1aeb25
	.xword	0x1d615dcac55c4fe1
	.xword	0x8e235a6ab983951a
	.xword	0xb649f58655f69b70
	.xword	0xb714edc34332532c
	.xword	0x10a047951564a25f
	.xword	0xca244c62980932f6
	.xword	0x04d6cde177678be2
	.xword	0x25035a58e145e8c9
	.xword	0xe1565622ff5d79eb
	.xword	0xe932fc65caf29b12
	.xword	0x8b2773c0b192a036
	.xword	0x1d93334426b92d0e
	.xword	0x84dd3cda2411de66
	.xword	0x036491ee4449855b
	.xword	0x044b8d1173147c68
	.xword	0x08857b6aba1e1973
	.xword	0x37c1fee63c2083c9
	.xword	0xcbde79e31072ac61
	.xword	0x8b5f40f8c722a155
	.xword	0x6e18567aeb3e4ace
	.xword	0x28a20a97405af896
	.xword	0xcc7ee79f2d75809f
	.xword	0x5375d4a28ee793f6
	.xword	0xf6ff91d546356cbd
	.xword	0x894322926abda958
	.xword	0xa3af04dabee5fce5
	.xword	0x1023dd396ea8cb45
	.xword	0x37585bf673d52146
	.xword	0x93c7a53e19558ab4
	.xword	0x671289dee643604a
	.xword	0x7031d4f7c69c0456
	.xword	0x861e0d975c3756bd
	.xword	0xdb60719103f73f07
	.xword	0x25bc1979399e24ee
	.xword	0x08fceb8836a5bf41
	.xword	0xc57b66706cb69761
	.xword	0xc90a6da06d1a0426
	.xword	0xa8ca7296ff29633b
	.xword	0xd04f2aa5e095358d
	.xword	0xb625ef6258f2cb03
	.xword	0xaca6155736c2781a
	.xword	0xd6269a589565facb
	.xword	0x5f885ab4c84a775e
	.xword	0xadce03fdde7dc3cd
	.xword	0x181385432e405809
	.xword	0xc2bf36897dfaba44
	.xword	0xa8f92cd2ebfeda0d
	.xword	0x6d2455e1e11c66e7
	.xword	0x9f65f3f1f982dbe9
	.xword	0xcbf5f7b568e71559
	.xword	0xf8d7406d8675b128
	.xword	0x6e2130523f301707
	.xword	0x7c2ded161bbf33cf
	.xword	0x40b724e377df3b99
	.xword	0x19b14c8c4f85f517
	.xword	0xfcfa37daed3dbefd
	.xword	0xa7dea4564e66fd26
	.xword	0x5094de36714f0a3d
	.xword	0xfbb280cb0d95c5f7
	.xword	0x8b0dec7cfa53b523
	.xword	0x5327a171cfa5ef6f
	.xword	0x826cc40f63658e6e
	.xword	0x2a538dfe1d517e96
	.xword	0x432be35ef19a9403
	.align 0x2000
	.data
data_start_1:

	.xword	0x9679cde0186cba4a
	.xword	0x5720c85ee4ef6232
	.xword	0xe4b144a3c45468c0
	.xword	0xe061f7a8ec84bdc4
	.xword	0x2930560170e07a65
	.xword	0x72cdfaa5e6cc4827
	.xword	0x66e30148f0756d1d
	.xword	0x4466164981ad84b3
	.xword	0xe83c3629a1230ee1
	.xword	0x81ee340de5cf0504
	.xword	0xe85527829a0f2851
	.xword	0xb9246f5a04c2bb64
	.xword	0x8f110a10c138eca4
	.xword	0x1789bf06d1db5323
	.xword	0x56d123c468cd6598
	.xword	0x75d8abdbf0f9b95f
	.xword	0xa4ffa9af516c09d2
	.xword	0x2ca66a67d1e5915e
	.xword	0x9c250133a0480030
	.xword	0x31afb4035ffe0765
	.xword	0x11012644020726dd
	.xword	0xe152966832244ca4
	.xword	0x52b31d56d3e8b295
	.xword	0x87d8cf9e00d75395
	.xword	0xadd4fea3b84975df
	.xword	0x2a38f3516ac103c9
	.xword	0xf6bca6ea70d75a25
	.xword	0x84de9e03c73d6670
	.xword	0xaf3694e23e57846c
	.xword	0x8ecb844f0059201a
	.xword	0x20598e9d4341a9d7
	.xword	0xf718e81518d6ad37
	.xword	0x2c6d4f3a8660988a
	.xword	0x2862ba58d4635a89
	.xword	0xe0e77a3650284aa9
	.xword	0x39e8714f09bbab4f
	.xword	0x4dd708c974a88410
	.xword	0x5531adb6a5068a8b
	.xword	0xfff9da82e253733c
	.xword	0xe836d0cbf2c0ac5f
	.xword	0xc115e5d0e42f9ceb
	.xword	0x29b82912c2f28355
	.xword	0x37a9efcefbd68586
	.xword	0x75d9d23b6ae7b39f
	.xword	0x889bb5b62d0eca9f
	.xword	0xa0d98d73961a6048
	.xword	0xfcd5ef8c84e37a46
	.xword	0x3167f11a7a751355
	.xword	0xdaea61ce08e7be0d
	.xword	0x4dcc05315fb40eba
	.xword	0x3297eb3d25e463ac
	.xword	0x1375581fe91f02ff
	.xword	0x9cac67a93ba39706
	.xword	0xc9e91ea6d385d949
	.xword	0x3b92cf2180fb418d
	.xword	0xdbd976d7e370f5b4
	.xword	0x5ecdd6c1b706bfb8
	.xword	0x032e53d42becca85
	.xword	0xfc5e6e1d69e5c6ab
	.xword	0x81db46de7ac9c3ab
	.xword	0x450ece620e2ec7bc
	.xword	0xff072cc70b6c1064
	.xword	0x1ade9481af249e70
	.xword	0x6919dc006c70dab8
	.xword	0x303b0f95036769f0
	.xword	0x079e77ded7ce98d8
	.xword	0x88d77beb62032ef1
	.xword	0xb6eef09d83baff21
	.xword	0x7f71064ef18285c8
	.xword	0x8d1dde8a53d443c6
	.xword	0x75ce1272db61fb4a
	.xword	0xa860fec746ed4154
	.xword	0xe9ff68401524d985
	.xword	0xa95c2847b862ca76
	.xword	0x1ed1905f5fc34bf3
	.xword	0xe85f6fdcfee15b25
	.xword	0x737e2539a8fb1508
	.xword	0xe2e5d67199fd6762
	.xword	0x3e5b35457ebf6021
	.xword	0x3c5fe69562720205
	.xword	0x6048ccf521129879
	.xword	0x36f748d499ee72fe
	.xword	0x93f4df927ef7494c
	.xword	0xced154ef9637a473
	.xword	0xb525b71e1adf414e
	.xword	0x268e9d19d6499f0e
	.xword	0x3c88bbba7f2f111f
	.xword	0x25a6f985210ff487
	.xword	0xe18e9e3de1e26d33
	.xword	0x16f67809c3a97e80
	.xword	0xf211175fabff812a
	.xword	0x9fa448671fb98e83
	.xword	0xcea69a999266ae3a
	.xword	0x1ea028b3019fe9bc
	.xword	0x850feee56bf4ddab
	.xword	0x05ba421068d189d7
	.xword	0x5e1e5c9eab14577c
	.xword	0x06ffe91f53db6531
	.xword	0xf61984656b099fad
	.xword	0x3984dd9f5bccb9c0
	.xword	0x430b54c7abd3db0c
	.xword	0x670801a35ceeadb9
	.xword	0x8273303b6117cfd6
	.xword	0x9c2f00757fda1b90
	.xword	0x08d2e0c4418f5dde
	.xword	0x4911242bad5ba55c
	.xword	0x80c8ac96d0a7cc0c
	.xword	0x7920ac2b78140c8d
	.xword	0xc3dc7ac2fd775526
	.xword	0xe41733e769441767
	.xword	0xc87076520e6763f3
	.xword	0xcfacb673fba65659
	.xword	0x7bf0a2a5ae69730c
	.xword	0xa28f10d12d1b265b
	.xword	0x16b43016b6e2ad68
	.xword	0x36a5ee574d59c640
	.xword	0x8bbff02739579028
	.xword	0x0138004594bc9632
	.xword	0x6a73c09293d420dc
	.xword	0x754c6a95a68ae8d4
	.xword	0xd184b44cb85d4d6f
	.xword	0xc42acff5c06b8f1b
	.xword	0x881d02a531b0659e
	.xword	0xd1dd86060f3ce78c
	.xword	0x1f07ee5e78739192
	.xword	0xb0aa666369495bd0
	.xword	0x9a83752d999aa961
	.xword	0x9217dfc295dc8eae
	.xword	0x58cc43f572c9cce5
	.xword	0x48ed54fd095992ff
	.xword	0x1eb0d3151c199dd5
	.xword	0x99eb661a47eec0a4
	.xword	0x8e4bde783780e7b9
	.xword	0x99aee086e9352eb9
	.xword	0x8d38d4043c1a2371
	.xword	0x91db9fe807c5daf0
	.xword	0x264af9c0bdf95594
	.xword	0xb4c16d38eab1bab8
	.xword	0x6405ae6758e41865
	.xword	0x00cc590e0a0000d8
	.xword	0x1563cc075a78bdec
	.xword	0xa8d2a443111fcf29
	.xword	0x6d74291c25913dbe
	.xword	0xac0afa41acf636dd
	.xword	0x101958d7c991c71f
	.xword	0x0ba2552e8ed95684
	.xword	0x644ed2388ec998fc
	.xword	0xff19c5400e8114f6
	.xword	0x379fd1e13f1f08c2
	.xword	0x551ed52379691be6
	.xword	0x6f7e39b0a322a08f
	.xword	0x129f1b6d4a96eed4
	.xword	0xbd42fe7f1a7d4907
	.xword	0x7a83063d5795a443
	.xword	0x0cbbfabda753fa55
	.xword	0x1438691270ff6d3a
	.xword	0xa91101e960cb968b
	.xword	0x66300aa54d401257
	.xword	0xa8e78719339fd231
	.xword	0xdfe99bdc17cc3a3c
	.xword	0xdd51947a47ca1aff
	.xword	0xa4f6ac3b0c1d735b
	.xword	0xfdaa3ad8990a0b77
	.xword	0x11d526ea3cc896c9
	.xword	0xfe3ae3d059530076
	.xword	0x1d9aaa92a16e0c58
	.xword	0x29136a5031507209
	.xword	0x913d09acc4db2893
	.xword	0xf7f82f453bfd2434
	.xword	0x6de77ac0a683d932
	.xword	0xb380a8b53228e17a
	.xword	0x184c6151410246f1
	.xword	0x2d780b76368fbb29
	.xword	0x13a9fbc0894fdee1
	.xword	0xe83eed41017f743c
	.xword	0x8a396f5db9df1f22
	.xword	0xe2a21d87214d5cad
	.xword	0x1c3fa9d1997d2ada
	.xword	0x328a78e28551ba20
	.xword	0x84b8c9fa395f1128
	.xword	0xfd672c94aa771d22
	.xword	0x8204368ef147e8fe
	.xword	0x6b67b008ed0feff6
	.xword	0x6379488eb49e4136
	.xword	0xad2cfbf3d0d071bf
	.xword	0x9529fbdeb106e6cd
	.xword	0x508be03099acc32e
	.xword	0x8989fd75b2cb16da
	.xword	0x9fb2a9396beb3c7e
	.xword	0x7c4ad3b1c5915ab8
	.xword	0x8b0b4ff01c92d62d
	.xword	0x36682caf22108ef2
	.xword	0x257ef591b0dbdaa4
	.xword	0x88ccd056b42befd2
	.xword	0x8104b42af7bd4f7e
	.xword	0xfa8b14538eb59532
	.xword	0x73e74c11cf4f6008
	.xword	0xa28e4b03f48c71c0
	.xword	0xb06f0d130ef5b0ff
	.xword	0xb6ebb00baf6c7997
	.xword	0x810c6d5aaeb681b2
	.xword	0xf075a2f273dc1286
	.xword	0x80f970d3510d43c5
	.xword	0x4e6d4cd7e17212a1
	.xword	0xfb6488d05bd176f7
	.xword	0xf671866ddbbd6f8f
	.xword	0x1090e5bc1406d31c
	.xword	0xe79849409b05eea6
	.xword	0x679146fead3ae554
	.xword	0x4627a2dfaf08749b
	.xword	0xc9bd447713694baa
	.xword	0x1371ca43766c16f0
	.xword	0x2c913ac0989beba0
	.xword	0xf9b9983a1659b912
	.xword	0x796eb18927297d67
	.xword	0x1655c779e60e3c6a
	.xword	0xc6b27fc00419c086
	.xword	0xdb28959f0de2f8f4
	.xword	0x02725c65fee59ffe
	.xword	0xfd33b1fbb3c32775
	.xword	0x215bf4b5ede7e4be
	.xword	0xeb946a023263f780
	.xword	0x9460aeb5f8ec3235
	.xword	0xde4b393b5dea9ab1
	.xword	0x216e3973890daa2f
	.xword	0x0545f9aefc988ba8
	.xword	0xd44ee4dabdc93842
	.xword	0x770aca4db45c22ff
	.xword	0xd587c9f011934f8f
	.xword	0xaf1744653e7cb12d
	.xword	0x2ef94fe4aba535c3
	.xword	0x8843ec519a8b5250
	.xword	0xe465e7a4558eb184
	.xword	0x180c04402353272b
	.xword	0x1aa7e767a9ed24e5
	.xword	0xc50bf3da1d0ec1c1
	.xword	0x360a1c0e5b1d7021
	.xword	0x3675b92519a1d5ad
	.xword	0x9754dfb3f9c77fea
	.xword	0xbf3595d5233afaff
	.xword	0x9ab5fc46ad9e0bf8
	.xword	0xa628d92c515d55fe
	.xword	0x07fe96454f5130c1
	.xword	0xe2a6663610befdcf
	.xword	0x1b45469257852e72
	.xword	0xda4f2c13ee7cce52
	.xword	0xb94582572f0da2a5
	.xword	0xf4411d5bf17cb2b7
	.xword	0x66b707fc2747e996
	.xword	0x6909af68b166554b
	.xword	0x4f2c6277a783d3a2
	.xword	0xddb1656e4a3b036b
	.xword	0x73807ff6162838df
	.xword	0xac30d5e3573f5f54
	.xword	0xa71266ffcf5cb651
	.xword	0x424e891692d38007
	.align 0x4000
	.data
data_start_2:

	.xword	0x7b7f5c38cdfe923f
	.xword	0xbe729ed6ac237734
	.xword	0x3dfe393488a9dae8
	.xword	0xaa143af38623ca56
	.xword	0x4dc4072f66e38828
	.xword	0xbcc2cee5e5377333
	.xword	0x8d84bab877902d29
	.xword	0xc3de21ac0b2df694
	.xword	0xe0f3f36f9d8ec743
	.xword	0x93c4f0f1e30bea3c
	.xword	0x4e17866816a039f3
	.xword	0x27277967362477f0
	.xword	0x3452f805126b3863
	.xword	0xc6a29a653b97d80f
	.xword	0xb72fda7c295112d6
	.xword	0xc80ce8745404304d
	.xword	0x6e7a3cf60ee6f89c
	.xword	0x2463f58e84c0b688
	.xword	0xfab316b9d9d22a5a
	.xword	0x190da6434b93bdf7
	.xword	0xa5e833d0833d7080
	.xword	0xac47e7460ece0b21
	.xword	0xeb052fbe69576b9e
	.xword	0x2dd37dd0e057d1b7
	.xword	0x3c02ed3a958726e2
	.xword	0xc94a70b85653df2e
	.xword	0x1073b7fe3ef07b03
	.xword	0x24080a6db2a6609c
	.xword	0x930e5a045c480d5f
	.xword	0xd57715babead4c4e
	.xword	0x43e82a1a90804c22
	.xword	0x0498750e102020d7
	.xword	0x84c114ba8ddfd4a4
	.xword	0x0d79f7c73cd9707c
	.xword	0x8d98b01b1b94e2a2
	.xword	0x7ca88609b3d9ab0c
	.xword	0x50c661ec94c70050
	.xword	0x38a09ca2053b308f
	.xword	0x7017d41632486909
	.xword	0x315355d4272aab19
	.xword	0xea755609a3a16858
	.xword	0xe3f13714464d3640
	.xword	0xcd6d6a55f0933e53
	.xword	0xaf968a7fbd33d263
	.xword	0x31edcd5cedf84dc1
	.xword	0x8545d7d132c10655
	.xword	0x59535ba68d279e24
	.xword	0x3852d3da83fa3a89
	.xword	0x5d824b85a4665062
	.xword	0x9e79627ce1343c09
	.xword	0x166806d4413ca2b9
	.xword	0x098bb8c76be1e472
	.xword	0x4c42a09abce23b1d
	.xword	0xfc5d9d7e9a382087
	.xword	0x79b6733d248527bc
	.xword	0x3b205933a2d06a89
	.xword	0xc9a33c7806bbc9bf
	.xword	0x55eec0879b92ab22
	.xword	0x8cf3d9984e03554f
	.xword	0x094f6ac33c8e62dd
	.xword	0x8c4fe9cae77af7c7
	.xword	0xd7343ef575b31bdf
	.xword	0x6218b6b8093bfe50
	.xword	0xe8e555589e373cb0
	.xword	0x3006261f2e94461e
	.xword	0x4ce043ddc574a71a
	.xword	0x9e08a23c271aadeb
	.xword	0x9e9517ae678cfd42
	.xword	0x5a60d9ffc8aeff72
	.xword	0x4f04f8d08119c4bc
	.xword	0x21342051f05ed035
	.xword	0x7e1f3e4a0266ebe5
	.xword	0xfad9be28e712fd6e
	.xword	0xaa0cab50f1392b9c
	.xword	0xb50f7260e82b6742
	.xword	0x7d938618016560ce
	.xword	0xb2b2569f4f667fdf
	.xword	0x3f0fdcc253dde001
	.xword	0x0cac09896a50db2c
	.xword	0x112fd6ad1ceadf65
	.xword	0x5083308990c4d5ef
	.xword	0xfb1d6150c7e298ab
	.xword	0xfa07ad40a338bdb4
	.xword	0x76c96630eb5ce34c
	.xword	0x1d4fb6f443414289
	.xword	0x46c440db442cf2f7
	.xword	0xfbcbf89225140c46
	.xword	0xe758c06136e22e12
	.xword	0x5cc5db5562a58e4a
	.xword	0x92a12dbc0555e676
	.xword	0x1ff73309670bd527
	.xword	0xc6afc6673f1bedb0
	.xword	0x13f672b81469f0d7
	.xword	0x75e1f23420e01940
	.xword	0x366436906e65cb45
	.xword	0xc6101b802082835f
	.xword	0x268a7f42e5e5263b
	.xword	0x5c3f8f46a5aeaf36
	.xword	0x3613e4489cea3383
	.xword	0x069f275944298674
	.xword	0x32fd14f3b2eca8a4
	.xword	0xc9f2fc063cab59b4
	.xword	0x57bed6d205a728be
	.xword	0x01958eba9479000a
	.xword	0x3bcfab43e3313c37
	.xword	0x700bb00e52ae0730
	.xword	0x0935f6236a19a99a
	.xword	0xf41fc42c8d5a4841
	.xword	0xf8b2683d36307550
	.xword	0xfdbdd508fe1be1e2
	.xword	0x819e6f54e07e995d
	.xword	0x74089828cade3935
	.xword	0xbfae1715857fd348
	.xword	0xd69088e2971d5ae9
	.xword	0x3a994950e9f7ac62
	.xword	0x63c753f9c89dfa4a
	.xword	0xf612287da977c579
	.xword	0x07a77e68dec42bd5
	.xword	0x04244d24af00378f
	.xword	0x6b14510956500c9e
	.xword	0xd9e6e00ad06bbfa9
	.xword	0x9c43240de10966c9
	.xword	0xcc52ba3841cb24cc
	.xword	0xf83ad0a23266e373
	.xword	0x8fe5ffa4353623d2
	.xword	0xb78ebedb6a4f915f
	.xword	0x848d75b19a31889f
	.xword	0x2365d4e3b8b711f9
	.xword	0xc20bed862f54ab73
	.xword	0x1496986c78dcc725
	.xword	0x31f8f602b65cce43
	.xword	0xa469156122a197c2
	.xword	0xc259313038866486
	.xword	0x2564224eb0ba1cd0
	.xword	0x493fefb0407467a3
	.xword	0x95c1cfbdf051ef49
	.xword	0x09c48a548aed04f6
	.xword	0xec1bbabea4f9e60d
	.xword	0x25feea16df8b74ff
	.xword	0xb68bd916c8958616
	.xword	0x57c5c9114c503477
	.xword	0x176d495aedb247dd
	.xword	0xaa18f2b8911bef67
	.xword	0xebd794b8602fe3e3
	.xword	0x01040edc4cc5bc6f
	.xword	0x2f6cf1778f2317d5
	.xword	0x6f9ad5781aca90cc
	.xword	0xc603d1673a9471a3
	.xword	0x250a3c94413cf967
	.xword	0x223eebf84e51bc55
	.xword	0x5605d5ac132dab1d
	.xword	0x70d317a8fbbd19a6
	.xword	0xf7a0f3dd90fd21b1
	.xword	0x7edda072e8321917
	.xword	0xca768d3d69675a61
	.xword	0x120471a37d0cb173
	.xword	0x8e202e95c455d721
	.xword	0x40060a727fb70b49
	.xword	0x88f10593941293db
	.xword	0x52c482419f715ba8
	.xword	0x9505e4c1f782e13a
	.xword	0x8d277d3a56bb9264
	.xword	0x82c7f9bdf7024f5d
	.xword	0x80c7cc46358af098
	.xword	0x11f42daf487e2016
	.xword	0x81d31573ec12530c
	.xword	0xa8210bb84740bc2b
	.xword	0xcc1d018ee9bf4a77
	.xword	0xf5bb99f534998721
	.xword	0xca99300e2a5f0f15
	.xword	0xa3e0afb48d7372e3
	.xword	0x0a8d7b998a4037e5
	.xword	0x83567a1cb1016ff6
	.xword	0x3f4cc61e5f89d1c8
	.xword	0x85c5cb817c2be3b2
	.xword	0xee38fac29908e55d
	.xword	0x6ec7d744859158be
	.xword	0x5641bc91b1d8cd20
	.xword	0x243e55c4d5454dfd
	.xword	0x2dbd65e1f461e459
	.xword	0x72ad81c9599fee30
	.xword	0x1afb2548c0cf9d74
	.xword	0x5368917e008ce5e5
	.xword	0xc0816ef2f8e84697
	.xword	0x40bf9074b45b35f7
	.xword	0x842feb01b5463808
	.xword	0x65eca91ffe4d558c
	.xword	0x5d2bac63e456bf39
	.xword	0x1b102f18eec8d38c
	.xword	0xc09db24e94540f7d
	.xword	0x3740ed9b323cab6f
	.xword	0x17a5182434aa38b0
	.xword	0x52f73cd24a4c5c55
	.xword	0xffbe1ee4792acc37
	.xword	0xa93e4c4de32e8351
	.xword	0xf968e36b5dea79dc
	.xword	0x1c8f5f9f3ed15e4a
	.xword	0xc6c209b344374d63
	.xword	0x035e27fdfdee6118
	.xword	0x35876dfe1b13eb22
	.xword	0x3cba09654a80faf0
	.xword	0x90ac1bf531c8e155
	.xword	0x1c05f3f515c9e2e0
	.xword	0x7c98bac29e7dbe28
	.xword	0xf4b99e01a7e287f4
	.xword	0x2035c6c7c845974d
	.xword	0x96b8a5e8551f5776
	.xword	0xdddddca6f8952c40
	.xword	0x73b75f88d21b034a
	.xword	0x2a80d1415bdde618
	.xword	0xfbc7a05835ed797a
	.xword	0xfc90af77345b0699
	.xword	0xc6537087096ba641
	.xword	0x4de928552f8ec9a1
	.xword	0x3ac64969b5afa3ec
	.xword	0x6f56e628cda4ea97
	.xword	0x4b568e31a8ad16e1
	.xword	0xa50aa9bdae6d1b84
	.xword	0x61f578d69c366dc2
	.xword	0xee81ea2d5d3e39bc
	.xword	0x4fca8e3f8e61d53b
	.xword	0x528e43174291ba74
	.xword	0x7812bd583c928047
	.xword	0x7f874e5b2cc087f5
	.xword	0xe261cea5e4b0cdf0
	.xword	0xf87f1559b0c56642
	.xword	0xf28789485e08e852
	.xword	0xe8d2ee9ff8904436
	.xword	0xcb23ca8afb456b59
	.xword	0xab2a7d45607bdb1f
	.xword	0x5c3bdd12aa8d9304
	.xword	0xa4f09eaee9fa768f
	.xword	0x5b90cf8696170bab
	.xword	0xc88d16821aeef965
	.xword	0xbd9629013ed2435b
	.xword	0x3df9f7021e0caf22
	.xword	0xec03b2c40b8c9912
	.xword	0x74c7b5ec28cd6e02
	.xword	0x4b26e4d21fd6b058
	.xword	0x49ecd2e5eb869efb
	.xword	0x08a5b6aa84d0f8c0
	.xword	0x2568ae5a3c997c7f
	.xword	0xab3857bec12cd834
	.xword	0x6274a21891f8c71b
	.xword	0xd436ce37039ebcdc
	.xword	0x07b3ac178612c6c0
	.xword	0xedd646487e86f4b7
	.xword	0xb355fab66d38a987
	.xword	0x442af7f166969ef5
	.xword	0x3d89b3b71ad65dca
	.xword	0x6dbca7f0fc2bec5e
	.xword	0xc62a6eb99aa73b5e
	.xword	0x4a967f2a1795b69f
	.xword	0x8d251a6e37825137
	.xword	0xa2867c698c8f7c81
	.xword	0x8a577063a46df93e
	.align 0x8000
	.data
data_start_3:

	.xword	0x7ee0d30b6d0baf69
	.xword	0x79fb00e94d6c64e4
	.xword	0x638678774c27803b
	.xword	0x7d9e8fdf8508c8f2
	.xword	0xb74aa7049a241a86
	.xword	0x9cc880f1cd885493
	.xword	0x6e9dd366666c40d6
	.xword	0x9e4b5f31a26801c3
	.xword	0xa4cf4027b288698e
	.xword	0x159c3265af14656c
	.xword	0xea77bf9b1af7a1db
	.xword	0x920d6d2743a249e1
	.xword	0x627039139e2424d7
	.xword	0xbab938eb8db72400
	.xword	0xa8752d06a8efa38c
	.xword	0x1a970481a9cc9b72
	.xword	0x82c3cfeecc861135
	.xword	0xfa7e4089bed218b6
	.xword	0x9ab558453dbc6378
	.xword	0x5d1390821c2ded1b
	.xword	0xe4f8852dad0ad675
	.xword	0x963854bfdb3a25a0
	.xword	0x7ffd745a2202afd1
	.xword	0x116777d38a5a671e
	.xword	0x95333973608771e1
	.xword	0xcc57dd687400ea20
	.xword	0x28a4f9cd3671ef08
	.xword	0xf902060d48e39937
	.xword	0x86f9ab38623f6cd5
	.xword	0xce213033abf846a5
	.xword	0x76e01f5d656331f1
	.xword	0x5bf92e9348cdbd77
	.xword	0x4893deb67288d2c1
	.xword	0x71f435c0aa44d859
	.xword	0xae1a5311d09c4bff
	.xword	0x26dbf9f31adf327c
	.xword	0xadbd75f8e7bc669c
	.xword	0x00ab2adf2fae8a72
	.xword	0x61a09e64fbf05889
	.xword	0x24b45aa8f24d9c28
	.xword	0xffde2c98334d68f3
	.xword	0xc589760af98bb44a
	.xword	0x528f6e970ba01f10
	.xword	0x8f6a141a7b09dd96
	.xword	0x8b7db37ab2d819ba
	.xword	0xef918352dfae1aaf
	.xword	0x77bb1d5a1fae9647
	.xword	0xbe1406feed2079b8
	.xword	0xd7237991ecf037ee
	.xword	0x285c4747cae38dec
	.xword	0x6f7db99c630a5889
	.xword	0xf62cca32b63f39b2
	.xword	0x2ec89731e48babca
	.xword	0x408ed2123802b9e6
	.xword	0x38eca2c231149e8d
	.xword	0xd56438ad77873eb7
	.xword	0x20b64d7fdf8d1d57
	.xword	0x70d74b74d67120c7
	.xword	0x551d187a2bf24ac2
	.xword	0x4cdbc3a4e701ab24
	.xword	0x8663c31b5e259e3b
	.xword	0x652da87dbddb09d6
	.xword	0xb833c01d3a819758
	.xword	0x49811af9683edfc0
	.xword	0xd7db27a4ec770840
	.xword	0x7b0096da91828c5d
	.xword	0x8944c5c67a8777c4
	.xword	0x6044c783977fc932
	.xword	0x2dd6797e28ecbfdc
	.xword	0xb7b2ca9d15dbdae4
	.xword	0x5fd334cd0dc0a8a1
	.xword	0x028ca41c5eb5c04c
	.xword	0x6feddb6a910b271d
	.xword	0x32920e86f79f3d4e
	.xword	0x8eb099302860ef25
	.xword	0xab190a016808a24c
	.xword	0x7af6bd0afaa0792f
	.xword	0xf98e382da7414df4
	.xword	0x068b5513f1aa23b0
	.xword	0x12b184f1e7e8b704
	.xword	0x1f0677dafb877cef
	.xword	0xa7bf6d01b12babb9
	.xword	0x5a56d3705dc5ebdc
	.xword	0x2398aee7a8147807
	.xword	0x62d302d2e0ffa89c
	.xword	0xcefad8622df5e96c
	.xword	0x3e3c206f80bb740c
	.xword	0x477d000e522698e2
	.xword	0xc7e5595a9477576c
	.xword	0xd7279d834e9145ee
	.xword	0x03050e4b0cff0719
	.xword	0xe7f6c8063d7dd9cd
	.xword	0x9c75aac453edf802
	.xword	0x341846244ef82b46
	.xword	0xd4f57dcdce90cd22
	.xword	0x133a18429a303610
	.xword	0x6a559cce0fa638c1
	.xword	0x423bd9d4fe744cd0
	.xword	0x43b8e38788ea0b0e
	.xword	0xe705045135339bad
	.xword	0xab1942bb02740dfa
	.xword	0x58c6e014f1f99e69
	.xword	0xab97bf361b741278
	.xword	0x7df754819e478fec
	.xword	0x5a8a74841fbcc265
	.xword	0xe6d82bc717fe74e4
	.xword	0xa48d9ab8828a1e6a
	.xword	0xdac2c23fb70aae1b
	.xword	0x3f82c54ff87cdae5
	.xword	0x2ad2e60eca3f6383
	.xword	0x5761f786f1b277d3
	.xword	0x7858127a604f8068
	.xword	0x45a3372639187791
	.xword	0x3b1cccfe8a53ff31
	.xword	0x4cd1823e1c7adf66
	.xword	0x98915e5fd05dbc78
	.xword	0x5d2c7d35f324c82c
	.xword	0xed4f935f5b0b3e09
	.xword	0x993a9539ed6034b5
	.xword	0x7fb4bbb3cca67cb6
	.xword	0xb26fdeada35e4f11
	.xword	0x25da49435bbcd523
	.xword	0x4285029acbcf545f
	.xword	0x4c24592338062c52
	.xword	0xffd6fafeebb1e287
	.xword	0x5ef29ecd9e05761d
	.xword	0xff13f3c30347be6c
	.xword	0x72724b9c87e5f12a
	.xword	0xe7bed265590e7071
	.xword	0x4c97ed74a70f41d8
	.xword	0xcdfaa34f17781933
	.xword	0x84b847f6890c0b28
	.xword	0xe8bedb4ef3034a38
	.xword	0x367fd3a10eb55e5c
	.xword	0x38645865ffde77d2
	.xword	0x67eaa745085058fc
	.xword	0xbb23f79d5a804b63
	.xword	0xb3367ce1bef2cde8
	.xword	0x8b6bbc72bec34fa5
	.xword	0x11776e4799513c89
	.xword	0x8589b5d920af7b99
	.xword	0xb1897c2b2060a7b8
	.xword	0x449e916604631cd0
	.xword	0xe270af82caf2f147
	.xword	0xdb54bed441741258
	.xword	0xa5fe2d60e659887e
	.xword	0xdef74f771baeb3d7
	.xword	0xbf3d98d4d1b98869
	.xword	0x6dc09ab7c12858d1
	.xword	0x6185d47bd2e14ab1
	.xword	0xffa1d4c3a68afd54
	.xword	0x50f0d9d5f9ece4a6
	.xword	0x8c3d1dec1f1b1469
	.xword	0xa90788d163cbb2f1
	.xword	0x2eba88385e51c5c0
	.xword	0x3dbbe0d098a1a2ff
	.xword	0xddb6b66b4201a3d8
	.xword	0xca27df06e694540a
	.xword	0x81fc353b591dbb4f
	.xword	0x856d802b3b4c7932
	.xword	0xbfcd674be72e9a69
	.xword	0x61716902b6983bbd
	.xword	0xa5197fa176fd1d9b
	.xword	0xda0de4dc7d58bb60
	.xword	0xbcef157664bc4d23
	.xword	0x113e14b487ccc9e3
	.xword	0x00f86d06237f7467
	.xword	0x3d641521f657e240
	.xword	0x559f7469a95c3d5b
	.xword	0x0465258e0726f036
	.xword	0xde5100bd6582087f
	.xword	0x3e68ec50c97ec0b9
	.xword	0x2a3b694895e8a2fa
	.xword	0x6cd46648c9561fae
	.xword	0xddfd23e63b96891a
	.xword	0xb584adf2c1c3fef0
	.xword	0xb6b223d5e0b0798b
	.xword	0x80db9e4841d28813
	.xword	0x96e5be297544a87d
	.xword	0xfa85d7b9353e3591
	.xword	0x6dd8b7ff321ba854
	.xword	0xef8f4ce348cb6cb8
	.xword	0x0b29f665a4587a33
	.xword	0xc49294257f60dfbf
	.xword	0x310d259ae3a1c8d2
	.xword	0xb677bfa7c684bde7
	.xword	0x0f19e95a6be2fde9
	.xword	0x6deb831bc1757d56
	.xword	0x0d2e61037e72baac
	.xword	0xfcad5d10ac8dcb64
	.xword	0x720aaf6607a5e45e
	.xword	0xa346486b9dd96bca
	.xword	0xf97d5b8752a5312b
	.xword	0x0cee600ac36750e9
	.xword	0xc4ad739a36a162bc
	.xword	0xd9b04ef8c9408087
	.xword	0x0c9c89389f4a6f7c
	.xword	0x4db2ac22c1694dcb
	.xword	0x52976deed9291d05
	.xword	0x7072872d6f13da3a
	.xword	0x1259be673c04d93a
	.xword	0x622e796bffd557a6
	.xword	0x30a75d96f57f868c
	.xword	0x90c616e78224deb1
	.xword	0x114567048ec50f77
	.xword	0xdfc9652dee1f1bfc
	.xword	0x9755b0da1acceeed
	.xword	0x1982e0cd1be163cf
	.xword	0xdcc7b43343d98b4d
	.xword	0xd7788023d7de9085
	.xword	0x041dbce8d6e312f3
	.xword	0x7065ad94f7eda680
	.xword	0x722ffe3f0c3a5fff
	.xword	0x0a68e3bde4a5f6ee
	.xword	0x2816371c1036d9e2
	.xword	0xa482ce823c72a006
	.xword	0x7b02cc89d39bd8c0
	.xword	0xb1606f1ecc3a14b1
	.xword	0x7b4079094162a138
	.xword	0x9fc6d865be82881e
	.xword	0x8ca46c5d55ce9845
	.xword	0xa3f031f19d9d0f11
	.xword	0x3d73b5f336f72c04
	.xword	0x6634547fd81d255f
	.xword	0x0d9de131173d4ac7
	.xword	0xe558e3eda5fea261
	.xword	0x6eac8314f6333040
	.xword	0xbbfa8b986e60d87a
	.xword	0xfa4ad50fb1627707
	.xword	0x43f24a0343d6ac40
	.xword	0xbf683e4600f567da
	.xword	0xf0ddd30464186e98
	.xword	0x253bab120e78eb9c
	.xword	0xed8c9a2031ab45db
	.xword	0x2655509817787a3a
	.xword	0x84521b9f4be5a967
	.xword	0xe607b9b98104342b
	.xword	0x21d43a32a333cb55
	.xword	0x45b0428a72de77fe
	.xword	0x503bf218b01c3535
	.xword	0x09179ee4c3c1392a
	.xword	0x6d5dabda8c7e6e78
	.xword	0xdeacb8616c252585
	.xword	0x588baa00f02c6fcf
	.xword	0x6dc1dafec3409100
	.xword	0xdefb36288e9a410a
	.xword	0x4ae93fe9e906155f
	.xword	0xcf79bf8eda514b62
	.xword	0x5cba4b1e58a0a07d
	.xword	0xcd16a49817c0a2c5
	.xword	0xdd035a5768d53e4e
	.xword	0x2923f591274d785e
	.xword	0xd481f7f0f19f2bc4
	.xword	0x91a02c844a1961ea
	.xword	0xcd931d0e6a9a0b6b
	.xword	0x17e3d2e33a80545a
	.align 0x10000
	.data
data_start_4:

	.xword	0x123720da0885c46e
	.xword	0x39fbb4d18fc5088c
	.xword	0xa131476c0615ccbe
	.xword	0x327bafd22c720e90
	.xword	0x79da012c721b3994
	.xword	0x94b120df2db4d254
	.xword	0x22b86df395c51e36
	.xword	0x9f83ebc59a5566f0
	.xword	0x64ee85c64b92f291
	.xword	0x7f02534eefaabb9a
	.xword	0x88b9eaa686b5d8b3
	.xword	0x446c678f4dbf5039
	.xword	0x522ccb6e7f1a84e8
	.xword	0xfb2f7d587af19382
	.xword	0x52c684151cc1bea5
	.xword	0xf2ac57a8816d3f52
	.xword	0x98b71f926e346c3d
	.xword	0xa66cf45ead68a7ff
	.xword	0x21c33dda3f465275
	.xword	0x6ff563f947d2fc2d
	.xword	0x9ada65932250743e
	.xword	0xd16d95c48ed1ceb8
	.xword	0x05835f5c07d451d9
	.xword	0xc0d1afb33d459add
	.xword	0x57fcfa92a0da4c60
	.xword	0xe28e261111b85b8e
	.xword	0x49cd99f312a7653f
	.xword	0xf1c4a35ce6ce3857
	.xword	0x0b86e8647bf6da53
	.xword	0xa4129975a294f79b
	.xword	0x46a89ef0bf2da33d
	.xword	0xe0c7e1cd074e3643
	.xword	0x486391098739ab0c
	.xword	0x3ea26e391699787c
	.xword	0xb3a930b79c805321
	.xword	0x74a2fffcdbe8ebc7
	.xword	0x3c461290cadb4d61
	.xword	0x2967801580884011
	.xword	0xbb3a22a4f1206efc
	.xword	0xfe268abdb0413bd5
	.xword	0xbf58c382a7c44a7e
	.xword	0x3bd3d504254db433
	.xword	0x5ee1b8a936c0c5e7
	.xword	0x0861cc0e28b364de
	.xword	0x49095cc1904a5e1e
	.xword	0xb203378f20aeaa96
	.xword	0x3cdef9a01e30d58e
	.xword	0xad44fb55a8a60da5
	.xword	0xa4c6bfdbae694048
	.xword	0x817bf5644e760a9c
	.xword	0x3f0dfd07004d28ed
	.xword	0x012cc03fcd8ca4c8
	.xword	0x3afd04dc2bba3e0c
	.xword	0xab38995e3ddb1b2b
	.xword	0xab6c7409d11caab0
	.xword	0x565f269ac1416ea2
	.xword	0x1e9af3f8bccdb1df
	.xword	0xf171eb955fa003ca
	.xword	0x9c2eae0e6a89108e
	.xword	0x77cd11cfe0293de5
	.xword	0x332def014d3a4e8d
	.xword	0x77b87bd337b4e955
	.xword	0x8a39c80543560433
	.xword	0xeb18b80fdc8b976f
	.xword	0xe8ad7505a7ab2bef
	.xword	0xcd7a7dcfb84b12ce
	.xword	0xe42f6a5e4d63bdce
	.xword	0x4b6fd4895508deab
	.xword	0x8b96ed2ff98bd45f
	.xword	0x5e244781e5dd6253
	.xword	0x4dcddf912a2f9a16
	.xword	0x1b741651e9f6f4f4
	.xword	0x3553bf2916aa29c0
	.xword	0x447b33b3d1f0ff21
	.xword	0x97684d7debe211c1
	.xword	0x0f81249d57cb410a
	.xword	0x438f4b873b324099
	.xword	0x94a0f0e268685a95
	.xword	0x0d94021ca4923d12
	.xword	0x354a989512e89c9c
	.xword	0xd7622a0cdb70fc38
	.xword	0xc9e9a1d1b91141a7
	.xword	0xf7fb6914d88ff9cf
	.xword	0xbdae9b45c4c44a8f
	.xword	0xbd9763fe08e3c3c5
	.xword	0xd041c8ab40954706
	.xword	0x2196e3f3ea903942
	.xword	0x7988fa18e7ade83d
	.xword	0x3ddf730d096a548e
	.xword	0x9fb62028b980d45c
	.xword	0x5a0030accc5e6218
	.xword	0x4eed61b293db59df
	.xword	0x7c3315a30fc6fdf0
	.xword	0xfca29ec083aa0e9d
	.xword	0xe8f75ee82e0b8d5d
	.xword	0xd0afbb489131d47b
	.xword	0xff70e66490844fdf
	.xword	0x958cb549aece6122
	.xword	0x21695dedfc50b16c
	.xword	0xabfa1879a1e074a4
	.xword	0x0239fc9d9daa8e2a
	.xword	0x75934cac83c98902
	.xword	0x9a33970fb2ceb549
	.xword	0xaedd9f6a0a1d42f4
	.xword	0x5aff1362fb0d4eb4
	.xword	0x76562d1fd121fc9d
	.xword	0x6fa50dd6afb6cc76
	.xword	0xf6183045c18b34c4
	.xword	0xe696c71664f10b6d
	.xword	0xac3d3b8a1ebeca22
	.xword	0x4a14096bb57cf07d
	.xword	0x9d75ea88b62c71f2
	.xword	0xb898d02ee8e3d138
	.xword	0x5b7ad2d505edea0d
	.xword	0xf279aa557fd61eeb
	.xword	0xf8269280816824d9
	.xword	0x8b51eb4748aecb5f
	.xword	0x7775e68eb5a98f94
	.xword	0xc75feee44a462102
	.xword	0x70adeaa4c9950a85
	.xword	0x89cf8c9a33e7aaab
	.xword	0x133349c4a05b1dc5
	.xword	0x167a0f3b4745a872
	.xword	0x9b4b4ecff2c8ad38
	.xword	0xbdb664df34869b0c
	.xword	0x79a2a910c8b94934
	.xword	0x7ad64d70783f04ef
	.xword	0xc94a041a545aeaa2
	.xword	0xa98da0be2aeca935
	.xword	0x620b7e36f7ae5e25
	.xword	0xf3fb4ec2dac1bd63
	.xword	0xe29377fd569dbef8
	.xword	0x2d6c521e01b1b264
	.xword	0x86afb5799369d558
	.xword	0x02866b920174811c
	.xword	0x187f4b1eb94d157a
	.xword	0xd6761da527ae45df
	.xword	0xfa9ffaedbe0eb249
	.xword	0xe8c45da8cd970704
	.xword	0x9867ec9a424fcd40
	.xword	0x2af6883a649be458
	.xword	0x484d3cc21bbb84bc
	.xword	0x025ce8a97e8a5ff4
	.xword	0xd031bd4a2d784223
	.xword	0x6adf2655eb04439c
	.xword	0x5138e5f0d8319323
	.xword	0xdefacb33739e59a0
	.xword	0xcde605380e38979a
	.xword	0xe1ae0f9b6920dd7c
	.xword	0x72bebba6cda9b820
	.xword	0x49c2a9abcdebeaa8
	.xword	0xafee851e430c6636
	.xword	0x9f94e04d5191b802
	.xword	0x48fe8b5e373632a6
	.xword	0x59951bbbb140f735
	.xword	0x1c1e33f39efab0a3
	.xword	0xa5fdbf694dcfa244
	.xword	0x613d70fe603e2d81
	.xword	0x0969c7f7e707a23a
	.xword	0xdada9d1014ad9a73
	.xword	0xd209fdd11c8b2753
	.xword	0x936b2336529147fa
	.xword	0xc9189f018de4cafc
	.xword	0x5794d61abad2cc78
	.xword	0xaf090d5159422d44
	.xword	0xd03babb2c59475f6
	.xword	0xe3d84eccfdb04bba
	.xword	0x7386381314c8ae33
	.xword	0xdf038fc2b9d27dd4
	.xword	0xf8b36f537e248127
	.xword	0x1ec71d43de54dd88
	.xword	0x9e3b75f4986335d9
	.xword	0x258d76e619944349
	.xword	0x7c3cacb9c797a1b9
	.xword	0x6c032a63020e1a0f
	.xword	0x0927aaa9604331b1
	.xword	0x93867d27aa787bdc
	.xword	0x6d725819041114d4
	.xword	0x2815749e6323b592
	.xword	0x19b87333362ef8db
	.xword	0x04cbcecaca4027aa
	.xword	0x1a7f3fec821d55d3
	.xword	0x18cb4c47ae2205c3
	.xword	0x126f9cc51576b9f5
	.xword	0x4e90f36c68e5d80f
	.xword	0x6c209bc114905beb
	.xword	0xf8f3a680d9f00e2a
	.xword	0x6ec35fc3493988aa
	.xword	0xb833ebf6afb0f595
	.xword	0x0281b4a4e95fbb20
	.xword	0x9e97e6548ae83840
	.xword	0x650396f6e292235e
	.xword	0xf013185efa606261
	.xword	0x2a8e71d03c9ca0a8
	.xword	0x773354be16b7c2af
	.xword	0x168b232a849e2415
	.xword	0x184e89fb2239b774
	.xword	0x02f0112e34eced7f
	.xword	0xf0382fb96e7493f0
	.xword	0x954c505f18848992
	.xword	0x06e4e9089d1fb3c6
	.xword	0xfdbd4689855115a3
	.xword	0xa2e67b2e6a1e4366
	.xword	0xe7ef40717212f488
	.xword	0x85fea0f8b7b8e713
	.xword	0xb0cb4dad13c70f55
	.xword	0x7042893cf6eae7f0
	.xword	0x75057b4ef9d8f0b7
	.xword	0x005dbf7ba501bc25
	.xword	0xd3ff75d2fe30bc5e
	.xword	0xf1275f8dc9e861ab
	.xword	0x52ebf770f6f5b7f3
	.xword	0x9ec0281dc0dd0e3f
	.xword	0x37e8d3b69dc8cdd5
	.xword	0xfb9b4c55a1478717
	.xword	0x0fc937b453fc9545
	.xword	0x1d8fbb11af3a4df3
	.xword	0x98d86d07dbbdca6b
	.xword	0x9570fcb0fb20ef15
	.xword	0x751b1ae7c6302994
	.xword	0x29375237621f74bd
	.xword	0xdd2eed12614fa768
	.xword	0x61448a9580c5f5b2
	.xword	0x2a198b9b4409b669
	.xword	0xa2e914e4e43cfae4
	.xword	0xd251c4d348c13f1f
	.xword	0x4976b4747b1b2b8d
	.xword	0xd0f9a8fb82237b1f
	.xword	0x889f5827871141b6
	.xword	0x91ef4685143b2d91
	.xword	0x4da24880e6a026a8
	.xword	0xc24287c566f648d1
	.xword	0x8e78ab8d4988423e
	.xword	0x9a53a0d6f729ba5c
	.xword	0xc171c1d57e84528a
	.xword	0xcfac818f23687e23
	.xword	0xec79458ae77c3b65
	.xword	0x64d75dd1a0818e5f
	.xword	0xf9bd885602acc875
	.xword	0x3b0121034e6e71ca
	.xword	0x99f72c2be0e3e497
	.xword	0xd12ed5b834500128
	.xword	0x93d888a9ab586f90
	.xword	0x66f74ae7b7468fc3
	.xword	0x694cf7caed80c89c
	.xword	0x0fa81c45b4149515
	.xword	0x37a07ad988473ef6
	.xword	0x1d406a864616610a
	.xword	0x7126ad7df8e06543
	.xword	0xbdb029ee5cc16d6c
	.xword	0xf9d331cc0b10f5ef
	.xword	0x4a5d05a233cf2db1
	.xword	0xb1a16e1f50e1f1ae
	.xword	0x24156645f5e300cd
	.xword	0x1f4497f6b833a786
	.xword	0x1e521a3a8c6a90c7
	.align 0x20000
	.data
data_start_5:

	.xword	0xb39f294df940b1ce
	.xword	0xca41ae597d394b17
	.xword	0x5d6c8ca2e3a40ef0
	.xword	0x15e78a9da27e3f95
	.xword	0x945a9598f2b2e769
	.xword	0x3868ce6662cede2e
	.xword	0xd5cdd58c0ebdc304
	.xword	0x2ebdd1f056e59ef2
	.xword	0xcbde11b336bb8cbd
	.xword	0x0cb409095a98baad
	.xword	0x7cba6ea532f07949
	.xword	0xc93996d490bb69b8
	.xword	0xabf2195add2b6ae4
	.xword	0xbd10ba0974a4231f
	.xword	0xe1f35b46b822dff6
	.xword	0xde6d4378331cc7ea
	.xword	0xfa5eaa1d5b0a3419
	.xword	0xd7187a92266c7eda
	.xword	0x51e7ed917e0679ee
	.xword	0xc26f15f79aaa6821
	.xword	0x9d0148b255fd61c7
	.xword	0xe49f713f21349e2c
	.xword	0x3ec4e05a36ca5442
	.xword	0xf577c416e6b8f114
	.xword	0xa333e9981628ca01
	.xword	0x745e4b9a02a0d0e3
	.xword	0x6fdb4971ce30584c
	.xword	0xabf8f0106b939bd0
	.xword	0x6cfc71f199cf4304
	.xword	0x366539d6bd5154b2
	.xword	0xfa6401ce30379aa3
	.xword	0x64ad8a03e45a18be
	.xword	0xce9bb5fc1f2877f3
	.xword	0x1d557096d3175da0
	.xword	0x7367ec9a127bb656
	.xword	0xca26f0df9b8834d1
	.xword	0xa650444314dc686a
	.xword	0xae05e9e5b963f49f
	.xword	0x09b4058e210ceaaa
	.xword	0xfcf3d7aedc67c059
	.xword	0x776dd48bfede7f8b
	.xword	0x47e0a1090aca6e21
	.xword	0x16971bd86303bb76
	.xword	0x99413123bd908576
	.xword	0xf77b6ccc03e96f6b
	.xword	0x5c922e31c3018284
	.xword	0x0854d3aa3c6b02e5
	.xword	0xb650a33169ef0171
	.xword	0xcabafc7a5cb511b0
	.xword	0xd9634433967ca0bb
	.xword	0x5f2b29df8035f0e9
	.xword	0x8169480fba0fa536
	.xword	0xd0903e348d59c1bb
	.xword	0x3b2c06bfbdbca879
	.xword	0xfb74e556f1720c11
	.xword	0x3d9896b5fb7c7ea4
	.xword	0xbf91fa9a71c0c56c
	.xword	0x830e8554fc4cc356
	.xword	0xd892b818cabf5b39
	.xword	0xb48480c82573b299
	.xword	0x2f4e691b5abf7f6b
	.xword	0xd2bf5422286968f3
	.xword	0xf69654af1edc5b56
	.xword	0xe971681719f8ab18
	.xword	0xd618e3c056759bfe
	.xword	0x656e216cee6aea02
	.xword	0x8a03f67e40bf9493
	.xword	0x8633e564c1dac442
	.xword	0x14c4967a936b355d
	.xword	0x4d317fe34a8501fa
	.xword	0x12b31aff4930a1de
	.xword	0x05021fa792d9dbde
	.xword	0x81ce160a1006a40d
	.xword	0x82821141b12ddbcd
	.xword	0x524a27267f6e77e5
	.xword	0x28435c77ceec1c4c
	.xword	0xe330c0fa613da52b
	.xword	0xccc3ed9f7c5cbd10
	.xword	0xe3714d061a1a0069
	.xword	0xc8dc4ac44776c595
	.xword	0xb016774c77a0a949
	.xword	0xa62bd5b4cae970a6
	.xword	0xc665772caeb91158
	.xword	0x930185ec2c716600
	.xword	0x9c784d8a0e1a242d
	.xword	0xd814a5d70c924299
	.xword	0x0a37f01c8d2c9263
	.xword	0xbc700b7c629a9a48
	.xword	0x6e5527194c0c841e
	.xword	0x57b87e85a8229f25
	.xword	0x7195e8817bfde480
	.xword	0x4d805da44885cf5c
	.xword	0x34ff3b4dad7a98f8
	.xword	0xdb693d0d58509135
	.xword	0x903d09633a05a892
	.xword	0xf1072f75c3420b52
	.xword	0x5fdb22f2082e3c26
	.xword	0x54fd9bca6ca6b599
	.xword	0xd1ba4952933d9adb
	.xword	0x0a3d2046109a8c9e
	.xword	0x4d4975df67b007db
	.xword	0x488ca7cfc9ee5664
	.xword	0xf11cb5074a200f2c
	.xword	0xe7cab07578a57f7a
	.xword	0x24d7f04af2cfcbcf
	.xword	0xa936c2acc8e424dd
	.xword	0xbf76f996191b6d4f
	.xword	0xba053f5c6569bfd9
	.xword	0xbc1da615d7838084
	.xword	0xe868e7d24f738986
	.xword	0xc91709554bf74e7e
	.xword	0x6a31b1b05e02c616
	.xword	0x103507bf2f996eff
	.xword	0x7344fa0e1f9726a4
	.xword	0x0d5e74ac35f8c00b
	.xword	0x17746c5c3f945319
	.xword	0x0cf244ad86617f2a
	.xword	0x746a7eb246581ff3
	.xword	0x5e5f8fe0e395820f
	.xword	0x09cacd6fb5f77493
	.xword	0x834d294e2b0a79c1
	.xword	0x4ecbcf8e26ea2159
	.xword	0x792dbc5184df135f
	.xword	0x1e629f5b68468523
	.xword	0x456255c2bddc1f35
	.xword	0x55ce0225367f4203
	.xword	0x52db3cabc32d2340
	.xword	0x5fe360009644bfc2
	.xword	0x9aeb519916a25ed8
	.xword	0x5bf57e8ae188a5a6
	.xword	0x0536761d5fca6295
	.xword	0x96eee1645b075370
	.xword	0x5b641385548728bc
	.xword	0x882693fd94b12a2e
	.xword	0x6937c796274ab493
	.xword	0x8fa0b06393230c4a
	.xword	0xc0e403c44fa2629d
	.xword	0xd111e9e2ee042a93
	.xword	0x5c3b6ecec352e093
	.xword	0x5fecd8147bae587f
	.xword	0x36146dab11b38ba3
	.xword	0x889aeaeb3a90347a
	.xword	0xcf1943a00b61a806
	.xword	0x4080f10271b40594
	.xword	0xbbdac9394e3a9d72
	.xword	0xdbb64bc3a1e2c5b3
	.xword	0x62287c9321324fcd
	.xword	0x9a25a8db42430937
	.xword	0x8fdd7d772b871aef
	.xword	0x55cc6ca420980703
	.xword	0x1a3e82003b77f5f7
	.xword	0x893f55a9624a272c
	.xword	0x7263bd903eb0884f
	.xword	0x99215e5b47eb26fc
	.xword	0x8d0cd0f1961b2e01
	.xword	0x8397214c8d785fb4
	.xword	0xcb71320fcf21e9cb
	.xword	0x9b4ddfa1421bd38b
	.xword	0x848625ed47366890
	.xword	0x020215abc8f41c88
	.xword	0x40a786c59739bba3
	.xword	0xf3a8c230a832313d
	.xword	0xf40c90ca0cfba71d
	.xword	0x3032afcf3ee22ed8
	.xword	0x79fae5b1a31afbd4
	.xword	0x15a9beb0457f8f99
	.xword	0x616dc62747f2ac40
	.xword	0xb4e51c329bf28a21
	.xword	0x204ed2b572dafb21
	.xword	0x3a6178e2d3101e4c
	.xword	0x628a13ff923ef1f2
	.xword	0xcc4c49c54c9e26d1
	.xword	0x18904e669cb32093
	.xword	0x1e5de449ad7f49ba
	.xword	0x5161dbd3bc5fb410
	.xword	0x8d787bbc75152aec
	.xword	0xecc5e780420955d7
	.xword	0x6826e2afbb55ff35
	.xword	0xb779fe61ed462cab
	.xword	0xda13a170401e0093
	.xword	0xa1d599f7890e1f3a
	.xword	0x3b87fc595c06d938
	.xword	0xf7736c4d06c92cfd
	.xword	0x0a1f21e178162b9f
	.xword	0x6becfbd2a3d545c4
	.xword	0x51e8a38ce6fd0908
	.xword	0x256cce2dc7898706
	.xword	0xf4dd10c5f81229b6
	.xword	0x73eb64c3ed48226c
	.xword	0xab6815ab47078a7a
	.xword	0x3dce943fcd6b6f10
	.xword	0x979a74577d2ad09d
	.xword	0x7319f24c7c30f9b3
	.xword	0x4e8e81c3ea0fb83d
	.xword	0xc4f96952f82c7e63
	.xword	0xff8a30beca98c3f4
	.xword	0xd42e12804895a95c
	.xword	0x152220b7b61de002
	.xword	0x990828a9ef8c9e35
	.xword	0x84df061dcf596a7c
	.xword	0xad87da562375c42b
	.xword	0x69c3ff64acdcbcef
	.xword	0xa2aa45c50df3ead1
	.xword	0x3a0cf4da49855caa
	.xword	0xa990b23a07143bc7
	.xword	0xda01f5f21b556bee
	.xword	0xe2adb50e63c81f2f
	.xword	0xcedbdae755b8b162
	.xword	0x9861c7654bbbb71a
	.xword	0x7e0b79b6c680c0c5
	.xword	0x57ccb5a233c30707
	.xword	0xe4414e4727a888c8
	.xword	0x3546b99cc3868453
	.xword	0x5c2798582c27da3e
	.xword	0x1e0fe8532f4fc01b
	.xword	0xe92aeb844a1e1630
	.xword	0xefbb2b189be8ab30
	.xword	0x3c1c7ef3e4fe2360
	.xword	0x26afff8359f6885f
	.xword	0x98b18091b1e61e88
	.xword	0xbab091aaa06f71f5
	.xword	0xed27752bfa39c5fc
	.xword	0x19d679d86696a616
	.xword	0x7e4949e6759f60f2
	.xword	0x096f062632f7ae70
	.xword	0x57e09ebb2f44da47
	.xword	0xd81165fd9e7c3320
	.xword	0x3fbabe1d2bb1c8a7
	.xword	0x257898eb97ed3242
	.xword	0x4358927dbd058024
	.xword	0xc7d6b6a60b90401c
	.xword	0x648aa2bdc3e4e0bf
	.xword	0xa09a828f2c7bc26c
	.xword	0xf66c4a19e36ae2e8
	.xword	0x9e2a82eec2a0472b
	.xword	0xf31f6f369160100b
	.xword	0x906fe002ab1628a6
	.xword	0x05120fdbb10570cf
	.xword	0x32c5e43e68829f26
	.xword	0x8a643384d4534dd0
	.xword	0xbd6f9315590c0a27
	.xword	0x879914e2e32dfe7d
	.xword	0xed31bb6c4ac8a10b
	.xword	0x896bb9e853ec078e
	.xword	0x3d51598bc8998fd0
	.xword	0x13cff6fb61118cbb
	.xword	0x2305a1df9568d9d4
	.xword	0xbfd41139fb21384d
	.xword	0xd8795df4316181ad
	.xword	0x164ae7cba2df14db
	.xword	0x8c8c7d06698b8a42
	.xword	0x945c0730e69b9df2
	.xword	0x019dfcbfc44f5d11
	.xword	0xb51a61d25ab4438d
	.xword	0x244073993bfbedf9
	.xword	0xcfd3c76161b54991
	.align 0x40000
	.data
data_start_6:

	.xword	0x2c80be0d9450525a
	.xword	0xa8f6b152aa13ae84
	.xword	0xd180a05f89a6a763
	.xword	0xd46c0999899573c6
	.xword	0x29bedf82ad6b7492
	.xword	0xc3556bba5e59ae28
	.xword	0x9e0485bff5d85438
	.xword	0xc9f7dd26358e0232
	.xword	0xdc4e67d1098e18c8
	.xword	0x52d0c578e59a1f22
	.xword	0xf0c6aa3fd1abe5c3
	.xword	0x274995082d844d72
	.xword	0x80d4db5c4bd0d72a
	.xword	0xd32b6ad7d42a9ea2
	.xword	0xc0e4671cb3c574fb
	.xword	0xa3aee3ab45cf3d77
	.xword	0x00f78b189cce8136
	.xword	0xfacc275822825ea2
	.xword	0x37384d74ccdd8548
	.xword	0xbedf4e1cb4666066
	.xword	0x762be07c6e17ad42
	.xword	0x63d11e333a502b05
	.xword	0xd166065ad1080d8f
	.xword	0x3b2a4da85f4c854a
	.xword	0x5bab8b0bb80958c8
	.xword	0x3dbad61e8d94721a
	.xword	0x95e04bc028c5bf8c
	.xword	0xb70dc761ce7be5a3
	.xword	0xae763e916813ef1b
	.xword	0x1e03ff9fde767150
	.xword	0xaea587f4f5ef449f
	.xword	0x1464f18617003b25
	.xword	0x06cbaede0ac29fda
	.xword	0xd4f41a9e14436189
	.xword	0x534d7c48079a295e
	.xword	0x21eccb12e8e6f5e0
	.xword	0xd4c29daa335d1e02
	.xword	0x3d7774f9992ca701
	.xword	0xb1a2ceb920deee43
	.xword	0xca01af40a70f293f
	.xword	0x7df4872ef972cbce
	.xword	0xe8a4efd088b4ecb4
	.xword	0x9ea4d6cc3c3c2383
	.xword	0x03cf8c26d3c5f450
	.xword	0x5e08327300ed7ac5
	.xword	0x883ef59fe19867a8
	.xword	0xbeb9079b66e6249a
	.xword	0x752a377bdd5be6cd
	.xword	0xaea48959036bf04a
	.xword	0xfa7d0637124b19d6
	.xword	0x2f3e83d25d5e3c0d
	.xword	0x290605a63914de42
	.xword	0xc94f855783071279
	.xword	0x1032741cb47ca4fc
	.xword	0x8cff091706f8468e
	.xword	0x8689ab770d748207
	.xword	0x4e4bcce4880158f4
	.xword	0x4602d75ec51a6595
	.xword	0x3a753b3ee83ffd58
	.xword	0xe744d846949ae45e
	.xword	0x7e00b777d6573bb7
	.xword	0xae9dde96c0b7ccef
	.xword	0xd2a15b69fbfb2765
	.xword	0x3a5e7429c101963a
	.xword	0x3baffd11400fa2e0
	.xword	0xf2c73399fdc46cce
	.xword	0xcd63d8000510b703
	.xword	0x3d750c2e6f61c8a7
	.xword	0x31823e057da77d65
	.xword	0x0f8aef2828c1042f
	.xword	0xa457cbbc08fabd3f
	.xword	0x100c05d9deda979b
	.xword	0x1d2c6fda013d7d9b
	.xword	0x502473c8b0b9f79d
	.xword	0x2a71134c2468127d
	.xword	0x1ffd792f6ed07ac7
	.xword	0xc27967b8040480fc
	.xword	0x57adf3aaea9339de
	.xword	0x66437e358547e7ba
	.xword	0x738cfa5e2a626a51
	.xword	0x398f81da0dc13a3e
	.xword	0xe8599ec32c949735
	.xword	0xe875729508cda8e7
	.xword	0xacf0f96ce4ad9cad
	.xword	0x860b83d0dbe6a263
	.xword	0xd6f8bfa353dd169b
	.xword	0x381a6927af623ce7
	.xword	0x9f197c7e617a208d
	.xword	0x626218c46442832d
	.xword	0x18e0e80cfa92cba5
	.xword	0x20138786de559d0d
	.xword	0x2d5c376e82c45135
	.xword	0x58b5274bb88ac603
	.xword	0xcf417264645c72a8
	.xword	0x506782f336de8dc7
	.xword	0x2165cd9c5259b9fd
	.xword	0xe983fd81cc8a69b1
	.xword	0xa74926b7e7211fa6
	.xword	0x53799ed2b67a6819
	.xword	0xc9a8196a24fdced1
	.xword	0xdd2a8672c32b0b3a
	.xword	0x143f373b430eb23a
	.xword	0xd9973f316210d8a1
	.xword	0x53e7cc3461217a49
	.xword	0xfbad5955a130c70b
	.xword	0x015672d14be32faf
	.xword	0x546176b6c63c5923
	.xword	0x716caab168f1614b
	.xword	0x159ae0cd0e5cecd2
	.xword	0xaec10a1eb44bc81b
	.xword	0x3b4a06b1b0735414
	.xword	0x3d33ec202c9cddaa
	.xword	0x7967467f24779f55
	.xword	0x20aa0a10f59bf6b4
	.xword	0x136f0c5ce638e928
	.xword	0xb7323b168caf4222
	.xword	0x75678654eaaab7da
	.xword	0xe5936246bd6ff9dc
	.xword	0x6471e6f658d52210
	.xword	0x6ffad5a685c84a4c
	.xword	0x43deeb7b21261acb
	.xword	0x43c6e3a096c91acb
	.xword	0xbeba88bd786b9ac2
	.xword	0xb1ff8e52909d420e
	.xword	0xae6dffb199695c8c
	.xword	0x64076fd0e4b4a29c
	.xword	0xf4c6284e60acf2ec
	.xword	0xef135d713a41c1e4
	.xword	0x2f6ed82cc9993a02
	.xword	0x8e1d9d31e4645dc1
	.xword	0x1a86d5379a67c4fe
	.xword	0x0e974edd3f8c7290
	.xword	0x548e5a16bfd6b364
	.xword	0x8875beb3032e9c1c
	.xword	0x4f10bafbc18bb25d
	.xword	0xa44738667463c4fa
	.xword	0xc125ab73efb67d3e
	.xword	0xa48c52df72282835
	.xword	0x19e2552bfab93062
	.xword	0xdbb8b75b36985ec0
	.xword	0xe485e9dc2e9afe11
	.xword	0xe3cb58f32a3fc87e
	.xword	0xef70892a1150b9e1
	.xword	0xc3239746be166014
	.xword	0xf67f2e617573eba0
	.xword	0x93b833f79ebee236
	.xword	0xcfb62f4a27b0d1c0
	.xword	0xc7c58e4c49ef3543
	.xword	0x93634197a04989e7
	.xword	0xdc0e8fc098d4ef50
	.xword	0xe67e50e84739e312
	.xword	0xca299f58b20f20f1
	.xword	0xc4eccc02c72b64a0
	.xword	0x6fabdb053c930530
	.xword	0x29407db2be443709
	.xword	0xc46cdea647baf15e
	.xword	0xe92300f00c49aeb7
	.xword	0x817bc41dbb84a5e7
	.xword	0x82ae9ab33cc06966
	.xword	0x3476fe1742158816
	.xword	0xa0d3bd50ea34689f
	.xword	0xf0184825a0541808
	.xword	0x4a26d60d97c8bf6c
	.xword	0x61731fbfcbeb9dd3
	.xword	0xc8dc3c04577d6469
	.xword	0x9a93f4186d0b4e1c
	.xword	0x4d50b477c1038347
	.xword	0x8c6dc948c5be7792
	.xword	0x3025903ac04b4da8
	.xword	0x053fa23b28391f5f
	.xword	0xef217bada0e7a490
	.xword	0x1f863033c8a54b44
	.xword	0xbe77ad50cda8da13
	.xword	0xd3c6388d33864dd9
	.xword	0xe55d1e9d5561395e
	.xword	0x09515e94b0044f73
	.xword	0xf5cee9ec21d59c69
	.xword	0x77b4c85db7ab55bd
	.xword	0x7b08be2f56d18a3f
	.xword	0x46782d71b1c74842
	.xword	0xb9f7935c2b4d0078
	.xword	0x8b62f1a2a5bda261
	.xword	0x3ef0ed7a0d17ff71
	.xword	0x21b3eb18223e2763
	.xword	0x564f69b2bb03344a
	.xword	0x10b1ab5469bd6b7e
	.xword	0x3cfad2d8056dc4ab
	.xword	0xd84762ab2f6bee31
	.xword	0x132f6640c4f712f4
	.xword	0xf5c90d5becddf907
	.xword	0xa378cedf905e8017
	.xword	0x3b26dad4526c4a04
	.xword	0xe7a4431ec32d92d3
	.xword	0xfb249e22a2332614
	.xword	0x6e5b32f34431434e
	.xword	0x0b9bcc0c2fceff89
	.xword	0xa4e7a17147d4c609
	.xword	0x8e24e20c824e099f
	.xword	0xe42605c730eb1619
	.xword	0xac7f7083f038e2d4
	.xword	0x9a3a8c0c05740925
	.xword	0x7f3da1fbbf0e9224
	.xword	0x2e76294bb4d15043
	.xword	0x7c1c32dffb4530c3
	.xword	0xa3dc2dda8716dea5
	.xword	0x1daa5d1c40e017ae
	.xword	0xf56ef79b90ed900c
	.xword	0xcbb9ff1ce987c312
	.xword	0x119204c93e034d0d
	.xword	0xc0dd53cf663fbb39
	.xword	0xe19a921871b46699
	.xword	0x869f8c52a0b82e9b
	.xword	0xc6a5beffb5b6916d
	.xword	0x375cd376ddb0bcdf
	.xword	0xbbcf74a4846729ee
	.xword	0xeb4f5321720534e1
	.xword	0xa1d1cbc06fcac06d
	.xword	0x0bc5a2322647ce90
	.xword	0xcdb5618d1a3e06e8
	.xword	0x97d8653606404111
	.xword	0xdc4ad456ceb01bba
	.xword	0xafdb6de8bb798649
	.xword	0x5a1deadf72580bb8
	.xword	0x563b4bf761524e00
	.xword	0x284322f48b07aed8
	.xword	0xd27401864d9d3313
	.xword	0x2907a48993f92d85
	.xword	0x8a675bbb5a0f2e80
	.xword	0xfaecdfec55f6b3f8
	.xword	0xc14b2ec6c3bf7e4f
	.xword	0x7d18fb6497ffc8bb
	.xword	0xcb7c8b93610c1c33
	.xword	0xd1b12621576a046f
	.xword	0x70e3891705983960
	.xword	0xe5c390680f7d3aba
	.xword	0x2d641d81032933c9
	.xword	0xddcf38cf7a442008
	.xword	0x24feac5c3e7dc370
	.xword	0x658b38c09250f208
	.xword	0xa5810aacfc8f231b
	.xword	0xdc351e152ee37f27
	.xword	0x125db3a28c862698
	.xword	0x11af60e941050c9e
	.xword	0x2d25699f7f16433f
	.xword	0x3e39af6ebd32f74e
	.xword	0x9b726b79952f9504
	.xword	0x3ef8bd378baf9a62
	.xword	0xd4bcca12981cc6f0
	.xword	0x2dff611b395d3234
	.xword	0xd2bd1c2ce6b32476
	.xword	0x85acb6fba9256c99
	.xword	0x3a05d2d26002a800
	.xword	0x202adb87be43d558
	.xword	0x35866752ca56f73c
	.xword	0x48158b15ac9a458c
	.xword	0xdb0cc920b43b51f6
	.align 0x80000
	.data
data_start_7:

	.xword	0x7b734d952f8c9311
	.xword	0xb8d5581586b30574
	.xword	0x3c40b3f8a42f3034
	.xword	0x1c763109cdc8df4f
	.xword	0x7fb84d028d84f537
	.xword	0x8bbc8d483346fcab
	.xword	0xdaf8730aa72bc9e1
	.xword	0x0e79a1654375a301
	.xword	0x10a8faf4dc28ef14
	.xword	0xe9cf1392f68fa9f4
	.xword	0xd39fa049d58c14cc
	.xword	0xaf74de7f3f4c46e9
	.xword	0x92d74921359af631
	.xword	0x75f6595b26f84c63
	.xword	0x81f49a2bed34073c
	.xword	0x93b27f7537ec0a5f
	.xword	0x13e0b39973e9c007
	.xword	0x4e5622bb48da134b
	.xword	0x05c6c94a95d63f4a
	.xword	0x22d04b9c4e909e38
	.xword	0x1c4e0b2b85da1c85
	.xword	0x7bf034506aa78da3
	.xword	0x0dea7afe2c5237b2
	.xword	0x61bc3d2199362c22
	.xword	0xa3633b0ca572c4f7
	.xword	0x64a737dfcd69047c
	.xword	0x660ad83820525021
	.xword	0x2331305da2e8dd30
	.xword	0x3b484a540dad80bd
	.xword	0x3154b9e57f635e3b
	.xword	0xc973b96c3f5cdba3
	.xword	0x8c6ae1134e0665dc
	.xword	0x832f324f0a99c922
	.xword	0x9c618291ae3480a9
	.xword	0xbdd28bc4e765d077
	.xword	0x2d4a7a49386e360a
	.xword	0x643f3f142f8dc8cc
	.xword	0x91bc34f8f2c34fec
	.xword	0xe796b1ff81eeb13c
	.xword	0x962a04c304abb6e1
	.xword	0x6fbc883357893060
	.xword	0x04a0ed5ca081bdef
	.xword	0x3c26bfae43fcc049
	.xword	0xc1d96e7c18c67723
	.xword	0x089d31b4c46eb89e
	.xword	0x8e48ceb7b4ccc766
	.xword	0xb093c01dcbb32325
	.xword	0xe01cc4f95d544743
	.xword	0x958dd2c87223f71d
	.xword	0x2b81b83bc63d2a8c
	.xword	0x062246c71e18b1f5
	.xword	0x8f8deb38b310ef07
	.xword	0x7f0c7c5ec5e468b4
	.xword	0x5bdc03f138a7a27f
	.xword	0xe088ee8201af74fa
	.xword	0x9c71db0e69c4b84b
	.xword	0x206c07dc1badcf3f
	.xword	0xe25bc6c3fc46d423
	.xword	0x50eb83bb9d69f91e
	.xword	0x431d578eff6d3484
	.xword	0x1176d7cfc5a063af
	.xword	0xe7b5eac189679d23
	.xword	0xc41ee025f83c6eea
	.xword	0x5ec7230d598c99d3
	.xword	0x2c96493f302a345d
	.xword	0x3a4b13315ee67f47
	.xword	0x5f35cbcd44ffd753
	.xword	0x4edf586872e26217
	.xword	0xcb14abd1e8fe92f9
	.xword	0x7a8f32db8d768bba
	.xword	0xe8fa277bbf70ae69
	.xword	0x2de21db1e8a358fe
	.xword	0xbf04da315e6e62eb
	.xword	0xdf8170338de4d16c
	.xword	0x3bc85beeac544891
	.xword	0xd30c8d12a599483c
	.xword	0x2351dd7fb7aee4a5
	.xword	0x7ba9efc834f01e15
	.xword	0xd9c4dc182a1eed54
	.xword	0x03be1184f0b0cca7
	.xword	0xc83d88fcb033db61
	.xword	0xe529220b28d0ed7e
	.xword	0x3ed506e92f8595c7
	.xword	0x92bef262277d9905
	.xword	0x8dff8fbeb2218c5c
	.xword	0x21027de481e05876
	.xword	0x63734edc46f85349
	.xword	0x840302040fdea650
	.xword	0x1f944f38aa93a2fd
	.xword	0x684c90e62ee7878f
	.xword	0x3b7cc82b09b5b02c
	.xword	0x8bc85421fd833761
	.xword	0x0b096acbbf9f06ec
	.xword	0xb7ad3f8fb0fa2f2f
	.xword	0x31901e9986d5d801
	.xword	0x1a7e3350c315b080
	.xword	0x8c945b86a9abdeca
	.xword	0x4eae7fb2211047bb
	.xword	0x27c12c2a98be664f
	.xword	0x80e771430795b01b
	.xword	0xf817e6025dc787af
	.xword	0x2640fc29c55d1641
	.xword	0x8bf7221ca58b45b5
	.xword	0x04edbd307cb8e86b
	.xword	0xe5213d317c144832
	.xword	0x6a9de2a56b912313
	.xword	0xbaed415cdb358016
	.xword	0x374709e356e4e381
	.xword	0x2bbe77f9ba3b52a4
	.xword	0x7fe03dd6b6266ae9
	.xword	0x3c79dea293e4216c
	.xword	0x9f72ea6f0d36a08f
	.xword	0xb718f5b0410fa471
	.xword	0x36c7a5b619f3da2e
	.xword	0x0841d8d84ff33ded
	.xword	0x91eea8eb418ec45c
	.xword	0xbd303c685c862e65
	.xword	0x8ac03fba50fc902b
	.xword	0x4d92f9b2f565747e
	.xword	0xff761596add03f18
	.xword	0xf51a1d75ea6c1f4a
	.xword	0x2337ed8b41549a5b
	.xword	0x3a3bbeef0c0936c6
	.xword	0x050ebcea1e327ef9
	.xword	0x59946fa879c00852
	.xword	0xa4bea858a10ad2f2
	.xword	0xe1f042b61ed39386
	.xword	0x696654a929f9fabc
	.xword	0xf38b02341e802484
	.xword	0xa8fd5b77c2efed17
	.xword	0x5df106651262937b
	.xword	0x3e439e18053cbbb2
	.xword	0x736168d22db8dd75
	.xword	0x729609bd598c2248
	.xword	0x1ccb781c912ed80e
	.xword	0x529b5dabc1ecaa77
	.xword	0xc1b58f17cf9b5014
	.xword	0x0812d9ad3d1be5b2
	.xword	0xe5f8ca84c2f67c2d
	.xword	0x22d6db239af0fd7e
	.xword	0x4b69f2688113428e
	.xword	0xc952221aac6dbbbb
	.xword	0x4dbf610cb236d2ee
	.xword	0xe41a745530e3a9cc
	.xword	0xc8eb78054f86a1e6
	.xword	0xa24e081716e59940
	.xword	0xd6594bc55ee4f4aa
	.xword	0x66fb7334f7d8e9cb
	.xword	0xb7c6a248c17d63c5
	.xword	0xeece9a57700b3f3f
	.xword	0x98b5397ca0ad75ba
	.xword	0x22e8d116c94e2fd6
	.xword	0x9f6a91848df344f4
	.xword	0xce194b8562b62f52
	.xword	0x4021efcbd90c246f
	.xword	0x6e39ea8b1457f49f
	.xword	0x96c30ba8ad9de6a6
	.xword	0x57940e0554e400b7
	.xword	0x6567179a9ddeddf8
	.xword	0x5b76bff368899713
	.xword	0xf50f108fb28fe1ad
	.xword	0x5ce984c612a6ac02
	.xword	0xf984f0a1433593b1
	.xword	0xa8a560234aba3458
	.xword	0x220480b6e60adde5
	.xword	0x7c4be4438481da2d
	.xword	0x6ea6803cd1520c22
	.xword	0xd6d97a56e6c7a8c0
	.xword	0x2591d9e1fafdff11
	.xword	0x622523fbfd65d4d9
	.xword	0xe7d6ea64fade572a
	.xword	0x5c97b23e549e8c6e
	.xword	0x42382e5735bfb112
	.xword	0xb63a371bca76658a
	.xword	0xce0e9d48e2b5cfc4
	.xword	0x60d7787c5092c889
	.xword	0xcb88e52f956ab71e
	.xword	0x2bfac60d861bad12
	.xword	0xefc0dacbd6caa3cb
	.xword	0x398352da4e2c5cd3
	.xword	0x59afeaace143c46b
	.xword	0x78a212dbc09cbd5a
	.xword	0xce3b73ae5f9c2720
	.xword	0x803d5056303c72a8
	.xword	0x6e2e76bbe3b3b23d
	.xword	0xc0dae8dbc7a62d09
	.xword	0x271267b2d29e813e
	.xword	0x44b11696917d06ba
	.xword	0xbd3cd6453fed648c
	.xword	0x4e0a2eec20b60101
	.xword	0xa1f957c7ab264ada
	.xword	0xca251a3d767785d8
	.xword	0xb66385b8007f2362
	.xword	0xf08874e803c479d3
	.xword	0xc6d1c38ee9e41728
	.xword	0xbbbfd11665c4207f
	.xword	0x42d4303445532f70
	.xword	0xffa6ed3263572f95
	.xword	0xa9af3204ddb33042
	.xword	0x5b634d5f5a6df0cb
	.xword	0xcfec991d207645fd
	.xword	0x87e7fd4b0c72f245
	.xword	0xef3f7b9be752f518
	.xword	0xaf1dbfd123899ee1
	.xword	0xabce4803c4e0ecd9
	.xword	0xe71eb80f7eeda614
	.xword	0x542f84177721d68b
	.xword	0x6707dbd681fa6d53
	.xword	0xde88e84858e7b82b
	.xword	0xbe3e6e486aa815c7
	.xword	0xdfb93105731409de
	.xword	0x7f4833ee9927b757
	.xword	0x6876a698cba8d50d
	.xword	0xbec6edb80540504f
	.xword	0x016ff265dfc57e0c
	.xword	0x0679fb50e5366da9
	.xword	0xd2f5f84421ec69e6
	.xword	0x2e7ab00084579ab9
	.xword	0x22e52ad4fc40df48
	.xword	0xdd7ca55f4bfabdca
	.xword	0x7c1ef0862f1d56ec
	.xword	0xe97285f4e8961b73
	.xword	0xbce3d98f1f83f885
	.xword	0x9b1ed8550c979c6d
	.xword	0x9b6f40fa4fff9ee9
	.xword	0xd584fe6c497c3652
	.xword	0x9984aa617142c97c
	.xword	0x1866745dc1a4ab12
	.xword	0xd3f28bc0a026eab8
	.xword	0xc8a8edae90459b28
	.xword	0x72251716f6124466
	.xword	0x2832420e1e26a0be
	.xword	0x0f38ad99659e1aa1
	.xword	0x1d7a789e709062a9
	.xword	0x188577f77e8b487a
	.xword	0x2c3bb15b24f0e589
	.xword	0xb09b2961713e0717
	.xword	0x1d598998811d331c
	.xword	0x240f69bb94082b63
	.xword	0xe2e444315971de14
	.xword	0xd7e40496e5d7ca99
	.xword	0x0cc9e2b060dbadd3
	.xword	0xea184cabc6904e19
	.xword	0x9f845b1fbf1d273f
	.xword	0x5b25f23f31a841e7
	.xword	0xb7703ab758a35a00
	.xword	0xaf94f9679bd0bb2a
	.xword	0xafc005b3563f93fd
	.xword	0xcd9605926389d255
	.xword	0x278d5bc01d484723
	.xword	0x01335bd567e2100f
	.xword	0xfb26863ae4595b91
	.xword	0x363fcab4636b7c4d
	.xword	0x3ddfea344b48a852
	.xword	0x67a91c268bb005bd
	.xword	0x1388b7af2bfea235



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
