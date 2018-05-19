// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3738.s
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
   random seed:	523498535
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
	setx  0xed6a38515d0445b5, %r16, %r16
	setx  0x394c8d6a0a817bf8, %r16, %r17
	setx  0x5b28edd60340a648, %r16, %r18
	setx  0x384b0b9693fa66b6, %r16, %r19
	setx  0x2e8d72e7b6b44eec, %r16, %r20
	setx  0x7d48263f0d7278ed, %r16, %r21
	setx  0x5f609f243e83c049, %r16, %r22
	setx  0xcba0dc1fbf6b8c3d, %r16, %r23
	setx  0xedb94369aed1d94f, %r16, %r24
	setx  0x7d8dfe187241d0c6, %r16, %r25
	setx  0xc508565097ad0627, %r16, %r26
	setx  0xe4dda2bc1541be67, %r16, %r27
	setx  0xaba5c468a9d9eca7, %r16, %r28
	setx  0xfe70ad08fc02252c, %r16, %r29
	setx  0x09eded15af91a0bb, %r16, %r30
	setx  0x019f7ddd85856c3c, %r16, %r31
	setx  0x0000000000000210, %r16, %r9
	setx  0x0000000000000660, %r16, %r10
	setx  0x0000000000000410, %r16, %r11
	setx  0x0000000000000530, %r16, %r12
	setx  0x00000000000005b0, %r16, %r13
	setx  0x0000000000000ee0, %r16, %r14
	setx  0x0000000000000c70, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
thr3_dc_err_0:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_0), 16, 16),1,DC_DATA,36)
	.word 0xe4520000  ! 3: LDSH_R	ldsh	[%r8 + %r0], %r18
	.word 0xaa32000a  ! 6: SUBC_R	orn 	%r8, %r10, %r21
thr3_ic_err_0:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,5,33)
	.word 0xb2f2000f  ! 9: UDIVcc_R	udivcc 	%r8, %r15, %r25
	.word 0xbf39900c  ! 11: SRAX_R	srax	%r6, %r12, %r31
	.word 0xad28a001  ! 11: SLL_I	sll 	%r2, 0x0001, %r22
	.word 0xb018ed49  ! 11: XOR_I	xor 	%r3, 0x0d49, %r24
	.word 0xa6812dc9  ! 11: ADDcc_I	addcc 	%r4, 0x0dc9, %r19
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
thr3_irf_ce_0:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_0), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfa19c00c  ! 15: LDD_R	ldd	[%r7 + %r12], %r29
	.word 0xb6b16c6f  ! 18: ORNcc_I	orncc 	%r5, 0x0c6f, %r27
	.word 0xb438a080  ! 20: XNOR_I	xnor 	%r2, 0x0080, %r26
thr3_ic_err_1:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_1), 16, 16),1,IC_DATA,IR,31,x)
	.word 0xae79a546  ! 23: SDIV_I	sdiv 	%r6, 0x0546, %r23
	.word 0xb442000c  ! 25: ADDC_R	addc 	%r8, %r12, %r26
	.word 0xa880800a  ! 25: ADDcc_R	addcc 	%r2, %r10, %r20
	.word 0xb4c2234b  ! 25: ADDCcc_I	addccc 	%r8, 0x034b, %r26
	.word 0xb289e46b  ! 25: ANDcc_I	andcc 	%r7, 0x046b, %r25
thr3_irf_ce_1:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_1), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xf449a6ab  ! 28: LDSB_I	ldsb	[%r6 + 0x06ab], %r26
	.word 0xb098aaf3  ! 31: XORcc_I	xorcc 	%r2, 0x0af3, %r24
	.word 0xbf30a001  ! 33: SRL_I	srl 	%r2, 0x0001, %r31
	.word 0xbd6a273f  ! 36: SDIVX_I	sdivx	%r8, 0x073f, %r30
thr3_ic_err_2:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_2), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xbc29adf1  ! 39: ANDN_I	andn 	%r6, 0x0df1, %r30
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
thr3_irf_ce_2:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_2), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xe4292339  ! 43: STB_I	stb	%r18, [%r4 + 0x0339]
	.word 0xac22000c  ! 46: SUB_R	sub 	%r8, %r12, %r22
	.word 0xba2960c0  ! 48: ANDN_I	andn 	%r5, 0x00c0, %r29
thr3_ic_err_3:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_3), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xba79800b  ! 51: SDIV_R	sdiv 	%r6, %r11, %r29
thr3_dc_err_1:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_1), 16, 16),1,DC_DATA,50)
	.word 0xe44a0000  ! 54: LDSB_R	ldsb	[%r8 + %r0], %r18
	.word 0xab39c00b  ! 57: SRA_R	sra 	%r7, %r11, %r21
thr3_ic_err_4:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_4), 16, 16),1,IC_DATA,IR_NIR,5,6)
	.word 0xbaf10009  ! 60: UDIVcc_R	udivcc 	%r4, %r9, %r29
thr3_irf_ce_3:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_3), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf248a9bd  ! 64: LDSB_I	ldsb	[%r2 + 0x09bd], %r25
	.word 0xb201c00a  ! 67: ADD_R	add 	%r7, %r10, %r25
	.word 0xa0b92477  ! 69: XNORcc_I	xnorcc 	%r4, 0x0477, %r16
thr3_ic_err_5:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,27,1)
	.word 0xacf1000e  ! 72: UDIVcc_R	udivcc 	%r4, %r14, %r22
thr3_dc_err_2:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_2), 16, 16),1,DC_DATA,26)
	.word 0xe649c000  ! 75: LDSB_R	ldsb	[%r7 + %r0], %r19
	.word 0xb531b061  ! 78: SRLX_I	srlx	%r6, 0x0021, %r26
	.word 0xacf9e623  ! 81: SDIVcc_I	sdivcc 	%r7, 0x0623, %r22
thr3_ic_err_6:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_6), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xa33a100d  ! 84: SRAX_R	srax	%r8, %r13, %r17
	.word 0xb8a9400c  ! 86: ANDNcc_R	andncc 	%r5, %r12, %r28
	.word 0xa0222ccb  ! 86: SUB_I	sub 	%r8, 0x0ccb, %r16
	.word 0xb8316e83  ! 86: ORN_I	orn 	%r5, 0x0e83, %r28
	.word 0xbf30c00e  ! 86: SRL_R	srl 	%r3, %r14, %r31
	.word 0xaf29800d  ! 86: SLL_R	sll 	%r6, %r13, %r23
	.word 0xbe294009  ! 86: ANDN_R	andn 	%r5, %r9, %r31
thr3_irf_ce_4:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_4), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xf40a000d  ! 88: LDUB_R	ldub	[%r8 + %r13], %r26
	.word 0xb689e667  ! 91: ANDcc_I	andcc 	%r7, 0x0667, %r27
	.word 0xb601400f  ! 93: ADD_R	add 	%r5, %r15, %r27
	.word 0xb8f9c00d  ! 96: SDIVcc_R	sdivcc 	%r7, %r13, %r28
thr3_ic_err_7:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_7), 16, 16),1,IC_DATA,IR_NIR,26,13)
	.word 0xbf28f001  ! 99: SLLX_I	sllx	%r3, 0x0001, %r31
thr3_irf_ce_5:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_5), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xe4196c38  ! 102: LDD_I	ldd	[%r5 + 0x0c38], %r18
	.word 0xa4b965c8  ! 105: XNORcc_I	xnorcc 	%r5, 0x05c8, %r18
	.word 0xbaa1000f  ! 107: SUBcc_R	subcc 	%r4, %r15, %r29
thr3_ic_err_8:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_8), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xaa68c00f  ! 110: UDIVX_R	udivx 	%r3, %r15, %r21
thr3_dc_err_3:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_3), 16, 16),1,DC_DATA,9)
	.word 0xfc190000  ! 113: LDD_R	ldd	[%r4 + %r0], %r30
	.word 0xbd293001  ! 116: SLLX_I	sllx	%r4, 0x0001, %r30
thr3_ic_err_9:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_9), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xbc79000b  ! 119: SDIV_R	sdiv 	%r4, %r11, %r30
thr3_irf_ce_6:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_6), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xae1121b7  ! 122: OR_I	or 	%r4, 0x01b7, %r23
	.word 0xb8b9800b  ! 125: XNORcc_R	xnorcc 	%r6, %r11, %r28
	.word 0xa9313001  ! 127: SRLX_I	srlx	%r4, 0x0001, %r20
	.word 0xb671400e  ! 130: UDIV_R	udiv 	%r5, %r14, %r27
thr3_ic_err_10:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_10), 16, 16),1,IC_DATA,IR_NIR,23,7)
	.word 0xbea9aaa6  ! 133: ANDNcc_I	andncc 	%r6, 0x0aa6, %r31
thr3_irf_ce_7:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_7), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xe209e113  ! 137: LDUB_I	ldub	[%r7 + 0x0113], %r17
	.word 0xb2a8acfd  ! 140: ANDNcc_I	andncc 	%r2, 0x0cfd, %r25
	.word 0xb7398009  ! 142: SRA_R	sra 	%r6, %r9, %r27
	.word 0xa2f9a0ba  ! 145: SDIVcc_I	sdivcc 	%r6, 0x00ba, %r17
thr3_ic_err_11:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_11), 16, 16),1,IC_DATA,IR_NIR,19,24)
	.word 0xa0a9c00e  ! 148: ANDNcc_R	andncc 	%r7, %r14, %r16
thr3_irf_ce_8:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_8), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xf029a956  ! 151: STB_I	stb	%r24, [%r6 + 0x0956]
	.word 0xb2112df0  ! 154: OR_I	or 	%r4, 0x0df0, %r25
	.word 0xb08a000d  ! 156: ANDcc_R	andcc 	%r8, %r13, %r24
	.word 0xad69a482  ! 159: SDIVX_I	sdivx	%r6, 0x0482, %r22
thr3_ic_err_12:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_12), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xae29ad3b  ! 162: ANDN_I	andn 	%r6, 0x0d3b, %r23
	.word 0xb739500d  ! 164: SRAX_R	srax	%r5, %r13, %r27
	.word 0xb139400b  ! 164: SRA_R	sra 	%r5, %r11, %r24
	.word 0xa688800f  ! 164: ANDcc_R	andcc 	%r2, %r15, %r19
	.word 0xb7782401  ! 164: MOVR_I	move	%r0, 0xfffffff0, %r27
	.word 0xb329e001  ! 164: SLL_I	sll 	%r7, 0x0001, %r25
	.word 0xb818c00c  ! 164: XOR_R	xor 	%r3, %r12, %r28
thr3_irf_ce_9:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_9), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xea28e0c2  ! 166: STB_I	stb	%r21, [%r3 + 0x00c2]
	.word 0xaa88800b  ! 169: ANDcc_R	andcc 	%r2, %r11, %r21
	.word 0xab28900d  ! 171: SLLX_R	sllx	%r2, %r13, %r21
thr3_ic_err_13:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_13), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xb879800b  ! 174: SDIV_R	sdiv 	%r6, %r11, %r28
	.word 0xa431000c  ! 176: ORN_R	orn 	%r4, %r12, %r18
	.word 0xb0b9c00e  ! 176: XNORcc_R	xnorcc 	%r7, %r14, %r24
	.word 0xbf30e001  ! 176: SRL_I	srl 	%r3, 0x0001, %r31
	.word 0xae40e328  ! 176: ADDC_I	addc 	%r3, 0x0328, %r23
	.word 0xbcc0800a  ! 176: ADDCcc_R	addccc 	%r2, %r10, %r30
	.word 0xbaa9ac3b  ! 176: ANDNcc_I	andncc 	%r6, 0x0c3b, %r29
	.word 0xa9316001  ! 176: SRL_I	srl 	%r5, 0x0001, %r20
thr3_dc_err_4:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_4), 16, 16),1,DC_DATA,51)
	.word 0xfe190000  ! 178: LDD_R	ldd	[%r4 + %r0], %r31
	.word 0xb8a0ac68  ! 181: SUBcc_I	subcc 	%r2, 0x0c68, %r28
	.word 0xa669c00f  ! 184: UDIVX_R	udivx 	%r7, %r15, %r19
thr3_ic_err_14:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,12,23)
	.word 0xae21400c  ! 187: SUB_R	sub 	%r5, %r12, %r23
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
thr3_dc_err_5:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_5), 16, 16),1,DC_DATA,32)
	.word 0xfc098000  ! 194: LDUB_R	ldub	[%r6 + %r0], %r30
	.word 0xb6a0c00e  ! 197: SUBcc_R	subcc 	%r3, %r14, %r27
	.word 0xbaf8c00f  ! 200: SDIVcc_R	sdivcc 	%r3, %r15, %r29
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xe829e17f  ! 206: STB_I	stb	%r20, [%r7 + 0x017f]
	.word 0xb0a92547  ! 209: ANDNcc_I	andncc 	%r4, 0x0547, %r24
	.word 0xa4b94009  ! 211: XNORcc_R	xnorcc 	%r5, %r9, %r18
thr3_ic_err_15:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_15), 16, 16),1,IC_DATA,IR_NIR,27,4)
	.word 0xb679c00e  ! 214: SDIV_R	sdiv 	%r7, %r14, %r27
thr3_dc_err_6:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_6), 16, 16),1,DC_DATA,6)
	.word 0xf058c000  ! 217: LDX_R	ldx	[%r3 + %r0], %r24
	.word 0xb841227a  ! 220: ADDC_I	addc 	%r4, 0x027a, %r28
	.word 0xae708009  ! 223: UDIV_R	udiv 	%r2, %r9, %r23
thr3_ic_err_16:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_16), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xaa01aea8  ! 226: ADD_I	add 	%r6, 0x0ea8, %r21
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
thr3_irf_ce_10:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_10), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xa2192447  ! 230: XOR_I	xor 	%r4, 0x0447, %r17
	.word 0xa6396eb0  ! 233: XNOR_I	xnor 	%r5, 0x0eb0, %r19
	.word 0xa61a0009  ! 235: XOR_R	xor 	%r8, %r9, %r19
thr3_ic_err_17:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_17), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xa0690009  ! 238: UDIVX_R	udivx 	%r4, %r9, %r16
thr3_irf_ce_11:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_11), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xe0592e65  ! 242: LDX_I	ldx	[%r4 + 0x0e65], %r16
	.word 0xbc31edfd  ! 245: ORN_I	orn 	%r7, 0x0dfd, %r30
	.word 0xa9782401  ! 247: MOVR_I	move	%r0, 0x7fffbdd0, %r20
	.word 0xa6f9c009  ! 250: SDIVcc_R	sdivcc 	%r7, %r9, %r19
thr3_irf_ce_12:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_12), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xaca1e062  ! 253: SUBcc_I	subcc 	%r7, 0x0062, %r22
	.word 0xa331f001  ! 256: SRLX_I	srlx	%r7, 0x0001, %r17
	.word 0xbd39800c  ! 258: SRA_R	sra 	%r6, %r12, %r30
	.word 0xb46a2071  ! 261: UDIVX_I	udivx 	%r8, 0x0071, %r26
	.word 0xa239c009  ! 263: XNOR_R	xnor 	%r7, %r9, %r17
	.word 0xa6096566  ! 263: AND_I	and 	%r5, 0x0566, %r19
	.word 0xbe21ef19  ! 263: SUB_I	sub 	%r7, 0x0f19, %r31
	.word 0xb331400c  ! 264: SRL_R	srl 	%r5, %r12, %r25
	.word 0xb880c00f  ! 264: ADDcc_R	addcc 	%r3, %r15, %r28
	.word 0xb419400b  ! 264: XOR_R	xor 	%r5, %r11, %r26
	.word 0xb018ea63  ! 264: XOR_I	xor 	%r3, 0x0a63, %r24
	.word 0xb4b2276d  ! 264: ORNcc_I	orncc 	%r8, 0x076d, %r26
	.word 0xa622000a  ! 264: SUB_R	sub 	%r8, %r10, %r19
	.word 0xaf31900f  ! 264: SRLX_R	srlx	%r6, %r15, %r23
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
thr3_irf_ce_13:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_13), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf211c00b  ! 268: LDUH_R	lduh	[%r7 + %r11], %r25
	.word 0xa5782461  ! 271: MOVR_I	move	%r0, 0x7fffbdd0, %r18
	.word 0xb631e4cb  ! 273: ORN_I	orn 	%r7, 0x04cb, %r27
thr3_ic_err_18:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_18), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xa169e11f  ! 276: SDIVX_I	sdivx	%r7, 0x011f, %r16
	.word 0xa5782401  ! 278: MOVR_I	move	%r0, 0xfffffff0, %r18
	.word 0xbec0c00f  ! 278: ADDCcc_R	addccc 	%r3, %r15, %r31
	.word 0xaab9400a  ! 278: XNORcc_R	xnorcc 	%r5, %r10, %r21
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
thr3_irf_ce_14:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_14), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xf071ed20  ! 281: STX_I	stx	%r24, [%r7 + 0x0d20]
	.word 0xba08e67e  ! 284: AND_I	and 	%r3, 0x067e, %r29
	.word 0xab64180f  ! 286: MOVcc_R	<illegal instruction>
thr3_ic_err_19:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_19), 16, 16),1,IC_DATA,NIR,x,5)
	.word 0xa968800b  ! 289: SDIVX_R	sdivx	%r2, %r11, %r20
thr3_irf_ce_15:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_15), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xec18ac88  ! 292: LDD_I	ldd	[%r2 + 0x0c88], %r22
	.word 0xbc01c00a  ! 295: ADD_R	add 	%r7, %r10, %r30
	.word 0xb698e7f3  ! 297: XORcc_I	xorcc 	%r3, 0x07f3, %r27
	.word 0xaa78c00a  ! 300: SDIV_R	sdiv 	%r3, %r10, %r21
thr3_ic_err_20:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,16,30)
	.word 0xa611ef29  ! 303: OR_I	or 	%r7, 0x0f29, %r19
thr3_irf_ce_16:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_16), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xba21a004  ! 306: SUB_I	sub 	%r6, 0x0004, %r29
	.word 0xb164186e  ! 309: MOVcc_R	<illegal instruction>
	.word 0xa6c166b8  ! 311: ADDCcc_I	addccc 	%r5, 0x06b8, %r19
	.word 0xa269800f  ! 314: UDIVX_R	udivx 	%r6, %r15, %r17
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xe0598009  ! 318: LDX_R	ldx	[%r6 + %r9], %r16
	.word 0xaa00efe7  ! 321: ADD_I	add 	%r3, 0x0fe7, %r21
	.word 0xb291af64  ! 323: ORcc_I	orcc 	%r6, 0x0f64, %r25
	.word 0xab69afe7  ! 326: SDIVX_I	sdivx	%r6, 0x0fe7, %r21
thr3_ic_err_21:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_21), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xaf78040d  ! 329: MOVR_R	move	%r0, %r13, %r23
thr3_irf_ce_17:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_17), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xe070ab93  ! 333: STX_I	stx	%r16, [%r2 + 0x0b93]
	.word 0xa091a8f3  ! 336: ORcc_I	orcc 	%r6, 0x08f3, %r16
	.word 0xa0c0e105  ! 338: ADDCcc_I	addccc 	%r3, 0x0105, %r16
	.word 0xac7a2471  ! 341: SDIV_I	sdiv 	%r8, 0x0471, %r22
	.word 0xb0b0800b  ! 343: ORNcc_R	orncc 	%r2, %r11, %r24
	.word 0xb938f001  ! 343: SRAX_I	srax	%r3, 0x0001, %r28
	.word 0xa530900c  ! 343: SRLX_R	srlx	%r2, %r12, %r18
	.word 0xa89a2a74  ! 343: XORcc_I	xorcc 	%r8, 0x0a74, %r20
	.word 0xa5782401  ! 343: MOVR_I	move	%r0, 0xfffffff0, %r18
	.word 0xb6a0c00f  ! 343: SUBcc_R	subcc 	%r3, %r15, %r27
	.word 0xa731900d  ! 343: SRLX_R	srlx	%r6, %r13, %r19
thr3_irf_ce_18:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_18), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xee50e364  ! 345: LDSH_I	ldsh	[%r3 + 0x0364], %r23
	.word 0xa42a006c  ! 348: ANDN_R	andn 	%r8, %r12, %r18
	.word 0xb039c00a  ! 350: XNOR_R	xnor 	%r7, %r10, %r24
thr3_ic_err_22:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_22), 16, 16),1,IC_DATA,NIR,x,20)
	.word 0xac7a000a  ! 353: SDIV_R	sdiv 	%r8, %r10, %r22
	.word 0xe0312848  ! 356: STH_I	sth	%r16, [%r4 + 0x0848]
	.word 0xb691000c  ! 359: ORcc_R	orcc 	%r4, %r12, %r27
	.word 0xbe188009  ! 361: XOR_R	xor 	%r2, %r9, %r31
	.word 0xb869000c  ! 364: UDIVX_R	udivx 	%r4, %r12, %r28
thr3_ic_err_23:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_23), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xad30b001  ! 367: SRLX_I	srlx	%r2, 0x0001, %r22
thr3_irf_ce_19:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_19), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xa401400d  ! 370: ADD_R	add 	%r5, %r13, %r18
	.word 0xb800e084  ! 373: ADD_I	add 	%r3, 0x0084, %r28
	.word 0xa219400b  ! 375: XOR_R	xor 	%r5, %r11, %r17
	.word 0xba71800f  ! 378: UDIV_R	udiv 	%r6, %r15, %r29
thr3_ic_err_24:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_24), 16, 16),1,IC_DATA,IR_NIR,19,8)
	.word 0xaa1a000b  ! 381: XOR_R	xor 	%r8, %r11, %r21
	.word 0xee716188  ! 384: STX_I	stx	%r23, [%r5 + 0x0188]
	.word 0xa539d00a  ! 387: SRAX_R	srax	%r7, %r10, %r18
	.word 0xa328d00d  ! 389: SLLX_R	sllx	%r3, %r13, %r17
	.word 0xb07a2756  ! 392: SDIV_I	sdiv 	%r8, 0x0756, %r24
	.word 0xbe00edaa  ! 394: ADD_I	add 	%r3, 0x0daa, %r31
	.word 0xb82a2137  ! 394: ANDN_I	andn 	%r8, 0x0137, %r28
	.word 0xa9323001  ! 394: SRLX_I	srlx	%r8, 0x0001, %r20
	.word 0xa330800f  ! 394: SRL_R	srl 	%r2, %r15, %r17
	.word 0xae01a777  ! 395: ADD_I	add 	%r6, 0x0777, %r23
	.word 0xaaa9edcc  ! 395: ANDNcc_I	andncc 	%r7, 0x0dcc, %r21
	.word 0xad31000c  ! 395: SRL_R	srl 	%r4, %r12, %r22
	.word 0xb6c14009  ! 395: ADDCcc_R	addccc 	%r5, %r9, %r27
	.word 0xa0b0c00b  ! 395: ORNcc_R	orncc 	%r3, %r11, %r16
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
thr3_dc_err_7:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_7), 16, 16),1,DC_DATA,31)
	.word 0xfc0a0000  ! 398: LDUB_R	ldub	[%r8 + %r0], %r30
	.word 0xba20a39a  ! 401: SUB_I	sub 	%r2, 0x039a, %r29
thr3_ic_err_25:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,16,22)
	.word 0xbe79800c  ! 404: SDIV_R	sdiv 	%r6, %r12, %r31
thr3_irf_ce_20:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_20), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xfa3163fb  ! 408: STH_I	sth	%r29, [%r5 + 0x03fb]
	.word 0xa220a095  ! 411: SUB_I	sub 	%r2, 0x0095, %r17
	.word 0xbc09000f  ! 413: AND_R	and 	%r4, %r15, %r30
	.word 0xb671c00b  ! 416: UDIV_R	udiv 	%r7, %r11, %r27
	.word 0xec50e14a  ! 419: LDSH_I	ldsh	[%r3 + 0x014a], %r22
	.word 0xa529506b  ! 422: SLLX_R	sllx	%r5, %r11, %r18
	.word 0xb091c009  ! 424: ORcc_R	orcc 	%r7, %r9, %r24
	.word 0xa8716d2a  ! 427: UDIV_I	udiv 	%r5, 0x0d2a, %r20
thr3_ic_err_26:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_26), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xb031683a  ! 430: ORN_I	orn 	%r5, 0x083a, %r24
thr3_irf_ce_21:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_21), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xbe38a16f  ! 433: XNOR_I	xnor 	%r2, 0x016f, %r31
	.word 0xac99c06c  ! 436: XORcc_R	xorcc 	%r7, %r12, %r22
	.word 0xbd31d00e  ! 438: SRLX_R	srlx	%r7, %r14, %r30
thr3_ic_err_27:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_27), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xae72000f  ! 441: UDIV_R	udiv 	%r8, %r15, %r23
thr3_dc_err_8:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_8), 16, 16),1,DC_DATA,59)
	.word 0xf000c000  ! 444: LDUW_R	lduw	[%r3 + %r0], %r24
	.word 0xa329506e  ! 447: SLLX_R	sllx	%r5, %r14, %r17
	.word 0xb0f1a154  ! 450: UDIVcc_I	udivcc 	%r6, 0x0154, %r24
thr3_ic_err_28:
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_28), 16, 16),1,IC_DATA,NIR,x,4)
	.word 0xaa81c00b  ! 453: ADDcc_R	addcc 	%r7, %r11, %r21
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
thr3_irf_ce_22:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_22), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf621a748  ! 460: STW_I	stw	%r27, [%r6 + 0x0748]
	.word 0xb2a1800f  ! 463: SUBcc_R	subcc 	%r6, %r15, %r25
	.word 0xb881eda5  ! 465: ADDcc_I	addcc 	%r7, 0x0da5, %r28
	.word 0xb6f9afd4  ! 468: SDIVcc_I	sdivcc 	%r6, 0x0fd4, %r27
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
thr3_irf_ce_23:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_23), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf021ac5d  ! 473: STW_I	stw	%r24, [%r6 + 0x0c5d]
	.word 0xbe00e5f1  ! 476: ADD_I	add 	%r3, 0x05f1, %r31
	.word 0xa8a2000d  ! 478: SUBcc_R	subcc 	%r8, %r13, %r20
	.word 0xaaf8eea9  ! 481: SDIVcc_I	sdivcc 	%r3, 0x0ea9, %r21
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
thr3_dc_err_9:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_9), 16, 16),1,DC_DATA,4)
	.word 0xe2014000  ! 485: LDUW_R	lduw	[%r5 + %r0], %r17
	.word 0xb6816edc  ! 488: ADDcc_I	addcc 	%r5, 0x0edc, %r27
	.word 0xb67963fe  ! 491: SDIV_I	sdiv 	%r5, 0x03fe, %r27
thr3_irf_ce_24:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_24), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xbf38900d  ! 494: SRAX_R	srax	%r2, %r13, %r31
	.word 0xa731a001  ! 497: SRL_I	srl 	%r6, 0x0001, %r19
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx  0x11ecc5fbc4b88bba, %r16, %r16
	setx  0x7ade62a8b27ce9d7, %r16, %r17
	setx  0x1370c3e4e42748d8, %r16, %r18
	setx  0x05701470c823c464, %r16, %r19
	setx  0xe1551ae93d3be9f0, %r16, %r20
	setx  0xb0d4feccbca8ef01, %r16, %r21
	setx  0x9642e633b5e4e9e0, %r16, %r22
	setx  0x4d9337da105a97df, %r16, %r23
	setx  0x06f4fbab83587d8d, %r16, %r24
	setx  0x20b535a6dbcb9ae9, %r16, %r25
	setx  0x36f8a3f55e8eb5db, %r16, %r26
	setx  0xc33fb747c8b52650, %r16, %r27
	setx  0x2070b3e9d446fa35, %r16, %r28
	setx  0x24e2d392e1b17ece, %r16, %r29
	setx  0x28cfed5375b9a605, %r16, %r30
	setx  0x5e9dc114b5c704f1, %r16, %r31
	setx  0x0000000000000430, %r16, %r9
	setx  0x00000000000000f0, %r16, %r10
	setx  0x0000000000000820, %r16, %r11
	setx  0x0000000000000020, %r16, %r12
	setx  0x0000000000000700, %r16, %r13
	setx  0x0000000000000380, %r16, %r14
	setx  0x0000000000000200, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xbe79000d  ! 1: SDIV_R	sdiv 	%r4, %r13, %r31
	.word 0xb079e2fd  ! 1: SDIV_I	sdiv 	%r7, 0x02fd, %r24
	.word 0xae79400f  ! 1: SDIV_R	sdiv 	%r5, %r15, %r23
	.word 0xb279235b  ! 1: SDIV_I	sdiv 	%r4, 0x035b, %r25
	.word 0xb2f9e3a5  ! 1: SDIVcc_I	sdivcc 	%r7, 0x03a5, %r25
	.word 0xa8f12acf  ! 1: UDIVcc_I	udivcc 	%r4, 0x0acf, %r20
	.word 0xa8f1accc  ! 1: UDIVcc_I	udivcc 	%r6, 0x0ccc, %r20
	.word 0xbe79000b  ! 1: SDIV_R	sdiv 	%r4, %r11, %r31
	.word 0xb66a284a  ! 1: UDIVX_I	udivx 	%r8, 0x084a, %r27
	.word 0xaef0e905  ! 1: UDIVcc_I	udivcc 	%r3, 0x0905, %r23
	.word 0xbe78800a  ! 1: SDIV_R	sdiv 	%r2, %r10, %r31
	.word 0xbef98009  ! 1: SDIVcc_R	sdivcc 	%r6, %r9, %r31
	.word 0xaaf0c009  ! 1: UDIVcc_R	udivcc 	%r3, %r9, %r21
	.word 0xa168aa01  ! 1: SDIVX_I	sdivx	%r2, 0x0a01, %r16
	.word 0xac70c00a  ! 1: UDIV_R	udiv 	%r3, %r10, %r22
	.word 0xb4716b31  ! 1: UDIV_I	udiv 	%r5, 0x0b31, %r26
	.word 0xaa71000a  ! 1: UDIV_R	udiv 	%r4, %r10, %r21
	.word 0xa8f8c00b  ! 1: SDIVcc_R	sdivcc 	%r3, %r11, %r20
	.word 0xbf68c009  ! 1: SDIVX_R	sdivx	%r3, %r9, %r31
	.word 0xa76a000b  ! 1: SDIVX_R	sdivx	%r8, %r11, %r19
	.word 0xb4f1400e  ! 1: UDIVcc_R	udivcc 	%r5, %r14, %r26
	.word 0xab68a7a6  ! 1: SDIVX_I	sdivx	%r2, 0x07a6, %r21
	.word 0xb6f0c00c  ! 1: UDIVcc_R	udivcc 	%r3, %r12, %r27
	.word 0xacf1400d  ! 1: UDIVcc_R	udivcc 	%r5, %r13, %r22
	.word 0xac70800e  ! 1: UDIV_R	udiv 	%r2, %r14, %r22
	.word 0xb0f1400a  ! 1: UDIVcc_R	udivcc 	%r5, %r10, %r24
	.word 0xa0f1e449  ! 1: UDIVcc_I	udivcc 	%r7, 0x0449, %r16
	.word 0xb670ace8  ! 1: UDIV_I	udiv 	%r2, 0x0ce8, %r27
	.word 0xb969c009  ! 1: SDIVX_R	sdivx	%r7, %r9, %r28
	.word 0xb270acdf  ! 1: UDIV_I	udiv 	%r2, 0x0cdf, %r25
	.word 0xac72000e  ! 1: UDIV_R	udiv 	%r8, %r14, %r22
	.word 0xaaf1000d  ! 1: UDIVcc_R	udivcc 	%r4, %r13, %r21
	.word 0xac70a599  ! 1: UDIV_I	udiv 	%r2, 0x0599, %r22
	.word 0xa769ab20  ! 1: SDIVX_I	sdivx	%r6, 0x0b20, %r19
	.word 0xbc720009  ! 1: UDIV_R	udiv 	%r8, %r9, %r30
	.word 0xa8f9ebb0  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0bb0, %r20
	.word 0xa4f9400d  ! 1: SDIVcc_R	sdivcc 	%r5, %r13, %r18
	.word 0xb671400a  ! 1: UDIV_R	udiv 	%r5, %r10, %r27
	.word 0xae79400c  ! 1: SDIV_R	sdiv 	%r5, %r12, %r23
	.word 0xa0f0800b  ! 1: UDIVcc_R	udivcc 	%r2, %r11, %r16
	.word 0xb870c009  ! 1: UDIV_R	udiv 	%r3, %r9, %r28
	.word 0xbaf96754  ! 1: SDIVcc_I	sdivcc 	%r5, 0x0754, %r29
	.word 0xbef0c00e  ! 1: UDIVcc_R	udivcc 	%r3, %r14, %r31
	.word 0xa2f9edfd  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0dfd, %r17
	.word 0xbef9628e  ! 1: SDIVcc_I	sdivcc 	%r5, 0x028e, %r31
	.word 0xb56a2b74  ! 1: SDIVX_I	sdivx	%r8, 0x0b74, %r26
	.word 0xac716e10  ! 1: UDIV_I	udiv 	%r5, 0x0e10, %r22
	.word 0xaaf0c00a  ! 1: UDIVcc_R	udivcc 	%r3, %r10, %r21
	.word 0xa2f1400e  ! 1: UDIVcc_R	udivcc 	%r5, %r14, %r17
	.word 0xb07a22c6  ! 1: SDIV_I	sdiv 	%r8, 0x02c6, %r24
	.word 0xa279c00d  ! 1: SDIV_R	sdiv 	%r7, %r13, %r17
	.word 0xbe69800b  ! 1: UDIVX_R	udivx 	%r6, %r11, %r31
	.word 0xaa78aa91  ! 1: SDIV_I	sdiv 	%r2, 0x0a91, %r21
	.word 0xbd69c00d  ! 1: SDIVX_R	sdivx	%r7, %r13, %r30
	.word 0xaef0c00a  ! 1: UDIVcc_R	udivcc 	%r3, %r10, %r23
	.word 0xb4f8800b  ! 1: SDIVcc_R	sdivcc 	%r2, %r11, %r26
	.word 0xb969224e  ! 1: SDIVX_I	sdivx	%r4, 0x024e, %r28
	.word 0xbd68800e  ! 1: SDIVX_R	sdivx	%r2, %r14, %r30
	.word 0xa670c00a  ! 1: UDIV_R	udiv 	%r3, %r10, %r19
	.word 0xa26a2a38  ! 1: UDIVX_I	udivx 	%r8, 0x0a38, %r17
	.word 0xb6f0c00e  ! 1: UDIVcc_R	udivcc 	%r3, %r14, %r27
	.word 0xa07223c1  ! 1: UDIV_I	udiv 	%r8, 0x03c1, %r16
	.word 0xac71400a  ! 1: UDIV_R	udiv 	%r5, %r10, %r22
	.word 0xbef9ec91  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0c91, %r31
	.word 0xb278afd2  ! 1: SDIV_I	sdiv 	%r2, 0x0fd2, %r25
	.word 0xaef0a771  ! 1: UDIVcc_I	udivcc 	%r2, 0x0771, %r23
	.word 0xbe7a23cf  ! 1: SDIV_I	sdiv 	%r8, 0x03cf, %r31
	.word 0xb271ef97  ! 1: UDIV_I	udiv 	%r7, 0x0f97, %r25
	.word 0xbd69e5fa  ! 1: SDIVX_I	sdivx	%r7, 0x05fa, %r30
	.word 0xa070c009  ! 1: UDIV_R	udiv 	%r3, %r9, %r16
	.word 0xa6f16f23  ! 1: UDIVcc_I	udivcc 	%r5, 0x0f23, %r19
	.word 0xb06a268d  ! 1: UDIVX_I	udivx 	%r8, 0x068d, %r24
	.word 0xbcfa000d  ! 1: SDIVcc_R	sdivcc 	%r8, %r13, %r30
	.word 0xa169800b  ! 1: SDIVX_R	sdivx	%r6, %r11, %r16
	.word 0xa6f1000f  ! 1: UDIVcc_R	udivcc 	%r4, %r15, %r19
	.word 0xb2f1000c  ! 1: UDIVcc_R	udivcc 	%r4, %r12, %r25
	.word 0xb8f0800a  ! 1: UDIVcc_R	udivcc 	%r2, %r10, %r28
	.word 0xa76a000a  ! 1: SDIVX_R	sdivx	%r8, %r10, %r19
	.word 0xb8798009  ! 1: SDIV_R	sdiv 	%r6, %r9, %r28
	.word 0xba69a5d6  ! 1: UDIVX_I	udivx 	%r6, 0x05d6, %r29
	.word 0xb678c00b  ! 1: SDIV_R	sdiv 	%r3, %r11, %r27
	.word 0xaa71000e  ! 1: UDIV_R	udiv 	%r4, %r14, %r21
	.word 0xaf68a3e4  ! 1: SDIVX_I	sdivx	%r2, 0x03e4, %r23
	.word 0xa868e14f  ! 1: UDIVX_I	udivx 	%r3, 0x014f, %r20
	.word 0xa4712b07  ! 1: UDIV_I	udiv 	%r4, 0x0b07, %r18
	.word 0xa2f8800b  ! 1: SDIVcc_R	sdivcc 	%r2, %r11, %r17
	.word 0xaa70a0b9  ! 1: UDIV_I	udiv 	%r2, 0x00b9, %r21
	.word 0xb269ac50  ! 1: UDIVX_I	udivx 	%r6, 0x0c50, %r25
	.word 0xad6a000f  ! 1: SDIVX_R	sdivx	%r8, %r15, %r22
	.word 0xb8f9e864  ! 1: SDIVcc_I	sdivcc 	%r7, 0x0864, %r28
	.word 0xaa72000e  ! 1: UDIV_R	udiv 	%r8, %r14, %r21
	.word 0xb271800b  ! 1: UDIV_R	udiv 	%r6, %r11, %r25
	.word 0xb0696e09  ! 1: UDIVX_I	udivx 	%r5, 0x0e09, %r24
	.word 0xa8fa2442  ! 1: SDIVcc_I	sdivcc 	%r8, 0x0442, %r20
	.word 0xbc716f96  ! 1: UDIV_I	udiv 	%r5, 0x0f96, %r30
	.word 0xa169c00c  ! 1: SDIVX_R	sdivx	%r7, %r12, %r16
	.word 0xb0716ce4  ! 1: UDIV_I	udiv 	%r5, 0x0ce4, %r24
	.word 0xbb68800e  ! 1: SDIVX_R	sdivx	%r2, %r14, %r29
	.word 0xbef160b8  ! 1: UDIVcc_I	udivcc 	%r5, 0x00b8, %r31
	.word 0xa678c00d  ! 1: SDIV_R	sdiv 	%r3, %r13, %r19
	.word 0xba69000c  ! 1: UDIVX_R	udivx 	%r4, %r12, %r29
	.word 0xbe70a966  ! 1: UDIV_I	udiv 	%r2, 0x0966, %r31
	.word 0xa8f9000e  ! 1: SDIVcc_R	sdivcc 	%r4, %r14, %r20
	.word 0xa869e807  ! 1: UDIVX_I	udivx 	%r7, 0x0807, %r20
	.word 0xbf68a49c  ! 1: SDIVX_I	sdivx	%r2, 0x049c, %r31
	.word 0xb3694009  ! 1: SDIVX_R	sdivx	%r5, %r9, %r25
	.word 0xa7696c97  ! 1: SDIVX_I	sdivx	%r5, 0x0c97, %r19
	.word 0xaa7126ba  ! 1: UDIV_I	udiv 	%r4, 0x06ba, %r21
	.word 0xae796332  ! 1: SDIV_I	sdiv 	%r5, 0x0332, %r23
	.word 0xba79c00a  ! 1: SDIV_R	sdiv 	%r7, %r10, %r29
	.word 0xba708009  ! 1: UDIV_R	udiv 	%r2, %r9, %r29
	.word 0xa66a000b  ! 1: UDIVX_R	udivx 	%r8, %r11, %r19
	.word 0xa06a0009  ! 1: UDIVX_R	udivx 	%r8, %r9, %r16
	.word 0xbb68800e  ! 1: SDIVX_R	sdivx	%r2, %r14, %r29
	.word 0xaa6965a4  ! 1: UDIVX_I	udivx 	%r5, 0x05a4, %r21
	.word 0xbc696d14  ! 1: UDIVX_I	udivx 	%r5, 0x0d14, %r30
	.word 0xb168800d  ! 1: SDIVX_R	sdivx	%r2, %r13, %r24
	.word 0xa8f88009  ! 1: SDIVcc_R	sdivcc 	%r2, %r9, %r20
	.word 0xbc71ac74  ! 1: UDIV_I	udiv 	%r6, 0x0c74, %r30
	.word 0xa5692d84  ! 1: SDIVX_I	sdivx	%r4, 0x0d84, %r18
	.word 0xb872000d  ! 1: UDIV_R	udiv 	%r8, %r13, %r28
	.word 0xb0792531  ! 1: SDIV_I	sdiv 	%r4, 0x0531, %r24
	.word 0xa369218b  ! 1: SDIVX_I	sdivx	%r4, 0x018b, %r17
	.word 0xbef1e488  ! 1: UDIVcc_I	udivcc 	%r7, 0x0488, %r31
	.word 0xb4f0a67a  ! 1: UDIVcc_I	udivcc 	%r2, 0x067a, %r26
	.word 0xa868800f  ! 1: UDIVX_R	udivx 	%r2, %r15, %r20
	.word 0xbcfa000c  ! 1: SDIVcc_R	sdivcc 	%r8, %r12, %r30
	.word 0xba71000e  ! 1: UDIV_R	udiv 	%r4, %r14, %r29
	.word 0xa3692d7b  ! 1: SDIVX_I	sdivx	%r4, 0x0d7b, %r17
	.word 0xb870a02b  ! 1: UDIV_I	udiv 	%r2, 0x002b, %r28
	.word 0xb2f0c00b  ! 1: UDIVcc_R	udivcc 	%r3, %r11, %r25
	.word 0xa6f0c00a  ! 1: UDIVcc_R	udivcc 	%r3, %r10, %r19
	.word 0xacf0ee9d  ! 1: UDIVcc_I	udivcc 	%r3, 0x0e9d, %r22
	.word 0xae6a000c  ! 1: UDIVX_R	udivx 	%r8, %r12, %r23
	.word 0xa870a1a6  ! 1: UDIV_I	udiv 	%r2, 0x01a6, %r20
	.word 0xb86a0009  ! 1: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xb8f92062  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0062, %r28
	.word 0xb4f163f8  ! 1: UDIVcc_I	udivcc 	%r5, 0x03f8, %r26
	.word 0xb769c00a  ! 1: SDIVX_R	sdivx	%r7, %r10, %r27
	.word 0xbcf1ea80  ! 1: UDIVcc_I	udivcc 	%r7, 0x0a80, %r30
	.word 0xb86a2a1d  ! 1: UDIVX_I	udivx 	%r8, 0x0a1d, %r28
	.word 0xbc71400f  ! 1: UDIV_R	udiv 	%r5, %r15, %r30
	.word 0xba79000d  ! 1: SDIV_R	sdiv 	%r4, %r13, %r29
	.word 0xaf69c00d  ! 1: SDIVX_R	sdivx	%r7, %r13, %r23
	.word 0xb8fa0009  ! 1: SDIVcc_R	sdivcc 	%r8, %r9, %r28
	.word 0xa072000c  ! 1: UDIV_R	udiv 	%r8, %r12, %r16
	.word 0xa368800f  ! 1: SDIVX_R	sdivx	%r2, %r15, %r17
	.word 0xb6692aa0  ! 1: UDIVX_I	udivx 	%r4, 0x0aa0, %r27
	.word 0xa0f1c00e  ! 1: UDIVcc_R	udivcc 	%r7, %r14, %r16
	.word 0xb0f8ec1e  ! 1: SDIVcc_I	sdivcc 	%r3, 0x0c1e, %r24
	.word 0xab69000b  ! 1: SDIVX_R	sdivx	%r4, %r11, %r21
	.word 0xbe71eeff  ! 1: UDIV_I	udiv 	%r7, 0x0eff, %r31
	.word 0xbc722f2e  ! 1: UDIV_I	udiv 	%r8, 0x0f2e, %r30
	.word 0xb569000e  ! 1: SDIVX_R	sdivx	%r4, %r14, %r26
	.word 0xbf698009  ! 1: SDIVX_R	sdivx	%r6, %r9, %r31
	.word 0xad69a867  ! 1: SDIVX_I	sdivx	%r6, 0x0867, %r22
	.word 0xb4f0c00e  ! 1: UDIVcc_R	udivcc 	%r3, %r14, %r26
	.word 0xb0f8e704  ! 1: SDIVcc_I	sdivcc 	%r3, 0x0704, %r24
	.word 0xaef8800e  ! 1: SDIVcc_R	sdivcc 	%r2, %r14, %r23
	.word 0xb0f1400f  ! 1: UDIVcc_R	udivcc 	%r5, %r15, %r24
	.word 0xacf8a694  ! 1: SDIVcc_I	sdivcc 	%r2, 0x0694, %r22
	.word 0xb069000d  ! 1: UDIVX_R	udivx 	%r4, %r13, %r24
	.word 0xbcf92478  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0478, %r30
	.word 0xbf69a82d  ! 1: SDIVX_I	sdivx	%r6, 0x082d, %r31
	.word 0xa068e963  ! 1: UDIVX_I	udivx 	%r3, 0x0963, %r16
	.word 0xb671800d  ! 1: UDIV_R	udiv 	%r6, %r13, %r27
	.word 0xab68800c  ! 1: SDIVX_R	sdivx	%r2, %r12, %r21
	.word 0xb2696bc0  ! 1: UDIVX_I	udivx 	%r5, 0x0bc0, %r25
	.word 0xb2f0800e  ! 1: UDIVcc_R	udivcc 	%r2, %r14, %r25
	.word 0xacf0800e  ! 1: UDIVcc_R	udivcc 	%r2, %r14, %r22
	.word 0xba72265c  ! 1: UDIV_I	udiv 	%r8, 0x065c, %r29
	.word 0xbe69800f  ! 1: UDIVX_R	udivx 	%r6, %r15, %r31
	.word 0xb06a000b  ! 1: UDIVX_R	udivx 	%r8, %r11, %r24
	.word 0xa471edac  ! 1: UDIV_I	udiv 	%r7, 0x0dac, %r18
	.word 0xb0f8c00a  ! 1: SDIVcc_R	sdivcc 	%r3, %r10, %r24
	.word 0xb070800c  ! 1: UDIV_R	udiv 	%r2, %r12, %r24
	.word 0xb869e4e8  ! 1: UDIVX_I	udivx 	%r7, 0x04e8, %r28
	.word 0xa669236e  ! 1: UDIVX_I	udivx 	%r4, 0x036e, %r19
	.word 0xb8fa20e6  ! 1: SDIVcc_I	sdivcc 	%r8, 0x00e6, %r28
	.word 0xb878a474  ! 1: SDIV_I	sdiv 	%r2, 0x0474, %r28
	.word 0xb0696bfc  ! 1: UDIVX_I	udivx 	%r5, 0x0bfc, %r24
	.word 0xb2f2000c  ! 1: UDIVcc_R	udivcc 	%r8, %r12, %r25
	.word 0xac69eefe  ! 1: UDIVX_I	udivx 	%r7, 0x0efe, %r22
	.word 0xa4f2236d  ! 1: UDIVcc_I	udivcc 	%r8, 0x036d, %r18
	.word 0xba714009  ! 1: UDIV_R	udiv 	%r5, %r9, %r29
	.word 0xb8f8a2f9  ! 1: SDIVcc_I	sdivcc 	%r2, 0x02f9, %r28
	.word 0xb47920f9  ! 1: SDIV_I	sdiv 	%r4, 0x00f9, %r26
	.word 0xba7a24da  ! 1: SDIV_I	sdiv 	%r8, 0x04da, %r29
	.word 0xbcf0800e  ! 1: UDIVcc_R	udivcc 	%r2, %r14, %r30
	.word 0xb069ad4f  ! 1: UDIVX_I	udivx 	%r6, 0x0d4f, %r24
	.word 0xa670c00a  ! 1: UDIV_R	udiv 	%r3, %r10, %r19
	.word 0xb4f1000a  ! 1: UDIVcc_R	udivcc 	%r4, %r10, %r26
	.word 0xae78a185  ! 1: SDIV_I	sdiv 	%r2, 0x0185, %r23
	.word 0xac7a0009  ! 1: SDIV_R	sdiv 	%r8, %r9, %r22
	.word 0xb878e2b1  ! 1: SDIV_I	sdiv 	%r3, 0x02b1, %r28
	.word 0xb969000c  ! 1: SDIVX_R	sdivx	%r4, %r12, %r28
	.word 0xb6792938  ! 1: SDIV_I	sdiv 	%r4, 0x0938, %r27
	.word 0xbc79aa75  ! 1: SDIV_I	sdiv 	%r6, 0x0a75, %r30
	.word 0xa06a000c  ! 1: UDIVX_R	udivx 	%r8, %r12, %r16
	.word 0xaa78e8cf  ! 1: SDIV_I	sdiv 	%r3, 0x08cf, %r21
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0x4eb0aea6ddd69e50, %r16, %r16
	setx  0x1772f858194767d7, %r16, %r17
	setx  0xf9fd1225171f2672, %r16, %r18
	setx  0x8809d2916b4a9b03, %r16, %r19
	setx  0x7023c773e702af18, %r16, %r20
	setx  0x494f9e076b883f2d, %r16, %r21
	setx  0xe6348dd965b513b4, %r16, %r22
	setx  0xa101719d1bb0bec9, %r16, %r23
	setx  0x78f25b0cbe7e7caa, %r16, %r24
	setx  0xdba095af657e3e7b, %r16, %r25
	setx  0x761d2b381417ed88, %r16, %r26
	setx  0xb4867e39906d7046, %r16, %r27
	setx  0x5e5e483c7099d5ef, %r16, %r28
	setx  0x9d80ae59403ec979, %r16, %r29
	setx  0x159052de5202f79b, %r16, %r30
	setx  0xba83531798ef5c2c, %r16, %r31
	setx  0x0000000000000430, %r16, %r9
	setx  0x00000000000006a0, %r16, %r10
	setx  0x0000000000000380, %r16, %r11
	setx  0x0000000000000410, %r16, %r12
	setx  0x0000000000000f40, %r16, %r13
	setx  0x00000000000007d0, %r16, %r14
	setx  0x00000000000008d0, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,36)
	.word 0xe4520000  ! 3: LDSH_R	ldsh	[%r8 + %r0], %r18
	.word 0xa231800f  ! 6: SUBC_R	orn 	%r6, %r15, %r17
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,5,33)
	.word 0xbaf2000b  ! 9: UDIVcc_R	udivcc 	%r8, %r11, %r29
	.word 0xb338900c  ! 11: SRAX_R	srax	%r2, %r12, %r25
	.word 0xa528a001  ! 11: SLL_I	sll 	%r2, 0x0001, %r18
	.word 0xa819a1ed  ! 11: XOR_I	xor 	%r6, 0x01ed, %r20
	.word 0xba81e808  ! 11: ADDcc_I	addcc 	%r7, 0x0808, %r29
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xfa19c00c  ! 15: LDD_R	ldd	[%r7 + %r12], %r29
	.word 0xb0b1adee  ! 18: ORNcc_I	orncc 	%r6, 0x0dee, %r24
	.word 0xbe39ed5c  ! 20: XNOR_I	xnor 	%r7, 0x0d5c, %r31
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR,31,x)
	.word 0xb278e0e9  ! 23: SDIV_I	sdiv 	%r3, 0x00e9, %r25
	.word 0xaa41800b  ! 25: ADDC_R	addc 	%r6, %r11, %r21
	.word 0xb882000f  ! 25: ADDcc_R	addcc 	%r8, %r15, %r28
	.word 0xa8c12316  ! 25: ADDCcc_I	addccc 	%r4, 0x0316, %r20
	.word 0xb489aa5a  ! 25: ANDcc_I	andcc 	%r6, 0x0a5a, %r26
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xf449a383  ! 28: LDSB_I	ldsb	[%r6 + 0x0383], %r26
	.word 0xa2996a62  ! 31: XORcc_I	xorcc 	%r5, 0x0a62, %r17
	.word 0xb9316001  ! 33: SRL_I	srl 	%r5, 0x0001, %r28
	.word 0xad68e97f  ! 36: SDIVX_I	sdivx	%r3, 0x097f, %r22
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xb4292437  ! 39: ANDN_I	andn 	%r4, 0x0437, %r26
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xf6292799  ! 43: STB_I	stb	%r27, [%r4 + 0x0799]
	.word 0xb020800c  ! 46: SUB_R	sub 	%r2, %r12, %r24
	.word 0xb82a2b6a  ! 48: ANDN_I	andn 	%r8, 0x0b6a, %r28
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xa47a000c  ! 51: SDIV_R	sdiv 	%r8, %r12, %r18
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,50)
	.word 0xe44a0000  ! 54: LDSB_R	ldsb	[%r8 + %r0], %r18
	.word 0xa939400d  ! 57: SRA_R	sra 	%r5, %r13, %r20
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR_NIR,5,6)
	.word 0xb2f0800a  ! 60: UDIVcc_R	udivcc 	%r2, %r10, %r25
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf248a4f5  ! 64: LDSB_I	ldsb	[%r2 + 0x04f5], %r25
	.word 0xb201000b  ! 67: ADD_R	add 	%r4, %r11, %r25
	.word 0xacb963cb  ! 69: XNORcc_I	xnorcc 	%r5, 0x03cb, %r22
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,27,1)
	.word 0xa6f1c00e  ! 72: UDIVcc_R	udivcc 	%r7, %r14, %r19
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,26)
	.word 0xe649c000  ! 75: LDSB_R	ldsb	[%r7 + %r0], %r19
	.word 0xa131b061  ! 78: SRLX_I	srlx	%r6, 0x0021, %r16
	.word 0xb4f8ebc0  ! 81: SDIVcc_I	sdivcc 	%r3, 0x0bc0, %r26
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xab39900e  ! 84: SRAX_R	srax	%r6, %r14, %r21
	.word 0xb0a9000d  ! 86: ANDNcc_R	andncc 	%r4, %r13, %r24
	.word 0xa020e042  ! 86: SUB_I	sub 	%r3, 0x0042, %r16
	.word 0xa0322f31  ! 86: ORN_I	orn 	%r8, 0x0f31, %r16
	.word 0xa331400a  ! 86: SRL_R	srl 	%r5, %r10, %r17
	.word 0xbb28c00c  ! 86: SLL_R	sll 	%r3, %r12, %r29
	.word 0xa62a000f  ! 86: ANDN_R	andn 	%r8, %r15, %r19
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xfc09c00c  ! 88: LDUB_R	ldub	[%r7 + %r12], %r30
	.word 0xbe89206f  ! 91: ANDcc_I	andcc 	%r4, 0x006f, %r31
	.word 0xba02000c  ! 93: ADD_R	add 	%r8, %r12, %r29
	.word 0xa6f9800f  ! 96: SDIVcc_R	sdivcc 	%r6, %r15, %r19
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,IR_NIR,26,13)
	.word 0xb72a3001  ! 99: SLLX_I	sllx	%r8, 0x0001, %r27
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xe419aa30  ! 102: LDD_I	ldd	[%r6 + 0x0a30], %r18
	.word 0xa8b8ee29  ! 105: XNORcc_I	xnorcc 	%r3, 0x0e29, %r20
	.word 0xb8a20009  ! 107: SUBcc_R	subcc 	%r8, %r9, %r28
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xbc69000e  ! 110: UDIVX_R	udivx 	%r4, %r14, %r30
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,9)
	.word 0xfc190000  ! 113: LDD_R	ldd	[%r4 + %r0], %r30
	.word 0xa529f001  ! 116: SLLX_I	sllx	%r7, 0x0001, %r18
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xa8790009  ! 119: SDIV_R	sdiv 	%r4, %r9, %r20
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xa812283d  ! 122: OR_I	or 	%r8, 0x083d, %r20
	.word 0xa6b9c00d  ! 125: XNORcc_R	xnorcc 	%r7, %r13, %r19
	.word 0xa5323001  ! 127: SRLX_I	srlx	%r8, 0x0001, %r18
	.word 0xb871c00a  ! 130: UDIV_R	udiv 	%r7, %r10, %r28
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR_NIR,23,7)
	.word 0xa2a9e418  ! 133: ANDNcc_I	andncc 	%r7, 0x0418, %r17
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xe209e219  ! 137: LDUB_I	ldub	[%r7 + 0x0219], %r17
	.word 0xa2a8e1ff  ! 140: ANDNcc_I	andncc 	%r3, 0x01ff, %r17
	.word 0xb1398009  ! 142: SRA_R	sra 	%r6, %r9, %r24
	.word 0xa2f9a610  ! 145: SDIVcc_I	sdivcc 	%r6, 0x0610, %r17
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR_NIR,19,24)
	.word 0xb4a9400f  ! 148: ANDNcc_R	andncc 	%r5, %r15, %r26
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xe6296e3d  ! 151: STB_I	stb	%r19, [%r5 + 0x0e3d]
	.word 0xba11ed66  ! 154: OR_I	or 	%r7, 0x0d66, %r29
	.word 0xbc89000a  ! 156: ANDcc_R	andcc 	%r4, %r10, %r30
	.word 0xaf69a7e4  ! 159: SDIVX_I	sdivx	%r6, 0x07e4, %r23
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xb228a89d  ! 162: ANDN_I	andn 	%r2, 0x089d, %r25
	.word 0xb939d00a  ! 164: SRAX_R	srax	%r7, %r10, %r28
	.word 0xb539400e  ! 164: SRA_R	sra 	%r5, %r14, %r26
	.word 0xae88800c  ! 164: ANDcc_R	andcc 	%r2, %r12, %r23
	.word 0xa5782401  ! 164: MOVR_I	move	%r0, 0xfffffff0, %r18
	.word 0xbf292001  ! 164: SLL_I	sll 	%r4, 0x0001, %r31
	.word 0xb2194009  ! 164: XOR_R	xor 	%r5, %r9, %r25
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xfe28ec8a  ! 166: STB_I	stb	%r31, [%r3 + 0x0c8a]
	.word 0xa2888009  ! 169: ANDcc_R	andcc 	%r2, %r9, %r17
	.word 0xa129900b  ! 171: SLLX_R	sllx	%r6, %r11, %r16
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xa679400e  ! 174: SDIV_R	sdiv 	%r5, %r14, %r19
	.word 0xb430c00a  ! 176: ORN_R	orn 	%r3, %r10, %r26
	.word 0xaeba000e  ! 176: XNORcc_R	xnorcc 	%r8, %r14, %r23
	.word 0xad30e001  ! 176: SRL_I	srl 	%r3, 0x0001, %r22
	.word 0xbe412075  ! 176: ADDC_I	addc 	%r4, 0x0075, %r31
	.word 0xa8c1400e  ! 176: ADDCcc_R	addccc 	%r5, %r14, %r20
	.word 0xb6a92271  ! 176: ANDNcc_I	andncc 	%r4, 0x0271, %r27
	.word 0xbf312001  ! 176: SRL_I	srl 	%r4, 0x0001, %r31
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,51)
	.word 0xfe190000  ! 178: LDD_R	ldd	[%r4 + %r0], %r31
	.word 0xa4a0a47f  ! 181: SUBcc_I	subcc 	%r2, 0x047f, %r18
	.word 0xa068c00c  ! 184: UDIVX_R	udivx 	%r3, %r12, %r16
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,12,23)
	.word 0xbc21800e  ! 187: SUB_R	sub 	%r6, %r14, %r30
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,32)
	.word 0xfc098000  ! 194: LDUB_R	ldub	[%r6 + %r0], %r30
	.word 0xb6a1c009  ! 197: SUBcc_R	subcc 	%r7, %r9, %r27
	.word 0xa8f9c009  ! 200: SDIVcc_R	sdivcc 	%r7, %r9, %r20
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xe829e4a7  ! 206: STB_I	stb	%r20, [%r7 + 0x04a7]
	.word 0xb6a9e794  ! 209: ANDNcc_I	andncc 	%r7, 0x0794, %r27
	.word 0xbeb9800f  ! 211: XNORcc_R	xnorcc 	%r6, %r15, %r31
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,IR_NIR,27,4)
	.word 0xb078c00b  ! 214: SDIV_R	sdiv 	%r3, %r11, %r24
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,6)
	.word 0xf058c000  ! 217: LDX_R	ldx	[%r3 + %r0], %r24
	.word 0xae40a7f7  ! 220: ADDC_I	addc 	%r2, 0x07f7, %r23
	.word 0xb271800a  ! 223: UDIV_R	udiv 	%r6, %r10, %r25
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xa40167cb  ! 226: ADD_I	add 	%r5, 0x07cb, %r18
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xac18e36e  ! 230: XOR_I	xor 	%r3, 0x036e, %r22
	.word 0xa0392db4  ! 233: XNOR_I	xnor 	%r4, 0x0db4, %r16
	.word 0xbc19800c  ! 235: XOR_R	xor 	%r6, %r12, %r30
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xa069000f  ! 238: UDIVX_R	udivx 	%r4, %r15, %r16
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xe059224b  ! 242: LDX_I	ldx	[%r4 + 0x024b], %r16
	.word 0xac312b0b  ! 245: ORN_I	orn 	%r4, 0x0b0b, %r22
	.word 0xb1782401  ! 247: MOVR_I	move	%r0, 0x7fffbdd0, %r24
	.word 0xa0f9400c  ! 250: SDIVcc_R	sdivcc 	%r5, %r12, %r16
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xaaa1aa8c  ! 253: SUBcc_I	subcc 	%r6, 0x0a8c, %r21
	.word 0xb530f001  ! 256: SRLX_I	srlx	%r3, 0x0001, %r26
	.word 0xaf38800c  ! 258: SRA_R	sra 	%r2, %r12, %r23
	.word 0xbe6a2f40  ! 261: UDIVX_I	udivx 	%r8, 0x0f40, %r31
	.word 0xac39800b  ! 263: XNOR_R	xnor 	%r6, %r11, %r22
	.word 0xb80a2819  ! 263: AND_I	and 	%r8, 0x0819, %r28
	.word 0xbe20ec67  ! 263: SUB_I	sub 	%r3, 0x0c67, %r31
	.word 0xa731800f  ! 264: SRL_R	srl 	%r6, %r15, %r19
	.word 0xbc81000d  ! 264: ADDcc_R	addcc 	%r4, %r13, %r30
	.word 0xba18800f  ! 264: XOR_R	xor 	%r2, %r15, %r29
	.word 0xb618edd5  ! 264: XOR_I	xor 	%r3, 0x0dd5, %r27
	.word 0xa8b1ab72  ! 264: ORNcc_I	orncc 	%r6, 0x0b72, %r20
	.word 0xa621000b  ! 264: SUB_R	sub 	%r4, %r11, %r19
	.word 0xb331d00b  ! 264: SRLX_R	srlx	%r7, %r11, %r25
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xf211c00b  ! 268: LDUH_R	lduh	[%r7 + %r11], %r25
	.word 0xa3782461  ! 271: MOVR_I	move	%r0, 0x7fffbdd0, %r17
	.word 0xa831a431  ! 273: ORN_I	orn 	%r6, 0x0431, %r20
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,NIR,x,24)
	.word 0xa569eba2  ! 276: SDIVX_I	sdivx	%r7, 0x0ba2, %r18
	.word 0xb9782401  ! 278: MOVR_I	move	%r0, 0xfffffff0, %r28
	.word 0xbec0c009  ! 278: ADDCcc_R	addccc 	%r3, %r9, %r31
	.word 0xb6b9c00c  ! 278: XNORcc_R	xnorcc 	%r7, %r12, %r27
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xe8712630  ! 281: STX_I	stx	%r20, [%r4 + 0x0630]
	.word 0xb209e562  ! 284: AND_I	and 	%r7, 0x0562, %r25
	.word 0xaf64180a  ! 286: MOVcc_R	<illegal instruction>
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,NIR,x,5)
	.word 0xb169c00f  ! 289: SDIVX_R	sdivx	%r7, %r15, %r24
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xe4196988  ! 292: LDD_I	ldd	[%r5 + 0x0988], %r18
	.word 0xb801800c  ! 295: ADD_R	add 	%r6, %r12, %r28
	.word 0xb099e0f3  ! 297: XORcc_I	xorcc 	%r7, 0x00f3, %r24
	.word 0xa67a000f  ! 300: SDIV_R	sdiv 	%r8, %r15, %r19
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,16,30)
	.word 0xb811648c  ! 303: OR_I	or 	%r5, 0x048c, %r28
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xa2216dbf  ! 306: SUB_I	sub 	%r5, 0x0dbf, %r17
	.word 0xa964186a  ! 309: MOVcc_R	<illegal instruction>
	.word 0xaac0e595  ! 311: ADDCcc_I	addccc 	%r3, 0x0595, %r21
	.word 0xba68c00f  ! 314: UDIVX_R	udivx 	%r3, %r15, %r29
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xf85a000b  ! 318: LDX_R	ldx	[%r8 + %r11], %r28
	.word 0xa601ebee  ! 321: ADD_I	add 	%r7, 0x0bee, %r19
	.word 0xb0922566  ! 323: ORcc_I	orcc 	%r8, 0x0566, %r24
	.word 0xad68a655  ! 326: SDIVX_I	sdivx	%r2, 0x0655, %r22
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xa1780409  ! 329: MOVR_R	move	%r0, %r9, %r16
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,33,x, x,x,x, x,x,x)
	.word 0xe070a8b7  ! 333: STX_I	stx	%r16, [%r2 + 0x08b7]
	.word 0xaa91a7fa  ! 336: ORcc_I	orcc 	%r6, 0x07fa, %r21
	.word 0xbcc229c9  ! 338: ADDCcc_I	addccc 	%r8, 0x09c9, %r30
	.word 0xa879a65e  ! 341: SDIV_I	sdiv 	%r6, 0x065e, %r20
	.word 0xa6b1400c  ! 343: ORNcc_R	orncc 	%r5, %r12, %r19
	.word 0xa138f001  ! 343: SRAX_I	srax	%r3, 0x0001, %r16
	.word 0xa731500b  ! 343: SRLX_R	srlx	%r5, %r11, %r19
	.word 0xb499241e  ! 343: XORcc_I	xorcc 	%r4, 0x041e, %r26
	.word 0xa3782401  ! 343: MOVR_I	move	%r0, 0xfffffff0, %r17
	.word 0xb4a0c00a  ! 343: SUBcc_R	subcc 	%r3, %r10, %r26
	.word 0xb731100d  ! 343: SRLX_R	srlx	%r4, %r13, %r27
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe6516026  ! 345: LDSH_I	ldsh	[%r5 + 0x0026], %r19
	.word 0xa2288069  ! 348: ANDN_R	andn 	%r2, %r9, %r17
	.word 0xbe39c00a  ! 350: XNOR_R	xnor 	%r7, %r10, %r31
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,NIR,x,20)
	.word 0xac78800f  ! 353: SDIV_R	sdiv 	%r2, %r15, %r22
	.word 0xfa30e932  ! 356: STH_I	sth	%r29, [%r3 + 0x0932]
	.word 0xa892000d  ! 359: ORcc_R	orcc 	%r8, %r13, %r20
	.word 0xa41a000b  ! 361: XOR_R	xor 	%r8, %r11, %r18
	.word 0xb069400c  ! 364: UDIVX_R	udivx 	%r5, %r12, %r24
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xa530f001  ! 367: SRLX_I	srlx	%r3, 0x0001, %r18
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,29,x, x,x,x, x,x,x)
	.word 0xb200800a  ! 370: ADD_R	add 	%r2, %r10, %r25
	.word 0xa401a12e  ! 373: ADD_I	add 	%r6, 0x012e, %r18
	.word 0xb819c00a  ! 375: XOR_R	xor 	%r7, %r10, %r28
	.word 0xa671c00c  ! 378: UDIV_R	udiv 	%r7, %r12, %r19
thr1_ic_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,IR_NIR,19,8)
	.word 0xb018c00c  ! 381: XOR_R	xor 	%r3, %r12, %r24
	.word 0xf4716be8  ! 384: STX_I	stx	%r26, [%r5 + 0x0be8]
	.word 0xb939500f  ! 387: SRAX_R	srax	%r5, %r15, %r28
	.word 0xbd29d00f  ! 389: SLLX_R	sllx	%r7, %r15, %r30
	.word 0xba796b62  ! 392: SDIV_I	sdiv 	%r5, 0x0b62, %r29
	.word 0xaa0165ad  ! 394: ADD_I	add 	%r5, 0x05ad, %r21
	.word 0xa029abe9  ! 394: ANDN_I	andn 	%r6, 0x0be9, %r16
	.word 0xa130f001  ! 394: SRLX_I	srlx	%r3, 0x0001, %r16
	.word 0xab318009  ! 394: SRL_R	srl 	%r6, %r9, %r21
	.word 0xa00123a2  ! 395: ADD_I	add 	%r4, 0x03a2, %r16
	.word 0xa2a9eaf0  ! 395: ANDNcc_I	andncc 	%r7, 0x0af0, %r17
	.word 0xa330800f  ! 395: SRL_R	srl 	%r2, %r15, %r17
	.word 0xacc0c00f  ! 395: ADDCcc_R	addccc 	%r3, %r15, %r22
	.word 0xbcb2000f  ! 395: ORNcc_R	orncc 	%r8, %r15, %r30
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,31)
	.word 0xfc0a0000  ! 398: LDUB_R	ldub	[%r8 + %r0], %r30
	.word 0xbc212edb  ! 401: SUB_I	sub 	%r4, 0x0edb, %r30
thr1_ic_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,16,22)
	.word 0xba79400e  ! 404: SDIV_R	sdiv 	%r5, %r14, %r29
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xfa316a7b  ! 408: STH_I	sth	%r29, [%r5 + 0x0a7b]
	.word 0xba2123f3  ! 411: SUB_I	sub 	%r4, 0x03f3, %r29
	.word 0xaa0a000e  ! 413: AND_R	and 	%r8, %r14, %r21
	.word 0xb671800e  ! 416: UDIV_R	udiv 	%r6, %r14, %r27
	.word 0xf450aa54  ! 419: LDSH_I	ldsh	[%r2 + 0x0a54], %r26
	.word 0xa729d069  ! 422: SLLX_R	sllx	%r7, %r9, %r19
	.word 0xa091c00a  ! 424: ORcc_R	orcc 	%r7, %r10, %r16
	.word 0xbc70ab66  ! 427: UDIV_I	udiv 	%r2, 0x0b66, %r30
thr1_ic_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xa831a291  ! 430: ORN_I	orn 	%r6, 0x0291, %r20
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,21,x, x,x,x, x,x,x)
	.word 0xae38e727  ! 433: XNOR_I	xnor 	%r3, 0x0727, %r23
	.word 0xba99406b  ! 436: XORcc_R	xorcc 	%r5, %r11, %r29
	.word 0xbb30d00d  ! 438: SRLX_R	srlx	%r3, %r13, %r29
thr1_ic_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xb070c00f  ! 441: UDIV_R	udiv 	%r3, %r15, %r24
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,59)
	.word 0xf000c000  ! 444: LDUW_R	lduw	[%r3 + %r0], %r24
	.word 0xbb29d06a  ! 447: SLLX_R	sllx	%r7, %r10, %r29
	.word 0xbaf0eca9  ! 450: UDIVcc_I	udivcc 	%r3, 0x0ca9, %r29
thr1_ic_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,NIR,x,4)
	.word 0xa480c00d  ! 453: ADDcc_R	addcc 	%r3, %r13, %r18
thr1_resum_intr_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
thr1_resum_intr_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf221e030  ! 460: STW_I	stw	%r25, [%r7 + 0x0030]
	.word 0xb6a1800d  ! 463: SUBcc_R	subcc 	%r6, %r13, %r27
	.word 0xbc822f87  ! 465: ADDcc_I	addcc 	%r8, 0x0f87, %r30
	.word 0xb0f9a41b  ! 468: SDIVcc_I	sdivcc 	%r6, 0x041b, %r24
thr1_resum_intr_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,43,x, x,x,x, x,x,x)
	.word 0xf021a31b  ! 473: STW_I	stw	%r24, [%r6 + 0x031b]
	.word 0xaa0168e5  ! 476: ADD_I	add 	%r5, 0x08e5, %r21
	.word 0xbea1000b  ! 478: SUBcc_R	subcc 	%r4, %r11, %r31
	.word 0xa2f96377  ! 481: SDIVcc_I	sdivcc 	%r5, 0x0377, %r17
thr1_resum_intr_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,4)
	.word 0xe2014000  ! 485: LDUW_R	lduw	[%r5 + %r0], %r17
	.word 0xb680a699  ! 488: ADDcc_I	addcc 	%r2, 0x0699, %r27
	.word 0xa6792f92  ! 491: SDIV_I	sdiv 	%r4, 0x0f92, %r19
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,8,x, x,x,x, x,x,x)
	.word 0xa739500c  ! 494: SRAX_R	srax	%r5, %r12, %r19
	.word 0xb331a001  ! 497: SRL_I	srl 	%r6, 0x0001, %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0xa50b6b043d27f0cd, %r16, %r16
	setx  0x0b771d0e04f8cb37, %r16, %r17
	setx  0xe490b13bf70f1606, %r16, %r18
	setx  0x3c0ba135bd4dd5b2, %r16, %r19
	setx  0xc53229f6bd949b32, %r16, %r20
	setx  0xd3906da966bb05aa, %r16, %r21
	setx  0x13d093f7ed623df3, %r16, %r22
	setx  0x9c33cd9d10406e51, %r16, %r23
	setx  0x06e4a8a00c42e58a, %r16, %r24
	setx  0x5d8587ed1c4f9b09, %r16, %r25
	setx  0xbff6f56cecc36be2, %r16, %r26
	setx  0x30b22501b4fc30be, %r16, %r27
	setx  0x74664dab4ec59042, %r16, %r28
	setx  0x95284550bb71da73, %r16, %r29
	setx  0x8e00052221183fe8, %r16, %r30
	setx  0x3f5973c98251da71, %r16, %r31
	setx  0x0000000000000910, %r16, %r9
	setx  0x00000000000000b0, %r16, %r10
	setx  0x0000000000000380, %r16, %r11
	setx  0x0000000000000ca0, %r16, %r12
	setx  0x0000000000000a30, %r16, %r13
	setx  0x0000000000000c00, %r16, %r14
	setx  0x0000000000000200, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xa879800c  ! 1: SDIV_R	sdiv 	%r6, %r12, %r20
	.word 0xa47a2d93  ! 1: SDIV_I	sdiv 	%r8, 0x0d93, %r18
	.word 0xb27a000a  ! 1: SDIV_R	sdiv 	%r8, %r10, %r25
	.word 0xba792062  ! 1: SDIV_I	sdiv 	%r4, 0x0062, %r29
	.word 0xa0f9a5d8  ! 1: SDIVcc_I	sdivcc 	%r6, 0x05d8, %r16
	.word 0xa8f12a1a  ! 1: UDIVcc_I	udivcc 	%r4, 0x0a1a, %r20
	.word 0xbef12b5b  ! 1: UDIVcc_I	udivcc 	%r4, 0x0b5b, %r31
	.word 0xa479000f  ! 1: SDIV_R	sdiv 	%r4, %r15, %r18
	.word 0xa869a96f  ! 1: UDIVX_I	udivx 	%r6, 0x096f, %r20
	.word 0xbef0a8a4  ! 1: UDIVcc_I	udivcc 	%r2, 0x08a4, %r31
	.word 0xb079400e  ! 1: SDIV_R	sdiv 	%r5, %r14, %r24
	.word 0xa6f9400b  ! 1: SDIVcc_R	sdivcc 	%r5, %r11, %r19
	.word 0xa2f0800f  ! 1: UDIVcc_R	udivcc 	%r2, %r15, %r17
	.word 0xad68e3be  ! 1: SDIVX_I	sdivx	%r3, 0x03be, %r22
	.word 0xba71000b  ! 1: UDIV_R	udiv 	%r4, %r11, %r29
	.word 0xb871acdd  ! 1: UDIV_I	udiv 	%r6, 0x0cdd, %r28
	.word 0xbc71400a  ! 1: UDIV_R	udiv 	%r5, %r10, %r30
	.word 0xa2f9c00a  ! 1: SDIVcc_R	sdivcc 	%r7, %r10, %r17
	.word 0xb969c00b  ! 1: SDIVX_R	sdivx	%r7, %r11, %r28
	.word 0xb969c00b  ! 1: SDIVX_R	sdivx	%r7, %r11, %r28
	.word 0xaef0800a  ! 1: UDIVcc_R	udivcc 	%r2, %r10, %r23
	.word 0xab692ccf  ! 1: SDIVX_I	sdivx	%r4, 0x0ccf, %r21
	.word 0xaef0c00e  ! 1: UDIVcc_R	udivcc 	%r3, %r14, %r23
	.word 0xa4f2000d  ! 1: UDIVcc_R	udivcc 	%r8, %r13, %r18
	.word 0xb070800f  ! 1: UDIV_R	udiv 	%r2, %r15, %r24
	.word 0xa0f0c00d  ! 1: UDIVcc_R	udivcc 	%r3, %r13, %r16
	.word 0xa2f22f5c  ! 1: UDIVcc_I	udivcc 	%r8, 0x0f5c, %r17
	.word 0xa470e597  ! 1: UDIV_I	udiv 	%r3, 0x0597, %r18
	.word 0xa369c00b  ! 1: SDIVX_R	sdivx	%r7, %r11, %r17
	.word 0xb47128e3  ! 1: UDIV_I	udiv 	%r4, 0x08e3, %r26
	.word 0xb4710009  ! 1: UDIV_R	udiv 	%r4, %r9, %r26
	.word 0xaef14009  ! 1: UDIVcc_R	udivcc 	%r5, %r9, %r23
	.word 0xba71e653  ! 1: UDIV_I	udiv 	%r7, 0x0653, %r29
	.word 0xa36a2cb7  ! 1: SDIVX_I	sdivx	%r8, 0x0cb7, %r17
	.word 0xae70c00e  ! 1: UDIV_R	udiv 	%r3, %r14, %r23
	.word 0xa0f8e408  ! 1: SDIVcc_I	sdivcc 	%r3, 0x0408, %r16
	.word 0xb4f9400d  ! 1: SDIVcc_R	sdivcc 	%r5, %r13, %r26
	.word 0xae70800c  ! 1: UDIV_R	udiv 	%r2, %r12, %r23
	.word 0xa279c00e  ! 1: SDIV_R	sdiv 	%r7, %r14, %r17
	.word 0xb4f1400a  ! 1: UDIVcc_R	udivcc 	%r5, %r10, %r26
	.word 0xaa72000e  ! 1: UDIV_R	udiv 	%r8, %r14, %r21
	.word 0xacf9e0b5  ! 1: SDIVcc_I	sdivcc 	%r7, 0x00b5, %r22
	.word 0xaaf18009  ! 1: UDIVcc_R	udivcc 	%r6, %r9, %r21
	.word 0xb2f9a746  ! 1: SDIVcc_I	sdivcc 	%r6, 0x0746, %r25
	.word 0xa8f9a824  ! 1: SDIVcc_I	sdivcc 	%r6, 0x0824, %r20
	.word 0xad69af8d  ! 1: SDIVX_I	sdivx	%r6, 0x0f8d, %r22
	.word 0xa47223e2  ! 1: UDIV_I	udiv 	%r8, 0x03e2, %r18
	.word 0xaef1000b  ! 1: UDIVcc_R	udivcc 	%r4, %r11, %r23
	.word 0xa4f2000f  ! 1: UDIVcc_R	udivcc 	%r8, %r15, %r18
	.word 0xb479eb63  ! 1: SDIV_I	sdiv 	%r7, 0x0b63, %r26
	.word 0xb27a0009  ! 1: SDIV_R	sdiv 	%r8, %r9, %r25
	.word 0xb269c00c  ! 1: UDIVX_R	udivx 	%r7, %r12, %r25
	.word 0xb878ea32  ! 1: SDIV_I	sdiv 	%r3, 0x0a32, %r28
	.word 0xa5698009  ! 1: SDIVX_R	sdivx	%r6, %r9, %r18
	.word 0xb6f1800f  ! 1: UDIVcc_R	udivcc 	%r6, %r15, %r27
	.word 0xb6f9800a  ! 1: SDIVcc_R	sdivcc 	%r6, %r10, %r27
	.word 0xbd69a8d8  ! 1: SDIVX_I	sdivx	%r6, 0x08d8, %r30
	.word 0xa968800f  ! 1: SDIVX_R	sdivx	%r2, %r15, %r20
	.word 0xb0718009  ! 1: UDIV_R	udiv 	%r6, %r9, %r24
	.word 0xaa68e084  ! 1: UDIVX_I	udivx 	%r3, 0x0084, %r21
	.word 0xb0f1800d  ! 1: UDIVcc_R	udivcc 	%r6, %r13, %r24
	.word 0xb871ee54  ! 1: UDIV_I	udiv 	%r7, 0x0e54, %r28
	.word 0xa271000f  ! 1: UDIV_R	udiv 	%r4, %r15, %r17
	.word 0xaef92107  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0107, %r23
	.word 0xa27a2500  ! 1: SDIV_I	sdiv 	%r8, 0x0500, %r17
	.word 0xb0f1a9dd  ! 1: UDIVcc_I	udivcc 	%r6, 0x09dd, %r24
	.word 0xa279283b  ! 1: SDIV_I	sdiv 	%r4, 0x083b, %r17
	.word 0xa871e7b7  ! 1: UDIV_I	udiv 	%r7, 0x07b7, %r20
	.word 0xa36a2946  ! 1: SDIVX_I	sdivx	%r8, 0x0946, %r17
	.word 0xa070c00c  ! 1: UDIV_R	udiv 	%r3, %r12, %r16
	.word 0xaef0e530  ! 1: UDIVcc_I	udivcc 	%r3, 0x0530, %r23
	.word 0xbc6a2c99  ! 1: UDIVX_I	udivx 	%r8, 0x0c99, %r30
	.word 0xb8fa000b  ! 1: SDIVcc_R	sdivcc 	%r8, %r11, %r28
	.word 0xad69800d  ! 1: SDIVX_R	sdivx	%r6, %r13, %r22
	.word 0xa6f0800b  ! 1: UDIVcc_R	udivcc 	%r2, %r11, %r19
	.word 0xbef2000a  ! 1: UDIVcc_R	udivcc 	%r8, %r10, %r31
	.word 0xa4f08009  ! 1: UDIVcc_R	udivcc 	%r2, %r9, %r18
	.word 0xa569c00c  ! 1: SDIVX_R	sdivx	%r7, %r12, %r18
	.word 0xbe7a000a  ! 1: SDIV_R	sdiv 	%r8, %r10, %r31
	.word 0xb06968b8  ! 1: UDIVX_I	udivx 	%r5, 0x08b8, %r24
	.word 0xa679000c  ! 1: SDIV_R	sdiv 	%r4, %r12, %r19
	.word 0xb8710009  ! 1: UDIV_R	udiv 	%r4, %r9, %r28
	.word 0xb3692ac4  ! 1: SDIVX_I	sdivx	%r4, 0x0ac4, %r25
	.word 0xb269a641  ! 1: UDIVX_I	udivx 	%r6, 0x0641, %r25
	.word 0xaa71e8dd  ! 1: UDIV_I	udiv 	%r7, 0x08dd, %r21
	.word 0xb4f9800b  ! 1: SDIVcc_R	sdivcc 	%r6, %r11, %r26
	.word 0xbc71e9fe  ! 1: UDIV_I	udiv 	%r7, 0x09fe, %r30
	.word 0xba69e58e  ! 1: UDIVX_I	udivx 	%r7, 0x058e, %r29
	.word 0xb16a000c  ! 1: SDIVX_R	sdivx	%r8, %r12, %r24
	.word 0xa2f9a08f  ! 1: SDIVcc_I	sdivcc 	%r6, 0x008f, %r17
	.word 0xa271000d  ! 1: UDIV_R	udiv 	%r4, %r13, %r17
	.word 0xac72000e  ! 1: UDIV_R	udiv 	%r8, %r14, %r22
	.word 0xb869ab6b  ! 1: UDIVX_I	udivx 	%r6, 0x0b6b, %r28
	.word 0xb2fa2bc0  ! 1: SDIVcc_I	sdivcc 	%r8, 0x0bc0, %r25
	.word 0xa271e4c7  ! 1: UDIV_I	udiv 	%r7, 0x04c7, %r17
	.word 0xad68c00a  ! 1: SDIVX_R	sdivx	%r3, %r10, %r22
	.word 0xa870eb90  ! 1: UDIV_I	udiv 	%r3, 0x0b90, %r20
	.word 0xbf69c00c  ! 1: SDIVX_R	sdivx	%r7, %r12, %r31
	.word 0xa0f2281c  ! 1: UDIVcc_I	udivcc 	%r8, 0x081c, %r16
	.word 0xa878c00b  ! 1: SDIV_R	sdiv 	%r3, %r11, %r20
	.word 0xb6698009  ! 1: UDIVX_R	udivx 	%r6, %r9, %r27
	.word 0xb0712d80  ! 1: UDIV_I	udiv 	%r4, 0x0d80, %r24
	.word 0xb0f9800f  ! 1: SDIVcc_R	sdivcc 	%r6, %r15, %r24
	.word 0xaa68ad64  ! 1: UDIVX_I	udivx 	%r2, 0x0d64, %r21
	.word 0xa969ae79  ! 1: SDIVX_I	sdivx	%r6, 0x0e79, %r20
	.word 0xab69c00b  ! 1: SDIVX_R	sdivx	%r7, %r11, %r21
	.word 0xa16923d0  ! 1: SDIVX_I	sdivx	%r4, 0x03d0, %r16
	.word 0xa670ea8d  ! 1: UDIV_I	udiv 	%r3, 0x0a8d, %r19
	.word 0xb47922ee  ! 1: SDIV_I	sdiv 	%r4, 0x02ee, %r26
	.word 0xb879400d  ! 1: SDIV_R	sdiv 	%r5, %r13, %r28
	.word 0xa071400c  ! 1: UDIV_R	udiv 	%r5, %r12, %r16
	.word 0xb069800e  ! 1: UDIVX_R	udivx 	%r6, %r14, %r24
	.word 0xb468c00b  ! 1: UDIVX_R	udivx 	%r3, %r11, %r26
	.word 0xa56a000b  ! 1: SDIVX_R	sdivx	%r8, %r11, %r18
	.word 0xb66926be  ! 1: UDIVX_I	udivx 	%r4, 0x06be, %r27
	.word 0xa069a1ec  ! 1: UDIVX_I	udivx 	%r6, 0x01ec, %r16
	.word 0xbb69400f  ! 1: SDIVX_R	sdivx	%r5, %r15, %r29
	.word 0xa0f9800b  ! 1: SDIVcc_R	sdivcc 	%r6, %r11, %r16
	.word 0xb671ea27  ! 1: UDIV_I	udiv 	%r7, 0x0a27, %r27
	.word 0xaf68a087  ! 1: SDIVX_I	sdivx	%r2, 0x0087, %r23
	.word 0xa871c00a  ! 1: UDIV_R	udiv 	%r7, %r10, %r20
	.word 0xac78a548  ! 1: SDIV_I	sdiv 	%r2, 0x0548, %r22
	.word 0xa5696a6c  ! 1: SDIVX_I	sdivx	%r5, 0x0a6c, %r18
	.word 0xa8f16f95  ! 1: UDIVcc_I	udivcc 	%r5, 0x0f95, %r20
	.word 0xa0f1e7fe  ! 1: UDIVcc_I	udivcc 	%r7, 0x07fe, %r16
	.word 0xbc69000b  ! 1: UDIVX_R	udivx 	%r4, %r11, %r30
	.word 0xa2f9800e  ! 1: SDIVcc_R	sdivcc 	%r6, %r14, %r17
	.word 0xa271400d  ! 1: UDIV_R	udiv 	%r5, %r13, %r17
	.word 0xbd68e346  ! 1: SDIVX_I	sdivx	%r3, 0x0346, %r30
	.word 0xbc7120ef  ! 1: UDIV_I	udiv 	%r4, 0x00ef, %r30
	.word 0xa6f2000b  ! 1: UDIVcc_R	udivcc 	%r8, %r11, %r19
	.word 0xbaf0c00b  ! 1: UDIVcc_R	udivcc 	%r3, %r11, %r29
	.word 0xb8f1e8d8  ! 1: UDIVcc_I	udivcc 	%r7, 0x08d8, %r28
	.word 0xbe69400b  ! 1: UDIVX_R	udivx 	%r5, %r11, %r31
	.word 0xa0712052  ! 1: UDIV_I	udiv 	%r4, 0x0052, %r16
	.word 0xb2694009  ! 1: UDIVX_R	udivx 	%r5, %r9, %r25
	.word 0xb6f8e9ea  ! 1: SDIVcc_I	sdivcc 	%r3, 0x09ea, %r27
	.word 0xbaf122b5  ! 1: UDIVcc_I	udivcc 	%r4, 0x02b5, %r29
	.word 0xa569800f  ! 1: SDIVX_R	sdivx	%r6, %r15, %r18
	.word 0xa6f0e246  ! 1: UDIVcc_I	udivcc 	%r3, 0x0246, %r19
	.word 0xb669e1b7  ! 1: UDIVX_I	udivx 	%r7, 0x01b7, %r27
	.word 0xb271800d  ! 1: UDIV_R	udiv 	%r6, %r13, %r25
	.word 0xa27a000a  ! 1: SDIV_R	sdiv 	%r8, %r10, %r17
	.word 0xa76a0009  ! 1: SDIVX_R	sdivx	%r8, %r9, %r19
	.word 0xb4f9000d  ! 1: SDIVcc_R	sdivcc 	%r4, %r13, %r26
	.word 0xb071800a  ! 1: UDIV_R	udiv 	%r6, %r10, %r24
	.word 0xb569000d  ! 1: SDIVX_R	sdivx	%r4, %r13, %r26
	.word 0xbe696533  ! 1: UDIVX_I	udivx 	%r5, 0x0533, %r31
	.word 0xa4f1800c  ! 1: UDIVcc_R	udivcc 	%r6, %r12, %r18
	.word 0xbcfa2615  ! 1: SDIVcc_I	sdivcc 	%r8, 0x0615, %r30
	.word 0xa56a000f  ! 1: SDIVX_R	sdivx	%r8, %r15, %r18
	.word 0xa672239b  ! 1: UDIV_I	udiv 	%r8, 0x039b, %r19
	.word 0xb071ab74  ! 1: UDIV_I	udiv 	%r6, 0x0b74, %r24
	.word 0xa568c00a  ! 1: SDIVX_R	sdivx	%r3, %r10, %r18
	.word 0xa56a000d  ! 1: SDIVX_R	sdivx	%r8, %r13, %r18
	.word 0xb969a0b3  ! 1: SDIVX_I	sdivx	%r6, 0x00b3, %r28
	.word 0xb6f1400b  ! 1: UDIVcc_R	udivcc 	%r5, %r11, %r27
	.word 0xa0f8ae94  ! 1: SDIVcc_I	sdivcc 	%r2, 0x0e94, %r16
	.word 0xaaf8800a  ! 1: SDIVcc_R	sdivcc 	%r2, %r10, %r21
	.word 0xb2f1c009  ! 1: UDIVcc_R	udivcc 	%r7, %r9, %r25
	.word 0xa4f92859  ! 1: SDIVcc_I	sdivcc 	%r4, 0x0859, %r18
	.word 0xba69400c  ! 1: UDIVX_R	udivx 	%r5, %r12, %r29
	.word 0xb0fa238b  ! 1: SDIVcc_I	sdivcc 	%r8, 0x038b, %r24
	.word 0xa96a26da  ! 1: SDIVX_I	sdivx	%r8, 0x06da, %r20
	.word 0xba696766  ! 1: UDIVX_I	udivx 	%r5, 0x0766, %r29
	.word 0xba708009  ! 1: UDIV_R	udiv 	%r2, %r9, %r29
	.word 0xa368c00a  ! 1: SDIVX_R	sdivx	%r3, %r10, %r17
	.word 0xaa6965e6  ! 1: UDIVX_I	udivx 	%r5, 0x05e6, %r21
	.word 0xbaf2000f  ! 1: UDIVcc_R	udivcc 	%r8, %r15, %r29
	.word 0xbcf18009  ! 1: UDIVcc_R	udivcc 	%r6, %r9, %r30
	.word 0xb471a9bc  ! 1: UDIV_I	udiv 	%r6, 0x09bc, %r26
	.word 0xbe69800b  ! 1: UDIVX_R	udivx 	%r6, %r11, %r31
	.word 0xaa6a000c  ! 1: UDIVX_R	udivx 	%r8, %r12, %r21
	.word 0xa470e19e  ! 1: UDIV_I	udiv 	%r3, 0x019e, %r18
	.word 0xb8f8c00f  ! 1: SDIVcc_R	sdivcc 	%r3, %r15, %r28
	.word 0xbc710009  ! 1: UDIV_R	udiv 	%r4, %r9, %r30
	.word 0xae6a2e04  ! 1: UDIVX_I	udivx 	%r8, 0x0e04, %r23
	.word 0xa269e5dc  ! 1: UDIVX_I	udivx 	%r7, 0x05dc, %r17
	.word 0xb0f96425  ! 1: SDIVcc_I	sdivcc 	%r5, 0x0425, %r24
	.word 0xa67922fa  ! 1: SDIV_I	sdiv 	%r4, 0x02fa, %r19
	.word 0xa468ee62  ! 1: UDIVX_I	udivx 	%r3, 0x0e62, %r18
	.word 0xaef1000a  ! 1: UDIVcc_R	udivcc 	%r4, %r10, %r23
	.word 0xba68a72d  ! 1: UDIVX_I	udivx 	%r2, 0x072d, %r29
	.word 0xa4f0ed0f  ! 1: UDIVcc_I	udivcc 	%r3, 0x0d0f, %r18
	.word 0xb270c00b  ! 1: UDIV_R	udiv 	%r3, %r11, %r25
	.word 0xbef9abd0  ! 1: SDIVcc_I	sdivcc 	%r6, 0x0bd0, %r31
	.word 0xb47a2455  ! 1: SDIV_I	sdiv 	%r8, 0x0455, %r26
	.word 0xb8792ff3  ! 1: SDIV_I	sdiv 	%r4, 0x0ff3, %r28
	.word 0xbef1000e  ! 1: UDIVcc_R	udivcc 	%r4, %r14, %r31
	.word 0xaa69a7a2  ! 1: UDIVX_I	udivx 	%r6, 0x07a2, %r21
	.word 0xba70c00f  ! 1: UDIV_R	udiv 	%r3, %r15, %r29
	.word 0xb4f1400c  ! 1: UDIVcc_R	udivcc 	%r5, %r12, %r26
	.word 0xb078e7f9  ! 1: SDIV_I	sdiv 	%r3, 0x07f9, %r24
	.word 0xa678800f  ! 1: SDIV_R	sdiv 	%r2, %r15, %r19
	.word 0xb479a534  ! 1: SDIV_I	sdiv 	%r6, 0x0534, %r26
	.word 0xb16a000b  ! 1: SDIVX_R	sdivx	%r8, %r11, %r24
	.word 0xa279a3f5  ! 1: SDIV_I	sdiv 	%r6, 0x03f5, %r17
	.word 0xaa78ebd3  ! 1: SDIV_I	sdiv 	%r3, 0x0bd3, %r21
	.word 0xbe68800b  ! 1: UDIVX_R	udivx 	%r2, %r11, %r31
	.word 0xa47a20a2  ! 1: SDIV_I	sdiv 	%r8, 0x00a2, %r18

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
	.word  0xce5685a7,0x26016e98,0x79f7c900,0x9824f5ac
	.word  0x9c575dac,0x3499199c,0x79f0f18e,0xa224c79b
	.word  0xa004af48,0xf5806225,0xda7782dc,0x2c6d3d9c
	.word  0x8405c32e,0x73c0fc9d,0xe89c6c38,0x71c04248
	.word  0x659fcbab,0xad08175c,0x03127803,0xf39a1dab
	.word  0x1ee0de74,0x83645a4c,0x7fd51e85,0xb6a78fa1
	.word  0xc37cf8c2,0x960c033d,0x8ec99633,0x3d27ab8f
	.word  0xf2467289,0x44dff46a,0xa20f3cae,0x73cd8a3f
	.word  0x969777c8,0x49fefbf0,0xfc9ed5cd,0x103059ef
	.word  0xca37c827,0x20a98ae6,0xc3ba268b,0x18662e68
	.word  0xf4c588bc,0x0837cbe2,0xe56d3d85,0xad5a90ad
	.word  0xfd8b41b0,0xdfc52466,0x55672186,0xec502540
	.word  0x75ba5e94,0x1d57eaa3,0x7728175c,0xccff5e0f
	.word  0xd21ddcc6,0xddcf880e,0x669faeee,0x7f06f2d2
	.word  0xe2e8ff77,0x0adee05f,0xc8d66bc6,0x84b847e9
	.word  0x95c88a18,0x651798c8,0x61b77754,0xae10f9c0
	.word  0x8d872ed7,0x52eb93ab,0x9d335ec3,0xf7ac53f9
	.word  0x2c723bb3,0x837c7122,0x10c9e6b1,0x6071168b
	.word  0xfad70b50,0xc95975af,0x6eec63b0,0x0580cf2e
	.word  0x352182d3,0x030330e6,0x9a7d3bea,0x28f14e4f
	.word  0x7779d32b,0xbbd4036b,0x9e0067ad,0xe7eb3116
	.word  0x626f2143,0xf1889aac,0x1b478f10,0xe01500d8
	.word  0x6b7b3ed3,0x6b810bd3,0x090c2535,0x166360ff
	.word  0x8ab21b75,0x6aa0c33d,0x92ed9253,0xd326b946
	.word  0xa3b19797,0x23a16ea6,0x35091b01,0x936c0450
	.word  0xaf377421,0x47b609a8,0x4fcedba2,0x677aa927
	.word  0x37c72b12,0x8d47e16e,0x16f3be0a,0xf06f7a6a
	.word  0x292ae640,0xd1ab5c46,0x49083102,0x47ab3201
	.word  0x54a6d700,0x54415543,0xaf4ab21e,0xd8ac3010
	.word  0x47370501,0x6cf9f548,0xdb8c8c28,0x48f570d7
	.word  0xb44a885b,0xa946693a,0xe7aaa4d2,0xa85841ef
	.word  0x9569a5d7,0x1ce45aa9,0x941163db,0xf2dcdc19
	.word  0x71b452f0,0xf64c0565,0x44e08636,0xb32fe9cc
	.word  0x58c1f71b,0x18ff3627,0x1aa2c079,0x9076b2d7
	.word  0x45515370,0xb5c607bb,0xc46b385b,0x71bc2157
	.word  0xc7fc1aec,0x87b8de49,0x4154ecad,0x24a95939
	.word  0xe1b9c6d7,0xf08a1de3,0x9edea344,0x444a1909
	.word  0x1feafcde,0x598041b0,0xb2adbf18,0x373ab75d
	.word  0x03d035bc,0xbbe2a4f5,0xf369b234,0x68d7d185
	.word  0x2eebc7b6,0x5907beca,0x7466ea37,0x2b2ddec4
	.word  0x7b97a678,0x03999a97,0x19a71f22,0x8c643b5e
	.word  0x5ae8a488,0xdbfcbffc,0xd1099ae6,0x5cbc0df9
	.word  0x639508ad,0xd2cf5179,0x7b1bb9b0,0xf3eb0687
	.word  0x5cc1c093,0xe7f8abce,0x893474d3,0x90a030fa
	.word  0x87853f17,0x8bf49431,0x199ed408,0x92f54ecb
	.word  0xbb9bc072,0x8aa75f29,0x01f8533b,0xa9be2bf1
	.word  0x189da253,0xcc570547,0xa9262ee3,0x1f95733b
	.word  0x80c9662d,0xd1dad7fc,0x764ca808,0x6a5f3bc3
	.word  0xc8d22563,0xbf7a594e,0x2424d0ea,0xf1c9ea94
	.word  0x70408ae8,0x37098ee3,0x3aa5d6b8,0x47ffbb72
	.word  0x99033370,0xc59f90e2,0x21b89a51,0x80d7eddd
	.word  0x373fd9f4,0x152e89cb,0xcc0c959d,0xfccff8ee
	.word  0x3ac40fa2,0x491ddce0,0x1e6cd36f,0x515d66b7
	.word  0x9aade82e,0xd0b2f910,0xf4d4c1be,0x2cef5220
	.word  0x3ea39eaa,0xfe5ce1f8,0xddb3c729,0x40adda83
	.word  0x1fef0b51,0xbf0bbd05,0xf41991e5,0x18c4c331
	.word  0x56442b94,0xef027846,0xca1a5db8,0x0ad752cc
	.word  0xb8d3573b,0x675015ff,0x6c4d39ec,0xa4b50ded
	.word  0x21d713d2,0xc915ebc4,0x0f2d71d9,0x19cc9ef3
	.word  0x9c40764c,0xc5c75cd0,0xd0fc54f4,0x66f8cc6d
	.word  0xe7873d34,0x295c4014,0xb391dc96,0x522698a3
	.word  0x2072e0d7,0xd58b2e88,0xbe6bd4d3,0x7f5b3882
	.word  0x717aa483,0xae5b5c55,0xed3c5462,0x6d520ccc
	.word  0x9715c0e3,0xa2c44fc7,0x69f85ace,0xef2bcd75
	.word  0x7a587481,0x2b134219,0xc929d3aa,0xf0691fd2
	.word  0x41eaf9f2,0x3064f735,0x4a1dfd0c,0xf685b5cb
	.word  0x210d393f,0x7100523d,0x14d84c0a,0x3de3fd97
	.word  0x09fb165b,0xf1a08a8a,0x19333007,0xa9779002
	.word  0xfefa9d7b,0xaded9e36,0xe972bf61,0x7ef90b13
	.word  0x84d6afc3,0xf8cafead,0x6f097c4b,0xe6e8c1be
	.word  0x0e26c298,0xc4db24a8,0x99c967de,0x31d4e89e
	.word  0xd9fe5baa,0x70295042,0x26943e10,0x558f8a39
	.word  0xaddd39b4,0x35c24b6d,0x47ff454c,0xd9389d8d
	.word  0xdf9f2dbc,0x1683871f,0xd1ad655e,0xd5c12610
	.word  0x32d30783,0xee2b1536,0x76ff929d,0x1a02be88
	.word  0xb1501885,0xc995701c,0xfa652874,0x19e6881b
	.word  0xf4a78ed0,0x786cc0ce,0xb393a887,0xe1d5ad91
	.word  0x4b8799d9,0x16272825,0xecb84342,0xb2202559
	.word  0x8829ee4f,0xc1f29f3a,0x87347df2,0x12366667
	.word  0x97a8d31c,0xbcdfa8d2,0x503363f4,0x946aefc1
	.word  0x9ebd152d,0xb0a72301,0xe3339dd6,0xe907d85e
	.word  0x9d0006f3,0xa1850236,0xcbe9d0d1,0xcbe96ffd
	.word  0x4adb3054,0x75c5baf8,0xa9aec1f3,0x771b496f
	.word  0x0bb4535a,0x016f44a0,0xa8fe2b00,0xa485343e
	.word  0x13151338,0x07afba73,0x78f97d22,0x5d11d3c1
	.word  0x8d205a4e,0xf7a3c28f,0xc14b0686,0x372d3f0a
	.word  0x91d8a75e,0xd4f57383,0x4f89a0b9,0x05aa25b7
	.word  0xb650b998,0x0284e5f5,0x23f9eb16,0xdba68387
	.word  0x0c3e9468,0xf03a7ff6,0xfd79cfe1,0xb579e284
	.word  0x888e9f40,0x1bb5fc02,0x04fed85d,0x638e1558
	.word  0xeb1db361,0x17155aa1,0x00df69d4,0x995e6170
	.word  0x0b92c137,0x6527dc13,0xe56302d8,0x98a41b97
	.word  0x3a5a6611,0x016957c8,0x40a31188,0xa9cfbc15
	.word  0x5070bca1,0xef8526d6,0x17eac8a3,0xcf4ecb9a
	.word  0x4019a75c,0x01ea34a9,0xb19d0dd1,0x417d7ebe
	.word  0xdcd60f32,0x114904d1,0xa742fd24,0x02de1214
	.word  0x6d4dcab3,0x7e211edc,0x0632697b,0x041757db
	.word  0x61592311,0xdbca4027,0x5f521cb0,0x9d107617
	.word  0xb102efbd,0x1cf6829e,0x01ce9e3e,0xe25027c3
	.word  0xb57c01ca,0x5e52bc28,0xe0bfb875,0x07f7400b
	.word  0xaf55d5d9,0xb321c204,0x4ae4f415,0x374c159e
	.word  0x7334a2d1,0x964fab65,0x54ea027e,0x637a790f
	.word  0x453189dc,0xa1bb2fbe,0x6abf7ea2,0x587abfa5
	.word  0x1eadd79f,0x56017d2a,0x3b0909b2,0x89fb55f3
	.word  0x3d1c2d29,0x4d359839,0x00bd97b6,0xe78d0ea0
	.word  0x4488fe38,0x86848f47,0xa0b3fe07,0xfe637e5f
	.word  0xc85335a0,0x230e4c01,0xb55a9bd2,0xf36a7de6
	.word  0x8cb293e8,0xa2edb577,0x48e69155,0x244c4cca
	.word  0xb7991061,0xdb132f18,0x1949fc9a,0x2f438e10
	.word  0xc82f2534,0x02fd0848,0xda043fd6,0xb8f0d0fa
	.word  0x688735bd,0xd6c34088,0x42750401,0xf2a04ccc
	.word  0xe949c6ee,0xbc24d705,0x5407a86d,0x2cc01296
	.word  0x81fc85d5,0x9c1ad945,0xbdc44f67,0x61b51d81
	.word  0x53eaa0f7,0xf4ec438a,0x6b3fdf1f,0xb9fda419
	.word  0xe5c64ecf,0x9d67109c,0xce355bcd,0xfd405176
	.word  0x13768b4e,0x04d2f53c,0x82bd9e73,0xb3a2985d
	.word  0x96ae6f8b,0x8c093a52,0x67abd09e,0xc796c37e
	.word  0x235276cf,0x568b053c,0xf0dc3712,0x91536050
	.word  0xe760ca7c,0xf25d3508,0xa301b7cf,0xf3092d96
	.word  0x66f6faf8,0x06ba3025,0x708a1fbf,0xdc2a6a83
	.word  0xa7afef01,0xbea985da,0xd86269b5,0x2acbfc36
	.word  0x8a58a4a1,0x113df838,0xfcbe16b3,0x0cfd2aa9
	.word  0xc0c0f6df,0xb542d34e,0xe02ce57c,0x09c9137b
	.word  0x7fe2dd9e,0x1f19e027,0x6b4b5347,0x0f6bb215
	.word  0x2421001a,0xe210ca41,0x30266e1b,0xe5459787
	.word  0xff996a11,0xa2b077b8,0x27590d4d,0xda138db9
	.word  0xad714709,0xdab53a46,0xff9e2bef,0xec3048a5
	.word  0xd6f6e3c2,0x0752ca11,0xc679c213,0x4af83bc5
	.word  0xfa859cae,0x9a2c1380,0x35f937d7,0xaeb571ba
	.word  0xa7851208,0x74368d32,0x829fabfc,0xa7cb84b2
	.word  0x19be8cea,0x4df93dcb,0x355980ca,0x139ae34f
	.word  0xabb07785,0x879be7ba,0xb9d4c470,0xd53c0d8f
	.word  0xc3e87614,0xd1ad38e4,0x4bdad0ec,0xf8d8c216
	.word  0xca9384cd,0xe892a93a,0x1e357600,0xaf5dda51
	.word  0x2b85c678,0xe93122cc,0xaf0e4b9c,0x12b155f4
	.word  0xe2de6cb9,0xc4fa1dd4,0xcd58775e,0x11b6767b
	.word  0x73ea39cd,0x711c5ee5,0x63201a9c,0x8d668d1e
	.word  0xe7fd2774,0xad85c940,0x306540e4,0x9586a5f0
	.word  0x2db8aab1,0xddfef07f,0x8c99b390,0x7b7332ec
	.word  0x121ec3a6,0x0f8143d9,0x13575178,0xe9b193e9
	.word  0xd5f7d992,0xbe887c34,0xaa6a28c2,0xa090e9b5
	.word  0xf896c8f8,0x605a90df,0x580ddc0b,0xc2fb5bfb
	.word  0x80dbdb60,0xd3da3f07,0x2d30bea4,0xaaa7e9b3
	.word  0x0059ff50,0xa5e51cec,0x721552e9,0x5cad153b
	.word  0xb760cffc,0x15a1380b,0xaeb95244,0x1d7cfd2d
	.word  0x6048f762,0x09dd320f,0xe352451c,0x3bc99e20
	.word  0x48e4d8bf,0x7e0aa4ec,0xe4481443,0x206254ef
	.word  0x312701de,0x352d79e0,0x9926ed59,0x77a6ff73
	.word  0x867744da,0x6487b024,0x9905c149,0x45a898bb
	.word  0xb433d002,0xa2a0e9ff,0x450406e3,0xe276c0fa
	.word  0xacf11fde,0xdbd3877d,0x54666b5f,0xd9aa083a
	.word  0x04f7e202,0x2026f80c,0x4c821430,0xd6e0fcc3
	.word  0xb6feca66,0xd1a117e9,0xf7f21fb3,0x1bc42573
	.word  0x6ef303a5,0x0e1899a5,0x1bd62afb,0x4a7cd037
	.word  0x8c8517c7,0x78711f36,0xfafd1557,0x16ee8115
	.word  0xa98d9f68,0x89ceb017,0x9cc1eab4,0xc172f083
	.word  0x2bf6b5c8,0xba2b85b9,0x734bd7d1,0x1eb4532f
	.word  0x5194fcb3,0xd3fdf359,0x3da3efde,0x42618fc0
	.word  0x8c4c84f0,0x37b8279d,0xdcdcd7be,0x57459a21
	.word  0xa8afe461,0x15b5db46,0xc233a668,0xea8ec176
	.word  0x0e6ca6dc,0x43031f19,0x30f35f4e,0xaf0a25af
	.word  0x647932b7,0x44d4793b,0xa37d0196,0xce37863c
	.word  0xdfcffb68,0x418016cb,0xbc5f71b3,0x4a5f7d6a
	.word  0xfdf1780c,0x502c5761,0xe8e5e8b9,0x7898bbe8
	.word  0xf8b53179,0xcc4af776,0x37d4eac9,0xfa6d20a2
	.word  0x6d11259d,0xe6def245,0xe62abfec,0xe02640b1
	.word  0xe9ac2610,0xd5cfd881,0xf1aad805,0x7fa0aacb
	.word  0xcae80647,0x27796840,0x78d17836,0x0e2c7eb0
	.word  0xc3a6ff2b,0x2d5882ef,0xcee9f413,0x639af54a
	.word  0x9690d6f0,0x98713529,0x0e450c38,0x9c80f972
	.word  0xa554e58a,0x50453707,0xf0dd0b39,0xf817f23d
	.word  0xc148963a,0x5371777c,0xd6512138,0x8df88c33
	.word  0xa974b905,0x91b6f8e6,0x9b9aaf20,0xe96a896c
	.word  0x832ea73b,0x1e7a10d2,0x8b9be287,0x6208677d
	.word  0x831896f1,0x56f762d5,0x1d433a44,0xfa831f73
	.word  0xfca94986,0xf231a9b0,0xf645614a,0x0bd2adb5
	.word  0x980c5049,0x20513e50,0xe9a3da80,0x835065d6
	.word  0x6857b8b0,0xb13f190b,0x97877740,0x79399783
	.word  0x1905a5f1,0x699145cf,0x0cb2f3e9,0x13c54959
	.word  0x900fc420,0x4a32cfc9,0x4cc38afa,0x33a28b56
	.word  0x30a44965,0xd5ab7227,0x2c85800a,0xf3f6e2df
	.word  0x29e6200f,0x786c7086,0x4760afbc,0xbcd9594c
	.word  0xf3a484fe,0x674b7d21,0x5e33a4a2,0xa18ceaf5
	.word  0xfa1fb0f1,0xdcd946db,0x8fbf2f20,0xc8d0917d
	.word  0x9b431455,0x5cd93dcc,0x10c87fd0,0x4c30033e
	.word  0x71da1fb1,0x0b12b8c6,0x94a530a4,0x3dea4e10
	.word  0xc9e4c762,0x5c9ff636,0xfbdd8792,0x6474b4a1
	.word  0xf4a567bf,0x0ee1e857,0x2322e440,0x430e394e
	.word  0x36a3dca7,0x43dd27a4,0x99afb12a,0x90f54fe9
	.word  0x3d74e681,0x98c2de20,0xbf4cde68,0xe1f6a1f9
	.word  0x216ece3d,0x8ecd4c40,0x0c9ecb24,0xf8641a57
	.word  0x0f808d93,0x94c6216c,0x092c6ac5,0x01d38def
	.word  0xb24c57f4,0x3f885700,0x162f29f4,0x3c30491c
	.word  0xd0dca5e8,0x631eb0fa,0xebb6e38e,0x9ca85f02
	.word  0xdf83b9ab,0x0762cbac,0x83633063,0xc40f2826
	.word  0x867625d5,0x2416d409,0x93b594ee,0x6ca6b32b
	.word  0x06856f76,0x31840e80,0x9a9bd332,0xf68aad5f
	.word  0xcbe64673,0xfaf14807,0x84aa312f,0xe8901068
	.word  0x7c6dcf92,0xd7fbd344,0xd9aa5d45,0xbdbf9979
	.word  0xe22914e1,0xa56ee76e,0xc98fbd28,0x0832acc2
	.word  0x0d04b05a,0x2f077d27,0x7e22b265,0xbef844f9
	.word  0x4eeaa546,0xd51cc264,0x389b79f3,0x3229fc01
	.word  0x67ca91ed,0xe9dc02ef,0x6f833f82,0xa2589a7a
	.word  0xae015164,0x1a8533c6,0xcd159a90,0xecabe2dc
	.word  0x832a457d,0x93dd6a57,0x36500840,0x3ce50c33
	.word  0xbbb5f8b0,0x8603ade7,0x8f4279d3,0x9cece17c
	.word  0x6851d4a0,0x46820197,0xac3cc3ac,0x0115749f
	.word  0xbb94be9d,0xaadfc648,0x43801c68,0xd61dd33c
	.word  0xa889b63e,0x02d5894c,0xb563291a,0xd3e9d91c
	.word  0x729b2b54,0x9386bbc7,0x47ee6a1e,0x9991237b
	.word  0xb95d8e56,0x38268cd0,0x76acd0ec,0xf45a7bc3
	.word  0xb610b36c,0x5d94cea9,0x07aa7853,0x4b0ef2e9
	.word  0x1fbb9a73,0xa4f19bc4,0x948f7433,0x394518df
	.word  0x72f2f70c,0x344b56b1,0xbc27dd59,0xe3e0f8f6
	.word  0x003d93e1,0x5f17fb22,0x53ba1eed,0xc0410d6b
	.word  0x6307bb3e,0xabe58eb8,0xd42b7475,0xc258f1a0
	.word  0x64782d39,0xd3b0a46d,0x624006eb,0x26120557
	.word  0x4a571044,0x01dc9d71,0x1ba46c7f,0xf5f42cb6
	.word  0x8eac4cc9,0x18b47b44,0x40adcad9,0x287cfd03
	.word  0xdf1c3dab,0xa8f4ac44,0x7f2b1c43,0x763add7b
	.word  0xb4bd9c5d,0x333efe50,0xb094fd30,0x71e16397
	.word  0x66a74a6b,0xc1a0da91,0x7c5ff885,0x0acf6bcb
	.word  0x594cee0d,0x97ea941a,0xa645ff4e,0x1ee714e1
	.word  0xa0571a39,0x4895b625,0x67056923,0xc23ceed7
	.word  0x97d4f08f,0x044830a8,0xdebfc6aa,0x7f736e6c
	.word  0x0b8e6577,0x4bebb4af,0xaa3d11a0,0x39181662
	.word  0x7e2e81c7,0xe2c8d0e7,0xb3b30082,0x77ce7274
	.word  0x20304925,0x9c058096,0xaabc57c3,0x956db011
	.word  0x7fef8458,0x0d0bbe62,0xd3c92181,0xacbe466f
	.word  0xc49a7f0d,0xca6d18fb,0x7c3e9e49,0xa22d15d2
	.word  0x2f606d6e,0x5fba75ea,0x3ea5eea5,0x15bd47af
	.word  0x4870019c,0x328b2380,0x7a60a832,0x8a9e8d34
	.word  0x10f3a4d1,0xb5f0b550,0x90ebc26f,0x53f53378
	.word  0x02edc491,0x54d67e95,0x5b9f392b,0x40617f95
	.word  0x7d329a50,0xac910bdb,0x2971839d,0xfdecf06f
	.word  0xed92a090,0xdf4c2039,0xd4e52bdd,0x8dead2e2
	.word  0xe543a378,0xb7b41570,0x92076fb7,0x1b64564c
	.word  0x8e302666,0xca923989,0x457d1809,0x613b037c
	.word  0x0889794b,0x552a4cfb,0x49d963dc,0xbc2ba97d
	.word  0x229db4dc,0xd814d207,0x9baaed90,0x51491288
	.word  0x3e9ed03c,0x91a7226d,0x46d7dce8,0xbcdd8424
	.word  0x091cd43d,0x203eec54,0xf153a47a,0x7f5e88e9
	.word  0x6a5e214a,0xd0c9c991,0x02d8e009,0x09cc2838
	.word  0xf23f8df2,0x8fef78d9,0x1d04e1ed,0x695cfdac
	.word  0x1e3eb1a5,0x1b68565e,0xd1feb461,0x81dcaa13
	.word  0xb07de9f9,0x3cd64cf6,0x4de3cdf2,0x16f6ceeb
	.word  0x5f1f2ace,0xf47a05d2,0xe6a48672,0xef63d87d
	.word  0x8b6867b6,0x03537b7f,0x09e2c81c,0xebb984a0
	.word  0x7d539bf8,0x4d210e74,0x822236d9,0x0066d938
	.word  0x27bb3451,0xb4fdabc4,0xb656e144,0x04421dc7
	.word  0x313482b0,0xe341586e,0x1adaa6a2,0x976ece31
	.word  0xe8742c90,0x95aa84cd,0x5abc86b9,0x8c39772e
	.word  0x9cde3c37,0x78769510,0x5827abc6,0xb7278117
	.word  0xcf908c47,0x414ff255,0x21feb7ad,0x853ef2e4
	.word  0x42444988,0xe486ac89,0xc07d6d8c,0xb2bd944c
	.word  0x92ac0c92,0x8e435477,0x4d48df28,0x7c6161f4



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
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_A, "1'br");  
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
!!#   IJ_bind_thread_group("diag.j", 67, th_div, 0x5);
!!#   IJ_bind_thread_group("diag.j", 68, th_evnt, 0xa);
!!#   IJ_bind_thread_group("diag.j", 69, th_all, 0xf);
!!# 
!!#   IJ_th_fork_group ("diag.j", 76, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 80, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 16; i < 32; i++) {
!!#      IJ_printf ("diag.j", 82, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 86, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 88, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 2; i < 9; i++) {
!!#      IJ_printf ("diag.j", 93, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join ("diag.j", 98,0xf);
!!#   IJ_th_start ("diag.j", 99,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 101, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 102, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 103, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 104, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 105, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 106, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 107, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 108, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 109, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 110, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 112, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 113, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 115, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 116, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# divs: mMETA0
!!# {
!!#     IJ_generate_from_token ("diag.j", 141,200, th_div, ijdefault,tUDIV_I, tUDIV_R, tSDIV_I, tSDIV_R, tSDIVX_R, tSDIVX_I, tUDIVX_R, tUDIVX_I, tUDIVcc_I, tUDIVcc_R, tSDIVcc_I, tSDIVcc_R, -1);;	
!!# }
!!# ;
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: alu_irf_err 
!!# //             {IJ_printf (th_evnt, "!alu_irf_err\n");}
!!#            | ldst_irf_err 
!!# //             {IJ_printf (th_evnt, "!ldst_irf_err\n");}
!!#            | ld_dc_err 
!!# //             {IJ_printf (th_evnt, "!ld_dc_err\n");}
!!#            | resum_intr 
!!# //             {IJ_printf (th_evnt, "!resum_err_err\n");}
!!#            | alu_burst
!!# //             {IJ_printf (th_evnt, "!alu_burst\n");}	    
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
!!#                   | d3 store_i %ropr  Ro_unaligned_addr
!!#                   | d4 store_i
!!# 		  | d6 irferr store_i  %ropr  Ro_unaligned_addr
!!# ;
!!# 
!!# ld_irferr_unalgn: irferr load 
!!#                   | d7 load %ropr  Ro_unaligned_addr
!!#                   | d8 load
!!# 		  | d9 irferr load  %ropr  Ro_unaligned_addr
!!# ;
!!# 
!!# ld_dc_err: dcerr load_r trpm_alu div_ic_err
!!# ;
!!# 
!!# resum_intr: mMETA16
!!# {
!!#   IJ_printf ("diag.j", 190, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf ("diag.j", 191, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(1, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA17
!!# { 
!!#    burst_cnt = random () % 5 + 3; 
!!#    IJ_generate_from_token ("diag.j", 199,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
!!# 			   tADDcc_I, tADDC_R, tADDC_I, tADDCcc_R, tADDCcc_I, tAND_R, 
!!# 			   tAND_I, tANDcc_R, tANDcc_I, tANDN_R, tANDN_I, tANDNcc_R, 
!!#                            tANDNcc_I, tOR_R, tOR_I, tORcc_R, tORcc_I, tORN_R, tORN_I, 
!!#  			   tORNcc_R, tORNcc_I, tXOR_R, tXOR_I, tXORcc_R, tXORcc_I, 
!!# 			   tXNOR_R, tXNOR_I, tXNORcc_R, tXNORcc_I, tMOVcc_R, tMOVcc_I, 
!!#                            tMOVR_R, tMOVR_I, tSLL_R, tSLL_I, tSRL_R, tSRL_I, tSRA_R, 
!!#                            tSRA_I, tSLLX_R, tSLLX_I, tSRLX_R, tSRLX_I, tSRAX_R, 
!!#                            tSRAX_I, tSUB_R, tSUB_I, tSUBcc_R, tSUBcc_I, tSUBC_R, tSUBC_I, -1);;
!!# //                           tSUBCcc_R, tSUBCcc_R, tSUBCcc_I);
!!# }
!!# ;
!!# 
!!# icerr: mMETA18
!!# {
!!#    IJ_printf ("diag.j", 206, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 3;
!!#    if (i == 0) {
!!# //      IJ_printf (th_evnt, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 211, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!# //      IJ_printf (th_evnt, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 215, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!# //      IJ_printf (th_evnt, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 220, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA19
!!# {
!!#    IJ_printf ("diag.j", 228, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 230, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf ("diag.j", 237, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!# //     bitnum = random () % 72;
!!#      bitnum = random () % 70;
!!#      IJ_printf ("diag.j", 240, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# trpm_alu: d10 alu 
!!#           | d5 alu %ropr  Ro_rsvd_set
!!# ;
!!# 
!!# div: d11 div_tokens
!!# {
!!#    IJ_generate ("diag.j", 251, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# div_tokens: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!!# 
!!# load: d12 load_r_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 261, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!#       | d12 load_i_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 266, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!# ;
!!# 
!!# load_r: d13 load_r_tokens %ropr  Ro_load_r
!!# {
!!#    IJ_generate ("diag.j", 273, th_evnt, $2);
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
!!#    IJ_generate ("diag.j", 288, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# store_i_tokens: tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# ;
!!# 
!!# alu: d15 alu_tokens
!!# {
!!#    IJ_generate ("diag.j", 298, th_evnt, $2);
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

