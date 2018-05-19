// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: paul_bug4135_1.s
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
   random seed:	536895751
   Jal retr_fpop.j:	
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
	setx  0xe242359d5b3aa1f5, %r16, %r16
	setx  0x7d1c306be0072e16, %r16, %r17
	setx  0x768c75caa9078272, %r16, %r18
	setx  0x2f593a8aaa5a3779, %r16, %r19
	setx  0x9d5b5ac5d7d69a36, %r16, %r20
	setx  0xa75ffe9f3d2ebacb, %r16, %r21
	setx  0xaa426347bbc2f93b, %r16, %r22
	setx  0xf1942d00e0dc6a06, %r16, %r23
	setx  0x8295d333c5771306, %r16, %r24
	setx  0x338c9aed1e7b05a2, %r16, %r25
	setx  0xe4673b7a37c0f7ad, %r16, %r26
	setx  0x8920f02962ce0fb5, %r16, %r27
	setx  0xdd3ddbf57837dc3a, %r16, %r28
	setx  0xdbcce0db091a436c, %r16, %r29
	setx  0xb1ee5b294eadf42c, %r16, %r30
	setx  0x5d4de5a24e532201, %r16, %r31
	setx  0x0000000000000140, %r16, %r9
	setx  0x00000000000000e0, %r16, %r10
	setx  0x0000000000000b00, %r16, %r11
	setx  0x0000000000000730, %r16, %r12
	setx  0x00000000000007b0, %r16, %r13
	setx  0x0000000000000c00, %r16, %r14
	setx  0x0000000000000600, %r16, %r15
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
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xbe11400f  ! 2: OR_R	or 	%r5, %r15, %r31
	.word 0xa7641809  ! 2: MOVcc_R	<illegal instruction>
	.word 0xb331c00c  ! 2: SRL_R	srl 	%r7, %r12, %r25
	.word 0xaf643801  ! 2: MOVcc_I	<illegal instruction>
	.word 0xbcc1000a  ! 2: ADDCcc_R	addccc 	%r4, %r10, %r30
	.word 0xaa422979  ! 2: ADDC_I	addc 	%r8, 0x0979, %r21
	.word 0xbc19000d  ! 2: XOR_R	xor 	%r4, %r13, %r30
	.word 0xb441aed3  ! 2: ADDC_I	addc 	%r6, 0x0ed3, %r26
	.word 0xfe3165c6  ! 5: STH_I	sth	%r31, [%r5 + 0x05c6]
	.word 0xa331e061  ! 8: SRL_I	srl 	%r7, 0x0001, %r17
	.word 0xb3643801  ! 10: MOVcc_I	<illegal instruction>
thr1_ic_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xb7a1c9cb  ! 13: FDIVd	fdivd	%f38, %f42, %f58
.align 0x8
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xf629e629  ! 18: STB_I	stb	%r27, [%r7 + 0x0629]
	.word 0x30800003  ! 20: BA	ba,a	<label_0x3>
thr1_ic_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xe919e1d0  ! 22: LDDF_I	ldd	[%r7, 0x01d0], %f20
	.word 0xbf643801  ! 24: MOVcc_I	<illegal instruction>
thr1_ic_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xbe812eab  ! 27: ADDcc_I	addcc 	%r4, 0x0eab, %r31
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xa89a2bea  ! 29: XORcc_I	xorcc 	%r8, 0x0bea, %r20
	.word 0xbd28f001  ! 29: SLLX_I	sllx	%r3, 0x0001, %r30
	.word 0xbc08800a  ! 29: AND_R	and 	%r2, %r10, %r30
	.word 0xb681c00a  ! 29: ADDcc_R	addcc 	%r7, %r10, %r27
	.word 0xacc0800b  ! 29: ADDCcc_R	addccc 	%r2, %r11, %r22
	.word 0xa8092f36  ! 29: AND_I	and 	%r4, 0x0f36, %r20
	.word 0xbc916fe9  ! 29: ORcc_I	orcc 	%r5, 0x0fe9, %r30
	.word 0xaa98e5a5  ! 29: XORcc_I	xorcc 	%r3, 0x05a5, %r21
	.word 0xb608800c  ! 29: AND_R	and 	%r2, %r12, %r27
	.word 0xbb391009  ! 29: SRAX_R	srax	%r4, %r9, %r29
	.word 0xb4b1e553  ! 29: ORNcc_I	orncc 	%r7, 0x0553, %r26
	.word 0xa641c009  ! 29: ADDC_R	addc 	%r7, %r9, %r19
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,30)
	.word 0xe81a0000  ! 32: LDD_R	ldd	[%r8 + %r0], %r20
	.word 0xbf38c06c  ! 35: SRA_R	sra 	%r3, %r12, %r31
	.word 0xff01ec8c  ! 38: LDF_I	ld	[%r7, 0x0c8c], %f31
 .align 0x20
 .skip 0x14
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,39)
	.word 0xe0518000  ! 42: LDSH_R	ldsh	[%r6 + %r0], %r16
	.word 0xa69923f2  ! 45: XORcc_I	xorcc 	%r4, 0x03f2, %r19
	.word 0xada0c94b  ! 48: FMULd	fmuld	%f34, %f42, %f22
 .align 0x20
 .skip 0x10
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xa030ee9b  ! 52: ORN_I	orn 	%r3, 0x0e9b, %r16
	.word 0xb2a8e96f  ! 55: ANDNcc_I	andncc 	%r3, 0x096f, %r25
	.word 0xa3396001  ! 57: SRA_I	sra 	%r5, 0x0001, %r17
thr1_ic_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xfb20800d  ! 60: STF_R	st	%f29, [%r13, %r2]
 .align 0x20
 .skip 0x14
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,17)
	.word 0xe0418000  ! 64: LDSW_R	ldsw	[%r6 + %r0], %r16
	.word 0xa000c00a  ! 67: ADD_R	add 	%r3, %r10, %r16
	.word 0xbfa148ac  ! 70: FSUBs	fsubs	%f5, %f12, %f31
thr1_ic_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xaa01000a  ! 73: ADD_R	add 	%r4, %r10, %r21
.align 0x8
	.word 0xea7128ed  ! 77: STX_I	stx	%r21, [%r4 + 0x08ed]
	.word 0x30800003  ! 79: BA	ba,a	<label_0x3>
thr1_ic_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xf101c00e  ! 81: LDF_R	ld	[%r7, %r14], %f24
	.word 0xa938e001  ! 83: SRA_I	sra 	%r3, 0x0001, %r20
thr1_ic_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR,5,x)
	.word 0xaf78a401  ! 86: MOVR_I	move	%r2, 0x1, %r23
.align 0x8
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16),1,IRF,ce,0,x, x,x,x, x,x,x)
	.word 0xee30ac3a  ! 90: STH_I	sth	%r23, [%r2 + 0x0c3a]
	.word 0x10800003  ! 92: BA	ba  	<label_0x3>
thr1_ic_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,IR_NIR,26,13)
	.word 0xe300ac78  ! 94: LDF_I	ld	[%r2, 0x0c78], %f17
	.word 0xb8a8e5a5  ! 96: ANDNcc_I	andncc 	%r3, 0x05a5, %r28
thr1_ic_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xba81ecd6  ! 99: ADDcc_I	addcc 	%r7, 0x0cd6, %r29
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xa281a130  ! 101: ADDcc_I	addcc 	%r6, 0x0130, %r17
	.word 0xbe008009  ! 101: ADD_R	add 	%r2, %r9, %r31
	.word 0xa409c00b  ! 101: AND_R	and 	%r7, %r11, %r18
	.word 0xac91ae8b  ! 101: ORcc_I	orcc 	%r6, 0x0e8b, %r22
	.word 0xb928c00b  ! 101: SLL_R	sll 	%r3, %r11, %r28
	.word 0xb219ee82  ! 101: XOR_I	xor 	%r7, 0x0e82, %r25
	.word 0xbab166b7  ! 101: ORNcc_I	orncc 	%r5, 0x06b7, %r29
	.word 0xb439616c  ! 101: XNOR_I	xnor 	%r5, 0x016c, %r26
	.word 0xb7643801  ! 101: MOVcc_I	<illegal instruction>
 .align 0x20
 .skip 0x10
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xb099ae77  ! 104: XORcc_I	xorcc 	%r6, 0x0e77, %r24
	.word 0xa9398009  ! 107: SRA_R	sra 	%r6, %r9, %r20
	.word 0xb61968aa  ! 109: XOR_I	xor 	%r5, 0x08aa, %r27
	.word 0xa7a1894e  ! 112: FMULd	fmuld	%f6, %f14, %f50
thr1_ic_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xa4b8c00a  ! 115: XNORcc_R	xnorcc 	%r3, %r10, %r18
	.word 0xa602000e  ! 117: ADD_R	add 	%r8, %r14, %r19
	.word 0xacb1c00e  ! 117: ORNcc_R	orncc 	%r7, %r14, %r22
	.word 0xb6a9ef33  ! 117: ANDNcc_I	andncc 	%r7, 0x0f33, %r27
	.word 0xab30900e  ! 117: SRLX_R	srlx	%r2, %r14, %r21
	.word 0xad28800c  ! 117: SLL_R	sll 	%r2, %r12, %r22
.align 0x8
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16),1,IRF,ce,45,x, x,x,x, x,x,x)
	.word 0xf630a26e  ! 120: STH_I	sth	%r27, [%r2 + 0x026e]
	.word 0x10800003  ! 122: BA	ba  	<label_0x3>
thr1_ic_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xf321e06c  ! 124: STF_I	st	%f25, [0x006c, %r7]
	.word 0xb4b1c00c  ! 126: ORNcc_R	orncc 	%r7, %r12, %r26
thr1_ic_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR,32,x)
	.word 0xae316a24  ! 129: SUBC_I	orn 	%r5, 0x0a24, %r23
.align 0x8
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16),1,IRF,ce,70,x, x,x,x, x,x,x)
	.word 0xe820ac20  ! 133: STW_I	stw	%r20, [%r2 + 0x0c20]
	.word 0x30800003  ! 135: BA	ba,a	<label_0x3>
thr1_ic_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xe1192250  ! 137: LDDF_I	ldd	[%r4, 0x0250], %f16
	.word 0xaa28800b  ! 139: ANDN_R	andn 	%r2, %r11, %r21
thr1_ic_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xa23a25d6  ! 142: XNOR_I	xnor 	%r8, 0x05d6, %r17
	.word 0xacb8a69e  ! 144: XNORcc_I	xnorcc 	%r2, 0x069e, %r22
	.word 0xbc89c00c  ! 144: ANDcc_R	andcc 	%r7, %r12, %r30
	.word 0xb6c1ae4b  ! 144: ADDCcc_I	addccc 	%r6, 0x0e4b, %r27
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16),1,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xf629a369  ! 148: STB_I	stb	%r27, [%r6 + 0x0369]
	.word 0xa33a3061  ! 151: SRAX_I	srax	%r8, 0x0021, %r17
	.word 0xa8b1ebcf  ! 153: ORNcc_I	orncc 	%r7, 0x0bcf, %r20
thr1_ic_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xf520e378  ! 156: STF_I	st	%f26, [0x0378, %r3]
.align 0x8
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xf421e298  ! 160: STW_I	stw	%r26, [%r7 + 0x0298]
	.word 0x10800003  ! 162: BA	ba  	<label_0x3>
thr1_ic_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xb5a1c94e  ! 164: FMULd	fmuld	%f38, %f14, %f26
	.word 0xb739a001  ! 166: SRA_I	sra 	%r6, 0x0001, %r27
thr1_ic_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,5,29)
	.word 0xb429400e  ! 169: ANDN_R	andn 	%r5, %r14, %r26
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xb564180f  ! 171: MOVcc_R	<illegal instruction>
	.word 0xa888c00b  ! 171: ANDcc_R	andcc 	%r3, %r11, %r20
	.word 0xa930c00b  ! 171: SRL_R	srl 	%r3, %r11, %r20
	.word 0xbeb8e1dd  ! 171: XNORcc_I	xnorcc 	%r3, 0x01dd, %r31
	.word 0xa40a23d4  ! 171: AND_I	and 	%r8, 0x03d4, %r18
	.word 0xa6c1a12c  ! 171: ADDCcc_I	addccc 	%r6, 0x012c, %r19
	.word 0xa200800e  ! 171: ADD_R	add 	%r2, %r14, %r17
	.word 0xb0a8c00f  ! 171: ANDNcc_R	andncc 	%r3, %r15, %r24
	.word 0xb0b2000b  ! 171: ORNcc_R	orncc 	%r8, %r11, %r24
	.word 0xb2814009  ! 171: ADDcc_R	addcc 	%r5, %r9, %r25
	.word 0xb130a001  ! 171: SRL_I	srl 	%r2, 0x0001, %r24
	.word 0xb428e9ce  ! 171: ANDN_I	andn 	%r3, 0x09ce, %r26
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xf400eb3b  ! 175: LDUW_I	lduw	[%r3 + 0x0b3b], %r26
	.word 0xfb39400c  ! 178: STDF_R	std	%f29, [%r12, %r5]
thr1_ic_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,IR,18,x)
	.word 0xb8a9800a  ! 181: ANDNcc_R	andncc 	%r6, %r10, %r28
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0xa60a2165  ! 183: AND_I	and 	%r8, 0x0165, %r19
	.word 0xae98a774  ! 183: XORcc_I	xorcc 	%r2, 0x0774, %r23
	.word 0xb882000f  ! 183: ADDcc_R	addcc 	%r8, %r15, %r28
	.word 0xbf31c00f  ! 183: SRL_R	srl 	%r7, %r15, %r31
	.word 0xbaaa000f  ! 183: ANDNcc_R	andncc 	%r8, %r15, %r29
	.word 0xa929e001  ! 183: SLL_I	sll 	%r7, 0x0001, %r20
	.word 0xb539a001  ! 183: SRA_I	sra 	%r6, 0x0001, %r26
	.word 0xac88a188  ! 183: ANDcc_I	andcc 	%r2, 0x0188, %r22
	.word 0xb428a87f  ! 183: ANDN_I	andn 	%r2, 0x087f, %r26
	.word 0xaab0a16f  ! 183: ORNcc_I	orncc 	%r2, 0x016f, %r21
	.word 0xab38a001  ! 183: SRA_I	sra 	%r2, 0x0001, %r21
	.word 0xa579840e  ! 184: MOVR_R	move	%r6, %r14, %r18
	.word 0xa339800a  ! 184: SRA_R	sra 	%r6, %r10, %r17
	.word 0xa764180d  ! 184: MOVcc_R	<illegal instruction>
 .align 0x20
 .skip 0x10
	.word 0xe631aeff  ! 187: STH_I	sth	%r19, [%r6 + 0x0eff]
	.word 0xb2b12a2e  ! 190: ORNcc_I	orncc 	%r4, 0x0a2e, %r25
	.word 0xa6a9abc8  ! 192: ANDNcc_I	andncc 	%r6, 0x0bc8, %r19
thr1_ic_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xe5222eb4  ! 195: STF_I	st	%f18, [0x0eb4, %r8]
	.word 0xa739800c  ! 197: SRA_R	sra 	%r6, %r12, %r19
	.word 0xad28c00b  ! 197: SLL_R	sll 	%r3, %r11, %r22
	.word 0xa732000a  ! 197: SRL_R	srl 	%r8, %r10, %r19
	.word 0xbf30c00b  ! 197: SRL_R	srl 	%r3, %r11, %r31
 .align 0x20
 .skip 0x10
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16),1,IRF,ce,68,x, x,x,x, x,x,x)
	.word 0xe270a898  ! 200: STX_I	stx	%r17, [%r2 + 0x0898]
	.word 0xa009eef0  ! 203: AND_I	and 	%r7, 0x0ef0, %r16
	.word 0xb098ad63  ! 205: XORcc_I	xorcc 	%r2, 0x0d63, %r24
thr1_ic_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xa3a089a9  ! 208: FDIVs	fdivs	%f2, %f9, %f17
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xa2896784  ! 210: ANDcc_I	andcc 	%r5, 0x0784, %r17
	.word 0xb0120009  ! 210: OR_R	or 	%r8, %r9, %r24
	.word 0xaa10800b  ! 210: OR_R	or 	%r2, %r11, %r21
	.word 0xa538900a  ! 210: SRAX_R	srax	%r2, %r10, %r18
	.word 0xa69167ea  ! 210: ORcc_I	orcc 	%r5, 0x07ea, %r19
	.word 0xab29e001  ! 210: SLL_I	sll 	%r7, 0x0001, %r21
	.word 0xa2c1000f  ! 210: ADDCcc_R	addccc 	%r4, %r15, %r17
	.word 0xa639400f  ! 210: XNOR_R	xnor 	%r5, %r15, %r19
	.word 0xa491ea29  ! 210: ORcc_I	orcc 	%r7, 0x0a29, %r18
	.word 0xbe11800c  ! 211: OR_R	or 	%r6, %r12, %r31
	.word 0xbab0a140  ! 211: ORNcc_I	orncc 	%r2, 0x0140, %r29
	.word 0xa4308009  ! 211: ORN_R	orn 	%r2, %r9, %r18
	.word 0xb6b9000a  ! 211: XNORcc_R	xnorcc 	%r4, %r10, %r27
	.word 0xb329100c  ! 212: SLLX_R	sllx	%r4, %r12, %r25
	.word 0xb779040f  ! 212: MOVR_R	move	%r4, %r15, %r27
	.word 0xa029a347  ! 212: ANDN_I	andn 	%r6, 0x0347, %r16
	.word 0xb09a23a1  ! 212: XORcc_I	xorcc 	%r8, 0x03a1, %r24
	.word 0xa138c00e  ! 212: SRA_R	sra 	%r3, %r14, %r16
.align 0x8
	.word 0xe030ef0d  ! 215: STH_I	sth	%r16, [%r3 + 0x0f0d]
	.word 0x10800003  ! 217: BA	ba  	<label_0x3>
thr1_ic_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,IR,31,x)
	.word 0xb7a2092d  ! 219: FMULs	fmuls	%f8, %f13, %f27
	.word 0xbe08e1ed  ! 221: AND_I	and 	%r3, 0x01ed, %r31
thr1_ic_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xb609800d  ! 224: AND_R	and 	%r6, %r13, %r27
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	.word 0xb9643801  ! 226: MOVcc_I	<illegal instruction>
	.word 0xad323001  ! 226: SRLX_I	srlx	%r8, 0x0001, %r22
	.word 0xa5317001  ! 226: SRLX_I	srlx	%r5, 0x0001, %r18
	.word 0xaa18800c  ! 226: XOR_R	xor 	%r2, %r12, %r21
	.word 0xaf29a001  ! 226: SLL_I	sll 	%r6, 0x0001, %r23
	.word 0xb640c009  ! 226: ADDC_R	addc 	%r3, %r9, %r27
	.word 0xa732000a  ! 226: SRL_R	srl 	%r8, %r10, %r19
	.word 0xb72a3001  ! 226: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0xa3796401  ! 226: MOVR_I	move	%r5, 0x1, %r17
	.word 0xb60a26d5  ! 226: AND_I	and 	%r8, 0x06d5, %r27
 .align 0x20
 .skip 0x10
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16),1,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xf6722bff  ! 230: STX_I	stx	%r27, [%r8 + 0x0bff]
	.word 0xae80c06c  ! 233: ADDcc_R	addcc 	%r3, %r12, %r23
	.word 0xb8c0c009  ! 235: ADDCcc_R	addccc 	%r3, %r9, %r28
thr1_ic_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,11,26)
	.word 0xb9a148ad  ! 238: FSUBs	fsubs	%f5, %f13, %f28
.align 0x8
	.word 0xfa20ecc8  ! 242: STW_I	stw	%r29, [%r3 + 0x0cc8]
	.word 0x10800003  ! 244: BA	ba  	<label_0x3>
thr1_ic_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xef196780  ! 246: LDDF_I	ldd	[%r5, 0x0780], %f23
	.word 0xa4b8edc6  ! 248: XNORcc_I	xnorcc 	%r3, 0x0dc6, %r18
thr1_ic_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,IR,8,x)
	.word 0xa8396bf2  ! 251: XNOR_I	xnor 	%r5, 0x0bf2, %r20
	.word 0xb528e001  ! 253: SLL_I	sll 	%r3, 0x0001, %r26
	.word 0xaa99a33e  ! 253: XORcc_I	xorcc 	%r6, 0x033e, %r21
	.word 0xb0c16d55  ! 253: ADDCcc_I	addccc 	%r5, 0x0d55, %r24
 .align 0x20
 .skip 0x18
	.word 0xf841400c  ! 256: LDSW_R	ldsw	[%r5 + %r12], %r28
	.word 0xe920800a  ! 259: STF_R	st	%f20, [%r10, %r2]
.align 0x8
	.word 0xee316ce0  ! 263: STH_I	sth	%r23, [%r5 + 0x0ce0]
	.word 0x30800003  ! 265: BA	ba,a	<label_0x3>
thr1_ic_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xe538ac58  ! 267: STDF_I	std	%f18, [0x0c58, %r2]
	.word 0xb6a0ea01  ! 269: SUBcc_I	subcc 	%r3, 0x0a01, %r27
thr1_ic_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xae890009  ! 272: ANDcc_R	andcc 	%r4, %r9, %r23
 .align 0x20
 .skip 0x14
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,32)
	.word 0xe6490000  ! 276: LDSB_R	ldsb	[%r4 + %r0], %r19
	.word 0xbab0806d  ! 279: ORNcc_R	orncc 	%r2, %r13, %r29
	.word 0xf53a2f08  ! 282: STDF_I	std	%f26, [0x0f08, %r8]
 .align 0x20
 .skip 0x10
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xb080e5da  ! 286: ADDcc_I	addcc 	%r3, 0x05da, %r24
	.word 0xb8890009  ! 289: ANDcc_R	andcc 	%r4, %r9, %r28
	.word 0xae30a222  ! 291: SUBC_I	orn 	%r2, 0x0222, %r23
	.word 0xf320c00c  ! 294: STF_R	st	%f25, [%r12, %r3]
 .align 0x20
 .skip 0x18
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xf210c00c  ! 299: LDUH_R	lduh	[%r3 + %r12], %r25
thr1_ic_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,IR_NIR,13,7)
	.word 0xed21ac20  ! 302: STF_I	st	%f22, [0x0c20, %r6]
	.word 0xec01800c  ! 306: LDUW_R	lduw	[%r6 + %r12], %r22
thr1_ic_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,IR,12,x)
	.word 0xe9022368  ! 309: LDF_I	ld	[%r8, 0x0368], %f20
 .align 0x20
 .skip 0x10
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xb4b161a1  ! 313: ORNcc_I	orncc 	%r5, 0x01a1, %r26
	.word 0xbaa8c00f  ! 316: ANDNcc_R	andncc 	%r3, %r15, %r29
	.word 0xbac0e503  ! 318: ADDCcc_I	addccc 	%r3, 0x0503, %r29
	.word 0xa9a20829  ! 321: FADDs	fadds	%f8, %f9, %f20
thr1_ic_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_29), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xa528f001  ! 324: SLLX_I	sllx	%r3, 0x0001, %r18
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,24)
	.word 0xfe014000  ! 328: LDUW_R	lduw	[%r5 + %r0], %r31
	.word 0xa838c00a  ! 331: XNOR_R	xnor 	%r3, %r10, %r20
thr1_ic_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_30), 16, 16),1,IC_DATA,IR_NIR,15,7)
	.word 0xbda0c849  ! 334: FADDd	faddd	%f34, %f40, %f30
 .align 0x20
 .skip 0x18
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xe450c00f  ! 338: LDSH_R	ldsh	[%r3 + %r15], %r18
thr1_ic_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_31), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xfb20c00f  ! 341: STF_R	st	%f29, [%r15, %r3]
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,57)
	.word 0xfe090000  ! 345: LDUB_R	ldub	[%r4 + %r0], %r31
	.word 0xac38806f  ! 348: XNOR_R	xnor 	%r2, %r15, %r22
	.word 0xfb1a000a  ! 351: LDDF_R	ldd	[%r8, %r10], %f29
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	.word 0xa298c00a  ! 353: XORcc_R	xorcc 	%r3, %r10, %r17
	.word 0xbcb0ab2f  ! 353: ORNcc_I	orncc 	%r2, 0x0b2f, %r30
	.word 0xae3928dc  ! 353: XNOR_I	xnor 	%r4, 0x08dc, %r23
	.word 0xbcaa2a18  ! 353: ANDNcc_I	andncc 	%r8, 0x0a18, %r30
	.word 0xbe30800f  ! 353: ORN_R	orn 	%r2, %r15, %r31
	.word 0xbe09c00a  ! 353: AND_R	and 	%r7, %r10, %r31
	.word 0xa4b923b5  ! 353: XNORcc_I	xnorcc 	%r4, 0x03b5, %r18
	.word 0xbe81400a  ! 353: ADDcc_R	addcc 	%r5, %r10, %r31
	.word 0xbe1126dd  ! 353: OR_I	or 	%r4, 0x06dd, %r31
	.word 0xb2322d81  ! 353: ORN_I	orn 	%r8, 0x0d81, %r25
	.word 0xbab8c00c  ! 353: XNORcc_R	xnorcc 	%r3, %r12, %r29
	.word 0xbc010009  ! 354: ADD_R	add 	%r4, %r9, %r30
	.word 0xaa11a8db  ! 354: OR_I	or 	%r6, 0x08db, %r21
	.word 0xa738c00c  ! 354: SRA_R	sra 	%r3, %r12, %r19
	.word 0xb689e44f  ! 354: ANDcc_I	andcc 	%r7, 0x044f, %r27
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16),1,IRF,ce,37,x, x,x,x, x,x,x)
	.word 0xf631e1d5  ! 358: STH_I	sth	%r27, [%r7 + 0x01d5]
	.word 0xbb396001  ! 361: SRA_I	sra 	%r5, 0x0001, %r29
	.word 0xb539a001  ! 363: SRA_I	sra 	%r6, 0x0001, %r26
thr1_ic_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_32), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xe501000e  ! 366: LDF_R	ld	[%r4, %r14], %f18
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,2)
	.word 0xe6498000  ! 370: LDSB_R	ldsb	[%r6 + %r0], %r19
	.word 0xb6b96864  ! 373: XNORcc_I	xnorcc 	%r5, 0x0864, %r27
thr1_ic_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_33), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xe1192f40  ! 376: LDDF_I	ldd	[%r4, 0x0f40], %f16
	.word 0xa28a2c8a  ! 378: ANDcc_I	andcc 	%r8, 0x0c8a, %r17
	.word 0xb00225e3  ! 378: ADD_I	add 	%r8, 0x05e3, %r24
	.word 0xa01a28fe  ! 378: XOR_I	xor 	%r8, 0x08fe, %r16
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xaac1400d  ! 379: ADDCcc_R	addccc 	%r5, %r13, %r21
	.word 0xa880a7bb  ! 379: ADDcc_I	addcc 	%r2, 0x07bb, %r20
	.word 0xbec0e312  ! 379: ADDCcc_I	addccc 	%r3, 0x0312, %r31
	.word 0xba01400f  ! 379: ADD_R	add 	%r5, %r15, %r29
	.word 0xb0c1c00e  ! 379: ADDCcc_R	addccc 	%r7, %r14, %r24
	.word 0xb29a2109  ! 379: XORcc_I	xorcc 	%r8, 0x0109, %r25
	.word 0xbcb0ebaf  ! 379: ORNcc_I	orncc 	%r3, 0x0baf, %r30
	.word 0xa431800b  ! 379: ORN_R	orn 	%r6, %r11, %r18
	.word 0xb2b1c00f  ! 379: ORNcc_R	orncc 	%r7, %r15, %r25
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xf209e95b  ! 383: LDUB_I	ldub	[%r7 + 0x095b], %r25
	.word 0xf7392c38  ! 386: STDF_I	std	%f27, [0x0c38, %r4]
thr1_ic_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_34), 16, 16),1,IC_DATA,IR,8,x)
	.word 0xaaa1000e  ! 389: SUBcc_R	subcc 	%r4, %r14, %r21
.align 0x8
	.word 0xf820ae84  ! 393: STW_I	stw	%r28, [%r2 + 0x0e84]
	.word 0x10800003  ! 395: BA	ba  	<label_0x3>
thr1_ic_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_35), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xe33a27a0  ! 397: STDF_I	std	%f17, [0x07a0, %r8]
	.word 0xb728f001  ! 399: SLLX_I	sllx	%r3, 0x0001, %r27
thr1_ic_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_36), 16, 16),1,IC_DATA,IR_NIR,17,30)
	.word 0xb0220009  ! 402: SUB_R	sub 	%r8, %r9, %r24
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,14)
	.word 0xe409c000  ! 406: LDUB_R	ldub	[%r7 + %r0], %r18
	.word 0xa8a92170  ! 409: ANDNcc_I	andncc 	%r4, 0x0170, %r20
	.word 0xe120800e  ! 412: STF_R	st	%f16, [%r14, %r2]
	.word 0xa529100c  ! 414: SLLX_R	sllx	%r4, %r12, %r18
	.word 0xa130e001  ! 414: SRL_I	srl 	%r3, 0x0001, %r16
	.word 0xa130a001  ! 414: SRL_I	srl 	%r2, 0x0001, %r16
	.word 0xb8aa000e  ! 414: ANDNcc_R	andncc 	%r8, %r14, %r28
	.word 0xb92a0009  ! 415: SLL_R	sll 	%r8, %r9, %r28
	.word 0xbf293001  ! 415: SLLX_I	sllx	%r4, 0x0001, %r31
	.word 0xaf31400e  ! 415: SRL_R	srl 	%r5, %r14, %r23
	.word 0xaea8800b  ! 415: ANDNcc_R	andncc 	%r2, %r11, %r23
.align 0x8
	.word 0xee20a62f  ! 418: STW_I	stw	%r23, [%r2 + 0x062f]
	.word 0x10800003  ! 420: BA	ba  	<label_0x3>
thr1_ic_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_37), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xa1a2094e  ! 422: FMULd	fmuld	%f8, %f14, %f16
	.word 0xaaa9ee5b  ! 424: ANDNcc_I	andncc 	%r7, 0x0e5b, %r21
thr1_ic_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_38), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xb738900a  ! 427: SRAX_R	srax	%r2, %r10, %r27
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc19000d  ! 429: XOR_R	xor 	%r4, %r13, %r30
	.word 0xb21222be  ! 429: OR_I	or 	%r8, 0x02be, %r25
	.word 0xb5643801  ! 429: MOVcc_I	<illegal instruction>
	.word 0xa72a0009  ! 429: SLL_R	sll 	%r8, %r9, %r19
	.word 0xb928f001  ! 429: SLLX_I	sllx	%r3, 0x0001, %r28
	.word 0xa040800c  ! 429: ADDC_R	addc 	%r2, %r12, %r16
	.word 0xa331900d  ! 429: SRLX_R	srlx	%r6, %r13, %r17
	.word 0xbb31800e  ! 429: SRL_R	srl 	%r6, %r14, %r29
	.word 0xaa09400d  ! 429: AND_R	and 	%r5, %r13, %r21
	.word 0xa729e001  ! 429: SLL_I	sll 	%r7, 0x0001, %r19
	.word 0xa6ba000f  ! 429: XNORcc_R	xnorcc 	%r8, %r15, %r19
 .align 0x20
 .skip 0x14
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,62)
	.word 0xe41a0000  ! 432: LDD_R	ldd	[%r8 + %r0], %r18
	.word 0xa0a18009  ! 435: SUBcc_R	subcc 	%r6, %r9, %r16
	.word 0xfb22000a  ! 438: STF_R	st	%f29, [%r10, %r8]
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xbf29100e  ! 440: SLLX_R	sllx	%r4, %r14, %r31
	.word 0xb2b9c009  ! 440: XNORcc_R	xnorcc 	%r7, %r9, %r25
	.word 0xbe422da0  ! 440: ADDC_I	addc 	%r8, 0x0da0, %r31
	.word 0xa000c00e  ! 440: ADD_R	add 	%r3, %r14, %r16
	.word 0xbe922d73  ! 440: ORcc_I	orcc 	%r8, 0x0d73, %r31
	.word 0xa610800d  ! 440: OR_R	or 	%r2, %r13, %r19
	.word 0xac99aa55  ! 440: XORcc_I	xorcc 	%r6, 0x0a55, %r22
	.word 0xa129a001  ! 440: SLL_I	sll 	%r6, 0x0001, %r16
	.word 0xaf293001  ! 440: SLLX_I	sllx	%r4, 0x0001, %r23
	.word 0xee59000d  ! 443: LDX_R	ldx	[%r4 + %r13], %r23
thr1_ic_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_39), 16, 16),1,IC_DATA,IR_NIR,23,15)
	.word 0xf521e950  ! 446: STF_I	st	%f26, [0x0950, %r7]
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16),1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0xacc0efa2  ! 450: ADDCcc_I	addccc 	%r3, 0x0fa2, %r22
	.word 0xb52a3061  ! 453: SLLX_I	sllx	%r8, 0x0021, %r26
	.word 0xa281000f  ! 455: ADDcc_R	addcc 	%r4, %r15, %r17
	.word 0xa3a0c82b  ! 458: FADDs	fadds	%f3, %f11, %f17
thr1_ic_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_40), 16, 16),1,IC_DATA,IR_NIR,10,28)
	.word 0xae2221ca  ! 461: SUB_I	sub 	%r8, 0x01ca, %r23
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xab32000e  ! 463: SRL_R	srl 	%r8, %r14, %r21
	.word 0xb3643801  ! 463: MOVcc_I	<illegal instruction>
	.word 0xa831000c  ! 463: ORN_R	orn 	%r4, %r12, %r20
	.word 0xba41400b  ! 463: ADDC_R	addc 	%r5, %r11, %r29
	.word 0xa629000e  ! 463: ANDN_R	andn 	%r4, %r14, %r19
	.word 0xb419ec9d  ! 463: XOR_I	xor 	%r7, 0x0c9d, %r26
	.word 0xb681c00e  ! 463: ADDcc_R	addcc 	%r7, %r14, %r27
	.word 0xa364180b  ! 463: MOVcc_R	<illegal instruction>
	.word 0xbcba0009  ! 463: XNORcc_R	xnorcc 	%r8, %r9, %r30
	.word 0xbca8ebfa  ! 463: ANDNcc_I	andncc 	%r3, 0x0bfa, %r30
 .align 0x20
 .skip 0x14
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,46)
	.word 0xe2418000  ! 466: LDSW_R	ldsw	[%r6 + %r0], %r17
	.word 0xa019000c  ! 469: XOR_R	xor 	%r4, %r12, %r16
	.word 0xa9a2094a  ! 472: FMULd	fmuld	%f8, %f10, %f20
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xaf30800c  ! 474: SRL_R	srl 	%r2, %r12, %r23
	.word 0xb739500b  ! 474: SRAX_R	srax	%r5, %r11, %r27
	.word 0xbc392fbc  ! 474: XNOR_I	xnor 	%r4, 0x0fbc, %r30
	.word 0xbc31e314  ! 474: ORN_I	orn 	%r7, 0x0314, %r30
	.word 0xbf317001  ! 474: SRLX_I	srlx	%r5, 0x0001, %r31
	.word 0xa4920009  ! 474: ORcc_R	orcc 	%r8, %r9, %r18
	.word 0xa128900e  ! 474: SLLX_R	sllx	%r2, %r14, %r16
	.word 0xa6c22b59  ! 474: ADDCcc_I	addccc 	%r8, 0x0b59, %r19
	.word 0xe60a000e  ! 477: LDUB_R	ldub	[%r8 + %r14], %r19
thr1_ic_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_41), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xa7a1094c  ! 480: FMULd	fmuld	%f4, %f12, %f50
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xae32000b  ! 484: ORN_R	orn 	%r8, %r11, %r23
	.word 0xb0b96ee7  ! 487: XNORcc_I	xnorcc 	%r5, 0x0ee7, %r24
	.word 0xa7643801  ! 489: MOVcc_I	<illegal instruction>
	.word 0xe701800b  ! 492: LDF_R	ld	[%r6, %r11], %f19
 .align 0x20
 .skip 0x14
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,69)
	.word 0xe4114000  ! 496: LDUH_R	lduh	[%r5 + %r0], %r18
	.word 0xa0316dd5  ! 499: ORN_I	orn 	%r5, 0x0dd5, %r16
thr1_ic_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_42), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xb1a088af  ! 502: FSUBs	fsubs	%f2, %f15, %f24
	.word 0xb608c00e  ! 504: AND_R	and 	%r3, %r14, %r27
	.word 0xb4b1c009  ! 504: ORNcc_R	orncc 	%r7, %r9, %r26
	.word 0xaac1800b  ! 504: ADDCcc_R	addccc 	%r6, %r11, %r21
	.word 0xb088a8e6  ! 504: ANDcc_I	andcc 	%r2, 0x08e6, %r24
	.word 0xa6916528  ! 504: ORcc_I	orcc 	%r5, 0x0528, %r19
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16),1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xe6516ba3  ! 508: LDSH_I	ldsh	[%r5 + 0x0ba3], %r19
thr1_ic_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_43), 16, 16),1,IC_DATA,IR_NIR,16,21)
	.word 0xafa148ca  ! 511: FSUBd	fsubd	%f36, %f10, %f54
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,25)
	.word 0xec18c000  ! 515: LDD_R	ldd	[%r3 + %r0], %r22
	.word 0xa4310069  ! 518: ORN_R	orn 	%r4, %r9, %r18
	.word 0xa3a088ca  ! 521: FSUBd	fsubd	%f2, %f10, %f48
.align 0x8
	.word 0xe220a24d  ! 525: STW_I	stw	%r17, [%r2 + 0x024d]
	.word 0x10800003  ! 527: BA	ba  	<label_0x3>
thr1_ic_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_44), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xfb008009  ! 529: LDF_R	ld	[%r2, %r9], %f29
	.word 0xb729c00f  ! 531: SLL_R	sll 	%r7, %r15, %r27
thr1_ic_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_45), 16, 16),1,IC_DATA,IR_NIR,8,30)
	.word 0xbb78840e  ! 534: MOVR_R	move	%r2, %r14, %r29
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,68)
	.word 0xe01a0000  ! 538: LDD_R	ldd	[%r8 + %r0], %r16
	.word 0xbc2a25eb  ! 541: ANDN_I	andn 	%r8, 0x05eb, %r30
	.word 0xe53a2c78  ! 544: STDF_I	std	%f18, [0x0c78, %r8]
	.word 0xb12a3001  ! 546: SLLX_I	sllx	%r8, 0x0001, %r24
	.word 0xa6b9800a  ! 546: XNORcc_R	xnorcc 	%r6, %r10, %r19
	.word 0xb3322001  ! 546: SRL_I	srl 	%r8, 0x0001, %r25
	.word 0xf23224dd  ! 549: STH_I	sth	%r25, [%r8 + 0x04dd]
	.word 0xb8b8c00a  ! 552: XNORcc_R	xnorcc 	%r3, %r10, %r28
	.word 0xb038a33d  ! 554: XNOR_I	xnor 	%r2, 0x033d, %r24
thr1_ic_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_46), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xb1a0c84f  ! 557: FADDd	faddd	%f34, %f46, %f24
.align 0x8
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16),1,IRF,ce,65,x, x,x,x, x,x,x)
	.word 0xf028ef0f  ! 562: STB_I	stb	%r24, [%r3 + 0x0f0f]
	.word 0x10800003  ! 564: BA	ba  	<label_0x3>
thr1_ic_err_47:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_47), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xf339e610  ! 566: STDF_I	std	%f25, [0x0610, %r7]
	.word 0xb6c0800f  ! 568: ADDCcc_R	addccc 	%r2, %r15, %r27
thr1_ic_err_48:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_48), 16, 16),1,IC_DATA,IR_NIR,12,4)
	.word 0xa729000e  ! 571: SLL_R	sll 	%r4, %r14, %r19
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,67)
	.word 0xf8088000  ! 575: LDUB_R	ldub	[%r2 + %r0], %r28
	.word 0xa3291009  ! 578: SLLX_R	sllx	%r4, %r9, %r17
	.word 0xa3a1c8c9  ! 581: FSUBd	fsubd	%f38, %f40, %f48
thr1_ic_err_49:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_49), 16, 16),1,IC_DATA,IR,10,x)
	.word 0xa178c40f  ! 584: MOVR_R	move	%r3, %r15, %r16
 .align 0x20
 .skip 0x18
	.word 0xe058c00f  ! 588: LDX_R	ldx	[%r3 + %r15], %r16
	.word 0xf900c00f  ! 591: LDF_R	ld	[%r3, %r15], %f28
thr1_ic_err_50:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_50), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xbb31e001  ! 594: SRL_I	srl 	%r7, 0x0001, %r29
 .align 0x20
 .skip 0x10
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16),1,IRF,ce,28,x, x,x,x, x,x,x)
	.word 0xb008e91a  ! 598: AND_I	and 	%r3, 0x091a, %r24
	.word 0xbc088069  ! 601: AND_R	and 	%r2, %r9, %r30
	.word 0xb20a000e  ! 603: AND_R	and 	%r8, %r14, %r25
	.word 0xe73a000f  ! 606: STDF_R	std	%f19, [%r15, %r8]
	.word 0xec19800b  ! 610: LDD_R	ldd	[%r6 + %r11], %r22
thr1_ic_err_51:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_51), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xff20a934  ! 613: STF_I	st	%f31, [0x0934, %r2]
 .align 0x20
 .skip 0x18
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16),1,IRF,ce,61,x, x,x,x, x,x,x)
	.word 0xf4496522  ! 617: LDSB_I	ldsb	[%r5 + 0x0522], %r26
thr1_ic_err_52:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_52), 16, 16),1,IC_DATA,IR,28,x)
	.word 0xafa149c9  ! 620: FDIVd	fdivd	%f36, %f40, %f54
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xb92a2001  ! 622: SLL_I	sll 	%r8, 0x0001, %r28
	.word 0xb810c00a  ! 622: OR_R	or 	%r3, %r10, %r28
	.word 0xb729d009  ! 622: SLLX_R	sllx	%r7, %r9, %r27
	.word 0xbb3a2001  ! 622: SRA_I	sra 	%r8, 0x0001, %r29
	.word 0xa931a001  ! 622: SRL_I	srl 	%r6, 0x0001, %r20
	.word 0xa4310009  ! 622: ORN_R	orn 	%r4, %r9, %r18
	.word 0xa6a9e0dc  ! 622: ANDNcc_I	andncc 	%r7, 0x00dc, %r19
	.word 0xbc89400f  ! 622: ANDcc_R	andcc 	%r5, %r15, %r30
	.word 0xb529800c  ! 622: SLL_R	sll 	%r6, %r12, %r26
	.word 0xab643801  ! 622: MOVcc_I	<illegal instruction>
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16),1,IRF,ce,56,x, x,x,x, x,x,x)
	.word 0xf028aef6  ! 625: STB_I	stb	%r24, [%r2 + 0x0ef6]
	.word 0xbe32006d  ! 628: SUBC_R	orn 	%r8, %r13, %r31
	.word 0xbf28f001  ! 630: SLLX_I	sllx	%r3, 0x0001, %r31
thr1_ic_err_53:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_53), 16, 16),1,IC_DATA,IR_NIR,20,8)
	.word 0xb9a149c9  ! 633: FDIVd	fdivd	%f36, %f40, %f28
 .align 0x20
 .skip 0x18
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16),1,IRF,ce,16,x, x,x,x, x,x,x)
	.word 0xf859627d  ! 638: LDX_I	ldx	[%r5 + 0x027d], %r28
thr1_ic_err_54:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_54), 16, 16),1,IC_DATA,IR_NIR,4,18)
	.word 0xe11a27b0  ! 641: LDDF_I	ldd	[%r8, 0x07b0], %f16
	.word 0xb618ecbb  ! 643: XOR_I	xor 	%r3, 0x0cbb, %r27
	.word 0xaec1400a  ! 643: ADDCcc_R	addccc 	%r5, %r10, %r23
	.word 0xa2b0eeee  ! 643: ORNcc_I	orncc 	%r3, 0x0eee, %r17
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,3)
	.word 0xfe594000  ! 646: LDX_R	ldx	[%r5 + %r0], %r31
	.word 0xa8b129e6  ! 649: ORNcc_I	orncc 	%r4, 0x09e6, %r20
thr1_ic_err_55:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_55), 16, 16),1,IC_DATA,IR_NIR,15,31)
	.word 0xfd19c00b  ! 652: LDDF_R	ldd	[%r7, %r11], %f30
 .align 0x20
 .skip 0x18
	.word 0xfc19eef3  ! 656: LDD_I	ldd	[%r7 + 0x0ef3], %r30
thr1_ic_err_56:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_56), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xa3a0c829  ! 659: FADDs	fadds	%f3, %f9, %f17
.align 0x8
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16),1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xf470a458  ! 663: STX_I	stx	%r26, [%r2 + 0x0458]
	.word 0x10800003  ! 665: BA	ba  	<label_0x3>
thr1_ic_err_57:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_57), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xe918eef8  ! 667: LDDF_I	ldd	[%r3, 0x0ef8], %f20
	.word 0xb928c00f  ! 669: SLL_R	sll 	%r3, %r15, %r28
thr1_ic_err_58:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_58), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xb2016ccc  ! 672: ADD_I	add 	%r5, 0x0ccc, %r25
	.word 0xf2412b24  ! 676: LDSW_I	ldsw	[%r4 + 0x0b24], %r25
thr1_ic_err_59:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_59), 16, 16),1,IC_DATA,IR_NIR,31,20)
	.word 0xeb00c00c  ! 679: LDF_R	ld	[%r3, %r12], %f21
thr1_resum_intr_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
	.word 0xa729800e  ! 681: SLL_R	sll 	%r6, %r14, %r19
	.word 0xaa19c009  ! 681: XOR_R	xor 	%r7, %r9, %r21
	.word 0xac11400d  ! 681: OR_R	or 	%r5, %r13, %r22
	.word 0xb1323001  ! 681: SRLX_I	srlx	%r8, 0x0001, %r24
	.word 0xa530c00d  ! 681: SRL_R	srl 	%r3, %r13, %r18
	.word 0xaac1800d  ! 681: ADDCcc_R	addccc 	%r6, %r13, %r21
	.word 0xac91400b  ! 681: ORcc_R	orcc 	%r5, %r11, %r22
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xa83927b0  ! 684: XNOR_I	xnor 	%r4, 0x07b0, %r20
	.word 0xad39e001  ! 687: SRA_I	sra 	%r7, 0x0001, %r22
	.word 0xaf313001  ! 689: SRLX_I	srlx	%r4, 0x0001, %r23
	.word 0xf30165c0  ! 692: LDF_I	ld	[%r5, 0x05c0], %f25
	.word 0xf2716823  ! 696: STX_I	stx	%r25, [%r5 + 0x0823]
	.word 0xbd29e061  ! 699: SLL_I	sll 	%r7, 0x0001, %r30
	.word 0xa531900f  ! 701: SRLX_R	srlx	%r6, %r15, %r18
	.word 0xf139c00f  ! 704: STDF_R	std	%f24, [%r15, %r7]
.align 0x8
	.word 0xf029eb39  ! 708: STB_I	stb	%r24, [%r7 + 0x0b39]
	.word 0x30800003  ! 710: BA	ba,a	<label_0x3>
thr1_ic_err_60:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_60), 16, 16),1,IC_DATA,IR,31,x)
	.word 0xa9a0c9ce  ! 712: FDIVd	fdivd	%f34, %f14, %f20
	.word 0xb0c167d8  ! 714: ADDCcc_I	addccc 	%r5, 0x07d8, %r24
thr1_ic_err_61:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_61), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xbd78e401  ! 717: MOVR_I	move	%r3, 0xffffffd8, %r30
	.word 0xfc08eb17  ! 721: LDUB_I	ldub	[%r3 + 0x0b17], %r30
	.word 0xaba0c8cb  ! 724: FSUBd	fsubd	%f34, %f42, %f52
thr1_ic_err_62:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_62), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xa4a9278c  ! 727: ANDNcc_I	andncc 	%r4, 0x078c, %r18
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,20)
	.word 0xea498000  ! 731: LDSB_R	ldsb	[%r6 + %r0], %r21
	.word 0xb629e578  ! 734: ANDN_I	andn 	%r7, 0x0578, %r27
thr1_ic_err_63:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_63), 16, 16),1,IC_DATA,IR,27,x)
	.word 0xf701ea84  ! 737: LDF_I	ld	[%r7, 0x0a84], %f27
thr1_resum_intr_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0xb219ae30  ! 739: XOR_I	xor 	%r6, 0x0e30, %r25
	.word 0xb229630f  ! 739: ANDN_I	andn 	%r5, 0x030f, %r25
	.word 0xa499a540  ! 739: XORcc_I	xorcc 	%r6, 0x0540, %r18
	.word 0xa529500f  ! 739: SLLX_R	sllx	%r5, %r15, %r18
	.word 0xbd31a001  ! 739: SRL_I	srl 	%r6, 0x0001, %r30
	.word 0xa7643801  ! 739: MOVcc_I	<illegal instruction>
	.word 0xb29925d9  ! 739: XORcc_I	xorcc 	%r4, 0x05d9, %r25
	.word 0xb130a001  ! 739: SRL_I	srl 	%r2, 0x0001, %r24
 .align 0x20
 .skip 0x10
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16),1,IRF,ce,69,x, x,x,x, x,x,x)
	.word 0xa218e0ef  ! 742: XOR_I	xor 	%r3, 0x00ef, %r17
	.word 0xb018c06f  ! 745: XOR_R	xor 	%r3, %r15, %r24
	.word 0xa882000e  ! 747: ADDcc_R	addcc 	%r8, %r14, %r20
	.word 0xe319afd0  ! 750: LDDF_I	ldd	[%r6, 0x0fd0], %f17
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16),1,IRF,ce,53,x, x,x,x, x,x,x)
	.word 0xf22a2815  ! 754: STB_I	stb	%r25, [%r8 + 0x0815]
	.word 0xb3312061  ! 757: SRL_I	srl 	%r4, 0x0001, %r25
	.word 0xa178a401  ! 759: MOVR_I	move	%r2, 0x1, %r16
	.word 0xa3a209ce  ! 762: FDIVd	fdivd	%f8, %f14, %f48
 .align 0x20
 .skip 0x14
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,37)
	.word 0xe241c000  ! 766: LDSW_R	ldsw	[%r7 + %r0], %r17
	.word 0xa09126f7  ! 769: ORcc_I	orcc 	%r4, 0x06f7, %r16
thr1_ic_err_64:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_64), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xada0892a  ! 772: FMULs	fmuls	%f2, %f10, %f22
.align 0x8
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16),1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xf630e92c  ! 776: STH_I	sth	%r27, [%r3 + 0x092c]
	.word 0x10800003  ! 778: BA	ba  	<label_0x3>
thr1_ic_err_65:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_65), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xe12226ac  ! 780: STF_I	st	%f16, [0x06ac, %r8]
	.word 0xbc29400c  ! 782: ANDN_R	andn 	%r5, %r12, %r30
thr1_ic_err_66:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_66), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xa6a922f2  ! 785: ANDNcc_I	andncc 	%r4, 0x02f2, %r19
 .align 0x20
 .skip 0x14
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,64)
	.word 0xf8094000  ! 789: LDUB_R	ldub	[%r5 + %r0], %r28
	.word 0xa32a3061  ! 792: SLLX_I	sllx	%r8, 0x0021, %r17
thr1_ic_err_67:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_67), 16, 16),1,IC_DATA,IR,6,x)
	.word 0xb5a1084e  ! 795: FADDd	faddd	%f4, %f14, %f26
 .align 0x20
 .skip 0x18
	.word 0xfc50800c  ! 799: LDSH_R	ldsh	[%r2 + %r12], %r30
thr1_ic_err_68:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_68), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xe720e89c  ! 802: STF_I	st	%f19, [0x089c, %r3]
 .align 0x20
 .skip 0x14
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,36)
	.word 0xe0188000  ! 806: LDD_R	ldd	[%r2 + %r0], %r16
	.word 0xaf312061  ! 809: SRL_I	srl 	%r4, 0x0001, %r23
	.word 0xb7a1c82c  ! 812: FADDs	fadds	%f7, %f12, %f27
thr1_ic_err_69:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_69), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xa6420009  ! 815: ADDC_R	addc 	%r8, %r9, %r19
	.word 0xe6520009  ! 819: LDSH_R	ldsh	[%r8 + %r9], %r19
thr1_ic_err_70:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_70), 16, 16),1,IC_DATA,IR,13,x)
	.word 0xa7a188ab  ! 822: FSUBs	fsubs	%f6, %f11, %f19
 .align 0x20
 .skip 0x10
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16),1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xa579840d  ! 826: MOVR_R	move	%r6, %r13, %r18
	.word 0xab39f061  ! 829: SRAX_I	srax	%r7, 0x0021, %r21
	.word 0xbc096a1c  ! 831: AND_I	and 	%r5, 0x0a1c, %r30
	.word 0xa7a18929  ! 834: FMULs	fmuls	%f6, %f9, %f19
thr1_ic_err_71:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_71), 16, 16),1,IC_DATA,IR_NIR,2,18)
	.word 0xb891400e  ! 837: ORcc_R	orcc 	%r5, %r14, %r28
	.word 0xacb0e403  ! 839: ORNcc_I	orncc 	%r3, 0x0403, %r22
	.word 0xa089400d  ! 839: ANDcc_R	andcc 	%r5, %r13, %r16
	.word 0xa6c0e9f0  ! 839: ADDCcc_I	addccc 	%r3, 0x09f0, %r19
	.word 0xb3317001  ! 839: SRLX_I	srlx	%r5, 0x0001, %r25
	.word 0xb639ecc6  ! 839: XNOR_I	xnor 	%r7, 0x0cc6, %r27
.align 0x8
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16),1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf470a958  ! 842: STX_I	stx	%r26, [%r2 + 0x0958]
	.word 0x30800003  ! 844: BA	ba,a	<label_0x3>
thr1_ic_err_72:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_72), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xf1192c80  ! 846: LDDF_I	ldd	[%r4, 0x0c80], %f24
	.word 0xac99a14c  ! 848: XORcc_I	xorcc 	%r6, 0x014c, %r22
thr1_ic_err_73:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_73), 16, 16),1,IC_DATA,IR,23,x)
	.word 0xbac0800e  ! 851: ADDCcc_R	addccc 	%r2, %r14, %r29
 .align 0x20
 .skip 0x10
	.word 0xea212928  ! 855: STW_I	stw	%r21, [%r4 + 0x0928]
	.word 0xba38ecd3  ! 858: XNOR_I	xnor 	%r3, 0x0cd3, %r29
	.word 0xba992821  ! 860: XORcc_I	xorcc 	%r4, 0x0821, %r29
	.word 0xff00eb40  ! 863: LDF_I	ld	[%r3, 0x0b40], %f31
thr1_resum_intr_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	.word 0xa041000b  ! 865: ADDC_R	addc 	%r4, %r11, %r16
	.word 0xb72a3001  ! 865: SLLX_I	sllx	%r8, 0x0001, %r27
	.word 0xa564180a  ! 865: MOVcc_R	<illegal instruction>
	.word 0xbe41400a  ! 865: ADDC_R	addc 	%r5, %r10, %r31
	.word 0xbf30900a  ! 865: SRLX_R	srlx	%r2, %r10, %r31
	.word 0xb019400b  ! 865: XOR_R	xor 	%r5, %r11, %r24
	.word 0xb298c00b  ! 865: XORcc_R	xorcc 	%r3, %r11, %r25
	.word 0xac28c00b  ! 865: ANDN_R	andn 	%r3, %r11, %r22
	.word 0xbc29c00b  ! 865: ANDN_R	andn 	%r7, %r11, %r30
	.word 0xbc99400f  ! 865: XORcc_R	xorcc 	%r5, %r15, %r30
	.word 0xaab1a4a8  ! 865: ORNcc_I	orncc 	%r6, 0x04a8, %r21
	.word 0xb929900e  ! 865: SLLX_R	sllx	%r6, %r14, %r28
thr1_resum_intr_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	.word 0xb03a000b  ! 866: XNOR_R	xnor 	%r8, %r11, %r24
	.word 0xb008ab8c  ! 866: AND_I	and 	%r2, 0x0b8c, %r24
	.word 0xb339400d  ! 866: SRA_R	sra 	%r5, %r13, %r25
	.word 0xa1290009  ! 866: SLL_R	sll 	%r4, %r9, %r16
	.word 0xaa80c00b  ! 866: ADDcc_R	addcc 	%r3, %r11, %r21
	.word 0xb830a2a9  ! 866: ORN_I	orn 	%r2, 0x02a9, %r28
	.word 0xacb9eb36  ! 866: XNORcc_I	xnorcc 	%r7, 0x0b36, %r22
	.word 0xb240c00c  ! 866: ADDC_R	addc 	%r3, %r12, %r25
	.word 0xa4b22d5f  ! 866: ORNcc_I	orncc 	%r8, 0x0d5f, %r18
	.word 0xa029e8f3  ! 867: ANDN_I	andn 	%r7, 0x08f3, %r16
	.word 0xb080800c  ! 867: ADDcc_R	addcc 	%r2, %r12, %r24
	.word 0xac01c00f  ! 867: ADD_R	add 	%r7, %r15, %r22
	.word 0xbb643801  ! 867: MOVcc_I	<illegal instruction>
 .align 0x20
 .skip 0x10
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16),1,IRF,ce,40,x, x,x,x, x,x,x)
	.word 0xaa8126d7  ! 870: ADDcc_I	addcc 	%r4, 0x06d7, %r21
	.word 0xa69a006c  ! 873: XORcc_R	xorcc 	%r8, %r12, %r19
	.word 0xab29000b  ! 875: SLL_R	sll 	%r4, %r11, %r21
	.word 0xe9214009  ! 878: STF_R	st	%f20, [%r9, %r5]
.align 0x8
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16),1,IRF,ce,42,x, x,x,x, x,x,x)
	.word 0xea312b4e  ! 882: STH_I	sth	%r21, [%r4 + 0x0b4e]
	.word 0x30800003  ! 884: BA	ba,a	<label_0x3>
thr1_ic_err_74:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_74), 16, 16),1,IC_DATA,IR_NIR,26,25)
	.word 0xb1a1c94a  ! 886: FMULd	fmuld	%f38, %f10, %f24
	.word 0xbf31d00e  ! 888: SRLX_R	srlx	%r7, %r14, %r31
thr1_ic_err_75:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_75), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xae99c009  ! 891: XORcc_R	xorcc 	%r7, %r9, %r23
thr1_resum_intr_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0xbd31c009  ! 893: SRL_R	srl 	%r7, %r9, %r30
	.word 0xa030a306  ! 893: ORN_I	orn 	%r2, 0x0306, %r16
	.word 0xa564180f  ! 893: MOVcc_R	<illegal instruction>
	.word 0xa02a207b  ! 893: ANDN_I	andn 	%r8, 0x007b, %r16
	.word 0xaf29f001  ! 893: SLLX_I	sllx	%r7, 0x0001, %r23
	.word 0xb978c40a  ! 893: MOVR_R	move	%r3, %r10, %r28
	.word 0xaec1261a  ! 893: ADDCcc_I	addccc 	%r4, 0x061a, %r23
	.word 0xaa89000b  ! 893: ANDcc_R	andcc 	%r4, %r11, %r21
	.word 0xbc81000c  ! 893: ADDcc_R	addcc 	%r4, %r12, %r30
	.word 0xb5792401  ! 893: MOVR_I	move	%r4, 0xc, %r26
	.word 0xad643801  ! 893: MOVcc_I	<illegal instruction>
	.word 0xb978a401  ! 893: MOVR_I	move	%r2, 0xc, %r28
	.word 0xa030a7d2  ! 893: ORN_I	orn 	%r2, 0x07d2, %r16
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
	.word 0xf201c00f  ! 896: LDUW_R	lduw	[%r7 + %r15], %r25
thr1_ic_err_76:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_76), 16, 16),1,IC_DATA,IR,8,x)
	.word 0xb7a1c9c9  ! 899: FDIVd	fdivd	%f38, %f40, %f58
 .align 0x20
 .skip 0x18
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xf619e347  ! 904: LDD_I	ldd	[%r7 + 0x0347], %r27
thr1_ic_err_77:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_77), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xb7a1492b  ! 907: FMULs	fmuls	%f5, %f11, %f27
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,70)
	.word 0xf80a0000  ! 911: LDUB_R	ldub	[%r8 + %r0], %r28
	.word 0xa8916346  ! 914: ORcc_I	orcc 	%r5, 0x0346, %r20
	.word 0xe5016b54  ! 917: LDF_I	ld	[%r5, 0x0b54], %f18
thr1_ic_err_78:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_78), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xa17a2401  ! 920: MOVR_I	move	%r8, 0x401, %r16
 .align 0x20
 .skip 0x18
	.word 0xf6490009  ! 924: LDSB_R	ldsb	[%r4 + %r9], %r27
	.word 0xfd19e5b0  ! 927: LDDF_I	ldd	[%r7, 0x05b0], %f30
 .align 0x20
 .skip 0x18
	.word 0xfc19c009  ! 931: LDD_R	ldd	[%r7 + %r9], %r30
	.word 0xe9220009  ! 934: STF_R	st	%f20, [%r9, %r8]
	.word 0xb828a034  ! 936: ANDN_I	andn 	%r2, 0x0034, %r28
	.word 0xb3643801  ! 936: MOVcc_I	<illegal instruction>
	.word 0xbcc129e4  ! 936: ADDCcc_I	addccc 	%r4, 0x09e4, %r30
	.word 0xaa29a31b  ! 936: ANDN_I	andn 	%r6, 0x031b, %r21
	.word 0xa4296efe  ! 936: ANDN_I	andn 	%r5, 0x0efe, %r18
	.word 0xa9392001  ! 937: SRA_I	sra 	%r4, 0x0001, %r20
	.word 0xb164180f  ! 937: MOVcc_R	<illegal instruction>
	.word 0xaa08800d  ! 937: AND_R	and 	%r2, %r13, %r21
	.word 0xbe89a249  ! 937: ANDcc_I	andcc 	%r6, 0x0249, %r31
 .align 0x20
 .skip 0x10
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xf228efd5  ! 940: STB_I	stb	%r25, [%r3 + 0x0fd5]
	.word 0xaa19800e  ! 943: XOR_R	xor 	%r6, %r14, %r21
	.word 0xa4322b98  ! 945: ORN_I	orn 	%r8, 0x0b98, %r18
thr1_ic_err_79:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_79), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xed012298  ! 948: LDF_I	ld	[%r4, 0x0298], %f22
.align 0x8
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16),1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xec312b2b  ! 953: STH_I	sth	%r22, [%r4 + 0x0b2b]
	.word 0x30800003  ! 955: BA	ba,a	<label_0x3>
thr1_ic_err_80:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_80), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xa5a089cb  ! 957: FDIVd	fdivd	%f2, %f42, %f18
	.word 0xbe1a000d  ! 959: XOR_R	xor 	%r8, %r13, %r31
thr1_ic_err_81:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_81), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xae09400b  ! 962: AND_R	and 	%r5, %r11, %r23
.align 0x8
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16),1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf4316ddc  ! 966: STH_I	sth	%r26, [%r5 + 0x0ddc]
	.word 0x10800003  ! 968: BA	ba  	<label_0x3>
thr1_ic_err_82:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_82), 16, 16),1,IC_DATA,IR_NIR,20,12)
	.word 0xa5a1094f  ! 970: FMULd	fmuld	%f4, %f46, %f18
	.word 0xa030a423  ! 972: SUBC_I	orn 	%r2, 0x0423, %r16
thr1_ic_err_83:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_83), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xa00969f5  ! 975: AND_I	and 	%r5, 0x09f5, %r16
thr1_irf_ce_39:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_39), 16, 16),1,IRF,ce,6,x, x,x,x, x,x,x)
	.word 0xe0516e47  ! 980: LDSH_I	ldsh	[%r5 + 0x0e47], %r16
thr1_ic_err_84:
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_84), 16, 16),1,IC_DATA,IR_NIR,11,13)
	.word 0xb9a14949  ! 983: FMULd	fmuld	%f36, %f40, %f28
 .align 0x20
 .skip 0x10
	.word 0xf821696d  ! 987: STW_I	stw	%r28, [%r5 + 0x096d]
	.word 0xa4a20009  ! 990: SUBcc_R	subcc 	%r8, %r9, %r18
	.word 0xaa89400a  ! 992: ANDcc_R	andcc 	%r5, %r10, %r21
	.word 0xa5a1094a  ! 995: FMULd	fmuld	%f4, %f10, %f18
.align 0x8
thr1_irf_ce_40:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_40), 16, 16),1,IRF,ce,32,x, x,x,x, x,x,x)
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
	setx  0x30929571a5854b82, %r16, %r16
	setx  0x608a0308c955c286, %r16, %r17
	setx  0xf3196d2700c3d7f5, %r16, %r18
	setx  0x2f6cd06cb406acf9, %r16, %r19
	setx  0x363d3462c2ddaffc, %r16, %r20
	setx  0xa8c38545098718d3, %r16, %r21
	setx  0xfdeda7c7c95a45d0, %r16, %r22
	setx  0xd4498c09cbebb351, %r16, %r23
	setx  0xc886c267035434a9, %r16, %r24
	setx  0xa5003674b491128a, %r16, %r25
	setx  0xd9d47d0aba4e749d, %r16, %r26
	setx  0x6322a6cde6c790ae, %r16, %r27
	setx  0x36dc4264a03c38e8, %r16, %r28
	setx  0xc0d42696d20d9bf7, %r16, %r29
	setx  0x2d8bf23355897ebd, %r16, %r30
	setx  0x0601521b40ff9ba1, %r16, %r31
	setx  0x0000000000000ff0, %r16, %r9
	setx  0x0000000000000970, %r16, %r10
	setx  0x0000000000000ed0, %r16, %r11
	setx  0x0000000000000ed0, %r16, %r12
	setx  0x0000000000000900, %r16, %r13
	setx  0x0000000000000830, %r16, %r14
	setx  0x0000000000000330, %r16, %r15
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
	.word 0xf31a2d50  ! 1: LDDF_I	ldd	[%r8, 0x0d50], %f25
	.word 0xa5a1092c  ! 1: FMULs	fmuls	%f4, %f12, %f18
	.word 0xb9a0882a  ! 1: FADDs	fadds	%f2, %f10, %f28
	.word 0xf7022ebc  ! 1: LDF_I	ld	[%r8, 0x0ebc], %f27
	.word 0xaba1092a  ! 1: FMULs	fmuls	%f4, %f10, %f21
	.word 0xbba1c84b  ! 1: FADDd	faddd	%f38, %f42, %f60
	.word 0xa5a148af  ! 1: FSUBs	fsubs	%f5, %f15, %f18
	.word 0xf121ead0  ! 1: STF_I	st	%f24, [0x0ad0, %r7]
	.word 0xef39000d  ! 1: STDF_R	std	%f23, [%r13, %r4]
	.word 0xfb396590  ! 1: STDF_I	std	%f29, [0x0590, %r5]
	.word 0xed188009  ! 1: LDDF_R	ldd	[%r2, %r9], %f22
	.word 0xe921800f  ! 1: STF_R	st	%f20, [%r15, %r6]
	.word 0xbfa088ae  ! 1: FSUBs	fsubs	%f2, %f14, %f31
	.word 0xf1022440  ! 1: LDF_I	ld	[%r8, 0x0440], %f24
	.word 0xff21000f  ! 1: STF_R	st	%f31, [%r15, %r4]
	.word 0xed19a208  ! 1: LDDF_I	ldd	[%r6, 0x0208], %f22
	.word 0xe519aab0  ! 1: LDDF_I	ldd	[%r6, 0x0ab0], %f18
	.word 0xb9a1484b  ! 1: FADDd	faddd	%f36, %f42, %f28
	.word 0xe3198009  ! 1: LDDF_R	ldd	[%r6, %r9], %f17
	.word 0xf321e1fc  ! 1: STF_I	st	%f25, [0x01fc, %r7]
	.word 0xba41af10  ! 1: ADDC_I	addc 	%r6, 0x0f10, %r29
	.word 0xac31400e  ! 1: ORN_R	orn 	%r5, %r14, %r22
	.word 0xb9312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r28
	.word 0xa2a96f49  ! 1: ANDNcc_I	andncc 	%r5, 0x0f49, %r17
	.word 0xb539500b  ! 1: SRAX_R	srax	%r5, %r11, %r26
	.word 0xa930e001  ! 1: SRL_I	srl 	%r3, 0x0001, %r20
	.word 0xac31258e  ! 1: ORN_I	orn 	%r4, 0x058e, %r22
	.word 0xb208800e  ! 1: AND_R	and 	%r2, %r14, %r25
	.word 0xb299000e  ! 1: XORcc_R	xorcc 	%r4, %r14, %r25
	.word 0xbab8800f  ! 1: XNORcc_R	xnorcc 	%r2, %r15, %r29
	.word 0xf73a2138  ! 1: STDF_I	std	%f27, [0x0138, %r8]
	.word 0xe921400a  ! 1: STF_R	st	%f20, [%r10, %r5]
	.word 0xe538c009  ! 1: STDF_R	std	%f18, [%r9, %r3]
	.word 0xb3a0894b  ! 1: FMULd	fmuld	%f2, %f42, %f56
	.word 0xa7a109a9  ! 1: FDIVs	fdivs	%f4, %f9, %f19
	.word 0xada1c92c  ! 1: FMULs	fmuls	%f7, %f12, %f22
	.word 0xa5a0c8cc  ! 1: FSUBd	fsubd	%f34, %f12, %f18
	.word 0xada14929  ! 1: FMULs	fmuls	%f5, %f9, %f22
	.word 0xb5a1092b  ! 1: FMULs	fmuls	%f4, %f11, %f26
	.word 0xada1894b  ! 1: FMULd	fmuld	%f6, %f42, %f22
	.word 0xf702000a  ! 1: LDF_R	ld	[%r8, %r10], %f27
	.word 0xa3a0892f  ! 1: FMULs	fmuls	%f2, %f15, %f17
	.word 0xaba1492e  ! 1: FMULs	fmuls	%f5, %f14, %f21
	.word 0xaba208a9  ! 1: FSUBs	fsubs	%f8, %f9, %f21
	.word 0xff19a080  ! 1: LDDF_I	ldd	[%r6, 0x0080], %f31
	.word 0xa9a209af  ! 1: FDIVs	fdivs	%f8, %f15, %f20
	.word 0xb3a1484a  ! 1: FADDd	faddd	%f36, %f10, %f56
	.word 0xbfa0c92f  ! 1: FMULs	fmuls	%f3, %f15, %f31
	.word 0xf738800f  ! 1: STDF_R	std	%f27, [%r15, %r2]
	.word 0xe901400a  ! 1: LDF_R	ld	[%r5, %r10], %f20
	.word 0xb8892dc5  ! 1: ANDcc_I	andcc 	%r4, 0x0dc5, %r28
	.word 0xa4b8e93b  ! 1: XNORcc_I	xnorcc 	%r3, 0x093b, %r18
	.word 0xb339d00c  ! 1: SRAX_R	srax	%r7, %r12, %r25
	.word 0xb4b1800c  ! 1: ORNcc_R	orncc 	%r6, %r12, %r26
	.word 0xa099c00a  ! 1: XORcc_R	xorcc 	%r7, %r10, %r16
	.word 0xa839653f  ! 1: XNOR_I	xnor 	%r5, 0x053f, %r20
	.word 0xbc316e1a  ! 1: ORN_I	orn 	%r5, 0x0e1a, %r30
	.word 0xaf78e401  ! 1: MOVR_I	move	%r3, 0xfffffe1a, %r23
	.word 0xb2820009  ! 1: ADDcc_R	addcc 	%r8, %r9, %r25
	.word 0xb17a2401  ! 1: MOVR_I	move	%r8, 0x9, %r24
	.word 0xbfa1892d  ! 1: FMULs	fmuls	%f6, %f13, %f31
	.word 0xf521000e  ! 1: STF_R	st	%f26, [%r14, %r4]
	.word 0xf138a060  ! 1: STDF_I	std	%f24, [0x0060, %r2]
	.word 0xbba0884a  ! 1: FADDd	faddd	%f2, %f10, %f60
	.word 0xe53a000b  ! 1: STDF_R	std	%f18, [%r11, %r8]
	.word 0xafa188a9  ! 1: FSUBs	fsubs	%f6, %f9, %f23
	.word 0xb5a0c84c  ! 1: FADDd	faddd	%f34, %f12, %f26
	.word 0xa1a1882b  ! 1: FADDs	fadds	%f6, %f11, %f16
	.word 0xe5016a2c  ! 1: LDF_I	ld	[%r5, 0x0a2c], %f18
	.word 0xf919400a  ! 1: LDDF_R	ldd	[%r5, %r10], %f28
	.word 0xbba208ae  ! 1: FSUBs	fsubs	%f8, %f14, %f29
	.word 0xa9a2092c  ! 1: FMULs	fmuls	%f8, %f12, %f20
	.word 0xa7a0c9a9  ! 1: FDIVs	fdivs	%f3, %f9, %f19
	.word 0xafa089ae  ! 1: FDIVs	fdivs	%f2, %f14, %f23
	.word 0xb1a1c8cc  ! 1: FSUBd	fsubd	%f38, %f12, %f24
	.word 0xf119c00e  ! 1: LDDF_R	ldd	[%r7, %r14], %f24
	.word 0xf5222158  ! 1: STF_I	st	%f26, [0x0158, %r8]
	.word 0xbba148cf  ! 1: FSUBd	fsubd	%f36, %f46, %f60
	.word 0xf7008009  ! 1: LDF_R	ld	[%r2, %r9], %f27
	.word 0xb9a1892d  ! 1: FMULs	fmuls	%f6, %f13, %f28
	.word 0xac11690d  ! 1: OR_I	or 	%r5, 0x090d, %r22
	.word 0xae196ab1  ! 1: XOR_I	xor 	%r5, 0x0ab1, %r23
	.word 0xb138e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r24
	.word 0xac10800b  ! 1: OR_R	or 	%r2, %r11, %r22
	.word 0xa4aa24da  ! 1: ANDNcc_I	andncc 	%r8, 0x04da, %r18
	.word 0xb091addd  ! 1: ORcc_I	orcc 	%r6, 0x0ddd, %r24
	.word 0xb729900a  ! 1: SLLX_R	sllx	%r6, %r10, %r27
	.word 0xb490c009  ! 1: ORcc_R	orcc 	%r3, %r9, %r26
	.word 0xb164180a  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb408e561  ! 1: AND_I	and 	%r3, 0x0561, %r26
	.word 0xb9a0c94d  ! 1: FMULd	fmuld	%f34, %f44, %f28
	.word 0xa5a1c82f  ! 1: FADDs	fadds	%f7, %f15, %f18
	.word 0xf12123f0  ! 1: STF_I	st	%f24, [0x03f0, %r4]
	.word 0xf701000d  ! 1: LDF_R	ld	[%r4, %r13], %f27
	.word 0xfb39e218  ! 1: STDF_I	std	%f29, [0x0218, %r7]
	.word 0xfb022fa8  ! 1: LDF_I	ld	[%r8, 0x0fa8], %f29
	.word 0xef212110  ! 1: STF_I	st	%f23, [0x0110, %r4]
	.word 0xed0226a8  ! 1: LDF_I	ld	[%r8, 0x06a8], %f22
	.word 0xfd016f98  ! 1: LDF_I	ld	[%r5, 0x0f98], %f30
	.word 0xada108a9  ! 1: FSUBs	fsubs	%f4, %f9, %f22
	.word 0xa1a1c8c9  ! 1: FSUBd	fsubd	%f38, %f40, %f16
	.word 0xa7a14929  ! 1: FMULs	fmuls	%f5, %f9, %f19
	.word 0xed3a0009  ! 1: STDF_R	std	%f22, [%r9, %r8]
	.word 0xa1a2094e  ! 1: FMULd	fmuld	%f8, %f14, %f16
	.word 0xa5a209cf  ! 1: FDIVd	fdivd	%f8, %f46, %f18
	.word 0xff01c00c  ! 1: LDF_R	ld	[%r7, %r12], %f31
	.word 0xb7a0c9ca  ! 1: FDIVd	fdivd	%f34, %f10, %f58
	.word 0xe13a2de0  ! 1: STDF_I	std	%f16, [0x0de0, %r8]
	.word 0xe118800f  ! 1: LDDF_R	ldd	[%r2, %r15], %f16
	.word 0xbda189a9  ! 1: FDIVs	fdivs	%f6, %f9, %f30
	.word 0xbc81a1cf  ! 1: ADDcc_I	addcc 	%r6, 0x01cf, %r30
	.word 0xa4b1000e  ! 1: ORNcc_R	orncc 	%r4, %r14, %r18
	.word 0xb400ab57  ! 1: ADD_I	add 	%r2, 0x0b57, %r26
	.word 0xa831ac78  ! 1: ORN_I	orn 	%r6, 0x0c78, %r20
	.word 0xb209000c  ! 1: AND_R	and 	%r4, %r12, %r25
	.word 0xb8c22ecb  ! 1: ADDCcc_I	addccc 	%r8, 0x0ecb, %r28
	.word 0xaa89800d  ! 1: ANDcc_R	andcc 	%r6, %r13, %r21
	.word 0xbe89000c  ! 1: ANDcc_R	andcc 	%r4, %r12, %r31
	.word 0xa8b1000d  ! 1: ORNcc_R	orncc 	%r4, %r13, %r20
	.word 0xa8a9800a  ! 1: ANDNcc_R	andncc 	%r6, %r10, %r20
	.word 0xf3196a48  ! 1: LDDF_I	ldd	[%r5, 0x0a48], %f25
	.word 0xe500800c  ! 1: LDF_R	ld	[%r2, %r12], %f18
	.word 0xed18aad0  ! 1: LDDF_I	ldd	[%r2, 0x0ad0], %f22
	.word 0xa5a1884a  ! 1: FADDd	faddd	%f6, %f10, %f18
	.word 0xa7a0c94e  ! 1: FMULd	fmuld	%f34, %f14, %f50
	.word 0xb7a0c8a9  ! 1: FSUBs	fsubs	%f3, %f9, %f27
	.word 0xbda188ad  ! 1: FSUBs	fsubs	%f6, %f13, %f30
	.word 0xb1a148ce  ! 1: FSUBd	fsubd	%f36, %f14, %f24
	.word 0xada1882a  ! 1: FADDs	fadds	%f6, %f10, %f22
	.word 0xf718a7c0  ! 1: LDDF_I	ldd	[%r2, 0x07c0], %f27
	.word 0xf518eec0  ! 1: LDDF_I	ldd	[%r3, 0x0ec0], %f26
	.word 0xa3a1484f  ! 1: FADDd	faddd	%f36, %f46, %f48
	.word 0xafa1094c  ! 1: FMULd	fmuld	%f4, %f12, %f54
	.word 0xa7a1494f  ! 1: FMULd	fmuld	%f36, %f46, %f50
	.word 0xfd00c00b  ! 1: LDF_R	ld	[%r3, %r11], %f30
	.word 0xafa0892a  ! 1: FMULs	fmuls	%f2, %f10, %f23
	.word 0xbba0884d  ! 1: FADDd	faddd	%f2, %f44, %f60
	.word 0xe101c00b  ! 1: LDF_R	ld	[%r7, %r11], %f16
	.word 0xe71a000a  ! 1: LDDF_R	ldd	[%r8, %r10], %f19
	.word 0xbda1c84c  ! 1: FADDd	faddd	%f38, %f12, %f30
	.word 0xa210c00c  ! 1: OR_R	or 	%r3, %r12, %r17
	.word 0xb698800d  ! 1: XORcc_R	xorcc 	%r2, %r13, %r27
	.word 0xa779840c  ! 1: MOVR_R	move	%r6, %r12, %r19
	.word 0xab7a0409  ! 1: MOVR_R	move	%r8, %r9, %r21
	.word 0xbc998009  ! 1: XORcc_R	xorcc 	%r6, %r9, %r30
	.word 0xa099400a  ! 1: XORcc_R	xorcc 	%r5, %r10, %r16
	.word 0xb8b96bb8  ! 1: XNORcc_I	xnorcc 	%r5, 0x0bb8, %r28
	.word 0xa0820009  ! 1: ADDcc_R	addcc 	%r8, %r9, %r16
	.word 0xae91e4c1  ! 1: ORcc_I	orcc 	%r7, 0x04c1, %r23
	.word 0xab28f001  ! 1: SLLX_I	sllx	%r3, 0x0001, %r21
	.word 0xed02000f  ! 1: LDF_R	ld	[%r8, %r15], %f22
	.word 0xeb39800c  ! 1: STDF_R	std	%f21, [%r12, %r6]
	.word 0xa1a108cc  ! 1: FSUBd	fsubd	%f4, %f12, %f16
	.word 0xa9a189af  ! 1: FDIVs	fdivs	%f6, %f15, %f20
	.word 0xe7196980  ! 1: LDDF_I	ldd	[%r5, 0x0980], %f19
	.word 0xff20ea58  ! 1: STF_I	st	%f31, [0x0a58, %r3]
	.word 0xaba208ab  ! 1: FSUBs	fsubs	%f8, %f11, %f21
	.word 0xe921c00a  ! 1: STF_R	st	%f20, [%r10, %r7]
	.word 0xff00c00f  ! 1: LDF_R	ld	[%r3, %r15], %f31
	.word 0xa1a0c9ac  ! 1: FDIVs	fdivs	%f3, %f12, %f16
	.word 0xbfa0c9ae  ! 1: FDIVs	fdivs	%f3, %f14, %f31
	.word 0xa1a2084f  ! 1: FADDd	faddd	%f8, %f46, %f16
	.word 0xeb21400d  ! 1: STF_R	st	%f21, [%r13, %r5]
	.word 0xe500800f  ! 1: LDF_R	ld	[%r2, %r15], %f18
	.word 0xb3a0c9ad  ! 1: FDIVs	fdivs	%f3, %f13, %f25
	.word 0xa9a189ad  ! 1: FDIVs	fdivs	%f6, %f13, %f20
	.word 0xada149ae  ! 1: FDIVs	fdivs	%f5, %f14, %f22
	.word 0xe33a28d8  ! 1: STDF_I	std	%f17, [0x08d8, %r8]
	.word 0xa1a1c829  ! 1: FADDs	fadds	%f7, %f9, %f16
	.word 0xe118800e  ! 1: LDDF_R	ldd	[%r2, %r14], %f16
	.word 0xb40a299c  ! 1: AND_I	and 	%r8, 0x099c, %r26
	.word 0xae40800e  ! 1: ADDC_R	addc 	%r2, %r14, %r23
	.word 0xb3643801  ! 1: MOVcc_I	<illegal instruction>
	.word 0xa898800e  ! 1: XORcc_R	xorcc 	%r2, %r14, %r20
	.word 0xbb30c00d  ! 1: SRL_R	srl 	%r3, %r13, %r29
	.word 0xa200adbd  ! 1: ADD_I	add 	%r2, 0x0dbd, %r17
	.word 0xbca9af2b  ! 1: ANDNcc_I	andncc 	%r6, 0x0f2b, %r30
	.word 0xae39000f  ! 1: XNOR_R	xnor 	%r4, %r15, %r23
	.word 0xb0b0800d  ! 1: ORNcc_R	orncc 	%r2, %r13, %r24
	.word 0xac99c00c  ! 1: XORcc_R	xorcc 	%r7, %r12, %r22
	.word 0xf701800d  ! 1: LDF_R	ld	[%r6, %r13], %f27
	.word 0xa5a0c9ac  ! 1: FDIVs	fdivs	%f3, %f12, %f18
	.word 0xe51a2118  ! 1: LDDF_I	ldd	[%r8, 0x0118], %f18
	.word 0xbba149ae  ! 1: FDIVs	fdivs	%f5, %f14, %f29
	.word 0xf538800c  ! 1: STDF_R	std	%f26, [%r12, %r2]
	.word 0xada1c9ab  ! 1: FDIVs	fdivs	%f7, %f11, %f22
	.word 0xfd38e660  ! 1: STDF_I	std	%f30, [0x0660, %r3]
	.word 0xb3a0c82a  ! 1: FADDs	fadds	%f3, %f10, %f25
	.word 0xe300800a  ! 1: LDF_R	ld	[%r2, %r10], %f17
	.word 0xf338ee68  ! 1: STDF_I	std	%f25, [0x0e68, %r3]
	.word 0xb9a1892b  ! 1: FMULs	fmuls	%f6, %f11, %f28
	.word 0xafa2084a  ! 1: FADDd	faddd	%f8, %f10, %f54
	.word 0xbba148ab  ! 1: FSUBs	fsubs	%f5, %f11, %f29
	.word 0xb7a2094a  ! 1: FMULd	fmuld	%f8, %f10, %f58
	.word 0xb1a0892b  ! 1: FMULs	fmuls	%f2, %f11, %f24
	.word 0xed18c00e  ! 1: LDDF_R	ldd	[%r3, %r14], %f22
	.word 0xafa148c9  ! 1: FSUBd	fsubd	%f36, %f40, %f54
	.word 0xb7a1c9af  ! 1: FDIVs	fdivs	%f7, %f15, %f27
	.word 0xed01c00a  ! 1: LDF_R	ld	[%r7, %r10], %f22
	.word 0xb3a1882b  ! 1: FADDs	fadds	%f6, %f11, %f25
	.word 0xa1317001  ! 1: SRLX_I	srlx	%r5, 0x0001, %r16
	.word 0xa379e401  ! 1: MOVR_I	move	%r7, 0x1, %r17
	.word 0xa931500a  ! 1: SRLX_R	srlx	%r5, %r10, %r20
	.word 0xb4b8800f  ! 1: XNORcc_R	xnorcc 	%r2, %r15, %r26
	.word 0xa331b001  ! 1: SRLX_I	srlx	%r6, 0x0001, %r17
	.word 0xa8b8eae4  ! 1: XNORcc_I	xnorcc 	%r3, 0x0ae4, %r20
	.word 0xa839400d  ! 1: XNOR_R	xnor 	%r5, %r13, %r20
	.word 0xaa412a91  ! 1: ADDC_I	addc 	%r4, 0x0a91, %r21
	.word 0xba816309  ! 1: ADDcc_I	addcc 	%r5, 0x0309, %r29
	.word 0xbd29f001  ! 1: SLLX_I	sllx	%r7, 0x0001, %r30
	.word 0xbfa2094e  ! 1: FMULd	fmuld	%f8, %f14, %f62
	.word 0xe901000c  ! 1: LDF_R	ld	[%r4, %r12], %f20
	.word 0xa7a108cb  ! 1: FSUBd	fsubd	%f4, %f42, %f50
	.word 0xbda089aa  ! 1: FDIVs	fdivs	%f2, %f10, %f30
	.word 0xb3a109aa  ! 1: FDIVs	fdivs	%f4, %f10, %f25
	.word 0xf519e4c0  ! 1: LDDF_I	ldd	[%r7, 0x04c0], %f26
	.word 0xef192988  ! 1: LDDF_I	ldd	[%r4, 0x0988], %f23
	.word 0xaba1c92e  ! 1: FMULs	fmuls	%f7, %f14, %f21
	.word 0xf321000a  ! 1: STF_R	st	%f25, [%r10, %r4]
	.word 0xed39c00c  ! 1: STDF_R	std	%f22, [%r12, %r7]
	.word 0xf51a000d  ! 1: LDDF_R	ldd	[%r8, %r13], %f26
	.word 0xeb18afe0  ! 1: LDDF_I	ldd	[%r2, 0x0fe0], %f21
	.word 0xe119a0e0  ! 1: LDDF_I	ldd	[%r6, 0x00e0], %f16
	.word 0xa3a1492e  ! 1: FMULs	fmuls	%f5, %f14, %f17
	.word 0xe901800f  ! 1: LDF_R	ld	[%r6, %r15], %f20
	.word 0xa5a1084f  ! 1: FADDd	faddd	%f4, %f46, %f18
	.word 0xf900800c  ! 1: LDF_R	ld	[%r2, %r12], %f28
	.word 0xa3a109af  ! 1: FDIVs	fdivs	%f4, %f15, %f17
	.word 0xef39ae68  ! 1: STDF_I	std	%f23, [0x0e68, %r6]
	.word 0xa3a089cb  ! 1: FDIVd	fdivd	%f2, %f42, %f48
	.word 0xa0a9000b  ! 1: ANDNcc_R	andncc 	%r4, %r11, %r16
	.word 0xb6412283  ! 1: ADDC_I	addc 	%r4, 0x0283, %r27
	.word 0xb219400a  ! 1: XOR_R	xor 	%r5, %r10, %r25
	.word 0xaeb9e7dd  ! 1: XNORcc_I	xnorcc 	%r7, 0x07dd, %r23
	.word 0xba98e0af  ! 1: XORcc_I	xorcc 	%r3, 0x00af, %r29
	.word 0xb289e2b4  ! 1: ANDcc_I	andcc 	%r7, 0x02b4, %r25
	.word 0xaea9ab6a  ! 1: ANDNcc_I	andncc 	%r6, 0x0b6a, %r23
	.word 0xb732000d  ! 1: SRL_R	srl 	%r8, %r13, %r27
	.word 0xbcc169d6  ! 1: ADDCcc_I	addccc 	%r5, 0x09d6, %r30
	.word 0xa690c00b  ! 1: ORcc_R	orcc 	%r3, %r11, %r19
	.word 0xfb0164ec  ! 1: LDF_I	ld	[%r5, 0x04ec], %f29
	.word 0xf1016dd8  ! 1: LDF_I	ld	[%r5, 0x0dd8], %f24
	.word 0xbba088ad  ! 1: FSUBs	fsubs	%f2, %f13, %f29
	.word 0xfb396498  ! 1: STDF_I	std	%f29, [0x0498, %r5]
	.word 0xa7a1c84c  ! 1: FADDd	faddd	%f38, %f12, %f50
	.word 0xbda14849  ! 1: FADDd	faddd	%f36, %f40, %f30
	.word 0xeb1a000f  ! 1: LDDF_R	ldd	[%r8, %r15], %f21
	.word 0xb1a0c82b  ! 1: FADDs	fadds	%f3, %f11, %f24
	.word 0xe500c00c  ! 1: LDF_R	ld	[%r3, %r12], %f18
	.word 0xff01800c  ! 1: LDF_R	ld	[%r6, %r12], %f31
	.word 0xa7a0c92c  ! 1: FMULs	fmuls	%f3, %f12, %f19
	.word 0xa1a1894a  ! 1: FMULd	fmuld	%f6, %f10, %f16
	.word 0xef01c00c  ! 1: LDF_R	ld	[%r7, %r12], %f23
	.word 0xb5a149cd  ! 1: FDIVd	fdivd	%f36, %f44, %f26
	.word 0xafa109cf  ! 1: FDIVd	fdivd	%f4, %f46, %f54
	.word 0xaba1c8ca  ! 1: FSUBd	fsubd	%f38, %f10, %f52
	.word 0xaba1482b  ! 1: FADDs	fadds	%f5, %f11, %f21
	.word 0xa7a1c94e  ! 1: FMULd	fmuld	%f38, %f14, %f50
	.word 0xff39e250  ! 1: STDF_I	std	%f31, [0x0250, %r7]
	.word 0xe319a070  ! 1: LDDF_I	ldd	[%r6, 0x0070], %f17
	.word 0xac30800c  ! 1: ORN_R	orn 	%r2, %r12, %r22
	.word 0xb809e625  ! 1: AND_I	and 	%r7, 0x0625, %r28
	.word 0xb12a000f  ! 1: SLL_R	sll 	%r8, %r15, %r24
	.word 0xba88eb9c  ! 1: ANDcc_I	andcc 	%r3, 0x0b9c, %r29
	.word 0xb5312001  ! 1: SRL_I	srl 	%r4, 0x0001, %r26
	.word 0xa8b12b72  ! 1: ORNcc_I	orncc 	%r4, 0x0b72, %r20
	.word 0xa089800e  ! 1: ANDcc_R	andcc 	%r6, %r14, %r16
	.word 0xb691c00b  ! 1: ORcc_R	orcc 	%r7, %r11, %r27
	.word 0xad64180d  ! 1: MOVcc_R	<illegal instruction>
	.word 0xb60a000c  ! 1: AND_R	and 	%r8, %r12, %r27
	.word 0xafa088af  ! 1: FSUBs	fsubs	%f2, %f15, %f23
	.word 0xf519000e  ! 1: LDDF_R	ldd	[%r4, %r14], %f26
	.word 0xb1a1882c  ! 1: FADDs	fadds	%f6, %f12, %f24
	.word 0xada108c9  ! 1: FSUBd	fsubd	%f4, %f40, %f22
	.word 0xfd01800b  ! 1: LDF_R	ld	[%r6, %r11], %f30
	.word 0xf521ed44  ! 1: STF_I	st	%f26, [0x0d44, %r7]
	.word 0xb9a1c94b  ! 1: FMULd	fmuld	%f38, %f42, %f28
	.word 0xafa2082c  ! 1: FADDs	fadds	%f8, %f12, %f23
	.word 0xa1a108c9  ! 1: FSUBd	fsubd	%f4, %f40, %f16
	.word 0xb9a2092a  ! 1: FMULs	fmuls	%f8, %f10, %f28
	.word 0xf300a990  ! 1: LDF_I	ld	[%r2, 0x0990], %f25
	.word 0xeb022bf4  ! 1: LDF_I	ld	[%r8, 0x0bf4], %f21
	.word 0xf138e140  ! 1: STDF_I	std	%f24, [0x0140, %r3]
	.word 0xa9a0c84b  ! 1: FADDd	faddd	%f34, %f42, %f20
	.word 0xeb18800c  ! 1: LDDF_R	ldd	[%r2, %r12], %f21
	.word 0xbba0c9aa  ! 1: FDIVs	fdivs	%f3, %f10, %f29
	.word 0xb7a1484f  ! 1: FADDd	faddd	%f36, %f46, %f58
	.word 0xed21636c  ! 1: STF_I	st	%f22, [0x036c, %r5]
	.word 0xf11a28a0  ! 1: LDDF_I	ldd	[%r8, 0x08a0], %f24
	.word 0xa3a109ac  ! 1: FDIVs	fdivs	%f4, %f12, %f17
	.word 0xa810ea8a  ! 1: OR_I	or 	%r3, 0x0a8a, %r20
	.word 0xa0b16150  ! 1: ORNcc_I	orncc 	%r5, 0x0150, %r16
	.word 0xbc28e16e  ! 1: ANDN_I	andn 	%r3, 0x016e, %r30
	.word 0xbc39286f  ! 1: XNOR_I	xnor 	%r4, 0x086f, %r30
	.word 0xbeb926f2  ! 1: XNORcc_I	xnorcc 	%r4, 0x06f2, %r31
	.word 0xba89000c  ! 1: ANDcc_R	andcc 	%r4, %r12, %r29
	.word 0xaa188009  ! 1: XOR_R	xor 	%r2, %r9, %r21
	.word 0xa132100c  ! 1: SRLX_R	srlx	%r8, %r12, %r16
	.word 0xbe40ec8e  ! 1: ADDC_I	addc 	%r3, 0x0c8e, %r31
	.word 0xaec16cb3  ! 1: ADDCcc_I	addccc 	%r5, 0x0cb3, %r23
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
	.word  0x7859614f,0xc6bbe02a,0x89c7199a,0x271d5b98
	.word  0x60fd9519,0x9a6f2378,0xeaf1a35a,0x8483f7a8
	.word  0xc7aca671,0x33875af4,0x126149aa,0x0228bef7
	.word  0x62a6a630,0xbe7b4520,0x3e28876c,0x9aecfa6a
	.word  0x459ede91,0x7aeaa563,0x3c03d2be,0x493452cf
	.word  0x72011769,0x4a68a78b,0xf9bc4557,0x392a5c95
	.word  0x8a9075ed,0x67d0144f,0xe8e9925e,0xd69f8848
	.word  0xbafb8f69,0xe3fda0f9,0x8b14b028,0x34c68aae
	.word  0xa93b3dd2,0x156de943,0x58963c17,0xf9c7973a
	.word  0x9991c595,0xaac10e87,0x80f3bd3b,0x4869b3c0
	.word  0x1eb489d4,0x29975b89,0x739c5235,0x063241b8
	.word  0x95b1edf9,0xac35d170,0xb877c40b,0x54548c40
	.word  0x327f0caa,0xae62dbc5,0x4a0bbc30,0x82809ce3
	.word  0xc472b649,0x0d2a1b2b,0x1b8ebdea,0x2d317b42
	.word  0x9ce521a2,0xe689e782,0x7f487567,0x87bfbab8
	.word  0xf5bae9e1,0xdc7d9940,0x7b6b46e6,0x5a095267
	.word  0xaf91bd50,0x688ce897,0x68a6172d,0x2ddfb9b0
	.word  0x20379522,0xbd027bde,0x0a12b119,0x6cd7afc8
	.word  0xd40323c6,0xa39708ed,0xfd6e1d5e,0xce16c663
	.word  0x3161e6f7,0xf1ae5780,0xb5e1989a,0x8f6d84ea
	.word  0xb25a9bdd,0x62e230a3,0xc18213be,0x0bba589b
	.word  0x83c1ce9c,0x16aec317,0x02b42b9a,0x5959f8f3
	.word  0xbc5bff93,0xb563f4cb,0x267a2f75,0x0d614505
	.word  0x398d99c3,0x1f99c70d,0x7816cc65,0x882da190
	.word  0x4e920f13,0xd3b2f843,0x064eb0c8,0xadbcacf5
	.word  0x6e91dc47,0x17599612,0x90fbe460,0x07f56b4a
	.word  0x890d351b,0x7abd162f,0xd3993b66,0xe84d30bc
	.word  0x4c0474e0,0xa43ea7e7,0x42cc022d,0x06e57f6f
	.word  0x3fb6531a,0x97fd4523,0x2811abd0,0xce4a1cb8
	.word  0x0b97ee81,0x833ce1ca,0xff31f49b,0xdfd152e4
	.word  0xe2541452,0xaa18b1ce,0xbaf5dcde,0xd026d50e
	.word  0x12fad1a0,0x67523d8d,0x1ba7ecf0,0x15e70eb3
	.word  0xcf5b2837,0x200c44c2,0xc078566c,0xacdf63b8
	.word  0x74e1fc7f,0xfa2bce9a,0x01316d75,0xf00dd101
	.word  0x84f3d949,0x283e5c00,0xc9ffd492,0xeb7cf6d7
	.word  0x0c6a97a3,0xc69abfcb,0x9d21e94f,0xb24e54d5
	.word  0xb9affe7e,0x3d85949a,0xc3f5bdf7,0x348f7252
	.word  0xc6bf828f,0x9dd6db0f,0x1658723e,0x180923fa
	.word  0x9e82e6ad,0xd2553dc1,0xdaac9912,0x2c1393e3
	.word  0x0dd036b5,0xa5c40e36,0x7b40814c,0x3d904ef7
	.word  0xa76ac8f6,0x965bcea7,0x108e3de9,0x57640476
	.word  0x8deb6ba6,0xcffb5806,0x68de59b3,0x6515c034
	.word  0x59c100af,0x897c759a,0x659374ad,0xa3b42c27
	.word  0x5e041c7e,0x455a73f3,0xecc698a5,0x02e6b3a9
	.word  0xeeb212db,0x11452c0b,0x9830eacc,0x2c95b1fb
	.word  0x10f1741b,0x4a871824,0x04c75af6,0xae3fefb6
	.word  0xfd843bcf,0x77b49f84,0x1b9cb82a,0xf1b8b79a
	.word  0x3f697d8d,0x2c8c74b4,0x2f0ac24f,0xc6dfbbf5
	.word  0x5f322f78,0xd470624d,0x6e2945d1,0x9cc0b2e4
	.word  0xfdb7036c,0x6a1af14f,0xc0ae77bb,0x0f342e65
	.word  0x3d1b8ec8,0x443e7126,0x7bc62407,0x610f3497
	.word  0xe981f54a,0xd412f88c,0xf83e54b1,0x55c8eda8
	.word  0x69d67412,0xe43f2b53,0x38d2734c,0x25e2d668
	.word  0x7f8da52f,0x96b68cd8,0x6ddeb9b3,0x587f8849
	.word  0x77be20ee,0x6deb2323,0x97290679,0xeec5ea51
	.word  0x44d77b74,0x2dc69d35,0xe12546db,0xd1151ad6
	.word  0xc66cb371,0x9577d97b,0x57e86352,0xe54bc8d1
	.word  0xc37c88f8,0x56ffe691,0x28e548cc,0x8df1bb4a
	.word  0x002b90b6,0xf30ad210,0xb83c223d,0xe9158dd3
	.word  0x9dc94a8d,0x1c99abef,0x5d3d881a,0x4130804c
	.word  0x473dda65,0x2c33b847,0x60543434,0x636ac6bb
	.word  0xd30e023e,0x18868c1c,0x93d7a7ad,0x62eb732e
	.word  0x5d8c903e,0x31df5859,0x0ac975b0,0xa78bb5a5
	.word  0x92fa4ca2,0x74ecdcfe,0xb36c46f1,0xb762643d
	.word  0xee07f74f,0x6d0a496c,0xcca1ba99,0x3184f8e0
	.word  0x7565f5ba,0x72c69fcd,0xd64258d6,0xf63667f8
	.word  0xa8e1405b,0x9111af5c,0x4154177f,0xb7935fca
	.word  0xe97d69f9,0x7ae07509,0x80f4c559,0xcb9f86a3
	.word  0xf4ff7192,0x5e7be5d0,0x79e94307,0xbb6c5f60
	.word  0x2701bb24,0xaccbcb12,0x9dd16158,0x04089651
	.word  0x8270f610,0x267961eb,0xed3d2761,0x82e8b00f
	.word  0xa320469a,0xb182f610,0x6e12e48c,0x29356229
	.word  0x5d45b96f,0x8d704f4d,0x0785b6a7,0x1f216989
	.word  0xbe6442f6,0x59e749b8,0xf2e3b7d9,0x2ac2592f
	.word  0xe8b8a4e9,0x6d55e15f,0xed3146d6,0x00aa9030
	.word  0x6a329633,0x782a4ef7,0xb819ba1b,0x40bb5656
	.word  0xdc5c7ac6,0x71bc3378,0x952f2be0,0xbff483a1
	.word  0x52f19802,0xbb2a687c,0xe9e8b791,0xb8ea481f
	.word  0x6c9ac5cf,0xb53d16a9,0x0aef9ee1,0x74e5e906
	.word  0x408e5e03,0x24ab1525,0x19c3426c,0x5d8d1e77
	.word  0xa6590c83,0xabee1565,0x1fc8ed59,0xe358f782
	.word  0x8098cec6,0x15ae29a8,0x972f9ab9,0x918dd645
	.word  0x28bc99d0,0x7260bc19,0x731f9ade,0xda415663
	.word  0x823c51f5,0xd1a1909b,0xa82ae756,0x5ac44b54
	.word  0x7b268e20,0x765d1458,0xcb515d18,0x67811f0a
	.word  0xf70b2dbb,0x138eadaf,0xd465a32f,0xec52bd9a
	.word  0xdc93cb81,0x14c244f6,0x74bf33c1,0x04386a46
	.word  0x90d414a6,0xd82fb484,0x1a0157b1,0x4ead03b2
	.word  0x7188cc42,0x0d0e2f0e,0x8ad405c5,0x4101856e
	.word  0x18531a5c,0x95e6c1f7,0xe30356af,0xe076b6db
	.word  0x058a4937,0xae0d8da1,0x33df1bdd,0x0eb30085
	.word  0x4645d512,0xf30a5c5b,0xd7e8f880,0xa9418301
	.word  0xda239766,0x2b85724a,0x9384ef93,0xb704138c
	.word  0xe03d5be9,0x07d5c471,0x9729b4de,0xe40f3a4f
	.word  0x50828621,0x327390eb,0x05284779,0x3e6ca695
	.word  0xa934778e,0x1b389283,0xc53e03cf,0x11d0b7a0
	.word  0x7da3ce12,0xb3adc00d,0x74ef6114,0xfcd2f325
	.word  0x0a2011da,0xccff1fcd,0xfd56008e,0x3fcca8da
	.word  0x9f185d81,0xe8110d9c,0x27b54e28,0x19c11410
	.word  0x4ba70e7c,0x425c6b24,0x58b73626,0x904060c1
	.word  0xc131865c,0x523771cb,0x53f9e247,0xdec2b333
	.word  0x82d71fe2,0x11047def,0x08b3db61,0x1ba86c18
	.word  0xa6e38a29,0xdc86fd9c,0x666b4b95,0xc3426149
	.word  0x9cfc1f86,0xe5567361,0xeac28393,0xb0770024
	.word  0x1fe55db0,0xcb51430f,0xed9f2904,0x75f8a896
	.word  0x26997747,0x7c8c18c7,0x5e38d4ae,0x7889dc9b
	.word  0xbc5b8251,0x86d2852d,0x3d73e0b2,0x21749018
	.word  0x84cfa9f4,0xa88bbc14,0xd4bff444,0x72d15851
	.word  0x4985b865,0x7ab54e1c,0xf672efab,0xc9c4f81a
	.word  0xc31533f3,0x75623fbe,0x805f809a,0x373c8800
	.word  0x0f9c0473,0xb0bdbc37,0x3a87c4ce,0x2a0bcab1
	.word  0x4084b204,0x113d294d,0x6fcea851,0x7b019e07
	.word  0x8af0c6bf,0xb6ec5cec,0xcc54150f,0xf73e1f98
	.word  0xafbe2957,0xeec242d5,0x90c321ac,0xaa63a65e
	.word  0x019653a1,0x6c16f7a3,0xe76ebe4c,0x30f241a3
	.word  0x3baec4e8,0xcbc517d2,0xdd99a33b,0x3516a7bd
	.word  0xf51ddb4c,0x6de01838,0xccf44f5e,0x4bf4827d
	.word  0xab31b9b6,0x7a110a07,0x6e411cc3,0xcf0c9c6d
	.word  0x89bf567d,0xe5bc9c0d,0x00e8170f,0x8670f4f9
	.word  0x88687ff3,0x9f3019fc,0x5baed5cc,0x6ba3520a
	.word  0x41591a38,0x428cba15,0x4691a508,0x9cbddc86
	.word  0xb6a73938,0x58cdd82b,0x2d82ba46,0x4c52c392
	.word  0x7847a8ad,0xd59bed9b,0xdc62d670,0xab7eb53a
	.word  0x3043aaf1,0x581a2db1,0x4530f1ad,0x8fa7bcb7
	.word  0xf2a02925,0x64622f6c,0xc1396c64,0x8fd71b2f
	.word  0x8ec89453,0xf8ba8e11,0x2d3b2a05,0xb539f074
	.word  0x52a95823,0x6b92c303,0x03e58e76,0x4013e850
	.word  0xee2f2fae,0xb2857de4,0x12bbae38,0x46b83065
	.word  0xed28bcbd,0xa2acf7fc,0xcad1f9b2,0xdfc473d3
	.word  0x574118b2,0xb8a4a532,0x880d87fc,0x736941fe
	.word  0x9a5cd7e9,0xe9e0b146,0x77f871e1,0x3c31140f
	.word  0x3bd4ff1f,0xa6650606,0x334c3e41,0xdd5d490c
	.word  0x910a24c2,0xb0e6114c,0x290a4054,0xbf586d4e
	.word  0xd9ff02ef,0x289f3988,0xe60a11bc,0x69c5394d
	.word  0xc2aa434e,0x28587d8e,0xadc51446,0x1d8cd242
	.word  0xcb031bd9,0xc26b695d,0xb678db4d,0xe072182c
	.word  0x31a6497c,0x8f4747a9,0x8caf53f8,0x3957b27c
	.word  0x6c9330b8,0xb8e78b73,0x10123caa,0x517defb3
	.word  0xaf617893,0x5f64db24,0x545a5bd6,0x96c6d117
	.word  0x7f4be387,0xe98a0175,0xd96ddc05,0xbef601c7
	.word  0x960e643b,0xb6f38d15,0x64f5c2e5,0xa5420967
	.word  0x6bd4c2f9,0x66f24a04,0x49b51608,0x2b71da47
	.word  0x0d0d4c6a,0xe4b67ba7,0xf964ff92,0xde7824e3
	.word  0xb0167dc4,0x0ecedeb6,0x55d6ee29,0x2f04c37f
	.word  0x2e5843ac,0x040b5744,0x1f2dc911,0x530a0fbd
	.word  0x2d3dfb2a,0xe318ba71,0xed1f35b3,0x27fcc067
	.word  0xa2c95a54,0x8ac4a15c,0xba5877f1,0x94a36797
	.word  0xe80a586b,0xd777f977,0xb07e6c8f,0x8562ce0f
	.word  0x8ed13760,0x1fc30799,0xf3c87da9,0x33f09d2d
	.word  0xb0d77541,0xa57e6417,0x012ab61c,0xecdd46da
	.word  0x22917866,0xac2ce304,0xf7a371ec,0x99124979
	.word  0x0370f457,0xaa930cb2,0xa0956ce7,0x66864646
	.word  0x907092b2,0x795b1d02,0xa4f9b8e7,0x7a7f4f96
	.word  0x3f4df47f,0xbd836a35,0x848c7961,0x9bf66f72
	.word  0xdc936a8b,0x605034c5,0xd3908ce5,0xf17ab39d
	.word  0x98a404b4,0xde99f105,0xe21f5d58,0xa71e6d8d
	.word  0x9f8cf300,0x7a44c39c,0xaa9f18a7,0x2d323df3
	.word  0x9ed846c9,0xaec692ad,0xb70bd6bb,0x010ae412
	.word  0x7c7e89da,0xf37b3aec,0xacf41be5,0x784467da
	.word  0x86651ea8,0xfed47099,0xd640ad88,0xa9ee2f39
	.word  0xcbe8eb59,0x7aafa18b,0x819b9478,0xc48745ab
	.word  0x1b9b00db,0x3d2b0bce,0x50ed89fe,0x17e85ea7
	.word  0x6e85ac5f,0x40d0d298,0x6bdbbd31,0x939a543b
	.word  0x8e67a28f,0x52b1d88e,0xc0a1432c,0xaba87fff
	.word  0xf721b8c3,0x22171159,0x7f0def04,0xbf486d84
	.word  0x9a6d4593,0x6206b836,0x08472556,0x53961560
	.word  0xaa711a23,0x5404432d,0x420a7e66,0x8e887209
	.word  0x017e044a,0x09559802,0xa3a2d9ff,0x2d67b2c1
	.word  0x905fc64d,0x70eb01c9,0xfe3949b9,0x99c2afa7
	.word  0xfd096df6,0xab19545a,0x5779a12a,0x75adb3e0
	.word  0xc550206a,0x58221bfb,0x85eebf72,0x3aec0f93
	.word  0x8b965643,0x638e9a2e,0x0c23b5c0,0x8d11701a
	.word  0xb7ba7b46,0x59ce9f99,0x915b8da7,0xada3ffe2
	.word  0x8e9a66db,0x78643997,0xd996b85b,0x288dd84b
	.word  0xd3dc4f4b,0xbe109dce,0xab901c44,0x249bcc24
	.word  0x120f9969,0x943a07ec,0x23d975b2,0x4e8e7137
	.word  0xb3998e7c,0xb62e8d69,0x36b63a3a,0x902048f4
	.word  0xe18d8503,0x5ac0cd71,0xb670a209,0x81e90b0e
	.word  0xb662a9c1,0x96a1f1f0,0xd8be66e7,0xbdc1019f
	.word  0x5e78e14c,0xd3585970,0x144a448f,0xe79392b0
	.word  0xc870a5f8,0x038013a5,0x3518db12,0x3fe67842
	.word  0xee675ed9,0x5c230f0f,0x1733c91e,0x916e6c1d
	.word  0x3d73f243,0x387dae20,0xd3fa1d1d,0xfe45414c
	.word  0xfd903fee,0xf5af0b98,0x571220e3,0x803f353c
	.word  0xc40465d1,0x1d956016,0x58a2cd97,0xaaf8bc00
	.word  0x6329b2fe,0x49f7c7cd,0xe06c805f,0x649f89e7
	.word  0x40ab3c2c,0xc4d94dce,0xbda926b6,0x8d9ea68e
	.word  0x321edcac,0xb7d08d77,0xd9cdac13,0x9bb896e2
	.word  0xca5aee71,0x2e0995db,0x56fa6a64,0x3d4b28c0
	.word  0x40dd680b,0x99822323,0xe164e06b,0x61ae2269
	.word  0xd96c8642,0x1ca50257,0xefff25ec,0xb636a492
	.word  0x886d4c0e,0x3a8c06cf,0xc79ab633,0xa16f549e
	.word  0xcdf52bb3,0x7c1ab0ee,0x6fe8b815,0xee96076f
	.word  0xd88e3fa0,0x3105c57c,0x1978fd6f,0xe8d76bf7
	.word  0x00ac5381,0x1883e00a,0x759fa20e,0x232faaa2
	.word  0x9f447e50,0x004161ef,0x70a3210f,0x83e04759
	.word  0xafad3435,0xf17cbbff,0xbdcc2033,0x9ecf92c0
	.word  0x8ff9433f,0x17e45d27,0x69203a30,0xa68dae82
	.word  0xd6998473,0xf39ee55e,0xfbee3d78,0x3d919311
	.word  0x9f21ea5a,0x7da0e5ad,0xa088a356,0xa41ad324
	.word  0xd8e2a995,0x1f223ea9,0x3cfab534,0x3257723d
	.word  0x6548c997,0x9c7e6f12,0x6dab9547,0x61eb4bd2
	.word  0x0ac82f94,0xe8baf275,0xb9497a7f,0xeb8dc4bb
	.word  0x6c8709fa,0xd78316dd,0xdfb31d83,0xa38e57b5
	.word  0x3c0996bc,0x65bbfc9c,0x90748b3f,0xeac8cfbf
	.word  0x63324387,0x0866e560,0xce7256b2,0xa532b5f8
	.word  0x53bde4c2,0xf5fb405f,0x7404e90b,0xb4fa87cd
	.word  0x5585437e,0xb859ef66,0x58ca5259,0x8d27a3d4
	.word  0x024613ea,0x8cba00fe,0xe23b2ddf,0xa10c2a7b
	.word  0xe4858483,0x769f452b,0x603995a6,0xab1c87f3
	.word  0xa85cc789,0x93b9d804,0x9ceb3594,0xeaec393f
	.word  0x18532f5b,0x2e70ba29,0x9700c2df,0xfaf7d78d
	.word  0x7002f822,0x5c1fccda,0x4521e177,0xfdb0ad4b
	.word  0x301f02a4,0xa8341db1,0x6c196d78,0x9aabb295
	.word  0x188354ce,0x68b719cd,0x48ed3082,0x9689a9e8
	.word  0x63a11097,0x24f25787,0x95b80361,0x0da17e03
	.word  0x58fdd73f,0xd381d076,0x0e0b15d2,0x02ce229f
	.word  0x8c948109,0xa0017dc9,0xc0b40ff7,0xa1b8ae3a
	.word  0x8cde8a7e,0xa0395233,0x30226501,0xcffd857c
	.word  0x53020707,0xc231117f,0xc197707f,0x0c1ae9ae
	.word  0x63b6fc91,0x13f6d40c,0x524299a1,0xc1b96d40
	.word  0x9004ecba,0xc54e8e33,0x530711f0,0xa8b5aa7f
	.word  0x190ccf84,0x9a51a0fc,0x6f23301a,0xdb31768f
	.word  0x9745b9fa,0xa3e660ab,0x33cae425,0xadb9dda7
	.word  0x67b71414,0xc2081eca,0x75ee69e5,0x2e1c30c9
	.word  0x1d4a6118,0xf8d92a55,0x3ca3884b,0x84a06ac1
	.word  0x379eccae,0xb6e407f4,0x6ce9560e,0x3053dbeb
	.word  0xb5ce068e,0xba4fc82c,0x11a4eed1,0xa075a211
	.word  0xa897d751,0x6fe4ed33,0xf10e28e2,0xcb570b4a
	.word  0xccbac82e,0x6af5b2ae,0x04b5f5e7,0x74942552
	.word  0x11810529,0xb3032276,0xc22f24f6,0x12a57d7a
	.word  0xc5fca8af,0xfc73fd00,0xdb3e002f,0xf65d2979
	.word  0x60dd4c69,0x26cbac08,0x349b2585,0x5cd319c5
	.word  0x50833c8e,0x61d7e4ff,0x1811c15d,0x8a411e5f
	.word  0x9e3b4b36,0x0ce69758,0x2789323e,0xd0e14cb3
	.word  0x8c19f250,0xd43694a7,0x284fbd6d,0xbe39c607
	.word  0xe368cfaf,0xc1ae950d,0xa95ff553,0xf2d39509
	.word  0x4759719d,0x4d3e2e5d,0x3f01af18,0x83b8c87a
	.word  0x5bf38a68,0xf10a5621,0x4692c8bb,0xc2a44d23
	.word  0xc170ce0a,0xdd90794f,0x5ffe9313,0xba3d8663
	.word  0x6619182d,0xbe0e170f,0x545df030,0x9ed00ba2
	.word  0xf70ff483,0xd0687298,0x1bfda23c,0x5ba75396
	.word  0x5da949b7,0x55b62a5d,0xcc2e5246,0x2fd680cb
	.word  0x3c8c494f,0x772bd26d,0xe30e311d,0x7b5212ea
	.word  0x9a36f4fe,0xee355832,0xa7569118,0x0e8a989e
	.word  0x6c7d8100,0x8ac91a9f,0x5f54f103,0x8e546d82
	.word  0x813cc9c3,0x9b912870,0x6d9f829e,0xf444f506
	.word  0xd6df7992,0x15e22035,0x352d121a,0x7d58a567
	.word  0x211931ab,0xbf9e444f,0xffcd512d,0xc525e48f
	.word  0x8a104400,0xcc5819a9,0xa1a67c50,0x5d3c2997
	.word  0xee7c6a69,0x98c86bef,0xf49b8a42,0x33983e02
	.word  0x9bdf5b5a,0xed9b1479,0xe50cd7a7,0xcc95bed7
	.word  0x265447b3,0x14c36710,0x5b7c7680,0xbab7854c
	.word  0x5dbb1710,0x9aa112c1,0x7cd02f79,0x246323b4
	.word  0xfd922295,0xc39668cc,0xd199af39,0xc7895717
	.word  0x68716292,0x25156d76,0xbc2fa446,0xe3c7b8ba



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
!!#   IJ_copy_ropr ("diag.j", 58, Ro_load_r, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 59, Ro_load_r, Ft_Rs2, "{0}");
!!# 
!!#   IJ_copy_ropr ("diag.j", 61, Ro_rsvd_set, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_rsvd_set, Ft_Rs1, "{2..8}");
!!#   IJ_set_ropr_fld ("diag.j", 63, Ro_rsvd_set, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 64, Ro_rsvd_set, Ft_Rd, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 65, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");  
!!#   IJ_set_ropr_bits ("diag.j", 66, Ro_rsvd_set, 0xf70, "12'b000011100000");
!!# 
!!#   IJ_copy_ropr ("diag.j", 68, Ro_ba, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 69, Ro_ba, Ft_D16, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_ba, Ft_Disp22, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 71, Ro_ba, Ft_Disp19, "{0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 72, Ro_ba, Ft_Disp30, "{0x3}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 81, th_fpop, 0x1);
!!#   IJ_bind_thread_group("diag.j", 82, th_evnt, 0x2);
!!#   IJ_bind_thread_group("diag.j", 83, th_all,0x3);
!!# 
!!#   IJ_th_fork_group ("diag.j", 86, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 90, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 16; i < 32; i++) {
!!#      IJ_printf ("diag.j", 92, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 96, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 98, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 2; i < 9; i++) {
!!#      IJ_printf ("diag.j", 103, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 106, th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 107, th_all, 4);
!!#   IJ_printf ("diag.j", 108, th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_printf ("diag.j", 112, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 113, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 114, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 115, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 116, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 117, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 118, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 119, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 120, th_all, "	nop\n");
!!#   IJ_th_join ("diag.j", 121,0xf);
!!#   IJ_th_start ("diag.j", 122,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 124, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 125, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 126, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 127, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 128, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 129, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 130, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 131, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 132, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 133, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 135, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 136, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 138, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 139, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# diag: fpops inst_block
!!# ;
!!# 
!!# fpops: mMETA60
!!# 
!!#            {
!!#               i = 0;
!!# 	      while (i < 10) {
!!#  	         IJ_generate_from_token ("diag.j", 172,20, th_fpop, ijdefault,tSTF_R, tSTF_I, tSTDF_I, tSTDF_R, tFADDs, tFSUBs, tFMULs, tFDIVs, tFADDd, tFSUBd, tFMULd, tFDIVd, tLDF_R, tLDDF_R, tLDF_I, tLDDF_I, -1);;
!!#  	         IJ_generate_from_token ("diag.j", 173,10, th_fpop, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!# 	   | br_fpop
!!# 
!!#            | resum_intr 
!!# 
!!# ;
!!# 
!!# br_fpop: d18 st_irferr_unalgn branch icerr fpop alu icerr alu
!!# 
!!# ;
!!# 
!!# branch: mMETA2000
!!# {
!!#    IJ_generate_from_token ("diag.j", 243,1, th_evnt,Ro_ba,tBA, -1);;
!!# }
!!# ;
!!# 
!!# d18: mMETA1
!!# {
!!#    IJ_printf ("diag.j", 249, th_evnt, ".align 0x8\n");
!!# }
!!# ;
!!# 
!!# alu_irf_err: d33 irferr alu trpm_alu alu fpop_ic_err 
!!# ;
!!# d33: mMETA33
!!# {
!!#    if ((random () % 2) == 1) {
!!#       IJ_printf ("diag.j", 258, th_evnt, " .align 0x20\n");
!!#       IJ_printf ("diag.j", 259, th_evnt, " .skip 0x10\n");
!!#    }
!!# }
!!# ;
!!# 
!!# d34: mMETA34
!!# {
!!#    if ((random () % 2) == 1) {
!!#       IJ_printf ("diag.j", 267, th_evnt, " .align 0x20\n");
!!#       IJ_printf ("diag.j", 268, th_evnt, " .skip 0x18\n");
!!#    }
!!# }
!!# ;
!!# 
!!# d35: mMETA35
!!# {
!!#    if ((random () % 2) == 1) {
!!#       IJ_printf ("diag.j", 276, th_evnt, " .align 0x20\n");
!!#       IJ_printf ("diag.j", 277, th_evnt, " .skip 0x14\n");
!!#    }
!!# }
!!# ;
!!# 
!!# fpop_ic_err: icerr fpop
!!#            | d1 fpop
!!#            | d2 fpop icerr alu
!!# //	   | d17 fpop lop
!!# ;
!!# 
!!# ldst_irf_err:   d33 st_irferr_unalgn trpm_alu alu fpop_ic_err 
!!#                 | d34 ld_irferr_unalgn fpop_ic_err
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
!!# ld_dc_err: d35 dcerr load_r trpm_alu fpop_ic_err
!!# ;
!!# 
!!# resum_intr: mMETA16
!!# {
!!#   IJ_printf ("diag.j", 309, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf ("diag.j", 310, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(%y, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!#   burst_cnt = random () % 7 + 7; 
!!#   IJ_generate_from_token ("diag.j", 313,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_generate_from_token ("diag.j", 320,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_printf ("diag.j", 326, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 5;
!!#    if (i > 0) {
!!# //      IJ_printf (th_evnt, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 331, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!# //      IJ_printf (th_evnt, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 335, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!# //      IJ_printf (th_evnt, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 340, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA19
!!# {
!!#    IJ_printf ("diag.j", 348, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 350, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf ("diag.j", 357, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf ("diag.j", 359, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr_on_load: mMETA35
!!# {
!!#      IJ_printf ("diag.j", 366, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      if ((random () % 3) == 0) {
!!#        bitnum = random () % 72;
!!#      } else {
!!#        bitnum = random () % 10;
!!#      }
!!#      IJ_printf ("diag.j", 372, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# 
!!# }
!!# ;
!!# 
!!# trpm_alu: d10 alu 
!!#           | d5 alu %ropr  Ro_rsvd_set
!!# ;
!!# 
!!# fpop: d11 fpop_tokens
!!# {
!!#    IJ_generate ("diag.j", 384, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# fpop_tokens: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R | tFADDs | tFSUBs | tFMULs | tFDIVs 
!!#              | tFADDd | tFSUBd | tFMULd | tFDIVd | tLDF_R | tLDDF_R | tLDF_I | tLDDF_I
!!# ;
!!# 
!!# load: d12 load_r_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 395, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!#       | d12 load_i_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 400, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!# ;
!!# 
!!# load_r: d13 load_r_tokens %ropr  Ro_load_r
!!# {
!!#    IJ_generate ("diag.j", 407, th_evnt, $2);
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
!!#    IJ_generate ("diag.j", 422, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# store_i_tokens: tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# ;
!!# 
!!# alu: d15 alu_tokens
!!# {
!!#    IJ_generate ("diag.j", 432, th_evnt, $2);
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
!!# d5000: mMETA5000
!!# ;
!!# 
!!# d6000: mMETA6000
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

