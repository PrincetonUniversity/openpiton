// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3773.s
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
   random seed:	423919677
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
	setx  0xe98759183d5261f3, %r16, %r16
	setx  0x0cb63534e36ec321, %r16, %r17
	setx  0x9958ccd86a4e9565, %r16, %r18
	setx  0xd0d930dcce5f81d8, %r16, %r19
	setx  0x90431a39d1730c37, %r16, %r20
	setx  0x66658e2f212b940a, %r16, %r21
	setx  0x373f822a9146255c, %r16, %r22
	setx  0x0016077ae5e10096, %r16, %r23
	setx  0x8e53e6f511d9d99e, %r16, %r24
	setx  0x191dbe1325fa9904, %r16, %r25
	setx  0x9dd672c393ce12b1, %r16, %r26
	setx  0x09fee5cb179fd770, %r16, %r27
	setx  0x4bdaa5793a3f25b7, %r16, %r28
	setx  0x69d78fb29ee69024, %r16, %r29
	setx  0x62bb3334b7fb23f2, %r16, %r30
	setx  0x3b689d12f621e708, %r16, %r31
	setx  0x0000000000000070, %r16, %r9
	setx  0x0000000000000560, %r16, %r10
	setx  0x0000000000000230, %r16, %r11
	setx  0x0000000000000240, %r16, %r12
	setx  0x00000000000004d0, %r16, %r13
	setx  0x0000000000000f50, %r16, %r14
	setx  0x0000000000000ba0, %r16, %r15
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
	.word 0xb138d009  ! 1: SRAX_R	srax	%r3, %r9, %r24
	.word 0xad30d00d  ! 1: SRLX_R	srlx	%r3, %r13, %r22
	.word 0xaab16648  ! 1: ORNcc_I	orncc 	%r5, 0x0648, %r21
	.word 0xac192005  ! 1: XOR_I	xor 	%r4, 0x0005, %r22
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0096a5f  ! 1: AND_I	and 	%r5, 0x0a5f, %r24
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa629400a  ! 1: ANDN_R	andn 	%r5, %r10, %r19
	.word 0xb2b1ad1d  ! 1: ORNcc_I	orncc 	%r6, 0x0d1d, %r25
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa02923cc  ! 1: ANDN_I	andn 	%r4, 0x03cc, %r16
	.word 0xa332100e  ! 1: SRLX_R	srlx	%r8, %r14, %r17
	.word 0xa889000a  ! 1: ANDcc_R	andcc 	%r4, %r10, %r20
	.word 0xac10800e  ! 1: OR_R	or 	%r2, %r14, %r22
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaaa9e686  ! 1: ANDNcc_I	andncc 	%r7, 0x0686, %r21
	.word 0xa138c00e  ! 1: SRA_R	sra 	%r3, %r14, %r16
	.word 0xba99a0c9  ! 1: XORcc_I	xorcc 	%r6, 0x00c9, %r29
	.word 0xa281af87  ! 1: ADDcc_I	addcc 	%r6, 0x0f87, %r17
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacb0c00e  ! 1: ORNcc_R	orncc 	%r3, %r14, %r22
	.word 0xbd39c00f  ! 1: SRA_R	sra 	%r7, %r15, %r30
	.word 0xbe89e68d  ! 1: ANDcc_I	andcc 	%r7, 0x068d, %r31
	.word 0xa682000a  ! 1: ADDcc_R	addcc 	%r8, %r10, %r19
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad28d00c  ! 1: SLLX_R	sllx	%r3, %r12, %r22
	.word 0xba116721  ! 1: OR_I	or 	%r5, 0x0721, %r29
	.word 0xb739c00d  ! 1: SRA_R	sra 	%r7, %r13, %r27
	.word 0xa1643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab28d00d  ! 1: SLLX_R	sllx	%r3, %r13, %r21
	.word 0xa299400a  ! 1: XORcc_R	xorcc 	%r5, %r10, %r17
	.word 0xb132000d  ! 1: SRL_R	srl 	%r8, %r13, %r24
	.word 0xa2012ac2  ! 1: ADD_I	add 	%r4, 0x0ac2, %r17
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4822a5b  ! 1: ADDcc_I	addcc 	%r8, 0x0a5b, %r18
	.word 0xa729f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r19
	.word 0xb240ea38  ! 1: ADDC_I	addc 	%r3, 0x0a38, %r25
	.word 0xa7320009  ! 1: SRL_R	srl 	%r8, %r9, %r19
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa39e3f3  ! 1: XNOR_I	xnor 	%r7, 0x03f3, %r21
	.word 0xa62a2a4d  ! 1: ANDN_I	andn 	%r8, 0x0a4d, %r19
	.word 0xbf782401  ! 1: MOVR_I	move	%r0, 0xfffffe4d, %r31
	.word 0xa840ada2  ! 1: ADDC_I	addc 	%r2, 0x0da2, %r20
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa138a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r16
	.word 0xaa41400d  ! 1: ADDC_R	addc 	%r5, %r13, %r21
	.word 0xa4b8a9a8  ! 1: XNORcc_I	xnorcc 	%r2, 0x09a8, %r18
	.word 0xae292346  ! 1: ANDN_I	andn 	%r4, 0x0346, %r23
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb080e013  ! 1: ADDcc_I	addcc 	%r3, 0x0013, %r24
	.word 0xa6a9c009  ! 1: ANDNcc_R	andncc 	%r7, %r9, %r19
	.word 0xa7780409  ! 1: MOVR_R	move	%r0, %r9, %r19
	.word 0xbe41400d  ! 1: ADDC_R	addc 	%r5, %r13, %r31
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb689a40d  ! 1: ANDcc_I	andcc 	%r6, 0x040d, %r27
	.word 0xbe00800b  ! 1: ADD_R	add 	%r2, %r11, %r31
	.word 0xb8a9c00a  ! 1: ANDNcc_R	andncc 	%r7, %r10, %r28
	.word 0xab31d00f  ! 1: SRLX_R	srlx	%r7, %r15, %r21
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd32000a  ! 1: SRL_R	srl 	%r8, %r10, %r30
	.word 0xbf322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r31
	.word 0xa092000e  ! 1: ORcc_R	orcc 	%r8, %r14, %r16
	.word 0xa801ebcf  ! 1: ADD_I	add 	%r7, 0x0bcf, %r20
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf3a100d  ! 1: SRAX_R	srax	%r8, %r13, %r31
	.word 0xbd39500d  ! 1: SRAX_R	srax	%r5, %r13, %r30
	.word 0xb4196448  ! 1: XOR_I	xor 	%r5, 0x0448, %r26
	.word 0xa0922e24  ! 1: ORcc_I	orcc 	%r8, 0x0e24, %r16
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb4292ae4  ! 1: ANDN_I	andn 	%r4, 0x0ae4, %r26
	.word 0xbe09e42b  ! 1: AND_I	and 	%r7, 0x042b, %r31
	.word 0xa628a8c0  ! 1: ANDN_I	andn 	%r2, 0x08c0, %r19
	.word 0xb009ea08  ! 1: AND_I	and 	%r7, 0x0a08, %r24
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb5641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb339800c  ! 1: SRA_R	sra 	%r6, %r12, %r25
	.word 0xae09a6b0  ! 1: AND_I	and 	%r6, 0x06b0, %r23
	.word 0xb6c1ec6d  ! 1: ADDCcc_I	addccc 	%r7, 0x0c6d, %r27
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd29000a  ! 1: SLL_R	sll 	%r4, %r10, %r30
	.word 0xa7297001  ! 1: SLLX_I	sllx	%r5, 0x0001, %r19
	.word 0xa690a2c5  ! 1: ORcc_I	orcc 	%r2, 0x02c5, %r19
	.word 0xbc81800a  ! 1: ADDcc_R	addcc 	%r6, %r10, %r30
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb8c1231a  ! 1: ADDCcc_I	addccc 	%r4, 0x031a, %r28
	.word 0xb6416b52  ! 1: ADDC_I	addc 	%r5, 0x0b52, %r27
	.word 0xb2988009  ! 1: XORcc_R	xorcc 	%r2, %r9, %r25
	.word 0xb578040e  ! 1: MOVR_R	move	%r0, %r14, %r26
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa091000d  ! 1: ORcc_R	orcc 	%r4, %r13, %r16
	.word 0xa2812c20  ! 1: ADDcc_I	addcc 	%r4, 0x0c20, %r17
	.word 0xb9323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xacc1400e  ! 1: ADDCcc_R	addccc 	%r5, %r14, %r22
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2a9400b  ! 1: ANDNcc_R	andncc 	%r5, %r11, %r17
	.word 0xb329f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r25
	.word 0xa209800e  ! 1: AND_R	and 	%r6, %r14, %r17
	.word 0xab31900a  ! 1: SRLX_R	srlx	%r6, %r10, %r21
thr3_resum_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa232252c  ! 1: ORN_I	orn 	%r8, 0x052c, %r17
	.word 0xbab1a474  ! 1: ORNcc_I	orncc 	%r6, 0x0474, %r29
	.word 0xa138e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r16
	.word 0xbaa9c00a  ! 1: ANDNcc_R	andncc 	%r7, %r10, %r29
thr3_resum_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb038a36b  ! 1: XNOR_I	xnor 	%r2, 0x036b, %r24
	.word 0xaf31f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r23
	.word 0xb200c00c  ! 1: ADD_R	add 	%r3, %r12, %r25
	.word 0xa0ba24e3  ! 1: XNORcc_I	xnorcc 	%r8, 0x04e3, %r16
thr3_resum_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa9312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r20
	.word 0xa219c00f  ! 1: XOR_R	xor 	%r7, %r15, %r17
	.word 0xa401800a  ! 1: ADD_R	add 	%r6, %r10, %r18
	.word 0xb690800f  ! 1: ORcc_R	orcc 	%r2, %r15, %r27
thr3_resum_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_23), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_23)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2b1ad8c  ! 1: ORNcc_I	orncc 	%r6, 0x0d8c, %r17
	.word 0xa9323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0xb482000a  ! 1: ADDcc_R	addcc 	%r8, %r10, %r26
	.word 0xa610800e  ! 1: OR_R	or 	%r2, %r14, %r19
thr3_resum_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_24), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_24)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad32000d  ! 1: SRL_R	srl 	%r8, %r13, %r22
	.word 0xb819400c  ! 1: XOR_R	xor 	%r5, %r12, %r28
	.word 0xa01a000e  ! 1: XOR_R	xor 	%r8, %r14, %r16
	.word 0xa531b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r18
thr3_resum_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb402000c  ! 1: ADD_R	add 	%r8, %r12, %r26
	.word 0xaf3a000f  ! 1: SRA_R	sra 	%r8, %r15, %r23
	.word 0xa764180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xaac1800b  ! 1: ADDCcc_R	addccc 	%r6, %r11, %r21
thr3_resum_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacb8ea69  ! 1: XNORcc_I	xnorcc 	%r3, 0x0a69, %r22
	.word 0xaf29d009  ! 1: SLLX_R	sllx	%r7, %r9, %r23
	.word 0xb21a247e  ! 1: XOR_I	xor 	%r8, 0x047e, %r25
	.word 0xac0a2a01  ! 1: AND_I	and 	%r8, 0x0a01, %r22
thr3_resum_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_27), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_27)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab782401  ! 1: MOVR_I	move	%r0, 0xfffffe01, %r21
	.word 0xbcaa2f38  ! 1: ANDNcc_I	andncc 	%r8, 0x0f38, %r30
	.word 0xa0b9a6a9  ! 1: XNORcc_I	xnorcc 	%r6, 0x06a9, %r16
	.word 0xa2c0e154  ! 1: ADDCcc_I	addccc 	%r3, 0x0154, %r17
thr3_resum_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa6a9a3fc  ! 1: ANDNcc_I	andncc 	%r6, 0x03fc, %r19
	.word 0xb529d00f  ! 1: SLLX_R	sllx	%r7, %r15, %r26
	.word 0xbb317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r29
	.word 0xbe31000e  ! 1: ORN_R	orn 	%r4, %r14, %r31
thr3_resum_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb164180e  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb6b8c00d  ! 1: XNORcc_R	xnorcc 	%r3, %r13, %r27
	.word 0xaa320009  ! 1: ORN_R	orn 	%r8, %r9, %r21
	.word 0xae38c00f  ! 1: XNOR_R	xnor 	%r3, %r15, %r23
thr3_resum_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac19800f  ! 1: XOR_R	xor 	%r6, %r15, %r22
	.word 0xb0b1696b  ! 1: ORNcc_I	orncc 	%r5, 0x096b, %r24
	.word 0xbe41800d  ! 1: ADDC_R	addc 	%r6, %r13, %r31
	.word 0xac90ebc1  ! 1: ORcc_I	orcc 	%r3, 0x0bc1, %r22
thr3_resum_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa339c00f  ! 1: SRA_R	sra 	%r7, %r15, %r17
	.word 0xa89a2053  ! 1: XORcc_I	xorcc 	%r8, 0x0053, %r20
	.word 0xab2a1009  ! 1: SLLX_R	sllx	%r8, %r9, %r21
	.word 0xa60a2c47  ! 1: AND_I	and 	%r8, 0x0c47, %r19
thr3_resum_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbaa8e96e  ! 1: ANDNcc_I	andncc 	%r3, 0x096e, %r29
	.word 0xb000abb1  ! 1: ADD_I	add 	%r2, 0x0bb1, %r24
	.word 0xa978040e  ! 1: MOVR_R	move	%r0, %r14, %r20
	.word 0xa6c1000a  ! 1: ADDCcc_R	addccc 	%r4, %r10, %r19
thr3_resum_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_33), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_33)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8a8ea28  ! 1: ANDNcc_I	andncc 	%r3, 0x0a28, %r20
	.word 0xa964180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb011000b  ! 1: OR_R	or 	%r4, %r11, %r24
	.word 0xb531800c  ! 1: SRL_R	srl 	%r6, %r12, %r26
thr3_resum_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_34), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_34)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf29900b  ! 1: SLLX_R	sllx	%r6, %r11, %r23
	.word 0xb539e001  ! 1: SRA_I	sra 	%r7, 0x0001, %r26
	.word 0xa728f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r19
	.word 0xb489000f  ! 1: ANDcc_R	andcc 	%r4, %r15, %r26
thr3_resum_intr_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_35), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_35)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa3391009  ! 1: SRAX_R	srax	%r4, %r9, %r17
	.word 0xbb296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r29
	.word 0xa0116d7e  ! 1: OR_I	or 	%r5, 0x0d7e, %r16
	.word 0xb8b0ab76  ! 1: ORNcc_I	orncc 	%r2, 0x0b76, %r28
thr3_resum_intr_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_36), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_36)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb31500e  ! 1: SRLX_R	srlx	%r5, %r14, %r29
	.word 0xa939100d  ! 1: SRAX_R	srax	%r4, %r13, %r20
	.word 0xa528f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r18
	.word 0xbd643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_37)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2b8e57b  ! 1: XNORcc_I	xnorcc 	%r3, 0x057b, %r25
	.word 0xad2a3001  ! 1: SLLX_I	sllx	%r8, 0x0001, %r22
	.word 0xa228c009  ! 1: ANDN_R	andn 	%r3, %r9, %r17
	.word 0xb819c00a  ! 1: XOR_R	xor 	%r7, %r10, %r28
thr3_resum_intr_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_38), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_38)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb699aa15  ! 1: XORcc_I	xorcc 	%r6, 0x0a15, %r27
	.word 0xba392540  ! 1: XNOR_I	xnor 	%r4, 0x0540, %r29
	.word 0xb631a190  ! 1: ORN_I	orn 	%r6, 0x0190, %r27
	.word 0xb6c1c00a  ! 1: ADDCcc_R	addccc 	%r7, %r10, %r27
thr3_resum_intr_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_39), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_39)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0a9400d  ! 1: ANDNcc_R	andncc 	%r5, %r13, %r16
	.word 0xae29800d  ! 1: ANDN_R	andn 	%r6, %r13, %r23
	.word 0xb3312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r25
	.word 0xa491000f  ! 1: ORcc_R	orcc 	%r4, %r15, %r18
thr3_resum_intr_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_40), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_40)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb364180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa239400a  ! 1: XNOR_R	xnor 	%r5, %r10, %r17
	.word 0xa688800e  ! 1: ANDcc_R	andcc 	%r2, %r14, %r19
	.word 0xb2b22805  ! 1: ORNcc_I	orncc 	%r8, 0x0805, %r25
thr3_resum_intr_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_41), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_41)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa48a000d  ! 1: ANDcc_R	andcc 	%r8, %r13, %r18
	.word 0xbab10009  ! 1: ORNcc_R	orncc 	%r4, %r9, %r29
	.word 0xbac1000f  ! 1: ADDCcc_R	addccc 	%r4, %r15, %r29
	.word 0xa431e82b  ! 1: ORN_I	orn 	%r7, 0x082b, %r18
thr3_resum_intr_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_42), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_42)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa53a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r18
	.word 0xa689c00e  ! 1: ANDcc_R	andcc 	%r7, %r14, %r19
	.word 0xba11800f  ! 1: OR_R	or 	%r6, %r15, %r29
	.word 0xaa28c00e  ! 1: ANDN_R	andn 	%r3, %r14, %r21
thr3_resum_intr_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_43)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac99c00b  ! 1: XORcc_R	xorcc 	%r7, %r11, %r22
	.word 0xab29800f  ! 1: SLL_R	sll 	%r6, %r15, %r21
	.word 0xbf38800a  ! 1: SRA_R	sra 	%r2, %r10, %r31
	.word 0xaa90c00a  ! 1: ORcc_R	orcc 	%r3, %r10, %r21
thr3_resum_intr_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_44), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_44)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba88c00c  ! 1: ANDcc_R	andcc 	%r3, %r12, %r29
	.word 0xaaaa2110  ! 1: ANDNcc_I	andncc 	%r8, 0x0110, %r21
	.word 0xa8822ba5  ! 1: ADDcc_I	addcc 	%r8, 0x0ba5, %r20
	.word 0xa3643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_45), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_45)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb411c00a  ! 1: OR_R	or 	%r7, %r10, %r26
	.word 0xb601000c  ! 1: ADD_R	add 	%r4, %r12, %r27
	.word 0xb019400b  ! 1: XOR_R	xor 	%r5, %r11, %r24
	.word 0xb6b10009  ! 1: ORNcc_R	orncc 	%r4, %r9, %r27
thr3_resum_intr_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_46)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba88aecc  ! 1: ANDcc_I	andcc 	%r2, 0x0ecc, %r29
	.word 0xbe89000a  ! 1: ANDcc_R	andcc 	%r4, %r10, %r31
	.word 0xac99000b  ! 1: XORcc_R	xorcc 	%r4, %r11, %r22
	.word 0xa228e2d7  ! 1: ANDN_I	andn 	%r3, 0x02d7, %r17
thr3_resum_intr_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_47), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_47)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc82000d  ! 1: ADDcc_R	addcc 	%r8, %r13, %r30
	.word 0xbf38a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r31
	.word 0xb29a000b  ! 1: XORcc_R	xorcc 	%r8, %r11, %r25
	.word 0xaa91400b  ! 1: ORcc_R	orcc 	%r5, %r11, %r21
thr3_resum_intr_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_48)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa120009  ! 1: OR_R	or 	%r8, %r9, %r21
	.word 0xaf39d00a  ! 1: SRAX_R	srax	%r7, %r10, %r23
	.word 0xba91e4fa  ! 1: ORcc_I	orcc 	%r7, 0x04fa, %r29
	.word 0xb2194009  ! 1: XOR_R	xor 	%r5, %r9, %r25
thr3_resum_intr_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_49), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_49)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa6a9a8f1  ! 1: ANDNcc_I	andncc 	%r6, 0x08f1, %r19
	.word 0xa8896e6d  ! 1: ANDcc_I	andcc 	%r5, 0x0e6d, %r20
	.word 0xb731d00a  ! 1: SRLX_R	srlx	%r7, %r10, %r27
	.word 0xbe8a25cc  ! 1: ANDcc_I	andcc 	%r8, 0x05cc, %r31
thr3_resum_intr_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_50), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_50)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2a9ebb5  ! 1: ANDNcc_I	andncc 	%r7, 0x0bb5, %r17
	.word 0xb818e31f  ! 1: XOR_I	xor 	%r3, 0x031f, %r28
	.word 0xa939400f  ! 1: SRA_R	sra 	%r5, %r15, %r20
	.word 0xb430e3de  ! 1: ORN_I	orn 	%r3, 0x03de, %r26
thr3_resum_intr_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_51), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_51)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa3322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r17
	.word 0xb128f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r24
	.word 0xbe88a0bb  ! 1: ANDcc_I	andcc 	%r2, 0x00bb, %r31
	.word 0xa610a31e  ! 1: OR_I	or 	%r2, 0x031e, %r19
thr3_resum_intr_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_52)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r21
	.word 0xb681e7a6  ! 1: ADDcc_I	addcc 	%r7, 0x07a6, %r27
	.word 0xaa91c00a  ! 1: ORcc_R	orcc 	%r7, %r10, %r21
	.word 0xb888eb16  ! 1: ANDcc_I	andcc 	%r3, 0x0b16, %r28
thr3_resum_intr_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_53), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_53)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa939a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r20
	.word 0xaeb8ee67  ! 1: XNORcc_I	xnorcc 	%r3, 0x0e67, %r23
	.word 0xa4a9400b  ! 1: ANDNcc_R	andncc 	%r5, %r11, %r18
	.word 0xbe19c00c  ! 1: XOR_R	xor 	%r7, %r12, %r31
thr3_resum_intr_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_54)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c1ecef  ! 1: ADDCcc_I	addccc 	%r7, 0x0cef, %r25
	.word 0xa931800e  ! 1: SRL_R	srl 	%r6, %r14, %r20
	.word 0xbb64180d  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb9297001  ! 1: SLLX_I	sllx	%r5, 0x0001, %r28
thr3_resum_intr_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_55), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_55)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa401225d  ! 1: ADD_I	add 	%r4, 0x025d, %r18
	.word 0xb178040d  ! 1: MOVR_R	move	%r0, %r13, %r24
	.word 0xa178040b  ! 1: MOVR_R	move	%r0, %r11, %r16
	.word 0xbeb8e8ba  ! 1: XNORcc_I	xnorcc 	%r3, 0x08ba, %r31
thr3_resum_intr_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_56)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa429249d  ! 1: ANDN_I	andn 	%r4, 0x049d, %r18
	.word 0xa410e42d  ! 1: OR_I	or 	%r3, 0x042d, %r18
	.word 0xbcc0c00c  ! 1: ADDCcc_R	addccc 	%r3, %r12, %r30
thr3_resum_intr_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_57), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_57)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbaa9a0d8  ! 1: ANDNcc_I	andncc 	%r6, 0x00d8, %r29
	.word 0xb8a9000a  ! 1: ANDNcc_R	andncc 	%r4, %r10, %r28
	.word 0xb738900d  ! 1: SRAX_R	srax	%r2, %r13, %r27
	.word 0xbe88c00a  ! 1: ANDcc_R	andcc 	%r3, %r10, %r31
thr3_resum_intr_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_58), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_58)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf28d00a  ! 1: SLLX_R	sllx	%r3, %r10, %r23
	.word 0xbea9c009  ! 1: ANDNcc_R	andncc 	%r7, %r9, %r31
	.word 0xa339500f  ! 1: SRAX_R	srax	%r5, %r15, %r17
	.word 0xa5322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r18
thr3_resum_intr_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_59), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_59)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb529100f  ! 1: SLLX_R	sllx	%r4, %r15, %r26
	.word 0xa6894009  ! 1: ANDcc_R	andcc 	%r5, %r9, %r19
	.word 0xb928f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r28
	.word 0xba31e9b4  ! 1: ORN_I	orn 	%r7, 0x09b4, %r29
thr3_resum_intr_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_60), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_60)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa529a001  ! 1: SLL_I	sll 	%r6, 0x0001, %r18
	.word 0xbca9a916  ! 1: ANDNcc_I	andncc 	%r6, 0x0916, %r30
	.word 0xb402224a  ! 1: ADD_I	add 	%r8, 0x024a, %r26
	.word 0xb01124ff  ! 1: OR_I	or 	%r4, 0x04ff, %r24
thr3_resum_intr_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_61), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_61)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4c126e3  ! 1: ADDCcc_I	addccc 	%r4, 0x06e3, %r18
	.word 0xb331500c  ! 1: SRLX_R	srlx	%r5, %r12, %r25
	.word 0xbc41800b  ! 1: ADDC_R	addc 	%r6, %r11, %r30
	.word 0xb841e485  ! 1: ADDC_I	addc 	%r7, 0x0485, %r28
thr3_resum_intr_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_62)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacc0edda  ! 1: ADDCcc_I	addccc 	%r3, 0x0dda, %r22
	.word 0xbc3a2928  ! 1: XNOR_I	xnor 	%r8, 0x0928, %r30
	.word 0xb21a000d  ! 1: XOR_R	xor 	%r8, %r13, %r25
	.word 0xa0b0ac14  ! 1: ORNcc_I	orncc 	%r2, 0x0c14, %r16
thr3_resum_intr_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_63), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_63)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb329800c  ! 1: SLL_R	sll 	%r6, %r12, %r25
	.word 0xb841a4f5  ! 1: ADDC_I	addc 	%r6, 0x04f5, %r28
	.word 0xa6822cb5  ! 1: ADDcc_I	addcc 	%r8, 0x0cb5, %r19
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_64), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_64)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa209000e  ! 1: AND_R	and 	%r4, %r14, %r17
	.word 0xb629800a  ! 1: ANDN_R	andn 	%r6, %r10, %r27
	.word 0xa378040f  ! 1: MOVR_R	move	%r0, %r15, %r17
	.word 0xb480c00a  ! 1: ADDcc_R	addcc 	%r3, %r10, %r26
thr3_resum_intr_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_65), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_65)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe2a20e5  ! 1: ANDN_I	andn 	%r8, 0x00e5, %r31
	.word 0xba822903  ! 1: ADDcc_I	addcc 	%r8, 0x0903, %r29
	.word 0xbe01e69a  ! 1: ADD_I	add 	%r7, 0x069a, %r31
	.word 0xba00800e  ! 1: ADD_R	add 	%r2, %r14, %r29
thr3_resum_intr_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_66), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_66)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc98a763  ! 1: XORcc_I	xorcc 	%r2, 0x0763, %r30
	.word 0xb0b9000b  ! 1: XNORcc_R	xnorcc 	%r4, %r11, %r24
	.word 0xad38c00d  ! 1: SRA_R	sra 	%r3, %r13, %r22
	.word 0xa0c1800d  ! 1: ADDCcc_R	addccc 	%r6, %r13, %r16
thr3_resum_intr_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_67), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_67)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2a9e823  ! 1: ANDNcc_I	andncc 	%r7, 0x0823, %r17
	.word 0xae91a807  ! 1: ORcc_I	orcc 	%r6, 0x0807, %r23
	.word 0xa0a9400d  ! 1: ANDNcc_R	andncc 	%r5, %r13, %r16
	.word 0xa008c00a  ! 1: AND_R	and 	%r3, %r10, %r16
thr3_resum_intr_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_68), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_68)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa018c00e  ! 1: XOR_R	xor 	%r3, %r14, %r16
	.word 0xa41a2dec  ! 1: XOR_I	xor 	%r8, 0x0dec, %r18
	.word 0xae2a27e4  ! 1: ANDN_I	andn 	%r8, 0x07e4, %r23
	.word 0xb328800f  ! 1: SLL_R	sll 	%r2, %r15, %r25
thr3_resum_intr_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_69)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8992432  ! 1: XORcc_I	xorcc 	%r4, 0x0432, %r20
	.word 0xb6c222fd  ! 1: ADDCcc_I	addccc 	%r8, 0x02fd, %r27
	.word 0xb1293001  ! 1: SLLX_I	sllx	%r4, 0x0001, %r24
	.word 0xb009eb6d  ! 1: AND_I	and 	%r7, 0x0b6d, %r24
thr3_resum_intr_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_70), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_70)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc91400c  ! 1: ORcc_R	orcc 	%r5, %r12, %r30
	.word 0xa682000c  ! 1: ADDcc_R	addcc 	%r8, %r12, %r19
	.word 0xb608c00e  ! 1: AND_R	and 	%r3, %r14, %r27
	.word 0xb8422551  ! 1: ADDC_I	addc 	%r8, 0x0551, %r28
thr3_resum_intr_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_71), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_71)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb098800f  ! 1: XORcc_R	xorcc 	%r2, %r15, %r24
	.word 0xaeb8e020  ! 1: XNORcc_I	xnorcc 	%r3, 0x0020, %r23
	.word 0xae88a524  ! 1: ANDcc_I	andcc 	%r2, 0x0524, %r23
	.word 0xa129800f  ! 1: SLL_R	sll 	%r6, %r15, %r16
thr3_resum_intr_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_72), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_72)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa73a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r19
	.word 0xb928c00f  ! 1: SLL_R	sll 	%r3, %r15, %r28
	.word 0xa689000a  ! 1: ANDcc_R	andcc 	%r4, %r10, %r19
	.word 0xb5313001  ! 1: SRLX_I	srlx	%r4, 0x0001, %r26
thr3_resum_intr_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_73), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_73)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa419c009  ! 1: XOR_R	xor 	%r7, %r9, %r18
	.word 0xbec1800d  ! 1: ADDCcc_R	addccc 	%r6, %r13, %r31
	.word 0xb7319009  ! 1: SRLX_R	srlx	%r6, %r9, %r27
thr3_resum_intr_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_74), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_74)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r31
	.word 0xae4124d5  ! 1: ADDC_I	addc 	%r4, 0x04d5, %r23
	.word 0xb0b0c00f  ! 1: ORNcc_R	orncc 	%r3, %r15, %r24
	.word 0xbc98c009  ! 1: XORcc_R	xorcc 	%r3, %r9, %r30
thr3_resum_intr_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_75), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_75)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc99c009  ! 1: XORcc_R	xorcc 	%r7, %r9, %r30
	.word 0xb43168a0  ! 1: ORN_I	orn 	%r5, 0x08a0, %r26
	.word 0xa808c00e  ! 1: AND_R	and 	%r3, %r14, %r20
	.word 0xb92a2001  ! 1: SLL_I	sll 	%r8, 0x0001, %r28
thr3_resum_intr_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_76), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_76)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe2928e2  ! 1: ANDN_I	andn 	%r4, 0x08e2, %r31
	.word 0xb401000c  ! 1: ADD_R	add 	%r4, %r12, %r26
	.word 0xa331a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r17
	.word 0xab39100f  ! 1: SRAX_R	srax	%r4, %r15, %r21
thr3_resum_intr_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_77), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_77)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf28a001  ! 1: SLL_I	sll 	%r2, 0x0001, %r23
	.word 0xaa80e50c  ! 1: ADDcc_I	addcc 	%r3, 0x050c, %r21
	.word 0xa2312eba  ! 1: ORN_I	orn 	%r4, 0x0eba, %r17
	.word 0xb68222c6  ! 1: ADDcc_I	addcc 	%r8, 0x02c6, %r27
thr3_resum_intr_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_78), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_78)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa529f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r18
	.word 0xa099e7a8  ! 1: XORcc_I	xorcc 	%r7, 0x07a8, %r16
	.word 0xaab8ea72  ! 1: XNORcc_I	xnorcc 	%r3, 0x0a72, %r21
	.word 0xa011000f  ! 1: OR_R	or 	%r4, %r15, %r16
thr3_resum_intr_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_79), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_79)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb6b927ff  ! 1: XNORcc_I	xnorcc 	%r4, 0x07ff, %r27
	.word 0xb209000b  ! 1: AND_R	and 	%r4, %r11, %r25
	.word 0xb618a5a4  ! 1: XOR_I	xor 	%r2, 0x05a4, %r27
	.word 0xb809aa32  ! 1: AND_I	and 	%r6, 0x0a32, %r28
thr3_resum_intr_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_80), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_80)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0c2000a  ! 1: ADDCcc_R	addccc 	%r8, %r10, %r16
	.word 0xa939a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r20
	.word 0xba81ee55  ! 1: ADDcc_I	addcc 	%r7, 0x0e55, %r29
	.word 0xb2a8ab55  ! 1: ANDNcc_I	andncc 	%r2, 0x0b55, %r25
thr3_resum_intr_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_81)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc28a43e  ! 1: ANDN_I	andn 	%r2, 0x043e, %r30
	.word 0xaa89c00e  ! 1: ANDcc_R	andcc 	%r7, %r14, %r21
	.word 0xa4c0c00b  ! 1: ADDCcc_R	addccc 	%r3, %r11, %r18
	.word 0xb012000e  ! 1: OR_R	or 	%r8, %r14, %r24
thr3_resum_intr_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_82), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_82)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa129500c  ! 1: SLLX_R	sllx	%r5, %r12, %r16
	.word 0xb3323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r25
	.word 0xa609aa9a  ! 1: AND_I	and 	%r6, 0x0a9a, %r19
	.word 0xb2b8a0f7  ! 1: XNORcc_I	xnorcc 	%r2, 0x00f7, %r25
thr3_resum_intr_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_83)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa411c00b  ! 1: OR_R	or 	%r7, %r11, %r18
	.word 0xa564180c  ! 1: MOVcc_R	<illegal instruction>
	.word 0xac092317  ! 1: AND_I	and 	%r4, 0x0317, %r22
	.word 0xa282000b  ! 1: ADDcc_R	addcc 	%r8, %r11, %r17
thr3_resum_intr_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_84), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_84)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb29c00e  ! 1: SLL_R	sll 	%r7, %r14, %r29
	.word 0xae29800c  ! 1: ANDN_R	andn 	%r6, %r12, %r23
	.word 0xa641c00a  ! 1: ADDC_R	addc 	%r7, %r10, %r19
	.word 0xbe90c00b  ! 1: ORcc_R	orcc 	%r3, %r11, %r31
thr3_resum_intr_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_85)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf31000d  ! 1: SRL_R	srl 	%r4, %r13, %r31
	.word 0xb630c009  ! 1: ORN_R	orn 	%r3, %r9, %r27
	.word 0xaeb9800f  ! 1: XNORcc_R	xnorcc 	%r6, %r15, %r23
	.word 0xae292cc4  ! 1: ANDN_I	andn 	%r4, 0x0cc4, %r23
thr3_resum_intr_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_86), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_86)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb939c00c  ! 1: SRA_R	sra 	%r7, %r12, %r28
	.word 0xa330a001  ! 1: SRL_I	srl 	%r2, 0x0001, %r17
	.word 0xaa09000e  ! 1: AND_R	and 	%r4, %r14, %r21
	.word 0xa891a3ad  ! 1: ORcc_I	orcc 	%r6, 0x03ad, %r20
thr3_resum_intr_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_87), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_87)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa729900b  ! 1: SLLX_R	sllx	%r6, %r11, %r19
	.word 0xa4a9699e  ! 1: ANDNcc_I	andncc 	%r5, 0x099e, %r18
	.word 0xbf64180a  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbf312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r31
thr3_resum_intr_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_88), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_88)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa211800a  ! 1: OR_R	or 	%r6, %r10, %r17
	.word 0xab312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r21
	.word 0xae81400d  ! 1: ADDcc_R	addcc 	%r5, %r13, %r23
	.word 0xac41a606  ! 1: ADDC_I	addc 	%r6, 0x0606, %r22
thr3_resum_intr_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_89), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_89)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa11a6ef  ! 1: OR_I	or 	%r6, 0x06ef, %r21
	.word 0xa538a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r18
	.word 0xa698800e  ! 1: XORcc_R	xorcc 	%r2, %r14, %r19
	.word 0xbf782401  ! 1: MOVR_I	move	%r0, 0xe, %r31
thr3_resum_intr_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_90), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_90)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf39a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r23
	.word 0xa009eefd  ! 1: AND_I	and 	%r7, 0x0efd, %r16
	.word 0xaa01eaf1  ! 1: ADD_I	add 	%r7, 0x0af1, %r21
	.word 0xae4226e3  ! 1: ADDC_I	addc 	%r8, 0x06e3, %r23
thr3_resum_intr_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_91), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_91)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf30a001  ! 1: SRL_I	srl 	%r2, 0x0001, %r23
	.word 0xa6b1e425  ! 1: ORNcc_I	orncc 	%r7, 0x0425, %r19
	.word 0xac39ec73  ! 1: XNOR_I	xnor 	%r7, 0x0c73, %r22
	.word 0xad78040e  ! 1: MOVR_R	move	%r0, %r14, %r22
thr3_resum_intr_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_92)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa929f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r20
	.word 0xa2a9000b  ! 1: ANDNcc_R	andncc 	%r4, %r11, %r17
	.word 0xbc91aec9  ! 1: ORcc_I	orcc 	%r6, 0x0ec9, %r30
	.word 0xad30900c  ! 1: SRLX_R	srlx	%r2, %r12, %r22
thr3_resum_intr_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_93), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_93)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa819000b  ! 1: XOR_R	xor 	%r4, %r11, %r20
	.word 0xb0b1000e  ! 1: ORNcc_R	orncc 	%r4, %r14, %r24
	.word 0xac19c00d  ! 1: XOR_R	xor 	%r7, %r13, %r22
	.word 0xae18a6d3  ! 1: XOR_I	xor 	%r2, 0x06d3, %r23
thr3_resum_intr_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_94)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf3a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r31
	.word 0xb731e001  ! 1: SRL_I	srl 	%r7, 0x0001, %r27
	.word 0xa338e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r17
	.word 0xbe9127ce  ! 1: ORcc_I	orcc 	%r4, 0x07ce, %r31
thr3_resum_intr_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_95), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_95)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa529100e  ! 1: SLLX_R	sllx	%r4, %r14, %r18
	.word 0xa809800b  ! 1: AND_R	and 	%r6, %r11, %r20
	.word 0xa730900a  ! 1: SRLX_R	srlx	%r2, %r10, %r19
	.word 0xb529100f  ! 1: SLLX_R	sllx	%r4, %r15, %r26
thr3_resum_intr_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_96), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_96)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb69a0009  ! 1: XORcc_R	xorcc 	%r8, %r9, %r27
	.word 0xb3297001  ! 1: SLLX_I	sllx	%r5, 0x0001, %r25
	.word 0xb4c2000b  ! 1: ADDCcc_R	addccc 	%r8, %r11, %r26
	.word 0xa489400a  ! 1: ANDcc_R	andcc 	%r5, %r10, %r18
thr3_resum_intr_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_97), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_97)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb631293e  ! 1: ORN_I	orn 	%r4, 0x093e, %r27
	.word 0xaa29a64a  ! 1: ANDN_I	andn 	%r6, 0x064a, %r21
	.word 0xa578040f  ! 1: MOVR_R	move	%r0, %r15, %r18
	.word 0xa1292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r16
thr3_resum_intr_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_98)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa499a8b5  ! 1: XORcc_I	xorcc 	%r6, 0x08b5, %r18
	.word 0xae9a2e7b  ! 1: XORcc_I	xorcc 	%r8, 0x0e7b, %r23
	.word 0xb4a9000a  ! 1: ANDNcc_R	andncc 	%r4, %r10, %r26
	.word 0xb898c00d  ! 1: XORcc_R	xorcc 	%r3, %r13, %r28
thr3_resum_intr_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_99), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_99)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb52a100d  ! 1: SLLX_R	sllx	%r8, %r13, %r26
	.word 0xab32000c  ! 1: SRL_R	srl 	%r8, %r12, %r21
	.word 0xa729900b  ! 1: SLLX_R	sllx	%r6, %r11, %r19
	.word 0xb931400e  ! 1: SRL_R	srl 	%r5, %r14, %r28
thr3_resum_intr_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_100), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_100)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb728b001  ! 1: SLLX_I	sllx	%r2, 0x0001, %r27
	.word 0xaf782401  ! 1: MOVR_I	move	%r0, 0x1, %r23
	.word 0xae18a07d  ! 1: XOR_I	xor 	%r2, 0x007d, %r23
	.word 0xae31ef20  ! 1: ORN_I	orn 	%r7, 0x0f20, %r23
thr3_resum_intr_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_101), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_101)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa092000c  ! 1: ORcc_R	orcc 	%r8, %r12, %r16
	.word 0xbc91ee67  ! 1: ORcc_I	orcc 	%r7, 0x0e67, %r30
	.word 0xb0b8e4ed  ! 1: XNORcc_I	xnorcc 	%r3, 0x04ed, %r24
	.word 0xb964180b  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_102)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb639400a  ! 1: XNOR_R	xnor 	%r5, %r10, %r27
	.word 0xb8022b97  ! 1: ADD_I	add 	%r8, 0x0b97, %r28
	.word 0xbf28a001  ! 1: SLL_I	sll 	%r2, 0x0001, %r31
	.word 0xbb321009  ! 1: SRLX_R	srlx	%r8, %r9, %r29
thr3_resum_intr_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_103), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_103)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa200a174  ! 1: ADD_I	add 	%r2, 0x0174, %r17
	.word 0xbc31c009  ! 1: ORN_R	orn 	%r7, %r9, %r30
	.word 0xaaaa248a  ! 1: ANDNcc_I	andncc 	%r8, 0x048a, %r21
	.word 0xb819800a  ! 1: XOR_R	xor 	%r6, %r10, %r28
thr3_resum_intr_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_104), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_104)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad29400f  ! 1: SLL_R	sll 	%r5, %r15, %r22
	.word 0xbe2a2d2e  ! 1: ANDN_I	andn 	%r8, 0x0d2e, %r31
	.word 0xae9963f4  ! 1: XORcc_I	xorcc 	%r5, 0x03f4, %r23
	.word 0xb612000e  ! 1: OR_R	or 	%r8, %r14, %r27
thr3_resum_intr_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_105), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_105)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbcc18009  ! 1: ADDCcc_R	addccc 	%r6, %r9, %r30
	.word 0xb438c00c  ! 1: XNOR_R	xnor 	%r3, %r12, %r26
	.word 0xbf78040d  ! 1: MOVR_R	move	%r0, %r13, %r31
	.word 0xb929500c  ! 1: SLLX_R	sllx	%r5, %r12, %r28
thr3_resum_intr_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_106), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_106)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb578040e  ! 1: MOVR_R	move	%r0, %r14, %r26
	.word 0xb6912f24  ! 1: ORcc_I	orcc 	%r4, 0x0f24, %r27
	.word 0xa440c00a  ! 1: ADDC_R	addc 	%r3, %r10, %r18
	.word 0xb029a83d  ! 1: ANDN_I	andn 	%r6, 0x083d, %r24
thr3_resum_intr_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_107)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2b8a39e  ! 1: XNORcc_I	xnorcc 	%r2, 0x039e, %r25
	.word 0xa032000f  ! 1: ORN_R	orn 	%r8, %r15, %r16
	.word 0xba08c009  ! 1: AND_R	and 	%r3, %r9, %r29
	.word 0xa12a100d  ! 1: SLLX_R	sllx	%r8, %r13, %r16
thr3_resum_intr_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_108), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_108)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab38e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r21
	.word 0xaab9400b  ! 1: XNORcc_R	xnorcc 	%r5, %r11, %r21
	.word 0xb6392be7  ! 1: XNOR_I	xnor 	%r4, 0x0be7, %r27
	.word 0xaa82000b  ! 1: ADDcc_R	addcc 	%r8, %r11, %r21
thr3_resum_intr_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_109), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_109)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb600e282  ! 1: ADD_I	add 	%r3, 0x0282, %r27
	.word 0xa6aa000a  ! 1: ANDNcc_R	andncc 	%r8, %r10, %r19
	.word 0xb480e5b9  ! 1: ADDcc_I	addcc 	%r3, 0x05b9, %r26
	.word 0xb531400d  ! 1: SRL_R	srl 	%r5, %r13, %r26
thr3_resum_intr_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_110), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_110)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac412790  ! 1: ADDC_I	addc 	%r4, 0x0790, %r22
	.word 0xa439244b  ! 1: XNOR_I	xnor 	%r4, 0x044b, %r18
	.word 0xba99400a  ! 1: XORcc_R	xorcc 	%r5, %r10, %r29
	.word 0xa0c1800b  ! 1: ADDCcc_R	addccc 	%r6, %r11, %r16
thr3_resum_intr_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_111)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb332000d  ! 1: SRL_R	srl 	%r8, %r13, %r25
	.word 0xb131b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r24
	.word 0xb7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xbeb8a2de  ! 1: XNORcc_I	xnorcc 	%r2, 0x02de, %r31
thr3_resum_intr_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_112), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_112)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf29000c  ! 1: SLL_R	sll 	%r4, %r12, %r31
	.word 0xa618c00a  ! 1: XOR_R	xor 	%r3, %r10, %r19
	.word 0xaab9adaf  ! 1: XNORcc_I	xnorcc 	%r6, 0x0daf, %r21
	.word 0xa2b9800b  ! 1: XNORcc_R	xnorcc 	%r6, %r11, %r17
thr3_resum_intr_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_113), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_113)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb808ecaf  ! 1: AND_I	and 	%r3, 0x0caf, %r28
	.word 0xa490800a  ! 1: ORcc_R	orcc 	%r2, %r10, %r18
	.word 0xb29969b3  ! 1: XORcc_I	xorcc 	%r5, 0x09b3, %r25
	.word 0xac81c00c  ! 1: ADDcc_R	addcc 	%r7, %r12, %r22
thr3_resum_intr_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_114), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_114)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa600c00a  ! 1: ADD_R	add 	%r3, %r10, %r19
	.word 0xb089ae00  ! 1: ANDcc_I	andcc 	%r6, 0x0e00, %r24
	.word 0xb62a2a03  ! 1: ANDN_I	andn 	%r8, 0x0a03, %r27
	.word 0xa338a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r17
thr3_resum_intr_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_115), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_115)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf32100f  ! 1: SRLX_R	srlx	%r8, %r15, %r31
	.word 0xa028ad00  ! 1: ANDN_I	andn 	%r2, 0x0d00, %r16
	.word 0xb639400f  ! 1: XNOR_R	xnor 	%r5, %r15, %r27
	.word 0xa618c00a  ! 1: XOR_R	xor 	%r3, %r10, %r19
thr3_resum_intr_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_116), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_116)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba912968  ! 1: ORcc_I	orcc 	%r4, 0x0968, %r29
	.word 0xa6192918  ! 1: XOR_I	xor 	%r4, 0x0918, %r19
	.word 0xb281800c  ! 1: ADDcc_R	addcc 	%r6, %r12, %r25
	.word 0xa010a7a7  ! 1: OR_I	or 	%r2, 0x07a7, %r16
thr3_resum_intr_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_117), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_117)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbeaa000b  ! 1: ANDNcc_R	andncc 	%r8, %r11, %r31
	.word 0xac92226d  ! 1: ORcc_I	orcc 	%r8, 0x026d, %r22
	.word 0xa328b001  ! 1: SLLX_I	sllx	%r2, 0x0001, %r17
	.word 0xb430ab09  ! 1: ORN_I	orn 	%r2, 0x0b09, %r26
thr3_resum_intr_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_118), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_118)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa801800b  ! 1: ADD_R	add 	%r6, %r11, %r20
	.word 0xbc88800a  ! 1: ANDcc_R	andcc 	%r2, %r10, %r30
	.word 0xae12000b  ! 1: OR_R	or 	%r8, %r11, %r23
	.word 0xb728f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r27
thr3_resum_intr_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_119), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_119)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb30c00e  ! 1: SRL_R	srl 	%r3, %r14, %r29
	.word 0xaa81e332  ! 1: ADDcc_I	addcc 	%r7, 0x0332, %r21
	.word 0xaf2a3001  ! 1: SLLX_I	sllx	%r8, 0x0001, %r23
	.word 0xbd28e001  ! 1: SLL_I	sll 	%r3, 0x0001, %r30
thr3_resum_intr_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_120), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_120)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2b8a009  ! 1: XNORcc_I	xnorcc 	%r2, 0x0009, %r17
	.word 0xae80800b  ! 1: ADDcc_R	addcc 	%r2, %r11, %r23
	.word 0xbeaa000f  ! 1: ANDNcc_R	andncc 	%r8, %r15, %r31
	.word 0xbe09a80c  ! 1: AND_I	and 	%r6, 0x080c, %r31
thr3_resum_intr_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_121)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf30e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r31
	.word 0xa139c00a  ! 1: SRA_R	sra 	%r7, %r10, %r16
	.word 0xa130c00f  ! 1: SRL_R	srl 	%r3, %r15, %r16
	.word 0xb899000a  ! 1: XORcc_R	xorcc 	%r4, %r10, %r28
thr3_resum_intr_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_122), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_122)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa7323001  ! 1: SRLX_I	srlx	%r8, 0x0001, %r19
	.word 0xa939800f  ! 1: SRA_R	sra 	%r6, %r15, %r20
	.word 0xb488e368  ! 1: ANDcc_I	andcc 	%r3, 0x0368, %r26
	.word 0xa5391009  ! 1: SRAX_R	srax	%r4, %r9, %r18
thr3_resum_intr_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_123), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_123)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa10c00e  ! 1: OR_R	or 	%r3, %r14, %r21
	.word 0xae1a000a  ! 1: XOR_R	xor 	%r8, %r10, %r23
	.word 0xa841400d  ! 1: ADDC_R	addc 	%r5, %r13, %r20
	.word 0xa6b1e6e0  ! 1: ORNcc_I	orncc 	%r7, 0x06e0, %r19
thr3_resum_intr_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_124), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_124)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa081a954  ! 1: ADDcc_I	addcc 	%r6, 0x0954, %r16
	.word 0xa928d00c  ! 1: SLLX_R	sllx	%r3, %r12, %r20
	.word 0xa2422ed0  ! 1: ADDC_I	addc 	%r8, 0x0ed0, %r17
	.word 0xba41c009  ! 1: ADDC_R	addc 	%r7, %r9, %r29
thr3_resum_intr_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_125)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb28a000b  ! 1: ANDcc_R	andcc 	%r8, %r11, %r25
	.word 0xa0c1c00c  ! 1: ADDCcc_R	addccc 	%r7, %r12, %r16
	.word 0xb010a93d  ! 1: OR_I	or 	%r2, 0x093d, %r24
	.word 0xa828c00c  ! 1: ANDN_R	andn 	%r3, %r12, %r20
thr3_resum_intr_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_126), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_126)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae99800a  ! 1: XORcc_R	xorcc 	%r6, %r10, %r23
	.word 0xb0c0800e  ! 1: ADDCcc_R	addccc 	%r2, %r14, %r24
	.word 0xa531a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r18
	.word 0xa5641809  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_127), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_127)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac916c4e  ! 1: ORcc_I	orcc 	%r5, 0x0c4e, %r22
	.word 0xae18e78a  ! 1: XOR_I	xor 	%r3, 0x078a, %r23
	.word 0xa6a965d6  ! 1: ANDNcc_I	andncc 	%r5, 0x05d6, %r19
	.word 0xa9296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r20
thr3_resum_intr_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_128), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_128)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb328900d  ! 1: SLLX_R	sllx	%r2, %r13, %r25
	.word 0xbd64180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xba18c00e  ! 1: XOR_R	xor 	%r3, %r14, %r29
	.word 0xa4a96a45  ! 1: ANDNcc_I	andncc 	%r5, 0x0a45, %r18
thr3_resum_intr_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_129)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb730800f  ! 1: SRL_R	srl 	%r2, %r15, %r27
	.word 0xab39a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r21
	.word 0xb8ba2d2a  ! 1: XNORcc_I	xnorcc 	%r8, 0x0d2a, %r28
	.word 0xb6018009  ! 1: ADD_R	add 	%r6, %r9, %r27
thr3_resum_intr_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_130), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_130)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa131d00e  ! 1: SRLX_R	srlx	%r7, %r14, %r16
	.word 0xbe00c00b  ! 1: ADD_R	add 	%r3, %r11, %r31
	.word 0xa3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb041000e  ! 1: ADDC_R	addc 	%r4, %r14, %r24
thr3_resum_intr_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_131)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa1290009  ! 1: SLL_R	sll 	%r4, %r9, %r16
	.word 0xb2a8c00b  ! 1: ANDNcc_R	andncc 	%r3, %r11, %r25
	.word 0xac092190  ! 1: AND_I	and 	%r4, 0x0190, %r22
	.word 0xba89800b  ! 1: ANDcc_R	andcc 	%r6, %r11, %r29
thr3_resum_intr_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_132), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_132)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8392d07  ! 1: XNOR_I	xnor 	%r4, 0x0d07, %r20
	.word 0xb240ef2c  ! 1: ADDC_I	addc 	%r3, 0x0f2c, %r25
	.word 0xa7643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa489800d  ! 1: ANDcc_R	andcc 	%r6, %r13, %r18
thr3_resum_intr_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_133), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_133)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r30
	.word 0xb881a8e5  ! 1: ADDcc_I	addcc 	%r6, 0x08e5, %r28
	.word 0xb528e001  ! 1: SLL_I	sll 	%r3, 0x0001, %r26
	.word 0xa419c00e  ! 1: XOR_R	xor 	%r7, %r14, %r18
thr3_resum_intr_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_134), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_134)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb530c00a  ! 1: SRL_R	srl 	%r3, %r10, %r26
	.word 0xa939900d  ! 1: SRAX_R	srax	%r6, %r13, %r20
	.word 0xa6b2000a  ! 1: ORNcc_R	orncc 	%r8, %r10, %r19
	.word 0xbec1a6e6  ! 1: ADDCcc_I	addccc 	%r6, 0x06e6, %r31
thr3_resum_intr_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_135), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_135)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbcb0c00f  ! 1: ORNcc_R	orncc 	%r3, %r15, %r30
	.word 0xbd308009  ! 1: SRL_R	srl 	%r2, %r9, %r30
	.word 0xa240e9da  ! 1: ADDC_I	addc 	%r3, 0x09da, %r17
	.word 0xaca9400a  ! 1: ANDNcc_R	andncc 	%r5, %r10, %r22
thr3_resum_intr_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_136), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_136)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb629800d  ! 1: ANDN_R	andn 	%r6, %r13, %r27
	.word 0xb299a698  ! 1: XORcc_I	xorcc 	%r6, 0x0698, %r25
	.word 0xb738900b  ! 1: SRAX_R	srax	%r2, %r11, %r27
	.word 0xab78040e  ! 1: MOVR_R	move	%r0, %r14, %r21
thr3_resum_intr_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_137), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_137)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba812e83  ! 1: ADDcc_I	addcc 	%r4, 0x0e83, %r29
	.word 0xac01c00a  ! 1: ADD_R	add 	%r7, %r10, %r22
	.word 0xb73a0009  ! 1: SRA_R	sra 	%r8, %r9, %r27
	.word 0xb329e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r25
thr3_resum_intr_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_138), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_138)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa99800e  ! 1: XORcc_R	xorcc 	%r6, %r14, %r21
	.word 0xa928d009  ! 1: SLLX_R	sllx	%r3, %r9, %r20
	.word 0xa739800e  ! 1: SRA_R	sra 	%r6, %r14, %r19
	.word 0xab2a3001  ! 1: SLLX_I	sllx	%r8, 0x0001, %r21
thr3_resum_intr_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_139), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_139)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb329000c  ! 1: SLL_R	sll 	%r4, %r12, %r25
	.word 0xb2392607  ! 1: XNOR_I	xnor 	%r4, 0x0607, %r25
	.word 0xaa90e0a8  ! 1: ORcc_I	orcc 	%r3, 0x00a8, %r21
	.word 0xb6b9c00f  ! 1: XNORcc_R	xnorcc 	%r7, %r15, %r27
thr3_resum_intr_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_140), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_140)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf29c00f  ! 1: SLL_R	sll 	%r7, %r15, %r23
	.word 0xbd39800e  ! 1: SRA_R	sra 	%r6, %r14, %r30
	.word 0xb0c0aa71  ! 1: ADDCcc_I	addccc 	%r2, 0x0a71, %r24
	.word 0xa164180c  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_141), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_141)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa899abda  ! 1: XORcc_I	xorcc 	%r6, 0x0bda, %r20
	.word 0xb8816f5c  ! 1: ADDcc_I	addcc 	%r5, 0x0f5c, %r28
	.word 0xba9160e0  ! 1: ORcc_I	orcc 	%r5, 0x00e0, %r29
	.word 0xba40e6a9  ! 1: ADDC_I	addc 	%r3, 0x06a9, %r29
thr3_resum_intr_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_142), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_142)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2c0c00f  ! 1: ADDCcc_R	addccc 	%r3, %r15, %r17
	.word 0xbd29900a  ! 1: SLLX_R	sllx	%r6, %r10, %r30
	.word 0xb6b1eba1  ! 1: ORNcc_I	orncc 	%r7, 0x0ba1, %r27
	.word 0xa838800a  ! 1: XNOR_R	xnor 	%r2, %r10, %r20
thr3_resum_intr_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_143), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_143)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb5316001  ! 1: SRL_I	srl 	%r5, 0x0001, %r26
	.word 0xa5782401  ! 1: MOVR_I	move	%r0, 0x1, %r18
	.word 0xb432000f  ! 1: ORN_R	orn 	%r8, %r15, %r26
	.word 0xb764180d  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_144)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa889400b  ! 1: ANDcc_R	andcc 	%r5, %r11, %r20
	.word 0xa731e001  ! 1: SRL_I	srl 	%r7, 0x0001, %r19
	.word 0xa438800e  ! 1: XNOR_R	xnor 	%r2, %r14, %r18
	.word 0xb739900c  ! 1: SRAX_R	srax	%r6, %r12, %r27
thr3_resum_intr_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_145), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_145)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba8226eb  ! 1: ADDcc_I	addcc 	%r8, 0x06eb, %r29
	.word 0xa4c1c00a  ! 1: ADDCcc_R	addccc 	%r7, %r10, %r18
	.word 0xba416197  ! 1: ADDC_I	addc 	%r5, 0x0197, %r29
	.word 0xb1392001  ! 1: SRA_I	sra 	%r4, 0x0001, %r24
thr3_resum_intr_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_146), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_146)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa91c00e  ! 1: ORcc_R	orcc 	%r7, %r14, %r21
	.word 0xa20a000f  ! 1: AND_R	and 	%r8, %r15, %r17
	.word 0xbd78040b  ! 1: MOVR_R	move	%r0, %r11, %r30
	.word 0xbd39500d  ! 1: SRAX_R	srax	%r5, %r13, %r30
thr3_resum_intr_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_147), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_147)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2b1800a  ! 1: ORNcc_R	orncc 	%r6, %r10, %r17
	.word 0xbe8a2890  ! 1: ANDcc_I	andcc 	%r8, 0x0890, %r31
	.word 0xb764180c  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa739800a  ! 1: SRA_R	sra 	%r6, %r10, %r19
thr3_resum_intr_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_148), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_148)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8b9a5dc  ! 1: XNORcc_I	xnorcc 	%r6, 0x05dc, %r20
	.word 0xa092000e  ! 1: ORcc_R	orcc 	%r8, %r14, %r16
	.word 0xb978040a  ! 1: MOVR_R	move	%r0, %r10, %r28
	.word 0xa2b9000a  ! 1: XNORcc_R	xnorcc 	%r4, %r10, %r17
thr3_resum_intr_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_149)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa09ab50  ! 1: AND_I	and 	%r6, 0x0b50, %r21
	.word 0xb164180b  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa8c14009  ! 1: ADDCcc_R	addccc 	%r5, %r9, %r20
	.word 0xba39400b  ! 1: XNOR_R	xnor 	%r5, %r11, %r29
thr3_resum_intr_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_150), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_150)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaab9800a  ! 1: XNORcc_R	xnorcc 	%r6, %r10, %r21
	.word 0xa729f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r19
	.word 0xb6b1a7a5  ! 1: ORNcc_I	orncc 	%r6, 0x07a5, %r27
	.word 0xa241c00d  ! 1: ADDC_R	addc 	%r7, %r13, %r17
thr3_resum_intr_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_151), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_151)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf29b001  ! 1: SLLX_I	sllx	%r6, 0x0001, %r23
	.word 0xb164180e  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb2b8eaca  ! 1: XNORcc_I	xnorcc 	%r3, 0x0aca, %r25
	.word 0xae39e225  ! 1: XNOR_I	xnor 	%r7, 0x0225, %r23
thr3_resum_intr_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_152), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_152)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa60a2d75  ! 1: AND_I	and 	%r8, 0x0d75, %r19
	.word 0xbb392001  ! 1: SRA_I	sra 	%r4, 0x0001, %r29
	.word 0xab643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb280e1dd  ! 1: ADDcc_I	addcc 	%r3, 0x01dd, %r25
thr3_resum_intr_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_153), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_153)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac90c009  ! 1: ORcc_R	orcc 	%r3, %r9, %r22
	.word 0xaa30ed38  ! 1: ORN_I	orn 	%r3, 0x0d38, %r21
	.word 0xba31400f  ! 1: ORN_R	orn 	%r5, %r15, %r29
	.word 0xa600ef7b  ! 1: ADD_I	add 	%r3, 0x0f7b, %r19
thr3_resum_intr_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_154), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_154)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbaa9c00e  ! 1: ANDNcc_R	andncc 	%r7, %r14, %r29
	.word 0xa601000b  ! 1: ADD_R	add 	%r4, %r11, %r19
	.word 0xb7782401  ! 1: MOVR_I	move	%r0, 0xb, %r27
	.word 0xa928c009  ! 1: SLL_R	sll 	%r3, %r9, %r20
thr3_resum_intr_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_155), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_155)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa72a0009  ! 1: SLL_R	sll 	%r8, %r9, %r19
	.word 0xb131d00c  ! 1: SRLX_R	srlx	%r7, %r12, %r24
	.word 0xac9a000b  ! 1: XORcc_R	xorcc 	%r8, %r11, %r22
	.word 0xb6822486  ! 1: ADDcc_I	addcc 	%r8, 0x0486, %r27
thr3_resum_intr_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_156), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_156)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac312410  ! 1: ORN_I	orn 	%r4, 0x0410, %r22
	.word 0xa6b1e221  ! 1: ORNcc_I	orncc 	%r7, 0x0221, %r19
	.word 0xa231ede7  ! 1: ORN_I	orn 	%r7, 0x0de7, %r17
	.word 0xaa90a4c8  ! 1: ORcc_I	orcc 	%r2, 0x04c8, %r21
thr3_resum_intr_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_157), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_157)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa4c2000e  ! 1: ADDCcc_R	addccc 	%r8, %r14, %r18
	.word 0xbc28a9b4  ! 1: ANDN_I	andn 	%r2, 0x09b4, %r30
	.word 0xa811601e  ! 1: OR_I	or 	%r5, 0x001e, %r20
	.word 0xa819a9e9  ! 1: XOR_I	xor 	%r6, 0x09e9, %r20
thr3_resum_intr_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_158)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb4998009  ! 1: XORcc_R	xorcc 	%r6, %r9, %r26
	.word 0xbb30800a  ! 1: SRL_R	srl 	%r2, %r10, %r29
	.word 0xa7396001  ! 1: SRA_I	sra 	%r5, 0x0001, %r19
thr3_resum_intr_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_159), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_159)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbcb963ae  ! 1: XNORcc_I	xnorcc 	%r5, 0x03ae, %r30
	.word 0xaa09c00e  ! 1: AND_R	and 	%r7, %r14, %r21
	.word 0xa430e0f8  ! 1: ORN_I	orn 	%r3, 0x00f8, %r18
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
thr3_resum_intr_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_160), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_160)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa280c00a  ! 1: ADDcc_R	addcc 	%r3, %r10, %r17
	.word 0xad317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r22
	.word 0xa0a9c00e  ! 1: ANDNcc_R	andncc 	%r7, %r14, %r16
	.word 0xbac0af76  ! 1: ADDCcc_I	addccc 	%r2, 0x0f76, %r29
thr3_resum_intr_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_161), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_161)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa090a8f7  ! 1: ORcc_I	orcc 	%r2, 0x08f7, %r16
	.word 0xb378040f  ! 1: MOVR_R	move	%r0, %r15, %r25
	.word 0xa738e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r19
	.word 0xbc41000a  ! 1: ADDC_R	addc 	%r4, %r10, %r30
thr3_resum_intr_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_162), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_162)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa331500c  ! 1: SRLX_R	srlx	%r5, %r12, %r17
	.word 0xbf31400c  ! 1: SRL_R	srl 	%r5, %r12, %r31
	.word 0xa688e715  ! 1: ANDcc_I	andcc 	%r3, 0x0715, %r19
	.word 0xb131b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r24
thr3_resum_intr_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_163)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb801af28  ! 1: ADD_I	add 	%r6, 0x0f28, %r28
	.word 0xa578040c  ! 1: MOVR_R	move	%r0, %r12, %r18
	.word 0xa238c00a  ! 1: XNOR_R	xnor 	%r3, %r10, %r17
	.word 0xa011e7ee  ! 1: OR_I	or 	%r7, 0x07ee, %r16
thr3_resum_intr_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_164), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_164)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe82000d  ! 1: ADDcc_R	addcc 	%r8, %r13, %r31
	.word 0xa2c0c00f  ! 1: ADDCcc_R	addccc 	%r3, %r15, %r17
	.word 0xb609ae45  ! 1: AND_I	and 	%r6, 0x0e45, %r27
	.word 0xb731a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r27
thr3_resum_intr_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_165), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_165)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac30a272  ! 1: ORN_I	orn 	%r2, 0x0272, %r22
	.word 0xa899c00e  ! 1: XORcc_R	xorcc 	%r7, %r14, %r20
	.word 0xa880800b  ! 1: ADDcc_R	addcc 	%r2, %r11, %r20
	.word 0xb831ab42  ! 1: ORN_I	orn 	%r6, 0x0b42, %r28
thr3_resum_intr_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_166)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf39000f  ! 1: SRA_R	sra 	%r4, %r15, %r23
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaca969c5  ! 1: ANDNcc_I	andncc 	%r5, 0x09c5, %r22
	.word 0xbe31000c  ! 1: ORN_R	orn 	%r4, %r12, %r31
thr3_resum_intr_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_167), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_167)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa529900d  ! 1: SLLX_R	sllx	%r6, %r13, %r18
	.word 0xb2c1800f  ! 1: ADDCcc_R	addccc 	%r6, %r15, %r25
	.word 0xb530d00b  ! 1: SRLX_R	srlx	%r3, %r11, %r26
	.word 0xb2b1ad60  ! 1: ORNcc_I	orncc 	%r6, 0x0d60, %r25
thr3_resum_intr_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_168)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa129e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r16
	.word 0xb139000e  ! 1: SRA_R	sra 	%r4, %r14, %r24
	.word 0xb080e51b  ! 1: ADDcc_I	addcc 	%r3, 0x051b, %r24
	.word 0xa230e57c  ! 1: ORN_I	orn 	%r3, 0x057c, %r17
thr3_resum_intr_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_169), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_169)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc41800c  ! 1: ADDC_R	addc 	%r6, %r12, %r30
	.word 0xba09000b  ! 1: AND_R	and 	%r4, %r11, %r29
	.word 0xb4b22ad7  ! 1: ORNcc_I	orncc 	%r8, 0x0ad7, %r26
	.word 0xb699a1c9  ! 1: XORcc_I	xorcc 	%r6, 0x01c9, %r27
thr3_resum_intr_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_170)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf31b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r31
	.word 0xaa10ae30  ! 1: OR_I	or 	%r2, 0x0e30, %r21
	.word 0xb129800e  ! 1: SLL_R	sll 	%r6, %r14, %r24
	.word 0xb401a373  ! 1: ADD_I	add 	%r6, 0x0373, %r26
thr3_resum_intr_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_171), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_171)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0196ece  ! 1: XOR_I	xor 	%r5, 0x0ece, %r24
	.word 0xae30a699  ! 1: ORN_I	orn 	%r2, 0x0699, %r23
	.word 0xb4122ee7  ! 1: OR_I	or 	%r8, 0x0ee7, %r26
	.word 0xaec1c00f  ! 1: ADDCcc_R	addccc 	%r7, %r15, %r23
thr3_resum_intr_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_172), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_172)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa089c00c  ! 1: ANDcc_R	andcc 	%r7, %r12, %r16
	.word 0xa164180c  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa978040b  ! 1: MOVR_R	move	%r0, %r11, %r20
	.word 0xba41400a  ! 1: ADDC_R	addc 	%r5, %r10, %r29
thr3_resum_intr_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_173), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_173)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa030c00f  ! 1: ORN_R	orn 	%r3, %r15, %r16
	.word 0xb008800d  ! 1: AND_R	and 	%r2, %r13, %r24
	.word 0xbd29500f  ! 1: SLLX_R	sllx	%r5, %r15, %r30
	.word 0xbe11400f  ! 1: OR_R	or 	%r5, %r15, %r31
thr3_resum_intr_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_174), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_174)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xbb30d00c  ! 1: SRLX_R	srlx	%r3, %r12, %r29
	.word 0xaeb0aa47  ! 1: ORNcc_I	orncc 	%r2, 0x0a47, %r23
	.word 0xbd309009  ! 1: SRLX_R	srlx	%r2, %r9, %r30
thr3_resum_intr_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_175)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaea9c00d  ! 1: ANDNcc_R	andncc 	%r7, %r13, %r23
	.word 0xb201c009  ! 1: ADD_R	add 	%r7, %r9, %r25
	.word 0xb930b001  ! 1: SRLX_I	srlx	%r2, 0x0001, %r28
	.word 0xbc19c009  ! 1: XOR_R	xor 	%r7, %r9, %r30
thr3_resum_intr_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_176), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_176)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb610ab98  ! 1: OR_I	or 	%r2, 0x0b98, %r27
	.word 0xa839ab6b  ! 1: XNOR_I	xnor 	%r6, 0x0b6b, %r20
	.word 0xbaaa2cef  ! 1: ANDNcc_I	andncc 	%r8, 0x0cef, %r29
	.word 0xaa28aa88  ! 1: ANDN_I	andn 	%r2, 0x0a88, %r21
thr3_resum_intr_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_177), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_177)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba0a000d  ! 1: AND_R	and 	%r8, %r13, %r29
	.word 0xa001655c  ! 1: ADD_I	add 	%r5, 0x055c, %r16
	.word 0xbf39800d  ! 1: SRA_R	sra 	%r6, %r13, %r31
	.word 0xa5320009  ! 1: SRL_R	srl 	%r8, %r9, %r18
thr3_resum_intr_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_178)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb6192b97  ! 1: XOR_I	xor 	%r4, 0x0b97, %r27
	.word 0xb029e200  ! 1: ANDN_I	andn 	%r7, 0x0200, %r24
	.word 0xb491e544  ! 1: ORcc_I	orcc 	%r7, 0x0544, %r26
	.word 0xb339d00e  ! 1: SRAX_R	srax	%r7, %r14, %r25
thr3_resum_intr_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_179), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_179)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb8c0c00a  ! 1: ADDCcc_R	addccc 	%r3, %r10, %r28
	.word 0xa22a000f  ! 1: ANDN_R	andn 	%r8, %r15, %r17
	.word 0xa009c00c  ! 1: AND_R	and 	%r7, %r12, %r16
	.word 0xb1322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r24
thr3_resum_intr_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_180)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd31a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r30
	.word 0xa731100b  ! 1: SRLX_R	srlx	%r4, %r11, %r19
	.word 0xac312fa4  ! 1: ORN_I	orn 	%r4, 0x0fa4, %r22
	.word 0xbb782401  ! 1: MOVR_I	move	%r0, 0xffffffa4, %r29
thr3_resum_intr_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_181), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_181)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb238ac23  ! 1: XNOR_I	xnor 	%r2, 0x0c23, %r25
	.word 0xb481e9a2  ! 1: ADDcc_I	addcc 	%r7, 0x09a2, %r26
	.word 0xae28c00e  ! 1: ANDN_R	andn 	%r3, %r14, %r23
	.word 0xa2ba2eca  ! 1: XNORcc_I	xnorcc 	%r8, 0x0eca, %r17
thr3_resum_intr_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_182), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_182)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa131a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r16
	.word 0xb978040b  ! 1: MOVR_R	move	%r0, %r11, %r28
	.word 0xb6122bb0  ! 1: OR_I	or 	%r8, 0x0bb0, %r27
	.word 0xb209400e  ! 1: AND_R	and 	%r5, %r14, %r25
thr3_resum_intr_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_183), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_183)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe90a6ae  ! 1: ORcc_I	orcc 	%r2, 0x06ae, %r31
	.word 0xb610e01f  ! 1: OR_I	or 	%r3, 0x001f, %r27
	.word 0xb3641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb338d00d  ! 1: SRAX_R	srax	%r3, %r13, %r25
thr3_resum_intr_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_184), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_184)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb3311009  ! 1: SRLX_R	srlx	%r4, %r9, %r25
	.word 0xa730f001  ! 1: SRLX_I	srlx	%r3, 0x0001, %r19
	.word 0xacb1400b  ! 1: ORNcc_R	orncc 	%r5, %r11, %r22
	.word 0xb0096fbc  ! 1: AND_I	and 	%r5, 0x0fbc, %r24
thr3_resum_intr_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_185), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_185)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb428ecb7  ! 1: ANDN_I	andn 	%r3, 0x0cb7, %r26
	.word 0xaeb08009  ! 1: ORNcc_R	orncc 	%r2, %r9, %r23
	.word 0xb728e001  ! 1: SLL_I	sll 	%r3, 0x0001, %r27
	.word 0xaaa8ea72  ! 1: ANDNcc_I	andncc 	%r3, 0x0a72, %r21
thr3_resum_intr_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_186), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_186)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb029000f  ! 1: ANDN_R	andn 	%r4, %r15, %r24
	.word 0xb331400c  ! 1: SRL_R	srl 	%r5, %r12, %r25
	.word 0xbcb96df6  ! 1: XNORcc_I	xnorcc 	%r5, 0x0df6, %r30
	.word 0xbab9800b  ! 1: XNORcc_R	xnorcc 	%r6, %r11, %r29
thr3_resum_intr_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_187)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2b9000e  ! 1: XNORcc_R	xnorcc 	%r4, %r14, %r25
	.word 0xb89a2fa2  ! 1: XORcc_I	xorcc 	%r8, 0x0fa2, %r28
	.word 0xa8b1e75b  ! 1: ORNcc_I	orncc 	%r7, 0x075b, %r20
	.word 0xb888a1a0  ! 1: ANDcc_I	andcc 	%r2, 0x01a0, %r28
thr3_resum_intr_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_188), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_188)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaf78040b  ! 1: MOVR_R	move	%r0, %r11, %r23
	.word 0xbe31800f  ! 1: ORN_R	orn 	%r6, %r15, %r31
	.word 0xa481400f  ! 1: ADDcc_R	addcc 	%r5, %r15, %r18
	.word 0xa129c00b  ! 1: SLL_R	sll 	%r7, %r11, %r16
thr3_resum_intr_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_189), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_189)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb529e001  ! 1: SLL_I	sll 	%r7, 0x0001, %r26
	.word 0xaec1c00a  ! 1: ADDCcc_R	addccc 	%r7, %r10, %r23
	.word 0xbf30c00b  ! 1: SRL_R	srl 	%r3, %r11, %r31
	.word 0xa931b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r20
thr3_resum_intr_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_190), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_190)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab313001  ! 1: SRLX_I	srlx	%r4, 0x0001, %r21
	.word 0xb0b9800f  ! 1: XNORcc_R	xnorcc 	%r6, %r15, %r24
	.word 0xb4396bbe  ! 1: XNOR_I	xnor 	%r5, 0x0bbe, %r26
	.word 0xb3782401  ! 1: MOVR_I	move	%r0, 0xffffffbe, %r25
thr3_resum_intr_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_191), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_191)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb728900d  ! 1: SLLX_R	sllx	%r2, %r13, %r27
	.word 0xac31c00b  ! 1: ORN_R	orn 	%r7, %r11, %r22
	.word 0xa4b1a5d4  ! 1: ORNcc_I	orncc 	%r6, 0x05d4, %r18
	.word 0xa33a100a  ! 1: SRAX_R	srax	%r8, %r10, %r17
thr3_resum_intr_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_192), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_192)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb0308009  ! 1: ORN_R	orn 	%r2, %r9, %r24
	.word 0xaec14009  ! 1: ADDCcc_R	addccc 	%r5, %r9, %r23
	.word 0xb0a8a67b  ! 1: ANDNcc_I	andncc 	%r2, 0x067b, %r24
	.word 0xb938800f  ! 1: SRA_R	sra 	%r2, %r15, %r28
thr3_resum_intr_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_193)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb8c1eb3d  ! 1: ADDCcc_I	addccc 	%r7, 0x0b3d, %r28
	.word 0xa4b22cc3  ! 1: ORNcc_I	orncc 	%r8, 0x0cc3, %r18
	.word 0xacb9223b  ! 1: XNORcc_I	xnorcc 	%r4, 0x023b, %r22
	.word 0xa490c00b  ! 1: ORcc_R	orcc 	%r3, %r11, %r18
thr3_resum_intr_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_194), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_194)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb39900c  ! 1: SRAX_R	srax	%r6, %r12, %r29
	.word 0xac29000d  ! 1: ANDN_R	andn 	%r4, %r13, %r22
	.word 0xa29162a7  ! 1: ORcc_I	orcc 	%r5, 0x02a7, %r17
	.word 0xb2096e34  ! 1: AND_I	and 	%r5, 0x0e34, %r25
thr3_resum_intr_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_195), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_195)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf641809  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb339900a  ! 1: SRAX_R	srax	%r6, %r10, %r25
	.word 0xad39d00c  ! 1: SRAX_R	srax	%r7, %r12, %r22
	.word 0xb211400d  ! 1: OR_R	or 	%r5, %r13, %r25
thr3_resum_intr_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_196)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb441800a  ! 1: ADDC_R	addc 	%r6, %r10, %r26
	.word 0xb329f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r25
	.word 0xa2a9e902  ! 1: ANDNcc_I	andncc 	%r7, 0x0902, %r17
	.word 0xb338e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r25
thr3_resum_intr_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_197), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_197)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb7294009  ! 1: SLL_R	sll 	%r5, %r9, %r27
	.word 0xacb0eedb  ! 1: ORNcc_I	orncc 	%r3, 0x0edb, %r22
	.word 0xaac18009  ! 1: ADDCcc_R	addccc 	%r6, %r9, %r21
	.word 0xb041000d  ! 1: ADDC_R	addc 	%r4, %r13, %r24
thr3_resum_intr_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_198)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa289c00c  ! 1: ANDcc_R	andcc 	%r7, %r12, %r17
	.word 0xa298800f  ! 1: XORcc_R	xorcc 	%r2, %r15, %r17
	.word 0xaf296001  ! 1: SLL_I	sll 	%r5, 0x0001, %r23
	.word 0xa03a000e  ! 1: XNOR_R	xnor 	%r8, %r14, %r16
thr3_resum_intr_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_199), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_199)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc99a71d  ! 1: XORcc_I	xorcc 	%r6, 0x071d, %r30
	.word 0xba10ea9f  ! 1: OR_I	or 	%r3, 0x0a9f, %r29
	.word 0xa009a9da  ! 1: AND_I	and 	%r6, 0x09da, %r16
	.word 0xba00e849  ! 1: ADD_I	add 	%r3, 0x0849, %r29
thr3_resum_intr_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_200), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_200)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb2a9000f  ! 1: ANDNcc_R	andncc 	%r4, %r15, %r25
	.word 0xbf31a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r31
	.word 0xa378040e  ! 1: MOVR_R	move	%r0, %r14, %r17
	.word 0xbf3a0009  ! 1: SRA_R	sra 	%r8, %r9, %r31
thr3_resum_intr_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_201), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_201)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa8b90009  ! 1: XNORcc_R	xnorcc 	%r4, %r9, %r20
	.word 0xba11000f  ! 1: OR_R	or 	%r4, %r15, %r29
	.word 0xb764180a  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa62a000d  ! 1: ANDN_R	andn 	%r8, %r13, %r19
thr3_resum_intr_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_202), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_202)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb21922c8  ! 1: XOR_I	xor 	%r4, 0x02c8, %r25
	.word 0xa6aa000a  ! 1: ANDNcc_R	andncc 	%r8, %r10, %r19
	.word 0xa4316133  ! 1: ORN_I	orn 	%r5, 0x0133, %r18
	.word 0xacb164cb  ! 1: ORNcc_I	orncc 	%r5, 0x04cb, %r22
thr3_resum_intr_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_203), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_203)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0b1400b  ! 1: ORNcc_R	orncc 	%r5, %r11, %r16
	.word 0xae99ad85  ! 1: XORcc_I	xorcc 	%r6, 0x0d85, %r23
	.word 0xb040af53  ! 1: ADDC_I	addc 	%r2, 0x0f53, %r24
	.word 0xaa10ebf2  ! 1: OR_I	or 	%r3, 0x0bf2, %r21
thr3_resum_intr_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_204)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb528d00d  ! 1: SLLX_R	sllx	%r3, %r13, %r26
	.word 0xa532000c  ! 1: SRL_R	srl 	%r8, %r12, %r18
	.word 0xb2a8a2bd  ! 1: ANDNcc_I	andncc 	%r2, 0x02bd, %r25
	.word 0xaa196309  ! 1: XOR_I	xor 	%r5, 0x0309, %r21
thr3_resum_intr_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_205), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_205)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb699000b  ! 1: XORcc_R	xorcc 	%r4, %r11, %r27
	.word 0xbb31c00d  ! 1: SRL_R	srl 	%r7, %r13, %r29
	.word 0xa828a441  ! 1: ANDN_I	andn 	%r2, 0x0441, %r20
	.word 0xb80a0009  ! 1: AND_R	and 	%r8, %r9, %r28
thr3_resum_intr_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_206)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa1295009  ! 1: SLLX_R	sllx	%r5, %r9, %r16
	.word 0xa801c00a  ! 1: ADD_R	add 	%r7, %r10, %r20
	.word 0xaeba000e  ! 1: XNORcc_R	xnorcc 	%r8, %r14, %r23
	.word 0xa638800b  ! 1: XNOR_R	xnor 	%r2, %r11, %r19
thr3_resum_intr_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_207), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_207)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0010009  ! 1: ADD_R	add 	%r4, %r9, %r16
	.word 0xba28e894  ! 1: ANDN_I	andn 	%r3, 0x0894, %r29
	.word 0xb931e001  ! 1: SRL_I	srl 	%r7, 0x0001, %r28
	.word 0xa764180a  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_208), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_208)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb201c00f  ! 1: ADD_R	add 	%r7, %r15, %r25
	.word 0xbf64180a  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa338a001  ! 1: SRA_I	sra 	%r2, 0x0001, %r17
	.word 0xad31f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r22
thr3_resum_intr_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_209), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_209)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa316528  ! 1: ORN_I	orn 	%r5, 0x0528, %r21
	.word 0xa431c00e  ! 1: ORN_R	orn 	%r7, %r14, %r18
	.word 0xbeb8c009  ! 1: XNORcc_R	xnorcc 	%r3, %r9, %r31
	.word 0xbe01eb95  ! 1: ADD_I	add 	%r7, 0x0b95, %r31
thr3_resum_intr_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_210)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb61929d0  ! 1: XOR_I	xor 	%r4, 0x09d0, %r27
	.word 0xb739a001  ! 1: SRA_I	sra 	%r6, 0x0001, %r27
	.word 0xa131a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r16
thr3_resum_intr_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_211), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_211)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae31000f  ! 1: ORN_R	orn 	%r4, %r15, %r23
	.word 0xa428ebfe  ! 1: ANDN_I	andn 	%r3, 0x0bfe, %r18
	.word 0xbd643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xb6b961ab  ! 1: XNORcc_I	xnorcc 	%r5, 0x01ab, %r27
thr3_resum_intr_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_212)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba1222c6  ! 1: OR_I	or 	%r8, 0x02c6, %r29
	.word 0xbac18009  ! 1: ADDCcc_R	addccc 	%r6, %r9, %r29
	.word 0xbc19c00b  ! 1: XOR_R	xor 	%r7, %r11, %r30
	.word 0xa331c00e  ! 1: SRL_R	srl 	%r7, %r14, %r17
thr3_resum_intr_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_213), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_213)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa2b20009  ! 1: ORNcc_R	orncc 	%r8, %r9, %r17
	.word 0xa130e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r16
	.word 0xb0b1ae07  ! 1: ORNcc_I	orncc 	%r6, 0x0e07, %r24
	.word 0xb3295009  ! 1: SLLX_R	sllx	%r5, %r9, %r25
thr3_resum_intr_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_214), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_214)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa61123b8  ! 1: OR_I	or 	%r4, 0x03b8, %r19
	.word 0xb9782401  ! 1: MOVR_I	move	%r0, 0xffffffb8, %r28
	.word 0xb630c009  ! 1: ORN_R	orn 	%r3, %r9, %r27
	.word 0xa028a413  ! 1: ANDN_I	andn 	%r2, 0x0413, %r16
thr3_resum_intr_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_215), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_215)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbea8c00e  ! 1: ANDNcc_R	andncc 	%r3, %r14, %r31
	.word 0xb8b8e10f  ! 1: XNORcc_I	xnorcc 	%r3, 0x010f, %r28
	.word 0xb011800d  ! 1: OR_R	or 	%r6, %r13, %r24
	.word 0xaf292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r23
thr3_resum_intr_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_216), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_216)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb280800e  ! 1: ADDcc_R	addcc 	%r2, %r14, %r25
	.word 0xb2b1629b  ! 1: ORNcc_I	orncc 	%r5, 0x029b, %r25
	.word 0xa031246e  ! 1: ORN_I	orn 	%r4, 0x046e, %r16
	.word 0xbd396001  ! 1: SRA_I	sra 	%r5, 0x0001, %r30
thr3_resum_intr_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_217), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_217)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb429400f  ! 1: ANDN_R	andn 	%r5, %r15, %r26
	.word 0xb219a3eb  ! 1: XOR_I	xor 	%r6, 0x03eb, %r25
	.word 0xa139500d  ! 1: SRAX_R	srax	%r5, %r13, %r16
	.word 0xb0b12d13  ! 1: ORNcc_I	orncc 	%r4, 0x0d13, %r24
thr3_resum_intr_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_218), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_218)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xac3a000b  ! 1: XNOR_R	xnor 	%r8, %r11, %r22
	.word 0xa4c1000c  ! 1: ADDCcc_R	addccc 	%r4, %r12, %r18
	.word 0xa529f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r18
	.word 0xbe81c00e  ! 1: ADDcc_R	addcc 	%r7, %r14, %r31
thr3_resum_intr_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_219), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_219)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbf39c00a  ! 1: SRA_R	sra 	%r7, %r10, %r31
	.word 0xba18e13e  ! 1: XOR_I	xor 	%r3, 0x013e, %r29
	.word 0xbc81400d  ! 1: ADDcc_R	addcc 	%r5, %r13, %r30
	.word 0xad2a2001  ! 1: SLL_I	sll 	%r8, 0x0001, %r22
thr3_resum_intr_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_220), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_220)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba89a0ce  ! 1: ANDcc_I	andcc 	%r6, 0x00ce, %r29
	.word 0xb130e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r24
	.word 0xae896950  ! 1: ANDcc_I	andcc 	%r5, 0x0950, %r23
	.word 0xb630ac74  ! 1: ORN_I	orn 	%r2, 0x0c74, %r27
thr3_resum_intr_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_221), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_221)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe39400d  ! 1: XNOR_R	xnor 	%r5, %r13, %r31
	.word 0xad30b001  ! 1: SRLX_I	srlx	%r2, 0x0001, %r22
	.word 0xb618a24b  ! 1: XOR_I	xor 	%r2, 0x024b, %r27
	.word 0xb178040f  ! 1: MOVR_R	move	%r0, %r15, %r24
thr3_resum_intr_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_222), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_222)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad3a000f  ! 1: SRA_R	sra 	%r8, %r15, %r22
	.word 0xbb30a001  ! 1: SRL_I	srl 	%r2, 0x0001, %r29
	.word 0xa8096b77  ! 1: AND_I	and 	%r5, 0x0b77, %r20
	.word 0xad782401  ! 1: MOVR_I	move	%r0, 0xffffff77, %r22
thr3_resum_intr_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_223), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_223)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa890c00b  ! 1: ORcc_R	orcc 	%r3, %r11, %r20
	.word 0xbf320009  ! 1: SRL_R	srl 	%r8, %r9, %r31
	.word 0xa890e5c1  ! 1: ORcc_I	orcc 	%r3, 0x05c1, %r20
	.word 0xa2916613  ! 1: ORcc_I	orcc 	%r5, 0x0613, %r17
thr3_resum_intr_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_224), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_224)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbd31d00e  ! 1: SRLX_R	srlx	%r7, %r14, %r30
	.word 0xb529800d  ! 1: SLL_R	sll 	%r6, %r13, %r26
	.word 0xb480800e  ! 1: ADDcc_R	addcc 	%r2, %r14, %r26
	.word 0xbf39100e  ! 1: SRAX_R	srax	%r4, %r14, %r31
thr3_resum_intr_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_225), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_225)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb60a23e8  ! 1: AND_I	and 	%r8, 0x03e8, %r27
	.word 0xa210e09d  ! 1: OR_I	or 	%r3, 0x009d, %r17
	.word 0xae11800c  ! 1: OR_R	or 	%r6, %r12, %r23
	.word 0xba91e0ba  ! 1: ORcc_I	orcc 	%r7, 0x00ba, %r29
thr3_resum_intr_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_226), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_226)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xae01632c  ! 1: ADD_I	add 	%r5, 0x032c, %r23
	.word 0xaa0a28fe  ! 1: AND_I	and 	%r8, 0x08fe, %r21
	.word 0xb6c1695f  ! 1: ADDCcc_I	addccc 	%r5, 0x095f, %r27
	.word 0xab28800a  ! 1: SLL_R	sll 	%r2, %r10, %r21
thr3_resum_intr_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_227), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_227)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb4b10009  ! 1: ORNcc_R	orncc 	%r4, %r9, %r26
	.word 0xa73a100b  ! 1: SRAX_R	srax	%r8, %r11, %r19
	.word 0xa882000d  ! 1: ADDcc_R	addcc 	%r8, %r13, %r20
	.word 0xba820009  ! 1: ADDcc_R	addcc 	%r8, %r9, %r29
thr3_resum_intr_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_228), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_228)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacb9ef28  ! 1: XNORcc_I	xnorcc 	%r7, 0x0f28, %r22
	.word 0xb042000a  ! 1: ADDC_R	addc 	%r8, %r10, %r24
	.word 0xa039800c  ! 1: XNOR_R	xnor 	%r6, %r12, %r16
	.word 0xbe296d59  ! 1: ANDN_I	andn 	%r5, 0x0d59, %r31
thr3_resum_intr_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_229), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_229)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb681ebaf  ! 1: ADDcc_I	addcc 	%r7, 0x0baf, %r27
	.word 0xb331100e  ! 1: SRLX_R	srlx	%r4, %r14, %r25
	.word 0xa8316e16  ! 1: ORN_I	orn 	%r5, 0x0e16, %r20
	.word 0xa328a001  ! 1: SLL_I	sll 	%r2, 0x0001, %r17
thr3_resum_intr_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_230), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_230)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa5292001  ! 1: SLL_I	sll 	%r4, 0x0001, %r18
	.word 0xbc99800b  ! 1: XORcc_R	xorcc 	%r6, %r11, %r30
	.word 0xbac1000c  ! 1: ADDCcc_R	addccc 	%r4, %r12, %r29
	.word 0xab3a0009  ! 1: SRA_R	sra 	%r8, %r9, %r21
thr3_resum_intr_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_231)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb4a9800d  ! 1: ANDNcc_R	andncc 	%r6, %r13, %r26
	.word 0xba01e7ec  ! 1: ADD_I	add 	%r7, 0x07ec, %r29
	.word 0xa819400f  ! 1: XOR_R	xor 	%r5, %r15, %r20
	.word 0xbe91c00d  ! 1: ORcc_R	orcc 	%r7, %r13, %r31
thr3_resum_intr_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_232), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_232)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xad78040f  ! 1: MOVR_R	move	%r0, %r15, %r22
	.word 0xae81800c  ! 1: ADDcc_R	addcc 	%r6, %r12, %r23
	.word 0xb21a000c  ! 1: XOR_R	xor 	%r8, %r12, %r25
	.word 0xb964180a  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_233)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xab38d009  ! 1: SRAX_R	srax	%r3, %r9, %r21
	.word 0xa1314009  ! 1: SRL_R	srl 	%r5, %r9, %r16
	.word 0xb3316001  ! 1: SRL_I	srl 	%r5, 0x0001, %r25
	.word 0xa091000d  ! 1: ORcc_R	orcc 	%r4, %r13, %r16
thr3_resum_intr_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_234), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_234)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb039800a  ! 1: XNOR_R	xnor 	%r6, %r10, %r24
	.word 0xbc288009  ! 1: ANDN_R	andn 	%r2, %r9, %r30
	.word 0xa0c12666  ! 1: ADDCcc_I	addccc 	%r4, 0x0666, %r16
	.word 0xb41968ca  ! 1: XOR_I	xor 	%r5, 0x08ca, %r26
thr3_resum_intr_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_235), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_235)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb218e9be  ! 1: XOR_I	xor 	%r3, 0x09be, %r25
	.word 0xa610c00c  ! 1: OR_R	or 	%r3, %r12, %r19
	.word 0xb4b96fb8  ! 1: XNORcc_I	xnorcc 	%r5, 0x0fb8, %r26
	.word 0xa888af01  ! 1: ANDcc_I	andcc 	%r2, 0x0f01, %r20
thr3_resum_intr_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_236)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb801000d  ! 1: ADD_R	add 	%r4, %r13, %r28
	.word 0xbf64180e  ! 1: MOVcc_R	<illegal instruction>
	.word 0xbb64180d  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa564180e  ! 1: MOVcc_R	<illegal instruction>
thr3_resum_intr_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_237), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_237)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb53a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r26
	.word 0xb130b001  ! 1: SRLX_I	srlx	%r2, 0x0001, %r24
	.word 0xac996c13  ! 1: XORcc_I	xorcc 	%r5, 0x0c13, %r22
	.word 0xb72a000d  ! 1: SLL_R	sll 	%r8, %r13, %r27
thr3_resum_intr_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_238), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_238)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xba18ed2a  ! 1: XOR_I	xor 	%r3, 0x0d2a, %r29
	.word 0xa131100c  ! 1: SRLX_R	srlx	%r4, %r12, %r16
	.word 0xb0a9000e  ! 1: ANDNcc_R	andncc 	%r4, %r14, %r24
	.word 0xbd322001  ! 1: SRL_I	srl 	%r8, 0x0001, %r30
thr3_resum_intr_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_239), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_239)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xaa816c01  ! 1: ADDcc_I	addcc 	%r5, 0x0c01, %r21
	.word 0xb038c00e  ! 1: XNOR_R	xnor 	%r3, %r14, %r24
	.word 0xb439c00f  ! 1: XNOR_R	xnor 	%r7, %r15, %r26
	.word 0xbc30800c  ! 1: ORN_R	orn 	%r2, %r12, %r30
thr3_resum_intr_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_240), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_240)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbe18800d  ! 1: XOR_R	xor 	%r2, %r13, %r31
	.word 0xb891800a  ! 1: ORcc_R	orcc 	%r6, %r10, %r28
	.word 0xaac18009  ! 1: ADDCcc_R	addccc 	%r6, %r9, %r21
	.word 0xa131900b  ! 1: SRLX_R	srlx	%r6, %r11, %r16
thr3_resum_intr_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_241), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_241)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbc91c00f  ! 1: ORcc_R	orcc 	%r7, %r15, %r30
	.word 0xb6b1400c  ! 1: ORNcc_R	orncc 	%r5, %r12, %r27
	.word 0xb018ec69  ! 1: XOR_I	xor 	%r3, 0x0c69, %r24
	.word 0xacb8e59a  ! 1: XNORcc_I	xnorcc 	%r3, 0x059a, %r22
thr3_resum_intr_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_242), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_242)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb499000f  ! 1: XORcc_R	xorcc 	%r4, %r15, %r26
	.word 0xbcb1800e  ! 1: ORNcc_R	orncc 	%r6, %r14, %r30
	.word 0xb400a341  ! 1: ADD_I	add 	%r2, 0x0341, %r26
	.word 0xbc91000b  ! 1: ORcc_R	orcc 	%r4, %r11, %r30
thr3_resum_intr_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_243)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa0c0e87e  ! 1: ADDCcc_I	addccc 	%r3, 0x087e, %r16
	.word 0xac18ed45  ! 1: XOR_I	xor 	%r3, 0x0d45, %r22
	.word 0xae91202e  ! 1: ORcc_I	orcc 	%r4, 0x002e, %r23
	.word 0xaf78040c  ! 1: MOVR_R	move	%r0, %r12, %r23
thr3_resum_intr_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_244), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_244)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xbb31e001  ! 1: SRL_I	srl 	%r7, 0x0001, %r29
	.word 0xb629800a  ! 1: ANDN_R	andn 	%r6, %r10, %r27
	.word 0xa8ba2192  ! 1: XNORcc_I	xnorcc 	%r8, 0x0192, %r20
	.word 0xaaa9400f  ! 1: ANDNcc_R	andncc 	%r5, %r15, %r21
thr3_resum_intr_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_245), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_245)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa128f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r16
	.word 0xb200ad04  ! 1: ADD_I	add 	%r2, 0x0d04, %r25
	.word 0xa80a2530  ! 1: AND_I	and 	%r8, 0x0530, %r20
	.word 0xbe316de2  ! 1: ORN_I	orn 	%r5, 0x0de2, %r31
thr3_resum_intr_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_246), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_246)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb130e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r24
	.word 0xa8196138  ! 1: XOR_I	xor 	%r5, 0x0138, %r20
	.word 0xbd782401  ! 1: MOVR_I	move	%r0, 0x138, %r30
	.word 0xa538c00a  ! 1: SRA_R	sra 	%r3, %r10, %r18
thr3_resum_intr_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_247), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_247)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xa731a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r19
	.word 0xacb0e4aa  ! 1: ORNcc_I	orncc 	%r3, 0x04aa, %r22
	.word 0xb882000b  ! 1: ADDcc_R	addcc 	%r8, %r11, %r28
	.word 0xb0a92b10  ! 1: ANDNcc_I	andncc 	%r4, 0x0b10, %r24
thr3_resum_intr_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_248)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xb009e57b  ! 1: AND_I	and 	%r7, 0x057b, %r24
	.word 0xbcb12342  ! 1: ORNcc_I	orncc 	%r4, 0x0342, %r30
	.word 0xa080800c  ! 1: ADDcc_R	addcc 	%r2, %r12, %r16
	.word 0xbe19c009  ! 1: XOR_R	xor 	%r7, %r9, %r31
thr3_resum_intr_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_249), 16, 16)) -> intp(0, 3, 1)
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_249)+8, 16, 16)) -> intp(1, 3, 1)
	.word 0xacb1c00b  ! 1: ORNcc_R	orncc 	%r7, %r11, %r22
	.word 0xbe80eb45  ! 1: ADDcc_I	addcc 	%r3, 0x0b45, %r31
	.word 0xbc90c009  ! 1: ORcc_R	orcc 	%r3, %r9, %r30
	.word 0xb3317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx  0xd5a7244629ed615f, %r16, %r16
	setx  0x30202e482a7b4d5b, %r16, %r17
	setx  0xd89102c34c668a5e, %r16, %r18
	setx  0x73c8e485410921a4, %r16, %r19
	setx  0xb7a743b8241ea243, %r16, %r20
	setx  0x576be8d16e4017b8, %r16, %r21
	setx  0x3fce62c6f63df71d, %r16, %r22
	setx  0xf02b8a6f122adcbf, %r16, %r23
	setx  0xbe2c322fa899d0c8, %r16, %r24
	setx  0x8286b46d368e54d4, %r16, %r25
	setx  0x46c9bdd409462343, %r16, %r26
	setx  0xf60ca65590803f8e, %r16, %r27
	setx  0x5495ad00ec6d17f1, %r16, %r28
	setx  0xb134792b233be132, %r16, %r29
	setx  0xb34fa10d7233886b, %r16, %r30
	setx  0x18a393df9598c2ed, %r16, %r31
	setx  0x0000000000000550, %r16, %r9
	setx  0x0000000000000570, %r16, %r10
	setx  0x0000000000000670, %r16, %r11
	setx  0x0000000000000b00, %r16, %r12
	setx  0x0000000000000240, %r16, %r13
	setx  0x0000000000000560, %r16, %r14
	setx  0x00000000000000a0, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xaa5221a2  ! 2: UMUL_I	umul 	%r8, 0x01a2, %r21
	.word 0xacd8e007  ! 2: SMULcc_I	smulcc 	%r3, 0x0007, %r22
	.word 0xaa51c00b  ! 2: UMUL_R	umul 	%r7, %r11, %r21
	.word 0xa25a2185  ! 2: SMUL_I	smul 	%r8, 0x0185, %r17
	.word 0xbe592d91  ! 2: SMUL_I	smul 	%r4, 0x0d91, %r31
	.word 0xa521000a  ! 2: MULScc_R	mulscc 	%r4, %r10, %r18
	.word 0xa85228b3  ! 2: UMUL_I	umul 	%r8, 0x08b3, %r20
	.word 0xbcd8aa36  ! 2: SMULcc_I	smulcc 	%r2, 0x0a36, %r30
	.word 0xa2d12c0e  ! 2: UMULcc_I	umulcc 	%r4, 0x0c0e, %r17
	.word 0xb8596a70  ! 2: SMUL_I	smul 	%r5, 0x0a70, %r28
	.word 0xbd22000e  ! 2: MULScc_R	mulscc 	%r8, %r14, %r30
	.word 0xaf21e422  ! 2: MULScc_I	mulscc 	%r7, 0x0422, %r23
	.word 0xaed926be  ! 2: SMULcc_I	smulcc 	%r4, 0x06be, %r23
	.word 0xacd1c00b  ! 2: UMULcc_R	umulcc 	%r7, %r11, %r22
	.word 0xbe59a4e0  ! 2: SMUL_I	smul 	%r6, 0x04e0, %r31
	.word 0xacd8800d  ! 2: SMULcc_R	smulcc 	%r2, %r13, %r22
	.word 0xb0d967c9  ! 2: SMULcc_I	smulcc 	%r5, 0x07c9, %r24
	.word 0xa6d1e455  ! 2: UMULcc_I	umulcc 	%r7, 0x0455, %r19
	.word 0xb651800d  ! 2: UMUL_R	umul 	%r6, %r13, %r27
	.word 0xae49c00a  ! 2: MULX_R	mulx 	%r7, %r10, %r23
	.word 0xa250ec92  ! 2: UMUL_I	umul 	%r3, 0x0c92, %r17
	.word 0xa858a8f5  ! 2: SMUL_I	smul 	%r2, 0x08f5, %r20
	.word 0xb04a2a8b  ! 2: MULX_I	mulx 	%r8, 0x0a8b, %r24
	.word 0xbd22000f  ! 2: MULScc_R	mulscc 	%r8, %r15, %r30
	.word 0xaa59000d  ! 2: SMUL_R	smul 	%r4, %r13, %r21
	.word 0xad214009  ! 2: MULScc_R	mulscc 	%r5, %r9, %r22
	.word 0xaa50c009  ! 2: UMUL_R	umul 	%r3, %r9, %r21
	.word 0xb059c009  ! 2: SMUL_R	smul 	%r7, %r9, %r24
	.word 0xb648800e  ! 2: MULX_R	mulx 	%r2, %r14, %r27
	.word 0xa2d16bdd  ! 2: UMULcc_I	umulcc 	%r5, 0x0bdd, %r17
	.word 0xa9222b68  ! 2: MULScc_I	mulscc 	%r8, 0x0b68, %r20
	.word 0xbad921ee  ! 2: SMULcc_I	smulcc 	%r4, 0x01ee, %r29
	.word 0xac49400c  ! 2: MULX_R	mulx 	%r5, %r12, %r22
	.word 0xb8488009  ! 2: MULX_R	mulx 	%r2, %r9, %r28
	.word 0xac50a235  ! 2: UMUL_I	umul 	%r2, 0x0235, %r22
	.word 0xbc49c009  ! 2: MULX_R	mulx 	%r7, %r9, %r30
	.word 0xa251a642  ! 2: UMUL_I	umul 	%r6, 0x0642, %r17
	.word 0xb8d121d6  ! 2: UMULcc_I	umulcc 	%r4, 0x01d6, %r28
	.word 0xa24a000d  ! 2: MULX_R	mulx 	%r8, %r13, %r17
	.word 0xa2d9400e  ! 2: SMULcc_R	smulcc 	%r5, %r14, %r17
	.word 0xb6d22bf2  ! 2: UMULcc_I	umulcc 	%r8, 0x0bf2, %r27
	.word 0xaed9c00d  ! 2: SMULcc_R	smulcc 	%r7, %r13, %r23
	.word 0xb6d1400d  ! 2: UMULcc_R	umulcc 	%r5, %r13, %r27
	.word 0xb84a000d  ! 2: MULX_R	mulx 	%r8, %r13, %r28
	.word 0xa1212b34  ! 2: MULScc_I	mulscc 	%r4, 0x0b34, %r16
	.word 0xa6d0e334  ! 2: UMULcc_I	umulcc 	%r3, 0x0334, %r19
	.word 0xa721000a  ! 2: MULScc_R	mulscc 	%r4, %r10, %r19
	.word 0xa058e2a8  ! 2: SMUL_I	smul 	%r3, 0x02a8, %r16
	.word 0xa2d8800c  ! 2: SMULcc_R	smulcc 	%r2, %r12, %r17
	.word 0xb4518009  ! 2: UMUL_R	umul 	%r6, %r9, %r26
	.word 0xad21c00b  ! 2: MULScc_R	mulscc 	%r7, %r11, %r22
	.word 0xaed9000c  ! 2: SMULcc_R	smulcc 	%r4, %r12, %r23
	.word 0xa8490009  ! 2: MULX_R	mulx 	%r4, %r9, %r20
	.word 0xae49ade4  ! 2: MULX_I	mulx 	%r6, 0x0de4, %r23
	.word 0xb0d92e91  ! 2: SMULcc_I	smulcc 	%r4, 0x0e91, %r24
	.word 0xb85a2764  ! 2: SMUL_I	smul 	%r8, 0x0764, %r28
	.word 0xa321000c  ! 2: MULScc_R	mulscc 	%r4, %r12, %r17
	.word 0xbad1c00b  ! 2: UMULcc_R	umulcc 	%r7, %r11, %r29
	.word 0xbe58aaea  ! 2: SMUL_I	smul 	%r2, 0x0aea, %r31
	.word 0xb4d0ef92  ! 2: UMULcc_I	umulcc 	%r3, 0x0f92, %r26
	.word 0xbe59800e  ! 2: SMUL_R	smul 	%r6, %r14, %r31
	.word 0xa120800e  ! 2: MULScc_R	mulscc 	%r2, %r14, %r16
	.word 0xa0d22905  ! 2: UMULcc_I	umulcc 	%r8, 0x0905, %r16
	.word 0xa458a665  ! 2: SMUL_I	smul 	%r2, 0x0665, %r18
	.word 0xb720ae69  ! 2: MULScc_I	mulscc 	%r2, 0x0e69, %r27
	.word 0xa72167f5  ! 2: MULScc_I	mulscc 	%r5, 0x07f5, %r19
	.word 0xa659000c  ! 2: SMUL_R	smul 	%r4, %r12, %r19
	.word 0xac48e635  ! 2: MULX_I	mulx 	%r3, 0x0635, %r22
	.word 0xb0d0800f  ! 2: UMULcc_R	umulcc 	%r2, %r15, %r24
	.word 0xbc59e6aa  ! 2: SMUL_I	smul 	%r7, 0x06aa, %r30
	.word 0xb2d8a2c9  ! 2: SMULcc_I	smulcc 	%r2, 0x02c9, %r25
	.word 0xbc58abea  ! 2: SMUL_I	smul 	%r2, 0x0bea, %r30
	.word 0xa0d1800e  ! 2: UMULcc_R	umulcc 	%r6, %r14, %r16
	.word 0xb522000c  ! 2: MULScc_R	mulscc 	%r8, %r12, %r26
	.word 0xaad8eb41  ! 2: SMULcc_I	smulcc 	%r3, 0x0b41, %r21
	.word 0xab212b87  ! 2: MULScc_I	mulscc 	%r4, 0x0b87, %r21
	.word 0xb648c00c  ! 2: MULX_R	mulx 	%r3, %r12, %r27
	.word 0xaa494009  ! 2: MULX_R	mulx 	%r5, %r9, %r21
	.word 0xb2d0800d  ! 2: UMULcc_R	umulcc 	%r2, %r13, %r25
	.word 0xa0d1a6f1  ! 2: UMULcc_I	umulcc 	%r6, 0x06f1, %r16
	.word 0xa050800b  ! 2: UMUL_R	umul 	%r2, %r11, %r16
	.word 0xa4508009  ! 2: UMUL_R	umul 	%r2, %r9, %r18
	.word 0xaad8e071  ! 2: SMULcc_I	smulcc 	%r3, 0x0071, %r21
	.word 0xa251000a  ! 2: UMUL_R	umul 	%r4, %r10, %r17
	.word 0xb8da0009  ! 2: SMULcc_R	smulcc 	%r8, %r9, %r28
	.word 0xaf210009  ! 2: MULScc_R	mulscc 	%r4, %r9, %r23
	.word 0xa2516b0a  ! 2: UMUL_I	umul 	%r5, 0x0b0a, %r17
	.word 0xa321c00d  ! 2: MULScc_R	mulscc 	%r7, %r13, %r17
	.word 0xa0592611  ! 2: SMUL_I	smul 	%r4, 0x0611, %r16
	.word 0xaad1afdc  ! 2: UMULcc_I	umulcc 	%r6, 0x0fdc, %r21
	.word 0xa922000e  ! 2: MULScc_R	mulscc 	%r8, %r14, %r20
	.word 0xa521c00d  ! 2: MULScc_R	mulscc 	%r7, %r13, %r18
	.word 0xb251ad80  ! 2: UMUL_I	umul 	%r6, 0x0d80, %r25
	.word 0xb25a000b  ! 2: SMUL_R	smul 	%r8, %r11, %r25
	.word 0xb051400d  ! 2: UMUL_R	umul 	%r5, %r13, %r24
	.word 0xa8d9e61f  ! 2: SMULcc_I	smulcc 	%r7, 0x061f, %r20
	.word 0xab214009  ! 2: MULScc_R	mulscc 	%r5, %r9, %r21
	.word 0xaed9400d  ! 2: SMULcc_R	smulcc 	%r5, %r13, %r23
	.word 0xbb21c00b  ! 2: MULScc_R	mulscc 	%r7, %r11, %r29
	.word 0xb2d9c00d  ! 2: SMULcc_R	smulcc 	%r7, %r13, %r25
	.word 0xa321800a  ! 2: MULScc_R	mulscc 	%r6, %r10, %r17
	.word 0xa2592f6c  ! 2: SMUL_I	smul 	%r4, 0x0f6c, %r17
	.word 0xb0d960bb  ! 2: SMULcc_I	smulcc 	%r5, 0x00bb, %r24
	.word 0xb0d22efc  ! 2: UMULcc_I	umulcc 	%r8, 0x0efc, %r24
	.word 0xa858c00a  ! 2: SMUL_R	smul 	%r3, %r10, %r20
	.word 0xa6d0eece  ! 2: UMULcc_I	umulcc 	%r3, 0x0ece, %r19
	.word 0xb8592023  ! 2: SMUL_I	smul 	%r4, 0x0023, %r28
	.word 0xb4da20c9  ! 2: SMULcc_I	smulcc 	%r8, 0x00c9, %r26
	.word 0xba59afad  ! 2: SMUL_I	smul 	%r6, 0x0fad, %r29
	.word 0xb4d1400b  ! 2: UMULcc_R	umulcc 	%r5, %r11, %r26
	.word 0xa258c00b  ! 2: SMUL_R	smul 	%r3, %r11, %r17
	.word 0xa84a289d  ! 2: MULX_I	mulx 	%r8, 0x089d, %r20
	.word 0xa059e423  ! 2: SMUL_I	smul 	%r7, 0x0423, %r16
	.word 0xb8d8c009  ! 2: SMULcc_R	smulcc 	%r3, %r9, %r28
	.word 0xa8da000b  ! 2: SMULcc_R	smulcc 	%r8, %r11, %r20
	.word 0xacd1c00f  ! 2: UMULcc_R	umulcc 	%r7, %r15, %r22
	.word 0xa858aec3  ! 2: SMUL_I	smul 	%r2, 0x0ec3, %r20
	.word 0xba51400f  ! 2: UMUL_R	umul 	%r5, %r15, %r29
	.word 0xa851400f  ! 2: UMUL_R	umul 	%r5, %r15, %r20
	.word 0xb258ae14  ! 2: SMUL_I	smul 	%r2, 0x0e14, %r25
	.word 0xa322000c  ! 2: MULScc_R	mulscc 	%r8, %r12, %r17
	.word 0xacd2000c  ! 2: UMULcc_R	umulcc 	%r8, %r12, %r22
	.word 0xb64a2814  ! 2: MULX_I	mulx 	%r8, 0x0814, %r27
	.word 0xa858e31c  ! 2: SMUL_I	smul 	%r3, 0x031c, %r20
	.word 0xb4d2213e  ! 2: UMULcc_I	umulcc 	%r8, 0x013e, %r26
	.word 0xba51800e  ! 2: UMUL_R	umul 	%r6, %r14, %r29
	.word 0xaeda000b  ! 2: SMULcc_R	smulcc 	%r8, %r11, %r23
	.word 0xacda000e  ! 2: SMULcc_R	smulcc 	%r8, %r14, %r22
	.word 0xad21c00a  ! 2: MULScc_R	mulscc 	%r7, %r10, %r22
	.word 0xaa496b3a  ! 2: MULX_I	mulx 	%r5, 0x0b3a, %r21
	.word 0xaa496350  ! 2: MULX_I	mulx 	%r5, 0x0350, %r21
	.word 0xa859800d  ! 2: SMUL_R	smul 	%r6, %r13, %r20
	.word 0xbe51c00c  ! 2: UMUL_R	umul 	%r7, %r12, %r31
	.word 0xb248a6b7  ! 2: MULX_I	mulx 	%r2, 0x06b7, %r25
	.word 0xa659633b  ! 2: SMUL_I	smul 	%r5, 0x033b, %r19
	.word 0xa85a000b  ! 2: SMUL_R	smul 	%r8, %r11, %r20
	.word 0xad22000f  ! 2: MULScc_R	mulscc 	%r8, %r15, %r22
	.word 0xb0d223ef  ! 2: UMULcc_I	umulcc 	%r8, 0x03ef, %r24
	.word 0xbeda2ccd  ! 2: SMULcc_I	smulcc 	%r8, 0x0ccd, %r31
	.word 0xb0d1400e  ! 2: UMULcc_R	umulcc 	%r5, %r14, %r24
	.word 0xba48e17f  ! 2: MULX_I	mulx 	%r3, 0x017f, %r29
	.word 0xbc49c00c  ! 2: MULX_R	mulx 	%r7, %r12, %r30
	.word 0xa051400a  ! 2: UMUL_R	umul 	%r5, %r10, %r16
	.word 0xa8d9400e  ! 2: SMULcc_R	smulcc 	%r5, %r14, %r20
	.word 0xb6da2e8f  ! 2: SMULcc_I	smulcc 	%r8, 0x0e8f, %r27
	.word 0xb8d9e43a  ! 2: SMULcc_I	smulcc 	%r7, 0x043a, %r28
	.word 0xa450a2c3  ! 2: UMUL_I	umul 	%r2, 0x02c3, %r18
	.word 0xb521800b  ! 2: MULScc_R	mulscc 	%r6, %r11, %r26
	.word 0xaad92994  ! 2: SMULcc_I	smulcc 	%r4, 0x0994, %r21
	.word 0xbd214009  ! 2: MULScc_R	mulscc 	%r5, %r9, %r30
	.word 0xb8d0e453  ! 2: UMULcc_I	umulcc 	%r3, 0x0453, %r28
	.word 0xa0d8e066  ! 2: SMULcc_I	smulcc 	%r3, 0x0066, %r16
	.word 0xb720a805  ! 2: MULScc_I	mulscc 	%r2, 0x0805, %r27
	.word 0xa248800e  ! 2: MULX_R	mulx 	%r2, %r14, %r17
	.word 0xb458c00c  ! 2: SMUL_R	smul 	%r3, %r12, %r26
	.word 0xa048800f  ! 2: MULX_R	mulx 	%r2, %r15, %r16
	.word 0xbc58c00b  ! 2: SMUL_R	smul 	%r3, %r11, %r30
	.word 0xbc516d81  ! 2: UMUL_I	umul 	%r5, 0x0d81, %r30
	.word 0xbc58e24f  ! 2: SMUL_I	smul 	%r3, 0x024f, %r30
	.word 0xad22269b  ! 2: MULScc_I	mulscc 	%r8, 0x069b, %r22
	.word 0xa0d8800d  ! 2: SMULcc_R	smulcc 	%r2, %r13, %r16
	.word 0xa921400e  ! 2: MULScc_R	mulscc 	%r5, %r14, %r20
	.word 0xae512d75  ! 2: UMUL_I	umul 	%r4, 0x0d75, %r23
	.word 0xb6514009  ! 2: UMUL_R	umul 	%r5, %r9, %r27
	.word 0xbe51000d  ! 2: UMUL_R	umul 	%r4, %r13, %r31
	.word 0xa6d9000e  ! 2: SMULcc_R	smulcc 	%r4, %r14, %r19
	.word 0xbe5a000c  ! 2: SMUL_R	smul 	%r8, %r12, %r31
	.word 0xbe4a000a  ! 2: MULX_R	mulx 	%r8, %r10, %r31
	.word 0xa322000f  ! 2: MULScc_R	mulscc 	%r8, %r15, %r17
	.word 0xaed9e601  ! 2: SMULcc_I	smulcc 	%r7, 0x0601, %r23
	.word 0xbcd9a5b8  ! 2: SMULcc_I	smulcc 	%r6, 0x05b8, %r30
	.word 0xb2d9800b  ! 2: SMULcc_R	smulcc 	%r6, %r11, %r25
	.word 0xbad1800b  ! 2: UMULcc_R	umulcc 	%r6, %r11, %r29
	.word 0xac51000c  ! 2: UMUL_R	umul 	%r4, %r12, %r22
	.word 0xa658800b  ! 2: SMUL_R	smul 	%r2, %r11, %r19
	.word 0xa451ebc4  ! 2: UMUL_I	umul 	%r7, 0x0bc4, %r18
	.word 0xbed0c00b  ! 2: UMULcc_R	umulcc 	%r3, %r11, %r31
	.word 0xa2596b17  ! 2: SMUL_I	smul 	%r5, 0x0b17, %r17
	.word 0xa2d8abca  ! 2: SMULcc_I	smulcc 	%r2, 0x0bca, %r17
	.word 0xa720c009  ! 2: MULScc_R	mulscc 	%r3, %r9, %r19
	.word 0xb321a470  ! 2: MULScc_I	mulscc 	%r6, 0x0470, %r25
	.word 0xb84a227c  ! 2: MULX_I	mulx 	%r8, 0x027c, %r28
	.word 0xae58a8fe  ! 2: SMUL_I	smul 	%r2, 0x08fe, %r23
	.word 0xb8d9800e  ! 2: SMULcc_R	smulcc 	%r6, %r14, %r28
	.word 0xbe5a20a7  ! 2: SMUL_I	smul 	%r8, 0x00a7, %r31
	.word 0xbed8c00b  ! 2: SMULcc_R	smulcc 	%r3, %r11, %r31
	.word 0xa4d9c00d  ! 2: SMULcc_R	smulcc 	%r7, %r13, %r18
	.word 0xb4d9400f  ! 2: SMULcc_R	smulcc 	%r5, %r15, %r26
	.word 0xa6518009  ! 2: UMUL_R	umul 	%r6, %r9, %r19
	.word 0xba5a276d  ! 2: SMUL_I	smul 	%r8, 0x076d, %r29
	.word 0xb248a2f1  ! 2: MULX_I	mulx 	%r2, 0x02f1, %r25
	.word 0xbad1800a  ! 2: UMULcc_R	umulcc 	%r6, %r10, %r29
	.word 0xb322000f  ! 2: MULScc_R	mulscc 	%r8, %r15, %r25
	.word 0xa4d0c00a  ! 2: UMULcc_R	umulcc 	%r3, %r10, %r18
	.word 0xaada2b3c  ! 2: SMULcc_I	smulcc 	%r8, 0x0b3c, %r21
	.word 0xa4d0e5f0  ! 2: UMULcc_I	umulcc 	%r3, 0x05f0, %r18
	.word 0xbada2fb5  ! 2: SMULcc_I	smulcc 	%r8, 0x0fb5, %r29
	.word 0xbb216ad9  ! 2: MULScc_I	mulscc 	%r5, 0x0ad9, %r29
	.word 0xa04a2797  ! 2: MULX_I	mulx 	%r8, 0x0797, %r16
	.word 0xb2512923  ! 2: UMUL_I	umul 	%r4, 0x0923, %r25
	.word 0xa4d9000b  ! 2: SMULcc_R	smulcc 	%r4, %r11, %r18
	.word 0xa249aa3b  ! 2: MULX_I	mulx 	%r6, 0x0a3b, %r17
	.word 0xb6d96c0d  ! 2: SMULcc_I	smulcc 	%r5, 0x0c0d, %r27
	.word 0xbd2161f6  ! 2: MULScc_I	mulscc 	%r5, 0x01f6, %r30
	.word 0xb8d0e354  ! 2: UMULcc_I	umulcc 	%r3, 0x0354, %r28
	.word 0xbed08009  ! 2: UMULcc_R	umulcc 	%r2, %r9, %r31
	.word 0xb8590009  ! 2: SMUL_R	smul 	%r4, %r9, %r28
	.word 0xb0d0a722  ! 2: UMULcc_I	umulcc 	%r2, 0x0722, %r24
	.word 0xa659eac9  ! 2: SMUL_I	smul 	%r7, 0x0ac9, %r19
	.word 0xa4d1e1f5  ! 2: UMULcc_I	umulcc 	%r7, 0x01f5, %r18
	.word 0xb250c009  ! 2: UMUL_R	umul 	%r3, %r9, %r25
	.word 0xa8d226c0  ! 2: UMULcc_I	umulcc 	%r8, 0x06c0, %r20
	.word 0xb05a000e  ! 2: SMUL_R	smul 	%r8, %r14, %r24
	.word 0xa058c00c  ! 2: SMUL_R	smul 	%r3, %r12, %r16
	.word 0xa051800c  ! 2: UMUL_R	umul 	%r6, %r12, %r16
	.word 0xa6d8c00f  ! 2: SMULcc_R	smulcc 	%r3, %r15, %r19
	.word 0xbcd8a869  ! 2: SMULcc_I	smulcc 	%r2, 0x0869, %r30
	.word 0xad2168e7  ! 2: MULScc_I	mulscc 	%r5, 0x08e7, %r22
	.word 0xb0508009  ! 2: UMUL_R	umul 	%r2, %r9, %r24
	.word 0xac59e323  ! 2: SMUL_I	smul 	%r7, 0x0323, %r22
	.word 0xac51c00b  ! 2: UMUL_R	umul 	%r7, %r11, %r22
	.word 0xa4d8e9a3  ! 2: SMULcc_I	smulcc 	%r3, 0x09a3, %r18
	.word 0xb25123a4  ! 2: UMUL_I	umul 	%r4, 0x03a4, %r25
	.word 0xae48a7da  ! 2: MULX_I	mulx 	%r2, 0x07da, %r23
	.word 0xa320ec82  ! 2: MULScc_I	mulscc 	%r3, 0x0c82, %r17
	.word 0xaed92292  ! 2: SMULcc_I	smulcc 	%r4, 0x0292, %r23
	.word 0xbe49e2ea  ! 2: MULX_I	mulx 	%r7, 0x02ea, %r31
	.word 0xbf22000a  ! 2: MULScc_R	mulscc 	%r8, %r10, %r31
	.word 0xac4969c0  ! 2: MULX_I	mulx 	%r5, 0x09c0, %r22
	.word 0xa050a49b  ! 2: UMUL_I	umul 	%r2, 0x049b, %r16
	.word 0xb849400e  ! 2: MULX_R	mulx 	%r5, %r14, %r28
	.word 0xba49400e  ! 2: MULX_R	mulx 	%r5, %r14, %r29
	.word 0xa251000f  ! 2: UMUL_R	umul 	%r4, %r15, %r17
	.word 0xae52000b  ! 2: UMUL_R	umul 	%r8, %r11, %r23
	.word 0xb6d16a58  ! 2: UMULcc_I	umulcc 	%r5, 0x0a58, %r27
	.word 0xb250800e  ! 2: UMUL_R	umul 	%r2, %r14, %r25
	.word 0xa6d9800c  ! 2: SMULcc_R	smulcc 	%r6, %r12, %r19
	.word 0xa520800d  ! 2: MULScc_R	mulscc 	%r2, %r13, %r18
	.word 0xaed1e35a  ! 2: UMULcc_I	umulcc 	%r7, 0x035a, %r23
	.word 0xbc48800f  ! 2: MULX_R	mulx 	%r2, %r15, %r30
	.word 0xb448800b  ! 2: MULX_R	mulx 	%r2, %r11, %r26
	.word 0xa2d962a6  ! 2: SMULcc_I	smulcc 	%r5, 0x02a6, %r17
	.word 0xa45965ce  ! 2: SMUL_I	smul 	%r5, 0x05ce, %r18
	.word 0xa321800f  ! 2: MULScc_R	mulscc 	%r6, %r15, %r17
	.word 0xa32168c5  ! 2: MULScc_I	mulscc 	%r5, 0x08c5, %r17
	.word 0xac58c00f  ! 2: SMUL_R	smul 	%r3, %r15, %r22
	.word 0xae59ac9f  ! 2: SMUL_I	smul 	%r6, 0x0c9f, %r23
	.word 0xa121c00c  ! 2: MULScc_R	mulscc 	%r7, %r12, %r16
	.word 0xb648aa04  ! 2: MULX_I	mulx 	%r2, 0x0a04, %r27
	.word 0xa920c009  ! 2: MULScc_R	mulscc 	%r3, %r9, %r20
	.word 0xa4d9400f  ! 2: SMULcc_R	smulcc 	%r5, %r15, %r18
	.word 0xa2d8c00b  ! 2: SMULcc_R	smulcc 	%r3, %r11, %r17
	.word 0xbc50800e  ! 2: UMUL_R	umul 	%r2, %r14, %r30
	.word 0xa449a300  ! 2: MULX_I	mulx 	%r6, 0x0300, %r18
	.word 0xaf212249  ! 2: MULScc_I	mulscc 	%r4, 0x0249, %r23
	.word 0xa321000b  ! 2: MULScc_R	mulscc 	%r4, %r11, %r17
	.word 0xa659000a  ! 2: SMUL_R	smul 	%r4, %r10, %r19
	.word 0xa6d12c6a  ! 2: UMULcc_I	umulcc 	%r4, 0x0c6a, %r19
	.word 0xae51400d  ! 2: UMUL_R	umul 	%r5, %r13, %r23
	.word 0xa0d1684a  ! 2: UMULcc_I	umulcc 	%r5, 0x084a, %r16
	.word 0xb4d2000c  ! 2: UMULcc_R	umulcc 	%r8, %r12, %r26
	.word 0xb4d0a1c4  ! 2: UMULcc_I	umulcc 	%r2, 0x01c4, %r26
	.word 0xacd9e101  ! 2: SMULcc_I	smulcc 	%r7, 0x0101, %r22
	.word 0xa0d20009  ! 2: UMULcc_R	umulcc 	%r8, %r9, %r16
	.word 0xb251e3b9  ! 2: UMUL_I	umul 	%r7, 0x03b9, %r25
	.word 0xb2d9800f  ! 2: SMULcc_R	smulcc 	%r6, %r15, %r25
	.word 0xb049000f  ! 2: MULX_R	mulx 	%r4, %r15, %r24
	.word 0xb049a691  ! 2: MULX_I	mulx 	%r6, 0x0691, %r24
	.word 0xaada000f  ! 2: SMULcc_R	smulcc 	%r8, %r15, %r21
	.word 0xbc496acd  ! 2: MULX_I	mulx 	%r5, 0x0acd, %r30
	.word 0xbb20e02c  ! 2: MULScc_I	mulscc 	%r3, 0x002c, %r29
	.word 0xaad10009  ! 2: UMULcc_R	umulcc 	%r4, %r9, %r21
	.word 0xa0d1c00a  ! 2: UMULcc_R	umulcc 	%r7, %r10, %r16
	.word 0xb6d9abd6  ! 2: SMULcc_I	smulcc 	%r6, 0x0bd6, %r27
	.word 0xab21800b  ! 2: MULScc_R	mulscc 	%r6, %r11, %r21
	.word 0xb8da000f  ! 2: SMULcc_R	smulcc 	%r8, %r15, %r28
	.word 0xbc49c00a  ! 2: MULX_R	mulx 	%r7, %r10, %r30
	.word 0xa6d9606e  ! 2: SMULcc_I	smulcc 	%r5, 0x006e, %r19
	.word 0xbe51400f  ! 2: UMUL_R	umul 	%r5, %r15, %r31
	.word 0xb459ab48  ! 2: SMUL_I	smul 	%r6, 0x0b48, %r26
	.word 0xad21c00a  ! 2: MULScc_R	mulscc 	%r7, %r10, %r22
	.word 0xa0598009  ! 2: SMUL_R	smul 	%r6, %r9, %r16
	.word 0xaf22000a  ! 2: MULScc_R	mulscc 	%r8, %r10, %r23
	.word 0xb2d0c00e  ! 2: UMULcc_R	umulcc 	%r3, %r14, %r25
	.word 0xb8d2000b  ! 2: UMULcc_R	umulcc 	%r8, %r11, %r28
	.word 0xba518009  ! 2: UMUL_R	umul 	%r6, %r9, %r29
	.word 0xac48e9d5  ! 2: MULX_I	mulx 	%r3, 0x09d5, %r22
	.word 0xa65929f5  ! 2: SMUL_I	smul 	%r4, 0x09f5, %r19
	.word 0xaed0e236  ! 2: UMULcc_I	umulcc 	%r3, 0x0236, %r23
	.word 0xa8d10009  ! 2: UMULcc_R	umulcc 	%r4, %r9, %r20
	.word 0xbcd92c3c  ! 2: SMULcc_I	smulcc 	%r4, 0x0c3c, %r30
	.word 0xae5163bd  ! 2: UMUL_I	umul 	%r5, 0x03bd, %r23
	.word 0xb8d0e6c0  ! 2: UMULcc_I	umulcc 	%r3, 0x06c0, %r28
	.word 0xb8d2000a  ! 2: UMULcc_R	umulcc 	%r8, %r10, %r28
	.word 0xb8d9800e  ! 2: SMULcc_R	smulcc 	%r6, %r14, %r28
	.word 0xa259a785  ! 2: SMUL_I	smul 	%r6, 0x0785, %r17
	.word 0xbe52000f  ! 2: UMUL_R	umul 	%r8, %r15, %r31
	.word 0xa6d9c00d  ! 2: SMULcc_R	smulcc 	%r7, %r13, %r19
	.word 0xa4d9000f  ! 2: SMULcc_R	smulcc 	%r4, %r15, %r18
	.word 0xa449000f  ! 2: MULX_R	mulx 	%r4, %r15, %r18
	.word 0xa6d0e4d6  ! 2: UMULcc_I	umulcc 	%r3, 0x04d6, %r19
	.word 0xb320c00d  ! 2: MULScc_R	mulscc 	%r3, %r13, %r25
	.word 0xa321a536  ! 2: MULScc_I	mulscc 	%r6, 0x0536, %r17
	.word 0xad212d2c  ! 2: MULScc_I	mulscc 	%r4, 0x0d2c, %r22
	.word 0xb720e4c9  ! 2: MULScc_I	mulscc 	%r3, 0x04c9, %r27
	.word 0xb6d98009  ! 2: SMULcc_R	smulcc 	%r6, %r9, %r27
	.word 0xae58c00b  ! 2: SMUL_R	smul 	%r3, %r11, %r23
	.word 0xacd0800d  ! 2: UMULcc_R	umulcc 	%r2, %r13, %r22
	.word 0xbcd0a582  ! 2: UMULcc_I	umulcc 	%r2, 0x0582, %r30
	.word 0xbc492f70  ! 2: MULX_I	mulx 	%r4, 0x0f70, %r30
	.word 0xb0518009  ! 2: UMUL_R	umul 	%r6, %r9, %r24
	.word 0xbad1c00d  ! 2: UMULcc_R	umulcc 	%r7, %r13, %r29
	.word 0xb321ed08  ! 2: MULScc_I	mulscc 	%r7, 0x0d08, %r25
	.word 0xa0d0e2e1  ! 2: UMULcc_I	umulcc 	%r3, 0x02e1, %r16
	.word 0xa859c00f  ! 2: SMUL_R	smul 	%r7, %r15, %r20
	.word 0xbb21c00f  ! 2: MULScc_R	mulscc 	%r7, %r15, %r29
	.word 0xa0d22c88  ! 2: UMULcc_I	umulcc 	%r8, 0x0c88, %r16
	.word 0xa848c00e  ! 2: MULX_R	mulx 	%r3, %r14, %r20
	.word 0xa922000d  ! 2: MULScc_R	mulscc 	%r8, %r13, %r20
	.word 0xb859c00b  ! 2: SMUL_R	smul 	%r7, %r11, %r28
	.word 0xb248aba7  ! 2: MULX_I	mulx 	%r2, 0x0ba7, %r25
	.word 0xaa59000e  ! 2: SMUL_R	smul 	%r4, %r14, %r21
	.word 0xae58c00c  ! 2: SMUL_R	smul 	%r3, %r12, %r23
	.word 0xb052000f  ! 2: UMUL_R	umul 	%r8, %r15, %r24
	.word 0xa459800a  ! 2: SMUL_R	smul 	%r6, %r10, %r18
	.word 0xb6d0800a  ! 2: UMULcc_R	umulcc 	%r2, %r10, %r27
	.word 0xbc59400f  ! 2: SMUL_R	smul 	%r5, %r15, %r30
	.word 0xb45a000d  ! 2: SMUL_R	smul 	%r8, %r13, %r26
	.word 0xbed0afc0  ! 2: UMULcc_I	umulcc 	%r2, 0x0fc0, %r31
	.word 0xa648ac9e  ! 2: MULX_I	mulx 	%r2, 0x0c9e, %r19
	.word 0xa0596569  ! 2: SMUL_I	smul 	%r5, 0x0569, %r16
	.word 0xaed9800a  ! 2: SMULcc_R	smulcc 	%r6, %r10, %r23
	.word 0xb650aad6  ! 2: UMUL_I	umul 	%r2, 0x0ad6, %r27
	.word 0xa6d0a4fd  ! 2: UMULcc_I	umulcc 	%r2, 0x04fd, %r19
	.word 0xa858800a  ! 2: SMUL_R	smul 	%r2, %r10, %r20
	.word 0xbd2124e2  ! 2: MULScc_I	mulscc 	%r4, 0x04e2, %r30
	.word 0xaed0eb89  ! 2: UMULcc_I	umulcc 	%r3, 0x0b89, %r23
	.word 0xae59800e  ! 2: SMUL_R	smul 	%r6, %r14, %r23
	.word 0xa44969bf  ! 2: MULX_I	mulx 	%r5, 0x09bf, %r18
	.word 0xbeda238c  ! 2: SMULcc_I	smulcc 	%r8, 0x038c, %r31
	.word 0xb459400e  ! 2: SMUL_R	smul 	%r5, %r14, %r26
	.word 0xaa58800c  ! 2: SMUL_R	smul 	%r2, %r12, %r21
	.word 0xaad0800c  ! 2: UMULcc_R	umulcc 	%r2, %r12, %r21
	.word 0xacd1ea41  ! 2: UMULcc_I	umulcc 	%r7, 0x0a41, %r22
	.word 0xae5960df  ! 2: SMUL_I	smul 	%r5, 0x00df, %r23
	.word 0xb8d96c6e  ! 2: SMULcc_I	smulcc 	%r5, 0x0c6e, %r28
	.word 0xa0d8800e  ! 2: SMULcc_R	smulcc 	%r2, %r14, %r16
	.word 0xbb21800f  ! 2: MULScc_R	mulscc 	%r6, %r15, %r29
	.word 0xa851000e  ! 2: UMUL_R	umul 	%r4, %r14, %r20
	.word 0xa5212c50  ! 2: MULScc_I	mulscc 	%r4, 0x0c50, %r18
	.word 0xa848c00e  ! 2: MULX_R	mulx 	%r3, %r14, %r20
	.word 0xa0d9400c  ! 2: SMULcc_R	smulcc 	%r5, %r12, %r16
	.word 0xaed965b1  ! 2: SMULcc_I	smulcc 	%r5, 0x05b1, %r23
	.word 0xa249400f  ! 2: MULX_R	mulx 	%r5, %r15, %r17
	.word 0xac49800b  ! 2: MULX_R	mulx 	%r6, %r11, %r22
	.word 0xb4d0800f  ! 2: UMULcc_R	umulcc 	%r2, %r15, %r26
	.word 0xae522a12  ! 2: UMUL_I	umul 	%r8, 0x0a12, %r23
	.word 0xa2d8800f  ! 2: SMULcc_R	smulcc 	%r2, %r15, %r17
	.word 0xb321efa4  ! 2: MULScc_I	mulscc 	%r7, 0x0fa4, %r25
	.word 0xa8d9400c  ! 2: SMULcc_R	smulcc 	%r5, %r12, %r20
	.word 0xbed12dd1  ! 2: UMULcc_I	umulcc 	%r4, 0x0dd1, %r31
	.word 0xa2d98009  ! 2: SMULcc_R	smulcc 	%r6, %r9, %r17
	.word 0xba59622e  ! 2: SMUL_I	smul 	%r5, 0x022e, %r29
	.word 0xa849c00a  ! 2: MULX_R	mulx 	%r7, %r10, %r20
	.word 0xb0d9800f  ! 2: SMULcc_R	smulcc 	%r6, %r15, %r24
	.word 0xaed8c00f  ! 2: SMULcc_R	smulcc 	%r3, %r15, %r23
	.word 0xbcd94009  ! 2: SMULcc_R	smulcc 	%r5, %r9, %r30
	.word 0xb458800b  ! 2: SMUL_R	smul 	%r2, %r11, %r26
	.word 0xba48a398  ! 2: MULX_I	mulx 	%r2, 0x0398, %r29
	.word 0xa249e9e1  ! 2: MULX_I	mulx 	%r7, 0x09e1, %r17
	.word 0xb259ef10  ! 2: SMUL_I	smul 	%r7, 0x0f10, %r25
	.word 0xaad9c00f  ! 2: SMULcc_R	smulcc 	%r7, %r15, %r21
	.word 0xa2d1e34c  ! 2: UMULcc_I	umulcc 	%r7, 0x034c, %r17
	.word 0xb921a542  ! 2: MULScc_I	mulscc 	%r6, 0x0542, %r28
	.word 0xb8492fbb  ! 2: MULX_I	mulx 	%r4, 0x0fbb, %r28
	.word 0xb649ebfb  ! 2: MULX_I	mulx 	%r7, 0x0bfb, %r27
	.word 0xb721291d  ! 2: MULScc_I	mulscc 	%r4, 0x091d, %r27
	.word 0xbe51800c  ! 2: UMUL_R	umul 	%r6, %r12, %r31
	.word 0xba51800a  ! 2: UMUL_R	umul 	%r6, %r10, %r29
	.word 0xb051c00e  ! 2: UMUL_R	umul 	%r7, %r14, %r24
	.word 0xbf20a400  ! 2: MULScc_I	mulscc 	%r2, 0x0400, %r31
	.word 0xbad961cc  ! 2: SMULcc_I	smulcc 	%r5, 0x01cc, %r29
	.word 0xa8596c16  ! 2: SMUL_I	smul 	%r5, 0x0c16, %r20
	.word 0xbc49c00e  ! 2: MULX_R	mulx 	%r7, %r14, %r30
	.word 0xa7222a4d  ! 2: MULScc_I	mulscc 	%r8, 0x0a4d, %r19
	.word 0xb4d8ace7  ! 2: SMULcc_I	smulcc 	%r2, 0x0ce7, %r26
	.word 0xae48a952  ! 2: MULX_I	mulx 	%r2, 0x0952, %r23
	.word 0xb458800a  ! 2: SMUL_R	smul 	%r2, %r10, %r26
	.word 0xa251800d  ! 2: UMUL_R	umul 	%r6, %r13, %r17
	.word 0xaed08009  ! 2: UMULcc_R	umulcc 	%r2, %r9, %r23
	.word 0xaad0e4ab  ! 2: UMULcc_I	umulcc 	%r3, 0x04ab, %r21
	.word 0xb3220009  ! 2: MULScc_R	mulscc 	%r8, %r9, %r25
	.word 0xb3222725  ! 2: MULScc_I	mulscc 	%r8, 0x0725, %r25
	.word 0xaad9e93a  ! 2: SMULcc_I	smulcc 	%r7, 0x093a, %r21
	.word 0xb521000f  ! 2: MULScc_R	mulscc 	%r4, %r15, %r26
	.word 0xbcd12c1c  ! 2: UMULcc_I	umulcc 	%r4, 0x0c1c, %r30
	.word 0xbe5a000b  ! 2: SMUL_R	smul 	%r8, %r11, %r31
	.word 0xa922000f  ! 2: MULScc_R	mulscc 	%r8, %r15, %r20
	.word 0xa051681e  ! 2: UMUL_I	umul 	%r5, 0x081e, %r16
	.word 0xb320c00b  ! 2: MULScc_R	mulscc 	%r3, %r11, %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0x885642e168fa06a4, %r16, %r16
	setx  0x73c530f3c83d567a, %r16, %r17
	setx  0xa45cd988b3b75122, %r16, %r18
	setx  0xd43b6f180b22ac44, %r16, %r19
	setx  0x5486f6448e18d603, %r16, %r20
	setx  0x9494ebcde77b48ca, %r16, %r21
	setx  0x344fd3f891672523, %r16, %r22
	setx  0x0ac8e7e732d8e298, %r16, %r23
	setx  0x9f6d71b6daa8c28e, %r16, %r24
	setx  0x27ac609a4863148d, %r16, %r25
	setx  0xe2f130f34fb4736a, %r16, %r26
	setx  0x9c45f9cc06c9e15e, %r16, %r27
	setx  0x8d18784ba567cccd, %r16, %r28
	setx  0x2d5df4c65496918e, %r16, %r29
	setx  0x86864ae3546f35a3, %r16, %r30
	setx  0x6cf3364a1bd0595b, %r16, %r31
	setx  0x0000000000000c60, %r16, %r9
	setx  0x00000000000000f0, %r16, %r10
	setx  0x0000000000000390, %r16, %r11
	setx  0x00000000000004e0, %r16, %r12
	setx  0x00000000000003f0, %r16, %r13
	setx  0x0000000000000a00, %r16, %r14
	setx  0x0000000000000700, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
.align 0x8
	.word 0x30800003  ! 3: BA	ba,a	<label_0x3>
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xea28ac3e  ! 5: STB_I	stb	%r21, [%r2 + 0x0c3e]
	.word 0xb631800a  ! 7: SUBC_R	orn 	%r6, %r10, %r27
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xa6d1400a  ! 10: UMULcc_R	umulcc 	%r5, %r10, %r19
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xae90c00f  ! 13: ORcc_R	orcc 	%r3, %r15, %r23
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,28)
	.word 0xfc40c000  ! 16: LDSW_R	ldsw	[%r3 + %r0], %r30
	.word 0xb2a1e576  ! 19: SUBcc_I	subcc 	%r7, 0x0576, %r25
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xa251000d  ! 22: UMUL_R	umul 	%r4, %r13, %r17
	.word 0xa010800d  ! 24: OR_R	or 	%r2, %r13, %r16
	.word 0xa7396001  ! 24: SRA_I	sra 	%r5, 0x0001, %r19
	.word 0xb2a8c00b  ! 24: ANDNcc_R	andncc 	%r3, %r11, %r25
	.word 0xa339500c  ! 24: SRAX_R	srax	%r5, %r12, %r17
	.word 0xaa89e95f  ! 24: ANDcc_I	andcc 	%r7, 0x095f, %r21
	.word 0xa0a92561  ! 25: ANDNcc_I	andncc 	%r4, 0x0561, %r16
	.word 0xbd31c00e  ! 25: SRL_R	srl 	%r7, %r14, %r30
	.word 0xbe81800e  ! 25: ADDcc_R	addcc 	%r6, %r14, %r31
	.word 0xb6892f5e  ! 26: ANDcc_I	andcc 	%r4, 0x0f5e, %r27
	.word 0xaf2a0009  ! 26: SLL_R	sll 	%r8, %r9, %r23
	.word 0xac392511  ! 26: XNOR_I	xnor 	%r4, 0x0511, %r22
	.word 0xbb3a100e  ! 26: SRAX_R	srax	%r8, %r14, %r29
	.word 0xbe1a2c49  ! 26: XOR_I	xor 	%r8, 0x0c49, %r31
	.word 0xb4b9612d  ! 27: XNORcc_I	xnorcc 	%r5, 0x012d, %r26
	.word 0xb018a2ee  ! 27: XOR_I	xor 	%r2, 0x02ee, %r24
	.word 0xa2192b2f  ! 27: XOR_I	xor 	%r4, 0x0b2f, %r17
.align 0x8
	.word 0x30800003  ! 28: BA	ba,a	<label_0x3>
	.word 0xf800c009  ! 30: LDUW_R	lduw	[%r3 + %r9], %r28
	.word 0xab29d009  ! 32: SLLX_R	sllx	%r7, %r9, %r21
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,IR_NIR,26,13)
	.word 0xb251aa9f  ! 35: UMUL_I	umul 	%r6, 0x0a9f, %r25
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xbf3a3001  ! 38: SRAX_I	srax	%r8, 0x0001, %r31
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,27)
	.word 0xec414000  ! 41: LDSW_R	ldsw	[%r5 + %r0], %r22
	.word 0xa688aaeb  ! 44: ANDcc_I	andcc 	%r2, 0x0aeb, %r19
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,3,11)
	.word 0xb249800c  ! 47: MULX_R	mulx 	%r6, %r12, %r25
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,43)
	.word 0xf2018000  ! 50: LDUW_R	lduw	[%r6 + %r0], %r25
	.word 0xa82a000f  ! 53: ANDN_R	andn 	%r8, %r15, %r20
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,NIR,x,20)
	.word 0xbad2000c  ! 56: UMULcc_R	umulcc 	%r8, %r12, %r29
	.word 0xb21a0009  ! 58: XOR_R	xor 	%r8, %r9, %r25
	.word 0xb9323001  ! 58: SRLX_I	srlx	%r8, 0x0001, %r28
	.word 0xa699400a  ! 58: XORcc_R	xorcc 	%r5, %r10, %r19
	.word 0xa739e001  ! 59: SRA_I	sra 	%r7, 0x0001, %r19
	.word 0xa738900b  ! 59: SRAX_R	srax	%r2, %r11, %r19
	.word 0xa131800d  ! 59: SRL_R	srl 	%r6, %r13, %r16
	.word 0xb090800d  ! 60: ORcc_R	orcc 	%r2, %r13, %r24
	.word 0xae89c00c  ! 60: ANDcc_R	andcc 	%r7, %r12, %r23
	.word 0xb130f001  ! 60: SRLX_I	srlx	%r3, 0x0001, %r24
	.word 0xbc19277c  ! 60: XOR_I	xor 	%r4, 0x077c, %r30
	.word 0xa408c00d  ! 60: AND_R	and 	%r3, %r13, %r18
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xf8222b88  ! 62: STW_I	stw	%r28, [%r8 + 0x0b88]
	.word 0xbe31800c  ! 65: ORN_R	orn 	%r6, %r12, %r31
	.word 0xa8192e33  ! 67: XOR_I	xor 	%r4, 0x0e33, %r20
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,IR_NIR,21,6)
	.word 0xb65a2932  ! 70: SMUL_I	smul 	%r8, 0x0932, %r27
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,58)
	.word 0xf6018000  ! 73: LDUW_R	lduw	[%r6 + %r0], %r27
	.word 0xb888c00c  ! 76: ANDcc_R	andcc 	%r3, %r12, %r28
	.word 0xa450effa  ! 79: UMUL_I	umul 	%r3, 0x0ffa, %r18
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xaac1a2f2  ! 82: ADDCcc_I	addccc 	%r6, 0x02f2, %r21
	.word 0xb8a8e8e6  ! 85: ANDNcc_I	andncc 	%r3, 0x08e6, %r28
	.word 0xb73a2001  ! 87: SRA_I	sra 	%r8, 0x0001, %r27
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xb4596948  ! 90: SMUL_I	smul 	%r5, 0x0948, %r26
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xad30e001  ! 93: SRL_I	srl 	%r3, 0x0001, %r22
	.word 0xa6b8c00a  ! 96: XNORcc_R	xnorcc 	%r3, %r10, %r19
	.word 0xb20a000a  ! 98: AND_R	and 	%r8, %r10, %r25
	.word 0xae51000d  ! 101: UMUL_R	umul 	%r4, %r13, %r23
	.word 0xa290c00e  ! 103: ORcc_R	orcc 	%r3, %r14, %r17
	.word 0xa4b8aadd  ! 103: XNORcc_I	xnorcc 	%r2, 0x0add, %r18
	.word 0xac016dce  ! 103: ADD_I	add 	%r5, 0x0dce, %r22
	.word 0xa6c1a846  ! 103: ADDCcc_I	addccc 	%r6, 0x0846, %r19
	.word 0xb1292001  ! 103: SLL_I	sll 	%r4, 0x0001, %r24
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,41)
	.word 0xf4108000  ! 105: LDUH_R	lduh	[%r2 + %r0], %r26
	.word 0xbca1acf9  ! 108: SUBcc_I	subcc 	%r6, 0x0cf9, %r30
	.word 0xb250e763  ! 111: UMUL_I	umul 	%r3, 0x0763, %r25
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xb6b22315  ! 114: ORNcc_I	orncc 	%r8, 0x0315, %r27
.align 0x8
	.word 0x30800003  ! 116: BA	ba,a	<label_0x3>
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xf830a206  ! 118: STH_I	sth	%r28, [%r2 + 0x0206]
	.word 0xaca129d8  ! 120: SUBcc_I	subcc 	%r4, 0x09d8, %r22
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR_NIR,7,8)
	.word 0xa4d9400a  ! 123: SMULcc_R	smulcc 	%r5, %r10, %r18
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR_NIR,30,9)
	.word 0xb1389009  ! 126: SRAX_R	srax	%r2, %r9, %r24
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfe21ec6c  ! 129: STW_I	stw	%r31, [%r7 + 0x0c6c]
	.word 0xb891a98c  ! 132: ORcc_I	orcc 	%r6, 0x098c, %r28
	.word 0xb6c0e4b5  ! 134: ADDCcc_I	addccc 	%r3, 0x04b5, %r27
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,NIR,x,27)
	.word 0xacd0800d  ! 137: UMULcc_R	umulcc 	%r2, %r13, %r22
.align 0x8
	.word 0x30800003  ! 139: BA	ba,a	<label_0x3>
	.word 0xf009260b  ! 141: LDUB_I	ldub	[%r4 + 0x060b], %r24
	.word 0xaa8122d0  ! 143: ADDcc_I	addcc 	%r4, 0x02d0, %r21
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR_NIR,30,14)
	.word 0xb0d16fa7  ! 146: UMULcc_I	umulcc 	%r5, 0x0fa7, %r24
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,NIR,x,14)
	.word 0xaea0e4d3  ! 149: SUBcc_I	subcc 	%r3, 0x04d3, %r23
	.word 0xea016f74  ! 152: LDUW_I	lduw	[%r5 + 0x0f74], %r21
	.word 0xac50e9e4  ! 155: UMUL_I	umul 	%r3, 0x09e4, %r22
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xb8312b13  ! 158: ORN_I	orn 	%r4, 0x0b13, %r28
	.word 0xb6a9800a  ! 160: ANDNcc_R	andncc 	%r6, %r10, %r27
	.word 0xb808c00e  ! 160: AND_R	and 	%r3, %r14, %r28
	.word 0xb3313001  ! 160: SRLX_I	srlx	%r4, 0x0001, %r25
	.word 0xab31d009  ! 160: SRLX_R	srlx	%r7, %r9, %r21
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xee28e36c  ! 162: STB_I	stb	%r23, [%r3 + 0x036c]
	.word 0xa28a2b70  ! 165: ANDcc_I	andcc 	%r8, 0x0b70, %r17
	.word 0xb040a151  ! 167: ADDC_I	addc 	%r2, 0x0151, %r24
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xb3216817  ! 170: MULScc_I	mulscc 	%r5, 0x0817, %r25
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,31)
	.word 0xe8420000  ! 173: LDSW_R	ldsw	[%r8 + %r0], %r20
	.word 0xa7317061  ! 176: SRLX_I	srlx	%r5, 0x0021, %r19
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,26,18)
	.word 0xa8d9a162  ! 179: SMULcc_I	smulcc 	%r6, 0x0162, %r20
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,0)
	.word 0xe4494000  ! 182: LDSB_R	ldsb	[%r5 + %r0], %r18
	.word 0xbe38e0fe  ! 185: XNOR_I	xnor 	%r3, 0x00fe, %r31
	.word 0xb2d0eb3e  ! 188: UMULcc_I	umulcc 	%r3, 0x0b3e, %r25
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xa9643801  ! 191: MOVcc_I	<illegal instruction>
	.word 0xb8b22560  ! 193: ORNcc_I	orncc 	%r8, 0x0560, %r28
	.word 0xb5643801  ! 193: MOVcc_I	<illegal instruction>
	.word 0xb4b1ec54  ! 193: ORNcc_I	orncc 	%r7, 0x0c54, %r26
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xe43123b6  ! 195: STH_I	sth	%r18, [%r4 + 0x03b6]
	.word 0xaab1217d  ! 198: ORNcc_I	orncc 	%r4, 0x017d, %r21
	.word 0xb030800a  ! 200: SUBC_R	orn 	%r2, %r10, %r24
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,IR_NIR,16,16)
	.word 0xa4d8aa4a  ! 203: SMULcc_I	smulcc 	%r2, 0x0a4a, %r18
	.word 0xb329500f  ! 205: SLLX_R	sllx	%r5, %r15, %r25
	.word 0xb0a8c00d  ! 205: ANDNcc_R	andncc 	%r3, %r13, %r24
	.word 0xb9643801  ! 205: MOVcc_I	<illegal instruction>
	.word 0xbab92c61  ! 206: XNORcc_I	xnorcc 	%r4, 0x0c61, %r29
	.word 0xbaa9800e  ! 206: ANDNcc_R	andncc 	%r6, %r14, %r29
	.word 0xa401e72a  ! 206: ADD_I	add 	%r7, 0x072a, %r18
	.word 0xa5782401  ! 206: MOVR_I	move	%r0, 0xffffffe0, %r18
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xe22a274d  ! 209: STB_I	stb	%r17, [%r8 + 0x074d]
	.word 0xacc0c069  ! 212: ADDCcc_R	addccc 	%r3, %r9, %r22
	.word 0xa164180c  ! 214: MOVcc_R	<illegal instruction>
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,NIR,x,32)
	.word 0xad20a21b  ! 217: MULScc_I	mulscc 	%r2, 0x021b, %r22
.align 0x8
	.word 0x30800003  ! 219: BA	ba,a	<label_0x3>
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xf871ab40  ! 221: STX_I	stx	%r28, [%r6 + 0x0b40]
	.word 0xa178040e  ! 223: MOVR_R	move	%r0, %r14, %r16
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,IR_NIR,6,25)
	.word 0xa059c00d  ! 226: SMUL_R	smul 	%r7, %r13, %r16
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,9,28)
	.word 0xaaa9400e  ! 229: ANDNcc_R	andncc 	%r5, %r14, %r21
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,7)
	.word 0xf441c000  ! 232: LDSW_R	ldsw	[%r7 + %r0], %r26
	.word 0xb564186f  ! 235: MOVcc_R	<illegal instruction>
	.word 0xa858e562  ! 238: SMUL_I	smul 	%r3, 0x0562, %r20
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xbe18c00f  ! 241: XOR_R	xor 	%r3, %r15, %r31
.align 0x8
	.word 0x30800003  ! 243: BA	ba,a	<label_0x3>
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xee71ad50  ! 245: STX_I	stx	%r23, [%r6 + 0x0d50]
	.word 0xb1782401  ! 247: MOVR_I	move	%r0, 0x7fffbdc0, %r24
thr1_ic_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xab20800f  ! 250: MULScc_R	mulscc 	%r2, %r15, %r21
thr1_ic_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,29,6)
	.word 0xaa11800f  ! 253: OR_R	or 	%r6, %r15, %r21
.align 0x8
	.word 0x30800003  ! 255: BA	ba,a	<label_0x3>
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xfc19c00e  ! 257: LDD_R	ldd	[%r7 + %r14], %r30
	.word 0xbe28c00d  ! 259: ANDN_R	andn 	%r3, %r13, %r31
thr1_ic_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,IR_NIR,23,28)
	.word 0xb452000b  ! 262: UMUL_R	umul 	%r8, %r11, %r26
thr1_ic_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,IR_NIR,13,25)
	.word 0xbab92363  ! 265: XNORcc_I	xnorcc 	%r4, 0x0363, %r29
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,46)
	.word 0xea520000  ! 268: LDSH_R	ldsh	[%r8 + %r0], %r21
	.word 0xa9297061  ! 271: SLLX_I	sllx	%r5, 0x0021, %r20
	.word 0xacd9400d  ! 274: SMULcc_R	smulcc 	%r5, %r13, %r22
thr1_ic_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,IR_NIR,32,14)
	.word 0xab30b001  ! 277: SRLX_I	srlx	%r2, 0x0001, %r21
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xb621c00a  ! 280: SUB_R	sub 	%r7, %r10, %r27
	.word 0xa22a000f  ! 283: ANDN_R	andn 	%r8, %r15, %r17
	.word 0xae314009  ! 285: SUBC_R	orn 	%r5, %r9, %r23
thr1_ic_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_29), 16, 16),1,IC_DATA,IR_NIR,33,29)
	.word 0xb25a000c  ! 288: SMUL_R	smul 	%r8, %r12, %r25
	.word 0xb241800d  ! 290: ADDC_R	addc 	%r6, %r13, %r25
	.word 0xbc10e32e  ! 290: OR_I	or 	%r3, 0x032e, %r30
	.word 0xbf30f001  ! 290: SRLX_I	srlx	%r3, 0x0001, %r31
	.word 0xac11edc4  ! 290: OR_I	or 	%r7, 0x0dc4, %r22
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,11)
	.word 0xf2420000  ! 292: LDSW_R	ldsw	[%r8 + %r0], %r25
	.word 0xa6a1220a  ! 295: SUBcc_I	subcc 	%r4, 0x020a, %r19
thr1_ic_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_30), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xa120e9c1  ! 298: MULScc_I	mulscc 	%r3, 0x09c1, %r16
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xbe29aad2  ! 301: ANDN_I	andn 	%r6, 0x0ad2, %r31
	.word 0xa010c009  ! 304: OR_R	or 	%r3, %r9, %r16
	.word 0xb608800d  ! 306: AND_R	and 	%r2, %r13, %r27
thr1_ic_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_31), 16, 16),1,IC_DATA,IR_NIR,9,9)
	.word 0xae5129be  ! 309: UMUL_I	umul 	%r4, 0x09be, %r23
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,26)
	.word 0xf4108000  ! 312: LDUH_R	lduh	[%r2 + %r0], %r26
	.word 0xba822e3a  ! 315: ADDcc_I	addcc 	%r8, 0x0e3a, %r29
	.word 0xa6d1e791  ! 318: UMULcc_I	umulcc 	%r7, 0x0791, %r19
.align 0x8
	.word 0x30800003  ! 320: BA	ba,a	<label_0x3>
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xe229298f  ! 322: STB_I	stb	%r17, [%r4 + 0x098f]
	.word 0xbb64180f  ! 324: MOVcc_R	<illegal instruction>
thr1_ic_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_32), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xaf22000a  ! 327: MULScc_R	mulscc 	%r8, %r10, %r23
thr1_ic_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_33), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xa0b14009  ! 330: ORNcc_R	orncc 	%r5, %r9, %r16
	.word 0xf821274c  ! 333: STW_I	stw	%r28, [%r4 + 0x074c]
	.word 0xbe30aa6a  ! 336: ORN_I	orn 	%r2, 0x0a6a, %r31
	.word 0xbaa9a585  ! 338: ANDNcc_I	andncc 	%r6, 0x0585, %r29
	.word 0xbc50800d  ! 341: UMUL_R	umul 	%r2, %r13, %r30
.align 0x8
	.word 0x30800003  ! 343: BA	ba,a	<label_0x3>
	.word 0xfa20e757  ! 345: STW_I	stw	%r29, [%r3 + 0x0757]
	.word 0xa2b221cd  ! 347: ORNcc_I	orncc 	%r8, 0x01cd, %r17
thr1_ic_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_34), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xb520c00c  ! 350: MULScc_R	mulscc 	%r3, %r12, %r26
thr1_ic_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_35), 16, 16),1,IC_DATA,IR_NIR,24,13)
	.word 0xa178040c  ! 353: MOVR_R	move	%r0, %r12, %r16
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xec3128a6  ! 356: STH_I	sth	%r22, [%r4 + 0x08a6]
	.word 0xbb31500b  ! 359: SRLX_R	srlx	%r5, %r11, %r29
	.word 0xbec10009  ! 361: ADDCcc_R	addccc 	%r4, %r9, %r31
thr1_ic_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_36), 16, 16),1,IC_DATA,IR_NIR,27,31)
	.word 0xb048a66d  ! 364: MULX_I	mulx 	%r2, 0x066d, %r24
	.word 0xac41c009  ! 366: ADDC_R	addc 	%r7, %r9, %r22
	.word 0xaca9ad84  ! 366: ANDNcc_I	andncc 	%r6, 0x0d84, %r22
	.word 0xa329f001  ! 366: SLLX_I	sllx	%r7, 0x0001, %r17
	.word 0xa338d00b  ! 366: SRAX_R	srax	%r3, %r11, %r17
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,20)
	.word 0xf2590000  ! 368: LDX_R	ldx	[%r4 + %r0], %r25
	.word 0xa132100a  ! 371: SRLX_R	srlx	%r8, %r10, %r16
	.word 0xba49e750  ! 374: MULX_I	mulx 	%r7, 0x0750, %r29
thr1_ic_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_37), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xb8a9800f  ! 377: ANDNcc_R	andncc 	%r6, %r15, %r28
.align 0x8
	.word 0x30800003  ! 379: BA	ba,a	<label_0x3>
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xe828eba0  ! 381: STB_I	stb	%r20, [%r3 + 0x0ba0]
	.word 0xa800a97d  ! 383: ADD_I	add 	%r2, 0x097d, %r20
thr1_ic_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_38), 16, 16),1,IC_DATA,NIR,x,7)
	.word 0xa2d1c00d  ! 386: UMULcc_R	umulcc 	%r7, %r13, %r17
thr1_ic_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_39), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xb9782401  ! 389: MOVR_I	move	%r0, 0x7fffbdc0, %r28
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xe028e93b  ! 392: STB_I	stb	%r16, [%r3 + 0x093b]
	.word 0xad317001  ! 395: SRLX_I	srlx	%r5, 0x0001, %r22
	.word 0xa338f001  ! 397: SRAX_I	srax	%r3, 0x0001, %r17
thr1_ic_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_40), 16, 16),1,IC_DATA,IR_NIR,18,30)
	.word 0xb259c009  ! 400: SMUL_R	smul 	%r7, %r9, %r25
	.word 0xe2322fd2  ! 403: STH_I	sth	%r17, [%r8 + 0x0fd2]
	.word 0xae41806e  ! 406: ADDC_R	addc 	%r6, %r14, %r23
	.word 0xbc98c00d  ! 408: XORcc_R	xorcc 	%r3, %r13, %r30
	.word 0xb8596b11  ! 411: SMUL_I	smul 	%r5, 0x0b11, %r28
thr1_ic_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_41), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xb1643801  ! 414: MOVcc_I	<illegal instruction>
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xf671ecc0  ! 417: STX_I	stx	%r27, [%r7 + 0x0cc0]
	.word 0xb9316001  ! 420: SRL_I	srl 	%r5, 0x0001, %r28
	.word 0xb531b001  ! 422: SRLX_I	srlx	%r6, 0x0001, %r26
thr1_ic_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_42), 16, 16),1,IC_DATA,IR_NIR,1,27)
	.word 0xb2d9400e  ! 425: SMULcc_R	smulcc 	%r5, %r14, %r25
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,69)
	.word 0xec018000  ! 428: LDUW_R	lduw	[%r6 + %r0], %r22
	.word 0xa578046e  ! 431: MOVR_R	move	%r0, %r14, %r18
thr1_ic_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_43), 16, 16),1,IC_DATA,IR_NIR,4,17)
	.word 0xa5216dbd  ! 434: MULScc_I	mulscc 	%r5, 0x0dbd, %r18
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,15)
	.word 0xf0194000  ! 437: LDD_R	ldd	[%r5 + %r0], %r24
	.word 0xb7317061  ! 440: SRLX_I	srlx	%r5, 0x0021, %r27
thr1_ic_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_44), 16, 16),1,IC_DATA,NIR,x,33)
	.word 0xa250800f  ! 443: UMUL_R	umul 	%r2, %r15, %r17
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xb2a2000c  ! 446: SUBcc_R	subcc 	%r8, %r12, %r25
	.word 0xb412006f  ! 449: OR_R	or 	%r8, %r15, %r26
	.word 0xb6b8eb65  ! 451: XNORcc_I	xnorcc 	%r3, 0x0b65, %r27
	.word 0xbc50ae59  ! 454: UMUL_I	umul 	%r2, 0x0e59, %r30
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,58)
	.word 0xfe494000  ! 457: LDSB_R	ldsb	[%r5 + %r0], %r31
	.word 0xbc99e0b7  ! 460: XORcc_I	xorcc 	%r7, 0x00b7, %r30
thr1_ic_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_45), 16, 16),1,IC_DATA,IR,6,x)
	.word 0xae58afeb  ! 463: SMUL_I	smul 	%r2, 0x0feb, %r23
.align 0x8
	.word 0x30800003  ! 465: BA	ba,a	<label_0x3>
	.word 0xf819c00d  ! 467: LDD_R	ldd	[%r7 + %r13], %r28
	.word 0xbd643801  ! 469: MOVcc_I	<illegal instruction>
thr1_ic_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_46), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xad20800a  ! 472: MULScc_R	mulscc 	%r2, %r10, %r22
thr1_ic_err_47:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_47), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xb431800c  ! 475: SUBC_R	orn 	%r6, %r12, %r26
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,54)
	.word 0xe411c000  ! 478: LDUH_R	lduh	[%r7 + %r0], %r18
	.word 0xb0988069  ! 481: XORcc_R	xorcc 	%r2, %r9, %r24
	.word 0xae5a26cd  ! 484: SMUL_I	smul 	%r8, 0x06cd, %r23
thr1_ic_err_48:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_48), 16, 16),1,IC_DATA,IR_NIR,30,18)
	.word 0xbd31e001  ! 487: SRL_I	srl 	%r7, 0x0001, %r30
	.word 0xb52a0009  ! 489: SLL_R	sll 	%r8, %r9, %r26
	.word 0xac98ab7d  ! 489: XORcc_I	xorcc 	%r2, 0x0b7d, %r22
	.word 0xa481800a  ! 489: ADDcc_R	addcc 	%r6, %r10, %r18
	.word 0xa418ead3  ! 489: XOR_I	xor 	%r3, 0x0ad3, %r18
	.word 0xa441400f  ! 489: ADDC_R	addc 	%r5, %r15, %r18
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,33)
	.word 0xee088000  ! 491: LDUB_R	ldub	[%r2 + %r0], %r23
	.word 0xa331c00d  ! 494: SRL_R	srl 	%r7, %r13, %r17
	.word 0xbf21ab25  ! 497: MULScc_I	mulscc 	%r6, 0x0b25, %r31
thr1_ic_err_49:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_49), 16, 16),1,IC_DATA,IR,6,x)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x2c084f5398d069f7, %r16, %r16
	setx  0xbc8f3d211cee4e8d, %r16, %r17
	setx  0x24d18501fcbad83d, %r16, %r18
	setx  0x310dcac24203f7a5, %r16, %r19
	setx  0x3139fa035178240c, %r16, %r20
	setx  0xa176dc885a1d64a2, %r16, %r21
	setx  0xa950da23f0568296, %r16, %r22
	setx  0x74e45168128050bb, %r16, %r23
	setx  0x0ecf51f9a41973e2, %r16, %r24
	setx  0x5c7af9a0a85de668, %r16, %r25
	setx  0x6ba0c1c3b64c9d4c, %r16, %r26
	setx  0x2fd4253b5c8e9d0c, %r16, %r27
	setx  0xe113c46e4c8c8bbb, %r16, %r28
	setx  0x444ebbf54fb118a1, %r16, %r29
	setx  0xe5b400d75b0ec92f, %r16, %r30
	setx  0xea537b484e8430a3, %r16, %r31
	setx  0x00000000000007b0, %r16, %r9
	setx  0x0000000000000d60, %r16, %r10
	setx  0x0000000000000ed0, %r16, %r11
	setx  0x0000000000000250, %r16, %r12
	setx  0x0000000000000470, %r16, %r13
	setx  0x00000000000005f0, %r16, %r14
	setx  0x0000000000000a00, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
.align 0x8
	.word 0x30800003  ! 3: BA	ba,a	<label_0x3>
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xfa292fd6  ! 5: STB_I	stb	%r29, [%r4 + 0x0fd6]
	.word 0xb831800d  ! 7: SUBC_R	orn 	%r6, %r13, %r28
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xb8d2000d  ! 10: UMULcc_R	umulcc 	%r8, %r13, %r28
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xbc90c00f  ! 13: ORcc_R	orcc 	%r3, %r15, %r30
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,28)
	.word 0xfc40c000  ! 16: LDSW_R	ldsw	[%r3 + %r0], %r30
	.word 0xa6a1e67a  ! 19: SUBcc_I	subcc 	%r7, 0x067a, %r19
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xa650800e  ! 22: UMUL_R	umul 	%r2, %r14, %r19
	.word 0xb412000a  ! 24: OR_R	or 	%r8, %r10, %r26
	.word 0xbf38e001  ! 24: SRA_I	sra 	%r3, 0x0001, %r31
	.word 0xa6a9400c  ! 24: ANDNcc_R	andncc 	%r5, %r12, %r19
	.word 0xb139900e  ! 24: SRAX_R	srax	%r6, %r14, %r24
	.word 0xba89e0e8  ! 24: ANDcc_I	andcc 	%r7, 0x00e8, %r29
	.word 0xa8a9a0b6  ! 25: ANDNcc_I	andncc 	%r6, 0x00b6, %r20
	.word 0xb931800a  ! 25: SRL_R	srl 	%r6, %r10, %r28
	.word 0xb081c00c  ! 25: ADDcc_R	addcc 	%r7, %r12, %r24
	.word 0xbc8a2560  ! 26: ANDcc_I	andcc 	%r8, 0x0560, %r30
	.word 0xb929800e  ! 26: SLL_R	sll 	%r6, %r14, %r28
	.word 0xbe39a93e  ! 26: XNOR_I	xnor 	%r6, 0x093e, %r31
	.word 0xa939900e  ! 26: SRAX_R	srax	%r6, %r14, %r20
	.word 0xba19a83e  ! 26: XOR_I	xor 	%r6, 0x083e, %r29
	.word 0xb0b8e43c  ! 27: XNORcc_I	xnorcc 	%r3, 0x043c, %r24
	.word 0xae18a29b  ! 27: XOR_I	xor 	%r2, 0x029b, %r23
	.word 0xb419a5ee  ! 27: XOR_I	xor 	%r6, 0x05ee, %r26
.align 0x8
	.word 0x30800003  ! 28: BA	ba,a	<label_0x3>
	.word 0xfe00c00b  ! 30: LDUW_R	lduw	[%r3 + %r11], %r31
	.word 0xa928d00f  ! 32: SLLX_R	sllx	%r3, %r15, %r20
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR_NIR,26,13)
	.word 0xa450ad0b  ! 35: UMUL_I	umul 	%r2, 0x0d0b, %r18
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xad397001  ! 38: SRAX_I	srax	%r5, 0x0001, %r22
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,27)
	.word 0xec414000  ! 41: LDSW_R	ldsw	[%r5 + %r0], %r22
	.word 0xb8892c7f  ! 44: ANDcc_I	andcc 	%r4, 0x0c7f, %r28
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,3,11)
	.word 0xb249800e  ! 47: MULX_R	mulx 	%r6, %r14, %r25
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,43)
	.word 0xf2018000  ! 50: LDUW_R	lduw	[%r6 + %r0], %r25
	.word 0xa429800b  ! 53: ANDN_R	andn 	%r6, %r11, %r18
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,NIR,x,20)
	.word 0xacd1400e  ! 56: UMULcc_R	umulcc 	%r5, %r14, %r22
	.word 0xa019400a  ! 58: XOR_R	xor 	%r5, %r10, %r16
	.word 0xa3323001  ! 58: SRLX_I	srlx	%r8, 0x0001, %r17
	.word 0xb899800d  ! 58: XORcc_R	xorcc 	%r6, %r13, %r28
	.word 0xaf38e001  ! 59: SRA_I	sra 	%r3, 0x0001, %r23
	.word 0xb939d00e  ! 59: SRAX_R	srax	%r7, %r14, %r28
	.word 0xb731000d  ! 59: SRL_R	srl 	%r4, %r13, %r27
	.word 0xb490800c  ! 60: ORcc_R	orcc 	%r2, %r12, %r26
	.word 0xb489000b  ! 60: ANDcc_R	andcc 	%r4, %r11, %r26
	.word 0xb7313001  ! 60: SRLX_I	srlx	%r4, 0x0001, %r27
	.word 0xb21a246c  ! 60: XOR_I	xor 	%r8, 0x046c, %r25
	.word 0xa2088009  ! 60: AND_R	and 	%r2, %r9, %r17
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xf22121c8  ! 62: STW_I	stw	%r25, [%r4 + 0x01c8]
	.word 0xa230c009  ! 65: ORN_R	orn 	%r3, %r9, %r17
	.word 0xba19e8ef  ! 67: XOR_I	xor 	%r7, 0x08ef, %r29
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR_NIR,21,6)
	.word 0xb659a0dd  ! 70: SMUL_I	smul 	%r6, 0x00dd, %r27
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,58)
	.word 0xf6018000  ! 73: LDUW_R	lduw	[%r6 + %r0], %r27
	.word 0xb0894009  ! 76: ANDcc_R	andcc 	%r5, %r9, %r24
	.word 0xa0516709  ! 79: UMUL_I	umul 	%r5, 0x0709, %r16
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xaac1ec21  ! 82: ADDCcc_I	addccc 	%r7, 0x0c21, %r21
	.word 0xaaaa2efe  ! 85: ANDNcc_I	andncc 	%r8, 0x0efe, %r21
	.word 0xb538a001  ! 87: SRA_I	sra 	%r2, 0x0001, %r26
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xa859e71e  ! 90: SMUL_I	smul 	%r7, 0x071e, %r20
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xb7316001  ! 93: SRL_I	srl 	%r5, 0x0001, %r27
	.word 0xa8b9c00a  ! 96: XNORcc_R	xnorcc 	%r7, %r10, %r20
	.word 0xa009c00c  ! 98: AND_R	and 	%r7, %r12, %r16
	.word 0xb4514009  ! 101: UMUL_R	umul 	%r5, %r9, %r26
	.word 0xa291c00e  ! 103: ORcc_R	orcc 	%r7, %r14, %r17
	.word 0xb0b9a474  ! 103: XNORcc_I	xnorcc 	%r6, 0x0474, %r24
	.word 0xa600a349  ! 103: ADD_I	add 	%r2, 0x0349, %r19
	.word 0xb8c1a868  ! 103: ADDCcc_I	addccc 	%r6, 0x0868, %r28
	.word 0xb528a001  ! 103: SLL_I	sll 	%r2, 0x0001, %r26
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,41)
	.word 0xf4108000  ! 105: LDUH_R	lduh	[%r2 + %r0], %r26
	.word 0xb4a1e2b6  ! 108: SUBcc_I	subcc 	%r7, 0x02b6, %r26
	.word 0xac522237  ! 111: UMUL_I	umul 	%r8, 0x0237, %r22
thr0_ic_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xa0b16122  ! 114: ORNcc_I	orncc 	%r5, 0x0122, %r16
.align 0x8
	.word 0x30800003  ! 116: BA	ba,a	<label_0x3>
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xf630e63e  ! 118: STH_I	sth	%r27, [%r3 + 0x063e]
	.word 0xbca1e217  ! 120: SUBcc_I	subcc 	%r7, 0x0217, %r30
thr0_ic_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_10), 16, 16),1,IC_DATA,IR_NIR,7,8)
	.word 0xb2d9000c  ! 123: SMULcc_R	smulcc 	%r4, %r12, %r25
thr0_ic_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_11), 16, 16),1,IC_DATA,IR_NIR,30,9)
	.word 0xbd39d00f  ! 126: SRAX_R	srax	%r7, %r15, %r30
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfe21aa88  ! 129: STW_I	stw	%r31, [%r6 + 0x0a88]
	.word 0xa6912a66  ! 132: ORcc_I	orcc 	%r4, 0x0a66, %r19
	.word 0xbec1ea8d  ! 134: ADDCcc_I	addccc 	%r7, 0x0a8d, %r31
thr0_ic_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_12), 16, 16),1,IC_DATA,NIR,x,27)
	.word 0xa8d18009  ! 137: UMULcc_R	umulcc 	%r6, %r9, %r20
.align 0x8
	.word 0x30800003  ! 139: BA	ba,a	<label_0x3>
	.word 0xe0092e73  ! 141: LDUB_I	ldub	[%r4 + 0x0e73], %r16
	.word 0xbc80a1a1  ! 143: ADDcc_I	addcc 	%r2, 0x01a1, %r30
thr0_ic_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_13), 16, 16),1,IC_DATA,IR_NIR,30,14)
	.word 0xa6d16d4a  ! 146: UMULcc_I	umulcc 	%r5, 0x0d4a, %r19
thr0_ic_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_14), 16, 16),1,IC_DATA,NIR,x,14)
	.word 0xb8a0e562  ! 149: SUBcc_I	subcc 	%r3, 0x0562, %r28
	.word 0xfe022224  ! 152: LDUW_I	lduw	[%r8 + 0x0224], %r31
	.word 0xae50a695  ! 155: UMUL_I	umul 	%r2, 0x0695, %r23
thr0_ic_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_15), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xa430aef1  ! 158: ORN_I	orn 	%r2, 0x0ef1, %r18
	.word 0xb0a8c009  ! 160: ANDNcc_R	andncc 	%r3, %r9, %r24
	.word 0xb209000c  ! 160: AND_R	and 	%r4, %r12, %r25
	.word 0xa9323001  ! 160: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0xb531900f  ! 160: SRLX_R	srlx	%r6, %r15, %r26
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xf229a5e3  ! 162: STB_I	stb	%r25, [%r6 + 0x05e3]
	.word 0xb0892ef0  ! 165: ANDcc_I	andcc 	%r4, 0x0ef0, %r24
	.word 0xbe4121b9  ! 167: ADDC_I	addc 	%r4, 0x01b9, %r31
thr0_ic_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_16), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xa9222f4c  ! 170: MULScc_I	mulscc 	%r8, 0x0f4c, %r20
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,31)
	.word 0xe8420000  ! 173: LDSW_R	ldsw	[%r8 + %r0], %r20
	.word 0xa130f061  ! 176: SRLX_I	srlx	%r3, 0x0021, %r16
thr0_ic_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,26,18)
	.word 0xa4d96979  ! 179: SMULcc_I	smulcc 	%r5, 0x0979, %r18
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,0)
	.word 0xe4494000  ! 182: LDSB_R	ldsb	[%r5 + %r0], %r18
	.word 0xba3929a4  ! 185: XNOR_I	xnor 	%r4, 0x09a4, %r29
	.word 0xaad1ec03  ! 188: UMULcc_I	umulcc 	%r7, 0x0c03, %r21
thr0_ic_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_18), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xb7643801  ! 191: MOVcc_I	<illegal instruction>
	.word 0xacb12c7b  ! 193: ORNcc_I	orncc 	%r4, 0x0c7b, %r22
	.word 0xab643801  ! 193: MOVcc_I	<illegal instruction>
	.word 0xa0b2237e  ! 193: ORNcc_I	orncc 	%r8, 0x037e, %r16
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xf830e188  ! 195: STH_I	sth	%r28, [%r3 + 0x0188]
	.word 0xb0b0e347  ! 198: ORNcc_I	orncc 	%r3, 0x0347, %r24
	.word 0xb431800a  ! 200: SUBC_R	orn 	%r6, %r10, %r26
thr0_ic_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_19), 16, 16),1,IC_DATA,IR_NIR,16,16)
	.word 0xb0d8aa04  ! 203: SMULcc_I	smulcc 	%r2, 0x0a04, %r24
	.word 0xa7299009  ! 205: SLLX_R	sllx	%r6, %r9, %r19
	.word 0xbaaa000c  ! 205: ANDNcc_R	andncc 	%r8, %r12, %r29
	.word 0xbf643801  ! 205: MOVcc_I	<illegal instruction>
	.word 0xb8b8e40c  ! 206: XNORcc_I	xnorcc 	%r3, 0x040c, %r28
	.word 0xa6a8800b  ! 206: ANDNcc_R	andncc 	%r2, %r11, %r19
	.word 0xb0022840  ! 206: ADD_I	add 	%r8, 0x0840, %r24
	.word 0xa3782401  ! 206: MOVR_I	move	%r0, 0xffffffe0, %r17
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xe22a216b  ! 209: STB_I	stb	%r17, [%r8 + 0x016b]
	.word 0xacc0c06a  ! 212: ADDCcc_R	addccc 	%r3, %r10, %r22
	.word 0xbf64180c  ! 214: MOVcc_R	<illegal instruction>
thr0_ic_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_20), 16, 16),1,IC_DATA,NIR,x,32)
	.word 0xad20e53f  ! 217: MULScc_I	mulscc 	%r3, 0x053f, %r22
.align 0x8
	.word 0x30800003  ! 219: BA	ba,a	<label_0x3>
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xe2716968  ! 221: STX_I	stx	%r17, [%r5 + 0x0968]
	.word 0xb1780409  ! 223: MOVR_R	move	%r0, %r9, %r24
thr0_ic_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_21), 16, 16),1,IC_DATA,IR_NIR,6,25)
	.word 0xbe58c00d  ! 226: SMUL_R	smul 	%r3, %r13, %r31
thr0_ic_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,9,28)
	.word 0xb4a9c00b  ! 229: ANDNcc_R	andncc 	%r7, %r11, %r26
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,7)
	.word 0xf441c000  ! 232: LDSW_R	ldsw	[%r7 + %r0], %r26
	.word 0xb164186c  ! 235: MOVcc_R	<illegal instruction>
	.word 0xb658e1e2  ! 238: SMUL_I	smul 	%r3, 0x01e2, %r27
thr0_ic_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_23), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xae19400d  ! 241: XOR_R	xor 	%r5, %r13, %r23
.align 0x8
	.word 0x30800003  ! 243: BA	ba,a	<label_0x3>
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xec70e0e0  ! 245: STX_I	stx	%r22, [%r3 + 0x00e0]
	.word 0xb3782401  ! 247: MOVR_I	move	%r0, 0x7fffbdc0, %r25
thr0_ic_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_24), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xa7214009  ! 250: MULScc_R	mulscc 	%r5, %r9, %r19
thr0_ic_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,29,6)
	.word 0xbe11c00d  ! 253: OR_R	or 	%r7, %r13, %r31
.align 0x8
	.word 0x30800003  ! 255: BA	ba,a	<label_0x3>
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xf819400e  ! 257: LDD_R	ldd	[%r5 + %r14], %r28
	.word 0xa429400d  ! 259: ANDN_R	andn 	%r5, %r13, %r18
thr0_ic_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_26), 16, 16),1,IC_DATA,IR_NIR,23,28)
	.word 0xb851000d  ! 262: UMUL_R	umul 	%r4, %r13, %r28
thr0_ic_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_27), 16, 16),1,IC_DATA,IR_NIR,13,25)
	.word 0xaaba23ca  ! 265: XNORcc_I	xnorcc 	%r8, 0x03ca, %r21
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,46)
	.word 0xea520000  ! 268: LDSH_R	ldsh	[%r8 + %r0], %r21
	.word 0xb929f061  ! 271: SLLX_I	sllx	%r7, 0x0021, %r28
	.word 0xa0d9800d  ! 274: SMULcc_R	smulcc 	%r6, %r13, %r16
thr0_ic_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_28), 16, 16),1,IC_DATA,IR_NIR,32,14)
	.word 0xb531b001  ! 277: SRLX_I	srlx	%r6, 0x0001, %r26
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xb822000b  ! 280: SUB_R	sub 	%r8, %r11, %r28
	.word 0xaa29400b  ! 283: ANDN_R	andn 	%r5, %r11, %r21
	.word 0xbc30c009  ! 285: SUBC_R	orn 	%r3, %r9, %r30
thr0_ic_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_29), 16, 16),1,IC_DATA,IR_NIR,33,29)
	.word 0xbe59800d  ! 288: SMUL_R	smul 	%r6, %r13, %r31
	.word 0xa640c009  ! 290: ADDC_R	addc 	%r3, %r9, %r19
	.word 0xaa10e86c  ! 290: OR_I	or 	%r3, 0x086c, %r21
	.word 0xb7323001  ! 290: SRLX_I	srlx	%r8, 0x0001, %r27
	.word 0xb21222cf  ! 290: OR_I	or 	%r8, 0x02cf, %r25
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,11)
	.word 0xf2420000  ! 292: LDSW_R	ldsw	[%r8 + %r0], %r25
	.word 0xb6a1a310  ! 295: SUBcc_I	subcc 	%r6, 0x0310, %r27
thr0_ic_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_30), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xad216129  ! 298: MULScc_I	mulscc 	%r5, 0x0129, %r22
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xb4296059  ! 301: ANDN_I	andn 	%r5, 0x0059, %r26
	.word 0xa011c00b  ! 304: OR_R	or 	%r7, %r11, %r16
	.word 0xba09c00a  ! 306: AND_R	and 	%r7, %r10, %r29
thr0_ic_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_31), 16, 16),1,IC_DATA,IR_NIR,9,9)
	.word 0xb450aa7d  ! 309: UMUL_I	umul 	%r2, 0x0a7d, %r26
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,26)
	.word 0xf4108000  ! 312: LDUH_R	lduh	[%r2 + %r0], %r26
	.word 0xbe8165aa  ! 315: ADDcc_I	addcc 	%r5, 0x05aa, %r31
	.word 0xb0d0e2aa  ! 318: UMULcc_I	umulcc 	%r3, 0x02aa, %r24
.align 0x8
	.word 0x30800003  ! 320: BA	ba,a	<label_0x3>
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xe428e120  ! 322: STB_I	stb	%r18, [%r3 + 0x0120]
	.word 0xad64180b  ! 324: MOVcc_R	<illegal instruction>
thr0_ic_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_32), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xa5218009  ! 327: MULScc_R	mulscc 	%r6, %r9, %r18
thr0_ic_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_33), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xbeb0800d  ! 330: ORNcc_R	orncc 	%r2, %r13, %r31
	.word 0xf421e578  ! 333: STW_I	stw	%r26, [%r7 + 0x0578]
	.word 0xbe31e460  ! 336: ORN_I	orn 	%r7, 0x0460, %r31
	.word 0xaca96c6a  ! 338: ANDNcc_I	andncc 	%r5, 0x0c6a, %r22
	.word 0xba50c009  ! 341: UMUL_R	umul 	%r3, %r9, %r29
.align 0x8
	.word 0x30800003  ! 343: BA	ba,a	<label_0x3>
	.word 0xfa20e67f  ! 345: STW_I	stw	%r29, [%r3 + 0x067f]
	.word 0xacb0e7cd  ! 347: ORNcc_I	orncc 	%r3, 0x07cd, %r22
thr0_ic_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_34), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xaf21000e  ! 350: MULScc_R	mulscc 	%r4, %r14, %r23
thr0_ic_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_35), 16, 16),1,IC_DATA,IR_NIR,24,13)
	.word 0xab78040c  ! 353: MOVR_R	move	%r0, %r12, %r21
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xea312556  ! 356: STH_I	sth	%r21, [%r4 + 0x0556]
	.word 0xaf30d00d  ! 359: SRLX_R	srlx	%r3, %r13, %r23
	.word 0xa6c1c00a  ! 361: ADDCcc_R	addccc 	%r7, %r10, %r19
thr0_ic_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_36), 16, 16),1,IC_DATA,IR_NIR,27,31)
	.word 0xb648ac8f  ! 364: MULX_I	mulx 	%r2, 0x0c8f, %r27
	.word 0xb641800b  ! 366: ADDC_R	addc 	%r6, %r11, %r27
	.word 0xbea9a074  ! 366: ANDNcc_I	andncc 	%r6, 0x0074, %r31
	.word 0xbf2a3001  ! 366: SLLX_I	sllx	%r8, 0x0001, %r31
	.word 0xb339100b  ! 366: SRAX_R	srax	%r4, %r11, %r25
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,20)
	.word 0xf2590000  ! 368: LDX_R	ldx	[%r4 + %r0], %r25
	.word 0xa930d00c  ! 371: SRLX_R	srlx	%r3, %r12, %r20
	.word 0xb0492e29  ! 374: MULX_I	mulx 	%r4, 0x0e29, %r24
thr0_ic_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_37), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xaca9400f  ! 377: ANDNcc_R	andncc 	%r5, %r15, %r22
.align 0x8
	.word 0x30800003  ! 379: BA	ba,a	<label_0x3>
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xec2a27b7  ! 381: STB_I	stb	%r22, [%r8 + 0x07b7]
	.word 0xa400a818  ! 383: ADD_I	add 	%r2, 0x0818, %r18
thr0_ic_err_38:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_38), 16, 16),1,IC_DATA,NIR,x,7)
	.word 0xb6d0c00f  ! 386: UMULcc_R	umulcc 	%r3, %r15, %r27
thr0_ic_err_39:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_39), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xbf782401  ! 389: MOVR_I	move	%r0, 0x7fffbdc0, %r31
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xee296680  ! 392: STB_I	stb	%r23, [%r5 + 0x0680]
	.word 0xa330b001  ! 395: SRLX_I	srlx	%r2, 0x0001, %r17
	.word 0xbb39f001  ! 397: SRAX_I	srax	%r7, 0x0001, %r29
thr0_ic_err_40:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_40), 16, 16),1,IC_DATA,IR_NIR,18,30)
	.word 0xb659c00f  ! 400: SMUL_R	smul 	%r7, %r15, %r27
	.word 0xf230ad34  ! 403: STH_I	sth	%r25, [%r2 + 0x0d34]
	.word 0xb240c06d  ! 406: ADDC_R	addc 	%r3, %r13, %r25
	.word 0xa099000a  ! 408: XORcc_R	xorcc 	%r4, %r10, %r16
	.word 0xaa5a2a50  ! 411: SMUL_I	smul 	%r8, 0x0a50, %r21
thr0_ic_err_41:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_41), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xa3643801  ! 414: MOVcc_I	<illegal instruction>
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfc70e208  ! 417: STX_I	stx	%r30, [%r3 + 0x0208]
	.word 0xa131e001  ! 420: SRL_I	srl 	%r7, 0x0001, %r16
	.word 0xab30b001  ! 422: SRLX_I	srlx	%r2, 0x0001, %r21
thr0_ic_err_42:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_42), 16, 16),1,IC_DATA,IR_NIR,1,27)
	.word 0xacd9800a  ! 425: SMULcc_R	smulcc 	%r6, %r10, %r22
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,69)
	.word 0xec018000  ! 428: LDUW_R	lduw	[%r6 + %r0], %r22
	.word 0xaf78046e  ! 431: MOVR_R	move	%r0, %r14, %r23
thr0_ic_err_43:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_43), 16, 16),1,IC_DATA,IR_NIR,4,17)
	.word 0xb1216b23  ! 434: MULScc_I	mulscc 	%r5, 0x0b23, %r24
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,15)
	.word 0xf0194000  ! 437: LDD_R	ldd	[%r5 + %r0], %r24
	.word 0xb530f061  ! 440: SRLX_I	srlx	%r3, 0x0021, %r26
thr0_ic_err_44:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_44), 16, 16),1,IC_DATA,NIR,x,33)
	.word 0xb251800b  ! 443: UMUL_R	umul 	%r6, %r11, %r25
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xa8a0800c  ! 446: SUBcc_R	subcc 	%r2, %r12, %r20
	.word 0xb211406e  ! 449: OR_R	or 	%r5, %r14, %r25
	.word 0xb0ba224b  ! 451: XNORcc_I	xnorcc 	%r8, 0x024b, %r24
	.word 0xbe5161f1  ! 454: UMUL_I	umul 	%r5, 0x01f1, %r31
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,58)
	.word 0xfe494000  ! 457: LDSB_R	ldsb	[%r5 + %r0], %r31
	.word 0xb69a2556  ! 460: XORcc_I	xorcc 	%r8, 0x0556, %r27
thr0_ic_err_45:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_45), 16, 16),1,IC_DATA,IR,6,x)
	.word 0xbe59a533  ! 463: SMUL_I	smul 	%r6, 0x0533, %r31
.align 0x8
	.word 0x30800003  ! 465: BA	ba,a	<label_0x3>
	.word 0xec18c00e  ! 467: LDD_R	ldd	[%r3 + %r14], %r22
	.word 0xa5643801  ! 469: MOVcc_I	<illegal instruction>
thr0_ic_err_46:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_46), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xa721000c  ! 472: MULScc_R	mulscc 	%r4, %r12, %r19
thr0_ic_err_47:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_47), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xa431c00b  ! 475: SUBC_R	orn 	%r7, %r11, %r18
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,54)
	.word 0xe411c000  ! 478: LDUH_R	lduh	[%r7 + %r0], %r18
	.word 0xa298c06c  ! 481: XORcc_R	xorcc 	%r3, %r12, %r17
	.word 0xac59ae4e  ! 484: SMUL_I	smul 	%r6, 0x0e4e, %r22
thr0_ic_err_48:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_48), 16, 16),1,IC_DATA,IR_NIR,30,18)
	.word 0xb531e001  ! 487: SRL_I	srl 	%r7, 0x0001, %r26
	.word 0xb129000e  ! 489: SLL_R	sll 	%r4, %r14, %r24
	.word 0xb69a25d1  ! 489: XORcc_I	xorcc 	%r8, 0x05d1, %r27
	.word 0xbc81400c  ! 489: ADDcc_R	addcc 	%r5, %r12, %r30
	.word 0xae18e395  ! 489: XOR_I	xor 	%r3, 0x0395, %r23
	.word 0xae40800c  ! 489: ADDC_R	addc 	%r2, %r12, %r23
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,33)
	.word 0xee088000  ! 491: LDUB_R	ldub	[%r2 + %r0], %r23
	.word 0xa131400c  ! 494: SRL_R	srl 	%r5, %r12, %r16
	.word 0xb520ebb0  ! 497: MULScc_I	mulscc 	%r3, 0x0bb0, %r26
thr0_ic_err_49:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_49), 16, 16),1,IC_DATA,IR,6,x)

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
	.word  0xcf8534a9,0xe18a154e,0x7ca6dbf0,0xf1d7554d
	.word  0x3fa3bb30,0x0669c2e2,0xbe2a015c,0x2e688047
	.word  0x1efcc671,0x9a61fa34,0x1816efef,0x4b3160a1
	.word  0x80deda15,0x6115894d,0x70aaa0dc,0xd15685ae
	.word  0x162bd847,0xd178a764,0xf402975b,0x493c29f3
	.word  0xa6ab91dc,0x42088bda,0xc08ad4b7,0x0d818a9a
	.word  0x3dbd952b,0x5db0f5f4,0x0ef6ea8c,0xc4dc2683
	.word  0xb0cc1617,0xd0ae95a9,0xda1a610a,0x7b2f8381
	.word  0x318270b0,0xeadccb5f,0x8497d132,0x48288088
	.word  0x65216ac9,0x0ea34a5a,0x0e993b8a,0x977354f5
	.word  0x4bc38f72,0x57b99664,0x8ef0aa9b,0x1758bdbc
	.word  0x81e12611,0x2f4183db,0x48753c45,0x931ddc99
	.word  0x3c8128de,0xd14f8ad6,0xf45cceb5,0x56a4d629
	.word  0xbb1abc4b,0x72e2e68c,0xfe2406c0,0x21831556
	.word  0xa65ed735,0x34d35f30,0x5f612a19,0x57232928
	.word  0xea974230,0x2d4027c9,0x6153e2c2,0x658a7434
	.word  0xecfa9dde,0x0527db18,0x772fe320,0xb81fea1a
	.word  0xe1d48f33,0xce4a818a,0x90f1296c,0xd226dba5
	.word  0x4874cf5a,0x8638cb0d,0xcc7b932f,0xb2da7937
	.word  0xbfd00d96,0x110fda3e,0x36a4fb39,0x6b507208
	.word  0xa86eeb50,0xd7cba477,0x6c9983ed,0xf93d0812
	.word  0xa55163a0,0x5203bbb5,0x16ae322c,0x1f690e07
	.word  0x63fbbc21,0xdfa0c091,0xac8b0f01,0x850bb864
	.word  0x0ecb7468,0x69768bee,0xe655471f,0xf91ada97
	.word  0x2e36e0fe,0xe4c06792,0xe05b6b8e,0x5335d223
	.word  0x5db01cba,0x251bdb24,0x3a844b9e,0xbe25d986
	.word  0xe30e4079,0x580baabd,0x2ba37bb3,0x52a734e9
	.word  0x170a9cdc,0x62b2f3ef,0x79414290,0x41f3d7e2
	.word  0x5707a5ef,0x7f44adb1,0xcdeb1bcc,0x613890d9
	.word  0x780d4f26,0xec60d7e4,0xe1620414,0x71211407
	.word  0xe14ddba5,0x10422b7f,0xe79ed522,0xbf90573f
	.word  0x163eaebf,0x3cb695bf,0x30128584,0x428befa8
	.word  0x8d0115e6,0xce8cb6a1,0xf8254eb1,0x3342df3c
	.word  0x5e47f326,0xf577f3bf,0x30d19ec8,0xa319e500
	.word  0x6dd1d275,0xa885fb1f,0xe88a0670,0xbe65d647
	.word  0x2a0a9a7a,0x6036032d,0xbf8bc14d,0x905ff80b
	.word  0x79c78ca7,0xf25f3fce,0x33b6b977,0xd3c2d482
	.word  0x736d696b,0xdf6aca77,0x52276abe,0xb7040109
	.word  0x4ba6a3c7,0xf38a0d20,0xdc6028b8,0x2f28bec5
	.word  0xf5db40fd,0x2d57fbfe,0x234b6ebb,0x7c7aca52
	.word  0x458c0d20,0xc749844b,0xededf2d4,0xbc5e051c
	.word  0xfbeea2de,0x472b1fa9,0x231bbd83,0x6f85fb0d
	.word  0xcff308dc,0x4d3ffed1,0xf909b820,0xeba811da
	.word  0x5e95407a,0xcb1ce6ca,0xb8793b8b,0x9a655202
	.word  0xebc3974f,0x5fd9a028,0x2a07ce96,0xd06a8dcd
	.word  0x3939495e,0x91c482ab,0xa5911fc7,0x2604b6b9
	.word  0x078c357a,0xee65dc0d,0x48280ad5,0x16e41f8c
	.word  0x2d6dbc4b,0xbef778b9,0x0bf193ff,0xb7c1c764
	.word  0xdf667561,0xaf8b922a,0x0cf7e49f,0xdce9b1a5
	.word  0x3135364f,0x226fafa0,0xa08e7f13,0x2ecbfb98
	.word  0xa5ae2a42,0xf305d467,0x57ea9263,0xb7bbbf76
	.word  0xd94d3cd2,0xb37f2d06,0x8f7c6ace,0x5a045741
	.word  0xf5468b01,0x9c77c6a5,0xc4152476,0xd22c999a
	.word  0x335535ab,0xc39f286b,0xe371439a,0xad1efb24
	.word  0x86682669,0x5938ff29,0x4f3a2bff,0xa838ada4
	.word  0xd24b75b2,0x51c369d6,0xe9628836,0x702fa4e5
	.word  0x56a498ab,0xe2ca37bd,0xaea8ff0f,0xd2e21961
	.word  0x23dae680,0x3abe84fd,0xaf31defc,0xec54df7f
	.word  0xfc40509f,0xb630c134,0x60b1a7c5,0x8bcbf769
	.word  0xbf84a1ac,0x9bffc731,0x726efbea,0xc0e8581b
	.word  0x82049ebd,0xc0f38047,0xb6cafb2b,0x00cd7e47
	.word  0x6c2d1da7,0xed702ad5,0xb08a9e96,0x64984582
	.word  0x0cf27021,0x229a5e3f,0x51107095,0x4ff864b3
	.word  0xba1a6fcb,0xbb73ff69,0xcb2f1fbb,0x0bdfeae7
	.word  0xe706c6dc,0xc380a557,0x0b6d125c,0x11f186b1
	.word  0x6bcf2db9,0x168304f4,0xe9b6c645,0x0d83d96c
	.word  0x1eaf1c5a,0x2bbfd46b,0xf57f1f3d,0xdd58d3e3
	.word  0x5ea9edef,0xaee51014,0xf2a42352,0x3731554a
	.word  0x3be7006f,0xf18e6824,0x5c7f737d,0x4b272fdb
	.word  0xebcce844,0x8ce60d1e,0x295c2490,0x0224e01f
	.word  0x48a53702,0x1f5d5a0a,0x01326c93,0x5c4e8914
	.word  0xefbc4e62,0x9d3db766,0x56ad5807,0xe9059597
	.word  0x6f81d5c6,0x6691dab7,0x5b32dfde,0xbbef4a74
	.word  0x61a54e56,0x50faa02b,0xe40b4466,0x772c8625
	.word  0x1c35746b,0x812eb6fc,0xe9768332,0x8d08b5d6
	.word  0x16871af2,0x196df8b9,0x3a31e01f,0x25b60a77
	.word  0xd5ef2b79,0xd498d68f,0xe4d89849,0xedc5f6c4
	.word  0x16ddb627,0x29b5869f,0x0a193c2c,0xe3260c60
	.word  0x710fb04d,0xca89bc4e,0x74e1bf1a,0x8d5f6d1a
	.word  0x91859b67,0xd084830b,0x4ae5fced,0x662f896a
	.word  0x0df2306c,0x085b6712,0x39a29cc8,0xabecaf5c
	.word  0x7e7bfc75,0xf2648386,0xc6d4d288,0x3e5cb384
	.word  0x6b64120c,0x3b650110,0xfb0cb907,0x5819ca52
	.word  0xd22d90f4,0x7865ad13,0x41cd8af3,0xaaf048a8
	.word  0xddcbcac6,0x9818c761,0xb29d3322,0x2ce18ce7
	.word  0x3e50e338,0x96762645,0x81ac86f4,0xeaae180e
	.word  0xa81679cc,0xe77b41d1,0x94818193,0x22f74598
	.word  0x8624ae89,0x467d0540,0xfc8aa739,0x7e9ac2c1
	.word  0x361800f6,0x8f528e12,0xd8095e04,0xcc283608
	.word  0xeeed8372,0xfd8feddd,0xd3802b51,0xae80a8cb
	.word  0x51536aa4,0xbc9bd50a,0xa4891699,0x74efd0a2
	.word  0x1b777ca3,0x4219230b,0x15f1b207,0x68c56730
	.word  0x0ecd8287,0xf187ff04,0x07f8c713,0xceec8386
	.word  0x51af0173,0x118a9c0d,0x8306a384,0xe6a6b287
	.word  0x7d2abfda,0x7b4556eb,0x7d56b31d,0xe48519d9
	.word  0xb9a2f5ac,0xe4b27694,0x4822a851,0x48115560
	.word  0x2ed711bc,0x4a651bb8,0x694cae9c,0x2ae3c366
	.word  0xf311b369,0x4d1b1df6,0x6ea1186e,0x0455844c
	.word  0xcffdc340,0xe18dd545,0x00fa430f,0xaaea0459
	.word  0xff507a2a,0xa91083ec,0x00d448ca,0x9d052932
	.word  0xca7b7e65,0x7ca7d753,0x2e1e07ec,0xfb76c8ff
	.word  0xd0cbc251,0xb1cad3ac,0x8149d5ec,0xe925dfe4
	.word  0x685aac9a,0xf2543751,0xf7676404,0x67d306c6
	.word  0xf5442c7f,0x4937c3ea,0x1ed9bfdc,0x8652948c
	.word  0xe6be7b2e,0x5ad1d1bd,0x20556b3b,0x8e45c597
	.word  0xcace916a,0x6ec17b28,0xbc050556,0x18cabc42
	.word  0x7830134b,0x0e78da01,0x5c2c4a19,0xf537fe42
	.word  0x05416393,0x67357c1f,0xbdf7097a,0xa2619a73
	.word  0xd02df08d,0x8053fab8,0x1d732f80,0xbafea97f
	.word  0x29759183,0x0919e30d,0x42308341,0x852ede5f
	.word  0x95bbca1f,0x4f0fba9b,0xa20731bf,0xe6bfce66
	.word  0xc39aea10,0xac8a82eb,0xe4a234c0,0x2260befd
	.word  0x7f591f4e,0x4f6463dd,0xc84a064b,0x13f5ebc2
	.word  0xc4c4f7fa,0x7d02e617,0xb179f99f,0x811940e8
	.word  0x277a7a0a,0xe1915cec,0xb06a04b9,0x00b10e39
	.word  0x97d3eb17,0x472c9411,0xd1216fef,0x362c59ff
	.word  0x6e5e2e44,0xa159ee04,0x9d52a401,0x78b2d8e1
	.word  0x7d092bc2,0x1e4a1cf0,0x8770ca18,0x5ad20ec8
	.word  0xd33d5ac4,0xfd1088d5,0x5de43302,0x200d08a4
	.word  0x118d6102,0x466c5c4d,0xe6cf1f40,0x8d64991f
	.word  0x8b86439f,0x63d741a5,0x6266dd32,0xff3395c7
	.word  0xd24f5348,0x06722915,0x83fbcdb8,0x76a25e84
	.word  0x6e064cf6,0x04dc5cca,0x18d58bdb,0xdf63def6
	.word  0xca108eb7,0x6e797ac7,0xcdfd7256,0x1dd345d6
	.word  0xb205f41a,0xedf98467,0x7a10489c,0xcd5158e4
	.word  0x6ae4f579,0x23d00615,0xb45ccfcb,0x8f43242b
	.word  0x4d965449,0x4b8252f3,0x4b4a82ce,0x34f0f178
	.word  0xb4042ae9,0xcef8dfff,0xd6f9b43c,0x65b80012
	.word  0x56f05860,0x53a5e7b0,0x82de6b35,0x779e46e7
	.word  0x979ed474,0x258500e6,0xcf10a1f5,0xdfa03e03
	.word  0xfc1a7d5d,0xaa440a4b,0x6ec89d2e,0x581485bd
	.word  0x5755b1ff,0x381a494a,0xc6c2fd2b,0xceb6915a
	.word  0xa68f0267,0x75899634,0x7aa0c5cf,0x79a2e08c
	.word  0xc69920ff,0xdb9295c3,0xe878bb5e,0xdf5b9cb9
	.word  0xf5a817a9,0x562b5647,0x3847a9f3,0x999f2eb2
	.word  0xb9754ec2,0x5cd0b909,0x814e2452,0xad87c36e
	.word  0x5009bcd6,0x2c343851,0x419a09a9,0x7315f377
	.word  0x4422e2be,0x1ee7d2e9,0x2f60ca51,0x1b6a38e0
	.word  0xc4c9697e,0x0b3a8e3f,0xecbf695f,0xa1d94cd8
	.word  0xd6b97db7,0xa29fcc10,0x97603b3d,0x1e64d662
	.word  0x92580083,0xbe72d181,0xe982ee9a,0xec85b00f
	.word  0xad34cb07,0x4bbc3ce6,0x63d77c92,0x9336c752
	.word  0xf46257ce,0x37a77ca6,0xf77a7f52,0x779a9641
	.word  0x9da66e06,0xbb471c40,0xe425faf4,0x3a98b764
	.word  0x2d6f92cf,0xb6801419,0x5b743f6b,0x05322e97
	.word  0x7b4dcb15,0x935d96bf,0x2d5834a7,0x68e191ac
	.word  0xc0ba7efd,0x9a922c03,0x973be9e0,0xff75c755
	.word  0xdfec9a63,0x42db5b65,0x678c25a8,0x234607a8
	.word  0xc62e8928,0x3b8c8a17,0xe1cd8bdb,0x243d1a11
	.word  0x6d4b0861,0x7b9a6542,0x8397717e,0xe73236b4
	.word  0xbcd1c86e,0xea0fbc92,0x94f67e33,0x2ac57161
	.word  0x64054f83,0x02aae47f,0xb8ae4eda,0xf9a0bc2a
	.word  0x038f1914,0xd715d1f3,0x1b6321a8,0x6568308c
	.word  0x42d35db7,0xc0456313,0xa6b226f0,0x9e353a84
	.word  0x687ee75b,0x399a6bdc,0xa49efcc6,0xf3a54007
	.word  0xd7d77a20,0xd3c59d28,0x8422d73f,0xa9a766e5
	.word  0x1083fb17,0x35efee1f,0xf04b64b5,0x360e69c1
	.word  0x098b24ff,0x576d7bba,0x94f432a2,0x0ef62059
	.word  0x535099b6,0x27914589,0xe8cbdf73,0x3878cf4c
	.word  0x07f58b19,0x481d323f,0x310c96a5,0xa0fbfb96
	.word  0x6effcba5,0xb71f954e,0x298495ce,0xc6e5afb1
	.word  0xbed20d66,0x84b3437a,0x2e688c99,0xbdb968bf
	.word  0x438f9ccf,0x861b2ad9,0x244fdd39,0x704862df
	.word  0xfd2e09f0,0x7d7b1b42,0x25db0cc1,0x7b58e646
	.word  0x4a500644,0xc83a9c86,0xfc9a0ab3,0x6efe59b0
	.word  0xa1fa9216,0x887a61f3,0x8941c24e,0x1ced3284
	.word  0x189572ff,0xa7af6ceb,0xede6fd33,0xdfb0c211
	.word  0x4543e48a,0x260db5d2,0xfc3bdca0,0x1c45e74f
	.word  0x7fc74d18,0x3a590e1c,0x33c570fa,0x1cecb11b
	.word  0x8180bce3,0x726d2365,0x3847ad0d,0x977f7a98
	.word  0x7458baa6,0x9922c799,0x5a6f70f9,0xeeb4316a
	.word  0xa97f9104,0xd6e5ef05,0x3426e2c3,0xf574083c
	.word  0x0428419a,0xa2ecc346,0x11a79cfd,0xdc36da46
	.word  0x34d2f85c,0xb909feb1,0x10011c48,0x497de47e
	.word  0xc7c6cdec,0x0bcfd984,0xd8fdb378,0xac40cc52
	.word  0xa5e99fe6,0x7683f6de,0xc082e2c8,0x416d9067
	.word  0x484334ee,0xb62db09f,0x43c96afb,0x1abf433b
	.word  0x551ee90b,0x039a4a61,0xea5cdf4f,0x97922eac
	.word  0xc0b2792b,0x68318b26,0xda8c8f80,0x60fc4fc5
	.word  0x54f79a68,0x81d19889,0xf56d4933,0x1981a8d3
	.word  0x818d5ada,0xa9fb9ffb,0x432fcd81,0x254d652d
	.word  0x100f63f9,0x7b91f05a,0x38ed4a56,0x3118cdb6
	.word  0x785c0551,0x2e4e6a4b,0x2b4e46c6,0x23019423
	.word  0x27365dec,0xbb5f6b0b,0x17a8b528,0x319643ea
	.word  0x948fc724,0x0d132f26,0xde50eb00,0x817f135c
	.word  0x277ee36f,0xd6f8ce2d,0x4bee32a4,0x6032be4a
	.word  0xa3d96624,0x03ec5143,0x6b1dde9a,0xb4d1051d
	.word  0x909858ea,0x272be971,0x50ae96fa,0x32f0b3c2
	.word  0x2cd30770,0xed281c29,0xa8fc1c0d,0x525f69a9
	.word  0xa51b73e7,0xf9a15191,0xf813bfb5,0x8a52d680
	.word  0xff8de3a0,0x5a1102b8,0x4d7aff0c,0x1d564e42
	.word  0xac4771f5,0xd92acd98,0x91e695b2,0x7d1316c1
	.word  0x7aaa8f25,0xe52cac43,0xcb7ad362,0x8ba9f55c
	.word  0x16c7ddd0,0x6ae10920,0xb071904a,0x8b881d22
	.word  0x388a5dad,0x78d82c23,0xaeaf248e,0x9931c6e4
	.word  0xbe5039d8,0xcc4fbf2d,0xb79184c2,0x58be6975
	.word  0xf80847a9,0xa332dd1a,0x8ea546bb,0xcaaf1d36
	.word  0x4bf93031,0x24928f57,0x85a06ec0,0xfe6d7578
	.word  0xa6327c0a,0xd963940f,0x51c46bbf,0xcc6833fd
	.word  0xbb269121,0xa853e4fc,0x05e80e4b,0x9a2b8218
	.word  0xfa2f7a33,0xe0ff97a4,0x49559313,0x944e8896
	.word  0x2bf582f6,0x32c23ec0,0x6639e3c1,0x30345c98
	.word  0x84d407e6,0x6e82d367,0x8cf738c3,0x30d82a92
	.word  0x54e648c9,0x56794e61,0x95612d59,0x0e929e56
	.word  0xaa05341b,0xa6bea0a7,0xa3fd5eeb,0xd640b4b3
	.word  0x14fd33f5,0xf11035ac,0x5dc7d72e,0x6bb0940d
	.word  0xba4d8500,0xa0fdcbad,0x0010a63e,0x701363fc
	.word  0x225c1ee0,0x0d9b70cf,0x21589da5,0xd90b6c0f
	.word  0x87cec21d,0x5ecf7fbb,0xf74842e0,0x53a3d6d8
	.word  0xa254929e,0x54f9d0b5,0xdcf9da33,0x952f5df3
	.word  0x782848cc,0xed8dcda1,0xf1dbc639,0xf6228ce6
	.word  0xa923773e,0xb8d159e9,0x131971bd,0x712273d2
	.word  0x123ae429,0x1921fdbb,0xc31051e2,0x8f50a2d2
	.word  0xcad19de0,0xd36dce3d,0xf957a10d,0x36bd3f07
	.word  0x0f5ca1da,0x644480f9,0xcb57b42d,0xced20d7e
	.word  0xf03db9bf,0x710a71b6,0x4dd91b96,0x964b2b71
	.word  0xbc623df4,0xd373f83e,0xd7262597,0xa527dffc
	.word  0x2867b32f,0xd88eb69e,0x73c8f753,0xffa2c3fb
	.word  0x0f70a8da,0xc5338188,0x419be1b2,0x7fff26ab
	.word  0xdc391ca8,0x570c6a12,0x7bded504,0x296d462e
	.word  0x154d7f27,0x1143a6d2,0xbb18aca5,0xabf3aafe
	.word  0x81b689c0,0x5ffa9b85,0xfd043a26,0xafdaed48
	.word  0x9b94cce4,0xc1aafbe3,0x00b53d51,0xa89f4f1c
	.word  0x280967f2,0x74ea1c6c,0x3f476017,0xa5a9f502
	.word  0x50f925f2,0xba8ba4ea,0x0bfaad05,0xa2160e1e
	.word  0x7e082695,0x33280943,0xc5023c65,0xdfab846f
	.word  0xc93a2506,0xcccf47d1,0x5a07070e,0x53bdad98
	.word  0x6562f981,0xaaad8481,0x354795d0,0xb88ef7f0
	.word  0x7affac96,0x6a1704fd,0x0ee3ec1a,0xf2932afa
	.word  0x1646e2cc,0x9cf17545,0xa8508bc7,0x744ee1fc
	.word  0x9a5001fd,0x86bf8478,0xe17d952d,0x626db964
	.word  0x54a77985,0x30e0fa23,0xc7f32c70,0xb66fa3c9
	.word  0x4f0bf784,0x8c75127f,0x01909e57,0x3d94ec48
	.word  0xcfb6a52b,0x49c55a18,0xcba598eb,0xc2232ff9
	.word  0x6b6e72cb,0xe47377d6,0x2732d5fc,0x2d0cdc03
	.word  0x30f468cb,0xf4e8dd01,0x0178215f,0x8cfe9284
	.word  0x690aa11b,0x37257dea,0xf8415f2e,0x45d7be8b
	.word  0xf079f385,0xff866a82,0x67826ff7,0x9e3da682
	.word  0xdbb41c23,0xa53ef799,0x24476ef7,0xdf7857aa
	.word  0xf8fe4284,0xf6af48ca,0xed4e311e,0x03ff2664
	.word  0x03a14c41,0x1b59d3bc,0x8fdc72a7,0x68e99a22
	.word  0x6a79f1f3,0x24a26d61,0xa9681c48,0x6b9f09d7
	.word  0xf521528a,0xeb695b30,0xb4fdc87f,0x7daef91d
	.word  0x9b02b7f2,0xf149682c,0xa641a9bb,0x754ba76f
	.word  0x6e1b957a,0x959a6e53,0x1caedcf7,0x3fcffe94
	.word  0x735d4634,0xe3416470,0x00dbe14f,0x2cea6277
	.word  0x265580e7,0x323cf3d0,0x28fcce77,0x22ffadde
	.word  0xfa8504d3,0xd491ce47,0x517acfca,0x09f3da36
	.word  0xef647bf4,0x648e041c,0x0da43065,0xca511557
	.word  0x8159c65c,0xabf22fcf,0xbad1aa4c,0x0f10b36c
	.word  0x4113e32d,0x183e658b,0x2bbd9917,0x890666fe
	.word  0x829f3c12,0xa9a34c37,0x77390706,0xad7ba8d4
	.word  0xf5dfe35d,0x1ceb0548,0xd449c6c5,0x9926ab97
	.word  0x0ab46c42,0xc43c9d32,0x0f1e4d2c,0x09d18739
	.word  0xcff8ec26,0x59e91ce4,0x8177f686,0x98753726
	.word  0xe87ba8a3,0xbf8a82da,0x2d7223b2,0x380ddbf7



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
!!# dlyslt_inst: ld_irferr_unalgn
!!# 	   | trpm_alu
!!#            | st_irferr_unalgn
!!# ;
!!# 
!!# d18: mMETA1
!!# {
!!#    IJ_printf ("diag.j", 234, th_evnt, ".align 0x8\n");
!!#    IJ_generate_from_token ("diag.j", 235,1, th_evnt,Ro_ba,tBA, -1);;
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
!!#   IJ_printf ("diag.j", 269, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf ("diag.j", 270, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%y, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!#   burst_cnt = random () % 7 + 7; 
!!#   IJ_generate_from_token ("diag.j", 273,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_generate_from_token ("diag.j", 280,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_printf ("diag.j", 286, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 3;
!!#    if (i == 0) {
!!# //      IJ_printf (th_evnt, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 291, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!# //      IJ_printf (th_evnt, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 295, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!# //      IJ_printf (th_evnt, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 300, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA19
!!# {
!!#    IJ_printf ("diag.j", 308, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 310, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf ("diag.j", 317, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 319, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr_on_load: mMETA35
!!# {
!!#      IJ_printf ("diag.j", 326, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      if ((random () % 3) == 0) {
!!#        bitnum = random () % 72;
!!#      } else {
!!#        bitnum = random () % 10;
!!#      }
!!#      IJ_printf ("diag.j", 332, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
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
!!#    IJ_generate ("diag.j", 344, th_evnt, $2);
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
!!#          IJ_generate ("diag.j", 355, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!#       | d12 load_i_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 360, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!# ;
!!# 
!!# load_r: d13 load_r_tokens %ropr  Ro_load_r
!!# {
!!#    IJ_generate ("diag.j", 367, th_evnt, $2);
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
!!#    IJ_generate ("diag.j", 382, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# store_i_tokens: tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# ;
!!# 
!!# alu: d15 alu_tokens
!!# {
!!#    IJ_generate ("diag.j", 392, th_evnt, $2);
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

