// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3788.s
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
   random seed:	317962646
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
	setx  0xace19f51764f2119, %r16, %r16
	setx  0x5eeb844586696c97, %r16, %r17
	setx  0xed06f5a22bf061ba, %r16, %r18
	setx  0x8810919515768de6, %r16, %r19
	setx  0xa73125f860661353, %r16, %r20
	setx  0xae23407b257469b8, %r16, %r21
	setx  0x5b5eb5f5def619fe, %r16, %r22
	setx  0x84be616e28b6015a, %r16, %r23
	setx  0xb317e7fa8b4ae892, %r16, %r24
	setx  0xe40bbc1123ff8fe2, %r16, %r25
	setx  0x31f2e7dd685e2bd7, %r16, %r26
	setx  0x8a6081d6148daae1, %r16, %r27
	setx  0x534ff8ecb535270f, %r16, %r28
	setx  0x71821af1b5b34647, %r16, %r29
	setx  0x04a019c0e964b070, %r16, %r30
	setx  0x6377bcf27dc10d04, %r16, %r31
	setx  0x0000000000000c50, %r16, %r9
	setx  0x00000000000005b0, %r16, %r10
	setx  0x0000000000000980, %r16, %r11
	setx  0x00000000000008d0, %r16, %r12
	setx  0x0000000000000090, %r16, %r13
	setx  0x0000000000000130, %r16, %r14
	setx  0x0000000000000350, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,55)
	.word 0xe6418000  ! 3: LDSW_R	ldsw	[%r6 + %r0], %r19
	.word 0xa489806c  ! 6: ANDcc_R	andcc 	%r6, %r12, %r18
	.word 0xbb6a2202  ! 9: SDIVX_I	sdivx	%r8, 0x0202, %r29
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,12,22)
	.word 0xb489c00b  ! 12: ANDcc_R	andcc 	%r7, %r11, %r26
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xf02a2d29  ! 15: STB_I	stb	%r24, [%r8 + 0x0d29]
	.word 0xb480ae62  ! 18: ADDcc_I	addcc 	%r2, 0x0e62, %r26
	.word 0xac09400e  ! 20: AND_R	and 	%r5, %r14, %r22
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xae798009  ! 23: SDIV_R	sdiv 	%r6, %r9, %r23
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xb2c0e32a  ! 26: ADDCcc_I	addccc 	%r3, 0x032a, %r25
	.word 0xa930b001  ! 29: SRLX_I	srlx	%r2, 0x0001, %r20
	.word 0xa778040f  ! 31: MOVR_R	move	%r0, %r15, %r19
	.word 0xaf68e6cd  ! 34: SDIVX_I	sdivx	%r3, 0x06cd, %r23
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xbf64180d  ! 37: MOVcc_R	<illegal instruction>
	.word 0xfe70ed4d  ! 40: STX_I	stx	%r31, [%r3 + 0x0d4d]
	.word 0xa410ee11  ! 43: OR_I	or 	%r3, 0x0e11, %r18
	.word 0xb489000d  ! 45: ANDcc_R	andcc 	%r4, %r13, %r26
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xb96a2b67  ! 48: SDIVX_I	sdivx	%r8, 0x0b67, %r28
	.word 0xf819400d  ! 51: LDD_R	ldd	[%r5 + %r13], %r28
	.word 0xac7a000b  ! 54: SDIV_R	sdiv 	%r8, %r11, %r22
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,59)
	.word 0xec1a0000  ! 57: LDD_R	ldd	[%r8 + %r0], %r22
	.word 0xae31c069  ! 60: SUBC_R	orn 	%r7, %r9, %r23
	.word 0xaa6a2d5d  ! 63: UDIVX_I	udivx 	%r8, 0x0d5d, %r21
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xb0b9e0d7  ! 65: XNORcc_I	xnorcc 	%r7, 0x00d7, %r24
	.word 0xa419800b  ! 65: XOR_R	xor 	%r6, %r11, %r18
	.word 0xae91000a  ! 65: ORcc_R	orcc 	%r4, %r10, %r23
	.word 0xaa18c00c  ! 65: XOR_R	xor 	%r3, %r12, %r21
	.word 0xb931400f  ! 65: SRL_R	srl 	%r5, %r15, %r28
	.word 0xb881000b  ! 65: ADDcc_R	addcc 	%r4, %r11, %r28
	.word 0xa0c0c00f  ! 65: ADDCcc_R	addccc 	%r3, %r15, %r16
	.word 0xb964180c  ! 65: MOVcc_R	<illegal instruction>
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,9)
	.word 0xf808c000  ! 67: LDUB_R	ldub	[%r3 + %r0], %r28
	.word 0xb3643801  ! 70: MOVcc_I	<illegal instruction>
	.word 0xb871400a  ! 73: UDIV_R	udiv 	%r5, %r10, %r28
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR_NIR,9,9)
	.word 0xa2812cc1  ! 76: ADDcc_I	addcc 	%r4, 0x0cc1, %r17
	.word 0xa5780409  ! 78: MOVR_R	move	%r0, %r9, %r18
	.word 0xb818ac6b  ! 78: XOR_I	xor 	%r2, 0x0c6b, %r28
	.word 0xa0b1c00d  ! 78: ORNcc_R	orncc 	%r7, %r13, %r16
	.word 0xb7293001  ! 79: SLLX_I	sllx	%r4, 0x0001, %r27
	.word 0xa131a001  ! 79: SRL_I	srl 	%r6, 0x0001, %r16
	.word 0xa164180c  ! 79: MOVcc_R	<illegal instruction>
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xea28e3d7  ! 81: STB_I	stb	%r21, [%r3 + 0x03d7]
	.word 0xaa2a2264  ! 84: ANDN_I	andn 	%r8, 0x0264, %r21
	.word 0xab31100e  ! 86: SRLX_R	srlx	%r4, %r14, %r21
	.word 0xa8f8eb3e  ! 89: SDIVcc_I	sdivcc 	%r3, 0x0b3e, %r20
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,28,5)
	.word 0xbc922892  ! 92: ORcc_I	orcc 	%r8, 0x0892, %r30
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,11)
	.word 0xfc520000  ! 95: LDSH_R	ldsh	[%r8 + %r0], %r30
	.word 0xa281aafa  ! 98: ADDcc_I	addcc 	%r6, 0x0afa, %r17
	.word 0xbef9400c  ! 101: SDIVcc_R	sdivcc 	%r5, %r12, %r31
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xb2c0c00a  ! 104: ADDCcc_R	addccc 	%r3, %r10, %r25
	.word 0xaa40c00a  ! 106: ADDC_R	addc 	%r3, %r10, %r21
	.word 0xac88e121  ! 106: ANDcc_I	andcc 	%r3, 0x0121, %r22
	.word 0xa139500b  ! 106: SRAX_R	srax	%r5, %r11, %r16
	.word 0xac31280d  ! 106: ORN_I	orn 	%r4, 0x080d, %r22
	.word 0xa009800e  ! 106: AND_R	and 	%r6, %r14, %r16
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe22a25ef  ! 108: STB_I	stb	%r17, [%r8 + 0x05ef]
	.word 0xbeb8e584  ! 111: XNORcc_I	xnorcc 	%r3, 0x0584, %r31
	.word 0xb021c00d  ! 113: SUB_R	sub 	%r7, %r13, %r24
	.word 0xbaf9400f  ! 116: SDIVcc_R	sdivcc 	%r5, %r15, %r29
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xa978040e  ! 118: MOVR_R	move	%r0, %r14, %r20
	.word 0xb030e9b5  ! 118: ORN_I	orn 	%r3, 0x09b5, %r24
	.word 0xab31a001  ! 118: SRL_I	srl 	%r6, 0x0001, %r21
	.word 0xbb643801  ! 118: MOVcc_I	<illegal instruction>
	.word 0xa138d00c  ! 118: SRAX_R	srax	%r3, %r12, %r16
	.word 0xa538d00e  ! 118: SRAX_R	srax	%r3, %r14, %r18
	.word 0xb8b9a757  ! 118: XNORcc_I	xnorcc 	%r6, 0x0757, %r28
	.word 0xba992c5e  ! 118: XORcc_I	xorcc 	%r4, 0x0c5e, %r29
	.word 0xba292b77  ! 118: ANDN_I	andn 	%r4, 0x0b77, %r29
	.word 0xbc30800b  ! 118: ORN_R	orn 	%r2, %r11, %r30
	.word 0xa8a96e78  ! 118: ANDNcc_I	andncc 	%r5, 0x0e78, %r20
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,70)
	.word 0xe8114000  ! 120: LDUH_R	lduh	[%r5 + %r0], %r20
	.word 0xba8929f6  ! 123: ANDcc_I	andcc 	%r4, 0x09f6, %r29
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xb47a29dd  ! 126: SDIV_I	sdiv 	%r8, 0x09dd, %r26
	.word 0xb72a2001  ! 128: SLL_I	sll 	%r8, 0x0001, %r27
	.word 0xa890e4d2  ! 128: ORcc_I	orcc 	%r3, 0x04d2, %r20
	.word 0xacb1800c  ! 128: ORNcc_R	orncc 	%r6, %r12, %r22
	.word 0xec21abe1  ! 130: STW_I	stw	%r22, [%r6 + 0x0be1]
	.word 0xa639c06d  ! 133: XNOR_R	xnor 	%r7, %r13, %r19
	.word 0xaf28f001  ! 135: SLLX_I	sllx	%r3, 0x0001, %r23
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xba792120  ! 138: SDIV_I	sdiv 	%r4, 0x0120, %r29
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,32)
	.word 0xfa590000  ! 141: LDX_R	ldx	[%r4 + %r0], %r29
	.word 0xac98c06b  ! 144: XORcc_R	xorcc 	%r3, %r11, %r22
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR_NIR,11,32)
	.word 0xa0696dc3  ! 147: UDIVX_I	udivx 	%r5, 0x0dc3, %r16
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,59)
	.word 0xe0594000  ! 150: LDX_R	ldx	[%r5 + %r0], %r16
	.word 0xa331b001  ! 153: SRLX_I	srlx	%r6, 0x0001, %r17
	.word 0xa870e5ef  ! 156: UDIV_I	udiv 	%r3, 0x05ef, %r20
	.word 0xe870e4cf  ! 159: STX_I	stx	%r20, [%r3 + 0x04cf]
	.word 0xb331e061  ! 162: SRL_I	srl 	%r7, 0x0001, %r25
	.word 0xb631e3c6  ! 164: SUBC_I	orn 	%r7, 0x03c6, %r27
	.word 0xba712a52  ! 167: UDIV_I	udiv 	%r4, 0x0a52, %r29
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,NIR,x,0)
	.word 0xb531400c  ! 170: SRL_R	srl 	%r5, %r12, %r26
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xbe8920f4  ! 172: ANDcc_I	andcc 	%r4, 0x00f4, %r31
	.word 0xa8322a0e  ! 172: ORN_I	orn 	%r8, 0x0a0e, %r20
	.word 0xaf38c00f  ! 172: SRA_R	sra 	%r3, %r15, %r23
	.word 0xac01400e  ! 172: ADD_R	add 	%r5, %r14, %r22
	.word 0xacb2000e  ! 172: ORNcc_R	orncc 	%r8, %r14, %r22
	.word 0xae80800e  ! 172: ADDcc_R	addcc 	%r2, %r14, %r23
	.word 0xa8c2000d  ! 172: ADDCcc_R	addccc 	%r8, %r13, %r20
	.word 0xb238c00f  ! 172: XNOR_R	xnor 	%r3, %r15, %r25
	.word 0xa5296001  ! 172: SLL_I	sll 	%r5, 0x0001, %r18
	.word 0xb08a2c78  ! 172: ANDcc_I	andcc 	%r8, 0x0c78, %r24
	.word 0xbc89000d  ! 172: ANDcc_R	andcc 	%r4, %r13, %r30
	.word 0xb0c1000e  ! 172: ADDCcc_R	addccc 	%r4, %r14, %r24
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2c0800a  ! 173: ADDCcc_R	addccc 	%r2, %r10, %r25
	.word 0xb239c00b  ! 173: XNOR_R	xnor 	%r7, %r11, %r25
	.word 0xbaa96613  ! 173: ANDNcc_I	andncc 	%r5, 0x0613, %r29
	.word 0xa739e001  ! 173: SRA_I	sra 	%r7, 0x0001, %r19
	.word 0xb778040f  ! 173: MOVR_R	move	%r0, %r15, %r27
	.word 0xb6c12c6e  ! 173: ADDCcc_I	addccc 	%r4, 0x0c6e, %r27
	.word 0xaa18a1d7  ! 173: XOR_I	xor 	%r2, 0x01d7, %r21
	.word 0xaac126a2  ! 173: ADDCcc_I	addccc 	%r4, 0x06a2, %r21
	.word 0xb281ef61  ! 173: ADDcc_I	addcc 	%r7, 0x0f61, %r25
	.word 0xa2316ec0  ! 173: ORN_I	orn 	%r5, 0x0ec0, %r17
	.word 0xb08928f7  ! 173: ANDcc_I	andcc 	%r4, 0x08f7, %r24
	.word 0xba40e5eb  ! 173: ADDC_I	addc 	%r3, 0x05eb, %r29
	.word 0xa9643801  ! 173: MOVcc_I	<illegal instruction>
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa89a95b  ! 174: ANDcc_I	andcc 	%r6, 0x095b, %r21
	.word 0xa689e110  ! 174: ANDcc_I	andcc 	%r7, 0x0110, %r19
	.word 0xa1782401  ! 174: MOVR_I	move	%r0, 0x110, %r16
	.word 0xb039400b  ! 174: XNOR_R	xnor 	%r5, %r11, %r24
	.word 0xae112dd0  ! 174: OR_I	or 	%r4, 0x0dd0, %r23
	.word 0xac188009  ! 174: XOR_R	xor 	%r2, %r9, %r22
	.word 0xa632000d  ! 174: ORN_R	orn 	%r8, %r13, %r19
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xe631ae28  ! 176: STH_I	sth	%r19, [%r6 + 0x0e28]
	.word 0xad78040f  ! 179: MOVR_R	move	%r0, %r15, %r22
	.word 0xa421e77f  ! 181: SUB_I	sub 	%r7, 0x077f, %r18
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR_NIR,21,26)
	.word 0xa479000a  ! 184: SDIV_R	sdiv 	%r4, %r10, %r18
	.word 0xe4712a93  ! 187: STX_I	stx	%r18, [%r4 + 0x0a93]
	.word 0xae31000a  ! 190: ORN_R	orn 	%r4, %r10, %r23
	.word 0xb129900f  ! 192: SLLX_R	sllx	%r6, %r15, %r24
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,IR_NIR,25,14)
	.word 0xbcf22f77  ! 195: UDIVcc_I	udivcc 	%r8, 0x0f77, %r30
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6116b65  ! 197: OR_I	or 	%r5, 0x0b65, %r19
	.word 0xb8b926cc  ! 197: XNORcc_I	xnorcc 	%r4, 0x06cc, %r28
	.word 0xaf31c00b  ! 197: SRL_R	srl 	%r7, %r11, %r23
	.word 0xa039a397  ! 197: XNOR_I	xnor 	%r6, 0x0397, %r16
	.word 0xbe98aaec  ! 197: XORcc_I	xorcc 	%r2, 0x0aec, %r31
	.word 0xa819400a  ! 197: XOR_R	xor 	%r5, %r10, %r20
	.word 0xb978040b  ! 197: MOVR_R	move	%r0, %r11, %r28
	.word 0xb280c00a  ! 197: ADDcc_R	addcc 	%r3, %r10, %r25
	.word 0xb48a000a  ! 197: ANDcc_R	andcc 	%r8, %r10, %r26
	.word 0xb4816117  ! 197: ADDcc_I	addcc 	%r5, 0x0117, %r26
	.word 0xa418e0d0  ! 197: XOR_I	xor 	%r3, 0x00d0, %r18
	.word 0xa692000a  ! 197: ORcc_R	orcc 	%r8, %r10, %r19
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	.word 0xb2112c5d  ! 198: OR_I	or 	%r4, 0x0c5d, %r25
	.word 0xbb28f001  ! 198: SLLX_I	sllx	%r3, 0x0001, %r29
	.word 0xa698800a  ! 198: XORcc_R	xorcc 	%r2, %r10, %r19
	.word 0xbe99acdf  ! 198: XORcc_I	xorcc 	%r6, 0x0cdf, %r31
	.word 0xb8410009  ! 198: ADDC_R	addc 	%r4, %r9, %r28
	.word 0xb841222f  ! 198: ADDC_I	addc 	%r4, 0x022f, %r28
	.word 0xaa81c00c  ! 198: ADDcc_R	addcc 	%r7, %r12, %r21
	.word 0xb732100d  ! 198: SRLX_R	srlx	%r8, %r13, %r27
	.word 0xb011a8d7  ! 198: OR_I	or 	%r6, 0x08d7, %r24
	.word 0xb681000a  ! 198: ADDcc_R	addcc 	%r4, %r10, %r27
	.word 0xa440a6a8  ! 198: ADDC_I	addc 	%r2, 0x06a8, %r18
	.word 0xa764180a  ! 198: MOVcc_R	<illegal instruction>
	.word 0xb430edc7  ! 198: ORN_I	orn 	%r3, 0x0dc7, %r26
.align 0x8
	.word 0x10800003  ! 199: BA	ba  	<label_0x3>
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xe0722bd8  ! 202: STX_I	stx	%r16, [%r8 + 0x0bd8]
	.word 0xa62a2a04  ! 204: ANDN_I	andn 	%r8, 0x0a04, %r19
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,NIR,x,31)
	.word 0xae71c00c  ! 207: UDIV_R	udiv 	%r7, %r12, %r23
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xb739f001  ! 210: SRAX_I	srax	%r7, 0x0001, %r27
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,5)
	.word 0xf649c000  ! 213: LDSB_R	ldsb	[%r7 + %r0], %r27
	.word 0xa899c06f  ! 216: XORcc_R	xorcc 	%r7, %r15, %r20
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xacf8800a  ! 219: SDIVcc_R	sdivcc 	%r2, %r10, %r22
	.word 0xa028800e  ! 221: ANDN_R	andn 	%r2, %r14, %r16
	.word 0xa410800d  ! 221: OR_R	or 	%r2, %r13, %r18
	.word 0xba08800c  ! 221: AND_R	and 	%r2, %r12, %r29
	.word 0xbc110009  ! 221: OR_R	or 	%r4, %r9, %r30
	.word 0xaa38800d  ! 221: XNOR_R	xnor 	%r2, %r13, %r21
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xe851eede  ! 223: LDSH_I	ldsh	[%r7 + 0x0ede], %r20
	.word 0xbb68eaa2  ! 226: SDIVX_I	sdivx	%r3, 0x0aa2, %r29
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	.word 0xb601644e  ! 228: ADD_I	add 	%r5, 0x044e, %r27
	.word 0xb531800a  ! 228: SRL_R	srl 	%r6, %r10, %r26
	.word 0xa438800b  ! 228: XNOR_R	xnor 	%r2, %r11, %r18
	.word 0xa280ebe5  ! 228: ADDcc_I	addcc 	%r3, 0x0be5, %r17
	.word 0xa801400f  ! 228: ADD_R	add 	%r5, %r15, %r20
	.word 0xb281abec  ! 228: ADDcc_I	addcc 	%r6, 0x0bec, %r25
	.word 0xb800a96d  ! 228: ADD_I	add 	%r2, 0x096d, %r28
	.word 0xb12a2001  ! 228: SLL_I	sll 	%r8, 0x0001, %r24
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xb219000d  ! 229: XOR_R	xor 	%r4, %r13, %r25
	.word 0xa8b1c00f  ! 229: ORNcc_R	orncc 	%r7, %r15, %r20
	.word 0xb1296001  ! 229: SLL_I	sll 	%r5, 0x0001, %r24
	.word 0xbeb8e2f3  ! 229: XNORcc_I	xnorcc 	%r3, 0x02f3, %r31
	.word 0xaac1ad6d  ! 229: ADDCcc_I	addccc 	%r6, 0x0d6d, %r21
	.word 0xa2c0a63f  ! 229: ADDCcc_I	addccc 	%r2, 0x063f, %r17
	.word 0xa92a2001  ! 229: SLL_I	sll 	%r8, 0x0001, %r20
	.word 0xb211000e  ! 229: OR_R	or 	%r4, %r14, %r25
	.word 0xbac22a96  ! 229: ADDCcc_I	addccc 	%r8, 0x0a96, %r29
	.word 0xb7297001  ! 229: SLLX_I	sllx	%r5, 0x0001, %r27
	.word 0xb131900d  ! 229: SRLX_R	srlx	%r6, %r13, %r24
	.word 0xb881a80a  ! 229: ADDcc_I	addcc 	%r6, 0x080a, %r28
	.word 0xa4b2000c  ! 229: ORNcc_R	orncc 	%r8, %r12, %r18
	.word 0xe432239b  ! 231: STH_I	sth	%r18, [%r8 + 0x039b]
	.word 0xaf30b061  ! 234: SRLX_I	srlx	%r2, 0x0021, %r23
	.word 0xb889a8e9  ! 236: ANDcc_I	andcc 	%r6, 0x08e9, %r28
	.word 0xbef1000d  ! 239: UDIVcc_R	udivcc 	%r4, %r13, %r31
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,NIR,x,16)
	.word 0xb2a1c009  ! 242: SUBcc_R	subcc 	%r7, %r9, %r25
	.word 0xa3299009  ! 244: SLLX_R	sllx	%r6, %r9, %r17
	.word 0xac18800e  ! 244: XOR_R	xor 	%r2, %r14, %r22
	.word 0xa010e3e6  ! 244: OR_I	or 	%r3, 0x03e6, %r16
	.word 0xb929c00a  ! 244: SLL_R	sll 	%r7, %r10, %r28
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,33)
	.word 0xf851c000  ! 246: LDSH_R	ldsh	[%r7 + %r0], %r28
	.word 0xaeb1c00a  ! 249: ORNcc_R	orncc 	%r7, %r10, %r23
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,7,33)
	.word 0xacf1691a  ! 252: UDIVcc_I	udivcc 	%r5, 0x091a, %r22
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf396001  ! 254: SRA_I	sra 	%r5, 0x0001, %r23
	.word 0xae81e9b2  ! 254: ADDcc_I	addcc 	%r7, 0x09b2, %r23
	.word 0xbc412ac7  ! 254: ADDC_I	addc 	%r4, 0x0ac7, %r30
	.word 0xb881e592  ! 254: ADDcc_I	addcc 	%r7, 0x0592, %r28
	.word 0xbc898009  ! 254: ANDcc_R	andcc 	%r6, %r9, %r30
	.word 0xb281000d  ! 254: ADDcc_R	addcc 	%r4, %r13, %r25
	.word 0xa3297001  ! 254: SLLX_I	sllx	%r5, 0x0001, %r17
	.word 0xaa19400c  ! 254: XOR_R	xor 	%r5, %r12, %r21
	.word 0xa0016efd  ! 255: ADD_I	add 	%r5, 0x0efd, %r16
	.word 0xaa11000d  ! 255: OR_R	or 	%r4, %r13, %r21
	.word 0xbe39e0f1  ! 255: XNOR_I	xnor 	%r7, 0x00f1, %r31
	.word 0xa928800c  ! 255: SLL_R	sll 	%r2, %r12, %r20
	.word 0xb6aa0009  ! 256: ANDNcc_R	andncc 	%r8, %r9, %r27
	.word 0xb831800b  ! 256: ORN_R	orn 	%r6, %r11, %r28
	.word 0xb299000f  ! 256: XORcc_R	xorcc 	%r4, %r15, %r25
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,36)
	.word 0xf2010000  ! 258: LDUW_R	lduw	[%r4 + %r0], %r25
	.word 0xb441a0f7  ! 261: ADDC_I	addc 	%r6, 0x00f7, %r26
	.word 0xbcf9800e  ! 264: SDIVcc_R	sdivcc 	%r6, %r14, %r30
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xbb31e001  ! 267: SRL_I	srl 	%r7, 0x0001, %r29
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xf0716e88  ! 270: STX_I	stx	%r24, [%r5 + 0x0e88]
	.word 0xb638c06b  ! 273: XNOR_R	xnor 	%r3, %r11, %r27
	.word 0xb810800b  ! 275: OR_R	or 	%r2, %r11, %r28
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,IR_NIR,10,18)
	.word 0xa8f9800d  ! 278: SDIVcc_R	sdivcc 	%r6, %r13, %r20
	.word 0xb5313001  ! 280: SRLX_I	srlx	%r4, 0x0001, %r26
	.word 0xae28ee0d  ! 280: ANDN_I	andn 	%r3, 0x0e0d, %r23
	.word 0xb729d00a  ! 280: SLLX_R	sllx	%r7, %r10, %r27
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xf609e0c7  ! 283: LDUB_I	ldub	[%r7 + 0x00c7], %r27
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,NIR,x,13)
	.word 0xbe692b12  ! 286: UDIVX_I	udivx 	%r4, 0x0b12, %r31
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xfe70ab60  ! 289: STX_I	stx	%r31, [%r2 + 0x0b60]
	.word 0xa529e061  ! 292: SLL_I	sll 	%r7, 0x0001, %r18
	.word 0xa6b20009  ! 294: ORNcc_R	orncc 	%r8, %r9, %r19
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,NIR,x,4)
	.word 0xbe78a0b1  ! 297: SDIV_I	sdiv 	%r2, 0x00b1, %r31
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa28c00a  ! 299: ANDN_R	andn 	%r3, %r10, %r21
	.word 0xbb31c009  ! 299: SRL_R	srl 	%r7, %r9, %r29
	.word 0xa9323001  ! 299: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0xa602000c  ! 299: ADD_R	add 	%r8, %r12, %r19
	.word 0xaa10e9f1  ! 299: OR_I	or 	%r3, 0x09f1, %r21
	.word 0xa040c00d  ! 299: ADDC_R	addc 	%r3, %r13, %r16
	.word 0xa930e001  ! 299: SRL_I	srl 	%r3, 0x0001, %r20
	.word 0xbd29c00e  ! 299: SLL_R	sll 	%r7, %r14, %r30
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xac90c00c  ! 300: ORcc_R	orcc 	%r3, %r12, %r22
	.word 0xb40169f3  ! 300: ADD_I	add 	%r5, 0x09f3, %r26
	.word 0xbf39400d  ! 300: SRA_R	sra 	%r5, %r13, %r31
	.word 0xa0296774  ! 300: ANDN_I	andn 	%r5, 0x0774, %r16
	.word 0xab31b001  ! 300: SRLX_I	srlx	%r6, 0x0001, %r21
	.word 0xba99800c  ! 300: XORcc_R	xorcc 	%r6, %r12, %r29
	.word 0xbc3167b5  ! 300: ORN_I	orn 	%r5, 0x07b5, %r30
	.word 0xb811000f  ! 300: OR_R	or 	%r4, %r15, %r28
	.word 0xb609000a  ! 300: AND_R	and 	%r4, %r10, %r27
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xa32a2001  ! 301: SLL_I	sll 	%r8, 0x0001, %r17
	.word 0xb240800b  ! 301: ADDC_R	addc 	%r2, %r11, %r25
	.word 0xaa31258e  ! 301: ORN_I	orn 	%r4, 0x058e, %r21
	.word 0xb2096333  ! 301: AND_I	and 	%r5, 0x0333, %r25
	.word 0xb9293001  ! 301: SLLX_I	sllx	%r4, 0x0001, %r28
	.word 0xaea8c00b  ! 301: ANDNcc_R	andncc 	%r3, %r11, %r23
	.word 0xb3292001  ! 301: SLL_I	sll 	%r4, 0x0001, %r25
	.word 0xb241400e  ! 301: ADDC_R	addc 	%r5, %r14, %r25
	.word 0xb6192b8c  ! 301: XOR_I	xor 	%r4, 0x0b8c, %r27
	.word 0xb289800c  ! 301: ANDcc_R	andcc 	%r6, %r12, %r25
	.word 0xae89a32b  ! 301: ANDcc_I	andcc 	%r6, 0x032b, %r23
	.word 0xaa1a000d  ! 301: XOR_R	xor 	%r8, %r13, %r21
	.word 0xb529b001  ! 301: SLLX_I	sllx	%r6, 0x0001, %r26
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,27,x, x,x,x, x,x,x)
	.word 0xa289000e  ! 303: ANDcc_R	andcc 	%r4, %r14, %r17
	.word 0xb419e76f  ! 306: XOR_I	xor 	%r7, 0x076f, %r26
	.word 0xae4163e7  ! 308: ADDC_I	addc 	%r5, 0x03e7, %r23
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,NIR,x,8)
	.word 0xac70c00b  ! 311: UDIV_R	udiv 	%r3, %r11, %r22
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,24,x, x,x,x, x,x,x)
	.word 0xec28e321  ! 315: STB_I	stb	%r22, [%r3 + 0x0321]
	.word 0xa6b1406e  ! 318: ORNcc_R	orncc 	%r5, %r14, %r19
	.word 0xb2c0e484  ! 320: ADDCcc_I	addccc 	%r3, 0x0484, %r25
	.word 0xa071a10e  ! 323: UDIV_I	udiv 	%r6, 0x010e, %r16
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,IR_NIR,12,31)
	.word 0xbb39000d  ! 326: SRA_R	sra 	%r4, %r13, %r29
.align 0x8
	.word 0x10800003  ! 328: BA	ba  	<label_0x3>
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,6)
	.word 0xfa590000  ! 331: LDX_R	ldx	[%r4 + %r0], %r29
	.word 0xb729900b  ! 334: SLLX_R	sllx	%r6, %r11, %r27
	.word 0xb769400a  ! 337: SDIVX_R	sdivx	%r5, %r10, %r27
thr1_ic_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,IR,10,x)
	.word 0xa091400e  ! 340: ORcc_R	orcc 	%r5, %r14, %r16
	.word 0xac29c00f  ! 342: ANDN_R	andn 	%r7, %r15, %r22
thr1_ic_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xb679c00b  ! 345: SDIV_R	sdiv 	%r7, %r11, %r27
thr1_ic_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,NIR,x,27)
	.word 0xbb64180a  ! 348: MOVcc_R	<illegal instruction>
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xbd2a100b  ! 350: SLLX_R	sllx	%r8, %r11, %r30
	.word 0xa499ee8c  ! 350: XORcc_I	xorcc 	%r7, 0x0e8c, %r18
	.word 0xa008c00e  ! 350: AND_R	and 	%r3, %r14, %r16
	.word 0xb564180a  ! 350: MOVcc_R	<illegal instruction>
	.word 0xba010009  ! 350: ADD_R	add 	%r4, %r9, %r29
	.word 0xb419000e  ! 350: XOR_R	xor 	%r4, %r14, %r26
	.word 0xb6c121c3  ! 350: ADDCcc_I	addccc 	%r4, 0x01c3, %r27
	.word 0xa008c00e  ! 350: AND_R	and 	%r3, %r14, %r16
	.word 0xb419c00c  ! 350: XOR_R	xor 	%r7, %r12, %r26
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,32)
	.word 0xf401c000  ! 352: LDUW_R	lduw	[%r7 + %r0], %r26
	.word 0xb039806e  ! 355: XNOR_R	xnor 	%r6, %r14, %r24
	.word 0xacf9c00f  ! 358: SDIVcc_R	sdivcc 	%r7, %r15, %r22
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,28)
	.word 0xec51c000  ! 361: LDSH_R	ldsh	[%r7 + %r0], %r22
	.word 0xa0288069  ! 364: ANDN_R	andn 	%r2, %r9, %r16
	.word 0xa6696d09  ! 367: UDIVX_I	udivx 	%r5, 0x0d09, %r19
thr1_ic_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,IR_NIR,4,24)
	.word 0xb9780409  ! 370: MOVR_R	move	%r0, %r9, %r28
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,28)
	.word 0xf8414000  ! 373: LDSW_R	ldsw	[%r5 + %r0], %r28
	.word 0xa221800b  ! 376: SUB_R	sub 	%r6, %r11, %r17
thr1_ic_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,IR_NIR,17,27)
	.word 0xa470a13d  ! 379: UDIV_I	udiv 	%r2, 0x013d, %r18
	.word 0xb4c0c00e  ! 381: ADDCcc_R	addccc 	%r3, %r14, %r26
	.word 0xb8890009  ! 381: ANDcc_R	andcc 	%r4, %r9, %r28
	.word 0xaa392a26  ! 381: XNOR_I	xnor 	%r4, 0x0a26, %r21
	.word 0xb899800b  ! 381: XORcc_R	xorcc 	%r6, %r11, %r28
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xf801a409  ! 384: LDUW_I	lduw	[%r6 + 0x0409], %r28
thr1_ic_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_29), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xa8f1800b  ! 387: UDIVcc_R	udivcc 	%r6, %r11, %r20
	.word 0xb099800d  ! 389: XORcc_R	xorcc 	%r6, %r13, %r24
	.word 0xbb29000f  ! 389: SLL_R	sll 	%r4, %r15, %r29
	.word 0xb031000a  ! 389: ORN_R	orn 	%r4, %r10, %r24
	.word 0xbcb88009  ! 389: XNORcc_R	xnorcc 	%r2, %r9, %r30
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xfa28a9a2  ! 391: STB_I	stb	%r29, [%r2 + 0x09a2]
	.word 0xa08a000a  ! 394: ANDcc_R	andcc 	%r8, %r10, %r16
	.word 0xa728e001  ! 396: SLL_I	sll 	%r3, 0x0001, %r19
	.word 0xb470ac38  ! 399: UDIV_I	udiv 	%r2, 0x0c38, %r26
thr1_ic_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_30), 16, 16),1,IC_DATA,NIR,x,18)
	.word 0xaf31f001  ! 402: SRLX_I	srlx	%r7, 0x0001, %r23
thr1_resum_intr_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa89af86  ! 404: ANDcc_I	andcc 	%r6, 0x0f86, %r21
	.word 0xae022ee0  ! 404: ADD_I	add 	%r8, 0x0ee0, %r23
	.word 0xa2916250  ! 404: ORcc_I	orcc 	%r5, 0x0250, %r17
	.word 0xa2996455  ! 404: XORcc_I	xorcc 	%r5, 0x0455, %r17
	.word 0xbf28d00a  ! 404: SLLX_R	sllx	%r3, %r10, %r31
	.word 0xb008ae12  ! 404: AND_I	and 	%r2, 0x0e12, %r24
	.word 0xae09800c  ! 404: AND_R	and 	%r6, %r12, %r23
	.word 0xb4ba2cdd  ! 404: XNORcc_I	xnorcc 	%r8, 0x0cdd, %r26
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xb021000e  ! 406: SUB_R	sub 	%r4, %r14, %r24
	.word 0xb840e35c  ! 409: ADDC_I	addc 	%r3, 0x035c, %r28
	.word 0xa681800a  ! 411: ADDcc_R	addcc 	%r6, %r10, %r19
thr1_ic_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_31), 16, 16),1,IC_DATA,IR_NIR,10,6)
	.word 0xbc7a2a7d  ! 414: SDIV_I	sdiv 	%r8, 0x0a7d, %r30
	.word 0xf031a70c  ! 417: STH_I	sth	%r24, [%r6 + 0x070c]
	.word 0xb000a8e6  ! 420: ADD_I	add 	%r2, 0x08e6, %r24
	.word 0xa232248c  ! 422: SUBC_I	orn 	%r8, 0x048c, %r17
	.word 0xa269eba9  ! 425: UDIVX_I	udivx 	%r7, 0x0ba9, %r17
thr1_resum_intr_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0xa6b9800f  ! 427: XNORcc_R	xnorcc 	%r6, %r15, %r19
	.word 0xb739100e  ! 427: SRAX_R	srax	%r4, %r14, %r27
	.word 0xb8aa241e  ! 427: ANDNcc_I	andncc 	%r8, 0x041e, %r28
	.word 0xbac12b7d  ! 427: ADDCcc_I	addccc 	%r4, 0x0b7d, %r29
	.word 0xb8422308  ! 427: ADDC_I	addc 	%r8, 0x0308, %r28
	.word 0xba99000f  ! 427: XORcc_R	xorcc 	%r4, %r15, %r29
	.word 0xb328d00a  ! 427: SLLX_R	sllx	%r3, %r10, %r25
	.word 0xb5316001  ! 427: SRL_I	srl 	%r5, 0x0001, %r26
	.word 0xb211000f  ! 427: OR_R	or 	%r4, %r15, %r25
	.word 0xb239c00e  ! 427: XNOR_R	xnor 	%r7, %r14, %r25
	.word 0xb539d00e  ! 428: SRAX_R	srax	%r7, %r14, %r26
	.word 0xa3322001  ! 428: SRL_I	srl 	%r8, 0x0001, %r17
	.word 0xa028ab48  ! 428: ANDN_I	andn 	%r2, 0x0b48, %r16
	.word 0xb880800b  ! 429: ADDcc_R	addcc 	%r2, %r11, %r28
	.word 0xa611000e  ! 429: OR_R	or 	%r4, %r14, %r19
	.word 0xb531900d  ! 429: SRLX_R	srlx	%r6, %r13, %r26
	.word 0xa41220db  ! 429: OR_I	or 	%r8, 0x00db, %r18
	.word 0xb6b12b84  ! 429: ORNcc_I	orncc 	%r4, 0x0b84, %r27
	.word 0xb2b92433  ! 430: XNORcc_I	xnorcc 	%r4, 0x0433, %r25
	.word 0xa418c00b  ! 430: XOR_R	xor 	%r3, %r11, %r18
	.word 0xaac0c00f  ! 430: ADDCcc_R	addccc 	%r3, %r15, %r21
	.word 0xa164180d  ! 430: MOVcc_R	<illegal instruction>
.align 0x8
	.word 0x10800003  ! 431: BA	ba  	<label_0x3>
	.word 0xe259000e  ! 434: LDX_R	ldx	[%r4 + %r14], %r17
	.word 0xb630e0af  ! 436: ORN_I	orn 	%r3, 0x00af, %r27
thr1_ic_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_32), 16, 16),1,IC_DATA,IR_NIR,23,28)
	.word 0xa472000a  ! 439: UDIV_R	udiv 	%r8, %r10, %r18
thr1_ic_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_33), 16, 16),1,IC_DATA,IR_NIR,13,17)
	.word 0xb031e216  ! 442: SUBC_I	orn 	%r7, 0x0216, %r24
	.word 0xbd39400a  ! 444: SRA_R	sra 	%r5, %r10, %r30
	.word 0xb409af30  ! 444: AND_I	and 	%r6, 0x0f30, %r26
	.word 0xb0b96c2f  ! 444: XNORcc_I	xnorcc 	%r5, 0x0c2f, %r24
	.word 0xb5643801  ! 444: MOVcc_I	<illegal instruction>
	.word 0xb299a7da  ! 444: XORcc_I	xorcc 	%r6, 0x07da, %r25
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xe621a940  ! 446: STW_I	stw	%r19, [%r6 + 0x0940]
	.word 0xbcc1c00a  ! 449: ADDCcc_R	addccc 	%r7, %r10, %r30
	.word 0xa610a613  ! 451: OR_I	or 	%r2, 0x0613, %r19
	.word 0xac692c54  ! 454: UDIVX_I	udivx 	%r4, 0x0c54, %r22
thr1_ic_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_34), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xa6a9800d  ! 457: ANDNcc_R	andncc 	%r6, %r13, %r19
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe628e3ff  ! 460: STB_I	stb	%r19, [%r3 + 0x03ff]
	.word 0xa3782401  ! 463: MOVR_I	move	%r0, 0x401, %r17
	.word 0xab39800e  ! 465: SRA_R	sra 	%r6, %r14, %r21
thr1_ic_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_35), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xa969efd3  ! 468: SDIVX_I	sdivx	%r7, 0x0fd3, %r20
thr1_resum_intr_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	.word 0xb329d00c  ! 470: SLLX_R	sllx	%r7, %r12, %r25
	.word 0xa2c0a303  ! 470: ADDCcc_I	addccc 	%r2, 0x0303, %r17
	.word 0xba19ac26  ! 470: XOR_I	xor 	%r6, 0x0c26, %r29
	.word 0xa7296001  ! 470: SLL_I	sll 	%r5, 0x0001, %r19
	.word 0xa138800b  ! 470: SRA_R	sra 	%r2, %r11, %r16
	.word 0xba19c009  ! 470: XOR_R	xor 	%r7, %r9, %r29
	.word 0xad297001  ! 470: SLLX_I	sllx	%r5, 0x0001, %r22
	.word 0xb829c00b  ! 470: ANDN_R	andn 	%r7, %r11, %r28
	.word 0xac40abfa  ! 470: ADDC_I	addc 	%r2, 0x0bfa, %r22
	.word 0xa610e0e3  ! 470: OR_I	or 	%r3, 0x00e3, %r19
	.word 0xa9316001  ! 470: SRL_I	srl 	%r5, 0x0001, %r20
	.word 0xbb31900e  ! 470: SRLX_R	srlx	%r6, %r14, %r29
.align 0x8
	.word 0x10800003  ! 471: BA	ba  	<label_0x3>
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xfa11a9ab  ! 475: LDUH_I	lduh	[%r6 + 0x09ab], %r29
	.word 0xa430800a  ! 477: SUBC_R	orn 	%r2, %r10, %r18
thr1_ic_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_36), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xaa690009  ! 480: UDIVX_R	udivx 	%r4, %r9, %r21
thr1_ic_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_37), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xa73a2001  ! 483: SRA_I	sra 	%r8, 0x0001, %r19
thr1_resum_intr_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	.word 0xbf316001  ! 485: SRL_I	srl 	%r5, 0x0001, %r31
	.word 0xbb31a001  ! 485: SRL_I	srl 	%r6, 0x0001, %r29
	.word 0xbe0a2483  ! 485: AND_I	and 	%r8, 0x0483, %r31
	.word 0xaa392aca  ! 485: XNOR_I	xnor 	%r4, 0x0aca, %r21
	.word 0xb6b1eb73  ! 485: ORNcc_I	orncc 	%r7, 0x0b73, %r27
	.word 0xa0c0c00c  ! 485: ADDCcc_R	addccc 	%r3, %r12, %r16
	.word 0xa2c1c00d  ! 485: ADDCcc_R	addccc 	%r7, %r13, %r17
	.word 0xad31d00d  ! 485: SRLX_R	srlx	%r7, %r13, %r22
	.word 0xab39800c  ! 485: SRA_R	sra 	%r6, %r12, %r21
	.word 0xbea8ae64  ! 485: ANDNcc_I	andncc 	%r2, 0x0e64, %r31
	.word 0xa529500e  ! 486: SLLX_R	sllx	%r5, %r14, %r18
	.word 0xab38800c  ! 486: SRA_R	sra 	%r2, %r12, %r21
	.word 0xb011000e  ! 486: OR_R	or 	%r4, %r14, %r24
	.word 0xba19ae4b  ! 486: XOR_I	xor 	%r6, 0x0e4b, %r29
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,25,x, x,x,x, x,x,x)
	.word 0xba18800a  ! 488: XOR_R	xor 	%r2, %r10, %r29
	.word 0xbe18c06e  ! 491: XOR_R	xor 	%r3, %r14, %r31
	.word 0xb610ef74  ! 493: OR_I	or 	%r3, 0x0f74, %r27
thr1_ic_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_38), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xa669c00f  ! 496: UDIVX_R	udivx 	%r7, %r15, %r19
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,6)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0xf26dd6fc9da99303, %r16, %r16
	setx  0xf8e98f2a56dee249, %r16, %r17
	setx  0x386b3c007284e3d8, %r16, %r18
	setx  0x21796bebce3fbb98, %r16, %r19
	setx  0x985ca09b67dcb245, %r16, %r20
	setx  0xb6a321896e9e44b4, %r16, %r21
	setx  0x786209ad769efa08, %r16, %r22
	setx  0xe8a6e2218915d2e9, %r16, %r23
	setx  0x5373f544b4c9110d, %r16, %r24
	setx  0x2ff6218afa5105cc, %r16, %r25
	setx  0xe631412accd0799e, %r16, %r26
	setx  0xe71440a7cb939ad1, %r16, %r27
	setx  0x04d2e96431a669c3, %r16, %r28
	setx  0x4421ec8473127886, %r16, %r29
	setx  0xa750f00ad588a53a, %r16, %r30
	setx  0xc7f6911e265edd83, %r16, %r31
	setx  0x0000000000000840, %r16, %r9
	setx  0x0000000000000480, %r16, %r10
	setx  0x0000000000000ce0, %r16, %r11
	setx  0x0000000000000700, %r16, %r12
	setx  0x00000000000006e0, %r16, %r13
	setx  0x0000000000000570, %r16, %r14
	setx  0x00000000000005d0, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xbc69e1c3  ! 1: UDIVX_I	udivx 	%r7, 0x01c3, %r30
	.word 0xbe72000f  ! 1: UDIV_R	udiv 	%r8, %r15, %r31
	.word 0xa868800b  ! 1: UDIVX_R	udivx 	%r2, %r11, %r20
	.word 0xba78c00a  ! 1: SDIV_R	sdiv 	%r3, %r10, %r29
	.word 0xa868e691  ! 1: UDIVX_I	udivx 	%r3, 0x0691, %r20
	.word 0xad692d58  ! 1: SDIVX_I	sdivx	%r4, 0x0d58, %r22
	.word 0xa2716354  ! 1: UDIV_I	udiv 	%r5, 0x0354, %r17
	.word 0xb2f9e9d9  ! 1: SDIVcc_I	sdivcc 	%r7, 0x09d9, %r25
	.word 0xa2f94009  ! 1: SDIVcc_R	sdivcc 	%r5, %r9, %r17
	.word 0xaa71273e  ! 1: UDIV_I	udiv 	%r4, 0x073e, %r21
	.word 0xb0f1ac43  ! 1: UDIVcc_I	udivcc 	%r6, 0x0c43, %r24
	.word 0xb2f224ba  ! 1: UDIVcc_I	udivcc 	%r8, 0x04ba, %r25
	.word 0xb678ef42  ! 1: SDIV_I	sdiv 	%r3, 0x0f42, %r27
	.word 0xba71209b  ! 1: UDIV_I	udiv 	%r4, 0x009b, %r29
	.word 0xae69c00d  ! 1: UDIVX_R	udivx 	%r7, %r13, %r23
	.word 0xb2f0e327  ! 1: UDIVcc_I	udivcc 	%r3, 0x0327, %r25
	.word 0xa168e09a  ! 1: SDIVX_I	sdivx	%r3, 0x009a, %r16
	.word 0xb168ad43  ! 1: SDIVX_I	sdivx	%r2, 0x0d43, %r24
	.word 0xba6a000c  ! 1: UDIVX_R	udivx 	%r8, %r12, %r29
	.word 0xa9692bfb  ! 1: SDIVX_I	sdivx	%r4, 0x0bfb, %r20
	.word 0xa6f1c00c  ! 1: UDIVcc_R	udivcc 	%r7, %r12, %r19
	.word 0xb471a8d6  ! 1: UDIV_I	udiv 	%r6, 0x08d6, %r26
	.word 0xaf68800b  ! 1: SDIVX_R	sdivx	%r2, %r11, %r23
	.word 0xa672000c  ! 1: UDIV_R	udiv 	%r8, %r12, %r19
	.word 0xb2f12fdd  ! 1: UDIVcc_I	udivcc 	%r4, 0x0fdd, %r25
	.word 0xb969efbf  ! 1: SDIVX_I	sdivx	%r7, 0x0fbf, %r28
	.word 0xbafa2959  ! 1: SDIVcc_I	sdivcc 	%r8, 0x0959, %r29
	.word 0xbe68c00e  ! 1: UDIVX_R	udivx 	%r3, %r14, %r31
	.word 0xa478e531  ! 1: SDIV_I	sdiv 	%r3, 0x0531, %r18
	.word 0xa079ac81  ! 1: SDIV_I	sdiv 	%r6, 0x0c81, %r16
	.word 0xb231400a  ! 1: ORN_R	orn 	%r5, %r10, %r25
	.word 0xa530900e  ! 1: SRLX_R	srlx	%r2, %r14, %r18
	.word 0xa828800c  ! 1: ANDN_R	andn 	%r2, %r12, %r20
	.word 0xbeb8ef47  ! 1: XNORcc_I	xnorcc 	%r3, 0x0f47, %r31
	.word 0xb699000b  ! 1: XORcc_R	xorcc 	%r4, %r11, %r27
	.word 0xbcb9800f  ! 1: XNORcc_R	xnorcc 	%r6, %r15, %r30
	.word 0xbeb9ade2  ! 1: XNORcc_I	xnorcc 	%r6, 0x0de2, %r31
	.word 0xb930b001  ! 1: SRLX_I	srlx	%r2, 0x0001, %r28
	.word 0xa331a001  ! 1: SRL_I	srl 	%r6, 0x0001, %r17
	.word 0xae19800f  ! 1: XOR_R	xor 	%r6, %r15, %r23
	.word 0xa4f9e4cd  ! 1: SDIVcc_I	sdivcc 	%r7, 0x04cd, %r18
	.word 0xbb68c00f  ! 1: SDIVX_R	sdivx	%r3, %r15, %r29
	.word 0xa4f1ea20  ! 1: UDIVcc_I	udivcc 	%r7, 0x0a20, %r18
	.word 0xa87a000b  ! 1: SDIV_R	sdiv 	%r8, %r11, %r20
	.word 0xbaf12cb4  ! 1: UDIVcc_I	udivcc 	%r4, 0x0cb4, %r29
	.word 0xaef8800d  ! 1: SDIVcc_R	sdivcc 	%r2, %r13, %r23
	.word 0xa0f1000e  ! 1: UDIVcc_R	udivcc 	%r4, %r14, %r16
	.word 0xaaf20009  ! 1: UDIVcc_R	udivcc 	%r8, %r9, %r21
	.word 0xbf6a0009  ! 1: SDIVX_R	sdivx	%r8, %r9, %r31
	.word 0xa668800d  ! 1: UDIVX_R	udivx 	%r2, %r13, %r19
	.word 0xba722b0f  ! 1: UDIV_I	udiv 	%r8, 0x0b0f, %r29
	.word 0xb2fa23fb  ! 1: SDIVcc_I	sdivcc 	%r8, 0x03fb, %r25
	.word 0xbe79c00f  ! 1: SDIV_R	sdiv 	%r7, %r15, %r31
	.word 0xa569c00d  ! 1: SDIVX_R	sdivx	%r7, %r13, %r18
	.word 0xbd68eeca  ! 1: SDIVX_I	sdivx	%r3, 0x0eca, %r30
	.word 0xaef10009  ! 1: UDIVcc_R	udivcc 	%r4, %r9, %r23
	.word 0xb268800e  ! 1: UDIVX_R	udivx 	%r2, %r14, %r25
	.word 0xbcf2000b  ! 1: UDIVcc_R	udivcc 	%r8, %r11, %r30
	.word 0xa669e034  ! 1: UDIVX_I	udivx 	%r7, 0x0034, %r19
	.word 0xa071ae04  ! 1: UDIV_I	udiv 	%r6, 0x0e04, %r16
	.word 0xac68c00e  ! 1: UDIVX_R	udivx 	%r3, %r14, %r22
	.word 0xaa68c00d  ! 1: UDIVX_R	udivx 	%r3, %r13, %r21
	.word 0xa2792146  ! 1: SDIV_I	sdiv 	%r4, 0x0146, %r17
	.word 0xbef8eba9  ! 1: SDIVcc_I	sdivcc 	%r3, 0x0ba9, %r31
	.word 0xa0f10009  ! 1: UDIVcc_R	udivcc 	%r4, %r9, %r16
	.word 0xb768800c  ! 1: SDIVX_R	sdivx	%r2, %r12, %r27
	.word 0xa870e140  ! 1: UDIV_I	udiv 	%r3, 0x0140, %r20
	.word 0xa568800b  ! 1: SDIVX_R	sdivx	%r2, %r11, %r18
	.word 0xba68a9c7  ! 1: UDIVX_I	udivx 	%r2, 0x09c7, %r29
	.word 0xb070c00e  ! 1: UDIV_R	udiv 	%r3, %r14, %r24
	.word 0xbb29000d  ! 1: SLL_R	sll 	%r4, %r13, %r29
	.word 0xa8a9c00e  ! 1: ANDNcc_R	andncc 	%r7, %r14, %r20
	.word 0xac39e0db  ! 1: XNOR_I	xnor 	%r7, 0x00db, %r22
	.word 0xbeb9000c  ! 1: XNORcc_R	xnorcc 	%r4, %r12, %r31
	.word 0xb42a000c  ! 1: ANDN_R	andn 	%r8, %r12, %r26
	.word 0xa532100a  ! 1: SRLX_R	srlx	%r8, %r10, %r18
	.word 0xa2320009  ! 1: ORN_R	orn 	%r8, %r9, %r17
	.word 0xb881800f  ! 1: ADDcc_R	addcc 	%r6, %r15, %r28
	.word 0xaf29000c  ! 1: SLL_R	sll 	%r4, %r12, %r23
	.word 0xa9643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xaaf9a45f  ! 1: SDIVcc_I	sdivcc 	%r6, 0x045f, %r21
	.word 0xa271000a  ! 1: UDIV_R	udiv 	%r4, %r10, %r17
	.word 0xb569800c  ! 1: SDIVX_R	sdivx	%r6, %r12, %r26
	.word 0xa86a2b0b  ! 1: UDIVX_I	udivx 	%r8, 0x0b0b, %r20
	.word 0xb868800f  ! 1: UDIVX_R	udivx 	%r2, %r15, %r28
	.word 0xbd6a2105  ! 1: SDIVX_I	sdivx	%r8, 0x0105, %r30
	.word 0xaef8a577  ! 1: SDIVcc_I	sdivcc 	%r2, 0x0577, %r23
	.word 0xaa71695e  ! 1: UDIV_I	udiv 	%r5, 0x095e, %r21
	.word 0xbe712048  ! 1: UDIV_I	udiv 	%r4, 0x0048, %r31
	.word 0xa0f0c00e  ! 1: UDIVcc_R	udivcc 	%r3, %r14, %r16
	.word 0xa6f2000c  ! 1: UDIVcc_R	udivcc 	%r8, %r12, %r19
	.word 0xb168800b  ! 1: SDIVX_R	sdivx	%r2, %r11, %r24
	.word 0xa068800c  ! 1: UDIVX_R	udivx 	%r2, %r12, %r16
	.word 0xbe79000c  ! 1: SDIV_R	sdiv 	%r4, %r12, %r31
	.word 0xaaf9c00f  ! 1: SDIVcc_R	sdivcc 	%r7, %r15, %r21
	.word 0xb0f0800d  ! 1: UDIVcc_R	udivcc 	%r2, %r13, %r24
	.word 0xae716309  ! 1: UDIV_I	udiv 	%r5, 0x0309, %r23
	.word 0xa4fa000d  ! 1: SDIVcc_R	sdivcc 	%r8, %r13, %r18
	.word 0xbc79400b  ! 1: SDIV_R	sdiv 	%r5, %r11, %r30
	.word 0xa271ae82  ! 1: UDIV_I	udiv 	%r6, 0x0e82, %r17
	.word 0xa871000a  ! 1: UDIV_R	udiv 	%r4, %r10, %r20
	.word 0xa2f2292b  ! 1: UDIVcc_I	udivcc 	%r8, 0x092b, %r17
	.word 0xa468800f  ! 1: UDIVX_R	udivx 	%r2, %r15, %r18
	.word 0xa4f9c00f  ! 1: SDIVcc_R	sdivcc 	%r7, %r15, %r18
	.word 0xb669aa59  ! 1: UDIVX_I	udivx 	%r6, 0x0a59, %r27
	.word 0xaaf18009  ! 1: UDIVcc_R	udivcc 	%r6, %r9, %r21
	.word 0xb8712655  ! 1: UDIV_I	udiv 	%r4, 0x0655, %r28
	.word 0xbcf9400d  ! 1: SDIVcc_R	sdivcc 	%r5, %r13, %r30
	.word 0xa870ab73  ! 1: UDIV_I	udiv 	%r2, 0x0b73, %r20
	.word 0xb8f96577  ! 1: SDIVcc_I	sdivcc 	%r5, 0x0577, %r28
	.word 0xb4b1c00d  ! 1: ORNcc_R	orncc 	%r7, %r13, %r26
	.word 0xb430ae34  ! 1: ORN_I	orn 	%r2, 0x0e34, %r26
	.word 0xa419800f  ! 1: XOR_R	xor 	%r6, %r15, %r18
	.word 0xb1643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa038c00b  ! 1: XNOR_R	xnor 	%r3, %r11, %r16
	.word 0xb638e0c4  ! 1: XNOR_I	xnor 	%r3, 0x00c4, %r27
	.word 0xa5780409  ! 1: MOVR_R	move	%r0, %r9, %r18
	.word 0xb4a8800f  ! 1: ANDNcc_R	andncc 	%r2, %r15, %r26
	.word 0xae29400a  ! 1: ANDN_R	andn 	%r5, %r10, %r23
	.word 0xa611e218  ! 1: OR_I	or 	%r7, 0x0218, %r19
	.word 0xacf12185  ! 1: UDIVcc_I	udivcc 	%r4, 0x0185, %r22
	.word 0xba79000c  ! 1: SDIV_R	sdiv 	%r4, %r12, %r29
	.word 0xa369800f  ! 1: SDIVX_R	sdivx	%r6, %r15, %r17
	.word 0xb66929d8  ! 1: UDIVX_I	udivx 	%r4, 0x09d8, %r27
	.word 0xaa712f4b  ! 1: UDIV_I	udiv 	%r4, 0x0f4b, %r21
	.word 0xab6925b3  ! 1: SDIVX_I	sdivx	%r4, 0x05b3, %r21
	.word 0xb4f0e48f  ! 1: UDIVcc_I	udivcc 	%r3, 0x048f, %r26
	.word 0xb2f8800a  ! 1: SDIVcc_R	sdivcc 	%r2, %r10, %r25
	.word 0xbc6a2402  ! 1: UDIVX_I	udivx 	%r8, 0x0402, %r30
	.word 0xb968e3cd  ! 1: SDIVX_I	sdivx	%r3, 0x03cd, %r28
	.word 0xb0716bef  ! 1: UDIV_I	udiv 	%r5, 0x0bef, %r24
	.word 0xb2f12f1e  ! 1: UDIVcc_I	udivcc 	%r4, 0x0f1e, %r25
	.word 0xac78c009  ! 1: SDIV_R	sdiv 	%r3, %r9, %r22
	.word 0xb6792ce5  ! 1: SDIV_I	sdiv 	%r4, 0x0ce5, %r27
	.word 0xa0f8a427  ! 1: SDIVcc_I	sdivcc 	%r2, 0x0427, %r16
	.word 0xa2f0c00e  ! 1: UDIVcc_R	udivcc 	%r3, %r14, %r17
	.word 0xa87923dc  ! 1: SDIV_I	sdiv 	%r4, 0x03dc, %r20
	.word 0xb671800d  ! 1: UDIV_R	udiv 	%r6, %r13, %r27
	.word 0xad692129  ! 1: SDIVX_I	sdivx	%r4, 0x0129, %r22
	.word 0xa8fa0009  ! 1: SDIVcc_R	sdivcc 	%r8, %r9, %r20
	.word 0xa8f8e981  ! 1: SDIVcc_I	sdivcc 	%r3, 0x0981, %r20
	.word 0xab68800c  ! 1: SDIVX_R	sdivx	%r2, %r12, %r21
	.word 0xa67a000b  ! 1: SDIV_R	sdiv 	%r8, %r11, %r19
	.word 0xa079ef26  ! 1: SDIV_I	sdiv 	%r7, 0x0f26, %r16
	.word 0xb8f96759  ! 1: SDIVcc_I	sdivcc 	%r5, 0x0759, %r28
	.word 0xb16a000c  ! 1: SDIVX_R	sdivx	%r8, %r12, %r24
	.word 0xb669e294  ! 1: UDIVX_I	udivx 	%r7, 0x0294, %r27
	.word 0xbe6a25be  ! 1: UDIVX_I	udivx 	%r8, 0x05be, %r31
	.word 0xb86a2c21  ! 1: UDIVX_I	udivx 	%r8, 0x0c21, %r28
	.word 0xa86a2cdc  ! 1: UDIVX_I	udivx 	%r8, 0x0cdc, %r20
	.word 0xa49a000b  ! 1: XORcc_R	xorcc 	%r8, %r11, %r18
	.word 0xa429400a  ! 1: ANDN_R	andn 	%r5, %r10, %r18
	.word 0xbe92000b  ! 1: ORcc_R	orcc 	%r8, %r11, %r31
	.word 0xab39500a  ! 1: SRAX_R	srax	%r5, %r10, %r21
	.word 0xae022bff  ! 1: ADD_I	add 	%r8, 0x0bff, %r23
	.word 0xad29900b  ! 1: SLLX_R	sllx	%r6, %r11, %r22
	.word 0xaa19c00a  ! 1: XOR_R	xor 	%r7, %r10, %r21
	.word 0xa089c00b  ! 1: ANDcc_R	andcc 	%r7, %r11, %r16
	.word 0xac19aee9  ! 1: XOR_I	xor 	%r6, 0x0ee9, %r22
	.word 0xa2022f1d  ! 1: ADD_I	add 	%r8, 0x0f1d, %r17
	.word 0xb8f8c00c  ! 1: SDIVcc_R	sdivcc 	%r3, %r12, %r28
	.word 0xa47a2083  ! 1: SDIV_I	sdiv 	%r8, 0x0083, %r18
	.word 0xae78a064  ! 1: SDIV_I	sdiv 	%r2, 0x0064, %r23
	.word 0xa0f1000c  ! 1: UDIVcc_R	udivcc 	%r4, %r12, %r16
	.word 0xa968c00b  ! 1: SDIVX_R	sdivx	%r3, %r11, %r20
	.word 0xa6722317  ! 1: UDIV_I	udiv 	%r8, 0x0317, %r19
	.word 0xa469000a  ! 1: UDIVX_R	udivx 	%r4, %r10, %r18
	.word 0xb0f0a81e  ! 1: UDIVcc_I	udivcc 	%r2, 0x081e, %r24
	.word 0xb6f8a881  ! 1: SDIVcc_I	sdivcc 	%r2, 0x0881, %r27
	.word 0xa96a26b9  ! 1: SDIVX_I	sdivx	%r8, 0x06b9, %r20
	.word 0xa56a000c  ! 1: SDIVX_R	sdivx	%r8, %r12, %r18
	.word 0xac71e0f8  ! 1: UDIV_I	udiv 	%r7, 0x00f8, %r22
	.word 0xa270c00f  ! 1: UDIV_R	udiv 	%r3, %r15, %r17
	.word 0xb6f92099  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0099, %r27
	.word 0xa071aaa2  ! 1: UDIV_I	udiv 	%r6, 0x0aa2, %r16
	.word 0xb0fa2adb  ! 1: SDIVcc_I	sdivcc 	%r8, 0x0adb, %r24
	.word 0xb2722fc6  ! 1: UDIV_I	udiv 	%r8, 0x0fc6, %r25
	.word 0xb271800e  ! 1: UDIV_R	udiv 	%r6, %r14, %r25
	.word 0xb070c009  ! 1: UDIV_R	udiv 	%r3, %r9, %r24
	.word 0xa470ec5b  ! 1: UDIV_I	udiv 	%r3, 0x0c5b, %r18
	.word 0xae6a0009  ! 1: UDIVX_R	udivx 	%r8, %r9, %r23
	.word 0xaa68ea3b  ! 1: UDIVX_I	udivx 	%r3, 0x0a3b, %r21
	.word 0xa0f1400c  ! 1: UDIVcc_R	udivcc 	%r5, %r12, %r16
	.word 0xaa79400e  ! 1: SDIV_R	sdiv 	%r5, %r14, %r21
	.word 0xb672000c  ! 1: UDIV_R	udiv 	%r8, %r12, %r27
	.word 0xba720009  ! 1: UDIV_R	udiv 	%r8, %r9, %r29
	.word 0xb271000f  ! 1: UDIV_R	udiv 	%r4, %r15, %r25
	.word 0xb271e3f1  ! 1: UDIV_I	udiv 	%r7, 0x03f1, %r25
	.word 0xba7928f8  ! 1: SDIV_I	sdiv 	%r4, 0x08f8, %r29
	.word 0xacf9a812  ! 1: SDIVcc_I	sdivcc 	%r6, 0x0812, %r22
	.word 0xbe19ac67  ! 1: XOR_I	xor 	%r6, 0x0c67, %r31
	.word 0xaa40800a  ! 1: ADDC_R	addc 	%r2, %r10, %r21
	.word 0xbc822b6a  ! 1: ADDcc_I	addcc 	%r8, 0x0b6a, %r30
	.word 0xb1782401  ! 1: MOVR_I	move	%r0, 0xffffff6a, %r24
	.word 0xa731800a  ! 1: SRL_R	srl 	%r6, %r10, %r19
	.word 0xaa29a25f  ! 1: ANDN_I	andn 	%r6, 0x025f, %r21
	.word 0xb6c0e867  ! 1: ADDCcc_I	addccc 	%r3, 0x0867, %r27
	.word 0xb001c00f  ! 1: ADD_R	add 	%r7, %r15, %r24
	.word 0xb898e8fb  ! 1: XORcc_I	xorcc 	%r3, 0x08fb, %r28
	.word 0xbcb92a43  ! 1: XNORcc_I	xnorcc 	%r4, 0x0a43, %r30
	.word 0xbaf9000c  ! 1: SDIVcc_R	sdivcc 	%r4, %r12, %r29
	.word 0xaf68e7f2  ! 1: SDIVX_I	sdivx	%r3, 0x07f2, %r23
	.word 0xacf9800c  ! 1: SDIVcc_R	sdivcc 	%r6, %r12, %r22
	.word 0xa679a262  ! 1: SDIV_I	sdiv 	%r6, 0x0262, %r19
	.word 0xa271662f  ! 1: UDIV_I	udiv 	%r5, 0x062f, %r17
	.word 0xb6fa2ca3  ! 1: SDIVcc_I	sdivcc 	%r8, 0x0ca3, %r27
	.word 0xb968a91e  ! 1: SDIVX_I	sdivx	%r2, 0x091e, %r28
	.word 0xaaf1c00d  ! 1: UDIVcc_R	udivcc 	%r7, %r13, %r21
	.word 0xa368c00b  ! 1: SDIVX_R	sdivx	%r3, %r11, %r17
	.word 0xb2f9000b  ! 1: SDIVcc_R	sdivcc 	%r4, %r11, %r25
	.word 0xb169c00c  ! 1: SDIVX_R	sdivx	%r7, %r12, %r24
	.word 0xb7694009  ! 1: SDIVX_R	sdivx	%r5, %r9, %r27
	.word 0xb868800f  ! 1: UDIVX_R	udivx 	%r2, %r15, %r28
	.word 0xbd6a25a6  ! 1: SDIVX_I	sdivx	%r8, 0x05a6, %r30
	.word 0xb8f9800e  ! 1: SDIVcc_R	sdivcc 	%r6, %r14, %r28
	.word 0xbef9acad  ! 1: SDIVcc_I	sdivcc 	%r6, 0x0cad, %r31
	.word 0xacf88009  ! 1: SDIVcc_R	sdivcc 	%r2, %r9, %r22
	.word 0xac6a236b  ! 1: UDIVX_I	udivx 	%r8, 0x036b, %r22
	.word 0xb8f9800d  ! 1: SDIVcc_R	sdivcc 	%r6, %r13, %r28
	.word 0xacfa000c  ! 1: SDIVcc_R	sdivcc 	%r8, %r12, %r22
	.word 0xb671400d  ! 1: UDIV_R	udiv 	%r5, %r13, %r27
	.word 0xa4f88009  ! 1: SDIVcc_R	sdivcc 	%r2, %r9, %r18
	.word 0xb0f9ea35  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0a35, %r24
	.word 0xbd69800b  ! 1: SDIVX_R	sdivx	%r6, %r11, %r30
	.word 0xa6f8a91b  ! 1: SDIVcc_I	sdivcc 	%r2, 0x091b, %r19
	.word 0xbf68a3ff  ! 1: SDIVX_I	sdivx	%r2, 0x03ff, %r31
	.word 0xb3696044  ! 1: SDIVX_I	sdivx	%r5, 0x0044, %r25
	.word 0xb078edd4  ! 1: SDIV_I	sdiv 	%r3, 0x0dd4, %r24
	.word 0xbb69c00a  ! 1: SDIVX_R	sdivx	%r7, %r10, %r29
	.word 0xa169e126  ! 1: SDIVX_I	sdivx	%r7, 0x0126, %r16
	.word 0xa281000b  ! 1: ADDcc_R	addcc 	%r4, %r11, %r17
	.word 0xbb2a2001  ! 1: SLL_I	sll 	%r8, 0x0001, %r29
	.word 0xb811a5bd  ! 1: OR_I	or 	%r6, 0x05bd, %r28
	.word 0xb099000a  ! 1: XORcc_R	xorcc 	%r4, %r10, %r24
	.word 0xa778040d  ! 1: MOVR_R	move	%r0, %r13, %r19
	.word 0xbe09e4d4  ! 1: AND_I	and 	%r7, 0x04d4, %r31
	.word 0xb8b9000b  ! 1: XNORcc_R	xnorcc 	%r4, %r11, %r28
	.word 0xa4ba000c  ! 1: XNORcc_R	xnorcc 	%r8, %r12, %r18
	.word 0xb0b0ee0e  ! 1: ORNcc_I	orncc 	%r3, 0x0e0e, %r24
	.word 0xad78040b  ! 1: MOVR_R	move	%r0, %r11, %r22
	.word 0xac78c00f  ! 1: SDIV_R	sdiv 	%r3, %r15, %r22
	.word 0xb071244e  ! 1: UDIV_I	udiv 	%r4, 0x044e, %r24
	.word 0xa46963c6  ! 1: UDIVX_I	udivx 	%r5, 0x03c6, %r18
	.word 0xb478800f  ! 1: SDIV_R	sdiv 	%r2, %r15, %r26
	.word 0xa0716d88  ! 1: UDIV_I	udiv 	%r5, 0x0d88, %r16
	.word 0xa6792495  ! 1: SDIV_I	sdiv 	%r4, 0x0495, %r19
	.word 0xa0f0800b  ! 1: UDIVcc_R	udivcc 	%r2, %r11, %r16
	.word 0xa479400a  ! 1: SDIV_R	sdiv 	%r5, %r10, %r18
	.word 0xb468800c  ! 1: UDIVX_R	udivx 	%r2, %r12, %r26
	.word 0xa079c00b  ! 1: SDIV_R	sdiv 	%r7, %r11, %r16
	.word 0xa671400b  ! 1: UDIV_R	udiv 	%r5, %r11, %r19
	.word 0xa869aa0b  ! 1: UDIVX_I	udivx 	%r6, 0x0a0b, %r20
	.word 0xb279400d  ! 1: SDIV_R	sdiv 	%r5, %r13, %r25
	.word 0xbc68ac66  ! 1: UDIVX_I	udivx 	%r2, 0x0c66, %r30
	.word 0xbd692c74  ! 1: SDIVX_I	sdivx	%r4, 0x0c74, %r30
	.word 0xb4f1000f  ! 1: UDIVcc_R	udivcc 	%r4, %r15, %r26
	.word 0xbaf92165  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0165, %r29
	.word 0xba72216d  ! 1: UDIV_I	udiv 	%r8, 0x016d, %r29
	.word 0xbc79c00a  ! 1: SDIV_R	sdiv 	%r7, %r10, %r30
	.word 0xa079a432  ! 1: SDIV_I	sdiv 	%r6, 0x0432, %r16
	.word 0xb8f9e330  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0330, %r28
	.word 0xacf0800d  ! 1: UDIVcc_R	udivcc 	%r2, %r13, %r22
	.word 0xb87121b3  ! 1: UDIV_I	udiv 	%r4, 0x01b3, %r28
	.word 0xbaf8c009  ! 1: SDIVcc_R	sdivcc 	%r3, %r9, %r29
	.word 0xa671000e  ! 1: UDIV_R	udiv 	%r4, %r14, %r19
	.word 0xad68c00a  ! 1: SDIVX_R	sdivx	%r3, %r10, %r22
	.word 0xacf92fff  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0fff, %r22
	.word 0xab696c86  ! 1: SDIVX_I	sdivx	%r5, 0x0c86, %r21
	.word 0xb0f96948  ! 1: SDIVcc_I	sdivcc 	%r5, 0x0948, %r24
	.word 0xbaf0ad32  ! 1: UDIVcc_I	udivcc 	%r2, 0x0d32, %r29
	.word 0xa431400b  ! 1: ORN_R	orn 	%r5, %r11, %r18
	.word 0xb441800a  ! 1: ADDC_R	addc 	%r6, %r10, %r26
	.word 0xa839800c  ! 1: XNOR_R	xnor 	%r6, %r12, %r20
	.word 0xac098009  ! 1: AND_R	and 	%r6, %r9, %r22
	.word 0xa53a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r18
	.word 0xb431a97a  ! 1: ORN_I	orn 	%r6, 0x097a, %r26
	.word 0xa841eaf0  ! 1: ADDC_I	addc 	%r7, 0x0af0, %r20
	.word 0xba01400c  ! 1: ADD_R	add 	%r5, %r12, %r29
	.word 0xb080ef62  ! 1: ADDcc_I	addcc 	%r3, 0x0f62, %r24
	.word 0xa641400a  ! 1: ADDC_R	addc 	%r5, %r10, %r19
	.word 0xa969000f  ! 1: SDIVX_R	sdivx	%r4, %r15, %r20
	.word 0xb8f8800a  ! 1: SDIVcc_R	sdivcc 	%r2, %r10, %r28
	.word 0xb270e7a7  ! 1: UDIV_I	udiv 	%r3, 0x07a7, %r25
	.word 0xa271000a  ! 1: UDIV_R	udiv 	%r4, %r10, %r17
	.word 0xb871e8c2  ! 1: UDIV_I	udiv 	%r7, 0x08c2, %r28
	.word 0xa079a47d  ! 1: SDIV_I	sdiv 	%r6, 0x047d, %r16
	.word 0xa6f8c00b  ! 1: SDIVcc_R	sdivcc 	%r3, %r11, %r19
	.word 0xa0f0800a  ! 1: UDIVcc_R	udivcc 	%r2, %r10, %r16
	.word 0xb279a4ae  ! 1: SDIV_I	sdiv 	%r6, 0x04ae, %r25
	.word 0xa8f1c00b  ! 1: UDIVcc_R	udivcc 	%r7, %r11, %r20
	.word 0xa4f1800b  ! 1: UDIVcc_R	udivcc 	%r6, %r11, %r18
	.word 0xb2f92bd1  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0bd1, %r25
	.word 0xb678c009  ! 1: SDIV_R	sdiv 	%r3, %r9, %r27
	.word 0xb6716c1b  ! 1: UDIV_I	udiv 	%r5, 0x0c1b, %r27
	.word 0xa369e669  ! 1: SDIVX_I	sdivx	%r7, 0x0669, %r17
	.word 0xa2f1000d  ! 1: UDIVcc_R	udivcc 	%r4, %r13, %r17
	.word 0xa270a235  ! 1: UDIV_I	udiv 	%r2, 0x0235, %r17
	.word 0xaef9400b  ! 1: SDIVcc_R	sdivcc 	%r5, %r11, %r23
	.word 0xac798009  ! 1: SDIV_R	sdiv 	%r6, %r9, %r22
	.word 0xaa78800b  ! 1: SDIV_R	sdiv 	%r2, %r11, %r21
	.word 0xa270800c  ! 1: UDIV_R	udiv 	%r2, %r12, %r17
	.word 0xa669a4c6  ! 1: UDIVX_I	udivx 	%r6, 0x04c6, %r19
	.word 0xa268e5e4  ! 1: UDIVX_I	udivx 	%r3, 0x05e4, %r17
	.word 0xbc72000a  ! 1: UDIV_R	udiv 	%r8, %r10, %r30
	.word 0xbe68a7a2  ! 1: UDIVX_I	udivx 	%r2, 0x07a2, %r31
	.word 0xb069c00b  ! 1: UDIVX_R	udivx 	%r7, %r11, %r24
	.word 0xa8f9400e  ! 1: SDIVcc_R	sdivcc 	%r5, %r14, %r20
	.word 0xbc68ed79  ! 1: UDIVX_I	udivx 	%r3, 0x0d79, %r30
	.word 0xaf68a621  ! 1: SDIVX_I	sdivx	%r2, 0x0621, %r23
	.word 0xb5698009  ! 1: SDIVX_R	sdivx	%r6, %r9, %r26
	.word 0xa2c0a30c  ! 1: ADDCcc_I	addccc 	%r2, 0x030c, %r17
	.word 0xbd29c00f  ! 1: SLL_R	sll 	%r7, %r15, %r30
	.word 0xb6b122c2  ! 1: ORNcc_I	orncc 	%r4, 0x02c2, %r27
	.word 0xa0b9620a  ! 1: XNORcc_I	xnorcc 	%r5, 0x020a, %r16
	.word 0xac29623f  ! 1: ANDN_I	andn 	%r5, 0x023f, %r22
	.word 0xbe022ab3  ! 1: ADD_I	add 	%r8, 0x0ab3, %r31
	.word 0xb6416e92  ! 1: ADDC_I	addc 	%r5, 0x0e92, %r27
	.word 0xa828800e  ! 1: ANDN_R	andn 	%r2, %r14, %r20
	.word 0xa8194009  ! 1: XOR_R	xor 	%r5, %r9, %r20
	.word 0xb4c10009  ! 1: ADDCcc_R	addccc 	%r4, %r9, %r26
	.word 0xa968a41a  ! 1: SDIVX_I	sdivx	%r2, 0x041a, %r20
	.word 0xa871c00d  ! 1: UDIV_R	udiv 	%r7, %r13, %r20
	.word 0xb070c00f  ! 1: UDIV_R	udiv 	%r3, %r15, %r24
	.word 0xbe79000c  ! 1: SDIV_R	sdiv 	%r4, %r12, %r31
	.word 0xa4792a40  ! 1: SDIV_I	sdiv 	%r4, 0x0a40, %r18
	.word 0xb269000a  ! 1: UDIVX_R	udivx 	%r4, %r10, %r25
	.word 0xb66a0009  ! 1: UDIVX_R	udivx 	%r8, %r9, %r27
	.word 0xa069abb7  ! 1: UDIVX_I	udivx 	%r6, 0x0bb7, %r16
	.word 0xa069abc7  ! 1: UDIVX_I	udivx 	%r6, 0x0bc7, %r16
	.word 0xbc78edc7  ! 1: SDIV_I	sdiv 	%r3, 0x0dc7, %r30
	.word 0xaaf8c00b  ! 1: SDIVcc_R	sdivcc 	%r3, %r11, %r21
	.word 0xb4f1800c  ! 1: UDIVcc_R	udivcc 	%r6, %r12, %r26
	.word 0xa2f1a723  ! 1: UDIVcc_I	udivcc 	%r6, 0x0723, %r17
	.word 0xbef8a11a  ! 1: SDIVcc_I	sdivcc 	%r2, 0x011a, %r31
	.word 0xa079e7a6  ! 1: SDIV_I	sdiv 	%r7, 0x07a6, %r16
	.word 0xa071000c  ! 1: UDIV_R	udiv 	%r4, %r12, %r16
	.word 0xbc79000c  ! 1: SDIV_R	sdiv 	%r4, %r12, %r30
	.word 0xb479efc0  ! 1: SDIV_I	sdiv 	%r7, 0x0fc0, %r26
	.word 0xae792444  ! 1: SDIV_I	sdiv 	%r4, 0x0444, %r23
	.word 0xb8f122c2  ! 1: UDIVcc_I	udivcc 	%r4, 0x02c2, %r28
	.word 0xab69800d  ! 1: SDIVX_R	sdivx	%r6, %r13, %r21
	.word 0xac78ac42  ! 1: SDIV_I	sdiv 	%r2, 0x0c42, %r22
	.word 0xa168e214  ! 1: SDIVX_I	sdivx	%r3, 0x0214, %r16
	.word 0xb169e75e  ! 1: SDIVX_I	sdivx	%r7, 0x075e, %r24
	.word 0xae70a59e  ! 1: UDIV_I	udiv 	%r2, 0x059e, %r23
	.word 0xb2f1e31b  ! 1: UDIVcc_I	udivcc 	%r7, 0x031b, %r25
	.word 0xa6f9e8fd  ! 1: SDIVcc_I	sdivcc 	%r7, 0x08fd, %r19
	.word 0xac79c00d  ! 1: SDIV_R	sdiv 	%r7, %r13, %r22
	.word 0xac79800f  ! 1: SDIV_R	sdiv 	%r6, %r15, %r22
	.word 0xb2f1acd2  ! 1: UDIVcc_I	udivcc 	%r6, 0x0cd2, %r25
	.word 0xa689000f  ! 1: ANDcc_R	andcc 	%r4, %r15, %r19
	.word 0xb5643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xad30e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r22
	.word 0xa929900a  ! 1: SLLX_R	sllx	%r6, %r10, %r20
	.word 0xbe096abe  ! 1: AND_I	and 	%r5, 0x0abe, %r31
	.word 0xa764180d  ! 1: MOVcc_R	<illegal instruction>
	.word 0xa840c00d  ! 1: ADDC_R	addc 	%r3, %r13, %r20
	.word 0xa610800b  ! 1: OR_R	or 	%r2, %r11, %r19
	.word 0xb241400f  ! 1: ADDC_R	addc 	%r5, %r15, %r25
	.word 0xa0c1aa9e  ! 1: ADDCcc_I	addccc 	%r6, 0x0a9e, %r16
	.word 0xb669000c  ! 1: UDIVX_R	udivx 	%r4, %r12, %r27
	.word 0xa4fa000d  ! 1: SDIVcc_R	sdivcc 	%r8, %r13, %r18
	.word 0xa4794009  ! 1: SDIV_R	sdiv 	%r5, %r9, %r18
	.word 0xa2f1c009  ! 1: UDIVcc_R	udivcc 	%r7, %r9, %r17
	.word 0xb0f2000f  ! 1: UDIVcc_R	udivcc 	%r8, %r15, %r24
	.word 0xbe70a41c  ! 1: UDIV_I	udiv 	%r2, 0x041c, %r31
	.word 0xa468c00e  ! 1: UDIVX_R	udivx 	%r3, %r14, %r18
	.word 0xa471400a  ! 1: UDIV_R	udiv 	%r5, %r10, %r18
	.word 0xbaf8800b  ! 1: SDIVcc_R	sdivcc 	%r2, %r11, %r29
	.word 0xab6a000c  ! 1: SDIVX_R	sdivx	%r8, %r12, %r21
	.word 0xba79ee44  ! 1: SDIV_I	sdiv 	%r7, 0x0e44, %r29
	.word 0xb169288a  ! 1: SDIVX_I	sdivx	%r4, 0x088a, %r24
	.word 0xb8f9c00d  ! 1: SDIVcc_R	sdivcc 	%r7, %r13, %r28
	.word 0xa279ecc8  ! 1: SDIV_I	sdiv 	%r7, 0x0cc8, %r17
	.word 0xacf1a6ed  ! 1: UDIVcc_I	udivcc 	%r6, 0x06ed, %r22
	.word 0xa279a427  ! 1: SDIV_I	sdiv 	%r6, 0x0427, %r17
	.word 0xaa68c00b  ! 1: UDIVX_R	udivx 	%r3, %r11, %r21
	.word 0xbef9e808  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0808, %r31
	.word 0xbef1aed8  ! 1: UDIVcc_I	udivcc 	%r6, 0x0ed8, %r31
	.word 0xab6a2213  ! 1: SDIVX_I	sdivx	%r8, 0x0213, %r21
	.word 0xbc690009  ! 1: UDIVX_R	udivx 	%r4, %r9, %r30
	.word 0xb568800c  ! 1: SDIVX_R	sdivx	%r2, %r12, %r26
	.word 0xa669400f  ! 1: UDIVX_R	udivx 	%r5, %r15, %r19
	.word 0xac69000f  ! 1: UDIVX_R	udivx 	%r4, %r15, %r22
	.word 0xa678afe8  ! 1: SDIV_I	sdiv 	%r2, 0x0fe8, %r19
	.word 0xa2f9800c  ! 1: SDIVcc_R	sdivcc 	%r6, %r12, %r17
	.word 0xa769a3b9  ! 1: SDIVX_I	sdivx	%r6, 0x03b9, %r19
	.word 0xa4f12d90  ! 1: UDIVcc_I	udivcc 	%r4, 0x0d90, %r18
	.word 0xb0f9e566  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0566, %r24
	.word 0xa6f2000c  ! 1: UDIVcc_R	udivcc 	%r8, %r12, %r19
	.word 0xb33a2001  ! 1: SRA_I	sra 	%r8, 0x0001, %r25
	.word 0xab3a0009  ! 1: SRA_R	sra 	%r8, %r9, %r21
	.word 0xae2962cc  ! 1: ANDN_I	andn 	%r5, 0x02cc, %r23
	.word 0xb401800d  ! 1: ADD_R	add 	%r6, %r13, %r26
	.word 0xa529d00e  ! 1: SLLX_R	sllx	%r7, %r14, %r18
	.word 0xbca8800b  ! 1: ANDNcc_R	andncc 	%r2, %r11, %r30
	.word 0xbc090009  ! 1: AND_R	and 	%r4, %r9, %r30
	.word 0xb891e2c9  ! 1: ORcc_I	orcc 	%r7, 0x02c9, %r28
	.word 0xab39900d  ! 1: SRAX_R	srax	%r6, %r13, %r21
	.word 0xa7782401  ! 1: MOVR_I	move	%r0, 0xd, %r19

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
	.word  0x535fb8e5,0x9a48f20b,0x016bbe31,0x5ab22543
	.word  0x4fce64ac,0xad7620bf,0x38853b23,0xb9d63b20
	.word  0xdfc7c559,0xf458e42b,0xafbf5a80,0x008cc307
	.word  0x8aaaa1e3,0xffa60eaf,0xae4e2664,0x53a4c1a8
	.word  0xf18db3ca,0xab7ae3c0,0xb2481406,0xde38aa44
	.word  0x00ca6eab,0xdf22f2d4,0x6064b02f,0xcd655aed
	.word  0x374e937e,0x9ecbdb0a,0x80c0c489,0x9688eef4
	.word  0x4a2e5609,0x7c8d7107,0x904ec99c,0xb3abea59
	.word  0x6b1b4b24,0xe71e90bf,0xed3ab956,0x2532c3a8
	.word  0xb1334aaa,0x86886149,0x15aefb07,0xa65eb8d9
	.word  0xb66d281f,0x494de44f,0x2b9bf5a4,0x7735f677
	.word  0xac2570cb,0x8477c353,0x1b8464dd,0xf113680a
	.word  0xc011dcad,0xaf4fa559,0xcffe434a,0x9372f24a
	.word  0x0fcb53b8,0xf913694f,0xd8782eae,0x47496e42
	.word  0xa528a7d8,0xde33b868,0x7d595641,0x8608ce15
	.word  0xf885070e,0xa6ec9b40,0x4559b0b1,0xd78be3f7
	.word  0x2f315ef4,0x252e6f60,0xb28a962c,0xaad98c5b
	.word  0xc51266fa,0xe0fb7018,0x7b59017f,0x06f9693a
	.word  0x3a541671,0x31128d29,0x1b95673c,0xb3e100af
	.word  0x3c51334e,0x961ff9f7,0x4512f12d,0x79c4b3ae
	.word  0xff49c22b,0xc629f6ea,0x679b2842,0x73e25b76
	.word  0x8ca24773,0x4155cd6c,0x017bffda,0xc03ac953
	.word  0xad24b329,0xf6516d79,0xeff9719c,0x901dd123
	.word  0xafb50727,0x2f4d2150,0x89ef6ce3,0x68e05a36
	.word  0x0aa3ae70,0xd793f741,0xf9f46da1,0x40a9d41b
	.word  0x751696eb,0x5c6609d0,0xaadca942,0x6ee614e0
	.word  0x95d95c03,0x683bf7d6,0x6291f4f2,0xd5c89f39
	.word  0xe09a1fc3,0x3fb2a95a,0x5cde1e2b,0x63ca830c
	.word  0xf80c33f7,0xf2fd0d64,0x756dece8,0x0bbbd128
	.word  0xda3d6c6b,0x85a5564a,0x5a28ca35,0x1e583344
	.word  0x50c129e1,0xe30e9c5b,0x569b928f,0x2c378393
	.word  0x89ca0990,0x659c51d7,0x647cdc2c,0x32f4d75d
	.word  0x791e9fb3,0xb00634d3,0x028dd91e,0x3ca00920
	.word  0xb0fff7ed,0x77a9ac48,0xc15266ca,0xbd721c6c
	.word  0xa26a1296,0xbf68e1d9,0xa29f7935,0xa2321270
	.word  0x87ba8abc,0x966cbe2b,0x34a12d8e,0x0742b9d0
	.word  0xadb8b48d,0x95ae5d97,0x1355cea0,0x7f6de401
	.word  0x5255d91a,0xba999b2f,0x199c930a,0x85de8d7b
	.word  0x9e1abe7a,0x435e24be,0xe4e20885,0x5cee532b
	.word  0xa41e978b,0xbd31745f,0x3f6ec82e,0xf398b473
	.word  0x9ad505f7,0x213a762d,0x8843a581,0xc35a519f
	.word  0x0e99426f,0x22fbb224,0x124ca1ae,0xbf6f0252
	.word  0xf26c97be,0xe741eb2f,0x9c978a56,0x94a637a0
	.word  0x41bc238d,0x4d0fb022,0x92eef153,0x8e0e32ff
	.word  0x6b16c933,0x9830a1a1,0xe7a9499a,0x2b3dcbbd
	.word  0xe7c14ae1,0xa20c532f,0xc8c50fc1,0x1a86be4b
	.word  0x6d46a2c5,0x3773bf6a,0xfeb1a720,0xef6fe776
	.word  0x437199e0,0xccd7ba25,0xdd99f648,0x2aa586f0
	.word  0x617cb3fa,0x16d3f283,0x1788f652,0xa494135f
	.word  0xc50bb64f,0x392fde1b,0x08b84a79,0x52b954e6
	.word  0xa582e3ea,0x8105a493,0xf7ebe895,0x08953d6e
	.word  0x87c30aa8,0x167f3c92,0xa61ab79d,0xe3f078d8
	.word  0x32d6a200,0x5502cbc5,0x3e2b9c66,0xd41fc9a4
	.word  0x02922145,0x918954b0,0xbb082836,0xcafb2e6f
	.word  0x2d0855fc,0x134bc153,0xb8519504,0xcd95f03e
	.word  0xde099435,0x0be0ed8b,0xa1fbd05a,0xa63adfb8
	.word  0x62287800,0x09f0d36b,0x5ff066df,0xd6f04cee
	.word  0xa29db7f0,0x90bb3fbd,0x1e2d9880,0xfe6d7b9b
	.word  0x9edae738,0x8b664068,0x36ce2e3a,0x8b0e7fc7
	.word  0x7a425e34,0xa70eb033,0x54730e8b,0xbd3851f4
	.word  0x6db6198f,0x381f8ede,0x5e05aeac,0xe57e987b
	.word  0xdbdffbf5,0xebd74c8d,0x3a2a34e3,0xe0e49d53
	.word  0x74aa99d1,0xed3d65c6,0xf1a20dbe,0x7eb1b209
	.word  0xee74c13f,0x8512a022,0xdc9f050c,0xa0b50213
	.word  0x137a6776,0x67c010e6,0xdd4c7b07,0x1f12ec86
	.word  0xc67f7d2f,0x0f25986a,0x6186f86a,0xaef405e8
	.word  0x50908773,0x04322092,0x0659970f,0x1f144f12
	.word  0x42ec2fe0,0xeecdb932,0x46b94971,0x802c179e
	.word  0xc3bd3a32,0xeaada6af,0x00b30713,0x6e802c11
	.word  0xaee760fa,0x2875f235,0xdc139435,0xcd9f6baf
	.word  0x26fcf01e,0xe8414156,0x4bba867c,0xd5ec8abe
	.word  0x6991492e,0xce8e2b6b,0xd0c933f3,0x9230b7b6
	.word  0x7f7203a7,0x127dc15e,0x03a53ace,0xc5539cf8
	.word  0xfe4677a3,0x88b9ecbb,0xb66f9d72,0x9907611b
	.word  0x8266574e,0x2ba2dc5c,0x78b8dfc9,0xba4e6005
	.word  0xab79ca58,0xba4d8b3a,0x81a19b09,0xb84233d6
	.word  0xd8021abf,0xbacb3f1c,0xcfbfa6c5,0x4230c439
	.word  0x0a8bbd94,0x1a8dfff0,0x8ab51f17,0x1228cbaf
	.word  0x71157a1b,0x97b9ffea,0x1ffa28bc,0x39cb69a4
	.word  0xa47201d7,0xde62bb51,0x6360dc70,0x39c4dc62
	.word  0xc28987d9,0xc7e274f6,0x20041854,0xfad7c6ca
	.word  0xf861ea5c,0x7d4087ab,0xcc23e155,0x45558fb3
	.word  0xbc149760,0x30df6cb9,0x4b1d27d0,0x3e7b1d63
	.word  0x05a611d2,0xe02452cb,0xcc94c570,0x708647de
	.word  0x17b44495,0x42f96952,0x07792fc0,0x0c6aa3fa
	.word  0x2988bd3a,0x1a283594,0x3e095f18,0xac25984a
	.word  0x9a081b26,0x03c593a7,0x849c9d1b,0x53d2bb1f
	.word  0xc680863e,0x6f53904f,0x54121843,0xb492ac86
	.word  0x266d317c,0xb43e3ac4,0xa70f31b9,0x1ea529b3
	.word  0x6445b512,0x4deccb47,0x90d25c7b,0xfa4b388b
	.word  0xce7fd851,0xd7fe6564,0x031841ca,0xfe02835f
	.word  0x2fc1841a,0xc769e201,0xa1718b06,0xbb73abac
	.word  0xa23c7020,0x713e6929,0xf98cc871,0xc538aa80
	.word  0x28e3c4f6,0x21634044,0x377bf4a0,0x2af94cc0
	.word  0xd2f705ea,0xf8a1d776,0x619d8ade,0x85a5a96a
	.word  0x054b2710,0x60e81a21,0xd99fff01,0xc7521943
	.word  0xada10296,0xb947cb6c,0xfc5feab1,0x603b09f4
	.word  0x22b742ea,0x2c09dac1,0xf6842b37,0x3c2e7592
	.word  0x09d54b6a,0x6138c6c2,0x7a35f441,0x759d928d
	.word  0xfa873c3e,0x3c88513f,0xa2bd982a,0xea1ac66a
	.word  0x62e34973,0x5ee3e87f,0x05e8f894,0x99e83ef1
	.word  0x12e91966,0x50ebf52d,0x747da9c6,0x4ea6e895
	.word  0xd8508b6f,0x69183cd9,0x2b1509de,0xec1a3287
	.word  0x658609a7,0xca5ddedf,0x91b1e40a,0x88986597
	.word  0x1143ffa9,0x0ee6ca5b,0xc60023d9,0x24c0b298
	.word  0x75e52bf6,0x6d2cceaf,0x021d901f,0x28116e3b
	.word  0x8d12c016,0xa30c8a36,0x38759de4,0x6895064c
	.word  0xb499c11f,0x63a85160,0x384d5ef2,0x62895533
	.word  0xe572c145,0x42616b3c,0x6b738f39,0x857fdec9
	.word  0x5adc7c4b,0x8a9f2140,0xc070bfb1,0x0e18b495
	.word  0x74d9be87,0xe0d30a2d,0xd47482cc,0xd6c408ed
	.word  0xca4a2ca2,0x1518e8c3,0x4ebd3211,0xe4ecaba3
	.word  0x4e2d30ec,0xd181cb19,0xddd113b4,0xd8e33d3f
	.word  0x39637cdd,0x1902f54c,0xfb8279aa,0x11b12771
	.word  0xa28473dd,0xd2dc0777,0xa5263973,0x4b926fc1
	.word  0x39d0dd63,0xebc32f0f,0x98451c1e,0x65e26035
	.word  0x2fa9e8c3,0xd2dfa8da,0x52da16ad,0x01daa219
	.word  0x854631cb,0x04de7d4c,0x04af9349,0x0bceaed9
	.word  0x521b0be9,0x4993002d,0x18f329c0,0x821eee35
	.word  0x7bb4dc6e,0x79288e7c,0x3a937bfa,0x48f9dc73
	.word  0x0ca1861c,0x37eb9a85,0xd8a98c21,0xea4821f1
	.word  0xc01f0d3a,0x20d7d4c1,0x4df5ef1c,0xed987923
	.word  0xe96786a7,0x4dd9507b,0x3161d709,0x5db69ff9
	.word  0x477517ec,0x3ba93332,0x25be0bf7,0xcaba5b85
	.word  0xd48f3743,0xecaeac60,0x40b22a2e,0xbbe06c17
	.word  0x7b253982,0x4b25b45e,0x4282264f,0x972992c9
	.word  0x00877a2e,0x7570b145,0x6ede22a2,0xf52878fc
	.word  0x5d3d27ed,0x1e47a516,0xf6fabc38,0x823091ec
	.word  0x79066475,0xa9c6496d,0xaf30e170,0x4aa421ef
	.word  0xa2ec5c25,0x7508b785,0x6687c139,0xe151d236
	.word  0x64ef8155,0x1ebd0b1b,0x440a003d,0xbeaa0b14
	.word  0xa7650840,0x91d7d1b8,0x0e561f12,0xedcf966d
	.word  0x34885b8f,0x5bfbef5e,0x28ee4ca3,0x6846272f
	.word  0x6d988661,0x9cf3eadd,0x2c58c567,0x72dbe0c8
	.word  0x4f2f3188,0x2bf9cfe1,0x0720fa95,0x45e1244b
	.word  0x3e5d33c4,0xbfd9e58f,0xf65fdc04,0xcc9446b8
	.word  0x02e8d18a,0x7976203c,0x6b795ba2,0x8b43bfeb
	.word  0x92634522,0x2c03edc2,0x037072cc,0x1be1e6d1
	.word  0x1e53eb3a,0x0afb2f83,0x33589b86,0xdabc0c76
	.word  0x631ebd9e,0xe50dd8e2,0x3f6eaaf1,0xa0cbcaaf
	.word  0xeb09aed3,0xfa5d43fd,0xbfc96422,0x2a2fce3d
	.word  0x875d4195,0x86298209,0xc52e9c9c,0x0b30d622
	.word  0xd62adddf,0xfd89a2a9,0xc4b59c08,0xf728db09
	.word  0x505aa81e,0x8d9188a0,0xbb9e57a6,0xcbb0c139
	.word  0x0c205810,0x1dabe010,0xa9139ef9,0x62948a2f
	.word  0xc0390c8c,0x8283b631,0x36f33707,0xdc20560d
	.word  0xf18de635,0xb5c3ac41,0xab7b60d6,0x2a5181fb
	.word  0x936100f1,0xb36527a0,0xa94da62c,0xb0e2e6a6
	.word  0x8db8572b,0x6daae968,0x5945844b,0x9febf25e
	.word  0xf02cae4e,0x50c383db,0xf4d6d067,0x1a856a2b
	.word  0xb2be8ec3,0x4e0e37a9,0xc9592e9c,0x561bb7e3
	.word  0xcb310d47,0x6ae8d43b,0x823b5950,0x020c2781
	.word  0x2122bc84,0xd1449d1e,0xfcb20837,0x682ffe84
	.word  0x6714731d,0xaf827fb0,0xb7a6c264,0x16cf1d35
	.word  0xf7de1da3,0x46a63704,0xcd657a97,0xde265661
	.word  0x562f233f,0xb5b3e680,0x99a00e5b,0xaf28820c
	.word  0xf0fbcb5f,0xeb94c65b,0x3c37695f,0xa70c032a
	.word  0x2d14e3ec,0x7f2f52f5,0x9ad36458,0x6f7f3b30
	.word  0x5564e93c,0x5f6beb13,0x5867449a,0xfd90333e
	.word  0x25e96f56,0x99d6ab74,0x6ac07f61,0xb92e2298
	.word  0x4c0a3a7a,0x2c8f5248,0x73a654cf,0xcec0f676
	.word  0x3d1adb2f,0x803fc9d4,0x936f10d1,0x330d0216
	.word  0x8b6dabec,0xdc394071,0xdc0d2ba4,0x4e7de2b5
	.word  0x80fd0d73,0x67403174,0x8d9ce079,0xb5d4400c
	.word  0x7934eb08,0x651999cd,0x70b7af62,0x797b7a9f
	.word  0xf0f79303,0x5d4d27ac,0xaef65b5b,0xda475b5b
	.word  0x327f3c01,0xa2879e20,0x7e343a90,0x7a9fc680
	.word  0x076f09ea,0x302289a2,0x5d4a8477,0x6f210253
	.word  0xda46ca70,0x75e4dd28,0xb2309960,0x04f3b475
	.word  0xc57dd4f4,0x6ab2e279,0x5a048dd1,0xbabb356d
	.word  0x32a77728,0xf07091e0,0xf74b96b1,0x25e735ea
	.word  0x1e2a8944,0x0f9929bd,0x7973ebb3,0xbd2fa7e6
	.word  0x50a81776,0x3e7e00be,0x1512807a,0x1dac3f2d
	.word  0x2c3a86e6,0x2d0e9ad2,0x1ac0b5ac,0x1c381dae
	.word  0x21bd5d8f,0xda18113b,0x6d09066a,0x6304636d
	.word  0xc4a64465,0x5963c514,0xc524413c,0xa3a62326
	.word  0xb3e4ff55,0x630e793c,0xed06a552,0xec973fed
	.word  0x7a82e26d,0xbfa824e4,0x09826c7b,0x5d62b907
	.word  0x1147df94,0xa3c0dd98,0xfa615ec3,0x797421e8
	.word  0x139e6b08,0x493c7d55,0x7ae5416b,0x07239671
	.word  0x44168690,0xc96e2ca0,0x581a485e,0x12f2dfc8
	.word  0x31fc47d5,0xd205bc7a,0xff3ee300,0x72e23ed4
	.word  0x3ec2bc54,0xe6a40308,0x58350019,0x48e959a5
	.word  0x9ca33ead,0x6a3432e8,0x305d264c,0x962c6b5d
	.word  0xcc4619cf,0x91ae4bde,0x9df10e6d,0x4901c4c7
	.word  0xe5b38fbb,0x74c43a30,0xf39b5a3f,0x837e13c8
	.word  0x9b76dbf0,0x72355734,0x4a5be2e9,0xd4cec5eb
	.word  0x9755922f,0x9b68434b,0xde77ae6a,0xe6861c87
	.word  0xb40e672a,0x13b6ba55,0xe73180fa,0x0a95ec11
	.word  0x330f0815,0xe9710588,0x8c908693,0x49661a29
	.word  0xec635e37,0xeacbdca2,0x76798922,0x8055df6d
	.word  0x83d61090,0xe97ac41f,0xa97f1053,0xf8728be0
	.word  0xd0516ec6,0x415605a0,0x5e3b5f67,0x67918dd3
	.word  0x852a945c,0x7669ce9c,0x17342efa,0xce215c38
	.word  0x56d1158c,0x0c219043,0x2c311ea2,0xde2361dd
	.word  0x2e510e44,0x11c1871e,0x2a36ba4d,0x1e1cec97
	.word  0xaf4f90ea,0xd059b2c7,0x22bf5393,0x5a40d120
	.word  0x4947b3cd,0x57061313,0x3782840f,0xe479dbaa
	.word  0xb59264e4,0x343adda7,0xa9934263,0x1255b32c
	.word  0xfecfb425,0x0ccfe240,0x42d07d4e,0x3c7330b7
	.word  0x0aeca2b9,0x1d193aea,0xd1dc6cc0,0x5a1a774b
	.word  0x7436c865,0x354bbc03,0xc0d7f620,0x2289d82c
	.word  0x8f830c68,0x0a5874c7,0xa7096ae6,0xc89e26f8
	.word  0x6e1fb6f5,0x9fb2d4be,0x8113a3d4,0x7f99994e
	.word  0x417333a4,0xc08fa01b,0xdcf5f7c7,0x87604933
	.word  0x01de18b3,0xe7bb3e16,0x7271b3f2,0x7c0e643f
	.word  0x2b6eb5ba,0x872ff117,0x609e6dec,0x887ff740
	.word  0x2d1c4e78,0xc8fff176,0x7fe3763b,0x1f4d3123
	.word  0xc4e79651,0xf1804542,0x6e837b42,0xf0077b4e
	.word  0x1e34d410,0xe868f400,0x978a1c41,0xca8b7469
	.word  0xf0af68c3,0x5ac0dcfb,0x4f8aa9ee,0xdef1aa29
	.word  0x506b6a03,0xcffaea34,0x35919896,0x6c50a709
	.word  0xb49c455d,0xe35ee6e5,0x6ff59539,0x76ec115f
	.word  0x9faf1c97,0x7bfa7d4a,0x55a68419,0x24b0ec43
	.word  0x1cd56a53,0x991aeae8,0xc15b0577,0x57a82e1b
	.word  0x4df8c16d,0x0df4f6a2,0x760f1508,0xc4b3f9ce
	.word  0x93c7054f,0x2f60cbe5,0x1ecf1bb0,0xb79fd7fe
	.word  0x4661a0c7,0xcbdfc43c,0xdce9589f,0x3823fa71
	.word  0x5ea64172,0xe45f2bde,0x46b8847f,0x23e189bf
	.word  0xd1964d45,0x795da2a5,0x471c6bd9,0x8141e103
	.word  0xfaed9a5a,0xdbf31f85,0xc01187f6,0x93614059
	.word  0x1ba7f936,0xbd63e613,0x0fbbdcad,0xc8423263
	.word  0xe7b15f66,0xe8c1b8b5,0x9796862d,0xca88c96d
	.word  0xfe318a1c,0x019aa4dd,0x039bffa1,0xb518b673
	.word  0xc9341c45,0x136c55b3,0x4c03bbf7,0x5db49825
	.word  0x7498c074,0xf528f8d5,0x88246e8d,0x49bcf096
	.word  0x7f2a2d02,0x7899a9e4,0x6c9354e2,0xaf35f2ba
	.word  0x2eaf9ced,0x455d0b35,0xf1e640e0,0x7250b58f
	.word  0x4447c4cb,0xcd83cd12,0x9e2fab98,0xcaa10180
	.word  0xe4eeb20e,0xba48d74b,0xa49cca5c,0x7f26d6f4
	.word  0x996b2b5b,0x07cb025d,0xd64c5983,0xe32839a3
	.word  0x60708abb,0x4e03a078,0x53226733,0x97180a48
	.word  0x97098c6d,0x635228c1,0x9bc949e3,0xff7c72a4
	.word  0xb54c5c18,0x34d85779,0x4f2f8d6e,0xfb575750
	.word  0x96e25e12,0x6de585a1,0x59dab6c4,0x0d9ea358
	.word  0x0e74c821,0xf70a0849,0x886cf67c,0x217698a4
	.word  0xd12aa324,0x4ebc3ffd,0x0fac2200,0x36b13207
	.word  0xd5ed18c2,0x0f2569a1,0xd87ab741,0xcb8c4757
	.word  0xc5c1b318,0x46528e27,0xa06a11bf,0xae7bb033
	.word  0x7e0b8a63,0xa35e2098,0xd9dbe252,0x3affbc21
	.word  0xaefe7132,0x648c88b2,0xd8a6f1e6,0xf3f2e7f9
	.word  0xc1c2b5a5,0xe79c75f2,0xde0249b1,0x28691ba2
	.word  0xc2d9715a,0x0320203f,0x23b685be,0xcd6fcfc9
	.word  0x51d93b5f,0x1f75b8cb,0x30755f28,0x18eb1157
	.word  0x853583f2,0xe83de3b8,0xacd97790,0x3a2ede85
	.word  0x9a01e819,0xcd102b06,0x70de15d0,0x8084b777
	.word  0x38531061,0xb19bd194,0xa5d8d638,0xd900f320
	.word  0x286b052b,0x5cc0e4c4,0xf49890fb,0x4552f0cd
	.word  0x456e7b0d,0x40a4eba9,0x0d16e8a5,0x91693b9b
	.word  0x59c1bbfa,0x25f5e6da,0x0625fccd,0x29e79ba5
	.word  0x4d90cfab,0xb5384bd7,0x6f9f819e,0x1ece0237
	.word  0xf8641c0f,0x126c4f3e,0x75be5e74,0x764990bd
	.word  0x9fa062cf,0x5247e539,0xbd98d938,0x475eda49
	.word  0xa5495e2a,0xc1ab98a7,0x0a1b8a4b,0x4b61775a
	.word  0xf2ac344f,0x9ffc82c0,0xa07ca2aa,0xc61724f5
	.word  0x86cfe9fe,0x750928b0,0x7dacf779,0xda8f9555



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
!!#   IJ_set_ropr_fld ("diag.j", 37, ijdefault, Ft_Rs1, "{2..8}");
!!#   IJ_set_ropr_fld ("diag.j", 38, ijdefault, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 39, ijdefault, Ft_Rd, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 40, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 41, ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 42, ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_A, "1'b0");  
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 53, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 55, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 56, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 58, Ro_load_r, Ft_Rs2, "{0}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 60, Ro_rsvd_set, Ft_Rs1, "{2..8}");
!!#   IJ_set_ropr_fld ("diag.j", 61, Ro_rsvd_set, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_rsvd_set, Ft_Rd, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 63, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");  
!!#   IJ_set_ropr_bits ("diag.j", 64, Ro_rsvd_set, 0xf70, "12'b000011100000");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 66, Ro_ba, Ft_D16, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 67, Ro_ba, Ft_Disp22, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 68, Ro_ba, Ft_Disp19, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 69, Ro_ba, Ft_Disp30, "{0x3}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 78, th_div, 0x1);
!!#   IJ_bind_thread_group("diag.j", 79, th_evnt, 0x2);
!!#   IJ_bind_thread_group("diag.j", 80, th_all,0x3);
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
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 95, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 2; i < 9; i++) {
!!#      IJ_printf ("diag.j", 100, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join ("diag.j", 111,0xf);
!!#   IJ_th_start ("diag.j", 112,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 114, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 115, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 116, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 117, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 118, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 119, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 120, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 121, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 122, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 123, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 125, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 126, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 128, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 129, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# diag: divs inst_block
!!# ;
!!# 
!!# divs: mMETA60
!!# 
!!#            {
!!#               i = 0;
!!# 	      while (i < 10) {
!!#  	         IJ_generate_from_token ("diag.j", 162,30, th_div, ijdefault,tUDIV_I, tUDIV_R, tSDIV_I, tSDIV_R, 
!!# 			                 tSDIVX_R, tSDIVX_I, tUDIVX_R, tUDIVX_I, tUDIVcc_I, tUDIVcc_R, 
!!#                                          tSDIVcc_I, tSDIVcc_R, -1);;
!!#  	         IJ_generate_from_token ("diag.j", 163,10, th_div, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!# 	   | br_div
!!# 
!!#            | resum_intr 
!!# 
!!# ;
!!# 
!!# br_div: d18 dlyslt_inst alu icerr div icerr alu
!!# 
!!# ;
!!# 
!!# dlyslt_inst: d1000 ld_irferr_unalgn
!!# 	   | d2000 trpm_alu
!!#            | d3000 st_irferr_unalgn
!!# 	   | d4000 ld_dc_err
!!# 
!!# ;
!!# 
!!# d18: mMETA1
!!# {
!!#    IJ_printf ("diag.j", 235, th_evnt, ".align 0x8\n");
!!#    IJ_generate_from_token ("diag.j", 236,1, th_evnt,Ro_ba,tBA, -1);;
!!# }
!!# ;
!!# 
!!# alu_irf_err: irferr alu trpm_alu alu div_ic_err 
!!# ;
!!# 
!!# div_ic_err: icerr div
!!#            | d1 div
!!#            | d2 div icerr alu
!!# //	   | d17 div lop
!!# ;
!!# 
!!# ldst_irf_err:   st_irferr_unalgn trpm_alu alu div_ic_err 
!!#                 | ld_irferr_unalgn div_ic_err
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
!!# ld_dc_err: dcerr load_r trpm_alu div_ic_err
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
!!# div: d11 div_tokens
!!# {
!!#    IJ_generate ("diag.j", 345, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# div_tokens: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
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

