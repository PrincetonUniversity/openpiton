// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3628.s
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
   random seed:	267700195
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
	setx  0x16685b6517dc7588, %r1, %r16
	setx  0xdc657e6f4fe29753, %r1, %r17
	setx  0xea98f2514c680c9b, %r1, %r18
	setx  0x3e9c2971705bfa45, %r1, %r19
	setx  0xd72bb708c0247e82, %r1, %r20
	setx  0x96b30c7a9a6630d8, %r1, %r21
	setx  0x9570c915d8b5cb6d, %r1, %r22
	setx  0xf4bf0112b84a660b, %r1, %r23
	setx  0x1455b6cadd4090c6, %r1, %r24
	setx  0x2424abfae5aeab0b, %r1, %r25
	setx  0x2840a697ec96476c, %r1, %r26
	setx  0xf8e7544cc769ab65, %r1, %r27
	setx  0xa7707f42556d0d79, %r1, %r28
	setx  0x38bf36f8ca998342, %r1, %r29
	setx  0x22688e2b4ac6ca49, %r1, %r30
	setx  0x98402fa507ea27cd, %r1, %r31
	setx  0x0000000000000480, %r1, %r9
	setx  0x00000000000007f0, %r1, %r10
	setx  0x0000000000000970, %r1, %r11
	setx  0x00000000000009b0, %r1, %r12
	setx  0x0000000000000e30, %r1, %r13
	setx  0x0000000000000910, %r1, %r14
	setx  0x0000000000000cd0, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	.word 0xaaf0800d  ! 15: UDIVcc_R	udivcc 	%r2, %r13, %r21
	.word 0xb870c00d  ! 15: UDIV_R	udiv 	%r3, %r13, %r28
	.word 0xb368e8cc  ! 15: SDIVX_I	sdivx	%r3, 0x08cc, %r25
	.word 0xa1692b50  ! 15: SDIVX_I	sdivx	%r4, 0x0b50, %r16
	.word 0xb6f2000f  ! 15: UDIVcc_R	udivcc 	%r8, %r15, %r27
	.word 0xba70c00a  ! 15: UDIV_R	udiv 	%r3, %r10, %r29
	.word 0xb071000e  ! 15: UDIV_R	udiv 	%r4, %r14, %r24
	.word 0xa9688009  ! 15: SDIVX_R	sdivx	%r2, %r9, %r20
	.word 0xbb69ae59  ! 18: SDIVX_I	sdivx	%r6, 0x0e59, %r29
	.word 0xa569c00f  ! 18: SDIVX_R	sdivx	%r7, %r15, %r18
	.word 0xb6694009  ! 18: UDIVX_R	udivx 	%r5, %r9, %r27
	.word 0xaf68800d  ! 18: SDIVX_R	sdivx	%r2, %r13, %r23
	.word 0xbe7a2c30  ! 18: SDIV_I	sdiv 	%r8, 0x0c30, %r31
	.word 0xb4f22cf7  ! 18: UDIVcc_I	udivcc 	%r8, 0x0cf7, %r26
	.word 0xa8720009  ! 18: UDIV_R	udiv 	%r8, %r9, %r20
	.word 0xaa71a345  ! 18: UDIV_I	udiv 	%r6, 0x0345, %r21
	.word 0xb0f927b7  ! 21: SDIVcc_I	sdivcc 	%r4, 0x07b7, %r24
	.word 0xae79e7c2  ! 21: SDIV_I	sdiv 	%r7, 0x07c2, %r23
	.word 0xa4f2000f  ! 21: UDIVcc_R	udivcc 	%r8, %r15, %r18
	.word 0xae71a1ac  ! 21: UDIV_I	udiv 	%r6, 0x01ac, %r23
	.word 0xb6f18009  ! 21: UDIVcc_R	udivcc 	%r6, %r9, %r27
	.word 0xa6f1a41c  ! 21: UDIVcc_I	udivcc 	%r6, 0x041c, %r19
	.word 0xbaf1400c  ! 21: UDIVcc_R	udivcc 	%r5, %r12, %r29
	.word 0xbc69c00f  ! 21: UDIVX_R	udivx 	%r7, %r15, %r30
	.word 0xab692ee5  ! 38: SDIVX_I	sdivx	%r4, 0x0ee5, %r21
	.word 0xa672000b  ! 38: UDIV_R	udiv 	%r8, %r11, %r19
	.word 0xb6f0c00c  ! 38: UDIVcc_R	udivcc 	%r3, %r12, %r27
	.word 0xb969000f  ! 38: SDIVX_R	sdivx	%r4, %r15, %r28
	.word 0xbe792deb  ! 38: SDIV_I	sdiv 	%r4, 0x0deb, %r31
	.word 0xa6796091  ! 38: SDIV_I	sdiv 	%r5, 0x0091, %r19
	.word 0xb6f9400a  ! 38: SDIVcc_R	sdivcc 	%r5, %r10, %r27
	.word 0xacf90009  ! 38: SDIVcc_R	sdivcc 	%r4, %r9, %r22
	.word 0xb0f0e229  ! 117: UDIVcc_I	udivcc 	%r3, 0x0229, %r24
	.word 0xb469400e  ! 117: UDIVX_R	udivx 	%r5, %r14, %r26
	.word 0xa4f9e14e  ! 117: SDIVcc_I	sdivcc 	%r7, 0x014e, %r18
	.word 0xaaf1800e  ! 117: UDIVcc_R	udivcc 	%r6, %r14, %r21
	.word 0xa2f1ef1d  ! 117: UDIVcc_I	udivcc 	%r7, 0x0f1d, %r17
	.word 0xb2fa2a64  ! 117: SDIVcc_I	sdivcc 	%r8, 0x0a64, %r25
	.word 0xa569000f  ! 117: SDIVX_R	sdivx	%r4, %r15, %r18
	.word 0xbef20009  ! 117: UDIVcc_R	udivcc 	%r8, %r9, %r31
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x57e996932668abc5, %r1, %r16
	setx  0x2600a2387c8ab97d, %r1, %r17
	setx  0x448a55f728a4d76f, %r1, %r18
	setx  0x533b9081a520fd6b, %r1, %r19
	setx  0xed21997cc315af60, %r1, %r20
	setx  0xc404e2941f78aa87, %r1, %r21
	setx  0xb4d32e4f74589d0d, %r1, %r22
	setx  0xfb10664bbfdb52ed, %r1, %r23
	setx  0xa2b98f1ccc86aebe, %r1, %r24
	setx  0xc58f8be36dbe84e8, %r1, %r25
	setx  0xdd17f0c529116482, %r1, %r26
	setx  0x7eccd8eb349c4b1d, %r1, %r27
	setx  0x7739684762eadc36, %r1, %r28
	setx  0x092f0b842a48e828, %r1, %r29
	setx  0xd7237f92865d5817, %r1, %r30
	setx  0x149afa436826d987, %r1, %r31
	setx  0x0000000000000090, %r1, %r9
	setx  0x0000000000000b20, %r1, %r10
	setx  0x0000000000000460, %r1, %r11
	setx  0x0000000000000590, %r1, %r12
	setx  0x00000000000007a0, %r1, %r13
	setx  0x0000000000000550, %r1, %r14
	setx  0x0000000000000010, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,32)
	.word 0xe018800b  ! 3: LDD_R	ldd	[%r2 + %r11], %r16
	.word 0xbf782401  ! 6: MOVR_I	move	%r0, 0x401, %r31
	.word 0xa0f1a8c0  ! 9: UDIVcc_I	udivcc 	%r6, 0x08c0, %r16
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xac40c00b  ! 12: ADDC_R	addc 	%r3, %r11, %r22
!ld_dc_err
	.word 0xb8f0c00d  ! 15: UDIVcc_R	udivcc 	%r3, %r13, %r28
	.word 0xbb6a25c2  ! 18: SDIVX_I	sdivx	%r8, 0x05c2, %r29
	.word 0xa6f96bb1  ! 21: SDIVcc_I	sdivcc 	%r5, 0x0bb1, %r19
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,3)
	.word 0xf81a000a  ! 25: LDD_R	ldd	[%r8 + %r10], %r28
	.word 0xa13a2001  ! 28: SRA_I	sra 	%r8, 0x0001, %r16
	.word 0xbcf2000f  ! 31: UDIVcc_R	udivcc 	%r8, %r15, %r30
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR,10,x)
	.word 0xb631400d  ! 34: SUBC_R	orn 	%r5, %r13, %r27
!ld_dc_err
	.word 0xb841c00c  ! 35: ADDC_R	addc 	%r7, %r12, %r28
	.word 0xa220ef17  ! 35: SUB_I	sub 	%r3, 0x0f17, %r17
	.word 0xa4c0c00c  ! 35: ADDCcc_R	addccc 	%r3, %r12, %r18
	.word 0xa93a100f  ! 35: SRAX_R	srax	%r8, %r15, %r20
	.word 0xae91ea07  ! 35: ORcc_I	orcc 	%r7, 0x0a07, %r23
!alu_burst
	.word 0xa96962e7  ! 38: SDIVX_I	sdivx	%r5, 0x02e7, %r20
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
	.word 0xe01a000d  ! 42: LDD_R	ldd	[%r8 + %r13], %r16
	.word 0xba31400a  ! 45: ORN_R	orn 	%r5, %r10, %r29
	.word 0xb6a22d4c  ! 47: SUBcc_I	subcc 	%r8, 0x0d4c, %r27
	.word 0xb6f8e8f0  ! 50: SDIVcc_I	sdivcc 	%r3, 0x08f0, %r27
!ldst_irf_err
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xea58e748  ! 54: LDX_I	ldx	[%r3 + 0x0748], %r21
	.word 0xb939100f  ! 57: SRAX_R	srax	%r4, %r15, %r28
	.word 0xa338800f  ! 59: SRA_R	sra 	%r2, %r15, %r17
	.word 0xb2f0c00d  ! 62: UDIVcc_R	udivcc 	%r3, %r13, %r25
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xb938900f  ! 65: SRAX_R	srax	%r2, %r15, %r28
!ldst_irf_err
	.word 0xe671eff8  ! 68: STX_I	stx	%r19, [%r7 + 0x0ff8]
	.word 0xa241c00b  ! 71: ADDC_R	addc 	%r7, %r11, %r17
	.word 0xa139900e  ! 73: SRAX_R	srax	%r6, %r14, %r16
	.word 0xb679400a  ! 76: SDIV_R	sdiv 	%r5, %r10, %r27
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xa208c00c  ! 79: AND_R	and 	%r3, %r12, %r17
!ldst_irf_err
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,9)
	.word 0xe2518009  ! 82: LDSH_R	ldsh	[%r6 + %r9], %r17
	.word 0xaa21400b  ! 85: SUB_R	sub 	%r5, %r11, %r21
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xb670c00f  ! 88: UDIV_R	udiv 	%r3, %r15, %r27
!ld_dc_err
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
	.word 0xea29244a  ! 92: STB_I	stb	%r21, [%r4 + 0x044a]
	.word 0xa028c009  ! 95: ANDN_R	andn 	%r3, %r9, %r16
	.word 0xb0b1800d  ! 97: ORNcc_R	orncc 	%r6, %r13, %r24
	.word 0xa6f94009  ! 100: SDIVcc_R	sdivcc 	%r5, %r9, %r19
!ldst_irf_err
	.word 0xe820e0e4  ! 103: STW_I	stw	%r20, [%r3 + 0x00e4]
	.word 0xa490800c  ! 106: ORcc_R	orcc 	%r2, %r12, %r18
	.word 0xa3399009  ! 108: SRAX_R	srax	%r6, %r9, %r17
	.word 0xa968c00c  ! 111: SDIVX_R	sdivx	%r3, %r12, %r20
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xa2b0e6cb  ! 114: ORNcc_I	orncc 	%r3, 0x06cb, %r17
!ldst_irf_err
	.word 0xa0f0ad83  ! 117: UDIVcc_I	udivcc 	%r2, 0x0d83, %r16
	.word 0xfc70e838  ! 120: STX_I	stx	%r30, [%r3 + 0x0838]
	.word 0xad782401  ! 123: MOVR_I	move	%r0, 0x401, %r22
	.word 0xaeb1800f  ! 125: ORNcc_R	orncc 	%r6, %r15, %r23
	.word 0xa8f1400a  ! 128: UDIVcc_R	udivcc 	%r5, %r10, %r20
!ldst_irf_err
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xee41ac30  ! 133: LDSW_I	ldsw	[%r6 + 0x0c30], %r23
	.word 0xb2a9800c  ! 136: ANDNcc_R	andncc 	%r6, %r12, %r25
	.word 0xa729a001  ! 138: SLL_I	sll 	%r6, 0x0001, %r19
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR,8,x)
	.word 0xb678ec96  ! 141: SDIV_I	sdiv 	%r3, 0x0c96, %r27
!ldst_irf_err
thr0_resum_intr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
!resum_err_err
	.word 0xb28162c7  ! 143: ADDcc_I	addcc 	%r5, 0x02c7, %r25
	.word 0xa228a2ad  ! 143: ANDN_I	andn 	%r2, 0x02ad, %r17
	.word 0xaa11800a  ! 143: OR_R	or 	%r6, %r10, %r21
	.word 0xac11400b  ! 143: OR_R	or 	%r5, %r11, %r22
	.word 0xa6aa000a  ! 143: ANDNcc_R	andncc 	%r8, %r10, %r19
	.word 0xb8b9000d  ! 143: XNORcc_R	xnorcc 	%r4, %r13, %r28
!alu_burst
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xb0b96054  ! 146: XNORcc_I	xnorcc 	%r5, 0x0054, %r24
	.word 0xb401e497  ! 149: ADD_I	add 	%r7, 0x0497, %r26
	.word 0xacaa000a  ! 151: ANDNcc_R	andncc 	%r8, %r10, %r22
	.word 0xa168e3c2  ! 154: SDIVX_I	sdivx	%r3, 0x03c2, %r16
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xbcb1e512  ! 157: ORNcc_I	orncc 	%r7, 0x0512, %r30
!alu_irf_err
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xec41000f  ! 161: LDSW_R	ldsw	[%r4 + %r15], %r22
	.word 0xb3780409  ! 164: MOVR_R	move	%r0, %r9, %r25
	.word 0xa938d009  ! 166: SRAX_R	srax	%r3, %r9, %r20
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xa8f9efda  ! 169: SDIVcc_I	sdivcc 	%r7, 0x0fda, %r20
!ldst_irf_err
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,15)
	.word 0xe841c009  ! 172: LDSW_R	ldsw	[%r7 + %r9], %r20
	.word 0xb891ef41  ! 175: ORcc_I	orcc 	%r7, 0x0f41, %r28
	.word 0xa4f0c00d  ! 178: UDIVcc_R	udivcc 	%r3, %r13, %r18
thr0_ic_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xb329e001  ! 181: SLL_I	sll 	%r7, 0x0001, %r25
!ld_dc_err
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,47)
	.word 0xe800800b  ! 184: LDUW_R	lduw	[%r2 + %r11], %r20
	.word 0xba18ae23  ! 187: XOR_I	xor 	%r2, 0x0e23, %r29
	.word 0xbe71e369  ! 190: UDIV_I	udiv 	%r7, 0x0369, %r31
thr0_ic_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_10), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xb578040f  ! 193: MOVR_R	move	%r0, %r15, %r26
!ld_dc_err
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,59)
	.word 0xfa10c00a  ! 196: LDUH_R	lduh	[%r3 + %r10], %r29
	.word 0xba896662  ! 199: ANDcc_I	andcc 	%r5, 0x0662, %r29

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
	.word  0x3d712b53,0x028f8f60,0xeda60131,0x387a4a35
	.word  0xa856d8af,0xab1e5cc0,0xcfeeb9d8,0x2a286cd9
	.word  0xd4255cef,0xe812fec5,0x27342b9e,0xd9271aad
	.word  0x91e72e00,0x9ffbca95,0xec0c31ce,0xd14fbe7b
	.word  0x2dc02072,0x88a8c6ad,0xc35f8f86,0xdf3ca346
	.word  0x52b0427d,0xd303cd5a,0x1022555b,0x5f0bd9b0
	.word  0xca57e294,0x24f5e82f,0x8d132f56,0x06c91dc0
	.word  0xdbc58838,0x58cb7a33,0x27ccd78e,0x86ad96fe
	.word  0x708e09cf,0x036b28bf,0xb09102ad,0xdbcabae5
	.word  0x9f6e8e6e,0x148f4599,0x171754a4,0x599cbbac
	.word  0x18ad5450,0x51e2034a,0xdfd2ac4b,0x7a03e31b
	.word  0x27b657aa,0x379bb7b7,0x3ecbc4c1,0xf3e3a0b9
	.word  0xc20896ec,0x6b76ed60,0xcbf32706,0xfe662ba1
	.word  0x0d813ef7,0x001b6c4f,0xda5c1c9c,0xd633283d
	.word  0xc2f30598,0xb32e4b97,0x1ab987df,0xe34a433a
	.word  0x01abf6ad,0xc5dceb16,0xb22a2f05,0x8479d290
	.word  0xe5e0950f,0xf6ed2099,0x60874c67,0x15df853b
	.word  0xec90bf42,0xfc9fad10,0x2b7eb20c,0x44aa5c99
	.word  0xcd04b660,0x2c302b3e,0xf840f9b7,0x601960c3
	.word  0x102cf54f,0x748c9d12,0x1f44da2a,0x3e849732
	.word  0x8b1406ea,0x3989ab11,0x976ca60d,0x2dc8390f
	.word  0x1295a0c8,0x49c2c54b,0xbc526091,0x1e513247
	.word  0xfb053884,0x2ca51244,0xd87b053d,0x43e74f42
	.word  0xb4dd3fbb,0x5fae3dec,0xd5ae6233,0x8060e41d
	.word  0x49cf24bd,0x7dedd56e,0xdedb0080,0x6bf86c1b
	.word  0x9a9b6afc,0xd2d9c09e,0x386578ff,0xf1354ae1
	.word  0xbaec1640,0x023a28db,0xd7bd0b75,0x63c4a505
	.word  0x3fb16799,0xc59d455b,0xf7177648,0x43fa4b50
	.word  0xbaf8294c,0x3e5e94c9,0xa75d6dcb,0x658bd588
	.word  0xbef4a897,0x6117892a,0x537ba48a,0x88b69fcc
	.word  0x44d7ba5d,0x6d18bf13,0xbc09abb0,0x9fffe3e8
	.word  0x931ac7da,0x5293dfb6,0xee7c27c5,0xe8e3d78a
	.word  0x889924f2,0xe20f8df9,0xd248b728,0xd28d7fc2
	.word  0x048a3e9d,0x4eba8791,0x462bccdc,0xb7c67698
	.word  0xca6a36d8,0x57a18910,0xa167cd86,0x884b1726
	.word  0x43785a7b,0x1177dfed,0xc128f92d,0x8d7723ab
	.word  0x508ee4da,0x7655ded4,0xfb83aedb,0xbe92e575
	.word  0x6e7b65bd,0x3cc58f68,0x966fff2a,0xc1ddc071
	.word  0xf216ec3d,0x4e29932d,0x9b9a1297,0xc795c528
	.word  0x7678116a,0xa485afaa,0xdcdf0d36,0x3674bd41
	.word  0x59d4d9e1,0x33f22cd5,0x4c97749c,0xc39ca52e
	.word  0x09372f6f,0x3cd8844a,0xc6114ef8,0x63aff6eb
	.word  0x9f134ce6,0x6f2d47f2,0x95f024a2,0xaa05bf65
	.word  0x48e29b03,0xcee574d7,0xf4270da4,0x08fe2912
	.word  0xc13ee216,0xa292dd27,0xfa543ce9,0x659b75c5
	.word  0x7586fa76,0x8081dffd,0xd0e88c5b,0x05b485b5
	.word  0xb6e33920,0x1672f9d2,0xb91a6264,0x4bdd353c
	.word  0x7d424c1e,0x21030d1d,0x17a09f74,0x479cf727
	.word  0x16d6a474,0xc98b6e14,0xdfaa88ba,0xb27cabbb
	.word  0x1524432d,0xe816bbd9,0x4c2755de,0x358969b6
	.word  0x139587a6,0xb925a3dd,0x5d7a5fa2,0x812b869b
	.word  0xc90699b1,0xd96531bd,0x4aaafad0,0x951f10fc
	.word  0x9ce2115b,0x6f8eb136,0x6ba74748,0x80e924f3
	.word  0xbbac59a7,0x389db824,0x9a01aa17,0x2bf1175e
	.word  0x114c7f2c,0xa26a6116,0x60d80e0c,0x231f0c1d
	.word  0x9c9c36ec,0x21b714fc,0xf4035758,0xd5850468
	.word  0x4fdbb6d1,0xe1456c00,0x9c5885b4,0xde0e4ea7
	.word  0xe8b83976,0x398b8d07,0x90962925,0xbb63ab59
	.word  0xaf795bd6,0x4359d12e,0x03df4823,0xd0756403
	.word  0x99060109,0xdf33b6f9,0x5eba777d,0xe4673aad
	.word  0x86f1bd1a,0x6558be7d,0x31228260,0x1a7da8ab
	.word  0x2e5f75da,0xbeb556ea,0xb9dc488e,0xe1e4d54d
	.word  0x255ab252,0x53bbb709,0x5e6f5add,0x999c6402
	.word  0xb02a3ca1,0x3778c5e9,0x20865a8f,0xd4359820
	.word  0xf12a565c,0x65778c92,0xa83df5bb,0xd88af295
	.word  0x5dcab938,0xe0b6443b,0x326feae6,0x7d06673c
	.word  0x20d22370,0x92fc6f4c,0x22e3b83a,0x13b07771
	.word  0x22e2705a,0xbbc51b3d,0x2f28e88c,0x9d440a50
	.word  0xd106e3ec,0x7bc767df,0x71060e62,0x70432ac5
	.word  0x02be7157,0xd9b71b78,0x497f2448,0x9dc528c2
	.word  0x3f2408a1,0xac3ce875,0x5e006eea,0x6dae9c43
	.word  0x12a04d8e,0xd0022fb5,0x86d09c37,0x63f7f8e9
	.word  0x4a91688f,0xe9b8e5f3,0xa9479889,0x59991f3e
	.word  0x35c614ee,0x22bf993e,0x3132dce7,0x368dc9e9
	.word  0x05e2ac44,0x3adb55cc,0xc26775ae,0xa268e60d
	.word  0x059370d2,0xc32e65c9,0xf94ceba9,0x3336f9cd
	.word  0x3893f633,0xc82985cf,0x963d7170,0x5e34ca72
	.word  0x260946be,0x28717538,0x7a923b21,0xe78ef696
	.word  0xddfce766,0x06b15b86,0xdcfd15e5,0x232d8791
	.word  0x91efc475,0x35de88bb,0xda705ee7,0x071c7862
	.word  0xfbb42d02,0x9ffbfd9d,0x8e4498c1,0x95635ec0
	.word  0x40acbfc6,0x3eeef206,0x5bd01594,0x084b9d80
	.word  0x7db6c4e0,0x25fc9130,0x4982554d,0x7a996f91
	.word  0x60ffa7ee,0x505a5e86,0x227b016c,0xbb38420d
	.word  0xff86f4fd,0x057f1e54,0x075e1e58,0xb37fa827
	.word  0x30f09ec5,0xb702e51f,0x4cf1ac58,0xad0bd866
	.word  0x9a602253,0x0ca387fd,0xb4d0bf52,0x7b411bc8
	.word  0xbbe2bd2b,0x401c99f5,0x1334fdc4,0xff35a528
	.word  0x3b81f4b7,0xa2db6d50,0x600be063,0x437e1a3a
	.word  0x1ab82383,0x2758c5fd,0x653478b6,0x32991611
	.word  0x899ba0ba,0xee91fb07,0x5df87360,0xe8c46cf2
	.word  0x87c611bd,0x9d3cadf7,0x0aeb8d1e,0x880d1172
	.word  0x9902113f,0x4112a65b,0xb81dc79c,0xd012c2f2
	.word  0x2b9972e8,0xeb30afb7,0x34c3879e,0xba0c5c8b
	.word  0xa6123370,0x403e4eb9,0xe46fe6c7,0x4c7c5cf6
	.word  0xc74563fb,0xf7d55839,0x330a6d80,0x2da03d68
	.word  0x4a6e03ca,0x376436a8,0x3dc716fc,0x42400563
	.word  0xf5e8d2b5,0xb6912fd8,0xd6c33805,0x54e05431
	.word  0x2bf70f11,0xc86d9ee9,0x7c19cf92,0x52900ee4
	.word  0x27c35c57,0x14f3eeae,0xdc6fd868,0xa5b528c5
	.word  0xa6b43f64,0xa6c3402a,0x9f90a42b,0x65521b12
	.word  0x55eb54db,0xc7331f7b,0x051852ab,0x1e9d0306
	.word  0x53595fa7,0xfcdf0ae0,0x78299b25,0x5c46eec6
	.word  0x4db7ef51,0x92983559,0x9b6b1354,0x1ae75c10
	.word  0x6473b9f5,0x892eb739,0x909cf8c7,0x6f416e3e
	.word  0xecc43a90,0x4237bc1e,0x32852399,0xf9b94102
	.word  0x46aafd92,0x3f76c6a1,0x1d4acd39,0xb28f2b27
	.word  0x3a7df84b,0x3be9065f,0xc126afc6,0xb18db0bf
	.word  0x0c13edae,0xba5b989b,0x13768838,0xc365d451
	.word  0x369addd6,0x3daa0a4b,0x918bc40f,0xcb42ff74
	.word  0xc7fc6226,0x840808b5,0x05169ff9,0x9bf7c565
	.word  0x9bd0151f,0xd3cee592,0x869b7c0d,0x0cd9e1de
	.word  0xf747ba4c,0x48092e81,0x4a1a1afe,0x12bb5271
	.word  0x2665c91b,0x2b32b3ec,0xd0856bcc,0x1f1472cd
	.word  0xed6b3d15,0x823bd292,0x386587e5,0xc2874eb3
	.word  0xb4c644f1,0xa809881a,0xebb3d189,0xa1166fa1
	.word  0xc2a009a6,0xbff5b2d3,0x301fe6b5,0xfef39c21
	.word  0xfc7ea1a9,0xb316819c,0x08fea809,0x924457ba
	.word  0x92994bf6,0x60bf314d,0xf2323ee0,0xf674dfa8
	.word  0x2bf4a703,0x4352b3ba,0x3af4a5e8,0xe4c0992d
	.word  0x0523de0c,0x8697835d,0x12f98722,0xba044a38
	.word  0x3f5ebea5,0x3284eb7f,0x3e9d4f72,0x47388a9e
	.word  0x8c2d2427,0xa0da2f02,0x36152c45,0x48c8ec01
	.word  0x3b99452a,0x3fd677e5,0x105e8329,0xdf14d8b7
	.word  0x5937360e,0x4b0506d4,0xae80c6f4,0xe49f1f4d
	.word  0x1d19f5f5,0x6aaa75f9,0x4e3bf13d,0x9efebfd6
	.word  0x89bbfa91,0x97a2d93c,0xa4e23f9d,0x970e6708
	.word  0x17f54173,0xdd4fd017,0x413bcb24,0xe4021775
	.word  0x341d1285,0x05f9517e,0xc6328d74,0x58d6ee6b
	.word  0x55c24fee,0xc0e21f7a,0x3cf0d162,0x2d076bb1
	.word  0x41e5187e,0xf435c327,0x66a18c13,0xba3db609
	.word  0x367efed0,0x809b4780,0xfd5e034b,0xa8c5abad
	.word  0x9e4a6782,0x24359b03,0x0d4952b0,0x937ae2cb
	.word  0xc2fd85c7,0x57752336,0x2acc33a5,0x822be13b
	.word  0xc50e5d89,0xa4ccbaa6,0xf1b61cb7,0x3beee8e8
	.word  0xdc4c87c0,0x261bc147,0x56da07e3,0x8657bd55
	.word  0x714b2e62,0xa79c7d80,0xb187cd75,0x73826b61
	.word  0x9cf72eef,0x811b8582,0x19f1edd7,0x6848862d
	.word  0x8b9f31c4,0xe8874d84,0x48098218,0xe943cb5f
	.word  0xaee5fcc6,0x5658c774,0x7b5da9e9,0x2d37da50
	.word  0x612c3ac8,0x4b53ee48,0x39db455a,0xff7cfbb0
	.word  0xc8aeb0b6,0x8ede9386,0x63ad0d1c,0x32b096cf
	.word  0x0fe6360b,0x0bbe596d,0x7a4402c7,0x808bc850
	.word  0xb7d872b7,0x12c20bf8,0xdb380af3,0xddb38e8e
	.word  0x330e478b,0xabb948aa,0x8e57effd,0x26bda93b
	.word  0xe45228b5,0xa70a2f5b,0xa815239e,0x09365585
	.word  0xf645f29c,0xdbecac03,0xad638a1b,0x2abe00e9
	.word  0xf99097a5,0x95cb77c5,0x164d81f0,0x5bd56f3d
	.word  0x772ce579,0xd9a5a3e9,0xd555cb67,0xc91b121c
	.word  0xbbe9e1bd,0xda257057,0xcfa939d1,0xc123ebde
	.word  0x19bc7ae3,0xf0f4b08d,0xfd66a1fd,0x5d101931
	.word  0x9c724a2d,0x097951fd,0x278b9740,0x3c79a42e
	.word  0xc92a7d3b,0x38c6c41c,0xdf74c25c,0xdd1f6eb5
	.word  0x5d5ef8e9,0xf6650b87,0xf530e7cf,0x0587fa18
	.word  0x22019e77,0x65df3acb,0xd471b7db,0x2471f9dc
	.word  0x9eccf60f,0xd55fdfb1,0x2624eef6,0x0acd9ca2
	.word  0xa1e541c8,0xa39f24b9,0xbee995a9,0x42e38910
	.word  0xbcaa0f85,0x1a82c55b,0xc7aa1deb,0xa38c41f1
	.word  0xc7d08263,0xec87ef4c,0x6df8fe67,0x2a436510
	.word  0xbc99085e,0x7f3131c2,0x47542018,0x80536681
	.word  0xf1cc39b3,0xc53694e9,0x5e725a68,0xc0a17024
	.word  0x3b6e601a,0xfc3cd52d,0x0d588db6,0xc5a68885
	.word  0x82d409c3,0x4af1934e,0xd5527a0a,0xf0908180
	.word  0x1449aab7,0x88ee0f07,0x5cf3dd07,0x271d585a
	.word  0xbb04f30c,0x764324c8,0xb9c7f468,0x0440afff
	.word  0x3c2316d1,0xd2575b9e,0x1b72039c,0xc19df85a
	.word  0xa6d053e5,0xa8d7f0f1,0xfe3a7295,0x807a0cb3
	.word  0x9b193bd1,0xafe13a1a,0x1ed9207d,0xebc0b15f
	.word  0xef3d583d,0x0793f135,0xfd0e1d32,0x06c3c800
	.word  0xcf4aa0e0,0x4b58712a,0x3a056f2b,0x7f6ec170
	.word  0x7badfaf0,0x1ddb4351,0xaf54ff4f,0xf193f7a8
	.word  0x48feaf8c,0x3417f825,0xcd0a9153,0x5eca167d
	.word  0x139b4d29,0x4d3cd1e2,0x0d77e120,0x20bf4e7d
	.word  0xeda06ca2,0x538c6b09,0xb1bbd00d,0xf213fbfc
	.word  0x97c25bde,0xc4d798cc,0xe4c38e59,0xc02a4816
	.word  0x8a1c840c,0xb36cb3ee,0x0f479cdb,0x7a9311b2
	.word  0x713d8e18,0xd033b51f,0x9d3ecb39,0x39b024cf
	.word  0xacb33f0e,0x78739452,0xae28aee3,0x4685c6bc
	.word  0x1ec75e12,0xb3ea75de,0xf8ed85f4,0xf8bdf846
	.word  0xfca901da,0xaea8f461,0xed62e139,0xd147e4d2
	.word  0xc4c111bb,0xa3d94f10,0x76aa8f38,0x07c6f468
	.word  0xf8e5a176,0xb0e04810,0xe6484a57,0xde25b30a
	.word  0xb7bf740d,0x4625a7c5,0x5f47efa6,0x4162f2a1
	.word  0xe2dd3804,0xe5df6308,0xeaf9f885,0x2a7f7f45
	.word  0xcb7319ec,0x44cccb40,0x81f6667d,0x245fd838
	.word  0x4af73fd7,0x77e150e4,0x9cb0ef2b,0x29547e1e
	.word  0xd701a95e,0x0ec544a6,0x26c571b2,0x4d404803
	.word  0xeb6395c0,0x847b8228,0x7df93c2f,0x68073e11
	.word  0x78a08379,0x35f9f39b,0x1d64a51f,0xee2070ae
	.word  0x3db7eb3a,0xc6a29cef,0x1c785916,0x76cc6e80
	.word  0x56a4f4f6,0xba15a8b9,0x17e3b4cf,0x51c82329
	.word  0x9a61897d,0x5813ba51,0xca1fbd87,0xe1aeb1ca
	.word  0xc06b8c3d,0x39433903,0x87dce489,0xc039bd9e
	.word  0x2e384d3e,0xca94cb1b,0x712ec348,0x834209bf
	.word  0x5817c2b3,0x4ad83295,0x41c3fbd8,0x5c559117
	.word  0x9e5b63b6,0x09e676db,0xa7af3bf3,0xdca55f6a
	.word  0x1538b2dd,0x48e67c60,0xd1415eb7,0xa0dd1d1a
	.word  0x2615f71a,0x8739c1c3,0xdb472747,0x477c5f39
	.word  0xb190d7a8,0x61bf3362,0x5644ebab,0xe05ddb41
	.word  0xc6d3aea1,0xce390111,0x343ea02c,0xc6a767bd
	.word  0x0d4f876f,0x00913b1e,0x978e9181,0x4b2e17ab
	.word  0xbc7b648e,0x748fedfc,0x7c4cf1c3,0x4a01a65f
	.word  0x37716390,0xabc5f256,0x6a05c9fc,0x72434cab
	.word  0x0f142919,0x707ed314,0x8af51b86,0xe8a46bd9
	.word  0x53acefb6,0xaf79835e,0xe87df525,0x2282c8b6
	.word  0xa3d836cd,0xfcf2bc76,0xbd402811,0xed811b22
	.word  0xd646ee0a,0xe8a1678b,0x1ac704b7,0x6159730b
	.word  0x689f517e,0xefa26935,0x4b8106f6,0xb2306089
	.word  0xe7ad2f8f,0x1b71f5cf,0x337964c3,0xd931fe27
	.word  0x89bc97e2,0x9d076665,0xbcd0822e,0xcfa0b873
	.word  0x467000ba,0xaeb3d594,0x08d93d44,0x1979bab3
	.word  0xbcc0a98f,0x47e9b565,0x0b59b76b,0x8434f5d7
	.word  0xd09cf8ba,0xabad2e76,0x96f10c6e,0x8d95a33a
	.word  0xa6822640,0xdb3bcae2,0x585680f0,0xb740e748
	.word  0x9eee791b,0xf7793d00,0xaf2e0a51,0xe68e4c95
	.word  0x429e76cd,0x66657cd0,0x2bf06cd7,0x5b4caba5
	.word  0x83f52cc8,0x303cfda7,0xb322eaec,0x2ca234bf
	.word  0x7a9e175c,0x91c0f5d6,0xe80c7850,0x39906309
	.word  0x245b2f70,0x3297db84,0x03019e1a,0x6824dc7d
	.word  0x96f9ab7c,0xe1f4ca57,0x5124aaa9,0xc488629d
	.word  0x4c0fd64a,0xdd0c64e2,0xd3e224e9,0x8f5f910b
	.word  0xc3488eca,0xa8c5fa08,0x09421a9a,0x7cd68019
	.word  0xd293bf99,0xf57f8471,0xa63a4973,0xe97ef378
	.word  0x99c99645,0xdca946fd,0x35872dc5,0x23fa1abd
	.word  0x37a83b81,0x236febc6,0x41b80949,0x83b345fe
	.word  0x689b10c0,0x8b732298,0x1f2e96a4,0x703dbb6b
	.word  0xe00a2443,0x9f4d68b5,0xdf38bf5a,0x5c7b2529
	.word  0x6367b63d,0xa7f250ff,0xecf45292,0x670d35ac
	.word  0xd87a42e5,0x4cef0866,0xd9ed27f6,0x4777276c
	.word  0x80f5a2d5,0x807fb24d,0xc1a2f88f,0x25383db7
	.word  0xd89bb271,0xdd1c393e,0x99a58267,0x628df169
	.word  0x6d4f2c9f,0xe8b6579d,0x345e6a66,0x40de9bee
	.word  0xf48ba086,0xa3944780,0x34eaa402,0xb254f1cd
	.word  0x1e300ee4,0x26230199,0x2ef31f7a,0x48c2188a
	.word  0xfd8ce538,0x49afafff,0xcfc4730d,0x244e7444
	.word  0xc1a81ff5,0x16177b61,0xc67d7f91,0x8c320d01
	.word  0xe947533c,0x0a2efdc0,0x2ef430be,0x9b2ea150
	.word  0x547d65cb,0x9734d511,0xf307520b,0x8cd48f49
	.word  0x62b5114c,0x9a66d97a,0x6b737206,0x139e568d
	.word  0x68021f3f,0xd03a840f,0xe9c08668,0x2046d1bc
	.word  0xcfc75a64,0xb47c0c85,0xa8be921f,0x8b7ed1dc
	.word  0x53cd94ec,0x6d6d4125,0x99d5614e,0x2a2c6778
	.word  0x9f5000dc,0x57036dc6,0xd3073137,0xb008ad6c
	.word  0x6219f790,0x8cda10d7,0x2085e9c4,0x29355927
	.word  0x7bec612b,0xc5010bb7,0x377dd321,0xef5d4730
	.word  0xe1da21ba,0x9723b5c2,0xeeb00a2c,0xa68b692a
	.word  0x07395a2e,0xd881869d,0xe5b2bcd6,0x02d31dd8
	.word  0xe49dd1db,0xae966fe7,0x5128e722,0xb1c83130
	.word  0xfedf8058,0x8d96bf45,0x44a1c651,0x34f364f2
	.word  0xd07b14f7,0x7faf0aac,0x5de5e6d4,0x0d623435
	.word  0xde7c7295,0xce9a9e41,0x1e8f35c9,0x0cda6152
	.word  0x4258a789,0x888f7384,0x0e4b6f22,0xa5e624bd
	.word  0x68c4ef87,0x55be0e12,0xf88d211c,0x6d0593ce
	.word  0x69e6e775,0x35d9967a,0x6b0ebf01,0x1481198f
	.word  0xd5094e74,0xcbcfaa4f,0x25f82dff,0xe159f49a
	.word  0x6aaf2622,0x80c54322,0xf30e58ea,0xcf73f647



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

