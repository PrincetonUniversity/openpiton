// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3620.s
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
   random seed:	434936523
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
	setx  0xff2c6d6dc6d1b580, %r1, %r16
	setx  0xd523714feedb5917, %r1, %r17
	setx  0x06595489e858dba7, %r1, %r18
	setx  0x6a97b621b4eb1a49, %r1, %r19
	setx  0xb8a36790f3ece492, %r1, %r20
	setx  0x249935e6ce92c684, %r1, %r21
	setx  0xc4162079f4426cb9, %r1, %r22
	setx  0xf994ffdec6237f63, %r1, %r23
	setx  0x2e148dd6b99fa41a, %r1, %r24
	setx  0x1aabf92e98cd3ca3, %r1, %r25
	setx  0xccf1bd6bdd5dbf10, %r1, %r26
	setx  0xddfb55a486dd89b9, %r1, %r27
	setx  0x6f1d5c66f120f9b5, %r1, %r28
	setx  0x5a107d98bfc7af86, %r1, %r29
	setx  0x8df89d372128a5e9, %r1, %r30
	setx  0x30445b05e119f9f9, %r1, %r31
	setx  0x0000000000000080, %r1, %r9
	setx  0x00000000000008b0, %r1, %r10
	setx  0x0000000000000530, %r1, %r11
	setx  0x0000000000000d70, %r1, %r12
	setx  0x00000000000002b0, %r1, %r13
	setx  0x0000000000000e90, %r1, %r14
	setx  0x0000000000000550, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	.word 0xad20eb50  ! 45: MULScc_I	mulscc 	%r3, 0x0b50, %r22
	.word 0xb851c00a  ! 45: UMUL_R	umul 	%r7, %r10, %r28
	.word 0xa851400e  ! 45: UMUL_R	umul 	%r5, %r14, %r20
	.word 0xbcda000c  ! 45: SMULcc_R	smulcc 	%r8, %r12, %r30
	.word 0xa6d1400b  ! 45: UMULcc_R	umulcc 	%r5, %r11, %r19
	.word 0xa2da000f  ! 45: SMULcc_R	smulcc 	%r8, %r15, %r17
	.word 0xa45a000e  ! 45: SMUL_R	smul 	%r8, %r14, %r18
	.word 0xa659e6ee  ! 45: SMUL_I	smul 	%r7, 0x06ee, %r19
	.word 0xb048af08  ! 111: MULX_I	mulx 	%r2, 0x0f08, %r24
	.word 0xbed9c00d  ! 111: SMULcc_R	smulcc 	%r7, %r13, %r31
	.word 0xaf20a3c9  ! 111: MULScc_I	mulscc 	%r2, 0x03c9, %r23
	.word 0xbed1000b  ! 111: UMULcc_R	umulcc 	%r4, %r11, %r31
	.word 0xb0596d81  ! 111: SMUL_I	smul 	%r5, 0x0d81, %r24
	.word 0xb649c00a  ! 111: MULX_R	mulx 	%r7, %r10, %r27
	.word 0xbad9000d  ! 111: SMULcc_R	smulcc 	%r4, %r13, %r29
	.word 0xa0d9800c  ! 111: SMULcc_R	smulcc 	%r6, %r12, %r16
	.word 0xb0d9c00f  ! 188: SMULcc_R	smulcc 	%r7, %r15, %r24
	.word 0xa4d1400d  ! 188: UMULcc_R	umulcc 	%r5, %r13, %r18
	.word 0xbc51c00d  ! 188: UMUL_R	umul 	%r7, %r13, %r30
	.word 0xbe49c00e  ! 188: MULX_R	mulx 	%r7, %r14, %r31
	.word 0xbad9000d  ! 188: SMULcc_R	smulcc 	%r4, %r13, %r29
	.word 0xb921e9fc  ! 188: MULScc_I	mulscc 	%r7, 0x09fc, %r28
	.word 0xa720e1fc  ! 188: MULScc_I	mulscc 	%r3, 0x01fc, %r19
	.word 0xbad2271c  ! 188: UMULcc_I	umulcc 	%r8, 0x071c, %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0xc531153bc974c331, %r1, %r16
	setx  0x76b2e4cc2f48ca71, %r1, %r17
	setx  0x8d4ec913277a2623, %r1, %r18
	setx  0xe0470c45da6c2d1f, %r1, %r19
	setx  0xeee143246d1f59a4, %r1, %r20
	setx  0x1b34eaa8dacf4e1b, %r1, %r21
	setx  0x7a570b7b77ce6f65, %r1, %r22
	setx  0x37b1bf0fd4fc8179, %r1, %r23
	setx  0xb373e77cfa3d85e6, %r1, %r24
	setx  0xe889a74b76c8f518, %r1, %r25
	setx  0x85eca77d8dd384ba, %r1, %r26
	setx  0x6b26e0d7d35021ed, %r1, %r27
	setx  0xb8099e2fc1ecd9ee, %r1, %r28
	setx  0x103827503a70ebc4, %r1, %r29
	setx  0xee76565e2c991baf, %r1, %r30
	setx  0x8309abe3e27b5953, %r1, %r31
	setx  0x0000000000000110, %r1, %r9
	setx  0x0000000000000360, %r1, %r10
	setx  0x0000000000000120, %r1, %r11
	setx  0x00000000000002d0, %r1, %r12
	setx  0x00000000000008e0, %r1, %r13
	setx  0x00000000000005d0, %r1, %r14
	setx  0x00000000000001d0, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
	.word 0xe01a000d  ! 4: LDD_R	ldd	[%r8 + %r13], %r16
	.word 0xb4a229dc  ! 7: SUBcc_I	subcc 	%r8, 0x09dc, %r26
	.word 0xa899eccc  ! 9: XORcc_I	xorcc 	%r7, 0x0ccc, %r20
	.word 0xb8d0a9de  ! 12: UMULcc_I	umulcc 	%r2, 0x09de, %r28
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xa5393001  ! 15: SRAX_I	srax	%r4, 0x0001, %r18
!ldst_irf_err
	.word 0xe871ad40  ! 18: STX_I	stx	%r20, [%r6 + 0x0d40]
	.word 0xaf3a100d  ! 21: SRAX_R	srax	%r8, %r13, %r23
	.word 0xa439ee45  ! 23: XNOR_I	xnor 	%r7, 0x0e45, %r18
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xa6d1000a  ! 26: UMULcc_R	umulcc 	%r4, %r10, %r19
!ldst_irf_err
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xa578040c  ! 31: MOVR_R	move	%r0, %r12, %r18
	.word 0xaca0ef59  ! 34: SUBcc_I	subcc 	%r3, 0x0f59, %r22
	.word 0xb332000e  ! 36: SRL_R	srl 	%r8, %r14, %r25
	.word 0xbc4a000e  ! 39: MULX_R	mulx 	%r8, %r14, %r30
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xbe40c00e  ! 42: ADDC_R	addc 	%r3, %r14, %r31
!alu_irf_err
	.word 0xbb20eb6d  ! 45: MULScc_I	mulscc 	%r3, 0x0b6d, %r29
	.word 0xb33a000a  ! 46: SRA_R	sra 	%r8, %r10, %r25
	.word 0xbe222553  ! 46: SUB_I	sub 	%r8, 0x0553, %r31
	.word 0xae90c00b  ! 46: ORcc_R	orcc 	%r3, %r11, %r23
!alu_burst
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xbe30c00b  ! 49: SUBC_R	orn 	%r3, %r11, %r31
	.word 0xa208c00d  ! 52: AND_R	and 	%r3, %r13, %r17
	.word 0xa128e001  ! 54: SLL_I	sll 	%r3, 0x0001, %r16
	.word 0xad216d63  ! 57: MULScc_I	mulscc 	%r5, 0x0d63, %r22
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xa298e0fa  ! 60: XORcc_I	xorcc 	%r3, 0x00fa, %r17
!alu_irf_err
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,18)
	.word 0xf011400a  ! 63: LDUH_R	lduh	[%r5 + %r10], %r24
	.word 0xa929d00a  ! 66: SLLX_R	sllx	%r7, %r10, %r20
	.word 0xb8596d12  ! 69: SMUL_I	smul 	%r5, 0x0d12, %r28
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xa178040e  ! 72: MOVR_R	move	%r0, %r14, %r16
!ld_dc_err
	.word 0xf818e050  ! 75: LDD_I	ldd	[%r3 + 0x0050], %r28
	.word 0xba88c00a  ! 78: ANDcc_R	andcc 	%r3, %r10, %r29
	.word 0xb8b8e904  ! 80: XNORcc_I	xnorcc 	%r3, 0x0904, %r28
	.word 0xae50800a  ! 83: UMUL_R	umul 	%r2, %r10, %r23
!ldst_irf_err
	.word 0xe851213a  ! 86: LDSH_I	ldsh	[%r4 + 0x013a], %r20
	.word 0xa3643801  ! 89: MOVcc_I	<illegal instruction>
	.word 0xbb299009  ! 91: SLLX_R	sllx	%r6, %r9, %r29
	.word 0xbf216b4e  ! 94: MULScc_I	mulscc 	%r5, 0x0b4e, %r31
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xa280a5b1  ! 97: ADDcc_I	addcc 	%r2, 0x05b1, %r17
!ldst_irf_err
	.word 0xaa39c00f  ! 98: XNOR_R	xnor 	%r7, %r15, %r21
	.word 0xa62a2780  ! 98: ANDN_I	andn 	%r8, 0x0780, %r19
	.word 0xa131100e  ! 98: SRLX_R	srlx	%r4, %r14, %r16
	.word 0xbe82000d  ! 98: ADDcc_R	addcc 	%r8, %r13, %r31
	.word 0xbeba2d8d  ! 98: XNORcc_I	xnorcc 	%r8, 0x0d8d, %r31
	.word 0xbc322e1b  ! 98: ORN_I	orn 	%r8, 0x0e1b, %r30
!alu_burst
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,4)
	.word 0xe612000e  ! 101: LDUH_R	lduh	[%r8 + %r14], %r19
	.word 0xb6a1000a  ! 104: SUBcc_R	subcc 	%r4, %r10, %r27
	.word 0xa2d1000b  ! 107: UMULcc_R	umulcc 	%r4, %r11, %r17
!ld_dc_err
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
	.word 0xb64a26c4  ! 111: MULX_I	mulx 	%r8, 0x06c4, %r27
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,45)
	.word 0xf401800d  ! 114: LDUW_R	lduw	[%r6 + %r13], %r26
	.word 0xbf38c009  ! 117: SRA_R	sra 	%r3, %r9, %r31
	.word 0xad20a08e  ! 120: MULScc_I	mulscc 	%r2, 0x008e, %r22
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xb739d009  ! 123: SRAX_R	srax	%r7, %r9, %r27
!ld_dc_err
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,12)
	.word 0xfe10c00f  ! 126: LDUH_R	lduh	[%r3 + %r15], %r31
	.word 0xa28a000c  ! 129: ANDcc_R	andcc 	%r8, %r12, %r17
	.word 0xa4d1800a  ! 132: UMULcc_R	umulcc 	%r6, %r10, %r18
!ld_dc_err
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,66,x, x,x,x, x,x,x)
	.word 0xf831ee98  ! 135: STH_I	sth	%r28, [%r7 + 0x0e98]
	.word 0xad39c00f  ! 138: SRA_R	sra 	%r7, %r15, %r22
	.word 0xbcc0c00e  ! 140: ADDCcc_R	addccc 	%r3, %r14, %r30
	.word 0xb050c00e  ! 143: UMUL_R	umul 	%r3, %r14, %r24
!ldst_irf_err
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,4)
	.word 0xe408c00e  ! 146: LDUB_R	ldub	[%r3 + %r14], %r18
	.word 0xbb38f001  ! 149: SRAX_I	srax	%r3, 0x0001, %r29
	.word 0xb5212f8c  ! 152: MULScc_I	mulscc 	%r4, 0x0f8c, %r26
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xbe80800f  ! 155: ADDcc_R	addcc 	%r2, %r15, %r31
!ld_dc_err
	.word 0xe4196450  ! 158: LDD_I	ldd	[%r5 + 0x0450], %r18
	.word 0xaeb1400a  ! 161: ORNcc_R	orncc 	%r5, %r10, %r23
	.word 0xac012528  ! 163: ADD_I	add 	%r4, 0x0528, %r22
	.word 0xaa5a2659  ! 166: SMUL_I	smul 	%r8, 0x0659, %r21
!ldst_irf_err
thr0_resum_intr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,49)
	.word 0xfa51c009  ! 170: LDSH_R	ldsh	[%r7 + %r9], %r29
	.word 0xb609e9a4  ! 173: AND_I	and 	%r7, 0x09a4, %r27
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xaa596c5d  ! 176: SMUL_I	smul 	%r5, 0x0c5d, %r21
!ld_dc_err
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,31)
	.word 0xe651400f  ! 179: LDSH_R	ldsh	[%r5 + %r15], %r19
	.word 0xb621000b  ! 182: SUB_R	sub 	%r4, %r11, %r27
	.word 0xa8d18009  ! 185: UMULcc_R	umulcc 	%r6, %r9, %r20
!ld_dc_err
	.word 0xb0d8c00e  ! 188: SMULcc_R	smulcc 	%r3, %r14, %r24
	.word 0xe641c00d  ! 191: LDSW_R	ldsw	[%r7 + %r13], %r19
	.word 0xaf38c00d  ! 194: SRA_R	sra 	%r3, %r13, %r23
	.word 0xa139a001  ! 196: SRA_I	sra 	%r6, 0x0001, %r16
	.word 0xa0d10009  ! 199: UMULcc_R	umulcc 	%r4, %r9, %r16
!ldst_irf_err

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
	.word  0xdf6f6eab,0xbbc0ff0d,0x5f37f39d,0x8ded4d3d
	.word  0xe6a82d35,0x02e67293,0xfc06408c,0x735e7ef7
	.word  0x01c98a35,0xc118cd67,0x20309be7,0x94d35212
	.word  0x4595516f,0xa0ab5001,0x27228ffd,0xd654bca2
	.word  0xa92f4cd5,0x3eff0ba5,0x446048f7,0x8ae3da05
	.word  0xcd91eaf4,0x4ddee92f,0x5614740e,0x7037df03
	.word  0x2c979b9b,0x61930eec,0xb2236b45,0x95f37c65
	.word  0xe6b3c69b,0x2a1c213f,0x2a7441b8,0x798b523c
	.word  0x27dc2047,0xe60dbefb,0x4bb626f4,0x3a2215f1
	.word  0x9dc51fb3,0x622c5733,0x213c7502,0x0185de95
	.word  0x5b95f392,0x0738ba14,0x402cc139,0xed913b06
	.word  0x1c5828a8,0x769948da,0x7712538d,0xaef0ede8
	.word  0xe67c30f1,0x6fe21845,0x245bd3b0,0x9b8237c6
	.word  0x99d6bc6f,0x0b958dbc,0x87734ddd,0xf7f57ee5
	.word  0xca9c4bab,0x4208963c,0x0da09c28,0x2b7c4a29
	.word  0xd5c36ab3,0x57b6ca95,0xef8670fa,0x99a6ed11
	.word  0x31782f7c,0x3edd4119,0x3110f0d2,0xa02f336f
	.word  0x546f2ff2,0x890098ed,0x73130bfe,0x9e3a2b16
	.word  0x1480766d,0xcb232782,0xb70e357b,0x7e8b3c84
	.word  0x2d0f2628,0xfbfeaaa7,0x6f977386,0x75648fc0
	.word  0xdcdf2668,0x341d3fbb,0xe6184d72,0xe1b3ffe2
	.word  0x79f9359b,0x3da76b7f,0x2bceb721,0x6c1dacad
	.word  0x0f0bdd1a,0xe4546b0d,0x6fa8cdbc,0xa2455f2c
	.word  0xdb73169c,0xbbb0e706,0xff2a64ef,0x35a7b903
	.word  0xe1645d9a,0x1c4cf15f,0x1f25ad9d,0x589c44a1
	.word  0xafe46a3c,0x1116e57c,0x9fa04eee,0xd78183e9
	.word  0x8f9e2d3b,0x7eb30a7f,0xf2dc4640,0xb6699095
	.word  0x8db41ae0,0x0af6c0f3,0xa629df8f,0x20bdbf5a
	.word  0xb5159811,0xc22118ba,0xc9f2d929,0x0db0cda8
	.word  0x6f79f463,0x609ca2c1,0x6c8d507f,0xa26aed9b
	.word  0x50dac74e,0xd0224bd8,0xc614c6cc,0x7115cd79
	.word  0x246d53c4,0x1fb45ea2,0x240f3a17,0xd99ed2f7
	.word  0x262905cb,0xac194346,0x0bcedcbe,0x0673acb6
	.word  0x427f914a,0x4e209f15,0x7bd91bf9,0x0d2e7ad3
	.word  0x511f8a2c,0xa676d423,0x49dba0dd,0x53ae0403
	.word  0xd1ba70f8,0xbf059668,0xfdff0251,0xade74b0a
	.word  0x9b00f69b,0x1c0820fc,0xf611089b,0xccf9c009
	.word  0x16d42c4d,0x9d288bce,0x4e828e34,0x6123893f
	.word  0x71d11dfc,0x728493fa,0x1f853923,0x9ed6247d
	.word  0x02010f08,0x33ea4517,0x6984646d,0x31814051
	.word  0xf62be339,0x19ebbf97,0x5a0e2768,0xbd990220
	.word  0x47c7eab4,0xa0487275,0x1358b54f,0x41cf569c
	.word  0x8cd8ab33,0xc32f65ea,0x9d85e762,0x3c82a254
	.word  0x90b81b69,0x29f6180f,0xb48348b8,0x781b4be4
	.word  0xb72ca6de,0x4999a8e6,0x83f4b5d5,0x3988bf6e
	.word  0x6b420d02,0x8e8669bd,0xbc783fc8,0xbb7fb96a
	.word  0x7bac1e55,0x493993dd,0x42101810,0x551e40e8
	.word  0x93b83870,0xea472544,0x97bf19da,0xa74864ae
	.word  0x9dab8803,0xebf788d9,0x2b4254a5,0x52027feb
	.word  0x54e1e34a,0x2644e480,0xc49aabe7,0xc8d03881
	.word  0x17e30999,0x90c6abdc,0x080771e6,0xb4d82c51
	.word  0x3cf9dd0d,0xc3086931,0x56596c2b,0xddcf8344
	.word  0xfe78f15e,0xd6c0427e,0x508847fe,0x15bfb2a5
	.word  0xafd8de09,0x25faa62d,0x8cc3c9c0,0x1f968706
	.word  0xe9f04e4b,0x537a526a,0x4bc55dc8,0xdee6f6f7
	.word  0x86cf7cfa,0xc212d936,0x87b25f3e,0x93f713e9
	.word  0x782781db,0xa8fa9e93,0x0b28ad80,0x9a90418a
	.word  0x19c987f6,0xd15bed5f,0x03bf607d,0xf57e4259
	.word  0x6dddabb2,0x6a0248b5,0x518bd7ef,0x3275bb01
	.word  0x79779274,0xb1f70b52,0x71e0f994,0x6176028c
	.word  0xf03d95ea,0xd35ba835,0x92536800,0xed308473
	.word  0xcb8f7794,0x0bc49144,0xe522b64e,0x32ee9cff
	.word  0x3a330cd5,0x6cb614b5,0xe3ee42fe,0xf72042aa
	.word  0x5845003e,0x63f832c1,0x9736574a,0x9400b13b
	.word  0xa45b9651,0xa5c9bf39,0xdfbc0a28,0xe008f7a4
	.word  0x6e397287,0x6625ec72,0x2a779204,0x59dbb0e3
	.word  0xe42dab03,0x55398b24,0xa9c0b66b,0xb1788cee
	.word  0xf8492804,0xc7f29a2a,0xcbca9384,0x061f8e91
	.word  0x25bf7f08,0x85147190,0x47d11f30,0xc9b66204
	.word  0xd8714955,0x72685de4,0x2b152cbc,0x15cac56b
	.word  0x9df117b6,0x02055617,0x05cfbccd,0xe5823e99
	.word  0x0a29af1a,0x0a4127ae,0x88626a1b,0x8115ee87
	.word  0x1c6bd4cd,0x8b108e61,0xe028cff1,0x13fafc8d
	.word  0xccb3ba86,0x50ecd795,0xa3989458,0xc2c7bdd3
	.word  0xbada8fda,0x72bef7b6,0x5a92caf6,0xf8848a65
	.word  0xd2f896d2,0xff1b9951,0x0ede8df9,0x2e59569e
	.word  0xa422bbd5,0x2167abb5,0xe6e72ab7,0x6a950340
	.word  0x225619dc,0xb2f24bca,0xd60b278f,0x05a01255
	.word  0xcd49ac30,0x8c022627,0x0fce2dce,0xa247c998
	.word  0xa00c8d5c,0xc488032c,0x200e74ca,0x3767a929
	.word  0x18023efa,0x2364e169,0x43900a0c,0x1d8b309c
	.word  0x218f50d0,0x8e1111e7,0xfbf7d6e6,0xd1c4e511
	.word  0x8273da1b,0x2f372964,0x69a81ed4,0x19700fa6
	.word  0x265a469d,0xcd382115,0x71d096ca,0x90d49913
	.word  0xb64dd93a,0xf91e03bd,0xde41d17f,0xa5ef2d75
	.word  0xbc92a3b7,0x90f80337,0x36c5a8b5,0x5bc42316
	.word  0xddb4ff46,0xb7e6f87a,0xdd863c53,0xc635f405
	.word  0x557e1fa8,0xd80faf60,0xacff0db2,0xbaa5f891
	.word  0xe64c9a52,0xa9658a05,0x87f901b9,0x51803841
	.word  0x6fe3111f,0xa50ce5c3,0xa07629b8,0xabf6f47a
	.word  0x599a6fee,0xe6fdd7cc,0x830c0a35,0xc8e9b6ea
	.word  0x242f7c82,0xbaa3bfd2,0x0cf8dfc1,0x329097a1
	.word  0xf6f5da01,0x6f32948f,0x32e5f81b,0x60817d76
	.word  0x08673cd2,0xf4bf0185,0x1242d1c5,0xb538c9d8
	.word  0xec82550a,0x0c795a86,0x23db26f0,0x27f12100
	.word  0xa9aeb5ac,0xe7f129b8,0xb1027299,0x65675ca5
	.word  0xc03883a2,0xe9ce007a,0x90fdee2c,0x1808cf55
	.word  0x691e98fd,0x6ed30bcc,0xc9b8b098,0x66eaca0f
	.word  0x03da2cc1,0x0f83aeab,0xff21fb34,0x11013a06
	.word  0x090709cb,0x3cd79ffd,0x9f4efbc2,0x83c3f294
	.word  0x97bf28e7,0x61be47d1,0x972fa81c,0xc1557f64
	.word  0x3db3ea2b,0x2dd25cac,0xf2b71b17,0x7b187f82
	.word  0x0ba5b4ff,0xd8a34bb5,0xaa322b56,0x9c64ddb1
	.word  0x0de0ca1a,0xc9238e33,0x1616bd04,0x80568976
	.word  0x23182ce5,0x9d535b13,0x78b49852,0xda499daa
	.word  0xfe9d7d7b,0xff591dc7,0x4b0a0584,0x87493882
	.word  0x22914090,0xbd27ac43,0xc3ab8c1e,0x4a706d6b
	.word  0xa8fd0abc,0x41da6659,0x75e5453b,0x464b9c06
	.word  0x3810bc9f,0x093e2895,0x07cfa9d4,0x1dad4b88
	.word  0xc9f87b72,0x15d97368,0xa42cceac,0xd10a0f87
	.word  0x5acec37d,0xafa63868,0x97c56fb1,0xfaacf5a9
	.word  0x984329ed,0xf9ecf791,0x5f35e4ee,0x3c7cbe00
	.word  0x8d5c96bb,0x319f7a56,0x2cf9fda4,0xe8aad75d
	.word  0x080d0c38,0x6c8506fe,0xfaf467d3,0xace8484e
	.word  0x5d8e1f53,0x3529f1b3,0x0155e427,0xddfb1092
	.word  0x9a4f52ff,0x41fcf518,0x0a3f4641,0x4680e1ea
	.word  0x996f74cd,0xc8406371,0x44d3cf58,0x8e0efc5c
	.word  0x30b4703d,0x8750c755,0xb16e8b3f,0x83a930ee
	.word  0x60783604,0xd2d04c02,0x9232df91,0x52cb473a
	.word  0x862bd546,0x54f5c865,0x6ba8431d,0x0d1ae0e7
	.word  0x40c250ef,0x89d7bc47,0xd1f2386e,0x597f898f
	.word  0xf6096c72,0x5f49b15b,0x0c247fcc,0xf3ccc55d
	.word  0x72139b0e,0x03c7cd53,0x42df481f,0x3fab2ea4
	.word  0x1b5e0eb6,0xeab3a989,0x67242015,0x6f068da9
	.word  0xd1a75c6b,0x135018ca,0xcea7b74d,0x479144a2
	.word  0xfedcea30,0x5d11f621,0xf618ed42,0x51bec151
	.word  0x94bc0747,0xfb522e28,0xd85174a4,0xeb2ab56d
	.word  0xc7aac7a5,0xc99542fe,0xed0d7cbd,0x60607e9f
	.word  0xa075024d,0x4794ee82,0x41b2ed45,0xb4579d51
	.word  0xf213d466,0xa9b04a8b,0x4c4e3921,0x2e15a511
	.word  0x18c988d9,0x68c57750,0x23fc2381,0x11dee1fa
	.word  0x4eccbdde,0x2adcb9c1,0x4bd4957c,0x66b0fc6c
	.word  0x116c6f37,0xcba546ee,0x40a138e0,0xa6e02b3d
	.word  0x1a5af420,0x2377f6e9,0x69038322,0x0ac62920
	.word  0x82b6e3cd,0x3c739f47,0x445f4032,0x3680e796
	.word  0x9e1cd29b,0x2ea36b8a,0xda79eda1,0xd5978369
	.word  0x74c8f7d2,0xea297ae5,0x52f1af39,0x548804af
	.word  0x02c403c6,0x8cf1ca78,0xf9bf1b04,0x2335b7a5
	.word  0x946be57d,0x8ca063a1,0xcbad3c85,0xcbadade6
	.word  0x6823e10d,0xb24931a8,0x663e6601,0x05700710
	.word  0xbf7b3743,0x0f059883,0x2fa1923c,0x37731c19
	.word  0x1f226c1d,0xa502e7a6,0xfac43af8,0x1fa3179b
	.word  0x79dce45e,0x02beedee,0x3cf3105a,0xbe650915
	.word  0x51cae3fa,0xc5468aa3,0xe0806567,0x77fc6205
	.word  0xeeae286c,0xa13131c4,0x549baa47,0x548eeb21
	.word  0xeef44872,0xb6f534bf,0xe48a0cac,0xe750418b
	.word  0x96388d3b,0xc07046fa,0x198f18fd,0x25afbb9b
	.word  0x4b9534a1,0x91a5ac3a,0x664ab1f7,0x5f825838
	.word  0x0a7f0a38,0xac55c4f7,0x3029da3f,0x7810378d
	.word  0xa54c96c2,0xabc2ded0,0x5f0e4d35,0x9bdd51f9
	.word  0x2fd4d4a3,0x5da25322,0xcdba4c5b,0xf3b6c83d
	.word  0xa03da010,0xa3ae581c,0xe85e6dec,0x4c1e5667
	.word  0xaad44872,0xc5ec10e4,0xd72563b5,0xdd43d354
	.word  0xced45e94,0x60a565c0,0xc179896e,0xf089dc90
	.word  0xca700df2,0x88b5bbaa,0xad2f16bc,0x41da061b
	.word  0x5653cf13,0x437afb25,0xf66b5403,0xac7d42e8
	.word  0x238e490f,0xd7a508d8,0x2824d363,0x84e1637e
	.word  0x4deb5a63,0x9c3c2cd2,0xf0f69125,0x510730bf
	.word  0x4dd534fd,0xce5c088f,0x7681cd9a,0x30e90769
	.word  0xd029bd40,0xec0f4b43,0x671624a7,0x6fd075e1
	.word  0xeb3276f5,0x235a482d,0x2e985bcc,0xf8b045f9
	.word  0xe69a9e29,0x5b33f779,0x2a55d8d3,0xc232f938
	.word  0xb31593b9,0xae9da493,0x6f1d06b1,0xa2d0e86a
	.word  0xbe85365f,0x93d71d11,0x651371c1,0xdcc88bfd
	.word  0xb5f35f11,0xe657eed1,0xbc99252c,0x1aa7dfb2
	.word  0x91e7ab6f,0xd2981ca0,0xf0b7db84,0x7e418b69
	.word  0x2c3bb619,0x98b74983,0x707f2c6f,0x030f1eec
	.word  0xc6efb76b,0xc73eafaf,0x21daecdf,0x473351b8
	.word  0xed8d9c33,0x7bda9089,0x7ac664c6,0xe545b25e
	.word  0x50f7c798,0x84efb14d,0xd4b7b899,0x2128710c
	.word  0x759a79cd,0x3b890fcb,0xfce719fb,0x5b5b79e5
	.word  0x1fdb15df,0x4de1e858,0xdf0e5c1f,0xdac42da8
	.word  0xf3078846,0x78bffcfe,0xd09b5ae4,0x4428264d
	.word  0xddf672eb,0x853b6dbd,0xf27b7940,0xd286fe6c
	.word  0xc878e3c2,0xfb64d0b5,0x10334df2,0x7bccf901
	.word  0x1dcfb6b7,0x69fe7276,0x6af9eeca,0x63399fe8
	.word  0xd8ba9707,0x94874d27,0x4a63c8f3,0xe0bfdeb2
	.word  0x6f324e48,0x9a430314,0x2b059184,0x54586193
	.word  0x6b46ebfd,0x32c294ca,0x75ef6984,0x575f0d9a
	.word  0x0934bd35,0x6e0f1279,0x26c4786d,0x91284fbb
	.word  0xd05081d5,0x2df3cbae,0xb4c73731,0xd2b1d403
	.word  0x9a0ab6e5,0x9737fca9,0x55186366,0x2d51b658
	.word  0xc51afb14,0xe3a3b302,0xc33fe9c7,0x1ed71098
	.word  0xb88fa570,0x8b75906d,0xe096221f,0xb765b508
	.word  0xba0a5518,0x1e27f369,0xe02643f3,0x3a45299d
	.word  0x3848f9a1,0x988e04ce,0xcba43bec,0xe28cff89
	.word  0x4485e77a,0x254db065,0xa3412d89,0x0bb9e0ac
	.word  0xcc737d12,0x422b1cb0,0x0b764a89,0xbcb1d37e
	.word  0xb9801c84,0x9ce1dfca,0x2fea1eaf,0x17e764a2
	.word  0x1f8d7e38,0x6b1e2ae7,0x84d0a299,0x25ef705b
	.word  0x5d156986,0xd830072e,0x8b1609ff,0x48bd454c
	.word  0x46dcc41a,0x54e5aed2,0xa6bb5dcc,0x73823e0a
	.word  0x08535ec2,0x8b0e2da9,0x2bb55d55,0xd61cd03a
	.word  0x10399eef,0xda4fff68,0x85eddf1c,0xe408ed24
	.word  0x5e1dfd52,0xd85c4440,0xdd8e7f1b,0x377f0722
	.word  0x14aa7771,0x2ce24449,0xfcd2e2ee,0x20fee49d
	.word  0x2356296c,0x3a439a94,0x862b3d61,0xd10d1f15
	.word  0x71ccac40,0xc04f5be4,0x43467c79,0x552ffc3c
	.word  0x5018221f,0xefb86c34,0xfb0be02f,0xf8544ed6
	.word  0x13898bd2,0xe370d4da,0x6e224d46,0x968545ef
	.word  0x866e5b84,0x59a76b78,0x11d82d1b,0xb3db5c71
	.word  0xd3b7f6e1,0xcd580533,0xf02ad083,0x23137d7a
	.word  0xa70f35aa,0x3a0dc9a7,0x3a27b19a,0x5dd181ec
	.word  0x1f4723e2,0x949230ad,0xe3bd2b9f,0x71ba3805
	.word  0xef667e55,0xb13ac2c5,0x754f2603,0xea70b75e
	.word  0xadb02575,0xf54354eb,0xa5844611,0x74781236
	.word  0x64e9d84e,0x22a146f7,0x1d0886d8,0xa50f6fcb
	.word  0xbed927db,0x9e6d77b1,0xe67542f8,0x9b7cf073
	.word  0x5d206cca,0xc3b98097,0xc38a46f7,0xbf6a4fae
	.word  0x2967e219,0x767a4bd8,0xa57d5297,0xd391ffb6
	.word  0xec5f0f7a,0xd7d5c987,0xfdd2fc97,0x37f993c5
	.word  0x9b5d14b8,0x9ea95a82,0x583c4e4b,0xe2d394a9
	.word  0x490f911d,0xd28ff925,0x5f9d60d0,0x0a4e2f89
	.word  0x2d47af83,0xf98ff0b2,0xea525915,0x3304a85f
	.word  0x62db75d6,0xdba82eb0,0x69f522bb,0x9b3d3f0f
	.word  0xfb4dfa28,0x33e580be,0x111b3c78,0xbe864097
	.word  0xf944f53d,0x3ba13cdc,0xa77d1f6e,0x3a7083d1
	.word  0xd37f3c9e,0x6b61e8de,0x62305091,0xc36b99f6
	.word  0xfa10bce9,0x3e82f3a2,0x862b3375,0x2ab79d6e
	.word  0x1ed22fc6,0x72a7604f,0xcf5785cb,0x9ad4929b
	.word  0x50e48a8e,0x3e642df5,0x6ff59272,0xe096694d
	.word  0x451738e3,0x031c5ebf,0xd613f25b,0xca42ff2b
	.word  0x58f07926,0x0e7760dd,0xaea206aa,0xf56d5027
	.word  0x25e5fab2,0xb33cbf64,0x62c7fc5c,0x46c2eb67
	.word  0x673848f7,0xfe0882e5,0xc5c1ed77,0xe8df305f
	.word  0x177fec32,0x0fbb9666,0x3d1a5646,0xed12121e
	.word  0x3003f854,0xe9ebefc6,0xc9298de0,0xda2316f0
	.word  0xf35c46fb,0xcdbf01f4,0x308f87c9,0x5a72fa45
	.word  0x570c0b49,0x61273284,0xbcbf798b,0xff6ac83d
	.word  0xf05cb21c,0x812960c3,0x672075e8,0x7ee82947
	.word  0x380f1bc8,0xa3c46dc6,0xf7c6aaa4,0xcba104dd
	.word  0x340c1770,0x0fd6d890,0xc5b044ca,0xe85a8bf5
	.word  0x7d2b36e8,0x30ed742b,0x91e7b0b1,0x8555b4b9
	.word  0x0b69af0e,0x602111fa,0x3dde75b1,0x73ce659b
	.word  0x904c99a6,0x46c6ac18,0x87bdd0f2,0xcefa14bd
	.word  0x6bb8e8a5,0xae254221,0xfbc83bef,0xef9050a0
	.word  0xdcbda8a9,0x3a146515,0x3e333bdd,0xc30c5eb5
	.word  0xac0aecfd,0x6084f7f2,0x1a784709,0x5f8e0376
	.word  0xd49d3c1c,0xcf2d2c64,0x09c36760,0x74be0727
	.word  0x9926c563,0x684e2589,0xa50ed17e,0x2dc57d2d
	.word  0xa5774825,0x09e9eba3,0x74b6b9d2,0x542851c8
	.word  0x8c5e5c91,0xb001adc6,0xd3b5159a,0xaf3d3984
	.word  0x01d59375,0x15147661,0x014a72b3,0x5fef2ebb
	.word  0xc31a390d,0x3939cf1e,0x178e709b,0x2891dee1
	.word  0xca2ecfcf,0x24de1e89,0x3abcf57e,0xc7ae5b5a
	.word  0xd491a0f6,0xd4fde060,0x64085806,0x66527661
	.word  0x7c38c7b0,0x22363409,0x1b68a922,0x52934cae
	.word  0x26029344,0xba182c03,0x5c6b8dc5,0xd3bf69f0
	.word  0x19bc9e9d,0xd0189219,0x66792f41,0x73318c95
	.word  0xba8c408c,0xa060d864,0x6222fd0a,0x7f198148
	.word  0x5302087b,0x01f808e9,0xcfc60c47,0x5cb10935
	.word  0xf396e4bc,0xbcc675e2,0xc421f5f2,0x0d5e395d
	.word  0x1b423e7b,0xbb794fe3,0x4b767c34,0xdbd2b658
	.word  0xaf2f7eb0,0x39b7d7d5,0xf8e47727,0x0470754c
	.word  0x68450d6c,0xb69ba575,0xc93030a2,0xfdc397cc
	.word  0x64e2e888,0x3578f0d2,0x29918ce7,0xfd17c828



#if 0
!!# /************************************************************
!!# /**
!!# *
!!# * File:         retr_mul.j
!!# *
!!# * Description:  
!!# * Covers all coverage conditions in ifu_simul_swout that
!!# * involve a retracted mul.
!!# *
!!# **************************************************************/
!!# 
!!# template main ();
!!# 
!!# %%section c_declarations
!!# 
!!#   int i = 0;
!!#   int bitnum = 0;
!!#   int label_cnt = 0;
!!#   int irf_err_cnt = 0;
!!#   int ic_err_cnt = 0;
!!#   int dc_err_cnt = 0;
!!#   int intr_cnt = 0;
!!#   int burst_cnt = 0;
!!# 
!!# %%section init
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{2..8}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{16..31}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld (ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld (ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_set_ropr_fld (Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld (Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_set_ropr_fld (Ro_load_r, Ft_Rs2, "{0}");
!!# 
!!#   IJ_copy_ropr (Ro_rsvd_set, ijdefault);
!!#   IJ_set_ropr_bits (Ro_rsvd_set, 0xf70, "12'b000011100000");
!!# 
!!# #ij ifdef MT_4
!!#   IJ_bind_thread_group(th_mul, 0x5);
!!#   IJ_bind_thread_group(th_evnt, 0xa);
!!#   IJ_bind_thread_group(th_all, 0xf);
!!# #ij else 
!!#   IJ_bind_thread_group(th_mul, 0x2);
!!#   IJ_bind_thread_group(th_evnt, 0x1);
!!#   IJ_bind_thread_group(th_all,0x3);
!!# #ij endif
!!# 
!!#   IJ_th_fork_group (th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar (reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 16; i < 32; i++) {
!!#      IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar (reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!#    
!!#   //Initialize Rs1
!!#   for (i = 2; i < 9; i++) {
!!#      IJ_printf (th_all, "\tsetx MAIN_BASE_DATA_VA, %%r1, %%r%d\n", i);
!!#   }
!!# 
!!# //  IJ_printf (th_all, "\twr %%r0, 0x4, %%fprs\n");
!!# //  IJ_init_fp_regs (th_all, 4);
!!# 
!!#   IJ_set_rvar (mul_wt, "{50}");
!!# 
!!# %%section finish
!!# 
!!#   IJ_th_join (0xf);
!!#   IJ_th_start (Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar (data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf (th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf (th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf (th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }
!!# 
!!# %%section diag_ini
!!# #define NO_TRAPCHECK
!!# #include "enable_traps.h"
!!# #include "boot.s"
!!# 
!!# !SIMS: -non_shared
!!# !SIMS: +spis
!!# 
!!# .text
!!# .global main
!!# 
!!# main:
!!# 
!!# %%section diag_fini
!!# 
!!# %%section grammar
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: d0 mul
!!#            {
!!#                IJ_generate (th_mul, $2);
!!#  	       IJ_generate_from_token (7, th_mul, ijdefault, tMULX_R, tMULX_I,
!!#                                        tUMUL_R, tUMUL_I, tSMUL_R, tSMUL_I, tUMULcc_R, 
!!#      				       tUMULcc_I, tSMULcc_R, tSMULcc_I, tMULScc_R, tMULScc_I, NULL);
!!#            }
!!#            | alu_irf_err 
!!#              {IJ_printf (th_evnt, "!alu_irf_err\n");}
!!#            | ldst_irf_err 
!!#              {IJ_printf (th_evnt, "!ldst_irf_err\n");}
!!#            | ld_dc_err 
!!#              {IJ_printf (th_evnt, "!ld_dc_err\n");}
!!#            | resum_intr 
!!#              {IJ_printf (th_evnt, "!resum_err_err\n");}
!!#            | alu_burst
!!#              {IJ_printf (th_evnt, "!alu_burst\n");}	    
!!# ;
!!# 
!!# alu_irf_err: irferr alu trpm_alu alu mul_ic_err 
!!# ;
!!# 
!!# mul_ic_err: icerr mul
!!#            | d1 mul
!!#            | d2 mul icerr alu
!!# ;
!!# 
!!# ldst_irf_err:   st_irferr_unalgn trpm_alu alu mul_ic_err 
!!#                 | ld_irferr_unalgn trpm_alu alu mul_ic_err
!!# ;
!!# 
!!# st_irferr_unalgn: irferr store_i 
!!#                   | d3 store_i %ropr Ro_unaligned_addr
!!#                   | d4 store_i
!!# 		  | d6 irferr store_i  %ropr Ro_unaligned_addr
!!# ;
!!# 
!!# ld_irferr_unalgn: irferr load 
!!#                   | d7 load %ropr Ro_unaligned_addr
!!#                   | d8 load
!!# 		  | d9 irferr load  %ropr Ro_unaligned_addr
!!# ;
!!# 
!!# ld_dc_err: dcerr load_r trpm_alu mul_ic_err
!!# ;
!!# 
!!# resum_intr: mMETA16
!!# {
!!#   IJ_printf (th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf (th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(1, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA17
!!# { 
!!#    burst_cnt = random () % 5 + 3; 
!!#    IJ_generate_from_token (burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, 
!!#                            tSRAX_I, tSUB_R, tSUB_I, tSUBcc_R, tSUBcc_I, tSUBC_R, tSUBC_I, 
!!#                            tSUBCcc_R, tSUBCcc_R, tSUBCcc_I, NULL);
!!# }
!!# ;
!!# 
!!# icerr: mMETA18
!!# {
!!#    IJ_printf (th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA19
!!# {
!!#    IJ_printf (th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf (th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf (th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# trpm_alu: d10 alu 
!!#           | d5 alu %ropr Ro_rsvd_set
!!# ;
!!# 
!!# mul: d11 mul_tokens
!!# {
!!#    IJ_generate (th_evnt, $2);
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
!!#          IJ_generate (th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!#       | d12 load_i_tokens 
!!#       {
!!#          IJ_generate (th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!# ;
!!# 
!!# load_r: d13 load_r_tokens %rvar Ro_load_r
!!# {
!!#    IJ_generate (th_evnt, $2);
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
!!#    IJ_generate (th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# store_i_tokens: tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# ;
!!# 
!!# alu: d15 alu_tokens
!!# {
!!#    IJ_generate (th_evnt, $2);
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
!!# //                       |  tSUBCcc_R | tSUBCcc_R | tSUBCcc_I
!!# ;
!!# 
!!# d0: mMETA0
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
!!# %%
!!# endtemplate
#endif

