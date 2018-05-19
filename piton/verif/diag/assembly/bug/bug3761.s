// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3761.s
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
   random seed:	699615478
   Jal stb8.j:	
********************************************************************************/


#define MAIN_PAGE_HV_ALSO
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
	setx  0x9cda79e68b734940, %r16, %r17
	setx  0xb7d0976430af55f3, %r16, %r18
	setx  0x061ffd2ff8ee258b, %r16, %r19
	setx  0xdf34cbf0b500d1e4, %r16, %r20
	setx  0x4f8906545b000938, %r16, %r21
	setx  0xec7a34f99e715a93, %r16, %r22
	setx  0x0a6138cd0ed64c2c, %r16, %r23
	setx  0x9873068940e9f1a4, %r16, %r24
	setx  0x15df0a63caa25db1, %r16, %r25
	setx  0x7b2ef7100b7c92f5, %r16, %r26
	setx  0x12ff3dfc918c8a15, %r16, %r27
	setx  0x6b954acc334770fd, %r16, %r28
	setx  0x2ff58efe2fe1769f, %r16, %r29
	setx  0x77ac4259d9b92dc1, %r16, %r30
	setx  0x9d4e43b0ee6c6ca4, %r16, %r31
	setx  0x0000000000000ab0, %r16, %r9
	setx  0x0000000000000450, %r16, %r10
	setx  0x0000000000000000, %r16, %r11
	setx  0x0000000000000520, %r16, %r12
	setx  0x0000000000000860, %r16, %r13
	setx  0x00000000000004e0, %r16, %r14
	setx  0x0000000000000e90, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	setx  0xffffffffffffffff, %r16, %r2
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
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	wr  %r0, 0x80, %asi
	.word 0xf82124a0  ! 0: STW_I	stw	%r28, [%r4 + 0x04a0]
	.word 0x8143c000  ! 1: STBAR	stbar
thr3_dc_err_0:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_0), 16, 16),1,DC_DATA,18)
	.word 0xf0110009  ! 3: LDUH_R	lduh	[%r4 + %r9], %r24
	.word 0xf4096ad4  ! 4: LDUB_I	ldub	[%r5 + 0x0ad4], %r26
	.word 0xf649a4b6  ! 5: LDSB_I	ldsb	[%r6 + 0x04b6], %r27
	.word 0xf672000b  ! 7: STX_R	stx	%r27, [%r8 + %r11]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe620e2b0  ! 9: STW_I	stw	%r19, [%r3 + 0x02b0]
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xf029ac76  ! 10: STB_I	stb	%r24, [%r6 + 0x0c76]
thr3_irf_ce_0:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_0), 16, 16), 1,IRF,ce,28,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xebe1900b  ! 12: CASA_I	casa	[%r6] 0x80, %r11, %r21
	.word 0xbd29e001  ! 14: SLL_I	sll 	%r7, 0x0001, %r30
	.word 0xb41a000d  ! 14: XOR_R	xor 	%r8, %r13, %r26
	.word 0xa431000e  ! 14: ORN_R	orn 	%r4, %r14, %r18
	.word 0xa328c00e  ! 14: SLL_R	sll 	%r3, %r14, %r17
	.word 0xfa30c00f  ! 15: STH_R	sth	%r29, [%r3 + %r15]
thr3_irf_ce_1:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_1), 16, 16), 1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xf62964d5  ! 16: STB_I	stb	%r27, [%r5 + 0x04d5]
	.word 0xaa1a2cce  ! 17: XOR_I	xor 	%r8, 0x0cce, %r21
	.word 0xb33a100d  ! 17: SRAX_R	srax	%r8, %r13, %r25
	.word 0xb4192b2f  ! 17: XOR_I	xor 	%r4, 0x0b2f, %r26
	.word 0xe648e619  ! 17: LDSB_I	ldsb	[%r3 + 0x0619], %r19
	.word 0xf67228f0  ! 19: STX_I	stx	%r27, [%r8 + 0x08f0]
thr3_irf_ce_2:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_2), 16, 16), 1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xea322182  ! 20: STH_I	sth	%r21, [%r8 + 0x0182]
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xa64a2e37  ! 20: MULX_I	mulx 	%r8, 0x0e37, %r19
	.word 0xe3e1d00e  ! 21: CASA_I	casa	[%r7] 0x80, %r14, %r17
	.word 0xffe1e00f  ! 22: CASA_R	casa	[%r7] %asi, %r15, %r31
	.word 0xfc21400d  ! 24: STW_R	stw	%r30, [%r5 + %r13]
thr3_ic_err_0:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_0), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xfbf1600d  ! 24: CASXA_R	casxa	[%r5]%asi, %r13, %r29
	.word 0xee21000c  ! 26: STW_R	stw	%r23, [%r4 + %r12]
thr3_ic_err_1:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,14,21)
	.word 0xfa4125b4  ! 26: LDSW_I	ldsw	[%r4 + 0x05b4], %r29
	.word 0xe2316a1a  ! 28: STH_I	sth	%r17, [%r5 + 0x0a1a]
	.word 0xfe71e9b0  ! 28: STX_I	stx	%r31, [%r7 + 0x09b0]
	.word 0xfa32000b  ! 28: STH_R	sth	%r29, [%r8 + %r11]
	.word 0xe629a6bb  ! 29: STB_I	stb	%r19, [%r6 + 0x06bb]
thr3_ic_err_2:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_2), 16, 16),1,IC_DATA,IR,24,x)
thr3_dc_err_1:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_1), 16, 16),1,DC_DATA,53)
	.word 0xf0598009  ! 30: LDX_R	ldx	[%r6 + %r9], %r24
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xebf0e00f  ! 32: CASXA_R	casxa	[%r3]%asi, %r15, %r21
	.word 0xa619631b  ! 34: XOR_I	xor 	%r5, 0x031b, %r19
	.word 0xfe316a10  ! 35: STH_I	sth	%r31, [%r5 + 0x0a10]
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf4712d38  ! 38: STX_I	stx	%r26, [%r4 + 0x0d38]
thr3_irf_ce_3:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_3), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xf021800b  ! 39: STW_R	stw	%r24, [%r6 + %r11]
thr3_irf_ce_4:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_4), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xee5a2d80  ! 39: LDX_I	ldx	[%r8 + 0x0d80], %r23
	.word 0xfc21800c  ! 41: STW_R	stw	%r30, [%r6 + %r12]
	.word 0xf629c00b  ! 41: STB_R	stb	%r27, [%r7 + %r11]
	.word 0xf019ab60  ! 41: LDD_I	ldd	[%r6 + 0x0b60], %r24
	.word 0xf8b8e3c8  ! 42: STDA_I	stda	%r28, [%r3 + 0x03c8] %asi
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf671e5f0  ! 45: STX_I	stx	%r27, [%r7 + 0x05f0]
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xee09ac44  ! 46: LDUB_I	ldub	[%r6 + 0x0c44], %r23
	.word 0xe871800d  ! 48: STX_R	stx	%r20, [%r6 + %r13]
	.word 0xfa29c00c  ! 48: STB_R	stb	%r29, [%r7 + %r12]
	.word 0xf4316564  ! 48: STH_I	sth	%r26, [%r5 + 0x0564]
	.word 0xe828c00f  ! 48: STB_R	stb	%r20, [%r3 + %r15]
	.word 0xe421000b  ! 48: STW_R	stw	%r18, [%r4 + %r11]
	.word 0xe272000e  ! 48: STX_R	stx	%r17, [%r8 + %r14]
	.word 0x32800003  ! 48: BNE	bne,a	<label_0x3>
	.word 0xe871e9f0  ! 50: STX_I	stx	%r20, [%r7 + 0x09f0]
	.word 0xb828e808  ! 51: ANDN_I	andn 	%r3, 0x0808, %r28
	.word 0xb610c00e  ! 51: OR_R	or 	%r3, %r14, %r27
	.word 0xbd293001  ! 51: SLLX_I	sllx	%r4, 0x0001, %r30
	.word 0xac01400b  ! 51: ADD_R	add 	%r5, %r11, %r22
	.word 0xf829800b  ! 52: STB_R	stb	%r28, [%r6 + %r11]
thr3_irf_ce_5:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_5), 16, 16), 1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xffe1600d  ! 52: CASA_R	casa	[%r5] %asi, %r13, %r31
	.word 0xec29a417  ! 53: STB_I	stb	%r22, [%r6 + 0x0417]
	.word 0xfa71c00e  ! 55: STX_R	stx	%r29, [%r7 + %r14]
	.word 0xec71ad40  ! 55: STX_I	stx	%r22, [%r6 + 0x0d40]
	.word 0xee71400e  ! 55: STX_R	stx	%r23, [%r5 + %r14]
	.word 0xf421c00b  ! 55: STW_R	stw	%r26, [%r7 + %r11]
	.word 0xee2a2259  ! 55: STB_I	stb	%r23, [%r8 + 0x0259]
	.word 0xe828c00d  ! 55: STB_R	stb	%r20, [%r3 + %r13]
	.word 0xfc71a4d0  ! 55: STX_I	stx	%r30, [%r6 + 0x04d0]
	.word 0xf831400d  ! 56: STH_R	sth	%r28, [%r5 + %r13]
thr3_ic_err_3:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_3), 16, 16),1,IC_DATA,IR_NIR,17,30)
	.word 0xbf78040e  ! 57: MOVR_R	move	%r0, %r14, %r31
	.word 0xa731800b  ! 57: SRL_R	srl 	%r6, %r11, %r19
	.word 0xb128e001  ! 57: SLL_I	sll 	%r3, 0x0001, %r24
	.word 0xe8b1e782  ! 57: STHA_I	stha	%r20, [%r7 + 0x0782] %asi
	.word 0xec30c00f  ! 59: STH_R	sth	%r22, [%r3 + %r15]
thr3_ic_err_4:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_4), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xe231000e  ! 60: STH_R	sth	%r17, [%r4 + %r14]
	.word 0xe229400e  ! 60: STB_R	stb	%r17, [%r5 + %r14]
	.word 0xe2212a0c  ! 60: STW_I	stw	%r17, [%r4 + 0x0a0c]
	.word 0xb7782401  ! 61: MOVR_I	move	%r0, 0xfffffed8, %r27
	.word 0xec31400b  ! 62: STH_R	sth	%r22, [%r5 + %r11]
	.word 0xf428c00b  ! 62: STB_R	stb	%r26, [%r3 + %r11]
	.word 0xec21c00f  ! 63: STW_R	stw	%r22, [%r7 + %r15]
	.word 0xfc2a000f  ! 63: STB_R	stb	%r30, [%r8 + %r15]
	.word 0xec71000e  ! 63: STX_R	stx	%r22, [%r4 + %r14]
	.word 0xfc20e65c  ! 63: STW_I	stw	%r30, [%r3 + 0x065c]
	.word 0xe4716df8  ! 63: STX_I	stx	%r18, [%r5 + 0x0df8]
	.word 0xe871000e  ! 64: STX_R	stx	%r20, [%r4 + %r14]
	.word 0xe471400d  ! 64: STX_R	stx	%r18, [%r5 + %r13]
	.word 0xee30c00e  ! 64: STH_R	sth	%r23, [%r3 + %r14]
	.word 0xf421251c  ! 64: STW_I	stw	%r26, [%r4 + 0x051c]
	.word 0xf8b0d00d  ! 64: STHA_R	stha	%r28, [%r3 + %r13] 0x80
	.word 0xfc29400d  ! 66: STB_R	stb	%r30, [%r5 + %r13]
thr3_irf_ce_6:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_6), 16, 16), 1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xe829a9f8  ! 67: STB_I	stb	%r20, [%r6 + 0x09f8]
	.word 0xfe71c00c  ! 67: STX_R	stx	%r31, [%r7 + %r12]
	.word 0xe7f1e00f  ! 67: CASXA_R	casxa	[%r7]%asi, %r15, %r19
	.word 0xe6f8e1e0  ! 68: SWAPA_I	swapa	%r19, [%r3 + 0x01e0] %asi
	.word 0xf4296163  ! 70: STB_I	stb	%r26, [%r5 + 0x0163]
thr3_resum_intr_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0xac71ee24  ! 70: UDIV_I	udiv 	%r7, 0x0e24, %r22
	.word 0x8143e047  ! 71: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
	.word 0xec31acb8  ! 73: STH_I	sth	%r22, [%r6 + 0x0cb8]
thr3_ic_err_5:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_5), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xed2226cc  ! 75: STF_I	st	%f22, [0x06cc, %r8]
	.word 0xec28ef54  ! 77: STB_I	stb	%r22, [%r3 + 0x0f54]
thr3_irf_ce_7:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_7), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf0722298  ! 78: STX_I	stx	%r24, [%r8 + 0x0298]
	.word 0xea71400b  ! 78: STX_R	stx	%r21, [%r5 + %r11]
	.word 0xfc21aac4  ! 78: STW_I	stw	%r30, [%r6 + 0x0ac4]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
thr3_dc_err_2:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_2), 16, 16),1,DC_DATA,24)
	.word 0xee51c009  ! 80: LDSH_R	ldsh	[%r7 + %r9], %r23
	.word 0xc4f00980  ! 82: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf821e0d4  ! 84: STW_I	stw	%r28, [%r7 + 0x00d4]
thr3_dc_err_3:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_3), 16, 16),1,DC_DATA,15)
	.word 0xfa190009  ! 85: LDD_R	ldd	[%r4 + %r9], %r29
	.word 0xfa29c00b  ! 87: STB_R	stb	%r29, [%r7 + %r11]
thr3_resum_intr_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xf83122a3  ! 87: STH_I	sth	%r28, [%r4 + 0x02a3]
	.word 0xf922000d  ! 88: STF_R	st	%f28, [%r13, %r8]
	.word 0xf832229a  ! 90: STH_I	sth	%r28, [%r8 + 0x029a]
	.word 0xf822000f  ! 90: STW_R	stw	%r28, [%r8 + %r15]
	.word 0xef39e3c0  ! 90: STDF_I	std	%f23, [0x03c0, %r7]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf659e2f0  ! 92: LDX_I	ldx	[%r7 + 0x02f0], %r27
	.word 0xf871000c  ! 94: STX_R	stx	%r28, [%r4 + %r12]
thr3_ic_err_6:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,8,2)
	.word 0xe821ec64  ! 95: STW_I	stw	%r20, [%r7 + 0x0c64]
	.word 0xec31a842  ! 95: STH_I	sth	%r22, [%r6 + 0x0842]
	.word 0xe6322cb8  ! 96: STH_I	sth	%r19, [%r8 + 0x0cb8]
thr3_ic_err_7:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_7), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xe229abfc  ! 97: STB_I	stb	%r17, [%r6 + 0x0bfc]
thr3_ic_err_8:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_8), 16, 16),1,IC_DATA,IR_NIR,29,10)
	.word 0xf6322d30  ! 98: STH_I	sth	%r27, [%r8 + 0x0d30]
	.word 0xf430c00e  ! 98: STH_R	sth	%r26, [%r3 + %r14]
	.word 0xe471a4c0  ! 98: STX_I	stx	%r18, [%r6 + 0x04c0]
	.word 0xe420ef10  ! 99: STW_I	stw	%r18, [%r3 + 0x0f10]
thr3_resum_intr_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	.word 0xf670c00f  ! 100: STX_R	stx	%r27, [%r3 + %r15]
thr3_resum_intr_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	.word 0xf269400f  ! 100: LDSTUB_R	ldstub	%r25, [%r5 + %r15]
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe6f8d00d  ! 103: SWAPA_R	swapa	%r19, [%r3 + %r13] 0x80
	.word 0xf411ed5e  ! 104: LDUH_I	lduh	[%r7 + 0x0d5e], %r26
	.word 0xf620e884  ! 106: STW_I	stw	%r27, [%r3 + 0x0884]
thr3_resum_intr_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xf431400e  ! 107: STH_R	sth	%r26, [%r5 + %r14]
thr3_irf_ce_8:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_8), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf009aefe  ! 107: LDUB_I	ldub	[%r6 + 0x0efe], %r24
	.word 0xf832000b  ! 108: STH_R	sth	%r28, [%r8 + %r11]
	.word 0xe221e258  ! 110: STW_I	stw	%r17, [%r7 + 0x0258]
thr3_resum_intr_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc4f00c00  ! 112: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe62220b0  ! 115: STW_I	stw	%r19, [%r8 + 0x00b0]
	.word 0xf871c00c  ! 115: STX_R	stx	%r28, [%r7 + %r12]
	.word 0xe670c00e  ! 116: STX_R	stx	%r19, [%r3 + %r14]
thr3_resum_intr_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xe22a000b  ! 117: STB_R	stb	%r17, [%r8 + %r11]
	.word 0xec31400e  ! 117: STH_R	sth	%r22, [%r5 + %r14]
	.word 0xfa322756  ! 117: STH_I	sth	%r29, [%r8 + 0x0756]
	.word 0xe421800d  ! 117: STW_R	stw	%r18, [%r6 + %r13]
	.word 0xee31400f  ! 117: STH_R	sth	%r23, [%r5 + %r15]
	.word 0xec3121e8  ! 117: STH_I	sth	%r22, [%r4 + 0x01e8]
	.word 0xfe21e1d8  ! 118: STW_I	stw	%r31, [%r7 + 0x01d8]
	.word 0xf43165b2  ! 118: STH_I	sth	%r26, [%r5 + 0x05b2]
	.word 0xe86a2db5  ! 118: LDSTUB_I	ldstub	%r20, [%r8 + 0x0db5]
	.word 0xe23163bf  ! 119: STH_I	sth	%r17, [%r5 + 0x03bf]
	.word 0xe871400d  ! 121: STX_R	stx	%r20, [%r5 + %r13]
thr3_ic_err_9:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_9), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xef392770  ! 121: STDF_I	std	%f23, [0x0770, %r4]
	.word 0xe322000b  ! 122: STF_R	st	%f17, [%r11, %r8]
	.word 0xfafa2978  ! 123: SWAPA_I	swapa	%r29, [%r8 + 0x0978] %asi
	.word 0xf421c00e  ! 124: STW_R	stw	%r26, [%r7 + %r14]
	.word 0xf721800d  ! 125: STF_R	st	%f27, [%r13, %r6]
	.word 0xb530e001  ! 127: SRL_I	srl 	%r3, 0x0001, %r26
	.word 0xbc31800d  ! 127: ORN_R	orn 	%r6, %r13, %r30
	.word 0xbe21400f  ! 127: SUB_R	sub 	%r5, %r15, %r31
	.word 0xfe2a000f  ! 128: STB_R	stb	%r31, [%r8 + %r15]
thr3_resum_intr_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xfa09edf9  ! 128: LDUB_I	ldub	[%r7 + 0x0df9], %r29
	.word 0xfb39e400  ! 129: STDF_I	std	%f29, [0x0400, %r7]
	.word 0xe6e9500b  ! 130: LDSTUBA_R	ldstuba	%r19, [%r5 + %r11] 0x80
	.word 0xfa21abfc  ! 132: STW_I	stw	%r29, [%r6 + 0x0bfc]
	.word 0xee316c94  ! 132: STH_I	sth	%r23, [%r5 + 0x0c94]
	.word 0xf6712710  ! 132: STX_I	stx	%r27, [%r4 + 0x0710]
	.word 0xe229000b  ! 132: STB_R	stb	%r17, [%r4 + %r11]
	.word 0xee3229a2  ! 132: STH_I	sth	%r23, [%r8 + 0x09a2]
	.word 0xff2124b0  ! 132: STF_I	st	%f31, [0x04b0, %r4]
	.word 0xfea2100c  ! 133: STWA_R	stwa	%r31, [%r8 + %r12] 0x80
	.word 0xf42a000c  ! 135: STB_R	stb	%r26, [%r8 + %r12]
thr3_resum_intr_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 136: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xed22000e  ! 137: STF_R	st	%f22, [%r14, %r8]
	.word 0xf471e318  ! 139: STX_I	stx	%r26, [%r7 + 0x0318]
thr3_resum_intr_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xec71a180  ! 140: STX_I	stx	%r22, [%r6 + 0x0180]
thr3_irf_ce_9:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_9), 16, 16), 1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xe249eec0  ! 140: LDSB_I	ldsb	[%r7 + 0x0ec0], %r17
	.word 0xf229a996  ! 142: STB_I	stb	%r25, [%r6 + 0x0996]
thr3_resum_intr_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xa4118f0f  ! 143: OR_R	or 	%r6, %r15, %r18
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfe216003  ! 145: STW_I	stw	%r31, [%r5 + 0x0003]
	.word 0xfe21400b  ! 147: STW_R	stw	%r31, [%r5 + %r11]
	.word 0xe631c00c  ! 147: STH_R	sth	%r19, [%r7 + %r12]
	.word 0xf8712b10  ! 147: STX_I	stx	%r28, [%r4 + 0x0b10]
	.word 0xf821e1e0  ! 147: STW_I	stw	%r28, [%r7 + 0x01e0]
	.word 0xe83125fa  ! 147: STH_I	sth	%r20, [%r4 + 0x05fa]
	.word 0xe429000b  ! 147: STB_R	stb	%r18, [%r4 + %r11]
	.word 0xec29e517  ! 147: STB_I	stb	%r22, [%r7 + 0x0517]
	.word 0xe431400d  ! 148: STH_R	sth	%r18, [%r5 + %r13]
thr3_resum_intr_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0xf4a9900b  ! 148: STBA_R	stba	%r26, [%r6 + %r11] 0x80
	.word 0xe53a000d  ! 149: STDF_R	std	%f18, [%r13, %r8]
	.word 0xfa716338  ! 151: STX_I	stx	%r29, [%r5 + 0x0338]
	.word 0xfc71c00f  ! 151: STX_R	stx	%r30, [%r7 + %r15]
	.word 0xe271c00b  ! 151: STX_R	stx	%r17, [%r7 + %r11]
	.word 0xf22224c4  ! 151: STW_I	stw	%r25, [%r8 + 0x04c4]
	.word 0xe821a764  ! 151: STW_I	stw	%r20, [%r6 + 0x0764]
	.word 0xfe216bcc  ! 151: STW_I	stw	%r31, [%r5 + 0x0bcc]
	.word 0xea7164e0  ! 151: STX_I	stx	%r21, [%r5 + 0x04e0]
	.word 0xf8b9d00c  ! 151: STDA_R	stda	%r28, [%r7 + %r12] 0x80
	.word 0xf810ea2c  ! 152: LDUH_I	lduh	[%r3 + 0x0a2c], %r28
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfe71c00b  ! 156: STX_R	stx	%r31, [%r7 + %r11]
	.word 0xfc31c00b  ! 156: STH_R	sth	%r30, [%r7 + %r11]
	.word 0xec2960bd  ! 156: STB_I	stb	%r22, [%r5 + 0x00bd]
	.word 0xfc2a000f  ! 156: STB_R	stb	%r30, [%r8 + %r15]
	.word 0xee71c00e  ! 156: STX_R	stx	%r23, [%r7 + %r14]
!Generating an illinst
	.word 0xb7393f41  ! 157: SRA_I	srax	%r4, 0x0001, %r27
	.word 0xfa70e90f  ! 158: STX_I	stx	%r29, [%r3 + 0x090f]
	.word 0xb818efc6  ! 160: XOR_I	xor 	%r3, 0x0fc6, %r28
	.word 0xa839800f  ! 160: XNOR_R	xnor 	%r6, %r15, %r20
	.word 0xad396001  ! 160: SRA_I	sra 	%r5, 0x0001, %r22
	.word 0xaf31c00d  ! 160: SRL_R	srl 	%r7, %r13, %r23
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe229400b  ! 161: STB_R	stb	%r17, [%r5 + %r11]
	.word 0xe339e278  ! 162: STDF_I	std	%f17, [0x0278, %r7]
	.word 0xea29aee3  ! 164: STB_I	stb	%r21, [%r6 + 0x0ee3]
	.word 0xf629c00c  ! 164: STB_R	stb	%r27, [%r7 + %r12]
	.word 0xe230edec  ! 164: STH_I	sth	%r17, [%r3 + 0x0dec]
	.word 0xea29400c  ! 164: STB_R	stb	%r21, [%r5 + %r12]
	.word 0xfe2a2439  ! 164: STB_I	stb	%r31, [%r8 + 0x0439]
	.word 0xf871400b  ! 165: STX_R	stx	%r28, [%r5 + %r11]
thr3_resum_intr_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	.word 0xe628c00d  ! 166: STB_R	stb	%r19, [%r3 + %r13]
thr3_ic_err_10:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_10), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xfc79c00d  ! 166: SWAP_R	swap	%r30, [%r7 + %r13]
	.word 0xa9782401  ! 168: MOVR_I	move	%r0, 0xfffffed8, %r20
	.word 0xa338e001  ! 168: SRA_I	sra 	%r3, 0x0001, %r17
	.word 0xb928d00c  ! 168: SLLX_R	sllx	%r3, %r12, %r28
	.word 0xfc1165b2  ! 168: LDUH_I	lduh	[%r5 + 0x05b2], %r30
	.word 0xe821000d  ! 170: STW_R	stw	%r20, [%r4 + %r13]
thr3_ic_err_11:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_11), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xaba2092c  ! 170: FMULs	fmuls	%f8, %f12, %f21
	.word 0xfc292477  ! 172: STB_I	stb	%r30, [%r4 + 0x0477]
thr3_ic_err_12:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_12), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xec09eb18  ! 172: LDUB_I	ldub	[%r7 + 0x0b18], %r22
	.word 0xfa21e91c  ! 174: STW_I	stw	%r29, [%r7 + 0x091c]
	.word 0xfa20e58c  ! 174: STW_I	stw	%r29, [%r3 + 0x058c]
	.word 0xf5f1e00e  ! 174: CASXA_R	casxa	[%r7]%asi, %r14, %r26
	.word 0xec29abe9  ! 175: STB_I	stb	%r22, [%r6 + 0x0be9]
	.word 0xa611800c  ! 177: OR_R	or 	%r6, %r12, %r19
	.word 0xb838c00b  ! 177: XNOR_R	xnor 	%r3, %r11, %r28
	.word 0xe471a7c8  ! 178: STX_I	stx	%r18, [%r6 + 0x07c8]
	.word 0xfc71e248  ! 178: STX_I	stx	%r30, [%r7 + 0x0248]
	.word 0xfa21e434  ! 178: STW_I	stw	%r29, [%r7 + 0x0434]
	.word 0xe621400b  ! 178: STW_R	stw	%r19, [%r5 + %r11]
	.word 0xe671a6d8  ! 178: STX_I	stx	%r19, [%r6 + 0x06d8]
	.word 0xf031edbc  ! 179: STH_I	sth	%r24, [%r7 + 0x0dbc]
thr3_irf_ce_10:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_10), 16, 16), 1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xea29e4fe  ! 180: STB_I	stb	%r21, [%r7 + 0x04fe]
	.word 0xf8722c20  ! 180: STX_I	stx	%r28, [%r8 + 0x0c20]
	.word 0xea212b94  ! 180: STW_I	stw	%r21, [%r4 + 0x0b94]
	.word 0xf429400f  ! 180: STB_R	stb	%r26, [%r5 + %r15]
	.word 0xe8e9100d  ! 180: LDSTUBA_R	ldstuba	%r20, [%r4 + %r13] 0x80
	.word 0xf8e8d00d  ! 181: LDSTUBA_R	ldstuba	%r28, [%r3 + %r13] 0x80
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xfe212080  ! 184: STW_I	stw	%r31, [%r4 + 0x0080]
thr3_ic_err_13:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_13), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xb411000f  ! 185: OR_R	or 	%r4, %r15, %r26
	.word 0xad31d00f  ! 185: SRLX_R	srlx	%r7, %r15, %r22
	.word 0xb2022d3f  ! 185: ADD_I	add 	%r8, 0x0d3f, %r25
	.word 0xa739400e  ! 185: SRA_R	sra 	%r5, %r14, %r19
	.word 0xe411a390  ! 185: LDUH_I	lduh	[%r6 + 0x0390], %r18
	.word 0xf232000d  ! 187: STH_R	sth	%r25, [%r8 + %r13]
thr3_irf_ce_11:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_11), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xfe31400f  ! 188: STH_R	sth	%r31, [%r5 + %r15]
	.word 0xf821c00e  ! 188: STW_R	stw	%r28, [%r7 + %r14]
	.word 0xe621c00b  ! 188: STW_R	stw	%r19, [%r7 + %r11]
	.word 0xfc71000c  ! 188: STX_R	stx	%r30, [%r4 + %r12]
	.word 0xee71000d  ! 188: STX_R	stx	%r23, [%r4 + %r13]
	.word 0xec21a43c  ! 188: STW_I	stw	%r22, [%r6 + 0x043c]
	.word 0xbf782401  ! 189: MOVR_I	move	%r0, 0xfffffed8, %r31
	.word 0xa331f001  ! 189: SRLX_I	srlx	%r7, 0x0001, %r17
	.word 0xfc22000f  ! 190: STW_R	stw	%r30, [%r8 + %r15]
thr3_irf_ce_12:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_12), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe6312268  ! 191: STH_I	sth	%r19, [%r4 + 0x0268]
thr3_ic_err_14:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,10,32)
	.word 0x81d9800e  ! 191: FLUSH_R	dis not found

	.word 0xfc21ab70  ! 193: STW_I	stw	%r30, [%r6 + 0x0b70]
thr3_irf_ce_13:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_13), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe231ab1f  ! 193: STH_I	sth	%r17, [%r6 + 0x0b1f]
	.word 0xff22000f  ! 194: STF_R	st	%f31, [%r15, %r8]
	.word 0xe6fa100e  ! 195: SWAPA_R	swapa	%r19, [%r8 + %r14] 0x80
	.word 0xec70eba5  ! 196: STX_I	stx	%r22, [%r3 + 0x0ba5]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf021aff4  ! 199: STW_I	stw	%r24, [%r6 + 0x0ff4]
	.word 0xf071a498  ! 200: STX_I	stx	%r24, [%r6 + 0x0498]
	.word 0xea29256c  ! 200: STB_I	stb	%r21, [%r4 + 0x056c]
	.word 0xe829400c  ! 200: STB_R	stb	%r20, [%r5 + %r12]
	.word 0xf420c00d  ! 200: STW_R	stw	%r26, [%r3 + %r13]
	.word 0xea71400b  ! 200: STX_R	stx	%r21, [%r5 + %r11]
	.word 0xf229400c  ! 201: STB_R	stb	%r25, [%r5 + %r12]
	.word 0xf670c00c  ! 201: STX_R	stx	%r27, [%r3 + %r12]
	.word 0xf421800d  ! 201: STW_R	stw	%r26, [%r6 + %r13]
	.word 0xec29000f  ! 201: STB_R	stb	%r22, [%r4 + %r15]
	.word 0xfc28c00f  ! 201: STB_R	stb	%r30, [%r3 + %r15]
	.word 0xee71ede0  ! 201: STX_I	stx	%r23, [%r7 + 0x0de0]
	.word 0xf4fa100c  ! 201: SWAPA_R	swapa	%r26, [%r8 + %r12] 0x80
	.word 0xef21000e  ! 202: STF_R	st	%f23, [%r14, %r4]
	.word 0xec70e770  ! 204: STX_I	stx	%r22, [%r3 + 0x0770]
thr3_ic_err_15:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_15), 16, 16),1,IC_DATA,NIR,x,11)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xed20c00b  ! 205: STF_R	st	%f22, [%r11, %r3]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe5f1600c  ! 207: CASXA_R	casxa	[%r5]%asi, %r12, %r18
	.word 0xfc21c00f  ! 208: STW_R	stw	%r30, [%r7 + %r15]
	.word 0xfc40ed74  ! 209: LDSW_I	ldsw	[%r3 + 0x0d74], %r30
	.word 0xece9a326  ! 210: LDSTUBA_I	ldstuba	%r22, [%r6 + 0x0326] %asi
	.word 0xf429400e  ! 212: STB_R	stb	%r26, [%r5 + %r14]
thr3_ic_err_16:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,17,24)
	.word 0xf431800e  ! 212: STH_R	sth	%r26, [%r6 + %r14]
	.word 0xb9a1082d  ! 213: FADDs	fadds	%f4, %f13, %f28
	.word 0xe429ab93  ! 215: STB_I	stb	%r18, [%r6 + 0x0b93]
thr3_irf_ce_14:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_14), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xf8b9a848  ! 215: STDA_I	stda	%r28, [%r6 + 0x0848] %asi
	.word 0xfe72000e  ! 216: STX_R	stx	%r31, [%r8 + %r14]
	.word 0xe832242a  ! 218: STH_I	sth	%r20, [%r8 + 0x042a]
	.word 0xe6296101  ! 218: STB_I	stb	%r19, [%r5 + 0x0101]
	.word 0xfc20e490  ! 218: STW_I	stw	%r30, [%r3 + 0x0490]
	.word 0xf2a9100d  ! 218: STBA_R	stba	%r25, [%r4 + %r13] 0x80
	.word 0xf029800d  ! 220: STB_R	stb	%r24, [%r6 + %r13]
thr3_ic_err_17:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,29,6)
	.word 0xe221000d  ! 220: STW_R	stw	%r17, [%r4 + %r13]
	.word 0xea70c00d  ! 222: STX_R	stx	%r21, [%r3 + %r13]
	.word 0xf229400e  ! 223: STB_R	stb	%r25, [%r5 + %r14]
!Generating an illinst
	.word 0xa9311d0f  ! 224: SRLX_R	srlx	%r4, %r15, %r20
	.word 0xfcf9a7b8  ! 225: SWAPA_I	swapa	%r30, [%r6 + 0x07b8] %asi
	.word 0xe3e0d00f  ! 226: CASA_I	casa	[%r3] 0x80, %r15, %r17
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xec21e12c  ! 229: STW_I	stw	%r22, [%r7 + 0x012c]
thr3_irf_ce_15:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_15), 16, 16), 1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xa739e001  ! 230: SRA_I	sra 	%r7, 0x0001, %r19
	.word 0xbc11e8c3  ! 230: OR_I	or 	%r7, 0x08c3, %r30
	.word 0xe5e1100c  ! 230: CASA_I	casa	[%r4] 0x80, %r12, %r18
	.word 0xc0f009a0  ! 232: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf019a520  ! 233: LDD_I	ldd	[%r6 + 0x0520], %r24
	.word 0xf230e65b  ! 234: STH_I	sth	%r25, [%r3 + 0x065b]
	.word 0xfa21e56c  ! 236: STW_I	stw	%r29, [%r7 + 0x056c]
thr3_irf_ce_16:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_16), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe4312a20  ! 237: STH_I	sth	%r18, [%r4 + 0x0a20]
thr3_resum_intr_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	.word 0xe4a9d00b  ! 237: STBA_R	stba	%r18, [%r7 + %r11] 0x80
	.word 0xfc31800e  ! 239: STH_R	sth	%r30, [%r6 + %r14]
	.word 0xee31a712  ! 239: STH_I	sth	%r23, [%r6 + 0x0712]
	.word 0xfa71800e  ! 239: STX_R	stx	%r29, [%r6 + %r14]
	.word 0xf030c00b  ! 239: STH_R	sth	%r24, [%r3 + %r11]
	.word 0xec20ed48  ! 240: STW_I	stw	%r22, [%r3 + 0x0d48]
thr3_ic_err_18:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_18), 16, 16),1,IC_DATA,IR,4,x)
!Generating an illinst
	.word 0xaa38eb51  ! 241: XNOR_I	xnor 	%r3, 0x0b51, %r21
	.word 0xe2b1100b  ! 242: STHA_R	stha	%r17, [%r4 + %r11] 0x80
	.word 0xf0222280  ! 244: STW_I	stw	%r24, [%r8 + 0x0280]
thr3_irf_ce_17:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_17), 16, 16), 1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xfa71c00f  ! 245: STX_R	stx	%r29, [%r7 + %r15]
thr3_ic_err_19:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_19), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xfe31edb8  ! 246: STH_I	sth	%r31, [%r7 + 0x0db8]
thr3_resum_intr_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0xf431400e  ! 246: STH_R	sth	%r26, [%r5 + %r14]
	.word 0xe629400c  ! 248: STB_R	stb	%r19, [%r5 + %r12]
	.word 0xe631400f  ! 248: STH_R	sth	%r19, [%r5 + %r15]
	.word 0xfa31ebbe  ! 248: STH_I	sth	%r29, [%r7 + 0x0bbe]
	.word 0xf228c00f  ! 248: STB_R	stb	%r25, [%r3 + %r15]
	.word 0xf220c00f  ! 248: STW_R	stw	%r25, [%r3 + %r15]
	.word 0xee716740  ! 249: STX_I	stx	%r23, [%r5 + 0x0740]
thr3_irf_ce_18:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_18), 16, 16), 1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xfc312c90  ! 250: STH_I	sth	%r30, [%r4 + 0x0c90]
	.word 0xf031a530  ! 250: STH_I	sth	%r24, [%r6 + 0x0530]
	.word 0xe429800f  ! 250: STB_R	stb	%r18, [%r6 + %r15]
	.word 0xbf38e001  ! 251: SRA_I	sra 	%r3, 0x0001, %r31
	.word 0xfa41a1ac  ! 251: LDSW_I	ldsw	[%r6 + 0x01ac], %r29
	.word 0xfaf1500f  ! 252: STXA_R	stxa	%r29, [%r5 + %r15] 0x80
	.word 0xe4722b18  ! 254: STX_I	stx	%r18, [%r8 + 0x0b18]
thr3_ic_err_20:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,18,14)
	.word 0x81d8c00f  ! 254: FLUSH_R	dis not found

	.word 0xef22000b  ! 255: STF_R	st	%f23, [%r11, %r8]
	.word 0xeea2100f  ! 256: STWA_R	stwa	%r23, [%r8 + %r15] 0x80
	.word 0xe829298f  ! 258: STB_I	stb	%r20, [%r4 + 0x098f]
thr3_irf_ce_19:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_19), 16, 16), 1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xc3e96810  ! 258: PREFETCHA_I	prefetcha	[%r5, + 0x0810] %asi, #one_read
	.word 0xfa3124f5  ! 259: STH_I	sth	%r29, [%r4 + 0x04f5]
	.word 0xfa316ad2  ! 261: STH_I	sth	%r29, [%r5 + 0x0ad2]
thr3_irf_ce_20:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_20), 16, 16), 1,IRF,ce,35,x, x,x,x, x,x,x)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc0f00960  ! 263: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe71c00f  ! 265: STX_R	stx	%r31, [%r7 + %r15]
thr3_ic_err_21:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_21), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xfc30ed50  ! 266: STH_I	sth	%r30, [%r3 + 0x0d50]
	.word 0xfa22000c  ! 266: STW_R	stw	%r29, [%r8 + %r12]
	.word 0xec21e1ac  ! 266: STW_I	stw	%r22, [%r7 + 0x01ac]
	.word 0xc0f00960  ! 267: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf832000c  ! 269: STH_R	sth	%r28, [%r8 + %r12]
thr3_resum_intr_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
	.word 0xf0f1900b  ! 269: STXA_R	stxa	%r24, [%r6 + %r11] 0x80
thr3_dc_err_4:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_4), 16, 16),1,DC_DATA,55)
	.word 0xf8120009  ! 271: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xf631800f  ! 273: STH_R	sth	%r27, [%r6 + %r15]
thr3_ic_err_22:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,12,23)
	.word 0xfa21400e  ! 274: STW_R	stw	%r29, [%r5 + %r14]
	.word 0xe631800f  ! 274: STH_R	sth	%r19, [%r6 + %r15]
	.word 0xee29ecd2  ! 274: STB_I	stb	%r23, [%r7 + 0x0cd2]
	.word 0xfa31e294  ! 274: STH_I	sth	%r29, [%r7 + 0x0294]
	.word 0xe630c00c  ! 274: STH_R	sth	%r19, [%r3 + %r12]
	.word 0xf429e760  ! 274: STB_I	stb	%r26, [%r7 + 0x0760]
	.word 0xe4b12f04  ! 274: STHA_I	stha	%r18, [%r4 + 0x0f04] %asi
	.word 0xf431c00e  ! 276: STH_R	sth	%r26, [%r7 + %r14]
thr3_irf_ce_21:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_21), 16, 16), 1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xeca9900f  ! 276: STBA_R	stba	%r22, [%r6 + %r15] 0x80
	.word 0xe4f16ab8  ! 277: STXA_I	stxa	%r18, [%r5 + 0x0ab8] %asi
	.word 0xf621800c  ! 279: STW_R	stw	%r27, [%r6 + %r12]
thr3_irf_ce_22:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_22), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xb429000b  ! 280: ANDN_R	andn 	%r4, %r11, %r26
	.word 0xa732100d  ! 280: SRLX_R	srlx	%r8, %r13, %r19
	.word 0xb428e72f  ! 280: ANDN_I	andn 	%r3, 0x072f, %r26
	.word 0xf2e9d00b  ! 280: LDSTUBA_R	ldstuba	%r25, [%r7 + %r11] 0x80
	.word 0xef22211c  ! 281: STF_I	st	%f23, [0x011c, %r8]
	.word 0xb449ea83  ! 282: MULX_I	mulx 	%r7, 0x0a83, %r26
	.word 0xf031624c  ! 284: STH_I	sth	%r24, [%r5 + 0x024c]
	.word 0xfa29400f  ! 284: STB_R	stb	%r29, [%r5 + %r15]
	.word 0xf721000c  ! 284: STF_R	st	%f27, [%r12, %r4]
	.word 0xe339400d  ! 285: STDF_R	std	%f17, [%r13, %r5]
	.word 0xe421000f  ! 287: STW_R	stw	%r18, [%r4 + %r15]
	.word 0xf621e474  ! 287: STW_I	stw	%r27, [%r7 + 0x0474]
	.word 0xf031a54a  ! 287: STH_I	sth	%r24, [%r6 + 0x054a]
	.word 0xf071c00b  ! 287: STX_R	stx	%r24, [%r7 + %r11]
	.word 0xe631c00b  ! 287: STH_R	sth	%r19, [%r7 + %r11]
	.word 0xfe2a20e5  ! 287: STB_I	stb	%r31, [%r8 + 0x00e5]
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xf62a2a32  ! 289: STB_I	stb	%r27, [%r8 + 0x0a32]
thr3_resum_intr_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_20), 16, 16)) -> intp(1, 3, 1)
	.word 0xfbe1d00c  ! 289: CASA_I	casa	[%r7] 0x80, %r12, %r29
	.word 0xec512160  ! 290: LDSH_I	ldsh	[%r4 + 0x0160], %r22
	.word 0xf829a343  ! 291: STB_I	stb	%r28, [%r6 + 0x0343]
	.word 0xa638e5c0  ! 293: XNOR_I	xnor 	%r3, 0x05c0, %r19
	.word 0xa9393001  ! 293: SRAX_I	srax	%r4, 0x0001, %r20
	.word 0xbc19ad89  ! 293: XOR_I	xor 	%r6, 0x0d89, %r30
	.word 0xec71e230  ! 294: STX_I	stx	%r22, [%r7 + 0x0230]
thr3_ic_err_23:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_23), 16, 16),1,IC_DATA,NIR,x,13)
	.word 0xec10e018  ! 294: LDUH_I	lduh	[%r3 + 0x0018], %r22
	.word 0xfb39000c  ! 295: STDF_R	std	%f29, [%r12, %r4]
	.word 0xe22a000d  ! 297: STB_R	stb	%r17, [%r8 + %r13]
	.word 0xf221ac38  ! 297: STW_I	stw	%r25, [%r6 + 0x0c38]
	.word 0xee2226cc  ! 297: STW_I	stw	%r23, [%r8 + 0x06cc]
	.word 0xff21adf4  ! 297: STF_I	st	%f31, [0x0df4, %r6]
	.word 0xe338c00e  ! 298: STDF_R	std	%f17, [%r14, %r3]
	.word 0xf471400b  ! 300: STX_R	stx	%r26, [%r5 + %r11]
thr3_ic_err_24:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_24), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xc4f00c00  ! 301: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xeb3a2438  ! 302: STDF_I	std	%f21, [0x0438, %r8]
	.word 0xe8a9900e  ! 303: STBA_R	stba	%r20, [%r6 + %r14] 0x80
	.word 0xec31a3e0  ! 305: STH_I	sth	%r22, [%r6 + 0x03e0]
	.word 0xfaf1ac98  ! 305: STXA_I	stxa	%r29, [%r6 + 0x0c98] %asi
	.word 0xf66a000e  ! 306: LDSTUB_R	ldstub	%r27, [%r8 + %r14]
	.word 0xf270eef0  ! 308: STX_I	stx	%r25, [%r3 + 0x0ef0]
thr3_resum_intr_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_21), 16, 16)) -> intp(1, 3, 1)
	.word 0xedf1e00f  ! 308: CASXA_R	casxa	[%r7]%asi, %r15, %r22
	.word 0xf23121ca  ! 310: STH_I	sth	%r25, [%r4 + 0x01ca]
	.word 0xf231800c  ! 310: STH_R	sth	%r25, [%r6 + %r12]
	.word 0xea29800e  ! 310: STB_R	stb	%r21, [%r6 + %r14]
	.word 0xfe21a2b0  ! 310: STW_I	stw	%r31, [%r6 + 0x02b0]
	.word 0xec322702  ! 310: STH_I	sth	%r22, [%r8 + 0x0702]
	.word 0xe870ed70  ! 310: STX_I	stx	%r20, [%r3 + 0x0d70]
	.word 0xea21000b  ! 311: STW_R	stw	%r21, [%r4 + %r11]
thr3_irf_ce_23:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_23), 16, 16), 1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0x8143e05a  ! 311: MEMBAR	membar	#StoreLoad | #StoreStore | #Lookaside | #Sync 
	.word 0xfa71e849  ! 312: STX_I	stx	%r29, [%r7 + 0x0849]
	.word 0x81d9400b  ! 313: FLUSH_R	dis not found

	.word 0xfc222928  ! 315: STW_I	stw	%r30, [%r8 + 0x0928]
	.word 0xf2292a4a  ! 315: STB_I	stb	%r25, [%r4 + 0x0a4a]
	.word 0xec21000d  ! 315: STW_R	stw	%r22, [%r4 + %r13]
	.word 0xf2222790  ! 315: STW_I	stw	%r25, [%r8 + 0x0790]
	.word 0xfa71e0c0  ! 315: STX_I	stx	%r29, [%r7 + 0x00c0]
	.word 0xf22a2c42  ! 315: STB_I	stb	%r25, [%r8 + 0x0c42]
	.word 0xea21800e  ! 316: STW_R	stw	%r21, [%r6 + %r14]
thr3_resum_intr_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_22), 16, 16)) -> intp(1, 3, 1)
	.word 0xe739e1e0  ! 316: STDF_I	std	%f19, [0x01e0, %r7]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf229c00b  ! 319: STB_R	stb	%r25, [%r7 + %r11]
thr3_irf_ce_24:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_24), 16, 16), 1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xea29000f  ! 320: STB_R	stb	%r21, [%r4 + %r15]
thr3_resum_intr_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_23), 16, 16)) -> intp(1, 3, 1)
	.word 0xf921eecc  ! 320: STF_I	st	%f28, [0x0ecc, %r7]
	.word 0xf028c00e  ! 322: STB_R	stb	%r24, [%r3 + %r14]
thr3_irf_ce_25:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_25), 16, 16), 1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xaa1927e9  ! 323: XOR_I	xor 	%r4, 0x07e9, %r21
	.word 0xb53a100c  ! 323: SRAX_R	srax	%r8, %r12, %r26
	.word 0xbe19a541  ! 323: XOR_I	xor 	%r6, 0x0541, %r31
	.word 0xac29000b  ! 323: ANDN_R	andn 	%r4, %r11, %r22
	.word 0xea71ea20  ! 324: STX_I	stx	%r21, [%r7 + 0x0a20]
thr3_resum_intr_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_24), 16, 16)) -> intp(1, 3, 1)
	.word 0xf921400c  ! 324: STF_R	st	%f28, [%r12, %r5]
	.word 0xf020ec7c  ! 326: STW_I	stw	%r24, [%r3 + 0x0c7c]
thr3_resum_intr_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_25), 16, 16)) -> intp(1, 3, 1)
	.word 0xf8e8e9b3  ! 326: LDSTUBA_I	ldstuba	%r28, [%r3 + 0x09b3] %asi
	.word 0xf871400b  ! 328: STX_R	stx	%r28, [%r5 + %r11]
thr3_irf_ce_26:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_26), 16, 16), 1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xe431af2e  ! 329: STH_I	sth	%r18, [%r6 + 0x0f2e]
thr3_ic_err_25:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,4,2)
	.word 0xfc40e9c8  ! 329: LDSW_I	ldsw	[%r3 + 0x09c8], %r30
	.word 0xf829c00d  ! 331: STB_R	stb	%r28, [%r7 + %r13]
	.word 0xee21a100  ! 332: STW_I	stw	%r23, [%r6 + 0x0100]
thr3_irf_ce_27:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_27), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xeea224d0  ! 332: STWA_I	stwa	%r23, [%r8 + 0x04d0] %asi
	.word 0xc4f00c00  ! 334: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xec31a6a8  ! 336: STH_I	sth	%r22, [%r6 + 0x06a8]
	.word 0xf028c00b  ! 336: STB_R	stb	%r24, [%r3 + %r11]
	.word 0xf031e2e4  ! 336: STH_I	sth	%r24, [%r7 + 0x02e4]
	.word 0xe829c00e  ! 336: STB_R	stb	%r20, [%r7 + %r14]
	.word 0xe8716228  ! 336: STX_I	stx	%r20, [%r5 + 0x0228]
	.word 0xba32000f  ! 337: ORN_R	orn 	%r8, %r15, %r29
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xea322157  ! 338: STH_I	sth	%r21, [%r8 + 0x0157]
	.word 0xfa70c00d  ! 340: STX_R	stx	%r29, [%r3 + %r13]
	.word 0xea71400e  ! 340: STX_R	stx	%r21, [%r5 + %r14]
	.word 0xe831800e  ! 340: STH_R	sth	%r20, [%r6 + %r14]
	.word 0xf4316125  ! 340: STH_I	sth	%r26, [%r5 + 0x0125]
	.word 0xea7927f4  ! 341: SWAP_I	swap	%r21, [%r4 + 0x07f4]
	.word 0xe8116e50  ! 342: LDUH_I	lduh	[%r5 + 0x0e50], %r20
	.word 0xf0b9900e  ! 343: STDA_R	stda	%r24, [%r6 + %r14] 0x80
	.word 0xb05a000b  ! 344: SMUL_R	smul 	%r8, %r11, %r24
	.word 0xf629000b  ! 346: STB_R	stb	%r27, [%r4 + %r11]
thr3_ic_err_26:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_26), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xe24962d9  ! 346: LDSB_I	ldsb	[%r5 + 0x02d9], %r17
	.word 0xe448e86d  ! 347: LDSB_I	ldsb	[%r3 + 0x086d], %r18
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xed396c80  ! 349: STDF_I	std	%f22, [0x0c80, %r5]
	.word 0xf6a22ea4  ! 350: STWA_I	stwa	%r27, [%r8 + 0x0ea4] %asi
	.word 0xf631400d  ! 352: STH_R	sth	%r27, [%r5 + %r13]
	.word 0xf42961a0  ! 352: STB_I	stb	%r26, [%r5 + 0x01a0]
	.word 0xf021400f  ! 352: STW_R	stw	%r24, [%r5 + %r15]
	.word 0xfe28ec15  ! 352: STB_I	stb	%r31, [%r3 + 0x0c15]
	.word 0xe4712f38  ! 352: STX_I	stx	%r18, [%r4 + 0x0f38]
	.word 0xba58ed73  ! 352: SMUL_I	smul 	%r3, 0x0d73, %r29
	.word 0xfd3a2d10  ! 353: STDF_I	std	%f30, [0x0d10, %r8]
	.word 0xe628e22d  ! 355: STB_I	stb	%r19, [%r3 + 0x022d]
thr3_ic_err_27:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_27), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xee322db0  ! 356: STH_I	sth	%r23, [%r8 + 0x0db0]
thr3_resum_intr_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_26), 16, 16)) -> intp(1, 3, 1)
	.word 0xe4a9e4d5  ! 356: STBA_I	stba	%r18, [%r7 + 0x04d5] %asi
	.word 0xf671e898  ! 358: STX_I	stx	%r27, [%r7 + 0x0898]
thr3_resum_intr_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_27), 16, 16)) -> intp(1, 3, 1)
	.word 0xfc31a266  ! 359: STH_I	sth	%r30, [%r6 + 0x0266]
thr3_irf_ce_28:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_28), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe8196bb0  ! 360: LDD_I	ldd	[%r5 + 0x0bb0], %r20
	.word 0xee316de0  ! 362: STH_I	sth	%r23, [%r5 + 0x0de0]
thr3_resum_intr_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_28), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 363: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf451abd4  ! 364: LDSH_I	ldsh	[%r6 + 0x0bd4], %r26
	.word 0xf621400e  ! 366: STW_R	stw	%r27, [%r5 + %r14]
thr3_resum_intr_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_29), 16, 16)) -> intp(1, 3, 1)
	.word 0xa931a001  ! 367: SRL_I	srl 	%r6, 0x0001, %r20
	.word 0xb4096a67  ! 367: AND_I	and 	%r5, 0x0a67, %r26
	.word 0xfc31621e  ! 368: STH_I	sth	%r30, [%r5 + 0x021e]
	.word 0xf032000c  ! 368: STH_R	sth	%r24, [%r8 + %r12]
	.word 0xee21af8c  ! 368: STW_I	stw	%r23, [%r6 + 0x0f8c]
	.word 0xf2312834  ! 368: STH_I	sth	%r25, [%r4 + 0x0834]
	.word 0xe651a5a2  ! 368: LDSH_I	ldsh	[%r6 + 0x05a2], %r19
	.word 0xe628e7b9  ! 370: STB_I	stb	%r19, [%r3 + 0x07b9]
thr3_ic_err_28:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_28), 16, 16),1,IC_DATA,IR_NIR,11,4)
	.word 0xe220c00f  ! 371: STW_R	stw	%r17, [%r3 + %r15]
thr3_resum_intr_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_30), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 372: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe6712a60  ! 374: STX_I	stx	%r19, [%r4 + 0x0a60]
thr3_ic_err_29:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_29), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xe671e890  ! 375: STX_I	stx	%r19, [%r7 + 0x0890]
	.word 0xfa31abe0  ! 375: STH_I	sth	%r29, [%r6 + 0x0be0]
	.word 0xe67122e8  ! 375: STX_I	stx	%r19, [%r4 + 0x02e8]
	.word 0xf868c00c  ! 375: LDSTUB_R	ldstub	%r28, [%r3 + %r12]
	.word 0xf27168e8  ! 377: STX_I	stx	%r25, [%r5 + 0x08e8]
thr3_ic_err_30:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_30), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xf5f1100d  ! 377: CASXA_I	casxa	[%r4] 0x80, %r13, %r26
	.word 0xeaf9100c  ! 378: SWAPA_R	swapa	%r21, [%r4 + %r12] 0x80
	.word 0xe8b9100c  ! 379: STDA_R	stda	%r20, [%r4 + %r12] 0x80
!Generating an illinst
	.word 0xb5290f4c  ! 381: SLL_R	sll 	%r4, %r12, %r26
	.word 0xe650e694  ! 382: LDSH_I	ldsh	[%r3 + 0x0694], %r19
	.word 0xee69400c  ! 383: LDSTUB_R	ldstub	%r23, [%r5 + %r12]
	.word 0xfa30e47a  ! 385: STH_I	sth	%r29, [%r3 + 0x047a]
	.word 0xfc70e628  ! 385: STX_I	stx	%r30, [%r3 + 0x0628]
	.word 0xf6216a28  ! 385: STW_I	stw	%r27, [%r5 + 0x0a28]
	.word 0xfc4a2297  ! 385: LDSB_I	ldsb	[%r8 + 0x0297], %r30
	.word 0xfa2a000b  ! 387: STB_R	stb	%r29, [%r8 + %r11]
thr3_resum_intr_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_31), 16, 16)) -> intp(1, 3, 1)
	.word 0xf4f969f4  ! 387: SWAPA_I	swapa	%r26, [%r5 + 0x09f4] %asi
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0xb808c00d  ! 390: AND_R	and 	%r3, %r13, %r28
	.word 0xa811286b  ! 390: OR_I	or 	%r4, 0x086b, %r20
	.word 0xa9782401  ! 390: MOVR_I	move	%r0, 0xfffffed8, %r20
	.word 0xa229c00b  ! 390: ANDN_R	andn 	%r7, %r11, %r17
	.word 0xfa2960c0  ! 391: STB_I	stb	%r29, [%r5 + 0x00c0]
thr3_ic_err_31:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_31), 16, 16),1,IC_DATA,IR_NIR,24,30)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xc4f00980  ! 393: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xffe1200c  ! 394: CASA_R	casa	[%r4] %asi, %r12, %r31
	.word 0xfe2a000e  ! 396: STB_R	stb	%r31, [%r8 + %r14]
	.word 0xe421c00f  ! 396: STW_R	stw	%r18, [%r7 + %r15]
	.word 0xec29400e  ! 396: STB_R	stb	%r22, [%r5 + %r14]
	.word 0xe872000c  ! 397: STX_R	stx	%r20, [%r8 + %r12]
	.word 0xe621a6d0  ! 397: STW_I	stw	%r19, [%r6 + 0x06d0]
	.word 0xa809a875  ! 398: AND_I	and 	%r6, 0x0875, %r20
	.word 0xe5f1500b  ! 398: CASXA_I	casxa	[%r5] 0x80, %r11, %r18
	.word 0xec72000e  ! 399: STX_R	stx	%r22, [%r8 + %r14]
	.word 0xf431800f  ! 401: STH_R	sth	%r26, [%r6 + %r15]
thr3_resum_intr_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_32), 16, 16)) -> intp(1, 3, 1)
	.word 0xf009eea4  ! 401: LDUB_I	ldub	[%r7 + 0x0ea4], %r24
	.word 0xa531400b  ! 403: SRL_R	srl 	%r5, %r11, %r18
	.word 0xed212acc  ! 403: STF_I	st	%f22, [0x0acc, %r4]
	.word 0xf539400d  ! 404: STDF_R	std	%f26, [%r13, %r5]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xee3124aa  ! 408: STH_I	sth	%r23, [%r4 + 0x04aa]
	.word 0xf8322186  ! 408: STH_I	sth	%r28, [%r8 + 0x0186]
	.word 0xfc722bd8  ! 409: STX_I	stx	%r30, [%r8 + 0x0bd8]
	.word 0xe471e350  ! 409: STX_I	stx	%r18, [%r7 + 0x0350]
	.word 0xe629000d  ! 410: STB_R	stb	%r19, [%r4 + %r13]
	.word 0xfc296058  ! 410: STB_I	stb	%r30, [%r5 + 0x0058]
	.word 0xf071ec20  ! 410: STX_I	stx	%r24, [%r7 + 0x0c20]
	.word 0xea22000b  ! 410: STW_R	stw	%r21, [%r8 + %r11]
	.word 0xee29e22b  ! 410: STB_I	stb	%r23, [%r7 + 0x022b]
	.word 0xe222000e  ! 410: STW_R	stw	%r17, [%r8 + %r14]
thr3_dc_err_5:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_5), 16, 16),1,DC_DATA,54)
	.word 0xfa4a0009  ! 411: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xfa32000f  ! 412: STH_R	sth	%r29, [%r8 + %r15]
	.word 0xba0a272c  ! 414: AND_I	and 	%r8, 0x072c, %r29
	.word 0xff39c00d  ! 414: STDF_R	std	%f31, [%r13, %r7]
	.word 0xe4b9100e  ! 415: STDA_R	stda	%r18, [%r4 + %r14] 0x80
	.word 0xf6216064  ! 417: STW_I	stw	%r27, [%r5 + 0x0064]
thr3_irf_ce_29:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_29), 16, 16), 1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xfc30c00d  ! 418: STH_R	sth	%r30, [%r3 + %r13]
	.word 0xee21000c  ! 418: STW_R	stw	%r23, [%r4 + %r12]
	.word 0xf22125ac  ! 418: STW_I	stw	%r25, [%r4 + 0x05ac]
	.word 0xe621acd3  ! 418: STW_I	stw	%r19, [%r6 + 0x0cd3]
	.word 0xfc29c00f  ! 420: STB_R	stb	%r30, [%r7 + %r15]
thr3_irf_ce_30:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_30), 16, 16), 1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xe42a000c  ! 420: STB_R	stb	%r18, [%r8 + %r12]
	.word 0xc369000d  ! 421: PREFETCH_R	prefetch	[%r4 + %r13], #one_read
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf032000b  ! 424: STH_R	sth	%r24, [%r8 + %r11]
thr3_ic_err_32:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_32), 16, 16),1,IC_DATA,NIR,x,29)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf0292bbf  ! 425: STB_I	stb	%r24, [%r4 + 0x0bbf]
	.word 0xe659a108  ! 426: LDX_I	ldx	[%r6 + 0x0108], %r19
!Generating an illinst
	.word 0xb539dd6b  ! 428: SRAX_R	srax	%r7, %r11, %r26
	.word 0xe2316510  ! 430: STH_I	sth	%r17, [%r5 + 0x0510]
	.word 0xf1212b68  ! 430: STF_I	st	%f24, [0x0b68, %r4]
	.word 0xf720c00e  ! 431: STF_R	st	%f27, [%r14, %r3]
	.word 0xebe1500c  ! 432: CASA_I	casa	[%r5] 0x80, %r12, %r21
	.word 0xfe21e230  ! 434: STW_I	stw	%r31, [%r7 + 0x0230]
thr3_resum_intr_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_33), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe828c00c  ! 436: STB_R	stb	%r20, [%r3 + %r12]
thr3_ic_err_33:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_33), 16, 16),1,IC_DATA,IR,33,x)
	.word 0x81d9800f  ! 436: FLUSH_R	dis not found

	.word 0xe4212f80  ! 438: STW_I	stw	%r18, [%r4 + 0x0f80]
thr3_ic_err_34:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_34), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xf022000f  ! 439: STW_R	stw	%r24, [%r8 + %r15]
	.word 0xf8316aa0  ! 439: STH_I	sth	%r28, [%r5 + 0x0aa0]
	.word 0xf231000f  ! 439: STH_R	sth	%r25, [%r4 + %r15]
	.word 0xb61163c9  ! 440: OR_I	or 	%r5, 0x03c9, %r27
	.word 0xa930d00f  ! 440: SRLX_R	srlx	%r3, %r15, %r20
	.word 0xbb30e001  ! 440: SRL_I	srl 	%r3, 0x0001, %r29
	.word 0xb729500e  ! 440: SLLX_R	sllx	%r5, %r14, %r27
	.word 0xeaa92ce3  ! 440: STBA_I	stba	%r21, [%r4 + 0x0ce3] %asi
thr3_dc_err_6:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_6), 16, 16),1,DC_DATA,60)
	.word 0xf0418009  ! 442: LDSW_R	ldsw	[%r6 + %r9], %r24
	.word 0xf021a543  ! 443: STW_I	stw	%r24, [%r6 + 0x0543]
	.word 0xec69000e  ! 444: LDSTUB_R	ldstub	%r22, [%r4 + %r14]
	.word 0xb250c00d  ! 445: UMUL_R	umul 	%r3, %r13, %r25
	.word 0xfc28c00e  ! 447: STB_R	stb	%r30, [%r3 + %r14]
thr3_irf_ce_31:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_31), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xe429000d  ! 448: STB_R	stb	%r18, [%r4 + %r13]
	.word 0xfa3129d0  ! 448: STH_I	sth	%r29, [%r4 + 0x09d0]
	.word 0xee29a701  ! 448: STB_I	stb	%r23, [%r6 + 0x0701]
	.word 0xfe722d70  ! 448: STX_I	stx	%r31, [%r8 + 0x0d70]
	.word 0xbf782401  ! 449: MOVR_I	move	%r0, 0xfffffed8, %r31
	.word 0xaa28c00d  ! 449: ANDN_R	andn 	%r3, %r13, %r21
	.word 0xa609000d  ! 449: AND_R	and 	%r4, %r13, %r19
	.word 0xb809ea54  ! 449: AND_I	and 	%r7, 0x0a54, %r28
	.word 0xf8b1100e  ! 449: STHA_R	stha	%r28, [%r4 + %r14] 0x80
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe43124c0  ! 452: STH_I	sth	%r18, [%r4 + 0x04c0]
	.word 0xe828e77c  ! 452: STB_I	stb	%r20, [%r3 + 0x077c]
	.word 0xf8712550  ! 452: STX_I	stx	%r28, [%r4 + 0x0550]
	.word 0xe721400f  ! 452: STF_R	st	%f19, [%r15, %r5]
	.word 0xfa29e7c0  ! 454: STB_I	stb	%r29, [%r7 + 0x07c0]
thr3_ic_err_35:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_35), 16, 16),1,IC_DATA,IR_NIR,0,16)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfcb96330  ! 455: STDA_I	stda	%r30, [%r5 + 0x0330] %asi
	.word 0xec22000d  ! 457: STW_R	stw	%r22, [%r8 + %r13]
thr3_irf_ce_32:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_32), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf029000f  ! 458: STB_R	stb	%r24, [%r4 + %r15]
thr3_irf_ce_33:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_33), 16, 16), 1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc0f00960  ! 459: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf85164d2  ! 460: LDSH_I	ldsh	[%r5 + 0x04d2], %r28
	.word 0x2cc10001  ! 461: BRGZ	brgz,a,nt	%4,<label_0x10001>
!Generating an illinst
	.word 0xad781d2b  ! 463: MOVR_R	movvs	%r0, %r11, %r22
	.word 0xe921400f  ! 464: STF_R	st	%f20, [%r15, %r5]
	.word 0xfc222464  ! 466: STW_I	stw	%r30, [%r8 + 0x0464]
thr3_irf_ce_34:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_34), 16, 16), 1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xeea9e7ee  ! 466: STBA_I	stba	%r23, [%r7 + 0x07ee] %asi
	.word 0xf630e644  ! 468: STH_I	sth	%r27, [%r3 + 0x0644]
	.word 0xea2a000c  ! 468: STB_R	stb	%r21, [%r8 + %r12]
	.word 0xe621000d  ! 468: STW_R	stw	%r19, [%r4 + %r13]
	.word 0xc0f00960  ! 469: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf03122da  ! 471: STH_I	sth	%r24, [%r4 + 0x02da]
thr3_ic_err_36:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_36), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xaa11af81  ! 472: OR_I	or 	%r6, 0x0f81, %r21
	.word 0xaf31500f  ! 473: SRLX_R	srlx	%r5, %r15, %r23
	.word 0xe671400b  ! 474: STX_R	stx	%r19, [%r5 + %r11]
thr3_irf_ce_35:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_35), 16, 16), 1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xfc3162e6  ! 475: STH_I	sth	%r30, [%r5 + 0x02e6]
	.word 0xec21e2f8  ! 475: STW_I	stw	%r22, [%r7 + 0x02f8]
	.word 0xe621000d  ! 475: STW_R	stw	%r19, [%r4 + %r13]
	.word 0xf471af48  ! 475: STX_I	stx	%r26, [%r6 + 0x0f48]
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xf0716728  ! 477: STX_I	stx	%r24, [%r5 + 0x0728]
thr3_ic_err_37:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_37), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xc0f009a0  ! 478: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xea2a2b0b  ! 481: STB_I	stb	%r21, [%r8 + 0x0b0b]
thr3_irf_ce_36:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_36), 16, 16), 1,IRF,ce,50,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xf221a384  ! 483: STW_I	stw	%r25, [%r6 + 0x0384]
thr3_irf_ce_37:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_37), 16, 16), 1,IRF,ce,68,x, x,x,x, x,x,x)
thr3_dc_err_7:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_7), 16, 16),1,DC_DATA,22)
	.word 0xf0194009  ! 484: LDD_R	ldd	[%r5 + %r9], %r24
	.word 0xfc196dc0  ! 485: LDD_I	ldd	[%r5 + 0x0dc0], %r30
	.word 0xfcb1900d  ! 486: STHA_R	stha	%r30, [%r6 + %r13] 0x80
	.word 0xea21e364  ! 488: STW_I	stw	%r21, [%r7 + 0x0364]
thr3_resum_intr_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_34), 16, 16)) -> intp(1, 3, 1)
	.word 0xe339400b  ! 488: STDF_R	std	%f17, [%r11, %r5]
	.word 0xf071a058  ! 490: STX_I	stx	%r24, [%r6 + 0x0058]
thr3_ic_err_38:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_38), 16, 16),1,IC_DATA,NIR,x,14)
	.word 0xee31c00f  ! 491: STH_R	sth	%r23, [%r7 + %r15]
thr3_ic_err_39:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_39), 16, 16),1,IC_DATA,NIR,x,25)
	.word 0xec32202c  ! 492: STH_I	sth	%r22, [%r8 + 0x002c]
thr3_ic_err_40:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_40), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xc0f00960  ! 493: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_8:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_8), 16, 16),1,DC_DATA,6)
	.word 0xe6090009  ! 495: LDUB_R	ldub	[%r4 + %r9], %r19
	.word 0xec29800d  ! 497: STB_R	stb	%r22, [%r6 + %r13]
thr3_irf_ce_38:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_38), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf4192a70  ! 497: LDD_I	ldd	[%r4 + 0x0a70], %r26
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx  0x9ebe4c4a89700505, %r16, %r17
	setx  0x32fff76d703e86a1, %r16, %r18
	setx  0xc91a073f2c46c8d6, %r16, %r19
	setx  0xa68ececffff24408, %r16, %r20
	setx  0x1b99234a486ce851, %r16, %r21
	setx  0xe36eb57c92ef2bbe, %r16, %r22
	setx  0xb64ed3d658b7fef7, %r16, %r23
	setx  0xe8a13be107ef2831, %r16, %r24
	setx  0x4edf191035d772f0, %r16, %r25
	setx  0x72fe9f8aefa0eee5, %r16, %r26
	setx  0xcc3bc57ac807e05a, %r16, %r27
	setx  0xac77b7fd3b0c129b, %r16, %r28
	setx  0x3849266a5bd67bc3, %r16, %r29
	setx  0xa96e606e759ff85e, %r16, %r30
	setx  0xbc517a9ed79c9e49, %r16, %r31
	setx  0x0000000000000870, %r16, %r9
	setx  0x0000000000000c40, %r16, %r10
	setx  0x00000000000008d0, %r16, %r11
	setx  0x0000000000000d90, %r16, %r12
	setx  0x0000000000000470, %r16, %r13
	setx  0x0000000000000b50, %r16, %r14
	setx  0x00000000000004a0, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	setx  0xffffffffffffffff, %r16, %r2
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
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	wr  %r0, 0x80, %asi
	.word 0xfa216d9c  ! 0: STW_I	stw	%r29, [%r5 + 0x0d9c]
	.word 0x8143c000  ! 1: STBAR	stbar
thr2_dc_err_0:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_0), 16, 16),1,DC_DATA,18)
	.word 0xf0110009  ! 3: LDUH_R	lduh	[%r4 + %r9], %r24
	.word 0xee08e5bd  ! 4: LDUB_I	ldub	[%r3 + 0x05bd], %r23
	.word 0xfe496c62  ! 5: LDSB_I	ldsb	[%r5 + 0x0c62], %r31
	.word 0xe871c00d  ! 7: STX_R	stx	%r20, [%r7 + %r13]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xea2168c8  ! 9: STW_I	stw	%r21, [%r5 + 0x08c8]
thr2_resum_intr_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xf62969f4  ! 10: STB_I	stb	%r27, [%r5 + 0x09f4]
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16), 1,IRF,ce,28,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe3e0d00e  ! 12: CASA_I	casa	[%r3] 0x80, %r14, %r17
	.word 0xa92a2001  ! 14: SLL_I	sll 	%r8, 0x0001, %r20
	.word 0xac18c00d  ! 14: XOR_R	xor 	%r3, %r13, %r22
	.word 0xa431c00c  ! 14: ORN_R	orn 	%r7, %r12, %r18
	.word 0xbd2a000c  ! 14: SLL_R	sll 	%r8, %r12, %r30
	.word 0xf631c00b  ! 15: STH_R	sth	%r27, [%r7 + %r11]
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16), 1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xf029adc2  ! 16: STB_I	stb	%r24, [%r6 + 0x0dc2]
	.word 0xb8196669  ! 17: XOR_I	xor 	%r5, 0x0669, %r28
	.word 0xb139500b  ! 17: SRAX_R	srax	%r5, %r11, %r24
	.word 0xb0192522  ! 17: XOR_I	xor 	%r4, 0x0522, %r24
	.word 0xf04a275f  ! 17: LDSB_I	ldsb	[%r8 + 0x075f], %r24
	.word 0xe470e0b8  ! 19: STX_I	stx	%r18, [%r3 + 0x00b8]
thr2_irf_ce_2:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_2), 16, 16), 1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf030e2de  ! 20: STH_I	sth	%r24, [%r3 + 0x02de]
thr2_resum_intr_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xb849e0a8  ! 20: MULX_I	mulx 	%r7, 0x00a8, %r28
	.word 0xe5e1100d  ! 21: CASA_I	casa	[%r4] 0x80, %r13, %r18
	.word 0xf9e0e00c  ! 22: CASA_R	casa	[%r3] %asi, %r12, %r28
	.word 0xf822000c  ! 24: STW_R	stw	%r28, [%r8 + %r12]
thr2_ic_err_0:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_0), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xf3f1a00e  ! 24: CASXA_R	casxa	[%r6]%asi, %r14, %r25
	.word 0xe220c00e  ! 26: STW_R	stw	%r17, [%r3 + %r14]
thr2_ic_err_1:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,14,21)
	.word 0xe8412314  ! 26: LDSW_I	ldsw	[%r4 + 0x0314], %r20
	.word 0xe6312b96  ! 28: STH_I	sth	%r19, [%r4 + 0x0b96]
	.word 0xe47126b0  ! 28: STX_I	stx	%r18, [%r4 + 0x06b0]
	.word 0xfa32000c  ! 28: STH_R	sth	%r29, [%r8 + %r12]
	.word 0xf2292911  ! 29: STB_I	stb	%r25, [%r4 + 0x0911]
thr2_ic_err_2:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_2), 16, 16),1,IC_DATA,IR,24,x)
thr2_dc_err_1:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_1), 16, 16),1,DC_DATA,53)
	.word 0xf0598009  ! 30: LDX_R	ldx	[%r6 + %r9], %r24
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf7f1200d  ! 32: CASXA_R	casxa	[%r4]%asi, %r13, %r27
	.word 0xa818e035  ! 34: XOR_I	xor 	%r3, 0x0035, %r20
	.word 0xfc31e1de  ! 35: STH_I	sth	%r30, [%r7 + 0x01de]
thr2_resum_intr_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe470e418  ! 38: STX_I	stx	%r18, [%r3 + 0x0418]
thr2_irf_ce_3:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_3), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xfe21c00d  ! 39: STW_R	stw	%r31, [%r7 + %r13]
thr2_irf_ce_4:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_4), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe258e298  ! 39: LDX_I	ldx	[%r3 + 0x0298], %r17
	.word 0xfc21800b  ! 41: STW_R	stw	%r30, [%r6 + %r11]
	.word 0xf429c00e  ! 41: STB_R	stb	%r26, [%r7 + %r14]
	.word 0xe018e920  ! 41: LDD_I	ldd	[%r3 + 0x0920], %r16
	.word 0xfcb9abb8  ! 42: STDA_I	stda	%r30, [%r6 + 0x0bb8] %asi
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf8716b60  ! 45: STX_I	stx	%r28, [%r5 + 0x0b60]
thr2_resum_intr_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe209e147  ! 46: LDUB_I	ldub	[%r7 + 0x0147], %r17
	.word 0xf472000e  ! 48: STX_R	stx	%r26, [%r8 + %r14]
	.word 0xfe29400c  ! 48: STB_R	stb	%r31, [%r5 + %r12]
	.word 0xee322586  ! 48: STH_I	sth	%r23, [%r8 + 0x0586]
	.word 0xe629c00e  ! 48: STB_R	stb	%r19, [%r7 + %r14]
	.word 0xfa21800e  ! 48: STW_R	stw	%r29, [%r6 + %r14]
	.word 0xf271800f  ! 48: STX_R	stx	%r25, [%r6 + %r15]
	.word 0x32800003  ! 48: BNE	bne,a	<label_0x3>
	.word 0xe87220e8  ! 50: STX_I	stx	%r20, [%r8 + 0x00e8]
	.word 0xb829217d  ! 51: ANDN_I	andn 	%r4, 0x017d, %r28
	.word 0xa610c00f  ! 51: OR_R	or 	%r3, %r15, %r19
	.word 0xb728f001  ! 51: SLLX_I	sllx	%r3, 0x0001, %r27
	.word 0xb801c00b  ! 51: ADD_R	add 	%r7, %r11, %r28
	.word 0xe629c00d  ! 52: STB_R	stb	%r19, [%r7 + %r13]
thr2_irf_ce_5:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_5), 16, 16), 1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xf1e0e00b  ! 52: CASA_R	casa	[%r3] %asi, %r11, %r24
	.word 0xec29a739  ! 53: STB_I	stb	%r22, [%r6 + 0x0739]
	.word 0xf871400f  ! 55: STX_R	stx	%r28, [%r5 + %r15]
	.word 0xfe70e1b8  ! 55: STX_I	stx	%r31, [%r3 + 0x01b8]
	.word 0xe672000d  ! 55: STX_R	stx	%r19, [%r8 + %r13]
	.word 0xf820c00f  ! 55: STW_R	stw	%r28, [%r3 + %r15]
	.word 0xe628e6aa  ! 55: STB_I	stb	%r19, [%r3 + 0x06aa]
	.word 0xf029000c  ! 55: STB_R	stb	%r24, [%r4 + %r12]
	.word 0xfe716448  ! 55: STX_I	stx	%r31, [%r5 + 0x0448]
	.word 0xee31400b  ! 56: STH_R	sth	%r23, [%r5 + %r11]
thr2_ic_err_3:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_3), 16, 16),1,IC_DATA,IR_NIR,17,30)
	.word 0xa578040d  ! 57: MOVR_R	move	%r0, %r13, %r18
	.word 0xa931000f  ! 57: SRL_R	srl 	%r4, %r15, %r20
	.word 0xb329a001  ! 57: SLL_I	sll 	%r6, 0x0001, %r25
	.word 0xe8b0ea70  ! 57: STHA_I	stha	%r20, [%r3 + 0x0a70] %asi
	.word 0xf831800f  ! 59: STH_R	sth	%r28, [%r6 + %r15]
thr2_ic_err_4:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_4), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xfc30c00d  ! 60: STH_R	sth	%r30, [%r3 + %r13]
	.word 0xf229c00c  ! 60: STB_R	stb	%r25, [%r7 + %r12]
	.word 0xf421e458  ! 60: STW_I	stw	%r26, [%r7 + 0x0458]
	.word 0xb9782401  ! 61: MOVR_I	move	%r0, 0xfffffed8, %r28
	.word 0xe231400c  ! 62: STH_R	sth	%r17, [%r5 + %r12]
	.word 0xf028c00f  ! 62: STB_R	stb	%r24, [%r3 + %r15]
	.word 0xe820c00b  ! 63: STW_R	stw	%r20, [%r3 + %r11]
	.word 0xf229000c  ! 63: STB_R	stb	%r25, [%r4 + %r12]
	.word 0xfc71c00c  ! 63: STX_R	stx	%r30, [%r7 + %r12]
	.word 0xe4216510  ! 63: STW_I	stw	%r18, [%r5 + 0x0510]
	.word 0xf6712288  ! 63: STX_I	stx	%r27, [%r4 + 0x0288]
	.word 0xee72000c  ! 64: STX_R	stx	%r23, [%r8 + %r12]
	.word 0xec71c00d  ! 64: STX_R	stx	%r22, [%r7 + %r13]
	.word 0xfa31800d  ! 64: STH_R	sth	%r29, [%r6 + %r13]
	.word 0xe4216f6c  ! 64: STW_I	stw	%r18, [%r5 + 0x0f6c]
	.word 0xecb1500f  ! 64: STHA_R	stha	%r22, [%r5 + %r15] 0x80
	.word 0xfe29c00d  ! 66: STB_R	stb	%r31, [%r7 + %r13]
thr2_irf_ce_6:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_6), 16, 16), 1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xfa28e556  ! 67: STB_I	stb	%r29, [%r3 + 0x0556]
	.word 0xe670c00d  ! 67: STX_R	stx	%r19, [%r3 + %r13]
	.word 0xe9f1e00f  ! 67: CASXA_R	casxa	[%r7]%asi, %r15, %r20
	.word 0xf0f96784  ! 68: SWAPA_I	swapa	%r24, [%r5 + 0x0784] %asi
	.word 0xe22a2bb2  ! 70: STB_I	stb	%r17, [%r8 + 0x0bb2]
thr2_resum_intr_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0xaa716ba6  ! 70: UDIV_I	udiv 	%r5, 0x0ba6, %r21
	.word 0x8143e04c  ! 71: MEMBAR	membar	#LoadStore | #StoreStore | #Sync 
	.word 0xf830e07e  ! 73: STH_I	sth	%r28, [%r3 + 0x007e]
thr2_ic_err_5:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_5), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xef21e868  ! 75: STF_I	st	%f23, [0x0868, %r7]
	.word 0xf22a212f  ! 77: STB_I	stb	%r25, [%r8 + 0x012f]
thr2_irf_ce_7:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_7), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe871e618  ! 78: STX_I	stx	%r20, [%r7 + 0x0618]
	.word 0xe271800d  ! 78: STX_R	stx	%r17, [%r6 + %r13]
	.word 0xee20e7d4  ! 78: STW_I	stw	%r23, [%r3 + 0x07d4]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
thr2_dc_err_2:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_2), 16, 16),1,DC_DATA,24)
	.word 0xee51c009  ! 80: LDSH_R	ldsh	[%r7 + %r9], %r23
	.word 0xc4f00980  ! 82: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfe20e8f8  ! 84: STW_I	stw	%r31, [%r3 + 0x08f8]
thr2_dc_err_3:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_3), 16, 16),1,DC_DATA,15)
	.word 0xfa190009  ! 85: LDD_R	ldd	[%r4 + %r9], %r29
	.word 0xf829000c  ! 87: STB_R	stb	%r28, [%r4 + %r12]
thr2_resum_intr_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xf8312ef3  ! 87: STH_I	sth	%r28, [%r4 + 0x0ef3]
	.word 0xf121c00d  ! 88: STF_R	st	%f24, [%r13, %r7]
	.word 0xec31e3ac  ! 90: STH_I	sth	%r22, [%r7 + 0x03ac]
	.word 0xe421400e  ! 90: STW_R	stw	%r18, [%r5 + %r14]
	.word 0xeb39e298  ! 90: STDF_I	std	%f21, [0x0298, %r7]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xec5922b0  ! 92: LDX_I	ldx	[%r4 + 0x02b0], %r22
	.word 0xe872000f  ! 94: STX_R	stx	%r20, [%r8 + %r15]
thr2_ic_err_6:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,8,2)
	.word 0xf6216214  ! 95: STW_I	stw	%r27, [%r5 + 0x0214]
	.word 0xe431e672  ! 95: STH_I	sth	%r18, [%r7 + 0x0672]
	.word 0xf030ebc6  ! 96: STH_I	sth	%r24, [%r3 + 0x0bc6]
thr2_ic_err_7:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_7), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xea29a2bc  ! 97: STB_I	stb	%r21, [%r6 + 0x02bc]
thr2_ic_err_8:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_8), 16, 16),1,IC_DATA,IR_NIR,29,10)
	.word 0xfe30e03c  ! 98: STH_I	sth	%r31, [%r3 + 0x003c]
	.word 0xe631400e  ! 98: STH_R	sth	%r19, [%r5 + %r14]
	.word 0xfe71efc0  ! 98: STX_I	stx	%r31, [%r7 + 0x0fc0]
	.word 0xf6216864  ! 99: STW_I	stw	%r27, [%r5 + 0x0864]
thr2_resum_intr_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	.word 0xf271000d  ! 100: STX_R	stx	%r25, [%r4 + %r13]
thr2_resum_intr_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	.word 0xee69c00c  ! 100: LDSTUB_R	ldstub	%r23, [%r7 + %r12]
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf4f9500c  ! 103: SWAPA_R	swapa	%r26, [%r5 + %r12] 0x80
	.word 0xf811e4b6  ! 104: LDUH_I	lduh	[%r7 + 0x04b6], %r28
	.word 0xe621e900  ! 106: STW_I	stw	%r19, [%r7 + 0x0900]
thr2_resum_intr_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xfa31c00e  ! 107: STH_R	sth	%r29, [%r7 + %r14]
thr2_irf_ce_8:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_8), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xe409af3a  ! 107: LDUB_I	ldub	[%r6 + 0x0f3a], %r18
	.word 0xf832000b  ! 108: STH_R	sth	%r28, [%r8 + %r11]
	.word 0xe4222df8  ! 110: STW_I	stw	%r18, [%r8 + 0x0df8]
thr2_resum_intr_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc4f00c00  ! 112: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xea212834  ! 115: STW_I	stw	%r21, [%r4 + 0x0834]
	.word 0xf872000d  ! 115: STX_R	stx	%r28, [%r8 + %r13]
	.word 0xfc71000f  ! 116: STX_R	stx	%r30, [%r4 + %r15]
thr2_resum_intr_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xe628c00c  ! 117: STB_R	stb	%r19, [%r3 + %r12]
	.word 0xe431800f  ! 117: STH_R	sth	%r18, [%r6 + %r15]
	.word 0xec31efe2  ! 117: STH_I	sth	%r22, [%r7 + 0x0fe2]
	.word 0xe221800b  ! 117: STW_R	stw	%r17, [%r6 + %r11]
	.word 0xf031000b  ! 117: STH_R	sth	%r24, [%r4 + %r11]
	.word 0xf4322392  ! 117: STH_I	sth	%r26, [%r8 + 0x0392]
	.word 0xfe20eb84  ! 118: STW_I	stw	%r31, [%r3 + 0x0b84]
	.word 0xfa30ef96  ! 118: STH_I	sth	%r29, [%r3 + 0x0f96]
	.word 0xe868e49f  ! 118: LDSTUB_I	ldstub	%r20, [%r3 + 0x049f]
	.word 0xe2316fa9  ! 119: STH_I	sth	%r17, [%r5 + 0x0fa9]
	.word 0xfa71400f  ! 121: STX_R	stx	%r29, [%r5 + %r15]
thr2_ic_err_9:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_9), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xe9392788  ! 121: STDF_I	std	%f20, [0x0788, %r4]
	.word 0xf721c00e  ! 122: STF_R	st	%f27, [%r14, %r7]
	.word 0xfef96d14  ! 123: SWAPA_I	swapa	%r31, [%r5 + 0x0d14] %asi
	.word 0xf421c00e  ! 124: STW_R	stw	%r26, [%r7 + %r14]
	.word 0xe921000f  ! 125: STF_R	st	%f20, [%r15, %r4]
	.word 0xa730e001  ! 127: SRL_I	srl 	%r3, 0x0001, %r19
	.word 0xb632000e  ! 127: ORN_R	orn 	%r8, %r14, %r27
	.word 0xb021800d  ! 127: SUB_R	sub 	%r6, %r13, %r24
	.word 0xf02a000d  ! 128: STB_R	stb	%r24, [%r8 + %r13]
thr2_resum_intr_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xf80a261c  ! 128: LDUB_I	ldub	[%r8 + 0x061c], %r28
	.word 0xe33a28c8  ! 129: STDF_I	std	%f17, [0x08c8, %r8]
	.word 0xe6e9d00f  ! 130: LDSTUBA_R	ldstuba	%r19, [%r7 + %r15] 0x80
	.word 0xea20ec0c  ! 132: STW_I	stw	%r21, [%r3 + 0x0c0c]
	.word 0xf230e61a  ! 132: STH_I	sth	%r25, [%r3 + 0x061a]
	.word 0xe671a090  ! 132: STX_I	stx	%r19, [%r6 + 0x0090]
	.word 0xf829800d  ! 132: STB_R	stb	%r28, [%r6 + %r13]
	.word 0xfc31a622  ! 132: STH_I	sth	%r30, [%r6 + 0x0622]
	.word 0xff20ec6c  ! 132: STF_I	st	%f31, [0x0c6c, %r3]
	.word 0xe8a1100e  ! 133: STWA_R	stwa	%r20, [%r4 + %r14] 0x80
	.word 0xee29000b  ! 135: STB_R	stb	%r23, [%r4 + %r11]
thr2_resum_intr_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 136: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe921800b  ! 137: STF_R	st	%f20, [%r11, %r6]
	.word 0xee71ead8  ! 139: STX_I	stx	%r23, [%r7 + 0x0ad8]
thr2_resum_intr_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xfe71e688  ! 140: STX_I	stx	%r31, [%r7 + 0x0688]
thr2_irf_ce_9:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_9), 16, 16), 1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xf04a2c46  ! 140: LDSB_I	ldsb	[%r8 + 0x0c46], %r24
	.word 0xe629ac4e  ! 142: STB_I	stb	%r19, [%r6 + 0x0c4e]
thr2_resum_intr_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xac11cb6b  ! 143: OR_R	or 	%r7, %r11, %r22
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfe2164b9  ! 145: STW_I	stw	%r31, [%r5 + 0x04b9]
	.word 0xe822000b  ! 147: STW_R	stw	%r20, [%r8 + %r11]
	.word 0xec31000e  ! 147: STH_R	sth	%r22, [%r4 + %r14]
	.word 0xee722858  ! 147: STX_I	stx	%r23, [%r8 + 0x0858]
	.word 0xfc20e990  ! 147: STW_I	stw	%r30, [%r3 + 0x0990]
	.word 0xfa31efa2  ! 147: STH_I	sth	%r29, [%r7 + 0x0fa2]
	.word 0xfa2a000f  ! 147: STB_R	stb	%r29, [%r8 + %r15]
	.word 0xf0296db4  ! 147: STB_I	stb	%r24, [%r5 + 0x0db4]
	.word 0xf232000d  ! 148: STH_R	sth	%r25, [%r8 + %r13]
thr2_resum_intr_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0xe4aa100b  ! 148: STBA_R	stba	%r18, [%r8 + %r11] 0x80
	.word 0xf339400e  ! 149: STDF_R	std	%f25, [%r14, %r5]
	.word 0xee70e3b0  ! 151: STX_I	stx	%r23, [%r3 + 0x03b0]
	.word 0xe272000f  ! 151: STX_R	stx	%r17, [%r8 + %r15]
	.word 0xf471000c  ! 151: STX_R	stx	%r26, [%r4 + %r12]
	.word 0xfc222ad4  ! 151: STW_I	stw	%r30, [%r8 + 0x0ad4]
	.word 0xe42121b4  ! 151: STW_I	stw	%r18, [%r4 + 0x01b4]
	.word 0xea21e1d4  ! 151: STW_I	stw	%r21, [%r7 + 0x01d4]
	.word 0xe6716988  ! 151: STX_I	stx	%r19, [%r5 + 0x0988]
	.word 0xf0b9900b  ! 151: STDA_R	stda	%r24, [%r6 + %r11] 0x80
	.word 0xf011e66e  ! 152: LDUH_I	lduh	[%r7 + 0x066e], %r24
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xec71000d  ! 156: STX_R	stx	%r22, [%r4 + %r13]
	.word 0xf831400b  ! 156: STH_R	sth	%r28, [%r5 + %r11]
	.word 0xfc292616  ! 156: STB_I	stb	%r30, [%r4 + 0x0616]
	.word 0xe829400e  ! 156: STB_R	stb	%r20, [%r5 + %r14]
	.word 0xfe71c00e  ! 156: STX_R	stx	%r31, [%r7 + %r14]
!Generating an illinst
	.word 0xb7396f21  ! 157: SRA_I	sra 	%r5, 0x0001, %r27
	.word 0xfa70e497  ! 158: STX_I	stx	%r29, [%r3 + 0x0497]
	.word 0xae192bd6  ! 160: XOR_I	xor 	%r4, 0x0bd6, %r23
	.word 0xb839000c  ! 160: XNOR_R	xnor 	%r4, %r12, %r28
	.word 0xaf3a2001  ! 160: SRA_I	sra 	%r8, 0x0001, %r23
	.word 0xa531c00f  ! 160: SRL_R	srl 	%r7, %r15, %r18
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe229400b  ! 161: STB_R	stb	%r17, [%r5 + %r11]
	.word 0xff396fe8  ! 162: STDF_I	std	%f31, [0x0fe8, %r5]
	.word 0xe62967cc  ! 164: STB_I	stb	%r19, [%r5 + 0x07cc]
	.word 0xec2a000f  ! 164: STB_R	stb	%r22, [%r8 + %r15]
	.word 0xe43161f4  ! 164: STH_I	sth	%r18, [%r5 + 0x01f4]
	.word 0xec29000e  ! 164: STB_R	stb	%r22, [%r4 + %r14]
	.word 0xe229e2a5  ! 164: STB_I	stb	%r17, [%r7 + 0x02a5]
	.word 0xfc71c00f  ! 165: STX_R	stx	%r30, [%r7 + %r15]
thr2_resum_intr_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	.word 0xfa28c00f  ! 166: STB_R	stb	%r29, [%r3 + %r15]
thr2_ic_err_10:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_10), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xfc79400f  ! 166: SWAP_R	swap	%r30, [%r5 + %r15]
	.word 0xb5782401  ! 168: MOVR_I	move	%r0, 0xfffffed8, %r26
	.word 0xb53a2001  ! 168: SRA_I	sra 	%r8, 0x0001, %r26
	.word 0xb929500c  ! 168: SLLX_R	sllx	%r5, %r12, %r28
	.word 0xea11a93a  ! 168: LDUH_I	lduh	[%r6 + 0x093a], %r21
	.word 0xfe21c00c  ! 170: STW_R	stw	%r31, [%r7 + %r12]
thr2_ic_err_11:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_11), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xa9a1c92b  ! 170: FMULs	fmuls	%f7, %f11, %f20
	.word 0xec296656  ! 172: STB_I	stb	%r22, [%r5 + 0x0656]
thr2_ic_err_12:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_12), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xf6096dd3  ! 172: LDUB_I	ldub	[%r5 + 0x0dd3], %r27
	.word 0xf6212378  ! 174: STW_I	stw	%r27, [%r4 + 0x0378]
	.word 0xfe21275c  ! 174: STW_I	stw	%r31, [%r4 + 0x075c]
	.word 0xebf1a00f  ! 174: CASXA_R	casxa	[%r6]%asi, %r15, %r21
	.word 0xec29a5d3  ! 175: STB_I	stb	%r22, [%r6 + 0x05d3]
	.word 0xb612000e  ! 177: OR_R	or 	%r8, %r14, %r27
	.word 0xac3a000e  ! 177: XNOR_R	xnor 	%r8, %r14, %r22
	.word 0xf871e228  ! 178: STX_I	stx	%r28, [%r7 + 0x0228]
	.word 0xe8722ce0  ! 178: STX_I	stx	%r20, [%r8 + 0x0ce0]
	.word 0xf022245c  ! 178: STW_I	stw	%r24, [%r8 + 0x045c]
	.word 0xf021c00e  ! 178: STW_R	stw	%r24, [%r7 + %r14]
	.word 0xf871ad90  ! 178: STX_I	stx	%r28, [%r6 + 0x0d90]
	.word 0xe631a8ee  ! 179: STH_I	sth	%r19, [%r6 + 0x08ee]
thr2_irf_ce_10:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_10), 16, 16), 1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xfa292c4d  ! 180: STB_I	stb	%r29, [%r4 + 0x0c4d]
	.word 0xf0712218  ! 180: STX_I	stx	%r24, [%r4 + 0x0218]
	.word 0xf2212b34  ! 180: STW_I	stw	%r25, [%r4 + 0x0b34]
	.word 0xe229000c  ! 180: STB_R	stb	%r17, [%r4 + %r12]
	.word 0xe6e8d00c  ! 180: LDSTUBA_R	ldstuba	%r19, [%r3 + %r12] 0x80
	.word 0xfaea100f  ! 181: LDSTUBA_R	ldstuba	%r29, [%r8 + %r15] 0x80
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xee212f7c  ! 184: STW_I	stw	%r23, [%r4 + 0x0f7c]
thr2_ic_err_13:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_13), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xa211400d  ! 185: OR_R	or 	%r5, %r13, %r17
	.word 0xb731900c  ! 185: SRLX_R	srlx	%r6, %r12, %r27
	.word 0xa4012d30  ! 185: ADD_I	add 	%r4, 0x0d30, %r18
	.word 0xbf39000d  ! 185: SRA_R	sra 	%r4, %r13, %r31
	.word 0xf812280e  ! 185: LDUH_I	lduh	[%r8 + 0x080e], %r28
	.word 0xf030c00c  ! 187: STH_R	sth	%r24, [%r3 + %r12]
thr2_irf_ce_11:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_11), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xec31400d  ! 188: STH_R	sth	%r22, [%r5 + %r13]
	.word 0xfa22000d  ! 188: STW_R	stw	%r29, [%r8 + %r13]
	.word 0xf221000f  ! 188: STW_R	stw	%r25, [%r4 + %r15]
	.word 0xf671000b  ! 188: STX_R	stx	%r27, [%r4 + %r11]
	.word 0xf671000b  ! 188: STX_R	stx	%r27, [%r4 + %r11]
	.word 0xe821685c  ! 188: STW_I	stw	%r20, [%r5 + 0x085c]
	.word 0xa3782401  ! 189: MOVR_I	move	%r0, 0xfffffed8, %r17
	.word 0xbf31b001  ! 189: SRLX_I	srlx	%r6, 0x0001, %r31
	.word 0xf820c00c  ! 190: STW_R	stw	%r28, [%r3 + %r12]
thr2_irf_ce_12:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_12), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe831e12c  ! 191: STH_I	sth	%r20, [%r7 + 0x012c]
thr2_ic_err_14:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,10,32)
	.word 0x81d9000c  ! 191: FLUSH_R	dis not found

	.word 0xee21e5b4  ! 193: STW_I	stw	%r23, [%r7 + 0x05b4]
thr2_irf_ce_13:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_13), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe231a87f  ! 193: STH_I	sth	%r17, [%r6 + 0x087f]
	.word 0xf921000d  ! 194: STF_R	st	%f28, [%r13, %r4]
	.word 0xfef9500e  ! 195: SWAPA_R	swapa	%r31, [%r5 + %r14] 0x80
	.word 0xec70e483  ! 196: STX_I	stx	%r22, [%r3 + 0x0483]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf6212dd0  ! 199: STW_I	stw	%r27, [%r4 + 0x0dd0]
	.word 0xfc716850  ! 200: STX_I	stx	%r30, [%r5 + 0x0850]
	.word 0xfa296370  ! 200: STB_I	stb	%r29, [%r5 + 0x0370]
	.word 0xf629800b  ! 200: STB_R	stb	%r27, [%r6 + %r11]
	.word 0xf421800e  ! 200: STW_R	stw	%r26, [%r6 + %r14]
	.word 0xf872000e  ! 200: STX_R	stx	%r28, [%r8 + %r14]
	.word 0xf629800f  ! 201: STB_R	stb	%r27, [%r6 + %r15]
	.word 0xfa70c00e  ! 201: STX_R	stx	%r29, [%r3 + %r14]
	.word 0xf822000d  ! 201: STW_R	stw	%r28, [%r8 + %r13]
	.word 0xe828c00d  ! 201: STB_R	stb	%r20, [%r3 + %r13]
	.word 0xf828c00c  ! 201: STB_R	stb	%r28, [%r3 + %r12]
	.word 0xee71eff8  ! 201: STX_I	stx	%r23, [%r7 + 0x0ff8]
	.word 0xecfa100e  ! 201: SWAPA_R	swapa	%r22, [%r8 + %r14] 0x80
	.word 0xe921400f  ! 202: STF_R	st	%f20, [%r15, %r5]
	.word 0xe4722510  ! 204: STX_I	stx	%r18, [%r8 + 0x0510]
thr2_ic_err_15:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_15), 16, 16),1,IC_DATA,NIR,x,11)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf321c00c  ! 205: STF_R	st	%f25, [%r12, %r7]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf9f1e00c  ! 207: CASXA_R	casxa	[%r7]%asi, %r12, %r28
	.word 0xfc21c00f  ! 208: STW_R	stw	%r30, [%r7 + %r15]
	.word 0xfe40e2e0  ! 209: LDSW_I	ldsw	[%r3 + 0x02e0], %r31
	.word 0xe4e929d4  ! 210: LDSTUBA_I	ldstuba	%r18, [%r4 + 0x09d4] %asi
	.word 0xfe29800c  ! 212: STB_R	stb	%r31, [%r6 + %r12]
thr2_ic_err_16:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,17,24)
	.word 0xf431800e  ! 212: STH_R	sth	%r26, [%r6 + %r14]
	.word 0xa9a1482d  ! 213: FADDs	fadds	%f5, %f13, %f20
	.word 0xf42a2f3d  ! 215: STB_I	stb	%r26, [%r8 + 0x0f3d]
thr2_irf_ce_14:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_14), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe8b8e9a0  ! 215: STDA_I	stda	%r20, [%r3 + 0x09a0] %asi
	.word 0xfe72000e  ! 216: STX_R	stx	%r31, [%r8 + %r14]
	.word 0xfc30ed1e  ! 218: STH_I	sth	%r30, [%r3 + 0x0d1e]
	.word 0xfc29e282  ! 218: STB_I	stb	%r30, [%r7 + 0x0282]
	.word 0xf02120e4  ! 218: STW_I	stw	%r24, [%r4 + 0x00e4]
	.word 0xf2aa100f  ! 218: STBA_R	stba	%r25, [%r8 + %r15] 0x80
	.word 0xf229000e  ! 220: STB_R	stb	%r25, [%r4 + %r14]
thr2_ic_err_17:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,29,6)
	.word 0xe221000d  ! 220: STW_R	stw	%r17, [%r4 + %r13]
	.word 0xf670c00b  ! 222: STX_R	stx	%r27, [%r3 + %r11]
	.word 0xea29400e  ! 223: STB_R	stb	%r21, [%r5 + %r14]
!Generating an illinst
	.word 0xbf30db2f  ! 224: SRLX_R	srlx	%r3, %r15, %r31
	.word 0xf8f9e878  ! 225: SWAPA_I	swapa	%r28, [%r7 + 0x0878] %asi
	.word 0xf5e2100d  ! 226: CASA_I	casa	[%r8] 0x80, %r13, %r26
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe62125b4  ! 229: STW_I	stw	%r19, [%r4 + 0x05b4]
thr2_irf_ce_15:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_15), 16, 16), 1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xb938e001  ! 230: SRA_I	sra 	%r3, 0x0001, %r28
	.word 0xa2122956  ! 230: OR_I	or 	%r8, 0x0956, %r17
	.word 0xf5e1900e  ! 230: CASA_I	casa	[%r6] 0x80, %r14, %r26
	.word 0xc0f009a0  ! 232: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf4196748  ! 233: LDD_I	ldd	[%r5 + 0x0748], %r26
	.word 0xf230e201  ! 234: STH_I	sth	%r25, [%r3 + 0x0201]
	.word 0xea21e1e8  ! 236: STW_I	stw	%r21, [%r7 + 0x01e8]
thr2_irf_ce_16:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_16), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe431eafc  ! 237: STH_I	sth	%r18, [%r7 + 0x0afc]
thr2_resum_intr_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	.word 0xeca9500c  ! 237: STBA_R	stba	%r22, [%r5 + %r12] 0x80
	.word 0xea31400b  ! 239: STH_R	sth	%r21, [%r5 + %r11]
	.word 0xf4316fc4  ! 239: STH_I	sth	%r26, [%r5 + 0x0fc4]
	.word 0xee71400e  ! 239: STX_R	stx	%r23, [%r5 + %r14]
	.word 0xea30c00c  ! 239: STH_R	sth	%r21, [%r3 + %r12]
	.word 0xf821aa58  ! 240: STW_I	stw	%r28, [%r6 + 0x0a58]
thr2_ic_err_18:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_18), 16, 16),1,IC_DATA,IR,4,x)
!Generating an illinst
	.word 0xb439bf4c  ! 241: XNOR_I	xnor 	%r6, 0xffffff4c, %r26
	.word 0xf2b1100d  ! 242: STHA_R	stha	%r25, [%r4 + %r13] 0x80
	.word 0xf620ebdc  ! 244: STW_I	stw	%r27, [%r3 + 0x0bdc]
thr2_irf_ce_17:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_17), 16, 16), 1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xf471400d  ! 245: STX_R	stx	%r26, [%r5 + %r13]
thr2_ic_err_19:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_19), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xee31a23a  ! 246: STH_I	sth	%r23, [%r6 + 0x023a]
thr2_resum_intr_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0xf431400e  ! 246: STH_R	sth	%r26, [%r5 + %r14]
	.word 0xf029c00b  ! 248: STB_R	stb	%r24, [%r7 + %r11]
	.word 0xf031c00e  ! 248: STH_R	sth	%r24, [%r7 + %r14]
	.word 0xf03221d8  ! 248: STH_I	sth	%r24, [%r8 + 0x01d8]
	.word 0xec2a000d  ! 248: STB_R	stb	%r22, [%r8 + %r13]
	.word 0xe620c00f  ! 248: STW_R	stw	%r19, [%r3 + %r15]
	.word 0xfc71e030  ! 249: STX_I	stx	%r30, [%r7 + 0x0030]
thr2_irf_ce_18:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_18), 16, 16), 1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xfa31aa70  ! 250: STH_I	sth	%r29, [%r6 + 0x0a70]
	.word 0xfa31a6ba  ! 250: STH_I	sth	%r29, [%r6 + 0x06ba]
	.word 0xfe29000d  ! 250: STB_R	stb	%r31, [%r4 + %r13]
	.word 0xb138e001  ! 251: SRA_I	sra 	%r3, 0x0001, %r24
	.word 0xe4416374  ! 251: LDSW_I	ldsw	[%r5 + 0x0374], %r18
	.word 0xfaf1900f  ! 252: STXA_R	stxa	%r29, [%r6 + %r15] 0x80
	.word 0xea722128  ! 254: STX_I	stx	%r21, [%r8 + 0x0128]
thr2_ic_err_20:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,18,14)
	.word 0x81d9800d  ! 254: FLUSH_R	dis not found

	.word 0xf521c00d  ! 255: STF_R	st	%f26, [%r13, %r7]
	.word 0xeaa1100c  ! 256: STWA_R	stwa	%r21, [%r4 + %r12] 0x80
	.word 0xf6292bb3  ! 258: STB_I	stb	%r27, [%r4 + 0x0bb3]
thr2_irf_ce_19:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_19), 16, 16), 1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xc3e96564  ! 258: PREFETCHA_I	prefetcha	[%r5, + 0x0564] %asi, #one_read
	.word 0xfa3120a3  ! 259: STH_I	sth	%r29, [%r4 + 0x00a3]
	.word 0xe431a4be  ! 261: STH_I	sth	%r18, [%r6 + 0x04be]
thr2_irf_ce_20:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_20), 16, 16), 1,IRF,ce,35,x, x,x,x, x,x,x)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc0f00960  ! 263: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe271400e  ! 265: STX_R	stx	%r17, [%r5 + %r14]
thr2_ic_err_21:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_21), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xfc312516  ! 266: STH_I	sth	%r30, [%r4 + 0x0516]
	.word 0xe621800d  ! 266: STW_R	stw	%r19, [%r6 + %r13]
	.word 0xfe21ae48  ! 266: STW_I	stw	%r31, [%r6 + 0x0e48]
	.word 0xc0f00960  ! 267: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf031400c  ! 269: STH_R	sth	%r24, [%r5 + %r12]
thr2_resum_intr_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
	.word 0xe4f2100b  ! 269: STXA_R	stxa	%r18, [%r8 + %r11] 0x80
thr2_dc_err_4:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_4), 16, 16),1,DC_DATA,55)
	.word 0xf8120009  ! 271: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xf831c00f  ! 273: STH_R	sth	%r28, [%r7 + %r15]
thr2_ic_err_22:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,12,23)
	.word 0xe421c00e  ! 274: STW_R	stw	%r18, [%r7 + %r14]
	.word 0xf631c00c  ! 274: STH_R	sth	%r27, [%r7 + %r12]
	.word 0xf0292377  ! 274: STB_I	stb	%r24, [%r4 + 0x0377]
	.word 0xfc30e3ce  ! 274: STH_I	sth	%r30, [%r3 + 0x03ce]
	.word 0xe630c00b  ! 274: STH_R	sth	%r19, [%r3 + %r11]
	.word 0xfa296d6a  ! 274: STB_I	stb	%r29, [%r5 + 0x0d6a]
	.word 0xe8b0e628  ! 274: STHA_I	stha	%r20, [%r3 + 0x0628] %asi
	.word 0xfa31800f  ! 276: STH_R	sth	%r29, [%r6 + %r15]
thr2_irf_ce_21:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_21), 16, 16), 1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xe2a8d00b  ! 276: STBA_R	stba	%r17, [%r3 + %r11] 0x80
	.word 0xf0f16b90  ! 277: STXA_I	stxa	%r24, [%r5 + 0x0b90] %asi
	.word 0xf020c00e  ! 279: STW_R	stw	%r24, [%r3 + %r14]
thr2_irf_ce_22:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_22), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xa229000f  ! 280: ANDN_R	andn 	%r4, %r15, %r17
	.word 0xb131100f  ! 280: SRLX_R	srlx	%r4, %r15, %r24
	.word 0xac29a9b6  ! 280: ANDN_I	andn 	%r6, 0x09b6, %r22
	.word 0xf8ea100d  ! 280: LDSTUBA_R	ldstuba	%r28, [%r8 + %r13] 0x80
	.word 0xf321ae94  ! 281: STF_I	st	%f25, [0x0e94, %r6]
	.word 0xbe49e324  ! 282: MULX_I	mulx 	%r7, 0x0324, %r31
	.word 0xf6316e50  ! 284: STH_I	sth	%r27, [%r5 + 0x0e50]
	.word 0xf62a000e  ! 284: STB_R	stb	%r27, [%r8 + %r14]
	.word 0xeb21800b  ! 284: STF_R	st	%f21, [%r11, %r6]
	.word 0xf939000b  ! 285: STDF_R	std	%f28, [%r11, %r4]
	.word 0xe420c00f  ! 287: STW_R	stw	%r18, [%r3 + %r15]
	.word 0xee216bb8  ! 287: STW_I	stw	%r23, [%r5 + 0x0bb8]
	.word 0xfa3163e0  ! 287: STH_I	sth	%r29, [%r5 + 0x03e0]
	.word 0xfa72000d  ! 287: STX_R	stx	%r29, [%r8 + %r13]
	.word 0xea31800c  ! 287: STH_R	sth	%r21, [%r6 + %r12]
	.word 0xe42a20a1  ! 287: STB_I	stb	%r18, [%r8 + 0x00a1]
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xf22923da  ! 289: STB_I	stb	%r25, [%r4 + 0x03da]
thr2_resum_intr_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_20), 16, 16)) -> intp(1, 3, 1)
	.word 0xede1900b  ! 289: CASA_I	casa	[%r6] 0x80, %r11, %r22
	.word 0xf05220b6  ! 290: LDSH_I	ldsh	[%r8 + 0x00b6], %r24
	.word 0xf829aac1  ! 291: STB_I	stb	%r28, [%r6 + 0x0ac1]
	.word 0xb0392771  ! 293: XNOR_I	xnor 	%r4, 0x0771, %r24
	.word 0xb538f001  ! 293: SRAX_I	srax	%r3, 0x0001, %r26
	.word 0xa219e391  ! 293: XOR_I	xor 	%r7, 0x0391, %r17
	.word 0xe8722470  ! 294: STX_I	stx	%r20, [%r8 + 0x0470]
thr2_ic_err_23:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_23), 16, 16),1,IC_DATA,NIR,x,13)
	.word 0xe4112812  ! 294: LDUH_I	lduh	[%r4 + 0x0812], %r18
	.word 0xf139c00b  ! 295: STDF_R	std	%f24, [%r11, %r7]
	.word 0xe629800e  ! 297: STB_R	stb	%r19, [%r6 + %r14]
	.word 0xfc2227e4  ! 297: STW_I	stw	%r30, [%r8 + 0x07e4]
	.word 0xe422202c  ! 297: STW_I	stw	%r18, [%r8 + 0x002c]
	.word 0xf121a678  ! 297: STF_I	st	%f24, [0x0678, %r6]
	.word 0xe739000e  ! 298: STDF_R	std	%f19, [%r14, %r4]
	.word 0xea70c00d  ! 300: STX_R	stx	%r21, [%r3 + %r13]
thr2_ic_err_24:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_24), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xc4f00c00  ! 301: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe3392938  ! 302: STDF_I	std	%f17, [0x0938, %r4]
	.word 0xf4aa100f  ! 303: STBA_R	stba	%r26, [%r8 + %r15] 0x80
	.word 0xe8316fbc  ! 305: STH_I	sth	%r20, [%r5 + 0x0fbc]
	.word 0xf6f1a6f0  ! 305: STXA_I	stxa	%r27, [%r6 + 0x06f0] %asi
	.word 0xf268c00d  ! 306: LDSTUB_R	ldstub	%r25, [%r3 + %r13]
	.word 0xfe716988  ! 308: STX_I	stx	%r31, [%r5 + 0x0988]
thr2_resum_intr_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_21), 16, 16)) -> intp(1, 3, 1)
	.word 0xe3f1a00c  ! 308: CASXA_R	casxa	[%r6]%asi, %r12, %r17
	.word 0xe6322d56  ! 310: STH_I	sth	%r19, [%r8 + 0x0d56]
	.word 0xf031800b  ! 310: STH_R	sth	%r24, [%r6 + %r11]
	.word 0xf029000d  ! 310: STB_R	stb	%r24, [%r4 + %r13]
	.word 0xee21afbc  ! 310: STW_I	stw	%r23, [%r6 + 0x0fbc]
	.word 0xfc31ebf6  ! 310: STH_I	sth	%r30, [%r7 + 0x0bf6]
	.word 0xf270e908  ! 310: STX_I	stx	%r25, [%r3 + 0x0908]
	.word 0xea21800f  ! 311: STW_R	stw	%r21, [%r6 + %r15]
thr2_irf_ce_23:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_23), 16, 16), 1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0x8143e071  ! 311: MEMBAR	membar	#LoadLoad | #Lookaside | #MemIssue | #Sync 
	.word 0xfa71e829  ! 312: STX_I	stx	%r29, [%r7 + 0x0829]
	.word 0x81d9c00d  ! 313: FLUSH_R	dis not found

	.word 0xe620e440  ! 315: STW_I	stw	%r19, [%r3 + 0x0440]
	.word 0xfe2a2470  ! 315: STB_I	stb	%r31, [%r8 + 0x0470]
	.word 0xf220c00c  ! 315: STW_R	stw	%r25, [%r3 + %r12]
	.word 0xfc21e0ac  ! 315: STW_I	stw	%r30, [%r7 + 0x00ac]
	.word 0xe4722b58  ! 315: STX_I	stx	%r18, [%r8 + 0x0b58]
	.word 0xf8296140  ! 315: STB_I	stb	%r28, [%r5 + 0x0140]
	.word 0xee21000e  ! 316: STW_R	stw	%r23, [%r4 + %r14]
thr2_resum_intr_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_22), 16, 16)) -> intp(1, 3, 1)
	.word 0xef396be0  ! 316: STDF_I	std	%f23, [0x0be0, %r5]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf429400b  ! 319: STB_R	stb	%r26, [%r5 + %r11]
thr2_irf_ce_24:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_24), 16, 16), 1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe229000f  ! 320: STB_R	stb	%r17, [%r4 + %r15]
thr2_resum_intr_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_23), 16, 16)) -> intp(1, 3, 1)
	.word 0xe920e54c  ! 320: STF_I	st	%f20, [0x054c, %r3]
	.word 0xf229000c  ! 322: STB_R	stb	%r25, [%r4 + %r12]
thr2_irf_ce_25:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_25), 16, 16), 1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xb61920b6  ! 323: XOR_I	xor 	%r4, 0x00b6, %r27
	.word 0xb739900d  ! 323: SRAX_R	srax	%r6, %r13, %r27
	.word 0xbe19e1f1  ! 323: XOR_I	xor 	%r7, 0x01f1, %r31
	.word 0xb628c00c  ! 323: ANDN_R	andn 	%r3, %r12, %r27
	.word 0xf2722a08  ! 324: STX_I	stx	%r25, [%r8 + 0x0a08]
thr2_resum_intr_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_24), 16, 16)) -> intp(1, 3, 1)
	.word 0xe520c00b  ! 324: STF_R	st	%f18, [%r11, %r3]
	.word 0xe221a190  ! 326: STW_I	stw	%r17, [%r6 + 0x0190]
thr2_resum_intr_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_25), 16, 16)) -> intp(1, 3, 1)
	.word 0xeae96341  ! 326: LDSTUBA_I	ldstuba	%r21, [%r5 + 0x0341] %asi
	.word 0xfa71000e  ! 328: STX_R	stx	%r29, [%r4 + %r14]
thr2_irf_ce_26:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_26), 16, 16), 1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xf0322674  ! 329: STH_I	sth	%r24, [%r8 + 0x0674]
thr2_ic_err_25:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,4,2)
	.word 0xf241e844  ! 329: LDSW_I	ldsw	[%r7 + 0x0844], %r25
	.word 0xea29400d  ! 331: STB_R	stb	%r21, [%r5 + %r13]
	.word 0xee216f2c  ! 332: STW_I	stw	%r23, [%r5 + 0x0f2c]
thr2_irf_ce_27:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_27), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xeaa16d34  ! 332: STWA_I	stwa	%r21, [%r5 + 0x0d34] %asi
	.word 0xc4f00c00  ! 334: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf2312026  ! 336: STH_I	sth	%r25, [%r4 + 0x0026]
	.word 0xee28c00f  ! 336: STB_R	stb	%r23, [%r3 + %r15]
	.word 0xe830e22e  ! 336: STH_I	sth	%r20, [%r3 + 0x022e]
	.word 0xfc29800c  ! 336: STB_R	stb	%r30, [%r6 + %r12]
	.word 0xf471ea48  ! 336: STX_I	stx	%r26, [%r7 + 0x0a48]
	.word 0xb231800f  ! 337: ORN_R	orn 	%r6, %r15, %r25
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xea322f9b  ! 338: STH_I	sth	%r21, [%r8 + 0x0f9b]
	.word 0xf071c00b  ! 340: STX_R	stx	%r24, [%r7 + %r11]
	.word 0xf071c00d  ! 340: STX_R	stx	%r24, [%r7 + %r13]
	.word 0xfa30c00d  ! 340: STH_R	sth	%r29, [%r3 + %r13]
	.word 0xf43167cd  ! 340: STH_I	sth	%r26, [%r5 + 0x07cd]
	.word 0xec7a2690  ! 341: SWAP_I	swap	%r22, [%r8 + 0x0690]
	.word 0xee11ae74  ! 342: LDUH_I	lduh	[%r6 + 0x0e74], %r23
	.word 0xf4b9500b  ! 343: STDA_R	stda	%r26, [%r5 + %r11] 0x80
	.word 0xac5a000d  ! 344: SMUL_R	smul 	%r8, %r13, %r22
	.word 0xe229c00b  ! 346: STB_R	stb	%r17, [%r7 + %r11]
thr2_ic_err_26:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_26), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xec49a992  ! 346: LDSB_I	ldsb	[%r6 + 0x0992], %r22
	.word 0xfc4969a7  ! 347: LDSB_I	ldsb	[%r5 + 0x09a7], %r30
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xeb396358  ! 349: STDF_I	std	%f21, [0x0358, %r5]
	.word 0xf6a0e8e4  ! 350: STWA_I	stwa	%r27, [%r3 + 0x08e4] %asi
	.word 0xe431c00e  ! 352: STH_R	sth	%r18, [%r7 + %r14]
	.word 0xf629a988  ! 352: STB_I	stb	%r27, [%r6 + 0x0988]
	.word 0xf221c00e  ! 352: STW_R	stw	%r25, [%r7 + %r14]
	.word 0xe629e415  ! 352: STB_I	stb	%r19, [%r7 + 0x0415]
	.word 0xf071af08  ! 352: STX_I	stx	%r24, [%r6 + 0x0f08]
	.word 0xa259e289  ! 352: SMUL_I	smul 	%r7, 0x0289, %r17
	.word 0xfb3a21f0  ! 353: STDF_I	std	%f29, [0x01f0, %r8]
	.word 0xea28e14f  ! 355: STB_I	stb	%r21, [%r3 + 0x014f]
thr2_ic_err_27:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_27), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xec30ee34  ! 356: STH_I	sth	%r22, [%r3 + 0x0e34]
thr2_resum_intr_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_26), 16, 16)) -> intp(1, 3, 1)
	.word 0xf2a92576  ! 356: STBA_I	stba	%r25, [%r4 + 0x0576] %asi
	.word 0xf470eb38  ! 358: STX_I	stx	%r26, [%r3 + 0x0b38]
thr2_resum_intr_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_27), 16, 16)) -> intp(1, 3, 1)
	.word 0xe8322f98  ! 359: STH_I	sth	%r20, [%r8 + 0x0f98]
thr2_irf_ce_28:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_28), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf019abf0  ! 360: LDD_I	ldd	[%r6 + 0x0bf0], %r24
	.word 0xea31639a  ! 362: STH_I	sth	%r21, [%r5 + 0x039a]
thr2_resum_intr_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_28), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 363: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xec51e3ae  ! 364: LDSH_I	ldsh	[%r7 + 0x03ae], %r22
	.word 0xea21800f  ! 366: STW_R	stw	%r21, [%r6 + %r15]
thr2_resum_intr_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_29), 16, 16)) -> intp(1, 3, 1)
	.word 0xa730e001  ! 367: SRL_I	srl 	%r3, 0x0001, %r19
	.word 0xbe09e38a  ! 367: AND_I	and 	%r7, 0x038a, %r31
	.word 0xfa31afd8  ! 368: STH_I	sth	%r29, [%r6 + 0x0fd8]
	.word 0xfe30c00f  ! 368: STH_R	sth	%r31, [%r3 + %r15]
	.word 0xee21acd4  ! 368: STW_I	stw	%r23, [%r6 + 0x0cd4]
	.word 0xf8316f6e  ! 368: STH_I	sth	%r28, [%r5 + 0x0f6e]
	.word 0xec5169a8  ! 368: LDSH_I	ldsh	[%r5 + 0x09a8], %r22
	.word 0xfc2a2481  ! 370: STB_I	stb	%r30, [%r8 + 0x0481]
thr2_ic_err_28:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_28), 16, 16),1,IC_DATA,IR_NIR,11,4)
	.word 0xfc21c00b  ! 371: STW_R	stw	%r30, [%r7 + %r11]
thr2_resum_intr_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_30), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 372: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfc722038  ! 374: STX_I	stx	%r30, [%r8 + 0x0038]
thr2_ic_err_29:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_29), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xf8712f28  ! 375: STX_I	stx	%r28, [%r4 + 0x0f28]
	.word 0xfa31e8ce  ! 375: STH_I	sth	%r29, [%r7 + 0x08ce]
	.word 0xea722c60  ! 375: STX_I	stx	%r21, [%r8 + 0x0c60]
	.word 0xf469000f  ! 375: LDSTUB_R	ldstub	%r26, [%r4 + %r15]
	.word 0xf071ec60  ! 377: STX_I	stx	%r24, [%r7 + 0x0c60]
thr2_ic_err_30:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_30), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xf5f1900b  ! 377: CASXA_I	casxa	[%r6] 0x80, %r11, %r26
	.word 0xe2f9900d  ! 378: SWAPA_R	swapa	%r17, [%r6 + %r13] 0x80
	.word 0xf4b9d00d  ! 379: STDA_R	stda	%r26, [%r7 + %r13] 0x80
!Generating an illinst
	.word 0xad298d2b  ! 381: SLL_R	sll 	%r6, %r11, %r22
	.word 0xf05121d8  ! 382: LDSH_I	ldsh	[%r4 + 0x01d8], %r24
	.word 0xf068c00c  ! 383: LDSTUB_R	ldstub	%r24, [%r3 + %r12]
	.word 0xf431ae6c  ! 385: STH_I	sth	%r26, [%r6 + 0x0e6c]
	.word 0xfa71e738  ! 385: STX_I	stx	%r29, [%r7 + 0x0738]
	.word 0xe2216930  ! 385: STW_I	stw	%r17, [%r5 + 0x0930]
	.word 0xec492540  ! 385: LDSB_I	ldsb	[%r4 + 0x0540], %r22
	.word 0xe229400d  ! 387: STB_R	stb	%r17, [%r5 + %r13]
thr2_resum_intr_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_31), 16, 16)) -> intp(1, 3, 1)
	.word 0xe2f96f78  ! 387: SWAPA_I	swapa	%r17, [%r5 + 0x0f78] %asi
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0xbc0a000c  ! 390: AND_R	and 	%r8, %r12, %r30
	.word 0xb0112e18  ! 390: OR_I	or 	%r4, 0x0e18, %r24
	.word 0xad782401  ! 390: MOVR_I	move	%r0, 0xfffffed8, %r22
	.word 0xa428c00c  ! 390: ANDN_R	andn 	%r3, %r12, %r18
	.word 0xec2922ae  ! 391: STB_I	stb	%r22, [%r4 + 0x02ae]
thr2_ic_err_31:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_31), 16, 16),1,IC_DATA,IR_NIR,24,30)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xc4f00980  ! 393: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xffe1a00c  ! 394: CASA_R	casa	[%r6] %asi, %r12, %r31
	.word 0xec29800c  ! 396: STB_R	stb	%r22, [%r6 + %r12]
	.word 0xf220c00b  ! 396: STW_R	stw	%r25, [%r3 + %r11]
	.word 0xfe2a000c  ! 396: STB_R	stb	%r31, [%r8 + %r12]
	.word 0xf671000e  ! 397: STX_R	stx	%r27, [%r4 + %r14]
	.word 0xf6222c54  ! 397: STW_I	stw	%r27, [%r8 + 0x0c54]
	.word 0xac0a220a  ! 398: AND_I	and 	%r8, 0x020a, %r22
	.word 0xfbf1d00c  ! 398: CASXA_I	casxa	[%r7] 0x80, %r12, %r29
	.word 0xec72000e  ! 399: STX_R	stx	%r22, [%r8 + %r14]
	.word 0xe632000d  ! 401: STH_R	sth	%r19, [%r8 + %r13]
thr2_resum_intr_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_32), 16, 16)) -> intp(1, 3, 1)
	.word 0xe20a2a90  ! 401: LDUB_I	ldub	[%r8 + 0x0a90], %r17
	.word 0xad31000b  ! 403: SRL_R	srl 	%r4, %r11, %r22
	.word 0xff222b38  ! 403: STF_I	st	%f31, [0x0b38, %r8]
	.word 0xef38c00f  ! 404: STDF_R	std	%f23, [%r15, %r3]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf831eb78  ! 408: STH_I	sth	%r28, [%r7 + 0x0b78]
	.word 0xee316e74  ! 408: STH_I	sth	%r23, [%r5 + 0x0e74]
	.word 0xf471a310  ! 409: STX_I	stx	%r26, [%r6 + 0x0310]
	.word 0xe6716018  ! 409: STX_I	stx	%r19, [%r5 + 0x0018]
	.word 0xf629800b  ! 410: STB_R	stb	%r27, [%r6 + %r11]
	.word 0xfe28e2de  ! 410: STB_I	stb	%r31, [%r3 + 0x02de]
	.word 0xf4712cd8  ! 410: STX_I	stx	%r26, [%r4 + 0x0cd8]
	.word 0xf621400f  ! 410: STW_R	stw	%r27, [%r5 + %r15]
	.word 0xf229a681  ! 410: STB_I	stb	%r25, [%r6 + 0x0681]
	.word 0xfe20c00e  ! 410: STW_R	stw	%r31, [%r3 + %r14]
thr2_dc_err_5:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_5), 16, 16),1,DC_DATA,54)
	.word 0xfa4a0009  ! 411: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xfa32000f  ! 412: STH_R	sth	%r29, [%r8 + %r15]
	.word 0xb009e5f8  ! 414: AND_I	and 	%r7, 0x05f8, %r24
	.word 0xfd39400d  ! 414: STDF_R	std	%f30, [%r13, %r5]
	.word 0xf0b9100e  ! 415: STDA_R	stda	%r24, [%r4 + %r14] 0x80
	.word 0xf620e4c8  ! 417: STW_I	stw	%r27, [%r3 + 0x04c8]
thr2_irf_ce_29:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_29), 16, 16), 1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xf432000b  ! 418: STH_R	sth	%r26, [%r8 + %r11]
	.word 0xe621400f  ! 418: STW_R	stw	%r19, [%r5 + %r15]
	.word 0xec21e33c  ! 418: STW_I	stw	%r22, [%r7 + 0x033c]
	.word 0xe621a6af  ! 418: STW_I	stw	%r19, [%r6 + 0x06af]
	.word 0xfc29800e  ! 420: STB_R	stb	%r30, [%r6 + %r14]
thr2_irf_ce_30:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_30), 16, 16), 1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xe42a000c  ! 420: STB_R	stb	%r18, [%r8 + %r12]
	.word 0xc369800f  ! 421: PREFETCH_R	prefetch	[%r6 + %r15], #one_read
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe830c00e  ! 424: STH_R	sth	%r20, [%r3 + %r14]
thr2_ic_err_32:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_32), 16, 16),1,IC_DATA,NIR,x,29)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf0292ee7  ! 425: STB_I	stb	%r24, [%r4 + 0x0ee7]
	.word 0xf4596f98  ! 426: LDX_I	ldx	[%r5 + 0x0f98], %r26
!Generating an illinst
	.word 0xb139192d  ! 428: SRAX_R	srax	%r4, %r13, %r24
	.word 0xf0316826  ! 430: STH_I	sth	%r24, [%r5 + 0x0826]
	.word 0xfb20edcc  ! 430: STF_I	st	%f29, [0x0dcc, %r3]
	.word 0xf321c00f  ! 431: STF_R	st	%f25, [%r15, %r7]
	.word 0xfde1100f  ! 432: CASA_I	casa	[%r4] 0x80, %r15, %r30
	.word 0xe620eab0  ! 434: STW_I	stw	%r19, [%r3 + 0x0ab0]
thr2_resum_intr_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_33), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfc29000f  ! 436: STB_R	stb	%r30, [%r4 + %r15]
thr2_ic_err_33:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_33), 16, 16),1,IC_DATA,IR,33,x)
	.word 0x81d9800e  ! 436: FLUSH_R	dis not found

	.word 0xfa216504  ! 438: STW_I	stw	%r29, [%r5 + 0x0504]
thr2_ic_err_34:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_34), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xf821400d  ! 439: STW_R	stw	%r28, [%r5 + %r13]
	.word 0xf631217e  ! 439: STH_I	sth	%r27, [%r4 + 0x017e]
	.word 0xe431800d  ! 439: STH_R	sth	%r18, [%r6 + %r13]
	.word 0xb611652a  ! 440: OR_I	or 	%r5, 0x052a, %r27
	.word 0xad31100b  ! 440: SRLX_R	srlx	%r4, %r11, %r22
	.word 0xa3316001  ! 440: SRL_I	srl 	%r5, 0x0001, %r17
	.word 0xb72a100e  ! 440: SLLX_R	sllx	%r8, %r14, %r27
	.word 0xf4a9ec2b  ! 440: STBA_I	stba	%r26, [%r7 + 0x0c2b] %asi
thr2_dc_err_6:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_6), 16, 16),1,DC_DATA,60)
	.word 0xf0418009  ! 442: LDSW_R	ldsw	[%r6 + %r9], %r24
	.word 0xf021aee9  ! 443: STW_I	stw	%r24, [%r6 + 0x0ee9]
	.word 0xfe69000c  ! 444: LDSTUB_R	ldstub	%r31, [%r4 + %r12]
	.word 0xa652000f  ! 445: UMUL_R	umul 	%r8, %r15, %r19
	.word 0xe429c00e  ! 447: STB_R	stb	%r18, [%r7 + %r14]
thr2_irf_ce_31:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_31), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xe62a000d  ! 448: STB_R	stb	%r19, [%r8 + %r13]
	.word 0xfa32290a  ! 448: STH_I	sth	%r29, [%r8 + 0x090a]
	.word 0xe22964a3  ! 448: STB_I	stb	%r17, [%r5 + 0x04a3]
	.word 0xf271e368  ! 448: STX_I	stx	%r25, [%r7 + 0x0368]
	.word 0xa3782401  ! 449: MOVR_I	move	%r0, 0xfffffed8, %r17
	.word 0xa829400f  ! 449: ANDN_R	andn 	%r5, %r15, %r20
	.word 0xa609400d  ! 449: AND_R	and 	%r5, %r13, %r19
	.word 0xaa096202  ! 449: AND_I	and 	%r5, 0x0202, %r21
	.word 0xfcb0d00d  ! 449: STHA_R	stha	%r30, [%r3 + %r13] 0x80
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xfc31a3e8  ! 452: STH_I	sth	%r30, [%r6 + 0x03e8]
	.word 0xf82a2b8c  ! 452: STB_I	stb	%r28, [%r8 + 0x0b8c]
	.word 0xf6716358  ! 452: STX_I	stx	%r27, [%r5 + 0x0358]
	.word 0xed21000f  ! 452: STF_R	st	%f22, [%r15, %r4]
	.word 0xe429e2de  ! 454: STB_I	stb	%r18, [%r7 + 0x02de]
thr2_ic_err_35:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_35), 16, 16),1,IC_DATA,IR_NIR,0,16)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfcb923d8  ! 455: STDA_I	stda	%r30, [%r4 + 0x03d8] %asi
	.word 0xea21c00d  ! 457: STW_R	stw	%r21, [%r7 + %r13]
thr2_irf_ce_32:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_32), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe429000b  ! 458: STB_R	stb	%r18, [%r4 + %r11]
thr2_irf_ce_33:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_33), 16, 16), 1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc0f00960  ! 459: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xec51a570  ! 460: LDSH_I	ldsh	[%r6 + 0x0570], %r22
	.word 0x0cc00001  ! 461: BRGZ	brgz  ,nt	%0,<label_0x1>
!Generating an illinst
	.word 0xb5781f4c  ! 463: MOVR_R	movvs	%r0, %r12, %r26
	.word 0xf721000e  ! 464: STF_R	st	%f27, [%r14, %r4]
	.word 0xfc20ef90  ! 466: STW_I	stw	%r30, [%r3 + 0x0f90]
thr2_irf_ce_34:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_34), 16, 16), 1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xeaa9a33d  ! 466: STBA_I	stba	%r21, [%r6 + 0x033d] %asi
	.word 0xe4322b5a  ! 468: STH_I	sth	%r18, [%r8 + 0x0b5a]
	.word 0xea29c00f  ! 468: STB_R	stb	%r21, [%r7 + %r15]
	.word 0xfa21800e  ! 468: STW_R	stw	%r29, [%r6 + %r14]
	.word 0xc0f00960  ! 469: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfa312024  ! 471: STH_I	sth	%r29, [%r4 + 0x0024]
thr2_ic_err_36:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_36), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xbc1165f4  ! 472: OR_I	or 	%r5, 0x05f4, %r30
	.word 0xb531900b  ! 473: SRLX_R	srlx	%r6, %r11, %r26
	.word 0xfe71400e  ! 474: STX_R	stx	%r31, [%r5 + %r14]
thr2_irf_ce_35:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_35), 16, 16), 1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xf031e04e  ! 475: STH_I	sth	%r24, [%r7 + 0x004e]
	.word 0xea21ab64  ! 475: STW_I	stw	%r21, [%r6 + 0x0b64]
	.word 0xfa20c00e  ! 475: STW_R	stw	%r29, [%r3 + %r14]
	.word 0xfa70eb30  ! 475: STX_I	stx	%r29, [%r3 + 0x0b30]
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xec71aea0  ! 477: STX_I	stx	%r22, [%r6 + 0x0ea0]
thr2_ic_err_37:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_37), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xc0f009a0  ! 478: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xee29e5a7  ! 481: STB_I	stb	%r23, [%r7 + 0x05a7]
thr2_irf_ce_36:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_36), 16, 16), 1,IRF,ce,50,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xfc216a3c  ! 483: STW_I	stw	%r30, [%r5 + 0x0a3c]
thr2_irf_ce_37:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_37), 16, 16), 1,IRF,ce,68,x, x,x,x, x,x,x)
thr2_dc_err_7:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_7), 16, 16),1,DC_DATA,22)
	.word 0xf0194009  ! 484: LDD_R	ldd	[%r5 + %r9], %r24
	.word 0xe4192ee0  ! 485: LDD_I	ldd	[%r4 + 0x0ee0], %r18
	.word 0xf2b1d00f  ! 486: STHA_R	stha	%r25, [%r7 + %r15] 0x80
	.word 0xea21eba0  ! 488: STW_I	stw	%r21, [%r7 + 0x0ba0]
thr2_resum_intr_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_34), 16, 16)) -> intp(1, 3, 1)
	.word 0xf139c00f  ! 488: STDF_R	std	%f24, [%r15, %r7]
	.word 0xf0722e10  ! 490: STX_I	stx	%r24, [%r8 + 0x0e10]
thr2_ic_err_38:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_38), 16, 16),1,IC_DATA,NIR,x,14)
	.word 0xea30c00d  ! 491: STH_R	sth	%r21, [%r3 + %r13]
thr2_ic_err_39:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_39), 16, 16),1,IC_DATA,NIR,x,25)
	.word 0xf6322d2e  ! 492: STH_I	sth	%r27, [%r8 + 0x0d2e]
thr2_ic_err_40:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_40), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xc0f00960  ! 493: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_8:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_8), 16, 16),1,DC_DATA,6)
	.word 0xe6090009  ! 495: LDUB_R	ldub	[%r4 + %r9], %r19
	.word 0xee2a000e  ! 497: STB_R	stb	%r23, [%r8 + %r14]
thr2_irf_ce_38:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_38), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf8196dd8  ! 497: LDD_I	ldd	[%r5 + 0x0dd8], %r28
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0xe2da60b78815247a, %r16, %r17
	setx  0x0949c3491fa1ea4f, %r16, %r18
	setx  0xf40c175ec9c4dd53, %r16, %r19
	setx  0xa97be3fde1a3872f, %r16, %r20
	setx  0x5d0a312706c294b7, %r16, %r21
	setx  0x00a327d2d6c515d5, %r16, %r22
	setx  0x5688494ab02924d2, %r16, %r23
	setx  0x236e4dd05f519f70, %r16, %r24
	setx  0xc6738c82bf21482d, %r16, %r25
	setx  0xc47616d304774dae, %r16, %r26
	setx  0x51cfd1633952c781, %r16, %r27
	setx  0xbc27f00900025da9, %r16, %r28
	setx  0xb9dd3db408cab909, %r16, %r29
	setx  0x2ae0f1247d606865, %r16, %r30
	setx  0xbccf684c7f8e9d14, %r16, %r31
	setx  0x0000000000000d30, %r16, %r9
	setx  0x0000000000000740, %r16, %r10
	setx  0x0000000000000ac0, %r16, %r11
	setx  0x0000000000000f60, %r16, %r12
	setx  0x00000000000005e0, %r16, %r13
	setx  0x0000000000000e20, %r16, %r14
	setx  0x0000000000000620, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	setx  0xffffffffffffffff, %r16, %r2
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
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	wr  %r0, 0x80, %asi
	.word 0xe420e794  ! 0: STW_I	stw	%r18, [%r3 + 0x0794]
	.word 0x8143c000  ! 1: STBAR	stbar
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,18)
	.word 0xf0110009  ! 3: LDUH_R	lduh	[%r4 + %r9], %r24
	.word 0xe40a2efd  ! 4: LDUB_I	ldub	[%r8 + 0x0efd], %r18
	.word 0xfe49eef0  ! 5: LDSB_I	ldsb	[%r7 + 0x0ef0], %r31
	.word 0xf872000e  ! 7: STX_R	stx	%r28, [%r8 + %r14]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf221a1cc  ! 9: STW_I	stw	%r25, [%r6 + 0x01cc]
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xec29270f  ! 10: STB_I	stb	%r22, [%r4 + 0x070f]
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16), 1,IRF,ce,28,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xf3e1d00d  ! 12: CASA_I	casa	[%r7] 0x80, %r13, %r25
	.word 0xb7296001  ! 14: SLL_I	sll 	%r5, 0x0001, %r27
	.word 0xae1a000f  ! 14: XOR_R	xor 	%r8, %r15, %r23
	.word 0xba30c00d  ! 14: ORN_R	orn 	%r3, %r13, %r29
	.word 0xa729c00d  ! 14: SLL_R	sll 	%r7, %r13, %r19
	.word 0xfa31000d  ! 15: STH_R	sth	%r29, [%r4 + %r13]
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16), 1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xf4296b5b  ! 16: STB_I	stb	%r26, [%r5 + 0x0b5b]
	.word 0xb418e143  ! 17: XOR_I	xor 	%r3, 0x0143, %r26
	.word 0xa539500f  ! 17: SRAX_R	srax	%r5, %r15, %r18
	.word 0xa61a2cb7  ! 17: XOR_I	xor 	%r8, 0x0cb7, %r19
	.word 0xea49a439  ! 17: LDSB_I	ldsb	[%r6 + 0x0439], %r21
	.word 0xe4716b10  ! 19: STX_I	stx	%r18, [%r5 + 0x0b10]
thr1_irf_ce_2:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_2), 16, 16), 1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xf031ed0c  ! 20: STH_I	sth	%r24, [%r7 + 0x0d0c]
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xb649e58e  ! 20: MULX_I	mulx 	%r7, 0x058e, %r27
	.word 0xfbe0d00c  ! 21: CASA_I	casa	[%r3] 0x80, %r12, %r29
	.word 0xe9e1600e  ! 22: CASA_R	casa	[%r5] %asi, %r14, %r20
	.word 0xec21400f  ! 24: STW_R	stw	%r22, [%r5 + %r15]
thr1_ic_err_0:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xeff1e00b  ! 24: CASXA_R	casxa	[%r7]%asi, %r11, %r23
	.word 0xe822000c  ! 26: STW_R	stw	%r20, [%r8 + %r12]
thr1_ic_err_1:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,14,21)
	.word 0xf241ab18  ! 26: LDSW_I	ldsw	[%r6 + 0x0b18], %r25
	.word 0xe6322c9c  ! 28: STH_I	sth	%r19, [%r8 + 0x0c9c]
	.word 0xf271ee78  ! 28: STX_I	stx	%r25, [%r7 + 0x0e78]
	.word 0xec31c00c  ! 28: STH_R	sth	%r22, [%r7 + %r12]
	.word 0xf429606f  ! 29: STB_I	stb	%r26, [%r5 + 0x006f]
thr1_ic_err_2:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR,24,x)
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,53)
	.word 0xf0598009  ! 30: LDX_R	ldx	[%r6 + %r9], %r24
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe9f1200c  ! 32: CASXA_R	casxa	[%r4]%asi, %r12, %r20
	.word 0xae196576  ! 34: XOR_I	xor 	%r5, 0x0576, %r23
	.word 0xfe31ac8a  ! 35: STH_I	sth	%r31, [%r6 + 0x0c8a]
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf070efa8  ! 38: STX_I	stx	%r24, [%r3 + 0x0fa8]
thr1_irf_ce_3:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_3), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xfa21c00e  ! 39: STW_R	stw	%r29, [%r7 + %r14]
thr1_irf_ce_4:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_4), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe45a2d10  ! 39: LDX_I	ldx	[%r8 + 0x0d10], %r18
	.word 0xf221800e  ! 41: STW_R	stw	%r25, [%r6 + %r14]
	.word 0xe82a000e  ! 41: STB_R	stb	%r20, [%r8 + %r14]
	.word 0xfc1a2fc0  ! 41: LDD_I	ldd	[%r8 + 0x0fc0], %r30
	.word 0xe0b921d0  ! 42: STDA_I	stda	%r16, [%r4 + 0x01d0] %asi
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe27124d0  ! 45: STX_I	stx	%r17, [%r4 + 0x04d0]
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfa09a64c  ! 46: LDUB_I	ldub	[%r6 + 0x064c], %r29
	.word 0xe672000b  ! 48: STX_R	stx	%r19, [%r8 + %r11]
	.word 0xee29000e  ! 48: STB_R	stb	%r23, [%r4 + %r14]
	.word 0xee31287e  ! 48: STH_I	sth	%r23, [%r4 + 0x087e]
	.word 0xf429c00e  ! 48: STB_R	stb	%r26, [%r7 + %r14]
	.word 0xf421400f  ! 48: STW_R	stw	%r26, [%r5 + %r15]
	.word 0xe670c00b  ! 48: STX_R	stx	%r19, [%r3 + %r11]
	.word 0x32800003  ! 48: BNE	bne,a	<label_0x3>
	.word 0xf8716890  ! 50: STX_I	stx	%r28, [%r5 + 0x0890]
	.word 0xb628e253  ! 51: ANDN_I	andn 	%r3, 0x0253, %r27
	.word 0xa412000e  ! 51: OR_R	or 	%r8, %r14, %r18
	.word 0xbd2a3001  ! 51: SLLX_I	sllx	%r8, 0x0001, %r30
	.word 0xa201c00c  ! 51: ADD_R	add 	%r7, %r12, %r17
	.word 0xea2a000e  ! 52: STB_R	stb	%r21, [%r8 + %r14]
thr1_irf_ce_5:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_5), 16, 16), 1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xede1600c  ! 52: CASA_R	casa	[%r5] %asi, %r12, %r22
	.word 0xec29ad97  ! 53: STB_I	stb	%r22, [%r6 + 0x0d97]
	.word 0xe471000f  ! 55: STX_R	stx	%r18, [%r4 + %r15]
	.word 0xe2722598  ! 55: STX_I	stx	%r17, [%r8 + 0x0598]
	.word 0xea71000e  ! 55: STX_R	stx	%r21, [%r4 + %r14]
	.word 0xfe21c00c  ! 55: STW_R	stw	%r31, [%r7 + %r12]
	.word 0xf8292c1e  ! 55: STB_I	stb	%r28, [%r4 + 0x0c1e]
	.word 0xee29000f  ! 55: STB_R	stb	%r23, [%r4 + %r15]
	.word 0xf2712480  ! 55: STX_I	stx	%r25, [%r4 + 0x0480]
	.word 0xe231c00f  ! 56: STH_R	sth	%r17, [%r7 + %r15]
thr1_ic_err_3:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,IR_NIR,17,30)
	.word 0xad78040c  ! 57: MOVR_R	move	%r0, %r12, %r22
	.word 0xa931400d  ! 57: SRL_R	srl 	%r5, %r13, %r20
	.word 0xa929e001  ! 57: SLL_I	sll 	%r7, 0x0001, %r20
	.word 0xf8b22614  ! 57: STHA_I	stha	%r28, [%r8 + 0x0614] %asi
	.word 0xec31c00d  ! 59: STH_R	sth	%r22, [%r7 + %r13]
thr1_ic_err_4:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xe630c00b  ! 60: STH_R	sth	%r19, [%r3 + %r11]
	.word 0xfc28c00f  ! 60: STB_R	stb	%r30, [%r3 + %r15]
	.word 0xf621efb4  ! 60: STW_I	stw	%r27, [%r7 + 0x0fb4]
	.word 0xb1782401  ! 61: MOVR_I	move	%r0, 0xfffffed8, %r24
	.word 0xec30c00f  ! 62: STH_R	sth	%r22, [%r3 + %r15]
	.word 0xf829000c  ! 62: STB_R	stb	%r28, [%r4 + %r12]
	.word 0xec21800c  ! 63: STW_R	stw	%r22, [%r6 + %r12]
	.word 0xf629000b  ! 63: STB_R	stb	%r27, [%r4 + %r11]
	.word 0xe471c00c  ! 63: STX_R	stx	%r18, [%r7 + %r12]
	.word 0xee21644c  ! 63: STW_I	stw	%r23, [%r5 + 0x044c]
	.word 0xf870e7a8  ! 63: STX_I	stx	%r28, [%r3 + 0x07a8]
	.word 0xec71000d  ! 64: STX_R	stx	%r22, [%r4 + %r13]
	.word 0xe471000c  ! 64: STX_R	stx	%r18, [%r4 + %r12]
	.word 0xfc32000d  ! 64: STH_R	sth	%r30, [%r8 + %r13]
	.word 0xf0216058  ! 64: STW_I	stw	%r24, [%r5 + 0x0058]
	.word 0xe4b2100e  ! 64: STHA_R	stha	%r18, [%r8 + %r14] 0x80
	.word 0xfc29000b  ! 66: STB_R	stb	%r30, [%r4 + %r11]
thr1_irf_ce_6:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_6), 16, 16), 1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xee29629d  ! 67: STB_I	stb	%r23, [%r5 + 0x029d]
	.word 0xf071800b  ! 67: STX_R	stx	%r24, [%r6 + %r11]
	.word 0xf7f1600d  ! 67: CASXA_R	casxa	[%r5]%asi, %r13, %r27
	.word 0xeef9ee04  ! 68: SWAPA_I	swapa	%r23, [%r7 + 0x0e04] %asi
	.word 0xe22a2b4c  ! 70: STB_I	stb	%r17, [%r8 + 0x0b4c]
thr1_resum_intr_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0xbc71211e  ! 70: UDIV_I	udiv 	%r4, 0x011e, %r30
	.word 0x8143e030  ! 71: MEMBAR	membar	#Lookaside | #MemIssue 
	.word 0xf6312f7e  ! 73: STH_I	sth	%r27, [%r4 + 0x0f7e]
thr1_ic_err_5:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf321af7c  ! 75: STF_I	st	%f25, [0x0f7c, %r6]
	.word 0xea2961c9  ! 77: STB_I	stb	%r21, [%r5 + 0x01c9]
thr1_irf_ce_7:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_7), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xfa712078  ! 78: STX_I	stx	%r29, [%r4 + 0x0078]
	.word 0xfe71c00f  ! 78: STX_R	stx	%r31, [%r7 + %r15]
	.word 0xf020e628  ! 78: STW_I	stw	%r24, [%r3 + 0x0628]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,24)
	.word 0xee51c009  ! 80: LDSH_R	ldsh	[%r7 + %r9], %r23
	.word 0xc4f00980  ! 82: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe820ef24  ! 84: STW_I	stw	%r20, [%r3 + 0x0f24]
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,15)
	.word 0xfa190009  ! 85: LDD_R	ldd	[%r4 + %r9], %r29
	.word 0xfa29c00b  ! 87: STB_R	stb	%r29, [%r7 + %r11]
thr1_resum_intr_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xf831234f  ! 87: STH_I	sth	%r28, [%r4 + 0x034f]
	.word 0xff21800b  ! 88: STF_R	st	%f31, [%r11, %r6]
	.word 0xf831241e  ! 90: STH_I	sth	%r28, [%r4 + 0x041e]
	.word 0xe422000c  ! 90: STW_R	stw	%r18, [%r8 + %r12]
	.word 0xe538ea40  ! 90: STDF_I	std	%f18, [0x0a40, %r3]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xee59e0d0  ! 92: LDX_I	ldx	[%r7 + 0x00d0], %r23
	.word 0xf870c00d  ! 94: STX_R	stx	%r28, [%r3 + %r13]
thr1_ic_err_6:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,8,2)
	.word 0xfe2163f4  ! 95: STW_I	stw	%r31, [%r5 + 0x03f4]
	.word 0xfe312cb0  ! 95: STH_I	sth	%r31, [%r4 + 0x0cb0]
	.word 0xf431a214  ! 96: STH_I	sth	%r26, [%r6 + 0x0214]
thr1_ic_err_7:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_7), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xf42963bc  ! 97: STB_I	stb	%r26, [%r5 + 0x03bc]
thr1_ic_err_8:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_8), 16, 16),1,IC_DATA,IR_NIR,29,10)
	.word 0xf431ed7c  ! 98: STH_I	sth	%r26, [%r7 + 0x0d7c]
	.word 0xfe31400f  ! 98: STH_R	sth	%r31, [%r5 + %r15]
	.word 0xfa70ece8  ! 98: STX_I	stx	%r29, [%r3 + 0x0ce8]
	.word 0xe420e3d0  ! 99: STW_I	stw	%r18, [%r3 + 0x03d0]
thr1_resum_intr_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	.word 0xf471c00b  ! 100: STX_R	stx	%r26, [%r7 + %r11]
thr1_resum_intr_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	.word 0xf069000c  ! 100: LDSTUB_R	ldstub	%r24, [%r4 + %r12]
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe2f9900d  ! 103: SWAPA_R	swapa	%r17, [%r6 + %r13] 0x80
	.word 0xe610ea84  ! 104: LDUH_I	lduh	[%r3 + 0x0a84], %r19
	.word 0xee2224d0  ! 106: STW_I	stw	%r23, [%r8 + 0x04d0]
thr1_resum_intr_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xfc31000e  ! 107: STH_R	sth	%r30, [%r4 + %r14]
thr1_irf_ce_8:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_8), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xe209e379  ! 107: LDUB_I	ldub	[%r7 + 0x0379], %r17
	.word 0xf832000b  ! 108: STH_R	sth	%r28, [%r8 + %r11]
	.word 0xf6212434  ! 110: STW_I	stw	%r27, [%r4 + 0x0434]
thr1_resum_intr_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc4f00c00  ! 112: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfe20e434  ! 115: STW_I	stw	%r31, [%r3 + 0x0434]
	.word 0xe872000d  ! 115: STX_R	stx	%r20, [%r8 + %r13]
	.word 0xee71c00d  ! 116: STX_R	stx	%r23, [%r7 + %r13]
thr1_resum_intr_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xfa2a000d  ! 117: STB_R	stb	%r29, [%r8 + %r13]
	.word 0xf430c00b  ! 117: STH_R	sth	%r26, [%r3 + %r11]
	.word 0xec31a4a0  ! 117: STH_I	sth	%r22, [%r6 + 0x04a0]
	.word 0xec21c00f  ! 117: STW_R	stw	%r22, [%r7 + %r15]
	.word 0xf630c00e  ! 117: STH_R	sth	%r27, [%r3 + %r14]
	.word 0xf8312268  ! 117: STH_I	sth	%r28, [%r4 + 0x0268]
	.word 0xf221a6d0  ! 118: STW_I	stw	%r25, [%r6 + 0x06d0]
	.word 0xe8322bcc  ! 118: STH_I	sth	%r20, [%r8 + 0x0bcc]
	.word 0xee68e598  ! 118: LDSTUB_I	ldstub	%r23, [%r3 + 0x0598]
	.word 0xe2316b2f  ! 119: STH_I	sth	%r17, [%r5 + 0x0b2f]
	.word 0xfc71800e  ! 121: STX_R	stx	%r30, [%r6 + %r14]
thr1_ic_err_9:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_9), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xfb3a2ed0  ! 121: STDF_I	std	%f29, [0x0ed0, %r8]
	.word 0xef22000f  ! 122: STF_R	st	%f23, [%r15, %r8]
	.word 0xfcf96f00  ! 123: SWAPA_I	swapa	%r30, [%r5 + 0x0f00] %asi
	.word 0xf421c00e  ! 124: STW_R	stw	%r26, [%r7 + %r14]
	.word 0xe922000c  ! 125: STF_R	st	%f20, [%r12, %r8]
	.word 0xbb31e001  ! 127: SRL_I	srl 	%r7, 0x0001, %r29
	.word 0xb431000b  ! 127: ORN_R	orn 	%r4, %r11, %r26
	.word 0xb220c00c  ! 127: SUB_R	sub 	%r3, %r12, %r25
	.word 0xe229000c  ! 128: STB_R	stb	%r17, [%r4 + %r12]
thr1_resum_intr_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xea0a23c6  ! 128: LDUB_I	ldub	[%r8 + 0x03c6], %r21
	.word 0xf339a610  ! 129: STDF_I	std	%f25, [0x0610, %r6]
	.word 0xe4e9500e  ! 130: LDSTUBA_R	ldstuba	%r18, [%r5 + %r14] 0x80
	.word 0xec21201c  ! 132: STW_I	stw	%r22, [%r4 + 0x001c]
	.word 0xfc31248a  ! 132: STH_I	sth	%r30, [%r4 + 0x048a]
	.word 0xf2712f20  ! 132: STX_I	stx	%r25, [%r4 + 0x0f20]
	.word 0xf428c00f  ! 132: STB_R	stb	%r26, [%r3 + %r15]
	.word 0xe631aea8  ! 132: STH_I	sth	%r19, [%r6 + 0x0ea8]
	.word 0xf7212ca0  ! 132: STF_I	st	%f27, [0x0ca0, %r4]
	.word 0xf0a1900f  ! 133: STWA_R	stwa	%r24, [%r6 + %r15] 0x80
	.word 0xf828c00f  ! 135: STB_R	stb	%r28, [%r3 + %r15]
thr1_resum_intr_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 136: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe720c00e  ! 137: STF_R	st	%f19, [%r14, %r3]
	.word 0xf8716560  ! 139: STX_I	stx	%r28, [%r5 + 0x0560]
thr1_resum_intr_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xea71a670  ! 140: STX_I	stx	%r21, [%r6 + 0x0670]
thr1_irf_ce_9:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_9), 16, 16), 1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xe649e3df  ! 140: LDSB_I	ldsb	[%r7 + 0x03df], %r19
	.word 0xe2292b23  ! 142: STB_I	stb	%r17, [%r4 + 0x0b23]
thr1_resum_intr_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xa2111f4e  ! 143: OR_R	or 	%r4, %r14, %r17
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfe21660b  ! 145: STW_I	stw	%r31, [%r5 + 0x060b]
	.word 0xf821000c  ! 147: STW_R	stw	%r28, [%r4 + %r12]
	.word 0xee32000f  ! 147: STH_R	sth	%r23, [%r8 + %r15]
	.word 0xf2712d20  ! 147: STX_I	stx	%r25, [%r4 + 0x0d20]
	.word 0xf220ebcc  ! 147: STW_I	stw	%r25, [%r3 + 0x0bcc]
	.word 0xfa3160d2  ! 147: STH_I	sth	%r29, [%r5 + 0x00d2]
	.word 0xf22a000e  ! 147: STB_R	stb	%r25, [%r8 + %r14]
	.word 0xf8296d95  ! 147: STB_I	stb	%r28, [%r5 + 0x0d95]
	.word 0xe431c00f  ! 148: STH_R	sth	%r18, [%r7 + %r15]
thr1_resum_intr_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0xeca9100f  ! 148: STBA_R	stba	%r22, [%r4 + %r15] 0x80
	.word 0xfd3a000d  ! 149: STDF_R	std	%f30, [%r13, %r8]
	.word 0xf671a238  ! 151: STX_I	stx	%r27, [%r6 + 0x0238]
	.word 0xf671400d  ! 151: STX_R	stx	%r27, [%r5 + %r13]
	.word 0xee71800e  ! 151: STX_R	stx	%r23, [%r6 + %r14]
	.word 0xee212c2c  ! 151: STW_I	stw	%r23, [%r4 + 0x0c2c]
	.word 0xf621ea90  ! 151: STW_I	stw	%r27, [%r7 + 0x0a90]
	.word 0xf620e784  ! 151: STW_I	stw	%r27, [%r3 + 0x0784]
	.word 0xea71e148  ! 151: STX_I	stx	%r21, [%r7 + 0x0148]
	.word 0xe8b9d00e  ! 151: STDA_R	stda	%r20, [%r7 + %r14] 0x80
	.word 0xfc122236  ! 152: LDUH_I	lduh	[%r8 + 0x0236], %r30
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe871800e  ! 156: STX_R	stx	%r20, [%r6 + %r14]
	.word 0xfe31c00f  ! 156: STH_R	sth	%r31, [%r7 + %r15]
	.word 0xf0292680  ! 156: STB_I	stb	%r24, [%r4 + 0x0680]
	.word 0xf429000c  ! 156: STB_R	stb	%r26, [%r4 + %r12]
	.word 0xe871c00b  ! 156: STX_R	stx	%r20, [%r7 + %r11]
!Generating an illinst
	.word 0xa5392d21  ! 157: SRA_I	sra 	%r4, 0x0001, %r18
	.word 0xfa70ea8b  ! 158: STX_I	stx	%r29, [%r3 + 0x0a8b]
	.word 0xa819a21b  ! 160: XOR_I	xor 	%r6, 0x021b, %r20
	.word 0xa438c00b  ! 160: XNOR_R	xnor 	%r3, %r11, %r18
	.word 0xbf38e001  ! 160: SRA_I	sra 	%r3, 0x0001, %r31
	.word 0xbd31c00e  ! 160: SRL_R	srl 	%r7, %r14, %r30
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe229400b  ! 161: STB_R	stb	%r17, [%r5 + %r11]
	.word 0xed3960f0  ! 162: STDF_I	std	%f22, [0x00f0, %r5]
	.word 0xfe29a89d  ! 164: STB_I	stb	%r31, [%r6 + 0x089d]
	.word 0xfc29400f  ! 164: STB_R	stb	%r30, [%r5 + %r15]
	.word 0xe632240a  ! 164: STH_I	sth	%r19, [%r8 + 0x040a]
	.word 0xe429c00f  ! 164: STB_R	stb	%r18, [%r7 + %r15]
	.word 0xe429278c  ! 164: STB_I	stb	%r18, [%r4 + 0x078c]
	.word 0xfa71c00b  ! 165: STX_R	stx	%r29, [%r7 + %r11]
thr1_resum_intr_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	.word 0xf029400c  ! 166: STB_R	stb	%r24, [%r5 + %r12]
thr1_ic_err_10:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_10), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xf079400e  ! 166: SWAP_R	swap	%r24, [%r5 + %r14]
	.word 0xb7782401  ! 168: MOVR_I	move	%r0, 0xfffffed8, %r27
	.word 0xbf3a2001  ! 168: SRA_I	sra 	%r8, 0x0001, %r31
	.word 0xa528d00f  ! 168: SLLX_R	sllx	%r3, %r15, %r18
	.word 0xee116688  ! 168: LDUH_I	lduh	[%r5 + 0x0688], %r23
	.word 0xfc21c00e  ! 170: STW_R	stw	%r30, [%r7 + %r14]
thr1_ic_err_11:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_11), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xb3a0c92c  ! 170: FMULs	fmuls	%f3, %f12, %f25
	.word 0xfa2a2938  ! 172: STB_I	stb	%r29, [%r8 + 0x0938]
thr1_ic_err_12:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_12), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xf408e95f  ! 172: LDUB_I	ldub	[%r3 + 0x095f], %r26
	.word 0xf221ac58  ! 174: STW_I	stw	%r25, [%r6 + 0x0c58]
	.word 0xe2212534  ! 174: STW_I	stw	%r17, [%r4 + 0x0534]
	.word 0xeff1200f  ! 174: CASXA_R	casxa	[%r4]%asi, %r15, %r23
	.word 0xec29ae9b  ! 175: STB_I	stb	%r22, [%r6 + 0x0e9b]
	.word 0xb611c00f  ! 177: OR_R	or 	%r7, %r15, %r27
	.word 0xae39000c  ! 177: XNOR_R	xnor 	%r4, %r12, %r23
	.word 0xe871ef60  ! 178: STX_I	stx	%r20, [%r7 + 0x0f60]
	.word 0xe871e6a8  ! 178: STX_I	stx	%r20, [%r7 + 0x06a8]
	.word 0xe22228d0  ! 178: STW_I	stw	%r17, [%r8 + 0x08d0]
	.word 0xea21c00e  ! 178: STW_R	stw	%r21, [%r7 + %r14]
	.word 0xf2716778  ! 178: STX_I	stx	%r25, [%r5 + 0x0778]
	.word 0xf2316d2e  ! 179: STH_I	sth	%r25, [%r5 + 0x0d2e]
thr1_irf_ce_10:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_10), 16, 16), 1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xea29e3a1  ! 180: STB_I	stb	%r21, [%r7 + 0x03a1]
	.word 0xfa722c68  ! 180: STX_I	stx	%r29, [%r8 + 0x0c68]
	.word 0xf0222950  ! 180: STW_I	stw	%r24, [%r8 + 0x0950]
	.word 0xf629800b  ! 180: STB_R	stb	%r27, [%r6 + %r11]
	.word 0xe4e9d00d  ! 180: LDSTUBA_R	ldstuba	%r18, [%r7 + %r13] 0x80
	.word 0xe8e9500b  ! 181: LDSTUBA_R	ldstuba	%r20, [%r5 + %r11] 0x80
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe2212a34  ! 184: STW_I	stw	%r17, [%r4 + 0x0a34]
thr1_ic_err_13:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_13), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xb611400c  ! 185: OR_R	or 	%r5, %r12, %r27
	.word 0xaf31500d  ! 185: SRLX_R	srlx	%r5, %r13, %r23
	.word 0xb801ad4c  ! 185: ADD_I	add 	%r6, 0x0d4c, %r28
	.word 0xbd39000c  ! 185: SRA_R	sra 	%r4, %r12, %r30
	.word 0xfa11eef2  ! 185: LDUH_I	lduh	[%r7 + 0x0ef2], %r29
	.word 0xe831000e  ! 187: STH_R	sth	%r20, [%r4 + %r14]
thr1_irf_ce_11:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_11), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xec30c00b  ! 188: STH_R	sth	%r22, [%r3 + %r11]
	.word 0xfa21000e  ! 188: STW_R	stw	%r29, [%r4 + %r14]
	.word 0xec21000e  ! 188: STW_R	stw	%r22, [%r4 + %r14]
	.word 0xea71c00d  ! 188: STX_R	stx	%r21, [%r7 + %r13]
	.word 0xe671800b  ! 188: STX_R	stx	%r19, [%r6 + %r11]
	.word 0xfe21edec  ! 188: STW_I	stw	%r31, [%r7 + 0x0dec]
	.word 0xbf782401  ! 189: MOVR_I	move	%r0, 0xfffffed8, %r31
	.word 0xa5313001  ! 189: SRLX_I	srlx	%r4, 0x0001, %r18
	.word 0xf621800d  ! 190: STW_R	stw	%r27, [%r6 + %r13]
thr1_irf_ce_12:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_12), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xf831e012  ! 191: STH_I	sth	%r28, [%r7 + 0x0012]
thr1_ic_err_14:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,10,32)
	.word 0x81d9800e  ! 191: FLUSH_R	dis not found

	.word 0xe82161a4  ! 193: STW_I	stw	%r20, [%r5 + 0x01a4]
thr1_irf_ce_13:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_13), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe231a041  ! 193: STH_I	sth	%r17, [%r6 + 0x0041]
	.word 0xf521c00e  ! 194: STF_R	st	%f26, [%r14, %r7]
	.word 0xeaf9d00d  ! 195: SWAPA_R	swapa	%r21, [%r7 + %r13] 0x80
	.word 0xec70e5a7  ! 196: STX_I	stx	%r22, [%r3 + 0x05a7]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfc216958  ! 199: STW_I	stw	%r30, [%r5 + 0x0958]
	.word 0xfe71a850  ! 200: STX_I	stx	%r31, [%r6 + 0x0850]
	.word 0xf229e07d  ! 200: STB_I	stb	%r25, [%r7 + 0x007d]
	.word 0xfc28c00c  ! 200: STB_R	stb	%r30, [%r3 + %r12]
	.word 0xf021c00d  ! 200: STW_R	stw	%r24, [%r7 + %r13]
	.word 0xfa71c00d  ! 200: STX_R	stx	%r29, [%r7 + %r13]
	.word 0xe42a000c  ! 201: STB_R	stb	%r18, [%r8 + %r12]
	.word 0xfe71800b  ! 201: STX_R	stx	%r31, [%r6 + %r11]
	.word 0xf822000c  ! 201: STW_R	stw	%r28, [%r8 + %r12]
	.word 0xf829000b  ! 201: STB_R	stb	%r28, [%r4 + %r11]
	.word 0xf629000e  ! 201: STB_R	stb	%r27, [%r4 + %r14]
	.word 0xfc70e388  ! 201: STX_I	stx	%r30, [%r3 + 0x0388]
	.word 0xeaf9500e  ! 201: SWAPA_R	swapa	%r21, [%r5 + %r14] 0x80
	.word 0xf721800d  ! 202: STF_R	st	%f27, [%r13, %r6]
	.word 0xfe712828  ! 204: STX_I	stx	%r31, [%r4 + 0x0828]
thr1_ic_err_15:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_15), 16, 16),1,IC_DATA,NIR,x,11)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xeb21400e  ! 205: STF_R	st	%f21, [%r14, %r5]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xedf2200d  ! 207: CASXA_R	casxa	[%r8]%asi, %r13, %r22
	.word 0xfc21c00f  ! 208: STW_R	stw	%r30, [%r7 + %r15]
	.word 0xea41a854  ! 209: LDSW_I	ldsw	[%r6 + 0x0854], %r21
	.word 0xf4e9a042  ! 210: LDSTUBA_I	ldstuba	%r26, [%r6 + 0x0042] %asi
	.word 0xe429000b  ! 212: STB_R	stb	%r18, [%r4 + %r11]
thr1_ic_err_16:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,17,24)
	.word 0xf431800e  ! 212: STH_R	sth	%r26, [%r6 + %r14]
	.word 0xb1a2082f  ! 213: FADDs	fadds	%f8, %f15, %f24
	.word 0xf628e2b7  ! 215: STB_I	stb	%r27, [%r3 + 0x02b7]
thr1_irf_ce_14:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_14), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xe4b96778  ! 215: STDA_I	stda	%r18, [%r5 + 0x0778] %asi
	.word 0xfe72000e  ! 216: STX_R	stx	%r31, [%r8 + %r14]
	.word 0xec31e1ae  ! 218: STH_I	sth	%r22, [%r7 + 0x01ae]
	.word 0xe22a26b5  ! 218: STB_I	stb	%r17, [%r8 + 0x06b5]
	.word 0xf020ea34  ! 218: STW_I	stw	%r24, [%r3 + 0x0a34]
	.word 0xf6a8d00d  ! 218: STBA_R	stba	%r27, [%r3 + %r13] 0x80
	.word 0xf02a000f  ! 220: STB_R	stb	%r24, [%r8 + %r15]
thr1_ic_err_17:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,29,6)
	.word 0xe221000d  ! 220: STW_R	stw	%r17, [%r4 + %r13]
	.word 0xe871800b  ! 222: STX_R	stx	%r20, [%r6 + %r11]
	.word 0xe82a000c  ! 223: STB_R	stb	%r20, [%r8 + %r12]
!Generating an illinst
	.word 0xb1319f0c  ! 224: SRLX_R	srlx	%r6, %r12, %r24
	.word 0xecf9a2b8  ! 225: SWAPA_I	swapa	%r22, [%r6 + 0x02b8] %asi
	.word 0xf3e2100f  ! 226: CASA_I	casa	[%r8] 0x80, %r15, %r25
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xfc21e64c  ! 229: STW_I	stw	%r30, [%r7 + 0x064c]
thr1_irf_ce_15:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_15), 16, 16), 1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xad396001  ! 230: SRA_I	sra 	%r5, 0x0001, %r22
	.word 0xa811a67d  ! 230: OR_I	or 	%r6, 0x067d, %r20
	.word 0xe5e0d00b  ! 230: CASA_I	casa	[%r3] 0x80, %r11, %r18
	.word 0xc0f009a0  ! 232: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xe4196338  ! 233: LDD_I	ldd	[%r5 + 0x0338], %r18
	.word 0xf230efb3  ! 234: STH_I	sth	%r25, [%r3 + 0x0fb3]
	.word 0xf8212170  ! 236: STW_I	stw	%r28, [%r4 + 0x0170]
thr1_irf_ce_16:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_16), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe630ed26  ! 237: STH_I	sth	%r19, [%r3 + 0x0d26]
thr1_resum_intr_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	.word 0xeaa9100d  ! 237: STBA_R	stba	%r21, [%r4 + %r13] 0x80
	.word 0xf831c00b  ! 239: STH_R	sth	%r28, [%r7 + %r11]
	.word 0xfa32274e  ! 239: STH_I	sth	%r29, [%r8 + 0x074e]
	.word 0xfe71000e  ! 239: STX_R	stx	%r31, [%r4 + %r14]
	.word 0xe830c00e  ! 239: STH_R	sth	%r20, [%r3 + %r14]
	.word 0xe42129ac  ! 240: STW_I	stw	%r18, [%r4 + 0x09ac]
thr1_ic_err_18:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_18), 16, 16),1,IC_DATA,IR,4,x)
!Generating an illinst
	.word 0xbc39ed14  ! 241: XNOR_I	xnor 	%r7, 0x0d14, %r30
	.word 0xfeb0d00c  ! 242: STHA_R	stha	%r31, [%r3 + %r12] 0x80
	.word 0xf02222bc  ! 244: STW_I	stw	%r24, [%r8 + 0x02bc]
thr1_irf_ce_17:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_17), 16, 16), 1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xec70c00b  ! 245: STX_R	stx	%r22, [%r3 + %r11]
thr1_ic_err_19:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_19), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xf431e50a  ! 246: STH_I	sth	%r26, [%r7 + 0x050a]
thr1_resum_intr_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0xf431400e  ! 246: STH_R	sth	%r26, [%r5 + %r14]
	.word 0xf029000e  ! 248: STB_R	stb	%r24, [%r4 + %r14]
	.word 0xf831c00d  ! 248: STH_R	sth	%r28, [%r7 + %r13]
	.word 0xf831e1c2  ! 248: STH_I	sth	%r28, [%r7 + 0x01c2]
	.word 0xfc29800f  ! 248: STB_R	stb	%r30, [%r6 + %r15]
	.word 0xfe21800f  ! 248: STW_R	stw	%r31, [%r6 + %r15]
	.word 0xe271a9f8  ! 249: STX_I	stx	%r17, [%r6 + 0x09f8]
thr1_irf_ce_18:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_18), 16, 16), 1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xfc312b4a  ! 250: STH_I	sth	%r30, [%r4 + 0x0b4a]
	.word 0xea30e2fe  ! 250: STH_I	sth	%r21, [%r3 + 0x02fe]
	.word 0xec29400e  ! 250: STB_R	stb	%r22, [%r5 + %r14]
	.word 0xab396001  ! 251: SRA_I	sra 	%r5, 0x0001, %r21
	.word 0xf0416c54  ! 251: LDSW_I	ldsw	[%r5 + 0x0c54], %r24
	.word 0xfaf2100e  ! 252: STXA_R	stxa	%r29, [%r8 + %r14] 0x80
	.word 0xf670e710  ! 254: STX_I	stx	%r27, [%r3 + 0x0710]
thr1_ic_err_20:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,18,14)
	.word 0x81d9800d  ! 254: FLUSH_R	dis not found

	.word 0xe321000c  ! 255: STF_R	st	%f17, [%r12, %r4]
	.word 0xe2a2100c  ! 256: STWA_R	stwa	%r17, [%r8 + %r12] 0x80
	.word 0xe22965d3  ! 258: STB_I	stb	%r17, [%r5 + 0x05d3]
thr1_irf_ce_19:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_19), 16, 16), 1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xc3e92f6f  ! 258: PREFETCHA_I	prefetcha	[%r4, + 0x0f6f] %asi, #one_read
	.word 0xfa312493  ! 259: STH_I	sth	%r29, [%r4 + 0x0493]
	.word 0xf830e584  ! 261: STH_I	sth	%r28, [%r3 + 0x0584]
thr1_irf_ce_20:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_20), 16, 16), 1,IRF,ce,35,x, x,x,x, x,x,x)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc0f00960  ! 263: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf071400d  ! 265: STX_R	stx	%r24, [%r5 + %r13]
thr1_ic_err_21:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_21), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xf432211e  ! 266: STH_I	sth	%r26, [%r8 + 0x011e]
	.word 0xf421c00b  ! 266: STW_R	stw	%r26, [%r7 + %r11]
	.word 0xf620e2a8  ! 266: STW_I	stw	%r27, [%r3 + 0x02a8]
	.word 0xc0f00960  ! 267: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf031c00e  ! 269: STH_R	sth	%r24, [%r7 + %r14]
thr1_resum_intr_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
	.word 0xf4f1500e  ! 269: STXA_R	stxa	%r26, [%r5 + %r14] 0x80
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,55)
	.word 0xf8120009  ! 271: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xe432000c  ! 273: STH_R	sth	%r18, [%r8 + %r12]
thr1_ic_err_22:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,12,23)
	.word 0xe620c00e  ! 274: STW_R	stw	%r19, [%r3 + %r14]
	.word 0xf631400f  ! 274: STH_R	sth	%r27, [%r5 + %r15]
	.word 0xfa296f84  ! 274: STB_I	stb	%r29, [%r5 + 0x0f84]
	.word 0xe2316246  ! 274: STH_I	sth	%r17, [%r5 + 0x0246]
	.word 0xe831800c  ! 274: STH_R	sth	%r20, [%r6 + %r12]
	.word 0xe428e076  ! 274: STB_I	stb	%r18, [%r3 + 0x0076]
	.word 0xf0b0e5a0  ! 274: STHA_I	stha	%r24, [%r3 + 0x05a0] %asi
	.word 0xfe31c00f  ! 276: STH_R	sth	%r31, [%r7 + %r15]
thr1_irf_ce_21:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_21), 16, 16), 1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xf4a9500c  ! 276: STBA_R	stba	%r26, [%r5 + %r12] 0x80
	.word 0xfef16078  ! 277: STXA_I	stxa	%r31, [%r5 + 0x0078] %asi
	.word 0xfe21400b  ! 279: STW_R	stw	%r31, [%r5 + %r11]
thr1_irf_ce_22:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_22), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xb628c00d  ! 280: ANDN_R	andn 	%r3, %r13, %r27
	.word 0xad31100d  ! 280: SRLX_R	srlx	%r4, %r13, %r22
	.word 0xa42a279a  ! 280: ANDN_I	andn 	%r8, 0x079a, %r18
	.word 0xe6e9100b  ! 280: LDSTUBA_R	ldstuba	%r19, [%r4 + %r11] 0x80
	.word 0xf920e904  ! 281: STF_I	st	%f28, [0x0904, %r3]
	.word 0xa6492189  ! 282: MULX_I	mulx 	%r4, 0x0189, %r19
	.word 0xf8312878  ! 284: STH_I	sth	%r28, [%r4 + 0x0878]
	.word 0xe828c00e  ! 284: STB_R	stb	%r20, [%r3 + %r14]
	.word 0xed21400f  ! 284: STF_R	st	%f22, [%r15, %r5]
	.word 0xfb39000f  ! 285: STDF_R	std	%f29, [%r15, %r4]
	.word 0xee21000f  ! 287: STW_R	stw	%r23, [%r4 + %r15]
	.word 0xea216338  ! 287: STW_I	stw	%r21, [%r5 + 0x0338]
	.word 0xec3228a2  ! 287: STH_I	sth	%r22, [%r8 + 0x08a2]
	.word 0xf672000e  ! 287: STX_R	stx	%r27, [%r8 + %r14]
	.word 0xf631000c  ! 287: STH_R	sth	%r27, [%r4 + %r12]
	.word 0xe42961a4  ! 287: STB_I	stb	%r18, [%r5 + 0x01a4]
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xe629689d  ! 289: STB_I	stb	%r19, [%r5 + 0x089d]
thr1_resum_intr_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_20), 16, 16)) -> intp(1, 3, 1)
	.word 0xe3e1500d  ! 289: CASA_I	casa	[%r5] 0x80, %r13, %r17
	.word 0xea50e968  ! 290: LDSH_I	ldsh	[%r3 + 0x0968], %r21
	.word 0xf829a5d9  ! 291: STB_I	stb	%r28, [%r6 + 0x05d9]
	.word 0xa63a243a  ! 293: XNOR_I	xnor 	%r8, 0x043a, %r19
	.word 0xb3393001  ! 293: SRAX_I	srax	%r4, 0x0001, %r25
	.word 0xbc1a2638  ! 293: XOR_I	xor 	%r8, 0x0638, %r30
	.word 0xf671ec00  ! 294: STX_I	stx	%r27, [%r7 + 0x0c00]
thr1_ic_err_23:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_23), 16, 16),1,IC_DATA,NIR,x,13)
	.word 0xfe116090  ! 294: LDUH_I	lduh	[%r5 + 0x0090], %r31
	.word 0xf339400e  ! 295: STDF_R	std	%f25, [%r14, %r5]
	.word 0xf629000f  ! 297: STB_R	stb	%r27, [%r4 + %r15]
	.word 0xea222120  ! 297: STW_I	stw	%r21, [%r8 + 0x0120]
	.word 0xf2222b40  ! 297: STW_I	stw	%r25, [%r8 + 0x0b40]
	.word 0xf3222db4  ! 297: STF_I	st	%f25, [0x0db4, %r8]
	.word 0xe739000c  ! 298: STDF_R	std	%f19, [%r12, %r4]
	.word 0xfa72000f  ! 300: STX_R	stx	%r29, [%r8 + %r15]
thr1_ic_err_24:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_24), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xc4f00c00  ! 301: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xff39e708  ! 302: STDF_I	std	%f31, [0x0708, %r7]
	.word 0xeca9100d  ! 303: STBA_R	stba	%r22, [%r4 + %r13] 0x80
	.word 0xec31a1dc  ! 305: STH_I	sth	%r22, [%r6 + 0x01dc]
	.word 0xf8f0e2a0  ! 305: STXA_I	stxa	%r28, [%r3 + 0x02a0] %asi
	.word 0xe269800b  ! 306: LDSTUB_R	ldstub	%r17, [%r6 + %r11]
	.word 0xf070ea88  ! 308: STX_I	stx	%r24, [%r3 + 0x0a88]
thr1_resum_intr_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_21), 16, 16)) -> intp(1, 3, 1)
	.word 0xf7f1a00c  ! 308: CASXA_R	casxa	[%r6]%asi, %r12, %r27
	.word 0xec322cc6  ! 310: STH_I	sth	%r22, [%r8 + 0x0cc6]
	.word 0xf631000b  ! 310: STH_R	sth	%r27, [%r4 + %r11]
	.word 0xe829400e  ! 310: STB_R	stb	%r20, [%r5 + %r14]
	.word 0xf821a1e0  ! 310: STW_I	stw	%r28, [%r6 + 0x01e0]
	.word 0xfc3223e0  ! 310: STH_I	sth	%r30, [%r8 + 0x03e0]
	.word 0xf8716648  ! 310: STX_I	stx	%r28, [%r5 + 0x0648]
	.word 0xf621400b  ! 311: STW_R	stw	%r27, [%r5 + %r11]
thr1_irf_ce_23:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_23), 16, 16), 1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0x8143e004  ! 311: MEMBAR	membar	#LoadStore 
	.word 0xfa71eaff  ! 312: STX_I	stx	%r29, [%r7 + 0x0aff]
	.word 0x81d8c00c  ! 313: FLUSH_R	dis not found

	.word 0xe420e024  ! 315: STW_I	stw	%r18, [%r3 + 0x0024]
	.word 0xee28e1c4  ! 315: STB_I	stb	%r23, [%r3 + 0x01c4]
	.word 0xf021000c  ! 315: STW_R	stw	%r24, [%r4 + %r12]
	.word 0xfe21aef8  ! 315: STW_I	stw	%r31, [%r6 + 0x0ef8]
	.word 0xe871a3f0  ! 315: STX_I	stx	%r20, [%r6 + 0x03f0]
	.word 0xf828eff5  ! 315: STB_I	stb	%r28, [%r3 + 0x0ff5]
	.word 0xf021000d  ! 316: STW_R	stw	%r24, [%r4 + %r13]
thr1_resum_intr_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_22), 16, 16)) -> intp(1, 3, 1)
	.word 0xe73964d0  ! 316: STDF_I	std	%f19, [0x04d0, %r5]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe42a000e  ! 319: STB_R	stb	%r18, [%r8 + %r14]
thr1_irf_ce_24:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_24), 16, 16), 1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xfc2a000d  ! 320: STB_R	stb	%r30, [%r8 + %r13]
thr1_resum_intr_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_23), 16, 16)) -> intp(1, 3, 1)
	.word 0xe520e3b8  ! 320: STF_I	st	%f18, [0x03b8, %r3]
	.word 0xf228c00c  ! 322: STB_R	stb	%r25, [%r3 + %r12]
thr1_irf_ce_25:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_25), 16, 16), 1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xbc192167  ! 323: XOR_I	xor 	%r4, 0x0167, %r30
	.word 0xb139900e  ! 323: SRAX_R	srax	%r6, %r14, %r24
	.word 0xb019a430  ! 323: XOR_I	xor 	%r6, 0x0430, %r24
	.word 0xae28c00c  ! 323: ANDN_R	andn 	%r3, %r12, %r23
	.word 0xe271a9b0  ! 324: STX_I	stx	%r17, [%r6 + 0x09b0]
thr1_resum_intr_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_24), 16, 16)) -> intp(1, 3, 1)
	.word 0xe721400d  ! 324: STF_R	st	%f19, [%r13, %r5]
	.word 0xf020e554  ! 326: STW_I	stw	%r24, [%r3 + 0x0554]
thr1_resum_intr_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_25), 16, 16)) -> intp(1, 3, 1)
	.word 0xeae9edd6  ! 326: LDSTUBA_I	ldstuba	%r21, [%r7 + 0x0dd6] %asi
	.word 0xea71000f  ! 328: STX_R	stx	%r21, [%r4 + %r15]
thr1_irf_ce_26:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_26), 16, 16), 1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xea31a728  ! 329: STH_I	sth	%r21, [%r6 + 0x0728]
thr1_ic_err_25:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,4,2)
	.word 0xf241a33c  ! 329: LDSW_I	ldsw	[%r6 + 0x033c], %r25
	.word 0xfc29000e  ! 331: STB_R	stb	%r30, [%r4 + %r14]
	.word 0xe221e3e4  ! 332: STW_I	stw	%r17, [%r7 + 0x03e4]
thr1_irf_ce_27:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_27), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xe6a12830  ! 332: STWA_I	stwa	%r19, [%r4 + 0x0830] %asi
	.word 0xc4f00c00  ! 334: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfa312110  ! 336: STH_I	sth	%r29, [%r4 + 0x0110]
	.word 0xfa29c00d  ! 336: STB_R	stb	%r29, [%r7 + %r13]
	.word 0xfa31a7d2  ! 336: STH_I	sth	%r29, [%r6 + 0x07d2]
	.word 0xea29c00e  ! 336: STB_R	stb	%r21, [%r7 + %r14]
	.word 0xe8716d18  ! 336: STX_I	stx	%r20, [%r5 + 0x0d18]
	.word 0xac31400b  ! 337: ORN_R	orn 	%r5, %r11, %r22
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xea322df1  ! 338: STH_I	sth	%r21, [%r8 + 0x0df1]
	.word 0xfa70c00b  ! 340: STX_R	stx	%r29, [%r3 + %r11]
	.word 0xe272000f  ! 340: STX_R	stx	%r17, [%r8 + %r15]
	.word 0xf031400f  ! 340: STH_R	sth	%r24, [%r5 + %r15]
	.word 0xf431676d  ! 340: STH_I	sth	%r26, [%r5 + 0x076d]
	.word 0xec79e484  ! 341: SWAP_I	swap	%r22, [%r7 + 0x0484]
	.word 0xe212255c  ! 342: LDUH_I	lduh	[%r8 + 0x055c], %r17
	.word 0xe4b8d00e  ! 343: STDA_R	stda	%r18, [%r3 + %r14] 0x80
	.word 0xb659000f  ! 344: SMUL_R	smul 	%r4, %r15, %r27
	.word 0xe229800e  ! 346: STB_R	stb	%r17, [%r6 + %r14]
thr1_ic_err_26:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_26), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xe648e301  ! 346: LDSB_I	ldsb	[%r3 + 0x0301], %r19
	.word 0xee48e3a5  ! 347: LDSB_I	ldsb	[%r3 + 0x03a5], %r23
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe538ed18  ! 349: STDF_I	std	%f18, [0x0d18, %r3]
	.word 0xfaa1e980  ! 350: STWA_I	stwa	%r29, [%r7 + 0x0980] %asi
	.word 0xf430c00e  ! 352: STH_R	sth	%r26, [%r3 + %r14]
	.word 0xe429ed78  ! 352: STB_I	stb	%r18, [%r7 + 0x0d78]
	.word 0xf021000e  ! 352: STW_R	stw	%r24, [%r4 + %r14]
	.word 0xe62a21b1  ! 352: STB_I	stb	%r19, [%r8 + 0x01b1]
	.word 0xe470e188  ! 352: STX_I	stx	%r18, [%r3 + 0x0188]
	.word 0xb058e6b2  ! 352: SMUL_I	smul 	%r3, 0x06b2, %r24
	.word 0xe5396ce0  ! 353: STDF_I	std	%f18, [0x0ce0, %r5]
	.word 0xfc29e495  ! 355: STB_I	stb	%r30, [%r7 + 0x0495]
thr1_ic_err_27:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_27), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xe830e948  ! 356: STH_I	sth	%r20, [%r3 + 0x0948]
thr1_resum_intr_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_26), 16, 16)) -> intp(1, 3, 1)
	.word 0xf6a9e588  ! 356: STBA_I	stba	%r27, [%r7 + 0x0588] %asi
	.word 0xf671e670  ! 358: STX_I	stx	%r27, [%r7 + 0x0670]
thr1_resum_intr_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_27), 16, 16)) -> intp(1, 3, 1)
	.word 0xf631ec98  ! 359: STH_I	sth	%r27, [%r7 + 0x0c98]
thr1_irf_ce_28:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_28), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xe819a3d8  ! 360: LDD_I	ldd	[%r6 + 0x03d8], %r20
	.word 0xf031a56a  ! 362: STH_I	sth	%r24, [%r6 + 0x056a]
thr1_resum_intr_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_28), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 363: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfa51e06c  ! 364: LDSH_I	ldsh	[%r7 + 0x006c], %r29
	.word 0xf422000f  ! 366: STW_R	stw	%r26, [%r8 + %r15]
thr1_resum_intr_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_29), 16, 16)) -> intp(1, 3, 1)
	.word 0xab31a001  ! 367: SRL_I	srl 	%r6, 0x0001, %r21
	.word 0xae09ed70  ! 367: AND_I	and 	%r7, 0x0d70, %r23
	.word 0xf8312386  ! 368: STH_I	sth	%r28, [%r4 + 0x0386]
	.word 0xfa31c00c  ! 368: STH_R	sth	%r29, [%r7 + %r12]
	.word 0xe4222d44  ! 368: STW_I	stw	%r18, [%r8 + 0x0d44]
	.word 0xea322e50  ! 368: STH_I	sth	%r21, [%r8 + 0x0e50]
	.word 0xf4522352  ! 368: LDSH_I	ldsh	[%r8 + 0x0352], %r26
	.word 0xe22921ad  ! 370: STB_I	stb	%r17, [%r4 + 0x01ad]
thr1_ic_err_28:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_28), 16, 16),1,IC_DATA,IR_NIR,11,4)
	.word 0xe222000d  ! 371: STW_R	stw	%r17, [%r8 + %r13]
thr1_resum_intr_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_30), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 372: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xea71e8b8  ! 374: STX_I	stx	%r21, [%r7 + 0x08b8]
thr1_ic_err_29:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_29), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xf07223d0  ! 375: STX_I	stx	%r24, [%r8 + 0x03d0]
	.word 0xf831eb28  ! 375: STH_I	sth	%r28, [%r7 + 0x0b28]
	.word 0xe87224f0  ! 375: STX_I	stx	%r20, [%r8 + 0x04f0]
	.word 0xe669400c  ! 375: LDSTUB_R	ldstub	%r19, [%r5 + %r12]
	.word 0xe470e030  ! 377: STX_I	stx	%r18, [%r3 + 0x0030]
thr1_ic_err_30:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_30), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xedf0d00c  ! 377: CASXA_I	casxa	[%r3] 0x80, %r12, %r22
	.word 0xe2f9900b  ! 378: SWAPA_R	swapa	%r17, [%r6 + %r11] 0x80
	.word 0xe0ba100d  ! 379: STDA_R	stda	%r16, [%r8 + %r13] 0x80
!Generating an illinst
	.word 0xbd294f2f  ! 381: SLL_R	sll 	%r5, %r15, %r30
	.word 0xfe50e1d4  ! 382: LDSH_I	ldsh	[%r3 + 0x01d4], %r31
	.word 0xe669400f  ! 383: LDSTUB_R	ldstub	%r19, [%r5 + %r15]
	.word 0xf631216e  ! 385: STH_I	sth	%r27, [%r4 + 0x016e]
	.word 0xe8712cd8  ! 385: STX_I	stx	%r20, [%r4 + 0x0cd8]
	.word 0xe221abe8  ! 385: STW_I	stw	%r17, [%r6 + 0x0be8]
	.word 0xee49a935  ! 385: LDSB_I	ldsb	[%r6 + 0x0935], %r23
	.word 0xe22a000c  ! 387: STB_R	stb	%r17, [%r8 + %r12]
thr1_resum_intr_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_31), 16, 16)) -> intp(1, 3, 1)
	.word 0xe2f9af88  ! 387: SWAPA_I	swapa	%r17, [%r6 + 0x0f88] %asi
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0xbc09400b  ! 390: AND_R	and 	%r5, %r11, %r30
	.word 0xbc112a46  ! 390: OR_I	or 	%r4, 0x0a46, %r30
	.word 0xad782401  ! 390: MOVR_I	move	%r0, 0xfffffed8, %r22
	.word 0xac2a000f  ! 390: ANDN_R	andn 	%r8, %r15, %r22
	.word 0xfc296ead  ! 391: STB_I	stb	%r30, [%r5 + 0x0ead]
thr1_ic_err_31:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_31), 16, 16),1,IC_DATA,IR_NIR,24,30)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xc4f00980  ! 393: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe7e1600e  ! 394: CASA_R	casa	[%r5] %asi, %r14, %r19
	.word 0xf829400e  ! 396: STB_R	stb	%r28, [%r5 + %r14]
	.word 0xe421c00f  ! 396: STW_R	stw	%r18, [%r7 + %r15]
	.word 0xea2a000f  ! 396: STB_R	stb	%r21, [%r8 + %r15]
	.word 0xf272000c  ! 397: STX_R	stx	%r25, [%r8 + %r12]
	.word 0xf22165c0  ! 397: STW_I	stw	%r25, [%r5 + 0x05c0]
	.word 0xbe0a25b7  ! 398: AND_I	and 	%r8, 0x05b7, %r31
	.word 0xfdf1900e  ! 398: CASXA_I	casxa	[%r6] 0x80, %r14, %r30
	.word 0xec72000e  ! 399: STX_R	stx	%r22, [%r8 + %r14]
	.word 0xee31800b  ! 401: STH_R	sth	%r23, [%r6 + %r11]
thr1_resum_intr_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_32), 16, 16)) -> intp(1, 3, 1)
	.word 0xf6092ce6  ! 401: LDUB_I	ldub	[%r4 + 0x0ce6], %r27
	.word 0xb330c00c  ! 403: SRL_R	srl 	%r3, %r12, %r25
	.word 0xfb222894  ! 403: STF_I	st	%f29, [0x0894, %r8]
	.word 0xff39000c  ! 404: STDF_R	std	%f31, [%r12, %r4]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xea30e7c2  ! 408: STH_I	sth	%r21, [%r3 + 0x07c2]
	.word 0xf830eebe  ! 408: STH_I	sth	%r28, [%r3 + 0x0ebe]
	.word 0xec7169e8  ! 409: STX_I	stx	%r22, [%r5 + 0x09e8]
	.word 0xf671e5e0  ! 409: STX_I	stx	%r27, [%r7 + 0x05e0]
	.word 0xfe2a000d  ! 410: STB_R	stb	%r31, [%r8 + %r13]
	.word 0xec29a663  ! 410: STB_I	stb	%r22, [%r6 + 0x0663]
	.word 0xf071a6d0  ! 410: STX_I	stx	%r24, [%r6 + 0x06d0]
	.word 0xf021400f  ! 410: STW_R	stw	%r24, [%r5 + %r15]
	.word 0xe229ece6  ! 410: STB_I	stb	%r17, [%r7 + 0x0ce6]
	.word 0xf821c00f  ! 410: STW_R	stw	%r28, [%r7 + %r15]
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,54)
	.word 0xfa4a0009  ! 411: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xfa32000f  ! 412: STH_R	sth	%r29, [%r8 + %r15]
	.word 0xba08e18d  ! 414: AND_I	and 	%r3, 0x018d, %r29
	.word 0xf539400f  ! 414: STDF_R	std	%f26, [%r15, %r5]
	.word 0xf4b9d00e  ! 415: STDA_R	stda	%r26, [%r7 + %r14] 0x80
	.word 0xf2222998  ! 417: STW_I	stw	%r25, [%r8 + 0x0998]
thr1_irf_ce_29:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_29), 16, 16), 1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xe832000d  ! 418: STH_R	sth	%r20, [%r8 + %r13]
	.word 0xe220c00f  ! 418: STW_R	stw	%r17, [%r3 + %r15]
	.word 0xe4222314  ! 418: STW_I	stw	%r18, [%r8 + 0x0314]
	.word 0xe621a035  ! 418: STW_I	stw	%r19, [%r6 + 0x0035]
	.word 0xf629000b  ! 420: STB_R	stb	%r27, [%r4 + %r11]
thr1_irf_ce_30:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_30), 16, 16), 1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xe42a000c  ! 420: STB_R	stb	%r18, [%r8 + %r12]
	.word 0xc36a000f  ! 421: PREFETCH_R	prefetch	[%r8 + %r15], #one_read
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xfc30c00e  ! 424: STH_R	sth	%r30, [%r3 + %r14]
thr1_ic_err_32:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_32), 16, 16),1,IC_DATA,NIR,x,29)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf0292357  ! 425: STB_I	stb	%r24, [%r4 + 0x0357]
	.word 0xf259e558  ! 426: LDX_I	ldx	[%r7 + 0x0558], %r25
!Generating an illinst
	.word 0xb7395f6b  ! 428: SRAX_R	srax	%r5, %r11, %r27
	.word 0xe2312cb4  ! 430: STH_I	sth	%r17, [%r4 + 0x0cb4]
	.word 0xf1222984  ! 430: STF_I	st	%f24, [0x0984, %r8]
	.word 0xed21000e  ! 431: STF_R	st	%f22, [%r14, %r4]
	.word 0xe5e1100e  ! 432: CASA_I	casa	[%r4] 0x80, %r14, %r18
	.word 0xf42126ac  ! 434: STW_I	stw	%r26, [%r4 + 0x06ac]
thr1_resum_intr_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_33), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xec28c00e  ! 436: STB_R	stb	%r22, [%r3 + %r14]
thr1_ic_err_33:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_33), 16, 16),1,IC_DATA,IR,33,x)
	.word 0x81d9c00b  ! 436: FLUSH_R	dis not found

	.word 0xee21a318  ! 438: STW_I	stw	%r23, [%r6 + 0x0318]
thr1_ic_err_34:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_34), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xe420c00c  ! 439: STW_R	stw	%r18, [%r3 + %r12]
	.word 0xea31e72e  ! 439: STH_I	sth	%r21, [%r7 + 0x072e]
	.word 0xfa31400b  ! 439: STH_R	sth	%r29, [%r5 + %r11]
	.word 0xb41163ef  ! 440: OR_I	or 	%r5, 0x03ef, %r26
	.word 0xab31100e  ! 440: SRLX_R	srlx	%r4, %r14, %r21
	.word 0xa5312001  ! 440: SRL_I	srl 	%r4, 0x0001, %r18
	.word 0xa72a100d  ! 440: SLLX_R	sllx	%r8, %r13, %r19
	.word 0xe8a8e0d5  ! 440: STBA_I	stba	%r20, [%r3 + 0x00d5] %asi
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,60)
	.word 0xf0418009  ! 442: LDSW_R	ldsw	[%r6 + %r9], %r24
	.word 0xf021ae69  ! 443: STW_I	stw	%r24, [%r6 + 0x0e69]
	.word 0xfc6a000c  ! 444: LDSTUB_R	ldstub	%r30, [%r8 + %r12]
	.word 0xb051400b  ! 445: UMUL_R	umul 	%r5, %r11, %r24
	.word 0xe828c00d  ! 447: STB_R	stb	%r20, [%r3 + %r13]
thr1_irf_ce_31:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_31), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xfc29800e  ! 448: STB_R	stb	%r30, [%r6 + %r14]
	.word 0xf0322ae6  ! 448: STH_I	sth	%r24, [%r8 + 0x0ae6]
	.word 0xfc28e819  ! 448: STB_I	stb	%r30, [%r3 + 0x0819]
	.word 0xfc7229e0  ! 448: STX_I	stx	%r30, [%r8 + 0x09e0]
	.word 0xbd782401  ! 449: MOVR_I	move	%r0, 0xfffffed8, %r30
	.word 0xba29c00c  ! 449: ANDN_R	andn 	%r7, %r12, %r29
	.word 0xbc09400e  ! 449: AND_R	and 	%r5, %r14, %r30
	.word 0xa409a2e5  ! 449: AND_I	and 	%r6, 0x02e5, %r18
	.word 0xe8b1500b  ! 449: STHA_R	stha	%r20, [%r5 + %r11] 0x80
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf0322488  ! 452: STH_I	sth	%r24, [%r8 + 0x0488]
	.word 0xfa296ff8  ! 452: STB_I	stb	%r29, [%r5 + 0x0ff8]
	.word 0xee7226e0  ! 452: STX_I	stx	%r23, [%r8 + 0x06e0]
	.word 0xf920c00c  ! 452: STF_R	st	%f28, [%r12, %r3]
	.word 0xf22928e9  ! 454: STB_I	stb	%r25, [%r4 + 0x08e9]
thr1_ic_err_35:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_35), 16, 16),1,IC_DATA,IR_NIR,0,16)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe8b96510  ! 455: STDA_I	stda	%r20, [%r5 + 0x0510] %asi
	.word 0xfc21000f  ! 457: STW_R	stw	%r30, [%r4 + %r15]
thr1_irf_ce_32:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_32), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xf029000e  ! 458: STB_R	stb	%r24, [%r4 + %r14]
thr1_irf_ce_33:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_33), 16, 16), 1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc0f00960  ! 459: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf4516ee4  ! 460: LDSH_I	ldsh	[%r5 + 0x0ee4], %r26
	.word 0x2cc10003  ! 461: BRGZ	brgz,a,nt	%4,<label_0x10003>
!Generating an illinst
	.word 0xa5781f4b  ! 463: MOVR_R	movvs	%r0, %r11, %r18
	.word 0xfd21c00f  ! 464: STF_R	st	%f30, [%r15, %r7]
	.word 0xee216b44  ! 466: STW_I	stw	%r23, [%r5 + 0x0b44]
thr1_irf_ce_34:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_34), 16, 16), 1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xe8a92f94  ! 466: STBA_I	stba	%r20, [%r4 + 0x0f94] %asi
	.word 0xe231e1e4  ! 468: STH_I	sth	%r17, [%r7 + 0x01e4]
	.word 0xf628c00f  ! 468: STB_R	stb	%r27, [%r3 + %r15]
	.word 0xfc21400e  ! 468: STW_R	stw	%r30, [%r5 + %r14]
	.word 0xc0f00960  ! 469: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xec31a792  ! 471: STH_I	sth	%r22, [%r6 + 0x0792]
thr1_ic_err_36:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_36), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xae11673a  ! 472: OR_I	or 	%r5, 0x073a, %r23
	.word 0xad31100b  ! 473: SRLX_R	srlx	%r4, %r11, %r22
	.word 0xfa71400f  ! 474: STX_R	stx	%r29, [%r5 + %r15]
thr1_irf_ce_35:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_35), 16, 16), 1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xfe322730  ! 475: STH_I	sth	%r31, [%r8 + 0x0730]
	.word 0xee20e884  ! 475: STW_I	stw	%r23, [%r3 + 0x0884]
	.word 0xec21c00f  ! 475: STW_R	stw	%r22, [%r7 + %r15]
	.word 0xe270e6e8  ! 475: STX_I	stx	%r17, [%r3 + 0x06e8]
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe87122b8  ! 477: STX_I	stx	%r20, [%r4 + 0x02b8]
thr1_ic_err_37:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_37), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xc0f009a0  ! 478: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf829e401  ! 481: STB_I	stb	%r28, [%r7 + 0x0401]
thr1_irf_ce_36:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_36), 16, 16), 1,IRF,ce,50,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe621677c  ! 483: STW_I	stw	%r19, [%r5 + 0x077c]
thr1_irf_ce_37:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_37), 16, 16), 1,IRF,ce,68,x, x,x,x, x,x,x)
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,22)
	.word 0xf0194009  ! 484: LDD_R	ldd	[%r5 + %r9], %r24
	.word 0xf0192028  ! 485: LDD_I	ldd	[%r4 + 0x0028], %r24
	.word 0xf4b1100d  ! 486: STHA_R	stha	%r26, [%r4 + %r13] 0x80
	.word 0xfe222958  ! 488: STW_I	stw	%r31, [%r8 + 0x0958]
thr1_resum_intr_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_34), 16, 16)) -> intp(1, 3, 1)
	.word 0xe338c00b  ! 488: STDF_R	std	%f17, [%r11, %r3]
	.word 0xf271e668  ! 490: STX_I	stx	%r25, [%r7 + 0x0668]
thr1_ic_err_38:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_38), 16, 16),1,IC_DATA,NIR,x,14)
	.word 0xf231c00e  ! 491: STH_R	sth	%r25, [%r7 + %r14]
thr1_ic_err_39:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_39), 16, 16),1,IC_DATA,NIR,x,25)
	.word 0xf031e8a2  ! 492: STH_I	sth	%r24, [%r7 + 0x08a2]
thr1_ic_err_40:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_40), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xc0f00960  ! 493: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,6)
	.word 0xe6090009  ! 495: LDUB_R	ldub	[%r4 + %r9], %r19
	.word 0xfa29c00c  ! 497: STB_R	stb	%r29, [%r7 + %r12]
thr1_irf_ce_38:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_38), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf4196f18  ! 497: LDD_I	ldd	[%r5 + 0x0f18], %r26
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x9d3efe2b42ea6085, %r16, %r17
	setx  0xb0e404fd1d5e6e42, %r16, %r18
	setx  0x2688965f01d88310, %r16, %r19
	setx  0x9d41adccec4b8cf2, %r16, %r20
	setx  0x320a6f087ce94884, %r16, %r21
	setx  0xd32960603a480a70, %r16, %r22
	setx  0x545257a104e2cde4, %r16, %r23
	setx  0xbae0ba83e9e2c94c, %r16, %r24
	setx  0xe8e61020d2d25b90, %r16, %r25
	setx  0xfb5e2d44315e7ff4, %r16, %r26
	setx  0x28282736e786530a, %r16, %r27
	setx  0x034881e7e83449ea, %r16, %r28
	setx  0x472543ca45f9176f, %r16, %r29
	setx  0x55ef69c777e45ea7, %r16, %r30
	setx  0x54e7d6fd4bf8a4d7, %r16, %r31
	setx  0x0000000000000880, %r16, %r9
	setx  0x00000000000001b0, %r16, %r10
	setx  0x0000000000000060, %r16, %r11
	setx  0x0000000000000400, %r16, %r12
	setx  0x0000000000000e60, %r16, %r13
	setx  0x0000000000000190, %r16, %r14
	setx  0x0000000000000fc0, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	setx  0xffffffffffffffff, %r16, %r2
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
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	wr  %r0, 0x80, %asi
	.word 0xf0212f94  ! 0: STW_I	stw	%r24, [%r4 + 0x0f94]
	.word 0x8143c000  ! 1: STBAR	stbar
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,18)
	.word 0xf0110009  ! 3: LDUH_R	lduh	[%r4 + %r9], %r24
	.word 0xfc09e68d  ! 4: LDUB_I	ldub	[%r7 + 0x068d], %r30
	.word 0xfe48eacc  ! 5: LDSB_I	ldsb	[%r3 + 0x0acc], %r31
	.word 0xf871800e  ! 7: STX_R	stx	%r28, [%r6 + %r14]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfe21e834  ! 9: STW_I	stw	%r31, [%r7 + 0x0834]
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xf42a28c7  ! 10: STB_I	stb	%r26, [%r8 + 0x08c7]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16), 1,IRF,ce,28,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe7e0d00d  ! 12: CASA_I	casa	[%r3] 0x80, %r13, %r19
	.word 0xbb29e001  ! 14: SLL_I	sll 	%r7, 0x0001, %r29
	.word 0xba19c00e  ! 14: XOR_R	xor 	%r7, %r14, %r29
	.word 0xa832000b  ! 14: ORN_R	orn 	%r8, %r11, %r20
	.word 0xa529400c  ! 14: SLL_R	sll 	%r5, %r12, %r18
	.word 0xf431400e  ! 15: STH_R	sth	%r26, [%r5 + %r14]
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16), 1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe229ebec  ! 16: STB_I	stb	%r17, [%r7 + 0x0bec]
	.word 0xb019a1a0  ! 17: XOR_I	xor 	%r6, 0x01a0, %r24
	.word 0xb538d00b  ! 17: SRAX_R	srax	%r3, %r11, %r26
	.word 0xb219ebcf  ! 17: XOR_I	xor 	%r7, 0x0bcf, %r25
	.word 0xe6492208  ! 17: LDSB_I	ldsb	[%r4 + 0x0208], %r19
	.word 0xf671a128  ! 19: STX_I	stx	%r27, [%r6 + 0x0128]
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16), 1,IRF,ce,52,x, x,x,x, x,x,x)
	.word 0xfc322128  ! 20: STH_I	sth	%r30, [%r8 + 0x0128]
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xbe492d62  ! 20: MULX_I	mulx 	%r4, 0x0d62, %r31
	.word 0xfbe1d00c  ! 21: CASA_I	casa	[%r7] 0x80, %r12, %r29
	.word 0xf7e1e00c  ! 22: CASA_R	casa	[%r7] %asi, %r12, %r27
	.word 0xf022000b  ! 24: STW_R	stw	%r24, [%r8 + %r11]
thr0_ic_err_0:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xfdf1200c  ! 24: CASXA_R	casxa	[%r4]%asi, %r12, %r30
	.word 0xf221000d  ! 26: STW_R	stw	%r25, [%r4 + %r13]
thr0_ic_err_1:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,14,21)
	.word 0xf441a844  ! 26: LDSW_I	ldsw	[%r6 + 0x0844], %r26
	.word 0xe2312c32  ! 28: STH_I	sth	%r17, [%r4 + 0x0c32]
	.word 0xee71a6c0  ! 28: STX_I	stx	%r23, [%r6 + 0x06c0]
	.word 0xf630c00b  ! 28: STH_R	sth	%r27, [%r3 + %r11]
	.word 0xf029a28a  ! 29: STB_I	stb	%r24, [%r6 + 0x028a]
thr0_ic_err_2:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR,24,x)
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,53)
	.word 0xf0598009  ! 30: LDX_R	ldx	[%r6 + %r9], %r24
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf7f1e00c  ! 32: CASXA_R	casxa	[%r7]%asi, %r12, %r27
	.word 0xa81961a6  ! 34: XOR_I	xor 	%r5, 0x01a6, %r20
	.word 0xe831ec74  ! 35: STH_I	sth	%r20, [%r7 + 0x0c74]
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xec7169d8  ! 38: STX_I	stx	%r22, [%r5 + 0x09d8]
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xe221c00e  ! 39: STW_R	stw	%r17, [%r7 + %r14]
thr0_irf_ce_4:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_4), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xf8596208  ! 39: LDX_I	ldx	[%r5 + 0x0208], %r28
	.word 0xe221c00f  ! 41: STW_R	stw	%r17, [%r7 + %r15]
	.word 0xe428c00d  ! 41: STB_R	stb	%r18, [%r3 + %r13]
	.word 0xfc196770  ! 41: LDD_I	ldd	[%r5 + 0x0770], %r30
	.word 0xe4ba2790  ! 42: STDA_I	stda	%r18, [%r8 + 0x0790] %asi
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf87123d8  ! 45: STX_I	stx	%r28, [%r4 + 0x03d8]
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe8092891  ! 46: LDUB_I	ldub	[%r4 + 0x0891], %r20
	.word 0xf670c00e  ! 48: STX_R	stx	%r27, [%r3 + %r14]
	.word 0xe82a000f  ! 48: STB_R	stb	%r20, [%r8 + %r15]
	.word 0xec316ef4  ! 48: STH_I	sth	%r22, [%r5 + 0x0ef4]
	.word 0xec29400d  ! 48: STB_R	stb	%r22, [%r5 + %r13]
	.word 0xe620c00c  ! 48: STW_R	stw	%r19, [%r3 + %r12]
	.word 0xe670c00c  ! 48: STX_R	stx	%r19, [%r3 + %r12]
	.word 0x12800001  ! 48: BNE	bne  	<label_0x1>
	.word 0xfc722780  ! 50: STX_I	stx	%r30, [%r8 + 0x0780]
	.word 0xb02a22f2  ! 51: ANDN_I	andn 	%r8, 0x02f2, %r24
	.word 0xba12000e  ! 51: OR_R	or 	%r8, %r14, %r29
	.word 0xa929b001  ! 51: SLLX_I	sllx	%r6, 0x0001, %r20
	.word 0xba00c00d  ! 51: ADD_R	add 	%r3, %r13, %r29
	.word 0xf42a000b  ! 52: STB_R	stb	%r26, [%r8 + %r11]
thr0_irf_ce_5:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_5), 16, 16), 1,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xede1a00d  ! 52: CASA_R	casa	[%r6] %asi, %r13, %r22
	.word 0xec29a83f  ! 53: STB_I	stb	%r22, [%r6 + 0x083f]
	.word 0xf871000d  ! 55: STX_R	stx	%r28, [%r4 + %r13]
	.word 0xfa70e448  ! 55: STX_I	stx	%r29, [%r3 + 0x0448]
	.word 0xf270c00d  ! 55: STX_R	stx	%r25, [%r3 + %r13]
	.word 0xea21c00b  ! 55: STW_R	stw	%r21, [%r7 + %r11]
	.word 0xe429e341  ! 55: STB_I	stb	%r18, [%r7 + 0x0341]
	.word 0xea29000f  ! 55: STB_R	stb	%r21, [%r4 + %r15]
	.word 0xea712bb8  ! 55: STX_I	stx	%r21, [%r4 + 0x0bb8]
	.word 0xe831400d  ! 56: STH_R	sth	%r20, [%r5 + %r13]
thr0_ic_err_3:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR_NIR,17,30)
	.word 0xa378040e  ! 57: MOVR_R	move	%r0, %r14, %r17
	.word 0xb731c00b  ! 57: SRL_R	srl 	%r7, %r11, %r27
	.word 0xb3292001  ! 57: SLL_I	sll 	%r4, 0x0001, %r25
	.word 0xf8b223ba  ! 57: STHA_I	stha	%r28, [%r8 + 0x03ba] %asi
	.word 0xfe31400b  ! 59: STH_R	sth	%r31, [%r5 + %r11]
thr0_ic_err_4:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,NIR,x,23)
	.word 0xf631c00c  ! 60: STH_R	sth	%r27, [%r7 + %r12]
	.word 0xe22a000b  ! 60: STB_R	stb	%r17, [%r8 + %r11]
	.word 0xf821a210  ! 60: STW_I	stw	%r28, [%r6 + 0x0210]
	.word 0xbf782401  ! 61: MOVR_I	move	%r0, 0xfffffed8, %r31
	.word 0xe831000e  ! 62: STH_R	sth	%r20, [%r4 + %r14]
	.word 0xe229000b  ! 62: STB_R	stb	%r17, [%r4 + %r11]
	.word 0xf021000c  ! 63: STW_R	stw	%r24, [%r4 + %r12]
	.word 0xe428c00f  ! 63: STB_R	stb	%r18, [%r3 + %r15]
	.word 0xf471000e  ! 63: STX_R	stx	%r26, [%r4 + %r14]
	.word 0xe820e850  ! 63: STW_I	stw	%r20, [%r3 + 0x0850]
	.word 0xe2712658  ! 63: STX_I	stx	%r17, [%r4 + 0x0658]
	.word 0xf871c00f  ! 64: STX_R	stx	%r28, [%r7 + %r15]
	.word 0xfe71400e  ! 64: STX_R	stx	%r31, [%r5 + %r14]
	.word 0xfc31c00e  ! 64: STH_R	sth	%r30, [%r7 + %r14]
	.word 0xe2216764  ! 64: STW_I	stw	%r17, [%r5 + 0x0764]
	.word 0xfeb1d00e  ! 64: STHA_R	stha	%r31, [%r7 + %r14] 0x80
	.word 0xee29000d  ! 66: STB_R	stb	%r23, [%r4 + %r13]
thr0_irf_ce_6:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_6), 16, 16), 1,IRF,ce,38,x, x,x,x, x,x,x)
	.word 0xf02a24c0  ! 67: STB_I	stb	%r24, [%r8 + 0x04c0]
	.word 0xec71000c  ! 67: STX_R	stx	%r22, [%r4 + %r12]
	.word 0xebf1200c  ! 67: CASXA_R	casxa	[%r4]%asi, %r12, %r21
	.word 0xf8f9a774  ! 68: SWAPA_I	swapa	%r28, [%r6 + 0x0774] %asi
	.word 0xfa28ee27  ! 70: STB_I	stb	%r29, [%r3 + 0x0e27]
thr0_resum_intr_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_4), 16, 16)) -> intp(1, 3, 1)
	.word 0xbe70e234  ! 70: UDIV_I	udiv 	%r3, 0x0234, %r31
	.word 0x8143e044  ! 71: MEMBAR	membar	#LoadStore | #Sync 
	.word 0xe6322f64  ! 73: STH_I	sth	%r19, [%r8 + 0x0f64]
thr0_ic_err_5:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,33,x)
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf721610c  ! 75: STF_I	st	%f27, [0x010c, %r5]
	.word 0xfa29a62b  ! 77: STB_I	stb	%r29, [%r6 + 0x062b]
thr0_irf_ce_7:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_7), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xfc7225e8  ! 78: STX_I	stx	%r30, [%r8 + 0x05e8]
	.word 0xfa72000c  ! 78: STX_R	stx	%r29, [%r8 + %r12]
	.word 0xee21ed68  ! 78: STW_I	stw	%r23, [%r7 + 0x0d68]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,24)
	.word 0xee51c009  ! 80: LDSH_R	ldsh	[%r7 + %r9], %r23
	.word 0xc4f00980  ! 82: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfa2126ec  ! 84: STW_I	stw	%r29, [%r4 + 0x06ec]
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,15)
	.word 0xfa190009  ! 85: LDD_R	ldd	[%r4 + %r9], %r29
	.word 0xf829000e  ! 87: STB_R	stb	%r28, [%r4 + %r14]
thr0_resum_intr_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_5), 16, 16)) -> intp(1, 3, 1)
	.word 0xf83123f3  ! 87: STH_I	sth	%r28, [%r4 + 0x03f3]
	.word 0xef21800e  ! 88: STF_R	st	%f23, [%r14, %r6]
	.word 0xe83123aa  ! 90: STH_I	sth	%r20, [%r4 + 0x03aa]
	.word 0xf221000b  ! 90: STW_R	stw	%r25, [%r4 + %r11]
	.word 0xf739e9a0  ! 90: STDF_I	std	%f27, [0x09a0, %r7]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfa59e850  ! 92: LDX_I	ldx	[%r7 + 0x0850], %r29
	.word 0xfc71c00b  ! 94: STX_R	stx	%r30, [%r7 + %r11]
thr0_ic_err_6:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,8,2)
	.word 0xf2222e94  ! 95: STW_I	stw	%r25, [%r8 + 0x0e94]
	.word 0xf23164f4  ! 95: STH_I	sth	%r25, [%r5 + 0x04f4]
	.word 0xf032277e  ! 96: STH_I	sth	%r24, [%r8 + 0x077e]
thr0_ic_err_7:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xf6292aaa  ! 97: STB_I	stb	%r27, [%r4 + 0x0aaa]
thr0_ic_err_8:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,IR_NIR,29,10)
	.word 0xf0322d56  ! 98: STH_I	sth	%r24, [%r8 + 0x0d56]
	.word 0xe831000f  ! 98: STH_R	sth	%r20, [%r4 + %r15]
	.word 0xe671ab30  ! 98: STX_I	stx	%r19, [%r6 + 0x0b30]
	.word 0xfa216518  ! 99: STW_I	stw	%r29, [%r5 + 0x0518]
thr0_resum_intr_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_6), 16, 16)) -> intp(1, 3, 1)
	.word 0xe471000c  ! 100: STX_R	stx	%r18, [%r4 + %r12]
thr0_resum_intr_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_7), 16, 16)) -> intp(1, 3, 1)
	.word 0xe669400d  ! 100: LDSTUB_R	ldstub	%r19, [%r5 + %r13]
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xeaf8d00d  ! 103: SWAPA_R	swapa	%r21, [%r3 + %r13] 0x80
	.word 0xf210e23a  ! 104: LDUH_I	lduh	[%r3 + 0x023a], %r25
	.word 0xf821a138  ! 106: STW_I	stw	%r28, [%r6 + 0x0138]
thr0_resum_intr_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_8), 16, 16)) -> intp(1, 3, 1)
	.word 0xfc31800b  ! 107: STH_R	sth	%r30, [%r6 + %r11]
thr0_irf_ce_8:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_8), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf80a2651  ! 107: LDUB_I	ldub	[%r8 + 0x0651], %r28
	.word 0xf832000b  ! 108: STH_R	sth	%r28, [%r8 + %r11]
	.word 0xee20ee4c  ! 110: STW_I	stw	%r23, [%r3 + 0x0e4c]
thr0_resum_intr_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_9), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc4f00c00  ! 112: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf4222fa0  ! 115: STW_I	stw	%r26, [%r8 + 0x0fa0]
	.word 0xe670c00e  ! 115: STX_R	stx	%r19, [%r3 + %r14]
	.word 0xf272000f  ! 116: STX_R	stx	%r25, [%r8 + %r15]
thr0_resum_intr_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_10), 16, 16)) -> intp(1, 3, 1)
	.word 0xf429c00c  ! 117: STB_R	stb	%r26, [%r7 + %r12]
	.word 0xe831000d  ! 117: STH_R	sth	%r20, [%r4 + %r13]
	.word 0xea31e122  ! 117: STH_I	sth	%r21, [%r7 + 0x0122]
	.word 0xee21000f  ! 117: STW_R	stw	%r23, [%r4 + %r15]
	.word 0xee31c00b  ! 117: STH_R	sth	%r23, [%r7 + %r11]
	.word 0xf6312f1c  ! 117: STH_I	sth	%r27, [%r4 + 0x0f1c]
	.word 0xf6222cf0  ! 118: STW_I	stw	%r27, [%r8 + 0x0cf0]
	.word 0xea31a98c  ! 118: STH_I	sth	%r21, [%r6 + 0x098c]
	.word 0xe2696004  ! 118: LDSTUB_I	ldstub	%r17, [%r5 + 0x0004]
	.word 0xe2316305  ! 119: STH_I	sth	%r17, [%r5 + 0x0305]
	.word 0xf270c00d  ! 121: STX_R	stx	%r25, [%r3 + %r13]
thr0_ic_err_9:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xe93a2ad0  ! 121: STDF_I	std	%f20, [0x0ad0, %r8]
	.word 0xe921800e  ! 122: STF_R	st	%f20, [%r14, %r6]
	.word 0xf4f9e1d4  ! 123: SWAPA_I	swapa	%r26, [%r7 + 0x01d4] %asi
	.word 0xf421c00e  ! 124: STW_R	stw	%r26, [%r7 + %r14]
	.word 0xfd22000f  ! 125: STF_R	st	%f30, [%r15, %r8]
	.word 0xbd31e001  ! 127: SRL_I	srl 	%r7, 0x0001, %r30
	.word 0xbe30c00b  ! 127: ORN_R	orn 	%r3, %r11, %r31
	.word 0xa621c00d  ! 127: SUB_R	sub 	%r7, %r13, %r19
	.word 0xf429c00f  ! 128: STB_R	stb	%r26, [%r7 + %r15]
thr0_resum_intr_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_11), 16, 16)) -> intp(1, 3, 1)
	.word 0xe809645c  ! 128: LDUB_I	ldub	[%r5 + 0x045c], %r20
	.word 0xe939a8d0  ! 129: STDF_I	std	%f20, [0x08d0, %r6]
	.word 0xe8e9d00c  ! 130: LDSTUBA_R	ldstuba	%r20, [%r7 + %r12] 0x80
	.word 0xea21a558  ! 132: STW_I	stw	%r21, [%r6 + 0x0558]
	.word 0xfe3120da  ! 132: STH_I	sth	%r31, [%r4 + 0x00da]
	.word 0xf27163f0  ! 132: STX_I	stx	%r25, [%r5 + 0x03f0]
	.word 0xea28c00f  ! 132: STB_R	stb	%r21, [%r3 + %r15]
	.word 0xe830ebb4  ! 132: STH_I	sth	%r20, [%r3 + 0x0bb4]
	.word 0xe321e880  ! 132: STF_I	st	%f17, [0x0880, %r7]
	.word 0xe8a1100b  ! 133: STWA_R	stwa	%r20, [%r4 + %r11] 0x80
	.word 0xea29000c  ! 135: STB_R	stb	%r21, [%r4 + %r12]
thr0_resum_intr_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_12), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 136: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe920c00f  ! 137: STF_R	st	%f20, [%r15, %r3]
	.word 0xee716918  ! 139: STX_I	stx	%r23, [%r5 + 0x0918]
thr0_resum_intr_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_13), 16, 16)) -> intp(1, 3, 1)
	.word 0xf871af60  ! 140: STX_I	stx	%r28, [%r6 + 0x0f60]
thr0_irf_ce_9:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_9), 16, 16), 1,IRF,ce,41,x, x,x,x, x,x,x)
	.word 0xe8496c3c  ! 140: LDSB_I	ldsb	[%r5 + 0x0c3c], %r20
	.word 0xfe296c9b  ! 142: STB_I	stb	%r31, [%r5 + 0x0c9b]
thr0_resum_intr_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_14), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xb011896d  ! 143: OR_R	or 	%r6, %r13, %r24
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfe216f0d  ! 145: STW_I	stw	%r31, [%r5 + 0x0f0d]
	.word 0xee21400b  ! 147: STW_R	stw	%r23, [%r5 + %r11]
	.word 0xec31400f  ! 147: STH_R	sth	%r22, [%r5 + %r15]
	.word 0xe670e1c8  ! 147: STX_I	stx	%r19, [%r3 + 0x01c8]
	.word 0xfe2228e4  ! 147: STW_I	stw	%r31, [%r8 + 0x08e4]
	.word 0xf4322428  ! 147: STH_I	sth	%r26, [%r8 + 0x0428]
	.word 0xfe29400b  ! 147: STB_R	stb	%r31, [%r5 + %r11]
	.word 0xe6292341  ! 147: STB_I	stb	%r19, [%r4 + 0x0341]
	.word 0xec31000c  ! 148: STH_R	sth	%r22, [%r4 + %r12]
thr0_resum_intr_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_15), 16, 16)) -> intp(1, 3, 1)
	.word 0xe6a8d00c  ! 148: STBA_R	stba	%r19, [%r3 + %r12] 0x80
	.word 0xf739800e  ! 149: STDF_R	std	%f27, [%r14, %r6]
	.word 0xf4722260  ! 151: STX_I	stx	%r26, [%r8 + 0x0260]
	.word 0xfe71c00e  ! 151: STX_R	stx	%r31, [%r7 + %r14]
	.word 0xea71000d  ! 151: STX_R	stx	%r21, [%r4 + %r13]
	.word 0xf4222d3c  ! 151: STW_I	stw	%r26, [%r8 + 0x0d3c]
	.word 0xfa216fb4  ! 151: STW_I	stw	%r29, [%r5 + 0x0fb4]
	.word 0xfc21aeb4  ! 151: STW_I	stw	%r30, [%r6 + 0x0eb4]
	.word 0xf4722478  ! 151: STX_I	stx	%r26, [%r8 + 0x0478]
	.word 0xe8b8d00c  ! 151: STDA_R	stda	%r20, [%r3 + %r12] 0x80
	.word 0xf211a4fe  ! 152: LDUH_I	lduh	[%r6 + 0x04fe], %r25
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe470c00f  ! 156: STX_R	stx	%r18, [%r3 + %r15]
	.word 0xf031000c  ! 156: STH_R	sth	%r24, [%r4 + %r12]
	.word 0xe829a40c  ! 156: STB_I	stb	%r20, [%r6 + 0x040c]
	.word 0xec29c00b  ! 156: STB_R	stb	%r22, [%r7 + %r11]
	.word 0xfa70c00d  ! 156: STX_R	stx	%r29, [%r3 + %r13]
!Generating an illinst
	.word 0xb539bb21  ! 157: SRA_I	srax	%r6, 0x0021, %r26
	.word 0xfa70e431  ! 158: STX_I	stx	%r29, [%r3 + 0x0431]
	.word 0xb019a5ae  ! 160: XOR_I	xor 	%r6, 0x05ae, %r24
	.word 0xa239c00e  ! 160: XNOR_R	xnor 	%r7, %r14, %r17
	.word 0xbd39e001  ! 160: SRA_I	sra 	%r7, 0x0001, %r30
	.word 0xa331400b  ! 160: SRL_R	srl 	%r5, %r11, %r17
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe229400b  ! 161: STB_R	stb	%r17, [%r5 + %r11]
	.word 0xf9392528  ! 162: STDF_I	std	%f28, [0x0528, %r4]
	.word 0xf229a87f  ! 164: STB_I	stb	%r25, [%r6 + 0x087f]
	.word 0xec29800c  ! 164: STB_R	stb	%r22, [%r6 + %r12]
	.word 0xfa30ea2e  ! 164: STH_I	sth	%r29, [%r3 + 0x0a2e]
	.word 0xf029c00d  ! 164: STB_R	stb	%r24, [%r7 + %r13]
	.word 0xf22a27ae  ! 164: STB_I	stb	%r25, [%r8 + 0x07ae]
	.word 0xee71800d  ! 165: STX_R	stx	%r23, [%r6 + %r13]
thr0_resum_intr_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_16), 16, 16)) -> intp(1, 3, 1)
	.word 0xe829800d  ! 166: STB_R	stb	%r20, [%r6 + %r13]
thr0_ic_err_10:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_10), 16, 16),1,IC_DATA,IR,30,x)
	.word 0xea79400e  ! 166: SWAP_R	swap	%r21, [%r5 + %r14]
	.word 0xa9782401  ! 168: MOVR_I	move	%r0, 0xfffffed8, %r20
	.word 0xb5392001  ! 168: SRA_I	sra 	%r4, 0x0001, %r26
	.word 0xbd29900f  ! 168: SLLX_R	sllx	%r6, %r15, %r30
	.word 0xe4116144  ! 168: LDUH_I	lduh	[%r5 + 0x0144], %r18
	.word 0xf821400f  ! 170: STW_R	stw	%r28, [%r5 + %r15]
thr0_ic_err_11:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_11), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xbba2092f  ! 170: FMULs	fmuls	%f8, %f15, %f29
	.word 0xe42968f6  ! 172: STB_I	stb	%r18, [%r5 + 0x08f6]
thr0_ic_err_12:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_12), 16, 16),1,IC_DATA,NIR,x,2)
	.word 0xf40969af  ! 172: LDUB_I	ldub	[%r5 + 0x09af], %r26
	.word 0xf6212c78  ! 174: STW_I	stw	%r27, [%r4 + 0x0c78]
	.word 0xfe21e684  ! 174: STW_I	stw	%r31, [%r7 + 0x0684]
	.word 0xedf1a00b  ! 174: CASXA_R	casxa	[%r6]%asi, %r11, %r22
	.word 0xec29a73d  ! 175: STB_I	stb	%r22, [%r6 + 0x073d]
	.word 0xb411c00b  ! 177: OR_R	or 	%r7, %r11, %r26
	.word 0xa63a000e  ! 177: XNOR_R	xnor 	%r8, %r14, %r19
	.word 0xee722dc0  ! 178: STX_I	stx	%r23, [%r8 + 0x0dc0]
	.word 0xee70ee70  ! 178: STX_I	stx	%r23, [%r3 + 0x0e70]
	.word 0xec20e9a8  ! 178: STW_I	stw	%r22, [%r3 + 0x09a8]
	.word 0xe222000e  ! 178: STW_R	stw	%r17, [%r8 + %r14]
	.word 0xfe716370  ! 178: STX_I	stx	%r31, [%r5 + 0x0370]
	.word 0xf83223a0  ! 179: STH_I	sth	%r28, [%r8 + 0x03a0]
thr0_irf_ce_10:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_10), 16, 16), 1,IRF,ce,55,x, x,x,x, x,x,x)
	.word 0xf629263a  ! 180: STB_I	stb	%r27, [%r4 + 0x063a]
	.word 0xe47124e0  ! 180: STX_I	stx	%r18, [%r4 + 0x04e0]
	.word 0xf8216410  ! 180: STW_I	stw	%r28, [%r5 + 0x0410]
	.word 0xe829000d  ! 180: STB_R	stb	%r20, [%r4 + %r13]
	.word 0xf6ea100b  ! 180: LDSTUBA_R	ldstuba	%r27, [%r8 + %r11] 0x80
	.word 0xeee8d00b  ! 181: LDSTUBA_R	ldstuba	%r23, [%r3 + %r11] 0x80
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xec20e4ec  ! 184: STW_I	stw	%r22, [%r3 + 0x04ec]
thr0_ic_err_13:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_13), 16, 16),1,IC_DATA,IR,21,x)
	.word 0xba11400b  ! 185: OR_R	or 	%r5, %r11, %r29
	.word 0xad31d00f  ! 185: SRLX_R	srlx	%r7, %r15, %r22
	.word 0xaa0165b0  ! 185: ADD_I	add 	%r5, 0x05b0, %r21
	.word 0xb539800c  ! 185: SRA_R	sra 	%r6, %r12, %r26
	.word 0xe410ee1e  ! 185: LDUH_I	lduh	[%r3 + 0x0e1e], %r18
	.word 0xf231800e  ! 187: STH_R	sth	%r25, [%r6 + %r14]
thr0_irf_ce_11:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_11), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xec30c00b  ! 188: STH_R	sth	%r22, [%r3 + %r11]
	.word 0xe821000d  ! 188: STW_R	stw	%r20, [%r4 + %r13]
	.word 0xfc22000b  ! 188: STW_R	stw	%r30, [%r8 + %r11]
	.word 0xe271400f  ! 188: STX_R	stx	%r17, [%r5 + %r15]
	.word 0xf071c00e  ! 188: STX_R	stx	%r24, [%r7 + %r14]
	.word 0xf4222444  ! 188: STW_I	stw	%r26, [%r8 + 0x0444]
	.word 0xb9782401  ! 189: MOVR_I	move	%r0, 0xfffffed8, %r28
	.word 0xb5317001  ! 189: SRLX_I	srlx	%r5, 0x0001, %r26
	.word 0xfc21400f  ! 190: STW_R	stw	%r30, [%r5 + %r15]
thr0_irf_ce_12:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_12), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xf431ed96  ! 191: STH_I	sth	%r26, [%r7 + 0x0d96]
thr0_ic_err_14:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_14), 16, 16),1,IC_DATA,IR_NIR,10,32)
	.word 0x81d9400e  ! 191: FLUSH_R	dis not found

	.word 0xe221a5c8  ! 193: STW_I	stw	%r17, [%r6 + 0x05c8]
thr0_irf_ce_13:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_13), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe231a23f  ! 193: STH_I	sth	%r17, [%r6 + 0x023f]
	.word 0xe521800e  ! 194: STF_R	st	%f18, [%r14, %r6]
	.word 0xecf8d00c  ! 195: SWAPA_R	swapa	%r22, [%r3 + %r12] 0x80
	.word 0xec70e199  ! 196: STX_I	stx	%r22, [%r3 + 0x0199]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf4222930  ! 199: STW_I	stw	%r26, [%r8 + 0x0930]
	.word 0xe670ed28  ! 200: STX_I	stx	%r19, [%r3 + 0x0d28]
	.word 0xf6296bb1  ! 200: STB_I	stb	%r27, [%r5 + 0x0bb1]
	.word 0xfa29400d  ! 200: STB_R	stb	%r29, [%r5 + %r13]
	.word 0xfe21400c  ! 200: STW_R	stw	%r31, [%r5 + %r12]
	.word 0xf670c00e  ! 200: STX_R	stx	%r27, [%r3 + %r14]
	.word 0xee29400d  ! 201: STB_R	stb	%r23, [%r5 + %r13]
	.word 0xfc72000b  ! 201: STX_R	stx	%r30, [%r8 + %r11]
	.word 0xe620c00e  ! 201: STW_R	stw	%r19, [%r3 + %r14]
	.word 0xec29c00f  ! 201: STB_R	stb	%r22, [%r7 + %r15]
	.word 0xee2a000f  ! 201: STB_R	stb	%r23, [%r8 + %r15]
	.word 0xfc70ed58  ! 201: STX_I	stx	%r30, [%r3 + 0x0d58]
	.word 0xe2f9d00c  ! 201: SWAPA_R	swapa	%r17, [%r7 + %r12] 0x80
	.word 0xfd21800f  ! 202: STF_R	st	%f30, [%r15, %r6]
	.word 0xee71aaf8  ! 204: STX_I	stx	%r23, [%r6 + 0x0af8]
thr0_ic_err_15:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_15), 16, 16),1,IC_DATA,NIR,x,11)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xf521000e  ! 205: STF_R	st	%f26, [%r14, %r4]
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfdf1e00f  ! 207: CASXA_R	casxa	[%r7]%asi, %r15, %r30
	.word 0xfc21c00f  ! 208: STW_R	stw	%r30, [%r7 + %r15]
	.word 0xe8412bfc  ! 209: LDSW_I	ldsw	[%r4 + 0x0bfc], %r20
	.word 0xece960e3  ! 210: LDSTUBA_I	ldstuba	%r22, [%r5 + 0x00e3] %asi
	.word 0xf429800e  ! 212: STB_R	stb	%r26, [%r6 + %r14]
thr0_ic_err_16:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_16), 16, 16),1,IC_DATA,IR_NIR,17,24)
	.word 0xf431800e  ! 212: STH_R	sth	%r26, [%r6 + %r14]
	.word 0xa9a1482e  ! 213: FADDs	fadds	%f5, %f14, %f20
	.word 0xea2962b6  ! 215: STB_I	stb	%r21, [%r5 + 0x02b6]
thr0_irf_ce_14:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_14), 16, 16), 1,IRF,ce,3,x, x,x,x, x,x,x)
	.word 0xfcba2bb8  ! 215: STDA_I	stda	%r30, [%r8 + 0x0bb8] %asi
	.word 0xfe72000e  ! 216: STX_R	stx	%r31, [%r8 + %r14]
	.word 0xf031a80c  ! 218: STH_I	sth	%r24, [%r6 + 0x080c]
	.word 0xf4292ad5  ! 218: STB_I	stb	%r26, [%r4 + 0x0ad5]
	.word 0xe421e690  ! 218: STW_I	stw	%r18, [%r7 + 0x0690]
	.word 0xeca9d00b  ! 218: STBA_R	stba	%r22, [%r7 + %r11] 0x80
	.word 0xe229000d  ! 220: STB_R	stb	%r17, [%r4 + %r13]
thr0_ic_err_17:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_17), 16, 16),1,IC_DATA,IR_NIR,29,6)
	.word 0xe221000d  ! 220: STW_R	stw	%r17, [%r4 + %r13]
	.word 0xf671800f  ! 222: STX_R	stx	%r27, [%r6 + %r15]
	.word 0xe629000f  ! 223: STB_R	stb	%r19, [%r4 + %r15]
!Generating an illinst
	.word 0xa9319d4f  ! 224: SRLX_R	srlx	%r6, %r15, %r20
	.word 0xf4f92b8c  ! 225: SWAPA_I	swapa	%r26, [%r4 + 0x0b8c] %asi
	.word 0xe5e0d00e  ! 226: CASA_I	casa	[%r3] 0x80, %r14, %r18
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf6216cdc  ! 229: STW_I	stw	%r27, [%r5 + 0x0cdc]
thr0_irf_ce_15:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_15), 16, 16), 1,IRF,ce,64,x, x,x,x, x,x,x)
	.word 0xa93a2001  ! 230: SRA_I	sra 	%r8, 0x0001, %r20
	.word 0xba112341  ! 230: OR_I	or 	%r4, 0x0341, %r29
	.word 0xe5e0d00c  ! 230: CASA_I	casa	[%r3] 0x80, %r12, %r18
	.word 0xc0f009a0  ! 232: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf018e050  ! 233: LDD_I	ldd	[%r3 + 0x0050], %r24
	.word 0xf230ecf9  ! 234: STH_I	sth	%r25, [%r3 + 0x0cf9]
	.word 0xf621e974  ! 236: STW_I	stw	%r27, [%r7 + 0x0974]
thr0_irf_ce_16:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_16), 16, 16), 1,IRF,ce,19,x, x,x,x, x,x,x)
	.word 0xe83125a6  ! 237: STH_I	sth	%r20, [%r4 + 0x05a6]
thr0_resum_intr_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_17), 16, 16)) -> intp(1, 3, 1)
	.word 0xfca8d00b  ! 237: STBA_R	stba	%r30, [%r3 + %r11] 0x80
	.word 0xee31000e  ! 239: STH_R	sth	%r23, [%r4 + %r14]
	.word 0xfc31e7e4  ! 239: STH_I	sth	%r30, [%r7 + 0x07e4]
	.word 0xee71800b  ! 239: STX_R	stx	%r23, [%r6 + %r11]
	.word 0xee31000c  ! 239: STH_R	sth	%r23, [%r4 + %r12]
	.word 0xf421e594  ! 240: STW_I	stw	%r26, [%r7 + 0x0594]
thr0_ic_err_18:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_18), 16, 16),1,IC_DATA,IR,4,x)
!Generating an illinst
	.word 0xaa396de2  ! 241: XNOR_I	xnor 	%r5, 0x0de2, %r21
	.word 0xf4b1d00d  ! 242: STHA_R	stha	%r26, [%r7 + %r13] 0x80
	.word 0xec20e8ec  ! 244: STW_I	stw	%r22, [%r3 + 0x08ec]
thr0_irf_ce_17:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_17), 16, 16), 1,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xe671800e  ! 245: STX_R	stx	%r19, [%r6 + %r14]
thr0_ic_err_19:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_19), 16, 16),1,IC_DATA,NIR,x,26)
	.word 0xf4316130  ! 246: STH_I	sth	%r26, [%r5 + 0x0130]
thr0_resum_intr_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_18), 16, 16)) -> intp(1, 3, 1)
	.word 0xf431400e  ! 246: STH_R	sth	%r26, [%r5 + %r14]
	.word 0xf02a000f  ! 248: STB_R	stb	%r24, [%r8 + %r15]
	.word 0xee32000d  ! 248: STH_R	sth	%r23, [%r8 + %r13]
	.word 0xf831ea76  ! 248: STH_I	sth	%r28, [%r7 + 0x0a76]
	.word 0xfe29800b  ! 248: STB_R	stb	%r31, [%r6 + %r11]
	.word 0xfc22000d  ! 248: STW_R	stw	%r30, [%r8 + %r13]
	.word 0xfc716700  ! 249: STX_I	stx	%r30, [%r5 + 0x0700]
thr0_irf_ce_18:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_18), 16, 16), 1,IRF,ce,17,x, x,x,x, x,x,x)
	.word 0xe8316270  ! 250: STH_I	sth	%r20, [%r5 + 0x0270]
	.word 0xe63229d6  ! 250: STH_I	sth	%r19, [%r8 + 0x09d6]
	.word 0xf229c00f  ! 250: STB_R	stb	%r25, [%r7 + %r15]
	.word 0xb739a001  ! 251: SRA_I	sra 	%r6, 0x0001, %r27
	.word 0xee41a8ac  ! 251: LDSW_I	ldsw	[%r6 + 0x08ac], %r23
	.word 0xf4f2100b  ! 252: STXA_R	stxa	%r26, [%r8 + %r11] 0x80
	.word 0xe87162e0  ! 254: STX_I	stx	%r20, [%r5 + 0x02e0]
thr0_ic_err_20:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_20), 16, 16),1,IC_DATA,IR_NIR,18,14)
	.word 0x81d9000f  ! 254: FLUSH_R	dis not found

	.word 0xfd22000c  ! 255: STF_R	st	%f30, [%r12, %r8]
	.word 0xeca1d00c  ! 256: STWA_R	stwa	%r22, [%r7 + %r12] 0x80
	.word 0xfa292c73  ! 258: STB_I	stb	%r29, [%r4 + 0x0c73]
thr0_irf_ce_19:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_19), 16, 16), 1,IRF,ce,67,x, x,x,x, x,x,x)
	.word 0xc3e92105  ! 258: PREFETCHA_I	prefetcha	[%r4, + 0x0105] %asi, #one_read
	.word 0xfa312ae5  ! 259: STH_I	sth	%r29, [%r4 + 0x0ae5]
	.word 0xfe31adc4  ! 261: STH_I	sth	%r31, [%r6 + 0x0dc4]
thr0_irf_ce_20:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_20), 16, 16), 1,IRF,ce,35,x, x,x,x, x,x,x)
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xc0f00960  ! 263: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe71400b  ! 265: STX_R	stx	%r31, [%r5 + %r11]
thr0_ic_err_21:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_21), 16, 16),1,IC_DATA,NIR,x,17)
	.word 0xe231ebf8  ! 266: STH_I	sth	%r17, [%r7 + 0x0bf8]
	.word 0xf222000f  ! 266: STW_R	stw	%r25, [%r8 + %r15]
	.word 0xe2212a60  ! 266: STW_I	stw	%r17, [%r4 + 0x0a60]
	.word 0xc0f00960  ! 267: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xee31800d  ! 269: STH_R	sth	%r23, [%r6 + %r13]
thr0_resum_intr_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_19), 16, 16)) -> intp(1, 3, 1)
	.word 0xf8f2100e  ! 269: STXA_R	stxa	%r28, [%r8 + %r14] 0x80
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,55)
	.word 0xf8120009  ! 271: LDUH_R	lduh	[%r8 + %r9], %r28
	.word 0xfc31400b  ! 273: STH_R	sth	%r30, [%r5 + %r11]
thr0_ic_err_22:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_22), 16, 16),1,IC_DATA,IR_NIR,12,23)
	.word 0xf621c00f  ! 274: STW_R	stw	%r27, [%r7 + %r15]
	.word 0xe432000e  ! 274: STH_R	sth	%r18, [%r8 + %r14]
	.word 0xf02a2a7d  ! 274: STB_I	stb	%r24, [%r8 + 0x0a7d]
	.word 0xe431a88c  ! 274: STH_I	sth	%r18, [%r6 + 0x088c]
	.word 0xe832000f  ! 274: STH_R	sth	%r20, [%r8 + %r15]
	.word 0xe229aa23  ! 274: STB_I	stb	%r17, [%r6 + 0x0a23]
	.word 0xe2b1edd6  ! 274: STHA_I	stha	%r17, [%r7 + 0x0dd6] %asi
	.word 0xf031c00c  ! 276: STH_R	sth	%r24, [%r7 + %r12]
thr0_irf_ce_21:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_21), 16, 16), 1,IRF,ce,26,x, x,x,x, x,x,x)
	.word 0xe2a9500d  ! 276: STBA_R	stba	%r17, [%r5 + %r13] 0x80
	.word 0xf4f0e130  ! 277: STXA_I	stxa	%r26, [%r3 + 0x0130] %asi
	.word 0xe221400d  ! 279: STW_R	stw	%r17, [%r5 + %r13]
thr0_irf_ce_22:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_22), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xbc29400f  ! 280: ANDN_R	andn 	%r5, %r15, %r30
	.word 0xbb31900f  ! 280: SRLX_R	srlx	%r6, %r15, %r29
	.word 0xa4296d13  ! 280: ANDN_I	andn 	%r5, 0x0d13, %r18
	.word 0xfae9900b  ! 280: LDSTUBA_R	ldstuba	%r29, [%r6 + %r11] 0x80
	.word 0xeb216694  ! 281: STF_I	st	%f21, [0x0694, %r5]
	.word 0xa849eea0  ! 282: MULX_I	mulx 	%r7, 0x0ea0, %r20
	.word 0xf0322af4  ! 284: STH_I	sth	%r24, [%r8 + 0x0af4]
	.word 0xf229000f  ! 284: STB_R	stb	%r25, [%r4 + %r15]
	.word 0xed21800c  ! 284: STF_R	st	%f22, [%r12, %r6]
	.word 0xf939000e  ! 285: STDF_R	std	%f28, [%r14, %r4]
	.word 0xe821c00f  ! 287: STW_R	stw	%r20, [%r7 + %r15]
	.word 0xf821a0b4  ! 287: STW_I	stw	%r28, [%r6 + 0x00b4]
	.word 0xf631a338  ! 287: STH_I	sth	%r27, [%r6 + 0x0338]
	.word 0xf471c00c  ! 287: STX_R	stx	%r26, [%r7 + %r12]
	.word 0xfa30c00b  ! 287: STH_R	sth	%r29, [%r3 + %r11]
	.word 0xea29e364  ! 287: STB_I	stb	%r21, [%r7 + 0x0364]
	.word 0x8143c000  ! 287: STBAR	stbar
	.word 0xe229a8b1  ! 289: STB_I	stb	%r17, [%r6 + 0x08b1]
thr0_resum_intr_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_20), 16, 16)) -> intp(1, 3, 1)
	.word 0xf5e1500e  ! 289: CASA_I	casa	[%r5] 0x80, %r14, %r26
	.word 0xf851ae34  ! 290: LDSH_I	ldsh	[%r6 + 0x0e34], %r28
	.word 0xf829acfb  ! 291: STB_I	stb	%r28, [%r6 + 0x0cfb]
	.word 0xa839a782  ! 293: XNOR_I	xnor 	%r6, 0x0782, %r20
	.word 0xbb3a3001  ! 293: SRAX_I	srax	%r8, 0x0001, %r29
	.word 0xb819218d  ! 293: XOR_I	xor 	%r4, 0x018d, %r28
	.word 0xe471add8  ! 294: STX_I	stx	%r18, [%r6 + 0x0dd8]
thr0_ic_err_23:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_23), 16, 16),1,IC_DATA,NIR,x,13)
	.word 0xea122db6  ! 294: LDUH_I	lduh	[%r8 + 0x0db6], %r21
	.word 0xed39c00f  ! 295: STDF_R	std	%f22, [%r15, %r7]
	.word 0xf62a000f  ! 297: STB_R	stb	%r27, [%r8 + %r15]
	.word 0xee212ccc  ! 297: STW_I	stw	%r23, [%r4 + 0x0ccc]
	.word 0xfa21ab48  ! 297: STW_I	stw	%r29, [%r6 + 0x0b48]
	.word 0xfd222da8  ! 297: STF_I	st	%f30, [0x0da8, %r8]
	.word 0xe53a000b  ! 298: STDF_R	std	%f18, [%r11, %r8]
	.word 0xe871400c  ! 300: STX_R	stx	%r20, [%r5 + %r12]
thr0_ic_err_24:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_24), 16, 16),1,IC_DATA,IR,15,x)
	.word 0xc4f00c00  ! 301: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf339e660  ! 302: STDF_I	std	%f25, [0x0660, %r7]
	.word 0xfea9d00c  ! 303: STBA_R	stba	%r31, [%r7 + %r12] 0x80
	.word 0xe231e0be  ! 305: STH_I	sth	%r17, [%r7 + 0x00be]
	.word 0xf0f22788  ! 305: STXA_I	stxa	%r24, [%r8 + 0x0788] %asi
	.word 0xf268c00b  ! 306: LDSTUB_R	ldstub	%r25, [%r3 + %r11]
	.word 0xf271ee78  ! 308: STX_I	stx	%r25, [%r7 + 0x0e78]
thr0_resum_intr_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_21), 16, 16)) -> intp(1, 3, 1)
	.word 0xe5f0e00d  ! 308: CASXA_R	casxa	[%r3]%asi, %r13, %r18
	.word 0xf23227e2  ! 310: STH_I	sth	%r25, [%r8 + 0x07e2]
	.word 0xec31800d  ! 310: STH_R	sth	%r22, [%r6 + %r13]
	.word 0xf429400e  ! 310: STB_R	stb	%r26, [%r5 + %r14]
	.word 0xf220eb84  ! 310: STW_I	stw	%r25, [%r3 + 0x0b84]
	.word 0xf0316950  ! 310: STH_I	sth	%r24, [%r5 + 0x0950]
	.word 0xf8712290  ! 310: STX_I	stx	%r28, [%r4 + 0x0290]
	.word 0xfa21c00b  ! 311: STW_R	stw	%r29, [%r7 + %r11]
thr0_irf_ce_23:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_23), 16, 16), 1,IRF,ce,4,x, x,x,x, x,x,x)
	.word 0x8143e039  ! 311: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
	.word 0xfa71e9ab  ! 312: STX_I	stx	%r29, [%r7 + 0x09ab]
	.word 0x81d9000f  ! 313: FLUSH_R	dis not found

	.word 0xf821ecb0  ! 315: STW_I	stw	%r28, [%r7 + 0x0cb0]
	.word 0xf428ec1b  ! 315: STB_I	stb	%r26, [%r3 + 0x0c1b]
	.word 0xfc21400e  ! 315: STW_R	stw	%r30, [%r5 + %r14]
	.word 0xf6216748  ! 315: STW_I	stw	%r27, [%r5 + 0x0748]
	.word 0xe8716f18  ! 315: STX_I	stx	%r20, [%r5 + 0x0f18]
	.word 0xea2923dc  ! 315: STB_I	stb	%r21, [%r4 + 0x03dc]
	.word 0xf422000e  ! 316: STW_R	stw	%r26, [%r8 + %r14]
thr0_resum_intr_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_22), 16, 16)) -> intp(1, 3, 1)
	.word 0xe738e5d8  ! 316: STDF_I	std	%f19, [0x05d8, %r3]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe828c00d  ! 319: STB_R	stb	%r20, [%r3 + %r13]
thr0_irf_ce_24:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_24), 16, 16), 1,IRF,ce,9,x, x,x,x, x,x,x)
	.word 0xe42a000f  ! 320: STB_R	stb	%r18, [%r8 + %r15]
thr0_resum_intr_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_23), 16, 16)) -> intp(1, 3, 1)
	.word 0xeb20e168  ! 320: STF_I	st	%f21, [0x0168, %r3]
	.word 0xee2a000f  ! 322: STB_R	stb	%r23, [%r8 + %r15]
thr0_irf_ce_25:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_25), 16, 16), 1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xb41a231b  ! 323: XOR_I	xor 	%r8, 0x031b, %r26
	.word 0xa539500d  ! 323: SRAX_R	srax	%r5, %r13, %r18
	.word 0xaa19e3e3  ! 323: XOR_I	xor 	%r7, 0x03e3, %r21
	.word 0xa829800e  ! 323: ANDN_R	andn 	%r6, %r14, %r20
	.word 0xe6712460  ! 324: STX_I	stx	%r19, [%r4 + 0x0460]
thr0_resum_intr_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_24), 16, 16)) -> intp(1, 3, 1)
	.word 0xfd21c00b  ! 324: STF_R	st	%f30, [%r11, %r7]
	.word 0xec212a34  ! 326: STW_I	stw	%r22, [%r4 + 0x0a34]
thr0_resum_intr_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_25), 16, 16)) -> intp(1, 3, 1)
	.word 0xf8ea27e9  ! 326: LDSTUBA_I	ldstuba	%r28, [%r8 + 0x07e9] %asi
	.word 0xfa71800d  ! 328: STX_R	stx	%r29, [%r6 + %r13]
thr0_irf_ce_26:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_26), 16, 16), 1,IRF,ce,10,x, x,x,x, x,x,x)
	.word 0xe8316a9a  ! 329: STH_I	sth	%r20, [%r5 + 0x0a9a]
thr0_ic_err_25:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_25), 16, 16),1,IC_DATA,IR_NIR,4,2)
	.word 0xe4416e78  ! 329: LDSW_I	ldsw	[%r5 + 0x0e78], %r18
	.word 0xf42a000f  ! 331: STB_R	stb	%r26, [%r8 + %r15]
	.word 0xf621a6a0  ! 332: STW_I	stw	%r27, [%r6 + 0x06a0]
thr0_irf_ce_27:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_27), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	.word 0xf2a22f80  ! 332: STWA_I	stwa	%r25, [%r8 + 0x0f80] %asi
	.word 0xc4f00c00  ! 334: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfa32202a  ! 336: STH_I	sth	%r29, [%r8 + 0x002a]
	.word 0xf028c00e  ! 336: STB_R	stb	%r24, [%r3 + %r14]
	.word 0xe4322154  ! 336: STH_I	sth	%r18, [%r8 + 0x0154]
	.word 0xfa2a000e  ! 336: STB_R	stb	%r29, [%r8 + %r14]
	.word 0xea71a298  ! 336: STX_I	stx	%r21, [%r6 + 0x0298]
	.word 0xaa32000b  ! 337: ORN_R	orn 	%r8, %r11, %r21
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xea322ad7  ! 338: STH_I	sth	%r21, [%r8 + 0x0ad7]
	.word 0xf870c00e  ! 340: STX_R	stx	%r28, [%r3 + %r14]
	.word 0xe471000e  ! 340: STX_R	stx	%r18, [%r4 + %r14]
	.word 0xf431400f  ! 340: STH_R	sth	%r26, [%r5 + %r15]
	.word 0xf431604f  ! 340: STH_I	sth	%r26, [%r5 + 0x004f]
	.word 0xea796e74  ! 341: SWAP_I	swap	%r21, [%r5 + 0x0e74]
	.word 0xe611208a  ! 342: LDUH_I	lduh	[%r4 + 0x008a], %r19
	.word 0xf4b9100b  ! 343: STDA_R	stda	%r26, [%r4 + %r11] 0x80
	.word 0xa259000e  ! 344: SMUL_R	smul 	%r4, %r14, %r17
	.word 0xfa29000c  ! 346: STB_R	stb	%r29, [%r4 + %r12]
thr0_ic_err_26:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_26), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xf848e081  ! 346: LDSB_I	ldsb	[%r3 + 0x0081], %r28
	.word 0xea49a872  ! 347: LDSB_I	ldsb	[%r6 + 0x0872], %r21
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf939ea78  ! 349: STDF_I	std	%f28, [0x0a78, %r7]
	.word 0xe8a1a660  ! 350: STWA_I	stwa	%r20, [%r6 + 0x0660] %asi
	.word 0xf631c00c  ! 352: STH_R	sth	%r27, [%r7 + %r12]
	.word 0xfe28e7a8  ! 352: STB_I	stb	%r31, [%r3 + 0x07a8]
	.word 0xe421800c  ! 352: STW_R	stw	%r18, [%r6 + %r12]
	.word 0xe22a2a36  ! 352: STB_I	stb	%r17, [%r8 + 0x0a36]
	.word 0xe870e440  ! 352: STX_I	stx	%r20, [%r3 + 0x0440]
	.word 0xb8592655  ! 352: SMUL_I	smul 	%r4, 0x0655, %r28
	.word 0xe539ec38  ! 353: STDF_I	std	%f18, [0x0c38, %r7]
	.word 0xea2965ed  ! 355: STB_I	stb	%r21, [%r5 + 0x05ed]
thr0_ic_err_27:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_27), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xf631efe2  ! 356: STH_I	sth	%r27, [%r7 + 0x0fe2]
thr0_resum_intr_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_26), 16, 16)) -> intp(1, 3, 1)
	.word 0xeea9e26a  ! 356: STBA_I	stba	%r23, [%r7 + 0x026a] %asi
	.word 0xf671e9b8  ! 358: STX_I	stx	%r27, [%r7 + 0x09b8]
thr0_resum_intr_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_27), 16, 16)) -> intp(1, 3, 1)
	.word 0xee322ad2  ! 359: STH_I	sth	%r23, [%r8 + 0x0ad2]
thr0_irf_ce_28:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_28), 16, 16), 1,IRF,ce,34,x, x,x,x, x,x,x)
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xfc1a29b8  ! 360: LDD_I	ldd	[%r8 + 0x09b8], %r30
	.word 0xf0316314  ! 362: STH_I	sth	%r24, [%r5 + 0x0314]
thr0_resum_intr_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_28), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 363: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf25165f8  ! 364: LDSH_I	ldsh	[%r5 + 0x05f8], %r25
	.word 0xf621400c  ! 366: STW_R	stw	%r27, [%r5 + %r12]
thr0_resum_intr_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_29), 16, 16)) -> intp(1, 3, 1)
	.word 0xa3312001  ! 367: SRL_I	srl 	%r4, 0x0001, %r17
	.word 0xaa08e906  ! 367: AND_I	and 	%r3, 0x0906, %r21
	.word 0xea32202a  ! 368: STH_I	sth	%r21, [%r8 + 0x002a]
	.word 0xe431400b  ! 368: STH_R	sth	%r18, [%r5 + %r11]
	.word 0xfc222624  ! 368: STW_I	stw	%r30, [%r8 + 0x0624]
	.word 0xe6322684  ! 368: STH_I	sth	%r19, [%r8 + 0x0684]
	.word 0xf450e676  ! 368: LDSH_I	ldsh	[%r3 + 0x0676], %r26
	.word 0xfe29e308  ! 370: STB_I	stb	%r31, [%r7 + 0x0308]
thr0_ic_err_28:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_28), 16, 16),1,IC_DATA,IR_NIR,11,4)
	.word 0xfe21000f  ! 371: STW_R	stw	%r31, [%r4 + %r15]
thr0_resum_intr_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_30), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00980  ! 372: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf4722128  ! 374: STX_I	stx	%r26, [%r8 + 0x0128]
thr0_ic_err_29:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_29), 16, 16),1,IC_DATA,NIR,x,30)
	.word 0xfa712380  ! 375: STX_I	stx	%r29, [%r4 + 0x0380]
	.word 0xe4322f3a  ! 375: STH_I	sth	%r18, [%r8 + 0x0f3a]
	.word 0xf8712718  ! 375: STX_I	stx	%r28, [%r4 + 0x0718]
	.word 0xe269c00b  ! 375: LDSTUB_R	ldstub	%r17, [%r7 + %r11]
	.word 0xe271ebc0  ! 377: STX_I	stx	%r17, [%r7 + 0x0bc0]
thr0_ic_err_30:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_30), 16, 16),1,IC_DATA,NIR,x,10)
	.word 0xedf1d00c  ! 377: CASXA_I	casxa	[%r7] 0x80, %r12, %r22
	.word 0xe2f8d00b  ! 378: SWAPA_R	swapa	%r17, [%r3 + %r11] 0x80
	.word 0xf8b9500e  ! 379: STDA_R	stda	%r28, [%r5 + %r14] 0x80
!Generating an illinst
	.word 0xa929d92f  ! 381: SLL_R	sllx	%r7, %r15, %r20
	.word 0xf45125c8  ! 382: LDSH_I	ldsh	[%r4 + 0x05c8], %r26
	.word 0xf069400c  ! 383: LDSTUB_R	ldstub	%r24, [%r5 + %r12]
	.word 0xfe316926  ! 385: STH_I	sth	%r31, [%r5 + 0x0926]
	.word 0xee71a570  ! 385: STX_I	stx	%r23, [%r6 + 0x0570]
	.word 0xf0216c60  ! 385: STW_I	stw	%r24, [%r5 + 0x0c60]
	.word 0xf049aa03  ! 385: LDSB_I	ldsb	[%r6 + 0x0a03], %r24
	.word 0xf629400e  ! 387: STB_R	stb	%r27, [%r5 + %r14]
thr0_resum_intr_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_31), 16, 16)) -> intp(1, 3, 1)
	.word 0xeef9add4  ! 387: SWAPA_I	swapa	%r23, [%r6 + 0x0dd4] %asi
	.word 0x8143c000  ! 388: STBAR	stbar
	.word 0xb009800f  ! 390: AND_R	and 	%r6, %r15, %r24
	.word 0xbc116c8b  ! 390: OR_I	or 	%r5, 0x0c8b, %r30
	.word 0xb9782401  ! 390: MOVR_I	move	%r0, 0xfffffed8, %r28
	.word 0xae29800d  ! 390: ANDN_R	andn 	%r6, %r13, %r23
	.word 0xe829adc7  ! 391: STB_I	stb	%r20, [%r6 + 0x0dc7]
thr0_ic_err_31:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_31), 16, 16),1,IC_DATA,IR_NIR,24,30)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xc4f00980  ! 393: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xebe0e00e  ! 394: CASA_R	casa	[%r3] %asi, %r14, %r21
	.word 0xf029000e  ! 396: STB_R	stb	%r24, [%r4 + %r14]
	.word 0xf821800c  ! 396: STW_R	stw	%r28, [%r6 + %r12]
	.word 0xf229800c  ! 396: STB_R	stb	%r25, [%r6 + %r12]
	.word 0xf272000b  ! 397: STX_R	stx	%r25, [%r8 + %r11]
	.word 0xe621e220  ! 397: STW_I	stw	%r19, [%r7 + 0x0220]
	.word 0xb009ea77  ! 398: AND_I	and 	%r7, 0x0a77, %r24
	.word 0xedf2100e  ! 398: CASXA_I	casxa	[%r8] 0x80, %r14, %r22
	.word 0xec72000e  ! 399: STX_R	stx	%r22, [%r8 + %r14]
	.word 0xf230c00c  ! 401: STH_R	sth	%r25, [%r3 + %r12]
thr0_resum_intr_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_32), 16, 16)) -> intp(1, 3, 1)
	.word 0xfe0a2ee8  ! 401: LDUB_I	ldub	[%r8 + 0x0ee8], %r31
	.word 0xad31800c  ! 403: SRL_R	srl 	%r6, %r12, %r22
	.word 0xf5212798  ! 403: STF_I	st	%f26, [0x0798, %r4]
	.word 0xfb39000d  ! 404: STDF_R	std	%f29, [%r13, %r4]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe2316550  ! 408: STH_I	sth	%r17, [%r5 + 0x0550]
	.word 0xec30ed36  ! 408: STH_I	sth	%r22, [%r3 + 0x0d36]
	.word 0xf6722cc8  ! 409: STX_I	stx	%r27, [%r8 + 0x0cc8]
	.word 0xfc71e658  ! 409: STX_I	stx	%r30, [%r7 + 0x0658]
	.word 0xf42a000c  ! 410: STB_R	stb	%r26, [%r8 + %r12]
	.word 0xe8296d50  ! 410: STB_I	stb	%r20, [%r5 + 0x0d50]
	.word 0xec716168  ! 410: STX_I	stx	%r22, [%r5 + 0x0168]
	.word 0xf821c00b  ! 410: STW_R	stw	%r28, [%r7 + %r11]
	.word 0xfc29ada7  ! 410: STB_I	stb	%r30, [%r6 + 0x0da7]
	.word 0xfa22000f  ! 410: STW_R	stw	%r29, [%r8 + %r15]
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,54)
	.word 0xfa4a0009  ! 411: LDSB_R	ldsb	[%r8 + %r9], %r29
	.word 0xfa32000f  ! 412: STH_R	sth	%r29, [%r8 + %r15]
	.word 0xb809a3d2  ! 414: AND_I	and 	%r6, 0x03d2, %r28
	.word 0xff39800c  ! 414: STDF_R	std	%f31, [%r12, %r6]
	.word 0xecb9500b  ! 415: STDA_R	stda	%r22, [%r5 + %r11] 0x80
	.word 0xfc20ef10  ! 417: STW_I	stw	%r30, [%r3 + 0x0f10]
thr0_irf_ce_29:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_29), 16, 16), 1,IRF,ce,11,x, x,x,x, x,x,x)
	.word 0xea32000f  ! 418: STH_R	sth	%r21, [%r8 + %r15]
	.word 0xe222000f  ! 418: STW_R	stw	%r17, [%r8 + %r15]
	.word 0xe621a434  ! 418: STW_I	stw	%r19, [%r6 + 0x0434]
	.word 0xe621a9a1  ! 418: STW_I	stw	%r19, [%r6 + 0x09a1]
	.word 0xe42a000c  ! 420: STB_R	stb	%r18, [%r8 + %r12]
thr0_irf_ce_30:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_30), 16, 16), 1,IRF,ce,59,x, x,x,x, x,x,x)
	.word 0xe42a000c  ! 420: STB_R	stb	%r18, [%r8 + %r12]
	.word 0xc368c00d  ! 421: PREFETCH_R	prefetch	[%r3 + %r13], #one_read
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf031000f  ! 424: STH_R	sth	%r24, [%r4 + %r15]
thr0_ic_err_32:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_32), 16, 16),1,IC_DATA,NIR,x,29)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xf02926a7  ! 425: STB_I	stb	%r24, [%r4 + 0x06a7]
	.word 0xe45a21b8  ! 426: LDX_I	ldx	[%r8 + 0x01b8], %r18
!Generating an illinst
	.word 0xb938df0b  ! 428: SRAX_R	srax	%r3, %r11, %r28
	.word 0xfa30e85c  ! 430: STH_I	sth	%r29, [%r3 + 0x085c]
	.word 0xe5216f08  ! 430: STF_I	st	%f18, [0x0f08, %r5]
	.word 0xf521400c  ! 431: STF_R	st	%f26, [%r12, %r5]
	.word 0xe5e1100d  ! 432: CASA_I	casa	[%r4] 0x80, %r13, %r18
	.word 0xec21e1a8  ! 434: STW_I	stw	%r22, [%r7 + 0x01a8]
thr0_resum_intr_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_33), 16, 16)) -> intp(1, 3, 1)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xe429000c  ! 436: STB_R	stb	%r18, [%r4 + %r12]
thr0_ic_err_33:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_33), 16, 16),1,IC_DATA,IR,33,x)
	.word 0x81d9000e  ! 436: FLUSH_R	dis not found

	.word 0xf220ebd8  ! 438: STW_I	stw	%r25, [%r3 + 0x0bd8]
thr0_ic_err_34:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_34), 16, 16),1,IC_DATA,NIR,x,22)
	.word 0xf821000e  ! 439: STW_R	stw	%r28, [%r4 + %r14]
	.word 0xe8316f96  ! 439: STH_I	sth	%r20, [%r5 + 0x0f96]
	.word 0xec32000d  ! 439: STH_R	sth	%r22, [%r8 + %r13]
	.word 0xba1165b6  ! 440: OR_I	or 	%r5, 0x05b6, %r29
	.word 0xb331100f  ! 440: SRLX_R	srlx	%r4, %r15, %r25
	.word 0xbf30e001  ! 440: SRL_I	srl 	%r3, 0x0001, %r31
	.word 0xa529d00c  ! 440: SLLX_R	sllx	%r7, %r12, %r18
	.word 0xf0a9a9ad  ! 440: STBA_I	stba	%r24, [%r6 + 0x09ad] %asi
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,60)
	.word 0xf0418009  ! 442: LDSW_R	ldsw	[%r6 + %r9], %r24
	.word 0xf021a6cd  ! 443: STW_I	stw	%r24, [%r6 + 0x06cd]
	.word 0xf469400e  ! 444: LDSTUB_R	ldstub	%r26, [%r5 + %r14]
	.word 0xa251000b  ! 445: UMUL_R	umul 	%r4, %r11, %r17
	.word 0xfc28c00e  ! 447: STB_R	stb	%r30, [%r3 + %r14]
thr0_irf_ce_31:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_31), 16, 16), 1,IRF,ce,14,x, x,x,x, x,x,x)
	.word 0xe629800c  ! 448: STB_R	stb	%r19, [%r6 + %r12]
	.word 0xec312f92  ! 448: STH_I	sth	%r22, [%r4 + 0x0f92]
	.word 0xfe28e745  ! 448: STB_I	stb	%r31, [%r3 + 0x0745]
	.word 0xf67124b8  ! 448: STX_I	stx	%r27, [%r4 + 0x04b8]
	.word 0xa9782401  ! 449: MOVR_I	move	%r0, 0xfffffed8, %r20
	.word 0xba28c00b  ! 449: ANDN_R	andn 	%r3, %r11, %r29
	.word 0xb808c00b  ! 449: AND_R	and 	%r3, %r11, %r28
	.word 0xb409e470  ! 449: AND_I	and 	%r7, 0x0470, %r26
	.word 0xeab2100b  ! 449: STHA_R	stha	%r21, [%r8 + %r11] 0x80
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	.word 0xf4312fb2  ! 452: STH_I	sth	%r26, [%r4 + 0x0fb2]
	.word 0xfc2925b7  ! 452: STB_I	stb	%r30, [%r4 + 0x05b7]
	.word 0xfc716910  ! 452: STX_I	stx	%r30, [%r5 + 0x0910]
	.word 0xed21000f  ! 452: STF_R	st	%f22, [%r15, %r4]
	.word 0xf42a24d7  ! 454: STB_I	stb	%r26, [%r8 + 0x04d7]
thr0_ic_err_35:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_35), 16, 16),1,IC_DATA,IR_NIR,0,16)
	ta T_CHANGE_PRIV !To allow ASI writes to D-I caches
	.word 0xfcb8ebb8  ! 455: STDA_I	stda	%r30, [%r3 + 0x0bb8] %asi
	.word 0xf422000c  ! 457: STW_R	stw	%r26, [%r8 + %r12]
thr0_irf_ce_32:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_32), 16, 16), 1,IRF,ce,46,x, x,x,x, x,x,x)
	.word 0xe429800f  ! 458: STB_R	stb	%r18, [%r6 + %r15]
thr0_irf_ce_33:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_33), 16, 16), 1,IRF,ce,49,x, x,x,x, x,x,x)
	.word 0xc0f00960  ! 459: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe51ac3c  ! 460: LDSH_I	ldsh	[%r6 + 0x0c3c], %r31
	.word 0x0cc10001  ! 461: BRGZ	brgz  ,nt	%4,<label_0x10001>
!Generating an illinst
	.word 0xa5780f0c  ! 463: MOVR_R	movl	%r0, %r12, %r18
	.word 0xed20c00b  ! 464: STF_R	st	%f22, [%r11, %r3]
	.word 0xfa21abdc  ! 466: STW_I	stw	%r29, [%r6 + 0x0bdc]
thr0_irf_ce_34:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_34), 16, 16), 1,IRF,ce,58,x, x,x,x, x,x,x)
	.word 0xe8a964ed  ! 466: STBA_I	stba	%r20, [%r5 + 0x04ed] %asi
	.word 0xf031adb6  ! 468: STH_I	sth	%r24, [%r6 + 0x0db6]
	.word 0xee29c00c  ! 468: STB_R	stb	%r23, [%r7 + %r12]
	.word 0xe621400d  ! 468: STW_R	stw	%r19, [%r5 + %r13]
	.word 0xc0f00960  ! 469: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf6322184  ! 471: STH_I	sth	%r27, [%r8 + 0x0184]
thr0_ic_err_36:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_36), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xa4122920  ! 472: OR_I	or 	%r8, 0x0920, %r18
	.word 0xbb31500e  ! 473: SRLX_R	srlx	%r5, %r14, %r29
	.word 0xec71400b  ! 474: STX_R	stx	%r22, [%r5 + %r11]
thr0_irf_ce_35:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_35), 16, 16), 1,IRF,ce,62,x, x,x,x, x,x,x)
	.word 0xe431ed22  ! 475: STH_I	sth	%r18, [%r7 + 0x0d22]
	.word 0xe6212ba8  ! 475: STW_I	stw	%r19, [%r4 + 0x0ba8]
	.word 0xf822000e  ! 475: STW_R	stw	%r28, [%r8 + %r14]
	.word 0xfe70e8c8  ! 475: STX_I	stx	%r31, [%r3 + 0x08c8]
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xe470ece8  ! 477: STX_I	stx	%r18, [%r3 + 0x0ce8]
thr0_ic_err_37:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_37), 16, 16),1,IC_DATA,NIR,x,15)
	.word 0xc0f009a0  ! 478: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe229a61d  ! 481: STB_I	stb	%r17, [%r6 + 0x061d]
thr0_irf_ce_36:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_36), 16, 16), 1,IRF,ce,50,x, x,x,x, x,x,x)
	ta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches
	.word 0xf021643c  ! 483: STW_I	stw	%r24, [%r5 + 0x043c]
thr0_irf_ce_37:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_37), 16, 16), 1,IRF,ce,68,x, x,x,x, x,x,x)
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,22)
	.word 0xf0194009  ! 484: LDD_R	ldd	[%r5 + %r9], %r24
	.word 0xec19e528  ! 485: LDD_I	ldd	[%r7 + 0x0528], %r22
	.word 0xf6b1d00d  ! 486: STHA_R	stha	%r27, [%r7 + %r13] 0x80
	.word 0xea20e7b0  ! 488: STW_I	stw	%r21, [%r3 + 0x07b0]
thr0_resum_intr_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_34), 16, 16)) -> intp(1, 3, 1)
	.word 0xef39400c  ! 488: STDF_R	std	%f23, [%r12, %r5]
	.word 0xf87163e8  ! 490: STX_I	stx	%r28, [%r5 + 0x03e8]
thr0_ic_err_38:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_38), 16, 16),1,IC_DATA,NIR,x,14)
	.word 0xfe31000e  ! 491: STH_R	sth	%r31, [%r4 + %r14]
thr0_ic_err_39:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_39), 16, 16),1,IC_DATA,NIR,x,25)
	.word 0xe6312b26  ! 492: STH_I	sth	%r19, [%r4 + 0x0b26]
thr0_ic_err_40:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_40), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xc0f00960  ! 493: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,6)
	.word 0xe6090009  ! 495: LDUB_R	ldub	[%r4 + %r9], %r19
	.word 0xfc28c00e  ! 497: STB_R	stb	%r30, [%r3 + %r14]
thr0_irf_ce_38:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_38), 16, 16), 1,IRF,ce,44,x, x,x,x, x,x,x)
	.word 0xf01a2698  ! 497: LDD_I	ldd	[%r8 + 0x0698], %r24
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches
	ta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches

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
	.word  0xc15ef733,0xe6212974,0xf36f6d03,0xb37ccfc9
	.word  0x6b0e4778,0x34402536,0x519097b0,0xb4db1922
	.word  0x14f78e69,0x82397faf,0x2242abf0,0x6fa3677c
	.word  0xa1e7fd92,0x189ca375,0xb9933655,0x266b2d22
	.word  0x1ac863b8,0xd1a5b69b,0x349b1377,0xe6aed29e
	.word  0xd0eb87ea,0xd5e548e8,0x20437fb4,0xf829495b
	.word  0x541ba82d,0x3ede9c76,0xddf67f27,0x75eb0ac3
	.word  0xa33e2903,0x9ea155b0,0xe361b7b5,0xa74c651c
	.word  0x564731b9,0x03c38be7,0xf7a02681,0x1ebdf293
	.word  0x2d9d010b,0x2c99f232,0xaed888a7,0x289c891b
	.word  0xbf0d30fd,0x74034e48,0x494cd7bd,0x1635c971
	.word  0x8fffd20e,0xe19cd445,0x4d68cd85,0x226d1bec
	.word  0xf3f2ab8f,0x1428cc29,0x9aaf8798,0xc0ad335e
	.word  0x5e877d48,0x9e48f0d6,0x2fcba764,0xd3bc4298
	.word  0xa08b1608,0xeeae8359,0x23ae2b40,0x20bf16bc
	.word  0x7459feff,0x5e67e71b,0xb0c59294,0xc0fced2c
	.word  0x8375c164,0x15c2c426,0x0c6efdec,0xd7d7d2eb
	.word  0x785b8e67,0xc4c32707,0xafa1d43d,0x8bd14fcf
	.word  0x4ba30e03,0xa62d8863,0xd9cf64c9,0x8e4a8cb6
	.word  0xb02e6b20,0x9f99d3ce,0x0d83a4a5,0x79ea2f0a
	.word  0x6bbc66b8,0x93f32657,0xec9d1dfd,0xe0d2c6e4
	.word  0xa00ce812,0xf8e2a872,0x80dffa2c,0x073075d4
	.word  0xf6d4bccb,0x83c35dd2,0x666129d4,0xee9026ed
	.word  0x492d3934,0x21508599,0x57df2e7d,0xff0bfead
	.word  0x62e3df6a,0x67465b0a,0xcbd72009,0xd2deb4c4
	.word  0x19ae8c8e,0xe8e4f1b2,0xba5aa1e5,0x9e3e7157
	.word  0xa3167b66,0xfd6f2e86,0x025874ec,0x4d14d1fb
	.word  0x7e3bf8b1,0x55e5ca14,0x687b0225,0x174663a2
	.word  0x4a1d96bd,0x598c50ba,0x91e1abac,0x3fcbac63
	.word  0x46b0f609,0x1cf4d3df,0x6692d6de,0x5a8b7079
	.word  0x85ef744f,0xe3ff88a6,0x0b235885,0x2bf6d2e8
	.word  0x6ad1b20d,0xfca120d1,0x20cee147,0x63c05e65
	.word  0x214a0b97,0x6c90d8df,0x545b5cf3,0x88436e86
	.word  0xa85b76e0,0x9b36501f,0xe96bff37,0xd6a375c6
	.word  0xd911b890,0x2b4fdc59,0x2eb4f616,0xcb2572e9
	.word  0x16bdf7ff,0xdf1a20a4,0x07140ae9,0xbebd48e9
	.word  0x0471db14,0x6d684bc2,0xeaa432da,0x177e4c18
	.word  0x55cdfc86,0x4755ade2,0xc9879f06,0x881e3805
	.word  0x5618d1cf,0xb3a27b8b,0xfca35a66,0x00424462
	.word  0x40b4faef,0x6d2ef038,0xc8079de8,0xd68da931
	.word  0xc31f5be5,0x069e5d53,0x6ab1ad37,0x4eefbf16
	.word  0x64003f5d,0x9a808bd1,0xe04936ad,0xe61ca117
	.word  0x5097a6e0,0x4c5bff09,0xb57154d2,0xbce5bb14
	.word  0x146138b5,0x1823995a,0x70ce4bac,0x7a0a5108
	.word  0x008a9ab4,0x1adb8f30,0xf8abfbfd,0x23768247
	.word  0xcf3027bf,0xf760ad35,0x9c95c81c,0xb89e2f2b
	.word  0xa85acfe2,0xdbc7e110,0x66a96c15,0xacab25ba
	.word  0x65c8118c,0x4c08711f,0x2203096b,0xd8cafffc
	.word  0x09709285,0x4889612e,0xe8e4a7d5,0xabdf2f84
	.word  0xf21d7d85,0xd0eb0fff,0x133cfe8b,0xc5fea98d
	.word  0x2af8649a,0xf4740ccc,0x66a3dcae,0x2c7e07a5
	.word  0xf3806e54,0xa2d9a399,0x21b3fc2e,0x04be6b46
	.word  0xf670d62a,0x1a4ee5c2,0xb2280330,0xd262b94f
	.word  0x67aefe5c,0x8580878c,0xf35f7df4,0xb88ee239
	.word  0x3ad4869b,0x860125a7,0x8d37b967,0x7b9338ea
	.word  0xbed7c0fa,0x523dfb56,0xb41b732c,0x88cd435d
	.word  0x002d28b1,0x88f5f983,0xea31d496,0x9a72cda9
	.word  0xfb7e829e,0x03a494a9,0x1162cf55,0xb93e0252
	.word  0x1b1c5098,0xc2e7edf3,0x1ac617b7,0x23a923b5
	.word  0x9115d1e4,0xa4fb83ea,0x8e06e6aa,0xa5b0d893
	.word  0xb9b152bb,0xfc94eba4,0x32344636,0x39277564
	.word  0x2248ac4d,0x6b25653c,0x87810308,0xc98cfc34
	.word  0x9714b26b,0x5ed23b3b,0x3bedb269,0x6379f1a5
	.word  0x320eff20,0xe46a6a36,0xbdda5679,0xfab46a95
	.word  0x0708622f,0x2b258d80,0x22747ec1,0x40e09e63
	.word  0x1090820a,0x83d06c44,0x3242f275,0x64ddecda
	.word  0x9e830ca1,0x0c773f94,0xd1fa2498,0xfcb5721e
	.word  0x49a082b7,0xa20fa3ee,0x7428bb60,0x84c4055b
	.word  0x1f215290,0xc0ffe146,0x1bb788da,0x0d786c69
	.word  0x0c3d6e94,0xf2f28fb0,0x95872b49,0x2d1c67d9
	.word  0x1082a995,0x95417199,0x6c058f6d,0xd1e1326b
	.word  0x351d7a34,0x6b2147b9,0x7460f81a,0x05aa782e
	.word  0xb4ac7dda,0x93e84974,0xb5b6e69e,0xbca24e0e
	.word  0xdf196563,0x57d51024,0x3fda9c6a,0x6e5ba982
	.word  0xe793ab9d,0x412bb175,0xf8cdac6b,0x3fb887aa
	.word  0xd4b786b2,0xdea472fd,0xd01542c3,0xcfde9cd8
	.word  0xa4408d68,0x914e2cba,0x6f3db5c4,0x91e23a24
	.word  0x26ddbc9d,0x4845f9e3,0x7795706a,0xf57024af
	.word  0xf470b42e,0xd4087907,0xffc9c0a4,0x48c8cd56
	.word  0xa016860f,0xf79da86f,0xa57e1543,0x7ca926e0
	.word  0xfedcd4b0,0x6f64c6f5,0xd9744e40,0x59ea2564
	.word  0x999a174e,0xd11d2d59,0xecba2e72,0x33aaf325
	.word  0x5a4b57f9,0xe52bd7dc,0x46a25c2c,0x701142dc
	.word  0x8a7df367,0x6ceafb1a,0xb751ea63,0x665b2596
	.word  0x6b4c7258,0x47f4f509,0xcd82de51,0x0a72a654
	.word  0x2a55f845,0x4b9c9fe0,0x6e388ce3,0xd8b6d3bb
	.word  0x97ff17b4,0x3e23afae,0xaaeba0ee,0xa0246d04
	.word  0xdfd2ca96,0x0ff38b00,0xd8f41f00,0x314ee430
	.word  0x446a4a1d,0x885ddd8e,0x58520f9f,0xc742e22f
	.word  0x184081a5,0xca40b0eb,0xfc908f9b,0xba1b51dc
	.word  0x719bcdd9,0xca67a2e8,0x97ffef1b,0xdbca9651
	.word  0x1b50de1e,0xba009cb0,0x18bc4edb,0xcefc83be
	.word  0xf134efa9,0x37c194a8,0xbf9a8139,0x33ee149e
	.word  0x2f06b016,0x2eca0c84,0xd6c029c5,0xdde569d0
	.word  0x5af76e4e,0x05a18530,0x541937fb,0x0ae1a8b2
	.word  0x9d8cc2c5,0xccbec756,0xa95d5dda,0x280ac7d8
	.word  0xb7e6ab85,0x31912bb5,0xd80054ad,0x75e256ec
	.word  0xc4713bda,0xe10575e9,0xa4ab4ea4,0xd9ef8e63
	.word  0xaa70fd72,0x812ec6c6,0xb4fcb304,0x475a617e
	.word  0xeda38633,0xd072be60,0x8161efad,0xa86c5381
	.word  0x83241332,0x5f82fba7,0x8c4e0e11,0xa5ce0649
	.word  0x2d682519,0x88e0bd04,0xbdd7b908,0x0fc064e2
	.word  0x777e7854,0x83fd40a9,0xfd92a936,0xfcc3695f
	.word  0x2ea95c14,0xc1bf4b7d,0x2c0271b0,0xd3337937
	.word  0x661b6b73,0xa2c1eefc,0xa225e570,0xc03ca5b4
	.word  0x66550c82,0xad85e98d,0xb5d00216,0xe0d3078e
	.word  0x6861ef7b,0x9968b21e,0x1853e9e4,0x3c93503b
	.word  0x32cf0314,0x249a586b,0x6165f8b3,0x30aef2d7
	.word  0x7cb6726a,0xc24e8062,0x15af69f3,0x553b611e
	.word  0xe1cee601,0xaa852249,0x58b91c23,0xd8bfa4f8
	.word  0xf6f77aae,0xd87d741f,0xe13cd438,0x42eaa797
	.word  0xc7e7bf07,0x545ce941,0x99f8c102,0x2fee4a3a
	.word  0x717c07e6,0x32b7b868,0x4fddca39,0x0a548ba7
	.word  0xd7430c5f,0xc1f07771,0x5769c886,0x27d64fa1
	.word  0xe53bf8b0,0x5ded6394,0x60a18a8f,0x1dce8843
	.word  0xf69c0c04,0x77276780,0x648ee79a,0x61cc1430
	.word  0x45a3fd72,0xf6fa94c7,0xf45c1134,0x4000dc07
	.word  0x487c8275,0xa94e1011,0x9878bfc2,0x5209e743
	.word  0x267b43cd,0x28362a9f,0xa54d5a70,0x92ca0918
	.word  0x5856fcde,0xf8aa82f1,0xf3b39c62,0xe8a8fe5f
	.word  0x1dddb277,0xbc2ff676,0xa0758ce3,0xfbc369d6
	.word  0x1d327da9,0x63b347cc,0xd6b29282,0x2af22bd0
	.word  0x2c64d6f6,0x6e458d8c,0x1e6b23c9,0x12c67696
	.word  0xf9484301,0xd8c8e5a5,0x5d03b08d,0xe13bc861
	.word  0xa32744f9,0xee2fd5e7,0x6f1b26cb,0xde456b95
	.word  0xb9937869,0x94431302,0x4807a723,0xae2000e9
	.word  0xffe3fe03,0x5e92fcf8,0x83a63b9f,0xf398463d
	.word  0x9ba42bf0,0x384e8a50,0x1f05ab2b,0x4f12a180
	.word  0x2123ef23,0x6e4fbf4f,0xe249c5f3,0x07010bbb
	.word  0x2c14397c,0x6bc54c05,0xc8d40e7d,0xad1daf1a
	.word  0x7749ff7f,0xf73938d6,0xa4a09b2d,0xc64eb86c
	.word  0x44b1da59,0x2f1ae36f,0xee69667c,0x002eedb4
	.word  0x3ae888b6,0x25b3d746,0x09dbe84e,0xecff6f6d
	.word  0xddafa870,0x13ea977d,0x822f107c,0xc2ab187d
	.word  0x7f2d49d2,0xea26cb73,0x20eb78b4,0xde8a9ff7
	.word  0x05587a66,0xc0d45a14,0x4806c125,0x1e33d2d2
	.word  0x55b34678,0xd2a8ed9b,0x26c7a1a1,0xd90d68f6
	.word  0xb5320b78,0x2298ba18,0x6aae452a,0x24dfcf41
	.word  0x8777e63c,0x61ddb639,0xbd379667,0x5b6cd792
	.word  0x246706ab,0xe73173e7,0x0583f861,0x4fd146e8
	.word  0xf0afd590,0x7d6d4c7f,0x522c95bd,0x14ce66db
	.word  0x90eab938,0x37da0743,0xb022cc3d,0xbf6f644f
	.word  0xd5db4880,0xae62be0c,0x84225233,0xe5985367
	.word  0x8a4257f0,0x82455928,0xe557f95e,0x5601ce0e
	.word  0xc017337d,0x3c7bd4d1,0x0f2a5efc,0xad14163b
	.word  0xaec47564,0x26a351d1,0xa679eaf4,0x563174d2
	.word  0xd5015e4f,0x810425a1,0xf9bd07e4,0xd76a98be
	.word  0xbf8caed7,0x2cad31b0,0x0a4a24ad,0xcfe5d2cd
	.word  0xc31054e6,0xab6b0cb2,0x42e6ae79,0xecb2dafd
	.word  0x2b6c7c8b,0x2b3d72d8,0xf3b65e49,0xfe2c1bff
	.word  0x71e2f18d,0x710f8c82,0x1933f1cc,0x3acf0e2f
	.word  0xda147244,0x7a9a5e01,0x3dcbad9e,0xcc2f2ade
	.word  0x587b7d43,0x3f8c34b6,0x075bdc90,0x2adaf120
	.word  0x5c573046,0x66e91ce7,0x8443e3fe,0xcc7a2c85
	.word  0x7ce3610a,0x111b46f7,0xdf4b1353,0xee149f07
	.word  0xa04dcd02,0x04e6b62f,0x88114437,0x961e728b
	.word  0x3a3103c7,0x9d84d3c1,0x2e817615,0x03881eaf
	.word  0xd788f6eb,0x348aad84,0xdc238a6e,0x472e5a04
	.word  0xa260435e,0x3664eaac,0x70fe032e,0x94bd4e6c
	.word  0x21069556,0x35a15d25,0x6991509c,0xced491b7
	.word  0xee43db80,0x292d71d6,0xd8faaa05,0xa73b3d22
	.word  0x6f0d510d,0xeaa43425,0x58d4ce93,0xdd31192d
	.word  0x82ccba53,0x664457ee,0x5c9020b0,0xba689bc4
	.word  0x0d304488,0x43d62973,0x0cf0159a,0xd26658ed
	.word  0xe2c779c6,0x3aa0ad93,0x17e3ddac,0xce292e39
	.word  0x1581caad,0x2ca4ae6e,0x8693437d,0x86830d99
	.word  0xaa2636b0,0x00779b11,0xa35f40e5,0xc3adf79d
	.word  0xe9d5be05,0x078b455c,0x1f68e6a9,0xc402a81d
	.word  0x938bd6e8,0x49dd65ae,0x28c2eb23,0xfbcf3b83
	.word  0x0e57d751,0xcfcd4b36,0xf28994d0,0xd28118be
	.word  0x123c45f8,0xc5ec4a00,0x78c43e58,0xf7c81eff
	.word  0xc49a1362,0x5b9e6084,0xd47d88f4,0x29fe235d
	.word  0xa78ef195,0x320d5abc,0xd9501023,0x8cbf8d6a
	.word  0xcce95952,0xa53c0959,0x6a95cbb5,0x454b51b8
	.word  0x0b7a4f4e,0x70ad82b9,0xb123f63a,0x85b10472
	.word  0x212c6874,0x59e841d1,0xe1b13b22,0x0c94f2e2
	.word  0x82bf9a44,0x0056f9e8,0xc39a0829,0x7ee7b9d9
	.word  0x7608af9d,0xbe193e81,0xab3848c2,0x4602f260
	.word  0x9ae5bd82,0xaa41b4bc,0x96939da2,0x896089ac
	.word  0xe840ff2d,0xc2a62fdd,0xdae0a3be,0xfc0be278
	.word  0x3fb209bc,0x653d974f,0xb0b09a35,0xe4849a31
	.word  0x4c00dfdb,0xa32d3732,0xfb9a7ca2,0x98f3fe07
	.word  0xc4d7be46,0xd417b03a,0xc49d35e7,0x225a9278
	.word  0x66fc0b8f,0xe5084a35,0xfe267431,0x18e8ca01
	.word  0x11e1330d,0x2905708e,0x116a4475,0x09251224
	.word  0x1ff3cbba,0xc1038962,0x62bb4ef6,0x33843c8c
	.word  0xdf61da9c,0x5022b70e,0x47928b00,0xca653995
	.word  0xb4415bf0,0x75ed5fc3,0x5f21356b,0x0f7af0f8
	.word  0x3ca8d6ed,0xe7abe659,0x30e124a0,0x741dc702
	.word  0x380fb461,0xed47f2b6,0xd2d21c7e,0xb1251730
	.word  0x1d4f065a,0xed77fdad,0x4eb04a28,0x2a380e50
	.word  0xca7762ea,0xf60dfcd0,0xba36be63,0xaf962523
	.word  0xecb0d50d,0xd96ffca2,0x4204891a,0x2c393702
	.word  0xda9cd1a6,0xd11b4a96,0x7556b0d9,0x6d805abb
	.word  0x80029da9,0x779f802c,0xd337e836,0xaf71d1ce
	.word  0x74a420ef,0x544937d1,0xadc0baa8,0x62099e1b
	.word  0x73322240,0x33601ffc,0x8551eca3,0x16b8ae22
	.word  0x34e0d023,0x946b5f5d,0x46a54f63,0x801cab3b
	.word  0xe1cf4227,0xae88dafc,0x97db5c70,0x4ee80392
	.word  0x7eb6a014,0x2792d2d2,0x9a6eb403,0xfbc51b38
	.word  0x854141dc,0x1507760b,0x518be4eb,0x9767a62c
	.word  0xb2aa7b6e,0xf6fdbb99,0x2cdc3a2a,0x5db23b02
	.word  0x276103c4,0xa9cff4e0,0x48dbb464,0x59d618cb
	.word  0x0287ca9a,0xabd7d98a,0x6733992c,0xbeef992e
	.word  0x09e5ec01,0xd397ff0f,0x6e99c2e6,0x6c030c41
	.word  0xfe19ee84,0xf5034858,0x6e6aecdb,0x0ba72647
	.word  0xe9419f80,0x68417aab,0x007328cb,0x9bae4a18
	.word  0xd8daf134,0x1fab6f37,0xf1c2f4cb,0x3882df00
	.word  0x17c14356,0x8a2e7bbb,0xd69c3656,0x01d68a82
	.word  0xbc0b2603,0x95bdd376,0x8a05d056,0x3a9b0f21
	.word  0xfd20e754,0xff7a60e8,0xdfddfc1e,0xe6b26c65
	.word  0x617f86df,0x7a5bc11f,0x11276629,0x2e003019
	.word  0x34461f9b,0x90a1d193,0x2154441d,0x9e5a0919
	.word  0x1ee08fd6,0x6c40a75e,0x56936b5e,0x6a49e8cd
	.word  0x67ee424b,0xee084b95,0x78e881c0,0xafd138bd
	.word  0x8b176800,0x4d7c75f1,0x301adb6c,0x9302f32a
	.word  0x76e3060e,0x0e1e82ee,0x1f129916,0x7ad743fe
	.word  0x5b812a06,0xf9879343,0x5f4d9baa,0x3283f60a
	.word  0xfeeec6d9,0x178ce131,0x3eba7aae,0x5ef8cbb4
	.word  0x2a2c5571,0xad0d5549,0x4b7954d7,0x6beba197
	.word  0xbcfb63de,0xa0d66926,0xd4b6995a,0x879f7155
	.word  0x8c0e42e3,0xdada0f74,0x0a1095fa,0x6297ae58
	.word  0xa376ce8a,0x00686be9,0xac87b602,0x10d68493
	.word  0x17199b18,0x86b710e7,0xa438356a,0xd2ad311a
	.word  0xaab32082,0xec38189f,0x806556b1,0xd213911f
	.word  0xb82dc3e1,0xc95ffdef,0x81b288f0,0x1397bec4
	.word  0x2d0a9cc5,0x940a77bc,0x69fbb153,0x62ac6479
	.word  0x739eb608,0xc25c56f8,0xf0fdbbbb,0xa15f54f0
	.word  0x17529d13,0xd63138f7,0xbc1438d3,0x38eed19a
	.word  0xa4c21dc4,0xef8ab0d8,0x76fc0404,0xca119a78
	.word  0x9deef9fe,0x28c4fa48,0xe0e30f66,0x7ce30875
	.word  0x5ccdbeba,0x7f0bf6e4,0x039c6e72,0x1a9355e0
	.word  0xea769abe,0x1055e7e7,0x56c8ccc2,0x4740d178
	.word  0x202bc86a,0xf3200c20,0xf6f25db3,0x6b934d0c
	.word  0x5ff00d80,0x74189f78,0x8c2f118c,0x835e4e30
	.word  0x7dd97e87,0x3ee32a95,0x2b090a83,0xa9564c16
	.word  0x0a9e0790,0x1ad6477f,0x82cba034,0x86692776
	.word  0x6a36c75f,0x2df35006,0x8c73aed2,0xbb380c63
	.word  0x21c5880f,0xb6a31e0f,0xe4b095a5,0x5fdc359d
	.word  0x612fba5e,0xc718fa1b,0xb9abc765,0x895f859b
	.word  0x8531b4a2,0x320402ca,0x2037cf9b,0xf4a55d64
	.word  0x76c49dd3,0xb8510465,0x3e8c44ae,0xe4c0a8f9
	.word  0x7be90b7a,0x1651afaf,0x004a4d30,0x9dd0bda6
	.word  0x6917171f,0xb89050d6,0x6eacc179,0xbdf66e92
	.word  0x296a4ded,0x5d6a93ee,0xf2108a18,0xb2a72e01
	.word  0x1ed8774c,0xd9f658a7,0x303c3f44,0xcf7c7305
	.word  0x97f106ed,0x3a6b03ad,0xe19a827f,0xf132ab1a
	.word  0xefdee93d,0xe78ac256,0x26fc2da4,0x88c76bdb
	.word  0x3a03bf1c,0xbe03e562,0x3a61e33c,0x88366d4d
	.word  0x5fe6b935,0xcd8dcc06,0xd659399f,0x2029cf8f
	.word  0x17fe2b7e,0x786f1684,0x480038e3,0xb03c78e5
	.word  0x0972011b,0x12c65c42,0x0f664e27,0xd95bd434
	.word  0x09472a84,0x9c18ea77,0x6ca6fa7a,0xa6c1f345
	.word  0x11e99ee3,0x012f7f6f,0xb0db3db2,0x8a995901
	.word  0x887ca3a2,0x8d568b62,0x202390f8,0x1287d397
	.word  0xb295d397,0x1bfa6931,0x0a40e8aa,0x6ace2c67



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int label_cnt = 0;
!!#   int irf_err_cnt = 0;
!!#   int ic_err_cnt = 0;
!!#   int dc_err_cnt = 0;
!!#   int bitnum = 0, bitnum2 = 0;
!!#   int i = 0;
!!#   int burst_cnt = 0;
!!#   int intr_cnt = 0;
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
!!#   IJ_set_ropr_fld ("diag.j", 40, ijdefault, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld ("diag.j", 41, ijdefault, Ft_Rs2, "{11..15}");
!!#   IJ_set_ropr_fld ("diag.j", 42, ijdefault, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 53, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 54, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 55, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 56, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   //Internal asi
!!#   IJ_set_ropr_fld ("diag.j", 59, Ro_err_trap, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 60, Ro_err_trap, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 61, Ro_err_trap, Ft_Rd, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_err_trap, Ft_Imm_Asi, "{0x4b}");
!!# 
!!#   //r3 will have all f's
!!#   IJ_set_ropr_fld ("diag.j", 65, Ro_err_stat, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 66, Ro_err_stat, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 67, Ro_err_stat, Ft_Rd, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 68, Ro_err_stat, Ft_Imm_Asi, "{0x4c}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_err_addr, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 71, Ro_err_addr, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 72, Ro_err_addr, Ft_Rd, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 73, Ro_err_addr, Ft_Imm_Asi, "{0x4d}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 75, Ro_inv_itlb, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 76, Ro_inv_itlb, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 77, Ro_inv_itlb, Ft_Rd, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 78, Ro_inv_itlb, Ft_Imm_Asi, "{0x60}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 80, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 81, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 83, Ro_rsvd_set, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld ("diag.j", 84, Ro_rsvd_set, Ft_Rs2, "{11..15}");
!!#   IJ_set_ropr_fld ("diag.j", 85, Ro_rsvd_set, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld ("diag.j", 86, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_bits ("diag.j", 87, Ro_rsvd_set, 0x1f70, "13'br1rr1rrr00000");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 89, Ro_load_r, Ft_Rs2, "{9}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 91, th_all,0xf);
!!# 
!!#   IJ_th_fork_group ("diag.j", 97, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 101, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 17; i < 32; i++) {
!!#      IJ_printf ("diag.j", 103, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 107, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 109, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 3; i < 9; i++) {
!!#      IJ_printf ("diag.j", 114, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 117, th_all, "\tsetx  0xffffffffffffffff, %%r16, %%r2\n");
!!# 
!!#   IJ_printf ("diag.j", 119, th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 120, th_all, 4);
!!#   IJ_printf ("diag.j", 121, th_all, "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!#   IJ_printf ("diag.j", 122, th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 124, half_wt, "{1}");
!!#   IJ_set_default_rule_wt_rvar ("diag.j", 125,"{2}");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join ("diag.j", 129,0xf);
!!#   IJ_th_start ("diag.j", 130,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 132, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 133, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 134, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 135, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 136, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 137, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 138, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 139, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 140, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 141, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 143, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 144, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 146, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 147, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# inst_type: store_int_burst_1
!!#            | store_int_burst_3
!!#            | st_fp 
!!# 	     {
!!#  		IJ_generate ("diag.j", 177, th_all, $1);
!!#              }
!!# 	   | atomic 
!!# 	     {
!!#  		IJ_generate ("diag.j", 181, th_all, $1);
!!#              }
!!#            | st_int_asi %rvar  half_wt
!!# 	     {
!!#  		IJ_generate ("diag.j", 185, th_all, $1);
!!#              }
!!# 	   | st_ext_asi
!!# 	     {
!!#  		IJ_generate ("diag.j", 189, th_all, $1);
!!#              }
!!# 	   | store_i %ropr  Ro_unaligned_addr
!!# 	     {
!!#  		IJ_generate ("diag.j", 193, th_all, $1);
!!#              }
!!#            | alu_burst 
!!#            | misc_lop
!!# 	     {
!!#                 IJ_generate ("diag.j", 198, th_all, $1);
!!#              } 
!!#            | icerr 
!!#            | resum_intr 
!!#            | irferr 
!!#            | dcerr_ld %rvar  half_wt
!!#            | load_i
!!# 	     {
!!#                 IJ_generate ("diag.j", 206, th_all, $1);
!!#              }   
!!#            | illinst %rvar  half_wt
!!#            | ch_priv
!!# ;
!!# 
!!# ch_priv: mMETA3000
!!# { 
!!#   i = random () % 4;
!!# 
!!#   if (i == 0) {
!!#      IJ_printf ("diag.j", 217, th_all, "\tta T_CHANGE_NONHPRIV !To allow ASI writes to D-I caches\n");
!!#   } else if (i == 1) {
!!#      IJ_printf ("diag.j", 219, th_all, "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!#   } else if (i == 2) {
!!#      IJ_printf ("diag.j", 221, th_all, "\tta T_CHANGE_NONPRIV !To allow ASI writes to D-I caches\n");
!!#   } else {
!!#      IJ_printf ("diag.j", 223, th_all, "\tta T_CHANGE_PRIV !To allow ASI writes to D-I caches\n");
!!#   }
!!# }
!!# ;
!!# 
!!# resum_intr: mMETA16
!!# {
!!#   IJ_generate_from_token ("diag.j", 230,1, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                          tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!#   IJ_printf ("diag.j", 231, th_all, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf ("diag.j", 232, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(1, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# store_int_burst_1: mMETA000001
!!# {
!!#    burst_cnt = random () % 5 + 3;
!!#    IJ_generate_from_token ("diag.j", 240,burst_cnt, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                            tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!# }
!!# ;
!!# 
!!# store_int_burst_3: mMETA0000005
!!# {
!!#    burst_cnt = random () % 3 + 1;
!!#    IJ_generate_from_token ("diag.j", 247,burst_cnt, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                            tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA1
!!# {
!!#    burst_cnt = random () % 4 + 1;
!!#    IJ_generate_from_token ("diag.j", 254,burst_cnt, th_all, ijdefault,
!!#        tADD_R ,tADD_I ,tAND_R ,tAND_I ,tANDN_R ,tANDN_I ,
!!#        tOR_R ,tOR_I ,tORN_R ,tORN_I ,tXOR_R ,tXOR_I ,
!!#        tXNOR_R ,tXNOR_I ,tMOVR_R ,tMOVR_I ,tSLL_R ,tSLL_I, 
!!#        tSRL_R ,tSRL_I ,tSRA_R ,tSRA_I ,tSLLX_R ,tSLLX_I ,
!!#        tSRLX_R ,tSRLX_I ,tSRAX_R ,tSRAX_I ,tSUB_R ,tSUB_I, -1);;
!!# }
!!# ;
!!# 
!!# icerr: mMETA3
!!# {
!!#    IJ_generate_from_token ("diag.j", 260,1, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                            tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!#    IJ_printf ("diag.j", 261, th_all, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 3;
!!#    if (i == 0) {
!!#       IJ_printf ("diag.j", 264, th_all, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 266, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!#       IJ_printf ("diag.j", 268, th_all, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 270, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!#       IJ_printf ("diag.j", 272, th_all, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 275, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr_ld: dcerr load_r %ropr  Ro_load_r
!!#           {
!!#              IJ_generate ("diag.j", 283, th_all, $2);
!!#              $$ = $2;
!!#           }
!!# ;
!!# 
!!# dcerr: mMETA4
!!#           {
!!#              IJ_printf ("diag.j", 290, th_all, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#              bitnum = random () % 72;
!!#              IJ_printf ("diag.j", 292, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#              dc_err_cnt++;
!!#           }
!!# ;
!!# 
!!# irferr: mMETA5
!!# {
!!#      IJ_generate_from_token ("diag.j", 299,1, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                            tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!#      IJ_printf ("diag.j", 300, th_all, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 70;
!!#      IJ_printf ("diag.j", 302, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# misc_lop: mul | div | br | membar | flush | prefetch | arith_fp //| ld_int_asi
!!# ;
!!# 
!!# mul: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I 
!!# ;
!!# 
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R 
!!#      | tUDIVX_I 
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDX_I |  tLDD_I
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R |  tLDSW_R | tLDUB_R 
!!#       |  tLDUH_R | tLDUW_R | tLDUW_I | tLDX_R 
!!#       | tLDD_R 
!!# ;
!!# 
!!# br: tBA | tBN | tBNE | tBE | tBG | tBLE | tBGE | tBL | tBGU | 
!!#     tBLEU | tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBRZ |
!!#     tBRLEZ | tBRLZ | tBRNZ | tBRGZ | tBRGEZ | tCALL 
!!# ;
!!# 
!!# membar: tMEMBAR | tSTBAR
!!# ;
!!# 
!!# atomic: tCASA_R | tCASA_I | tCASXA_R | tCASXA_I | tLDSTUBA_I | tLDSTUB_I 
!!#         | tLDSTUB_R | tLDSTUBA_R | tSWAP_I | tSWAP_R | tSWAPA_I | tSWAPA_R
!!# ;
!!# 
!!# st_fp: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R
!!# ;
!!# 
!!# arith_fp: tFADDs | tFSUBs | tFMULs | tFDIVs
!!# ;
!!# 
!!# prefetch: tPREFETCH_I | tPREFETCH_R | tPREFETCHA_I | tPREFETCHA_R
!!# ;
!!# 
!!# flush: tFLUSH_I | tFLUSH_R
!!# ;
!!# 
!!# store_i: tSTB_I | tSTH_I | tSTW_I | tSTX_I | tSTB_R | tSTH_R | tSTW_R | tSTX_R
!!# ;
!!# 
!!# st_ext_asi: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R | tSTDA_R | 
!!#             tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I | tSTDA_I
!!# ;
!!# 
!!# st_int_asi: st_err_trap | st_err_stat | st_err_addr | st_itlb_inv
!!# ;
!!# 
!!# st_err_trap:d1 tSTXA_R %ropr  Ro_err_trap 
!!# {$$ = $2}
!!# ;
!!# 
!!# st_err_stat:d100 tSTXA_R %ropr  Ro_err_stat
!!# {$$ = $2}
!!# ;
!!# 
!!# st_err_addr:d1000 tSTXA_R %ropr  Ro_err_addr
!!# {$$ = $2}
!!# ;
!!# 
!!# st_itlb_inv:d10000 tSTXA_R %ropr  Ro_inv_itlb
!!# {$$ = $2}
!!# ;
!!# 
!!# //ld_int_asi: ld_err_trap | ld_err_ldat | ld_err_addr | ld_itlb_inv
!!# //;
!!# 
!!# //ld_err_trap:d1 tLDXA_R %ropr Ro_err_trap 
!!# //{$$ = $2}
!!# //;
!!# 
!!# //ld_err_ldat:d100 tLDXA_R %ropr Ro_err_stat
!!# //{$$ = $2}
!!# //;
!!# 
!!# //ld_err_addr:d1000 tLDXA_R %ropr Ro_err_addr
!!# //{$$ = $2}
!!# //;
!!# 
!!# //ld_itlb_inv:d10000 tLDXA_R %ropr Ro_inv_itlb
!!# //{$$ = $2}
!!# //;
!!# 
!!# illinst: d0 alu %ropr  Ro_rsvd_set
!!# {
!!#   IJ_printf ("diag.j", 396, th_all, "!Generating an illinst\n");
!!#   IJ_generate ("diag.j", 397, th_all, $2);
!!#   $$ = $2;
!!# }
!!# ;
!!# 
!!# alu: tADD_R | tADD_I | tAND_R | tAND_I | tANDN_R | tANDN_I 
!!#      | tOR_R | tOR_I | tORN_R | tORN_I | tXOR_R | tXOR_I 
!!#      | tXNOR_R | tXNOR_I | tMOVR_R | tMOVR_I | tSLL_R | tSLL_I 
!!#      | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSLLX_R | tSLLX_I 
!!#      | tSRLX_R | tSRLX_I | tSRAX_R | tSRAX_I | tSUB_R | tSUB_I 
!!# ;
!!# 
!!# d0: mMETA11
!!# ;
!!# 
!!# d1: mMETA20
!!# ;
!!# 
!!# d100: mMETA100
!!# ;
!!# 
!!# d1000: mMETA1000
!!# ;
!!# 
!!# d10000: mMETA10000
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

