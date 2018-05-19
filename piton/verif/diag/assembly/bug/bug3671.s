// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3671.s
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
   random seed:	206604003
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
	setx  0x442420652618e888, %r1, %r16
	setx  0x71fcd26fbc4635d3, %r1, %r17
	setx  0xf6617f514844801b, %r1, %r18
	setx  0x5bffa771424107c5, %r1, %r19
	setx  0xc9d96408fd6f0882, %r1, %r20
	setx  0xf274effa2f4d8d58, %r1, %r21
	setx  0x1968db958df528ed, %r1, %r22
	setx  0xf0f0ce9235c0ff0b, %r1, %r23
	setx  0x5beb594a33f51946, %r1, %r24
	setx  0x122c237a8c8e120b, %r1, %r25
	setx  0xf1c86917780431ec, %r1, %r26
	setx  0x80b7934c897103e5, %r1, %r27
	setx  0xce62d9c2691f5ef9, %r1, %r28
	setx  0xefdc1af8053e70c2, %r1, %r29
	setx  0xaaea39ab12e36e49, %r1, %r30
	setx  0xb82f4ba553e3184d, %r1, %r31
	setx  0x0000000000000480, %r1, %r9
	setx  0x0000000000000ff0, %r1, %r10
	setx  0x0000000000000170, %r1, %r11
	setx  0x00000000000001b0, %r1, %r12
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
	.word 0xa278ac3a  ! 33: SDIV_I	sdiv 	%r2, 0x0c3a, %r17
	.word 0xa4f96dc2  ! 33: SDIVcc_I	sdivcc 	%r5, 0x0dc2, %r18
	.word 0xb0f9800d  ! 33: SDIVcc_R	sdivcc 	%r6, %r13, %r24
	.word 0xa0f8ee8c  ! 33: SDIVcc_I	sdivcc 	%r3, 0x0e8c, %r16
	.word 0xa968ae06  ! 33: SDIVX_I	sdivx	%r2, 0x0e06, %r20
	.word 0xb768a2a7  ! 33: SDIVX_I	sdivx	%r2, 0x02a7, %r27
	.word 0xb0f2000d  ! 33: UDIVcc_R	udivcc 	%r8, %r13, %r24
	.word 0xaf69400a  ! 33: SDIVX_R	sdivx	%r5, %r10, %r23
	.word 0xb669000a  ! 33: UDIVX_R	udivx 	%r4, %r10, %r27
	.word 0xb0f1e921  ! 33: UDIVcc_I	udivcc 	%r7, 0x0921, %r24
	.word 0xae6a000d  ! 33: UDIVX_R	udivx 	%r8, %r13, %r23
	.word 0xb0f227d8  ! 180: UDIVcc_I	udivcc 	%r8, 0x07d8, %r24
	.word 0xac70800d  ! 180: UDIV_R	udiv 	%r2, %r13, %r22
	.word 0xb769c00a  ! 180: SDIVX_R	sdivx	%r7, %r10, %r27
	.word 0xb969000a  ! 180: SDIVX_R	sdivx	%r4, %r10, %r28
	.word 0xa0f9800e  ! 180: SDIVcc_R	sdivcc 	%r6, %r14, %r16
	.word 0xb0f8c00a  ! 180: SDIVcc_R	sdivcc 	%r3, %r10, %r24
	.word 0xba69800b  ! 180: UDIVX_R	udivx 	%r6, %r11, %r29
	.word 0xa4f10009  ! 180: UDIVcc_R	udivcc 	%r4, %r9, %r18
	.word 0xa4f121df  ! 180: UDIVcc_I	udivcc 	%r4, 0x01df, %r18
	.word 0xb07169fc  ! 180: UDIV_I	udiv 	%r5, 0x09fc, %r24
	.word 0xb268aa97  ! 180: UDIVX_I	udivx 	%r2, 0x0a97, %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0xf9039d9378654f45, %r1, %r16
	setx  0x356f4db8254a48fd, %r1, %r17
	setx  0x83677477620dcfef, %r1, %r18
	setx  0xbab1d5012bcc1ceb, %r1, %r19
	setx  0x5d5dc07c23ccc9e0, %r1, %r20
	setx  0x733dfe14fe0cda07, %r1, %r21
	setx  0x0d455ecf61d8dc0d, %r1, %r22
	setx  0xd1f534cb47f4066d, %r1, %r23
	setx  0xab19e31c2e40f7be, %r1, %r24
	setx  0xfe40d2e3ea269ae8, %r1, %r25
	setx  0x5d9b7fc5c65c1f82, %r1, %r26
	setx  0x7bfae76b489b651d, %r1, %r27
	setx  0x7f52e147fa0f6936, %r1, %r28
	setx  0xa02eaf048eb9b7a8, %r1, %r29
	setx  0x56954712292d8f17, %r1, %r30
	setx  0xa86c3e43461f1107, %r1, %r31
	setx  0x0000000000000090, %r1, %r9
	setx  0x0000000000000320, %r1, %r10
	setx  0x0000000000000c60, %r1, %r11
	setx  0x0000000000000d90, %r1, %r12
	setx  0x0000000000000fa0, %r1, %r13
	setx  0x0000000000000550, %r1, %r14
	setx  0x0000000000000810, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r2
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	.word 0xb738e001  ! 1: SRA_I	sra 	%r3, 0x0001, %r27
	.word 0xb0b12340  ! 1: ORNcc_I	orncc 	%r4, 0x0340, %r24
	.word 0xb0a8a353  ! 1: ANDNcc_I	andncc 	%r2, 0x0353, %r24
	.word 0xb131f001  ! 1: SRLX_I	srlx	%r7, 0x0001, %r24
	.word 0xbf39400e  ! 1: SRA_R	sra 	%r5, %r14, %r31
	.word 0xa8190009  ! 1: XOR_R	xor 	%r4, %r9, %r20
!alu_burst
	.word 0xe830acd0  ! 4: STH_I	sth	%r20, [%r2 + 0x0cd0]
	.word 0xaf39a001  ! 7: SRA_I	sra 	%r6, 0x0001, %r23
	.word 0xb020e385  ! 9: SUB_I	sub 	%r3, 0x0385, %r24
	.word 0xaa70e30f  ! 12: UDIV_I	udiv 	%r3, 0x030f, %r21
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),1,IC_DATA,IR,3,x)
	.word 0xa4a9000c  ! 15: ANDNcc_R	andncc 	%r4, %r12, %r18
!ldst_irf_err
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,36,x, x,x,x, x,x,x)
	.word 0xe4292db9  ! 19: STB_I	stb	%r18, [%r4 + 0x0db9]
	.word 0xac40800c  ! 22: ADDC_R	addc 	%r2, %r12, %r22
	.word 0xb689000c  ! 24: ANDcc_R	andcc 	%r4, %r12, %r27
	.word 0xa8fa2ea9  ! 27: SDIVcc_I	sdivcc 	%r8, 0x0ea9, %r20
thr0_ic_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_1), 16, 16),1,IC_DATA,IR,12,x)
	.word 0xa2a8800d  ! 30: ANDNcc_R	andncc 	%r2, %r13, %r17
!ldst_irf_err
	.word 0xa87a2bf8  ! 33: SDIV_I	sdiv 	%r8, 0x0bf8, %r20
	.word 0xee2a2be5  ! 36: STB_I	stb	%r23, [%r8 + 0x0be5]
	.word 0xa132006c  ! 39: SRL_R	srl 	%r8, %r12, %r16
	.word 0xb129400b  ! 41: SLL_R	sll 	%r5, %r11, %r24
thr0_ic_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_2), 16, 16),1,IC_DATA,IR,22,x)
	.word 0xb6796542  ! 44: SDIV_I	sdiv 	%r5, 0x0542, %r27
!ldst_irf_err
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),1,DC_DATA,41)
	.word 0xe051c00f  ! 47: LDSH_R	ldsh	[%r7 + %r15], %r16
	.word 0xb731906d  ! 50: SRLX_R	srlx	%r6, %r13, %r27
	.word 0xbef22605  ! 53: UDIVcc_I	udivcc 	%r8, 0x0605, %r31
!ld_dc_err
thr0_irf_ce_1:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_1), 16, 16),1,IRF,ce,13,x, x,x,x, x,x,x)
	.word 0xea2123bc  ! 56: STW_I	stw	%r21, [%r4 + 0x03bc]
	.word 0xa0322b59  ! 59: ORN_I	orn 	%r8, 0x0b59, %r16
	.word 0xb1643801  ! 61: MOVcc_I	<illegal instruction>
	.word 0xbcf9a07a  ! 64: SDIVcc_I	sdivcc 	%r6, 0x007a, %r30
thr0_ic_err_3:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_3), 16, 16),1,IC_DATA,IR,20,x)
	.word 0xa49968a1  ! 67: XORcc_I	xorcc 	%r5, 0x08a1, %r18
!ldst_irf_err
thr0_irf_ce_2:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_2), 16, 16),1,IRF,ce,12,x, x,x,x, x,x,x)
	.word 0xe401400f  ! 71: LDUW_R	lduw	[%r5 + %r15], %r18
	.word 0xa5643861  ! 74: MOVcc_I	<illegal instruction>
	.word 0xb600a42b  ! 76: ADD_I	add 	%r2, 0x042b, %r27
thr0_ic_err_4:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_4), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xae69a6e3  ! 79: UDIVX_I	udivx 	%r6, 0x06e3, %r23
!ldst_irf_err
	.word 0xee41a869  ! 82: LDSW_I	ldsw	[%r6 + 0x0869], %r23
	.word 0xae30c009  ! 85: SUBC_R	orn 	%r3, %r9, %r23
	.word 0xb5782401  ! 87: MOVR_I	move	%r0, 0x9, %r26
thr0_ic_err_5:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_5), 16, 16),1,IC_DATA,IR,11,x)
	.word 0xb568a9c6  ! 90: SDIVX_I	sdivx	%r2, 0x09c6, %r26
!ldst_irf_err
	.word 0xf428ab99  ! 93: STB_I	stb	%r26, [%r2 + 0x0b99]
	.word 0xbc91e371  ! 96: ORcc_I	orcc 	%r7, 0x0371, %r30
	.word 0xb132000c  ! 98: SRL_R	srl 	%r8, %r12, %r24
	.word 0xb072000b  ! 101: UDIV_R	udiv 	%r8, %r11, %r24
!ldst_irf_err
	.word 0xf221a4e0  ! 104: STW_I	stw	%r25, [%r6 + 0x04e0]
	.word 0xbf64180d  ! 107: MOVcc_R	<illegal instruction>
	.word 0xa6b22823  ! 109: ORNcc_I	orncc 	%r8, 0x0823, %r19
	.word 0xacf22b51  ! 112: UDIVcc_I	udivcc 	%r8, 0x0b51, %r22
thr0_ic_err_6:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_6), 16, 16),1,IC_DATA,IR,19,x)
	.word 0xa60a2298  ! 115: AND_I	and 	%r8, 0x0298, %r19
!ldst_irf_err
	.word 0xe6522945  ! 118: LDSH_I	ldsh	[%r8 + 0x0945], %r19
	.word 0xa4b92b13  ! 121: XNORcc_I	xnorcc 	%r4, 0x0b13, %r18
	.word 0xa231ad25  ! 123: SUBC_I	orn 	%r6, 0x0d25, %r17
	.word 0xb6f0e8c4  ! 126: UDIVcc_I	udivcc 	%r3, 0x08c4, %r27
!ldst_irf_err
	.word 0xa128800d  ! 127: SLL_R	sll 	%r2, %r13, %r16
	.word 0xab28c00e  ! 127: SLL_R	sll 	%r3, %r14, %r21
	.word 0xa4b0a7be  ! 127: SUBCcc_I	orncc 	%r2, 0x07be, %r18
	.word 0xb539e001  ! 127: SRA_I	sra 	%r7, 0x0001, %r26
!alu_burst
	.word 0xe041000a  ! 130: LDSW_R	ldsw	[%r4 + %r10], %r16
	.word 0xb240c06f  ! 133: ADDC_R	addc 	%r3, %r15, %r25
	.word 0xba90c00c  ! 135: ORcc_R	orcc 	%r3, %r12, %r29
	.word 0xa968800f  ! 138: SDIVX_R	sdivx	%r2, %r15, %r20
!ldst_irf_err
thr0_irf_ce_3:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_3), 16, 16),1,IRF,ce,63,x, x,x,x, x,x,x)
	.word 0xfe222368  ! 141: STW_I	stw	%r31, [%r8 + 0x0368]
	.word 0xb011806f  ! 144: OR_R	or 	%r6, %r15, %r24
	.word 0xbd319009  ! 146: SRLX_R	srlx	%r6, %r9, %r30
	.word 0xaefa000e  ! 149: SDIVcc_R	sdivcc 	%r8, %r14, %r23
thr0_ic_err_7:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_7), 16, 16),1,IC_DATA,IR,2,x)
	.word 0xb4b1a61f  ! 152: ORNcc_I	orncc 	%r6, 0x061f, %r26
!ldst_irf_err
	.word 0xe671aab0  ! 155: STX_I	stx	%r19, [%r6 + 0x0ab0]
	.word 0xa0196762  ! 158: XOR_I	xor 	%r5, 0x0762, %r16
	.word 0xad38900c  ! 160: SRAX_R	srax	%r2, %r12, %r22
	.word 0xa079800f  ! 163: SDIV_R	sdiv 	%r6, %r15, %r16
thr0_ic_err_8:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_8), 16, 16),1,IC_DATA,IR,16,x)
	.word 0xaa40e51d  ! 166: ADDC_I	addc 	%r3, 0x051d, %r21
!ldst_irf_err
	.word 0xea414009  ! 169: LDSW_R	ldsw	[%r5 + %r9], %r21
	.word 0xb088a3f4  ! 172: ANDcc_I	andcc 	%r2, 0x03f4, %r24
	.word 0xb030e055  ! 174: ORN_I	orn 	%r3, 0x0055, %r24
	.word 0xb96921fb  ! 177: SDIVX_I	sdivx	%r4, 0x01fb, %r28
!ldst_irf_err
	.word 0xb0f12c64  ! 180: UDIVcc_I	udivcc 	%r4, 0x0c64, %r24
	.word 0xf2108009  ! 183: LDUH_R	lduh	[%r2 + %r9], %r25
	.word 0xa8112e61  ! 186: OR_I	or 	%r4, 0x0e61, %r20
	.word 0xa8a16738  ! 188: SUBcc_I	subcc 	%r5, 0x0738, %r20
	.word 0xa469000d  ! 191: UDIVX_R	udivx 	%r4, %r13, %r18
thr0_ic_err_9:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_9), 16, 16),1,IC_DATA,IR,24,x)
	.word 0xbcb1400b  ! 194: ORNcc_R	orncc 	%r5, %r11, %r30
!ldst_irf_err
	.word 0xfc01400b  ! 197: LDUW_R	lduw	[%r5 + %r11], %r30

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
	.word  0xe4fca069,0xa28e7e3f,0x659bcded,0xf37ab086
	.word  0xe4ebf17e,0x45beb6fe,0xc0b9261f,0x4bc16a59
	.word  0xa559e629,0x548fc889,0xed98ce8f,0x814c8010
	.word  0xf3cb6f52,0xfdde9f52,0xd2bf0802,0x56e7dc41
	.word  0x4d015b08,0x6c4f316e,0xda3bb96a,0x6c40bdc4
	.word  0xcef599f8,0x8aab0396,0xeb59d837,0x0cfb3eed
	.word  0xfde403d6,0xde5eb72a,0xb9e4019c,0x747f1f24
	.word  0x08d39b80,0xfab23b7f,0x966fe016,0x740b3284
	.word  0xe909ff9a,0x930dd930,0x9ef44017,0x1f3e0de3
	.word  0x8efcd071,0x596a6e93,0xc0e9fe9a,0xf0305d38
	.word  0xaae8dbd4,0x3ce3b667,0x6294df2a,0xbdc3fed1
	.word  0x4e0c0733,0x54a04d80,0x64c7072f,0xd1809a0f
	.word  0xc836b6e7,0x1bf8d862,0xe67c7f68,0xcac8142c
	.word  0x6cabbc02,0x9e615f47,0x7558b7cf,0x2a082de6
	.word  0x9a3ba7db,0x91096196,0x4fc21191,0x79fa082b
	.word  0x7a5251c1,0x4aed2b05,0x127db7a2,0xf70ff728
	.word  0x721a0101,0x151674e9,0x0b6f50db,0xd746bfe1
	.word  0xf57ca786,0x7951fc4f,0xe04a365a,0xf6d11d99
	.word  0x7892f1af,0x66d22690,0x9a8b5974,0xe3411671
	.word  0x25d56739,0xa9feafce,0xb4ac4357,0x49c84a92
	.word  0x43e33109,0x43fd60f2,0xadcf9f89,0x3cf3fa1e
	.word  0x96f834a5,0x26a18529,0x255bdacd,0xe1febc8b
	.word  0xf8564dd7,0x64e47bd7,0x585569ed,0xc1c741dc
	.word  0x0ebc34c0,0x44e8ce2d,0xdbcb43ac,0xdc77f676
	.word  0xac0effe5,0xfb76d390,0xb51130bf,0x5c79e531
	.word  0xd7010011,0x7b9339b7,0xebd2bb80,0xa038de3f
	.word  0xc70e7d62,0x582e0cc0,0x21312992,0xab9ef608
	.word  0x7cf5172e,0xeeb99956,0x9dcd6345,0xa80d0a89
	.word  0x1a37679d,0xe2bd0554,0x5b5a73cb,0xcba28094
	.word  0x5709fab0,0xa9090d06,0xad4dcd51,0x905a6cde
	.word  0xbc585481,0x026532d6,0xf74ca932,0x512a1e46
	.word  0xa910fa56,0x4c30364e,0x859454a7,0x7fae8ca2
	.word  0xbe1cc437,0xc57525b4,0x03bad95d,0x81f18954
	.word  0xcf8b03a3,0x86fe0912,0x8193208a,0xf3d0b4ec
	.word  0x27359e1e,0x1e709101,0xfb2a5ea3,0x43090078
	.word  0x7744e8f2,0x3ca4ee6b,0x7326ba77,0x2c966330
	.word  0x9aad7aff,0x22bc7559,0xf1751aac,0x4e2db07b
	.word  0x932633c1,0xd9a291c8,0xa9696aef,0xfa2faff9
	.word  0x7d19f9e5,0x8337fa27,0x1456d658,0xc9b36965
	.word  0x912f63f3,0x035e91f4,0x9aa9a3eb,0x1ab97ee9
	.word  0x70e288df,0xa1cb9c1e,0xe0718ca7,0x2ba6e8d9
	.word  0x9370ae4f,0xcd92a8ab,0xf1cc7c4f,0xe1616ae9
	.word  0xa83b875e,0x9888c71c,0x7fab40e9,0x38a6da59
	.word  0x09953bc9,0xb47b63a7,0xafb08d5b,0x209f6c4e
	.word  0x462e924b,0xf269c0a4,0xcca63db7,0xb280544e
	.word  0xfb1f7304,0x919dfa67,0x9e2fc6bd,0x22697988
	.word  0xb1bc5c51,0xa21ca0c9,0x34fc98c2,0x6a83c111
	.word  0x1bce8adf,0x4172747b,0x33df9423,0x0814a1c7
	.word  0xdcb03779,0x2d647231,0xb0839964,0x277e1350
	.word  0x86e18611,0x0170ff0e,0x8460dbf2,0x68914913
	.word  0x3932cd14,0xb1b70723,0x7b427779,0xf73705aa
	.word  0xba40c745,0x4876f6f0,0xe79c0577,0x989c1a8a
	.word  0x0b7afd31,0xa14a5b2c,0x59eb01bb,0x5f742352
	.word  0x0dc747b7,0x050d9aa9,0xc3cbc30e,0xecb678d6
	.word  0xb19da1db,0x95494719,0x16e5a51f,0xf5467cf4
	.word  0xd5477bb6,0x23054d50,0x73724063,0xe92b4bbe
	.word  0x6a1646ea,0x995395c2,0xa614a3aa,0x478a6cde
	.word  0xe02175be,0xacc0773a,0x3ed8b1ad,0x730d9842
	.word  0x098c35b3,0x245a73a6,0xbd58630c,0xf161c495
	.word  0x83de1526,0x21cea2e3,0xd9557072,0x9d8a7afc
	.word  0x969780fa,0x195054bc,0x246e6f44,0x01df6a09
	.word  0x10eff1a1,0x67dd604c,0x07b6fa91,0xc04de6e6
	.word  0xe5178b48,0xad06228a,0xe1215512,0x83006030
	.word  0xeab936e1,0xd34b7015,0x18577220,0x29e354b4
	.word  0x5c36724f,0xc30ec449,0x801b5f7f,0xca634d73
	.word  0x2b3c9339,0x394ef736,0x3812064c,0x9e103448
	.word  0x87792daa,0xe3142d1f,0x685f7cca,0xd1d36516
	.word  0xb167a369,0x51097ba1,0x03533c3d,0xdab4ce44
	.word  0x80971c3a,0x9d32516a,0x1c7e68d6,0x180f9607
	.word  0xad7a9579,0x7776696e,0x885f15b7,0xf8dbb1ef
	.word  0x55b9532d,0xd81b299b,0x097ef4b2,0xfe7c4f93
	.word  0xf8f83e72,0x4ae735af,0x872b5232,0x36efd62a
	.word  0xed3318a4,0xe0bc068a,0x79abe1a9,0x0617e686
	.word  0x12ca4358,0xe1fbe0cd,0x9be4bd00,0xd1d14498
	.word  0x8f2bcb0b,0xd381045c,0x15e8c60a,0xf69e0547
	.word  0x4168b4dc,0xa9da1596,0xdda9bb83,0xba1ca3d6
	.word  0xf7cf3274,0x75489412,0x3eeae5c2,0x2ad271d4
	.word  0xd49cfa18,0x2f84c614,0x3e8bfa7d,0xbbda957a
	.word  0xf5e87fa0,0xb2286578,0xd333d80e,0x831ea0e2
	.word  0xfd889fbd,0x3ec03f00,0x1adbaa95,0xbc9195a7
	.word  0xf6d50913,0x6e581173,0x1eff41d5,0xd56b2787
	.word  0x84df02c4,0xec04d728,0x085088fa,0xe6086da7
	.word  0x7dc62279,0x9902a6ce,0xd0cfbf06,0xa1bc6df9
	.word  0x71f8bdc6,0xfe762465,0xae5d2833,0x4f2d8863
	.word  0x770b2b50,0x7e6db6c9,0x30ab3878,0xed902499
	.word  0xc3c59235,0x60745021,0x7361fde2,0xb1e706a9
	.word  0x046e43a2,0xaa5bb1c0,0x37f457e7,0x61bae816
	.word  0xb2b22568,0xf32c8669,0x009bb9bf,0x957c9c54
	.word  0x9b4082ea,0xe0dd4df3,0x1e79e6c5,0xb1658275
	.word  0xed5d533a,0xe2c50571,0xc9381114,0x9243a28f
	.word  0x40f81303,0xb4b0960f,0xc3a95b34,0xb7ab3737
	.word  0x0fdd15c8,0x8bbeca34,0x4f0a2b32,0x850c979a
	.word  0xe07e9432,0x62cbaac8,0x11c7a0a1,0xf291f310
	.word  0xd9e86a5c,0xb82298d4,0xf486ca8b,0xd2dddd09
	.word  0x90d10e65,0x084bf38c,0x29976fea,0x48eb45be
	.word  0xc8b04eb0,0x563717bf,0x5b06efcc,0xf0245438
	.word  0xfcb0fc3c,0x5b1db910,0x463bb8b3,0x668f78fc
	.word  0xc270e36e,0xdac299ca,0xb6cec670,0xdecd984e
	.word  0xad882eda,0x3a1e8fc2,0x2a06dda4,0x176f8e53
	.word  0xdbf2b60a,0x8b18798c,0xaaafd660,0x7d686015
	.word  0x27ce6688,0x22173293,0xb44b7438,0xf7b6673b
	.word  0xb65a0686,0x7fe43401,0xcfc316cf,0x2b00c89b
	.word  0x960d9cb4,0xf928396c,0xfc1b7316,0x34d21f8f
	.word  0x3572d4e5,0xb6aae57a,0xec0c4349,0x70e134a2
	.word  0x9f152f61,0x65ce3da5,0x957f4e86,0x92b1b6db
	.word  0xae987298,0xd9cc0aeb,0x6a4fb6fa,0x00b1486d
	.word  0x8a0374d8,0xa311e9fe,0x7e1c353c,0xcc545e2c
	.word  0x69c83bd9,0x0ec134b0,0xc00d230d,0x07821534
	.word  0x892b0b1a,0xa58b9701,0x06add6ea,0x50dea80d
	.word  0xeb54979d,0xa59582f4,0x23f4d2e6,0x5a26e0d7
	.word  0xcc7eb61b,0x13cffe86,0x8883232f,0x2d87022e
	.word  0x01307da2,0xb74419e2,0xdfdc4bdc,0x7ed90c5c
	.word  0xe324757e,0xafbb22e7,0x5add53f0,0xf49e764a
	.word  0x6845e8e4,0x13df7cc0,0x5a4c60f1,0x6d5805ce
	.word  0x95e66614,0x609ff328,0x133e505e,0xf2258c5d
	.word  0x70e38970,0xbcefc633,0x8cac8659,0x2cc27102
	.word  0xd6db565f,0x70d93237,0xf82eb68c,0xfa58bf06
	.word  0xc85f274b,0xeb062119,0xaa528281,0xcebc50ea
	.word  0x8e53cc31,0xf1de5cd1,0xa243fee7,0x2d4eb17f
	.word  0x1fded453,0x82880d7f,0xe58836c0,0x680ca948
	.word  0xccf0c0b8,0x13748e66,0xe69d5aae,0x31555a0f
	.word  0x7cffdd6a,0x7e346a9d,0x9aa524da,0xf3fc63e9
	.word  0x33c6b902,0x824ff821,0xa4f801f1,0x03ab6332
	.word  0xbddd7425,0x059a2a11,0xb3e4e61c,0xd7dafd15
	.word  0x9a46b47a,0xc62fb3f5,0x053a7aca,0xc8cd5abb
	.word  0xd54c874a,0x5e5fc05e,0xe32c7f9b,0xb90b2fc0
	.word  0x6280c708,0xa6a2d3c2,0xd92ddf05,0x6a983231
	.word  0x86a81c01,0x252a5af7,0xe63caf85,0x7252732f
	.word  0xc49ab3d6,0x3a14e953,0x9e32e120,0x778ffe20
	.word  0x14e40b7e,0x0d71c2a5,0x50b96394,0x442f2c27
	.word  0x58788ae2,0x671bb867,0x0fa90e89,0x7c0bc551
	.word  0x218b35cd,0x1258a995,0x37b7b446,0x02c978cb
	.word  0x7e3e44b7,0x55647bee,0xb3d275c8,0xf391ee97
	.word  0x6ad9dfd6,0xe2fde768,0xc04a37c2,0xab3575da
	.word  0x15080c1b,0x6f06ca60,0x2d2828f6,0x252380dd
	.word  0xfeaf5927,0x5b6e4e9e,0x1087e897,0x0105d4e3
	.word  0xa4d1ce38,0xd9e3e5cb,0x9a9067f9,0xda765d3f
	.word  0x5536bc98,0x1a1f290e,0x4b63594e,0xe44a023d
	.word  0x51592af0,0xc64c3f0e,0x3dba14a3,0x67116aa9
	.word  0x9a06fa8f,0xff384682,0xb91327a3,0x03088a76
	.word  0x51f5c138,0x4b643c91,0x30059517,0x02983691
	.word  0x8e6eec7d,0x1333902a,0xad0e2a9b,0x722e9dd5
	.word  0xd638deb4,0xc52f0415,0x10c40b8c,0x263c8170
	.word  0xaacda58a,0x24dd60bd,0x8dda6942,0xebfb67b0
	.word  0x4d49f5ea,0x154ca83c,0x41049fe6,0x894e80d8
	.word  0xb938e4a0,0xdccf4290,0x47a31037,0xd0a8bc41
	.word  0x1be988b9,0x03471cfd,0x75cf170f,0xb0361a77
	.word  0xc2013820,0xc4e2c1ab,0xa540b4f9,0xd6738bea
	.word  0xc56fa7e0,0x5fd7b086,0x07c7ef99,0x414c45fa
	.word  0x644800db,0xede43c07,0x70849678,0xddb9692d
	.word  0xee743250,0x31cee124,0xf3d5e478,0x1177d1d4
	.word  0xc30de3b4,0x55e91f54,0x2010f9c5,0x0a149eb7
	.word  0x7521c8f3,0x180c6a46,0x41504f77,0x92dec8bc
	.word  0xdea33095,0xfea39481,0x6dc9f1bf,0x1234c248
	.word  0xbdd7f7d3,0xab8d4649,0x585e01cc,0xcd9b8b45
	.word  0x1ef69527,0xf2add0bd,0x73b0a75b,0xef7907c2
	.word  0x9ad8da0e,0xe5572bb9,0xfef5f85c,0x7c84028a
	.word  0x8b5be52c,0x014c7d36,0xa08aed62,0x2dcd4da8
	.word  0xb79e4055,0x77f2ad2c,0xbdf27e4b,0x9bacf518
	.word  0xe78a0494,0x3b8e1a09,0x7f0d04ca,0xea369906
	.word  0x08c1deaf,0x9e306be0,0x7b9d0dfe,0xacc04723
	.word  0x59779637,0xcb53f59b,0xc6056540,0xf88680c2
	.word  0xad91f759,0x272ee8a6,0x50a50f9d,0x0b45643d
	.word  0x5a58b41e,0xd883be87,0xce3c543b,0xb12a4e77
	.word  0x499eda08,0xb3675f2c,0xbb1996f5,0xf7e5ad34
	.word  0xf0aa39ea,0x186e9efe,0xa8731350,0xb5947c33
	.word  0xff19d583,0x8ffbf011,0x1f7db14b,0x81a62a84
	.word  0xe9bc424d,0x88505988,0xa82ee70e,0x04fa8ec3
	.word  0x977a995a,0x7c579744,0xe1a0c2d0,0x701e3a19
	.word  0xed8b218d,0xf0955e4b,0x1801c6e2,0x71a0e0a5
	.word  0xf55de5ce,0xee520edd,0x18efb125,0x3ef92e4f
	.word  0x4b5d4bb6,0xf1db1b7c,0x406ccaac,0x81f42b5c
	.word  0xd8f8c40e,0xb8cba5a7,0x3a78647e,0xbd15ebdf
	.word  0xc87615a6,0x648d0f89,0x217b2456,0xd3c0f7e3
	.word  0x1df4a073,0xb5b5d80a,0xe264e922,0x6f253bc0
	.word  0x8a8fffca,0x9fbffe9f,0x4ceb489e,0xd4f77936
	.word  0xd9d15f12,0x7a07f467,0xabb123da,0xe7ed50ec
	.word  0xd4e846de,0x3ce159a2,0x3fe5c811,0xd1ad8c91
	.word  0x9fb559a3,0x2442482e,0x82e47741,0x745a60de
	.word  0xf0c1511b,0x67058730,0x512097a6,0xc94ba301
	.word  0xdc649a50,0x911f7eb1,0x852040b0,0x37c285cc
	.word  0x9d692112,0x216cb0df,0x7ea7da1f,0x70ce925a
	.word  0x48de2094,0x55b25d48,0x72252b0b,0x23111aec
	.word  0x0cb830b5,0xb287a245,0x0fff5393,0xfce98b90
	.word  0x969fef11,0x38165f12,0x6a731d3a,0x3dbc659c
	.word  0x1e85c5c7,0xb7f836fa,0x58533aa7,0x8cf01ee2
	.word  0x8da253e4,0xee19e50a,0xfceee309,0x8025485d
	.word  0x4bfadb64,0xedfe835c,0xfcf20e09,0x92bdb98a
	.word  0x063a44d0,0xf4c487e9,0x64540513,0x7cc85b79
	.word  0x4c1ab14a,0x8cc0f9aa,0x0c33a01f,0x95ca8d30
	.word  0x9e7f8d66,0x186bbeb7,0xaaf13734,0xc7d52258
	.word  0x506f7a19,0x57ab8b10,0x7efdc0bb,0x9b824390
	.word  0x74a2907f,0x23ec9051,0x71fb41c3,0x3b86e89f
	.word  0xe326e856,0x8e745c7c,0xb0b7fac7,0x9c2866a1
	.word  0xf9c33306,0x00a82e7f,0xee9150b6,0x2c3787ec
	.word  0x91e772d4,0x17f6c24e,0xb84b40df,0x71fa8369
	.word  0xe0f34222,0x1ed25ea1,0x75623741,0x90adfa80
	.word  0xfcb18236,0xc411b138,0xd1492fd6,0x0affc613
	.word  0x6af39313,0x4e4784e8,0x119f5af0,0x3a645c92
	.word  0xbf700a8f,0x31ede004,0x64b8d79d,0x7d3475e3
	.word  0xb546719e,0x322a0deb,0xfd1f813d,0x70c0e88c
	.word  0x06e7d469,0x5a26fc2a,0xffe0859c,0xdc3e71d9
	.word  0x7461a5ed,0x36f6e736,0x97dbcb72,0x409474a2
	.word  0x00dec18f,0xd51556a0,0x520cc541,0x9cd6d048
	.word  0xa81b2b04,0x1a4be20c,0xe8952763,0x266b618c
	.word  0x3aed3da3,0xe57f323a,0x6d868721,0x0cfec961
	.word  0x4de2db59,0x928fdffd,0xd5712610,0x37b99956
	.word  0xef4453bf,0xfc94a3b6,0xd6d4c1db,0xb80402e4
	.word  0x4d2a3cea,0x9e397931,0xcfe0ac27,0x19905203
	.word  0xd3392896,0xa2de9042,0xceb0022d,0x4754f433
	.word  0x1dfa143c,0x8405e129,0x983b056a,0x2a07c1e5
	.word  0x9edc263a,0x81ad490f,0xb0553102,0xb7c926bd
	.word  0x22a6efee,0xb6d86595,0x48e8eab3,0x91bc70ac
	.word  0xa0c55bdc,0x516c7cd9,0xdb476cef,0xce615fb1
	.word  0xa8845d2c,0xcbada3a3,0xaf9796c5,0xbc76b78c
	.word  0xd9e0c81f,0x98931219,0x526a5bdf,0x2e121899
	.word  0x0ae547d8,0x742bc895,0xc622a445,0x35f858b4
	.word  0x2b88cdb2,0xa84a8c28,0x103859b6,0x7f5f8986
	.word  0xbc5c245d,0x3ba23873,0xcd72e96d,0xdb8de160
	.word  0x9a5e1a81,0x6f8acc32,0xd291369e,0x7527d32d
	.word  0x7c77bc0a,0xd86c21a9,0x358b2c65,0xc756ce42
	.word  0x49e2fbdc,0x963595bb,0xa4789a53,0x4e42135d
	.word  0x98109cbe,0xd9d7f222,0x574e9108,0x65ff8ad0
	.word  0x5b01ac5d,0xe1438c55,0x8cff0f21,0xd8519192
	.word  0xa169c15b,0xd5676ab4,0x33a97e0a,0x3fec2158
	.word  0x3e9ac61c,0xc756df74,0xcd37b9c1,0x673d43f5
	.word  0xccee2c06,0xc5532163,0xb76694b7,0xef647ac1
	.word  0x2fd08131,0x4751e3d1,0x030395ba,0x5d8e905a
	.word  0x0b3fd2c7,0xf8f3f064,0x5a83db2f,0xb1267a3f
	.word  0x0806a200,0xc1168765,0xd486960e,0x8d7cf844
	.word  0x9276b6c0,0xca5c2ce4,0xa9c0b43e,0x383af429
	.word  0x50d4eccd,0x96e60da2,0x0fa75aa9,0xf23364e2
	.word  0xb3bdf964,0x45d171ae,0x661f07b3,0x115ec721
	.word  0x87a4153a,0x9d900b20,0x405344d4,0x6ee11e37
	.word  0xa398e2c0,0x6f7a8b68,0x0c37a2e1,0x0d9d0d0e
	.word  0x105e63ef,0xb719da85,0x4488d568,0xa2291f4e
	.word  0xe0a77699,0x1aceae42,0x4159d39e,0x466a5a13
	.word  0x855369f9,0xbd14576c,0xed459f78,0x32ae3770
	.word  0xba47c99f,0x4550282a,0x2710f13f,0x51111bb2
	.word  0xf6c7b344,0x15cd09c0,0x75692b78,0xe2a21d17
	.word  0xc97eb235,0x47921298,0x4fb56978,0x5d71e249
	.word  0x98193835,0x33b68e2e,0xc897795a,0x6db2bf3f
	.word  0x360ebf70,0x5b94cd6d,0x2117a29c,0x3ce6bd37
	.word  0xd888e592,0x6e2cf353,0x453769c9,0x19c87a57
	.word  0x535b2c57,0x2437462f,0x6586b407,0x45128fcc
	.word  0xe87a6693,0x455d9e89,0x05481a7b,0x85d43489
	.word  0xb8bd7df9,0x68a0b868,0x82399265,0x08f89606
	.word  0xcc0a0512,0x09ecf593,0x259b3ba5,0x4a1d3731
	.word  0xce6a6156,0x92397511,0x228dd00a,0xeae05f63
	.word  0x62e0f865,0x56095d6a,0xe618d188,0x519857d6
	.word  0x30aa91e0,0xbc26c90d,0xd389e1a6,0x328d3697
	.word  0x56d1b5b8,0xc77db301,0x8395c2f8,0xcb7701bd
	.word  0x56e569ae,0x8a885a12,0x6b961267,0x62f769fb
	.word  0x5577de74,0xacdd9280,0x6cf9c919,0x16ca6d68
	.word  0xafed87b9,0x80abe3fc,0xb0df8c8f,0x5ba226d9
	.word  0x0febbda0,0xbbe5269d,0x4d31df12,0x83335c91



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
!!#  	       IJ_generate_from_token (10, th_div, ijdefault, tUDIV_I, tUDIV_R, 
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
!!# //     bitnum = random () % 72;
!!#      bitnum = random () % 70;
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

