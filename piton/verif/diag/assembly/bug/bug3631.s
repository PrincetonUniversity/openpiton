// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3631.s
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
   random seed:	192291259
   Jal retr_div.j:	
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
	setx  0xae3308bd254a06d0, %r1, %r16
	setx  0x58471a0fa98b88cf, %r1, %r17
	setx  0x586c7b59a233666f, %r1, %r18
	setx  0xeca43d01eb126c21, %r1, %r19
	setx  0xdac7b6a029462f72, %r1, %r20
	setx  0xf08c026e520d044c, %r1, %r21
	setx  0x61cec1d1f15762e1, %r1, %r22
	setx  0x1e7253c66abbe393, %r1, %r23
	setx  0xba55109ed9632112, %r1, %r24
	setx  0xffda712616706013, %r1, %r25
	setx  0xb7b638e3b276f6a8, %r1, %r26
	setx  0x927dddd438c10cb1, %r1, %r27
	setx  0x766aff7e7086865d, %r1, %r28
	setx  0x012bb7581fab3e3e, %r1, %r29
	setx  0xbd3bd07fd04d11a9, %r1, %r30
	setx  0xb32e77450a392c41, %r1, %r31
	setx  0x0000000000000880, %r1, %r9
	setx  0x0000000000000130, %r1, %r10
	setx  0x00000000000003b0, %r1, %r11
	setx  0x00000000000007f0, %r1, %r12
	setx  0x00000000000001b0, %r1, %r13
	setx  0x0000000000000190, %r1, %r14
	setx  0x0000000000000250, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	.word 0xa6f8eec2  ! 30: SDIVcc_I	sdivcc 	%r3, 0x0ec2, %r19
	.word 0xb8f9000f  ! 30: SDIVcc_R	sdivcc 	%r4, %r15, %r28
	.word 0xb869400f  ! 30: UDIVX_R	udivx 	%r5, %r15, %r28
	.word 0xb4f0e66f  ! 30: UDIVcc_I	udivcc 	%r3, 0x066f, %r26
	.word 0xa0710009  ! 30: UDIV_R	udiv 	%r4, %r9, %r16
	.word 0xa36a000b  ! 30: SDIVX_R	sdivx	%r8, %r11, %r17
	.word 0xbcf16d35  ! 30: UDIVcc_I	udivcc 	%r5, 0x0d35, %r30
	.word 0xae78800b  ! 30: SDIV_R	sdiv 	%r2, %r11, %r23
	.word 0xbc71eeeb  ! 59: UDIV_I	udiv 	%r7, 0x0eeb, %r30
	.word 0xa6f9691a  ! 59: SDIVcc_I	sdivcc 	%r5, 0x091a, %r19
	.word 0xb270c00a  ! 59: UDIV_R	udiv 	%r3, %r10, %r25
	.word 0xbe69e0cc  ! 59: UDIVX_I	udivx 	%r7, 0x00cc, %r31
	.word 0xa079400d  ! 59: SDIV_R	sdiv 	%r5, %r13, %r16
	.word 0xbe7166d9  ! 59: UDIV_I	udiv 	%r5, 0x06d9, %r31
	.word 0xbb68800d  ! 59: SDIVX_R	sdivx	%r2, %r13, %r29
	.word 0xb268ee26  ! 59: UDIVX_I	udivx 	%r3, 0x0e26, %r25
	.word 0xad696057  ! 63: SDIVX_I	sdivx	%r5, 0x0057, %r22
	.word 0xb078800a  ! 63: SDIV_R	sdiv 	%r2, %r10, %r24
	.word 0xa07a000a  ! 63: SDIV_R	sdiv 	%r8, %r10, %r16
	.word 0xa369800b  ! 63: SDIVX_R	sdivx	%r6, %r11, %r17
	.word 0xbc78e5c3  ! 63: SDIV_I	sdiv 	%r3, 0x05c3, %r30
	.word 0xb0712dfb  ! 63: UDIV_I	udiv 	%r4, 0x0dfb, %r24
	.word 0xbcf96240  ! 63: SDIVcc_I	sdivcc 	%r5, 0x0240, %r30
	.word 0xa87120e6  ! 63: UDIV_I	udiv 	%r4, 0x00e6, %r20
	.word 0xba710009  ! 110: UDIV_R	udiv 	%r4, %r9, %r29
	.word 0xaef0a77b  ! 110: UDIVcc_I	udivcc 	%r2, 0x077b, %r23
	.word 0xa4692317  ! 110: UDIVX_I	udivx 	%r4, 0x0317, %r18
	.word 0xacf1664b  ! 110: UDIVcc_I	udivcc 	%r5, 0x064b, %r22
	.word 0xaa72000b  ! 110: UDIV_R	udiv 	%r8, %r11, %r21
	.word 0xb269400b  ! 110: UDIVX_R	udivx 	%r5, %r11, %r25
	.word 0xb968e449  ! 110: SDIVX_I	sdivx	%r3, 0x0449, %r28
	.word 0xbaf1258d  ! 110: UDIVcc_I	udivcc 	%r4, 0x058d, %r29
	.word 0xa769a278  ! 113: SDIVX_I	sdivx	%r6, 0x0278, %r19
	.word 0xb27a2ceb  ! 113: SDIV_I	sdiv 	%r8, 0x0ceb, %r25
	.word 0xba69c009  ! 113: UDIVX_R	udivx 	%r7, %r9, %r29
	.word 0xb0f9c00e  ! 113: SDIVcc_R	sdivcc 	%r7, %r14, %r24
	.word 0xa268e06f  ! 113: UDIVX_I	udivx 	%r3, 0x006f, %r17
	.word 0xb2692bf9  ! 113: UDIVX_I	udivx 	%r4, 0x0bf9, %r25
	.word 0xad69400a  ! 113: SDIVX_R	sdivx	%r5, %r10, %r22
	.word 0xba70a1bc  ! 113: UDIV_I	udiv 	%r2, 0x01bc, %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x0f32188bcc3d7779, %r1, %r16
	setx  0xef2381447a083fe9, %r1, %r17
	setx  0x7bb400bb3322e83b, %r1, %r18
	setx  0x2c059cfd708f8997, %r1, %r19
	setx  0x2cc53c94f968b8dc, %r1, %r20
	setx  0x6b82ba60a0457a93, %r1, %r21
	setx  0xf57531e350945f75, %r1, %r22
	setx  0x6c9839e77cad95a1, %r1, %r23
	setx  0x40c4fa3cfd0e0856, %r1, %r24
	setx  0xa5e731db0d7fdd38, %r1, %r25
	setx  0xf07e446d8214b82a, %r1, %r26
	setx  0xe4eca6df9b750b8d, %r1, %r27
	setx  0x28f5895ff7359fbe, %r1, %r28
	setx  0xd046b318f0fbe96c, %r1, %r29
	setx  0x49a4d12656b5a83f, %r1, %r30
	setx  0xd9aed3a35960255b, %r1, %r31
	setx  0x0000000000000610, %r1, %r9
	setx  0x00000000000000e0, %r1, %r10
	setx  0x0000000000000da0, %r1, %r11
	setx  0x0000000000000250, %r1, %r12
	setx  0x0000000000000c60, %r1, %r13
	setx  0x0000000000000ed0, %r1, %r14
	setx  0x0000000000000050, %r1, %r15
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
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,51,x, x,x,x, x,x,x)
	.word 0xe830e9e4  ! 5: STH_I	sth	%r20, [%r3 + 0x09e4]
	.word 0xaa8a2e20  ! 8: ANDcc_I	andcc 	%r8, 0x0e20, %r21
	.word 0xb139400b  ! 10: SRA_R	sra 	%r5, %r11, %r24
	.word 0xb87a000e  ! 13: SDIV_R	sdiv 	%r8, %r14, %r28
!ldst_irf_err
	.word 0xe0192308  ! 16: LDD_I	ldd	[%r4 + 0x0308], %r16
	.word 0xba31000f  ! 19: ORN_R	orn 	%r4, %r15, %r29
	.word 0xb099af9a  ! 21: XORcc_I	xorcc 	%r6, 0x0f9a, %r24
	.word 0xbe79000f  ! 24: SDIV_R	sdiv 	%r4, %r15, %r31
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xb1313001  ! 27: SRLX_I	srlx	%r4, 0x0001, %r24
!ldst_irf_err
	.word 0xb2f8a60f  ! 30: SDIVcc_I	sdivcc 	%r2, 0x060f, %r25
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xf650800d  ! 34: LDSH_R	ldsh	[%r2 + %r13], %r27
	.word 0xaf78040b  ! 37: MOVR_R	move	%r0, %r11, %r23
	.word 0xa6c0a23e  ! 39: ADDCcc_I	addccc 	%r2, 0x023e, %r19
	.word 0xb871000a  ! 42: UDIV_R	udiv 	%r4, %r10, %r28
!ldst_irf_err
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xfc5964b0  ! 45: LDX_I	ldx	[%r5 + 0x04b0], %r30
	.word 0xb738e001  ! 48: SRA_I	sra 	%r3, 0x0001, %r27
	.word 0xb6308009  ! 50: SUBC_R	orn 	%r2, %r9, %r27
	.word 0xbe78c00d  ! 53: SDIV_R	sdiv 	%r3, %r13, %r31
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xb53a3001  ! 56: SRAX_I	srax	%r8, 0x0001, %r26
!ldst_irf_err
	.word 0xb071e804  ! 59: UDIV_I	udiv 	%r7, 0x0804, %r24
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
	.word 0xbb692bdb  ! 63: SDIVX_I	sdivx	%r4, 0x0bdb, %r29
	.word 0xb229800f  ! 64: ANDN_R	andn 	%r6, %r15, %r25
	.word 0xa129500e  ! 64: SLLX_R	sllx	%r5, %r14, %r16
	.word 0xab28d00c  ! 64: SLLX_R	sllx	%r3, %r12, %r21
	.word 0xa4a9000f  ! 64: ANDNcc_R	andncc 	%r4, %r15, %r18
!alu_burst
	.word 0xf8716a88  ! 67: STX_I	stx	%r28, [%r5 + 0x0a88]
	.word 0xa889ef84  ! 70: ANDcc_I	andcc 	%r7, 0x0f84, %r20
	.word 0xb4b9c00d  ! 72: XNORcc_R	xnorcc 	%r7, %r13, %r26
	.word 0xb47a000a  ! 75: SDIV_R	sdiv 	%r8, %r10, %r26
!ldst_irf_err
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,15)
	.word 0xea01c00d  ! 78: LDUW_R	lduw	[%r7 + %r13], %r21
	.word 0xad30e001  ! 81: SRL_I	srl 	%r3, 0x0001, %r22
	.word 0xae79000a  ! 84: SDIV_R	sdiv 	%r4, %r10, %r23
!ld_dc_err
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,23,x, x,x,x, x,x,x)
	.word 0xf0098009  ! 87: LDUB_R	ldub	[%r6 + %r9], %r24
	.word 0xb9390009  ! 90: SRA_R	sra 	%r4, %r9, %r28
	.word 0xa899c00b  ! 92: XORcc_R	xorcc 	%r7, %r11, %r20
	.word 0xbef0c00b  ! 95: UDIVcc_R	udivcc 	%r3, %r11, %r31
!ldst_irf_err
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,34)
	.word 0xe400c009  ! 98: LDUW_R	lduw	[%r3 + %r9], %r18
	.word 0xbe3125d1  ! 101: ORN_I	orn 	%r4, 0x05d1, %r31
	.word 0xba69a256  ! 104: UDIVX_I	udivx 	%r6, 0x0256, %r29
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xa0a8a54b  ! 107: ANDNcc_I	andncc 	%r2, 0x054b, %r16
!ld_dc_err
	.word 0xb072000e  ! 110: UDIV_R	udiv 	%r8, %r14, %r24
	.word 0xa769ea18  ! 113: SDIVX_I	sdivx	%r7, 0x0a18, %r19
	.word 0xa089800f  ! 114: ANDcc_R	andcc 	%r6, %r15, %r16
	.word 0xb821e97b  ! 114: SUB_I	sub 	%r7, 0x097b, %r28
	.word 0xbc40af2f  ! 114: ADDC_I	addc 	%r2, 0x0f2f, %r30
!alu_burst
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,5)
	.word 0xf841000d  ! 117: LDSW_R	ldsw	[%r4 + %r13], %r28
	.word 0xac99c00b  ! 120: XORcc_R	xorcc 	%r7, %r11, %r22
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xa469800c  ! 123: UDIVX_R	udivx 	%r6, %r12, %r18
!ld_dc_err
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,71,x, x,x,x, x,x,x)
	.word 0xe671a968  ! 127: STX_I	stx	%r19, [%r6 + 0x0968]
	.word 0xa840c00d  ! 130: ADDC_R	addc 	%r3, %r13, %r20
	.word 0xa431000c  ! 132: ORN_R	orn 	%r4, %r12, %r18
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xa272000c  ! 135: UDIV_R	udiv 	%r8, %r12, %r17
!ldst_irf_err
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf2712b28  ! 139: STX_I	stx	%r25, [%r4 + 0x0b28]
	.word 0xbe39400c  ! 142: XNOR_R	xnor 	%r5, %r12, %r31
	.word 0xab643801  ! 144: MOVcc_I	<illegal instruction>
	.word 0xa478ea98  ! 147: SDIV_I	sdiv 	%r3, 0x0a98, %r18
!ldst_irf_err
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
thr0_resum_intr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
	.word 0xe81a000f  ! 153: LDD_R	ldd	[%r8 + %r15], %r20
	.word 0xb099000b  ! 156: XORcc_R	xorcc 	%r4, %r11, %r24
	.word 0xac39c00f  ! 158: XNOR_R	xnor 	%r7, %r15, %r22
	.word 0xa27a2bf9  ! 161: SDIV_I	sdiv 	%r8, 0x0bf9, %r17
!ldst_irf_err
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xee01800d  ! 164: LDUW_R	lduw	[%r6 + %r13], %r23
	.word 0xaea9000b  ! 167: ANDNcc_R	andncc 	%r4, %r11, %r23
	.word 0xb8c22046  ! 169: ADDCcc_I	addccc 	%r8, 0x0046, %r28
	.word 0xbcf1ad36  ! 172: UDIVcc_I	udivcc 	%r6, 0x0d36, %r30
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xbe81a592  ! 175: ADDcc_I	addcc 	%r6, 0x0592, %r31
!ldst_irf_err
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,60)
	.word 0xe65a000a  ! 178: LDX_R	ldx	[%r8 + %r10], %r19
	.word 0xbf38a001  ! 181: SRA_I	sra 	%r2, 0x0001, %r31
	.word 0xbe69ee2f  ! 184: UDIVX_I	udivx 	%r7, 0x0e2f, %r31
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xa6b22c4b  ! 187: ORNcc_I	orncc 	%r8, 0x0c4b, %r19
!ld_dc_err
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,29)
	.word 0xec11c00b  ! 190: LDUH_R	lduh	[%r7 + %r11], %r22
	.word 0xbcc1400f  ! 193: ADDCcc_R	addccc 	%r5, %r15, %r30
	.word 0xaf68eddb  ! 196: SDIVX_I	sdivx	%r3, 0x0ddb, %r23
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xbd31e001  ! 199: SRL_I	srl 	%r7, 0x0001, %r30
!ld_dc_err

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
	.word  0xe57391be,0x064b3a59,0x7a04f50f,0x3b3e8476
	.word  0x0d8fe2f7,0xe878057e,0x69384102,0x7732d66f
	.word  0xe1ffd65d,0xbf071d3e,0xaaa779bc,0xd181e90f
	.word  0x3536a157,0x79e9e9d5,0x2a2d7939,0xcf8ebfd1
	.word  0x50d60539,0xfd955a16,0x12010d5c,0xd1345a37
	.word  0x4a7847eb,0xb18b0326,0xc524bdcc,0x138f6fa4
	.word  0x5e0486d9,0xd0498a10,0x243b0a1f,0x4d32aaf5
	.word  0xe3ffb954,0x775d051e,0x8f7fdfb0,0x0fb796e3
	.word  0xb9c06c51,0xcc3ebde1,0x2ac59d37,0xfc7bdbc3
	.word  0xe6cd9b43,0x36e71357,0xbf849340,0x3aa22c84
	.word  0x2c875255,0x86fbe99d,0x6c36d27d,0xf29d92a6
	.word  0x7f140c9b,0x3b10b2a6,0x1d42ae39,0x4f88b584
	.word  0x4b6e0a28,0x8ee06fa0,0x41efc181,0x19270fd7
	.word  0x7e6c094f,0x477bb184,0xb8e97946,0xc33abc31
	.word  0x303d3f0a,0xf77bc449,0x1446d770,0xcb55a65a
	.word  0xc39e7432,0x26fa3ddf,0xbfda4ab2,0x02171590
	.word  0x4de6ea09,0x077ae261,0xfc186d80,0xaa8126a6
	.word  0x950a1b13,0x8481884f,0xdfda8315,0x2ae704af
	.word  0xec7b971c,0x648d84f0,0xeac15ada,0x3f6fb2fc
	.word  0xa34e8b01,0x91499cad,0x73bcde44,0xd922d068
	.word  0x4f129e9e,0x33848e70,0x80d57bba,0xa5eaa357
	.word  0x3132930d,0xdb084872,0xc33c6a00,0xdf072efe
	.word  0x79aa280c,0xa3b9d9af,0x0453e4f3,0x07938b47
	.word  0x0c519d3d,0x2fda7c75,0x338fd880,0x00ea6ae5
	.word  0x80c68dd9,0x0c3f7fae,0x562d8c18,0xfa7048b6
	.word  0x7726150a,0x76dad15d,0x2d84635a,0xa18f1dbf
	.word  0x3974943a,0x64d33902,0x86a8bc91,0x0c146ce3
	.word  0xd7d52120,0x4bacf908,0xbe1d8536,0xb67a21ec
	.word  0x773ee68f,0xa416ddde,0x076de78c,0xa34cbba4
	.word  0x0219c340,0x586ed3ca,0xc951a125,0x43f547ae
	.word  0x86719fcf,0x8a12655e,0x746c4531,0x0f05b346
	.word  0xae5f402d,0x48ab819a,0x35db3848,0xa8da0e20
	.word  0xc26fb32f,0x7d5cda8e,0x06f4db6e,0x5d561695
	.word  0xe53c8d29,0xd1df1115,0x25dafd01,0x6e8425eb
	.word  0x3270491b,0x3a262269,0x4e3cf50e,0x161e0be9
	.word  0xcb7c3bd2,0x3e3cf343,0xf5ca9cac,0x99bf7fc1
	.word  0x50c44b86,0x141b72a8,0xbc4f3909,0xde637e1c
	.word  0x577e3f90,0x4ffca4d5,0x9342f553,0x07e15506
	.word  0x56a638b4,0x8a63d4b2,0x8cb48779,0xd3110f5c
	.word  0x7e149ebf,0x4c8a9f13,0x959281e8,0x2dddf688
	.word  0x8b4ab311,0x80b422fb,0xceba2d77,0x2f991dc0
	.word  0x5ee29505,0xd958512b,0xad776c58,0x1b3ce465
	.word  0x9fb42ee3,0x90d3f610,0xd8f6de55,0xdad46d59
	.word  0xf84938ef,0x578c1914,0xb349633e,0xfbbea17b
	.word  0xa3022bdf,0x395522ab,0x6793837c,0x39351da1
	.word  0x13803257,0x5944e3be,0x07296b58,0x7cd3ed9f
	.word  0xa3ed16fa,0x51be539f,0x4bea768a,0xbebd2989
	.word  0x50c66f7e,0x4cfac34e,0xd2fa5eb8,0xda01117f
	.word  0xc539001b,0x875c82ab,0x645c7401,0x5f14093b
	.word  0x6dd64b12,0x5113e469,0x339a6664,0x8f0c0dcd
	.word  0xb9d2a664,0xcb9ef550,0x6303170e,0xf13463d2
	.word  0x6cda200d,0x41f0d8a4,0x35bc64ce,0xa4868181
	.word  0x97768813,0x7f127c7f,0xb1bd4c3e,0xc84e1ae9
	.word  0x41cb1ac1,0x1845c687,0xc19a1167,0xb8d6b831
	.word  0xfe22efad,0x47a0ec0c,0x6e8c0c51,0x2b38654a
	.word  0x80e2f51a,0xbd8ce404,0xb0f7d088,0x376b1dc0
	.word  0x7a724f86,0x084cc207,0x20e489a5,0xbcfd60b7
	.word  0x57802533,0xe84ddf5b,0x3eaae2e6,0xc1e099da
	.word  0x0701b785,0xba5c6983,0xe69e8b86,0x0cdef15d
	.word  0x3bc8e801,0x26e88960,0xca3a2022,0xfe05c01b
	.word  0x099b2fb0,0xfa4bac9f,0x8e259a29,0x0b27354a
	.word  0x5d041967,0xaf368409,0x8506a376,0x19a5f19b
	.word  0xd15ddef6,0xa261fac0,0x98c49130,0xdd1301b2
	.word  0x40b8f4c4,0xb4bb87e5,0xaf45eb98,0xf64f5d29
	.word  0xd02c01ff,0x6ec85898,0x37b301de,0xe3e0bc2c
	.word  0xcb3bd515,0x2b701b79,0xe8b1043a,0xc09af1d3
	.word  0xb718d3c1,0xe1325967,0x52dda940,0xd0841d3d
	.word  0xf864ccfb,0xc27253a3,0xf87a94f6,0x954fec70
	.word  0xa0a86baa,0x6a1cdfd7,0x21cadbf0,0x1db2453e
	.word  0xd56879be,0x97e5f020,0x788b64b2,0xdb188c00
	.word  0x390f264b,0x9a5cb2bb,0xab552fc1,0xeaa22dd2
	.word  0x77b3c576,0x1e28debf,0x9511326d,0x20189d6a
	.word  0x762187a8,0x9479c6e7,0x40306751,0x6f1890e0
	.word  0x012ab21c,0xc6a76c13,0xbacdbc46,0x7871850a
	.word  0x391b15ba,0x562846fe,0xeed60d3b,0xaaaee286
	.word  0x424c1e6b,0x6309abd7,0xb7ea4bab,0xec48b613
	.word  0x05a178df,0x96a68e9f,0x54679acd,0x34761d88
	.word  0x39c42016,0xdf0ca39d,0x9bd0dd5f,0xdb44500b
	.word  0x5b249980,0x51e02b59,0x8d48d086,0x1f8ba098
	.word  0xb7237bd3,0x34154196,0x14d10eb1,0x713313cb
	.word  0x48ea3159,0xb3e998b5,0x5d7b0586,0x512b88c1
	.word  0xf017d810,0x4c6df593,0x11f239f4,0x75dd407f
	.word  0x27643139,0x0c912dac,0x9220a514,0x48b61ccf
	.word  0xafef9fba,0x81ce47db,0x5ef062da,0x124332be
	.word  0xa5c95f4e,0x2b0e8a0f,0x20eb34d2,0xef6f519e
	.word  0xa31ce32e,0x880a08ed,0x08b0070e,0x70f06c2f
	.word  0x0765a3af,0xd23c8b29,0x167d1ca3,0x0c85f84a
	.word  0x0b441568,0x0dbb5c9a,0x44ce4fa1,0x6015a9ff
	.word  0xa161a8b4,0xa053342a,0xd1e745f6,0x760df895
	.word  0x9778606a,0x26e5f765,0xf3a7223d,0x10a32adc
	.word  0xf61a21e9,0x71dc5f05,0x8b6258fb,0xc465a4eb
	.word  0x5d7b4ee0,0x9aba8562,0x028611f7,0x58ebad76
	.word  0xd1e6ad4e,0xdc437a46,0x04199cc7,0xa5363120
	.word  0xb1629f44,0xefa995c6,0x2e0efdf4,0xb42b8d19
	.word  0xfcd8a8f5,0x52cd2404,0x8be76e85,0xe0c59e30
	.word  0xde6733a6,0xf91b9adc,0xf261b613,0xbcde7aaf
	.word  0x6bf4a4b3,0xcfc70a78,0x2fa541db,0x279fc5f8
	.word  0xa4ca6c02,0xb2657cac,0x25c1abf0,0xdb0a713d
	.word  0x73ac667d,0x1b380050,0xd94b3a2f,0xf7785b1d
	.word  0x7e782d41,0x77c83918,0x9d39f563,0x38336296
	.word  0x6b1eb5c1,0x7da05528,0xe3370c51,0x08d82719
	.word  0x316b3809,0x3831f7c5,0xdb1c4a0c,0xcf3e052f
	.word  0xa35ba956,0x97ff56b9,0x246341ff,0x0ab73d7c
	.word  0xf72b583f,0x491b2bef,0x45fa0971,0x469c0b01
	.word  0x77289a30,0x9b0c163e,0x5dd38692,0x46ad73a0
	.word  0x246edbe4,0x685fdf38,0x708c9265,0x908b4cef
	.word  0x6e3a2c6c,0xe5bfb1e2,0x6f8ab3d6,0xe546ae49
	.word  0x7c1b05be,0x4b6f2e08,0x2f932e9e,0x9c6f7ed6
	.word  0xc8b71139,0xc6e861c1,0x06a33176,0x6d65af56
	.word  0x0940ee9c,0x7ab7f02f,0x61be8096,0xc03bb9b9
	.word  0x8d27ff5d,0x0e6e0ec2,0xf8a56e0d,0xb590ca07
	.word  0x1cf45a02,0x1c8ab84d,0x0dfa221e,0x8f084270
	.word  0x2b12de69,0x1836b1a4,0x53d2ac04,0x19d3d890
	.word  0x2fd5288f,0xd2291a4d,0x86714d99,0x058d17eb
	.word  0x65ea3e86,0x1e1d9dd2,0x3c8d5611,0x690b6eaf
	.word  0x10eee4f4,0x51bfae37,0xbc6651d7,0xb78e6a50
	.word  0x1a8a17f2,0x75c7d2de,0x32d43ef1,0xcbb38eaa
	.word  0x36fa7cbb,0x0914bdf3,0x438db3df,0x0f7d45bf
	.word  0x3bb17aee,0x169780f5,0x658ff7cc,0xf50504d3
	.word  0xc4af228f,0x7063c813,0xb64f9174,0x370f7fa0
	.word  0x27fd7ecd,0x11e7c69d,0x83dbd417,0xb51a4cb6
	.word  0x5b430a5c,0xef4c6d91,0x4a134720,0xc5ea3258
	.word  0x7fdfaf5c,0xb1515b22,0x3a446ee3,0xacdeee2b
	.word  0xf2c358b9,0x1017113d,0x671c14e9,0x3d7b703a
	.word  0x049a6dc6,0x4e9f5fb3,0xba79b61a,0x057bc5a3
	.word  0x53f72f87,0x573ea94b,0x8b733942,0xa3bf594c
	.word  0x47e5c0cf,0x7f8c6309,0xe3642fc2,0x939ab629
	.word  0xfd1d1da9,0x375c6b11,0xff8c80c8,0x7bbd55be
	.word  0xa8201047,0x73e0693d,0x19acf823,0x6df0ad43
	.word  0xc03efee1,0x0e8cf77a,0x0c78ca2a,0xeeb0eda8
	.word  0xa88ec92d,0x6f89d240,0x3503dcb2,0x067364b7
	.word  0x87c6a01f,0x8208748f,0x68f51935,0xc5e7c06f
	.word  0xee1272fc,0x9dccf9f2,0xa7d430af,0x4fe17a7d
	.word  0x6d8d90d2,0x188ce5da,0x902630d6,0x2164b0a2
	.word  0x8436e407,0xb67c2e58,0xb31bf3cb,0x4dd306f8
	.word  0x88541db5,0xa5b52dbe,0xa3a60242,0x23613016
	.word  0xeff386d4,0x115e5648,0x75acc280,0x6f5a8eed
	.word  0xefefb0cb,0x1bbb7655,0xc153cf4d,0x8b1afdc2
	.word  0x5c9e9f2b,0x36f08f0f,0x5bfa7258,0xb33c1eb3
	.word  0xf310c4ba,0x0de3ee5c,0x61c5545a,0xf899c740
	.word  0x100610b7,0x83d794db,0x56261bda,0xf9f54a18
	.word  0x03b9d22c,0xe8e29126,0x6c1664db,0xed34d2af
	.word  0xd194e635,0x0900cb6f,0xf9fc39ff,0x075df18e
	.word  0x533d7515,0xa42cba75,0x50210687,0x7c94b44a
	.word  0x9fc1056c,0x5ffc823a,0x1c3b6661,0x2a474690
	.word  0x804f3536,0x2ff0a695,0x0ea71ac9,0x4e448d7d
	.word  0x6c766698,0x0f102f77,0x6998ed59,0x92cc1636
	.word  0x86368921,0x2cc3f270,0xdf4c734d,0x770d2e47
	.word  0xe8199e75,0x3aeac3f4,0x4bb403f9,0xff91f88f
	.word  0x703ef128,0xc3bd5bea,0xcf73b3b1,0x88846182
	.word  0x2713241d,0xd8051ef7,0x03c14cf5,0x7433e02d
	.word  0xb6dc1223,0x3d236e37,0x4cc41090,0xad314c1a
	.word  0x426bb103,0x2eef3e25,0xa821d55f,0xd7540b7a
	.word  0x94b0a382,0x721ea1bf,0x56e90105,0xea1e2adb
	.word  0x17136908,0x4ebf53f9,0xcc9fc5c1,0x0acd353e
	.word  0x2dc04676,0x873968d5,0xe08f0dcd,0xdd6a8eb2
	.word  0x1c642d01,0xd4577de5,0xe062496a,0xd364f950
	.word  0xbe8cbb50,0x26d29cbe,0x69113d46,0x2073e4da
	.word  0x1949da8c,0x0b74ebfd,0x64381ec4,0xb3717ab4
	.word  0x63ecc99d,0x637490f7,0x874fe502,0x34ceb187
	.word  0x72a3e024,0x3fb0264a,0x19bfe185,0x8261cf33
	.word  0x3ad124b6,0xb8a0e8ff,0x077d5f9d,0x8a583c4a
	.word  0xe5839fd5,0x49fdb219,0x9527ba42,0x158cba32
	.word  0xc18b271c,0x9e896734,0xf9e154c2,0x4282adff
	.word  0xce778eb9,0xfbcadb14,0xdb142ba7,0x8a497f5e
	.word  0xddf1f555,0x924331fa,0xad137b6a,0xdda48d1b
	.word  0xd7a7506f,0x71c98c28,0x10107d5f,0x474efde9
	.word  0x7950e8a4,0x74b6065d,0x5eb35d20,0xb698f1d9
	.word  0xe86de4c5,0xa7df780e,0xefb92ded,0x447bf03f
	.word  0xef6b65ff,0x39da9dbe,0xba083ea2,0x81ef7397
	.word  0x5ec759e2,0xfebc2c38,0xed30bafa,0x1814f5eb
	.word  0x16093a7d,0x702c5d8c,0xe4b8e3a1,0x664ed3ff
	.word  0x063628c1,0x2c6cee44,0x4eadb757,0xab5ca8da
	.word  0x178aec44,0x69a7662d,0xc860e250,0x8e43b8ba
	.word  0x9d06622c,0x7fcf965f,0xe833c86e,0x61a2c87c
	.word  0x039ec907,0xd17012fe,0xf86835bb,0x4b924809
	.word  0xbcd4986e,0xde0ada6b,0xf858409d,0xbeadbf21
	.word  0x88aaf314,0x4b3be14c,0x01f2ca3c,0xb342c77c
	.word  0x6efcedb5,0xde86ca37,0x2c2b901a,0x6fc089ec
	.word  0x277df864,0xff55ea91,0x5501a0c2,0xa2e6fdd2
	.word  0xbe4f892e,0x9f762c7e,0xa4d5bd7a,0x13aa9cd1
	.word  0xc8754db8,0x0299fedc,0x1943b361,0x6ad83577
	.word  0x140d9246,0x8094ad41,0xdf375dfb,0x79574037
	.word  0xe7d826d2,0x9ae89e85,0x26ad75fb,0xf6893d4e
	.word  0x7a2f9136,0x80b5c944,0x118ca0c4,0x2f91e5ef
	.word  0xb345fbc6,0x79360d65,0x561b8646,0x74a08102
	.word  0x82bef4ba,0x85941e76,0x029f77db,0x0a5e9379
	.word  0x4b91d2a4,0x26399559,0x69e177bc,0x0a91fe04
	.word  0xe9e5bee0,0x6704ebbe,0xd7a1fe46,0xf87a9747
	.word  0x06180d4d,0x85ca1a6a,0x9df648e8,0xcc6fc15a
	.word  0x9a874467,0x511455e1,0x5585835a,0x076ae284
	.word  0x4d4b7392,0x8bc8863d,0x931fb99b,0x3c190877
	.word  0x8b37f162,0x99c4a766,0x6e020685,0x453d1cd8
	.word  0xab3976df,0x61acd492,0xe04fd2d4,0x4385db4f
	.word  0x8a7f24b8,0xaa40c4af,0x638e3812,0x46c52d21
	.word  0x6b4c86db,0x15b89c76,0xbc7d4e64,0xbebc4224
	.word  0x70954eed,0x33203dba,0xca4baddc,0xe612dce7
	.word  0x26f888a7,0x2764ae4b,0x786e160a,0x30b8c37e
	.word  0xf61b02b2,0xc3428c01,0x25797ed9,0xd441b8aa
	.word  0xe1ea7c24,0xa3a0f0dd,0x821b36e6,0xb8f865aa
	.word  0xfa5058f8,0x8845db24,0xd0b8182f,0x798f81fb
	.word  0x1c196723,0x35044372,0xddb59ed1,0xa589d1e0
	.word  0xd4c069a8,0x66c90b31,0x4391be7b,0x1b8df28a
	.word  0x3957de0e,0x3f90f5d4,0x37601133,0xd1e5c8a4
	.word  0xf8a8b1fb,0xaa2fea96,0x276df3de,0x1df6932a
	.word  0x68d239c2,0x455816b9,0xb5590707,0xd9086767
	.word  0x71eb6ee8,0xbdd4e407,0x12db5bd2,0xb9c7f724
	.word  0x4bcaeaa9,0xd9104e0e,0xbd9e9675,0x941ce0f8
	.word  0xa0e0d01c,0x9e5f20e8,0x2af40c16,0x28f6baae
	.word  0xe4671a99,0x0e1d5e05,0x51ecee56,0x811f2127
	.word  0x3e521a91,0x256c0bcb,0x2bca4ed9,0x656eb985
	.word  0xd890818a,0x7da8de71,0xf99e5610,0x1465f425
	.word  0x1289807f,0x48cb3033,0x1c675c7b,0xed9a92a3
	.word  0xb6d3b4da,0x127a4a36,0x1b7ec107,0x33036cba
	.word  0xa428fc9d,0x172e43e3,0x985f8526,0xf72470b0
	.word  0x831f23c2,0x64f24a5b,0xa242fe7e,0x248aaf79
	.word  0xd3732d93,0xdd74cd65,0x92789911,0xcd9d35b3
	.word  0x91dbae32,0xb87f9199,0x3fcdf4ec,0xc4df0482
	.word  0x48a6b168,0xb0bf8d33,0xb2b79798,0x97f5ea3d
	.word  0x74a649c3,0xea9482ec,0x17b7443d,0x3a0a26c5
	.word  0x9bfdd9e9,0xa1b234c3,0x10c40d24,0x09abf7e7
	.word  0x4f37a8e7,0x088458c9,0xeb76304d,0xefe2c3a2
	.word  0xd809cb3b,0x5b680860,0x85e3b55e,0x5e47c8f9
	.word  0x1470ec81,0x26a82c11,0x50f3c0c9,0x202227a1
	.word  0xf7758b4d,0x398c6df7,0x816e5305,0xd9f1127b
	.word  0xfc1e0153,0xe8968ff1,0xaca6dae0,0x96dbfd36
	.word  0x66dbbdba,0x94ddbebc,0x71561519,0xf741afae
	.word  0x93e32df1,0xd614c673,0xd3dd9c9c,0xff55fd3e
	.word  0x7c5afd7a,0xd6118159,0x29689984,0x92525268
	.word  0x00597021,0xa1138861,0x38d663fb,0x5e9287ef
	.word  0xf5e109cb,0x804df6df,0xd3388fc3,0x60458c95
	.word  0xe3353d13,0x0353b40a,0xb31ab840,0x79ae75d6
	.word  0xfccfbb20,0xbdb42014,0x441422ca,0xd43d9361
	.word  0x0e4f46db,0x80754f03,0xca0b78cc,0x6834bffe
	.word  0xb680fbf7,0x84145e48,0xf7944129,0xf6db27f1
	.word  0x0198aaf7,0x28322e83,0xe487c7b8,0xfff4381e
	.word  0x2be9adb3,0xbfe84b15,0x39cf511b,0x90de5e46
	.word  0x4aafe3c0,0x929f6407,0x1c04c4d9,0xd97b2eac
	.word  0x8d67fb21,0xc78e21f0,0xc15b5d78,0x1df352a6
	.word  0xa563d37b,0xf68aa8ad,0xe9b68140,0x3dc6de34
	.word  0x7a7d3396,0x82ae1b70,0x208a672f,0xdf5feb9c
	.word  0xe6f5483b,0xdc16171f,0x4c663972,0x0423e946
	.word  0x9c97f111,0x6a0c4f99,0x046e4070,0x3780fc77
	.word  0x659b8f1c,0x61c15f26,0x27d1add6,0xbe41e712
	.word  0x9199a7c5,0x3d3e83e0,0x3b278ee2,0xf713419d
	.word  0x7516cebb,0xce7e4ef1,0x683a276a,0x66c80007
	.word  0xaea36f27,0x6bfdb135,0x1ab7b246,0x5480a4e2
	.word  0xb3cf3403,0x589c6b33,0xbeb96a74,0xc9f5802c
	.word  0x411bbb61,0x66ae65f3,0x3c795056,0xb850f93a
	.word  0x50987b9a,0xa36c05ff,0xf86587be,0xde4c2c72
	.word  0xa73cd5e6,0xac4dc5cd,0x212a5404,0xc2960437
	.word  0x7c6b24e8,0x29ed76eb,0xa6ac3062,0x4176946d
	.word  0xbfb6d45c,0xb47a1868,0x41e1c32e,0x196480fc
	.word  0xfb84f1a3,0x168fa102,0x14cb982f,0x5d845edf
	.word  0x4609a8c4,0x86fe402e,0x1be47d4b,0x60130a89
	.word  0x02af3480,0x7582ac10,0x1c542e51,0xd332d532



#if 0
!!# /************************************************************
!!# /**
!!# *
!!# * File:         retr_div.j
!!# *
!!# * Description:  
!!# * Covers all coverage conditions in ifu_sidiv_swout that
!!# * involve a retracted div.
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
!!#   IJ_bind_thread_group(th_div, 0x5);
!!#   IJ_bind_thread_group(th_evnt, 0xa);
!!#   IJ_bind_thread_group(th_all, 0xf);
!!# #ij else 
!!#   IJ_bind_thread_group(th_div, 0x2);
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
!!#   IJ_set_rvar (div_wt, "{50}");
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
!!# inst_type: d0 div
!!#            {
!!#                IJ_generate (th_div, $2);
!!#  	       IJ_generate_from_token (7, th_div, ijdefault, tUDIV_I, tUDIV_R, 
!!#                                        tSDIV_I, tSDIV_R, tSDIVX_R, tSDIVX_I, 
!!#                                        tUDIVX_R, tUDIVX_I, tUDIVcc_I, tUDIVcc_R,
!!#                                        tSDIVcc_I, tSDIVcc_R, NULL);
!!# 
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
!!# alu_irf_err: irferr alu trpm_alu alu div_ic_err 
!!# ;
!!# 
!!# div_ic_err: icerr div
!!#            | d1 div
!!#            | d2 div icerr alu
!!# ;
!!# 
!!# ldst_irf_err:   st_irferr_unalgn trpm_alu alu div_ic_err 
!!#                 | ld_irferr_unalgn trpm_alu alu div_ic_err
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
!!# ld_dc_err: dcerr load_r trpm_alu div_ic_err
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
!!# div: d11 div_tokens
!!# {
!!#    IJ_generate (th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# div_tokens: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I 
!!#             | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I 
!!#             | tSDIVcc_R
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

