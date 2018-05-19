// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4411.s
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
   random seed:	439422607
   Jal pc_oor_wkarnd.j:	
********************************************************************************/



#define NO_TRAPCHECK
#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "enable_traps.h"

#define H_HT0_Instruction_access_exception_0x08
#define My_HT0_Instruction_access_exception_0x08 \
        wrpr %r19, %r0, %tnpc; \
        done; \
        nop ; \
        nop ; \
        nop ; \
        nop ; \
        nop ; \
        nop

#define H_T0_Instruction_access_exception_0x08
#define My_T0_Instruction_access_exception_0x08 \
        wrpr %r19, %r0, %tnpc; \
        done; \
        nop ; \
        nop ; \
        nop ; \
        nop ; \
        nop ; \
        nop

#define H_T0_Trap_Instruction_1 
#define My_T0_Trap_Instruction_1 \
	rdpr %tnpc, %r17; \
	sethi 0x1, %r16; \
	sllx %r16, 0x30, %r18; \
	or %r18, %r17, %r17; \
	wrpr %r17, %tnpc; \
	done; \
	nop; \
	nop

#define H_T0_Trap_Instruction_2 
#define My_T0_Trap_Instruction_2 \
	rdpr %tnpc, %r17; \
	sethi 0x1, %r16; \
	sllx %r16, 0x31, %r18; \
	or %r18, %r17, %r17; \
	wrpr %r17, %tnpc; \
	done; \
        nop; \
        nop

#include "boot.s"

!SIMS: -non_shared
!SIMS: +spis

.text
.global main

main:

	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	setx  0xa2980276d01594d9, %r16, %r16
	setx  0x022406b59e2893a1, %r16, %r17
	setx  0xbb3427297d24c9ce, %r16, %r18
	setx  0xdabeaad5e9e9a9f7, %r16, %r19
	setx  0x7c0eab962ffb0a64, %r16, %r20
	setx  0x7838ad525b0ccf52, %r16, %r21
	setx  0x26e9ab538ca17eb8, %r16, %r22
	setx  0x153d3e6b95603ba1, %r16, %r23
	setx  0x8a843c40daaf2f10, %r16, %r24
	setx  0x097a9affee265dae, %r16, %r25
	setx  0x5f98a7712befb405, %r16, %r26
	setx  0xffddd5ab5dc57365, %r16, %r27
	setx  0xf1f1d666ae2559ae, %r16, %r28
	setx  0x2292332a633208cd, %r16, %r29
	setx  0x26e73dc6a15b23bc, %r16, %r30
	setx  0xef2518ae283bd376, %r16, %r31
	setx  0x0000000000000d30, %r16, %r10
	setx  0x0000000000000200, %r16, %r11
	setx  0x00000000000000d0, %r16, %r12
	setx  0x0000000000000a40, %r16, %r13
	setx  0x00000000000007f0, %r16, %r14
	setx  0x0000000000000da0, %r16, %r15
	setx  0x0000000000000091, %r16, %r9
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
thr3_nuke_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_0), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc29652f  ! 4: ANDN_I	andn 	%r5, 0x052f, %r30
	.word 0xbcc12290  ! 4: ADDCcc_I	addccc 	%r4, 0x0290, %r30
	.word 0xb209800c  ! 4: AND_R	and 	%r6, %r12, %r25
	.word 0xb8b9400a  ! 4: XNORcc_R	xnorcc 	%r5, %r10, %r28
	.word 0xb529400b  ! 4: SLL_R	sll 	%r5, %r11, %r26
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xb498e7d5  ! 4: XORcc_I	xorcc 	%r3, 0x07d5, %r26
	.word 0xb538d00c  ! 4: SRAX_R	srax	%r3, %r12, %r26
thr3_nuke_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1), 16, 16)) -> intp(0, 2, 1)
	.word 0xba19400c  ! 4: XOR_R	xor 	%r5, %r12, %r29
	.word 0xb619ab81  ! 4: XOR_I	xor 	%r6, 0x0b81, %r27
	.word 0xa802000f  ! 4: ADD_R	add 	%r8, %r15, %r20
	.word 0xaf39d00a  ! 4: SRAX_R	srax	%r7, %r10, %r23
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
	.word 0xb211a53b  ! 4: OR_I	or 	%r6, 0x053b, %r25
	.word 0xbd28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r30
thr3_nuke_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_2), 16, 16)) -> intp(1, 2, 1)
	.word 0xb429800b  ! 4: ANDN_R	andn 	%r6, %r11, %r26
	.word 0xb9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r28
	.word 0xb5297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r26
	.word 0xa881000b  ! 4: ADDcc_R	addcc 	%r4, %r11, %r20
	.word 0xb0c0eede  ! 4: ADDCcc_I	addccc 	%r3, 0x0ede, %r24
	.word 0xab30d00d  ! 4: SRLX_R	srlx	%r3, %r13, %r21
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xb4a9e35d  ! 4: ANDNcc_I	andncc 	%r7, 0x035d, %r26
	.word 0xb139d00d  ! 4: SRAX_R	srax	%r7, %r13, %r24
	.word 0xb880800f  ! 4: ADDcc_R	addcc 	%r2, %r15, %r28
	.word 0xb928900b  ! 4: SLLX_R	sllx	%r2, %r11, %r28
thr3_hw_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_3), 16, 16)) -> intp(0, 0, 1)
	.word 0xacb0800a  ! 4: ORNcc_R	orncc 	%r2, %r10, %r22
	.word 0xab64180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xba99e15c  ! 4: XORcc_I	xorcc 	%r7, 0x015c, %r29
	.word 0xa9323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0xb564180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae29250b  ! 4: ANDN_I	andn 	%r4, 0x050b, %r23
thr3_nuke_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_4), 16, 16)) -> intp(0, 2, 1)
	.word 0xb331a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r25
	.word 0xb49a000e  ! 4: XORcc_R	xorcc 	%r8, %r14, %r26
	.word 0xb40a2f95  ! 4: AND_I	and 	%r8, 0x0f95, %r26
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb690800a  ! 4: ORcc_R	orcc 	%r2, %r10, %r27
	.word 0xb410800c  ! 4: OR_R	or 	%r2, %r12, %r26
	.word 0xb4b1800c  ! 4: ORNcc_R	orncc 	%r6, %r12, %r26
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc11ebf6  ! 4: OR_I	or 	%r7, 0x0bf6, %r30
thr3_nuke_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_5), 16, 16)) -> intp(1, 2, 1)
	.word 0xba09a783  ! 4: AND_I	and 	%r6, 0x0783, %r29
	.word 0xb130b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r24
	.word 0xaa922751  ! 4: ORcc_I	orcc 	%r8, 0x0751, %r21
	.word 0xb378c40d  ! 4: MOVR_R	move	%r3, %r13, %r25
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xb939100b  ! 4: SRAX_R	srax	%r4, %r11, %r28
thr3_hw_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_6), 16, 16)) -> intp(1, 0, 1)
	.word 0xae41000a  ! 4: ADDC_R	addc 	%r4, %r10, %r23
	.word 0xb938d00f  ! 4: SRAX_R	srax	%r3, %r15, %r28
	.word 0xa92a000a  ! 4: SLL_R	sll 	%r8, %r10, %r20
	.word 0xb440c00d  ! 4: ADDC_R	addc 	%r3, %r13, %r26
	.word 0xb219a845  ! 4: XOR_I	xor 	%r6, 0x0845, %r25
	.word 0xba82000b  ! 4: ADDcc_R	addcc 	%r8, %r11, %r29
	.word 0xb292000a  ! 4: ORcc_R	orcc 	%r8, %r10, %r25
thr3_nuke_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_7), 16, 16)) -> intp(0, 2, 1)
	.word 0xac40c00e  ! 4: ADDC_R	addc 	%r3, %r14, %r22
	.word 0xbcc2000f  ! 4: ADDCcc_R	addccc 	%r8, %r15, %r30
	.word 0xb6a8ef75  ! 4: ANDNcc_I	andncc 	%r3, 0x0f75, %r27
	.word 0xb489000f  ! 4: ANDcc_R	andcc 	%r4, %r15, %r26
	.word 0xb728e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r27
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa38a2a4  ! 4: XNOR_I	xnor 	%r2, 0x02a4, %r21
thr3_nuke_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_8), 16, 16)) -> intp(0, 2, 1)
	.word 0xb819800d  ! 4: XOR_R	xor 	%r6, %r13, %r28
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb139500e  ! 4: SRAX_R	srax	%r5, %r14, %r24
	.word 0xa92a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r20
thr3_nuke_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_9), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8b9000a  ! 4: XNORcc_R	xnorcc 	%r4, %r10, %r28
	.word 0xb631c00d  ! 4: ORN_R	orn 	%r7, %r13, %r27
	.word 0xac31a15a  ! 4: ORN_I	orn 	%r6, 0x015a, %r22
	.word 0xae41e98d  ! 4: ADDC_I	addc 	%r7, 0x098d, %r23
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
	.word 0xb7392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r27
	.word 0xaaa9000f  ! 4: ANDNcc_R	andncc 	%r4, %r15, %r21
thr3_nuke_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_10), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa99ab00  ! 4: XORcc_I	xorcc 	%r6, 0x0b00, %r21
	.word 0xb2b12b05  ! 4: ORNcc_I	orncc 	%r4, 0x0b05, %r25
	.word 0xaa08800e  ! 4: AND_R	and 	%r2, %r14, %r21
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(0, 3, 1)
	.word 0xb178c40d  ! 4: MOVR_R	move	%r3, %r13, %r24
	.word 0xb328d00e  ! 4: SLLX_R	sllx	%r3, %r14, %r25
	.word 0xaea9603e  ! 4: ANDNcc_I	andncc 	%r5, 0x003e, %r23
thr3_hw_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_11), 16, 16)) -> intp(0, 0, 1)
	.word 0xb001e4be  ! 4: ADD_I	add 	%r7, 0x04be, %r24
	.word 0xb2b1e183  ! 4: ORNcc_I	orncc 	%r7, 0x0183, %r25
	.word 0xb4b8a045  ! 4: XNORcc_I	xnorcc 	%r2, 0x0045, %r26
	.word 0xab293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r21
	.word 0xacb928c0  ! 4: XNORcc_I	xnorcc 	%r4, 0x08c0, %r22
	.word 0xa9316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r20
	.word 0xad796401  ! 4: MOVR_I	move	%r5, 0x1, %r22
thr3_hw_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_12), 16, 16)) -> intp(1, 0, 1)
	.word 0xa800eb3b  ! 4: ADD_I	add 	%r3, 0x0b3b, %r20
	.word 0xb489e0ec  ! 4: ANDcc_I	andcc 	%r7, 0x00ec, %r26
	.word 0xaf31000d  ! 4: SRL_R	srl 	%r4, %r13, %r23
	.word 0xb241800a  ! 4: ADDC_R	addc 	%r6, %r10, %r25
	.word 0xae01800e  ! 4: ADD_R	add 	%r6, %r14, %r23
	.word 0xa809265f  ! 4: AND_I	and 	%r4, 0x065f, %r20
thr3_nuke_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_13), 16, 16)) -> intp(0, 2, 1)
	.word 0xb9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r28
	.word 0xb1316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r24
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd31e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r30
	.word 0xb538800c  ! 4: SRA_R	sra 	%r2, %r12, %r26
thr3_nuke_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_14), 16, 16)) -> intp(0, 2, 1)
	.word 0xa931100b  ! 4: SRLX_R	srlx	%r4, %r11, %r20
	.word 0xbab0a959  ! 4: ORNcc_I	orncc 	%r2, 0x0959, %r29
	.word 0xba89200d  ! 4: ANDcc_I	andcc 	%r4, 0x000d, %r29
	.word 0xb439400f  ! 4: XNOR_R	xnor 	%r5, %r15, %r26
	.word 0xad796401  ! 4: MOVR_I	move	%r5, 0xf, %r22
	.word 0xaa09e31b  ! 4: AND_I	and 	%r7, 0x031b, %r21
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(0, 3, 1)
	.word 0xa929000a  ! 4: SLL_R	sll 	%r4, %r10, %r20
	.word 0xb2b1800f  ! 4: ORNcc_R	orncc 	%r6, %r15, %r25
	.word 0xb9396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r28
	.word 0xb009c00b  ! 4: AND_R	and 	%r7, %r11, %r24
thr3_hw_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_15), 16, 16)) -> intp(1, 0, 1)
	.word 0xa882000a  ! 4: ADDcc_R	addcc 	%r8, %r10, %r20
	.word 0xaaba000a  ! 4: XNORcc_R	xnorcc 	%r8, %r10, %r21
	.word 0xb779040c  ! 4: MOVR_R	move	%r4, %r12, %r27
	.word 0xb009ef15  ! 4: AND_I	and 	%r7, 0x0f15, %r24
	.word 0xb611000c  ! 4: OR_R	or 	%r4, %r12, %r27
	.word 0xad3a100d  ! 4: SRAX_R	srax	%r8, %r13, %r22
	.word 0xb4b0800a  ! 4: ORNcc_R	orncc 	%r2, %r10, %r26
thr3_hw_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_16), 16, 16)) -> intp(0, 0, 1)
	.word 0xb52a000a  ! 4: SLL_R	sll 	%r8, %r10, %r26
	.word 0xa838c00c  ! 4: XNOR_R	xnor 	%r3, %r12, %r20
	.word 0xb2c1800a  ! 4: ADDCcc_R	addccc 	%r6, %r10, %r25
	.word 0xb61a000b  ! 4: XOR_R	xor 	%r8, %r11, %r27
	.word 0xad28d00a  ! 4: SLLX_R	sllx	%r3, %r10, %r22
	.word 0xaa81800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r21
thr3_hw_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_17), 16, 16)) -> intp(1, 0, 1)
	.word 0xb63a24f7  ! 4: XNOR_I	xnor 	%r8, 0x04f7, %r27
	.word 0xaab0800c  ! 4: ORNcc_R	orncc 	%r2, %r12, %r21
	.word 0xaa00e91b  ! 4: ADD_I	add 	%r3, 0x091b, %r21
	.word 0xad39000f  ! 4: SRA_R	sra 	%r4, %r15, %r22
	.word 0xac8928cc  ! 4: ANDcc_I	andcc 	%r4, 0x08cc, %r22
	.word 0xaa812c7b  ! 4: ADDcc_I	addcc 	%r4, 0x0c7b, %r21
	.word 0xbc90800e  ! 4: ORcc_R	orcc 	%r2, %r14, %r30
thr3_nuke_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_18), 16, 16)) -> intp(1, 2, 1)
	.word 0xae022825  ! 4: ADD_I	add 	%r8, 0x0825, %r23
	.word 0xbb29000f  ! 4: SLL_R	sll 	%r4, %r15, %r29
	.word 0xb441e06c  ! 4: ADDC_I	addc 	%r7, 0x006c, %r26
	.word 0xb291a199  ! 4: ORcc_I	orcc 	%r6, 0x0199, %r25
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc9a000f  ! 4: XORcc_R	xorcc 	%r8, %r15, %r30
	.word 0xb239e53b  ! 4: XNOR_I	xnor 	%r7, 0x053b, %r25
	.word 0xa8b12779  ! 4: ORNcc_I	orncc 	%r4, 0x0779, %r20
	.word 0xb6c1aeda  ! 4: ADDCcc_I	addccc 	%r6, 0x0eda, %r27
thr3_nuke_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_19), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0a8abd7  ! 4: ANDNcc_I	andncc 	%r2, 0x0bd7, %r24
	.word 0xbc3127cc  ! 4: ORN_I	orn 	%r4, 0x07cc, %r30
	.word 0xb031800d  ! 4: ORN_R	orn 	%r6, %r13, %r24
	.word 0xb5296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r26
	.word 0xaac0e7e6  ! 4: ADDCcc_I	addccc 	%r3, 0x07e6, %r21
	.word 0xb6b1800f  ! 4: ORNcc_R	orncc 	%r6, %r15, %r27
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa18800c  ! 4: XOR_R	xor 	%r2, %r12, %r21
thr3_hw_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_20), 16, 16)) -> intp(0, 0, 1)
	.word 0xac89c00b  ! 4: ANDcc_R	andcc 	%r7, %r11, %r22
	.word 0xac116109  ! 4: OR_I	or 	%r5, 0x0109, %r22
	.word 0xb964180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb829e0b4  ! 4: ANDN_I	andn 	%r7, 0x00b4, %r28
	.word 0xac30800b  ! 4: ORN_R	orn 	%r2, %r11, %r22
	.word 0xb400800a  ! 4: ADD_R	add 	%r2, %r10, %r26
	.word 0xb612000d  ! 4: OR_R	or 	%r8, %r13, %r27
thr3_hw_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_21), 16, 16)) -> intp(1, 0, 1)
	.word 0xb528f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r26
	.word 0xaea9000b  ! 4: ANDNcc_R	andncc 	%r4, %r11, %r23
	.word 0xb619400e  ! 4: XOR_R	xor 	%r5, %r14, %r27
	.word 0xac11800d  ! 4: OR_R	or 	%r6, %r13, %r22
	.word 0xbab9800c  ! 4: XNORcc_R	xnorcc 	%r6, %r12, %r29
	.word 0xb810a114  ! 4: OR_I	or 	%r2, 0x0114, %r28
	.word 0xb211000c  ! 4: OR_R	or 	%r4, %r12, %r25
thr3_hw_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_22), 16, 16)) -> intp(0, 0, 1)
	.word 0xae122ca2  ! 4: OR_I	or 	%r8, 0x0ca2, %r23
	.word 0xb841400c  ! 4: ADDC_R	addc 	%r5, %r12, %r28
	.word 0xba392167  ! 4: XNOR_I	xnor 	%r4, 0x0167, %r29
	.word 0xbb396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r29
	.word 0xb031400d  ! 4: ORN_R	orn 	%r5, %r13, %r24
	.word 0xbd30d00d  ! 4: SRLX_R	srlx	%r3, %r13, %r30
	.word 0xb0c1800b  ! 4: ADDCcc_R	addccc 	%r6, %r11, %r24
thr3_nuke_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_23), 16, 16)) -> intp(0, 2, 1)
	.word 0xab38c00c  ! 4: SRA_R	sra 	%r3, %r12, %r21
	.word 0xb809400d  ! 4: AND_R	and 	%r5, %r13, %r28
thr3_resum_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_23), 16, 16)) -> intp(0, 3, 1)
	.word 0xac38ecd9  ! 4: XNOR_I	xnor 	%r3, 0x0cd9, %r22
thr3_nuke_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_24), 16, 16)) -> intp(0, 2, 1)
	.word 0xae39a67b  ! 4: XNOR_I	xnor 	%r6, 0x067b, %r23
	.word 0xbd31100b  ! 4: SRLX_R	srlx	%r4, %r11, %r30
	.word 0xb4aa2c85  ! 4: ANDNcc_I	andncc 	%r8, 0x0c85, %r26
	.word 0xb881800d  ! 4: ADDcc_R	addcc 	%r6, %r13, %r28
thr3_resum_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_24), 16, 16)) -> intp(0, 3, 1)
	.word 0xba30aed0  ! 4: ORN_I	orn 	%r2, 0x0ed0, %r29
	.word 0xae31c00e  ! 4: ORN_R	orn 	%r7, %r14, %r23
	.word 0xaf29800a  ! 4: SLL_R	sll 	%r6, %r10, %r23
thr3_nuke_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_25), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa912e7d  ! 4: ORcc_I	orcc 	%r4, 0x0e7d, %r21
	.word 0xb4a9000d  ! 4: ANDNcc_R	andncc 	%r4, %r13, %r26
thr3_resum_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25), 16, 16)) -> intp(1, 3, 1)
	.word 0xa839400e  ! 4: XNOR_R	xnor 	%r5, %r14, %r20
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_26), 16, 16)) -> intp(0, 0, 1)
	.word 0xba39c00d  ! 4: XNOR_R	xnor 	%r7, %r13, %r29
	.word 0xac30a7af  ! 4: ORN_I	orn 	%r2, 0x07af, %r22
	.word 0xb931000b  ! 4: SRL_R	srl 	%r4, %r11, %r28
	.word 0xa8ba000a  ! 4: XNORcc_R	xnorcc 	%r8, %r10, %r20
	.word 0xab30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r21
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_27), 16, 16)) -> intp(0, 0, 1)
	.word 0xb280800e  ! 4: ADDcc_R	addcc 	%r2, %r14, %r25
	.word 0xba98c00a  ! 4: XORcc_R	xorcc 	%r3, %r10, %r29
	.word 0xbab0c00b  ! 4: ORNcc_R	orncc 	%r3, %r11, %r29
	.word 0xba41e224  ! 4: ADDC_I	addc 	%r7, 0x0224, %r29
	.word 0xb0192dfd  ! 4: XOR_I	xor 	%r4, 0x0dfd, %r24
	.word 0xbb29900a  ! 4: SLLX_R	sllx	%r6, %r10, %r29
thr3_hw_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_28), 16, 16)) -> intp(1, 0, 1)
	.word 0xb330b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r25
	.word 0xba2a2a5f  ! 4: ANDN_I	andn 	%r8, 0x0a5f, %r29
	.word 0xb2b2295a  ! 4: ORNcc_I	orncc 	%r8, 0x095a, %r25
	.word 0xaec1000f  ! 4: ADDCcc_R	addccc 	%r4, %r15, %r23
	.word 0xac32000f  ! 4: ORN_R	orn 	%r8, %r15, %r22
	.word 0xb489c00c  ! 4: ANDcc_R	andcc 	%r7, %r12, %r26
	.word 0xb2a9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r25
thr3_nuke_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_29), 16, 16)) -> intp(0, 2, 1)
	.word 0xb37a040d  ! 4: MOVR_R	move	%r8, %r13, %r25
	.word 0xbb30f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r29
	.word 0xb839c00d  ! 4: XNOR_R	xnor 	%r7, %r13, %r28
	.word 0xaa19eba8  ! 4: XOR_I	xor 	%r7, 0x0ba8, %r21
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb729f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r27
	.word 0xae08aaae  ! 4: AND_I	and 	%r2, 0x0aae, %r23
thr3_resum_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29), 16, 16)) -> intp(0, 3, 1)
	.word 0xba28c00d  ! 4: ANDN_R	andn 	%r3, %r13, %r29
thr3_nuke_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_30), 16, 16)) -> intp(1, 2, 1)
	.word 0xb931c00f  ! 4: SRL_R	srl 	%r7, %r15, %r28
	.word 0xbb31d00e  ! 4: SRLX_R	srlx	%r7, %r14, %r29
thr3_resum_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30), 16, 16)) -> intp(1, 3, 1)
	.word 0xb779840c  ! 4: MOVR_R	move	%r6, %r12, %r27
	.word 0xa93a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r20
	.word 0xba90800c  ! 4: ORcc_R	orcc 	%r2, %r12, %r29
thr3_nuke_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_31), 16, 16)) -> intp(0, 2, 1)
	.word 0xb139c00d  ! 4: SRA_R	sra 	%r7, %r13, %r24
	.word 0xaac164dd  ! 4: ADDCcc_I	addccc 	%r5, 0x04dd, %r21
thr3_resum_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4aa2c3d  ! 4: ANDNcc_I	andncc 	%r8, 0x0c3d, %r26
	.word 0xab293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r21
	.word 0xa8816673  ! 4: ADDcc_I	addcc 	%r5, 0x0673, %r20
thr3_hw_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_32), 16, 16)) -> intp(0, 0, 1)
	.word 0xb728c00c  ! 4: SLL_R	sll 	%r3, %r12, %r27
	.word 0xad31d00d  ! 4: SRLX_R	srlx	%r7, %r13, %r22
	.word 0xbc41400f  ! 4: ADDC_R	addc 	%r5, %r15, %r30
	.word 0xb439215a  ! 4: XNOR_I	xnor 	%r4, 0x015a, %r26
	.word 0xac09800d  ! 4: AND_R	and 	%r6, %r13, %r22
	.word 0xb8016a34  ! 4: ADD_I	add 	%r5, 0x0a34, %r28
thr3_nuke_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_33), 16, 16)) -> intp(0, 2, 1)
	.word 0xab312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r21
	.word 0xac11a9d0  ! 4: OR_I	or 	%r6, 0x09d0, %r22
	.word 0xaca9c00c  ! 4: ANDNcc_R	andncc 	%r7, %r12, %r22
	.word 0xb618a162  ! 4: XOR_I	xor 	%r2, 0x0162, %r27
	.word 0xb8c0ea96  ! 4: ADDCcc_I	addccc 	%r3, 0x0a96, %r28
	.word 0xb609c00b  ! 4: AND_R	and 	%r7, %r11, %r27
thr3_resum_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_33), 16, 16)) -> intp(0, 3, 1)
	.word 0xacb9e68d  ! 4: XNORcc_I	xnorcc 	%r7, 0x068d, %r22
	.word 0xac39c00f  ! 4: XNOR_R	xnor 	%r7, %r15, %r22
thr3_hw_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_34), 16, 16)) -> intp(0, 0, 1)
	.word 0xb430ab23  ! 4: ORN_I	orn 	%r2, 0x0b23, %r26
	.word 0xb609800c  ! 4: AND_R	and 	%r6, %r12, %r27
	.word 0xa800c00b  ! 4: ADD_R	add 	%r3, %r11, %r20
	.word 0xbaa8c00d  ! 4: ANDNcc_R	andncc 	%r3, %r13, %r29
	.word 0xbc1128c8  ! 4: OR_I	or 	%r4, 0x08c8, %r30
	.word 0xbc822866  ! 4: ADDcc_I	addcc 	%r8, 0x0866, %r30
	.word 0xbc092853  ! 4: AND_I	and 	%r4, 0x0853, %r30
thr3_hw_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_35), 16, 16)) -> intp(1, 0, 1)
	.word 0xac09abcb  ! 4: AND_I	and 	%r6, 0x0bcb, %r22
	.word 0xa9317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r20
	.word 0xbab96e63  ! 4: XNORcc_I	xnorcc 	%r5, 0x0e63, %r29
	.word 0xa8a9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r20
	.word 0xb499400c  ! 4: XORcc_R	xorcc 	%r5, %r12, %r26
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_36), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0c1c00c  ! 4: ADDCcc_R	addccc 	%r7, %r12, %r24
	.word 0xae91a9c4  ! 4: ORcc_I	orcc 	%r6, 0x09c4, %r23
	.word 0xab31000d  ! 4: SRL_R	srl 	%r4, %r13, %r21
	.word 0xac31e4ab  ! 4: ORN_I	orn 	%r7, 0x04ab, %r22
	.word 0xb332100f  ! 4: SRLX_R	srlx	%r8, %r15, %r25
thr3_resum_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_36), 16, 16)) -> intp(0, 3, 1)
	.word 0xaeb9400e  ! 4: XNORcc_R	xnorcc 	%r5, %r14, %r23
	.word 0xb8b1400e  ! 4: ORNcc_R	orncc 	%r5, %r14, %r28
	.word 0xb932000c  ! 4: SRL_R	srl 	%r8, %r12, %r28
thr3_nuke_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_37), 16, 16)) -> intp(0, 2, 1)
	.word 0xaeba000a  ! 4: XNORcc_R	xnorcc 	%r8, %r10, %r23
	.word 0xae01c00c  ! 4: ADD_R	add 	%r7, %r12, %r23
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb4b124a7  ! 4: ORNcc_I	orncc 	%r4, 0x04a7, %r26
thr3_resum_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6412a47  ! 4: ADDC_I	addc 	%r4, 0x0a47, %r27
	.word 0xac89800b  ! 4: ANDcc_R	andcc 	%r6, %r11, %r22
	.word 0xb4922614  ! 4: ORcc_I	orcc 	%r8, 0x0614, %r26
thr3_hw_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_38), 16, 16)) -> intp(1, 0, 1)
	.word 0xb828800d  ! 4: ANDN_R	andn 	%r2, %r13, %r28
	.word 0xbc11000f  ! 4: OR_R	or 	%r4, %r15, %r30
	.word 0xb092000f  ! 4: ORcc_R	orcc 	%r8, %r15, %r24
	.word 0xba39400e  ! 4: XNOR_R	xnor 	%r5, %r14, %r29
	.word 0xb610ac34  ! 4: OR_I	or 	%r2, 0x0c34, %r27
	.word 0xbb3a000b  ! 4: SRA_R	sra 	%r8, %r11, %r29
thr3_hw_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_39), 16, 16)) -> intp(1, 0, 1)
	.word 0xae89000e  ! 4: ANDcc_R	andcc 	%r4, %r14, %r23
	.word 0xac00c00d  ! 4: ADD_R	add 	%r3, %r13, %r22
	.word 0xa892000f  ! 4: ORcc_R	orcc 	%r8, %r15, %r20
	.word 0xb091e80c  ! 4: ORcc_I	orcc 	%r7, 0x080c, %r24
	.word 0xb098e009  ! 4: XORcc_I	xorcc 	%r3, 0x0009, %r24
	.word 0xba9a23a6  ! 4: XORcc_I	xorcc 	%r8, 0x03a6, %r29
thr3_nuke_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_40), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb31e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r29
	.word 0xbcb1000c  ! 4: ORNcc_R	orncc 	%r4, %r12, %r30
	.word 0xb33a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r25
	.word 0xbb78a401  ! 4: MOVR_I	move	%r2, 0x1, %r29
	.word 0xb682000e  ! 4: ADDcc_R	addcc 	%r8, %r14, %r27
	.word 0xac822710  ! 4: ADDcc_I	addcc 	%r8, 0x0710, %r22
	.word 0xb289eec4  ! 4: ANDcc_I	andcc 	%r7, 0x0ec4, %r25
thr3_resum_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_40), 16, 16)) -> intp(1, 3, 1)
	.word 0xad30900c  ! 4: SRLX_R	srlx	%r2, %r12, %r22
	.word 0xbc91000b  ! 4: ORcc_R	orcc 	%r4, %r11, %r30
	.word 0xad3a100f  ! 4: SRAX_R	srax	%r8, %r15, %r22
	.word 0xb0a9ecae  ! 4: ANDNcc_I	andncc 	%r7, 0x0cae, %r24
thr3_hw_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_41), 16, 16)) -> intp(1, 0, 1)
	.word 0xb629800e  ! 4: ANDN_R	andn 	%r6, %r14, %r27
	.word 0xb6a8e978  ! 4: ANDNcc_I	andncc 	%r3, 0x0978, %r27
	.word 0xa8aa000f  ! 4: ANDNcc_R	andncc 	%r8, %r15, %r20
	.word 0xba11800a  ! 4: OR_R	or 	%r6, %r10, %r29
	.word 0xa939100e  ! 4: SRAX_R	srax	%r4, %r14, %r20
	.word 0xae80800c  ! 4: ADDcc_R	addcc 	%r2, %r12, %r23
thr3_hw_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_42), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa1a000a  ! 4: XOR_R	xor 	%r8, %r10, %r21
	.word 0xac99400e  ! 4: XORcc_R	xorcc 	%r5, %r14, %r22
	.word 0xae8a000a  ! 4: ANDcc_R	andcc 	%r8, %r10, %r23
	.word 0xb2b9400b  ! 4: XNORcc_R	xnorcc 	%r5, %r11, %r25
	.word 0xb2122469  ! 4: OR_I	or 	%r8, 0x0469, %r25
	.word 0xaa38e884  ! 4: XNOR_I	xnor 	%r3, 0x0884, %r21
	.word 0xb564180e  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_43), 16, 16)) -> intp(1, 2, 1)
	.word 0xbcc12def  ! 4: ADDCcc_I	addccc 	%r4, 0x0def, %r30
	.word 0xb428800e  ! 4: ANDN_R	andn 	%r2, %r14, %r26
	.word 0xb298ae4f  ! 4: XORcc_I	xorcc 	%r2, 0x0e4f, %r25
	.word 0xbc00e67d  ! 4: ADD_I	add 	%r3, 0x067d, %r30
thr3_resum_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb38c00b  ! 4: SRA_R	sra 	%r3, %r11, %r29
thr3_hw_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_44), 16, 16)) -> intp(1, 0, 1)
	.word 0xbd79440a  ! 4: MOVR_R	move	%r5, %r10, %r30
	.word 0xb089e9ec  ! 4: ANDcc_I	andcc 	%r7, 0x09ec, %r24
	.word 0xab31400f  ! 4: SRL_R	srl 	%r5, %r15, %r21
	.word 0xb611c00d  ! 4: OR_R	or 	%r7, %r13, %r27
	.word 0xb418c00b  ! 4: XOR_R	xor 	%r3, %r11, %r26
	.word 0xab79a401  ! 4: MOVR_I	move	%r6, 0xb, %r21
	.word 0xad7a2401  ! 4: MOVR_I	move	%r8, 0xb, %r22
thr3_hw_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_45), 16, 16)) -> intp(1, 0, 1)
	.word 0xac09800c  ! 4: AND_R	and 	%r6, %r12, %r22
	.word 0xaac0e49d  ! 4: ADDCcc_I	addccc 	%r3, 0x049d, %r21
	.word 0xbc30800b  ! 4: ORN_R	orn 	%r2, %r11, %r30
	.word 0xbb31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r29
	.word 0xb739400f  ! 4: SRA_R	sra 	%r5, %r15, %r27
	.word 0xb6c2000c  ! 4: ADDCcc_R	addccc 	%r8, %r12, %r27
	.word 0xb929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r28
thr3_nuke_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_46), 16, 16)) -> intp(1, 2, 1)
	.word 0xae9a000f  ! 4: XORcc_R	xorcc 	%r8, %r15, %r23
	.word 0xb0816601  ! 4: ADDcc_I	addcc 	%r5, 0x0601, %r24
thr3_resum_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46), 16, 16)) -> intp(1, 3, 1)
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_47), 16, 16)) -> intp(1, 2, 1)
	.word 0xb739900f  ! 4: SRAX_R	srax	%r6, %r15, %r27
	.word 0xaa9a000d  ! 4: XORcc_R	xorcc 	%r8, %r13, %r21
	.word 0xbcc1400f  ! 4: ADDCcc_R	addccc 	%r5, %r15, %r30
	.word 0xaa88c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r21
thr3_resum_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_47), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8b12a43  ! 4: ORNcc_I	orncc 	%r4, 0x0a43, %r20
	.word 0xa9317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r20
	.word 0xa8b12a51  ! 4: ORNcc_I	orncc 	%r4, 0x0a51, %r20
thr3_nuke_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_48), 16, 16)) -> intp(0, 2, 1)
	.word 0xac2a2951  ! 4: ANDN_I	andn 	%r8, 0x0951, %r22
	.word 0xaca96321  ! 4: ANDNcc_I	andncc 	%r5, 0x0321, %r22
	.word 0xb329f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r25
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(0, 3, 1)
	.word 0xb331b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r25
	.word 0xb691a9e7  ! 4: ORcc_I	orcc 	%r6, 0x09e7, %r27
thr3_nuke_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_49), 16, 16)) -> intp(1, 2, 1)
	.word 0xb929e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r28
	.word 0xb7312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r27
	.word 0xb811a59a  ! 4: OR_I	or 	%r6, 0x059a, %r28
	.word 0xba28a9df  ! 4: ANDN_I	andn 	%r2, 0x09df, %r29
	.word 0xb099000b  ! 4: XORcc_R	xorcc 	%r4, %r11, %r24
	.word 0xb238800a  ! 4: XNOR_R	xnor 	%r2, %r10, %r25
thr3_resum_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_49), 16, 16)) -> intp(1, 3, 1)
	.word 0xaec1000e  ! 4: ADDCcc_R	addccc 	%r4, %r14, %r23
	.word 0xaaa8e82e  ! 4: ANDNcc_I	andncc 	%r3, 0x082e, %r21
	.word 0xa928b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r20
	.word 0xbd64180e  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_50), 16, 16)) -> intp(1, 0, 1)
	.word 0xae28aa67  ! 4: ANDN_I	andn 	%r2, 0x0a67, %r23
	.word 0xad29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r22
	.word 0xbc0928c0  ! 4: AND_I	and 	%r4, 0x08c0, %r30
	.word 0xae81a5b4  ! 4: ADDcc_I	addcc 	%r6, 0x05b4, %r23
	.word 0xacba000e  ! 4: XNORcc_R	xnorcc 	%r8, %r14, %r22
	.word 0xac8228c4  ! 4: ADDcc_I	addcc 	%r8, 0x08c4, %r22
thr3_hw_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_51), 16, 16)) -> intp(1, 0, 1)
	.word 0xbc89e16e  ! 4: ANDcc_I	andcc 	%r7, 0x016e, %r30
	.word 0xb4296cdf  ! 4: ANDN_I	andn 	%r5, 0x0cdf, %r26
	.word 0xb2a9c00c  ! 4: ANDNcc_R	andncc 	%r7, %r12, %r25
	.word 0xb331d00a  ! 4: SRLX_R	srlx	%r7, %r10, %r25
	.word 0xaec1c00c  ! 4: ADDCcc_R	addccc 	%r7, %r12, %r23
	.word 0xbb316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r29
thr3_hw_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_52), 16, 16)) -> intp(0, 0, 1)
	.word 0xb211400d  ! 4: OR_R	or 	%r5, %r13, %r25
	.word 0xb41921da  ! 4: XOR_I	xor 	%r4, 0x01da, %r26
	.word 0xb6c0800a  ! 4: ADDCcc_R	addccc 	%r2, %r10, %r27
	.word 0xb978c40c  ! 4: MOVR_R	move	%r3, %r12, %r28
	.word 0xb530900b  ! 4: SRLX_R	srlx	%r2, %r11, %r26
	.word 0xaa092b91  ! 4: AND_I	and 	%r4, 0x0b91, %r21
thr3_nuke_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_53), 16, 16)) -> intp(0, 2, 1)
	.word 0xb731000b  ! 4: SRL_R	srl 	%r4, %r11, %r27
	.word 0xb6392853  ! 4: XNOR_I	xnor 	%r4, 0x0853, %r27
	.word 0xb841e732  ! 4: ADDC_I	addc 	%r7, 0x0732, %r28
	.word 0xb409800c  ! 4: AND_R	and 	%r6, %r12, %r26
	.word 0xb8c1ef16  ! 4: ADDCcc_I	addccc 	%r7, 0x0f16, %r28
	.word 0xae38800a  ! 4: XNOR_R	xnor 	%r2, %r10, %r23
thr3_resum_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_53), 16, 16)) -> intp(0, 3, 1)
	.word 0xab312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r21
thr3_hw_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_54), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa8ba2f86  ! 4: XNORcc_I	xnorcc 	%r8, 0x0f86, %r20
	.word 0xb131c00b  ! 4: SRL_R	srl 	%r7, %r11, %r24
	.word 0xb131800d  ! 4: SRL_R	srl 	%r6, %r13, %r24
	.word 0xaa10e719  ! 4: OR_I	or 	%r3, 0x0719, %r21
	.word 0xb830800a  ! 4: ORN_R	orn 	%r2, %r10, %r28
thr3_nuke_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_55), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4816e16  ! 4: ADDcc_I	addcc 	%r5, 0x0e16, %r26
	.word 0xbb38800d  ! 4: SRA_R	sra 	%r2, %r13, %r29
	.word 0xb899c00e  ! 4: XORcc_R	xorcc 	%r7, %r14, %r28
	.word 0xae80c00a  ! 4: ADDcc_R	addcc 	%r3, %r10, %r23
	.word 0xb088c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r24
thr3_resum_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_55), 16, 16)) -> intp(1, 3, 1)
	.word 0xb564180d  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_56), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc31000e  ! 4: ORN_R	orn 	%r4, %r14, %r30
	.word 0xbc91400d  ! 4: ORcc_R	orcc 	%r5, %r13, %r30
	.word 0xb8b8a7bb  ! 4: XNORcc_I	xnorcc 	%r2, 0x07bb, %r28
	.word 0xb92a100c  ! 4: SLLX_R	sllx	%r8, %r12, %r28
	.word 0xbd312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r30
	.word 0xb018800d  ! 4: XOR_R	xor 	%r2, %r13, %r24
thr3_resum_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56), 16, 16)) -> intp(1, 3, 1)
	.word 0xb5312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r26
	.word 0xac12000e  ! 4: OR_R	or 	%r8, %r14, %r22
thr3_nuke_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_57), 16, 16)) -> intp(0, 2, 1)
	.word 0xaac2000b  ! 4: ADDCcc_R	addccc 	%r8, %r11, %r21
thr3_resum_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_57), 16, 16)) -> intp(0, 3, 1)
	.word 0xb129d00b  ! 4: SLLX_R	sllx	%r7, %r11, %r24
	.word 0xad38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r22
	.word 0xae3a29d5  ! 4: XNOR_I	xnor 	%r8, 0x09d5, %r23
thr3_hw_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_58), 16, 16)) -> intp(1, 0, 1)
	.word 0xba9a20c2  ! 4: XORcc_I	xorcc 	%r8, 0x00c2, %r29
	.word 0xbb38d00f  ! 4: SRAX_R	srax	%r3, %r15, %r29
	.word 0xb8192e5b  ! 4: XOR_I	xor 	%r4, 0x0e5b, %r28
	.word 0xac88a5f9  ! 4: ANDcc_I	andcc 	%r2, 0x05f9, %r22
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb131f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r24
	.word 0xaf293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r23
thr3_hw_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_59), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r27
	.word 0xb809000f  ! 4: AND_R	and 	%r4, %r15, %r28
	.word 0xba30a87b  ! 4: ORN_I	orn 	%r2, 0x087b, %r29
	.word 0xb93a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r28
	.word 0xacba2a80  ! 4: XNORcc_I	xnorcc 	%r8, 0x0a80, %r22
	.word 0xba00e61e  ! 4: ADD_I	add 	%r3, 0x061e, %r29
	.word 0xb539100f  ! 4: SRAX_R	srax	%r4, %r15, %r26
thr3_nuke_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_60), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8292f80  ! 4: ANDN_I	andn 	%r4, 0x0f80, %r20
	.word 0xb280a06d  ! 4: ADDcc_I	addcc 	%r2, 0x006d, %r25
	.word 0xba89000f  ! 4: ANDcc_R	andcc 	%r4, %r15, %r29
	.word 0xb529500a  ! 4: SLLX_R	sllx	%r5, %r10, %r26
	.word 0xb441e78d  ! 4: ADDC_I	addc 	%r7, 0x078d, %r26
thr3_resum_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_60), 16, 16)) -> intp(1, 3, 1)
	.word 0xb979040c  ! 4: MOVR_R	move	%r4, %r12, %r28
	.word 0xb280e497  ! 4: ADDcc_I	addcc 	%r3, 0x0497, %r25
	.word 0xac18aa1a  ! 4: XOR_I	xor 	%r2, 0x0a1a, %r22
	.word 0xb441653d  ! 4: ADDC_I	addc 	%r5, 0x053d, %r26
thr3_hw_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_61), 16, 16)) -> intp(0, 0, 1)
	.word 0xab28c00b  ! 4: SLL_R	sll 	%r3, %r11, %r21
	.word 0xb218abee  ! 4: XOR_I	xor 	%r2, 0x0bee, %r25
	.word 0xaf2a100d  ! 4: SLLX_R	sllx	%r8, %r13, %r23
	.word 0xaa39e805  ! 4: XNOR_I	xnor 	%r7, 0x0805, %r21
	.word 0xbaa9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r29
	.word 0xac996def  ! 4: XORcc_I	xorcc 	%r5, 0x0def, %r22
thr3_nuke_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_62), 16, 16)) -> intp(0, 2, 1)
	.word 0xb210800d  ! 4: OR_R	or 	%r2, %r13, %r25
	.word 0xbc01e0f5  ! 4: ADD_I	add 	%r7, 0x00f5, %r30
	.word 0xb889800f  ! 4: ANDcc_R	andcc 	%r6, %r15, %r28
	.word 0xba19000f  ! 4: XOR_R	xor 	%r4, %r15, %r29
	.word 0xae40aebf  ! 4: ADDC_I	addc 	%r2, 0x0ebf, %r23
thr3_resum_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r29
	.word 0xb219400a  ! 4: XOR_R	xor 	%r5, %r10, %r25
	.word 0xa8096890  ! 4: AND_I	and 	%r5, 0x0890, %r20
	.word 0xaa99400b  ! 4: XORcc_R	xorcc 	%r5, %r11, %r21
thr3_nuke_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_63), 16, 16)) -> intp(0, 2, 1)
	.word 0xb882207d  ! 4: ADDcc_I	addcc 	%r8, 0x007d, %r28
	.word 0xb841e18b  ! 4: ADDC_I	addc 	%r7, 0x018b, %r28
	.word 0xa8422afe  ! 4: ADDC_I	addc 	%r8, 0x0afe, %r20
	.word 0xaf39800d  ! 4: SRA_R	sra 	%r6, %r13, %r23
	.word 0xad31000a  ! 4: SRL_R	srl 	%r4, %r10, %r22
	.word 0xb409a1af  ! 4: AND_I	and 	%r6, 0x01af, %r26
thr3_resum_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_63), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8a9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r20
	.word 0xaf792401  ! 4: MOVR_I	move	%r4, 0xa, %r23
thr3_nuke_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_64), 16, 16)) -> intp(1, 2, 1)
	.word 0xba80c00e  ! 4: ADDcc_R	addcc 	%r3, %r14, %r29
	.word 0xaa11000f  ! 4: OR_R	or 	%r4, %r15, %r21
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb031800d  ! 4: ORN_R	orn 	%r6, %r13, %r24
	.word 0xae09e7e6  ! 4: AND_I	and 	%r7, 0x07e6, %r23
	.word 0xba30800f  ! 4: ORN_R	orn 	%r2, %r15, %r29
thr3_resum_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_64), 16, 16)) -> intp(1, 3, 1)
	.word 0xa929400a  ! 4: SLL_R	sll 	%r5, %r10, %r20
thr3_hw_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_65), 16, 16)) -> intp(1, 0, 1)
	.word 0xb131a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r24
	.word 0xaf39400b  ! 4: SRA_R	sra 	%r5, %r11, %r23
	.word 0xab29100d  ! 4: SLLX_R	sllx	%r4, %r13, %r21
	.word 0xaca9400a  ! 4: ANDNcc_R	andncc 	%r5, %r10, %r22
	.word 0xaa99c00d  ! 4: XORcc_R	xorcc 	%r7, %r13, %r21
	.word 0xba9a269f  ! 4: XORcc_I	xorcc 	%r8, 0x069f, %r29
	.word 0xac39800e  ! 4: XNOR_R	xnor 	%r6, %r14, %r22
thr3_hw_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_66), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc41000d  ! 4: ADDC_R	addc 	%r4, %r13, %r30
	.word 0xb2c0a264  ! 4: ADDCcc_I	addccc 	%r2, 0x0264, %r25
	.word 0xba00e420  ! 4: ADD_I	add 	%r3, 0x0420, %r29
	.word 0xaab8c00b  ! 4: XNORcc_R	xnorcc 	%r3, %r11, %r21
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb691000b  ! 4: ORcc_R	orcc 	%r4, %r11, %r27
thr3_hw_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_67), 16, 16)) -> intp(1, 0, 1)
	.word 0xb808a758  ! 4: AND_I	and 	%r2, 0x0758, %r28
	.word 0xb579e401  ! 4: MOVR_I	move	%r7, 0xffffff58, %r26
	.word 0xaab1e1f0  ! 4: ORNcc_I	orncc 	%r7, 0x01f0, %r21
	.word 0xb838e4a4  ! 4: XNOR_I	xnor 	%r3, 0x04a4, %r28
	.word 0xaa01e134  ! 4: ADD_I	add 	%r7, 0x0134, %r21
	.word 0xab30c00d  ! 4: SRL_R	srl 	%r3, %r13, %r21
	.word 0xb48a2c08  ! 4: ANDcc_I	andcc 	%r8, 0x0c08, %r26
thr3_hw_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_68), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0a8800d  ! 4: ANDNcc_R	andncc 	%r2, %r13, %r24
	.word 0xacb1a499  ! 4: ORNcc_I	orncc 	%r6, 0x0499, %r22
	.word 0xacb1800c  ! 4: ORNcc_R	orncc 	%r6, %r12, %r22
	.word 0xb009800b  ! 4: AND_R	and 	%r6, %r11, %r24
	.word 0xaca92b02  ! 4: ANDNcc_I	andncc 	%r4, 0x0b02, %r22
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb2b0c00d  ! 4: ORNcc_R	orncc 	%r3, %r13, %r25
thr3_nuke_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_69), 16, 16)) -> intp(1, 2, 1)
	.word 0xac29000e  ! 4: ANDN_R	andn 	%r4, %r14, %r22
	.word 0xbc99000b  ! 4: XORcc_R	xorcc 	%r4, %r11, %r30
	.word 0xbab0c00e  ! 4: ORNcc_R	orncc 	%r3, %r14, %r29
	.word 0xba30aacb  ! 4: ORN_I	orn 	%r2, 0x0acb, %r29
	.word 0xb639a896  ! 4: XNOR_I	xnor 	%r6, 0x0896, %r27
	.word 0xb629000c  ! 4: ANDN_R	andn 	%r4, %r12, %r27
	.word 0xb8b0e8cf  ! 4: ORNcc_I	orncc 	%r3, 0x08cf, %r28
thr3_resum_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69), 16, 16)) -> intp(1, 3, 1)
	.word 0xb480aa08  ! 4: ADDcc_I	addcc 	%r2, 0x0a08, %r26
thr3_nuke_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_70), 16, 16)) -> intp(1, 2, 1)
	.word 0xba11000b  ! 4: OR_R	or 	%r4, %r11, %r29
	.word 0xb729800d  ! 4: SLL_R	sll 	%r6, %r13, %r27
	.word 0xac31400c  ! 4: ORN_R	orn 	%r5, %r12, %r22
	.word 0xae09000f  ! 4: AND_R	and 	%r4, %r15, %r23
	.word 0xaeb0c00b  ! 4: ORNcc_R	orncc 	%r3, %r11, %r23
thr3_resum_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_70), 16, 16)) -> intp(1, 3, 1)
	.word 0xac0a000c  ! 4: AND_R	and 	%r8, %r12, %r22
thr3_nuke_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_71), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc11aa03  ! 4: OR_I	or 	%r6, 0x0a03, %r30
	.word 0xb80a2f5c  ! 4: AND_I	and 	%r8, 0x0f5c, %r28
thr3_resum_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_71), 16, 16)) -> intp(0, 3, 1)
	.word 0xba31000b  ! 4: ORN_R	orn 	%r4, %r11, %r29
thr3_hw_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_72), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8c0e76b  ! 4: ADDCcc_I	addccc 	%r3, 0x076b, %r28
	.word 0xaa9a28fb  ! 4: XORcc_I	xorcc 	%r8, 0x08fb, %r21
	.word 0xae8129a1  ! 4: ADDcc_I	addcc 	%r4, 0x09a1, %r23
	.word 0xb331800f  ! 4: SRL_R	srl 	%r6, %r15, %r25
	.word 0xb129900d  ! 4: SLLX_R	sllx	%r6, %r13, %r24
	.word 0xa899800d  ! 4: XORcc_R	xorcc 	%r6, %r13, %r20
	.word 0xbcb8800d  ! 4: XNORcc_R	xnorcc 	%r2, %r13, %r30
thr3_hw_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_73), 16, 16)) -> intp(0, 0, 1)
	.word 0xa839800c  ! 4: XNOR_R	xnor 	%r6, %r12, %r20
	.word 0xb1313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r24
	.word 0xbc89800e  ! 4: ANDcc_R	andcc 	%r6, %r14, %r30
	.word 0xb881800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r28
	.word 0xab64180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb818afe6  ! 4: XOR_I	xor 	%r2, 0x0fe6, %r28
	.word 0xb281c00c  ! 4: ADDcc_R	addcc 	%r7, %r12, %r25
thr3_nuke_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_74), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa91c00f  ! 4: ORcc_R	orcc 	%r7, %r15, %r21
	.word 0xbc08c00d  ! 4: AND_R	and 	%r3, %r13, %r30
	.word 0xb0b2000c  ! 4: ORNcc_R	orncc 	%r8, %r12, %r24
thr3_resum_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_74), 16, 16)) -> intp(1, 3, 1)
	.word 0xb138800b  ! 4: SRA_R	sra 	%r2, %r11, %r24
	.word 0xb48225f5  ! 4: ADDcc_I	addcc 	%r8, 0x05f5, %r26
thr3_hw_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_75), 16, 16)) -> intp(1, 0, 1)
	.word 0xba89400a  ! 4: ANDcc_R	andcc 	%r5, %r10, %r29
	.word 0xbb39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r29
	.word 0xb239ec5d  ! 4: XNOR_I	xnor 	%r7, 0x0c5d, %r25
	.word 0xbc08a520  ! 4: AND_I	and 	%r2, 0x0520, %r30
	.word 0xacb9000f  ! 4: XNORcc_R	xnorcc 	%r4, %r15, %r22
	.word 0xb838800a  ! 4: XNOR_R	xnor 	%r2, %r10, %r28
thr3_hw_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_76), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8b9000d  ! 4: XNORcc_R	xnorcc 	%r4, %r13, %r20
	.word 0xb131f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r24
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xba29000c  ! 4: ANDN_R	andn 	%r4, %r12, %r29
	.word 0xaec2245d  ! 4: ADDCcc_I	addccc 	%r8, 0x045d, %r23
	.word 0xa9293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r20
	.word 0xb930f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r28
thr3_hw_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_77), 16, 16)) -> intp(0, 0, 1)
	.word 0xaab1000e  ! 4: ORNcc_R	orncc 	%r4, %r14, %r21
	.word 0xac01400b  ! 4: ADD_R	add 	%r5, %r11, %r22
	.word 0xb80962fc  ! 4: AND_I	and 	%r5, 0x02fc, %r28
	.word 0xbd32100a  ! 4: SRLX_R	srlx	%r8, %r10, %r30
	.word 0xae01a6e6  ! 4: ADD_I	add 	%r6, 0x06e6, %r23
	.word 0xba38800b  ! 4: XNOR_R	xnor 	%r2, %r11, %r29
thr3_nuke_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_78), 16, 16)) -> intp(0, 2, 1)
	.word 0xbab1653e  ! 4: ORNcc_I	orncc 	%r5, 0x053e, %r29
	.word 0xaa322804  ! 4: ORN_I	orn 	%r8, 0x0804, %r21
	.word 0xb8a8ef9e  ! 4: ANDNcc_I	andncc 	%r3, 0x0f9e, %r28
	.word 0xb80a000e  ! 4: AND_R	and 	%r8, %r14, %r28
thr3_resum_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_78), 16, 16)) -> intp(0, 3, 1)
	.word 0xb429400c  ! 4: ANDN_R	andn 	%r5, %r12, %r26
	.word 0xac90800b  ! 4: ORcc_R	orcc 	%r2, %r11, %r22
	.word 0xa939c00a  ! 4: SRA_R	sra 	%r7, %r10, %r20
	.word 0xb2b8afc2  ! 4: XNORcc_I	xnorcc 	%r2, 0x0fc2, %r25
thr3_nuke_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_79), 16, 16)) -> intp(1, 2, 1)
	.word 0xb730e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r27
	.word 0xab39500e  ! 4: SRAX_R	srax	%r5, %r14, %r21
	.word 0xbb28d00a  ! 4: SLLX_R	sllx	%r3, %r10, %r29
	.word 0xb09a000c  ! 4: XORcc_R	xorcc 	%r8, %r12, %r24
thr3_resum_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_79), 16, 16)) -> intp(1, 3, 1)
	.word 0xbab92911  ! 4: XNORcc_I	xnorcc 	%r4, 0x0911, %r29
	.word 0xb888e853  ! 4: ANDcc_I	andcc 	%r3, 0x0853, %r28
	.word 0xab79a401  ! 4: MOVR_I	move	%r6, 0x853, %r21
	.word 0xb5323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r26
thr3_nuke_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_80), 16, 16)) -> intp(0, 2, 1)
	.word 0xae31e9bb  ! 4: ORN_I	orn 	%r7, 0x09bb, %r23
	.word 0xad64180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb880e4a8  ! 4: ADDcc_I	addcc 	%r3, 0x04a8, %r28
	.word 0xae91637a  ! 4: ORcc_I	orcc 	%r5, 0x037a, %r23
	.word 0xab31c00c  ! 4: SRL_R	srl 	%r7, %r12, %r21
	.word 0xb528a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r26
thr3_resum_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_80), 16, 16)) -> intp(0, 3, 1)
	.word 0xae916156  ! 4: ORcc_I	orcc 	%r5, 0x0156, %r23
thr3_nuke_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_81), 16, 16)) -> intp(0, 2, 1)
	.word 0xba39e1af  ! 4: XNOR_I	xnor 	%r7, 0x01af, %r29
	.word 0xa8ba2c59  ! 4: XNORcc_I	xnorcc 	%r8, 0x0c59, %r20
	.word 0xb8c1a9e2  ! 4: ADDCcc_I	addccc 	%r6, 0x09e2, %r28
thr3_resum_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81), 16, 16)) -> intp(0, 3, 1)
	.word 0xba8a000f  ! 4: ANDcc_R	andcc 	%r8, %r15, %r29
	.word 0xac38a7ce  ! 4: XNOR_I	xnor 	%r2, 0x07ce, %r22
thr3_hw_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_82), 16, 16)) -> intp(0, 0, 1)
	.word 0xb802000d  ! 4: ADD_R	add 	%r8, %r13, %r28
	.word 0xbb28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r29
	.word 0xb499add8  ! 4: XORcc_I	xorcc 	%r6, 0x0dd8, %r26
	.word 0xba41c00b  ! 4: ADDC_R	addc 	%r7, %r11, %r29
	.word 0xad317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r22
	.word 0xb2b0800f  ! 4: ORNcc_R	orncc 	%r2, %r15, %r25
thr3_nuke_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_83), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2b924e0  ! 4: XNORcc_I	xnorcc 	%r4, 0x04e0, %r25
	.word 0xacc1000b  ! 4: ADDCcc_R	addccc 	%r4, %r11, %r22
	.word 0xb764180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaf28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r23
	.word 0xb43a000e  ! 4: XNOR_R	xnor 	%r8, %r14, %r26
	.word 0xb028acda  ! 4: ANDN_I	andn 	%r2, 0x0cda, %r24
	.word 0xb338800f  ! 4: SRA_R	sra 	%r2, %r15, %r25
thr3_resum_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83), 16, 16)) -> intp(1, 3, 1)
	.word 0xbab0a524  ! 4: ORNcc_I	orncc 	%r2, 0x0524, %r29
	.word 0xb4b1800c  ! 4: ORNcc_R	orncc 	%r6, %r12, %r26
	.word 0xb4b1c00e  ! 4: ORNcc_R	orncc 	%r7, %r14, %r26
	.word 0xb281400e  ! 4: ADDcc_R	addcc 	%r5, %r14, %r25
thr3_nuke_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_84), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf30a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r23
	.word 0xa979c40e  ! 4: MOVR_R	move	%r7, %r14, %r20
	.word 0xb131c00e  ! 4: SRL_R	srl 	%r7, %r14, %r24
	.word 0xa828c00e  ! 4: ANDN_R	andn 	%r3, %r14, %r20
thr3_resum_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_84), 16, 16)) -> intp(1, 3, 1)
	.word 0xad39800b  ! 4: SRA_R	sra 	%r6, %r11, %r22
thr3_nuke_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_85), 16, 16)) -> intp(1, 2, 1)
	.word 0xb898800c  ! 4: XORcc_R	xorcc 	%r2, %r12, %r28
	.word 0xb018e2d1  ! 4: XOR_I	xor 	%r3, 0x02d1, %r24
	.word 0xae19e0c5  ! 4: XOR_I	xor 	%r7, 0x00c5, %r23
	.word 0xaa09400e  ! 4: AND_R	and 	%r5, %r14, %r21
	.word 0xb688a0f4  ! 4: ANDcc_I	andcc 	%r2, 0x00f4, %r27
	.word 0xac812463  ! 4: ADDcc_I	addcc 	%r4, 0x0463, %r22
	.word 0xb539c00c  ! 4: SRA_R	sra 	%r7, %r12, %r26
thr3_resum_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85), 16, 16)) -> intp(1, 3, 1)
	.word 0xb339a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r25
	.word 0xaeb9c00d  ! 4: XNORcc_R	xnorcc 	%r7, %r13, %r23
thr3_nuke_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_86), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4416f7a  ! 4: ADDC_I	addc 	%r5, 0x0f7a, %r26
	.word 0xb48a2971  ! 4: ANDcc_I	andcc 	%r8, 0x0971, %r26
	.word 0xae30800f  ! 4: ORN_R	orn 	%r2, %r15, %r23
	.word 0xb6312a62  ! 4: ORN_I	orn 	%r4, 0x0a62, %r27
	.word 0xb031800a  ! 4: ORN_R	orn 	%r6, %r10, %r24
	.word 0xb241000b  ! 4: ADDC_R	addc 	%r4, %r11, %r25
	.word 0xb429a4f4  ! 4: ANDN_I	andn 	%r6, 0x04f4, %r26
thr3_resum_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_86), 16, 16)) -> intp(0, 3, 1)
	.word 0xb930f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r28
	.word 0xaaa9c00f  ! 4: ANDNcc_R	andncc 	%r7, %r15, %r21
	.word 0xb48a000b  ! 4: ANDcc_R	andcc 	%r8, %r11, %r26
	.word 0xb628ad9c  ! 4: ANDN_I	andn 	%r2, 0x0d9c, %r27
thr3_hw_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_87), 16, 16)) -> intp(1, 0, 1)
	.word 0xac89400e  ! 4: ANDcc_R	andcc 	%r5, %r14, %r22
	.word 0xb9316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r28
	.word 0xba00a1e7  ! 4: ADD_I	add 	%r2, 0x01e7, %r29
	.word 0xb6092df9  ! 4: AND_I	and 	%r4, 0x0df9, %r27
	.word 0xba90e819  ! 4: ORcc_I	orcc 	%r3, 0x0819, %r29
	.word 0xad30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r22
thr3_nuke_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_88), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf31400c  ! 4: SRL_R	srl 	%r5, %r12, %r23
	.word 0xae99400d  ! 4: XORcc_R	xorcc 	%r5, %r13, %r23
thr3_resum_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_88), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc99000b  ! 4: XORcc_R	xorcc 	%r4, %r11, %r30
	.word 0xb4a9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r26
	.word 0xad796401  ! 4: MOVR_I	move	%r5, 0xb, %r22
	.word 0xb439672c  ! 4: XNOR_I	xnor 	%r5, 0x072c, %r26
thr3_hw_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_89), 16, 16)) -> intp(0, 0, 1)
	.word 0xbaa9262e  ! 4: ANDNcc_I	andncc 	%r4, 0x062e, %r29
	.word 0xac09a7df  ! 4: AND_I	and 	%r6, 0x07df, %r22
	.word 0xba38a8ca  ! 4: XNOR_I	xnor 	%r2, 0x08ca, %r29
	.word 0xb8116a29  ! 4: OR_I	or 	%r5, 0x0a29, %r28
	.word 0xaaa8c00e  ! 4: ANDNcc_R	andncc 	%r3, %r14, %r21
	.word 0xad29800a  ! 4: SLL_R	sll 	%r6, %r10, %r22
thr3_nuke_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_90), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc29800d  ! 4: ANDN_R	andn 	%r6, %r13, %r30
	.word 0xaea9e178  ! 4: ANDNcc_I	andncc 	%r7, 0x0178, %r23
	.word 0xad38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r22
thr3_resum_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_90), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa8129ee  ! 4: ADDcc_I	addcc 	%r4, 0x09ee, %r21
	.word 0xbd78e401  ! 4: MOVR_I	move	%r3, 0x9ee, %r30
	.word 0xb808c00e  ! 4: AND_R	and 	%r3, %r14, %r28
thr3_hw_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_91), 16, 16)) -> intp(1, 0, 1)
	.word 0xa964180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb329e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r25
	.word 0xb939d00c  ! 4: SRAX_R	srax	%r7, %r12, %r28
	.word 0xac41800d  ! 4: ADDC_R	addc 	%r6, %r13, %r22
	.word 0xb691e6a3  ! 4: ORcc_I	orcc 	%r7, 0x06a3, %r27
	.word 0xab38d00e  ! 4: SRAX_R	srax	%r3, %r14, %r21
thr3_hw_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_92), 16, 16)) -> intp(0, 0, 1)
	.word 0xac10c00a  ! 4: OR_R	or 	%r3, %r10, %r22
	.word 0xb81169f6  ! 4: OR_I	or 	%r5, 0x09f6, %r28
	.word 0xad39900b  ! 4: SRAX_R	srax	%r6, %r11, %r22
	.word 0xb739900e  ! 4: SRAX_R	srax	%r6, %r14, %r27
	.word 0xbb29d00c  ! 4: SLLX_R	sllx	%r7, %r12, %r29
	.word 0xba40800d  ! 4: ADDC_R	addc 	%r2, %r13, %r29
thr3_hw_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_93), 16, 16)) -> intp(1, 0, 1)
	.word 0xa9796401  ! 4: MOVR_I	move	%r5, 0xd, %r20
	.word 0xb532000d  ! 4: SRL_R	srl 	%r8, %r13, %r26
	.word 0xae022cb7  ! 4: ADD_I	add 	%r8, 0x0cb7, %r23
	.word 0xad30d00d  ! 4: SRLX_R	srlx	%r3, %r13, %r22
	.word 0xae292a54  ! 4: ANDN_I	andn 	%r4, 0x0a54, %r23
	.word 0xb43a000b  ! 4: XNOR_R	xnor 	%r8, %r11, %r26
	.word 0xaf78840e  ! 4: MOVR_R	move	%r2, %r14, %r23
thr3_nuke_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_94), 16, 16)) -> intp(0, 2, 1)
	.word 0xb219a66e  ! 4: XOR_I	xor 	%r6, 0x066e, %r25
	.word 0xb17a2401  ! 4: MOVR_I	move	%r8, 0xfffffe6e, %r24
	.word 0xad28c00f  ! 4: SLL_R	sll 	%r3, %r15, %r22
	.word 0xae39e0f8  ! 4: XNOR_I	xnor 	%r7, 0x00f8, %r23
	.word 0xae91400f  ! 4: ORcc_R	orcc 	%r5, %r15, %r23
	.word 0xb492000a  ! 4: ORcc_R	orcc 	%r8, %r10, %r26
thr3_resum_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb78a401  ! 4: MOVR_I	move	%r2, 0xa, %r29
	.word 0xb6c1000a  ! 4: ADDCcc_R	addccc 	%r4, %r10, %r27
	.word 0xb7796401  ! 4: MOVR_I	move	%r5, 0xa, %r27
	.word 0xb928800e  ! 4: SLL_R	sll 	%r2, %r14, %r28
thr3_hw_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_95), 16, 16)) -> intp(0, 0, 1)
	.word 0xb639400c  ! 4: XNOR_R	xnor 	%r5, %r12, %r27
	.word 0xae19a216  ! 4: XOR_I	xor 	%r6, 0x0216, %r23
	.word 0xb6296279  ! 4: ANDN_I	andn 	%r5, 0x0279, %r27
	.word 0xb9316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r28
	.word 0xae996a7a  ! 4: XORcc_I	xorcc 	%r5, 0x0a7a, %r23
	.word 0xb031c00c  ! 4: ORN_R	orn 	%r7, %r12, %r24
thr3_hw_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_96), 16, 16)) -> intp(0, 0, 1)
	.word 0xb801ad5e  ! 4: ADD_I	add 	%r6, 0x0d5e, %r28
	.word 0xbc32000d  ! 4: ORN_R	orn 	%r8, %r13, %r30
	.word 0xaf79e401  ! 4: MOVR_I	move	%r7, 0xd, %r23
	.word 0xaa092cec  ! 4: AND_I	and 	%r4, 0x0cec, %r21
	.word 0xbb39100b  ! 4: SRAX_R	srax	%r4, %r11, %r29
	.word 0xb441800f  ! 4: ADDC_R	addc 	%r6, %r15, %r26
thr3_hw_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_97), 16, 16)) -> intp(1, 0, 1)
	.word 0xa931d00d  ! 4: SRLX_R	srlx	%r7, %r13, %r20
	.word 0xa8092dd6  ! 4: AND_I	and 	%r4, 0x0dd6, %r20
	.word 0xac29ea5c  ! 4: ANDN_I	andn 	%r7, 0x0a5c, %r22
	.word 0xb0b9400f  ! 4: XNORcc_R	xnorcc 	%r5, %r15, %r24
	.word 0xbc89a178  ! 4: ANDcc_I	andcc 	%r6, 0x0178, %r30
	.word 0xaa80800e  ! 4: ADDcc_R	addcc 	%r2, %r14, %r21
thr3_nuke_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_98), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r29
	.word 0xb2892d46  ! 4: ANDcc_I	andcc 	%r4, 0x0d46, %r25
	.word 0xb631400d  ! 4: ORN_R	orn 	%r5, %r13, %r27
	.word 0xb801627d  ! 4: ADD_I	add 	%r5, 0x027d, %r28
	.word 0xba0a000c  ! 4: AND_R	and 	%r8, %r12, %r29
	.word 0xb28a000e  ! 4: ANDcc_R	andcc 	%r8, %r14, %r25
thr3_resum_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98), 16, 16)) -> intp(1, 3, 1)
	.word 0xb680e4e8  ! 4: ADDcc_I	addcc 	%r3, 0x04e8, %r27
	.word 0xbd28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r30
thr3_nuke_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_99), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8412af5  ! 4: ADDC_I	addc 	%r4, 0x0af5, %r20
	.word 0xb8292dbc  ! 4: ANDN_I	andn 	%r4, 0x0dbc, %r28
	.word 0xac90eee2  ! 4: ORcc_I	orcc 	%r3, 0x0ee2, %r22
thr3_resum_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_99), 16, 16)) -> intp(0, 3, 1)
	.word 0xb72a100e  ! 4: SLLX_R	sllx	%r8, %r14, %r27
thr3_hw_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_100), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b9c00d  ! 4: XNORcc_R	xnorcc 	%r7, %r13, %r26
	.word 0xa80a000f  ! 4: AND_R	and 	%r8, %r15, %r20
	.word 0xae31800a  ! 4: ORN_R	orn 	%r6, %r10, %r23
	.word 0xab323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r21
	.word 0xb819a688  ! 4: XOR_I	xor 	%r6, 0x0688, %r28
	.word 0xb440c00e  ! 4: ADDC_R	addc 	%r3, %r14, %r26
	.word 0xb8a9ab18  ! 4: ANDNcc_I	andncc 	%r6, 0x0b18, %r28
thr3_nuke_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_101), 16, 16)) -> intp(1, 2, 1)
	.word 0xb601273b  ! 4: ADD_I	add 	%r4, 0x073b, %r27
thr3_resum_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_101), 16, 16)) -> intp(1, 3, 1)
	.word 0xaab1c00e  ! 4: ORNcc_R	orncc 	%r7, %r14, %r21
	.word 0xb0916b2a  ! 4: ORcc_I	orcc 	%r5, 0x0b2a, %r24
thr3_nuke_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_102), 16, 16)) -> intp(0, 2, 1)
	.word 0xb481efca  ! 4: ADDcc_I	addcc 	%r7, 0x0fca, %r26
thr3_resum_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102), 16, 16)) -> intp(0, 3, 1)
	.word 0xb01a000e  ! 4: XOR_R	xor 	%r8, %r14, %r24
thr3_hw_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_103), 16, 16)) -> intp(0, 0, 1)
	.word 0xb929800f  ! 4: SLL_R	sll 	%r6, %r15, %r28
	.word 0xa881c00a  ! 4: ADDcc_R	addcc 	%r7, %r10, %r20
	.word 0xaa292ca2  ! 4: ANDN_I	andn 	%r4, 0x0ca2, %r21
	.word 0xb881000f  ! 4: ADDcc_R	addcc 	%r4, %r15, %r28
	.word 0xad28800c  ! 4: SLL_R	sll 	%r2, %r12, %r22
	.word 0xbd31000a  ! 4: SRL_R	srl 	%r4, %r10, %r30
	.word 0xa8292d82  ! 4: ANDN_I	andn 	%r4, 0x0d82, %r20
thr3_hw_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_104), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2b0aae3  ! 4: ORNcc_I	orncc 	%r2, 0x0ae3, %r25
	.word 0xa939800b  ! 4: SRA_R	sra 	%r6, %r11, %r20
	.word 0xb0b8ea73  ! 4: XNORcc_I	xnorcc 	%r3, 0x0a73, %r24
	.word 0xba9a000a  ! 4: XORcc_R	xorcc 	%r8, %r10, %r29
	.word 0xad39800a  ! 4: SRA_R	sra 	%r6, %r10, %r22
	.word 0xb6a9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r27
thr3_hw_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_105), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8b9e10c  ! 4: XNORcc_I	xnorcc 	%r7, 0x010c, %r28
	.word 0xb1312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r24
	.word 0xb639e7fb  ! 4: XNOR_I	xnor 	%r7, 0x07fb, %r27
	.word 0xb928900c  ! 4: SLLX_R	sllx	%r2, %r12, %r28
	.word 0xa8096d97  ! 4: AND_I	and 	%r5, 0x0d97, %r20
	.word 0xbb79a401  ! 4: MOVR_I	move	%r6, 0xd97, %r29
thr3_hw_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_106), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf29800a  ! 4: SLL_R	sll 	%r6, %r10, %r23
	.word 0xba00a3d5  ! 4: ADD_I	add 	%r2, 0x03d5, %r29
	.word 0xb608a695  ! 4: AND_I	and 	%r2, 0x0695, %r27
	.word 0xab392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r21
	.word 0xba08800f  ! 4: AND_R	and 	%r2, %r15, %r29
	.word 0xaa18800f  ! 4: XOR_R	xor 	%r2, %r15, %r21
	.word 0xae40aafa  ! 4: ADDC_I	addc 	%r2, 0x0afa, %r23
thr3_nuke_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_107), 16, 16)) -> intp(1, 2, 1)
	.word 0xae29800e  ! 4: ANDN_R	andn 	%r6, %r14, %r23
	.word 0xbc08c00b  ! 4: AND_R	and 	%r3, %r11, %r30
	.word 0xac09c00f  ! 4: AND_R	and 	%r7, %r15, %r22
thr3_resum_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf29d00a  ! 4: SLLX_R	sllx	%r7, %r10, %r23
	.word 0xac81c00b  ! 4: ADDcc_R	addcc 	%r7, %r11, %r22
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xab30d00b  ! 4: SRLX_R	srlx	%r3, %r11, %r21
thr3_nuke_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_108), 16, 16)) -> intp(1, 2, 1)
	.word 0xb929000e  ! 4: SLL_R	sll 	%r4, %r14, %r28
	.word 0xb202000a  ! 4: ADD_R	add 	%r8, %r10, %r25
	.word 0xb681000d  ! 4: ADDcc_R	addcc 	%r4, %r13, %r27
thr3_resum_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_108), 16, 16)) -> intp(1, 3, 1)
	.word 0xb331400a  ! 4: SRL_R	srl 	%r5, %r10, %r25
thr3_nuke_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_109), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa892e06  ! 4: ANDcc_I	andcc 	%r4, 0x0e06, %r21
	.word 0xb5312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r26
	.word 0xab28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r21
	.word 0xb431abf6  ! 4: ORN_I	orn 	%r6, 0x0bf6, %r26
thr3_resum_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_109), 16, 16)) -> intp(1, 3, 1)
	.word 0xbd292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r30
	.word 0xb401800c  ! 4: ADD_R	add 	%r6, %r12, %r26
	.word 0xb530a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r26
thr3_nuke_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_110), 16, 16)) -> intp(0, 2, 1)
	.word 0xb330d00e  ! 4: SRLX_R	srlx	%r3, %r14, %r25
	.word 0xa889aca9  ! 4: ANDcc_I	andcc 	%r6, 0x0ca9, %r20
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa828e202  ! 4: ANDN_I	andn 	%r3, 0x0202, %r20
	.word 0xaa292bb2  ! 4: ANDN_I	andn 	%r4, 0x0bb2, %r21
thr3_resum_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_110), 16, 16)) -> intp(0, 3, 1)
	.word 0xab323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r21
	.word 0xac01c00d  ! 4: ADD_R	add 	%r7, %r13, %r22
	.word 0xa938c00b  ! 4: SRA_R	sra 	%r3, %r11, %r20
thr3_nuke_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_111), 16, 16)) -> intp(0, 2, 1)
	.word 0xb629000f  ! 4: ANDN_R	andn 	%r4, %r15, %r27
	.word 0xac00edfd  ! 4: ADD_I	add 	%r3, 0x0dfd, %r22
	.word 0xa8022e07  ! 4: ADD_I	add 	%r8, 0x0e07, %r20
	.word 0xbb78a401  ! 4: MOVR_I	move	%r2, 0xfffffe07, %r29
	.word 0xbc19c00b  ! 4: XOR_R	xor 	%r7, %r11, %r30
	.word 0xa89a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r20
	.word 0xab29400e  ! 4: SLL_R	sll 	%r5, %r14, %r21
thr3_resum_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111), 16, 16)) -> intp(0, 3, 1)
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_112), 16, 16)) -> intp(0, 2, 1)
	.word 0xb241800c  ! 4: ADDC_R	addc 	%r6, %r12, %r25
	.word 0xa930800b  ! 4: SRL_R	srl 	%r2, %r11, %r20
	.word 0xba40c00d  ! 4: ADDC_R	addc 	%r3, %r13, %r29
	.word 0xbc3a2630  ! 4: XNOR_I	xnor 	%r8, 0x0630, %r30
thr3_resum_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_112), 16, 16)) -> intp(0, 3, 1)
	.word 0xb738a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r27
	.word 0xa931800a  ! 4: SRL_R	srl 	%r6, %r10, %r20
	.word 0xbc99e823  ! 4: XORcc_I	xorcc 	%r7, 0x0823, %r30
thr3_hw_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_113), 16, 16)) -> intp(1, 0, 1)
	.word 0xa802000e  ! 4: ADD_R	add 	%r8, %r14, %r20
	.word 0xb83a000c  ! 4: XNOR_R	xnor 	%r8, %r12, %r28
	.word 0xb608800c  ! 4: AND_R	and 	%r2, %r12, %r27
	.word 0xaf79440a  ! 4: MOVR_R	move	%r5, %r10, %r23
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb889400b  ! 4: ANDcc_R	andcc 	%r5, %r11, %r28
thr3_hw_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_114), 16, 16)) -> intp(0, 0, 1)
	.word 0xb328c00a  ! 4: SLL_R	sll 	%r3, %r10, %r25
	.word 0xa829c00a  ! 4: ANDN_R	andn 	%r7, %r10, %r20
	.word 0xae01c00a  ! 4: ADD_R	add 	%r7, %r10, %r23
	.word 0xb001000d  ! 4: ADD_R	add 	%r4, %r13, %r24
	.word 0xb3313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r25
	.word 0xbb31400d  ! 4: SRL_R	srl 	%r5, %r13, %r29
	.word 0xa8192105  ! 4: XOR_I	xor 	%r4, 0x0105, %r20
thr3_nuke_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_115), 16, 16)) -> intp(0, 2, 1)
	.word 0xb419e7a0  ! 4: XOR_I	xor 	%r7, 0x07a0, %r26
	.word 0xbb292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r29
	.word 0xbac16a02  ! 4: ADDCcc_I	addccc 	%r5, 0x0a02, %r29
	.word 0xad30c00c  ! 4: SRL_R	srl 	%r3, %r12, %r22
	.word 0xab31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r21
thr3_resum_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_115), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8b9400d  ! 4: XNORcc_R	xnorcc 	%r5, %r13, %r28
	.word 0xb841400d  ! 4: ADDC_R	addc 	%r5, %r13, %r28
thr3_hw_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_116), 16, 16)) -> intp(1, 0, 1)
	.word 0xb241000c  ! 4: ADDC_R	addc 	%r4, %r12, %r25
	.word 0xb239a5f2  ! 4: XNOR_I	xnor 	%r6, 0x05f2, %r25
	.word 0xab792401  ! 4: MOVR_I	move	%r4, 0x5f2, %r21
	.word 0xb179e401  ! 4: MOVR_I	move	%r7, 0x5f2, %r24
	.word 0xa930f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r20
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_117), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc82000a  ! 4: ADDcc_R	addcc 	%r8, %r10, %r30
	.word 0xaa42000d  ! 4: ADDC_R	addc 	%r8, %r13, %r21
	.word 0xb289000b  ! 4: ANDcc_R	andcc 	%r4, %r11, %r25
	.word 0xb0916f70  ! 4: ORcc_I	orcc 	%r5, 0x0f70, %r24
thr3_resum_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_117), 16, 16)) -> intp(0, 3, 1)
	.word 0xb779840c  ! 4: MOVR_R	move	%r6, %r12, %r27
	.word 0xb641800d  ! 4: ADDC_R	addc 	%r6, %r13, %r27
	.word 0xbc922a27  ! 4: ORcc_I	orcc 	%r8, 0x0a27, %r30
thr3_nuke_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_118), 16, 16)) -> intp(1, 2, 1)
	.word 0xb131800d  ! 4: SRL_R	srl 	%r6, %r13, %r24
	.word 0xad29100c  ! 4: SLLX_R	sllx	%r4, %r12, %r22
	.word 0xac88e69b  ! 4: ANDcc_I	andcc 	%r3, 0x069b, %r22
	.word 0xb019e54c  ! 4: XOR_I	xor 	%r7, 0x054c, %r24
	.word 0xac31800b  ! 4: ORN_R	orn 	%r6, %r11, %r22
	.word 0xb931900c  ! 4: SRLX_R	srlx	%r6, %r12, %r28
	.word 0xba29000d  ! 4: ANDN_R	andn 	%r4, %r13, %r29
thr3_resum_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_118), 16, 16)) -> intp(1, 3, 1)
	.word 0xb939e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r28
	.word 0xab31100e  ! 4: SRLX_R	srlx	%r4, %r14, %r21
thr3_hw_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_119), 16, 16)) -> intp(0, 0, 1)
	.word 0xad78a401  ! 4: MOVR_I	move	%r2, 0xe, %r22
	.word 0xb8196f27  ! 4: XOR_I	xor 	%r5, 0x0f27, %r28
	.word 0xb830c00f  ! 4: ORN_R	orn 	%r3, %r15, %r28
	.word 0xbc81400d  ! 4: ADDcc_R	addcc 	%r5, %r13, %r30
	.word 0xbd64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xba38c00f  ! 4: XNOR_R	xnor 	%r3, %r15, %r29
thr3_hw_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_120), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4992c29  ! 4: XORcc_I	xorcc 	%r4, 0x0c29, %r26
	.word 0xb2c1c00d  ! 4: ADDCcc_R	addccc 	%r7, %r13, %r25
	.word 0xae31800c  ! 4: ORN_R	orn 	%r6, %r12, %r23
	.word 0xa831400c  ! 4: ORN_R	orn 	%r5, %r12, %r20
	.word 0xb578c40e  ! 4: MOVR_R	move	%r3, %r14, %r26
	.word 0xbb30900f  ! 4: SRLX_R	srlx	%r2, %r15, %r29
thr3_nuke_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_121), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa08a587  ! 4: AND_I	and 	%r2, 0x0587, %r21
	.word 0xb939100f  ! 4: SRAX_R	srax	%r4, %r15, %r28
thr3_resum_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121), 16, 16)) -> intp(0, 3, 1)
	.word 0xa928e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r20
	.word 0xb619ee11  ! 4: XOR_I	xor 	%r7, 0x0e11, %r27
thr3_hw_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_122), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb3313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r25
	.word 0xaa39c00b  ! 4: XNOR_R	xnor 	%r7, %r11, %r21
	.word 0xb610800b  ! 4: OR_R	or 	%r2, %r11, %r27
	.word 0xa8b9c00f  ! 4: XNORcc_R	xnorcc 	%r7, %r15, %r20
	.word 0xb6c0ed12  ! 4: ADDCcc_I	addccc 	%r3, 0x0d12, %r27
	.word 0xad39400f  ! 4: SRA_R	sra 	%r5, %r15, %r22
thr3_hw_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_123), 16, 16)) -> intp(1, 0, 1)
	.word 0xb03a000a  ! 4: XNOR_R	xnor 	%r8, %r10, %r24
	.word 0xb0316683  ! 4: ORN_I	orn 	%r5, 0x0683, %r24
	.word 0xb001000d  ! 4: ADD_R	add 	%r4, %r13, %r24
	.word 0xb779840c  ! 4: MOVR_R	move	%r6, %r12, %r27
	.word 0xbc89c00f  ! 4: ANDcc_R	andcc 	%r7, %r15, %r30
	.word 0xaa10800d  ! 4: OR_R	or 	%r2, %r13, %r21
	.word 0xb640c00f  ! 4: ADDC_R	addc 	%r3, %r15, %r27
thr3_hw_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_124), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb31e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r29
	.word 0xaeb8c00a  ! 4: XNORcc_R	xnorcc 	%r3, %r10, %r23
	.word 0xb841eb5a  ! 4: ADDC_I	addc 	%r7, 0x0b5a, %r28
	.word 0xb429ee42  ! 4: ANDN_I	andn 	%r7, 0x0e42, %r26
	.word 0xbc28a3d9  ! 4: ANDN_I	andn 	%r2, 0x03d9, %r30
	.word 0xac41800f  ! 4: ADDC_R	addc 	%r6, %r15, %r22
	.word 0xaeb8e415  ! 4: XNORcc_I	xnorcc 	%r3, 0x0415, %r23
thr3_nuke_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_125), 16, 16)) -> intp(1, 2, 1)
	.word 0xb32a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r25
	.word 0xb492000c  ! 4: ORcc_R	orcc 	%r8, %r12, %r26
	.word 0xb529a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r26
	.word 0xaf29800b  ! 4: SLL_R	sll 	%r6, %r11, %r23
thr3_resum_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125), 16, 16)) -> intp(1, 3, 1)
	.word 0xbcba000f  ! 4: XNORcc_R	xnorcc 	%r8, %r15, %r30
	.word 0xbb29900b  ! 4: SLLX_R	sllx	%r6, %r11, %r29
	.word 0xb281000b  ! 4: ADDcc_R	addcc 	%r4, %r11, %r25
	.word 0xb4096052  ! 4: AND_I	and 	%r5, 0x0052, %r26
thr3_nuke_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_126), 16, 16)) -> intp(0, 2, 1)
	.word 0xb010a4e3  ! 4: OR_I	or 	%r2, 0x04e3, %r24
	.word 0xb40a276e  ! 4: AND_I	and 	%r8, 0x076e, %r26
	.word 0xaa28e467  ! 4: ANDN_I	andn 	%r3, 0x0467, %r21
	.word 0xb2b1000f  ! 4: ORNcc_R	orncc 	%r4, %r15, %r25
	.word 0xb730f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r27
	.word 0xbb3a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r29
thr3_resum_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_126), 16, 16)) -> intp(0, 3, 1)
	.word 0xb60929c1  ! 4: AND_I	and 	%r4, 0x09c1, %r27
	.word 0xb2b0c00f  ! 4: ORNcc_R	orncc 	%r3, %r15, %r25
	.word 0xb231000f  ! 4: ORN_R	orn 	%r4, %r15, %r25
thr3_nuke_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_127), 16, 16)) -> intp(0, 2, 1)
	.word 0xacba2c39  ! 4: XNORcc_I	xnorcc 	%r8, 0x0c39, %r22
	.word 0xbb31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r29
	.word 0xbc996d1a  ! 4: XORcc_I	xorcc 	%r5, 0x0d1a, %r30
thr3_resum_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_127), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc98c00e  ! 4: XORcc_R	xorcc 	%r3, %r14, %r30
	.word 0xaa40800c  ! 4: ADDC_R	addc 	%r2, %r12, %r21
	.word 0xbaba2bac  ! 4: XNORcc_I	xnorcc 	%r8, 0x0bac, %r29
	.word 0xb291e18a  ! 4: ORcc_I	orcc 	%r7, 0x018a, %r25
thr3_hw_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_128), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b9225f  ! 4: XNORcc_I	xnorcc 	%r4, 0x025f, %r26
	.word 0xad322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r22
	.word 0xa831000b  ! 4: ORN_R	orn 	%r4, %r11, %r20
	.word 0xb8aa000e  ! 4: ANDNcc_R	andncc 	%r8, %r14, %r28
	.word 0xb6a9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r27
	.word 0xb8912277  ! 4: ORcc_I	orcc 	%r4, 0x0277, %r28
	.word 0xa809800a  ! 4: AND_R	and 	%r6, %r10, %r20
thr3_nuke_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_129), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc32000d  ! 4: ORN_R	orn 	%r8, %r13, %r30
	.word 0xb22a000b  ! 4: ANDN_R	andn 	%r8, %r11, %r25
	.word 0xaa00ab49  ! 4: ADD_I	add 	%r2, 0x0b49, %r21
	.word 0xae39000b  ! 4: XNOR_R	xnor 	%r4, %r11, %r23
	.word 0xaaaa000b  ! 4: ANDNcc_R	andncc 	%r8, %r11, %r21
	.word 0xbb28c00e  ! 4: SLL_R	sll 	%r3, %r14, %r29
thr3_resum_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129), 16, 16)) -> intp(1, 3, 1)
	.word 0xb891400e  ! 4: ORcc_R	orcc 	%r5, %r14, %r28
thr3_hw_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_130), 16, 16)) -> intp(1, 0, 1)
	.word 0xb280800f  ! 4: ADDcc_R	addcc 	%r2, %r15, %r25
	.word 0xb131000e  ! 4: SRL_R	srl 	%r4, %r14, %r24
	.word 0xb840800c  ! 4: ADDC_R	addc 	%r2, %r12, %r28
	.word 0xab29800b  ! 4: SLL_R	sll 	%r6, %r11, %r21
	.word 0xad29900d  ! 4: SLLX_R	sllx	%r6, %r13, %r22
	.word 0xaa8a2e15  ! 4: ANDcc_I	andcc 	%r8, 0x0e15, %r21
thr3_hw_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_131), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa81400d  ! 4: ADDcc_R	addcc 	%r5, %r13, %r21
	.word 0xb601400f  ! 4: ADD_R	add 	%r5, %r15, %r27
	.word 0xb609000e  ! 4: AND_R	and 	%r4, %r14, %r27
	.word 0xb4c2000d  ! 4: ADDCcc_R	addccc 	%r8, %r13, %r26
	.word 0xb000800b  ! 4: ADD_R	add 	%r2, %r11, %r24
	.word 0xac81e6a9  ! 4: ADDcc_I	addcc 	%r7, 0x06a9, %r22
	.word 0xb099279e  ! 4: XORcc_I	xorcc 	%r4, 0x079e, %r24
thr3_hw_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_132), 16, 16)) -> intp(1, 0, 1)
	.word 0xa891400e  ! 4: ORcc_R	orcc 	%r5, %r14, %r20
	.word 0xb280a307  ! 4: ADDcc_I	addcc 	%r2, 0x0307, %r25
	.word 0xb091a0a3  ! 4: ORcc_I	orcc 	%r6, 0x00a3, %r24
	.word 0xb5296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r26
	.word 0xb931900a  ! 4: SRLX_R	srlx	%r6, %r10, %r28
	.word 0xb0c1000f  ! 4: ADDCcc_R	addccc 	%r4, %r15, %r24
	.word 0xaf38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r23
thr3_nuke_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_133), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc812e7d  ! 4: ADDcc_I	addcc 	%r4, 0x0e7d, %r30
	.word 0xaca8800e  ! 4: ANDNcc_R	andncc 	%r2, %r14, %r22
	.word 0xbd28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r30
	.word 0xb039400a  ! 4: XNOR_R	xnor 	%r5, %r10, %r24
	.word 0xbcb0add5  ! 4: ORNcc_I	orncc 	%r2, 0x0dd5, %r30
thr3_resum_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_133), 16, 16)) -> intp(1, 3, 1)
	.word 0xac3a2e33  ! 4: XNOR_I	xnor 	%r8, 0x0e33, %r22
	.word 0xbd64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaf64180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb6b1c00f  ! 4: ORNcc_R	orncc 	%r7, %r15, %r27
thr3_hw_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_134), 16, 16)) -> intp(0, 0, 1)
	.word 0xa939c00b  ! 4: SRA_R	sra 	%r7, %r11, %r20
	.word 0xb600a739  ! 4: ADD_I	add 	%r2, 0x0739, %r27
	.word 0xaac16aae  ! 4: ADDCcc_I	addccc 	%r5, 0x0aae, %r21
	.word 0xba01800f  ! 4: ADD_R	add 	%r6, %r15, %r29
	.word 0xb60a269e  ! 4: AND_I	and 	%r8, 0x069e, %r27
	.word 0xb828a4f8  ! 4: ANDN_I	andn 	%r2, 0x04f8, %r28
thr3_nuke_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_135), 16, 16)) -> intp(1, 2, 1)
	.word 0xb499800b  ! 4: XORcc_R	xorcc 	%r6, %r11, %r26
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xac11800b  ! 4: OR_R	or 	%r6, %r11, %r22
	.word 0xb5792401  ! 4: MOVR_I	move	%r4, 0xb, %r26
	.word 0xb088ac4a  ! 4: ANDcc_I	andcc 	%r2, 0x0c4a, %r24
	.word 0xbb30800f  ! 4: SRL_R	srl 	%r2, %r15, %r29
	.word 0xaca9000c  ! 4: ANDNcc_R	andncc 	%r4, %r12, %r22
thr3_resum_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_135), 16, 16)) -> intp(1, 3, 1)
	.word 0xba196fc9  ! 4: XOR_I	xor 	%r5, 0x0fc9, %r29
thr3_nuke_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_136), 16, 16)) -> intp(1, 2, 1)
	.word 0xaeb9e73b  ! 4: XNORcc_I	xnorcc 	%r7, 0x073b, %r23
	.word 0xb139900f  ! 4: SRAX_R	srax	%r6, %r15, %r24
	.word 0xab28900a  ! 4: SLLX_R	sllx	%r2, %r10, %r21
thr3_resum_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_136), 16, 16)) -> intp(1, 3, 1)
	.word 0xb5316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r26
	.word 0xb0a9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r24
thr3_nuke_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_137), 16, 16)) -> intp(0, 2, 1)
	.word 0xac98c00d  ! 4: XORcc_R	xorcc 	%r3, %r13, %r22
	.word 0xb200800c  ! 4: ADD_R	add 	%r2, %r12, %r25
	.word 0xa930d00f  ! 4: SRLX_R	srlx	%r3, %r15, %r20
thr3_resum_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_137), 16, 16)) -> intp(0, 3, 1)
	.word 0xad7a040b  ! 4: MOVR_R	move	%r8, %r11, %r22
thr3_hw_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_138), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc81800b  ! 4: ADDcc_R	addcc 	%r6, %r11, %r30
	.word 0xb6c1c00e  ! 4: ADDCcc_R	addccc 	%r7, %r14, %r27
	.word 0xb6b1a350  ! 4: ORNcc_I	orncc 	%r6, 0x0350, %r27
	.word 0xb2b1c00e  ! 4: ORNcc_R	orncc 	%r7, %r14, %r25
	.word 0xa83926fb  ! 4: XNOR_I	xnor 	%r4, 0x06fb, %r20
	.word 0xb130900d  ! 4: SRLX_R	srlx	%r2, %r13, %r24
	.word 0xb628e716  ! 4: ANDN_I	andn 	%r3, 0x0716, %r27
thr3_nuke_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_139), 16, 16)) -> intp(0, 2, 1)
	.word 0xaab0c00d  ! 4: ORNcc_R	orncc 	%r3, %r13, %r21
	.word 0xb88968e1  ! 4: ANDcc_I	andcc 	%r5, 0x08e1, %r28
	.word 0xb002000d  ! 4: ADD_R	add 	%r8, %r13, %r24
	.word 0xb0a9800a  ! 4: ANDNcc_R	andncc 	%r6, %r10, %r24
	.word 0xb611400e  ! 4: OR_R	or 	%r5, %r14, %r27
thr3_resum_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_139), 16, 16)) -> intp(0, 3, 1)
	.word 0xad2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r22
thr3_nuke_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_140), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb39900f  ! 4: SRAX_R	srax	%r6, %r15, %r29
	.word 0xb531e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r26
	.word 0xa8b1ea7e  ! 4: ORNcc_I	orncc 	%r7, 0x0a7e, %r20
thr3_resum_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_140), 16, 16)) -> intp(1, 3, 1)
	.word 0xb641000c  ! 4: ADDC_R	addc 	%r4, %r12, %r27
	.word 0xbb79440a  ! 4: MOVR_R	move	%r5, %r10, %r29
	.word 0xbd31500f  ! 4: SRLX_R	srlx	%r5, %r15, %r30
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_141), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8c169a4  ! 4: ADDCcc_I	addccc 	%r5, 0x09a4, %r28
	.word 0xbab1e0d5  ! 4: ORNcc_I	orncc 	%r7, 0x00d5, %r29
	.word 0xa880a889  ! 4: ADDcc_I	addcc 	%r2, 0x0889, %r20
	.word 0xba88a15b  ! 4: ANDcc_I	andcc 	%r2, 0x015b, %r29
	.word 0xb4192028  ! 4: XOR_I	xor 	%r4, 0x0028, %r26
thr3_resum_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_141), 16, 16)) -> intp(1, 3, 1)
	.word 0xae112620  ! 4: OR_I	or 	%r4, 0x0620, %r23
thr3_hw_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_142), 16, 16)) -> intp(0, 0, 1)
	.word 0xad29f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r22
	.word 0xaaaa2ba2  ! 4: ANDNcc_I	andncc 	%r8, 0x0ba2, %r21
	.word 0xae10ef8d  ! 4: OR_I	or 	%r3, 0x0f8d, %r23
	.word 0xaf2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r23
	.word 0xb4b9a6fe  ! 4: XNORcc_I	xnorcc 	%r6, 0x06fe, %r26
	.word 0xb691646f  ! 4: ORcc_I	orcc 	%r5, 0x046f, %r27
thr3_nuke_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_143), 16, 16)) -> intp(0, 2, 1)
	.word 0xb5317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r26
	.word 0xaeb96519  ! 4: XNORcc_I	xnorcc 	%r5, 0x0519, %r23
	.word 0xb201400f  ! 4: ADD_R	add 	%r5, %r15, %r25
thr3_resum_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_143), 16, 16)) -> intp(0, 3, 1)
	.word 0xb641c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r27
	.word 0xbaa9400c  ! 4: ANDNcc_R	andncc 	%r5, %r12, %r29
thr3_nuke_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_144), 16, 16)) -> intp(1, 2, 1)
	.word 0xb579840d  ! 4: MOVR_R	move	%r6, %r13, %r26
	.word 0xa810a17a  ! 4: OR_I	or 	%r2, 0x017a, %r20
	.word 0xbd28b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r30
thr3_resum_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144), 16, 16)) -> intp(1, 3, 1)
	.word 0xa929c00d  ! 4: SLL_R	sll 	%r7, %r13, %r20
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa89241d  ! 4: ANDcc_I	andcc 	%r4, 0x041d, %r21
	.word 0xa801400e  ! 4: ADD_R	add 	%r5, %r14, %r20
thr3_nuke_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_145), 16, 16)) -> intp(0, 2, 1)
	.word 0xb529000c  ! 4: SLL_R	sll 	%r4, %r12, %r26
	.word 0xaca8a7d2  ! 4: ANDNcc_I	andncc 	%r2, 0x07d2, %r22
thr3_resum_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_145), 16, 16)) -> intp(0, 3, 1)
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa91800d  ! 4: ORcc_R	orcc 	%r6, %r13, %r21
	.word 0xa830c00e  ! 4: ORN_R	orn 	%r3, %r14, %r20
thr3_nuke_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_146), 16, 16)) -> intp(1, 2, 1)
	.word 0xa830ee55  ! 4: ORN_I	orn 	%r3, 0x0e55, %r20
thr3_resum_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_146), 16, 16)) -> intp(1, 3, 1)
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbca9800d  ! 4: ANDNcc_R	andncc 	%r6, %r13, %r30
	.word 0xbb3a000c  ! 4: SRA_R	sra 	%r8, %r12, %r29
	.word 0xa8a8c00d  ! 4: ANDNcc_R	andncc 	%r3, %r13, %r20
thr3_nuke_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_147), 16, 16)) -> intp(0, 2, 1)
	.word 0xb83a000c  ! 4: XNOR_R	xnor 	%r8, %r12, %r28
	.word 0xb809afe8  ! 4: AND_I	and 	%r6, 0x0fe8, %r28
thr3_resum_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_147), 16, 16)) -> intp(0, 3, 1)
	.word 0xb288ac1d  ! 4: ANDcc_I	andcc 	%r2, 0x0c1d, %r25
thr3_hw_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_148), 16, 16)) -> intp(1, 0, 1)
	.word 0xb489800c  ! 4: ANDcc_R	andcc 	%r6, %r12, %r26
	.word 0xb729f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r27
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb830c00e  ! 4: ORN_R	orn 	%r3, %r14, %r28
	.word 0xb9297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r28
	.word 0xb429000d  ! 4: ANDN_R	andn 	%r4, %r13, %r26
	.word 0xb979a401  ! 4: MOVR_I	move	%r6, 0xd, %r28
thr3_nuke_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_149), 16, 16)) -> intp(1, 2, 1)
	.word 0xb529b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r26
	.word 0xac29000b  ! 4: ANDN_R	andn 	%r4, %r11, %r22
	.word 0xaec0c00e  ! 4: ADDCcc_R	addccc 	%r3, %r14, %r23
	.word 0xbc08ae96  ! 4: AND_I	and 	%r2, 0x0e96, %r30
	.word 0xbb31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r29
	.word 0xbc0a2714  ! 4: AND_I	and 	%r8, 0x0714, %r30
	.word 0xa8a9400e  ! 4: ANDNcc_R	andncc 	%r5, %r14, %r20
thr3_resum_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149), 16, 16)) -> intp(1, 3, 1)
	.word 0xb081000f  ! 4: ADDcc_R	addcc 	%r4, %r15, %r24
thr3_nuke_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_150), 16, 16)) -> intp(1, 2, 1)
	.word 0xb83a20f0  ! 4: XNOR_I	xnor 	%r8, 0x00f0, %r28
	.word 0xbab2000a  ! 4: ORNcc_R	orncc 	%r8, %r10, %r29
thr3_resum_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_150), 16, 16)) -> intp(1, 3, 1)
	.word 0xb288e24c  ! 4: ANDcc_I	andcc 	%r3, 0x024c, %r25
thr3_nuke_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_151), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc822ee3  ! 4: ADDcc_I	addcc 	%r8, 0x0ee3, %r30
	.word 0xb132100c  ! 4: SRLX_R	srlx	%r8, %r12, %r24
	.word 0xb339500f  ! 4: SRAX_R	srax	%r5, %r15, %r25
	.word 0xb680c00b  ! 4: ADDcc_R	addcc 	%r3, %r11, %r27
	.word 0xae19a224  ! 4: XOR_I	xor 	%r6, 0x0224, %r23
	.word 0xb080ef34  ! 4: ADDcc_I	addcc 	%r3, 0x0f34, %r24
	.word 0xb0112d79  ! 4: OR_I	or 	%r4, 0x0d79, %r24
thr3_resum_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_151), 16, 16)) -> intp(0, 3, 1)
	.word 0xb239209e  ! 4: XNOR_I	xnor 	%r4, 0x009e, %r25
	.word 0xbb312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r29
thr3_hw_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_152), 16, 16)) -> intp(1, 0, 1)
	.word 0xb292000c  ! 4: ORcc_R	orcc 	%r8, %r12, %r25
	.word 0xbab2225b  ! 4: ORNcc_I	orncc 	%r8, 0x025b, %r29
	.word 0xaa38ae2c  ! 4: XNOR_I	xnor 	%r2, 0x0e2c, %r21
	.word 0xb61a2bd4  ! 4: XOR_I	xor 	%r8, 0x0bd4, %r27
	.word 0xbc422bd4  ! 4: ADDC_I	addc 	%r8, 0x0bd4, %r30
	.word 0xa938a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r20
	.word 0xb4a9e462  ! 4: ANDNcc_I	andncc 	%r7, 0x0462, %r26
thr3_nuke_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_153), 16, 16)) -> intp(0, 2, 1)
	.word 0xbd29800f  ! 4: SLL_R	sll 	%r6, %r15, %r30
	.word 0xae98ac89  ! 4: XORcc_I	xorcc 	%r2, 0x0c89, %r23
	.word 0xb979c40c  ! 4: MOVR_R	move	%r7, %r12, %r28
	.word 0xa964180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xac322cae  ! 4: ORN_I	orn 	%r8, 0x0cae, %r22
	.word 0xb6a9800e  ! 4: ANDNcc_R	andncc 	%r6, %r14, %r27
	.word 0xb891c00d  ! 4: ORcc_R	orcc 	%r7, %r13, %r28
thr3_resum_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_153), 16, 16)) -> intp(0, 3, 1)
	.word 0xa964180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb8a8ada5  ! 4: ANDNcc_I	andncc 	%r2, 0x0da5, %r28
thr3_nuke_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_154), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc08800c  ! 4: AND_R	and 	%r2, %r12, %r30
	.word 0xbb31d00d  ! 4: SRLX_R	srlx	%r7, %r13, %r29
	.word 0xb401000b  ! 4: ADD_R	add 	%r4, %r11, %r26
thr3_resum_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_154), 16, 16)) -> intp(1, 3, 1)
	.word 0xb40126d4  ! 4: ADD_I	add 	%r4, 0x06d4, %r26
thr3_hw_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_155), 16, 16)) -> intp(1, 0, 1)
	.word 0xb600e609  ! 4: ADD_I	add 	%r3, 0x0609, %r27
	.word 0xb490c00b  ! 4: ORcc_R	orcc 	%r3, %r11, %r26
	.word 0xbd28c00a  ! 4: SLL_R	sll 	%r3, %r10, %r30
	.word 0xb0092122  ! 4: AND_I	and 	%r4, 0x0122, %r24
	.word 0xb6c0800b  ! 4: ADDCcc_R	addccc 	%r2, %r11, %r27
	.word 0xb529a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r26
thr3_hw_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_156), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf29f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r23
	.word 0xb6b0800c  ! 4: ORNcc_R	orncc 	%r2, %r12, %r27
	.word 0xbcb1400e  ! 4: ORNcc_R	orncc 	%r5, %r14, %r30
	.word 0xac28e021  ! 4: ANDN_I	andn 	%r3, 0x0021, %r22
	.word 0xb73a000c  ! 4: SRA_R	sra 	%r8, %r12, %r27
	.word 0xb329a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r25
thr3_hw_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_157), 16, 16)) -> intp(0, 0, 1)
	.word 0xa830800c  ! 4: ORN_R	orn 	%r2, %r12, %r20
	.word 0xbcc0c00b  ! 4: ADDCcc_R	addccc 	%r3, %r11, %r30
	.word 0xa818800e  ! 4: XOR_R	xor 	%r2, %r14, %r20
	.word 0xb031000d  ! 4: ORN_R	orn 	%r4, %r13, %r24
	.word 0xbd796401  ! 4: MOVR_I	move	%r5, 0xd, %r30
	.word 0xb1322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r24
	.word 0xb131000f  ! 4: SRL_R	srl 	%r4, %r15, %r24
thr3_hw_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_158), 16, 16)) -> intp(0, 0, 1)
	.word 0xab31c00a  ! 4: SRL_R	srl 	%r7, %r10, %r21
	.word 0xba08e840  ! 4: AND_I	and 	%r3, 0x0840, %r29
	.word 0xad28c00d  ! 4: SLL_R	sll 	%r3, %r13, %r22
	.word 0xb408ab6c  ! 4: AND_I	and 	%r2, 0x0b6c, %r26
	.word 0xbc81e289  ! 4: ADDcc_I	addcc 	%r7, 0x0289, %r30
	.word 0xb5317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r26
	.word 0xb330b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r25
thr3_nuke_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_159), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r29
	.word 0xba12000b  ! 4: OR_R	or 	%r8, %r11, %r29
	.word 0xaa422333  ! 4: ADDC_I	addc 	%r8, 0x0333, %r21
	.word 0xb629c00a  ! 4: ANDN_R	andn 	%r7, %r10, %r27
	.word 0xae096bec  ! 4: AND_I	and 	%r5, 0x0bec, %r23
thr3_resum_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_159), 16, 16)) -> intp(0, 3, 1)
	.word 0xb49a2a26  ! 4: XORcc_I	xorcc 	%r8, 0x0a26, %r26
	.word 0xbd31100c  ! 4: SRLX_R	srlx	%r4, %r12, %r30
	.word 0xa899000f  ! 4: XORcc_R	xorcc 	%r4, %r15, %r20
thr3_hw_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_160), 16, 16)) -> intp(1, 0, 1)
	.word 0xb001000a  ! 4: ADD_R	add 	%r4, %r10, %r24
	.word 0xad30c00f  ! 4: SRL_R	srl 	%r3, %r15, %r22
	.word 0xb611e9b4  ! 4: OR_I	or 	%r7, 0x09b4, %r27
	.word 0xaf293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r23
	.word 0xb6c1c00b  ! 4: ADDCcc_R	addccc 	%r7, %r11, %r27
	.word 0xb6c1400b  ! 4: ADDCcc_R	addccc 	%r5, %r11, %r27
thr3_nuke_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_161), 16, 16)) -> intp(1, 2, 1)
	.word 0xad2a000a  ! 4: SLL_R	sll 	%r8, %r10, %r22
	.word 0xb2b9e6b4  ! 4: XNORcc_I	xnorcc 	%r7, 0x06b4, %r25
	.word 0xb841400b  ! 4: ADDC_R	addc 	%r5, %r11, %r28
	.word 0xb811800f  ! 4: OR_R	or 	%r6, %r15, %r28
	.word 0xbc396ba3  ! 4: XNOR_I	xnor 	%r5, 0x0ba3, %r30
thr3_resum_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_161), 16, 16)) -> intp(1, 3, 1)
	.word 0xba38ae10  ! 4: XNOR_I	xnor 	%r2, 0x0e10, %r29
	.word 0xa9396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r20
thr3_hw_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_162), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b22195  ! 4: ORNcc_I	orncc 	%r8, 0x0195, %r26
	.word 0xae91000e  ! 4: ORcc_R	orcc 	%r4, %r14, %r23
	.word 0xbb31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r29
	.word 0xb011800c  ! 4: OR_R	or 	%r6, %r12, %r24
	.word 0xb608ae68  ! 4: AND_I	and 	%r2, 0x0e68, %r27
	.word 0xb728800a  ! 4: SLL_R	sll 	%r2, %r10, %r27
	.word 0xa811c00e  ! 4: OR_R	or 	%r7, %r14, %r20
thr3_nuke_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_163), 16, 16)) -> intp(1, 2, 1)
	.word 0xab30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r21
	.word 0xb8b9ab6f  ! 4: XNORcc_I	xnorcc 	%r6, 0x0b6f, %r28
	.word 0xb619a8e6  ! 4: XOR_I	xor 	%r6, 0x08e6, %r27
	.word 0xab2a000e  ! 4: SLL_R	sll 	%r8, %r14, %r21
	.word 0xbd2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r30
	.word 0xaec1400a  ! 4: ADDCcc_R	addccc 	%r5, %r10, %r23
	.word 0xb8a8800d  ! 4: ANDNcc_R	andncc 	%r2, %r13, %r28
thr3_resum_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163), 16, 16)) -> intp(1, 3, 1)
	.word 0xac0a2a33  ! 4: AND_I	and 	%r8, 0x0a33, %r22
	.word 0xb128a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r24
	.word 0xb889c00a  ! 4: ANDcc_R	andcc 	%r7, %r10, %r28
	.word 0xb779840c  ! 4: MOVR_R	move	%r6, %r12, %r27
thr3_nuke_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_164), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc09ee95  ! 4: AND_I	and 	%r7, 0x0e95, %r30
	.word 0xb6b12f8e  ! 4: ORNcc_I	orncc 	%r4, 0x0f8e, %r27
	.word 0xa8c12cf7  ! 4: ADDCcc_I	addccc 	%r4, 0x0cf7, %r20
	.word 0xab39c00a  ! 4: SRA_R	sra 	%r7, %r10, %r21
	.word 0xac91000c  ! 4: ORcc_R	orcc 	%r4, %r12, %r22
	.word 0xbcb9400d  ! 4: XNORcc_R	xnorcc 	%r5, %r13, %r30
thr3_resum_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_164), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6416ef5  ! 4: ADDC_I	addc 	%r5, 0x0ef5, %r27
	.word 0xaa31e0e5  ! 4: ORN_I	orn 	%r7, 0x00e5, %r21
	.word 0xacc0c00e  ! 4: ADDCcc_R	addccc 	%r3, %r14, %r22
thr3_hw_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_165), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa979440d  ! 4: MOVR_R	move	%r5, %r13, %r20
	.word 0xb801a11d  ! 4: ADD_I	add 	%r6, 0x011d, %r28
	.word 0xb019800a  ! 4: XOR_R	xor 	%r6, %r10, %r24
	.word 0xaec1c00f  ! 4: ADDCcc_R	addccc 	%r7, %r15, %r23
thr3_hw_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_166), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8b8800e  ! 4: XNORcc_R	xnorcc 	%r2, %r14, %r28
	.word 0xaeb9800c  ! 4: XNORcc_R	xnorcc 	%r6, %r12, %r23
	.word 0xb2c1000d  ! 4: ADDCcc_R	addccc 	%r4, %r13, %r25
	.word 0xaf78c40c  ! 4: MOVR_R	move	%r3, %r12, %r23
	.word 0xb6c1e211  ! 4: ADDCcc_I	addccc 	%r7, 0x0211, %r27
	.word 0xb128f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r24
thr3_hw_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_167), 16, 16)) -> intp(1, 0, 1)
	.word 0xbc38a28a  ! 4: XNOR_I	xnor 	%r2, 0x028a, %r30
	.word 0xbc28c00f  ! 4: ANDN_R	andn 	%r3, %r15, %r30
	.word 0xbd2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r30
	.word 0xaa39800e  ! 4: XNOR_R	xnor 	%r6, %r14, %r21
	.word 0xb831400d  ! 4: ORN_R	orn 	%r5, %r13, %r28
	.word 0xb099c00a  ! 4: XORcc_R	xorcc 	%r7, %r10, %r24
	.word 0xae89800a  ! 4: ANDcc_R	andcc 	%r6, %r10, %r23
thr3_nuke_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_168), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc29e201  ! 4: ANDN_I	andn 	%r7, 0x0201, %r30
	.word 0xae19400a  ! 4: XOR_R	xor 	%r5, %r10, %r23
	.word 0xa812000e  ! 4: OR_R	or 	%r8, %r14, %r20
	.word 0xa8b9a787  ! 4: XNORcc_I	xnorcc 	%r6, 0x0787, %r20
thr3_resum_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168), 16, 16)) -> intp(1, 3, 1)
	.word 0xa84165c2  ! 4: ADDC_I	addc 	%r5, 0x05c2, %r20
thr3_nuke_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_169), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc8a26f1  ! 4: ANDcc_I	andcc 	%r8, 0x06f1, %r30
	.word 0xa92a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r20
	.word 0xb609000c  ! 4: AND_R	and 	%r4, %r12, %r27
	.word 0xbb28900d  ! 4: SLLX_R	sllx	%r2, %r13, %r29
	.word 0xb17a2401  ! 4: MOVR_I	move	%r8, 0xd, %r24
	.word 0xb930d00d  ! 4: SRLX_R	srlx	%r3, %r13, %r28
	.word 0xaf796401  ! 4: MOVR_I	move	%r5, 0xd, %r23
thr3_resum_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_169), 16, 16)) -> intp(0, 3, 1)
	.word 0xac89205d  ! 4: ANDcc_I	andcc 	%r4, 0x005d, %r22
	.word 0xbd39100c  ! 4: SRAX_R	srax	%r4, %r12, %r30
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_170), 16, 16)) -> intp(1, 2, 1)
	.word 0xb898c00e  ! 4: XORcc_R	xorcc 	%r3, %r14, %r28
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb092000a  ! 4: ORcc_R	orcc 	%r8, %r10, %r24
	.word 0xb899e185  ! 4: XORcc_I	xorcc 	%r7, 0x0185, %r28
	.word 0xa891ec44  ! 4: ORcc_I	orcc 	%r7, 0x0c44, %r20
thr3_resum_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170), 16, 16)) -> intp(1, 3, 1)
	.word 0xad396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r22
	.word 0xac90c00b  ! 4: ORcc_R	orcc 	%r3, %r11, %r22
	.word 0xb6c1c00c  ! 4: ADDCcc_R	addccc 	%r7, %r12, %r27
thr3_hw_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_171), 16, 16)) -> intp(1, 0, 1)
	.word 0xb099400f  ! 4: XORcc_R	xorcc 	%r5, %r15, %r24
	.word 0xad3a100e  ! 4: SRAX_R	srax	%r8, %r14, %r22
	.word 0xb4b9e8d9  ! 4: XNORcc_I	xnorcc 	%r7, 0x08d9, %r26
	.word 0xbd296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r30
	.word 0xb291ec53  ! 4: ORcc_I	orcc 	%r7, 0x0c53, %r25
	.word 0xac9a2a5e  ! 4: XORcc_I	xorcc 	%r8, 0x0a5e, %r22
	.word 0xac2a000b  ! 4: ANDN_R	andn 	%r8, %r11, %r22
thr3_hw_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_172), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8396fc2  ! 4: XNOR_I	xnor 	%r5, 0x0fc2, %r20
	.word 0xb20166a7  ! 4: ADD_I	add 	%r5, 0x06a7, %r25
	.word 0xb1292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r24
	.word 0xb23121a2  ! 4: ORN_I	orn 	%r4, 0x01a2, %r25
	.word 0xa880800d  ! 4: ADDcc_R	addcc 	%r2, %r13, %r20
	.word 0xac99400c  ! 4: XORcc_R	xorcc 	%r5, %r12, %r22
thr3_nuke_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_173), 16, 16)) -> intp(1, 2, 1)
	.word 0xac8a2fbc  ! 4: ANDcc_I	andcc 	%r8, 0x0fbc, %r22
	.word 0xba02000d  ! 4: ADD_R	add 	%r8, %r13, %r29
	.word 0xac08800e  ! 4: AND_R	and 	%r2, %r14, %r22
thr3_resum_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_173), 16, 16)) -> intp(1, 3, 1)
	.word 0xaab92738  ! 4: XNORcc_I	xnorcc 	%r4, 0x0738, %r21
thr3_hw_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_174), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8b1000c  ! 4: ORNcc_R	orncc 	%r4, %r12, %r28
	.word 0xbab1221b  ! 4: ORNcc_I	orncc 	%r4, 0x021b, %r29
	.word 0xbd297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r30
	.word 0xac90eb1e  ! 4: ORcc_I	orcc 	%r3, 0x0b1e, %r22
	.word 0xaf7a040b  ! 4: MOVR_R	move	%r8, %r11, %r23
	.word 0xae39800c  ! 4: XNOR_R	xnor 	%r6, %r12, %r23
	.word 0xb009800c  ! 4: AND_R	and 	%r6, %r12, %r24
thr3_nuke_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_175), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8c1c00b  ! 4: ADDCcc_R	addccc 	%r7, %r11, %r20
	.word 0xae99c00c  ! 4: XORcc_R	xorcc 	%r7, %r12, %r23
thr3_resum_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175), 16, 16)) -> intp(1, 3, 1)
	.word 0xb7796401  ! 4: MOVR_I	move	%r5, 0xc, %r27
	.word 0xa939100e  ! 4: SRAX_R	srax	%r4, %r14, %r20
	.word 0xa898800e  ! 4: XORcc_R	xorcc 	%r2, %r14, %r20
thr3_hw_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_176), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc19000a  ! 4: XOR_R	xor 	%r4, %r10, %r30
	.word 0xba99800c  ! 4: XORcc_R	xorcc 	%r6, %r12, %r29
	.word 0xa8892801  ! 4: ANDcc_I	andcc 	%r4, 0x0801, %r20
	.word 0xa931f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r20
	.word 0xba30e145  ! 4: ORN_I	orn 	%r3, 0x0145, %r29
	.word 0xb69923cd  ! 4: XORcc_I	xorcc 	%r4, 0x03cd, %r27
	.word 0xb0122ee4  ! 4: OR_I	or 	%r8, 0x0ee4, %r24
thr3_hw_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_177), 16, 16)) -> intp(0, 0, 1)
	.word 0xb091eedc  ! 4: ORcc_I	orcc 	%r7, 0x0edc, %r24
	.word 0xb289800b  ! 4: ANDcc_R	andcc 	%r6, %r11, %r25
	.word 0xacb8c00a  ! 4: XNORcc_R	xnorcc 	%r3, %r10, %r22
	.word 0xb090ef7e  ! 4: ORcc_I	orcc 	%r3, 0x0f7e, %r24
	.word 0xbc30800c  ! 4: ORN_R	orn 	%r2, %r12, %r30
	.word 0xaf64180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae88800f  ! 4: ANDcc_R	andcc 	%r2, %r15, %r23
thr3_nuke_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_178), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6b1800a  ! 4: ORNcc_R	orncc 	%r6, %r10, %r27
	.word 0xbac22f3a  ! 4: ADDCcc_I	addccc 	%r8, 0x0f3a, %r29
	.word 0xae1163cb  ! 4: OR_I	or 	%r5, 0x03cb, %r23
	.word 0xaf64180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb889649a  ! 4: ANDcc_I	andcc 	%r5, 0x049a, %r28
	.word 0xa880a1ec  ! 4: ADDcc_I	addcc 	%r2, 0x01ec, %r20
	.word 0xaa09400e  ! 4: AND_R	and 	%r5, %r14, %r21
thr3_resum_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178), 16, 16)) -> intp(1, 3, 1)
	.word 0xbd316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r30
	.word 0xb899a649  ! 4: XORcc_I	xorcc 	%r6, 0x0649, %r28
thr3_hw_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_179), 16, 16)) -> intp(0, 0, 1)
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa8c0e216  ! 4: ADDCcc_I	addccc 	%r3, 0x0216, %r20
	.word 0xab79440b  ! 4: MOVR_R	move	%r5, %r11, %r21
	.word 0xae1a000e  ! 4: XOR_R	xor 	%r8, %r14, %r23
	.word 0xba88800b  ! 4: ANDcc_R	andcc 	%r2, %r11, %r29
	.word 0xb040800d  ! 4: ADDC_R	addc 	%r2, %r13, %r24
thr3_nuke_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_180), 16, 16)) -> intp(1, 2, 1)
	.word 0xba28c00a  ! 4: ANDN_R	andn 	%r3, %r10, %r29
	.word 0xae19e05a  ! 4: XOR_I	xor 	%r7, 0x005a, %r23
	.word 0xaac1e61b  ! 4: ADDCcc_I	addccc 	%r7, 0x061b, %r21
	.word 0xb09921ac  ! 4: XORcc_I	xorcc 	%r4, 0x01ac, %r24
	.word 0xb9792401  ! 4: MOVR_I	move	%r4, 0x1ac, %r28
thr3_resum_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf29d00f  ! 4: SLLX_R	sllx	%r7, %r15, %r23
	.word 0xb629a7bb  ! 4: ANDN_I	andn 	%r6, 0x07bb, %r27
thr3_hw_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_181), 16, 16)) -> intp(1, 0, 1)
	.word 0xb632000a  ! 4: ORN_R	orn 	%r8, %r10, %r27
	.word 0xa929400c  ! 4: SLL_R	sll 	%r5, %r12, %r20
	.word 0xab31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r21
	.word 0xad796401  ! 4: MOVR_I	move	%r5, 0x1, %r22
	.word 0xb4192476  ! 4: XOR_I	xor 	%r4, 0x0476, %r26
	.word 0xa964180e  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_182), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf29100b  ! 4: SLLX_R	sllx	%r4, %r11, %r23
	.word 0xb408c00b  ! 4: AND_R	and 	%r3, %r11, %r26
	.word 0xb8b9800d  ! 4: XNORcc_R	xnorcc 	%r6, %r13, %r28
	.word 0xaab8a0bc  ! 4: XNORcc_I	xnorcc 	%r2, 0x00bc, %r21
	.word 0xb564180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa929800e  ! 4: SLL_R	sll 	%r6, %r14, %r20
thr3_hw_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_183), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2092f57  ! 4: AND_I	and 	%r4, 0x0f57, %r25
	.word 0xa828aee4  ! 4: ANDN_I	andn 	%r2, 0x0ee4, %r20
	.word 0xba18800f  ! 4: XOR_R	xor 	%r2, %r15, %r29
	.word 0xaf64180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa841e13d  ! 4: ADDC_I	addc 	%r7, 0x013d, %r20
	.word 0xb029e7ea  ! 4: ANDN_I	andn 	%r7, 0x07ea, %r24
thr3_hw_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_184), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8b0800c  ! 4: ORNcc_R	orncc 	%r2, %r12, %r28
	.word 0xb13a100f  ! 4: SRAX_R	srax	%r8, %r15, %r24
	.word 0xa829ea4b  ! 4: ANDN_I	andn 	%r7, 0x0a4b, %r20
	.word 0xa938d00b  ! 4: SRAX_R	srax	%r3, %r11, %r20
	.word 0xb8b0a408  ! 4: ORNcc_I	orncc 	%r2, 0x0408, %r28
	.word 0xae98e70e  ! 4: XORcc_I	xorcc 	%r3, 0x070e, %r23
	.word 0xbb312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r29
thr3_hw_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_185), 16, 16)) -> intp(0, 0, 1)
	.word 0xb010ef54  ! 4: OR_I	or 	%r3, 0x0f54, %r24
	.word 0xb69a000a  ! 4: XORcc_R	xorcc 	%r8, %r10, %r27
	.word 0xacb2000d  ! 4: ORNcc_R	orncc 	%r8, %r13, %r22
	.word 0xaa016702  ! 4: ADD_I	add 	%r5, 0x0702, %r21
	.word 0xacba000d  ! 4: XNORcc_R	xnorcc 	%r8, %r13, %r22
	.word 0xb089ec34  ! 4: ANDcc_I	andcc 	%r7, 0x0c34, %r24
thr3_nuke_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_186), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd31000f  ! 4: SRL_R	srl 	%r4, %r15, %r30
	.word 0xa8c22c0f  ! 4: ADDCcc_I	addccc 	%r8, 0x0c0f, %r20
	.word 0xba18c00b  ! 4: XOR_R	xor 	%r3, %r11, %r29
	.word 0xb091e417  ! 4: ORcc_I	orcc 	%r7, 0x0417, %r24
	.word 0xbcc1c00f  ! 4: ADDCcc_R	addccc 	%r7, %r15, %r30
	.word 0xb964180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb698a838  ! 4: XORcc_I	xorcc 	%r2, 0x0838, %r27
thr3_resum_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_186), 16, 16)) -> intp(1, 3, 1)
	.word 0xba29000f  ! 4: ANDN_R	andn 	%r4, %r15, %r29
thr3_nuke_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_187), 16, 16)) -> intp(0, 2, 1)
	.word 0xad2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r22
	.word 0xac922673  ! 4: ORcc_I	orcc 	%r8, 0x0673, %r22
	.word 0xae91000a  ! 4: ORcc_R	orcc 	%r4, %r10, %r23
	.word 0xaa98ea83  ! 4: XORcc_I	xorcc 	%r3, 0x0a83, %r21
thr3_resum_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187), 16, 16)) -> intp(0, 3, 1)
	.word 0xae88e181  ! 4: ANDcc_I	andcc 	%r3, 0x0181, %r23
	.word 0xbc91800d  ! 4: ORcc_R	orcc 	%r6, %r13, %r30
thr3_hw_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_188), 16, 16)) -> intp(1, 0, 1)
	.word 0xae39ee87  ! 4: XNOR_I	xnor 	%r7, 0x0e87, %r23
	.word 0xbcc22b0a  ! 4: ADDCcc_I	addccc 	%r8, 0x0b0a, %r30
	.word 0xba30a919  ! 4: ORN_I	orn 	%r2, 0x0919, %r29
	.word 0xac98af58  ! 4: XORcc_I	xorcc 	%r2, 0x0f58, %r22
	.word 0xb800c00e  ! 4: ADD_R	add 	%r3, %r14, %r28
	.word 0xae39a45b  ! 4: XNOR_I	xnor 	%r6, 0x045b, %r23
	.word 0xbc90c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r30
thr3_hw_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_189), 16, 16)) -> intp(1, 0, 1)
	.word 0xbcb8ec03  ! 4: XNORcc_I	xnorcc 	%r3, 0x0c03, %r30
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xae08800f  ! 4: AND_R	and 	%r2, %r15, %r23
	.word 0xac92000b  ! 4: ORcc_R	orcc 	%r8, %r11, %r22
	.word 0xa832000f  ! 4: ORN_R	orn 	%r8, %r15, %r20
	.word 0xaf2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0xbc31400e  ! 4: ORN_R	orn 	%r5, %r14, %r30
thr3_nuke_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_190), 16, 16)) -> intp(0, 2, 1)
	.word 0xba016d71  ! 4: ADD_I	add 	%r5, 0x0d71, %r29
	.word 0xa831800a  ! 4: ORN_R	orn 	%r6, %r10, %r20
	.word 0xb930f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r28
	.word 0xba41400e  ! 4: ADDC_R	addc 	%r5, %r14, %r29
	.word 0xaf30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r23
	.word 0xa89925dc  ! 4: XORcc_I	xorcc 	%r4, 0x05dc, %r20
thr3_resum_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_190), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2022a09  ! 4: ADD_I	add 	%r8, 0x0a09, %r25
	.word 0xa830c00a  ! 4: ORN_R	orn 	%r3, %r10, %r20
	.word 0xbc91400a  ! 4: ORcc_R	orcc 	%r5, %r10, %r30
thr3_nuke_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_191), 16, 16)) -> intp(1, 2, 1)
	.word 0xb928800f  ! 4: SLL_R	sll 	%r2, %r15, %r28
	.word 0xb6b1a580  ! 4: ORNcc_I	orncc 	%r6, 0x0580, %r27
	.word 0xb432000a  ! 4: ORN_R	orn 	%r8, %r10, %r26
	.word 0xae99000b  ! 4: XORcc_R	xorcc 	%r4, %r11, %r23
	.word 0xaa812521  ! 4: ADDcc_I	addcc 	%r4, 0x0521, %r21
	.word 0xb6b96571  ! 4: XNORcc_I	xnorcc 	%r5, 0x0571, %r27
thr3_resum_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_191), 16, 16)) -> intp(1, 3, 1)
	.word 0xb818800f  ! 4: XOR_R	xor 	%r2, %r15, %r28
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_192), 16, 16)) -> intp(1, 2, 1)
	.word 0xad796401  ! 4: MOVR_I	move	%r5, 0xf, %r22
	.word 0xb8c0800f  ! 4: ADDCcc_R	addccc 	%r2, %r15, %r28
	.word 0xbcb2000d  ! 4: ORNcc_R	orncc 	%r8, %r13, %r30
	.word 0xae99e3e5  ! 4: XORcc_I	xorcc 	%r7, 0x03e5, %r23
	.word 0xba0164c1  ! 4: ADD_I	add 	%r5, 0x04c1, %r29
	.word 0xba812926  ! 4: ADDcc_I	addcc 	%r4, 0x0926, %r29
	.word 0xb831c00b  ! 4: ORN_R	orn 	%r7, %r11, %r28
thr3_resum_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_192), 16, 16)) -> intp(1, 3, 1)
	.word 0xb738e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r27
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb89a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r28
thr3_hw_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_193), 16, 16)) -> intp(0, 0, 1)
	.word 0xa881800b  ! 4: ADDcc_R	addcc 	%r6, %r11, %r20
	.word 0xb164180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb2c12a36  ! 4: ADDCcc_I	addccc 	%r4, 0x0a36, %r25
	.word 0xac32000c  ! 4: ORN_R	orn 	%r8, %r12, %r22
	.word 0xaf79440c  ! 4: MOVR_R	move	%r5, %r12, %r23
	.word 0xb964180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb03167eb  ! 4: ORN_I	orn 	%r5, 0x07eb, %r24
thr3_hw_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_194), 16, 16)) -> intp(0, 0, 1)
	.word 0xae91400d  ! 4: ORcc_R	orcc 	%r5, %r13, %r23
	.word 0xb3296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r25
	.word 0xb8b1c00e  ! 4: ORNcc_R	orncc 	%r7, %r14, %r28
	.word 0xb410e58a  ! 4: OR_I	or 	%r3, 0x058a, %r26
	.word 0xb29a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r25
	.word 0xb0c1000d  ! 4: ADDCcc_R	addccc 	%r4, %r13, %r24
	.word 0xb531f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r26
thr3_nuke_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_195), 16, 16)) -> intp(1, 2, 1)
	.word 0xae99000f  ! 4: XORcc_R	xorcc 	%r4, %r15, %r23
	.word 0xb0c0c00e  ! 4: ADDCcc_R	addccc 	%r3, %r14, %r24
thr3_resum_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_195), 16, 16)) -> intp(1, 3, 1)
	.word 0xac89800d  ! 4: ANDcc_R	andcc 	%r6, %r13, %r22
	.word 0xbb313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r29
	.word 0xbc11c00d  ! 4: OR_R	or 	%r7, %r13, %r30
thr3_nuke_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_196), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2a8a80a  ! 4: ANDNcc_I	andncc 	%r2, 0x080a, %r25
	.word 0xb619c00b  ! 4: XOR_R	xor 	%r7, %r11, %r27
thr3_resum_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196), 16, 16)) -> intp(0, 3, 1)
	.word 0xb938c00e  ! 4: SRA_R	sra 	%r3, %r14, %r28
	.word 0xb42924b8  ! 4: ANDN_I	andn 	%r4, 0x04b8, %r26
thr3_hw_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_197), 16, 16)) -> intp(1, 0, 1)
	.word 0xad792401  ! 4: MOVR_I	move	%r4, 0x4b8, %r22
	.word 0xa82969aa  ! 4: ANDN_I	andn 	%r5, 0x09aa, %r20
	.word 0xb739e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r27
	.word 0xb5396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r26
	.word 0xb32a000f  ! 4: SLL_R	sll 	%r8, %r15, %r25
	.word 0xa811ed71  ! 4: OR_I	or 	%r7, 0x0d71, %r20
thr3_nuke_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_198), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc08eef3  ! 4: AND_I	and 	%r3, 0x0ef3, %r30
	.word 0xb129a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r24
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb499000d  ! 4: XORcc_R	xorcc 	%r4, %r13, %r26
	.word 0xb129b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r24
	.word 0xaa30c00e  ! 4: ORN_R	orn 	%r3, %r14, %r21
	.word 0xab29b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r21
thr3_resum_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198), 16, 16)) -> intp(0, 3, 1)
	.word 0xae31400b  ! 4: ORN_R	orn 	%r5, %r11, %r23
	.word 0xbb31d00b  ! 4: SRLX_R	srlx	%r7, %r11, %r29
	.word 0xaa8a2c65  ! 4: ANDcc_I	andcc 	%r8, 0x0c65, %r21
thr3_nuke_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_199), 16, 16)) -> intp(1, 2, 1)
	.word 0xb029c00f  ! 4: ANDN_R	andn 	%r7, %r15, %r24
	.word 0xbb39d00d  ! 4: SRAX_R	srax	%r7, %r13, %r29
	.word 0xad31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r22
	.word 0xa810800e  ! 4: OR_R	or 	%r2, %r14, %r20
	.word 0xbca9000b  ! 4: ANDNcc_R	andncc 	%r4, %r11, %r30
	.word 0xaa18aa7f  ! 4: XOR_I	xor 	%r2, 0x0a7f, %r21
	.word 0xbab1800b  ! 4: ORNcc_R	orncc 	%r6, %r11, %r29
thr3_resum_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_199), 16, 16)) -> intp(1, 3, 1)
	.word 0xb039c00e  ! 4: XNOR_R	xnor 	%r7, %r14, %r24
	.word 0xaa30c00f  ! 4: ORN_R	orn 	%r3, %r15, %r21
thr3_nuke_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_200), 16, 16)) -> intp(1, 2, 1)
	.word 0xb579c40e  ! 4: MOVR_R	move	%r7, %r14, %r26
	.word 0xb839c00f  ! 4: XNOR_R	xnor 	%r7, %r15, %r28
thr3_resum_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_200), 16, 16)) -> intp(1, 3, 1)
	.word 0xb829c00d  ! 4: ANDN_R	andn 	%r7, %r13, %r28
	.word 0xa8296707  ! 4: ANDN_I	andn 	%r5, 0x0707, %r20
thr3_hw_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_201), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r23
	.word 0xb281ab41  ! 4: ADDcc_I	addcc 	%r6, 0x0b41, %r25
	.word 0xb209eba2  ! 4: AND_I	and 	%r7, 0x0ba2, %r25
	.word 0xb6ba000a  ! 4: XNORcc_R	xnorcc 	%r8, %r10, %r27
	.word 0xbc89000e  ! 4: ANDcc_R	andcc 	%r4, %r14, %r30
	.word 0xb8b12d04  ! 4: ORNcc_I	orncc 	%r4, 0x0d04, %r28
	.word 0xbac0e5bc  ! 4: ADDCcc_I	addccc 	%r3, 0x05bc, %r29
thr3_hw_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_202), 16, 16)) -> intp(1, 0, 1)
	.word 0xb128d00f  ! 4: SLLX_R	sllx	%r3, %r15, %r24
	.word 0xb841a783  ! 4: ADDC_I	addc 	%r6, 0x0783, %r28
	.word 0xb0c16bb4  ! 4: ADDCcc_I	addccc 	%r5, 0x0bb4, %r24
	.word 0xae01c00e  ! 4: ADD_R	add 	%r7, %r14, %r23
	.word 0xad39000c  ! 4: SRA_R	sra 	%r4, %r12, %r22
	.word 0xbc88e9a9  ! 4: ANDcc_I	andcc 	%r3, 0x09a9, %r30
	.word 0xbb29b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r29
thr3_hw_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_203), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2a8800e  ! 4: ANDNcc_R	andncc 	%r2, %r14, %r25
	.word 0xae28eb6a  ! 4: ANDN_I	andn 	%r3, 0x0b6a, %r23
	.word 0xac90c00d  ! 4: ORcc_R	orcc 	%r3, %r13, %r22
	.word 0xb688800a  ! 4: ANDcc_R	andcc 	%r2, %r10, %r27
	.word 0xb8b9a418  ! 4: XNORcc_I	xnorcc 	%r6, 0x0418, %r28
	.word 0xb130e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r24
	.word 0xaa19e866  ! 4: XOR_I	xor 	%r7, 0x0866, %r21
thr3_nuke_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_204), 16, 16)) -> intp(0, 2, 1)
	.word 0xb178e401  ! 4: MOVR_I	move	%r3, 0x866, %r24
	.word 0xb539000c  ! 4: SRA_R	sra 	%r4, %r12, %r26
	.word 0xa838c00a  ! 4: XNOR_R	xnor 	%r3, %r10, %r20
	.word 0xaa40c00d  ! 4: ADDC_R	addc 	%r3, %r13, %r21
	.word 0xb731400a  ! 4: SRL_R	srl 	%r5, %r10, %r27
	.word 0xb429800e  ! 4: ANDN_R	andn 	%r6, %r14, %r26
thr3_resum_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204), 16, 16)) -> intp(0, 3, 1)
	.word 0xa964180e  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_205), 16, 16)) -> intp(0, 2, 1)
	.word 0xb229800c  ! 4: ANDN_R	andn 	%r6, %r12, %r25
	.word 0xb529d00f  ! 4: SLLX_R	sllx	%r7, %r15, %r26
	.word 0xb618ac86  ! 4: XOR_I	xor 	%r2, 0x0c86, %r27
	.word 0xba39800b  ! 4: XNOR_R	xnor 	%r6, %r11, %r29
thr3_resum_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_205), 16, 16)) -> intp(0, 3, 1)
	.word 0xb37a2401  ! 4: MOVR_I	move	%r8, 0xb, %r25
	.word 0xbb312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r29
	.word 0xbb2a100e  ! 4: SLLX_R	sllx	%r8, %r14, %r29
	.word 0xaa10acc5  ! 4: OR_I	or 	%r2, 0x0cc5, %r21
thr3_hw_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_206), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa02000d  ! 4: ADD_R	add 	%r8, %r13, %r21
	.word 0xac89800d  ! 4: ANDcc_R	andcc 	%r6, %r13, %r22
	.word 0xb539e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r26
	.word 0xbac1800a  ! 4: ADDCcc_R	addccc 	%r6, %r10, %r29
	.word 0xb808ad4a  ! 4: AND_I	and 	%r2, 0x0d4a, %r28
	.word 0xa938e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r20
thr3_hw_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_207), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa19000b  ! 4: XOR_R	xor 	%r4, %r11, %r21
	.word 0xa89a2945  ! 4: XORcc_I	xorcc 	%r8, 0x0945, %r20
	.word 0xb138900a  ! 4: SRAX_R	srax	%r2, %r10, %r24
	.word 0xba08c00e  ! 4: AND_R	and 	%r3, %r14, %r29
	.word 0xac412c30  ! 4: ADDC_I	addc 	%r4, 0x0c30, %r22
	.word 0xb099400f  ! 4: XORcc_R	xorcc 	%r5, %r15, %r24
thr3_hw_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_208), 16, 16)) -> intp(1, 0, 1)
	.word 0xb081800f  ! 4: ADDcc_R	addcc 	%r6, %r15, %r24
	.word 0xb978c40a  ! 4: MOVR_R	move	%r3, %r10, %r28
	.word 0xaa092443  ! 4: AND_I	and 	%r4, 0x0443, %r21
	.word 0xba31e8af  ! 4: ORN_I	orn 	%r7, 0x08af, %r29
	.word 0xb489ef92  ! 4: ANDcc_I	andcc 	%r7, 0x0f92, %r26
	.word 0xaa2926c8  ! 4: ANDN_I	andn 	%r4, 0x06c8, %r21
thr3_hw_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_209), 16, 16)) -> intp(0, 0, 1)
	.word 0xacb2000d  ! 4: ORNcc_R	orncc 	%r8, %r13, %r22
	.word 0xac1a000a  ! 4: XOR_R	xor 	%r8, %r10, %r22
	.word 0xb0b2000b  ! 4: ORNcc_R	orncc 	%r8, %r11, %r24
	.word 0xad28d00e  ! 4: SLLX_R	sllx	%r3, %r14, %r22
	.word 0xb200eabe  ! 4: ADD_I	add 	%r3, 0x0abe, %r25
	.word 0xb6b1000b  ! 4: ORNcc_R	orncc 	%r4, %r11, %r27
	.word 0xb080c00d  ! 4: ADDcc_R	addcc 	%r3, %r13, %r24
thr3_nuke_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_210), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa196249  ! 4: XOR_I	xor 	%r5, 0x0249, %r21
	.word 0xae896406  ! 4: ANDcc_I	andcc 	%r5, 0x0406, %r23
	.word 0xae19800d  ! 4: XOR_R	xor 	%r6, %r13, %r23
	.word 0xb6b0800a  ! 4: ORNcc_R	orncc 	%r2, %r10, %r27
	.word 0xb4a96bfd  ! 4: ANDNcc_I	andncc 	%r5, 0x0bfd, %r26
	.word 0xb238c00e  ! 4: XNOR_R	xnor 	%r3, %r14, %r25
	.word 0xb0a8a260  ! 4: ANDNcc_I	andncc 	%r2, 0x0260, %r24
thr3_resum_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210), 16, 16)) -> intp(1, 3, 1)
	.word 0xb610800c  ! 4: OR_R	or 	%r2, %r12, %r27
	.word 0xb2392cd6  ! 4: XNOR_I	xnor 	%r4, 0x0cd6, %r25
	.word 0xaab1000a  ! 4: ORNcc_R	orncc 	%r4, %r10, %r21
	.word 0xb72a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r27
thr3_nuke_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_211), 16, 16)) -> intp(0, 2, 1)
	.word 0xba112d24  ! 4: OR_I	or 	%r4, 0x0d24, %r29
thr3_resum_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_211), 16, 16)) -> intp(0, 3, 1)
	.word 0xb629800d  ! 4: ANDN_R	andn 	%r6, %r13, %r27
thr3_nuke_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_212), 16, 16)) -> intp(1, 2, 1)
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa11400e  ! 4: OR_R	or 	%r5, %r14, %r21
	.word 0xb1323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r24
thr3_resum_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb8b0ed09  ! 4: ORNcc_I	orncc 	%r3, 0x0d09, %r28
thr3_nuke_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_213), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8b9800a  ! 4: XNORcc_R	xnorcc 	%r6, %r10, %r28
	.word 0xac00800f  ! 4: ADD_R	add 	%r2, %r15, %r22
	.word 0xb291e426  ! 4: ORcc_I	orcc 	%r7, 0x0426, %r25
	.word 0xb2b1c00a  ! 4: ORNcc_R	orncc 	%r7, %r10, %r25
	.word 0xb12a100b  ! 4: SLLX_R	sllx	%r8, %r11, %r24
thr3_resum_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_213), 16, 16)) -> intp(1, 3, 1)
	.word 0xb77a040e  ! 4: MOVR_R	move	%r8, %r14, %r27
	.word 0xa8a8c00d  ! 4: ANDNcc_R	andncc 	%r3, %r13, %r20
	.word 0xb291400b  ! 4: ORcc_R	orcc 	%r5, %r11, %r25
thr3_nuke_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_214), 16, 16)) -> intp(1, 2, 1)
	.word 0xb839a22c  ! 4: XNOR_I	xnor 	%r6, 0x022c, %r28
	.word 0xb938a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r28
	.word 0xa8c16c83  ! 4: ADDCcc_I	addccc 	%r5, 0x0c83, %r20
	.word 0xa964180f  ! 4: MOVcc_R	<illegal instruction>
thr3_resum_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_214), 16, 16)) -> intp(1, 3, 1)
	.word 0xa828ad5f  ! 4: ANDN_I	andn 	%r2, 0x0d5f, %r20
thr3_nuke_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_215), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8b9e6dc  ! 4: XNORcc_I	xnorcc 	%r7, 0x06dc, %r28
	.word 0xbd64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaaa8800c  ! 4: ANDNcc_R	andncc 	%r2, %r12, %r21
	.word 0xbaba2fd5  ! 4: XNORcc_I	xnorcc 	%r8, 0x0fd5, %r29
	.word 0xa82a000c  ! 4: ANDN_R	andn 	%r8, %r12, %r20
	.word 0xb32a000f  ! 4: SLL_R	sll 	%r8, %r15, %r25
thr3_resum_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_215), 16, 16)) -> intp(0, 3, 1)
	.word 0xb418ecda  ! 4: XOR_I	xor 	%r3, 0x0cda, %r26
	.word 0xbc32000f  ! 4: ORN_R	orn 	%r8, %r15, %r30
thr3_nuke_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_216), 16, 16)) -> intp(0, 2, 1)
	.word 0xa89a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r20
	.word 0xb364180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb6b920b4  ! 4: XNORcc_I	xnorcc 	%r4, 0x00b4, %r27
	.word 0xb601a8c8  ! 4: ADD_I	add 	%r6, 0x08c8, %r27
thr3_resum_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_216), 16, 16)) -> intp(0, 3, 1)
	.word 0xb890c00b  ! 4: ORcc_R	orcc 	%r3, %r11, %r28
	.word 0xb20a224a  ! 4: AND_I	and 	%r8, 0x024a, %r25
thr3_nuke_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_217), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc012ca6  ! 4: ADD_I	add 	%r4, 0x0ca6, %r30
	.word 0xb539500e  ! 4: SRAX_R	srax	%r5, %r14, %r26
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa8396e11  ! 4: XNOR_I	xnor 	%r5, 0x0e11, %r20
thr3_resum_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_217), 16, 16)) -> intp(1, 3, 1)
	.word 0xb09a000d  ! 4: XORcc_R	xorcc 	%r8, %r13, %r24
	.word 0xb618800d  ! 4: XOR_R	xor 	%r2, %r13, %r27
	.word 0xba092d5f  ! 4: AND_I	and 	%r4, 0x0d5f, %r29
	.word 0xaea928b1  ! 4: ANDNcc_I	andncc 	%r4, 0x08b1, %r23
thr3_hw_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_218), 16, 16)) -> intp(1, 0, 1)
	.word 0xb099acdd  ! 4: XORcc_I	xorcc 	%r6, 0x0cdd, %r24
	.word 0xad38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r22
	.word 0xaf29c00e  ! 4: SLL_R	sll 	%r7, %r14, %r23
	.word 0xb0a8a5cd  ! 4: ANDNcc_I	andncc 	%r2, 0x05cd, %r24
	.word 0xbd293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r30
	.word 0xb7317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r27
	.word 0xa899400f  ! 4: XORcc_R	xorcc 	%r5, %r15, %r20
thr3_hw_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_219), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa416c01  ! 4: ADDC_I	addc 	%r5, 0x0c01, %r21
	.word 0xb218c00b  ! 4: XOR_R	xor 	%r3, %r11, %r25
	.word 0xb280c00a  ! 4: ADDcc_R	addcc 	%r3, %r10, %r25
	.word 0xb6ba2660  ! 4: XNORcc_I	xnorcc 	%r8, 0x0660, %r27
	.word 0xbd64180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae09ee18  ! 4: AND_I	and 	%r7, 0x0e18, %r23
	.word 0xac41a0a2  ! 4: ADDC_I	addc 	%r6, 0x00a2, %r22
thr3_nuke_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_220), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb38800e  ! 4: SRA_R	sra 	%r2, %r14, %r29
	.word 0xa899c00d  ! 4: XORcc_R	xorcc 	%r7, %r13, %r20
	.word 0xba892361  ! 4: ANDcc_I	andcc 	%r4, 0x0361, %r29
	.word 0xbd29a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r30
	.word 0xb089c00e  ! 4: ANDcc_R	andcc 	%r7, %r14, %r24
	.word 0xbc90e0ff  ! 4: ORcc_I	orcc 	%r3, 0x00ff, %r30
	.word 0xb57a2401  ! 4: MOVR_I	move	%r8, 0xff, %r26
thr3_resum_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_220), 16, 16)) -> intp(0, 3, 1)
	.word 0xac01c00a  ! 4: ADD_R	add 	%r7, %r10, %r22
	.word 0xbb792401  ! 4: MOVR_I	move	%r4, 0xa, %r29
	.word 0xb630ad2c  ! 4: ORN_I	orn 	%r2, 0x0d2c, %r27
	.word 0xaeb8e54e  ! 4: XNORcc_I	xnorcc 	%r3, 0x054e, %r23
thr3_nuke_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_221), 16, 16)) -> intp(0, 2, 1)
	.word 0xb441a277  ! 4: ADDC_I	addc 	%r6, 0x0277, %r26
	.word 0xb8aa000b  ! 4: ANDNcc_R	andncc 	%r8, %r11, %r28
thr3_resum_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_221), 16, 16)) -> intp(0, 3, 1)
	.word 0xba11400b  ! 4: OR_R	or 	%r5, %r11, %r29
	.word 0xb779e401  ! 4: MOVR_I	move	%r7, 0xb, %r27
	.word 0xb0b128ae  ! 4: ORNcc_I	orncc 	%r4, 0x08ae, %r24
thr3_nuke_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_222), 16, 16)) -> intp(0, 2, 1)
	.word 0xba99400a  ! 4: XORcc_R	xorcc 	%r5, %r10, %r29
	.word 0xb532100b  ! 4: SRLX_R	srlx	%r8, %r11, %r26
	.word 0xacaa000e  ! 4: ANDNcc_R	andncc 	%r8, %r14, %r22
	.word 0xb4012b81  ! 4: ADD_I	add 	%r4, 0x0b81, %r26
	.word 0xb21a000c  ! 4: XOR_R	xor 	%r8, %r12, %r25
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
	.word 0xbb28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r29
thr3_resum_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_222), 16, 16)) -> intp(0, 3, 1)
	.word 0xae80c00b  ! 4: ADDcc_R	addcc 	%r3, %r11, %r23
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_223), 16, 16)) -> intp(1, 0, 1)
	.word 0xbcc12687  ! 4: ADDCcc_I	addccc 	%r4, 0x0687, %r30
	.word 0xbc41c00d  ! 4: ADDC_R	addc 	%r7, %r13, %r30
	.word 0xb408800d  ! 4: AND_R	and 	%r2, %r13, %r26
	.word 0xae38e108  ! 4: XNOR_I	xnor 	%r3, 0x0108, %r23
	.word 0xab31d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r21
	.word 0xad39100b  ! 4: SRAX_R	srax	%r4, %r11, %r22
	.word 0xb3323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r25
thr3_nuke_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_224), 16, 16)) -> intp(1, 2, 1)
	.word 0xab296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r21
	.word 0xb7392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r27
	.word 0xb229ebe9  ! 4: ANDN_I	andn 	%r7, 0x0be9, %r25
thr3_resum_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_224), 16, 16)) -> intp(1, 3, 1)
	.word 0xac08c00c  ! 4: AND_R	and 	%r3, %r12, %r22
	.word 0xa831e8a8  ! 4: ORN_I	orn 	%r7, 0x08a8, %r20
	.word 0xa8b8800c  ! 4: XNORcc_R	xnorcc 	%r2, %r12, %r20
	.word 0xb401e3b6  ! 4: ADD_I	add 	%r7, 0x03b6, %r26
thr3_hw_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_225), 16, 16)) -> intp(0, 0, 1)
	.word 0xb029000d  ! 4: ANDN_R	andn 	%r4, %r13, %r24
	.word 0xbb30800b  ! 4: SRL_R	srl 	%r2, %r11, %r29
	.word 0xb401400b  ! 4: ADD_R	add 	%r5, %r11, %r26
	.word 0xb681a8a5  ! 4: ADDcc_I	addcc 	%r6, 0x08a5, %r27
	.word 0xb0a8e842  ! 4: ANDNcc_I	andncc 	%r3, 0x0842, %r24
	.word 0xbc88800a  ! 4: ANDcc_R	andcc 	%r2, %r10, %r30
	.word 0xacb9ea11  ! 4: XNORcc_I	xnorcc 	%r7, 0x0a11, %r22
thr3_nuke_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_226), 16, 16)) -> intp(1, 2, 1)
	.word 0xad396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r22
	.word 0xb6b9800d  ! 4: XNORcc_R	xnorcc 	%r6, %r13, %r27
	.word 0xb280800d  ! 4: ADDcc_R	addcc 	%r2, %r13, %r25
	.word 0xb289800e  ! 4: ANDcc_R	andcc 	%r6, %r14, %r25
thr3_resum_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_226), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc29a0d3  ! 4: ANDN_I	andn 	%r6, 0x00d3, %r30
	.word 0xaa91400d  ! 4: ORcc_R	orcc 	%r5, %r13, %r21
	.word 0xb338a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r25
	.word 0xb738a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r27
thr3_nuke_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_227), 16, 16)) -> intp(0, 2, 1)
	.word 0xb408e47c  ! 4: AND_I	and 	%r3, 0x047c, %r26
	.word 0xba99ee14  ! 4: XORcc_I	xorcc 	%r7, 0x0e14, %r29
	.word 0xba29a6c2  ! 4: ANDN_I	andn 	%r6, 0x06c2, %r29
thr3_resum_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_227), 16, 16)) -> intp(0, 3, 1)
	.word 0xb492000d  ! 4: ORcc_R	orcc 	%r8, %r13, %r26
	.word 0xba82000f  ! 4: ADDcc_R	addcc 	%r8, %r15, %r29
thr3_hw_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_228), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2a96e96  ! 4: ANDNcc_I	andncc 	%r5, 0x0e96, %r25
	.word 0xa979a401  ! 4: MOVR_I	move	%r6, 0xfffffe96, %r20
	.word 0xb4b1ae4f  ! 4: ORNcc_I	orncc 	%r6, 0x0e4f, %r26
	.word 0xae01400a  ! 4: ADD_R	add 	%r5, %r10, %r23
	.word 0xb5292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r26
	.word 0xae3a2040  ! 4: XNOR_I	xnor 	%r8, 0x0040, %r23
	.word 0xb8a9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r28
thr3_nuke_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_229), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8b165c1  ! 4: ORNcc_I	orncc 	%r5, 0x05c1, %r20
thr3_resum_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_229), 16, 16)) -> intp(0, 3, 1)
	.word 0xb681800b  ! 4: ADDcc_R	addcc 	%r6, %r11, %r27
	.word 0xbc092b9f  ! 4: AND_I	and 	%r4, 0x0b9f, %r30
thr3_nuke_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_230), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf28c00c  ! 4: SLL_R	sll 	%r3, %r12, %r23
	.word 0xae91800f  ! 4: ORcc_R	orcc 	%r6, %r15, %r23
thr3_resum_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_230), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc412f52  ! 4: ADDC_I	addc 	%r4, 0x0f52, %r30
	.word 0xb839800a  ! 4: XNOR_R	xnor 	%r6, %r10, %r28
	.word 0xac01400b  ! 4: ADD_R	add 	%r5, %r11, %r22
	.word 0xb488800a  ! 4: ANDcc_R	andcc 	%r2, %r10, %r26
thr3_nuke_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_231), 16, 16)) -> intp(0, 2, 1)
	.word 0xa891000b  ! 4: ORcc_R	orcc 	%r4, %r11, %r20
	.word 0xb201c00d  ! 4: ADD_R	add 	%r7, %r13, %r25
	.word 0xb0b0e6d2  ! 4: ORNcc_I	orncc 	%r3, 0x06d2, %r24
	.word 0xaa88af80  ! 4: ANDcc_I	andcc 	%r2, 0x0f80, %r21
	.word 0xb329c00c  ! 4: SLL_R	sll 	%r7, %r12, %r25
thr3_resum_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd39400d  ! 4: SRA_R	sra 	%r5, %r13, %r30
	.word 0xb0b9a4dc  ! 4: XNORcc_I	xnorcc 	%r6, 0x04dc, %r24
	.word 0xbcb0c00b  ! 4: ORNcc_R	orncc 	%r3, %r11, %r30
thr3_hw_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_232), 16, 16)) -> intp(0, 0, 1)
	.word 0xbcb96685  ! 4: XNORcc_I	xnorcc 	%r5, 0x0685, %r30
	.word 0xbc31a6cb  ! 4: ORN_I	orn 	%r6, 0x06cb, %r30
	.word 0xaa91000f  ! 4: ORcc_R	orcc 	%r4, %r15, %r21
	.word 0xb329b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r25
	.word 0xb178e401  ! 4: MOVR_I	move	%r3, 0x1, %r24
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb129e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r24
thr3_nuke_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_233), 16, 16)) -> intp(0, 2, 1)
	.word 0xae3a000b  ! 4: XNOR_R	xnor 	%r8, %r11, %r23
	.word 0xaca9800c  ! 4: ANDNcc_R	andncc 	%r6, %r12, %r22
	.word 0xae09800e  ! 4: AND_R	and 	%r6, %r14, %r23
thr3_resum_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233), 16, 16)) -> intp(0, 3, 1)
	.word 0xa938a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r20
	.word 0xa841e2b7  ! 4: ADDC_I	addc 	%r7, 0x02b7, %r20
	.word 0xaea8a65e  ! 4: ANDNcc_I	andncc 	%r2, 0x065e, %r23
thr3_nuke_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_234), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2b1000c  ! 4: ORNcc_R	orncc 	%r4, %r12, %r25
thr3_resum_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_234), 16, 16)) -> intp(1, 3, 1)
	.word 0xb881a77a  ! 4: ADDcc_I	addcc 	%r6, 0x077a, %r28
	.word 0xac08800d  ! 4: AND_R	and 	%r2, %r13, %r22
thr3_hw_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_235), 16, 16)) -> intp(0, 0, 1)
	.word 0xbac0e7f5  ! 4: ADDCcc_I	addccc 	%r3, 0x07f5, %r29
	.word 0xb619400d  ! 4: XOR_R	xor 	%r5, %r13, %r27
	.word 0xaf30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r23
	.word 0xb689644b  ! 4: ANDcc_I	andcc 	%r5, 0x044b, %r27
	.word 0xab3a100a  ! 4: SRAX_R	srax	%r8, %r10, %r21
	.word 0xaf312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r23
thr3_nuke_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_236), 16, 16)) -> intp(0, 2, 1)
	.word 0xb832000e  ! 4: ORN_R	orn 	%r8, %r14, %r28
	.word 0xbb78e401  ! 4: MOVR_I	move	%r3, 0xe, %r29
	.word 0xa8b1400c  ! 4: ORNcc_R	orncc 	%r5, %r12, %r20
	.word 0xb239400d  ! 4: XNOR_R	xnor 	%r5, %r13, %r25
	.word 0xaa30c00f  ! 4: ORN_R	orn 	%r3, %r15, %r21
thr3_resum_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236), 16, 16)) -> intp(0, 3, 1)
	.word 0xb52a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r26
	.word 0xba31c00b  ! 4: ORN_R	orn 	%r7, %r11, %r29
	.word 0xacb9edac  ! 4: XNORcc_I	xnorcc 	%r7, 0x0dac, %r22
	.word 0xa964180a  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_237), 16, 16)) -> intp(0, 2, 1)
	.word 0xac9a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r22
	.word 0xbc80abe2  ! 4: ADDcc_I	addcc 	%r2, 0x0be2, %r30
	.word 0xb2a8e925  ! 4: ANDNcc_I	andncc 	%r3, 0x0925, %r25
	.word 0xae98e62d  ! 4: XORcc_I	xorcc 	%r3, 0x062d, %r23
	.word 0xb038e8ec  ! 4: XNOR_I	xnor 	%r3, 0x08ec, %r24
thr3_resum_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_237), 16, 16)) -> intp(0, 3, 1)
	.word 0xb219e2fe  ! 4: XOR_I	xor 	%r7, 0x02fe, %r25
	.word 0xa818800a  ! 4: XOR_R	xor 	%r2, %r10, %r20
thr3_nuke_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_238), 16, 16)) -> intp(0, 2, 1)
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xac28c00b  ! 4: ANDN_R	andn 	%r3, %r11, %r22
	.word 0xaa90ae2c  ! 4: ORcc_I	orcc 	%r2, 0x0e2c, %r21
thr3_resum_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_238), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb3a100c  ! 4: SRAX_R	srax	%r8, %r12, %r29
	.word 0xb6c1000b  ! 4: ADDCcc_R	addccc 	%r4, %r11, %r27
thr3_nuke_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_239), 16, 16)) -> intp(1, 2, 1)
	.word 0xb608800a  ! 4: AND_R	and 	%r2, %r10, %r27
thr3_resum_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_239), 16, 16)) -> intp(1, 3, 1)
	.word 0xaab9000d  ! 4: XNORcc_R	xnorcc 	%r4, %r13, %r21
	.word 0xb8116c0a  ! 4: OR_I	or 	%r5, 0x0c0a, %r28
thr3_hw_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_240), 16, 16)) -> intp(1, 0, 1)
	.word 0xb290afec  ! 4: ORcc_I	orcc 	%r2, 0x0fec, %r25
	.word 0xbd31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r30
	.word 0xaa02000e  ! 4: ADD_R	add 	%r8, %r14, %r21
	.word 0xb6392b00  ! 4: XNOR_I	xnor 	%r4, 0x0b00, %r27
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb6b1000d  ! 4: ORNcc_R	orncc 	%r4, %r13, %r27
thr3_hw_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_241), 16, 16)) -> intp(1, 0, 1)
	.word 0xa838800d  ! 4: XNOR_R	xnor 	%r2, %r13, %r20
	.word 0xa979440f  ! 4: MOVR_R	move	%r5, %r15, %r20
	.word 0xa898800a  ! 4: XORcc_R	xorcc 	%r2, %r10, %r20
	.word 0xb2b9000c  ! 4: XNORcc_R	xnorcc 	%r4, %r12, %r25
	.word 0xaa8a000b  ! 4: ANDcc_R	andcc 	%r8, %r11, %r21
	.word 0xa929e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r20
thr3_nuke_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_242), 16, 16)) -> intp(0, 2, 1)
	.word 0xb409c00f  ! 4: AND_R	and 	%r7, %r15, %r26
	.word 0xb01a000f  ! 4: XOR_R	xor 	%r8, %r15, %r24
thr3_resum_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_242), 16, 16)) -> intp(0, 3, 1)
	.word 0xa881000c  ! 4: ADDcc_R	addcc 	%r4, %r12, %r20
	.word 0xad312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r22
	.word 0xba09ee88  ! 4: AND_I	and 	%r7, 0x0e88, %r29
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_243), 16, 16)) -> intp(0, 2, 1)
	.word 0xaac1000e  ! 4: ADDCcc_R	addccc 	%r4, %r14, %r21
	.word 0xb8422b1c  ! 4: ADDC_I	addc 	%r8, 0x0b1c, %r28
	.word 0xb2a961bd  ! 4: ANDNcc_I	andncc 	%r5, 0x01bd, %r25
	.word 0xac11c00a  ! 4: OR_R	or 	%r7, %r10, %r22
	.word 0xb298c00d  ! 4: XORcc_R	xorcc 	%r3, %r13, %r25
thr3_resum_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243), 16, 16)) -> intp(0, 3, 1)
	.word 0xb7292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r27
thr3_nuke_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_244), 16, 16)) -> intp(1, 2, 1)
	.word 0xb481655a  ! 4: ADDcc_I	addcc 	%r5, 0x055a, %r26
	.word 0xa829000e  ! 4: ANDN_R	andn 	%r4, %r14, %r20
	.word 0xb611a58f  ! 4: OR_I	or 	%r6, 0x058f, %r27
thr3_resum_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_244), 16, 16)) -> intp(1, 3, 1)
	.word 0xb929000d  ! 4: SLL_R	sll 	%r4, %r13, %r28
	.word 0xb3312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r25
thr3_hw_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_245), 16, 16)) -> intp(0, 0, 1)
	.word 0xaca9267e  ! 4: ANDNcc_I	andncc 	%r4, 0x067e, %r22
	.word 0xbb79040e  ! 4: MOVR_R	move	%r4, %r14, %r29
	.word 0xba89af1e  ! 4: ANDcc_I	andcc 	%r6, 0x0f1e, %r29
	.word 0xbd796401  ! 4: MOVR_I	move	%r5, 0xffffff1e, %r30
	.word 0xad31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r22
	.word 0xae12000b  ! 4: OR_R	or 	%r8, %r11, %r23
thr3_nuke_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_246), 16, 16)) -> intp(0, 2, 1)
	.word 0xaca9c00f  ! 4: ANDNcc_R	andncc 	%r7, %r15, %r22
	.word 0xb139900d  ! 4: SRAX_R	srax	%r6, %r13, %r24
	.word 0xbb29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r29
	.word 0xae91800e  ! 4: ORcc_R	orcc 	%r6, %r14, %r23
thr3_resum_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_246), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc42000d  ! 4: ADDC_R	addc 	%r8, %r13, %r30
	.word 0xaab9ed6c  ! 4: XNORcc_I	xnorcc 	%r7, 0x0d6c, %r21
thr3_hw_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_247), 16, 16)) -> intp(1, 0, 1)
	.word 0xb330f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r25
	.word 0xac40e19a  ! 4: ADDC_I	addc 	%r3, 0x019a, %r22
	.word 0xa930d00e  ! 4: SRLX_R	srlx	%r3, %r14, %r20
	.word 0xacc1800b  ! 4: ADDCcc_R	addccc 	%r6, %r11, %r22
	.word 0xb139400a  ! 4: SRA_R	sra 	%r5, %r10, %r24
	.word 0xaa98e69a  ! 4: XORcc_I	xorcc 	%r3, 0x069a, %r21
	.word 0xaa30a6de  ! 4: ORN_I	orn 	%r2, 0x06de, %r21
thr3_nuke_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_248), 16, 16)) -> intp(1, 2, 1)
	.word 0xb63a293b  ! 4: XNOR_I	xnor 	%r8, 0x093b, %r27
thr3_resum_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb78a401  ! 4: MOVR_I	move	%r2, 0x93b, %r29
	.word 0xb4a9400a  ! 4: ANDNcc_R	andncc 	%r5, %r10, %r26
	.word 0xbcc163bc  ! 4: ADDCcc_I	addccc 	%r5, 0x03bc, %r30
	.word 0xb330a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r25
thr3_nuke_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_249), 16, 16)) -> intp(0, 2, 1)
	.word 0xb33a000a  ! 4: SRA_R	sra 	%r8, %r10, %r25
	.word 0xa88123bd  ! 4: ADDcc_I	addcc 	%r4, 0x03bd, %r20
	.word 0xba09400d  ! 4: AND_R	and 	%r5, %r13, %r29
	.word 0xae1a2fcb  ! 4: XOR_I	xor 	%r8, 0x0fcb, %r23
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
thr3_resum_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_249), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8b1a16e  ! 4: ORNcc_I	orncc 	%r6, 0x016e, %r28
	.word 0xab296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r21
	.word 0xbcc1800e  ! 4: ADDCcc_R	addccc 	%r6, %r14, %r30
thr3_hw_intr_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_250), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0812dab  ! 4: ADDcc_I	addcc 	%r4, 0x0dab, %r24
	.word 0xb0312964  ! 4: ORN_I	orn 	%r4, 0x0964, %r24
	.word 0xb031c00b  ! 4: ORN_R	orn 	%r7, %r11, %r24
	.word 0xb6022e7a  ! 4: ADD_I	add 	%r8, 0x0e7a, %r27
	.word 0xb889800c  ! 4: ANDcc_R	andcc 	%r6, %r12, %r28
	.word 0xa8a8a4e3  ! 4: ANDNcc_I	andncc 	%r2, 0x04e3, %r20
	.word 0xae8a230c  ! 4: ANDcc_I	andcc 	%r8, 0x030c, %r23
thr3_hw_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_251), 16, 16)) -> intp(0, 0, 1)
	.word 0xb364180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa8b9800c  ! 4: XNORcc_R	xnorcc 	%r6, %r12, %r20
	.word 0xb039400d  ! 4: XNOR_R	xnor 	%r5, %r13, %r24
	.word 0xaa91c00d  ! 4: ORcc_R	orcc 	%r7, %r13, %r21
	.word 0xae02000c  ! 4: ADD_R	add 	%r8, %r12, %r23
	.word 0xa812000b  ! 4: OR_R	or 	%r8, %r11, %r20
	.word 0xb4c0c00e  ! 4: ADDCcc_R	addccc 	%r3, %r14, %r26
thr3_hw_intr_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_252), 16, 16)) -> intp(1, 0, 1)
	.word 0xab32000a  ! 4: SRL_R	srl 	%r8, %r10, %r21
	.word 0xad3a100d  ! 4: SRAX_R	srax	%r8, %r13, %r22
	.word 0xba292b4f  ! 4: ANDN_I	andn 	%r4, 0x0b4f, %r29
	.word 0xb6c0c00d  ! 4: ADDCcc_R	addccc 	%r3, %r13, %r27
	.word 0xaa41e5aa  ! 4: ADDC_I	addc 	%r7, 0x05aa, %r21
	.word 0xbb64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa10e70f  ! 4: OR_I	or 	%r3, 0x070f, %r21
thr3_hw_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_253), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8aa2b8d  ! 4: ANDNcc_I	andncc 	%r8, 0x0b8d, %r20
	.word 0xbd79840d  ! 4: MOVR_R	move	%r6, %r13, %r30
	.word 0xaab8e858  ! 4: XNORcc_I	xnorcc 	%r3, 0x0858, %r21
	.word 0xa930a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r20
	.word 0xab39d00b  ! 4: SRAX_R	srax	%r7, %r11, %r21
	.word 0xb492000e  ! 4: ORcc_R	orcc 	%r8, %r14, %r26
thr3_nuke_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_254), 16, 16)) -> intp(1, 2, 1)
	.word 0xb13a000a  ! 4: SRA_R	sra 	%r8, %r10, %r24
	.word 0xac412fa4  ! 4: ADDC_I	addc 	%r4, 0x0fa4, %r22
	.word 0xbc19a60e  ! 4: XOR_I	xor 	%r6, 0x060e, %r30
	.word 0xab64180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb7323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r27
	.word 0xb2b8e007  ! 4: XNORcc_I	xnorcc 	%r3, 0x0007, %r25
thr3_resum_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_254), 16, 16)) -> intp(1, 3, 1)
	.word 0xb729a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r27
	.word 0xaf32100c  ! 4: SRLX_R	srlx	%r8, %r12, %r23
thr3_hw_intr_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_255), 16, 16)) -> intp(0, 0, 1)
	.word 0xa89160d9  ! 4: ORcc_I	orcc 	%r5, 0x00d9, %r20
	.word 0xab38800c  ! 4: SRA_R	sra 	%r2, %r12, %r21
	.word 0xb6c0800f  ! 4: ADDCcc_R	addccc 	%r2, %r15, %r27
	.word 0xad39800e  ! 4: SRA_R	sra 	%r6, %r14, %r22
	.word 0xab392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r21
	.word 0xae81400d  ! 4: ADDcc_R	addcc 	%r5, %r13, %r23
	.word 0xb6b22549  ! 4: ORNcc_I	orncc 	%r8, 0x0549, %r27
thr3_nuke_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_256), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8a9400d  ! 4: ANDNcc_R	andncc 	%r5, %r13, %r20
thr3_resum_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_256), 16, 16)) -> intp(0, 3, 1)
	.word 0xa881800e  ! 4: ADDcc_R	addcc 	%r6, %r14, %r20
	.word 0xb028efab  ! 4: ANDN_I	andn 	%r3, 0x0fab, %r24
	.word 0xbc90a150  ! 4: ORcc_I	orcc 	%r2, 0x0150, %r30
thr3_hw_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_257), 16, 16)) -> intp(1, 0, 1)
	.word 0xac39ecbd  ! 4: XNOR_I	xnor 	%r7, 0x0cbd, %r22
	.word 0xb539a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r26
	.word 0xab39800f  ! 4: SRA_R	sra 	%r6, %r15, %r21
	.word 0xaa40800d  ! 4: ADDC_R	addc 	%r2, %r13, %r21
	.word 0xb6b1000e  ! 4: ORNcc_R	orncc 	%r4, %r14, %r27
	.word 0xab28c00e  ! 4: SLL_R	sll 	%r3, %r14, %r21
thr3_hw_intr_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_258), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r29
	.word 0xa964180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb931d00b  ! 4: SRLX_R	srlx	%r7, %r11, %r28
	.word 0xbd64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb218a0a3  ! 4: XOR_I	xor 	%r2, 0x00a3, %r25
	.word 0xb4c123a2  ! 4: ADDCcc_I	addccc 	%r4, 0x03a2, %r26
thr3_hw_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_259), 16, 16)) -> intp(0, 0, 1)
	.word 0xba89c00d  ! 4: ANDcc_R	andcc 	%r7, %r13, %r29
	.word 0xa932000e  ! 4: SRL_R	srl 	%r8, %r14, %r20
	.word 0xbd31c00d  ! 4: SRL_R	srl 	%r7, %r13, %r30
	.word 0xac80adbc  ! 4: ADDcc_I	addcc 	%r2, 0x0dbc, %r22
	.word 0xba02000c  ! 4: ADD_R	add 	%r8, %r12, %r29
	.word 0xb480c00b  ! 4: ADDcc_R	addcc 	%r3, %r11, %r26
thr3_nuke_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_260), 16, 16)) -> intp(1, 2, 1)
	.word 0xb091400f  ! 4: ORcc_R	orcc 	%r5, %r15, %r24
	.word 0xa979a401  ! 4: MOVR_I	move	%r6, 0xf, %r20
	.word 0xbd28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r30
	.word 0xba90800b  ! 4: ORcc_R	orcc 	%r2, %r11, %r29
	.word 0xaaa9800c  ! 4: ANDNcc_R	andncc 	%r6, %r12, %r21
	.word 0xb52a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r26
thr3_resum_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_260), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8c0800a  ! 4: ADDCcc_R	addccc 	%r2, %r10, %r28
	.word 0xab30a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r21
	.word 0xbc31000c  ! 4: ORN_R	orn 	%r4, %r12, %r30
	.word 0xbd64180c  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_261), 16, 16)) -> intp(1, 0, 1)
	.word 0xb82a2862  ! 4: ANDN_I	andn 	%r8, 0x0862, %r28
	.word 0xbc40c00c  ! 4: ADDC_R	addc 	%r3, %r12, %r30
	.word 0xaa80ee99  ! 4: ADDcc_I	addcc 	%r3, 0x0e99, %r21
	.word 0xb6b1000e  ! 4: ORNcc_R	orncc 	%r4, %r14, %r27
	.word 0xa929b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r20
	.word 0xb231000c  ! 4: ORN_R	orn 	%r4, %r12, %r25
thr3_nuke_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_262), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2312bd3  ! 4: ORN_I	orn 	%r4, 0x0bd3, %r25
	.word 0xb280c00d  ! 4: ADDcc_R	addcc 	%r3, %r13, %r25
thr3_resum_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_262), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa82000a  ! 4: ADDcc_R	addcc 	%r8, %r10, %r21
	.word 0xaa9a2495  ! 4: XORcc_I	xorcc 	%r8, 0x0495, %r21
	.word 0xacc16522  ! 4: ADDCcc_I	addccc 	%r5, 0x0522, %r22
thr3_nuke_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_263), 16, 16)) -> intp(0, 2, 1)
	.word 0xaec2000f  ! 4: ADDCcc_R	addccc 	%r8, %r15, %r23
	.word 0xb3313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r25
	.word 0xac31400a  ! 4: ORN_R	orn 	%r5, %r10, %r22
	.word 0xb440800f  ! 4: ADDC_R	addc 	%r2, %r15, %r26
thr3_resum_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_263), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r29
	.word 0xba88c00f  ! 4: ANDcc_R	andcc 	%r3, %r15, %r29
	.word 0xb4912ba3  ! 4: ORcc_I	orcc 	%r4, 0x0ba3, %r26
thr3_hw_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_264), 16, 16)) -> intp(0, 0, 1)
	.word 0xaab1400f  ! 4: ORNcc_R	orncc 	%r5, %r15, %r21
	.word 0xaa88c00a  ! 4: ANDcc_R	andcc 	%r3, %r10, %r21
	.word 0xae11a880  ! 4: OR_I	or 	%r6, 0x0880, %r23
	.word 0xb729900f  ! 4: SLLX_R	sllx	%r6, %r15, %r27
	.word 0xae296710  ! 4: ANDN_I	andn 	%r5, 0x0710, %r23
	.word 0xb019c00e  ! 4: XOR_R	xor 	%r7, %r14, %r24
thr3_hw_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_265), 16, 16)) -> intp(1, 0, 1)
	.word 0xb139400b  ! 4: SRA_R	sra 	%r5, %r11, %r24
	.word 0xb364180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa98e91f  ! 4: XORcc_I	xorcc 	%r3, 0x091f, %r21
	.word 0xb729100f  ! 4: SLLX_R	sllx	%r4, %r15, %r27
	.word 0xab29400b  ! 4: SLL_R	sll 	%r5, %r11, %r21
	.word 0xaa40a8ad  ! 4: ADDC_I	addc 	%r2, 0x08ad, %r21
	.word 0xb9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r28
thr3_nuke_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_266), 16, 16)) -> intp(1, 2, 1)
	.word 0xb809660f  ! 4: AND_I	and 	%r5, 0x060f, %r28
	.word 0xb840ae68  ! 4: ADDC_I	addc 	%r2, 0x0e68, %r28
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb628ecab  ! 4: ANDN_I	andn 	%r3, 0x0cab, %r27
thr3_resum_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_266), 16, 16)) -> intp(1, 3, 1)
	.word 0xb33a000e  ! 4: SRA_R	sra 	%r8, %r14, %r25
	.word 0xb978c40d  ! 4: MOVR_R	move	%r3, %r13, %r28
	.word 0xbc41c00f  ! 4: ADDC_R	addc 	%r7, %r15, %r30
thr3_nuke_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_267), 16, 16)) -> intp(1, 2, 1)
	.word 0xb979e401  ! 4: MOVR_I	move	%r7, 0xf, %r28
thr3_resum_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_267), 16, 16)) -> intp(1, 3, 1)
	.word 0xba31e126  ! 4: ORN_I	orn 	%r7, 0x0126, %r29
thr3_hw_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_268), 16, 16)) -> intp(1, 0, 1)
	.word 0xa810c00b  ! 4: OR_R	or 	%r3, %r11, %r20
	.word 0xb8b9800b  ! 4: XNORcc_R	xnorcc 	%r6, %r11, %r28
	.word 0xb8a8800e  ! 4: ANDNcc_R	andncc 	%r2, %r14, %r28
	.word 0xb411e353  ! 4: OR_I	or 	%r7, 0x0353, %r26
	.word 0xb939800a  ! 4: SRA_R	sra 	%r6, %r10, %r28
	.word 0xb00960d8  ! 4: AND_I	and 	%r5, 0x00d8, %r24
thr3_hw_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_269), 16, 16)) -> intp(1, 0, 1)
	.word 0xad316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r22
	.word 0xb0b2000d  ! 4: ORNcc_R	orncc 	%r8, %r13, %r24
	.word 0xa899000d  ! 4: XORcc_R	xorcc 	%r4, %r13, %r20
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbc29a89d  ! 4: ANDN_I	andn 	%r6, 0x089d, %r30
	.word 0xb764180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb139e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r24
thr3_nuke_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_270), 16, 16)) -> intp(1, 2, 1)
	.word 0xba09c00b  ! 4: AND_R	and 	%r7, %r11, %r29
	.word 0xab312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r21
	.word 0xa8312ffe  ! 4: ORN_I	orn 	%r4, 0x0ffe, %r20
	.word 0xb0b124fa  ! 4: ORNcc_I	orncc 	%r4, 0x04fa, %r24
	.word 0xb530d00f  ! 4: SRLX_R	srlx	%r3, %r15, %r26
	.word 0xb7292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r27
thr3_resum_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_270), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc99c00a  ! 4: XORcc_R	xorcc 	%r7, %r10, %r30
	.word 0xba30c00d  ! 4: ORN_R	orn 	%r3, %r13, %r29
	.word 0xac41c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r22
	.word 0xa97a2401  ! 4: MOVR_I	move	%r8, 0xc, %r20
thr3_hw_intr_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_271), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbab9a13c  ! 4: XNORcc_I	xnorcc 	%r6, 0x013c, %r29
	.word 0xb639800b  ! 4: XNOR_R	xnor 	%r6, %r11, %r27
	.word 0xb379040a  ! 4: MOVR_R	move	%r4, %r10, %r25
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
	.word 0xac422e5f  ! 4: ADDC_I	addc 	%r8, 0x0e5f, %r22
	.word 0xad322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r22
thr3_nuke_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_272), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2c1000c  ! 4: ADDCcc_R	addccc 	%r4, %r12, %r25
	.word 0xaa92000c  ! 4: ORcc_R	orcc 	%r8, %r12, %r21
	.word 0xb441400c  ! 4: ADDC_R	addc 	%r5, %r12, %r26
	.word 0xb889a36e  ! 4: ANDcc_I	andcc 	%r6, 0x036e, %r28
	.word 0xb739e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r27
	.word 0xb4a9e4ff  ! 4: ANDNcc_I	andncc 	%r7, 0x04ff, %r26
	.word 0xac0a2e46  ! 4: AND_I	and 	%r8, 0x0e46, %r22
thr3_resum_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_272), 16, 16)) -> intp(0, 3, 1)
	.word 0xac00e531  ! 4: ADD_I	add 	%r3, 0x0531, %r22
thr3_hw_intr_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_273), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa9161dd  ! 4: ORcc_I	orcc 	%r5, 0x01dd, %r21
	.word 0xbc09400f  ! 4: AND_R	and 	%r5, %r15, %r30
	.word 0xbb7a2401  ! 4: MOVR_I	move	%r8, 0xf, %r29
	.word 0xb331400e  ! 4: SRL_R	srl 	%r5, %r14, %r25
	.word 0xba19c00e  ! 4: XOR_R	xor 	%r7, %r14, %r29
	.word 0xb0322ec1  ! 4: ORN_I	orn 	%r8, 0x0ec1, %r24
	.word 0xa929800f  ! 4: SLL_R	sll 	%r6, %r15, %r20
thr3_hw_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_274), 16, 16)) -> intp(0, 0, 1)
	.word 0xb281e409  ! 4: ADDcc_I	addcc 	%r7, 0x0409, %r25
	.word 0xb339100a  ! 4: SRAX_R	srax	%r4, %r10, %r25
	.word 0xb178a401  ! 4: MOVR_I	move	%r2, 0xa, %r24
	.word 0xb00a000c  ! 4: AND_R	and 	%r8, %r12, %r24
	.word 0xacb8800e  ! 4: XNORcc_R	xnorcc 	%r2, %r14, %r22
	.word 0xab2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r21
thr3_hw_intr_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_275), 16, 16)) -> intp(1, 0, 1)
	.word 0xbcb9c00a  ! 4: XNORcc_R	xnorcc 	%r7, %r10, %r30
	.word 0xbd792401  ! 4: MOVR_I	move	%r4, 0xa, %r30
	.word 0xbc90c00c  ! 4: ORcc_R	orcc 	%r3, %r12, %r30
	.word 0xaa01000a  ! 4: ADD_R	add 	%r4, %r10, %r21
	.word 0xb441eaa0  ! 4: ADDC_I	addc 	%r7, 0x0aa0, %r26
	.word 0xb331a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r25
thr3_hw_intr_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_276), 16, 16)) -> intp(0, 0, 1)
	.word 0xb61a212e  ! 4: XOR_I	xor 	%r8, 0x012e, %r27
	.word 0xb040800a  ! 4: ADDC_R	addc 	%r2, %r10, %r24
	.word 0xaa11400d  ! 4: OR_R	or 	%r5, %r13, %r21
	.word 0xb6292789  ! 4: ANDN_I	andn 	%r4, 0x0789, %r27
	.word 0xa80167fc  ! 4: ADD_I	add 	%r5, 0x07fc, %r20
	.word 0xb4b1c00c  ! 4: ORNcc_R	orncc 	%r7, %r12, %r26
thr3_hw_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_277), 16, 16)) -> intp(0, 0, 1)
	.word 0xa841e765  ! 4: ADDC_I	addc 	%r7, 0x0765, %r20
	.word 0xb328900a  ! 4: SLLX_R	sllx	%r2, %r10, %r25
	.word 0xb229e697  ! 4: ANDN_I	andn 	%r7, 0x0697, %r25
	.word 0xbc31a872  ! 4: ORN_I	orn 	%r6, 0x0872, %r30
	.word 0xb731b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r27
	.word 0xba11233e  ! 4: OR_I	or 	%r4, 0x033e, %r29
	.word 0xaaa9648c  ! 4: ANDNcc_I	andncc 	%r5, 0x048c, %r21
thr3_nuke_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_278), 16, 16)) -> intp(1, 2, 1)
	.word 0xb0b1800a  ! 4: ORNcc_R	orncc 	%r6, %r10, %r24
thr3_resum_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_278), 16, 16)) -> intp(1, 3, 1)
	.word 0xb691800e  ! 4: ORcc_R	orcc 	%r6, %r14, %r27
	.word 0xa930900b  ! 4: SRLX_R	srlx	%r2, %r11, %r20
thr3_nuke_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_279), 16, 16)) -> intp(0, 2, 1)
	.word 0xb600e659  ! 4: ADD_I	add 	%r3, 0x0659, %r27
	.word 0xb330d00a  ! 4: SRLX_R	srlx	%r3, %r10, %r25
	.word 0xb131c00f  ! 4: SRL_R	srl 	%r7, %r15, %r24
	.word 0xa808e327  ! 4: AND_I	and 	%r3, 0x0327, %r20
	.word 0xb239e460  ! 4: XNOR_I	xnor 	%r7, 0x0460, %r25
	.word 0xb489400d  ! 4: ANDcc_R	andcc 	%r5, %r13, %r26
thr3_resum_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_279), 16, 16)) -> intp(0, 3, 1)
	.word 0xb73a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r27
	.word 0xb92a000f  ! 4: SLL_R	sll 	%r8, %r15, %r28
	.word 0xa829c00f  ! 4: ANDN_R	andn 	%r7, %r15, %r20
	.word 0xaa90e950  ! 4: ORcc_I	orcc 	%r3, 0x0950, %r21
thr3_hw_intr_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_280), 16, 16)) -> intp(1, 0, 1)
	.word 0xad79440b  ! 4: MOVR_R	move	%r5, %r11, %r22
	.word 0xb011400d  ! 4: OR_R	or 	%r5, %r13, %r24
	.word 0xb2a96115  ! 4: ANDNcc_I	andncc 	%r5, 0x0115, %r25
	.word 0xb882000f  ! 4: ADDcc_R	addcc 	%r8, %r15, %r28
	.word 0xbc0a000b  ! 4: AND_R	and 	%r8, %r11, %r30
	.word 0xa8092d7f  ! 4: AND_I	and 	%r4, 0x0d7f, %r20
thr3_hw_intr_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_281), 16, 16)) -> intp(0, 0, 1)
	.word 0xb882000d  ! 4: ADDcc_R	addcc 	%r8, %r13, %r28
	.word 0xb880c00d  ! 4: ADDcc_R	addcc 	%r3, %r13, %r28
	.word 0xaca9000d  ! 4: ANDNcc_R	andncc 	%r4, %r13, %r22
	.word 0xaa3a2dfb  ! 4: XNOR_I	xnor 	%r8, 0x0dfb, %r21
	.word 0xa8416de2  ! 4: ADDC_I	addc 	%r5, 0x0de2, %r20
	.word 0xae09800c  ! 4: AND_R	and 	%r6, %r12, %r23
	.word 0xb964180c  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_282), 16, 16)) -> intp(0, 0, 1)
	.word 0xb029c00f  ! 4: ANDN_R	andn 	%r7, %r15, %r24
	.word 0xb364180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae41800f  ! 4: ADDC_R	addc 	%r6, %r15, %r23
	.word 0xaa09a408  ! 4: AND_I	and 	%r6, 0x0408, %r21
	.word 0xab30a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r21
	.word 0xae88edd5  ! 4: ANDcc_I	andcc 	%r3, 0x0dd5, %r23
	.word 0xb578840d  ! 4: MOVR_R	move	%r2, %r13, %r26
thr3_hw_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_283), 16, 16)) -> intp(1, 0, 1)
	.word 0xab64180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa90800b  ! 4: ORcc_R	orcc 	%r2, %r11, %r21
	.word 0xb731900f  ! 4: SRLX_R	srlx	%r6, %r15, %r27
	.word 0xa8816c71  ! 4: ADDcc_I	addcc 	%r5, 0x0c71, %r20
	.word 0xb138900d  ! 4: SRAX_R	srax	%r2, %r13, %r24
	.word 0xaa38a7ac  ! 4: XNOR_I	xnor 	%r2, 0x07ac, %r21
	.word 0xb4ba000f  ! 4: XNORcc_R	xnorcc 	%r8, %r15, %r26
thr3_nuke_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_284), 16, 16)) -> intp(1, 2, 1)
	.word 0xbac0ea4a  ! 4: ADDCcc_I	addccc 	%r3, 0x0a4a, %r29
	.word 0xb641a958  ! 4: ADDC_I	addc 	%r6, 0x0958, %r27
	.word 0xbaaa000f  ! 4: ANDNcc_R	andncc 	%r8, %r15, %r29
	.word 0xa939a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r20
thr3_resum_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_284), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc89000c  ! 4: ANDcc_R	andcc 	%r4, %r12, %r30
	.word 0xa8a8800b  ! 4: ANDNcc_R	andncc 	%r2, %r11, %r20
	.word 0xb441c00e  ! 4: ADDC_R	addc 	%r7, %r14, %r26
thr3_hw_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_285), 16, 16)) -> intp(0, 0, 1)
	.word 0xae816931  ! 4: ADDcc_I	addcc 	%r5, 0x0931, %r23
	.word 0xbd39800e  ! 4: SRA_R	sra 	%r6, %r14, %r30
	.word 0xb681c00e  ! 4: ADDcc_R	addcc 	%r7, %r14, %r27
	.word 0xa8b9274f  ! 4: XNORcc_I	xnorcc 	%r4, 0x074f, %r20
	.word 0xb429241b  ! 4: ANDN_I	andn 	%r4, 0x041b, %r26
	.word 0xb028ed66  ! 4: ANDN_I	andn 	%r3, 0x0d66, %r24
	.word 0xb330800c  ! 4: SRL_R	srl 	%r2, %r12, %r25
thr3_hw_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_286), 16, 16)) -> intp(1, 0, 1)
	.word 0xab2a000d  ! 4: SLL_R	sll 	%r8, %r13, %r21
	.word 0xb731f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r27
	.word 0xbaaa000e  ! 4: ANDNcc_R	andncc 	%r8, %r14, %r29
	.word 0xa819af9d  ! 4: XOR_I	xor 	%r6, 0x0f9d, %r20
	.word 0xb0ba29dc  ! 4: XNORcc_I	xnorcc 	%r8, 0x09dc, %r24
	.word 0xb611800f  ! 4: OR_R	or 	%r6, %r15, %r27
thr3_hw_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_287), 16, 16)) -> intp(0, 0, 1)
	.word 0xae31ea9f  ! 4: ORN_I	orn 	%r7, 0x0a9f, %r23
	.word 0xab38d00d  ! 4: SRAX_R	srax	%r3, %r13, %r21
	.word 0xb039000b  ! 4: XNOR_R	xnor 	%r4, %r11, %r24
	.word 0xb379840f  ! 4: MOVR_R	move	%r6, %r15, %r25
	.word 0xb409400c  ! 4: AND_R	and 	%r5, %r12, %r26
	.word 0xb410800d  ! 4: OR_R	or 	%r2, %r13, %r26
thr3_hw_intr_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_288), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8b1000c  ! 4: ORNcc_R	orncc 	%r4, %r12, %r20
	.word 0xbc41686b  ! 4: ADDC_I	addc 	%r5, 0x086b, %r30
	.word 0xbc41c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r30
	.word 0xbb3a000e  ! 4: SRA_R	sra 	%r8, %r14, %r29
	.word 0xa829800c  ! 4: ANDN_R	andn 	%r6, %r12, %r20
	.word 0xa9293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r20
	.word 0xb041400b  ! 4: ADDC_R	addc 	%r5, %r11, %r24
thr3_hw_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_289), 16, 16)) -> intp(0, 0, 1)
	.word 0xa889a253  ! 4: ANDcc_I	andcc 	%r6, 0x0253, %r20
	.word 0xbc3a2bf4  ! 4: XNOR_I	xnor 	%r8, 0x0bf4, %r30
	.word 0xb691000d  ! 4: ORcc_R	orcc 	%r4, %r13, %r27
	.word 0xb3396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r25
	.word 0xb03a000b  ! 4: XNOR_R	xnor 	%r8, %r11, %r24
	.word 0xbb31100f  ! 4: SRLX_R	srlx	%r4, %r15, %r29
thr3_hw_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_290), 16, 16)) -> intp(0, 0, 1)
	.word 0xb480eeb7  ! 4: ADDcc_I	addcc 	%r3, 0x0eb7, %r26
	.word 0xaa09a52e  ! 4: AND_I	and 	%r6, 0x052e, %r21
	.word 0xb8012809  ! 4: ADD_I	add 	%r4, 0x0809, %r28
	.word 0xbc91647c  ! 4: ORcc_I	orcc 	%r5, 0x047c, %r30
	.word 0xa888800f  ! 4: ANDcc_R	andcc 	%r2, %r15, %r20
	.word 0xb6412ecf  ! 4: ADDC_I	addc 	%r4, 0x0ecf, %r27
thr3_hw_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_291), 16, 16)) -> intp(1, 0, 1)
	.word 0xba18c00e  ! 4: XOR_R	xor 	%r3, %r14, %r29
	.word 0xb499000f  ! 4: XORcc_R	xorcc 	%r4, %r15, %r26
	.word 0xb164180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaec0800c  ! 4: ADDCcc_R	addccc 	%r2, %r12, %r23
	.word 0xaf79440a  ! 4: MOVR_R	move	%r5, %r10, %r23
	.word 0xad64180c  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_292), 16, 16)) -> intp(1, 2, 1)
	.word 0xac91c00a  ! 4: ORcc_R	orcc 	%r7, %r10, %r22
	.word 0xb8016a74  ! 4: ADD_I	add 	%r5, 0x0a74, %r28
	.word 0xab29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r21
	.word 0xb618aaea  ! 4: XOR_I	xor 	%r2, 0x0aea, %r27
thr3_resum_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_292), 16, 16)) -> intp(1, 3, 1)
	.word 0xb931900b  ! 4: SRLX_R	srlx	%r6, %r11, %r28
	.word 0xb0b16af4  ! 4: ORNcc_I	orncc 	%r5, 0x0af4, %r24
	.word 0xaa91c00e  ! 4: ORcc_R	orcc 	%r7, %r14, %r21
	.word 0xab29500a  ! 4: SLLX_R	sllx	%r5, %r10, %r21
thr3_hw_intr_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_293), 16, 16)) -> intp(0, 0, 1)
	.word 0xac01000b  ! 4: ADD_R	add 	%r4, %r11, %r22
	.word 0xacc16493  ! 4: ADDCcc_I	addccc 	%r5, 0x0493, %r22
	.word 0xbd79a401  ! 4: MOVR_I	move	%r6, 0x493, %r30
	.word 0xaa0a000a  ! 4: AND_R	and 	%r8, %r10, %r21
	.word 0xac01e080  ! 4: ADD_I	add 	%r7, 0x0080, %r22
	.word 0xb68929e0  ! 4: ANDcc_I	andcc 	%r4, 0x09e0, %r27
thr3_nuke_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_294), 16, 16)) -> intp(0, 2, 1)
	.word 0xb441c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r26
	.word 0xb4a964ca  ! 4: ANDNcc_I	andncc 	%r5, 0x04ca, %r26
	.word 0xba89c00d  ! 4: ANDcc_R	andcc 	%r7, %r13, %r29
	.word 0xad64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbaa8e35c  ! 4: ANDNcc_I	andncc 	%r3, 0x035c, %r29
	.word 0xbc11c00b  ! 4: OR_R	or 	%r7, %r11, %r30
thr3_resum_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_294), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8aa000f  ! 4: ANDNcc_R	andncc 	%r8, %r15, %r28
thr3_nuke_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_295), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa11abf1  ! 4: OR_I	or 	%r6, 0x0bf1, %r21
	.word 0xa9392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r20
thr3_resum_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_295), 16, 16)) -> intp(1, 3, 1)
	.word 0xb939c00c  ! 4: SRA_R	sra 	%r7, %r12, %r28
thr3_nuke_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_296), 16, 16)) -> intp(1, 2, 1)
	.word 0xa890c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r20
	.word 0xb411800b  ! 4: OR_R	or 	%r6, %r11, %r26
	.word 0xb29925b0  ! 4: XORcc_I	xorcc 	%r4, 0x05b0, %r25
	.word 0xb938a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r28
	.word 0xb331f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r25
	.word 0xa829800b  ! 4: ANDN_R	andn 	%r6, %r11, %r20
	.word 0xbd7a040c  ! 4: MOVR_R	move	%r8, %r12, %r30
thr3_resum_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_296), 16, 16)) -> intp(1, 3, 1)
	.word 0xb364180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb828800d  ! 4: ANDN_R	andn 	%r2, %r13, %r28
	.word 0xb809400e  ! 4: AND_R	and 	%r5, %r14, %r28
thr3_hw_intr_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_297), 16, 16)) -> intp(0, 0, 1)
	.word 0xac31800b  ! 4: ORN_R	orn 	%r6, %r11, %r22
	.word 0xb4896c75  ! 4: ANDcc_I	andcc 	%r5, 0x0c75, %r26
	.word 0xa839ac8e  ! 4: XNOR_I	xnor 	%r6, 0x0c8e, %r20
	.word 0xb0a9800c  ! 4: ANDNcc_R	andncc 	%r6, %r12, %r24
	.word 0xb801400c  ! 4: ADD_R	add 	%r5, %r12, %r28
	.word 0xaa29c00d  ! 4: ANDN_R	andn 	%r7, %r13, %r21
thr3_hw_intr_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_298), 16, 16)) -> intp(0, 0, 1)
	.word 0xad293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r22
	.word 0xb4aa000b  ! 4: ANDNcc_R	andncc 	%r8, %r11, %r26
	.word 0xb608a66d  ! 4: AND_I	and 	%r2, 0x066d, %r27
	.word 0xb638c00a  ! 4: XNOR_R	xnor 	%r3, %r10, %r27
	.word 0xaf29a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r23
	.word 0xa841af8e  ! 4: ADDC_I	addc 	%r6, 0x0f8e, %r20
	.word 0xbaa8e7a2  ! 4: ANDNcc_I	andncc 	%r3, 0x07a2, %r29
thr3_nuke_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_299), 16, 16)) -> intp(0, 2, 1)
	.word 0xb630c00d  ! 4: ORN_R	orn 	%r3, %r13, %r27
	.word 0xae31400b  ! 4: ORN_R	orn 	%r5, %r11, %r23
	.word 0xad2a100c  ! 4: SLLX_R	sllx	%r8, %r12, %r22
thr3_resum_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_299), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8b8e42e  ! 4: XNORcc_I	xnorcc 	%r3, 0x042e, %r28
	.word 0xb730d00f  ! 4: SRLX_R	srlx	%r3, %r15, %r27
thr3_hw_intr_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_300), 16, 16)) -> intp(1, 0, 1)
	.word 0xa831400e  ! 4: ORN_R	orn 	%r5, %r14, %r20
	.word 0xb001000e  ! 4: ADD_R	add 	%r4, %r14, %r24
	.word 0xb2092c93  ! 4: AND_I	and 	%r4, 0x0c93, %r25
	.word 0xb628e827  ! 4: ANDN_I	andn 	%r3, 0x0827, %r27
	.word 0xb2c1000d  ! 4: ADDCcc_R	addccc 	%r4, %r13, %r25
	.word 0xb631800f  ! 4: ORN_R	orn 	%r6, %r15, %r27
	.word 0xa8b8eec3  ! 4: XNORcc_I	xnorcc 	%r3, 0x0ec3, %r20
thr3_hw_intr_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_301), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb31400d  ! 4: SRL_R	srl 	%r5, %r13, %r29
	.word 0xaa112569  ! 4: OR_I	or 	%r4, 0x0569, %r21
	.word 0xb364180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaf31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r23
	.word 0xb011e95d  ! 4: OR_I	or 	%r7, 0x095d, %r24
	.word 0xa832000d  ! 4: ORN_R	orn 	%r8, %r13, %r20
	.word 0xb528b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r26
thr3_nuke_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_302), 16, 16)) -> intp(1, 2, 1)
	.word 0xad29900a  ! 4: SLLX_R	sllx	%r6, %r10, %r22
	.word 0xb21a000e  ! 4: XOR_R	xor 	%r8, %r14, %r25
thr3_resum_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_302), 16, 16)) -> intp(1, 3, 1)
	.word 0xaca8ef90  ! 4: ANDNcc_I	andncc 	%r3, 0x0f90, %r22
	.word 0xac412cd9  ! 4: ADDC_I	addc 	%r4, 0x0cd9, %r22
	.word 0xac2966e6  ! 4: ANDN_I	andn 	%r5, 0x06e6, %r22
thr3_hw_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_303), 16, 16)) -> intp(0, 0, 1)
	.word 0xb290c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r25
	.word 0xbab9000d  ! 4: XNORcc_R	xnorcc 	%r4, %r13, %r29
	.word 0xaaba2d31  ! 4: XNORcc_I	xnorcc 	%r8, 0x0d31, %r21
	.word 0xbd38c00a  ! 4: SRA_R	sra 	%r3, %r10, %r30
	.word 0xb338d00d  ! 4: SRAX_R	srax	%r3, %r13, %r25
	.word 0xbb322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r29
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_304), 16, 16)) -> intp(0, 2, 1)
	.word 0xb490800d  ! 4: ORcc_R	orcc 	%r2, %r13, %r26
thr3_resum_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_304), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r29
	.word 0xaca9a2a0  ! 4: ANDNcc_I	andncc 	%r6, 0x02a0, %r22
thr3_nuke_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_305), 16, 16)) -> intp(1, 2, 1)
	.word 0xba8929f7  ! 4: ANDcc_I	andcc 	%r4, 0x09f7, %r29
	.word 0xab31900a  ! 4: SRLX_R	srlx	%r6, %r10, %r21
	.word 0xb018c00f  ! 4: XOR_R	xor 	%r3, %r15, %r24
	.word 0xb0896816  ! 4: ANDcc_I	andcc 	%r5, 0x0816, %r24
	.word 0xa930e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r20
thr3_resum_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_305), 16, 16)) -> intp(1, 3, 1)
	.word 0xad28900a  ! 4: SLLX_R	sllx	%r2, %r10, %r22
	.word 0xb164180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbb28d00f  ! 4: SLLX_R	sllx	%r3, %r15, %r29
thr3_hw_intr_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_306), 16, 16)) -> intp(1, 0, 1)
	.word 0xad2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r22
	.word 0xb880ef53  ! 4: ADDcc_I	addcc 	%r3, 0x0f53, %r28
	.word 0xb132100c  ! 4: SRLX_R	srlx	%r8, %r12, %r24
	.word 0xb8a9678c  ! 4: ANDNcc_I	andncc 	%r5, 0x078c, %r28
	.word 0xb891400e  ! 4: ORcc_R	orcc 	%r5, %r14, %r28
	.word 0xb010e932  ! 4: OR_I	or 	%r3, 0x0932, %r24
thr3_nuke_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_307), 16, 16)) -> intp(1, 2, 1)
	.word 0xaab96e9e  ! 4: XNORcc_I	xnorcc 	%r5, 0x0e9e, %r21
	.word 0xa8a8800c  ! 4: ANDNcc_R	andncc 	%r2, %r12, %r20
thr3_resum_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_307), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r29
	.word 0xac81c00d  ! 4: ADDcc_R	addcc 	%r7, %r13, %r22
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb164180b  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_308), 16, 16)) -> intp(0, 2, 1)
	.word 0xb738900c  ! 4: SRAX_R	srax	%r2, %r12, %r27
thr3_resum_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_308), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb79840f  ! 4: MOVR_R	move	%r6, %r15, %r29
	.word 0xbb31000b  ! 4: SRL_R	srl 	%r4, %r11, %r29
	.word 0xb929500d  ! 4: SLLX_R	sllx	%r5, %r13, %r28
	.word 0xae31400a  ! 4: ORN_R	orn 	%r5, %r10, %r23
thr3_hw_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_309), 16, 16)) -> intp(0, 0, 1)
	.word 0xaac165b1  ! 4: ADDCcc_I	addccc 	%r5, 0x05b1, %r21
	.word 0xb0c0e4c0  ! 4: ADDCcc_I	addccc 	%r3, 0x04c0, %r24
	.word 0xba38e4b0  ! 4: XNOR_I	xnor 	%r3, 0x04b0, %r29
	.word 0xab31c00e  ! 4: SRL_R	srl 	%r7, %r14, %r21
	.word 0xb281a6ee  ! 4: ADDcc_I	addcc 	%r6, 0x06ee, %r25
	.word 0xb53a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r26
	.word 0xab29400c  ! 4: SLL_R	sll 	%r5, %r12, %r21
thr3_nuke_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_310), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4c16b44  ! 4: ADDCcc_I	addccc 	%r5, 0x0b44, %r26
	.word 0xa8a96100  ! 4: ANDNcc_I	andncc 	%r5, 0x0100, %r20
	.word 0xaa28a214  ! 4: ANDN_I	andn 	%r2, 0x0214, %r21
	.word 0xb6012cd2  ! 4: ADD_I	add 	%r4, 0x0cd2, %r27
	.word 0xbd31c00b  ! 4: SRL_R	srl 	%r7, %r11, %r30
	.word 0xaa10ee73  ! 4: OR_I	or 	%r3, 0x0e73, %r21
	.word 0xae11c00d  ! 4: OR_R	or 	%r7, %r13, %r23
thr3_resum_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_310), 16, 16)) -> intp(0, 3, 1)
	.word 0xac38c00e  ! 4: XNOR_R	xnor 	%r3, %r14, %r22
thr3_hw_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_311), 16, 16)) -> intp(0, 0, 1)
	.word 0xb281000b  ! 4: ADDcc_R	addcc 	%r4, %r11, %r25
	.word 0xb2b8c00c  ! 4: XNORcc_R	xnorcc 	%r3, %r12, %r25
	.word 0xb441e997  ! 4: ADDC_I	addc 	%r7, 0x0997, %r26
	.word 0xb439400c  ! 4: XNOR_R	xnor 	%r5, %r12, %r26
	.word 0xb2b0a4a4  ! 4: ORNcc_I	orncc 	%r2, 0x04a4, %r25
	.word 0xb638800d  ! 4: XNOR_R	xnor 	%r2, %r13, %r27
thr3_nuke_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_312), 16, 16)) -> intp(0, 2, 1)
	.word 0xab31c00e  ! 4: SRL_R	srl 	%r7, %r14, %r21
	.word 0xb6c0a4ae  ! 4: ADDCcc_I	addccc 	%r2, 0x04ae, %r27
thr3_resum_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_312), 16, 16)) -> intp(0, 3, 1)
	.word 0xb280c00b  ! 4: ADDcc_R	addcc 	%r3, %r11, %r25
thr3_hw_intr_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_313), 16, 16)) -> intp(1, 0, 1)
	.word 0xb931f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r28
	.word 0xbcb9000b  ! 4: XNORcc_R	xnorcc 	%r4, %r11, %r30
	.word 0xae41800b  ! 4: ADDC_R	addc 	%r6, %r11, %r23
	.word 0xb041212e  ! 4: ADDC_I	addc 	%r4, 0x012e, %r24
	.word 0xbc19ec45  ! 4: XOR_I	xor 	%r7, 0x0c45, %r30
	.word 0xb0c1400d  ! 4: ADDCcc_R	addccc 	%r5, %r13, %r24
	.word 0xbab22cd1  ! 4: ORNcc_I	orncc 	%r8, 0x0cd1, %r29
thr3_hw_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_314), 16, 16)) -> intp(0, 0, 1)
	.word 0xa889ae3c  ! 4: ANDcc_I	andcc 	%r6, 0x0e3c, %r20
	.word 0xbd3a000c  ! 4: SRA_R	sra 	%r8, %r12, %r30
	.word 0xb179c40d  ! 4: MOVR_R	move	%r7, %r13, %r24
	.word 0xae80a723  ! 4: ADDcc_I	addcc 	%r2, 0x0723, %r23
	.word 0xba02000b  ! 4: ADD_R	add 	%r8, %r11, %r29
	.word 0xba01000a  ! 4: ADD_R	add 	%r4, %r10, %r29
	.word 0xaf39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r23
thr3_hw_intr_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_315), 16, 16)) -> intp(0, 0, 1)
	.word 0xb488a968  ! 4: ANDcc_I	andcc 	%r2, 0x0968, %r26
	.word 0xab38d00f  ! 4: SRAX_R	srax	%r3, %r15, %r21
	.word 0xbb78840e  ! 4: MOVR_R	move	%r2, %r14, %r29
	.word 0xb179e401  ! 4: MOVR_I	move	%r7, 0xf, %r24
	.word 0xb0a9af64  ! 4: ANDNcc_I	andncc 	%r6, 0x0f64, %r24
	.word 0xbc89800e  ! 4: ANDcc_R	andcc 	%r6, %r14, %r30
thr3_hw_intr_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_316), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8a8ae37  ! 4: ANDNcc_I	andncc 	%r2, 0x0e37, %r20
	.word 0xa881000c  ! 4: ADDcc_R	addcc 	%r4, %r12, %r20
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb330800a  ! 4: SRL_R	srl 	%r2, %r10, %r25
	.word 0xac3965a4  ! 4: XNOR_I	xnor 	%r5, 0x05a4, %r22
	.word 0xb931100f  ! 4: SRLX_R	srlx	%r4, %r15, %r28
thr3_hw_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_317), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa91000f  ! 4: ORcc_R	orcc 	%r4, %r15, %r21
	.word 0xad30900c  ! 4: SRLX_R	srlx	%r2, %r12, %r22
	.word 0xb299acba  ! 4: XORcc_I	xorcc 	%r6, 0x0cba, %r25
	.word 0xb8a96b7b  ! 4: ANDNcc_I	andncc 	%r5, 0x0b7b, %r28
	.word 0xa889e7a8  ! 4: ANDcc_I	andcc 	%r7, 0x07a8, %r20
	.word 0xb4096c69  ! 4: AND_I	and 	%r5, 0x0c69, %r26
thr3_hw_intr_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_318), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0896241  ! 4: ANDcc_I	andcc 	%r5, 0x0241, %r24
	.word 0xaf31900e  ! 4: SRLX_R	srlx	%r6, %r14, %r23
	.word 0xb4ba000d  ! 4: XNORcc_R	xnorcc 	%r8, %r13, %r26
	.word 0xb2a9000c  ! 4: ANDNcc_R	andncc 	%r4, %r12, %r25
	.word 0xb178e401  ! 4: MOVR_I	move	%r3, 0xc, %r24
	.word 0xbc11a76d  ! 4: OR_I	or 	%r6, 0x076d, %r30
thr3_hw_intr_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_319), 16, 16)) -> intp(0, 0, 1)
	.word 0xba81e9ef  ! 4: ADDcc_I	addcc 	%r7, 0x09ef, %r29
	.word 0xb800aab5  ! 4: ADD_I	add 	%r2, 0x0ab5, %r28
	.word 0xbb2a100f  ! 4: SLLX_R	sllx	%r8, %r15, %r29
	.word 0xb6822ca7  ! 4: ADDcc_I	addcc 	%r8, 0x0ca7, %r27
	.word 0xbc18e838  ! 4: XOR_I	xor 	%r3, 0x0838, %r30
	.word 0xb091c00b  ! 4: ORcc_R	orcc 	%r7, %r11, %r24
thr3_hw_intr_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_320), 16, 16)) -> intp(1, 0, 1)
	.word 0xad39100d  ! 4: SRAX_R	srax	%r4, %r13, %r22
	.word 0xb041e325  ! 4: ADDC_I	addc 	%r7, 0x0325, %r24
	.word 0xba89af21  ! 4: ANDcc_I	andcc 	%r6, 0x0f21, %r29
	.word 0xb0a8800d  ! 4: ANDNcc_R	andncc 	%r2, %r13, %r24
	.word 0xb640aab2  ! 4: ADDC_I	addc 	%r2, 0x0ab2, %r27
	.word 0xb228800d  ! 4: ANDN_R	andn 	%r2, %r13, %r25
	.word 0xbb78840d  ! 4: MOVR_R	move	%r2, %r13, %r29
thr3_nuke_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_321), 16, 16)) -> intp(0, 2, 1)
	.word 0xae41ef82  ! 4: ADDC_I	addc 	%r7, 0x0f82, %r23
	.word 0xbb30800e  ! 4: SRL_R	srl 	%r2, %r14, %r29
	.word 0xbb39400b  ! 4: SRA_R	sra 	%r5, %r11, %r29
	.word 0xb139800f  ! 4: SRA_R	sra 	%r6, %r15, %r24
thr3_resum_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_321), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa91628d  ! 4: ORcc_I	orcc 	%r5, 0x028d, %r21
thr3_nuke_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_322), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb39500b  ! 4: SRAX_R	srax	%r5, %r11, %r29
	.word 0xba08e950  ! 4: AND_I	and 	%r3, 0x0950, %r29
	.word 0xba80e56e  ! 4: ADDcc_I	addcc 	%r3, 0x056e, %r29
	.word 0xac996488  ! 4: XORcc_I	xorcc 	%r5, 0x0488, %r22
thr3_resum_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_322), 16, 16)) -> intp(0, 3, 1)
	.word 0xb129100f  ! 4: SLLX_R	sllx	%r4, %r15, %r24
thr3_hw_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_323), 16, 16)) -> intp(1, 0, 1)
	.word 0xb938a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r28
	.word 0xac10c00e  ! 4: OR_R	or 	%r3, %r14, %r22
	.word 0xaa38a6ae  ! 4: XNOR_I	xnor 	%r2, 0x06ae, %r21
	.word 0xb330a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r25
	.word 0xaf39400f  ! 4: SRA_R	sra 	%r5, %r15, %r23
	.word 0xa881a500  ! 4: ADDcc_I	addcc 	%r6, 0x0500, %r20
thr3_hw_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_324), 16, 16)) -> intp(1, 0, 1)
	.word 0xb931b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r28
	.word 0xa93a000c  ! 4: SRA_R	sra 	%r8, %r12, %r20
	.word 0xae00c00e  ! 4: ADD_R	add 	%r3, %r14, %r23
	.word 0xb52a000e  ! 4: SLL_R	sll 	%r8, %r14, %r26
	.word 0xb330e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r25
	.word 0xb538c00e  ! 4: SRA_R	sra 	%r3, %r14, %r26
thr3_nuke_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_325), 16, 16)) -> intp(0, 2, 1)
	.word 0xb131500d  ! 4: SRLX_R	srlx	%r5, %r13, %r24
	.word 0xbb38800a  ! 4: SRA_R	sra 	%r2, %r10, %r29
	.word 0xaec22af1  ! 4: ADDCcc_I	addccc 	%r8, 0x0af1, %r23
	.word 0xac88a145  ! 4: ANDcc_I	andcc 	%r2, 0x0145, %r22
	.word 0xb2a9000f  ! 4: ANDNcc_R	andncc 	%r4, %r15, %r25
	.word 0xbaa96f37  ! 4: ANDNcc_I	andncc 	%r5, 0x0f37, %r29
	.word 0xb931800a  ! 4: SRL_R	srl 	%r6, %r10, %r28
thr3_resum_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_325), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa29a063  ! 4: ANDN_I	andn 	%r6, 0x0063, %r21
	.word 0xae39ef0c  ! 4: XNOR_I	xnor 	%r7, 0x0f0c, %r23
	.word 0xac12000e  ! 4: OR_R	or 	%r8, %r14, %r22
	.word 0xac08c00a  ! 4: AND_R	and 	%r3, %r10, %r22
thr3_nuke_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_326), 16, 16)) -> intp(1, 2, 1)
	.word 0xb01a251f  ! 4: XOR_I	xor 	%r8, 0x051f, %r24
	.word 0xb3312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r25
	.word 0xae38800c  ! 4: XNOR_R	xnor 	%r2, %r12, %r23
	.word 0xb179e401  ! 4: MOVR_I	move	%r7, 0xc, %r24
	.word 0xac322046  ! 4: ORN_I	orn 	%r8, 0x0046, %r22
	.word 0xbc09c00c  ! 4: AND_R	and 	%r7, %r12, %r30
	.word 0xae28efd4  ! 4: ANDN_I	andn 	%r3, 0x0fd4, %r23
thr3_resum_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_326), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6a96e62  ! 4: ANDNcc_I	andncc 	%r5, 0x0e62, %r27
	.word 0xacc0ec1f  ! 4: ADDCcc_I	addccc 	%r3, 0x0c1f, %r22
	.word 0xb0912705  ! 4: ORcc_I	orcc 	%r4, 0x0705, %r24
thr3_hw_intr_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_327), 16, 16)) -> intp(0, 0, 1)
	.word 0xac816cf4  ! 4: ADDcc_I	addcc 	%r5, 0x0cf4, %r22
	.word 0xbc81aae8  ! 4: ADDcc_I	addcc 	%r6, 0x0ae8, %r30
	.word 0xb48a000c  ! 4: ANDcc_R	andcc 	%r8, %r12, %r26
	.word 0xa899000d  ! 4: XORcc_R	xorcc 	%r4, %r13, %r20
	.word 0xb2a8aa1d  ! 4: ANDNcc_I	andncc 	%r2, 0x0a1d, %r25
	.word 0xb48a000b  ! 4: ANDcc_R	andcc 	%r8, %r11, %r26
thr3_nuke_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_328), 16, 16)) -> intp(1, 2, 1)
	.word 0xb0892370  ! 4: ANDcc_I	andcc 	%r4, 0x0370, %r24
	.word 0xb229400b  ! 4: ANDN_R	andn 	%r5, %r11, %r25
	.word 0xb731900b  ! 4: SRLX_R	srlx	%r6, %r11, %r27
	.word 0xb330d00e  ! 4: SRLX_R	srlx	%r3, %r14, %r25
	.word 0xa8c22bb8  ! 4: ADDCcc_I	addccc 	%r8, 0x0bb8, %r20
	.word 0xb7392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r27
thr3_resum_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_328), 16, 16)) -> intp(1, 3, 1)
	.word 0xb631e160  ! 4: ORN_I	orn 	%r7, 0x0160, %r27
	.word 0xb364180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r20
	.word 0xb439000e  ! 4: XNOR_R	xnor 	%r4, %r14, %r26
thr3_hw_intr_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_329), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa31eca8  ! 4: ORN_I	orn 	%r7, 0x0ca8, %r21
	.word 0xb238800d  ! 4: XNOR_R	xnor 	%r2, %r13, %r25
	.word 0xaa81800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r21
	.word 0xae40c00e  ! 4: ADDC_R	addc 	%r3, %r14, %r23
	.word 0xb130800e  ! 4: SRL_R	srl 	%r2, %r14, %r24
	.word 0xae32000c  ! 4: ORN_R	orn 	%r8, %r12, %r23
thr3_nuke_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_330), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6b12307  ! 4: ORNcc_I	orncc 	%r4, 0x0307, %r27
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xac122395  ! 4: OR_I	or 	%r8, 0x0395, %r22
	.word 0xb819c00b  ! 4: XOR_R	xor 	%r7, %r11, %r28
	.word 0xa9323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r20
thr3_resum_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_330), 16, 16)) -> intp(1, 3, 1)
	.word 0xb291400e  ! 4: ORcc_R	orcc 	%r5, %r14, %r25
	.word 0xba90a410  ! 4: ORcc_I	orcc 	%r2, 0x0410, %r29
	.word 0xb209e631  ! 4: AND_I	and 	%r7, 0x0631, %r25
thr3_nuke_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_331), 16, 16)) -> intp(0, 2, 1)
	.word 0xad3a000c  ! 4: SRA_R	sra 	%r8, %r12, %r22
	.word 0xba80800a  ! 4: ADDcc_R	addcc 	%r2, %r10, %r29
	.word 0xb882000b  ! 4: ADDcc_R	addcc 	%r8, %r11, %r28
thr3_resum_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_331), 16, 16)) -> intp(0, 3, 1)
	.word 0xb68a271b  ! 4: ANDcc_I	andcc 	%r8, 0x071b, %r27
	.word 0xb291c00b  ! 4: ORcc_R	orcc 	%r7, %r11, %r25
thr3_nuke_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_332), 16, 16)) -> intp(1, 2, 1)
	.word 0xb0096d08  ! 4: AND_I	and 	%r5, 0x0d08, %r24
	.word 0xac39c00e  ! 4: XNOR_R	xnor 	%r7, %r14, %r22
	.word 0xb2b8c00d  ! 4: XNORcc_R	xnorcc 	%r3, %r13, %r25
	.word 0xad31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r22
	.word 0xb429800d  ! 4: ANDN_R	andn 	%r6, %r13, %r26
	.word 0xa928900a  ! 4: SLLX_R	sllx	%r2, %r10, %r20
	.word 0xb011800a  ! 4: OR_R	or 	%r6, %r10, %r24
thr3_resum_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_332), 16, 16)) -> intp(1, 3, 1)
	.word 0xad39000d  ! 4: SRA_R	sra 	%r4, %r13, %r22
thr3_hw_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_333), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r28
	.word 0xb579e401  ! 4: MOVR_I	move	%r7, 0x1, %r26
	.word 0xb229afae  ! 4: ANDN_I	andn 	%r6, 0x0fae, %r25
	.word 0xb8196341  ! 4: XOR_I	xor 	%r5, 0x0341, %r28
	.word 0xaa9a2bae  ! 4: XORcc_I	xorcc 	%r8, 0x0bae, %r21
	.word 0xae10800c  ! 4: OR_R	or 	%r2, %r12, %r23
	.word 0xb6b1ea30  ! 4: ORNcc_I	orncc 	%r7, 0x0a30, %r27
thr3_hw_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_334), 16, 16)) -> intp(1, 0, 1)
	.word 0xb939900b  ! 4: SRAX_R	srax	%r6, %r11, %r28
	.word 0xb979c40b  ! 4: MOVR_R	move	%r7, %r11, %r28
	.word 0xbd64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb731100b  ! 4: SRLX_R	srlx	%r4, %r11, %r27
	.word 0xb2822ad0  ! 4: ADDcc_I	addcc 	%r8, 0x0ad0, %r25
	.word 0xbc822ad4  ! 4: ADDcc_I	addcc 	%r8, 0x0ad4, %r30
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_335), 16, 16)) -> intp(0, 2, 1)
	.word 0xb331400e  ! 4: SRL_R	srl 	%r5, %r14, %r25
	.word 0xb089800d  ! 4: ANDcc_R	andcc 	%r6, %r13, %r24
	.word 0xa800800b  ! 4: ADD_R	add 	%r2, %r11, %r20
thr3_resum_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_335), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r29
	.word 0xad39c00d  ! 4: SRA_R	sra 	%r7, %r13, %r22
	.word 0xb6b0e5ed  ! 4: ORNcc_I	orncc 	%r3, 0x05ed, %r27
	.word 0xaec1c00a  ! 4: ADDCcc_R	addccc 	%r7, %r10, %r23
thr3_nuke_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_336), 16, 16)) -> intp(0, 2, 1)
	.word 0xb7792401  ! 4: MOVR_I	move	%r4, 0xa, %r27
	.word 0xa810e8e7  ! 4: OR_I	or 	%r3, 0x08e7, %r20
	.word 0xa838a15d  ! 4: XNOR_I	xnor 	%r2, 0x015d, %r20
thr3_resum_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_336), 16, 16)) -> intp(0, 3, 1)
	.word 0xa899af2d  ! 4: XORcc_I	xorcc 	%r6, 0x0f2d, %r20
	.word 0xb8a9800c  ! 4: ANDNcc_R	andncc 	%r6, %r12, %r28
thr3_nuke_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_337), 16, 16)) -> intp(0, 2, 1)
	.word 0xad293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r22
	.word 0xba18c00d  ! 4: XOR_R	xor 	%r3, %r13, %r29
thr3_resum_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_337), 16, 16)) -> intp(0, 3, 1)
	.word 0xa932000d  ! 4: SRL_R	srl 	%r8, %r13, %r20
	.word 0xb9312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r28
	.word 0xb0812bdb  ! 4: ADDcc_I	addcc 	%r4, 0x0bdb, %r24
thr3_nuke_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_338), 16, 16)) -> intp(1, 2, 1)
	.word 0xa811000a  ! 4: OR_R	or 	%r4, %r10, %r20
	.word 0xbb29b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r29
thr3_resum_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_338), 16, 16)) -> intp(1, 3, 1)
	.word 0xb031c00f  ! 4: ORN_R	orn 	%r7, %r15, %r24
	.word 0xbd79e401  ! 4: MOVR_I	move	%r7, 0xf, %r30
	.word 0xacb1afef  ! 4: ORNcc_I	orncc 	%r6, 0x0fef, %r22
	.word 0xb210e3c9  ! 4: OR_I	or 	%r3, 0x03c9, %r25
thr3_hw_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_339), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8b1800c  ! 4: ORNcc_R	orncc 	%r6, %r12, %r28
	.word 0xaa09227d  ! 4: AND_I	and 	%r4, 0x027d, %r21
	.word 0xb892000c  ! 4: ORcc_R	orcc 	%r8, %r12, %r28
	.word 0xb489c00d  ! 4: ANDcc_R	andcc 	%r7, %r13, %r26
	.word 0xa888aa4c  ! 4: ANDcc_I	andcc 	%r2, 0x0a4c, %r20
	.word 0xb688c00b  ! 4: ANDcc_R	andcc 	%r3, %r11, %r27
	.word 0xb0a8800b  ! 4: ANDNcc_R	andncc 	%r2, %r11, %r24
thr3_hw_intr_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_340), 16, 16)) -> intp(1, 0, 1)
	.word 0xac2a000a  ! 4: ANDN_R	andn 	%r8, %r10, %r22
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb4b9c00b  ! 4: XNORcc_R	xnorcc 	%r7, %r11, %r26
	.word 0xa841800b  ! 4: ADDC_R	addc 	%r6, %r11, %r20
	.word 0xab293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r21
	.word 0xb930900e  ! 4: SRLX_R	srlx	%r2, %r14, %r28
	.word 0xb731000b  ! 4: SRL_R	srl 	%r4, %r11, %r27
thr3_nuke_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_341), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa8b9a471  ! 4: XNORcc_I	xnorcc 	%r6, 0x0471, %r20
	.word 0xaab1400d  ! 4: ORNcc_R	orncc 	%r5, %r13, %r21
	.word 0xba98ad38  ! 4: XORcc_I	xorcc 	%r2, 0x0d38, %r29
	.word 0xb338c00f  ! 4: SRA_R	sra 	%r3, %r15, %r25
	.word 0xb829c00c  ! 4: ANDN_R	andn 	%r7, %r12, %r28
thr3_resum_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_341), 16, 16)) -> intp(0, 3, 1)
	.word 0xa809800b  ! 4: AND_R	and 	%r6, %r11, %r20
	.word 0xa8892b0c  ! 4: ANDcc_I	andcc 	%r4, 0x0b0c, %r20
	.word 0xb130a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r24
	.word 0xb8b9400e  ! 4: XNORcc_R	xnorcc 	%r5, %r14, %r28
thr3_hw_intr_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_342), 16, 16)) -> intp(0, 0, 1)
	.word 0xba30800f  ! 4: ORN_R	orn 	%r2, %r15, %r29
	.word 0xba28c00b  ! 4: ANDN_R	andn 	%r3, %r11, %r29
	.word 0xbb78e401  ! 4: MOVR_I	move	%r3, 0xb, %r29
	.word 0xbd31800d  ! 4: SRL_R	srl 	%r6, %r13, %r30
	.word 0xb010e25f  ! 4: OR_I	or 	%r3, 0x025f, %r24
	.word 0xb729e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r27
	.word 0xb728900e  ! 4: SLLX_R	sllx	%r2, %r14, %r27
thr3_hw_intr_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_343), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa91adb7  ! 4: ORcc_I	orcc 	%r6, 0x0db7, %r21
	.word 0xb881800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r28
	.word 0xac896527  ! 4: ANDcc_I	andcc 	%r5, 0x0527, %r22
	.word 0xa928d00a  ! 4: SLLX_R	sllx	%r3, %r10, %r20
	.word 0xac016e8d  ! 4: ADD_I	add 	%r5, 0x0e8d, %r22
	.word 0xb290c00c  ! 4: ORcc_R	orcc 	%r3, %r12, %r25
thr3_nuke_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_344), 16, 16)) -> intp(0, 2, 1)
	.word 0xb131c00b  ! 4: SRL_R	srl 	%r7, %r11, %r24
	.word 0xb0a964c8  ! 4: ANDNcc_I	andncc 	%r5, 0x04c8, %r24
	.word 0xb829000b  ! 4: ANDN_R	andn 	%r4, %r11, %r28
thr3_resum_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_344), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8b9000f  ! 4: XNORcc_R	xnorcc 	%r4, %r15, %r20
	.word 0xbb31500b  ! 4: SRLX_R	srlx	%r5, %r11, %r29
	.word 0xac30c00f  ! 4: ORN_R	orn 	%r3, %r15, %r22
thr3_hw_intr_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_345), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb28800b  ! 4: SLL_R	sll 	%r2, %r11, %r29
	.word 0xb431a690  ! 4: ORN_I	orn 	%r6, 0x0690, %r26
	.word 0xb2b9000b  ! 4: XNORcc_R	xnorcc 	%r4, %r11, %r25
	.word 0xba98a2c7  ! 4: XORcc_I	xorcc 	%r2, 0x02c7, %r29
	.word 0xb499ef3b  ! 4: XORcc_I	xorcc 	%r7, 0x0f3b, %r26
	.word 0xaa40800a  ! 4: ADDC_R	addc 	%r2, %r10, %r21
	.word 0xaa11e27a  ! 4: OR_I	or 	%r7, 0x027a, %r21
thr3_hw_intr_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_346), 16, 16)) -> intp(0, 0, 1)
	.word 0xba012b27  ! 4: ADD_I	add 	%r4, 0x0b27, %r29
	.word 0xb828c00a  ! 4: ANDN_R	andn 	%r3, %r10, %r28
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb328b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r25
	.word 0xa888c00f  ! 4: ANDcc_R	andcc 	%r3, %r15, %r20
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xab39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r21
thr3_nuke_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_347), 16, 16)) -> intp(1, 2, 1)
	.word 0xae98800b  ! 4: XORcc_R	xorcc 	%r2, %r11, %r23
	.word 0xaab925b6  ! 4: XNORcc_I	xnorcc 	%r4, 0x05b6, %r21
	.word 0xb639e037  ! 4: XNOR_I	xnor 	%r7, 0x0037, %r27
	.word 0xbd28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r30
	.word 0xb3292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r25
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb2296866  ! 4: ANDN_I	andn 	%r5, 0x0866, %r25
thr3_resum_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_347), 16, 16)) -> intp(1, 3, 1)
	.word 0xb011e39f  ! 4: OR_I	or 	%r7, 0x039f, %r24
	.word 0xae00e88c  ! 4: ADD_I	add 	%r3, 0x088c, %r23
	.word 0xb288c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r25
	.word 0xa8b9800b  ! 4: XNORcc_R	xnorcc 	%r6, %r11, %r20
thr3_hw_intr_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_348), 16, 16)) -> intp(0, 0, 1)
	.word 0xb628800c  ! 4: ANDN_R	andn 	%r2, %r12, %r27
	.word 0xbcb1800b  ! 4: ORNcc_R	orncc 	%r6, %r11, %r30
	.word 0xb8b0ec74  ! 4: ORNcc_I	orncc 	%r3, 0x0c74, %r28
	.word 0xacb22bc0  ! 4: ORNcc_I	orncc 	%r8, 0x0bc0, %r22
	.word 0xb611c00c  ! 4: OR_R	or 	%r7, %r12, %r27
	.word 0xae08800c  ! 4: AND_R	and 	%r2, %r12, %r23
	.word 0xaa88c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r21
thr3_nuke_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_349), 16, 16)) -> intp(1, 2, 1)
	.word 0xad30800a  ! 4: SRL_R	srl 	%r2, %r10, %r22
	.word 0xad29900e  ! 4: SLLX_R	sllx	%r6, %r14, %r22
	.word 0xb409e060  ! 4: AND_I	and 	%r7, 0x0060, %r26
thr3_resum_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_349), 16, 16)) -> intp(1, 3, 1)
	.word 0xacc1800a  ! 4: ADDCcc_R	addccc 	%r6, %r10, %r22
	.word 0xb280800a  ! 4: ADDcc_R	addcc 	%r2, %r10, %r25
thr3_nuke_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_350), 16, 16)) -> intp(0, 2, 1)
	.word 0xad29a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r22
	.word 0xaec1800a  ! 4: ADDCcc_R	addccc 	%r6, %r10, %r23
	.word 0xaaa9a7e1  ! 4: ANDNcc_I	andncc 	%r6, 0x07e1, %r21
	.word 0xaa192e09  ! 4: XOR_I	xor 	%r4, 0x0e09, %r21
thr3_resum_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_350), 16, 16)) -> intp(0, 3, 1)
	.word 0xb288800b  ! 4: ANDcc_R	andcc 	%r2, %r11, %r25
	.word 0xb2b8ea8e  ! 4: XNORcc_I	xnorcc 	%r3, 0x0a8e, %r25
	.word 0xba39800e  ! 4: XNOR_R	xnor 	%r6, %r14, %r29
	.word 0xac98800d  ! 4: XORcc_R	xorcc 	%r2, %r13, %r22
thr3_nuke_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_351), 16, 16)) -> intp(0, 2, 1)
	.word 0xa928c00e  ! 4: SLL_R	sll 	%r3, %r14, %r20
	.word 0xb8b8800a  ! 4: XNORcc_R	xnorcc 	%r2, %r10, %r28
	.word 0xbcaa000f  ! 4: ANDNcc_R	andncc 	%r8, %r15, %r30
thr3_resum_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_351), 16, 16)) -> intp(0, 3, 1)
	.word 0xb83120aa  ! 4: ORN_I	orn 	%r4, 0x00aa, %r28
	.word 0xaab12c04  ! 4: ORNcc_I	orncc 	%r4, 0x0c04, %r21
	.word 0xb041400f  ! 4: ADDC_R	addc 	%r5, %r15, %r24
	.word 0xb7396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r27
thr3_hw_intr_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_352), 16, 16)) -> intp(0, 0, 1)
	.word 0xb530f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r26
	.word 0xb029ed56  ! 4: ANDN_I	andn 	%r7, 0x0d56, %r24
	.word 0xb681eba8  ! 4: ADDcc_I	addcc 	%r7, 0x0ba8, %r27
	.word 0xb038e128  ! 4: XNOR_I	xnor 	%r3, 0x0128, %r24
	.word 0xb0292244  ! 4: ANDN_I	andn 	%r4, 0x0244, %r24
	.word 0xb564180a  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_353), 16, 16)) -> intp(1, 2, 1)
	.word 0xae2a2456  ! 4: ANDN_I	andn 	%r8, 0x0456, %r23
thr3_resum_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_353), 16, 16)) -> intp(1, 3, 1)
	.word 0xb298e9d3  ! 4: XORcc_I	xorcc 	%r3, 0x09d3, %r25
	.word 0xa8c1ee2c  ! 4: ADDCcc_I	addccc 	%r7, 0x0e2c, %r20
	.word 0xa841623d  ! 4: ADDC_I	addc 	%r5, 0x023d, %r20
thr3_nuke_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_354), 16, 16)) -> intp(0, 2, 1)
	.word 0xa800ab32  ! 4: ADD_I	add 	%r2, 0x0b32, %r20
	.word 0xb728c00a  ! 4: SLL_R	sll 	%r3, %r10, %r27
	.word 0xb240aab8  ! 4: ADDC_I	addc 	%r2, 0x0ab8, %r25
	.word 0xa829000c  ! 4: ANDN_R	andn 	%r4, %r12, %r20
thr3_resum_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_354), 16, 16)) -> intp(0, 3, 1)
	.word 0xb800800a  ! 4: ADD_R	add 	%r2, %r10, %r28
	.word 0xb929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r28
	.word 0xbcb9c00c  ! 4: XNORcc_R	xnorcc 	%r7, %r12, %r30
	.word 0xab38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r21
thr3_hw_intr_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_355), 16, 16)) -> intp(0, 0, 1)
	.word 0xb829efd4  ! 4: ANDN_I	andn 	%r7, 0x0fd4, %r28
	.word 0xb839400b  ! 4: XNOR_R	xnor 	%r5, %r11, %r28
	.word 0xb0b9a6d4  ! 4: XNORcc_I	xnorcc 	%r6, 0x06d4, %r24
	.word 0xad28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r22
	.word 0xaa08adb1  ! 4: AND_I	and 	%r2, 0x0db1, %r21
	.word 0xa939900e  ! 4: SRAX_R	srax	%r6, %r14, %r20
	.word 0xa829226a  ! 4: ANDN_I	andn 	%r4, 0x026a, %r20
thr3_nuke_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_356), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8096d14  ! 4: AND_I	and 	%r5, 0x0d14, %r20
	.word 0xb299400f  ! 4: XORcc_R	xorcc 	%r5, %r15, %r25
	.word 0xb2a96f67  ! 4: ANDNcc_I	andncc 	%r5, 0x0f67, %r25
thr3_resum_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_356), 16, 16)) -> intp(1, 3, 1)
	.word 0xb530800f  ! 4: SRL_R	srl 	%r2, %r15, %r26
thr3_nuke_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_357), 16, 16)) -> intp(0, 2, 1)
	.word 0xbcc0800d  ! 4: ADDCcc_R	addccc 	%r2, %r13, %r30
	.word 0xaeb16ae1  ! 4: ORNcc_I	orncc 	%r5, 0x0ae1, %r23
	.word 0xbc30800f  ! 4: ORN_R	orn 	%r2, %r15, %r30
	.word 0xaa09af23  ! 4: AND_I	and 	%r6, 0x0f23, %r21
	.word 0xbb64180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xad293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r22
	.word 0xae81c00c  ! 4: ADDcc_R	addcc 	%r7, %r12, %r23
thr3_resum_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_357), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb39400d  ! 4: SRA_R	sra 	%r5, %r13, %r29
	.word 0xb212000e  ! 4: OR_R	or 	%r8, %r14, %r25
thr3_hw_intr_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_358), 16, 16)) -> intp(0, 0, 1)
	.word 0xb211c00d  ! 4: OR_R	or 	%r7, %r13, %r25
	.word 0xacb8acc0  ! 4: XNORcc_I	xnorcc 	%r2, 0x0cc0, %r22
	.word 0xbb29900c  ! 4: SLLX_R	sllx	%r6, %r12, %r29
	.word 0xa931000a  ! 4: SRL_R	srl 	%r4, %r10, %r20
	.word 0xa819800e  ! 4: XOR_R	xor 	%r6, %r14, %r20
	.word 0xb080c00e  ! 4: ADDcc_R	addcc 	%r3, %r14, %r24
	.word 0xbd39500e  ! 4: SRAX_R	srax	%r5, %r14, %r30
thr3_nuke_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_359), 16, 16)) -> intp(1, 2, 1)
	.word 0xb481e270  ! 4: ADDcc_I	addcc 	%r7, 0x0270, %r26
	.word 0xaa10a8db  ! 4: OR_I	or 	%r2, 0x08db, %r21
thr3_resum_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_359), 16, 16)) -> intp(1, 3, 1)
	.word 0xb4b8a8f4  ! 4: XNORcc_I	xnorcc 	%r2, 0x08f4, %r26
	.word 0xbc28aefb  ! 4: ANDN_I	andn 	%r2, 0x0efb, %r30
	.word 0xba3a000d  ! 4: XNOR_R	xnor 	%r8, %r13, %r29
thr3_hw_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_360), 16, 16)) -> intp(0, 0, 1)
	.word 0xb131100e  ! 4: SRLX_R	srlx	%r4, %r14, %r24
	.word 0xb0b22778  ! 4: ORNcc_I	orncc 	%r8, 0x0778, %r24
	.word 0xbac12f66  ! 4: ADDCcc_I	addccc 	%r4, 0x0f66, %r29
	.word 0xb4416a5d  ! 4: ADDC_I	addc 	%r5, 0x0a5d, %r26
	.word 0xb0c1800f  ! 4: ADDCcc_R	addccc 	%r6, %r15, %r24
	.word 0xad29100c  ! 4: SLLX_R	sllx	%r4, %r12, %r22
thr3_nuke_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_361), 16, 16)) -> intp(0, 2, 1)
	.word 0xae80800c  ! 4: ADDcc_R	addcc 	%r2, %r12, %r23
	.word 0xb890800e  ! 4: ORcc_R	orcc 	%r2, %r14, %r28
	.word 0xa841400a  ! 4: ADDC_R	addc 	%r5, %r10, %r20
	.word 0xb019000c  ! 4: XOR_R	xor 	%r4, %r12, %r24
thr3_resum_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_361), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb29800f  ! 4: SLL_R	sll 	%r6, %r15, %r29
thr3_hw_intr_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_362), 16, 16)) -> intp(1, 0, 1)
	.word 0xaca9a946  ! 4: ANDNcc_I	andncc 	%r6, 0x0946, %r22
	.word 0xb481e2e7  ! 4: ADDcc_I	addcc 	%r7, 0x02e7, %r26
	.word 0xb129a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r24
	.word 0xbd39900e  ! 4: SRAX_R	srax	%r6, %r14, %r30
	.word 0xb030c00e  ! 4: ORN_R	orn 	%r3, %r14, %r24
	.word 0xbd2a100c  ! 4: SLLX_R	sllx	%r8, %r12, %r30
	.word 0xb8392073  ! 4: XNOR_I	xnor 	%r4, 0x0073, %r28
thr3_hw_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_363), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa992dac  ! 4: XORcc_I	xorcc 	%r4, 0x0dac, %r21
	.word 0xb538e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r26
	.word 0xa899a060  ! 4: XORcc_I	xorcc 	%r6, 0x0060, %r20
	.word 0xb129a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r24
	.word 0xad31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r22
	.word 0xb930800a  ! 4: SRL_R	srl 	%r2, %r10, %r28
thr3_hw_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_364), 16, 16)) -> intp(0, 0, 1)
	.word 0xb899400a  ! 4: XORcc_R	xorcc 	%r5, %r10, %r28
	.word 0xb164180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae39e0fe  ! 4: XNOR_I	xnor 	%r7, 0x00fe, %r23
	.word 0xb338c00a  ! 4: SRA_R	sra 	%r3, %r10, %r25
	.word 0xaf30f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r23
	.word 0xbb38c00f  ! 4: SRA_R	sra 	%r3, %r15, %r29
	.word 0xbcb0e5fa  ! 4: ORNcc_I	orncc 	%r3, 0x05fa, %r30
thr3_nuke_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_365), 16, 16)) -> intp(0, 2, 1)
	.word 0xb930a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r28
	.word 0xaf28d00f  ! 4: SLLX_R	sllx	%r3, %r15, %r23
	.word 0xa811c00d  ! 4: OR_R	or 	%r7, %r13, %r20
	.word 0xb728d00d  ! 4: SLLX_R	sllx	%r3, %r13, %r27
	.word 0xbc98c00b  ! 4: XORcc_R	xorcc 	%r3, %r11, %r30
	.word 0xa931d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r20
thr3_resum_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_365), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf79840d  ! 4: MOVR_R	move	%r6, %r13, %r23
	.word 0xaea8800a  ! 4: ANDNcc_R	andncc 	%r2, %r10, %r23
thr3_nuke_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_366), 16, 16)) -> intp(1, 2, 1)
	.word 0xb21a000c  ! 4: XOR_R	xor 	%r8, %r12, %r25
	.word 0xb080c00c  ! 4: ADDcc_R	addcc 	%r3, %r12, %r24
	.word 0xb939500e  ! 4: SRAX_R	srax	%r5, %r14, %r28
	.word 0xaa00a855  ! 4: ADD_I	add 	%r2, 0x0855, %r21
	.word 0xa931000f  ! 4: SRL_R	srl 	%r4, %r15, %r20
	.word 0xb490a7b3  ! 4: ORcc_I	orcc 	%r2, 0x07b3, %r26
	.word 0xa8a9252b  ! 4: ANDNcc_I	andncc 	%r4, 0x052b, %r20
thr3_resum_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_366), 16, 16)) -> intp(1, 3, 1)
	.word 0xac91ec2e  ! 4: ORcc_I	orcc 	%r7, 0x0c2e, %r22
	.word 0xbd78840b  ! 4: MOVR_R	move	%r2, %r11, %r30
	.word 0xbc39a719  ! 4: XNOR_I	xnor 	%r6, 0x0719, %r30
thr3_hw_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_367), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4aa2420  ! 4: ANDNcc_I	andncc 	%r8, 0x0420, %r26
	.word 0xaaa9c00b  ! 4: ANDNcc_R	andncc 	%r7, %r11, %r21
	.word 0xaec1c00e  ! 4: ADDCcc_R	addccc 	%r7, %r14, %r23
	.word 0xb08a20e1  ! 4: ANDcc_I	andcc 	%r8, 0x00e1, %r24
	.word 0xb6a9e99f  ! 4: ANDNcc_I	andncc 	%r7, 0x099f, %r27
	.word 0xad792401  ! 4: MOVR_I	move	%r4, 0x99f, %r22
thr3_nuke_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_368), 16, 16)) -> intp(1, 2, 1)
	.word 0xb331e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r25
thr3_resum_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_368), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2b12728  ! 4: ORNcc_I	orncc 	%r4, 0x0728, %r25
thr3_nuke_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_369), 16, 16)) -> intp(0, 2, 1)
	.word 0xb1796401  ! 4: MOVR_I	move	%r5, 0xffffff28, %r24
	.word 0xb52a100c  ! 4: SLLX_R	sllx	%r8, %r12, %r26
	.word 0xb28a2f2d  ! 4: ANDcc_I	andcc 	%r8, 0x0f2d, %r25
thr3_resum_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_369), 16, 16)) -> intp(0, 3, 1)
	.word 0xa811ed56  ! 4: OR_I	or 	%r7, 0x0d56, %r20
	.word 0xb0c12aec  ! 4: ADDCcc_I	addccc 	%r4, 0x0aec, %r24
	.word 0xb639a70c  ! 4: XNOR_I	xnor 	%r6, 0x070c, %r27
thr3_hw_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_370), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b8c00c  ! 4: XNORcc_R	xnorcc 	%r3, %r12, %r26
	.word 0xb21a000b  ! 4: XOR_R	xor 	%r8, %r11, %r25
	.word 0xb439e149  ! 4: XNOR_I	xnor 	%r7, 0x0149, %r26
	.word 0xbb7a040c  ! 4: MOVR_R	move	%r8, %r12, %r29
	.word 0xbc3a2d09  ! 4: XNOR_I	xnor 	%r8, 0x0d09, %r30
	.word 0xa97a040c  ! 4: MOVR_R	move	%r8, %r12, %r20
thr3_hw_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_371), 16, 16)) -> intp(1, 0, 1)
	.word 0xab312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r21
	.word 0xb0b16f3b  ! 4: ORNcc_I	orncc 	%r5, 0x0f3b, %r24
	.word 0xb891800f  ! 4: ORcc_R	orcc 	%r6, %r15, %r28
	.word 0xa881800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r20
	.word 0xbab1400c  ! 4: ORNcc_R	orncc 	%r5, %r12, %r29
	.word 0xb02a24e6  ! 4: ANDN_I	andn 	%r8, 0x04e6, %r24
thr3_nuke_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_372), 16, 16)) -> intp(0, 2, 1)
	.word 0xab312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r21
	.word 0xb6aa279c  ! 4: ANDNcc_I	andncc 	%r8, 0x079c, %r27
	.word 0xb00a000c  ! 4: AND_R	and 	%r8, %r12, %r24
thr3_resum_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_372), 16, 16)) -> intp(0, 3, 1)
	.word 0xb364180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb641c00a  ! 4: ADDC_R	addc 	%r7, %r10, %r27
thr3_hw_intr_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_373), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb39800d  ! 4: SRA_R	sra 	%r6, %r13, %r29
	.word 0xaca8c00b  ! 4: ANDNcc_R	andncc 	%r3, %r11, %r22
	.word 0xb628ab50  ! 4: ANDN_I	andn 	%r2, 0x0b50, %r27
	.word 0xad28d00f  ! 4: SLLX_R	sllx	%r3, %r15, %r22
	.word 0xbc98800b  ! 4: XORcc_R	xorcc 	%r2, %r11, %r30
	.word 0xba096108  ! 4: AND_I	and 	%r5, 0x0108, %r29
thr3_nuke_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_374), 16, 16)) -> intp(1, 2, 1)
	.word 0xb732100a  ! 4: SRLX_R	srlx	%r8, %r10, %r27
	.word 0xb638800b  ! 4: XNOR_R	xnor 	%r2, %r11, %r27
thr3_resum_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_374), 16, 16)) -> intp(1, 3, 1)
	.word 0xb439c00b  ! 4: XNOR_R	xnor 	%r7, %r11, %r26
	.word 0xba31800e  ! 4: ORN_R	orn 	%r6, %r14, %r29
	.word 0xaa31e6cf  ! 4: ORN_I	orn 	%r7, 0x06cf, %r21
	.word 0xaeb0eca4  ! 4: ORNcc_I	orncc 	%r3, 0x0ca4, %r23
thr3_nuke_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_375), 16, 16)) -> intp(0, 2, 1)
	.word 0xac18800d  ! 4: XOR_R	xor 	%r2, %r13, %r22
	.word 0xac29c00f  ! 4: ANDN_R	andn 	%r7, %r15, %r22
	.word 0xaaa923df  ! 4: ANDNcc_I	andncc 	%r4, 0x03df, %r21
	.word 0xa881800e  ! 4: ADDcc_R	addcc 	%r6, %r14, %r20
	.word 0xae19000a  ! 4: XOR_R	xor 	%r4, %r10, %r23
thr3_resum_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_375), 16, 16)) -> intp(0, 3, 1)
	.word 0xbcc0eaf7  ! 4: ADDCcc_I	addccc 	%r3, 0x0af7, %r30
thr3_hw_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_376), 16, 16)) -> intp(1, 0, 1)
	.word 0xba41af0e  ! 4: ADDC_I	addc 	%r6, 0x0f0e, %r29
	.word 0xac91400a  ! 4: ORcc_R	orcc 	%r5, %r10, %r22
	.word 0xb130d00a  ! 4: SRLX_R	srlx	%r3, %r10, %r24
	.word 0xb889c00f  ! 4: ANDcc_R	andcc 	%r7, %r15, %r28
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa81a3e2  ! 4: ADDcc_I	addcc 	%r6, 0x03e2, %r21
thr3_hw_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_377), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa18800e  ! 4: XOR_R	xor 	%r2, %r14, %r21
	.word 0xbd29b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r30
	.word 0xb602000a  ! 4: ADD_R	add 	%r8, %r10, %r27
	.word 0xab792401  ! 4: MOVR_I	move	%r4, 0xa, %r21
	.word 0xb6296544  ! 4: ANDN_I	andn 	%r5, 0x0544, %r27
	.word 0xad28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r22
	.word 0xb611000d  ! 4: OR_R	or 	%r4, %r13, %r27
thr3_hw_intr_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_378), 16, 16)) -> intp(0, 0, 1)
	.word 0xb698c00b  ! 4: XORcc_R	xorcc 	%r3, %r11, %r27
	.word 0xba29e6e3  ! 4: ANDN_I	andn 	%r7, 0x06e3, %r29
	.word 0xba90e801  ! 4: ORcc_I	orcc 	%r3, 0x0801, %r29
	.word 0xaca96217  ! 4: ANDNcc_I	andncc 	%r5, 0x0217, %r22
	.word 0xb080aef8  ! 4: ADDcc_I	addcc 	%r2, 0x0ef8, %r24
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_379), 16, 16)) -> intp(0, 0, 1)
	.word 0xa891400b  ! 4: ORcc_R	orcc 	%r5, %r11, %r20
	.word 0xb888c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r28
	.word 0xb0816019  ! 4: ADDcc_I	addcc 	%r5, 0x0019, %r24
	.word 0xaf39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r23
	.word 0xac996213  ! 4: XORcc_I	xorcc 	%r5, 0x0213, %r22
	.word 0xbab0800b  ! 4: ORNcc_R	orncc 	%r2, %r11, %r29
thr3_nuke_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_380), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd28c00e  ! 4: SLL_R	sll 	%r3, %r14, %r30
	.word 0xb2012c8d  ! 4: ADD_I	add 	%r4, 0x0c8d, %r25
	.word 0xbd31800d  ! 4: SRL_R	srl 	%r6, %r13, %r30
	.word 0xbc40a4d4  ! 4: ADDC_I	addc 	%r2, 0x04d4, %r30
	.word 0xaa91400a  ! 4: ORcc_R	orcc 	%r5, %r10, %r21
	.word 0xab38d00a  ! 4: SRAX_R	srax	%r3, %r10, %r21
	.word 0xb731d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r27
thr3_resum_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_380), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa02000f  ! 4: ADD_R	add 	%r8, %r15, %r21
thr3_nuke_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_381), 16, 16)) -> intp(0, 2, 1)
	.word 0xb238800e  ! 4: XNOR_R	xnor 	%r2, %r14, %r25
	.word 0xbb39500c  ! 4: SRAX_R	srax	%r5, %r12, %r29
	.word 0xb698a2b3  ! 4: XORcc_I	xorcc 	%r2, 0x02b3, %r27
	.word 0xb2c0800b  ! 4: ADDCcc_R	addccc 	%r2, %r11, %r25
	.word 0xb410c00b  ! 4: OR_R	or 	%r3, %r11, %r26
thr3_resum_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_381), 16, 16)) -> intp(0, 3, 1)
	.word 0xb29a2a91  ! 4: XORcc_I	xorcc 	%r8, 0x0a91, %r25
thr3_hw_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_382), 16, 16)) -> intp(1, 0, 1)
	.word 0xb631ed21  ! 4: ORN_I	orn 	%r7, 0x0d21, %r27
	.word 0xb011267b  ! 4: OR_I	or 	%r4, 0x067b, %r24
	.word 0xaa40800d  ! 4: ADDC_R	addc 	%r2, %r13, %r21
	.word 0xb532000d  ! 4: SRL_R	srl 	%r8, %r13, %r26
	.word 0xb928800c  ! 4: SLL_R	sll 	%r2, %r12, %r28
	.word 0xaa99c00c  ! 4: XORcc_R	xorcc 	%r7, %r12, %r21
	.word 0xb331400d  ! 4: SRL_R	srl 	%r5, %r13, %r25
thr3_nuke_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_383), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa3a2efa  ! 4: XNOR_I	xnor 	%r8, 0x0efa, %r21
	.word 0xb039e93e  ! 4: XNOR_I	xnor 	%r7, 0x093e, %r24
	.word 0xad31d00d  ! 4: SRLX_R	srlx	%r7, %r13, %r22
	.word 0xbb31400b  ! 4: SRL_R	srl 	%r5, %r11, %r29
	.word 0xb528f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r26
	.word 0xbb28900c  ! 4: SLLX_R	sllx	%r2, %r12, %r29
thr3_resum_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_383), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb28d00c  ! 4: SLLX_R	sllx	%r3, %r12, %r29
thr3_hw_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_384), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa422e01  ! 4: ADDC_I	addc 	%r8, 0x0e01, %r21
	.word 0xb088a05c  ! 4: ANDcc_I	andcc 	%r2, 0x005c, %r24
	.word 0xb898a068  ! 4: XORcc_I	xorcc 	%r2, 0x0068, %r28
	.word 0xb731400b  ! 4: SRL_R	srl 	%r5, %r11, %r27
	.word 0xb431a51e  ! 4: ORN_I	orn 	%r6, 0x051e, %r26
	.word 0xb2c1ad26  ! 4: ADDCcc_I	addccc 	%r6, 0x0d26, %r25
thr3_nuke_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_385), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb28900c  ! 4: SLLX_R	sllx	%r2, %r12, %r29
	.word 0xb529b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r26
	.word 0xb779a401  ! 4: MOVR_I	move	%r6, 0x1, %r27
	.word 0xb230e4cf  ! 4: ORN_I	orn 	%r3, 0x04cf, %r25
	.word 0xb7297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r27
thr3_resum_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_385), 16, 16)) -> intp(1, 3, 1)
	.word 0xb3317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r25
	.word 0xae8a000d  ! 4: ANDcc_R	andcc 	%r8, %r13, %r23
	.word 0xac40adac  ! 4: ADDC_I	addc 	%r2, 0x0dac, %r22
thr3_hw_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_386), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8a8c00a  ! 4: ANDNcc_R	andncc 	%r3, %r10, %r28
	.word 0xb929b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r28
	.word 0xa978a401  ! 4: MOVR_I	move	%r2, 0x1, %r20
	.word 0xbd392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r30
	.word 0xae28a96e  ! 4: ANDN_I	andn 	%r2, 0x096e, %r23
	.word 0xab317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r21
thr3_hw_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_387), 16, 16)) -> intp(1, 0, 1)
	.word 0xb489c00c  ! 4: ANDcc_R	andcc 	%r7, %r12, %r26
	.word 0xb6ba2290  ! 4: XNORcc_I	xnorcc 	%r8, 0x0290, %r27
	.word 0xaf39400f  ! 4: SRA_R	sra 	%r5, %r15, %r23
	.word 0xbd39c00a  ! 4: SRA_R	sra 	%r7, %r10, %r30
	.word 0xb339400b  ! 4: SRA_R	sra 	%r5, %r11, %r25
	.word 0xbc31000f  ! 4: ORN_R	orn 	%r4, %r15, %r30
thr3_nuke_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_388), 16, 16)) -> intp(1, 2, 1)
	.word 0xac422971  ! 4: ADDC_I	addc 	%r8, 0x0971, %r22
	.word 0xb4a8aed0  ! 4: ANDNcc_I	andncc 	%r2, 0x0ed0, %r26
	.word 0xaa09acca  ! 4: AND_I	and 	%r6, 0x0cca, %r21
	.word 0xa93a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r20
thr3_resum_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_388), 16, 16)) -> intp(1, 3, 1)
	.word 0xac0a2efc  ! 4: AND_I	and 	%r8, 0x0efc, %r22
	.word 0xa8316528  ! 4: ORN_I	orn 	%r5, 0x0528, %r20
thr3_nuke_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_389), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb31900d  ! 4: SRLX_R	srlx	%r6, %r13, %r29
	.word 0xa880ec87  ! 4: ADDcc_I	addcc 	%r3, 0x0c87, %r20
	.word 0xab2a000f  ! 4: SLL_R	sll 	%r8, %r15, %r21
thr3_resum_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_389), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa08e3ba  ! 4: AND_I	and 	%r3, 0x03ba, %r21
	.word 0xba40a1cc  ! 4: ADDC_I	addc 	%r2, 0x01cc, %r29
	.word 0xbc80800e  ! 4: ADDcc_R	addcc 	%r2, %r14, %r30
	.word 0xb2822f93  ! 4: ADDcc_I	addcc 	%r8, 0x0f93, %r25
thr3_nuke_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_390), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2196ddc  ! 4: XOR_I	xor 	%r5, 0x0ddc, %r25
thr3_resum_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_390), 16, 16)) -> intp(0, 3, 1)
	.word 0xb089400f  ! 4: ANDcc_R	andcc 	%r5, %r15, %r24
	.word 0xb0c0e893  ! 4: ADDCcc_I	addccc 	%r3, 0x0893, %r24
	.word 0xa89a000c  ! 4: XORcc_R	xorcc 	%r8, %r12, %r20
	.word 0xaa08c00c  ! 4: AND_R	and 	%r3, %r12, %r21
thr3_hw_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_391), 16, 16)) -> intp(0, 0, 1)
	.word 0xb891800f  ! 4: ORcc_R	orcc 	%r6, %r15, %r28
	.word 0xb401e551  ! 4: ADD_I	add 	%r7, 0x0551, %r26
	.word 0xb8b12181  ! 4: ORNcc_I	orncc 	%r4, 0x0181, %r28
	.word 0xb931100f  ! 4: SRLX_R	srlx	%r4, %r15, %r28
	.word 0xbc31aafd  ! 4: ORN_I	orn 	%r6, 0x0afd, %r30
	.word 0xaeb2000b  ! 4: ORNcc_R	orncc 	%r8, %r11, %r23
	.word 0xb0c0a6cc  ! 4: ADDCcc_I	addccc 	%r2, 0x06cc, %r24
thr3_hw_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_392), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf79840f  ! 4: MOVR_R	move	%r6, %r15, %r23
	.word 0xa839000d  ! 4: XNOR_R	xnor 	%r4, %r13, %r20
	.word 0xbd38c00e  ! 4: SRA_R	sra 	%r3, %r14, %r30
	.word 0xb631400d  ! 4: ORN_R	orn 	%r5, %r13, %r27
	.word 0xae2a2efd  ! 4: ANDN_I	andn 	%r8, 0x0efd, %r23
	.word 0xaac2000b  ! 4: ADDCcc_R	addccc 	%r8, %r11, %r21
thr3_hw_intr_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_393), 16, 16)) -> intp(1, 0, 1)
	.word 0xba11ef80  ! 4: OR_I	or 	%r7, 0x0f80, %r29
	.word 0xae18c00d  ! 4: XOR_R	xor 	%r3, %r13, %r23
	.word 0xb2b0800d  ! 4: ORNcc_R	orncc 	%r2, %r13, %r25
	.word 0xba10ee75  ! 4: OR_I	or 	%r3, 0x0e75, %r29
	.word 0xb330f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r25
	.word 0xb600e0dd  ! 4: ADD_I	add 	%r3, 0x00dd, %r27
thr3_hw_intr_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_394), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa02000c  ! 4: ADD_R	add 	%r8, %r12, %r21
	.word 0xb899a087  ! 4: XORcc_I	xorcc 	%r6, 0x0087, %r28
	.word 0xbab0ea35  ! 4: ORNcc_I	orncc 	%r3, 0x0a35, %r29
	.word 0xb929400e  ! 4: SLL_R	sll 	%r5, %r14, %r28
	.word 0xaab8c00e  ! 4: XNORcc_R	xnorcc 	%r3, %r14, %r21
	.word 0xab30800b  ! 4: SRL_R	srl 	%r2, %r11, %r21
thr3_nuke_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_395), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8b1400e  ! 4: ORNcc_R	orncc 	%r5, %r14, %r20
	.word 0xb889c00f  ! 4: ANDcc_R	andcc 	%r7, %r15, %r28
thr3_resum_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_395), 16, 16)) -> intp(0, 3, 1)
	.word 0xbab8800f  ! 4: XNORcc_R	xnorcc 	%r2, %r15, %r29
thr3_nuke_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_396), 16, 16)) -> intp(1, 2, 1)
	.word 0xb891c00c  ! 4: ORcc_R	orcc 	%r7, %r12, %r28
	.word 0xbb297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r29
	.word 0xb628800a  ! 4: ANDN_R	andn 	%r2, %r10, %r27
	.word 0xa931b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r20
	.word 0xb040afc1  ! 4: ADDC_I	addc 	%r2, 0x0fc1, %r24
	.word 0xaab16451  ! 4: ORNcc_I	orncc 	%r5, 0x0451, %r21
	.word 0xa891800b  ! 4: ORcc_R	orcc 	%r6, %r11, %r20
thr3_resum_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_396), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa416e31  ! 4: ADDC_I	addc 	%r5, 0x0e31, %r21
thr3_hw_intr_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_397), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0b8c00e  ! 4: XNORcc_R	xnorcc 	%r3, %r14, %r24
	.word 0xbd29800f  ! 4: SLL_R	sll 	%r6, %r15, %r30
	.word 0xb898800c  ! 4: XORcc_R	xorcc 	%r2, %r12, %r28
	.word 0xa8b8ea5b  ! 4: XNORcc_I	xnorcc 	%r3, 0x0a5b, %r20
	.word 0xbc98800d  ! 4: XORcc_R	xorcc 	%r2, %r13, %r30
	.word 0xb0b2000e  ! 4: ORNcc_R	orncc 	%r8, %r14, %r24
thr3_hw_intr_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_398), 16, 16)) -> intp(1, 0, 1)
	.word 0xb80a000b  ! 4: AND_R	and 	%r8, %r11, %r28
	.word 0xacb1000b  ! 4: ORNcc_R	orncc 	%r4, %r11, %r22
	.word 0xb52a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r26
	.word 0xb2b1400e  ! 4: ORNcc_R	orncc 	%r5, %r14, %r25
	.word 0xb939d00d  ! 4: SRAX_R	srax	%r7, %r13, %r28
	.word 0xbcb9e308  ! 4: XNORcc_I	xnorcc 	%r7, 0x0308, %r30
	.word 0xb131500c  ! 4: SRLX_R	srlx	%r5, %r12, %r24
thr3_hw_intr_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_399), 16, 16)) -> intp(0, 0, 1)
	.word 0xb72a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0xa880c00d  ! 4: ADDcc_R	addcc 	%r3, %r13, %r20
	.word 0xb081400a  ! 4: ADDcc_R	addcc 	%r5, %r10, %r24
	.word 0xb608ecfd  ! 4: AND_I	and 	%r3, 0x0cfd, %r27
	.word 0xad28800d  ! 4: SLL_R	sll 	%r2, %r13, %r22
	.word 0xb809400a  ! 4: AND_R	and 	%r5, %r10, %r28
thr3_nuke_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_400), 16, 16)) -> intp(1, 2, 1)
	.word 0xb579a401  ! 4: MOVR_I	move	%r6, 0xa, %r26
	.word 0xaa01400c  ! 4: ADD_R	add 	%r5, %r12, %r21
	.word 0xb9297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r28
	.word 0xae98e832  ! 4: XORcc_I	xorcc 	%r3, 0x0832, %r23
	.word 0xb409ee2f  ! 4: AND_I	and 	%r7, 0x0e2f, %r26
	.word 0xa931c00d  ! 4: SRL_R	srl 	%r7, %r13, %r20
thr3_resum_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_400), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa89ebfa  ! 4: ANDcc_I	andcc 	%r7, 0x0bfa, %r21
	.word 0xbd28b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r30
thr3_hw_intr_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_401), 16, 16)) -> intp(1, 0, 1)
	.word 0xb200800f  ! 4: ADD_R	add 	%r2, %r15, %r25
	.word 0xb039400c  ! 4: XNOR_R	xnor 	%r5, %r12, %r24
	.word 0xba39000a  ! 4: XNOR_R	xnor 	%r4, %r10, %r29
	.word 0xb808800d  ! 4: AND_R	and 	%r2, %r13, %r28
	.word 0xacb0e1a3  ! 4: ORNcc_I	orncc 	%r3, 0x01a3, %r22
	.word 0xb20a202f  ! 4: AND_I	and 	%r8, 0x002f, %r25
thr3_nuke_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_402), 16, 16)) -> intp(1, 2, 1)
	.word 0xb364180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb241400f  ! 4: ADDC_R	addc 	%r5, %r15, %r25
	.word 0xb379440a  ! 4: MOVR_R	move	%r5, %r10, %r25
	.word 0xbc29000c  ! 4: ANDN_R	andn 	%r4, %r12, %r30
	.word 0xb4b9c00f  ! 4: XNORcc_R	xnorcc 	%r7, %r15, %r26
	.word 0xb72a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0xa891800b  ! 4: ORcc_R	orcc 	%r6, %r11, %r20
thr3_resum_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_402), 16, 16)) -> intp(1, 3, 1)
	.word 0xaca9ab6a  ! 4: ANDNcc_I	andncc 	%r6, 0x0b6a, %r22
	.word 0xa832000f  ! 4: ORN_R	orn 	%r8, %r15, %r20
thr3_hw_intr_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_403), 16, 16)) -> intp(0, 0, 1)
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbab9a08c  ! 4: XNORcc_I	xnorcc 	%r6, 0x008c, %r29
	.word 0xbca8edbf  ! 4: ANDNcc_I	andncc 	%r3, 0x0dbf, %r30
	.word 0xb2c1c00e  ! 4: ADDCcc_R	addccc 	%r7, %r14, %r25
	.word 0xa808ec25  ! 4: AND_I	and 	%r3, 0x0c25, %r20
	.word 0xbc08a485  ! 4: AND_I	and 	%r2, 0x0485, %r30
thr3_nuke_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_404), 16, 16)) -> intp(1, 2, 1)
	.word 0xa800eab3  ! 4: ADD_I	add 	%r3, 0x0ab3, %r20
	.word 0xb681a797  ! 4: ADDcc_I	addcc 	%r6, 0x0797, %r27
	.word 0xbc992dc7  ! 4: XORcc_I	xorcc 	%r4, 0x0dc7, %r30
	.word 0xb2c1c00c  ! 4: ADDCcc_R	addccc 	%r7, %r12, %r25
	.word 0xad30900c  ! 4: SRLX_R	srlx	%r2, %r12, %r22
thr3_resum_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_404), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf32100c  ! 4: SRLX_R	srlx	%r8, %r12, %r23
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xac89000c  ! 4: ANDcc_R	andcc 	%r4, %r12, %r22
	.word 0xb081400e  ! 4: ADDcc_R	addcc 	%r5, %r14, %r24
thr3_nuke_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_405), 16, 16)) -> intp(0, 2, 1)
	.word 0xae01800f  ! 4: ADD_R	add 	%r6, %r15, %r23
	.word 0xa839000f  ! 4: XNOR_R	xnor 	%r4, %r15, %r20
	.word 0xbb38d00e  ! 4: SRAX_R	srax	%r3, %r14, %r29
	.word 0xb7392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r27
	.word 0xab64180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa840eca5  ! 4: ADDC_I	addc 	%r3, 0x0ca5, %r20
	.word 0xaca9a326  ! 4: ANDNcc_I	andncc 	%r6, 0x0326, %r22
thr3_resum_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_405), 16, 16)) -> intp(0, 3, 1)
	.word 0xba10e928  ! 4: OR_I	or 	%r3, 0x0928, %r29
	.word 0xbd3a100e  ! 4: SRAX_R	srax	%r8, %r14, %r30
	.word 0xb0b1000d  ! 4: ORNcc_R	orncc 	%r4, %r13, %r24
	.word 0xb811000a  ! 4: OR_R	or 	%r4, %r10, %r28
thr3_hw_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_406), 16, 16)) -> intp(0, 0, 1)
	.word 0xb028800b  ! 4: ANDN_R	andn 	%r2, %r11, %r24
	.word 0xaac0ec40  ! 4: ADDCcc_I	addccc 	%r3, 0x0c40, %r21
	.word 0xba31c00c  ! 4: ORN_R	orn 	%r7, %r12, %r29
	.word 0xa8012905  ! 4: ADD_I	add 	%r4, 0x0905, %r20
	.word 0xb729b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r27
	.word 0xbb396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r29
	.word 0xaa29400e  ! 4: ANDN_R	andn 	%r5, %r14, %r21
thr3_nuke_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_407), 16, 16)) -> intp(1, 2, 1)
	.word 0xb291800f  ! 4: ORcc_R	orcc 	%r6, %r15, %r25
	.word 0xb939e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r28
thr3_resum_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_407), 16, 16)) -> intp(1, 3, 1)
	.word 0xb931900b  ! 4: SRLX_R	srlx	%r6, %r11, %r28
	.word 0xb231c00d  ! 4: ORN_R	orn 	%r7, %r13, %r25
	.word 0xac01000a  ! 4: ADD_R	add 	%r4, %r10, %r22
thr3_nuke_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_408), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8b1000e  ! 4: ORNcc_R	orncc 	%r4, %r14, %r20
	.word 0xb2c1e58f  ! 4: ADDCcc_I	addccc 	%r7, 0x058f, %r25
	.word 0xba19800f  ! 4: XOR_R	xor 	%r6, %r15, %r29
	.word 0xba40800c  ! 4: ADDC_R	addc 	%r2, %r12, %r29
	.word 0xac8a244d  ! 4: ANDcc_I	andcc 	%r8, 0x044d, %r22
	.word 0xb800ee4a  ! 4: ADD_I	add 	%r3, 0x0e4a, %r28
	.word 0xb290800b  ! 4: ORcc_R	orcc 	%r2, %r11, %r25
thr3_resum_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_408), 16, 16)) -> intp(0, 3, 1)
	.word 0xb938c00b  ! 4: SRA_R	sra 	%r3, %r11, %r28
	.word 0xb73a100d  ! 4: SRAX_R	srax	%r8, %r13, %r27
	.word 0xad38800d  ! 4: SRA_R	sra 	%r2, %r13, %r22
thr3_hw_intr_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_409), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2b9a624  ! 4: XNORcc_I	xnorcc 	%r6, 0x0624, %r25
	.word 0xaec0800c  ! 4: ADDCcc_R	addccc 	%r2, %r12, %r23
	.word 0xacc0800b  ! 4: ADDCcc_R	addccc 	%r2, %r11, %r22
	.word 0xb8a9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r28
	.word 0xa881c00c  ! 4: ADDcc_R	addcc 	%r7, %r12, %r20
	.word 0xbcb8800d  ! 4: XNORcc_R	xnorcc 	%r2, %r13, %r30
	.word 0xb5396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r26
thr3_nuke_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_410), 16, 16)) -> intp(0, 2, 1)
	.word 0xad322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r22
	.word 0xb0b96b6e  ! 4: XNORcc_I	xnorcc 	%r5, 0x0b6e, %r24
	.word 0xb498800b  ! 4: XORcc_R	xorcc 	%r2, %r11, %r26
	.word 0xb699ace3  ! 4: XORcc_I	xorcc 	%r6, 0x0ce3, %r27
	.word 0xacb0a471  ! 4: ORNcc_I	orncc 	%r2, 0x0471, %r22
thr3_resum_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_410), 16, 16)) -> intp(0, 3, 1)
	.word 0xac11c00c  ! 4: OR_R	or 	%r7, %r12, %r22
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbb31500a  ! 4: SRLX_R	srlx	%r5, %r10, %r29
thr3_hw_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_411), 16, 16)) -> intp(1, 0, 1)
	.word 0xbc28800f  ! 4: ANDN_R	andn 	%r2, %r15, %r30
	.word 0xb039400b  ! 4: XNOR_R	xnor 	%r5, %r11, %r24
	.word 0xb32a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r25
	.word 0xbc892f6c  ! 4: ANDcc_I	andcc 	%r4, 0x0f6c, %r30
	.word 0xb088e7eb  ! 4: ANDcc_I	andcc 	%r3, 0x07eb, %r24
	.word 0xaa3a000f  ! 4: XNOR_R	xnor 	%r8, %r15, %r21
	.word 0xbab22634  ! 4: ORNcc_I	orncc 	%r8, 0x0634, %r29
thr3_hw_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_412), 16, 16)) -> intp(0, 0, 1)
	.word 0xae40a72e  ! 4: ADDC_I	addc 	%r2, 0x072e, %r23
	.word 0xb4b9c00f  ! 4: XNORcc_R	xnorcc 	%r7, %r15, %r26
	.word 0xbd28b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r30
	.word 0xbc89400d  ! 4: ANDcc_R	andcc 	%r5, %r13, %r30
	.word 0xb038e00b  ! 4: XNOR_I	xnor 	%r3, 0x000b, %r24
	.word 0xae41e42c  ! 4: ADDC_I	addc 	%r7, 0x042c, %r23
thr3_hw_intr_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_413), 16, 16)) -> intp(1, 0, 1)
	.word 0xbac0c00f  ! 4: ADDCcc_R	addccc 	%r3, %r15, %r29
	.word 0xb8a8a08c  ! 4: ANDNcc_I	andncc 	%r2, 0x008c, %r28
	.word 0xb008c00b  ! 4: AND_R	and 	%r3, %r11, %r24
	.word 0xbc39800c  ! 4: XNOR_R	xnor 	%r6, %r12, %r30
	.word 0xb12a000e  ! 4: SLL_R	sll 	%r8, %r14, %r24
	.word 0xb3316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r25
thr3_hw_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_414), 16, 16)) -> intp(0, 0, 1)
	.word 0xb930c00b  ! 4: SRL_R	srl 	%r3, %r11, %r28
	.word 0xba31800b  ! 4: ORN_R	orn 	%r6, %r11, %r29
	.word 0xb290800a  ! 4: ORcc_R	orcc 	%r2, %r10, %r25
	.word 0xaf316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r23
	.word 0xb041400e  ! 4: ADDC_R	addc 	%r5, %r14, %r24
	.word 0xb931800c  ! 4: SRL_R	srl 	%r6, %r12, %r28
	.word 0xb009e086  ! 4: AND_I	and 	%r7, 0x0086, %r24
thr3_hw_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_415), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf31000b  ! 4: SRL_R	srl 	%r4, %r11, %r23
	.word 0xac28e30e  ! 4: ANDN_I	andn 	%r3, 0x030e, %r22
	.word 0xb2196863  ! 4: XOR_I	xor 	%r5, 0x0863, %r25
	.word 0xad3a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r22
	.word 0xae2a2faa  ! 4: ANDN_I	andn 	%r8, 0x0faa, %r23
	.word 0xae116555  ! 4: OR_I	or 	%r5, 0x0555, %r23
	.word 0xaaa9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r21
thr3_hw_intr_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_416), 16, 16)) -> intp(1, 0, 1)
	.word 0xb411c00c  ! 4: OR_R	or 	%r7, %r12, %r26
	.word 0xb630c00d  ! 4: ORN_R	orn 	%r3, %r13, %r27
	.word 0xab796401  ! 4: MOVR_I	move	%r5, 0xd, %r21
	.word 0xab316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r21
	.word 0xb2192969  ! 4: XOR_I	xor 	%r4, 0x0969, %r25
	.word 0xb379e401  ! 4: MOVR_I	move	%r7, 0x969, %r25
	.word 0xb099a8a5  ! 4: XORcc_I	xorcc 	%r6, 0x08a5, %r24
thr3_nuke_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_417), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6a9afbc  ! 4: ANDNcc_I	andncc 	%r6, 0x0fbc, %r27
	.word 0xb8396b5f  ! 4: XNOR_I	xnor 	%r5, 0x0b5f, %r28
	.word 0xac1223c7  ! 4: OR_I	or 	%r8, 0x03c7, %r22
thr3_resum_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_417), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0c0800c  ! 4: ADDCcc_R	addccc 	%r2, %r12, %r24
	.word 0xb239000b  ! 4: XNOR_R	xnor 	%r4, %r11, %r25
	.word 0xb29a000a  ! 4: XORcc_R	xorcc 	%r8, %r10, %r25
thr3_nuke_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_418), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc41c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r30
	.word 0xb481a439  ! 4: ADDcc_I	addcc 	%r6, 0x0439, %r26
thr3_resum_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_418), 16, 16)) -> intp(1, 3, 1)
	.word 0xbcb2000f  ! 4: ORNcc_R	orncc 	%r8, %r15, %r30
	.word 0xb838ec01  ! 4: XNOR_I	xnor 	%r3, 0x0c01, %r28
	.word 0xb0392408  ! 4: XNOR_I	xnor 	%r4, 0x0408, %r24
	.word 0xb0422939  ! 4: ADDC_I	addc 	%r8, 0x0939, %r24
thr3_hw_intr_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_419), 16, 16)) -> intp(0, 0, 1)
	.word 0xbd39100d  ! 4: SRAX_R	srax	%r4, %r13, %r30
	.word 0xbc29400c  ! 4: ANDN_R	andn 	%r5, %r12, %r30
	.word 0xaa0168d9  ! 4: ADD_I	add 	%r5, 0x08d9, %r21
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb8a96c19  ! 4: ANDNcc_I	andncc 	%r5, 0x0c19, %r28
	.word 0xbc41000a  ! 4: ADDC_R	addc 	%r4, %r10, %r30
	.word 0xad31000e  ! 4: SRL_R	srl 	%r4, %r14, %r22
thr3_hw_intr_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_420), 16, 16)) -> intp(1, 0, 1)
	.word 0xaaa9e5ac  ! 4: ANDNcc_I	andncc 	%r7, 0x05ac, %r21
	.word 0xaec12ae0  ! 4: ADDCcc_I	addccc 	%r4, 0x0ae0, %r23
	.word 0xaeb0800b  ! 4: ORNcc_R	orncc 	%r2, %r11, %r23
	.word 0xba31ec71  ! 4: ORN_I	orn 	%r7, 0x0c71, %r29
	.word 0xa8b9e0f0  ! 4: XNORcc_I	xnorcc 	%r7, 0x00f0, %r20
	.word 0xb229648b  ! 4: ANDN_I	andn 	%r5, 0x048b, %r25
	.word 0xb0a8a5bc  ! 4: ANDNcc_I	andncc 	%r2, 0x05bc, %r24
thr3_hw_intr_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_421), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb31000f  ! 4: SRL_R	srl 	%r4, %r15, %r29
	.word 0xba98efa9  ! 4: XORcc_I	xorcc 	%r3, 0x0fa9, %r29
	.word 0xb438aa06  ! 4: XNOR_I	xnor 	%r2, 0x0a06, %r26
	.word 0xad31800f  ! 4: SRL_R	srl 	%r6, %r15, %r22
	.word 0xac0a2947  ! 4: AND_I	and 	%r8, 0x0947, %r22
	.word 0xb928800a  ! 4: SLL_R	sll 	%r2, %r10, %r28
	.word 0xa932000a  ! 4: SRL_R	srl 	%r8, %r10, %r20
thr3_nuke_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_422), 16, 16)) -> intp(1, 2, 1)
	.word 0xb528d00c  ! 4: SLLX_R	sllx	%r3, %r12, %r26
	.word 0xaa81eb3e  ! 4: ADDcc_I	addcc 	%r7, 0x0b3e, %r21
	.word 0xbc88a8a4  ! 4: ANDcc_I	andcc 	%r2, 0x08a4, %r30
	.word 0xaab96adb  ! 4: XNORcc_I	xnorcc 	%r5, 0x0adb, %r21
	.word 0xbd3a100d  ! 4: SRAX_R	srax	%r8, %r13, %r30
	.word 0xb0412692  ! 4: ADDC_I	addc 	%r4, 0x0692, %r24
	.word 0xb431000a  ! 4: ORN_R	orn 	%r4, %r10, %r26
thr3_resum_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_422), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa99400d  ! 4: XORcc_R	xorcc 	%r5, %r13, %r21
	.word 0xb1796401  ! 4: MOVR_I	move	%r5, 0xd, %r24
	.word 0xb480c00b  ! 4: ADDcc_R	addcc 	%r3, %r11, %r26
	.word 0xbd39c00b  ! 4: SRA_R	sra 	%r7, %r11, %r30
thr3_hw_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_423), 16, 16)) -> intp(0, 0, 1)
	.word 0xaab0eaa8  ! 4: ORNcc_I	orncc 	%r3, 0x0aa8, %r21
	.word 0xa8292319  ! 4: ANDN_I	andn 	%r4, 0x0319, %r20
	.word 0xb139900c  ! 4: SRAX_R	srax	%r6, %r12, %r24
	.word 0xac88eb8c  ! 4: ANDcc_I	andcc 	%r3, 0x0b8c, %r22
	.word 0xb60a29b1  ! 4: AND_I	and 	%r8, 0x09b1, %r27
	.word 0xb832000c  ! 4: ORN_R	orn 	%r8, %r12, %r28
thr3_nuke_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_424), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc09e36c  ! 4: AND_I	and 	%r7, 0x036c, %r30
	.word 0xb419800b  ! 4: XOR_R	xor 	%r6, %r11, %r26
	.word 0xb131d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r24
	.word 0xaf29f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r23
	.word 0xbb29000c  ! 4: SLL_R	sll 	%r4, %r12, %r29
	.word 0xb979e401  ! 4: MOVR_I	move	%r7, 0xc, %r28
thr3_resum_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_424), 16, 16)) -> intp(0, 3, 1)
	.word 0xb7316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r27
	.word 0xa931f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r20
	.word 0xb89a2151  ! 4: XORcc_I	xorcc 	%r8, 0x0151, %r28
thr3_hw_intr_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_425), 16, 16)) -> intp(0, 0, 1)
	.word 0xa881400c  ! 4: ADDcc_R	addcc 	%r5, %r12, %r20
	.word 0xae98a290  ! 4: XORcc_I	xorcc 	%r2, 0x0290, %r23
	.word 0xbd2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r30
	.word 0xb488c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r26
	.word 0xb129500d  ! 4: SLLX_R	sllx	%r5, %r13, %r24
	.word 0xb09a000d  ! 4: XORcc_R	xorcc 	%r8, %r13, %r24
	.word 0xb529800b  ! 4: SLL_R	sll 	%r6, %r11, %r26
thr3_nuke_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_426), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb30c00e  ! 4: SRL_R	srl 	%r3, %r14, %r29
thr3_resum_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_426), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b0a21f  ! 4: ORNcc_I	orncc 	%r2, 0x021f, %r24
	.word 0xba29c00a  ! 4: ANDN_R	andn 	%r7, %r10, %r29
	.word 0xa891eac7  ! 4: ORcc_I	orcc 	%r7, 0x0ac7, %r20
thr3_hw_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_427), 16, 16)) -> intp(1, 0, 1)
	.word 0xb229000f  ! 4: ANDN_R	andn 	%r4, %r15, %r25
	.word 0xb698e4d8  ! 4: XORcc_I	xorcc 	%r3, 0x04d8, %r27
	.word 0xbab2000b  ! 4: ORNcc_R	orncc 	%r8, %r11, %r29
	.word 0xa891a445  ! 4: ORcc_I	orcc 	%r6, 0x0445, %r20
	.word 0xb329900c  ! 4: SLLX_R	sllx	%r6, %r12, %r25
	.word 0xac10c00d  ! 4: OR_R	or 	%r3, %r13, %r22
thr3_hw_intr_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_428), 16, 16)) -> intp(0, 0, 1)
	.word 0xae38800a  ! 4: XNOR_R	xnor 	%r2, %r10, %r23
	.word 0xb010acf7  ! 4: OR_I	or 	%r2, 0x0cf7, %r24
	.word 0xbc89a08b  ! 4: ANDcc_I	andcc 	%r6, 0x008b, %r30
	.word 0xb331000a  ! 4: SRL_R	srl 	%r4, %r10, %r25
	.word 0xaa30e815  ! 4: ORN_I	orn 	%r3, 0x0815, %r21
	.word 0xa811400a  ! 4: OR_R	or 	%r5, %r10, %r20
thr3_nuke_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_429), 16, 16)) -> intp(1, 2, 1)
	.word 0xacaa224c  ! 4: ANDNcc_I	andncc 	%r8, 0x024c, %r22
	.word 0xb164180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xac81a969  ! 4: ADDcc_I	addcc 	%r6, 0x0969, %r22
thr3_resum_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_429), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc00ec7e  ! 4: ADD_I	add 	%r3, 0x0c7e, %r30
	.word 0xbb39d00b  ! 4: SRAX_R	srax	%r7, %r11, %r29
	.word 0xaf31800f  ! 4: SRL_R	srl 	%r6, %r15, %r23
	.word 0xbb39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r29
thr3_hw_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_430), 16, 16)) -> intp(1, 0, 1)
	.word 0xa9293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r20
	.word 0xae42000a  ! 4: ADDC_R	addc 	%r8, %r10, %r23
	.word 0xbc30e5eb  ! 4: ORN_I	orn 	%r3, 0x05eb, %r30
	.word 0xab38900b  ! 4: SRAX_R	srax	%r2, %r11, %r21
	.word 0xb080800d  ! 4: ADDcc_R	addcc 	%r2, %r13, %r24
	.word 0xad28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r22
	.word 0xaf29900f  ! 4: SLLX_R	sllx	%r6, %r15, %r23
thr3_hw_intr_431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_431), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb29400f  ! 4: SLL_R	sll 	%r5, %r15, %r29
	.word 0xbd313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r30
	.word 0xae0a000d  ! 4: AND_R	and 	%r8, %r13, %r23
	.word 0xb128f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r24
	.word 0xb738c00b  ! 4: SRA_R	sra 	%r3, %r11, %r27
	.word 0xb480800d  ! 4: ADDcc_R	addcc 	%r2, %r13, %r26
	.word 0xb690c00e  ! 4: ORcc_R	orcc 	%r3, %r14, %r27
thr3_nuke_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_432), 16, 16)) -> intp(0, 2, 1)
	.word 0xb7317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r27
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xab31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r21
	.word 0xac18800b  ! 4: XOR_R	xor 	%r2, %r11, %r22
	.word 0xaeb12b5d  ! 4: ORNcc_I	orncc 	%r4, 0x0b5d, %r23
	.word 0xaf39400e  ! 4: SRA_R	sra 	%r5, %r14, %r23
thr3_resum_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_432), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa996f72  ! 4: XORcc_I	xorcc 	%r5, 0x0f72, %r21
thr3_nuke_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_433), 16, 16)) -> intp(1, 2, 1)
	.word 0xa932000c  ! 4: SRL_R	srl 	%r8, %r12, %r20
	.word 0xaa2926c3  ! 4: ANDN_I	andn 	%r4, 0x06c3, %r21
thr3_resum_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_433), 16, 16)) -> intp(1, 3, 1)
	.word 0xb729100c  ! 4: SLLX_R	sllx	%r4, %r12, %r27
thr3_nuke_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_434), 16, 16)) -> intp(1, 2, 1)
	.word 0xacc123a4  ! 4: ADDCcc_I	addccc 	%r4, 0x03a4, %r22
	.word 0xae91400a  ! 4: ORcc_R	orcc 	%r5, %r10, %r23
	.word 0xab396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r21
	.word 0xaf39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r23
	.word 0xb8a9400b  ! 4: ANDNcc_R	andncc 	%r5, %r11, %r28
	.word 0xbd64180f  ! 4: MOVcc_R	<illegal instruction>
thr3_resum_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_434), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa196c5c  ! 4: XOR_I	xor 	%r5, 0x0c5c, %r21
	.word 0xae11400d  ! 4: OR_R	or 	%r5, %r13, %r23
	.word 0xae09ad4b  ! 4: AND_I	and 	%r6, 0x0d4b, %r23
	.word 0xaf39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r23
thr3_nuke_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_435), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4a8afda  ! 4: ANDNcc_I	andncc 	%r2, 0x0fda, %r26
	.word 0xb738900a  ! 4: SRAX_R	srax	%r2, %r10, %r27
	.word 0xb888a8af  ! 4: ANDcc_I	andcc 	%r2, 0x08af, %r28
	.word 0xb839e9e9  ! 4: XNOR_I	xnor 	%r7, 0x09e9, %r28
	.word 0xb929900c  ! 4: SLLX_R	sllx	%r6, %r12, %r28
	.word 0xa979440e  ! 4: MOVR_R	move	%r5, %r14, %r20
thr3_resum_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_435), 16, 16)) -> intp(0, 3, 1)
	.word 0xab39500c  ! 4: SRAX_R	srax	%r5, %r12, %r21
thr3_nuke_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_436), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4112f97  ! 4: OR_I	or 	%r4, 0x0f97, %r26
	.word 0xba992249  ! 4: XORcc_I	xorcc 	%r4, 0x0249, %r29
thr3_resum_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_436), 16, 16)) -> intp(0, 3, 1)
	.word 0xa928d00d  ! 4: SLLX_R	sllx	%r3, %r13, %r20
thr3_nuke_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_437), 16, 16)) -> intp(0, 2, 1)
	.word 0xa82a2cf1  ! 4: ANDN_I	andn 	%r8, 0x0cf1, %r20
	.word 0xa9322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r20
	.word 0xb33a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r25
	.word 0xa898c00b  ! 4: XORcc_R	xorcc 	%r3, %r11, %r20
thr3_resum_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_437), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8b8800a  ! 4: XNORcc_R	xnorcc 	%r2, %r10, %r20
	.word 0xb282258e  ! 4: ADDcc_I	addcc 	%r8, 0x058e, %r25
	.word 0xad64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb729800d  ! 4: SLL_R	sll 	%r6, %r13, %r27
thr3_nuke_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_438), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8a9e5b3  ! 4: ANDNcc_I	andncc 	%r7, 0x05b3, %r20
	.word 0xad64180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbc80a3d2  ! 4: ADDcc_I	addcc 	%r2, 0x03d2, %r30
	.word 0xaac1ad16  ! 4: ADDCcc_I	addccc 	%r6, 0x0d16, %r21
	.word 0xb2416b88  ! 4: ADDC_I	addc 	%r5, 0x0b88, %r25
	.word 0xb8b221e6  ! 4: ORNcc_I	orncc 	%r8, 0x01e6, %r28
thr3_resum_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_438), 16, 16)) -> intp(0, 3, 1)
	.word 0xb631ac9d  ! 4: ORN_I	orn 	%r6, 0x0c9d, %r27
	.word 0xae1a2de2  ! 4: XOR_I	xor 	%r8, 0x0de2, %r23
thr3_nuke_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_439), 16, 16)) -> intp(1, 2, 1)
	.word 0xa88166fb  ! 4: ADDcc_I	addcc 	%r5, 0x06fb, %r20
	.word 0xb808800f  ! 4: AND_R	and 	%r2, %r15, %r28
	.word 0xb0922564  ! 4: ORcc_I	orcc 	%r8, 0x0564, %r24
	.word 0xbb2a000d  ! 4: SLL_R	sll 	%r8, %r13, %r29
	.word 0xad30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r22
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
thr3_resum_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_439), 16, 16)) -> intp(1, 3, 1)
	.word 0xb041eecf  ! 4: ADDC_I	addc 	%r7, 0x0ecf, %r24
	.word 0xac38800f  ! 4: XNOR_R	xnor 	%r2, %r15, %r22
	.word 0xba01c00c  ! 4: ADD_R	add 	%r7, %r12, %r29
thr3_hw_intr_440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_440), 16, 16)) -> intp(1, 0, 1)
	.word 0xb729f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r27
	.word 0xb539d00b  ! 4: SRAX_R	srax	%r7, %r11, %r26
	.word 0xb379c40e  ! 4: MOVR_R	move	%r7, %r14, %r25
	.word 0xae10ae0a  ! 4: OR_I	or 	%r2, 0x0e0a, %r23
	.word 0xba916288  ! 4: ORcc_I	orcc 	%r5, 0x0288, %r29
	.word 0xac82284c  ! 4: ADDcc_I	addcc 	%r8, 0x084c, %r22
thr3_hw_intr_441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_441), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b9400d  ! 4: XNORcc_R	xnorcc 	%r5, %r13, %r26
	.word 0xbab9800b  ! 4: XNORcc_R	xnorcc 	%r6, %r11, %r29
	.word 0xbc022a09  ! 4: ADD_I	add 	%r8, 0x0a09, %r30
	.word 0xac91400a  ! 4: ORcc_R	orcc 	%r5, %r10, %r22
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaea92d18  ! 4: ANDNcc_I	andncc 	%r4, 0x0d18, %r23
thr3_nuke_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_442), 16, 16)) -> intp(0, 2, 1)
	.word 0xa800c00f  ! 4: ADD_R	add 	%r3, %r15, %r20
	.word 0xab28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r21
	.word 0xb539e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r26
	.word 0xae09c00d  ! 4: AND_R	and 	%r7, %r13, %r23
thr3_resum_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_442), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r30
thr3_hw_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_443), 16, 16)) -> intp(0, 0, 1)
	.word 0xb419000e  ! 4: XOR_R	xor 	%r4, %r14, %r26
	.word 0xbc39ea01  ! 4: XNOR_I	xnor 	%r7, 0x0a01, %r30
	.word 0xb691e526  ! 4: ORcc_I	orcc 	%r7, 0x0526, %r27
	.word 0xb880c00f  ! 4: ADDcc_R	addcc 	%r3, %r15, %r28
	.word 0xa964180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xacb1000b  ! 4: ORNcc_R	orncc 	%r4, %r11, %r22
thr3_hw_intr_444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_444), 16, 16)) -> intp(0, 0, 1)
	.word 0xb929000f  ! 4: SLL_R	sll 	%r4, %r15, %r28
	.word 0xad323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r22
	.word 0xbd30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r30
	.word 0xb2b0c00c  ! 4: ORNcc_R	orncc 	%r3, %r12, %r25
	.word 0xb040ef7f  ! 4: ADDC_I	addc 	%r3, 0x0f7f, %r24
	.word 0xac42000a  ! 4: ADDC_R	addc 	%r8, %r10, %r22
thr3_hw_intr_445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_445), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc08c00f  ! 4: AND_R	and 	%r3, %r15, %r30
	.word 0xb491c00f  ! 4: ORcc_R	orcc 	%r7, %r15, %r26
	.word 0xaab0c00f  ! 4: ORNcc_R	orncc 	%r3, %r15, %r21
	.word 0xb339d00a  ! 4: SRAX_R	srax	%r7, %r10, %r25
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb440c00d  ! 4: ADDC_R	addc 	%r3, %r13, %r26
thr3_hw_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_446), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0b8ecf2  ! 4: XNORcc_I	xnorcc 	%r3, 0x0cf2, %r24
	.word 0xbcb1000d  ! 4: ORNcc_R	orncc 	%r4, %r13, %r30
	.word 0xba88e02f  ! 4: ANDcc_I	andcc 	%r3, 0x002f, %r29
	.word 0xaea9400d  ! 4: ANDNcc_R	andncc 	%r5, %r13, %r23
	.word 0xb338900c  ! 4: SRAX_R	srax	%r2, %r12, %r25
	.word 0xb738c00e  ! 4: SRA_R	sra 	%r3, %r14, %r27
	.word 0xaec12796  ! 4: ADDCcc_I	addccc 	%r4, 0x0796, %r23
thr3_nuke_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_447), 16, 16)) -> intp(0, 2, 1)
	.word 0xac99400f  ! 4: XORcc_R	xorcc 	%r5, %r15, %r22
	.word 0xb09928ac  ! 4: XORcc_I	xorcc 	%r4, 0x08ac, %r24
	.word 0xb139500d  ! 4: SRAX_R	srax	%r5, %r13, %r24
	.word 0xb61960f7  ! 4: XOR_I	xor 	%r5, 0x00f7, %r27
	.word 0xb210c00f  ! 4: OR_R	or 	%r3, %r15, %r25
thr3_resum_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_447), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2b1e2f3  ! 4: ORNcc_I	orncc 	%r7, 0x02f3, %r25
	.word 0xb978e401  ! 4: MOVR_I	move	%r3, 0xfffffef3, %r28
	.word 0xb4892c77  ! 4: ANDcc_I	andcc 	%r4, 0x0c77, %r26
thr3_nuke_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_448), 16, 16)) -> intp(1, 2, 1)
	.word 0xb231ec2e  ! 4: ORN_I	orn 	%r7, 0x0c2e, %r25
	.word 0xb6a9000f  ! 4: ANDNcc_R	andncc 	%r4, %r15, %r27
	.word 0xb210800f  ! 4: OR_R	or 	%r2, %r15, %r25
	.word 0xaa01272c  ! 4: ADD_I	add 	%r4, 0x072c, %r21
	.word 0xb68a2489  ! 4: ANDcc_I	andcc 	%r8, 0x0489, %r27
	.word 0xbc19a789  ! 4: XOR_I	xor 	%r6, 0x0789, %r30
	.word 0xae28ecf5  ! 4: ANDN_I	andn 	%r3, 0x0cf5, %r23
thr3_resum_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_448), 16, 16)) -> intp(1, 3, 1)
	.word 0xb019e555  ! 4: XOR_I	xor 	%r7, 0x0555, %r24
thr3_nuke_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_449), 16, 16)) -> intp(1, 2, 1)
	.word 0xba31800e  ! 4: ORN_R	orn 	%r6, %r14, %r29
	.word 0xb13a100d  ! 4: SRAX_R	srax	%r8, %r13, %r24
	.word 0xb0c1000a  ! 4: ADDCcc_R	addccc 	%r4, %r10, %r24
thr3_resum_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_449), 16, 16)) -> intp(1, 3, 1)
	.word 0xae29e762  ! 4: ANDN_I	andn 	%r7, 0x0762, %r23
	.word 0xbc896d3d  ! 4: ANDcc_I	andcc 	%r5, 0x0d3d, %r30
thr3_nuke_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_450), 16, 16)) -> intp(0, 2, 1)
	.word 0xb73a000b  ! 4: SRA_R	sra 	%r8, %r11, %r27
	.word 0xb640e6a5  ! 4: ADDC_I	addc 	%r3, 0x06a5, %r27
	.word 0xacb8ee2c  ! 4: XNORcc_I	xnorcc 	%r3, 0x0e2c, %r22
thr3_resum_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_450), 16, 16)) -> intp(0, 3, 1)
	.word 0xb489400e  ! 4: ANDcc_R	andcc 	%r5, %r14, %r26
thr3_hw_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_451), 16, 16)) -> intp(0, 0, 1)
	.word 0xb631c00c  ! 4: ORN_R	orn 	%r7, %r12, %r27
	.word 0xb4a9400f  ! 4: ANDNcc_R	andncc 	%r5, %r15, %r26
	.word 0xbc896822  ! 4: ANDcc_I	andcc 	%r5, 0x0822, %r30
	.word 0xaa09800d  ! 4: AND_R	and 	%r6, %r13, %r21
	.word 0xb441400a  ! 4: ADDC_R	addc 	%r5, %r10, %r26
	.word 0xb530b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r26
thr3_nuke_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_452), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4a8800f  ! 4: ANDNcc_R	andncc 	%r2, %r15, %r26
	.word 0xb691800f  ! 4: ORcc_R	orcc 	%r6, %r15, %r27
	.word 0xaea92549  ! 4: ANDNcc_I	andncc 	%r4, 0x0549, %r23
	.word 0xac0a269b  ! 4: AND_I	and 	%r8, 0x069b, %r22
	.word 0xa809efb0  ! 4: AND_I	and 	%r7, 0x0fb0, %r20
	.word 0xbcba2bc1  ! 4: XNORcc_I	xnorcc 	%r8, 0x0bc1, %r30
	.word 0xb8a8800d  ! 4: ANDNcc_R	andncc 	%r2, %r13, %r28
thr3_resum_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_452), 16, 16)) -> intp(0, 3, 1)
	.word 0xbcc229e4  ! 4: ADDCcc_I	addccc 	%r8, 0x09e4, %r30
	.word 0xbc8a000f  ! 4: ANDcc_R	andcc 	%r8, %r15, %r30
	.word 0xbd29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r30
thr3_hw_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_453), 16, 16)) -> intp(1, 0, 1)
	.word 0xb201400a  ! 4: ADD_R	add 	%r5, %r10, %r25
	.word 0xab28d00f  ! 4: SLLX_R	sllx	%r3, %r15, %r21
	.word 0xac10800d  ! 4: OR_R	or 	%r2, %r13, %r22
	.word 0xb9796401  ! 4: MOVR_I	move	%r5, 0xd, %r28
	.word 0xa964180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaca8800f  ! 4: ANDNcc_R	andncc 	%r2, %r15, %r22
	.word 0xa964180a  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_454), 16, 16)) -> intp(0, 2, 1)
	.word 0xb240800c  ! 4: ADDC_R	addc 	%r2, %r12, %r25
	.word 0xad312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r22
	.word 0xa8c0800e  ! 4: ADDCcc_R	addccc 	%r2, %r14, %r20
thr3_resum_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_454), 16, 16)) -> intp(0, 3, 1)
	.word 0xb7317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r27
	.word 0xa81161f9  ! 4: OR_I	or 	%r5, 0x01f9, %r20
	.word 0xacb9000b  ! 4: XNORcc_R	xnorcc 	%r4, %r11, %r22
	.word 0xb328d00a  ! 4: SLLX_R	sllx	%r3, %r10, %r25
thr3_hw_intr_455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_455), 16, 16)) -> intp(1, 0, 1)
	.word 0xb731c00e  ! 4: SRL_R	srl 	%r7, %r14, %r27
	.word 0xb6196f3c  ! 4: XOR_I	xor 	%r5, 0x0f3c, %r27
	.word 0xae9123ab  ! 4: ORcc_I	orcc 	%r4, 0x03ab, %r23
	.word 0xab29900c  ! 4: SLLX_R	sllx	%r6, %r12, %r21
	.word 0xb43a22b1  ! 4: XNOR_I	xnor 	%r8, 0x02b1, %r26
	.word 0xba31000f  ! 4: ORN_R	orn 	%r4, %r15, %r29
thr3_nuke_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_456), 16, 16)) -> intp(1, 2, 1)
	.word 0xba4124d9  ! 4: ADDC_I	addc 	%r4, 0x04d9, %r29
	.word 0xaa18800c  ! 4: XOR_R	xor 	%r2, %r12, %r21
	.word 0xb688800b  ! 4: ANDcc_R	andcc 	%r2, %r11, %r27
	.word 0xb890c00f  ! 4: ORcc_R	orcc 	%r3, %r15, %r28
	.word 0xb819217b  ! 4: XOR_I	xor 	%r4, 0x017b, %r28
	.word 0xae2a27cb  ! 4: ANDN_I	andn 	%r8, 0x07cb, %r23
	.word 0xb2b9a4d9  ! 4: XNORcc_I	xnorcc 	%r6, 0x04d9, %r25
thr3_resum_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_456), 16, 16)) -> intp(1, 3, 1)
	.word 0xb529f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r26
thr3_nuke_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_457), 16, 16)) -> intp(0, 2, 1)
	.word 0xb208c00a  ! 4: AND_R	and 	%r3, %r10, %r25
	.word 0xb52a100f  ! 4: SLLX_R	sllx	%r8, %r15, %r26
	.word 0xae28c00b  ! 4: ANDN_R	andn 	%r3, %r11, %r23
	.word 0xad28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r22
	.word 0xac41a018  ! 4: ADDC_I	addc 	%r6, 0x0018, %r22
	.word 0xb211eb03  ! 4: OR_I	or 	%r7, 0x0b03, %r25
	.word 0xba28a092  ! 4: ANDN_I	andn 	%r2, 0x0092, %r29
thr3_resum_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_457), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd38800e  ! 4: SRA_R	sra 	%r2, %r14, %r30
	.word 0xae39800b  ! 4: XNOR_R	xnor 	%r6, %r11, %r23
	.word 0xb0c0800f  ! 4: ADDCcc_R	addccc 	%r2, %r15, %r24
thr3_hw_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_458), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa90c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r21
	.word 0xb329e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r25
	.word 0xb001400c  ! 4: ADD_R	add 	%r5, %r12, %r24
	.word 0xb488c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r26
	.word 0xbb31900e  ! 4: SRLX_R	srlx	%r6, %r14, %r29
	.word 0xb531100d  ! 4: SRLX_R	srlx	%r4, %r13, %r26
thr3_nuke_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_459), 16, 16)) -> intp(0, 2, 1)
	.word 0xae39800e  ! 4: XNOR_R	xnor 	%r6, %r14, %r23
	.word 0xa929900e  ! 4: SLLX_R	sllx	%r6, %r14, %r20
	.word 0xb0b8c00b  ! 4: XNORcc_R	xnorcc 	%r3, %r11, %r24
	.word 0xae40e4cc  ! 4: ADDC_I	addc 	%r3, 0x04cc, %r23
thr3_resum_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_459), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf31100f  ! 4: SRLX_R	srlx	%r4, %r15, %r23
	.word 0xae89c00d  ! 4: ANDcc_R	andcc 	%r7, %r13, %r23
	.word 0xbaa9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r29
	.word 0xb531000a  ! 4: SRL_R	srl 	%r4, %r10, %r26
thr3_hw_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_460), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8c1400b  ! 4: ADDCcc_R	addccc 	%r5, %r11, %r20
	.word 0xb164180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb5316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r26
	.word 0xab79440b  ! 4: MOVR_R	move	%r5, %r11, %r21
	.word 0xb328e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r25
	.word 0xb130f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r24
thr3_nuke_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_461), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4a9400c  ! 4: ANDNcc_R	andncc 	%r5, %r12, %r26
	.word 0xbcc1240d  ! 4: ADDCcc_I	addccc 	%r4, 0x040d, %r30
	.word 0xacb8800a  ! 4: XNORcc_R	xnorcc 	%r2, %r10, %r22
	.word 0xb779440d  ! 4: MOVR_R	move	%r5, %r13, %r27
thr3_resum_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_461), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa92000d  ! 4: ORcc_R	orcc 	%r8, %r13, %r21
thr3_hw_intr_462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_462), 16, 16)) -> intp(1, 0, 1)
	.word 0xae9a21b2  ! 4: XORcc_I	xorcc 	%r8, 0x01b2, %r23
	.word 0xb0116563  ! 4: OR_I	or 	%r5, 0x0563, %r24
	.word 0xa928a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r20
	.word 0xba99800c  ! 4: XORcc_R	xorcc 	%r6, %r12, %r29
	.word 0xaf31400e  ! 4: SRL_R	srl 	%r5, %r14, %r23
	.word 0xaa2a000c  ! 4: ANDN_R	andn 	%r8, %r12, %r21
thr3_nuke_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_463), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4ba000b  ! 4: XNORcc_R	xnorcc 	%r8, %r11, %r26
	.word 0xa930e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r20
	.word 0xba91ef5a  ! 4: ORcc_I	orcc 	%r7, 0x0f5a, %r29
	.word 0xa829c00f  ! 4: ANDN_R	andn 	%r7, %r15, %r20
thr3_resum_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_463), 16, 16)) -> intp(0, 3, 1)
	.word 0xaaaa000a  ! 4: ANDNcc_R	andncc 	%r8, %r10, %r21
	.word 0xb601ef66  ! 4: ADD_I	add 	%r7, 0x0f66, %r27
thr3_hw_intr_464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_464), 16, 16)) -> intp(0, 0, 1)
	.word 0xac01a5ab  ! 4: ADD_I	add 	%r6, 0x05ab, %r22
	.word 0xb731900a  ! 4: SRLX_R	srlx	%r6, %r10, %r27
	.word 0xbd64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbc92000c  ! 4: ORcc_R	orcc 	%r8, %r12, %r30
	.word 0xb2116e70  ! 4: OR_I	or 	%r5, 0x0e70, %r25
	.word 0xb090e7f7  ! 4: ORcc_I	orcc 	%r3, 0x07f7, %r24
	.word 0xbd396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r30
thr3_nuke_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_465), 16, 16)) -> intp(1, 2, 1)
	.word 0xbcb1a26e  ! 4: ORNcc_I	orncc 	%r6, 0x026e, %r30
	.word 0xb1297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r24
	.word 0xad7a040e  ! 4: MOVR_R	move	%r8, %r14, %r22
thr3_resum_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_465), 16, 16)) -> intp(1, 3, 1)
	.word 0xbd31c00d  ! 4: SRL_R	srl 	%r7, %r13, %r30
thr3_hw_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_466), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa312806  ! 4: ORN_I	orn 	%r4, 0x0806, %r21
	.word 0xb2c1000d  ! 4: ADDCcc_R	addccc 	%r4, %r13, %r25
	.word 0xb299ea95  ! 4: XORcc_I	xorcc 	%r7, 0x0a95, %r25
	.word 0xb641800a  ! 4: ADDC_R	addc 	%r6, %r10, %r27
	.word 0xbd38d00a  ! 4: SRAX_R	srax	%r3, %r10, %r30
	.word 0xa8b0e22a  ! 4: ORNcc_I	orncc 	%r3, 0x022a, %r20
thr3_hw_intr_467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_467), 16, 16)) -> intp(1, 0, 1)
	.word 0xbc19800d  ! 4: XOR_R	xor 	%r6, %r13, %r30
	.word 0xa939e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r20
	.word 0xb231800a  ! 4: ORN_R	orn 	%r6, %r10, %r25
	.word 0xaa9163a0  ! 4: ORcc_I	orcc 	%r5, 0x03a0, %r21
	.word 0xad28900b  ! 4: SLLX_R	sllx	%r2, %r11, %r22
	.word 0xb8b16e7a  ! 4: ORNcc_I	orncc 	%r5, 0x0e7a, %r28
thr3_hw_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_468), 16, 16)) -> intp(1, 0, 1)
	.word 0xba39800a  ! 4: XNOR_R	xnor 	%r6, %r10, %r29
	.word 0xbac0c00c  ! 4: ADDCcc_R	addccc 	%r3, %r12, %r29
	.word 0xac1a000a  ! 4: XOR_R	xor 	%r8, %r10, %r22
	.word 0xb490c00c  ! 4: ORcc_R	orcc 	%r3, %r12, %r26
	.word 0xb6c12c4b  ! 4: ADDCcc_I	addccc 	%r4, 0x0c4b, %r27
	.word 0xbd32100f  ! 4: SRLX_R	srlx	%r8, %r15, %r30
thr3_hw_intr_469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_469), 16, 16)) -> intp(1, 0, 1)
	.word 0xa890e190  ! 4: ORcc_I	orcc 	%r3, 0x0190, %r20
	.word 0xbcb1c00d  ! 4: ORNcc_R	orncc 	%r7, %r13, %r30
	.word 0xb731000b  ! 4: SRL_R	srl 	%r4, %r11, %r27
	.word 0xb8c1c00d  ! 4: ADDCcc_R	addccc 	%r7, %r13, %r28
	.word 0xb018800d  ! 4: XOR_R	xor 	%r2, %r13, %r24
	.word 0xb410ef87  ! 4: OR_I	or 	%r3, 0x0f87, %r26
thr3_nuke_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_470), 16, 16)) -> intp(0, 2, 1)
	.word 0xb829400d  ! 4: ANDN_R	andn 	%r5, %r13, %r28
	.word 0xb88162e0  ! 4: ADDcc_I	addcc 	%r5, 0x02e0, %r28
	.word 0xa831a527  ! 4: ORN_I	orn 	%r6, 0x0527, %r20
thr3_resum_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_470), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4b9a3ea  ! 4: XNORcc_I	xnorcc 	%r6, 0x03ea, %r26
	.word 0xba31a4ea  ! 4: ORN_I	orn 	%r6, 0x04ea, %r29
	.word 0xa819679e  ! 4: XOR_I	xor 	%r5, 0x079e, %r20
	.word 0xae0928ff  ! 4: AND_I	and 	%r4, 0x08ff, %r23
thr3_hw_intr_471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_471), 16, 16)) -> intp(1, 0, 1)
	.word 0xb8292451  ! 4: ANDN_I	andn 	%r4, 0x0451, %r28
	.word 0xba99c00a  ! 4: XORcc_R	xorcc 	%r7, %r10, %r29
	.word 0xb891a592  ! 4: ORcc_I	orcc 	%r6, 0x0592, %r28
	.word 0xba38c00a  ! 4: XNOR_R	xnor 	%r3, %r10, %r29
	.word 0xb088800e  ! 4: ANDcc_R	andcc 	%r2, %r14, %r24
	.word 0xae80c00f  ! 4: ADDcc_R	addcc 	%r3, %r15, %r23
thr3_nuke_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_472), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf38d00b  ! 4: SRAX_R	srax	%r3, %r11, %r23
	.word 0xb088eb7e  ! 4: ANDcc_I	andcc 	%r3, 0x0b7e, %r24
	.word 0xb2b96331  ! 4: XNORcc_I	xnorcc 	%r5, 0x0331, %r25
	.word 0xaa99400e  ! 4: XORcc_R	xorcc 	%r5, %r14, %r21
thr3_resum_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_472), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc08c00b  ! 4: AND_R	and 	%r3, %r11, %r30
	.word 0xb489c00b  ! 4: ANDcc_R	andcc 	%r7, %r11, %r26
thr3_hw_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_473), 16, 16)) -> intp(1, 0, 1)
	.word 0xae892c55  ! 4: ANDcc_I	andcc 	%r4, 0x0c55, %r23
	.word 0xbab9c00a  ! 4: XNORcc_R	xnorcc 	%r7, %r10, %r29
	.word 0xb530c00b  ! 4: SRL_R	srl 	%r3, %r11, %r26
	.word 0xac81a38a  ! 4: ADDcc_I	addcc 	%r6, 0x038a, %r22
	.word 0xbca8800c  ! 4: ANDNcc_R	andncc 	%r2, %r12, %r30
	.word 0xbc89800d  ! 4: ANDcc_R	andcc 	%r6, %r13, %r30
	.word 0xaeb1c00d  ! 4: ORNcc_R	orncc 	%r7, %r13, %r23
thr3_hw_intr_474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_474), 16, 16)) -> intp(0, 0, 1)
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xacb12474  ! 4: ORNcc_I	orncc 	%r4, 0x0474, %r22
	.word 0xb299e657  ! 4: XORcc_I	xorcc 	%r7, 0x0657, %r25
	.word 0xb498e9ed  ! 4: XORcc_I	xorcc 	%r3, 0x09ed, %r26
	.word 0xac38ebc8  ! 4: XNOR_I	xnor 	%r3, 0x0bc8, %r22
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbb64180d  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_475), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8b9a12d  ! 4: XNORcc_I	xnorcc 	%r6, 0x012d, %r20
	.word 0xb779a401  ! 4: MOVR_I	move	%r6, 0x12d, %r27
	.word 0xb93a100b  ! 4: SRAX_R	srax	%r8, %r11, %r28
	.word 0xa931400e  ! 4: SRL_R	srl 	%r5, %r14, %r20
thr3_resum_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_475), 16, 16)) -> intp(0, 3, 1)
	.word 0xb92a000f  ! 4: SLL_R	sll 	%r8, %r15, %r28
thr3_nuke_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_476), 16, 16)) -> intp(1, 2, 1)
	.word 0xba09400e  ! 4: AND_R	and 	%r5, %r14, %r29
	.word 0xb481a80a  ! 4: ADDcc_I	addcc 	%r6, 0x080a, %r26
	.word 0xb239000d  ! 4: XNOR_R	xnor 	%r4, %r13, %r25
	.word 0xb429000f  ! 4: ANDN_R	andn 	%r4, %r15, %r26
thr3_resum_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_476), 16, 16)) -> intp(1, 3, 1)
	.word 0xb431800f  ! 4: ORN_R	orn 	%r6, %r15, %r26
thr3_nuke_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_477), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0c0c00d  ! 4: ADDCcc_R	addccc 	%r3, %r13, %r24
	.word 0xb611800b  ! 4: OR_R	or 	%r6, %r11, %r27
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xae01ac60  ! 4: ADD_I	add 	%r6, 0x0c60, %r23
	.word 0xaf31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r23
thr3_resum_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_477), 16, 16)) -> intp(0, 3, 1)
	.word 0xb642000f  ! 4: ADDC_R	addc 	%r8, %r15, %r27
thr3_nuke_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_478), 16, 16)) -> intp(0, 2, 1)
	.word 0xae89400d  ! 4: ANDcc_R	andcc 	%r5, %r13, %r23
	.word 0xba08ec8e  ! 4: AND_I	and 	%r3, 0x0c8e, %r29
	.word 0xab2a000a  ! 4: SLL_R	sll 	%r8, %r10, %r21
	.word 0xbb39000a  ! 4: SRA_R	sra 	%r4, %r10, %r29
	.word 0xad29000d  ! 4: SLL_R	sll 	%r4, %r13, %r22
	.word 0xba18800d  ! 4: XOR_R	xor 	%r2, %r13, %r29
thr3_resum_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_478), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6996600  ! 4: XORcc_I	xorcc 	%r5, 0x0600, %r27
	.word 0xbb28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r29
	.word 0xaf39d00c  ! 4: SRAX_R	srax	%r7, %r12, %r23
	.word 0xb400c00f  ! 4: ADD_R	add 	%r3, %r15, %r26
thr3_hw_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_479), 16, 16)) -> intp(1, 0, 1)
	.word 0xb611e46a  ! 4: OR_I	or 	%r7, 0x046a, %r27
	.word 0xb689000d  ! 4: ANDcc_R	andcc 	%r4, %r13, %r27
	.word 0xaab2000c  ! 4: ORNcc_R	orncc 	%r8, %r12, %r21
	.word 0xa9317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r20
	.word 0xac09edf3  ! 4: AND_I	and 	%r7, 0x0df3, %r22
	.word 0xbc30ea0e  ! 4: ORN_I	orn 	%r3, 0x0a0e, %r30
	.word 0xa819ee94  ! 4: XOR_I	xor 	%r7, 0x0e94, %r20
thr3_nuke_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_480), 16, 16)) -> intp(0, 2, 1)
	.word 0xb230800c  ! 4: ORN_R	orn 	%r2, %r12, %r25
	.word 0xb89a000e  ! 4: XORcc_R	xorcc 	%r8, %r14, %r28
	.word 0xb130a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r24
	.word 0xbc0a000a  ! 4: AND_R	and 	%r8, %r10, %r30
	.word 0xb2ba000a  ! 4: XNORcc_R	xnorcc 	%r8, %r10, %r25
	.word 0xb4b8a126  ! 4: XNORcc_I	xnorcc 	%r2, 0x0126, %r26
thr3_resum_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_480), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa29800e  ! 4: ANDN_R	andn 	%r6, %r14, %r21
thr3_hw_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_481), 16, 16)) -> intp(0, 0, 1)
	.word 0xb578e401  ! 4: MOVR_I	move	%r3, 0xe, %r26
	.word 0xad796401  ! 4: MOVR_I	move	%r5, 0xe, %r22
	.word 0xb0a9c00d  ! 4: ANDNcc_R	andncc 	%r7, %r13, %r24
	.word 0xb601800d  ! 4: ADD_R	add 	%r6, %r13, %r27
	.word 0xb418c00f  ! 4: XOR_R	xor 	%r3, %r15, %r26
	.word 0xbd39000b  ! 4: SRA_R	sra 	%r4, %r11, %r30
	.word 0xb0b16607  ! 4: ORNcc_I	orncc 	%r5, 0x0607, %r24
thr3_nuke_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_482), 16, 16)) -> intp(1, 2, 1)
	.word 0xb601c00b  ! 4: ADD_R	add 	%r7, %r11, %r27
	.word 0xb289000d  ! 4: ANDcc_R	andcc 	%r4, %r13, %r25
	.word 0xab28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r21
	.word 0xb328a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r25
	.word 0xab29900f  ! 4: SLLX_R	sllx	%r6, %r15, %r21
thr3_resum_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_482), 16, 16)) -> intp(1, 3, 1)
	.word 0xb831400e  ! 4: ORN_R	orn 	%r5, %r14, %r28
	.word 0xae10e8d3  ! 4: OR_I	or 	%r3, 0x08d3, %r23
thr3_hw_intr_483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_483), 16, 16)) -> intp(0, 0, 1)
	.word 0xb629c00b  ! 4: ANDN_R	andn 	%r7, %r11, %r27
	.word 0xb011000a  ! 4: OR_R	or 	%r4, %r10, %r24
	.word 0xaa98e31a  ! 4: XORcc_I	xorcc 	%r3, 0x031a, %r21
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xac11400a  ! 4: OR_R	or 	%r5, %r10, %r22
	.word 0xb828ae2d  ! 4: ANDN_I	andn 	%r2, 0x0e2d, %r28
	.word 0xa839e472  ! 4: XNOR_I	xnor 	%r7, 0x0472, %r20
thr3_nuke_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_484), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2122e64  ! 4: OR_I	or 	%r8, 0x0e64, %r25
	.word 0xb4412f6d  ! 4: ADDC_I	addc 	%r4, 0x0f6d, %r26
thr3_resum_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_484), 16, 16)) -> intp(0, 3, 1)
	.word 0xa810ede5  ! 4: OR_I	or 	%r3, 0x0de5, %r20
	.word 0xb779a401  ! 4: MOVR_I	move	%r6, 0xde5, %r27
thr3_hw_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_485), 16, 16)) -> intp(0, 0, 1)
	.word 0xb89a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r28
	.word 0xac99c00d  ! 4: XORcc_R	xorcc 	%r7, %r13, %r22
	.word 0xb6892c51  ! 4: ANDcc_I	andcc 	%r4, 0x0c51, %r27
	.word 0xbb64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb899800b  ! 4: XORcc_R	xorcc 	%r6, %r11, %r28
	.word 0xb2aa000d  ! 4: ANDNcc_R	andncc 	%r8, %r13, %r25
	.word 0xb028800b  ! 4: ANDN_R	andn 	%r2, %r11, %r24
thr3_nuke_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_486), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa19e937  ! 4: XOR_I	xor 	%r7, 0x0937, %r21
	.word 0xba41c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r29
	.word 0xbca9ec25  ! 4: ANDNcc_I	andncc 	%r7, 0x0c25, %r30
	.word 0xab30a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r21
	.word 0xaf28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r23
thr3_resum_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_486), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4312f3d  ! 4: ORN_I	orn 	%r4, 0x0f3d, %r26
	.word 0xbb28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r29
thr3_hw_intr_487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_487), 16, 16)) -> intp(0, 0, 1)
	.word 0xac81ac05  ! 4: ADDcc_I	addcc 	%r6, 0x0c05, %r22
	.word 0xaeaa2fb3  ! 4: ANDNcc_I	andncc 	%r8, 0x0fb3, %r23
	.word 0xac81800d  ! 4: ADDcc_R	addcc 	%r6, %r13, %r22
	.word 0xac00800f  ! 4: ADD_R	add 	%r2, %r15, %r22
	.word 0xba4167de  ! 4: ADDC_I	addc 	%r5, 0x07de, %r29
	.word 0xbc822f9e  ! 4: ADDcc_I	addcc 	%r8, 0x0f9e, %r30
	.word 0xab39100c  ! 4: SRAX_R	srax	%r4, %r12, %r21
thr3_nuke_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_488), 16, 16)) -> intp(1, 2, 1)
	.word 0xb231400a  ! 4: ORN_R	orn 	%r5, %r10, %r25
	.word 0xaa30e7db  ! 4: ORN_I	orn 	%r3, 0x07db, %r21
	.word 0xaeb1c00e  ! 4: ORNcc_R	orncc 	%r7, %r14, %r23
thr3_resum_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_488), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa40c00d  ! 4: ADDC_R	addc 	%r3, %r13, %r21
thr3_hw_intr_489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_489), 16, 16)) -> intp(1, 0, 1)
	.word 0xb964180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa8b8ada6  ! 4: XNORcc_I	xnorcc 	%r2, 0x0da6, %r20
	.word 0xaf64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae98e4fe  ! 4: XORcc_I	xorcc 	%r3, 0x04fe, %r23
	.word 0xb0c1000e  ! 4: ADDCcc_R	addccc 	%r4, %r14, %r24
	.word 0xb979e401  ! 4: MOVR_I	move	%r7, 0xe, %r28
	.word 0xb48a275c  ! 4: ANDcc_I	andcc 	%r8, 0x075c, %r26
thr3_nuke_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_490), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8a9c00c  ! 4: ANDNcc_R	andncc 	%r7, %r12, %r20
	.word 0xab38d00c  ! 4: SRAX_R	srax	%r3, %r12, %r21
	.word 0xb239e384  ! 4: XNOR_I	xnor 	%r7, 0x0384, %r25
thr3_resum_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_490), 16, 16)) -> intp(1, 3, 1)
	.word 0xad29100d  ! 4: SLLX_R	sllx	%r4, %r13, %r22
	.word 0xb009800e  ! 4: AND_R	and 	%r6, %r14, %r24
	.word 0xae08ebb6  ! 4: AND_I	and 	%r3, 0x0bb6, %r23
	.word 0xaec1400a  ! 4: ADDCcc_R	addccc 	%r5, %r10, %r23
thr3_hw_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_491), 16, 16)) -> intp(1, 0, 1)
	.word 0xac90e03e  ! 4: ORcc_I	orcc 	%r3, 0x003e, %r22
	.word 0xb378a401  ! 4: MOVR_I	move	%r2, 0x3e, %r25
	.word 0xb0b9000f  ! 4: XNORcc_R	xnorcc 	%r4, %r15, %r24
	.word 0xa829acfb  ! 4: ANDN_I	andn 	%r6, 0x0cfb, %r20
	.word 0xae18e348  ! 4: XOR_I	xor 	%r3, 0x0348, %r23
	.word 0xa899adc0  ! 4: XORcc_I	xorcc 	%r6, 0x0dc0, %r20
	.word 0xbc81c00a  ! 4: ADDcc_R	addcc 	%r7, %r10, %r30
thr3_nuke_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_492), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf29100b  ! 4: SLLX_R	sllx	%r4, %r11, %r23
	.word 0xb6a9ab30  ! 4: ANDNcc_I	andncc 	%r6, 0x0b30, %r27
	.word 0xb139500f  ! 4: SRAX_R	srax	%r5, %r15, %r24
	.word 0xb6b92037  ! 4: XNORcc_I	xnorcc 	%r4, 0x0037, %r27
thr3_resum_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_492), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6c12d8d  ! 4: ADDCcc_I	addccc 	%r4, 0x0d8d, %r27
	.word 0xb419c00c  ! 4: XOR_R	xor 	%r7, %r12, %r26
	.word 0xb131e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r24
thr3_hw_intr_493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_493), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa800800d  ! 4: ADD_R	add 	%r2, %r13, %r20
	.word 0xb02a2c29  ! 4: ANDN_I	andn 	%r8, 0x0c29, %r24
	.word 0xae41299f  ! 4: ADDC_I	addc 	%r4, 0x099f, %r23
	.word 0xb979040f  ! 4: MOVR_R	move	%r4, %r15, %r28
	.word 0xa812295b  ! 4: OR_I	or 	%r8, 0x095b, %r20
thr3_hw_intr_494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_494), 16, 16)) -> intp(1, 0, 1)
	.word 0xab31000c  ! 4: SRL_R	srl 	%r4, %r12, %r21
	.word 0xaa30800b  ! 4: ORN_R	orn 	%r2, %r11, %r21
	.word 0xb179040c  ! 4: MOVR_R	move	%r4, %r12, %r24
	.word 0xb2c0800d  ! 4: ADDCcc_R	addccc 	%r2, %r13, %r25
	.word 0xaac16692  ! 4: ADDCcc_I	addccc 	%r5, 0x0692, %r21
	.word 0xb528a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r26
	.word 0xb63a000f  ! 4: XNOR_R	xnor 	%r8, %r15, %r27
thr3_nuke_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_495), 16, 16)) -> intp(1, 2, 1)
	.word 0xae1a000f  ! 4: XOR_R	xor 	%r8, %r15, %r23
	.word 0xb888c00b  ! 4: ANDcc_R	andcc 	%r3, %r11, %r28
	.word 0xba32000a  ! 4: ORN_R	orn 	%r8, %r10, %r29
thr3_resum_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_495), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa31000a  ! 4: ORN_R	orn 	%r4, %r10, %r21
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb402000d  ! 4: ADD_R	add 	%r8, %r13, %r26
thr3_nuke_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_496), 16, 16)) -> intp(0, 2, 1)
	.word 0xb819e1bd  ! 4: XOR_I	xor 	%r7, 0x01bd, %r28
	.word 0xb241800e  ! 4: ADDC_R	addc 	%r6, %r14, %r25
	.word 0xb2316881  ! 4: ORN_I	orn 	%r5, 0x0881, %r25
	.word 0xb20923dc  ! 4: AND_I	and 	%r4, 0x03dc, %r25
	.word 0xbcb8c00c  ! 4: XNORcc_R	xnorcc 	%r3, %r12, %r30
	.word 0xb539a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r26
	.word 0xab39500f  ! 4: SRAX_R	srax	%r5, %r15, %r21
thr3_resum_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_496), 16, 16)) -> intp(0, 3, 1)
	.word 0xb1293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r24
	.word 0xb290aa0a  ! 4: ORcc_I	orcc 	%r2, 0x0a0a, %r25
thr3_hw_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_497), 16, 16)) -> intp(0, 0, 1)
	.word 0xb429400a  ! 4: ANDN_R	andn 	%r5, %r10, %r26
	.word 0xb08926c9  ! 4: ANDcc_I	andcc 	%r4, 0x06c9, %r24
	.word 0xb201400f  ! 4: ADD_R	add 	%r5, %r15, %r25
	.word 0xb809400e  ! 4: AND_R	and 	%r5, %r14, %r28
	.word 0xad38900a  ! 4: SRAX_R	srax	%r2, %r10, %r22
	.word 0xb531800e  ! 4: SRL_R	srl 	%r6, %r14, %r26
	.word 0xb939500d  ! 4: SRAX_R	srax	%r5, %r13, %r28
thr3_nuke_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_498), 16, 16)) -> intp(1, 2, 1)
	.word 0xab2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r21
	.word 0xbcb8eaa8  ! 4: XNORcc_I	xnorcc 	%r3, 0x0aa8, %r30
	.word 0xa811e4a4  ! 4: OR_I	or 	%r7, 0x04a4, %r20
thr3_resum_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_498), 16, 16)) -> intp(1, 3, 1)
	.word 0xac28c00a  ! 4: ANDN_R	andn 	%r3, %r10, %r22
	.word 0xaa30e3b0  ! 4: ORN_I	orn 	%r3, 0x03b0, %r21
thr3_nuke_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_499), 16, 16)) -> intp(1, 2, 1)
	.word 0xb219400d  ! 4: XOR_R	xor 	%r5, %r13, %r25
	.word 0xb629c00e  ! 4: ANDN_R	andn 	%r7, %r14, %r27
	.word 0xae1a2712  ! 4: XOR_I	xor 	%r8, 0x0712, %r23
thr3_resum_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_499), 16, 16)) -> intp(1, 3, 1)
	.word 0xb641efae  ! 4: ADDC_I	addc 	%r7, 0x0fae, %r27
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx  0x4bdd2e2d94636db6, %r16, %r16
	setx  0x1cee628d8c2ab417, %r16, %r17
	setx  0x6c3d627f8177362d, %r16, %r18
	setx  0x8b057adf50a4c049, %r16, %r19
	setx  0x1d0e59a9472a0fb6, %r16, %r20
	setx  0x5591109e23bab6c5, %r16, %r21
	setx  0x41432d947620c0e9, %r16, %r22
	setx  0x9695c6be003ef6dd, %r16, %r23
	setx  0xa2b10e515b9c4c8e, %r16, %r24
	setx  0x2702d8dd0cf27dd5, %r16, %r25
	setx  0x351fb6963c4bcfc6, %r16, %r26
	setx  0xaf0edbac928a220b, %r16, %r27
	setx  0xd581482fed65ed44, %r16, %r28
	setx  0x344f56e58ebd5b8d, %r16, %r29
	setx  0x7f575cd527cba067, %r16, %r30
	setx  0x4cc3050a6fdcec60, %r16, %r31
	setx  0x0000000000000ff0, %r16, %r10
	setx  0x0000000000000fe0, %r16, %r11
	setx  0x0000000000000590, %r16, %r12
	setx  0x0000000000000670, %r16, %r13
	setx  0x00000000000001f0, %r16, %r14
	setx  0x00000000000007a0, %r16, %r15
	setx  0x0000000000000ab1, %r16, %r9
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
	.word 0xbaf9400b  ! 5: SDIVcc_R	sdivcc 	%r5, %r11, %r29
	.word 0x87a88a6c  ! 5: FCMPq	fcmpq	%fcc<n>, %f0, %f12
	.word 0xaad22f1b  ! 5: UMULcc_I	umulcc 	%r8, 0x0f1b, %r21
	.word 0xae79adf4  ! 5: SDIV_I	sdiv 	%r6, 0x0df4, %r23
	.word 0xb9a81c2f  ! 5: FMOVRGEZ	dis not found

	.word 0xae696a6f  ! 5: UDIVX_I	udivx 	%r5, 0x0a6f, %r23
	.word 0xaba0108f  ! 5: FxTOs	dis not found

	.word 0xb679e5fd  ! 5: SDIV_I	sdiv 	%r7, 0x05fd, %r27
	.word 0xaba1496b  ! 5: FMULq	dis not found

	.word 0xba49e54d  ! 5: MULX_I	mulx 	%r7, 0x054d, %r29
	.word 0xb459400e  ! 5: SMUL_R	smul 	%r5, %r14, %r26
	.word 0xb5aa882a  ! 5: FMOVG	fmovs	%fcc1, %f10, %f26
	.word 0xb4f0800c  ! 5: UDIVcc_R	udivcc 	%r2, %r12, %r26
	.word 0xadb10e6d  ! 5: FXNORS	fxnors	%r4, %r13, %r22
	.word 0xb8692b0b  ! 5: UDIVX_I	udivx 	%r4, 0x0b0b, %r28
	.word 0xb8f1a010  ! 5: UDIVcc_I	udivcc 	%r6, 0x0010, %r28
	.word 0xb6da2919  ! 5: SMULcc_I	smulcc 	%r8, 0x0919, %r27
	.word 0x87a88a2e  ! 5: FCMPs	fcmps	%fcc<n>, %f2, %f14
	.word 0xb521400c  ! 5: MULScc_R	mulscc 	%r5, %r12, %r26
	.word 0xbcfa23d2  ! 5: SDIVcc_I	sdivcc 	%r8, 0x03d2, %r30
	.word 0xbda8182a  ! 5: FMOVRGZ	fmovs	%fcc3, %f10, %f30
	.word 0xb3a0190a  ! 5: FiTOd	dis not found

	.word 0xb25a24c3  ! 5: SMUL_I	smul 	%r8, 0x04c3, %r25
	.word 0xb168ab10  ! 5: SDIVX_I	sdivx	%r2, 0x0b10, %r24
	.word 0x87a88aab  ! 5: FCMPEs	fcmpes	%fcc<n>, %f2, %f11
	.word 0xbcf8800c  ! 5: SDIVcc_R	sdivcc 	%r2, %r12, %r30
	.word 0x87a94acc  ! 5: FCMPEd	fcmped	%fcc<n>, %f36, %f12
	.word 0xbba0054d  ! 5: FSQRTd	fsqrt	
	.word 0xb659800e  ! 5: SMUL_R	smul 	%r6, %r14, %r27
	.word 0xb3696c5a  ! 5: SDIVX_I	sdivx	%r5, 0x0c5a, %r25
	.word 0xab6a000a  ! 5: SDIVX_R	sdivx	%r8, %r10, %r21
	.word 0x15800003  ! 5: FBUE	fbue  	<label_0x3>
	.word 0x87a90a4c  ! 5: FCMPd	fcmpd	%fcc<n>, %f4, %f12
	.word 0xb851adcb  ! 5: UMUL_I	umul 	%r6, 0x0dcb, %r28
	.word 0xb4f1400a  ! 5: UDIVcc_R	udivcc 	%r5, %r10, %r26
	.word 0xb7a0054e  ! 5: FSQRTd	fsqrt	
	.word 0xbaf96e62  ! 5: SDIVcc_I	sdivcc 	%r5, 0x0e62, %r29
	.word 0xbb21c00b  ! 5: MULScc_R	mulscc 	%r7, %r11, %r29
	.word 0xb451000a  ! 5: UMUL_R	umul 	%r4, %r10, %r26
	.word 0xa858800e  ! 5: SMUL_R	smul 	%r2, %r14, %r20
	.word 0xb122217e  ! 5: MULScc_I	mulscc 	%r8, 0x017e, %r24
	.word 0xac48c00d  ! 5: MULX_R	mulx 	%r3, %r13, %r22
	.word 0xb471800f  ! 5: UDIV_R	udiv 	%r6, %r15, %r26
	.word 0xb5a8882a  ! 5: FMOVLE	fmovs	%fcc1, %f10, %f26
	.word 0xb878c00b  ! 5: SDIV_R	sdiv 	%r3, %r11, %r28
	.word 0xb451c00f  ! 5: UMUL_R	umul 	%r7, %r15, %r26
	.word 0xbc48800c  ! 5: MULX_R	mulx 	%r2, %r12, %r30
	.word 0xada0006a  ! 5: FMOVq	dis not found

	.word 0xbc69c00f  ! 5: UDIVX_R	udivx 	%r7, %r15, %r30
	.word 0xada01a2e  ! 5: FsTOi	dis not found

	.word 0xb1ab482f  ! 5: FMOVCC	fmovs	%fcc1, %f15, %f24
	.word 0xb8596e7a  ! 5: SMUL_I	smul 	%r5, 0x0e7a, %r28
	.word 0x3f400001  ! 5: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0xb4512593  ! 5: UMUL_I	umul 	%r4, 0x0593, %r26
	.word 0xb0f16209  ! 5: UDIVcc_I	udivcc 	%r5, 0x0209, %r24
	.word 0xb469212e  ! 5: UDIVX_I	udivx 	%r4, 0x012e, %r26
	.word 0xbd21400c  ! 5: MULScc_R	mulscc 	%r5, %r12, %r30
	.word 0xbda0006b  ! 5: FMOVq	dis not found

	.word 0xa879c00c  ! 5: SDIV_R	sdiv 	%r7, %r12, %r20
	.word 0xae71c00d  ! 5: UDIV_R	udiv 	%r7, %r13, %r23
	.word 0xba58c00a  ! 5: SMUL_R	smul 	%r3, %r10, %r29
	.word 0xb2d8c00e  ! 5: SMULcc_R	smulcc 	%r3, %r14, %r25
	.word 0xac49000e  ! 5: MULX_R	mulx 	%r4, %r14, %r22
	.word 0xb4f1400f  ! 5: UDIVcc_R	udivcc 	%r5, %r15, %r26
	.word 0xa848a6a3  ! 5: MULX_I	mulx 	%r2, 0x06a3, %r20
	.word 0x29400001  ! 5: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xb269000b  ! 5: UDIVX_R	udivx 	%r4, %r11, %r25
	.word 0xbba01a4e  ! 5: FdTOi	dis not found

	.word 0xb4492bcd  ! 5: MULX_I	mulx 	%r4, 0x0bcd, %r26
	.word 0xbba01a6e  ! 5: FqTOi	fqtoi	
	.word 0xb2fa000b  ! 5: SDIVcc_R	sdivcc 	%r8, %r11, %r25
	.word 0xb0692baf  ! 5: UDIVX_I	udivx 	%r4, 0x0baf, %r24
	.word 0xa8512192  ! 5: UMUL_I	umul 	%r4, 0x0192, %r20
	.word 0xb5a0002b  ! 5: FMOVs	fmovs	%f11, %f26
	.word 0xb079eec3  ! 5: SDIV_I	sdiv 	%r7, 0x0ec3, %r24
	.word 0xb9a0002c  ! 5: FMOVs	fmovs	%f12, %f28
	.word 0xb659400c  ! 5: SMUL_R	smul 	%r5, %r12, %r27
	.word 0xadaa882a  ! 5: FMOVG	fmovs	%fcc1, %f10, %f22
	.word 0xbc78a115  ! 5: SDIV_I	sdiv 	%r2, 0x0115, %r30
	.word 0xb3a81c2a  ! 5: FMOVRGEZ	dis not found

	.word 0xac79ae60  ! 5: SDIV_I	sdiv 	%r6, 0x0e60, %r22
	.word 0xada018ce  ! 5: FdTOs	dis not found

	.word 0xa9a089ce  ! 5: FDIVd	fdivd	%f2, %f14, %f20
	.word 0xacf9af14  ! 5: SDIVcc_I	sdivcc 	%r6, 0x0f14, %r22
	.word 0xaa68aa58  ! 5: UDIVX_I	udivx 	%r2, 0x0a58, %r21
	.word 0xaa71af87  ! 5: UDIV_I	udiv 	%r6, 0x0f87, %r21
	.word 0xbaf9000b  ! 5: SDIVcc_R	sdivcc 	%r4, %r11, %r29
	.word 0xb4d92d61  ! 5: SMULcc_I	smulcc 	%r4, 0x0d61, %r26
	.word 0x0d400001  ! 5: FBPG	fbg
	.word 0xb868c00f  ! 5: UDIVX_R	udivx 	%r3, %r15, %r28
	.word 0xadb20e6e  ! 5: FXNORS	fxnors	%r8, %r14, %r22
	.word 0xbcf9000f  ! 5: SDIVcc_R	sdivcc 	%r4, %r15, %r30
	.word 0xbba0012c  ! 5: FABSs	fabss	%f12, %f29
	.word 0xaf69ac0b  ! 5: SDIVX_I	sdivx	%r6, 0x0c0b, %r23
	.word 0xb4d1e9eb  ! 5: UMULcc_I	umulcc 	%r7, 0x09eb, %r26
	.word 0xb8d1ea17  ! 5: UMULcc_I	umulcc 	%r7, 0x0a17, %r28
	.word 0xb969c00f  ! 5: SDIVX_R	sdivx	%r7, %r15, %r28
	.word 0xa9a0192e  ! 5: FsTOd	dis not found

	.word 0xb8da000a  ! 5: SMULcc_R	smulcc 	%r8, %r10, %r28
	.word 0xbd69000d  ! 5: SDIVX_R	sdivx	%r4, %r13, %r30
	.word 0xafa1894a  ! 5: FMULd	fmuld	%f6, %f10, %f54
	.word 0xb2f22493  ! 5: UDIVcc_I	udivcc 	%r8, 0x0493, %r25
	.word 0xb520c00a  ! 5: MULScc_R	mulscc 	%r3, %r10, %r26
	.word 0xacf8eaf3  ! 5: SDIVcc_I	sdivcc 	%r3, 0x0af3, %r22
	.word 0x21400001  ! 5: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0xaa51400b  ! 5: UMUL_R	umul 	%r5, %r11, %r21
	.word 0x87a8caca  ! 5: FCMPEd	fcmped	%fcc<n>, %f34, %f10
	.word 0xb278800b  ! 5: SDIV_R	sdiv 	%r2, %r11, %r25
	.word 0xb871400c  ! 5: UDIV_R	udiv 	%r5, %r12, %r28
	.word 0x87a8ca2f  ! 5: FCMPs	fcmps	%fcc<n>, %f3, %f15
	.word 0xafa1c8cd  ! 5: FSUBd	fsubd	%f38, %f44, %f54
	.word 0xa850e093  ! 5: UMUL_I	umul 	%r3, 0x0093, %r20
	.word 0x31400001  ! 5: FBPA	fba,a,pn	%fcc0, <label_0x1>
	.word 0xb72222b9  ! 5: MULScc_I	mulscc 	%r8, 0x02b9, %r27
	.word 0x2d400001  ! 5: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0xb3212b95  ! 5: MULScc_I	mulscc 	%r4, 0x0b95, %r25
	.word 0xa8f16ce2  ! 5: UDIVcc_I	udivcc 	%r5, 0x0ce2, %r20
	.word 0xbba0c8cf  ! 5: FSUBd	fsubd	%f34, %f46, %f60
	.word 0xb449c00a  ! 5: MULX_R	mulx 	%r7, %r10, %r26
	.word 0xaa50e812  ! 5: UMUL_I	umul 	%r3, 0x0812, %r21
	.word 0xb16a000a  ! 5: SDIVX_R	sdivx	%r8, %r10, %r24
	.word 0xbc71af53  ! 5: UDIV_I	udiv 	%r6, 0x0f53, %r30
	.word 0xae71a5d3  ! 5: UDIV_I	udiv 	%r6, 0x05d3, %r23
	.word 0x0d400001  ! 5: FBPG	fbg
	.word 0x0d800001  ! 5: FBG	fbg  	<label_0x1>
	.word 0xb459000f  ! 5: SMUL_R	smul 	%r4, %r15, %r26
	.word 0x21400003  ! 5: FBPN	fbn,a,pn	%fcc0, <label_0x3>
	.word 0xaed0800d  ! 5: UMULcc_R	umulcc 	%r2, %r13, %r23
	.word 0xb450e549  ! 5: UMUL_I	umul 	%r3, 0x0549, %r26
	.word 0xa8f9a716  ! 5: SDIVcc_I	sdivcc 	%r6, 0x0716, %r20
	.word 0xab212b78  ! 5: MULScc_I	mulscc 	%r4, 0x0b78, %r21
	.word 0x09800003  ! 5: FBL	fbl  	<label_0x3>
	.word 0xb9a0190c  ! 5: FiTOd	dis not found

	.word 0xbcfa2967  ! 5: SDIVcc_I	sdivcc 	%r8, 0x0967, %r30
	.word 0xac71ac0a  ! 5: UDIV_I	udiv 	%r6, 0x0c0a, %r22
	.word 0xb169c00c  ! 5: SDIVX_R	sdivx	%r7, %r12, %r24
	.word 0xaf69e9aa  ! 5: SDIVX_I	sdivx	%r7, 0x09aa, %r23
	.word 0xacf9c00b  ! 5: SDIVcc_R	sdivcc 	%r7, %r11, %r22
	.word 0xaa51afaa  ! 5: UMUL_I	umul 	%r6, 0x0faa, %r21
	.word 0xbcda000a  ! 5: SMULcc_R	smulcc 	%r8, %r10, %r30
	.word 0xa8d9ea4c  ! 5: SMULcc_I	smulcc 	%r7, 0x0a4c, %r20
	.word 0xa921000f  ! 5: MULScc_R	mulscc 	%r4, %r15, %r20
	.word 0xbc50c00b  ! 5: UMUL_R	umul 	%r3, %r11, %r30
	.word 0xbcf228b0  ! 5: UDIVcc_I	udivcc 	%r8, 0x08b0, %r30
	.word 0xafa8142e  ! 5: FMOVRNZ	dis not found

	.word 0xbba9882d  ! 5: FMOVNEG	fmovs	%fcc1, %f13, %f29
	.word 0xb122000d  ! 5: MULScc_R	mulscc 	%r8, %r13, %r24
	.word 0xbda08dcb  ! 5: FdMULq	fdmulq	
	.word 0xb5a9c82e  ! 5: FMOVVS	fmovs	%fcc1, %f14, %f26
	.word 0xbb212b76  ! 5: MULScc_I	mulscc 	%r4, 0x0b76, %r29
	.word 0xacd9400a  ! 5: SMULcc_R	smulcc 	%r5, %r10, %r22
	.word 0xb469e638  ! 5: UDIVX_I	udivx 	%r7, 0x0638, %r26
	.word 0xbb68aebe  ! 5: SDIVX_I	sdivx	%r2, 0x0ebe, %r29
	.word 0xb9a10d2c  ! 5: FsMULd	fsmuld	%f4, %f12, %f28
	.word 0xb671a6cb  ! 5: UDIV_I	udiv 	%r6, 0x06cb, %r27
	.word 0xac51c00d  ! 5: UMUL_R	umul 	%r7, %r13, %r22
	.word 0xb9a0894a  ! 5: FMULd	fmuld	%f2, %f10, %f28
	.word 0xb2d9000b  ! 5: SMULcc_R	smulcc 	%r4, %r11, %r25
	.word 0xaaf9c00d  ! 5: SDIVcc_R	sdivcc 	%r7, %r13, %r21
	.word 0xae51ea45  ! 5: UMUL_I	umul 	%r7, 0x0a45, %r23
	.word 0xb8d8800b  ! 5: SMULcc_R	smulcc 	%r2, %r11, %r28
	.word 0xb850e2ca  ! 5: UMUL_I	umul 	%r3, 0x02ca, %r28
	.word 0xad6a2f58  ! 5: SDIVX_I	sdivx	%r8, 0x0f58, %r22
	.word 0xb668c00e  ! 5: UDIVX_R	udivx 	%r3, %r14, %r27
	.word 0xb7a000ee  ! 5: FNEGq	dis not found

	.word 0x03800001  ! 5: FBNE	fbne  	<label_0x1>
	.word 0x87a9ca2e  ! 5: FCMPs	fcmps	%fcc<n>, %f7, %f14
	.word 0xb6f0a0f8  ! 5: UDIVcc_I	udivcc 	%r2, 0x00f8, %r27
	.word 0xb858800a  ! 5: SMUL_R	smul 	%r2, %r10, %r28
	.word 0xbcd8800f  ! 5: SMULcc_R	smulcc 	%r2, %r15, %r30
	.word 0xbaf92dcb  ! 5: SDIVcc_I	sdivcc 	%r4, 0x0dcb, %r29
	.word 0xbba089ec  ! 5: FDIVq	dis not found

	.word 0x1f800003  ! 5: FBO	fbo  	<label_0x3>
	.word 0xaed1c00d  ! 5: UMULcc_R	umulcc 	%r7, %r13, %r23
	.word 0xb5a9482b  ! 5: FMOVCS	fmovs	%fcc1, %f11, %f26
	.word 0x3f400001  ! 5: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0xacf9a73e  ! 5: SDIVcc_I	sdivcc 	%r6, 0x073e, %r22
	.word 0xb4d9000f  ! 5: SMULcc_R	smulcc 	%r4, %r15, %r26
	.word 0xb1a0102f  ! 5: FsTOx	dis not found

	.word 0xb6d0aa9f  ! 5: UMULcc_I	umulcc 	%r2, 0x0a9f, %r27
	.word 0xaa79400b  ! 5: SDIV_R	sdiv 	%r5, %r11, %r21
	.word 0xb0f9400f  ! 5: SDIVcc_R	sdivcc 	%r5, %r15, %r24
	.word 0xbc70e4de  ! 5: UDIV_I	udiv 	%r3, 0x04de, %r30
	.word 0xa869000b  ! 5: UDIVX_R	udivx 	%r4, %r11, %r20
	.word 0x87a8ca2c  ! 5: FCMPs	fcmps	%fcc<n>, %f3, %f12
	.word 0xb079ae48  ! 5: SDIV_I	sdiv 	%r6, 0x0e48, %r24
	.word 0xbba0106a  ! 5: FqTOx	fqtox	
	.word 0xb050e2d3  ! 5: UMUL_I	umul 	%r3, 0x02d3, %r24
	.word 0xba69800b  ! 5: UDIVX_R	udivx 	%r6, %r11, %r29
	.word 0xaa48800a  ! 5: MULX_R	mulx 	%r2, %r10, %r21
	.word 0xb0d12ccf  ! 5: UMULcc_I	umulcc 	%r4, 0x0ccf, %r24
	.word 0xacf0c00d  ! 5: UDIVcc_R	udivcc 	%r3, %r13, %r22
	.word 0x01800001  ! 5: FBN	fbn  	<label_0x1>
	.word 0xb4f9c00c  ! 5: SDIVcc_R	sdivcc 	%r7, %r12, %r26
	.word 0x23800001  ! 5: FBNE	fbne,a	<label_0x1>
	.word 0xb1a0196d  ! 5: FqTOd	dis not found

	.word 0xada0104d  ! 5: FdTOx	dis not found

	.word 0xaad9000b  ! 5: SMULcc_R	smulcc 	%r4, %r11, %r21
	.word 0xada109ca  ! 5: FDIVd	fdivd	%f4, %f10, %f22
	.word 0xac496b6f  ! 5: MULX_I	mulx 	%r5, 0x0b6f, %r22
	.word 0xacd9e9a2  ! 5: SMULcc_I	smulcc 	%r7, 0x09a2, %r22
	.word 0xbda000ed  ! 5: FNEGq	dis not found

	.word 0xb9a81c2e  ! 5: FMOVRGEZ	dis not found

	.word 0xae79ef0c  ! 5: SDIV_I	sdiv 	%r7, 0x0f0c, %r23
	.word 0xb569c00f  ! 5: SDIVX_R	sdivx	%r7, %r15, %r26
	.word 0xb8d1c00e  ! 5: UMULcc_R	umulcc 	%r7, %r14, %r28
	.word 0xbcf0a5c5  ! 5: UDIVcc_I	udivcc 	%r2, 0x05c5, %r30
	.word 0xaa69e441  ! 5: UDIVX_I	udivx 	%r7, 0x0441, %r21
	.word 0xbcd22e2d  ! 5: UMULcc_I	umulcc 	%r8, 0x0e2d, %r30
	.word 0xb8d8c00b  ! 5: SMULcc_R	smulcc 	%r3, %r11, %r28
	.word 0xba512615  ! 5: UMUL_I	umul 	%r4, 0x0615, %r29
	.word 0xb5a0196e  ! 5: FqTOd	dis not found

	.word 0xb7ab082b  ! 5: FMOVGU	fmovs	%fcc1, %f11, %f27
	.word 0xae6a000a  ! 5: UDIVX_R	udivx 	%r8, %r10, %r23
	.word 0xb458800a  ! 5: SMUL_R	smul 	%r2, %r10, %r26
	.word 0xa9a8882c  ! 5: FMOVLE	fmovs	%fcc1, %f12, %f20
	.word 0xb47222ea  ! 5: UDIV_I	udiv 	%r8, 0x02ea, %r26
	.word 0xbcda28ab  ! 5: SMULcc_I	smulcc 	%r8, 0x08ab, %r30
	.word 0xb720c00e  ! 5: MULScc_R	mulscc 	%r3, %r14, %r27
	.word 0xae4a2d42  ! 5: MULX_I	mulx 	%r8, 0x0d42, %r23
	.word 0xb45a2087  ! 5: SMUL_I	smul 	%r8, 0x0087, %r26
	.word 0xb879800a  ! 5: SDIV_R	sdiv 	%r6, %r10, %r28
	.word 0xb9a0110d  ! 5: FxTOd	dis not found

	.word 0xb8fa000b  ! 5: SDIVcc_R	sdivcc 	%r8, %r11, %r28
	.word 0xba50800b  ! 5: UMUL_R	umul 	%r2, %r11, %r29
	.word 0x87a8caee  ! 5: FCMPEq	fcmpeq	%fcc<n>, %f32, %f12
	.word 0xb6d96d65  ! 5: SMULcc_I	smulcc 	%r5, 0x0d65, %r27
	.word 0xbc7226f9  ! 5: UDIV_I	udiv 	%r8, 0x06f9, %r30
	.word 0xb169e8c1  ! 5: SDIVX_I	sdivx	%r7, 0x08c1, %r24
	.word 0xa878e568  ! 5: SDIV_I	sdiv 	%r3, 0x0568, %r20
	.word 0xbb68a4aa  ! 5: SDIVX_I	sdivx	%r2, 0x04aa, %r29
	.word 0xb5a0054a  ! 5: FSQRTd	fsqrt	
	.word 0xa8f1a954  ! 5: UDIVcc_I	udivcc 	%r6, 0x0954, %r20
	.word 0xaef8e820  ! 5: SDIVcc_I	sdivcc 	%r3, 0x0820, %r23
	.word 0xafb18e6d  ! 5: FXNORS	fxnors	%r6, %r13, %r23
	.word 0xb5a0192b  ! 5: FsTOd	dis not found

	.word 0xb878a558  ! 5: SDIV_I	sdiv 	%r2, 0x0558, %r28
	.word 0xb8f1000c  ! 5: UDIVcc_R	udivcc 	%r4, %r12, %r28
	.word 0xa859400a  ! 5: SMUL_R	smul 	%r5, %r10, %r20
	.word 0xa921e0dc  ! 5: MULScc_I	mulscc 	%r7, 0x00dc, %r20
	.word 0xba58a632  ! 5: SMUL_I	smul 	%r2, 0x0632, %r29
	.word 0x2f400001  ! 5: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0xa969a73d  ! 5: SDIVX_I	sdivx	%r6, 0x073d, %r20
	.word 0xb059e554  ! 5: SMUL_I	smul 	%r7, 0x0554, %r24
	.word 0xac58c00a  ! 5: SMUL_R	smul 	%r3, %r10, %r22
	.word 0xb048800d  ! 5: MULX_R	mulx 	%r2, %r13, %r24
	.word 0xb850e61f  ! 5: UMUL_I	umul 	%r3, 0x061f, %r28
	.word 0xaa7a000b  ! 5: SDIV_R	sdiv 	%r8, %r11, %r21
	.word 0xb2da000c  ! 5: SMULcc_R	smulcc 	%r8, %r12, %r25
	.word 0xb5a1c82b  ! 5: FADDs	fadds	%f7, %f11, %f26
	.word 0xb9a148af  ! 5: FSUBs	fsubs	%f5, %f15, %f28
	.word 0xafa08dce  ! 5: FdMULq	fdmulq	
	.word 0xb2f96743  ! 5: SDIVcc_I	sdivcc 	%r5, 0x0743, %r25
	.word 0xb071e8e7  ! 5: UDIV_I	udiv 	%r7, 0x08e7, %r24
	.word 0xaed9000d  ! 5: SMULcc_R	smulcc 	%r4, %r13, %r23
	.word 0xb649000a  ! 5: MULX_R	mulx 	%r4, %r10, %r27
	.word 0xa8d0c00e  ! 5: UMULcc_R	umulcc 	%r3, %r14, %r20
	.word 0x2f800001  ! 5: FBU	fbu,a	<label_0x1>
	.word 0xb8f8c00b  ! 5: SDIVcc_R	sdivcc 	%r3, %r11, %r28
	.word 0xba79c00b  ! 5: SDIV_R	sdiv 	%r7, %r11, %r29
	.word 0xbba2094d  ! 5: FMULd	fmuld	%f8, %f44, %f60
	.word 0xba71c00b  ! 5: UDIV_R	udiv 	%r7, %r11, %r29
	.word 0xab6960f3  ! 5: SDIVX_I	sdivx	%r5, 0x00f3, %r21
	.word 0xb369800e  ! 5: SDIVX_R	sdivx	%r6, %r14, %r25
	.word 0xada0198a  ! 5: FiTOq	dis not found

	.word 0xba58ab35  ! 5: SMUL_I	smul 	%r2, 0x0b35, %r29
	.word 0xa869240d  ! 5: UDIVX_I	udivx 	%r4, 0x040d, %r20
	.word 0xbc50ee49  ! 5: UMUL_I	umul 	%r3, 0x0e49, %r30
	.word 0xafa019ca  ! 5: FdTOq	dis not found

	.word 0xb3a0c86d  ! 5: FADDq	dis not found

	.word 0xa9aac82b  ! 5: FMOVGE	fmovs	%fcc1, %f11, %f20
	.word 0xbba1c8ec  ! 5: FSUBq	dis not found

	.word 0xb5a1082a  ! 5: FADDs	fadds	%f4, %f10, %f26
	.word 0xb7a0102e  ! 5: FsTOx	dis not found

	.word 0xa859a802  ! 5: SMUL_I	smul 	%r6, 0x0802, %r20
	.word 0xb9a01a4d  ! 5: FdTOi	dis not found

	.word 0xa9b08e6a  ! 5: FXNORS	fxnors	%r2, %r10, %r20
	.word 0xaa69e6ec  ! 5: UDIVX_I	udivx 	%r7, 0x06ec, %r21
	.word 0xa8fa2c70  ! 5: SDIVcc_I	sdivcc 	%r8, 0x0c70, %r20
	.word 0xaba2082b  ! 5: FADDs	fadds	%f8, %f11, %f21
	.word 0xb76a000c  ! 5: SDIVX_R	sdivx	%r8, %r12, %r27
	.word 0x87a88aab  ! 5: FCMPEs	fcmpes	%fcc<n>, %f2, %f11
	.word 0xbad9000f  ! 5: SMULcc_R	smulcc 	%r4, %r15, %r29
	.word 0xb659800c  ! 5: SMUL_R	smul 	%r6, %r12, %r27
	.word 0xafa0192d  ! 5: FsTOd	dis not found

	.word 0xb3a0102b  ! 5: FsTOx	dis not found

	.word 0xa9ab082f  ! 5: FMOVGU	fmovs	%fcc1, %f15, %f20
	.word 0xb258eb00  ! 5: SMUL_I	smul 	%r3, 0x0b00, %r25
	.word 0xafab082d  ! 5: FMOVGU	fmovs	%fcc1, %f13, %f23
	.word 0xacf1e839  ! 5: UDIVcc_I	udivcc 	%r7, 0x0839, %r22
	.word 0xacf1400f  ! 5: UDIVcc_R	udivcc 	%r5, %r15, %r22
	.word 0xaa51000c  ! 5: UMUL_R	umul 	%r4, %r12, %r21
	.word 0xaa496f32  ! 5: MULX_I	mulx 	%r5, 0x0f32, %r21
	.word 0xb068c00f  ! 5: UDIVX_R	udivx 	%r3, %r15, %r24
	.word 0xaef8ec1d  ! 5: SDIVcc_I	sdivcc 	%r3, 0x0c1d, %r23
	.word 0xb648afd9  ! 5: MULX_I	mulx 	%r2, 0x0fd9, %r27
	.word 0xb1a2092e  ! 5: FMULs	fmuls	%f8, %f14, %f24
	.word 0xada000cc  ! 5: FNEGd	fnegd	%f12, %f22
	.word 0xbc59400c  ! 5: SMUL_R	smul 	%r5, %r12, %r30
	.word 0x2d800003  ! 5: FBG	fbg,a	<label_0x3>
	.word 0xbaf8ac4d  ! 5: SDIVcc_I	sdivcc 	%r2, 0x0c4d, %r29
	.word 0xac50800a  ! 5: UMUL_R	umul 	%r2, %r10, %r22
	.word 0x07800003  ! 5: FBUL	fbul  	<label_0x3>
	.word 0xb9a0016e  ! 5: FABSq	dis not found

	.word 0xb0f22f34  ! 5: UDIVcc_I	udivcc 	%r8, 0x0f34, %r24
	.word 0xae68ed5a  ! 5: UDIVX_I	udivx 	%r3, 0x0d5a, %r23
	.word 0xb3a9c82b  ! 5: FMOVVS	fmovs	%fcc1, %f11, %f25
	.word 0xba6a000c  ! 5: UDIVX_R	udivx 	%r8, %r12, %r29
	.word 0xba59000d  ! 5: SMUL_R	smul 	%r4, %r13, %r29
	.word 0xb1a0c8aa  ! 5: FSUBs	fsubs	%f3, %f10, %f24
	.word 0xb5a019cc  ! 5: FdTOq	dis not found

	.word 0xacd1000e  ! 5: UMULcc_R	umulcc 	%r4, %r14, %r22
	.word 0xaa696d34  ! 5: UDIVX_I	udivx 	%r5, 0x0d34, %r21
	.word 0xb458c00d  ! 5: SMUL_R	smul 	%r3, %r13, %r26
	.word 0xb72223f7  ! 5: MULScc_I	mulscc 	%r8, 0x03f7, %r27
	.word 0xb5a9482c  ! 5: FMOVCS	fmovs	%fcc1, %f12, %f26
	.word 0xad696d40  ! 5: SDIVX_I	sdivx	%r5, 0x0d40, %r22
	.word 0xb321ef51  ! 5: MULScc_I	mulscc 	%r7, 0x0f51, %r25
	.word 0xae512446  ! 5: UMUL_I	umul 	%r4, 0x0446, %r23
	.word 0xb7a000ea  ! 5: FNEGq	dis not found

	.word 0xb879400a  ! 5: SDIV_R	sdiv 	%r5, %r10, %r28
	.word 0xb16960e9  ! 5: SDIVX_I	sdivx	%r5, 0x00e9, %r24
	.word 0xbc7a000f  ! 5: SDIV_R	sdiv 	%r8, %r15, %r30
	.word 0x2b800001  ! 5: FBUG	fbug,a	<label_0x1>
	.word 0xa848e8f0  ! 5: MULX_I	mulx 	%r3, 0x08f0, %r20
	.word 0xb471000c  ! 5: UDIV_R	udiv 	%r4, %r12, %r26
	.word 0xada0056a  ! 5: FSQRTq	fsqrt	
	.word 0xb249a61e  ! 5: MULX_I	mulx 	%r6, 0x061e, %r25
	.word 0xbc48aa9c  ! 5: MULX_I	mulx 	%r2, 0x0a9c, %r30
	.word 0xb4592b9b  ! 5: SMUL_I	smul 	%r4, 0x0b9b, %r26
	.word 0xb769c00c  ! 5: SDIVX_R	sdivx	%r7, %r12, %r27
	.word 0xb671c00e  ! 5: UDIV_R	udiv 	%r7, %r14, %r27
	.word 0xbd21c00c  ! 5: MULScc_R	mulscc 	%r7, %r12, %r30
	.word 0xaf68800b  ! 5: SDIVX_R	sdivx	%r2, %r11, %r23
	.word 0xb8f1000f  ! 5: UDIVcc_R	udivcc 	%r4, %r15, %r28
	.word 0xb1b1ce6c  ! 5: FXNORS	fxnors	%r7, %r12, %r24
	.word 0xac70800d  ! 5: UDIV_R	udiv 	%r2, %r13, %r22
	.word 0xb2d96d09  ! 5: SMULcc_I	smulcc 	%r5, 0x0d09, %r25
	.word 0xb1a80c2a  ! 5: FMOVRLZ	dis not found

	.word 0x11400001  ! 5: FBPA	fba
	.word 0xaaf0ae7e  ! 5: UDIVcc_I	udivcc 	%r2, 0x0e7e, %r21
	.word 0xa850c00a  ! 5: UMUL_R	umul 	%r3, %r10, %r20
	.word 0xb3aa082d  ! 5: FMOVA	fmovs	%fcc1, %f13, %f25
	.word 0xaf20c00d  ! 5: MULScc_R	mulscc 	%r3, %r13, %r23
	.word 0xb969000c  ! 5: SDIVX_R	sdivx	%r4, %r12, %r28
	.word 0xb1a0110b  ! 5: FxTOd	dis not found

	.word 0xb4d1c00e  ! 5: UMULcc_R	umulcc 	%r7, %r14, %r26
	.word 0xaad1ae08  ! 5: UMULcc_I	umulcc 	%r6, 0x0e08, %r21
	.word 0xb5a149ac  ! 5: FDIVs	fdivs	%f5, %f12, %f26
	.word 0xaed1000c  ! 5: UMULcc_R	umulcc 	%r4, %r12, %r23
	.word 0xaa51000f  ! 5: UMUL_R	umul 	%r4, %r15, %r21
	.word 0xb478800d  ! 5: SDIV_R	sdiv 	%r2, %r13, %r26
	.word 0xb9b1ce6b  ! 5: FXNORS	fxnors	%r7, %r11, %r28
	.word 0xbc72000d  ! 5: UDIV_R	udiv 	%r8, %r13, %r30
	.word 0xb2492435  ! 5: MULX_I	mulx 	%r4, 0x0435, %r25
	.word 0xb96a27ba  ! 5: SDIVX_I	sdivx	%r8, 0x07ba, %r28
	.word 0xb768c00b  ! 5: SDIVX_R	sdivx	%r3, %r11, %r27
	.word 0xaed9800f  ! 5: SMULcc_R	smulcc 	%r6, %r15, %r23
	.word 0x09800001  ! 5: FBL	fbl  	<label_0x1>
	.word 0xb851c00a  ! 5: UMUL_R	umul 	%r7, %r10, %r28
	.word 0xa869800b  ! 5: UDIVX_R	udivx 	%r6, %r11, %r20
	.word 0xb322000e  ! 5: MULScc_R	mulscc 	%r8, %r14, %r25
	.word 0xa969800e  ! 5: SDIVX_R	sdivx	%r6, %r14, %r20
	.word 0xa851400c  ! 5: UMUL_R	umul 	%r5, %r12, %r20
	.word 0xacf9e93b  ! 5: SDIVcc_I	sdivcc 	%r7, 0x093b, %r22
	.word 0x07800003  ! 5: FBUL	fbul  	<label_0x3>
	.word 0xb3222a47  ! 5: MULScc_I	mulscc 	%r8, 0x0a47, %r25
	.word 0xb721c00d  ! 5: MULScc_R	mulscc 	%r7, %r13, %r27
	.word 0xab222789  ! 5: MULScc_I	mulscc 	%r8, 0x0789, %r21
	.word 0xb268800a  ! 5: UDIVX_R	udivx 	%r2, %r10, %r25
	.word 0xa921400e  ! 5: MULScc_R	mulscc 	%r5, %r14, %r20
	.word 0xb849ee74  ! 5: MULX_I	mulx 	%r7, 0x0e74, %r28
	.word 0xb6f8e832  ! 5: SDIVcc_I	sdivcc 	%r3, 0x0832, %r27
	.word 0x03800001  ! 5: FBNE	fbne  	<label_0x1>
	.word 0xaba0014a  ! 5: FABSd	fabsd	%f10, %f52
	.word 0xb878c00c  ! 5: SDIV_R	sdiv 	%r3, %r12, %r28
	.word 0xaba1884e  ! 5: FADDd	faddd	%f6, %f14, %f52
	.word 0xa8d16895  ! 5: UMULcc_I	umulcc 	%r5, 0x0895, %r20
	.word 0xb071689e  ! 5: UDIV_I	udiv 	%r5, 0x089e, %r24
	.word 0xb2f1ee4e  ! 5: UDIVcc_I	udivcc 	%r7, 0x0e4e, %r25
	.word 0xad2226ca  ! 5: MULScc_I	mulscc 	%r8, 0x06ca, %r22
	.word 0xb1a8142e  ! 5: FMOVRNZ	dis not found

	.word 0xbcf92e92  ! 5: SDIVcc_I	sdivcc 	%r4, 0x0e92, %r30
	.word 0xb471c00b  ! 5: UDIV_R	udiv 	%r7, %r11, %r26
	.word 0xacd96a3f  ! 5: SMULcc_I	smulcc 	%r5, 0x0a3f, %r22
	.word 0xb320800d  ! 5: MULScc_R	mulscc 	%r2, %r13, %r25
	.word 0xbdab082b  ! 5: FMOVGU	fmovs	%fcc1, %f11, %f30
	.word 0x87a90a2a  ! 5: FCMPs	fcmps	%fcc<n>, %f4, %f10
	.word 0xbcd92b84  ! 5: SMULcc_I	smulcc 	%r4, 0x0b84, %r30
	.word 0xac69c00a  ! 5: UDIVX_R	udivx 	%r7, %r10, %r22
	.word 0xa8522aac  ! 5: UMUL_I	umul 	%r8, 0x0aac, %r20
	.word 0xada0006c  ! 5: FMOVq	dis not found

	.word 0xb278800c  ! 5: SDIV_R	sdiv 	%r2, %r12, %r25
	.word 0x3f400001  ! 5: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0xa9a8042e  ! 5: FMOVRZ	dis not found

	.word 0xaba019cb  ! 5: FdTOq	dis not found

	.word 0xada0102a  ! 5: FsTOx	dis not found

	.word 0xbd6920ca  ! 5: SDIVX_I	sdivx	%r4, 0x00ca, %r30
	.word 0xae69234a  ! 5: UDIVX_I	udivx 	%r4, 0x034a, %r23
	.word 0xbba0894d  ! 5: FMULd	fmuld	%f2, %f44, %f60
	.word 0xada000af  ! 5: FNEGs	fnegs	%f15, %f22
	.word 0xae71800f  ! 5: UDIV_R	udiv 	%r6, %r15, %r23
	.word 0xb7a9882d  ! 5: FMOVNEG	fmovs	%fcc1, %f13, %f27
	.word 0xaad8800f  ! 5: SMULcc_R	smulcc 	%r2, %r15, %r21
	.word 0xb8722361  ! 5: UDIV_I	udiv 	%r8, 0x0361, %r28
	.word 0xab6a26b5  ! 5: SDIVX_I	sdivx	%r8, 0x06b5, %r21
	.word 0xb4f9800b  ! 5: SDIVcc_R	sdivcc 	%r6, %r11, %r26
	.word 0xb9a000ad  ! 5: FNEGs	fnegs	%f13, %f28
	.word 0xaba0054e  ! 5: FSQRTd	fsqrt	
	.word 0xba4a2ea6  ! 5: MULX_I	mulx 	%r8, 0x0ea6, %r29
	.word 0xa8f225f2  ! 5: UDIVcc_I	udivcc 	%r8, 0x05f2, %r20
	.word 0xaa48e15e  ! 5: MULX_I	mulx 	%r3, 0x015e, %r21
	.word 0xaed92141  ! 5: SMULcc_I	smulcc 	%r4, 0x0141, %r23
	.word 0xad21c00d  ! 5: MULScc_R	mulscc 	%r7, %r13, %r22
	.word 0xb859400a  ! 5: SMUL_R	smul 	%r5, %r10, %r28
	.word 0xb071000f  ! 5: UDIV_R	udiv 	%r4, %r15, %r24
	.word 0xaaf92306  ! 5: SDIVcc_I	sdivcc 	%r4, 0x0306, %r21
	.word 0xbc71c00b  ! 5: UDIV_R	udiv 	%r7, %r11, %r30
	.word 0xb2f9aecd  ! 5: SDIVcc_I	sdivcc 	%r6, 0x0ecd, %r25
	.word 0xb4d0e4d0  ! 5: UMULcc_I	umulcc 	%r3, 0x04d0, %r26
	.word 0xb369a2e7  ! 5: SDIVX_I	sdivx	%r6, 0x02e7, %r25
	.word 0xadaa082a  ! 5: FMOVA	fmovs	%fcc1, %f10, %f22
	.word 0xaa58a17d  ! 5: SMUL_I	smul 	%r2, 0x017d, %r21
	.word 0xb2d926b4  ! 5: SMULcc_I	smulcc 	%r4, 0x06b4, %r25
	.word 0xb1a0104c  ! 5: FdTOx	dis not found

	.word 0xab212c6a  ! 5: MULScc_I	mulscc 	%r4, 0x0c6a, %r21
	.word 0xb3a019af  ! 5: FsTOq	dis not found

	.word 0xb449e3b0  ! 5: MULX_I	mulx 	%r7, 0x03b0, %r26
	.word 0xb0d0800f  ! 5: UMULcc_R	umulcc 	%r2, %r15, %r24
	.word 0x29400003  ! 5: FBPL	fbl,a,pn	%fcc0, <label_0x3>
	.word 0xb7a1c9ca  ! 5: FDIVd	fdivd	%f38, %f10, %f58
	.word 0x11400001  ! 5: FBPA	fba
	.word 0xb250c00a  ! 5: UMUL_R	umul 	%r3, %r10, %r25
	.word 0x87a8caca  ! 5: FCMPEd	fcmped	%fcc<n>, %f34, %f10
	.word 0xb7a1492d  ! 5: FMULs	fmuls	%f5, %f13, %f27
	.word 0xb672000d  ! 5: UDIV_R	udiv 	%r8, %r13, %r27
	.word 0xb5a0004e  ! 5: FMOVd	fmovd	%f14, %f26
	.word 0xacf1800b  ! 5: UDIVcc_R	udivcc 	%r6, %r11, %r22
	.word 0xb4f1000c  ! 5: UDIVcc_R	udivcc 	%r4, %r12, %r26
	.word 0xaaf0a0b4  ! 5: UDIVcc_I	udivcc 	%r2, 0x00b4, %r21
	.word 0xb0592001  ! 5: SMUL_I	smul 	%r4, 0x0001, %r24
	.word 0xae70c00e  ! 5: UDIV_R	udiv 	%r3, %r14, %r23
	.word 0xba6a27b1  ! 5: UDIVX_I	udivx 	%r8, 0x07b1, %r29
	.word 0xaef1a2ac  ! 5: UDIVcc_I	udivcc 	%r6, 0x02ac, %r23
	.word 0xa9a0004a  ! 5: FMOVd	fmovd	%f10, %f20
	.word 0xbcf8e987  ! 5: SDIVcc_I	sdivcc 	%r3, 0x0987, %r30
	.word 0xb8d9400e  ! 5: SMULcc_R	smulcc 	%r5, %r14, %r28
	.word 0xb3a01a4f  ! 5: FdTOi	dis not found

	.word 0xb671800e  ! 5: UDIV_R	udiv 	%r6, %r14, %r27
	.word 0xae4a2282  ! 5: MULX_I	mulx 	%r8, 0x0282, %r23
	.word 0xb3a208ae  ! 5: FSUBs	fsubs	%f8, %f14, %f25
	.word 0xb8f1400f  ! 5: UDIVcc_R	udivcc 	%r5, %r15, %r28
	.word 0x2d400001  ! 5: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0xaf68800a  ! 5: SDIVX_R	sdivx	%r2, %r10, %r23
	.word 0xb9a089ce  ! 5: FDIVd	fdivd	%f2, %f14, %f28
	.word 0x15800001  ! 5: FBUE	fbue  	<label_0x1>
	.word 0x33400001  ! 5: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0xa8d9c00c  ! 5: SMULcc_R	smulcc 	%r7, %r12, %r20
	.word 0xaa78800e  ! 5: SDIV_R	sdiv 	%r2, %r14, %r21
	.word 0x07800001  ! 5: FBUL	fbul  	<label_0x1>
	.word 0x07800003  ! 5: FBUL	fbul  	<label_0x3>
	.word 0xac4a000b  ! 5: MULX_R	mulx 	%r8, %r11, %r22
	.word 0xb369800b  ! 5: SDIVX_R	sdivx	%r6, %r11, %r25
	.word 0xacf1273d  ! 5: UDIVcc_I	udivcc 	%r4, 0x073d, %r22
	.word 0xaba8182b  ! 5: FMOVRGZ	fmovs	%fcc3, %f11, %f21
	.word 0xb9a1c84e  ! 5: FADDd	faddd	%f38, %f14, %f28
	.word 0xb521400b  ! 5: MULScc_R	mulscc 	%r5, %r11, %r26
	.word 0xb0d1e782  ! 5: UMULcc_I	umulcc 	%r7, 0x0782, %r24
	.word 0xb1a01a4e  ! 5: FdTOi	dis not found

	.word 0xb6596df8  ! 5: SMUL_I	smul 	%r5, 0x0df8, %r27
	.word 0xb6592795  ! 5: SMUL_I	smul 	%r4, 0x0795, %r27
	.word 0xac79000f  ! 5: SDIV_R	sdiv 	%r4, %r15, %r22
	.word 0xb92162be  ! 5: MULScc_I	mulscc 	%r5, 0x02be, %r28
	.word 0xaad1c00e  ! 5: UMULcc_R	umulcc 	%r7, %r14, %r21
	.word 0xad21ea3e  ! 5: MULScc_I	mulscc 	%r7, 0x0a3e, %r22
	.word 0xb270ac56  ! 5: UDIV_I	udiv 	%r2, 0x0c56, %r25
	.word 0xae5229f2  ! 5: UMUL_I	umul 	%r8, 0x09f2, %r23
	.word 0xbba8042b  ! 5: FMOVRZ	dis not found

	.word 0xbba0004f  ! 5: FMOVd	fmovd	%f46, %f60
	.word 0xb6da000f  ! 5: SMULcc_R	smulcc 	%r8, %r15, %r27
	.word 0xaed0800b  ! 5: UMULcc_R	umulcc 	%r2, %r11, %r23
	.word 0xb56a2ca6  ! 5: SDIVX_I	sdivx	%r8, 0x0ca6, %r26
	.word 0xac69c00c  ! 5: UDIVX_R	udivx 	%r7, %r12, %r22
	.word 0xba51c00e  ! 5: UMUL_R	umul 	%r7, %r14, %r29
	.word 0xaa70a3a1  ! 5: UDIV_I	udiv 	%r2, 0x03a1, %r21
	.word 0xb859e5b5  ! 5: SMUL_I	smul 	%r7, 0x05b5, %r28
	.word 0xb7a01a2e  ! 5: FsTOi	dis not found

	.word 0xb6f0800c  ! 5: UDIVcc_R	udivcc 	%r2, %r12, %r27
	.word 0xacf9e2ec  ! 5: SDIVcc_I	sdivcc 	%r7, 0x02ec, %r22
	.word 0xb648afa3  ! 5: MULX_I	mulx 	%r2, 0x0fa3, %r27
	.word 0xb2d0c00d  ! 5: UMULcc_R	umulcc 	%r3, %r13, %r25
	.word 0xb769400a  ! 5: SDIVX_R	sdivx	%r5, %r10, %r27
	.word 0xb851400e  ! 5: UMUL_R	umul 	%r5, %r14, %r28
	.word 0xafb0ce6c  ! 5: FXNORS	fxnors	%r3, %r12, %r23
	.word 0xacda2575  ! 5: SMULcc_I	smulcc 	%r8, 0x0575, %r22
	.word 0xb85221fd  ! 5: UMUL_I	umul 	%r8, 0x01fd, %r28
	.word 0xb8d1000f  ! 5: UMULcc_R	umulcc 	%r4, %r15, %r28
	.word 0xab69000b  ! 5: SDIVX_R	sdivx	%r4, %r11, %r21
	.word 0x2d800001  ! 5: FBG	fbg,a	<label_0x1>
	.word 0xb8522620  ! 5: UMUL_I	umul 	%r8, 0x0620, %r28
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0xd065b2f722af1f25, %r16, %r16
	setx  0x2ab93f119b4614bd, %r16, %r17
	setx  0x7a3d25aeaa4e0b01, %r16, %r18
	setx  0xa5c6820744dd525a, %r16, %r19
	setx  0x918c2bf8173a988b, %r16, %r20
	setx  0x8b7761a7416088d5, %r16, %r21
	setx  0x112fbef059a6c703, %r16, %r22
	setx  0xfc08eccf8469b7fb, %r16, %r23
	setx  0x1b205a2d74a61c45, %r16, %r24
	setx  0x7c08c3c02d85b1f8, %r16, %r25
	setx  0x8eca33ab45dc3ef9, %r16, %r26
	setx  0xccd58b9dd8ad5430, %r16, %r27
	setx  0x7af3008e151c8630, %r16, %r28
	setx  0xce320cd69cc668ec, %r16, %r29
	setx  0x818677c6557d757b, %r16, %r30
	setx  0x3f667673ebba8792, %r16, %r31
	setx  0x00000000000004a0, %r16, %r10
	setx  0x00000000000008f0, %r16, %r11
	setx  0x00000000000000a0, %r16, %r12
	setx  0x0000000000000db0, %r16, %r13
	setx  0x0000000000000b60, %r16, %r14
	setx  0x0000000000000330, %r16, %r15
	setx  0x0000000000000c11, %r16, %r9
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
	.word 0xbc10aacc  ! 6: OR_I	or 	%r2, 0x0acc, %r30
	.word 0xa800800b  ! 6: ADD_R	add 	%r2, %r11, %r20
	.word 0xa8b8c00e  ! 6: XNORcc_R	xnorcc 	%r3, %r14, %r20
	.word 0xa831000f  ! 6: ORN_R	orn 	%r4, %r15, %r20
	.word 0xb528900c  ! 6: SLLX_R	sllx	%r2, %r12, %r26
	.word 0xbcb1000a  ! 7: ORNcc_R	orncc 	%r4, %r10, %r30
	setx  0x09efe135be5e42a4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf870c00b  ! 9: STX_R	stx	%r28, [%r3 + %r11]
	.word 0xf428eec1  ! 9: STB_I	stb	%r26, [%r3 + 0x0ec1]
	.word 0xf2216138  ! 9: STW_I	stw	%r25, [%r5 + 0x0138]
	.word 0xf828a261  ! 9: STB_I	stb	%r28, [%r2 + 0x0261]
	.word 0xfc32000f  ! 9: STH_R	sth	%r30, [%r8 + %r15]
	.word 0xec70afed  ! 9: STX_I	stx	%r22, [%r2 + 0x0fed]
	.word 0xf231400e  ! 9: STH_R	sth	%r25, [%r5 + %r14]
	.word 0xec71000d  ! 9: STX_R	stx	%r22, [%r4 + %r13]
	.word 0xf828c00d  ! 9: STB_R	stb	%r28, [%r3 + %r13]
	.word 0xfc29800e  ! 9: STB_R	stb	%r30, [%r6 + %r14]
	.word 0xfc22000d  ! 9: STW_R	stw	%r30, [%r8 + %r13]
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 10: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xf231eeee  ! 12: STH_I	sth	%r25, [%r7 + 0x0eee]
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xb8b1c00f  ! 15: ORNcc_R	orncc 	%r7, %r15, %r28
	.word 0xaf64180d  ! 17: MOVcc_R	<illegal instruction>
	.word 0xb1322001  ! 19: SRL_I	srl 	%r8, 0x0001, %r24
	.word 0xb630a2c5  ! 21: SUBC_I	orn 	%r2, 0x02c5, %r27
	.word 0xae2a000a  ! 23: ANDN_R	andn 	%r8, %r10, %r23
	.word 0xb638800a  ! 25: XNOR_R	xnor 	%r2, %r10, %r27
	.word 0xbab2000d  ! 27: ORNcc_R	orncc 	%r8, %r13, %r29
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xac01c00e  ! 31: ADD_R	add 	%r7, %r14, %r22
	setx  0x7a6fb2ff710937e4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xbdc44000  ! 34: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xb7a0192e  ! 35: FsTOd	dis not found

	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb938c00e  ! 38: SRA_R	sra 	%r3, %r14, %r28
	setx  0xe2cf89a29917fd0a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xb9c44040  ! 41: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb7a000af  ! 42: FNEGs	fnegs	%f15, %f27
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0xc87f8960908a28be, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,60)
	.word 0xf000c000  ! 47: LDUW_R	lduw	[%r3 + %r0], %r24
	.word 0xbdc44040  ! 49: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xaea92a5d  ! 52: ANDNcc_I	andncc 	%r4, 0x0a5d, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb291400a  ! 56: ORcc_R	orcc 	%r5, %r10, %r25
	setx  0x99afa2f0ea7c3706, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xfc21c00c  ! 58: STW_R	stw	%r30, [%r7 + %r12]
	.word 0xee31eafd  ! 58: STH_I	sth	%r23, [%r7 + 0x0afd]
	.word 0xec70800c  ! 58: STX_R	stx	%r22, [%r2 + %r12]
	.word 0xea31a2c3  ! 58: STH_I	sth	%r21, [%r6 + 0x02c3]
	.word 0xf871000f  ! 58: STX_R	stx	%r28, [%r4 + %r15]
	.word 0xec31800e  ! 58: STH_R	sth	%r22, [%r6 + %r14]
	.word 0xe821e56f  ! 58: STW_I	stw	%r20, [%r7 + 0x056f]
	.word 0xfa28a62d  ! 58: STB_I	stb	%r29, [%r2 + 0x062d]
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xbdc44000  ! 59: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xf472008d
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xba20800f  ! 64: SUB_R	sub 	%r2, %r15, %r29
	.word 0xad79c40f  ! 66: MOVR_R	move	%r7, %r15, %r22
	.word 0xb200e655  ! 68: ADD_I	add 	%r3, 0x0655, %r25
	.word 0xaa31eaaf  ! 70: SUBC_I	orn 	%r7, 0x0aaf, %r21
	.word 0xb4892f26  ! 72: ANDcc_I	andcc 	%r4, 0x0f26, %r26
	.word 0xaa9927c0  ! 74: XORcc_I	xorcc 	%r4, 0x07c0, %r21
	.word 0xb538b001  ! 76: SRAX_I	srax	%r2, 0x0001, %r26
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb418ea82  ! 80: XOR_I	xor 	%r3, 0x0a82, %r26
	setx  0xa55ff38340f91b55, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xb9c44000  ! 83: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb8f22bfb  ! 84: UDIVcc_I	udivcc 	%r8, 0x0bfb, %r28
	.word 0xbcb1000d  ! 87: ORNcc_R	orncc 	%r4, %r13, %r30
	setx  0x0aef6f9491deaaa5, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xbbc44000  ! 90: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xa8f22394  ! 91: UDIVcc_I	udivcc 	%r8, 0x0394, %r20
	setx  0x85ff2b99afac2aa2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,46)
	.word 0xfa51c000  ! 95: LDSH_R	ldsh	[%r7 + %r0], %r29
	.word 0xbbc44040  ! 97: JMPL_R	jmpl	%r17 + %r0, %r29
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaf396001  ! 104: SRA_I	sra 	%r5, 0x0001, %r23
	setx  0xfb1fe5e29f7aaeb9, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb5c44000  ! 107: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xae50c00a  ! 108: UMUL_R	umul 	%r3, %r10, %r23
	.word 0xa89169a6  ! 110: ORcc_I	orcc 	%r5, 0x09a6, %r20
	.word 0xa891800c  ! 110: ORcc_R	orcc 	%r6, %r12, %r20
	.word 0xb040800e  ! 110: ADDC_R	addc 	%r2, %r14, %r24
	.word 0xb0b9000b  ! 110: XNORcc_R	xnorcc 	%r4, %r11, %r24
	.word 0xb68a000a  ! 111: ANDcc_R	andcc 	%r8, %r10, %r27
	.word 0xae11800f  ! 111: OR_R	or 	%r6, %r15, %r23
	.word 0xbaa8a9fb  ! 111: ANDNcc_I	andncc 	%r2, 0x09fb, %r29
	.word 0xaf39d00a  ! 111: SRAX_R	srax	%r7, %r10, %r23
	.word 0xaa2a2450  ! 111: ANDN_I	andn 	%r8, 0x0450, %r21
	setx  0xdf6fc7215bf8d8ce, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,61)
	.word 0xea418000  ! 114: LDSW_R	ldsw	[%r6 + %r0], %r21
	.word 0xb5c44040  ! 116: JMPL_R	jmpl	%r17 + %r0, %r26
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xb811800a  ! 119: OR_R	or 	%r6, %r10, %r28
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xac11657e  ! 123: OR_I	or 	%r5, 0x057e, %r22
	setx  0xec2f4f010951e1e3, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xb5c44000  ! 126: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xaef0ebcf  ! 127: UDIVcc_I	udivcc 	%r3, 0x0bcf, %r23
	setx  0x140ffb2307f5ca32, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,49)
	.word 0xe8510000  ! 131: LDSH_R	ldsh	[%r4 + %r0], %r20
	.word 0xb5c44000  ! 133: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xa938f001  ! 136: SRAX_I	srax	%r3, 0x0001, %r20
	.word 0xba32000b  ! 138: ORN_R	orn 	%r8, %r11, %r29
	.word 0xaac0c00f  ! 138: ADDCcc_R	addccc 	%r3, %r15, %r21
	.word 0xbb39d00e  ! 138: SRAX_R	srax	%r7, %r14, %r29
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xbcc12585  ! 141: ADDCcc_I	addccc 	%r4, 0x0585, %r30
	setx  0x924fefdeef8fad6e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xafc44000  ! 144: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb84a000b  ! 145: MULX_R	mulx 	%r8, %r11, %r28
	setx  0x8fffbeb288a4647b, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,69)
	.word 0xfa41c000  ! 149: LDSW_R	ldsw	[%r7 + %r0], %r29
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 151: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xaeb0c00d  ! 154: ORNcc_R	orncc 	%r3, %r13, %r23
	.word 0xa82a2807  ! 157: ANDN_I	andn 	%r8, 0x0807, %r20
	setx  0x130f32a4f2bcd12d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 160: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xbb20eee3  ! 161: MULScc_I	mulscc 	%r3, 0x0ee3, %r29
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb01a2e21  ! 164: XOR_I	xor 	%r8, 0x0e21, %r24
	setx  0xcd7f23062e4a9c5c, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xec322649  ! 166: STH_I	sth	%r22, [%r8 + 0x0649]
	.word 0xec29e1b8  ! 166: STB_I	stb	%r22, [%r7 + 0x01b8]
	.word 0xf831231e  ! 166: STH_I	sth	%r28, [%r4 + 0x031e]
	.word 0xfa31400d  ! 166: STH_R	sth	%r29, [%r5 + %r13]
	.word 0xe8292ae9  ! 166: STB_I	stb	%r20, [%r4 + 0x0ae9]
	.word 0xee21a503  ! 166: STW_I	stw	%r23, [%r6 + 0x0503]
	.word 0xf029e282  ! 166: STB_I	stb	%r24, [%r7 + 0x0282]
	.word 0xfa31400c  ! 166: STH_R	sth	%r29, [%r5 + %r12]
	.word 0xfc29c00c  ! 166: STB_R	stb	%r30, [%r7 + %r12]
	.word 0xf62163a8  ! 166: STW_I	stw	%r27, [%r5 + 0x03a8]
	.word 0xfa71654a  ! 166: STX_I	stx	%r29, [%r5 + 0x054a]
	.word 0xec72000f  ! 166: STX_R	stx	%r22, [%r8 + %r15]
	.word 0xb7c44000  ! 167: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xf472008d
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xba00808c
	.word 0xb029c00a  ! 172: ANDN_R	andn 	%r7, %r10, %r24
	.word 0xae096f86  ! 174: AND_I	and 	%r5, 0x0f86, %r23
	.word 0xba18c00c  ! 176: XOR_R	xor 	%r3, %r12, %r29
	.word 0xb379a401  ! 178: MOVR_I	move	%r6, 0x7fffbc90, %r25
	.word 0xb891c00b  ! 180: ORcc_R	orcc 	%r7, %r11, %r28
	.word 0xaca9400b  ! 182: ANDNcc_R	andncc 	%r5, %r11, %r22
	.word 0xb4c0eacb  ! 184: ADDCcc_I	addccc 	%r3, 0x0acb, %r26
	.word 0xa929500d  ! 184: SLLX_R	sllx	%r5, %r13, %r20
	.word 0xbd39400c  ! 184: SRA_R	sra 	%r5, %r12, %r30
	.word 0xa8b9000a  ! 184: XNORcc_R	xnorcc 	%r4, %r10, %r20
	.word 0xa938a001  ! 184: SRA_I	sra 	%r2, 0x0001, %r20
	.word 0xba31400c  ! 186: SUBC_R	orn 	%r5, %r12, %r29
	setx  0xa50fc422c467b374, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 189: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb0da2639  ! 190: SMULcc_I	smulcc 	%r8, 0x0639, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb2b8800d  ! 194: XNORcc_R	xnorcc 	%r2, %r13, %r25
	.word 0xb680a96b  ! 194: ADDcc_I	addcc 	%r2, 0x096b, %r27
	.word 0xb9297001  ! 194: SLLX_I	sllx	%r5, 0x0001, %r28
	.word 0xb72a100e  ! 195: SLLX_R	sllx	%r8, %r14, %r27
	.word 0xb81a000b  ! 195: XOR_R	xor 	%r8, %r11, %r28
	.word 0xbab1666c  ! 195: ORNcc_I	orncc 	%r5, 0x066c, %r29
	.word 0xbc18e25f  ! 195: XOR_I	xor 	%r3, 0x025f, %r30
	setx  0x3e7ff7e3b59d3818, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,6)
	.word 0xf211c000  ! 198: LDUH_R	lduh	[%r7 + %r0], %r25
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xafc44040  ! 200: JMPL_R	jmpl	%r17 + %r0, %r23
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb2b1aa9f  ! 206: ORNcc_I	orncc 	%r6, 0x0a9f, %r25
	setx  0x540fca78c72ff8c9, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xb9c44000  ! 209: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb249a01e  ! 210: MULX_I	mulx 	%r6, 0x001e, %r25
	.word 0xaa91400b  ! 212: ORcc_R	orcc 	%r5, %r11, %r21
	setx  0x9f8f4336e7259752, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf429e722  ! 214: STB_I	stb	%r26, [%r7 + 0x0722]
	.word 0xec2920b0  ! 214: STB_I	stb	%r22, [%r4 + 0x00b0]
	.word 0xfc70800b  ! 214: STX_R	stx	%r30, [%r2 + %r11]
	.word 0xe8296881  ! 214: STB_I	stb	%r20, [%r5 + 0x0881]
	.word 0xe871a1c4  ! 214: STX_I	stx	%r20, [%r6 + 0x01c4]
	.word 0xfc712071  ! 214: STX_I	stx	%r30, [%r4 + 0x0071]
	.word 0xf43221c1  ! 214: STH_I	sth	%r26, [%r8 + 0x01c1]
	.word 0xf021000b  ! 214: STW_R	stw	%r24, [%r4 + %r11]
	.word 0xee29a1a1  ! 214: STB_I	stb	%r23, [%r6 + 0x01a1]
	.word 0xec31af3d  ! 214: STH_I	sth	%r22, [%r6 + 0x0f3d]
	.word 0xfa29000e  ! 214: STB_R	stb	%r29, [%r4 + %r14]
	.word 0xea29e5f7  ! 214: STB_I	stb	%r21, [%r7 + 0x05f7]
	.word 0xb3c44040  ! 215: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xf6322d12  ! 217: STH_I	sth	%r27, [%r8 + 0x0d12]
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xba00808c
	.word 0xaf29500e  ! 221: SLLX_R	sllx	%r5, %r14, %r23
	.word 0xb6392bee  ! 223: XNOR_I	xnor 	%r4, 0x0bee, %r27
	.word 0xb73a3001  ! 225: SRAX_I	srax	%r8, 0x0001, %r27
	.word 0xb018a8d2  ! 227: XOR_I	xor 	%r2, 0x08d2, %r24
	.word 0xb299a88a  ! 229: XORcc_I	xorcc 	%r6, 0x088a, %r25
	.word 0xbd3a2001  ! 231: SRA_I	sra 	%r8, 0x0001, %r30
	setx  0xb46f707f0e0f045b, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,28)
	.word 0xfa58c000  ! 235: LDX_R	ldx	[%r3 + %r0], %r29
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xbbc44040  ! 237: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb7317001  ! 240: SRLX_I	srlx	%r5, 0x0001, %r27
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0xf5ef074bb1728d4a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,58)
	.word 0xec520000  ! 245: LDSH_R	ldsh	[%r8 + %r0], %r22
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 247: JMPL_R	jmpl	%r17 + %r0, %r25
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR,10,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x584fb5a3430df2ca, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,8)
	.word 0xec5a0000  ! 255: LDX_R	ldx	[%r8 + %r0], %r22
	.word 0xbdc44000  ! 257: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xae99000f  ! 260: XORcc_R	xorcc 	%r4, %r15, %r23
	setx  0x493f9e62349ef1c1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,51)
	.word 0xf450c000  ! 264: LDSH_R	ldsh	[%r3 + %r0], %r26
	.word 0xb1c44000  ! 266: JMPL_R	jmpl	%r17 + %r0, %r24
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xba00808c
	setx  0x8a7fa96be1dd7aaa, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,35)
	.word 0xf458c000  ! 272: LDX_R	ldx	[%r3 + %r0], %r26
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xafc44000  ! 274: JMPL_R	jmpl	%r17 + %r0, %r23
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xb090c00b  ! 277: ORcc_R	orcc 	%r3, %r11, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb69221ea  ! 281: ORcc_I	orcc 	%r8, 0x01ea, %r27
	setx  0x888f78e3081e6000, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 285: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xba00808c
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0x0a2fbab80f831493, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,24)
	.word 0xea408000  ! 293: LDSW_R	ldsw	[%r2 + %r0], %r21
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 295: JMPL_R	jmpl	%r17 + %r0, %r21
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xa828ec8b  ! 298: ANDN_I	andn 	%r3, 0x0c8b, %r20
	.word 0xbd7a2401  ! 301: MOVR_I	move	%r8, 0x7fffbc90, %r30
	setx  0x197f7e9b86d7037a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 304: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xb2f1400f  ! 305: UDIVcc_R	udivcc 	%r5, %r15, %r25
	.word 0xac01400e  ! 308: ADD_R	add 	%r5, %r14, %r22
	setx  0x8b2f0ee592fd293d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xa9c44040  ! 311: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xaf21000c  ! 312: MULScc_R	mulscc 	%r4, %r12, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xab64180f  ! 315: MOVcc_R	<illegal instruction>
	setx  0xb3cf29ec2cc2bb18, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
	.word 0xbdc44000  ! 319: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xb0a9000d  ! 322: ANDNcc_R	andncc 	%r4, %r13, %r24
	.word 0xaa10acbc  ! 324: OR_I	or 	%r2, 0x0cbc, %r21
	setx  0xb8cf34b34f5108de, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf229400b  ! 326: STB_R	stb	%r25, [%r5 + %r11]
	.word 0xea292a32  ! 326: STB_I	stb	%r21, [%r4 + 0x0a32]
	.word 0xfa70e4dc  ! 326: STX_I	stx	%r29, [%r3 + 0x04dc]
	.word 0xfa29c00a  ! 326: STB_R	stb	%r29, [%r7 + %r10]
	.word 0xf632000a  ! 326: STH_R	sth	%r27, [%r8 + %r10]
	.word 0xf822227c  ! 326: STW_I	stw	%r28, [%r8 + 0x027c]
	.word 0xf820800c  ! 326: STW_R	stw	%r28, [%r2 + %r12]
	.word 0xee30800d  ! 326: STH_R	sth	%r23, [%r2 + %r13]
	.word 0xea7123a7  ! 326: STX_I	stx	%r21, [%r4 + 0x03a7]
	.word 0xfa70c00b  ! 326: STX_R	stx	%r29, [%r3 + %r11]
	.word 0xe872000c  ! 326: STX_R	stx	%r20, [%r8 + %r12]
	.word 0xa9c44040  ! 327: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xf472008d
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,IR,12,x)
	.word 0xba00808c
	.word 0xae32000b  ! 332: ORN_R	orn 	%r8, %r11, %r23
	.word 0xa841400c  ! 334: ADDC_R	addc 	%r5, %r12, %r20
	.word 0xac41299a  ! 336: ADDC_I	addc 	%r4, 0x099a, %r22
	.word 0xb2aa000a  ! 338: ANDNcc_R	andncc 	%r8, %r10, %r25
	.word 0xbd31e001  ! 340: SRL_I	srl 	%r7, 0x0001, %r30
	.word 0xae8967bd  ! 342: ANDcc_I	andcc 	%r5, 0x07bd, %r23
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x5abfc8e50400907a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,2)
	.word 0xec108000  ! 347: LDUH_R	lduh	[%r2 + %r0], %r22
	.word 0xb3c44040  ! 349: JMPL_R	jmpl	%r17 + %r0, %r25
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xb7297001  ! 352: SLLX_I	sllx	%r5, 0x0001, %r27
	.word 0xb4916b27  ! 354: ORcc_I	orcc 	%r5, 0x0b27, %r26
	.word 0xb290800e  ! 354: ORcc_R	orcc 	%r2, %r14, %r25
	.word 0xb411400a  ! 354: OR_R	or 	%r5, %r10, %r26
	.word 0xaa28aa1b  ! 356: ANDN_I	andn 	%r2, 0x0a1b, %r21
	setx  0x4d9f5bd88dedb457, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xa9c44000  ! 359: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xae51000a  ! 360: UMUL_R	umul 	%r4, %r10, %r23
	.word 0xb4396da6  ! 363: XNOR_I	xnor 	%r5, 0x0da6, %r26
	setx  0xaa5fa61d6fe8ca45, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 366: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xac51ee4c  ! 367: UMUL_I	umul 	%r7, 0x0e4c, %r22
	.word 0xbb38900b  ! 369: SRAX_R	srax	%r2, %r11, %r29
	setx  0x1b7fe8e98c1676a1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf8716c2d  ! 371: STX_I	stx	%r28, [%r5 + 0x0c2d]
	.word 0xf628800f  ! 371: STB_R	stb	%r27, [%r2 + %r15]
	.word 0xf431800a  ! 371: STH_R	sth	%r26, [%r6 + %r10]
	.word 0xe831000a  ! 371: STH_R	sth	%r20, [%r4 + %r10]
	.word 0xec20a8bb  ! 371: STW_I	stw	%r22, [%r2 + 0x08bb]
	.word 0xfa29ea5c  ! 371: STB_I	stb	%r29, [%r7 + 0x0a5c]
	.word 0xf230800b  ! 371: STH_R	sth	%r25, [%r2 + %r11]
	.word 0xf831400c  ! 371: STH_R	sth	%r28, [%r5 + %r12]
	.word 0xf4316c23  ! 371: STH_I	sth	%r26, [%r5 + 0x0c23]
	.word 0xee20e5f1  ! 371: STW_I	stw	%r23, [%r3 + 0x05f1]
	.word 0xe830e532  ! 371: STH_I	sth	%r20, [%r3 + 0x0532]
	.word 0xe8212db4  ! 371: STW_I	stw	%r20, [%r4 + 0x0db4]
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 372: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xec716b1b  ! 374: STX_I	stx	%r22, [%r5 + 0x0b1b]
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xb928c00f  ! 377: SLL_R	sll 	%r3, %r15, %r28
	.word 0xa828efd6  ! 379: ANDN_I	andn 	%r3, 0x0fd6, %r20
	.word 0xaf28d00a  ! 381: SLLX_R	sllx	%r3, %r10, %r23
	.word 0xb230800e  ! 383: SUBC_R	orn 	%r2, %r14, %r25
	.word 0xa881c00c  ! 385: ADDcc_R	addcc 	%r7, %r12, %r20
	.word 0xbc0a000f  ! 387: AND_R	and 	%r8, %r15, %r30
	.word 0xbd297001  ! 389: SLLX_I	sllx	%r5, 0x0001, %r30
	.word 0xb618e51b  ! 391: XOR_I	xor 	%r3, 0x051b, %r27
	.word 0xaf316001  ! 391: SRL_I	srl 	%r5, 0x0001, %r23
	.word 0xbb31900c  ! 391: SRLX_R	srlx	%r6, %r12, %r29
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xb8b96ac3  ! 393: XNORcc_I	xnorcc 	%r5, 0x0ac3, %r28
	.word 0xb629400d  ! 393: ANDN_R	andn 	%r5, %r13, %r27
	.word 0xb378e401  ! 393: MOVR_I	move	%r3, 0xfffffeb0, %r25
	.word 0xaeb1800d  ! 393: ORNcc_R	orncc 	%r6, %r13, %r23
	.word 0xa801000f  ! 395: ADD_R	add 	%r4, %r15, %r20
	setx  0xb98f6baca20e3aac, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb9c44040  ! 398: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xac59400d  ! 399: SMUL_R	smul 	%r5, %r13, %r22
	.word 0xaf31c00a  ! 401: SRL_R	srl 	%r7, %r10, %r23
	.word 0xb028efda  ! 401: ANDN_I	andn 	%r3, 0x0fda, %r24
	.word 0xaea8a3c7  ! 401: ANDNcc_I	andncc 	%r2, 0x03c7, %r23
	.word 0xbb38800e  ! 401: SRA_R	sra 	%r2, %r14, %r29
	.word 0xb438ad58  ! 402: XNOR_I	xnor 	%r2, 0x0d58, %r26
	setx  0x6d9f39f35bbb08e9, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xbbc44000  ! 406: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xba00808c
	.word 0xb2c1c00b  ! 410: ADDCcc_R	addccc 	%r7, %r11, %r25
	.word 0xb840800c  ! 412: ADDC_R	addc 	%r2, %r12, %r28
	.word 0xb291efbb  ! 412: ORcc_I	orcc 	%r7, 0x0fbb, %r25
	.word 0xa979040b  ! 412: MOVR_R	move	%r4, %r11, %r20
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb9643801  ! 415: MOVcc_I	<illegal instruction>
	setx  0x29bf5e450c64d204, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 418: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xacf8a989  ! 419: SDIVcc_I	sdivcc 	%r2, 0x0989, %r22
	.word 0xb690ebb1  ! 421: ORcc_I	orcc 	%r3, 0x0bb1, %r27
	.word 0xba88a0c9  ! 421: ANDcc_I	andcc 	%r2, 0x00c9, %r29
	.word 0xaec1000a  ! 421: ADDCcc_R	addccc 	%r4, %r10, %r23
	.word 0xb7296001  ! 423: SLL_I	sll 	%r5, 0x0001, %r27
	setx  0x669f50c68faca007, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb5c44040  ! 426: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb0d0800a  ! 427: UMULcc_R	umulcc 	%r2, %r10, %r24
	.word 0xbd39500f  ! 430: SRAX_R	srax	%r5, %r15, %r30
	setx  0x0cef611c0f6a9687, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xadc44000  ! 433: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xacf1c00a  ! 434: UDIVcc_R	udivcc 	%r7, %r10, %r22
	.word 0xba09800a  ! 436: AND_R	and 	%r6, %r10, %r29
	.word 0xb889c00b  ! 436: ANDcc_R	andcc 	%r7, %r11, %r28
	.word 0xb091800b  ! 436: ORcc_R	orcc 	%r6, %r11, %r24
	.word 0xb2396e98  ! 436: XNOR_I	xnor 	%r5, 0x0e98, %r25
	.word 0xa8192023  ! 436: XOR_I	xor 	%r4, 0x0023, %r20
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0xcb3fef7d33f6a486, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,16)
	.word 0xf650c000  ! 440: LDSH_R	ldsh	[%r3 + %r0], %r27
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 442: JMPL_R	jmpl	%r17 + %r0, %r27
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,IR,31,x)
	.word 0xba00808c
	setx  0xf92f6e2b990fa30f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,60)
	.word 0xf600c000  ! 448: LDUW_R	lduw	[%r3 + %r0], %r27
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 450: JMPL_R	jmpl	%r17 + %r0, %r24
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xba91000e  ! 453: ORcc_R	orcc 	%r4, %r14, %r29
	.word 0xaa10c00e  ! 456: OR_R	or 	%r3, %r14, %r21
	setx  0xb8afb95baa6fc555, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xb9c44000  ! 459: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb122000e  ! 460: MULScc_R	mulscc 	%r8, %r14, %r24
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0xe56f9215e652bf16, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,68)
	.word 0xf0088000  ! 465: LDUB_R	ldub	[%r2 + %r0], %r24
	.word 0xb7c44000  ! 467: JMPL_R	jmpl	%r17 + %r0, %r27
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xbc31a1df  ! 470: ORN_I	orn 	%r6, 0x01df, %r30
	.word 0xa9316001  ! 472: SRL_I	srl 	%r5, 0x0001, %r20
	setx  0x1a4f3a132a344489, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 476: JMPL_R	jmpl	%r17 + %r0, %r21
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xac98800c  ! 479: XORcc_R	xorcc 	%r2, %r12, %r22
	setx  0x51cf9edf517dcf2f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,16)
	.word 0xfa090000  ! 483: LDUB_R	ldub	[%r4 + %r0], %r29
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xb5c44040  ! 485: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb130f001  ! 488: SRLX_I	srlx	%r3, 0x0001, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0xf80fd1d1e6dffac7, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,18)
	.word 0xf009c000  ! 493: LDUB_R	ldub	[%r7 + %r0], %r24
	.word 0xafc44040  ! 495: JMPL_R	jmpl	%r17 + %r0, %r23
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xb238c00d  ! 498: XNOR_R	xnor 	%r3, %r13, %r25
	setx  0x1caf5d6b52e1de4c, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,30)
	.word 0xfa114000  ! 502: LDUH_R	lduh	[%r5 + %r0], %r29
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xb9c44040  ! 504: JMPL_R	jmpl	%r17 + %r0, %r28
thr1_ic_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xb329c00f  ! 507: SLL_R	sll 	%r7, %r15, %r25
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb609c00c  ! 512: AND_R	and 	%r7, %r12, %r27
	setx  0xb0ff948cd03f95f1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xbbc44000  ! 515: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb650c00b  ! 516: UMUL_R	umul 	%r3, %r11, %r27
	.word 0xbaa9a5ca  ! 518: ANDNcc_I	andncc 	%r6, 0x05ca, %r29
	setx  0x82afa5deaa1f15d4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb5c44000  ! 522: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb979c40e  ! 524: MOVR_R	move	%r7, %r14, %r28
thr1_ic_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xbc216737  ! 527: SUB_I	sub 	%r5, 0x0737, %r30
	setx  0xa54ff249483a4381, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,24)
	.word 0xf2120000  ! 531: LDUH_R	lduh	[%r8 + %r0], %r25
	.word 0xb1c44000  ! 533: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xb211e1f6  ! 536: OR_I	or 	%r7, 0x01f6, %r25
	.word 0xa82a000c  ! 538: ANDN_R	andn 	%r8, %r12, %r20
	.word 0xbc99a7cb  ! 538: XORcc_I	xorcc 	%r6, 0x07cb, %r30
	.word 0xb532000a  ! 538: SRL_R	srl 	%r8, %r10, %r26
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x63afd3389240fb35, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,55)
	.word 0xf6508000  ! 544: LDSH_R	ldsh	[%r2 + %r0], %r27
	.word 0xb5c44040  ! 546: JMPL_R	jmpl	%r17 + %r0, %r26
thr1_ic_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xb80a2e7d  ! 549: AND_I	and 	%r8, 0x0e7d, %r28
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0x860f2489e4cc5dd0, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,64)
	.word 0xfa120000  ! 554: LDUH_R	lduh	[%r8 + %r0], %r29
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xbbc44000  ! 556: JMPL_R	jmpl	%r17 + %r0, %r29
thr1_ic_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xb6b0c00a  ! 559: ORNcc_R	orncc 	%r3, %r10, %r27
	.word 0xaf297001  ! 561: SLLX_I	sllx	%r5, 0x0001, %r23
	.word 0xad28900a  ! 561: SLLX_R	sllx	%r2, %r10, %r22
	.word 0xb89121b6  ! 561: ORcc_I	orcc 	%r4, 0x01b6, %r28
	setx  0x08dffca24f4c6694, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_22), 16, 16),1,DC_DATA,41)
	.word 0xf8490000  ! 564: LDSB_R	ldsb	[%r4 + %r0], %r28
	.word 0xb9c44000  ! 566: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb2a8c00a  ! 569: ANDNcc_R	andncc 	%r3, %r10, %r25
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xba3a2bfb  ! 575: XNOR_I	xnor 	%r8, 0x0bfb, %r29
	setx  0x64cfc8f490749cc8, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xa9c44000  ! 579: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xba00808c
thr1_ic_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xa841400b  ! 585: ADDC_R	addc 	%r5, %r11, %r20
	.word 0xa931800e  ! 585: SRL_R	srl 	%r6, %r14, %r20
	.word 0xb4922ded  ! 585: ORcc_I	orcc 	%r8, 0x0ded, %r26
	setx  0x2cbf963d729571a4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_23), 16, 16),1,DC_DATA,31)
	.word 0xfc490000  ! 588: LDSB_R	ldsb	[%r4 + %r0], %r30
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xadc44000  ! 590: JMPL_R	jmpl	%r17 + %r0, %r22
thr1_ic_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_29), 16, 16),1,IC_DATA,IR,6,x)
	.word 0xbcb9e3c8  ! 593: XNORcc_I	xnorcc 	%r7, 0x03c8, %r30
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaaa2000e  ! 597: SUBcc_R	subcc 	%r8, %r14, %r21
	setx  0xf0df0d38697a73a6, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb5c44040  ! 600: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xfd81d00e  ! 601: LDFA_R	lda	[%r7, %r14], %f30
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xaaaa000e  ! 606: ANDNcc_R	andncc 	%r8, %r14, %r21
	setx  0x90afddf934806ae1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 609: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb8796770  ! 610: SDIV_I	sdiv 	%r5, 0x0770, %r28
	.word 0xba31800f  ! 612: SUBC_R	orn 	%r6, %r15, %r29
	setx  0xde9fa4dbaba50524, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xea71202a  ! 614: STX_I	stx	%r21, [%r4 + 0x002a]
	.word 0xee30800c  ! 614: STH_R	sth	%r23, [%r2 + %r12]
	.word 0xfc20800b  ! 614: STW_R	stw	%r30, [%r2 + %r11]
	.word 0xea28c00f  ! 614: STB_R	stb	%r21, [%r3 + %r15]
	.word 0xf870c00f  ! 614: STX_R	stx	%r28, [%r3 + %r15]
	.word 0xee722d92  ! 614: STX_I	stx	%r23, [%r8 + 0x0d92]
	.word 0xf821000e  ! 614: STW_R	stw	%r28, [%r4 + %r14]
	.word 0xf831400f  ! 614: STH_R	sth	%r28, [%r5 + %r15]
	.word 0xf2312b2a  ! 614: STH_I	sth	%r25, [%r4 + 0x0b2a]
	.word 0xee222772  ! 614: STW_I	stw	%r23, [%r8 + 0x0772]
	.word 0xf220a000  ! 614: STW_I	stw	%r25, [%r2 + 0x0000]
	.word 0xee31400b  ! 614: STH_R	sth	%r23, [%r5 + %r11]
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xb9c44040  ! 615: JMPL_R	jmpl	%r17 + %r0, %r28
thr1_ic_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_30), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xf831000f  ! 618: STH_R	sth	%r28, [%r4 + %r15]
thr1_ic_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_31), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xb880800e  ! 621: ADDcc_R	addcc 	%r2, %r14, %r28
	.word 0xbb38c00a  ! 623: SRA_R	sra 	%r3, %r10, %r29
	.word 0xa8b8800a  ! 625: XNORcc_R	xnorcc 	%r2, %r10, %r20
	.word 0xb77a040a  ! 627: MOVR_R	move	%r8, %r10, %r27
	.word 0xae08ec35  ! 629: AND_I	and 	%r3, 0x0c35, %r23
	.word 0xb129000a  ! 631: SLL_R	sll 	%r4, %r10, %r24
	.word 0xa8c1400a  ! 633: ADDCcc_R	addccc 	%r5, %r10, %r20
	setx  0x2aafeb40b6c32d75, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_24), 16, 16),1,DC_DATA,65)
	.word 0xea188000  ! 637: LDD_R	ldd	[%r2 + %r0], %r21
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 639: JMPL_R	jmpl	%r17 + %r0, %r25
thr1_ic_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_32), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xba20c00d  ! 642: SUB_R	sub 	%r3, %r13, %r29
	.word 0xba98c00f  ! 645: XORcc_R	xorcc 	%r3, %r15, %r29
	setx  0x5b0f5ece19bdfd79, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xbdc44000  ! 648: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xb520e821  ! 649: MULScc_I	mulscc 	%r3, 0x0821, %r26
	setx  0xa13fe2e9ef6d045a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_25), 16, 16),1,DC_DATA,14)
	.word 0xf4418000  ! 653: LDSW_R	ldsw	[%r6 + %r0], %r26
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xbdc44000  ! 655: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_33), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xbc31e9fc  ! 658: ORN_I	orn 	%r7, 0x09fc, %r30
	.word 0xaa99c00f  ! 660: XORcc_R	xorcc 	%r7, %r15, %r21
	.word 0xaa31800e  ! 660: ORN_R	orn 	%r6, %r14, %r21
	.word 0xb932100c  ! 660: SRLX_R	srlx	%r8, %r12, %r28
	.word 0xaf30d00e  ! 660: SRLX_R	srlx	%r3, %r14, %r23
	.word 0xb439c00a  ! 660: XNOR_R	xnor 	%r7, %r10, %r26
	.word 0xacb12233  ! 661: ORNcc_I	orncc 	%r4, 0x0233, %r22
	setx  0xa4cf17c81e362942, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 665: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xba00808c
thr1_ic_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_34), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xae81a0fe  ! 672: ADDcc_I	addcc 	%r6, 0x00fe, %r23
	setx  0xd28f63b8f0c77e58, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb9c44040  ! 676: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xba00808c
thr1_ic_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_35), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xba91c00d  ! 680: ORcc_R	orcc 	%r7, %r13, %r29
	setx  0xccff100e8862b968, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_26), 16, 16),1,DC_DATA,38)
	.word 0xe84a0000  ! 684: LDSB_R	ldsb	[%r8 + %r0], %r20
	.word 0xafc44000  ! 686: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xac01c00e  ! 689: ADD_R	add 	%r7, %r14, %r22
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaf7a040c  ! 692: MOVR_R	move	%r8, %r12, %r23
	setx  0x5e2f248ed0010a88, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xafc44000  ! 696: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xa938c00c  ! 698: SRA_R	sra 	%r3, %r12, %r20
thr1_ic_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_36), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xba00808c
	.word 0xb488c00a  ! 702: ANDcc_R	andcc 	%r3, %r10, %r26
	.word 0xb809c00c  ! 702: AND_R	and 	%r7, %r12, %r28
	.word 0xa839ed5f  ! 702: XNOR_I	xnor 	%r7, 0x0d5f, %r20
	setx  0x8befb2349d2834a2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_27), 16, 16),1,DC_DATA,26)
	.word 0xf601c000  ! 705: LDUW_R	lduw	[%r7 + %r0], %r27
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xbdc44040  ! 707: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_37), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xbb643801  ! 710: MOVcc_I	<illegal instruction>
	.word 0xb2a9000d  ! 712: ANDNcc_R	andncc 	%r4, %r13, %r25
	setx  0xf6df42eb23ce91be, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xa9c44000  ! 715: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xbc48a655  ! 716: MULX_I	mulx 	%r2, 0x0655, %r30
	.word 0xb931a001  ! 718: SRL_I	srl 	%r6, 0x0001, %r28
	setx  0xb88f2b7892c0fc08, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb5c44040  ! 722: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xae89800f  ! 724: ANDcc_R	andcc 	%r6, %r15, %r23
thr1_ic_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_38), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xba00808c
	.word 0xae98abd5  ! 728: XORcc_I	xorcc 	%r2, 0x0bd5, %r23
	.word 0xb040ef60  ! 728: ADDC_I	addc 	%r3, 0x0f60, %r24
	.word 0xb441e893  ! 728: ADDC_I	addc 	%r7, 0x0893, %r26
	.word 0xb0b0c00c  ! 728: ORNcc_R	orncc 	%r3, %r12, %r24
	.word 0xb40a27c6  ! 728: AND_I	and 	%r8, 0x07c6, %r26
	.word 0xb831aeea  ! 729: ORN_I	orn 	%r6, 0x0eea, %r28
	setx  0x1ccf2714b9f0e057, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf871a335  ! 731: STX_I	stx	%r28, [%r6 + 0x0335]
	.word 0xf871000c  ! 731: STX_R	stx	%r28, [%r4 + %r12]
	.word 0xea21a1f5  ! 731: STW_I	stw	%r21, [%r6 + 0x01f5]
	.word 0xf8722589  ! 731: STX_I	stx	%r28, [%r8 + 0x0589]
	.word 0xf621a254  ! 731: STW_I	stw	%r27, [%r6 + 0x0254]
	.word 0xfa21a0fc  ! 731: STW_I	stw	%r29, [%r6 + 0x00fc]
	.word 0xe830800a  ! 731: STH_R	sth	%r20, [%r2 + %r10]
	.word 0xf028800e  ! 731: STB_R	stb	%r24, [%r2 + %r14]
	.word 0xf430ef88  ! 731: STH_I	sth	%r26, [%r3 + 0x0f88]
	.word 0xfc30c00b  ! 731: STH_R	sth	%r30, [%r3 + %r11]
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 732: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xf628c00f  ! 734: STB_R	stb	%r27, [%r3 + %r15]
	.word 0xb2c0c00b  ! 737: ADDCcc_R	addccc 	%r3, %r11, %r25
	.word 0xba41800a  ! 739: ADDC_R	addc 	%r6, %r10, %r29
	.word 0xb0a1a431  ! 741: SUBcc_I	subcc 	%r6, 0x0431, %r24
	.word 0xb088a89d  ! 743: ANDcc_I	andcc 	%r2, 0x089d, %r24
	.word 0xbb29000f  ! 745: SLL_R	sll 	%r4, %r15, %r29
	.word 0xb531d00a  ! 747: SRLX_R	srlx	%r7, %r10, %r26
	.word 0xb179840a  ! 749: MOVR_R	move	%r6, %r10, %r24
	setx  0x00af1ac12e628f31, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_28), 16, 16),1,DC_DATA,15)
	.word 0xfc018000  ! 753: LDUW_R	lduw	[%r6 + %r0], %r30
	.word 0xb9c44040  ! 755: JMPL_R	jmpl	%r17 + %r0, %r28
thr1_ic_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_39), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xba316136  ! 758: SUBC_I	orn 	%r5, 0x0136, %r29
	.word 0xb039c00c  ! 760: XNOR_R	xnor 	%r7, %r12, %r24
	setx  0x617fb1a86e856156, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xea28c00e  ! 762: STB_R	stb	%r21, [%r3 + %r14]
	.word 0xf62a2d42  ! 762: STB_I	stb	%r27, [%r8 + 0x0d42]
	.word 0xfa31800e  ! 762: STH_R	sth	%r29, [%r6 + %r14]
	.word 0xe870aae0  ! 762: STX_I	stx	%r20, [%r2 + 0x0ae0]
	.word 0xf028a8ed  ! 762: STB_I	stb	%r24, [%r2 + 0x08ed]
	.word 0xf420a25c  ! 762: STW_I	stw	%r26, [%r2 + 0x025c]
	.word 0xf431800f  ! 762: STH_R	sth	%r26, [%r6 + %r15]
	.word 0xe830e806  ! 762: STH_I	sth	%r20, [%r3 + 0x0806]
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xbdc44040  ! 763: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_40), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xfa21a6c0  ! 766: STW_I	stw	%r29, [%r6 + 0x06c0]
	.word 0xad296001  ! 769: SLL_I	sll 	%r5, 0x0001, %r22
	.word 0xb880a07a  ! 771: ADDcc_I	addcc 	%r2, 0x007a, %r28
	.word 0xbb64180c  ! 773: MOVcc_R	<illegal instruction>
	.word 0xbd64180e  ! 775: MOVcc_R	<illegal instruction>
	.word 0xac0a000d  ! 777: AND_R	and 	%r8, %r13, %r22
	.word 0xbc01c00e  ! 779: ADD_R	add 	%r7, %r14, %r30
	.word 0xaaa0c00f  ! 781: SUBcc_R	subcc 	%r3, %r15, %r21
	setx  0x4bff81091a5847f8, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_29), 16, 16),1,DC_DATA,23)
	.word 0xf4498000  ! 785: LDSB_R	ldsb	[%r6 + %r0], %r26
	.word 0xabc44040  ! 787: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xb330900f  ! 790: SRLX_R	srlx	%r2, %r15, %r25
	.word 0xb209ebba  ! 792: AND_I	and 	%r7, 0x0bba, %r25
	setx  0xa6ffd3bdbd0ed065, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xfa2167a0  ! 794: STW_I	stw	%r29, [%r5 + 0x07a0]
	.word 0xf828c00b  ! 794: STB_R	stb	%r28, [%r3 + %r11]
	.word 0xf6722c68  ! 794: STX_I	stx	%r27, [%r8 + 0x0c68]
	.word 0xf22927c8  ! 794: STB_I	stb	%r25, [%r4 + 0x07c8]
	.word 0xf821c00e  ! 794: STW_R	stw	%r28, [%r7 + %r14]
	.word 0xf428ee9c  ! 794: STB_I	stb	%r26, [%r3 + 0x0e9c]
	.word 0xe829ef44  ! 794: STB_I	stb	%r20, [%r7 + 0x0f44]
	.word 0xf820c00b  ! 794: STW_R	stw	%r28, [%r3 + %r11]
	.word 0xf821400c  ! 794: STW_R	stw	%r28, [%r5 + %r12]
	.word 0xfc31c00a  ! 794: STH_R	sth	%r30, [%r7 + %r10]
	.word 0xee31000a  ! 794: STH_R	sth	%r23, [%r4 + %r10]
	.word 0xf02a2ec8  ! 794: STB_I	stb	%r24, [%r8 + 0x0ec8]
	.word 0xbdc44000  ! 795: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xec712ac6  ! 797: STX_I	stx	%r22, [%r4 + 0x0ac6]
thr1_ic_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_41), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xba00808c
	.word 0xab2a3001  ! 801: SLLX_I	sllx	%r8, 0x0001, %r21
	.word 0xb499e7f6  ! 803: XORcc_I	xorcc 	%r7, 0x07f6, %r26
	.word 0xba012d6d  ! 805: ADD_I	add 	%r4, 0x0d6d, %r29
	.word 0xad30b001  ! 807: SRLX_I	srlx	%r2, 0x0001, %r22
	.word 0xab3a3001  ! 809: SRAX_I	srax	%r8, 0x0001, %r21
	.word 0xac916f3b  ! 811: ORcc_I	orcc 	%r5, 0x0f3b, %r22
	setx  0x85ef724f771d3436, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_30), 16, 16),1,DC_DATA,4)
	.word 0xf2488000  ! 815: LDSB_R	ldsb	[%r2 + %r0], %r25
thr1_irf_ce_41:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_41), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xb9c44040  ! 817: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb031400a  ! 820: ORN_R	orn 	%r5, %r10, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb329a001  ! 823: SLL_I	sll 	%r6, 0x0001, %r25
	.word 0xac81a2a5  ! 823: ADDcc_I	addcc 	%r6, 0x02a5, %r22
	.word 0xb62a2e76  ! 823: ANDN_I	andn 	%r8, 0x0e76, %r27
	.word 0xb2b9e679  ! 823: XNORcc_I	xnorcc 	%r7, 0x0679, %r25
	.word 0xb331000f  ! 823: SRL_R	srl 	%r4, %r15, %r25
	.word 0xb8b8800f  ! 824: XNORcc_R	xnorcc 	%r2, %r15, %r28
	.word 0xaeb9a1de  ! 824: XNORcc_I	xnorcc 	%r6, 0x01de, %r23
	.word 0xb1297001  ! 824: SLLX_I	sllx	%r5, 0x0001, %r24
	.word 0xb6c1800c  ! 824: ADDCcc_R	addccc 	%r6, %r12, %r27
	setx  0x230f7d374bfb8eb8, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_31), 16, 16),1,DC_DATA,48)
	.word 0xee594000  ! 827: LDX_R	ldx	[%r5 + %r0], %r23
	.word 0xb5c44040  ! 829: JMPL_R	jmpl	%r17 + %r0, %r26
thr1_ic_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_42), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xbc89400d  ! 832: ANDcc_R	andcc 	%r5, %r13, %r30
	.word 0xb4092213  ! 835: AND_I	and 	%r4, 0x0213, %r26
	setx  0x859f10b9b85841e1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_42:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_42), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 838: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xb4f1000d  ! 839: UDIVcc_R	udivcc 	%r4, %r13, %r26
	.word 0xae18800f  ! 841: XOR_R	xor 	%r2, %r15, %r23
	setx  0x3cef97190a858000, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb5c44000  ! 845: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xba00808c
	.word 0xb021000b  ! 849: SUB_R	sub 	%r4, %r11, %r24
	.word 0xac40800b  ! 851: ADDC_R	addc 	%r2, %r11, %r22
	setx  0xec0f6dc5cff9d1b5, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xee20c00a  ! 853: STW_R	stw	%r23, [%r3 + %r10]
	.word 0xf270800e  ! 853: STX_R	stx	%r25, [%r2 + %r14]
	.word 0xf821400d  ! 853: STW_R	stw	%r28, [%r5 + %r13]
	.word 0xfa71800c  ! 853: STX_R	stx	%r29, [%r6 + %r12]
	.word 0xf629e7d5  ! 853: STB_I	stb	%r27, [%r7 + 0x07d5]
	.word 0xf8722dd9  ! 853: STX_I	stx	%r28, [%r8 + 0x0dd9]
	.word 0xf0212740  ! 853: STW_I	stw	%r24, [%r4 + 0x0740]
	.word 0xf621c00c  ! 853: STW_R	stw	%r27, [%r7 + %r12]
	.word 0xb5c44000  ! 854: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xf472008d
thr1_ic_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_43), 16, 16),1,IC_DATA,IR,8,x)
	.word 0xba00808c
	.word 0xab397001  ! 859: SRAX_I	srax	%r5, 0x0001, %r21
	.word 0xba91ebcb  ! 861: ORcc_I	orcc 	%r7, 0x0bcb, %r29
	.word 0xb888ea2a  ! 863: ANDcc_I	andcc 	%r3, 0x0a2a, %r28
	.word 0xaeb0c00d  ! 865: ORNcc_R	orncc 	%r3, %r13, %r23
	.word 0xa831400c  ! 867: ORN_R	orn 	%r5, %r12, %r20
	.word 0xbca1c00b  ! 869: SUBcc_R	subcc 	%r7, %r11, %r30
	.word 0xb800c00b  ! 871: ADD_R	add 	%r3, %r11, %r28
	setx  0xcacfd487478cd870, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xadc44040  ! 875: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xbab9c00b  ! 877: XNORcc_R	xnorcc 	%r7, %r11, %r29
thr1_ic_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_44), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xa8a1000b  ! 880: SUBcc_R	subcc 	%r4, %r11, %r20
	.word 0xb2c0a4a3  ! 882: ADDCcc_I	addccc 	%r2, 0x04a3, %r25
	setx  0xdd6f1e98171b8135, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
thr1_irf_ce_43:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_43), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 886: JMPL_R	jmpl	%r17 + %r0, %r25
thr1_ic_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_45), 16, 16),1,IC_DATA,IR,12,x)
	.word 0xb238c00c  ! 889: XNOR_R	xnor 	%r3, %r12, %r25
	setx  0x906fc7d94ad2428a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_32), 16, 16),1,DC_DATA,7)
	.word 0xf4094000  ! 893: LDUB_R	ldub	[%r5 + %r0], %r26
thr1_irf_ce_44:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_44), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xadc44040  ! 895: JMPL_R	jmpl	%r17 + %r0, %r22
thr1_ic_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_46), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xba00808c
	.word 0xb440aaa8  ! 899: ADDC_I	addc 	%r2, 0x0aa8, %r26
	setx  0x854f517bfbb800a2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xabc44040  ! 902: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xaa70800d  ! 903: UDIV_R	udiv 	%r2, %r13, %r21
	.word 0xad64180d  ! 905: MOVcc_R	<illegal instruction>
	setx  0x583f66eed259157e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xbbc44040  ! 908: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0x1b800001  ! 909: FBLE	fble  	<label_0x1>
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb531800a  ! 914: SRL_R	srl 	%r6, %r10, %r26
	setx  0x7ddf80e985f954c6, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_45:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_45), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xadc44040  ! 917: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xbaf1e3af  ! 918: UDIVcc_I	udivcc 	%r7, 0x03af, %r29
	.word 0xa931c00e  ! 920: SRL_R	srl 	%r7, %r14, %r20
	setx  0x40cf102f7370515a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf830c00e  ! 922: STH_R	sth	%r28, [%r3 + %r14]
	.word 0xf83225ae  ! 922: STH_I	sth	%r28, [%r8 + 0x05ae]
	.word 0xf229ec39  ! 922: STB_I	stb	%r25, [%r7 + 0x0c39]
	.word 0xf229c00a  ! 922: STB_R	stb	%r25, [%r7 + %r10]
	.word 0xee28c00d  ! 922: STB_R	stb	%r23, [%r3 + %r13]
	.word 0xf82a2d87  ! 922: STB_I	stb	%r28, [%r8 + 0x0d87]
	.word 0xee20800b  ! 922: STW_R	stw	%r23, [%r2 + %r11]
	.word 0xfa21800a  ! 922: STW_R	stw	%r29, [%r6 + %r10]
thr1_irf_ce_46:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_46), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 923: JMPL_R	jmpl	%r17 + %r0, %r21
thr1_ic_err_47:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_47), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xf472008d
thr1_ic_err_48:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_48), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xaec1000e  ! 928: ADDCcc_R	addccc 	%r4, %r14, %r23
	.word 0xab38900b  ! 930: SRAX_R	srax	%r2, %r11, %r21
	.word 0xa810800b  ! 932: OR_R	or 	%r2, %r11, %r20
	.word 0xb221acdc  ! 934: SUB_I	sub 	%r6, 0x0cdc, %r25
	.word 0xba0a000b  ! 936: AND_R	and 	%r8, %r11, %r29
	.word 0xb129000a  ! 938: SLL_R	sll 	%r4, %r10, %r24
	.word 0xae89400e  ! 940: ANDcc_R	andcc 	%r5, %r14, %r23
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb699c00c  ! 943: XORcc_R	xorcc 	%r7, %r12, %r27
	.word 0xb1313001  ! 943: SRLX_I	srlx	%r4, 0x0001, %r24
	.word 0xae31e60f  ! 943: ORN_I	orn 	%r7, 0x060f, %r23
	.word 0xa88a000f  ! 943: ANDcc_R	andcc 	%r8, %r15, %r20
	.word 0xaf292001  ! 943: SLL_I	sll 	%r4, 0x0001, %r23
	setx  0x2b1f48c4b29e53cc, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_33), 16, 16),1,DC_DATA,60)
	.word 0xf400c000  ! 946: LDUW_R	lduw	[%r3 + %r0], %r26
	.word 0xa9c44040  ! 948: JMPL_R	jmpl	%r17 + %r0, %r20
thr1_ic_err_49:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_49), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb68165f2  ! 954: ADDcc_I	addcc 	%r5, 0x05f2, %r27
	setx  0xc22f1def4decc428, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_47:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_47), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xadc44000  ! 957: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xaad1800d  ! 958: UMULcc_R	umulcc 	%r6, %r13, %r21
	.word 0xa928c00b  ! 960: SLL_R	sll 	%r3, %r11, %r20
	.word 0xb1643801  ! 960: MOVcc_I	<illegal instruction>
	.word 0xb2b1400e  ! 960: ORNcc_R	orncc 	%r5, %r14, %r25
	.word 0xb130900b  ! 960: SRLX_R	srlx	%r2, %r11, %r24
	.word 0xad643801  ! 960: MOVcc_I	<illegal instruction>
	setx  0x504fcd6438e41394, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_34), 16, 16),1,DC_DATA,47)
	.word 0xfc094000  ! 963: LDUB_R	ldub	[%r5 + %r0], %r30
	.word 0xbbc44040  ! 965: JMPL_R	jmpl	%r17 + %r0, %r29
thr1_ic_err_50:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_50), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xb338b001  ! 968: SRAX_I	srax	%r2, 0x0001, %r25
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb889000e  ! 974: ANDcc_R	andcc 	%r4, %r14, %r28
	setx  0x300fefe6f129279f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_48:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_48), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xa9c44000  ! 977: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xaa48e50a  ! 978: MULX_I	mulx 	%r3, 0x050a, %r21
	.word 0xbca9c00d  ! 980: ANDNcc_R	andncc 	%r7, %r13, %r30
	setx  0x2a2ffe9b17965494, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xfa31c00f  ! 982: STH_R	sth	%r29, [%r7 + %r15]
	.word 0xe8716a73  ! 982: STX_I	stx	%r20, [%r5 + 0x0a73]
	.word 0xfc21800e  ! 982: STW_R	stw	%r30, [%r6 + %r14]
	.word 0xf229400f  ! 982: STB_R	stb	%r25, [%r5 + %r15]
	.word 0xf028c00c  ! 982: STB_R	stb	%r24, [%r3 + %r12]
	.word 0xf271800f  ! 982: STX_R	stx	%r25, [%r6 + %r15]
	.word 0xec28800c  ! 982: STB_R	stb	%r22, [%r2 + %r12]
	.word 0xfc28c00f  ! 982: STB_R	stb	%r30, [%r3 + %r15]
	.word 0xee28c00a  ! 982: STB_R	stb	%r23, [%r3 + %r10]
	.word 0xf821c00a  ! 982: STW_R	stw	%r28, [%r7 + %r10]
	.word 0xee20800a  ! 982: STW_R	stw	%r23, [%r2 + %r10]
	.word 0xb1c44000  ! 983: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xf472008d
thr1_ic_err_51:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_51), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xae08ee3c  ! 987: AND_I	and 	%r3, 0x0e3c, %r23
	.word 0xb0012172  ! 989: ADD_I	add 	%r4, 0x0172, %r24
	.word 0xb2ba2891  ! 991: XNORcc_I	xnorcc 	%r8, 0x0891, %r25
	.word 0xb292000d  ! 993: ORcc_R	orcc 	%r8, %r13, %r25
	.word 0xaa812b4d  ! 995: ADDcc_I	addcc 	%r4, 0x0b4d, %r21
	.word 0xbd39400f  ! 997: SRA_R	sra 	%r5, %r15, %r30
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x0475f5b06eb1d8fa, %r16, %r16
	setx  0x4b22463fff49e820, %r16, %r17
	setx  0x20d08b94e2241ca7, %r16, %r18
	setx  0xdbd827a06154fc81, %r16, %r19
	setx  0xd8b26be8b3de043f, %r16, %r20
	setx  0xfdbeb79aaa958736, %r16, %r21
	setx  0xb924bf170eeb28b8, %r16, %r22
	setx  0x9aa851247493e8c1, %r16, %r23
	setx  0xb32b1c2dbb8ecbf9, %r16, %r24
	setx  0x315a573e36deeba9, %r16, %r25
	setx  0x68f2090176a9fdde, %r16, %r26
	setx  0xa589db2a8cc5a022, %r16, %r27
	setx  0xe95755df39fd3bb9, %r16, %r28
	setx  0xb982321425acc90e, %r16, %r29
	setx  0x618997e2fce1a35d, %r16, %r30
	setx  0x96fa83903fd49c8c, %r16, %r31
	setx  0x0000000000000040, %r16, %r10
	setx  0x00000000000006e0, %r16, %r11
	setx  0x0000000000000c80, %r16, %r12
	setx  0x00000000000004d0, %r16, %r13
	setx  0x0000000000000440, %r16, %r14
	setx  0x0000000000000d20, %r16, %r15
	setx  0x0000000000000171, %r16, %r9
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
	.word 0xb2116f08  ! 6: OR_I	or 	%r5, 0x0f08, %r25
	.word 0xb401800b  ! 6: ADD_R	add 	%r6, %r11, %r26
	.word 0xb8b8c00a  ! 6: XNORcc_R	xnorcc 	%r3, %r10, %r28
	.word 0xa831400a  ! 6: ORN_R	orn 	%r5, %r10, %r20
	.word 0xaf28d00c  ! 6: SLLX_R	sllx	%r3, %r12, %r23
	.word 0xb0b1800b  ! 7: ORNcc_R	orncc 	%r6, %r11, %r24
	setx  0x172faaf0fe189e04, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xfa71c00e  ! 9: STX_R	stx	%r29, [%r7 + %r14]
	.word 0xf029e619  ! 9: STB_I	stb	%r24, [%r7 + 0x0619]
	.word 0xf4212d96  ! 9: STW_I	stw	%r26, [%r4 + 0x0d96]
	.word 0xf029e25e  ! 9: STB_I	stb	%r24, [%r7 + 0x025e]
	.word 0xfc30c00a  ! 9: STH_R	sth	%r30, [%r3 + %r10]
	.word 0xec71a6c3  ! 9: STX_I	stx	%r22, [%r6 + 0x06c3]
	.word 0xf030800e  ! 9: STH_R	sth	%r24, [%r2 + %r14]
	.word 0xfa71800f  ! 9: STX_R	stx	%r29, [%r6 + %r15]
	.word 0xf429800a  ! 9: STB_R	stb	%r26, [%r6 + %r10]
	.word 0xf428800e  ! 9: STB_R	stb	%r26, [%r2 + %r14]
	.word 0xee21400d  ! 9: STW_R	stw	%r23, [%r5 + %r13]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xadc44000  ! 10: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xf830e239  ! 12: STH_I	sth	%r28, [%r3 + 0x0239]
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xa8b2000c  ! 15: ORNcc_R	orncc 	%r8, %r12, %r20
	.word 0xa964180e  ! 17: MOVcc_R	<illegal instruction>
	.word 0xaf316001  ! 19: SRL_I	srl 	%r5, 0x0001, %r23
	.word 0xae30a52b  ! 21: SUBC_I	orn 	%r2, 0x052b, %r23
	.word 0xb22a000e  ! 23: ANDN_R	andn 	%r8, %r14, %r25
	.word 0xa839000c  ! 25: XNOR_R	xnor 	%r4, %r12, %r20
	.word 0xb4b1c00a  ! 27: ORNcc_R	orncc 	%r7, %r10, %r26
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xb201400f  ! 31: ADD_R	add 	%r5, %r15, %r25
	setx  0x2b2ff62b3cf6e3db, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 34: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xbda0192e  ! 35: FsTOd	dis not found

	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xa938c00b  ! 38: SRA_R	sra 	%r3, %r11, %r20
	setx  0x736f019a195dc926, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 41: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xb1a000aa  ! 42: FNEGs	fnegs	%f10, %f24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x7ecf4d8557f18c30, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,60)
	.word 0xf000c000  ! 47: LDUW_R	lduw	[%r3 + %r0], %r24
	.word 0xb9c44000  ! 49: JMPL_R	jmpl	%r17 + %r0, %r28
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xb2a9e7a5  ! 52: ANDNcc_I	andncc 	%r7, 0x07a5, %r25
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xa891800f  ! 56: ORcc_R	orcc 	%r6, %r15, %r20
	setx  0xcdaf1c0a99c8f25e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf821c00f  ! 58: STW_R	stw	%r28, [%r7 + %r15]
	.word 0xe8322d64  ! 58: STH_I	sth	%r20, [%r8 + 0x0d64]
	.word 0xee70800a  ! 58: STX_R	stx	%r23, [%r2 + %r10]
	.word 0xf430eab0  ! 58: STH_I	sth	%r26, [%r3 + 0x0ab0]
	.word 0xfa71800e  ! 58: STX_R	stx	%r29, [%r6 + %r14]
	.word 0xec30800a  ! 58: STH_R	sth	%r22, [%r2 + %r10]
	.word 0xf2216092  ! 58: STW_I	stw	%r25, [%r5 + 0x0092]
	.word 0xec28a20d  ! 58: STB_I	stb	%r22, [%r2 + 0x020d]
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xadc44000  ! 59: JMPL_R	jmpl	%r17 + %r0, %r22
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xf472008d
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xbc21000d  ! 64: SUB_R	sub 	%r4, %r13, %r30
	.word 0xbd7a040b  ! 66: MOVR_R	move	%r8, %r11, %r30
	.word 0xb400ee2c  ! 68: ADD_I	add 	%r3, 0x0e2c, %r26
	.word 0xac30e9a5  ! 70: SUBC_I	orn 	%r3, 0x09a5, %r22
	.word 0xb488e806  ! 72: ANDcc_I	andcc 	%r3, 0x0806, %r26
	.word 0xb099e7cf  ! 74: XORcc_I	xorcc 	%r7, 0x07cf, %r24
	.word 0xb5393001  ! 76: SRAX_I	srax	%r4, 0x0001, %r26
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb419ed64  ! 80: XOR_I	xor 	%r7, 0x0d64, %r26
	setx  0x233fbf7087a7ac4b, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 83: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xaaf16a26  ! 84: UDIVcc_I	udivcc 	%r5, 0x0a26, %r21
	.word 0xbab0c00e  ! 87: ORNcc_R	orncc 	%r3, %r14, %r29
	setx  0x86cf773aa8a91e04, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 90: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xbaf1e99a  ! 91: UDIVcc_I	udivcc 	%r7, 0x099a, %r29
	setx  0xd94fb4b9c4109b49, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,46)
	.word 0xfa51c000  ! 95: LDSH_R	ldsh	[%r7 + %r0], %r29
	.word 0xabc44000  ! 97: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xad39a001  ! 104: SRA_I	sra 	%r6, 0x0001, %r22
	setx  0xd06ff90d3d8ca33c, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 107: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xa850800c  ! 108: UMUL_R	umul 	%r2, %r12, %r20
	.word 0xa891a6a4  ! 110: ORcc_I	orcc 	%r6, 0x06a4, %r20
	.word 0xb490800b  ! 110: ORcc_R	orcc 	%r2, %r11, %r26
	.word 0xaa40800f  ! 110: ADDC_R	addc 	%r2, %r15, %r21
	.word 0xbab9000c  ! 110: XNORcc_R	xnorcc 	%r4, %r12, %r29
	.word 0xb288c00e  ! 111: ANDcc_R	andcc 	%r3, %r14, %r25
	.word 0xae11000c  ! 111: OR_R	or 	%r4, %r12, %r23
	.word 0xb6a960e5  ! 111: ANDNcc_I	andncc 	%r5, 0x00e5, %r27
	.word 0xb339900a  ! 111: SRAX_R	srax	%r6, %r10, %r25
	.word 0xaa29aa08  ! 111: ANDN_I	andn 	%r6, 0x0a08, %r21
	setx  0x013fca47cfbb86c9, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,61)
	.word 0xea418000  ! 114: LDSW_R	ldsw	[%r6 + %r0], %r21
	.word 0xa9c44000  ! 116: JMPL_R	jmpl	%r17 + %r0, %r20
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xaa11800a  ! 119: OR_R	or 	%r6, %r10, %r21
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xac122e93  ! 123: OR_I	or 	%r8, 0x0e93, %r22
	setx  0xb56fabdbb89cc24f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xafc44000  ! 126: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xa8f12e41  ! 127: UDIVcc_I	udivcc 	%r4, 0x0e41, %r20
	setx  0xa61fce2b0b226160, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,49)
	.word 0xe8510000  ! 131: LDSH_R	ldsh	[%r4 + %r0], %r20
	.word 0xb5c44000  ! 133: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xa939b001  ! 136: SRAX_I	srax	%r6, 0x0001, %r20
	.word 0xac32000e  ! 138: ORN_R	orn 	%r8, %r14, %r22
	.word 0xb0c1c00a  ! 138: ADDCcc_R	addccc 	%r7, %r10, %r24
	.word 0xb538900a  ! 138: SRAX_R	srax	%r2, %r10, %r26
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xbcc125aa  ! 141: ADDCcc_I	addccc 	%r4, 0x05aa, %r30
	setx  0x567f3c3feefa2f0d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 144: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xba49c00d  ! 145: MULX_R	mulx 	%r7, %r13, %r29
	setx  0x5aff437e1a11d5b4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,69)
	.word 0xfa41c000  ! 149: LDSW_R	ldsw	[%r7 + %r0], %r29
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xb1c44040  ! 151: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xbcb0800a  ! 154: ORNcc_R	orncc 	%r2, %r10, %r30
	.word 0xb629e08e  ! 157: ANDN_I	andn 	%r7, 0x008e, %r27
	setx  0x08bf20d037a9cb92, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 160: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xad21a0df  ! 161: MULScc_I	mulscc 	%r6, 0x00df, %r22
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xae192d8a  ! 164: XOR_I	xor 	%r4, 0x0d8a, %r23
	setx  0x778f5394a845ba66, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf4312511  ! 166: STH_I	sth	%r26, [%r4 + 0x0511]
	.word 0xf429e1d3  ! 166: STB_I	stb	%r26, [%r7 + 0x01d3]
	.word 0xf23226c0  ! 166: STH_I	sth	%r25, [%r8 + 0x06c0]
	.word 0xf830800f  ! 166: STH_R	sth	%r28, [%r2 + %r15]
	.word 0xfa292f47  ! 166: STB_I	stb	%r29, [%r4 + 0x0f47]
	.word 0xea216c99  ! 166: STW_I	stw	%r21, [%r5 + 0x0c99]
	.word 0xf22a2204  ! 166: STB_I	stb	%r25, [%r8 + 0x0204]
	.word 0xf630800c  ! 166: STH_R	sth	%r27, [%r2 + %r12]
	.word 0xf429c00e  ! 166: STB_R	stb	%r26, [%r7 + %r14]
	.word 0xfa21a3ef  ! 166: STW_I	stw	%r29, [%r6 + 0x03ef]
	.word 0xfa70a5f4  ! 166: STX_I	stx	%r29, [%r2 + 0x05f4]
	.word 0xf471400b  ! 166: STX_R	stx	%r26, [%r5 + %r11]
	.word 0xa9c44040  ! 167: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xf472008d
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xba00808c
	.word 0xa829c00b  ! 172: ANDN_R	andn 	%r7, %r11, %r20
	.word 0xba08a718  ! 174: AND_I	and 	%r2, 0x0718, %r29
	.word 0xb018c00e  ! 176: XOR_R	xor 	%r3, %r14, %r24
	.word 0xab7a2401  ! 178: MOVR_I	move	%r8, 0x7fffbc90, %r21
	.word 0xba91000e  ! 180: ORcc_R	orcc 	%r4, %r14, %r29
	.word 0xbca9800f  ! 182: ANDNcc_R	andncc 	%r6, %r15, %r30
	.word 0xb8c1a966  ! 184: ADDCcc_I	addccc 	%r6, 0x0966, %r28
	.word 0xab28900e  ! 184: SLLX_R	sllx	%r2, %r14, %r21
	.word 0xb739c00c  ! 184: SRA_R	sra 	%r7, %r12, %r27
	.word 0xb2b8c00b  ! 184: XNORcc_R	xnorcc 	%r3, %r11, %r25
	.word 0xbd392001  ! 184: SRA_I	sra 	%r4, 0x0001, %r30
	.word 0xba30800b  ! 186: SUBC_R	orn 	%r2, %r11, %r29
	setx  0x1b1fe40ba893d4ef, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb3c44000  ! 189: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xb6d9a43c  ! 190: SMULcc_I	smulcc 	%r6, 0x043c, %r27
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb4b9800e  ! 194: XNORcc_R	xnorcc 	%r6, %r14, %r26
	.word 0xac8222a6  ! 194: ADDcc_I	addcc 	%r8, 0x02a6, %r22
	.word 0xaf29b001  ! 194: SLLX_I	sllx	%r6, 0x0001, %r23
	.word 0xb728900b  ! 195: SLLX_R	sllx	%r2, %r11, %r27
	.word 0xb619000e  ! 195: XOR_R	xor 	%r4, %r14, %r27
	.word 0xa8b16cc4  ! 195: ORNcc_I	orncc 	%r5, 0x0cc4, %r20
	.word 0xb219e266  ! 195: XOR_I	xor 	%r7, 0x0266, %r25
	setx  0x033f4545832f72f9, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,6)
	.word 0xf211c000  ! 198: LDUH_R	lduh	[%r7 + %r0], %r25
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xb5c44000  ! 200: JMPL_R	jmpl	%r17 + %r0, %r26
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb6b1eee2  ! 206: ORNcc_I	orncc 	%r7, 0x0ee2, %r27
	setx  0x1dff18c2ededd1d0, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,22,x, x,x,x, x,x,x)
	.word 0xb5c44040  ! 209: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb2496dd0  ! 210: MULX_I	mulx 	%r5, 0x0dd0, %r25
	.word 0xa892000e  ! 212: ORcc_R	orcc 	%r8, %r14, %r20
	setx  0xc31ff591f4b2c28e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xe8292bb2  ! 214: STB_I	stb	%r20, [%r4 + 0x0bb2]
	.word 0xf428ee0b  ! 214: STB_I	stb	%r26, [%r3 + 0x0e0b]
	.word 0xfc72000d  ! 214: STX_R	stx	%r30, [%r8 + %r13]
	.word 0xf429acf3  ! 214: STB_I	stb	%r26, [%r6 + 0x0cf3]
	.word 0xec71ad7d  ! 214: STX_I	stx	%r22, [%r6 + 0x0d7d]
	.word 0xf87121d1  ! 214: STX_I	stx	%r28, [%r4 + 0x01d1]
	.word 0xfa31e1a4  ! 214: STH_I	sth	%r29, [%r7 + 0x01a4]
	.word 0xf820c00d  ! 214: STW_R	stw	%r28, [%r3 + %r13]
	.word 0xf62a22fb  ! 214: STB_I	stb	%r27, [%r8 + 0x02fb]
	.word 0xfc30aaa4  ! 214: STH_I	sth	%r30, [%r2 + 0x0aa4]
	.word 0xfc29000b  ! 214: STB_R	stb	%r30, [%r4 + %r11]
	.word 0xf82a225d  ! 214: STB_I	stb	%r28, [%r8 + 0x025d]
	.word 0xb5c44000  ! 215: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xee312df6  ! 217: STH_I	sth	%r23, [%r4 + 0x0df6]
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xba00808c
	.word 0xb729900d  ! 221: SLLX_R	sllx	%r6, %r13, %r27
	.word 0xb238a895  ! 223: XNOR_I	xnor 	%r2, 0x0895, %r25
	.word 0xab393001  ! 225: SRAX_I	srax	%r4, 0x0001, %r21
	.word 0xb419a9fc  ! 227: XOR_I	xor 	%r6, 0x09fc, %r26
	.word 0xbc996b48  ! 229: XORcc_I	xorcc 	%r5, 0x0b48, %r30
	.word 0xbb38e001  ! 231: SRA_I	sra 	%r3, 0x0001, %r29
	setx  0x675f00ffb3f27594, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,28)
	.word 0xfa58c000  ! 235: LDX_R	ldx	[%r3 + %r0], %r29
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 237: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xad323001  ! 240: SRLX_I	srlx	%r8, 0x0001, %r22
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0x91bff97f5ff959d5, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,58)
	.word 0xec520000  ! 245: LDSH_R	ldsh	[%r8 + %r0], %r22
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xbbc44040  ! 247: JMPL_R	jmpl	%r17 + %r0, %r29
thr0_ic_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,IR,10,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0xdf9fba4311b8fb3a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,8)
	.word 0xec5a0000  ! 255: LDX_R	ldx	[%r8 + %r0], %r22
	.word 0xabc44000  ! 257: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_10), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xb498c00f  ! 260: XORcc_R	xorcc 	%r3, %r15, %r26
	setx  0xd88f324833920371, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,51)
	.word 0xf450c000  ! 264: LDSH_R	ldsh	[%r3 + %r0], %r26
	.word 0xb3c44000  ! 266: JMPL_R	jmpl	%r17 + %r0, %r25
thr0_ic_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_11), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xba00808c
	setx  0x0ccf9c6d74dcf9f8, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,35)
	.word 0xf458c000  ! 272: LDX_R	ldx	[%r3 + %r0], %r26
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xbbc44000  ! 274: JMPL_R	jmpl	%r17 + %r0, %r29
thr0_ic_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_12), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xba90c00c  ! 277: ORcc_R	orcc 	%r3, %r12, %r29
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaa90a2e6  ! 281: ORcc_I	orcc 	%r2, 0x02e6, %r21
	setx  0x23ef7544d21e435d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 285: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xba00808c
thr0_ic_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_13), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0xd30f098829806bf2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,24)
	.word 0xea408000  ! 293: LDSW_R	ldsw	[%r2 + %r0], %r21
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 295: JMPL_R	jmpl	%r17 + %r0, %r24
thr0_ic_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_14), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xb6296646  ! 298: ANDN_I	andn 	%r5, 0x0646, %r27
	.word 0xb378e401  ! 301: MOVR_I	move	%r3, 0x7fffbc90, %r25
	setx  0xb57f895e7fbd4e97, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xbbc44040  ! 304: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb0f1000d  ! 305: UDIVcc_R	udivcc 	%r4, %r13, %r24
	.word 0xb000c00a  ! 308: ADD_R	add 	%r3, %r10, %r24
	setx  0xd5efe539d53a3c77, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xbbc44040  ! 311: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb521400a  ! 312: MULScc_R	mulscc 	%r5, %r10, %r26
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb764180f  ! 315: MOVcc_R	<illegal instruction>
	setx  0x7aaf38b7af7503e2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
	.word 0xb1c44000  ! 319: JMPL_R	jmpl	%r17 + %r0, %r24
thr0_ic_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_15), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xaaa9800b  ! 322: ANDNcc_R	andncc 	%r6, %r11, %r21
	.word 0xae11edd6  ! 324: OR_I	or 	%r7, 0x0dd6, %r23
	setx  0x068f005ceda00688, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf229c00c  ! 326: STB_R	stb	%r25, [%r7 + %r12]
	.word 0xe82a249c  ! 326: STB_I	stb	%r20, [%r8 + 0x049c]
	.word 0xf6712954  ! 326: STX_I	stx	%r27, [%r4 + 0x0954]
	.word 0xf029800a  ! 326: STB_R	stb	%r24, [%r6 + %r10]
	.word 0xf431000e  ! 326: STH_R	sth	%r26, [%r4 + %r14]
	.word 0xf021a43b  ! 326: STW_I	stw	%r24, [%r6 + 0x043b]
	.word 0xf020800e  ! 326: STW_R	stw	%r24, [%r2 + %r14]
	.word 0xfc32000e  ! 326: STH_R	sth	%r30, [%r8 + %r14]
	.word 0xec7120fe  ! 326: STX_I	stx	%r22, [%r4 + 0x00fe]
	.word 0xec70800d  ! 326: STX_R	stx	%r22, [%r2 + %r13]
	.word 0xfc71c00e  ! 326: STX_R	stx	%r30, [%r7 + %r14]
	.word 0xadc44040  ! 327: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xf472008d
thr0_ic_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_16), 16, 16),1,IC_DATA,IR,12,x)
	.word 0xba00808c
	.word 0xb632000b  ! 332: ORN_R	orn 	%r8, %r11, %r27
	.word 0xaa42000c  ! 334: ADDC_R	addc 	%r8, %r12, %r21
	.word 0xb440a97d  ! 336: ADDC_I	addc 	%r2, 0x097d, %r26
	.word 0xb8aa000f  ! 338: ANDNcc_R	andncc 	%r8, %r15, %r28
	.word 0xb3312001  ! 340: SRL_I	srl 	%r4, 0x0001, %r25
	.word 0xac88a0a6  ! 342: ANDcc_I	andcc 	%r2, 0x00a6, %r22
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x24af9fb7d62e1f38, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,2)
	.word 0xec108000  ! 347: LDUH_R	lduh	[%r2 + %r0], %r22
	.word 0xb3c44000  ! 349: JMPL_R	jmpl	%r17 + %r0, %r25
thr0_ic_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_17), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xb328b001  ! 352: SLLX_I	sllx	%r2, 0x0001, %r25
	.word 0xba91e94e  ! 354: ORcc_I	orcc 	%r7, 0x094e, %r29
	.word 0xae90800d  ! 354: ORcc_R	orcc 	%r2, %r13, %r23
	.word 0xb811c00a  ! 354: OR_R	or 	%r7, %r10, %r28
	.word 0xba28aaf6  ! 356: ANDN_I	andn 	%r2, 0x0af6, %r29
	setx  0xf9cfcf0c509f6eac, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb1c44040  ! 359: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xb251c00f  ! 360: UMUL_R	umul 	%r7, %r15, %r25
	.word 0xb439a6d1  ! 363: XNOR_I	xnor 	%r6, 0x06d1, %r26
	setx  0xe86f91d659dd41ab, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xb9c44000  ! 366: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xbc50e6dd  ! 367: UMUL_I	umul 	%r3, 0x06dd, %r30
	.word 0xa938d00f  ! 369: SRAX_R	srax	%r3, %r15, %r20
	setx  0xd1af11dc694984ba, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xea7167a5  ! 371: STX_I	stx	%r21, [%r5 + 0x07a5]
	.word 0xf029000e  ! 371: STB_R	stb	%r24, [%r4 + %r14]
	.word 0xf232000f  ! 371: STH_R	sth	%r25, [%r8 + %r15]
	.word 0xea31800c  ! 371: STH_R	sth	%r21, [%r6 + %r12]
	.word 0xec20ec84  ! 371: STW_I	stw	%r22, [%r3 + 0x0c84]
	.word 0xf428a327  ! 371: STB_I	stb	%r26, [%r2 + 0x0327]
	.word 0xf431000e  ! 371: STH_R	sth	%r26, [%r4 + %r14]
	.word 0xea31000c  ! 371: STH_R	sth	%r21, [%r4 + %r12]
	.word 0xe8312f62  ! 371: STH_I	sth	%r20, [%r4 + 0x0f62]
	.word 0xfa21224c  ! 371: STW_I	stw	%r29, [%r4 + 0x024c]
	.word 0xfc322e59  ! 371: STH_I	sth	%r30, [%r8 + 0x0e59]
	.word 0xf220ae9f  ! 371: STW_I	stw	%r25, [%r2 + 0x0e9f]
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 372: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xfc72203f  ! 374: STX_I	stx	%r30, [%r8 + 0x003f]
thr0_ic_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_18), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xbb29c00d  ! 377: SLL_R	sll 	%r7, %r13, %r29
	.word 0xaa28a814  ! 379: ANDN_I	andn 	%r2, 0x0814, %r21
	.word 0xb128d00d  ! 381: SLLX_R	sllx	%r3, %r13, %r24
	.word 0xb832000e  ! 383: SUBC_R	orn 	%r8, %r14, %r28
	.word 0xbc81c00d  ! 385: ADDcc_R	addcc 	%r7, %r13, %r30
	.word 0xac09000e  ! 387: AND_R	and 	%r4, %r14, %r22
	.word 0xbb29f001  ! 389: SLLX_I	sllx	%r7, 0x0001, %r29
	.word 0xba18ae7c  ! 391: XOR_I	xor 	%r2, 0x0e7c, %r29
	.word 0xad31e001  ! 391: SRL_I	srl 	%r7, 0x0001, %r22
	.word 0xb730900f  ! 391: SRLX_R	srlx	%r2, %r15, %r27
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xaab8e23a  ! 393: XNORcc_I	xnorcc 	%r3, 0x023a, %r21
	.word 0xb428800d  ! 393: ANDN_R	andn 	%r2, %r13, %r26
	.word 0xad78a401  ! 393: MOVR_I	move	%r2, 0xfffffeb0, %r22
	.word 0xbcb1c00b  ! 393: ORNcc_R	orncc 	%r7, %r11, %r30
	.word 0xae01800a  ! 395: ADD_R	add 	%r6, %r10, %r23
	setx  0xf5cf0e8b474931b4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44000  ! 398: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb459c00b  ! 399: SMUL_R	smul 	%r7, %r11, %r26
	.word 0xb531c00b  ! 401: SRL_R	srl 	%r7, %r11, %r26
	.word 0xb629e9aa  ! 401: ANDN_I	andn 	%r7, 0x09aa, %r27
	.word 0xb8a9ed4f  ! 401: ANDNcc_I	andncc 	%r7, 0x0d4f, %r28
	.word 0xa938800d  ! 401: SRA_R	sra 	%r2, %r13, %r20
	.word 0xb439eef8  ! 402: XNOR_I	xnor 	%r7, 0x0ef8, %r26
	setx  0x7befc46d457b5bef, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xafc44000  ! 406: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xba00808c
	.word 0xbcc0800e  ! 410: ADDCcc_R	addccc 	%r2, %r14, %r30
	.word 0xaa41800d  ! 412: ADDC_R	addc 	%r6, %r13, %r21
	.word 0xb2922f77  ! 412: ORcc_I	orcc 	%r8, 0x0f77, %r25
	.word 0xa978c40f  ! 412: MOVR_R	move	%r3, %r15, %r20
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb3643801  ! 415: MOVcc_I	<illegal instruction>
	setx  0x116fb8a8d4162ff8, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xbdc44000  ! 418: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xacf9ef25  ! 419: SDIVcc_I	sdivcc 	%r7, 0x0f25, %r22
	.word 0xa8916ced  ! 421: ORcc_I	orcc 	%r5, 0x0ced, %r20
	.word 0xa889e3f7  ! 421: ANDcc_I	andcc 	%r7, 0x03f7, %r20
	.word 0xaac1000a  ! 421: ADDCcc_R	addccc 	%r4, %r10, %r21
	.word 0xb7296001  ! 423: SLL_I	sll 	%r5, 0x0001, %r27
	setx  0x9c0f443531806e53, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb7c44000  ! 426: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xb2d0c00f  ! 427: UMULcc_R	umulcc 	%r3, %r15, %r25
	.word 0xb539900d  ! 430: SRAX_R	srax	%r6, %r13, %r26
	setx  0x8ebf5d49d69fcaaa, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xabc44040  ! 433: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xb8f0c00e  ! 434: UDIVcc_R	udivcc 	%r3, %r14, %r28
	.word 0xae09c00a  ! 436: AND_R	and 	%r7, %r10, %r23
	.word 0xb489800f  ! 436: ANDcc_R	andcc 	%r6, %r15, %r26
	.word 0xb690800b  ! 436: ORcc_R	orcc 	%r2, %r11, %r27
	.word 0xb43920c1  ! 436: XNOR_I	xnor 	%r4, 0x00c1, %r26
	.word 0xb618e127  ! 436: XOR_I	xor 	%r3, 0x0127, %r27
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0x952f1f23c8bdfd7e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,16)
	.word 0xf650c000  ! 440: LDSH_R	ldsh	[%r3 + %r0], %r27
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xb9c44040  ! 442: JMPL_R	jmpl	%r17 + %r0, %r28
thr0_ic_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_19), 16, 16),1,IC_DATA,IR,31,x)
	.word 0xba00808c
	setx  0x358ff4f9891b9fad, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,60)
	.word 0xf600c000  ! 448: LDUW_R	lduw	[%r3 + %r0], %r27
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xafc44040  ! 450: JMPL_R	jmpl	%r17 + %r0, %r23
thr0_ic_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_20), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xb291400c  ! 453: ORcc_R	orcc 	%r5, %r12, %r25
	.word 0xb611800c  ! 456: OR_R	or 	%r6, %r12, %r27
	setx  0x113f57932addcacb, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 459: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xb120800a  ! 460: MULScc_R	mulscc 	%r2, %r10, %r24
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0xa53f81ac0de190ec, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,68)
	.word 0xf0088000  ! 465: LDUB_R	ldub	[%r2 + %r0], %r24
	.word 0xb7c44040  ! 467: JMPL_R	jmpl	%r17 + %r0, %r27
thr0_ic_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_21), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xb231223e  ! 470: ORN_I	orn 	%r4, 0x023e, %r25
	.word 0xaf31e001  ! 472: SRL_I	srl 	%r7, 0x0001, %r23
	setx  0x020fdb828f7858f7, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xafc44040  ! 476: JMPL_R	jmpl	%r17 + %r0, %r23
thr0_ic_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_22), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xba99000d  ! 479: XORcc_R	xorcc 	%r4, %r13, %r29
	setx  0xe1dfda707266115a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,16)
	.word 0xfa090000  ! 483: LDUB_R	ldub	[%r4 + %r0], %r29
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 485: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xb131f001  ! 488: SRLX_I	srlx	%r7, 0x0001, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x2e4f85c33cb3d767, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,18)
	.word 0xf009c000  ! 493: LDUB_R	ldub	[%r7 + %r0], %r24
	.word 0xbdc44040  ! 495: JMPL_R	jmpl	%r17 + %r0, %r30
thr0_ic_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_23), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xba39400b  ! 498: XNOR_R	xnor 	%r5, %r11, %r29
	setx  0x294f71085e25d69a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,30)
	.word 0xfa114000  ! 502: LDUH_R	lduh	[%r5 + %r0], %r29
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xbdc44040  ! 504: JMPL_R	jmpl	%r17 + %r0, %r30
thr0_ic_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_24), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xb529400c  ! 507: SLL_R	sll 	%r5, %r12, %r26
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb20a000b  ! 512: AND_R	and 	%r8, %r11, %r25
	setx  0x82afddeef4185352, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xafc44040  ! 515: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb851800c  ! 516: UMUL_R	umul 	%r6, %r12, %r28
	.word 0xb8a9603b  ! 518: ANDNcc_I	andncc 	%r5, 0x003b, %r28
	setx  0x640f3bc40c181e39, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xbdc44000  ! 522: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xb778840e  ! 524: MOVR_R	move	%r2, %r14, %r27
thr0_ic_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_25), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xb2222e01  ! 527: SUB_I	sub 	%r8, 0x0e01, %r25
	setx  0x6ccfa04ae1958312, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,24)
	.word 0xf2120000  ! 531: LDUH_R	lduh	[%r8 + %r0], %r25
	.word 0xb1c44000  ! 533: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xb811a0b6  ! 536: OR_I	or 	%r6, 0x00b6, %r28
	.word 0xba28800c  ! 538: ANDN_R	andn 	%r2, %r12, %r29
	.word 0xba98ed6b  ! 538: XORcc_I	xorcc 	%r3, 0x0d6b, %r29
	.word 0xb730800b  ! 538: SRL_R	srl 	%r2, %r11, %r27
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0xd32fc14549fbd25b, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,55)
	.word 0xf6508000  ! 544: LDSH_R	ldsh	[%r2 + %r0], %r27
	.word 0xabc44000  ! 546: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_26), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xba0a2d8a  ! 549: AND_I	and 	%r8, 0x0d8a, %r29
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0xb60fb9293ebbc2b5, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,64)
	.word 0xfa120000  ! 554: LDUH_R	lduh	[%r8 + %r0], %r29
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xb7c44000  ! 556: JMPL_R	jmpl	%r17 + %r0, %r27
thr0_ic_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_27), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xb2b0800a  ! 559: ORNcc_R	orncc 	%r2, %r10, %r25
	.word 0xad29f001  ! 561: SLLX_I	sllx	%r7, 0x0001, %r22
	.word 0xad29100a  ! 561: SLLX_R	sllx	%r4, %r10, %r22
	.word 0xb8912690  ! 561: ORcc_I	orcc 	%r4, 0x0690, %r28
	setx  0x8d6f0217b1c3bbcf, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_22), 16, 16),1,DC_DATA,41)
	.word 0xf8490000  ! 564: LDSB_R	ldsb	[%r4 + %r0], %r28
	.word 0xbbc44000  ! 566: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xaea9800b  ! 569: ANDNcc_R	andncc 	%r6, %r11, %r23
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xac392764  ! 575: XNOR_I	xnor 	%r4, 0x0764, %r22
	setx  0xe8bfe924a2c1a6ba, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 579: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xba00808c
thr0_ic_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_28), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb442000f  ! 585: ADDC_R	addc 	%r8, %r15, %r26
	.word 0xbb30c00d  ! 585: SRL_R	srl 	%r3, %r13, %r29
	.word 0xbc912a1f  ! 585: ORcc_I	orcc 	%r4, 0x0a1f, %r30
	setx  0x24cff7058241aee4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_23), 16, 16),1,DC_DATA,31)
	.word 0xfc490000  ! 588: LDSB_R	ldsb	[%r4 + %r0], %r30
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 590: JMPL_R	jmpl	%r17 + %r0, %r27
thr0_ic_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_29), 16, 16),1,IC_DATA,IR,6,x)
	.word 0xaeb8a095  ! 593: XNORcc_I	xnorcc 	%r2, 0x0095, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaea1800a  ! 597: SUBcc_R	subcc 	%r6, %r10, %r23
	setx  0xc72f0791c0cec16d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb5c44000  ! 600: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xf381d00b  ! 601: LDFA_R	lda	[%r7, %r11], %f25
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xaea9400e  ! 606: ANDNcc_R	andncc 	%r5, %r14, %r23
	setx  0x96af48e2e2067c46, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 609: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xa878e186  ! 610: SDIV_I	sdiv 	%r3, 0x0186, %r20
	.word 0xba31800e  ! 612: SUBC_R	orn 	%r6, %r14, %r29
	setx  0xf03f11526224a2ae, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf270eea5  ! 614: STX_I	stx	%r25, [%r3 + 0x0ea5]
	.word 0xf631000a  ! 614: STH_R	sth	%r27, [%r4 + %r10]
	.word 0xee21400c  ! 614: STW_R	stw	%r23, [%r5 + %r12]
	.word 0xf429400f  ! 614: STB_R	stb	%r26, [%r5 + %r15]
	.word 0xf670c00c  ! 614: STX_R	stx	%r27, [%r3 + %r12]
	.word 0xfa71e862  ! 614: STX_I	stx	%r29, [%r7 + 0x0862]
	.word 0xfa20800d  ! 614: STW_R	stw	%r29, [%r2 + %r13]
	.word 0xe831000a  ! 614: STH_R	sth	%r20, [%r4 + %r10]
	.word 0xea3120e4  ! 614: STH_I	sth	%r21, [%r4 + 0x00e4]
	.word 0xfc21a18c  ! 614: STW_I	stw	%r30, [%r6 + 0x018c]
	.word 0xf620a564  ! 614: STW_I	stw	%r27, [%r2 + 0x0564]
	.word 0xe830800b  ! 614: STH_R	sth	%r20, [%r2 + %r11]
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 615: JMPL_R	jmpl	%r17 + %r0, %r25
thr0_ic_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_30), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xe832000c  ! 618: STH_R	sth	%r20, [%r8 + %r12]
thr0_ic_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_31), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xaa80800f  ! 621: ADDcc_R	addcc 	%r2, %r15, %r21
	.word 0xb338800c  ! 623: SRA_R	sra 	%r2, %r12, %r25
	.word 0xb6b9c00f  ! 625: XNORcc_R	xnorcc 	%r7, %r15, %r27
	.word 0xad79c40a  ! 627: MOVR_R	move	%r7, %r10, %r22
	.word 0xb20a208e  ! 629: AND_I	and 	%r8, 0x008e, %r25
	.word 0xa92a000f  ! 631: SLL_R	sll 	%r8, %r15, %r20
	.word 0xaac0800c  ! 633: ADDCcc_R	addccc 	%r2, %r12, %r21
	setx  0x731f387e5903857d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_24), 16, 16),1,DC_DATA,65)
	.word 0xea188000  ! 637: LDD_R	ldd	[%r2 + %r0], %r21
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 639: JMPL_R	jmpl	%r17 + %r0, %r27
thr0_ic_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_32), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xac21000b  ! 642: SUB_R	sub 	%r4, %r11, %r22
	.word 0xac99400c  ! 645: XORcc_R	xorcc 	%r5, %r12, %r22
	setx  0xf5ef569059940655, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xbbc44040  ! 648: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb521a741  ! 649: MULScc_I	mulscc 	%r6, 0x0741, %r26
	setx  0x5a5f2afd34acb2c1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_25), 16, 16),1,DC_DATA,14)
	.word 0xf4418000  ! 653: LDSW_R	ldsw	[%r6 + %r0], %r26
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xb5c44040  ! 655: JMPL_R	jmpl	%r17 + %r0, %r26
thr0_ic_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_33), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xb43166c8  ! 658: ORN_I	orn 	%r5, 0x06c8, %r26
	.word 0xaa99000b  ! 660: XORcc_R	xorcc 	%r4, %r11, %r21
	.word 0xb230800f  ! 660: ORN_R	orn 	%r2, %r15, %r25
	.word 0xa931100e  ! 660: SRLX_R	srlx	%r4, %r14, %r20
	.word 0xad30d00c  ! 660: SRLX_R	srlx	%r3, %r12, %r22
	.word 0xb039000a  ! 660: XNOR_R	xnor 	%r4, %r10, %r24
	.word 0xb8b1eaf0  ! 661: ORNcc_I	orncc 	%r7, 0x0af0, %r28
	setx  0x15cf7d1f38fbaab6, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 665: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xba00808c
thr0_ic_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_34), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xa8812734  ! 672: ADDcc_I	addcc 	%r4, 0x0734, %r20
	setx  0xe6dfa3c6d80a4057, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xa9c44040  ! 676: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xba00808c
thr0_ic_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_35), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xa892000c  ! 680: ORcc_R	orcc 	%r8, %r12, %r20
	setx  0xf27fa4d4b7815492, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_26), 16, 16),1,DC_DATA,38)
	.word 0xe84a0000  ! 684: LDSB_R	ldsb	[%r8 + %r0], %r20
	.word 0xa9c44040  ! 686: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xbc01400f  ! 689: ADD_R	add 	%r5, %r15, %r30
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xbd79c40f  ! 692: MOVR_R	move	%r7, %r15, %r30
	setx  0x532f5770973cd197, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xbbc44000  ! 696: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xa93a000c  ! 698: SRA_R	sra 	%r8, %r12, %r20
thr0_ic_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_36), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xba00808c
	.word 0xaa88800f  ! 702: ANDcc_R	andcc 	%r2, %r15, %r21
	.word 0xb609800f  ! 702: AND_R	and 	%r6, %r15, %r27
	.word 0xb639e0e1  ! 702: XNOR_I	xnor 	%r7, 0x00e1, %r27
	setx  0xd25f10ca85b02fd1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_27), 16, 16),1,DC_DATA,26)
	.word 0xf601c000  ! 705: LDUW_R	lduw	[%r7 + %r0], %r27
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xbbc44000  ! 707: JMPL_R	jmpl	%r17 + %r0, %r29
thr0_ic_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_37), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xb7643801  ! 710: MOVcc_I	<illegal instruction>
	.word 0xaca9800c  ! 712: ANDNcc_R	andncc 	%r6, %r12, %r22
	setx  0x6f8f70444abc7ba7, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16),1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 715: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xa8492dfb  ! 716: MULX_I	mulx 	%r4, 0x0dfb, %r20
	.word 0xb131e001  ! 718: SRL_I	srl 	%r7, 0x0001, %r24
	setx  0xdddf0d61f847e454, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb3c44000  ! 722: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xb288c00b  ! 724: ANDcc_R	andcc 	%r3, %r11, %r25
thr0_ic_err_38:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_38), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xba00808c
	.word 0xa8992ddd  ! 728: XORcc_I	xorcc 	%r4, 0x0ddd, %r20
	.word 0xae41a565  ! 728: ADDC_I	addc 	%r6, 0x0565, %r23
	.word 0xb641a723  ! 728: ADDC_I	addc 	%r6, 0x0723, %r27
	.word 0xbcb0c00c  ! 728: ORNcc_R	orncc 	%r3, %r12, %r30
	.word 0xa808a0a0  ! 728: AND_I	and 	%r2, 0x00a0, %r20
	.word 0xb030a8be  ! 729: ORN_I	orn 	%r2, 0x08be, %r24
	setx  0xed7f697860e79e52, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xea716f14  ! 731: STX_I	stx	%r21, [%r5 + 0x0f14]
	.word 0xf671800e  ! 731: STX_R	stx	%r27, [%r6 + %r14]
	.word 0xf2222034  ! 731: STW_I	stw	%r25, [%r8 + 0x0034]
	.word 0xfc71ebea  ! 731: STX_I	stx	%r30, [%r7 + 0x0bea]
	.word 0xee21aaab  ! 731: STW_I	stw	%r23, [%r6 + 0x0aab]
	.word 0xfa216a20  ! 731: STW_I	stw	%r29, [%r5 + 0x0a20]
	.word 0xf831000b  ! 731: STH_R	sth	%r28, [%r4 + %r11]
	.word 0xe828800d  ! 731: STB_R	stb	%r20, [%r2 + %r13]
	.word 0xfc3165c6  ! 731: STH_I	sth	%r30, [%r5 + 0x05c6]
	.word 0xe831800f  ! 731: STH_R	sth	%r20, [%r6 + %r15]
thr0_irf_ce_39:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_39), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 732: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xec28c00a  ! 734: STB_R	stb	%r22, [%r3 + %r10]
	.word 0xb6c0800b  ! 737: ADDCcc_R	addccc 	%r2, %r11, %r27
	.word 0xb640800d  ! 739: ADDC_R	addc 	%r2, %r13, %r27
	.word 0xbaa16e12  ! 741: SUBcc_I	subcc 	%r5, 0x0e12, %r29
	.word 0xb889ad55  ! 743: ANDcc_I	andcc 	%r6, 0x0d55, %r28
	.word 0xb928c00e  ! 745: SLL_R	sll 	%r3, %r14, %r28
	.word 0xbd30d00b  ! 747: SRLX_R	srlx	%r3, %r11, %r30
	.word 0xbd79840c  ! 749: MOVR_R	move	%r6, %r12, %r30
	setx  0x505feaae99aafad2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_28), 16, 16),1,DC_DATA,15)
	.word 0xfc018000  ! 753: LDUW_R	lduw	[%r6 + %r0], %r30
	.word 0xa9c44000  ! 755: JMPL_R	jmpl	%r17 + %r0, %r20
thr0_ic_err_39:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_39), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xa831a918  ! 758: SUBC_I	orn 	%r6, 0x0918, %r20
	.word 0xbc39800d  ! 760: XNOR_R	xnor 	%r6, %r13, %r30
	setx  0x29bfdfea4518a8a3, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf029c00d  ! 762: STB_R	stb	%r24, [%r7 + %r13]
	.word 0xfc28a045  ! 762: STB_I	stb	%r30, [%r2 + 0x0045]
	.word 0xf630c00a  ! 762: STH_R	sth	%r27, [%r3 + %r10]
	.word 0xf871a80c  ! 762: STX_I	stx	%r28, [%r6 + 0x080c]
	.word 0xf829216f  ! 762: STB_I	stb	%r28, [%r4 + 0x016f]
	.word 0xee21ee3f  ! 762: STW_I	stw	%r23, [%r7 + 0x0e3f]
	.word 0xf230800e  ! 762: STH_R	sth	%r25, [%r2 + %r14]
	.word 0xee3125fa  ! 762: STH_I	sth	%r23, [%r4 + 0x05fa]
thr0_irf_ce_40:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_40), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xafc44040  ! 763: JMPL_R	jmpl	%r17 + %r0, %r23
thr0_ic_err_40:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_40), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xe821a0cc  ! 766: STW_I	stw	%r20, [%r6 + 0x00cc]
	.word 0xbd28e001  ! 769: SLL_I	sll 	%r3, 0x0001, %r30
	.word 0xb6822b76  ! 771: ADDcc_I	addcc 	%r8, 0x0b76, %r27
	.word 0xb164180d  ! 773: MOVcc_R	<illegal instruction>
	.word 0xb564180e  ! 775: MOVcc_R	<illegal instruction>
	.word 0xb408c00a  ! 777: AND_R	and 	%r3, %r10, %r26
	.word 0xaa00800c  ! 779: ADD_R	add 	%r2, %r12, %r21
	.word 0xb4a1800b  ! 781: SUBcc_R	subcc 	%r6, %r11, %r26
	setx  0x731fccfbe63492be, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_29), 16, 16),1,DC_DATA,23)
	.word 0xf4498000  ! 785: LDSB_R	ldsb	[%r6 + %r0], %r26
	.word 0xa9c44000  ! 787: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xbd31d00d  ! 790: SRLX_R	srlx	%r7, %r13, %r30
	.word 0xb608a64d  ! 792: AND_I	and 	%r2, 0x064d, %r27
	setx  0x798f9d12e8453fb2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xec20e82e  ! 794: STW_I	stw	%r22, [%r3 + 0x082e]
	.word 0xee28800c  ! 794: STB_R	stb	%r23, [%r2 + %r12]
	.word 0xf070a4dd  ! 794: STX_I	stx	%r24, [%r2 + 0x04dd]
	.word 0xe829a148  ! 794: STB_I	stb	%r20, [%r6 + 0x0148]
	.word 0xfc20c00f  ! 794: STW_R	stw	%r30, [%r3 + %r15]
	.word 0xfc29e765  ! 794: STB_I	stb	%r30, [%r7 + 0x0765]
	.word 0xf0292f8e  ! 794: STB_I	stb	%r24, [%r4 + 0x0f8e]
	.word 0xf220c00d  ! 794: STW_R	stw	%r25, [%r3 + %r13]
	.word 0xf021000a  ! 794: STW_R	stw	%r24, [%r4 + %r10]
	.word 0xfc30c00b  ! 794: STH_R	sth	%r30, [%r3 + %r11]
	.word 0xf831800f  ! 794: STH_R	sth	%r28, [%r6 + %r15]
	.word 0xe82929d5  ! 794: STB_I	stb	%r20, [%r4 + 0x09d5]
	.word 0xafc44000  ! 795: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xf870ad07  ! 797: STX_I	stx	%r28, [%r2 + 0x0d07]
thr0_ic_err_41:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_41), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xba00808c
	.word 0xb329f001  ! 801: SLLX_I	sllx	%r7, 0x0001, %r25
	.word 0xb299254c  ! 803: XORcc_I	xorcc 	%r4, 0x054c, %r25
	.word 0xba00e2c9  ! 805: ADD_I	add 	%r3, 0x02c9, %r29
	.word 0xb9317001  ! 807: SRLX_I	srlx	%r5, 0x0001, %r28
	.word 0xb33a3001  ! 809: SRAX_I	srax	%r8, 0x0001, %r25
	.word 0xb290aa19  ! 811: ORcc_I	orcc 	%r2, 0x0a19, %r25
	setx  0x202fb4991b9d375a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_30), 16, 16),1,DC_DATA,4)
	.word 0xf2488000  ! 815: LDSB_R	ldsb	[%r2 + %r0], %r25
thr0_irf_ce_41:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_41), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xb5c44000  ! 817: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb031000c  ! 820: ORN_R	orn 	%r4, %r12, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb328a001  ! 823: SLL_I	sll 	%r2, 0x0001, %r25
	.word 0xae81a940  ! 823: ADDcc_I	addcc 	%r6, 0x0940, %r23
	.word 0xb028e2ee  ! 823: ANDN_I	andn 	%r3, 0x02ee, %r24
	.word 0xbaba2dab  ! 823: XNORcc_I	xnorcc 	%r8, 0x0dab, %r29
	.word 0xb132000e  ! 823: SRL_R	srl 	%r8, %r14, %r24
	.word 0xa8b8800c  ! 824: XNORcc_R	xnorcc 	%r2, %r12, %r20
	.word 0xb2b9ac80  ! 824: XNORcc_I	xnorcc 	%r6, 0x0c80, %r25
	.word 0xbb28f001  ! 824: SLLX_I	sllx	%r3, 0x0001, %r29
	.word 0xaec1400b  ! 824: ADDCcc_R	addccc 	%r5, %r11, %r23
	setx  0x812ff3d8f41dbb3c, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_31), 16, 16),1,DC_DATA,48)
	.word 0xee594000  ! 827: LDX_R	ldx	[%r5 + %r0], %r23
	.word 0xb1c44040  ! 829: JMPL_R	jmpl	%r17 + %r0, %r24
thr0_ic_err_42:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_42), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xb489c00e  ! 832: ANDcc_R	andcc 	%r7, %r14, %r26
	.word 0xae0928d0  ! 835: AND_I	and 	%r4, 0x08d0, %r23
	setx  0x052f857509926d72, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_42:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_42), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 838: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xaef2000e  ! 839: UDIVcc_R	udivcc 	%r8, %r14, %r23
	.word 0xb618800e  ! 841: XOR_R	xor 	%r2, %r14, %r27
	setx  0x9c3f7a13ef38431b, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb3c44040  ! 845: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xba00808c
	.word 0xae21000c  ! 849: SUB_R	sub 	%r4, %r12, %r23
	.word 0xa840800a  ! 851: ADDC_R	addc 	%r2, %r10, %r20
	setx  0xbdff3820482c6626, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf420800a  ! 853: STW_R	stw	%r26, [%r2 + %r10]
	.word 0xf271400b  ! 853: STX_R	stx	%r25, [%r5 + %r11]
	.word 0xec21400c  ! 853: STW_R	stw	%r22, [%r5 + %r12]
	.word 0xe872000a  ! 853: STX_R	stx	%r20, [%r8 + %r10]
	.word 0xec29adcf  ! 853: STB_I	stb	%r22, [%r6 + 0x0dcf]
	.word 0xee71ad6e  ! 853: STX_I	stx	%r23, [%r6 + 0x0d6e]
	.word 0xe8222980  ! 853: STW_I	stw	%r20, [%r8 + 0x0980]
	.word 0xea21400a  ! 853: STW_R	stw	%r21, [%r5 + %r10]
	.word 0xb7c44040  ! 854: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xf472008d
thr0_ic_err_43:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_43), 16, 16),1,IC_DATA,IR,8,x)
	.word 0xba00808c
	.word 0xbb3a3001  ! 859: SRAX_I	srax	%r8, 0x0001, %r29
	.word 0xb090a4ac  ! 861: ORcc_I	orcc 	%r2, 0x04ac, %r24
	.word 0xb689a92e  ! 863: ANDcc_I	andcc 	%r6, 0x092e, %r27
	.word 0xacb0c00a  ! 865: ORNcc_R	orncc 	%r3, %r10, %r22
	.word 0xb030c00d  ! 867: ORN_R	orn 	%r3, %r13, %r24
	.word 0xbaa0c00e  ! 869: SUBcc_R	subcc 	%r3, %r14, %r29
	.word 0xb802000e  ! 871: ADD_R	add 	%r8, %r14, %r28
	setx  0x3dff27584bad43cd, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xafc44000  ! 875: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb8b8800f  ! 877: XNORcc_R	xnorcc 	%r2, %r15, %r28
thr0_ic_err_44:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_44), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xb2a1000f  ! 880: SUBcc_R	subcc 	%r4, %r15, %r25
	.word 0xaac1a38e  ! 882: ADDCcc_I	addccc 	%r6, 0x038e, %r21
	setx  0x32cfafc6bd9fad84, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
thr0_irf_ce_43:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_43), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xbdc44000  ! 886: JMPL_R	jmpl	%r17 + %r0, %r30
thr0_ic_err_45:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_45), 16, 16),1,IC_DATA,IR,12,x)
	.word 0xb439400c  ! 889: XNOR_R	xnor 	%r5, %r12, %r26
	setx  0x520f74f6868860ae, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_32), 16, 16),1,DC_DATA,7)
	.word 0xf4094000  ! 893: LDUB_R	ldub	[%r5 + %r0], %r26
thr0_irf_ce_44:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_44), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xa9c44000  ! 895: JMPL_R	jmpl	%r17 + %r0, %r20
thr0_ic_err_46:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_46), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xba00808c
	.word 0xa8422359  ! 899: ADDC_I	addc 	%r8, 0x0359, %r20
	setx  0x6e2f0e355d8d9b10, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 902: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xaa71c00d  ! 903: UDIV_R	udiv 	%r7, %r13, %r21
	.word 0xb964180c  ! 905: MOVcc_R	<illegal instruction>
	setx  0x9b2f2df0cb83eb7f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44000  ! 908: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0x1b800001  ! 909: FBLE	fble  	<label_0x1>
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xad31400a  ! 914: SRL_R	srl 	%r5, %r10, %r22
	setx  0x265f110627a84e57, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_45:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_45), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 917: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xbaf1e700  ! 918: UDIVcc_I	udivcc 	%r7, 0x0700, %r29
	.word 0xb931000c  ! 920: SRL_R	srl 	%r4, %r12, %r28
	setx  0x478f90ecdd95d477, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf631800c  ! 922: STH_R	sth	%r27, [%r6 + %r12]
	.word 0xea3227ea  ! 922: STH_I	sth	%r21, [%r8 + 0x07ea]
	.word 0xf229e213  ! 922: STB_I	stb	%r25, [%r7 + 0x0213]
	.word 0xea28c00b  ! 922: STB_R	stb	%r21, [%r3 + %r11]
	.word 0xee2a000d  ! 922: STB_R	stb	%r23, [%r8 + %r13]
	.word 0xf629edcd  ! 922: STB_I	stb	%r27, [%r7 + 0x0dcd]
	.word 0xf421400c  ! 922: STW_R	stw	%r26, [%r5 + %r12]
	.word 0xec20c00a  ! 922: STW_R	stw	%r22, [%r3 + %r10]
thr0_irf_ce_46:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_46), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 923: JMPL_R	jmpl	%r17 + %r0, %r25
thr0_ic_err_47:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_47), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xf472008d
thr0_ic_err_48:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_48), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xaac0c00b  ! 928: ADDCcc_R	addccc 	%r3, %r11, %r21
	.word 0xb939100a  ! 930: SRAX_R	srax	%r4, %r10, %r28
	.word 0xa810c00a  ! 932: OR_R	or 	%r3, %r10, %r20
	.word 0xb2222f2c  ! 934: SUB_I	sub 	%r8, 0x0f2c, %r25
	.word 0xac08800f  ! 936: AND_R	and 	%r2, %r15, %r22
	.word 0xa929400b  ! 938: SLL_R	sll 	%r5, %r11, %r20
	.word 0xba89000f  ! 940: ANDcc_R	andcc 	%r4, %r15, %r29
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb099000d  ! 943: XORcc_R	xorcc 	%r4, %r13, %r24
	.word 0xb930b001  ! 943: SRLX_I	srlx	%r2, 0x0001, %r28
	.word 0xac31e4bb  ! 943: ORN_I	orn 	%r7, 0x04bb, %r22
	.word 0xb889400c  ! 943: ANDcc_R	andcc 	%r5, %r12, %r28
	.word 0xb528e001  ! 943: SLL_I	sll 	%r3, 0x0001, %r26
	setx  0x237f5207cc328f75, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_33), 16, 16),1,DC_DATA,60)
	.word 0xf400c000  ! 946: LDUW_R	lduw	[%r3 + %r0], %r26
	.word 0xbbc44000  ! 948: JMPL_R	jmpl	%r17 + %r0, %r29
thr0_ic_err_49:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_49), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xba00808c
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb881e003  ! 954: ADDcc_I	addcc 	%r7, 0x0003, %r28
	setx  0x187f38413d0a054a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_47:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_47), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xbdc44000  ! 957: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xb6d1000a  ! 958: UMULcc_R	umulcc 	%r4, %r10, %r27
	.word 0xa929800a  ! 960: SLL_R	sll 	%r6, %r10, %r20
	.word 0xa9643801  ! 960: MOVcc_I	<illegal instruction>
	.word 0xb0b0c00b  ! 960: ORNcc_R	orncc 	%r3, %r11, %r24
	.word 0xb931500e  ! 960: SRLX_R	srlx	%r5, %r14, %r28
	.word 0xbd643801  ! 960: MOVcc_I	<illegal instruction>
	setx  0xefbf64b77889debb, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_34), 16, 16),1,DC_DATA,47)
	.word 0xfc094000  ! 963: LDUB_R	ldub	[%r5 + %r0], %r30
	.word 0xb9c44040  ! 965: JMPL_R	jmpl	%r17 + %r0, %r28
thr0_ic_err_50:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_50), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xaf39f001  ! 968: SRAX_I	srax	%r7, 0x0001, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xa888800e  ! 974: ANDcc_R	andcc 	%r2, %r14, %r20
	setx  0x03dfa5d0151a23a1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_48:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_48), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xb5c44000  ! 977: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb048a5c9  ! 978: MULX_I	mulx 	%r2, 0x05c9, %r24
	.word 0xb6a9000a  ! 980: ANDNcc_R	andncc 	%r4, %r10, %r27
	setx  0xa38fd0b988f867fc, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xe831400f  ! 982: STH_R	sth	%r20, [%r5 + %r15]
	.word 0xec70e0b2  ! 982: STX_I	stx	%r22, [%r3 + 0x00b2]
	.word 0xf221000a  ! 982: STW_R	stw	%r25, [%r4 + %r10]
	.word 0xfc29400e  ! 982: STB_R	stb	%r30, [%r5 + %r14]
	.word 0xee29c00f  ! 982: STB_R	stb	%r23, [%r7 + %r15]
	.word 0xf670c00a  ! 982: STX_R	stx	%r27, [%r3 + %r10]
	.word 0xf829400f  ! 982: STB_R	stb	%r28, [%r5 + %r15]
	.word 0xf229800e  ! 982: STB_R	stb	%r25, [%r6 + %r14]
	.word 0xee29400b  ! 982: STB_R	stb	%r23, [%r5 + %r11]
	.word 0xf620c00a  ! 982: STW_R	stw	%r27, [%r3 + %r10]
	.word 0xe821000a  ! 982: STW_R	stw	%r20, [%r4 + %r10]
	.word 0xb9c44040  ! 983: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xf472008d
thr0_ic_err_51:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_51), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xb409a40f  ! 987: AND_I	and 	%r6, 0x040f, %r26
	.word 0xb201a03b  ! 989: ADD_I	add 	%r6, 0x003b, %r25
	.word 0xaeb8a457  ! 991: XNORcc_I	xnorcc 	%r2, 0x0457, %r23
	.word 0xaa90c00d  ! 993: ORcc_R	orcc 	%r3, %r13, %r21
	.word 0xb281646a  ! 995: ADDcc_I	addcc 	%r5, 0x046a, %r25
	.word 0xb139000f  ! 997: SRA_R	sra 	%r4, %r15, %r24
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ta    T_GOOD_TRAP

.data
	.word  0x3431ac28,0x4004b073,0x182ade22,0xa1fc7785
	.word  0x77fe84c5,0xcd29f46d,0x4f73e13d,0x5c5d39e6
	.word  0x5bb7e71e,0xcab71691,0x6d89c975,0x6eb6babf
	.word  0x8da538ba,0x8446df45,0x1c82ab32,0xc20abfff
	.word  0xb772c400,0xd2bcfefa,0x1e2dae44,0x37aab14d
	.word  0xe622d718,0x83b1b190,0xbe0754de,0x1229c2e8
	.word  0x049d1937,0x7beedb51,0xaa75705d,0xf64ce10d
	.word  0xf4acccbf,0x1e6e4f74,0x05e65039,0x008f8cce
	.word  0xbd9415e3,0xbb9d2fc1,0x65eb9bd3,0xd9fe6730
	.word  0x48df4acc,0x0359abf8,0xff64ff5d,0xb62a8f0d
	.word  0x13acbc7e,0xbb49140f,0x51f281c0,0x7be635a1
	.word  0x25f0c7a0,0x29e465f1,0xae4d1394,0xd1e8d748
	.word  0xbe47f0f1,0xc7eff747,0x0a867a59,0x574a3b50
	.word  0xd2525e2a,0xba2a73b9,0x4cbbba81,0x176a471e
	.word  0xaf22e23b,0x25fa79b9,0xd00b1c5c,0xc79a51bd
	.word  0x3461fe5e,0x1a18750c,0x74346212,0x8e156426
	.word  0x56f9957e,0x4b21a225,0x2744ff42,0x7fad758d
	.word  0x2df48232,0x40083a9a,0xdc95c09b,0x1562f87b
	.word  0x982a03ad,0x36daf025,0x93f217a1,0x14ade8dc
	.word  0x39795f6a,0x3d2a2f13,0x2318483c,0xada8e70a
	.word  0xbc2543aa,0x809962ac,0x6c736e9f,0xe6ad37ec
	.word  0xf4b908e2,0xe4297ddf,0xda264ce8,0x3cc3e467
	.word  0x49f02bc7,0xc81fe1a3,0x539851c5,0xa9928621
	.word  0xf1cde38d,0x6d6f99ee,0xcb17e7f1,0x7a56f5c2
	.word  0xe31b47ca,0x8f375f81,0x0b96f2ea,0x7cceabb4
	.word  0xdca7cf94,0x2165ce65,0xe714bc55,0x1351b576
	.word  0x7d747e40,0x782fa09d,0xf51309eb,0xd2ffa1e1
	.word  0x4882ec49,0x6f4315d9,0x799080b2,0xcad16599
	.word  0xc55d1df6,0xcab095b5,0x853727f4,0x9fb60b1e
	.word  0x4bab19e3,0x613d6612,0xc4c565ad,0xdae308f7
	.word  0x71c112ad,0x350050df,0x35c25456,0xa5234d45
	.word  0xef42a5b6,0x9178c64c,0xf167e950,0xd5388e90
	.word  0x25cdfaac,0x1d75261e,0xa03f4c25,0xf8175ccc
	.word  0x4e40c3c7,0x803c2d39,0xc4a84bd4,0xd07fa9dd
	.word  0x7a0c74d8,0x00112d03,0xcc683fbe,0xad81c508
	.word  0xf238456f,0x7597cdf3,0x90926d0d,0x1cbaf855
	.word  0xe3591fef,0x3ab581f0,0x808f4e11,0x570d0d74
	.word  0x66ac45ff,0x4de6fd9c,0x8485648f,0xebd8d972
	.word  0x3b74fb43,0x6e3b9094,0x2fd62e5d,0xcaaacbcf
	.word  0x27f19be5,0x2641c120,0x62268770,0x07544bc8
	.word  0x7a37084d,0x0dd4a267,0xefa47d38,0xbf951c4f
	.word  0x029d2a6d,0x35e48053,0x8ddb7011,0xd64e1ca8
	.word  0xf91889e2,0x86f1a8a1,0x3bb7add2,0x21cde2dd
	.word  0x36776a61,0x1f94e8ce,0x044209f5,0xa91a0248
	.word  0xffa9bd10,0xfe255664,0xccf84443,0xa27add87
	.word  0x5328537b,0x53843306,0xa1408d74,0x6e3fb5e1
	.word  0xa8617042,0x8233c84b,0x5a81193d,0xd1d58325
	.word  0x4611558c,0x95c29b20,0xccac4e26,0x6a66c4f1
	.word  0xb75d0bb4,0xfd958f9b,0xfb94f76f,0x0d2b5037
	.word  0x77903685,0xef547441,0x67c5b04c,0x72174156
	.word  0x2a29a3a2,0x7fcd5956,0xeff71ad6,0xc8e7199f
	.word  0xf45205dc,0x5f090a2e,0xe8ce5c10,0x14b7b079
	.word  0xe2657b38,0x02ecdbb4,0x66451c75,0x6eda04ac
	.word  0x72f91684,0x42a8fe45,0x4cd6bbad,0xb54775a1
	.word  0x348a6ea9,0xa830705b,0xef03a688,0xee28555c
	.word  0x2aee98be,0xa1122aad,0xb4cde937,0xca019663
	.word  0x382676cd,0x39bc8824,0x1af5a984,0x9504e39a
	.word  0x4eeda151,0xccb662e4,0xd9b6659b,0xa6775b9c
	.word  0xab23eb5f,0x740b99a7,0x702ceb38,0xb086a6c1
	.word  0x1efe5ad1,0x5f1da4ca,0x04e29c75,0x64c5834b
	.word  0xdcff7b74,0x3a4d37e6,0xb50fcc62,0x2fad29d0
	.word  0xbd798e7f,0xda1e1092,0x22dbcf4c,0x6a2d43d2
	.word  0x37760d0d,0xf0cc7c90,0xad69d8ec,0xc269f6db
	.word  0xca7e2761,0x04f545eb,0x5fa5e778,0x1b932cd4
	.word  0xd85149f1,0x7ca0856c,0xf2c3c468,0xf5dc6bf3
	.word  0x94413084,0x511c8e78,0xa2315135,0x2665ec47
	.word  0x0254bf2f,0x4dfa98c8,0xa8a2b2c6,0x55fa4648
	.word  0x2a9030d7,0x482f1968,0x86c7d389,0x98b53cc7
	.word  0xf7285663,0x33ee4f10,0x5598061b,0x6ee3f103
	.word  0x673955d2,0xcc9ca2bf,0x797d3f07,0x173b609f
	.word  0xb380a853,0x3a46ef4b,0xd97ac879,0xeb050af4
	.word  0x7cc24d06,0x3031bace,0x0fcacd25,0x60d47165
	.word  0xac12051f,0x6c9823ed,0x8493241c,0x74535284
	.word  0x5f8a2c6d,0x09aaefdf,0x01a7fe61,0x246d424c
	.word  0x95a62d74,0x5613038f,0x2ec881a0,0x9c14d136
	.word  0xa7bbaefc,0xc7f9d52b,0x145c1f81,0x87521799
	.word  0xb12bf65e,0x83edc883,0xc4a13af4,0x77c3593b
	.word  0x0920d375,0x6662ea69,0xcaacea1d,0xf76bbaf3
	.word  0x56a43cde,0xa0e864dd,0x919c74ae,0x02ff3482
	.word  0xef07d703,0x37f5f3e8,0xebb6b333,0x6309504f
	.word  0x6260b7e7,0x6b401d4e,0x9d5901ae,0x129393aa
	.word  0x168b999b,0xe3433ce1,0x125e3660,0xc943d2b9
	.word  0x4f6965a9,0x5d99041e,0x94c14bbc,0xbfa81bf0
	.word  0x039c2b51,0x0d3da39e,0xffc32c11,0x151fc676
	.word  0xf50341d6,0xb7df2719,0xf562f133,0xd5eed28f
	.word  0x17c0e87c,0xb90f2e69,0x57b1a63d,0x6cd3d212
	.word  0xd75f286d,0x08e31c82,0xaf52154a,0x43868fc4
	.word  0x3427de27,0xecbc8447,0xe05ba1fb,0xad7e6d9e
	.word  0xce0beb33,0x4fade510,0x5ea01512,0xbc92849b
	.word  0x006c012a,0x63501136,0xe504cb5f,0xbdf17dca
	.word  0x05dd8176,0x4722b497,0x75029c01,0xf4afbe01
	.word  0xa58b4daa,0x83174f51,0x7b998344,0xf9c37585
	.word  0x0e476ed1,0xdb47482e,0x315bbb86,0xae2962ba
	.word  0x1608159c,0xa0008b67,0xfc465e89,0x4da7d001
	.word  0xe4c5b378,0xd07744ce,0x9007770d,0xc69ff43b
	.word  0x5dca7ee2,0xcc052929,0x8a361aec,0x6206f727
	.word  0x81544e05,0x8f436a14,0xfd37abbd,0x398a6905
	.word  0x5b9dd807,0xa490d246,0xc3b32665,0x0d3b51dd
	.word  0xa482ec07,0x62cf7dcc,0xf66d8433,0x863be16c
	.word  0xc14bdd56,0x95ccfe86,0xacb319ba,0x3ec744ab
	.word  0x87b65615,0xec9d1df0,0xd78d6162,0xdb77fd2f
	.word  0x6da8e3db,0x3c1424fd,0x7c6670ae,0x149376ea
	.word  0x010597fc,0xebd92ec5,0x05511078,0x37842875
	.word  0x9b637970,0xf089a56f,0x365a7935,0x0dd9b180
	.word  0x29b89aad,0x5033bdba,0xea4bc6d3,0xa778612b
	.word  0xf8f09426,0x625f8cf9,0xd0cf0ce3,0x698cb8cd
	.word  0x413597c9,0x8c3bb503,0x38a6fca8,0x1f4c10b7
	.word  0x7c75f442,0xe32a66e5,0x7ef36cbf,0x08fdc571
	.word  0x34f05ab8,0x038f357a,0x73c80594,0xf1d5388a
	.word  0x164b6c1b,0x9f583f80,0x5f357576,0xbd4a6e63
	.word  0x34898675,0x2d9676d3,0xb272000b,0x1378db4c
	.word  0x9591a8b5,0xa5cc3108,0xd62725e7,0xca452dc3
	.word  0xed8a1356,0x8aaecc34,0x2987b5b2,0x931025ae
	.word  0x3e4d34ed,0x2622e060,0x4c68ffdd,0xc9ac6a8f
	.word  0x49ab8502,0x2eaabfba,0x9646eed3,0x8da1a350
	.word  0x7e2e7a80,0x02d87ed8,0xebe2fddf,0x3bb3f640
	.word  0xa194578e,0x27bbd481,0xf0f8f9a9,0xb3d3a462
	.word  0x8e3da7a5,0x0eb862d0,0x03d02c76,0x06ad6366
	.word  0x2a466042,0xd1bb5131,0x2549a4a4,0xb31fc155
	.word  0x48f69455,0x9ef66128,0x7f453bf3,0x63f606f3
	.word  0x4640f86f,0xd6a177f0,0x7506b7eb,0x3101ba9a
	.word  0x71f78eee,0xb3ef170c,0xa198f9cc,0xec6b1506
	.word  0xaa10eb13,0xef13cbbb,0x700b4380,0xbb613cc4
	.word  0xbe9a3271,0x44e83e47,0x0ef41956,0xb6b98cec
	.word  0xdcdb69c2,0x1dbe607b,0x7e9ed91c,0x549808b9
	.word  0xe06fb02d,0xc0aae109,0x2c29c12a,0x13331461
	.word  0xe5e102f9,0x90614a03,0xf3403d1e,0x17250285
	.word  0x6014341d,0xaf25dfe0,0xab67b9fb,0x9390a0e1
	.word  0x503162ae,0x5253e777,0x4363ff73,0xe4977f51
	.word  0x1f89c4cc,0x0e03f842,0x416caebb,0x067e647d
	.word  0x9395678c,0x3a9e1ae4,0x88f63bfd,0x4c642b57
	.word  0xf539ccbd,0x7570ce0a,0x81bc4c5e,0x99018642
	.word  0x96acfdf0,0xd21e0493,0xc1643101,0xaf194966
	.word  0x43b5ec7c,0xc482bba1,0x856b3e69,0xaac42a98
	.word  0x3f0c3307,0x12ba5416,0x591b0e73,0x0138e135
	.word  0x14a44327,0xf8e5d8c3,0x82354b61,0xc6048cc5
	.word  0x9762153c,0xbe5f5f34,0x997fa31c,0xc53389f7
	.word  0x93bd3be0,0x1068ccce,0xebc12cd1,0x5088acc6
	.word  0xdac130a6,0x51cc90de,0x240f1aca,0x138374a1
	.word  0x440e741b,0xddb0d1b4,0x781d84f9,0x730ba479
	.word  0x0289db6c,0x87b95377,0x344040ae,0x76b3bbf1
	.word  0x14f5f1e8,0xaca73df9,0xef58878d,0xde9b1001
	.word  0x3add08ed,0x16517a4a,0x464e758e,0x95f8fcab
	.word  0x18df4840,0x16cf781f,0x4489c5d3,0x15183335
	.word  0x695be398,0x08d208b7,0x6b7f96a4,0x4fec16ef
	.word  0xf8674314,0x6d096977,0x3114ed56,0x92940f7d
	.word  0x5077acdb,0x4166b921,0xe8bdbdd7,0x5c3d0d0f
	.word  0x11ac1bab,0x18f0aac6,0x48476c2b,0xc3ed636d
	.word  0x71b3dacc,0x5b417ac7,0x2e845cfe,0x1b31d60f
	.word  0xace5866b,0xf09530ce,0xed20e7f6,0xfffbeb7d
	.word  0x2ac80572,0xf24abc77,0x1f7ba550,0xccf35baa
	.word  0xa16836aa,0x6b9544c2,0x61a062e9,0x917428c0
	.word  0xf3820d1d,0x91dc3b2e,0x6be5c314,0xa4680860
	.word  0xfd6f17d0,0x965e022d,0xef08db67,0xaf297790
	.word  0x3275bc22,0x487bcbbe,0xba057f59,0x65baca53
	.word  0x6da535ce,0xf8a4af0d,0x68fa2a19,0xc0e1071b
	.word  0xc6989eef,0xc56a31c5,0x11d85b26,0x8308a795
	.word  0xb4a21cf4,0x699aa595,0x7732b24e,0x02e0e3d9
	.word  0xf0cab548,0xf5d250ee,0x02c515b7,0x84dc792e
	.word  0xa9050690,0xe22d480f,0x245927eb,0xcc80080a
	.word  0xccedbcb1,0x7a3ce03a,0x2bf211ad,0x3aa32d10
	.word  0x1cb372ae,0x2f3d3fca,0xc771f2a4,0x8b6ceabf
	.word  0xd612cf7b,0x07e0fc9b,0xd9833578,0x5e4bc266
	.word  0x1c9d4ea3,0x2e2c51d5,0x34a2808f,0x5b440dd4
	.word  0xca679209,0x51a50884,0x4ef50465,0xc3ecf7b1
	.word  0xe1ef35e9,0x013c5060,0x18764ca2,0x119e5119
	.word  0xd5fe5f9e,0x8cd6030a,0xd943ea43,0xc5abc49e
	.word  0x5598fc4e,0x3c697de0,0xdc606b8d,0xbf0c866c
	.word  0x025a108c,0xb9483023,0x5853da6c,0x230a935c
	.word  0x02a6bab1,0x5ba2d144,0xa63c7ff7,0xcdfc9c2c
	.word  0xd3f03981,0x1a5bbbd5,0xfe641a56,0x2f9daa1d
	.word  0x3aff0d94,0xbefd4840,0x87fcf121,0x1e61a715
	.word  0x504d1853,0xd6ded29a,0x9585792f,0x2e917c03
	.word  0xc9112117,0x15542b8f,0xc074c0cf,0x2a76f693
	.word  0x1d0e42a9,0xfd5e289e,0xe4d72c2f,0x26db9125
	.word  0x00e8e921,0x064d1618,0xb691ffcf,0x91fee993
	.word  0xf7ebbded,0xffe903c2,0xa46466e8,0x679e3d29
	.word  0x3bc0bf3c,0x51ab6f84,0x37eb164d,0x512ea59e
	.word  0x3056edc8,0x00c160af,0x22588914,0x52431541
	.word  0x67eae00e,0x9673a5a2,0xec036804,0x32e9a9da
	.word  0x1633fd09,0x9bcfece7,0xc3d3323a,0x57125ec2
	.word  0x43963db5,0xd6de2b78,0x5b658624,0x100be2a2
	.word  0x9bf4aa45,0x06e12a45,0xaf8ea576,0xa74a0b40
	.word  0x29ab7f30,0xaee53c06,0xb12915aa,0x5fd51813
	.word  0xed6045a4,0xe275edae,0xb55f17da,0x08ae27fb
	.word  0xf45408f3,0xe8b68e92,0xccd414ee,0x9c7fb743
	.word  0x74f6a11c,0x6f3f0098,0x478e4ee1,0x57603b81
	.word  0x1ee9c87d,0x282ff317,0xea7870eb,0x27901156
	.word  0xe511f3ec,0x1ea732c2,0x413722d6,0x6e710c82
	.word  0x8d0a4f67,0xa39e2ce8,0x33a10050,0x2fa1bbe8
	.word  0x73dd54be,0xeaf3d271,0x8cc03843,0xe4e7475f
	.word  0x7f659d73,0xff440ccf,0x3b768392,0x5671ad47
	.word  0x29113653,0xd0981887,0xe8c9d3f0,0x1af98d35
	.word  0xe51594b8,0xc765c295,0x06d6e133,0x2f890219
	.word  0x2a312aca,0x589103f0,0x7aa7f916,0x96e750ef
	.word  0xa5184cb2,0x9facbf69,0x600979b1,0xeac18d33
	.word  0x367895bc,0x828cfd11,0x0faf7b54,0x33c70b94
	.word  0x24a33bac,0x6e9a051f,0x8398261e,0x632bd8be
	.word  0xb7564546,0xc634ff87,0x985d7552,0x9d82cbe7
	.word  0x5780c912,0xc0364ce8,0xb1763330,0x4ca53d0b
	.word  0x1e3ce8c6,0xdb594ff5,0xf1cd77a9,0x5da03b40
	.word  0xdd6b1b46,0xac2a0754,0xfe7d4871,0x90e3e9b5
	.word  0xdc35028d,0x65c5ea6f,0x4a738de9,0x0ed174d4
	.word  0x68f2d4d8,0x9da56c27,0x9eb0f4bc,0xb6bc1312
	.word  0x703334ac,0x8d3e6178,0xd4761d15,0x27d138eb
	.word  0x39a3dd3a,0x402c618c,0xe6f34cb8,0x99a8a2e5
	.word  0x7dfe11ed,0x5c994d76,0x3e3bea0f,0xe63404ba
	.word  0xb6e9a187,0x097f2800,0x60bdcc01,0x43d1a8cd
	.word  0x27a799e6,0x6c4c43e4,0xcd6cab48,0x368d4066
	.word  0x5fb970b9,0x5cf00d8d,0x53ee39c5,0x92017ed0
	.word  0xb5c6101f,0xe485ae52,0x36f3f6d7,0x81010f3f
	.word  0xa3168c81,0x0ef0333c,0x4ec006b8,0xa8dda96d
	.word  0x11e56dfd,0x13a24dab,0xdeaca20b,0xe22f8cab
	.word  0x533cdd2b,0xe1547379,0xe9b03a19,0x1495c78e
	.word  0x6edf4d39,0x57bb6458,0x2a93c91d,0x9a9e3876
	.word  0xe15e69c6,0x81d11aa8,0x71c20fde,0x0b8bb533
	.word  0xd675f3ed,0xf3844b79,0xd0850a32,0xe9920708
	.word  0x9d75dea6,0x729c6413,0xd6edee88,0x6d801fa4
	.word  0x11f7f8ca,0xaa83f8e2,0xd3c26796,0x21843b20
	.word  0x9a41f7a9,0x81daf777,0x40aab80e,0x8c930ba3
	.word  0x8720e50a,0x2b596169,0xdcda4756,0xa146fb56
	.word  0xf7d36594,0xdfa03005,0x18d40bc7,0x786d7135
	.word  0xef72f3e2,0x1b48fc45,0xa9767e7e,0x4840f833
	.word  0x9e97570d,0x0e64ae1b,0x6ba2a2f0,0x8d226794
	.word  0x09a7e1cf,0xf072d8d1,0xb816c744,0x6eb35bdd
	.word  0x0c96ac9a,0x1c23f0fc,0xe12d1030,0xfcfb34db
	.word  0x46966fea,0x59705649,0xa433e78f,0x08e3d2ca
	.word  0x6d028ae4,0x4e7271da,0x1fa764b5,0x1375aa26
	.word  0x84132f78,0xbb9fe3c8,0xabd8be58,0x30af18c7
	.word  0x57bb68a1,0x113f815f,0xc0e5fe17,0x628202f0
	.word  0x826b0aba,0xe2527b82,0xf3fb669b,0xf045602a
	.word  0x886e40d1,0x5dd14931,0xebe94670,0x8f121b7b
	.word  0xcb19b28f,0x91a97c39,0xe17ee2e2,0xb9c18339
	.word  0x0ed6231b,0x4ef7c648,0xf3c2296b,0x8d99bd60
	.word  0x95cf6683,0xf46a18c9,0x88200214,0x3268f229
	.word  0x8d0a7dbb,0x62cda7e4,0x0beed0d2,0x9d378f48
	.word  0x4c2a21f9,0x8ce470c1,0x92e42d6f,0xfa968bf4
	.word  0x553bcdcf,0x1caa4de6,0x3100fd97,0x96000d6d
	.word  0xc7278451,0xc168bc8d,0x9473ddce,0x18193737
	.word  0x7f7443e3,0x98b32dd7,0x82b2d866,0xbf9c41e9
	.word  0xe3f2ebef,0x0ff034bb,0xb7267c5e,0x5b53db34
	.word  0x67d8d205,0x5f2ffc53,0x1fa9e99e,0xe5a28c35
	.word  0x4275c43a,0x21e3d961,0x750c78ac,0xadb49d4a
	.word  0x98935e57,0x73205cdb,0x26af0101,0x91ff4717
	.word  0xa81bb9a0,0xe80ced6a,0xd7525113,0x56fa3d56
	.word  0x5d69aaf6,0x0926659e,0x4e89b45b,0xa4c291ce
	.word  0x0ae6a881,0x934d2cf4,0xfd860125,0xaad6bf34
	.word  0x03b79e48,0xb693b55b,0x60428761,0x7eb26000
	.word  0x38688e3c,0x5e3dc2dc,0xc065f534,0xe278561d
	.word  0xc076b3d6,0xe2f54605,0x9432d46f,0xddae2aa1
	.word  0x98482080,0x5cc7e29b,0xdd0d6a02,0x57fa398f
	.word  0xf027984b,0xd124fa72,0xcf545cc1,0xacdec660
	.word  0x0d654051,0xe9d70924,0xfc1dcbe3,0xaea6e3f2
	.word  0x12d564bb,0x460f982c,0xf93eeae2,0x4b133293
	.word  0x3576c740,0x1fee48a9,0xd7dc79f2,0x61bc39fd
	.word  0xd3e6e802,0x7ca29775,0x941a0d33,0x22d3da6f





SECTION .ISEG_0 TEXT_VA = 0x00007fffffffe000
attr_text {
        Name     = .ISEG_0,
	RA	 = 0x0000000090000000,
	PA	 = ra2pa(0x0000000090000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

!last_sec_0
.global last_l1c
.skip 0x1fe0
last_l1c:
	nop
	nop
	nop
	nop
	nop
	.word 0xf649a94a  ! 1: LDSB_I	ldsb	[%r6 + 0x094a], %r27
	.word 0xb1a000aa  ! 2: FNEGs	fnegs	%f10, %f24
	nop



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i = 0, inst;
!!#   int bitnum = 0, bitnum2 = 0;
!!#   int label_cnt = 0;
!!#   int irf_err_cnt = 0;
!!#   int ic_err_cnt = 0;
!!#   int dc_err_cnt = 0;
!!#   int intr_cnt = 0;
!!#   int burst_cnt = 0;
!!#   int thrid = 0;
!!# 
!!# #define ISEG	0
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 37, ijdefault, Ft_Rs1, "{2..8}");
!!#   IJ_set_ropr_fld ("diag.j", 38, ijdefault, Ft_Rs2, "{10..15}");
!!#   IJ_set_ropr_fld ("diag.j", 39, ijdefault, Ft_Rd, "{20..30}");
!!#   IJ_set_ropr_fld ("diag.j", 40, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!# //  IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!# //  IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Ft_Cc0_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 53, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!# //  IJ_copy_ropr (Ro_unaligned_addr, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 56, Ro_unaligned_addr, Ft_Rs2, "{9}");
!!#   IJ_set_ropr_fld ("diag.j", 57, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 58, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# //  IJ_set_ropr_bits (Ro_unaligned_addr, 0x1fe0, "13'b0000r00r00000");
!!# 
!!# //  IJ_copy_ropr (Ro_load_r, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_load_r, Ft_Rs2, "{0}");
!!# 
!!#   IJ_copy_ropr ("diag.j", 64, Ro_rsvd_set, ijdefault);
!!#   IJ_set_ropr_bits ("diag.j", 65, Ro_rsvd_set, 0x1fe0, "13'brrrrr1rr00000");
!!# 
!!# //  IJ_copy_ropr (Ro_ba, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 68, Ro_ba, Ft_D16, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 69, Ro_ba, Ft_Disp22, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_ba, Ft_Disp19, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 71, Ro_ba, Ft_Disp30, "{0x3}");
!!# 
!!# //  IJ_copy_ropr (Ro_br, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 74, Ro_br, Ft_D16, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 75, Ro_br, Ft_Disp22, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 76, Ro_br, Ft_Disp19, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 77, Ro_br, Ft_Disp30, "{0x3}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 80, th_lop, 0x4);
!!#   IJ_bind_thread_group("diag.j", 81, th_intr, 0x8);
!!# 
!!#   IJ_bind_thread_group("diag.j", 93, th_0, 0x1);
!!#   IJ_bind_thread_group("diag.j", 94, th_evnt, 0x3);
!!#   IJ_bind_thread_group("diag.j", 95, th_all, 0xf);
!!# 
!!#   IJ_copy_ropr ("diag.j", 97, Ro_jmpl, ijdefault);
!!#   IJ_set_ropr_bits ("diag.j", 98, Ro_jmpl, 0x1fe0, "13'b00000r000000"); 
!!#   IJ_set_ropr_fld ("diag.j", 99, Ro_jmpl, Ft_Rs1, "{17}");
!!#   IJ_set_ropr_fld ("diag.j", 100, Ro_jmpl, Ft_Rs2, "{0}");  
!!# 
!!#   IJ_th_fork_group ("diag.j", 102, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 106, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 16; i < 32; i++) {
!!#      IJ_printf ("diag.j", 108, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 112, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 10; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 114, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Put an unaligned address into r10
!!#   IJ_set_rvar ("diag.j", 118, reg_rand_init, "64'h0000000000000rr1");
!!#   IJ_printf ("diag.j", 119, th_all, "\tsetx  0x%016llrx, %%r16, %%r9\n", reg_rand_init);
!!# 
!!#   //Initialize Rs1
!!#   for (i = 2; i < 9; i++) {
!!#      IJ_printf ("diag.j", 123, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 126, th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 127, th_all, 4);
!!#   IJ_printf ("diag.j", 128, th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 130, pc_va_oor, "64'hrrrfrrrrrrrrrrrr");
!!# 
!!#   IJ_set_default_rule_wt_rvar ("diag.j", 132,"{10}");
!!#   IJ_set_rvar ("diag.j", 133, low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 134, high_wt, "{40}");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_printf ("diag.j", 155, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 156, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 157, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 158, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 159, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 160, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 161, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 162, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 163, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 164, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 165, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 166, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 167, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 168, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 169, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 170, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 171, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 172, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 173, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 174, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 175, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 176, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 177, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 178, th_all, "	nop\n");
!!# 
!!#   IJ_printf ("diag.j", 182, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 183, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 184, th_all, "	nop\n");
!!#   IJ_th_join ("diag.j", 185,0xf);
!!#   IJ_th_start ("diag.j", 186,Seq_Start, NULL, 2); 
!!#   IJ_printf ("diag.j", 187, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 188, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 189, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 190, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 191, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 192, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 193, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 194, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 195, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 196, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 197, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 198, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 199, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 200, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 201, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 202, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 203, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 204, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 205, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 206, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 207, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 208, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 209, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 210, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 211, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 212, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 213, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 214, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 215, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 216, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 217, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 218, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 219, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 220, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 221, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 222, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 223, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 224, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 225, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 226, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 227, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 228, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 229, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 230, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 231, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 232, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 233, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 235, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 236, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 238, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 239, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# 
!!#   SECTION .ISEG TEXT_VA = "64'h00007fffffffe000"
!!# 
!!#   attr_text {
!!#         Name = .ISEG,
!!#         RA = "64'h0000000090000000",
!!#         part_0_i_ctx_nonzero_ps0_tsb,
!!#         TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
!!#         TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
!!#         TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
!!#   }
!!#   enumerate {
!!# 	TEXT_VA
!!#  }	  
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# diag: last_sec intr lop inst_block
!!# ;
!!# 
!!# last_sec: last_sec_lop %rvar  low_wt | last_sec_3 | last_sec_4 | last_sec_5 
!!#           | last_sec_6 | last_sec_7 | last_sec_8 | last_sec_9 | last_sec_10
!!# ;
!!# 
!!# last_sec_lop: last_sec_0 | last_sec_1 | last_sec_2
!!# ;
!!# 
!!# last_sec_0:mMETAlast_0
!!# {
!!#    IJ_iseg_printf("diag.j", 359,ISEG, 0, th_evnt, "!last_sec_0\n");
!!#    IJ_iseg_printf("diag.j", 360,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 361,ISEG, 0, th_evnt, ".skip 0x1fe0\n");
!!#    IJ_iseg_printf("diag.j", 362,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 363,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 364,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 365,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 366,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 367,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# load_i 
!!# {
!!#    IJ_iseg_generate("diag.j", 371,ISEG, 0, th_evnt, $3);
!!# }
!!# mul_div_fpop_iseg 
!!# {
!!#    IJ_iseg_printf("diag.j", 375,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# last_sec_1:mMETAlast_1
!!# {
!!#    IJ_iseg_printf("diag.j", 381,ISEG, 0, th_evnt, "!last_sec_1\n");
!!#    IJ_iseg_printf("diag.j", 382,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 383,ISEG, 0, th_evnt, ".skip 0x1fe0\n");
!!#    IJ_iseg_printf("diag.j", 384,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 385,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 386,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 387,ISEG, 0, th_evnt, "\tnop\n");
!!# } st_irferr_unalgn_trpd alu_illinst_iseg alu_illinst_iseg mul_div_fpop_iseg 
!!# {
!!#    IJ_iseg_printf("diag.j", 390,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# last_sec_2:mMETAlast_2
!!# {
!!#    IJ_iseg_printf("diag.j", 396,ISEG, 0, th_evnt, "!last_sec_2\n");
!!#    IJ_iseg_printf("diag.j", 397,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 398,ISEG, 0, th_evnt, ".skip 0x1fe0\n");
!!#    IJ_iseg_printf("diag.j", 399,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 400,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 401,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 402,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 403,ISEG, 0, th_evnt, "\tnop\n");
!!# } lderr_iseg alu_illinst_iseg mul_div_fpop_iseg 
!!# {
!!#    IJ_iseg_printf("diag.j", 406,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //9 stores, with irf errors and stuff
!!# last_sec_3: mMETAlast_sec_3
!!# {
!!#    IJ_iseg_printf("diag.j", 424,ISEG, 0, th_evnt, "!last_sec_3\n");
!!#    IJ_iseg_printf("diag.j", 425,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 426,ISEG, 0, th_evnt, ".skip 0x1fd8\n");
!!#    IJ_iseg_printf("diag.j", 427,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 430,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, -1);;
!!# } st_irferr_unalgn_trpd st_trpd st_trpd icerr_alu_st_trpd 
!!# {
!!#    IJ_iseg_printf("diag.j", 433,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //8 stores with irf errors and stuff
!!# last_sec_4: mMETAlast_sec_4
!!# {
!!#    IJ_iseg_printf("diag.j", 440,ISEG, 0, th_evnt, "!last_sec_4\n");
!!#    IJ_iseg_printf("diag.j", 441,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 442,ISEG, 0, th_evnt, ".skip 0x1fdc\n");
!!#    IJ_iseg_printf("diag.j", 443,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 446,ISEG, 0, th_evnt, $3, $4, $5, $6, -1);;
!!# } st_irferr_unalgn_trpd st_trpd st_trpd icerr_alu_st_trpd
!!# {
!!#    IJ_iseg_printf("diag.j", 449,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //dcw2,stb9,trpf,icerr
!!# last_sec_5: mMETAlast_sec_5
!!# {
!!#    IJ_iseg_printf("diag.j", 456,ISEG, 0, th_evnt, "!last_sec_5\n");
!!#    IJ_iseg_printf("diag.j", 457,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 458,ISEG, 0, th_evnt, ".skip 0x1fd4\n");
!!#    IJ_iseg_printf("diag.j", 459,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 462,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, $8, $9, -1);;
!!# } lderr_iseg icerr_alu_st_trpd icerr_alu_st_trpd 
!!# {
!!#    IJ_iseg_printf("diag.j", 465,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //ldmiss,icerr,trpf
!!# last_sec_6: mMETAlast_sec_6
!!# {
!!#    IJ_iseg_printf("diag.j", 472,ISEG, 0, th_evnt, "!last_sec_6\n");
!!#    IJ_iseg_printf("diag.j", 473,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 474,ISEG, 0, th_evnt, ".skip 0x1fd8\n");
!!#    IJ_iseg_printf("diag.j", 475,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 478,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, $8, $9, -1);;
!!# } lderr_iseg icerr_alu_st_trpd 
!!# {
!!#    IJ_iseg_printf("diag.j", 481,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //ldmiss,icerr,trpf
!!# last_sec_7: mMETAlast_sec_7
!!# {
!!#    IJ_iseg_printf("diag.j", 488,ISEG, 0, th_evnt, "!last_sec_7\n");
!!#    IJ_iseg_printf("diag.j", 489,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 490,ISEG, 0, th_evnt, ".skip 0x1fc0\n");
!!#    IJ_iseg_printf("diag.j", 491,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 492,ISEG, 0, th_evnt, "\tsetx last_inst, %%r16, %%r31\n");
!!# } store store store store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 495,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, $8, $9, -1);;
!!# } jmp icerr_alu_st_trpd icerr_iseg alu_tokens
!!# {
!!#    IJ_iseg_printf("diag.j", 498,ISEG, 0, th_evnt, "last_inst:\n");
!!#    IJ_iseg_generate ("diag.j", 499,ISEG, 0, th_evnt, $14);
!!# }
!!# ;
!!# 
!!# last_sec_8: mMETAlast_sec_8
!!# {
!!#    IJ_iseg_printf("diag.j", 505,ISEG, 0, th_evnt, "!last_sec_8\n");
!!#    IJ_iseg_printf("diag.j", 506,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 507,ISEG, 0, th_evnt, ".skip 0x1fd4\n");
!!#    IJ_iseg_printf("diag.j", 508,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 511,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, $8, $9, -1);;
!!# } br alu_tokens
!!# {
!!#    IJ_iseg_generate ("diag.j", 514,ISEG, 0, th_evnt, $12);
!!# } icerr_alu_st_trpd icerr_alu_st_trpd
!!# ;
!!# 
!!# last_sec_9: mMETAlast_sec_9
!!# {
!!#    IJ_iseg_printf("diag.j", 520,ISEG, 0, th_evnt, "!last_sec_9\n");
!!#    IJ_iseg_printf("diag.j", 521,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 522,ISEG, 0, th_evnt, ".skip 0x1fdc\n");
!!#    IJ_iseg_printf("diag.j", 523,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 526,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, -1);;
!!# } st_irferr_unalgn_trpd st_trpd st_trpd st_trpd 
!!# ;
!!# 
!!# last_sec_10: mMETAlast_sec_10
!!# {
!!#    IJ_iseg_printf("diag.j", 532,ISEG, 0, th_evnt, "!last_sec_10\n");
!!#    IJ_iseg_printf("diag.j", 533,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 534,ISEG, 0, th_evnt, ".skip 0x1fe0\n");
!!#    IJ_iseg_printf("diag.j", 535,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 538,ISEG, 0, th_evnt, $3, $4, $5, $6, -1);;
!!# } st_irferr_unalgn_trpd st_trpd st_trpd st_trpd
!!# ;
!!# 
!!# br: 	d20 br_tokens %ropr  Ro_br
!!#           {IJ_iseg_generate ("diag.j", 543,ISEG, 0, th_evnt, $2);}
!!# 	| irferr br_tokens %ropr  Ro_br
!!#           {IJ_iseg_generate ("diag.j", 545,ISEG, 0, th_evnt, $2);}
!!# ;
!!# 
!!# br_tokens: tBRZ | tBRLEZ | tBRLZ | tBRNZ | tBRGZ | tBRGEZ | tBN | tBA
!!# ;
!!# 
!!# alu_illinst_iseg: d700 
!!# 		{
!!# 			IJ_iseg_printf ("diag.j", 553,ISEG, 0, th_evnt, "\t.word 0xba00808c\n");
!!# 		}
!!#    	     | d800 alu_tokens
!!# 		{
!!# 			IJ_iseg_generate ("diag.j", 557,ISEG, 0, th_evnt, $2);
!!# 		}	       
!!# ;
!!# 
!!# alu_illinst: d701 
!!# 		{
!!# 			IJ_printf ("diag.j", 563, th_evnt, "\t.word 0xba00808c\n");
!!# 		}
!!#    	     | d801 alu_tokens
!!# 		{
!!# 			IJ_generate ("diag.j", 567, th_evnt, $2);
!!# 		}	       
!!# ;
!!# 
!!# st_irferr_unalgn_trpd: d1000 irferr_iseg 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 573,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:irferr store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 574,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");
!!# 		    }
!!#                   | d500 store %ropr  Ro_unaligned_addr
!!#                     {
!!# 		       IJ_iseg_printf("diag.j", 578,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:unaligned store\n");
!!# 		       IJ_iseg_generate ("diag.j", 579,ISEG, 0, th_evnt, $2);
!!#                     }
!!# 		  | d600 irferr_iseg store %ropr  Ro_unaligned_addr
!!#                     {
!!# 		       IJ_iseg_printf("diag.j", 583,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:irferr unaligned store\n");
!!# 		       IJ_iseg_generate ("diag.j", 584,ISEG, 0, th_evnt, $3);
!!#                     }
!!# 	          | d900 store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 588,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:Normal store\n");
!!# 		       IJ_iseg_generate ("diag.j", 589,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# 		  | d1002 irferr_iseg store
!!#                     {
!!# 		       IJ_iseg_printf("diag.j", 593,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:irferr store\n");
!!# 		       IJ_iseg_generate ("diag.j", 594,ISEG, 0, th_evnt, $3);
!!#                     }
!!# ;
!!# 
!!# st_trpd: d1001 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 600,ISEG, 0, th_evnt, "!st_trpd: store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 601,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");		     
!!# 		    }
!!# 	| d901 store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 605,ISEG, 0, th_evnt, "!st_trpd:Normal store\n");
!!# 		       IJ_iseg_generate ("diag.j", 606,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# ;
!!# 
!!# icerr_alu_st_trpd:  d909 icerr_iseg 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 612,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: icerr alu rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 613,ISEG, 0, th_evnt, "\t.word 0xba00808c\n");
!!# 		    }
!!# 		   | d903 icerr_iseg 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 617,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: icerr store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 618,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");
!!# 		    }
!!# 		   | d904 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 622,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: alu rsvd\n");
!!# 		       IJ_iseg_printf ("diag.j", 623,ISEG, 0, th_evnt, "\t.word 0xba00808c\n");
!!# 		    }
!!# 		   | d905 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 627,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 628,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");
!!# 		    }
!!# 	   	   | d915 store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 632,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: Normal store\n");
!!# 		       IJ_iseg_generate ("diag.j", 633,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# 	   	   | d916 alu_tokens
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 637,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: Normal alu\n");
!!# 		       IJ_iseg_generate ("diag.j", 638,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# 		   | d902 icerr_iseg store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 642,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: icerr store\n");
!!# 		       IJ_iseg_generate ("diag.j", 643,ISEG, 0, th_evnt, $3);
!!# 		    }
!!# ;
!!# 
!!# load: load_i | load_r
!!# ;
!!# 
!!# load_i: tLDSB_I  | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I 
!!# ;
!!# 
!!# load_r: tLDSB_R  | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R 
!!# ;
!!# 
!!# lderr_iseg: dcerr_iseg load_r %ropr  Ro_load_r
!!#        {
!!#          IJ_iseg_printf("diag.j", 658,ISEG, 0, th_evnt, "!lderr: dcerr load\n");
!!#          IJ_iseg_generate ("diag.j", 659,ISEG, 0, th_evnt, $2);
!!#        } 
!!#        | d908 load
!!#        {
!!#          IJ_iseg_printf("diag.j", 663,ISEG, 0, th_evnt, "!lderr: Normal load\n");
!!#          IJ_iseg_generate ("diag.j", 664,ISEG, 0, th_evnt, $2);
!!#        }
!!#        | irferr_iseg load 
!!#        {
!!#          IJ_iseg_printf("diag.j", 668,ISEG, 0, th_evnt, "!lderr: irferr load\n");
!!#          IJ_iseg_generate ("diag.j", 669,ISEG, 0, th_evnt, $2);
!!#        } 
!!# ;
!!# 
!!# dcerr_iseg: mMETA5
!!# {
!!#    IJ_iseg_printf ("diag.j", 675,ISEG, 0, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_iseg_printf ("diag.j", 677,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA56
!!# {
!!#    IJ_printf ("diag.j", 684, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 686, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# lop: mMETAmul_div
!!# {
!!#      for (i = 0; i < 500; i++) {
!!#        inst = random () % 3;
!!#        if (inst == 0) {
!!#          IJ_generate_from_token ("diag.j", 697,1, th_lop, ijdefault,tUDIV_I, tUDIV_R, tSDIV_I, tSDIV_R, 
!!#     		               tSDIVX_R, tSDIVX_I, tUDIVX_R, tUDIVX_I, tUDIVcc_I, tUDIVcc_R, 
!!#                                tSDIVcc_I, tSDIVcc_R, -1);;
!!#        } else if (inst == 1) {
!!# 	     IJ_generate_from_token ("diag.j", 699,1, th_lop, ijdefault,tMULX_R, tMULX_I, tUMUL_R, tUMUL_I, 
!!# 				        tSMUL_R, tSMUL_I, tUMULcc_R, tUMULcc_I, tSMULcc_R, tSMULcc_I, 
!!# 					tMULScc_R, tMULScc_I, -1);;
!!#        } else {
!!# 	    IJ_generate_from_token ("diag.j", 701,1, th_lop, ijdefault, tFADDs, tFXNORS, tFADDd, tFADDq, tFSUBs, tFMOVA, tFSUBd, tFMOVN, tFSUBq, tFMOVNE, tFCMPs, tFMOVE, tFCMPd, tFMOVG, tFCMPq, tFMOVLE, tFCMPEs, tFMOVGE, tFCMPEd, tFMOVL, tFCMPEq, tFMOVGU, tFsTOx, tFMOVLEU, tFdTOx, tFMOVCC, tFqTOx, tFMOVCS, tFsTOi, tFMOVPOS, tFdTOi, tFMOVNEG, tFqTOi, tFMOVVC, tFsTOd, tFMOVVS, tFsTOq, tFMOVRZ, tFdTOs, tFMOVRLEZ, tFdTOq, tFMOVRLZ, tFqTOs, tFMOVRNZ, tFqTOd, tFMOVRGZ, tFxTOs, tFMOVRGEZ, tFxTOd, tFxTOq, tFiTOs, tFiTOd, tFiTOq, tFMOVs, tFMOVd, tFMOVq, tFNEGs, tFNEGd, tFNEGq, tFABSs, tFABSd, tFABSq, tFMULs, tFMULd, tFMULq, tFsMULd, tFdMULq, tFDIVs, tFDIVd, tFDIVq, tFSQRTs, tFSQRTd, tFSQRTq, tFBA, tFBN, tFBU, tFBG, tFBL, tFBUL, tFBLG, tFBNE, tFBE, tFBUE, tFBGE, tFBUG, tFBLE, tFBO, tFBPA, tFBPN, tFBPE, tFBPG, tFBPU, tFBPL, tFBPO, -1);;
!!#        }
!!#      }
!!# }
!!# ;
!!# 
!!# intr: mMETA70
!!# {
!!#   for (i = 0; i < 500; i++) {
!!#       if (random () % 2 == 0) {
!!#          burst_cnt = random () % 7 + 1;
!!#          thrid = random () % 2;
!!#          IJ_printf ("diag.j", 718, th_intr, "thr%y_nuke_intr_%d:\n", intr_cnt);
!!#          IJ_printf ("diag.j", 719, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_nuke_intr_%d), 16, 16)) -> intp(%d, 2, 1)\n", intr_cnt,thrid);
!!#          IJ_generate_from_token ("diag.j", 720,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#          IJ_printf ("diag.j", 721, th_intr, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#          IJ_printf ("diag.j", 722, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%d, 3, 1)\n", intr_cnt,thrid);
!!#          burst_cnt = random () % 4 + 1;
!!#          IJ_generate_from_token ("diag.j", 724,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#      } else {
!!#          burst_cnt = random () % 2 + 6;
!!#          thrid = random () % 2;
!!#          IJ_printf ("diag.j", 728, th_intr, "thr%y_hw_intr_%d:\n", intr_cnt);
!!#          IJ_printf ("diag.j", 729, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_hw_intr_%d), 16, 16)) -> intp(%d, 0, 1)\n", intr_cnt,thrid);
!!#          IJ_generate_from_token ("diag.j", 730,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#      }
!!#      intr_cnt++;
!!#   }
!!# }
!!# ;
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: stores | mul_div_fpop | oor_trap_pc | alu_burst | oor_pc | lderr_oor_pc | oor_pc_icerr | oor_pc_icerr_2 
!!# ;
!!# 
!!# lderr_oor_pc: d11 d2001 lderr irferr_jmpl icerr_alu 
!!# ;
!!# 
!!# oor_pc: mMETAoor_pc
!!# {
!!#    IJ_printf ("diag.j", 778, th_evnt, "\trd      %%pc, %%r19\n");
!!#    IJ_printf ("diag.j", 779, th_evnt, "\tadd     %%r19, 0x28, %%r19\n");
!!#    IJ_printf ("diag.j", 780, th_evnt, "\tsetx    last_l1c, %%r16, %%r31\n");
!!#    IJ_printf ("diag.j", 781, th_evnt, "\tjmpl 	  %%r31, %%r0\n");
!!#    IJ_printf ("diag.j", 782, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# oor_trap_pc: mMETAoor_trap
!!# {
!!#    IJ_printf ("diag.j", 788, th_evnt, "\trd      %%pc, %%r19\n");
!!#    IJ_printf ("diag.j", 789, th_evnt, "\tadd     %%r19, 0xc, %%r19\n");
!!#    if (random () % 2 == 0) {
!!#      IJ_printf ("diag.j", 791, th_evnt, "\tta 0x31\n");
!!#    } else {
!!#      IJ_printf ("diag.j", 793, th_evnt, "\tta 0x32\n");
!!#    }
!!# }
!!# ;
!!# 
!!# stores: alu d10 
!!#         {
!!#            IJ_printf ("diag.j", 800, th_evnt, "\tsetx  0x%016llrx, %%r16, %%r17\n", pc_va_oor);
!!#            i = random () % 5 + 8;
!!# 	   IJ_printf ("diag.j", 802, th_evnt, "\trd      %%pc, %%r19\n");
!!# 	   IJ_printf ("diag.j", 803, th_evnt, "\tadd     %%r19, 0x40, %%r19\n");
!!#            IJ_generate_from_token ("diag.j", 804,i, th_evnt, ijdefault, tSTB_I, tSTH_I, tSTW_I, tSTX_I, tSTB_R, tSTH_R, tSTW_R, tSTX_R, -1);;
!!#         }
!!#         irferr_jmpl store8 
!!# 	{
!!# 	   IJ_generate ("diag.j", 808, th_evnt, $5);
!!# 	}
!!# 	icerr_alu alu alu alu alu alu alu 
!!# ;
!!# 
!!# d11: mMETA11
!!# {
!!#            IJ_printf ("diag.j", 815, th_evnt, "\tsetx  0x%016llrx, %%r16, %%r17\n", pc_va_oor);
!!# 	   IJ_printf ("diag.j", 816, th_evnt, "\trd      %%pc, %%r19\n");
!!# 	   IJ_printf ("diag.j", 817, th_evnt, "\tadd     %%r19, 0x14, %%r19\n");
!!# }
!!# ;
!!# 
!!# d12: mMETA12
!!# {
!!#            IJ_printf ("diag.j", 823, th_evnt, "\tsetx  0x%016llrx, %%r16, %%r17\n", pc_va_oor);
!!# 	   IJ_printf ("diag.j", 824, th_evnt, "\trd      %%pc, %%r19\n");
!!# 	   IJ_printf ("diag.j", 825, th_evnt, "\tadd     %%r19, 0x10, %%r19\n");
!!# }
!!# ;
!!# 
!!# mul_div_fpop: alu d12 irferr_jmpl mul %ropr  Ro_rsvd_set
!!# 		{
!!# 		  IJ_generate ("diag.j", 831, th_evnt, $4);
!!# 		}
!!# 	      | alu d12 irferr_jmpl div %ropr  Ro_rsvd_set
!!# 		{
!!# 		  IJ_generate ("diag.j", 835, th_evnt, $4);
!!# 		}
!!# 	      | alu d12 irferr_jmpl fpop	
!!# 		{
!!# 		  IJ_generate ("diag.j", 839, th_evnt, $4);
!!# 		}
!!#               | d2002 alu d12 irferr_jmpl mul
!!# 		{
!!# 		  IJ_generate ("diag.j", 843, th_evnt, $5);
!!# 		}
!!# 	      | d2003 alu d12 irferr_jmpl div
!!# 		{
!!# 		  IJ_generate ("diag.j", 847, th_evnt, $5);
!!# 		}
!!# ;
!!# 
!!# oor_pc_icerr: alu d11 d2001 irferr_jmpl alu_illinst icerr_alu
!!# ;
!!# 
!!# oor_pc_icerr_2: alu d12 d2020 irferr_jmpl icerr_alu
!!# ;
!!# 
!!# mul_div_fpop_iseg: mul %ropr  Ro_rsvd_set
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 859,ISEG, 0, th_evnt, $1);
!!# 		}
!!# 	      | div %ropr  Ro_rsvd_set
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 863,ISEG, 0, th_evnt, $1);
!!# 		}
!!# 	      | fpop	
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 867,ISEG, 0, th_evnt, $1);
!!# 		}
!!# 	      | d2002 mul
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 871,ISEG, 0, th_evnt, $2);
!!# 		}	        
!!# 	      | d2003 div
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 875,ISEG, 0, th_evnt, $2);
!!# 		}	        
!!# ;
!!# 
!!# store8: d444 store_i 
!!# 	{IJ_generate ("diag.j", 880, th_evnt, $2);}
!!#        | d333 
!!# 	{IJ_printf ("diag.j", 882, th_evnt, "\t.word 0xf472008d\n");}
!!#        | d222 icerr store_i
!!# 	{IJ_generate ("diag.j", 884, th_evnt, $3);}
!!#        | d111 icerr store_r
!!# 	{IJ_generate ("diag.j", 886, th_evnt, $3);}
!!#        | d000 icerr 
!!# 	{IJ_printf ("diag.j", 888, th_evnt, "\t.word 0xf472008d\n");}
!!#        | d555 store_r
!!# 	{IJ_generate ("diag.j", 890, th_evnt, $2);}
!!# ;
!!# 
!!# icerr_alu: icerr alu | d5945 alu | d765 icerr 
!!#    {
!!#        IJ_printf ("diag.j", 895, th_evnt, "\t.word 0xba00808c\n");
!!#    }
!!# ;
!!# 
!!# irferr_jmpl: irferr jmpl %ropr  Ro_jmpl | d3467 jmpl %ropr  Ro_jmpl
!!# ;
!!# 
!!# jmpl: tJMPL_R %ropr  Ro_jmpl
!!#    {
!!#       IJ_generate ("diag.j", 904, th_evnt, $1);
!!#    }
!!# ;
!!# 
!!# jmp: normal_jmp | irferr_jmp | unalign_jmp | unalign_irferr_jmp
!!# ;
!!# 
!!# normal_jmp: mMETAnormal_jmp
!!# {
!!#    IJ_iseg_printf("diag.j", 913,ISEG, 0, th_evnt, "\tjmpl %%r31, %%r0\n");
!!# }
!!# ;
!!# 
!!# irferr_jmp: mMETAirferr_jmp
!!# {
!!#      IJ_iseg_printf ("diag.j", 919,ISEG, 0, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_iseg_printf ("diag.j", 921,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!#      IJ_iseg_printf("diag.j", 923,ISEG, 0, th_evnt, "\tjmpl %%r31, %%r0\n");
!!# }
!!# ;
!!# 
!!# unalign_jmp: mMETAunalign_jmp
!!# {
!!#   i = random () % 3;
!!#   if (i == 0) {
!!#     IJ_iseg_printf("diag.j", 931,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x1, %%r0\n");
!!#   } else if (i == 1) {
!!#     IJ_iseg_printf("diag.j", 933,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x2, %%r0\n");
!!#   } else if (i == 2) {
!!#     IJ_iseg_printf("diag.j", 935,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x3, %%r0\n");
!!#   }
!!# }
!!# ;
!!# 
!!# unalign_irferr_jmp: mMETAunalign_irferr_jmp
!!# {
!!#      IJ_iseg_printf ("diag.j", 942,ISEG, 0, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_iseg_printf ("diag.j", 944,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!#      i = random () % 3;
!!#      if (i == 0) {
!!#        IJ_iseg_printf("diag.j", 948,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x1, %%r0\n");
!!#      } else if (i == 1) {
!!#        IJ_iseg_printf("diag.j", 950,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x2, %%r0\n");
!!#      } else if (i == 2) {
!!#        IJ_iseg_printf("diag.j", 952,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x3, %%r0\n");
!!#      }
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA17
!!# { 
!!#    burst_cnt = random () % 3 + 3; 
!!#    IJ_generate_from_token ("diag.j", 960,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!# }
!!# ;
!!# 
!!# icerr: mMETA18
!!# {
!!#    IJ_printf ("diag.j", 966, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    bitnum = random () % 34;
!!#    IJ_printf ("diag.j", 968, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# icerr_iseg: mMETA19
!!# {
!!#    IJ_iseg_printf ("diag.j", 975,ISEG, 0, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    bitnum = random () % 34;
!!#    IJ_iseg_printf ("diag.j", 977,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf ("diag.j", 984, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 986, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# lderr: dcerr load_r %ropr  Ro_load_r
!!#        {
!!#          IJ_generate ("diag.j", 993, th_evnt, $2);
!!#        } 
!!# ;
!!# 
!!# irferr_iseg: mMETA20_iseg
!!# {
!!#      IJ_iseg_printf ("diag.j", 999,ISEG, 0, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_iseg_printf ("diag.j", 1001,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# store: d566 store_i 
!!#         {$$ = $2;}
!!#        | d655 store_r
!!#         {$$ = $2;}
!!# ;
!!# 
!!# store_i: tSTB_I | tSTH_I | tSTW_I | tSTX_I 
!!# ;
!!# 
!!# store_r: tSTB_R | tSTH_R | tSTW_R | tSTX_R
!!# ;
!!# 
!!# alu: d15 alu_tokens
!!# {
!!#    IJ_generate ("diag.j", 1020, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# alu_tokens: tADD_I | tADDcc_I | tADDC_I | tADDCcc_I
!!# 			 | tAND_I | tANDcc_I | tANDN_I
!!#                          | tANDNcc_I | tOR_I | tORcc_I | tORN_I 
!!#  			 | tORNcc_I | tXOR_I  | tXORcc_I 
!!# 			 | tXNOR_I | tXNORcc_I | tMOVcc_I 
!!#                        | tMOVR_I | tSLL_I | tSRL_I
!!#                        |  tSRA_I | tSLLX_I | tSRLX_I
!!#                        |  tSRAX_I | tSUB_I | tSUBcc_I | tSUBC_I 
!!# 	     | tADD_R | tADDcc_R | tADDC_R | tADDCcc_R | tAND_R | tANDcc_R | tANDN_R
!!# 	     | tANDNcc_R | tOR_R | tORcc_R | tORN_R |  tORNcc_R | tXOR_R | tXORcc_R |  tXNOR_R 
!!# 	     | tMOVcc_R | tMOVR_R | tSLL_R | tSRL_R | tSRA_R | tSLLX_R | tSRLX_R | tSRAX_R | tSUB_R 
!!# 	     | tSUBcc_R | tSUBC_R | tXNORcc_R
!!# ;
!!# 
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R 
!!#      | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!!# 
!!# mul: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I | tUMULcc_R 
!!#      | tUMULcc_I | tSMULcc_R | tSMULcc_I | tMULScc_R | tMULScc_I
!!# ;
!!# 
!!# arith_fp: tFADDs | tFSUBs | tFMULs | tFDIVs
!!# ;
!!# 
!!# fpop: tFADDs | tFXNORS | tFADDd | tFADDq | tFSUBs | tFMOVA | tFSUBd | tFMOVN | tFSUBq | tFMOVNE | tFCMPs | tFMOVE | tFCMPd | tFMOVG | tFCMPq | tFMOVLE | tFCMPEs | tFMOVGE | tFCMPEd | tFMOVL | tFCMPEq | tFMOVGU | tFsTOx | tFMOVLEU | tFdTOx | tFMOVCC | tFqTOx | tFMOVCS | tFsTOi | tFMOVPOS | tFdTOi | tFMOVNEG | tFqTOi | tFMOVVC | tFsTOd | tFMOVVS | tFsTOq | tFMOVRZ | tFdTOs | tFMOVRLEZ | tFdTOq | tFMOVRLZ | tFqTOs | tFMOVRNZ | tFqTOd | tFMOVRGZ | tFxTOs | tFMOVRGEZ | tFxTOd | tFxTOq | tFiTOs | tFiTOd | tFiTOq | tFMOVs | tFMOVd | tFMOVq | tFNEGs | tFNEGd | tFNEGq | tFABSs | tFABSd | tFABSq | tFMULs | tFMULd | tFMULq | tFsMULd | tFdMULq | tFDIVs | tFDIVd | tFDIVq | tFSQRTs | tFSQRTd | tFSQRTq | tFBA | tFBN | tFBU | tFBG | tFBL | tFBUL | tFBLG | tFBNE | tFBE | tFBUE | tFBGE | tFBUG | tFBLE | tFBO | tFBPA | tFBPN | tFBPE | tFBPG | tFBPU | tFBPL | tFBPO | tLDF_R | tLDF_I | tLDDF_R | tLDDF_I | tLDQF_R | tLDQF_I | tLDFA_R | tLDDFA_R | tLDQFA_R
!!# ;
!!# 
!!# d10: mMETA10
!!# ;
!!# 
!!# d15: mMETA15
!!# ;
!!# 
!!# d5945: mMETAd5945
!!# ;
!!# 
!!# d3467: mMETAd3467
!!# ;
!!# 
!!# d500: mMETA500
!!# ;
!!# 
!!# d600: mMETA600
!!# ;
!!# 
!!# d700: mMETA700
!!# ;
!!# 
!!# d800: mMETA800
!!# ;
!!# 
!!# d900: mMETA900
!!# ;
!!# 
!!# d1000: mMETA1000
!!# ;
!!# 
!!# d901: mMETA901
!!# ;
!!# 
!!# d1001: mMETA1001
!!# ;
!!# 
!!# d902: mMETA902
!!# ;
!!# 
!!# d903: mMETA903
!!# ;
!!# 
!!# d904: mMETA904
!!# ;
!!# 
!!# d905: mMETA905
!!# ;
!!# 
!!# d908: mMETA908
!!# ;
!!# 
!!# d909: mMETA909
!!# ;
!!# 
!!# d1002: mMETA1002
!!# ;
!!# 
!!# d2002: mMETA2002
!!# ;
!!# 
!!# d2003: mMETA2003
!!# ;
!!# 
!!# d915: mMETA915
!!# ;
!!# 
!!# d916: mMETA916
!!# ;
!!# 
!!# d2001: mMETA2001
!!# {
!!#    IJ_printf ("diag.j", 1132, th_evnt, ".align 0x8\n");
!!# };
!!# 
!!# d2020: mMETA2020
!!# {
!!#    IJ_printf ("diag.j", 1137, th_evnt, ".align 0x4\n");
!!# };
!!# 
!!# d701: mMETA701
!!# ;
!!# 
!!# d801: mMETA801
!!# ;
!!# 
!!# d765: mMETA765
!!# ;
!!# 
!!# d000: mMETA000
!!# ;
!!# 
!!# d111: mMETA111
!!# ;
!!# 
!!# d222: mMETA222
!!# ;
!!# 
!!# d333: mMETA333
!!# ;
!!# 
!!# d444: mMETA444
!!# ;
!!# 
!!# d555: mMETA555
!!# ;
!!# 
!!# d566: mMETA566
!!# ;
!!# 
!!# d655: mMETA655
!!# ;
!!# 
!!# d20: mMETA20000000
!!# ;
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif

