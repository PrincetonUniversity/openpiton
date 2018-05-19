// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3932.s
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
   random seed:	939270019
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
	setx  0x48b8d16e714d6764, %r16, %r17
	setx  0x4566caac6d0c6045, %r16, %r18
	setx  0x14993fdfd7c2302c, %r16, %r19
	setx  0xbeb3a3b5182567dd, %r16, %r20
	setx  0xdf8cad5ee62dbb97, %r16, %r21
	setx  0x58751eb7696d749a, %r16, %r22
	setx  0xf4a053164fc9f7e2, %r16, %r23
	setx  0x417d98941f673ca0, %r16, %r24
	setx  0x6574f5ce515a2a61, %r16, %r25
	setx  0x25f58b521a526e4a, %r16, %r26
	setx  0xeae8780a480b07b2, %r16, %r27
	setx  0x5cc711b9b34d8364, %r16, %r28
	setx  0x45375e5892b20240, %r16, %r29
	setx  0x870a3488e703ba59, %r16, %r30
	setx  0x4587934ab899e9ba, %r16, %r31
	setx  0x00000000000006f0, %r16, %r9
	setx  0x00000000000006b0, %r16, %r10
	setx  0x0000000000000670, %r16, %r11
	setx  0x00000000000007d0, %r16, %r12
	setx  0x0000000000000e60, %r16, %r13
	setx  0x00000000000003c0, %r16, %r14
	setx  0x0000000000000d30, %r16, %r15
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
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
thr3_dc_err_0:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_0), 16, 16),1,DC_DATA,57)
	.word 0xf21a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r25
	.word 0xfcf9a6bc  ! 4: SWAPA_I	swapa	%r30, [%r6 + 0x06bc] %asi
	.word 0xc0f009a0  ! 6: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf4a8e14d  ! 7: STBA_I	stba	%r26, [%r3 + 0x014d] %asi
	.word 0xf0f9d00d  ! 8: SWAPA_R	swapa	%r24, [%r7 + %r13] 0x80
	.word 0xe231aa7c  ! 9: STH_I	sth	%r17, [%r6 + 0x0a7c]
thr3_ic_err_0:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,12,30)
!Generating an illinst
	.word 0xb0211f6f  ! 11: SUB_R	sub 	%r4, %r15, %r24
	.word 0xe8a9500e  ! 12: STBA_R	stba	%r20, [%r5 + %r14] 0x80
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 16: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 20: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 22: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_1:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_1), 16, 16),1,DC_DATA,46)
	.word 0xea012d5d  ! 24: LDUW_I	lduw	[%r4 + 0x0d5d], %r21
	.word 0xc0f009a0  ! 26: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 28: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 30: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 32: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xac3a2f67  ! 34: XNOR_I	xnor 	%r8, 0x0f67, %r22
!Generating an illinst
	.word 0xb331fd21  ! 36: SRLX_I	srlx	%r7, 0x0021, %r25
	.word 0xf621000d  ! 37: STW_R	stw	%r27, [%r4 + %r13]
thr3_resum_intr_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 39: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfc31e87c  ! 40: STH_I	sth	%r30, [%r7 + 0x087c]
thr3_resum_intr_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xfc21c00b  ! 41: STW_R	stw	%r30, [%r7 + %r11]
	.word 0xe421000c  ! 41: STW_R	stw	%r18, [%r4 + %r12]
	.word 0xfe722cc0  ! 41: STX_I	stx	%r31, [%r8 + 0x0cc0]
	.word 0xe471000c  ! 41: STX_R	stx	%r18, [%r4 + %r12]
	.word 0xe43162a2  ! 41: STH_I	sth	%r18, [%r5 + 0x02a2]
	.word 0xe270e098  ! 41: STX_I	stx	%r17, [%r3 + 0x0098]
	.word 0xc0f009a0  ! 43: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa5313d61  ! 45: SRLX_I	srlx	%r4, 0x0021, %r18
	.word 0xbd322001  ! 46: SRL_I	srl 	%r8, 0x0001, %r30
	.word 0xb031a5a3  ! 46: ORN_I	orn 	%r6, 0x05a3, %r24
thr3_dc_err_2:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_2), 16, 16),1,DC_DATA,39)
	.word 0xf40a0009  ! 48: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xfe28e6d6  ! 49: STB_I	stb	%r31, [%r3 + 0x06d6]
thr3_ic_err_1:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,5,32)
	.word 0x8143e019  ! 50: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside 
thr3_dc_err_3:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_3), 16, 16),1,DC_DATA,1)
	.word 0xea190009  ! 52: LDD_R	ldd	[%r4 + %r9], %r21
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfc412a50  ! 55: LDSW_I	ldsw	[%r4 + 0x0a50], %r30
	.word 0xc0f009a0  ! 57: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_4:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_4), 16, 16),1,DC_DATA,50)
	.word 0xf848c009  ! 61: LDSB_R	ldsb	[%r3 + %r9], %r28
	.word 0xc4f00980  ! 63: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf138e300  ! 64: STDF_I	std	%f24, [0x0300, %r3]
!Generating an illinst
	.word 0xaa312feb  ! 66: ORN_I	orn 	%r4, 0x0feb, %r21
	.word 0xc0f00960  ! 68: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 70: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 72: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 76: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf871000e  ! 77: STX_R	stx	%r28, [%r4 + %r14]
thr3_irf_ce_0:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_0), 16, 16), 1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 79: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb821bbc1  ! 81: SUB_I	sub 	%r6, 0xfffffbc1, %r28
	.word 0xc0f009a0  ! 83: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 85: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xec29c00d  ! 86: STB_R	stb	%r22, [%r7 + %r13]
thr3_irf_ce_1:
!$EV error(3,expr(@VA(.MAIN.thr3_irf_ce_1), 16, 16), 1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc0f009a0  ! 88: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbb28cd0d  ! 90: SLL_R	sll 	%r3, %r13, %r29
	.word 0xc4f00c00  ! 92: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfe21a3ec  ! 93: STW_I	stw	%r31, [%r6 + 0x03ec]
	.word 0xf4316974  ! 93: STH_I	sth	%r26, [%r5 + 0x0974]
	.word 0xee216858  ! 93: STW_I	stw	%r23, [%r5 + 0x0858]
	.word 0xf4292d25  ! 93: STB_I	stb	%r26, [%r4 + 0x0d25]
	.word 0xf2222e08  ! 93: STW_I	stw	%r25, [%r8 + 0x0e08]
	.word 0xfc21400f  ! 93: STW_R	stw	%r30, [%r5 + %r15]
	.word 0xc0f00960  ! 95: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_5:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_5), 16, 16),1,DC_DATA,24)
	.word 0xe411c009  ! 97: LDUH_R	lduh	[%r7 + %r9], %r18
	.word 0xc0f00960  ! 99: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfc212500  ! 100: STW_I	stw	%r30, [%r4 + 0x0500]
	.word 0xee20e418  ! 100: STW_I	stw	%r23, [%r3 + 0x0418]
	.word 0xf631adf2  ! 100: STH_I	sth	%r27, [%r6 + 0x0df2]
	.word 0xfe2220f8  ! 100: STW_I	stw	%r31, [%r8 + 0x00f8]
	.word 0xfc70c00c  ! 100: STX_R	stx	%r30, [%r3 + %r12]
	.word 0xf071eb18  ! 100: STX_I	stx	%r24, [%r7 + 0x0b18]
	.word 0xe631e5a2  ! 100: STH_I	sth	%r19, [%r7 + 0x05a2]
	.word 0xc0f009a0  ! 102: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa331bd41  ! 104: SRLX_I	srlx	%r6, 0x0001, %r17
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 108: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb12a3d21  ! 110: SLL_I	sllx	%r8, 0x0021, %r24
	.word 0xc0f009a0  ! 112: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 114: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 116: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 118: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0x81d8c00b  ! 119: FLUSH_R	dis not found

	.word 0xfefa100f  ! 120: SWAPA_R	swapa	%r31, [%r8 + %r15] 0x80
	.word 0xc4f00980  ! 122: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 124: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 126: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe739e490  ! 127: STDF_I	std	%f19, [0x0490, %r7]
	.word 0xc4f00c00  ! 129: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xab28ff21  ! 131: SLLX_I	sllx	%r3, 0x0021, %r21
	.word 0xc4f00980  ! 133: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 135: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_6:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_6), 16, 16),1,DC_DATA,44)
	.word 0xfe10c009  ! 137: LDUH_R	lduh	[%r3 + %r9], %r31
thr3_dc_err_7:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_7), 16, 16),1,DC_DATA,43)
	.word 0xfe08c009  ! 139: LDUB_R	ldub	[%r3 + %r9], %r31
	.word 0xfe28e700  ! 140: STB_I	stb	%r31, [%r3 + 0x0700]
	.word 0xf271000d  ! 140: STX_R	stx	%r25, [%r4 + %r13]
	.word 0xee31400f  ! 140: STH_R	sth	%r23, [%r5 + %r15]
	.word 0xc0f009a0  ! 142: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xea2226c8  ! 143: STW_I	stw	%r21, [%r8 + 0x06c8]
	.word 0xe6292b4d  ! 143: STB_I	stb	%r19, [%r4 + 0x0b4d]
	.word 0xf42161c0  ! 143: STW_I	stw	%r26, [%r5 + 0x01c0]
	.word 0xe420e0f8  ! 143: STW_I	stw	%r18, [%r3 + 0x00f8]
	.word 0xe831400d  ! 143: STH_R	sth	%r20, [%r5 + %r13]
	.word 0xec21e258  ! 143: STW_I	stw	%r22, [%r7 + 0x0258]
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 147: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_8:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_8), 16, 16),1,DC_DATA,23)
	.word 0xee110009  ! 149: LDUH_R	lduh	[%r4 + %r9], %r23
	.word 0xc0f009a0  ! 151: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbb28fb01  ! 153: SLL_I	sllx	%r3, 0x0001, %r29
	.word 0xc4f00c00  ! 155: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa2113ba6  ! 157: OR_I	or 	%r4, 0xfffffba6, %r17
	.word 0xc0f00960  ! 159: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb0398b0f  ! 161: XNOR_R	xnor 	%r6, %r15, %r24
thr3_dc_err_9:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_9), 16, 16),1,DC_DATA,10)
	.word 0xee012514  ! 163: LDUW_I	lduw	[%r4 + 0x0514], %r23
	.word 0xc0f00960  ! 165: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 167: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 169: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb80a1b0d  ! 171: AND_R	and 	%r8, %r13, %r28
	.word 0xc4f00c00  ! 173: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe410e98a  ! 174: LDUH_I	lduh	[%r3 + 0x098a], %r18
	.word 0xc0f00960  ! 176: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 182: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 184: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe8ea2d44  ! 185: LDSTUBA_I	ldstuba	%r20, [%r8 + 0x0d44] %asi
	.word 0xc4f00c00  ! 187: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfc79400e  ! 188: SWAP_R	swap	%r30, [%r5 + %r14]
	.word 0xc0f009a0  ! 190: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_10:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_10), 16, 16),1,DC_DATA,2)
	.word 0xf2016b02  ! 192: LDUW_I	lduw	[%r5 + 0x0b02], %r25
	.word 0xf2216233  ! 193: STW_I	stw	%r25, [%r5 + 0x0233]
	.word 0xc4f00c00  ! 195: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 197: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_11:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_11), 16, 16),1,DC_DATA,49)
	.word 0xf2494009  ! 199: LDSB_R	ldsb	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 201: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_12:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_12), 16, 16),1,DC_DATA,10)
	.word 0xf2414009  ! 203: LDSW_R	ldsw	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 205: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 207: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xa931400f  ! 208: SRL_R	srl 	%r5, %r15, %r20
	.word 0xa729c00d  ! 208: SLL_R	sll 	%r7, %r13, %r19
	.word 0xc0f00960  ! 210: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 212: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 214: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbb3a2901  ! 216: SRA_I	sra 	%r8, 0x0001, %r29
	.word 0xc0f009a0  ! 218: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 220: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xec21c00b  ! 221: STW_R	stw	%r22, [%r7 + %r11]
thr3_ic_err_2:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_2), 16, 16),1,IC_DATA,IR_NIR,26,4)
!Generating an illinst
	.word 0xb339dd6e  ! 223: SRAX_R	srax	%r7, %r14, %r25
	.word 0xc4f00c00  ! 225: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 227: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa831add2  ! 229: ORN_I	orn 	%r6, 0x0dd2, %r20
	.word 0xc4f00c00  ! 231: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 235: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_13:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_13), 16, 16),1,DC_DATA,37)
	.word 0xe800c009  ! 239: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc0f009a0  ! 241: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 243: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xaf317b21  ! 247: SRLX_I	srlx	%r5, 0x0021, %r23
	.word 0xc4f00980  ! 249: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xeafa2478  ! 250: SWAPA_I	swapa	%r21, [%r8 + 0x0478] %asi
thr3_dc_err_14:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_14), 16, 16),1,DC_DATA,5)
	.word 0xe60a0009  ! 252: LDUB_R	ldub	[%r8 + %r9], %r19
!Generating an illinst
	.word 0xa73a1d6d  ! 254: SRA_R	srax	%r8, %r13, %r19
	.word 0xc4f00c00  ! 256: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe221800c  ! 257: STW_R	stw	%r17, [%r6 + %r12]
thr3_resum_intr_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xe821400b  ! 258: STW_R	stw	%r20, [%r5 + %r11]
	.word 0xe271000b  ! 258: STX_R	stx	%r17, [%r4 + %r11]
	.word 0xee71000f  ! 258: STX_R	stx	%r23, [%r4 + %r15]
	.word 0xf228ee96  ! 258: STB_I	stb	%r25, [%r3 + 0x0e96]
	.word 0xf030e6b8  ! 258: STH_I	sth	%r24, [%r3 + 0x06b8]
	.word 0xc0f009a0  ! 260: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_15:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_15), 16, 16),1,DC_DATA,25)
	.word 0xf801225d  ! 262: LDUW_I	lduw	[%r4 + 0x025d], %r28
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 266: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_16:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_16), 16, 16),1,DC_DATA,7)
	.word 0xf8110009  ! 268: LDUH_R	lduh	[%r4 + %r9], %r28
	.word 0xf221800d  ! 269: STW_R	stw	%r25, [%r6 + %r13]
	.word 0xf631a48e  ! 269: STH_I	sth	%r27, [%r6 + 0x048e]
	.word 0xe221c00f  ! 269: STW_R	stw	%r17, [%r7 + %r15]
	.word 0xfe28c00c  ! 269: STB_R	stb	%r31, [%r3 + %r12]
!Generating an illinst
	.word 0xa731bd01  ! 271: SRL_I	srlx	%r6, 0x0001, %r19
	.word 0xc0f009a0  ! 273: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 275: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr3_dc_err_17:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_17), 16, 16),1,DC_DATA,50)
	.word 0xf4198009  ! 277: LDD_R	ldd	[%r6 + %r9], %r26
	.word 0xc4f00c00  ! 279: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 281: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_18:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_18), 16, 16),1,DC_DATA,7)
	.word 0xf4418009  ! 283: LDSW_R	ldsw	[%r6 + %r9], %r26
	.word 0xc0f009a0  ! 285: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 287: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 289: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr3_dc_err_19:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_19), 16, 16),1,DC_DATA,32)
	.word 0xf4418009  ! 291: LDSW_R	ldsw	[%r6 + %r9], %r26
!Generating an illinst
	.word 0xb8398f2f  ! 293: XNOR_R	xnor 	%r6, %r15, %r28
	.word 0xc0f00960  ! 295: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 297: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb6394b6b  ! 299: XNOR_R	xnor 	%r5, %r11, %r27
	.word 0xc0f009a0  ! 301: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xfc29e132  ! 302: STB_I	stb	%r30, [%r7 + 0x0132]
thr3_ic_err_3:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_3), 16, 16),1,IC_DATA,NIR,x,19)
	.word 0xc4f00980  ! 304: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 306: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe231a164  ! 307: STH_I	sth	%r17, [%r6 + 0x0164]
thr3_ic_err_4:
!ic err NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_4), 16, 16),1,IC_DATA,NIR,x,30)
thr3_dc_err_20:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_20), 16, 16),1,DC_DATA,43)
	.word 0xf048c009  ! 309: LDSB_R	ldsb	[%r3 + %r9], %r24
	.word 0xc4f00980  ! 311: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 313: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 315: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe521400c  ! 316: STF_R	st	%f18, [%r12, %r5]
	.word 0xc0f009a0  ! 318: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 320: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 322: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 326: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe271400d  ! 329: STX_R	stx	%r17, [%r5 + %r13]
	.word 0xc4f00980  ! 331: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 333: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 335: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 339: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_21:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_21), 16, 16),1,DC_DATA,45)
	.word 0xe2094009  ! 341: LDUB_R	ldub	[%r5 + %r9], %r17
thr3_dc_err_22:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_22), 16, 16),1,DC_DATA,71)
	.word 0xe2014009  ! 343: LDUW_R	lduw	[%r5 + %r9], %r17
	.word 0xea69800f  ! 344: LDSTUB_R	ldstub	%r21, [%r6 + %r15]
	.word 0xc4f00c00  ! 346: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 348: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 352: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfa68c00e  ! 353: LDSTUB_R	ldstub	%r29, [%r3 + %r14]
thr3_dc_err_23:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_23), 16, 16),1,DC_DATA,48)
	.word 0xf401eb36  ! 355: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 357: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf029000c  ! 358: STB_R	stb	%r24, [%r4 + %r12]
thr3_resum_intr_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.thr3_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xc0f009a0  ! 360: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xae115b0d  ! 362: OR_R	or 	%r5, %r13, %r23
	.word 0xc0f00960  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_24:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_24), 16, 16),1,DC_DATA,35)
	.word 0xe4018009  ! 366: LDUW_R	lduw	[%r6 + %r9], %r18
	.word 0xe6a1900b  ! 367: STWA_R	stwa	%r19, [%r6 + %r11] 0x80
	.word 0xc0f00960  ! 369: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 371: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 373: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf429e0f7  ! 376: STB_I	stb	%r26, [%r7 + 0x00f7]
	.word 0xc0f00960  ! 378: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 380: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 382: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 384: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 386: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 388: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 390: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_25:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_25), 16, 16),1,DC_DATA,43)
	.word 0xf401eb36  ! 392: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 394: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa931ff61  ! 396: SRLX_I	srlx	%r7, 0x0021, %r20
	.word 0xc4f00980  ! 398: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 400: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xaf3a1f4e  ! 402: SRAX_R	srax	%r8, %r14, %r23
	.word 0xee29000c  ! 403: STB_R	stb	%r23, [%r4 + %r12]
thr3_ic_err_5:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,16,1)
	.word 0xeb39800c  ! 404: STDF_R	std	%f21, [%r12, %r6]
!Generating an illinst
	.word 0xa4091b0c  ! 406: AND_R	and 	%r4, %r12, %r18
	.word 0x81d9c00f  ! 407: FLUSH_R	dis not found

	.word 0xc0f00960  ! 409: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_26:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_26), 16, 16),1,DC_DATA,60)
	.word 0xe611c009  ! 411: LDUH_R	lduh	[%r7 + %r9], %r19
	.word 0xc4f00980  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xec11ae6a  ! 414: LDUH_I	lduh	[%r6 + 0x0e6a], %r22
	.word 0xc0f009a0  ! 416: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 418: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 422: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_27:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_27), 16, 16),1,DC_DATA,58)
	.word 0xe800c009  ! 424: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc4f00980  ! 426: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa4094b6b  ! 428: AND_R	and 	%r5, %r11, %r18
thr3_dc_err_28:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_28), 16, 16),1,DC_DATA,70)
	.word 0xe808c009  ! 430: LDUB_R	ldub	[%r3 + %r9], %r20
	.word 0xf6292c9d  ! 431: STB_I	stb	%r27, [%r4 + 0x0c9d]
thr3_ic_err_6:
!ic err IR_NIR
!$EV error(3,expr(@VA(.MAIN.thr3_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,33,31)
	.word 0xc0f00960  ! 433: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb031bdfd  ! 435: ORN_I	orn 	%r6, 0xfffffdfd, %r24
	.word 0xc4f00980  ! 437: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb7291f4d  ! 439: SLLX_R	sllx	%r4, %r13, %r27
thr3_dc_err_29:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_29), 16, 16),1,DC_DATA,56)
	.word 0xfe118009  ! 441: LDUH_R	lduh	[%r6 + %r9], %r31
thr3_dc_err_30:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_30), 16, 16),1,DC_DATA,19)
	.word 0xfe198009  ! 443: LDD_R	ldd	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 445: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb529dd4b  ! 447: SLLX_R	sllx	%r7, %r11, %r26
!Generating an illinst
	.word 0xb738ff01  ! 449: SRA_I	srax	%r3, 0x0001, %r27
	.word 0xf408ed3e  ! 450: LDUB_I	ldub	[%r3 + 0x0d3e], %r26
!Generating an illinst
	.word 0xb3390b0e  ! 452: SRA_R	sra 	%r4, %r14, %r25
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 456: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_31:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_31), 16, 16),1,DC_DATA,54)
	.word 0xfc414009  ! 458: LDSW_R	ldsw	[%r5 + %r9], %r30
	.word 0xc4f00c00  ! 460: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa429afd3  ! 462: ANDN_I	andn 	%r6, 0x0fd3, %r18
!Generating an illinst
	.word 0xa221992b  ! 464: SUB_R	sub 	%r6, %r11, %r17
	.word 0xc4f00c00  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb8310b6f  ! 468: ORN_R	orn 	%r4, %r15, %r28
	.word 0xc4f00980  ! 470: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 472: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 474: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 476: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xaa38fbbe  ! 478: XNOR_I	xnor 	%r3, 0xfffffbbe, %r21
	.word 0xc0f00960  ! 480: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 482: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr3_dc_err_32:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_32), 16, 16),1,DC_DATA,3)
	.word 0xfc114009  ! 484: LDUH_R	lduh	[%r5 + %r9], %r30
thr3_dc_err_33:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_33), 16, 16),1,DC_DATA,14)
	.word 0xfc094009  ! 486: LDUB_R	ldub	[%r5 + %r9], %r30
	.word 0xc4f00980  ! 488: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xac114d0f  ! 490: OR_R	or 	%r5, %r15, %r22
	.word 0xc0f009a0  ! 492: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 494: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 496: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 498: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr3_dc_err_34:
!$EV error(3,expr(@VA(.MAIN.thr3_dc_err_34), 16, 16),1,DC_DATA,49)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx  0xd3e227d83c2162c4, %r16, %r17
	setx  0xb539cc42e703a605, %r16, %r18
	setx  0x9451b75968479cbb, %r16, %r19
	setx  0x1d948e257a5d55ae, %r16, %r20
	setx  0x064eb2830337c873, %r16, %r21
	setx  0x6b4f001536e87050, %r16, %r22
	setx  0x433cf5242451a078, %r16, %r23
	setx  0xa15e6893b6441225, %r16, %r24
	setx  0x3d636bf5fd408fb3, %r16, %r25
	setx  0x8f7b94e7b6791cf5, %r16, %r26
	setx  0xed7ce66bf9e3c246, %r16, %r27
	setx  0xbfe344d6c453449e, %r16, %r28
	setx  0xc9f188d088a8f09d, %r16, %r29
	setx  0xbeb06d7dd57933f9, %r16, %r30
	setx  0xa5dee7bbc7e9f80c, %r16, %r31
	setx  0x0000000000000ba0, %r16, %r9
	setx  0x0000000000000020, %r16, %r10
	setx  0x0000000000000c80, %r16, %r11
	setx  0x00000000000008b0, %r16, %r12
	setx  0x0000000000000e00, %r16, %r13
	setx  0x0000000000000110, %r16, %r14
	setx  0x0000000000000570, %r16, %r15
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
	.word 0x0e800001  ! 1: BVS	bvs  	<label_0x1>
thr2_dc_err_0:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_0), 16, 16),1,DC_DATA,57)
	.word 0xf21a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r25
	.word 0xfcf96884  ! 4: SWAPA_I	swapa	%r30, [%r5 + 0x0884] %asi
	.word 0xc0f009a0  ! 6: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xfea8ed11  ! 7: STBA_I	stba	%r31, [%r3 + 0x0d11] %asi
	.word 0xf0f9500d  ! 8: SWAPA_R	swapa	%r24, [%r5 + %r13] 0x80
	.word 0xfa31e9f2  ! 9: STH_I	sth	%r29, [%r7 + 0x09f2]
thr2_ic_err_0:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,12,30)
!Generating an illinst
	.word 0xb221cd2e  ! 11: SUB_R	sub 	%r7, %r14, %r25
	.word 0xf2a8d00e  ! 12: STBA_R	stba	%r25, [%r3 + %r14] 0x80
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 16: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 20: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 22: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_1:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_1), 16, 16),1,DC_DATA,46)
	.word 0xea012d5d  ! 24: LDUW_I	lduw	[%r4 + 0x0d5d], %r21
	.word 0xc0f009a0  ! 26: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 28: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 30: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 32: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbc397f12  ! 34: XNOR_I	xnor 	%r5, 0xffffff12, %r30
!Generating an illinst
	.word 0xa7323b21  ! 36: SRLX_I	srlx	%r8, 0x0021, %r19
	.word 0xee21400b  ! 37: STW_R	stw	%r23, [%r5 + %r11]
thr2_resum_intr_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 39: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfc322004  ! 40: STH_I	sth	%r30, [%r8 + 0x0004]
thr2_resum_intr_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xe221c00b  ! 41: STW_R	stw	%r17, [%r7 + %r11]
	.word 0xf421400d  ! 41: STW_R	stw	%r26, [%r5 + %r13]
	.word 0xf670ebc0  ! 41: STX_I	stx	%r27, [%r3 + 0x0bc0]
	.word 0xe870c00e  ! 41: STX_R	stx	%r20, [%r3 + %r14]
	.word 0xe63167c6  ! 41: STH_I	sth	%r19, [%r5 + 0x07c6]
	.word 0xf270e2e0  ! 41: STX_I	stx	%r25, [%r3 + 0x02e0]
	.word 0xc0f009a0  ! 43: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbf323f41  ! 45: SRLX_I	srlx	%r8, 0x0001, %r31
	.word 0xb7312001  ! 46: SRL_I	srl 	%r4, 0x0001, %r27
	.word 0xa831686a  ! 46: ORN_I	orn 	%r5, 0x086a, %r20
thr2_dc_err_2:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_2), 16, 16),1,DC_DATA,39)
	.word 0xf40a0009  ! 48: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xe4292df7  ! 49: STB_I	stb	%r18, [%r4 + 0x0df7]
thr2_ic_err_1:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,5,32)
	.word 0x8143e039  ! 50: MEMBAR	membar	#LoadLoad | #StoreStore | #Lookaside | #MemIssue 
thr2_dc_err_3:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_3), 16, 16),1,DC_DATA,1)
	.word 0xea190009  ! 52: LDD_R	ldd	[%r4 + %r9], %r21
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf641a3dc  ! 55: LDSW_I	ldsw	[%r6 + 0x03dc], %r27
	.word 0xc0f009a0  ! 57: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_4:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_4), 16, 16),1,DC_DATA,50)
	.word 0xf848c009  ! 61: LDSB_R	ldsb	[%r3 + %r9], %r28
	.word 0xc4f00980  ! 63: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe73969e0  ! 64: STDF_I	std	%f19, [0x09e0, %r5]
!Generating an illinst
	.word 0xa2316f27  ! 66: ORN_I	orn 	%r5, 0x0f27, %r17
	.word 0xc0f00960  ! 68: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 70: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 72: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 76: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf672000e  ! 77: STX_R	stx	%r27, [%r8 + %r14]
thr2_irf_ce_0:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_0), 16, 16), 1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 79: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb821bbea  ! 81: SUB_I	sub 	%r6, 0xfffffbea, %r28
	.word 0xc0f009a0  ! 83: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 85: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf829400e  ! 86: STB_R	stb	%r28, [%r5 + %r14]
thr2_irf_ce_1:
!$EV error(2,expr(@VA(.MAIN.thr2_irf_ce_1), 16, 16), 1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc0f009a0  ! 88: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb9290b2c  ! 90: SLL_R	sll 	%r4, %r12, %r28
	.word 0xc4f00c00  ! 92: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe620e384  ! 93: STW_I	stw	%r19, [%r3 + 0x0384]
	.word 0xf431af82  ! 93: STH_I	sth	%r26, [%r6 + 0x0f82]
	.word 0xe620ebe0  ! 93: STW_I	stw	%r19, [%r3 + 0x0be0]
	.word 0xfe28e6d3  ! 93: STB_I	stb	%r31, [%r3 + 0x06d3]
	.word 0xf620eec4  ! 93: STW_I	stw	%r27, [%r3 + 0x0ec4]
	.word 0xfe21000e  ! 93: STW_R	stw	%r31, [%r4 + %r14]
	.word 0xc0f00960  ! 95: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_5:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_5), 16, 16),1,DC_DATA,24)
	.word 0xe411c009  ! 97: LDUH_R	lduh	[%r7 + %r9], %r18
	.word 0xc0f00960  ! 99: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xfa21210c  ! 100: STW_I	stw	%r29, [%r4 + 0x010c]
	.word 0xfc20ee60  ! 100: STW_I	stw	%r30, [%r3 + 0x0e60]
	.word 0xfc31e384  ! 100: STH_I	sth	%r30, [%r7 + 0x0384]
	.word 0xf021a994  ! 100: STW_I	stw	%r24, [%r6 + 0x0994]
	.word 0xe871c00f  ! 100: STX_R	stx	%r20, [%r7 + %r15]
	.word 0xf27229c8  ! 100: STX_I	stx	%r25, [%r8 + 0x09c8]
	.word 0xfc322182  ! 100: STH_I	sth	%r30, [%r8 + 0x0182]
	.word 0xc0f009a0  ! 102: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb1313961  ! 104: SRLX_I	srlx	%r4, 0x0021, %r24
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 108: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xab29bf01  ! 110: SLL_I	sllx	%r6, 0x0001, %r21
	.word 0xc0f009a0  ! 112: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 114: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 116: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 118: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0x81d9800c  ! 119: FLUSH_R	dis not found

	.word 0xf6f9500c  ! 120: SWAPA_R	swapa	%r27, [%r5 + %r12] 0x80
	.word 0xc4f00980  ! 122: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 124: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 126: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfb3a2030  ! 127: STDF_I	std	%f29, [0x0030, %r8]
	.word 0xc4f00c00  ! 129: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xad293921  ! 131: SLLX_I	sllx	%r4, 0x0021, %r22
	.word 0xc4f00980  ! 133: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 135: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_6:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_6), 16, 16),1,DC_DATA,44)
	.word 0xfe10c009  ! 137: LDUH_R	lduh	[%r3 + %r9], %r31
thr2_dc_err_7:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_7), 16, 16),1,DC_DATA,43)
	.word 0xfe08c009  ! 139: LDUB_R	ldub	[%r3 + %r9], %r31
	.word 0xe2296d77  ! 140: STB_I	stb	%r17, [%r5 + 0x0d77]
	.word 0xea71000b  ! 140: STX_R	stx	%r21, [%r4 + %r11]
	.word 0xee31c00f  ! 140: STH_R	sth	%r23, [%r7 + %r15]
	.word 0xc0f009a0  ! 142: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf0222eec  ! 143: STW_I	stw	%r24, [%r8 + 0x0eec]
	.word 0xf42a22a3  ! 143: STB_I	stb	%r26, [%r8 + 0x02a3]
	.word 0xfe21aefc  ! 143: STW_I	stw	%r31, [%r6 + 0x0efc]
	.word 0xf0222c88  ! 143: STW_I	stw	%r24, [%r8 + 0x0c88]
	.word 0xfc31400f  ! 143: STH_R	sth	%r30, [%r5 + %r15]
	.word 0xf4216d10  ! 143: STW_I	stw	%r26, [%r5 + 0x0d10]
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 147: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_8:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_8), 16, 16),1,DC_DATA,23)
	.word 0xee110009  ! 149: LDUH_R	lduh	[%r4 + %r9], %r23
	.word 0xc0f009a0  ! 151: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb329b961  ! 153: SLL_I	sllx	%r6, 0x0021, %r25
	.word 0xc4f00c00  ! 155: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbe11ff4b  ! 157: OR_I	or 	%r7, 0xffffff4b, %r31
	.word 0xc0f00960  ! 159: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xae3a1f0c  ! 161: XNOR_R	xnor 	%r8, %r12, %r23
thr2_dc_err_9:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_9), 16, 16),1,DC_DATA,10)
	.word 0xee012514  ! 163: LDUW_I	lduw	[%r4 + 0x0514], %r23
	.word 0xc0f00960  ! 165: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 167: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 169: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbc09d90b  ! 171: AND_R	and 	%r7, %r11, %r30
	.word 0xc4f00c00  ! 173: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf011ad02  ! 174: LDUH_I	lduh	[%r6 + 0x0d02], %r24
	.word 0xc0f00960  ! 176: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 182: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 184: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe6ea2d47  ! 185: LDSTUBA_I	ldstuba	%r19, [%r8 + 0x0d47] %asi
	.word 0xc4f00c00  ! 187: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xec78c00b  ! 188: SWAP_R	swap	%r22, [%r3 + %r11]
	.word 0xc0f009a0  ! 190: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_10:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_10), 16, 16),1,DC_DATA,2)
	.word 0xf2016b02  ! 192: LDUW_I	lduw	[%r5 + 0x0b02], %r25
	.word 0xf221602f  ! 193: STW_I	stw	%r25, [%r5 + 0x002f]
	.word 0xc4f00c00  ! 195: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 197: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_11:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_11), 16, 16),1,DC_DATA,49)
	.word 0xf2494009  ! 199: LDSB_R	ldsb	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 201: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_12:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_12), 16, 16),1,DC_DATA,10)
	.word 0xf2414009  ! 203: LDSW_R	ldsw	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 205: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 207: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xb932000c  ! 208: SRL_R	srl 	%r8, %r12, %r28
	.word 0xa729800d  ! 208: SLL_R	sll 	%r6, %r13, %r19
	.word 0xc0f00960  ! 210: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 212: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 214: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbd3a3f41  ! 216: SRA_I	srax	%r8, 0x0001, %r30
	.word 0xc0f009a0  ! 218: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 220: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfc21800d  ! 221: STW_R	stw	%r30, [%r6 + %r13]
thr2_ic_err_2:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_2), 16, 16),1,IC_DATA,IR_NIR,26,4)
!Generating an illinst
	.word 0xbb391d0d  ! 223: SRAX_R	srax	%r4, %r13, %r29
	.word 0xc4f00c00  ! 225: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 227: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa6312bc4  ! 229: ORN_I	orn 	%r4, 0x0bc4, %r19
	.word 0xc4f00c00  ! 231: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 235: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_13:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_13), 16, 16),1,DC_DATA,37)
	.word 0xe800c009  ! 239: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc0f009a0  ! 241: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 243: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb731bf01  ! 247: SRLX_I	srlx	%r6, 0x0001, %r27
	.word 0xc4f00980  ! 249: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe6f9a0cc  ! 250: SWAPA_I	swapa	%r19, [%r6 + 0x00cc] %asi
thr2_dc_err_14:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_14), 16, 16),1,DC_DATA,5)
	.word 0xe60a0009  ! 252: LDUB_R	ldub	[%r8 + %r9], %r19
!Generating an illinst
	.word 0xa7391d0b  ! 254: SRA_R	srax	%r4, %r11, %r19
	.word 0xc4f00c00  ! 256: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf021000b  ! 257: STW_R	stw	%r24, [%r4 + %r11]
thr2_resum_intr_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xfa21000f  ! 258: STW_R	stw	%r29, [%r4 + %r15]
	.word 0xfc71c00f  ! 258: STX_R	stx	%r30, [%r7 + %r15]
	.word 0xf071c00e  ! 258: STX_R	stx	%r24, [%r7 + %r14]
	.word 0xf8292f35  ! 258: STB_I	stb	%r28, [%r4 + 0x0f35]
	.word 0xec322710  ! 258: STH_I	sth	%r22, [%r8 + 0x0710]
	.word 0xc0f009a0  ! 260: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_15:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_15), 16, 16),1,DC_DATA,25)
	.word 0xf801225d  ! 262: LDUW_I	lduw	[%r4 + 0x025d], %r28
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 266: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_16:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_16), 16, 16),1,DC_DATA,7)
	.word 0xf8110009  ! 268: LDUH_R	lduh	[%r4 + %r9], %r28
	.word 0xf221000f  ! 269: STW_R	stw	%r25, [%r4 + %r15]
	.word 0xf8316e98  ! 269: STH_I	sth	%r28, [%r5 + 0x0e98]
	.word 0xe422000e  ! 269: STW_R	stw	%r18, [%r8 + %r14]
	.word 0xe42a000f  ! 269: STB_R	stb	%r18, [%r8 + %r15]
!Generating an illinst
	.word 0xad323941  ! 271: SRL_I	srlx	%r8, 0x0001, %r22
	.word 0xc0f009a0  ! 273: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 275: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr2_dc_err_17:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_17), 16, 16),1,DC_DATA,50)
	.word 0xf4198009  ! 277: LDD_R	ldd	[%r6 + %r9], %r26
	.word 0xc4f00c00  ! 279: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 281: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_18:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_18), 16, 16),1,DC_DATA,7)
	.word 0xf4418009  ! 283: LDSW_R	ldsw	[%r6 + %r9], %r26
	.word 0xc0f009a0  ! 285: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 287: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 289: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr2_dc_err_19:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_19), 16, 16),1,DC_DATA,32)
	.word 0xf4418009  ! 291: LDSW_R	ldsw	[%r6 + %r9], %r26
!Generating an illinst
	.word 0xbe399f4d  ! 293: XNOR_R	xnor 	%r6, %r13, %r31
	.word 0xc0f00960  ! 295: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 297: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xa238db2c  ! 299: XNOR_R	xnor 	%r3, %r12, %r17
	.word 0xc0f009a0  ! 301: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf428ebd5  ! 302: STB_I	stb	%r26, [%r3 + 0x0bd5]
thr2_ic_err_3:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_3), 16, 16),1,IC_DATA,NIR,x,19)
	.word 0xc4f00980  ! 304: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 306: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf831ab36  ! 307: STH_I	sth	%r28, [%r6 + 0x0b36]
thr2_ic_err_4:
!ic err NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_4), 16, 16),1,IC_DATA,NIR,x,30)
thr2_dc_err_20:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_20), 16, 16),1,DC_DATA,43)
	.word 0xf048c009  ! 309: LDSB_R	ldsb	[%r3 + %r9], %r24
	.word 0xc4f00980  ! 311: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 313: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 315: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf322000b  ! 316: STF_R	st	%f25, [%r11, %r8]
	.word 0xc0f009a0  ! 318: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 320: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 322: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 326: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe271400d  ! 329: STX_R	stx	%r17, [%r5 + %r13]
	.word 0xc4f00980  ! 331: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 333: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 335: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 339: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_21:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_21), 16, 16),1,DC_DATA,45)
	.word 0xe2094009  ! 341: LDUB_R	ldub	[%r5 + %r9], %r17
thr2_dc_err_22:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_22), 16, 16),1,DC_DATA,71)
	.word 0xe2014009  ! 343: LDUW_R	lduw	[%r5 + %r9], %r17
	.word 0xf66a000d  ! 344: LDSTUB_R	ldstub	%r27, [%r8 + %r13]
	.word 0xc4f00c00  ! 346: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 348: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 352: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfe68c00d  ! 353: LDSTUB_R	ldstub	%r31, [%r3 + %r13]
thr2_dc_err_23:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_23), 16, 16),1,DC_DATA,48)
	.word 0xf401eb36  ! 355: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 357: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf829400f  ! 358: STB_R	stb	%r28, [%r5 + %r15]
thr2_resum_intr_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.thr2_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xc0f009a0  ! 360: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xae10d92b  ! 362: OR_R	or 	%r3, %r11, %r23
	.word 0xc0f00960  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_24:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_24), 16, 16),1,DC_DATA,35)
	.word 0xe4018009  ! 366: LDUW_R	lduw	[%r6 + %r9], %r18
	.word 0xf8a1500b  ! 367: STWA_R	stwa	%r28, [%r5 + %r11] 0x80
	.word 0xc0f00960  ! 369: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 371: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 373: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf429ebd7  ! 376: STB_I	stb	%r26, [%r7 + 0x0bd7]
	.word 0xc0f00960  ! 378: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 380: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 382: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 384: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 386: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 388: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 390: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_25:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_25), 16, 16),1,DC_DATA,43)
	.word 0xf401eb36  ! 392: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 394: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xab31f901  ! 396: SRLX_I	srlx	%r7, 0x0001, %r21
	.word 0xc4f00980  ! 398: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 400: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xa538dd4f  ! 402: SRAX_R	srax	%r3, %r15, %r18
	.word 0xf62a000f  ! 403: STB_R	stb	%r27, [%r8 + %r15]
thr2_ic_err_5:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,16,1)
	.word 0xf13a000c  ! 404: STDF_R	std	%f24, [%r12, %r8]
!Generating an illinst
	.word 0xb8098f4e  ! 406: AND_R	and 	%r6, %r14, %r28
	.word 0x81d9400c  ! 407: FLUSH_R	dis not found

	.word 0xc0f00960  ! 409: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_26:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_26), 16, 16),1,DC_DATA,60)
	.word 0xe611c009  ! 411: LDUH_R	lduh	[%r7 + %r9], %r19
	.word 0xc4f00980  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfa11ac94  ! 414: LDUH_I	lduh	[%r6 + 0x0c94], %r29
	.word 0xc0f009a0  ! 416: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 418: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 422: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_27:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_27), 16, 16),1,DC_DATA,58)
	.word 0xe800c009  ! 424: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc4f00980  ! 426: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb2094d2c  ! 428: AND_R	and 	%r5, %r12, %r25
thr2_dc_err_28:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_28), 16, 16),1,DC_DATA,70)
	.word 0xe808c009  ! 430: LDUB_R	ldub	[%r3 + %r9], %r20
	.word 0xfa28efbc  ! 431: STB_I	stb	%r29, [%r3 + 0x0fbc]
thr2_ic_err_6:
!ic err IR_NIR
!$EV error(2,expr(@VA(.MAIN.thr2_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,33,31)
	.word 0xc0f00960  ! 433: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbc31af70  ! 435: ORN_I	orn 	%r6, 0x0f70, %r30
	.word 0xc4f00980  ! 437: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xbd28d92d  ! 439: SLLX_R	sllx	%r3, %r13, %r30
thr2_dc_err_29:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_29), 16, 16),1,DC_DATA,56)
	.word 0xfe118009  ! 441: LDUH_R	lduh	[%r6 + %r9], %r31
thr2_dc_err_30:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_30), 16, 16),1,DC_DATA,19)
	.word 0xfe198009  ! 443: LDD_R	ldd	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 445: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbd295b0e  ! 447: SLLX_R	sllx	%r5, %r14, %r30
!Generating an illinst
	.word 0xb93a2d01  ! 449: SRA_I	sra 	%r8, 0x0001, %r28
	.word 0xea0a27e1  ! 450: LDUB_I	ldub	[%r8 + 0x07e1], %r21
!Generating an illinst
	.word 0xa938cb4c  ! 452: SRA_R	sra 	%r3, %r12, %r20
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 456: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_31:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_31), 16, 16),1,DC_DATA,54)
	.word 0xfc414009  ! 458: LDSW_R	ldsw	[%r5 + %r9], %r30
	.word 0xc4f00c00  ! 460: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbc293fd6  ! 462: ANDN_I	andn 	%r4, 0xffffffd6, %r30
!Generating an illinst
	.word 0xbc214b2f  ! 464: SUB_R	sub 	%r5, %r15, %r30
	.word 0xc4f00c00  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa6321b4f  ! 468: ORN_R	orn 	%r8, %r15, %r19
	.word 0xc4f00980  ! 470: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 472: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 474: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 476: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb03a39af  ! 478: XNOR_I	xnor 	%r8, 0xfffff9af, %r24
	.word 0xc0f00960  ! 480: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 482: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr2_dc_err_32:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_32), 16, 16),1,DC_DATA,3)
	.word 0xfc114009  ! 484: LDUH_R	lduh	[%r5 + %r9], %r30
thr2_dc_err_33:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_33), 16, 16),1,DC_DATA,14)
	.word 0xfc094009  ! 486: LDUB_R	ldub	[%r5 + %r9], %r30
	.word 0xc4f00980  ! 488: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa410df6d  ! 490: OR_R	or 	%r3, %r13, %r18
	.word 0xc0f009a0  ! 492: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 494: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 496: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 498: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr2_dc_err_34:
!$EV error(2,expr(@VA(.MAIN.thr2_dc_err_34), 16, 16),1,DC_DATA,49)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx  0x9948f052cd5082ea, %r16, %r17
	setx  0xdb80c7f7c93ffdf2, %r16, %r18
	setx  0xacdb8f3c397119d1, %r16, %r19
	setx  0x87365f98334c18fc, %r16, %r20
	setx  0xad67e53af3e383b1, %r16, %r21
	setx  0x151e1318cdf677bf, %r16, %r22
	setx  0x69caec5b846a42a9, %r16, %r23
	setx  0x0a2dbab1dfe86af1, %r16, %r24
	setx  0x6b562b047d58cff1, %r16, %r25
	setx  0x5a9566b8a6adf0d3, %r16, %r26
	setx  0x34be65a506d219f3, %r16, %r27
	setx  0x1e86cfcb990aa418, %r16, %r28
	setx  0x7308c389f90d5626, %r16, %r29
	setx  0xe125ace0a6d65c48, %r16, %r30
	setx  0x960b55cc7a138e95, %r16, %r31
	setx  0x0000000000000590, %r16, %r9
	setx  0x0000000000000300, %r16, %r10
	setx  0x0000000000000f70, %r16, %r11
	setx  0x0000000000000a40, %r16, %r12
	setx  0x00000000000002f0, %r16, %r13
	setx  0x0000000000000ae0, %r16, %r14
	setx  0x0000000000000e10, %r16, %r15
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
	.word 0x0e800001  ! 1: BVS	bvs  	<label_0x1>
thr1_dc_err_0:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_0), 16, 16),1,DC_DATA,57)
	.word 0xf21a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r25
	.word 0xfcf9e058  ! 4: SWAPA_I	swapa	%r30, [%r7 + 0x0058] %asi
	.word 0xc0f009a0  ! 6: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xe2a96eab  ! 7: STBA_I	stba	%r17, [%r5 + 0x0eab] %asi
	.word 0xf4fa100b  ! 8: SWAPA_R	swapa	%r26, [%r8 + %r11] 0x80
	.word 0xe631a276  ! 9: STH_I	sth	%r19, [%r6 + 0x0276]
thr1_ic_err_0:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,12,30)
!Generating an illinst
	.word 0xb4214d0c  ! 11: SUB_R	sub 	%r5, %r12, %r26
	.word 0xf0a9900b  ! 12: STBA_R	stba	%r24, [%r6 + %r11] 0x80
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 16: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 20: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 22: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_1:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_1), 16, 16),1,DC_DATA,46)
	.word 0xea012d5d  ! 24: LDUW_I	lduw	[%r4 + 0x0d5d], %r21
	.word 0xc0f009a0  ! 26: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 28: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 30: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 32: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb439bd2e  ! 34: XNOR_I	xnor 	%r6, 0xfffffd2e, %r26
!Generating an illinst
	.word 0xa530f901  ! 36: SRLX_I	srlx	%r3, 0x0001, %r18
	.word 0xee21000f  ! 37: STW_R	stw	%r23, [%r4 + %r15]
thr1_resum_intr_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 39: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xee31a2d0  ! 40: STH_I	sth	%r23, [%r6 + 0x02d0]
thr1_resum_intr_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xec21400d  ! 41: STW_R	stw	%r22, [%r5 + %r13]
	.word 0xfe21c00e  ! 41: STW_R	stw	%r31, [%r7 + %r14]
	.word 0xee7124d0  ! 41: STX_I	stx	%r23, [%r4 + 0x04d0]
	.word 0xfa71c00b  ! 41: STX_R	stx	%r29, [%r7 + %r11]
	.word 0xf631a254  ! 41: STH_I	sth	%r27, [%r6 + 0x0254]
	.word 0xf871a700  ! 41: STX_I	stx	%r28, [%r6 + 0x0700]
	.word 0xc0f009a0  ! 43: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa930fd61  ! 45: SRLX_I	srlx	%r3, 0x0021, %r20
	.word 0xb3322001  ! 46: SRL_I	srl 	%r8, 0x0001, %r25
	.word 0xb63165ba  ! 46: ORN_I	orn 	%r5, 0x05ba, %r27
thr1_dc_err_2:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_2), 16, 16),1,DC_DATA,39)
	.word 0xf40a0009  ! 48: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xf82a2c26  ! 49: STB_I	stb	%r28, [%r8 + 0x0c26]
thr1_ic_err_1:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,5,32)
	.word 0x8143e040  ! 50: MEMBAR	membar	#Sync 
thr1_dc_err_3:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_3), 16, 16),1,DC_DATA,1)
	.word 0xea190009  ! 52: LDD_R	ldd	[%r4 + %r9], %r21
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xea412090  ! 55: LDSW_I	ldsw	[%r4 + 0x0090], %r21
	.word 0xc0f009a0  ! 57: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_4:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_4), 16, 16),1,DC_DATA,50)
	.word 0xf848c009  ! 61: LDSB_R	ldsb	[%r3 + %r9], %r28
	.word 0xc4f00980  ! 63: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xef392ed0  ! 64: STDF_I	std	%f23, [0x0ed0, %r4]
!Generating an illinst
	.word 0xb6322da3  ! 66: ORN_I	orn 	%r8, 0x0da3, %r27
	.word 0xc0f00960  ! 68: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 70: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 72: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 76: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xee72000d  ! 77: STX_R	stx	%r23, [%r8 + %r13]
thr1_irf_ce_0:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_0), 16, 16), 1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 79: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xba217b4d  ! 81: SUB_I	sub 	%r5, 0xfffffb4d, %r29
	.word 0xc0f009a0  ! 83: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 85: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xea28c00b  ! 86: STB_R	stb	%r21, [%r3 + %r11]
thr1_irf_ce_1:
!$EV error(1,expr(@VA(.MAIN.thr1_irf_ce_1), 16, 16), 1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc0f009a0  ! 88: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa729df4e  ! 90: SLL_R	sllx	%r7, %r14, %r19
	.word 0xc4f00c00  ! 92: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfa2228b4  ! 93: STW_I	stw	%r29, [%r8 + 0x08b4]
	.word 0xe4316b32  ! 93: STH_I	sth	%r18, [%r5 + 0x0b32]
	.word 0xf8216940  ! 93: STW_I	stw	%r28, [%r5 + 0x0940]
	.word 0xf4292470  ! 93: STB_I	stb	%r26, [%r4 + 0x0470]
	.word 0xfa222f50  ! 93: STW_I	stw	%r29, [%r8 + 0x0f50]
	.word 0xf821c00f  ! 93: STW_R	stw	%r28, [%r7 + %r15]
	.word 0xc0f00960  ! 95: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_5:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_5), 16, 16),1,DC_DATA,24)
	.word 0xe411c009  ! 97: LDUH_R	lduh	[%r7 + %r9], %r18
	.word 0xc0f00960  ! 99: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xee21e3a0  ! 100: STW_I	stw	%r23, [%r7 + 0x03a0]
	.word 0xf4216bb4  ! 100: STW_I	stw	%r26, [%r5 + 0x0bb4]
	.word 0xec3121a4  ! 100: STH_I	sth	%r22, [%r4 + 0x01a4]
	.word 0xe82125d4  ! 100: STW_I	stw	%r20, [%r4 + 0x05d4]
	.word 0xee72000c  ! 100: STX_R	stx	%r23, [%r8 + %r12]
	.word 0xf4722868  ! 100: STX_I	stx	%r26, [%r8 + 0x0868]
	.word 0xfa31e920  ! 100: STH_I	sth	%r29, [%r7 + 0x0920]
	.word 0xc0f009a0  ! 102: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xab30fb41  ! 104: SRLX_I	srlx	%r3, 0x0001, %r21
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 108: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa728fb21  ! 110: SLL_I	sllx	%r3, 0x0021, %r19
	.word 0xc0f009a0  ! 112: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 114: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 116: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 118: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0x81d9800c  ! 119: FLUSH_R	dis not found

	.word 0xeef9500d  ! 120: SWAPA_R	swapa	%r23, [%r5 + %r13] 0x80
	.word 0xc4f00980  ! 122: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 124: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 126: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xed38e4b0  ! 127: STDF_I	std	%f22, [0x04b0, %r3]
	.word 0xc4f00c00  ! 129: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb729bd41  ! 131: SLLX_I	sllx	%r6, 0x0001, %r27
	.word 0xc4f00980  ! 133: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 135: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_6:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_6), 16, 16),1,DC_DATA,44)
	.word 0xfe10c009  ! 137: LDUH_R	lduh	[%r3 + %r9], %r31
thr1_dc_err_7:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_7), 16, 16),1,DC_DATA,43)
	.word 0xfe08c009  ! 139: LDUB_R	ldub	[%r3 + %r9], %r31
	.word 0xfe292847  ! 140: STB_I	stb	%r31, [%r4 + 0x0847]
	.word 0xe671400b  ! 140: STX_R	stx	%r19, [%r5 + %r11]
	.word 0xfe31c00c  ! 140: STH_R	sth	%r31, [%r7 + %r12]
	.word 0xc0f009a0  ! 142: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xe22225b8  ! 143: STW_I	stw	%r17, [%r8 + 0x05b8]
	.word 0xe428e325  ! 143: STB_I	stb	%r18, [%r3 + 0x0325]
	.word 0xfc20e6e4  ! 143: STW_I	stw	%r30, [%r3 + 0x06e4]
	.word 0xfe21e0dc  ! 143: STW_I	stw	%r31, [%r7 + 0x00dc]
	.word 0xf631000f  ! 143: STH_R	sth	%r27, [%r4 + %r15]
	.word 0xea21e7d0  ! 143: STW_I	stw	%r21, [%r7 + 0x07d0]
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 147: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_8:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_8), 16, 16),1,DC_DATA,23)
	.word 0xee110009  ! 149: LDUH_R	lduh	[%r4 + %r9], %r23
	.word 0xc0f009a0  ! 151: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa929eb01  ! 153: SLL_I	sll 	%r7, 0x0001, %r20
	.word 0xc4f00c00  ! 155: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xae113f1f  ! 157: OR_I	or 	%r4, 0xffffff1f, %r23
	.word 0xc0f00960  ! 159: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xba390f6f  ! 161: XNOR_R	xnor 	%r4, %r15, %r29
thr1_dc_err_9:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_9), 16, 16),1,DC_DATA,10)
	.word 0xee012514  ! 163: LDUW_I	lduw	[%r4 + 0x0514], %r23
	.word 0xc0f00960  ! 165: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 167: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 169: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa408df6f  ! 171: AND_R	and 	%r3, %r15, %r18
	.word 0xc4f00c00  ! 173: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xee1167d2  ! 174: LDUH_I	lduh	[%r5 + 0x07d2], %r23
	.word 0xc0f00960  ! 176: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 182: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 184: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf6e8e8ae  ! 185: LDSTUBA_I	ldstuba	%r27, [%r3 + 0x08ae] %asi
	.word 0xc4f00c00  ! 187: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe279400b  ! 188: SWAP_R	swap	%r17, [%r5 + %r11]
	.word 0xc0f009a0  ! 190: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_10:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_10), 16, 16),1,DC_DATA,2)
	.word 0xf2016b02  ! 192: LDUW_I	lduw	[%r5 + 0x0b02], %r25
	.word 0xf2216589  ! 193: STW_I	stw	%r25, [%r5 + 0x0589]
	.word 0xc4f00c00  ! 195: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 197: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_11:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_11), 16, 16),1,DC_DATA,49)
	.word 0xf2494009  ! 199: LDSB_R	ldsb	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 201: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_12:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_12), 16, 16),1,DC_DATA,10)
	.word 0xf2414009  ! 203: LDSW_R	ldsw	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 205: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 207: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xbf30c00f  ! 208: SRL_R	srl 	%r3, %r15, %r31
	.word 0xa328c00e  ! 208: SLL_R	sll 	%r3, %r14, %r17
	.word 0xc0f00960  ! 210: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 212: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 214: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb939ff01  ! 216: SRA_I	srax	%r7, 0x0001, %r28
	.word 0xc0f009a0  ! 218: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 220: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xec20c00e  ! 221: STW_R	stw	%r22, [%r3 + %r14]
thr1_ic_err_2:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_2), 16, 16),1,IC_DATA,IR_NIR,26,4)
!Generating an illinst
	.word 0xa939d96e  ! 223: SRAX_R	srax	%r7, %r14, %r20
	.word 0xc4f00c00  ! 225: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 227: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb6323f7a  ! 229: ORN_I	orn 	%r8, 0xffffff7a, %r27
	.word 0xc4f00c00  ! 231: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 235: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_13:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_13), 16, 16),1,DC_DATA,37)
	.word 0xe800c009  ! 239: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc0f009a0  ! 241: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 243: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xa931fb01  ! 247: SRLX_I	srlx	%r7, 0x0001, %r20
	.word 0xc4f00980  ! 249: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfef9ac70  ! 250: SWAPA_I	swapa	%r31, [%r6 + 0x0c70] %asi
thr1_dc_err_14:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_14), 16, 16),1,DC_DATA,5)
	.word 0xe60a0009  ! 252: LDUB_R	ldub	[%r8 + %r9], %r19
!Generating an illinst
	.word 0xa339d94f  ! 254: SRA_R	srax	%r7, %r15, %r17
	.word 0xc4f00c00  ! 256: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfe20c00f  ! 257: STW_R	stw	%r31, [%r3 + %r15]
thr1_resum_intr_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xe621800c  ! 258: STW_R	stw	%r19, [%r6 + %r12]
	.word 0xf471000f  ! 258: STX_R	stx	%r26, [%r4 + %r15]
	.word 0xf271800d  ! 258: STX_R	stx	%r25, [%r6 + %r13]
	.word 0xf428ea34  ! 258: STB_I	stb	%r26, [%r3 + 0x0a34]
	.word 0xee31e152  ! 258: STH_I	sth	%r23, [%r7 + 0x0152]
	.word 0xc0f009a0  ! 260: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_15:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_15), 16, 16),1,DC_DATA,25)
	.word 0xf801225d  ! 262: LDUW_I	lduw	[%r4 + 0x025d], %r28
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 266: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_16:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_16), 16, 16),1,DC_DATA,7)
	.word 0xf8110009  ! 268: LDUH_R	lduh	[%r4 + %r9], %r28
	.word 0xea21800e  ! 269: STW_R	stw	%r21, [%r6 + %r14]
	.word 0xe430eb72  ! 269: STH_I	sth	%r18, [%r3 + 0x0b72]
	.word 0xee22000e  ! 269: STW_R	stw	%r23, [%r8 + %r14]
	.word 0xe629000e  ! 269: STB_R	stb	%r19, [%r4 + %r14]
!Generating an illinst
	.word 0xaf31bf21  ! 271: SRL_I	srlx	%r6, 0x0021, %r23
	.word 0xc0f009a0  ! 273: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 275: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr1_dc_err_17:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_17), 16, 16),1,DC_DATA,50)
	.word 0xf4198009  ! 277: LDD_R	ldd	[%r6 + %r9], %r26
	.word 0xc4f00c00  ! 279: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 281: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_18:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_18), 16, 16),1,DC_DATA,7)
	.word 0xf4418009  ! 283: LDSW_R	ldsw	[%r6 + %r9], %r26
	.word 0xc0f009a0  ! 285: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 287: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 289: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr1_dc_err_19:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_19), 16, 16),1,DC_DATA,32)
	.word 0xf4418009  ! 291: LDSW_R	ldsw	[%r6 + %r9], %r26
!Generating an illinst
	.word 0xbe39cb4d  ! 293: XNOR_R	xnor 	%r7, %r13, %r31
	.word 0xc0f00960  ! 295: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 297: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbc38cb0f  ! 299: XNOR_R	xnor 	%r3, %r15, %r30
	.word 0xc0f009a0  ! 301: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xe429a0cc  ! 302: STB_I	stb	%r18, [%r6 + 0x00cc]
thr1_ic_err_3:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_3), 16, 16),1,IC_DATA,NIR,x,19)
	.word 0xc4f00980  ! 304: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 306: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xec312d8a  ! 307: STH_I	sth	%r22, [%r4 + 0x0d8a]
thr1_ic_err_4:
!ic err NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_4), 16, 16),1,IC_DATA,NIR,x,30)
thr1_dc_err_20:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_20), 16, 16),1,DC_DATA,43)
	.word 0xf048c009  ! 309: LDSB_R	ldsb	[%r3 + %r9], %r24
	.word 0xc4f00980  ! 311: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 313: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 315: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe520c00b  ! 316: STF_R	st	%f18, [%r11, %r3]
	.word 0xc0f009a0  ! 318: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 320: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 322: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 326: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe271400d  ! 329: STX_R	stx	%r17, [%r5 + %r13]
	.word 0xc4f00980  ! 331: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 333: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 335: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 339: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_21:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_21), 16, 16),1,DC_DATA,45)
	.word 0xe2094009  ! 341: LDUB_R	ldub	[%r5 + %r9], %r17
thr1_dc_err_22:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_22), 16, 16),1,DC_DATA,71)
	.word 0xe2014009  ! 343: LDUW_R	lduw	[%r5 + %r9], %r17
	.word 0xf868c00b  ! 344: LDSTUB_R	ldstub	%r28, [%r3 + %r11]
	.word 0xc4f00c00  ! 346: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 348: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 352: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfa69000d  ! 353: LDSTUB_R	ldstub	%r29, [%r4 + %r13]
thr1_dc_err_23:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_23), 16, 16),1,DC_DATA,48)
	.word 0xf401eb36  ! 355: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 357: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfe29800f  ! 358: STB_R	stb	%r31, [%r6 + %r15]
thr1_resum_intr_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.thr1_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xc0f009a0  ! 360: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb410cf4d  ! 362: OR_R	or 	%r3, %r13, %r26
	.word 0xc0f00960  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_24:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_24), 16, 16),1,DC_DATA,35)
	.word 0xe4018009  ! 366: LDUW_R	lduw	[%r6 + %r9], %r18
	.word 0xeea1500d  ! 367: STWA_R	stwa	%r23, [%r5 + %r13] 0x80
	.word 0xc0f00960  ! 369: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 371: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 373: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf429e273  ! 376: STB_I	stb	%r26, [%r7 + 0x0273]
	.word 0xc0f00960  ! 378: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 380: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 382: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 384: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 386: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 388: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 390: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_25:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_25), 16, 16),1,DC_DATA,43)
	.word 0xf401eb36  ! 392: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 394: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xaf317f41  ! 396: SRLX_I	srlx	%r5, 0x0001, %r23
	.word 0xc4f00980  ! 398: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 400: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb33a1f4e  ! 402: SRAX_R	srax	%r8, %r14, %r25
	.word 0xf629800b  ! 403: STB_R	stb	%r27, [%r6 + %r11]
thr1_ic_err_5:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,16,1)
	.word 0xf13a000c  ! 404: STDF_R	std	%f24, [%r12, %r8]
!Generating an illinst
	.word 0xa609896e  ! 406: AND_R	and 	%r6, %r14, %r19
	.word 0x81d9400b  ! 407: FLUSH_R	dis not found

	.word 0xc0f00960  ! 409: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_26:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_26), 16, 16),1,DC_DATA,60)
	.word 0xe611c009  ! 411: LDUH_R	lduh	[%r7 + %r9], %r19
	.word 0xc4f00980  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xee11ef7a  ! 414: LDUH_I	lduh	[%r7 + 0x0f7a], %r23
	.word 0xc0f009a0  ! 416: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 418: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 422: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_27:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_27), 16, 16),1,DC_DATA,58)
	.word 0xe800c009  ! 424: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc4f00980  ! 426: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa60a1f6b  ! 428: AND_R	and 	%r8, %r11, %r19
thr1_dc_err_28:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_28), 16, 16),1,DC_DATA,70)
	.word 0xe808c009  ! 430: LDUB_R	ldub	[%r3 + %r9], %r20
	.word 0xf8296a95  ! 431: STB_I	stb	%r28, [%r5 + 0x0a95]
thr1_ic_err_6:
!ic err IR_NIR
!$EV error(1,expr(@VA(.MAIN.thr1_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,33,31)
	.word 0xc0f00960  ! 433: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb8313d2b  ! 435: ORN_I	orn 	%r4, 0xfffffd2b, %r28
	.word 0xc4f00980  ! 437: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb129df0b  ! 439: SLLX_R	sllx	%r7, %r11, %r24
thr1_dc_err_29:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_29), 16, 16),1,DC_DATA,56)
	.word 0xfe118009  ! 441: LDUH_R	lduh	[%r6 + %r9], %r31
thr1_dc_err_30:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_30), 16, 16),1,DC_DATA,19)
	.word 0xfe198009  ! 443: LDD_R	ldd	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 445: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbb29990f  ! 447: SLLX_R	sllx	%r6, %r15, %r29
!Generating an illinst
	.word 0xa9392d21  ! 449: SRA_I	sra 	%r4, 0x0001, %r20
	.word 0xf409613d  ! 450: LDUB_I	ldub	[%r5 + 0x013d], %r26
!Generating an illinst
	.word 0xbd390f0b  ! 452: SRA_R	sra 	%r4, %r11, %r30
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 456: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_31:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_31), 16, 16),1,DC_DATA,54)
	.word 0xfc414009  ! 458: LDSW_R	ldsw	[%r5 + %r9], %r30
	.word 0xc4f00c00  ! 460: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb629bbb9  ! 462: ANDN_I	andn 	%r6, 0xfffffbb9, %r27
!Generating an illinst
	.word 0xb021cf4f  ! 464: SUB_R	sub 	%r7, %r15, %r24
	.word 0xc4f00c00  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xba30df4e  ! 468: ORN_R	orn 	%r3, %r14, %r29
	.word 0xc4f00980  ! 470: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 472: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 474: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 476: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xac39ed38  ! 478: XNOR_I	xnor 	%r7, 0x0d38, %r22
	.word 0xc0f00960  ! 480: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 482: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr1_dc_err_32:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_32), 16, 16),1,DC_DATA,3)
	.word 0xfc114009  ! 484: LDUH_R	lduh	[%r5 + %r9], %r30
thr1_dc_err_33:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_33), 16, 16),1,DC_DATA,14)
	.word 0xfc094009  ! 486: LDUB_R	ldub	[%r5 + %r9], %r30
	.word 0xc4f00980  ! 488: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa412094b  ! 490: OR_R	or 	%r8, %r11, %r18
	.word 0xc0f009a0  ! 492: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 494: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 496: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 498: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr1_dc_err_34:
!$EV error(1,expr(@VA(.MAIN.thr1_dc_err_34), 16, 16),1,DC_DATA,49)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0xcb93cb37e5b0f477, %r16, %r17
	setx  0xcdd4eef585dee997, %r16, %r18
	setx  0xd4fbe8609d95ddfa, %r16, %r19
	setx  0x6b4a68736952329e, %r16, %r20
	setx  0x4c674227cf9fda54, %r16, %r21
	setx  0x05801906ee94c881, %r16, %r22
	setx  0x3ce0abe0a5e3d89d, %r16, %r23
	setx  0xf84e724299aff2b5, %r16, %r24
	setx  0x46ad75a9e506ce10, %r16, %r25
	setx  0xda6b57cac4a7ce03, %r16, %r26
	setx  0xb99e79d58125773a, %r16, %r27
	setx  0x96556038d16b896b, %r16, %r28
	setx  0x29d3c88ac5eabafa, %r16, %r29
	setx  0xe476084267ff8a8f, %r16, %r30
	setx  0x9185d189420cd35b, %r16, %r31
	setx  0x0000000000000010, %r16, %r9
	setx  0x0000000000000bc0, %r16, %r10
	setx  0x00000000000003c0, %r16, %r11
	setx  0x0000000000000ee0, %r16, %r12
	setx  0x0000000000000150, %r16, %r13
	setx  0x0000000000000d00, %r16, %r14
	setx  0x00000000000004c0, %r16, %r15
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
	.word 0x2e800003  ! 1: BVS	bvs,a	<label_0x3>
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,57)
	.word 0xf21a0009  ! 3: LDD_R	ldd	[%r8 + %r9], %r25
	.word 0xe6f92344  ! 4: SWAPA_I	swapa	%r19, [%r4 + 0x0344] %asi
	.word 0xc0f009a0  ! 6: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf4a968ac  ! 7: STBA_I	stba	%r26, [%r5 + 0x08ac] %asi
	.word 0xfaf9900e  ! 8: SWAPA_R	swapa	%r29, [%r6 + %r14] 0x80
	.word 0xf631ed5c  ! 9: STH_I	sth	%r27, [%r7 + 0x0d5c]
thr0_ic_err_0:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR_NIR,12,30)
!Generating an illinst
	.word 0xae20cf2e  ! 11: SUB_R	sub 	%r3, %r14, %r23
	.word 0xeaa9100b  ! 12: STBA_R	stba	%r21, [%r4 + %r11] 0x80
	.word 0xc0f00960  ! 14: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 16: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 18: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 20: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 22: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),1,DC_DATA,46)
	.word 0xea012d5d  ! 24: LDUW_I	lduw	[%r4 + 0x0d5d], %r21
	.word 0xc0f009a0  ! 26: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 28: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 30: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 32: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb439fb7a  ! 34: XNOR_I	xnor 	%r7, 0xfffffb7a, %r26
!Generating an illinst
	.word 0xa330fd61  ! 36: SRLX_I	srlx	%r3, 0x0021, %r17
	.word 0xe421c00e  ! 37: STW_R	stw	%r18, [%r7 + %r14]
thr0_resum_intr_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_0), 16, 16)) -> intp(1, 3, 1)
	.word 0xc4f00c00  ! 39: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfc30e86e  ! 40: STH_I	sth	%r30, [%r3 + 0x086e]
thr0_resum_intr_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_1), 16, 16)) -> intp(1, 3, 1)
	.word 0xe821c00b  ! 41: STW_R	stw	%r20, [%r7 + %r11]
	.word 0xec21c00f  ! 41: STW_R	stw	%r22, [%r7 + %r15]
	.word 0xf4716048  ! 41: STX_I	stx	%r26, [%r5 + 0x0048]
	.word 0xfa71c00d  ! 41: STX_R	stx	%r29, [%r7 + %r13]
	.word 0xee316634  ! 41: STH_I	sth	%r23, [%r5 + 0x0634]
	.word 0xfc712a20  ! 41: STX_I	stx	%r30, [%r4 + 0x0a20]
	.word 0xc0f009a0  ! 43: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xab313921  ! 45: SRLX_I	srlx	%r4, 0x0021, %r21
	.word 0xbb31e001  ! 46: SRL_I	srl 	%r7, 0x0001, %r29
	.word 0xb432218d  ! 46: ORN_I	orn 	%r8, 0x018d, %r26
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),1,DC_DATA,39)
	.word 0xf40a0009  ! 48: LDUB_R	ldub	[%r8 + %r9], %r26
	.word 0xea29227a  ! 49: STB_I	stb	%r21, [%r4 + 0x027a]
thr0_ic_err_1:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR_NIR,5,32)
	.word 0x8143e038  ! 50: MEMBAR	membar	#StoreStore | #Lookaside | #MemIssue 
thr0_dc_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_3), 16, 16),1,DC_DATA,1)
	.word 0xea190009  ! 52: LDD_R	ldd	[%r4 + %r9], %r21
	.word 0xc4f00c00  ! 54: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf840e258  ! 55: LDSW_I	ldsw	[%r3 + 0x0258], %r28
	.word 0xc0f009a0  ! 57: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 59: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_4), 16, 16),1,DC_DATA,50)
	.word 0xf848c009  ! 61: LDSB_R	ldsb	[%r3 + %r9], %r28
	.word 0xc4f00980  ! 63: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xfb396e28  ! 64: STDF_I	std	%f29, [0x0e28, %r5]
!Generating an illinst
	.word 0xba30efe7  ! 66: ORN_I	orn 	%r3, 0x0fe7, %r29
	.word 0xc0f00960  ! 68: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 70: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 72: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 74: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 76: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf472000e  ! 77: STX_R	stx	%r26, [%r8 + %r14]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16), 1,IRF,ce,39,x, x,x,x, x,x,x)
	.word 0xc4f00980  ! 79: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb021eff2  ! 81: SUB_I	sub 	%r7, 0x0ff2, %r24
	.word 0xc0f009a0  ! 83: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 85: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xee28c00c  ! 86: STB_R	stb	%r23, [%r3 + %r12]
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16), 1,IRF,ce,2,x, x,x,x, x,x,x)
	.word 0xc0f009a0  ! 88: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbb29990d  ! 90: SLL_R	sllx	%r6, %r13, %r29
	.word 0xc4f00c00  ! 92: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xee21e104  ! 93: STW_I	stw	%r23, [%r7 + 0x0104]
	.word 0xe431e25a  ! 93: STH_I	sth	%r18, [%r7 + 0x025a]
	.word 0xf021a998  ! 93: STW_I	stw	%r24, [%r6 + 0x0998]
	.word 0xf829a955  ! 93: STB_I	stb	%r28, [%r6 + 0x0955]
	.word 0xfa21e078  ! 93: STW_I	stw	%r29, [%r7 + 0x0078]
	.word 0xe421c00e  ! 93: STW_R	stw	%r18, [%r7 + %r14]
	.word 0xc0f00960  ! 95: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_5), 16, 16),1,DC_DATA,24)
	.word 0xe411c009  ! 97: LDUH_R	lduh	[%r7 + %r9], %r18
	.word 0xc0f00960  ! 99: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xee21e8e8  ! 100: STW_I	stw	%r23, [%r7 + 0x08e8]
	.word 0xea20ead4  ! 100: STW_I	stw	%r21, [%r3 + 0x0ad4]
	.word 0xfe31662e  ! 100: STH_I	sth	%r31, [%r5 + 0x062e]
	.word 0xf821ad7c  ! 100: STW_I	stw	%r28, [%r6 + 0x0d7c]
	.word 0xf870c00f  ! 100: STX_R	stx	%r28, [%r3 + %r15]
	.word 0xf4722108  ! 100: STX_I	stx	%r26, [%r8 + 0x0108]
	.word 0xfc31af34  ! 100: STH_I	sth	%r30, [%r6 + 0x0f34]
	.word 0xc0f009a0  ! 102: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb5323b21  ! 104: SRLX_I	srlx	%r8, 0x0021, %r26
	.word 0xc4f00c00  ! 106: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 108: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb7293921  ! 110: SLL_I	sllx	%r4, 0x0021, %r27
	.word 0xc0f009a0  ! 112: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 114: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 116: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 118: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0x81d9c00f  ! 119: FLUSH_R	dis not found

	.word 0xe2f9500e  ! 120: SWAPA_R	swapa	%r17, [%r5 + %r14] 0x80
	.word 0xc4f00980  ! 122: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 124: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 126: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xff38e728  ! 127: STDF_I	std	%f31, [0x0728, %r3]
	.word 0xc4f00c00  ! 129: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbf29bf61  ! 131: SLLX_I	sllx	%r6, 0x0021, %r31
	.word 0xc4f00980  ! 133: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 135: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_6), 16, 16),1,DC_DATA,44)
	.word 0xfe10c009  ! 137: LDUH_R	lduh	[%r3 + %r9], %r31
thr0_dc_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_7), 16, 16),1,DC_DATA,43)
	.word 0xfe08c009  ! 139: LDUB_R	ldub	[%r3 + %r9], %r31
	.word 0xe429eae1  ! 140: STB_I	stb	%r18, [%r7 + 0x0ae1]
	.word 0xea72000c  ! 140: STX_R	stx	%r21, [%r8 + %r12]
	.word 0xf631c00e  ! 140: STH_R	sth	%r27, [%r7 + %r14]
	.word 0xc0f009a0  ! 142: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf6216ee0  ! 143: STW_I	stw	%r27, [%r5 + 0x0ee0]
	.word 0xe428ede3  ! 143: STB_I	stb	%r18, [%r3 + 0x0de3]
	.word 0xee216b6c  ! 143: STW_I	stw	%r23, [%r5 + 0x0b6c]
	.word 0xea21a5a8  ! 143: STW_I	stw	%r21, [%r6 + 0x05a8]
	.word 0xfc31000e  ! 143: STH_R	sth	%r30, [%r4 + %r14]
	.word 0xee212514  ! 143: STW_I	stw	%r23, [%r4 + 0x0514]
	.word 0xc4f00980  ! 145: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 147: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_8), 16, 16),1,DC_DATA,23)
	.word 0xee110009  ! 149: LDUH_R	lduh	[%r4 + %r9], %r23
	.word 0xc0f009a0  ! 151: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xa329bd01  ! 153: SLL_I	sllx	%r6, 0x0001, %r17
	.word 0xc4f00c00  ! 155: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa2123bfd  ! 157: OR_I	or 	%r8, 0xfffffbfd, %r17
	.word 0xc0f00960  ! 159: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb838d94e  ! 161: XNOR_R	xnor 	%r3, %r14, %r28
thr0_dc_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_9), 16, 16),1,DC_DATA,10)
	.word 0xee012514  ! 163: LDUW_I	lduw	[%r4 + 0x0514], %r23
	.word 0xc0f00960  ! 165: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 167: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 169: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xb60a0d2e  ! 171: AND_R	and 	%r8, %r14, %r27
	.word 0xc4f00c00  ! 173: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf411a158  ! 174: LDUH_I	lduh	[%r6 + 0x0158], %r26
	.word 0xc0f00960  ! 176: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 178: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 180: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 182: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 184: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf6ea2b02  ! 185: LDSTUBA_I	ldstuba	%r27, [%r8 + 0x0b02] %asi
	.word 0xc4f00c00  ! 187: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xf279400f  ! 188: SWAP_R	swap	%r25, [%r5 + %r15]
	.word 0xc0f009a0  ! 190: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_10:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_10), 16, 16),1,DC_DATA,2)
	.word 0xf2016b02  ! 192: LDUW_I	lduw	[%r5 + 0x0b02], %r25
	.word 0xf221656b  ! 193: STW_I	stw	%r25, [%r5 + 0x056b]
	.word 0xc4f00c00  ! 195: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 197: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_11:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_11), 16, 16),1,DC_DATA,49)
	.word 0xf2494009  ! 199: LDSB_R	ldsb	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 201: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_12:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_12), 16, 16),1,DC_DATA,10)
	.word 0xf2414009  ! 203: LDSW_R	ldsw	[%r5 + %r9], %r25
	.word 0xc0f00960  ! 205: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 207: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xa331800b  ! 208: SRL_R	srl 	%r6, %r11, %r17
	.word 0xb728c00f  ! 208: SLL_R	sll 	%r3, %r15, %r27
	.word 0xc0f00960  ! 210: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 212: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 214: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbb39af41  ! 216: SRA_I	sra 	%r6, 0x0001, %r29
	.word 0xc0f009a0  ! 218: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 220: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe820c00e  ! 221: STW_R	stw	%r20, [%r3 + %r14]
thr0_ic_err_2:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR_NIR,26,4)
!Generating an illinst
	.word 0xa3395b2f  ! 223: SRAX_R	srax	%r5, %r15, %r17
	.word 0xc4f00c00  ! 225: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 227: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbc313f75  ! 229: ORN_I	orn 	%r4, 0xffffff75, %r30
	.word 0xc4f00c00  ! 231: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 233: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 235: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 237: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_13:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_13), 16, 16),1,DC_DATA,37)
	.word 0xe800c009  ! 239: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc0f009a0  ! 241: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 243: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 245: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb3313901  ! 247: SRLX_I	srlx	%r4, 0x0001, %r25
	.word 0xc4f00980  ! 249: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe6fa2694  ! 250: SWAPA_I	swapa	%r19, [%r8 + 0x0694] %asi
thr0_dc_err_14:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_14), 16, 16),1,DC_DATA,5)
	.word 0xe60a0009  ! 252: LDUB_R	ldub	[%r8 + %r9], %r19
!Generating an illinst
	.word 0xb1394f4f  ! 254: SRA_R	sra 	%r5, %r15, %r24
	.word 0xc4f00c00  ! 256: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xfc21000b  ! 257: STW_R	stw	%r30, [%r4 + %r11]
thr0_resum_intr_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_2), 16, 16)) -> intp(1, 3, 1)
	.word 0xe421800e  ! 258: STW_R	stw	%r18, [%r6 + %r14]
	.word 0xe470c00d  ! 258: STX_R	stx	%r18, [%r3 + %r13]
	.word 0xfa72000d  ! 258: STX_R	stx	%r29, [%r8 + %r13]
	.word 0xe228e342  ! 258: STB_I	stb	%r17, [%r3 + 0x0342]
	.word 0xf831225c  ! 258: STH_I	sth	%r28, [%r4 + 0x025c]
	.word 0xc0f009a0  ! 260: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_15:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_15), 16, 16),1,DC_DATA,25)
	.word 0xf801225d  ! 262: LDUW_I	lduw	[%r4 + 0x025d], %r28
	.word 0xc0f009a0  ! 264: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 266: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_16:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_16), 16, 16),1,DC_DATA,7)
	.word 0xf8110009  ! 268: LDUH_R	lduh	[%r4 + %r9], %r28
	.word 0xe821000b  ! 269: STW_R	stw	%r20, [%r4 + %r11]
	.word 0xe8316dba  ! 269: STH_I	sth	%r20, [%r5 + 0x0dba]
	.word 0xec21c00f  ! 269: STW_R	stw	%r22, [%r7 + %r15]
	.word 0xf429800d  ! 269: STB_R	stb	%r26, [%r6 + %r13]
!Generating an illinst
	.word 0xad31ad01  ! 271: SRL_I	srl 	%r6, 0x0001, %r22
	.word 0xc0f009a0  ! 273: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 275: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
thr0_dc_err_17:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_17), 16, 16),1,DC_DATA,50)
	.word 0xf4198009  ! 277: LDD_R	ldd	[%r6 + %r9], %r26
	.word 0xc4f00c00  ! 279: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f009a0  ! 281: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_18:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_18), 16, 16),1,DC_DATA,7)
	.word 0xf4418009  ! 283: LDSW_R	ldsw	[%r6 + %r9], %r26
	.word 0xc0f009a0  ! 285: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 287: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 289: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
thr0_dc_err_19:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_19), 16, 16),1,DC_DATA,32)
	.word 0xf4418009  ! 291: LDSW_R	ldsw	[%r6 + %r9], %r26
!Generating an illinst
	.word 0xac39194d  ! 293: XNOR_R	xnor 	%r4, %r13, %r22
	.word 0xc0f00960  ! 295: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 297: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb6390d4e  ! 299: XNOR_R	xnor 	%r4, %r14, %r27
	.word 0xc0f009a0  ! 301: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xfa29ab65  ! 302: STB_I	stb	%r29, [%r6 + 0x0b65]
thr0_ic_err_3:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,NIR,x,19)
	.word 0xc4f00980  ! 304: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 306: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xf030eb36  ! 307: STH_I	sth	%r24, [%r3 + 0x0b36]
thr0_ic_err_4:
!ic err NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,NIR,x,30)
thr0_dc_err_20:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_20), 16, 16),1,DC_DATA,43)
	.word 0xf048c009  ! 309: LDSB_R	ldsb	[%r3 + %r9], %r24
	.word 0xc4f00980  ! 311: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 313: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f00960  ! 315: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xe321400d  ! 316: STF_R	st	%f17, [%r13, %r5]
	.word 0xc0f009a0  ! 318: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 320: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 322: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 324: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 326: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 328: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe271400d  ! 329: STX_R	stx	%r17, [%r5 + %r13]
	.word 0xc4f00980  ! 331: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 333: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 335: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f009a0  ! 337: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 339: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_21:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_21), 16, 16),1,DC_DATA,45)
	.word 0xe2094009  ! 341: LDUB_R	ldub	[%r5 + %r9], %r17
thr0_dc_err_22:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_22), 16, 16),1,DC_DATA,71)
	.word 0xe2014009  ! 343: LDUW_R	lduw	[%r5 + %r9], %r17
	.word 0xe26a000c  ! 344: LDSTUB_R	ldstub	%r17, [%r8 + %r12]
	.word 0xc4f00c00  ! 346: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00c00  ! 348: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc0f00960  ! 350: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 352: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xf469c00e  ! 353: LDSTUB_R	ldstub	%r26, [%r7 + %r14]
thr0_dc_err_23:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_23), 16, 16),1,DC_DATA,48)
	.word 0xf401eb36  ! 355: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 357: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xe429800b  ! 358: STB_R	stb	%r18, [%r6 + %r11]
thr0_resum_intr_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.thr0_resum_intr_3), 16, 16)) -> intp(1, 3, 1)
	.word 0xc0f009a0  ! 360: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
!Generating an illinst
	.word 0xbc119d2d  ! 362: OR_R	or 	%r6, %r13, %r30
	.word 0xc0f00960  ! 364: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_24:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_24), 16, 16),1,DC_DATA,35)
	.word 0xe4018009  ! 366: LDUW_R	lduw	[%r6 + %r9], %r18
	.word 0xf4a1d00c  ! 367: STWA_R	stwa	%r26, [%r7 + %r12] 0x80
	.word 0xc0f00960  ! 369: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 371: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00980  ! 373: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 375: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xf429e5a9  ! 376: STB_I	stb	%r26, [%r7 + 0x05a9]
	.word 0xc0f00960  ! 378: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00c00  ! 380: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 382: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f009a0  ! 384: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 386: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 388: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 390: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_25:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_25), 16, 16),1,DC_DATA,43)
	.word 0xf401eb36  ! 392: LDUW_I	lduw	[%r7 + 0x0b36], %r26
	.word 0xc4f00c00  ! 394: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xbf313d41  ! 396: SRLX_I	srlx	%r4, 0x0001, %r31
	.word 0xc4f00980  ! 398: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 400: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb3391f4d  ! 402: SRAX_R	srax	%r4, %r13, %r25
	.word 0xf229000f  ! 403: STB_R	stb	%r25, [%r4 + %r15]
thr0_ic_err_5:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR_NIR,16,1)
	.word 0xe738c00f  ! 404: STDF_R	std	%f19, [%r15, %r3]
!Generating an illinst
	.word 0xaa099b6c  ! 406: AND_R	and 	%r6, %r12, %r21
	.word 0x81d9c00f  ! 407: FLUSH_R	dis not found

	.word 0xc0f00960  ! 409: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_26:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_26), 16, 16),1,DC_DATA,60)
	.word 0xe611c009  ! 411: LDUH_R	lduh	[%r7 + %r9], %r19
	.word 0xc4f00980  ! 413: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xe810e75c  ! 414: LDUH_I	lduh	[%r3 + 0x075c], %r20
	.word 0xc0f009a0  ! 416: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 418: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 420: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc4f00980  ! 422: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_27:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_27), 16, 16),1,DC_DATA,58)
	.word 0xe800c009  ! 424: LDUW_R	lduw	[%r3 + %r9], %r20
	.word 0xc4f00980  ! 426: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa8091d0f  ! 428: AND_R	and 	%r4, %r15, %r20
thr0_dc_err_28:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_28), 16, 16),1,DC_DATA,70)
	.word 0xe808c009  ! 430: LDUB_R	ldub	[%r3 + %r9], %r20
	.word 0xfe29a8e0  ! 431: STB_I	stb	%r31, [%r6 + 0x08e0]
thr0_ic_err_6:
!ic err IR_NIR
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR_NIR,33,31)
	.word 0xc0f00960  ! 433: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xbe316f8e  ! 435: ORN_I	orn 	%r5, 0x0f8e, %r31
	.word 0xc4f00980  ! 437: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xb529192d  ! 439: SLLX_R	sllx	%r4, %r13, %r26
thr0_dc_err_29:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_29), 16, 16),1,DC_DATA,56)
	.word 0xfe118009  ! 441: LDUH_R	lduh	[%r6 + %r9], %r31
thr0_dc_err_30:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_30), 16, 16),1,DC_DATA,19)
	.word 0xfe198009  ! 443: LDD_R	ldd	[%r6 + %r9], %r31
	.word 0xc4f00c00  ! 445: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xaf29d90f  ! 447: SLLX_R	sllx	%r7, %r15, %r23
!Generating an illinst
	.word 0xb7393b01  ! 449: SRA_I	srax	%r4, 0x0001, %r27
	.word 0xfc0962c4  ! 450: LDUB_I	ldub	[%r5 + 0x02c4], %r30
!Generating an illinst
	.word 0xa5398b0d  ! 452: SRA_R	sra 	%r6, %r13, %r18
	.word 0xc0f009a0  ! 454: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00980  ! 456: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_31:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_31), 16, 16),1,DC_DATA,54)
	.word 0xfc414009  ! 458: LDSW_R	ldsw	[%r5 + %r9], %r30
	.word 0xc4f00c00  ! 460: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xb228ffb0  ! 462: ANDN_I	andn 	%r3, 0xffffffb0, %r25
!Generating an illinst
	.word 0xba221f2b  ! 464: SUB_R	sub 	%r8, %r11, %r29
	.word 0xc4f00c00  ! 466: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
!Generating an illinst
	.word 0xa831db6e  ! 468: ORN_R	orn 	%r7, %r14, %r20
	.word 0xc4f00980  ! 470: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc4f00c00  ! 472: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 474: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
	.word 0xc0f00960  ! 476: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
!Generating an illinst
	.word 0xb2392df6  ! 478: XNOR_I	xnor 	%r4, 0x0df6, %r25
	.word 0xc0f00960  ! 480: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
	.word 0xc0f00960  ! 482: STXA_R	stxa	%r0, [%r0 + %r0] 0x4b
thr0_dc_err_32:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_32), 16, 16),1,DC_DATA,3)
	.word 0xfc114009  ! 484: LDUH_R	lduh	[%r5 + %r9], %r30
thr0_dc_err_33:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_33), 16, 16),1,DC_DATA,14)
	.word 0xfc094009  ! 486: LDUB_R	ldub	[%r5 + %r9], %r30
	.word 0xc4f00980  ! 488: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
!Generating an illinst
	.word 0xa2120b0c  ! 490: OR_R	or 	%r8, %r12, %r17
	.word 0xc0f009a0  ! 492: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc0f009a0  ! 494: STXA_R	stxa	%r0, [%r0 + %r0] 0x4d
	.word 0xc4f00c00  ! 496: STXA_R	stxa	%r2, [%r0 + %r0] 0x60
	.word 0xc4f00980  ! 498: STXA_R	stxa	%r2, [%r0 + %r0] 0x4c
thr0_dc_err_34:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_34), 16, 16),1,DC_DATA,49)

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
	.word  0x2885ffcc,0xe180dfa1,0x36f6265b,0x82a872df
	.word  0x93922067,0x5edeaf61,0x9e3c2048,0x40f94a67
	.word  0x4234bf6e,0x9252e29e,0xcc209036,0x1f8bb024
	.word  0x043996cc,0x8bd21e3d,0x114b20e2,0x3824145b
	.word  0xdfc928f6,0xdbea153c,0x4daa2df9,0x8c2aea5f
	.word  0xbc1c372d,0xa1e8fa53,0x483a50db,0x3274a22f
	.word  0xa60db856,0x0b7b87f0,0xd7a8b97d,0x1b65f211
	.word  0x2d3511e6,0x23821ee8,0x8b855b82,0x9645f89b
	.word  0x96bd7201,0x557e989c,0x8356c835,0x564e0840
	.word  0x884666ad,0x10dcc6e5,0xf533859f,0xc553223c
	.word  0x1ac355b3,0xa9be3747,0xe795855b,0x7a31a51c
	.word  0xe6696705,0x4f47cc64,0xa2d8e5cb,0x6246854b
	.word  0xc03de8e7,0xe002460e,0x6c50d7c4,0x8e43e7a4
	.word  0xabbbc9bc,0x1f5898b1,0x3cd38c90,0xe73d32fa
	.word  0x66eaff5c,0x8f4af30e,0x4c347d26,0xdea2b092
	.word  0xdabe6e06,0xce680cec,0x36b79106,0xfd0228cf
	.word  0x05b136eb,0x5d5a35cb,0xd93fcd33,0x00e7a30b
	.word  0x414df844,0xd9c448f7,0xcd23ee92,0x92224fe8
	.word  0x90b15771,0x32c23d5c,0xef50d0a6,0xb5c254d6
	.word  0xbc9b3b7d,0xb33d66b7,0xd81f70fe,0x7a4d8e20
	.word  0x0a4117e9,0xdd92f41e,0x2ba00874,0xafd32995
	.word  0x07911d56,0x5b8d9959,0x021782f8,0xec217be9
	.word  0x4a12337e,0xa7cdfc53,0xc35853ca,0x2d6f5263
	.word  0xf36edd68,0x431c4120,0x8496da91,0xa42d73df
	.word  0x45a056e3,0xd7895544,0x6b347e06,0xb2a57987
	.word  0x41c6e275,0xc03eaf4b,0xde4c1283,0x67d0faca
	.word  0x10100f89,0xe61ae2c8,0xd7635671,0x18adea76
	.word  0xba6a6537,0xfbca27d6,0x2c3c708e,0xf1111be9
	.word  0x946c69c8,0x5e1d200a,0xa4948704,0x5573fb32
	.word  0x1e9b2529,0xb7ca2b58,0x9e1fd9cf,0x1340c611
	.word  0x4ffad2bd,0x074b2a38,0xef1badf0,0x3b7862c7
	.word  0x4174cf07,0x28201281,0x7fac310d,0xc96f5cf9
	.word  0x1729b542,0x5c31c38b,0x8f2021ec,0x4c45218f
	.word  0x0ccf06a1,0x7946675b,0xd27bcfb1,0x0478ce04
	.word  0x2d4f7782,0x492849c3,0xea48ab49,0xed8dd411
	.word  0x235215e8,0x44f69f91,0x1fe6ae48,0x896b29f3
	.word  0xb4314d0e,0x360bdced,0xdf196654,0x70fa9609
	.word  0xef246be3,0x41f47d29,0x30241253,0x90876591
	.word  0xbc1c3293,0x5733877c,0xc031c697,0x37d921f6
	.word  0x1d851b4e,0xae5a4b66,0xc5bf2cc7,0x3c93bc35
	.word  0x38ac9d9a,0xa6781c5c,0x17798a89,0xdd60315c
	.word  0x9568226c,0xdf2d5bcb,0xa8ed9dc0,0xdee8db27
	.word  0x8051dc8c,0xc7bb5c69,0xde3b02aa,0x145b19e6
	.word  0xc9b90f20,0x21cad0cf,0x10ae50ce,0xc109287b
	.word  0x71a47a1b,0x2fa5205b,0xf0007d9e,0xf5ee32e0
	.word  0x74d93a33,0x4ade15d0,0xbbfc40f1,0x0f58027b
	.word  0xe4a719a8,0x399ae3c3,0x73e934d7,0x74db4683
	.word  0xec27945b,0x7180ca5d,0x63518be3,0x950ebb38
	.word  0x0e9091e6,0x559fcc50,0x7e92cae0,0x25a302ff
	.word  0x7a1259ac,0x348d2cef,0x3f6810dc,0x1ce7fe34
	.word  0x6c812c57,0xc5ee5eb2,0x0e7cd1a1,0xd6ebc5f8
	.word  0x043ffbe5,0xac80863e,0x70c72089,0x15b3672f
	.word  0x1a480c39,0xa4c5044c,0xcfb472dc,0x0fbbcca7
	.word  0xa27e0458,0xeed7004d,0x07de004e,0x8bd36bb0
	.word  0x52cac588,0x546d4c2e,0x8bd5eb79,0x1e83b9aa
	.word  0x26c3596f,0xcefe7092,0xefa330a8,0x825a1e52
	.word  0xa31f6d63,0x468963ab,0x85cf8654,0x856f05d2
	.word  0x2b2d038c,0x073642a5,0xd34b9626,0x4e8c4960
	.word  0xc55e29a1,0x43e9fc27,0xb774afaa,0xaac2f314
	.word  0x68101918,0xb0ca916b,0xdfb34ccc,0x5a3d019c
	.word  0xd91a8613,0xc0542b72,0x39b5708d,0x84f1f80c
	.word  0x61a6cef2,0x9dfcdb5d,0xf52f12f0,0xfc3f03aa
	.word  0x1ae35f07,0xa8804c5b,0xe113e65c,0xe95d6436
	.word  0x2d62ce79,0x73a273dd,0x8647e562,0x70aac93a
	.word  0xa5929f74,0xfadaca6c,0xc3db0e42,0xcd1f357a
	.word  0x39f9b56f,0x7395178f,0xfe63faa1,0x64b431e4
	.word  0x63907606,0x81a88b3c,0x63dac56e,0xd7f4e62d
	.word  0x9942b100,0x5fb0a6d1,0x84febc33,0x8a7a7de5
	.word  0xe9dec064,0x8cf31294,0xfb2b68c9,0xb197246d
	.word  0x71bff7dc,0x1750e53d,0x2d93df1e,0x29494707
	.word  0x019f00be,0x28ec04c9,0x92ea5120,0x41aa8e25
	.word  0xe0fd90d7,0x4db106e7,0xae57619a,0x905b4c84
	.word  0xbeb79176,0xbf818285,0xc0bde969,0x78429d77
	.word  0xbe6057d4,0xdd1fe5fc,0x6c2202b5,0x10bff9f1
	.word  0x5e08932f,0x7c79dbbb,0x40437d25,0xe2caeeb8
	.word  0xeeb0c063,0xcb737608,0x3b653a21,0xdee04734
	.word  0x30463455,0x520aafdb,0xc2a3e8ad,0x10174bde
	.word  0x5c5a9ff9,0xc70af4e2,0xd607c977,0xaa18027a
	.word  0x36830ee1,0xbf705b38,0x71229771,0xba74c046
	.word  0x37779f75,0xbab08d5c,0xb8b1c706,0x73ea1080
	.word  0x19e6e2e3,0x632f0659,0xf3631c99,0xe72f5c65
	.word  0xe6f3d73e,0xd4cce0bf,0x9369740c,0xebf7df78
	.word  0x9fd569fa,0x48eb9fab,0xe4850ac0,0x03ba81c1
	.word  0x86d0d931,0xdd5907ad,0x167a89e3,0xee184035
	.word  0xacaf61e4,0xa42b7b22,0x92f80216,0x914a7cf7
	.word  0x0c0ed3d9,0xf0ebc15a,0xaabd8c7d,0x0b49b89e
	.word  0x57ddc23c,0x917b2fa4,0x14b460ea,0x786ec851
	.word  0x486e1f8b,0xf5111212,0x27e5220a,0xbe88cf4b
	.word  0x58585d58,0x657ccfcf,0x518f192f,0xe94d4c61
	.word  0x78ec9688,0x585ba75f,0xb7cec22f,0xef3f6c60
	.word  0x4bd235c8,0x2ef74f2d,0xa89e67a3,0x282fabd1
	.word  0x11755d64,0x77bff6e5,0x28de5c39,0xb8c1794b
	.word  0xa53389e5,0xd891c492,0x49df3d68,0x013436b4
	.word  0x7f0a14dc,0x1009d4a3,0xe85ae058,0x53056642
	.word  0x09b4d37f,0xc78b962e,0xf96e5355,0x4ae3c15d
	.word  0x5b08c9b6,0x6a676be7,0x58fac1f4,0xea074794
	.word  0x5ddd671b,0x2e7ab292,0x3c9e868e,0xa7d13c6f
	.word  0xbe058fe1,0x14746200,0x14dcff11,0xeeecdbf3
	.word  0x6ed31f02,0x46f2ff09,0xf705d206,0xdfc249a1
	.word  0x870844a6,0xc693b741,0xad5a71ed,0x535d694d
	.word  0xd900e33d,0x3e083600,0xcd1dcf7e,0xddef46d6
	.word  0x835a7204,0xc991b0f1,0xc7834750,0x487caae0
	.word  0xeceb5946,0xbbfb36b2,0x4c136df1,0x93307ef2
	.word  0x55d50732,0x6a59dfe1,0x76983082,0xccbbe47f
	.word  0xa90cfe4e,0x8d7b9795,0x425b57d3,0x673874e5
	.word  0xe3fe1845,0x8bc84648,0x80723c3d,0x65dafd14
	.word  0x1de086cf,0x9a830bd9,0xfb690365,0xfb0c9877
	.word  0x585aea62,0xe55d6718,0xa768ddc1,0xa84b3d2d
	.word  0x08062ef5,0x15371fce,0x6671e813,0x9af08137
	.word  0xcd299e7c,0x607e98a4,0xde3a221a,0xc7166813
	.word  0xd65def1c,0xc43f1e82,0xe496eb6d,0x9a982c1d
	.word  0x844ffcb2,0x166feb4b,0xe850bc45,0xea51c127
	.word  0xbb557ca9,0xac2e07ab,0xaa2d5bd9,0x0ff625cb
	.word  0x022bfe9f,0xd9f87f24,0x76d17575,0x90aa5c11
	.word  0xa3c3570e,0x3d3eecf9,0x3521f30c,0xaffd490d
	.word  0xe70bb173,0xefcaf95a,0xfa497cd6,0x9d92ed6a
	.word  0x3f6e6d58,0x367575f2,0x7cd357b6,0xc8413b52
	.word  0xf09eab65,0x4849e2cf,0xb1db9575,0x853eb326
	.word  0x1b93d6b8,0xdd27a10f,0xd20f71df,0x2a6abd8b
	.word  0x1df13a32,0x44a69566,0x2d005e5a,0x38dd12f1
	.word  0xb313bcab,0x2100aab4,0x54b0f68e,0x7a9f4815
	.word  0x691136b3,0xb96eb158,0xb543e711,0x4bbd8680
	.word  0x7f2e5382,0x2c73f500,0x186a48c2,0x452e863d
	.word  0xdf72044a,0x20555ca6,0x61106a4d,0x35cf26ca
	.word  0x92050b28,0x2e27a1d6,0xa0951a9d,0x4213af3d
	.word  0x39a0da78,0x97db8763,0x99d818f7,0x6e49fa47
	.word  0xa4e3c4c4,0xedb21aef,0x16ac7bda,0x07b3d8d5
	.word  0x80254665,0xbb77f9d8,0xe3c9a054,0x6cc4bc7b
	.word  0x2338a251,0x8f02860e,0x4f553333,0xf58523b4
	.word  0x3cd97eb7,0xb725ec37,0x28aae9f0,0xca843e6e
	.word  0x5c88c051,0x5a9be0d4,0x9f6419e0,0x9df54275
	.word  0x1974a0ab,0xc378a3fc,0xb58a2e5a,0xbd5c6f45
	.word  0x4aa7f6c8,0xec77cfa3,0xedc90c95,0x2c299bbc
	.word  0x4daae257,0xb64ed76f,0xa635490e,0x6400130a
	.word  0xa8dbcbee,0xb215a8df,0x4284d828,0xd45556a2
	.word  0xfcd4cbca,0xf132d9ef,0x389e9ac3,0xd24e595b
	.word  0xe05450bc,0x271b0123,0xadb3d80b,0xbea451e3
	.word  0x64369541,0x3e4b859e,0x21d8ba0b,0xb297e398
	.word  0x54290f0f,0xf299dcba,0xbe41222c,0x70a02708
	.word  0xa902b7ac,0x867811ec,0xc1a1ff04,0xaa940f09
	.word  0xb40b6659,0x575f4a0f,0xa3561286,0x055be5b7
	.word  0x5d0a685b,0xf3e2bb68,0xaa0c9943,0x8254f08a
	.word  0x143c350a,0x875e95a7,0xe446e7cd,0x2526a366
	.word  0xc126e0b5,0xae904cbf,0x79911aa3,0xe7694d1b
	.word  0xd7931c53,0x48b62458,0x134b03f1,0xea5d98e8
	.word  0x285b89d8,0x3eca0a76,0x840df216,0x0cd7006e
	.word  0x04d8c510,0x2b686ad8,0x66a932e8,0x54a0722b
	.word  0x0994b938,0xf2dc987d,0x7702b6f1,0x96095dc7
	.word  0x3e693be3,0x60998691,0xed1311f7,0xadf4f76e
	.word  0x1a78fb5f,0x53d6ec4a,0x7f96c22d,0x3ad4dc52
	.word  0x7509d8fa,0xf346067b,0xbf7484eb,0xb1816796
	.word  0xc16b5abf,0x67588b13,0x567bf227,0x7539737d
	.word  0x69d5c31f,0xbfaf7806,0x15f3eae8,0x9e26a34e
	.word  0x95957f01,0x02ceba58,0x58e9a60d,0xd5110e1e
	.word  0x839f0979,0x97223870,0xc70fe4e5,0xd6e52eb9
	.word  0x6f08e7e1,0x47b2bc36,0x5b6587ff,0x5190c35b
	.word  0x84551ad6,0x088215b5,0x55ad7a04,0xb9c7f5b1
	.word  0xf0d617ea,0x30fa9c79,0xe0b85c45,0x0aba7d70
	.word  0x6fadf212,0xe891d310,0x4f1b9ed2,0xd314dcf1
	.word  0x7604167d,0x774aba44,0xb3ca910e,0x00279ad7
	.word  0xfe52bfb8,0x2cbafbf0,0x6aab93d4,0xc750b265
	.word  0x6c8c462c,0x42a8ea49,0xdf49fa30,0x6d3cb842
	.word  0x2bdcc380,0x443c73e7,0xc880fe5d,0x54445114
	.word  0xfe5f650b,0xb434980a,0x8241570d,0x9c4799ce
	.word  0xc49dcc78,0x7b23c79e,0xe919ecf9,0xa867606a
	.word  0x74469244,0xbe2029c7,0xeaaff5c6,0x97959b90
	.word  0x4a4965ac,0x84836353,0xcc5f32db,0x6f793048
	.word  0x099aeb45,0xe7130ac7,0x9b7048b0,0xae3c1b61
	.word  0x6fe2db18,0x89f171c0,0x9dcd4e21,0x014ad369
	.word  0xd5aa824d,0xeeba9396,0xf04704ce,0x617c5dec
	.word  0x2610129d,0x6e14d231,0x740b111a,0x50acba02
	.word  0x1ce098a4,0xa01da557,0x35e2c23c,0x98196ca6
	.word  0xb6f2d246,0xfb1ce5d4,0x9a097c82,0x86d7ee38
	.word  0x4413c930,0xd7409eaf,0xfb471e71,0x47f0bac2
	.word  0xb1388dcc,0x7f7d5c67,0x58c121a0,0x8f227835
	.word  0x3ed3328c,0x5b0a35f7,0x91237e3a,0x69eb8bc8
	.word  0xeb0ae65a,0x2df565ef,0x8c937df5,0x6e0f6ede
	.word  0xfa80693b,0x88753a46,0x1d2872f4,0xbb7cd377
	.word  0x251dcac8,0x7e23e06a,0x415409b9,0xfad60cbd
	.word  0x0dc10725,0x8527ebe1,0xb30f7c5f,0x778572dc
	.word  0x5f4e10c8,0x4fd6f1aa,0x47920043,0x5fd7be03
	.word  0xc0620c71,0xd8f16407,0xd479a947,0xf25f6eab
	.word  0xac81c8b1,0xa05d0858,0xe874a5c2,0x9fc95263
	.word  0xa4b47677,0xf72517de,0x18d27fa6,0xd3ffa238
	.word  0x8bf1fae6,0xa89077f2,0xf970394c,0xda09806c
	.word  0x3c235616,0x7a4a0ef8,0x2322bdc9,0x1c18b1b5
	.word  0xdd8388ce,0x72275245,0x88bc549b,0x2a6c71f3
	.word  0x1e1f5551,0xc90482c4,0x8927100c,0x9e4e631c
	.word  0x6c5c7c2d,0xa165f0cc,0x8a3078dd,0x3cafa7ad
	.word  0x17585687,0x2daf3070,0x000f9b69,0x6cd3f143
	.word  0x0bf33fb4,0xe4dfb2ea,0x211a0b3e,0xfb7ff200
	.word  0xe4b22af9,0x740ac493,0x61ebf2b3,0x5474fe32
	.word  0xf1dbbfeb,0x0b189061,0x69415bf4,0xf1114625
	.word  0xd501abd6,0xa781127a,0x232685f5,0x8fe32c46
	.word  0xfd0ca1b4,0xaf739873,0xa9698cd6,0x978ad004
	.word  0xffcd10e8,0xc79947b1,0x8b8a79ae,0x775fc63d
	.word  0x7cc33dc2,0xbe714bdf,0xb750ab4d,0xa85f8e72
	.word  0x25395d6b,0xb9997e66,0x012bb09e,0x93df5c40
	.word  0x1bfe48db,0xe17c3161,0x0a28488f,0x84135378
	.word  0xa1507138,0xd69f1a24,0xf8a165c8,0x5da77ca9
	.word  0xa8f9b5ad,0xb2680c09,0x6d586fbc,0x12b1e1e5
	.word  0xc3c1af2e,0xe114492e,0x96607c68,0x6d1650cb
	.word  0x3724382e,0x2105d090,0xbbf286ff,0x856ad280
	.word  0xe73a67c2,0x8a1be54b,0xc07bf777,0xa382f551
	.word  0x47479c5c,0x514b9aa5,0x50e65682,0xf43358f1
	.word  0xd3f38a98,0xb110c599,0x1f2b9663,0x45669943
	.word  0x3e6e9790,0xc6a2a803,0xcbf6193c,0x7f4353ae
	.word  0xc9220dde,0x5ab6aeb3,0x078ead2b,0xc0fecbaa
	.word  0xe67abc68,0x8ac9196d,0xb0e8954f,0x631ba224
	.word  0x84c238cf,0x11fe3840,0x78d8812e,0x7e3ec29f
	.word  0xfb8379e3,0x9813d520,0xffde896e,0x44fa2cb9
	.word  0x5c6072d0,0x5b85bd6f,0x112725f4,0x901ad30f
	.word  0x605e2cce,0xfa8897e4,0x5df63a5d,0x4d90520a
	.word  0xbe221635,0x934590ac,0x45e6c33c,0xc351e362
	.word  0x66928410,0x4b4acadc,0xc6c9e5d4,0x59e65fa2
	.word  0x3d93682a,0xfd0761ba,0x62f71378,0x36a6ab6d
	.word  0x635cfd2d,0x164bdac3,0xbf2a5be3,0x49caf5e3
	.word  0x0eb0bc34,0xb951735a,0xe53d80e8,0x27aad1a3
	.word  0x90467ede,0xd49afb1f,0x6796b340,0xde33bbbf
	.word  0x9d34f321,0x9312e441,0x80b9f03a,0x1133e411
	.word  0x6f4bd3b8,0xf0f4d045,0x2be16eea,0x1d339ed8
	.word  0xb78557d0,0xed9f76b4,0xa1b25bff,0x5797a87b
	.word  0xa75662e2,0x286d4c9d,0x16172635,0x3f6f0641
	.word  0x87fac62c,0x82f11bd2,0xd6bb4776,0x08299274
	.word  0x7a8ddfc6,0xe7c9b612,0xf25a7d80,0x368ecc88
	.word  0x260b81ab,0x1c4e3f03,0x9fc8c46d,0x755d9ef7
	.word  0xff5d5c7e,0xe8600db0,0xdcbfe7e6,0x308c13fa
	.word  0xbfca0519,0xb40e3f2b,0x50143a67,0x6cedd890
	.word  0x09058159,0x701db908,0xa16e94b2,0xdf76dddd
	.word  0x47abd739,0x15da132b,0x02491228,0xf5bab2da
	.word  0x92f54ea8,0x067ea0aa,0x828c857f,0x8c25423d
	.word  0x92ec67d3,0x585e844d,0xf1ecc75d,0xafb7f4bc
	.word  0x37b22209,0x88862b9b,0x5ee8104e,0x2d64ed46
	.word  0x2fc9442f,0x7f9ea472,0x44ffba49,0xe610b146
	.word  0x70362148,0x8630a78f,0x78551b6d,0x73012d2f
	.word  0x81582b56,0x5f5a21ad,0x9384cfa0,0xd3401db0
	.word  0x13ca9251,0x4122a8cd,0x264fe95f,0x730fba53
	.word  0x9addc76e,0xed1c5506,0x85a71bc9,0x4e197040
	.word  0xe05c201d,0x89d4e4b8,0x5c2cf638,0x5298a2ad
	.word  0xe5ea9dd9,0x0b236621,0xd07fc675,0xca1da437
	.word  0xe4a12a33,0x20ac4d59,0xd82468b8,0xa907c999
	.word  0x74349499,0x0c4059d0,0x305d069c,0xe75eed8d
	.word  0xd10aa5ba,0x7ae5283c,0x820b6296,0x6fb47476
	.word  0xe04d9941,0x02da681d,0x3f6fb506,0x1957a6c2
	.word  0xee1df77d,0x7c29b7e0,0xf263f50a,0x07aff7a1
	.word  0xf8db2bed,0xa8e3edb8,0x568fdbdc,0xb6aaf167
	.word  0x62235fb9,0xa9396a83,0xc8b03f43,0x933bf500
	.word  0xf67d44e8,0x735cb4f7,0xfad3639e,0x5092adbb
	.word  0xa32bf57a,0x3bcae1b4,0x712d85e7,0x83eccc08
	.word  0x0291e0e1,0x12d5f287,0xb825f415,0x74fa3e4b
	.word  0x873eef4d,0x90077a72,0x1dfe09e8,0xa00386a9
	.word  0x9eff8c80,0x5b7cf8c6,0x25e749ad,0x023ca09d
	.word  0xdc5fe902,0xcc5670ff,0xe9f33d98,0x401f54f3
	.word  0x24433a6f,0xa126e43e,0x0e5fea70,0x80d019aa
	.word  0x28951763,0xbf1e3835,0xa588261f,0x0337ed6e
	.word  0x6ec3cdac,0x0865e179,0xe7b00b8d,0xc48298cc



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


