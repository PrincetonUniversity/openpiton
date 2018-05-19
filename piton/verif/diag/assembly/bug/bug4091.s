// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug4091.s
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
   random seed:	918518066
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
	setx  0x4c07002fdcf3b37e, %r16, %r16
	setx  0xc8fe0c9439b60a0f, %r16, %r17
	setx  0x37c54f2647d9fb90, %r16, %r18
	setx  0xe3bfea84ec4b308b, %r16, %r19
	setx  0x0284a0d92a944381, %r16, %r20
	setx  0xbbad750cbc544686, %r16, %r21
	setx  0x437254a29b6cf382, %r16, %r22
	setx  0x3626e301a44829a7, %r16, %r23
	setx  0xeb1cdab90a16b86a, %r16, %r24
	setx  0x9662ce6d90efe0f4, %r16, %r25
	setx  0x31fa7cd1c8242607, %r16, %r26
	setx  0xbf1a475e6f13ce47, %r16, %r27
	setx  0x05f07dc404d8d89b, %r16, %r28
	setx  0xc2193608cd8a7151, %r16, %r29
	setx  0xe428667600ddc041, %r16, %r30
	setx  0x7dd5cdcde9e8d037, %r16, %r31
	setx  0x0000000000000cd0, %r16, %r10
	setx  0x0000000000000940, %r16, %r11
	setx  0x00000000000007f0, %r16, %r12
	setx  0x00000000000009b0, %r16, %r13
	setx  0x0000000000000370, %r16, %r14
	setx  0x0000000000000fe0, %r16, %r15
	setx  0x0000000000000141, %r16, %r9
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
thr3_hw_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_0), 16, 16)) -> intp(0, 0, 1)
	.word 0xbca927fe  ! 4: ANDNcc_I	andncc 	%r4, 0x07fe, %r30
	.word 0xb731b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r27
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xba1965e3  ! 4: XOR_I	xor 	%r5, 0x05e3, %r29
	.word 0xbc89800b  ! 4: ANDcc_R	andcc 	%r6, %r11, %r30
	.word 0xae99e7d0  ! 4: XORcc_I	xorcc 	%r7, 0x07d0, %r23
	.word 0xb578840b  ! 4: MOVR_R	move	%r2, %r11, %r26
thr3_nuke_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_1), 16, 16)) -> intp(0, 2, 1)
	.word 0xb288c00b  ! 4: ANDcc_R	andcc 	%r3, %r11, %r25
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
	.word 0xb529000f  ! 4: SLL_R	sll 	%r4, %r15, %r26
	.word 0xaa19c00b  ! 4: XOR_R	xor 	%r7, %r11, %r21
thr3_nuke_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_2), 16, 16)) -> intp(0, 2, 1)
	.word 0xab39c00a  ! 4: SRA_R	sra 	%r7, %r10, %r21
	.word 0xaeb1c00c  ! 4: ORNcc_R	orncc 	%r7, %r12, %r23
	.word 0xb33a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r25
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(0, 3, 1)
	.word 0xab792401  ! 4: MOVR_I	move	%r4, 0x1, %r21
	.word 0xbb2a100c  ! 4: SLLX_R	sllx	%r8, %r12, %r29
	.word 0xbb39500a  ! 4: SRAX_R	srax	%r5, %r10, %r29
thr3_nuke_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_3), 16, 16)) -> intp(1, 2, 1)
	.word 0xb030edc8  ! 4: ORN_I	orn 	%r3, 0x0dc8, %r24
	.word 0xba18eb04  ! 4: XOR_I	xor 	%r3, 0x0b04, %r29
	.word 0xbd29500f  ! 4: SLLX_R	sllx	%r5, %r15, %r30
	.word 0xb0ba25e9  ! 4: XNORcc_I	xnorcc 	%r8, 0x05e9, %r24
	.word 0xba29400a  ! 4: ANDN_R	andn 	%r5, %r10, %r29
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf792401  ! 4: MOVR_I	move	%r4, 0xa, %r23
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_4), 16, 16)) -> intp(0, 2, 1)
	.word 0xac80ef55  ! 4: ADDcc_I	addcc 	%r3, 0x0f55, %r22
	.word 0xb611c00e  ! 4: OR_R	or 	%r7, %r14, %r27
	.word 0xa8c1269d  ! 4: ADDCcc_I	addccc 	%r4, 0x069d, %r20
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6b1eef8  ! 4: ORNcc_I	orncc 	%r7, 0x0ef8, %r27
	.word 0xb938900e  ! 4: SRAX_R	srax	%r2, %r14, %r28
thr3_hw_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_5), 16, 16)) -> intp(1, 0, 1)
	.word 0xad28d00f  ! 4: SLLX_R	sllx	%r3, %r15, %r22
	.word 0xb329a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r25
	.word 0xb530c00b  ! 4: SRL_R	srl 	%r3, %r11, %r26
	.word 0xbc1a000f  ! 4: XOR_R	xor 	%r8, %r15, %r30
	.word 0xab38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r21
	.word 0xaea8800d  ! 4: ANDNcc_R	andncc 	%r2, %r13, %r23
thr3_nuke_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_6), 16, 16)) -> intp(0, 2, 1)
	.word 0xb092000c  ! 4: ORcc_R	orcc 	%r8, %r12, %r24
	.word 0xaca8e986  ! 4: ANDNcc_I	andncc 	%r3, 0x0986, %r22
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
	.word 0xa939d00f  ! 4: SRAX_R	srax	%r7, %r15, %r20
	.word 0xb33a000d  ! 4: SRA_R	sra 	%r8, %r13, %r25
thr3_hw_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_7), 16, 16)) -> intp(0, 0, 1)
	.word 0xb291800a  ! 4: ORcc_R	orcc 	%r6, %r10, %r25
	.word 0xb241000b  ! 4: ADDC_R	addc 	%r4, %r11, %r25
	.word 0xb931900e  ! 4: SRLX_R	srlx	%r6, %r14, %r28
	.word 0xbc31a3e8  ! 4: ORN_I	orn 	%r6, 0x03e8, %r30
	.word 0xab396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r21
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_8), 16, 16)) -> intp(0, 0, 1)
	.word 0xaeb8e31a  ! 4: XNORcc_I	xnorcc 	%r3, 0x031a, %r23
	.word 0xae09e958  ! 4: AND_I	and 	%r7, 0x0958, %r23
	.word 0xb93a100e  ! 4: SRAX_R	srax	%r8, %r14, %r28
	.word 0xba19c00e  ! 4: XOR_R	xor 	%r7, %r14, %r29
	.word 0xaa822484  ! 4: ADDcc_I	addcc 	%r8, 0x0484, %r21
	.word 0xb4a9800e  ! 4: ANDNcc_R	andncc 	%r6, %r14, %r26
	.word 0xaa98e32e  ! 4: XORcc_I	xorcc 	%r3, 0x032e, %r21
thr3_nuke_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_9), 16, 16)) -> intp(0, 2, 1)
	.word 0xa939e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r20
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
	.word 0xa97a040c  ! 4: MOVR_R	move	%r8, %r12, %r20
thr3_nuke_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_10), 16, 16)) -> intp(1, 2, 1)
	.word 0xb029800a  ! 4: ANDN_R	andn 	%r6, %r10, %r24
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8b8e586  ! 4: XNORcc_I	xnorcc 	%r3, 0x0586, %r20
	.word 0xb030ee89  ! 4: ORN_I	orn 	%r3, 0x0e89, %r24
	.word 0xbb78840d  ! 4: MOVR_R	move	%r2, %r13, %r29
thr3_nuke_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_11), 16, 16)) -> intp(1, 2, 1)
	.word 0xb689a851  ! 4: ANDcc_I	andcc 	%r6, 0x0851, %r27
	.word 0xbab1800b  ! 4: ORNcc_R	orncc 	%r6, %r11, %r29
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa01000f  ! 4: ADD_R	add 	%r4, %r15, %r21
	.word 0xb1296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r24
thr3_nuke_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_12), 16, 16)) -> intp(1, 2, 1)
	.word 0xb7392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r27
	.word 0xb641800c  ! 4: ADDC_R	addc 	%r6, %r12, %r27
	.word 0xbc3a000b  ! 4: XNOR_R	xnor 	%r8, %r11, %r30
	.word 0xb329900f  ! 4: SLLX_R	sllx	%r6, %r15, %r25
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xb601649c  ! 4: ADD_I	add 	%r5, 0x049c, %r27
	.word 0xad31100c  ! 4: SRLX_R	srlx	%r4, %r12, %r22
thr3_nuke_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_13), 16, 16)) -> intp(0, 2, 1)
	.word 0xb029a9a5  ! 4: ANDN_I	andn 	%r6, 0x09a5, %r24
	.word 0xb83224d6  ! 4: ORN_I	orn 	%r8, 0x04d6, %r28
	.word 0xbc32000f  ! 4: ORN_R	orn 	%r8, %r15, %r30
	.word 0xb0b1000c  ! 4: ORNcc_R	orncc 	%r4, %r12, %r24
	.word 0xaf30900a  ! 4: SRLX_R	srlx	%r2, %r10, %r23
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(0, 3, 1)
	.word 0xb831400b  ! 4: ORN_R	orn 	%r5, %r11, %r28
	.word 0xab30c00b  ! 4: SRL_R	srl 	%r3, %r11, %r21
	.word 0xb089800c  ! 4: ANDcc_R	andcc 	%r6, %r12, %r24
thr3_hw_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_14), 16, 16)) -> intp(0, 0, 1)
	.word 0xb081000e  ! 4: ADDcc_R	addcc 	%r4, %r14, %r24
	.word 0xae98eab8  ! 4: XORcc_I	xorcc 	%r3, 0x0ab8, %r23
	.word 0xb128800f  ! 4: SLL_R	sll 	%r2, %r15, %r24
	.word 0xbd31400a  ! 4: SRL_R	srl 	%r5, %r10, %r30
	.word 0xb419800d  ! 4: XOR_R	xor 	%r6, %r13, %r26
	.word 0xaa10c00c  ! 4: OR_R	or 	%r3, %r12, %r21
thr3_hw_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_15), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r29
	.word 0xb889800d  ! 4: ANDcc_R	andcc 	%r6, %r13, %r28
	.word 0xa8012c20  ! 4: ADD_I	add 	%r4, 0x0c20, %r20
	.word 0xb4b96326  ! 4: XNORcc_I	xnorcc 	%r5, 0x0326, %r26
	.word 0xa979440c  ! 4: MOVR_R	move	%r5, %r12, %r20
	.word 0xb129b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r24
	.word 0xaac0c00d  ! 4: ADDCcc_R	addccc 	%r3, %r13, %r21
thr3_hw_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_16), 16, 16)) -> intp(1, 0, 1)
	.word 0xba40a7cd  ! 4: ADDC_I	addc 	%r2, 0x07cd, %r29
	.word 0xaa3a000f  ! 4: XNOR_R	xnor 	%r8, %r15, %r21
	.word 0xb089c00d  ! 4: ANDcc_R	andcc 	%r7, %r13, %r24
	.word 0xbd78840e  ! 4: MOVR_R	move	%r2, %r14, %r30
	.word 0xaa09c00c  ! 4: AND_R	and 	%r7, %r12, %r21
	.word 0xb4c0c00c  ! 4: ADDCcc_R	addccc 	%r3, %r12, %r26
	.word 0xad29b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r22
thr3_nuke_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_17), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8116932  ! 4: OR_I	or 	%r5, 0x0932, %r28
	.word 0xb601400d  ! 4: ADD_R	add 	%r5, %r13, %r27
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(0, 3, 1)
	.word 0xa831c00b  ! 4: ORN_R	orn 	%r7, %r11, %r20
	.word 0xb802000f  ! 4: ADD_R	add 	%r8, %r15, %r28
	.word 0xa811400e  ! 4: OR_R	or 	%r5, %r14, %r20
thr3_hw_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_18), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb64180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa29400c  ! 4: ANDN_R	andn 	%r5, %r12, %r21
	.word 0xb881400d  ! 4: ADDcc_R	addcc 	%r5, %r13, %r28
	.word 0xb539100a  ! 4: SRAX_R	srax	%r4, %r10, %r26
	.word 0xb282000f  ! 4: ADDcc_R	addcc 	%r8, %r15, %r25
	.word 0xac40a6df  ! 4: ADDC_I	addc 	%r2, 0x06df, %r22
thr3_hw_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_19), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0b9400f  ! 4: XNORcc_R	xnorcc 	%r5, %r15, %r24
	.word 0xbc19a294  ! 4: XOR_I	xor 	%r6, 0x0294, %r30
	.word 0xa801800d  ! 4: ADD_R	add 	%r6, %r13, %r20
	.word 0xbc80c00f  ! 4: ADDcc_R	addcc 	%r3, %r15, %r30
	.word 0xb730900a  ! 4: SRLX_R	srlx	%r2, %r10, %r27
	.word 0xba02000b  ! 4: ADD_R	add 	%r8, %r11, %r29
thr3_hw_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_20), 16, 16)) -> intp(1, 0, 1)
	.word 0xae296c2e  ! 4: ANDN_I	andn 	%r5, 0x0c2e, %r23
	.word 0xb4b0c00e  ! 4: ORNcc_R	orncc 	%r3, %r14, %r26
	.word 0xb2b9400b  ! 4: XNORcc_R	xnorcc 	%r5, %r11, %r25
	.word 0xad31c00d  ! 4: SRL_R	srl 	%r7, %r13, %r22
	.word 0xa8c1c00c  ! 4: ADDCcc_R	addccc 	%r7, %r12, %r20
	.word 0xae81400c  ! 4: ADDcc_R	addcc 	%r5, %r12, %r23
	.word 0xbb30a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r29
thr3_nuke_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_21), 16, 16)) -> intp(0, 2, 1)
	.word 0xb491c00f  ! 4: ORcc_R	orcc 	%r7, %r15, %r26
	.word 0xa832000f  ! 4: ORN_R	orn 	%r8, %r15, %r20
	.word 0xac81e73e  ! 4: ADDcc_I	addcc 	%r7, 0x073e, %r22
	.word 0xba39400d  ! 4: XNOR_R	xnor 	%r5, %r13, %r29
	.word 0xbd29500f  ! 4: SLLX_R	sllx	%r5, %r15, %r30
	.word 0xbca8efa5  ! 4: ANDNcc_I	andncc 	%r3, 0x0fa5, %r30
thr3_resum_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21), 16, 16)) -> intp(0, 3, 1)
	.word 0xa89a257e  ! 4: XORcc_I	xorcc 	%r8, 0x057e, %r20
	.word 0xb37a2401  ! 4: MOVR_I	move	%r8, 0x57e, %r25
thr3_hw_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_22), 16, 16)) -> intp(0, 0, 1)
	.word 0xa811800c  ! 4: OR_R	or 	%r6, %r12, %r20
	.word 0xb03923e4  ! 4: XNOR_I	xnor 	%r4, 0x03e4, %r24
	.word 0xae11400f  ! 4: OR_R	or 	%r5, %r15, %r23
	.word 0xaaa9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r21
	.word 0xb0b12cb8  ! 4: ORNcc_I	orncc 	%r4, 0x0cb8, %r24
	.word 0xb019800b  ! 4: XOR_R	xor 	%r6, %r11, %r24
thr3_hw_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_23), 16, 16)) -> intp(1, 0, 1)
	.word 0xb539a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r26
	.word 0xab392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r21
	.word 0xa891c00a  ! 4: ORcc_R	orcc 	%r7, %r10, %r20
	.word 0xbc11800e  ! 4: OR_R	or 	%r6, %r14, %r30
	.word 0xa931500d  ! 4: SRLX_R	srlx	%r5, %r13, %r20
	.word 0xbc28c00e  ! 4: ANDN_R	andn 	%r3, %r14, %r30
	.word 0xaa422b10  ! 4: ADDC_I	addc 	%r8, 0x0b10, %r21
thr3_hw_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_24), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r23
	.word 0xac30e945  ! 4: ORN_I	orn 	%r3, 0x0945, %r22
	.word 0xa891a6ce  ! 4: ORcc_I	orcc 	%r6, 0x06ce, %r20
	.word 0xaf28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r23
	.word 0xbc9967df  ! 4: XORcc_I	xorcc 	%r5, 0x07df, %r30
	.word 0xb808e6e6  ! 4: AND_I	and 	%r3, 0x06e6, %r28
	.word 0xb6b9000e  ! 4: XNORcc_R	xnorcc 	%r4, %r14, %r27
thr3_nuke_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_25), 16, 16)) -> intp(1, 2, 1)
	.word 0xba99000d  ! 4: XORcc_R	xorcc 	%r4, %r13, %r29
thr3_resum_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25), 16, 16)) -> intp(1, 3, 1)
	.word 0xb530c00f  ! 4: SRL_R	srl 	%r3, %r15, %r26
	.word 0xb030800d  ! 4: ORN_R	orn 	%r2, %r13, %r24
	.word 0xaab22492  ! 4: ORNcc_I	orncc 	%r8, 0x0492, %r21
	.word 0xbcc1228a  ! 4: ADDCcc_I	addccc 	%r4, 0x028a, %r30
thr3_hw_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_26), 16, 16)) -> intp(1, 0, 1)
	.word 0xac31a5e4  ! 4: ORN_I	orn 	%r6, 0x05e4, %r22
	.word 0xab30d00f  ! 4: SRLX_R	srlx	%r3, %r15, %r21
	.word 0xb778c40a  ! 4: MOVR_R	move	%r3, %r10, %r27
	.word 0xb819ecbb  ! 4: XOR_I	xor 	%r7, 0x0cbb, %r28
	.word 0xaf30800a  ! 4: SRL_R	srl 	%r2, %r10, %r23
	.word 0xbc80800f  ! 4: ADDcc_R	addcc 	%r2, %r15, %r30
thr3_hw_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_27), 16, 16)) -> intp(0, 0, 1)
	.word 0xaeaa271b  ! 4: ANDNcc_I	andncc 	%r8, 0x071b, %r23
	.word 0xb001e015  ! 4: ADD_I	add 	%r7, 0x0015, %r24
	.word 0xaa18800f  ! 4: XOR_R	xor 	%r2, %r15, %r21
	.word 0xab297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r21
	.word 0xb80a000b  ! 4: AND_R	and 	%r8, %r11, %r28
	.word 0xad31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r22
	.word 0xac01a4f2  ! 4: ADD_I	add 	%r6, 0x04f2, %r22
thr3_hw_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_28), 16, 16)) -> intp(0, 0, 1)
	.word 0xb430c00e  ! 4: ORN_R	orn 	%r3, %r14, %r26
	.word 0xa931f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r20
	.word 0xb841c00d  ! 4: ADDC_R	addc 	%r7, %r13, %r28
	.word 0xba41000c  ! 4: ADDC_R	addc 	%r4, %r12, %r29
	.word 0xb164180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbb64180f  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_29), 16, 16)) -> intp(0, 2, 1)
	.word 0xbd28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r30
	.word 0xb8a92d5b  ! 4: ANDNcc_I	andncc 	%r4, 0x0d5b, %r28
	.word 0xb32a100d  ! 4: SLLX_R	sllx	%r8, %r13, %r25
thr3_resum_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29), 16, 16)) -> intp(0, 3, 1)
	.word 0xac2965a9  ! 4: ANDN_I	andn 	%r5, 0x05a9, %r22
thr3_hw_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_30), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r29
	.word 0xb931400a  ! 4: SRL_R	srl 	%r5, %r10, %r28
	.word 0xb8196809  ! 4: XOR_I	xor 	%r5, 0x0809, %r28
	.word 0xba31a9cb  ! 4: ORN_I	orn 	%r6, 0x09cb, %r29
	.word 0xb72a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0xbc89800e  ! 4: ANDcc_R	andcc 	%r6, %r14, %r30
thr3_nuke_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_31), 16, 16)) -> intp(1, 2, 1)
	.word 0xae99c00f  ! 4: XORcc_R	xorcc 	%r7, %r15, %r23
	.word 0xbd39d00a  ! 4: SRAX_R	srax	%r7, %r10, %r30
	.word 0xbc01000f  ! 4: ADD_R	add 	%r4, %r15, %r30
	.word 0xb97a040d  ! 4: MOVR_R	move	%r8, %r13, %r28
	.word 0xbd78e401  ! 4: MOVR_I	move	%r3, 0xf, %r30
	.word 0xb739800f  ! 4: SRA_R	sra 	%r6, %r15, %r27
	.word 0xac0a29ae  ! 4: AND_I	and 	%r8, 0x09ae, %r22
thr3_resum_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31), 16, 16)) -> intp(1, 3, 1)
	.word 0xb628800e  ! 4: ANDN_R	andn 	%r2, %r14, %r27
	.word 0xaab8e1d0  ! 4: XNORcc_I	xnorcc 	%r3, 0x01d0, %r21
	.word 0xac00c00a  ! 4: ADD_R	add 	%r3, %r10, %r22
	.word 0xbc31268a  ! 4: ORN_I	orn 	%r4, 0x068a, %r30
thr3_nuke_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_32), 16, 16)) -> intp(0, 2, 1)
	.word 0xb492000b  ! 4: ORcc_R	orcc 	%r8, %r11, %r26
	.word 0xae89000d  ! 4: ANDcc_R	andcc 	%r4, %r13, %r23
thr3_resum_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4812d41  ! 4: ADDcc_I	addcc 	%r4, 0x0d41, %r26
	.word 0xb289c00f  ! 4: ANDcc_R	andcc 	%r7, %r15, %r25
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_33), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd79040e  ! 4: MOVR_R	move	%r4, %r14, %r30
thr3_resum_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_33), 16, 16)) -> intp(1, 3, 1)
	.word 0xbcba20d9  ! 4: XNORcc_I	xnorcc 	%r8, 0x00d9, %r30
	.word 0xbcb9e895  ! 4: XNORcc_I	xnorcc 	%r7, 0x0895, %r30
	.word 0xb610c00c  ! 4: OR_R	or 	%r3, %r12, %r27
	.word 0xb841400a  ! 4: ADDC_R	addc 	%r5, %r10, %r28
thr3_nuke_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_34), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf7a040a  ! 4: MOVR_R	move	%r8, %r10, %r23
	.word 0xba10a6ff  ! 4: OR_I	or 	%r2, 0x06ff, %r29
	.word 0xb0a96443  ! 4: ANDNcc_I	andncc 	%r5, 0x0443, %r24
thr3_resum_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_34), 16, 16)) -> intp(1, 3, 1)
	.word 0xa81920e1  ! 4: XOR_I	xor 	%r4, 0x00e1, %r20
	.word 0xae8968ee  ! 4: ANDcc_I	andcc 	%r5, 0x08ee, %r23
	.word 0xaf323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r23
	.word 0xb431c00d  ! 4: ORN_R	orn 	%r7, %r13, %r26
thr3_nuke_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_35), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8192e43  ! 4: XOR_I	xor 	%r4, 0x0e43, %r28
thr3_resum_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_35), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8b1c00a  ! 4: ORNcc_R	orncc 	%r7, %r10, %r28
	.word 0xbc81800f  ! 4: ADDcc_R	addcc 	%r6, %r15, %r30
thr3_nuke_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_36), 16, 16)) -> intp(0, 2, 1)
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa00ad55  ! 4: ADD_I	add 	%r2, 0x0d55, %r21
	.word 0xb8a8a0e2  ! 4: ANDNcc_I	andncc 	%r2, 0x00e2, %r28
thr3_resum_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_36), 16, 16)) -> intp(0, 3, 1)
	.word 0xb779440e  ! 4: MOVR_R	move	%r5, %r14, %r27
	.word 0xa899c00a  ! 4: XORcc_R	xorcc 	%r7, %r10, %r20
	.word 0xad792401  ! 4: MOVR_I	move	%r4, 0xa, %r22
thr3_nuke_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_37), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8122179  ! 4: OR_I	or 	%r8, 0x0179, %r28
	.word 0xbc19a6f9  ! 4: XOR_I	xor 	%r6, 0x06f9, %r30
	.word 0xb929900b  ! 4: SLLX_R	sllx	%r6, %r11, %r28
	.word 0xab29f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r21
	.word 0xae2a000a  ! 4: ANDN_R	andn 	%r8, %r10, %r23
	.word 0xad29c00b  ! 4: SLL_R	sll 	%r7, %r11, %r22
	.word 0xba292b36  ! 4: ANDN_I	andn 	%r4, 0x0b36, %r29
thr3_resum_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37), 16, 16)) -> intp(0, 3, 1)
	.word 0xb132000d  ! 4: SRL_R	srl 	%r8, %r13, %r24
thr3_hw_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_38), 16, 16)) -> intp(0, 0, 1)
	.word 0xb698c00e  ! 4: XORcc_R	xorcc 	%r3, %r14, %r27
	.word 0xbb31800c  ! 4: SRL_R	srl 	%r6, %r12, %r29
	.word 0xb000800e  ! 4: ADD_R	add 	%r2, %r14, %r24
	.word 0xbb79840f  ! 4: MOVR_R	move	%r6, %r15, %r29
	.word 0xb281e497  ! 4: ADDcc_I	addcc 	%r7, 0x0497, %r25
	.word 0xba31400e  ! 4: ORN_R	orn 	%r5, %r14, %r29
thr3_hw_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_39), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb2b0efc8  ! 4: ORNcc_I	orncc 	%r3, 0x0fc8, %r25
	.word 0xb690800a  ! 4: ORcc_R	orcc 	%r2, %r10, %r27
	.word 0xac42000f  ! 4: ADDC_R	addc 	%r8, %r15, %r22
	.word 0xb779440f  ! 4: MOVR_R	move	%r5, %r15, %r27
	.word 0xb428800a  ! 4: ANDN_R	andn 	%r2, %r10, %r26
	.word 0xb728e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r27
thr3_hw_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_40), 16, 16)) -> intp(1, 0, 1)
	.word 0xae81400f  ! 4: ADDcc_R	addcc 	%r5, %r15, %r23
	.word 0xa930b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r20
	.word 0xb979840a  ! 4: MOVR_R	move	%r6, %r10, %r28
	.word 0xa8b8e7f2  ! 4: XNORcc_I	xnorcc 	%r3, 0x07f2, %r20
	.word 0xb088c00a  ! 4: ANDcc_R	andcc 	%r3, %r10, %r24
	.word 0xbc38e7e5  ! 4: XNOR_I	xnor 	%r3, 0x07e5, %r30
thr3_hw_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_41), 16, 16)) -> intp(1, 0, 1)
	.word 0xb811c00b  ! 4: OR_R	or 	%r7, %r11, %r28
	.word 0xb539900a  ! 4: SRAX_R	srax	%r6, %r10, %r26
	.word 0xaea9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r23
	.word 0xb0a9a0be  ! 4: ANDNcc_I	andncc 	%r6, 0x00be, %r24
	.word 0xbc41c00a  ! 4: ADDC_R	addc 	%r7, %r10, %r30
	.word 0xab78c40d  ! 4: MOVR_R	move	%r3, %r13, %r21
	.word 0xb2c1400b  ! 4: ADDCcc_R	addccc 	%r5, %r11, %r25
thr3_nuke_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_42), 16, 16)) -> intp(1, 2, 1)
	.word 0xb888ed1c  ! 4: ANDcc_I	andcc 	%r3, 0x0d1c, %r28
	.word 0xb130900e  ! 4: SRLX_R	srlx	%r2, %r14, %r24
	.word 0xad293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r22
	.word 0xb291800b  ! 4: ORcc_R	orcc 	%r6, %r11, %r25
	.word 0xaf31500a  ! 4: SRLX_R	srlx	%r5, %r10, %r23
thr3_resum_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_42), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2a9400e  ! 4: ANDNcc_R	andncc 	%r5, %r14, %r25
	.word 0xb681257d  ! 4: ADDcc_I	addcc 	%r4, 0x057d, %r27
	.word 0xaf2a000c  ! 4: SLL_R	sll 	%r8, %r12, %r23
thr3_nuke_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_43), 16, 16)) -> intp(0, 2, 1)
	.word 0xa931900d  ! 4: SRLX_R	srlx	%r6, %r13, %r20
	.word 0xb42969ed  ! 4: ANDN_I	andn 	%r5, 0x09ed, %r26
	.word 0xb219800c  ! 4: XOR_R	xor 	%r6, %r12, %r25
	.word 0xb4c164f7  ! 4: ADDCcc_I	addccc 	%r5, 0x04f7, %r26
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbc40c00f  ! 4: ADDC_R	addc 	%r3, %r15, %r30
thr3_resum_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43), 16, 16)) -> intp(0, 3, 1)
	.word 0xac91e436  ! 4: ORcc_I	orcc 	%r7, 0x0436, %r22
	.word 0xb8c121ab  ! 4: ADDCcc_I	addccc 	%r4, 0x01ab, %r28
thr3_nuke_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_44), 16, 16)) -> intp(0, 2, 1)
	.word 0xac416529  ! 4: ADDC_I	addc 	%r5, 0x0529, %r22
	.word 0xb738900b  ! 4: SRAX_R	srax	%r2, %r11, %r27
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xae40c00c  ! 4: ADDC_R	addc 	%r3, %r12, %r23
	.word 0xa8316a8d  ! 4: ORN_I	orn 	%r5, 0x0a8d, %r20
thr3_resum_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_44), 16, 16)) -> intp(0, 3, 1)
	.word 0xb739800c  ! 4: SRA_R	sra 	%r6, %r12, %r27
thr3_hw_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_45), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc98c00c  ! 4: XORcc_R	xorcc 	%r3, %r12, %r30
	.word 0xb8c1400a  ! 4: ADDCcc_R	addccc 	%r5, %r10, %r28
	.word 0xaa98800b  ! 4: XORcc_R	xorcc 	%r2, %r11, %r21
	.word 0xac2962b4  ! 4: ANDN_I	andn 	%r5, 0x02b4, %r22
	.word 0xa809800a  ! 4: AND_R	and 	%r6, %r10, %r20
	.word 0xb6922af0  ! 4: ORcc_I	orcc 	%r8, 0x0af0, %r27
	.word 0xaa4160c2  ! 4: ADDC_I	addc 	%r5, 0x00c2, %r21
thr3_hw_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_46), 16, 16)) -> intp(0, 0, 1)
	.word 0xa839800d  ! 4: XNOR_R	xnor 	%r6, %r13, %r20
	.word 0xa928b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r20
	.word 0xbc91c00c  ! 4: ORcc_R	orcc 	%r7, %r12, %r30
	.word 0xb979440b  ! 4: MOVR_R	move	%r5, %r11, %r28
	.word 0xbd292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r30
	.word 0xaec0aa3c  ! 4: ADDCcc_I	addccc 	%r2, 0x0a3c, %r23
thr3_hw_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_47), 16, 16)) -> intp(1, 0, 1)
	.word 0xbab0a787  ! 4: ORNcc_I	orncc 	%r2, 0x0787, %r29
	.word 0xb2b8aeb1  ! 4: XNORcc_I	xnorcc 	%r2, 0x0eb1, %r25
	.word 0xb20a2d09  ! 4: AND_I	and 	%r8, 0x0d09, %r25
	.word 0xb728a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r27
	.word 0xae9a257e  ! 4: XORcc_I	xorcc 	%r8, 0x057e, %r23
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbca9ecc1  ! 4: ANDNcc_I	andncc 	%r7, 0x0cc1, %r30
thr3_nuke_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_48), 16, 16)) -> intp(1, 2, 1)
	.word 0xa840c00e  ! 4: ADDC_R	addc 	%r3, %r14, %r20
	.word 0xbc81800e  ! 4: ADDcc_R	addcc 	%r6, %r14, %r30
	.word 0xa81227b9  ! 4: OR_I	or 	%r8, 0x07b9, %r20
	.word 0xba916442  ! 4: ORcc_I	orcc 	%r5, 0x0442, %r29
	.word 0xa899000c  ! 4: XORcc_R	xorcc 	%r4, %r12, %r20
	.word 0xb579c40d  ! 4: MOVR_R	move	%r7, %r13, %r26
	.word 0xbab0800b  ! 4: ORNcc_R	orncc 	%r2, %r11, %r29
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r23
thr3_nuke_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_49), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2392c96  ! 4: XNOR_I	xnor 	%r4, 0x0c96, %r25
	.word 0xb129c00f  ! 4: SLL_R	sll 	%r7, %r15, %r24
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xac0a2de1  ! 4: AND_I	and 	%r8, 0x0de1, %r22
	.word 0xbb38900d  ! 4: SRAX_R	srax	%r2, %r13, %r29
	.word 0xba1a000b  ! 4: XOR_R	xor 	%r8, %r11, %r29
thr3_resum_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_49), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6116b4b  ! 4: OR_I	or 	%r5, 0x0b4b, %r27
thr3_nuke_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_50), 16, 16)) -> intp(0, 2, 1)
	.word 0xaeb1ef44  ! 4: ORNcc_I	orncc 	%r7, 0x0f44, %r23
	.word 0xb491278e  ! 4: ORcc_I	orcc 	%r4, 0x078e, %r26
	.word 0xb779e401  ! 4: MOVR_I	move	%r7, 0xffffff8e, %r27
thr3_resum_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_50), 16, 16)) -> intp(0, 3, 1)
	.word 0xacb1400e  ! 4: ORNcc_R	orncc 	%r5, %r14, %r22
thr3_nuke_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_51), 16, 16)) -> intp(1, 2, 1)
	.word 0xae12000d  ! 4: OR_R	or 	%r8, %r13, %r23
	.word 0xbc00c00b  ! 4: ADD_R	add 	%r3, %r11, %r30
	.word 0xb492282a  ! 4: ORcc_I	orcc 	%r8, 0x082a, %r26
	.word 0xbcb967cb  ! 4: XNORcc_I	xnorcc 	%r5, 0x07cb, %r30
thr3_resum_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_51), 16, 16)) -> intp(1, 3, 1)
	.word 0xbac22249  ! 4: ADDCcc_I	addccc 	%r8, 0x0249, %r29
	.word 0xaca92a5d  ! 4: ANDNcc_I	andncc 	%r4, 0x0a5d, %r22
	.word 0xbaa8c00d  ! 4: ANDNcc_R	andncc 	%r3, %r13, %r29
	.word 0xbc19aa2e  ! 4: XOR_I	xor 	%r6, 0x0a2e, %r30
thr3_nuke_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_52), 16, 16)) -> intp(0, 2, 1)
	.word 0xbcb1c00e  ! 4: ORNcc_R	orncc 	%r7, %r14, %r30
	.word 0xac9220b2  ! 4: ORcc_I	orcc 	%r8, 0x00b2, %r22
	.word 0xae11800f  ! 4: OR_R	or 	%r6, %r15, %r23
	.word 0xb8b2000e  ! 4: ORNcc_R	orncc 	%r8, %r14, %r28
thr3_resum_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52), 16, 16)) -> intp(0, 3, 1)
	.word 0xba422590  ! 4: ADDC_I	addc 	%r8, 0x0590, %r29
	.word 0xb431ed25  ! 4: ORN_I	orn 	%r7, 0x0d25, %r26
	.word 0xab32100e  ! 4: SRLX_R	srlx	%r8, %r14, %r21
	.word 0xaa01c00d  ! 4: ADD_R	add 	%r7, %r13, %r21
thr3_nuke_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_53), 16, 16)) -> intp(0, 2, 1)
	.word 0xac91ae17  ! 4: ORcc_I	orcc 	%r6, 0x0e17, %r22
thr3_resum_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_53), 16, 16)) -> intp(0, 3, 1)
	.word 0xb4b2000c  ! 4: ORNcc_R	orncc 	%r8, %r12, %r26
	.word 0xbd322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0xb1392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r24
thr3_hw_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_54), 16, 16)) -> intp(0, 0, 1)
	.word 0xaab8800e  ! 4: XNORcc_R	xnorcc 	%r2, %r14, %r21
	.word 0xb218800e  ! 4: XOR_R	xor 	%r2, %r14, %r25
	.word 0xbc28aada  ! 4: ANDN_I	andn 	%r2, 0x0ada, %r30
	.word 0xa938e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r20
	.word 0xa809aa1c  ! 4: AND_I	and 	%r6, 0x0a1c, %r20
	.word 0xb4c0c00e  ! 4: ADDCcc_R	addccc 	%r3, %r14, %r26
thr3_nuke_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_55), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd29400c  ! 4: SLL_R	sll 	%r5, %r12, %r30
	.word 0xaa81e76e  ! 4: ADDcc_I	addcc 	%r7, 0x076e, %r21
	.word 0xb629400f  ! 4: ANDN_R	andn 	%r5, %r15, %r27
	.word 0xab39400e  ! 4: SRA_R	sra 	%r5, %r14, %r21
thr3_resum_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_55), 16, 16)) -> intp(1, 3, 1)
	.word 0xb441ac5f  ! 4: ADDC_I	addc 	%r6, 0x0c5f, %r26
	.word 0xad79a401  ! 4: MOVR_I	move	%r6, 0xc5f, %r22
thr3_nuke_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_56), 16, 16)) -> intp(1, 2, 1)
	.word 0xaab1800c  ! 4: ORNcc_R	orncc 	%r6, %r12, %r21
	.word 0xa8812d9f  ! 4: ADDcc_I	addcc 	%r4, 0x0d9f, %r20
	.word 0xb364180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb811c00a  ! 4: OR_R	or 	%r7, %r10, %r28
	.word 0xba012d11  ! 4: ADD_I	add 	%r4, 0x0d11, %r29
	.word 0xba91800a  ! 4: ORcc_R	orcc 	%r6, %r10, %r29
thr3_resum_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56), 16, 16)) -> intp(1, 3, 1)
	.word 0xac89c00e  ! 4: ANDcc_R	andcc 	%r7, %r14, %r22
	.word 0xba80800f  ! 4: ADDcc_R	addcc 	%r2, %r15, %r29
thr3_hw_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_57), 16, 16)) -> intp(0, 0, 1)
	.word 0xba80e948  ! 4: ADDcc_I	addcc 	%r3, 0x0948, %r29
	.word 0xb801800d  ! 4: ADD_R	add 	%r6, %r13, %r28
	.word 0xbcb1000e  ! 4: ORNcc_R	orncc 	%r4, %r14, %r30
	.word 0xb210c00b  ! 4: OR_R	or 	%r3, %r11, %r25
	.word 0xab38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r21
	.word 0xa929d00b  ! 4: SLLX_R	sllx	%r7, %r11, %r20
thr3_hw_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_58), 16, 16)) -> intp(0, 0, 1)
	.word 0xb539c00f  ! 4: SRA_R	sra 	%r7, %r15, %r26
	.word 0xbc00c00e  ! 4: ADD_R	add 	%r3, %r14, %r30
	.word 0xb000ea18  ! 4: ADD_I	add 	%r3, 0x0a18, %r24
	.word 0xae89ec8a  ! 4: ANDcc_I	andcc 	%r7, 0x0c8a, %r23
	.word 0xbc2966b0  ! 4: ANDN_I	andn 	%r5, 0x06b0, %r30
	.word 0xb080afb2  ! 4: ADDcc_I	addcc 	%r2, 0x0fb2, %r24
	.word 0xb810e93b  ! 4: OR_I	or 	%r3, 0x093b, %r28
thr3_nuke_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_59), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf39800c  ! 4: SRA_R	sra 	%r6, %r12, %r23
	.word 0xb830800d  ! 4: ORN_R	orn 	%r2, %r13, %r28
	.word 0xb732000b  ! 4: SRL_R	srl 	%r8, %r11, %r27
	.word 0xacb1a53d  ! 4: ORNcc_I	orncc 	%r6, 0x053d, %r22
thr3_resum_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_59), 16, 16)) -> intp(0, 3, 1)
	.word 0xb3396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r25
	.word 0xaf29100d  ! 4: SLLX_R	sllx	%r4, %r13, %r23
	.word 0xbd79e401  ! 4: MOVR_I	move	%r7, 0xd, %r30
thr3_nuke_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_60), 16, 16)) -> intp(0, 2, 1)
	.word 0xa939a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r20
thr3_resum_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_60), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r29
	.word 0xb21a000c  ! 4: XOR_R	xor 	%r8, %r12, %r25
thr3_hw_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_61), 16, 16)) -> intp(1, 0, 1)
	.word 0xbd39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r30
	.word 0xaa08ed92  ! 4: AND_I	and 	%r3, 0x0d92, %r21
	.word 0xaab9c00f  ! 4: XNORcc_R	xnorcc 	%r7, %r15, %r21
	.word 0xac30c00e  ! 4: ORN_R	orn 	%r3, %r14, %r22
	.word 0xac11000b  ! 4: OR_R	or 	%r4, %r11, %r22
	.word 0xbb3a000e  ! 4: SRA_R	sra 	%r8, %r14, %r29
thr3_nuke_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_62), 16, 16)) -> intp(1, 2, 1)
	.word 0xa892000a  ! 4: ORcc_R	orcc 	%r8, %r10, %r20
	.word 0xbca9ef30  ! 4: ANDNcc_I	andncc 	%r7, 0x0f30, %r30
	.word 0xbd31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r30
	.word 0xbc09800f  ! 4: AND_R	and 	%r6, %r15, %r30
	.word 0xa828e94c  ! 4: ANDN_I	andn 	%r3, 0x094c, %r20
	.word 0xb731c00a  ! 4: SRL_R	srl 	%r7, %r10, %r27
thr3_resum_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62), 16, 16)) -> intp(1, 3, 1)
	.word 0xac392177  ! 4: XNOR_I	xnor 	%r4, 0x0177, %r22
	.word 0xb329c00e  ! 4: SLL_R	sll 	%r7, %r14, %r25
	.word 0xb8912b5c  ! 4: ORcc_I	orcc 	%r4, 0x0b5c, %r28
thr3_nuke_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_63), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa29aafc  ! 4: ANDN_I	andn 	%r6, 0x0afc, %r21
	.word 0xbb31d00b  ! 4: SRLX_R	srlx	%r7, %r11, %r29
	.word 0xb4912fd0  ! 4: ORcc_I	orcc 	%r4, 0x0fd0, %r26
	.word 0xb6022f7a  ! 4: ADD_I	add 	%r8, 0x0f7a, %r27
	.word 0xb6816474  ! 4: ADDcc_I	addcc 	%r5, 0x0474, %r27
	.word 0xb529800c  ! 4: SLL_R	sll 	%r6, %r12, %r26
	.word 0xb208aac4  ! 4: AND_I	and 	%r2, 0x0ac4, %r25
thr3_resum_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_63), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2012ed2  ! 4: ADD_I	add 	%r4, 0x0ed2, %r25
	.word 0xb164180e  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_64), 16, 16)) -> intp(0, 0, 1)
	.word 0xaeb1efa7  ! 4: ORNcc_I	orncc 	%r7, 0x0fa7, %r23
	.word 0xb4b2000b  ! 4: ORNcc_R	orncc 	%r8, %r11, %r26
	.word 0xb539d00b  ! 4: SRAX_R	srax	%r7, %r11, %r26
	.word 0xb89a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r28
	.word 0xad30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r22
	.word 0xac28800f  ! 4: ANDN_R	andn 	%r2, %r15, %r22
	.word 0xb564180d  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_65), 16, 16)) -> intp(0, 0, 1)
	.word 0xb239800e  ! 4: XNOR_R	xnor 	%r6, %r14, %r25
	.word 0xb840800c  ! 4: ADDC_R	addc 	%r2, %r12, %r28
	.word 0xaa11c00c  ! 4: OR_R	or 	%r7, %r12, %r21
	.word 0xad30900f  ! 4: SRLX_R	srlx	%r2, %r15, %r22
	.word 0xbcc0800b  ! 4: ADDCcc_R	addccc 	%r2, %r11, %r30
	.word 0xb209400b  ! 4: AND_R	and 	%r5, %r11, %r25
	.word 0xac02000b  ! 4: ADD_R	add 	%r8, %r11, %r22
thr3_hw_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_66), 16, 16)) -> intp(0, 0, 1)
	.word 0xb68a2a16  ! 4: ANDcc_I	andcc 	%r8, 0x0a16, %r27
	.word 0xb728b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r27
	.word 0xb228e6fe  ! 4: ANDN_I	andn 	%r3, 0x06fe, %r25
	.word 0xb6ba2afb  ! 4: XNORcc_I	xnorcc 	%r8, 0x0afb, %r27
	.word 0xba11800c  ! 4: OR_R	or 	%r6, %r12, %r29
	.word 0xaeb9800d  ! 4: XNORcc_R	xnorcc 	%r6, %r13, %r23
	.word 0xb6812404  ! 4: ADDcc_I	addcc 	%r4, 0x0404, %r27
thr3_hw_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_67), 16, 16)) -> intp(1, 0, 1)
	.word 0xb630800a  ! 4: ORN_R	orn 	%r2, %r10, %r27
	.word 0xae80e7f8  ! 4: ADDcc_I	addcc 	%r3, 0x07f8, %r23
	.word 0xbac12891  ! 4: ADDCcc_I	addccc 	%r4, 0x0891, %r29
	.word 0xaac16113  ! 4: ADDCcc_I	addccc 	%r5, 0x0113, %r21
	.word 0xa964180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb0412eca  ! 4: ADDC_I	addc 	%r4, 0x0eca, %r24
thr3_hw_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_68), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb79840e  ! 4: MOVR_R	move	%r6, %r14, %r29
	.word 0xb828e8fd  ! 4: ANDN_I	andn 	%r3, 0x08fd, %r28
	.word 0xbcc1ea9b  ! 4: ADDCcc_I	addccc 	%r7, 0x0a9b, %r30
	.word 0xbd297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r30
	.word 0xb8a9c00a  ! 4: ANDNcc_R	andncc 	%r7, %r10, %r28
	.word 0xb29a2614  ! 4: XORcc_I	xorcc 	%r8, 0x0614, %r25
thr3_nuke_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_69), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6b9400b  ! 4: XNORcc_R	xnorcc 	%r5, %r11, %r27
	.word 0xb2b0ee07  ! 4: ORNcc_I	orncc 	%r3, 0x0e07, %r25
	.word 0xbc88800a  ! 4: ANDcc_R	andcc 	%r2, %r10, %r30
	.word 0xb692000f  ! 4: ORcc_R	orcc 	%r8, %r15, %r27
	.word 0xab29500a  ! 4: SLLX_R	sllx	%r5, %r10, %r21
thr3_resum_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69), 16, 16)) -> intp(0, 3, 1)
	.word 0xab29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r21
thr3_nuke_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_70), 16, 16)) -> intp(0, 2, 1)
	.word 0xac41400c  ! 4: ADDC_R	addc 	%r5, %r12, %r22
	.word 0xb364180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb629a780  ! 4: ANDN_I	andn 	%r6, 0x0780, %r27
	.word 0xac08e56c  ! 4: AND_I	and 	%r3, 0x056c, %r22
thr3_resum_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_70), 16, 16)) -> intp(0, 3, 1)
	.word 0xaac0c00c  ! 4: ADDCcc_R	addccc 	%r3, %r12, %r21
thr3_hw_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_71), 16, 16)) -> intp(1, 0, 1)
	.word 0xb69a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r27
	.word 0xac81c00b  ! 4: ADDcc_R	addcc 	%r7, %r11, %r22
	.word 0xb539500e  ! 4: SRAX_R	srax	%r5, %r14, %r26
	.word 0xb638800d  ! 4: XNOR_R	xnor 	%r2, %r13, %r27
	.word 0xaa31ae30  ! 4: ORN_I	orn 	%r6, 0x0e30, %r21
	.word 0xae10e500  ! 4: OR_I	or 	%r3, 0x0500, %r23
	.word 0xa808e7b1  ! 4: AND_I	and 	%r3, 0x07b1, %r20
thr3_hw_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_72), 16, 16)) -> intp(0, 0, 1)
	.word 0xaea9a134  ! 4: ANDNcc_I	andncc 	%r6, 0x0134, %r23
	.word 0xb129900e  ! 4: SLLX_R	sllx	%r6, %r14, %r24
	.word 0xb83a000a  ! 4: XNOR_R	xnor 	%r8, %r10, %r28
	.word 0xbc11000a  ! 4: OR_R	or 	%r4, %r10, %r30
	.word 0xaa2a27af  ! 4: ANDN_I	andn 	%r8, 0x07af, %r21
	.word 0xaa81a19c  ! 4: ADDcc_I	addcc 	%r6, 0x019c, %r21
thr3_hw_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_73), 16, 16)) -> intp(0, 0, 1)
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb028acc3  ! 4: ANDN_I	andn 	%r2, 0x0cc3, %r24
	.word 0xae01400f  ! 4: ADD_R	add 	%r5, %r15, %r23
	.word 0xaa996e83  ! 4: XORcc_I	xorcc 	%r5, 0x0e83, %r21
	.word 0xb839800b  ! 4: XNOR_R	xnor 	%r6, %r11, %r28
	.word 0xaec1c00e  ! 4: ADDCcc_R	addccc 	%r7, %r14, %r23
thr3_nuke_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_74), 16, 16)) -> intp(1, 2, 1)
	.word 0xb529e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r26
	.word 0xaa00eef4  ! 4: ADD_I	add 	%r3, 0x0ef4, %r21
thr3_resum_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_74), 16, 16)) -> intp(1, 3, 1)
	.word 0xb001637d  ! 4: ADD_I	add 	%r5, 0x037d, %r24
thr3_nuke_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_75), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa92000e  ! 4: ORcc_R	orcc 	%r8, %r14, %r21
	.word 0xb809000a  ! 4: AND_R	and 	%r4, %r10, %r28
	.word 0xac90a103  ! 4: ORcc_I	orcc 	%r2, 0x0103, %r22
	.word 0xbca9a387  ! 4: ANDNcc_I	andncc 	%r6, 0x0387, %r30
	.word 0xbca96ff2  ! 4: ANDNcc_I	andncc 	%r5, 0x0ff2, %r30
thr3_resum_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_75), 16, 16)) -> intp(0, 3, 1)
	.word 0xac19ad26  ! 4: XOR_I	xor 	%r6, 0x0d26, %r22
	.word 0xb401c00e  ! 4: ADD_R	add 	%r7, %r14, %r26
	.word 0xb081aefe  ! 4: ADDcc_I	addcc 	%r6, 0x0efe, %r24
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_76), 16, 16)) -> intp(0, 2, 1)
	.word 0xba112785  ! 4: OR_I	or 	%r4, 0x0785, %r29
	.word 0xb2b9c00e  ! 4: XNORcc_R	xnorcc 	%r7, %r14, %r25
	.word 0xb8b12470  ! 4: ORNcc_I	orncc 	%r4, 0x0470, %r28
	.word 0xae292616  ! 4: ANDN_I	andn 	%r4, 0x0616, %r23
	.word 0xb339d00a  ! 4: SRAX_R	srax	%r7, %r10, %r25
thr3_resum_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_76), 16, 16)) -> intp(0, 3, 1)
	.word 0xb731d00a  ! 4: SRLX_R	srlx	%r7, %r10, %r27
	.word 0xab28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r21
	.word 0xba41ecde  ! 4: ADDC_I	addc 	%r7, 0x0cde, %r29
thr3_nuke_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_77), 16, 16)) -> intp(1, 2, 1)
	.word 0xb008af3f  ! 4: AND_I	and 	%r2, 0x0f3f, %r24
	.word 0xb939800a  ! 4: SRA_R	sra 	%r6, %r10, %r28
	.word 0xa8c1e13c  ! 4: ADDCcc_I	addccc 	%r7, 0x013c, %r20
	.word 0xa811664a  ! 4: OR_I	or 	%r5, 0x064a, %r20
	.word 0xa964180d  ! 4: MOVcc_R	<illegal instruction>
thr3_resum_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_77), 16, 16)) -> intp(1, 3, 1)
	.word 0xad293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r22
	.word 0xa818c00a  ! 4: XOR_R	xor 	%r3, %r10, %r20
	.word 0xb680800b  ! 4: ADDcc_R	addcc 	%r2, %r11, %r27
thr3_hw_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_78), 16, 16)) -> intp(0, 0, 1)
	.word 0xa841800e  ! 4: ADDC_R	addc 	%r6, %r14, %r20
	.word 0xbc31800d  ! 4: ORN_R	orn 	%r6, %r13, %r30
	.word 0xb132000b  ! 4: SRL_R	srl 	%r8, %r11, %r24
	.word 0xb889400c  ! 4: ANDcc_R	andcc 	%r5, %r12, %r28
	.word 0xa810800a  ! 4: OR_R	or 	%r2, %r10, %r20
	.word 0xa811800f  ! 4: OR_R	or 	%r6, %r15, %r20
	.word 0xaa396337  ! 4: XNOR_I	xnor 	%r5, 0x0337, %r21
thr3_nuke_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_79), 16, 16)) -> intp(1, 2, 1)
	.word 0xb81121f2  ! 4: OR_I	or 	%r4, 0x01f2, %r28
	.word 0xb0a9000b  ! 4: ANDNcc_R	andncc 	%r4, %r11, %r24
	.word 0xb129500d  ! 4: SLLX_R	sllx	%r5, %r13, %r24
thr3_resum_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_79), 16, 16)) -> intp(1, 3, 1)
	.word 0xb411ad1d  ! 4: OR_I	or 	%r6, 0x0d1d, %r26
	.word 0xb9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r28
	.word 0xba296b85  ! 4: ANDN_I	andn 	%r5, 0x0b85, %r29
thr3_hw_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_80), 16, 16)) -> intp(1, 0, 1)
	.word 0xb139900a  ! 4: SRAX_R	srax	%r6, %r10, %r24
	.word 0xb830800b  ! 4: ORN_R	orn 	%r2, %r11, %r28
	.word 0xb480c00a  ! 4: ADDcc_R	addcc 	%r3, %r10, %r26
	.word 0xbd29100b  ! 4: SLLX_R	sllx	%r4, %r11, %r30
	.word 0xb031000a  ! 4: ORN_R	orn 	%r4, %r10, %r24
	.word 0xb528b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r26
thr3_nuke_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_81), 16, 16)) -> intp(0, 2, 1)
	.word 0xb53a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r26
	.word 0xb331e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r25
	.word 0xb931a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r28
	.word 0xb609000c  ! 4: AND_R	and 	%r4, %r12, %r27
	.word 0xaa91a67b  ! 4: ORcc_I	orcc 	%r6, 0x067b, %r21
	.word 0xb839400b  ! 4: XNOR_R	xnor 	%r5, %r11, %r28
thr3_resum_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc322c8a  ! 4: ORN_I	orn 	%r8, 0x0c8a, %r30
	.word 0xb7293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r27
	.word 0xbb39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r29
	.word 0xb838800b  ! 4: XNOR_R	xnor 	%r2, %r11, %r28
thr3_nuke_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_82), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8192bab  ! 4: XOR_I	xor 	%r4, 0x0bab, %r20
	.word 0xb139000f  ! 4: SRA_R	sra 	%r4, %r15, %r24
	.word 0xb139100a  ! 4: SRAX_R	srax	%r4, %r10, %r24
thr3_resum_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_82), 16, 16)) -> intp(0, 3, 1)
	.word 0xb638800c  ! 4: XNOR_R	xnor 	%r2, %r12, %r27
	.word 0xab392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r21
	.word 0xb8c0aef9  ! 4: ADDCcc_I	addccc 	%r2, 0x0ef9, %r28
	.word 0xab28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r21
thr3_nuke_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_83), 16, 16)) -> intp(1, 2, 1)
	.word 0xb331100b  ! 4: SRLX_R	srlx	%r4, %r11, %r25
	.word 0xae092630  ! 4: AND_I	and 	%r4, 0x0630, %r23
	.word 0xac19400c  ! 4: XOR_R	xor 	%r5, %r12, %r22
thr3_resum_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc09e8cc  ! 4: AND_I	and 	%r7, 0x08cc, %r30
	.word 0xac39aa85  ! 4: XNOR_I	xnor 	%r6, 0x0a85, %r22
	.word 0xaa422702  ! 4: ADDC_I	addc 	%r8, 0x0702, %r21
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_84), 16, 16)) -> intp(1, 2, 1)
	.word 0xb0b9e823  ! 4: XNORcc_I	xnorcc 	%r7, 0x0823, %r24
	.word 0xb132100f  ! 4: SRLX_R	srlx	%r8, %r15, %r24
	.word 0xacb9400b  ! 4: XNORcc_R	xnorcc 	%r5, %r11, %r22
	.word 0xba092566  ! 4: AND_I	and 	%r4, 0x0566, %r29
thr3_resum_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_84), 16, 16)) -> intp(1, 3, 1)
	.word 0xb211800e  ! 4: OR_R	or 	%r6, %r14, %r25
	.word 0xaa91c00b  ! 4: ORcc_R	orcc 	%r7, %r11, %r21
thr3_hw_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_85), 16, 16)) -> intp(0, 0, 1)
	.word 0xb41a21d1  ! 4: XOR_I	xor 	%r8, 0x01d1, %r26
	.word 0xba09ad4c  ! 4: AND_I	and 	%r6, 0x0d4c, %r29
	.word 0xac10800d  ! 4: OR_R	or 	%r2, %r13, %r22
	.word 0xad30a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r22
	.word 0xbd30d00c  ! 4: SRLX_R	srlx	%r3, %r12, %r30
	.word 0xaab12d3e  ! 4: ORNcc_I	orncc 	%r4, 0x0d3e, %r21
	.word 0xb778e401  ! 4: MOVR_I	move	%r3, 0xd3e, %r27
thr3_hw_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_86), 16, 16)) -> intp(1, 0, 1)
	.word 0xa811236a  ! 4: OR_I	or 	%r4, 0x036a, %r20
	.word 0xb292000f  ! 4: ORcc_R	orcc 	%r8, %r15, %r25
	.word 0xad2a000d  ! 4: SLL_R	sll 	%r8, %r13, %r22
	.word 0xa819800a  ! 4: XOR_R	xor 	%r6, %r10, %r20
	.word 0xac01000b  ! 4: ADD_R	add 	%r4, %r11, %r22
	.word 0xb698c00a  ! 4: XORcc_R	xorcc 	%r3, %r10, %r27
	.word 0xbc00a988  ! 4: ADD_I	add 	%r2, 0x0988, %r30
thr3_hw_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_87), 16, 16)) -> intp(0, 0, 1)
	.word 0xae8a2e54  ! 4: ANDcc_I	andcc 	%r8, 0x0e54, %r23
	.word 0xaa39e82f  ! 4: XNOR_I	xnor 	%r7, 0x082f, %r21
	.word 0xacb0800c  ! 4: ORNcc_R	orncc 	%r2, %r12, %r22
	.word 0xae29acf3  ! 4: ANDN_I	andn 	%r6, 0x0cf3, %r23
	.word 0xb288c00e  ! 4: ANDcc_R	andcc 	%r3, %r14, %r25
	.word 0xba29c00b  ! 4: ANDN_R	andn 	%r7, %r11, %r29
	.word 0xb209eef3  ! 4: AND_I	and 	%r7, 0x0ef3, %r25
thr3_hw_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_88), 16, 16)) -> intp(0, 0, 1)
	.word 0xaab9e379  ! 4: XNORcc_I	xnorcc 	%r7, 0x0379, %r21
	.word 0xb8b8800e  ! 4: XNORcc_R	xnorcc 	%r2, %r14, %r28
	.word 0xa929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r20
	.word 0xb4a8800a  ! 4: ANDNcc_R	andncc 	%r2, %r10, %r26
	.word 0xac29276b  ! 4: ANDN_I	andn 	%r4, 0x076b, %r22
	.word 0xb4b1ab1f  ! 4: ORNcc_I	orncc 	%r6, 0x0b1f, %r26
	.word 0xb882000e  ! 4: ADDcc_R	addcc 	%r8, %r14, %r28
thr3_nuke_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_89), 16, 16)) -> intp(1, 2, 1)
	.word 0xae19c00b  ! 4: XOR_R	xor 	%r7, %r11, %r23
	.word 0xae19a41d  ! 4: XOR_I	xor 	%r6, 0x041d, %r23
	.word 0xb939000e  ! 4: SRA_R	sra 	%r4, %r14, %r28
	.word 0xb6822275  ! 4: ADDcc_I	addcc 	%r8, 0x0275, %r27
	.word 0xbc40e8a9  ! 4: ADDC_I	addc 	%r3, 0x08a9, %r30
	.word 0xb8c0e68b  ! 4: ADDCcc_I	addccc 	%r3, 0x068b, %r28
thr3_resum_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_89), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0xae31c00c  ! 4: ORN_R	orn 	%r7, %r12, %r23
	.word 0xbcb0eb78  ! 4: ORNcc_I	orncc 	%r3, 0x0b78, %r30
thr3_nuke_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_90), 16, 16)) -> intp(0, 2, 1)
	.word 0xacb8a682  ! 4: XNORcc_I	xnorcc 	%r2, 0x0682, %r22
	.word 0xb811aaa3  ! 4: OR_I	or 	%r6, 0x0aa3, %r28
	.word 0xb419c00f  ! 4: XOR_R	xor 	%r7, %r15, %r26
	.word 0xad317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r22
	.word 0xb008800a  ! 4: AND_R	and 	%r2, %r10, %r24
	.word 0xbd28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r30
thr3_resum_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_90), 16, 16)) -> intp(0, 3, 1)
	.word 0xacb0c00d  ! 4: ORNcc_R	orncc 	%r3, %r13, %r22
	.word 0xbaa92197  ! 4: ANDNcc_I	andncc 	%r4, 0x0197, %r29
thr3_hw_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_91), 16, 16)) -> intp(1, 0, 1)
	.word 0xb930800c  ! 4: SRL_R	srl 	%r2, %r12, %r28
	.word 0xb211ee6e  ! 4: OR_I	or 	%r7, 0x0e6e, %r25
	.word 0xad312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r22
	.word 0xa939d00c  ! 4: SRAX_R	srax	%r7, %r12, %r20
	.word 0xb290a313  ! 4: ORcc_I	orcc 	%r2, 0x0313, %r25
	.word 0xae91af5c  ! 4: ORcc_I	orcc 	%r6, 0x0f5c, %r23
	.word 0xb979c40e  ! 4: MOVR_R	move	%r7, %r14, %r28
thr3_nuke_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_92), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0c22c37  ! 4: ADDCcc_I	addccc 	%r8, 0x0c37, %r24
	.word 0xaaa8ae86  ! 4: ANDNcc_I	andncc 	%r2, 0x0e86, %r21
thr3_resum_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa19aa35  ! 4: XOR_I	xor 	%r6, 0x0a35, %r21
	.word 0xb641637c  ! 4: ADDC_I	addc 	%r5, 0x037c, %r27
	.word 0xb218a9b8  ! 4: XOR_I	xor 	%r2, 0x09b8, %r25
	.word 0xa8316a05  ! 4: ORN_I	orn 	%r5, 0x0a05, %r20
thr3_nuke_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_93), 16, 16)) -> intp(1, 2, 1)
	.word 0xb379c40b  ! 4: MOVR_R	move	%r7, %r11, %r25
	.word 0xba9223bf  ! 4: ORcc_I	orcc 	%r8, 0x03bf, %r29
thr3_resum_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_93), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf31d00e  ! 4: SRLX_R	srlx	%r7, %r14, %r23
thr3_hw_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_94), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6a9800f  ! 4: ANDNcc_R	andncc 	%r6, %r15, %r27
	.word 0xbcb0e4ee  ! 4: ORNcc_I	orncc 	%r3, 0x04ee, %r30
	.word 0xae1964be  ! 4: XOR_I	xor 	%r5, 0x04be, %r23
	.word 0xbca9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r30
	.word 0xb488a5c6  ! 4: ANDcc_I	andcc 	%r2, 0x05c6, %r26
	.word 0xb3293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r25
	.word 0xb131500e  ! 4: SRLX_R	srlx	%r5, %r14, %r24
thr3_nuke_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_95), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc396705  ! 4: XNOR_I	xnor 	%r5, 0x0705, %r30
	.word 0xbc0a000c  ! 4: AND_R	and 	%r8, %r12, %r30
	.word 0xad39100c  ! 4: SRAX_R	srax	%r4, %r12, %r22
	.word 0xac81400e  ! 4: ADDcc_R	addcc 	%r5, %r14, %r22
	.word 0xac8965f3  ! 4: ANDcc_I	andcc 	%r5, 0x05f3, %r22
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xba41400f  ! 4: ADDC_R	addc 	%r5, %r15, %r29
thr3_resum_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_95), 16, 16)) -> intp(0, 3, 1)
	.word 0xa979440f  ! 4: MOVR_R	move	%r5, %r15, %r20
thr3_hw_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_96), 16, 16)) -> intp(1, 0, 1)
	.word 0xaeb929e4  ! 4: XNORcc_I	xnorcc 	%r4, 0x09e4, %r23
	.word 0xa809800c  ! 4: AND_R	and 	%r6, %r12, %r20
	.word 0xaa11a6db  ! 4: OR_I	or 	%r6, 0x06db, %r21
	.word 0xb130c00a  ! 4: SRL_R	srl 	%r3, %r10, %r24
	.word 0xba41400b  ! 4: ADDC_R	addc 	%r5, %r11, %r29
	.word 0xb3296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r25
thr3_nuke_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_97), 16, 16)) -> intp(1, 2, 1)
	.word 0xac02000d  ! 4: ADD_R	add 	%r8, %r13, %r22
	.word 0xb6ba000b  ! 4: XNORcc_R	xnorcc 	%r8, %r11, %r27
	.word 0xba32000a  ! 4: ORN_R	orn 	%r8, %r10, %r29
	.word 0xa8c227f1  ! 4: ADDCcc_I	addccc 	%r8, 0x07f1, %r20
	.word 0xb13a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r24
thr3_resum_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_97), 16, 16)) -> intp(1, 3, 1)
	.word 0xb62a2cec  ! 4: ANDN_I	andn 	%r8, 0x0cec, %r27
thr3_nuke_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_98), 16, 16)) -> intp(0, 2, 1)
	.word 0xb441ef0e  ! 4: ADDC_I	addc 	%r7, 0x0f0e, %r26
	.word 0xac08e3c2  ! 4: AND_I	and 	%r3, 0x03c2, %r22
	.word 0xaa9122ff  ! 4: ORcc_I	orcc 	%r4, 0x02ff, %r21
	.word 0xb681000a  ! 4: ADDcc_R	addcc 	%r4, %r10, %r27
thr3_resum_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98), 16, 16)) -> intp(0, 3, 1)
	.word 0xb339400b  ! 4: SRA_R	sra 	%r5, %r11, %r25
thr3_nuke_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_99), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc41c00b  ! 4: ADDC_R	addc 	%r7, %r11, %r30
	.word 0xaf2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r23
	.word 0xb618e024  ! 4: XOR_I	xor 	%r3, 0x0024, %r27
thr3_resum_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_99), 16, 16)) -> intp(0, 3, 1)
	.word 0xba112056  ! 4: OR_I	or 	%r4, 0x0056, %r29
	.word 0xb6b1000f  ! 4: ORNcc_R	orncc 	%r4, %r15, %r27
	.word 0xaf3a100e  ! 4: SRAX_R	srax	%r8, %r14, %r23
thr3_hw_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_100), 16, 16)) -> intp(0, 0, 1)
	.word 0xb009000e  ! 4: AND_R	and 	%r4, %r14, %r24
	.word 0xba18e44d  ! 4: XOR_I	xor 	%r3, 0x044d, %r29
	.word 0xba12000b  ! 4: OR_R	or 	%r8, %r11, %r29
	.word 0xbcb1400d  ! 4: ORNcc_R	orncc 	%r5, %r13, %r30
	.word 0xbb39000c  ! 4: SRA_R	sra 	%r4, %r12, %r29
	.word 0xb6912674  ! 4: ORcc_I	orcc 	%r4, 0x0674, %r27
thr3_nuke_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_101), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8a9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r20
thr3_resum_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_101), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa81abb2  ! 4: ADDcc_I	addcc 	%r6, 0x0bb2, %r21
	.word 0xbc89a2e2  ! 4: ANDcc_I	andcc 	%r6, 0x02e2, %r30
	.word 0xad64180d  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_102), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc11400f  ! 4: OR_R	or 	%r5, %r15, %r30
	.word 0xb6c1c00b  ! 4: ADDCcc_R	addccc 	%r7, %r11, %r27
	.word 0xb729100a  ! 4: SLLX_R	sllx	%r4, %r10, %r27
thr3_resum_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102), 16, 16)) -> intp(0, 3, 1)
	.word 0xb0016697  ! 4: ADD_I	add 	%r5, 0x0697, %r24
thr3_hw_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_103), 16, 16)) -> intp(1, 0, 1)
	.word 0xae00e5ed  ! 4: ADD_I	add 	%r3, 0x05ed, %r23
	.word 0xba3a2747  ! 4: XNOR_I	xnor 	%r8, 0x0747, %r29
	.word 0xac00eb8a  ! 4: ADD_I	add 	%r3, 0x0b8a, %r22
	.word 0xbcc1aaf5  ! 4: ADDCcc_I	addccc 	%r6, 0x0af5, %r30
	.word 0xb428c00e  ! 4: ANDN_R	andn 	%r3, %r14, %r26
	.word 0xb0b8a392  ! 4: XNORcc_I	xnorcc 	%r2, 0x0392, %r24
thr3_hw_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_104), 16, 16)) -> intp(0, 0, 1)
	.word 0xb932100f  ! 4: SRLX_R	srlx	%r8, %r15, %r28
	.word 0xb938c00d  ! 4: SRA_R	sra 	%r3, %r13, %r28
	.word 0xb68965dc  ! 4: ANDcc_I	andcc 	%r5, 0x05dc, %r27
	.word 0xaeb9e983  ! 4: XNORcc_I	xnorcc 	%r7, 0x0983, %r23
	.word 0xb564180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaf31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r23
	.word 0xae31224e  ! 4: ORN_I	orn 	%r4, 0x024e, %r23
thr3_hw_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_105), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2ba2cd6  ! 4: XNORcc_I	xnorcc 	%r8, 0x0cd6, %r25
	.word 0xb331100b  ! 4: SRLX_R	srlx	%r4, %r11, %r25
	.word 0xae81a99a  ! 4: ADDcc_I	addcc 	%r6, 0x099a, %r23
	.word 0xa830e9eb  ! 4: ORN_I	orn 	%r3, 0x09eb, %r20
	.word 0xb732100a  ! 4: SRLX_R	srlx	%r8, %r10, %r27
	.word 0xb764180a  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_106), 16, 16)) -> intp(0, 2, 1)
	.word 0xb801a3b2  ! 4: ADD_I	add 	%r6, 0x03b2, %r28
	.word 0xaa40a6c2  ! 4: ADDC_I	addc 	%r2, 0x06c2, %r21
	.word 0xac92000e  ! 4: ORcc_R	orcc 	%r8, %r14, %r22
	.word 0xbcc0ea0a  ! 4: ADDCcc_I	addccc 	%r3, 0x0a0a, %r30
thr3_resum_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_106), 16, 16)) -> intp(0, 3, 1)
	.word 0xac39000c  ! 4: XNOR_R	xnor 	%r4, %r12, %r22
	.word 0xb164180c  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_107), 16, 16)) -> intp(1, 2, 1)
	.word 0xb21a000c  ! 4: XOR_R	xor 	%r8, %r12, %r25
	.word 0xb231ad3c  ! 4: ORN_I	orn 	%r6, 0x0d3c, %r25
	.word 0xacba258d  ! 4: XNORcc_I	xnorcc 	%r8, 0x058d, %r22
	.word 0xae18aa35  ! 4: XOR_I	xor 	%r2, 0x0a35, %r23
	.word 0xac28800c  ! 4: ANDN_R	andn 	%r2, %r12, %r22
thr3_resum_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107), 16, 16)) -> intp(1, 3, 1)
	.word 0xac88ea50  ! 4: ANDcc_I	andcc 	%r3, 0x0a50, %r22
	.word 0xab7a040b  ! 4: MOVR_R	move	%r8, %r11, %r21
	.word 0xae38ef1c  ! 4: XNOR_I	xnor 	%r3, 0x0f1c, %r23
thr3_nuke_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_108), 16, 16)) -> intp(1, 2, 1)
	.word 0xac11c00b  ! 4: OR_R	or 	%r7, %r11, %r22
	.word 0xac9a000e  ! 4: XORcc_R	xorcc 	%r8, %r14, %r22
	.word 0xb6b1c00d  ! 4: ORNcc_R	orncc 	%r7, %r13, %r27
	.word 0xb8a9c00b  ! 4: ANDNcc_R	andncc 	%r7, %r11, %r28
	.word 0xba81258a  ! 4: ADDcc_I	addcc 	%r4, 0x058a, %r29
thr3_resum_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_108), 16, 16)) -> intp(1, 3, 1)
	.word 0xa8c0c00c  ! 4: ADDCcc_R	addccc 	%r3, %r12, %r20
	.word 0xbb64180f  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_109), 16, 16)) -> intp(0, 0, 1)
	.word 0xb138900d  ! 4: SRAX_R	srax	%r2, %r13, %r24
	.word 0xa9293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r20
	.word 0xae392819  ! 4: XNOR_I	xnor 	%r4, 0x0819, %r23
	.word 0xae41800b  ! 4: ADDC_R	addc 	%r6, %r11, %r23
	.word 0xbc41400e  ! 4: ADDC_R	addc 	%r5, %r14, %r30
	.word 0xb6b16f11  ! 4: ORNcc_I	orncc 	%r5, 0x0f11, %r27
thr3_nuke_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_110), 16, 16)) -> intp(1, 2, 1)
	.word 0xaeb9a557  ! 4: XNORcc_I	xnorcc 	%r6, 0x0557, %r23
	.word 0xb539400c  ! 4: SRA_R	sra 	%r5, %r12, %r26
	.word 0xb8b0ae54  ! 4: ORNcc_I	orncc 	%r2, 0x0e54, %r28
	.word 0xaa19a4e3  ! 4: XOR_I	xor 	%r6, 0x04e3, %r21
	.word 0xbc12000f  ! 4: OR_R	or 	%r8, %r15, %r30
thr3_resum_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_110), 16, 16)) -> intp(1, 3, 1)
	.word 0xba30a47e  ! 4: ORN_I	orn 	%r2, 0x047e, %r29
	.word 0xae30ab14  ! 4: ORN_I	orn 	%r2, 0x0b14, %r23
	.word 0xb439000b  ! 4: XNOR_R	xnor 	%r4, %r11, %r26
	.word 0xb881400e  ! 4: ADDcc_R	addcc 	%r5, %r14, %r28
thr3_nuke_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_111), 16, 16)) -> intp(0, 2, 1)
	.word 0xaac1800b  ! 4: ADDCcc_R	addccc 	%r6, %r11, %r21
	.word 0xae91400d  ! 4: ORcc_R	orcc 	%r5, %r13, %r23
	.word 0xb9792401  ! 4: MOVR_I	move	%r4, 0xd, %r28
	.word 0xb329f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r25
	.word 0xb2b0e4b4  ! 4: ORNcc_I	orncc 	%r3, 0x04b4, %r25
	.word 0xac81aac4  ! 4: ADDcc_I	addcc 	%r6, 0x0ac4, %r22
thr3_resum_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111), 16, 16)) -> intp(0, 3, 1)
	.word 0xac19e2ec  ! 4: XOR_I	xor 	%r7, 0x02ec, %r22
	.word 0xb6812143  ! 4: ADDcc_I	addcc 	%r4, 0x0143, %r27
	.word 0xac1123d8  ! 4: OR_I	or 	%r4, 0x03d8, %r22
thr3_nuke_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_112), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa09e1e1  ! 4: AND_I	and 	%r7, 0x01e1, %r21
	.word 0xa88a000d  ! 4: ANDcc_R	andcc 	%r8, %r13, %r20
	.word 0xb0b1400c  ! 4: ORNcc_R	orncc 	%r5, %r12, %r24
	.word 0xb0b0ec8e  ! 4: ORNcc_I	orncc 	%r3, 0x0c8e, %r24
	.word 0xb330b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r25
	.word 0xae39400e  ! 4: XNOR_R	xnor 	%r5, %r14, %r23
	.word 0xaa41e4e0  ! 4: ADDC_I	addc 	%r7, 0x04e0, %r21
thr3_resum_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_112), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd38800e  ! 4: SRA_R	sra 	%r2, %r14, %r30
thr3_nuke_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_113), 16, 16)) -> intp(0, 2, 1)
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb0b96ca5  ! 4: XNORcc_I	xnorcc 	%r5, 0x0ca5, %r24
	.word 0xb801400f  ! 4: ADD_R	add 	%r5, %r15, %r28
thr3_resum_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_113), 16, 16)) -> intp(0, 3, 1)
	.word 0xb764180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa38ab37  ! 4: XNOR_I	xnor 	%r2, 0x0b37, %r21
thr3_nuke_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_114), 16, 16)) -> intp(1, 2, 1)
	.word 0xb002279c  ! 4: ADD_I	add 	%r8, 0x079c, %r24
	.word 0xab28900c  ! 4: SLLX_R	sllx	%r2, %r12, %r21
	.word 0xbd32000f  ! 4: SRL_R	srl 	%r8, %r15, %r30
thr3_resum_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_114), 16, 16)) -> intp(1, 3, 1)
	.word 0xac81000d  ! 4: ADDcc_R	addcc 	%r4, %r13, %r22
	.word 0xaf28b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r23
	.word 0xba40e84e  ! 4: ADDC_I	addc 	%r3, 0x084e, %r29
	.word 0xa964180b  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_115), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc91a063  ! 4: ORcc_I	orcc 	%r6, 0x0063, %r30
	.word 0xb631800e  ! 4: ORN_R	orn 	%r6, %r14, %r27
	.word 0xbcc1c00a  ! 4: ADDCcc_R	addccc 	%r7, %r10, %r30
	.word 0xb179c40f  ! 4: MOVR_R	move	%r7, %r15, %r24
	.word 0xaaa9000d  ! 4: ANDNcc_R	andncc 	%r4, %r13, %r21
	.word 0xbb64180c  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_116), 16, 16)) -> intp(0, 0, 1)
	.word 0xbac12ed7  ! 4: ADDCcc_I	addccc 	%r4, 0x0ed7, %r29
	.word 0xb8b0c00b  ! 4: ORNcc_R	orncc 	%r3, %r11, %r28
	.word 0xb431000f  ! 4: ORN_R	orn 	%r4, %r15, %r26
	.word 0xaf317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r23
	.word 0xb099c00a  ! 4: XORcc_R	xorcc 	%r7, %r10, %r24
	.word 0xb889c00e  ! 4: ANDcc_R	andcc 	%r7, %r14, %r28
	.word 0xba38c00d  ! 4: XNOR_R	xnor 	%r3, %r13, %r29
thr3_nuke_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_117), 16, 16)) -> intp(1, 2, 1)
	.word 0xaac1000d  ! 4: ADDCcc_R	addccc 	%r4, %r13, %r21
	.word 0xb800800c  ! 4: ADD_R	add 	%r2, %r12, %r28
	.word 0xb6396b50  ! 4: XNOR_I	xnor 	%r5, 0x0b50, %r27
	.word 0xb210c00c  ! 4: OR_R	or 	%r3, %r12, %r25
	.word 0xad31400c  ! 4: SRL_R	srl 	%r5, %r12, %r22
	.word 0xb128b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r24
	.word 0xb489c00c  ! 4: ANDcc_R	andcc 	%r7, %r12, %r26
thr3_resum_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_117), 16, 16)) -> intp(1, 3, 1)
	.word 0xbca8c00e  ! 4: ANDNcc_R	andncc 	%r3, %r14, %r30
	.word 0xa979a401  ! 4: MOVR_I	move	%r6, 0xe, %r20
	.word 0xb499000f  ! 4: XORcc_R	xorcc 	%r4, %r15, %r26
	.word 0xa8a9c00b  ! 4: ANDNcc_R	andncc 	%r7, %r11, %r20
thr3_nuke_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_118), 16, 16)) -> intp(1, 2, 1)
	.word 0xae40e103  ! 4: ADDC_I	addc 	%r3, 0x0103, %r23
	.word 0xb0a961e4  ! 4: ANDNcc_I	andncc 	%r5, 0x01e4, %r24
	.word 0xb2396d14  ! 4: XNOR_I	xnor 	%r5, 0x0d14, %r25
	.word 0xbd31d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r30
	.word 0xb6a9603f  ! 4: ANDNcc_I	andncc 	%r5, 0x003f, %r27
	.word 0xb4b2000c  ! 4: ORNcc_R	orncc 	%r8, %r12, %r26
thr3_resum_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_118), 16, 16)) -> intp(1, 3, 1)
	.word 0xb489000c  ! 4: ANDcc_R	andcc 	%r4, %r12, %r26
	.word 0xb09a000a  ! 4: XORcc_R	xorcc 	%r8, %r10, %r24
	.word 0xb638800c  ! 4: XNOR_R	xnor 	%r2, %r12, %r27
	.word 0xb841000a  ! 4: ADDC_R	addc 	%r4, %r10, %r28
thr3_hw_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_119), 16, 16)) -> intp(0, 0, 1)
	.word 0xb164180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb728d00e  ! 4: SLLX_R	sllx	%r3, %r14, %r27
	.word 0xb929400c  ! 4: SLL_R	sll 	%r5, %r12, %r28
	.word 0xb4296213  ! 4: ANDN_I	andn 	%r5, 0x0213, %r26
	.word 0xab29d00c  ! 4: SLLX_R	sllx	%r7, %r12, %r21
	.word 0xb931500d  ! 4: SRLX_R	srlx	%r5, %r13, %r28
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
thr3_nuke_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_120), 16, 16)) -> intp(1, 2, 1)
	.word 0xad78c40c  ! 4: MOVR_R	move	%r3, %r12, %r22
	.word 0xae19000c  ! 4: XOR_R	xor 	%r4, %r12, %r23
	.word 0xad30800a  ! 4: SRL_R	srl 	%r2, %r10, %r22
thr3_resum_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_120), 16, 16)) -> intp(1, 3, 1)
	.word 0xb638c00d  ! 4: XNOR_R	xnor 	%r3, %r13, %r27
thr3_nuke_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_121), 16, 16)) -> intp(0, 2, 1)
	.word 0xae82000e  ! 4: ADDcc_R	addcc 	%r8, %r14, %r23
thr3_resum_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121), 16, 16)) -> intp(0, 3, 1)
	.word 0xb0c1400e  ! 4: ADDCcc_R	addccc 	%r5, %r14, %r24
	.word 0xb9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r28
thr3_hw_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_122), 16, 16)) -> intp(1, 0, 1)
	.word 0xb731c00a  ! 4: SRL_R	srl 	%r7, %r10, %r27
	.word 0xad79c40a  ! 4: MOVR_R	move	%r7, %r10, %r22
	.word 0xbab2000b  ! 4: ORNcc_R	orncc 	%r8, %r11, %r29
	.word 0xbc9227f8  ! 4: ORcc_I	orcc 	%r8, 0x07f8, %r30
	.word 0xb241000a  ! 4: ADDC_R	addc 	%r4, %r10, %r25
	.word 0xba08ef02  ! 4: AND_I	and 	%r3, 0x0f02, %r29
	.word 0xbc2920a7  ! 4: ANDN_I	andn 	%r4, 0x00a7, %r30
thr3_hw_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_123), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2b9e7e7  ! 4: XNORcc_I	xnorcc 	%r7, 0x07e7, %r25
	.word 0xbb79840e  ! 4: MOVR_R	move	%r6, %r14, %r29
	.word 0xaa89000b  ! 4: ANDcc_R	andcc 	%r4, %r11, %r21
	.word 0xba816029  ! 4: ADDcc_I	addcc 	%r5, 0x0029, %r29
	.word 0xad64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xba29000f  ! 4: ANDN_R	andn 	%r4, %r15, %r29
	.word 0xae992fb9  ! 4: XORcc_I	xorcc 	%r4, 0x0fb9, %r23
thr3_hw_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_124), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa80800a  ! 4: ADDcc_R	addcc 	%r2, %r10, %r21
	.word 0xb12a100a  ! 4: SLLX_R	sllx	%r8, %r10, %r24
	.word 0xb3392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r25
	.word 0xae89800a  ! 4: ANDcc_R	andcc 	%r6, %r10, %r23
	.word 0xa801800a  ! 4: ADD_R	add 	%r6, %r10, %r20
	.word 0xb6b1800c  ! 4: ORNcc_R	orncc 	%r6, %r12, %r27
thr3_hw_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_125), 16, 16)) -> intp(0, 0, 1)
	.word 0xa979a401  ! 4: MOVR_I	move	%r6, 0xc, %r20
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xae31ae19  ! 4: ORN_I	orn 	%r6, 0x0e19, %r23
	.word 0xbc98800f  ! 4: XORcc_R	xorcc 	%r2, %r15, %r30
	.word 0xb9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r28
	.word 0xac98eaf5  ! 4: XORcc_I	xorcc 	%r3, 0x0af5, %r22
	.word 0xa899a2c9  ! 4: XORcc_I	xorcc 	%r6, 0x02c9, %r20
thr3_nuke_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_126), 16, 16)) -> intp(1, 2, 1)
	.word 0xb22a000d  ! 4: ANDN_R	andn 	%r8, %r13, %r25
	.word 0xb019000a  ! 4: XOR_R	xor 	%r4, %r10, %r24
	.word 0xa890800d  ! 4: ORcc_R	orcc 	%r2, %r13, %r20
	.word 0xb280800f  ! 4: ADDcc_R	addcc 	%r2, %r15, %r25
	.word 0xaec1e368  ! 4: ADDCcc_I	addccc 	%r7, 0x0368, %r23
thr3_resum_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_126), 16, 16)) -> intp(1, 3, 1)
	.word 0xb411aa57  ! 4: OR_I	or 	%r6, 0x0a57, %r26
	.word 0xbcb9a5ed  ! 4: XNORcc_I	xnorcc 	%r6, 0x05ed, %r30
	.word 0xad32000f  ! 4: SRL_R	srl 	%r8, %r15, %r22
thr3_nuke_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_127), 16, 16)) -> intp(1, 2, 1)
	.word 0xb331d00e  ! 4: SRLX_R	srlx	%r7, %r14, %r25
	.word 0xb928900e  ! 4: SLLX_R	sllx	%r2, %r14, %r28
	.word 0xb7392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r27
	.word 0xac39e6cf  ! 4: XNOR_I	xnor 	%r7, 0x06cf, %r22
	.word 0xaa09e778  ! 4: AND_I	and 	%r7, 0x0778, %r21
thr3_resum_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_127), 16, 16)) -> intp(1, 3, 1)
	.word 0xb491000f  ! 4: ORcc_R	orcc 	%r4, %r15, %r26
	.word 0xb000c00e  ! 4: ADD_R	add 	%r3, %r14, %r24
	.word 0xac0a2a77  ! 4: AND_I	and 	%r8, 0x0a77, %r22
thr3_nuke_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_128), 16, 16)) -> intp(1, 2, 1)
	.word 0xae98800c  ! 4: XORcc_R	xorcc 	%r2, %r12, %r23
	.word 0xb938900f  ! 4: SRAX_R	srax	%r2, %r15, %r28
	.word 0xac31400b  ! 4: ORN_R	orn 	%r5, %r11, %r22
	.word 0xbc10e918  ! 4: OR_I	or 	%r3, 0x0918, %r30
	.word 0xad28900d  ! 4: SLLX_R	sllx	%r2, %r13, %r22
	.word 0xb0a9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r24
	.word 0xba112d76  ! 4: OR_I	or 	%r4, 0x0d76, %r29
thr3_resum_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_128), 16, 16)) -> intp(1, 3, 1)
	.word 0xb899ef50  ! 4: XORcc_I	xorcc 	%r7, 0x0f50, %r28
thr3_nuke_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_129), 16, 16)) -> intp(1, 2, 1)
	.word 0xb699a842  ! 4: XORcc_I	xorcc 	%r6, 0x0842, %r27
	.word 0xbc09c00f  ! 4: AND_R	and 	%r7, %r15, %r30
	.word 0xb331100c  ! 4: SRLX_R	srlx	%r4, %r12, %r25
	.word 0xa809000c  ! 4: AND_R	and 	%r4, %r12, %r20
	.word 0xb138e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r24
	.word 0xb8c22652  ! 4: ADDCcc_I	addccc 	%r8, 0x0652, %r28
	.word 0xb8aa000e  ! 4: ANDNcc_R	andncc 	%r8, %r14, %r28
thr3_resum_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8b0a191  ! 4: ORNcc_I	orncc 	%r2, 0x0191, %r28
thr3_hw_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_130), 16, 16)) -> intp(0, 0, 1)
	.word 0xab29500a  ! 4: SLLX_R	sllx	%r5, %r10, %r21
	.word 0xb3313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r25
	.word 0xb731800b  ! 4: SRL_R	srl 	%r6, %r11, %r27
	.word 0xab313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r21
	.word 0xb019ee20  ! 4: XOR_I	xor 	%r7, 0x0e20, %r24
	.word 0xae90adb5  ! 4: ORcc_I	orcc 	%r2, 0x0db5, %r23
	.word 0xb964180d  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_131), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b8a735  ! 4: XNORcc_I	xnorcc 	%r2, 0x0735, %r26
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb040c00b  ! 4: ADDC_R	addc 	%r3, %r11, %r24
	.word 0xbc90ed99  ! 4: ORcc_I	orcc 	%r3, 0x0d99, %r30
	.word 0xab39400c  ! 4: SRA_R	sra 	%r5, %r12, %r21
	.word 0xb77a2401  ! 4: MOVR_I	move	%r8, 0xc, %r27
	.word 0xaeb0800a  ! 4: ORNcc_R	orncc 	%r2, %r10, %r23
thr3_hw_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_132), 16, 16)) -> intp(0, 0, 1)
	.word 0xb841800a  ! 4: ADDC_R	addc 	%r6, %r10, %r28
	.word 0xbd31400a  ! 4: SRL_R	srl 	%r5, %r10, %r30
	.word 0xaec0c00e  ! 4: ADDCcc_R	addccc 	%r3, %r14, %r23
	.word 0xb3297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r25
	.word 0xb0122589  ! 4: OR_I	or 	%r8, 0x0589, %r24
	.word 0xb5292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r26
	.word 0xba392ecd  ! 4: XNOR_I	xnor 	%r4, 0x0ecd, %r29
thr3_hw_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_133), 16, 16)) -> intp(0, 0, 1)
	.word 0xa929f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r20
	.word 0xb419400f  ! 4: XOR_R	xor 	%r5, %r15, %r26
	.word 0xac29400b  ! 4: ANDN_R	andn 	%r5, %r11, %r22
	.word 0xbc98800f  ! 4: XORcc_R	xorcc 	%r2, %r15, %r30
	.word 0xa8c1a547  ! 4: ADDCcc_I	addccc 	%r6, 0x0547, %r20
	.word 0xba31c00d  ! 4: ORN_R	orn 	%r7, %r13, %r29
	.word 0xaa89c00a  ! 4: ANDcc_R	andcc 	%r7, %r10, %r21
thr3_nuke_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_134), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa39000d  ! 4: XNOR_R	xnor 	%r4, %r13, %r21
	.word 0xb8c1400a  ! 4: ADDCcc_R	addccc 	%r5, %r10, %r28
thr3_resum_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_134), 16, 16)) -> intp(1, 3, 1)
	.word 0xac39800a  ! 4: XNOR_R	xnor 	%r6, %r10, %r22
thr3_nuke_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_135), 16, 16)) -> intp(0, 2, 1)
	.word 0xbab92c5d  ! 4: XNORcc_I	xnorcc 	%r4, 0x0c5d, %r29
	.word 0xaeb0e283  ! 4: ORNcc_I	orncc 	%r3, 0x0283, %r23
	.word 0xa831a67e  ! 4: ORN_I	orn 	%r6, 0x067e, %r20
	.word 0xb964180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb211ec49  ! 4: OR_I	or 	%r7, 0x0c49, %r25
thr3_resum_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_135), 16, 16)) -> intp(0, 3, 1)
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb601e0ec  ! 4: ADD_I	add 	%r7, 0x00ec, %r27
	.word 0xb730c00b  ! 4: SRL_R	srl 	%r3, %r11, %r27
	.word 0xa889800d  ! 4: ANDcc_R	andcc 	%r6, %r13, %r20
thr3_hw_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_136), 16, 16)) -> intp(0, 0, 1)
	.word 0xa829aa64  ! 4: ANDN_I	andn 	%r6, 0x0a64, %r20
	.word 0xb639000b  ! 4: XNOR_R	xnor 	%r4, %r11, %r27
	.word 0xb929c00e  ! 4: SLL_R	sll 	%r7, %r14, %r28
	.word 0xb231400b  ! 4: ORN_R	orn 	%r5, %r11, %r25
	.word 0xbd31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r30
	.word 0xbc98aad3  ! 4: XORcc_I	xorcc 	%r2, 0x0ad3, %r30
thr3_hw_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_137), 16, 16)) -> intp(0, 0, 1)
	.word 0xb438c00c  ! 4: XNOR_R	xnor 	%r3, %r12, %r26
	.word 0xb400ab03  ! 4: ADD_I	add 	%r2, 0x0b03, %r26
	.word 0xb6b1c00f  ! 4: ORNcc_R	orncc 	%r7, %r15, %r27
	.word 0xa839c00d  ! 4: XNOR_R	xnor 	%r7, %r13, %r20
	.word 0xba19c00f  ! 4: XOR_R	xor 	%r7, %r15, %r29
	.word 0xb72a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r27
thr3_hw_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_138), 16, 16)) -> intp(1, 0, 1)
	.word 0xb828800b  ! 4: ANDN_R	andn 	%r2, %r11, %r28
	.word 0xb2a9400d  ! 4: ANDNcc_R	andncc 	%r5, %r13, %r25
	.word 0xbac2000d  ! 4: ADDCcc_R	addccc 	%r8, %r13, %r29
	.word 0xba42000c  ! 4: ADDC_R	addc 	%r8, %r12, %r29
	.word 0xb490adf2  ! 4: ORcc_I	orcc 	%r2, 0x0df2, %r26
	.word 0xacb1800b  ! 4: ORNcc_R	orncc 	%r6, %r11, %r22
	.word 0xa839400b  ! 4: XNOR_R	xnor 	%r5, %r11, %r20
thr3_hw_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_139), 16, 16)) -> intp(1, 0, 1)
	.word 0xbd296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r30
	.word 0xb638800d  ! 4: XNOR_R	xnor 	%r2, %r13, %r27
	.word 0xb810eeee  ! 4: OR_I	or 	%r3, 0x0eee, %r28
	.word 0xaa81a935  ! 4: ADDcc_I	addcc 	%r6, 0x0935, %r21
	.word 0xb538800e  ! 4: SRA_R	sra 	%r2, %r14, %r26
	.word 0xbc12270a  ! 4: OR_I	or 	%r8, 0x070a, %r30
thr3_hw_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_140), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8a9e2a6  ! 4: ANDNcc_I	andncc 	%r7, 0x02a6, %r28
	.word 0xac39eaee  ! 4: XNOR_I	xnor 	%r7, 0x0aee, %r22
	.word 0xb491800f  ! 4: ORcc_R	orcc 	%r6, %r15, %r26
	.word 0xa931a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r20
	.word 0xb690ecef  ! 4: ORcc_I	orcc 	%r3, 0x0cef, %r27
	.word 0xb33a100e  ! 4: SRAX_R	srax	%r8, %r14, %r25
	.word 0xaeb168ec  ! 4: ORNcc_I	orncc 	%r5, 0x08ec, %r23
thr3_nuke_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_141), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc91400d  ! 4: ORcc_R	orcc 	%r5, %r13, %r30
	.word 0xb22962a4  ! 4: ANDN_I	andn 	%r5, 0x02a4, %r25
	.word 0xbb79e401  ! 4: MOVR_I	move	%r7, 0xfffffea4, %r29
thr3_resum_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_141), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8c0e4c9  ! 4: ADDCcc_I	addccc 	%r3, 0x04c9, %r20
	.word 0xb040ae60  ! 4: ADDC_I	addc 	%r2, 0x0e60, %r24
	.word 0xba81000a  ! 4: ADDcc_R	addcc 	%r4, %r10, %r29
thr3_nuke_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_142), 16, 16)) -> intp(0, 2, 1)
	.word 0xb432238f  ! 4: ORN_I	orn 	%r8, 0x038f, %r26
thr3_resum_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_142), 16, 16)) -> intp(0, 3, 1)
	.word 0xba28800e  ! 4: ANDN_R	andn 	%r2, %r14, %r29
thr3_nuke_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_143), 16, 16)) -> intp(1, 2, 1)
	.word 0xa929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r20
	.word 0xb0316fbd  ! 4: ORN_I	orn 	%r5, 0x0fbd, %r24
	.word 0xaca9800e  ! 4: ANDNcc_R	andncc 	%r6, %r14, %r22
	.word 0xba89400e  ! 4: ANDcc_R	andcc 	%r5, %r14, %r29
	.word 0xb53a100c  ! 4: SRAX_R	srax	%r8, %r12, %r26
	.word 0xb800a7c2  ! 4: ADD_I	add 	%r2, 0x07c2, %r28
	.word 0xad64180a  ! 4: MOVcc_R	<illegal instruction>
thr3_resum_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_143), 16, 16)) -> intp(1, 3, 1)
	.word 0xb778840b  ! 4: MOVR_R	move	%r2, %r11, %r27
thr3_nuke_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_144), 16, 16)) -> intp(0, 2, 1)
	.word 0xb039000f  ! 4: XNOR_R	xnor 	%r4, %r15, %r24
thr3_resum_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144), 16, 16)) -> intp(0, 3, 1)
	.word 0xa9317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r20
	.word 0xb239a915  ! 4: XNOR_I	xnor 	%r6, 0x0915, %r25
	.word 0xbc90800f  ! 4: ORcc_R	orcc 	%r2, %r15, %r30
thr3_nuke_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_145), 16, 16)) -> intp(0, 2, 1)
	.word 0xb331800f  ! 4: SRL_R	srl 	%r6, %r15, %r25
	.word 0xb231e44d  ! 4: ORN_I	orn 	%r7, 0x044d, %r25
thr3_resum_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_145), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r23
thr3_nuke_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_146), 16, 16)) -> intp(0, 2, 1)
	.word 0xaab8800d  ! 4: XNORcc_R	xnorcc 	%r2, %r13, %r21
	.word 0xb61165f9  ! 4: OR_I	or 	%r5, 0x05f9, %r27
	.word 0xb2a9aa32  ! 4: ANDNcc_I	andncc 	%r6, 0x0a32, %r25
	.word 0xb739800b  ! 4: SRA_R	sra 	%r6, %r11, %r27
	.word 0xb339c00d  ! 4: SRA_R	sra 	%r7, %r13, %r25
	.word 0xa889e851  ! 4: ANDcc_I	andcc 	%r7, 0x0851, %r20
thr3_resum_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_146), 16, 16)) -> intp(0, 3, 1)
	.word 0xb218800a  ! 4: XOR_R	xor 	%r2, %r10, %r25
	.word 0xb2b0eef3  ! 4: ORNcc_I	orncc 	%r3, 0x0ef3, %r25
thr3_hw_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_147), 16, 16)) -> intp(0, 0, 1)
	.word 0xba89000b  ! 4: ANDcc_R	andcc 	%r4, %r11, %r29
	.word 0xa838c00b  ! 4: XNOR_R	xnor 	%r3, %r11, %r20
	.word 0xb631c00d  ! 4: ORN_R	orn 	%r7, %r13, %r27
	.word 0xaf39800c  ! 4: SRA_R	sra 	%r6, %r12, %r23
	.word 0xba29800b  ! 4: ANDN_R	andn 	%r6, %r11, %r29
	.word 0xa930e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r20
thr3_nuke_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_148), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4b9c00c  ! 4: XNORcc_R	xnorcc 	%r7, %r12, %r26
thr3_resum_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_148), 16, 16)) -> intp(0, 3, 1)
	.word 0xbcb9400d  ! 4: XNORcc_R	xnorcc 	%r5, %r13, %r30
	.word 0xab38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r21
thr3_nuke_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_149), 16, 16)) -> intp(1, 2, 1)
	.word 0xbab0800e  ! 4: ORNcc_R	orncc 	%r2, %r14, %r29
	.word 0xb601800c  ! 4: ADD_R	add 	%r6, %r12, %r27
	.word 0xbab9e995  ! 4: XNORcc_I	xnorcc 	%r7, 0x0995, %r29
thr3_resum_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149), 16, 16)) -> intp(1, 3, 1)
	.word 0xb764180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae30c00f  ! 4: ORN_R	orn 	%r3, %r15, %r23
	.word 0xb938900a  ! 4: SRAX_R	srax	%r2, %r10, %r28
thr3_hw_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_150), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa196b1f  ! 4: XOR_I	xor 	%r5, 0x0b1f, %r21
	.word 0xa841000a  ! 4: ADDC_R	addc 	%r4, %r10, %r20
	.word 0xab39000e  ! 4: SRA_R	sra 	%r4, %r14, %r21
	.word 0xb4a8a3fa  ! 4: ANDNcc_I	andncc 	%r2, 0x03fa, %r26
	.word 0xa899a944  ! 4: XORcc_I	xorcc 	%r6, 0x0944, %r20
	.word 0xa819a2be  ! 4: XOR_I	xor 	%r6, 0x02be, %r20
	.word 0xbd39d00e  ! 4: SRAX_R	srax	%r7, %r14, %r30
thr3_hw_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_151), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0016ec8  ! 4: ADD_I	add 	%r5, 0x0ec8, %r24
	.word 0xbc90e5fa  ! 4: ORcc_I	orcc 	%r3, 0x05fa, %r30
	.word 0xb9392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r28
	.word 0xb2c0800a  ! 4: ADDCcc_R	addccc 	%r2, %r10, %r25
	.word 0xad2a100c  ! 4: SLLX_R	sllx	%r8, %r12, %r22
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb641000f  ! 4: ADDC_R	addc 	%r4, %r15, %r27
thr3_nuke_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_152), 16, 16)) -> intp(0, 2, 1)
	.word 0xab28f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r21
	.word 0xac41c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r22
	.word 0xaab8abf1  ! 4: XNORcc_I	xnorcc 	%r2, 0x0bf1, %r21
	.word 0xb239400e  ! 4: XNOR_R	xnor 	%r5, %r14, %r25
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
thr3_resum_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_152), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc31400f  ! 4: ORN_R	orn 	%r5, %r15, %r30
	.word 0xa8a9800b  ! 4: ANDNcc_R	andncc 	%r6, %r11, %r20
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_153), 16, 16)) -> intp(1, 0, 1)
	.word 0xb889000d  ! 4: ANDcc_R	andcc 	%r4, %r13, %r28
	.word 0xa88164f6  ! 4: ADDcc_I	addcc 	%r5, 0x04f6, %r20
	.word 0xba80800a  ! 4: ADDcc_R	addcc 	%r2, %r10, %r29
	.word 0xac416787  ! 4: ADDC_I	addc 	%r5, 0x0787, %r22
	.word 0xb2c0800f  ! 4: ADDCcc_R	addccc 	%r2, %r15, %r25
	.word 0xacb0a7e8  ! 4: ORNcc_I	orncc 	%r2, 0x07e8, %r22
	.word 0xb219000c  ! 4: XOR_R	xor 	%r4, %r12, %r25
thr3_hw_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_154), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf39900f  ! 4: SRAX_R	srax	%r6, %r15, %r23
	.word 0xbb78c40f  ! 4: MOVR_R	move	%r3, %r15, %r29
	.word 0xbc10c00b  ! 4: OR_R	or 	%r3, %r11, %r30
	.word 0xae88ec17  ! 4: ANDcc_I	andcc 	%r3, 0x0c17, %r23
	.word 0xb641400d  ! 4: ADDC_R	addc 	%r5, %r13, %r27
	.word 0xa929e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r20
	.word 0xb1292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r24
thr3_nuke_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_155), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd31e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r30
	.word 0xac39a5f3  ! 4: XNOR_I	xnor 	%r6, 0x05f3, %r22
	.word 0xbcb1800f  ! 4: ORNcc_R	orncc 	%r6, %r15, %r30
thr3_resum_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_155), 16, 16)) -> intp(1, 3, 1)
	.word 0xb978a401  ! 4: MOVR_I	move	%r2, 0xf, %r28
thr3_nuke_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_156), 16, 16)) -> intp(1, 2, 1)
	.word 0xad7a2401  ! 4: MOVR_I	move	%r8, 0xf, %r22
	.word 0xac89a5bd  ! 4: ANDcc_I	andcc 	%r6, 0x05bd, %r22
	.word 0xba28eafa  ! 4: ANDN_I	andn 	%r3, 0x0afa, %r29
	.word 0xae88800c  ! 4: ANDcc_R	andcc 	%r2, %r12, %r23
	.word 0xac02000e  ! 4: ADD_R	add 	%r8, %r14, %r22
	.word 0xbd31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r30
	.word 0xb339a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r25
thr3_resum_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_156), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa19c00a  ! 4: XOR_R	xor 	%r7, %r10, %r21
	.word 0xbcb1e60c  ! 4: ORNcc_I	orncc 	%r7, 0x060c, %r30
	.word 0xb839000a  ! 4: XNOR_R	xnor 	%r4, %r10, %r28
	.word 0xbc996a57  ! 4: XORcc_I	xorcc 	%r5, 0x0a57, %r30
thr3_nuke_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_157), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8b8ad54  ! 4: XNORcc_I	xnorcc 	%r2, 0x0d54, %r20
	.word 0xac096f32  ! 4: AND_I	and 	%r5, 0x0f32, %r22
	.word 0xb329500d  ! 4: SLLX_R	sllx	%r5, %r13, %r25
	.word 0xbd30900b  ! 4: SRLX_R	srlx	%r2, %r11, %r30
	.word 0xac80c00b  ! 4: ADDcc_R	addcc 	%r3, %r11, %r22
thr3_resum_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_157), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8aa2fed  ! 4: ANDNcc_I	andncc 	%r8, 0x0fed, %r28
	.word 0xb6296769  ! 4: ANDN_I	andn 	%r5, 0x0769, %r27
thr3_nuke_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_158), 16, 16)) -> intp(1, 2, 1)
	.word 0xad312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r22
	.word 0xaf2a000b  ! 4: SLL_R	sll 	%r8, %r11, %r23
thr3_resum_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158), 16, 16)) -> intp(1, 3, 1)
	.word 0xad31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r22
	.word 0xb008ec7b  ! 4: AND_I	and 	%r3, 0x0c7b, %r24
	.word 0xbd30900a  ! 4: SRLX_R	srlx	%r2, %r10, %r30
thr3_hw_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_159), 16, 16)) -> intp(1, 0, 1)
	.word 0xaca927b0  ! 4: ANDNcc_I	andncc 	%r4, 0x07b0, %r22
	.word 0xb364180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb6a8800f  ! 4: ANDNcc_R	andncc 	%r2, %r15, %r27
	.word 0xa8316e7a  ! 4: ORN_I	orn 	%r5, 0x0e7a, %r20
	.word 0xb931500a  ! 4: SRLX_R	srlx	%r5, %r10, %r28
	.word 0xac29800e  ! 4: ANDN_R	andn 	%r6, %r14, %r22
thr3_hw_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_160), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb681e6ea  ! 4: ADDcc_I	addcc 	%r7, 0x06ea, %r27
	.word 0xae08a4c5  ! 4: AND_I	and 	%r2, 0x04c5, %r23
	.word 0xbc912627  ! 4: ORcc_I	orcc 	%r4, 0x0627, %r30
	.word 0xbb3a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r29
	.word 0xb731a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r27
thr3_hw_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_161), 16, 16)) -> intp(0, 0, 1)
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbd32000d  ! 4: SRL_R	srl 	%r8, %r13, %r30
	.word 0xb288a759  ! 4: ANDcc_I	andcc 	%r2, 0x0759, %r25
	.word 0xb499efd5  ! 4: XORcc_I	xorcc 	%r7, 0x0fd5, %r26
	.word 0xa811a60b  ! 4: OR_I	or 	%r6, 0x060b, %r20
	.word 0xac30efae  ! 4: ORN_I	orn 	%r3, 0x0fae, %r22
	.word 0xb2996075  ! 4: XORcc_I	xorcc 	%r5, 0x0075, %r25
thr3_hw_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_162), 16, 16)) -> intp(0, 0, 1)
	.word 0xb838e315  ! 4: XNOR_I	xnor 	%r3, 0x0315, %r28
	.word 0xb092259a  ! 4: ORcc_I	orcc 	%r8, 0x059a, %r24
	.word 0xad38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r22
	.word 0xab32000f  ! 4: SRL_R	srl 	%r8, %r15, %r21
	.word 0xb831ed10  ! 4: ORN_I	orn 	%r7, 0x0d10, %r28
	.word 0xac01c00c  ! 4: ADD_R	add 	%r7, %r12, %r22
	.word 0xaeb0800c  ! 4: ORNcc_R	orncc 	%r2, %r12, %r23
thr3_nuke_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_163), 16, 16)) -> intp(0, 2, 1)
	.word 0xb179840d  ! 4: MOVR_R	move	%r6, %r13, %r24
	.word 0xa9312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r20
	.word 0xaca8c00e  ! 4: ANDNcc_R	andncc 	%r3, %r14, %r22
	.word 0xb231c00e  ! 4: ORN_R	orn 	%r7, %r14, %r25
	.word 0xbc4226da  ! 4: ADDC_I	addc 	%r8, 0x06da, %r30
thr3_resum_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163), 16, 16)) -> intp(0, 3, 1)
	.word 0xb431000a  ! 4: ORN_R	orn 	%r4, %r10, %r26
	.word 0xba122edb  ! 4: OR_I	or 	%r8, 0x0edb, %r29
	.word 0xab29a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r21
	.word 0xb010e663  ! 4: OR_I	or 	%r3, 0x0663, %r24
thr3_hw_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_164), 16, 16)) -> intp(0, 0, 1)
	.word 0xad38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r22
	.word 0xb8c0800a  ! 4: ADDCcc_R	addccc 	%r2, %r10, %r28
	.word 0xb408a929  ! 4: AND_I	and 	%r2, 0x0929, %r26
	.word 0xb4b9e006  ! 4: XNORcc_I	xnorcc 	%r7, 0x0006, %r26
	.word 0xb0b1000b  ! 4: ORNcc_R	orncc 	%r4, %r11, %r24
	.word 0xbcb9000f  ! 4: XNORcc_R	xnorcc 	%r4, %r15, %r30
	.word 0xb609e9b4  ! 4: AND_I	and 	%r7, 0x09b4, %r27
thr3_nuke_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_165), 16, 16)) -> intp(0, 2, 1)
	.word 0xb164180e  ! 4: MOVcc_R	<illegal instruction>
thr3_resum_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_165), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc19000f  ! 4: XOR_R	xor 	%r4, %r15, %r30
	.word 0xae80800f  ! 4: ADDcc_R	addcc 	%r2, %r15, %r23
thr3_nuke_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_166), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa30800d  ! 4: ORN_R	orn 	%r2, %r13, %r21
	.word 0xb228e1df  ! 4: ANDN_I	andn 	%r3, 0x01df, %r25
	.word 0xb738c00c  ! 4: SRA_R	sra 	%r3, %r12, %r27
	.word 0xb481800e  ! 4: ADDcc_R	addcc 	%r6, %r14, %r26
	.word 0xb491ee8b  ! 4: ORcc_I	orcc 	%r7, 0x0e8b, %r26
	.word 0xbc32000b  ! 4: ORN_R	orn 	%r8, %r11, %r30
	.word 0xba19800c  ! 4: XOR_R	xor 	%r6, %r12, %r29
thr3_resum_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166), 16, 16)) -> intp(0, 3, 1)
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xba196bb3  ! 4: XOR_I	xor 	%r5, 0x0bb3, %r29
	.word 0xbaa9aaa2  ! 4: ANDNcc_I	andncc 	%r6, 0x0aa2, %r29
	.word 0xbaa8c00b  ! 4: ANDNcc_R	andncc 	%r3, %r11, %r29
thr3_nuke_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_167), 16, 16)) -> intp(1, 2, 1)
	.word 0xb830afcd  ! 4: ORN_I	orn 	%r2, 0x0fcd, %r28
	.word 0xbb29500e  ! 4: SLLX_R	sllx	%r5, %r14, %r29
	.word 0xb530f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r26
	.word 0xaca9c00f  ! 4: ANDNcc_R	andncc 	%r7, %r15, %r22
	.word 0xac01e7d4  ! 4: ADD_I	add 	%r7, 0x07d4, %r22
	.word 0xb528d00e  ! 4: SLLX_R	sllx	%r3, %r14, %r26
thr3_resum_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_167), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb39d00f  ! 4: SRAX_R	srax	%r7, %r15, %r29
	.word 0xb939500f  ! 4: SRAX_R	srax	%r5, %r15, %r28
thr3_hw_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_168), 16, 16)) -> intp(0, 0, 1)
	.word 0xb699e5ca  ! 4: XORcc_I	xorcc 	%r7, 0x05ca, %r27
	.word 0xbc09000e  ! 4: AND_R	and 	%r4, %r14, %r30
	.word 0xa8a9a08e  ! 4: ANDNcc_I	andncc 	%r6, 0x008e, %r20
	.word 0xaf31100d  ! 4: SRLX_R	srlx	%r4, %r13, %r23
	.word 0xbd78840d  ! 4: MOVR_R	move	%r2, %r13, %r30
	.word 0xb138900c  ! 4: SRAX_R	srax	%r2, %r12, %r24
	.word 0xad78c40c  ! 4: MOVR_R	move	%r3, %r12, %r22
thr3_nuke_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_169), 16, 16)) -> intp(1, 2, 1)
	.word 0xb601e62d  ! 4: ADD_I	add 	%r7, 0x062d, %r27
	.word 0xb5297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r26
	.word 0xb689acd1  ! 4: ANDcc_I	andcc 	%r6, 0x0cd1, %r27
thr3_resum_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_169), 16, 16)) -> intp(1, 3, 1)
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb7296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r27
	.word 0xb689000e  ! 4: ANDcc_R	andcc 	%r4, %r14, %r27
thr3_hw_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_170), 16, 16)) -> intp(1, 0, 1)
	.word 0xb841400c  ! 4: ADDC_R	addc 	%r5, %r12, %r28
	.word 0xbc092de0  ! 4: AND_I	and 	%r4, 0x0de0, %r30
	.word 0xbc30c00d  ! 4: ORN_R	orn 	%r3, %r13, %r30
	.word 0xad39800a  ! 4: SRA_R	sra 	%r6, %r10, %r22
	.word 0xb090aef8  ! 4: ORcc_I	orcc 	%r2, 0x0ef8, %r24
	.word 0xba41400f  ! 4: ADDC_R	addc 	%r5, %r15, %r29
thr3_hw_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_171), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf39000f  ! 4: SRA_R	sra 	%r4, %r15, %r23
	.word 0xac19000d  ! 4: XOR_R	xor 	%r4, %r13, %r22
	.word 0xb602297b  ! 4: ADD_I	add 	%r8, 0x097b, %r27
	.word 0xbb28d00d  ! 4: SLLX_R	sllx	%r3, %r13, %r29
	.word 0xa899af69  ! 4: XORcc_I	xorcc 	%r6, 0x0f69, %r20
	.word 0xad64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae30800c  ! 4: ORN_R	orn 	%r2, %r12, %r23
thr3_nuke_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_172), 16, 16)) -> intp(0, 2, 1)
	.word 0xab79c40c  ! 4: MOVR_R	move	%r7, %r12, %r21
	.word 0xad79a401  ! 4: MOVR_I	move	%r6, 0xc, %r22
	.word 0xaa01eb9b  ! 4: ADD_I	add 	%r7, 0x0b9b, %r21
	.word 0xb7297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r27
thr3_resum_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_172), 16, 16)) -> intp(0, 3, 1)
	.word 0xb819800e  ! 4: XOR_R	xor 	%r6, %r14, %r28
	.word 0xad323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r22
	.word 0xae31400f  ! 4: ORN_R	orn 	%r5, %r15, %r23
thr3_hw_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_173), 16, 16)) -> intp(0, 0, 1)
	.word 0xa92a100a  ! 4: SLLX_R	sllx	%r8, %r10, %r20
	.word 0xbab8a99d  ! 4: XNORcc_I	xnorcc 	%r2, 0x099d, %r29
	.word 0xb2b0800d  ! 4: ORNcc_R	orncc 	%r2, %r13, %r25
	.word 0xbc312649  ! 4: ORN_I	orn 	%r4, 0x0649, %r30
	.word 0xab64180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb238800a  ! 4: XNOR_R	xnor 	%r2, %r10, %r25
thr3_hw_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_174), 16, 16)) -> intp(0, 0, 1)
	.word 0xb891685a  ! 4: ORcc_I	orcc 	%r5, 0x085a, %r28
	.word 0xbb64180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb808ea33  ! 4: AND_I	and 	%r3, 0x0a33, %r28
	.word 0xbc196f87  ! 4: XOR_I	xor 	%r5, 0x0f87, %r30
	.word 0xbb78e401  ! 4: MOVR_I	move	%r3, 0xffffff87, %r29
	.word 0xb364180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb730800e  ! 4: SRL_R	srl 	%r2, %r14, %r27
thr3_nuke_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_175), 16, 16)) -> intp(0, 2, 1)
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
	.word 0xb364180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xae31674d  ! 4: ORN_I	orn 	%r5, 0x074d, %r23
	.word 0xb68966f0  ! 4: ANDcc_I	andcc 	%r5, 0x06f0, %r27
thr3_resum_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175), 16, 16)) -> intp(0, 3, 1)
	.word 0xad796401  ! 4: MOVR_I	move	%r5, 0xfffffef0, %r22
	.word 0xaf39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r23
	.word 0xbaaa2656  ! 4: ANDNcc_I	andncc 	%r8, 0x0656, %r29
	.word 0xb640c00b  ! 4: ADDC_R	addc 	%r3, %r11, %r27
thr3_nuke_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_176), 16, 16)) -> intp(0, 2, 1)
	.word 0xaab967db  ! 4: XNORcc_I	xnorcc 	%r5, 0x07db, %r21
	.word 0xb411e220  ! 4: OR_I	or 	%r7, 0x0220, %r26
	.word 0xbca9c00e  ! 4: ANDNcc_R	andncc 	%r7, %r14, %r30
thr3_resum_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_176), 16, 16)) -> intp(0, 3, 1)
	.word 0xb764180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb689800c  ! 4: ANDcc_R	andcc 	%r6, %r12, %r27
	.word 0xb019000a  ! 4: XOR_R	xor 	%r4, %r10, %r24
thr3_nuke_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_177), 16, 16)) -> intp(1, 2, 1)
	.word 0xb9292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r28
	.word 0xa891000e  ! 4: ORcc_R	orcc 	%r4, %r14, %r20
	.word 0xb6b9000b  ! 4: XNORcc_R	xnorcc 	%r4, %r11, %r27
thr3_resum_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_177), 16, 16)) -> intp(1, 3, 1)
	.word 0xad38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r22
	.word 0xb219a38c  ! 4: XOR_I	xor 	%r6, 0x038c, %r25
thr3_hw_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_178), 16, 16)) -> intp(0, 0, 1)
	.word 0xb041c00a  ! 4: ADDC_R	addc 	%r7, %r10, %r24
	.word 0xb6b2000d  ! 4: ORNcc_R	orncc 	%r8, %r13, %r27
	.word 0xbca9c00b  ! 4: ANDNcc_R	andncc 	%r7, %r11, %r30
	.word 0xaa82000b  ! 4: ADDcc_R	addcc 	%r8, %r11, %r21
	.word 0xb92a100c  ! 4: SLLX_R	sllx	%r8, %r12, %r28
	.word 0xb12a000b  ! 4: SLL_R	sll 	%r8, %r11, %r24
	.word 0xb128d00c  ! 4: SLLX_R	sllx	%r3, %r12, %r24
thr3_hw_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_179), 16, 16)) -> intp(0, 0, 1)
	.word 0xb329a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r25
	.word 0xbc88e12a  ! 4: ANDcc_I	andcc 	%r3, 0x012a, %r30
	.word 0xb53a100b  ! 4: SRAX_R	srax	%r8, %r11, %r26
	.word 0xaab8ad1b  ! 4: XNORcc_I	xnorcc 	%r2, 0x0d1b, %r21
	.word 0xb8016b97  ! 4: ADD_I	add 	%r5, 0x0b97, %r28
	.word 0xbd39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r30
	.word 0xa9392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r20
thr3_nuke_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_180), 16, 16)) -> intp(1, 2, 1)
	.word 0xb219af90  ! 4: XOR_I	xor 	%r6, 0x0f90, %r25
	.word 0xb029800e  ! 4: ANDN_R	andn 	%r6, %r14, %r24
	.word 0xbb78e401  ! 4: MOVR_I	move	%r3, 0xe, %r29
	.word 0xb838e732  ! 4: XNOR_I	xnor 	%r3, 0x0732, %r28
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xad316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r22
thr3_resum_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180), 16, 16)) -> intp(1, 3, 1)
	.word 0xad2a100b  ! 4: SLLX_R	sllx	%r8, %r11, %r22
	.word 0xa932000d  ! 4: SRL_R	srl 	%r8, %r13, %r20
	.word 0xb881a281  ! 4: ADDcc_I	addcc 	%r6, 0x0281, %r28
	.word 0xba88c00f  ! 4: ANDcc_R	andcc 	%r3, %r15, %r29
thr3_hw_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_181), 16, 16)) -> intp(0, 0, 1)
	.word 0xbcb22e26  ! 4: ORNcc_I	orncc 	%r8, 0x0e26, %r30
	.word 0xb838e37e  ! 4: XNOR_I	xnor 	%r3, 0x037e, %r28
	.word 0xb528900e  ! 4: SLLX_R	sllx	%r2, %r14, %r26
	.word 0xaac1800f  ! 4: ADDCcc_R	addccc 	%r6, %r15, %r21
	.word 0xbc416ef3  ! 4: ADDC_I	addc 	%r5, 0x0ef3, %r30
	.word 0xaa80c00a  ! 4: ADDcc_R	addcc 	%r3, %r10, %r21
	.word 0xbc41ab80  ! 4: ADDC_I	addc 	%r6, 0x0b80, %r30
thr3_nuke_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_182), 16, 16)) -> intp(0, 2, 1)
	.word 0xad64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb6c1a5a6  ! 4: ADDCcc_I	addccc 	%r6, 0x05a6, %r27
	.word 0xacb0c00a  ! 4: ORNcc_R	orncc 	%r3, %r10, %r22
	.word 0xb2b0e41b  ! 4: ORNcc_I	orncc 	%r3, 0x041b, %r25
thr3_resum_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_182), 16, 16)) -> intp(0, 3, 1)
	.word 0xaec1a4ea  ! 4: ADDCcc_I	addccc 	%r6, 0x04ea, %r23
thr3_hw_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_183), 16, 16)) -> intp(1, 0, 1)
	.word 0xb929000c  ! 4: SLL_R	sll 	%r4, %r12, %r28
	.word 0xbc8a000d  ! 4: ANDcc_R	andcc 	%r8, %r13, %r30
	.word 0xb4022bff  ! 4: ADD_I	add 	%r8, 0x0bff, %r26
	.word 0xaf39500f  ! 4: SRAX_R	srax	%r5, %r15, %r23
	.word 0xb4a9e5af  ! 4: ANDNcc_I	andncc 	%r7, 0x05af, %r26
	.word 0xb209c00d  ! 4: AND_R	and 	%r7, %r13, %r25
	.word 0xa829c00a  ! 4: ANDN_R	andn 	%r7, %r10, %r20
thr3_hw_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_184), 16, 16)) -> intp(1, 0, 1)
	.word 0xba19400b  ! 4: XOR_R	xor 	%r5, %r11, %r29
	.word 0xad28c00c  ! 4: SLL_R	sll 	%r3, %r12, %r22
	.word 0xb3643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xad792401  ! 4: MOVR_I	move	%r4, 0xc, %r22
	.word 0xab78c40d  ! 4: MOVR_R	move	%r3, %r13, %r21
	.word 0xbb29100a  ! 4: SLLX_R	sllx	%r4, %r10, %r29
	.word 0xb72a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r27
thr3_hw_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_185), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4c2000d  ! 4: ADDCcc_R	addccc 	%r8, %r13, %r26
	.word 0xab28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r21
	.word 0xb138e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r24
	.word 0xba02000f  ! 4: ADD_R	add 	%r8, %r15, %r29
	.word 0xae30800d  ! 4: ORN_R	orn 	%r2, %r13, %r23
	.word 0xbc00c00e  ! 4: ADD_R	add 	%r3, %r14, %r30
	.word 0xbd312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r30
thr3_nuke_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_186), 16, 16)) -> intp(0, 2, 1)
	.word 0xab28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r21
thr3_resum_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_186), 16, 16)) -> intp(0, 3, 1)
	.word 0xb930a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r28
	.word 0xb2c16dfe  ! 4: ADDCcc_I	addccc 	%r5, 0x0dfe, %r25
thr3_nuke_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_187), 16, 16)) -> intp(1, 2, 1)
	.word 0xb939500e  ! 4: SRAX_R	srax	%r5, %r14, %r28
	.word 0xaa08c00d  ! 4: AND_R	and 	%r3, %r13, %r21
	.word 0xba00edb5  ! 4: ADD_I	add 	%r3, 0x0db5, %r29
	.word 0xb8b8c00b  ! 4: XNORcc_R	xnorcc 	%r3, %r11, %r28
	.word 0xb030c00b  ! 4: ORN_R	orn 	%r3, %r11, %r24
	.word 0xb032000f  ! 4: ORN_R	orn 	%r8, %r15, %r24
thr3_resum_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc816fd8  ! 4: ADDcc_I	addcc 	%r5, 0x0fd8, %r30
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xba99400b  ! 4: XORcc_R	xorcc 	%r5, %r11, %r29
thr3_hw_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_188), 16, 16)) -> intp(1, 0, 1)
	.word 0xb608a8da  ! 4: AND_I	and 	%r2, 0x08da, %r27
	.word 0xb299800e  ! 4: XORcc_R	xorcc 	%r6, %r14, %r25
	.word 0xbb30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r29
	.word 0xbd3a100e  ! 4: SRAX_R	srax	%r8, %r14, %r30
	.word 0xb2b0aa43  ! 4: ORNcc_I	orncc 	%r2, 0x0a43, %r25
	.word 0xb839af51  ! 4: XNOR_I	xnor 	%r6, 0x0f51, %r28
thr3_hw_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_189), 16, 16)) -> intp(0, 0, 1)
	.word 0xbcb0ef63  ! 4: ORNcc_I	orncc 	%r3, 0x0f63, %r30
	.word 0xb010800f  ! 4: OR_R	or 	%r2, %r15, %r24
	.word 0xb441efae  ! 4: ADDC_I	addc 	%r7, 0x0fae, %r26
	.word 0xb631c00e  ! 4: ORN_R	orn 	%r7, %r14, %r27
	.word 0xab31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r21
	.word 0xbc90e939  ! 4: ORcc_I	orcc 	%r3, 0x0939, %r30
thr3_hw_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_190), 16, 16)) -> intp(0, 0, 1)
	.word 0xb92a100d  ! 4: SLLX_R	sllx	%r8, %r13, %r28
	.word 0xacc1400a  ! 4: ADDCcc_R	addccc 	%r5, %r10, %r22
	.word 0xac31af01  ! 4: ORN_I	orn 	%r6, 0x0f01, %r22
	.word 0xba09acbc  ! 4: AND_I	and 	%r6, 0x0cbc, %r29
	.word 0xb5296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r26
	.word 0xb164180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa802000e  ! 4: ADD_R	add 	%r8, %r14, %r20
thr3_nuke_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_191), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8c1e64a  ! 4: ADDCcc_I	addccc 	%r7, 0x064a, %r28
	.word 0xba122894  ! 4: OR_I	or 	%r8, 0x0894, %r29
	.word 0xbd792401  ! 4: MOVR_I	move	%r4, 0x894, %r30
thr3_resum_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_191), 16, 16)) -> intp(0, 3, 1)
	.word 0xae88e3b3  ! 4: ANDcc_I	andcc 	%r3, 0x03b3, %r23
	.word 0xb331800a  ! 4: SRL_R	srl 	%r6, %r10, %r25
	.word 0xab31000a  ! 4: SRL_R	srl 	%r4, %r10, %r21
thr3_nuke_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_192), 16, 16)) -> intp(0, 2, 1)
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbc19400c  ! 4: XOR_R	xor 	%r5, %r12, %r30
	.word 0xb564180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa899e174  ! 4: XORcc_I	xorcc 	%r7, 0x0174, %r20
	.word 0xb691e26d  ! 4: ORcc_I	orcc 	%r7, 0x026d, %r27
thr3_resum_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_192), 16, 16)) -> intp(0, 3, 1)
	.word 0xba92270f  ! 4: ORcc_I	orcc 	%r8, 0x070f, %r29
	.word 0xab29900e  ! 4: SLLX_R	sllx	%r6, %r14, %r21
	.word 0xba81e7ff  ! 4: ADDcc_I	addcc 	%r7, 0x07ff, %r29
	.word 0xa964180c  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_193), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r23
	.word 0xb0b8e3bf  ! 4: XNORcc_I	xnorcc 	%r3, 0x03bf, %r24
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa9a000e  ! 4: XORcc_R	xorcc 	%r8, %r14, %r21
	.word 0xb6c16c28  ! 4: ADDCcc_I	addccc 	%r5, 0x0c28, %r27
	.word 0xb178e401  ! 4: MOVR_I	move	%r3, 0xc28, %r24
thr3_resum_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193), 16, 16)) -> intp(0, 3, 1)
	.word 0xb831c00a  ! 4: ORN_R	orn 	%r7, %r10, %r28
	.word 0xa830c00b  ! 4: ORN_R	orn 	%r3, %r11, %r20
	.word 0xae00ef26  ! 4: ADD_I	add 	%r3, 0x0f26, %r23
	.word 0xbc01000d  ! 4: ADD_R	add 	%r4, %r13, %r30
thr3_nuke_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_194), 16, 16)) -> intp(1, 2, 1)
	.word 0xb488800d  ! 4: ANDcc_R	andcc 	%r2, %r13, %r26
	.word 0xb229aeb3  ! 4: ANDN_I	andn 	%r6, 0x0eb3, %r25
	.word 0xa8a9613f  ! 4: ANDNcc_I	andncc 	%r5, 0x013f, %r20
thr3_resum_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_194), 16, 16)) -> intp(1, 3, 1)
	.word 0xa889400e  ! 4: ANDcc_R	andcc 	%r5, %r14, %r20
	.word 0xab796401  ! 4: MOVR_I	move	%r5, 0xe, %r21
	.word 0xb081800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r24
thr3_hw_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_195), 16, 16)) -> intp(1, 0, 1)
	.word 0xb011ea52  ! 4: OR_I	or 	%r7, 0x0a52, %r24
	.word 0xaa896b6b  ! 4: ANDcc_I	andcc 	%r5, 0x0b6b, %r21
	.word 0xac40efbd  ! 4: ADDC_I	addc 	%r3, 0x0fbd, %r22
	.word 0xae292ecd  ! 4: ANDN_I	andn 	%r4, 0x0ecd, %r23
	.word 0xb499eddd  ! 4: XORcc_I	xorcc 	%r7, 0x0ddd, %r26
	.word 0xbb28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r29
	.word 0xab392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r21
thr3_nuke_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_196), 16, 16)) -> intp(1, 2, 1)
	.word 0xaf392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r23
	.word 0xad39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r22
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb179040b  ! 4: MOVR_R	move	%r4, %r11, %r24
thr3_resum_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196), 16, 16)) -> intp(1, 3, 1)
	.word 0xbac1ed96  ! 4: ADDCcc_I	addccc 	%r7, 0x0d96, %r29
thr3_hw_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_197), 16, 16)) -> intp(1, 0, 1)
	.word 0xab317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r21
	.word 0xb0b9400a  ! 4: XNORcc_R	xnorcc 	%r5, %r10, %r24
	.word 0xb889000c  ! 4: ANDcc_R	andcc 	%r4, %r12, %r28
	.word 0xac30edc3  ! 4: ORN_I	orn 	%r3, 0x0dc3, %r22
	.word 0xbab16cb3  ! 4: ORNcc_I	orncc 	%r5, 0x0cb3, %r29
	.word 0xb028eb69  ! 4: ANDN_I	andn 	%r3, 0x0b69, %r24
	.word 0xb539400b  ! 4: SRA_R	sra 	%r5, %r11, %r26
thr3_hw_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_198), 16, 16)) -> intp(1, 0, 1)
	.word 0xac01400d  ! 4: ADD_R	add 	%r5, %r13, %r22
	.word 0xbb79840f  ! 4: MOVR_R	move	%r6, %r15, %r29
	.word 0xb2812e2a  ! 4: ADDcc_I	addcc 	%r4, 0x0e2a, %r25
	.word 0xa8b9a771  ! 4: XNORcc_I	xnorcc 	%r6, 0x0771, %r20
	.word 0xae81000f  ! 4: ADDcc_R	addcc 	%r4, %r15, %r23
	.word 0xa888e189  ! 4: ANDcc_I	andcc 	%r3, 0x0189, %r20
thr3_hw_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_199), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4422910  ! 4: ADDC_I	addc 	%r8, 0x0910, %r26
	.word 0xb139900b  ! 4: SRAX_R	srax	%r6, %r11, %r24
	.word 0xb328d00a  ! 4: SLLX_R	sllx	%r3, %r10, %r25
	.word 0xab39800b  ! 4: SRA_R	sra 	%r6, %r11, %r21
	.word 0xa809000b  ! 4: AND_R	and 	%r4, %r11, %r20
	.word 0xba09a2a2  ! 4: AND_I	and 	%r6, 0x02a2, %r29
	.word 0xba19c00f  ! 4: XOR_R	xor 	%r7, %r15, %r29
thr3_hw_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_200), 16, 16)) -> intp(1, 0, 1)
	.word 0xb689290a  ! 4: ANDcc_I	andcc 	%r4, 0x090a, %r27
	.word 0xa8a8800c  ! 4: ANDNcc_R	andncc 	%r2, %r12, %r20
	.word 0xb090acaa  ! 4: ORcc_I	orcc 	%r2, 0x0caa, %r24
	.word 0xa811c00a  ! 4: OR_R	or 	%r7, %r10, %r20
	.word 0xaec2000f  ! 4: ADDCcc_R	addccc 	%r8, %r15, %r23
	.word 0xb6b9400f  ! 4: XNORcc_R	xnorcc 	%r5, %r15, %r27
thr3_nuke_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_201), 16, 16)) -> intp(1, 2, 1)
	.word 0xb631c00f  ! 4: ORN_R	orn 	%r7, %r15, %r27
	.word 0xaab1400f  ! 4: ORNcc_R	orncc 	%r5, %r15, %r21
	.word 0xba916297  ! 4: ORcc_I	orcc 	%r5, 0x0297, %r29
thr3_resum_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_201), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb39900d  ! 4: SRAX_R	srax	%r6, %r13, %r29
	.word 0xaa29000c  ! 4: ANDN_R	andn 	%r4, %r12, %r21
	.word 0xbcb0ae3a  ! 4: ORNcc_I	orncc 	%r2, 0x0e3a, %r30
	.word 0xa88a000a  ! 4: ANDcc_R	andcc 	%r8, %r10, %r20
thr3_nuke_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_202), 16, 16)) -> intp(0, 2, 1)
	.word 0xacb1400b  ! 4: ORNcc_R	orncc 	%r5, %r11, %r22
	.word 0xb7396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r27
	.word 0xa828c00a  ! 4: ANDN_R	andn 	%r3, %r10, %r20
	.word 0xaec1a9c0  ! 4: ADDCcc_I	addccc 	%r6, 0x09c0, %r23
thr3_resum_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_202), 16, 16)) -> intp(0, 3, 1)
	.word 0xad7a040e  ! 4: MOVR_R	move	%r8, %r14, %r22
	.word 0xba29ebab  ! 4: ANDN_I	andn 	%r7, 0x0bab, %r29
thr3_hw_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_203), 16, 16)) -> intp(1, 0, 1)
	.word 0xb018800c  ! 4: XOR_R	xor 	%r2, %r12, %r24
	.word 0xb601400a  ! 4: ADD_R	add 	%r5, %r10, %r27
	.word 0xb2c1eae7  ! 4: ADDCcc_I	addccc 	%r7, 0x0ae7, %r25
	.word 0xb0b9800f  ! 4: XNORcc_R	xnorcc 	%r6, %r15, %r24
	.word 0xba00edcc  ! 4: ADD_I	add 	%r3, 0x0dcc, %r29
	.word 0xb938800d  ! 4: SRA_R	sra 	%r2, %r13, %r28
thr3_hw_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_204), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r29
	.word 0xbc01eafb  ! 4: ADD_I	add 	%r7, 0x0afb, %r30
	.word 0xb5796401  ! 4: MOVR_I	move	%r5, 0xfffffefb, %r26
	.word 0xb6c16292  ! 4: ADDCcc_I	addccc 	%r5, 0x0292, %r27
	.word 0xb4422706  ! 4: ADDC_I	addc 	%r8, 0x0706, %r26
	.word 0xb838ab47  ! 4: XNOR_I	xnor 	%r2, 0x0b47, %r28
thr3_nuke_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_205), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc29000e  ! 4: ANDN_R	andn 	%r4, %r14, %r30
	.word 0xb2b1800a  ! 4: ORNcc_R	orncc 	%r6, %r10, %r25
thr3_resum_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_205), 16, 16)) -> intp(1, 3, 1)
	.word 0xae89000a  ! 4: ANDcc_R	andcc 	%r4, %r10, %r23
thr3_hw_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_206), 16, 16)) -> intp(1, 0, 1)
	.word 0xbac1400a  ! 4: ADDCcc_R	addccc 	%r5, %r10, %r29
	.word 0xb08128a6  ! 4: ADDcc_I	addcc 	%r4, 0x08a6, %r24
	.word 0xb4b1800d  ! 4: ORNcc_R	orncc 	%r6, %r13, %r26
	.word 0xb3322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r25
	.word 0xb299000e  ! 4: XORcc_R	xorcc 	%r4, %r14, %r25
	.word 0xba10a049  ! 4: OR_I	or 	%r2, 0x0049, %r29
	.word 0xb810800a  ! 4: OR_R	or 	%r2, %r10, %r28
thr3_nuke_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_207), 16, 16)) -> intp(0, 2, 1)
	.word 0xb48928ee  ! 4: ANDcc_I	andcc 	%r4, 0x08ee, %r26
	.word 0xb338d00b  ! 4: SRAX_R	srax	%r3, %r11, %r25
thr3_resum_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_207), 16, 16)) -> intp(0, 3, 1)
	.word 0xb209c00b  ! 4: AND_R	and 	%r7, %r11, %r25
	.word 0xb010800d  ! 4: OR_R	or 	%r2, %r13, %r24
thr3_nuke_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_208), 16, 16)) -> intp(1, 2, 1)
	.word 0xb7316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r27
thr3_resum_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_208), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2aa000c  ! 4: ANDNcc_R	andncc 	%r8, %r12, %r25
	.word 0xb4b9c00d  ! 4: XNORcc_R	xnorcc 	%r7, %r13, %r26
	.word 0xaa1160e9  ! 4: OR_I	or 	%r5, 0x00e9, %r21
	.word 0xae01c00d  ! 4: ADD_R	add 	%r7, %r13, %r23
thr3_nuke_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_209), 16, 16)) -> intp(0, 2, 1)
	.word 0xad31800a  ! 4: SRL_R	srl 	%r6, %r10, %r22
	.word 0xb69a2d1b  ! 4: XORcc_I	xorcc 	%r8, 0x0d1b, %r27
	.word 0xb841000e  ! 4: ADDC_R	addc 	%r4, %r14, %r28
thr3_resum_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_209), 16, 16)) -> intp(0, 3, 1)
	.word 0xac10ab3c  ! 4: OR_I	or 	%r2, 0x0b3c, %r22
	.word 0xbc322405  ! 4: ORN_I	orn 	%r8, 0x0405, %r30
	.word 0xad28c00d  ! 4: SLL_R	sll 	%r3, %r13, %r22
	.word 0xbac2000a  ! 4: ADDCcc_R	addccc 	%r8, %r10, %r29
thr3_nuke_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_210), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd79e401  ! 4: MOVR_I	move	%r7, 0xa, %r30
	.word 0xbd30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r30
thr3_resum_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210), 16, 16)) -> intp(1, 3, 1)
	.word 0xba39000d  ! 4: XNOR_R	xnor 	%r4, %r13, %r29
thr3_hw_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_211), 16, 16)) -> intp(0, 0, 1)
	.word 0xac18a134  ! 4: XOR_I	xor 	%r2, 0x0134, %r22
	.word 0xbc40a2a3  ! 4: ADDC_I	addc 	%r2, 0x02a3, %r30
	.word 0xaf31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r23
	.word 0xb731b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r27
	.word 0xb529d00d  ! 4: SLLX_R	sllx	%r7, %r13, %r26
	.word 0xb281c00c  ! 4: ADDcc_R	addcc 	%r7, %r12, %r25
thr3_nuke_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_212), 16, 16)) -> intp(1, 2, 1)
	.word 0xb4b8ef2f  ! 4: XNORcc_I	xnorcc 	%r3, 0x0f2f, %r26
	.word 0xbd64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa881400a  ! 4: ADDcc_R	addcc 	%r5, %r10, %r20
thr3_resum_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa4228af  ! 4: ADDC_I	addc 	%r8, 0x08af, %r21
	.word 0xb6296b96  ! 4: ANDN_I	andn 	%r5, 0x0b96, %r27
	.word 0xad29100f  ! 4: SLLX_R	sllx	%r4, %r15, %r22
thr3_hw_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_213), 16, 16)) -> intp(0, 0, 1)
	.word 0xb9323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xbcc0e2ea  ! 4: ADDCcc_I	addccc 	%r3, 0x02ea, %r30
	.word 0xae10ee84  ! 4: OR_I	or 	%r3, 0x0e84, %r23
	.word 0xb098e49c  ! 4: XORcc_I	xorcc 	%r3, 0x049c, %r24
	.word 0xb4aa2087  ! 4: ANDNcc_I	andncc 	%r8, 0x0087, %r26
	.word 0xb8b9e040  ! 4: XNORcc_I	xnorcc 	%r7, 0x0040, %r28
thr3_nuke_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_214), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa98aeff  ! 4: XORcc_I	xorcc 	%r2, 0x0eff, %r21
	.word 0xbc82000f  ! 4: ADDcc_R	addcc 	%r8, %r15, %r30
	.word 0xae322021  ! 4: ORN_I	orn 	%r8, 0x0021, %r23
thr3_resum_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_214), 16, 16)) -> intp(1, 3, 1)
	.word 0xad38800a  ! 4: SRA_R	sra 	%r2, %r10, %r22
	.word 0xbc88e509  ! 4: ANDcc_I	andcc 	%r3, 0x0509, %r30
thr3_hw_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_215), 16, 16)) -> intp(0, 0, 1)
	.word 0xab28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r21
	.word 0xba2a2f60  ! 4: ANDN_I	andn 	%r8, 0x0f60, %r29
	.word 0xb0aa000a  ! 4: ANDNcc_R	andncc 	%r8, %r10, %r24
	.word 0xad38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r22
	.word 0xb530800f  ! 4: SRL_R	srl 	%r2, %r15, %r26
	.word 0xaa98c00a  ! 4: XORcc_R	xorcc 	%r3, %r10, %r21
	.word 0xb439400d  ! 4: XNOR_R	xnor 	%r5, %r13, %r26
thr3_hw_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_216), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa18800c  ! 4: XOR_R	xor 	%r2, %r12, %r21
	.word 0xba8a000e  ! 4: ANDcc_R	andcc 	%r8, %r14, %r29
	.word 0xb329500f  ! 4: SLLX_R	sllx	%r5, %r15, %r25
	.word 0xad29f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r22
	.word 0xb539c00b  ! 4: SRA_R	sra 	%r7, %r11, %r26
	.word 0xb8412f9c  ! 4: ADDC_I	addc 	%r4, 0x0f9c, %r28
thr3_hw_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_217), 16, 16)) -> intp(0, 0, 1)
	.word 0xa828ebe9  ! 4: ANDN_I	andn 	%r3, 0x0be9, %r20
	.word 0xac18800b  ! 4: XOR_R	xor 	%r2, %r11, %r22
	.word 0xaf392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r23
	.word 0xbd39000c  ! 4: SRA_R	sra 	%r4, %r12, %r30
	.word 0xb891000d  ! 4: ORcc_R	orcc 	%r4, %r13, %r28
	.word 0xaf30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r23
	.word 0xae88a111  ! 4: ANDcc_I	andcc 	%r2, 0x0111, %r23
thr3_hw_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_218), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa40c00e  ! 4: ADDC_R	addc 	%r3, %r14, %r21
	.word 0xb0312641  ! 4: ORN_I	orn 	%r4, 0x0641, %r24
	.word 0xac01c00a  ! 4: ADD_R	add 	%r7, %r10, %r22
	.word 0xb48227e7  ! 4: ADDcc_I	addcc 	%r8, 0x07e7, %r26
	.word 0xb281c00b  ! 4: ADDcc_R	addcc 	%r7, %r11, %r25
	.word 0xaf78e401  ! 4: MOVR_I	move	%r3, 0xb, %r23
	.word 0xbd312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r30
thr3_hw_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_219), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbc89400a  ! 4: ANDcc_R	andcc 	%r5, %r10, %r30
	.word 0xb691000d  ! 4: ORcc_R	orcc 	%r4, %r13, %r27
	.word 0xa8b96a2c  ! 4: XNORcc_I	xnorcc 	%r5, 0x0a2c, %r20
	.word 0xb80161de  ! 4: ADD_I	add 	%r5, 0x01de, %r28
	.word 0xbd39500b  ! 4: SRAX_R	srax	%r5, %r11, %r30
	.word 0xbcc0aa14  ! 4: ADDCcc_I	addccc 	%r2, 0x0a14, %r30
thr3_nuke_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_220), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa838c00c  ! 4: XNOR_R	xnor 	%r3, %r12, %r20
	.word 0xb208ee31  ! 4: AND_I	and 	%r3, 0x0e31, %r25
	.word 0xb081c00e  ! 4: ADDcc_R	addcc 	%r7, %r14, %r24
	.word 0xb8a8800f  ! 4: ANDNcc_R	andncc 	%r2, %r15, %r28
	.word 0xb0c1e95a  ! 4: ADDCcc_I	addccc 	%r7, 0x095a, %r24
	.word 0xae0a000b  ! 4: AND_R	and 	%r8, %r11, %r23
thr3_resum_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_220), 16, 16)) -> intp(0, 3, 1)
	.word 0xb529e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r26
	.word 0xa929800d  ! 4: SLL_R	sll 	%r6, %r13, %r20
	.word 0xb609000c  ! 4: AND_R	and 	%r4, %r12, %r27
	.word 0xb400efd1  ! 4: ADD_I	add 	%r3, 0x0fd1, %r26
thr3_nuke_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_221), 16, 16)) -> intp(0, 2, 1)
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
	.word 0xbb79e401  ! 4: MOVR_I	move	%r7, 0x1, %r29
thr3_resum_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_221), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd64180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb8422bd2  ! 4: ADDC_I	addc 	%r8, 0x0bd2, %r28
	.word 0xad79040e  ! 4: MOVR_R	move	%r4, %r14, %r22
	.word 0xb0b0a6c1  ! 4: ORNcc_I	orncc 	%r2, 0x06c1, %r24
thr3_nuke_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_222), 16, 16)) -> intp(0, 2, 1)
	.word 0xbc31a65b  ! 4: ORN_I	orn 	%r6, 0x065b, %r30
	.word 0xb764180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xacb1000b  ! 4: ORNcc_R	orncc 	%r4, %r11, %r22
	.word 0xa889c00a  ! 4: ANDcc_R	andcc 	%r7, %r10, %r20
	.word 0xaa98ae77  ! 4: XORcc_I	xorcc 	%r2, 0x0e77, %r21
thr3_resum_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_222), 16, 16)) -> intp(0, 3, 1)
	.word 0xba18c00d  ! 4: XOR_R	xor 	%r3, %r13, %r29
	.word 0xb939e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r28
	.word 0xa829eb56  ! 4: ANDN_I	andn 	%r7, 0x0b56, %r20
	.word 0xb2c16610  ! 4: ADDCcc_I	addccc 	%r5, 0x0610, %r25
thr3_hw_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_223), 16, 16)) -> intp(0, 0, 1)
	.word 0xaaaa000b  ! 4: ANDNcc_R	andncc 	%r8, %r11, %r21
	.word 0xaa39800a  ! 4: XNOR_R	xnor 	%r6, %r10, %r21
	.word 0xbd30f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r30
	.word 0xb964180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa88a337  ! 4: ANDcc_I	andcc 	%r2, 0x0337, %r21
	.word 0xb890a0e5  ! 4: ORcc_I	orcc 	%r2, 0x00e5, %r28
thr3_hw_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_224), 16, 16)) -> intp(0, 0, 1)
	.word 0xb292000b  ! 4: ORcc_R	orcc 	%r8, %r11, %r25
	.word 0xb328b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r25
	.word 0xae28ac37  ! 4: ANDN_I	andn 	%r2, 0x0c37, %r23
	.word 0xb8b16e59  ! 4: ORNcc_I	orncc 	%r5, 0x0e59, %r28
	.word 0xac81000e  ! 4: ADDcc_R	addcc 	%r4, %r14, %r22
	.word 0xb32a000a  ! 4: SLL_R	sll 	%r8, %r10, %r25
	.word 0xb698a775  ! 4: XORcc_I	xorcc 	%r2, 0x0775, %r27
thr3_nuke_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_225), 16, 16)) -> intp(1, 2, 1)
	.word 0xba2921b7  ! 4: ANDN_I	andn 	%r4, 0x01b7, %r29
	.word 0xaeb1acc2  ! 4: ORNcc_I	orncc 	%r6, 0x0cc2, %r23
	.word 0xacb8abc3  ! 4: XNORcc_I	xnorcc 	%r2, 0x0bc3, %r22
	.word 0xb69a000a  ! 4: XORcc_R	xorcc 	%r8, %r10, %r27
	.word 0xb2c0add6  ! 4: ADDCcc_I	addccc 	%r2, 0x0dd6, %r25
	.word 0xb609000b  ! 4: AND_R	and 	%r4, %r11, %r27
thr3_resum_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_225), 16, 16)) -> intp(1, 3, 1)
	.word 0xbcb22ef6  ! 4: ORNcc_I	orncc 	%r8, 0x0ef6, %r30
	.word 0xa829400e  ! 4: ANDN_R	andn 	%r5, %r14, %r20
	.word 0xb601c00f  ! 4: ADD_R	add 	%r7, %r15, %r27
	.word 0xb778c40b  ! 4: MOVR_R	move	%r3, %r11, %r27
thr3_hw_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_226), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r29
	.word 0xb331900b  ! 4: SRLX_R	srlx	%r6, %r11, %r25
	.word 0xae90800e  ! 4: ORcc_R	orcc 	%r2, %r14, %r23
	.word 0xb491c00c  ! 4: ORcc_R	orcc 	%r7, %r12, %r26
	.word 0xaeaa252f  ! 4: ANDNcc_I	andncc 	%r8, 0x052f, %r23
	.word 0xb438c00e  ! 4: XNOR_R	xnor 	%r3, %r14, %r26
thr3_nuke_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_227), 16, 16)) -> intp(1, 2, 1)
	.word 0xba89c00b  ! 4: ANDcc_R	andcc 	%r7, %r11, %r29
	.word 0xba91e03e  ! 4: ORcc_I	orcc 	%r7, 0x003e, %r29
thr3_resum_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_227), 16, 16)) -> intp(1, 3, 1)
	.word 0xb63a2bd3  ! 4: XNOR_I	xnor 	%r8, 0x0bd3, %r27
	.word 0xae00aba4  ! 4: ADD_I	add 	%r2, 0x0ba4, %r23
	.word 0xb839400d  ! 4: XNOR_R	xnor 	%r5, %r13, %r28
	.word 0xaa31c00b  ! 4: ORN_R	orn 	%r7, %r11, %r21
thr3_hw_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_228), 16, 16)) -> intp(0, 0, 1)
	.word 0xba922e31  ! 4: ORcc_I	orcc 	%r8, 0x0e31, %r29
	.word 0xad28d00b  ! 4: SLLX_R	sllx	%r3, %r11, %r22
	.word 0xaab0800d  ! 4: ORNcc_R	orncc 	%r2, %r13, %r21
	.word 0xb401c00f  ! 4: ADD_R	add 	%r7, %r15, %r26
	.word 0xae88c00e  ! 4: ANDcc_R	andcc 	%r3, %r14, %r23
	.word 0xb609e5e3  ! 4: AND_I	and 	%r7, 0x05e3, %r27
	.word 0xacb1800b  ! 4: ORNcc_R	orncc 	%r6, %r11, %r22
thr3_hw_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_229), 16, 16)) -> intp(1, 0, 1)
	.word 0xaab1c00e  ! 4: ORNcc_R	orncc 	%r7, %r14, %r21
	.word 0xb8996ebe  ! 4: XORcc_I	xorcc 	%r5, 0x0ebe, %r28
	.word 0xa810e16c  ! 4: OR_I	or 	%r3, 0x016c, %r20
	.word 0xac19669f  ! 4: XOR_I	xor 	%r5, 0x069f, %r22
	.word 0xae11000f  ! 4: OR_R	or 	%r4, %r15, %r23
	.word 0xb0b9400b  ! 4: XNORcc_R	xnorcc 	%r5, %r11, %r24
thr3_hw_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_230), 16, 16)) -> intp(0, 0, 1)
	.word 0xac01c00e  ! 4: ADD_R	add 	%r7, %r14, %r22
	.word 0xac996d27  ! 4: XORcc_I	xorcc 	%r5, 0x0d27, %r22
	.word 0xb139100b  ! 4: SRAX_R	srax	%r4, %r11, %r24
	.word 0xbc30a3ae  ! 4: ORN_I	orn 	%r2, 0x03ae, %r30
	.word 0xbc02000a  ! 4: ADD_R	add 	%r8, %r10, %r30
	.word 0xaa81800b  ! 4: ADDcc_R	addcc 	%r6, %r11, %r21
thr3_hw_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_231), 16, 16)) -> intp(0, 0, 1)
	.word 0xb6a8c00c  ! 4: ANDNcc_R	andncc 	%r3, %r12, %r27
	.word 0xb531f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r26
	.word 0xb578a401  ! 4: MOVR_I	move	%r2, 0x1, %r26
	.word 0xaeb9acff  ! 4: XNORcc_I	xnorcc 	%r6, 0x0cff, %r23
	.word 0xaa01e76a  ! 4: ADD_I	add 	%r7, 0x076a, %r21
	.word 0xb03966ba  ! 4: XNOR_I	xnor 	%r5, 0x06ba, %r24
thr3_hw_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_232), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf30900a  ! 4: SRLX_R	srlx	%r2, %r10, %r23
	.word 0xbcc1400f  ! 4: ADDCcc_R	addccc 	%r5, %r15, %r30
	.word 0xac38e89e  ! 4: XNOR_I	xnor 	%r3, 0x089e, %r22
	.word 0xa9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r20
	.word 0xb978e401  ! 4: MOVR_I	move	%r3, 0x1, %r28
	.word 0xbd79e401  ! 4: MOVR_I	move	%r7, 0x1, %r30
thr3_nuke_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_233), 16, 16)) -> intp(1, 2, 1)
	.word 0xb018800a  ! 4: XOR_R	xor 	%r2, %r10, %r24
thr3_resum_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233), 16, 16)) -> intp(1, 3, 1)
	.word 0xaec162db  ! 4: ADDCcc_I	addccc 	%r5, 0x02db, %r23
	.word 0xb2b1ec73  ! 4: ORNcc_I	orncc 	%r7, 0x0c73, %r25
thr3_nuke_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_234), 16, 16)) -> intp(0, 2, 1)
	.word 0xacb92125  ! 4: XNORcc_I	xnorcc 	%r4, 0x0125, %r22
	.word 0xbd39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r30
	.word 0xba29e183  ! 4: ANDN_I	andn 	%r7, 0x0183, %r29
	.word 0xb0916651  ! 4: ORcc_I	orcc 	%r5, 0x0651, %r24
thr3_resum_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_234), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb29500c  ! 4: SLLX_R	sllx	%r5, %r12, %r29
thr3_hw_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_235), 16, 16)) -> intp(1, 0, 1)
	.word 0xb928b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r28
	.word 0xb529b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r26
	.word 0xb618aabb  ! 4: XOR_I	xor 	%r2, 0x0abb, %r27
	.word 0xb211e7aa  ! 4: OR_I	or 	%r7, 0x07aa, %r25
	.word 0xac91a62e  ! 4: ORcc_I	orcc 	%r6, 0x062e, %r22
	.word 0xb888a3a8  ! 4: ANDcc_I	andcc 	%r2, 0x03a8, %r28
thr3_hw_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_236), 16, 16)) -> intp(1, 0, 1)
	.word 0xa841400b  ! 4: ADDC_R	addc 	%r5, %r11, %r20
	.word 0xb001eb36  ! 4: ADD_I	add 	%r7, 0x0b36, %r24
	.word 0xa841000e  ! 4: ADDC_R	addc 	%r4, %r14, %r20
	.word 0xbd29a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r30
	.word 0xad31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r22
	.word 0xb0c22585  ! 4: ADDCcc_I	addccc 	%r8, 0x0585, %r24
	.word 0xb578a401  ! 4: MOVR_I	move	%r2, 0x585, %r26
thr3_nuke_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_237), 16, 16)) -> intp(1, 2, 1)
	.word 0xb21a2dcf  ! 4: XOR_I	xor 	%r8, 0x0dcf, %r25
	.word 0xaf292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r23
	.word 0xbac1000b  ! 4: ADDCcc_R	addccc 	%r4, %r11, %r29
	.word 0xb8b8e50a  ! 4: XNORcc_I	xnorcc 	%r3, 0x050a, %r28
	.word 0xb739c00a  ! 4: SRA_R	sra 	%r7, %r10, %r27
	.word 0xbc996b78  ! 4: XORcc_I	xorcc 	%r5, 0x0b78, %r30
thr3_resum_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_237), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6b22933  ! 4: ORNcc_I	orncc 	%r8, 0x0933, %r27
	.word 0xb979c40e  ! 4: MOVR_R	move	%r7, %r14, %r28
	.word 0xaa88aa24  ! 4: ANDcc_I	andcc 	%r2, 0x0a24, %r21
	.word 0xb689400c  ! 4: ANDcc_R	andcc 	%r5, %r12, %r27
thr3_hw_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_238), 16, 16)) -> intp(0, 0, 1)
	.word 0xacc0800f  ! 4: ADDCcc_R	addccc 	%r2, %r15, %r22
	.word 0xbd78a401  ! 4: MOVR_I	move	%r2, 0xf, %r30
	.word 0xba31c00c  ! 4: ORN_R	orn 	%r7, %r12, %r29
	.word 0xa8b1ecd0  ! 4: ORNcc_I	orncc 	%r7, 0x0cd0, %r20
	.word 0xb0c1a2ac  ! 4: ADDCcc_I	addccc 	%r6, 0x02ac, %r24
	.word 0xac99000b  ! 4: XORcc_R	xorcc 	%r4, %r11, %r22
thr3_hw_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_239), 16, 16)) -> intp(0, 0, 1)
	.word 0xae41a959  ! 4: ADDC_I	addc 	%r6, 0x0959, %r23
	.word 0xa839400c  ! 4: XNOR_R	xnor 	%r5, %r12, %r20
	.word 0xaf38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r23
	.word 0xa9317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r20
	.word 0xbab9edc7  ! 4: XNORcc_I	xnorcc 	%r7, 0x0dc7, %r29
	.word 0xac016a37  ! 4: ADD_I	add 	%r5, 0x0a37, %r22
thr3_hw_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_240), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r27
	.word 0xbaa9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r29
	.word 0xb091a0e1  ! 4: ORcc_I	orcc 	%r6, 0x00e1, %r24
	.word 0xba29258d  ! 4: ANDN_I	andn 	%r4, 0x058d, %r29
	.word 0xa892000d  ! 4: ORcc_R	orcc 	%r8, %r13, %r20
	.word 0xbd28c00f  ! 4: SLL_R	sll 	%r3, %r15, %r30
	.word 0xb531f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r26
thr3_hw_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_241), 16, 16)) -> intp(0, 0, 1)
	.word 0xb538800d  ! 4: SRA_R	sra 	%r2, %r13, %r26
	.word 0xac38a470  ! 4: XNOR_I	xnor 	%r2, 0x0470, %r22
	.word 0xb131800c  ! 4: SRL_R	srl 	%r6, %r12, %r24
	.word 0xa8b1699a  ! 4: ORNcc_I	orncc 	%r5, 0x099a, %r20
	.word 0xac8a2188  ! 4: ANDcc_I	andcc 	%r8, 0x0188, %r22
	.word 0xa881000a  ! 4: ADDcc_R	addcc 	%r4, %r10, %r20
	.word 0xb029800e  ! 4: ANDN_R	andn 	%r6, %r14, %r24
thr3_hw_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_242), 16, 16)) -> intp(1, 0, 1)
	.word 0xb011400b  ! 4: OR_R	or 	%r5, %r11, %r24
	.word 0xa938a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r20
	.word 0xb031800a  ! 4: ORN_R	orn 	%r6, %r10, %r24
	.word 0xbb31c00e  ! 4: SRL_R	srl 	%r7, %r14, %r29
	.word 0xb8c2000e  ! 4: ADDCcc_R	addccc 	%r8, %r14, %r28
	.word 0xbd322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r30
thr3_hw_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_243), 16, 16)) -> intp(1, 0, 1)
	.word 0xb641aacc  ! 4: ADDC_I	addc 	%r6, 0x0acc, %r27
	.word 0xb939800a  ! 4: SRA_R	sra 	%r6, %r10, %r28
	.word 0xbb64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbcb2000a  ! 4: ORNcc_R	orncc 	%r8, %r10, %r30
	.word 0xac10800f  ! 4: OR_R	or 	%r2, %r15, %r22
	.word 0xb331e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r25
thr3_hw_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_244), 16, 16)) -> intp(0, 0, 1)
	.word 0xb428800c  ! 4: ANDN_R	andn 	%r2, %r12, %r26
	.word 0xb8b9800a  ! 4: XNORcc_R	xnorcc 	%r6, %r10, %r28
	.word 0xb282000a  ! 4: ADDcc_R	addcc 	%r8, %r10, %r25
	.word 0xb338d00d  ! 4: SRAX_R	srax	%r3, %r13, %r25
	.word 0xb339c00b  ! 4: SRA_R	sra 	%r7, %r11, %r25
	.word 0xbcba25b8  ! 4: XNORcc_I	xnorcc 	%r8, 0x05b8, %r30
thr3_nuke_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_245), 16, 16)) -> intp(0, 2, 1)
	.word 0xac39800d  ! 4: XNOR_R	xnor 	%r6, %r13, %r22
	.word 0xb428a365  ! 4: ANDN_I	andn 	%r2, 0x0365, %r26
	.word 0xacc1000f  ! 4: ADDCcc_R	addccc 	%r4, %r15, %r22
	.word 0xad322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r22
	.word 0xba1a000d  ! 4: XOR_R	xor 	%r8, %r13, %r29
	.word 0xb688800c  ! 4: ANDcc_R	andcc 	%r2, %r12, %r27
thr3_resum_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_245), 16, 16)) -> intp(0, 3, 1)
	.word 0xab31400d  ! 4: SRL_R	srl 	%r5, %r13, %r21
	.word 0xba80800f  ! 4: ADDcc_R	addcc 	%r2, %r15, %r29
	.word 0xa841800b  ! 4: ADDC_R	addc 	%r6, %r11, %r20
	.word 0xb2c2000b  ! 4: ADDCcc_R	addccc 	%r8, %r11, %r25
thr3_hw_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_246), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc2a212c  ! 4: ANDN_I	andn 	%r8, 0x012c, %r30
	.word 0xaa19800a  ! 4: XOR_R	xor 	%r6, %r10, %r21
	.word 0xbd64180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaf2a000b  ! 4: SLL_R	sll 	%r8, %r11, %r23
	.word 0xb4b8ef04  ! 4: XNORcc_I	xnorcc 	%r3, 0x0f04, %r26
thr3_nuke_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_247), 16, 16)) -> intp(1, 2, 1)
	.word 0xa939800f  ! 4: SRA_R	sra 	%r6, %r15, %r20
	.word 0xb2c1ac3d  ! 4: ADDCcc_I	addccc 	%r6, 0x0c3d, %r25
	.word 0xaeb8eeff  ! 4: XNORcc_I	xnorcc 	%r3, 0x0eff, %r23
	.word 0xb441400e  ! 4: ADDC_R	addc 	%r5, %r14, %r26
	.word 0xb12a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r24
	.word 0xba98e664  ! 4: XORcc_I	xorcc 	%r3, 0x0664, %r29
thr3_resum_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_247), 16, 16)) -> intp(1, 3, 1)
	.word 0xb964180f  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_248), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa38a49b  ! 4: XNOR_I	xnor 	%r2, 0x049b, %r21
	.word 0xb829400c  ! 4: ANDN_R	andn 	%r5, %r12, %r28
	.word 0xae31400b  ! 4: ORN_R	orn 	%r5, %r11, %r23
	.word 0xbd29b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r30
	.word 0xac99400f  ! 4: XORcc_R	xorcc 	%r5, %r15, %r22
	.word 0xb441400a  ! 4: ADDC_R	addc 	%r5, %r10, %r26
thr3_hw_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_249), 16, 16)) -> intp(1, 0, 1)
	.word 0xae81ea24  ! 4: ADDcc_I	addcc 	%r7, 0x0a24, %r23
	.word 0xb6312eaf  ! 4: ORN_I	orn 	%r4, 0x0eaf, %r27
	.word 0xb131d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r24
	.word 0xba00800d  ! 4: ADD_R	add 	%r2, %r13, %r29
	.word 0xb72a100b  ! 4: SLLX_R	sllx	%r8, %r11, %r27
	.word 0xb291c00f  ! 4: ORcc_R	orcc 	%r7, %r15, %r25
thr3_hw_intr_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_250), 16, 16)) -> intp(1, 0, 1)
	.word 0xbc29400a  ! 4: ANDN_R	andn 	%r5, %r10, %r30
	.word 0xaaa9aede  ! 4: ANDNcc_I	andncc 	%r6, 0x0ede, %r21
	.word 0xaab1000b  ! 4: ORNcc_R	orncc 	%r4, %r11, %r21
	.word 0xb528a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r26
	.word 0xbc89ee1d  ! 4: ANDcc_I	andcc 	%r7, 0x0e1d, %r30
	.word 0xb02a000a  ! 4: ANDN_R	andn 	%r8, %r10, %r24
thr3_nuke_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_251), 16, 16)) -> intp(1, 2, 1)
	.word 0xaac0a467  ! 4: ADDCcc_I	addccc 	%r2, 0x0467, %r21
	.word 0xb288ed91  ! 4: ANDcc_I	andcc 	%r3, 0x0d91, %r25
	.word 0xb201e084  ! 4: ADD_I	add 	%r7, 0x0084, %r25
	.word 0xae88e81e  ! 4: ANDcc_I	andcc 	%r3, 0x081e, %r23
	.word 0xb091af6e  ! 4: ORcc_I	orcc 	%r6, 0x0f6e, %r24
	.word 0xad78c40d  ! 4: MOVR_R	move	%r3, %r13, %r22
thr3_resum_intr_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_251), 16, 16)) -> intp(1, 3, 1)
	.word 0xb939100a  ! 4: SRAX_R	srax	%r4, %r10, %r28
	.word 0xad292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r22
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_252), 16, 16)) -> intp(1, 0, 1)
	.word 0xa939e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r20
	.word 0xac30800a  ! 4: ORN_R	orn 	%r2, %r10, %r22
	.word 0xb5323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r26
	.word 0xac92000f  ! 4: ORcc_R	orcc 	%r8, %r15, %r22
	.word 0xb0b1e33b  ! 4: ORNcc_I	orncc 	%r7, 0x033b, %r24
	.word 0xb529000f  ! 4: SLL_R	sll 	%r4, %r15, %r26
	.word 0xb8b1800b  ! 4: ORNcc_R	orncc 	%r6, %r11, %r28
thr3_nuke_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_253), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc996155  ! 4: XORcc_I	xorcc 	%r5, 0x0155, %r30
	.word 0xab39d00a  ! 4: SRAX_R	srax	%r7, %r10, %r21
	.word 0xb88161f5  ! 4: ADDcc_I	addcc 	%r5, 0x01f5, %r28
	.word 0xb60967b5  ! 4: AND_I	and 	%r5, 0x07b5, %r27
	.word 0xaf293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r23
	.word 0xb529900f  ! 4: SLLX_R	sllx	%r6, %r15, %r26
thr3_resum_intr_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_253), 16, 16)) -> intp(1, 3, 1)
	.word 0xacb1800a  ! 4: ORNcc_R	orncc 	%r6, %r10, %r22
	.word 0xb564180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa10c00c  ! 4: OR_R	or 	%r3, %r12, %r21
	.word 0xb0196150  ! 4: XOR_I	xor 	%r5, 0x0150, %r24
thr3_hw_intr_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_254), 16, 16)) -> intp(0, 0, 1)
	.word 0xb6ba000e  ! 4: XNORcc_R	xnorcc 	%r8, %r14, %r27
	.word 0xac29000a  ! 4: ANDN_R	andn 	%r4, %r10, %r22
	.word 0xab29800b  ! 4: SLL_R	sll 	%r6, %r11, %r21
	.word 0xb881000d  ! 4: ADDcc_R	addcc 	%r4, %r13, %r28
	.word 0xae30c00b  ! 4: ORN_R	orn 	%r3, %r11, %r23
	.word 0xbd38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r30
	.word 0xbac0800f  ! 4: ADDCcc_R	addccc 	%r2, %r15, %r29
thr3_hw_intr_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_255), 16, 16)) -> intp(1, 0, 1)
	.word 0xb379040d  ! 4: MOVR_R	move	%r4, %r13, %r25
	.word 0xacb2000f  ! 4: ORNcc_R	orncc 	%r8, %r15, %r22
	.word 0xb488a25e  ! 4: ANDcc_I	andcc 	%r2, 0x025e, %r26
	.word 0xba00aea5  ! 4: ADD_I	add 	%r2, 0x0ea5, %r29
	.word 0xbc91000f  ! 4: ORcc_R	orcc 	%r4, %r15, %r30
	.word 0xb609800a  ! 4: AND_R	and 	%r6, %r10, %r27
	.word 0xaab0c00a  ! 4: ORNcc_R	orncc 	%r3, %r10, %r21
thr3_nuke_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_256), 16, 16)) -> intp(1, 2, 1)
	.word 0xb688c00e  ! 4: ANDcc_R	andcc 	%r3, %r14, %r27
	.word 0xb612000d  ! 4: OR_R	or 	%r8, %r13, %r27
	.word 0xae916f40  ! 4: ORcc_I	orcc 	%r5, 0x0f40, %r23
	.word 0xac28c00c  ! 4: ANDN_R	andn 	%r3, %r12, %r22
	.word 0xb6b22039  ! 4: ORNcc_I	orncc 	%r8, 0x0039, %r27
	.word 0xab313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r21
	.word 0xb029c00d  ! 4: ANDN_R	andn 	%r7, %r13, %r24
thr3_resum_intr_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_256), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c1800a  ! 4: ADDCcc_R	addccc 	%r6, %r10, %r25
thr3_nuke_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_257), 16, 16)) -> intp(0, 2, 1)
	.word 0xbb64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa8b9800b  ! 4: XNORcc_R	xnorcc 	%r6, %r11, %r20
	.word 0xbb322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r29
	.word 0xb52a000a  ! 4: SLL_R	sll 	%r8, %r10, %r26
	.word 0xa890e664  ! 4: ORcc_I	orcc 	%r3, 0x0664, %r20
	.word 0xb200c00a  ! 4: ADD_R	add 	%r3, %r10, %r25
	.word 0xb889800b  ! 4: ANDcc_R	andcc 	%r6, %r11, %r28
thr3_resum_intr_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_257), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8912d80  ! 4: ORcc_I	orcc 	%r4, 0x0d80, %r28
thr3_hw_intr_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_258), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r23
	.word 0xb329100b  ! 4: SLLX_R	sllx	%r4, %r11, %r25
	.word 0xa9317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r20
	.word 0xae90c00d  ! 4: ORcc_R	orcc 	%r3, %r13, %r23
	.word 0xab32100d  ! 4: SRLX_R	srlx	%r8, %r13, %r21
	.word 0xaaaa2161  ! 4: ANDNcc_I	andncc 	%r8, 0x0161, %r21
	.word 0xad2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r22
thr3_nuke_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_259), 16, 16)) -> intp(0, 2, 1)
	.word 0xac2a234e  ! 4: ANDN_I	andn 	%r8, 0x034e, %r22
	.word 0xb2c0c00e  ! 4: ADDCcc_R	addccc 	%r3, %r14, %r25
	.word 0xaa196188  ! 4: XOR_I	xor 	%r5, 0x0188, %r21
thr3_resum_intr_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_259), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2816a36  ! 4: ADDcc_I	addcc 	%r5, 0x0a36, %r25
	.word 0xbc08e4d7  ! 4: AND_I	and 	%r3, 0x04d7, %r30
	.word 0xb531800b  ! 4: SRL_R	srl 	%r6, %r11, %r26
thr3_nuke_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_260), 16, 16)) -> intp(1, 2, 1)
	.word 0xb52a100a  ! 4: SLLX_R	sllx	%r8, %r10, %r26
	.word 0xb298c00a  ! 4: XORcc_R	xorcc 	%r3, %r10, %r25
	.word 0xb60963e6  ! 4: AND_I	and 	%r5, 0x03e6, %r27
	.word 0xb630a84d  ! 4: ORN_I	orn 	%r2, 0x084d, %r27
	.word 0xb801e3f7  ! 4: ADD_I	add 	%r7, 0x03f7, %r28
	.word 0xa964180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xad31c00f  ! 4: SRL_R	srl 	%r7, %r15, %r22
thr3_resum_intr_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_260), 16, 16)) -> intp(1, 3, 1)
	.word 0xb528b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r26
	.word 0xae31800d  ! 4: ORN_R	orn 	%r6, %r13, %r23
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xba81400a  ! 4: ADDcc_R	addcc 	%r5, %r10, %r29
thr3_hw_intr_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_261), 16, 16)) -> intp(0, 0, 1)
	.word 0xab29f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r21
	.word 0xb939d00c  ! 4: SRAX_R	srax	%r7, %r12, %r28
	.word 0xaa89800b  ! 4: ANDcc_R	andcc 	%r6, %r11, %r21
	.word 0xbd7a040d  ! 4: MOVR_R	move	%r8, %r13, %r30
	.word 0xb2a8c00c  ! 4: ANDNcc_R	andncc 	%r3, %r12, %r25
	.word 0xbc992826  ! 4: XORcc_I	xorcc 	%r4, 0x0826, %r30
	.word 0xb0b92154  ! 4: XNORcc_I	xnorcc 	%r4, 0x0154, %r24
thr3_hw_intr_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_262), 16, 16)) -> intp(1, 0, 1)
	.word 0xb428e14f  ! 4: ANDN_I	andn 	%r3, 0x014f, %r26
	.word 0xaa08ec88  ! 4: AND_I	and 	%r3, 0x0c88, %r21
	.word 0xa839400c  ! 4: XNOR_R	xnor 	%r5, %r12, %r20
	.word 0xb28221a4  ! 4: ADDcc_I	addcc 	%r8, 0x01a4, %r25
	.word 0xaa11000c  ! 4: OR_R	or 	%r4, %r12, %r21
	.word 0xb8c12fef  ! 4: ADDCcc_I	addccc 	%r4, 0x0fef, %r28
thr3_hw_intr_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_263), 16, 16)) -> intp(1, 0, 1)
	.word 0xbac0e9e5  ! 4: ADDCcc_I	addccc 	%r3, 0x09e5, %r29
	.word 0xbd29d00c  ! 4: SLLX_R	sllx	%r7, %r12, %r30
	.word 0xb8c2000a  ! 4: ADDCcc_R	addccc 	%r8, %r10, %r28
	.word 0xbc2a000d  ! 4: ANDN_R	andn 	%r8, %r13, %r30
	.word 0xae90c00c  ! 4: ORcc_R	orcc 	%r3, %r12, %r23
	.word 0xaa29000e  ! 4: ANDN_R	andn 	%r4, %r14, %r21
	.word 0xaa80800d  ! 4: ADDcc_R	addcc 	%r2, %r13, %r21
thr3_nuke_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_264), 16, 16)) -> intp(1, 2, 1)
	.word 0xb009275c  ! 4: AND_I	and 	%r4, 0x075c, %r24
thr3_resum_intr_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_264), 16, 16)) -> intp(1, 3, 1)
	.word 0xa9392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r20
	.word 0xb890c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r28
thr3_nuke_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_265), 16, 16)) -> intp(0, 2, 1)
	.word 0xb208a392  ! 4: AND_I	and 	%r2, 0x0392, %r25
	.word 0xb1316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r24
	.word 0xb688c00b  ! 4: ANDcc_R	andcc 	%r3, %r11, %r27
	.word 0xaac2000a  ! 4: ADDCcc_R	addccc 	%r8, %r10, %r21
	.word 0xaf28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r23
	.word 0xacb9619f  ! 4: XNORcc_I	xnorcc 	%r5, 0x019f, %r22
	.word 0xa899c00b  ! 4: XORcc_R	xorcc 	%r7, %r11, %r20
thr3_resum_intr_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_265), 16, 16)) -> intp(0, 3, 1)
	.word 0xba8a2f68  ! 4: ANDcc_I	andcc 	%r8, 0x0f68, %r29
	.word 0xb609800f  ! 4: AND_R	and 	%r6, %r15, %r27
thr3_hw_intr_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_266), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r23
	.word 0xb0816f50  ! 4: ADDcc_I	addcc 	%r5, 0x0f50, %r24
	.word 0xbd38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r30
	.word 0xb4416db9  ! 4: ADDC_I	addc 	%r5, 0x0db9, %r26
	.word 0xb008e27c  ! 4: AND_I	and 	%r3, 0x027c, %r24
	.word 0xb8a9800e  ! 4: ANDNcc_R	andncc 	%r6, %r14, %r28
	.word 0xb840800c  ! 4: ADDC_R	addc 	%r2, %r12, %r28
thr3_nuke_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_267), 16, 16)) -> intp(1, 2, 1)
	.word 0xa831ac66  ! 4: ORN_I	orn 	%r6, 0x0c66, %r20
	.word 0xac89800b  ! 4: ANDcc_R	andcc 	%r6, %r11, %r22
	.word 0xac01800a  ! 4: ADD_R	add 	%r6, %r10, %r22
	.word 0xbaba000f  ! 4: XNORcc_R	xnorcc 	%r8, %r15, %r29
	.word 0xbd39400f  ! 4: SRA_R	sra 	%r5, %r15, %r30
	.word 0xab323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r21
	.word 0xbd39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r30
thr3_resum_intr_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_267), 16, 16)) -> intp(1, 3, 1)
	.word 0xa811c00e  ! 4: OR_R	or 	%r7, %r14, %r20
	.word 0xb0196527  ! 4: XOR_I	xor 	%r5, 0x0527, %r24
	.word 0xaeb1800b  ! 4: ORNcc_R	orncc 	%r6, %r11, %r23
thr3_nuke_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_268), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8b9c00f  ! 4: XNORcc_R	xnorcc 	%r7, %r15, %r20
	.word 0xa8b9c00e  ! 4: XNORcc_R	xnorcc 	%r7, %r14, %r20
	.word 0xba9a000a  ! 4: XORcc_R	xorcc 	%r8, %r10, %r29
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb829af18  ! 4: ANDN_I	andn 	%r6, 0x0f18, %r28
thr3_resum_intr_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_268), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd792401  ! 4: MOVR_I	move	%r4, 0xffffff18, %r30
	.word 0xb2b9e6e7  ! 4: XNORcc_I	xnorcc 	%r7, 0x06e7, %r25
thr3_nuke_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_269), 16, 16)) -> intp(1, 2, 1)
	.word 0xb0c1c00d  ! 4: ADDCcc_R	addccc 	%r7, %r13, %r24
thr3_resum_intr_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_269), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8b8e4f7  ! 4: XNORcc_I	xnorcc 	%r3, 0x04f7, %r28
	.word 0xb619800f  ! 4: XOR_R	xor 	%r6, %r15, %r27
	.word 0xb6122562  ! 4: OR_I	or 	%r8, 0x0562, %r27
	.word 0xb080c00f  ! 4: ADDcc_R	addcc 	%r3, %r15, %r24
thr3_nuke_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_270), 16, 16)) -> intp(0, 2, 1)
	.word 0xac40800b  ! 4: ADDC_R	addc 	%r2, %r11, %r22
	.word 0xaac1400c  ! 4: ADDCcc_R	addccc 	%r5, %r12, %r21
	.word 0xb338c00f  ! 4: SRA_R	sra 	%r3, %r15, %r25
thr3_resum_intr_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_270), 16, 16)) -> intp(0, 3, 1)
	.word 0xbcb9e5bc  ! 4: XNORcc_I	xnorcc 	%r7, 0x05bc, %r30
	.word 0xb081a6be  ! 4: ADDcc_I	addcc 	%r6, 0x06be, %r24
	.word 0xb930800b  ! 4: SRL_R	srl 	%r2, %r11, %r28
thr3_hw_intr_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_271), 16, 16)) -> intp(1, 0, 1)
	.word 0xae80c00f  ! 4: ADDcc_R	addcc 	%r3, %r15, %r23
	.word 0xaab9800d  ! 4: XNORcc_R	xnorcc 	%r6, %r13, %r21
	.word 0xa88165e3  ! 4: ADDcc_I	addcc 	%r5, 0x05e3, %r20
	.word 0xaeb9acdd  ! 4: XNORcc_I	xnorcc 	%r6, 0x0cdd, %r23
	.word 0xac01000c  ! 4: ADD_R	add 	%r4, %r12, %r22
	.word 0xb238a937  ! 4: XNOR_I	xnor 	%r2, 0x0937, %r25
	.word 0xac80e19f  ! 4: ADDcc_I	addcc 	%r3, 0x019f, %r22
thr3_nuke_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_272), 16, 16)) -> intp(0, 2, 1)
	.word 0xb539c00a  ! 4: SRA_R	sra 	%r7, %r10, %r26
	.word 0xb72a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0xaaa96489  ! 4: ANDNcc_I	andncc 	%r5, 0x0489, %r21
	.word 0xaa39ebd9  ! 4: XNOR_I	xnor 	%r7, 0x0bd9, %r21
thr3_resum_intr_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_272), 16, 16)) -> intp(0, 3, 1)
	.word 0xac8a000a  ! 4: ANDcc_R	andcc 	%r8, %r10, %r22
	.word 0xa829800e  ! 4: ANDN_R	andn 	%r6, %r14, %r20
thr3_hw_intr_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_273), 16, 16)) -> intp(0, 0, 1)
	.word 0xb731900b  ! 4: SRLX_R	srlx	%r6, %r11, %r27
	.word 0xa8b1400a  ! 4: ORNcc_R	orncc 	%r5, %r10, %r20
	.word 0xb689800c  ! 4: ANDcc_R	andcc 	%r6, %r12, %r27
	.word 0xb038c00c  ! 4: XNOR_R	xnor 	%r3, %r12, %r24
	.word 0xacc1a0d0  ! 4: ADDCcc_I	addccc 	%r6, 0x00d0, %r22
	.word 0xb164180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xac3120f0  ! 4: ORN_I	orn 	%r4, 0x00f0, %r22
thr3_nuke_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_274), 16, 16)) -> intp(1, 2, 1)
	.word 0xae28ac8e  ! 4: ANDN_I	andn 	%r2, 0x0c8e, %r23
	.word 0xae10800f  ! 4: OR_R	or 	%r2, %r15, %r23
	.word 0xb400c00a  ! 4: ADD_R	add 	%r3, %r10, %r26
thr3_resum_intr_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_274), 16, 16)) -> intp(1, 3, 1)
	.word 0xb411800e  ! 4: OR_R	or 	%r6, %r14, %r26
	.word 0xb8b0c00f  ! 4: ORNcc_R	orncc 	%r3, %r15, %r28
thr3_hw_intr_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_275), 16, 16)) -> intp(0, 0, 1)
	.word 0xac8a270e  ! 4: ANDcc_I	andcc 	%r8, 0x070e, %r22
	.word 0xaa2926fc  ! 4: ANDN_I	andn 	%r4, 0x06fc, %r21
	.word 0xb880e108  ! 4: ADDcc_I	addcc 	%r3, 0x0108, %r28
	.word 0xa930e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r20
	.word 0xb128800a  ! 4: SLL_R	sll 	%r2, %r10, %r24
	.word 0xb728f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r27
	.word 0xa832000d  ! 4: ORN_R	orn 	%r8, %r13, %r20
thr3_hw_intr_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_276), 16, 16)) -> intp(0, 0, 1)
	.word 0xb538900a  ! 4: SRAX_R	srax	%r2, %r10, %r26
	.word 0xa81a2aec  ! 4: XOR_I	xor 	%r8, 0x0aec, %r20
	.word 0xb010c00b  ! 4: OR_R	or 	%r3, %r11, %r24
	.word 0xaab0a45f  ! 4: ORNcc_I	orncc 	%r2, 0x045f, %r21
	.word 0xacb9000c  ! 4: XNORcc_R	xnorcc 	%r4, %r12, %r22
	.word 0xaa8a000d  ! 4: ANDcc_R	andcc 	%r8, %r13, %r21
thr3_nuke_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_277), 16, 16)) -> intp(0, 2, 1)
	.word 0xae89e97f  ! 4: ANDcc_I	andcc 	%r7, 0x097f, %r23
	.word 0xab30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r21
	.word 0xbc08800d  ! 4: AND_R	and 	%r2, %r13, %r30
	.word 0xac10c00b  ! 4: OR_R	or 	%r3, %r11, %r22
thr3_resum_intr_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_277), 16, 16)) -> intp(0, 3, 1)
	.word 0xbac22f6f  ! 4: ADDCcc_I	addccc 	%r8, 0x0f6f, %r29
	.word 0xb039400b  ! 4: XNOR_R	xnor 	%r5, %r11, %r24
	.word 0xaa1968e4  ! 4: XOR_I	xor 	%r5, 0x08e4, %r21
thr3_hw_intr_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_278), 16, 16)) -> intp(0, 0, 1)
	.word 0xae89000c  ! 4: ANDcc_R	andcc 	%r4, %r12, %r23
	.word 0xb0896821  ! 4: ANDcc_I	andcc 	%r5, 0x0821, %r24
	.word 0xb9796401  ! 4: MOVR_I	move	%r5, 0x821, %r28
	.word 0xab316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r21
	.word 0xaa116c67  ! 4: OR_I	or 	%r5, 0x0c67, %r21
	.word 0xbc90c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r30
thr3_nuke_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_279), 16, 16)) -> intp(0, 2, 1)
	.word 0xad30800d  ! 4: SRL_R	srl 	%r2, %r13, %r22
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xbcb9c00b  ! 4: XNORcc_R	xnorcc 	%r7, %r11, %r30
thr3_resum_intr_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_279), 16, 16)) -> intp(0, 3, 1)
	.word 0xb810c00f  ! 4: OR_R	or 	%r3, %r15, %r28
	.word 0xaec1000f  ! 4: ADDCcc_R	addccc 	%r4, %r15, %r23
	.word 0xba38eb77  ! 4: XNOR_I	xnor 	%r3, 0x0b77, %r29
thr3_hw_intr_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_280), 16, 16)) -> intp(0, 0, 1)
	.word 0xa8c0e4a4  ! 4: ADDCcc_I	addccc 	%r3, 0x04a4, %r20
	.word 0xa801ee12  ! 4: ADD_I	add 	%r7, 0x0e12, %r20
	.word 0xb038800d  ! 4: XNOR_R	xnor 	%r2, %r13, %r24
	.word 0xba11a8cc  ! 4: OR_I	or 	%r6, 0x08cc, %r29
	.word 0xae08e2c4  ! 4: AND_I	and 	%r3, 0x02c4, %r23
	.word 0xad39000a  ! 4: SRA_R	sra 	%r4, %r10, %r22
	.word 0xb0b0ee6e  ! 4: ORNcc_I	orncc 	%r3, 0x0e6e, %r24
thr3_hw_intr_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_281), 16, 16)) -> intp(1, 0, 1)
	.word 0xa818aacc  ! 4: XOR_I	xor 	%r2, 0x0acc, %r20
	.word 0xb811257f  ! 4: OR_I	or 	%r4, 0x057f, %r28
	.word 0xb830ecf8  ! 4: ORN_I	orn 	%r3, 0x0cf8, %r28
	.word 0xac31800d  ! 4: ORN_R	orn 	%r6, %r13, %r22
	.word 0xba39223c  ! 4: XNOR_I	xnor 	%r4, 0x023c, %r29
	.word 0xba39ac4c  ! 4: XNOR_I	xnor 	%r6, 0x0c4c, %r29
	.word 0xb011a801  ! 4: OR_I	or 	%r6, 0x0801, %r24
thr3_nuke_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_282), 16, 16)) -> intp(1, 2, 1)
	.word 0xae10c00b  ! 4: OR_R	or 	%r3, %r11, %r23
	.word 0xb530800c  ! 4: SRL_R	srl 	%r2, %r12, %r26
	.word 0xbd2a000b  ! 4: SLL_R	sll 	%r8, %r11, %r30
	.word 0xb2a9400e  ! 4: ANDNcc_R	andncc 	%r5, %r14, %r25
	.word 0xa89964eb  ! 4: XORcc_I	xorcc 	%r5, 0x04eb, %r20
	.word 0xad32000b  ! 4: SRL_R	srl 	%r8, %r11, %r22
	.word 0xb4a8c00f  ! 4: ANDNcc_R	andncc 	%r3, %r15, %r26
thr3_resum_intr_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_282), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2a9ea1b  ! 4: ANDNcc_I	andncc 	%r7, 0x0a1b, %r25
thr3_nuke_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_283), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2ba24e2  ! 4: XNORcc_I	xnorcc 	%r8, 0x04e2, %r25
	.word 0xb929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r28
thr3_resum_intr_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_283), 16, 16)) -> intp(1, 3, 1)
	.word 0xae81800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r23
	.word 0xae412e35  ! 4: ADDC_I	addc 	%r4, 0x0e35, %r23
	.word 0xaa4227b4  ! 4: ADDC_I	addc 	%r8, 0x07b4, %r21
	.word 0xa8aa000b  ! 4: ANDNcc_R	andncc 	%r8, %r11, %r20
thr3_hw_intr_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_284), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4b9e67d  ! 4: XNORcc_I	xnorcc 	%r7, 0x067d, %r26
	.word 0xbc196286  ! 4: XOR_I	xor 	%r5, 0x0286, %r30
	.word 0xb238800c  ! 4: XNOR_R	xnor 	%r2, %r12, %r25
	.word 0xb898e4ef  ! 4: XORcc_I	xorcc 	%r3, 0x04ef, %r28
	.word 0xaea926ba  ! 4: ANDNcc_I	andncc 	%r4, 0x06ba, %r23
	.word 0xa8b9afe0  ! 4: XNORcc_I	xnorcc 	%r6, 0x0fe0, %r20
thr3_nuke_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_285), 16, 16)) -> intp(1, 2, 1)
	.word 0xb52a000a  ! 4: SLL_R	sll 	%r8, %r10, %r26
	.word 0xb041c00e  ! 4: ADDC_R	addc 	%r7, %r14, %r24
thr3_resum_intr_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_285), 16, 16)) -> intp(1, 3, 1)
	.word 0xad31800c  ! 4: SRL_R	srl 	%r6, %r12, %r22
	.word 0xb208c00f  ! 4: AND_R	and 	%r3, %r15, %r25
	.word 0xb84124f3  ! 4: ADDC_I	addc 	%r4, 0x04f3, %r28
thr3_nuke_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_286), 16, 16)) -> intp(0, 2, 1)
	.word 0xb928e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r28
	.word 0xae392890  ! 4: XNOR_I	xnor 	%r4, 0x0890, %r23
	.word 0xba90800b  ! 4: ORcc_R	orcc 	%r2, %r11, %r29
	.word 0xac112ab9  ! 4: OR_I	or 	%r4, 0x0ab9, %r22
	.word 0xaf38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r23
thr3_resum_intr_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_286), 16, 16)) -> intp(0, 3, 1)
	.word 0xb63227c2  ! 4: ORN_I	orn 	%r8, 0x07c2, %r27
	.word 0xaf64180b  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_287), 16, 16)) -> intp(1, 2, 1)
	.word 0xb72a100a  ! 4: SLLX_R	sllx	%r8, %r10, %r27
	.word 0xb228800f  ! 4: ANDN_R	andn 	%r2, %r15, %r25
thr3_resum_intr_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_287), 16, 16)) -> intp(1, 3, 1)
	.word 0xba11aa4b  ! 4: OR_I	or 	%r6, 0x0a4b, %r29
	.word 0xb439000b  ! 4: XNOR_R	xnor 	%r4, %r11, %r26
thr3_hw_intr_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_288), 16, 16)) -> intp(1, 0, 1)
	.word 0xac992384  ! 4: XORcc_I	xorcc 	%r4, 0x0384, %r22
	.word 0xb819000f  ! 4: XOR_R	xor 	%r4, %r15, %r28
	.word 0xad31900c  ! 4: SRLX_R	srlx	%r6, %r12, %r22
	.word 0xb88a25f4  ! 4: ANDcc_I	andcc 	%r8, 0x05f4, %r28
	.word 0xb431800d  ! 4: ORN_R	orn 	%r6, %r13, %r26
	.word 0xb039c00e  ! 4: XNOR_R	xnor 	%r7, %r14, %r24
	.word 0xb098ebde  ! 4: XORcc_I	xorcc 	%r3, 0x0bde, %r24
thr3_nuke_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_289), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa3a238c  ! 4: XNOR_I	xnor 	%r8, 0x038c, %r21
	.word 0xb8996946  ! 4: XORcc_I	xorcc 	%r5, 0x0946, %r28
	.word 0xbab8aed1  ! 4: XNORcc_I	xnorcc 	%r2, 0x0ed1, %r29
thr3_resum_intr_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_289), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c0c00a  ! 4: ADDCcc_R	addccc 	%r3, %r10, %r25
	.word 0xb6892574  ! 4: ANDcc_I	andcc 	%r4, 0x0574, %r27
thr3_nuke_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_290), 16, 16)) -> intp(1, 2, 1)
	.word 0xb2b9a3b3  ! 4: XNORcc_I	xnorcc 	%r6, 0x03b3, %r25
	.word 0xae11e666  ! 4: OR_I	or 	%r7, 0x0666, %r23
thr3_resum_intr_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_290), 16, 16)) -> intp(1, 3, 1)
	.word 0xb731100b  ! 4: SRLX_R	srlx	%r4, %r11, %r27
thr3_nuke_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_291), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa81400b  ! 4: ADDcc_R	addcc 	%r5, %r11, %r21
thr3_resum_intr_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_291), 16, 16)) -> intp(1, 3, 1)
	.word 0xab78840c  ! 4: MOVR_R	move	%r2, %r12, %r21
	.word 0xb339400e  ! 4: SRA_R	sra 	%r5, %r14, %r25
	.word 0xb200a2be  ! 4: ADD_I	add 	%r2, 0x02be, %r25
	.word 0xaa91e68f  ! 4: ORcc_I	orcc 	%r7, 0x068f, %r21
thr3_hw_intr_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_292), 16, 16)) -> intp(1, 0, 1)
	.word 0xac19632b  ! 4: XOR_I	xor 	%r5, 0x032b, %r22
	.word 0xb531000b  ! 4: SRL_R	srl 	%r4, %r11, %r26
	.word 0xba81ee0d  ! 4: ADDcc_I	addcc 	%r7, 0x0e0d, %r29
	.word 0xb931900f  ! 4: SRLX_R	srlx	%r6, %r15, %r28
	.word 0xa841400f  ! 4: ADDC_R	addc 	%r5, %r15, %r20
	.word 0xa812000d  ! 4: OR_R	or 	%r8, %r13, %r20
	.word 0xb57a040f  ! 4: MOVR_R	move	%r8, %r15, %r26
thr3_hw_intr_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_293), 16, 16)) -> intp(1, 0, 1)
	.word 0xae10a5cf  ! 4: OR_I	or 	%r2, 0x05cf, %r23
	.word 0xab396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r21
	.word 0xaa3924fb  ! 4: XNOR_I	xnor 	%r4, 0x04fb, %r21
	.word 0xb0c0800a  ! 4: ADDCcc_R	addccc 	%r2, %r10, %r24
	.word 0xae3a28cb  ! 4: XNOR_I	xnor 	%r8, 0x08cb, %r23
	.word 0xaf79e401  ! 4: MOVR_I	move	%r7, 0x8cb, %r23
	.word 0xaf78c40d  ! 4: MOVR_R	move	%r3, %r13, %r23
thr3_nuke_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_294), 16, 16)) -> intp(1, 2, 1)
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaf30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r23
	.word 0xb92a000a  ! 4: SLL_R	sll 	%r8, %r10, %r28
	.word 0xb609c00f  ! 4: AND_R	and 	%r7, %r15, %r27
	.word 0xb028800d  ! 4: ANDN_R	andn 	%r2, %r13, %r24
thr3_resum_intr_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_294), 16, 16)) -> intp(1, 3, 1)
	.word 0xb041a08f  ! 4: ADDC_I	addc 	%r6, 0x008f, %r24
thr3_hw_intr_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_295), 16, 16)) -> intp(1, 0, 1)
	.word 0xae81c00f  ! 4: ADDcc_R	addcc 	%r7, %r15, %r23
	.word 0xb8892b16  ! 4: ANDcc_I	andcc 	%r4, 0x0b16, %r28
	.word 0xac99abc7  ! 4: XORcc_I	xorcc 	%r6, 0x0bc7, %r22
	.word 0xab396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r21
	.word 0xb6c1a046  ! 4: ADDCcc_I	addccc 	%r6, 0x0046, %r27
	.word 0xb8016b64  ! 4: ADD_I	add 	%r5, 0x0b64, %r28
	.word 0xbb7a2401  ! 4: MOVR_I	move	%r8, 0xffffff64, %r29
thr3_hw_intr_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_296), 16, 16)) -> intp(0, 0, 1)
	.word 0xb138800d  ! 4: SRA_R	sra 	%r2, %r13, %r24
	.word 0xbc39800b  ! 4: XNOR_R	xnor 	%r6, %r11, %r30
	.word 0xbcb8a113  ! 4: XNORcc_I	xnorcc 	%r2, 0x0113, %r30
	.word 0xb63a20ec  ! 4: XNOR_I	xnor 	%r8, 0x00ec, %r27
	.word 0xb0316505  ! 4: ORN_I	orn 	%r5, 0x0505, %r24
	.word 0xbd39400f  ! 4: SRA_R	sra 	%r5, %r15, %r30
	.word 0xb0016d94  ! 4: ADD_I	add 	%r5, 0x0d94, %r24
thr3_hw_intr_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_297), 16, 16)) -> intp(1, 0, 1)
	.word 0xab39100f  ! 4: SRAX_R	srax	%r4, %r15, %r21
	.word 0xb641800a  ! 4: ADDC_R	addc 	%r6, %r10, %r27
	.word 0xa97a040e  ! 4: MOVR_R	move	%r8, %r14, %r20
	.word 0xa830eb2a  ! 4: ORN_I	orn 	%r3, 0x0b2a, %r20
	.word 0xb3792401  ! 4: MOVR_I	move	%r4, 0xffffff2a, %r25
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_298), 16, 16)) -> intp(0, 0, 1)
	.word 0xaa1220a2  ! 4: OR_I	or 	%r8, 0x00a2, %r21
	.word 0xbc88800a  ! 4: ANDcc_R	andcc 	%r2, %r10, %r30
	.word 0xbc9a000d  ! 4: XORcc_R	xorcc 	%r8, %r13, %r30
	.word 0xb239800f  ! 4: XNOR_R	xnor 	%r6, %r15, %r25
	.word 0xb57a040d  ! 4: MOVR_R	move	%r8, %r13, %r26
	.word 0xab3a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r21
	.word 0xb031000a  ! 4: ORN_R	orn 	%r4, %r10, %r24
thr3_nuke_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_299), 16, 16)) -> intp(1, 2, 1)
	.word 0xaec12a0c  ! 4: ADDCcc_I	addccc 	%r4, 0x0a0c, %r23
thr3_resum_intr_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_299), 16, 16)) -> intp(1, 3, 1)
	.word 0xb3392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r25
	.word 0xac12000e  ! 4: OR_R	or 	%r8, %r14, %r22
thr3_hw_intr_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_300), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r29
	.word 0xab39d00e  ! 4: SRAX_R	srax	%r7, %r14, %r21
	.word 0xae01800f  ! 4: ADD_R	add 	%r6, %r15, %r23
	.word 0xb241000e  ! 4: ADDC_R	addc 	%r4, %r14, %r25
	.word 0xb8c12b8b  ! 4: ADDCcc_I	addccc 	%r4, 0x0b8b, %r28
	.word 0xab312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r21
	.word 0xb80965fe  ! 4: AND_I	and 	%r5, 0x05fe, %r28
thr3_hw_intr_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_301), 16, 16)) -> intp(1, 0, 1)
	.word 0xba91ef7d  ! 4: ORcc_I	orcc 	%r7, 0x0f7d, %r29
	.word 0xb21a000c  ! 4: XOR_R	xor 	%r8, %r12, %r25
	.word 0xb809800e  ! 4: AND_R	and 	%r6, %r14, %r28
	.word 0xb200c00c  ! 4: ADD_R	add 	%r3, %r12, %r25
	.word 0xae29e548  ! 4: ANDN_I	andn 	%r7, 0x0548, %r23
	.word 0xab313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r21
	.word 0xb288e6e5  ! 4: ANDcc_I	andcc 	%r3, 0x06e5, %r25
thr3_nuke_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_302), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r23
	.word 0xaa91a428  ! 4: ORcc_I	orcc 	%r6, 0x0428, %r21
	.word 0xb01a20fa  ! 4: XOR_I	xor 	%r8, 0x00fa, %r24
thr3_resum_intr_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_302), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r30
	.word 0xb241c00d  ! 4: ADDC_R	addc 	%r7, %r13, %r25
thr3_nuke_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_303), 16, 16)) -> intp(1, 2, 1)
	.word 0xad28c00a  ! 4: SLL_R	sll 	%r3, %r10, %r22
	.word 0xaf78c40d  ! 4: MOVR_R	move	%r3, %r13, %r23
	.word 0xa8a9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r20
	.word 0xbb31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r29
	.word 0xb88a2af8  ! 4: ANDcc_I	andcc 	%r8, 0x0af8, %r28
	.word 0xb489e221  ! 4: ANDcc_I	andcc 	%r7, 0x0221, %r26
	.word 0xb8c1000c  ! 4: ADDCcc_R	addccc 	%r4, %r12, %r28
thr3_resum_intr_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_303), 16, 16)) -> intp(1, 3, 1)
	.word 0xb098c00d  ! 4: XORcc_R	xorcc 	%r3, %r13, %r24
	.word 0xaa88c00b  ! 4: ANDcc_R	andcc 	%r3, %r11, %r21
	.word 0xaa89800b  ! 4: ANDcc_R	andcc 	%r6, %r11, %r21
	.word 0xb600e940  ! 4: ADD_I	add 	%r3, 0x0940, %r27
thr3_hw_intr_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_304), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0c0acc1  ! 4: ADDCcc_I	addccc 	%r2, 0x0cc1, %r24
	.word 0xb611ec11  ! 4: OR_I	or 	%r7, 0x0c11, %r27
	.word 0xaeb8800a  ! 4: XNORcc_R	xnorcc 	%r2, %r10, %r23
	.word 0xb63220c4  ! 4: ORN_I	orn 	%r8, 0x00c4, %r27
	.word 0xb2b0eb5a  ! 4: ORNcc_I	orncc 	%r3, 0x0b5a, %r25
	.word 0xab64180f  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_305), 16, 16)) -> intp(0, 2, 1)
	.word 0xa930c00b  ! 4: SRL_R	srl 	%r3, %r11, %r20
	.word 0xbb78840e  ! 4: MOVR_R	move	%r2, %r14, %r29
thr3_resum_intr_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_305), 16, 16)) -> intp(0, 3, 1)
	.word 0xb6c1aaa9  ! 4: ADDCcc_I	addccc 	%r6, 0x0aa9, %r27
	.word 0xb699000f  ! 4: XORcc_R	xorcc 	%r4, %r15, %r27
thr3_hw_intr_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_306), 16, 16)) -> intp(0, 0, 1)
	.word 0xbcc1a4b1  ! 4: ADDCcc_I	addccc 	%r6, 0x04b1, %r30
	.word 0xaa10c00b  ! 4: OR_R	or 	%r3, %r11, %r21
	.word 0xba91c00e  ! 4: ORcc_R	orcc 	%r7, %r14, %r29
	.word 0xacb8800f  ! 4: XNORcc_R	xnorcc 	%r2, %r15, %r22
	.word 0xaa8962d0  ! 4: ANDcc_I	andcc 	%r5, 0x02d0, %r21
	.word 0xbca9400e  ! 4: ANDNcc_R	andncc 	%r5, %r14, %r30
	.word 0xb8992799  ! 4: XORcc_I	xorcc 	%r4, 0x0799, %r28
thr3_nuke_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_307), 16, 16)) -> intp(1, 2, 1)
	.word 0xa930c00d  ! 4: SRL_R	srl 	%r3, %r13, %r20
	.word 0xb328f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r25
thr3_resum_intr_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_307), 16, 16)) -> intp(1, 3, 1)
	.word 0xac29e4de  ! 4: ANDN_I	andn 	%r7, 0x04de, %r22
thr3_hw_intr_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_308), 16, 16)) -> intp(1, 0, 1)
	.word 0xb299e8e0  ! 4: XORcc_I	xorcc 	%r7, 0x08e0, %r25
	.word 0xb6c12b13  ! 4: ADDCcc_I	addccc 	%r4, 0x0b13, %r27
	.word 0xb7643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaa0a000c  ! 4: AND_R	and 	%r8, %r12, %r21
	.word 0xbc10800a  ! 4: OR_R	or 	%r2, %r10, %r30
	.word 0xb52a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r26
	.word 0xb138c00c  ! 4: SRA_R	sra 	%r3, %r12, %r24
thr3_nuke_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_309), 16, 16)) -> intp(1, 2, 1)
	.word 0xb564180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb4b9abfe  ! 4: XNORcc_I	xnorcc 	%r6, 0x0bfe, %r26
	.word 0xb231c00b  ! 4: ORN_R	orn 	%r7, %r11, %r25
	.word 0xba92000e  ! 4: ORcc_R	orcc 	%r8, %r14, %r29
	.word 0xac18800d  ! 4: XOR_R	xor 	%r2, %r13, %r22
thr3_resum_intr_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_309), 16, 16)) -> intp(1, 3, 1)
	.word 0xb130a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r24
	.word 0xba80c00d  ! 4: ADDcc_R	addcc 	%r3, %r13, %r29
	.word 0xa8012fca  ! 4: ADD_I	add 	%r4, 0x0fca, %r20
thr3_nuke_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_310), 16, 16)) -> intp(0, 2, 1)
	.word 0xb2022e4f  ! 4: ADD_I	add 	%r8, 0x0e4f, %r25
	.word 0xaa01800c  ! 4: ADD_R	add 	%r6, %r12, %r21
	.word 0xa801c00e  ! 4: ADD_R	add 	%r7, %r14, %r20
	.word 0xae19400e  ! 4: XOR_R	xor 	%r5, %r14, %r23
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
thr3_resum_intr_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_310), 16, 16)) -> intp(0, 3, 1)
	.word 0xb538d00a  ! 4: SRAX_R	srax	%r3, %r10, %r26
	.word 0xbb79840a  ! 4: MOVR_R	move	%r6, %r10, %r29
	.word 0xa928b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r20
thr3_nuke_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_311), 16, 16)) -> intp(0, 2, 1)
	.word 0xb60a000d  ! 4: AND_R	and 	%r8, %r13, %r27
	.word 0xb129500c  ! 4: SLLX_R	sllx	%r5, %r12, %r24
	.word 0xac1a000f  ! 4: XOR_R	xor 	%r8, %r15, %r22
	.word 0xb2b0c00b  ! 4: ORNcc_R	orncc 	%r3, %r11, %r25
	.word 0xb689ecac  ! 4: ANDcc_I	andcc 	%r7, 0x0cac, %r27
	.word 0xa9316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r20
thr3_resum_intr_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_311), 16, 16)) -> intp(0, 3, 1)
	.word 0xb739e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r27
thr3_hw_intr_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_312), 16, 16)) -> intp(0, 0, 1)
	.word 0xb364180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xba9a2f48  ! 4: XORcc_I	xorcc 	%r8, 0x0f48, %r29
	.word 0xae2a000f  ! 4: ANDN_R	andn 	%r8, %r15, %r23
	.word 0xb8b9000f  ! 4: XNORcc_R	xnorcc 	%r4, %r15, %r28
	.word 0xb1323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r24
	.word 0xab64180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaaa9ab76  ! 4: ANDNcc_I	andncc 	%r6, 0x0b76, %r21
thr3_hw_intr_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_313), 16, 16)) -> intp(1, 0, 1)
	.word 0xbaa9e8fa  ! 4: ANDNcc_I	andncc 	%r7, 0x08fa, %r29
	.word 0xa890ac0b  ! 4: ORcc_I	orcc 	%r2, 0x0c0b, %r20
	.word 0xb539400c  ! 4: SRA_R	sra 	%r5, %r12, %r26
	.word 0xb638c00f  ! 4: XNOR_R	xnor 	%r3, %r15, %r27
	.word 0xbac164b8  ! 4: ADDCcc_I	addccc 	%r5, 0x04b8, %r29
	.word 0xaa40800b  ! 4: ADDC_R	addc 	%r2, %r11, %r21
thr3_nuke_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_314), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6b9400f  ! 4: XNORcc_R	xnorcc 	%r5, %r15, %r27
	.word 0xb441000e  ! 4: ADDC_R	addc 	%r4, %r14, %r26
	.word 0xb441400d  ! 4: ADDC_R	addc 	%r5, %r13, %r26
	.word 0xb6822f3a  ! 4: ADDcc_I	addcc 	%r8, 0x0f3a, %r27
	.word 0xb8b16681  ! 4: ORNcc_I	orncc 	%r5, 0x0681, %r28
	.word 0xac9a29ab  ! 4: XORcc_I	xorcc 	%r8, 0x09ab, %r22
	.word 0xb938800c  ! 4: SRA_R	sra 	%r2, %r12, %r28
thr3_resum_intr_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_314), 16, 16)) -> intp(0, 3, 1)
	.word 0xbab22262  ! 4: ORNcc_I	orncc 	%r8, 0x0262, %r29
thr3_hw_intr_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_315), 16, 16)) -> intp(0, 0, 1)
	.word 0xb899c00d  ! 4: XORcc_R	xorcc 	%r7, %r13, %r28
	.word 0xb4b9a7b9  ! 4: XNORcc_I	xnorcc 	%r6, 0x07b9, %r26
	.word 0xb202000e  ! 4: ADD_R	add 	%r8, %r14, %r25
	.word 0xa938a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r20
	.word 0xb538e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r26
	.word 0xb639800a  ! 4: XNOR_R	xnor 	%r6, %r10, %r27
	.word 0xacb9edb7  ! 4: XNORcc_I	xnorcc 	%r7, 0x0db7, %r22
thr3_hw_intr_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_316), 16, 16)) -> intp(1, 0, 1)
	.word 0xb2192d38  ! 4: XOR_I	xor 	%r4, 0x0d38, %r25
	.word 0xad79a401  ! 4: MOVR_I	move	%r6, 0xd38, %r22
	.word 0xa939100a  ! 4: SRAX_R	srax	%r4, %r10, %r20
	.word 0xb330800b  ! 4: SRL_R	srl 	%r2, %r11, %r25
	.word 0xb4a8ea58  ! 4: ANDNcc_I	andncc 	%r3, 0x0a58, %r26
	.word 0xaab0c00e  ! 4: ORNcc_R	orncc 	%r3, %r14, %r21
	.word 0xbd31100e  ! 4: SRLX_R	srlx	%r4, %r14, %r30
thr3_nuke_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_317), 16, 16)) -> intp(0, 2, 1)
	.word 0xba11400a  ! 4: OR_R	or 	%r5, %r10, %r29
	.word 0xac82000d  ! 4: ADDcc_R	addcc 	%r8, %r13, %r22
	.word 0xb531000c  ! 4: SRL_R	srl 	%r4, %r12, %r26
thr3_resum_intr_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_317), 16, 16)) -> intp(0, 3, 1)
	.word 0xb60a000a  ! 4: AND_R	and 	%r8, %r10, %r27
	.word 0xbc18c00d  ! 4: XOR_R	xor 	%r3, %r13, %r30
	.word 0xba82000f  ! 4: ADDcc_R	addcc 	%r8, %r15, %r29
	.word 0xb639000a  ! 4: XNOR_R	xnor 	%r4, %r10, %r27
thr3_hw_intr_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_318), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8a9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r20
	.word 0xb628c00e  ! 4: ANDN_R	andn 	%r3, %r14, %r27
	.word 0xb0b1800a  ! 4: ORNcc_R	orncc 	%r6, %r10, %r24
	.word 0xb528b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r26
	.word 0xae39a559  ! 4: XNOR_I	xnor 	%r6, 0x0559, %r23
	.word 0xbc29651f  ! 4: ANDN_I	andn 	%r5, 0x051f, %r30
thr3_hw_intr_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_319), 16, 16)) -> intp(0, 0, 1)
	.word 0xa810c00c  ! 4: OR_R	or 	%r3, %r12, %r20
	.word 0xbb38e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r29
	.word 0xa8b1000f  ! 4: ORNcc_R	orncc 	%r4, %r15, %r20
	.word 0xab31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r21
	.word 0xad31100f  ! 4: SRLX_R	srlx	%r4, %r15, %r22
	.word 0xb0b9c00d  ! 4: XNORcc_R	xnorcc 	%r7, %r13, %r24
	.word 0xb4316a94  ! 4: ORN_I	orn 	%r5, 0x0a94, %r26
thr3_hw_intr_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_320), 16, 16)) -> intp(0, 0, 1)
	.word 0xb229271a  ! 4: ANDN_I	andn 	%r4, 0x071a, %r25
	.word 0xb639237a  ! 4: XNOR_I	xnor 	%r4, 0x037a, %r27
	.word 0xbc10a8f7  ! 4: OR_I	or 	%r2, 0x08f7, %r30
	.word 0xbc0125bd  ! 4: ADD_I	add 	%r4, 0x05bd, %r30
	.word 0xba18c00b  ! 4: XOR_R	xor 	%r3, %r11, %r29
	.word 0xab38800f  ! 4: SRA_R	sra 	%r2, %r15, %r21
thr3_hw_intr_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_321), 16, 16)) -> intp(1, 0, 1)
	.word 0xb481248d  ! 4: ADDcc_I	addcc 	%r4, 0x048d, %r26
	.word 0xbaa9000a  ! 4: ANDNcc_R	andncc 	%r4, %r10, %r29
	.word 0xac91800f  ! 4: ORcc_R	orcc 	%r6, %r15, %r22
	.word 0xa932100f  ! 4: SRLX_R	srlx	%r8, %r15, %r20
	.word 0xb128c00a  ! 4: SLL_R	sll 	%r3, %r10, %r24
	.word 0xab28d00c  ! 4: SLLX_R	sllx	%r3, %r12, %r21
	.word 0xa8c0800e  ! 4: ADDCcc_R	addccc 	%r2, %r14, %r20
thr3_nuke_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_322), 16, 16)) -> intp(0, 2, 1)
	.word 0xb210800c  ! 4: OR_R	or 	%r2, %r12, %r25
	.word 0xbcb1400d  ! 4: ORNcc_R	orncc 	%r5, %r13, %r30
	.word 0xb4a8ad63  ! 4: ANDNcc_I	andncc 	%r2, 0x0d63, %r26
	.word 0xb499800e  ! 4: XORcc_R	xorcc 	%r6, %r14, %r26
thr3_resum_intr_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_322), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd78a401  ! 4: MOVR_I	move	%r2, 0xe, %r30
	.word 0xba40a93e  ! 4: ADDC_I	addc 	%r2, 0x093e, %r29
thr3_nuke_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_323), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa11400b  ! 4: OR_R	or 	%r5, %r11, %r21
	.word 0xbca9800a  ! 4: ANDNcc_R	andncc 	%r6, %r10, %r30
	.word 0xbc88c00a  ! 4: ANDcc_R	andcc 	%r3, %r10, %r30
	.word 0xac41c00c  ! 4: ADDC_R	addc 	%r7, %r12, %r22
	.word 0xb2996d08  ! 4: XORcc_I	xorcc 	%r5, 0x0d08, %r25
	.word 0xae996441  ! 4: XORcc_I	xorcc 	%r5, 0x0441, %r23
thr3_resum_intr_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_323), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc19400a  ! 4: XOR_R	xor 	%r5, %r10, %r30
	.word 0xb938c00a  ! 4: SRA_R	sra 	%r3, %r10, %r28
thr3_nuke_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_324), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8812d33  ! 4: ADDcc_I	addcc 	%r4, 0x0d33, %r28
	.word 0xad31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r22
	.word 0xad29a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r22
	.word 0xaa30e25b  ! 4: ORN_I	orn 	%r3, 0x025b, %r21
	.word 0xb529d00c  ! 4: SLLX_R	sllx	%r7, %r12, %r26
	.word 0xb2c0c00b  ! 4: ADDCcc_R	addccc 	%r3, %r11, %r25
	.word 0xb2c12b34  ! 4: ADDCcc_I	addccc 	%r4, 0x0b34, %r25
thr3_resum_intr_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_324), 16, 16)) -> intp(0, 3, 1)
	.word 0xba0a253a  ! 4: AND_I	and 	%r8, 0x053a, %r29
	.word 0xac19c00f  ! 4: XOR_R	xor 	%r7, %r15, %r22
	.word 0xab31400a  ! 4: SRL_R	srl 	%r5, %r10, %r21
	.word 0xa888c00c  ! 4: ANDcc_R	andcc 	%r3, %r12, %r20
thr3_hw_intr_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_325), 16, 16)) -> intp(0, 0, 1)
	.word 0xb339d00f  ! 4: SRAX_R	srax	%r7, %r15, %r25
	.word 0xab39100d  ! 4: SRAX_R	srax	%r4, %r13, %r21
	.word 0xbb29a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r29
	.word 0xba09c00b  ! 4: AND_R	and 	%r7, %r11, %r29
	.word 0xab64180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbb32100f  ! 4: SRLX_R	srlx	%r8, %r15, %r29
thr3_hw_intr_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_326), 16, 16)) -> intp(0, 0, 1)
	.word 0xba81e0f8  ! 4: ADDcc_I	addcc 	%r7, 0x00f8, %r29
	.word 0xba8168ec  ! 4: ADDcc_I	addcc 	%r5, 0x08ec, %r29
	.word 0xa928e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r20
	.word 0xb4022fef  ! 4: ADD_I	add 	%r8, 0x0fef, %r26
	.word 0xb529e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r26
	.word 0xad3a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r22
thr3_hw_intr_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_327), 16, 16)) -> intp(0, 0, 1)
	.word 0xac096d5e  ! 4: AND_I	and 	%r5, 0x0d5e, %r22
	.word 0xbcb12e65  ! 4: ORNcc_I	orncc 	%r4, 0x0e65, %r30
	.word 0xb8a927ee  ! 4: ANDNcc_I	andncc 	%r4, 0x07ee, %r28
	.word 0xb02928d0  ! 4: ANDN_I	andn 	%r4, 0x08d0, %r24
	.word 0xa93a000b  ! 4: SRA_R	sra 	%r8, %r11, %r20
	.word 0xa8322524  ! 4: ORN_I	orn 	%r8, 0x0524, %r20
thr3_hw_intr_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_328), 16, 16)) -> intp(0, 0, 1)
	.word 0xbd79e401  ! 4: MOVR_I	move	%r7, 0x524, %r30
	.word 0xba09400d  ! 4: AND_R	and 	%r5, %r13, %r29
	.word 0xac01000e  ! 4: ADD_R	add 	%r4, %r14, %r22
	.word 0xb401800f  ! 4: ADD_R	add 	%r6, %r15, %r26
	.word 0xb01125fb  ! 4: OR_I	or 	%r4, 0x05fb, %r24
	.word 0xbc38c00b  ! 4: XNOR_R	xnor 	%r3, %r11, %r30
thr3_hw_intr_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_329), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf38800b  ! 4: SRA_R	sra 	%r2, %r11, %r23
	.word 0xb428a9b0  ! 4: ANDN_I	andn 	%r2, 0x09b0, %r26
	.word 0xaa99400c  ! 4: XORcc_R	xorcc 	%r5, %r12, %r21
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xad38c00b  ! 4: SRA_R	sra 	%r3, %r11, %r22
	.word 0xaf79c40a  ! 4: MOVR_R	move	%r7, %r10, %r23
thr3_hw_intr_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_330), 16, 16)) -> intp(0, 0, 1)
	.word 0xba11000c  ! 4: OR_R	or 	%r4, %r12, %r29
	.word 0xb280a13b  ! 4: ADDcc_I	addcc 	%r2, 0x013b, %r25
	.word 0xa929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r20
	.word 0xb2b9800c  ! 4: XNORcc_R	xnorcc 	%r6, %r12, %r25
	.word 0xb419000d  ! 4: XOR_R	xor 	%r4, %r13, %r26
	.word 0xa819c00e  ! 4: XOR_R	xor 	%r7, %r14, %r20
	.word 0xac08aba9  ! 4: AND_I	and 	%r2, 0x0ba9, %r22
thr3_hw_intr_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_331), 16, 16)) -> intp(0, 0, 1)
	.word 0xb029000c  ! 4: ANDN_R	andn 	%r4, %r12, %r24
	.word 0xb329400e  ! 4: SLL_R	sll 	%r5, %r14, %r25
	.word 0xa838c00b  ! 4: XNOR_R	xnor 	%r3, %r11, %r20
	.word 0xb53a100f  ! 4: SRAX_R	srax	%r8, %r15, %r26
	.word 0xb929900a  ! 4: SLLX_R	sllx	%r6, %r10, %r28
	.word 0xb6b1800f  ! 4: ORNcc_R	orncc 	%r6, %r15, %r27
	.word 0xbd31500b  ! 4: SRLX_R	srlx	%r5, %r11, %r30
thr3_nuke_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_332), 16, 16)) -> intp(0, 2, 1)
	.word 0xac30c00d  ! 4: ORN_R	orn 	%r3, %r13, %r22
	.word 0xa939500e  ! 4: SRAX_R	srax	%r5, %r14, %r20
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaf29000e  ! 4: SLL_R	sll 	%r4, %r14, %r23
	.word 0xae11400a  ! 4: OR_R	or 	%r5, %r10, %r23
thr3_resum_intr_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_332), 16, 16)) -> intp(0, 3, 1)
	.word 0xb5317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r26
	.word 0xaa00800e  ! 4: ADD_R	add 	%r2, %r14, %r21
	.word 0xba01000d  ! 4: ADD_R	add 	%r4, %r13, %r29
	.word 0xac41800b  ! 4: ADDC_R	addc 	%r6, %r11, %r22
thr3_nuke_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_333), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd64180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb12a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r24
	.word 0xa81a2661  ! 4: XOR_I	xor 	%r8, 0x0661, %r20
	.word 0xbc18a55a  ! 4: XOR_I	xor 	%r2, 0x055a, %r30
thr3_resum_intr_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_333), 16, 16)) -> intp(1, 3, 1)
	.word 0xbd39800a  ! 4: SRA_R	sra 	%r6, %r10, %r30
	.word 0xb929400b  ! 4: SLL_R	sll 	%r5, %r11, %r28
	.word 0xb401a07f  ! 4: ADD_I	add 	%r6, 0x007f, %r26
thr3_nuke_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_334), 16, 16)) -> intp(1, 2, 1)
	.word 0xb9292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r28
	.word 0xb364180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb8ba2f43  ! 4: XNORcc_I	xnorcc 	%r8, 0x0f43, %r28
	.word 0xbb38c00e  ! 4: SRA_R	sra 	%r3, %r14, %r29
	.word 0xb202000d  ! 4: ADD_R	add 	%r8, %r13, %r25
	.word 0xad30800e  ! 4: SRL_R	srl 	%r2, %r14, %r22
	.word 0xb8c16744  ! 4: ADDCcc_I	addccc 	%r5, 0x0744, %r28
thr3_resum_intr_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_334), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa91ee66  ! 4: ORcc_I	orcc 	%r7, 0x0e66, %r21
thr3_hw_intr_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_335), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc2a2eec  ! 4: ANDN_I	andn 	%r8, 0x0eec, %r30
	.word 0xac31000c  ! 4: ORN_R	orn 	%r4, %r12, %r22
	.word 0xab64180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbd28c00d  ! 4: SLL_R	sll 	%r3, %r13, %r30
	.word 0xb609ac0b  ! 4: AND_I	and 	%r6, 0x0c0b, %r27
	.word 0xbc28800f  ! 4: ANDN_R	andn 	%r2, %r15, %r30
thr3_nuke_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_336), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa09a83d  ! 4: AND_I	and 	%r6, 0x083d, %r21
	.word 0xac90c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r22
	.word 0xa881c00c  ! 4: ADDcc_R	addcc 	%r7, %r12, %r20
	.word 0xae396117  ! 4: XNOR_I	xnor 	%r5, 0x0117, %r23
	.word 0xa928800f  ! 4: SLL_R	sll 	%r2, %r15, %r20
	.word 0xb282000d  ! 4: ADDcc_R	addcc 	%r8, %r13, %r25
thr3_resum_intr_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_336), 16, 16)) -> intp(0, 3, 1)
	.word 0xb72a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0xae00800a  ! 4: ADD_R	add 	%r2, %r10, %r23
	.word 0xbab8800c  ! 4: XNORcc_R	xnorcc 	%r2, %r12, %r29
thr3_hw_intr_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_337), 16, 16)) -> intp(1, 0, 1)
	.word 0xa89a000d  ! 4: XORcc_R	xorcc 	%r8, %r13, %r20
	.word 0xbc89a1e3  ! 4: ANDcc_I	andcc 	%r6, 0x01e3, %r30
	.word 0xab31d00b  ! 4: SRLX_R	srlx	%r7, %r11, %r21
	.word 0xa929d00c  ! 4: SLLX_R	sllx	%r7, %r12, %r20
	.word 0xb298a587  ! 4: XORcc_I	xorcc 	%r2, 0x0587, %r25
	.word 0xb891c00a  ! 4: ORcc_R	orcc 	%r7, %r10, %r28
thr3_hw_intr_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_338), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4c0c00b  ! 4: ADDCcc_R	addccc 	%r3, %r11, %r26
	.word 0xb631000e  ! 4: ORN_R	orn 	%r4, %r14, %r27
	.word 0xaa28c00e  ! 4: ANDN_R	andn 	%r3, %r14, %r21
	.word 0xa8192cad  ! 4: XOR_I	xor 	%r4, 0x0cad, %r20
	.word 0xb732000a  ! 4: SRL_R	srl 	%r8, %r10, %r27
	.word 0xac29400f  ! 4: ANDN_R	andn 	%r5, %r15, %r22
	.word 0xbc18abf3  ! 4: XOR_I	xor 	%r2, 0x0bf3, %r30
thr3_nuke_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_339), 16, 16)) -> intp(1, 2, 1)
	.word 0xb32a100b  ! 4: SLLX_R	sllx	%r8, %r11, %r25
	.word 0xbd39800d  ! 4: SRA_R	sra 	%r6, %r13, %r30
	.word 0xac8a000c  ! 4: ANDcc_R	andcc 	%r8, %r12, %r22
	.word 0xb00224eb  ! 4: ADD_I	add 	%r8, 0x04eb, %r24
	.word 0xb691e27e  ! 4: ORcc_I	orcc 	%r7, 0x027e, %r27
thr3_resum_intr_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_339), 16, 16)) -> intp(1, 3, 1)
	.word 0xb001c00c  ! 4: ADD_R	add 	%r7, %r12, %r24
	.word 0xb2a8800f  ! 4: ANDNcc_R	andncc 	%r2, %r15, %r25
	.word 0xb8b1a062  ! 4: ORNcc_I	orncc 	%r6, 0x0062, %r28
thr3_hw_intr_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_340), 16, 16)) -> intp(1, 0, 1)
	.word 0xb639800d  ! 4: XNOR_R	xnor 	%r6, %r13, %r27
	.word 0xac39400b  ! 4: XNOR_R	xnor 	%r5, %r11, %r22
	.word 0xaa31800d  ! 4: ORN_R	orn 	%r6, %r13, %r21
	.word 0xae30a173  ! 4: ORN_I	orn 	%r2, 0x0173, %r23
	.word 0xbab96eb3  ! 4: XNORcc_I	xnorcc 	%r5, 0x0eb3, %r29
	.word 0xbc08c00a  ! 4: AND_R	and 	%r3, %r10, %r30
thr3_nuke_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_341), 16, 16)) -> intp(1, 2, 1)
	.word 0xad31900c  ! 4: SRLX_R	srlx	%r6, %r12, %r22
	.word 0xaa10ac98  ! 4: OR_I	or 	%r2, 0x0c98, %r21
	.word 0xb531e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r26
	.word 0xbcb9223c  ! 4: XNORcc_I	xnorcc 	%r4, 0x023c, %r30
	.word 0xb728b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r27
	.word 0xae396746  ! 4: XNOR_I	xnor 	%r5, 0x0746, %r23
	.word 0xaac0800d  ! 4: ADDCcc_R	addccc 	%r2, %r13, %r21
thr3_resum_intr_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_341), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb29900a  ! 4: SLLX_R	sllx	%r6, %r10, %r29
	.word 0xa80127cc  ! 4: ADD_I	add 	%r4, 0x07cc, %r20
thr3_hw_intr_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_342), 16, 16)) -> intp(1, 0, 1)
	.word 0xab7a2401  ! 4: MOVR_I	move	%r8, 0xffffffcc, %r21
	.word 0xb48228e0  ! 4: ADDcc_I	addcc 	%r8, 0x08e0, %r26
	.word 0xab64180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbc00e3a2  ! 4: ADD_I	add 	%r3, 0x03a2, %r30
	.word 0xb681400a  ! 4: ADDcc_R	addcc 	%r5, %r10, %r27
	.word 0xb812000a  ! 4: OR_R	or 	%r8, %r10, %r28
	.word 0xb209800b  ! 4: AND_R	and 	%r6, %r11, %r25
thr3_hw_intr_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_343), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0c0a326  ! 4: ADDCcc_I	addccc 	%r2, 0x0326, %r24
	.word 0xb690ab14  ! 4: ORcc_I	orcc 	%r2, 0x0b14, %r27
	.word 0xbac1a033  ! 4: ADDCcc_I	addccc 	%r6, 0x0033, %r29
	.word 0xb638800b  ! 4: XNOR_R	xnor 	%r2, %r11, %r27
	.word 0xb739900b  ! 4: SRAX_R	srax	%r6, %r11, %r27
	.word 0xad30900e  ! 4: SRLX_R	srlx	%r2, %r14, %r22
thr3_nuke_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_344), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8012fee  ! 4: ADD_I	add 	%r4, 0x0fee, %r20
	.word 0xac91ecc7  ! 4: ORcc_I	orcc 	%r7, 0x0cc7, %r22
	.word 0xa8c0e481  ! 4: ADDCcc_I	addccc 	%r3, 0x0481, %r20
	.word 0xb2a9ecc2  ! 4: ANDNcc_I	andncc 	%r7, 0x0cc2, %r25
	.word 0xb6c1a87e  ! 4: ADDCcc_I	addccc 	%r6, 0x087e, %r27
	.word 0xba08a376  ! 4: AND_I	and 	%r2, 0x0376, %r29
thr3_resum_intr_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_344), 16, 16)) -> intp(1, 3, 1)
	.word 0xaab9a6cf  ! 4: XNORcc_I	xnorcc 	%r6, 0x06cf, %r21
	.word 0xba11800d  ! 4: OR_R	or 	%r6, %r13, %r29
thr3_hw_intr_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_345), 16, 16)) -> intp(1, 0, 1)
	.word 0xac02000a  ! 4: ADD_R	add 	%r8, %r10, %r22
	.word 0xa9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r20
	.word 0xac38c00f  ! 4: XNOR_R	xnor 	%r3, %r15, %r22
	.word 0xbc892067  ! 4: ANDcc_I	andcc 	%r4, 0x0067, %r30
	.word 0xbb2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r29
	.word 0xbaa9000d  ! 4: ANDNcc_R	andncc 	%r4, %r13, %r29
thr3_hw_intr_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_346), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6196492  ! 4: XOR_I	xor 	%r5, 0x0492, %r27
	.word 0xba81000b  ! 4: ADDcc_R	addcc 	%r4, %r11, %r29
	.word 0xbc916ba4  ! 4: ORcc_I	orcc 	%r5, 0x0ba4, %r30
	.word 0xb6c22276  ! 4: ADDCcc_I	addccc 	%r8, 0x0276, %r27
	.word 0xae80eade  ! 4: ADDcc_I	addcc 	%r3, 0x0ade, %r23
	.word 0xa809c00a  ! 4: AND_R	and 	%r7, %r10, %r20
thr3_nuke_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_347), 16, 16)) -> intp(0, 2, 1)
	.word 0xab29900e  ! 4: SLLX_R	sllx	%r6, %r14, %r21
	.word 0xba18efe9  ! 4: XOR_I	xor 	%r3, 0x0fe9, %r29
	.word 0xbcc12ed9  ! 4: ADDCcc_I	addccc 	%r4, 0x0ed9, %r30
	.word 0xb13a000d  ! 4: SRA_R	sra 	%r8, %r13, %r24
	.word 0xb939800a  ! 4: SRA_R	sra 	%r6, %r10, %r28
thr3_resum_intr_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_347), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf29c00b  ! 4: SLL_R	sll 	%r7, %r11, %r23
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
thr3_hw_intr_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_348), 16, 16)) -> intp(0, 0, 1)
	.word 0xaab8c00a  ! 4: XNORcc_R	xnorcc 	%r3, %r10, %r21
	.word 0xb618e8b0  ! 4: XOR_I	xor 	%r3, 0x08b0, %r27
	.word 0xa930800a  ! 4: SRL_R	srl 	%r2, %r10, %r20
	.word 0xbc90ee71  ! 4: ORcc_I	orcc 	%r3, 0x0e71, %r30
	.word 0xbb29d00c  ! 4: SLLX_R	sllx	%r7, %r12, %r29
	.word 0xaf292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r23
	.word 0xb638800c  ! 4: XNOR_R	xnor 	%r2, %r12, %r27
thr3_hw_intr_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_349), 16, 16)) -> intp(1, 0, 1)
	.word 0xab78840a  ! 4: MOVR_R	move	%r2, %r10, %r21
	.word 0xaa81400e  ! 4: ADDcc_R	addcc 	%r5, %r14, %r21
	.word 0xaca8ae7a  ! 4: ANDNcc_I	andncc 	%r2, 0x0e7a, %r22
	.word 0xbc90ae59  ! 4: ORcc_I	orcc 	%r2, 0x0e59, %r30
	.word 0xaeb127b3  ! 4: ORNcc_I	orncc 	%r4, 0x07b3, %r23
	.word 0xb698800e  ! 4: XORcc_R	xorcc 	%r2, %r14, %r27
	.word 0xbcb0a382  ! 4: ORNcc_I	orncc 	%r2, 0x0382, %r30
thr3_hw_intr_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_350), 16, 16)) -> intp(1, 0, 1)
	.word 0xbc11800f  ! 4: OR_R	or 	%r6, %r15, %r30
	.word 0xb681c00d  ! 4: ADDcc_R	addcc 	%r7, %r13, %r27
	.word 0xba41000e  ! 4: ADDC_R	addc 	%r4, %r14, %r29
	.word 0xb5643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb08920e7  ! 4: ANDcc_I	andcc 	%r4, 0x00e7, %r24
	.word 0xab317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r21
thr3_nuke_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_351), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4b225ee  ! 4: ORNcc_I	orncc 	%r8, 0x05ee, %r26
	.word 0xbca966f5  ! 4: ANDNcc_I	andncc 	%r5, 0x06f5, %r30
	.word 0xa97a2401  ! 4: MOVR_I	move	%r8, 0xfffffef5, %r20
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
thr3_resum_intr_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_351), 16, 16)) -> intp(0, 3, 1)
	.word 0xb131100f  ! 4: SRLX_R	srlx	%r4, %r15, %r24
thr3_hw_intr_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_352), 16, 16)) -> intp(1, 0, 1)
	.word 0xb488c00b  ! 4: ANDcc_R	andcc 	%r3, %r11, %r26
	.word 0xb239a2ba  ! 4: XNOR_I	xnor 	%r6, 0x02ba, %r25
	.word 0xaa30a2bf  ! 4: ORN_I	orn 	%r2, 0x02bf, %r21
	.word 0xaab9acc3  ! 4: XNORcc_I	xnorcc 	%r6, 0x0cc3, %r21
	.word 0xba99800c  ! 4: XORcc_R	xorcc 	%r6, %r12, %r29
	.word 0xaab9800a  ! 4: XNORcc_R	xnorcc 	%r6, %r10, %r21
	.word 0xae31000a  ! 4: ORN_R	orn 	%r4, %r10, %r23
thr3_hw_intr_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_353), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6b1c00f  ! 4: ORNcc_R	orncc 	%r7, %r15, %r27
	.word 0xba98c00c  ! 4: XORcc_R	xorcc 	%r3, %r12, %r29
	.word 0xb2b92b09  ! 4: XNORcc_I	xnorcc 	%r4, 0x0b09, %r25
	.word 0xb9323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xbd64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb2a9a2a8  ! 4: ANDNcc_I	andncc 	%r6, 0x02a8, %r25
	.word 0xb84167e7  ! 4: ADDC_I	addc 	%r5, 0x07e7, %r28
thr3_hw_intr_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_354), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa41000b  ! 4: ADDC_R	addc 	%r4, %r11, %r21
	.word 0xa938800a  ! 4: SRA_R	sra 	%r2, %r10, %r20
	.word 0xb5312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r26
	.word 0xb331400d  ! 4: SRL_R	srl 	%r5, %r13, %r25
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa801e180  ! 4: ADD_I	add 	%r7, 0x0180, %r20
	.word 0xbcc0e048  ! 4: ADDCcc_I	addccc 	%r3, 0x0048, %r30
thr3_hw_intr_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_355), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0b96f23  ! 4: XNORcc_I	xnorcc 	%r5, 0x0f23, %r24
	.word 0xb539400e  ! 4: SRA_R	sra 	%r5, %r14, %r26
	.word 0xa8b92e48  ! 4: XNORcc_I	xnorcc 	%r4, 0x0e48, %r20
	.word 0xb328a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r25
	.word 0xab39800f  ! 4: SRA_R	sra 	%r6, %r15, %r21
	.word 0xab39400d  ! 4: SRA_R	sra 	%r5, %r13, %r21
	.word 0xb4896b4d  ! 4: ANDcc_I	andcc 	%r5, 0x0b4d, %r26
thr3_hw_intr_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_356), 16, 16)) -> intp(1, 0, 1)
	.word 0xbd29100a  ! 4: SLLX_R	sllx	%r4, %r10, %r30
	.word 0xbab12b14  ! 4: ORNcc_I	orncc 	%r4, 0x0b14, %r29
	.word 0xaa09400a  ! 4: AND_R	and 	%r5, %r10, %r21
	.word 0xb764180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbac1800b  ! 4: ADDCcc_R	addccc 	%r6, %r11, %r29
	.word 0xb2b22a61  ! 4: ORNcc_I	orncc 	%r8, 0x0a61, %r25
	.word 0xb23922ef  ! 4: XNOR_I	xnor 	%r4, 0x02ef, %r25
thr3_nuke_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_357), 16, 16)) -> intp(1, 2, 1)
	.word 0xba8a000b  ! 4: ANDcc_R	andcc 	%r8, %r11, %r29
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
	.word 0xba892dac  ! 4: ANDcc_I	andcc 	%r4, 0x0dac, %r29
	.word 0xa978840b  ! 4: MOVR_R	move	%r2, %r11, %r20
	.word 0xab31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r21
	.word 0xa8c1800d  ! 4: ADDCcc_R	addccc 	%r6, %r13, %r20
thr3_resum_intr_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_357), 16, 16)) -> intp(1, 3, 1)
	.word 0xb081800d  ! 4: ADDcc_R	addcc 	%r6, %r13, %r24
	.word 0xb531400a  ! 4: SRL_R	srl 	%r5, %r10, %r26
	.word 0xb801ed23  ! 4: ADD_I	add 	%r7, 0x0d23, %r28
thr3_hw_intr_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_358), 16, 16)) -> intp(0, 0, 1)
	.word 0xb4a8800b  ! 4: ANDNcc_R	andncc 	%r2, %r11, %r26
	.word 0xb564180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaf296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r23
	.word 0xb881400d  ! 4: ADDcc_R	addcc 	%r5, %r13, %r28
	.word 0xb728e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r27
	.word 0xb04226f3  ! 4: ADDC_I	addc 	%r8, 0x06f3, %r24
thr3_hw_intr_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_359), 16, 16)) -> intp(0, 0, 1)
	.word 0xae10e802  ! 4: OR_I	or 	%r3, 0x0802, %r23
	.word 0xb639800a  ! 4: XNOR_R	xnor 	%r6, %r10, %r27
	.word 0xaec0800d  ! 4: ADDCcc_R	addccc 	%r2, %r13, %r23
	.word 0xb4812520  ! 4: ADDcc_I	addcc 	%r4, 0x0520, %r26
	.word 0xbc8165df  ! 4: ADDcc_I	addcc 	%r5, 0x05df, %r30
	.word 0xac11800c  ! 4: OR_R	or 	%r6, %r12, %r22
	.word 0xb811c00b  ! 4: OR_R	or 	%r7, %r11, %r28
thr3_nuke_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_360), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8c0ea04  ! 4: ADDCcc_I	addccc 	%r3, 0x0a04, %r28
	.word 0xb2a9c00c  ! 4: ANDNcc_R	andncc 	%r7, %r12, %r25
	.word 0xba28a1f9  ! 4: ANDN_I	andn 	%r2, 0x01f9, %r29
	.word 0xad39400f  ! 4: SRA_R	sra 	%r5, %r15, %r22
thr3_resum_intr_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_360), 16, 16)) -> intp(1, 3, 1)
	.word 0xb6c0a027  ! 4: ADDCcc_I	addccc 	%r2, 0x0027, %r27
thr3_hw_intr_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_361), 16, 16)) -> intp(0, 0, 1)
	.word 0xae096299  ! 4: AND_I	and 	%r5, 0x0299, %r23
	.word 0xb8996de5  ! 4: XORcc_I	xorcc 	%r5, 0x0de5, %r28
	.word 0xbd643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xae0a2205  ! 4: AND_I	and 	%r8, 0x0205, %r23
	.word 0xa830800e  ! 4: ORN_R	orn 	%r2, %r14, %r20
	.word 0xab2a000d  ! 4: SLL_R	sll 	%r8, %r13, %r21
thr3_hw_intr_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_362), 16, 16)) -> intp(0, 0, 1)
	.word 0xae39273e  ! 4: XNOR_I	xnor 	%r4, 0x073e, %r23
	.word 0xba416c97  ! 4: ADDC_I	addc 	%r5, 0x0c97, %r29
	.word 0xb130800a  ! 4: SRL_R	srl 	%r2, %r10, %r24
	.word 0xb028ec47  ! 4: ANDN_I	andn 	%r3, 0x0c47, %r24
	.word 0xbc00ab16  ! 4: ADD_I	add 	%r2, 0x0b16, %r30
	.word 0xb029000a  ! 4: ANDN_R	andn 	%r4, %r10, %r24
	.word 0xa930900b  ! 4: SRLX_R	srlx	%r2, %r11, %r20
thr3_nuke_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_363), 16, 16)) -> intp(0, 2, 1)
	.word 0xb578a401  ! 4: MOVR_I	move	%r2, 0xb, %r26
thr3_resum_intr_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_363), 16, 16)) -> intp(0, 3, 1)
	.word 0xb280e5c9  ! 4: ADDcc_I	addcc 	%r3, 0x05c9, %r25
	.word 0xacc12a07  ! 4: ADDCcc_I	addccc 	%r4, 0x0a07, %r22
	.word 0xac1221da  ! 4: OR_I	or 	%r8, 0x01da, %r22
thr3_nuke_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_364), 16, 16)) -> intp(0, 2, 1)
	.word 0xb97a2401  ! 4: MOVR_I	move	%r8, 0x1da, %r28
	.word 0xbb31500e  ! 4: SRLX_R	srlx	%r5, %r14, %r29
	.word 0xb128c00e  ! 4: SLL_R	sll 	%r3, %r14, %r24
	.word 0xb331d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r25
	.word 0xb4816ea6  ! 4: ADDcc_I	addcc 	%r5, 0x0ea6, %r26
	.word 0xba1928fb  ! 4: XOR_I	xor 	%r4, 0x08fb, %r29
	.word 0xaf29400c  ! 4: SLL_R	sll 	%r5, %r12, %r23
thr3_resum_intr_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_364), 16, 16)) -> intp(0, 3, 1)
	.word 0xb5323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r26
	.word 0xaf796401  ! 4: MOVR_I	move	%r5, 0x1, %r23
	.word 0xb339000e  ! 4: SRA_R	sra 	%r4, %r14, %r25
	.word 0xba10a0f1  ! 4: OR_I	or 	%r2, 0x00f1, %r29
thr3_nuke_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_365), 16, 16)) -> intp(0, 2, 1)
	.word 0xb898800c  ! 4: XORcc_R	xorcc 	%r2, %r12, %r28
	.word 0xaf293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r23
	.word 0xac09e4b0  ! 4: AND_I	and 	%r7, 0x04b0, %r22
thr3_resum_intr_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_365), 16, 16)) -> intp(0, 3, 1)
	.word 0xbc91a408  ! 4: ORcc_I	orcc 	%r6, 0x0408, %r30
	.word 0xb080ab81  ! 4: ADDcc_I	addcc 	%r2, 0x0b81, %r24
	.word 0xb889c00f  ! 4: ANDcc_R	andcc 	%r7, %r15, %r28
thr3_nuke_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_366), 16, 16)) -> intp(0, 2, 1)
	.word 0xb219c00f  ! 4: XOR_R	xor 	%r7, %r15, %r25
	.word 0xb6a924e7  ! 4: ANDNcc_I	andncc 	%r4, 0x04e7, %r27
	.word 0xa97a2401  ! 4: MOVR_I	move	%r8, 0x4e7, %r20
	.word 0xa831000b  ! 4: ORN_R	orn 	%r4, %r11, %r20
	.word 0xb139a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r24
thr3_resum_intr_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_366), 16, 16)) -> intp(0, 3, 1)
	.word 0xb932000a  ! 4: SRL_R	srl 	%r8, %r10, %r28
	.word 0xb0c0c00a  ! 4: ADDCcc_R	addccc 	%r3, %r10, %r24
	.word 0xb802000f  ! 4: ADD_R	add 	%r8, %r15, %r28
thr3_nuke_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_367), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8916de7  ! 4: ORcc_I	orcc 	%r5, 0x0de7, %r20
	.word 0xac32000a  ! 4: ORN_R	orn 	%r8, %r10, %r22
	.word 0xb131d00b  ! 4: SRLX_R	srlx	%r7, %r11, %r24
	.word 0xb338900e  ! 4: SRAX_R	srax	%r2, %r14, %r25
	.word 0xbd31e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r30
thr3_resum_intr_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_367), 16, 16)) -> intp(1, 3, 1)
	.word 0xb840800f  ! 4: ADDC_R	addc 	%r2, %r15, %r28
	.word 0xba00c00c  ! 4: ADD_R	add 	%r3, %r12, %r29
	.word 0xb531d00c  ! 4: SRLX_R	srlx	%r7, %r12, %r26
thr3_nuke_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_368), 16, 16)) -> intp(0, 2, 1)
	.word 0xb641a178  ! 4: ADDC_I	addc 	%r6, 0x0178, %r27
	.word 0xaeb1c00f  ! 4: ORNcc_R	orncc 	%r7, %r15, %r23
thr3_resum_intr_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_368), 16, 16)) -> intp(0, 3, 1)
	.word 0xb52a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r26
thr3_hw_intr_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_369), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r26
	.word 0xab313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r21
	.word 0xba82000b  ! 4: ADDcc_R	addcc 	%r8, %r11, %r29
	.word 0xb490c00a  ! 4: ORcc_R	orcc 	%r3, %r10, %r26
	.word 0xbb31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r29
	.word 0xae98a0ac  ! 4: XORcc_I	xorcc 	%r2, 0x00ac, %r23
thr3_nuke_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_370), 16, 16)) -> intp(1, 2, 1)
	.word 0xb579040e  ! 4: MOVR_R	move	%r4, %r14, %r26
	.word 0xb130b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r24
	.word 0xbc91000b  ! 4: ORcc_R	orcc 	%r4, %r11, %r30
	.word 0xb6a9c00d  ! 4: ANDNcc_R	andncc 	%r7, %r13, %r27
	.word 0xb332000b  ! 4: SRL_R	srl 	%r8, %r11, %r25
thr3_resum_intr_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_370), 16, 16)) -> intp(1, 3, 1)
	.word 0xaab1acc7  ! 4: ORNcc_I	orncc 	%r6, 0x0cc7, %r21
thr3_nuke_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_371), 16, 16)) -> intp(0, 2, 1)
	.word 0xbcc0800e  ! 4: ADDCcc_R	addccc 	%r2, %r14, %r30
	.word 0xb809c00f  ! 4: AND_R	and 	%r7, %r15, %r28
	.word 0xbb78a401  ! 4: MOVR_I	move	%r2, 0xf, %r29
	.word 0xb040ed81  ! 4: ADDC_I	addc 	%r3, 0x0d81, %r24
	.word 0xb009e652  ! 4: AND_I	and 	%r7, 0x0652, %r24
	.word 0xac91e807  ! 4: ORcc_I	orcc 	%r7, 0x0807, %r22
thr3_resum_intr_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_371), 16, 16)) -> intp(0, 3, 1)
	.word 0xa899400b  ! 4: XORcc_R	xorcc 	%r5, %r11, %r20
	.word 0xad32000a  ! 4: SRL_R	srl 	%r8, %r10, %r22
thr3_hw_intr_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_372), 16, 16)) -> intp(0, 0, 1)
	.word 0xb330d00f  ! 4: SRLX_R	srlx	%r3, %r15, %r25
	.word 0xb081ae1b  ! 4: ADDcc_I	addcc 	%r6, 0x0e1b, %r24
	.word 0xae09800d  ! 4: AND_R	and 	%r6, %r13, %r23
	.word 0xb001000b  ! 4: ADD_R	add 	%r4, %r11, %r24
	.word 0xb731500c  ! 4: SRLX_R	srlx	%r5, %r12, %r27
	.word 0xb128f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r24
thr3_hw_intr_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_373), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4c1a87b  ! 4: ADDCcc_I	addccc 	%r6, 0x087b, %r26
	.word 0xb6a92b8a  ! 4: ANDNcc_I	andncc 	%r4, 0x0b8a, %r27
	.word 0xba29c00b  ! 4: ANDN_R	andn 	%r7, %r11, %r29
	.word 0xba01e83b  ! 4: ADD_I	add 	%r7, 0x083b, %r29
	.word 0xbaba2f1b  ! 4: XNORcc_I	xnorcc 	%r8, 0x0f1b, %r29
	.word 0xbc40af02  ! 4: ADDC_I	addc 	%r2, 0x0f02, %r30
thr3_hw_intr_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_374), 16, 16)) -> intp(1, 0, 1)
	.word 0xa818c00e  ! 4: XOR_R	xor 	%r3, %r14, %r20
	.word 0xb338c00f  ! 4: SRA_R	sra 	%r3, %r15, %r25
	.word 0xacc165ba  ! 4: ADDCcc_I	addccc 	%r5, 0x05ba, %r22
	.word 0xb539100c  ! 4: SRAX_R	srax	%r4, %r12, %r26
	.word 0xac89400a  ! 4: ANDcc_R	andcc 	%r5, %r10, %r22
	.word 0xaca8c00c  ! 4: ANDNcc_R	andncc 	%r3, %r12, %r22
	.word 0xb731900d  ! 4: SRLX_R	srlx	%r6, %r13, %r27
thr3_nuke_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_375), 16, 16)) -> intp(1, 2, 1)
	.word 0xad7a040b  ! 4: MOVR_R	move	%r8, %r11, %r22
	.word 0xb619ec18  ! 4: XOR_I	xor 	%r7, 0x0c18, %r27
thr3_resum_intr_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_375), 16, 16)) -> intp(1, 3, 1)
	.word 0xb739500e  ! 4: SRAX_R	srax	%r5, %r14, %r27
thr3_nuke_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_376), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6292677  ! 4: ANDN_I	andn 	%r4, 0x0677, %r27
	.word 0xaca8a26b  ! 4: ANDNcc_I	andncc 	%r2, 0x026b, %r22
	.word 0xb0c1000c  ! 4: ADDCcc_R	addccc 	%r4, %r12, %r24
	.word 0xbc00c00d  ! 4: ADD_R	add 	%r3, %r13, %r30
thr3_resum_intr_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_376), 16, 16)) -> intp(1, 3, 1)
	.word 0xb281c00f  ! 4: ADDcc_R	addcc 	%r7, %r15, %r25
	.word 0xb53a000d  ! 4: SRA_R	sra 	%r8, %r13, %r26
	.word 0xaa90a870  ! 4: ORcc_I	orcc 	%r2, 0x0870, %r21
	.word 0xb491400f  ! 4: ORcc_R	orcc 	%r5, %r15, %r26
thr3_nuke_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_377), 16, 16)) -> intp(0, 2, 1)
	.word 0xaca9000b  ! 4: ANDNcc_R	andncc 	%r4, %r11, %r22
	.word 0xb6c2261e  ! 4: ADDCcc_I	addccc 	%r8, 0x061e, %r27
	.word 0xaa30eeb1  ! 4: ORN_I	orn 	%r3, 0x0eb1, %r21
	.word 0xbca9400e  ! 4: ANDNcc_R	andncc 	%r5, %r14, %r30
	.word 0xaa00c00f  ! 4: ADD_R	add 	%r3, %r15, %r21
thr3_resum_intr_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_377), 16, 16)) -> intp(0, 3, 1)
	.word 0xaec0800c  ! 4: ADDCcc_R	addccc 	%r2, %r12, %r23
	.word 0xaa39c00f  ! 4: XNOR_R	xnor 	%r7, %r15, %r21
	.word 0xba98c00f  ! 4: XORcc_R	xorcc 	%r3, %r15, %r29
	.word 0xba39c00d  ! 4: XNOR_R	xnor 	%r7, %r13, %r29
thr3_hw_intr_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_378), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r29
	.word 0xbcc0e4a2  ! 4: ADDCcc_I	addccc 	%r3, 0x04a2, %r30
	.word 0xbc9a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r30
	.word 0xba81000f  ! 4: ADDcc_R	addcc 	%r4, %r15, %r29
	.word 0xae08800e  ! 4: AND_R	and 	%r2, %r14, %r23
	.word 0xac91a14e  ! 4: ORcc_I	orcc 	%r6, 0x014e, %r22
	.word 0xb130800d  ! 4: SRL_R	srl 	%r2, %r13, %r24
thr3_hw_intr_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_379), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6b9294f  ! 4: XNORcc_I	xnorcc 	%r4, 0x094f, %r27
	.word 0xb731900a  ! 4: SRLX_R	srlx	%r6, %r10, %r27
	.word 0xa808c00e  ! 4: AND_R	and 	%r3, %r14, %r20
	.word 0xb889400a  ! 4: ANDcc_R	andcc 	%r5, %r10, %r28
	.word 0xbc88eb61  ! 4: ANDcc_I	andcc 	%r3, 0x0b61, %r30
	.word 0xae2924bc  ! 4: ANDN_I	andn 	%r4, 0x04bc, %r23
thr3_nuke_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_380), 16, 16)) -> intp(0, 2, 1)
	.word 0xb289c00e  ! 4: ANDcc_R	andcc 	%r7, %r14, %r25
thr3_resum_intr_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_380), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa41c00d  ! 4: ADDC_R	addc 	%r7, %r13, %r21
	.word 0xaf643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xad29900c  ! 4: SLLX_R	sllx	%r6, %r12, %r22
thr3_nuke_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_381), 16, 16)) -> intp(0, 2, 1)
	.word 0xb0822ce2  ! 4: ADDcc_I	addcc 	%r8, 0x0ce2, %r24
thr3_resum_intr_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_381), 16, 16)) -> intp(0, 3, 1)
	.word 0xa888e3ff  ! 4: ANDcc_I	andcc 	%r3, 0x03ff, %r20
	.word 0xb2b1c00c  ! 4: ORNcc_R	orncc 	%r7, %r12, %r25
thr3_nuke_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_382), 16, 16)) -> intp(0, 2, 1)
	.word 0xa818c00a  ! 4: XOR_R	xor 	%r3, %r10, %r20
	.word 0xb532100e  ! 4: SRLX_R	srlx	%r8, %r14, %r26
	.word 0xb730b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r27
thr3_resum_intr_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_382), 16, 16)) -> intp(0, 3, 1)
	.word 0xb611c00a  ! 4: OR_R	or 	%r7, %r10, %r27
thr3_nuke_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_383), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb32000b  ! 4: SRL_R	srl 	%r8, %r11, %r29
	.word 0xaab1400f  ! 4: ORNcc_R	orncc 	%r5, %r15, %r21
	.word 0xb564180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb831000f  ! 4: ORN_R	orn 	%r4, %r15, %r28
	.word 0xb539d00c  ! 4: SRAX_R	srax	%r7, %r12, %r26
	.word 0xab313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r21
	.word 0xb81a2c1b  ! 4: XOR_I	xor 	%r8, 0x0c1b, %r28
thr3_resum_intr_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_383), 16, 16)) -> intp(1, 3, 1)
	.word 0xb681c00e  ! 4: ADDcc_R	addcc 	%r7, %r14, %r27
	.word 0xb529000a  ! 4: SLL_R	sll 	%r4, %r10, %r26
	.word 0xb881ee42  ! 4: ADDcc_I	addcc 	%r7, 0x0e42, %r28
	.word 0xb030800d  ! 4: ORN_R	orn 	%r2, %r13, %r24
thr3_nuke_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_384), 16, 16)) -> intp(0, 2, 1)
	.word 0xaf38900c  ! 4: SRAX_R	srax	%r2, %r12, %r23
thr3_resum_intr_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_384), 16, 16)) -> intp(0, 3, 1)
	.word 0xb529100a  ! 4: SLLX_R	sllx	%r4, %r10, %r26
thr3_nuke_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_385), 16, 16)) -> intp(1, 2, 1)
	.word 0xb5317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r26
	.word 0xb4c0e2ef  ! 4: ADDCcc_I	addccc 	%r3, 0x02ef, %r26
	.word 0xbc296a4f  ! 4: ANDN_I	andn 	%r5, 0x0a4f, %r30
	.word 0xb138c00e  ! 4: SRA_R	sra 	%r3, %r14, %r24
	.word 0xaa916f8c  ! 4: ORcc_I	orcc 	%r5, 0x0f8c, %r21
thr3_resum_intr_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_385), 16, 16)) -> intp(1, 3, 1)
	.word 0xb339e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r25
	.word 0xb281aab6  ! 4: ADDcc_I	addcc 	%r6, 0x0ab6, %r25
	.word 0xb09a299b  ! 4: XORcc_I	xorcc 	%r8, 0x099b, %r24
	.word 0xaf31d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r23
thr3_nuke_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_386), 16, 16)) -> intp(0, 2, 1)
	.word 0xbd39e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r30
	.word 0xb8816132  ! 4: ADDcc_I	addcc 	%r5, 0x0132, %r28
	.word 0xbab9a4f4  ! 4: XNORcc_I	xnorcc 	%r6, 0x04f4, %r29
	.word 0xb939400b  ! 4: SRA_R	sra 	%r5, %r11, %r28
thr3_resum_intr_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_386), 16, 16)) -> intp(0, 3, 1)
	.word 0xa9322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r20
	.word 0xb929400f  ! 4: SLL_R	sll 	%r5, %r15, %r28
	.word 0xb408c00c  ! 4: AND_R	and 	%r3, %r12, %r26
thr3_nuke_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_387), 16, 16)) -> intp(0, 2, 1)
	.word 0xa881c00d  ! 4: ADDcc_R	addcc 	%r7, %r13, %r20
	.word 0xb8392de8  ! 4: XNOR_I	xnor 	%r4, 0x0de8, %r28
	.word 0xb689400f  ! 4: ANDcc_R	andcc 	%r5, %r15, %r27
	.word 0xb3322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r25
	.word 0xa819400a  ! 4: XOR_R	xor 	%r5, %r10, %r20
thr3_resum_intr_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_387), 16, 16)) -> intp(0, 3, 1)
	.word 0xb091800d  ! 4: ORcc_R	orcc 	%r6, %r13, %r24
	.word 0xad323001  ! 4: SRLX_I	srlx	%r8, 0x0001, %r22
thr3_hw_intr_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_388), 16, 16)) -> intp(0, 0, 1)
	.word 0xb240c00e  ! 4: ADDC_R	addc 	%r3, %r14, %r25
	.word 0xb409800b  ! 4: AND_R	and 	%r6, %r11, %r26
	.word 0xbc99800a  ! 4: XORcc_R	xorcc 	%r6, %r10, %r30
	.word 0xbc89aca5  ! 4: ANDcc_I	andcc 	%r6, 0x0ca5, %r30
	.word 0xb09a201c  ! 4: XORcc_I	xorcc 	%r8, 0x001c, %r24
	.word 0xb690800a  ! 4: ORcc_R	orcc 	%r2, %r10, %r27
thr3_nuke_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_389), 16, 16)) -> intp(0, 2, 1)
	.word 0xae3a000d  ! 4: XNOR_R	xnor 	%r8, %r13, %r23
	.word 0xb0922aae  ! 4: ORcc_I	orcc 	%r8, 0x0aae, %r24
	.word 0xb5293001  ! 4: SLLX_I	sllx	%r4, 0x0001, %r26
	.word 0xa929f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r20
thr3_resum_intr_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_389), 16, 16)) -> intp(0, 3, 1)
	.word 0xb400800c  ! 4: ADD_R	add 	%r2, %r12, %r26
	.word 0xbc08800b  ! 4: AND_R	and 	%r2, %r11, %r30
	.word 0xac99000d  ! 4: XORcc_R	xorcc 	%r4, %r13, %r22
thr3_nuke_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_390), 16, 16)) -> intp(0, 2, 1)
	.word 0xab38a001  ! 4: SRA_I	sra 	%r2, 0x0001, %r21
	.word 0xbb29800c  ! 4: SLL_R	sll 	%r6, %r12, %r29
thr3_resum_intr_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_390), 16, 16)) -> intp(0, 3, 1)
	.word 0xa810c00b  ! 4: OR_R	or 	%r3, %r11, %r20
	.word 0xb32a100b  ! 4: SLLX_R	sllx	%r8, %r11, %r25
	.word 0xa841c00f  ! 4: ADDC_R	addc 	%r7, %r15, %r20
thr3_nuke_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_391), 16, 16)) -> intp(0, 2, 1)
	.word 0xba9a000d  ! 4: XORcc_R	xorcc 	%r8, %r13, %r29
thr3_resum_intr_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_391), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa19ec60  ! 4: XOR_I	xor 	%r7, 0x0c60, %r21
	.word 0xbc0a20af  ! 4: AND_I	and 	%r8, 0x00af, %r30
	.word 0xba11c00d  ! 4: OR_R	or 	%r7, %r13, %r29
thr3_nuke_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_392), 16, 16)) -> intp(1, 2, 1)
	.word 0xaab1c00a  ! 4: ORNcc_R	orncc 	%r7, %r10, %r21
	.word 0xaf79a401  ! 4: MOVR_I	move	%r6, 0xa, %r23
	.word 0xab29f001  ! 4: SLLX_I	sllx	%r7, 0x0001, %r21
thr3_resum_intr_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_392), 16, 16)) -> intp(1, 3, 1)
	.word 0xbd38900e  ! 4: SRAX_R	srax	%r2, %r14, %r30
	.word 0xaa89400f  ! 4: ANDcc_R	andcc 	%r5, %r15, %r21
	.word 0xbb38c00e  ! 4: SRA_R	sra 	%r3, %r14, %r29
	.word 0xb129d00c  ! 4: SLLX_R	sllx	%r7, %r12, %r24
thr3_hw_intr_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_393), 16, 16)) -> intp(0, 0, 1)
	.word 0xb828800e  ! 4: ANDN_R	andn 	%r2, %r14, %r28
	.word 0xae08800c  ! 4: AND_R	and 	%r2, %r12, %r23
	.word 0xb779a401  ! 4: MOVR_I	move	%r6, 0xc, %r27
	.word 0xa801c00b  ! 4: ADD_R	add 	%r7, %r11, %r20
	.word 0xab28c00a  ! 4: SLL_R	sll 	%r3, %r10, %r21
	.word 0xb6296022  ! 4: ANDN_I	andn 	%r5, 0x0022, %r27
thr3_hw_intr_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_394), 16, 16)) -> intp(1, 0, 1)
	.word 0xb880a67b  ! 4: ADDcc_I	addcc 	%r2, 0x067b, %r28
	.word 0xb211400a  ! 4: OR_R	or 	%r5, %r10, %r25
	.word 0xae00ea8b  ! 4: ADD_I	add 	%r3, 0x0a8b, %r23
	.word 0xaa40c00a  ! 4: ADDC_R	addc 	%r3, %r10, %r21
	.word 0xa811400d  ! 4: OR_R	or 	%r5, %r13, %r20
	.word 0xb001c00d  ! 4: ADD_R	add 	%r7, %r13, %r24
	.word 0xb280e161  ! 4: ADDcc_I	addcc 	%r3, 0x0161, %r25
thr3_nuke_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_395), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa18e617  ! 4: XOR_I	xor 	%r3, 0x0617, %r21
thr3_resum_intr_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_395), 16, 16)) -> intp(0, 3, 1)
	.word 0xab78c40c  ! 4: MOVR_R	move	%r3, %r12, %r21
	.word 0xaf296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r23
	.word 0xa810800a  ! 4: OR_R	or 	%r2, %r10, %r20
thr3_hw_intr_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_396), 16, 16)) -> intp(1, 0, 1)
	.word 0xb179840a  ! 4: MOVR_R	move	%r6, %r10, %r24
	.word 0xbcc1a81e  ! 4: ADDCcc_I	addccc 	%r6, 0x081e, %r30
	.word 0xb4a9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r26
	.word 0xb028800b  ! 4: ANDN_R	andn 	%r2, %r11, %r24
	.word 0xac90efe4  ! 4: ORcc_I	orcc 	%r3, 0x0fe4, %r22
	.word 0xb889400e  ! 4: ANDcc_R	andcc 	%r5, %r14, %r28
	.word 0xa8816d4c  ! 4: ADDcc_I	addcc 	%r5, 0x0d4c, %r20
thr3_hw_intr_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_397), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0b0c00f  ! 4: ORNcc_R	orncc 	%r3, %r15, %r24
	.word 0xb611c00e  ! 4: OR_R	or 	%r7, %r14, %r27
	.word 0xbd312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r30
	.word 0xbac160fc  ! 4: ADDCcc_I	addccc 	%r5, 0x00fc, %r29
	.word 0xb4316c66  ! 4: ORN_I	orn 	%r5, 0x0c66, %r26
	.word 0xa841eec5  ! 4: ADDC_I	addc 	%r7, 0x0ec5, %r20
	.word 0xb8b22bd0  ! 4: ORNcc_I	orncc 	%r8, 0x0bd0, %r28
thr3_hw_intr_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_398), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa89c00d  ! 4: ANDcc_R	andcc 	%r7, %r13, %r21
	.word 0xb2b9400c  ! 4: XNORcc_R	xnorcc 	%r5, %r12, %r25
	.word 0xb808ece3  ! 4: AND_I	and 	%r3, 0x0ce3, %r28
	.word 0xac296279  ! 4: ANDN_I	andn 	%r5, 0x0279, %r22
	.word 0xbc81000e  ! 4: ADDcc_R	addcc 	%r4, %r14, %r30
	.word 0xb4b9a954  ! 4: XNORcc_I	xnorcc 	%r6, 0x0954, %r26
thr3_hw_intr_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_399), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6a9e1cd  ! 4: ANDNcc_I	andncc 	%r7, 0x01cd, %r27
	.word 0xacc0a88d  ! 4: ADDCcc_I	addccc 	%r2, 0x088d, %r22
	.word 0xa802000c  ! 4: ADD_R	add 	%r8, %r12, %r20
	.word 0xacb8c00f  ! 4: XNORcc_R	xnorcc 	%r3, %r15, %r22
	.word 0xbc91aee8  ! 4: ORcc_I	orcc 	%r6, 0x0ee8, %r30
	.word 0xb8c1277f  ! 4: ADDCcc_I	addccc 	%r4, 0x077f, %r28
thr3_nuke_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_400), 16, 16)) -> intp(1, 2, 1)
	.word 0xac18e249  ! 4: XOR_I	xor 	%r3, 0x0249, %r22
thr3_resum_intr_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_400), 16, 16)) -> intp(1, 3, 1)
	.word 0xaec1c00d  ! 4: ADDCcc_R	addccc 	%r7, %r13, %r23
thr3_hw_intr_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_401), 16, 16)) -> intp(1, 0, 1)
	.word 0xae41000a  ! 4: ADDC_R	addc 	%r4, %r10, %r23
	.word 0xaa30800d  ! 4: ORN_R	orn 	%r2, %r13, %r21
	.word 0xb290c00e  ! 4: ORcc_R	orcc 	%r3, %r14, %r25
	.word 0xab30f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r21
	.word 0xb61a000a  ! 4: XOR_R	xor 	%r8, %r10, %r27
	.word 0xb228c00d  ! 4: ANDN_R	andn 	%r3, %r13, %r25
thr3_hw_intr_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_402), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb39100d  ! 4: SRAX_R	srax	%r4, %r13, %r29
	.word 0xb600c00f  ! 4: ADD_R	add 	%r3, %r15, %r27
	.word 0xaec22516  ! 4: ADDCcc_I	addccc 	%r8, 0x0516, %r23
	.word 0xae31000b  ! 4: ORN_R	orn 	%r4, %r11, %r23
	.word 0xb440c00d  ! 4: ADDC_R	addc 	%r3, %r13, %r26
	.word 0xb829c00a  ! 4: ANDN_R	andn 	%r7, %r10, %r28
	.word 0xbca8c00c  ! 4: ANDNcc_R	andncc 	%r3, %r12, %r30
thr3_hw_intr_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_403), 16, 16)) -> intp(0, 0, 1)
	.word 0xb091400c  ! 4: ORcc_R	orcc 	%r5, %r12, %r24
	.word 0xb128a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r24
	.word 0xb288ab49  ! 4: ANDcc_I	andcc 	%r2, 0x0b49, %r25
	.word 0xbcb1000c  ! 4: ORNcc_R	orncc 	%r4, %r12, %r30
	.word 0xae2a2313  ! 4: ANDN_I	andn 	%r8, 0x0313, %r23
	.word 0xb429a6d8  ! 4: ANDN_I	andn 	%r6, 0x06d8, %r26
	.word 0xae09c00b  ! 4: AND_R	and 	%r7, %r11, %r23
thr3_nuke_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_404), 16, 16)) -> intp(1, 2, 1)
	.word 0xbb29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r29
	.word 0xab31900e  ! 4: SRLX_R	srlx	%r6, %r14, %r21
	.word 0xb029400e  ! 4: ANDN_R	andn 	%r5, %r14, %r24
	.word 0xac28c00a  ! 4: ANDN_R	andn 	%r3, %r10, %r22
	.word 0xb689c00a  ! 4: ANDcc_R	andcc 	%r7, %r10, %r27
thr3_resum_intr_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_404), 16, 16)) -> intp(1, 3, 1)
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb4c2000d  ! 4: ADDCcc_R	addccc 	%r8, %r13, %r26
	.word 0xb2aa000e  ! 4: ANDNcc_R	andncc 	%r8, %r14, %r25
thr3_hw_intr_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_405), 16, 16)) -> intp(0, 0, 1)
	.word 0xb2a8a087  ! 4: ANDNcc_I	andncc 	%r2, 0x0087, %r25
	.word 0xb280800a  ! 4: ADDcc_R	addcc 	%r2, %r10, %r25
	.word 0xaf79840d  ! 4: MOVR_R	move	%r6, %r13, %r23
	.word 0xbcc1a58e  ! 4: ADDCcc_I	addccc 	%r6, 0x058e, %r30
	.word 0xb528d00d  ! 4: SLLX_R	sllx	%r3, %r13, %r26
	.word 0xbc19800a  ! 4: XOR_R	xor 	%r6, %r10, %r30
thr3_nuke_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_406), 16, 16)) -> intp(0, 2, 1)
	.word 0xb6b0c00b  ! 4: ORNcc_R	orncc 	%r3, %r11, %r27
	.word 0xb930c00f  ! 4: SRL_R	srl 	%r3, %r15, %r28
	.word 0xab29800a  ! 4: SLL_R	sll 	%r6, %r10, %r21
	.word 0xaab169a4  ! 4: ORNcc_I	orncc 	%r5, 0x09a4, %r21
	.word 0xa929500a  ! 4: SLLX_R	sllx	%r5, %r10, %r20
	.word 0xaf31c00e  ! 4: SRL_R	srl 	%r7, %r14, %r23
thr3_resum_intr_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_406), 16, 16)) -> intp(0, 3, 1)
	.word 0xacb0800f  ! 4: ORNcc_R	orncc 	%r2, %r15, %r22
	.word 0xa8c12240  ! 4: ADDCcc_I	addccc 	%r4, 0x0240, %r20
thr3_nuke_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_407), 16, 16)) -> intp(1, 2, 1)
	.word 0xb6b16832  ! 4: ORNcc_I	orncc 	%r5, 0x0832, %r27
	.word 0xa8112b5a  ! 4: OR_I	or 	%r4, 0x0b5a, %r20
thr3_resum_intr_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_407), 16, 16)) -> intp(1, 3, 1)
	.word 0xb091800c  ! 4: ORcc_R	orcc 	%r6, %r12, %r24
	.word 0xb2c1aa13  ! 4: ADDCcc_I	addccc 	%r6, 0x0a13, %r25
thr3_nuke_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_408), 16, 16)) -> intp(0, 2, 1)
	.word 0xa8b1c00f  ! 4: ORNcc_R	orncc 	%r7, %r15, %r20
	.word 0xa9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xae31800a  ! 4: ORN_R	orn 	%r6, %r10, %r23
	.word 0xb778a401  ! 4: MOVR_I	move	%r2, 0xa, %r27
thr3_resum_intr_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_408), 16, 16)) -> intp(0, 3, 1)
	.word 0xa8c0800d  ! 4: ADDCcc_R	addccc 	%r2, %r13, %r20
thr3_hw_intr_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_409), 16, 16)) -> intp(1, 0, 1)
	.word 0xac81800c  ! 4: ADDcc_R	addcc 	%r6, %r12, %r22
	.word 0xb889c00f  ! 4: ANDcc_R	andcc 	%r7, %r15, %r28
	.word 0xb492254f  ! 4: ORcc_I	orcc 	%r8, 0x054f, %r26
	.word 0xb039000a  ! 4: XNOR_R	xnor 	%r4, %r10, %r24
	.word 0xae11400c  ! 4: OR_R	or 	%r5, %r12, %r23
	.word 0xbb78a401  ! 4: MOVR_I	move	%r2, 0xc, %r29
	.word 0xae39e167  ! 4: XNOR_I	xnor 	%r7, 0x0167, %r23
thr3_hw_intr_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_410), 16, 16)) -> intp(0, 0, 1)
	.word 0xb8196f6f  ! 4: XOR_I	xor 	%r5, 0x0f6f, %r28
	.word 0xaab8e97e  ! 4: XNORcc_I	xnorcc 	%r3, 0x097e, %r21
	.word 0xab30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r21
	.word 0xac08e1c5  ! 4: AND_I	and 	%r3, 0x01c5, %r22
	.word 0xbb7a2401  ! 4: MOVR_I	move	%r8, 0x1c5, %r29
	.word 0xaa00a907  ! 4: ADD_I	add 	%r2, 0x0907, %r21
	.word 0xb2312f4c  ! 4: ORN_I	orn 	%r4, 0x0f4c, %r25
thr3_nuke_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_411), 16, 16)) -> intp(1, 2, 1)
	.word 0xb8316a88  ! 4: ORN_I	orn 	%r5, 0x0a88, %r28
thr3_resum_intr_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_411), 16, 16)) -> intp(1, 3, 1)
	.word 0xa92a100b  ! 4: SLLX_R	sllx	%r8, %r11, %r20
	.word 0xbb29100d  ! 4: SLLX_R	sllx	%r4, %r13, %r29
thr3_nuke_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_412), 16, 16)) -> intp(1, 2, 1)
	.word 0xac8921b5  ! 4: ANDcc_I	andcc 	%r4, 0x01b5, %r22
	.word 0xaa98c00a  ! 4: XORcc_R	xorcc 	%r3, %r10, %r21
thr3_resum_intr_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_412), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa89000e  ! 4: ANDcc_R	andcc 	%r4, %r14, %r21
thr3_hw_intr_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_413), 16, 16)) -> intp(1, 0, 1)
	.word 0xb040c00a  ! 4: ADDC_R	addc 	%r3, %r10, %r24
	.word 0xb298800a  ! 4: XORcc_R	xorcc 	%r2, %r10, %r25
	.word 0xbaa9ae26  ! 4: ANDNcc_I	andncc 	%r6, 0x0e26, %r29
	.word 0xbb29100c  ! 4: SLLX_R	sllx	%r4, %r12, %r29
	.word 0xb039e8ff  ! 4: XNOR_I	xnor 	%r7, 0x08ff, %r24
	.word 0xad7a2401  ! 4: MOVR_I	move	%r8, 0x8ff, %r22
thr3_nuke_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_414), 16, 16)) -> intp(1, 2, 1)
	.word 0xae11c00a  ! 4: OR_R	or 	%r7, %r10, %r23
	.word 0xba19800c  ! 4: XOR_R	xor 	%r6, %r12, %r29
thr3_resum_intr_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_414), 16, 16)) -> intp(1, 3, 1)
	.word 0xa80a23df  ! 4: AND_I	and 	%r8, 0x03df, %r20
	.word 0xb731100a  ! 4: SRLX_R	srlx	%r4, %r10, %r27
	.word 0xb88124dd  ! 4: ADDcc_I	addcc 	%r4, 0x04dd, %r28
	.word 0xad38900d  ! 4: SRAX_R	srax	%r2, %r13, %r22
thr3_nuke_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_415), 16, 16)) -> intp(0, 2, 1)
	.word 0xb218e09a  ! 4: XOR_I	xor 	%r3, 0x009a, %r25
	.word 0xaeb8800d  ! 4: XNORcc_R	xnorcc 	%r2, %r13, %r23
	.word 0xb338d00d  ! 4: SRAX_R	srax	%r3, %r13, %r25
thr3_resum_intr_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_415), 16, 16)) -> intp(0, 3, 1)
	.word 0xae31c00f  ! 4: ORN_R	orn 	%r7, %r15, %r23
	.word 0xb4b16222  ! 4: ORNcc_I	orncc 	%r5, 0x0222, %r26
thr3_hw_intr_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_416), 16, 16)) -> intp(1, 0, 1)
	.word 0xb60924d7  ! 4: AND_I	and 	%r4, 0x04d7, %r27
	.word 0xac19c00a  ! 4: XOR_R	xor 	%r7, %r10, %r22
	.word 0xb698a0ed  ! 4: XORcc_I	xorcc 	%r2, 0x00ed, %r27
	.word 0xaf78840a  ! 4: MOVR_R	move	%r2, %r10, %r23
	.word 0xa810e2b8  ! 4: OR_I	or 	%r3, 0x02b8, %r20
	.word 0xb4b9658d  ! 4: XNORcc_I	xnorcc 	%r5, 0x058d, %r26
thr3_hw_intr_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_417), 16, 16)) -> intp(1, 0, 1)
	.word 0xaf31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r23
	.word 0xa939000b  ! 4: SRA_R	sra 	%r4, %r11, %r20
	.word 0xb5296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r26
	.word 0xb6c0800c  ! 4: ADDCcc_R	addccc 	%r2, %r12, %r27
	.word 0xa811000d  ! 4: OR_R	or 	%r4, %r13, %r20
	.word 0xa932100c  ! 4: SRLX_R	srlx	%r8, %r12, %r20
thr3_hw_intr_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_418), 16, 16)) -> intp(1, 0, 1)
	.word 0xb441e4c5  ! 4: ADDC_I	addc 	%r7, 0x04c5, %r26
	.word 0xbc99800d  ! 4: XORcc_R	xorcc 	%r6, %r13, %r30
	.word 0xaa81ed71  ! 4: ADDcc_I	addcc 	%r7, 0x0d71, %r21
	.word 0xa839a8f2  ! 4: XNOR_I	xnor 	%r6, 0x08f2, %r20
	.word 0xb099000c  ! 4: XORcc_R	xorcc 	%r4, %r12, %r24
	.word 0xb179440c  ! 4: MOVR_R	move	%r5, %r12, %r24
thr3_hw_intr_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_419), 16, 16)) -> intp(0, 0, 1)
	.word 0xb889800d  ! 4: ANDcc_R	andcc 	%r6, %r13, %r28
	.word 0xbd31d00e  ! 4: SRLX_R	srlx	%r7, %r14, %r30
	.word 0xac91000f  ! 4: ORcc_R	orcc 	%r4, %r15, %r22
	.word 0xba98800b  ! 4: XORcc_R	xorcc 	%r2, %r11, %r29
	.word 0xb2a8800c  ! 4: ANDNcc_R	andncc 	%r2, %r12, %r25
	.word 0xb428a254  ! 4: ANDN_I	andn 	%r2, 0x0254, %r26
	.word 0xbb38d00f  ! 4: SRAX_R	srax	%r3, %r15, %r29
thr3_hw_intr_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_420), 16, 16)) -> intp(1, 0, 1)
	.word 0xb0b0800f  ! 4: ORNcc_R	orncc 	%r2, %r15, %r24
	.word 0xb330a001  ! 4: SRL_I	srl 	%r2, 0x0001, %r25
	.word 0xb481e90d  ! 4: ADDcc_I	addcc 	%r7, 0x090d, %r26
	.word 0xbb396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r29
	.word 0xb330c00c  ! 4: SRL_R	srl 	%r3, %r12, %r25
	.word 0xac116471  ! 4: OR_I	or 	%r5, 0x0471, %r22
thr3_hw_intr_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_421), 16, 16)) -> intp(0, 0, 1)
	.word 0xaf7a2401  ! 4: MOVR_I	move	%r8, 0x471, %r23
	.word 0xae41e560  ! 4: ADDC_I	addc 	%r7, 0x0560, %r23
	.word 0xb528a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r26
	.word 0xb1292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r24
	.word 0xaf31d00f  ! 4: SRLX_R	srlx	%r7, %r15, %r23
	.word 0xbaa8e64b  ! 4: ANDNcc_I	andncc 	%r3, 0x064b, %r29
	.word 0xaf31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r23
thr3_nuke_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_422), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc312d28  ! 4: ORN_I	orn 	%r4, 0x0d28, %r30
	.word 0xbc392164  ! 4: XNOR_I	xnor 	%r4, 0x0164, %r30
	.word 0xb839c00f  ! 4: XNOR_R	xnor 	%r7, %r15, %r28
	.word 0xb019aed7  ! 4: XOR_I	xor 	%r6, 0x0ed7, %r24
	.word 0xaf39500a  ! 4: SRAX_R	srax	%r5, %r10, %r23
	.word 0xaa922edc  ! 4: ORcc_I	orcc 	%r8, 0x0edc, %r21
	.word 0xab29000c  ! 4: SLL_R	sll 	%r4, %r12, %r21
thr3_resum_intr_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_422), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2a8ea25  ! 4: ANDNcc_I	andncc 	%r3, 0x0a25, %r25
	.word 0xa819e185  ! 4: XOR_I	xor 	%r7, 0x0185, %r20
	.word 0xacb9000f  ! 4: XNORcc_R	xnorcc 	%r4, %r15, %r22
	.word 0xb209edf1  ! 4: AND_I	and 	%r7, 0x0df1, %r25
thr3_nuke_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_423), 16, 16)) -> intp(1, 2, 1)
	.word 0xbc29800a  ! 4: ANDN_R	andn 	%r6, %r10, %r30
	.word 0xbb31000d  ! 4: SRL_R	srl 	%r4, %r13, %r29
	.word 0xbc81ac60  ! 4: ADDcc_I	addcc 	%r6, 0x0c60, %r30
	.word 0xb890c00d  ! 4: ORcc_R	orcc 	%r3, %r13, %r28
	.word 0xa964180e  ! 4: MOVcc_R	<illegal instruction>
thr3_resum_intr_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_423), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0a8c00f  ! 4: ANDNcc_R	andncc 	%r3, %r15, %r24
	.word 0xb840800f  ! 4: ADDC_R	addc 	%r2, %r15, %r28
thr3_hw_intr_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_424), 16, 16)) -> intp(0, 0, 1)
	.word 0xaab0c00b  ! 4: ORNcc_R	orncc 	%r3, %r11, %r21
	.word 0xb89a202f  ! 4: XORcc_I	xorcc 	%r8, 0x002f, %r28
	.word 0xb6aa000d  ! 4: ANDNcc_R	andncc 	%r8, %r13, %r27
	.word 0xb139e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r24
	.word 0xb889000e  ! 4: ANDcc_R	andcc 	%r4, %r14, %r28
	.word 0xb6b969d7  ! 4: XNORcc_I	xnorcc 	%r5, 0x09d7, %r27
thr3_hw_intr_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_425), 16, 16)) -> intp(0, 0, 1)
	.word 0xac822e5e  ! 4: ADDcc_I	addcc 	%r8, 0x0e5e, %r22
	.word 0xb2b9edf0  ! 4: XNORcc_I	xnorcc 	%r7, 0x0df0, %r25
	.word 0xb681c00a  ! 4: ADDcc_R	addcc 	%r7, %r10, %r27
	.word 0xb9317001  ! 4: SRLX_I	srlx	%r5, 0x0001, %r28
	.word 0xbb29400e  ! 4: SLL_R	sll 	%r5, %r14, %r29
	.word 0xae29c00d  ! 4: ANDN_R	andn 	%r7, %r13, %r23
	.word 0xab31400d  ! 4: SRL_R	srl 	%r5, %r13, %r21
thr3_hw_intr_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_426), 16, 16)) -> intp(0, 0, 1)
	.word 0xba00e854  ! 4: ADD_I	add 	%r3, 0x0854, %r29
	.word 0xb928800d  ! 4: SLL_R	sll 	%r2, %r13, %r28
	.word 0xaa80800c  ! 4: ADDcc_R	addcc 	%r2, %r12, %r21
	.word 0xb01a000d  ! 4: XOR_R	xor 	%r8, %r13, %r24
	.word 0xb139e001  ! 4: SRA_I	sra 	%r7, 0x0001, %r24
	.word 0xae392bf6  ! 4: XNOR_I	xnor 	%r4, 0x0bf6, %r23
thr3_nuke_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_427), 16, 16)) -> intp(1, 2, 1)
	.word 0xb330800c  ! 4: SRL_R	srl 	%r2, %r12, %r25
	.word 0xb1792401  ! 4: MOVR_I	move	%r4, 0xc, %r24
	.word 0xb610e151  ! 4: OR_I	or 	%r3, 0x0151, %r27
	.word 0xbb79440e  ! 4: MOVR_R	move	%r5, %r14, %r29
	.word 0xba99c00b  ! 4: XORcc_R	xorcc 	%r7, %r11, %r29
	.word 0xaf64180b  ! 4: MOVcc_R	<illegal instruction>
thr3_resum_intr_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_427), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc99800e  ! 4: XORcc_R	xorcc 	%r6, %r14, %r30
	.word 0xaf29c00c  ! 4: SLL_R	sll 	%r7, %r12, %r23
	.word 0xac89800c  ! 4: ANDcc_R	andcc 	%r6, %r12, %r22
thr3_hw_intr_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_428), 16, 16)) -> intp(0, 0, 1)
	.word 0xb628800a  ! 4: ANDN_R	andn 	%r2, %r10, %r27
	.word 0xb810e767  ! 4: OR_I	or 	%r3, 0x0767, %r28
	.word 0xb128f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r24
	.word 0xb2a8800e  ! 4: ANDNcc_R	andncc 	%r2, %r14, %r25
	.word 0xb9643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb128b001  ! 4: SLLX_I	sllx	%r2, 0x0001, %r24
thr3_hw_intr_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_429), 16, 16)) -> intp(1, 0, 1)
	.word 0xba89a12c  ! 4: ANDcc_I	andcc 	%r6, 0x012c, %r29
	.word 0xbc39c00a  ! 4: XNOR_R	xnor 	%r7, %r10, %r30
	.word 0xae18e53f  ! 4: XOR_I	xor 	%r3, 0x053f, %r23
	.word 0xae01a277  ! 4: ADD_I	add 	%r6, 0x0277, %r23
	.word 0xb728a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r27
	.word 0xb01a2e1c  ! 4: XOR_I	xor 	%r8, 0x0e1c, %r24
	.word 0xb680800a  ! 4: ADDcc_R	addcc 	%r2, %r10, %r27
thr3_nuke_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_430), 16, 16)) -> intp(0, 2, 1)
	.word 0xb801000b  ! 4: ADD_R	add 	%r4, %r11, %r28
thr3_resum_intr_430:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_430), 16, 16)) -> intp(0, 3, 1)
	.word 0xb8312b92  ! 4: ORN_I	orn 	%r4, 0x0b92, %r28
	.word 0xb929000c  ! 4: SLL_R	sll 	%r4, %r12, %r28
	.word 0xa93a000c  ! 4: SRA_R	sra 	%r8, %r12, %r20
thr3_hw_intr_431:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_431), 16, 16)) -> intp(0, 0, 1)
	.word 0xacc1a4e9  ! 4: ADDCcc_I	addccc 	%r6, 0x04e9, %r22
	.word 0xbb30e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r29
	.word 0xba42000f  ! 4: ADDC_R	addc 	%r8, %r15, %r29
	.word 0xa930b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r20
	.word 0xab31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r21
	.word 0xbd30f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r30
	.word 0xb329b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r25
thr3_hw_intr_432:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_432), 16, 16)) -> intp(1, 0, 1)
	.word 0xb218800b  ! 4: XOR_R	xor 	%r2, %r11, %r25
	.word 0xb531d00e  ! 4: SRLX_R	srlx	%r7, %r14, %r26
	.word 0xba88800f  ! 4: ANDcc_R	andcc 	%r2, %r15, %r29
	.word 0xb4b9aa16  ! 4: XNORcc_I	xnorcc 	%r6, 0x0a16, %r26
	.word 0xb2b1c00d  ! 4: ORNcc_R	orncc 	%r7, %r13, %r25
	.word 0xb090800e  ! 4: ORcc_R	orcc 	%r2, %r14, %r24
	.word 0xb2b16e22  ! 4: ORNcc_I	orncc 	%r5, 0x0e22, %r25
thr3_nuke_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_433), 16, 16)) -> intp(0, 2, 1)
	.word 0xa930e001  ! 4: SRL_I	srl 	%r3, 0x0001, %r20
	.word 0xa9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r20
thr3_resum_intr_433:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_433), 16, 16)) -> intp(0, 3, 1)
	.word 0xa839800a  ! 4: XNOR_R	xnor 	%r6, %r10, %r20
thr3_hw_intr_434:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_434), 16, 16)) -> intp(0, 0, 1)
	.word 0xac90e48c  ! 4: ORcc_I	orcc 	%r3, 0x048c, %r22
	.word 0xbcaa000b  ! 4: ANDNcc_R	andncc 	%r8, %r11, %r30
	.word 0xb2b1a1bc  ! 4: ORNcc_I	orncc 	%r6, 0x01bc, %r25
	.word 0xbc012c41  ! 4: ADD_I	add 	%r4, 0x0c41, %r30
	.word 0xaac0c00b  ! 4: ADDCcc_R	addccc 	%r3, %r11, %r21
	.word 0xb0b22c67  ! 4: ORNcc_I	orncc 	%r8, 0x0c67, %r24
thr3_nuke_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_435), 16, 16)) -> intp(0, 2, 1)
	.word 0xaa09a45d  ! 4: AND_I	and 	%r6, 0x045d, %r21
	.word 0xb730d00c  ! 4: SRLX_R	srlx	%r3, %r12, %r27
	.word 0xb8c1400c  ! 4: ADDCcc_R	addccc 	%r5, %r12, %r28
thr3_resum_intr_435:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_435), 16, 16)) -> intp(0, 3, 1)
	.word 0xa928c00e  ! 4: SLL_R	sll 	%r3, %r14, %r20
	.word 0xbc31c00a  ! 4: ORN_R	orn 	%r7, %r10, %r30
thr3_hw_intr_436:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_436), 16, 16)) -> intp(1, 0, 1)
	.word 0xb69a284d  ! 4: XORcc_I	xorcc 	%r8, 0x084d, %r27
	.word 0xaa31800c  ! 4: ORN_R	orn 	%r6, %r12, %r21
	.word 0xac08ea84  ! 4: AND_I	and 	%r3, 0x0a84, %r22
	.word 0xbc30c00d  ! 4: ORN_R	orn 	%r3, %r13, %r30
	.word 0xb831000b  ! 4: ORN_R	orn 	%r4, %r11, %r28
	.word 0xb928d00b  ! 4: SLLX_R	sllx	%r3, %r11, %r28
thr3_nuke_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_437), 16, 16)) -> intp(1, 2, 1)
	.word 0xb801800a  ! 4: ADD_R	add 	%r6, %r10, %r28
	.word 0xb8322d74  ! 4: ORN_I	orn 	%r8, 0x0d74, %r28
	.word 0xa810c00b  ! 4: OR_R	or 	%r3, %r11, %r20
thr3_resum_intr_437:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_437), 16, 16)) -> intp(1, 3, 1)
	.word 0xb888e145  ! 4: ANDcc_I	andcc 	%r3, 0x0145, %r28
	.word 0xab29100e  ! 4: SLLX_R	sllx	%r4, %r14, %r21
	.word 0xbd29800b  ! 4: SLL_R	sll 	%r6, %r11, %r30
	.word 0xb429000b  ! 4: ANDN_R	andn 	%r4, %r11, %r26
thr3_nuke_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_438), 16, 16)) -> intp(1, 2, 1)
	.word 0xb129d00e  ! 4: SLLX_R	sllx	%r7, %r14, %r24
thr3_resum_intr_438:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_438), 16, 16)) -> intp(1, 3, 1)
	.word 0xb489400b  ! 4: ANDcc_R	andcc 	%r5, %r11, %r26
	.word 0xb601000d  ! 4: ADD_R	add 	%r4, %r13, %r27
thr3_hw_intr_439:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_439), 16, 16)) -> intp(0, 0, 1)
	.word 0xb831230c  ! 4: ORN_I	orn 	%r4, 0x030c, %r28
	.word 0xaa30a86c  ! 4: ORN_I	orn 	%r2, 0x086c, %r21
	.word 0xb6012193  ! 4: ADD_I	add 	%r4, 0x0193, %r27
	.word 0xaa1a000b  ! 4: XOR_R	xor 	%r8, %r11, %r21
	.word 0xb819c00e  ! 4: XOR_R	xor 	%r7, %r14, %r28
	.word 0xb931100b  ! 4: SRLX_R	srlx	%r4, %r11, %r28
thr3_hw_intr_440:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_440), 16, 16)) -> intp(1, 0, 1)
	.word 0xa8b16bea  ! 4: ORNcc_I	orncc 	%r5, 0x0bea, %r20
	.word 0xad28900c  ! 4: SLLX_R	sllx	%r2, %r12, %r22
	.word 0xae11800b  ! 4: OR_R	or 	%r6, %r11, %r23
	.word 0xb329000b  ! 4: SLL_R	sll 	%r4, %r11, %r25
	.word 0xb088acdc  ! 4: ANDcc_I	andcc 	%r2, 0x0cdc, %r24
	.word 0xb2c227db  ! 4: ADDCcc_I	addccc 	%r8, 0x07db, %r25
	.word 0xb0922d66  ! 4: ORcc_I	orcc 	%r8, 0x0d66, %r24
thr3_hw_intr_441:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_441), 16, 16)) -> intp(1, 0, 1)
	.word 0xa964180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xacb1400e  ! 4: ORNcc_R	orncc 	%r5, %r14, %r22
	.word 0xb219c00c  ! 4: XOR_R	xor 	%r7, %r12, %r25
	.word 0xb409400a  ! 4: AND_R	and 	%r5, %r10, %r26
	.word 0xb811ed68  ! 4: OR_I	or 	%r7, 0x0d68, %r28
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xaeb1400f  ! 4: ORNcc_R	orncc 	%r5, %r15, %r23
thr3_hw_intr_442:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_442), 16, 16)) -> intp(1, 0, 1)
	.word 0xa882246a  ! 4: ADDcc_I	addcc 	%r8, 0x046a, %r20
	.word 0xb029800f  ! 4: ANDN_R	andn 	%r6, %r15, %r24
	.word 0xb0b8800d  ! 4: XNORcc_R	xnorcc 	%r2, %r13, %r24
	.word 0xaa28800c  ! 4: ANDN_R	andn 	%r2, %r12, %r21
	.word 0xb682000a  ! 4: ADDcc_R	addcc 	%r8, %r10, %r27
	.word 0xbc80a5f8  ! 4: ADDcc_I	addcc 	%r2, 0x05f8, %r30
thr3_nuke_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_443), 16, 16)) -> intp(0, 2, 1)
	.word 0xba00af34  ! 4: ADD_I	add 	%r2, 0x0f34, %r29
	.word 0xa929d00b  ! 4: SLLX_R	sllx	%r7, %r11, %r20
	.word 0xad31400a  ! 4: SRL_R	srl 	%r5, %r10, %r22
	.word 0xbd39500c  ! 4: SRAX_R	srax	%r5, %r12, %r30
	.word 0xaab12e75  ! 4: ORNcc_I	orncc 	%r4, 0x0e75, %r21
thr3_resum_intr_443:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_443), 16, 16)) -> intp(0, 3, 1)
	.word 0xbd2a2001  ! 4: SLL_I	sll 	%r8, 0x0001, %r30
thr3_hw_intr_444:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_444), 16, 16)) -> intp(0, 0, 1)
	.word 0xba08e59b  ! 4: AND_I	and 	%r3, 0x059b, %r29
	.word 0xba09800a  ! 4: AND_R	and 	%r6, %r10, %r29
	.word 0xbcc1000f  ! 4: ADDCcc_R	addccc 	%r4, %r15, %r30
	.word 0xb431a7e7  ! 4: ORN_I	orn 	%r6, 0x07e7, %r26
	.word 0xb564180f  ! 4: MOVcc_R	<illegal instruction>
	.word 0xaa996ead  ! 4: XORcc_I	xorcc 	%r5, 0x0ead, %r21
	.word 0xb4a9800f  ! 4: ANDNcc_R	andncc 	%r6, %r15, %r26
thr3_hw_intr_445:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_445), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa0224cd  ! 4: ADD_I	add 	%r8, 0x04cd, %r21
	.word 0xa83a2357  ! 4: XNOR_I	xnor 	%r8, 0x0357, %r20
	.word 0xb7322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r27
	.word 0xb241e69d  ! 4: ADDC_I	addc 	%r7, 0x069d, %r25
	.word 0xae91000d  ! 4: ORcc_R	orcc 	%r4, %r13, %r23
	.word 0xbd28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r30
thr3_nuke_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_446), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa112564  ! 4: OR_I	or 	%r4, 0x0564, %r21
	.word 0xba912cdb  ! 4: ORcc_I	orcc 	%r4, 0x0cdb, %r29
	.word 0xab322001  ! 4: SRL_I	srl 	%r8, 0x0001, %r21
	.word 0xba19a51b  ! 4: XOR_I	xor 	%r6, 0x051b, %r29
	.word 0xb89166ec  ! 4: ORcc_I	orcc 	%r5, 0x06ec, %r28
thr3_resum_intr_446:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_446), 16, 16)) -> intp(1, 3, 1)
	.word 0xacb9a842  ! 4: XNORcc_I	xnorcc 	%r6, 0x0842, %r22
	.word 0xbcb0a845  ! 4: ORNcc_I	orncc 	%r2, 0x0845, %r30
	.word 0xbd31100d  ! 4: SRLX_R	srlx	%r4, %r13, %r30
thr3_hw_intr_447:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_447), 16, 16)) -> intp(0, 0, 1)
	.word 0xba28c00c  ! 4: ANDN_R	andn 	%r3, %r12, %r29
	.word 0xad64180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa889000f  ! 4: ANDcc_R	andcc 	%r4, %r15, %r20
	.word 0xa829c00f  ! 4: ANDN_R	andn 	%r7, %r15, %r20
	.word 0xbc18800c  ! 4: XOR_R	xor 	%r2, %r12, %r30
	.word 0xb179a401  ! 4: MOVR_I	move	%r6, 0xc, %r24
	.word 0xb928f001  ! 4: SLLX_I	sllx	%r3, 0x0001, %r28
thr3_hw_intr_448:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_448), 16, 16)) -> intp(1, 0, 1)
	.word 0xb6c0eaa0  ! 4: ADDCcc_I	addccc 	%r3, 0x0aa0, %r27
	.word 0xba8a000f  ! 4: ANDcc_R	andcc 	%r8, %r15, %r29
	.word 0xaab8a4ed  ! 4: XNORcc_I	xnorcc 	%r2, 0x04ed, %r21
	.word 0xaf7a2401  ! 4: MOVR_I	move	%r8, 0x4ed, %r23
	.word 0xbd28a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r30
	.word 0xb612000e  ! 4: OR_R	or 	%r8, %r14, %r27
thr3_nuke_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_449), 16, 16)) -> intp(0, 2, 1)
	.word 0xa81164c6  ! 4: OR_I	or 	%r5, 0x04c6, %r20
	.word 0xaab1c00f  ! 4: ORNcc_R	orncc 	%r7, %r15, %r21
	.word 0xaa3920ed  ! 4: XNOR_I	xnor 	%r4, 0x00ed, %r21
	.word 0xbb643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xb209000d  ! 4: AND_R	and 	%r4, %r13, %r25
	.word 0xab31400b  ! 4: SRL_R	srl 	%r5, %r11, %r21
	.word 0xb6b1ac53  ! 4: ORNcc_I	orncc 	%r6, 0x0c53, %r27
thr3_resum_intr_449:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_449), 16, 16)) -> intp(0, 3, 1)
	.word 0xaab16218  ! 4: ORNcc_I	orncc 	%r5, 0x0218, %r21
	.word 0xaeba2dfe  ! 4: XNORcc_I	xnorcc 	%r8, 0x0dfe, %r23
	.word 0xacb1400e  ! 4: ORNcc_R	orncc 	%r5, %r14, %r22
thr3_nuke_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_450), 16, 16)) -> intp(1, 2, 1)
	.word 0xab7a2401  ! 4: MOVR_I	move	%r8, 0xe, %r21
	.word 0xa8992e8f  ! 4: XORcc_I	xorcc 	%r4, 0x0e8f, %r20
	.word 0xae91400b  ! 4: ORcc_R	orcc 	%r5, %r11, %r23
	.word 0xaa00c00e  ! 4: ADD_R	add 	%r3, %r14, %r21
	.word 0xba3a2bd4  ! 4: XNOR_I	xnor 	%r8, 0x0bd4, %r29
	.word 0xa929b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r20
	.word 0xb532100b  ! 4: SRLX_R	srlx	%r8, %r11, %r26
thr3_resum_intr_450:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_450), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa09e2c4  ! 4: AND_I	and 	%r7, 0x02c4, %r21
thr3_nuke_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_451), 16, 16)) -> intp(0, 2, 1)
	.word 0xae89c00b  ! 4: ANDcc_R	andcc 	%r7, %r11, %r23
	.word 0xb764180b  ! 4: MOVcc_R	<illegal instruction>
	.word 0xb2a9e493  ! 4: ANDNcc_I	andncc 	%r7, 0x0493, %r25
	.word 0xb164180e  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa8b1281c  ! 4: ORNcc_I	orncc 	%r4, 0x081c, %r20
thr3_resum_intr_451:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_451), 16, 16)) -> intp(0, 3, 1)
	.word 0xaf796401  ! 4: MOVR_I	move	%r5, 0x81c, %r23
	.word 0xb329a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r25
	.word 0xbcaa000d  ! 4: ANDNcc_R	andncc 	%r8, %r13, %r30
	.word 0xba396d2f  ! 4: XNOR_I	xnor 	%r5, 0x0d2f, %r29
thr3_nuke_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_452), 16, 16)) -> intp(0, 2, 1)
	.word 0xba2a2e0a  ! 4: ANDN_I	andn 	%r8, 0x0e0a, %r29
	.word 0xb080800c  ! 4: ADDcc_R	addcc 	%r2, %r12, %r24
	.word 0xbc90c00b  ! 4: ORcc_R	orcc 	%r3, %r11, %r30
	.word 0xac4129c4  ! 4: ADDC_I	addc 	%r4, 0x09c4, %r22
	.word 0xbc1969ae  ! 4: XOR_I	xor 	%r5, 0x09ae, %r30
	.word 0xaa18c00d  ! 4: XOR_R	xor 	%r3, %r13, %r21
thr3_resum_intr_452:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_452), 16, 16)) -> intp(0, 3, 1)
	.word 0xb2c1800b  ! 4: ADDCcc_R	addccc 	%r6, %r11, %r25
	.word 0xab31b001  ! 4: SRLX_I	srlx	%r6, 0x0001, %r21
	.word 0xac91800d  ! 4: ORcc_R	orcc 	%r6, %r13, %r22
	.word 0xba88800d  ! 4: ANDcc_R	andcc 	%r2, %r13, %r29
thr3_nuke_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_453), 16, 16)) -> intp(1, 2, 1)
	.word 0xbd296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r30
	.word 0xb379c40d  ! 4: MOVR_R	move	%r7, %r13, %r25
	.word 0xa81127df  ! 4: OR_I	or 	%r4, 0x07df, %r20
	.word 0xad79440d  ! 4: MOVR_R	move	%r5, %r13, %r22
	.word 0xb81167f8  ! 4: OR_I	or 	%r5, 0x07f8, %r28
thr3_resum_intr_453:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_453), 16, 16)) -> intp(1, 3, 1)
	.word 0xb1792401  ! 4: MOVR_I	move	%r4, 0xfffffff8, %r24
	.word 0xb764180a  ! 4: MOVcc_R	<illegal instruction>
thr3_hw_intr_454:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_454), 16, 16)) -> intp(0, 0, 1)
	.word 0xb602000c  ! 4: ADD_R	add 	%r8, %r12, %r27
	.word 0xb0c1c00c  ! 4: ADDCcc_R	addccc 	%r7, %r12, %r24
	.word 0xb7297001  ! 4: SLLX_I	sllx	%r5, 0x0001, %r27
	.word 0xb3316001  ! 4: SRL_I	srl 	%r5, 0x0001, %r25
	.word 0xbaba000a  ! 4: XNORcc_R	xnorcc 	%r8, %r10, %r29
	.word 0xae01673a  ! 4: ADD_I	add 	%r5, 0x073a, %r23
	.word 0xa801c00a  ! 4: ADD_R	add 	%r7, %r10, %r20
thr3_hw_intr_455:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_455), 16, 16)) -> intp(0, 0, 1)
	.word 0xb0416b25  ! 4: ADDC_I	addc 	%r5, 0x0b25, %r24
	.word 0xacc1e5bb  ! 4: ADDCcc_I	addccc 	%r7, 0x05bb, %r22
	.word 0xad29400a  ! 4: SLL_R	sll 	%r5, %r10, %r22
	.word 0xb099400d  ! 4: XORcc_R	xorcc 	%r5, %r13, %r24
	.word 0xaa316969  ! 4: ORN_I	orn 	%r5, 0x0969, %r21
	.word 0xbd78c40f  ! 4: MOVR_R	move	%r3, %r15, %r30
thr3_hw_intr_456:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_456), 16, 16)) -> intp(0, 0, 1)
	.word 0xad643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xac00a523  ! 4: ADD_I	add 	%r2, 0x0523, %r22
	.word 0xb8a8ac48  ! 4: ANDNcc_I	andncc 	%r2, 0x0c48, %r28
	.word 0xbb79e401  ! 4: MOVR_I	move	%r7, 0xc48, %r29
	.word 0xb139100a  ! 4: SRAX_R	srax	%r4, %r10, %r24
	.word 0xa880a7e9  ! 4: ADDcc_I	addcc 	%r2, 0x07e9, %r20
thr3_nuke_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_457), 16, 16)) -> intp(0, 2, 1)
	.word 0xbcb1a938  ! 4: ORNcc_I	orncc 	%r6, 0x0938, %r30
	.word 0xbc09400e  ! 4: AND_R	and 	%r5, %r14, %r30
	.word 0xaa40ea7b  ! 4: ADDC_I	addc 	%r3, 0x0a7b, %r21
	.word 0xbaa9000e  ! 4: ANDNcc_R	andncc 	%r4, %r14, %r29
	.word 0xbc812bad  ! 4: ADDcc_I	addcc 	%r4, 0x0bad, %r30
	.word 0xaeb9800e  ! 4: XNORcc_R	xnorcc 	%r6, %r14, %r23
thr3_resum_intr_457:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_457), 16, 16)) -> intp(0, 3, 1)
	.word 0xb499a97d  ! 4: XORcc_I	xorcc 	%r6, 0x097d, %r26
thr3_nuke_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_458), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa816be2  ! 4: ADDcc_I	addcc 	%r5, 0x0be2, %r21
	.word 0xbc912384  ! 4: ORcc_I	orcc 	%r4, 0x0384, %r30
	.word 0xac11c00d  ! 4: OR_R	or 	%r7, %r13, %r22
	.word 0xb730d00c  ! 4: SRLX_R	srlx	%r3, %r12, %r27
	.word 0xb829400f  ! 4: ANDN_R	andn 	%r5, %r15, %r28
	.word 0xaa98e6ce  ! 4: XORcc_I	xorcc 	%r3, 0x06ce, %r21
thr3_resum_intr_458:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_458), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa10c00f  ! 4: OR_R	or 	%r3, %r15, %r21
thr3_hw_intr_459:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_459), 16, 16)) -> intp(0, 0, 1)
	.word 0xba0a2af8  ! 4: AND_I	and 	%r8, 0x0af8, %r29
	.word 0xb00929be  ! 4: AND_I	and 	%r4, 0x09be, %r24
	.word 0xae98ad0f  ! 4: XORcc_I	xorcc 	%r2, 0x0d0f, %r23
	.word 0xbd28800b  ! 4: SLL_R	sll 	%r2, %r11, %r30
	.word 0xb0c1c00d  ! 4: ADDCcc_R	addccc 	%r7, %r13, %r24
	.word 0xb481800a  ! 4: ADDcc_R	addcc 	%r6, %r10, %r26
thr3_nuke_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_460), 16, 16)) -> intp(0, 2, 1)
	.word 0xb4aa2aa8  ! 4: ANDNcc_I	andncc 	%r8, 0x0aa8, %r26
	.word 0xbc99400d  ! 4: XORcc_R	xorcc 	%r5, %r13, %r30
	.word 0xae98c00a  ! 4: XORcc_R	xorcc 	%r3, %r10, %r23
	.word 0xb4c1400e  ! 4: ADDCcc_R	addccc 	%r5, %r14, %r26
	.word 0xb001000a  ! 4: ADD_R	add 	%r4, %r10, %r24
	.word 0xba19ec16  ! 4: XOR_I	xor 	%r7, 0x0c16, %r29
	.word 0xb2b9a086  ! 4: XNORcc_I	xnorcc 	%r6, 0x0086, %r25
thr3_resum_intr_460:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_460), 16, 16)) -> intp(0, 3, 1)
	.word 0xae192822  ! 4: XOR_I	xor 	%r4, 0x0822, %r23
thr3_hw_intr_461:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_461), 16, 16)) -> intp(1, 0, 1)
	.word 0xba82000b  ! 4: ADDcc_R	addcc 	%r8, %r11, %r29
	.word 0xb431e962  ! 4: ORN_I	orn 	%r7, 0x0962, %r26
	.word 0xb009400e  ! 4: AND_R	and 	%r5, %r14, %r24
	.word 0xad79840f  ! 4: MOVR_R	move	%r6, %r15, %r22
	.word 0xba91000a  ! 4: ORcc_R	orcc 	%r4, %r10, %r29
	.word 0xba9965de  ! 4: XORcc_I	xorcc 	%r5, 0x05de, %r29
	.word 0xbb79840e  ! 4: MOVR_R	move	%r6, %r14, %r29
thr3_hw_intr_462:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_462), 16, 16)) -> intp(1, 0, 1)
	.word 0xaa09400d  ! 4: AND_R	and 	%r5, %r13, %r21
	.word 0xaa016950  ! 4: ADD_I	add 	%r5, 0x0950, %r21
	.word 0xbb30f001  ! 4: SRLX_I	srlx	%r3, 0x0001, %r29
	.word 0xb481c00f  ! 4: ADDcc_R	addcc 	%r7, %r15, %r26
	.word 0xacb1800a  ! 4: ORNcc_R	orncc 	%r6, %r10, %r22
	.word 0xbc29000a  ! 4: ANDN_R	andn 	%r4, %r10, %r30
	.word 0xbc80eeb0  ! 4: ADDcc_I	addcc 	%r3, 0x0eb0, %r30
thr3_hw_intr_463:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_463), 16, 16)) -> intp(1, 0, 1)
	.word 0xb628c00d  ! 4: ANDN_R	andn 	%r3, %r13, %r27
	.word 0xbc02000b  ! 4: ADD_R	add 	%r8, %r11, %r30
	.word 0xb818c00f  ! 4: XOR_R	xor 	%r3, %r15, %r28
	.word 0xb4022250  ! 4: ADD_I	add 	%r8, 0x0250, %r26
	.word 0xb2b9400d  ! 4: XNORcc_R	xnorcc 	%r5, %r13, %r25
	.word 0xac08c00f  ! 4: AND_R	and 	%r3, %r15, %r22
thr3_hw_intr_464:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_464), 16, 16)) -> intp(0, 0, 1)
	.word 0xac88800d  ! 4: ANDcc_R	andcc 	%r2, %r13, %r22
	.word 0xb241800a  ! 4: ADDC_R	addc 	%r6, %r10, %r25
	.word 0xb239a700  ! 4: XNOR_I	xnor 	%r6, 0x0700, %r25
	.word 0xad29900a  ! 4: SLLX_R	sllx	%r6, %r10, %r22
	.word 0xa891ed55  ! 4: ORcc_I	orcc 	%r7, 0x0d55, %r20
	.word 0xba9a000d  ! 4: XORcc_R	xorcc 	%r8, %r13, %r29
thr3_hw_intr_465:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_465), 16, 16)) -> intp(1, 0, 1)
	.word 0xb331400c  ! 4: SRL_R	srl 	%r5, %r12, %r25
	.word 0xb6b1ae4f  ! 4: ORNcc_I	orncc 	%r6, 0x0e4f, %r27
	.word 0xb440c00a  ! 4: ADDC_R	addc 	%r3, %r10, %r26
	.word 0xba9a000b  ! 4: XORcc_R	xorcc 	%r8, %r11, %r29
	.word 0xa8816bff  ! 4: ADDcc_I	addcc 	%r5, 0x0bff, %r20
	.word 0xb928800c  ! 4: SLL_R	sll 	%r2, %r12, %r28
	.word 0xaf28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r23
thr3_nuke_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_466), 16, 16)) -> intp(0, 2, 1)
	.word 0xab29000f  ! 4: SLL_R	sll 	%r4, %r15, %r21
	.word 0xba40edad  ! 4: ADDC_I	addc 	%r3, 0x0dad, %r29
	.word 0xb931800c  ! 4: SRL_R	srl 	%r6, %r12, %r28
	.word 0xaec16b46  ! 4: ADDCcc_I	addccc 	%r5, 0x0b46, %r23
thr3_resum_intr_466:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_466), 16, 16)) -> intp(0, 3, 1)
	.word 0xba29ec8c  ! 4: ANDN_I	andn 	%r7, 0x0c8c, %r29
	.word 0xb964180d  ! 4: MOVcc_R	<illegal instruction>
	.word 0xba9a000c  ! 4: XORcc_R	xorcc 	%r8, %r12, %r29
thr3_hw_intr_467:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_467), 16, 16)) -> intp(1, 0, 1)
	.word 0xad30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r22
	.word 0xae28800f  ! 4: ANDN_R	andn 	%r2, %r15, %r23
	.word 0xba08800b  ! 4: AND_R	and 	%r2, %r11, %r29
	.word 0xa829400f  ! 4: ANDN_R	andn 	%r5, %r15, %r20
	.word 0xb241295a  ! 4: ADDC_I	addc 	%r4, 0x095a, %r25
	.word 0xab39a001  ! 4: SRA_I	sra 	%r6, 0x0001, %r21
thr3_nuke_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_468), 16, 16)) -> intp(1, 2, 1)
	.word 0xaa39000b  ! 4: XNOR_R	xnor 	%r4, %r11, %r21
thr3_resum_intr_468:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_468), 16, 16)) -> intp(1, 3, 1)
	.word 0xbca9a39a  ! 4: ANDNcc_I	andncc 	%r6, 0x039a, %r30
thr3_hw_intr_469:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_469), 16, 16)) -> intp(1, 0, 1)
	.word 0xb4022b99  ! 4: ADD_I	add 	%r8, 0x0b99, %r26
	.word 0xb0b9c00e  ! 4: XNORcc_R	xnorcc 	%r7, %r14, %r24
	.word 0xaa91800e  ! 4: ORcc_R	orcc 	%r6, %r14, %r21
	.word 0xaa80a20e  ! 4: ADDcc_I	addcc 	%r2, 0x020e, %r21
	.word 0xb928a001  ! 4: SLL_I	sll 	%r2, 0x0001, %r28
	.word 0xb729000c  ! 4: SLL_R	sll 	%r4, %r12, %r27
thr3_hw_intr_470:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_470), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb39100f  ! 4: SRAX_R	srax	%r4, %r15, %r29
	.word 0xbb31100f  ! 4: SRLX_R	srlx	%r4, %r15, %r29
	.word 0xb2c0c00d  ! 4: ADDCcc_R	addccc 	%r3, %r13, %r25
	.word 0xb379e401  ! 4: MOVR_I	move	%r7, 0xd, %r25
	.word 0xb739c00a  ! 4: SRA_R	sra 	%r7, %r10, %r27
	.word 0xa838800a  ! 4: XNOR_R	xnor 	%r2, %r10, %r20
	.word 0xb978c40f  ! 4: MOVR_R	move	%r3, %r15, %r28
thr3_hw_intr_471:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_471), 16, 16)) -> intp(0, 0, 1)
	.word 0xab312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r21
	.word 0xac89000a  ! 4: ANDcc_R	andcc 	%r4, %r10, %r22
	.word 0xb8a9acc2  ! 4: ANDNcc_I	andncc 	%r6, 0x0cc2, %r28
	.word 0xb529d00e  ! 4: SLLX_R	sllx	%r7, %r14, %r26
	.word 0xbb38800d  ! 4: SRA_R	sra 	%r2, %r13, %r29
	.word 0xb4012fbf  ! 4: ADD_I	add 	%r4, 0x0fbf, %r26
thr3_nuke_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_472), 16, 16)) -> intp(1, 2, 1)
	.word 0xaeba20bc  ! 4: XNORcc_I	xnorcc 	%r8, 0x00bc, %r23
	.word 0xbb30d00f  ! 4: SRLX_R	srlx	%r3, %r15, %r29
	.word 0xa978840c  ! 4: MOVR_R	move	%r2, %r12, %r20
	.word 0xba18a3e9  ! 4: XOR_I	xor 	%r2, 0x03e9, %r29
thr3_resum_intr_472:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_472), 16, 16)) -> intp(1, 3, 1)
	.word 0xb739000c  ! 4: SRA_R	sra 	%r4, %r12, %r27
	.word 0xb092000a  ! 4: ORcc_R	orcc 	%r8, %r10, %r24
	.word 0xaab1ac1d  ! 4: ORNcc_I	orncc 	%r6, 0x0c1d, %r21
	.word 0xb028c00d  ! 4: ANDN_R	andn 	%r3, %r13, %r24
thr3_nuke_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_473), 16, 16)) -> intp(0, 2, 1)
	.word 0xb039c00b  ! 4: XNOR_R	xnor 	%r7, %r11, %r24
	.word 0xbaa8a1a3  ! 4: ANDNcc_I	andncc 	%r2, 0x01a3, %r29
	.word 0xb7392001  ! 4: SRA_I	sra 	%r4, 0x0001, %r27
	.word 0xbc12000f  ! 4: OR_R	or 	%r8, %r15, %r30
thr3_resum_intr_473:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_473), 16, 16)) -> intp(0, 3, 1)
	.word 0xb331500e  ! 4: SRLX_R	srlx	%r5, %r14, %r25
	.word 0xb608e205  ! 4: AND_I	and 	%r3, 0x0205, %r27
	.word 0xb23229bb  ! 4: ORN_I	orn 	%r8, 0x09bb, %r25
thr3_hw_intr_474:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_474), 16, 16)) -> intp(1, 0, 1)
	.word 0xaeba274f  ! 4: XNORcc_I	xnorcc 	%r8, 0x074f, %r23
	.word 0xb401e7fc  ! 4: ADD_I	add 	%r7, 0x07fc, %r26
	.word 0xb629400b  ! 4: ANDN_R	andn 	%r5, %r11, %r27
	.word 0xbb31100a  ! 4: SRLX_R	srlx	%r4, %r10, %r29
	.word 0xad64180c  ! 4: MOVcc_R	<illegal instruction>
	.word 0xa8b1c00d  ! 4: ORNcc_R	orncc 	%r7, %r13, %r20
thr3_hw_intr_475:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_475), 16, 16)) -> intp(1, 0, 1)
	.word 0xa929b001  ! 4: SLLX_I	sllx	%r6, 0x0001, %r20
	.word 0xa930b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r20
	.word 0xa829800c  ! 4: ANDN_R	andn 	%r6, %r12, %r20
	.word 0xba38800a  ! 4: XNOR_R	xnor 	%r2, %r10, %r29
	.word 0xa830ee5a  ! 4: ORN_I	orn 	%r3, 0x0e5a, %r20
	.word 0xbd29e001  ! 4: SLL_I	sll 	%r7, 0x0001, %r30
thr3_hw_intr_476:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_476), 16, 16)) -> intp(0, 0, 1)
	.word 0xad31a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r22
	.word 0xaf2a3001  ! 4: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0xb410a97f  ! 4: OR_I	or 	%r2, 0x097f, %r26
	.word 0xb129500e  ! 4: SLLX_R	sllx	%r5, %r14, %r24
	.word 0xac88ec23  ! 4: ANDcc_I	andcc 	%r3, 0x0c23, %r22
	.word 0xb429000c  ! 4: ANDN_R	andn 	%r4, %r12, %r26
	.word 0xaa096e47  ! 4: AND_I	and 	%r5, 0x0e47, %r21
thr3_hw_intr_477:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_477), 16, 16)) -> intp(1, 0, 1)
	.word 0xb299227e  ! 4: XORcc_I	xorcc 	%r4, 0x027e, %r25
	.word 0xacc1800c  ! 4: ADDCcc_R	addccc 	%r6, %r12, %r22
	.word 0xac40edb2  ! 4: ADDC_I	addc 	%r3, 0x0db2, %r22
	.word 0xab643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xa839000c  ! 4: XNOR_R	xnor 	%r4, %r12, %r20
	.word 0xb13a2001  ! 4: SRA_I	sra 	%r8, 0x0001, %r24
thr3_hw_intr_478:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_478), 16, 16)) -> intp(0, 0, 1)
	.word 0xb539c00b  ! 4: SRA_R	sra 	%r7, %r11, %r26
	.word 0xb44166c0  ! 4: ADDC_I	addc 	%r5, 0x06c0, %r26
	.word 0xb409c00b  ! 4: AND_R	and 	%r7, %r11, %r26
	.word 0xaeb9000b  ! 4: XNORcc_R	xnorcc 	%r4, %r11, %r23
	.word 0xbca9800d  ! 4: ANDNcc_R	andncc 	%r6, %r13, %r30
	.word 0xad31900f  ! 4: SRLX_R	srlx	%r6, %r15, %r22
	.word 0xae0124e5  ! 4: ADD_I	add 	%r4, 0x04e5, %r23
thr3_nuke_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_479), 16, 16)) -> intp(1, 2, 1)
	.word 0xacc0e003  ! 4: ADDCcc_I	addccc 	%r3, 0x0003, %r22
thr3_resum_intr_479:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_479), 16, 16)) -> intp(1, 3, 1)
	.word 0xb564180f  ! 4: MOVcc_R	<illegal instruction>
thr3_nuke_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_480), 16, 16)) -> intp(1, 2, 1)
	.word 0xb89a2ecd  ! 4: XORcc_I	xorcc 	%r8, 0x0ecd, %r28
	.word 0xaa29ef5c  ! 4: ANDN_I	andn 	%r7, 0x0f5c, %r21
thr3_resum_intr_480:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_480), 16, 16)) -> intp(1, 3, 1)
	.word 0xba29a5a6  ! 4: ANDN_I	andn 	%r6, 0x05a6, %r29
	.word 0xbc01c00d  ! 4: ADD_R	add 	%r7, %r13, %r30
thr3_nuke_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_481), 16, 16)) -> intp(1, 2, 1)
	.word 0xbaa8e956  ! 4: ANDNcc_I	andncc 	%r3, 0x0956, %r29
	.word 0xaa19eb32  ! 4: XOR_I	xor 	%r7, 0x0b32, %r21
	.word 0xb8c0e31d  ! 4: ADDCcc_I	addccc 	%r3, 0x031d, %r28
	.word 0xacc1800a  ! 4: ADDCcc_R	addccc 	%r6, %r10, %r22
	.word 0xb28a000b  ! 4: ANDcc_R	andcc 	%r8, %r11, %r25
	.word 0xb631400b  ! 4: ORN_R	orn 	%r5, %r11, %r27
	.word 0xbd39800e  ! 4: SRA_R	sra 	%r6, %r14, %r30
thr3_resum_intr_481:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_481), 16, 16)) -> intp(1, 3, 1)
	.word 0xad29d00a  ! 4: SLLX_R	sllx	%r7, %r10, %r22
thr3_hw_intr_482:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_482), 16, 16)) -> intp(1, 0, 1)
	.word 0xb089000f  ! 4: ANDcc_R	andcc 	%r4, %r15, %r24
	.word 0xaf30800c  ! 4: SRL_R	srl 	%r2, %r12, %r23
	.word 0xac022f2c  ! 4: ADD_I	add 	%r8, 0x0f2c, %r22
	.word 0xad396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r22
	.word 0xba08800e  ! 4: AND_R	and 	%r2, %r14, %r29
	.word 0xbaa9c00c  ! 4: ANDNcc_R	andncc 	%r7, %r12, %r29
	.word 0xa979a401  ! 4: MOVR_I	move	%r6, 0xc, %r20
thr3_hw_intr_483:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_483), 16, 16)) -> intp(1, 0, 1)
	.word 0xb931a001  ! 4: SRL_I	srl 	%r6, 0x0001, %r28
	.word 0xae08e3ab  ! 4: AND_I	and 	%r3, 0x03ab, %r23
	.word 0xb0a8c00d  ! 4: ANDNcc_R	andncc 	%r3, %r13, %r24
	.word 0xb929a001  ! 4: SLL_I	sll 	%r6, 0x0001, %r28
	.word 0xab31f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r21
	.word 0xb838e380  ! 4: XNOR_I	xnor 	%r3, 0x0380, %r28
thr3_nuke_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_484), 16, 16)) -> intp(1, 2, 1)
	.word 0xa8b1000d  ! 4: ORNcc_R	orncc 	%r4, %r13, %r20
	.word 0xb428ad0e  ! 4: ANDN_I	andn 	%r2, 0x0d0e, %r26
	.word 0xb41a2f39  ! 4: XOR_I	xor 	%r8, 0x0f39, %r26
thr3_resum_intr_484:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_484), 16, 16)) -> intp(1, 3, 1)
	.word 0xac28800a  ! 4: ANDN_R	andn 	%r2, %r10, %r22
	.word 0xbc30ed50  ! 4: ORN_I	orn 	%r3, 0x0d50, %r30
	.word 0xac01a3d4  ! 4: ADD_I	add 	%r6, 0x03d4, %r22
thr3_nuke_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_485), 16, 16)) -> intp(0, 2, 1)
	.word 0xab292001  ! 4: SLL_I	sll 	%r4, 0x0001, %r21
	.word 0xb410eafd  ! 4: OR_I	or 	%r3, 0x0afd, %r26
	.word 0xbb296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r29
	.word 0xb42a2c68  ! 4: ANDN_I	andn 	%r8, 0x0c68, %r26
	.word 0xa8b1c00c  ! 4: ORNcc_R	orncc 	%r7, %r12, %r20
	.word 0xaa992c8d  ! 4: XORcc_I	xorcc 	%r4, 0x0c8d, %r21
thr3_resum_intr_485:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_485), 16, 16)) -> intp(0, 3, 1)
	.word 0xbb30800c  ! 4: SRL_R	srl 	%r2, %r12, %r29
	.word 0xba11ac76  ! 4: OR_I	or 	%r6, 0x0c76, %r29
	.word 0xb4a8800e  ! 4: ANDNcc_R	andncc 	%r2, %r14, %r26
	.word 0xb401a19c  ! 4: ADD_I	add 	%r6, 0x019c, %r26
thr3_hw_intr_486:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_486), 16, 16)) -> intp(0, 0, 1)
	.word 0xb738e001  ! 4: SRA_I	sra 	%r3, 0x0001, %r27
	.word 0xb9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r28
	.word 0xb728900b  ! 4: SLLX_R	sllx	%r2, %r11, %r27
	.word 0xb430aa44  ! 4: ORN_I	orn 	%r2, 0x0a44, %r26
	.word 0xb1643801  ! 4: MOVcc_I	<illegal instruction>
	.word 0xae89400d  ! 4: ANDcc_R	andcc 	%r5, %r13, %r23
	.word 0xb618800b  ! 4: XOR_R	xor 	%r2, %r11, %r27
thr3_hw_intr_487:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_487), 16, 16)) -> intp(1, 0, 1)
	.word 0xbcb9800d  ! 4: XNORcc_R	xnorcc 	%r6, %r13, %r30
	.word 0xb080af56  ! 4: ADDcc_I	addcc 	%r2, 0x0f56, %r24
	.word 0xac31ac14  ! 4: ORN_I	orn 	%r6, 0x0c14, %r22
	.word 0xbb39500a  ! 4: SRAX_R	srax	%r5, %r10, %r29
	.word 0xab32100c  ! 4: SRLX_R	srlx	%r8, %r12, %r21
	.word 0xb4b8a952  ! 4: XNORcc_I	xnorcc 	%r2, 0x0952, %r26
thr3_nuke_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_488), 16, 16)) -> intp(1, 2, 1)
	.word 0xac02000b  ! 4: ADD_R	add 	%r8, %r11, %r22
	.word 0xb131f001  ! 4: SRLX_I	srlx	%r7, 0x0001, %r24
	.word 0xaa412a09  ! 4: ADDC_I	addc 	%r4, 0x0a09, %r21
	.word 0xae31000d  ! 4: ORN_R	orn 	%r4, %r13, %r23
	.word 0xa979040d  ! 4: MOVR_R	move	%r4, %r13, %r20
	.word 0xb2196020  ! 4: XOR_I	xor 	%r5, 0x0020, %r25
thr3_resum_intr_488:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_488), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc2a205b  ! 4: ANDN_I	andn 	%r8, 0x005b, %r30
	.word 0xa801000d  ! 4: ADD_R	add 	%r4, %r13, %r20
thr3_hw_intr_489:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_489), 16, 16)) -> intp(0, 0, 1)
	.word 0xac29c00b  ! 4: ANDN_R	andn 	%r7, %r11, %r22
	.word 0xac90e0cf  ! 4: ORcc_I	orcc 	%r3, 0x00cf, %r22
	.word 0xba81400d  ! 4: ADDcc_R	addcc 	%r5, %r13, %r29
	.word 0xad313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r22
	.word 0xb4c2276e  ! 4: ADDCcc_I	addccc 	%r8, 0x076e, %r26
	.word 0xb889000c  ! 4: ANDcc_R	andcc 	%r4, %r12, %r28
thr3_nuke_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_490), 16, 16)) -> intp(1, 2, 1)
	.word 0xb0896e9c  ! 4: ANDcc_I	andcc 	%r5, 0x0e9c, %r24
	.word 0xaeba000d  ! 4: XNORcc_R	xnorcc 	%r8, %r13, %r23
	.word 0xbab1e499  ! 4: ORNcc_I	orncc 	%r7, 0x0499, %r29
thr3_resum_intr_490:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_490), 16, 16)) -> intp(1, 3, 1)
	.word 0xab30b001  ! 4: SRLX_I	srlx	%r2, 0x0001, %r21
	.word 0xbab0e9a3  ! 4: ORNcc_I	orncc 	%r3, 0x09a3, %r29
thr3_nuke_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_491), 16, 16)) -> intp(0, 2, 1)
	.word 0xaab0800f  ! 4: ORNcc_R	orncc 	%r2, %r15, %r21
	.word 0xaa81202e  ! 4: ADDcc_I	addcc 	%r4, 0x002e, %r21
	.word 0xbd64180a  ! 4: MOVcc_R	<illegal instruction>
	.word 0xbb79c40a  ! 4: MOVR_R	move	%r7, %r10, %r29
thr3_resum_intr_491:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_491), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa02000d  ! 4: ADD_R	add 	%r8, %r13, %r21
	.word 0xb211800b  ! 4: OR_R	or 	%r6, %r11, %r25
thr3_hw_intr_492:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_492), 16, 16)) -> intp(1, 0, 1)
	.word 0xa889aa25  ! 4: ANDcc_I	andcc 	%r6, 0x0a25, %r20
	.word 0xacb9800c  ! 4: XNORcc_R	xnorcc 	%r6, %r12, %r22
	.word 0xb489000c  ! 4: ANDcc_R	andcc 	%r4, %r12, %r26
	.word 0xa832000d  ! 4: ORN_R	orn 	%r8, %r13, %r20
	.word 0xb841e456  ! 4: ADDC_I	addc 	%r7, 0x0456, %r28
	.word 0xb329800d  ! 4: SLL_R	sll 	%r6, %r13, %r25
thr3_hw_intr_493:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_493), 16, 16)) -> intp(1, 0, 1)
	.word 0xbc30aeb8  ! 4: ORN_I	orn 	%r2, 0x0eb8, %r30
	.word 0xad296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r22
	.word 0xac092454  ! 4: AND_I	and 	%r4, 0x0454, %r22
	.word 0xaf39c00a  ! 4: SRA_R	sra 	%r7, %r10, %r23
	.word 0xb9312001  ! 4: SRL_I	srl 	%r4, 0x0001, %r28
	.word 0xba392315  ! 4: XNOR_I	xnor 	%r4, 0x0315, %r29
thr3_hw_intr_494:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_494), 16, 16)) -> intp(0, 0, 1)
	.word 0xb680c00b  ! 4: ADDcc_R	addcc 	%r3, %r11, %r27
	.word 0xb488ad8f  ! 4: ANDcc_I	andcc 	%r2, 0x0d8f, %r26
	.word 0xb23a2f20  ! 4: XNOR_I	xnor 	%r8, 0x0f20, %r25
	.word 0xb1396001  ! 4: SRA_I	sra 	%r5, 0x0001, %r24
	.word 0xb731e001  ! 4: SRL_I	srl 	%r7, 0x0001, %r27
	.word 0xb2312416  ! 4: ORN_I	orn 	%r4, 0x0416, %r25
thr3_hw_intr_495:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_495), 16, 16)) -> intp(1, 0, 1)
	.word 0xac10e63a  ! 4: OR_I	or 	%r3, 0x063a, %r22
	.word 0xb60967d5  ! 4: AND_I	and 	%r5, 0x07d5, %r27
	.word 0xaf28e001  ! 4: SLL_I	sll 	%r3, 0x0001, %r23
	.word 0xaa0a000a  ! 4: AND_R	and 	%r8, %r10, %r21
	.word 0xb4a960c4  ! 4: ANDNcc_I	andncc 	%r5, 0x00c4, %r26
	.word 0xb802000b  ! 4: ADD_R	add 	%r8, %r11, %r28
	.word 0xb9313001  ! 4: SRLX_I	srlx	%r4, 0x0001, %r28
thr3_nuke_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_496), 16, 16)) -> intp(0, 2, 1)
	.word 0xb8b2000d  ! 4: ORNcc_R	orncc 	%r8, %r13, %r28
	.word 0xb8092bcc  ! 4: AND_I	and 	%r4, 0x0bcc, %r28
	.word 0xb9296001  ! 4: SLL_I	sll 	%r5, 0x0001, %r28
	.word 0xac91ec2a  ! 4: ORcc_I	orcc 	%r7, 0x0c2a, %r22
	.word 0xab28900d  ! 4: SLLX_R	sllx	%r2, %r13, %r21
thr3_resum_intr_496:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_496), 16, 16)) -> intp(0, 3, 1)
	.word 0xbaa9c00c  ! 4: ANDNcc_R	andncc 	%r7, %r12, %r29
	.word 0xaa19000a  ! 4: XOR_R	xor 	%r4, %r10, %r21
thr3_nuke_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_497), 16, 16)) -> intp(0, 2, 1)
	.word 0xad38800f  ! 4: SRA_R	sra 	%r2, %r15, %r22
	.word 0xb631e176  ! 4: ORN_I	orn 	%r7, 0x0176, %r27
thr3_resum_intr_497:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_497), 16, 16)) -> intp(0, 3, 1)
	.word 0xaa01800c  ! 4: ADD_R	add 	%r6, %r12, %r21
thr3_hw_intr_498:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_hw_intr_498), 16, 16)) -> intp(0, 0, 1)
	.word 0xa938800b  ! 4: SRA_R	sra 	%r2, %r11, %r20
	.word 0xb6b1400b  ! 4: ORNcc_R	orncc 	%r5, %r11, %r27
	.word 0xa8b9400a  ! 4: XNORcc_R	xnorcc 	%r5, %r10, %r20
	.word 0xb41166ff  ! 4: OR_I	or 	%r5, 0x06ff, %r26
	.word 0xb431e9cc  ! 4: ORN_I	orn 	%r7, 0x09cc, %r26
	.word 0xac11c00f  ! 4: OR_R	or 	%r7, %r15, %r22
thr3_nuke_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_nuke_intr_499), 16, 16)) -> intp(1, 2, 1)
	.word 0xbcc1400d  ! 4: ADDCcc_R	addccc 	%r5, %r13, %r30
	.word 0xa829e082  ! 4: ANDN_I	andn 	%r7, 0x0082, %r20
	.word 0xb690ec25  ! 4: ORcc_I	orcc 	%r3, 0x0c25, %r27
thr3_resum_intr_499:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_499), 16, 16)) -> intp(1, 3, 1)
	.word 0xb8012883  ! 4: ADD_I	add 	%r4, 0x0883, %r28
	.word 0xab30800a  ! 4: SRL_R	srl 	%r2, %r10, %r21
	.word 0xbb29500b  ! 4: SLLX_R	sllx	%r5, %r11, %r29
	.word 0xaa01aa49  ! 4: ADD_I	add 	%r6, 0x0a49, %r21
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
	setx  0x8fa8d3ddd3d2f301, %r16, %r16
	setx  0xcc8451d5d5272bb4, %r16, %r17
	setx  0x44e1e52842af95ef, %r16, %r18
	setx  0xb4e3f6295e0231d1, %r16, %r19
	setx  0xefa02137657d2908, %r16, %r20
	setx  0x92e0eb370290c290, %r16, %r21
	setx  0x70352380ea38cee9, %r16, %r22
	setx  0x015611a85e19c5f6, %r16, %r23
	setx  0xf737b3fecf19286d, %r16, %r24
	setx  0xbc8ead99329938e1, %r16, %r25
	setx  0xa6ee1bcc4669b45e, %r16, %r26
	setx  0xf58b933c4f634d45, %r16, %r27
	setx  0xe9794a86e4c389ca, %r16, %r28
	setx  0x19ab3bff34df321f, %r16, %r29
	setx  0x73f6a07c983fab51, %r16, %r30
	setx  0xd9c9f8a291389b98, %r16, %r31
	setx  0x00000000000002e0, %r16, %r10
	setx  0x0000000000000ad0, %r16, %r11
	setx  0x0000000000000ec0, %r16, %r12
	setx  0x00000000000004b0, %r16, %r13
	setx  0x00000000000002c0, %r16, %r14
	setx  0x0000000000000bb0, %r16, %r15
	setx  0x0000000000000a81, %r16, %r9
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
	.word 0xb4da266c  ! 5: SMULcc_I	smulcc 	%r8, 0x066c, %r26
	.word 0xada9882a  ! 5: FMOVNEG	fmovs	%fcc1, %f10, %f22
	.word 0xb9a0108a  ! 5: FxTOs	dis not found

	.word 0xb2696d41  ! 5: UDIVX_I	udivx 	%r5, 0x0d41, %r25
	.word 0xbaf1800b  ! 5: UDIVcc_R	udivcc 	%r6, %r11, %r29
	.word 0xb4f1000b  ! 5: UDIVcc_R	udivcc 	%r4, %r11, %r26
	.word 0x2f800001  ! 5: FBU	fbu,a	<label_0x1>
	.word 0xb070e4ff  ! 5: UDIV_I	udiv 	%r3, 0x04ff, %r24
	.word 0xadaa482e  ! 5: FMOVNE	fmovs	%fcc1, %f14, %f22
	.word 0xaba0006c  ! 5: FMOVq	dis not found

	.word 0xa869297e  ! 5: UDIVX_I	udivx 	%r4, 0x097e, %r20
	.word 0xa850c00a  ! 5: UMUL_R	umul 	%r3, %r10, %r20
	.word 0xb479c00b  ! 5: SDIV_R	sdiv 	%r7, %r11, %r26
	.word 0xb121ab60  ! 5: MULScc_I	mulscc 	%r6, 0x0b60, %r24
	.word 0xb769000d  ! 5: SDIVX_R	sdivx	%r4, %r13, %r27
	.word 0xaa71a600  ! 5: UDIV_I	udiv 	%r6, 0x0600, %r21
	.word 0xb679e2a6  ! 5: SDIV_I	sdiv 	%r7, 0x02a6, %r27
	.word 0xbcf1a073  ! 5: UDIVcc_I	udivcc 	%r6, 0x0073, %r30
	.word 0x15800003  ! 5: FBUE	fbue  	<label_0x3>
	.word 0xbc71a943  ! 5: UDIV_I	udiv 	%r6, 0x0943, %r30
	.word 0xaaf8c00c  ! 5: SDIVcc_R	sdivcc 	%r3, %r12, %r21
	.word 0xb2fa000c  ! 5: SDIVcc_R	sdivcc 	%r8, %r12, %r25
	.word 0xbc71000c  ! 5: UDIV_R	udiv 	%r4, %r12, %r30
	.word 0xb079800b  ! 5: SDIV_R	sdiv 	%r6, %r11, %r24
	.word 0xbb68af85  ! 5: SDIVX_I	sdivx	%r2, 0x0f85, %r29
	.word 0xad68a6b5  ! 5: SDIVX_I	sdivx	%r2, 0x06b5, %r22
	.word 0xaa51400f  ! 5: UMUL_R	umul 	%r5, %r15, %r21
	.word 0xb069e162  ! 5: UDIVX_I	udivx 	%r7, 0x0162, %r24
	.word 0xadabc82f  ! 5: FMOVVC	fmovs	%fcc1, %f15, %f22
	.word 0x87aa0a2a  ! 5: FCMPs	fcmps	%fcc<n>, %f8, %f10
	.word 0xb5a018cf  ! 5: FdTOs	dis not found

	.word 0xbc69800f  ! 5: UDIVX_R	udivx 	%r6, %r15, %r30
	.word 0xb6d2000f  ! 5: UMULcc_R	umulcc 	%r8, %r15, %r27
	.word 0xb121400b  ! 5: MULScc_R	mulscc 	%r5, %r11, %r24
	.word 0xb2d9a0ee  ! 5: SMULcc_I	smulcc 	%r6, 0x00ee, %r25
	.word 0xbba8482a  ! 5: FMOVE	fmovs	%fcc1, %f10, %f29
	.word 0x87a8caea  ! 5: FCMPEq	fcmpeq	%fcc<n>, %f32, %f8
	.word 0xb250ef5d  ! 5: UMUL_I	umul 	%r3, 0x0f5d, %r25
	.word 0xaaf92d8e  ! 5: SDIVcc_I	sdivcc 	%r4, 0x0d8e, %r21
	.word 0xb7a8c82f  ! 5: FMOVL	fmovs	%fcc1, %f15, %f27
	.word 0xb368c00d  ! 5: SDIVX_R	sdivx	%r3, %r13, %r25
	.word 0x35800001  ! 5: FBUE	fbue,a	<label_0x1>
	.word 0xaed9a323  ! 5: SMULcc_I	smulcc 	%r6, 0x0323, %r23
	.word 0xaa7960c5  ! 5: SDIV_I	sdiv 	%r5, 0x00c5, %r21
	.word 0xa858e3e9  ! 5: SMUL_I	smul 	%r3, 0x03e9, %r20
	.word 0xb4f9c00f  ! 5: SDIVcc_R	sdivcc 	%r7, %r15, %r26
	.word 0xafa0110d  ! 5: FxTOd	dis not found

	.word 0xb2f8e16e  ! 5: SDIVcc_I	sdivcc 	%r3, 0x016e, %r25
	.word 0x31400003  ! 5: FBPA	fba,a,pn	%fcc0, <label_0x3>
	.word 0xb878800a  ! 5: SDIV_R	sdiv 	%r2, %r10, %r28
	.word 0xbcf0ab79  ! 5: UDIVcc_I	udivcc 	%r2, 0x0b79, %r30
	.word 0xb7a000aa  ! 5: FNEGs	fnegs	%f10, %f27
	.word 0xaafa2097  ! 5: SDIVcc_I	sdivcc 	%r8, 0x0097, %r21
	.word 0xbcd1ed88  ! 5: UMULcc_I	umulcc 	%r7, 0x0d88, %r30
	.word 0xab20800f  ! 5: MULScc_R	mulscc 	%r2, %r15, %r21
	.word 0xb071c00c  ! 5: UDIV_R	udiv 	%r7, %r12, %r24
	.word 0xaa7a000d  ! 5: SDIV_R	sdiv 	%r8, %r13, %r21
	.word 0xbd69800b  ! 5: SDIVX_R	sdivx	%r6, %r11, %r30
	.word 0xb521ad8a  ! 5: MULScc_I	mulscc 	%r6, 0x0d8a, %r26
	.word 0xba4a23ff  ! 5: MULX_I	mulx 	%r8, 0x03ff, %r29
	.word 0xaf21c00d  ! 5: MULScc_R	mulscc 	%r7, %r13, %r23
	.word 0xb3a0cdcc  ! 5: FdMULq	fdmulq	
	.word 0xaad0ec2b  ! 5: UMULcc_I	umulcc 	%r3, 0x0c2b, %r21
	.word 0xaef8a555  ! 5: SDIVcc_I	sdivcc 	%r2, 0x0555, %r23
	.word 0xb3a0192b  ! 5: FsTOd	dis not found

	.word 0xb650800a  ! 5: UMUL_R	umul 	%r2, %r10, %r27
	.word 0xac68ae34  ! 5: UDIVX_I	udivx 	%r2, 0x0e34, %r22
	.word 0xae4a2c86  ! 5: MULX_I	mulx 	%r8, 0x0c86, %r23
	.word 0xa859e24c  ! 5: SMUL_I	smul 	%r7, 0x024c, %r20
	.word 0xb7a109ee  ! 5: FDIVq	dis not found

	.word 0xb1a01a4d  ! 5: FdTOi	dis not found

	.word 0xababc82c  ! 5: FMOVVC	fmovs	%fcc1, %f12, %f21
	.word 0xaad22ab0  ! 5: UMULcc_I	umulcc 	%r8, 0x0ab0, %r21
	.word 0xae7165e6  ! 5: UDIV_I	udiv 	%r5, 0x05e6, %r23
	.word 0xbaf1ae3e  ! 5: UDIVcc_I	udivcc 	%r6, 0x0e3e, %r29
	.word 0xa8f9800d  ! 5: SDIVcc_R	sdivcc 	%r6, %r13, %r20
	.word 0xbc49e007  ! 5: MULX_I	mulx 	%r7, 0x0007, %r30
	.word 0xafa9882c  ! 5: FMOVNEG	fmovs	%fcc1, %f12, %f23
	.word 0xb050a444  ! 5: UMUL_I	umul 	%r2, 0x0444, %r24
	.word 0xbc69400d  ! 5: UDIVX_R	udivx 	%r5, %r13, %r30
	.word 0xaba8182f  ! 5: FMOVRGZ	fmovs	%fcc3, %f15, %f21
	.word 0xbda0c92c  ! 5: FMULs	fmuls	%f3, %f12, %f30
	.word 0xb5a0012e  ! 5: FABSs	fabss	%f14, %f26
	.word 0xb7a189ae  ! 5: FDIVs	fdivs	%f6, %f14, %f27
	.word 0xb168e859  ! 5: SDIVX_I	sdivx	%r3, 0x0859, %r24
	.word 0x37800003  ! 5: FBGE	fbge,a	<label_0x3>
	.word 0xa871c00a  ! 5: UDIV_R	udiv 	%r7, %r10, %r20
	.word 0xb8d2000e  ! 5: UMULcc_R	umulcc 	%r8, %r14, %r28
	.word 0xb0d9000a  ! 5: SMULcc_R	smulcc 	%r4, %r10, %r24
	.word 0xba58abc1  ! 5: SMUL_I	smul 	%r2, 0x0bc1, %r29
	.word 0xbad2000c  ! 5: UMULcc_R	umulcc 	%r8, %r12, %r29
	.word 0xb279c00e  ! 5: SDIV_R	sdiv 	%r7, %r14, %r25
	.word 0xae50eed7  ! 5: UMUL_I	umul 	%r3, 0x0ed7, %r23
	.word 0xb9ab482b  ! 5: FMOVCC	fmovs	%fcc1, %f11, %f28
	.word 0xa9696903  ! 5: SDIVX_I	sdivx	%r5, 0x0903, %r20
	.word 0x09800001  ! 5: FBL	fbl  	<label_0x1>
	.word 0xab6a000e  ! 5: SDIVX_R	sdivx	%r8, %r14, %r21
	.word 0xbc50ae79  ! 5: UMUL_I	umul 	%r2, 0x0e79, %r30
	.word 0xb070c00e  ! 5: UDIV_R	udiv 	%r3, %r14, %r24
	.word 0x87a9cacc  ! 5: FCMPEd	fcmped	%fcc<n>, %f38, %f12
	.word 0xbb69e457  ! 5: SDIVX_I	sdivx	%r7, 0x0457, %r29
	.word 0x11800003  ! 5: FBA	fba  	<label_0x3>
	.word 0xaaf9800d  ! 5: SDIVcc_R	sdivcc 	%r6, %r13, %r21
	.word 0xb071800c  ! 5: UDIV_R	udiv 	%r6, %r12, %r24
	.word 0xb1216b19  ! 5: MULScc_I	mulscc 	%r5, 0x0b19, %r24
	.word 0xb2d0a4aa  ! 5: UMULcc_I	umulcc 	%r2, 0x04aa, %r25
	.word 0xb7ab882a  ! 5: FMOVPOS	fmovs	%fcc1, %f10, %f27
	.word 0x31800001  ! 5: FBA	fba,a	<label_0x1>
	.word 0xacd1ee5b  ! 5: UMULcc_I	umulcc 	%r7, 0x0e5b, %r22
	.word 0xb279e5f5  ! 5: SDIV_I	sdiv 	%r7, 0x05f5, %r25
	.word 0xbcd0800a  ! 5: UMULcc_R	umulcc 	%r2, %r10, %r30
	.word 0xaba0108f  ! 5: FxTOs	dis not found

	.word 0xb7a8182f  ! 5: FMOVRGZ	fmovs	%fcc3, %f15, %f27
	.word 0xb1a9482f  ! 5: FMOVCS	fmovs	%fcc1, %f15, %f24
	.word 0xbcf9c00c  ! 5: SDIVcc_R	sdivcc 	%r7, %r12, %r30
	.word 0xac70e188  ! 5: UDIV_I	udiv 	%r3, 0x0188, %r22
	.word 0xb0d9eff1  ! 5: SMULcc_I	smulcc 	%r7, 0x0ff1, %r24
	.word 0xaad9c00d  ! 5: SMULcc_R	smulcc 	%r7, %r13, %r21
	.word 0xab6a000e  ! 5: SDIVX_R	sdivx	%r8, %r14, %r21
	.word 0xaba01a4e  ! 5: FdTOi	dis not found

	.word 0xb9a01a4a  ! 5: FdTOi	dis not found

	.word 0xbda1c9ea  ! 5: FDIVq	dis not found

	.word 0xb079000f  ! 5: SDIV_R	sdiv 	%r4, %r15, %r24
	.word 0xa9a0118c  ! 5: FxTOq	fxtoq	
	.word 0xaa7960cd  ! 5: SDIV_I	sdiv 	%r5, 0x00cd, %r21
	.word 0xb6496160  ! 5: MULX_I	mulx 	%r5, 0x0160, %r27
	.word 0xb2d9000e  ! 5: SMULcc_R	smulcc 	%r4, %r14, %r25
	.word 0xada01a4a  ! 5: FdTOi	dis not found

	.word 0xb7a8082a  ! 5: FMOVN	fmovs	%fcc1, %f10, %f27
	.word 0xb7a0052c  ! 5: FSQRTs	fsqrt	
	.word 0xb6f9800e  ! 5: SDIVcc_R	sdivcc 	%r6, %r14, %r27
	.word 0xb659abe4  ! 5: SMUL_I	smul 	%r6, 0x0be4, %r27
	.word 0xa9a109ae  ! 5: FDIVs	fdivs	%f4, %f14, %f20
	.word 0xb9a0108c  ! 5: FxTOs	dis not found

	.word 0xb9a000aa  ! 5: FNEGs	fnegs	%f10, %f28
	.word 0xaef9000e  ! 5: SDIVcc_R	sdivcc 	%r4, %r14, %r23
	.word 0xb1a0108e  ! 5: FxTOs	dis not found

	.word 0xaba0110f  ! 5: FxTOd	dis not found

	.word 0xac71000a  ! 5: UDIV_R	udiv 	%r4, %r10, %r22
	.word 0xba58c00b  ! 5: SMUL_R	smul 	%r3, %r11, %r29
	.word 0x2b800003  ! 5: FBUG	fbug,a	<label_0x3>
	.word 0xb7a0102e  ! 5: FsTOx	dis not found

	.word 0xb3a0c9cd  ! 5: FDIVd	fdivd	%f34, %f44, %f56
	.word 0xa8fa290e  ! 5: SDIVcc_I	sdivcc 	%r8, 0x090e, %r20
	.word 0x0b800001  ! 5: FBUG	fbug  	<label_0x1>
	.word 0xba7a000a  ! 5: SDIV_R	sdiv 	%r8, %r10, %r29
	.word 0x87a90a4f  ! 5: FCMPd	fcmpd	%fcc<n>, %f4, %f46
	.word 0xaad9800a  ! 5: SMULcc_R	smulcc 	%r6, %r10, %r21
	.word 0xaef12113  ! 5: UDIVcc_I	udivcc 	%r4, 0x0113, %r23
	.word 0xa851c00e  ! 5: UMUL_R	umul 	%r7, %r14, %r20
	.word 0xb368e2b7  ! 5: SDIVX_I	sdivx	%r3, 0x02b7, %r25
	.word 0x1f400001  ! 5: FBPO	fbo
	.word 0xbda18d2e  ! 5: FsMULd	fsmuld	%f6, %f14, %f30
	.word 0xb969800d  ! 5: SDIVX_R	sdivx	%r6, %r13, %r28
	.word 0xb7a0188d  ! 5: FiTOs	dis not found

	.word 0xac70800a  ! 5: UDIV_R	udiv 	%r2, %r10, %r22
	.word 0xb668800e  ! 5: UDIVX_R	udivx 	%r2, %r14, %r27
	.word 0xbb68e75a  ! 5: SDIVX_I	sdivx	%r3, 0x075a, %r29
	.word 0xb5a089ae  ! 5: FDIVs	fdivs	%f2, %f14, %f26
	.word 0xbc50800a  ! 5: UMUL_R	umul 	%r2, %r10, %r30
	.word 0xb722000d  ! 5: MULScc_R	mulscc 	%r8, %r13, %r27
	.word 0xb9a0106a  ! 5: FqTOx	fqtox	
	.word 0xaef0e3d3  ! 5: UDIVcc_I	udivcc 	%r3, 0x03d3, %r23
	.word 0xb9a9c82d  ! 5: FMOVVS	fmovs	%fcc1, %f13, %f28
	.word 0xbcf92bbd  ! 5: SDIVcc_I	sdivcc 	%r4, 0x0bbd, %r30
	.word 0xb049e68f  ! 5: MULX_I	mulx 	%r7, 0x068f, %r24
	.word 0xb478e742  ! 5: SDIV_I	sdiv 	%r3, 0x0742, %r26
	.word 0x11400003  ! 5: FBPA	fba
	.word 0xb369800f  ! 5: SDIVX_R	sdivx	%r6, %r15, %r25
	.word 0xae69000d  ! 5: UDIVX_R	udivx 	%r4, %r13, %r23
	.word 0xb652000d  ! 5: UMUL_R	umul 	%r8, %r13, %r27
	.word 0xb0f1c00c  ! 5: UDIVcc_R	udivcc 	%r7, %r12, %r24
	.word 0xb2da000f  ! 5: SMULcc_R	smulcc 	%r8, %r15, %r25
	.word 0xba6a20d5  ! 5: UDIVX_I	udivx 	%r8, 0x00d5, %r29
	.word 0x09400001  ! 5: FBPL	fbl
	.word 0xb121c00c  ! 5: MULScc_R	mulscc 	%r7, %r12, %r24
	.word 0xae50c00b  ! 5: UMUL_R	umul 	%r3, %r11, %r23
	.word 0xb5a0054b  ! 5: FSQRTd	fsqrt	
	.word 0xb9222efc  ! 5: MULScc_I	mulscc 	%r8, 0x0efc, %r28
	.word 0xb44927d2  ! 5: MULX_I	mulx 	%r4, 0x07d2, %r26
	.word 0xa922000b  ! 5: MULScc_R	mulscc 	%r8, %r11, %r20
	.word 0xb521c00b  ! 5: MULScc_R	mulscc 	%r7, %r11, %r26
	.word 0xa9a1094a  ! 5: FMULd	fmuld	%f4, %f10, %f20
	.word 0xb05222ec  ! 5: UMUL_I	umul 	%r8, 0x02ec, %r24
	.word 0xbda8142f  ! 5: FMOVRNZ	dis not found

	.word 0xa86a000b  ! 5: UDIVX_R	udivx 	%r8, %r11, %r20
	.word 0xaf21ed67  ! 5: MULScc_I	mulscc 	%r7, 0x0d67, %r23
	.word 0xb7a8082e  ! 5: FMOVN	fmovs	%fcc1, %f14, %f27
	.word 0xb0d1238e  ! 5: UMULcc_I	umulcc 	%r4, 0x038e, %r24
	.word 0xb9aa482b  ! 5: FMOVNE	fmovs	%fcc1, %f11, %f28
	.word 0xbcf1800f  ! 5: UDIVcc_R	udivcc 	%r6, %r15, %r30
	.word 0x25800003  ! 5: FBLG	fblg,a	<label_0x3>
	.word 0x29400001  ! 5: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xb848a614  ! 5: MULX_I	mulx 	%r2, 0x0614, %r28
	.word 0xa8d8e125  ! 5: SMULcc_I	smulcc 	%r3, 0x0125, %r20
	.word 0xb2f9000e  ! 5: SDIVcc_R	sdivcc 	%r4, %r14, %r25
	.word 0xb5a0110f  ! 5: FxTOd	dis not found

	.word 0xb4522026  ! 5: UMUL_I	umul 	%r8, 0x0026, %r26
	.word 0xb7a0014a  ! 5: FABSd	fabsd	%f10, %f58
	.word 0xb122000a  ! 5: MULScc_R	mulscc 	%r8, %r10, %r24
	.word 0xa8f9e323  ! 5: SDIVcc_I	sdivcc 	%r7, 0x0323, %r20
	.word 0xbc48800e  ! 5: MULX_R	mulx 	%r2, %r14, %r30
	.word 0xae69a01a  ! 5: UDIVX_I	udivx 	%r6, 0x001a, %r23
	.word 0xb1abc82a  ! 5: FMOVVC	fmovs	%fcc1, %f10, %f24
	.word 0xb569000b  ! 5: SDIVX_R	sdivx	%r4, %r11, %r26
	.word 0xab21c00b  ! 5: MULScc_R	mulscc 	%r7, %r11, %r21
	.word 0xba5124c6  ! 5: UMUL_I	umul 	%r4, 0x04c6, %r29
	.word 0xb769c00e  ! 5: SDIVX_R	sdivx	%r7, %r14, %r27
	.word 0xaaf2000c  ! 5: UDIVcc_R	udivcc 	%r8, %r12, %r21
	.word 0xaed1c00e  ! 5: UMULcc_R	umulcc 	%r7, %r14, %r23
	.word 0xb5212fce  ! 5: MULScc_I	mulscc 	%r4, 0x0fce, %r26
	.word 0xada81c2b  ! 5: FMOVRGEZ	dis not found

	.word 0xa8592f77  ! 5: SMUL_I	smul 	%r4, 0x0f77, %r20
	.word 0xbaf169a1  ! 5: UDIVcc_I	udivcc 	%r5, 0x09a1, %r29
	.word 0xb6d9000d  ! 5: SMULcc_R	smulcc 	%r4, %r13, %r27
	.word 0xba68a570  ! 5: UDIVX_I	udivx 	%r2, 0x0570, %r29
	.word 0xada8c82f  ! 5: FMOVL	fmovs	%fcc1, %f15, %f22
	.word 0xb7aa882a  ! 5: FMOVG	fmovs	%fcc1, %f10, %f27
	.word 0xba51400b  ! 5: UMUL_R	umul 	%r5, %r11, %r29
	.word 0xb871254c  ! 5: UDIV_I	udiv 	%r4, 0x054c, %r28
	.word 0xb7a0190b  ! 5: FiTOd	dis not found

	.word 0x27800001  ! 5: FBUL	fbul,a	<label_0x1>
	.word 0xae69400f  ! 5: UDIVX_R	udivx 	%r5, %r15, %r23
	.word 0xaba0190a  ! 5: FiTOd	dis not found

	.word 0xae49000b  ! 5: MULX_R	mulx 	%r4, %r11, %r23
	.word 0xb0d0c00a  ! 5: UMULcc_R	umulcc 	%r3, %r10, %r24
	.word 0xb679abcf  ! 5: SDIV_I	sdiv 	%r6, 0x0bcf, %r27
	.word 0xb859c00c  ! 5: SMUL_R	smul 	%r7, %r12, %r28
	.word 0x2f400003  ! 5: FBPU	fbu,a,pn	%fcc0, <label_0x3>
	.word 0xb1a9c82d  ! 5: FMOVVS	fmovs	%fcc1, %f13, %f24
	.word 0xb450abbc  ! 5: UMUL_I	umul 	%r2, 0x0bbc, %r26
	.word 0xb670800b  ! 5: UDIV_R	udiv 	%r2, %r11, %r27
	.word 0xb521800e  ! 5: MULScc_R	mulscc 	%r6, %r14, %r26
	.word 0xa9ab882c  ! 5: FMOVPOS	fmovs	%fcc1, %f12, %f20
	.word 0xaba8142e  ! 5: FMOVRNZ	dis not found

	.word 0xb0f1800c  ! 5: UDIVcc_R	udivcc 	%r6, %r12, %r24
	.word 0xaf68e4e8  ! 5: SDIVX_I	sdivx	%r3, 0x04e8, %r23
	.word 0xaa49e3bb  ! 5: MULX_I	mulx 	%r7, 0x03bb, %r21
	.word 0xa920c00f  ! 5: MULScc_R	mulscc 	%r3, %r15, %r20
	.word 0xba49400b  ! 5: MULX_R	mulx 	%r5, %r11, %r29
	.word 0xac70c00a  ! 5: UDIV_R	udiv 	%r3, %r10, %r22
	.word 0xb568e370  ! 5: SDIVX_I	sdivx	%r3, 0x0370, %r26
	.word 0xb368c00b  ! 5: SDIVX_R	sdivx	%r3, %r11, %r25
	.word 0xbcf16f83  ! 5: UDIVcc_I	udivcc 	%r5, 0x0f83, %r30
	.word 0xa859400d  ! 5: SMUL_R	smul 	%r5, %r13, %r20
	.word 0xbda8182c  ! 5: FMOVRGZ	fmovs	%fcc3, %f12, %f30
	.word 0xb0f22417  ! 5: UDIVcc_I	udivcc 	%r8, 0x0417, %r24
	.word 0xaba000eb  ! 5: FNEGq	dis not found

	.word 0xb471400b  ! 5: UDIV_R	udiv 	%r5, %r11, %r26
	.word 0xba68c00f  ! 5: UDIVX_R	udivx 	%r3, %r15, %r29
	.word 0xacd22630  ! 5: UMULcc_I	umulcc 	%r8, 0x0630, %r22
	.word 0xb1a9482e  ! 5: FMOVCS	fmovs	%fcc1, %f14, %f24
	.word 0xb0d1e409  ! 5: UMULcc_I	umulcc 	%r7, 0x0409, %r24
	.word 0xaad0a02c  ! 5: UMULcc_I	umulcc 	%r2, 0x002c, %r21
	.word 0x33400003  ! 5: FBPE	fbe,a,pn	%fcc0, <label_0x3>
	.word 0xb85220db  ! 5: UMUL_I	umul 	%r8, 0x00db, %r28
	.word 0xb36a22d5  ! 5: SDIVX_I	sdivx	%r8, 0x02d5, %r25
	.word 0xb5a8482f  ! 5: FMOVE	fmovs	%fcc1, %f15, %f26
	.word 0x1f800003  ! 5: FBO	fbo  	<label_0x3>
	.word 0x87a98a6c  ! 5: FCMPq	fcmpq	%fcc<n>, %f4, %f12
	.word 0xab222321  ! 5: MULScc_I	mulscc 	%r8, 0x0321, %r21
	.word 0xb7aa082c  ! 5: FMOVA	fmovs	%fcc1, %f12, %f27
	.word 0xb2796637  ! 5: SDIV_I	sdiv 	%r5, 0x0637, %r25
	.word 0xb869687c  ! 5: UDIVX_I	udivx 	%r5, 0x087c, %r28
	.word 0x33400001  ! 5: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0xa9aa082b  ! 5: FMOVA	fmovs	%fcc1, %f11, %f20
	.word 0xb520a592  ! 5: MULScc_I	mulscc 	%r2, 0x0592, %r26
	.word 0xb850c00c  ! 5: UMUL_R	umul 	%r3, %r12, %r28
	.word 0xa87a000c  ! 5: SDIV_R	sdiv 	%r8, %r12, %r20
	.word 0xb7a0106b  ! 5: FqTOx	fqtox	
	.word 0xb649c00c  ! 5: MULX_R	mulx 	%r7, %r12, %r27
	.word 0xaed1ad6f  ! 5: UMULcc_I	umulcc 	%r6, 0x0d6f, %r23
	.word 0xb8792a3e  ! 5: SDIV_I	sdiv 	%r4, 0x0a3e, %r28
	.word 0xaba0198c  ! 5: FiTOq	dis not found

	.word 0xada8082f  ! 5: FMOVN	fmovs	%fcc1, %f15, %f22
	.word 0xac48c00a  ! 5: MULX_R	mulx 	%r3, %r10, %r22
	.word 0xb6f0c00e  ! 5: UDIVcc_R	udivcc 	%r3, %r14, %r27
	.word 0xad696031  ! 5: SDIVX_I	sdivx	%r5, 0x0031, %r22
	.word 0xba70c00e  ! 5: UDIV_R	udiv 	%r3, %r14, %r29
	.word 0xb9a9882e  ! 5: FMOVNEG	fmovs	%fcc1, %f14, %f28
	.word 0xaba8182a  ! 5: FMOVRGZ	fmovs	%fcc3, %f10, %f21
	.word 0xb2492f03  ! 5: MULX_I	mulx 	%r4, 0x0f03, %r25
	.word 0xafa9482e  ! 5: FMOVCS	fmovs	%fcc1, %f14, %f23
	.word 0xaed8c00c  ! 5: SMULcc_R	smulcc 	%r3, %r12, %r23
	.word 0xb569c00d  ! 5: SDIVX_R	sdivx	%r7, %r13, %r26
	.word 0xb672000b  ! 5: UDIV_R	udiv 	%r8, %r11, %r27
	.word 0xb26a000d  ! 5: UDIVX_R	udivx 	%r8, %r13, %r25
	.word 0x27800001  ! 5: FBUL	fbul,a	<label_0x1>
	.word 0xb9a019cb  ! 5: FdTOq	dis not found

	.word 0xb4d8a0b6  ! 5: SMULcc_I	smulcc 	%r2, 0x00b6, %r26
	.word 0xa879000d  ! 5: SDIV_R	sdiv 	%r4, %r13, %r20
	.word 0xb279a779  ! 5: SDIV_I	sdiv 	%r6, 0x0779, %r25
	.word 0xaafa000e  ! 5: SDIVcc_R	sdivcc 	%r8, %r14, %r21
	.word 0xa8fa000e  ! 5: SDIVcc_R	sdivcc 	%r8, %r14, %r20
	.word 0xbb20aeac  ! 5: MULScc_I	mulscc 	%r2, 0x0eac, %r29
	.word 0xb9a0108d  ! 5: FxTOs	dis not found

	.word 0x33800001  ! 5: FBE	fbe,a	<label_0x1>
	.word 0xac7967cf  ! 5: SDIV_I	sdiv 	%r5, 0x07cf, %r22
	.word 0x2f400003  ! 5: FBPU	fbu,a,pn	%fcc0, <label_0x3>
	.word 0xa9a9c82c  ! 5: FMOVVS	fmovs	%fcc1, %f12, %f20
	.word 0xa9212dc2  ! 5: MULScc_I	mulscc 	%r4, 0x0dc2, %r20
	.word 0xbc70800d  ! 5: UDIV_R	udiv 	%r2, %r13, %r30
	.word 0xaf21295d  ! 5: MULScc_I	mulscc 	%r4, 0x095d, %r23
	.word 0xae48a28f  ! 5: MULX_I	mulx 	%r2, 0x028f, %r23
	.word 0xb3a10dcb  ! 5: FdMULq	fdmulq	
	.word 0xb451a1bf  ! 5: UMUL_I	umul 	%r6, 0x01bf, %r26
	.word 0xb479c00f  ! 5: SDIV_R	sdiv 	%r7, %r15, %r26
	.word 0xa9222bb2  ! 5: MULScc_I	mulscc 	%r8, 0x0bb2, %r20
	.word 0xa9a0012b  ! 5: FABSs	fabss	%f11, %f20
	.word 0xa8d1c00a  ! 5: UMULcc_R	umulcc 	%r7, %r10, %r20
	.word 0xb9212510  ! 5: MULScc_I	mulscc 	%r4, 0x0510, %r28
	.word 0xb678800b  ! 5: SDIV_R	sdiv 	%r2, %r11, %r27
	.word 0xada019ad  ! 5: FsTOq	dis not found

	.word 0xba49e8f5  ! 5: MULX_I	mulx 	%r7, 0x08f5, %r29
	.word 0xada0196f  ! 5: FqTOd	dis not found

	.word 0xb3a0102e  ! 5: FsTOx	dis not found

	.word 0xb248e1cc  ! 5: MULX_I	mulx 	%r3, 0x01cc, %r25
	.word 0xa9a1886b  ! 5: FADDq	dis not found

	.word 0xbad96f02  ! 5: SMULcc_I	smulcc 	%r5, 0x0f02, %r29
	.word 0xaed1ea0e  ! 5: UMULcc_I	umulcc 	%r7, 0x0a0e, %r23
	.word 0xbcd9c00b  ! 5: SMULcc_R	smulcc 	%r7, %r11, %r30
	.word 0xacd167a2  ! 5: UMULcc_I	umulcc 	%r5, 0x07a2, %r22
	.word 0xb269000b  ! 5: UDIVX_R	udivx 	%r4, %r11, %r25
	.word 0xa8d0800d  ! 5: UMULcc_R	umulcc 	%r2, %r13, %r20
	.word 0xb8d0ef38  ! 5: UMULcc_I	umulcc 	%r3, 0x0f38, %r28
	.word 0xac59400e  ! 5: SMUL_R	smul 	%r5, %r14, %r22
	.word 0xacf126c3  ! 5: UDIVcc_I	udivcc 	%r4, 0x06c3, %r22
	.word 0xb721a774  ! 5: MULScc_I	mulscc 	%r6, 0x0774, %r27
	.word 0xb470c00a  ! 5: UDIV_R	udiv 	%r3, %r10, %r26
	.word 0xb9ab882c  ! 5: FMOVPOS	fmovs	%fcc1, %f12, %f28
	.word 0xb668ee2c  ! 5: UDIVX_I	udivx 	%r3, 0x0e2c, %r27
	.word 0xb4d9a9b1  ! 5: SMULcc_I	smulcc 	%r6, 0x09b1, %r26
	.word 0x1f800003  ! 5: FBO	fbo  	<label_0x3>
	.word 0xada0108c  ! 5: FxTOs	dis not found

	.word 0xb5a1882e  ! 5: FADDs	fadds	%f6, %f14, %f26
	.word 0xbda1484d  ! 5: FADDd	faddd	%f36, %f44, %f30
	.word 0xbc69400f  ! 5: UDIVX_R	udivx 	%r5, %r15, %r30
	.word 0xaba0118a  ! 5: FxTOq	fxtoq	
	.word 0xb069c00c  ! 5: UDIVX_R	udivx 	%r7, %r12, %r24
	.word 0xaf696644  ! 5: SDIVX_I	sdivx	%r5, 0x0644, %r23
	.word 0x31400001  ! 5: FBPA	fba,a,pn	%fcc0, <label_0x1>
	.word 0xac59000f  ! 5: SMUL_R	smul 	%r4, %r15, %r22
	.word 0xa878800b  ! 5: SDIV_R	sdiv 	%r2, %r11, %r20
	.word 0xa8f9eb0b  ! 5: SDIVcc_I	sdivcc 	%r7, 0x0b0b, %r20
	.word 0xaaf12a0e  ! 5: UDIVcc_I	udivcc 	%r4, 0x0a0e, %r21
	.word 0x2b800003  ! 5: FBUG	fbug,a	<label_0x3>
	.word 0xb6d0c00a  ! 5: UMULcc_R	umulcc 	%r3, %r10, %r27
	.word 0xa8f1400b  ! 5: UDIVcc_R	udivcc 	%r5, %r11, %r20
	.word 0xb5a01a4a  ! 5: FdTOi	dis not found

	.word 0xbba81c2d  ! 5: FMOVRGEZ	dis not found

	.word 0xafa0012f  ! 5: FABSs	fabss	%f15, %f23
	.word 0xb47221a8  ! 5: UDIV_I	udiv 	%r8, 0x01a8, %r26
	.word 0xae52000b  ! 5: UMUL_R	umul 	%r8, %r11, %r23
	.word 0xb472220e  ! 5: UDIV_I	udiv 	%r8, 0x020e, %r26
	.word 0x0f400001  ! 5: FBPU	fbu
	.word 0xa850c00c  ! 5: UMUL_R	umul 	%r3, %r12, %r20
	.word 0xb5aac82b  ! 5: FMOVGE	fmovs	%fcc1, %f11, %f26
	.word 0xacda25ea  ! 5: SMULcc_I	smulcc 	%r8, 0x05ea, %r22
	.word 0xb9a9882e  ! 5: FMOVNEG	fmovs	%fcc1, %f14, %f28
	.word 0xb6f2267e  ! 5: UDIVcc_I	udivcc 	%r8, 0x067e, %r27
	.word 0xae71400c  ! 5: UDIV_R	udiv 	%r5, %r12, %r23
	.word 0xb678a40d  ! 5: SDIV_I	sdiv 	%r2, 0x040d, %r27
	.word 0xb5a0016c  ! 5: FABSq	dis not found

	.word 0xbcd2000f  ! 5: UMULcc_R	umulcc 	%r8, %r15, %r30
	.word 0xb3ab882b  ! 5: FMOVPOS	fmovs	%fcc1, %f11, %f25
	.word 0xb659c00b  ! 5: SMUL_R	smul 	%r7, %r11, %r27
	.word 0xb05a2c58  ! 5: SMUL_I	smul 	%r8, 0x0c58, %r24
	.word 0xb9b20e6f  ! 5: FXNORS	fxnors	%r8, %r15, %r28
	.word 0xb9a0002b  ! 5: FMOVs	fmovs	%f11, %f28
	.word 0xb321c00f  ! 5: MULScc_R	mulscc 	%r7, %r15, %r25
	.word 0xb279a012  ! 5: SDIV_I	sdiv 	%r6, 0x0012, %r25
	.word 0xaeda000c  ! 5: SMULcc_R	smulcc 	%r8, %r12, %r23
	.word 0xac71800a  ! 5: UDIV_R	udiv 	%r6, %r10, %r22
	.word 0xaef8c00b  ! 5: SDIVcc_R	sdivcc 	%r3, %r11, %r23
	.word 0xada0054e  ! 5: FSQRTd	fsqrt	
	.word 0xacd1000d  ! 5: UMULcc_R	umulcc 	%r4, %r13, %r22
	.word 0xb870c00d  ! 5: UDIV_R	udiv 	%r3, %r13, %r28
	.word 0xb278ac08  ! 5: SDIV_I	sdiv 	%r2, 0x0c08, %r25
	.word 0xb4d8a15c  ! 5: SMULcc_I	smulcc 	%r2, 0x015c, %r26
	.word 0xbcf9000a  ! 5: SDIVcc_R	sdivcc 	%r4, %r10, %r30
	.word 0xb9ab082f  ! 5: FMOVGU	fmovs	%fcc1, %f15, %f28
	.word 0xb0716859  ! 5: UDIV_I	udiv 	%r5, 0x0859, %r24
	.word 0xa869eb25  ! 5: UDIVX_I	udivx 	%r7, 0x0b25, %r20
	.word 0xb3a0056a  ! 5: FSQRTq	fsqrt	
	.word 0xba7a000a  ! 5: SDIV_R	sdiv 	%r8, %r10, %r29
	.word 0xbcfa2957  ! 5: SDIVcc_I	sdivcc 	%r8, 0x0957, %r30
	.word 0xb3a1482b  ! 5: FADDs	fadds	%f5, %f11, %f25
	.word 0xb5a01a4c  ! 5: FdTOi	dis not found

	.word 0xb3a019cc  ! 5: FdTOq	dis not found

	.word 0xb472000c  ! 5: UDIV_R	udiv 	%r8, %r12, %r26
	.word 0xada8042f  ! 5: FMOVRZ	dis not found

	.word 0xb7a0102a  ! 5: FsTOx	dis not found

	.word 0xb071eac9  ! 5: UDIV_I	udiv 	%r7, 0x0ac9, %r24
	.word 0xb269a1f2  ! 5: UDIVX_I	udivx 	%r6, 0x01f2, %r25
	.word 0xaba0056f  ! 5: FSQRTq	fsqrt	
	.word 0xa879ef86  ! 5: SDIV_I	sdiv 	%r7, 0x0f86, %r20
	.word 0xaa58efa3  ! 5: SMUL_I	smul 	%r3, 0x0fa3, %r21
	.word 0xbaf1800a  ! 5: UDIVcc_R	udivcc 	%r6, %r10, %r29
	.word 0xb4496bbe  ! 5: MULX_I	mulx 	%r5, 0x0bbe, %r26
	.word 0xb879c00d  ! 5: SDIV_R	sdiv 	%r7, %r13, %r28
	.word 0xb2496d60  ! 5: MULX_I	mulx 	%r5, 0x0d60, %r25
	.word 0xb1a8082d  ! 5: FMOVRLEZ	fmovs	%fcc1, %f13, %f24
	.word 0xb8d1000c  ! 5: UMULcc_R	umulcc 	%r4, %r12, %r28
	.word 0xb0f1ad98  ! 5: UDIVcc_I	udivcc 	%r6, 0x0d98, %r24
	.word 0x87a94a6a  ! 5: FCMPq	fcmpq	%fcc<n>, %f36, %f8
	.word 0xaef9a50e  ! 5: SDIVcc_I	sdivcc 	%r6, 0x050e, %r23
	.word 0xacd1400c  ! 5: UMULcc_R	umulcc 	%r5, %r12, %r22
	.word 0xac7220c9  ! 5: UDIV_I	udiv 	%r8, 0x00c9, %r22
	.word 0xb1a000ee  ! 5: FNEGq	dis not found

	.word 0xb272000a  ! 5: UDIV_R	udiv 	%r8, %r10, %r25
	.word 0x87a90a4a  ! 5: FCMPd	fcmpd	%fcc<n>, %f4, %f10
	.word 0xb9a088aa  ! 5: FSUBs	fsubs	%f2, %f10, %f28
	.word 0x29400001  ! 5: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x2b800003  ! 5: FBUG	fbug,a	<label_0x3>
	.word 0xada089cc  ! 5: FDIVd	fdivd	%f2, %f12, %f22
	.word 0xb869400d  ! 5: UDIVX_R	udivx 	%r5, %r13, %r28
	.word 0xb0f2000e  ! 5: UDIVcc_R	udivcc 	%r8, %r14, %r24
	.word 0xb65925ca  ! 5: SMUL_I	smul 	%r4, 0x05ca, %r27
	.word 0xacd8800e  ! 5: SMULcc_R	smulcc 	%r2, %r14, %r22
	.word 0xbaf9000d  ! 5: SDIVcc_R	sdivcc 	%r4, %r13, %r29
	.word 0xbba108cb  ! 5: FSUBd	fsubd	%f4, %f42, %f60
	.word 0xb472000a  ! 5: UDIV_R	udiv 	%r8, %r10, %r26
	.word 0x23800001  ! 5: FBNE	fbne,a	<label_0x1>
	.word 0xba69000b  ! 5: UDIVX_R	udivx 	%r4, %r11, %r29
	.word 0xb9a0102e  ! 5: FsTOx	dis not found

	.word 0xbc716aca  ! 5: UDIV_I	udiv 	%r5, 0x0aca, %r30
	.word 0xbba000ed  ! 5: FNEGq	dis not found

	.word 0xaba0102c  ! 5: FsTOx	dis not found

	.word 0xa9a0056a  ! 5: FSQRTq	fsqrt	
	.word 0xb3a0052a  ! 5: FSQRTs	fsqrt	
	.word 0xacfa000d  ! 5: SDIVcc_R	sdivcc 	%r8, %r13, %r22
	.word 0xacf16f2c  ! 5: UDIVcc_I	udivcc 	%r5, 0x0f2c, %r22
	.word 0xaf69000d  ! 5: SDIVX_R	sdivx	%r4, %r13, %r23
	.word 0xbda9882c  ! 5: FMOVNEG	fmovs	%fcc1, %f12, %f30
	.word 0xba69271e  ! 5: UDIVX_I	udivx 	%r4, 0x071e, %r29
	.word 0x29800001  ! 5: FBL	fbl,a	<label_0x1>
	.word 0xb6f12c09  ! 5: UDIVcc_I	udivcc 	%r4, 0x0c09, %r27
	.word 0xa850ad3d  ! 5: UMUL_I	umul 	%r2, 0x0d3d, %r20
	.word 0xbd20ed11  ! 5: MULScc_I	mulscc 	%r3, 0x0d11, %r30
	.word 0x27800001  ! 5: FBUL	fbul,a	<label_0x1>
	.word 0x2f800003  ! 5: FBU	fbu,a	<label_0x3>
	.word 0xada0102c  ! 5: FsTOx	dis not found

	.word 0xa9ab482e  ! 5: FMOVCC	fmovs	%fcc1, %f14, %f20
	.word 0xbaf2000d  ! 5: UDIVcc_R	udivcc 	%r8, %r13, %r29
	.word 0xaba8182f  ! 5: FMOVRGZ	fmovs	%fcc3, %f15, %f21
	.word 0xb6d0ad8c  ! 5: UMULcc_I	umulcc 	%r2, 0x0d8c, %r27
	.word 0xada0c9cb  ! 5: FDIVd	fdivd	%f34, %f42, %f22
	.word 0xb4d1e5ca  ! 5: UMULcc_I	umulcc 	%r7, 0x05ca, %r26
	.word 0xaef924fb  ! 5: SDIVcc_I	sdivcc 	%r4, 0x04fb, %r23
	.word 0xaa7a000d  ! 5: SDIV_R	sdiv 	%r8, %r13, %r21
	.word 0xae69c00d  ! 5: UDIVX_R	udivx 	%r7, %r13, %r23
	.word 0xabaa082a  ! 5: FMOVA	fmovs	%fcc1, %f10, %f21
	.word 0xb522000e  ! 5: MULScc_R	mulscc 	%r8, %r14, %r26
	.word 0xaaf12154  ! 5: UDIVcc_I	udivcc 	%r4, 0x0154, %r21
	.word 0xa9a0188d  ! 5: FiTOs	dis not found

	.word 0xb1a0188c  ! 5: FiTOs	dis not found

	.word 0xb859400e  ! 5: SMUL_R	smul 	%r5, %r14, %r28
	.word 0xb84960f9  ! 5: MULX_I	mulx 	%r5, 0x00f9, %r28
	.word 0xb458ee39  ! 5: SMUL_I	smul 	%r3, 0x0e39, %r26
	.word 0xaa70e77d  ! 5: UDIV_I	udiv 	%r3, 0x077d, %r21
	.word 0xb9a018ca  ! 5: FdTOs	dis not found

	.word 0xb259000b  ! 5: SMUL_R	smul 	%r4, %r11, %r25
	.word 0x09800003  ! 5: FBL	fbl  	<label_0x3>
	.word 0xbaf1c00a  ! 5: UDIVcc_R	udivcc 	%r7, %r10, %r29
	.word 0xb050a58d  ! 5: UMUL_I	umul 	%r2, 0x058d, %r24
	.word 0xb0f0e3dd  ! 5: UDIVcc_I	udivcc 	%r3, 0x03dd, %r24
	.word 0xa8f9c00b  ! 5: SDIVcc_R	sdivcc 	%r7, %r11, %r20
	.word 0xb4f9eee3  ! 5: SDIVcc_I	sdivcc 	%r7, 0x0ee3, %r26
	.word 0xb278c00d  ! 5: SDIV_R	sdiv 	%r3, %r13, %r25
	.word 0xbbaa882f  ! 5: FMOVG	fmovs	%fcc1, %f15, %f29
	.word 0xb5a8042d  ! 5: FMOVRZ	dis not found

	.word 0xb6f8800e  ! 5: SDIVcc_R	sdivcc 	%r2, %r14, %r27
	.word 0xa9a1096f  ! 5: FMULq	dis not found

	.word 0xb369c00e  ! 5: SDIVX_R	sdivx	%r7, %r14, %r25
	.word 0xaa68800e  ! 5: UDIVX_R	udivx 	%r2, %r14, %r21
	.word 0xaf69651f  ! 5: SDIVX_I	sdivx	%r5, 0x051f, %r23
	.word 0xaa51400c  ! 5: UMUL_R	umul 	%r5, %r12, %r21
	.word 0x87a98aca  ! 5: FCMPEd	fcmped	%fcc<n>, %f6, %f10
	.word 0xaaf8e3ee  ! 5: SDIVcc_I	sdivcc 	%r3, 0x03ee, %r21
	.word 0xb1a2084b  ! 5: FADDd	faddd	%f8, %f42, %f24
	.word 0xb649800f  ! 5: MULX_R	mulx 	%r6, %r15, %r27
	.word 0x1f800001  ! 5: FBO	fbo  	<label_0x1>
	.word 0xba696ce2  ! 5: UDIVX_I	udivx 	%r5, 0x0ce2, %r29
	.word 0xbd692f22  ! 5: SDIVX_I	sdivx	%r4, 0x0f22, %r30
	.word 0xb1a20d2a  ! 5: FsMULd	fsmuld	%f8, %f10, %f24
	.word 0xaed8c00c  ! 5: SMULcc_R	smulcc 	%r3, %r12, %r23
	.word 0xad21000c  ! 5: MULScc_R	mulscc 	%r4, %r12, %r22
	.word 0x03800001  ! 5: FBNE	fbne  	<label_0x1>
	.word 0xac5a248a  ! 5: SMUL_I	smul 	%r8, 0x048a, %r22
	.word 0xbaf8eed9  ! 5: SDIVcc_I	sdivcc 	%r3, 0x0ed9, %r29
	.word 0xa8da28a8  ! 5: SMULcc_I	smulcc 	%r8, 0x08a8, %r20
	.word 0xb25125c1  ! 5: UMUL_I	umul 	%r4, 0x05c1, %r25
	.word 0x37800003  ! 5: FBGE	fbge,a	<label_0x3>
	.word 0xada8042a  ! 5: FMOVRZ	dis not found

	.word 0x2d400003  ! 5: FBPG	fbg,a,pn	%fcc0, <label_0x3>
	.word 0xb6f9400f  ! 5: SDIVcc_R	sdivcc 	%r5, %r15, %r27
	.word 0xaed1c00b  ! 5: UMULcc_R	umulcc 	%r7, %r11, %r23
	.word 0xada80c2e  ! 5: FMOVRLZ	dis not found

	.word 0xb4f9a9e4  ! 5: SDIVcc_I	sdivcc 	%r6, 0x09e4, %r26
	.word 0xac51e829  ! 5: UMUL_I	umul 	%r7, 0x0829, %r22
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
	setx  0xb54062c90ff2f053, %r16, %r16
	setx  0x03ab7bc7f55fc375, %r16, %r17
	setx  0x15aa9c518a6962da, %r16, %r18
	setx  0xaf48e31b68838edd, %r16, %r19
	setx  0xfa47f09ce2dbe511, %r16, %r20
	setx  0xeab22117758d6deb, %r16, %r21
	setx  0xe5e5eaa1bce6de45, %r16, %r22
	setx  0x29767a04200f90ad, %r16, %r23
	setx  0xfc72e176614b25e6, %r16, %r24
	setx  0x6bc0cf0623aa959c, %r16, %r25
	setx  0x860b95442ad06553, %r16, %r26
	setx  0x20c95919a1bb6baa, %r16, %r27
	setx  0x4991393b91873faf, %r16, %r28
	setx  0xd229b75759e98ac7, %r16, %r29
	setx  0x19840530f123f24f, %r16, %r30
	setx  0x3626a49ee2c83473, %r16, %r31
	setx  0x0000000000000cc0, %r16, %r10
	setx  0x0000000000000b10, %r16, %r11
	setx  0x00000000000000d0, %r16, %r12
	setx  0x0000000000000db0, %r16, %r13
	setx  0x0000000000000040, %r16, %r14
	setx  0x0000000000000a60, %r16, %r15
	setx  0x0000000000000a61, %r16, %r9
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
	setx  0x812f4e472f0d353d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,30)
	.word 0xec51c000  ! 8: LDSH_R	ldsh	[%r7 + %r0], %r22
	.word 0xb9c44040  ! 10: JMPL_R	jmpl	%r17 + %r0, %r28
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xba00808c
	.word 0xac30abe7  ! 15: ORN_I	orn 	%r2, 0x0be7, %r22
	setx  0x913fd9728cebe616, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb9c44000  ! 18: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xae48800f  ! 19: MULX_R	mulx 	%r2, %r15, %r23
	.word 0xbd28f001  ! 21: SLLX_I	sllx	%r3, 0x0001, %r30
	.word 0xb8c0800e  ! 21: ADDCcc_R	addccc 	%r2, %r14, %r28
	.word 0xb441a302  ! 21: ADDC_I	addc 	%r6, 0x0302, %r26
	.word 0xaa41ee82  ! 21: ADDC_I	addc 	%r7, 0x0e82, %r21
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0xa58f7dc683709b49, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,56)
	.word 0xf458c000  ! 25: LDX_R	ldx	[%r3 + %r0], %r26
	.word 0xb3c44000  ! 27: JMPL_R	jmpl	%r17 + %r0, %r25
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xaf643801  ! 30: MOVcc_I	<illegal instruction>
	setx  0x5c0f72b756a0e65f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,15)
	.word 0xfa18c000  ! 34: LDD_R	ldd	[%r3 + %r0], %r29
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xadc44040  ! 36: JMPL_R	jmpl	%r17 + %r0, %r22
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xaf31a001  ! 39: SRL_I	srl 	%r6, 0x0001, %r23
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaf31d00a  ! 42: SRLX_R	srlx	%r7, %r10, %r23
	.word 0xa811652c  ! 42: OR_I	or 	%r5, 0x052c, %r20
	.word 0xbaa921a0  ! 42: ANDNcc_I	andncc 	%r4, 0x01a0, %r29
	.word 0xb0c1c00b  ! 42: ADDCcc_R	addccc 	%r7, %r11, %r24
	.word 0xb229800e  ! 43: ANDN_R	andn 	%r6, %r14, %r25
	.word 0xb499e32f  ! 43: XORcc_I	xorcc 	%r7, 0x032f, %r26
	.word 0xa889c00d  ! 43: ANDcc_R	andcc 	%r7, %r13, %r20
	.word 0xb6312344  ! 43: ORN_I	orn 	%r4, 0x0344, %r27
	.word 0xb4a8c00b  ! 43: ANDNcc_R	andncc 	%r3, %r11, %r26
	setx  0x05ffef85f956729c, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,54)
	.word 0xea00c000  ! 46: LDUW_R	lduw	[%r3 + %r0], %r21
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 48: JMPL_R	jmpl	%r17 + %r0, %r20
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xb222000a  ! 51: SUB_R	sub 	%r8, %r10, %r25
	.word 0xbc89000a  ! 54: ANDcc_R	andcc 	%r4, %r10, %r30
	setx  0x075f77252996ef38, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xa9c44040  ! 57: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xa879800a  ! 58: SDIV_R	sdiv 	%r6, %r10, %r20
	.word 0xbb64180a  ! 60: MOVcc_R	<illegal instruction>
	.word 0xb089400e  ! 60: ANDcc_R	andcc 	%r5, %r14, %r24
	.word 0xac92000e  ! 60: ORcc_R	orcc 	%r8, %r14, %r22
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaaaa23c6  ! 63: ANDNcc_I	andncc 	%r8, 0x03c6, %r21
	setx  0x493ff496f7a03810, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xbbc44000  ! 66: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb2f1a125  ! 67: UDIVcc_I	udivcc 	%r6, 0x0125, %r25
	.word 0xad29000b  ! 69: SLL_R	sll 	%r4, %r11, %r22
	setx  0x03dfb17b9da82dff, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 73: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xba00808c
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xba00808c
	.word 0xac01800e  ! 78: ADD_R	add 	%r6, %r14, %r22
	setx  0x86bff6bc981e114c, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb1c44040  ! 82: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xab313001  ! 84: SRLX_I	srlx	%r4, 0x0001, %r21
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xb890a1c0  ! 87: ORcc_I	orcc 	%r2, 0x01c0, %r28
	.word 0xb010c00e  ! 89: OR_R	or 	%r3, %r14, %r24
	setx  0xf81fcb3fb6a24bf4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb3c44000  ! 92: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xb4d9000e  ! 93: SMULcc_R	smulcc 	%r4, %r14, %r26
	.word 0xbb322001  ! 95: SRL_I	srl 	%r8, 0x0001, %r29
	.word 0xbab0a527  ! 95: ORNcc_I	orncc 	%r2, 0x0527, %r29
	.word 0xa809a859  ! 95: AND_I	and 	%r6, 0x0859, %r20
	.word 0xb291800e  ! 95: ORcc_R	orcc 	%r6, %r14, %r25
	.word 0xbb30c00e  ! 95: SRL_R	srl 	%r3, %r14, %r29
	setx  0x308f752cab7e61fb, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,50)
	.word 0xf6198000  ! 98: LDD_R	ldd	[%r6 + %r0], %r27
	.word 0xb5c44000  ! 100: JMPL_R	jmpl	%r17 + %r0, %r26
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xb889adfd  ! 103: ANDcc_I	andcc 	%r6, 0x0dfd, %r28
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x556f99488eec10a3, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,15)
	.word 0xf6190000  ! 108: LDD_R	ldd	[%r4 + %r0], %r27
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xadc44000  ! 110: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xb891800b  ! 113: ORcc_R	orcc 	%r6, %r11, %r28
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaa10c00d  ! 116: OR_R	or 	%r3, %r13, %r21
	.word 0xb691a7df  ! 116: ORcc_I	orcc 	%r6, 0x07df, %r27
	.word 0xb9323001  ! 116: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xb3643801  ! 116: MOVcc_I	<illegal instruction>
	.word 0xb7792401  ! 117: MOVR_I	move	%r4, 0xfffffeb0, %r27
	.word 0xaa0a000c  ! 117: AND_R	and 	%r8, %r12, %r21
	.word 0xbc01e8cc  ! 117: ADD_I	add 	%r7, 0x08cc, %r30
	.word 0xb0b1ef29  ! 117: ORNcc_I	orncc 	%r7, 0x0f29, %r24
	.word 0xb7317001  ! 117: SRLX_I	srlx	%r5, 0x0001, %r27
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xad31100d  ! 119: SRLX_R	srlx	%r4, %r13, %r22
	.word 0xb039c00f  ! 119: XNOR_R	xnor 	%r7, %r15, %r24
	.word 0xaa092887  ! 119: AND_I	and 	%r4, 0x0887, %r21
	.word 0xb7643801  ! 119: MOVcc_I	<illegal instruction>
	.word 0xbb29d00a  ! 121: SLLX_R	sllx	%r7, %r10, %r29
	setx  0xdc6f14497d43f15f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb9c44000  ! 124: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xbad9000d  ! 125: SMULcc_R	smulcc 	%r4, %r13, %r29
	.word 0xad28900d  ! 127: SLLX_R	sllx	%r2, %r13, %r22
	setx  0x192f6662e388ce39, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xbbc44040  ! 130: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb248c00b  ! 131: MULX_R	mulx 	%r3, %r11, %r25
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xba41000c  ! 135: ADDC_R	addc 	%r4, %r12, %r29
	setx  0x633f58b636e589d0, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xb1c44040  ! 138: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xb4d8c00d  ! 139: SMULcc_R	smulcc 	%r3, %r13, %r26
	.word 0xbd323001  ! 141: SRLX_I	srlx	%r8, 0x0001, %r30
	.word 0xb239800d  ! 141: XNOR_R	xnor 	%r6, %r13, %r25
	.word 0xb4316141  ! 141: ORN_I	orn 	%r5, 0x0141, %r26
	.word 0xb299800a  ! 141: XORcc_R	xorcc 	%r6, %r10, %r25
	.word 0xb828c00a  ! 141: ANDN_R	andn 	%r3, %r10, %r28
	setx  0x4fefe8df58693ea9, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,54)
	.word 0xfa4a0000  ! 144: LDSB_R	ldsb	[%r8 + %r0], %r29
	.word 0xb1c44040  ! 146: JMPL_R	jmpl	%r17 + %r0, %r24
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xb409400b  ! 149: AND_R	and 	%r5, %r11, %r26
	setx  0x37ef2f4cf4471722, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,34)
	.word 0xf2490000  ! 153: LDSB_R	ldsb	[%r4 + %r0], %r25
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 155: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xa801a9ef  ! 158: ADD_I	add 	%r6, 0x09ef, %r20
	setx  0xa8effd7df7cc9234, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,70)
	.word 0xe801c000  ! 162: LDUW_R	lduw	[%r7 + %r0], %r20
	.word 0xadc44040  ! 164: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xb611ec2b  ! 167: OR_I	or 	%r7, 0x0c2b, %r27
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xaeb2000b  ! 170: ORNcc_R	orncc 	%r8, %r11, %r23
	setx  0xad9f4d5d3a5da76e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xea28c00a  ! 172: STB_R	stb	%r21, [%r3 + %r10]
	.word 0xf020c00a  ! 172: STW_R	stw	%r24, [%r3 + %r10]
	.word 0xf228a360  ! 172: STB_I	stb	%r25, [%r2 + 0x0360]
	.word 0xfa20800c  ! 172: STW_R	stw	%r29, [%r2 + %r12]
	.word 0xea7228c5  ! 172: STX_I	stx	%r21, [%r8 + 0x08c5]
	.word 0xf422000d  ! 172: STW_R	stw	%r26, [%r8 + %r13]
	.word 0xfa32000e  ! 172: STH_R	sth	%r29, [%r8 + %r14]
	.word 0xfc20c00c  ! 172: STW_R	stw	%r30, [%r3 + %r12]
	.word 0xf83225b9  ! 172: STH_I	sth	%r28, [%r8 + 0x05b9]
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xb9c44040  ! 173: JMPL_R	jmpl	%r17 + %r0, %r28
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xf472008d
	.word 0xa8c0a0ed  ! 178: ADDCcc_I	addccc 	%r2, 0x00ed, %r20
	.word 0xb4a9800b  ! 180: ANDNcc_R	andncc 	%r6, %r11, %r26
	.word 0xb618a218  ! 182: XOR_I	xor 	%r2, 0x0218, %r27
	.word 0xb288a15b  ! 184: ANDcc_I	andcc 	%r2, 0x015b, %r25
	.word 0xb7796401  ! 186: MOVR_I	move	%r5, 0x7fffbc90, %r27
	.word 0xae296bd9  ! 188: ANDN_I	andn 	%r5, 0x0bd9, %r23
	.word 0xab64180e  ! 190: MOVcc_R	<illegal instruction>
	.word 0xb231c00c  ! 192: ORN_R	orn 	%r7, %r12, %r25
	setx  0xdcafa57592e39023, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 196: JMPL_R	jmpl	%r17 + %r0, %r21
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xb2a0c00b  ! 199: SUBcc_R	subcc 	%r3, %r11, %r25
	.word 0xa9643801  ! 201: MOVcc_I	<illegal instruction>
	.word 0xb4b96850  ! 201: XNORcc_I	xnorcc 	%r5, 0x0850, %r26
	.word 0xb40a000d  ! 201: AND_R	and 	%r8, %r13, %r26
	.word 0xb441210b  ! 201: ADDC_I	addc 	%r4, 0x010b, %r26
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0x44ff9fac5eb717aa, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,46)
	.word 0xfa18c000  ! 205: LDD_R	ldd	[%r3 + %r0], %r29
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xadc44040  ! 207: JMPL_R	jmpl	%r17 + %r0, %r22
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xba00808c
	setx  0x768fe6ab047e4ddc, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,14)
	.word 0xfa18c000  ! 213: LDD_R	ldd	[%r3 + %r0], %r29
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xb3c44040  ! 215: JMPL_R	jmpl	%r17 + %r0, %r25
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xa9796401  ! 218: MOVR_I	move	%r5, 0x7fffbc90, %r20
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaaa9400e  ! 221: ANDNcc_R	andncc 	%r5, %r14, %r21
	.word 0xa928900a  ! 221: SLLX_R	sllx	%r2, %r10, %r20
	.word 0xb439000a  ! 221: XNOR_R	xnor 	%r4, %r10, %r26
	.word 0xbab92869  ! 221: XNORcc_I	xnorcc 	%r4, 0x0869, %r29
	.word 0xbd39e001  ! 222: SRA_I	sra 	%r7, 0x0001, %r30
	.word 0xaf2a3001  ! 222: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0xb681800b  ! 222: ADDcc_R	addcc 	%r6, %r11, %r27
	.word 0xbc41000d  ! 222: ADDC_R	addc 	%r4, %r13, %r30
	.word 0xb2b1670c  ! 222: ORNcc_I	orncc 	%r5, 0x070c, %r25
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xae01ec41  ! 224: ADD_I	add 	%r7, 0x0c41, %r23
	.word 0xa890e30c  ! 224: ORcc_I	orcc 	%r3, 0x030c, %r20
	.word 0xb209800b  ! 224: AND_R	and 	%r6, %r11, %r25
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x15cf07d551ceb85d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,32)
	.word 0xea498000  ! 228: LDSB_R	ldsb	[%r6 + %r0], %r21
	.word 0xbdc44040  ! 230: JMPL_R	jmpl	%r17 + %r0, %r30
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xab28900b  ! 233: SLLX_R	sllx	%r2, %r11, %r21
	.word 0xb2b9800e  ! 235: XNORcc_R	xnorcc 	%r6, %r14, %r25
	.word 0xb6392ed4  ! 235: XNOR_I	xnor 	%r4, 0x0ed4, %r27
	.word 0xb4c2000d  ! 235: ADDCcc_R	addccc 	%r8, %r13, %r26
	.word 0xba122506  ! 235: OR_I	or 	%r8, 0x0506, %r29
	.word 0xb81a000f  ! 235: XOR_R	xor 	%r8, %r15, %r28
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0xcfcf088bbb1a309b, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,25)
	.word 0xea114000  ! 239: LDUH_R	lduh	[%r5 + %r0], %r21
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 241: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xb2996693  ! 244: XORcc_I	xorcc 	%r5, 0x0693, %r25
	.word 0xb138a001  ! 246: SRA_I	sra 	%r2, 0x0001, %r24
	setx  0x34bf1963a1e1f247, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb5c44000  ! 250: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xae9a2218  ! 252: XORcc_I	xorcc 	%r8, 0x0218, %r23
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xb130f001  ! 255: SRLX_I	srlx	%r3, 0x0001, %r24
	setx  0x120f24671b5f16ba, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,39)
	.word 0xf6110000  ! 259: LDUH_R	lduh	[%r4 + %r0], %r27
	.word 0xb7c44000  ! 261: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xb530800f  ! 264: SRL_R	srl 	%r2, %r15, %r26
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0x63df9ee44a3bd909, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,60)
	.word 0xfc494000  ! 269: LDSB_R	ldsb	[%r5 + %r0], %r30
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xb7c44000  ! 271: JMPL_R	jmpl	%r17 + %r0, %r27
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xb8b123ad  ! 274: ORNcc_I	orncc 	%r4, 0x03ad, %r28
	.word 0xae0a2630  ! 276: AND_I	and 	%r8, 0x0630, %r23
	setx  0xce0fcb59e129f718, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 280: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xba00808c
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xa841259c  ! 284: ADDC_I	addc 	%r4, 0x059c, %r20
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb9643801  ! 287: MOVcc_I	<illegal instruction>
	.word 0xb4922b47  ! 287: ORcc_I	orcc 	%r8, 0x0b47, %r26
	.word 0xbac2000e  ! 287: ADDCcc_R	addccc 	%r8, %r14, %r29
	.word 0xae39624e  ! 287: XNOR_I	xnor 	%r5, 0x024e, %r23
	.word 0xb964180c  ! 287: MOVcc_R	<illegal instruction>
	.word 0xad64180a  ! 289: MOVcc_R	<illegal instruction>
	setx  0x3f0f3aa9c115fe5f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb3c44000  ! 292: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xaef0800c  ! 293: UDIVcc_R	udivcc 	%r2, %r12, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb431000f  ! 297: ORN_R	orn 	%r4, %r15, %r26
	setx  0x9b8f6e04f50daa41, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xbdc44000  ! 300: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xa8f9c00b  ! 301: SDIVcc_R	sdivcc 	%r7, %r11, %r20
	.word 0xb62a000c  ! 304: ANDN_R	andn 	%r8, %r12, %r27
	setx  0x499fef3dcb7b368f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 307: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb070efe2  ! 308: UDIV_I	udiv 	%r3, 0x0fe2, %r24
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
	.word 0xba39250c  ! 312: XNOR_I	xnor 	%r4, 0x050c, %r29
	.word 0xba19400d  ! 312: XOR_R	xor 	%r5, %r13, %r29
	.word 0xaec0eddc  ! 312: ADDCcc_I	addccc 	%r3, 0x0ddc, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xac40a886  ! 314: ADDC_I	addc 	%r2, 0x0886, %r22
	.word 0xb331a001  ! 314: SRL_I	srl 	%r6, 0x0001, %r25
	.word 0xbc09c00a  ! 314: AND_R	and 	%r7, %r10, %r30
	.word 0xba9120ab  ! 314: ORcc_I	orcc 	%r4, 0x00ab, %r29
	.word 0xb409c00b  ! 314: AND_R	and 	%r7, %r11, %r26
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0xf99f7387d02e52ef, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,8)
	.word 0xee508000  ! 318: LDSH_R	ldsh	[%r2 + %r0], %r23
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xb1c44040  ! 320: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xba08e0ba  ! 323: AND_I	and 	%r3, 0x00ba, %r29
	.word 0xba41a477  ! 325: ADDC_I	addc 	%r6, 0x0477, %r29
	.word 0xa811000e  ! 325: OR_R	or 	%r4, %r14, %r20
	.word 0xaeb9a3b9  ! 325: XNORcc_I	xnorcc 	%r6, 0x03b9, %r23
	.word 0xb6b1800e  ! 325: ORNcc_R	orncc 	%r6, %r14, %r27
	.word 0xba41800d  ! 326: ADDC_R	addc 	%r6, %r13, %r29
	.word 0xa898800c  ! 326: XORcc_R	xorcc 	%r2, %r12, %r20
	.word 0xad30800f  ! 326: SRL_R	srl 	%r2, %r15, %r22
	.word 0xb0b0c00a  ! 326: ORNcc_R	orncc 	%r3, %r10, %r24
	.word 0xb400800f  ! 327: ADD_R	add 	%r2, %r15, %r26
	setx  0xea6f103473331a9b, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb3c44000  ! 331: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xaf29c00c  ! 333: SLL_R	sll 	%r7, %r12, %r23
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xb364180e  ! 336: MOVcc_R	<illegal instruction>
	.word 0xbc01400f  ! 339: ADD_R	add 	%r5, %r15, %r30
	setx  0x897fc5fc65eed4ef, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 342: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xaef1800a  ! 343: UDIVcc_R	udivcc 	%r6, %r10, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xa8112962  ! 346: OR_I	or 	%r4, 0x0962, %r20
	.word 0xb489c00f  ! 346: ANDcc_R	andcc 	%r7, %r15, %r26
	.word 0xb029000a  ! 346: ANDN_R	andn 	%r4, %r10, %r24
	.word 0xba09800c  ! 346: AND_R	and 	%r6, %r12, %r29
	.word 0xaf32000d  ! 347: SRL_R	srl 	%r8, %r13, %r23
	setx  0x5cbf39d12f6cbda4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xfc29a8ac  ! 349: STB_I	stb	%r30, [%r6 + 0x08ac]
	.word 0xee30800a  ! 349: STH_R	sth	%r23, [%r2 + %r10]
	.word 0xf2322449  ! 349: STH_I	sth	%r25, [%r8 + 0x0449]
	.word 0xfc29e80c  ! 349: STB_I	stb	%r30, [%r7 + 0x080c]
	.word 0xf671ee37  ! 349: STX_I	stx	%r27, [%r7 + 0x0e37]
	.word 0xf2712015  ! 349: STX_I	stx	%r25, [%r4 + 0x0015]
	.word 0xec20ec3f  ! 349: STW_I	stw	%r22, [%r3 + 0x0c3f]
	.word 0xec31ae82  ! 349: STH_I	sth	%r22, [%r6 + 0x0e82]
	.word 0xee70c00f  ! 349: STX_R	stx	%r23, [%r3 + %r15]
	.word 0xb3c44000  ! 350: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xf87223c6  ! 352: STX_I	stx	%r28, [%r8 + 0x03c6]
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xa831e21a  ! 355: SUBC_I	orn 	%r7, 0x021a, %r20
	.word 0xad39400f  ! 357: SRA_R	sra 	%r5, %r15, %r22
	.word 0xac20a952  ! 359: SUB_I	sub 	%r2, 0x0952, %r22
	.word 0xa828c00d  ! 361: ANDN_R	andn 	%r3, %r13, %r20
	.word 0xb5393001  ! 363: SRAX_I	srax	%r4, 0x0001, %r26
	.word 0xb97a040a  ! 365: MOVR_R	move	%r8, %r10, %r28
	.word 0xac99616b  ! 367: XORcc_I	xorcc 	%r5, 0x016b, %r22
	setx  0xd14f0af27f49a4b7, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,70)
	.word 0xec1a0000  ! 371: LDD_R	ldd	[%r8 + %r0], %r22
	.word 0xb5c44000  ! 373: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb93a2001  ! 376: SRA_I	sra 	%r8, 0x0001, %r28
	.word 0xb029800a  ! 378: ANDN_R	andn 	%r6, %r10, %r24
	.word 0xb03a2ac2  ! 378: XNOR_I	xnor 	%r8, 0x0ac2, %r24
	.word 0xaf39e001  ! 378: SRA_I	sra 	%r7, 0x0001, %r23
	.word 0xb481e8d7  ! 379: ADDcc_I	addcc 	%r7, 0x08d7, %r26
	.word 0xb488abb1  ! 379: ANDcc_I	andcc 	%r2, 0x0bb1, %r26
	.word 0xbc98800d  ! 379: XORcc_R	xorcc 	%r2, %r13, %r30
	.word 0xb881a9f9  ! 379: ADDcc_I	addcc 	%r6, 0x09f9, %r28
	.word 0xb238c00f  ! 381: XNOR_R	xnor 	%r3, %r15, %r25
	setx  0x1d6f77e29384eb7e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb3c44040  ! 384: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xaa71400e  ! 385: UDIV_R	udiv 	%r5, %r14, %r21
	setx  0x2e3f218c27f92c31, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,55)
	.word 0xfa58c000  ! 389: LDX_R	ldx	[%r3 + %r0], %r29
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xb1c44040  ! 391: JMPL_R	jmpl	%r17 + %r0, %r24
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xaa20a877  ! 394: SUB_I	sub 	%r2, 0x0877, %r21
	.word 0xb431edae  ! 397: ORN_I	orn 	%r7, 0x0dae, %r26
	setx  0x280fe9ccf9afffe5, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 400: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xbcf9691c  ! 401: SDIVcc_I	sdivcc 	%r5, 0x091c, %r30
	.word 0xb2b92f5e  ! 403: XNORcc_I	xnorcc 	%r4, 0x0f5e, %r25
	setx  0x41af2910c3f3fc77, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf629000c  ! 405: STB_R	stb	%r27, [%r4 + %r12]
	.word 0xfa222520  ! 405: STW_I	stw	%r29, [%r8 + 0x0520]
	.word 0xea71800f  ! 405: STX_R	stx	%r21, [%r6 + %r15]
	.word 0xf632297c  ! 405: STH_I	sth	%r27, [%r8 + 0x097c]
	.word 0xf27226a0  ! 405: STX_I	stx	%r25, [%r8 + 0x06a0]
	.word 0xe820c00a  ! 405: STW_R	stw	%r20, [%r3 + %r10]
	.word 0xf871800f  ! 405: STX_R	stx	%r28, [%r6 + %r15]
	.word 0xf232000e  ! 405: STH_R	sth	%r25, [%r8 + %r14]
	.word 0xee20a7e5  ! 405: STW_I	stw	%r23, [%r2 + 0x07e5]
	.word 0xea71e7d5  ! 405: STX_I	stx	%r21, [%r7 + 0x07d5]
	.word 0xfa30c00c  ! 405: STH_R	sth	%r29, [%r3 + %r12]
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 406: JMPL_R	jmpl	%r17 + %r0, %r21
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xfa71e463  ! 409: STX_I	stx	%r29, [%r7 + 0x0463]
	.word 0xb4b928ce  ! 412: XNORcc_I	xnorcc 	%r4, 0x08ce, %r26
	.word 0xb820e90a  ! 414: SUB_I	sub 	%r3, 0x090a, %r28
	.word 0xac31c00b  ! 416: ORN_R	orn 	%r7, %r11, %r22
	.word 0xb779840f  ! 418: MOVR_R	move	%r6, %r15, %r27
	.word 0xa8a0ea47  ! 420: SUBcc_I	subcc 	%r3, 0x0a47, %r20
	.word 0xb530d00d  ! 422: SRLX_R	srlx	%r3, %r13, %r26
	.word 0xac91e0ed  ! 424: ORcc_I	orcc 	%r7, 0x00ed, %r22
	.word 0xacb8800b  ! 427: XNORcc_R	xnorcc 	%r2, %r11, %r22
	setx  0x869f68298550b9e0, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44000  ! 430: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb921400d  ! 431: MULScc_R	mulscc 	%r5, %r13, %r28
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb418e0ee  ! 434: XOR_I	xor 	%r3, 0x00ee, %r26
	.word 0xaa90800c  ! 434: ORcc_R	orcc 	%r2, %r12, %r21
	.word 0xb839400f  ! 434: XNOR_R	xnor 	%r5, %r15, %r28
	.word 0xb4316b8e  ! 434: ORN_I	orn 	%r5, 0x0b8e, %r26
	.word 0xbc39a49a  ! 436: XNOR_I	xnor 	%r6, 0x049a, %r30
	setx  0x09df0ab006f50aaa, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb9c44040  ! 439: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xa849000a  ! 440: MULX_R	mulx 	%r4, %r10, %r20
	.word 0xbac1e7f5  ! 442: ADDCcc_I	addccc 	%r7, 0x07f5, %r29
	.word 0xb6b1800e  ! 442: ORNcc_R	orncc 	%r6, %r14, %r27
	.word 0xb531900f  ! 442: SRLX_R	srlx	%r6, %r15, %r26
	.word 0xbaa9c00c  ! 444: ANDNcc_R	andncc 	%r7, %r12, %r29
	setx  0x72af95d7d0b1bf58, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xadc44000  ! 447: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xac51a6d4  ! 448: UMUL_I	umul 	%r6, 0x06d4, %r22
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xbd39c00b  ! 452: SRA_R	sra 	%r7, %r11, %r30
	setx  0xb4af9cd56d7d3593, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xabc44040  ! 455: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xb27127ec  ! 456: UDIV_I	udiv 	%r4, 0x07ec, %r25
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xbc39800b  ! 459: XNOR_R	xnor 	%r6, %r11, %r30
	.word 0xae39a9b5  ! 459: XNOR_I	xnor 	%r6, 0x09b5, %r23
	.word 0xb131b001  ! 459: SRLX_I	srlx	%r6, 0x0001, %r24
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0xa65f3c14a5504c1c, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,15)
	.word 0xec018000  ! 463: LDUW_R	lduw	[%r6 + %r0], %r22
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 465: JMPL_R	jmpl	%r17 + %r0, %r21
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xba00808c
	setx  0x656fc4c3a5c6c1bc, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,9)
	.word 0xec118000  ! 471: LDUH_R	lduh	[%r6 + %r0], %r22
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xb5c44000  ! 473: JMPL_R	jmpl	%r17 + %r0, %r26
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xba18eb76  ! 476: XOR_I	xor 	%r3, 0x0b76, %r29
	setx  0xaf6f23d0157ae096, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,54)
	.word 0xfa014000  ! 480: LDUW_R	lduw	[%r5 + %r0], %r29
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xb5c44000  ! 482: JMPL_R	jmpl	%r17 + %r0, %r26
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xb0ba000d  ! 485: XNORcc_R	xnorcc 	%r8, %r13, %r24
	setx  0x407fe161d1b309f2, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,56)
	.word 0xfa520000  ! 489: LDSH_R	ldsh	[%r8 + %r0], %r29
	.word 0xafc44040  ! 491: JMPL_R	jmpl	%r17 + %r0, %r23
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xba39000e  ! 494: XNOR_R	xnor 	%r4, %r14, %r29
	.word 0xba38e274  ! 497: XNOR_I	xnor 	%r3, 0x0274, %r29
	setx  0xf94ff0b9bef95b1f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
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
	setx  0x2870ac6acd4bcf6a, %r16, %r16
	setx  0x5114ceac4144683b, %r16, %r17
	setx  0x60f91c51811e91f3, %r16, %r18
	setx  0x5ff877c7868c53de, %r16, %r19
	setx  0xf95d540be0440608, %r16, %r20
	setx  0xff5af7805a912ea2, %r16, %r21
	setx  0x4b30947c060bda7a, %r16, %r22
	setx  0x9c6dee48fa029a9c, %r16, %r23
	setx  0x01af5b1ff95169e6, %r16, %r24
	setx  0x674c0a0da8526438, %r16, %r25
	setx  0xea176f4ccdcc7806, %r16, %r26
	setx  0xc78056cc09bc58e8, %r16, %r27
	setx  0xd3d392eae389fd00, %r16, %r28
	setx  0x5856a05da3b0ffd6, %r16, %r29
	setx  0x0737af54f68b0a9d, %r16, %r30
	setx  0xd4cf8fb5fbbcbea7, %r16, %r31
	setx  0x0000000000000a00, %r16, %r10
	setx  0x0000000000000f20, %r16, %r11
	setx  0x0000000000000320, %r16, %r12
	setx  0x0000000000000d40, %r16, %r13
	setx  0x0000000000000c70, %r16, %r14
	setx  0x0000000000000ae0, %r16, %r15
	setx  0x0000000000000a91, %r16, %r9
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
	setx  0x1f6f030ef8e81934, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,30)
	.word 0xec51c000  ! 8: LDSH_R	ldsh	[%r7 + %r0], %r22
	.word 0xb5c44000  ! 10: JMPL_R	jmpl	%r17 + %r0, %r26
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xba00808c
	.word 0xb830e1c8  ! 15: ORN_I	orn 	%r3, 0x01c8, %r28
	setx  0xa9df81fb7641e5af, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb9c44000  ! 18: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb449800b  ! 19: MULX_R	mulx 	%r6, %r11, %r26
	.word 0xad297001  ! 21: SLLX_I	sllx	%r5, 0x0001, %r22
	.word 0xb8c1800b  ! 21: ADDCcc_R	addccc 	%r6, %r11, %r28
	.word 0xb640e41e  ! 21: ADDC_I	addc 	%r3, 0x041e, %r27
	.word 0xb440ee7e  ! 21: ADDC_I	addc 	%r3, 0x0e7e, %r26
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0x180f1d65038e42d5, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,56)
	.word 0xf458c000  ! 25: LDX_R	ldx	[%r3 + %r0], %r26
	.word 0xbdc44040  ! 27: JMPL_R	jmpl	%r17 + %r0, %r30
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xbb643801  ! 30: MOVcc_I	<illegal instruction>
	setx  0xc86f2a45a451ed0a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,15)
	.word 0xfa18c000  ! 34: LDD_R	ldd	[%r3 + %r0], %r29
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 36: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xa930e001  ! 39: SRL_I	srl 	%r3, 0x0001, %r20
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xbb31500e  ! 42: SRLX_R	srlx	%r5, %r14, %r29
	.word 0xac1124dc  ! 42: OR_I	or 	%r4, 0x04dc, %r22
	.word 0xb2a8a276  ! 42: ANDNcc_I	andncc 	%r2, 0x0276, %r25
	.word 0xb8c2000b  ! 42: ADDCcc_R	addccc 	%r8, %r11, %r28
	.word 0xbc29400b  ! 43: ANDN_R	andn 	%r5, %r11, %r30
	.word 0xb698ac6d  ! 43: XORcc_I	xorcc 	%r2, 0x0c6d, %r27
	.word 0xb488c00d  ! 43: ANDcc_R	andcc 	%r3, %r13, %r26
	.word 0xb431e49c  ! 43: ORN_I	orn 	%r7, 0x049c, %r26
	.word 0xaaa8c00f  ! 43: ANDNcc_R	andncc 	%r3, %r15, %r21
	setx  0x48ff8c02cd081b23, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,54)
	.word 0xea00c000  ! 46: LDUW_R	lduw	[%r3 + %r0], %r21
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xa9c44040  ! 48: JMPL_R	jmpl	%r17 + %r0, %r20
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xaa20800f  ! 51: SUB_R	sub 	%r2, %r15, %r21
	.word 0xae89000c  ! 54: ANDcc_R	andcc 	%r4, %r12, %r23
	setx  0x08afe09d9ea5dccd, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 57: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xba79800a  ! 58: SDIV_R	sdiv 	%r6, %r10, %r29
	.word 0xb964180c  ! 60: MOVcc_R	<illegal instruction>
	.word 0xac89c00e  ! 60: ANDcc_R	andcc 	%r7, %r14, %r22
	.word 0xbc91c00c  ! 60: ORcc_R	orcc 	%r7, %r12, %r30
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb0a9ac9d  ! 63: ANDNcc_I	andncc 	%r6, 0x0c9d, %r24
	setx  0xbcef0cfc7326867d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xabc44000  ! 66: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xaaf0ed48  ! 67: UDIVcc_I	udivcc 	%r3, 0x0d48, %r21
	.word 0xad2a000d  ! 69: SLL_R	sll 	%r8, %r13, %r22
	setx  0xe69f782a99242f96, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 73: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xba00808c
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xba00808c
	.word 0xae00c00c  ! 78: ADD_R	add 	%r3, %r12, %r23
	setx  0x1b4ffd9d83d5bcfd, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xafc44040  ! 82: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb9323001  ! 84: SRLX_I	srlx	%r8, 0x0001, %r28
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xa89125ba  ! 87: ORcc_I	orcc 	%r4, 0x05ba, %r20
	.word 0xa811400b  ! 89: OR_R	or 	%r5, %r11, %r20
	setx  0x0c9f352fd6c322dc, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xbbc44000  ! 92: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xaed8c00f  ! 93: SMULcc_R	smulcc 	%r3, %r15, %r23
	.word 0xa9316001  ! 95: SRL_I	srl 	%r5, 0x0001, %r20
	.word 0xb6b222c6  ! 95: ORNcc_I	orncc 	%r8, 0x02c6, %r27
	.word 0xa808a62e  ! 95: AND_I	and 	%r2, 0x062e, %r20
	.word 0xac90800d  ! 95: ORcc_R	orcc 	%r2, %r13, %r22
	.word 0xb731800d  ! 95: SRL_R	srl 	%r6, %r13, %r27
	setx  0x8b6faed3f9c261e1, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,50)
	.word 0xf6198000  ! 98: LDD_R	ldd	[%r6 + %r0], %r27
	.word 0xb5c44040  ! 100: JMPL_R	jmpl	%r17 + %r0, %r26
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xb6892f2f  ! 103: ANDcc_I	andcc 	%r4, 0x0f2f, %r27
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0x5aefc5d5f89c7770, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,15)
	.word 0xf6190000  ! 108: LDD_R	ldd	[%r4 + %r0], %r27
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xabc44000  ! 110: JMPL_R	jmpl	%r17 + %r0, %r21
	.word 0xa891400f  ! 113: ORcc_R	orcc 	%r5, %r15, %r20
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xa811c00e  ! 116: OR_R	or 	%r7, %r14, %r20
	.word 0xb690a1eb  ! 116: ORcc_I	orcc 	%r2, 0x01eb, %r27
	.word 0xbd30f001  ! 116: SRLX_I	srlx	%r3, 0x0001, %r30
	.word 0xbd643801  ! 116: MOVcc_I	<illegal instruction>
	.word 0xab792401  ! 117: MOVR_I	move	%r4, 0xfffffeb0, %r21
	.word 0xac09000e  ! 117: AND_R	and 	%r4, %r14, %r22
	.word 0xb801ab7b  ! 117: ADD_I	add 	%r6, 0x0b7b, %r28
	.word 0xbab16871  ! 117: ORNcc_I	orncc 	%r5, 0x0871, %r29
	.word 0xab317001  ! 117: SRLX_I	srlx	%r5, 0x0001, %r21
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xa931500c  ! 119: SRLX_R	srlx	%r5, %r12, %r20
	.word 0xaa38c00b  ! 119: XNOR_R	xnor 	%r3, %r11, %r21
	.word 0xac0926bb  ! 119: AND_I	and 	%r4, 0x06bb, %r22
	.word 0xa9643801  ! 119: MOVcc_I	<illegal instruction>
	.word 0xa929100d  ! 121: SLLX_R	sllx	%r4, %r13, %r20
	setx  0xf1df94a72367e469, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44040  ! 124: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xb4d8c00e  ! 125: SMULcc_R	smulcc 	%r3, %r14, %r26
	.word 0xab29100c  ! 127: SLLX_R	sllx	%r4, %r12, %r21
	setx  0x2c2f7dbbcd14e7af, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xa9c44000  ! 130: JMPL_R	jmpl	%r17 + %r0, %r20
	.word 0xac49000d  ! 131: MULX_R	mulx 	%r4, %r13, %r22
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb441400c  ! 135: ADDC_R	addc 	%r5, %r12, %r26
	setx  0x2edf10e4cd0cd5a9, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xb5c44040  ! 138: JMPL_R	jmpl	%r17 + %r0, %r26
	.word 0xb4d9400c  ! 139: SMULcc_R	smulcc 	%r5, %r12, %r26
	.word 0xab30f001  ! 141: SRLX_I	srlx	%r3, 0x0001, %r21
	.word 0xb238800e  ! 141: XNOR_R	xnor 	%r2, %r14, %r25
	.word 0xba31adf0  ! 141: ORN_I	orn 	%r6, 0x0df0, %r29
	.word 0xbc9a000e  ! 141: XORcc_R	xorcc 	%r8, %r14, %r30
	.word 0xba2a000c  ! 141: ANDN_R	andn 	%r8, %r12, %r29
	setx  0xa18f99c31dede24d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,54)
	.word 0xfa4a0000  ! 144: LDSB_R	ldsb	[%r8 + %r0], %r29
	.word 0xadc44040  ! 146: JMPL_R	jmpl	%r17 + %r0, %r22
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xb209000e  ! 149: AND_R	and 	%r4, %r14, %r25
	setx  0xb4bff91720abfcb4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,34)
	.word 0xf2490000  ! 153: LDSB_R	ldsb	[%r4 + %r0], %r25
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xbbc44040  ! 155: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xa801e372  ! 158: ADD_I	add 	%r7, 0x0372, %r20
	setx  0xb5bf9fea085a49ff, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,70)
	.word 0xe801c000  ! 162: LDUW_R	lduw	[%r7 + %r0], %r20
	.word 0xadc44040  ! 164: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xae11226a  ! 167: OR_I	or 	%r4, 0x026a, %r23
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb4b0800b  ! 170: ORNcc_R	orncc 	%r2, %r11, %r26
	setx  0xcf0f7d2da4da2fd6, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf62a000d  ! 172: STB_R	stb	%r27, [%r8 + %r13]
	.word 0xf821400f  ! 172: STW_R	stw	%r28, [%r5 + %r15]
	.word 0xf029ac34  ! 172: STB_I	stb	%r24, [%r6 + 0x0c34]
	.word 0xee21c00e  ! 172: STW_R	stw	%r23, [%r7 + %r14]
	.word 0xf671a7e7  ! 172: STX_I	stx	%r27, [%r6 + 0x07e7]
	.word 0xfa21c00b  ! 172: STW_R	stw	%r29, [%r7 + %r11]
	.word 0xf232000f  ! 172: STH_R	sth	%r25, [%r8 + %r15]
	.word 0xf621800c  ! 172: STW_R	stw	%r27, [%r6 + %r12]
	.word 0xf831656a  ! 172: STH_I	sth	%r28, [%r5 + 0x056a]
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xa9c44000  ! 173: JMPL_R	jmpl	%r17 + %r0, %r20
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xf472008d
	.word 0xaec16c32  ! 178: ADDCcc_I	addccc 	%r5, 0x0c32, %r23
	.word 0xb2a9800f  ! 180: ANDNcc_R	andncc 	%r6, %r15, %r25
	.word 0xbc192983  ! 182: XOR_I	xor 	%r4, 0x0983, %r30
	.word 0xbc88e572  ! 184: ANDcc_I	andcc 	%r3, 0x0572, %r30
	.word 0xb779e401  ! 186: MOVR_I	move	%r7, 0x7fffbc90, %r27
	.word 0xac296808  ! 188: ANDN_I	andn 	%r5, 0x0808, %r22
	.word 0xad64180c  ! 190: MOVcc_R	<illegal instruction>
	.word 0xb031c00e  ! 192: ORN_R	orn 	%r7, %r14, %r24
	setx  0xbc3fc48757fee95a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
.align 0x4
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 196: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xb4a1800a  ! 199: SUBcc_R	subcc 	%r6, %r10, %r26
	.word 0xb5643801  ! 201: MOVcc_I	<illegal instruction>
	.word 0xb8b8ea3a  ! 201: XNORcc_I	xnorcc 	%r3, 0x0a3a, %r28
	.word 0xb60a000a  ! 201: AND_R	and 	%r8, %r10, %r27
	.word 0xba40ed19  ! 201: ADDC_I	addc 	%r3, 0x0d19, %r29
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0x5f5f1d889f069eea, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,46)
	.word 0xfa18c000  ! 205: LDD_R	ldd	[%r3 + %r0], %r29
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xadc44040  ! 207: JMPL_R	jmpl	%r17 + %r0, %r22
thr0_ic_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_10), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xba00808c
	setx  0xdc3f70e432009e9d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,14)
	.word 0xfa18c000  ! 213: LDD_R	ldd	[%r3 + %r0], %r29
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xb9c44000  ! 215: JMPL_R	jmpl	%r17 + %r0, %r28
thr0_ic_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_11), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xb1796401  ! 218: MOVR_I	move	%r5, 0x7fffbc90, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaca9000f  ! 221: ANDNcc_R	andncc 	%r4, %r15, %r22
	.word 0xad29100b  ! 221: SLLX_R	sllx	%r4, %r11, %r22
	.word 0xae39000c  ! 221: XNOR_R	xnor 	%r4, %r12, %r23
	.word 0xb2b8e858  ! 221: XNORcc_I	xnorcc 	%r3, 0x0858, %r25
	.word 0xa938a001  ! 222: SRA_I	sra 	%r2, 0x0001, %r20
	.word 0xb3297001  ! 222: SLLX_I	sllx	%r5, 0x0001, %r25
	.word 0xb882000f  ! 222: ADDcc_R	addcc 	%r8, %r15, %r28
	.word 0xbc40800d  ! 222: ADDC_R	addc 	%r2, %r13, %r30
	.word 0xb0b0a0ef  ! 222: ORNcc_I	orncc 	%r2, 0x00ef, %r24
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xac00aadd  ! 224: ADD_I	add 	%r2, 0x0add, %r22
	.word 0xb8916ef2  ! 224: ORcc_I	orcc 	%r5, 0x0ef2, %r28
	.word 0xaa09800b  ! 224: AND_R	and 	%r6, %r11, %r21
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0xbd3fedf79ff5f6ac, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,32)
	.word 0xea498000  ! 228: LDSB_R	ldsb	[%r6 + %r0], %r21
	.word 0xabc44000  ! 230: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_12), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xab29100b  ! 233: SLLX_R	sllx	%r4, %r11, %r21
	.word 0xaeb9c00d  ! 235: XNORcc_R	xnorcc 	%r7, %r13, %r23
	.word 0xba3a2c3c  ! 235: XNOR_I	xnor 	%r8, 0x0c3c, %r29
	.word 0xaac1c00f  ! 235: ADDCcc_R	addccc 	%r7, %r15, %r21
	.word 0xb011ed23  ! 235: OR_I	or 	%r7, 0x0d23, %r24
	.word 0xaa19400f  ! 235: XOR_R	xor 	%r5, %r15, %r21
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0x798f14f8cebc8d6e, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,25)
	.word 0xea114000  ! 239: LDUH_R	lduh	[%r5 + %r0], %r21
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xb9c44040  ! 241: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb299aeca  ! 244: XORcc_I	xorcc 	%r6, 0x0eca, %r25
	.word 0xb739a001  ! 246: SRA_I	sra 	%r6, 0x0001, %r27
	setx  0xac4fae47d1f2b707, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xbbc44000  ! 250: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xaa98a7f3  ! 252: XORcc_I	xorcc 	%r2, 0x07f3, %r21
thr0_ic_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_13), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xb7313001  ! 255: SRLX_I	srlx	%r4, 0x0001, %r27
	setx  0x7d7fa87dddbabd7f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,39)
	.word 0xf6110000  ! 259: LDUH_R	lduh	[%r4 + %r0], %r27
	.word 0xb7c44000  ! 261: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xbd31400d  ! 264: SRL_R	srl 	%r5, %r13, %r30
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	setx  0x86bf1108b877ffa4, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,60)
	.word 0xfc494000  ! 269: LDSB_R	ldsb	[%r5 + %r0], %r30
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 271: JMPL_R	jmpl	%r17 + %r0, %r25
thr0_ic_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_14), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xb6b1e276  ! 274: ORNcc_I	orncc 	%r7, 0x0276, %r27
	.word 0xbc09688a  ! 276: AND_I	and 	%r5, 0x088a, %r30
	setx  0x2b3f48a219ddbc20, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xadc44040  ! 280: JMPL_R	jmpl	%r17 + %r0, %r22
	.word 0xba00808c
thr0_ic_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_15), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xba412ed8  ! 284: ADDC_I	addc 	%r4, 0x0ed8, %r29
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb5643801  ! 287: MOVcc_I	<illegal instruction>
	.word 0xb290afe4  ! 287: ORcc_I	orcc 	%r2, 0x0fe4, %r25
	.word 0xb4c1400a  ! 287: ADDCcc_R	addccc 	%r5, %r10, %r26
	.word 0xaa3928bf  ! 287: XNOR_I	xnor 	%r4, 0x08bf, %r21
	.word 0xbb64180e  ! 287: MOVcc_R	<illegal instruction>
	.word 0xb764180f  ! 289: MOVcc_R	<illegal instruction>
	setx  0x42cf89ae34b37a9d, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xbdc44040  ! 292: JMPL_R	jmpl	%r17 + %r0, %r30
	.word 0xbcf0c00a  ! 293: UDIVcc_R	udivcc 	%r3, %r10, %r30
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xaa31c00c  ! 297: ORN_R	orn 	%r7, %r12, %r21
	setx  0xe6cf7c1b44937a06, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb3c44040  ! 300: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xbcf8c00e  ! 301: SDIVcc_R	sdivcc 	%r3, %r14, %r30
	.word 0xb02a000a  ! 304: ANDN_R	andn 	%r8, %r10, %r24
	setx  0xb1dfd63703811c02, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb3c44040  ! 307: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xaa70a8f3  ! 308: UDIV_I	udiv 	%r2, 0x08f3, %r21
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
	.word 0xac38e27d  ! 312: XNOR_I	xnor 	%r3, 0x027d, %r22
	.word 0xb019400b  ! 312: XOR_R	xor 	%r5, %r11, %r24
	.word 0xacc0a3d6  ! 312: ADDCcc_I	addccc 	%r2, 0x03d6, %r22
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb0412b4d  ! 314: ADDC_I	addc 	%r4, 0x0b4d, %r24
	.word 0xb530a001  ! 314: SRL_I	srl 	%r2, 0x0001, %r26
	.word 0xae09000e  ! 314: AND_R	and 	%r4, %r14, %r23
	.word 0xaa9160f4  ! 314: ORcc_I	orcc 	%r5, 0x00f4, %r21
	.word 0xae08800a  ! 314: AND_R	and 	%r2, %r10, %r23
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	setx  0xb19fe0f926c54c07, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,8)
	.word 0xee508000  ! 318: LDSH_R	ldsh	[%r2 + %r0], %r23
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xb3c44000  ! 320: JMPL_R	jmpl	%r17 + %r0, %r25
	.word 0xb808ee84  ! 323: AND_I	and 	%r3, 0x0e84, %r28
	.word 0xb2416f15  ! 325: ADDC_I	addc 	%r5, 0x0f15, %r25
	.word 0xb211000c  ! 325: OR_R	or 	%r4, %r12, %r25
	.word 0xa8b961e9  ! 325: XNORcc_I	xnorcc 	%r5, 0x01e9, %r20
	.word 0xbab1800c  ! 325: ORNcc_R	orncc 	%r6, %r12, %r29
	.word 0xa841400a  ! 326: ADDC_R	addc 	%r5, %r10, %r20
	.word 0xb499400e  ! 326: XORcc_R	xorcc 	%r5, %r14, %r26
	.word 0xbd31400c  ! 326: SRL_R	srl 	%r5, %r12, %r30
	.word 0xb2b1800e  ! 326: ORNcc_R	orncc 	%r6, %r14, %r25
	.word 0xb201c00d  ! 327: ADD_R	add 	%r7, %r13, %r25
	setx  0x1cfff915eb6949d3, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
	.word 0xb1c44040  ! 331: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xaf29000d  ! 333: SLL_R	sll 	%r4, %r13, %r23
thr0_ic_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_16), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xad64180f  ! 336: MOVcc_R	<illegal instruction>
	.word 0xb801c00c  ! 339: ADD_R	add 	%r7, %r12, %r28
	setx  0x8c3fbb97038043df, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 342: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xbaf1000c  ! 343: UDIVcc_R	udivcc 	%r4, %r12, %r29
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x31
	.word 0xb21168fa  ! 346: OR_I	or 	%r5, 0x08fa, %r25
	.word 0xba8a000e  ! 346: ANDcc_R	andcc 	%r8, %r14, %r29
	.word 0xb228c00b  ! 346: ANDN_R	andn 	%r3, %r11, %r25
	.word 0xb009000f  ! 346: AND_R	and 	%r4, %r15, %r24
	.word 0xb131c00a  ! 347: SRL_R	srl 	%r7, %r10, %r24
	setx  0x990f4ecfd5177aa6, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xec28e5e6  ! 349: STB_I	stb	%r22, [%r3 + 0x05e6]
	.word 0xf430800d  ! 349: STH_R	sth	%r26, [%r2 + %r13]
	.word 0xf8312306  ! 349: STH_I	sth	%r28, [%r4 + 0x0306]
	.word 0xf029289f  ! 349: STB_I	stb	%r24, [%r4 + 0x089f]
	.word 0xea716573  ! 349: STX_I	stx	%r21, [%r5 + 0x0573]
	.word 0xe871e861  ! 349: STX_I	stx	%r20, [%r7 + 0x0861]
	.word 0xf8222c80  ! 349: STW_I	stw	%r28, [%r8 + 0x0c80]
	.word 0xfc322e73  ! 349: STH_I	sth	%r30, [%r8 + 0x0e73]
	.word 0xf672000a  ! 349: STX_R	stx	%r27, [%r8 + %r10]
	.word 0xbbc44000  ! 350: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xe87161af  ! 352: STX_I	stx	%r20, [%r5 + 0x01af]
thr0_ic_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_17), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xb031e5ad  ! 355: SUBC_I	orn 	%r7, 0x05ad, %r24
	.word 0xab39800c  ! 357: SRA_R	sra 	%r6, %r12, %r21
	.word 0xae20a964  ! 359: SUB_I	sub 	%r2, 0x0964, %r23
	.word 0xae28c00b  ! 361: ANDN_R	andn 	%r3, %r11, %r23
	.word 0xb7397001  ! 363: SRAX_I	srax	%r5, 0x0001, %r27
	.word 0xb179c40c  ! 365: MOVR_R	move	%r7, %r12, %r24
	.word 0xac9a2415  ! 367: XORcc_I	xorcc 	%r8, 0x0415, %r22
	setx  0xfcbfbcb4277f0e4a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,70)
	.word 0xec1a0000  ! 371: LDD_R	ldd	[%r8 + %r0], %r22
	.word 0xbbc44000  ! 373: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xa939e001  ! 376: SRA_I	sra 	%r7, 0x0001, %r20
	.word 0xac28800d  ! 378: ANDN_R	andn 	%r2, %r13, %r22
	.word 0xac38ede1  ! 378: XNOR_I	xnor 	%r3, 0x0de1, %r22
	.word 0xb738a001  ! 378: SRA_I	sra 	%r2, 0x0001, %r27
	.word 0xba80e088  ! 379: ADDcc_I	addcc 	%r3, 0x0088, %r29
	.word 0xac89e601  ! 379: ANDcc_I	andcc 	%r7, 0x0601, %r22
	.word 0xba99800f  ! 379: XORcc_R	xorcc 	%r6, %r15, %r29
	.word 0xac8126d2  ! 379: ADDcc_I	addcc 	%r4, 0x06d2, %r22
	.word 0xac38800a  ! 381: XNOR_R	xnor 	%r2, %r10, %r22
	setx  0xd83f40c5d43c3148, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb9c44000  ! 384: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xba70c00b  ! 385: UDIV_R	udiv 	%r3, %r11, %r29
	setx  0x774fd2e86bb58075, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,55)
	.word 0xfa58c000  ! 389: LDX_R	ldx	[%r3 + %r0], %r29
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xabc44040  ! 391: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_18), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xba20e695  ! 394: SUB_I	sub 	%r3, 0x0695, %r29
	.word 0xb031a446  ! 397: ORN_I	orn 	%r6, 0x0446, %r24
	setx  0x366f6d82bc416ea3, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xb1c44000  ! 400: JMPL_R	jmpl	%r17 + %r0, %r24
	.word 0xb2f8eeec  ! 401: SDIVcc_I	sdivcc 	%r3, 0x0eec, %r25
	.word 0xbab8e4bf  ! 403: XNORcc_I	xnorcc 	%r3, 0x04bf, %r29
	setx  0x80ffead81da83f8f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x40, %r19
	.word 0xf629000c  ! 405: STB_R	stb	%r27, [%r4 + %r12]
	.word 0xee20a6c9  ! 405: STW_I	stw	%r23, [%r2 + 0x06c9]
	.word 0xf870c00a  ! 405: STX_R	stx	%r28, [%r3 + %r10]
	.word 0xf232239c  ! 405: STH_I	sth	%r25, [%r8 + 0x039c]
	.word 0xf671e9a6  ! 405: STX_I	stx	%r27, [%r7 + 0x09a6]
	.word 0xea20c00a  ! 405: STW_R	stw	%r21, [%r3 + %r10]
	.word 0xfc70800c  ! 405: STX_R	stx	%r30, [%r2 + %r12]
	.word 0xfc32000b  ! 405: STH_R	sth	%r30, [%r8 + %r11]
	.word 0xee21a321  ! 405: STW_I	stw	%r23, [%r6 + 0x0321]
	.word 0xf27227ee  ! 405: STX_I	stx	%r25, [%r8 + 0x07ee]
	.word 0xf831000a  ! 405: STH_R	sth	%r28, [%r4 + %r10]
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xb9c44000  ! 406: JMPL_R	jmpl	%r17 + %r0, %r28
thr0_ic_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_19), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xec71ae9f  ! 409: STX_I	stx	%r22, [%r6 + 0x0e9f]
	.word 0xb6b92aee  ! 412: XNORcc_I	xnorcc 	%r4, 0x0aee, %r27
	.word 0xb220e7ad  ! 414: SUB_I	sub 	%r3, 0x07ad, %r25
	.word 0xac30c00a  ! 416: ORN_R	orn 	%r3, %r10, %r22
	.word 0xaf79c40e  ! 418: MOVR_R	move	%r7, %r14, %r23
	.word 0xaaa1eccf  ! 420: SUBcc_I	subcc 	%r7, 0x0ccf, %r21
	.word 0xb330900a  ! 422: SRLX_R	srlx	%r2, %r10, %r25
	.word 0xa890ef56  ! 424: ORcc_I	orcc 	%r3, 0x0f56, %r20
	.word 0xb0b9c00d  ! 427: XNORcc_R	xnorcc 	%r7, %r13, %r24
	setx  0x725fb2e45906c08f, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xafc44000  ! 430: JMPL_R	jmpl	%r17 + %r0, %r23
	.word 0xbb20c00b  ! 431: MULScc_R	mulscc 	%r3, %r11, %r29
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xaa1920cf  ! 434: XOR_I	xor 	%r4, 0x00cf, %r21
	.word 0xba91800e  ! 434: ORcc_R	orcc 	%r6, %r14, %r29
	.word 0xac39c00b  ! 434: XNOR_R	xnor 	%r7, %r11, %r22
	.word 0xae31ecd7  ! 434: ORN_I	orn 	%r7, 0x0cd7, %r23
	.word 0xba39a5d2  ! 436: XNOR_I	xnor 	%r6, 0x05d2, %r29
	setx  0xe1efda55e38aac92, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb9c44000  ! 439: JMPL_R	jmpl	%r17 + %r0, %r28
	.word 0xb049c00e  ! 440: MULX_R	mulx 	%r7, %r14, %r24
	.word 0xaec0a54a  ! 442: ADDCcc_I	addccc 	%r2, 0x054a, %r23
	.word 0xbcb2000d  ! 442: ORNcc_R	orncc 	%r8, %r13, %r30
	.word 0xb731d00b  ! 442: SRLX_R	srlx	%r7, %r11, %r27
	.word 0xaaa8c00c  ! 444: ANDNcc_R	andncc 	%r3, %r12, %r21
	setx  0xa60f6a4151557036, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xb7c44000  ! 447: JMPL_R	jmpl	%r17 + %r0, %r27
	.word 0xac51e021  ! 448: UMUL_I	umul 	%r7, 0x0021, %r22
	rd      %pc, %r19
	add     %r19, 0x28, %r19
	setx    last_l1c, %r16, %r31
	jmpl 	  %r31, %r0
	nop
	.word 0xb139000b  ! 452: SRA_R	sra 	%r4, %r11, %r24
	setx  0x79af47aeea6bead0, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
	.word 0xbbc44000  ! 455: JMPL_R	jmpl	%r17 + %r0, %r29
	.word 0xb27220d2  ! 456: UDIV_I	udiv 	%r8, 0x00d2, %r25
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	.word 0xbc39000b  ! 459: XNOR_R	xnor 	%r4, %r11, %r30
	.word 0xae38ab79  ! 459: XNOR_I	xnor 	%r2, 0x0b79, %r23
	.word 0xad31b001  ! 459: SRLX_I	srlx	%r6, 0x0001, %r22
	rd      %pc, %r19
	add     %r19, 0xc, %r19
	ta 0x32
	setx  0x460f4668a25e61ce, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,15)
	.word 0xec018000  ! 463: LDUW_R	lduw	[%r6 + %r0], %r22
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xadc44000  ! 465: JMPL_R	jmpl	%r17 + %r0, %r22
thr0_ic_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_20), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xba00808c
	setx  0x1c6f6c394b0d923a, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,9)
	.word 0xec118000  ! 471: LDUH_R	lduh	[%r6 + %r0], %r22
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xb7c44000  ! 473: JMPL_R	jmpl	%r17 + %r0, %r27
thr0_ic_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_21), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xba196324  ! 476: XOR_I	xor 	%r5, 0x0324, %r29
	setx  0x4d8f052733498366, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,54)
	.word 0xfa014000  ! 480: LDUW_R	lduw	[%r5 + %r0], %r29
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xb7c44040  ! 482: JMPL_R	jmpl	%r17 + %r0, %r27
thr0_ic_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_22), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xbaba000f  ! 485: XNORcc_R	xnorcc 	%r8, %r15, %r29
	setx  0x1d3f19cbb3f0b760, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x14, %r19
.align 0x8
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,56)
	.word 0xfa520000  ! 489: LDSH_R	ldsh	[%r8 + %r0], %r29
	.word 0xabc44040  ! 491: JMPL_R	jmpl	%r17 + %r0, %r21
thr0_ic_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_23), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xb039800a  ! 494: XNOR_R	xnor 	%r6, %r10, %r24
	.word 0xae38a5b3  ! 497: XNOR_I	xnor 	%r2, 0x05b3, %r23
	setx  0x1a2f088b1ceb6197, %r16, %r17
	rd      %pc, %r19
	add     %r19, 0x10, %r19
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
	ta    T_GOOD_TRAP

.data
	.word  0x4ae2b91c,0xbed14153,0xcdc1d996,0xb6f3e3df
	.word  0xaa1b5aa8,0x54266c9e,0xd1b1971e,0x0e77bc1b
	.word  0x9b9d6ffd,0x5a449399,0xfbc18bbd,0x2984569b
	.word  0x0a9041a0,0x8a4c86be,0x76e2a7dd,0x1d0ab725
	.word  0xda25e432,0x54300771,0x552ec89e,0xc8bbf71a
	.word  0xe5a3431e,0xb78d4fd3,0x886c8de0,0xef269637
	.word  0x108f5294,0x37234234,0x047b584f,0xf2f001e8
	.word  0x1af2377b,0x17746379,0xa6289de4,0x75870caf
	.word  0x865b0e14,0x86d0f97b,0xaf1a6efa,0x8c5eb311
	.word  0x919cf2d7,0xb60889b5,0xe30e1f4f,0xf56d9730
	.word  0xba868ac2,0xb3544f19,0x3aa79dfe,0xdb167427
	.word  0xa1b972c9,0x084bec7f,0xae9dee12,0x8590a973
	.word  0x7d0f12fb,0x0be3c27a,0x8b8bcd3b,0x466c843c
	.word  0x531b2e4a,0x2d5e9d79,0xf6a75b85,0x6a4614d3
	.word  0xb1a5f0a8,0xec8ea8cf,0xe22d5fa7,0xb79f97d7
	.word  0x17f238ce,0x1c7aebc5,0x8dcebe06,0xca486054
	.word  0xd93d7543,0x1392acf3,0xed45d10c,0x317e1828
	.word  0xa6a06e80,0xf5dd7f12,0xee5ca00f,0x708fa5f2
	.word  0xc4093e53,0x5d184577,0x4008fe01,0x1506cc92
	.word  0xf8bd201c,0xe81356bd,0x3f1bd428,0x9a21e6b4
	.word  0xe0848abb,0xb6aa93a0,0x2eb287bc,0x8ca05009
	.word  0x00016568,0x586235af,0xb9782625,0xf4d7672e
	.word  0x26cf82bb,0x2b91835d,0x4b94cf9f,0xecf9c511
	.word  0x8be28771,0xb1030ecb,0x69f96bdf,0xc283820a
	.word  0x5e315f48,0x552bcef5,0xa37e6425,0x438b7bae
	.word  0xbea67279,0x31cfdc5e,0xfe039b7f,0x336e90a9
	.word  0xf369a655,0x07b524ef,0x8148d05b,0x3abfa3b3
	.word  0xcdaddc49,0x404d4c0f,0x86c5b386,0xbd666331
	.word  0x823e99e8,0x4d013ced,0x443ae758,0x89f3ae10
	.word  0x70f1d5f5,0xec3ed1a0,0xe6f81234,0xddc71872
	.word  0x306664ed,0xf549183b,0x20bfd274,0xd7e318d1
	.word  0x3118f301,0xed1f5313,0x357cc339,0xc696d8e3
	.word  0xfaeb2a87,0x98f94fe7,0x82f45404,0xac76adbe
	.word  0xfc93d06c,0x878b9af5,0x45cdd366,0xb2a93c60
	.word  0xc36c0cb9,0x89f6e194,0x8c9d92e8,0xf1366a08
	.word  0xabafb2a1,0x6fd7f72e,0x0ffefd40,0x30aa4a1d
	.word  0xe998420e,0xf89d5cb4,0x566ff57c,0xa629f6e3
	.word  0x9bb5fb6c,0x43cff1c6,0xa58a304b,0x23e90fa4
	.word  0x38ba4a22,0xd5652697,0x93e882f8,0x15269a6b
	.word  0x961260bb,0xd0b7a377,0x384dadfc,0x479653bf
	.word  0xd085e411,0xc43b41a6,0xb551fd3d,0x5aa8d003
	.word  0x63767b53,0x948576b2,0x9fb48af8,0x3fc40375
	.word  0xfb771fc9,0x2a58133a,0x3b4673a0,0x4653d3f3
	.word  0x92733a42,0x7e6210db,0x363ae1c9,0x362172c5
	.word  0x4e640326,0x38a62a72,0xa00c2915,0xf296d1d9
	.word  0x17e9b35c,0x2377bf70,0x04c7ffc8,0xbb99d91b
	.word  0xa8997cb4,0x8e9eb957,0x705c4723,0x87f5b5ca
	.word  0x7389c844,0xb91953ae,0xca2e47ee,0xc8a33a45
	.word  0x3b6c8a3c,0x6ec8a515,0xee2d2e9b,0x9cdfc7c8
	.word  0x7b958587,0xe08f4672,0x0a027c16,0x3ee6aa03
	.word  0x047c04ae,0xb37de36f,0x7e306226,0xe39ab52f
	.word  0xef5a6eb7,0x1053189c,0x5786d779,0x20ca0005
	.word  0xae064627,0x23e2638f,0xf9904b56,0x2cb26fc0
	.word  0xa5791abc,0xea2413de,0xda6ac8ad,0xb220a65a
	.word  0xb0d4b0dd,0x20717933,0xc51d233c,0xa4c7e914
	.word  0xc8e3052f,0xdbdbd8ff,0xfb6048bc,0xd0a6665a
	.word  0xff428f93,0x122237c9,0xa87ab35b,0xb6486c66
	.word  0xba135359,0x280d1feb,0x5747f0d4,0x8a4ccac8
	.word  0x6deae6b5,0x6251e441,0x61f743df,0xa25d989b
	.word  0x356f9252,0x24522fb9,0x6b079e04,0x8c516137
	.word  0x2d123fbf,0x7760f61b,0x5bacaee6,0x303d26b3
	.word  0xd424017b,0x0d3c9334,0x0b122c58,0x843deb93
	.word  0xed359ea7,0xfe60ff07,0x5070625a,0x00a3e9e8
	.word  0x56f57936,0x5f3a420c,0xe1d041ba,0x381a8cf4
	.word  0x1c178926,0x5c3c5086,0x5d1e45d8,0x0470913b
	.word  0xf98dca18,0xbe677e06,0x123e8cd5,0xe1974a0b
	.word  0xbc101e23,0xdf8d65ae,0xad64e2b0,0x4bc773aa
	.word  0x91d068c7,0xf31d1747,0x9b88232c,0x6d98a79a
	.word  0x7c29d6ff,0x219cdbe0,0x6a6c8888,0x25aa66a6
	.word  0x78435ce3,0x62436b4a,0x99086575,0x4cf39549
	.word  0xd723bf9e,0x3a8b1333,0xe2af24e6,0x291b5f25
	.word  0x91f9c9bc,0xeb5f278e,0x061fd9f5,0x1523c050
	.word  0x8781cf03,0xa3faebe8,0x2bf59655,0x07ff25b1
	.word  0x9f8bb72c,0x3ead3e7d,0xccd1aff9,0x5ab65a81
	.word  0xe15d9d05,0x180dfefd,0xf542202e,0x87e2305f
	.word  0x5e4f7f64,0xf7b3be70,0x70e0f6e5,0x09f05d9d
	.word  0x25b1b87c,0xcfdcc274,0x967881a6,0x933c11da
	.word  0x940cdb7f,0x0a2d9c0b,0x0b1cc609,0x0be8fc73
	.word  0x1ecdbe67,0xb595fde6,0xc092386f,0x88c9c3cd
	.word  0xd1c389ac,0xe195b6ab,0x99b52c6d,0x719fd73f
	.word  0xf9f57ffc,0x05c66e9c,0x02fb12cd,0xef231e77
	.word  0x680d0573,0xb35ce9f4,0xc53cce41,0xf0d32c21
	.word  0x8d26e667,0x3ef7f6c7,0x4c157621,0x17750460
	.word  0x6bd1c7b5,0xd205a938,0xc9aa13a4,0x72471a1b
	.word  0x29f6a289,0x29a26840,0x0f2fa06a,0x0d061c66
	.word  0x790c0dcc,0x358b0796,0x3d7bb919,0xb85735d9
	.word  0x2b982e12,0x826dc2d3,0x9e54516a,0x8d68ab45
	.word  0x4d69c825,0xbbaf029f,0xc890852c,0x3eae0fb5
	.word  0xf19f1c01,0xc93cd8f2,0xbe9f704f,0x2c9dfe3f
	.word  0x7ec6a809,0x14710800,0xee4d6f88,0x36bb4391
	.word  0x955e10c3,0xf988643e,0xb550f4b4,0x19141746
	.word  0x2aabf514,0xb024706a,0xa3acbec5,0x4cd29999
	.word  0xecbff873,0x5c6a937c,0xbf46f640,0xec8a7f39
	.word  0xed108972,0xe1bb3b83,0x8b8b13b2,0x26278e72
	.word  0x6049e55a,0xeba4946c,0x9a296567,0xe9d46e46
	.word  0x7acdd6a3,0xe2c9706f,0x0bdb7ac2,0x96f08a46
	.word  0xf962211e,0x08b037f7,0x234d2b27,0x39a9283f
	.word  0x222ab039,0x4d59611d,0x9fcb9b15,0x637a629a
	.word  0x9c69542f,0xf42a0730,0x088524e0,0xbbd024cd
	.word  0xaba9c5a4,0x076c8731,0x1c0573dc,0xf051b083
	.word  0x4caf5d42,0x6d540d68,0x8b3d761e,0xf5dd1fb9
	.word  0xf71a5522,0xf09108a6,0x61fd57e6,0x250dc41b
	.word  0x489f58f8,0xd64c6091,0x4fdf7c87,0x97100689
	.word  0xedb2f46c,0x3e0cbfbe,0x728e1e14,0xf2ee94d7
	.word  0x1c657650,0x99700e83,0x8cf84c0b,0x0a24a64a
	.word  0xbe982ff5,0xe1e8db97,0x9d7228ef,0xb5a01771
	.word  0x3f85d421,0x21bc81e2,0xa92d0fc1,0x1ccda221
	.word  0x0e638802,0xbbcd252a,0x26def2e7,0xaba5dec4
	.word  0x4272505e,0xcf25963f,0xab0445a2,0x82288483
	.word  0x53d5f178,0xa864b554,0x375a0280,0x53b03a52
	.word  0x1fa0fa78,0xae05144b,0xc3668c9e,0xfa4d5830
	.word  0x0b86948e,0x2ac28576,0x34fdc4a3,0x31b46f6e
	.word  0x86dc8b65,0x7b754b94,0xd2d56ad9,0x6de8d208
	.word  0xe4edfc4d,0x2f010c84,0x8bfe1208,0xf9777486
	.word  0xc87e6ec9,0xdf1ea89f,0x5f5b6af8,0xdad50e5d
	.word  0x944a64f1,0x8bae5e27,0xc63e61eb,0x31dd771b
	.word  0x7fcba1ac,0x226d7fa4,0xa9aa0c55,0x3ea56b8a
	.word  0x9aa5d833,0xfdebba02,0x63446995,0xdab426a2
	.word  0xd364d836,0x8cc1dce7,0x6c75c6f6,0x40288996
	.word  0xaa5ff745,0x505aa029,0x57002d6e,0xbaabb49e
	.word  0x5b3c9c27,0x78d6983a,0x9c010387,0xce600173
	.word  0xb703f629,0x8d499d68,0x0c1eb775,0x12f883a0
	.word  0xb73c9e21,0x352bbf8b,0x070cf1f9,0x7170c038
	.word  0x7823eb70,0xe4a44596,0x2c133b61,0xd77bba5d
	.word  0xb6fdfd6f,0x8e519bcf,0x96e2b9af,0xc2b8acf2
	.word  0xa7447dab,0xd06c7cbe,0x5f9b8e62,0xa2730684
	.word  0x860e0f27,0x0a9e4b2a,0xd9ba4957,0x8399ddda
	.word  0xeb76fb85,0x91e812f4,0x0e1254af,0x3b35db6c
	.word  0x2f4ee3b8,0x8ad0764e,0xf3a3430b,0x0890d8a6
	.word  0x7ccf7ed3,0x6806d325,0x3a5b5415,0x8220f074
	.word  0x4826b900,0x22f6db09,0x074fcbf6,0xf705ed4d
	.word  0xa5297f88,0x29c3de87,0x23a72a88,0xaa8839d5
	.word  0xff7481f3,0xd17c9ec1,0x793b05c9,0x29c82251
	.word  0xaf708812,0x48ae34e4,0x862e503f,0x971dc227
	.word  0x2f6e56a9,0x207a9ce5,0xa871d5d4,0x2266b803
	.word  0xab39434b,0xc7d03a3d,0x20edebd9,0x62123027
	.word  0xbd6d8f39,0xef2a4e6b,0x8d7ffcc6,0x0d350f6f
	.word  0xadda5609,0xf756bb23,0x8be030bd,0x3f007cff
	.word  0xd236ab0b,0x86079300,0x6e834d67,0x260e6fbf
	.word  0xb84d750f,0xa3719f34,0xd1d78256,0xfaa1e8d4
	.word  0x77fd075c,0x59235008,0xad2e8949,0x3d3767b5
	.word  0x36b374b3,0xa1487cf3,0x2c8d62b2,0xffe63c89
	.word  0xae2fa841,0x53b99d2b,0xad03536b,0x9ca29144
	.word  0x12c2777f,0x375f39c2,0x4ca71cf6,0x2fc68629
	.word  0x0b56425f,0x14b5dadd,0x52280bc8,0x492720a8
	.word  0xf76b295c,0x4a9f84cc,0xb8c32742,0xaf6bb20f
	.word  0xfe9cf9bd,0xaa79a603,0x96f42321,0x2aa0f35d
	.word  0x8f596a72,0x4ed3ace1,0x8cb57cd8,0xea491f59
	.word  0xe1cb6ead,0x87033025,0x671acd41,0x27fbe554
	.word  0x48b3af6c,0xf4fb4029,0xeb98b82a,0xf7935426
	.word  0xd57f9cbf,0x49e1b8ed,0x303f8e27,0x0838e23c
	.word  0x3056e124,0x84de238e,0x67217608,0x21f153fa
	.word  0xaf5a201e,0x02d16f28,0xd9df3b65,0x832d2d8d
	.word  0x7a1d09f4,0xd9447188,0xf4b40a37,0x7493bf4b
	.word  0xf77059a7,0xae5a0343,0xf67cacc7,0x3d687117
	.word  0xe5f70a26,0xc9f4aa82,0x2c877bb1,0x256f2e0e
	.word  0x6192352f,0xbe6d69ca,0x68cbe26e,0x0e675f8c
	.word  0x1148cad0,0xf2cba1a9,0x4f2ee01c,0x4ea25f0c
	.word  0xfe7a8ae8,0x3a07ed5b,0x44fb7082,0x6fe6a597
	.word  0xf2cfa4df,0xa1c1b7e0,0x12066eab,0x569786e7
	.word  0x8bdd995f,0x3236450d,0xee8d20d1,0x8bc17733
	.word  0x24589110,0x7c15de4d,0xd55f4a09,0x438745df
	.word  0xac5b8e45,0xbc57ce29,0xabf02da0,0xa7887aff
	.word  0xe2f6928b,0x291053b0,0xd1913665,0xf3a19f62
	.word  0xa5b353fd,0x56fa1be8,0xd8ab156e,0x1aad21a6
	.word  0x07fb0212,0x49495fed,0x5a5f6459,0xd80f5d31
	.word  0xc1255254,0x50018a7c,0x6d5fd4aa,0x7f78c152
	.word  0x130fb833,0x6a08f005,0x4d9a9cd7,0x5042fdd3
	.word  0x5319577b,0xd92721c2,0x5c6fc8cb,0xe376fa6e
	.word  0x31a0bf3a,0x50bac358,0xe4055c00,0xb1c320b3
	.word  0x23630d6b,0xa3ff9179,0x5eecee01,0xcb31a4f4
	.word  0x06844c19,0x8fac1c09,0xd3f6f8a1,0x202c8729
	.word  0x9f237d35,0x0404eec2,0xaebc2792,0xbfd357f5
	.word  0x6ab91cd5,0xd6d6fb9d,0x77c2d82b,0xad1becca
	.word  0x0fbec4c0,0xa30d68c8,0x45606404,0xdba14c39
	.word  0xb49cf6b8,0xfae24ff9,0x7cfc0438,0x160cfd5c
	.word  0xd18370b0,0xc7a89e70,0x7eb98b8a,0x674c432a
	.word  0xef230a4e,0x83406465,0xe3a4ffa2,0x756dadca
	.word  0x9e006522,0xa5f4386b,0x7dd330bc,0xb7d5ed5b
	.word  0x6df238cb,0xda501a2e,0xa639d6c3,0x9796950f
	.word  0x234d82d0,0xa978e1e4,0x56e221a0,0x02389c33
	.word  0x5e70c3a2,0x0cf8a1f1,0x751b6bf9,0x142dbf56
	.word  0x41f4fcc9,0xaace2829,0x7490c5ca,0xe9aa4ce5
	.word  0xa2a904fd,0x3c9b14a6,0xa726a797,0xe0a09712
	.word  0x440ff302,0x20d38f97,0x9d27e14c,0xe945b4d2
	.word  0xb48c20d5,0x679c662b,0xbfcb03b7,0xb1f7a428
	.word  0x58c4759b,0x14813cb5,0x85d415f4,0x90b9243e
	.word  0xf197854e,0x8f4dd9f4,0xae92f880,0xe6c84101
	.word  0x758fdfa9,0x988860f4,0xa5810bc6,0x03199240
	.word  0xf04e65e8,0x8a818db2,0x4d4ef790,0x46a896b8
	.word  0xdae1f639,0xfa7acc90,0x8e8b2004,0xfa90e85b
	.word  0xf4c48a99,0xd825fb2f,0x1157a013,0x937b29da
	.word  0x0dc787ad,0x207d5f8e,0x382c274d,0xb07f3dc1
	.word  0x7cb55a45,0xf44f8000,0xe4eee69e,0xe64d9525
	.word  0x8a0a65aa,0x3ad6eaf3,0xbf6eda54,0x50e81c7d
	.word  0xbe6b91bd,0xcbaad399,0xb6f76be1,0x43e5a1cd
	.word  0xf79b8497,0xbfa42390,0x5700ae7e,0x54b1f2d5
	.word  0x5625a93e,0xbd385602,0x2a52dcc2,0xf629674a
	.word  0x99db5a6d,0x612283b3,0x2d1d7db9,0x79795045
	.word  0x3bc717e3,0x7616a163,0x3e54d799,0x1bc73a44
	.word  0xd7b9c9c4,0x011c50d9,0x37babbdd,0xcf4227b3
	.word  0xbc51f425,0x1ed145fd,0xc97de6c4,0xee268b80
	.word  0xa7d24833,0xa52d155c,0x7ff7258b,0xd2545115
	.word  0x7a16b1f6,0x197b5362,0xb0b436c2,0x92088934
	.word  0x30edae15,0x59b90308,0x671ac2a5,0xb00eecfb
	.word  0x13f2b886,0x7f673645,0x0f28f691,0xf4c1e07a
	.word  0xc2d915e4,0xd1f6d3a5,0x3f4a2164,0x72e97868
	.word  0x7023735e,0xa05785c1,0x490e1346,0x7d752927
	.word  0xede113e8,0x0deddb4e,0x090d3a1a,0xb6c31563
	.word  0x841445b5,0xbd583d7f,0xe65e8396,0xdbd61049
	.word  0xffa800a8,0x279e5c5a,0x86caf3b0,0x680d24bc
	.word  0xde433372,0x629f2a79,0x403895d5,0xf7245fc1
	.word  0x2bd72688,0x49bbb284,0x55274463,0xe5310ba9
	.word  0x04fe9766,0x1d60ecec,0x5e341e3d,0x000c7250
	.word  0x8a73d7d0,0x766ffbc1,0xe67d02b2,0x2f63c89f
	.word  0x3bcf034f,0xc03182f4,0xc4bb792c,0x646fca2e
	.word  0xdbba7d41,0x43bf7c43,0xfb7697be,0xfbe6b662
	.word  0x603110b8,0x468cf0d8,0x48a4cf45,0x142c6d77
	.word  0x6c40b0e7,0xcc6a7af0,0x750d54d0,0x1f9bab65
	.word  0xd4624833,0x4a3be3f7,0x545994b5,0x6388e188
	.word  0x530827c6,0x0e3755e3,0x772a8849,0x91d7de7c
	.word  0x5cf5a3f7,0x87184d4c,0x933dd45a,0x6e2cc4ae
	.word  0xff2f2a42,0x921125d5,0xe65fdacd,0xc8d50587
	.word  0xede5b30e,0x86b6113c,0x693c1f96,0xf07592bc
	.word  0x5b6c3f97,0x5f810762,0x3245447b,0x510f1401
	.word  0x0aecf854,0xff111337,0xbb6f51f1,0x8e1409ca
	.word  0x6094b09e,0xdd63435b,0x445a2021,0xe2fc9e5a
	.word  0xb38fe496,0xcd2e1553,0x54a21984,0xdcc1b678
	.word  0xc2b8e2da,0xb88771d7,0xc8aae360,0xbdd0550c
	.word  0xdb1277e8,0x9b6b9dad,0xb6c39f59,0xda44556c
	.word  0xd3e9424f,0xe4ff1b08,0x426cb1db,0x96e22536
	.word  0x087b9015,0xaf8f4ac6,0x9c131fe8,0xc29920a5
	.word  0x2f49245b,0x65fa270e,0xdc1d7265,0xbf67337c
	.word  0xc2c14633,0x4e952b3a,0x325b805a,0xcf522cd5
	.word  0xf75fa4d7,0x5191bada,0x9c815fad,0xbfb63ec7
	.word  0xcc957065,0x9a50b974,0x50949318,0x4ef24838
	.word  0x863f1be1,0x01b5582e,0x52f36020,0xee17f8a9
	.word  0x928ebced,0x841eb9e4,0xaadbd317,0x86f09820
	.word  0x3b103d86,0xf54cef84,0xd5ee862f,0xc560d526
	.word  0x49f84595,0xb2005b36,0x609a0cd3,0x3d499c16
	.word  0xf905302e,0xe062aeeb,0xf8787ef9,0x838ef411
	.word  0xafa325d0,0x30f6ec4f,0xc1702307,0xc48a219c
	.word  0x8f5dbe4d,0x733aa1f0,0xb1004fd7,0x7b4e1571
	.word  0x918fa9b7,0x26e75138,0x6fae89cd,0xb9320359
	.word  0x9e91cf55,0x4e925805,0x3a3a311a,0x71a776c6
	.word  0x18adc4f4,0x90118950,0xba4e38da,0xa5968292
	.word  0x689bfc4c,0x97e6664e,0x2a473604,0x9238faf5
	.word  0xa46c8924,0x13e1ab46,0x50ad04bc,0x572085c4
	.word  0x3b23dc68,0xae9c4f9e,0x10e9500f,0x9a8e7531
	.word  0xf48624cf,0x85a4b7a8,0xfd89b704,0x6ec37e87
	.word  0x9c6e5b5a,0xb44d5957,0x77caf346,0x9331f04e
	.word  0x0d7a3810,0xc0e1f8d1,0xfeedd181,0x32328f36
	.word  0x3d518080,0x2b23f8c2,0x3b36cf5d,0xb93e6065
	.word  0xfcf5f011,0xb33e7e94,0x79117b69,0x6520bfec
	.word  0x6db206e4,0x589508ec,0x88bbceec,0x595da61a
	.word  0x4e1d0248,0x65584531,0x99bf8caa,0xa544b055





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
	.word 0xf259a050  ! 1: LDX_I	ldx	[%r6 + 0x0050], %r25
	.word 0xac78800f  ! 2: SDIV_R	sdiv 	%r2, %r15, %r22
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
!!#   IJ_bind_thread_group("diag.j", 73, th_lop, 0x4);
!!#   IJ_bind_thread_group("diag.j", 74, th_evnt, 0x3);
!!#   IJ_bind_thread_group("diag.j", 75, th_intr, 0x8);
!!#   IJ_bind_thread_group("diag.j", 76, th_all, 0xf);
!!# 
!!#   IJ_copy_ropr ("diag.j", 78, Ro_jmpl, ijdefault);
!!#   IJ_set_ropr_bits ("diag.j", 79, Ro_jmpl, 0x1fe0, "13'b00000r000000"); 
!!#   IJ_set_ropr_fld ("diag.j", 80, Ro_jmpl, Ft_Rs1, "{17}");
!!#   IJ_set_ropr_fld ("diag.j", 81, Ro_jmpl, Ft_Rs2, "{0}");  
!!# 
!!#   IJ_th_fork_group ("diag.j", 83, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 87, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 16; i < 32; i++) {
!!#      IJ_printf ("diag.j", 89, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 93, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 10; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 95, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Put an unaligned address into r10
!!#   IJ_set_rvar ("diag.j", 99, reg_rand_init, "64'h0000000000000rr1");
!!#   IJ_printf ("diag.j", 100, th_all, "\tsetx  0x%016llrx, %%r16, %%r9\n", reg_rand_init);
!!# 
!!#   //Initialize Rs1
!!#   for (i = 2; i < 9; i++) {
!!#      IJ_printf ("diag.j", 104, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 107, th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 108, th_all, 4);
!!#   IJ_printf ("diag.j", 109, th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 111, pc_va_oor, "64'hrrrfrrrrrrrrrrrr");
!!# 
!!#   IJ_set_default_rule_wt_rvar ("diag.j", 113,"{10}");
!!#   IJ_set_rvar ("diag.j", 114, low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 115, high_wt, "{40}");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_printf ("diag.j", 136, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 137, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 138, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 139, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 140, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 141, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 142, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 143, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 144, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 145, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 146, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 147, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 148, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 149, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 150, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 151, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 152, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 153, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 154, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 155, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 156, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 157, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 158, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 159, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 160, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 161, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 162, th_all, "	nop\n");
!!#   IJ_th_join ("diag.j", 163,0xf);
!!#   IJ_th_start ("diag.j", 164,Seq_Start, NULL, 2); 
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
!!#   IJ_printf ("diag.j", 179, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 180, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 181, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 182, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 183, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 184, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 185, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 186, th_all, "	nop\n");
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
!!#   IJ_printf ("diag.j", 202, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 204, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 205, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 207, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 208, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# last_sec: last_sec_lop %rvar  low_wt | last_sec_3 | last_sec_4 | last_sec_5 | last_sec_6 | last_sec_7
!!# ;
!!# 
!!# last_sec_lop: last_sec_0 | last_sec_1 | last_sec_2
!!# ;
!!# 
!!# last_sec_0:mMETAlast_0
!!# {
!!#    IJ_iseg_printf("diag.j", 287,ISEG, 0, th_evnt, "!last_sec_0\n");
!!#    IJ_iseg_printf("diag.j", 288,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 289,ISEG, 0, th_evnt, ".skip 0x1fe0\n");
!!#    IJ_iseg_printf("diag.j", 290,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 291,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 292,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 293,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 294,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 295,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# load_i 
!!# {
!!#    IJ_iseg_generate("diag.j", 299,ISEG, 0, th_evnt, $3);
!!# }
!!# mul_div_fpop_iseg 
!!# {
!!#    IJ_iseg_printf("diag.j", 303,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# last_sec_1:mMETAlast_1
!!# {
!!#    IJ_iseg_printf("diag.j", 309,ISEG, 0, th_evnt, "!last_sec_1\n");
!!#    IJ_iseg_printf("diag.j", 310,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 311,ISEG, 0, th_evnt, ".skip 0x1fe0\n");
!!#    IJ_iseg_printf("diag.j", 312,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 313,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 314,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 315,ISEG, 0, th_evnt, "\tnop\n");
!!# } st_irferr_unalgn_trpd alu_illinst_iseg alu_illinst_iseg mul_div_fpop_iseg 
!!# {
!!#    IJ_iseg_printf("diag.j", 318,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# last_sec_2:mMETAlast_2
!!# {
!!#    IJ_iseg_printf("diag.j", 324,ISEG, 0, th_evnt, "!last_sec_2\n");
!!#    IJ_iseg_printf("diag.j", 325,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 326,ISEG, 0, th_evnt, ".skip 0x1fe0\n");
!!#    IJ_iseg_printf("diag.j", 327,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 328,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 329,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 330,ISEG, 0, th_evnt, "\tnop\n");
!!#    IJ_iseg_printf("diag.j", 331,ISEG, 0, th_evnt, "\tnop\n");
!!# } lderr_iseg alu_illinst_iseg mul_div_fpop_iseg 
!!# {
!!#    IJ_iseg_printf("diag.j", 334,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //9 stores, with irf errors and stuff
!!# last_sec_3: mMETAlast_sec_3
!!# {
!!#    IJ_iseg_printf("diag.j", 341,ISEG, 0, th_evnt, "!last_sec_3\n");
!!#    IJ_iseg_printf("diag.j", 342,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 343,ISEG, 0, th_evnt, ".skip 0x1fd8\n");
!!#    IJ_iseg_printf("diag.j", 344,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 347,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, -1);;
!!# } st_irferr_unalgn_trpd st_trpd st_trpd icerr_alu_st_trpd 
!!# {
!!#    IJ_iseg_printf("diag.j", 350,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //8 stores with irf errors and stuff
!!# last_sec_4: mMETAlast_sec_4
!!# {
!!#    IJ_iseg_printf("diag.j", 357,ISEG, 0, th_evnt, "!last_sec_4\n");
!!#    IJ_iseg_printf("diag.j", 358,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 359,ISEG, 0, th_evnt, ".skip 0x1fdc\n");
!!#    IJ_iseg_printf("diag.j", 360,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 363,ISEG, 0, th_evnt, $3, $4, $5, $6, -1);;
!!# } st_irferr_unalgn_trpd st_trpd st_trpd icerr_alu_st_trpd
!!# {
!!#    IJ_iseg_printf("diag.j", 366,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //dcw2,stb9,trpf,icerr
!!# last_sec_5: mMETAlast_sec_5
!!# {
!!#    IJ_iseg_printf("diag.j", 373,ISEG, 0, th_evnt, "!last_sec_5\n");
!!#    IJ_iseg_printf("diag.j", 374,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 375,ISEG, 0, th_evnt, ".skip 0x1fd4\n");
!!#    IJ_iseg_printf("diag.j", 376,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 379,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, $8, $9, -1);;
!!# } lderr_iseg st_trpd icerr_alu_st_trpd 
!!# {
!!#    IJ_iseg_printf("diag.j", 382,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //ldmiss,icerr,trpf
!!# last_sec_6: mMETAlast_sec_6
!!# {
!!#    IJ_iseg_printf("diag.j", 389,ISEG, 0, th_evnt, "!last_sec_6\n");
!!#    IJ_iseg_printf("diag.j", 390,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 391,ISEG, 0, th_evnt, ".skip 0x1fd8\n");
!!#    IJ_iseg_printf("diag.j", 392,ISEG, 0, th_evnt, "last_l1c:\n");
!!# } store store store store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 395,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, $8, $9, -1);;
!!# } lderr_iseg icerr_alu_st_trpd 
!!# {
!!#    IJ_iseg_printf("diag.j", 398,ISEG, 0, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# //ldmiss,icerr,trpf
!!# last_sec_7: mMETAlast_sec_7
!!# {
!!#    IJ_iseg_printf("diag.j", 405,ISEG, 0, th_evnt, "!last_sec_7\n");
!!#    IJ_iseg_printf("diag.j", 406,ISEG, 0, th_evnt, ".global last_l1c\n");
!!#    IJ_iseg_printf("diag.j", 407,ISEG, 0, th_evnt, ".skip 0x1fc0\n");
!!#    IJ_iseg_printf("diag.j", 408,ISEG, 0, th_evnt, "last_l1c:\n");
!!#    IJ_iseg_printf("diag.j", 409,ISEG, 0, th_evnt, "\tsetx last_inst, %%r16, %%r31\n");
!!# } store store store store store store store 
!!# {
!!#    IJ_iseg_generate_va ("diag.j", 412,ISEG, 0, th_evnt, $3, $4, $5, $6, $7, $8, $9, -1);;
!!# } jmp icerr_alu_st_trpd icerr_iseg alu_tokens
!!# {
!!#    IJ_iseg_printf("diag.j", 415,ISEG, 0, th_evnt, "last_inst:\n");
!!#    IJ_iseg_generate ("diag.j", 416,ISEG, 0, th_evnt, $14);
!!# }
!!# ;
!!# 
!!# alu_illinst_iseg: d700 
!!# 		{
!!# 			IJ_iseg_printf ("diag.j", 422,ISEG, 0, th_evnt, "\t.word 0xba00808c\n");
!!# 		}
!!#    	     | d800 alu_tokens
!!# 		{
!!# 			IJ_iseg_generate ("diag.j", 426,ISEG, 0, th_evnt, $2);
!!# 		}	       
!!# ;
!!# 
!!# alu_illinst: d701 
!!# 		{
!!# 			IJ_printf ("diag.j", 432, th_evnt, "\t.word 0xba00808c\n");
!!# 		}
!!#    	     | d801 alu_tokens
!!# 		{
!!# 			IJ_generate ("diag.j", 436, th_evnt, $2);
!!# 		}	       
!!# ;
!!# 
!!# st_irferr_unalgn_trpd: d1000 irferr_iseg 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 442,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:irferr store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 443,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");
!!# 		    }
!!#                   | d500 store %ropr  Ro_unaligned_addr
!!#                     {
!!# 		       IJ_iseg_printf("diag.j", 447,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:unaligned store\n");
!!# 		       IJ_iseg_generate ("diag.j", 448,ISEG, 0, th_evnt, $2);
!!#                     }
!!# 		  | d600 irferr_iseg store %ropr  Ro_unaligned_addr
!!#                     {
!!# 		       IJ_iseg_printf("diag.j", 452,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:irferr unaligned store\n");
!!# 		       IJ_iseg_generate ("diag.j", 453,ISEG, 0, th_evnt, $3);
!!#                     }
!!# 	          | d900 store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 457,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:Normal store\n");
!!# 		       IJ_iseg_generate ("diag.j", 458,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# 		  | d1002 irferr_iseg store
!!#                     {
!!# 		       IJ_iseg_printf("diag.j", 462,ISEG, 0, th_evnt, "!st_irferr_unalgn_trpd:irferr store\n");
!!# 		       IJ_iseg_generate ("diag.j", 463,ISEG, 0, th_evnt, $3);
!!#                     }
!!# ;
!!# 
!!# st_trpd: d1001 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 469,ISEG, 0, th_evnt, "!st_trpd: store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 470,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");		     
!!# 		    }
!!# 	| d901 store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 474,ISEG, 0, th_evnt, "!st_trpd:Normal store\n");
!!# 		       IJ_iseg_generate ("diag.j", 475,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# ;
!!# 
!!# icerr_alu_st_trpd:  d909 icerr_iseg 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 481,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: icerr alu rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 482,ISEG, 0, th_evnt, "\t.word 0xba00808c\n");
!!# 		    }
!!# 		   | d903 icerr_iseg 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 486,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: icerr store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 487,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");
!!# 		    }
!!# 		   | d904 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 491,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: alu rsvd\n");
!!# 		       IJ_iseg_printf ("diag.j", 492,ISEG, 0, th_evnt, "\t.word 0xba00808c\n");
!!# 		    }
!!# 		   | d905 
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 496,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: store rsvd\n");
!!# 		       IJ_iseg_printf("diag.j", 497,ISEG, 0, th_evnt, "\t.word 0xf472008d\n");
!!# 		    }
!!# 	   	   | d915 store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 501,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: Normal store\n");
!!# 		       IJ_iseg_generate ("diag.j", 502,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# 	   	   | d916 alu_tokens
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 506,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: Normal alu\n");
!!# 		       IJ_iseg_generate ("diag.j", 507,ISEG, 0, th_evnt, $2);
!!# 		    }
!!# 		   | d902 icerr_iseg store
!!# 		    {
!!# 		       IJ_iseg_printf("diag.j", 511,ISEG, 0, th_evnt, "!icerr_alu_st_trpd: icerr store\n");
!!# 		       IJ_iseg_generate ("diag.j", 512,ISEG, 0, th_evnt, $2);
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
!!#          IJ_iseg_printf("diag.j", 527,ISEG, 0, th_evnt, "!lderr: dcerr load\n");
!!#          IJ_iseg_generate ("diag.j", 528,ISEG, 0, th_evnt, $2);
!!#        } 
!!#        | d908 load
!!#        {
!!#          IJ_iseg_printf("diag.j", 532,ISEG, 0, th_evnt, "!lderr: Normal load\n");
!!#          IJ_iseg_generate ("diag.j", 533,ISEG, 0, th_evnt, $2);
!!#        }
!!#        | irferr_iseg load 
!!#        {
!!#          IJ_iseg_printf("diag.j", 537,ISEG, 0, th_evnt, "!lderr: irferr load\n");
!!#          IJ_iseg_generate ("diag.j", 538,ISEG, 0, th_evnt, $2);
!!#        } 
!!# ;
!!# 
!!# dcerr_iseg: mMETA5
!!# {
!!#    IJ_iseg_printf ("diag.j", 544,ISEG, 0, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_iseg_printf ("diag.j", 546,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA56
!!# {
!!#    IJ_printf ("diag.j", 553, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 555, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# lop: mMETAmul_div
!!# {
!!#      for (i = 0; i < 500; i++) {
!!#        inst = random () % 3;
!!#        if (inst == 0) {
!!#          IJ_generate_from_token ("diag.j", 565,1, th_lop, ijdefault,tUDIV_I, tUDIV_R, tSDIV_I, tSDIV_R, 
!!#     		               tSDIVX_R, tSDIVX_I, tUDIVX_R, tUDIVX_I, tUDIVcc_I, tUDIVcc_R, 
!!#                                tSDIVcc_I, tSDIVcc_R, -1);;
!!#        } else if (inst == 1) {
!!# 	     IJ_generate_from_token ("diag.j", 567,1, th_lop, ijdefault,tMULX_R, tMULX_I, tUMUL_R, tUMUL_I, 
!!# 				        tSMUL_R, tSMUL_I, tUMULcc_R, tUMULcc_I, tSMULcc_R, tSMULcc_I, 
!!# 					tMULScc_R, tMULScc_I, -1);;
!!#        } else {
!!# 	    IJ_generate_from_token ("diag.j", 569,1, th_lop, ijdefault, tFADDs, tFXNORS, tFADDd, tFADDq, tFSUBs, tFMOVA, tFSUBd, tFMOVN, tFSUBq, tFMOVNE, tFCMPs, tFMOVE, tFCMPd, tFMOVG, tFCMPq, tFMOVLE, tFCMPEs, tFMOVGE, tFCMPEd, tFMOVL, tFCMPEq, tFMOVGU, tFsTOx, tFMOVLEU, tFdTOx, tFMOVCC, tFqTOx, tFMOVCS, tFsTOi, tFMOVPOS, tFdTOi, tFMOVNEG, tFqTOi, tFMOVVC, tFsTOd, tFMOVVS, tFsTOq, tFMOVRZ, tFdTOs, tFMOVRLEZ, tFdTOq, tFMOVRLZ, tFqTOs, tFMOVRNZ, tFqTOd, tFMOVRGZ, tFxTOs, tFMOVRGEZ, tFxTOd, tFxTOq, tFiTOs, tFiTOd, tFiTOq, tFMOVs, tFMOVd, tFMOVq, tFNEGs, tFNEGd, tFNEGq, tFABSs, tFABSd, tFABSq, tFMULs, tFMULd, tFMULq, tFsMULd, tFdMULq, tFDIVs, tFDIVd, tFDIVq, tFSQRTs, tFSQRTd, tFSQRTq, tFBA, tFBN, tFBU, tFBG, tFBL, tFBUL, tFBLG, tFBNE, tFBE, tFBUE, tFBGE, tFBUG, tFBLE, tFBO, tFBPA, tFBPN, tFBPE, tFBPG, tFBPU, tFBPL, tFBPO, -1);;
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
!!#          IJ_printf ("diag.j", 581, th_intr, "thr%y_nuke_intr_%d:\n", intr_cnt);
!!#          IJ_printf ("diag.j", 582, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_nuke_intr_%d), 16, 16)) -> intp(%d, 2, 1)\n", intr_cnt,thrid);
!!#          IJ_generate_from_token ("diag.j", 583,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#          IJ_printf ("diag.j", 584, th_intr, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#          IJ_printf ("diag.j", 585, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%d, 3, 1)\n", intr_cnt,thrid);
!!#          burst_cnt = random () % 4 + 1;
!!#          IJ_generate_from_token ("diag.j", 587,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#          IJ_printf ("diag.j", 591, th_intr, "thr%y_hw_intr_%d:\n", intr_cnt);
!!#          IJ_printf ("diag.j", 592, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_hw_intr_%d), 16, 16)) -> intp(%d, 0, 1)\n", intr_cnt,thrid);
!!#          IJ_generate_from_token ("diag.j", 593,burst_cnt, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_printf ("diag.j", 612, th_evnt, "\trd      %%pc, %%r19\n");
!!#    IJ_printf ("diag.j", 613, th_evnt, "\tadd     %%r19, 0x28, %%r19\n");
!!#    IJ_printf ("diag.j", 614, th_evnt, "\tsetx    last_l1c, %%r16, %%r31\n");
!!#    IJ_printf ("diag.j", 615, th_evnt, "\tjmpl 	  %%r31, %%r0\n");
!!#    IJ_printf ("diag.j", 616, th_evnt, "\tnop\n");
!!# }
!!# ;
!!# 
!!# oor_trap_pc: mMETAoor_trap
!!# {
!!#    IJ_printf ("diag.j", 622, th_evnt, "\trd      %%pc, %%r19\n");
!!#    IJ_printf ("diag.j", 623, th_evnt, "\tadd     %%r19, 0xc, %%r19\n");
!!#    if (random () % 2 == 0) {
!!#      IJ_printf ("diag.j", 625, th_evnt, "\tta 0x31\n");
!!#    } else {
!!#      IJ_printf ("diag.j", 627, th_evnt, "\tta 0x32\n");
!!#    }
!!# }
!!# ;
!!# 
!!# stores: alu d10 
!!#         {
!!#            IJ_printf ("diag.j", 634, th_evnt, "\tsetx  0x%016llrx, %%r16, %%r17\n", pc_va_oor);
!!#            i = random () % 5 + 8;
!!# 	   IJ_printf ("diag.j", 636, th_evnt, "\trd      %%pc, %%r19\n");
!!# 	   IJ_printf ("diag.j", 637, th_evnt, "\tadd     %%r19, 0x40, %%r19\n");
!!#            IJ_generate_from_token ("diag.j", 638,i, th_evnt, ijdefault, tSTB_I, tSTH_I, tSTW_I, tSTX_I, tSTB_R, tSTH_R, tSTW_R, tSTX_R, -1);;
!!#         }
!!#         irferr_jmpl store8 
!!# 	{
!!# 	   IJ_generate ("diag.j", 642, th_evnt, $5);
!!# 	}
!!# 	icerr_alu alu alu alu alu alu alu 
!!# ;
!!# 
!!# d11: mMETA11
!!# {
!!#            IJ_printf ("diag.j", 649, th_evnt, "\tsetx  0x%016llrx, %%r16, %%r17\n", pc_va_oor);
!!# 	   IJ_printf ("diag.j", 650, th_evnt, "\trd      %%pc, %%r19\n");
!!# 	   IJ_printf ("diag.j", 651, th_evnt, "\tadd     %%r19, 0x14, %%r19\n");
!!# }
!!# ;
!!# 
!!# d12: mMETA12
!!# {
!!#            IJ_printf ("diag.j", 657, th_evnt, "\tsetx  0x%016llrx, %%r16, %%r17\n", pc_va_oor);
!!# 	   IJ_printf ("diag.j", 658, th_evnt, "\trd      %%pc, %%r19\n");
!!# 	   IJ_printf ("diag.j", 659, th_evnt, "\tadd     %%r19, 0x10, %%r19\n");
!!# }
!!# ;
!!# 
!!# mul_div_fpop: alu d12 irferr_jmpl mul %ropr  Ro_rsvd_set
!!# 		{
!!# 		  IJ_generate ("diag.j", 665, th_evnt, $4);
!!# 		}
!!# 	      | alu d12 irferr_jmpl div %ropr  Ro_rsvd_set
!!# 		{
!!# 		  IJ_generate ("diag.j", 669, th_evnt, $4);
!!# 		}
!!# 	      | alu d12 irferr_jmpl fpop	
!!# 		{
!!# 		  IJ_generate ("diag.j", 673, th_evnt, $4);
!!# 		}
!!#               | d2002 alu d12 irferr_jmpl mul
!!# 		{
!!# 		  IJ_generate ("diag.j", 677, th_evnt, $5);
!!# 		}
!!# 	      | d2003 alu d12 irferr_jmpl div
!!# 		{
!!# 		  IJ_generate ("diag.j", 681, th_evnt, $5);
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
!!#           		IJ_iseg_generate ("diag.j", 693,ISEG, 0, th_evnt, $1);
!!# 		}
!!# 	      | div %ropr  Ro_rsvd_set
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 697,ISEG, 0, th_evnt, $1);
!!# 		}
!!# 	      | fpop	
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 701,ISEG, 0, th_evnt, $1);
!!# 		}
!!# 	      | d2002 mul
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 705,ISEG, 0, th_evnt, $2);
!!# 		}	        
!!# 	      | d2003 div
!!# 		{
!!#           		IJ_iseg_generate ("diag.j", 709,ISEG, 0, th_evnt, $2);
!!# 		}	        
!!# ;
!!# 
!!# store8: d444 store_i 
!!# 	{IJ_generate ("diag.j", 714, th_evnt, $2);}
!!#        | d333 
!!# 	{IJ_printf ("diag.j", 716, th_evnt, "\t.word 0xf472008d\n");}
!!#        | d222 icerr store_i
!!# 	{IJ_generate ("diag.j", 718, th_evnt, $3);}
!!#        | d111 icerr store_r
!!# 	{IJ_generate ("diag.j", 720, th_evnt, $3);}
!!#        | d000 icerr 
!!# 	{IJ_printf ("diag.j", 722, th_evnt, "\t.word 0xf472008d\n");}
!!#        | d555 store_r
!!# 	{IJ_generate ("diag.j", 724, th_evnt, $2);}
!!# ;
!!# 
!!# icerr_alu: icerr alu | d5945 alu | d765 icerr 
!!#    {
!!#        IJ_printf ("diag.j", 729, th_evnt, "\t.word 0xba00808c\n");
!!#    }
!!# ;
!!# 
!!# irferr_jmpl: irferr jmpl %ropr  Ro_jmpl | d3467 jmpl %ropr  Ro_jmpl
!!# ;
!!# 
!!# jmpl: tJMPL_R %ropr  Ro_jmpl
!!#    {
!!#       IJ_generate ("diag.j", 738, th_evnt, $1);
!!#    }
!!# ;
!!# 
!!# jmp: normal_jmp | irferr_jmp | unalign_jmp | unalign_irferr_jmp
!!# ;
!!# 
!!# normal_jmp: mMETAnormal_jmp
!!# {
!!#    IJ_iseg_printf("diag.j", 747,ISEG, 0, th_evnt, "\tjmpl %%r31, %%r0\n");
!!# }
!!# ;
!!# 
!!# irferr_jmp: mMETAirferr_jmp
!!# {
!!#      IJ_iseg_printf ("diag.j", 753,ISEG, 0, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_iseg_printf ("diag.j", 755,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!#      IJ_iseg_printf("diag.j", 757,ISEG, 0, th_evnt, "\tjmpl %%r31, %%r0\n");
!!# }
!!# ;
!!# 
!!# unalign_jmp: mMETAunalign_jmp
!!# {
!!#   IJ_iseg_printf("diag.j", 763,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x1, %%r0\n");
!!# }
!!# ;
!!# 
!!# unalign_irferr_jmp: mMETAunalign_irferr_jmp
!!# {
!!#      IJ_iseg_printf ("diag.j", 769,ISEG, 0, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_iseg_printf ("diag.j", 771,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!#      IJ_iseg_printf("diag.j", 773,ISEG, 0, th_evnt, "\tjmpl %%r31 + 0x1, %%r0\n");
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA17
!!# { 
!!#    burst_cnt = random () % 3 + 3; 
!!#    IJ_generate_from_token ("diag.j", 780,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_printf ("diag.j", 786, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    bitnum = random () % 34;
!!#    IJ_printf ("diag.j", 788, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# icerr_iseg: mMETA19
!!# {
!!#    IJ_iseg_printf ("diag.j", 795,ISEG, 0, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    bitnum = random () % 34;
!!#    IJ_iseg_printf ("diag.j", 797,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf ("diag.j", 804, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 806, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# lderr: dcerr load_r %ropr  Ro_load_r
!!#        {
!!#          IJ_generate ("diag.j", 813, th_evnt, $2);
!!#        } 
!!# ;
!!# 
!!# irferr_iseg: mMETA20_iseg
!!# {
!!#      IJ_iseg_printf ("diag.j", 819,ISEG, 0, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_iseg_printf ("diag.j", 821,ISEG, 0, th_evnt, "!$EV error(%y,expr(@VA(.ISEG_0.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
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
!!#    IJ_generate ("diag.j", 840, th_evnt, $2);
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
!!#    IJ_printf ("diag.j", 977, th_evnt, ".align 0x8\n");
!!# };
!!# 
!!# d2020: mMETA2020
!!# {
!!#    IJ_printf ("diag.j", 982, th_evnt, ".align 0x4\n");
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

