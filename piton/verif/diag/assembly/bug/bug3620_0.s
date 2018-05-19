// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3620_0.s
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
   random seed:	417449951
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
	setx  0xd3a0cdf186ea477d, %r16, %r16
	setx  0xebdb6d4eab972a50, %r16, %r17
	setx  0x7b4d6ade0d85ff5c, %r16, %r18
	setx  0x58a481a85e9cbceb, %r16, %r19
	setx  0x76217e260652892c, %r16, %r20
	setx  0x15bfa575e9a13d82, %r16, %r21
	setx  0xde2144ca577b1bb6, %r16, %r22
	setx  0x11c57b29e4fe0c27, %r16, %r23
	setx  0x0cda503fde1ba348, %r16, %r24
	setx  0x1961c0535a98c200, %r16, %r25
	setx  0x2568a697f621ee25, %r16, %r26
	setx  0x537ddc370128c1f1, %r16, %r27
	setx  0x96848c18dcfca7e9, %r16, %r28
	setx  0x7e0c743131cb22dc, %r16, %r29
	setx  0xe641dbbfba9a1c69, %r16, %r30
	setx  0x7fa3afc5e7c71f0d, %r16, %r31
	setx  0x0000000000000690, %r16, %r9
	setx  0x0000000000000c40, %r16, %r10
	setx  0x0000000000000140, %r16, %r11
	setx  0x0000000000000760, %r16, %r12
	setx  0x00000000000007c0, %r16, %r13
	setx  0x0000000000000160, %r16, %r14
	setx  0x0000000000000850, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xa2f9c00c  ! 328: SDIVcc_R	sdivcc 	%r7, %r12, %r17
	.word 0xaa69aa11  ! 328: UDIVX_I	udivx 	%r6, 0x0a11, %r21
	.word 0xb369e4cc  ! 328: SDIVX_I	sdivx	%r7, 0x04cc, %r25
	.word 0xae69800d  ! 328: UDIVX_R	udivx 	%r6, %r13, %r23
	.word 0xae70a21a  ! 328: UDIV_I	udiv 	%r2, 0x021a, %r23
	.word 0xb4f0c00d  ! 328: UDIVcc_R	udivcc 	%r3, %r13, %r26
	.word 0xbc69c00f  ! 328: UDIVX_R	udivx 	%r7, %r15, %r30
	.word 0xb769c00e  ! 328: SDIVX_R	sdivx	%r7, %r14, %r27
	.word 0xaf69c00c  ! 328: SDIVX_R	sdivx	%r7, %r12, %r23
	.word 0xb368800a  ! 328: SDIVX_R	sdivx	%r2, %r10, %r25
	.word 0xb16a2b5c  ! 328: SDIVX_I	sdivx	%r8, 0x0b5c, %r24
	.word 0xa8f8c00e  ! 328: SDIVcc_R	sdivcc 	%r3, %r14, %r20
	.word 0xa4f1c00a  ! 328: UDIVcc_R	udivcc 	%r7, %r10, %r18
	.word 0xb2f1e105  ! 328: UDIVcc_I	udivcc 	%r7, 0x0105, %r25
	.word 0xa87a000b  ! 328: SDIV_R	sdiv 	%r8, %r11, %r20
	.word 0xb278800c  ! 328: SDIV_R	sdiv 	%r2, %r12, %r25
	.word 0xb4f14009  ! 328: UDIVcc_R	udivcc 	%r5, %r9, %r26
	.word 0xb66a27f0  ! 328: UDIVX_I	udivx 	%r8, 0x07f0, %r27
	.word 0xa679a350  ! 328: SDIV_I	sdiv 	%r6, 0x0350, %r19
	.word 0xa479000c  ! 328: SDIV_R	sdiv 	%r4, %r12, %r18
	.word 0xa478e19d  ! 328: SDIV_I	sdiv 	%r3, 0x019d, %r18
	.word 0xba716fcf  ! 328: UDIV_I	udiv 	%r5, 0x0fcf, %r29
	.word 0xbc718009  ! 328: UDIV_R	udiv 	%r6, %r9, %r30
	.word 0xbaf9eb7c  ! 328: SDIVcc_I	sdivcc 	%r7, 0x0b7c, %r29
	.word 0xa0f2000f  ! 328: UDIVcc_R	udivcc 	%r8, %r15, %r16
	.word 0xb669c009  ! 328: UDIVX_R	udivx 	%r7, %r9, %r27
	.word 0xaaf0ec8a  ! 328: UDIVcc_I	udivcc 	%r3, 0x0c8a, %r21
	.word 0xb7696a24  ! 328: SDIVX_I	sdivx	%r5, 0x0a24, %r27
	.word 0xbef96aca  ! 328: SDIVcc_I	sdivcc 	%r5, 0x0aca, %r31
	.word 0xb0f0800e  ! 328: UDIVcc_R	udivcc 	%r2, %r14, %r24
	.word 0xa678c00e  ! 328: SDIV_R	sdiv 	%r3, %r14, %r19
	.word 0xb870c009  ! 328: UDIV_R	udiv 	%r3, %r9, %r28
	.word 0xa0f20009  ! 328: UDIVcc_R	udivcc 	%r8, %r9, %r16
	.word 0xba712a20  ! 328: UDIV_I	udiv 	%r4, 0x0a20, %r29
	.word 0xbf69208e  ! 328: SDIVX_I	sdivx	%r4, 0x008e, %r31
	.word 0xba71e05a  ! 328: UDIV_I	udiv 	%r7, 0x005a, %r29
	.word 0xa4fa0009  ! 328: SDIVcc_R	sdivcc 	%r8, %r9, %r18
	.word 0xa8f1800d  ! 328: UDIVcc_R	udivcc 	%r6, %r13, %r20
	.word 0xb671a914  ! 328: UDIV_I	udiv 	%r6, 0x0914, %r27
	.word 0xa2696d32  ! 328: UDIVX_I	udivx 	%r5, 0x0d32, %r17
	.word 0xaaf8c00f  ! 328: SDIVcc_R	sdivcc 	%r3, %r15, %r21
	.word 0xb968c009  ! 328: SDIVX_R	sdivx	%r3, %r9, %r28
	.word 0xb86a0009  ! 328: UDIVX_R	udivx 	%r8, %r9, %r28
	.word 0xbe69800e  ! 328: UDIVX_R	udivx 	%r6, %r14, %r31
	.word 0xb0f0efc5  ! 328: UDIVcc_I	udivcc 	%r3, 0x0fc5, %r24
	.word 0xb8f9800d  ! 328: SDIVcc_R	sdivcc 	%r6, %r13, %r28
	.word 0xb468800a  ! 328: UDIVX_R	udivx 	%r2, %r10, %r26
	.word 0xbe69800b  ! 328: UDIVX_R	udivx 	%r6, %r11, %r31
	.word 0xa669efe6  ! 328: UDIVX_I	udivx 	%r7, 0x0fe6, %r19
	.word 0xb2f1000c  ! 328: UDIVcc_R	udivcc 	%r4, %r12, %r25
	.word 0xb369e6fe  ! 328: SDIVX_I	sdivx	%r7, 0x06fe, %r25
	.word 0xb4712a7f  ! 328: UDIV_I	udiv 	%r4, 0x0a7f, %r26
	.word 0xa271c00d  ! 328: UDIV_R	udiv 	%r7, %r13, %r17
	.word 0xb270c009  ! 328: UDIV_R	udiv 	%r3, %r9, %r25
	.word 0xaa70a80c  ! 328: UDIV_I	udiv 	%r2, 0x080c, %r21
	.word 0xa668c00a  ! 328: UDIVX_R	udivx 	%r3, %r10, %r19
	.word 0xb96a000c  ! 328: SDIVX_R	sdivx	%r8, %r12, %r28
	.word 0xbb68800f  ! 328: SDIVX_R	sdivx	%r2, %r15, %r29
	.word 0xbd69c00e  ! 328: SDIVX_R	sdivx	%r7, %r14, %r30
	.word 0xa069a381  ! 328: UDIVX_I	udivx 	%r6, 0x0381, %r16
	.word 0xa4f92a6d  ! 328: SDIVcc_I	sdivcc 	%r4, 0x0a6d, %r18
	.word 0xba79aac3  ! 328: SDIV_I	sdiv 	%r6, 0x0ac3, %r29
	.word 0xaef9400e  ! 328: SDIVcc_R	sdivcc 	%r5, %r14, %r23
	.word 0xb068c00f  ! 328: UDIVX_R	udivx 	%r3, %r15, %r24
	.word 0xb4792f1f  ! 328: SDIV_I	sdiv 	%r4, 0x0f1f, %r26
	.word 0xa478a7c8  ! 328: SDIV_I	sdiv 	%r2, 0x07c8, %r18
	.word 0xb2796de9  ! 328: SDIV_I	sdiv 	%r5, 0x0de9, %r25
	.word 0xa2f9400d  ! 328: SDIVcc_R	sdivcc 	%r5, %r13, %r17
	.word 0xac69000c  ! 328: UDIVX_R	udivx 	%r4, %r12, %r22
	.word 0xa878800a  ! 328: SDIV_R	sdiv 	%r2, %r10, %r20
	.word 0xa4712ede  ! 328: UDIV_I	udiv 	%r4, 0x0ede, %r18
	.word 0xa079271e  ! 328: SDIV_I	sdiv 	%r4, 0x071e, %r16
	.word 0xbc722f1c  ! 328: UDIV_I	udiv 	%r8, 0x0f1c, %r30
	.word 0xb9692f24  ! 328: SDIVX_I	sdivx	%r4, 0x0f24, %r28
	.word 0xae698009  ! 328: UDIVX_R	udivx 	%r6, %r9, %r23
	.word 0xbcf8a56c  ! 328: SDIVcc_I	sdivcc 	%r2, 0x056c, %r30
	.word 0xa2fa2ae2  ! 328: SDIVcc_I	sdivcc 	%r8, 0x0ae2, %r17
	.word 0xbc69000d  ! 328: UDIVX_R	udivx 	%r4, %r13, %r30
	.word 0xba7962cb  ! 328: SDIV_I	sdiv 	%r5, 0x02cb, %r29
	.word 0xbef0aeaf  ! 328: UDIVcc_I	udivcc 	%r2, 0x0eaf, %r31
	.word 0xad68e0c9  ! 328: SDIVX_I	sdivx	%r3, 0x00c9, %r22
	.word 0xb4f9eaf5  ! 328: SDIVcc_I	sdivcc 	%r7, 0x0af5, %r26
	.word 0xaef0ed2e  ! 328: UDIVcc_I	udivcc 	%r3, 0x0d2e, %r23
	.word 0xa4f1400e  ! 328: UDIVcc_R	udivcc 	%r5, %r14, %r18
	.word 0xae72000b  ! 328: UDIV_R	udiv 	%r8, %r11, %r23
	.word 0xb16a000b  ! 328: SDIVX_R	sdivx	%r8, %r11, %r24
	.word 0xaaf163b9  ! 328: UDIVcc_I	udivcc 	%r5, 0x03b9, %r21
	.word 0xa068e1ac  ! 328: UDIVX_I	udivx 	%r3, 0x01ac, %r16
	.word 0xbaf1400b  ! 328: UDIVcc_R	udivcc 	%r5, %r11, %r29
	.word 0xa0f9e9c2  ! 328: SDIVcc_I	sdivcc 	%r7, 0x09c2, %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x08f044db3738d0e2, %r16, %r16
	setx  0x22dbef6cf866bcd1, %r16, %r17
	setx  0xbc96596091e223ab, %r16, %r18
	setx  0xec1786ba2c9cc78f, %r16, %r19
	setx  0x017f4dec8210c958, %r16, %r20
	setx  0xe1aee11b980fb146, %r16, %r21
	setx  0x81e7d8fcaa843104, %r16, %r22
	setx  0x2f8ff9b5c41fe31e, %r16, %r23
	setx  0x419f4e2dc31d8428, %r16, %r24
	setx  0x0832329eaa81ef6a, %r16, %r25
	setx  0x42495dfca9190891, %r16, %r26
	setx  0xbd561d89a688daba, %r16, %r27
	setx  0xce0a004f54c46218, %r16, %r28
	setx  0xf81a800f49dd22f7, %r16, %r29
	setx  0xb8f1607682b572bb, %r16, %r30
	setx  0xaa2a9bf11d69014d, %r16, %r31
	setx  0x00000000000000e0, %r16, %r9
	setx  0x00000000000005a0, %r16, %r10
	setx  0x0000000000000980, %r16, %r11
	setx  0x0000000000000a70, %r16, %r12
	setx  0x0000000000000ca0, %r16, %r13
	setx  0x0000000000000a20, %r16, %r14
	setx  0x0000000000000af0, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r2
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	.word 0xee48800d  ! 3: LDSB_R	ldsb	[%r2 + %r13], %r23
	.word 0xb631800d  ! 6: SUBC_R	orn 	%r6, %r13, %r27
	.word 0xae29ef91  ! 8: ANDN_I	andn 	%r7, 0x0f91, %r23
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,5,20)
	.word 0xb16a000b  ! 11: SDIVX_R	sdivx	%r8, %r11, %r24
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,45)
	.word 0xf0020000  ! 14: LDUW_R	lduw	[%r8 + %r0], %r24
	.word 0xb029c06c  ! 17: ANDN_R	andn 	%r7, %r12, %r24
	.word 0xbf6a2e03  ! 20: SDIVX_I	sdivx	%r8, 0x0e03, %r31
	.word 0xfe2a287b  ! 23: STB_I	stb	%r31, [%r8 + 0x087b]
	.word 0xaf29100c  ! 26: SLLX_R	sllx	%r4, %r12, %r23
	.word 0xab2a2001  ! 28: SLL_I	sll 	%r8, 0x0001, %r21
	.word 0xb271a68e  ! 31: UDIV_I	udiv 	%r6, 0x068e, %r25
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,NIR,x,11)
	.word 0xb6316a30  ! 34: ORN_I	orn 	%r5, 0x0a30, %r27
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xf6216425  ! 38: STW_I	stw	%r27, [%r5 + 0x0425]
	.word 0xb621806b  ! 41: SUB_R	sub 	%r6, %r11, %r27
	.word 0xacb0c00a  ! 43: ORNcc_R	orncc 	%r3, %r10, %r22
	.word 0xacf0c009  ! 46: UDIVcc_R	udivcc 	%r3, %r9, %r22
	.word 0xb5643801  ! 47: MOVcc_I	<illegal instruction>
	.word 0xb009000d  ! 47: AND_R	and 	%r4, %r13, %r24
	.word 0xb139f001  ! 47: SRAX_I	srax	%r7, 0x0001, %r24
	.word 0xa739e001  ! 47: SRA_I	sra 	%r7, 0x0001, %r19
	.word 0xb429e5dd  ! 47: ANDN_I	andn 	%r7, 0x05dd, %r26
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,20,x, x,x,x, x,x,x)
	.word 0xf431e26f  ! 51: STH_I	sth	%r26, [%r7 + 0x026f]
	.word 0xa729106f  ! 54: SLLX_R	sllx	%r4, %r15, %r19
	.word 0xa129d00e  ! 56: SLLX_R	sllx	%r7, %r14, %r16
	.word 0xa679a730  ! 59: SDIV_I	sdiv 	%r6, 0x0730, %r19
	.word 0xec10e5fc  ! 62: LDUH_I	lduh	[%r3 + 0x05fc], %r22
	.word 0xac816d5d  ! 65: ADDcc_I	addcc 	%r5, 0x0d5d, %r22
	.word 0xa339000d  ! 67: SRA_R	sra 	%r4, %r13, %r17
	.word 0xaa79400d  ! 70: SDIV_R	sdiv 	%r5, %r13, %r21
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xbcaa2097  ! 73: ANDNcc_I	andncc 	%r8, 0x0097, %r30
	.word 0xf0316ee4  ! 76: STH_I	sth	%r24, [%r5 + 0x0ee4]
	.word 0xb089aaae  ! 79: ANDcc_I	andcc 	%r6, 0x0aae, %r24
	.word 0xa5323001  ! 81: SRLX_I	srlx	%r8, 0x0001, %r18
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,7,x)
	.word 0xbaf9a91a  ! 84: SDIVcc_I	sdivcc 	%r6, 0x091a, %r29
	.word 0xfa49800d  ! 87: LDSB_R	ldsb	[%r6 + %r13], %r29
	.word 0xb6c1ebca  ! 90: ADDCcc_I	addccc 	%r7, 0x0bca, %r27
	.word 0xb890c009  ! 92: ORcc_R	orcc 	%r3, %r9, %r28
	.word 0xae6927e1  ! 95: UDIVX_I	udivx 	%r4, 0x07e1, %r23
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,57)
	.word 0xee010000  ! 98: LDUW_R	lduw	[%r4 + %r0], %r23
	.word 0xa430c069  ! 101: ORN_R	orn 	%r3, %r9, %r18
	.word 0xa6fa000b  ! 104: SDIVcc_R	sdivcc 	%r8, %r11, %r19
	.word 0xe642000b  ! 107: LDSW_R	ldsw	[%r8 + %r11], %r19
	.word 0xb139506b  ! 110: SRAX_R	srax	%r5, %r11, %r24
	.word 0xbeb12c87  ! 112: ORNcc_I	orncc 	%r4, 0x0c87, %r31
	.word 0xa669235b  ! 115: UDIVX_I	udivx 	%r4, 0x035b, %r19
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,NIR,x,27)
	.word 0xa530a001  ! 118: SRL_I	srl 	%r2, 0x0001, %r18
	.word 0xf0716490  ! 121: STX_I	stx	%r24, [%r5 + 0x0490]
	.word 0xb739d009  ! 124: SRAX_R	srax	%r7, %r9, %r27
	.word 0xaf299009  ! 126: SLLX_R	sllx	%r6, %r9, %r23
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,9,0)
	.word 0xb470ef61  ! 129: UDIV_I	udiv 	%r3, 0x0f61, %r26
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,48,x, x,x,x, x,x,x)
	.word 0xf428ec0f  ! 133: STB_I	stb	%r26, [%r3 + 0x0c0f]
	.word 0xa419400c  ! 136: XOR_R	xor 	%r5, %r12, %r18
	.word 0xb528e001  ! 138: SLL_I	sll 	%r3, 0x0001, %r26
	.word 0xb678a653  ! 141: SDIV_I	sdiv 	%r2, 0x0653, %r27
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xf670a9e9  ! 145: STX_I	stx	%r27, [%r2 + 0x09e9]
	.word 0xab64180b  ! 148: MOVcc_R	<illegal instruction>
	.word 0xa480c00a  ! 150: ADDcc_R	addcc 	%r3, %r10, %r18
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,16,17)
	.word 0xbd69800d  ! 153: SDIVX_R	sdivx	%r6, %r13, %r30
	.word 0xfc09800d  ! 156: LDUB_R	ldub	[%r6 + %r13], %r30
	.word 0xbe1967e9  ! 159: XOR_I	xor 	%r5, 0x07e9, %r31
	.word 0xa2b96864  ! 161: XNORcc_I	xnorcc 	%r5, 0x0864, %r17
	.word 0xa679ac82  ! 164: SDIV_I	sdiv 	%r6, 0x0c82, %r19
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR,29,x)
	.word 0xb530e001  ! 167: SRL_I	srl 	%r3, 0x0001, %r26
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16),1,IRF,ce,57,x, x,x,x, x,x,x)
	.word 0xba40800c  ! 170: ADDC_R	addc 	%r2, %r12, %r29
	.word 0xae98a563  ! 173: XORcc_I	xorcc 	%r2, 0x0563, %r23
	.word 0xb7782401  ! 175: MOVR_I	move	%r0, 0x563, %r27
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,NIR,x,1)
	.word 0xbe716a1b  ! 178: UDIV_I	udiv 	%r5, 0x0a1b, %r31
	.word 0xfe2961cb  ! 181: STB_I	stb	%r31, [%r5 + 0x01cb]
	.word 0xab29400e  ! 184: SLL_R	sll 	%r5, %r14, %r21
	.word 0xbcb14009  ! 186: ORNcc_R	orncc 	%r5, %r9, %r30
	.word 0xa670ef22  ! 189: UDIV_I	udiv 	%r3, 0x0f22, %r19
thr0_ic_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,IR_NIR,20,21)
	.word 0xbc398009  ! 192: XNOR_R	xnor 	%r6, %r9, %r30
	.word 0xfa522410  ! 195: LDSH_I	ldsh	[%r8 + 0x0410], %r29
	.word 0xb3293001  ! 198: SLLX_I	sllx	%r4, 0x0001, %r25
	.word 0xa0a9c00b  ! 200: ANDNcc_R	andncc 	%r7, %r11, %r16
	.word 0xbafa2dc5  ! 203: SDIVcc_I	sdivcc 	%r8, 0x0dc5, %r29
thr0_ic_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_10), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xb038eccf  ! 206: XNOR_I	xnor 	%r3, 0x0ccf, %r24
	.word 0xf030ec69  ! 209: STH_I	sth	%r24, [%r3 + 0x0c69]
	.word 0xa164186c  ! 212: MOVcc_R	<illegal instruction>
	.word 0xad2a2001  ! 214: SLL_I	sll 	%r8, 0x0001, %r22
	.word 0xbd696ac7  ! 217: SDIVX_I	sdivx	%r5, 0x0ac7, %r30
	.word 0xfc096da3  ! 220: LDUB_I	ldub	[%r5 + 0x0da3], %r30
	.word 0xbe90c069  ! 223: ORcc_R	orcc 	%r3, %r9, %r31
	.word 0xb729000f  ! 225: SLL_R	sll 	%r4, %r15, %r27
	.word 0xb270e3bc  ! 228: UDIV_I	udiv 	%r3, 0x03bc, %r25
	.word 0xf8092f52  ! 231: LDUB_I	ldub	[%r4 + 0x0f52], %r28
	.word 0xa339b001  ! 234: SRAX_I	srax	%r6, 0x0001, %r17
	.word 0xb839800e  ! 236: XNOR_R	xnor 	%r6, %r14, %r28
	.word 0xb079800f  ! 239: SDIV_R	sdiv 	%r6, %r15, %r24
	.word 0xf029a719  ! 242: STB_I	stb	%r24, [%r6 + 0x0719]
	.word 0xa211c06d  ! 245: OR_R	or 	%r7, %r13, %r17
	.word 0xac9a230a  ! 247: XORcc_I	xorcc 	%r8, 0x030a, %r22
thr0_ic_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_11), 16, 16),1,IC_DATA,IR_NIR,5,14)
	.word 0xac722e35  ! 250: UDIV_I	udiv 	%r8, 0x0e35, %r22
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16),1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xec7223f9  ! 254: STX_I	stx	%r22, [%r8 + 0x03f9]
	.word 0xb698e5b3  ! 257: XORcc_I	xorcc 	%r3, 0x05b3, %r27
	.word 0xb221c00b  ! 259: SUB_R	sub 	%r7, %r11, %r25
	.word 0xb670c00e  ! 262: UDIV_R	udiv 	%r3, %r14, %r27
	.word 0xfc592370  ! 265: LDX_I	ldx	[%r4 + 0x0370], %r30
	.word 0xaa0a268d  ! 268: AND_I	and 	%r8, 0x068d, %r21
	.word 0xb930c009  ! 270: SRL_R	srl 	%r3, %r9, %r28
	.word 0xaaf961ea  ! 273: SDIVcc_I	sdivcc 	%r5, 0x01ea, %r21
thr0_ic_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_12), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xb08125dc  ! 276: ADDcc_I	addcc 	%r4, 0x05dc, %r24
	.word 0xf01127c9  ! 279: LDUH_I	lduh	[%r4 + 0x07c9], %r24
	.word 0xaf38e001  ! 282: SRA_I	sra 	%r3, 0x0001, %r23
	.word 0xae98eb9d  ! 284: XORcc_I	xorcc 	%r3, 0x0b9d, %r23
	.word 0xbc69c00d  ! 287: UDIVX_R	udivx 	%r7, %r13, %r30
thr0_ic_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_13), 16, 16),1,IC_DATA,IR_NIR,27,23)
	.word 0xb429400c  ! 290: ANDN_R	andn 	%r5, %r12, %r26
	.word 0xf440e938  ! 293: LDSW_I	ldsw	[%r3 + 0x0938], %r26
	.word 0xa60a21f0  ! 296: AND_I	and 	%r8, 0x01f0, %r19
	.word 0xa530d009  ! 298: SRLX_R	srlx	%r3, %r9, %r18
thr0_ic_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_14), 16, 16),1,IC_DATA,IR,14,x)
	.word 0xa0f8c00f  ! 301: SDIVcc_R	sdivcc 	%r3, %r15, %r16
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xec216498  ! 304: STW_I	stw	%r22, [%r5 + 0x0498]
	.word 0xbd2a2001  ! 307: SLL_I	sll 	%r8, 0x0001, %r30
	.word 0xb2b0c00c  ! 309: ORNcc_R	orncc 	%r3, %r12, %r25
	.word 0xb4f1e989  ! 312: UDIVcc_I	udivcc 	%r7, 0x0989, %r26
thr0_ic_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_15), 16, 16),1,IC_DATA,IR_NIR,6,14)
	.word 0xb7643801  ! 315: MOVcc_I	<illegal instruction>
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16),1,IRF,ce,35,x, x,x,x, x,x,x)
	.word 0xf631e489  ! 319: STH_I	sth	%r27, [%r7 + 0x0489]
	.word 0xb890800e  ! 322: ORcc_R	orcc 	%r2, %r14, %r28
	.word 0xac10c00e  ! 324: OR_R	or 	%r3, %r14, %r22
thr0_ic_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,3,32)
	.word 0xa2790009  ! 327: SDIV_R	sdiv 	%r4, %r9, %r17
	.word 0xe019c00b  ! 331: LDD_R	ldd	[%r7 + %r11], %r16
	.word 0xb8b9800b  ! 334: XNORcc_R	xnorcc 	%r6, %r11, %r28
	.word 0xa041e331  ! 336: ADDC_I	addc 	%r7, 0x0331, %r16
thr0_ic_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,16,28)
	.word 0xb76a000b  ! 339: SDIVX_R	sdivx	%r8, %r11, %r27
	.word 0xf6022e09  ! 342: LDUW_I	lduw	[%r8 + 0x0e09], %r27
	.word 0xaf30d06e  ! 345: SRLX_R	srlx	%r3, %r14, %r23
	.word 0xad39400f  ! 347: SRA_R	sra 	%r5, %r15, %r22
	.word 0xb8f9277f  ! 350: SDIVcc_I	sdivcc 	%r4, 0x077f, %r28
thr0_ic_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_18), 16, 16),1,IC_DATA,IR_NIR,2,31)
	.word 0xa298afd6  ! 353: XORcc_I	xorcc 	%r2, 0x0fd6, %r17
	.word 0xa529c00b  ! 354: SLL_R	sll 	%r7, %r11, %r18
	.word 0xbca16864  ! 354: SUBcc_I	subcc 	%r5, 0x0864, %r30
	.word 0xb4a0ad8a  ! 354: SUBcc_I	subcc 	%r2, 0x0d8a, %r26
	.word 0xa881000a  ! 354: ADDcc_R	addcc 	%r4, %r10, %r20
	.word 0xa210c00d  ! 354: OR_R	or 	%r3, %r13, %r17
	.word 0xbb317001  ! 354: SRLX_I	srlx	%r5, 0x0001, %r29
	.word 0xa431c009  ! 354: ORN_R	orn 	%r7, %r9, %r18
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xe441c009  ! 358: LDSW_R	ldsw	[%r7 + %r9], %r18
	.word 0xa1780469  ! 361: MOVR_R	move	%r0, %r9, %r16
	.word 0xb2822d6b  ! 363: ADDcc_I	addcc 	%r8, 0x0d6b, %r25
thr0_ic_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_19), 16, 16),1,IC_DATA,IR_NIR,28,13)
	.word 0xaa790009  ! 366: SDIV_R	sdiv 	%r4, %r9, %r21
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16),1,IRF,ce,1,x, x,x,x, x,x,x)
	.word 0xea71276f  ! 370: STX_I	stx	%r21, [%r4 + 0x076f]
	.word 0xa728c00e  ! 373: SLL_R	sll 	%r3, %r14, %r19
	.word 0xa0b96e1e  ! 375: XNORcc_I	xnorcc 	%r5, 0x0e1e, %r16
	.word 0xa6f1a159  ! 378: UDIVcc_I	udivcc 	%r6, 0x0159, %r19
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16),1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xe609aae9  ! 382: LDUB_I	ldub	[%r6 + 0x0ae9], %r19
	.word 0xb400a9e2  ! 385: ADD_I	add 	%r2, 0x09e2, %r26
	.word 0xb329900d  ! 387: SLLX_R	sllx	%r6, %r13, %r25
	.word 0xac69000a  ! 390: UDIVX_R	udivx 	%r4, %r10, %r22
	.word 0xec71298d  ! 393: STX_I	stx	%r22, [%r4 + 0x098d]
	.word 0xbd29506a  ! 396: SLLX_R	sllx	%r5, %r10, %r30
	.word 0xa139f001  ! 398: SRAX_I	srax	%r7, 0x0001, %r16
	.word 0xb671c00d  ! 401: UDIV_R	udiv 	%r7, %r13, %r27
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xf611ed69  ! 405: LDUH_I	lduh	[%r7 + 0x0d69], %r27
	.word 0xae30800f  ! 408: SUBC_R	orn 	%r2, %r15, %r23
	.word 0xa6912a36  ! 410: ORcc_I	orcc 	%r4, 0x0a36, %r19
thr0_ic_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_20), 16, 16),1,IC_DATA,NIR,x,21)
	.word 0xa6f0aa12  ! 413: UDIVcc_I	udivcc 	%r2, 0x0a12, %r19
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16),1,IRF,ce,30,x, x,x,x, x,x,x)
	.word 0xe628a8e5  ! 417: STB_I	stb	%r19, [%r2 + 0x08e5]
	.word 0xae39000a  ! 420: XNOR_R	xnor 	%r4, %r10, %r23
	.word 0xa0322420  ! 422: SUBC_I	orn 	%r8, 0x0420, %r16
thr0_ic_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_21), 16, 16),1,IC_DATA,IR,26,x)
	.word 0xba71400d  ! 425: UDIV_R	udiv 	%r5, %r13, %r29
	.word 0xfa196741  ! 428: LDD_I	ldd	[%r5 + 0x0741], %r29
	.word 0xbcc0a6f4  ! 431: ADDCcc_I	addccc 	%r2, 0x06f4, %r30
	.word 0xa631400a  ! 433: SUBC_R	orn 	%r5, %r10, %r19
	.word 0xb479e7bb  ! 436: SDIV_I	sdiv 	%r7, 0x07bb, %r26
thr0_ic_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,31,33)
	.word 0xaf3a2001  ! 439: SRA_I	sra 	%r8, 0x0001, %r23
	.word 0xee32250f  ! 442: STH_I	sth	%r23, [%r8 + 0x050f]
	.word 0xaa320069  ! 445: SUBC_R	orn 	%r8, %r9, %r21
	.word 0xa839ea46  ! 447: XNOR_I	xnor 	%r7, 0x0a46, %r20
thr0_ic_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_23), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xac79000e  ! 450: SDIV_R	sdiv 	%r4, %r14, %r22
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,3)
	.word 0xec590000  ! 454: LDX_R	ldx	[%r4 + %r0], %r22
	.word 0xaab92b7d  ! 457: XNORcc_I	xnorcc 	%r4, 0x0b7d, %r21
	.word 0xa071400e  ! 460: UDIV_R	udiv 	%r5, %r14, %r16
thr0_ic_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_24), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xb729100d  ! 463: SLLX_R	sllx	%r4, %r13, %r27
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16),1,IRF,ce,7,x, x,x,x, x,x,x)
	.word 0xf649266f  ! 467: LDSB_I	ldsb	[%r4 + 0x066f], %r27
	.word 0xba31800c  ! 470: ORN_R	orn 	%r6, %r12, %r29
	.word 0xa0aa2354  ! 472: ANDNcc_I	andncc 	%r8, 0x0354, %r16
	.word 0xa269800e  ! 475: UDIVX_R	udivx 	%r6, %r14, %r17
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16),1,IRF,ce,31,x, x,x,x, x,x,x)
	.word 0xe259800e  ! 479: LDX_R	ldx	[%r6 + %r14], %r17
	.word 0xb228a3ea  ! 482: ANDN_I	andn 	%r2, 0x03ea, %r25
	.word 0xae016170  ! 484: ADD_I	add 	%r5, 0x0170, %r23
thr0_ic_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_25), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xa8f1800e  ! 487: UDIVcc_R	udivcc 	%r6, %r14, %r20
	.word 0xe871a61f  ! 490: STX_I	stx	%r20, [%r6 + 0x061f]
	.word 0xb401406b  ! 493: ADD_R	add 	%r5, %r11, %r26
	.word 0xb889af00  ! 495: ANDcc_I	andcc 	%r6, 0x0f00, %r28
	.word 0xa6fa000e  ! 498: SDIVcc_R	sdivcc 	%r8, %r14, %r19

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
	.word  0x11843723,0x8c094733,0xe3fa5713,0x46b35d83
	.word  0x8fa0606b,0x972fcf52,0x59d81144,0x9831ade9
	.word  0x86574d72,0x769873c8,0xf3b024e3,0x93f57e21
	.word  0x9b5ef711,0x56a92bbf,0x8668ed56,0x1a933c35
	.word  0x7a4a8331,0xe9c7deb1,0xfe496c96,0x17f3f075
	.word  0xbe4ffc05,0x3de31bee,0x1e45b73c,0xaf38e530
	.word  0x754c98f7,0x81fb6951,0x649c6a8a,0x30fd1bb1
	.word  0xf7fa6ac3,0x350a2603,0xc1035d9f,0xd80a676d
	.word  0x0342308e,0xefe05eab,0x48a96d04,0x15ad186a
	.word  0xc1f3bd6c,0xcdb3658a,0x36a11ee3,0x2531fd27
	.word  0xd2d3c1c7,0x4ecd9a4c,0xf6ae06b0,0x28f175c6
	.word  0xe716f429,0x4f2b2ea0,0x26b2946f,0x0cefe401
	.word  0xb84c312a,0x4f0097aa,0xc18f7c1c,0x5dcfc1ff
	.word  0xcf12d2b7,0x238604a9,0xc68c077e,0xa57d0136
	.word  0x069e995a,0xba29bd22,0x27f0966d,0xa865a5a3
	.word  0x13e185d0,0xd2fa0a28,0x782ed4ba,0x2aa2966d
	.word  0x87f0921d,0x4ad73709,0x11d3b2df,0x8952a4e7
	.word  0x753b3998,0x247b3e5b,0xcf043025,0xeb13af59
	.word  0x32973c03,0x752e06d0,0xb4919ae4,0xdf64f44e
	.word  0xd0bc8bae,0x6a75f4c5,0x48d609ac,0x78885db0
	.word  0x6f645c5b,0x59fb8e07,0x65327238,0xa9802f8e
	.word  0x3bcb375b,0x103c55c3,0xa82ad6ed,0x864e5fdd
	.word  0x926c2874,0xe1241d02,0xb04e75cf,0x4b068b36
	.word  0x496ec623,0x0ee5eb77,0xe83c5504,0xfb0c26fc
	.word  0x6392c982,0x1ec88f51,0xf1636c72,0xa78c2b20
	.word  0x453ae528,0x366ddd79,0xe515c55a,0x547f4b68
	.word  0xc9f3741b,0x45984d49,0x6e8ce7d1,0xe546f922
	.word  0x6efcd03c,0xa4bd334d,0xf43065f4,0x5608993e
	.word  0x4626801c,0x30bf7888,0x64b8b81c,0x4c30bd66
	.word  0xd359e2ed,0xa10586d3,0xa6cce26e,0x85a29229
	.word  0xe3411c84,0x4d1d029e,0x001428b2,0xe24aff10
	.word  0x021de7d8,0x3ab7f9ad,0x76fc238e,0xb76b4703
	.word  0xeb0d585b,0x62b75b92,0x8a50509b,0x3b7ea040
	.word  0x3dc3b20a,0x0ba1557f,0x3f7f304d,0xa4eeea1a
	.word  0xf93870c6,0x6c6beb47,0x23851a2e,0x40d79b03
	.word  0x3309976c,0x645cd1c1,0xdd3d98d2,0x9d7b371c
	.word  0x482180e4,0xd6471070,0x7b760cd5,0xeab11576
	.word  0x5ed7f7a0,0x61cd1ad1,0x01fde901,0xa1150445
	.word  0xc797a17f,0xfdf26245,0x190057d0,0xb2366292
	.word  0x622bc3e3,0x21cb8f6c,0xec078b92,0xc21dc738
	.word  0xc806af07,0xf9087747,0xe0292403,0x3fb6cba1
	.word  0xca753b4f,0xa26d17b1,0x1eab8d48,0xa70092f1
	.word  0x9333ad1f,0x7df49735,0xf04d2262,0xcadbc1c6
	.word  0xaf45d075,0xde487050,0x387b8d61,0xfcc94f8f
	.word  0x3b2e04cf,0x71cbd9e8,0x3b761eb1,0xff60fad4
	.word  0x128c5da5,0xc0dc2c49,0xf37b04e0,0xbcac8367
	.word  0x0bbc9f14,0x325cc987,0x462c1594,0x45bc220a
	.word  0x124feeb9,0x4b6ac58f,0xe372299b,0xb7e1e2c0
	.word  0x895892b2,0xb3eb6fbb,0x4810a7dd,0x78d81dcb
	.word  0xc9f1c20f,0x5e302942,0x5bcd5f7f,0xdc3a993d
	.word  0x00591e6c,0xe2fb081f,0x302af069,0xd53f402a
	.word  0x2535d65a,0x3f63d267,0xdcfc0657,0xe7e83c74
	.word  0x8dedeef2,0xe160d986,0x9b67316d,0xe282775f
	.word  0x3b654d80,0xb67e6e82,0xa2cf9f8d,0x99e76cb2
	.word  0xfff1f49e,0x6b4a7f17,0xb8da7116,0xd8759847
	.word  0xaeeab698,0xb82925f7,0xcf1f1544,0xe32156d4
	.word  0x7334a181,0xa5f839a5,0x3423ce13,0x64814256
	.word  0x995f40d5,0x1f58ca20,0x6365993f,0xc051629d
	.word  0x7e0c1c17,0x7dd86447,0x4909429d,0xcf864e78
	.word  0xc3686679,0x4e5a0738,0x8c1391a1,0x43f3144e
	.word  0xe2d38bbc,0x11976578,0x68291ca1,0x15ea02eb
	.word  0x52ba3a25,0xa481a61d,0x2a899343,0x3217e18e
	.word  0xdbb6b35e,0x57e08272,0x50c0a400,0x786ba65e
	.word  0xcc43aa88,0x4a9eb828,0x8457a3e4,0x0d1cdc0b
	.word  0xc13fa98e,0x32418325,0x897c602d,0x85dbffd7
	.word  0xc250201e,0x68c167c5,0xbad83f99,0x56a32816
	.word  0x5ca524c1,0x5268da96,0x8a5fdf0b,0x32a38f2e
	.word  0x8f9bea7e,0x85d9ec7e,0x0614b8a7,0x04b3fcf0
	.word  0x266e52b6,0xb0da58e2,0x6d29e991,0xf084b97e
	.word  0x995f34b5,0x7a30cda5,0x2d467ad7,0x1586b8c0
	.word  0x46edcfe6,0xaf39a4f5,0xc40ad4e3,0xeee2ac04
	.word  0x068344a0,0x439b987e,0xc31d081f,0xe52d93db
	.word  0x85d83239,0x861c895d,0x349be354,0x01431c0b
	.word  0x9c863061,0xcb56ed49,0xc25eeb51,0x6bf4084b
	.word  0xf7d00d18,0x1f03ac69,0xf643a212,0x504e52ba
	.word  0x2306b48a,0x0e31746e,0x1d40d115,0x121b8913
	.word  0x0da537b3,0x802f1c00,0x8e30895f,0x7bc99b49
	.word  0xf15b4935,0x511f3cb2,0xfa6981c6,0xedf8c2c7
	.word  0x0c4c2d96,0x31f25d3c,0xb175d0f0,0x8d0ad2a5
	.word  0x09731f3b,0x4cfff145,0x09034f2d,0xf37e430b
	.word  0xcbfcba8e,0xe09527f5,0x374d551d,0x10df2397
	.word  0x3a951f6f,0x780b9ada,0x95bffd30,0x130b93fe
	.word  0xc1866e90,0xdd72f218,0xa3955cfb,0x22dd1b06
	.word  0x716f7901,0x4a693666,0xf8af5ab0,0x327b7d7a
	.word  0x8c5a6e95,0x485b5981,0xd58e34d6,0xfc756f11
	.word  0xc9286af5,0xeb3f8b29,0xcbe78cef,0xe6c76f84
	.word  0xd8cfe5a6,0xb3820990,0x16f3bd54,0x7c5a03e3
	.word  0x850df875,0xfe7171d5,0xadafc71b,0x51ff9b44
	.word  0xea86d436,0x015f1268,0x54f45705,0xc3c3bf09
	.word  0xc45effdd,0xf7d2440a,0x9d66c816,0x85d21406
	.word  0xde02208d,0x2c308b1b,0x7fbd5ac4,0xee95612c
	.word  0x1dba4e2d,0x21b33bbc,0xea403026,0x773e81ce
	.word  0xae49f7f8,0x5263288f,0x2d64c456,0x17348896
	.word  0x85374e33,0x2bb71018,0x4f2559c9,0x1bbe2921
	.word  0x135ca3b1,0x193b2007,0xf74bbe2e,0x05661190
	.word  0xc6ada9f2,0x1b1c39ec,0xc2478564,0x64b204e6
	.word  0x75894953,0x838327bc,0x0df096f2,0xe64d65f3
	.word  0x7d5fcb2b,0xd4476ece,0xe0932ada,0x72163038
	.word  0x81661a21,0x38cf77bf,0xd49001b6,0x8d20657f
	.word  0x98199784,0x80a6c2d6,0xd9ba2347,0xfe0c7ce3
	.word  0x401ab71b,0x2210d041,0x446cc5b2,0x3453576b
	.word  0xacb8d9f0,0x4163181c,0xf71e45e5,0xf9b3ecf1
	.word  0x6f401c92,0xc079efda,0xc96eb6f2,0xcc2de65d
	.word  0x03a524b8,0x3f49e267,0x8049f253,0x4e0517fc
	.word  0x3408645f,0xf81654d9,0x3874f51a,0x25e6beae
	.word  0xb31ebe24,0xde5ec8c4,0x6a5686cf,0x9f22f4eb
	.word  0x8c148484,0xb58b861b,0x71e2e91e,0xb33e2d56
	.word  0x2f8ff90a,0x17ece690,0xd1fb1ff7,0xca83903d
	.word  0x39e54a14,0x629dfbcd,0x19ec5d69,0xb29c2062
	.word  0x782adb07,0xa8fa3f7c,0x41404ec1,0x395729b9
	.word  0x6fccc607,0x2cc0f507,0x089f2940,0xbb32a2a2
	.word  0x60ef6acb,0x1ed18aba,0x231d4c3b,0xff0a1a68
	.word  0xba63405b,0xff0af42d,0x3a8ee9dc,0xdb2ac460
	.word  0xaee3ab09,0x1a282272,0xa932b612,0x519903b6
	.word  0x909f82af,0x52f38672,0x5d37178b,0x69668fb9
	.word  0xe309a65f,0xb5d4ee3a,0x32f3469f,0x4c6395c3
	.word  0x31d5459f,0xcbdbd6a1,0xa4898543,0x57251d60
	.word  0x191205e9,0xd3d37b58,0xde179ce0,0x199535f8
	.word  0x3727ba2e,0xab893a5e,0x1f9044b2,0x8634f022
	.word  0xb61ad5ce,0x73d82d53,0xb9806ee6,0x435c7c10
	.word  0x1993b5c2,0x7890b014,0x70d407cc,0xcd30bc39
	.word  0x5d89b920,0x2389c83a,0x412a430a,0x43e7a7cc
	.word  0xc37ca4f2,0xd9130450,0xecb29eef,0xa27cafb4
	.word  0x1e471f61,0x23ec711e,0x089c080e,0x318487af
	.word  0xc8b6d1b4,0x960c36ca,0x0096162c,0x54ca5832
	.word  0x3f329993,0xaae0d7eb,0x01ec88c4,0xf4514f8a
	.word  0xde5c76b6,0x8e32b891,0x3177f6bf,0x2b8516df
	.word  0xbd82bdce,0x309ecb5d,0xd325a2ac,0xbbfd8b33
	.word  0xc4866b06,0x298f9eba,0x872040fe,0x3b92f095
	.word  0xee8b9b73,0x448b7854,0x72657505,0x66ca1f32
	.word  0x9429a913,0x1b25627d,0x72397e36,0xab4954f2
	.word  0x376000d0,0xb6a7828b,0x5a68dc92,0xe207fb26
	.word  0xee314c25,0xedbc5bf0,0x480e3e2f,0x04418cf2
	.word  0x634aa9bd,0x670c1317,0x74694cf4,0xe29f972e
	.word  0xeaab6ce7,0xb458b277,0xf56d448c,0xba1cb802
	.word  0x8e9c33ed,0xf2645060,0xd29014c6,0xef9cd625
	.word  0x35c75fec,0x9072d064,0x16031c83,0xc265d983
	.word  0x96261fa4,0x17f31ab1,0x60c976eb,0x7336f7aa
	.word  0xd940d985,0x3f483962,0x4a509e19,0xeb6046a5
	.word  0x4ea5041e,0xa75a1fc1,0xefb9a86d,0x5c92581b
	.word  0xa9e02f99,0x9aacdd6e,0xf80d04db,0xbed3019b
	.word  0xf1a90dbf,0x81abedfd,0xd93d5096,0x9bbf0423
	.word  0x216fe9a9,0x4f7718cf,0xf1341593,0xf88f5330
	.word  0xd8e5868c,0x08322ee3,0xb9b10ea5,0x8bf24cd8
	.word  0x0a8cc509,0xd8668f65,0x30b999a7,0x1724ca23
	.word  0xd778c070,0x48c18ec0,0xfbc963c6,0x7e7897e5
	.word  0x47fda6ae,0xeae48f1d,0xdede8eb7,0xcb8dc9b2
	.word  0x42074906,0x84ff51b2,0x32686a2b,0xa555378b
	.word  0x3c8d0d1c,0x5d123e6e,0xd0a627dc,0xb5228929
	.word  0x0166874d,0xca383ffa,0x163f5a5b,0x6fe42c32
	.word  0x45153017,0xcf15b287,0xa94d77fc,0xa6b633d5
	.word  0x88f44d9a,0x594cb5fb,0x082b4477,0x27e6c981
	.word  0x5dc5b9db,0xfd21f894,0x62a42814,0xaced1d2d
	.word  0xfec92ea4,0x26d0d277,0xb10de974,0xb6223ad1
	.word  0x97baa61f,0x41399ba6,0xd1a4b2b0,0x675f28f4
	.word  0x84df675e,0xdb96ba46,0x474bae33,0x2df8ac7c
	.word  0x417bb27b,0x898e7a56,0xc515642d,0x87ddf941
	.word  0x82e8baa8,0xdcc6e333,0x9f0cda77,0xe1ededc6
	.word  0xcb49673b,0xdd89e982,0xfd815f40,0x798dffe3
	.word  0x58c42a71,0x65444dd2,0x71f79c4b,0x06b932d0
	.word  0xdaf955cb,0x34753d53,0xedbcece0,0xf2e571bc
	.word  0xe2dfddae,0xa5dc4dbd,0xc0308b02,0x66d37211
	.word  0xe44739b0,0x4bfc0090,0x1ba558c7,0x9c5f7d62
	.word  0x6d05565f,0xb19a2300,0x1a9a286f,0x04a6e80a
	.word  0xcf55fcef,0x3f834a4e,0xa1f7f711,0x8065291b
	.word  0x4b01bf8d,0xcd46aa0e,0x6ac96cac,0x4fa274c9
	.word  0xbb5743e1,0x94a0df94,0x9725bd8f,0x93bc4ce8
	.word  0x47cd9841,0x2b3f9169,0x87ed02f7,0x18bcbf64
	.word  0xef5fdf5c,0x5e2e237a,0xa58b0cb9,0xfc24bb8a
	.word  0xcbd30386,0x5725fffc,0x62e0534f,0x591c342e
	.word  0x2fe9f8dc,0xced1be19,0x0fff1f2c,0xb2cc0dcf
	.word  0x25139156,0xdf3efdd1,0xa350ae0a,0x16ca1c94
	.word  0x01c46d1c,0x5486133b,0x74c5cd0e,0x68531b7a
	.word  0x75a7d0fb,0xaae1f4a0,0xe380caf1,0x5e1a8ee0
	.word  0xdfa14092,0xf6e14f85,0xc690ec77,0xdb9dc574
	.word  0xf32730e9,0x9a8aa67d,0x0d75f7bd,0x8442e02c
	.word  0x1e8c92f6,0xb6c60834,0x87acfc25,0xf3baf322
	.word  0x65426674,0x5c2ad5bf,0xe7bf56fe,0xe69c188d
	.word  0xaf62d23d,0x90ba22f4,0x366f29fd,0x5f180e8a
	.word  0xad5e9940,0x468d7155,0x4f4f5245,0xda3e5c18
	.word  0x43b0a969,0x5ae59541,0xc31b18af,0x49667b24
	.word  0x2a473105,0x5ea7bd6b,0xa2d00155,0xe1207d41
	.word  0xdb8139cc,0x85c1f23d,0xa8666d08,0x3afc8bf1
	.word  0x1cede787,0xe2ed40b5,0xeedecfbc,0xac6b570e
	.word  0x935d9f44,0xa607da0f,0xf539e3ef,0x856a7fe0
	.word  0x2167935c,0x57daae7a,0x8ae43583,0x6d471300
	.word  0x95aafe8e,0xe2f4683b,0xf9484d64,0xbae108d1
	.word  0x59144dfe,0x115e05c5,0x1456a680,0xe12655a2
	.word  0x95fb4ced,0xb1c4c46b,0x4b14b49d,0xbafd7ee4
	.word  0x66c3b189,0x917f76a5,0x6856d6ae,0x47038c98
	.word  0xbebb3cd2,0xdf149671,0x65c62153,0xaa4d4422
	.word  0xd97a31d2,0xd1e3b3fd,0x55559691,0x5f54d27a
	.word  0x1343106b,0xe4bf6da1,0x411ac497,0x82aa2c30
	.word  0x644f7a48,0xb6e3184e,0xa27d7c18,0x5187fdcb
	.word  0xb2f7d7f7,0x3c52b4fe,0xea4afcc4,0x1742f5cd
	.word  0xd9c9cae2,0x2f647d67,0xdc0708ea,0x9c6c8e32
	.word  0xab3e89c9,0x740398c9,0xf28de307,0xe0630110
	.word  0x0599a5b8,0x0314395f,0x1ac2e43d,0xb973b1b0
	.word  0xb4618f76,0xd9861af8,0x9e5d5aba,0x28ad6987
	.word  0x690d2120,0xc5c25774,0x21fc62cd,0xb6846c61
	.word  0x8d1b8b33,0xb81aa306,0x1538f164,0x89332c7b
	.word  0xb58dba07,0xdd5dace7,0x76d48c3b,0xbd6d3e37
	.word  0xa872d092,0xf77ae0f0,0x0d2c1e81,0x4da8f63b
	.word  0x174ea393,0x943cfa07,0x36903027,0xd126037b
	.word  0x3c09760e,0x022e21c1,0xd957f1a4,0x08c6970d
	.word  0xdc19aae9,0xa397e278,0xf6745f7b,0xbbae1425
	.word  0xaaff3154,0x221a8edc,0xff550119,0xb94588cc
	.word  0x1f557380,0xad0a22eb,0x58efe4db,0x5d44aa0a
	.word  0x260f542f,0x0d38d1cc,0xcd28a6c1,0xda1e645f
	.word  0x977fa543,0xf0414724,0xf5e7e5d4,0x28cc31a7
	.word  0x99fc47fa,0x2f61735c,0xbca43f0b,0xa1c90cca
	.word  0xb27b731a,0x01cd6ce1,0xc48171d6,0xb069d4b1
	.word  0x9b8dbb50,0x28f0a5f3,0xe986fe37,0xc223cd54
	.word  0x2aca07f3,0x479217ae,0x00971527,0xefdcd9eb
	.word  0xd812ebca,0x79253757,0xf2206246,0xf871f4e5
	.word  0x2003261b,0x6a975cef,0xf10b0641,0xcc463ea5
	.word  0x2085e2bd,0x4b3afd80,0xc11f55cc,0xbd668fc3
	.word  0x525c1fcf,0xbb33daaa,0x0a04e284,0x2081882b
	.word  0x29fd66ef,0x62045cbe,0xf1c6ff44,0x633084e1
	.word  0xef9ce1e9,0x610d4d22,0x653c753b,0xdc483a95
	.word  0xe88fbe1f,0xacda621b,0x77f9aca1,0x5db80be8
	.word  0x8e11adfa,0x14a4b5d7,0xe2b413fa,0xf8ef9e9d
	.word  0xeb8e19b3,0xcf3ad712,0x0375d687,0x0b525d90
	.word  0x7b0dc879,0x92ec39fb,0x82267fce,0xc200c985
	.word  0xb147a3d1,0xd8665c47,0x2f3a7be7,0xb806fc02
	.word  0xeb00eac8,0xeb56f9d1,0xda67cdbe,0x9f2dd6f7
	.word  0x8bd34937,0xd18ef6a6,0xe7c27aac,0x03ffce0b
	.word  0x79ed110d,0x5a0f9ae8,0x3b89a1de,0xce4225dc
	.word  0xcc4d9e3a,0x0bdd8f99,0x92aa6d89,0xe84dd228
	.word  0x0cfae1f5,0xe4b02dcf,0x9496555b,0xbfbb5ea7
	.word  0xbc949047,0x8a528a9a,0x53218c64,0x5686afc6
	.word  0xbb14fa4f,0xb5a9b168,0x01f6c67f,0x4a2fadec
	.word  0xcfcc9e62,0x8f0e23dd,0x7f77e1d0,0xd69901f8
	.word  0xe70781d7,0xd66e576c,0x96d194fd,0x84150864
	.word  0xd01f0955,0xd50dffa7,0xa3fcb1ad,0x75181663
	.word  0x2899701f,0x73fc23a3,0x66e4b2bd,0x4bda7fb1
	.word  0xd106bcc6,0xf2530b11,0x130c1da0,0x2c8e7a66
	.word  0xf84ad643,0xfd548cc8,0xfe613dfe,0x0f351237
	.word  0x916967eb,0x593fb35d,0xed476a34,0x95ce764e
	.word  0xe23d94e9,0xed1f6247,0x8705272e,0x6f62a27b
	.word  0x9f27f20b,0x5c88712d,0x09a0a6cc,0xc1418247
	.word  0x69a3157e,0x99795db1,0x61865ea3,0xcb2cee6b
	.word  0xed031795,0xd76cd0c7,0x1959a65e,0x46b9b96d
	.word  0xe308a71d,0x1404a5cd,0x52b5619b,0x4daaeb8c
	.word  0x5e75606f,0x71cdecc4,0xc75bd4c7,0xea207712
	.word  0x80c375a2,0x698b102b,0x193a4572,0x633e2ce5
	.word  0xd183ad39,0x35f06bda,0xd0bbf2cc,0x85cf46d4
	.word  0x582769e4,0xb309fbca,0xa7ab9166,0xefcd5b3e
	.word  0x82b6673e,0x7fdc7aae,0x50db304e,0x4195f2b4
	.word  0xe8fddda3,0xb333b897,0xa3a6322f,0x61f260ae
	.word  0xaa5c9020,0x5c8069f2,0x0398386e,0xe64e6c99
	.word  0x0b3bc14e,0xc6dc9a5e,0xcad9ad37,0x79ca1141
	.word  0x0c70a4cd,0xc8ff2c66,0x1f46632b,0xf11d3ab3
	.word  0xfcfe08b3,0x31403b3e,0x9f84ef14,0xb5a43fdc
	.word  0xcdef4546,0xb9423211,0x7573dc4f,0x1d76922b
	.word  0x1a340b3d,0x66375644,0x8fd052f9,0x8fc33eac



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
!!#   IJ_bind_thread_group("diag.j", 71, th_div, 0x2);
!!#   IJ_bind_thread_group("diag.j", 72, th_evnt, 0x1);
!!#   IJ_bind_thread_group("diag.j", 73, th_all,0x3);
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
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: d0
!!#            {
!!#  	       IJ_generate_from_token ("diag.j", 142,90, th_div, ijdefault,tUDIV_I, tUDIV_R, tSDIV_I, tSDIV_R, tSDIVX_R, tSDIVX_I, tUDIVX_R, tUDIVX_I, tUDIVcc_I, tUDIVcc_R, tSDIVcc_I, tSDIVcc_R, -1);;
!!# 
!!#            }
!!#            | alu_irf_err 
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
!!#   IJ_printf ("diag.j", 186, th_evnt, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf ("diag.j", 187, th_evnt, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(1, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA17
!!# { 
!!#    burst_cnt = random () % 5 + 3; 
!!#    IJ_generate_from_token ("diag.j", 195,burst_cnt, th_evnt, ijdefault, tADD_R, tADD_I, tADDcc_R, 
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
!!#    IJ_printf ("diag.j", 202, th_evnt, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 3;
!!#    if (i == 0) {
!!# //      IJ_printf (th_evnt, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 207, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!# //      IJ_printf (th_evnt, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 211, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!# //      IJ_printf (th_evnt, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 216, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA19
!!# {
!!#    IJ_printf ("diag.j", 224, th_evnt, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 226, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA20
!!# {
!!#      IJ_printf ("diag.j", 233, th_evnt, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!# //     bitnum = random () % 72;
!!#      bitnum = random () % 70;
!!#      IJ_printf ("diag.j", 236, th_evnt, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
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
!!#    IJ_generate ("diag.j", 247, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# div_tokens: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!!# 
!!# load: d12 load_r_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 257, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!#       | d12 load_i_tokens 
!!#       {
!!#          IJ_generate ("diag.j", 262, th_evnt, $2);
!!#          $$ = $2;
!!#       }
!!# ;
!!# 
!!# load_r: d13 load_r_tokens %ropr  Ro_load_r
!!# {
!!#    IJ_generate ("diag.j", 269, th_evnt, $2);
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
!!#    IJ_generate ("diag.j", 284, th_evnt, $2);
!!#    $$ = $2;
!!# }
!!# ;
!!# 
!!# store_i_tokens: tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# ;
!!# 
!!# alu: d15 alu_tokens
!!# {
!!#    IJ_generate ("diag.j", 294, th_evnt, $2);
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

