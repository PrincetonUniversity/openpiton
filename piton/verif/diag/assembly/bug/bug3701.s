// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3701.s
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
   random seed:	344879150
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
	setx  0xb0d70466652112a0, %r16, %r17
	setx  0xaa158024c9ebfb03, %r16, %r18
	setx  0x0a31b5a30d04f4b7, %r16, %r19
	setx  0x04b3166835bda808, %r16, %r20
	setx  0x95e3895001ff8b0c, %r16, %r21
	setx  0xeb444c094a74b07b, %r16, %r22
	setx  0xdf617ae572b9a5c8, %r16, %r23
	setx  0xbd8b7991b22ed844, %r16, %r24
	setx  0x763f1f7f85e64efd, %r16, %r25
	setx  0xc17a74ecdaf5cfb9, %r16, %r26
	setx  0x5220c68c88d54521, %r16, %r27
	setx  0xb613e004f9fbb465, %r16, %r28
	setx  0xc88f910e0615f8a3, %r16, %r29
	setx  0x0364630183c7f08d, %r16, %r30
	setx  0xe4792d40a6d009a8, %r16, %r31
	setx  0x00000000000008b0, %r16, %r9
	setx  0x0000000000000c90, %r16, %r10
	setx  0x00000000000005c0, %r16, %r11
	setx  0x00000000000001a0, %r16, %r12
	setx  0x0000000000000c60, %r16, %r13
	setx  0x0000000000000b20, %r16, %r14
	setx  0x0000000000000d90, %r16, %r15
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
	.word 0xe231000f  ! 1: STH_R	sth	%r17, [%r4 + %r15]
	.word 0xc0f00960  ! 3: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 5: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_0:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_0), 16, 16),1,DC_DATA,42)
	.word 0xfe418009  ! 7: LDSW_R	ldsw	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 9: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xad318f0b  ! 11: SRL_R	srl 	%r6, %r11, %r22
	.word 0xc3e92fcc  ! 12: PREFETCHA_I	prefetcha	[%r4, + 0x0fcc] %asi, #one_read
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 16: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe216ecf  ! 19: STW_I	stw	%r31, [%r5 + 0x0ecf]
	.word 0xc4f00980  ! 21: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 23: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 25: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_1:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_1), 16, 16),1,DC_DATA,52)
	.word 0xfe194009  ! 27: LDD_R	ldd	[%r5 + %r9], %r31
	.word 0xc4f00980  ! 29: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf02a22af  ! 30: STB_I	stb	%r24, [%r8 + 0x02af]
thr3_ic_err_0:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,13,12)
	.word 0xc4f00c00  ! 32: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 34: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 36: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 38: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb529d96f  ! 40: SLLX_R	sllx	%r7, %r15, %r26
	.word 0xc4f00c00  ! 42: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 44: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 46: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 48: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb4296f4d  ! 50: ANDN_I	andn 	%r5, 0x0f4d, %r26
	.word 0xc4f00980  ! 52: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_2:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_2), 16, 16),1,DC_DATA,14)
	.word 0xee01ecd5  ! 56: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xee21c00c  ! 57: STW_R	stw	%r23, [%r7 + %r12]
	.word 0xc4f00c00  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 61: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 63: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_3:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_3), 16, 16),1,DC_DATA,71)
	.word 0xee01ecd5  ! 65: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xc0f009a0  ! 67: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa72a1b4f  ! 69: SLLX_R	sllx	%r8, %r15, %r19
	.word 0xc0f00960  ! 71: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfc69aab8  ! 72: LDSTUB_I	ldstub	%r30, [%r6 + 0x0ab8]
	.word 0xc4f00980  ! 74: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_4:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_4), 16, 16),1,DC_DATA,20)
	.word 0xfe01eacf  ! 76: LDUW_I	lduw	[%r7 + 0x0acf], %r31
thr3_dc_err_5:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_5), 16, 16),1,DC_DATA,69)
	.word 0xfe19c009  ! 78: LDD_R	ldd	[%r7 + %r9], %r31
	.word 0xc4f00c00  ! 80: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc369800d  ! 81: PREFETCH_R	prefetch	[%r6 + %r13], #one_read
	.word 0xc36a000d  ! 82: PREFETCH_R	prefetch	[%r8 + %r13], #one_read
	.word 0xc4f00980  ! 84: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 86: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 88: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 90: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf420e3b8  ! 91: STW_I	stw	%r26, [%r3 + 0x03b8]
thr3_ic_err_1:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,30,5)
thr3_dc_err_6:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_6), 16, 16),1,DC_DATA,41)
	.word 0xe2012e93  ! 93: LDUW_I	lduw	[%r4 + 0x0e93], %r17
thr3_dc_err_7:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_7), 16, 16),1,DC_DATA,33)
	.word 0xe2110009  ! 95: LDUH_R	lduh	[%r4 + %r9], %r17
	.word 0xf4712260  ! 96: STX_I	stx	%r26, [%r4 + 0x0260]
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xb001ed67  ! 98: ADD_I	add 	%r7, 0x0d67, %r24
	.word 0xc4f00c00  ! 100: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf221ab10  ! 103: STW_I	stw	%r25, [%r6 + 0x0b10]
thr3_irf_ce_0:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_0), 16, 16), 1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xe621000b  ! 104: STW_R	stw	%r19, [%r4 + %r11]
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 108: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 110: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb409d94f  ! 112: AND_R	and 	%r7, %r15, %r26
	.word 0xc4f00c00  ! 114: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf270e34b  ! 115: STX_I	stx	%r25, [%r3 + 0x034b]
	.word 0xc4f00980  ! 117: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 119: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 121: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 123: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_8:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_8), 16, 16),1,DC_DATA,65)
	.word 0xf210c009  ! 125: LDUH_R	lduh	[%r3 + %r9], %r25
	.word 0xc0f009a0  ! 127: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 129: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 131: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 133: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_9:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_9), 16, 16),1,DC_DATA,35)
	.word 0xf240c009  ! 135: LDSW_R	ldsw	[%r3 + %r9], %r25
	.word 0xc4f00c00  ! 137: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 139: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 141: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 143: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 147: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 149: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_10:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_10), 16, 16),1,DC_DATA,27)
	.word 0xf250c009  ! 151: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xc0f00960  ! 153: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_11:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_11), 16, 16),1,DC_DATA,54)
	.word 0xf250c009  ! 155: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xf479400e  ! 156: SWAP_R	swap	%r26, [%r5 + %r14]
	.word 0xc0f009a0  ! 158: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 160: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 162: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 164: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 166: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 168: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 170: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_12:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_12), 16, 16),1,DC_DATA,62)
	.word 0xfe598009  ! 172: LDX_R	ldx	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 174: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb431fdd6  ! 176: ORN_I	orn 	%r7, 0xfffffdd6, %r26
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 182: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xad29bf01  ! 184: SLLX_I	sllx	%r6, 0x0001, %r22
	.word 0xf05227b0  ! 185: LDSH_I	ldsh	[%r8 + 0x07b0], %r24
!Generating an illinst
	.word 0xa9298d0e  ! 187: SLL_R	sll 	%r6, %r14, %r20
	.word 0xc4f00c00  ! 189: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 191: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbc08cb2e  ! 193: AND_R	and 	%r3, %r14, %r30
	.word 0xc0f00960  ! 195: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 197: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 199: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 201: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 203: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 205: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb231cd4b  ! 207: ORN_R	orn 	%r7, %r11, %r25
	.word 0xc0f00960  ! 209: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 211: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 213: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 215: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 217: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_13:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_13), 16, 16),1,DC_DATA,71)
	.word 0xea41c009  ! 219: LDSW_R	ldsw	[%r7 + %r9], %r21
	.word 0xc0f009a0  ! 221: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_14:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_14), 16, 16),1,DC_DATA,58)
	.word 0xea01c009  ! 223: LDUW_R	lduw	[%r7 + %r9], %r21
	.word 0xc0f00960  ! 225: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_15:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_15), 16, 16),1,DC_DATA,41)
	.word 0xea59c009  ! 227: LDX_R	ldx	[%r7 + %r9], %r21
	.word 0xc4f00980  ! 229: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb129df4c  ! 231: SLL_R	sllx	%r7, %r12, %r24
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 235: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xb1a2092d  ! 238: FMULs	fmuls	%f8, %f13, %f24
	.word 0xf01a25f8  ! 239: LDD_I	ldd	[%r8 + 0x05f8], %r24
!Generating an illinst
	.word 0xb030ff7b  ! 241: ORN_I	orn 	%r3, 0xffffff7b, %r24
!Generating an illinst
	.word 0xbb781d2d  ! 243: MOVR_R	movvs	%r0, %r13, %r29
	.word 0xc0f009a0  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 247: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 249: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 251: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 253: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 255: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf429800c  ! 256: STB_R	stb	%r26, [%r6 + %r12]
	.word 0xf822000f  ! 256: STW_R	stw	%r28, [%r8 + %r15]
	.word 0xea2a000e  ! 256: STB_R	stb	%r21, [%r8 + %r14]
	.word 0xe221800b  ! 256: STW_R	stw	%r17, [%r6 + %r11]
	.word 0xfa21000d  ! 256: STW_R	stw	%r29, [%r4 + %r13]
	.word 0xfe71c00c  ! 256: STX_R	stx	%r31, [%r7 + %r12]
	.word 0xc0f00960  ! 258: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_16:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_16), 16, 16),1,DC_DATA,40)
	.word 0xfc022443  ! 260: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr3_dc_err_17:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_17), 16, 16),1,DC_DATA,24)
	.word 0xfc5a0009  ! 262: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_18:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_18), 16, 16),1,DC_DATA,60)
	.word 0xfc022443  ! 266: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr3_dc_err_19:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_19), 16, 16),1,DC_DATA,10)
	.word 0xfc020009  ! 268: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xe429000d  ! 269: STB_R	stb	%r18, [%r4 + %r13]
thr3_ic_err_2:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_2), 16, 16),1,IC_DATA,NIR,x,3)
	.word 0xe621eb0b  ! 270: STW_I	stw	%r19, [%r7 + 0x0b0b]
	.word 0xc0f009a0  ! 272: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 274: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 276: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_20:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_20), 16, 16),1,DC_DATA,49)
	.word 0xe651c009  ! 278: LDSH_R	ldsh	[%r7 + %r9], %r19
thr3_dc_err_21:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_21), 16, 16),1,DC_DATA,46)
	.word 0xe651c009  ! 280: LDSH_R	ldsh	[%r7 + %r9], %r19
thr3_dc_err_22:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_22), 16, 16),1,DC_DATA,50)
	.word 0xe659c009  ! 282: LDX_R	ldx	[%r7 + %r9], %r19
	.word 0xc0f00960  ! 284: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfca9500e  ! 285: STBA_R	stba	%r30, [%r5 + %r14] 0x80
	.word 0xe4b9500b  ! 286: STDA_R	stda	%r18, [%r5 + %r11] 0x80
	.word 0xc4f00c00  ! 288: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_23:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_23), 16, 16),1,DC_DATA,33)
	.word 0xfa498009  ! 290: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc0f00960  ! 292: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 294: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 296: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xab29cf6e  ! 298: SLL_R	sll 	%r7, %r14, %r21
	.word 0xc4f00c00  ! 300: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_24:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_24), 16, 16),1,DC_DATA,22)
	.word 0xfa018009  ! 302: LDUW_R	lduw	[%r6 + %r9], %r29
thr3_dc_err_25:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_25), 16, 16),1,DC_DATA,17)
	.word 0xfa418009  ! 304: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00980  ! 306: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 308: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 310: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_26:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_26), 16, 16),1,DC_DATA,2)
	.word 0xfa498009  ! 312: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 314: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_27:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_27), 16, 16),1,DC_DATA,18)
	.word 0xfa01a443  ! 316: LDUW_I	lduw	[%r6 + 0x0443], %r29
	.word 0x8143c000  ! 317: STBAR	stbar
thr3_dc_err_28:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_28), 16, 16),1,DC_DATA,2)
	.word 0xfa418009  ! 319: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 321: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf031400e  ! 322: STH_R	sth	%r24, [%r5 + %r14]
thr3_irf_ce_1:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_1), 16, 16), 1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_29:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_29), 16, 16),1,DC_DATA,44)
	.word 0xe8012443  ! 326: LDUW_I	lduw	[%r4 + 0x0443], %r20
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf631a658  ! 329: STH_I	sth	%r27, [%r6 + 0x0658]
	.word 0xf828c00f  ! 329: STB_R	stb	%r28, [%r3 + %r15]
	.word 0xe2322532  ! 329: STH_I	sth	%r17, [%r8 + 0x0532]
	.word 0xe43221fc  ! 329: STH_I	sth	%r18, [%r8 + 0x01fc]
	.word 0xf631a2f4  ! 329: STH_I	sth	%r27, [%r6 + 0x02f4]
	.word 0xc0f00960  ! 331: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xab297961  ! 333: SLLX_I	sllx	%r5, 0x0021, %r21
	.word 0xc4f00980  ! 335: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_30:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_30), 16, 16),1,DC_DATA,2)
	.word 0xfe022179  ! 339: LDUW_I	lduw	[%r8 + 0x0179], %r31
!Generating an illinst
	.word 0xaf781d6c  ! 341: MOVR_R	movvs	%r0, %r12, %r23
	.word 0xc0f009a0  ! 343: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 345: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_31:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_31), 16, 16),1,DC_DATA,47)
	.word 0xfe020009  ! 347: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xf631a348  ! 348: STH_I	sth	%r27, [%r6 + 0x0348]
	.word 0xfe31e71e  ! 348: STH_I	sth	%r31, [%r7 + 0x071e]
	.word 0xe671000f  ! 348: STX_R	stx	%r19, [%r4 + %r15]
	.word 0xee20e2cc  ! 348: STW_I	stw	%r23, [%r3 + 0x02cc]
	.word 0xfa21c00b  ! 348: STW_R	stw	%r29, [%r7 + %r11]
	.word 0xf4296b3f  ! 348: STB_I	stb	%r26, [%r5 + 0x0b3f]
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_32:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_32), 16, 16),1,DC_DATA,21)
	.word 0xe218c009  ! 352: LDD_R	ldd	[%r3 + %r9], %r17
	.word 0xc0f00960  ! 354: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0x8143c000  ! 355: STBAR	stbar
!Generating an illinst
	.word 0xb329cf6f  ! 357: SLL_R	sll 	%r7, %r15, %r25
	.word 0xc0f00960  ! 359: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 361: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe67166f8  ! 362: STX_I	stx	%r19, [%r5 + 0x06f8]
	.word 0xe622000e  ! 362: STW_R	stw	%r19, [%r8 + %r14]
	.word 0xee21c00e  ! 362: STW_R	stw	%r23, [%r7 + %r14]
	.word 0xc0f009a0  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xb3396001  ! 365: SRA_I	sra 	%r5, 0x0001, %r25
	.word 0xa211c00e  ! 365: OR_R	or 	%r7, %r14, %r17
	.word 0xb00161dd  ! 365: ADD_I	add 	%r5, 0x01dd, %r24
	.word 0xb212000c  ! 365: OR_R	or 	%r8, %r12, %r25
thr3_dc_err_33:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_33), 16, 16),1,DC_DATA,23)
	.word 0xe2518009  ! 367: LDSH_R	ldsh	[%r6 + %r9], %r17
	.word 0xc4f00c00  ! 369: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 371: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xe820eab4  ! 372: STW_I	stw	%r20, [%r3 + 0x0ab4]
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xbb397001  ! 373: SRAX_I	srax	%r5, 0x0001, %r29
	.word 0xa83a27df  ! 373: XNOR_I	xnor 	%r8, 0x07df, %r20
	.word 0xbd3a100d  ! 373: SRAX_R	srax	%r8, %r13, %r30
	.word 0xad782401  ! 373: MOVR_I	move	%r0, 0xb, %r22
	.word 0xc0f00960  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf458e680  ! 376: LDX_I	ldx	[%r3 + 0x0680], %r26
	.word 0xc4f00980  ! 378: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xaa09092e  ! 380: AND_R	and 	%r4, %r14, %r21
!Generating an illinst
	.word 0xa7781f0c  ! 382: MOVR_R	movvs	%r0, %r12, %r19
!Generating an illinst
	.word 0xb0011f2e  ! 384: ADD_R	add 	%r4, %r14, %r24
	.word 0xc0f009a0  ! 386: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 388: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xae313f6f  ! 390: ORN_I	orn 	%r4, 0xffffff6f, %r23
	.word 0xc0f00960  ! 392: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 394: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 396: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_34:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_34), 16, 16),1,DC_DATA,53)
	.word 0xfa58c009  ! 398: LDX_R	ldx	[%r3 + %r9], %r29
thr3_dc_err_35:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_35), 16, 16),1,DC_DATA,21)
	.word 0xfa18c009  ! 400: LDD_R	ldd	[%r3 + %r9], %r29
thr3_dc_err_36:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_36), 16, 16),1,DC_DATA,39)
	.word 0xfa50c009  ! 402: LDSH_R	ldsh	[%r3 + %r9], %r29
	.word 0xc4f00980  ! 404: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xaa396dcc  ! 405: XNOR_I	xnor 	%r5, 0x0dcc, %r21
	.word 0xa81a000b  ! 405: XOR_R	xor 	%r8, %r11, %r20
	.word 0xbf28e001  ! 405: SLL_I	sll 	%r3, 0x0001, %r31
thr3_dc_err_37:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_37), 16, 16),1,DC_DATA,0)
	.word 0xfe520009  ! 407: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc4f00c00  ! 409: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xab391d6b  ! 411: SRA_R	srax	%r4, %r11, %r21
	.word 0xc4f00c00  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 415: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0x8143e047  ! 416: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Sync 
thr3_dc_err_38:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_38), 16, 16),1,DC_DATA,16)
	.word 0xfe5a0009  ! 418: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xee22000b  ! 421: STW_R	stw	%r23, [%r8 + %r11]
thr3_ic_err_3:
!ic err IR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_3), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xc0f00960  ! 423: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 425: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_39:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_39), 16, 16),1,DC_DATA,33)
	.word 0xea110009  ! 427: LDUH_R	lduh	[%r4 + %r9], %r21
!Generating an illinst
	.word 0xb629ffcf  ! 429: ANDN_I	andn 	%r7, 0xffffffcf, %r27
!Generating an illinst
	.word 0xbd31196f  ! 431: SRLX_R	srlx	%r4, %r15, %r30
	.word 0xea29000c  ! 432: STB_R	stb	%r21, [%r4 + %r12]
	.word 0xc0f009a0  ! 434: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 436: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_40:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_40), 16, 16),1,DC_DATA,63)
	.word 0xea010009  ! 438: LDUW_R	lduw	[%r4 + %r9], %r21
	.word 0xc0f009a0  ! 440: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_41:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_41), 16, 16),1,DC_DATA,69)
	.word 0xea490009  ! 442: LDSB_R	ldsb	[%r4 + %r9], %r21
	.word 0xba0a000e  ! 443: AND_R	and 	%r8, %r14, %r29
	.word 0xfa20edc0  ! 444: STW_I	stw	%r29, [%r3 + 0x0dc0]
	.word 0xf229c00e  ! 444: STB_R	stb	%r25, [%r7 + %r14]
	.word 0xf62a2c9b  ! 444: STB_I	stb	%r27, [%r8 + 0x0c9b]
	.word 0xf622000f  ! 444: STW_R	stw	%r27, [%r8 + %r15]
	.word 0xf231400e  ! 444: STH_R	sth	%r25, [%r5 + %r14]
	.word 0xf22a000d  ! 444: STB_R	stb	%r25, [%r8 + %r13]
	.word 0xf82120e4  ! 444: STW_I	stw	%r28, [%r4 + 0x00e4]
	.word 0xc0f00960  ! 446: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 448: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_42:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_42), 16, 16),1,DC_DATA,61)
	.word 0xe4594009  ! 450: LDX_R	ldx	[%r5 + %r9], %r18
	.word 0xc0f009a0  ! 452: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb2091d6c  ! 456: AND_R	and 	%r4, %r12, %r25
!Generating an illinst
	.word 0xbe097be8  ! 458: AND_I	and 	%r5, 0xfffffbe8, %r31
!Generating an illinst
	.word 0xbf297b41  ! 460: SLLX_I	sllx	%r5, 0x0001, %r31
!Generating an illinst
	.word 0xa42a2f5d  ! 462: ANDN_I	andn 	%r8, 0x0f5d, %r18
	.word 0xc0f009a0  ! 464: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_43:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_43), 16, 16),1,DC_DATA,59)
	.word 0xe4414009  ! 468: LDSW_R	ldsw	[%r5 + %r9], %r18
	.word 0xe871000b  ! 469: STX_R	stx	%r20, [%r4 + %r11]
	.word 0xe671400e  ! 469: STX_R	stx	%r19, [%r5 + %r14]
	.word 0xfe2a000d  ! 469: STB_R	stb	%r31, [%r8 + %r13]
	.word 0xf821800b  ! 469: STW_R	stw	%r28, [%r6 + %r11]
	.word 0xec71ae80  ! 469: STX_I	stx	%r22, [%r6 + 0x0e80]
	.word 0xfa30c00e  ! 469: STH_R	sth	%r29, [%r3 + %r14]
	.word 0xc0f00960  ! 471: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_44:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_44), 16, 16),1,DC_DATA,11)
	.word 0xf0020009  ! 473: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xe92168a0  ! 474: STF_I	st	%f20, [0x08a0, %r5]
	.word 0xc4f00980  ! 476: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_45:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_45), 16, 16),1,DC_DATA,47)
	.word 0xee012e05  ! 478: LDUW_I	lduw	[%r4 + 0x0e05], %r23
	.word 0xc4f00980  ! 480: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb230d90b  ! 482: ORN_R	orn 	%r3, %r11, %r25
	.word 0xc4f00c00  ! 484: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 486: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbf319b4f  ! 488: SRLX_R	srlx	%r6, %r15, %r31
	.word 0xc0f009a0  ! 490: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 492: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa8116f4a  ! 494: OR_I	or 	%r5, 0x0f4a, %r20
thr3_dc_err_46:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_46), 16, 16),1,DC_DATA,18)
	.word 0xee590009  ! 496: LDX_R	ldx	[%r4 + %r9], %r23
	.word 0xfe10e9ce  ! 497: LDUH_I	lduh	[%r3 + 0x09ce], %r31
	.word 0xc0f00960  ! 499: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx  0x7e3ac166370d41f9, %r16, %r17
	setx  0x61c14425e59ea041, %r16, %r18
	setx  0x69af63af6a02529a, %r16, %r19
	setx  0x0442a19f70121298, %r16, %r20
	setx  0xef7fa916a1cbefe1, %r16, %r21
	setx  0xa17695d4f3afe4ce, %r16, %r22
	setx  0xbed39a0641238cc3, %r16, %r23
	setx  0x3c4f81916dac5b51, %r16, %r24
	setx  0x37b2eec805713a0c, %r16, %r25
	setx  0x0e40460e81032125, %r16, %r26
	setx  0xfb194e12c4cb9b3a, %r16, %r27
	setx  0x9ff256a11b70d4c3, %r16, %r28
	setx  0x130687eeb4977b7f, %r16, %r29
	setx  0xb2c52316c7a3a6f2, %r16, %r30
	setx  0xf78fa956ebb572f1, %r16, %r31
	setx  0x00000000000004f0, %r16, %r9
	setx  0x0000000000000f40, %r16, %r10
	setx  0x0000000000000090, %r16, %r11
	setx  0x00000000000003d0, %r16, %r12
	setx  0x0000000000000ab0, %r16, %r13
	setx  0x0000000000000150, %r16, %r14
	setx  0x0000000000000f60, %r16, %r15
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
	.word 0xe631400f  ! 1: STH_R	sth	%r19, [%r5 + %r15]
	.word 0xc0f00960  ! 3: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 5: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_0:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_0), 16, 16),1,DC_DATA,42)
	.word 0xfe418009  ! 7: LDSW_R	ldsw	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 9: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbd320b6c  ! 11: SRL_R	srl 	%r8, %r12, %r30
	.word 0xc3e9ee3c  ! 12: PREFETCHA_I	prefetcha	[%r7, + 0x0e3c] %asi, #one_read
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 16: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe216d2b  ! 19: STW_I	stw	%r31, [%r5 + 0x0d2b]
	.word 0xc4f00980  ! 21: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 23: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 25: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_1:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_1), 16, 16),1,DC_DATA,52)
	.word 0xfe194009  ! 27: LDD_R	ldd	[%r5 + %r9], %r31
	.word 0xc4f00980  ! 29: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfe2929ef  ! 30: STB_I	stb	%r31, [%r4 + 0x09ef]
thr2_ic_err_0:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,13,12)
	.word 0xc4f00c00  ! 32: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 34: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 36: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 38: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb528dd6c  ! 40: SLLX_R	sllx	%r3, %r12, %r26
	.word 0xc4f00c00  ! 42: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 44: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 46: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 48: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb4297bf5  ! 50: ANDN_I	andn 	%r5, 0xfffffbf5, %r26
	.word 0xc4f00980  ! 52: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_2:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_2), 16, 16),1,DC_DATA,14)
	.word 0xee01ecd5  ! 56: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xee21c00c  ! 57: STW_R	stw	%r23, [%r7 + %r12]
	.word 0xc4f00c00  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 61: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 63: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_3:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_3), 16, 16),1,DC_DATA,71)
	.word 0xee01ecd5  ! 65: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xc0f009a0  ! 67: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa528d92b  ! 69: SLLX_R	sllx	%r3, %r11, %r18
	.word 0xc0f00960  ! 71: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe4696bd3  ! 72: LDSTUB_I	ldstub	%r18, [%r5 + 0x0bd3]
	.word 0xc4f00980  ! 74: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_4:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_4), 16, 16),1,DC_DATA,20)
	.word 0xfe01eacf  ! 76: LDUW_I	lduw	[%r7 + 0x0acf], %r31
thr2_dc_err_5:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_5), 16, 16),1,DC_DATA,69)
	.word 0xfe19c009  ! 78: LDD_R	ldd	[%r7 + %r9], %r31
	.word 0xc4f00c00  ! 80: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc369c00d  ! 81: PREFETCH_R	prefetch	[%r7 + %r13], #one_read
	.word 0xc369400e  ! 82: PREFETCH_R	prefetch	[%r5 + %r14], #one_read
	.word 0xc4f00980  ! 84: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 86: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 88: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 90: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf421e190  ! 91: STW_I	stw	%r26, [%r7 + 0x0190]
thr2_ic_err_1:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,30,5)
thr2_dc_err_6:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_6), 16, 16),1,DC_DATA,41)
	.word 0xe2012e93  ! 93: LDUW_I	lduw	[%r4 + 0x0e93], %r17
thr2_dc_err_7:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_7), 16, 16),1,DC_DATA,33)
	.word 0xe2110009  ! 95: LDUH_R	lduh	[%r4 + %r9], %r17
	.word 0xe871a400  ! 96: STX_I	stx	%r20, [%r6 + 0x0400]
thr2_resum_intr_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xa801bbce  ! 98: ADD_I	add 	%r6, 0xfffffbce, %r20
	.word 0xc4f00c00  ! 100: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf62166a4  ! 103: STW_I	stw	%r27, [%r5 + 0x06a4]
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16), 1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xee20c00f  ! 104: STW_R	stw	%r23, [%r3 + %r15]
thr2_resum_intr_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 108: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 110: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb2091d6b  ! 112: AND_R	and 	%r4, %r11, %r25
	.word 0xc4f00c00  ! 114: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf270e1d9  ! 115: STX_I	stx	%r25, [%r3 + 0x01d9]
	.word 0xc4f00980  ! 117: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 119: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 121: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 123: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_8:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_8), 16, 16),1,DC_DATA,65)
	.word 0xf210c009  ! 125: LDUH_R	lduh	[%r3 + %r9], %r25
	.word 0xc0f009a0  ! 127: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 129: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 131: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 133: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_9:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_9), 16, 16),1,DC_DATA,35)
	.word 0xf240c009  ! 135: LDSW_R	ldsw	[%r3 + %r9], %r25
	.word 0xc4f00c00  ! 137: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 139: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 141: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 143: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 147: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 149: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_10:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_10), 16, 16),1,DC_DATA,27)
	.word 0xf250c009  ! 151: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xc0f00960  ! 153: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_11:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_11), 16, 16),1,DC_DATA,54)
	.word 0xf250c009  ! 155: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xf079400d  ! 156: SWAP_R	swap	%r24, [%r5 + %r13]
	.word 0xc0f009a0  ! 158: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 160: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 162: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 164: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 166: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 168: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 170: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_12:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_12), 16, 16),1,DC_DATA,62)
	.word 0xfe598009  ! 172: LDX_R	ldx	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 174: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb8323f44  ! 176: ORN_I	orn 	%r8, 0xffffff44, %r28
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 182: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xa528fb61  ! 184: SLLX_I	sllx	%r3, 0x0021, %r18
	.word 0xe85127f0  ! 185: LDSH_I	ldsh	[%r4 + 0x07f0], %r20
!Generating an illinst
	.word 0xa5294d0f  ! 187: SLL_R	sll 	%r5, %r15, %r18
	.word 0xc4f00c00  ! 189: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 191: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xae08cf2f  ! 193: AND_R	and 	%r3, %r15, %r23
	.word 0xc0f00960  ! 195: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 197: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 199: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 201: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 203: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 205: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xae31096f  ! 207: ORN_R	orn 	%r4, %r15, %r23
	.word 0xc0f00960  ! 209: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 211: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 213: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 215: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 217: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_13:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_13), 16, 16),1,DC_DATA,71)
	.word 0xea41c009  ! 219: LDSW_R	ldsw	[%r7 + %r9], %r21
	.word 0xc0f009a0  ! 221: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_14:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_14), 16, 16),1,DC_DATA,58)
	.word 0xea01c009  ! 223: LDUW_R	lduw	[%r7 + %r9], %r21
	.word 0xc0f00960  ! 225: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_15:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_15), 16, 16),1,DC_DATA,41)
	.word 0xea59c009  ! 227: LDX_R	ldx	[%r7 + %r9], %r21
	.word 0xc4f00980  ! 229: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb928c96f  ! 231: SLL_R	sll 	%r3, %r15, %r28
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 235: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xada1c92e  ! 238: FMULs	fmuls	%f7, %f14, %f22
	.word 0xfc1922f0  ! 239: LDD_I	ldd	[%r4 + 0x02f0], %r30
!Generating an illinst
	.word 0xb830ef78  ! 241: ORN_I	orn 	%r3, 0x0f78, %r28
!Generating an illinst
	.word 0xaf781d0b  ! 243: MOVR_R	movvs	%r0, %r11, %r23
	.word 0xc0f009a0  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 247: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 249: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 251: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 253: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 255: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf629c00b  ! 256: STB_R	stb	%r27, [%r7 + %r11]
	.word 0xf222000b  ! 256: STW_R	stw	%r25, [%r8 + %r11]
	.word 0xec28c00c  ! 256: STB_R	stb	%r22, [%r3 + %r12]
	.word 0xe821000d  ! 256: STW_R	stw	%r20, [%r4 + %r13]
	.word 0xf821000f  ! 256: STW_R	stw	%r28, [%r4 + %r15]
	.word 0xf071400d  ! 256: STX_R	stx	%r24, [%r5 + %r13]
	.word 0xc0f00960  ! 258: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_16:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_16), 16, 16),1,DC_DATA,40)
	.word 0xfc022443  ! 260: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr2_dc_err_17:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_17), 16, 16),1,DC_DATA,24)
	.word 0xfc5a0009  ! 262: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_18:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_18), 16, 16),1,DC_DATA,60)
	.word 0xfc022443  ! 266: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr2_dc_err_19:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_19), 16, 16),1,DC_DATA,10)
	.word 0xfc020009  ! 268: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xec29c00b  ! 269: STB_R	stb	%r22, [%r7 + %r11]
thr2_ic_err_2:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_2), 16, 16),1,IC_DATA,NIR,x,3)
	.word 0xe621e5f5  ! 270: STW_I	stw	%r19, [%r7 + 0x05f5]
	.word 0xc0f009a0  ! 272: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 274: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 276: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_20:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_20), 16, 16),1,DC_DATA,49)
	.word 0xe651c009  ! 278: LDSH_R	ldsh	[%r7 + %r9], %r19
thr2_dc_err_21:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_21), 16, 16),1,DC_DATA,46)
	.word 0xe651c009  ! 280: LDSH_R	ldsh	[%r7 + %r9], %r19
thr2_dc_err_22:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_22), 16, 16),1,DC_DATA,50)
	.word 0xe659c009  ! 282: LDX_R	ldx	[%r7 + %r9], %r19
	.word 0xc0f00960  ! 284: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfea9500d  ! 285: STBA_R	stba	%r31, [%r5 + %r13] 0x80
	.word 0xfcb9500c  ! 286: STDA_R	stda	%r30, [%r5 + %r12] 0x80
	.word 0xc4f00c00  ! 288: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_23:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_23), 16, 16),1,DC_DATA,33)
	.word 0xfa498009  ! 290: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc0f00960  ! 292: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 294: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 296: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb529df0b  ! 298: SLL_R	sllx	%r7, %r11, %r26
	.word 0xc4f00c00  ! 300: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_24:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_24), 16, 16),1,DC_DATA,22)
	.word 0xfa018009  ! 302: LDUW_R	lduw	[%r6 + %r9], %r29
thr2_dc_err_25:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_25), 16, 16),1,DC_DATA,17)
	.word 0xfa418009  ! 304: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00980  ! 306: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 308: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 310: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_26:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_26), 16, 16),1,DC_DATA,2)
	.word 0xfa498009  ! 312: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 314: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_27:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_27), 16, 16),1,DC_DATA,18)
	.word 0xfa01a443  ! 316: LDUW_I	lduw	[%r6 + 0x0443], %r29
	.word 0x8143c000  ! 317: STBAR	stbar
thr2_dc_err_28:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_28), 16, 16),1,DC_DATA,2)
	.word 0xfa418009  ! 319: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 321: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf030c00b  ! 322: STH_R	sth	%r24, [%r3 + %r11]
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16), 1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_29:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_29), 16, 16),1,DC_DATA,44)
	.word 0xe8012443  ! 326: LDUW_I	lduw	[%r4 + 0x0443], %r20
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xea30e594  ! 329: STH_I	sth	%r21, [%r3 + 0x0594]
	.word 0xee29800d  ! 329: STB_R	stb	%r23, [%r6 + %r13]
	.word 0xec30ecaa  ! 329: STH_I	sth	%r22, [%r3 + 0x0caa]
	.word 0xf2312328  ! 329: STH_I	sth	%r25, [%r4 + 0x0328]
	.word 0xe8312906  ! 329: STH_I	sth	%r20, [%r4 + 0x0906]
	.word 0xc0f00960  ! 331: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xa9293b61  ! 333: SLLX_I	sllx	%r4, 0x0021, %r20
	.word 0xc4f00980  ! 335: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_30:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_30), 16, 16),1,DC_DATA,2)
	.word 0xfe022179  ! 339: LDUW_I	lduw	[%r8 + 0x0179], %r31
!Generating an illinst
	.word 0xab781f2e  ! 341: MOVR_R	movvs	%r0, %r14, %r21
	.word 0xc0f009a0  ! 343: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 345: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_31:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_31), 16, 16),1,DC_DATA,47)
	.word 0xfe020009  ! 347: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xe431a1c2  ! 348: STH_I	sth	%r18, [%r6 + 0x01c2]
	.word 0xee31e0a8  ! 348: STH_I	sth	%r23, [%r7 + 0x00a8]
	.word 0xf470c00e  ! 348: STX_R	stx	%r26, [%r3 + %r14]
	.word 0xfc20ef38  ! 348: STW_I	stw	%r30, [%r3 + 0x0f38]
	.word 0xfa20c00e  ! 348: STW_R	stw	%r29, [%r3 + %r14]
	.word 0xf62a2b58  ! 348: STB_I	stb	%r27, [%r8 + 0x0b58]
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_32:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_32), 16, 16),1,DC_DATA,21)
	.word 0xe218c009  ! 352: LDD_R	ldd	[%r3 + %r9], %r17
	.word 0xc0f00960  ! 354: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0x8143c000  ! 355: STBAR	stbar
!Generating an illinst
	.word 0xb928cf0c  ! 357: SLL_R	sll 	%r3, %r12, %r28
	.word 0xc0f00960  ! 359: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 361: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe671e530  ! 362: STX_I	stx	%r19, [%r7 + 0x0530]
	.word 0xee21400c  ! 362: STW_R	stw	%r23, [%r5 + %r12]
	.word 0xe821400c  ! 362: STW_R	stw	%r20, [%r5 + %r12]
	.word 0xc0f009a0  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xbd3a2001  ! 365: SRA_I	sra 	%r8, 0x0001, %r30
	.word 0xb611800e  ! 365: OR_R	or 	%r6, %r14, %r27
	.word 0xbc022357  ! 365: ADD_I	add 	%r8, 0x0357, %r30
	.word 0xb811c00f  ! 365: OR_R	or 	%r7, %r15, %r28
thr2_dc_err_33:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_33), 16, 16),1,DC_DATA,23)
	.word 0xe2518009  ! 367: LDSH_R	ldsh	[%r6 + %r9], %r17
	.word 0xc4f00c00  ! 369: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 371: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xe62221ac  ! 372: STW_I	stw	%r19, [%r8 + 0x01ac]
thr2_resum_intr_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xb73a3001  ! 373: SRAX_I	srax	%r8, 0x0001, %r27
	.word 0xbe3962c5  ! 373: XNOR_I	xnor 	%r5, 0x02c5, %r31
	.word 0xb73a100e  ! 373: SRAX_R	srax	%r8, %r14, %r27
	.word 0xb9782401  ! 373: MOVR_I	move	%r0, 0xb, %r28
	.word 0xc0f00960  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf85a2a48  ! 376: LDX_I	ldx	[%r8 + 0x0a48], %r28
	.word 0xc4f00980  ! 378: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xbc0a0b0b  ! 380: AND_R	and 	%r8, %r11, %r30
!Generating an illinst
	.word 0xbb780f4d  ! 382: MOVR_R	movl	%r0, %r13, %r29
!Generating an illinst
	.word 0xa4020f2e  ! 384: ADD_R	add 	%r8, %r14, %r18
	.word 0xc0f009a0  ! 386: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 388: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb431af6b  ! 390: ORN_I	orn 	%r6, 0x0f6b, %r26
	.word 0xc0f00960  ! 392: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 394: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 396: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_34:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_34), 16, 16),1,DC_DATA,53)
	.word 0xfa58c009  ! 398: LDX_R	ldx	[%r3 + %r9], %r29
thr2_dc_err_35:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_35), 16, 16),1,DC_DATA,21)
	.word 0xfa18c009  ! 400: LDD_R	ldd	[%r3 + %r9], %r29
thr2_dc_err_36:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_36), 16, 16),1,DC_DATA,39)
	.word 0xfa50c009  ! 402: LDSH_R	ldsh	[%r3 + %r9], %r29
	.word 0xc4f00980  ! 404: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xb838e7c4  ! 405: XNOR_I	xnor 	%r3, 0x07c4, %r28
	.word 0xac19800f  ! 405: XOR_R	xor 	%r6, %r15, %r22
	.word 0xab29a001  ! 405: SLL_I	sll 	%r6, 0x0001, %r21
thr2_dc_err_37:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_37), 16, 16),1,DC_DATA,0)
	.word 0xfe520009  ! 407: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc4f00c00  ! 409: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbf39db2b  ! 411: SRA_R	srax	%r7, %r11, %r31
	.word 0xc4f00c00  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 415: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0x8143e062  ! 416: MEMBAR	membar	#StoreLoad | #MemIssue | #Sync 
thr2_dc_err_38:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_38), 16, 16),1,DC_DATA,16)
	.word 0xfe5a0009  ! 418: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe420c00d  ! 421: STW_R	stw	%r18, [%r3 + %r13]
thr2_ic_err_3:
!ic err IR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_3), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xc0f00960  ! 423: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 425: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_39:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_39), 16, 16),1,DC_DATA,33)
	.word 0xea110009  ! 427: LDUH_R	lduh	[%r4 + %r9], %r21
!Generating an illinst
	.word 0xb629ed69  ! 429: ANDN_I	andn 	%r7, 0x0d69, %r27
!Generating an illinst
	.word 0xbf30d94c  ! 431: SRLX_R	srlx	%r3, %r12, %r31
	.word 0xea29000c  ! 432: STB_R	stb	%r21, [%r4 + %r12]
	.word 0xc0f009a0  ! 434: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 436: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_40:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_40), 16, 16),1,DC_DATA,63)
	.word 0xea010009  ! 438: LDUW_R	lduw	[%r4 + %r9], %r21
	.word 0xc0f009a0  ! 440: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_41:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_41), 16, 16),1,DC_DATA,69)
	.word 0xea490009  ! 442: LDSB_R	ldsb	[%r4 + %r9], %r21
	.word 0xb409c00b  ! 443: AND_R	and 	%r7, %r11, %r26
	.word 0xec21a6f0  ! 444: STW_I	stw	%r22, [%r6 + 0x06f0]
	.word 0xf029400d  ! 444: STB_R	stb	%r24, [%r5 + %r13]
	.word 0xfe29ede2  ! 444: STB_I	stb	%r31, [%r7 + 0x0de2]
	.word 0xf821400c  ! 444: STW_R	stw	%r28, [%r5 + %r12]
	.word 0xf231c00d  ! 444: STH_R	sth	%r25, [%r7 + %r13]
	.word 0xe82a000b  ! 444: STB_R	stb	%r20, [%r8 + %r11]
	.word 0xfa21ad5c  ! 444: STW_I	stw	%r29, [%r6 + 0x0d5c]
	.word 0xc0f00960  ! 446: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 448: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_42:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_42), 16, 16),1,DC_DATA,61)
	.word 0xe4594009  ! 450: LDX_R	ldx	[%r5 + %r9], %r18
	.word 0xc0f009a0  ! 452: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbe098d2c  ! 456: AND_R	and 	%r6, %r12, %r31
!Generating an illinst
	.word 0xa8096f91  ! 458: AND_I	and 	%r5, 0x0f91, %r20
!Generating an illinst
	.word 0xa9297901  ! 460: SLLX_I	sllx	%r5, 0x0001, %r20
!Generating an illinst
	.word 0xa62a2fb4  ! 462: ANDN_I	andn 	%r8, 0x0fb4, %r19
	.word 0xc0f009a0  ! 464: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_43:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_43), 16, 16),1,DC_DATA,59)
	.word 0xe4414009  ! 468: LDSW_R	ldsw	[%r5 + %r9], %r18
	.word 0xea71c00e  ! 469: STX_R	stx	%r21, [%r7 + %r14]
	.word 0xec71000c  ! 469: STX_R	stx	%r22, [%r4 + %r12]
	.word 0xf629000c  ! 469: STB_R	stb	%r27, [%r4 + %r12]
	.word 0xfc21400c  ! 469: STW_R	stw	%r30, [%r5 + %r12]
	.word 0xfc716920  ! 469: STX_I	stx	%r30, [%r5 + 0x0920]
	.word 0xfc31800e  ! 469: STH_R	sth	%r30, [%r6 + %r14]
	.word 0xc0f00960  ! 471: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_44:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_44), 16, 16),1,DC_DATA,11)
	.word 0xf0020009  ! 473: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xe9216344  ! 474: STF_I	st	%f20, [0x0344, %r5]
	.word 0xc4f00980  ! 476: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_45:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_45), 16, 16),1,DC_DATA,47)
	.word 0xee012e05  ! 478: LDUW_I	lduw	[%r4 + 0x0e05], %r23
	.word 0xc4f00980  ! 480: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa631190f  ! 482: ORN_R	orn 	%r4, %r15, %r19
	.word 0xc4f00c00  ! 484: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 486: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa7311d0d  ! 488: SRLX_R	srlx	%r4, %r13, %r19
	.word 0xc0f009a0  ! 490: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 492: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa6117be9  ! 494: OR_I	or 	%r5, 0xfffffbe9, %r19
thr2_dc_err_46:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_46), 16, 16),1,DC_DATA,18)
	.word 0xee590009  ! 496: LDX_R	ldx	[%r4 + %r9], %r23
	.word 0xfc10e46c  ! 497: LDUH_I	lduh	[%r3 + 0x046c], %r30
	.word 0xc0f00960  ! 499: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0x23a7c66b84595b3a, %r16, %r17
	setx  0xec1539cd1dd8d68b, %r16, %r18
	setx  0xb715d53a6dc1642f, %r16, %r19
	setx  0xf88d88d1de8245e7, %r16, %r20
	setx  0x0d43eabb51dcd173, %r16, %r21
	setx  0x2f357316b0f6f085, %r16, %r22
	setx  0xedcff1e28b3d6a3a, %r16, %r23
	setx  0xb28f4c9cee735a08, %r16, %r24
	setx  0x4a6c94a6204029b9, %r16, %r25
	setx  0x869164bfdaf250e6, %r16, %r26
	setx  0xa4f7a313c0679edd, %r16, %r27
	setx  0xe79eb805649b6fc5, %r16, %r28
	setx  0x245a3f6c94cecf95, %r16, %r29
	setx  0x9a4135d83efd3c21, %r16, %r30
	setx  0x6d6bb44ceb74540c, %r16, %r31
	setx  0x0000000000000430, %r16, %r9
	setx  0x0000000000000540, %r16, %r10
	setx  0x0000000000000c00, %r16, %r11
	setx  0x0000000000000920, %r16, %r12
	setx  0x0000000000000f60, %r16, %r13
	setx  0x0000000000000820, %r16, %r14
	setx  0x00000000000008a0, %r16, %r15
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
	.word 0xf632000d  ! 1: STH_R	sth	%r27, [%r8 + %r13]
	.word 0xc0f00960  ! 3: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 5: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,42)
	.word 0xfe418009  ! 7: LDSW_R	ldsw	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 9: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa9311b0b  ! 11: SRL_R	srlx	%r4, %r11, %r20
	.word 0xc3ea29df  ! 12: PREFETCHA_I	prefetcha	[%r8, + 0x09df] %asi, #one_read
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 16: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe21612f  ! 19: STW_I	stw	%r31, [%r5 + 0x012f]
	.word 0xc4f00980  ! 21: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 23: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 25: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,52)
	.word 0xfe194009  ! 27: LDD_R	ldd	[%r5 + %r9], %r31
	.word 0xc4f00980  ! 29: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfe2a2ee0  ! 30: STB_I	stb	%r31, [%r8 + 0x0ee0]
thr1_ic_err_0:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,13,12)
	.word 0xc4f00c00  ! 32: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 34: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 36: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 38: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa528d96d  ! 40: SLLX_R	sllx	%r3, %r13, %r18
	.word 0xc4f00c00  ! 42: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 44: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 46: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 48: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xac296fca  ! 50: ANDN_I	andn 	%r5, 0x0fca, %r22
	.word 0xc4f00980  ! 52: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,14)
	.word 0xee01ecd5  ! 56: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xee21c00c  ! 57: STW_R	stw	%r23, [%r7 + %r12]
	.word 0xc4f00c00  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 61: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 63: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,71)
	.word 0xee01ecd5  ! 65: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xc0f009a0  ! 67: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xaf28db4b  ! 69: SLLX_R	sllx	%r3, %r11, %r23
	.word 0xc0f00960  ! 71: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe268e478  ! 72: LDSTUB_I	ldstub	%r17, [%r3 + 0x0478]
	.word 0xc4f00980  ! 74: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,20)
	.word 0xfe01eacf  ! 76: LDUW_I	lduw	[%r7 + 0x0acf], %r31
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,69)
	.word 0xfe19c009  ! 78: LDD_R	ldd	[%r7 + %r9], %r31
	.word 0xc4f00c00  ! 80: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc368c00c  ! 81: PREFETCH_R	prefetch	[%r3 + %r12], #one_read
	.word 0xc36a000c  ! 82: PREFETCH_R	prefetch	[%r8 + %r12], #one_read
	.word 0xc4f00980  ! 84: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 86: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 88: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 90: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe22167bc  ! 91: STW_I	stw	%r17, [%r5 + 0x07bc]
thr1_ic_err_1:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,30,5)
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,41)
	.word 0xe2012e93  ! 93: LDUW_I	lduw	[%r4 + 0x0e93], %r17
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,33)
	.word 0xe2110009  ! 95: LDUH_R	lduh	[%r4 + %r9], %r17
	.word 0xe8722920  ! 96: STX_I	stx	%r20, [%r8 + 0x0920]
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xbe013df3  ! 98: ADD_I	add 	%r4, 0xfffffdf3, %r31
	.word 0xc4f00c00  ! 100: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe6222fb8  ! 103: STW_I	stw	%r19, [%r8 + 0x0fb8]
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16), 1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xf220c00f  ! 104: STW_R	stw	%r25, [%r3 + %r15]
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 108: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 110: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb609992f  ! 112: AND_R	and 	%r6, %r15, %r27
	.word 0xc4f00c00  ! 114: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf270ea6b  ! 115: STX_I	stx	%r25, [%r3 + 0x0a6b]
	.word 0xc4f00980  ! 117: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 119: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 121: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 123: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,65)
	.word 0xf210c009  ! 125: LDUH_R	lduh	[%r3 + %r9], %r25
	.word 0xc0f009a0  ! 127: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 129: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 131: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 133: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,35)
	.word 0xf240c009  ! 135: LDSW_R	ldsw	[%r3 + %r9], %r25
	.word 0xc4f00c00  ! 137: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 139: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 141: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 143: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 147: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 149: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,27)
	.word 0xf250c009  ! 151: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xc0f00960  ! 153: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,54)
	.word 0xf250c009  ! 155: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xfe79000f  ! 156: SWAP_R	swap	%r31, [%r4 + %r15]
	.word 0xc0f009a0  ! 158: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 160: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 162: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 164: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 166: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 168: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 170: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,62)
	.word 0xfe598009  ! 172: LDX_R	ldx	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 174: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb031af2b  ! 176: ORN_I	orn 	%r6, 0x0f2b, %r24
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 182: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbd29bb01  ! 184: SLLX_I	sllx	%r6, 0x0001, %r30
	.word 0xfa5225f6  ! 185: LDSH_I	ldsh	[%r8 + 0x05f6], %r29
!Generating an illinst
	.word 0xa929cd6c  ! 187: SLL_R	sll 	%r7, %r12, %r20
	.word 0xc4f00c00  ! 189: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 191: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa209c92b  ! 193: AND_R	and 	%r7, %r11, %r17
	.word 0xc0f00960  ! 195: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 197: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 199: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 201: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 203: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 205: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbc31cb4e  ! 207: ORN_R	orn 	%r7, %r14, %r30
	.word 0xc0f00960  ! 209: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 211: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 213: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 215: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 217: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,71)
	.word 0xea41c009  ! 219: LDSW_R	ldsw	[%r7 + %r9], %r21
	.word 0xc0f009a0  ! 221: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,58)
	.word 0xea01c009  ! 223: LDUW_R	lduw	[%r7 + %r9], %r21
	.word 0xc0f00960  ! 225: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,41)
	.word 0xea59c009  ! 227: LDX_R	ldx	[%r7 + %r9], %r21
	.word 0xc4f00980  ! 229: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa728db6f  ! 231: SLL_R	sllx	%r3, %r15, %r19
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 235: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xaba1c92c  ! 238: FMULs	fmuls	%f7, %f12, %f21
	.word 0xf419a708  ! 239: LDD_I	ldd	[%r6 + 0x0708], %r26
!Generating an illinst
	.word 0xa2322d4a  ! 241: ORN_I	orn 	%r8, 0x0d4a, %r17
!Generating an illinst
	.word 0xb9780d6d  ! 243: MOVR_R	movl	%r0, %r13, %r28
	.word 0xc0f009a0  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 247: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 249: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 251: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 253: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 255: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xea29800f  ! 256: STB_R	stb	%r21, [%r6 + %r15]
	.word 0xf221c00e  ! 256: STW_R	stw	%r25, [%r7 + %r14]
	.word 0xf628c00b  ! 256: STB_R	stb	%r27, [%r3 + %r11]
	.word 0xfe20c00d  ! 256: STW_R	stw	%r31, [%r3 + %r13]
	.word 0xf221000c  ! 256: STW_R	stw	%r25, [%r4 + %r12]
	.word 0xfa71000c  ! 256: STX_R	stx	%r29, [%r4 + %r12]
	.word 0xc0f00960  ! 258: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,40)
	.word 0xfc022443  ! 260: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,24)
	.word 0xfc5a0009  ! 262: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,60)
	.word 0xfc022443  ! 266: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,10)
	.word 0xfc020009  ! 268: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xe629800c  ! 269: STB_R	stb	%r19, [%r6 + %r12]
thr1_ic_err_2:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,NIR,x,3)
	.word 0xe621ea0f  ! 270: STW_I	stw	%r19, [%r7 + 0x0a0f]
	.word 0xc0f009a0  ! 272: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 274: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 276: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,49)
	.word 0xe651c009  ! 278: LDSH_R	ldsh	[%r7 + %r9], %r19
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,46)
	.word 0xe651c009  ! 280: LDSH_R	ldsh	[%r7 + %r9], %r19
thr1_dc_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_22), 16, 16),1,DC_DATA,50)
	.word 0xe659c009  ! 282: LDX_R	ldx	[%r7 + %r9], %r19
	.word 0xc0f00960  ! 284: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf8a9500e  ! 285: STBA_R	stba	%r28, [%r5 + %r14] 0x80
	.word 0xe8b8d00b  ! 286: STDA_R	stda	%r20, [%r3 + %r11] 0x80
	.word 0xc4f00c00  ! 288: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_23), 16, 16),1,DC_DATA,33)
	.word 0xfa498009  ! 290: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc0f00960  ! 292: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 294: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 296: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xaf29cd0b  ! 298: SLL_R	sll 	%r7, %r11, %r23
	.word 0xc4f00c00  ! 300: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_24), 16, 16),1,DC_DATA,22)
	.word 0xfa018009  ! 302: LDUW_R	lduw	[%r6 + %r9], %r29
thr1_dc_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_25), 16, 16),1,DC_DATA,17)
	.word 0xfa418009  ! 304: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00980  ! 306: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 308: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 310: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_26), 16, 16),1,DC_DATA,2)
	.word 0xfa498009  ! 312: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 314: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_27), 16, 16),1,DC_DATA,18)
	.word 0xfa01a443  ! 316: LDUW_I	lduw	[%r6 + 0x0443], %r29
	.word 0x8143c000  ! 317: STBAR	stbar
thr1_dc_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_28), 16, 16),1,DC_DATA,2)
	.word 0xfa418009  ! 319: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 321: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe831c00e  ! 322: STH_R	sth	%r20, [%r7 + %r14]
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16), 1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_29), 16, 16),1,DC_DATA,44)
	.word 0xe8012443  ! 326: LDUW_I	lduw	[%r4 + 0x0443], %r20
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfc31a8e4  ! 329: STH_I	sth	%r30, [%r6 + 0x08e4]
	.word 0xe228c00b  ! 329: STB_R	stb	%r17, [%r3 + %r11]
	.word 0xf031e798  ! 329: STH_I	sth	%r24, [%r7 + 0x0798]
	.word 0xe6316f26  ! 329: STH_I	sth	%r19, [%r5 + 0x0f26]
	.word 0xfa31e94e  ! 329: STH_I	sth	%r29, [%r7 + 0x094e]
	.word 0xc0f00960  ! 331: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbd2a3f61  ! 333: SLLX_I	sllx	%r8, 0x0021, %r30
	.word 0xc4f00980  ! 335: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_30), 16, 16),1,DC_DATA,2)
	.word 0xfe022179  ! 339: LDUW_I	lduw	[%r8 + 0x0179], %r31
!Generating an illinst
	.word 0xb7781d6e  ! 341: MOVR_R	movvs	%r0, %r14, %r27
	.word 0xc0f009a0  ! 343: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 345: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_31), 16, 16),1,DC_DATA,47)
	.word 0xfe020009  ! 347: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xf831e1a6  ! 348: STH_I	sth	%r28, [%r7 + 0x01a6]
	.word 0xee31ea44  ! 348: STH_I	sth	%r23, [%r7 + 0x0a44]
	.word 0xf271400c  ! 348: STX_R	stx	%r25, [%r5 + %r12]
	.word 0xea21edd8  ! 348: STW_I	stw	%r21, [%r7 + 0x0dd8]
	.word 0xea21400d  ! 348: STW_R	stw	%r21, [%r5 + %r13]
	.word 0xf2292deb  ! 348: STB_I	stb	%r25, [%r4 + 0x0deb]
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_32), 16, 16),1,DC_DATA,21)
	.word 0xe218c009  ! 352: LDD_R	ldd	[%r3 + %r9], %r17
	.word 0xc0f00960  ! 354: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0x8143c000  ! 355: STBAR	stbar
!Generating an illinst
	.word 0xaf2a1b2e  ! 357: SLL_R	sllx	%r8, %r14, %r23
	.word 0xc0f00960  ! 359: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 361: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe470e4e8  ! 362: STX_I	stx	%r18, [%r3 + 0x04e8]
	.word 0xf620c00f  ! 362: STW_R	stw	%r27, [%r3 + %r15]
	.word 0xf221400b  ! 362: STW_R	stw	%r25, [%r5 + %r11]
	.word 0xc0f009a0  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xa339e001  ! 365: SRA_I	sra 	%r7, 0x0001, %r17
	.word 0xb811c00e  ! 365: OR_R	or 	%r7, %r14, %r28
	.word 0xa601a352  ! 365: ADD_I	add 	%r6, 0x0352, %r19
	.word 0xbe11400f  ! 365: OR_R	or 	%r5, %r15, %r31
thr1_dc_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_33), 16, 16),1,DC_DATA,23)
	.word 0xe2518009  ! 367: LDSH_R	ldsh	[%r6 + %r9], %r17
	.word 0xc4f00c00  ! 369: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 371: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xe220e6c4  ! 372: STW_I	stw	%r17, [%r3 + 0x06c4]
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xa739b001  ! 373: SRAX_I	srax	%r6, 0x0001, %r19
	.word 0xb8396451  ! 373: XNOR_I	xnor 	%r5, 0x0451, %r28
	.word 0xbd38d00f  ! 373: SRAX_R	srax	%r3, %r15, %r30
	.word 0xa3782401  ! 373: MOVR_I	move	%r0, 0xb, %r17
	.word 0xc0f00960  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf059ed70  ! 376: LDX_I	ldx	[%r7 + 0x0d70], %r24
	.word 0xc4f00980  ! 378: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa8099d0b  ! 380: AND_R	and 	%r6, %r11, %r20
!Generating an illinst
	.word 0xb7781d4b  ! 382: MOVR_R	movvs	%r0, %r11, %r27
!Generating an illinst
	.word 0xa6014d0c  ! 384: ADD_R	add 	%r5, %r12, %r19
	.word 0xc0f009a0  ! 386: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 388: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa431fff4  ! 390: ORN_I	orn 	%r7, 0xfffffff4, %r18
	.word 0xc0f00960  ! 392: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 394: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 396: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_34), 16, 16),1,DC_DATA,53)
	.word 0xfa58c009  ! 398: LDX_R	ldx	[%r3 + %r9], %r29
thr1_dc_err_35:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_35), 16, 16),1,DC_DATA,21)
	.word 0xfa18c009  ! 400: LDD_R	ldd	[%r3 + %r9], %r29
thr1_dc_err_36:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_36), 16, 16),1,DC_DATA,39)
	.word 0xfa50c009  ! 402: LDSH_R	ldsh	[%r3 + %r9], %r29
	.word 0xc4f00980  ! 404: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xba3a2803  ! 405: XNOR_I	xnor 	%r8, 0x0803, %r29
	.word 0xb01a000c  ! 405: XOR_R	xor 	%r8, %r12, %r24
	.word 0xb7292001  ! 405: SLL_I	sll 	%r4, 0x0001, %r27
thr1_dc_err_37:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_37), 16, 16),1,DC_DATA,0)
	.word 0xfe520009  ! 407: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc4f00c00  ! 409: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa3399d4e  ! 411: SRA_R	srax	%r6, %r14, %r17
	.word 0xc4f00c00  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 415: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0x8143e077  ! 416: MEMBAR	membar	#LoadLoad | #StoreLoad | #LoadStore | #Lookaside | #MemIssue | #Sync 
thr1_dc_err_38:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_38), 16, 16),1,DC_DATA,16)
	.word 0xfe5a0009  ! 418: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe621c00e  ! 421: STW_R	stw	%r19, [%r7 + %r14]
thr1_ic_err_3:
!ic err IR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xc0f00960  ! 423: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 425: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_39:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_39), 16, 16),1,DC_DATA,33)
	.word 0xea110009  ! 427: LDUH_R	lduh	[%r4 + %r9], %r21
!Generating an illinst
	.word 0xaa292f4a  ! 429: ANDN_I	andn 	%r4, 0x0f4a, %r21
!Generating an illinst
	.word 0xa530df0c  ! 431: SRLX_R	srlx	%r3, %r12, %r18
	.word 0xea29000c  ! 432: STB_R	stb	%r21, [%r4 + %r12]
	.word 0xc0f009a0  ! 434: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 436: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_40:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_40), 16, 16),1,DC_DATA,63)
	.word 0xea010009  ! 438: LDUW_R	lduw	[%r4 + %r9], %r21
	.word 0xc0f009a0  ! 440: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_41:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_41), 16, 16),1,DC_DATA,69)
	.word 0xea490009  ! 442: LDSB_R	ldsb	[%r4 + %r9], %r21
	.word 0xb409000c  ! 443: AND_R	and 	%r4, %r12, %r26
	.word 0xf0212658  ! 444: STW_I	stw	%r24, [%r4 + 0x0658]
	.word 0xe22a000d  ! 444: STB_R	stb	%r17, [%r8 + %r13]
	.word 0xe629a952  ! 444: STB_I	stb	%r19, [%r6 + 0x0952]
	.word 0xe422000d  ! 444: STW_R	stw	%r18, [%r8 + %r13]
	.word 0xe432000b  ! 444: STH_R	sth	%r18, [%r8 + %r11]
	.word 0xe628c00e  ! 444: STB_R	stb	%r19, [%r3 + %r14]
	.word 0xe621eb20  ! 444: STW_I	stw	%r19, [%r7 + 0x0b20]
	.word 0xc0f00960  ! 446: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 448: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_42:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_42), 16, 16),1,DC_DATA,61)
	.word 0xe4594009  ! 450: LDX_R	ldx	[%r5 + %r9], %r18
	.word 0xc0f009a0  ! 452: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa8091b0f  ! 456: AND_R	and 	%r4, %r15, %r20
!Generating an illinst
	.word 0xa409afe2  ! 458: AND_I	and 	%r6, 0x0fe2, %r18
!Generating an illinst
	.word 0xa529bf41  ! 460: SLLX_I	sllx	%r6, 0x0001, %r18
!Generating an illinst
	.word 0xa22a3d74  ! 462: ANDN_I	andn 	%r8, 0xfffffd74, %r17
	.word 0xc0f009a0  ! 464: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_43:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_43), 16, 16),1,DC_DATA,59)
	.word 0xe4414009  ! 468: LDSW_R	ldsw	[%r5 + %r9], %r18
	.word 0xf671000c  ! 469: STX_R	stx	%r27, [%r4 + %r12]
	.word 0xea71800d  ! 469: STX_R	stx	%r21, [%r6 + %r13]
	.word 0xf029c00e  ! 469: STB_R	stb	%r24, [%r7 + %r14]
	.word 0xf421c00e  ! 469: STW_R	stw	%r26, [%r7 + %r14]
	.word 0xee71a830  ! 469: STX_I	stx	%r23, [%r6 + 0x0830]
	.word 0xfe31c00c  ! 469: STH_R	sth	%r31, [%r7 + %r12]
	.word 0xc0f00960  ! 471: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_44:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_44), 16, 16),1,DC_DATA,11)
	.word 0xf0020009  ! 473: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xfb212f70  ! 474: STF_I	st	%f29, [0x0f70, %r4]
	.word 0xc4f00980  ! 476: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_45:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_45), 16, 16),1,DC_DATA,47)
	.word 0xee012e05  ! 478: LDUW_I	lduw	[%r4 + 0x0e05], %r23
	.word 0xc4f00980  ! 480: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xaa31c94c  ! 482: ORN_R	orn 	%r7, %r12, %r21
	.word 0xc4f00c00  ! 484: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 486: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb7315b2e  ! 488: SRLX_R	srlx	%r5, %r14, %r27
	.word 0xc0f009a0  ! 490: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 492: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb211bb42  ! 494: OR_I	or 	%r6, 0xfffffb42, %r25
thr1_dc_err_46:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_46), 16, 16),1,DC_DATA,18)
	.word 0xee590009  ! 496: LDX_R	ldx	[%r4 + %r9], %r23
	.word 0xe211a862  ! 497: LDUH_I	lduh	[%r6 + 0x0862], %r17
	.word 0xc0f00960  ! 499: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x375ad8571a7dbe81, %r16, %r17
	setx  0xe5a71e716524399a, %r16, %r18
	setx  0xd07b04778a1f78e0, %r16, %r19
	setx  0xbb5df1b4d20aef12, %r16, %r20
	setx  0x1eee5370d741e2d0, %r16, %r21
	setx  0x20cfe110a3600ae8, %r16, %r22
	setx  0x5ca9d8fdb5accb48, %r16, %r23
	setx  0x8eb20bb746f85b64, %r16, %r24
	setx  0x1494b098df18789c, %r16, %r25
	setx  0x066c9dd4534d3b1c, %r16, %r26
	setx  0xbc6d671e05e185d6, %r16, %r27
	setx  0xe30a8a132060f3c2, %r16, %r28
	setx  0x60d26ddefb8dde6b, %r16, %r29
	setx  0xb7789e8317c88a27, %r16, %r30
	setx  0x657a285d7dd63d8b, %r16, %r31
	setx  0x0000000000000200, %r16, %r9
	setx  0x0000000000000330, %r16, %r10
	setx  0x0000000000000560, %r16, %r11
	setx  0x0000000000000300, %r16, %r12
	setx  0x00000000000004e0, %r16, %r13
	setx  0x0000000000000410, %r16, %r14
	setx  0x0000000000000bc0, %r16, %r15
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
	.word 0xfe31800c  ! 1: STH_R	sth	%r31, [%r6 + %r12]
	.word 0xc0f00960  ! 3: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 5: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,42)
	.word 0xfe418009  ! 7: LDSW_R	ldsw	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 9: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbd31192e  ! 11: SRL_R	srlx	%r4, %r14, %r30
	.word 0xc3e96db9  ! 12: PREFETCHA_I	prefetcha	[%r5, + 0x0db9] %asi, #one_read
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 16: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe216d61  ! 19: STW_I	stw	%r31, [%r5 + 0x0d61]
	.word 0xc4f00980  ! 21: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 23: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 25: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,52)
	.word 0xfe194009  ! 27: LDD_R	ldd	[%r5 + %r9], %r31
	.word 0xc4f00980  ! 29: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xee29ecd5  ! 30: STB_I	stb	%r23, [%r7 + 0x0cd5]
thr0_ic_err_0:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,13,12)
	.word 0xc4f00c00  ! 32: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 34: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 36: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 38: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xad28df0c  ! 40: SLLX_R	sllx	%r3, %r12, %r22
	.word 0xc4f00c00  ! 42: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 44: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 46: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 48: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb6292f58  ! 50: ANDN_I	andn 	%r4, 0x0f58, %r27
	.word 0xc4f00980  ! 52: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,14)
	.word 0xee01ecd5  ! 56: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xee21c00c  ! 57: STW_R	stw	%r23, [%r7 + %r12]
	.word 0xc4f00c00  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 61: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 63: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,71)
	.word 0xee01ecd5  ! 65: LDUW_I	lduw	[%r7 + 0x0cd5], %r23
	.word 0xc0f009a0  ! 67: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbd28db6c  ! 69: SLLX_R	sllx	%r3, %r12, %r30
	.word 0xc0f00960  ! 71: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe69eacf  ! 72: LDSTUB_I	ldstub	%r31, [%r7 + 0x0acf]
	.word 0xc4f00980  ! 74: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,20)
	.word 0xfe01eacf  ! 76: LDUW_I	lduw	[%r7 + 0x0acf], %r31
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,69)
	.word 0xfe19c009  ! 78: LDD_R	ldd	[%r7 + %r9], %r31
	.word 0xc4f00c00  ! 80: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc369c00e  ! 81: PREFETCH_R	prefetch	[%r7 + %r14], #one_read
	.word 0xc369400c  ! 82: PREFETCH_R	prefetch	[%r5 + %r12], #one_read
	.word 0xc4f00980  ! 84: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 86: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 88: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 90: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe2212e90  ! 91: STW_I	stw	%r17, [%r4 + 0x0e90]
thr0_ic_err_1:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,30,5)
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,41)
	.word 0xe2012e93  ! 93: LDUW_I	lduw	[%r4 + 0x0e93], %r17
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,33)
	.word 0xe2110009  ! 95: LDUH_R	lduh	[%r4 + %r9], %r17
	.word 0xe271a6a8  ! 96: STX_I	stx	%r17, [%r6 + 0x06a8]
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
!Generating an illinst
	.word 0xb401bfd2  ! 98: ADD_I	add 	%r6, 0xffffffd2, %r26
	.word 0xc4f00c00  ! 100: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 102: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfc21ee64  ! 103: STW_I	stw	%r30, [%r7 + 0x0e64]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16), 1,IRF,ce,5,x, x,x,x, x,x,x)
	.word 0xf220c00f  ! 104: STW_R	stw	%r25, [%r3 + %r15]
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 108: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 110: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb00a0b0e  ! 112: AND_R	and 	%r8, %r14, %r24
	.word 0xc4f00c00  ! 114: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf270e4e7  ! 115: STX_I	stx	%r25, [%r3 + 0x04e7]
	.word 0xc4f00980  ! 117: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 119: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 121: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 123: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,65)
	.word 0xf210c009  ! 125: LDUH_R	lduh	[%r3 + %r9], %r25
	.word 0xc0f009a0  ! 127: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 129: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 131: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 133: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,35)
	.word 0xf240c009  ! 135: LDSW_R	ldsw	[%r3 + %r9], %r25
	.word 0xc4f00c00  ! 137: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 139: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 141: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 143: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 147: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 149: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,27)
	.word 0xf250c009  ! 151: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xc0f00960  ! 153: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,54)
	.word 0xf250c009  ! 155: LDSH_R	ldsh	[%r3 + %r9], %r25
	.word 0xfe79800c  ! 156: SWAP_R	swap	%r31, [%r6 + %r12]
	.word 0xc0f009a0  ! 158: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 160: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 162: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 164: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 166: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 168: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 170: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,62)
	.word 0xfe598009  ! 172: LDX_R	ldx	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 174: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb031ff65  ! 176: ORN_I	orn 	%r7, 0xffffff65, %r24
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 182: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb7297901  ! 184: SLLX_I	sllx	%r5, 0x0001, %r27
	.word 0xea51e36a  ! 185: LDSH_I	ldsh	[%r7 + 0x036a], %r21
!Generating an illinst
	.word 0xa928db4e  ! 187: SLL_R	sllx	%r3, %r14, %r20
	.word 0xc4f00c00  ! 189: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 191: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb608cb0c  ! 193: AND_R	and 	%r3, %r12, %r27
	.word 0xc0f00960  ! 195: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 197: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 199: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 201: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 203: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 205: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa231194f  ! 207: ORN_R	orn 	%r4, %r15, %r17
	.word 0xc0f00960  ! 209: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 211: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 213: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 215: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 217: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,71)
	.word 0xea41c009  ! 219: LDSW_R	ldsw	[%r7 + %r9], %r21
	.word 0xc0f009a0  ! 221: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,58)
	.word 0xea01c009  ! 223: LDUW_R	lduw	[%r7 + %r9], %r21
	.word 0xc0f00960  ! 225: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,41)
	.word 0xea59c009  ! 227: LDX_R	ldx	[%r7 + %r9], %r21
	.word 0xc4f00980  ! 229: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb728df4e  ! 231: SLL_R	sllx	%r3, %r14, %r27
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 235: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xafa2092d  ! 238: FMULs	fmuls	%f8, %f13, %f23
	.word 0xf019a440  ! 239: LDD_I	ldd	[%r6 + 0x0440], %r24
!Generating an illinst
	.word 0xa43169b9  ! 241: ORN_I	orn 	%r5, 0x09b9, %r18
!Generating an illinst
	.word 0xa7781d0d  ! 243: MOVR_R	movvs	%r0, %r13, %r19
	.word 0xc0f009a0  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 247: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 249: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 251: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 253: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 255: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfe29000c  ! 256: STB_R	stb	%r31, [%r4 + %r12]
	.word 0xf221800c  ! 256: STW_R	stw	%r25, [%r6 + %r12]
	.word 0xf229000d  ! 256: STB_R	stb	%r25, [%r4 + %r13]
	.word 0xfe20c00c  ! 256: STW_R	stw	%r31, [%r3 + %r12]
	.word 0xee21c00c  ! 256: STW_R	stw	%r23, [%r7 + %r12]
	.word 0xfc72000c  ! 256: STX_R	stx	%r30, [%r8 + %r12]
	.word 0xc0f00960  ! 258: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,40)
	.word 0xfc022443  ! 260: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,24)
	.word 0xfc5a0009  ! 262: LDX_R	ldx	[%r8 + %r9], %r30
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,60)
	.word 0xfc022443  ! 266: LDUW_I	lduw	[%r8 + 0x0443], %r30
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,10)
	.word 0xfc020009  ! 268: LDUW_R	lduw	[%r8 + %r9], %r30
	.word 0xe629c00c  ! 269: STB_R	stb	%r19, [%r7 + %r12]
thr0_ic_err_2:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,NIR,x,3)
	.word 0xe621ea97  ! 270: STW_I	stw	%r19, [%r7 + 0x0a97]
	.word 0xc0f009a0  ! 272: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 274: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 276: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,49)
	.word 0xe651c009  ! 278: LDSH_R	ldsh	[%r7 + %r9], %r19
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,46)
	.word 0xe651c009  ! 280: LDSH_R	ldsh	[%r7 + %r9], %r19
thr0_dc_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_22), 16, 16),1,DC_DATA,50)
	.word 0xe659c009  ! 282: LDX_R	ldx	[%r7 + %r9], %r19
	.word 0xc0f00960  ! 284: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xeea9500d  ! 285: STBA_R	stba	%r23, [%r5 + %r13] 0x80
	.word 0xf8b9900b  ! 286: STDA_R	stda	%r28, [%r6 + %r11] 0x80
	.word 0xc4f00c00  ! 288: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_23), 16, 16),1,DC_DATA,33)
	.word 0xfa498009  ! 290: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc0f00960  ! 292: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 294: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 296: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb129db0c  ! 298: SLL_R	sllx	%r7, %r12, %r24
	.word 0xc4f00c00  ! 300: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_24), 16, 16),1,DC_DATA,22)
	.word 0xfa018009  ! 302: LDUW_R	lduw	[%r6 + %r9], %r29
thr0_dc_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_25), 16, 16),1,DC_DATA,17)
	.word 0xfa418009  ! 304: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00980  ! 306: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 308: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 310: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_26), 16, 16),1,DC_DATA,2)
	.word 0xfa498009  ! 312: LDSB_R	ldsb	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 314: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_27), 16, 16),1,DC_DATA,18)
	.word 0xfa01a443  ! 316: LDUW_I	lduw	[%r6 + 0x0443], %r29
	.word 0x8143c000  ! 317: STBAR	stbar
thr0_dc_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_28), 16, 16),1,DC_DATA,2)
	.word 0xfa418009  ! 319: LDSW_R	ldsw	[%r6 + %r9], %r29
	.word 0xc4f00c00  ! 321: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe831000f  ! 322: STH_R	sth	%r20, [%r4 + %r15]
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16), 1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_29), 16, 16),1,DC_DATA,44)
	.word 0xe8012443  ! 326: LDUW_I	lduw	[%r4 + 0x0443], %r20
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfa316456  ! 329: STH_I	sth	%r29, [%r5 + 0x0456]
	.word 0xe429c00e  ! 329: STB_R	stb	%r18, [%r7 + %r14]
	.word 0xfc3220d4  ! 329: STH_I	sth	%r30, [%r8 + 0x00d4]
	.word 0xfc30e04a  ! 329: STH_I	sth	%r30, [%r3 + 0x004a]
	.word 0xfe322178  ! 329: STH_I	sth	%r31, [%r8 + 0x0178]
	.word 0xc0f00960  ! 331: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xa729bd21  ! 333: SLLX_I	sllx	%r6, 0x0021, %r19
	.word 0xc4f00980  ! 335: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_30), 16, 16),1,DC_DATA,2)
	.word 0xfe022179  ! 339: LDUW_I	lduw	[%r8 + 0x0179], %r31
!Generating an illinst
	.word 0xa3780d2c  ! 341: MOVR_R	movl	%r0, %r12, %r17
	.word 0xc0f009a0  ! 343: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 345: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_31), 16, 16),1,DC_DATA,47)
	.word 0xfe020009  ! 347: LDUW_R	lduw	[%r8 + %r9], %r31
	.word 0xf431e0de  ! 348: STH_I	sth	%r26, [%r7 + 0x00de]
	.word 0xe231e91a  ! 348: STH_I	sth	%r17, [%r7 + 0x091a]
	.word 0xe471400e  ! 348: STX_R	stx	%r18, [%r5 + %r14]
	.word 0xf820e744  ! 348: STW_I	stw	%r28, [%r3 + 0x0744]
	.word 0xf421400f  ! 348: STW_R	stw	%r26, [%r5 + %r15]
	.word 0xe228e8da  ! 348: STB_I	stb	%r17, [%r3 + 0x08da]
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_32), 16, 16),1,DC_DATA,21)
	.word 0xe218c009  ! 352: LDD_R	ldd	[%r3 + %r9], %r17
	.word 0xc0f00960  ! 354: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0x8143c000  ! 355: STBAR	stbar
!Generating an illinst
	.word 0xb72a1b6e  ! 357: SLL_R	sllx	%r8, %r14, %r27
	.word 0xc0f00960  ! 359: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 361: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfe722e38  ! 362: STX_I	stx	%r31, [%r8 + 0x0e38]
	.word 0xf821400d  ! 362: STW_R	stw	%r28, [%r5 + %r13]
	.word 0xf621000d  ! 362: STW_R	stw	%r27, [%r4 + %r13]
	.word 0xc0f009a0  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xb939a001  ! 365: SRA_I	sra 	%r6, 0x0001, %r28
	.word 0xae11000f  ! 365: OR_R	or 	%r4, %r15, %r23
	.word 0xb8012c61  ! 365: ADD_I	add 	%r4, 0x0c61, %r28
	.word 0xa211800c  ! 365: OR_R	or 	%r6, %r12, %r17
thr0_dc_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_33), 16, 16),1,DC_DATA,23)
	.word 0xe2518009  ! 367: LDSH_R	ldsh	[%r6 + %r9], %r17
	.word 0xc4f00c00  ! 369: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 371: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf820eefc  ! 372: STW_I	stw	%r28, [%r3 + 0x0efc]
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xab38f001  ! 373: SRAX_I	srax	%r3, 0x0001, %r21
	.word 0xa239ed80  ! 373: XNOR_I	xnor 	%r7, 0x0d80, %r17
	.word 0xa738d00b  ! 373: SRAX_R	srax	%r3, %r11, %r19
	.word 0xa9782401  ! 373: MOVR_I	move	%r0, 0xb, %r20
	.word 0xc0f00960  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfa58e268  ! 376: LDX_I	ldx	[%r3 + 0x0268], %r29
	.word 0xc4f00980  ! 378: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xba098f6e  ! 380: AND_R	and 	%r6, %r14, %r29
!Generating an illinst
	.word 0xb3781f0e  ! 382: MOVR_R	movvs	%r0, %r14, %r25
!Generating an illinst
	.word 0xb2021b2f  ! 384: ADD_R	add 	%r8, %r15, %r25
	.word 0xc0f009a0  ! 386: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 388: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa8317d35  ! 390: ORN_I	orn 	%r5, 0xfffffd35, %r20
	.word 0xc0f00960  ! 392: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 394: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 396: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_34), 16, 16),1,DC_DATA,53)
	.word 0xfa58c009  ! 398: LDX_R	ldx	[%r3 + %r9], %r29
thr0_dc_err_35:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_35), 16, 16),1,DC_DATA,21)
	.word 0xfa18c009  ! 400: LDD_R	ldd	[%r3 + %r9], %r29
thr0_dc_err_36:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_36), 16, 16),1,DC_DATA,39)
	.word 0xfa50c009  ! 402: LDSH_R	ldsh	[%r3 + %r9], %r29
	.word 0xc4f00980  ! 404: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xa4392719  ! 405: XNOR_I	xnor 	%r4, 0x0719, %r18
	.word 0xa61a000f  ! 405: XOR_R	xor 	%r8, %r15, %r19
	.word 0xbf2a2001  ! 405: SLL_I	sll 	%r8, 0x0001, %r31
thr0_dc_err_37:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_37), 16, 16),1,DC_DATA,0)
	.word 0xfe520009  ! 407: LDSH_R	ldsh	[%r8 + %r9], %r31
	.word 0xc4f00c00  ! 409: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa73a1f2d  ! 411: SRA_R	srax	%r8, %r13, %r19
	.word 0xc4f00c00  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 415: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0x8143e004  ! 416: MEMBAR	membar	#LoadStore 
thr0_dc_err_38:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_38), 16, 16),1,DC_DATA,16)
	.word 0xfe5a0009  ! 418: LDX_R	ldx	[%r8 + %r9], %r31
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xea21000c  ! 421: STW_R	stw	%r21, [%r4 + %r12]
thr0_ic_err_3:
!ic err IR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,0,x)
	.word 0xc0f00960  ! 423: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 425: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_39:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_39), 16, 16),1,DC_DATA,33)
	.word 0xea110009  ! 427: LDUH_R	lduh	[%r4 + %r9], %r21
!Generating an illinst
	.word 0xbc29bfbe  ! 429: ANDN_I	andn 	%r6, 0xffffffbe, %r30
!Generating an illinst
	.word 0xb9321f2d  ! 431: SRLX_R	srlx	%r8, %r13, %r28
	.word 0xea29000c  ! 432: STB_R	stb	%r21, [%r4 + %r12]
	.word 0xc0f009a0  ! 434: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 436: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_40:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_40), 16, 16),1,DC_DATA,63)
	.word 0xea010009  ! 438: LDUW_R	lduw	[%r4 + %r9], %r21
	.word 0xc0f009a0  ! 440: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_41:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_41), 16, 16),1,DC_DATA,69)
	.word 0xea490009  ! 442: LDSB_R	ldsb	[%r4 + %r9], %r21
	.word 0xbc0a000b  ! 443: AND_R	and 	%r8, %r11, %r30
	.word 0xea21690c  ! 444: STW_I	stw	%r21, [%r5 + 0x090c]
	.word 0xe229400e  ! 444: STB_R	stb	%r17, [%r5 + %r14]
	.word 0xe229629b  ! 444: STB_I	stb	%r17, [%r5 + 0x029b]
	.word 0xfe21800b  ! 444: STW_R	stw	%r31, [%r6 + %r11]
	.word 0xf431c00f  ! 444: STH_R	sth	%r26, [%r7 + %r15]
	.word 0xec29400c  ! 444: STB_R	stb	%r22, [%r5 + %r12]
	.word 0xe42165f0  ! 444: STW_I	stw	%r18, [%r5 + 0x05f0]
	.word 0xc0f00960  ! 446: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 448: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_42:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_42), 16, 16),1,DC_DATA,61)
	.word 0xe4594009  ! 450: LDX_R	ldx	[%r5 + %r9], %r18
	.word 0xc0f009a0  ! 452: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xaa0a192b  ! 456: AND_R	and 	%r8, %r11, %r21
!Generating an illinst
	.word 0xa2093ffe  ! 458: AND_I	and 	%r4, 0xfffffffe, %r17
!Generating an illinst
	.word 0xbb29bb41  ! 460: SLLX_I	sllx	%r6, 0x0001, %r29
!Generating an illinst
	.word 0xbc28ef87  ! 462: ANDN_I	andn 	%r3, 0x0f87, %r30
	.word 0xc0f009a0  ! 464: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_43:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_43), 16, 16),1,DC_DATA,59)
	.word 0xe4414009  ! 468: LDSW_R	ldsw	[%r5 + %r9], %r18
	.word 0xf271c00b  ! 469: STX_R	stx	%r25, [%r7 + %r11]
	.word 0xea71800e  ! 469: STX_R	stx	%r21, [%r6 + %r14]
	.word 0xf629c00c  ! 469: STB_R	stb	%r27, [%r7 + %r12]
	.word 0xfa21c00c  ! 469: STW_R	stw	%r29, [%r7 + %r12]
	.word 0xee716540  ! 469: STX_I	stx	%r23, [%r5 + 0x0540]
	.word 0xf032000b  ! 469: STH_R	sth	%r24, [%r8 + %r11]
	.word 0xc0f00960  ! 471: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_44:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_44), 16, 16),1,DC_DATA,11)
	.word 0xf0020009  ! 473: LDUW_R	lduw	[%r8 + %r9], %r24
	.word 0xef212e04  ! 474: STF_I	st	%f23, [0x0e04, %r4]
	.word 0xc4f00980  ! 476: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_45:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_45), 16, 16),1,DC_DATA,47)
	.word 0xee012e05  ! 478: LDUW_I	lduw	[%r4 + 0x0e05], %r23
	.word 0xc4f00980  ! 480: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa4311b4d  ! 482: ORN_R	orn 	%r4, %r13, %r18
	.word 0xc4f00c00  ! 484: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 486: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb1319d4c  ! 488: SRLX_R	srlx	%r6, %r12, %r24
	.word 0xc0f009a0  ! 490: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 492: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa2123feb  ! 494: OR_I	or 	%r8, 0xffffffeb, %r17
thr0_dc_err_46:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_46), 16, 16),1,DC_DATA,18)
	.word 0xee590009  ! 496: LDX_R	ldx	[%r4 + %r9], %r23
	.word 0xea112e9a  ! 497: LDUH_I	lduh	[%r4 + 0x0e9a], %r21
	.word 0xc0f00960  ! 499: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b

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
	.word  0x985e8faf,0x3d22dfaa,0x55a8bfd3,0xbf3b2843
	.word  0xddadfdb2,0x99db721b,0x8420f26d,0x712718ec
	.word  0x27432d67,0xe49a1bd7,0xcf2f2ee4,0x4541c8b2
	.word  0x18cae148,0x340d84f0,0x77481db2,0xc56b872e
	.word  0x364c855f,0x685a4488,0xd6202f74,0xe7f8337c
	.word  0x93fccb57,0x0a2719f9,0x18d4d1c1,0xf617ab00
	.word  0x6478ce2f,0xff529d32,0xa9e096cc,0x0bc76783
	.word  0x57089a52,0x29dd3ec3,0xd9f01307,0x3eaf8814
	.word  0xc136d7e7,0x3b249640,0xa3e31735,0x918d3f53
	.word  0x29c64d26,0x6a47400a,0xdc19ae5a,0x3d5e20eb
	.word  0x9f3f776b,0x4237a2e9,0x8a19a166,0x01d63c8e
	.word  0x9455155e,0xf0fbff8b,0x7e339a8d,0x17f58ca4
	.word  0x80f41241,0x3b143d71,0x3c52e461,0x338d6ec8
	.word  0xd3c81852,0x008be37c,0x66ded6cd,0xf3e573bc
	.word  0x12690ed5,0x17b59a80,0x33308c2d,0x3b0b37ff
	.word  0xbe5dcee3,0x67579473,0x4f1cd507,0x8306d7e9
	.word  0x3099dccd,0xdaf395a6,0x63806b82,0xaf9c1bc1
	.word  0xba4d509f,0x08360672,0x0c903889,0x540c3b04
	.word  0x695bbc45,0x10891bb9,0x863c8fcc,0xb89d124e
	.word  0xdbd201a1,0x025fb735,0xa69cb444,0xade3cad9
	.word  0x00723347,0xe7b2f8d8,0xd374c084,0xc7e51027
	.word  0xf16489ad,0xacc7d2f1,0x3d252bd4,0x5a67ab72
	.word  0x089a7f74,0xb9db9de1,0xadf5779e,0x5daf8b0a
	.word  0x00c8ffc7,0x25c7c663,0xae41042c,0x9839b0c5
	.word  0x45fb0528,0xcb3bc859,0xf3a24a3c,0x7fbf5bdd
	.word  0xcb36d604,0xaa913984,0x200c4475,0xdeddbac7
	.word  0x4dd2d26a,0x945c38d2,0x401ab5fb,0x0ba0fea1
	.word  0x2e3a63bc,0x845828a2,0x10fa5293,0x93ebaf95
	.word  0x17a66471,0xa1a3d257,0xd1aae2b3,0x86ca4429
	.word  0x3c12ff60,0xb927c5e4,0xf0e7e1f3,0x3ff59a73
	.word  0x71b4f95b,0x6f71ffc7,0xc5be171f,0xb44c3b17
	.word  0x7bfb699f,0x0aa5cb97,0xe78ea0af,0xcd7ed8c7
	.word  0x64b30407,0xf352fb78,0xc416c99a,0xebe6ae10
	.word  0x099dd340,0x2eb5ca15,0x24614d1a,0x3fd76ac3
	.word  0x4d41ebbb,0xb5c9e662,0x69a38f8b,0x716f6ef8
	.word  0x42fa0269,0xbba4da2a,0x133c0e79,0xecaf9887
	.word  0x1c2fdca1,0x939f7693,0x01664eac,0x1de0c695
	.word  0x851cdaaf,0xe9b19b3f,0xea05a0bb,0xe52897ab
	.word  0xbfa6a0cb,0x13af5c3b,0xda58f6cd,0x29206f68
	.word  0x37ba4456,0x7bf23a6f,0x8a9b2551,0x9f6c156d
	.word  0x58f6c64b,0x0f9fc527,0xbbe61e97,0x44332023
	.word  0xe8df87c6,0x10db68f6,0xa682dc4f,0xd58ad13e
	.word  0x57ec3b63,0xa9ddfeae,0x6e7a75d9,0x91abaf2d
	.word  0x69877674,0x6b7b5952,0x1d221427,0x03a9dcb1
	.word  0xef76ff80,0xf23fd8ce,0xfc491902,0xb5829c77
	.word  0x3a77a6d1,0x41c74788,0x5530ea1f,0x6d66d829
	.word  0x1dc8f7e4,0xb2ee5650,0xf35dfa18,0xd2f0eccb
	.word  0x9638e9c5,0x4a68385a,0x83757729,0x89d2eeb7
	.word  0x1cc8a6c2,0x3f1978d2,0xdd074138,0xe1beb6bf
	.word  0x9113cd84,0x81d8ef73,0x6d100ed2,0xa02891bf
	.word  0xab625190,0x286546ec,0x1f1792d2,0x7370ba58
	.word  0x2c9d2a24,0xb0dc2f57,0x08f8e154,0x79f69e30
	.word  0x32d3357d,0xb6aed4f2,0x29bdac83,0x1d13093a
	.word  0xd7c3dc34,0x2aa63f77,0x099c4250,0xe834fd13
	.word  0x17b9f88c,0x5b48c720,0xcefd925a,0x5fdd0385
	.word  0xe59a18bb,0xf8788074,0xfd961084,0x2638119f
	.word  0xa04b7e76,0x640051a6,0xa8a18047,0x4652adaf
	.word  0xd1034daf,0x6b0130f6,0x2f13e764,0x71500f11
	.word  0x203c2178,0x34af9807,0x8946ef80,0xeabd2658
	.word  0x9c845f4e,0xc423763e,0x325fc341,0xbb368837
	.word  0x85495a4e,0xbcd3f7f1,0xc9422bad,0xd3c311a3
	.word  0x6358f2ae,0x08201c2e,0xd0730162,0xfdf9bb0a
	.word  0xe0ec62a7,0xc6176f80,0x588bb134,0x8115b8b4
	.word  0x97576d5a,0xd77040a2,0x3c945c73,0x2ef95317
	.word  0x50723bdc,0x47b0f537,0x7df506cb,0xbb4d36ae
	.word  0xfecbf19c,0x3fe641ff,0x4cba33a1,0xd72a32b9
	.word  0x36c94f78,0x3166823f,0xf2594e0b,0x47425b3d
	.word  0x15de5fbd,0x607954e8,0x40b99c9f,0x6e0590c2
	.word  0x1e2db1a9,0x9cbace8f,0x462b6b06,0xd5cd5a9a
	.word  0x069a1085,0x984abbc4,0xcba7e1e0,0x4e23c6d5
	.word  0x90b95fed,0x8dd68ffe,0x18d016b8,0xfc194daf
	.word  0x4090793d,0xbc6d2462,0xea3b0846,0x76e95ded
	.word  0xcb9e2b4a,0x1b1b7c0b,0x6c70407a,0x1864b6cb
	.word  0x1583f781,0x604e45bc,0x262a9831,0xadbd14ff
	.word  0x9665bb69,0xc211078f,0x3f04b8b2,0x9f429b61
	.word  0x249edf82,0xdaa59e01,0x4f031f2a,0x601ef6d7
	.word  0xdccb6ba8,0xfd2e4c11,0x3db4cd1d,0xf6601b24
	.word  0x115f718a,0xfc61aa86,0x27676356,0xd0896a75
	.word  0x61144610,0x8ada5771,0x127dd979,0xe07820cf
	.word  0x5936bb46,0x89741590,0x0eaffe6e,0x52ecf365
	.word  0x109abd16,0x8418c8bd,0x1b5ae723,0x7924b900
	.word  0x6185c0ef,0x98920ee0,0xd7d109ea,0x921568bd
	.word  0x6067047a,0xf8c516d9,0xdb51cc63,0xe846aaf6
	.word  0x26dc0e68,0x6558038e,0x5155f466,0x3dc642ab
	.word  0xce55800a,0x9abe42d4,0xbf8b0e09,0xbb7ee908
	.word  0x6e376e60,0x3f6875c6,0x18450f88,0x54152c1d
	.word  0x0b60d9aa,0x628e783d,0x7f78acdb,0x46471f63
	.word  0x200cccd6,0xc185e7de,0xa5f05589,0x59dd8ab0
	.word  0x19491525,0x95c19f85,0x5ea20a5e,0x2ac44d98
	.word  0x03587976,0x79e5ffd1,0x15becbfd,0x62ec6db4
	.word  0x6985f2c9,0x6363dc41,0x7b9b2f61,0x9448b0ab
	.word  0x80cc37fd,0x7a23b827,0x99c11d44,0x2f4e1c3b
	.word  0x9a3d10ac,0xb3c5dfd1,0xb0297cf4,0x12d57863
	.word  0xcca33257,0x4f031ee9,0x51e912f5,0xded7808d
	.word  0xfa48c537,0x713823b8,0x6b174400,0x3b451e5b
	.word  0x7e4e5a77,0x93876eaf,0x8907b106,0x035bce8f
	.word  0x00e42950,0x09cd6a76,0x0f190a43,0x10198fa2
	.word  0xf97a1f15,0xaaf6d6b4,0xc7dc6cef,0xb8ef5ef7
	.word  0x576af4de,0xaa961391,0x85a21a49,0x3e5e1d26
	.word  0xb9f0c785,0x99906ed9,0xe661d2a5,0x19e32c0b
	.word  0x931ba633,0xb7bc2f2b,0xb7ae83d0,0x00e8dcb0
	.word  0x346d84f4,0xdd3f83c9,0x2fefa4f4,0x1763ffcb
	.word  0x48fd8964,0x5f4c4e40,0xa8e22899,0x53392aa8
	.word  0x07ce559a,0x911b2372,0xe0415a6e,0xd99eda5e
	.word  0x0e2f5686,0xb680c928,0x4eb3f938,0x272acfa7
	.word  0x7041ac4b,0x611bfbe8,0xf5a31967,0x0b681949
	.word  0x11a6c7c2,0x8ee4e8ec,0x164753ea,0x23320f72
	.word  0x1f54996a,0x2c38aba1,0x096f7859,0x66657ba0
	.word  0xef2b172c,0xba3d4ff3,0xe371b1fe,0x677d41f4
	.word  0x3fa801ba,0x18bc0418,0x6bc71684,0xe9f7c934
	.word  0x88db71eb,0x5f1d529a,0x22a60798,0x76e4f15c
	.word  0x36b1a751,0x3e0a3a59,0x2b0d86c6,0x71cc4653
	.word  0x3104b5bb,0xd17991da,0x513f5eb2,0xb2c197cf
	.word  0xf2d86268,0x45e4361e,0x5ada4d65,0xbb15a479
	.word  0x108b5fe0,0xb536961b,0x711947bd,0x02997866
	.word  0x6b1b848b,0x429ce03d,0xe80206ce,0x5a34097a
	.word  0xb7034545,0xa515301b,0x7a209c8e,0xcbcabbbf
	.word  0xff60c389,0x255af9e0,0x298a1422,0x07d7e986
	.word  0xb285c5c6,0x387e4fee,0x3b3b71f8,0x71c0e3f1
	.word  0x2e431316,0x9bcbea79,0xaf5af34f,0x6e49d6ae
	.word  0x39e213cd,0xfd3c4f7b,0xd5f05fef,0xe09947ed
	.word  0x03538951,0xbca1b837,0x60604ead,0xf86d43f0
	.word  0xd2121ace,0xa5c3bc57,0x42a69dfa,0x809d6571
	.word  0xd71b37bf,0xf1e0bad5,0x05922335,0xc0fc1119
	.word  0xff711455,0x21ec721d,0xb5a48a12,0x547815ee
	.word  0x213b513d,0x7660ad9a,0x2dd1845b,0xb9852562
	.word  0xb7a77583,0x02dd0be9,0x755247b4,0x12b230ee
	.word  0xa599f6bc,0xf6337f53,0xdc6c10f7,0x6ad5f841
	.word  0xda6a739d,0x93d1b1de,0x937bcea2,0xa4a7023a
	.word  0x9791a235,0xddfe2f6e,0x837fdaaa,0xed1001dc
	.word  0xd55f1005,0xa4f3af81,0x68e7d8d7,0x7ec1924c
	.word  0xd8df3fd9,0xe3c980a4,0x9cd0b93f,0x5802babb
	.word  0xa65be82f,0x6b6ca6ca,0x7ba91f23,0x99ec6e36
	.word  0x00dd326c,0x76a59b20,0x619166ae,0x31ba24a3
	.word  0x77780fa6,0xcb9fe289,0x08faef2e,0xe359674e
	.word  0xf03d12ac,0xc4c6786d,0x1c437df3,0x3a423205
	.word  0xb5e39b70,0x3160c4a1,0xd00d8ee4,0xb5c36723
	.word  0x2227f5d2,0xd9584244,0x93a9c45b,0x4456a3f3
	.word  0x3886aee1,0x2419bdc9,0x743a6088,0x9325862e
	.word  0xca9503f8,0xc87a597b,0x76f1a9cf,0x4a3e4d58
	.word  0xcbf6dc0f,0xbcd58287,0x875a5af6,0xa0c76aa6
	.word  0xfea8685b,0xf2257123,0xcb1284d1,0x6c6ca11b
	.word  0xcb9a235d,0x37d77680,0x92ef73d0,0x8196fd86
	.word  0x32124a97,0xe58bafa1,0x540f233c,0x90ff60fb
	.word  0xda88fd61,0x66d92e3d,0xd0e470b1,0x9c13d734
	.word  0xadbec19c,0x1508cc88,0xae197d74,0xc15b457c
	.word  0x8c64a601,0x5f589b36,0xf8c03b8c,0x730401fb
	.word  0x7c5120fa,0xabca3773,0x2e6dbc9f,0xa4a91bf0
	.word  0x27eb5273,0x3b71d8c2,0xde4c49ec,0x970629fa
	.word  0xcbf083da,0x6f40e126,0xd1c89fbf,0x3bc200b9
	.word  0x6144d385,0x3a4bdb9c,0x097b10ca,0xeccf6eee
	.word  0xf2b4c561,0x9521004a,0xa5420bf4,0x42fde5ba
	.word  0x6ba05f49,0x2f44cff8,0x562d7463,0x7a3e2a9e
	.word  0x1760dabc,0xed746269,0x8fb088f3,0xd5987732
	.word  0x8e758573,0x8f0fafc2,0x95e7aaf0,0x50ba3f13
	.word  0x64ffd5e0,0x9ac4bb7a,0xef4018e0,0xc65e0503
	.word  0x8cbd501b,0xe0161b40,0x9940bab6,0x4954d5f9
	.word  0x62f1a373,0x58a69618,0xae3a2fd8,0x380580fc
	.word  0x956799a9,0x00b4dcb7,0x818a246f,0xc72a1974
	.word  0x09f91592,0x0e8ba49b,0x719c52c5,0x8dadde49
	.word  0x412b19e6,0xf802d624,0xf5f18c0b,0x3f97b534
	.word  0x48ca45ff,0x32f77f8c,0xe4e40935,0x7f264bad
	.word  0xa26f054b,0x10f1bdaf,0x30f5cbbe,0xf813ba2b
	.word  0x82977f7e,0x65bae920,0x3e5b019f,0x145acc1e
	.word  0x7e387fee,0xdb670e2c,0x798a9a6c,0x64d6fba4
	.word  0x29aa6521,0x72f7d5ab,0xd3b7752b,0x760ff59c
	.word  0x6cb2dfa6,0x1e9d5d4b,0xfd1dc7f0,0x9d371622
	.word  0x3b32d1eb,0x636c050f,0x99a92523,0x18ed2b6e
	.word  0x96232a86,0x64cbe61e,0x12bc19a1,0xa9c1d59d
	.word  0x73beddbf,0xfaa819d4,0x94d1ad79,0xa257de05
	.word  0x7bc42c4f,0x25cc4368,0x0fc0b662,0x0b2b487a
	.word  0x4f10bb4c,0x06c41e88,0xb209ac9d,0x4a38c8dc
	.word  0x4f7cb1c6,0x5ff75f24,0xcec65ff5,0x9d7761c7
	.word  0xf80a6794,0xc1381d01,0xf8121d59,0x966842c8
	.word  0x8b12dbbb,0x57377470,0x7584ea2b,0xc48569e9
	.word  0x25927550,0x460a3307,0xb25a760b,0xf2639a5e
	.word  0x5aca1fc3,0x84c3e187,0xc5af1e2c,0xffccf15d
	.word  0x186de628,0xaefecb61,0x17e7b6fc,0x13fcc380
	.word  0xba838eb3,0xe0b3325f,0x749091fc,0x6f68f4ae
	.word  0x0878437f,0xbcaa6811,0xd7db356e,0x03fddac0
	.word  0x386b4bbd,0xe67fea35,0x3e11ea0b,0xe187bbae
	.word  0x88b64a26,0xca1f258d,0x5c7740b9,0x7818f0fd
	.word  0x86f44cc1,0x52fd3293,0xc6f65749,0xa6dc6926
	.word  0x234f25cf,0x601bf53f,0x94750f19,0xfa5c79da
	.word  0x4ca10b18,0x7e0cde16,0xe930180e,0x7162f42b
	.word  0x9046ab0d,0x13a11ea0,0x177bdacf,0x67b6c375
	.word  0x1026f157,0xe2a5bf71,0x931ee824,0x31382c9d
	.word  0xfac3d7db,0x3cb1715f,0xa0d20e83,0xfa065455
	.word  0xdddc8883,0x4243b0b0,0x17452cc9,0x0640bb6f
	.word  0x2e14a69d,0x1fb98593,0x27ece26e,0xc979224e
	.word  0x099148f3,0xf99b2190,0x2825bc35,0x8bcca8a9
	.word  0xbdc8dd57,0x2013297d,0xb145671f,0xae5de3f5
	.word  0xe3dc9657,0xd15744b3,0x9dc41121,0xe05dc50e
	.word  0x07c635af,0xf4dec811,0x72f75af1,0x10ab46c2
	.word  0xe55dfda5,0x4994ee60,0x005e497f,0xea38a439
	.word  0x66d8903f,0x8002f224,0x2ee3d740,0x7458756d
	.word  0x95dd46a5,0xeac4ba3d,0x6a2657ba,0x9a36c6fc
	.word  0x7e0e1ec2,0x3094b32c,0xb6355a0b,0x3b921351
	.word  0x923d3ee9,0xd4cc0433,0xccd21632,0x4eb1343d
	.word  0x10251a2f,0x3b2989f2,0x11c1b299,0xa3abbb65
	.word  0x4a805d98,0x61f3f89e,0x062cb0e9,0x52835b3a
	.word  0x969ec120,0x5e6a027e,0x907cc1f7,0xdb0b2796
	.word  0xd8718041,0xd635fdcc,0xc99465ae,0x64267d7b
	.word  0x2aba886d,0x1e77ad56,0x3cfb4262,0x970d2b69
	.word  0x47a52538,0x2c6a6af3,0x94c3999b,0x35dccd66
	.word  0x775fcfd3,0xee8554ad,0xf9e71a58,0x2eb70f28
	.word  0xc8ae4d8e,0x222949b0,0xd0d70603,0x6e074b39
	.word  0xad366162,0xc2391030,0xe8532fbe,0x6d2da925
	.word  0x9e56f7cb,0x70fd1b5a,0xb49016e5,0xde971f0c
	.word  0x2098ba83,0x4a5706ce,0xf77eee34,0x0085600a
	.word  0x13c5b486,0x9c9a982b,0x84e561a2,0x67bb799c
	.word  0xda5f4f0b,0xc2e28548,0x4093c8d4,0x03899813
	.word  0x3b2400a6,0x30d01cc0,0xeff887de,0x37367a4c
	.word  0x26857069,0xcc3ac7fd,0x1d63db40,0xd6f0b195
	.word  0x0fdaa41b,0x4bb19c2e,0x34607df1,0x849f468c
	.word  0xdcee3081,0xe484047f,0x6798cfc6,0x44221b44
	.word  0x405eda35,0x61386ff3,0x3cc57f66,0xdf975cba
	.word  0xc927e210,0x9936af42,0x5a1ff7c9,0x13fbaf51
	.word  0xc7406f1f,0x547b8e30,0xa77c5592,0xf60a4663
	.word  0x73e7e5b1,0xcea208fa,0x27abaf24,0x21a7b3ab
	.word  0x3081c087,0xb249e682,0x2f2e949e,0xea3b0369
	.word  0xec926b87,0x815e97ec,0xcecbe8b9,0xf03a38c5
	.word  0x4a5112eb,0x644a576f,0xec10b918,0x0e5c4a88
	.word  0xb61e91df,0x33137f22,0x066aadbc,0xc9763005
	.word  0x6771bbb9,0x96a41503,0xc3beff7f,0xebe94f6b
	.word  0xda9e196f,0x672b499e,0x6bfc1562,0xcebbb88b
	.word  0xc9c3acdd,0x6e257d14,0x785b28c9,0xfb9cb41e
	.word  0x4f00469a,0xf82bb793,0x0f5330d9,0xe1dc624a
	.word  0x026493ec,0x795cbf0a,0xc9cf1789,0x9f459923
	.word  0xc448af48,0xd589d0d0,0x4a451718,0x244f9106
	.word  0xb1210bee,0xb0037e54,0x12828d19,0x814ae9d9
	.word  0xfcac98ae,0xcac214a9,0x787a3d0f,0xcc3b005c
	.word  0xe1e5aec1,0xd95bef96,0x61ad8762,0x02dd0ae3
	.word  0xb5e7b676,0x4ad8f469,0x09c3430d,0x34df2bf4
	.word  0x159829b5,0x4e211704,0xfb8a4047,0x316d55cc
	.word  0xed5eff27,0x31b6cbf5,0xb3670587,0x3eae7511
	.word  0x20400b33,0x3cf338f8,0x196de0e2,0x2352976c
	.word  0xd677bd13,0xb104acf4,0xb2239747,0xdd2692b3
	.word  0x66af30b1,0x33462d7b,0x7be765ca,0x688912b9
	.word  0x2a93398f,0x83ee09cd,0xddcf8335,0xb206f99c
	.word  0xe9e3aa2b,0x3d0a8efa,0x420c5162,0xec100cdb
	.word  0xe1ca41a4,0x40de268e,0xc2c0bc12,0xda4b95ce
	.word  0x2648c43b,0x48e34031,0x37c5ea60,0x17bf9c5c
	.word  0x2f2c4ba7,0x2aa22c3f,0x88a65e79,0x1e1f0373
	.word  0x8570617c,0x3c112311,0x6bbad056,0xd93542a8
	.word  0xaef09465,0xed032baa,0xb25d8ed5,0x4283a3b0
	.word  0x50965749,0x7d3301dc,0x5fc67ada,0x5b5ccb1b
	.word  0x8fca742b,0x893e1db5,0x24c7fd22,0x2d39c41c
	.word  0x9bbef687,0xa2cff232,0xb66ac183,0x28ce4dc4
	.word  0x3a6e31e8,0xc20c4910,0x3973a4a0,0x62cae305
	.word  0x71f5c7ac,0x07ddd30c,0x0b615112,0x8e995ddb
	.word  0x80d50202,0x78bc29d8,0x58f30794,0xaecd2e1e
	.word  0x3d247ae8,0x051e9f3c,0x84b3438f,0x815853e1
	.word  0xc0cea506,0xbbaf8488,0x58d1b014,0x1a8353b3
	.word  0xeacd5182,0x52502a6b,0xb2724759,0x8cdf89be
	.word  0x48a2aa64,0xd134fa1d,0xa1f96128,0x4e4dbecb



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
!!#   IJ_set_ropr_fld ("diag.j", 42, ijdefault, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Ft_Rs2, "{11..15}");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 52, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 53, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 54, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 55, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 56, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 57, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 58, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   //Internal asi
!!#   IJ_set_ropr_fld ("diag.j", 61, Ro_err_trap, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_err_trap, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 63, Ro_err_trap, Ft_Rd, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 64, Ro_err_trap, Ft_Imm_Asi, "{0x4b}");
!!# 
!!#   //r3 will have all f's
!!#   IJ_set_ropr_fld ("diag.j", 67, Ro_err_stat, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 68, Ro_err_stat, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 69, Ro_err_stat, Ft_Rd, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 70, Ro_err_stat, Ft_Imm_Asi, "{0x4c}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 72, Ro_err_addr, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 73, Ro_err_addr, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 74, Ro_err_addr, Ft_Rd, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 75, Ro_err_addr, Ft_Imm_Asi, "{0x4d}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 77, Ro_inv_itlb, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 78, Ro_inv_itlb, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 79, Ro_inv_itlb, Ft_Rd, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 80, Ro_inv_itlb, Ft_Imm_Asi, "{0x60}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 82, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 83, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 85, Ro_rsvd_set, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld ("diag.j", 86, Ro_rsvd_set, Ft_Rs2, "{11..15}");
!!#   IJ_set_ropr_fld ("diag.j", 87, Ro_rsvd_set, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld ("diag.j", 88, Ro_rsvd_set, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_bits ("diag.j", 89, Ro_rsvd_set, 0x1f70, "13'br1rr1rrr00000");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 91, Ro_load_r, Ft_Rs2, "{9}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 94, th_all,0xf);
!!# 
!!#   IJ_th_fork_group ("diag.j", 99, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 103, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 17; i < 32; i++) {
!!#      IJ_printf ("diag.j", 105, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 109, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 111, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 3; i < 9; i++) {
!!#      IJ_printf ("diag.j", 116, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 119, th_all, "\tsetx  0xffffffffffffffff, %%r16, %%r2\n");
!!# 
!!#   IJ_printf ("diag.j", 121, th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 122, th_all, 4);
!!#   IJ_printf ("diag.j", 123, th_all, "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!#   IJ_printf ("diag.j", 124, th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 126, st_int_wt, "{2}");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join ("diag.j", 130,0xf);
!!#   IJ_th_start ("diag.j", 131,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 133, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 134, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 135, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 136, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 137, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 138, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 139, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 140, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 141, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 142, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 144, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 145, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 147, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 148, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!# inst_type: store_int_burst %rvar  st_int_wt
!!#            | st_fp 
!!# 	     {
!!#  		IJ_generate ("diag.j", 177, th_all, $1);
!!#              }
!!# 	   | atomic 
!!# 	     {
!!#  		IJ_generate ("diag.j", 181, th_all, $1);
!!#              }
!!#            | st_int_asi 
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
!!#            | dcerr_ld
!!#            | load_i
!!# 	     {
!!#                 IJ_generate ("diag.j", 206, th_all, $1);
!!#              }   
!!#            | illinst
!!# ;
!!# 
!!# resum_intr: mMETA16
!!# {
!!#   IJ_generate_from_token ("diag.j", 213,1, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                          tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!#   IJ_printf ("diag.j", 214, th_all, "thr%y_resum_intr_%d:\n", intr_cnt);
!!#   IJ_printf ("diag.j", 215, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.thr%y_resum_intr_%d), 16, 16)) -> intp(1, 3, 1)\n", intr_cnt);
!!#   intr_cnt++;
!!# }
!!# ;
!!# 
!!# store_int_burst: mMETA0
!!# {
!!#    burst_cnt = random () % 5 + 3;
!!#    IJ_generate_from_token ("diag.j", 223,burst_cnt, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                            tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!# }
!!# ;
!!# 
!!# alu_burst: mMETA1
!!# {
!!#    burst_cnt = random () % 4 + 1;
!!#    IJ_generate_from_token ("diag.j", 230,burst_cnt, th_all, ijdefault,
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
!!#    IJ_generate_from_token ("diag.j", 236,1, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                            tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!#    IJ_printf ("diag.j", 237, th_all, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 3;
!!#    if (i == 0) {
!!#       IJ_printf ("diag.j", 240, th_all, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 242, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!#       IJ_printf ("diag.j", 244, th_all, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 246, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!#       IJ_printf ("diag.j", 248, th_all, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 251, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),1,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr_ld: dcerr load_r %ropr  Ro_load_r
!!#           {
!!#              IJ_generate ("diag.j", 259, th_all, $2);
!!#              $$ = $2;
!!#           }
!!# ;
!!# 
!!# dcerr: mMETA4
!!#           {
!!#              IJ_printf ("diag.j", 266, th_all, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#              bitnum = random () % 72;
!!#              IJ_printf ("diag.j", 268, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),1,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#              dc_err_cnt++;
!!#           }
!!# ;
!!# 
!!# irferr: mMETA5
!!# {
!!#      IJ_generate_from_token ("diag.j", 275,1, th_all, ijdefault, tSTB_R, tSTB_I, tSTH_R,
!!#                            tSTH_I, tSTW_R, tSTW_I, tSTX_R, tSTX_I, -1);;
!!#      IJ_printf ("diag.j", 276, th_all, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 70;
!!#      IJ_printf ("diag.j", 278, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
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
!!#   IJ_printf ("diag.j", 372, th_all, "!Generating an illinst\n");
!!#   IJ_generate ("diag.j", 373, th_all, $2);
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
!!# d10: mMETA10
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

