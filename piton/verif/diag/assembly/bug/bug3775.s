// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3775.s
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
   random seed:	757812500
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
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0xedcc084b00bd02f1, %r16, %r16
	setx  0xe88b8fa26ac95757, %r16, %r17
	setx  0x241c90a87440f612, %r16, %r18
	setx  0xeb95d3a46e640e29, %r16, %r19
	setx  0x42663920c447724f, %r16, %r20
	setx  0xb78e76871182d81b, %r16, %r21
	setx  0xdffcd612cb0e518a, %r16, %r22
	setx  0xd21ab8b1d98f8afe, %r16, %r23
	setx  0x84c6f12bb6c3a84a, %r16, %r24
	setx  0x62059ce165cc5d25, %r16, %r25
	setx  0x195e3d92ac713eea, %r16, %r26
	setx  0x5b8f9b96c708401d, %r16, %r27
	setx  0x983553ff2b908d5b, %r16, %r28
	setx  0xd8017cc830b58f82, %r16, %r29
	setx  0x0469dab8b76f19b9, %r16, %r30
	setx  0x3bbf17a63442c4eb, %r16, %r31
	setx  0x0000000000000d50, %r16, %r9
	setx  0x0000000000000740, %r16, %r10
	setx  0x0000000000000a50, %r16, %r11
	setx  0x00000000000008b0, %r16, %r12
	setx  0x0000000000000d30, %r16, %r13
	setx  0x00000000000002d0, %r16, %r14
	setx  0x0000000000000b20, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xb178040d  ! 2: MOVR_R	move	%r0, %r13, %r24
	.word 0xb6088009  ! 2: AND_R	and 	%r2, %r9, %r27
	.word 0xbcc0c00a  ! 2: ADDCcc_R	addccc 	%r3, %r10, %r30
	.word 0xaca8800d  ! 2: ANDNcc_R	andncc 	%r2, %r13, %r22
	.word 0xaea9c00d  ! 2: ANDNcc_R	andncc 	%r7, %r13, %r23
	.word 0xa5643801  ! 2: MOVcc_I	<illegal instruction>
	.word 0xb128800c  ! 2: SLL_R	sll 	%r2, %r12, %r24
	.word 0xbc41a285  ! 2: ADDC_I	addc 	%r6, 0x0285, %r30
	.word 0xa2892c3a  ! 2: ANDcc_I	andcc 	%r4, 0x0c3a, %r17
	.word 0xad32100c  ! 2: SRLX_R	srlx	%r8, %r12, %r22
	.word 0xa619800d  ! 2: XOR_R	xor 	%r6, %r13, %r19
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xb089800a  ! 3: ANDcc_R	andcc 	%r6, %r10, %r24
	.word 0xa931400d  ! 3: SRL_R	srl 	%r5, %r13, %r20
	.word 0xae892a37  ! 3: ANDcc_I	andcc 	%r4, 0x0a37, %r23
	.word 0xa3294009  ! 3: SLL_R	sll 	%r5, %r9, %r17
	.word 0xa7322001  ! 3: SRL_I	srl 	%r8, 0x0001, %r19
	.word 0xab322001  ! 3: SRL_I	srl 	%r8, 0x0001, %r21
	.word 0xa688800a  ! 3: ANDcc_R	andcc 	%r2, %r10, %r19
	.word 0xbcb16f89  ! 3: ORNcc_I	orncc 	%r5, 0x0f89, %r30
	.word 0xa339800a  ! 3: SRA_R	sra 	%r6, %r10, %r17
	.word 0xba89400a  ! 3: ANDcc_R	andcc 	%r5, %r10, %r29
	.word 0xac29c00e  ! 3: ANDN_R	andn 	%r7, %r14, %r22
	.word 0xb6a9c00b  ! 3: ANDNcc_R	andncc 	%r7, %r11, %r27
	.word 0xbf30e001  ! 3: SRL_I	srl 	%r3, 0x0001, %r31
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,46)
	.word 0xfe10c000  ! 5: LDUH_R	lduh	[%r3 + %r0], %r31
	.word 0xb0820069  ! 8: ADDcc_R	addcc 	%r8, %r9, %r24
	.word 0xb251c00f  ! 11: UMUL_R	umul 	%r7, %r15, %r25
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,2,3)
	.word 0xaa89e33a  ! 14: ANDcc_I	andcc 	%r7, 0x033a, %r21
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xba90800e  ! 16: ORcc_R	orcc 	%r2, %r14, %r29
	.word 0xa738a001  ! 16: SRA_I	sra 	%r2, 0x0001, %r19
	.word 0xae8a2b12  ! 16: ANDcc_I	andcc 	%r8, 0x0b12, %r23
	.word 0xb8b1800a  ! 16: ORNcc_R	orncc 	%r6, %r10, %r28
	.word 0xbc0a000f  ! 16: AND_R	and 	%r8, %r15, %r30
	.word 0xba192680  ! 16: XOR_I	xor 	%r4, 0x0680, %r29
	.word 0xb5643801  ! 16: MOVcc_I	<illegal instruction>
	.word 0xb490800e  ! 16: ORcc_R	orcc 	%r2, %r14, %r26
	.word 0xa329c00d  ! 16: SLL_R	sll 	%r7, %r13, %r17
	.word 0xb929b001  ! 16: SLLX_I	sllx	%r6, 0x0001, %r28
.align 0x8
	.word 0x30800003  ! 17: BA	ba,a	<label_0x3>
	.word 0xb4b0ae67  ! 20: ORNcc_I	orncc 	%r2, 0x0e67, %r26
	.word 0xaa21000a  ! 22: SUB_R	sub 	%r4, %r10, %r21
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xbcd1eb0f  ! 25: UMULcc_I	umulcc 	%r7, 0x0b0f, %r30
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR_NIR,9,30)
	.word 0xba99e38a  ! 28: XORcc_I	xorcc 	%r7, 0x038a, %r29
	.word 0xfa59c00a  ! 31: LDX_R	ldx	[%r7 + %r10], %r29
	.word 0xb0da000b  ! 34: SMULcc_R	smulcc 	%r8, %r11, %r24
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xf0722137  ! 38: STX_I	stx	%r24, [%r8 + 0x0137]
	.word 0xb499a3ac  ! 41: XORcc_I	xorcc 	%r6, 0x03ac, %r26
	.word 0xbcb0aeb0  ! 43: ORNcc_I	orncc 	%r2, 0x0eb0, %r30
	.word 0xa2d1c00e  ! 46: UMULcc_R	umulcc 	%r7, %r14, %r17
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xe259e41f  ! 50: LDX_I	ldx	[%r7 + 0x041f], %r17
	.word 0xae59e583  ! 53: SMUL_I	smul 	%r7, 0x0583, %r23
	.word 0xac116061  ! 55: OR_I	or 	%r5, 0x0061, %r22
	.word 0xb008a97e  ! 55: AND_I	and 	%r2, 0x097e, %r24
	.word 0xba092358  ! 55: AND_I	and 	%r4, 0x0358, %r29
	.word 0xae9161c1  ! 55: ORcc_I	orcc 	%r5, 0x01c1, %r23
	.word 0xb8c16a8a  ! 55: ADDCcc_I	addccc 	%r5, 0x0a8a, %r28
	.word 0xb4016118  ! 56: ADD_I	add 	%r5, 0x0118, %r26
	.word 0xb3780409  ! 56: MOVR_R	move	%r0, %r9, %r25
	.word 0xb731a001  ! 56: SRL_I	srl 	%r6, 0x0001, %r27
	.word 0xae1925cf  ! 56: XOR_I	xor 	%r4, 0x05cf, %r23
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xb839400c  ! 57: XNOR_R	xnor 	%r5, %r12, %r28
	.word 0xb018a29b  ! 57: XOR_I	xor 	%r2, 0x029b, %r24
	.word 0xa211a578  ! 57: OR_I	or 	%r6, 0x0578, %r17
	.word 0xb2b08009  ! 57: ORNcc_R	orncc 	%r2, %r9, %r25
	.word 0xa932100e  ! 57: SRLX_R	srlx	%r8, %r14, %r20
	.word 0xb43a2482  ! 57: XNOR_I	xnor 	%r8, 0x0482, %r26
	.word 0xa011800a  ! 57: OR_R	or 	%r6, %r10, %r16
	.word 0xb801800f  ! 57: ADD_R	add 	%r6, %r15, %r28
	.word 0xaa09400f  ! 57: AND_R	and 	%r5, %r15, %r21
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf643801  ! 58: MOVcc_I	<illegal instruction>
	.word 0xb2922104  ! 58: ORcc_I	orcc 	%r8, 0x0104, %r25
	.word 0xb4b9ad92  ! 58: XNORcc_I	xnorcc 	%r6, 0x0d92, %r26
	.word 0xaec226db  ! 58: ADDCcc_I	addccc 	%r8, 0x06db, %r23
	.word 0xa9298009  ! 58: SLL_R	sll 	%r6, %r9, %r20
	.word 0xae10800e  ! 58: OR_R	or 	%r2, %r14, %r23
	.word 0xbf2a000d  ! 58: SLL_R	sll 	%r8, %r13, %r31
	.word 0xa2810009  ! 58: ADDcc_R	addcc 	%r4, %r9, %r17
	.word 0xac98aaa3  ! 58: XORcc_I	xorcc 	%r2, 0x0aa3, %r22
	.word 0xab643801  ! 58: MOVcc_I	<illegal instruction>
	.word 0xa728b001  ! 59: SLLX_I	sllx	%r2, 0x0001, %r19
	.word 0xa0012f18  ! 59: ADD_I	add 	%r4, 0x0f18, %r16
	.word 0xb281abe0  ! 59: ADDcc_I	addcc 	%r6, 0x0be0, %r25
	.word 0xbf323001  ! 59: SRLX_I	srlx	%r8, 0x0001, %r31
	.word 0xad64180c  ! 59: MOVcc_R	<illegal instruction>
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xa1292001  ! 60: SLL_I	sll 	%r4, 0x0001, %r16
	.word 0xa281a9e8  ! 60: ADDcc_I	addcc 	%r6, 0x09e8, %r17
	.word 0xa418ae45  ! 60: XOR_I	xor 	%r2, 0x0e45, %r18
	.word 0xa5297001  ! 60: SLLX_I	sllx	%r5, 0x0001, %r18
	.word 0xba38abcc  ! 60: XNOR_I	xnor 	%r2, 0x0bcc, %r29
	.word 0xa281000f  ! 60: ADDcc_R	addcc 	%r4, %r15, %r17
	.word 0xa928900b  ! 60: SLLX_R	sllx	%r2, %r11, %r20
	.word 0xa69a0009  ! 60: XORcc_R	xorcc 	%r8, %r9, %r19
	.word 0xa332000c  ! 60: SRL_R	srl 	%r8, %r12, %r17
.align 0x8
	.word 0x30800003  ! 61: BA	ba,a	<label_0x3>
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xf231e676  ! 64: STH_I	sth	%r25, [%r7 + 0x0676]
	.word 0xb889a84d  ! 66: ANDcc_I	andcc 	%r6, 0x084d, %r28
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,NIR,x,27)
	.word 0xaa498009  ! 69: MULX_R	mulx 	%r6, %r9, %r21
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xa038a48c  ! 72: XNOR_I	xnor 	%r2, 0x048c, %r16
	.word 0xa1780409  ! 74: MOVR_R	move	%r0, %r9, %r16
	.word 0xb1323001  ! 74: SRLX_I	srlx	%r8, 0x0001, %r24
	.word 0xa52a000d  ! 74: SLL_R	sll 	%r8, %r13, %r18
	.word 0xa73a0009  ! 74: SRA_R	sra 	%r8, %r9, %r19
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xe231e014  ! 76: STH_I	sth	%r17, [%r7 + 0x0014]
	.word 0xa2996e7a  ! 79: XORcc_I	xorcc 	%r5, 0x0e7a, %r17
	.word 0xaab1000a  ! 81: ORNcc_R	orncc 	%r4, %r10, %r21
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xb4d8c00b  ! 84: SMULcc_R	smulcc 	%r3, %r11, %r26
	.word 0xf470e9b9  ! 87: STX_I	stx	%r26, [%r3 + 0x09b9]
	.word 0xaa4162e6  ! 90: ADDC_I	addc 	%r5, 0x02e6, %r21
	.word 0xb564180f  ! 92: MOVcc_R	<illegal instruction>
	.word 0xacd92f7a  ! 95: SMULcc_I	smulcc 	%r4, 0x0f7a, %r22
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,2,15)
	.word 0xb5397001  ! 98: SRAX_I	srax	%r5, 0x0001, %r26
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xb60a2231  ! 101: AND_I	and 	%r8, 0x0231, %r27
	.word 0xb620e271  ! 104: SUB_I	sub 	%r3, 0x0271, %r27
	.word 0xbe81000f  ! 106: ADDcc_R	addcc 	%r4, %r15, %r31
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xaa5122c4  ! 109: UMUL_I	umul 	%r4, 0x02c4, %r21
	.word 0xaa30800f  ! 111: ORN_R	orn 	%r2, %r15, %r21
	.word 0xbf38900c  ! 111: SRAX_R	srax	%r2, %r12, %r31
	.word 0xbf31f001  ! 111: SRLX_I	srlx	%r7, 0x0001, %r31
	.word 0xaa320009  ! 111: ORN_R	orn 	%r8, %r9, %r21
	.word 0xb29a000b  ! 111: XORcc_R	xorcc 	%r8, %r11, %r25
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,41)
	.word 0xf2420000  ! 113: LDSW_R	ldsw	[%r8 + %r0], %r25
	.word 0xaf39e001  ! 116: SRA_I	sra 	%r7, 0x0001, %r23
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,IR_NIR,6,21)
	.word 0xbed12aeb  ! 119: UMULcc_I	umulcc 	%r4, 0x0aeb, %r31
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	.word 0xab28800f  ! 121: SLL_R	sll 	%r2, %r15, %r21
	.word 0xb6822c08  ! 121: ADDcc_I	addcc 	%r8, 0x0c08, %r27
	.word 0xb4ba000e  ! 121: XNORcc_R	xnorcc 	%r8, %r14, %r26
	.word 0xac39400d  ! 121: XNOR_R	xnor 	%r5, %r13, %r22
	.word 0xab31b001  ! 121: SRLX_I	srlx	%r6, 0x0001, %r21
	.word 0xb6c0eee2  ! 121: ADDCcc_I	addccc 	%r3, 0x0ee2, %r27
	.word 0xa438a6e7  ! 121: XNOR_I	xnor 	%r2, 0x06e7, %r18
	.word 0xae822624  ! 121: ADDcc_I	addcc 	%r8, 0x0624, %r23
	.word 0xa529100a  ! 121: SLLX_R	sllx	%r4, %r10, %r18
	.word 0xb038ecaa  ! 121: XNOR_I	xnor 	%r3, 0x0caa, %r24
	.word 0xbd29d00f  ! 121: SLLX_R	sllx	%r7, %r15, %r30
	.word 0xbc32000e  ! 121: ORN_R	orn 	%r8, %r14, %r30
	.word 0xb928f001  ! 121: SLLX_I	sllx	%r3, 0x0001, %r28
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xe871ea00  ! 123: STX_I	stx	%r20, [%r7 + 0x0a00]
	.word 0xaf38a061  ! 126: SRA_I	sra 	%r2, 0x0001, %r23
	.word 0xb428800c  ! 128: ANDN_R	andn 	%r2, %r12, %r26
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR_NIR,11,33)
	.word 0xb451800d  ! 131: UMUL_R	umul 	%r6, %r13, %r26
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf431a379  ! 135: STH_I	sth	%r26, [%r6 + 0x0379]
	.word 0xa4c16a56  ! 138: ADDCcc_I	addccc 	%r5, 0x0a56, %r18
	.word 0xb618aa33  ! 140: XOR_I	xor 	%r2, 0x0a33, %r27
	.word 0xb6d1000b  ! 143: UMULcc_R	umulcc 	%r4, %r11, %r27
.align 0x8
	.word 0x30800003  ! 145: BA	ba,a	<label_0x3>
	.word 0xf6592cbb  ! 148: LDX_I	ldx	[%r4 + 0x0cbb], %r27
	.word 0xb600ea38  ! 150: ADD_I	add 	%r3, 0x0a38, %r27
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR_NIR,31,18)
	.word 0xa849c00c  ! 153: MULX_R	mulx 	%r7, %r12, %r20
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xba0a000d  ! 156: AND_R	and 	%r8, %r13, %r29
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	.word 0xb939d00b  ! 158: SRAX_R	srax	%r7, %r11, %r28
	.word 0xbe10e7fa  ! 158: OR_I	or 	%r3, 0x07fa, %r31
	.word 0xa281400b  ! 158: ADDcc_R	addcc 	%r5, %r11, %r17
	.word 0xb731f001  ! 158: SRLX_I	srlx	%r7, 0x0001, %r27
	.word 0xbcb1000f  ! 158: ORNcc_R	orncc 	%r4, %r15, %r30
	.word 0xb729000e  ! 158: SLL_R	sll 	%r4, %r14, %r27
	.word 0xaac1ac6a  ! 158: ADDCcc_I	addccc 	%r6, 0x0c6a, %r21
	.word 0xa131e001  ! 158: SRL_I	srl 	%r7, 0x0001, %r16
	.word 0xa4812dc2  ! 158: ADDcc_I	addcc 	%r4, 0x0dc2, %r18
	.word 0xa0c0ea7e  ! 158: ADDCcc_I	addccc 	%r3, 0x0a7e, %r16
	.word 0xbf2a3001  ! 158: SLLX_I	sllx	%r8, 0x0001, %r31
	.word 0xa62a000e  ! 158: ANDN_R	andn 	%r8, %r14, %r19
	.word 0xbc80800b  ! 159: ADDcc_R	addcc 	%r2, %r11, %r30
	.word 0xb82a000e  ! 159: ANDN_R	andn 	%r8, %r14, %r28
	.word 0xa001ec69  ! 159: ADD_I	add 	%r7, 0x0c69, %r16
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe020ea24  ! 161: STW_I	stw	%r16, [%r3 + 0x0a24]
	.word 0xbeb12067  ! 164: ORNcc_I	orncc 	%r4, 0x0067, %r31
	.word 0xae88c00a  ! 166: ANDcc_R	andcc 	%r3, %r10, %r23
	.word 0xb120ecb9  ! 169: MULScc_I	mulscc 	%r3, 0x0cb9, %r24
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,IR_NIR,1,14)
	.word 0xaa11e2a6  ! 172: OR_I	or 	%r7, 0x02a6, %r21
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,15)
	.word 0xea51c000  ! 175: LDSH_R	ldsh	[%r7 + %r0], %r21
	.word 0xb8a8aef6  ! 178: ANDNcc_I	andncc 	%r2, 0x0ef6, %r28
	.word 0xb921a3ec  ! 181: MULScc_I	mulscc 	%r6, 0x03ec, %r28
	.word 0xa811c00d  ! 183: OR_R	or 	%r7, %r13, %r20
	.word 0xb431c00f  ! 183: ORN_R	orn 	%r7, %r15, %r26
	.word 0xaa992294  ! 183: XORcc_I	xorcc 	%r4, 0x0294, %r21
	.word 0xba29800a  ! 184: ANDN_R	andn 	%r6, %r10, %r29
	.word 0xb290800e  ! 184: ORcc_R	orcc 	%r2, %r14, %r25
	.word 0xad29f001  ! 184: SLLX_I	sllx	%r7, 0x0001, %r22
	.word 0xbcc1800d  ! 184: ADDCcc_R	addccc 	%r6, %r13, %r30
	.word 0xa8c18009  ! 184: ADDCcc_R	addccc 	%r6, %r9, %r20
.align 0x8
	.word 0x30800003  ! 185: BA	ba,a	<label_0x3>
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,67)
	.word 0xe8598000  ! 188: LDX_R	ldx	[%r6 + %r0], %r20
	.word 0xb201806c  ! 191: ADD_R	add 	%r6, %r12, %r25
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR_NIR,24,11)
	.word 0xb249000f  ! 194: MULX_R	mulx 	%r4, %r15, %r25
	.word 0xa1782401  ! 196: MOVR_I	move	%r0, 0xf, %r16
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xa250c009  ! 199: UMUL_R	umul 	%r3, %r9, %r17
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,NIR,x,25)
	.word 0xb608a372  ! 202: AND_I	and 	%r2, 0x0372, %r27
.align 0x8
	.word 0x30800003  ! 204: BA	ba,a	<label_0x3>
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,30)
	.word 0xf6408000  ! 207: LDSW_R	ldsw	[%r2 + %r0], %r27
	.word 0xb131e061  ! 210: SRL_I	srl 	%r7, 0x0001, %r24
	.word 0xae59a5c5  ! 213: SMUL_I	smul 	%r6, 0x05c5, %r23
	.word 0xa438ec9f  ! 215: XNOR_I	xnor 	%r3, 0x0c9f, %r18
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xaa49400e  ! 218: MULX_R	mulx 	%r5, %r14, %r21
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xb6ba2cd7  ! 221: XNORcc_I	xnorcc 	%r8, 0x0cd7, %r27
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf61a24a9  ! 225: LDD_I	ldd	[%r8 + 0x04a9], %r27
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,NIR,x,0)
	.word 0xbeda000e  ! 228: SMULcc_R	smulcc 	%r8, %r14, %r31
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xf270ea98  ! 231: STX_I	stx	%r25, [%r3 + 0x0a98]
	.word 0xbc20e264  ! 234: SUB_I	sub 	%r3, 0x0264, %r30
	.word 0xb964180e  ! 236: MOVcc_R	<illegal instruction>
	.word 0xa051a1be  ! 239: UMUL_I	umul 	%r6, 0x01be, %r16
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xb480c00a  ! 242: ADDcc_R	addcc 	%r3, %r10, %r26
	.word 0xac120069  ! 245: OR_R	or 	%r8, %r9, %r22
	.word 0xa890800f  ! 247: ORcc_R	orcc 	%r2, %r15, %r20
	.word 0xb4d8800b  ! 250: SMULcc_R	smulcc 	%r2, %r11, %r26
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,NIR,x,12)
	.word 0xb031aabc  ! 253: SUBC_I	orn 	%r6, 0x0abc, %r24
	.word 0xb02a2a59  ! 255: ANDN_I	andn 	%r8, 0x0a59, %r24
	.word 0xa00a2cbf  ! 255: AND_I	and 	%r8, 0x0cbf, %r16
	.word 0xaa99660d  ! 255: XORcc_I	xorcc 	%r5, 0x060d, %r21
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe671aa90  ! 257: STX_I	stx	%r19, [%r6 + 0x0a90]
	.word 0xa038edf6  ! 260: XNOR_I	xnor 	%r3, 0x0df6, %r16
	.word 0xaea0e050  ! 262: SUBcc_I	subcc 	%r3, 0x0050, %r23
	.word 0xba59400c  ! 265: SMUL_R	smul 	%r5, %r12, %r29
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xac0a23b2  ! 268: AND_I	and 	%r8, 0x03b2, %r22
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,47)
	.word 0xec0a0000  ! 271: LDUB_R	ldub	[%r8 + %r0], %r22
	.word 0xba9121fe  ! 274: ORcc_I	orcc 	%r4, 0x01fe, %r29
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xb449000c  ! 277: MULX_R	mulx 	%r4, %r12, %r26
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,42)
	.word 0xf4110000  ! 280: LDUH_R	lduh	[%r4 + %r0], %r26
	.word 0xa019000d  ! 283: XOR_R	xor 	%r4, %r13, %r16
	.word 0xa459aaf1  ! 286: SMUL_I	smul 	%r6, 0x0af1, %r18
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,NIR,x,3)
	.word 0xac3a000c  ! 289: XNOR_R	xnor 	%r8, %r12, %r22
	.word 0xa0b20009  ! 291: ORNcc_R	orncc 	%r8, %r9, %r16
	.word 0xba40c00e  ! 291: ADDC_R	addc 	%r3, %r14, %r29
	.word 0xa331b001  ! 291: SRLX_I	srlx	%r6, 0x0001, %r17
	.word 0xaab1e342  ! 291: ORNcc_I	orncc 	%r7, 0x0342, %r21
	.word 0xab316001  ! 292: SRL_I	srl 	%r5, 0x0001, %r21
	.word 0xa412000e  ! 292: OR_R	or 	%r8, %r14, %r18
	.word 0xbc32262e  ! 292: ORN_I	orn 	%r8, 0x062e, %r30
	.word 0xa039c009  ! 292: XNOR_R	xnor 	%r7, %r9, %r16
	.word 0xb010800a  ! 292: OR_R	or 	%r2, %r10, %r24
	.word 0xfa21aa44  ! 294: STW_I	stw	%r29, [%r6 + 0x0a44]
	.word 0xb0892cf8  ! 297: ANDcc_I	andcc 	%r4, 0x0cf8, %r24
	.word 0xb440c00c  ! 299: ADDC_R	addc 	%r3, %r12, %r26
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,IR_NIR,33,33)
	.word 0xaad9c00a  ! 302: SMULcc_R	smulcc 	%r7, %r10, %r21
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,44)
	.word 0xea59c000  ! 305: LDX_R	ldx	[%r7 + %r0], %r21
	.word 0xac0a006d  ! 308: AND_R	and 	%r8, %r13, %r22
	.word 0xb0da0009  ! 311: SMULcc_R	smulcc 	%r8, %r9, %r24
thr1_ic_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,NIR,x,8)
	.word 0xa964180f  ! 314: MOVcc_R	<illegal instruction>
	.word 0xbe996155  ! 316: XORcc_I	xorcc 	%r5, 0x0155, %r31
	.word 0xaa08c00f  ! 316: AND_R	and 	%r3, %r15, %r21
	.word 0xbd311009  ! 316: SRLX_R	srlx	%r4, %r9, %r30
	.word 0xa731a001  ! 317: SRL_I	srl 	%r6, 0x0001, %r19
	.word 0xb481800d  ! 317: ADDcc_R	addcc 	%r6, %r13, %r26
	.word 0xa328e001  ! 317: SLL_I	sll 	%r3, 0x0001, %r17
	.word 0xba11283b  ! 318: OR_I	or 	%r4, 0x083b, %r29
	.word 0xa0b9000f  ! 318: XNORcc_R	xnorcc 	%r4, %r15, %r16
	.word 0xa4c0a1db  ! 318: ADDCcc_I	addccc 	%r2, 0x01db, %r18
	.word 0xb418aa14  ! 319: XOR_I	xor 	%r2, 0x0a14, %r26
	.word 0xa4c0800d  ! 319: ADDCcc_R	addccc 	%r2, %r13, %r18
	.word 0xba00e9b3  ! 319: ADD_I	add 	%r3, 0x09b3, %r29
	.word 0xa499400f  ! 319: XORcc_R	xorcc 	%r5, %r15, %r18
	.word 0xb5317001  ! 319: SRLX_I	srlx	%r5, 0x0001, %r26
	.word 0xa2316a07  ! 320: ORN_I	orn 	%r5, 0x0a07, %r17
	.word 0xab78040b  ! 320: MOVR_R	move	%r0, %r11, %r21
	.word 0xb7292001  ! 320: SLL_I	sll 	%r4, 0x0001, %r27
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xb2b1400c  ! 322: ORNcc_R	orncc 	%r5, %r12, %r25
	.word 0xbc31e70c  ! 325: SUBC_I	orn 	%r7, 0x070c, %r30
	.word 0xbc90a0c9  ! 327: ORcc_I	orcc 	%r2, 0x00c9, %r30
	.word 0xac59676a  ! 330: SMUL_I	smul 	%r5, 0x076a, %r22
thr1_ic_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xaca0e627  ! 333: SUBcc_I	subcc 	%r3, 0x0627, %r22
	.word 0xa699efac  ! 335: XORcc_I	xorcc 	%r7, 0x0fac, %r19
	.word 0xb240c009  ! 335: ADDC_R	addc 	%r3, %r9, %r25
	.word 0xa0912a6a  ! 335: ORcc_I	orcc 	%r4, 0x0a6a, %r16
	.word 0xb830c00e  ! 335: ORN_R	orn 	%r3, %r14, %r28
	.word 0xb039ac84  ! 335: XNOR_I	xnor 	%r6, 0x0c84, %r24
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xf019800e  ! 338: LDD_R	ldd	[%r6 + %r14], %r24
	.word 0xb8d1000d  ! 341: UMULcc_R	umulcc 	%r4, %r13, %r28
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xbac1800b  ! 344: ADDCcc_R	addccc 	%r6, %r11, %r29
	.word 0xaab9406a  ! 347: XNORcc_R	xnorcc 	%r5, %r10, %r21
	.word 0xa0c18009  ! 349: ADDCcc_R	addccc 	%r6, %r9, %r16
	.word 0xa25a000f  ! 352: SMUL_R	smul 	%r8, %r15, %r17
thr1_ic_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,IR_NIR,30,14)
	.word 0xab31a001  ! 355: SRL_I	srl 	%r6, 0x0001, %r21
.align 0x8
	.word 0x30800003  ! 357: BA	ba,a	<label_0x3>
	.word 0xa6b9006e  ! 360: XNORcc_R	xnorcc 	%r4, %r14, %r19
	.word 0xb0422e0c  ! 362: ADDC_I	addc 	%r8, 0x0e0c, %r24
thr1_ic_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,NIR,x,5)
	.word 0xa921800b  ! 365: MULScc_R	mulscc 	%r6, %r11, %r20
thr1_ic_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,NIR,x,6)
	.word 0xb4810009  ! 368: ADDcc_R	addcc 	%r4, %r9, %r26
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,15)
	.word 0xf4490000  ! 371: LDSB_R	ldsb	[%r4 + %r0], %r26
	.word 0xb611a2e0  ! 374: OR_I	or 	%r6, 0x02e0, %r27
thr1_ic_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_29), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xa859000c  ! 377: SMUL_R	smul 	%r4, %r12, %r20
	.word 0xa328900d  ! 379: SLLX_R	sllx	%r2, %r13, %r17
	.word 0xb611400d  ! 379: OR_R	or 	%r5, %r13, %r27
	.word 0xba1122d5  ! 379: OR_I	or 	%r4, 0x02d5, %r29
	.word 0xaf64180b  ! 379: MOVcc_R	<illegal instruction>
	.word 0xb0b16ef9  ! 379: ORNcc_I	orncc 	%r5, 0x0ef9, %r24
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xe871ae30  ! 381: STX_I	stx	%r20, [%r6 + 0x0e30]
	.word 0xa932100a  ! 384: SRLX_R	srlx	%r8, %r10, %r20
	.word 0xa3782401  ! 386: MOVR_I	move	%r0, 0xa, %r17
thr1_ic_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_30), 16, 16),1,IC_DATA,IR_NIR,16,6)
	.word 0xa4d12b72  ! 389: UMULcc_I	umulcc 	%r4, 0x0b72, %r18
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xb030800d  ! 392: SUBC_R	orn 	%r2, %r13, %r24
	.word 0xae1a006a  ! 395: XOR_R	xor 	%r8, %r10, %r23
	.word 0xaca90009  ! 397: ANDNcc_R	andncc 	%r4, %r9, %r22
thr1_ic_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_31), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xa451400e  ! 400: UMUL_R	umul 	%r5, %r14, %r18
	.word 0xac30e520  ! 402: ORN_I	orn 	%r3, 0x0520, %r22
	.word 0xb530b001  ! 402: SRLX_I	srlx	%r2, 0x0001, %r26
	.word 0xbd28d00d  ! 402: SLLX_R	sllx	%r3, %r13, %r30
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xae4222a7  ! 403: ADDC_I	addc 	%r8, 0x02a7, %r23
	.word 0xbb643801  ! 403: MOVcc_I	<illegal instruction>
	.word 0xbc016913  ! 403: ADD_I	add 	%r5, 0x0913, %r30
	.word 0xb3643801  ! 403: MOVcc_I	<illegal instruction>
	.word 0xb898e874  ! 403: XORcc_I	xorcc 	%r3, 0x0874, %r28
	.word 0xbf64180a  ! 403: MOVcc_R	<illegal instruction>
	.word 0xb332100a  ! 403: SRLX_R	srlx	%r8, %r10, %r25
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,17)
	.word 0xf25a0000  ! 405: LDX_R	ldx	[%r8 + %r0], %r25
	.word 0xaa10a86d  ! 408: OR_I	or 	%r2, 0x086d, %r21
thr1_ic_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_32), 16, 16),1,IC_DATA,IR_NIR,27,15)
	.word 0xa4d9c00c  ! 411: SMULcc_R	smulcc 	%r7, %r12, %r18
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,70)
	.word 0xe419c000  ! 414: LDD_R	ldd	[%r7 + %r0], %r18
	.word 0xbb78040b  ! 417: MOVR_R	move	%r0, %r11, %r29
thr1_ic_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_33), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xaa48e5d1  ! 420: MULX_I	mulx 	%r3, 0x05d1, %r21
	.word 0xa8320009  ! 422: ORN_R	orn 	%r8, %r9, %r20
	.word 0xa610800e  ! 422: OR_R	or 	%r2, %r14, %r19
	.word 0xbb31800e  ! 422: SRL_R	srl 	%r6, %r14, %r29
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,56)
	.word 0xfa198000  ! 424: LDD_R	ldd	[%r6 + %r0], %r29
	.word 0xb498e062  ! 427: XORcc_I	xorcc 	%r3, 0x0062, %r26
	.word 0xb921207e  ! 430: MULScc_I	mulscc 	%r4, 0x007e, %r28
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xe67128c8  ! 433: STX_I	stx	%r19, [%r4 + 0x08c8]
	.word 0xb409a9f0  ! 436: AND_I	and 	%r6, 0x09f0, %r26
	.word 0xbc008009  ! 438: ADD_R	add 	%r2, %r9, %r30
	.word 0xbc51c00f  ! 441: UMUL_R	umul 	%r7, %r15, %r30
thr1_ic_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_34), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xbd2a2001  ! 444: SLL_I	sll 	%r8, 0x0001, %r30
.align 0x8
	.word 0x30800003  ! 446: BA	ba,a	<label_0x3>
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,49)
	.word 0xfc4a0000  ! 449: LDSB_R	ldsb	[%r8 + %r0], %r30
	.word 0xb4a9ee65  ! 452: ANDNcc_I	andncc 	%r7, 0x0e65, %r26
	.word 0xb520c00a  ! 455: MULScc_R	mulscc 	%r3, %r10, %r26
thr1_ic_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_35), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xa241a049  ! 458: ADDC_I	addc 	%r6, 0x0049, %r17
	.word 0xb6196891  ! 460: XOR_I	xor 	%r5, 0x0891, %r27
thr1_ic_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_36), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xba59c009  ! 463: SMUL_R	smul 	%r7, %r9, %r29
thr1_ic_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_37), 16, 16),1,IC_DATA,IR_NIR,6,29)
	.word 0xb681000c  ! 466: ADDcc_R	addcc 	%r4, %r12, %r27
.align 0x8
	.word 0x30800003  ! 468: BA	ba,a	<label_0x3>
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xf070ee18  ! 471: STX_I	stx	%r24, [%r3 + 0x0e18]
	.word 0xbab9000b  ! 473: XNORcc_R	xnorcc 	%r4, %r11, %r29
thr1_ic_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_38), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xa6512105  ! 476: UMUL_I	umul 	%r4, 0x0105, %r19
thr1_ic_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_39), 16, 16),1,IC_DATA,IR_NIR,28,13)
	.word 0xb538e001  ! 479: SRA_I	sra 	%r3, 0x0001, %r26
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6c18009  ! 481: ADDCcc_R	addccc 	%r6, %r9, %r19
	.word 0xb09926fd  ! 481: XORcc_I	xorcc 	%r4, 0x06fd, %r24
	.word 0xb529500f  ! 481: SLLX_R	sllx	%r5, %r15, %r26
	.word 0xba922d87  ! 481: ORcc_I	orcc 	%r8, 0x0d87, %r29
	.word 0xaab9c00a  ! 481: XNORcc_R	xnorcc 	%r7, %r10, %r21
	.word 0xa930e001  ! 481: SRL_I	srl 	%r3, 0x0001, %r20
	.word 0xbd29400e  ! 481: SLL_R	sll 	%r5, %r14, %r30
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xbf782401  ! 482: MOVR_I	move	%r0, 0xe, %r31
	.word 0xbcc0c00b  ! 482: ADDCcc_R	addccc 	%r3, %r11, %r30
	.word 0xb811800b  ! 482: OR_R	or 	%r6, %r11, %r28
	.word 0xae28e4dd  ! 482: ANDN_I	andn 	%r3, 0x04dd, %r23
	.word 0xae12287c  ! 482: OR_I	or 	%r8, 0x087c, %r23
	.word 0xa098e88c  ! 482: XORcc_I	xorcc 	%r3, 0x088c, %r16
	.word 0xa62a000f  ! 482: ANDN_R	andn 	%r8, %r15, %r19
	.word 0xb4a9a779  ! 482: ANDNcc_I	andncc 	%r6, 0x0779, %r26
	.word 0xbe19800b  ! 482: XOR_R	xor 	%r6, %r11, %r31
	.word 0xa53a100f  ! 482: SRAX_R	srax	%r8, %r15, %r18
	.word 0xb931a001  ! 482: SRL_I	srl 	%r6, 0x0001, %r28
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xbe10e08d  ! 483: OR_I	or 	%r3, 0x008d, %r31
	.word 0xb6122a13  ! 483: OR_I	or 	%r8, 0x0a13, %r27
	.word 0xb978040c  ! 483: MOVR_R	move	%r0, %r12, %r28
	.word 0xaa18e4a5  ! 483: XOR_I	xor 	%r3, 0x04a5, %r21
	.word 0xb331c00a  ! 483: SRL_R	srl 	%r7, %r10, %r25
	.word 0xac08c00d  ! 483: AND_R	and 	%r3, %r13, %r22
	.word 0xbf31000a  ! 483: SRL_R	srl 	%r4, %r10, %r31
	.word 0xb4ba20a4  ! 483: XNORcc_I	xnorcc 	%r8, 0x00a4, %r26
	.word 0xaeb9000d  ! 483: XNORcc_R	xnorcc 	%r4, %r13, %r23
	.word 0xb0aa28c4  ! 483: ANDNcc_I	andncc 	%r8, 0x08c4, %r24
	.word 0xb029c00c  ! 483: ANDN_R	andn 	%r7, %r12, %r24
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xf430af3c  ! 485: STH_I	sth	%r26, [%r2 + 0x0f3c]
	.word 0xb498e965  ! 488: XORcc_I	xorcc 	%r3, 0x0965, %r26
	.word 0xbb78040c  ! 490: MOVR_R	move	%r0, %r12, %r29
thr1_ic_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_40), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xac5a2724  ! 493: SMUL_I	smul 	%r8, 0x0724, %r22
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xaeb1000a  ! 495: ORNcc_R	orncc 	%r4, %r10, %r23
	.word 0xa881e8b8  ! 495: ADDcc_I	addcc 	%r7, 0x08b8, %r20
	.word 0xa2b0c009  ! 495: ORNcc_R	orncc 	%r3, %r9, %r17
	.word 0xb7782401  ! 495: MOVR_I	move	%r0, 0x9, %r27
	.word 0xb164180c  ! 495: MOVcc_R	<illegal instruction>
	.word 0xac0925de  ! 495: AND_I	and 	%r4, 0x05de, %r22
	.word 0xa1782401  ! 495: MOVR_I	move	%r0, 0x5de, %r16
	.word 0xbaa9a9ae  ! 495: ANDNcc_I	andncc 	%r6, 0x09ae, %r29
	.word 0xb130d00d  ! 495: SRLX_R	srlx	%r3, %r13, %r24
	.word 0xbcb1400e  ! 495: ORNcc_R	orncc 	%r5, %r14, %r30
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xa630800e  ! 496: ORN_R	orn 	%r2, %r14, %r19
	.word 0xa12a000f  ! 496: SLL_R	sll 	%r8, %r15, %r16
	.word 0xa011ea4d  ! 496: OR_I	or 	%r7, 0x0a4d, %r16
	.word 0xae1a000b  ! 496: XOR_R	xor 	%r8, %r11, %r23
	.word 0xb0c1800d  ! 496: ADDCcc_R	addccc 	%r6, %r13, %r24
	.word 0xa899000f  ! 496: XORcc_R	xorcc 	%r4, %r15, %r20
	.word 0xab32000b  ! 496: SRL_R	srl 	%r8, %r11, %r21
	.word 0xb629e8ef  ! 496: ANDN_I	andn 	%r7, 0x08ef, %r27
	.word 0xaeb8c00b  ! 496: XNORcc_R	xnorcc 	%r3, %r11, %r23
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,69)
	.word 0xee08c000  ! 498: LDUB_R	ldub	[%r3 + %r0], %r23
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x0d895d8ca7261f40, %r16, %r16
	setx  0x90c16024b3e22fb3, %r16, %r17
	setx  0x54e718f0baf18b18, %r16, %r18
	setx  0x123e6f124293b75b, %r16, %r19
	setx  0xd05ee2dec4efc548, %r16, %r20
	setx  0x8447541ab887c475, %r16, %r21
	setx  0x50fe6472ce33ebba, %r16, %r22
	setx  0xf23a7c2efe4c60e0, %r16, %r23
	setx  0x62c5aeeeb7b44085, %r16, %r24
	setx  0x8909faa46bf160ab, %r16, %r25
	setx  0xff1d7735ea27df8a, %r16, %r26
	setx  0x8c59d3f99397b721, %r16, %r27
	setx  0x0e69deb1b3734e09, %r16, %r28
	setx  0x6b71a91dd6b70905, %r16, %r29
	setx  0x72f7b88fa79599ec, %r16, %r30
	setx  0xe0df4a50bf101c35, %r16, %r31
	setx  0x0000000000000db0, %r16, %r9
	setx  0x0000000000000650, %r16, %r10
	setx  0x00000000000000b0, %r16, %r11
	setx  0x0000000000000da0, %r16, %r12
	setx  0x0000000000000310, %r16, %r13
	setx  0x0000000000000140, %r16, %r14
	setx  0x0000000000000700, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xa8d1800b  ! 1: UMULcc_R	umulcc 	%r6, %r11, %r20
	.word 0xa0d1000a  ! 1: UMULcc_R	umulcc 	%r4, %r10, %r16
	.word 0xb24a000b  ! 1: MULX_R	mulx 	%r8, %r11, %r25
	.word 0xa8516d2d  ! 1: UMUL_I	umul 	%r5, 0x0d2d, %r20
	.word 0xa2d0a24a  ! 1: UMULcc_I	umulcc 	%r2, 0x024a, %r17
	.word 0xac48800c  ! 1: MULX_R	mulx 	%r2, %r12, %r22
	.word 0xbc596b32  ! 1: SMUL_I	smul 	%r5, 0x0b32, %r30
	.word 0xae49400f  ! 1: MULX_R	mulx 	%r5, %r15, %r23
	.word 0xa120800c  ! 1: MULScc_R	mulscc 	%r2, %r12, %r16
	.word 0xbcd0800d  ! 1: UMULcc_R	umulcc 	%r2, %r13, %r30
	.word 0xb449800b  ! 1: MULX_R	mulx 	%r6, %r11, %r26
	.word 0xa859c00f  ! 1: SMUL_R	smul 	%r7, %r15, %r20
	.word 0xb851e16a  ! 1: UMUL_I	umul 	%r7, 0x016a, %r28
	.word 0xaed1ee00  ! 1: UMULcc_I	umulcc 	%r7, 0x0e00, %r23
	.word 0xa2d92d77  ! 1: SMULcc_I	smulcc 	%r4, 0x0d77, %r17
	.word 0xa64969e4  ! 1: MULX_I	mulx 	%r5, 0x09e4, %r19
	.word 0xb05121b8  ! 1: UMUL_I	umul 	%r4, 0x01b8, %r24
	.word 0xb248a9ab  ! 1: MULX_I	mulx 	%r2, 0x09ab, %r25
	.word 0xa6d1800c  ! 1: UMULcc_R	umulcc 	%r6, %r12, %r19
	.word 0xbcd8a9bb  ! 1: SMULcc_I	smulcc 	%r2, 0x09bb, %r30
	.word 0xaad22a64  ! 1: UMULcc_I	umulcc 	%r8, 0x0a64, %r21
	.word 0xb2d9c00c  ! 1: SMULcc_R	smulcc 	%r7, %r12, %r25
	.word 0xaf21e8c1  ! 1: MULScc_I	mulscc 	%r7, 0x08c1, %r23
	.word 0xba522e93  ! 1: UMUL_I	umul 	%r8, 0x0e93, %r29
	.word 0xa8d9800a  ! 1: SMULcc_R	smulcc 	%r6, %r10, %r20
	.word 0xae19400f  ! 1: XOR_R	xor 	%r5, %r15, %r23
	.word 0xac312cf2  ! 1: ORN_I	orn 	%r4, 0x0cf2, %r22
	.word 0xa964180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbc80c00e  ! 1: ADDcc_R	addcc 	%r3, %r14, %r30
	.word 0xb211c00e  ! 1: OR_R	or 	%r7, %r14, %r25
	.word 0xb8b9000e  ! 1: XNORcc_R	xnorcc 	%r4, %r14, %r28
	.word 0xa04226e6  ! 1: ADDC_I	addc 	%r8, 0x06e6, %r16
	.word 0xa84125d2  ! 1: ADDC_I	addc 	%r4, 0x05d2, %r20
	.word 0xa281c009  ! 1: ADDcc_R	addcc 	%r7, %r9, %r17
	.word 0xbc41000a  ! 1: ADDC_R	addc 	%r4, %r10, %r30
	.word 0xbad1e6c6  ! 1: UMULcc_I	umulcc 	%r7, 0x06c6, %r29
	.word 0xba5a000b  ! 1: SMUL_R	smul 	%r8, %r11, %r29
	.word 0xaa5a000b  ! 1: SMUL_R	smul 	%r8, %r11, %r21
	.word 0xa449ecea  ! 1: MULX_I	mulx 	%r7, 0x0cea, %r18
	.word 0xa8596fdb  ! 1: SMUL_I	smul 	%r5, 0x0fdb, %r20
	.word 0xb4512533  ! 1: UMUL_I	umul 	%r4, 0x0533, %r26
	.word 0xa048c00e  ! 1: MULX_R	mulx 	%r3, %r14, %r16
	.word 0xb321000f  ! 1: MULScc_R	mulscc 	%r4, %r15, %r25
	.word 0xa649400e  ! 1: MULX_R	mulx 	%r5, %r14, %r19
	.word 0xa650a950  ! 1: UMUL_I	umul 	%r2, 0x0950, %r19
	.word 0xaf20e856  ! 1: MULScc_I	mulscc 	%r3, 0x0856, %r23
	.word 0xacd92243  ! 1: SMULcc_I	smulcc 	%r4, 0x0243, %r22
	.word 0xa1208009  ! 1: MULScc_R	mulscc 	%r2, %r9, %r16
	.word 0xb050c00b  ! 1: UMUL_R	umul 	%r3, %r11, %r24
	.word 0xb2514009  ! 1: UMUL_R	umul 	%r5, %r9, %r25
	.word 0xa459000b  ! 1: SMUL_R	smul 	%r4, %r11, %r18
	.word 0xb521e148  ! 1: MULScc_I	mulscc 	%r7, 0x0148, %r26
	.word 0xacd0a0ac  ! 1: UMULcc_I	umulcc 	%r2, 0x00ac, %r22
	.word 0xb722000d  ! 1: MULScc_R	mulscc 	%r8, %r13, %r27
	.word 0xa8d0800a  ! 1: UMULcc_R	umulcc 	%r2, %r10, %r20
	.word 0xb8d1a79c  ! 1: UMULcc_I	umulcc 	%r6, 0x079c, %r28
	.word 0xaad9400c  ! 1: SMULcc_R	smulcc 	%r5, %r12, %r21
	.word 0xbc48ed55  ! 1: MULX_I	mulx 	%r3, 0x0d55, %r30
	.word 0xa8d8abec  ! 1: SMULcc_I	smulcc 	%r2, 0x0bec, %r20
	.word 0xa8d1400a  ! 1: UMULcc_R	umulcc 	%r5, %r10, %r20
	.word 0xb4c22574  ! 1: ADDCcc_I	addccc 	%r8, 0x0574, %r26
	.word 0xba99a98d  ! 1: XORcc_I	xorcc 	%r6, 0x098d, %r29
	.word 0xb3311009  ! 1: SRLX_R	srlx	%r4, %r9, %r25
	.word 0xaea9eadb  ! 1: ANDNcc_I	andncc 	%r7, 0x0adb, %r23
	.word 0xa241a9da  ! 1: ADDC_I	addc 	%r6, 0x09da, %r17
	.word 0xb730e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r27
	.word 0xb530800d  ! 1: SRL_R	srl 	%r2, %r13, %r26
	.word 0xa291c00a  ! 1: ORcc_R	orcc 	%r7, %r10, %r17
	.word 0xb2b8e759  ! 1: XNORcc_I	xnorcc 	%r3, 0x0759, %r25
	.word 0xb828ea6c  ! 1: ANDN_I	andn 	%r3, 0x0a6c, %r28
	.word 0xbe5a000b  ! 1: SMUL_R	smul 	%r8, %r11, %r31
	.word 0xa321a466  ! 1: MULScc_I	mulscc 	%r6, 0x0466, %r17
	.word 0xab20aafe  ! 1: MULScc_I	mulscc 	%r2, 0x0afe, %r21
	.word 0xb8d9800f  ! 1: SMULcc_R	smulcc 	%r6, %r15, %r28
	.word 0xa8498009  ! 1: MULX_R	mulx 	%r6, %r9, %r20
	.word 0xa2d0ac60  ! 1: UMULcc_I	umulcc 	%r2, 0x0c60, %r17
	.word 0xa8d8e929  ! 1: SMULcc_I	smulcc 	%r3, 0x0929, %r20
	.word 0xa0d1651b  ! 1: UMULcc_I	umulcc 	%r5, 0x051b, %r16
	.word 0xb44960ce  ! 1: MULX_I	mulx 	%r5, 0x00ce, %r26
	.word 0xba52000c  ! 1: UMUL_R	umul 	%r8, %r12, %r29
	.word 0xbcd1ad0d  ! 1: UMULcc_I	umulcc 	%r6, 0x0d0d, %r30
	.word 0xb451e9fd  ! 1: UMUL_I	umul 	%r7, 0x09fd, %r26
	.word 0xa859000b  ! 1: SMUL_R	smul 	%r4, %r11, %r20
	.word 0xbc49ae7b  ! 1: MULX_I	mulx 	%r6, 0x0e7b, %r30
	.word 0xb2d9800e  ! 1: SMULcc_R	smulcc 	%r6, %r14, %r25
	.word 0xa521e1bc  ! 1: MULScc_I	mulscc 	%r7, 0x01bc, %r18
	.word 0xbe5a2a4d  ! 1: SMUL_I	smul 	%r8, 0x0a4d, %r31
	.word 0xb851c00a  ! 1: UMUL_R	umul 	%r7, %r10, %r28
	.word 0xa450c00f  ! 1: UMUL_R	umul 	%r3, %r15, %r18
	.word 0xaed96e9f  ! 1: SMULcc_I	smulcc 	%r5, 0x0e9f, %r23
	.word 0xa850800e  ! 1: UMUL_R	umul 	%r2, %r14, %r20
	.word 0xb459e9ff  ! 1: SMUL_I	smul 	%r7, 0x09ff, %r26
	.word 0xaad1800f  ! 1: UMULcc_R	umulcc 	%r6, %r15, %r21
	.word 0xb4d1ac3a  ! 1: UMULcc_I	umulcc 	%r6, 0x0c3a, %r26
	.word 0xaed2000e  ! 1: UMULcc_R	umulcc 	%r8, %r14, %r23
	.word 0xaf641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa402000b  ! 1: ADD_R	add 	%r8, %r11, %r18
	.word 0xa281a43a  ! 1: ADDcc_I	addcc 	%r6, 0x043a, %r17
	.word 0xba922f5c  ! 1: ORcc_I	orcc 	%r8, 0x0f5c, %r29
	.word 0xbb3a100b  ! 1: SRAX_R	srax	%r8, %r11, %r29
	.word 0xa228eb95  ! 1: ANDN_I	andn 	%r3, 0x0b95, %r17
	.word 0xb338800c  ! 1: SRA_R	sra 	%r2, %r12, %r25
	.word 0xb0b8c00e  ! 1: XNORcc_R	xnorcc 	%r3, %r14, %r24
	.word 0xa00164a9  ! 1: ADD_I	add 	%r5, 0x04a9, %r16
	.word 0xb098c00e  ! 1: XORcc_R	xorcc 	%r3, %r14, %r24
	.word 0xaad1000b  ! 1: UMULcc_R	umulcc 	%r4, %r11, %r21
	.word 0xbd20c00c  ! 1: MULScc_R	mulscc 	%r3, %r12, %r30
	.word 0xa252000d  ! 1: UMUL_R	umul 	%r8, %r13, %r17
	.word 0xa050a122  ! 1: UMUL_I	umul 	%r2, 0x0122, %r16
	.word 0xb44a2a34  ! 1: MULX_I	mulx 	%r8, 0x0a34, %r26
	.word 0xb850e82c  ! 1: UMUL_I	umul 	%r3, 0x082c, %r28
	.word 0xb659647d  ! 1: SMUL_I	smul 	%r5, 0x047d, %r27
	.word 0xa2d8800e  ! 1: SMULcc_R	smulcc 	%r2, %r14, %r17
	.word 0xb4d8e158  ! 1: SMULcc_I	smulcc 	%r3, 0x0158, %r26
	.word 0xa1214009  ! 1: MULScc_R	mulscc 	%r5, %r9, %r16
	.word 0xaed0ad14  ! 1: UMULcc_I	umulcc 	%r2, 0x0d14, %r23
	.word 0xa4d1ad10  ! 1: UMULcc_I	umulcc 	%r6, 0x0d10, %r18
	.word 0xbad8c00d  ! 1: SMULcc_R	smulcc 	%r3, %r13, %r29
	.word 0xaa49a0c5  ! 1: MULX_I	mulx 	%r6, 0x00c5, %r21
	.word 0xac58c00a  ! 1: SMUL_R	smul 	%r3, %r10, %r22
	.word 0xa051400f  ! 1: UMUL_R	umul 	%r5, %r15, %r16
	.word 0xac51c00b  ! 1: UMUL_R	umul 	%r7, %r11, %r22
	.word 0xa4d1c00d  ! 1: UMULcc_R	umulcc 	%r7, %r13, %r18
	.word 0xa4d8a8ab  ! 1: SMULcc_I	smulcc 	%r2, 0x08ab, %r18
	.word 0xaa58e656  ! 1: SMUL_I	smul 	%r3, 0x0656, %r21
	.word 0xa248c00b  ! 1: MULX_R	mulx 	%r3, %r11, %r17
	.word 0xb7208009  ! 1: MULScc_R	mulscc 	%r2, %r9, %r27
	.word 0xae59e69e  ! 1: SMUL_I	smul 	%r7, 0x069e, %r23
	.word 0xb251a760  ! 1: UMUL_I	umul 	%r6, 0x0760, %r25
	.word 0xa64a0009  ! 1: MULX_R	mulx 	%r8, %r9, %r19
	.word 0xb4b922c2  ! 1: XNORcc_I	xnorcc 	%r4, 0x02c2, %r26
	.word 0xb5320009  ! 1: SRL_R	srl 	%r8, %r9, %r26
	.word 0xa01a296b  ! 1: XOR_I	xor 	%r8, 0x096b, %r16
	.word 0xa4020009  ! 1: ADD_R	add 	%r8, %r9, %r18
	.word 0xab29c00a  ! 1: SLL_R	sll 	%r7, %r10, %r21
	.word 0xb0b0a90b  ! 1: ORNcc_I	orncc 	%r2, 0x090b, %r24
	.word 0xa488c00d  ! 1: ANDcc_R	andcc 	%r3, %r13, %r18
	.word 0xa1396001  ! 1: SRA_I	sra 	%r5, 0x0001, %r16
	.word 0xbc298009  ! 1: ANDN_R	andn 	%r6, %r9, %r30
	.word 0xbaba0009  ! 1: XNORcc_R	xnorcc 	%r8, %r9, %r29
	.word 0xbe512bf9  ! 1: UMUL_I	umul 	%r4, 0x0bf9, %r31
	.word 0xac59e59d  ! 1: SMUL_I	smul 	%r7, 0x059d, %r22
	.word 0xa251aca8  ! 1: UMUL_I	umul 	%r6, 0x0ca8, %r17
	.word 0xbe49c00a  ! 1: MULX_R	mulx 	%r7, %r10, %r31
	.word 0xb8d22410  ! 1: UMULcc_I	umulcc 	%r8, 0x0410, %r28
	.word 0xb4da226b  ! 1: SMULcc_I	smulcc 	%r8, 0x026b, %r26
	.word 0xba5123b0  ! 1: UMUL_I	umul 	%r4, 0x03b0, %r29
	.word 0xb8598009  ! 1: SMUL_R	smul 	%r6, %r9, %r28
	.word 0xbe59a983  ! 1: SMUL_I	smul 	%r6, 0x0983, %r31
	.word 0xae51e22a  ! 1: UMUL_I	umul 	%r7, 0x022a, %r23
	.word 0xa4d966c7  ! 1: SMULcc_I	smulcc 	%r5, 0x06c7, %r18
	.word 0xba50e534  ! 1: UMUL_I	umul 	%r3, 0x0534, %r29
	.word 0xa321650f  ! 1: MULScc_I	mulscc 	%r5, 0x050f, %r17
	.word 0xbcd18009  ! 1: UMULcc_R	umulcc 	%r6, %r9, %r30
	.word 0xac50800e  ! 1: UMUL_R	umul 	%r2, %r14, %r22
	.word 0xb048e7ab  ! 1: MULX_I	mulx 	%r3, 0x07ab, %r24
	.word 0xb4d16991  ! 1: UMULcc_I	umulcc 	%r5, 0x0991, %r26
	.word 0xb058ac75  ! 1: SMUL_I	smul 	%r2, 0x0c75, %r24
	.word 0xaed16f5e  ! 1: UMULcc_I	umulcc 	%r5, 0x0f5e, %r23
	.word 0xa7212ce8  ! 1: MULScc_I	mulscc 	%r4, 0x0ce8, %r19
	.word 0xa649800f  ! 1: MULX_R	mulx 	%r6, %r15, %r19
	.word 0xa45a000c  ! 1: SMUL_R	smul 	%r8, %r12, %r18
	.word 0xa120c00f  ! 1: MULScc_R	mulscc 	%r3, %r15, %r16
	.word 0xb050a9a9  ! 1: UMUL_I	umul 	%r2, 0x09a9, %r24
	.word 0xb8d1c00a  ! 1: UMULcc_R	umulcc 	%r7, %r10, %r28
	.word 0xa830ef19  ! 1: ORN_I	orn 	%r3, 0x0f19, %r20
	.word 0xb4c10009  ! 1: ADDCcc_R	addccc 	%r4, %r9, %r26
	.word 0xbc8a209c  ! 1: ANDcc_I	andcc 	%r8, 0x009c, %r30
	.word 0xb81a000e  ! 1: XOR_R	xor 	%r8, %r14, %r28
	.word 0xb802000e  ! 1: ADD_R	add 	%r8, %r14, %r28
	.word 0xbd64180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa9399009  ! 1: SRAX_R	srax	%r6, %r9, %r20
	.word 0xb0b8ae02  ! 1: XNORcc_I	xnorcc 	%r2, 0x0e02, %r24
	.word 0xbac0c00c  ! 1: ADDCcc_R	addccc 	%r3, %r12, %r29
	.word 0xb2c0a4bf  ! 1: ADDCcc_I	addccc 	%r2, 0x04bf, %r25
	.word 0xbc516e92  ! 1: UMUL_I	umul 	%r5, 0x0e92, %r30
	.word 0xa921ab23  ! 1: MULScc_I	mulscc 	%r6, 0x0b23, %r20
	.word 0xbad9000b  ! 1: SMULcc_R	smulcc 	%r4, %r11, %r29
	.word 0xa2d10009  ! 1: UMULcc_R	umulcc 	%r4, %r9, %r17
	.word 0xa848ad2c  ! 1: MULX_I	mulx 	%r2, 0x0d2c, %r20
	.word 0xa248a5d9  ! 1: MULX_I	mulx 	%r2, 0x05d9, %r17
	.word 0xbb21800e  ! 1: MULScc_R	mulscc 	%r6, %r14, %r29
	.word 0xac51800b  ! 1: UMUL_R	umul 	%r6, %r11, %r22
	.word 0xba49c00f  ! 1: MULX_R	mulx 	%r7, %r15, %r29
	.word 0xae50800e  ! 1: UMUL_R	umul 	%r2, %r14, %r23
	.word 0xbcd1800c  ! 1: UMULcc_R	umulcc 	%r6, %r12, %r30
	.word 0xbcd2000b  ! 1: UMULcc_R	umulcc 	%r8, %r11, %r30
	.word 0xbf20e8b5  ! 1: MULScc_I	mulscc 	%r3, 0x08b5, %r31
	.word 0xa920ade9  ! 1: MULScc_I	mulscc 	%r2, 0x0de9, %r20
	.word 0xba50a8b5  ! 1: UMUL_I	umul 	%r2, 0x08b5, %r29
	.word 0xb0d1c00e  ! 1: UMULcc_R	umulcc 	%r7, %r14, %r24
	.word 0xa650a52a  ! 1: UMUL_I	umul 	%r2, 0x052a, %r19
	.word 0xa259c00d  ! 1: SMUL_R	smul 	%r7, %r13, %r17
	.word 0xa851c00b  ! 1: UMUL_R	umul 	%r7, %r11, %r20
	.word 0xa051800a  ! 1: UMUL_R	umul 	%r6, %r10, %r16
	.word 0xb849e314  ! 1: MULX_I	mulx 	%r7, 0x0314, %r28
	.word 0xa7212426  ! 1: MULScc_I	mulscc 	%r4, 0x0426, %r19
	.word 0xa0d0c00e  ! 1: UMULcc_R	umulcc 	%r3, %r14, %r16
	.word 0xbb20c00b  ! 1: MULScc_R	mulscc 	%r3, %r11, %r29
	.word 0xb059400f  ! 1: SMUL_R	smul 	%r5, %r15, %r24
	.word 0xba41000c  ! 1: ADDC_R	addc 	%r4, %r12, %r29
	.word 0xa629000b  ! 1: ANDN_R	andn 	%r4, %r11, %r19
	.word 0xba41e1e4  ! 1: ADDC_I	addc 	%r7, 0x01e4, %r29
	.word 0xa491800a  ! 1: ORcc_R	orcc 	%r6, %r10, %r18
	.word 0xb1641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaea96f04  ! 1: ANDNcc_I	andncc 	%r5, 0x0f04, %r23
	.word 0xb3641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb978040a  ! 1: MOVR_R	move	%r0, %r10, %r28
	.word 0xaa89800a  ! 1: ANDcc_R	andcc 	%r6, %r10, %r21
	.word 0xbcb1ad31  ! 1: ORNcc_I	orncc 	%r6, 0x0d31, %r30
	.word 0xa321800c  ! 1: MULScc_R	mulscc 	%r6, %r12, %r17
	.word 0xae49afe8  ! 1: MULX_I	mulx 	%r6, 0x0fe8, %r23
	.word 0xa920a399  ! 1: MULScc_I	mulscc 	%r2, 0x0399, %r20
	.word 0xaa58c00d  ! 1: SMUL_R	smul 	%r3, %r13, %r21
	.word 0xa859400b  ! 1: SMUL_R	smul 	%r5, %r11, %r20
	.word 0xa2d22a18  ! 1: UMULcc_I	umulcc 	%r8, 0x0a18, %r17
	.word 0xae59400f  ! 1: SMUL_R	smul 	%r5, %r15, %r23
	.word 0xa4d1400b  ! 1: UMULcc_R	umulcc 	%r5, %r11, %r18
	.word 0xbad9a05a  ! 1: SMULcc_I	smulcc 	%r6, 0x005a, %r29
	.word 0xb720a351  ! 1: MULScc_I	mulscc 	%r2, 0x0351, %r27
	.word 0xa2d9400c  ! 1: SMULcc_R	smulcc 	%r5, %r12, %r17
	.word 0xbcd9400a  ! 1: SMULcc_R	smulcc 	%r5, %r10, %r30
	.word 0xb85a2b00  ! 1: SMUL_I	smul 	%r8, 0x0b00, %r28
	.word 0xaad1aff3  ! 1: UMULcc_I	umulcc 	%r6, 0x0ff3, %r21
	.word 0xbc59eea1  ! 1: SMUL_I	smul 	%r7, 0x0ea1, %r30
	.word 0xb0d8800b  ! 1: SMULcc_R	smulcc 	%r2, %r11, %r24
	.word 0xb121aa44  ! 1: MULScc_I	mulscc 	%r6, 0x0a44, %r24
	.word 0xa859e390  ! 1: SMUL_I	smul 	%r7, 0x0390, %r20
	.word 0xaed96342  ! 1: SMULcc_I	smulcc 	%r5, 0x0342, %r23
	.word 0xa849000b  ! 1: MULX_R	mulx 	%r4, %r11, %r20
	.word 0xb249800e  ! 1: MULX_R	mulx 	%r6, %r14, %r25
	.word 0xb4d1a9ae  ! 1: UMULcc_I	umulcc 	%r6, 0x09ae, %r26
	.word 0xa059e384  ! 1: SMUL_I	smul 	%r7, 0x0384, %r16
	.word 0xaad9000b  ! 1: SMULcc_R	smulcc 	%r4, %r11, %r21
	.word 0xbad9a134  ! 1: SMULcc_I	smulcc 	%r6, 0x0134, %r29
	.word 0xaea9e531  ! 1: ANDNcc_I	andncc 	%r7, 0x0531, %r23
	.word 0xb01a2f9d  ! 1: XOR_I	xor 	%r8, 0x0f9d, %r24
	.word 0xb689e51f  ! 1: ANDcc_I	andcc 	%r7, 0x051f, %r27
	.word 0xb881a4ea  ! 1: ADDcc_I	addcc 	%r6, 0x04ea, %r28
	.word 0xbd643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa938e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r20
	.word 0xac09400b  ! 1: AND_R	and 	%r5, %r11, %r22
	.word 0xb480c00b  ! 1: ADDcc_R	addcc 	%r3, %r11, %r26
	.word 0xa93a1009  ! 1: SRAX_R	srax	%r8, %r9, %r20
	.word 0xb039eb0a  ! 1: XNOR_I	xnor 	%r7, 0x0b0a, %r24
	.word 0xb0d16380  ! 1: UMULcc_I	umulcc 	%r5, 0x0380, %r24
	.word 0xb4512e45  ! 1: UMUL_I	umul 	%r4, 0x0e45, %r26
	.word 0xbe58a5d2  ! 1: SMUL_I	smul 	%r2, 0x05d2, %r31
	.word 0xa520800f  ! 1: MULScc_R	mulscc 	%r2, %r15, %r18
	.word 0xba58aab5  ! 1: SMUL_I	smul 	%r2, 0x0ab5, %r29
	.word 0xaada2197  ! 1: SMULcc_I	smulcc 	%r8, 0x0197, %r21
	.word 0xb84a000d  ! 1: MULX_R	mulx 	%r8, %r13, %r28
	.word 0xa721c00f  ! 1: MULScc_R	mulscc 	%r7, %r15, %r19
	.word 0xb120ab13  ! 1: MULScc_I	mulscc 	%r2, 0x0b13, %r24
	.word 0xa449629b  ! 1: MULX_I	mulx 	%r5, 0x029b, %r18
	.word 0xa658e2a7  ! 1: SMUL_I	smul 	%r3, 0x02a7, %r19
	.word 0xb0d9800e  ! 1: SMULcc_R	smulcc 	%r6, %r14, %r24
	.word 0xbad920e5  ! 1: SMULcc_I	smulcc 	%r4, 0x00e5, %r29
	.word 0xba58e0fe  ! 1: SMUL_I	smul 	%r3, 0x00fe, %r29
	.word 0xb8d9c009  ! 1: SMULcc_R	smulcc 	%r7, %r9, %r28
	.word 0xa659400a  ! 1: SMUL_R	smul 	%r5, %r10, %r19
	.word 0xb3216489  ! 1: MULScc_I	mulscc 	%r5, 0x0489, %r25
	.word 0xa2d0800a  ! 1: UMULcc_R	umulcc 	%r2, %r10, %r17
	.word 0xa248ea57  ! 1: MULX_I	mulx 	%r3, 0x0a57, %r17
	.word 0xacd1000f  ! 1: UMULcc_R	umulcc 	%r4, %r15, %r22
	.word 0xa720c00f  ! 1: MULScc_R	mulscc 	%r3, %r15, %r19
	.word 0xba59e696  ! 1: SMUL_I	smul 	%r7, 0x0696, %r29
	.word 0xa522000e  ! 1: MULScc_R	mulscc 	%r8, %r14, %r18
	.word 0xaad0c00b  ! 1: UMULcc_R	umulcc 	%r3, %r11, %r21
	.word 0xb249e4b4  ! 1: MULX_I	mulx 	%r7, 0x04b4, %r25
	.word 0xb411c00e  ! 1: OR_R	or 	%r7, %r14, %r26
	.word 0xab29000b  ! 1: SLL_R	sll 	%r4, %r11, %r21
	.word 0xb531b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r26
	.word 0xbf39e001  ! 1: SRA_I	sra 	%r7, 0x0001, %r31
	.word 0xbea9400d  ! 1: ANDNcc_R	andncc 	%r5, %r13, %r31
	.word 0xaeb1c009  ! 1: ORNcc_R	orncc 	%r7, %r9, %r23
	.word 0xb4b9000a  ! 1: XNORcc_R	xnorcc 	%r4, %r10, %r26
	.word 0xac38c00c  ! 1: XNOR_R	xnor 	%r3, %r12, %r22
	.word 0xb891000d  ! 1: ORcc_R	orcc 	%r4, %r13, %r28
	.word 0xb491400b  ! 1: ORcc_R	orcc 	%r5, %r11, %r26
	.word 0xae59800f  ! 1: SMUL_R	smul 	%r6, %r15, %r23
	.word 0xa0d9eb10  ! 1: SMULcc_I	smulcc 	%r7, 0x0b10, %r16
	.word 0xb259a15a  ! 1: SMUL_I	smul 	%r6, 0x015a, %r25
	.word 0xbc49000d  ! 1: MULX_R	mulx 	%r4, %r13, %r30
	.word 0xbb21400b  ! 1: MULScc_R	mulscc 	%r5, %r11, %r29
	.word 0xaad1000d  ! 1: UMULcc_R	umulcc 	%r4, %r13, %r21
	.word 0xb659c00c  ! 1: SMUL_R	smul 	%r7, %r12, %r27
	.word 0xb8d8a36e  ! 1: SMULcc_I	smulcc 	%r2, 0x036e, %r28
	.word 0xbe50a5f4  ! 1: UMUL_I	umul 	%r2, 0x05f4, %r31
	.word 0xb651400c  ! 1: UMUL_R	umul 	%r5, %r12, %r27
	.word 0xa859400c  ! 1: SMUL_R	smul 	%r5, %r12, %r20
	.word 0xa6d9800b  ! 1: SMULcc_R	smulcc 	%r6, %r11, %r19
	.word 0xaed10009  ! 1: UMULcc_R	umulcc 	%r4, %r9, %r23
	.word 0xacd8a39f  ! 1: SMULcc_I	smulcc 	%r2, 0x039f, %r22
	.word 0xa459800b  ! 1: SMUL_R	smul 	%r6, %r11, %r18
	.word 0xac49c009  ! 1: MULX_R	mulx 	%r7, %r9, %r22
	.word 0xa052000f  ! 1: UMUL_R	umul 	%r8, %r15, %r16
	.word 0xa049c00b  ! 1: MULX_R	mulx 	%r7, %r11, %r16
	.word 0xa659400e  ! 1: SMUL_R	smul 	%r5, %r14, %r19
	.word 0xb8d2000e  ! 1: UMULcc_R	umulcc 	%r8, %r14, %r28
	.word 0xae50c00a  ! 1: UMUL_R	umul 	%r3, %r10, %r23
	.word 0xa8d8a5e8  ! 1: SMULcc_I	smulcc 	%r2, 0x05e8, %r20
	.word 0xb651279d  ! 1: UMUL_I	umul 	%r4, 0x079d, %r27
	.word 0xb0496f0c  ! 1: MULX_I	mulx 	%r5, 0x0f0c, %r24
	.word 0xa721000c  ! 1: MULScc_R	mulscc 	%r4, %r12, %r19
	.word 0xa23129cc  ! 1: ORN_I	orn 	%r4, 0x09cc, %r17
	.word 0xaf312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r23
	.word 0xb018e2df  ! 1: XOR_I	xor 	%r3, 0x02df, %r24
	.word 0xbe39c00b  ! 1: XNOR_R	xnor 	%r7, %r11, %r31
	.word 0xa928e001  ! 1: SLL_I	sll 	%r3, 0x0001, %r20
	.word 0xb764180a  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa764180a  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac3165e5  ! 1: ORN_I	orn 	%r5, 0x05e5, %r22
	.word 0xab39000a  ! 1: SRA_R	sra 	%r4, %r10, %r21
	.word 0xaa8a000e  ! 1: ANDcc_R	andcc 	%r8, %r14, %r21
	.word 0xb4d1800d  ! 1: UMULcc_R	umulcc 	%r6, %r13, %r26
	.word 0xb0d9611d  ! 1: SMULcc_I	smulcc 	%r5, 0x011d, %r24
	.word 0xb721a240  ! 1: MULScc_I	mulscc 	%r6, 0x0240, %r27
	.word 0xba59e47d  ! 1: SMUL_I	smul 	%r7, 0x047d, %r29
	.word 0xaa51400b  ! 1: UMUL_R	umul 	%r5, %r11, %r21
	.word 0xab21000d  ! 1: MULScc_R	mulscc 	%r4, %r13, %r21
	.word 0xba58e213  ! 1: SMUL_I	smul 	%r3, 0x0213, %r29
	.word 0xbcd8a6c6  ! 1: SMULcc_I	smulcc 	%r2, 0x06c6, %r30
	.word 0xa0da000d  ! 1: SMULcc_R	smulcc 	%r8, %r13, %r16
	.word 0xaad8c00c  ! 1: SMULcc_R	smulcc 	%r3, %r12, %r21
	.word 0xbe58a541  ! 1: SMUL_I	smul 	%r2, 0x0541, %r31
	.word 0xa858e8cd  ! 1: SMUL_I	smul 	%r3, 0x08cd, %r20
	.word 0xac51a569  ! 1: UMUL_I	umul 	%r6, 0x0569, %r22
	.word 0xb6d88009  ! 1: SMULcc_R	smulcc 	%r2, %r9, %r27
	.word 0xa450800d  ! 1: UMUL_R	umul 	%r2, %r13, %r18
	.word 0xb451663c  ! 1: UMUL_I	umul 	%r5, 0x063c, %r26
	.word 0xbcd1eb96  ! 1: UMULcc_I	umulcc 	%r7, 0x0b96, %r30
	.word 0xb459000e  ! 1: SMUL_R	smul 	%r4, %r14, %r26
	.word 0xa6d9258d  ! 1: SMULcc_I	smulcc 	%r4, 0x058d, %r19
	.word 0xacd9800a  ! 1: SMULcc_R	smulcc 	%r6, %r10, %r22
	.word 0xa0d0800a  ! 1: UMULcc_R	umulcc 	%r2, %r10, %r16
	.word 0xa852000f  ! 1: UMUL_R	umul 	%r8, %r15, %r20
	.word 0xbe592994  ! 1: SMUL_I	smul 	%r4, 0x0994, %r31
	.word 0xbad0e9aa  ! 1: UMULcc_I	umulcc 	%r3, 0x09aa, %r29
	.word 0xb8496508  ! 1: MULX_I	mulx 	%r5, 0x0508, %r28
	.word 0xbc39000e  ! 1: XNOR_R	xnor 	%r4, %r14, %r30
	.word 0xae312174  ! 1: ORN_I	orn 	%r4, 0x0174, %r23
	.word 0xbe316432  ! 1: ORN_I	orn 	%r5, 0x0432, %r31
	.word 0xa739d00b  ! 1: SRAX_R	srax	%r7, %r11, %r19
	.word 0xb440a034  ! 1: ADDC_I	addc 	%r2, 0x0034, %r26
	.word 0xbd29e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r30
	.word 0xbf31400b  ! 1: SRL_R	srl 	%r5, %r11, %r31
	.word 0xb00928c5  ! 1: AND_I	and 	%r4, 0x08c5, %r24
	.word 0xacaa25ee  ! 1: ANDNcc_I	andncc 	%r8, 0x05ee, %r22
	.word 0xaf292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r23

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
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
	.word  0xfaa6cc25,0x96a00cf5,0x1fa716ce,0x1acce49c
	.word  0x14a7b4de,0x954cf8cd,0xb0dbc2d0,0x2ae4bd9a
	.word  0x150ed0a3,0x6d07def8,0xf065a109,0xe452b1e9
	.word  0x0fd1ce99,0xd6f869a4,0x6a8cabe5,0x3e0b2c76
	.word  0x7d95871b,0x4840bf1d,0xf8c3b02e,0x8ff88436
	.word  0x697b8a37,0xd9cbe81f,0xa934063f,0x45c74ad9
	.word  0x64be7d68,0xca1d8ec3,0x8a49af93,0x5e1e5030
	.word  0x803a2a47,0xd93fbdc2,0x09c7c234,0xbb973593
	.word  0x70dbd1e8,0xce6cb88d,0x16909e24,0xe97692ef
	.word  0xd5255dd1,0x1da1ac83,0xbd865da8,0xaa9a13e0
	.word  0xbd368060,0x5b04b865,0x79416886,0xc2221389
	.word  0xa8b69f4c,0xaaeb33d2,0x1abf393b,0xa0c3f0b1
	.word  0x9fb88f05,0xe194ae28,0xffcb13c2,0x9e9b1cbd
	.word  0x06e6acba,0xbb783193,0xe3dd2feb,0x4fbe312a
	.word  0x0e42f167,0x3f410778,0xa03aef1e,0xe59a7ec0
	.word  0x0e465bec,0xeb4ae39e,0xb16659bb,0x6a2c9787
	.word  0x7cdc91e2,0x35d6f7c9,0xcb3c8cfb,0x2afc5945
	.word  0xea7bc108,0xd7396abb,0xcf795fb8,0xf983933d
	.word  0x696704dc,0x66eabea6,0x05a5837b,0xde407bab
	.word  0x70a1489f,0x5e06fb53,0xf7bc2f31,0x0feeab5a
	.word  0x51d15724,0x891ffaa8,0x22ae307b,0xb3681a4a
	.word  0x0c27a35a,0xc0fe594c,0xa9715090,0xea53027d
	.word  0x7d0d8233,0xcb0c77b7,0x94a006b0,0x9bc5ed79
	.word  0xac831903,0xfb4478de,0x4ea66050,0x2ed861e5
	.word  0x9c3434a8,0x32585024,0x2c21df15,0xa2395d2a
	.word  0x1e6deb4c,0xa52957e0,0x745689c6,0x44dbd06d
	.word  0x0032c089,0x25a9b049,0x12def170,0x2616ce43
	.word  0x2d0d1016,0x3ae1a8d2,0x0a0188d3,0x495c4c82
	.word  0x4164059f,0x35f73091,0xadb27f5b,0xe84f3fc6
	.word  0xdf63c42b,0x70e37e17,0x526d5f7f,0x3beb7153
	.word  0x57fab08c,0x6a3cd632,0xb264a057,0x1ee7fd40
	.word  0xe6e4486e,0x39ee6767,0xc2b96caa,0xeae46bfd
	.word  0x73b5041c,0x7148eb2b,0x1e50eb13,0x6376ecce
	.word  0x80643669,0xa402d5b5,0x043b07fe,0x12740984
	.word  0x70ef5495,0xa9e51d95,0xa94ee2b1,0x7e063960
	.word  0xcf2bbdd0,0x5fa69f91,0xccd95aff,0x8762ff7d
	.word  0x5dc491ef,0x2f56414f,0x0392634a,0xa45c53c2
	.word  0x43bba73c,0x615567ad,0xbde973de,0xb0527369
	.word  0x9a567f8a,0xcb06cc76,0xf7bca1c4,0xf90d8fe9
	.word  0xa807480b,0x32bba2fe,0x4e75b627,0xcbfc897d
	.word  0xd5c4b786,0xe55c2873,0xaefc1e18,0x784f19b6
	.word  0x6eaf7dd9,0xba793209,0x686a5077,0xb7515f13
	.word  0x9dd92cc1,0x41ec6efa,0x32285cd9,0x4d253272
	.word  0x02cf0fe6,0xd7abd38c,0xaf5d7786,0xe4683ae9
	.word  0x3d70d861,0xca8761cb,0x47e98c76,0xc758032e
	.word  0xcca29b90,0x81509a01,0x4895e9b2,0x1744712c
	.word  0x68d6e9ee,0x5b3da541,0xffe6b909,0xce32fa37
	.word  0x3f87fd3d,0xba29b7d2,0xbf42957c,0x41dff95e
	.word  0x416ed26c,0x71ac8b05,0xb86de5c6,0x6cd0a1da
	.word  0x2cf3e073,0xf186593c,0x73b8f674,0x26caf551
	.word  0x85b93524,0x1ea7fe69,0xfb6f3896,0xb0d91843
	.word  0xc020e9d9,0x72614749,0x95ec7142,0x347fd6f4
	.word  0xe1a5b104,0xc74bfa0d,0x68db62bc,0xaf85f858
	.word  0x1e702eb8,0x908140bb,0x8a121ed3,0x731276fe
	.word  0xafa8123c,0xcca44d70,0x646733d3,0x94882bdc
	.word  0x7d3782b5,0xc7c67f59,0x587b9b94,0x4e7df84e
	.word  0xb8df3b19,0xb19c4e8e,0x85634ea2,0x81cc8973
	.word  0x3c0f2fde,0x39410adf,0x40b3c2a4,0xddbafafd
	.word  0xa382517e,0x6b1940f1,0xa03a8447,0x89f103e5
	.word  0x9026bb1f,0xe14b4a92,0xfecd51c6,0x3c9a8a44
	.word  0x892af7e5,0xed25d2e1,0xc7c5f9da,0x7e1ede11
	.word  0x5fc03200,0x17dccb2b,0xb064819c,0x52c73ad4
	.word  0xd7feda0a,0xa95387f2,0x0cbeb7d6,0x6f1c37ea
	.word  0x721d61bc,0x6ad1ab4b,0xfec7a7a4,0x93c6cede
	.word  0x5f82c591,0x453e275c,0x427fe61d,0xf58523db
	.word  0x46872c0a,0xc4fb6711,0x9ae1c087,0x28fccb84
	.word  0xe69fd041,0x489d07b9,0xd6feb934,0x8d96830b
	.word  0xf645f7cb,0xee8816bf,0x1991b320,0x3e97745e
	.word  0xa1a718fc,0xf36de30a,0x893706d6,0xbbd79a98
	.word  0x045ab17c,0x35a8be1b,0x4e387d31,0x38941da9
	.word  0x1e27670c,0x6925aafa,0xf0d66d52,0xbebe0c69
	.word  0xcfd40499,0x35cc0051,0xba3112a2,0xf75e627b
	.word  0x45c5205e,0x69db4636,0x2305d577,0x4d3daff1
	.word  0x689c63b2,0x9bf325cb,0x29ab6ff2,0x8785909a
	.word  0x26f5ec89,0x35637996,0x7a07d2d3,0x2e77c1d0
	.word  0x86e8519d,0x5bc400ee,0x785129c5,0x0e9ea0aa
	.word  0x391eb836,0x55bcbe52,0x9a8bb6ca,0xb4a8207f
	.word  0xf0e8eeb6,0x484dfc00,0x65315028,0x77be2866
	.word  0x821269a6,0x47f0afc8,0x19ac840c,0xceb1849f
	.word  0x7448830b,0x6780e275,0x0bfa5b32,0x0b6e7dd3
	.word  0x39a29d32,0x317c5f9f,0xb451e2c7,0x5a1fe1d1
	.word  0xadf95e6a,0x5b479495,0x3f52218f,0x1b802825
	.word  0x251eef2f,0x586106dc,0x9419d707,0xa71ac021
	.word  0x6acb0e6b,0x042331e5,0x8ca27c66,0x70122fe9
	.word  0x472e696e,0x9ca35b63,0x493f4a45,0x93ff187c
	.word  0xd8d02903,0x105ce277,0xa128d026,0xc145ac45
	.word  0x3b96624f,0x4de3e2e3,0xb0bc6e90,0x32889d34
	.word  0x74f51ae1,0x69262e2b,0x9854a960,0xd79f8658
	.word  0x90e53d2a,0x38f3e93f,0x88dbb723,0xf95e7d89
	.word  0xab4daefc,0x777dd7bc,0x44e3ee66,0x7a884d64
	.word  0xc67df880,0x7f8dadf3,0x18eb79d8,0x540c40dc
	.word  0xa3a3636c,0xd450fe89,0xe3d0a965,0x2062bdf1
	.word  0xc4c44b82,0x7d2128e4,0x9b401d5c,0x84a81e37
	.word  0x6228234c,0x8971088d,0x97cd7ba6,0xf721bc58
	.word  0xf3bfa874,0xe93d3099,0x2e861c58,0x1fab6b51
	.word  0x33c337d1,0x6df62ace,0xce215c3e,0x862f821d
	.word  0x66d6a4de,0xb0ed19c0,0x617b9406,0x8dff1cd8
	.word  0x69dad4e9,0xdce09ab1,0x6ffe7fa4,0xe7a3c42e
	.word  0xf77e6f7a,0x52955510,0xf48ed808,0x528af694
	.word  0xae009859,0x5556649c,0x75c01f2a,0x69b8dcd8
	.word  0x92960a26,0x0068db76,0x4314ebd7,0xe5529a5a
	.word  0xbd9a19de,0x83d3239e,0x0630c1fa,0xdf31dc25
	.word  0x443a8acb,0xf599e8ee,0xb7d522a6,0x1e4091f9
	.word  0xe9d79536,0xdd519b0d,0x210f604c,0x33e20ec0
	.word  0x81fed36d,0xb2480d0c,0xb111daab,0x2fcfa23b
	.word  0xe85c1fdc,0x0f38a24b,0xa9cfd98f,0xa1f1f428
	.word  0x7362cda4,0xde5f29e4,0x166e3a04,0x2139dfaf
	.word  0x96a7289d,0x0b7d472b,0x918f0502,0x46a80bff
	.word  0x10dc43de,0x943f1e94,0x16dcc10e,0xae2bb464
	.word  0x145571e3,0x28016e05,0xa6282e95,0xf5984c2b
	.word  0x92ff1d84,0x8a2f8864,0x46281873,0x3688e895
	.word  0x86821126,0x1af43290,0x469fdb77,0xbf45f115
	.word  0x29779c2f,0x691f1597,0xdfab71ee,0xf735ee8d
	.word  0x7f8963ff,0x16603996,0xb482b494,0x9b4b6e60
	.word  0x01748415,0xde953b78,0xbd9a5b0e,0xa87ab6c3
	.word  0xf29fac3b,0xb1c9173e,0x3f98c544,0xef98feab
	.word  0x90e081d3,0x34faa00e,0x50d4f4ac,0x5216a923
	.word  0x1dba0e24,0x98c0a45a,0xc1f63b4d,0x8ae42c9e
	.word  0x36d8e0ac,0x4c775b1b,0x325281fd,0xeac0c206
	.word  0x9a500edb,0x4765b36c,0x11d755e2,0x0ad2d82d
	.word  0xe49b8114,0xa7acfc81,0xca41df4c,0xe36683a5
	.word  0xa0d9ef79,0x2a44b40d,0xb6007661,0x5226a00e
	.word  0xe36eaa62,0x7a969c0a,0xcfc86e96,0x113da20b
	.word  0xd62ac601,0xfba68b3d,0x1d545b9b,0x9557b5ff
	.word  0x59828025,0x73d7c945,0x21c63296,0xadcce315
	.word  0xabf45ea6,0x4665f61a,0x177bbe00,0x4d1c3b07
	.word  0x0a53a686,0x0eac8d5c,0x80fe2ec1,0xb7f9233f
	.word  0xc8b6d79b,0x97308d96,0xfb93c33c,0xbff60193
	.word  0xc849bd8b,0x1e04e77e,0x5f981ea6,0x76d3bc66
	.word  0x6415c946,0xae182f20,0xe572191b,0xac666dac
	.word  0xd7fe645b,0xa68b9545,0x98dedc54,0x74767fb1
	.word  0xa8f98fd2,0xaaa4b1a5,0x71cfaebc,0xcf7d32dd
	.word  0x13a66912,0xe6920e16,0x3e98de48,0xca349fd3
	.word  0xb5bd7363,0x1fb80d18,0x38752f32,0x1cb387ce
	.word  0x9ce0ebab,0xa98a3c14,0xb0a64791,0x49a9d8e0
	.word  0x887d006a,0x55e13dc5,0xdcae68ed,0x30981581
	.word  0x11d52779,0x14ff5a60,0xda0de9ba,0x939e4168
	.word  0x4390338e,0x02e61360,0xe89231a1,0x138b86e0
	.word  0x0df583cb,0x22b478c8,0xb1191362,0x72d219ef
	.word  0xb95c2ae6,0x556c820f,0xf629cffc,0x61b5eb75
	.word  0xa40dad22,0xfc69a6ae,0x9f277d98,0x556a18c6
	.word  0xb9743cdb,0x314b66bf,0x21533897,0xf734d283
	.word  0x20f25c3a,0x974b36b0,0xfcde9769,0x601a995e
	.word  0xd63d3759,0x65cfa977,0xe52a31ae,0xd2121f98
	.word  0xe185efc2,0xb8adae37,0x1e3a37ab,0x50586f01
	.word  0xf95692ea,0x45e92955,0x04c638c2,0xed9435f6
	.word  0x24b71636,0x3758bc4f,0x6c893ce4,0x608d90e9
	.word  0xd53eae6d,0x0f5a709b,0xffaf4791,0x6d981568
	.word  0xbd6563ae,0xd87744b3,0xc6d554c9,0x19676bd4
	.word  0x96a61241,0x57ec1d7f,0xd15bf4d4,0xb9fd3ce5
	.word  0xa936c3f3,0xc8457ff4,0x709244c8,0x932debd7
	.word  0x7c279daf,0x9a064f6b,0x96aa6cdd,0x489a3fcf
	.word  0xd6b2ac6f,0x45eeda54,0x3aa37460,0x32a13a46
	.word  0x39333a5a,0xc0f695d0,0xe596cd2a,0x3ba12ee6
	.word  0x0c061c21,0xbf3e9ecb,0x3b16850b,0x6e51a5b3
	.word  0xffbd3196,0x344c4170,0xe5235385,0xf96ffb8e
	.word  0x90b599b5,0x5cdb3fe6,0xdcd1d010,0x210cf5d3
	.word  0x3579de48,0x7dd13828,0x19f58d3b,0xbadae5d6
	.word  0x790a4567,0xcb1f4592,0x7f62e5a8,0x35e1918e
	.word  0x9dff6f49,0x50499efb,0x92b7fea7,0xed5cf005
	.word  0x67d24445,0x5e2120fd,0xc95e4f9c,0xdef6bf86
	.word  0xc9103b6c,0xd30b1cbe,0x83268c99,0xd7abaa16
	.word  0xd59112f1,0x11acb670,0x970ead9b,0x383fad6c
	.word  0xf756d3d4,0x4b4e0290,0x51b7928a,0x71dba597
	.word  0xe4825b9b,0xda837af9,0xdacc07b1,0x876e32c3
	.word  0x2a29aa95,0xd7429a72,0x8ddc9f4d,0xda3370ce
	.word  0x65d6bd26,0xfa7129cd,0xd95ccc6a,0x854dee6d
	.word  0xb6b87b77,0x0a71a771,0x25f53192,0x75a60abd
	.word  0x15eb7420,0x639dba6b,0xb0138d8f,0x9c0f1c5a
	.word  0x2d14c966,0x986b20b2,0x056dd6e7,0xea39e485
	.word  0x217514bc,0x71e0a313,0x8a654739,0x799466d6
	.word  0x34ad5959,0x80fe37e4,0x1b1a0731,0xb995dfc0
	.word  0xbe51df46,0xbee071d1,0x6483712e,0x5cadd06d
	.word  0x59c86964,0x118ae23e,0x0a6e9883,0x5c46d3c0
	.word  0xeb5dc752,0x9d8df1e3,0xa1ef068a,0xa6c07bee
	.word  0x134ab37a,0xfff1a1de,0x1e591616,0x9ebb530e
	.word  0x733d85f8,0x1e6f07eb,0xf4d784dd,0xf359d8d7
	.word  0x2d7b75e9,0x44126269,0xc717067c,0x5b7e7033
	.word  0xf5ba6ae1,0x084192f2,0xe79674c5,0x0060a069
	.word  0xe46250a1,0xee11b136,0x7c27e210,0xd6f88664
	.word  0x77746f0a,0xe6414a49,0x8ae269b1,0xf688c14e
	.word  0xfcfc5c2d,0xfc9c5c88,0xe0744c05,0xada014ad
	.word  0x8de38d71,0xdfc7ab64,0x2b9ae426,0x7cc8951b
	.word  0x8e1a93c2,0x1e5c5812,0x139cb336,0x0f25307c
	.word  0x63f3b442,0xdc24533d,0x3e44a3f6,0xedab4c78
	.word  0x20424259,0xdb199cf9,0x636d4fba,0x459504f7
	.word  0x604bc25a,0xfc8288ae,0x85d95388,0x9e2e807d
	.word  0xe6610447,0xd84e817c,0xb79dedec,0xafe7019f
	.word  0xf126497d,0xb8918d3b,0x0ea95c8c,0x11320fc7
	.word  0xb61b2b72,0x3a5ed0e8,0xc838e163,0x0058df13
	.word  0xed9402e5,0x1d654777,0xb104a0a3,0x115773d9
	.word  0x5a5ce18d,0x4cfef518,0x7b10c771,0x901324db
	.word  0x79c4cac6,0x48ed098e,0x272ddf8d,0x45f545c8
	.word  0x07bcffdd,0x2274108b,0xcb38515a,0xf79e9a49
	.word  0xa83df0b5,0xd2dae02c,0x3a30e8ca,0xf0d61406
	.word  0xd603352e,0x2040c08a,0x4eb95c9a,0x5be2ad49
	.word  0xa9352247,0x222d8e4f,0xc92e9b18,0x99ea19ae
	.word  0xaf7be618,0x3c9c8196,0x4334ae6f,0xaab71ea0
	.word  0x3729e73a,0x02869852,0x6591e903,0x96465065
	.word  0xb4d421b6,0x559b6b2e,0x0497faa6,0xf1f646ec
	.word  0x2f8f2709,0xc56e40ef,0x90f88df5,0x65d9480a
	.word  0xcaa38627,0xa770f98b,0xe621681e,0x7131cf5a
	.word  0x7279982e,0x7473edb6,0xfb9b1ce4,0xf809c729
	.word  0xf7165f92,0x71b423c7,0x0d8d5506,0xe332644d
	.word  0xd8e205f3,0x0c3c25d7,0x60be6450,0x493cf785
	.word  0xc8e5cf94,0x0922b0dd,0x351f2cca,0x74f02863
	.word  0xe7bed019,0x0c8fd507,0x3812530c,0x4130e38d
	.word  0x10aab4ce,0x644706a0,0xc2a91d30,0xb8e7e408
	.word  0xa56fe9b2,0x6cec42ed,0xd3365573,0xdfba104e
	.word  0xbc87e991,0x774a911d,0x58b5b308,0xc64645b4
	.word  0x7e59ec86,0x80763610,0xffd88182,0x9b23e1dd
	.word  0xd4b8e015,0x918d531d,0x71f8e72b,0xf56be5bf
	.word  0xd9c56eea,0x1f7d64a6,0xef3628e1,0x93b240a8
	.word  0xe3b0324c,0xb9a7a409,0x2ebf94d3,0x365a94bc
	.word  0xc11e7231,0xec636d28,0x1d6141c2,0xff8c0e5e
	.word  0xf9a71f82,0x4a4eeb59,0x9abad876,0x67c73bc1
	.word  0x9900cca6,0xdee6046a,0xccdbf401,0x6db22315
	.word  0xcc6e6208,0x2328daee,0x7e9677e9,0x721fa4b1
	.word  0xb41fd7c8,0xf32d7d00,0x34668f8f,0x0b668a76
	.word  0x31c4a597,0x3c0b39b3,0xe68c3689,0x3f691a6d
	.word  0x5c256549,0x280619e7,0xb58b71ae,0x9501dfc6
	.word  0x9647aba8,0x3d86b4c2,0xed6a813a,0x1fb5a6bf
	.word  0xe48c13f0,0x043bec4d,0x1de43697,0xfd1d7013
	.word  0x9dca4e47,0x79b431c7,0xe07a5f6a,0xb0fbbde3
	.word  0x0de5cffc,0xc0253350,0xb759cd45,0xca1ccfd9
	.word  0xf392534c,0xe9cc1e78,0x5cde6a3a,0xb41ad504
	.word  0x5c6f57c3,0x59e7d106,0x1495cdb6,0x9369e70f
	.word  0xb68350d4,0x1908bea8,0xe93e3812,0x012c2aac
	.word  0x0f4bc96c,0x40fbea43,0x290d5e4e,0x755a6fed
	.word  0x075c4e51,0xdbe2e01c,0xd411cceb,0xd0081d5b
	.word  0x8ed4493f,0x14dd963a,0x10cdf6ec,0x132d352a
	.word  0x95a410a8,0x37bda4c7,0xa08379cc,0xf4e35715
	.word  0x6ddb138e,0x3f2b4382,0xac8cc6a4,0x91940b57
	.word  0x4efa59da,0x14329d80,0x9c1540c1,0x2438ebe3
	.word  0xd25aaf8d,0xba4339c1,0x783e4382,0x74a14b66
	.word  0xb35f211c,0x5e232b67,0xd5c53f37,0x83d2f7c1
	.word  0xafa42638,0x6b4c0571,0x97820f90,0xc1c7462f
	.word  0x0cc234a6,0x039a62a1,0x84c382cf,0x0f7ba9ad
	.word  0x2c8a1be5,0xe9fa0d9a,0xf0c35760,0xe1b8d61e
	.word  0x29d67271,0xa8d2a705,0xf64b744e,0xb6fe918d
	.word  0xb26b1502,0x9535f8bf,0x3af49658,0x2fee1eb0
	.word  0xd270e37e,0x167bc228,0xdf332c5d,0xf09b69a2
	.word  0x50e76d46,0xcca547b5,0xa98efb50,0xceb49edf
	.word  0xf433fe80,0x1e243eb4,0x13aaa607,0x2b3ddf57
	.word  0x5b03804b,0x1bd38567,0x8f01ad5e,0x5498acc5
	.word  0xd7c39b2e,0xe323a206,0xbf32fb7f,0x80012c67
	.word  0x2a07a634,0xb78b7a02,0x02c03456,0xf6cc0481
	.word  0xb7ce3b74,0x34f1339b,0x6094b0c5,0xb0268113
	.word  0x2e1ca44f,0x1f3054e5,0x1c4dbbdd,0xde194cf8
	.word  0x18976a85,0xf0880c26,0x1bb5a89c,0x54719783
	.word  0x123729ea,0xdf78325e,0x7309e487,0x29e41979
	.word  0x2d282059,0xc029191e,0xa38e4b26,0x7939832c
	.word  0xafacaf2a,0xf211f647,0xb44c9c11,0x38f88177
	.word  0xf3d45519,0x54b50bd1,0x56653ad1,0x8a5840dd
	.word  0xd162424e,0xfb097d38,0x55d1cca3,0x6653f37a
	.word  0xf0a4cb83,0x497e1fa9,0xda90354a,0x51ecb6ab



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
!!#   IJ_bind_thread_group("diag.j", 79, th_mul, 0x1);
!!#   IJ_bind_thread_group("diag.j", 80, th_evnt, 0x2);
!!#   IJ_bind_thread_group("diag.j", 81, th_all,0x3);
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
!!# diag: muls inst_block
!!# ;
!!# 
!!# muls: mMETA60
!!# 
!!#            {
!!#               i = 0;
!!# 	      while (i < 10) {
!!#  	         IJ_generate_from_token ("diag.j", 163,25, th_mul, ijdefault, tMULX_R, tMULX_I,
!!#                                          tUMUL_R, tUMUL_I, tSMUL_R, tSMUL_I, tUMULcc_R, 
!!#      			  	         tUMULcc_I, tSMULcc_R, tSMULcc_I, tMULScc_R, tMULScc_I, -1);;
!!#  	         IJ_generate_from_token ("diag.j", 164,10, th_mul, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, -1);;             
!!#                  i++;
!!#               }
!!#            }
!!# 
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
!!#            | resum_intr 
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

