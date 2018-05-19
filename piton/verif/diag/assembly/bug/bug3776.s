// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3776.s
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
   random seed:	576477050
   Jal retr_mul.j:	
********************************************************************************/


#define NO_TRAPCHECK
#include "enable_traps.h"
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
	setx  0xa22122be86d0b9e2, %r16, %r16
	setx  0x432c367b51e7d43c, %r16, %r17
	setx  0xb68c4255f11917b3, %r16, %r18
	setx  0x25e24a3e88a43483, %r16, %r19
	setx  0x2ecdaa2f1bd95398, %r16, %r20
	setx  0x13ace18b380f1caa, %r16, %r21
	setx  0x853cef9cec4ecbe6, %r16, %r22
	setx  0x7142ddf95efd8d9c, %r16, %r23
	setx  0x89161afb8e9965fc, %r16, %r24
	setx  0xa37eb493ce1632e3, %r16, %r25
	setx  0x0258accd0cf2ff1d, %r16, %r26
	setx  0xc852145a5fc3ad92, %r16, %r27
	setx  0xd97d840a445fdbc5, %r16, %r28
	setx  0xdcdd364281e5f363, %r16, %r29
	setx  0x06a76ee455af1ea1, %r16, %r30
	setx  0x3ccd61ae47460530, %r16, %r31
	setx  0x0000000000000c40, %r16, %r9
	setx  0x0000000000000b00, %r16, %r10
	setx  0x0000000000000370, %r16, %r11
	setx  0x00000000000007a0, %r16, %r12
	setx  0x0000000000000000, %r16, %r13
	setx  0x00000000000008f0, %r16, %r14
	setx  0x0000000000000a90, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0812f0f  ! 1: ADDcc_I	addcc 	%r4, 0x0f0f, %r16
	.word 0xaa01c00b  ! 1: ADD_R	add 	%r7, %r11, %r21
	.word 0xb9293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r28
	.word 0xb618e19e  ! 1: XOR_I	xor 	%r3, 0x019e, %r27
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc38e4f0  ! 1: XNOR_I	xnor 	%r3, 0x04f0, %r30
	.word 0xbe08ed33  ! 1: AND_I	and 	%r3, 0x0d33, %r31
	.word 0xaa99e951  ! 1: XORcc_I	xorcc 	%r7, 0x0951, %r21
	.word 0xbab96c63  ! 1: XNORcc_I	xnorcc 	%r5, 0x0c63, %r29
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb611400b  ! 1: OR_R	or 	%r5, %r11, %r27
	.word 0xac91800b  ! 1: ORcc_R	orcc 	%r6, %r11, %r22
	.word 0xbd31900e  ! 1: SRLX_R	srlx	%r6, %r14, %r30
	.word 0xb2912e74  ! 1: ORcc_I	orcc 	%r4, 0x0e74, %r25
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb89925c3  ! 1: XORcc_I	xorcc 	%r4, 0x05c3, %r28
	.word 0xb9782401  ! 1: MOVR_I	move	%r0, 0x5c3, %r28
	.word 0xaeb9c00f  ! 1: XNORcc_R	xnorcc 	%r7, %r15, %r23
	.word 0xa6a9af26  ! 1: ANDNcc_I	andncc 	%r6, 0x0f26, %r19
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa939500b  ! 1: SRAX_R	srax	%r5, %r11, %r20
	.word 0xa1392001  ! 1: SRA_I	sra 	%r4, 0x0001, %r16
	.word 0xa409400a  ! 1: AND_R	and 	%r5, %r10, %r18
	.word 0xa088a93e  ! 1: ANDcc_I	andcc 	%r2, 0x093e, %r16
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb3293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r25
	.word 0xa8ba000b  ! 1: XNORcc_R	xnorcc 	%r8, %r11, %r20
	.word 0xac18e742  ! 1: XOR_I	xor 	%r3, 0x0742, %r22
	.word 0xa82a000d  ! 1: ANDN_R	andn 	%r8, %r13, %r20
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac82000b  ! 1: ADDcc_R	addcc 	%r8, %r11, %r22
	.word 0xaa9966fd  ! 1: XORcc_I	xorcc 	%r5, 0x06fd, %r21
	.word 0xb53a000a  ! 1: SRA_R	sra 	%r8, %r10, %r26
	.word 0xb611000e  ! 1: OR_R	or 	%r4, %r14, %r27
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb4b22c29  ! 1: ORNcc_I	orncc 	%r8, 0x0c29, %r26
	.word 0xa2b9a921  ! 1: XNORcc_I	xnorcc 	%r6, 0x0921, %r17
	.word 0xb400800f  ! 1: ADD_R	add 	%r2, %r15, %r26
	.word 0xbc10a4be  ! 1: OR_I	or 	%r2, 0x04be, %r30
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa539a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r18
	.word 0xae8a000a  ! 1: ANDcc_R	andcc 	%r8, %r10, %r23
	.word 0xa7782401  ! 1: MOVR_I	move	%r0, 0xa, %r19
	.word 0xb178040c  ! 1: MOVR_R	move	%r0, %r12, %r24
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb731900f  ! 1: SRLX_R	srlx	%r6, %r15, %r27
	.word 0xa3297001  ! 1: SLLX_I	sllx	%r5, 0x0001, %r17
	.word 0xa529b001  ! 1: SLLX_I	sllx	%r6, 0x0001, %r18
	.word 0xba892e0b  ! 1: ANDcc_I	andcc 	%r4, 0x0e0b, %r29
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb731d00c  ! 1: SRLX_R	srlx	%r7, %r12, %r27
	.word 0xbe19ee08  ! 1: XOR_I	xor 	%r7, 0x0e08, %r31
	.word 0xaec0a6d2  ! 1: ADDCcc_I	addccc 	%r2, 0x06d2, %r23
	.word 0xa438800b  ! 1: XNOR_R	xnor 	%r2, %r11, %r18
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb0a88009  ! 1: ANDNcc_R	andncc 	%r2, %r9, %r24
	.word 0xad38d00c  ! 1: SRAX_R	srax	%r3, %r12, %r22
	.word 0xa929500d  ! 1: SLLX_R	sllx	%r5, %r13, %r20
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc9228e6  ! 1: ORcc_I	orcc 	%r8, 0x08e6, %r30
	.word 0xaab8e76d  ! 1: XNORcc_I	xnorcc 	%r3, 0x076d, %r21
	.word 0xa732000e  ! 1: SRL_R	srl 	%r8, %r14, %r19
	.word 0xb401ed05  ! 1: ADD_I	add 	%r7, 0x0d05, %r26
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa419000f  ! 1: XOR_R	xor 	%r4, %r15, %r18
	.word 0xb2aa2bef  ! 1: ANDNcc_I	andncc 	%r8, 0x0bef, %r25
	.word 0xb9641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa408800c  ! 1: AND_R	and 	%r2, %r12, %r18
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa088ee54  ! 1: ANDcc_I	andcc 	%r3, 0x0e54, %r16
	.word 0xb819c00f  ! 1: XOR_R	xor 	%r7, %r15, %r28
	.word 0xa0912987  ! 1: ORcc_I	orcc 	%r4, 0x0987, %r16
	.word 0xa890c009  ! 1: ORcc_R	orcc 	%r3, %r9, %r20
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb889eaf1  ! 1: ANDcc_I	andcc 	%r7, 0x0af1, %r28
	.word 0xb339d00b  ! 1: SRAX_R	srax	%r7, %r11, %r25
	.word 0xab30a001  ! 1: SRL_I	srl 	%r2, 0x0001, %r21
	.word 0xac99efe7  ! 1: XORcc_I	xorcc 	%r7, 0x0fe7, %r22
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb091c00e  ! 1: ORcc_R	orcc 	%r7, %r14, %r24
	.word 0xa9293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r20
	.word 0xb2996554  ! 1: XORcc_I	xorcc 	%r5, 0x0554, %r25
	.word 0xb131f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r24
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa638800d  ! 1: XNOR_R	xnor 	%r2, %r13, %r19
	.word 0xba41c00e  ! 1: ADDC_R	addc 	%r7, %r14, %r29
	.word 0xa69a28c9  ! 1: XORcc_I	xorcc 	%r8, 0x08c9, %r19
	.word 0xb731f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r27
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa3323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r17
	.word 0xba19e7ba  ! 1: XOR_I	xor 	%r7, 0x07ba, %r29
	.word 0xb841e7f5  ! 1: ADDC_I	addc 	%r7, 0x07f5, %r28
	.word 0xbc98aec5  ! 1: XORcc_I	xorcc 	%r2, 0x0ec5, %r30
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2c2000b  ! 1: ADDCcc_R	addccc 	%r8, %r11, %r17
	.word 0xa099a9ea  ! 1: XORcc_I	xorcc 	%r6, 0x09ea, %r16
	.word 0xb4a9000c  ! 1: ANDNcc_R	andncc 	%r4, %r12, %r26
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa238eef6  ! 1: XNOR_I	xnor 	%r3, 0x0ef6, %r17
	.word 0xa698c00f  ! 1: XORcc_R	xorcc 	%r3, %r15, %r19
	.word 0xaa08c00f  ! 1: AND_R	and 	%r3, %r15, %r21
	.word 0xa489c009  ! 1: ANDcc_R	andcc 	%r7, %r9, %r18
thr3_resum_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c226dd  ! 1: ADDCcc_I	addccc 	%r8, 0x06dd, %r25
	.word 0xb239a284  ! 1: XNOR_I	xnor 	%r6, 0x0284, %r25
	.word 0xb6116a49  ! 1: OR_I	or 	%r5, 0x0a49, %r27
	.word 0xb29a000f  ! 1: XORcc_R	xorcc 	%r8, %r15, %r25
thr3_resum_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae00a949  ! 1: ADD_I	add 	%r2, 0x0949, %r23
	.word 0xb8096278  ! 1: AND_I	and 	%r5, 0x0278, %r28
	.word 0xa4b8aa4d  ! 1: XNORcc_I	xnorcc 	%r2, 0x0a4d, %r18
	.word 0xa764180d  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_23), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_23)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8c0c00f  ! 1: ADDCcc_R	addccc 	%r3, %r15, %r20
	.word 0xbd39500f  ! 1: SRAX_R	srax	%r5, %r15, %r30
	.word 0xa011a49d  ! 1: OR_I	or 	%r6, 0x049d, %r16
	.word 0xa491ab46  ! 1: ORcc_I	orcc 	%r6, 0x0b46, %r18
thr3_resum_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_24), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_24)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb4116f90  ! 1: OR_I	or 	%r5, 0x0f90, %r26
	.word 0xbe312d16  ! 1: ORN_I	orn 	%r4, 0x0d16, %r31
	.word 0xb480800f  ! 1: ADDcc_R	addcc 	%r2, %r15, %r26
	.word 0xab782401  ! 1: MOVR_I	move	%r0, 0xf, %r21
thr3_resum_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaa01000b  ! 1: ADD_R	add 	%r4, %r11, %r21
	.word 0xa729f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r19
	.word 0xba98e040  ! 1: XORcc_I	xorcc 	%r3, 0x0040, %r29
thr3_resum_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb530f001  ! 1: SRLX_I	srlx	%r3, 0x0001, %r26
	.word 0xba422cda  ! 1: ADDC_I	addc 	%r8, 0x0cda, %r29
	.word 0xa731c009  ! 1: SRL_R	srl 	%r7, %r9, %r19
	.word 0xa329100f  ! 1: SLLX_R	sllx	%r4, %r15, %r17
thr3_resum_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_27), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_27)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb92a100c  ! 1: SLLX_R	sllx	%r8, %r12, %r28
	.word 0xb739a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r27
	.word 0xae12290b  ! 1: OR_I	or 	%r8, 0x090b, %r23
	.word 0xb4b08009  ! 1: ORNcc_R	orncc 	%r2, %r9, %r26
thr3_resum_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb72a100d  ! 1: SLLX_R	sllx	%r8, %r13, %r27
	.word 0xa03a2ae2  ! 1: XNOR_I	xnor 	%r8, 0x0ae2, %r16
	.word 0xb03123af  ! 1: ORN_I	orn 	%r4, 0x03af, %r24
	.word 0xa738d00a  ! 1: SRAX_R	srax	%r3, %r10, %r19
thr3_resum_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa131400a  ! 1: SRL_R	srl 	%r5, %r10, %r16
	.word 0xb411800c  ! 1: OR_R	or 	%r6, %r12, %r26
	.word 0xbc39a17e  ! 1: XNOR_I	xnor 	%r6, 0x017e, %r30
	.word 0xa1322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r16
thr3_resum_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa099400c  ! 1: XORcc_R	xorcc 	%r5, %r12, %r16
	.word 0xae19000e  ! 1: XOR_R	xor 	%r4, %r14, %r23
	.word 0xb778040b  ! 1: MOVR_R	move	%r0, %r11, %r27
	.word 0xacb9800d  ! 1: XNORcc_R	xnorcc 	%r6, %r13, %r22
thr3_resum_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0414009  ! 1: ADDC_R	addc 	%r5, %r9, %r24
	.word 0xa2b9c00d  ! 1: XNORcc_R	xnorcc 	%r7, %r13, %r17
	.word 0xba412f2a  ! 1: ADDC_I	addc 	%r4, 0x0f2a, %r29
	.word 0xbb29f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r29
thr3_resum_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa881400b  ! 1: ADDcc_R	addcc 	%r5, %r11, %r20
	.word 0xa331400c  ! 1: SRL_R	srl 	%r5, %r12, %r17
	.word 0xaf38e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r23
	.word 0xa618c00a  ! 1: XOR_R	xor 	%r3, %r10, %r19
thr3_resum_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_33), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_33)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad28f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r22
	.word 0xa339800a  ! 1: SRA_R	sra 	%r6, %r10, %r17
	.word 0xba90a919  ! 1: ORcc_I	orcc 	%r2, 0x0919, %r29
	.word 0xa439c00f  ! 1: XNOR_R	xnor 	%r7, %r15, %r18
thr3_resum_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_34), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_34)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb6b8c00c  ! 1: XNORcc_R	xnorcc 	%r3, %r12, %r27
	.word 0xb499800c  ! 1: XORcc_R	xorcc 	%r6, %r12, %r26
	.word 0xbf782401  ! 1: MOVR_I	move	%r0, 0xc, %r31
	.word 0xa0ba000f  ! 1: XNORcc_R	xnorcc 	%r8, %r15, %r16
thr3_resum_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_35), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_35)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac91aac1  ! 1: ORcc_I	orcc 	%r6, 0x0ac1, %r22
	.word 0xb2016270  ! 1: ADD_I	add 	%r5, 0x0270, %r25
	.word 0xb881000e  ! 1: ADDcc_R	addcc 	%r4, %r14, %r28
	.word 0xb8c1699d  ! 1: ADDCcc_I	addccc 	%r5, 0x099d, %r28
thr3_resum_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_36), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_36)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb729000b  ! 1: SLL_R	sll 	%r4, %r11, %r27
	.word 0xad31b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r22
	.word 0xa090c00d  ! 1: ORcc_R	orcc 	%r3, %r13, %r16
	.word 0xb139400c  ! 1: SRA_R	sra 	%r5, %r12, %r24
thr3_resum_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb8b9400e  ! 1: XNORcc_R	xnorcc 	%r5, %r14, %r28
	.word 0xb4c1c00b  ! 1: ADDCcc_R	addccc 	%r7, %r11, %r26
	.word 0xa6416b72  ! 1: ADDC_I	addc 	%r5, 0x0b72, %r19
	.word 0xbf28d00d  ! 1: SLLX_R	sllx	%r3, %r13, %r31
thr3_resum_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_38), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_38)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb4a88009  ! 1: ANDNcc_R	andncc 	%r2, %r9, %r26
	.word 0xbd323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r30
	.word 0xb6112b9b  ! 1: OR_I	or 	%r4, 0x0b9b, %r27
	.word 0xbb312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r29
thr3_resum_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_39), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_39)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa5322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r18
	.word 0xa040800b  ! 1: ADDC_R	addc 	%r2, %r11, %r16
	.word 0xa6b1a2a6  ! 1: ORNcc_I	orncc 	%r6, 0x02a6, %r19
	.word 0xacb92201  ! 1: XNORcc_I	xnorcc 	%r4, 0x0201, %r22
thr3_resum_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_40), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_40)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbab9000e  ! 1: XNORcc_R	xnorcc 	%r4, %r14, %r29
	.word 0xad39800f  ! 1: SRA_R	sra 	%r6, %r15, %r22
	.word 0xbd322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0xb63a000e  ! 1: XNOR_R	xnor 	%r8, %r14, %r27
thr3_resum_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_41), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_41)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb211400e  ! 1: OR_R	or 	%r5, %r14, %r25
	.word 0xba81c009  ! 1: ADDcc_R	addcc 	%r7, %r9, %r29
	.word 0xaac1c00f  ! 1: ADDCcc_R	addccc 	%r7, %r15, %r21
	.word 0xb6b0c00d  ! 1: ORNcc_R	orncc 	%r3, %r13, %r27
thr3_resum_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_42), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_42)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb488a43b  ! 1: ANDcc_I	andcc 	%r2, 0x043b, %r26
	.word 0xbd29e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r30
	.word 0xac088009  ! 1: AND_R	and 	%r2, %r9, %r22
	.word 0xa130d00f  ! 1: SRLX_R	srlx	%r3, %r15, %r16
thr3_resum_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa1643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa638c00e  ! 1: XNOR_R	xnor 	%r3, %r14, %r19
	.word 0xb201a99e  ! 1: ADD_I	add 	%r6, 0x099e, %r25
	.word 0xb5298009  ! 1: SLL_R	sll 	%r6, %r9, %r26
thr3_resum_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_44), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_44)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb330900f  ! 1: SRLX_R	srlx	%r2, %r15, %r25
	.word 0xb681400c  ! 1: ADDcc_R	addcc 	%r5, %r12, %r27
	.word 0xb829a450  ! 1: ANDN_I	andn 	%r6, 0x0450, %r28
	.word 0xa609e6fc  ! 1: AND_I	and 	%r7, 0x06fc, %r19
thr3_resum_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_45), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_45)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb2a2001  ! 1: SLL_I	sll 	%r8, 0x0001, %r29
	.word 0xaa092c8a  ! 1: AND_I	and 	%r4, 0x0c8a, %r21
	.word 0xb000c00f  ! 1: ADD_R	add 	%r3, %r15, %r24
	.word 0xb210c00e  ! 1: OR_R	or 	%r3, %r14, %r25
thr3_resum_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac98e63f  ! 1: XORcc_I	xorcc 	%r3, 0x063f, %r22
	.word 0xbf293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r31
	.word 0xb72a100c  ! 1: SLLX_R	sllx	%r8, %r12, %r27
	.word 0xa681610f  ! 1: ADDcc_I	addcc 	%r5, 0x010f, %r19
thr3_resum_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_47), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_47)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4b9c00d  ! 1: XNORcc_R	xnorcc 	%r7, %r13, %r18
	.word 0xb764180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xae18800f  ! 1: XOR_R	xor 	%r2, %r15, %r23
	.word 0xb2a8a497  ! 1: ANDNcc_I	andncc 	%r2, 0x0497, %r25
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaeb0e549  ! 1: ORNcc_I	orncc 	%r3, 0x0549, %r23
	.word 0xa010a717  ! 1: OR_I	or 	%r2, 0x0717, %r16
	.word 0xac396d3b  ! 1: XNOR_I	xnor 	%r5, 0x0d3b, %r22
	.word 0xb828ebc8  ! 1: ANDN_I	andn 	%r3, 0x0bc8, %r28
thr3_resum_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_49), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_49)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa99400d  ! 1: XORcc_R	xorcc 	%r5, %r13, %r21
	.word 0xaa19c00b  ! 1: XOR_R	xor 	%r7, %r11, %r21
	.word 0xb81a201f  ! 1: XOR_I	xor 	%r8, 0x001f, %r28
	.word 0xa000800c  ! 1: ADD_R	add 	%r2, %r12, %r16
thr3_resum_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_50), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_50)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa008800f  ! 1: AND_R	and 	%r2, %r15, %r16
	.word 0xb098a2c7  ! 1: XORcc_I	xorcc 	%r2, 0x02c7, %r24
	.word 0xb210c00f  ! 1: OR_R	or 	%r3, %r15, %r25
	.word 0xa128c00e  ! 1: SLL_R	sll 	%r3, %r14, %r16
thr3_resum_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_51), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_51)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa128b001  ! 1: SLLX_I	sllx	%r2, 0x0001, %r16
	.word 0xaf2a0009  ! 1: SLL_R	sll 	%r8, %r9, %r23
	.word 0xb9323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xa090800d  ! 1: ORcc_R	orcc 	%r2, %r13, %r16
thr3_resum_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa19c00c  ! 1: XOR_R	xor 	%r7, %r12, %r21
	.word 0xa2118009  ! 1: OR_R	or 	%r6, %r9, %r17
	.word 0xa81a0009  ! 1: XOR_R	xor 	%r8, %r9, %r20
	.word 0xb498c00a  ! 1: XORcc_R	xorcc 	%r3, %r10, %r26
thr3_resum_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_53), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_53)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc29000b  ! 1: ANDN_R	andn 	%r4, %r11, %r30
	.word 0xaa812578  ! 1: ADDcc_I	addcc 	%r4, 0x0578, %r21
	.word 0xb841c00f  ! 1: ADDC_R	addc 	%r7, %r15, %r28
	.word 0xa2016d4a  ! 1: ADD_I	add 	%r5, 0x0d4a, %r17
thr3_resum_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa829e5a6  ! 1: ANDN_I	andn 	%r7, 0x05a6, %r20
	.word 0xb611c00e  ! 1: OR_R	or 	%r7, %r14, %r27
	.word 0xa8420009  ! 1: ADDC_R	addc 	%r8, %r9, %r20
	.word 0xb419c00d  ! 1: XOR_R	xor 	%r7, %r13, %r26
thr3_resum_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_55), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_55)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb8318009  ! 1: ORN_R	orn 	%r6, %r9, %r28
	.word 0xab78040a  ! 1: MOVR_R	move	%r0, %r10, %r21
	.word 0xb929000f  ! 1: SLL_R	sll 	%r4, %r15, %r28
	.word 0xb529100b  ! 1: SLLX_R	sllx	%r4, %r11, %r26
thr3_resum_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa6922eee  ! 1: ORcc_I	orcc 	%r8, 0x0eee, %r19
	.word 0xbc01c00b  ! 1: ADD_R	add 	%r7, %r11, %r30
	.word 0xb831ab43  ! 1: ORN_I	orn 	%r6, 0x0b43, %r28
thr3_resum_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_57), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_57)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb038ed1f  ! 1: XNOR_I	xnor 	%r3, 0x0d1f, %r24
	.word 0xa1396001  ! 1: SRA_I	sra 	%r5, 0x0001, %r16
	.word 0xb1316001  ! 1: SRL_I	srl 	%r5, 0x0001, %r24
	.word 0xa338a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r17
thr3_resum_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_58), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_58)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba39eaaa  ! 1: XNOR_I	xnor 	%r7, 0x0aaa, %r29
	.word 0xa01923bd  ! 1: XOR_I	xor 	%r4, 0x03bd, %r16
	.word 0xbca9628c  ! 1: ANDNcc_I	andncc 	%r5, 0x028c, %r30
	.word 0xb338d00b  ! 1: SRAX_R	srax	%r3, %r11, %r25
thr3_resum_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_59), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_59)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb729b001  ! 1: SLLX_I	sllx	%r6, 0x0001, %r27
	.word 0xb2b9000d  ! 1: XNORcc_R	xnorcc 	%r4, %r13, %r25
	.word 0xbb32000d  ! 1: SRL_R	srl 	%r8, %r13, %r29
	.word 0xb528a001  ! 1: SLL_I	sll 	%r2, 0x0001, %r26
thr3_resum_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_60), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_60)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0xbc0a2b80  ! 1: AND_I	and 	%r8, 0x0b80, %r30
	.word 0xacc1400c  ! 1: ADDCcc_R	addccc 	%r5, %r12, %r22
	.word 0xb698afec  ! 1: XORcc_I	xorcc 	%r2, 0x0fec, %r27
thr3_resum_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_61), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_61)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb9293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r28
	.word 0xb8a9000e  ! 1: ANDNcc_R	andncc 	%r4, %r14, %r28
	.word 0xb80166bc  ! 1: ADD_I	add 	%r5, 0x06bc, %r28
	.word 0xbe81000b  ! 1: ADDcc_R	addcc 	%r4, %r11, %r31
thr3_resum_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba12000b  ! 1: OR_R	or 	%r8, %r11, %r29
	.word 0xa8122086  ! 1: OR_I	or 	%r8, 0x0086, %r20
	.word 0xa338a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r17
	.word 0xba31aa35  ! 1: ORN_I	orn 	%r6, 0x0a35, %r29
thr3_resum_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_63), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_63)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa681e281  ! 1: ADDcc_I	addcc 	%r7, 0x0281, %r19
	.word 0xae196a65  ! 1: XOR_I	xor 	%r5, 0x0a65, %r23
	.word 0xa8a9a195  ! 1: ANDNcc_I	andncc 	%r6, 0x0195, %r20
	.word 0xab312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r21
thr3_resum_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_64), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_64)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb408c00e  ! 1: AND_R	and 	%r3, %r14, %r26
	.word 0xb6296bc3  ! 1: ANDN_I	andn 	%r5, 0x0bc3, %r27
	.word 0xbf38c00a  ! 1: SRA_R	sra 	%r3, %r10, %r31
	.word 0xb9322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r28
thr3_resum_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_65), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_65)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc0a2ff3  ! 1: AND_I	and 	%r8, 0x0ff3, %r30
	.word 0xb6c0c00e  ! 1: ADDCcc_R	addccc 	%r3, %r14, %r27
	.word 0xad39e001  ! 1: SRA_I	sra 	%r7, 0x0001, %r22
	.word 0xbc3a2bd6  ! 1: XNOR_I	xnor 	%r8, 0x0bd6, %r30
thr3_resum_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_66), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_66)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa3782401  ! 1: MOVR_I	move	%r0, 0xffffffd6, %r17
	.word 0xa539500e  ! 1: SRAX_R	srax	%r5, %r14, %r18
	.word 0xb3313001  ! 1: SRLX_I	srlx	%r4, 0x0001, %r25
	.word 0xbf31f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r31
thr3_resum_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_67), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_67)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba81af59  ! 1: ADDcc_I	addcc 	%r6, 0x0f59, %r29
	.word 0xaec1000f  ! 1: ADDCcc_R	addccc 	%r4, %r15, %r23
	.word 0xb60a2b71  ! 1: AND_I	and 	%r8, 0x0b71, %r27
	.word 0xaeb0c00d  ! 1: ORNcc_R	orncc 	%r3, %r13, %r23
thr3_resum_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_68), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_68)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb4398009  ! 1: XNOR_R	xnor 	%r6, %r9, %r26
	.word 0xa200800b  ! 1: ADD_R	add 	%r2, %r11, %r17
	.word 0xaeb12f36  ! 1: ORNcc_I	orncc 	%r4, 0x0f36, %r23
	.word 0xbb323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r29
thr3_resum_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf316001  ! 1: SRL_I	srl 	%r5, 0x0001, %r31
	.word 0xac292289  ! 1: ANDN_I	andn 	%r4, 0x0289, %r22
	.word 0xaa40a47a  ! 1: ADDC_I	addc 	%r2, 0x047a, %r21
	.word 0xa539a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r18
thr3_resum_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_70), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_70)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa800ad71  ! 1: ADD_I	add 	%r2, 0x0d71, %r20
	.word 0xa241400f  ! 1: ADDC_R	addc 	%r5, %r15, %r17
	.word 0xb689a3b7  ! 1: ANDcc_I	andcc 	%r6, 0x03b7, %r27
	.word 0xb9295009  ! 1: SLLX_R	sllx	%r5, %r9, %r28
thr3_resum_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_71), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_71)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa3782401  ! 1: MOVR_I	move	%r0, 0x9, %r17
	.word 0xbab1c00c  ! 1: ORNcc_R	orncc 	%r7, %r12, %r29
	.word 0xa329900f  ! 1: SLLX_R	sllx	%r6, %r15, %r17
	.word 0xa229400e  ! 1: ANDN_R	andn 	%r5, %r14, %r17
thr3_resum_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_72), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_72)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb299000f  ! 1: XORcc_R	xorcc 	%r4, %r15, %r25
	.word 0xab30c00e  ! 1: SRL_R	srl 	%r3, %r14, %r21
	.word 0xb228c00f  ! 1: ANDN_R	andn 	%r3, %r15, %r25
	.word 0xbb29d009  ! 1: SLLX_R	sllx	%r7, %r9, %r29
thr3_resum_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_73), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_73)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b0ed50  ! 1: ORNcc_I	orncc 	%r3, 0x0d50, %r24
	.word 0xb291a663  ! 1: ORcc_I	orcc 	%r6, 0x0663, %r25
	.word 0xb7296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r27
	.word 0xb22a000d  ! 1: ANDN_R	andn 	%r8, %r13, %r25
thr3_resum_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_74), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_74)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb331d00a  ! 1: SRLX_R	srlx	%r7, %r10, %r25
	.word 0xa4b0a2fd  ! 1: ORNcc_I	orncc 	%r2, 0x02fd, %r18
	.word 0xad29d00e  ! 1: SLLX_R	sllx	%r7, %r14, %r22
	.word 0xb409a2c7  ! 1: AND_I	and 	%r6, 0x02c7, %r26
thr3_resum_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_75), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_75)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb9312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r28
	.word 0xa691400a  ! 1: ORcc_R	orcc 	%r5, %r10, %r19
	.word 0xb1322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r24
	.word 0xab782401  ! 1: MOVR_I	move	%r0, 0x1, %r21
thr3_resum_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_76), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_76)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa029000a  ! 1: ANDN_R	andn 	%r4, %r10, %r16
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaa0a2fd9  ! 1: AND_I	and 	%r8, 0x0fd9, %r21
	.word 0xaac16fe6  ! 1: ADDCcc_I	addccc 	%r5, 0x0fe6, %r21
thr3_resum_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_77), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_77)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa7782401  ! 1: MOVR_I	move	%r0, 0xffffffe6, %r19
	.word 0xac196b70  ! 1: XOR_I	xor 	%r5, 0x0b70, %r22
	.word 0xb498eb46  ! 1: XORcc_I	xorcc 	%r3, 0x0b46, %r26
	.word 0xa139c00b  ! 1: SRA_R	sra 	%r7, %r11, %r16
thr3_resum_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_78), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_78)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa600e5c7  ! 1: ADD_I	add 	%r3, 0x05c7, %r19
	.word 0xad39400c  ! 1: SRA_R	sra 	%r5, %r12, %r22
	.word 0xba11800f  ! 1: OR_R	or 	%r6, %r15, %r29
	.word 0xa139000f  ! 1: SRA_R	sra 	%r4, %r15, %r16
thr3_resum_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_79), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_79)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad29e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r22
	.word 0xa218c009  ! 1: XOR_R	xor 	%r3, %r9, %r17
	.word 0xac98c00e  ! 1: XORcc_R	xorcc 	%r3, %r14, %r22
	.word 0xaa98c00e  ! 1: XORcc_R	xorcc 	%r3, %r14, %r21
thr3_resum_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_80), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_80)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae896ae7  ! 1: ANDcc_I	andcc 	%r5, 0x0ae7, %r23
	.word 0xac98800d  ! 1: XORcc_R	xorcc 	%r2, %r13, %r22
	.word 0xb04163c9  ! 1: ADDC_I	addc 	%r5, 0x03c9, %r24
	.word 0xa3643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba00edc8  ! 1: ADD_I	add 	%r3, 0x0dc8, %r29
	.word 0xab38d00c  ! 1: SRAX_R	srax	%r3, %r12, %r21
	.word 0xbc0a2e1f  ! 1: AND_I	and 	%r8, 0x0e1f, %r30
	.word 0xa4416ba3  ! 1: ADDC_I	addc 	%r5, 0x0ba3, %r18
thr3_resum_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_82), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_82)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0b0adbf  ! 1: ORNcc_I	orncc 	%r2, 0x0dbf, %r16
	.word 0xa4192030  ! 1: XOR_I	xor 	%r4, 0x0030, %r18
	.word 0xb4a9e1bb  ! 1: ANDNcc_I	andncc 	%r7, 0x01bb, %r26
	.word 0xa208c00e  ! 1: AND_R	and 	%r3, %r14, %r17
thr3_resum_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa7782401  ! 1: MOVR_I	move	%r0, 0xe, %r19
	.word 0xbe922a92  ! 1: ORcc_I	orcc 	%r8, 0x0a92, %r31
	.word 0xbb31e001  ! 1: SRL_I	srl 	%r7, 0x0001, %r29
	.word 0xb4b8e69d  ! 1: XNORcc_I	xnorcc 	%r3, 0x069d, %r26
thr3_resum_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_84), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_84)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab2a000a  ! 1: SLL_R	sll 	%r8, %r10, %r21
	.word 0xac29c00b  ! 1: ANDN_R	andn 	%r7, %r11, %r22
	.word 0xb601ab0f  ! 1: ADD_I	add 	%r6, 0x0b0f, %r27
	.word 0xbd39c00e  ! 1: SRA_R	sra 	%r7, %r14, %r30
thr3_resum_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4422f58  ! 1: ADDC_I	addc 	%r8, 0x0f58, %r18
	.word 0xb938800d  ! 1: SRA_R	sra 	%r2, %r13, %r28
	.word 0xbe81e1c0  ! 1: ADDcc_I	addcc 	%r7, 0x01c0, %r31
	.word 0xbcb96f41  ! 1: XNORcc_I	xnorcc 	%r5, 0x0f41, %r30
thr3_resum_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_86), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_86)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaab1a75a  ! 1: ORNcc_I	orncc 	%r6, 0x075a, %r21
	.word 0xa729d00b  ! 1: SLLX_R	sllx	%r7, %r11, %r19
	.word 0xbd782401  ! 1: MOVR_I	move	%r0, 0xb, %r30
	.word 0xb291ecf7  ! 1: ORcc_I	orcc 	%r7, 0x0cf7, %r25
thr3_resum_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_87), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_87)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb00223bb  ! 1: ADD_I	add 	%r8, 0x03bb, %r24
	.word 0xa6c16c41  ! 1: ADDCcc_I	addccc 	%r5, 0x0c41, %r19
	.word 0xb440800c  ! 1: ADDC_R	addc 	%r2, %r12, %r26
	.word 0xb964180f  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_88), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_88)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa531500e  ! 1: SRLX_R	srlx	%r5, %r14, %r18
	.word 0xb929f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r28
	.word 0xa0a9000a  ! 1: ANDNcc_R	andncc 	%r4, %r10, %r16
	.word 0xa888c00c  ! 1: ANDcc_R	andcc 	%r3, %r12, %r20
thr3_resum_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_89), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_89)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac00c00f  ! 1: ADD_R	add 	%r3, %r15, %r22
	.word 0xab322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r21
	.word 0xab390009  ! 1: SRA_R	sra 	%r4, %r9, %r21
	.word 0xa841400d  ! 1: ADDC_R	addc 	%r5, %r13, %r20
thr3_resum_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_90), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_90)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa330e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r17
	.word 0xbd29400f  ! 1: SLL_R	sll 	%r5, %r15, %r30
	.word 0xa0ba2ca3  ! 1: XNORcc_I	xnorcc 	%r8, 0x0ca3, %r16
	.word 0xb410a467  ! 1: OR_I	or 	%r2, 0x0467, %r26
thr3_resum_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_91), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_91)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa331f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r17
	.word 0xa209ab29  ! 1: AND_I	and 	%r6, 0x0b29, %r17
	.word 0xb4a9ede4  ! 1: ANDNcc_I	andncc 	%r7, 0x0de4, %r26
	.word 0xbcb22627  ! 1: ORNcc_I	orncc 	%r8, 0x0627, %r30
thr3_resum_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa088e7be  ! 1: ANDcc_I	andcc 	%r3, 0x07be, %r16
	.word 0xbc40800d  ! 1: ADDC_R	addc 	%r2, %r13, %r30
	.word 0xbcb0c00e  ! 1: ORNcc_R	orncc 	%r3, %r14, %r30
	.word 0xb618c009  ! 1: XOR_R	xor 	%r3, %r9, %r27
thr3_resum_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_93), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_93)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae18c00c  ! 1: XOR_R	xor 	%r3, %r12, %r23
	.word 0xaea9800e  ! 1: ANDNcc_R	andncc 	%r6, %r14, %r23
	.word 0xb000ed45  ! 1: ADD_I	add 	%r3, 0x0d45, %r24
	.word 0xbb782401  ! 1: MOVR_I	move	%r0, 0xd45, %r29
thr3_resum_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae39800e  ! 1: XNOR_R	xnor 	%r6, %r14, %r23
	.word 0xa4b10009  ! 1: ORNcc_R	orncc 	%r4, %r9, %r18
	.word 0xb528c00b  ! 1: SLL_R	sll 	%r3, %r11, %r26
	.word 0xb011800f  ! 1: OR_R	or 	%r6, %r15, %r24
thr3_resum_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_95), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_95)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa211e244  ! 1: OR_I	or 	%r7, 0x0244, %r17
	.word 0xbd30e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r30
	.word 0xaa896a8d  ! 1: ANDcc_I	andcc 	%r5, 0x0a8d, %r21
	.word 0xa8c10009  ! 1: ADDCcc_R	addccc 	%r4, %r9, %r20
thr3_resum_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_96), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_96)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaaa96138  ! 1: ANDNcc_I	andncc 	%r5, 0x0138, %r21
	.word 0xb441400d  ! 1: ADDC_R	addc 	%r5, %r13, %r26
	.word 0xa3315009  ! 1: SRLX_R	srlx	%r5, %r9, %r17
	.word 0xba1a2ed9  ! 1: XOR_I	xor 	%r8, 0x0ed9, %r29
thr3_resum_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_97), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_97)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb88a000a  ! 1: ANDcc_R	andcc 	%r8, %r10, %r28
	.word 0xbd30900e  ! 1: SRLX_R	srlx	%r2, %r14, %r30
	.word 0xa0992a1f  ! 1: XORcc_I	xorcc 	%r4, 0x0a1f, %r16
	.word 0xa019800f  ! 1: XOR_R	xor 	%r6, %r15, %r16
thr3_resum_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa631ef24  ! 1: ORN_I	orn 	%r7, 0x0f24, %r19
	.word 0xa0c0800f  ! 1: ADDCcc_R	addccc 	%r2, %r15, %r16
	.word 0xb491800f  ! 1: ORcc_R	orcc 	%r6, %r15, %r26
	.word 0xa230800e  ! 1: ORN_R	orn 	%r2, %r14, %r17
thr3_resum_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_99), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_99)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe11400b  ! 1: OR_R	or 	%r5, %r11, %r31
	.word 0xa681800d  ! 1: ADDcc_R	addcc 	%r6, %r13, %r19
	.word 0xaaa9e248  ! 1: ANDNcc_I	andncc 	%r7, 0x0248, %r21
	.word 0xa681619d  ! 1: ADDcc_I	addcc 	%r5, 0x019d, %r19
thr3_resum_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_100), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_100)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4a9400f  ! 1: ANDNcc_R	andncc 	%r5, %r15, %r18
	.word 0xa8aa21ff  ! 1: ANDNcc_I	andncc 	%r8, 0x01ff, %r20
	.word 0xa429000e  ! 1: ANDN_R	andn 	%r4, %r14, %r18
	.word 0xb029e981  ! 1: ANDN_I	andn 	%r7, 0x0981, %r24
thr3_resum_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_101), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_101)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b224a8  ! 1: ORNcc_I	orncc 	%r8, 0x04a8, %r24
	.word 0xbb312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r29
	.word 0xbf31d00f  ! 1: SRLX_R	srlx	%r7, %r15, %r31
	.word 0xa739c00c  ! 1: SRA_R	sra 	%r7, %r12, %r19
thr3_resum_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa231a3ab  ! 1: ORN_I	orn 	%r6, 0x03ab, %r17
	.word 0xb932000e  ! 1: SRL_R	srl 	%r8, %r14, %r28
	.word 0xb4322a94  ! 1: ORN_I	orn 	%r8, 0x0a94, %r26
	.word 0xaa19400b  ! 1: XOR_R	xor 	%r5, %r11, %r21
thr3_resum_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_103), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_103)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb729c00b  ! 1: SLL_R	sll 	%r7, %r11, %r27
	.word 0xba32000b  ! 1: ORN_R	orn 	%r8, %r11, %r29
	.word 0xb978040d  ! 1: MOVR_R	move	%r0, %r13, %r28
	.word 0xb69a000a  ! 1: XORcc_R	xorcc 	%r8, %r10, %r27
thr3_resum_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_104), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_104)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8b88009  ! 1: XNORcc_R	xnorcc 	%r2, %r9, %r20
	.word 0xb5315009  ! 1: SRLX_R	srlx	%r5, %r9, %r26
	.word 0xac42000f  ! 1: ADDC_R	addc 	%r8, %r15, %r22
	.word 0xb601c00b  ! 1: ADD_R	add 	%r7, %r11, %r27
thr3_resum_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_105), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_105)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf38c00f  ! 1: SRA_R	sra 	%r3, %r15, %r23
	.word 0xb408800f  ! 1: AND_R	and 	%r2, %r15, %r26
	.word 0xa929500a  ! 1: SLLX_R	sllx	%r5, %r10, %r20
	.word 0xa8896c34  ! 1: ANDcc_I	andcc 	%r5, 0x0c34, %r20
thr3_resum_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_106), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_106)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa699800c  ! 1: XORcc_R	xorcc 	%r6, %r12, %r19
	.word 0xbc19000e  ! 1: XOR_R	xor 	%r4, %r14, %r30
	.word 0xb831e8c4  ! 1: ORN_I	orn 	%r7, 0x08c4, %r28
	.word 0xaa2a2e0e  ! 1: ANDN_I	andn 	%r8, 0x0e0e, %r21
thr3_resum_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf78040c  ! 1: MOVR_R	move	%r0, %r12, %r23
	.word 0xbaa8e250  ! 1: ANDNcc_I	andncc 	%r3, 0x0250, %r29
	.word 0xba922840  ! 1: ORcc_I	orcc 	%r8, 0x0840, %r29
	.word 0xaa00eda1  ! 1: ADD_I	add 	%r3, 0x0da1, %r21
thr3_resum_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_108), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_108)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4096321  ! 1: AND_I	and 	%r5, 0x0321, %r18
	.word 0xbe322040  ! 1: ORN_I	orn 	%r8, 0x0040, %r31
	.word 0xbac162ba  ! 1: ADDCcc_I	addccc 	%r5, 0x02ba, %r29
	.word 0xbc316c6c  ! 1: ORN_I	orn 	%r5, 0x0c6c, %r30
thr3_resum_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_109), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_109)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc3227e3  ! 1: ORN_I	orn 	%r8, 0x07e3, %r30
	.word 0xb888ecd4  ! 1: ANDcc_I	andcc 	%r3, 0x0cd4, %r28
	.word 0xb929a001  ! 1: SLL_I	sll 	%r6, 0x0001, %r28
	.word 0xae90a3a8  ! 1: ORcc_I	orcc 	%r2, 0x03a8, %r23
thr3_resum_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_110), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_110)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb931500f  ! 1: SRLX_R	srlx	%r5, %r15, %r28
	.word 0xa9641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbd296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r30
	.word 0xb530d00b  ! 1: SRLX_R	srlx	%r3, %r11, %r26
thr3_resum_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb528a001  ! 1: SLL_I	sll 	%r2, 0x0001, %r26
	.word 0xad38a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r22
	.word 0xb080c009  ! 1: ADDcc_R	addcc 	%r3, %r9, %r24
	.word 0xa1782401  ! 1: MOVR_I	move	%r0, 0x9, %r16
thr3_resum_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_112), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_112)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb028800e  ! 1: ANDN_R	andn 	%r2, %r14, %r24
	.word 0xb829e411  ! 1: ANDN_I	andn 	%r7, 0x0411, %r28
	.word 0xab2a2001  ! 1: SLL_I	sll 	%r8, 0x0001, %r21
	.word 0xac418009  ! 1: ADDC_R	addc 	%r6, %r9, %r22
thr3_resum_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_113), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_113)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa038a543  ! 1: XNOR_I	xnor 	%r2, 0x0543, %r16
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa8022602  ! 1: ADD_I	add 	%r8, 0x0602, %r20
	.word 0xa231000e  ! 1: ORN_R	orn 	%r4, %r14, %r17
thr3_resum_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_114), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_114)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd29b001  ! 1: SLLX_I	sllx	%r6, 0x0001, %r30
	.word 0xb330d00a  ! 1: SRLX_R	srlx	%r3, %r10, %r25
	.word 0xb5782401  ! 1: MOVR_I	move	%r0, 0xa, %r26
	.word 0xa928d009  ! 1: SLLX_R	sllx	%r3, %r9, %r20
thr3_resum_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_115), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_115)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa68162be  ! 1: ADDcc_I	addcc 	%r5, 0x02be, %r19
	.word 0xb889c00f  ! 1: ANDcc_R	andcc 	%r7, %r15, %r28
	.word 0xb009800a  ! 1: AND_R	and 	%r6, %r10, %r24
thr3_resum_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_116), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_116)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba12277c  ! 1: OR_I	or 	%r8, 0x077c, %r29
	.word 0xa00124ad  ! 1: ADD_I	add 	%r4, 0x04ad, %r16
	.word 0xb818800d  ! 1: XOR_R	xor 	%r2, %r13, %r28
	.word 0xb2c0800b  ! 1: ADDCcc_R	addccc 	%r2, %r11, %r25
thr3_resum_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_117), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_117)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae91400f  ! 1: ORcc_R	orcc 	%r5, %r15, %r23
	.word 0xaa01c00c  ! 1: ADD_R	add 	%r7, %r12, %r21
	.word 0xb938e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r28
	.word 0xbe98c00c  ! 1: XORcc_R	xorcc 	%r3, %r12, %r31
thr3_resum_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_118), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_118)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa401800c  ! 1: ADD_R	add 	%r6, %r12, %r18
	.word 0xb241000e  ! 1: ADDC_R	addc 	%r4, %r14, %r25
	.word 0xa7309009  ! 1: SRLX_R	srlx	%r2, %r9, %r19
	.word 0xb3308009  ! 1: SRL_R	srl 	%r2, %r9, %r25
thr3_resum_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_119), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_119)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacc0c00b  ! 1: ADDCcc_R	addccc 	%r3, %r11, %r22
	.word 0xbea96ff3  ! 1: ANDNcc_I	andncc 	%r5, 0x0ff3, %r31
	.word 0xba91274b  ! 1: ORcc_I	orcc 	%r4, 0x074b, %r29
	.word 0xbc9964cf  ! 1: XORcc_I	xorcc 	%r5, 0x04cf, %r30
thr3_resum_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_120), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_120)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8892ad0  ! 1: ANDcc_I	andcc 	%r4, 0x0ad0, %r20
	.word 0xa730a001  ! 1: SRL_I	srl 	%r2, 0x0001, %r19
	.word 0xbe11800f  ! 1: OR_R	or 	%r6, %r15, %r31
	.word 0xb8a92d40  ! 1: ANDNcc_I	andncc 	%r4, 0x0d40, %r28
thr3_resum_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa041c00a  ! 1: ADDC_R	addc 	%r7, %r10, %r16
	.word 0xb32a100d  ! 1: SLLX_R	sllx	%r8, %r13, %r25
	.word 0xb2b8e239  ! 1: XNORcc_I	xnorcc 	%r3, 0x0239, %r25
	.word 0xbc3125f6  ! 1: ORN_I	orn 	%r4, 0x05f6, %r30
thr3_resum_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_122), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_122)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaeb18009  ! 1: ORNcc_R	orncc 	%r6, %r9, %r23
	.word 0xa0088009  ! 1: AND_R	and 	%r2, %r9, %r16
	.word 0xa441000f  ! 1: ADDC_R	addc 	%r4, %r15, %r18
	.word 0xa8394009  ! 1: XNOR_R	xnor 	%r5, %r9, %r20
thr3_resum_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_123), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_123)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbcba000d  ! 1: XNORcc_R	xnorcc 	%r8, %r13, %r30
	.word 0xab38c00c  ! 1: SRA_R	sra 	%r3, %r12, %r21
	.word 0xa329000e  ! 1: SLL_R	sll 	%r4, %r14, %r17
	.word 0xa410adde  ! 1: OR_I	or 	%r2, 0x0dde, %r18
thr3_resum_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_124), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_124)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab38e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r21
	.word 0xa80922b1  ! 1: AND_I	and 	%r4, 0x02b1, %r20
	.word 0xba112cca  ! 1: OR_I	or 	%r4, 0x0cca, %r29
	.word 0xac096fe9  ! 1: AND_I	and 	%r5, 0x0fe9, %r22
thr3_resum_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa41800d  ! 1: ADDC_R	addc 	%r6, %r13, %r21
	.word 0xaf292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r23
	.word 0xbf29f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r31
	.word 0xb7297001  ! 1: SLLX_I	sllx	%r5, 0x0001, %r27
thr3_resum_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_126), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_126)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb531100e  ! 1: SRLX_R	srlx	%r4, %r14, %r26
	.word 0xaa810009  ! 1: ADDcc_R	addcc 	%r4, %r9, %r21
	.word 0xb164180f  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac29c00a  ! 1: ANDN_R	andn 	%r7, %r10, %r22
thr3_resum_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_127), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_127)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa3317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r17
	.word 0xb088c00c  ! 1: ANDcc_R	andcc 	%r3, %r12, %r24
	.word 0xbe81e030  ! 1: ADDcc_I	addcc 	%r7, 0x0030, %r31
	.word 0xbeb22c96  ! 1: ORNcc_I	orncc 	%r8, 0x0c96, %r31
thr3_resum_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_128), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_128)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa7316001  ! 1: SRL_I	srl 	%r5, 0x0001, %r19
	.word 0xb492000c  ! 1: ORcc_R	orcc 	%r8, %r12, %r26
	.word 0xba91800f  ! 1: ORcc_R	orcc 	%r6, %r15, %r29
	.word 0xa0a92138  ! 1: ANDNcc_I	andncc 	%r4, 0x0138, %r16
thr3_resum_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa241c00f  ! 1: ADDC_R	addc 	%r7, %r15, %r17
	.word 0xb8290009  ! 1: ANDN_R	andn 	%r4, %r9, %r28
	.word 0xa4b1c00e  ! 1: ORNcc_R	orncc 	%r7, %r14, %r18
	.word 0xa3298009  ! 1: SLL_R	sll 	%r6, %r9, %r17
thr3_resum_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_130), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_130)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb8b0800a  ! 1: ORNcc_R	orncc 	%r2, %r10, %r28
	.word 0xbb64180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb12a2001  ! 1: SLL_I	sll 	%r8, 0x0001, %r24
	.word 0xb6c0c009  ! 1: ADDCcc_R	addccc 	%r3, %r9, %r27
thr3_resum_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa230a7c9  ! 1: ORN_I	orn 	%r2, 0x07c9, %r17
	.word 0xa8914009  ! 1: ORcc_R	orcc 	%r5, %r9, %r20
	.word 0xa02a2a74  ! 1: ANDN_I	andn 	%r8, 0x0a74, %r16
	.word 0xa931500c  ! 1: SRLX_R	srlx	%r5, %r12, %r20
thr3_resum_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_132), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_132)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb329400f  ! 1: SLL_R	sll 	%r5, %r15, %r25
	.word 0xaf782401  ! 1: MOVR_I	move	%r0, 0xf, %r23
	.word 0xba99400a  ! 1: XORcc_R	xorcc 	%r5, %r10, %r29
	.word 0xa129e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r16
thr3_resum_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_133), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_133)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab39400f  ! 1: SRA_R	sra 	%r5, %r15, %r21
	.word 0xb729000a  ! 1: SLL_R	sll 	%r4, %r10, %r27
	.word 0xa0996987  ! 1: XORcc_I	xorcc 	%r5, 0x0987, %r16
	.word 0xb929c00a  ! 1: SLL_R	sll 	%r7, %r10, %r28
thr3_resum_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_134), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_134)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacb0c00e  ! 1: ORNcc_R	orncc 	%r3, %r14, %r22
	.word 0xa880c00e  ! 1: ADDcc_R	addcc 	%r3, %r14, %r20
	.word 0xaca8800e  ! 1: ANDNcc_R	andncc 	%r2, %r14, %r22
	.word 0xb8322b98  ! 1: ORN_I	orn 	%r8, 0x0b98, %r28
thr3_resum_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_135), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_135)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe8162c1  ! 1: ADDcc_I	addcc 	%r5, 0x02c1, %r31
	.word 0xae00c00f  ! 1: ADD_R	add 	%r3, %r15, %r23
	.word 0xb61a000d  ! 1: XOR_R	xor 	%r8, %r13, %r27
	.word 0xac31a8ab  ! 1: ORN_I	orn 	%r6, 0x08ab, %r22
thr3_resum_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_136), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_136)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2ba000b  ! 1: XNORcc_R	xnorcc 	%r8, %r11, %r25
	.word 0xbb64180e  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbcc1c00d  ! 1: ADDCcc_R	addccc 	%r7, %r13, %r30
	.word 0xb69924dd  ! 1: XORcc_I	xorcc 	%r4, 0x04dd, %r27
thr3_resum_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_137), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_137)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb428ed4f  ! 1: ANDN_I	andn 	%r3, 0x0d4f, %r26
	.word 0xa419800f  ! 1: XOR_R	xor 	%r6, %r15, %r18
	.word 0xb4b0c00e  ! 1: ORNcc_R	orncc 	%r3, %r14, %r26
	.word 0xb28a2946  ! 1: ANDcc_I	andcc 	%r8, 0x0946, %r25
thr3_resum_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_138), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_138)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb408a451  ! 1: AND_I	and 	%r2, 0x0451, %r26
	.word 0xa638e534  ! 1: XNOR_I	xnor 	%r3, 0x0534, %r19
	.word 0xa200800f  ! 1: ADD_R	add 	%r2, %r15, %r17
	.word 0xa764180e  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_139), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_139)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0c1000e  ! 1: ADDCcc_R	addccc 	%r4, %r14, %r24
	.word 0xbcba2a7a  ! 1: XNORcc_I	xnorcc 	%r8, 0x0a7a, %r30
	.word 0xac88c00b  ! 1: ANDcc_R	andcc 	%r3, %r11, %r22
	.word 0xac38e798  ! 1: XNOR_I	xnor 	%r3, 0x0798, %r22
thr3_resum_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_140), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_140)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0ba000d  ! 1: XNORcc_R	xnorcc 	%r8, %r13, %r16
	.word 0xb69a23ff  ! 1: XORcc_I	xorcc 	%r8, 0x03ff, %r27
	.word 0xa73a100b  ! 1: SRAX_R	srax	%r8, %r11, %r19
	.word 0xbaa9ac18  ! 1: ANDNcc_I	andncc 	%r6, 0x0c18, %r29
thr3_resum_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_141), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_141)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb681e291  ! 1: ADDcc_I	addcc 	%r7, 0x0291, %r27
	.word 0xa778040f  ! 1: MOVR_R	move	%r0, %r15, %r19
	.word 0xacc1400c  ! 1: ADDCcc_R	addccc 	%r5, %r12, %r22
	.word 0xa4896a5b  ! 1: ANDcc_I	andcc 	%r5, 0x0a5b, %r18
thr3_resum_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_142), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_142)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r22
	.word 0xab322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r21
	.word 0xb4aa2968  ! 1: ANDNcc_I	andncc 	%r8, 0x0968, %r26
	.word 0xbd78040d  ! 1: MOVR_R	move	%r0, %r13, %r30
thr3_resum_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_143), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_143)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa31ec44  ! 1: ORN_I	orn 	%r7, 0x0c44, %r21
	.word 0xb129a001  ! 1: SLL_I	sll 	%r6, 0x0001, %r24
	.word 0xbac12894  ! 1: ADDCcc_I	addccc 	%r4, 0x0894, %r29
	.word 0xb0416517  ! 1: ADDC_I	addc 	%r5, 0x0517, %r24
thr3_resum_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb78040c  ! 1: MOVR_R	move	%r0, %r12, %r29
	.word 0xbe30800d  ! 1: ORN_R	orn 	%r2, %r13, %r31
	.word 0xb690ea7d  ! 1: ORcc_I	orcc 	%r3, 0x0a7d, %r27
	.word 0xb730900e  ! 1: SRLX_R	srlx	%r2, %r14, %r27
thr3_resum_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_145), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_145)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa7782401  ! 1: MOVR_I	move	%r0, 0xe, %r19
	.word 0xb72a2001  ! 1: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0xb228c00c  ! 1: ANDN_R	andn 	%r3, %r12, %r25
	.word 0xa2012fb7  ! 1: ADD_I	add 	%r4, 0x0fb7, %r17
thr3_resum_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_146), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_146)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb090c00c  ! 1: ORcc_R	orcc 	%r3, %r12, %r24
	.word 0xb3641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb131500c  ! 1: SRLX_R	srlx	%r5, %r12, %r24
thr3_resum_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_147), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_147)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb930c00e  ! 1: SRL_R	srl 	%r3, %r14, %r28
	.word 0xb539c009  ! 1: SRA_R	sra 	%r7, %r9, %r26
	.word 0xb6b0ac03  ! 1: ORNcc_I	orncc 	%r2, 0x0c03, %r27
	.word 0xb2912c3e  ! 1: ORcc_I	orcc 	%r4, 0x0c3e, %r25
thr3_resum_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_148), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_148)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb528e001  ! 1: SLL_I	sll 	%r3, 0x0001, %r26
	.word 0xb801acce  ! 1: ADD_I	add 	%r6, 0x0cce, %r28
	.word 0xa431adb6  ! 1: ORN_I	orn 	%r6, 0x0db6, %r18
	.word 0xa429000a  ! 1: ANDN_R	andn 	%r4, %r10, %r18
thr3_resum_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0020009  ! 1: ADD_R	add 	%r8, %r9, %r16
	.word 0xa2a9000d  ! 1: ANDNcc_R	andncc 	%r4, %r13, %r17
	.word 0xb40168ff  ! 1: ADD_I	add 	%r5, 0x08ff, %r26
	.word 0xb601c00f  ! 1: ADD_R	add 	%r7, %r15, %r27
thr3_resum_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_150), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_150)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbab0a8b1  ! 1: ORNcc_I	orncc 	%r2, 0x08b1, %r29
	.word 0xaca8af81  ! 1: ANDNcc_I	andncc 	%r2, 0x0f81, %r22
	.word 0xba290009  ! 1: ANDN_R	andn 	%r4, %r9, %r29
	.word 0xbe91400c  ! 1: ORcc_R	orcc 	%r5, %r12, %r31
thr3_resum_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_151), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_151)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb31b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r29
	.word 0xa829ac39  ! 1: ANDN_I	andn 	%r6, 0x0c39, %r20
	.word 0xbc39e6ac  ! 1: XNOR_I	xnor 	%r7, 0x06ac, %r30
	.word 0xb4b9afe5  ! 1: XNORcc_I	xnorcc 	%r6, 0x0fe5, %r26
thr3_resum_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_152), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_152)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb442000a  ! 1: ADDC_R	addc 	%r8, %r10, %r26
	.word 0xb931900e  ! 1: SRLX_R	srlx	%r6, %r14, %r28
	.word 0xa4b96ece  ! 1: XNORcc_I	xnorcc 	%r5, 0x0ece, %r18
	.word 0xaaa96ea2  ! 1: ANDNcc_I	andncc 	%r5, 0x0ea2, %r21
thr3_resum_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_153), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_153)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe40800b  ! 1: ADDC_R	addc 	%r2, %r11, %r31
	.word 0xb5296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r26
	.word 0xa931900c  ! 1: SRLX_R	srlx	%r6, %r12, %r20
	.word 0xbc118009  ! 1: OR_R	or 	%r6, %r9, %r30
thr3_resum_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_154), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_154)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb3296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r25
	.word 0xac31c00c  ! 1: ORN_R	orn 	%r7, %r12, %r22
	.word 0xb2396657  ! 1: XNOR_I	xnor 	%r5, 0x0657, %r25
	.word 0xa331b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r17
thr3_resum_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_155), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_155)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf39500f  ! 1: SRAX_R	srax	%r5, %r15, %r23
	.word 0xa539000b  ! 1: SRA_R	sra 	%r4, %r11, %r18
	.word 0xa930f001  ! 1: SRLX_I	srlx	%r3, 0x0001, %r20
	.word 0xaa11400c  ! 1: OR_R	or 	%r5, %r12, %r21
thr3_resum_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_156), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_156)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb13a100d  ! 1: SRAX_R	srax	%r8, %r13, %r24
	.word 0xac11800a  ! 1: OR_R	or 	%r6, %r10, %r22
	.word 0xbf29000c  ! 1: SLL_R	sll 	%r4, %r12, %r31
	.word 0xa339800a  ! 1: SRA_R	sra 	%r6, %r10, %r17
thr3_resum_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_157), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_157)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb881ec70  ! 1: ADDcc_I	addcc 	%r7, 0x0c70, %r28
	.word 0xa691eb93  ! 1: ORcc_I	orcc 	%r7, 0x0b93, %r19
	.word 0xa731d00b  ! 1: SRLX_R	srlx	%r7, %r11, %r19
	.word 0xb0096f48  ! 1: AND_I	and 	%r5, 0x0f48, %r24
thr3_resum_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa698a112  ! 1: XORcc_I	xorcc 	%r2, 0x0112, %r19
	.word 0xa9292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r20
	.word 0xa0916ca1  ! 1: ORcc_I	orcc 	%r5, 0x0ca1, %r16
	.word 0xba80afe7  ! 1: ADDcc_I	addcc 	%r2, 0x0fe7, %r29
thr3_resum_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_159), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_159)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf39100d  ! 1: SRAX_R	srax	%r4, %r13, %r23
	.word 0xb838aba6  ! 1: XNOR_I	xnor 	%r2, 0x0ba6, %r28
	.word 0xa641800c  ! 1: ADDC_R	addc 	%r6, %r12, %r19
	.word 0xb4816643  ! 1: ADDcc_I	addcc 	%r5, 0x0643, %r26
thr3_resum_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_160), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_160)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb092000c  ! 1: ORcc_R	orcc 	%r8, %r12, %r24
	.word 0xa52a000b  ! 1: SLL_R	sll 	%r8, %r11, %r18
	.word 0xa8c1c00a  ! 1: ADDCcc_R	addccc 	%r7, %r10, %r20
thr3_resum_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_161), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_161)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa019c00a  ! 1: XOR_R	xor 	%r7, %r10, %r16
	.word 0xba994009  ! 1: XORcc_R	xorcc 	%r5, %r9, %r29
	.word 0xa7292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r19
	.word 0xb4896c8c  ! 1: ANDcc_I	andcc 	%r5, 0x0c8c, %r26
thr3_resum_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_162), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_162)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa93a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r20
	.word 0xb209800d  ! 1: AND_R	and 	%r6, %r13, %r25
	.word 0xbe01800c  ! 1: ADD_R	add 	%r6, %r12, %r31
	.word 0xa210ea68  ! 1: OR_I	or 	%r3, 0x0a68, %r17
thr3_resum_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb1641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa72a3001  ! 1: SLLX_I	sllx	%r8, 0x0001, %r19
	.word 0xa838e4cd  ! 1: XNOR_I	xnor 	%r3, 0x04cd, %r20
	.word 0xba98800a  ! 1: XORcc_R	xorcc 	%r2, %r10, %r29
thr3_resum_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_164), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_164)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf64180a  ! 1: MOVcc_R	<illegal instruction>
	.word 0xae99000c  ! 1: XORcc_R	xorcc 	%r4, %r12, %r23
	.word 0xb931100a  ! 1: SRLX_R	srlx	%r4, %r10, %r28
	.word 0xac81c00f  ! 1: ADDcc_R	addcc 	%r7, %r15, %r22
thr3_resum_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_165), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_165)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb009ef88  ! 1: AND_I	and 	%r7, 0x0f88, %r24
	.word 0xbb39000b  ! 1: SRA_R	sra 	%r4, %r11, %r29
	.word 0xab78040d  ! 1: MOVR_R	move	%r0, %r13, %r21
	.word 0xb4a8e0a3  ! 1: ANDNcc_I	andncc 	%r3, 0x00a3, %r26
thr3_resum_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb892000f  ! 1: ORcc_R	orcc 	%r8, %r15, %r28
	.word 0xb729e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r27
	.word 0xb290800a  ! 1: ORcc_R	orcc 	%r2, %r10, %r25
	.word 0xa229e574  ! 1: ANDN_I	andn 	%r7, 0x0574, %r17
thr3_resum_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_167), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_167)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad28d00c  ! 1: SLLX_R	sllx	%r3, %r12, %r22
	.word 0xaa18c00a  ! 1: XOR_R	xor 	%r3, %r10, %r21
	.word 0xa4012520  ! 1: ADD_I	add 	%r4, 0x0520, %r18
	.word 0xa88a27b5  ! 1: ANDcc_I	andcc 	%r8, 0x07b5, %r20
thr3_resum_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa6b9a0ec  ! 1: XNORcc_I	xnorcc 	%r6, 0x00ec, %r19
	.word 0xb031000c  ! 1: ORN_R	orn 	%r4, %r12, %r24
	.word 0xac30a066  ! 1: ORN_I	orn 	%r2, 0x0066, %r22
	.word 0xbeb9800a  ! 1: XNORcc_R	xnorcc 	%r6, %r10, %r31
thr3_resum_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_169), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_169)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab64180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa730d00a  ! 1: SRLX_R	srlx	%r3, %r10, %r19
	.word 0xa732100e  ! 1: SRLX_R	srlx	%r8, %r14, %r19
	.word 0xb209400c  ! 1: AND_R	and 	%r5, %r12, %r25
thr3_resum_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb528f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r26
	.word 0xb1780409  ! 1: MOVR_R	move	%r0, %r9, %r24
	.word 0xa1782401  ! 1: MOVR_I	move	%r0, 0x1, %r16
	.word 0xae01c009  ! 1: ADD_R	add 	%r7, %r9, %r23
thr3_resum_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_171), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_171)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac32000b  ! 1: ORN_R	orn 	%r8, %r11, %r22
	.word 0xb610c00f  ! 1: OR_R	or 	%r3, %r15, %r27
	.word 0xb642000f  ! 1: ADDC_R	addc 	%r8, %r15, %r27
	.word 0xaa998009  ! 1: XORcc_R	xorcc 	%r6, %r9, %r21
thr3_resum_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_172), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_172)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xbf38d00b  ! 1: SRAX_R	srax	%r3, %r11, %r31
	.word 0xa32a3001  ! 1: SLLX_I	sllx	%r8, 0x0001, %r17
	.word 0xa139d00a  ! 1: SRAX_R	srax	%r7, %r10, %r16
thr3_resum_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_173), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_173)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaaa9c00e  ! 1: ANDNcc_R	andncc 	%r7, %r14, %r21
	.word 0xb978040d  ! 1: MOVR_R	move	%r0, %r13, %r28
	.word 0xab297001  ! 1: SLLX_I	sllx	%r5, 0x0001, %r21
	.word 0xb1313001  ! 1: SRLX_I	srlx	%r4, 0x0001, %r24
thr3_resum_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_174), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_174)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb029aed6  ! 1: ANDN_I	andn 	%r6, 0x0ed6, %r24
	.word 0xa8b8e9e7  ! 1: XNORcc_I	xnorcc 	%r3, 0x09e7, %r20
	.word 0xaf78040e  ! 1: MOVR_R	move	%r0, %r14, %r23
	.word 0xb2b1a422  ! 1: ORNcc_I	orncc 	%r6, 0x0422, %r25
thr3_resum_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd31a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r30
	.word 0xa6ba2cc6  ! 1: XNORcc_I	xnorcc 	%r8, 0x0cc6, %r19
	.word 0xa4b96ec7  ! 1: XNORcc_I	xnorcc 	%r5, 0x0ec7, %r18
	.word 0xa699ebca  ! 1: XORcc_I	xorcc 	%r7, 0x0bca, %r19
thr3_resum_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_176), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_176)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa1643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa829c00f  ! 1: ANDN_R	andn 	%r7, %r15, %r20
	.word 0xac89eda7  ! 1: ANDcc_I	andcc 	%r7, 0x0da7, %r22
	.word 0xa41a0009  ! 1: XOR_R	xor 	%r8, %r9, %r18
thr3_resum_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_177), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_177)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbac22f43  ! 1: ADDCcc_I	addccc 	%r8, 0x0f43, %r29
	.word 0xba422ad0  ! 1: ADDC_I	addc 	%r8, 0x0ad0, %r29
	.word 0xb601e214  ! 1: ADD_I	add 	%r7, 0x0214, %r27
	.word 0xa531e001  ! 1: SRL_I	srl 	%r7, 0x0001, %r18
thr3_resum_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb001c00d  ! 1: ADD_R	add 	%r7, %r13, %r24
	.word 0xaf29a001  ! 1: SLL_I	sll 	%r6, 0x0001, %r23
	.word 0xa238e593  ! 1: XNOR_I	xnor 	%r3, 0x0593, %r17
	.word 0xaa19c00d  ! 1: XOR_R	xor 	%r7, %r13, %r21
thr3_resum_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_179), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_179)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb3782401  ! 1: MOVR_I	move	%r0, 0xd, %r25
	.word 0xb018e1c8  ! 1: XOR_I	xor 	%r3, 0x01c8, %r24
	.word 0xa538900e  ! 1: SRAX_R	srax	%r2, %r14, %r18
	.word 0xa0b0ead1  ! 1: ORNcc_I	orncc 	%r3, 0x0ad1, %r16
thr3_resum_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb129800c  ! 1: SLL_R	sll 	%r6, %r12, %r24
	.word 0xaca8c00d  ! 1: ANDNcc_R	andncc 	%r3, %r13, %r22
	.word 0xbc1a201b  ! 1: XOR_I	xor 	%r8, 0x001b, %r30
	.word 0xb6b1000b  ! 1: ORNcc_R	orncc 	%r4, %r11, %r27
thr3_resum_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_181), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_181)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa529e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r18
	.word 0xb091eeb5  ! 1: ORcc_I	orcc 	%r7, 0x0eb5, %r24
	.word 0xb819000d  ! 1: XOR_R	xor 	%r4, %r13, %r28
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_182), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_182)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb8822fa4  ! 1: ADDcc_I	addcc 	%r8, 0x0fa4, %r28
	.word 0xb928900e  ! 1: SLLX_R	sllx	%r2, %r14, %r28
	.word 0xbc91000b  ! 1: ORcc_R	orcc 	%r4, %r11, %r30
	.word 0xad39900f  ! 1: SRAX_R	srax	%r6, %r15, %r22
thr3_resum_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_183), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_183)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa48965c5  ! 1: ANDcc_I	andcc 	%r5, 0x05c5, %r18
	.word 0xbaba2cf9  ! 1: XNORcc_I	xnorcc 	%r8, 0x0cf9, %r29
	.word 0xb499800a  ! 1: XORcc_R	xorcc 	%r6, %r10, %r26
	.word 0xaf780409  ! 1: MOVR_R	move	%r0, %r9, %r23
thr3_resum_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_184), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_184)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa481edf1  ! 1: ADDcc_I	addcc 	%r7, 0x0df1, %r18
	.word 0xa764180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa378040a  ! 1: MOVR_R	move	%r0, %r10, %r17
	.word 0xad31c00d  ! 1: SRL_R	srl 	%r7, %r13, %r22
thr3_resum_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_185), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_185)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb890e248  ! 1: ORcc_I	orcc 	%r3, 0x0248, %r28
	.word 0xbe29c00f  ! 1: ANDN_R	andn 	%r7, %r15, %r31
	.word 0xb4892386  ! 1: ANDcc_I	andcc 	%r4, 0x0386, %r26
	.word 0xa428ad54  ! 1: ANDN_I	andn 	%r2, 0x0d54, %r18
thr3_resum_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_186), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_186)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb738900c  ! 1: SRAX_R	srax	%r2, %r12, %r27
	.word 0xa0aa000c  ! 1: ANDNcc_R	andncc 	%r8, %r12, %r16
	.word 0xbe40c009  ! 1: ADDC_R	addc 	%r3, %r9, %r31
	.word 0xa4296ae0  ! 1: ANDN_I	andn 	%r5, 0x0ae0, %r18
thr3_resum_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaea92176  ! 1: ANDNcc_I	andncc 	%r4, 0x0176, %r23
	.word 0xba09ed32  ! 1: AND_I	and 	%r7, 0x0d32, %r29
	.word 0xa829e03c  ! 1: ANDN_I	andn 	%r7, 0x003c, %r20
	.word 0xb529900d  ! 1: SLLX_R	sllx	%r6, %r13, %r26
thr3_resum_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_188), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_188)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb3317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r25
	.word 0xbe39c00e  ! 1: XNOR_R	xnor 	%r7, %r14, %r31
	.word 0xad30a001  ! 1: SRL_I	srl 	%r2, 0x0001, %r22
	.word 0xad29a001  ! 1: SLL_I	sll 	%r6, 0x0001, %r22
thr3_resum_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_189), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_189)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe91800b  ! 1: ORcc_R	orcc 	%r6, %r11, %r31
	.word 0xbb28900d  ! 1: SLLX_R	sllx	%r2, %r13, %r29
	.word 0xb092000b  ! 1: ORcc_R	orcc 	%r8, %r11, %r24
	.word 0xba28ad61  ! 1: ANDN_I	andn 	%r2, 0x0d61, %r29
thr3_resum_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_190), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_190)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb738a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r27
	.word 0xa6c1c00e  ! 1: ADDCcc_R	addccc 	%r7, %r14, %r19
	.word 0xa0a9e60d  ! 1: ANDNcc_I	andncc 	%r7, 0x060d, %r16
	.word 0xb410e120  ! 1: OR_I	or 	%r3, 0x0120, %r26
thr3_resum_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_191), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_191)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaac2000f  ! 1: ADDCcc_R	addccc 	%r8, %r15, %r21
	.word 0xa130b001  ! 1: SRLX_I	srlx	%r2, 0x0001, %r16
	.word 0xb929500f  ! 1: SLLX_R	sllx	%r5, %r15, %r28
	.word 0xb178040d  ! 1: MOVR_R	move	%r0, %r13, %r24
thr3_resum_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_192), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_192)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac88800a  ! 1: ANDcc_R	andcc 	%r2, %r10, %r22
	.word 0xa5288009  ! 1: SLL_R	sll 	%r2, %r9, %r18
	.word 0xa2b227b6  ! 1: ORNcc_I	orncc 	%r8, 0x07b6, %r17
	.word 0xb3782401  ! 1: MOVR_I	move	%r0, 0xffffffb6, %r25
thr3_resum_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa881400c  ! 1: ADDcc_R	addcc 	%r5, %r12, %r20
	.word 0xac91a91a  ! 1: ORcc_I	orcc 	%r6, 0x091a, %r22
	.word 0xbb292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r29
	.word 0xb01121ee  ! 1: OR_I	or 	%r4, 0x01ee, %r24
thr3_resum_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_194), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_194)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb338d009  ! 1: SRAX_R	srax	%r3, %r9, %r25
	.word 0xb964180f  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbf782401  ! 1: MOVR_I	move	%r0, 0x9, %r31
	.word 0xa82a000c  ! 1: ANDN_R	andn 	%r8, %r12, %r20
thr3_resum_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_195), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_195)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8c0a744  ! 1: ADDCcc_I	addccc 	%r2, 0x0744, %r20
	.word 0xbca8a0bd  ! 1: ANDNcc_I	andncc 	%r2, 0x00bd, %r30
	.word 0xa529a001  ! 1: SLL_I	sll 	%r6, 0x0001, %r18
	.word 0xae8a000e  ! 1: ANDcc_R	andcc 	%r8, %r14, %r23
thr3_resum_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa378040f  ! 1: MOVR_R	move	%r0, %r15, %r17
	.word 0xaac1400b  ! 1: ADDCcc_R	addccc 	%r5, %r11, %r21
	.word 0xa480e6e6  ! 1: ADDcc_I	addcc 	%r3, 0x06e6, %r18
	.word 0xb8b0ed27  ! 1: ORNcc_I	orncc 	%r3, 0x0d27, %r28
thr3_resum_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_197), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_197)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe80eb09  ! 1: ADDcc_I	addcc 	%r3, 0x0b09, %r31
	.word 0xa8a9287c  ! 1: ANDNcc_I	andncc 	%r4, 0x087c, %r20
	.word 0xa0b9000a  ! 1: XNORcc_R	xnorcc 	%r4, %r10, %r16
	.word 0xa6822243  ! 1: ADDcc_I	addcc 	%r8, 0x0243, %r19
thr3_resum_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac1a2fdf  ! 1: XOR_I	xor 	%r8, 0x0fdf, %r22
	.word 0xbb643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb8b8a46e  ! 1: XNORcc_I	xnorcc 	%r2, 0x046e, %r28
	.word 0xa578040f  ! 1: MOVR_R	move	%r0, %r15, %r18
thr3_resum_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_199), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_199)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb61a21f0  ! 1: XOR_I	xor 	%r8, 0x01f0, %r27
	.word 0xa72a100e  ! 1: SLLX_R	sllx	%r8, %r14, %r19
	.word 0xa931500a  ! 1: SRLX_R	srlx	%r5, %r10, %r20
	.word 0xb0a96be6  ! 1: ANDNcc_I	andncc 	%r5, 0x0be6, %r24
thr3_resum_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_200), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_200)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb3782401  ! 1: MOVR_I	move	%r0, 0xffffffe6, %r25
	.word 0xa3782401  ! 1: MOVR_I	move	%r0, 0xffffffe6, %r17
	.word 0xa8820009  ! 1: ADDcc_R	addcc 	%r8, %r9, %r20
	.word 0xae91a315  ! 1: ORcc_I	orcc 	%r6, 0x0315, %r23
thr3_resum_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_201), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_201)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb328f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r25
	.word 0xb090800b  ! 1: ORcc_R	orcc 	%r2, %r11, %r24
	.word 0xab32000f  ! 1: SRL_R	srl 	%r8, %r15, %r21
	.word 0xb4122383  ! 1: OR_I	or 	%r8, 0x0383, %r26
thr3_resum_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_202), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_202)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b1400d  ! 1: ORNcc_R	orncc 	%r5, %r13, %r24
	.word 0xab316001  ! 1: SRL_I	srl 	%r5, 0x0001, %r21
	.word 0xb3293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r25
	.word 0xa4022136  ! 1: ADD_I	add 	%r8, 0x0136, %r18
thr3_resum_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_203), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_203)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb041ef92  ! 1: ADDC_I	addc 	%r7, 0x0f92, %r24
	.word 0xb498800c  ! 1: XORcc_R	xorcc 	%r2, %r12, %r26
	.word 0xa2a8ab7b  ! 1: ANDNcc_I	andncc 	%r2, 0x0b7b, %r17
	.word 0xbb3a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r29
thr3_resum_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa02925a0  ! 1: ANDN_I	andn 	%r4, 0x05a0, %r16
	.word 0xb629800b  ! 1: ANDN_R	andn 	%r6, %r11, %r27
	.word 0xbe41000c  ! 1: ADDC_R	addc 	%r4, %r12, %r31
	.word 0xaea94009  ! 1: ANDNcc_R	andncc 	%r5, %r9, %r23
thr3_resum_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_205), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_205)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac30ed79  ! 1: ORN_I	orn 	%r3, 0x0d79, %r22
	.word 0xb8918009  ! 1: ORcc_R	orcc 	%r6, %r9, %r28
	.word 0xb629e081  ! 1: ANDN_I	andn 	%r7, 0x0081, %r27
	.word 0xac98a099  ! 1: XORcc_I	xorcc 	%r2, 0x0099, %r22
thr3_resum_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae19c00e  ! 1: XOR_R	xor 	%r7, %r14, %r23
	.word 0xbca8800c  ! 1: ANDNcc_R	andncc 	%r2, %r12, %r30
	.word 0xac90800f  ! 1: ORcc_R	orcc 	%r2, %r15, %r22
	.word 0xba020009  ! 1: ADD_R	add 	%r8, %r9, %r29
thr3_resum_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_207), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_207)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c2000f  ! 1: ADDCcc_R	addccc 	%r8, %r15, %r25
	.word 0xb099000f  ! 1: XORcc_R	xorcc 	%r4, %r15, %r24
	.word 0xb1782401  ! 1: MOVR_I	move	%r0, 0xf, %r24
	.word 0xb011000e  ! 1: OR_R	or 	%r4, %r14, %r24
thr3_resum_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_208), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_208)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa400efc8  ! 1: ADD_I	add 	%r3, 0x0fc8, %r18
	.word 0xb240a23c  ! 1: ADDC_I	addc 	%r2, 0x023c, %r25
	.word 0xac31add7  ! 1: ORN_I	orn 	%r6, 0x0dd7, %r22
	.word 0xa831400d  ! 1: ORN_R	orn 	%r5, %r13, %r20
thr3_resum_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_209), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_209)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe296c0e  ! 1: ANDN_I	andn 	%r5, 0x0c0e, %r31
	.word 0xab38c00a  ! 1: SRA_R	sra 	%r3, %r10, %r21
	.word 0xb880800b  ! 1: ADDcc_R	addcc 	%r2, %r11, %r28
	.word 0xbe894009  ! 1: ANDcc_R	andcc 	%r5, %r9, %r31
thr3_resum_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa764180e  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa8a9a1a4  ! 1: ANDNcc_I	andncc 	%r6, 0x01a4, %r20
	.word 0xab30c00d  ! 1: SRL_R	srl 	%r3, %r13, %r21
	.word 0xa03963f2  ! 1: XNOR_I	xnor 	%r5, 0x03f2, %r16
thr3_resum_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_211), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_211)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa129a001  ! 1: SLL_I	sll 	%r6, 0x0001, %r16
	.word 0xa600e0c5  ! 1: ADD_I	add 	%r3, 0x00c5, %r19
	.word 0xb488a77b  ! 1: ANDcc_I	andcc 	%r2, 0x077b, %r26
	.word 0xa1643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae11c009  ! 1: OR_R	or 	%r7, %r9, %r23
	.word 0xa528900a  ! 1: SLLX_R	sllx	%r2, %r10, %r18
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb930800b  ! 1: SRL_R	srl 	%r2, %r11, %r28
thr3_resum_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_213), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_213)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa728a001  ! 1: SLL_I	sll 	%r2, 0x0001, %r19
	.word 0xbcb8a661  ! 1: XNORcc_I	xnorcc 	%r2, 0x0661, %r30
	.word 0xa401a230  ! 1: ADD_I	add 	%r6, 0x0230, %r18
	.word 0xac392d5f  ! 1: XNOR_I	xnor 	%r4, 0x0d5f, %r22
thr3_resum_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_214), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_214)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb539100a  ! 1: SRAX_R	srax	%r4, %r10, %r26
	.word 0xacc1800b  ! 1: ADDCcc_R	addccc 	%r6, %r11, %r22
	.word 0xad31f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r22
	.word 0xa0ba000d  ! 1: XNORcc_R	xnorcc 	%r8, %r13, %r16
thr3_resum_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_215), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_215)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacb9400c  ! 1: XNORcc_R	xnorcc 	%r5, %r12, %r22
	.word 0xa631a51a  ! 1: ORN_I	orn 	%r6, 0x051a, %r19
	.word 0xbe110009  ! 1: OR_R	or 	%r4, %r9, %r31
	.word 0xa2c1e72a  ! 1: ADDCcc_I	addccc 	%r7, 0x072a, %r17
thr3_resum_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_216), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_216)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacb9800e  ! 1: XNORcc_R	xnorcc 	%r6, %r14, %r22
	.word 0xba09800a  ! 1: AND_R	and 	%r6, %r10, %r29
	.word 0xae90ece2  ! 1: ORcc_I	orcc 	%r3, 0x0ce2, %r23
	.word 0xa578040b  ! 1: MOVR_R	move	%r0, %r11, %r18
thr3_resum_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_217), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_217)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb329f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r25
	.word 0xb811ec52  ! 1: OR_I	or 	%r7, 0x0c52, %r28
	.word 0xb631000e  ! 1: ORN_R	orn 	%r4, %r14, %r27
	.word 0xb291a487  ! 1: ORcc_I	orcc 	%r6, 0x0487, %r25
thr3_resum_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_218), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_218)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf31500e  ! 1: SRLX_R	srlx	%r5, %r14, %r31
	.word 0xae11e6b6  ! 1: OR_I	or 	%r7, 0x06b6, %r23
	.word 0xba89e543  ! 1: ANDcc_I	andcc 	%r7, 0x0543, %r29
	.word 0xb210e2c7  ! 1: OR_I	or 	%r3, 0x02c7, %r25
thr3_resum_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_219), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_219)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa809400e  ! 1: AND_R	and 	%r5, %r14, %r20
	.word 0xb689c00d  ! 1: ANDcc_R	andcc 	%r7, %r13, %r27
	.word 0xb6016274  ! 1: ADD_I	add 	%r5, 0x0274, %r27
	.word 0xb1396001  ! 1: SRA_I	sra 	%r5, 0x0001, %r24
thr3_resum_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_220), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_220)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe81260a  ! 1: ADDcc_I	addcc 	%r4, 0x060a, %r31
	.word 0xa329f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r17
	.word 0xba39a3f0  ! 1: XNOR_I	xnor 	%r6, 0x03f0, %r29
	.word 0xa0b22069  ! 1: ORNcc_I	orncc 	%r8, 0x0069, %r16
thr3_resum_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_221), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_221)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4814009  ! 1: ADDcc_R	addcc 	%r5, %r9, %r18
	.word 0xa9295009  ! 1: SLLX_R	sllx	%r5, %r9, %r20
	.word 0xa7782401  ! 1: MOVR_I	move	%r0, 0x9, %r19
	.word 0xaf39400f  ! 1: SRA_R	sra 	%r5, %r15, %r23
thr3_resum_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_222), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_222)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb52a0009  ! 1: SLL_R	sll 	%r8, %r9, %r26
	.word 0xa5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb240e112  ! 1: ADDC_I	addc 	%r3, 0x0112, %r25
	.word 0xa329100e  ! 1: SLLX_R	sllx	%r4, %r14, %r17
thr3_resum_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_223), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_223)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf28f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r31
	.word 0xa2892665  ! 1: ANDcc_I	andcc 	%r4, 0x0665, %r17
	.word 0xb441c00f  ! 1: ADDC_R	addc 	%r7, %r15, %r26
	.word 0xb09a000c  ! 1: XORcc_R	xorcc 	%r8, %r12, %r24
thr3_resum_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_224), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_224)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa5323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r18
	.word 0xae19000c  ! 1: XOR_R	xor 	%r4, %r12, %r23
	.word 0xaf38e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r23
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_225), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_225)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0a922d8  ! 1: ANDNcc_I	andncc 	%r4, 0x02d8, %r24
	.word 0xb129c00f  ! 1: SLL_R	sll 	%r7, %r15, %r24
	.word 0xa7290009  ! 1: SLL_R	sll 	%r4, %r9, %r19
	.word 0xa531000a  ! 1: SRL_R	srl 	%r4, %r10, %r18
thr3_resum_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_226), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_226)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb630a038  ! 1: ORN_I	orn 	%r2, 0x0038, %r27
	.word 0xb699400d  ! 1: XORcc_R	xorcc 	%r5, %r13, %r27
	.word 0xb9782401  ! 1: MOVR_I	move	%r0, 0xd, %r28
	.word 0xaec0c00c  ! 1: ADDCcc_R	addccc 	%r3, %r12, %r23
thr3_resum_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_227), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_227)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb3296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r25
	.word 0xa138e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r16
	.word 0xb0c0c00c  ! 1: ADDCcc_R	addccc 	%r3, %r12, %r24
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_228), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_228)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb964180c  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbf30e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r31
	.word 0xac10c00e  ! 1: OR_R	or 	%r3, %r14, %r22
	.word 0xb529d009  ! 1: SLLX_R	sllx	%r7, %r9, %r26
thr3_resum_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_229), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_229)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8a9ef1f  ! 1: ANDNcc_I	andncc 	%r7, 0x0f1f, %r20
	.word 0xa7317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r19
	.word 0xad31100c  ! 1: SRLX_R	srlx	%r4, %r12, %r22
	.word 0xb529b001  ! 1: SLLX_I	sllx	%r6, 0x0001, %r26
thr3_resum_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_230), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_230)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb481a74c  ! 1: ADDcc_I	addcc 	%r6, 0x074c, %r26
	.word 0xac82000a  ! 1: ADDcc_R	addcc 	%r8, %r10, %r22
	.word 0xae11ae7a  ! 1: OR_I	or 	%r6, 0x0e7a, %r23
	.word 0xa7782401  ! 1: MOVR_I	move	%r0, 0xfffffe7a, %r19
thr3_resum_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0122414  ! 1: OR_I	or 	%r8, 0x0414, %r24
	.word 0xb80163a9  ! 1: ADD_I	add 	%r5, 0x03a9, %r28
	.word 0xa688a799  ! 1: ANDcc_I	andcc 	%r2, 0x0799, %r19
	.word 0xb3782401  ! 1: MOVR_I	move	%r0, 0xffffff99, %r25
thr3_resum_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_232), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_232)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa081000c  ! 1: ADDcc_R	addcc 	%r4, %r12, %r16
	.word 0xb2b1c00f  ! 1: ORNcc_R	orncc 	%r7, %r15, %r25
	.word 0xab28a001  ! 1: SLL_I	sll 	%r2, 0x0001, %r21
	.word 0xaf38e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r23
thr3_resum_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb642000b  ! 1: ADDC_R	addc 	%r8, %r11, %r27
	.word 0xa730c00b  ! 1: SRL_R	srl 	%r3, %r11, %r19
	.word 0xba10800f  ! 1: OR_R	or 	%r2, %r15, %r29
	.word 0xac39000c  ! 1: XNOR_R	xnor 	%r4, %r12, %r22
thr3_resum_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_234), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_234)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0a92409  ! 1: ANDNcc_I	andncc 	%r4, 0x0409, %r24
	.word 0xb0a8800c  ! 1: ANDNcc_R	andncc 	%r2, %r12, %r24
	.word 0xa130c00e  ! 1: SRL_R	srl 	%r3, %r14, %r16
	.word 0xb0814009  ! 1: ADDcc_R	addcc 	%r5, %r9, %r24
thr3_resum_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_235), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_235)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb292000a  ! 1: ORcc_R	orcc 	%r8, %r10, %r25
	.word 0xb22969df  ! 1: ANDN_I	andn 	%r5, 0x09df, %r25
	.word 0xad782401  ! 1: MOVR_I	move	%r0, 0x9df, %r22
	.word 0xa4922cb2  ! 1: ORcc_I	orcc 	%r8, 0x0cb2, %r18
thr3_resum_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb20a2046  ! 1: AND_I	and 	%r8, 0x0046, %r25
	.word 0xa1313001  ! 1: SRLX_I	srlx	%r4, 0x0001, %r16
	.word 0xa32a1009  ! 1: SLLX_R	sllx	%r8, %r9, %r17
	.word 0xbd29d009  ! 1: SLLX_R	sllx	%r7, %r9, %r30
thr3_resum_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_237), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_237)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2b1c00d  ! 1: ORNcc_R	orncc 	%r7, %r13, %r25
	.word 0xa930f001  ! 1: SRLX_I	srlx	%r3, 0x0001, %r20
	.word 0xb62921ac  ! 1: ANDN_I	andn 	%r4, 0x01ac, %r27
	.word 0xa609ece0  ! 1: AND_I	and 	%r7, 0x0ce0, %r19
thr3_resum_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_238), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_238)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa138c00a  ! 1: SRA_R	sra 	%r3, %r10, %r16
	.word 0xb6196f88  ! 1: XOR_I	xor 	%r5, 0x0f88, %r27
	.word 0xba11000c  ! 1: OR_R	or 	%r4, %r12, %r29
	.word 0xbc80a689  ! 1: ADDcc_I	addcc 	%r2, 0x0689, %r30
thr3_resum_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_239), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_239)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaeba2666  ! 1: XNORcc_I	xnorcc 	%r8, 0x0666, %r23
	.word 0xa578040a  ! 1: MOVR_R	move	%r0, %r10, %r18
	.word 0xb5782401  ! 1: MOVR_I	move	%r0, 0xfffffe66, %r26
	.word 0xb0b2256d  ! 1: ORNcc_I	orncc 	%r8, 0x056d, %r24
thr3_resum_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_240), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_240)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa6b8e514  ! 1: XNORcc_I	xnorcc 	%r3, 0x0514, %r19
	.word 0xa691c009  ! 1: ORcc_R	orcc 	%r7, %r9, %r19
	.word 0xae00ae53  ! 1: ADD_I	add 	%r2, 0x0e53, %r23
	.word 0xaa08add9  ! 1: AND_I	and 	%r2, 0x0dd9, %r21
thr3_resum_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_241), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_241)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb528800c  ! 1: SLL_R	sll 	%r2, %r12, %r26
	.word 0xa090e3d5  ! 1: ORcc_I	orcc 	%r3, 0x03d5, %r16
	.word 0xb731100e  ! 1: SRLX_R	srlx	%r4, %r14, %r27
	.word 0xb1323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r24
thr3_resum_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_242), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_242)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb131000c  ! 1: SRL_R	srl 	%r4, %r12, %r24
	.word 0xa830c00f  ! 1: ORN_R	orn 	%r3, %r15, %r20
	.word 0xb8c16926  ! 1: ADDCcc_I	addccc 	%r5, 0x0926, %r28
	.word 0xb009800f  ! 1: AND_R	and 	%r6, %r15, %r24
thr3_resum_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb130d00c  ! 1: SRLX_R	srlx	%r3, %r12, %r24
	.word 0xbc39e358  ! 1: XNOR_I	xnor 	%r7, 0x0358, %r30
	.word 0xaa1963f9  ! 1: XOR_I	xor 	%r5, 0x03f9, %r21
	.word 0xa164180a  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_244), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_244)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb5293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r26
	.word 0xa6012c3b  ! 1: ADD_I	add 	%r4, 0x0c3b, %r19
	.word 0xad2a000f  ! 1: SLL_R	sll 	%r8, %r15, %r22
	.word 0xb2a9400b  ! 1: ANDNcc_R	andncc 	%r5, %r11, %r25
thr3_resum_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_245), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_245)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4016337  ! 1: ADD_I	add 	%r5, 0x0337, %r18
	.word 0xa2b2000d  ! 1: ORNcc_R	orncc 	%r8, %r13, %r17
	.word 0xba81c00d  ! 1: ADDcc_R	addcc 	%r7, %r13, %r29
	.word 0xbe01c00a  ! 1: ADD_R	add 	%r7, %r10, %r31
thr3_resum_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_246), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_246)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb431c00b  ! 1: ORN_R	orn 	%r7, %r11, %r26
	.word 0xbe01400d  ! 1: ADD_R	add 	%r5, %r13, %r31
	.word 0xa489000c  ! 1: ANDcc_R	andcc 	%r4, %r12, %r18
	.word 0xac09800d  ! 1: AND_R	and 	%r6, %r13, %r22
thr3_resum_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_247), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_247)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac816b6c  ! 1: ADDcc_I	addcc 	%r5, 0x0b6c, %r22
	.word 0xb0816395  ! 1: ADDcc_I	addcc 	%r5, 0x0395, %r24
	.word 0xbeb16dea  ! 1: ORNcc_I	orncc 	%r5, 0x0dea, %r31
	.word 0xacb22e7c  ! 1: ORNcc_I	orncc 	%r8, 0x0e7c, %r22
thr3_resum_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb0b122de  ! 1: ORNcc_I	orncc 	%r4, 0x02de, %r24
	.word 0xb808c00c  ! 1: AND_R	and 	%r3, %r12, %r28
	.word 0xa978040f  ! 1: MOVR_R	move	%r0, %r15, %r20
thr3_resum_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_249), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_249)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa9782401  ! 1: MOVR_I	move	%r0, 0xc, %r20
	.word 0xb8a9800d  ! 1: ANDNcc_R	andncc 	%r6, %r13, %r28
	.word 0xa828e304  ! 1: ANDN_I	andn 	%r3, 0x0304, %r20
	.word 0xa7323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r19
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx  0xf8f52ec87ec31f7f, %r16, %r16
	setx  0x387ebf15bb2ea33f, %r16, %r17
	setx  0x407f8bc1e2483a31, %r16, %r18
	setx  0x1940ccb9b82c1796, %r16, %r19
	setx  0xbec9570f4adc58a9, %r16, %r20
	setx  0xb8261a0d59af58ce, %r16, %r21
	setx  0x2bf216c45503cb41, %r16, %r22
	setx  0x4e24ad9af931121e, %r16, %r23
	setx  0x42a2e2b87ff3bf67, %r16, %r24
	setx  0x3b0c445f35454e63, %r16, %r25
	setx  0xa5d6d4d2e4222db5, %r16, %r26
	setx  0x59135165d3f11817, %r16, %r27
	setx  0x2c470bf1ec0234bc, %r16, %r28
	setx  0xafccd48aa737ecc7, %r16, %r29
	setx  0x0f578b9995ab439c, %r16, %r30
	setx  0x17c8e3a61560e68a, %r16, %r31
	setx  0x0000000000000230, %r16, %r9
	setx  0x0000000000000a90, %r16, %r10
	setx  0x0000000000000f70, %r16, %r11
	setx  0x0000000000000920, %r16, %r12
	setx  0x00000000000007d0, %r16, %r13
	setx  0x0000000000000ca0, %r16, %r14
	setx  0x00000000000008d0, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xb0d1000b  ! 2: UMULcc_R	umulcc 	%r4, %r11, %r24
	.word 0xaed9c00e  ! 2: SMULcc_R	smulcc 	%r7, %r14, %r23
	.word 0xaf2125b8  ! 2: MULScc_I	mulscc 	%r4, 0x05b8, %r23
	.word 0xb859a6a0  ! 2: SMUL_I	smul 	%r6, 0x06a0, %r28
	.word 0xb2522aca  ! 2: UMUL_I	umul 	%r8, 0x0aca, %r25
	.word 0xae48e049  ! 2: MULX_I	mulx 	%r3, 0x0049, %r23
	.word 0xb920c00f  ! 2: MULScc_R	mulscc 	%r3, %r15, %r28
	.word 0xbc49800e  ! 2: MULX_R	mulx 	%r6, %r14, %r30
	.word 0xb9212488  ! 2: MULScc_I	mulscc 	%r4, 0x0488, %r28
	.word 0xb2d1a9ef  ! 2: UMULcc_I	umulcc 	%r6, 0x09ef, %r25
	.word 0xa6512417  ! 2: UMUL_I	umul 	%r4, 0x0417, %r19
	.word 0xa45a000a  ! 2: SMUL_R	smul 	%r8, %r10, %r18
	.word 0xa0d9000f  ! 2: SMULcc_R	smulcc 	%r4, %r15, %r16
	.word 0xa459acd4  ! 2: SMUL_I	smul 	%r6, 0x0cd4, %r18
	.word 0xacd8a449  ! 2: SMULcc_I	smulcc 	%r2, 0x0449, %r22
	.word 0xa8d9000d  ! 2: SMULcc_R	smulcc 	%r4, %r13, %r20
	.word 0xa8d126b2  ! 2: UMULcc_I	umulcc 	%r4, 0x06b2, %r20
	.word 0xb449400a  ! 2: MULX_R	mulx 	%r5, %r10, %r26
	.word 0xaad1800d  ! 2: UMULcc_R	umulcc 	%r6, %r13, %r21
	.word 0xa0d16312  ! 2: UMULcc_I	umulcc 	%r5, 0x0312, %r16
	.word 0xb248c00d  ! 2: MULX_R	mulx 	%r3, %r13, %r25
	.word 0xaed9800a  ! 2: SMULcc_R	smulcc 	%r6, %r10, %r23
	.word 0xa0d1000e  ! 2: UMULcc_R	umulcc 	%r4, %r14, %r16
	.word 0xa520a95a  ! 2: MULScc_I	mulscc 	%r2, 0x095a, %r18
	.word 0xa8da266d  ! 2: SMULcc_I	smulcc 	%r8, 0x066d, %r20
	.word 0xb6d1a7d1  ! 2: UMULcc_I	umulcc 	%r6, 0x07d1, %r27
	.word 0xa251800c  ! 2: UMUL_R	umul 	%r6, %r12, %r17
	.word 0xb851000c  ! 2: UMUL_R	umul 	%r4, %r12, %r28
	.word 0xa8d162f6  ! 2: UMULcc_I	umulcc 	%r5, 0x02f6, %r20
	.word 0xb8d0c00c  ! 2: UMULcc_R	umulcc 	%r3, %r12, %r28
	.word 0xbcd0a553  ! 2: UMULcc_I	umulcc 	%r2, 0x0553, %r30
	.word 0xb059000d  ! 2: SMUL_R	smul 	%r4, %r13, %r24
	.word 0xaad9c00e  ! 2: SMULcc_R	smulcc 	%r7, %r14, %r21
	.word 0xb859a3ca  ! 2: SMUL_I	smul 	%r6, 0x03ca, %r28
	.word 0xaa49800f  ! 2: MULX_R	mulx 	%r6, %r15, %r21
	.word 0xb2d9800c  ! 2: SMULcc_R	smulcc 	%r6, %r12, %r25
	.word 0xaa50e044  ! 2: UMUL_I	umul 	%r3, 0x0044, %r21
	.word 0xb858efa8  ! 2: SMUL_I	smul 	%r3, 0x0fa8, %r28
	.word 0xa7208009  ! 2: MULScc_R	mulscc 	%r2, %r9, %r19
	.word 0xa4d9ac7c  ! 2: SMULcc_I	smulcc 	%r6, 0x0c7c, %r18
	.word 0xb4d0ef54  ! 2: UMULcc_I	umulcc 	%r3, 0x0f54, %r26
	.word 0xb849000d  ! 2: MULX_R	mulx 	%r4, %r13, %r28
	.word 0xb459400d  ! 2: SMUL_R	smul 	%r5, %r13, %r26
	.word 0xa721a1b4  ! 2: MULScc_I	mulscc 	%r6, 0x01b4, %r19
	.word 0xba50800b  ! 2: UMUL_R	umul 	%r2, %r11, %r29
	.word 0xbed9400f  ! 2: SMULcc_R	smulcc 	%r5, %r15, %r31
	.word 0xae59000c  ! 2: SMUL_R	smul 	%r4, %r12, %r23
	.word 0xa8d0c00a  ! 2: UMULcc_R	umulcc 	%r3, %r10, %r20
	.word 0xa4d0e76c  ! 2: UMULcc_I	umulcc 	%r3, 0x076c, %r18
	.word 0xb450a9ce  ! 2: UMUL_I	umul 	%r2, 0x09ce, %r26
	.word 0xa0da000a  ! 2: SMULcc_R	smulcc 	%r8, %r10, %r16
	.word 0xbf21afd7  ! 2: MULScc_I	mulscc 	%r6, 0x0fd7, %r31
	.word 0xa7210009  ! 2: MULScc_R	mulscc 	%r4, %r9, %r19
	.word 0xb6d9a8c8  ! 2: SMULcc_I	smulcc 	%r6, 0x08c8, %r27
	.word 0xba51000e  ! 2: UMUL_R	umul 	%r4, %r14, %r29
	.word 0xa4d9400f  ! 2: SMULcc_R	smulcc 	%r5, %r15, %r18
	.word 0xa321e3e5  ! 2: MULScc_I	mulscc 	%r7, 0x03e5, %r17
	.word 0xb4522bf0  ! 2: UMUL_I	umul 	%r8, 0x0bf0, %r26
	.word 0xaed0a24f  ! 2: UMULcc_I	umulcc 	%r2, 0x024f, %r23
	.word 0xaa58a383  ! 2: SMUL_I	smul 	%r2, 0x0383, %r21
	.word 0xa851c00f  ! 2: UMUL_R	umul 	%r7, %r15, %r20
	.word 0xa6492936  ! 2: MULX_I	mulx 	%r4, 0x0936, %r19
	.word 0xa4d8abfa  ! 2: SMULcc_I	smulcc 	%r2, 0x0bfa, %r18
	.word 0xa250ae63  ! 2: UMUL_I	umul 	%r2, 0x0e63, %r17
	.word 0xba59c00f  ! 2: SMUL_R	smul 	%r7, %r15, %r29
	.word 0xa4da2fb0  ! 2: SMULcc_I	smulcc 	%r8, 0x0fb0, %r18
	.word 0xb120acef  ! 2: MULScc_I	mulscc 	%r2, 0x0cef, %r24
	.word 0xbd22000b  ! 2: MULScc_R	mulscc 	%r8, %r11, %r30
	.word 0xbe5a000d  ! 2: SMUL_R	smul 	%r8, %r13, %r31
	.word 0xb051632c  ! 2: UMUL_I	umul 	%r5, 0x032c, %r24
	.word 0xbe50a8f2  ! 2: UMUL_I	umul 	%r2, 0x08f2, %r31
	.word 0xaad9000c  ! 2: SMULcc_R	smulcc 	%r4, %r12, %r21
	.word 0xb321800d  ! 2: MULScc_R	mulscc 	%r6, %r13, %r25
	.word 0xaeda2512  ! 2: SMULcc_I	smulcc 	%r8, 0x0512, %r23
	.word 0xae59000a  ! 2: SMUL_R	smul 	%r4, %r10, %r23
	.word 0xa922207d  ! 2: MULScc_I	mulscc 	%r8, 0x007d, %r20
	.word 0xb850e1ca  ! 2: UMUL_I	umul 	%r3, 0x01ca, %r28
	.word 0xacd12ffb  ! 2: UMULcc_I	umulcc 	%r4, 0x0ffb, %r22
	.word 0xa648ecae  ! 2: MULX_I	mulx 	%r3, 0x0cae, %r19
	.word 0xac49e136  ! 2: MULX_I	mulx 	%r7, 0x0136, %r22
	.word 0xa6d92abf  ! 2: SMULcc_I	smulcc 	%r4, 0x0abf, %r19
	.word 0xb651400c  ! 2: UMUL_R	umul 	%r5, %r12, %r27
	.word 0xbcd88009  ! 2: SMULcc_R	smulcc 	%r2, %r9, %r30
	.word 0xa44969dc  ! 2: MULX_I	mulx 	%r5, 0x09dc, %r18
	.word 0xa651400f  ! 2: UMUL_R	umul 	%r5, %r15, %r19
	.word 0xad21c00f  ! 2: MULScc_R	mulscc 	%r7, %r15, %r22
	.word 0xa8d0ae3d  ! 2: UMULcc_I	umulcc 	%r2, 0x0e3d, %r20
	.word 0xaad12a60  ! 2: UMULcc_I	umulcc 	%r4, 0x0a60, %r21
	.word 0xa04927ac  ! 2: MULX_I	mulx 	%r4, 0x07ac, %r16
	.word 0xac51a156  ! 2: UMUL_I	umul 	%r6, 0x0156, %r22
	.word 0xa050ea61  ! 2: UMUL_I	umul 	%r3, 0x0a61, %r16
	.word 0xa849400b  ! 2: MULX_R	mulx 	%r5, %r11, %r20
	.word 0xbe51400e  ! 2: UMUL_R	umul 	%r5, %r14, %r31
	.word 0xa649c00b  ! 2: MULX_R	mulx 	%r7, %r11, %r19
	.word 0xb2d16e2e  ! 2: UMULcc_I	umulcc 	%r5, 0x0e2e, %r25
	.word 0xa049000e  ! 2: MULX_R	mulx 	%r4, %r14, %r16
	.word 0xb258eb32  ! 2: SMUL_I	smul 	%r3, 0x0b32, %r25
	.word 0xa6512bf2  ! 2: UMUL_I	umul 	%r4, 0x0bf2, %r19
	.word 0xa8d1c00e  ! 2: UMULcc_R	umulcc 	%r7, %r14, %r20
	.word 0xb721000a  ! 2: MULScc_R	mulscc 	%r4, %r10, %r27
	.word 0xa2d20009  ! 2: UMULcc_R	umulcc 	%r8, %r9, %r17
	.word 0xa321800c  ! 2: MULScc_R	mulscc 	%r6, %r12, %r17
	.word 0xacd8a03c  ! 2: SMULcc_I	smulcc 	%r2, 0x003c, %r22
	.word 0xb52165cd  ! 2: MULScc_I	mulscc 	%r5, 0x05cd, %r26
	.word 0xb850800d  ! 2: UMUL_R	umul 	%r2, %r13, %r28
	.word 0xa6d1800d  ! 2: UMULcc_R	umulcc 	%r6, %r13, %r19
	.word 0xae5a000f  ! 2: SMUL_R	smul 	%r8, %r15, %r23
	.word 0xb0d9c00a  ! 2: SMULcc_R	smulcc 	%r7, %r10, %r24
	.word 0xb051c00f  ! 2: UMUL_R	umul 	%r7, %r15, %r24
	.word 0xbe58c00e  ! 2: SMUL_R	smul 	%r3, %r14, %r31
	.word 0xbc596260  ! 2: SMUL_I	smul 	%r5, 0x0260, %r30
	.word 0xb4512ac6  ! 2: UMUL_I	umul 	%r4, 0x0ac6, %r26
	.word 0xa920800a  ! 2: MULScc_R	mulscc 	%r2, %r10, %r20
	.word 0xa921000e  ! 2: MULScc_R	mulscc 	%r4, %r14, %r20
	.word 0xb251e021  ! 2: UMUL_I	umul 	%r7, 0x0021, %r25
	.word 0xa8d1c00b  ! 2: UMULcc_R	umulcc 	%r7, %r11, %r20
	.word 0xa4d10009  ! 2: UMULcc_R	umulcc 	%r4, %r9, %r18
	.word 0xa0d96bd4  ! 2: SMULcc_I	smulcc 	%r5, 0x0bd4, %r16
	.word 0xb1222a65  ! 2: MULScc_I	mulscc 	%r8, 0x0a65, %r24
	.word 0xbc50c00b  ! 2: UMUL_R	umul 	%r3, %r11, %r30
	.word 0xaed0a2ef  ! 2: UMULcc_I	umulcc 	%r2, 0x02ef, %r23
	.word 0xa850e245  ! 2: UMUL_I	umul 	%r3, 0x0245, %r20
	.word 0xbc5128f9  ! 2: UMUL_I	umul 	%r4, 0x08f9, %r30
	.word 0xbe496562  ! 2: MULX_I	mulx 	%r5, 0x0562, %r31
	.word 0xac51eab4  ! 2: UMUL_I	umul 	%r7, 0x0ab4, %r22
	.word 0xb859adaf  ! 2: SMUL_I	smul 	%r6, 0x0daf, %r28
	.word 0xa920c00b  ! 2: MULScc_R	mulscc 	%r3, %r11, %r20
	.word 0xb4d1000c  ! 2: UMULcc_R	umulcc 	%r4, %r12, %r26
	.word 0xb321800f  ! 2: MULScc_R	mulscc 	%r6, %r15, %r25
	.word 0xacd20009  ! 2: UMULcc_R	umulcc 	%r8, %r9, %r22
	.word 0xb121000f  ! 2: MULScc_R	mulscc 	%r4, %r15, %r24
	.word 0xaad125f0  ! 2: UMULcc_I	umulcc 	%r4, 0x05f0, %r21
	.word 0xb849800a  ! 2: MULX_R	mulx 	%r6, %r10, %r28
	.word 0xa649000f  ! 2: MULX_R	mulx 	%r4, %r15, %r19
	.word 0xb051688b  ! 2: UMUL_I	umul 	%r5, 0x088b, %r24
	.word 0xbad165f8  ! 2: UMULcc_I	umulcc 	%r5, 0x05f8, %r29
	.word 0xaada000f  ! 2: SMULcc_R	smulcc 	%r8, %r15, %r21
	.word 0xb248ad15  ! 2: MULX_I	mulx 	%r2, 0x0d15, %r25
	.word 0xb6d08009  ! 2: UMULcc_R	umulcc 	%r2, %r9, %r27
	.word 0xb121a099  ! 2: MULScc_I	mulscc 	%r6, 0x0099, %r24
	.word 0xba59800e  ! 2: SMUL_R	smul 	%r6, %r14, %r29
	.word 0xb0d1000e  ! 2: UMULcc_R	umulcc 	%r4, %r14, %r24
	.word 0xb0d0e2a4  ! 2: UMULcc_I	umulcc 	%r3, 0x02a4, %r24
	.word 0xa2d1400e  ! 2: UMULcc_R	umulcc 	%r5, %r14, %r17
	.word 0xbc51c009  ! 2: UMUL_R	umul 	%r7, %r9, %r30
	.word 0xa6d1655b  ! 2: UMULcc_I	umulcc 	%r5, 0x055b, %r19
	.word 0xae51a932  ! 2: UMUL_I	umul 	%r6, 0x0932, %r23
	.word 0xb121000b  ! 2: MULScc_R	mulscc 	%r4, %r11, %r24
	.word 0xb2592fa5  ! 2: SMUL_I	smul 	%r4, 0x0fa5, %r25
	.word 0xbad9e2dd  ! 2: SMULcc_I	smulcc 	%r7, 0x02dd, %r29
	.word 0xa721a425  ! 2: MULScc_I	mulscc 	%r6, 0x0425, %r19
	.word 0xac49e740  ! 2: MULX_I	mulx 	%r7, 0x0740, %r22
	.word 0xac49a43d  ! 2: MULX_I	mulx 	%r6, 0x043d, %r22
	.word 0xba49c00c  ! 2: MULX_R	mulx 	%r7, %r12, %r29
	.word 0xbe49800f  ! 2: MULX_R	mulx 	%r6, %r15, %r31
	.word 0xb848e789  ! 2: MULX_I	mulx 	%r3, 0x0789, %r28
	.word 0xa2d8e23c  ! 2: SMULcc_I	smulcc 	%r3, 0x023c, %r17
	.word 0xa859c00f  ! 2: SMUL_R	smul 	%r7, %r15, %r20
	.word 0xaa51400d  ! 2: UMUL_R	umul 	%r5, %r13, %r21
	.word 0xb25969d7  ! 2: SMUL_I	smul 	%r5, 0x09d7, %r25
	.word 0xbd21e4af  ! 2: MULScc_I	mulscc 	%r7, 0x04af, %r30
	.word 0xbc596794  ! 2: SMUL_I	smul 	%r5, 0x0794, %r30
	.word 0xa520800a  ! 2: MULScc_R	mulscc 	%r2, %r10, %r18
	.word 0xac590009  ! 2: SMUL_R	smul 	%r4, %r9, %r22
	.word 0xb6d9e7f4  ! 2: SMULcc_I	smulcc 	%r7, 0x07f4, %r27
	.word 0xaeda28bf  ! 2: SMULcc_I	smulcc 	%r8, 0x08bf, %r23
	.word 0xa521af3d  ! 2: MULScc_I	mulscc 	%r6, 0x0f3d, %r18
	.word 0xb6592272  ! 2: SMUL_I	smul 	%r4, 0x0272, %r27
	.word 0xa058ac5f  ! 2: SMUL_I	smul 	%r2, 0x0c5f, %r16
	.word 0xa651800f  ! 2: UMUL_R	umul 	%r6, %r15, %r19
	.word 0xbd21c00f  ! 2: MULScc_R	mulscc 	%r7, %r15, %r30
	.word 0xb050aafd  ! 2: UMUL_I	umul 	%r2, 0x0afd, %r24
	.word 0xbc48c00b  ! 2: MULX_R	mulx 	%r3, %r11, %r30
	.word 0xb120a2b0  ! 2: MULScc_I	mulscc 	%r2, 0x02b0, %r24
	.word 0xbad8a77c  ! 2: SMULcc_I	smulcc 	%r2, 0x077c, %r29
	.word 0xbc588009  ! 2: SMUL_R	smul 	%r2, %r9, %r30
	.word 0xaa51400c  ! 2: UMUL_R	umul 	%r5, %r12, %r21
	.word 0xaad92f45  ! 2: SMULcc_I	smulcc 	%r4, 0x0f45, %r21
	.word 0xb051000e  ! 2: UMUL_R	umul 	%r4, %r14, %r24
	.word 0xaa48c009  ! 2: MULX_R	mulx 	%r3, %r9, %r21
	.word 0xb7208009  ! 2: MULScc_R	mulscc 	%r2, %r9, %r27
	.word 0xb2d9400a  ! 2: SMULcc_R	smulcc 	%r5, %r10, %r25
	.word 0xb2d8e6e9  ! 2: SMULcc_I	smulcc 	%r3, 0x06e9, %r25
	.word 0xb851e8d7  ! 2: UMUL_I	umul 	%r7, 0x08d7, %r28
	.word 0xb651c00c  ! 2: UMUL_R	umul 	%r7, %r12, %r27
	.word 0xaf21243e  ! 2: MULScc_I	mulscc 	%r4, 0x043e, %r23
	.word 0xa659ab00  ! 2: SMUL_I	smul 	%r6, 0x0b00, %r19
	.word 0xbed1e35c  ! 2: UMULcc_I	umulcc 	%r7, 0x035c, %r31
	.word 0xa458800d  ! 2: SMUL_R	smul 	%r2, %r13, %r18
	.word 0xaeda2ead  ! 2: SMULcc_I	smulcc 	%r8, 0x0ead, %r23
	.word 0xb04a000b  ! 2: MULX_R	mulx 	%r8, %r11, %r24
	.word 0xa32160b6  ! 2: MULScc_I	mulscc 	%r5, 0x00b6, %r17
	.word 0xb250800a  ! 2: UMUL_R	umul 	%r2, %r10, %r25
	.word 0xa850a86a  ! 2: UMUL_I	umul 	%r2, 0x086a, %r20
	.word 0xb651000d  ! 2: UMUL_R	umul 	%r4, %r13, %r27
	.word 0xb6d1800a  ! 2: UMULcc_R	umulcc 	%r6, %r10, %r27
	.word 0xae516937  ! 2: UMUL_I	umul 	%r5, 0x0937, %r23
	.word 0xae48800e  ! 2: MULX_R	mulx 	%r2, %r14, %r23
	.word 0xa048a3c4  ! 2: MULX_I	mulx 	%r2, 0x03c4, %r16
	.word 0xb2d12f34  ! 2: UMULcc_I	umulcc 	%r4, 0x0f34, %r25
	.word 0xb849400e  ! 2: MULX_R	mulx 	%r5, %r14, %r28
	.word 0xa921a97e  ! 2: MULScc_I	mulscc 	%r6, 0x097e, %r20
	.word 0xbcd92fa0  ! 2: SMULcc_I	smulcc 	%r4, 0x0fa0, %r30
	.word 0xb3214009  ! 2: MULScc_R	mulscc 	%r5, %r9, %r25
	.word 0xb458a00a  ! 2: SMUL_I	smul 	%r2, 0x000a, %r26
	.word 0xa249e882  ! 2: MULX_I	mulx 	%r7, 0x0882, %r17
	.word 0xb0d1400c  ! 2: UMULcc_R	umulcc 	%r5, %r12, %r24
	.word 0xb249800d  ! 2: MULX_R	mulx 	%r6, %r13, %r25
	.word 0xa2d9400b  ! 2: SMULcc_R	smulcc 	%r5, %r11, %r17
	.word 0xa6d1400d  ! 2: UMULcc_R	umulcc 	%r5, %r13, %r19
	.word 0xa659e7ff  ! 2: SMUL_I	smul 	%r7, 0x07ff, %r19
	.word 0xa0512d4d  ! 2: UMUL_I	umul 	%r4, 0x0d4d, %r16
	.word 0xba5a2a1e  ! 2: SMUL_I	smul 	%r8, 0x0a1e, %r29
	.word 0xa658a7d0  ! 2: SMUL_I	smul 	%r2, 0x07d0, %r19
	.word 0xb852000d  ! 2: UMUL_R	umul 	%r8, %r13, %r28
	.word 0xaf216ee6  ! 2: MULScc_I	mulscc 	%r5, 0x0ee6, %r23
	.word 0xa859ade5  ! 2: SMUL_I	smul 	%r6, 0x0de5, %r20
	.word 0xa6d1c00c  ! 2: UMULcc_R	umulcc 	%r7, %r12, %r19
	.word 0xb4d9400b  ! 2: SMULcc_R	smulcc 	%r5, %r11, %r26
	.word 0xa4d1a6a7  ! 2: UMULcc_I	umulcc 	%r6, 0x06a7, %r18
	.word 0xb2d0aac8  ! 2: UMULcc_I	umulcc 	%r2, 0x0ac8, %r25
	.word 0xa8da291e  ! 2: SMULcc_I	smulcc 	%r8, 0x091e, %r20
	.word 0xb0d9800b  ! 2: SMULcc_R	smulcc 	%r6, %r11, %r24
	.word 0xa2d1e23d  ! 2: UMULcc_I	umulcc 	%r7, 0x023d, %r17
	.word 0xb0d2000d  ! 2: UMULcc_R	umulcc 	%r8, %r13, %r24
	.word 0xaa48800d  ! 2: MULX_R	mulx 	%r2, %r13, %r21
	.word 0xa4d9a206  ! 2: SMULcc_I	smulcc 	%r6, 0x0206, %r18
	.word 0xa722000c  ! 2: MULScc_R	mulscc 	%r8, %r12, %r19
	.word 0xb851800c  ! 2: UMUL_R	umul 	%r6, %r12, %r28
	.word 0xb651a859  ! 2: UMUL_I	umul 	%r6, 0x0859, %r27
	.word 0xbe5a000b  ! 2: SMUL_R	smul 	%r8, %r11, %r31
	.word 0xad20e131  ! 2: MULScc_I	mulscc 	%r3, 0x0131, %r22
	.word 0xac51a293  ! 2: UMUL_I	umul 	%r6, 0x0293, %r22
	.word 0xae50a593  ! 2: UMUL_I	umul 	%r2, 0x0593, %r23
	.word 0xb8494009  ! 2: MULX_R	mulx 	%r5, %r9, %r28
	.word 0xa4512a2e  ! 2: UMUL_I	umul 	%r4, 0x0a2e, %r18
	.word 0xad212b55  ! 2: MULScc_I	mulscc 	%r4, 0x0b55, %r22
	.word 0xb059000a  ! 2: SMUL_R	smul 	%r4, %r10, %r24
	.word 0xb8d1e177  ! 2: UMULcc_I	umulcc 	%r7, 0x0177, %r28
	.word 0xbc50e17d  ! 2: UMUL_I	umul 	%r3, 0x017d, %r30
	.word 0xbb2220ec  ! 2: MULScc_I	mulscc 	%r8, 0x00ec, %r29
	.word 0xb120ef12  ! 2: MULScc_I	mulscc 	%r3, 0x0f12, %r24
	.word 0xba48c00a  ! 2: MULX_R	mulx 	%r3, %r10, %r29
	.word 0xa121c00d  ! 2: MULScc_R	mulscc 	%r7, %r13, %r16
	.word 0xbed963f6  ! 2: SMULcc_I	smulcc 	%r5, 0x03f6, %r31
	.word 0xaed0ebb4  ! 2: UMULcc_I	umulcc 	%r3, 0x0bb4, %r23
	.word 0xb65165da  ! 2: UMUL_I	umul 	%r5, 0x05da, %r27
	.word 0xa852000e  ! 2: UMUL_R	umul 	%r8, %r14, %r20
	.word 0xae48ab03  ! 2: MULX_I	mulx 	%r2, 0x0b03, %r23
	.word 0xa4d0c00e  ! 2: UMULcc_R	umulcc 	%r3, %r14, %r18
	.word 0xa321800f  ! 2: MULScc_R	mulscc 	%r6, %r15, %r17
	.word 0xa249800b  ! 2: MULX_R	mulx 	%r6, %r11, %r17
	.word 0xab22000c  ! 2: MULScc_R	mulscc 	%r8, %r12, %r21
	.word 0xb0da000d  ! 2: SMULcc_R	smulcc 	%r8, %r13, %r24
	.word 0xa0d9e5a2  ! 2: SMULcc_I	smulcc 	%r7, 0x05a2, %r16
	.word 0xba51800b  ! 2: UMUL_R	umul 	%r6, %r11, %r29
	.word 0xa2d1c00c  ! 2: UMULcc_R	umulcc 	%r7, %r12, %r17
	.word 0xa850800b  ! 2: UMUL_R	umul 	%r2, %r11, %r20
	.word 0xa8d1800e  ! 2: UMULcc_R	umulcc 	%r6, %r14, %r20
	.word 0xbad0e38b  ! 2: UMULcc_I	umulcc 	%r3, 0x038b, %r29
	.word 0xa121000a  ! 2: MULScc_R	mulscc 	%r4, %r10, %r16
	.word 0xba4a0009  ! 2: MULX_R	mulx 	%r8, %r9, %r29
	.word 0xa6d96f44  ! 2: SMULcc_I	smulcc 	%r5, 0x0f44, %r19
	.word 0xb2d9ec6d  ! 2: SMULcc_I	smulcc 	%r7, 0x0c6d, %r25
	.word 0xae59a7b9  ! 2: SMUL_I	smul 	%r6, 0x07b9, %r23
	.word 0xb659800c  ! 2: SMUL_R	smul 	%r6, %r12, %r27
	.word 0xacd96650  ! 2: SMULcc_I	smulcc 	%r5, 0x0650, %r22
	.word 0xa649ad04  ! 2: MULX_I	mulx 	%r6, 0x0d04, %r19
	.word 0xbd20c00d  ! 2: MULScc_R	mulscc 	%r3, %r13, %r30
	.word 0xbad9400b  ! 2: SMULcc_R	smulcc 	%r5, %r11, %r29
	.word 0xb250abeb  ! 2: UMUL_I	umul 	%r2, 0x0beb, %r25
	.word 0xa249ac1f  ! 2: MULX_I	mulx 	%r6, 0x0c1f, %r17
	.word 0xa6d9c00c  ! 2: SMULcc_R	smulcc 	%r7, %r12, %r19
	.word 0xa4d0c00e  ! 2: UMULcc_R	umulcc 	%r3, %r14, %r18
	.word 0xae58c00a  ! 2: SMUL_R	smul 	%r3, %r10, %r23
	.word 0xae59af28  ! 2: SMUL_I	smul 	%r6, 0x0f28, %r23
	.word 0xaed12a24  ! 2: UMULcc_I	umulcc 	%r4, 0x0a24, %r23
	.word 0xb6590009  ! 2: SMUL_R	smul 	%r4, %r9, %r27
	.word 0xa248e06c  ! 2: MULX_I	mulx 	%r3, 0x006c, %r17
	.word 0xaa51a4e0  ! 2: UMUL_I	umul 	%r6, 0x04e0, %r21
	.word 0xa2d9e163  ! 2: SMULcc_I	smulcc 	%r7, 0x0163, %r17
	.word 0xa258e2b0  ! 2: SMUL_I	smul 	%r3, 0x02b0, %r17
	.word 0xa251c00c  ! 2: UMUL_R	umul 	%r7, %r12, %r17
	.word 0xba58a27c  ! 2: SMUL_I	smul 	%r2, 0x027c, %r29
	.word 0xbad9e195  ! 2: SMULcc_I	smulcc 	%r7, 0x0195, %r29
	.word 0xa848aaf0  ! 2: MULX_I	mulx 	%r2, 0x0af0, %r20
	.word 0xad21000b  ! 2: MULScc_R	mulscc 	%r4, %r11, %r22
	.word 0xa4d9e137  ! 2: SMULcc_I	smulcc 	%r7, 0x0137, %r18
	.word 0xa6592ecb  ! 2: SMUL_I	smul 	%r4, 0x0ecb, %r19
	.word 0xb4d1ebaf  ! 2: UMULcc_I	umulcc 	%r7, 0x0baf, %r26
	.word 0xaad8abcc  ! 2: SMULcc_I	smulcc 	%r2, 0x0bcc, %r21
	.word 0xa521400c  ! 2: MULScc_R	mulscc 	%r5, %r12, %r18
	.word 0xb320c00e  ! 2: MULScc_R	mulscc 	%r3, %r14, %r25
	.word 0xb259000c  ! 2: SMUL_R	smul 	%r4, %r12, %r25
	.word 0xaa58a437  ! 2: SMUL_I	smul 	%r2, 0x0437, %r21
	.word 0xa4d0800b  ! 2: UMULcc_R	umulcc 	%r2, %r11, %r18
	.word 0xbe48c00f  ! 2: MULX_R	mulx 	%r3, %r15, %r31
	.word 0xacd8a5a0  ! 2: SMULcc_I	smulcc 	%r2, 0x05a0, %r22
	.word 0xb450800c  ! 2: UMUL_R	umul 	%r2, %r12, %r26
	.word 0xa85a0009  ! 2: SMUL_R	smul 	%r8, %r9, %r20
	.word 0xa521c009  ! 2: MULScc_R	mulscc 	%r7, %r9, %r18
	.word 0xaa592dc7  ! 2: SMUL_I	smul 	%r4, 0x0dc7, %r21
	.word 0xac51e141  ! 2: UMUL_I	umul 	%r7, 0x0141, %r22
	.word 0xaf216c39  ! 2: MULScc_I	mulscc 	%r5, 0x0c39, %r23
	.word 0xb251400f  ! 2: UMUL_R	umul 	%r5, %r15, %r25
	.word 0xac51a8ea  ! 2: UMUL_I	umul 	%r6, 0x08ea, %r22
	.word 0xbcda2486  ! 2: SMULcc_I	smulcc 	%r8, 0x0486, %r30
	.word 0xa520e580  ! 2: MULScc_I	mulscc 	%r3, 0x0580, %r18
	.word 0xbb20e362  ! 2: MULScc_I	mulscc 	%r3, 0x0362, %r29
	.word 0xbe498009  ! 2: MULX_R	mulx 	%r6, %r9, %r31
	.word 0xa248ab22  ! 2: MULX_I	mulx 	%r2, 0x0b22, %r17
	.word 0xbf22000e  ! 2: MULScc_R	mulscc 	%r8, %r14, %r31
	.word 0xacd1000a  ! 2: UMULcc_R	umulcc 	%r4, %r10, %r22
	.word 0xa0d0a026  ! 2: UMULcc_I	umulcc 	%r2, 0x0026, %r16
	.word 0xa451800a  ! 2: UMUL_R	umul 	%r6, %r10, %r18
	.word 0xb4516869  ! 2: UMUL_I	umul 	%r5, 0x0869, %r26
	.word 0xb858c00d  ! 2: SMUL_R	smul 	%r3, %r13, %r28
	.word 0xae49acaf  ! 2: MULX_I	mulx 	%r6, 0x0caf, %r23
	.word 0xa0da2ae6  ! 2: SMULcc_I	smulcc 	%r8, 0x0ae6, %r16
	.word 0xa5212294  ! 2: MULScc_I	mulscc 	%r4, 0x0294, %r18
	.word 0xb651400f  ! 2: UMUL_R	umul 	%r5, %r15, %r27
	.word 0xba49a369  ! 2: MULX_I	mulx 	%r6, 0x0369, %r29
	.word 0xb85966f9  ! 2: SMUL_I	smul 	%r5, 0x06f9, %r28
	.word 0xa1212de3  ! 2: MULScc_I	mulscc 	%r4, 0x0de3, %r16
	.word 0xa249c00f  ! 2: MULX_R	mulx 	%r7, %r15, %r17
	.word 0xb12168c7  ! 2: MULScc_I	mulscc 	%r5, 0x08c7, %r24
	.word 0xac496ddc  ! 2: MULX_I	mulx 	%r5, 0x0ddc, %r22
	.word 0xa858c00b  ! 2: SMUL_R	smul 	%r3, %r11, %r20
	.word 0xa859e05b  ! 2: SMUL_I	smul 	%r7, 0x005b, %r20
	.word 0xb120ed0b  ! 2: MULScc_I	mulscc 	%r3, 0x0d0b, %r24
	.word 0xa0d9000b  ! 2: SMULcc_R	smulcc 	%r4, %r11, %r16
	.word 0xbc492f41  ! 2: MULX_I	mulx 	%r4, 0x0f41, %r30
	.word 0xb920ec16  ! 2: MULScc_I	mulscc 	%r3, 0x0c16, %r28
	.word 0xaed1800f  ! 2: UMULcc_R	umulcc 	%r6, %r15, %r23
	.word 0xbc5a2de4  ! 2: SMUL_I	smul 	%r8, 0x0de4, %r30
	.word 0xa320eb93  ! 2: MULScc_I	mulscc 	%r3, 0x0b93, %r17
	.word 0xa6d1a384  ! 2: UMULcc_I	umulcc 	%r6, 0x0384, %r19
	.word 0xa8d9000d  ! 2: SMULcc_R	smulcc 	%r4, %r13, %r20
	.word 0xae49400e  ! 2: MULX_R	mulx 	%r5, %r14, %r23
	.word 0xb4d8a75b  ! 2: SMULcc_I	smulcc 	%r2, 0x075b, %r26
	.word 0xa650e979  ! 2: UMUL_I	umul 	%r3, 0x0979, %r19
	.word 0xb058800f  ! 2: SMUL_R	smul 	%r2, %r15, %r24
	.word 0xa6d9400c  ! 2: SMULcc_R	smulcc 	%r5, %r12, %r19
	.word 0xacd8800e  ! 2: SMULcc_R	smulcc 	%r2, %r14, %r22
	.word 0xb4d1c00e  ! 2: UMULcc_R	umulcc 	%r7, %r14, %r26
	.word 0xa2d8ad27  ! 2: SMULcc_I	smulcc 	%r2, 0x0d27, %r17
	.word 0xb4d16aa6  ! 2: UMULcc_I	umulcc 	%r5, 0x0aa6, %r26
	.word 0xa4d8c00f  ! 2: SMULcc_R	smulcc 	%r3, %r15, %r18
	.word 0xbad1800a  ! 2: UMULcc_R	umulcc 	%r6, %r10, %r29
	.word 0xae51eda7  ! 2: UMUL_I	umul 	%r7, 0x0da7, %r23
	.word 0xb1216d44  ! 2: MULScc_I	mulscc 	%r5, 0x0d44, %r24
	.word 0xbf20e9d2  ! 2: MULScc_I	mulscc 	%r3, 0x09d2, %r31
	.word 0xb2512aba  ! 2: UMUL_I	umul 	%r4, 0x0aba, %r25
	.word 0xa6512fcd  ! 2: UMUL_I	umul 	%r4, 0x0fcd, %r19
	.word 0xaad8c00b  ! 2: SMULcc_R	smulcc 	%r3, %r11, %r21
	.word 0xa24a000b  ! 2: MULX_R	mulx 	%r8, %r11, %r17
	.word 0xb721a64b  ! 2: MULScc_I	mulscc 	%r6, 0x064b, %r27
	.word 0xbed167d2  ! 2: UMULcc_I	umulcc 	%r5, 0x07d2, %r31
	.word 0xa04929c8  ! 2: MULX_I	mulx 	%r4, 0x09c8, %r16
	.word 0xb4492582  ! 2: MULX_I	mulx 	%r4, 0x0582, %r26
	.word 0xb64a214f  ! 2: MULX_I	mulx 	%r8, 0x014f, %r27
	.word 0xb848800c  ! 2: MULX_R	mulx 	%r2, %r12, %r28
	.word 0xa921800e  ! 2: MULScc_R	mulscc 	%r6, %r14, %r20
	.word 0xaf20c009  ! 2: MULScc_R	mulscc 	%r3, %r9, %r23
	.word 0xa44926c4  ! 2: MULX_I	mulx 	%r4, 0x06c4, %r18
	.word 0xb2d96942  ! 2: SMULcc_I	smulcc 	%r5, 0x0942, %r25
	.word 0xae4969cc  ! 2: MULX_I	mulx 	%r5, 0x09cc, %r23
	.word 0xba48800d  ! 2: MULX_R	mulx 	%r2, %r13, %r29
	.word 0xaad08009  ! 2: UMULcc_R	umulcc 	%r2, %r9, %r21
	.word 0xbf216838  ! 2: MULScc_I	mulscc 	%r5, 0x0838, %r31
	.word 0xa5216a27  ! 2: MULScc_I	mulscc 	%r5, 0x0a27, %r18
	.word 0xaa58c00c  ! 2: SMUL_R	smul 	%r3, %r12, %r21
	.word 0xa2d8800e  ! 2: SMULcc_R	smulcc 	%r2, %r14, %r17
	.word 0xa458c00a  ! 2: SMUL_R	smul 	%r3, %r10, %r18
	.word 0xbcd9000c  ! 2: SMULcc_R	smulcc 	%r4, %r12, %r30
	.word 0xb849000e  ! 2: MULX_R	mulx 	%r4, %r14, %r28
	.word 0xb459800c  ! 2: SMUL_R	smul 	%r6, %r12, %r26
	.word 0xacd9400b  ! 2: SMULcc_R	smulcc 	%r5, %r11, %r22
	.word 0xb3220009  ! 2: MULScc_R	mulscc 	%r8, %r9, %r25
	.word 0xa321ec1f  ! 2: MULScc_I	mulscc 	%r7, 0x0c1f, %r17
	.word 0xa2d0a089  ! 2: UMULcc_I	umulcc 	%r2, 0x0089, %r17
	.word 0xaf212500  ! 2: MULScc_I	mulscc 	%r4, 0x0500, %r23
	.word 0xac4a0009  ! 2: MULX_R	mulx 	%r8, %r9, %r22
	.word 0xa9222ebd  ! 2: MULScc_I	mulscc 	%r8, 0x0ebd, %r20
	.word 0xbd20800b  ! 2: MULScc_R	mulscc 	%r2, %r11, %r30
	.word 0xac4a000d  ! 2: MULX_R	mulx 	%r8, %r13, %r22
	.word 0xb2d12d5a  ! 2: UMULcc_I	umulcc 	%r4, 0x0d5a, %r25
	.word 0xa721e828  ! 2: MULScc_I	mulscc 	%r7, 0x0828, %r19
	.word 0xa2588009  ! 2: SMUL_R	smul 	%r2, %r9, %r17
	.word 0xb450800b  ! 2: UMUL_R	umul 	%r2, %r11, %r26
	.word 0xb251c00f  ! 2: UMUL_R	umul 	%r7, %r15, %r25
	.word 0xa4d1000a  ! 2: UMULcc_R	umulcc 	%r4, %r10, %r18
	.word 0xbc59000d  ! 2: SMUL_R	smul 	%r4, %r13, %r30
	.word 0xac5a000f  ! 2: SMUL_R	smul 	%r8, %r15, %r22
	.word 0xa051400a  ! 2: UMUL_R	umul 	%r5, %r10, %r16
	.word 0xa522000e  ! 2: MULScc_R	mulscc 	%r8, %r14, %r18
	.word 0xb6510009  ! 2: UMUL_R	umul 	%r4, %r9, %r27
	.word 0xb250c00b  ! 2: UMUL_R	umul 	%r3, %r11, %r25
	.word 0xb249e60c  ! 2: MULX_I	mulx 	%r7, 0x060c, %r25
	.word 0xb051c00e  ! 2: UMUL_R	umul 	%r7, %r14, %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0xb695f5014c2470e0, %r16, %r16
	setx  0x30afa7bef47d3d8f, %r16, %r17
	setx  0x0588bcfd02850b45, %r16, %r18
	setx  0x77e0257be316acd7, %r16, %r19
	setx  0x9be33253b97d0f04, %r16, %r20
	setx  0x554cb420a1d195db, %r16, %r21
	setx  0x7afc96b81b9184a8, %r16, %r22
	setx  0xa1662e0c29ffc1d4, %r16, %r23
	setx  0x8bab27e0818ba710, %r16, %r24
	setx  0x4d14f1f73b9ee858, %r16, %r25
	setx  0x769244a35bd23b4a, %r16, %r26
	setx  0xddb20ca60d98e6a5, %r16, %r27
	setx  0xd3da5bc39074d550, %r16, %r28
	setx  0xd811ed45d652627d, %r16, %r29
	setx  0xc40edb4d46729da4, %r16, %r30
	setx  0xcdfb889343ef7ee4, %r16, %r31
	setx  0x0000000000000490, %r16, %r9
	setx  0x0000000000000aa0, %r16, %r10
	setx  0x00000000000004a0, %r16, %r11
	setx  0x0000000000000bc0, %r16, %r12
	setx  0x0000000000000660, %r16, %r13
	setx  0x0000000000000740, %r16, %r14
	setx  0x0000000000000d40, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xfc21a83c  ! 4: STW_I	stw	%r30, [%r6 + 0x083c]
	.word 0xa09a2af2  ! 7: XORcc_I	xorcc 	%r8, 0x0af2, %r16
	.word 0xbb31800f  ! 9: SRL_R	srl 	%r6, %r15, %r29
	.word 0xb248c00f  ! 12: MULX_R	mulx 	%r3, %r15, %r25
.align 0x8
	.word 0x30800003  ! 14: BA	ba,a	<label_0x3>
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xe650800c  ! 17: LDSH_R	ldsh	[%r2 + %r12], %r19
	.word 0xaf32100d  ! 19: SRLX_R	srlx	%r8, %r13, %r23
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xbad9c009  ! 22: SMULcc_R	smulcc 	%r7, %r9, %r29
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,3,28)
	.word 0xb0a229cf  ! 25: SUBcc_I	subcc 	%r8, 0x09cf, %r24
.align 0x8
	.word 0x30800003  ! 27: BA	ba,a	<label_0x3>
	.word 0xea01663b  ! 30: LDUW_I	lduw	[%r5 + 0x063b], %r21
	.word 0xba41800c  ! 32: ADDC_R	addc 	%r6, %r12, %r29
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR_NIR,29,16)
	.word 0xaed0ab83  ! 35: UMULcc_I	umulcc 	%r2, 0x0b83, %r23
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xbeb1e776  ! 38: ORNcc_I	orncc 	%r7, 0x0776, %r31
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xab2a1009  ! 41: SLLX_R	sllx	%r8, %r9, %r21
	.word 0xa439e001  ! 44: XNOR_I	xnor 	%r7, 0x0001, %r18
	.word 0xb631800d  ! 46: ORN_R	orn 	%r6, %r13, %r27
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xae49c00b  ! 49: MULX_R	mulx 	%r7, %r11, %r23
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xe470a1d0  ! 52: STX_I	stx	%r18, [%r2 + 0x01d0]
	.word 0xa2b225fc  ! 55: ORNcc_I	orncc 	%r8, 0x05fc, %r17
	.word 0xa632000e  ! 57: SUBC_R	orn 	%r8, %r14, %r19
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xa059800d  ! 60: SMUL_R	smul 	%r6, %r13, %r16
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,69)
	.word 0xf2494000  ! 63: LDSB_R	ldsb	[%r5 + %r0], %r25
	.word 0xa0b8a4d8  ! 66: XNORcc_I	xnorcc 	%r2, 0x04d8, %r16
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xaa50c009  ! 69: UMUL_R	umul 	%r3, %r9, %r21
.align 0x8
	.word 0x30800003  ! 71: BA	ba,a	<label_0x3>
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xe4522206  ! 74: LDSH_I	ldsh	[%r8 + 0x0206], %r18
	.word 0xa641c00f  ! 76: ADDC_R	addc 	%r7, %r15, %r19
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,NIR,x,29)
	.word 0xbc51adc0  ! 79: UMUL_I	umul 	%r6, 0x0dc0, %r30
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xaeb921c3  ! 82: XNORcc_I	xnorcc 	%r4, 0x01c3, %r23
	.word 0xb011400d  ! 84: OR_R	or 	%r5, %r13, %r24
	.word 0xbd643801  ! 84: MOVcc_I	<illegal instruction>
	.word 0xb21924f4  ! 84: XOR_I	xor 	%r4, 0x04f4, %r25
	.word 0xa4012c08  ! 85: ADD_I	add 	%r4, 0x0c08, %r18
	.word 0xa212000d  ! 85: OR_R	or 	%r8, %r13, %r17
	.word 0xa728f001  ! 85: SLLX_I	sllx	%r3, 0x0001, %r19
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,25)
	.word 0xf6008000  ! 87: LDUW_R	lduw	[%r2 + %r0], %r27
	.word 0xa830a4f7  ! 90: ORN_I	orn 	%r2, 0x04f7, %r20
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xb721800d  ! 93: MULScc_R	mulscc 	%r6, %r13, %r27
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xec21e108  ! 96: STW_I	stw	%r22, [%r7 + 0x0108]
	.word 0xb1643801  ! 99: MOVcc_I	<illegal instruction>
	.word 0xaa998009  ! 101: XORcc_R	xorcc 	%r6, %r9, %r21
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xb2da2fc3  ! 104: SMULcc_I	smulcc 	%r8, 0x0fc3, %r25
	.word 0xec496aff  ! 107: LDSB_I	ldsb	[%r5 + 0x0aff], %r22
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xb4d1c00a  ! 110: UMULcc_R	umulcc 	%r7, %r10, %r26
	.word 0xe429afd7  ! 113: STB_I	stb	%r18, [%r6 + 0x0fd7]
	.word 0xac3a006a  ! 116: XNOR_R	xnor 	%r8, %r10, %r22
	.word 0xaa29aed6  ! 118: ANDN_I	andn 	%r6, 0x0ed6, %r21
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xa849e9ef  ! 121: MULX_I	mulx 	%r7, 0x09ef, %r20
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xf2712b20  ! 124: STX_I	stx	%r25, [%r4 + 0x0b20]
	.word 0xa4212aaa  ! 127: SUB_I	sub 	%r4, 0x0aaa, %r18
	.word 0xb4422bf9  ! 129: ADDC_I	addc 	%r8, 0x0bf9, %r26
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR_NIR,33,24)
	.word 0xb521ec5f  ! 132: MULScc_I	mulscc 	%r7, 0x0c5f, %r26
	.word 0xb8b1eff0  ! 134: ORNcc_I	orncc 	%r7, 0x0ff0, %r28
	.word 0xae81800a  ! 134: ADDcc_R	addcc 	%r6, %r10, %r23
	.word 0xbc916ff4  ! 134: ORcc_I	orcc 	%r5, 0x0ff4, %r30
	.word 0xa4c0c00b  ! 134: ADDCcc_R	addccc 	%r3, %r11, %r18
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xf421e63c  ! 136: STW_I	stw	%r26, [%r7 + 0x063c]
	.word 0xaa81406e  ! 139: ADDcc_R	addcc 	%r5, %r14, %r21
	.word 0xa281800d  ! 141: ADDcc_R	addcc 	%r6, %r13, %r17
	.word 0xba48a84c  ! 144: MULX_I	mulx 	%r2, 0x084c, %r29
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,3,26)
	.word 0xa890800c  ! 147: ORcc_R	orcc 	%r2, %r12, %r20
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xf4712088  ! 150: STX_I	stx	%r26, [%r4 + 0x0088]
	.word 0xaf2a106c  ! 153: SLLX_R	sllx	%r8, %r12, %r23
	.word 0xb4aa000a  ! 155: ANDNcc_R	andncc 	%r8, %r10, %r26
	.word 0xb249400c  ! 158: MULX_R	mulx 	%r5, %r12, %r25
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xb164180f  ! 161: MOVcc_R	<illegal instruction>
	.word 0xa090ea01  ! 163: ORcc_I	orcc 	%r3, 0x0a01, %r16
	.word 0xbe3126ac  ! 163: ORN_I	orn 	%r4, 0x06ac, %r31
	.word 0xb2b12db5  ! 163: ORNcc_I	orncc 	%r4, 0x0db5, %r25
	.word 0xb0b1800c  ! 163: ORNcc_R	orncc 	%r6, %r12, %r24
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,26)
	.word 0xfa1a0000  ! 165: LDD_R	ldd	[%r8 + %r0], %r29
	.word 0xae30c06c  ! 168: ORN_R	orn 	%r3, %r12, %r23
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,10,9)
	.word 0xb5212024  ! 171: MULScc_I	mulscc 	%r4, 0x0024, %r26
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xfa31e4cc  ! 174: STH_I	sth	%r29, [%r7 + 0x04cc]
	.word 0xbb28b061  ! 177: SLLX_I	sllx	%r2, 0x0021, %r29
	.word 0xb329100c  ! 179: SLLX_R	sllx	%r4, %r12, %r25
	.word 0xb651000b  ! 182: UMUL_R	umul 	%r4, %r11, %r27
	.word 0xbf78040d  ! 184: MOVR_R	move	%r0, %r13, %r31
	.word 0xad31d00e  ! 184: SRLX_R	srlx	%r7, %r14, %r22
	.word 0xb329000b  ! 184: SLL_R	sll 	%r4, %r11, %r25
	.word 0xad3a000e  ! 184: SRA_R	sra 	%r8, %r14, %r22
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xe601e647  ! 187: LDUW_I	lduw	[%r7 + 0x0647], %r19
	.word 0xba5a27dd  ! 190: SMUL_I	smul 	%r8, 0x07dd, %r29
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xbc09000a  ! 193: AND_R	and 	%r4, %r10, %r30
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xae99242b  ! 196: XORcc_I	xorcc 	%r4, 0x042b, %r23
	.word 0xb489a1f6  ! 199: ANDcc_I	andcc 	%r6, 0x01f6, %r26
	.word 0xa2822487  ! 201: ADDcc_I	addcc 	%r8, 0x0487, %r17
	.word 0xbc516222  ! 204: UMUL_I	umul 	%r5, 0x0222, %r30
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe64122e1  ! 208: LDSW_I	ldsw	[%r4 + 0x02e1], %r19
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xb0d0c00c  ! 211: UMULcc_R	umulcc 	%r3, %r12, %r24
	.word 0xb0b1c00a  ! 213: ORNcc_R	orncc 	%r7, %r10, %r24
	.word 0xba30c009  ! 213: ORN_R	orn 	%r3, %r9, %r29
	.word 0xa330f001  ! 213: SRLX_I	srlx	%r3, 0x0001, %r17
	.word 0xba40c009  ! 213: ADDC_R	addc 	%r3, %r9, %r29
	.word 0xb6a8800a  ! 213: ANDNcc_R	andncc 	%r2, %r10, %r27
	.word 0xb209c00a  ! 214: AND_R	and 	%r7, %r10, %r25
	.word 0xad38c00f  ! 214: SRA_R	sra 	%r3, %r15, %r22
	.word 0xb8814009  ! 214: ADDcc_R	addcc 	%r5, %r9, %r28
	.word 0xa4b2000a  ! 214: ORNcc_R	orncc 	%r8, %r10, %r18
	.word 0xaa01ef24  ! 214: ADD_I	add 	%r7, 0x0f24, %r21
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,57)
	.word 0xf619c000  ! 216: LDD_R	ldd	[%r7 + %r0], %r27
	.word 0xbca1806e  ! 219: SUBcc_R	subcc 	%r6, %r14, %r30
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xb449a989  ! 222: MULX_I	mulx 	%r6, 0x0989, %r26
	.word 0xe67168b0  ! 225: STX_I	stx	%r19, [%r5 + 0x08b0]
	.word 0xa420c06f  ! 228: SUB_R	sub 	%r3, %r15, %r18
	.word 0xa978040b  ! 230: MOVR_R	move	%r0, %r11, %r20
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,26,15)
	.word 0xb44968e9  ! 233: MULX_I	mulx 	%r5, 0x08e9, %r26
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xe220eb0f  ! 237: STW_I	stw	%r17, [%r3 + 0x0b0f]
	.word 0xbb395069  ! 240: SRAX_R	srax	%r5, %r9, %r29
	.word 0xa840a3d9  ! 242: ADDC_I	addc 	%r2, 0x03d9, %r20
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xb520c00f  ! 245: MULScc_R	mulscc 	%r3, %r15, %r26
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,31)
	.word 0xfc0a0000  ! 248: LDUB_R	ldub	[%r8 + %r0], %r30
	.word 0xa7393061  ! 251: SRAX_I	srax	%r4, 0x0021, %r19
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xa121642d  ! 254: MULScc_I	mulscc 	%r5, 0x042d, %r16
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xf230a5c4  ! 257: STH_I	sth	%r25, [%r2 + 0x05c4]
	.word 0xb2b96be5  ! 260: XNORcc_I	xnorcc 	%r5, 0x0be5, %r25
	.word 0xa8a1c00d  ! 262: SUBcc_R	subcc 	%r7, %r13, %r20
	.word 0xb658800b  ! 265: SMUL_R	smul 	%r2, %r11, %r27
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,NIR,x,4)
	.word 0xa9643801  ! 268: MOVcc_I	<illegal instruction>
	.word 0xb4b1af95  ! 270: ORNcc_I	orncc 	%r6, 0x0f95, %r26
	.word 0xb011211f  ! 270: OR_I	or 	%r4, 0x011f, %r24
	.word 0xa9297001  ! 270: SLLX_I	sllx	%r5, 0x0001, %r20
	.word 0xa801c009  ! 271: ADD_R	add 	%r7, %r9, %r20
	.word 0xa8ba000e  ! 271: XNORcc_R	xnorcc 	%r8, %r14, %r20
	.word 0xaab1c00a  ! 271: ORNcc_R	orncc 	%r7, %r10, %r21
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf020e9f8  ! 273: STW_I	stw	%r24, [%r3 + 0x09f8]
	.word 0xb8a9e5ed  ! 276: ANDNcc_I	andncc 	%r7, 0x05ed, %r28
	.word 0xa890e764  ! 278: ORcc_I	orcc 	%r3, 0x0764, %r20
	.word 0xb8d12ae7  ! 281: UMULcc_I	umulcc 	%r4, 0x0ae7, %r28
thr1_ic_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,NIR,x,20)
	.word 0xbd39e001  ! 284: SRA_I	sra 	%r7, 0x0001, %r30
	.word 0xb2b1400a  ! 286: ORNcc_R	orncc 	%r5, %r10, %r25
	.word 0xbe11203e  ! 286: OR_I	or 	%r4, 0x003e, %r31
	.word 0xa492000f  ! 286: ORcc_R	orcc 	%r8, %r15, %r18
	.word 0xa218c00f  ! 287: XOR_R	xor 	%r3, %r15, %r17
	.word 0xb812000a  ! 287: OR_R	or 	%r8, %r10, %r28
	.word 0xbd29800e  ! 287: SLL_R	sll 	%r6, %r14, %r30
	.word 0xe431a425  ! 289: STH_I	sth	%r18, [%r6 + 0x0425]
	.word 0xae18e5e8  ! 292: XOR_I	xor 	%r3, 0x05e8, %r23
	.word 0xa2b9400b  ! 294: XNORcc_R	xnorcc 	%r5, %r11, %r17
	.word 0xa6d1c00c  ! 297: UMULcc_R	umulcc 	%r7, %r12, %r19
	.word 0xb8b9400a  ! 299: XNORcc_R	xnorcc 	%r5, %r10, %r28
	.word 0xb230a9d2  ! 299: ORN_I	orn 	%r2, 0x09d2, %r25
	.word 0xb12a100b  ! 299: SLLX_R	sllx	%r8, %r11, %r24
	.word 0xbc392fb6  ! 299: XNOR_I	xnor 	%r4, 0x0fb6, %r30
	.word 0xb0c16266  ! 299: ADDCcc_I	addccc 	%r5, 0x0266, %r24
	.word 0xf8722c18  ! 301: STX_I	stx	%r28, [%r8 + 0x0c18]
	.word 0xb081aa48  ! 304: ADDcc_I	addcc 	%r6, 0x0a48, %r24
	.word 0xa729000c  ! 306: SLL_R	sll 	%r4, %r12, %r19
	.word 0xa0d0e0e7  ! 309: UMULcc_I	umulcc 	%r3, 0x00e7, %r16
	.word 0xbb782401  ! 311: MOVR_I	move	%r0, 0xffffffe0, %r29
	.word 0xbab22a44  ! 311: ORNcc_I	orncc 	%r8, 0x0a44, %r29
	.word 0xb23166e3  ! 311: ORN_I	orn 	%r5, 0x06e3, %r25
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xec716c00  ! 313: STX_I	stx	%r22, [%r5 + 0x0c00]
	.word 0xaa89a74d  ! 316: ANDcc_I	andcc 	%r6, 0x074d, %r21
	.word 0xb4a1eb73  ! 318: SUBcc_I	subcc 	%r7, 0x0b73, %r26
thr1_ic_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xbe51aee5  ! 321: UMUL_I	umul 	%r6, 0x0ee5, %r31
	.word 0xb281800a  ! 323: ADDcc_R	addcc 	%r6, %r10, %r25
	.word 0xb2b9800d  ! 323: XNORcc_R	xnorcc 	%r6, %r13, %r25
	.word 0xa680e05f  ! 323: ADDcc_I	addcc 	%r3, 0x005f, %r19
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xf62922c6  ! 325: STB_I	stb	%r27, [%r4 + 0x02c6]
	.word 0xa08a000c  ! 328: ANDcc_R	andcc 	%r8, %r12, %r16
	.word 0xa2a8c00f  ! 330: ANDNcc_R	andncc 	%r3, %r15, %r17
	.word 0xab218009  ! 333: MULScc_R	mulscc 	%r6, %r9, %r21
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xe208e501  ! 337: LDUB_I	ldub	[%r3 + 0x0501], %r17
	.word 0xb8d0800a  ! 340: UMULcc_R	umulcc 	%r2, %r10, %r28
thr1_ic_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xaea2000e  ! 343: SUBcc_R	subcc 	%r8, %r14, %r23
	.word 0xbf30a001  ! 345: SRL_I	srl 	%r2, 0x0001, %r31
	.word 0xbe81a771  ! 345: ADDcc_I	addcc 	%r6, 0x0771, %r31
	.word 0xa531000c  ! 345: SRL_R	srl 	%r4, %r12, %r18
	.word 0xb4b9800c  ! 345: XNORcc_R	xnorcc 	%r6, %r12, %r26
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xe020e4b4  ! 347: STW_I	stw	%r16, [%r3 + 0x04b4]
	.word 0xac312dfc  ! 350: SUBC_I	orn 	%r4, 0x0dfc, %r22
	.word 0xb232000f  ! 352: ORN_R	orn 	%r8, %r15, %r25
thr1_ic_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xb448800a  ! 355: MULX_R	mulx 	%r2, %r10, %r26
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xf221adec  ! 358: STW_I	stw	%r25, [%r6 + 0x0dec]
	.word 0xb8b9a11e  ! 361: XNORcc_I	xnorcc 	%r6, 0x011e, %r28
	.word 0xa2416120  ! 363: ADDC_I	addc 	%r5, 0x0120, %r17
	.word 0xa921400a  ! 366: MULScc_R	mulscc 	%r5, %r10, %r20
thr1_ic_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xacb1000a  ! 369: ORNcc_R	orncc 	%r4, %r10, %r22
	.word 0xa439c009  ! 371: XNOR_R	xnor 	%r7, %r9, %r18
	.word 0xbd396001  ! 371: SRA_I	sra 	%r5, 0x0001, %r30
	.word 0xa139500f  ! 371: SRAX_R	srax	%r5, %r15, %r16
	.word 0xbeb0800f  ! 371: ORNcc_R	orncc 	%r2, %r15, %r31
	.word 0xacb9800e  ! 371: XNORcc_R	xnorcc 	%r6, %r14, %r22
	.word 0xb841c00c  ! 372: ADDC_R	addc 	%r7, %r12, %r28
	.word 0xa04227f6  ! 372: ADDC_I	addc 	%r8, 0x07f6, %r16
	.word 0xb88a000c  ! 372: ANDcc_R	andcc 	%r8, %r12, %r28
	.word 0xbcc1aa4c  ! 372: ADDCcc_I	addccc 	%r6, 0x0a4c, %r30
	.word 0xbc812436  ! 372: ADDcc_I	addcc 	%r4, 0x0436, %r30
	.word 0xaf64180b  ! 373: MOVcc_R	<illegal instruction>
	.word 0xaeb9000e  ! 373: XNORcc_R	xnorcc 	%r4, %r14, %r23
	.word 0xa4916933  ! 373: ORcc_I	orcc 	%r5, 0x0933, %r18
	.word 0xb088ac03  ! 373: ANDcc_I	andcc 	%r2, 0x0c03, %r24
	.word 0xbd30900b  ! 373: SRLX_R	srlx	%r2, %r11, %r30
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xac3a000d  ! 375: XNOR_R	xnor 	%r8, %r13, %r22
	.word 0xaa91c06b  ! 378: ORcc_R	orcc 	%r7, %r11, %r21
	.word 0xa2a96e02  ! 380: ANDNcc_I	andncc 	%r5, 0x0e02, %r17
thr1_ic_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_29), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xa048800d  ! 383: MULX_R	mulx 	%r2, %r13, %r16
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,36)
	.word 0xfe490000  ! 386: LDSB_R	ldsb	[%r4 + %r0], %r31
	.word 0xad2a100e  ! 389: SLLX_R	sllx	%r8, %r14, %r22
	.word 0xb8da000c  ! 392: SMULcc_R	smulcc 	%r8, %r12, %r28
thr1_ic_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_30), 16, 16),1,IC_DATA,NIR,x,16)
	.word 0xab782401  ! 395: MOVR_I	move	%r0, 0x7fffbdc0, %r21
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,51)
	.word 0xf2514000  ! 398: LDSH_R	ldsh	[%r5 + %r0], %r25
	.word 0xb401806d  ! 401: ADD_R	add 	%r6, %r13, %r26
	.word 0xbed1205b  ! 404: UMULcc_I	umulcc 	%r4, 0x005b, %r31
thr1_ic_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_31), 16, 16),1,IC_DATA,NIR,x,16)
	.word 0xbf30900d  ! 407: SRLX_R	srlx	%r2, %r13, %r31
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf849c00f  ! 411: LDSB_R	ldsb	[%r7 + %r15], %r28
thr1_ic_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_32), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xba492a8f  ! 414: MULX_I	mulx 	%r4, 0x0a8f, %r29
	.word 0xe4192468  ! 417: LDD_I	ldd	[%r4 + 0x0468], %r18
	.word 0xbcd1400f  ! 420: UMULcc_R	umulcc 	%r5, %r15, %r30
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xa43a000e  ! 423: XNOR_R	xnor 	%r8, %r14, %r18
	.word 0xaa9a26bb  ! 426: XORcc_I	xorcc 	%r8, 0x06bb, %r21
	.word 0xa040c00f  ! 428: ADDC_R	addc 	%r3, %r15, %r16
	.word 0xb251000d  ! 431: UMUL_R	umul 	%r4, %r13, %r25
thr1_ic_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_33), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xa9312001  ! 434: SRL_I	srl 	%r4, 0x0001, %r20
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,45)
	.word 0xfa594000  ! 437: LDX_R	ldx	[%r5 + %r0], %r29
	.word 0xa612000b  ! 440: OR_R	or 	%r8, %r11, %r19
	.word 0xb2d0e221  ! 443: UMULcc_I	umulcc 	%r3, 0x0221, %r25
thr1_ic_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_34), 16, 16),1,IC_DATA,NIR,x,29)
	.word 0xb731400c  ! 446: SRL_R	srl 	%r5, %r12, %r27
	.word 0xb0194009  ! 448: XOR_R	xor 	%r5, %r9, %r24
	.word 0xb3643801  ! 448: MOVcc_I	<illegal instruction>
	.word 0xbe19e1b9  ! 448: XOR_I	xor 	%r7, 0x01b9, %r31
	.word 0xa929f001  ! 448: SLLX_I	sllx	%r7, 0x0001, %r20
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,0)
	.word 0xee020000  ! 450: LDUW_R	lduw	[%r8 + %r0], %r23
	.word 0xa9782461  ! 453: MOVR_I	move	%r0, 0x7fffbdc0, %r20
thr1_ic_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_35), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xaad0e35e  ! 456: UMULcc_I	umulcc 	%r3, 0x035e, %r21
	.word 0xba88800a  ! 458: ANDcc_R	andcc 	%r2, %r10, %r29
	.word 0xa8192295  ! 458: XOR_I	xor 	%r4, 0x0295, %r20
	.word 0xae09eb43  ! 458: AND_I	and 	%r7, 0x0b43, %r23
	.word 0xa090e652  ! 458: ORcc_I	orcc 	%r3, 0x0652, %r16
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,32)
	.word 0xf810c000  ! 460: LDUH_R	lduh	[%r3 + %r0], %r28
	.word 0xb7643861  ! 463: MOVcc_I	<illegal instruction>
thr1_ic_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_36), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xbed8e035  ! 466: SMULcc_I	smulcc 	%r3, 0x0035, %r31
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xbe82000d  ! 469: ADDcc_R	addcc 	%r8, %r13, %r31
	.word 0xa564186c  ! 472: MOVcc_R	<illegal instruction>
	.word 0xbab1a98b  ! 474: ORNcc_I	orncc 	%r6, 0x098b, %r29
thr1_ic_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_37), 16, 16),1,IC_DATA,IR_NIR,25,11)
	.word 0xb859400f  ! 477: SMUL_R	smul 	%r5, %r15, %r28
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xe2412815  ! 481: LDSW_I	ldsw	[%r4 + 0x0815], %r17
	.word 0xb120a724  ! 484: MULScc_I	mulscc 	%r2, 0x0724, %r24
	.word 0xb2c0ed40  ! 486: ADDCcc_I	addccc 	%r3, 0x0d40, %r25
	.word 0xae99c00b  ! 486: XORcc_R	xorcc 	%r7, %r11, %r23
	.word 0xba08a997  ! 486: AND_I	and 	%r2, 0x0997, %r29
	.word 0xae92000d  ! 486: ORcc_R	orcc 	%r8, %r13, %r23
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,54)
	.word 0xea18c000  ! 488: LDD_R	ldd	[%r3 + %r0], %r21
	.word 0xac09c00a  ! 491: AND_R	and 	%r7, %r10, %r22
	.word 0xb6d9800c  ! 494: SMULcc_R	smulcc 	%r6, %r12, %r27
	.word 0xfe21a9b1  ! 497: STW_I	stw	%r31, [%r6 + 0x09b1]
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x2ba4d589798013d0, %r16, %r16
	setx  0xcf73317c7caeffe2, %r16, %r17
	setx  0x829d4f64ba43c0f5, %r16, %r18
	setx  0xce0222f1dbb9ef2e, %r16, %r19
	setx  0xa22c7643edb7ce21, %r16, %r20
	setx  0x679ab21e5098bf72, %r16, %r21
	setx  0x9375618c9634f606, %r16, %r22
	setx  0x22d9179b5dc2af74, %r16, %r23
	setx  0x8dd0cdaafbf1c725, %r16, %r24
	setx  0x80ef5014e78ed2c7, %r16, %r25
	setx  0xef3741889c839944, %r16, %r26
	setx  0x03531ce5706d6156, %r16, %r27
	setx  0xd0ea1c3644942c78, %r16, %r28
	setx  0x2902330966289937, %r16, %r29
	setx  0xf0ff8e7160969a84, %r16, %r30
	setx  0x602a6e4a25725f9a, %r16, %r31
	setx  0x00000000000005b0, %r16, %r9
	setx  0x0000000000000320, %r16, %r10
	setx  0x00000000000000a0, %r16, %r11
	setx  0x0000000000000090, %r16, %r12
	setx  0x00000000000000d0, %r16, %r13
	setx  0x0000000000000d40, %r16, %r14
	setx  0x0000000000000980, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xfc21efdc  ! 4: STW_I	stw	%r30, [%r7 + 0x0fdc]
	.word 0xb898e2eb  ! 7: XORcc_I	xorcc 	%r3, 0x02eb, %r28
	.word 0xa331c00b  ! 9: SRL_R	srl 	%r7, %r11, %r17
	.word 0xae49c00b  ! 12: MULX_R	mulx 	%r7, %r11, %r23
.align 0x8
	.word 0x30800003  ! 14: BA	ba,a	<label_0x3>
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xe451400f  ! 17: LDSH_R	ldsh	[%r5 + %r15], %r18
	.word 0xa732100f  ! 19: SRLX_R	srlx	%r8, %r15, %r19
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xbed9c00a  ! 22: SMULcc_R	smulcc 	%r7, %r10, %r31
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,3,28)
	.word 0xaaa16f24  ! 25: SUBcc_I	subcc 	%r5, 0x0f24, %r21
.align 0x8
	.word 0x30800003  ! 27: BA	ba,a	<label_0x3>
	.word 0xea0165d5  ! 30: LDUW_I	lduw	[%r5 + 0x05d5], %r21
	.word 0xa041000d  ! 32: ADDC_R	addc 	%r4, %r13, %r16
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR_NIR,29,16)
	.word 0xa6d0e667  ! 35: UMULcc_I	umulcc 	%r3, 0x0667, %r19
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xaeb0a62a  ! 38: ORNcc_I	orncc 	%r2, 0x062a, %r23
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xb728d00e  ! 41: SLLX_R	sllx	%r3, %r14, %r27
	.word 0xb439a121  ! 44: XNOR_I	xnor 	%r6, 0x0121, %r26
	.word 0xb830c009  ! 46: ORN_R	orn 	%r3, %r9, %r28
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xbc49000a  ! 49: MULX_R	mulx 	%r4, %r10, %r30
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xee712d58  ! 52: STX_I	stx	%r23, [%r4 + 0x0d58]
	.word 0xaab0e63a  ! 55: ORNcc_I	orncc 	%r3, 0x063a, %r21
	.word 0xb230800d  ! 57: SUBC_R	orn 	%r2, %r13, %r25
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xb259400b  ! 60: SMUL_R	smul 	%r5, %r11, %r25
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,69)
	.word 0xf2494000  ! 63: LDSB_R	ldsb	[%r5 + %r0], %r25
	.word 0xbcb8ae11  ! 66: XNORcc_I	xnorcc 	%r2, 0x0e11, %r30
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xa452000c  ! 69: UMUL_R	umul 	%r8, %r12, %r18
.align 0x8
	.word 0x30800003  ! 71: BA	ba,a	<label_0x3>
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xe8512cd2  ! 74: LDSH_I	ldsh	[%r4 + 0x0cd2], %r20
	.word 0xbc420009  ! 76: ADDC_R	addc 	%r8, %r9, %r30
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,NIR,x,29)
	.word 0xb65122ac  ! 79: UMUL_I	umul 	%r4, 0x02ac, %r27
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xb8ba2a99  ! 82: XNORcc_I	xnorcc 	%r8, 0x0a99, %r28
	.word 0xa411800c  ! 84: OR_R	or 	%r6, %r12, %r18
	.word 0xab643801  ! 84: MOVcc_I	<illegal instruction>
	.word 0xa619a7c0  ! 84: XOR_I	xor 	%r6, 0x07c0, %r19
	.word 0xa201e296  ! 85: ADD_I	add 	%r7, 0x0296, %r17
	.word 0xb012000e  ! 85: OR_R	or 	%r8, %r14, %r24
	.word 0xb728b001  ! 85: SLLX_I	sllx	%r2, 0x0001, %r27
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,25)
	.word 0xf6008000  ! 87: LDUW_R	lduw	[%r2 + %r0], %r27
	.word 0xa631a67b  ! 90: ORN_I	orn 	%r6, 0x067b, %r19
thr0_ic_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xa1220009  ! 93: MULScc_R	mulscc 	%r8, %r9, %r16
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xe620ec1c  ! 96: STW_I	stw	%r19, [%r3 + 0x0c1c]
	.word 0xb9643801  ! 99: MOVcc_I	<illegal instruction>
	.word 0xa698800b  ! 101: XORcc_R	xorcc 	%r2, %r11, %r19
thr0_ic_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_10), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xacd96bd6  ! 104: SMULcc_I	smulcc 	%r5, 0x0bd6, %r22
	.word 0xec49681f  ! 107: LDSB_I	ldsb	[%r5 + 0x081f], %r22
thr0_ic_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_11), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xa4d1800a  ! 110: UMULcc_R	umulcc 	%r6, %r10, %r18
	.word 0xe429a347  ! 113: STB_I	stb	%r18, [%r6 + 0x0347]
	.word 0xaa39006e  ! 116: XNOR_R	xnor 	%r4, %r14, %r21
	.word 0xb229a4e9  ! 118: ANDN_I	andn 	%r6, 0x04e9, %r25
thr0_ic_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_12), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xac49a110  ! 121: MULX_I	mulx 	%r6, 0x0110, %r22
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xf271ea78  ! 124: STX_I	stx	%r25, [%r7 + 0x0a78]
	.word 0xa621274a  ! 127: SUB_I	sub 	%r4, 0x074a, %r19
	.word 0xb240aaaa  ! 129: ADDC_I	addc 	%r2, 0x0aaa, %r25
thr0_ic_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_13), 16, 16),1,IC_DATA,IR_NIR,33,24)
	.word 0xa321a09b  ! 132: MULScc_I	mulscc 	%r6, 0x009b, %r17
	.word 0xb0b22ba7  ! 134: ORNcc_I	orncc 	%r8, 0x0ba7, %r24
	.word 0xac820009  ! 134: ADDcc_R	addcc 	%r8, %r9, %r22
	.word 0xa091eb57  ! 134: ORcc_I	orcc 	%r7, 0x0b57, %r16
	.word 0xaec1800b  ! 134: ADDCcc_R	addccc 	%r6, %r11, %r23
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xf82160b0  ! 136: STW_I	stw	%r28, [%r5 + 0x00b0]
	.word 0xa481406b  ! 139: ADDcc_R	addcc 	%r5, %r11, %r18
	.word 0xa880c00b  ! 141: ADDcc_R	addcc 	%r3, %r11, %r20
	.word 0xa049e3fd  ! 144: MULX_I	mulx 	%r7, 0x03fd, %r16
thr0_ic_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,3,26)
	.word 0xb490c00b  ! 147: ORcc_R	orcc 	%r3, %r11, %r26
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xe2722498  ! 150: STX_I	stx	%r17, [%r8 + 0x0498]
	.word 0xa529906a  ! 153: SLLX_R	sllx	%r6, %r10, %r18
	.word 0xb0a9c00b  ! 155: ANDNcc_R	andncc 	%r7, %r11, %r24
	.word 0xaa490009  ! 158: MULX_R	mulx 	%r4, %r9, %r21
thr0_ic_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_15), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xab64180e  ! 161: MOVcc_R	<illegal instruction>
	.word 0xa491a90f  ! 163: ORcc_I	orcc 	%r6, 0x090f, %r18
	.word 0xaa30a262  ! 163: ORN_I	orn 	%r2, 0x0262, %r21
	.word 0xb4b0a70c  ! 163: ORNcc_I	orncc 	%r2, 0x070c, %r26
	.word 0xbab2000a  ! 163: ORNcc_R	orncc 	%r8, %r10, %r29
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,26)
	.word 0xfa1a0000  ! 165: LDD_R	ldd	[%r8 + %r0], %r29
	.word 0xbc31c06e  ! 168: ORN_R	orn 	%r7, %r14, %r30
thr0_ic_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,10,9)
	.word 0xad21e26f  ! 171: MULScc_I	mulscc 	%r7, 0x026f, %r22
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,50,x, x,x,x, x,x,x)
	.word 0xe2312bda  ! 174: STH_I	sth	%r17, [%r4 + 0x0bda]
	.word 0xa5293061  ! 177: SLLX_I	sllx	%r4, 0x0021, %r18
	.word 0xb329900c  ! 179: SLLX_R	sllx	%r6, %r12, %r25
	.word 0xbc50800e  ! 182: UMUL_R	umul 	%r2, %r14, %r30
	.word 0xa578040b  ! 184: MOVR_R	move	%r0, %r11, %r18
	.word 0xb930d00a  ! 184: SRLX_R	srlx	%r3, %r10, %r28
	.word 0xb329400f  ! 184: SLL_R	sll 	%r5, %r15, %r25
	.word 0xa739c009  ! 184: SRA_R	sra 	%r7, %r9, %r19
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xe601e399  ! 187: LDUW_I	lduw	[%r7 + 0x0399], %r19
	.word 0xbc58eb33  ! 190: SMUL_I	smul 	%r3, 0x0b33, %r30
thr0_ic_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_17), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xbc09000c  ! 193: AND_R	and 	%r4, %r12, %r30
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xba9a2cd4  ! 196: XORcc_I	xorcc 	%r8, 0x0cd4, %r29
	.word 0xba89a8d4  ! 199: ANDcc_I	andcc 	%r6, 0x08d4, %r29
	.word 0xba812b38  ! 201: ADDcc_I	addcc 	%r4, 0x0b38, %r29
	.word 0xa6512b71  ! 204: UMUL_I	umul 	%r4, 0x0b71, %r19
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe64124ab  ! 208: LDSW_I	ldsw	[%r4 + 0x04ab], %r19
thr0_ic_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_18), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xb4d2000e  ! 211: UMULcc_R	umulcc 	%r8, %r14, %r26
	.word 0xb8b0c00b  ! 213: ORNcc_R	orncc 	%r3, %r11, %r28
	.word 0xb031000d  ! 213: ORN_R	orn 	%r4, %r13, %r24
	.word 0xb130f001  ! 213: SRLX_I	srlx	%r3, 0x0001, %r24
	.word 0xbe41000c  ! 213: ADDC_R	addc 	%r4, %r12, %r31
	.word 0xb4a90009  ! 213: ANDNcc_R	andncc 	%r4, %r9, %r26
	.word 0xa0088009  ! 214: AND_R	and 	%r2, %r9, %r16
	.word 0xab388009  ! 214: SRA_R	sra 	%r2, %r9, %r21
	.word 0xb081c00e  ! 214: ADDcc_R	addcc 	%r7, %r14, %r24
	.word 0xb6b0c00e  ! 214: ORNcc_R	orncc 	%r3, %r14, %r27
	.word 0xb601e6d7  ! 214: ADD_I	add 	%r7, 0x06d7, %r27
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,57)
	.word 0xf619c000  ! 216: LDD_R	ldd	[%r7 + %r0], %r27
	.word 0xbea20069  ! 219: SUBcc_R	subcc 	%r8, %r9, %r31
thr0_ic_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_19), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xb849a1b9  ! 222: MULX_I	mulx 	%r6, 0x01b9, %r28
	.word 0xe2712778  ! 225: STX_I	stx	%r17, [%r4 + 0x0778]
	.word 0xbe22006b  ! 228: SUB_R	sub 	%r8, %r11, %r31
	.word 0xb578040e  ! 230: MOVR_R	move	%r0, %r14, %r26
thr0_ic_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,26,15)
	.word 0xa248ec9e  ! 233: MULX_I	mulx 	%r3, 0x0c9e, %r17
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xe220ec8f  ! 237: STW_I	stw	%r17, [%r3 + 0x0c8f]
	.word 0xb139906f  ! 240: SRAX_R	srax	%r6, %r15, %r24
	.word 0xb0422d7a  ! 242: ADDC_I	addc 	%r8, 0x0d7a, %r24
thr0_ic_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_21), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xbd22000f  ! 245: MULScc_R	mulscc 	%r8, %r15, %r30
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,31)
	.word 0xfc0a0000  ! 248: LDUB_R	ldub	[%r8 + %r0], %r30
	.word 0xab38f061  ! 251: SRAX_I	srax	%r3, 0x0021, %r21
thr0_ic_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_22), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xa5216bad  ! 254: MULScc_I	mulscc 	%r5, 0x0bad, %r18
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xf230ed4e  ! 257: STH_I	sth	%r25, [%r3 + 0x0d4e]
	.word 0xa0b9a9e1  ! 260: XNORcc_I	xnorcc 	%r6, 0x09e1, %r16
	.word 0xa6a0c00b  ! 262: SUBcc_R	subcc 	%r3, %r11, %r19
	.word 0xaa58c00e  ! 265: SMUL_R	smul 	%r3, %r14, %r21
thr0_ic_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_23), 16, 16),1,IC_DATA,NIR,x,4)
	.word 0xaf643801  ! 268: MOVcc_I	<illegal instruction>
	.word 0xb4b0ae11  ! 270: ORNcc_I	orncc 	%r2, 0x0e11, %r26
	.word 0xaa10ed4a  ! 270: OR_I	or 	%r3, 0x0d4a, %r21
	.word 0xbf293001  ! 270: SLLX_I	sllx	%r4, 0x0001, %r31
	.word 0xaa008009  ! 271: ADD_R	add 	%r2, %r9, %r21
	.word 0xb8b9800c  ! 271: XNORcc_R	xnorcc 	%r6, %r12, %r28
	.word 0xb0b1000a  ! 271: ORNcc_R	orncc 	%r4, %r10, %r24
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xe420a7b8  ! 273: STW_I	stw	%r18, [%r2 + 0x07b8]
	.word 0xb6a8aee5  ! 276: ANDNcc_I	andncc 	%r2, 0x0ee5, %r27
	.word 0xa2912538  ! 278: ORcc_I	orcc 	%r4, 0x0538, %r17
	.word 0xbad22d45  ! 281: UMULcc_I	umulcc 	%r8, 0x0d45, %r29
thr0_ic_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_24), 16, 16),1,IC_DATA,NIR,x,20)
	.word 0xa539a001  ! 284: SRA_I	sra 	%r6, 0x0001, %r18
	.word 0xa6b2000b  ! 286: ORNcc_R	orncc 	%r8, %r11, %r19
	.word 0xb810a699  ! 286: OR_I	or 	%r2, 0x0699, %r28
	.word 0xbc91000a  ! 286: ORcc_R	orcc 	%r4, %r10, %r30
	.word 0xaa19c00d  ! 287: XOR_R	xor 	%r7, %r13, %r21
	.word 0xaa108009  ! 287: OR_R	or 	%r2, %r9, %r21
	.word 0xa529800d  ! 287: SLL_R	sll 	%r6, %r13, %r18
	.word 0xe431a541  ! 289: STH_I	sth	%r18, [%r6 + 0x0541]
	.word 0xb419a8ef  ! 292: XOR_I	xor 	%r6, 0x08ef, %r26
	.word 0xa2b9000a  ! 294: XNORcc_R	xnorcc 	%r4, %r10, %r17
	.word 0xaed1400b  ! 297: UMULcc_R	umulcc 	%r5, %r11, %r23
	.word 0xa8ba000b  ! 299: XNORcc_R	xnorcc 	%r8, %r11, %r20
	.word 0xa6312663  ! 299: ORN_I	orn 	%r4, 0x0663, %r19
	.word 0xa529900d  ! 299: SLLX_R	sllx	%r6, %r13, %r18
	.word 0xa439e15f  ! 299: XNOR_I	xnor 	%r7, 0x015f, %r18
	.word 0xb2c0a037  ! 299: ADDCcc_I	addccc 	%r2, 0x0037, %r25
	.word 0xf071a218  ! 301: STX_I	stx	%r24, [%r6 + 0x0218]
	.word 0xbe816b63  ! 304: ADDcc_I	addcc 	%r5, 0x0b63, %r31
	.word 0xb328c00c  ! 306: SLL_R	sll 	%r3, %r12, %r25
	.word 0xa6d0a526  ! 309: UMULcc_I	umulcc 	%r2, 0x0526, %r19
	.word 0xbd782401  ! 311: MOVR_I	move	%r0, 0xffffffe0, %r30
	.word 0xaeb129e4  ! 311: ORNcc_I	orncc 	%r4, 0x09e4, %r23
	.word 0xb631624e  ! 311: ORN_I	orn 	%r5, 0x024e, %r27
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xec70a610  ! 313: STX_I	stx	%r22, [%r2 + 0x0610]
	.word 0xb889ef2b  ! 316: ANDcc_I	andcc 	%r7, 0x0f2b, %r28
	.word 0xaea1e97a  ! 318: SUBcc_I	subcc 	%r7, 0x097a, %r23
thr0_ic_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_25), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xaa50a3ee  ! 321: UMUL_I	umul 	%r2, 0x03ee, %r21
	.word 0xaa81000f  ! 323: ADDcc_R	addcc 	%r4, %r15, %r21
	.word 0xbcb9000a  ! 323: XNORcc_R	xnorcc 	%r4, %r10, %r30
	.word 0xbc81abc0  ! 323: ADDcc_I	addcc 	%r6, 0x0bc0, %r30
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xf428e69e  ! 325: STB_I	stb	%r26, [%r3 + 0x069e]
	.word 0xa28a000f  ! 328: ANDcc_R	andcc 	%r8, %r15, %r17
	.word 0xb8a9c00f  ! 330: ANDNcc_R	andncc 	%r7, %r15, %r28
	.word 0xa320c00c  ! 333: MULScc_R	mulscc 	%r3, %r12, %r17
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xe208e221  ! 337: LDUB_I	ldub	[%r3 + 0x0221], %r17
	.word 0xa4d1000d  ! 340: UMULcc_R	umulcc 	%r4, %r13, %r18
thr0_ic_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_26), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xa0a2000d  ! 343: SUBcc_R	subcc 	%r8, %r13, %r16
	.word 0xbf30a001  ! 345: SRL_I	srl 	%r2, 0x0001, %r31
	.word 0xae80a9bf  ! 345: ADDcc_I	addcc 	%r2, 0x09bf, %r23
	.word 0xb531400d  ! 345: SRL_R	srl 	%r5, %r13, %r26
	.word 0xbab9800b  ! 345: XNORcc_R	xnorcc 	%r6, %r11, %r29
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xf820a3f0  ! 347: STW_I	stw	%r28, [%r2 + 0x03f0]
	.word 0xb430ee76  ! 350: SUBC_I	orn 	%r3, 0x0e76, %r26
	.word 0xb832000d  ! 352: ORN_R	orn 	%r8, %r13, %r28
thr0_ic_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_27), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xb649800d  ! 355: MULX_R	mulx 	%r6, %r13, %r27
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xe420a8e4  ! 358: STW_I	stw	%r18, [%r2 + 0x08e4]
	.word 0xb0b8af8b  ! 361: XNORcc_I	xnorcc 	%r2, 0x0f8b, %r24
	.word 0xa841668a  ! 363: ADDC_I	addc 	%r5, 0x068a, %r20
	.word 0xa120800c  ! 366: MULScc_R	mulscc 	%r2, %r12, %r16
thr0_ic_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_28), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xa8b1800b  ! 369: ORNcc_R	orncc 	%r6, %r11, %r20
	.word 0xa438c009  ! 371: XNOR_R	xnor 	%r3, %r9, %r18
	.word 0xbf38a001  ! 371: SRA_I	sra 	%r2, 0x0001, %r31
	.word 0xbf38d009  ! 371: SRAX_R	srax	%r3, %r9, %r31
	.word 0xb6b14009  ! 371: ORNcc_R	orncc 	%r5, %r9, %r27
	.word 0xa4ba000c  ! 371: XNORcc_R	xnorcc 	%r8, %r12, %r18
	.word 0xb441c00f  ! 372: ADDC_R	addc 	%r7, %r15, %r26
	.word 0xb840e994  ! 372: ADDC_I	addc 	%r3, 0x0994, %r28
	.word 0xbe88c00c  ! 372: ANDcc_R	andcc 	%r3, %r12, %r31
	.word 0xaec1acd1  ! 372: ADDCcc_I	addccc 	%r6, 0x0cd1, %r23
	.word 0xa8812b22  ! 372: ADDcc_I	addcc 	%r4, 0x0b22, %r20
	.word 0xaf64180b  ! 373: MOVcc_R	<illegal instruction>
	.word 0xacba000b  ! 373: XNORcc_R	xnorcc 	%r8, %r11, %r22
	.word 0xa891260c  ! 373: ORcc_I	orcc 	%r4, 0x060c, %r20
	.word 0xa089a227  ! 373: ANDcc_I	andcc 	%r6, 0x0227, %r16
	.word 0xbb30900a  ! 373: SRLX_R	srlx	%r2, %r10, %r29
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xac3a000c  ! 375: XNOR_R	xnor 	%r8, %r12, %r22
	.word 0xb091006b  ! 378: ORcc_R	orcc 	%r4, %r11, %r24
	.word 0xbaa96125  ! 380: ANDNcc_I	andncc 	%r5, 0x0125, %r29
thr0_ic_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_29), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xbe49000b  ! 383: MULX_R	mulx 	%r4, %r11, %r31
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,36)
	.word 0xfe490000  ! 386: LDSB_R	ldsb	[%r4 + %r0], %r31
	.word 0xbf28d00b  ! 389: SLLX_R	sllx	%r3, %r11, %r31
	.word 0xb4d9400c  ! 392: SMULcc_R	smulcc 	%r5, %r12, %r26
thr0_ic_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_30), 16, 16),1,IC_DATA,NIR,x,16)
	.word 0xb3782401  ! 395: MOVR_I	move	%r0, 0x7fffbdc0, %r25
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,51)
	.word 0xf2514000  ! 398: LDSH_R	ldsh	[%r5 + %r0], %r25
	.word 0xaa01c06e  ! 401: ADD_R	add 	%r7, %r14, %r21
	.word 0xa4d0a54f  ! 404: UMULcc_I	umulcc 	%r2, 0x054f, %r18
thr0_ic_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_31), 16, 16),1,IC_DATA,NIR,x,16)
	.word 0xb931d00f  ! 407: SRLX_R	srlx	%r7, %r15, %r28
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16),1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xf849c00f  ! 411: LDSB_R	ldsb	[%r7 + %r15], %r28
thr0_ic_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_32), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xb849e044  ! 414: MULX_I	mulx 	%r7, 0x0044, %r28
	.word 0xe01a24c8  ! 417: LDD_I	ldd	[%r8 + 0x04c8], %r16
	.word 0xb4d2000d  ! 420: UMULcc_R	umulcc 	%r8, %r13, %r26
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xb638800a  ! 423: XNOR_R	xnor 	%r2, %r10, %r27
	.word 0xb699e975  ! 426: XORcc_I	xorcc 	%r7, 0x0975, %r27
	.word 0xb042000e  ! 428: ADDC_R	addc 	%r8, %r14, %r24
	.word 0xa451800c  ! 431: UMUL_R	umul 	%r6, %r12, %r18
thr0_ic_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_33), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xbb316001  ! 434: SRL_I	srl 	%r5, 0x0001, %r29
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,45)
	.word 0xfa594000  ! 437: LDX_R	ldx	[%r5 + %r0], %r29
	.word 0xbc11000e  ! 440: OR_R	or 	%r4, %r14, %r30
	.word 0xbcd225cf  ! 443: UMULcc_I	umulcc 	%r8, 0x05cf, %r30
thr0_ic_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_34), 16, 16),1,IC_DATA,NIR,x,29)
	.word 0xbd31000d  ! 446: SRL_R	srl 	%r4, %r13, %r30
	.word 0xa418c00a  ! 448: XOR_R	xor 	%r3, %r10, %r18
	.word 0xb5643801  ! 448: MOVcc_I	<illegal instruction>
	.word 0xb018e826  ! 448: XOR_I	xor 	%r3, 0x0826, %r24
	.word 0xaf2a3001  ! 448: SLLX_I	sllx	%r8, 0x0001, %r23
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,0)
	.word 0xee020000  ! 450: LDUW_R	lduw	[%r8 + %r0], %r23
	.word 0xa9782461  ! 453: MOVR_I	move	%r0, 0x7fffbdc0, %r20
thr0_ic_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_35), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xb2d1a0c0  ! 456: UMULcc_I	umulcc 	%r6, 0x00c0, %r25
	.word 0xb889800e  ! 458: ANDcc_R	andcc 	%r6, %r14, %r28
	.word 0xaa19e886  ! 458: XOR_I	xor 	%r7, 0x0886, %r21
	.word 0xba09e2bc  ! 458: AND_I	and 	%r7, 0x02bc, %r29
	.word 0xb890eb3b  ! 458: ORcc_I	orcc 	%r3, 0x0b3b, %r28
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,32)
	.word 0xf810c000  ! 460: LDUH_R	lduh	[%r3 + %r0], %r28
	.word 0xa5643861  ! 463: MOVcc_I	<illegal instruction>
thr0_ic_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_36), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xa2d9aab7  ! 466: SMULcc_I	smulcc 	%r6, 0x0ab7, %r17
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xae81c009  ! 469: ADDcc_R	addcc 	%r7, %r9, %r23
	.word 0xb564186a  ! 472: MOVcc_R	<illegal instruction>
	.word 0xb4b1a958  ! 474: ORNcc_I	orncc 	%r6, 0x0958, %r26
thr0_ic_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_37), 16, 16),1,IC_DATA,IR_NIR,25,11)
	.word 0xa2590009  ! 477: SMUL_R	smul 	%r4, %r9, %r17
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xe24126a9  ! 481: LDSW_I	ldsw	[%r4 + 0x06a9], %r17
	.word 0xbf20ac15  ! 484: MULScc_I	mulscc 	%r2, 0x0c15, %r31
	.word 0xb6c12a90  ! 486: ADDCcc_I	addccc 	%r4, 0x0a90, %r27
	.word 0xa699c00e  ! 486: XORcc_R	xorcc 	%r7, %r14, %r19
	.word 0xac0962b0  ! 486: AND_I	and 	%r5, 0x02b0, %r22
	.word 0xaa90c00f  ! 486: ORcc_R	orcc 	%r3, %r15, %r21
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,54)
	.word 0xea18c000  ! 488: LDD_R	ldd	[%r3 + %r0], %r21
	.word 0xbe09800e  ! 491: AND_R	and 	%r6, %r14, %r31
	.word 0xbed9800e  ! 494: SMULcc_R	smulcc 	%r6, %r14, %r31
	.word 0xfe21a891  ! 497: STW_I	stw	%r31, [%r6 + 0x0891]

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
	ta    T_GOOD_TRAP

.data
	.word  0x4bf11c95,0x3c99d3d8,0xb974eff9,0x7b247e89
	.word  0xa315cc95,0x86ab63e0,0xc9b6b8c1,0xdeea700f
	.word  0xb6eccc57,0xc1790667,0x8f06d9e1,0x367cfd7d
	.word  0x1d8d35d2,0xda9dbbef,0x4290ae9f,0xdc83019c
	.word  0xd9061518,0xf1838da9,0xcda93a67,0x54ec8b4e
	.word  0x029004f8,0xb61d677f,0x4263e4d9,0x28e9818d
	.word  0x9bbcd079,0x8d553363,0x61c747c8,0x6f72bf77
	.word  0x48deacb2,0x319ac2c7,0xbe81a20d,0xeacc696c
	.word  0x76b3c4b7,0x974dd2f9,0xe7b7e8f8,0x851e00b9
	.word  0x5a173a17,0xfb07e825,0xd0a8f608,0x8c129122
	.word  0x943113f3,0x49249725,0x8b624a1e,0x5df18f54
	.word  0x1b4fe872,0x84f5ec39,0x24b9313d,0x15aa5537
	.word  0xcbefe5ef,0xd15e4c47,0x39fcebeb,0x565f965b
	.word  0xf7a004dc,0xb0867eae,0xc4427bd7,0x9ffd14fb
	.word  0x96e6a711,0xc67664f5,0x62e8ec70,0x0c7cd1b9
	.word  0x143e80ff,0x64645d1b,0xba2e7580,0xe5ed4298
	.word  0xe8c21d7a,0x12280286,0x8d3567ac,0xa167c249
	.word  0x2a861296,0xb9b62f8b,0x2119c533,0x104dfc90
	.word  0x42f7bd93,0x07393e58,0xefe7c279,0x091a842b
	.word  0x067a5acd,0x78c2bb41,0x3ac67f1d,0x9f5918c9
	.word  0x18596a6d,0x405cadcd,0xe1757389,0x442744c9
	.word  0xf6146b06,0x53a4ce50,0x24168a9d,0xb9f3bef3
	.word  0x4d8df3d8,0x8f75cc20,0x895344c3,0xc033247a
	.word  0xe08cbc0c,0x57792114,0xd4863423,0xa1f80aec
	.word  0x6cc2ccf2,0x58439b1b,0x6944437c,0x196fda3c
	.word  0xed87a241,0xd55d5e65,0x2b24cb48,0x832b57d6
	.word  0xa6b7b28f,0x5e81261a,0x887fd8f0,0x2fa579c3
	.word  0xa1c7e3c3,0xda7ed85c,0xf18488bc,0xf45654b2
	.word  0x5fca3364,0xa915368e,0x50cafbda,0x55fd1235
	.word  0xb3cea04c,0x4a53803b,0xbbc047e0,0x18b1aa36
	.word  0x807a899e,0xbecf5457,0x1695039e,0x3e57cd96
	.word  0x8c1652bc,0x37f3ef30,0x9502d60d,0x0f0bbd3f
	.word  0x9e29d19a,0x9aed9744,0x68194f8b,0x859f76f1
	.word  0xec36e7e2,0x42efb447,0xf346a27c,0x9d816b70
	.word  0xb0f45a7e,0xeef1e8d8,0x42792350,0x21d9c99e
	.word  0x3f1c8df7,0x2562b596,0x39c140be,0xf76df242
	.word  0x0bd853ca,0x49fa26d5,0x647193a2,0x3a3854e2
	.word  0x633ca679,0x48cd261a,0x9c682826,0x4ba652f7
	.word  0x0e926db6,0xacd05a53,0xa92391b1,0xdfbd9bec
	.word  0x8310105a,0xc9555ba0,0xbae8dbd7,0xe46a8f55
	.word  0x6b0a2c55,0x2716aa1a,0x2abd28de,0x88b9dd39
	.word  0x39672b81,0x8500a87c,0x5436025a,0x23654240
	.word  0x22ceb882,0xd110de99,0xb6cba76c,0xbe9e3853
	.word  0x820a0e19,0xa08079c7,0x7850f183,0xa0da688b
	.word  0x5934adde,0xb66ff4bf,0x3b1c7fc9,0x39b11ea6
	.word  0x77ac24cc,0x24552091,0x3fadf7c8,0xd30664a3
	.word  0xa7bbffe6,0xd34edcdd,0xe357c11d,0x204ea64e
	.word  0x7fcaa107,0x8e9ba716,0x1b9865ba,0x93254d77
	.word  0x2d1e34ee,0x3730b363,0x0581a479,0x2d4b6d55
	.word  0x6452fc3f,0x1429ccf1,0x7b012778,0xbe5eeb58
	.word  0x934ac772,0x988780a5,0xcd29c0d5,0x313ae9e1
	.word  0x33062e55,0x5a7609bd,0xb316ab8e,0xa2a24033
	.word  0x6874bf10,0x60c26691,0xe534df8b,0x3a320de0
	.word  0xec7014b2,0x06702d29,0x33cd0249,0x217260a9
	.word  0xf7b3df69,0x18982f1e,0xa0598f1e,0x7403ecd9
	.word  0x09f9db42,0x79ca285e,0xd8a497c8,0x596c3bec
	.word  0x132f0ab2,0xc806462e,0xfc277b43,0xa619b99f
	.word  0xacfc520f,0x703f7424,0xdeedf061,0x41e2ac5d
	.word  0x324774b3,0xd3f42343,0xdb354518,0x8a6ef658
	.word  0x2e6f465f,0xd5fcd376,0xb6955200,0xcfb46ce7
	.word  0x99007229,0x1bda3416,0x25c90e54,0xd3a4cb21
	.word  0xe79da5c4,0x6d61d0a1,0xeb87bba2,0x77eef40c
	.word  0xb9c2bf07,0xd60eafbb,0x5460e15a,0xc88ed5bf
	.word  0x800b1cda,0x11db8c06,0xb50c7b75,0xc114dd47
	.word  0x8738cbf6,0x99e0328c,0x05b87a88,0x2cd38840
	.word  0x2c4b1ac1,0x803adcda,0xe6ae5980,0xeea73ca8
	.word  0x1da0b350,0x5448ce79,0x79830791,0x83592d56
	.word  0xdfa07fb0,0x9538d878,0x7de1a471,0x181ab604
	.word  0xec2e2a48,0x4e8aa30b,0x826ce57b,0x64e35f84
	.word  0x6ca4eb9f,0xf7fbb988,0x3c91f367,0x7f19e708
	.word  0x83ba2f64,0x2f77ecb5,0x8140be94,0xca48c655
	.word  0x0194c2d4,0xaeaccb77,0x30975fbf,0x976f5216
	.word  0xf3be510a,0xf0e20d51,0x1a25902e,0xd695a92e
	.word  0xc90f33a7,0x2e63a954,0xb61d4b21,0x0c20b6bf
	.word  0x63b672fd,0x1dd0dfbe,0x444202ad,0x6198472d
	.word  0xdd67f3e0,0x1a127213,0xaa848015,0xcd7363c5
	.word  0x47dc3f86,0x70419833,0x88d705d7,0x9ff0ff1d
	.word  0xd4c4b4d6,0x2950fc4b,0x3ce46e5b,0x3a2d3bb6
	.word  0x44f75e3e,0xfa9eedba,0xc3ad9fb6,0xb54fe986
	.word  0x67e791bb,0x27f7af8a,0xf6092e3d,0x03153ee3
	.word  0xb4ca4c7e,0x414bc805,0x30398232,0x617679a0
	.word  0xe4fed581,0x22e1d46f,0xcc2ffe99,0x30d6915e
	.word  0x65a56cd1,0xd1b411c4,0x162ada30,0x74d365d0
	.word  0x5fbd824e,0x141e1eab,0x852db122,0x42cfb7fa
	.word  0x69c1319c,0x2c95e0f1,0x7bd7ec35,0xe1dc23f8
	.word  0xa773efb0,0xf1258660,0x85bae5e8,0xec19ac2c
	.word  0xd319fdf1,0x802c9af4,0xf8a350c4,0xac74d4c8
	.word  0x40e4c419,0x591ea687,0x3784ecc1,0x7b9938dd
	.word  0x23625300,0x87a1c43e,0x892eaefe,0x0d39e0d1
	.word  0x3da089bc,0xd9ba5c33,0x03d9cd5b,0x35f1b0a4
	.word  0x534d5125,0xadafdf3f,0x2e528b81,0x50dea879
	.word  0x401bf8c4,0x9675483d,0x359ed6ef,0x2e014d14
	.word  0x8f0b4b60,0xa9dc0d96,0xfe7e4fd9,0xad466b73
	.word  0x02d41f74,0x1a539ec9,0x768fdc08,0xbb3e6f52
	.word  0xcc8eee84,0x8e6cc968,0xdd5ba260,0xe594c4cf
	.word  0x4aceab39,0x48fee355,0xed27e808,0x0c54e7cb
	.word  0x9a139e76,0x2e5b0870,0x967ae9a6,0x6818794c
	.word  0xf0b021ca,0xce68744b,0xf02cfe7a,0x8eaaf5cb
	.word  0xa20c241d,0x356eb79a,0xe76d2f62,0x8b49c232
	.word  0xf6844b4c,0xc1cedaaf,0x0c540ad4,0x30b0f1f7
	.word  0x33dbdfb1,0x282cca10,0xe4d61093,0x363d6d7f
	.word  0x0aabd660,0x2bd8810a,0x09f31368,0x2b27d749
	.word  0xa667892e,0xdb383e48,0x5d646b00,0x8c510725
	.word  0x097af422,0x091bf1fb,0xa257e284,0x48200767
	.word  0xf0a85510,0x6767a06c,0xd5f6cf85,0xdb099046
	.word  0x66cd6714,0xbdda89b4,0xe13b201a,0x3d8fc29e
	.word  0x362b257a,0x340c22ef,0x0753ef4d,0x76b98ef7
	.word  0x72cb01a7,0x7f2e9974,0x447baee3,0x46323d79
	.word  0x081cd642,0x82836800,0x5895469f,0x84cb0dd7
	.word  0xd92c32bf,0xb8e1a78a,0x0542b26b,0x2fee9599
	.word  0xba143875,0x62a1b233,0xbcd5d899,0xb45c61df
	.word  0xe8740279,0x6a3cbf9b,0x2d62a646,0xc884950d
	.word  0x408afe48,0x3486c89a,0x3021b0eb,0x3dc657c3
	.word  0xa766295f,0x1c2aecf1,0x61d8b3fe,0xe3479241
	.word  0x0c6c0fd8,0x21874e5d,0x0cea746a,0x2d4e0d1f
	.word  0xacc7ec5a,0xe21e0869,0xeec112a6,0xdea8117b
	.word  0x8fc74d13,0xca21dae9,0x4bf20786,0xd897449a
	.word  0x7d085766,0x05096127,0xc07bfa2b,0x204462f9
	.word  0x302bd71c,0x66981b6b,0xf918e072,0xeb02c496
	.word  0x222fa9f8,0x4fec42b1,0x042596fc,0xa1451998
	.word  0xc2587bfb,0x198dfa24,0xd8c3abbb,0xda620b9b
	.word  0xc9a5ecc3,0x7c20c6bb,0x37b9aab2,0x7673057e
	.word  0x8ca3e01c,0x03c6f289,0x6565e248,0x21e4265f
	.word  0xda11ef0c,0x114b0c3b,0xb9fd081a,0x02a5039a
	.word  0xeffa0dae,0x0dc09f09,0xbd1658eb,0xa3692dd5
	.word  0xc2ffb1b7,0xf8eb4eed,0xc1f0b9a5,0x399f2ae0
	.word  0x7aebf0f2,0xe7ac835d,0x8f92bfe4,0x269e521d
	.word  0x44d46285,0x773118ef,0x7c932e60,0xc47cca0b
	.word  0x2ba398e7,0xfcce8626,0x8bd9d376,0x314ecb3f
	.word  0x97ff17e5,0x24ee3105,0xfe8d92e9,0x78d91a96
	.word  0x9877bd18,0x56aab4a0,0x77ef27fe,0xc4c04f2c
	.word  0x83287def,0x04171ae6,0xac8cb52a,0x81f86af2
	.word  0x5a47582f,0xc63bc8c0,0xe34f59ce,0x373360d1
	.word  0xf22d7df3,0xd73172b0,0x5f74722d,0x76ab62e2
	.word  0x369dcd5c,0xb5ffed23,0xa3826197,0xced3d543
	.word  0x74dbe58b,0x522b38de,0x4ddb5797,0x4ed0b24c
	.word  0x4c3bc3b6,0x4be1ef02,0xa7484a26,0xba1359e2
	.word  0x7ec593ea,0x94017eea,0x7b63ddd1,0xe9e82d43
	.word  0x7cd8d550,0x51d3d679,0x85ac0589,0xbddf74f9
	.word  0x38262db7,0x1809d1f2,0x092e592f,0x480f8e51
	.word  0xca2b427f,0xe79381f1,0x76d1a48d,0x5efd6576
	.word  0x56fabc22,0x93d94b98,0x8317ac7e,0xe0e6287e
	.word  0x12c72658,0x178f60e3,0xd51d31eb,0x4911b9c8
	.word  0x00acacda,0xf47e4291,0x0f1d56ff,0xc312aacc
	.word  0x12f210d3,0x5724e08b,0x04deb15a,0x0d877583
	.word  0x6831ab86,0x25652001,0xb24ddeae,0x6e450645
	.word  0x84611e96,0x14cc769e,0xb1278877,0x6bca9d56
	.word  0x650536b3,0xcd29ec92,0xee09670f,0xe1c80b7a
	.word  0xab61f6c7,0x6ad2e743,0x3fc97fd8,0x19349762
	.word  0xf0bc6615,0x8cd0e967,0x365e13a1,0xafc87d2d
	.word  0xf0725932,0xb71f0177,0x8d568622,0xbb528874
	.word  0xfda5b816,0x4f2670b1,0x1a0a832c,0xf9f1faf3
	.word  0x1a4b9276,0x3dddec4e,0xecabf5e3,0x39925963
	.word  0xd3d856a0,0xf822b85b,0xb30d78a6,0x34ebdaa8
	.word  0xd948af33,0x42025e68,0xc15c1172,0x726ef1e4
	.word  0x479835b6,0x29cec49d,0x1cb6bbc8,0x369fe6b5
	.word  0x66504d88,0xa1a26423,0xcf144b24,0xb8cb0c34
	.word  0x1f66fe3e,0xc8b86e1b,0xd068974d,0xf88e26f8
	.word  0x4e53ea4f,0x979311c4,0x5583330d,0x063b46fc
	.word  0xd6a4cfb2,0x021474ce,0x1e28cfe1,0xaf4c311b
	.word  0x458cee82,0x6bfe96b8,0x86387318,0x5ab5eed1
	.word  0xe62a827e,0x7cbf2a9a,0x4527185a,0x2bfaffa3
	.word  0x1f4fcd7a,0xec6c4314,0x4ea6acac,0xc7d1f115
	.word  0xafc8a446,0xd7c0f296,0xb93386f2,0xa8298f60
	.word  0x338db676,0x26b05a90,0x2f562cd6,0xa36d32c9
	.word  0xd5e18b2e,0x7cbfb7fa,0x60435a5e,0xf18f8a02
	.word  0x0a7c7d41,0x86bbdb4c,0x281a5861,0x4f9a9384
	.word  0x21d2935d,0x979ad417,0x2324c0a6,0xf860a2d1
	.word  0x72b20294,0x962ff90c,0xd775217b,0xfdf500ad
	.word  0xca6b9beb,0x29580e54,0xaba2702d,0x2183c3aa
	.word  0xc257f367,0xb1c198b7,0x9e502811,0xa42d3dc9
	.word  0xf093634e,0x3c114782,0x1f49c87a,0xb63fc002
	.word  0xe95b3864,0xba1317d3,0x63423f66,0x73f22f87
	.word  0x045be7f7,0x4056e629,0xa1414573,0x72f28fe6
	.word  0x6582f23b,0xfe5d5d0a,0xbce92246,0x82b089f1
	.word  0xe7e6dfd0,0xb364571f,0xa1342e34,0x8ac830dd
	.word  0x253aa7d4,0x0921095f,0x7b21bc3e,0x2c1ed226
	.word  0x9a5c56af,0x4ebe4f18,0x8f269f40,0x06a80e91
	.word  0x1202c1a6,0x919224a4,0x9d45baf6,0xca6bef73
	.word  0xf05211a5,0xb86daab1,0x7e61a6cb,0x4db1043b
	.word  0xdcb64000,0x97fce8ed,0x3c1de931,0x30e0e8b1
	.word  0x989b19e7,0xc93e360a,0x23f543fe,0x79bf353d
	.word  0x0a12ec6d,0x521236b7,0xed6e641e,0x61d9fc10
	.word  0x23b4ab2c,0x0ca55d19,0x77329541,0x3794b5e3
	.word  0x74fe6790,0xfac55153,0xa2cb6926,0xaa1224f0
	.word  0xdbbf6c94,0x1ec65ad4,0x27e1f0bc,0x61944c32
	.word  0xfc42cb3a,0x00ae0f25,0x38af69b5,0x17ffd0c9
	.word  0xbbf4083a,0xde279a93,0x6612a185,0x9d24ab76
	.word  0xa49fccdb,0xc8e2f8dd,0x6d966ebd,0x166257aa
	.word  0x5735ef10,0x497764fd,0x051174ce,0x4d59712f
	.word  0x6357dde9,0xe716c7ff,0x26b32e51,0x3d01d2cc
	.word  0x98354215,0x9ccaf148,0xcfac0c42,0xa29eaa46
	.word  0x05a60041,0x4ebcf51c,0xe134e080,0x78331008
	.word  0xe70268aa,0x90705fea,0x852d0e56,0x212617c3
	.word  0x3574de20,0xf2a32fe0,0xe673bab5,0x3c6cea7b
	.word  0x92cb9560,0xb13b8c00,0x63280c96,0x9e3a7d5f
	.word  0xf84bd40f,0x232d8d47,0xa5dadca9,0x03ccfae6
	.word  0xb24afd7f,0x56122a96,0x5ca1811f,0x29736517
	.word  0x8837ec88,0x60c4a1f1,0xf8fed106,0x514eecc9
	.word  0x67b6417f,0x6b0e7b4f,0xf95a98c8,0xa6fc102d
	.word  0xe4ec3396,0xbece2db3,0x738a5034,0x80b009be
	.word  0x338e92e1,0xc0ac66ad,0xa3c64a9e,0x8e501297
	.word  0x78ab0195,0x2b6a59e5,0x5eca700c,0xcb6978c5
	.word  0x88418d29,0x2c33f6fe,0x3e11e931,0x7d72c349
	.word  0x109cd10e,0xddf59b96,0x0fa18654,0x55e3143e
	.word  0x4cc0144c,0x213a12cb,0x9438d0a9,0xc0c1a1c8
	.word  0x18558f3a,0xfcc64422,0x87ba8cb9,0xaf5e7931
	.word  0xa0e76de6,0x7f479006,0x02dc6d0f,0xc985d6b1
	.word  0xb55292aa,0xfe813a60,0x85fbefbb,0x17e643e4
	.word  0x3880fa0d,0x51cfbf92,0x48bb7eee,0xc6945db7
	.word  0xf0737962,0x7072f8b4,0x07b3bd25,0x2b5abc3f
	.word  0x6b620fc9,0x90411768,0xaa3b6cd9,0x9b6920e0
	.word  0x3e197739,0x743f33ff,0x83500701,0x56af7c01
	.word  0x097da47f,0xde6aed91,0x4960b65a,0xf565a798
	.word  0x69b1b04a,0x901ea6e7,0x1c6dc598,0xb33eecec
	.word  0x654569d3,0x0037afcb,0x10b53016,0xe9484235
	.word  0x85fdbec3,0xfd4d57dd,0x88e8a7e2,0xf6f30ae1
	.word  0xe772d589,0x26ea165d,0x32ed9303,0x00b5fc8b
	.word  0xec97c161,0x57048da8,0xe10e34d6,0x5a795062
	.word  0x004b328f,0x28e9d230,0x56f64fd8,0x9ea0d3c3
	.word  0x4a94a316,0xad3ac853,0xfd0d16d8,0x6d4625d6
	.word  0xe60b4de4,0xef932954,0xfd693832,0x86efd239
	.word  0x86517c69,0xcecf0f15,0x4808b28c,0x2a42f5d4
	.word  0x01ceefe8,0x3cc4ab4a,0x8b853bd8,0xc24b17d7
	.word  0x270f118c,0xb4c948c7,0x5ea5c4a9,0x105de459
	.word  0x4822d357,0xe60255b7,0x6adef17c,0xc871ad40
	.word  0x93ee89ef,0xfea22e42,0x7563fe67,0x252c0d3e
	.word  0x1f778673,0x40775ac3,0xcfae96a9,0x9963c2d9
	.word  0x3b86b3d5,0xc7bc0672,0x4d31d32b,0x1e2ec9bc
	.word  0x8bded29a,0x66124dae,0x5126770b,0xaa6a0eb5
	.word  0x5e0783fa,0x2685bf08,0x59dd5ba0,0x63be967d
	.word  0x1e9ce263,0x5f032036,0x729af0a3,0xb192ba30
	.word  0xe4afb9c0,0xf53d6f08,0xe940b1be,0x425571b4
	.word  0x4a6026c3,0x6905355b,0xd985081d,0xd0aeea93
	.word  0xdc9608ae,0xff4659da,0x6d868b5f,0xd007bcd3
	.word  0x94634c4e,0xf15e4567,0xf7c3d52a,0x5054ac77
	.word  0x46e6d526,0x7fd85e64,0x0f0ca5fe,0x868fa022
	.word  0x9336f097,0xe00859b2,0x617b68ae,0x8b10442d
	.word  0x1428d3e8,0x685541b0,0x3a8ac289,0xaa725e7a
	.word  0xf81e498e,0x529af626,0x32474dd7,0xcc561c91
	.word  0x12764c58,0x706b11f7,0x0ce2ad0e,0x5dc923ac
	.word  0x340aa26d,0xf70cfaad,0x048b3ddd,0x1aacc3d3
	.word  0xbd0a85bc,0xdd54a264,0x92b88fe0,0x349e6408
	.word  0xbe6d44f1,0x92fe53c7,0x2ee1e401,0xe635804e
	.word  0x904bd6a8,0x4c962990,0xea119aa1,0x66f67de2
	.word  0x8a2d8984,0x2272c828,0x66602612,0xb26c2dbc
	.word  0xbc700923,0x3e610ad9,0x13e0186d,0xb4287cd4
	.word  0x34457cfb,0x4bd7ca3b,0x12d7fa44,0x0ace60fa
	.word  0x91a76590,0x5607a7b7,0x8652e5d6,0x4ec8493d
	.word  0xf9b198de,0x39f518a9,0xdcbfef85,0x0129f7fd
	.word  0x176759b7,0x2aef1193,0x4f41d246,0x0163b551
	.word  0x6d05859d,0xa52915b2,0x47db63a3,0xfb2abbc1
	.word  0x04282042,0xa3906d82,0x49f41255,0x9107f8e8
	.word  0xd869ca0e,0x99e2d0fd,0xc675c28e,0xb89cb003
	.word  0xca47e3d5,0xe9a4493c,0x04a04969,0x1bdc6ed0
	.word  0xec83ef2c,0x0672873f,0xb609c5a6,0xe58cc0ac



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i = 0;
!!#   int bitnum = 0, bitnum2 = 0;
!!#   int label_cnt = 0;
!!#   int irf_err_cnt = 0;
!!#   int ic_err_cnt = 0;
!!#   int dc_err_cnt = 0;
!!#   int intr_cnt = 0;
!!#   int burst_cnt = 0;
!!#   int br_mul_cnt = 0;
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
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 38, ijdefault, Ft_Rs1, "{2..8}");
!!#   IJ_set_ropr_fld ("diag.j", 39, ijdefault, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 40, ijdefault, Ft_Rd, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 41, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 42, ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 53, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 54, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 56, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 57, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 59, Ro_load_r, Ft_Rs2, "{0}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 61, Ro_rsvd_set, Ft_Rs1, "{2..8}");
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_rsvd_set, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 63, Ro_rsvd_set, Ft_Rd, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 64, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");  
!!#   IJ_set_ropr_bits ("diag.j", 65, Ro_rsvd_set, 0xf70, "12'b000011100000");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 67, Ro_ba, Ft_D16, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 68, Ro_ba, Ft_Disp22, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 69, Ro_ba, Ft_Disp19, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_ba, Ft_Disp30, "{0x3}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 74, th_mul, 0x4);
!!#   IJ_bind_thread_group("diag.j", 75, th_evnt, 0x3);
!!#   IJ_bind_thread_group("diag.j", 76, th_intr, 0x8);
!!#   IJ_bind_thread_group("diag.j", 77, th_all, 0xf);
!!# 
!!#   IJ_th_fork_group ("diag.j", 84, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 88, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 16; i < 32; i++) {
!!#      IJ_printf ("diag.j", 90, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 94, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 96, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 2; i < 9; i++) {
!!#      IJ_printf ("diag.j", 101, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join ("diag.j", 112,0xf);
!!#   IJ_th_start ("diag.j", 113,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 115, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 116, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 117, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 118, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 119, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 120, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 121, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 122, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 123, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 124, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 126, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 127, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 129, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 130, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# diag: resum_intr_block muls inst_block
!!# ;
!!# 
!!# muls: mMETA60
!!# 
!!#            {
!!#  	       IJ_generate_from_token ("diag.j", 179,400, th_mul, ijdefault, tMULX_R, tMULX_I,
!!#                                        tUMUL_R, tUMUL_I, tSMUL_R, tSMUL_I, tUMULcc_R, 
!!#      				       tUMULcc_I, tSMULcc_R, tSMULcc_I, tMULScc_R, tMULScc_I, -1);;
!!#            }
!!# 
!!# ;
!!# 
!!# resum_intr_block: mMETA70
!!# {
!!#   i = 0;
!!#   while (i < 250) {
!!#       IJ_printf ("diag.j", 191, th_intr, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#       IJ_printf ("diag.j", 192, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(0, 3, 1)\n", intr_cnt);
!!#       IJ_printf ("diag.j", 193, th_intr, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d)+8, 16, 16)) -> intp(1, 3, 1)\n", intr_cnt);
!!#       intr_cnt++;
!!#       IJ_generate_from_token ("diag.j", 195,4, th_intr, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;
!!#      i++;
!!#   }
!!# }
!!# ;
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: alu_irf_err 
!!#            | ldst_irf_err 
!!#            | ld_dc_err 
!!#            | alu_burst
!!# 	   | br_mul
!!# 
!!# ;
!!# 
!!# br_mul: d18 dlyslt_inst alu icerr mul icerr alu
!!# 
!!# ;
!!# 
!!# dlyslt_inst: d1000 ld_irferr_unalgn
!!# 	   | d2000 trpm_alu
!!#            | d3000 st_irferr_unalgn
!!# 	   | d4000 ld_dc_err
!!# ;
!!# 
!!# d18: mMETA1
!!# {
!!#    IJ_printf ("diag.j", 235, th_evnt, ".align 0x8\n");
!!#    IJ_generate_from_token ("diag.j", 236,1, th_evnt,Ro_ba,tBA, -1);;
!!# }
!!# ;
!!# 
!!# alu_irf_err: irferr alu trpm_alu alu mul_ic_err 
!!# ;
!!# 
!!# mul_ic_err: icerr mul
!!#            | d1 mul
!!#            | d2 mul icerr alu
!!# //	   | d17 mul lop
!!# ;
!!# 
!!# ldst_irf_err:   st_irferr_unalgn trpm_alu alu mul_ic_err 
!!#                 | ld_irferr_unalgn mul_ic_err
!!# ;
!!# 
!!# st_irferr_unalgn: irferr store_i 
!!#                   | d3 store_i %ropr  Ro_unaligned_addr
!!#                   | d4 store_i
!!# 		  | d6 irferr store_i  %ropr  Ro_unaligned_addr
!!# ;
!!# 
!!# ld_irferr_unalgn: irferr_on_load load 
!!#                   | d7 load %ropr  Ro_unaligned_addr
!!#                   | d8 load
!!# 		  | d9 irferr_on_load load  %ropr  Ro_unaligned_addr
!!# ;
!!# 
!!# ld_dc_err: dcerr load_r trpm_alu mul_ic_err
!!# ;
!!# 
!!# resum_intr: mMETA16
!!# {
!!#   IJ_printf ("diag.j", 270, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf ("diag.j", 271, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%y, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!#   burst_cnt = random () % 7 + 7; 
!!#   IJ_generate_from_token ("diag.j", 274,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!# alu_burst: mMETA17
!!# { 
!!#    burst_cnt = random () % 3 + 3; 
!!#    IJ_generate_from_token ("diag.j", 281,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_printf ("diag.j", 287, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 3;
!!#    if (i == 0) {
!!# //      IJ_printf (th_evnt, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 292, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!# //      IJ_printf (th_evnt, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 296, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!# //      IJ_printf (th_evnt, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 301, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA19
!!# {
!!#    IJ_printf ("diag.j", 309, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 311, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf ("diag.j", 318, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 320, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr_on_load: mMETA35
!!# {
!!#      IJ_printf ("diag.j", 327, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      if ((random () % 3) == 0) {
!!#        bitnum = random () % 72;
!!#      } else {
!!#        bitnum = random () % 10;
!!#      }
!!#      IJ_printf ("diag.j", 333, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# 
!!# }
!!# ;
!!# 
!!# trpm_alu: d10 alu 
!!#           | d5 alu %ropr  Ro_rsvd_set
!!# ;
!!# 
!!# mul: d11 mul_tokens
!!# {
!!#    IJ_generate ("diag.j", 345, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# mul_tokens: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I | tUMULcc_R 
!!#      | tUMULcc_I | tSMULcc_R | tSMULcc_I | tMULScc_R | tMULScc_I
!!# ;
!!# 
!!# load: d12 load_r_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 356, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!#       | d12 load_i_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 361, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!# ;
!!# 
!!# load_r: d13 load_r_tokens %ropr  Ro_load_r
!!# {
!!#    IJ_generate ("diag.j", 368, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# load_i_tokens:  tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I 
!!#                 | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I 
!!# ;
!!# 
!!# load_r_tokens: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R 
!!#                | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R 
!!# ;
!!# 
!!# store_i: d14 store_i_tokens
!!# {
!!#    IJ_generate ("diag.j", 383, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# store_i_tokens: tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# ;
!!# 
!!# alu: d15 alu_tokens
!!# {
!!#    IJ_generate ("diag.j", 393, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# alu_tokens: tADD_R | tADD_I | tADDcc_R 
!!# 			 |  tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I | tAND_R 
!!# 			 |  tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R 
!!#                          |  tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I 
!!#  			 |  tORNcc_R | tORNcc_I | tXOR_R | tXOR_I | tXORcc_R | tXORcc_I 
!!# 			 |  tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I | tMOVcc_R | tMOVcc_I 
!!#                        |  tMOVR_R | tMOVR_I | tSLL_R | tSLL_I | tSRL_R | tSRL_I | tSRA_R 
!!#                        |  tSRA_I | tSLLX_R | tSLLX_I | tSRLX_R | tSRLX_I | tSRAX_R 
!!#                        |  tSRAX_I | tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I 
!!# ;
!!# 
!!# br: tBA
!!# ;
!!# 
!!# d1: mMETA1
!!# ;
!!# 
!!# d2: mMETA2
!!# ;
!!# 
!!# d3: mMETA3
!!# ;
!!# 
!!# d4: mMETA4
!!# ;
!!# 
!!# d5: mMETA5
!!# ;
!!# 
!!# d6: mMETA6
!!# ;
!!# 
!!# d7: mMETA7
!!# ;
!!# 
!!# d8: mMETA8
!!# ;
!!# 
!!# d9: mMETA9
!!# ;
!!# 
!!# d10: mMETA10
!!# ;
!!# 
!!# d11: mMETA11
!!# ;
!!# 
!!# d12: mMETA12
!!# ;
!!# 
!!# d13: mMETA13
!!# ;
!!# 
!!# d14: mMETA14
!!# ;
!!# 
!!# d15: mMETA15
!!# ;
!!# 
!!# d1000: mMETA1000
!!# ;
!!# 
!!# d2000: mMETA2000
!!# ;
!!# 
!!# d3000: mMETA3000
!!# ;
!!# 
!!# d4000: mMETA4000
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

