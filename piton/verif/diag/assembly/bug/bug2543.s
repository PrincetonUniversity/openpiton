// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug2543.s
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
   random seed:	103820800
   Jal stb6.j:	
********************************************************************************/

#ifndef OVERRIDE_THREAD_COUNT
# define THREAD_COUNT 4
#endif
#define MAIN_PAGE_HV_ALSO
#include "hboot.s"

!SIMS: -non_shared
!SIMS: +spis

.text
.global main
.global th_main_0
.global th_main_1
.global th_main_2
.global th_main_3

main:

	th_fork(th_main)

th_main_0:
	setx  0x30cf1522026b2f10, %r1, %r1
	setx  0xfe4a009c096a4670, %r1, %r2
	setx  0xac967b8c0fc1f3a0, %r1, %r3
	setx  0xe49b5eaf0c523ef8, %r1, %r6
	setx  0xb7aa3a9c0b3022a8, %r1, %r7
	setx  0xede4623107053eb8, %r1, %r8
	setx  0x76498c5801cdb220, %r1, %r9
	setx  0xdcf82fd07abb1abe, %r1, %r13
	setx  0x24e46b908d39aff4, %r1, %r14
	setx  0xef0c6320a819ad10, %r1, %r15
	setx  0x79eb0a80b428f5ab, %r1, %r16
	setx  0xf92fc6c027cc8121, %r1, %r17
	setx  0x16dba1a0d11e3614, %r1, %r18
	setx  0x25ef1f20a2dce480, %r1, %r19
	setx  0x47f609e089ead2b5, %r1, %r20
	setx  0xf9f248b035e76a0a, %r1, %r21
	setx  0x8f1677405a1310f2, %r1, %r22
	setx  0xa89b239095669980, %r1, %r23
	setx  0x52c6fb1085867705, %r1, %r24
	setx  0x4130c9108675dcda, %r1, %r25
	setx  0xfae60f506a96828d, %r1, %r26
	setx  0xccb67c30b17caeab, %r1, %r27
	setx  0x15354f902e9374c6, %r1, %r28
	setx  0xe280e80083bf03eb, %r1, %r29
	setx  0xda089f3020abf47e, %r1, %r30
	setx  0x7bcfb9d0bc63dc07, %r1, %r31
	setx  0x2547797ed27d2570, %r1, %r13
	setx  0xb000ff527d8d8a97, %r1, %r14
	setx  0xf2ac44b34a95c892, %r1, %r15
	setx  0x6c7d0f3a7f4adea0, %r1, %r16
	setx  0xe626b1e5f5e24a44, %r1, %r17
	setx  0x075c9e9bbc05d0cc, %r1, %r18
	setx  0x7e29676252fb94a0, %r1, %r19
	setx  0xab5964de48164ec0, %r1, %r20
	setx  0x367d41095e43c0be, %r1, %r21
	setx  0xa95fa457180e688d, %r1, %r22
	setx  0x1b2f197aa85f8368, %r1, %r23
	setx  0xaea5826252c8fbfc, %r1, %r24
	setx  0xb72e34ed479848b0, %r1, %r25
	setx  0x44d02635314bfd71, %r1, %r26
	setx  0x54cea11c1c669d05, %r1, %r27
	setx  0xd83841cdfed24c54, %r1, %r28
	setx  0x6aa32d0e64f69eb3, %r1, %r29
	setx  0x4c62a39fde1086a5, %r1, %r30
	setx  0x5fe7f10ace511051, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000d00, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xec290005  ! 12: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe8710005  ! 12: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xe03127f8  ! 12: STH_I	sth	%r16, [%r4 + 0x07f8]
	.word 0xe4210005  ! 12: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xee210005  ! 12: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xd4312f8a  ! 12: STH_I	sth	%r10, [%r4 + 0x0f8a]
	.word 0xea212198  ! 12: STW_I	stw	%r21, [%r4 + 0x0198]
	.word 0xea2928be  ! 12: STB_I	stb	%r21, [%r4 + 0x08be]
	.word 0x06800003  ! 12: BL	bl  	<label_0x3>
	.word 0xd6f24ce8  ! 12: STXA_R	stxa	%r11, [%r9 + %r8] 0x67
	.word 0xea290005  ! 22: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe4290005  ! 22: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe0210005  ! 22: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xd8312676  ! 22: STH_I	sth	%r12, [%r4 + 0x0676]
	.word 0xd831214a  ! 22: STH_I	sth	%r12, [%r4 + 0x014a]
	.word 0xde292bbf  ! 22: STB_I	stb	%r15, [%r4 + 0x0bbf]
	.word 0xd8210005  ! 22: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xda31202e  ! 22: STH_I	sth	%r13, [%r4 + 0x002e]
	.word 0x26800001  ! 22: BL	bl,a	<label_0x1>
	.word 0xd6f00ce6  ! 22: STXA_R	stxa	%r11, [%r0 + %r6] 0x67
	.word 0xe2290005  ! 32: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc310005  ! 32: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xfa712828  ! 32: STX_I	stx	%r29, [%r4 + 0x0828]
	.word 0xea310005  ! 32: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xe6310005  ! 32: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xe2712ce8  ! 32: STX_I	stx	%r17, [%r4 + 0x0ce8]
	.word 0xfa31226a  ! 32: STH_I	sth	%r29, [%r4 + 0x026a]
	.word 0xf2210005  ! 32: STW_R	stw	%r25, [%r4 + %r5]
	.word 0x26c10001  ! 32: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xd831274e  ! 32: STH_I	sth	%r12, [%r4 + 0x074e]
	.word 0xde290005  ! 41: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe8710005  ! 41: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xdc292442  ! 41: STB_I	stb	%r14, [%r4 + 0x0442]
	.word 0xde292bb1  ! 41: STB_I	stb	%r15, [%r4 + 0x0bb1]
	.word 0xf2712cf0  ! 41: STX_I	stx	%r25, [%r4 + 0x0cf0]
	.word 0xdc290005  ! 41: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xe6212a1c  ! 41: STW_I	stw	%r19, [%r4 + 0x0a1c]
	.word 0x0ec10001  ! 41: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd8f00ce1  ! 41: STXA_R	stxa	%r12, [%r0 + %r1] 0x67
	.word 0xe6290005  ! 50: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe4712ae8  ! 50: STX_I	stx	%r18, [%r4 + 0x0ae8]
	.word 0xe2710005  ! 50: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xf8212598  ! 50: STW_I	stw	%r28, [%r4 + 0x0598]
	.word 0xea212590  ! 50: STW_I	stw	%r21, [%r4 + 0x0590]
	.word 0xfa710005  ! 50: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xde312ae6  ! 50: STH_I	sth	%r15, [%r4 + 0x0ae6]
	.word 0x24800003  ! 50: BLE	ble,a	<label_0x3>
	.word 0xee712610  ! 50: STX_I	stx	%r23, [%r4 + 0x0610]
	.word 0xdc290005  ! 59: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xec292af3  ! 59: STB_I	stb	%r22, [%r4 + 0x0af3]
	.word 0xe0710005  ! 59: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xf8290005  ! 59: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd6292fa2  ! 59: STB_I	stb	%r11, [%r4 + 0x0fa2]
	.word 0xda712b20  ! 59: STX_I	stx	%r13, [%r4 + 0x0b20]
	.word 0xfe7123a8  ! 59: STX_I	stx	%r31, [%r4 + 0x03a8]
	.word 0x3e800001  ! 59: BVC	bvc,a	<label_0x1>
	.word 0xdaf91005  ! 59: SWAPA_R	swapa	%r13, [%r4 + %r5] 0x80
	.word 0xdc290005  ! 68: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xde710005  ! 68: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xd83129ba  ! 68: STH_I	sth	%r12, [%r4 + 0x09ba]
	.word 0xec312a4a  ! 68: STH_I	sth	%r22, [%r4 + 0x0a4a]
	.word 0xf02926da  ! 68: STB_I	stb	%r24, [%r4 + 0x06da]
	.word 0xe4710005  ! 68: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfe210005  ! 68: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x30800003  ! 68: BA	ba,a	<label_0x3>
	.word 0xd6f1cce3  ! 68: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xd6290005  ! 77: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xee312fd6  ! 77: STH_I	sth	%r23, [%r4 + 0x0fd6]
	.word 0xf8310005  ! 77: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xfa312e3a  ! 77: STH_I	sth	%r29, [%r4 + 0x0e3a]
	.word 0xd4312d58  ! 77: STH_I	sth	%r10, [%r4 + 0x0d58]
	.word 0xe2210005  ! 77: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xd4290005  ! 77: STB_R	stb	%r10, [%r4 + %r5]
	.word 0x14800001  ! 77: BG	bg  	<label_0x1>
	.word 0xd6f08966  ! 77: STXA_R	stxa	%r11, [%r2 + %r6] 0x4b
	.word 0xea290005  ! 86: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf2290005  ! 86: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe4312994  ! 86: STH_I	sth	%r18, [%r4 + 0x0994]
	.word 0xf8290005  ! 86: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf4712170  ! 86: STX_I	stx	%r26, [%r4 + 0x0170]
	.word 0xec290005  ! 86: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfa212fb8  ! 86: STW_I	stw	%r29, [%r4 + 0x0fb8]
	.word 0x06c10001  ! 86: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd8f18ce2  ! 86: STXA_R	stxa	%r12, [%r6 + %r2] 0x67
	.word 0xfa290005  ! 96: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf4292237  ! 96: STB_I	stb	%r26, [%r4 + 0x0237]
	.word 0xee290005  ! 96: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfe710005  ! 96: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xfc312a64  ! 96: STH_I	sth	%r30, [%r4 + 0x0a64]
	.word 0xde290005  ! 96: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd6212e74  ! 96: STW_I	stw	%r11, [%r4 + 0x0e74]
	.word 0xe031229c  ! 96: STH_I	sth	%r16, [%r4 + 0x029c]
	.word 0x18800003  ! 96: BGU	bgu  	<label_0x3>
	.word 0xe8b91005  ! 96: STDA_R	stda	%r20, [%r4 + %r5] 0x80
	.word 0xea290005  ! 105: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd4210005  ! 105: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xdc212eb8  ! 105: STW_I	stw	%r14, [%r4 + 0x0eb8]
	.word 0xea310005  ! 105: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xde290005  ! 105: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe4310005  ! 105: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xe8290005  ! 105: STB_R	stb	%r20, [%r4 + %r5]
	.word 0x3c800001  ! 105: BPOS	bpos,a	<label_0x1>
	.word 0xd6f20ce1  ! 105: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
	.word 0xe2290005  ! 114: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xea310005  ! 114: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xd4310005  ! 114: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xde212150  ! 114: STW_I	stw	%r15, [%r4 + 0x0150]
	.word 0xfa290005  ! 114: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe8210005  ! 114: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xfa312d2c  ! 114: STH_I	sth	%r29, [%r4 + 0x0d2c]
	.word 0x06c10001  ! 114: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xfd210005  ! 114: STF_R	st	%f30, [%r5, %r4]
	.word 0xd4290005  ! 123: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xec290005  ! 123: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xea710005  ! 123: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf4290005  ! 123: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf02923ab  ! 123: STB_I	stb	%r24, [%r4 + 0x03ab]
	.word 0xd8310005  ! 123: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xdc710005  ! 123: STX_R	stx	%r14, [%r4 + %r5]
	.word 0x3e800001  ! 123: BVC	bvc,a	<label_0x1>
	.word 0xdb210005  ! 123: STF_R	st	%f13, [%r5, %r4]
	.word 0xd6290005  ! 133: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd4310005  ! 133: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xdc712ba8  ! 133: STX_I	stx	%r14, [%r4 + 0x0ba8]
	.word 0xd8290005  ! 133: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xfe210005  ! 133: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xee310005  ! 133: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xdc712808  ! 133: STX_I	stx	%r14, [%r4 + 0x0808]
	.word 0xe0292017  ! 133: STB_I	stb	%r16, [%r4 + 0x0017]
	.word 0x2a800001  ! 133: BCS	bcs,a	<label_0x1>
	.word 0xd4b1251e  ! 133: STHA_I	stha	%r10, [%r4 + 0x051e] %asi
	.word 0xe2290005  ! 143: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfe290005  ! 143: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xec2924b1  ! 143: STB_I	stb	%r22, [%r4 + 0x04b1]
	.word 0xee712380  ! 143: STX_I	stx	%r23, [%r4 + 0x0380]
	.word 0xea210005  ! 143: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xdc712500  ! 143: STX_I	stx	%r14, [%r4 + 0x0500]
	.word 0xf82129e8  ! 143: STW_I	stw	%r28, [%r4 + 0x09e8]
	.word 0xf4212924  ! 143: STW_I	stw	%r26, [%r4 + 0x0924]
	.word 0x3e800001  ! 143: BVC	bvc,a	<label_0x1>
	.word 0xd6f20ce3  ! 143: STXA_R	stxa	%r11, [%r8 + %r3] 0x67
	.word 0xd8290005  ! 153: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xfc710005  ! 153: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xd4212350  ! 153: STW_I	stw	%r10, [%r4 + 0x0350]
	.word 0xdc710005  ! 153: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf8712b28  ! 153: STX_I	stx	%r28, [%r4 + 0x0b28]
	.word 0xf6710005  ! 153: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe6710005  ! 153: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xea712170  ! 153: STX_I	stx	%r21, [%r4 + 0x0170]
	.word 0x28800001  ! 153: BLEU	bleu,a	<label_0x1>
	.word 0xd8f20980  ! 153: STXA_R	stxa	%r12, [%r8 + %r0] 0x4c
	.word 0xe4290005  ! 162: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe6312dde  ! 162: STH_I	sth	%r19, [%r4 + 0x0dde]
	.word 0xe4710005  ! 162: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe6310005  ! 162: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xd4212e60  ! 162: STW_I	stw	%r10, [%r4 + 0x0e60]
	.word 0xde310005  ! 162: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xee710005  ! 162: STX_R	stx	%r23, [%r4 + %r5]
	.word 0x04c90001  ! 162: BRLEZ	brlez  ,pt	%4,<label_0x90001>
	.word 0xe8f12190  ! 162: STXA_I	stxa	%r20, [%r4 + 0x0190] %asi
	.word 0xf6290005  ! 172: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xec212d20  ! 172: STW_I	stw	%r22, [%r4 + 0x0d20]
	.word 0xf0310005  ! 172: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xee210005  ! 172: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfc710005  ! 172: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xfc3122a0  ! 172: STH_I	sth	%r30, [%r4 + 0x02a0]
	.word 0xe2212cc0  ! 172: STW_I	stw	%r17, [%r4 + 0x0cc0]
	.word 0xda710005  ! 172: STX_R	stx	%r13, [%r4 + %r5]
	.word 0x1e800001  ! 172: BVC	bvc  	<label_0x1>
	.word 0xe02124d0  ! 172: STW_I	stw	%r16, [%r4 + 0x04d0]
	.word 0xdc290005  ! 181: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd8712f40  ! 181: STX_I	stx	%r12, [%r4 + 0x0f40]
	.word 0xf4212780  ! 181: STW_I	stw	%r26, [%r4 + 0x0780]
	.word 0xd8712288  ! 181: STX_I	stx	%r12, [%r4 + 0x0288]
	.word 0xe8210005  ! 181: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe2290005  ! 181: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfa312e7e  ! 181: STH_I	sth	%r29, [%r4 + 0x0e7e]
	.word 0x0ec90003  ! 181: BRGEZ	brgez  ,pt	%4,<label_0x90003>
	.word 0xd7390005  ! 181: STDF_R	std	%f11, [%r5, %r4]
	.word 0xd8290005  ! 190: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xea712e60  ! 190: STX_I	stx	%r21, [%r4 + 0x0e60]
	.word 0xde212e7c  ! 190: STW_I	stw	%r15, [%r4 + 0x0e7c]
	.word 0xfe292587  ! 190: STB_I	stb	%r31, [%r4 + 0x0587]
	.word 0xfc29267b  ! 190: STB_I	stb	%r30, [%r4 + 0x067b]
	.word 0xe0710005  ! 190: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd6212e48  ! 190: STW_I	stw	%r11, [%r4 + 0x0e48]
	.word 0x26800003  ! 190: BL	bl,a	<label_0x3>
	.word 0xdde11005  ! 190: CASA_I	casa	[%r4] 0x80, %r5, %r14
	.word 0xee290005  ! 200: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf829287f  ! 200: STB_I	stb	%r28, [%r4 + 0x087f]
	.word 0xe8710005  ! 200: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf2712b68  ! 200: STX_I	stx	%r25, [%r4 + 0x0b68]
	.word 0xe6210005  ! 200: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xec310005  ! 200: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe23122b8  ! 200: STH_I	sth	%r17, [%r4 + 0x02b8]
	.word 0xd4312236  ! 200: STH_I	sth	%r10, [%r4 + 0x0236]
	.word 0x2ec90001  ! 200: BRGEZ	brgez,a,pt	%4,<label_0x90001>
	.word 0xd6f08ce0  ! 200: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
	.word 0xd8290005  ! 209: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xda210005  ! 209: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xea7124c0  ! 209: STX_I	stx	%r21, [%r4 + 0x04c0]
	.word 0xec2127e8  ! 209: STW_I	stw	%r22, [%r4 + 0x07e8]
	.word 0xe0210005  ! 209: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xdc212d24  ! 209: STW_I	stw	%r14, [%r4 + 0x0d24]
	.word 0xee310005  ! 209: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x02800001  ! 209: BE	be  	<label_0x1>
	.word 0xdaf11005  ! 209: STXA_R	stxa	%r13, [%r4 + %r5] 0x80
	.word 0xda290005  ! 219: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xee312752  ! 219: STH_I	sth	%r23, [%r4 + 0x0752]
	.word 0xde210005  ! 219: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xd8712cf0  ! 219: STX_I	stx	%r12, [%r4 + 0x0cf0]
	.word 0xe2290005  ! 219: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe2290005  ! 219: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf0710005  ! 219: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xf6312862  ! 219: STH_I	sth	%r27, [%r4 + 0x0862]
	.word 0x04800001  ! 219: BLE	ble  	<label_0x1>
	.word 0xf4b1288e  ! 219: STHA_I	stha	%r26, [%r4 + 0x088e] %asi
	.word 0xde290005  ! 229: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd4292588  ! 229: STB_I	stb	%r10, [%r4 + 0x0588]
	.word 0xec290005  ! 229: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xee2127d0  ! 229: STW_I	stw	%r23, [%r4 + 0x07d0]
	.word 0xd6712050  ! 229: STX_I	stx	%r11, [%r4 + 0x0050]
	.word 0xea290005  ! 229: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe2290005  ! 229: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf429291e  ! 229: STB_I	stb	%r26, [%r4 + 0x091e]
	.word 0x28800003  ! 229: BLEU	bleu,a	<label_0x3>
	.word 0xd6f00982  ! 229: STXA_R	stxa	%r11, [%r0 + %r2] 0x4c
	.word 0xf2290005  ! 238: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xde312e5e  ! 238: STH_I	sth	%r15, [%r4 + 0x0e5e]
	.word 0xf8310005  ! 238: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf6290005  ! 238: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe0712f78  ! 238: STX_I	stx	%r16, [%r4 + 0x0f78]
	.word 0xd4310005  ! 238: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xd6312e86  ! 238: STH_I	sth	%r11, [%r4 + 0x0e86]
	.word 0x0ac10001  ! 238: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xd6f0c961  ! 238: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xf2290005  ! 247: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe23129ea  ! 247: STH_I	sth	%r17, [%r4 + 0x09ea]
	.word 0xf4312160  ! 247: STH_I	sth	%r26, [%r4 + 0x0160]
	.word 0xf6290005  ! 247: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf2710005  ! 247: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xee2122d8  ! 247: STW_I	stw	%r23, [%r4 + 0x02d8]
	.word 0xee290005  ! 247: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x38800001  ! 247: BGU	bgu,a	<label_0x1>
	.word 0xd6f0c980  ! 247: STXA_R	stxa	%r11, [%r3 + %r0] 0x4c
	.word 0xf2290005  ! 256: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe6210005  ! 256: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd4312a14  ! 256: STH_I	sth	%r10, [%r4 + 0x0a14]
	.word 0xec310005  ! 256: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xf6312ab2  ! 256: STH_I	sth	%r27, [%r4 + 0x0ab2]
	.word 0xf2212f30  ! 256: STW_I	stw	%r25, [%r4 + 0x0f30]
	.word 0xee290005  ! 256: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x04c10001  ! 256: BRLEZ	brlez  ,nt	%4,<label_0x10001>
	.word 0xd6f04ce2  ! 256: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xfe290005  ! 266: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xd43126fe  ! 266: STH_I	sth	%r10, [%r4 + 0x06fe]
	.word 0xf6310005  ! 266: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xd8710005  ! 266: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xd6210005  ! 266: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xd629292b  ! 266: STB_I	stb	%r11, [%r4 + 0x092b]
	.word 0xde212d88  ! 266: STW_I	stw	%r15, [%r4 + 0x0d88]
	.word 0xd6310005  ! 266: STH_R	sth	%r11, [%r4 + %r5]
	.word 0x32800001  ! 266: BNE	bne,a	<label_0x1>
	.word 0xd8f0c960  ! 266: STXA_R	stxa	%r12, [%r3 + %r0] 0x4b
	.word 0xd8290005  ! 275: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xec29240f  ! 275: STB_I	stb	%r22, [%r4 + 0x040f]
	.word 0xe0212454  ! 275: STW_I	stw	%r16, [%r4 + 0x0454]
	.word 0xe4290005  ! 275: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe8710005  ! 275: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xdc210005  ! 275: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xf6710005  ! 275: STX_R	stx	%r27, [%r4 + %r5]
	.word 0x3a800003  ! 275: BCC	bcc,a	<label_0x3>
	.word 0xd8f00ce2  ! 275: STXA_R	stxa	%r12, [%r0 + %r2] 0x67
	.word 0xec290005  ! 284: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xde712bc8  ! 284: STX_I	stx	%r15, [%r4 + 0x0bc8]
	.word 0xda2129e0  ! 284: STW_I	stw	%r13, [%r4 + 0x09e0]
	.word 0xd6210005  ! 284: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xe0310005  ! 284: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xd829214c  ! 284: STB_I	stb	%r12, [%r4 + 0x014c]
	.word 0xf2312b1a  ! 284: STH_I	sth	%r25, [%r4 + 0x0b1a]
	.word 0x38800003  ! 284: BGU	bgu,a	<label_0x3>
	.word 0xe5210005  ! 284: STF_R	st	%f18, [%r5, %r4]
	.word 0xee290005  ! 294: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf4712fb8  ! 294: STX_I	stx	%r26, [%r4 + 0x0fb8]
	.word 0xfc712b68  ! 294: STX_I	stx	%r30, [%r4 + 0x0b68]
	.word 0xd4310005  ! 294: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xfa31216a  ! 294: STH_I	sth	%r29, [%r4 + 0x016a]
	.word 0xe6210005  ! 294: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf2292476  ! 294: STB_I	stb	%r25, [%r4 + 0x0476]
	.word 0xf2712eb8  ! 294: STX_I	stx	%r25, [%r4 + 0x0eb8]
	.word 0x20800003  ! 294: BN	bn,a	<label_0x3>
	.word 0xd6f0cce8  ! 294: STXA_R	stxa	%r11, [%r3 + %r8] 0x67
	.word 0xec290005  ! 304: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd62928df  ! 304: STB_I	stb	%r11, [%r4 + 0x08df]
	.word 0xd43129b4  ! 304: STH_I	sth	%r10, [%r4 + 0x09b4]
	.word 0xfe21242c  ! 304: STW_I	stw	%r31, [%r4 + 0x042c]
	.word 0xe6210005  ! 304: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe2292648  ! 304: STB_I	stb	%r17, [%r4 + 0x0648]
	.word 0xf67122c8  ! 304: STX_I	stx	%r27, [%r4 + 0x02c8]
	.word 0xf6290005  ! 304: STB_R	stb	%r27, [%r4 + %r5]
	.word 0x0e800001  ! 304: BVS	bvs  	<label_0x1>
	.word 0xf4a91005  ! 304: STBA_R	stba	%r26, [%r4 + %r5] 0x80
	.word 0xec290005  ! 314: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfc3121d0  ! 314: STH_I	sth	%r30, [%r4 + 0x01d0]
	.word 0xfc212dc4  ! 314: STW_I	stw	%r30, [%r4 + 0x0dc4]
	.word 0xf6290005  ! 314: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfc210005  ! 314: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xf8212ec8  ! 314: STW_I	stw	%r28, [%r4 + 0x0ec8]
	.word 0xfa712ab8  ! 314: STX_I	stx	%r29, [%r4 + 0x0ab8]
	.word 0xee712e80  ! 314: STX_I	stx	%r23, [%r4 + 0x0e80]
	.word 0x2c800001  ! 314: BNEG	bneg,a	<label_0x1>
	.word 0xe8a91005  ! 314: STBA_R	stba	%r20, [%r4 + %r5] 0x80
	.word 0xe6290005  ! 323: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xec290005  ! 323: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xda290005  ! 323: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf4710005  ! 323: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xe2292cc6  ! 323: STB_I	stb	%r17, [%r4 + 0x0cc6]
	.word 0xea310005  ! 323: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xf0290005  ! 323: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x04800001  ! 323: BLE	ble  	<label_0x1>
	.word 0xd6f00982  ! 323: STXA_R	stxa	%r11, [%r0 + %r2] 0x4c
	.word 0xec290005  ! 333: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf4710005  ! 333: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xe0212c34  ! 333: STW_I	stw	%r16, [%r4 + 0x0c34]
	.word 0xe0712888  ! 333: STX_I	stx	%r16, [%r4 + 0x0888]
	.word 0xe8210005  ! 333: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xf6312f66  ! 333: STH_I	sth	%r27, [%r4 + 0x0f66]
	.word 0xdc290005  ! 333: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfe7124c0  ! 333: STX_I	stx	%r31, [%r4 + 0x04c0]
	.word 0x3a800001  ! 333: BCC	bcc,a	<label_0x1>
	.word 0xd9e12005  ! 333: CASA_R	casa	[%r4] %asi, %r5, %r12
	.word 0xe6290005  ! 343: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xdc312a62  ! 343: STH_I	sth	%r14, [%r4 + 0x0a62]
	.word 0xf6290005  ! 343: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xee312efe  ! 343: STH_I	sth	%r23, [%r4 + 0x0efe]
	.word 0xda312b88  ! 343: STH_I	sth	%r13, [%r4 + 0x0b88]
	.word 0xe6310005  ! 343: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xe4710005  ! 343: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfa31266e  ! 343: STH_I	sth	%r29, [%r4 + 0x066e]
	.word 0x00800001  ! 343: BN	bn  	<label_0x1>
	.word 0xd6f08ce0  ! 343: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
	.word 0xda290005  ! 352: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xda290005  ! 352: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe0712d80  ! 352: STX_I	stx	%r16, [%r4 + 0x0d80]
	.word 0xf6210005  ! 352: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xde710005  ! 352: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf0312f5e  ! 352: STH_I	sth	%r24, [%r4 + 0x0f5e]
	.word 0xec290005  ! 352: STB_R	stb	%r22, [%r4 + %r5]
	.word 0x30800001  ! 352: BA	ba,a	<label_0x1>
	.word 0xd6f08982  ! 352: STXA_R	stxa	%r11, [%r2 + %r2] 0x4c
	.word 0xf8290005  ! 362: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xfa710005  ! 362: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xf0310005  ! 362: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xf6212ab0  ! 362: STW_I	stw	%r27, [%r4 + 0x0ab0]
	.word 0xf8290005  ! 362: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd4212900  ! 362: STW_I	stw	%r10, [%r4 + 0x0900]
	.word 0xe2712f40  ! 362: STX_I	stx	%r17, [%r4 + 0x0f40]
	.word 0xf0710005  ! 362: STX_R	stx	%r24, [%r4 + %r5]
	.word 0x2c800001  ! 362: BNEG	bneg,a	<label_0x1>
	.word 0xd8f1c963  ! 362: STXA_R	stxa	%r12, [%r7 + %r3] 0x4b
	.word 0xda290005  ! 372: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe02125f8  ! 372: STW_I	stw	%r16, [%r4 + 0x05f8]
	.word 0xd4710005  ! 372: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe2290005  ! 372: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xda710005  ! 372: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xd6312f74  ! 372: STH_I	sth	%r11, [%r4 + 0x0f74]
	.word 0xe82924dd  ! 372: STB_I	stb	%r20, [%r4 + 0x04dd]
	.word 0xd4210005  ! 372: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x1c800001  ! 372: BPOS	bpos  	<label_0x1>
	.word 0xd6f00ce6  ! 372: STXA_R	stxa	%r11, [%r0 + %r6] 0x67
	.word 0xf4290005  ! 382: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd8310005  ! 382: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xde712628  ! 382: STX_I	stx	%r15, [%r4 + 0x0628]
	.word 0xf0290005  ! 382: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf8212f84  ! 382: STW_I	stw	%r28, [%r4 + 0x0f84]
	.word 0xf22922f0  ! 382: STB_I	stb	%r25, [%r4 + 0x02f0]
	.word 0xfe710005  ! 382: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xda212e74  ! 382: STW_I	stw	%r13, [%r4 + 0x0e74]
	.word 0x2e800003  ! 382: BVS	bvs,a	<label_0x3>
	.word 0xd8f20983  ! 382: STXA_R	stxa	%r12, [%r8 + %r3] 0x4c
	.word 0xe4290005  ! 392: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xee2927d9  ! 392: STB_I	stb	%r23, [%r4 + 0x07d9]
	.word 0xfe310005  ! 392: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xd4292028  ! 392: STB_I	stb	%r10, [%r4 + 0x0028]
	.word 0xe0292da0  ! 392: STB_I	stb	%r16, [%r4 + 0x0da0]
	.word 0xe2290005  ! 392: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xea212b0c  ! 392: STW_I	stw	%r21, [%r4 + 0x0b0c]
	.word 0xf6212c14  ! 392: STW_I	stw	%r27, [%r4 + 0x0c14]
	.word 0x04c90003  ! 392: BRLEZ	brlez  ,pt	%4,<label_0x90003>
	.word 0xd8f0c986  ! 392: STXA_R	stxa	%r12, [%r3 + %r6] 0x4c
	.word 0xfa290005  ! 402: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf0710005  ! 402: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfc710005  ! 402: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xde290005  ! 402: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe6212458  ! 402: STW_I	stw	%r19, [%r4 + 0x0458]
	.word 0xe6292c17  ! 402: STB_I	stb	%r19, [%r4 + 0x0c17]
	.word 0xd6292c89  ! 402: STB_I	stb	%r11, [%r4 + 0x0c89]
	.word 0xe8210005  ! 402: STW_R	stw	%r20, [%r4 + %r5]
	.word 0x40000003  ! 402: CALL	call	disp30_3
	.word 0xd6f18ce6  ! 402: STXA_R	stxa	%r11, [%r6 + %r6] 0x67
	.word 0xde290005  ! 412: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe0290005  ! 412: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe2290005  ! 412: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xda292f0f  ! 412: STB_I	stb	%r13, [%r4 + 0x0f0f]
	.word 0xd6292139  ! 412: STB_I	stb	%r11, [%r4 + 0x0139]
	.word 0xf6310005  ! 412: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xde290005  ! 412: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf629211c  ! 412: STB_I	stb	%r27, [%r4 + 0x011c]
	.word 0x0a800001  ! 412: BCS	bcs  	<label_0x1>
	.word 0xd6f18ce0  ! 412: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xe6290005  ! 421: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xea312b88  ! 421: STH_I	sth	%r21, [%r4 + 0x0b88]
	.word 0xec210005  ! 421: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xe8310005  ! 421: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf831268e  ! 421: STH_I	sth	%r28, [%r4 + 0x068e]
	.word 0xd8290005  ! 421: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xec310005  ! 421: STH_R	sth	%r22, [%r4 + %r5]
	.word 0x22c90001  ! 421: BRZ	brz,a,pt	%4,<label_0x90001>
	.word 0xd8f08ce2  ! 421: STXA_R	stxa	%r12, [%r2 + %r2] 0x67
	.word 0xe8290005  ! 430: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xda2925b3  ! 430: STB_I	stb	%r13, [%r4 + 0x05b3]
	.word 0xda712db8  ! 430: STX_I	stx	%r13, [%r4 + 0x0db8]
	.word 0xe8312dbc  ! 430: STH_I	sth	%r20, [%r4 + 0x0dbc]
	.word 0xd6210005  ! 430: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xd6312abe  ! 430: STH_I	sth	%r11, [%r4 + 0x0abe]
	.word 0xe8312b70  ! 430: STH_I	sth	%r20, [%r4 + 0x0b70]
	.word 0x06800001  ! 430: BL	bl  	<label_0x1>
	.word 0xf6792110  ! 430: SWAP_I	swap	%r27, [%r4 + 0x0110]
	.word 0xe0290005  ! 440: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfc710005  ! 440: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf8210005  ! 440: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfe210005  ! 440: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xe2712280  ! 440: STX_I	stx	%r17, [%r4 + 0x0280]
	.word 0xfc710005  ! 440: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xec712058  ! 440: STX_I	stx	%r22, [%r4 + 0x0058]
	.word 0xf67127b0  ! 440: STX_I	stx	%r27, [%r4 + 0x07b0]
	.word 0x30800003  ! 440: BA	ba,a	<label_0x3>
	.word 0xd8f00ce6  ! 440: STXA_R	stxa	%r12, [%r0 + %r6] 0x67
	.word 0xe2290005  ! 450: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf07121e0  ! 450: STX_I	stx	%r24, [%r4 + 0x01e0]
	.word 0xfe712be0  ! 450: STX_I	stx	%r31, [%r4 + 0x0be0]
	.word 0xd4712f00  ! 450: STX_I	stx	%r10, [%r4 + 0x0f00]
	.word 0xde210005  ! 450: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe4312fd4  ! 450: STH_I	sth	%r18, [%r4 + 0x0fd4]
	.word 0xdc212004  ! 450: STW_I	stw	%r14, [%r4 + 0x0004]
	.word 0xdc290005  ! 450: STB_R	stb	%r14, [%r4 + %r5]
	.word 0x06c90003  ! 450: BRLZ	brlz  ,pt	%4,<label_0x90003>
	.word 0xd6f00ce1  ! 450: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xf6290005  ! 459: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xda212864  ! 459: STW_I	stw	%r13, [%r4 + 0x0864]
	.word 0xe2310005  ! 459: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xde710005  ! 459: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xee290005  ! 459: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe2290005  ! 459: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc310005  ! 459: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x3e800001  ! 459: BVC	bvc,a	<label_0x1>
	.word 0xd6f08ce3  ! 459: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xe8290005  ! 468: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf4210005  ! 468: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xec210005  ! 468: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xf8210005  ! 468: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xda31295e  ! 468: STH_I	sth	%r13, [%r4 + 0x095e]
	.word 0xf8310005  ! 468: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xe2212cf4  ! 468: STW_I	stw	%r17, [%r4 + 0x0cf4]
	.word 0x38800001  ! 468: BGU	bgu,a	<label_0x1>
	.word 0xda3123b6  ! 468: STH_I	sth	%r13, [%r4 + 0x03b6]
	.word 0xe8290005  ! 478: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfc210005  ! 478: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xde710005  ! 478: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf6710005  ! 478: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xf6312374  ! 478: STH_I	sth	%r27, [%r4 + 0x0374]
	.word 0xf821282c  ! 478: STW_I	stw	%r28, [%r4 + 0x082c]
	.word 0xe0210005  ! 478: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfc310005  ! 478: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x26c90001  ! 478: BRLZ	brlz,a,pt	%4,<label_0x90001>
	.word 0xd6f0c966  ! 478: STXA_R	stxa	%r11, [%r3 + %r6] 0x4b
	.word 0xde290005  ! 488: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe4312320  ! 488: STH_I	sth	%r18, [%r4 + 0x0320]
	.word 0xe2212138  ! 488: STW_I	stw	%r17, [%r4 + 0x0138]
	.word 0xde312ae4  ! 488: STH_I	sth	%r15, [%r4 + 0x0ae4]
	.word 0xde290005  ! 488: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe2310005  ! 488: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xfc292a8f  ! 488: STB_I	stb	%r30, [%r4 + 0x0a8f]
	.word 0xea290005  ! 488: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x04c90001  ! 488: BRLEZ	brlez  ,pt	%4,<label_0x90001>
	.word 0xd8f0c963  ! 488: STXA_R	stxa	%r12, [%r3 + %r3] 0x4b
	.word 0xf2290005  ! 497: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe2210005  ! 497: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xe6312864  ! 497: STH_I	sth	%r19, [%r4 + 0x0864]
	.word 0xec712f30  ! 497: STX_I	stx	%r22, [%r4 + 0x0f30]
	.word 0xee290005  ! 497: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd829260b  ! 497: STB_I	stb	%r12, [%r4 + 0x060b]
	.word 0xde710005  ! 497: STX_R	stx	%r15, [%r4 + %r5]
	.word 0x22c10001  ! 497: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xd6f20962  ! 497: STXA_R	stxa	%r11, [%r8 + %r2] 0x4b
	.word 0xda290005  ! 507: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xda3125c0  ! 507: STH_I	sth	%r13, [%r4 + 0x05c0]
	.word 0xee712e00  ! 507: STX_I	stx	%r23, [%r4 + 0x0e00]
	.word 0xe8290005  ! 507: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xec212980  ! 507: STW_I	stw	%r22, [%r4 + 0x0980]
	.word 0xf22923d5  ! 507: STB_I	stb	%r25, [%r4 + 0x03d5]
	.word 0xe6310005  ! 507: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xea290005  ! 507: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x1c800001  ! 507: BPOS	bpos  	<label_0x1>
	.word 0xd6f04980  ! 507: STXA_R	stxa	%r11, [%r1 + %r0] 0x4c
	.word 0xfc290005  ! 516: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe6210005  ! 516: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd6292eb8  ! 516: STB_I	stb	%r11, [%r4 + 0x0eb8]
	.word 0xe8312cac  ! 516: STH_I	sth	%r20, [%r4 + 0x0cac]
	.word 0xda712b38  ! 516: STX_I	stx	%r13, [%r4 + 0x0b38]
	.word 0xe2310005  ! 516: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xee712b30  ! 516: STX_I	stx	%r23, [%r4 + 0x0b30]
	.word 0x0e800001  ! 516: BVS	bvs  	<label_0x1>
	.word 0xd8f08967  ! 516: STXA_R	stxa	%r12, [%r2 + %r7] 0x4b
	.word 0xf6290005  ! 525: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe4290005  ! 525: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe4310005  ! 525: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf42123c4  ! 525: STW_I	stw	%r26, [%r4 + 0x03c4]
	.word 0xe8312fc0  ! 525: STH_I	sth	%r20, [%r4 + 0x0fc0]
	.word 0xda31257a  ! 525: STH_I	sth	%r13, [%r4 + 0x057a]
	.word 0xd4210005  ! 525: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x34800003  ! 525: BG	bg,a	<label_0x3>
	.word 0xd6f0c960  ! 525: STXA_R	stxa	%r11, [%r3 + %r0] 0x4b
	.word 0xe2290005  ! 534: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfe210005  ! 534: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xd8290005  ! 534: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe6710005  ! 534: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xf27127d8  ! 534: STX_I	stx	%r25, [%r4 + 0x07d8]
	.word 0xd8712d20  ! 534: STX_I	stx	%r12, [%r4 + 0x0d20]
	.word 0xf4310005  ! 534: STH_R	sth	%r26, [%r4 + %r5]
	.word 0x0ec90001  ! 534: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xd8f0c980  ! 534: STXA_R	stxa	%r12, [%r3 + %r0] 0x4c
	.word 0xdc290005  ! 543: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf6210005  ! 543: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xfc2929a3  ! 543: STB_I	stb	%r30, [%r4 + 0x09a3]
	.word 0xf8310005  ! 543: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf2310005  ! 543: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xee7129a8  ! 543: STX_I	stx	%r23, [%r4 + 0x09a8]
	.word 0xe2312ada  ! 543: STH_I	sth	%r17, [%r4 + 0x0ada]
	.word 0x10800001  ! 543: BA	ba  	<label_0x1>
	.word 0xe6292be6  ! 543: STB_I	stb	%r19, [%r4 + 0x0be6]
	.word 0xf6290005  ! 553: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfc290005  ! 553: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xda292f6c  ! 553: STB_I	stb	%r13, [%r4 + 0x0f6c]
	.word 0xfa710005  ! 553: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xd8310005  ! 553: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf2212c90  ! 553: STW_I	stw	%r25, [%r4 + 0x0c90]
	.word 0xf621215c  ! 553: STW_I	stw	%r27, [%r4 + 0x015c]
	.word 0xfe210005  ! 553: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x24c90003  ! 553: BRLEZ	brlez,a,pt	%4,<label_0x90003>
	.word 0xd4f92eb4  ! 553: SWAPA_I	swapa	%r10, [%r4 + 0x0eb4] %asi
	.word 0xe8290005  ! 563: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe6710005  ! 563: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe8212398  ! 563: STW_I	stw	%r20, [%r4 + 0x0398]
	.word 0xe0712280  ! 563: STX_I	stx	%r16, [%r4 + 0x0280]
	.word 0xdc210005  ! 563: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xfe710005  ! 563: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xee290005  ! 563: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe0710005  ! 563: STX_R	stx	%r16, [%r4 + %r5]
	.word 0x38800001  ! 563: BGU	bgu,a	<label_0x1>
	.word 0xea210005  ! 563: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xee290005  ! 572: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfc710005  ! 572: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xee712ba8  ! 572: STX_I	stx	%r23, [%r4 + 0x0ba8]
	.word 0xe0292bdc  ! 572: STB_I	stb	%r16, [%r4 + 0x0bdc]
	.word 0xd8292c24  ! 572: STB_I	stb	%r12, [%r4 + 0x0c24]
	.word 0xd8710005  ! 572: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xee292893  ! 572: STB_I	stb	%r23, [%r4 + 0x0893]
	.word 0x12800001  ! 572: BNE	bne  	<label_0x1>
	.word 0xf7392120  ! 572: STDF_I	std	%f27, [0x0120, %r4]
	.word 0xea290005  ! 582: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd4290005  ! 582: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xd47122d0  ! 582: STX_I	stx	%r10, [%r4 + 0x02d0]
	.word 0xf0712568  ! 582: STX_I	stx	%r24, [%r4 + 0x0568]
	.word 0xf02123cc  ! 582: STW_I	stw	%r24, [%r4 + 0x03cc]
	.word 0xdc312e44  ! 582: STH_I	sth	%r14, [%r4 + 0x0e44]
	.word 0xf2710005  ! 582: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xec7128e8  ! 582: STX_I	stx	%r22, [%r4 + 0x08e8]
	.word 0x3c800001  ! 582: BPOS	bpos,a	<label_0x1>
	.word 0xd6f24962  ! 582: STXA_R	stxa	%r11, [%r9 + %r2] 0x4b
	.word 0xd6290005  ! 591: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf4710005  ! 591: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xfe3122aa  ! 591: STH_I	sth	%r31, [%r4 + 0x02aa]
	.word 0xfa210005  ! 591: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xea712118  ! 591: STX_I	stx	%r21, [%r4 + 0x0118]
	.word 0xf27123b0  ! 591: STX_I	stx	%r25, [%r4 + 0x03b0]
	.word 0xd8710005  ! 591: STX_R	stx	%r12, [%r4 + %r5]
	.word 0x22800001  ! 591: BE	be,a	<label_0x1>
	.word 0xf9e11005  ! 591: CASA_I	casa	[%r4] 0x80, %r5, %r28
	.word 0xf4290005  ! 600: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xdc712860  ! 600: STX_I	stx	%r14, [%r4 + 0x0860]
	.word 0xfc7123a0  ! 600: STX_I	stx	%r30, [%r4 + 0x03a0]
	.word 0xea210005  ! 600: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xf6712e38  ! 600: STX_I	stx	%r27, [%r4 + 0x0e38]
	.word 0xda3128b4  ! 600: STH_I	sth	%r13, [%r4 + 0x08b4]
	.word 0xe27126a8  ! 600: STX_I	stx	%r17, [%r4 + 0x06a8]
	.word 0x06800003  ! 600: BL	bl  	<label_0x3>
	.word 0xd6f04ce0  ! 600: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xf0290005  ! 609: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xde290005  ! 609: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xdc712a38  ! 609: STX_I	stx	%r14, [%r4 + 0x0a38]
	.word 0xec310005  ! 609: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe4712fc0  ! 609: STX_I	stx	%r18, [%r4 + 0x0fc0]
	.word 0xf8210005  ! 609: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xe0310005  ! 609: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x0e800001  ! 609: BVS	bvs  	<label_0x1>
	.word 0xd6f00ce0  ! 609: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xee290005  ! 619: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf2290005  ! 619: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xdc210005  ! 619: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xea210005  ! 619: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xea212998  ! 619: STW_I	stw	%r21, [%r4 + 0x0998]
	.word 0xee712950  ! 619: STX_I	stx	%r23, [%r4 + 0x0950]
	.word 0xda292824  ! 619: STB_I	stb	%r13, [%r4 + 0x0824]
	.word 0xfe310005  ! 619: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x1e800003  ! 619: BVC	bvc  	<label_0x3>
	.word 0xd6f0cce7  ! 619: STXA_R	stxa	%r11, [%r3 + %r7] 0x67
	.word 0xf4290005  ! 628: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf0712448  ! 628: STX_I	stx	%r24, [%r4 + 0x0448]
	.word 0xe4710005  ! 628: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf831200e  ! 628: STH_I	sth	%r28, [%r4 + 0x000e]
	.word 0xe2310005  ! 628: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xf2310005  ! 628: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xe8310005  ! 628: STH_R	sth	%r20, [%r4 + %r5]
	.word 0x20800001  ! 628: BN	bn,a	<label_0x1>
	.word 0xdff11005  ! 628: CASXA_I	casxa	[%r4] 0x80, %r5, %r15
	.word 0xd4290005  ! 638: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf0310005  ! 638: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xf6292f9b  ! 638: STB_I	stb	%r27, [%r4 + 0x0f9b]
	.word 0xea21282c  ! 638: STW_I	stw	%r21, [%r4 + 0x082c]
	.word 0xd8210005  ! 638: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xea212dec  ! 638: STW_I	stw	%r21, [%r4 + 0x0dec]
	.word 0xea310005  ! 638: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xf4210005  ! 638: STW_R	stw	%r26, [%r4 + %r5]
	.word 0x2c800003  ! 638: BNEG	bneg,a	<label_0x3>
	.word 0xe4792f64  ! 638: SWAP_I	swap	%r18, [%r4 + 0x0f64]
	.word 0xdc290005  ! 648: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfe712a00  ! 648: STX_I	stx	%r31, [%r4 + 0x0a00]
	.word 0xf8312f7e  ! 648: STH_I	sth	%r28, [%r4 + 0x0f7e]
	.word 0xfc710005  ! 648: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf4292f4d  ! 648: STB_I	stb	%r26, [%r4 + 0x0f4d]
	.word 0xe2290005  ! 648: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe8290005  ! 648: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfe292e31  ! 648: STB_I	stb	%r31, [%r4 + 0x0e31]
	.word 0x06c90003  ! 648: BRLZ	brlz  ,pt	%4,<label_0x90003>
	.word 0xd8f04ce9  ! 648: STXA_R	stxa	%r12, [%r1 + %r9] 0x67
	.word 0xf6290005  ! 658: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xde710005  ! 658: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xfe210005  ! 658: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xfa710005  ! 658: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe6712a18  ! 658: STX_I	stx	%r19, [%r4 + 0x0a18]
	.word 0xe42123d4  ! 658: STW_I	stw	%r18, [%r4 + 0x03d4]
	.word 0xea210005  ! 658: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xf0712828  ! 658: STX_I	stx	%r24, [%r4 + 0x0828]
	.word 0x24800003  ! 658: BLE	ble,a	<label_0x3>
	.word 0xd8f18962  ! 658: STXA_R	stxa	%r12, [%r6 + %r2] 0x4b
	.word 0xd6290005  ! 668: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe2210005  ! 668: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xd63128a0  ! 668: STH_I	sth	%r11, [%r4 + 0x08a0]
	.word 0xf4710005  ! 668: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xfa292b86  ! 668: STB_I	stb	%r29, [%r4 + 0x0b86]
	.word 0xe6292902  ! 668: STB_I	stb	%r19, [%r4 + 0x0902]
	.word 0xfc290005  ! 668: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd4312088  ! 668: STH_I	sth	%r10, [%r4 + 0x0088]
	.word 0x0cc10003  ! 668: BRGZ	brgz  ,nt	%4,<label_0x10003>
	.word 0xd6f24988  ! 668: STXA_R	stxa	%r11, [%r9 + %r8] 0x4c
	.word 0xd8290005  ! 678: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf6210005  ! 678: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xde290005  ! 678: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfe312e8a  ! 678: STH_I	sth	%r31, [%r4 + 0x0e8a]
	.word 0xe6312d00  ! 678: STH_I	sth	%r19, [%r4 + 0x0d00]
	.word 0xd42120dc  ! 678: STW_I	stw	%r10, [%r4 + 0x00dc]
	.word 0xf8210005  ! 678: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfc710005  ! 678: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x0ac10001  ! 678: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xdd390005  ! 678: STDF_R	std	%f14, [%r5, %r4]
	.word 0xda290005  ! 687: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa212778  ! 687: STW_I	stw	%r29, [%r4 + 0x0778]
	.word 0xd4712978  ! 687: STX_I	stx	%r10, [%r4 + 0x0978]
	.word 0xf2312752  ! 687: STH_I	sth	%r25, [%r4 + 0x0752]
	.word 0xf6712518  ! 687: STX_I	stx	%r27, [%r4 + 0x0518]
	.word 0xe8290005  ! 687: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xee290005  ! 687: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x2ec10001  ! 687: BRGEZ	brgez,a,nt	%4,<label_0x10001>
	.word 0xe121298c  ! 687: STF_I	st	%f16, [0x098c, %r4]
	.word 0xf0290005  ! 697: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xea212adc  ! 697: STW_I	stw	%r21, [%r4 + 0x0adc]
	.word 0xdc212a30  ! 697: STW_I	stw	%r14, [%r4 + 0x0a30]
	.word 0xfc31263a  ! 697: STH_I	sth	%r30, [%r4 + 0x063a]
	.word 0xfc21297c  ! 697: STW_I	stw	%r30, [%r4 + 0x097c]
	.word 0xe4712738  ! 697: STX_I	stx	%r18, [%r4 + 0x0738]
	.word 0xe8292345  ! 697: STB_I	stb	%r20, [%r4 + 0x0345]
	.word 0xd6210005  ! 697: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x04800001  ! 697: BLE	ble  	<label_0x1>
	.word 0xd6f04ce0  ! 697: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xe4290005  ! 707: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xee710005  ! 707: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xd6292617  ! 707: STB_I	stb	%r11, [%r4 + 0x0617]
	.word 0xe8290005  ! 707: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf0290005  ! 707: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfe290005  ! 707: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfa712f28  ! 707: STX_I	stx	%r29, [%r4 + 0x0f28]
	.word 0xea292d08  ! 707: STB_I	stb	%r21, [%r4 + 0x0d08]
	.word 0x2ac10003  ! 707: BRNZ	brnz,a,nt	%4,<label_0x10003>
	.word 0xd6f0c983  ! 707: STXA_R	stxa	%r11, [%r3 + %r3] 0x4c
	.word 0xd8290005  ! 717: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf0212a44  ! 717: STW_I	stw	%r24, [%r4 + 0x0a44]
	.word 0xdc710005  ! 717: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xd6710005  ! 717: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xdc292901  ! 717: STB_I	stb	%r14, [%r4 + 0x0901]
	.word 0xde292c3f  ! 717: STB_I	stb	%r15, [%r4 + 0x0c3f]
	.word 0xfe310005  ! 717: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xd4290005  ! 717: STB_R	stb	%r10, [%r4 + %r5]
	.word 0x40000001  ! 717: CALL	call	disp30_1
	.word 0xef3922a8  ! 717: STDF_I	std	%f23, [0x02a8, %r4]
	.word 0xf6290005  ! 726: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf07124f0  ! 726: STX_I	stx	%r24, [%r4 + 0x04f0]
	.word 0xd8710005  ! 726: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xee2121a0  ! 726: STW_I	stw	%r23, [%r4 + 0x01a0]
	.word 0xfc712650  ! 726: STX_I	stx	%r30, [%r4 + 0x0650]
	.word 0xee310005  ! 726: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf0312b9a  ! 726: STH_I	sth	%r24, [%r4 + 0x0b9a]
	.word 0x0e800003  ! 726: BVS	bvs  	<label_0x3>
	.word 0xd8f08ce8  ! 726: STXA_R	stxa	%r12, [%r2 + %r8] 0x67
	.word 0xe4290005  ! 736: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe4710005  ! 736: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xec290005  ! 736: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4292d62  ! 736: STB_I	stb	%r18, [%r4 + 0x0d62]
	.word 0xf831272a  ! 736: STH_I	sth	%r28, [%r4 + 0x072a]
	.word 0xf2710005  ! 736: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xfe710005  ! 736: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe0710005  ! 736: STX_R	stx	%r16, [%r4 + %r5]
	.word 0x30800001  ! 736: BA	ba,a	<label_0x1>
	.word 0xd9210005  ! 736: STF_R	st	%f12, [%r5, %r4]
	.word 0xea290005  ! 745: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf8210005  ! 745: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfc210005  ! 745: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xfc210005  ! 745: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xe821235c  ! 745: STW_I	stw	%r20, [%r4 + 0x035c]
	.word 0xe4312224  ! 745: STH_I	sth	%r18, [%r4 + 0x0224]
	.word 0xfc290005  ! 745: STB_R	stb	%r30, [%r4 + %r5]
	.word 0x10800001  ! 745: BA	ba  	<label_0x1>
	.word 0xd6f0c968  ! 745: STXA_R	stxa	%r11, [%r3 + %r8] 0x4b
	.word 0xd6290005  ! 754: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf0710005  ! 754: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfc310005  ! 754: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xec290005  ! 754: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xdc292025  ! 754: STB_I	stb	%r14, [%r4 + 0x0025]
	.word 0xe6292b16  ! 754: STB_I	stb	%r19, [%r4 + 0x0b16]
	.word 0xdc212500  ! 754: STW_I	stw	%r14, [%r4 + 0x0500]
	.word 0x40000003  ! 754: CALL	call	disp30_3
	.word 0xdae92783  ! 754: LDSTUBA_I	ldstuba	%r13, [%r4 + 0x0783] %asi
	.word 0xf4290005  ! 763: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xde290005  ! 763: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd62925d3  ! 763: STB_I	stb	%r11, [%r4 + 0x05d3]
	.word 0xec712e90  ! 763: STX_I	stx	%r22, [%r4 + 0x0e90]
	.word 0xe8310005  ! 763: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xea312016  ! 763: STH_I	sth	%r21, [%r4 + 0x0016]
	.word 0xec310005  ! 763: STH_R	sth	%r22, [%r4 + %r5]
	.word 0x0ec10001  ! 763: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd8f08ce0  ! 763: STXA_R	stxa	%r12, [%r2 + %r0] 0x67
	.word 0xfa290005  ! 772: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf0212e94  ! 772: STW_I	stw	%r24, [%r4 + 0x0e94]
	.word 0xfe29236c  ! 772: STB_I	stb	%r31, [%r4 + 0x036c]
	.word 0xe42929f4  ! 772: STB_I	stb	%r18, [%r4 + 0x09f4]
	.word 0xea710005  ! 772: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xea310005  ! 772: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xde292162  ! 772: STB_I	stb	%r15, [%r4 + 0x0162]
	.word 0x00800001  ! 772: BN	bn  	<label_0x1>
	.word 0xf0f11005  ! 772: STXA_R	stxa	%r24, [%r4 + %r5] 0x80
	.word 0xfc290005  ! 782: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xee210005  ! 782: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfa710005  ! 782: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xec290005  ! 782: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xea212d20  ! 782: STW_I	stw	%r21, [%r4 + 0x0d20]
	.word 0xee712018  ! 782: STX_I	stx	%r23, [%r4 + 0x0018]
	.word 0xd8312298  ! 782: STH_I	sth	%r12, [%r4 + 0x0298]
	.word 0xd6210005  ! 782: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x10800003  ! 782: BA	ba  	<label_0x3>
	.word 0xd6f1c962  ! 782: STXA_R	stxa	%r11, [%r7 + %r2] 0x4b
	.word 0xda290005  ! 791: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xda290005  ! 791: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xee310005  ! 791: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xee210005  ! 791: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfc712110  ! 791: STX_I	stx	%r30, [%r4 + 0x0110]
	.word 0xe221229c  ! 791: STW_I	stw	%r17, [%r4 + 0x029c]
	.word 0xf6290005  ! 791: STB_R	stb	%r27, [%r4 + %r5]
	.word 0x22c10001  ! 791: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xeae91005  ! 791: LDSTUBA_R	ldstuba	%r21, [%r4 + %r5] 0x80
	.word 0xe0290005  ! 801: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xec710005  ! 801: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xd4210005  ! 801: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xdc310005  ! 801: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xee210005  ! 801: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xd4290005  ! 801: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xee29260a  ! 801: STB_I	stb	%r23, [%r4 + 0x060a]
	.word 0xfa712160  ! 801: STX_I	stx	%r29, [%r4 + 0x0160]
	.word 0x0a800001  ! 801: BCS	bcs  	<label_0x1>
	.word 0xd6f0cce6  ! 801: STXA_R	stxa	%r11, [%r3 + %r6] 0x67
	.word 0xf6290005  ! 810: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf4290005  ! 810: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xda212ae4  ! 810: STW_I	stw	%r13, [%r4 + 0x0ae4]
	.word 0xea310005  ! 810: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xec312cc6  ! 810: STH_I	sth	%r22, [%r4 + 0x0cc6]
	.word 0xe8210005  ! 810: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xfc712668  ! 810: STX_I	stx	%r30, [%r4 + 0x0668]
	.word 0x3c800001  ! 810: BPOS	bpos,a	<label_0x1>
	.word 0xd8f08983  ! 810: STXA_R	stxa	%r12, [%r2 + %r3] 0x4c
	.word 0xfc290005  ! 820: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf6310005  ! 820: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xec292032  ! 820: STB_I	stb	%r22, [%r4 + 0x0032]
	.word 0xe8712f60  ! 820: STX_I	stx	%r20, [%r4 + 0x0f60]
	.word 0xea212bcc  ! 820: STW_I	stw	%r21, [%r4 + 0x0bcc]
	.word 0xe8712e10  ! 820: STX_I	stx	%r20, [%r4 + 0x0e10]
	.word 0xfe3127f0  ! 820: STH_I	sth	%r31, [%r4 + 0x07f0]
	.word 0xf8290005  ! 820: STB_R	stb	%r28, [%r4 + %r5]
	.word 0x06c10001  ! 820: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd6f1c961  ! 820: STXA_R	stxa	%r11, [%r7 + %r1] 0x4b
	.word 0xd4290005  ! 830: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfa712a90  ! 830: STX_I	stx	%r29, [%r4 + 0x0a90]
	.word 0xd87127e8  ! 830: STX_I	stx	%r12, [%r4 + 0x07e8]
	.word 0xe4210005  ! 830: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfe310005  ! 830: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xe6290005  ! 830: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xde2921e1  ! 830: STB_I	stb	%r15, [%r4 + 0x01e1]
	.word 0xf2212e9c  ! 830: STW_I	stw	%r25, [%r4 + 0x0e9c]
	.word 0x0a800003  ! 830: BCS	bcs  	<label_0x3>
	.word 0xd6f08ce6  ! 830: STXA_R	stxa	%r11, [%r2 + %r6] 0x67
	.word 0xdc290005  ! 840: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xda7126c8  ! 840: STX_I	stx	%r13, [%r4 + 0x06c8]
	.word 0xf8310005  ! 840: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf6712970  ! 840: STX_I	stx	%r27, [%r4 + 0x0970]
	.word 0xfc710005  ! 840: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf6290005  ! 840: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xd87120c0  ! 840: STX_I	stx	%r12, [%r4 + 0x00c0]
	.word 0xe0290005  ! 840: STB_R	stb	%r16, [%r4 + %r5]
	.word 0x26800003  ! 840: BL	bl,a	<label_0x3>
	.word 0xf4f126b8  ! 840: STXA_I	stxa	%r26, [%r4 + 0x06b8] %asi
	.word 0xda290005  ! 850: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xda710005  ! 850: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf42120a0  ! 850: STW_I	stw	%r26, [%r4 + 0x00a0]
	.word 0xd4310005  ! 850: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf8312e62  ! 850: STH_I	sth	%r28, [%r4 + 0x0e62]
	.word 0xf2310005  ! 850: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xf429259f  ! 850: STB_I	stb	%r26, [%r4 + 0x059f]
	.word 0xe22925de  ! 850: STB_I	stb	%r17, [%r4 + 0x05de]
	.word 0x16800001  ! 850: BGE	bge  	<label_0x1>
	.word 0xd8f08ce0  ! 850: STXA_R	stxa	%r12, [%r2 + %r0] 0x67
	.word 0xd6290005  ! 859: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf4312d84  ! 859: STH_I	sth	%r26, [%r4 + 0x0d84]
	.word 0xe07121f0  ! 859: STX_I	stx	%r16, [%r4 + 0x01f0]
	.word 0xfa710005  ! 859: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xf2292941  ! 859: STB_I	stb	%r25, [%r4 + 0x0941]
	.word 0xdc210005  ! 859: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xda212c74  ! 859: STW_I	stw	%r13, [%r4 + 0x0c74]
	.word 0x04800001  ! 859: BLE	ble  	<label_0x1>
	.word 0xd8f04ce3  ! 859: STXA_R	stxa	%r12, [%r1 + %r3] 0x67
	.word 0xd8290005  ! 868: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf4292cc6  ! 868: STB_I	stb	%r26, [%r4 + 0x0cc6]
	.word 0xe6290005  ! 868: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd8712b38  ! 868: STX_I	stx	%r12, [%r4 + 0x0b38]
	.word 0xd6310005  ! 868: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xee7120b8  ! 868: STX_I	stx	%r23, [%r4 + 0x00b8]
	.word 0xde290005  ! 868: STB_R	stb	%r15, [%r4 + %r5]
	.word 0x3e800003  ! 868: BVC	bvc,a	<label_0x3>
	.word 0xd8f08963  ! 868: STXA_R	stxa	%r12, [%r2 + %r3] 0x4b
	.word 0xd8290005  ! 878: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf431297c  ! 878: STH_I	sth	%r26, [%r4 + 0x097c]
	.word 0xf8310005  ! 878: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf0212b20  ! 878: STW_I	stw	%r24, [%r4 + 0x0b20]
	.word 0xfa7121e0  ! 878: STX_I	stx	%r29, [%r4 + 0x01e0]
	.word 0xd4290005  ! 878: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe0290005  ! 878: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xde310005  ! 878: STH_R	sth	%r15, [%r4 + %r5]
	.word 0x40000001  ! 878: CALL	call	disp30_1
	.word 0xd6f08963  ! 878: STXA_R	stxa	%r11, [%r2 + %r3] 0x4b
	.word 0xe8290005  ! 887: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf42125d0  ! 887: STW_I	stw	%r26, [%r4 + 0x05d0]
	.word 0xda292c6b  ! 887: STB_I	stb	%r13, [%r4 + 0x0c6b]
	.word 0xe0210005  ! 887: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xea212378  ! 887: STW_I	stw	%r21, [%r4 + 0x0378]
	.word 0xee290005  ! 887: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe0290005  ! 887: STB_R	stb	%r16, [%r4 + %r5]
	.word 0x40000001  ! 887: CALL	call	disp30_1
	.word 0xeaf11005  ! 887: STXA_R	stxa	%r21, [%r4 + %r5] 0x80
	.word 0xf2290005  ! 897: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf0710005  ! 897: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfe310005  ! 897: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf8712aa0  ! 897: STX_I	stx	%r28, [%r4 + 0x0aa0]
	.word 0xfe290005  ! 897: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf8310005  ! 897: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xee710005  ! 897: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf4292999  ! 897: STB_I	stb	%r26, [%r4 + 0x0999]
	.word 0x28800001  ! 897: BLEU	bleu,a	<label_0x1>
	.word 0xd8f20ce6  ! 897: STXA_R	stxa	%r12, [%r8 + %r6] 0x67
	.word 0xd8290005  ! 906: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf6312bb4  ! 906: STH_I	sth	%r27, [%r4 + 0x0bb4]
	.word 0xec292551  ! 906: STB_I	stb	%r22, [%r4 + 0x0551]
	.word 0xf6712f88  ! 906: STX_I	stx	%r27, [%r4 + 0x0f88]
	.word 0xec31215a  ! 906: STH_I	sth	%r22, [%r4 + 0x015a]
	.word 0xf8290005  ! 906: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe4310005  ! 906: STH_R	sth	%r18, [%r4 + %r5]
	.word 0x02c90003  ! 906: BRZ	brz  ,pt	%4,<label_0x90003>
	.word 0xd6f20983  ! 906: STXA_R	stxa	%r11, [%r8 + %r3] 0x4c
	.word 0xf6290005  ! 915: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf8310005  ! 915: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xe6290005  ! 915: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe2290005  ! 915: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc292e6e  ! 915: STB_I	stb	%r30, [%r4 + 0x0e6e]
	.word 0xdc3121d4  ! 915: STH_I	sth	%r14, [%r4 + 0x01d4]
	.word 0xfc210005  ! 915: STW_R	stw	%r30, [%r4 + %r5]
	.word 0x0a800003  ! 915: BCS	bcs  	<label_0x3>
	.word 0xfe312c02  ! 915: STH_I	sth	%r31, [%r4 + 0x0c02]
	.word 0xfc290005  ! 925: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xde710005  ! 925: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xd421201c  ! 925: STW_I	stw	%r10, [%r4 + 0x001c]
	.word 0xe43125a8  ! 925: STH_I	sth	%r18, [%r4 + 0x05a8]
	.word 0xdc210005  ! 925: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xf4210005  ! 925: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xfa210005  ! 925: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd47128c0  ! 925: STX_I	stx	%r10, [%r4 + 0x08c0]
	.word 0x2ec10001  ! 925: BRGEZ	brgez,a,nt	%4,<label_0x10001>
	.word 0xd6f08ce0  ! 925: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
	.word 0xe8290005  ! 934: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf6210005  ! 934: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf8712f50  ! 934: STX_I	stx	%r28, [%r4 + 0x0f50]
	.word 0xea3126e6  ! 934: STH_I	sth	%r21, [%r4 + 0x06e6]
	.word 0xd8310005  ! 934: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf2312eb8  ! 934: STH_I	sth	%r25, [%r4 + 0x0eb8]
	.word 0xda292576  ! 934: STB_I	stb	%r13, [%r4 + 0x0576]
	.word 0x20800001  ! 934: BN	bn,a	<label_0x1>
	.word 0xd8f1c968  ! 934: STXA_R	stxa	%r12, [%r7 + %r8] 0x4b
	.word 0xfc290005  ! 944: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfe3125f4  ! 944: STH_I	sth	%r31, [%r4 + 0x05f4]
	.word 0xfc710005  ! 944: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xfc310005  ! 944: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xda7121e0  ! 944: STX_I	stx	%r13, [%r4 + 0x01e0]
	.word 0xfe712c58  ! 944: STX_I	stx	%r31, [%r4 + 0x0c58]
	.word 0xfc310005  ! 944: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf8310005  ! 944: STH_R	sth	%r28, [%r4 + %r5]
	.word 0x04c10003  ! 944: BRLEZ	brlez  ,nt	%4,<label_0x10003>
	.word 0xedf11005  ! 944: CASXA_I	casxa	[%r4] 0x80, %r5, %r22
	.word 0xfe290005  ! 953: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfa292a8f  ! 953: STB_I	stb	%r29, [%r4 + 0x0a8f]
	.word 0xf031295e  ! 953: STH_I	sth	%r24, [%r4 + 0x095e]
	.word 0xe0290005  ! 953: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xdc292d2a  ! 953: STB_I	stb	%r14, [%r4 + 0x0d2a]
	.word 0xde21214c  ! 953: STW_I	stw	%r15, [%r4 + 0x014c]
	.word 0xe8712ee8  ! 953: STX_I	stx	%r20, [%r4 + 0x0ee8]
	.word 0x22800003  ! 953: BE	be,a	<label_0x3>
	.word 0xd6f0cce3  ! 953: STXA_R	stxa	%r11, [%r3 + %r3] 0x67
	.word 0xd6290005  ! 963: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe6310005  ! 963: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xf4290005  ! 963: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xfe31265a  ! 963: STH_I	sth	%r31, [%r4 + 0x065a]
	.word 0xfc212928  ! 963: STW_I	stw	%r30, [%r4 + 0x0928]
	.word 0xdc2129e4  ! 963: STW_I	stw	%r14, [%r4 + 0x09e4]
	.word 0xee710005  ! 963: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe0712ff0  ! 963: STX_I	stx	%r16, [%r4 + 0x0ff0]
	.word 0x0ec10001  ! 963: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xfa312764  ! 963: STH_I	sth	%r29, [%r4 + 0x0764]
	.word 0xda290005  ! 972: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe8712690  ! 972: STX_I	stx	%r20, [%r4 + 0x0690]
	.word 0xee710005  ! 972: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xec210005  ! 972: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xfe310005  ! 972: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xfe212394  ! 972: STW_I	stw	%r31, [%r4 + 0x0394]
	.word 0xe2710005  ! 972: STX_R	stx	%r17, [%r4 + %r5]
	.word 0x2cc90001  ! 972: BRGZ	brgz,a,pt	%4,<label_0x90001>
	.word 0xd8f08960  ! 972: STXA_R	stxa	%r12, [%r2 + %r0] 0x4b
	.word 0xec290005  ! 981: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xde710005  ! 981: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf8712398  ! 981: STX_I	stx	%r28, [%r4 + 0x0398]
	.word 0xe0210005  ! 981: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xdc290005  ! 981: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf0290005  ! 981: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe0210005  ! 981: STW_R	stw	%r16, [%r4 + %r5]
	.word 0x1a800003  ! 981: BCC	bcc  	<label_0x3>
	.word 0xd6f18987  ! 981: STXA_R	stxa	%r11, [%r6 + %r7] 0x4c
	.word 0xe4290005  ! 991: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd6212858  ! 991: STW_I	stw	%r11, [%r4 + 0x0858]
	.word 0xe629267f  ! 991: STB_I	stb	%r19, [%r4 + 0x067f]
	.word 0xda710005  ! 991: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf6310005  ! 991: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xe0310005  ! 991: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xde212e4c  ! 991: STW_I	stw	%r15, [%r4 + 0x0e4c]
	.word 0xd8210005  ! 991: STW_R	stw	%r12, [%r4 + %r5]
	.word 0x3e800001  ! 991: BVC	bvc,a	<label_0x1>
	.word 0xd8f00ce6  ! 991: STXA_R	stxa	%r12, [%r0 + %r6] 0x67
	.word 0xf0290005  ! 1000: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd6210005  ! 1000: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xfa310005  ! 1000: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xda7124b0  ! 1000: STX_I	stx	%r13, [%r4 + 0x04b0]
	.word 0xd4310005  ! 1000: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf6710005  ! 1000: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xde210005  ! 1000: STW_R	stw	%r15, [%r4 + %r5]
	.word 0x0a800001  ! 1000: BCS	bcs  	<label_0x1>
	.word 0xede11005  ! 1000: CASA_I	casa	[%r4] 0x80, %r5, %r22
	.word 0xe8290005  ! 1009: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe0290005  ! 1009: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd8310005  ! 1009: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf82121cc  ! 1009: STW_I	stw	%r28, [%r4 + 0x01cc]
	.word 0xea290005  ! 1009: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf4290005  ! 1009: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf8712900  ! 1009: STX_I	stx	%r28, [%r4 + 0x0900]
	.word 0x1a800001  ! 1009: BCC	bcc  	<label_0x1>
	.word 0xd6f04ce8  ! 1009: STXA_R	stxa	%r11, [%r1 + %r8] 0x67
	.word 0xfe290005  ! 1019: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfe212c30  ! 1019: STW_I	stw	%r31, [%r4 + 0x0c30]
	.word 0xe2710005  ! 1019: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xfa210005  ! 1019: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xec712610  ! 1019: STX_I	stx	%r22, [%r4 + 0x0610]
	.word 0xfc212508  ! 1019: STW_I	stw	%r30, [%r4 + 0x0508]
	.word 0xde310005  ! 1019: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xde310005  ! 1019: STH_R	sth	%r15, [%r4 + %r5]
	.word 0x3a800001  ! 1019: BCC	bcc,a	<label_0x1>
	.word 0xde710005  ! 1019: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xda290005  ! 1029: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf6292f36  ! 1029: STB_I	stb	%r27, [%r4 + 0x0f36]
	.word 0xda290005  ! 1029: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd6312198  ! 1029: STH_I	sth	%r11, [%r4 + 0x0198]
	.word 0xf0292501  ! 1029: STB_I	stb	%r24, [%r4 + 0x0501]
	.word 0xe8312f2a  ! 1029: STH_I	sth	%r20, [%r4 + 0x0f2a]
	.word 0xdc310005  ! 1029: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe4712400  ! 1029: STX_I	stx	%r18, [%r4 + 0x0400]
	.word 0x26800001  ! 1029: BL	bl,a	<label_0x1>
	.word 0xe7e11005  ! 1029: CASA_I	casa	[%r4] 0x80, %r5, %r19
	.word 0xe0290005  ! 1038: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xea2926ae  ! 1038: STB_I	stb	%r21, [%r4 + 0x06ae]
	.word 0xfa290005  ! 1038: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe6290005  ! 1038: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf63122f8  ! 1038: STH_I	sth	%r27, [%r4 + 0x02f8]
	.word 0xd83129c8  ! 1038: STH_I	sth	%r12, [%r4 + 0x09c8]
	.word 0xfc710005  ! 1038: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x40000001  ! 1038: CALL	call	disp30_1
	.word 0xe5e11005  ! 1038: CASA_I	casa	[%r4] 0x80, %r5, %r18
	.word 0xf0290005  ! 1048: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xee710005  ! 1048: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xd8310005  ! 1048: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xec292ec6  ! 1048: STB_I	stb	%r22, [%r4 + 0x0ec6]
	.word 0xde290005  ! 1048: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xde212a14  ! 1048: STW_I	stw	%r15, [%r4 + 0x0a14]
	.word 0xdc212a54  ! 1048: STW_I	stw	%r14, [%r4 + 0x0a54]
	.word 0xd42923aa  ! 1048: STB_I	stb	%r10, [%r4 + 0x03aa]
	.word 0x2e800001  ! 1048: BVS	bvs,a	<label_0x1>
	.word 0xe0a91005  ! 1048: STBA_R	stba	%r16, [%r4 + %r5] 0x80
	.word 0xde290005  ! 1058: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe431254e  ! 1058: STH_I	sth	%r18, [%r4 + 0x054e]
	.word 0xda312a4a  ! 1058: STH_I	sth	%r13, [%r4 + 0x0a4a]
	.word 0xfc710005  ! 1058: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf0710005  ! 1058: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xe6290005  ! 1058: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xec710005  ! 1058: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xde712180  ! 1058: STX_I	stx	%r15, [%r4 + 0x0180]
	.word 0x28800003  ! 1058: BLEU	bleu,a	<label_0x3>
	.word 0xd6f0c962  ! 1058: STXA_R	stxa	%r11, [%r3 + %r2] 0x4b
	.word 0xfc290005  ! 1067: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xee290005  ! 1067: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf0712298  ! 1067: STX_I	stx	%r24, [%r4 + 0x0298]
	.word 0xd82124f0  ! 1067: STW_I	stw	%r12, [%r4 + 0x04f0]
	.word 0xdc210005  ! 1067: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd8210005  ! 1067: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe42924cf  ! 1067: STB_I	stb	%r18, [%r4 + 0x04cf]
	.word 0x0e800001  ! 1067: BVS	bvs  	<label_0x1>
	.word 0xf0a11005  ! 1067: STWA_R	stwa	%r24, [%r4 + %r5] 0x80
	.word 0xe4290005  ! 1076: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xfc292a90  ! 1076: STB_I	stb	%r30, [%r4 + 0x0a90]
	.word 0xf8312ad8  ! 1076: STH_I	sth	%r28, [%r4 + 0x0ad8]
	.word 0xd6210005  ! 1076: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xe4712528  ! 1076: STX_I	stx	%r18, [%r4 + 0x0528]
	.word 0xd4710005  ! 1076: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe8210005  ! 1076: STW_R	stw	%r20, [%r4 + %r5]
	.word 0x3c800003  ! 1076: BPOS	bpos,a	<label_0x3>
	.word 0xd8f0cce7  ! 1076: STXA_R	stxa	%r12, [%r3 + %r7] 0x67
	.word 0xe0290005  ! 1086: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf6712058  ! 1086: STX_I	stx	%r27, [%r4 + 0x0058]
	.word 0xde712188  ! 1086: STX_I	stx	%r15, [%r4 + 0x0188]
	.word 0xd4710005  ! 1086: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe8710005  ! 1086: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf2310005  ! 1086: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd6312450  ! 1086: STH_I	sth	%r11, [%r4 + 0x0450]
	.word 0xd8710005  ! 1086: STX_R	stx	%r12, [%r4 + %r5]
	.word 0x2e800001  ! 1086: BVS	bvs,a	<label_0x1>
	.word 0xd6f00ce7  ! 1086: STXA_R	stxa	%r11, [%r0 + %r7] 0x67
	.word 0xfc290005  ! 1096: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe8310005  ! 1096: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf8312746  ! 1096: STH_I	sth	%r28, [%r4 + 0x0746]
	.word 0xe8710005  ! 1096: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd4710005  ! 1096: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe6290005  ! 1096: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf6710005  ! 1096: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe6310005  ! 1096: STH_R	sth	%r19, [%r4 + %r5]
	.word 0x22c90001  ! 1096: BRZ	brz,a,pt	%4,<label_0x90001>
	.word 0xfae91005  ! 1096: LDSTUBA_R	ldstuba	%r29, [%r4 + %r5] 0x80
	.word 0xec290005  ! 1106: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xdc212748  ! 1106: STW_I	stw	%r14, [%r4 + 0x0748]
	.word 0xea292356  ! 1106: STB_I	stb	%r21, [%r4 + 0x0356]
	.word 0xf6712998  ! 1106: STX_I	stx	%r27, [%r4 + 0x0998]
	.word 0xe0290005  ! 1106: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfa210005  ! 1106: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf2312fb2  ! 1106: STH_I	sth	%r25, [%r4 + 0x0fb2]
	.word 0xda3121de  ! 1106: STH_I	sth	%r13, [%r4 + 0x01de]
	.word 0x04800001  ! 1106: BLE	ble  	<label_0x1>
	.word 0xd6f0cce9  ! 1106: STXA_R	stxa	%r11, [%r3 + %r9] 0x67
	.word 0xe4290005  ! 1116: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe4712440  ! 1116: STX_I	stx	%r18, [%r4 + 0x0440]
	.word 0xee7121f8  ! 1116: STX_I	stx	%r23, [%r4 + 0x01f8]
	.word 0xf831242e  ! 1116: STH_I	sth	%r28, [%r4 + 0x042e]
	.word 0xe0312df4  ! 1116: STH_I	sth	%r16, [%r4 + 0x0df4]
	.word 0xfc712458  ! 1116: STX_I	stx	%r30, [%r4 + 0x0458]
	.word 0xf6712d18  ! 1116: STX_I	stx	%r27, [%r4 + 0x0d18]
	.word 0xee310005  ! 1116: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x06c90003  ! 1116: BRLZ	brlz  ,pt	%4,<label_0x90003>
	.word 0xd8f04ce1  ! 1116: STXA_R	stxa	%r12, [%r1 + %r1] 0x67
	.word 0xe2290005  ! 1125: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe4710005  ! 1125: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xee212510  ! 1125: STW_I	stw	%r23, [%r4 + 0x0510]
	.word 0xe6710005  ! 1125: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xfe292a9f  ! 1125: STB_I	stb	%r31, [%r4 + 0x0a9f]
	.word 0xfa292da0  ! 1125: STB_I	stb	%r29, [%r4 + 0x0da0]
	.word 0xda210005  ! 1125: STW_R	stw	%r13, [%r4 + %r5]
	.word 0x30800001  ! 1125: BA	ba,a	<label_0x1>
	.word 0xd6f04981  ! 1125: STXA_R	stxa	%r11, [%r1 + %r1] 0x4c
	.word 0xfc290005  ! 1135: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf8310005  ! 1135: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xd6710005  ! 1135: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xfe310005  ! 1135: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xe6710005  ! 1135: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xee212670  ! 1135: STW_I	stw	%r23, [%r4 + 0x0670]
	.word 0xe8710005  ! 1135: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf6290005  ! 1135: STB_R	stb	%r27, [%r4 + %r5]
	.word 0x10800001  ! 1135: BA	ba  	<label_0x1>
	.word 0xe0b91005  ! 1135: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xe8290005  ! 1144: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf8710005  ! 1144: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xd6210005  ! 1144: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xd4710005  ! 1144: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xfa710005  ! 1144: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe0212628  ! 1144: STW_I	stw	%r16, [%r4 + 0x0628]
	.word 0xd6210005  ! 1144: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x28800001  ! 1144: BLEU	bleu,a	<label_0x1>
	.word 0xd8f24962  ! 1144: STXA_R	stxa	%r12, [%r9 + %r2] 0x4b
	.word 0xe2290005  ! 1154: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe6210005  ! 1154: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf2710005  ! 1154: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xe6710005  ! 1154: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xde292c7c  ! 1154: STB_I	stb	%r15, [%r4 + 0x0c7c]
	.word 0xea312874  ! 1154: STH_I	sth	%r21, [%r4 + 0x0874]
	.word 0xea290005  ! 1154: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd8310005  ! 1154: STH_R	sth	%r12, [%r4 + %r5]
	.word 0x0ac90001  ! 1154: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xd8f04969  ! 1154: STXA_R	stxa	%r12, [%r1 + %r9] 0x4b
	.word 0xe6290005  ! 1164: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xdc290005  ! 1164: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfc712eb8  ! 1164: STX_I	stx	%r30, [%r4 + 0x0eb8]
	.word 0xfa2121e4  ! 1164: STW_I	stw	%r29, [%r4 + 0x01e4]
	.word 0xe4290005  ! 1164: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe6710005  ! 1164: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xea3126dc  ! 1164: STH_I	sth	%r21, [%r4 + 0x06dc]
	.word 0xd8210005  ! 1164: STW_R	stw	%r12, [%r4 + %r5]
	.word 0x40000001  ! 1164: CALL	call	disp30_1
	.word 0xd6f08ce8  ! 1164: STXA_R	stxa	%r11, [%r2 + %r8] 0x67
	.word 0xf6290005  ! 1174: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xec290005  ! 1174: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe8310005  ! 1174: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf2312192  ! 1174: STH_I	sth	%r25, [%r4 + 0x0192]
	.word 0xdc292ac7  ! 1174: STB_I	stb	%r14, [%r4 + 0x0ac7]
	.word 0xfa312156  ! 1174: STH_I	sth	%r29, [%r4 + 0x0156]
	.word 0xfa312346  ! 1174: STH_I	sth	%r29, [%r4 + 0x0346]
	.word 0xe4292800  ! 1174: STB_I	stb	%r18, [%r4 + 0x0800]
	.word 0x00800003  ! 1174: BN	bn  	<label_0x3>
	.word 0xd6f00ce3  ! 1174: STXA_R	stxa	%r11, [%r0 + %r3] 0x67
	.word 0xfe290005  ! 1183: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe6710005  ! 1183: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xec212278  ! 1183: STW_I	stw	%r22, [%r4 + 0x0278]
	.word 0xe4710005  ! 1183: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe4212658  ! 1183: STW_I	stw	%r18, [%r4 + 0x0658]
	.word 0xf4712490  ! 1183: STX_I	stx	%r26, [%r4 + 0x0490]
	.word 0xd4310005  ! 1183: STH_R	sth	%r10, [%r4 + %r5]
	.word 0x04c90003  ! 1183: BRLEZ	brlez  ,pt	%4,<label_0x90003>
	.word 0xf279216c  ! 1183: SWAP_I	swap	%r25, [%r4 + 0x016c]
	.word 0xfa290005  ! 1192: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe0712420  ! 1192: STX_I	stx	%r16, [%r4 + 0x0420]
	.word 0xec210005  ! 1192: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xd8210005  ! 1192: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xd4292f55  ! 1192: STB_I	stb	%r10, [%r4 + 0x0f55]
	.word 0xfe710005  ! 1192: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xfe210005  ! 1192: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x18800003  ! 1192: BGU	bgu  	<label_0x3>
	.word 0xd8f20983  ! 1192: STXA_R	stxa	%r12, [%r8 + %r3] 0x4c
	.word 0xe0290005  ! 1202: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe4712310  ! 1202: STX_I	stx	%r18, [%r4 + 0x0310]
	.word 0xfc310005  ! 1202: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xdc212498  ! 1202: STW_I	stw	%r14, [%r4 + 0x0498]
	.word 0xec290005  ! 1202: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf0310005  ! 1202: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xde31258c  ! 1202: STH_I	sth	%r15, [%r4 + 0x058c]
	.word 0xd629286e  ! 1202: STB_I	stb	%r11, [%r4 + 0x086e]
	.word 0x32800001  ! 1202: BNE	bne,a	<label_0x1>
	.word 0xd6f04ce2  ! 1202: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xd8290005  ! 1211: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe22923e7  ! 1211: STB_I	stb	%r17, [%r4 + 0x03e7]
	.word 0xe4292ac6  ! 1211: STB_I	stb	%r18, [%r4 + 0x0ac6]
	.word 0xea210005  ! 1211: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xe4712160  ! 1211: STX_I	stx	%r18, [%r4 + 0x0160]
	.word 0xfa290005  ! 1211: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf0212414  ! 1211: STW_I	stw	%r24, [%r4 + 0x0414]
	.word 0x22800001  ! 1211: BE	be,a	<label_0x1>
	.word 0xd6f08ce2  ! 1211: STXA_R	stxa	%r11, [%r2 + %r2] 0x67
	.word 0xfa290005  ! 1221: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd4310005  ! 1221: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xea3128ca  ! 1221: STH_I	sth	%r21, [%r4 + 0x08ca]
	.word 0xec210005  ! 1221: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xe6712590  ! 1221: STX_I	stx	%r19, [%r4 + 0x0590]
	.word 0xde292bee  ! 1221: STB_I	stb	%r15, [%r4 + 0x0bee]
	.word 0xea710005  ! 1221: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xea312e6c  ! 1221: STH_I	sth	%r21, [%r4 + 0x0e6c]
	.word 0x00800003  ! 1221: BN	bn  	<label_0x3>
	.word 0xd8f04ce3  ! 1221: STXA_R	stxa	%r12, [%r1 + %r3] 0x67
	.word 0xfa290005  ! 1230: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xdc292a7b  ! 1230: STB_I	stb	%r14, [%r4 + 0x0a7b]
	.word 0xfe290005  ! 1230: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe2212bb8  ! 1230: STW_I	stw	%r17, [%r4 + 0x0bb8]
	.word 0xda712740  ! 1230: STX_I	stx	%r13, [%r4 + 0x0740]
	.word 0xec210005  ! 1230: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xd8212954  ! 1230: STW_I	stw	%r12, [%r4 + 0x0954]
	.word 0x24800001  ! 1230: BLE	ble,a	<label_0x1>
	.word 0xd6f04981  ! 1230: STXA_R	stxa	%r11, [%r1 + %r1] 0x4c
	.word 0xfa290005  ! 1239: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfc2925bb  ! 1239: STB_I	stb	%r30, [%r4 + 0x05bb]
	.word 0xe2210005  ! 1239: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xf87125b0  ! 1239: STX_I	stx	%r28, [%r4 + 0x05b0]
	.word 0xfe710005  ! 1239: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xfe2927a3  ! 1239: STB_I	stb	%r31, [%r4 + 0x07a3]
	.word 0xf02920a1  ! 1239: STB_I	stb	%r24, [%r4 + 0x00a1]
	.word 0x24c10003  ! 1239: BRLEZ	brlez,a,nt	%4,<label_0x10003>
	.word 0xd6f00963  ! 1239: STXA_R	stxa	%r11, [%r0 + %r3] 0x4b
	.word 0xdc290005  ! 1248: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xea212698  ! 1248: STW_I	stw	%r21, [%r4 + 0x0698]
	.word 0xe07126d0  ! 1248: STX_I	stx	%r16, [%r4 + 0x06d0]
	.word 0xda310005  ! 1248: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xf4710005  ! 1248: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xee310005  ! 1248: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf0210005  ! 1248: STW_R	stw	%r24, [%r4 + %r5]
	.word 0x16800001  ! 1248: BGE	bge  	<label_0x1>
	.word 0xfe310005  ! 1248: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xd4290005  ! 1257: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe62925b4  ! 1257: STB_I	stb	%r19, [%r4 + 0x05b4]
	.word 0xf87129e0  ! 1257: STX_I	stx	%r28, [%r4 + 0x09e0]
	.word 0xf0212ec4  ! 1257: STW_I	stw	%r24, [%r4 + 0x0ec4]
	.word 0xf2312a6a  ! 1257: STH_I	sth	%r25, [%r4 + 0x0a6a]
	.word 0xf6712450  ! 1257: STX_I	stx	%r27, [%r4 + 0x0450]
	.word 0xec210005  ! 1257: STW_R	stw	%r22, [%r4 + %r5]
	.word 0x0ec10003  ! 1257: BRGEZ	brgez  ,nt	%4,<label_0x10003>
	.word 0xd6f08987  ! 1257: STXA_R	stxa	%r11, [%r2 + %r7] 0x4c
	.word 0xfe290005  ! 1266: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfa710005  ! 1266: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe2290005  ! 1266: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfa210005  ! 1266: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xec712a60  ! 1266: STX_I	stx	%r22, [%r4 + 0x0a60]
	.word 0xd4710005  ! 1266: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe03129a4  ! 1266: STH_I	sth	%r16, [%r4 + 0x09a4]
	.word 0x06c90003  ! 1266: BRLZ	brlz  ,pt	%4,<label_0x90003>
	.word 0xd8f18ce2  ! 1266: STXA_R	stxa	%r12, [%r6 + %r2] 0x67
	.word 0xfc290005  ! 1275: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfe290005  ! 1275: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe2710005  ! 1275: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe0290005  ! 1275: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe8290005  ! 1275: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfe2924a3  ! 1275: STB_I	stb	%r31, [%r4 + 0x04a3]
	.word 0xe2712170  ! 1275: STX_I	stx	%r17, [%r4 + 0x0170]
	.word 0x2cc10001  ! 1275: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd6f1c987  ! 1275: STXA_R	stxa	%r11, [%r7 + %r7] 0x4c
	.word 0xe6290005  ! 1284: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe22124b4  ! 1284: STW_I	stw	%r17, [%r4 + 0x04b4]
	.word 0xf0210005  ! 1284: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xe6290005  ! 1284: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf6310005  ! 1284: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xec710005  ! 1284: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xe62924e1  ! 1284: STB_I	stb	%r19, [%r4 + 0x04e1]
	.word 0x1a800001  ! 1284: BCC	bcc  	<label_0x1>
	.word 0xd6f18989  ! 1284: STXA_R	stxa	%r11, [%r6 + %r9] 0x4c
	.word 0xd8290005  ! 1293: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe4290005  ! 1293: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf6290005  ! 1293: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe8710005  ! 1293: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xe6292ae7  ! 1293: STB_I	stb	%r19, [%r4 + 0x0ae7]
	.word 0xe22926c9  ! 1293: STB_I	stb	%r17, [%r4 + 0x06c9]
	.word 0xfa310005  ! 1293: STH_R	sth	%r29, [%r4 + %r5]
	.word 0x22800003  ! 1293: BE	be,a	<label_0x3>
	.word 0xd6f04ce3  ! 1293: STXA_R	stxa	%r11, [%r1 + %r3] 0x67
	.word 0xde290005  ! 1303: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf0710005  ! 1303: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xf2310005  ! 1303: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xec21224c  ! 1303: STW_I	stw	%r22, [%r4 + 0x024c]
	.word 0xe0712fc8  ! 1303: STX_I	stx	%r16, [%r4 + 0x0fc8]
	.word 0xdc212f88  ! 1303: STW_I	stw	%r14, [%r4 + 0x0f88]
	.word 0xe0310005  ! 1303: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xe0290005  ! 1303: STB_R	stb	%r16, [%r4 + %r5]
	.word 0x32800001  ! 1303: BNE	bne,a	<label_0x1>
	.word 0xd6f08ce3  ! 1303: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xdc290005  ! 1312: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd6310005  ! 1312: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xde212ffc  ! 1312: STW_I	stw	%r15, [%r4 + 0x0ffc]
	.word 0xfc212a1c  ! 1312: STW_I	stw	%r30, [%r4 + 0x0a1c]
	.word 0xe8310005  ! 1312: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf0212d30  ! 1312: STW_I	stw	%r24, [%r4 + 0x0d30]
	.word 0xd4210005  ! 1312: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x0c800001  ! 1312: BNEG	bneg  	<label_0x1>
	.word 0xec29220e  ! 1312: STB_I	stb	%r22, [%r4 + 0x020e]
	.word 0xdc290005  ! 1322: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xec7123c0  ! 1322: STX_I	stx	%r22, [%r4 + 0x03c0]
	.word 0xe82922ee  ! 1322: STB_I	stb	%r20, [%r4 + 0x02ee]
	.word 0xe2212a50  ! 1322: STW_I	stw	%r17, [%r4 + 0x0a50]
	.word 0xd6710005  ! 1322: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xe8290005  ! 1322: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe6210005  ! 1322: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf4310005  ! 1322: STH_R	sth	%r26, [%r4 + %r5]
	.word 0x00800001  ! 1322: BN	bn  	<label_0x1>
	.word 0xd8f0c967  ! 1322: STXA_R	stxa	%r12, [%r3 + %r7] 0x4b
	.word 0xee290005  ! 1331: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd829284e  ! 1331: STB_I	stb	%r12, [%r4 + 0x084e]
	.word 0xfe210005  ! 1331: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xec2124d0  ! 1331: STW_I	stw	%r22, [%r4 + 0x04d0]
	.word 0xd6290005  ! 1331: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd43120f4  ! 1331: STH_I	sth	%r10, [%r4 + 0x00f4]
	.word 0xee2122b8  ! 1331: STW_I	stw	%r23, [%r4 + 0x02b8]
	.word 0x08800001  ! 1331: BLEU	bleu  	<label_0x1>
	.word 0xd6f08960  ! 1331: STXA_R	stxa	%r11, [%r2 + %r0] 0x4b
	.word 0xec290005  ! 1341: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd4292a25  ! 1341: STB_I	stb	%r10, [%r4 + 0x0a25]
	.word 0xea212f4c  ! 1341: STW_I	stw	%r21, [%r4 + 0x0f4c]
	.word 0xd4710005  ! 1341: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xf2310005  ! 1341: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xe42124e8  ! 1341: STW_I	stw	%r18, [%r4 + 0x04e8]
	.word 0xda312f0e  ! 1341: STH_I	sth	%r13, [%r4 + 0x0f0e]
	.word 0xde290005  ! 1341: STB_R	stb	%r15, [%r4 + %r5]
	.word 0x0ac90001  ! 1341: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xf3f12005  ! 1341: CASXA_R	casxa	[%r4]%asi, %r5, %r25
	.word 0xee290005  ! 1351: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf2210005  ! 1351: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xf2310005  ! 1351: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xda710005  ! 1351: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xfe31296c  ! 1351: STH_I	sth	%r31, [%r4 + 0x096c]
	.word 0xd8312a6c  ! 1351: STH_I	sth	%r12, [%r4 + 0x0a6c]
	.word 0xfa292e02  ! 1351: STB_I	stb	%r29, [%r4 + 0x0e02]
	.word 0xda210005  ! 1351: STW_R	stw	%r13, [%r4 + %r5]
	.word 0x28800001  ! 1351: BLEU	bleu,a	<label_0x1>
	.word 0xd8f00ce8  ! 1351: STXA_R	stxa	%r12, [%r0 + %r8] 0x67
	.word 0xe2290005  ! 1360: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe0310005  ! 1360: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xe0292a7f  ! 1360: STB_I	stb	%r16, [%r4 + 0x0a7f]
	.word 0xea710005  ! 1360: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xd4212c98  ! 1360: STW_I	stw	%r10, [%r4 + 0x0c98]
	.word 0xe8292c02  ! 1360: STB_I	stb	%r20, [%r4 + 0x0c02]
	.word 0xe629274d  ! 1360: STB_I	stb	%r19, [%r4 + 0x074d]
	.word 0x2c800001  ! 1360: BNEG	bneg,a	<label_0x1>
	.word 0xf0b91005  ! 1360: STDA_R	stda	%r24, [%r4 + %r5] 0x80
	.word 0xd8290005  ! 1369: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xee210005  ! 1369: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfc212dc0  ! 1369: STW_I	stw	%r30, [%r4 + 0x0dc0]
	.word 0xee292b87  ! 1369: STB_I	stb	%r23, [%r4 + 0x0b87]
	.word 0xfc710005  ! 1369: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf0710005  ! 1369: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xf4290005  ! 1369: STB_R	stb	%r26, [%r4 + %r5]
	.word 0x32800003  ! 1369: BNE	bne,a	<label_0x3>
	.word 0xd6f08989  ! 1369: STXA_R	stxa	%r11, [%r2 + %r9] 0x4c
	.word 0xf2290005  ! 1378: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe6290005  ! 1378: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xee210005  ! 1378: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfc290005  ! 1378: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfc290005  ! 1378: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xdc310005  ! 1378: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xf8290005  ! 1378: STB_R	stb	%r28, [%r4 + %r5]
	.word 0x32800003  ! 1378: BNE	bne,a	<label_0x3>
	.word 0xeca92c06  ! 1378: STBA_I	stba	%r22, [%r4 + 0x0c06] %asi
	.word 0xea290005  ! 1387: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf629269c  ! 1387: STB_I	stb	%r27, [%r4 + 0x069c]
	.word 0xee312d5c  ! 1387: STH_I	sth	%r23, [%r4 + 0x0d5c]
	.word 0xe8312eac  ! 1387: STH_I	sth	%r20, [%r4 + 0x0eac]
	.word 0xf029240a  ! 1387: STB_I	stb	%r24, [%r4 + 0x040a]
	.word 0xde310005  ! 1387: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xf0310005  ! 1387: STH_R	sth	%r24, [%r4 + %r5]
	.word 0x1a800003  ! 1387: BCC	bcc  	<label_0x3>
	.word 0xd6f08960  ! 1387: STXA_R	stxa	%r11, [%r2 + %r0] 0x4b
	.word 0xfc290005  ! 1396: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xdc310005  ! 1396: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe2290005  ! 1396: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd4712c38  ! 1396: STX_I	stx	%r10, [%r4 + 0x0c38]
	.word 0xd8212f04  ! 1396: STW_I	stw	%r12, [%r4 + 0x0f04]
	.word 0xf0310005  ! 1396: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xd8292c0e  ! 1396: STB_I	stb	%r12, [%r4 + 0x0c0e]
	.word 0x0a800003  ! 1396: BCS	bcs  	<label_0x3>
	.word 0xd6f0cce2  ! 1396: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
	.word 0xf4290005  ! 1405: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf82923e0  ! 1405: STB_I	stb	%r28, [%r4 + 0x03e0]
	.word 0xf0290005  ! 1405: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf67127c8  ! 1405: STX_I	stx	%r27, [%r4 + 0x07c8]
	.word 0xe6290005  ! 1405: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf8212a1c  ! 1405: STW_I	stw	%r28, [%r4 + 0x0a1c]
	.word 0xf4712d08  ! 1405: STX_I	stx	%r26, [%r4 + 0x0d08]
	.word 0x0a800001  ! 1405: BCS	bcs  	<label_0x1>
	.word 0xd6f08982  ! 1405: STXA_R	stxa	%r11, [%r2 + %r2] 0x4c
	.word 0xd6290005  ! 1415: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe8290005  ! 1415: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe4712e20  ! 1415: STX_I	stx	%r18, [%r4 + 0x0e20]
	.word 0xe0210005  ! 1415: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xde290005  ! 1415: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfa2124fc  ! 1415: STW_I	stw	%r29, [%r4 + 0x04fc]
	.word 0xf2290005  ! 1415: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xea7127b0  ! 1415: STX_I	stx	%r21, [%r4 + 0x07b0]
	.word 0x26800003  ! 1415: BL	bl,a	<label_0x3>
	.word 0xd6f00981  ! 1415: STXA_R	stxa	%r11, [%r0 + %r1] 0x4c
	.word 0xda290005  ! 1424: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xda310005  ! 1424: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xd4210005  ! 1424: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xf0712aa0  ! 1424: STX_I	stx	%r24, [%r4 + 0x0aa0]
	.word 0xf0290005  ! 1424: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe0710005  ! 1424: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xfe712110  ! 1424: STX_I	stx	%r31, [%r4 + 0x0110]
	.word 0x06c10001  ! 1424: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd6f24ce0  ! 1424: STXA_R	stxa	%r11, [%r9 + %r0] 0x67
	.word 0xde290005  ! 1434: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf4212e40  ! 1434: STW_I	stw	%r26, [%r4 + 0x0e40]
	.word 0xf8290005  ! 1434: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd8712ec8  ! 1434: STX_I	stx	%r12, [%r4 + 0x0ec8]
	.word 0xe2710005  ! 1434: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe6292092  ! 1434: STB_I	stb	%r19, [%r4 + 0x0092]
	.word 0xde710005  ! 1434: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf8310005  ! 1434: STH_R	sth	%r28, [%r4 + %r5]
	.word 0x16800001  ! 1434: BGE	bge  	<label_0x1>
	.word 0xd6f04ce1  ! 1434: STXA_R	stxa	%r11, [%r1 + %r1] 0x67
	.word 0xfe290005  ! 1444: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfe292ad1  ! 1444: STB_I	stb	%r31, [%r4 + 0x0ad1]
	.word 0xda2122e8  ! 1444: STW_I	stw	%r13, [%r4 + 0x02e8]
	.word 0xea292c4d  ! 1444: STB_I	stb	%r21, [%r4 + 0x0c4d]
	.word 0xd8710005  ! 1444: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xf431227a  ! 1444: STH_I	sth	%r26, [%r4 + 0x027a]
	.word 0xdc290005  ! 1444: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfa2929cb  ! 1444: STB_I	stb	%r29, [%r4 + 0x09cb]
	.word 0x14800001  ! 1444: BG	bg  	<label_0x1>
	.word 0xd8f00969  ! 1444: STXA_R	stxa	%r12, [%r0 + %r9] 0x4b
	.word 0xee290005  ! 1454: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xec310005  ! 1454: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xd6712350  ! 1454: STX_I	stx	%r11, [%r4 + 0x0350]
	.word 0xe6210005  ! 1454: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe6210005  ! 1454: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe2712420  ! 1454: STX_I	stx	%r17, [%r4 + 0x0420]
	.word 0xd4710005  ! 1454: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xf47128a0  ! 1454: STX_I	stx	%r26, [%r4 + 0x08a0]
	.word 0x26c90001  ! 1454: BRLZ	brlz,a,pt	%4,<label_0x90001>
	.word 0xd4a11005  ! 1454: STWA_R	stwa	%r10, [%r4 + %r5] 0x80
	.word 0xfa290005  ! 1463: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfe312a4c  ! 1463: STH_I	sth	%r31, [%r4 + 0x0a4c]
	.word 0xf8710005  ! 1463: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xec310005  ! 1463: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe6210005  ! 1463: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd8312cdc  ! 1463: STH_I	sth	%r12, [%r4 + 0x0cdc]
	.word 0xe031219a  ! 1463: STH_I	sth	%r16, [%r4 + 0x019a]
	.word 0x0c800001  ! 1463: BNEG	bneg  	<label_0x1>
	.word 0xd8f04ce2  ! 1463: STXA_R	stxa	%r12, [%r1 + %r2] 0x67
	.word 0xfe290005  ! 1472: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfe310005  ! 1472: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf431276a  ! 1472: STH_I	sth	%r26, [%r4 + 0x076a]
	.word 0xd8712548  ! 1472: STX_I	stx	%r12, [%r4 + 0x0548]
	.word 0xd6210005  ! 1472: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xdc21223c  ! 1472: STW_I	stw	%r14, [%r4 + 0x023c]
	.word 0xe0712f28  ! 1472: STX_I	stx	%r16, [%r4 + 0x0f28]
	.word 0x2e800003  ! 1472: BVS	bvs,a	<label_0x3>
	.word 0xeb210005  ! 1472: STF_R	st	%f21, [%r5, %r4]
	.word 0xe0290005  ! 1482: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe0710005  ! 1482: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xf2310005  ! 1482: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xfa2129a4  ! 1482: STW_I	stw	%r29, [%r4 + 0x09a4]
	.word 0xe8710005  ! 1482: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xfe710005  ! 1482: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe6212ab4  ! 1482: STW_I	stw	%r19, [%r4 + 0x0ab4]
	.word 0xec292e00  ! 1482: STB_I	stb	%r22, [%r4 + 0x0e00]
	.word 0x1e800001  ! 1482: BVC	bvc  	<label_0x1>
	.word 0xd6f0c963  ! 1482: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xd8290005  ! 1491: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe0710005  ! 1491: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xdc2122e4  ! 1491: STW_I	stw	%r14, [%r4 + 0x02e4]
	.word 0xf8210005  ! 1491: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfc3125ea  ! 1491: STH_I	sth	%r30, [%r4 + 0x05ea]
	.word 0xd629264c  ! 1491: STB_I	stb	%r11, [%r4 + 0x064c]
	.word 0xe4290005  ! 1491: STB_R	stb	%r18, [%r4 + %r5]
	.word 0x22800001  ! 1491: BE	be,a	<label_0x1>
	.word 0xd6f04ce7  ! 1491: STXA_R	stxa	%r11, [%r1 + %r7] 0x67
	.word 0xe2290005  ! 1501: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd42921ab  ! 1501: STB_I	stb	%r10, [%r4 + 0x01ab]
	.word 0xec292e27  ! 1501: STB_I	stb	%r22, [%r4 + 0x0e27]
	.word 0xd6310005  ! 1501: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xea290005  ! 1501: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe6212c88  ! 1501: STW_I	stw	%r19, [%r4 + 0x0c88]
	.word 0xfc710005  ! 1501: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf0212344  ! 1501: STW_I	stw	%r24, [%r4 + 0x0344]
	.word 0x04800001  ! 1501: BLE	ble  	<label_0x1>
	.word 0xf2a92629  ! 1501: STBA_I	stba	%r25, [%r4 + 0x0629] %asi
	.word 0xd6290005  ! 1511: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfe292c64  ! 1511: STB_I	stb	%r31, [%r4 + 0x0c64]
	.word 0xf2310005  ! 1511: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd8712a40  ! 1511: STX_I	stx	%r12, [%r4 + 0x0a40]
	.word 0xe4312746  ! 1511: STH_I	sth	%r18, [%r4 + 0x0746]
	.word 0xf8712518  ! 1511: STX_I	stx	%r28, [%r4 + 0x0518]
	.word 0xd6292490  ! 1511: STB_I	stb	%r11, [%r4 + 0x0490]
	.word 0xd8712cd0  ! 1511: STX_I	stx	%r12, [%r4 + 0x0cd0]
	.word 0x0ac90001  ! 1511: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xd6f00ce3  ! 1511: STXA_R	stxa	%r11, [%r0 + %r3] 0x67
	.word 0xe4290005  ! 1520: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xde292188  ! 1520: STB_I	stb	%r15, [%r4 + 0x0188]
	.word 0xf2710005  ! 1520: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xee710005  ! 1520: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf2212860  ! 1520: STW_I	stw	%r25, [%r4 + 0x0860]
	.word 0xd8310005  ! 1520: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xec210005  ! 1520: STW_R	stw	%r22, [%r4 + %r5]
	.word 0x2ac90001  ! 1520: BRNZ	brnz,a,pt	%4,<label_0x90001>
	.word 0xd6f00ce2  ! 1520: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xde290005  ! 1530: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc2925d4  ! 1530: STB_I	stb	%r30, [%r4 + 0x05d4]
	.word 0xee310005  ! 1530: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf2312428  ! 1530: STH_I	sth	%r25, [%r4 + 0x0428]
	.word 0xf6290005  ! 1530: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xee210005  ! 1530: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xea212b28  ! 1530: STW_I	stw	%r21, [%r4 + 0x0b28]
	.word 0xe2710005  ! 1530: STX_R	stx	%r17, [%r4 + %r5]
	.word 0x04800003  ! 1530: BLE	ble  	<label_0x3>
	.word 0xef390005  ! 1530: STDF_R	std	%f23, [%r5, %r4]
	.word 0xd6290005  ! 1540: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xde710005  ! 1540: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf8290005  ! 1540: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe4210005  ! 1540: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xf4712138  ! 1540: STX_I	stx	%r26, [%r4 + 0x0138]
	.word 0xf6310005  ! 1540: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xd6292d68  ! 1540: STB_I	stb	%r11, [%r4 + 0x0d68]
	.word 0xd67126e0  ! 1540: STX_I	stx	%r11, [%r4 + 0x06e0]
	.word 0x24800001  ! 1540: BLE	ble,a	<label_0x1>
	.word 0xe4f928a4  ! 1540: SWAPA_I	swapa	%r18, [%r4 + 0x08a4] %asi
	.word 0xfc290005  ! 1550: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xde712f88  ! 1550: STX_I	stx	%r15, [%r4 + 0x0f88]
	.word 0xf0212830  ! 1550: STW_I	stw	%r24, [%r4 + 0x0830]
	.word 0xe07125d8  ! 1550: STX_I	stx	%r16, [%r4 + 0x05d8]
	.word 0xe6210005  ! 1550: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xfa210005  ! 1550: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd621212c  ! 1550: STW_I	stw	%r11, [%r4 + 0x012c]
	.word 0xf2710005  ! 1550: STX_R	stx	%r25, [%r4 + %r5]
	.word 0x30800003  ! 1550: BA	ba,a	<label_0x3>
	.word 0xed212b78  ! 1550: STF_I	st	%f22, [0x0b78, %r4]
	.word 0xe6290005  ! 1559: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe621244c  ! 1559: STW_I	stw	%r19, [%r4 + 0x044c]
	.word 0xf6310005  ! 1559: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xe4310005  ! 1559: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf6210005  ! 1559: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xe6210005  ! 1559: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xea710005  ! 1559: STX_R	stx	%r21, [%r4 + %r5]
	.word 0x08800003  ! 1559: BLEU	bleu  	<label_0x3>
	.word 0xd8f0cce3  ! 1559: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xf4290005  ! 1568: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf8310005  ! 1568: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xea712af8  ! 1568: STX_I	stx	%r21, [%r4 + 0x0af8]
	.word 0xe6210005  ! 1568: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe4292fdc  ! 1568: STB_I	stb	%r18, [%r4 + 0x0fdc]
	.word 0xf87129f8  ! 1568: STX_I	stx	%r28, [%r4 + 0x09f8]
	.word 0xd4290005  ! 1568: STB_R	stb	%r10, [%r4 + %r5]
	.word 0x00800001  ! 1568: BN	bn  	<label_0x1>
	.word 0xd6792324  ! 1568: SWAP_I	swap	%r11, [%r4 + 0x0324]
	.word 0xea290005  ! 1577: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd6212c94  ! 1577: STW_I	stw	%r11, [%r4 + 0x0c94]
	.word 0xe0212b98  ! 1577: STW_I	stw	%r16, [%r4 + 0x0b98]
	.word 0xf6310005  ! 1577: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xfe2922fd  ! 1577: STB_I	stb	%r31, [%r4 + 0x02fd]
	.word 0xec310005  ! 1577: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xf8292379  ! 1577: STB_I	stb	%r28, [%r4 + 0x0379]
	.word 0x22800001  ! 1577: BE	be,a	<label_0x1>
	.word 0xd6f04ce2  ! 1577: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xe4290005  ! 1586: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xee710005  ! 1586: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf62121b8  ! 1586: STW_I	stw	%r27, [%r4 + 0x01b8]
	.word 0xf6210005  ! 1586: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf2212e20  ! 1586: STW_I	stw	%r25, [%r4 + 0x0e20]
	.word 0xdc710005  ! 1586: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xd82925cb  ! 1586: STB_I	stb	%r12, [%r4 + 0x05cb]
	.word 0x24c90001  ! 1586: BRLEZ	brlez,a,pt	%4,<label_0x90001>
	.word 0xd8f08ce0  ! 1586: STXA_R	stxa	%r12, [%r2 + %r0] 0x67
	.word 0xd4290005  ! 1596: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xd8312a2a  ! 1596: STH_I	sth	%r12, [%r4 + 0x0a2a]
	.word 0xf8712f20  ! 1596: STX_I	stx	%r28, [%r4 + 0x0f20]
	.word 0xe8310005  ! 1596: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xe621206c  ! 1596: STW_I	stw	%r19, [%r4 + 0x006c]
	.word 0xf0210005  ! 1596: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf6712f28  ! 1596: STX_I	stx	%r27, [%r4 + 0x0f28]
	.word 0xe2710005  ! 1596: STX_R	stx	%r17, [%r4 + %r5]
	.word 0x30800001  ! 1596: BA	ba,a	<label_0x1>
	.word 0xf4b92f38  ! 1596: STDA_I	stda	%r26, [%r4 + 0x0f38] %asi
	.word 0xf2290005  ! 1606: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfa210005  ! 1606: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf62120a4  ! 1606: STW_I	stw	%r27, [%r4 + 0x00a4]
	.word 0xdc292803  ! 1606: STB_I	stb	%r14, [%r4 + 0x0803]
	.word 0xdc210005  ! 1606: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xfa2128c4  ! 1606: STW_I	stw	%r29, [%r4 + 0x08c4]
	.word 0xd4212afc  ! 1606: STW_I	stw	%r10, [%r4 + 0x0afc]
	.word 0xf2290005  ! 1606: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x0e800001  ! 1606: BVS	bvs  	<label_0x1>
	.word 0xf0a92245  ! 1606: STBA_I	stba	%r24, [%r4 + 0x0245] %asi
	.word 0xfe290005  ! 1615: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfa710005  ! 1615: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xd6212dd0  ! 1615: STW_I	stw	%r11, [%r4 + 0x0dd0]
	.word 0xf0212154  ! 1615: STW_I	stw	%r24, [%r4 + 0x0154]
	.word 0xda712f50  ! 1615: STX_I	stx	%r13, [%r4 + 0x0f50]
	.word 0xfc212808  ! 1615: STW_I	stw	%r30, [%r4 + 0x0808]
	.word 0xd8210005  ! 1615: STW_R	stw	%r12, [%r4 + %r5]
	.word 0x16800003  ! 1615: BGE	bge  	<label_0x3>
	.word 0xd8f08ce3  ! 1615: STXA_R	stxa	%r12, [%r2 + %r3] 0x67
	.word 0xe6290005  ! 1624: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf8290005  ! 1624: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf6292d64  ! 1624: STB_I	stb	%r27, [%r4 + 0x0d64]
	.word 0xfe210005  ! 1624: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xfa712090  ! 1624: STX_I	stx	%r29, [%r4 + 0x0090]
	.word 0xee212fa4  ! 1624: STW_I	stw	%r23, [%r4 + 0x0fa4]
	.word 0xd629201c  ! 1624: STB_I	stb	%r11, [%r4 + 0x001c]
	.word 0x26800003  ! 1624: BL	bl,a	<label_0x3>
	.word 0xf8e922be  ! 1624: LDSTUBA_I	ldstuba	%r28, [%r4 + 0x02be] %asi
	.word 0xda290005  ! 1633: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf0290005  ! 1633: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf8312bbc  ! 1633: STH_I	sth	%r28, [%r4 + 0x0bbc]
	.word 0xf07125e8  ! 1633: STX_I	stx	%r24, [%r4 + 0x05e8]
	.word 0xf8312fe4  ! 1633: STH_I	sth	%r28, [%r4 + 0x0fe4]
	.word 0xde31294e  ! 1633: STH_I	sth	%r15, [%r4 + 0x094e]
	.word 0xec712298  ! 1633: STX_I	stx	%r22, [%r4 + 0x0298]
	.word 0x2e800001  ! 1633: BVS	bvs,a	<label_0x1>
	.word 0xd6f08ce1  ! 1633: STXA_R	stxa	%r11, [%r2 + %r1] 0x67
	.word 0xda290005  ! 1643: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xda312404  ! 1643: STH_I	sth	%r13, [%r4 + 0x0404]
	.word 0xd8310005  ! 1643: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xda290005  ! 1643: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe83124fc  ! 1643: STH_I	sth	%r20, [%r4 + 0x04fc]
	.word 0xdc310005  ! 1643: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe0210005  ! 1643: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfc292f64  ! 1643: STB_I	stb	%r30, [%r4 + 0x0f64]
	.word 0x2c800001  ! 1643: BNEG	bneg,a	<label_0x1>
	.word 0xd6f1c980  ! 1643: STXA_R	stxa	%r11, [%r7 + %r0] 0x4c
	.word 0xea290005  ! 1652: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xea212258  ! 1652: STW_I	stw	%r21, [%r4 + 0x0258]
	.word 0xee310005  ! 1652: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf2710005  ! 1652: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xdc7120c0  ! 1652: STX_I	stx	%r14, [%r4 + 0x00c0]
	.word 0xe0292cbd  ! 1652: STB_I	stb	%r16, [%r4 + 0x0cbd]
	.word 0xde210005  ! 1652: STW_R	stw	%r15, [%r4 + %r5]
	.word 0x18800003  ! 1652: BGU	bgu  	<label_0x3>
	.word 0xd6f0c963  ! 1652: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xdc290005  ! 1661: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xe47124d8  ! 1661: STX_I	stx	%r18, [%r4 + 0x04d8]
	.word 0xfc312728  ! 1661: STH_I	sth	%r30, [%r4 + 0x0728]
	.word 0xf429270c  ! 1661: STB_I	stb	%r26, [%r4 + 0x070c]
	.word 0xd4310005  ! 1661: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xe0212a60  ! 1661: STW_I	stw	%r16, [%r4 + 0x0a60]
	.word 0xfc210005  ! 1661: STW_R	stw	%r30, [%r4 + %r5]
	.word 0x08800001  ! 1661: BLEU	bleu  	<label_0x1>
	.word 0xd8f24ce3  ! 1661: STXA_R	stxa	%r12, [%r9 + %r3] 0x67
	.word 0xf4290005  ! 1670: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd8212128  ! 1670: STW_I	stw	%r12, [%r4 + 0x0128]
	.word 0xf6312d52  ! 1670: STH_I	sth	%r27, [%r4 + 0x0d52]
	.word 0xdc710005  ! 1670: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xde210005  ! 1670: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xdc712738  ! 1670: STX_I	stx	%r14, [%r4 + 0x0738]
	.word 0xfe710005  ! 1670: STX_R	stx	%r31, [%r4 + %r5]
	.word 0x3c800001  ! 1670: BPOS	bpos,a	<label_0x1>
	.word 0xd6f00960  ! 1670: STXA_R	stxa	%r11, [%r0 + %r0] 0x4b
	.word 0xf0290005  ! 1679: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf0210005  ! 1679: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xea312a0a  ! 1679: STH_I	sth	%r21, [%r4 + 0x0a0a]
	.word 0xe27128a0  ! 1679: STX_I	stx	%r17, [%r4 + 0x08a0]
	.word 0xfe312d34  ! 1679: STH_I	sth	%r31, [%r4 + 0x0d34]
	.word 0xf42127dc  ! 1679: STW_I	stw	%r26, [%r4 + 0x07dc]
	.word 0xf0310005  ! 1679: STH_R	sth	%r24, [%r4 + %r5]
	.word 0x1e800001  ! 1679: BVC	bvc  	<label_0x1>
	.word 0xd6f1cce0  ! 1679: STXA_R	stxa	%r11, [%r7 + %r0] 0x67
	.word 0xd6290005  ! 1689: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf2290005  ! 1689: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xea7127c0  ! 1689: STX_I	stx	%r21, [%r4 + 0x07c0]
	.word 0xfa290005  ! 1689: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe6290005  ! 1689: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf8310005  ! 1689: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xde212b94  ! 1689: STW_I	stw	%r15, [%r4 + 0x0b94]
	.word 0xda31233a  ! 1689: STH_I	sth	%r13, [%r4 + 0x033a]
	.word 0x28800001  ! 1689: BLEU	bleu,a	<label_0x1>
	.word 0xfa7127a8  ! 1689: STX_I	stx	%r29, [%r4 + 0x07a8]
	.word 0xde290005  ! 1698: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xec712b48  ! 1698: STX_I	stx	%r22, [%r4 + 0x0b48]
	.word 0xe6710005  ! 1698: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xf0290005  ! 1698: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfc2929ca  ! 1698: STB_I	stb	%r30, [%r4 + 0x09ca]
	.word 0xda210005  ! 1698: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xde710005  ! 1698: STX_R	stx	%r15, [%r4 + %r5]
	.word 0x2a800001  ! 1698: BCS	bcs,a	<label_0x1>
	.word 0xd6f04960  ! 1698: STXA_R	stxa	%r11, [%r1 + %r0] 0x4b
	.word 0xe8290005  ! 1707: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe03127e2  ! 1707: STH_I	sth	%r16, [%r4 + 0x07e2]
	.word 0xf43120de  ! 1707: STH_I	sth	%r26, [%r4 + 0x00de]
	.word 0xf0212030  ! 1707: STW_I	stw	%r24, [%r4 + 0x0030]
	.word 0xda310005  ! 1707: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xf6710005  ! 1707: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xd6712e98  ! 1707: STX_I	stx	%r11, [%r4 + 0x0e98]
	.word 0x20800001  ! 1707: BN	bn,a	<label_0x1>
	.word 0xec21217c  ! 1707: STW_I	stw	%r22, [%r4 + 0x017c]
	.word 0xf0290005  ! 1716: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfa210005  ! 1716: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd6310005  ! 1716: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xfa312aca  ! 1716: STH_I	sth	%r29, [%r4 + 0x0aca]
	.word 0xdc29260c  ! 1716: STB_I	stb	%r14, [%r4 + 0x060c]
	.word 0xfc21256c  ! 1716: STW_I	stw	%r30, [%r4 + 0x056c]
	.word 0xdc7125e0  ! 1716: STX_I	stx	%r14, [%r4 + 0x05e0]
	.word 0x3e800003  ! 1716: BVC	bvc,a	<label_0x3>
	.word 0xedf12005  ! 1716: CASXA_R	casxa	[%r4]%asi, %r5, %r22
	.word 0xfe290005  ! 1726: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe2710005  ! 1726: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xd4712870  ! 1726: STX_I	stx	%r10, [%r4 + 0x0870]
	.word 0xf42127fc  ! 1726: STW_I	stw	%r26, [%r4 + 0x07fc]
	.word 0xfe712a50  ! 1726: STX_I	stx	%r31, [%r4 + 0x0a50]
	.word 0xea310005  ! 1726: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xe031284c  ! 1726: STH_I	sth	%r16, [%r4 + 0x084c]
	.word 0xfe710005  ! 1726: STX_R	stx	%r31, [%r4 + %r5]
	.word 0x22c10001  ! 1726: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xf3f12005  ! 1726: CASXA_R	casxa	[%r4]%asi, %r5, %r25
	.word 0xfe290005  ! 1735: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe2292b7c  ! 1735: STB_I	stb	%r17, [%r4 + 0x0b7c]
	.word 0xf2710005  ! 1735: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xf4712cf8  ! 1735: STX_I	stx	%r26, [%r4 + 0x0cf8]
	.word 0xd4710005  ! 1735: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xd429241a  ! 1735: STB_I	stb	%r10, [%r4 + 0x041a]
	.word 0xd8310005  ! 1735: STH_R	sth	%r12, [%r4 + %r5]
	.word 0x02800003  ! 1735: BE	be  	<label_0x3>
	.word 0xd6f00966  ! 1735: STXA_R	stxa	%r11, [%r0 + %r6] 0x4b
	.word 0xfc290005  ! 1744: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfe310005  ! 1744: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf0210005  ! 1744: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xd4210005  ! 1744: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe0310005  ! 1744: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xd6310005  ! 1744: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe6712d08  ! 1744: STX_I	stx	%r19, [%r4 + 0x0d08]
	.word 0x3a800003  ! 1744: BCC	bcc,a	<label_0x3>
	.word 0xf9210005  ! 1744: STF_R	st	%f28, [%r5, %r4]
	.word 0xe6290005  ! 1753: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd6210005  ! 1753: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xd8310005  ! 1753: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe02128a8  ! 1753: STW_I	stw	%r16, [%r4 + 0x08a8]
	.word 0xfa710005  ! 1753: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xfe710005  ! 1753: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xf2310005  ! 1753: STH_R	sth	%r25, [%r4 + %r5]
	.word 0x04800001  ! 1753: BLE	ble  	<label_0x1>
	.word 0xd6f24ce2  ! 1753: STXA_R	stxa	%r11, [%r9 + %r2] 0x67
	.word 0xf6290005  ! 1763: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xd87127a0  ! 1763: STX_I	stx	%r12, [%r4 + 0x07a0]
	.word 0xfe292b5f  ! 1763: STB_I	stb	%r31, [%r4 + 0x0b5f]
	.word 0xe0312b62  ! 1763: STH_I	sth	%r16, [%r4 + 0x0b62]
	.word 0xd4290005  ! 1763: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe4210005  ! 1763: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xea710005  ! 1763: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf0292cfc  ! 1763: STB_I	stb	%r24, [%r4 + 0x0cfc]
	.word 0x40000001  ! 1763: CALL	call	disp30_1
	.word 0xf8f92348  ! 1763: SWAPA_I	swapa	%r28, [%r4 + 0x0348] %asi
	.word 0xd6290005  ! 1772: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xde212e18  ! 1772: STW_I	stw	%r15, [%r4 + 0x0e18]
	.word 0xee710005  ! 1772: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xd4210005  ! 1772: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xdc710005  ! 1772: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xe4212348  ! 1772: STW_I	stw	%r18, [%r4 + 0x0348]
	.word 0xfa312024  ! 1772: STH_I	sth	%r29, [%r4 + 0x0024]
	.word 0x24800003  ! 1772: BLE	ble,a	<label_0x3>
	.word 0xe0b91005  ! 1772: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xea290005  ! 1781: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf63121ca  ! 1781: STH_I	sth	%r27, [%r4 + 0x01ca]
	.word 0xd4310005  ! 1781: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf6210005  ! 1781: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xda290005  ! 1781: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf27126d0  ! 1781: STX_I	stx	%r25, [%r4 + 0x06d0]
	.word 0xe6710005  ! 1781: STX_R	stx	%r19, [%r4 + %r5]
	.word 0x2ac10001  ! 1781: BRNZ	brnz,a,nt	%4,<label_0x10001>
	.word 0xd6f24963  ! 1781: STXA_R	stxa	%r11, [%r9 + %r3] 0x4b
	.word 0xe6290005  ! 1791: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf8712440  ! 1791: STX_I	stx	%r28, [%r4 + 0x0440]
	.word 0xdc290005  ! 1791: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd4710005  ! 1791: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xda312c32  ! 1791: STH_I	sth	%r13, [%r4 + 0x0c32]
	.word 0xdc312a16  ! 1791: STH_I	sth	%r14, [%r4 + 0x0a16]
	.word 0xf4312bd2  ! 1791: STH_I	sth	%r26, [%r4 + 0x0bd2]
	.word 0xe4292a5d  ! 1791: STB_I	stb	%r18, [%r4 + 0x0a5d]
	.word 0x0cc10001  ! 1791: BRGZ	brgz  ,nt	%4,<label_0x10001>
	.word 0xf1210005  ! 1791: STF_R	st	%f24, [%r5, %r4]
	.word 0xe4290005  ! 1800: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xea712178  ! 1800: STX_I	stx	%r21, [%r4 + 0x0178]
	.word 0xf621272c  ! 1800: STW_I	stw	%r27, [%r4 + 0x072c]
	.word 0xd4310005  ! 1800: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xee710005  ! 1800: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe07120c8  ! 1800: STX_I	stx	%r16, [%r4 + 0x00c8]
	.word 0xd6312fb0  ! 1800: STH_I	sth	%r11, [%r4 + 0x0fb0]
	.word 0x3a800001  ! 1800: BCC	bcc,a	<label_0x1>
	.word 0xda792308  ! 1800: SWAP_I	swap	%r13, [%r4 + 0x0308]
	.word 0xda290005  ! 1809: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xec710005  ! 1809: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xe8210005  ! 1809: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xde212fc8  ! 1809: STW_I	stw	%r15, [%r4 + 0x0fc8]
	.word 0xe6310005  ! 1809: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xfc710005  ! 1809: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xd8310005  ! 1809: STH_R	sth	%r12, [%r4 + %r5]
	.word 0x3e800003  ! 1809: BVC	bvc,a	<label_0x3>
	.word 0xd8f0cce3  ! 1809: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xd4290005  ! 1819: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xec290005  ! 1819: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4212c64  ! 1819: STW_I	stw	%r18, [%r4 + 0x0c64]
	.word 0xd4712a50  ! 1819: STX_I	stx	%r10, [%r4 + 0x0a50]
	.word 0xe42128c4  ! 1819: STW_I	stw	%r18, [%r4 + 0x08c4]
	.word 0xec292121  ! 1819: STB_I	stb	%r22, [%r4 + 0x0121]
	.word 0xfc210005  ! 1819: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xfe290005  ! 1819: STB_R	stb	%r31, [%r4 + %r5]
	.word 0x06c10003  ! 1819: BRLZ	brlz  ,nt	%4,<label_0x10003>
	.word 0xd9392500  ! 1819: STDF_I	std	%f12, [0x0500, %r4]
	.word 0xea290005  ! 1828: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf2310005  ! 1828: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xfe210005  ! 1828: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xe429268c  ! 1828: STB_I	stb	%r18, [%r4 + 0x068c]
	.word 0xf87127f8  ! 1828: STX_I	stx	%r28, [%r4 + 0x07f8]
	.word 0xdc712148  ! 1828: STX_I	stx	%r14, [%r4 + 0x0148]
	.word 0xf8212d84  ! 1828: STW_I	stw	%r28, [%r4 + 0x0d84]
	.word 0x02c10001  ! 1828: BRZ	brz  ,nt	%4,<label_0x10001>
	.word 0xd6f24ce6  ! 1828: STXA_R	stxa	%r11, [%r9 + %r6] 0x67
	.word 0xd8290005  ! 1837: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf4312c38  ! 1837: STH_I	sth	%r26, [%r4 + 0x0c38]
	.word 0xee310005  ! 1837: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xee212610  ! 1837: STW_I	stw	%r23, [%r4 + 0x0610]
	.word 0xf0290005  ! 1837: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf6712c38  ! 1837: STX_I	stx	%r27, [%r4 + 0x0c38]
	.word 0xee310005  ! 1837: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x0cc10001  ! 1837: BRGZ	brgz  ,nt	%4,<label_0x10001>
	.word 0xfa312792  ! 1837: STH_I	sth	%r29, [%r4 + 0x0792]
	.word 0xee290005  ! 1846: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf4290005  ! 1846: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xec290005  ! 1846: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe63127bc  ! 1846: STH_I	sth	%r19, [%r4 + 0x07bc]
	.word 0xfe290005  ! 1846: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf6292c54  ! 1846: STB_I	stb	%r27, [%r4 + 0x0c54]
	.word 0xe0210005  ! 1846: STW_R	stw	%r16, [%r4 + %r5]
	.word 0x2cc10001  ! 1846: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd6f00980  ! 1846: STXA_R	stxa	%r11, [%r0 + %r0] 0x4c
	.word 0xfc290005  ! 1855: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfc312e1c  ! 1855: STH_I	sth	%r30, [%r4 + 0x0e1c]
	.word 0xe0712140  ! 1855: STX_I	stx	%r16, [%r4 + 0x0140]
	.word 0xda710005  ! 1855: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xe8310005  ! 1855: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xfc312756  ! 1855: STH_I	sth	%r30, [%r4 + 0x0756]
	.word 0xda310005  ! 1855: STH_R	sth	%r13, [%r4 + %r5]
	.word 0x0ec90001  ! 1855: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xd8b129b2  ! 1855: STHA_I	stha	%r12, [%r4 + 0x09b2] %asi
	.word 0xe2290005  ! 1864: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe4290005  ! 1864: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xee2921f1  ! 1864: STB_I	stb	%r23, [%r4 + 0x01f1]
	.word 0xf0710005  ! 1864: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xd4212d5c  ! 1864: STW_I	stw	%r10, [%r4 + 0x0d5c]
	.word 0xf2292176  ! 1864: STB_I	stb	%r25, [%r4 + 0x0176]
	.word 0xec292ceb  ! 1864: STB_I	stb	%r22, [%r4 + 0x0ceb]
	.word 0x26c10001  ! 1864: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xfea129b4  ! 1864: STWA_I	stwa	%r31, [%r4 + 0x09b4] %asi
	.word 0xda290005  ! 1873: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa212ce0  ! 1873: STW_I	stw	%r29, [%r4 + 0x0ce0]
	.word 0xea712288  ! 1873: STX_I	stx	%r21, [%r4 + 0x0288]
	.word 0xec21244c  ! 1873: STW_I	stw	%r22, [%r4 + 0x044c]
	.word 0xd6712850  ! 1873: STX_I	stx	%r11, [%r4 + 0x0850]
	.word 0xdc290005  ! 1873: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xea290005  ! 1873: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x2cc10001  ! 1873: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd6f04966  ! 1873: STXA_R	stxa	%r11, [%r1 + %r6] 0x4b
	.word 0xde290005  ! 1882: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfa712b28  ! 1882: STX_I	stx	%r29, [%r4 + 0x0b28]
	.word 0xd6310005  ! 1882: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xf6312f3e  ! 1882: STH_I	sth	%r27, [%r4 + 0x0f3e]
	.word 0xf8312d5c  ! 1882: STH_I	sth	%r28, [%r4 + 0x0d5c]
	.word 0xd4290005  ! 1882: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe2210005  ! 1882: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x02800003  ! 1882: BE	be  	<label_0x3>
	.word 0xdcb11005  ! 1882: STHA_R	stha	%r14, [%r4 + %r5] 0x80
	.word 0xf6290005  ! 1891: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe4292079  ! 1891: STB_I	stb	%r18, [%r4 + 0x0079]
	.word 0xf62122c8  ! 1891: STW_I	stw	%r27, [%r4 + 0x02c8]
	.word 0xd829296c  ! 1891: STB_I	stb	%r12, [%r4 + 0x096c]
	.word 0xf22123a4  ! 1891: STW_I	stw	%r25, [%r4 + 0x03a4]
	.word 0xee210005  ! 1891: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xde312076  ! 1891: STH_I	sth	%r15, [%r4 + 0x0076]
	.word 0x04c10001  ! 1891: BRLEZ	brlez  ,nt	%4,<label_0x10001>
	.word 0xd8f00962  ! 1891: STXA_R	stxa	%r12, [%r0 + %r2] 0x4b
	.word 0xfe290005  ! 1900: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xec712d38  ! 1900: STX_I	stx	%r22, [%r4 + 0x0d38]
	.word 0xf27127d0  ! 1900: STX_I	stx	%r25, [%r4 + 0x07d0]
	.word 0xe6210005  ! 1900: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd8290005  ! 1900: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe8290005  ! 1900: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xec712ed8  ! 1900: STX_I	stx	%r22, [%r4 + 0x0ed8]
	.word 0x26800003  ! 1900: BL	bl,a	<label_0x3>
	.word 0xd6f00983  ! 1900: STXA_R	stxa	%r11, [%r0 + %r3] 0x4c
	.word 0xf0290005  ! 1910: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe4712c10  ! 1910: STX_I	stx	%r18, [%r4 + 0x0c10]
	.word 0xfa310005  ! 1910: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xfe712020  ! 1910: STX_I	stx	%r31, [%r4 + 0x0020]
	.word 0xee210005  ! 1910: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xd6312c54  ! 1910: STH_I	sth	%r11, [%r4 + 0x0c54]
	.word 0xe0210005  ! 1910: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xf82120b4  ! 1910: STW_I	stw	%r28, [%r4 + 0x00b4]
	.word 0x1a800001  ! 1910: BCC	bcc  	<label_0x1>
	.word 0xe4a11005  ! 1910: STWA_R	stwa	%r18, [%r4 + %r5] 0x80
	.word 0xf8290005  ! 1920: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf0312bc8  ! 1920: STH_I	sth	%r24, [%r4 + 0x0bc8]
	.word 0xfa712a68  ! 1920: STX_I	stx	%r29, [%r4 + 0x0a68]
	.word 0xea290005  ! 1920: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe431228e  ! 1920: STH_I	sth	%r18, [%r4 + 0x028e]
	.word 0xf0212470  ! 1920: STW_I	stw	%r24, [%r4 + 0x0470]
	.word 0xea292536  ! 1920: STB_I	stb	%r21, [%r4 + 0x0536]
	.word 0xe6212414  ! 1920: STW_I	stw	%r19, [%r4 + 0x0414]
	.word 0x3e800001  ! 1920: BVC	bvc,a	<label_0x1>
	.word 0xea310005  ! 1920: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xe6290005  ! 1929: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe0290005  ! 1929: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf8292edc  ! 1929: STB_I	stb	%r28, [%r4 + 0x0edc]
	.word 0xec210005  ! 1929: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xe8290005  ! 1929: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf4710005  ! 1929: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xfa292b7c  ! 1929: STB_I	stb	%r29, [%r4 + 0x0b7c]
	.word 0x06800001  ! 1929: BL	bl  	<label_0x1>
	.word 0xf4f91005  ! 1929: SWAPA_R	swapa	%r26, [%r4 + %r5] 0x80
	.word 0xfc290005  ! 1938: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xee212bf0  ! 1938: STW_I	stw	%r23, [%r4 + 0x0bf0]
	.word 0xd4290005  ! 1938: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf8710005  ! 1938: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xd6290005  ! 1938: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe0312106  ! 1938: STH_I	sth	%r16, [%r4 + 0x0106]
	.word 0xde310005  ! 1938: STH_R	sth	%r15, [%r4 + %r5]
	.word 0x14800001  ! 1938: BG	bg  	<label_0x1>
	.word 0xd8f1c969  ! 1938: STXA_R	stxa	%r12, [%r7 + %r9] 0x4b
	.word 0xfe290005  ! 1948: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xd4710005  ! 1948: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe2710005  ! 1948: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xda212944  ! 1948: STW_I	stw	%r13, [%r4 + 0x0944]
	.word 0xfc290005  ! 1948: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xde210005  ! 1948: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe4290005  ! 1948: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xfc710005  ! 1948: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x08800003  ! 1948: BLEU	bleu  	<label_0x3>
	.word 0xd6f20ce1  ! 1948: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
	.word 0xe2290005  ! 1957: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xda210005  ! 1957: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xda710005  ! 1957: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xfc292981  ! 1957: STB_I	stb	%r30, [%r4 + 0x0981]
	.word 0xd4212c24  ! 1957: STW_I	stw	%r10, [%r4 + 0x0c24]
	.word 0xe63120b0  ! 1957: STH_I	sth	%r19, [%r4 + 0x00b0]
	.word 0xfa2922a0  ! 1957: STB_I	stb	%r29, [%r4 + 0x02a0]
	.word 0x1a800001  ! 1957: BCC	bcc  	<label_0x1>
	.word 0xf8e91005  ! 1957: LDSTUBA_R	ldstuba	%r28, [%r4 + %r5] 0x80
	.word 0xf0290005  ! 1966: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf0212438  ! 1966: STW_I	stw	%r24, [%r4 + 0x0438]
	.word 0xda3126c6  ! 1966: STH_I	sth	%r13, [%r4 + 0x06c6]
	.word 0xdc210005  ! 1966: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xda212244  ! 1966: STW_I	stw	%r13, [%r4 + 0x0244]
	.word 0xe2310005  ! 1966: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xd6712ce0  ! 1966: STX_I	stx	%r11, [%r4 + 0x0ce0]
	.word 0x18800003  ! 1966: BGU	bgu  	<label_0x3>
	.word 0xde212594  ! 1966: STW_I	stw	%r15, [%r4 + 0x0594]
	.word 0xf0290005  ! 1975: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfc710005  ! 1975: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xda310005  ! 1975: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xd8712550  ! 1975: STX_I	stx	%r12, [%r4 + 0x0550]
	.word 0xf0310005  ! 1975: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xd6312db2  ! 1975: STH_I	sth	%r11, [%r4 + 0x0db2]
	.word 0xe2710005  ! 1975: STX_R	stx	%r17, [%r4 + %r5]
	.word 0x16800003  ! 1975: BGE	bge  	<label_0x3>
	.word 0xd6f0c982  ! 1975: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xd6290005  ! 1985: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfc29243e  ! 1985: STB_I	stb	%r30, [%r4 + 0x043e]
	.word 0xfc210005  ! 1985: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xd4312e74  ! 1985: STH_I	sth	%r10, [%r4 + 0x0e74]
	.word 0xe2290005  ! 1985: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xde210005  ! 1985: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xde312552  ! 1985: STH_I	sth	%r15, [%r4 + 0x0552]
	.word 0xf029224f  ! 1985: STB_I	stb	%r24, [%r4 + 0x024f]
	.word 0x04c10001  ! 1985: BRLEZ	brlez  ,nt	%4,<label_0x10001>
	.word 0xd6f00983  ! 1985: STXA_R	stxa	%r11, [%r0 + %r3] 0x4c
	.word 0xd6290005  ! 1995: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd8212568  ! 1995: STW_I	stw	%r12, [%r4 + 0x0568]
	.word 0xda710005  ! 1995: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xde292deb  ! 1995: STB_I	stb	%r15, [%r4 + 0x0deb]
	.word 0xe4212934  ! 1995: STW_I	stw	%r18, [%r4 + 0x0934]
	.word 0xd6712608  ! 1995: STX_I	stx	%r11, [%r4 + 0x0608]
	.word 0xda210005  ! 1995: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xda29277a  ! 1995: STB_I	stb	%r13, [%r4 + 0x077a]
	.word 0x36800001  ! 1995: BGE	bge,a	<label_0x1>
	.word 0xd6f0c963  ! 1995: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
        ta      T_GOOD_TRAP
	nop
	nop

th_main_1:
	setx  0x30cf1522026b2f10, %r1, %r1
	setx  0xfe4a009c096a4670, %r1, %r2
	setx  0xac967b8c0fc1f3a0, %r1, %r3
	setx  0xe49b5eaf0c523ef8, %r1, %r6
	setx  0xb7aa3a9c0b3022a8, %r1, %r7
	setx  0xede4623107053eb8, %r1, %r8
	setx  0x76498c5801cdb220, %r1, %r9
	setx  0xdcf82fd07abb1abe, %r1, %r13
	setx  0x24e46b908d39aff4, %r1, %r14
	setx  0xef0c6320a819ad10, %r1, %r15
	setx  0x79eb0a80b428f5ab, %r1, %r16
	setx  0xf92fc6c027cc8121, %r1, %r17
	setx  0x16dba1a0d11e3614, %r1, %r18
	setx  0x25ef1f20a2dce480, %r1, %r19
	setx  0x47f609e089ead2b5, %r1, %r20
	setx  0xf9f248b035e76a0a, %r1, %r21
	setx  0x8f1677405a1310f2, %r1, %r22
	setx  0xa89b239095669980, %r1, %r23
	setx  0x52c6fb1085867705, %r1, %r24
	setx  0x4130c9108675dcda, %r1, %r25
	setx  0xfae60f506a96828d, %r1, %r26
	setx  0xccb67c30b17caeab, %r1, %r27
	setx  0x15354f902e9374c6, %r1, %r28
	setx  0xe280e80083bf03eb, %r1, %r29
	setx  0xda089f3020abf47e, %r1, %r30
	setx  0x7bcfb9d0bc63dc07, %r1, %r31
	setx  0x2547797ed27d2570, %r1, %r13
	setx  0xb000ff527d8d8a97, %r1, %r14
	setx  0xf2ac44b34a95c892, %r1, %r15
	setx  0x6c7d0f3a7f4adea0, %r1, %r16
	setx  0xe626b1e5f5e24a44, %r1, %r17
	setx  0x075c9e9bbc05d0cc, %r1, %r18
	setx  0x7e29676252fb94a0, %r1, %r19
	setx  0xab5964de48164ec0, %r1, %r20
	setx  0x367d41095e43c0be, %r1, %r21
	setx  0xa95fa457180e688d, %r1, %r22
	setx  0x1b2f197aa85f8368, %r1, %r23
	setx  0xaea5826252c8fbfc, %r1, %r24
	setx  0xb72e34ed479848b0, %r1, %r25
	setx  0x44d02635314bfd71, %r1, %r26
	setx  0x54cea11c1c669d05, %r1, %r27
	setx  0xd83841cdfed24c54, %r1, %r28
	setx  0x6aa32d0e64f69eb3, %r1, %r29
	setx  0x4c62a39fde1086a5, %r1, %r30
	setx  0x5fe7f10ace511051, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000d00, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfe290005  ! 12: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf0710005  ! 12: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xd6312f58  ! 12: STH_I	sth	%r11, [%r4 + 0x0f58]
	.word 0xec210005  ! 12: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xf8210005  ! 12: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xdc312596  ! 12: STH_I	sth	%r14, [%r4 + 0x0596]
	.word 0xee212ad0  ! 12: STW_I	stw	%r23, [%r4 + 0x0ad0]
	.word 0xd6292856  ! 12: STB_I	stb	%r11, [%r4 + 0x0856]
	.word 0x26800001  ! 12: BL	bl,a	<label_0x1>
	.word 0xd8f0cce7  ! 12: STXA_R	stxa	%r12, [%r3 + %r7] 0x67
	.word 0xf0290005  ! 22: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xda290005  ! 22: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfe210005  ! 22: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xda31228a  ! 22: STH_I	sth	%r13, [%r4 + 0x028a]
	.word 0xdc3126b6  ! 22: STH_I	sth	%r14, [%r4 + 0x06b6]
	.word 0xee2928dc  ! 22: STB_I	stb	%r23, [%r4 + 0x08dc]
	.word 0xf2210005  ! 22: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xea312d2c  ! 22: STH_I	sth	%r21, [%r4 + 0x0d2c]
	.word 0x26800003  ! 22: BL	bl,a	<label_0x3>
	.word 0xd6f08982  ! 22: STXA_R	stxa	%r11, [%r2 + %r2] 0x4c
	.word 0xfe290005  ! 32: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xda310005  ! 32: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xda712b08  ! 32: STX_I	stx	%r13, [%r4 + 0x0b08]
	.word 0xf4310005  ! 32: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd8310005  ! 32: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf2712970  ! 32: STX_I	stx	%r25, [%r4 + 0x0970]
	.word 0xfe312726  ! 32: STH_I	sth	%r31, [%r4 + 0x0726]
	.word 0xe4210005  ! 32: STW_R	stw	%r18, [%r4 + %r5]
	.word 0x06c90001  ! 32: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xf0312932  ! 32: STH_I	sth	%r24, [%r4 + 0x0932]
	.word 0xfa290005  ! 41: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xde710005  ! 41: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xe4292489  ! 41: STB_I	stb	%r18, [%r4 + 0x0489]
	.word 0xfc29266c  ! 41: STB_I	stb	%r30, [%r4 + 0x066c]
	.word 0xe2712470  ! 41: STX_I	stx	%r17, [%r4 + 0x0470]
	.word 0xd4290005  ! 41: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xdc212864  ! 41: STW_I	stw	%r14, [%r4 + 0x0864]
	.word 0x2ec90001  ! 41: BRGEZ	brgez,a,pt	%4,<label_0x90001>
	.word 0xd8f04980  ! 41: STXA_R	stxa	%r12, [%r1 + %r0] 0x4c
	.word 0xfa290005  ! 50: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd67120f0  ! 50: STX_I	stx	%r11, [%r4 + 0x00f0]
	.word 0xf0710005  ! 50: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xe4212ce8  ! 50: STW_I	stw	%r18, [%r4 + 0x0ce8]
	.word 0xec212cc4  ! 50: STW_I	stw	%r22, [%r4 + 0x0cc4]
	.word 0xfc710005  ! 50: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe0312562  ! 50: STH_I	sth	%r16, [%r4 + 0x0562]
	.word 0x04800001  ! 50: BLE	ble  	<label_0x1>
	.word 0xf2712718  ! 50: STX_I	stx	%r25, [%r4 + 0x0718]
	.word 0xf2290005  ! 59: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe42925f4  ! 59: STB_I	stb	%r18, [%r4 + 0x05f4]
	.word 0xe2710005  ! 59: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xea290005  ! 59: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe6292f16  ! 59: STB_I	stb	%r19, [%r4 + 0x0f16]
	.word 0xe2712718  ! 59: STX_I	stx	%r17, [%r4 + 0x0718]
	.word 0xfa712bd8  ! 59: STX_I	stx	%r29, [%r4 + 0x0bd8]
	.word 0x1e800001  ! 59: BVC	bvc  	<label_0x1>
	.word 0xe2f91005  ! 59: SWAPA_R	swapa	%r17, [%r4 + %r5] 0x80
	.word 0xdc290005  ! 68: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd8710005  ! 68: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xfc3123e6  ! 68: STH_I	sth	%r30, [%r4 + 0x03e6]
	.word 0xee312bca  ! 68: STH_I	sth	%r23, [%r4 + 0x0bca]
	.word 0xfa2927ae  ! 68: STB_I	stb	%r29, [%r4 + 0x07ae]
	.word 0xec710005  ! 68: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xf6210005  ! 68: STW_R	stw	%r27, [%r4 + %r5]
	.word 0x30800001  ! 68: BA	ba,a	<label_0x1>
	.word 0xd6f24ce3  ! 68: STXA_R	stxa	%r11, [%r9 + %r3] 0x67
	.word 0xf4290005  ! 77: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd8312f98  ! 77: STH_I	sth	%r12, [%r4 + 0x0f98]
	.word 0xf4310005  ! 77: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xec312818  ! 77: STH_I	sth	%r22, [%r4 + 0x0818]
	.word 0xf23127a2  ! 77: STH_I	sth	%r25, [%r4 + 0x07a2]
	.word 0xfc210005  ! 77: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xd4290005  ! 77: STB_R	stb	%r10, [%r4 + %r5]
	.word 0x14800003  ! 77: BG	bg  	<label_0x3>
	.word 0xd8f00ce8  ! 77: STXA_R	stxa	%r12, [%r0 + %r8] 0x67
	.word 0xde290005  ! 86: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfe290005  ! 86: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfc3128b0  ! 86: STH_I	sth	%r30, [%r4 + 0x08b0]
	.word 0xe8290005  ! 86: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xec712968  ! 86: STX_I	stx	%r22, [%r4 + 0x0968]
	.word 0xdc290005  ! 86: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xe821259c  ! 86: STW_I	stw	%r20, [%r4 + 0x059c]
	.word 0x26c90001  ! 86: BRLZ	brlz,a,pt	%4,<label_0x90001>
	.word 0xd8f24982  ! 86: STXA_R	stxa	%r12, [%r9 + %r2] 0x4c
	.word 0xf6290005  ! 96: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf6292180  ! 96: STB_I	stb	%r27, [%r4 + 0x0180]
	.word 0xf6290005  ! 96: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf8710005  ! 96: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf6312aca  ! 96: STH_I	sth	%r27, [%r4 + 0x0aca]
	.word 0xee290005  ! 96: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf6212424  ! 96: STW_I	stw	%r27, [%r4 + 0x0424]
	.word 0xec3128de  ! 96: STH_I	sth	%r22, [%r4 + 0x08de]
	.word 0x18800001  ! 96: BGU	bgu  	<label_0x1>
	.word 0xe0b91005  ! 96: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xde290005  ! 105: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf2210005  ! 105: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xda2125b0  ! 105: STW_I	stw	%r13, [%r4 + 0x05b0]
	.word 0xda310005  ! 105: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xe4290005  ! 105: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf8310005  ! 105: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf2290005  ! 105: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x3c800001  ! 105: BPOS	bpos,a	<label_0x1>
	.word 0xd6f04963  ! 105: STXA_R	stxa	%r11, [%r1 + %r3] 0x4b
	.word 0xe8290005  ! 114: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd4310005  ! 114: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xda310005  ! 114: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xfa212f84  ! 114: STW_I	stw	%r29, [%r4 + 0x0f84]
	.word 0xfe290005  ! 114: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xd4210005  ! 114: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe63124ea  ! 114: STH_I	sth	%r19, [%r4 + 0x04ea]
	.word 0x06c90001  ! 114: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xd5210005  ! 114: STF_R	st	%f10, [%r5, %r4]
	.word 0xfc290005  ! 123: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe2290005  ! 123: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf0710005  ! 123: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xf0290005  ! 123: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf029291e  ! 123: STB_I	stb	%r24, [%r4 + 0x091e]
	.word 0xf4310005  ! 123: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd6710005  ! 123: STX_R	stx	%r11, [%r4 + %r5]
	.word 0x1e800001  ! 123: BVC	bvc  	<label_0x1>
	.word 0xe9210005  ! 123: STF_R	st	%f20, [%r5, %r4]
	.word 0xf4290005  ! 133: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xee310005  ! 133: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xda712d70  ! 133: STX_I	stx	%r13, [%r4 + 0x0d70]
	.word 0xd6290005  ! 133: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xda210005  ! 133: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xd6310005  ! 133: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xde712340  ! 133: STX_I	stx	%r15, [%r4 + 0x0340]
	.word 0xe2292171  ! 133: STB_I	stb	%r17, [%r4 + 0x0171]
	.word 0x0a800003  ! 133: BCS	bcs  	<label_0x3>
	.word 0xe0b12ef4  ! 133: STHA_I	stha	%r16, [%r4 + 0x0ef4] %asi
	.word 0xde290005  ! 143: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xda290005  ! 143: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd8292d27  ! 143: STB_I	stb	%r12, [%r4 + 0x0d27]
	.word 0xd6712b30  ! 143: STX_I	stx	%r11, [%r4 + 0x0b30]
	.word 0xf2210005  ! 143: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xde712d40  ! 143: STX_I	stx	%r15, [%r4 + 0x0d40]
	.word 0xd4212988  ! 143: STW_I	stw	%r10, [%r4 + 0x0988]
	.word 0xd4212aa4  ! 143: STW_I	stw	%r10, [%r4 + 0x0aa4]
	.word 0x1e800003  ! 143: BVC	bvc  	<label_0x3>
	.word 0xd6f00980  ! 143: STXA_R	stxa	%r11, [%r0 + %r0] 0x4c
	.word 0xee290005  ! 153: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfa710005  ! 153: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe8212510  ! 153: STW_I	stw	%r20, [%r4 + 0x0510]
	.word 0xfe710005  ! 153: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xfa712660  ! 153: STX_I	stx	%r29, [%r4 + 0x0660]
	.word 0xec710005  ! 153: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xd4710005  ! 153: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe4712160  ! 153: STX_I	stx	%r18, [%r4 + 0x0160]
	.word 0x28800003  ! 153: BLEU	bleu,a	<label_0x3>
	.word 0xd6f04ce3  ! 153: STXA_R	stxa	%r11, [%r1 + %r3] 0x67
	.word 0xf6290005  ! 162: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfa312760  ! 162: STH_I	sth	%r29, [%r4 + 0x0760]
	.word 0xea710005  ! 162: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xde310005  ! 162: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xd6212db4  ! 162: STW_I	stw	%r11, [%r4 + 0x0db4]
	.word 0xe4310005  ! 162: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xee710005  ! 162: STX_R	stx	%r23, [%r4 + %r5]
	.word 0x04c90003  ! 162: BRLEZ	brlez  ,pt	%4,<label_0x90003>
	.word 0xf0f12480  ! 162: STXA_I	stxa	%r24, [%r4 + 0x0480] %asi
	.word 0xdc290005  ! 172: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf62123ec  ! 172: STW_I	stw	%r27, [%r4 + 0x03ec]
	.word 0xd6310005  ! 172: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xda210005  ! 172: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xe8710005  ! 172: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd831252c  ! 172: STH_I	sth	%r12, [%r4 + 0x052c]
	.word 0xe8212ee4  ! 172: STW_I	stw	%r20, [%r4 + 0x0ee4]
	.word 0xee710005  ! 172: STX_R	stx	%r23, [%r4 + %r5]
	.word 0x3e800001  ! 172: BVC	bvc,a	<label_0x1>
	.word 0xdc2129c8  ! 172: STW_I	stw	%r14, [%r4 + 0x09c8]
	.word 0xe0290005  ! 181: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xda712b30  ! 181: STX_I	stx	%r13, [%r4 + 0x0b30]
	.word 0xde2121ac  ! 181: STW_I	stw	%r15, [%r4 + 0x01ac]
	.word 0xea712660  ! 181: STX_I	stx	%r21, [%r4 + 0x0660]
	.word 0xe8210005  ! 181: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xda290005  ! 181: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd8312bd4  ! 181: STH_I	sth	%r12, [%r4 + 0x0bd4]
	.word 0x0ec90001  ! 181: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xdd390005  ! 181: STDF_R	std	%f14, [%r5, %r4]
	.word 0xe2290005  ! 190: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd4712130  ! 190: STX_I	stx	%r10, [%r4 + 0x0130]
	.word 0xee2128c0  ! 190: STW_I	stw	%r23, [%r4 + 0x08c0]
	.word 0xe62920ac  ! 190: STB_I	stb	%r19, [%r4 + 0x00ac]
	.word 0xfa292573  ! 190: STB_I	stb	%r29, [%r4 + 0x0573]
	.word 0xec710005  ! 190: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xe42121d8  ! 190: STW_I	stw	%r18, [%r4 + 0x01d8]
	.word 0x26800003  ! 190: BL	bl,a	<label_0x3>
	.word 0xe3e11005  ! 190: CASA_I	casa	[%r4] 0x80, %r5, %r17
	.word 0xe2290005  ! 200: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfe29296a  ! 200: STB_I	stb	%r31, [%r4 + 0x096a]
	.word 0xe8710005  ! 200: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xec712430  ! 200: STX_I	stx	%r22, [%r4 + 0x0430]
	.word 0xf2210005  ! 200: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xe8310005  ! 200: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xda312254  ! 200: STH_I	sth	%r13, [%r4 + 0x0254]
	.word 0xd631262c  ! 200: STH_I	sth	%r11, [%r4 + 0x062c]
	.word 0x0ec10001  ! 200: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd8f0c981  ! 200: STXA_R	stxa	%r12, [%r3 + %r1] 0x4c
	.word 0xe6290005  ! 209: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf0210005  ! 209: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xd47121f8  ! 209: STX_I	stx	%r10, [%r4 + 0x01f8]
	.word 0xd4212324  ! 209: STW_I	stw	%r10, [%r4 + 0x0324]
	.word 0xfa210005  ! 209: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd8212b34  ! 209: STW_I	stw	%r12, [%r4 + 0x0b34]
	.word 0xe0310005  ! 209: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x02800003  ! 209: BE	be  	<label_0x3>
	.word 0xe6f11005  ! 209: STXA_R	stxa	%r19, [%r4 + %r5] 0x80
	.word 0xe2290005  ! 219: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xec312e5e  ! 219: STH_I	sth	%r22, [%r4 + 0x0e5e]
	.word 0xea210005  ! 219: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xd6712988  ! 219: STX_I	stx	%r11, [%r4 + 0x0988]
	.word 0xf6290005  ! 219: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe8290005  ! 219: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe6710005  ! 219: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe231212c  ! 219: STH_I	sth	%r17, [%r4 + 0x012c]
	.word 0x04800001  ! 219: BLE	ble  	<label_0x1>
	.word 0xe8b128fc  ! 219: STHA_I	stha	%r20, [%r4 + 0x08fc] %asi
	.word 0xe6290005  ! 229: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf0292d69  ! 229: STB_I	stb	%r24, [%r4 + 0x0d69]
	.word 0xf6290005  ! 229: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe421282c  ! 229: STW_I	stw	%r18, [%r4 + 0x082c]
	.word 0xdc7121b0  ! 229: STX_I	stx	%r14, [%r4 + 0x01b0]
	.word 0xd6290005  ! 229: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe6290005  ! 229: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe22925a9  ! 229: STB_I	stb	%r17, [%r4 + 0x05a9]
	.word 0x28800003  ! 229: BLEU	bleu,a	<label_0x3>
	.word 0xd6f20983  ! 229: STXA_R	stxa	%r11, [%r8 + %r3] 0x4c
	.word 0xf8290005  ! 238: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xdc3128fc  ! 238: STH_I	sth	%r14, [%r4 + 0x08fc]
	.word 0xe0310005  ! 238: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xde290005  ! 238: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd87120e8  ! 238: STX_I	stx	%r12, [%r4 + 0x00e8]
	.word 0xe0310005  ! 238: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xe6312d76  ! 238: STH_I	sth	%r19, [%r4 + 0x0d76]
	.word 0x0ac10001  ! 238: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xd6f04ce2  ! 238: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xe8290005  ! 247: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd83123ac  ! 247: STH_I	sth	%r12, [%r4 + 0x03ac]
	.word 0xd431249c  ! 247: STH_I	sth	%r10, [%r4 + 0x049c]
	.word 0xea290005  ! 247: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe6710005  ! 247: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xee212f2c  ! 247: STW_I	stw	%r23, [%r4 + 0x0f2c]
	.word 0xf2290005  ! 247: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x18800001  ! 247: BGU	bgu  	<label_0x1>
	.word 0xd6f04ce0  ! 247: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xee290005  ! 256: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe0210005  ! 256: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xde31297e  ! 256: STH_I	sth	%r15, [%r4 + 0x097e]
	.word 0xf4310005  ! 256: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xe2312170  ! 256: STH_I	sth	%r17, [%r4 + 0x0170]
	.word 0xe6212d28  ! 256: STW_I	stw	%r19, [%r4 + 0x0d28]
	.word 0xf0290005  ! 256: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x04c90001  ! 256: BRLEZ	brlez  ,pt	%4,<label_0x90001>
	.word 0xd8f04986  ! 256: STXA_R	stxa	%r12, [%r1 + %r6] 0x4c
	.word 0xea290005  ! 266: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd83129ae  ! 266: STH_I	sth	%r12, [%r4 + 0x09ae]
	.word 0xd8310005  ! 266: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xd4710005  ! 266: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xfc210005  ! 266: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xe62929de  ! 266: STB_I	stb	%r19, [%r4 + 0x09de]
	.word 0xf0212f6c  ! 266: STW_I	stw	%r24, [%r4 + 0x0f6c]
	.word 0xfa310005  ! 266: STH_R	sth	%r29, [%r4 + %r5]
	.word 0x32800001  ! 266: BNE	bne,a	<label_0x1>
	.word 0xd8f04987  ! 266: STXA_R	stxa	%r12, [%r1 + %r7] 0x4c
	.word 0xd4290005  ! 275: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfe292906  ! 275: STB_I	stb	%r31, [%r4 + 0x0906]
	.word 0xd4212fa8  ! 275: STW_I	stw	%r10, [%r4 + 0x0fa8]
	.word 0xf6290005  ! 275: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe0710005  ! 275: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd8210005  ! 275: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xdc710005  ! 275: STX_R	stx	%r14, [%r4 + %r5]
	.word 0x1a800001  ! 275: BCC	bcc  	<label_0x1>
	.word 0xd6f24980  ! 275: STXA_R	stxa	%r11, [%r9 + %r0] 0x4c
	.word 0xdc290005  ! 284: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xdc712160  ! 284: STX_I	stx	%r14, [%r4 + 0x0160]
	.word 0xd621247c  ! 284: STW_I	stw	%r11, [%r4 + 0x047c]
	.word 0xe0210005  ! 284: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xe6310005  ! 284: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xfa29277e  ! 284: STB_I	stb	%r29, [%r4 + 0x077e]
	.word 0xe2312d76  ! 284: STH_I	sth	%r17, [%r4 + 0x0d76]
	.word 0x18800003  ! 284: BGU	bgu  	<label_0x3>
	.word 0xf9210005  ! 284: STF_R	st	%f28, [%r5, %r4]
	.word 0xd4290005  ! 294: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfc712e00  ! 294: STX_I	stx	%r30, [%r4 + 0x0e00]
	.word 0xf4712e68  ! 294: STX_I	stx	%r26, [%r4 + 0x0e68]
	.word 0xf4310005  ! 294: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xe831223a  ! 294: STH_I	sth	%r20, [%r4 + 0x023a]
	.word 0xe4210005  ! 294: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xea2928d6  ! 294: STB_I	stb	%r21, [%r4 + 0x08d6]
	.word 0xf0712770  ! 294: STX_I	stx	%r24, [%r4 + 0x0770]
	.word 0x20800003  ! 294: BN	bn,a	<label_0x3>
	.word 0xd6f00ce7  ! 294: STXA_R	stxa	%r11, [%r0 + %r7] 0x67
	.word 0xd6290005  ! 304: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xda29291c  ! 304: STB_I	stb	%r13, [%r4 + 0x091c]
	.word 0xda3124fe  ! 304: STH_I	sth	%r13, [%r4 + 0x04fe]
	.word 0xf0212dd4  ! 304: STW_I	stw	%r24, [%r4 + 0x0dd4]
	.word 0xe6210005  ! 304: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf0292729  ! 304: STB_I	stb	%r24, [%r4 + 0x0729]
	.word 0xf6712c78  ! 304: STX_I	stx	%r27, [%r4 + 0x0c78]
	.word 0xfc290005  ! 304: STB_R	stb	%r30, [%r4 + %r5]
	.word 0x2e800003  ! 304: BVS	bvs,a	<label_0x3>
	.word 0xeea91005  ! 304: STBA_R	stba	%r23, [%r4 + %r5] 0x80
	.word 0xe8290005  ! 314: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf8312306  ! 314: STH_I	sth	%r28, [%r4 + 0x0306]
	.word 0xee21220c  ! 314: STW_I	stw	%r23, [%r4 + 0x020c]
	.word 0xd8290005  ! 314: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xde210005  ! 314: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xd82126c4  ! 314: STW_I	stw	%r12, [%r4 + 0x06c4]
	.word 0xfe712740  ! 314: STX_I	stx	%r31, [%r4 + 0x0740]
	.word 0xe67126b0  ! 314: STX_I	stx	%r19, [%r4 + 0x06b0]
	.word 0x2c800001  ! 314: BNEG	bneg,a	<label_0x1>
	.word 0xdea91005  ! 314: STBA_R	stba	%r15, [%r4 + %r5] 0x80
	.word 0xd6290005  ! 323: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd6290005  ! 323: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe2290005  ! 323: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf0710005  ! 323: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xda292086  ! 323: STB_I	stb	%r13, [%r4 + 0x0086]
	.word 0xee310005  ! 323: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xd6290005  ! 323: STB_R	stb	%r11, [%r4 + %r5]
	.word 0x04800001  ! 323: BLE	ble  	<label_0x1>
	.word 0xd8f0cce0  ! 323: STXA_R	stxa	%r12, [%r3 + %r0] 0x67
	.word 0xf4290005  ! 333: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe6710005  ! 333: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xde212590  ! 333: STW_I	stw	%r15, [%r4 + 0x0590]
	.word 0xf8712608  ! 333: STX_I	stx	%r28, [%r4 + 0x0608]
	.word 0xfe210005  ! 333: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xec3126e4  ! 333: STH_I	sth	%r22, [%r4 + 0x06e4]
	.word 0xfa290005  ! 333: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfc7122c0  ! 333: STX_I	stx	%r30, [%r4 + 0x02c0]
	.word 0x3a800001  ! 333: BCC	bcc,a	<label_0x1>
	.word 0xfbe12005  ! 333: CASA_R	casa	[%r4] %asi, %r5, %r29
	.word 0xe2290005  ! 343: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xda312cae  ! 343: STH_I	sth	%r13, [%r4 + 0x0cae]
	.word 0xec290005  ! 343: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf4312f10  ! 343: STH_I	sth	%r26, [%r4 + 0x0f10]
	.word 0xdc31241e  ! 343: STH_I	sth	%r14, [%r4 + 0x041e]
	.word 0xfe310005  ! 343: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf0710005  ! 343: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xde312092  ! 343: STH_I	sth	%r15, [%r4 + 0x0092]
	.word 0x20800001  ! 343: BN	bn,a	<label_0x1>
	.word 0xd6f24ce7  ! 343: STXA_R	stxa	%r11, [%r9 + %r7] 0x67
	.word 0xee290005  ! 352: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe6290005  ! 352: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xde7120f0  ! 352: STX_I	stx	%r15, [%r4 + 0x00f0]
	.word 0xe4210005  ! 352: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfc710005  ! 352: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xd6312194  ! 352: STH_I	sth	%r11, [%r4 + 0x0194]
	.word 0xee290005  ! 352: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x30800003  ! 352: BA	ba,a	<label_0x3>
	.word 0xd6f04962  ! 352: STXA_R	stxa	%r11, [%r1 + %r2] 0x4b
	.word 0xe4290005  ! 362: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xfe710005  ! 362: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe2310005  ! 362: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xf0212000  ! 362: STW_I	stw	%r24, [%r4 + 0x0000]
	.word 0xe0290005  ! 362: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xdc212f40  ! 362: STW_I	stw	%r14, [%r4 + 0x0f40]
	.word 0xf0712b50  ! 362: STX_I	stx	%r24, [%r4 + 0x0b50]
	.word 0xfe710005  ! 362: STX_R	stx	%r31, [%r4 + %r5]
	.word 0x2c800001  ! 362: BNEG	bneg,a	<label_0x1>
	.word 0xd8f20980  ! 362: STXA_R	stxa	%r12, [%r8 + %r0] 0x4c
	.word 0xfc290005  ! 372: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe421290c  ! 372: STW_I	stw	%r18, [%r4 + 0x090c]
	.word 0xf4710005  ! 372: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xd8290005  ! 372: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe4710005  ! 372: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe43122d2  ! 372: STH_I	sth	%r18, [%r4 + 0x02d2]
	.word 0xfc292d32  ! 372: STB_I	stb	%r30, [%r4 + 0x0d32]
	.word 0xe0210005  ! 372: STW_R	stw	%r16, [%r4 + %r5]
	.word 0x3c800001  ! 372: BPOS	bpos,a	<label_0x1>
	.word 0xd6f24966  ! 372: STXA_R	stxa	%r11, [%r9 + %r6] 0x4b
	.word 0xee290005  ! 382: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf0310005  ! 382: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xde712c00  ! 382: STX_I	stx	%r15, [%r4 + 0x0c00]
	.word 0xf2290005  ! 382: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf821206c  ! 382: STW_I	stw	%r28, [%r4 + 0x006c]
	.word 0xd8292813  ! 382: STB_I	stb	%r12, [%r4 + 0x0813]
	.word 0xf2710005  ! 382: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xd8212de0  ! 382: STW_I	stw	%r12, [%r4 + 0x0de0]
	.word 0x2e800001  ! 382: BVS	bvs,a	<label_0x1>
	.word 0xd6f00967  ! 382: STXA_R	stxa	%r11, [%r0 + %r7] 0x4b
	.word 0xdc290005  ! 392: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xe0292ce7  ! 392: STB_I	stb	%r16, [%r4 + 0x0ce7]
	.word 0xee310005  ! 392: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf4292b85  ! 392: STB_I	stb	%r26, [%r4 + 0x0b85]
	.word 0xda292da7  ! 392: STB_I	stb	%r13, [%r4 + 0x0da7]
	.word 0xe0290005  ! 392: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xea2121fc  ! 392: STW_I	stw	%r21, [%r4 + 0x01fc]
	.word 0xf22124b8  ! 392: STW_I	stw	%r25, [%r4 + 0x04b8]
	.word 0x04c90003  ! 392: BRLEZ	brlez  ,pt	%4,<label_0x90003>
	.word 0xd8f24ce2  ! 392: STXA_R	stxa	%r12, [%r9 + %r2] 0x67
	.word 0xf4290005  ! 402: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd8710005  ! 402: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xd8710005  ! 402: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xfa290005  ! 402: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xee212108  ! 402: STW_I	stw	%r23, [%r4 + 0x0108]
	.word 0xd8292779  ! 402: STB_I	stb	%r12, [%r4 + 0x0779]
	.word 0xda292d09  ! 402: STB_I	stb	%r13, [%r4 + 0x0d09]
	.word 0xea210005  ! 402: STW_R	stw	%r21, [%r4 + %r5]
	.word 0x40000001  ! 402: CALL	call	disp30_1
	.word 0xd8f08963  ! 402: STXA_R	stxa	%r12, [%r2 + %r3] 0x4b
	.word 0xdc290005  ! 412: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf8290005  ! 412: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf2290005  ! 412: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd4292d14  ! 412: STB_I	stb	%r10, [%r4 + 0x0d14]
	.word 0xde292e44  ! 412: STB_I	stb	%r15, [%r4 + 0x0e44]
	.word 0xda310005  ! 412: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xe4290005  ! 412: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf6292bc2  ! 412: STB_I	stb	%r27, [%r4 + 0x0bc2]
	.word 0x0a800001  ! 412: BCS	bcs  	<label_0x1>
	.word 0xd6f24ce1  ! 412: STXA_R	stxa	%r11, [%r9 + %r1] 0x67
	.word 0xd4290005  ! 421: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xda312fca  ! 421: STH_I	sth	%r13, [%r4 + 0x0fca]
	.word 0xea210005  ! 421: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xfc310005  ! 421: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf431284c  ! 421: STH_I	sth	%r26, [%r4 + 0x084c]
	.word 0xec290005  ! 421: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf0310005  ! 421: STH_R	sth	%r24, [%r4 + %r5]
	.word 0x02c10003  ! 421: BRZ	brz  ,nt	%4,<label_0x10003>
	.word 0xd6f24ce7  ! 421: STXA_R	stxa	%r11, [%r9 + %r7] 0x67
	.word 0xf2290005  ! 430: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xdc292ec8  ! 430: STB_I	stb	%r14, [%r4 + 0x0ec8]
	.word 0xfa712f98  ! 430: STX_I	stx	%r29, [%r4 + 0x0f98]
	.word 0xfe312f36  ! 430: STH_I	sth	%r31, [%r4 + 0x0f36]
	.word 0xdc210005  ! 430: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd83124fe  ! 430: STH_I	sth	%r12, [%r4 + 0x04fe]
	.word 0xf2312708  ! 430: STH_I	sth	%r25, [%r4 + 0x0708]
	.word 0x26800003  ! 430: BL	bl,a	<label_0x3>
	.word 0xfe79250c  ! 430: SWAP_I	swap	%r31, [%r4 + 0x050c]
	.word 0xe4290005  ! 440: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xda710005  ! 440: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf0210005  ! 440: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xfa210005  ! 440: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xfc712298  ! 440: STX_I	stx	%r30, [%r4 + 0x0298]
	.word 0xda710005  ! 440: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xea712148  ! 440: STX_I	stx	%r21, [%r4 + 0x0148]
	.word 0xd4712060  ! 440: STX_I	stx	%r10, [%r4 + 0x0060]
	.word 0x10800001  ! 440: BA	ba  	<label_0x1>
	.word 0xd6f18ce1  ! 440: STXA_R	stxa	%r11, [%r6 + %r1] 0x67
	.word 0xea290005  ! 450: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xec712940  ! 450: STX_I	stx	%r22, [%r4 + 0x0940]
	.word 0xf2712948  ! 450: STX_I	stx	%r25, [%r4 + 0x0948]
	.word 0xda712bb8  ! 450: STX_I	stx	%r13, [%r4 + 0x0bb8]
	.word 0xd6210005  ! 450: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xfc312ffe  ! 450: STH_I	sth	%r30, [%r4 + 0x0ffe]
	.word 0xe2212fc8  ! 450: STW_I	stw	%r17, [%r4 + 0x0fc8]
	.word 0xec290005  ! 450: STB_R	stb	%r22, [%r4 + %r5]
	.word 0x06c10001  ! 450: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd6f0c960  ! 450: STXA_R	stxa	%r11, [%r3 + %r0] 0x4b
	.word 0xd6290005  ! 459: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe2212510  ! 459: STW_I	stw	%r17, [%r4 + 0x0510]
	.word 0xf2310005  ! 459: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xe2710005  ! 459: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xea290005  ! 459: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe6290005  ! 459: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xea310005  ! 459: STH_R	sth	%r21, [%r4 + %r5]
	.word 0x3e800001  ! 459: BVC	bvc,a	<label_0x1>
	.word 0xd6f08962  ! 459: STXA_R	stxa	%r11, [%r2 + %r2] 0x4b
	.word 0xe4290005  ! 468: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe2210005  ! 468: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xea210005  ! 468: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xdc210005  ! 468: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd8312496  ! 468: STH_I	sth	%r12, [%r4 + 0x0496]
	.word 0xfa310005  ! 468: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xfc212b30  ! 468: STW_I	stw	%r30, [%r4 + 0x0b30]
	.word 0x38800001  ! 468: BGU	bgu,a	<label_0x1>
	.word 0xdc3120c6  ! 468: STH_I	sth	%r14, [%r4 + 0x00c6]
	.word 0xf4290005  ! 478: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf2210005  ! 478: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xe4710005  ! 478: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf6710005  ! 478: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe4312426  ! 478: STH_I	sth	%r18, [%r4 + 0x0426]
	.word 0xec212568  ! 478: STW_I	stw	%r22, [%r4 + 0x0568]
	.word 0xe2210005  ! 478: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xe8310005  ! 478: STH_R	sth	%r20, [%r4 + %r5]
	.word 0x06c90001  ! 478: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xd6f18960  ! 478: STXA_R	stxa	%r11, [%r6 + %r0] 0x4b
	.word 0xe8290005  ! 488: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd4312cfe  ! 488: STH_I	sth	%r10, [%r4 + 0x0cfe]
	.word 0xe4212bf4  ! 488: STW_I	stw	%r18, [%r4 + 0x0bf4]
	.word 0xd4312e94  ! 488: STH_I	sth	%r10, [%r4 + 0x0e94]
	.word 0xee290005  ! 488: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd4310005  ! 488: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xdc292547  ! 488: STB_I	stb	%r14, [%r4 + 0x0547]
	.word 0xf0290005  ! 488: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x24c90003  ! 488: BRLEZ	brlez,a,pt	%4,<label_0x90003>
	.word 0xd6f20967  ! 488: STXA_R	stxa	%r11, [%r8 + %r7] 0x4b
	.word 0xec290005  ! 497: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xec210005  ! 497: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xfe312e2e  ! 497: STH_I	sth	%r31, [%r4 + 0x0e2e]
	.word 0xec712830  ! 497: STX_I	stx	%r22, [%r4 + 0x0830]
	.word 0xf4290005  ! 497: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xdc292141  ! 497: STB_I	stb	%r14, [%r4 + 0x0141]
	.word 0xe2710005  ! 497: STX_R	stx	%r17, [%r4 + %r5]
	.word 0x22c90003  ! 497: BRZ	brz,a,pt	%4,<label_0x90003>
	.word 0xd6f08963  ! 497: STXA_R	stxa	%r11, [%r2 + %r3] 0x4b
	.word 0xe4290005  ! 507: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xfe312900  ! 507: STH_I	sth	%r31, [%r4 + 0x0900]
	.word 0xfc712740  ! 507: STX_I	stx	%r30, [%r4 + 0x0740]
	.word 0xe6290005  ! 507: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xea212964  ! 507: STW_I	stw	%r21, [%r4 + 0x0964]
	.word 0xda2926a1  ! 507: STB_I	stb	%r13, [%r4 + 0x06a1]
	.word 0xd6310005  ! 507: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xda290005  ! 507: STB_R	stb	%r13, [%r4 + %r5]
	.word 0x1c800001  ! 507: BPOS	bpos  	<label_0x1>
	.word 0xd6f20ce2  ! 507: STXA_R	stxa	%r11, [%r8 + %r2] 0x67
	.word 0xda290005  ! 516: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa210005  ! 516: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe82922ec  ! 516: STB_I	stb	%r20, [%r4 + 0x02ec]
	.word 0xd4312074  ! 516: STH_I	sth	%r10, [%r4 + 0x0074]
	.word 0xe4712450  ! 516: STX_I	stx	%r18, [%r4 + 0x0450]
	.word 0xfe310005  ! 516: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf2712640  ! 516: STX_I	stx	%r25, [%r4 + 0x0640]
	.word 0x2e800001  ! 516: BVS	bvs,a	<label_0x1>
	.word 0xd8f20982  ! 516: STXA_R	stxa	%r12, [%r8 + %r2] 0x4c
	.word 0xee290005  ! 525: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe0290005  ! 525: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf8310005  ! 525: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xe6212cc8  ! 525: STW_I	stw	%r19, [%r4 + 0x0cc8]
	.word 0xfe312ad2  ! 525: STH_I	sth	%r31, [%r4 + 0x0ad2]
	.word 0xf4312b30  ! 525: STH_I	sth	%r26, [%r4 + 0x0b30]
	.word 0xea210005  ! 525: STW_R	stw	%r21, [%r4 + %r5]
	.word 0x14800003  ! 525: BG	bg  	<label_0x3>
	.word 0xd8f08963  ! 525: STXA_R	stxa	%r12, [%r2 + %r3] 0x4b
	.word 0xfe290005  ! 534: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe6210005  ! 534: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf0290005  ! 534: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xee710005  ! 534: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xdc712cc0  ! 534: STX_I	stx	%r14, [%r4 + 0x0cc0]
	.word 0xd87120f8  ! 534: STX_I	stx	%r12, [%r4 + 0x00f8]
	.word 0xd6310005  ! 534: STH_R	sth	%r11, [%r4 + %r5]
	.word 0x0ec10001  ! 534: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd6f08ce0  ! 534: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
	.word 0xd6290005  ! 543: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xdc210005  ! 543: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xf0292dfa  ! 543: STB_I	stb	%r24, [%r4 + 0x0dfa]
	.word 0xd4310005  ! 543: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf6310005  ! 543: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf8712bf8  ! 543: STX_I	stx	%r28, [%r4 + 0x0bf8]
	.word 0xfc312af2  ! 543: STH_I	sth	%r30, [%r4 + 0x0af2]
	.word 0x10800001  ! 543: BA	ba  	<label_0x1>
	.word 0xdc2923f8  ! 543: STB_I	stb	%r14, [%r4 + 0x03f8]
	.word 0xd8290005  ! 553: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xd6290005  ! 553: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xda292b29  ! 553: STB_I	stb	%r13, [%r4 + 0x0b29]
	.word 0xde710005  ! 553: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf4310005  ! 553: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xfa212548  ! 553: STW_I	stw	%r29, [%r4 + 0x0548]
	.word 0xd421245c  ! 553: STW_I	stw	%r10, [%r4 + 0x045c]
	.word 0xe8210005  ! 553: STW_R	stw	%r20, [%r4 + %r5]
	.word 0x24c10001  ! 553: BRLEZ	brlez,a,nt	%4,<label_0x10001>
	.word 0xdef92e9c  ! 553: SWAPA_I	swapa	%r15, [%r4 + 0x0e9c] %asi
	.word 0xe2290005  ! 563: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee710005  ! 563: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xfc212328  ! 563: STW_I	stw	%r30, [%r4 + 0x0328]
	.word 0xec712f10  ! 563: STX_I	stx	%r22, [%r4 + 0x0f10]
	.word 0xd4210005  ! 563: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe8710005  ! 563: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd6290005  ! 563: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfc710005  ! 563: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x18800003  ! 563: BGU	bgu  	<label_0x3>
	.word 0xf0210005  ! 563: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xfe290005  ! 572: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xde710005  ! 572: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xde7120b8  ! 572: STX_I	stx	%r15, [%r4 + 0x00b8]
	.word 0xfe292fd6  ! 572: STB_I	stb	%r31, [%r4 + 0x0fd6]
	.word 0xf8292190  ! 572: STB_I	stb	%r28, [%r4 + 0x0190]
	.word 0xd8710005  ! 572: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xe22920df  ! 572: STB_I	stb	%r17, [%r4 + 0x00df]
	.word 0x32800001  ! 572: BNE	bne,a	<label_0x1>
	.word 0xf9392c10  ! 572: STDF_I	std	%f28, [0x0c10, %r4]
	.word 0xe0290005  ! 582: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe2290005  ! 582: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xec712090  ! 582: STX_I	stx	%r22, [%r4 + 0x0090]
	.word 0xd6712b00  ! 582: STX_I	stx	%r11, [%r4 + 0x0b00]
	.word 0xee212760  ! 582: STW_I	stw	%r23, [%r4 + 0x0760]
	.word 0xe831216e  ! 582: STH_I	sth	%r20, [%r4 + 0x016e]
	.word 0xee710005  ! 582: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xde712c80  ! 582: STX_I	stx	%r15, [%r4 + 0x0c80]
	.word 0x1c800001  ! 582: BPOS	bpos  	<label_0x1>
	.word 0xd8f04982  ! 582: STXA_R	stxa	%r12, [%r1 + %r2] 0x4c
	.word 0xe4290005  ! 591: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf6710005  ! 591: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xee312bfc  ! 591: STH_I	sth	%r23, [%r4 + 0x0bfc]
	.word 0xf4210005  ! 591: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xea7120b0  ! 591: STX_I	stx	%r21, [%r4 + 0x00b0]
	.word 0xee712508  ! 591: STX_I	stx	%r23, [%r4 + 0x0508]
	.word 0xd8710005  ! 591: STX_R	stx	%r12, [%r4 + %r5]
	.word 0x22800001  ! 591: BE	be,a	<label_0x1>
	.word 0xfde11005  ! 591: CASA_I	casa	[%r4] 0x80, %r5, %r30
	.word 0xf0290005  ! 600: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd87125e0  ! 600: STX_I	stx	%r12, [%r4 + 0x05e0]
	.word 0xde712d38  ! 600: STX_I	stx	%r15, [%r4 + 0x0d38]
	.word 0xee210005  ! 600: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xe4712448  ! 600: STX_I	stx	%r18, [%r4 + 0x0448]
	.word 0xdc312972  ! 600: STH_I	sth	%r14, [%r4 + 0x0972]
	.word 0xee7121e0  ! 600: STX_I	stx	%r23, [%r4 + 0x01e0]
	.word 0x06800001  ! 600: BL	bl  	<label_0x1>
	.word 0xd8f08ce7  ! 600: STXA_R	stxa	%r12, [%r2 + %r7] 0x67
	.word 0xfe290005  ! 609: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf8290005  ! 609: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xea7122d0  ! 609: STX_I	stx	%r21, [%r4 + 0x02d0]
	.word 0xdc310005  ! 609: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe67127f8  ! 609: STX_I	stx	%r19, [%r4 + 0x07f8]
	.word 0xd6210005  ! 609: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xfa310005  ! 609: STH_R	sth	%r29, [%r4 + %r5]
	.word 0x0e800001  ! 609: BVS	bvs  	<label_0x1>
	.word 0xd8f24967  ! 609: STXA_R	stxa	%r12, [%r9 + %r7] 0x4b
	.word 0xe4290005  ! 619: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf4290005  ! 619: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf6210005  ! 619: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xde210005  ! 619: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xd821278c  ! 619: STW_I	stw	%r12, [%r4 + 0x078c]
	.word 0xda712be8  ! 619: STX_I	stx	%r13, [%r4 + 0x0be8]
	.word 0xea292b1c  ! 619: STB_I	stb	%r21, [%r4 + 0x0b1c]
	.word 0xec310005  ! 619: STH_R	sth	%r22, [%r4 + %r5]
	.word 0x3e800003  ! 619: BVC	bvc,a	<label_0x3>
	.word 0xd6f20ce7  ! 619: STXA_R	stxa	%r11, [%r8 + %r7] 0x67
	.word 0xf6290005  ! 628: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xea7129f0  ! 628: STX_I	stx	%r21, [%r4 + 0x09f0]
	.word 0xf8710005  ! 628: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xec31210c  ! 628: STH_I	sth	%r22, [%r4 + 0x010c]
	.word 0xdc310005  ! 628: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xf2310005  ! 628: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xee310005  ! 628: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x20800003  ! 628: BN	bn,a	<label_0x3>
	.word 0xe9f11005  ! 628: CASXA_I	casxa	[%r4] 0x80, %r5, %r20
	.word 0xfa290005  ! 638: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf0310005  ! 638: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xe629292f  ! 638: STB_I	stb	%r19, [%r4 + 0x092f]
	.word 0xe0212fc0  ! 638: STW_I	stw	%r16, [%r4 + 0x0fc0]
	.word 0xda210005  ! 638: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xee2121a4  ! 638: STW_I	stw	%r23, [%r4 + 0x01a4]
	.word 0xe2310005  ! 638: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xd6210005  ! 638: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x0c800001  ! 638: BNEG	bneg  	<label_0x1>
	.word 0xf8792334  ! 638: SWAP_I	swap	%r28, [%r4 + 0x0334]
	.word 0xe6290005  ! 648: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfc7128d0  ! 648: STX_I	stx	%r30, [%r4 + 0x08d0]
	.word 0xfe3126fa  ! 648: STH_I	sth	%r31, [%r4 + 0x06fa]
	.word 0xe0710005  ! 648: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xfe292eac  ! 648: STB_I	stb	%r31, [%r4 + 0x0eac]
	.word 0xf2290005  ! 648: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xec290005  ! 648: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd82922b1  ! 648: STB_I	stb	%r12, [%r4 + 0x02b1]
	.word 0x06c90003  ! 648: BRLZ	brlz  ,pt	%4,<label_0x90003>
	.word 0xd8f08963  ! 648: STXA_R	stxa	%r12, [%r2 + %r3] 0x4b
	.word 0xee290005  ! 658: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe0710005  ! 658: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd4210005  ! 658: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xf4710005  ! 658: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xe4712c68  ! 658: STX_I	stx	%r18, [%r4 + 0x0c68]
	.word 0xd8212dd0  ! 658: STW_I	stw	%r12, [%r4 + 0x0dd0]
	.word 0xe0210005  ! 658: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfe712508  ! 658: STX_I	stx	%r31, [%r4 + 0x0508]
	.word 0x04800001  ! 658: BLE	ble  	<label_0x1>
	.word 0xd6f18986  ! 658: STXA_R	stxa	%r11, [%r6 + %r6] 0x4c
	.word 0xfa290005  ! 668: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xee210005  ! 668: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xf83127f8  ! 668: STH_I	sth	%r28, [%r4 + 0x07f8]
	.word 0xea710005  ! 668: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xd429289a  ! 668: STB_I	stb	%r10, [%r4 + 0x089a]
	.word 0xd4292dce  ! 668: STB_I	stb	%r10, [%r4 + 0x0dce]
	.word 0xf2290005  ! 668: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfe3121c6  ! 668: STH_I	sth	%r31, [%r4 + 0x01c6]
	.word 0x0cc90003  ! 668: BRGZ	brgz  ,pt	%4,<label_0x90003>
	.word 0xd6f04961  ! 668: STXA_R	stxa	%r11, [%r1 + %r1] 0x4b
	.word 0xf4290005  ! 678: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe2210005  ! 678: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xe4290005  ! 678: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xdc3122bc  ! 678: STH_I	sth	%r14, [%r4 + 0x02bc]
	.word 0xda312d46  ! 678: STH_I	sth	%r13, [%r4 + 0x0d46]
	.word 0xde212e0c  ! 678: STW_I	stw	%r15, [%r4 + 0x0e0c]
	.word 0xea210005  ! 678: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xd8710005  ! 678: STX_R	stx	%r12, [%r4 + %r5]
	.word 0x0ac90003  ! 678: BRNZ	brnz  ,pt	%4,<label_0x90003>
	.word 0xf9390005  ! 678: STDF_R	std	%f28, [%r5, %r4]
	.word 0xe8290005  ! 687: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf62128a8  ! 687: STW_I	stw	%r27, [%r4 + 0x08a8]
	.word 0xee712f60  ! 687: STX_I	stx	%r23, [%r4 + 0x0f60]
	.word 0xfc31231e  ! 687: STH_I	sth	%r30, [%r4 + 0x031e]
	.word 0xe8712bb0  ! 687: STX_I	stx	%r20, [%r4 + 0x0bb0]
	.word 0xf8290005  ! 687: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf0290005  ! 687: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x2ec90001  ! 687: BRGEZ	brgez,a,pt	%4,<label_0x90001>
	.word 0xe1212f40  ! 687: STF_I	st	%f16, [0x0f40, %r4]
	.word 0xda290005  ! 697: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf4212d90  ! 697: STW_I	stw	%r26, [%r4 + 0x0d90]
	.word 0xec212020  ! 697: STW_I	stw	%r22, [%r4 + 0x0020]
	.word 0xea31255a  ! 697: STH_I	sth	%r21, [%r4 + 0x055a]
	.word 0xda212cb4  ! 697: STW_I	stw	%r13, [%r4 + 0x0cb4]
	.word 0xf8712e98  ! 697: STX_I	stx	%r28, [%r4 + 0x0e98]
	.word 0xda292dd8  ! 697: STB_I	stb	%r13, [%r4 + 0x0dd8]
	.word 0xf4210005  ! 697: STW_R	stw	%r26, [%r4 + %r5]
	.word 0x04800001  ! 697: BLE	ble  	<label_0x1>
	.word 0xd6f24986  ! 697: STXA_R	stxa	%r11, [%r9 + %r6] 0x4c
	.word 0xe6290005  ! 707: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd8710005  ! 707: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xe629296c  ! 707: STB_I	stb	%r19, [%r4 + 0x096c]
	.word 0xf2290005  ! 707: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf2290005  ! 707: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xec290005  ! 707: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe6712fb0  ! 707: STX_I	stx	%r19, [%r4 + 0x0fb0]
	.word 0xe229261e  ! 707: STB_I	stb	%r17, [%r4 + 0x061e]
	.word 0x2ac10001  ! 707: BRNZ	brnz,a,nt	%4,<label_0x10001>
	.word 0xd6f1cce7  ! 707: STXA_R	stxa	%r11, [%r7 + %r7] 0x67
	.word 0xfe290005  ! 717: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xde212218  ! 717: STW_I	stw	%r15, [%r4 + 0x0218]
	.word 0xd6710005  ! 717: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xea710005  ! 717: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf0292bf6  ! 717: STB_I	stb	%r24, [%r4 + 0x0bf6]
	.word 0xe42926f5  ! 717: STB_I	stb	%r18, [%r4 + 0x06f5]
	.word 0xe4310005  ! 717: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf2290005  ! 717: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x40000001  ! 717: CALL	call	disp30_1
	.word 0xf93922a8  ! 717: STDF_I	std	%f28, [0x02a8, %r4]
	.word 0xd6290005  ! 726: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xda712d60  ! 726: STX_I	stx	%r13, [%r4 + 0x0d60]
	.word 0xe8710005  ! 726: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xfe212c6c  ! 726: STW_I	stw	%r31, [%r4 + 0x0c6c]
	.word 0xe8712570  ! 726: STX_I	stx	%r20, [%r4 + 0x0570]
	.word 0xf6310005  ! 726: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xde312c2a  ! 726: STH_I	sth	%r15, [%r4 + 0x0c2a]
	.word 0x2e800003  ! 726: BVS	bvs,a	<label_0x3>
	.word 0xd6f00983  ! 726: STXA_R	stxa	%r11, [%r0 + %r3] 0x4c
	.word 0xe8290005  ! 736: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xda710005  ! 736: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf2290005  ! 736: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfc29204a  ! 736: STB_I	stb	%r30, [%r4 + 0x004a]
	.word 0xe03125b6  ! 736: STH_I	sth	%r16, [%r4 + 0x05b6]
	.word 0xe2710005  ! 736: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xf8710005  ! 736: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xdc710005  ! 736: STX_R	stx	%r14, [%r4 + %r5]
	.word 0x10800001  ! 736: BA	ba  	<label_0x1>
	.word 0xd7210005  ! 736: STF_R	st	%f11, [%r5, %r4]
	.word 0xda290005  ! 745: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe6210005  ! 745: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xdc210005  ! 745: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xdc210005  ! 745: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xfa212ed8  ! 745: STW_I	stw	%r29, [%r4 + 0x0ed8]
	.word 0xfe312c54  ! 745: STH_I	sth	%r31, [%r4 + 0x0c54]
	.word 0xee290005  ! 745: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x30800003  ! 745: BA	ba,a	<label_0x3>
	.word 0xd6f1c963  ! 745: STXA_R	stxa	%r11, [%r7 + %r3] 0x4b
	.word 0xe6290005  ! 754: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xea710005  ! 754: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xde310005  ! 754: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xd8290005  ! 754: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf4292e7d  ! 754: STB_I	stb	%r26, [%r4 + 0x0e7d]
	.word 0xe0292c9e  ! 754: STB_I	stb	%r16, [%r4 + 0x0c9e]
	.word 0xfc212a5c  ! 754: STW_I	stw	%r30, [%r4 + 0x0a5c]
	.word 0x40000001  ! 754: CALL	call	disp30_1
	.word 0xf0e922da  ! 754: LDSTUBA_I	ldstuba	%r24, [%r4 + 0x02da] %asi
	.word 0xea290005  ! 763: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xda290005  ! 763: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf229260e  ! 763: STB_I	stb	%r25, [%r4 + 0x060e]
	.word 0xee712850  ! 763: STX_I	stx	%r23, [%r4 + 0x0850]
	.word 0xde310005  ! 763: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xf4312f92  ! 763: STH_I	sth	%r26, [%r4 + 0x0f92]
	.word 0xf2310005  ! 763: STH_R	sth	%r25, [%r4 + %r5]
	.word 0x0ec10001  ! 763: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd8f04ce2  ! 763: STXA_R	stxa	%r12, [%r1 + %r2] 0x67
	.word 0xf2290005  ! 772: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xdc212674  ! 772: STW_I	stw	%r14, [%r4 + 0x0674]
	.word 0xf22923d2  ! 772: STB_I	stb	%r25, [%r4 + 0x03d2]
	.word 0xe62923af  ! 772: STB_I	stb	%r19, [%r4 + 0x03af]
	.word 0xfe710005  ! 772: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xee310005  ! 772: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xe8292937  ! 772: STB_I	stb	%r20, [%r4 + 0x0937]
	.word 0x20800001  ! 772: BN	bn,a	<label_0x1>
	.word 0xd4f11005  ! 772: STXA_R	stxa	%r10, [%r4 + %r5] 0x80
	.word 0xfa290005  ! 782: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfa210005  ! 782: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe6710005  ! 782: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xee290005  ! 782: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xda21291c  ! 782: STW_I	stw	%r13, [%r4 + 0x091c]
	.word 0xe07129a0  ! 782: STX_I	stx	%r16, [%r4 + 0x09a0]
	.word 0xec312156  ! 782: STH_I	sth	%r22, [%r4 + 0x0156]
	.word 0xec210005  ! 782: STW_R	stw	%r22, [%r4 + %r5]
	.word 0x30800001  ! 782: BA	ba,a	<label_0x1>
	.word 0xd8f08ce3  ! 782: STXA_R	stxa	%r12, [%r2 + %r3] 0x67
	.word 0xda290005  ! 791: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xde290005  ! 791: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xee310005  ! 791: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xfc210005  ! 791: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xea7129e8  ! 791: STX_I	stx	%r21, [%r4 + 0x09e8]
	.word 0xfe2128b4  ! 791: STW_I	stw	%r31, [%r4 + 0x08b4]
	.word 0xea290005  ! 791: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x22c10001  ! 791: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xf6e91005  ! 791: LDSTUBA_R	ldstuba	%r27, [%r4 + %r5] 0x80
	.word 0xf4290005  ! 801: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd4710005  ! 801: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xf0210005  ! 801: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf6310005  ! 801: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xec210005  ! 801: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xe4290005  ! 801: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe62923e0  ! 801: STB_I	stb	%r19, [%r4 + 0x03e0]
	.word 0xf6712ac8  ! 801: STX_I	stx	%r27, [%r4 + 0x0ac8]
	.word 0x0a800003  ! 801: BCS	bcs  	<label_0x3>
	.word 0xd6f18987  ! 801: STXA_R	stxa	%r11, [%r6 + %r7] 0x4c
	.word 0xfe290005  ! 810: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xde290005  ! 810: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xee212824  ! 810: STW_I	stw	%r23, [%r4 + 0x0824]
	.word 0xd6310005  ! 810: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xfc312dee  ! 810: STH_I	sth	%r30, [%r4 + 0x0dee]
	.word 0xe4210005  ! 810: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfe7129d0  ! 810: STX_I	stx	%r31, [%r4 + 0x09d0]
	.word 0x3c800001  ! 810: BPOS	bpos,a	<label_0x1>
	.word 0xd6f0cce2  ! 810: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
	.word 0xe4290005  ! 820: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xda310005  ! 820: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xe2292dec  ! 820: STB_I	stb	%r17, [%r4 + 0x0dec]
	.word 0xee7121a8  ! 820: STX_I	stx	%r23, [%r4 + 0x01a8]
	.word 0xdc212c40  ! 820: STW_I	stw	%r14, [%r4 + 0x0c40]
	.word 0xfc712bc0  ! 820: STX_I	stx	%r30, [%r4 + 0x0bc0]
	.word 0xf4312282  ! 820: STH_I	sth	%r26, [%r4 + 0x0282]
	.word 0xd4290005  ! 820: STB_R	stb	%r10, [%r4 + %r5]
	.word 0x26c10001  ! 820: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xd8f0c960  ! 820: STXA_R	stxa	%r12, [%r3 + %r0] 0x4b
	.word 0xf2290005  ! 830: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfc7127b8  ! 830: STX_I	stx	%r30, [%r4 + 0x07b8]
	.word 0xe87124e8  ! 830: STX_I	stx	%r20, [%r4 + 0x04e8]
	.word 0xfa210005  ! 830: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xde310005  ! 830: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xf8290005  ! 830: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf429285c  ! 830: STB_I	stb	%r26, [%r4 + 0x085c]
	.word 0xdc212330  ! 830: STW_I	stw	%r14, [%r4 + 0x0330]
	.word 0x0a800001  ! 830: BCS	bcs  	<label_0x1>
	.word 0xd6f00980  ! 830: STXA_R	stxa	%r11, [%r0 + %r0] 0x4c
	.word 0xe2290005  ! 840: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xea7128d8  ! 840: STX_I	stx	%r21, [%r4 + 0x08d8]
	.word 0xf0310005  ! 840: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xf4712438  ! 840: STX_I	stx	%r26, [%r4 + 0x0438]
	.word 0xfc710005  ! 840: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xde290005  ! 840: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xee712948  ! 840: STX_I	stx	%r23, [%r4 + 0x0948]
	.word 0xe6290005  ! 840: STB_R	stb	%r19, [%r4 + %r5]
	.word 0x26800003  ! 840: BL	bl,a	<label_0x3>
	.word 0xecf12cf8  ! 840: STXA_I	stxa	%r22, [%r4 + 0x0cf8] %asi
	.word 0xf2290005  ! 850: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xda710005  ! 850: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xe0212414  ! 850: STW_I	stw	%r16, [%r4 + 0x0414]
	.word 0xf2310005  ! 850: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd83120f2  ! 850: STH_I	sth	%r12, [%r4 + 0x00f2]
	.word 0xe4310005  ! 850: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xfc2924d4  ! 850: STB_I	stb	%r30, [%r4 + 0x04d4]
	.word 0xde292307  ! 850: STB_I	stb	%r15, [%r4 + 0x0307]
	.word 0x16800003  ! 850: BGE	bge  	<label_0x3>
	.word 0xd6f04969  ! 850: STXA_R	stxa	%r11, [%r1 + %r9] 0x4b
	.word 0xd4290005  ! 859: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfc312216  ! 859: STH_I	sth	%r30, [%r4 + 0x0216]
	.word 0xdc712508  ! 859: STX_I	stx	%r14, [%r4 + 0x0508]
	.word 0xfc710005  ! 859: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xea2923e6  ! 859: STB_I	stb	%r21, [%r4 + 0x03e6]
	.word 0xe4210005  ! 859: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xe22126cc  ! 859: STW_I	stw	%r17, [%r4 + 0x06cc]
	.word 0x24800003  ! 859: BLE	ble,a	<label_0x3>
	.word 0xd6f04ce9  ! 859: STXA_R	stxa	%r11, [%r1 + %r9] 0x67
	.word 0xe2290005  ! 868: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee292aab  ! 868: STB_I	stb	%r23, [%r4 + 0x0aab]
	.word 0xf0290005  ! 868: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd6712a90  ! 868: STX_I	stx	%r11, [%r4 + 0x0a90]
	.word 0xfa310005  ! 868: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xec7122b8  ! 868: STX_I	stx	%r22, [%r4 + 0x02b8]
	.word 0xfa290005  ! 868: STB_R	stb	%r29, [%r4 + %r5]
	.word 0x3e800001  ! 868: BVC	bvc,a	<label_0x1>
	.word 0xd6f0cce2  ! 868: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
	.word 0xfe290005  ! 878: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf6312144  ! 878: STH_I	sth	%r27, [%r4 + 0x0144]
	.word 0xf8310005  ! 878: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xfc212f30  ! 878: STW_I	stw	%r30, [%r4 + 0x0f30]
	.word 0xda7122e0  ! 878: STX_I	stx	%r13, [%r4 + 0x02e0]
	.word 0xec290005  ! 878: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4290005  ! 878: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe0310005  ! 878: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x40000001  ! 878: CALL	call	disp30_1
	.word 0xd6f1cce3  ! 878: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xe2290005  ! 887: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xea21207c  ! 887: STW_I	stw	%r21, [%r4 + 0x007c]
	.word 0xe6292d3e  ! 887: STB_I	stb	%r19, [%r4 + 0x0d3e]
	.word 0xe6210005  ! 887: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf4212d94  ! 887: STW_I	stw	%r26, [%r4 + 0x0d94]
	.word 0xf4290005  ! 887: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf6290005  ! 887: STB_R	stb	%r27, [%r4 + %r5]
	.word 0x40000001  ! 887: CALL	call	disp30_1
	.word 0xecf11005  ! 887: STXA_R	stxa	%r22, [%r4 + %r5] 0x80
	.word 0xf0290005  ! 897: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfc710005  ! 897: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe2310005  ! 897: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xf4712640  ! 897: STX_I	stx	%r26, [%r4 + 0x0640]
	.word 0xd6290005  ! 897: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd6310005  ! 897: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe6710005  ! 897: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xf22924f0  ! 897: STB_I	stb	%r25, [%r4 + 0x04f0]
	.word 0x28800003  ! 897: BLEU	bleu,a	<label_0x3>
	.word 0xd8f0c983  ! 897: STXA_R	stxa	%r12, [%r3 + %r3] 0x4c
	.word 0xea290005  ! 906: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf8312ec8  ! 906: STH_I	sth	%r28, [%r4 + 0x0ec8]
	.word 0xf8292a86  ! 906: STB_I	stb	%r28, [%r4 + 0x0a86]
	.word 0xde712ae8  ! 906: STX_I	stx	%r15, [%r4 + 0x0ae8]
	.word 0xfa312dec  ! 906: STH_I	sth	%r29, [%r4 + 0x0dec]
	.word 0xf4290005  ! 906: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xde310005  ! 906: STH_R	sth	%r15, [%r4 + %r5]
	.word 0x02c10003  ! 906: BRZ	brz  ,nt	%4,<label_0x10003>
	.word 0xd6f00ce0  ! 906: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xf0290005  ! 915: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe6310005  ! 915: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xfa290005  ! 915: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd6290005  ! 915: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xec292325  ! 915: STB_I	stb	%r22, [%r4 + 0x0325]
	.word 0xf431230c  ! 915: STH_I	sth	%r26, [%r4 + 0x030c]
	.word 0xf4210005  ! 915: STW_R	stw	%r26, [%r4 + %r5]
	.word 0x2a800003  ! 915: BCS	bcs,a	<label_0x3>
	.word 0xd8312e82  ! 915: STH_I	sth	%r12, [%r4 + 0x0e82]
	.word 0xe2290005  ! 925: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe2710005  ! 925: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xf4212dcc  ! 925: STW_I	stw	%r26, [%r4 + 0x0dcc]
	.word 0xdc31234e  ! 925: STH_I	sth	%r14, [%r4 + 0x034e]
	.word 0xf4210005  ! 925: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xd8210005  ! 925: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xee210005  ! 925: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xe2712d18  ! 925: STX_I	stx	%r17, [%r4 + 0x0d18]
	.word 0x0ec90001  ! 925: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xd6f00ce0  ! 925: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xe6290005  ! 934: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfa210005  ! 934: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe8712290  ! 934: STX_I	stx	%r20, [%r4 + 0x0290]
	.word 0xe23120fe  ! 934: STH_I	sth	%r17, [%r4 + 0x00fe]
	.word 0xfa310005  ! 934: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xec3128aa  ! 934: STH_I	sth	%r22, [%r4 + 0x08aa]
	.word 0xd8292974  ! 934: STB_I	stb	%r12, [%r4 + 0x0974]
	.word 0x00800001  ! 934: BN	bn  	<label_0x1>
	.word 0xd6f04982  ! 934: STXA_R	stxa	%r11, [%r1 + %r2] 0x4c
	.word 0xe2290005  ! 944: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xda312e70  ! 944: STH_I	sth	%r13, [%r4 + 0x0e70]
	.word 0xfc710005  ! 944: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe2310005  ! 944: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xda7121f0  ! 944: STX_I	stx	%r13, [%r4 + 0x01f0]
	.word 0xec7125d8  ! 944: STX_I	stx	%r22, [%r4 + 0x05d8]
	.word 0xfc310005  ! 944: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xd4310005  ! 944: STH_R	sth	%r10, [%r4 + %r5]
	.word 0x24c10003  ! 944: BRLEZ	brlez,a,nt	%4,<label_0x10003>
	.word 0xf5f11005  ! 944: CASXA_I	casxa	[%r4] 0x80, %r5, %r26
	.word 0xf0290005  ! 953: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd829295f  ! 953: STB_I	stb	%r12, [%r4 + 0x095f]
	.word 0xec312ca2  ! 953: STH_I	sth	%r22, [%r4 + 0x0ca2]
	.word 0xd6290005  ! 953: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfe292851  ! 953: STB_I	stb	%r31, [%r4 + 0x0851]
	.word 0xf4212688  ! 953: STW_I	stw	%r26, [%r4 + 0x0688]
	.word 0xe47129d0  ! 953: STX_I	stx	%r18, [%r4 + 0x09d0]
	.word 0x02800001  ! 953: BE	be  	<label_0x1>
	.word 0xd6f00ce3  ! 953: STXA_R	stxa	%r11, [%r0 + %r3] 0x67
	.word 0xe6290005  ! 963: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe4310005  ! 963: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xe0290005  ! 963: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfe312196  ! 963: STH_I	sth	%r31, [%r4 + 0x0196]
	.word 0xfc212ab0  ! 963: STW_I	stw	%r30, [%r4 + 0x0ab0]
	.word 0xda212198  ! 963: STW_I	stw	%r13, [%r4 + 0x0198]
	.word 0xde710005  ! 963: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xe4712cc0  ! 963: STX_I	stx	%r18, [%r4 + 0x0cc0]
	.word 0x2ec90003  ! 963: BRGEZ	brgez,a,pt	%4,<label_0x90003>
	.word 0xdc31295a  ! 963: STH_I	sth	%r14, [%r4 + 0x095a]
	.word 0xe2290005  ! 972: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc7121d8  ! 972: STX_I	stx	%r30, [%r4 + 0x01d8]
	.word 0xd8710005  ! 972: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xec210005  ! 972: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xdc310005  ! 972: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe6212108  ! 972: STW_I	stw	%r19, [%r4 + 0x0108]
	.word 0xfc710005  ! 972: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x0cc10003  ! 972: BRGZ	brgz  ,nt	%4,<label_0x10003>
	.word 0xd8f00981  ! 972: STXA_R	stxa	%r12, [%r0 + %r1] 0x4c
	.word 0xe2290005  ! 981: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf8710005  ! 981: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf4712fb8  ! 981: STX_I	stx	%r26, [%r4 + 0x0fb8]
	.word 0xfc210005  ! 981: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xdc290005  ! 981: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xe4290005  ! 981: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd6210005  ! 981: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x3a800001  ! 981: BCC	bcc,a	<label_0x1>
	.word 0xd8f08988  ! 981: STXA_R	stxa	%r12, [%r2 + %r8] 0x4c
	.word 0xe8290005  ! 991: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xee2122d4  ! 991: STW_I	stw	%r23, [%r4 + 0x02d4]
	.word 0xd8292d86  ! 991: STB_I	stb	%r12, [%r4 + 0x0d86]
	.word 0xea710005  ! 991: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xde310005  ! 991: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xdc310005  ! 991: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xde212874  ! 991: STW_I	stw	%r15, [%r4 + 0x0874]
	.word 0xd6210005  ! 991: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x1e800003  ! 991: BVC	bvc  	<label_0x3>
	.word 0xd8f08ce9  ! 991: STXA_R	stxa	%r12, [%r2 + %r9] 0x67
	.word 0xd4290005  ! 1000: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfe210005  ! 1000: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xda310005  ! 1000: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xe6712338  ! 1000: STX_I	stx	%r19, [%r4 + 0x0338]
	.word 0xd4310005  ! 1000: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf0710005  ! 1000: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xde210005  ! 1000: STW_R	stw	%r15, [%r4 + %r5]
	.word 0x2a800001  ! 1000: BCS	bcs,a	<label_0x1>
	.word 0xdfe11005  ! 1000: CASA_I	casa	[%r4] 0x80, %r5, %r15
	.word 0xec290005  ! 1009: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd8290005  ! 1009: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xec310005  ! 1009: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xf021201c  ! 1009: STW_I	stw	%r24, [%r4 + 0x001c]
	.word 0xe8290005  ! 1009: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfe290005  ! 1009: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xde7123c8  ! 1009: STX_I	stx	%r15, [%r4 + 0x03c8]
	.word 0x1a800003  ! 1009: BCC	bcc  	<label_0x3>
	.word 0xd6f18ce0  ! 1009: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xd6290005  ! 1019: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe6212248  ! 1019: STW_I	stw	%r19, [%r4 + 0x0248]
	.word 0xe2710005  ! 1019: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xf6210005  ! 1019: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xee712008  ! 1019: STX_I	stx	%r23, [%r4 + 0x0008]
	.word 0xe2212558  ! 1019: STW_I	stw	%r17, [%r4 + 0x0558]
	.word 0xd6310005  ! 1019: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xee310005  ! 1019: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x1a800001  ! 1019: BCC	bcc  	<label_0x1>
	.word 0xe4710005  ! 1019: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xd6290005  ! 1029: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd6292f59  ! 1029: STB_I	stb	%r11, [%r4 + 0x0f59]
	.word 0xd6290005  ! 1029: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf231249a  ! 1029: STH_I	sth	%r25, [%r4 + 0x049a]
	.word 0xe8292fe5  ! 1029: STB_I	stb	%r20, [%r4 + 0x0fe5]
	.word 0xe03124e2  ! 1029: STH_I	sth	%r16, [%r4 + 0x04e2]
	.word 0xf0310005  ! 1029: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xd87124e8  ! 1029: STX_I	stx	%r12, [%r4 + 0x04e8]
	.word 0x06800003  ! 1029: BL	bl  	<label_0x3>
	.word 0xfbe11005  ! 1029: CASA_I	casa	[%r4] 0x80, %r5, %r29
	.word 0xda290005  ! 1038: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe2292942  ! 1038: STB_I	stb	%r17, [%r4 + 0x0942]
	.word 0xfc290005  ! 1038: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe8290005  ! 1038: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xdc31279e  ! 1038: STH_I	sth	%r14, [%r4 + 0x079e]
	.word 0xdc312322  ! 1038: STH_I	sth	%r14, [%r4 + 0x0322]
	.word 0xf2710005  ! 1038: STX_R	stx	%r25, [%r4 + %r5]
	.word 0x40000003  ! 1038: CALL	call	disp30_3
	.word 0xd7e11005  ! 1038: CASA_I	casa	[%r4] 0x80, %r5, %r11
	.word 0xec290005  ! 1048: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfe710005  ! 1048: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe4310005  ! 1048: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xda292670  ! 1048: STB_I	stb	%r13, [%r4 + 0x0670]
	.word 0xd8290005  ! 1048: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf4212b60  ! 1048: STW_I	stw	%r26, [%r4 + 0x0b60]
	.word 0xfc212438  ! 1048: STW_I	stw	%r30, [%r4 + 0x0438]
	.word 0xd8292be0  ! 1048: STB_I	stb	%r12, [%r4 + 0x0be0]
	.word 0x2e800001  ! 1048: BVS	bvs,a	<label_0x1>
	.word 0xf6a91005  ! 1048: STBA_R	stba	%r27, [%r4 + %r5] 0x80
	.word 0xf2290005  ! 1058: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf6312d5c  ! 1058: STH_I	sth	%r27, [%r4 + 0x0d5c]
	.word 0xe83120e0  ! 1058: STH_I	sth	%r20, [%r4 + 0x00e0]
	.word 0xf0710005  ! 1058: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xe8710005  ! 1058: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd6290005  ! 1058: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf4710005  ! 1058: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xea712d18  ! 1058: STX_I	stx	%r21, [%r4 + 0x0d18]
	.word 0x08800001  ! 1058: BLEU	bleu  	<label_0x1>
	.word 0xd6f0c963  ! 1058: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xe6290005  ! 1067: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd8290005  ! 1067: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf47129c0  ! 1067: STX_I	stx	%r26, [%r4 + 0x09c0]
	.word 0xda212664  ! 1067: STW_I	stw	%r13, [%r4 + 0x0664]
	.word 0xe6210005  ! 1067: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe8210005  ! 1067: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xf2292724  ! 1067: STB_I	stb	%r25, [%r4 + 0x0724]
	.word 0x2e800001  ! 1067: BVS	bvs,a	<label_0x1>
	.word 0xf6a11005  ! 1067: STWA_R	stwa	%r27, [%r4 + %r5] 0x80
	.word 0xf0290005  ! 1076: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe029246a  ! 1076: STB_I	stb	%r16, [%r4 + 0x046a]
	.word 0xf2312550  ! 1076: STH_I	sth	%r25, [%r4 + 0x0550]
	.word 0xde210005  ! 1076: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe8712380  ! 1076: STX_I	stx	%r20, [%r4 + 0x0380]
	.word 0xec710005  ! 1076: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xee210005  ! 1076: STW_R	stw	%r23, [%r4 + %r5]
	.word 0x3c800001  ! 1076: BPOS	bpos,a	<label_0x1>
	.word 0xd6f18ce0  ! 1076: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xf2290005  ! 1086: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfa7121e0  ! 1086: STX_I	stx	%r29, [%r4 + 0x01e0]
	.word 0xe07123c0  ! 1086: STX_I	stx	%r16, [%r4 + 0x03c0]
	.word 0xea710005  ! 1086: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xd8710005  ! 1086: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xd6310005  ! 1086: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe831257e  ! 1086: STH_I	sth	%r20, [%r4 + 0x057e]
	.word 0xf4710005  ! 1086: STX_R	stx	%r26, [%r4 + %r5]
	.word 0x2e800003  ! 1086: BVS	bvs,a	<label_0x3>
	.word 0xd6f1cce3  ! 1086: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xfc290005  ! 1096: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf2310005  ! 1096: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xfa3120a2  ! 1096: STH_I	sth	%r29, [%r4 + 0x00a2]
	.word 0xee710005  ! 1096: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xee710005  ! 1096: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xde290005  ! 1096: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xec710005  ! 1096: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xe0310005  ! 1096: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x02c10001  ! 1096: BRZ	brz  ,nt	%4,<label_0x10001>
	.word 0xfce91005  ! 1096: LDSTUBA_R	ldstuba	%r30, [%r4 + %r5] 0x80
	.word 0xde290005  ! 1106: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd621252c  ! 1106: STW_I	stw	%r11, [%r4 + 0x052c]
	.word 0xd62927cc  ! 1106: STB_I	stb	%r11, [%r4 + 0x07cc]
	.word 0xec712d80  ! 1106: STX_I	stx	%r22, [%r4 + 0x0d80]
	.word 0xee290005  ! 1106: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfc210005  ! 1106: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xd6312834  ! 1106: STH_I	sth	%r11, [%r4 + 0x0834]
	.word 0xfc312974  ! 1106: STH_I	sth	%r30, [%r4 + 0x0974]
	.word 0x24800001  ! 1106: BLE	ble,a	<label_0x1>
	.word 0xd8f1c983  ! 1106: STXA_R	stxa	%r12, [%r7 + %r3] 0x4c
	.word 0xf6290005  ! 1116: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xde712128  ! 1116: STX_I	stx	%r15, [%r4 + 0x0128]
	.word 0xf27123e8  ! 1116: STX_I	stx	%r25, [%r4 + 0x03e8]
	.word 0xe8312f18  ! 1116: STH_I	sth	%r20, [%r4 + 0x0f18]
	.word 0xec3122f0  ! 1116: STH_I	sth	%r22, [%r4 + 0x02f0]
	.word 0xf27128d0  ! 1116: STX_I	stx	%r25, [%r4 + 0x08d0]
	.word 0xdc712e78  ! 1116: STX_I	stx	%r14, [%r4 + 0x0e78]
	.word 0xd6310005  ! 1116: STH_R	sth	%r11, [%r4 + %r5]
	.word 0x06c10001  ! 1116: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd6f00ce2  ! 1116: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xfc290005  ! 1125: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xda710005  ! 1125: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf2212280  ! 1125: STW_I	stw	%r25, [%r4 + 0x0280]
	.word 0xfa710005  ! 1125: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xda292ff7  ! 1125: STB_I	stb	%r13, [%r4 + 0x0ff7]
	.word 0xf02927ef  ! 1125: STB_I	stb	%r24, [%r4 + 0x07ef]
	.word 0xd4210005  ! 1125: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x10800001  ! 1125: BA	ba  	<label_0x1>
	.word 0xd6f1cce2  ! 1125: STXA_R	stxa	%r11, [%r7 + %r2] 0x67
	.word 0xd6290005  ! 1135: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd4310005  ! 1135: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xd6710005  ! 1135: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xd4310005  ! 1135: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf0710005  ! 1135: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfe212594  ! 1135: STW_I	stw	%r31, [%r4 + 0x0594]
	.word 0xe6710005  ! 1135: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xf0290005  ! 1135: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x10800001  ! 1135: BA	ba  	<label_0x1>
	.word 0xe0b91005  ! 1135: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xf6290005  ! 1144: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe4710005  ! 1144: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf4210005  ! 1144: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xec710005  ! 1144: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xd8710005  ! 1144: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xe2212444  ! 1144: STW_I	stw	%r17, [%r4 + 0x0444]
	.word 0xe6210005  ! 1144: STW_R	stw	%r19, [%r4 + %r5]
	.word 0x08800001  ! 1144: BLEU	bleu  	<label_0x1>
	.word 0xd6f18962  ! 1144: STXA_R	stxa	%r11, [%r6 + %r2] 0x4b
	.word 0xea290005  ! 1154: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd4210005  ! 1154: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xda710005  ! 1154: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf0710005  ! 1154: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xf0292f22  ! 1154: STB_I	stb	%r24, [%r4 + 0x0f22]
	.word 0xee312cbc  ! 1154: STH_I	sth	%r23, [%r4 + 0x0cbc]
	.word 0xf4290005  ! 1154: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xfa310005  ! 1154: STH_R	sth	%r29, [%r4 + %r5]
	.word 0x0ac90001  ! 1154: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xd8f00963  ! 1154: STXA_R	stxa	%r12, [%r0 + %r3] 0x4b
	.word 0xd8290005  ! 1164: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xfc290005  ! 1164: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfe712688  ! 1164: STX_I	stx	%r31, [%r4 + 0x0688]
	.word 0xf2212bfc  ! 1164: STW_I	stw	%r25, [%r4 + 0x0bfc]
	.word 0xf4290005  ! 1164: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe4710005  ! 1164: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf2312b6e  ! 1164: STH_I	sth	%r25, [%r4 + 0x0b6e]
	.word 0xdc210005  ! 1164: STW_R	stw	%r14, [%r4 + %r5]
	.word 0x40000001  ! 1164: CALL	call	disp30_1
	.word 0xd6f1cce6  ! 1164: STXA_R	stxa	%r11, [%r7 + %r6] 0x67
	.word 0xfe290005  ! 1174: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf6290005  ! 1174: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfc310005  ! 1174: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xde31243c  ! 1174: STH_I	sth	%r15, [%r4 + 0x043c]
	.word 0xfa292fff  ! 1174: STB_I	stb	%r29, [%r4 + 0x0fff]
	.word 0xf031265e  ! 1174: STH_I	sth	%r24, [%r4 + 0x065e]
	.word 0xea312aca  ! 1174: STH_I	sth	%r21, [%r4 + 0x0aca]
	.word 0xf2292505  ! 1174: STB_I	stb	%r25, [%r4 + 0x0505]
	.word 0x00800001  ! 1174: BN	bn  	<label_0x1>
	.word 0xd6f18963  ! 1174: STXA_R	stxa	%r11, [%r6 + %r3] 0x4b
	.word 0xd6290005  ! 1183: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xde710005  ! 1183: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xea212684  ! 1183: STW_I	stw	%r21, [%r4 + 0x0684]
	.word 0xd6710005  ! 1183: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xd8212dac  ! 1183: STW_I	stw	%r12, [%r4 + 0x0dac]
	.word 0xe2712aa8  ! 1183: STX_I	stx	%r17, [%r4 + 0x0aa8]
	.word 0xda310005  ! 1183: STH_R	sth	%r13, [%r4 + %r5]
	.word 0x24c10003  ! 1183: BRLEZ	brlez,a,nt	%4,<label_0x10003>
	.word 0xe8792578  ! 1183: SWAP_I	swap	%r20, [%r4 + 0x0578]
	.word 0xe8290005  ! 1192: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xec7125c0  ! 1192: STX_I	stx	%r22, [%r4 + 0x05c0]
	.word 0xf4210005  ! 1192: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xd4210005  ! 1192: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xea292c2c  ! 1192: STB_I	stb	%r21, [%r4 + 0x0c2c]
	.word 0xf8710005  ! 1192: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xfc210005  ! 1192: STW_R	stw	%r30, [%r4 + %r5]
	.word 0x38800001  ! 1192: BGU	bgu,a	<label_0x1>
	.word 0xd8f04ce3  ! 1192: STXA_R	stxa	%r12, [%r1 + %r3] 0x67
	.word 0xdc290005  ! 1202: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfa7123c8  ! 1202: STX_I	stx	%r29, [%r4 + 0x03c8]
	.word 0xe0310005  ! 1202: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xd6212d18  ! 1202: STW_I	stw	%r11, [%r4 + 0x0d18]
	.word 0xdc290005  ! 1202: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd8310005  ! 1202: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xdc312b7e  ! 1202: STH_I	sth	%r14, [%r4 + 0x0b7e]
	.word 0xe2292695  ! 1202: STB_I	stb	%r17, [%r4 + 0x0695]
	.word 0x12800001  ! 1202: BNE	bne  	<label_0x1>
	.word 0xd6f00961  ! 1202: STXA_R	stxa	%r11, [%r0 + %r1] 0x4b
	.word 0xda290005  ! 1211: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa292d8f  ! 1211: STB_I	stb	%r29, [%r4 + 0x0d8f]
	.word 0xde292070  ! 1211: STB_I	stb	%r15, [%r4 + 0x0070]
	.word 0xd8210005  ! 1211: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe8712d50  ! 1211: STX_I	stx	%r20, [%r4 + 0x0d50]
	.word 0xfe290005  ! 1211: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe6212080  ! 1211: STW_I	stw	%r19, [%r4 + 0x0080]
	.word 0x02800003  ! 1211: BE	be  	<label_0x3>
	.word 0xd6f00ce1  ! 1211: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xf2290005  ! 1221: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf4310005  ! 1221: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd631293e  ! 1221: STH_I	sth	%r11, [%r4 + 0x093e]
	.word 0xf8210005  ! 1221: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xd87128d0  ! 1221: STX_I	stx	%r12, [%r4 + 0x08d0]
	.word 0xf2292483  ! 1221: STB_I	stb	%r25, [%r4 + 0x0483]
	.word 0xf6710005  ! 1221: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe2312e72  ! 1221: STH_I	sth	%r17, [%r4 + 0x0e72]
	.word 0x00800001  ! 1221: BN	bn  	<label_0x1>
	.word 0xd6f0c962  ! 1221: STXA_R	stxa	%r11, [%r3 + %r2] 0x4b
	.word 0xe4290005  ! 1230: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf42924c0  ! 1230: STB_I	stb	%r26, [%r4 + 0x04c0]
	.word 0xee290005  ! 1230: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe421251c  ! 1230: STW_I	stw	%r18, [%r4 + 0x051c]
	.word 0xf67121c8  ! 1230: STX_I	stx	%r27, [%r4 + 0x01c8]
	.word 0xd4210005  ! 1230: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe0212d38  ! 1230: STW_I	stw	%r16, [%r4 + 0x0d38]
	.word 0x04800001  ! 1230: BLE	ble  	<label_0x1>
	.word 0xd6f0c961  ! 1230: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xe6290005  ! 1239: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfc292cd3  ! 1239: STB_I	stb	%r30, [%r4 + 0x0cd3]
	.word 0xdc210005  ! 1239: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xda712f10  ! 1239: STX_I	stx	%r13, [%r4 + 0x0f10]
	.word 0xdc710005  ! 1239: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xea292b06  ! 1239: STB_I	stb	%r21, [%r4 + 0x0b06]
	.word 0xd8292d66  ! 1239: STB_I	stb	%r12, [%r4 + 0x0d66]
	.word 0x24c10003  ! 1239: BRLEZ	brlez,a,nt	%4,<label_0x10003>
	.word 0xd6f0cce9  ! 1239: STXA_R	stxa	%r11, [%r3 + %r9] 0x67
	.word 0xe2290005  ! 1248: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xea2129f0  ! 1248: STW_I	stw	%r21, [%r4 + 0x09f0]
	.word 0xd4712b60  ! 1248: STX_I	stx	%r10, [%r4 + 0x0b60]
	.word 0xf8310005  ! 1248: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xfe710005  ! 1248: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xf8310005  ! 1248: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xd6210005  ! 1248: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x36800003  ! 1248: BGE	bge,a	<label_0x3>
	.word 0xea310005  ! 1248: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xf4290005  ! 1257: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe0292b40  ! 1257: STB_I	stb	%r16, [%r4 + 0x0b40]
	.word 0xd4712708  ! 1257: STX_I	stx	%r10, [%r4 + 0x0708]
	.word 0xe8212d64  ! 1257: STW_I	stw	%r20, [%r4 + 0x0d64]
	.word 0xf8312af4  ! 1257: STH_I	sth	%r28, [%r4 + 0x0af4]
	.word 0xf6712480  ! 1257: STX_I	stx	%r27, [%r4 + 0x0480]
	.word 0xfe210005  ! 1257: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x0ec10001  ! 1257: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd6f18ce1  ! 1257: STXA_R	stxa	%r11, [%r6 + %r1] 0x67
	.word 0xfa290005  ! 1266: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd4710005  ! 1266: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xda290005  ! 1266: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xee210005  ! 1266: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xdc712350  ! 1266: STX_I	stx	%r14, [%r4 + 0x0350]
	.word 0xe8710005  ! 1266: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xe43122c0  ! 1266: STH_I	sth	%r18, [%r4 + 0x02c0]
	.word 0x06c10001  ! 1266: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd8f18963  ! 1266: STXA_R	stxa	%r12, [%r6 + %r3] 0x4b
	.word 0xe8290005  ! 1275: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xee290005  ! 1275: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf8710005  ! 1275: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xe8290005  ! 1275: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xea290005  ! 1275: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd8292831  ! 1275: STB_I	stb	%r12, [%r4 + 0x0831]
	.word 0xf27127c8  ! 1275: STX_I	stx	%r25, [%r4 + 0x07c8]
	.word 0x0cc90003  ! 1275: BRGZ	brgz  ,pt	%4,<label_0x90003>
	.word 0xd8f18961  ! 1275: STXA_R	stxa	%r12, [%r6 + %r1] 0x4b
	.word 0xe4290005  ! 1284: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf621217c  ! 1284: STW_I	stw	%r27, [%r4 + 0x017c]
	.word 0xea210005  ! 1284: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xdc290005  ! 1284: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf0310005  ! 1284: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xfa710005  ! 1284: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xf02923ce  ! 1284: STB_I	stb	%r24, [%r4 + 0x03ce]
	.word 0x3a800001  ! 1284: BCC	bcc,a	<label_0x1>
	.word 0xd6f1c963  ! 1284: STXA_R	stxa	%r11, [%r7 + %r3] 0x4b
	.word 0xf4290005  ! 1293: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf0290005  ! 1293: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xda290005  ! 1293: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfe710005  ! 1293: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe8292d32  ! 1293: STB_I	stb	%r20, [%r4 + 0x0d32]
	.word 0xde292fbc  ! 1293: STB_I	stb	%r15, [%r4 + 0x0fbc]
	.word 0xe0310005  ! 1293: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x22800003  ! 1293: BE	be,a	<label_0x3>
	.word 0xd6f0c961  ! 1293: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xd8290005  ! 1303: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xd8710005  ! 1303: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xee310005  ! 1303: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xde212c34  ! 1303: STW_I	stw	%r15, [%r4 + 0x0c34]
	.word 0xee712918  ! 1303: STX_I	stx	%r23, [%r4 + 0x0918]
	.word 0xee212674  ! 1303: STW_I	stw	%r23, [%r4 + 0x0674]
	.word 0xda310005  ! 1303: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xde290005  ! 1303: STB_R	stb	%r15, [%r4 + %r5]
	.word 0x32800001  ! 1303: BNE	bne,a	<label_0x1>
	.word 0xd8f00ce6  ! 1303: STXA_R	stxa	%r12, [%r0 + %r6] 0x67
	.word 0xf0290005  ! 1312: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf2310005  ! 1312: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xea2128b4  ! 1312: STW_I	stw	%r21, [%r4 + 0x08b4]
	.word 0xdc2126ec  ! 1312: STW_I	stw	%r14, [%r4 + 0x06ec]
	.word 0xd4310005  ! 1312: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xd62120a8  ! 1312: STW_I	stw	%r11, [%r4 + 0x00a8]
	.word 0xe4210005  ! 1312: STW_R	stw	%r18, [%r4 + %r5]
	.word 0x0c800001  ! 1312: BNEG	bneg  	<label_0x1>
	.word 0xde292c56  ! 1312: STB_I	stb	%r15, [%r4 + 0x0c56]
	.word 0xde290005  ! 1322: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xea712a68  ! 1322: STX_I	stx	%r21, [%r4 + 0x0a68]
	.word 0xfe292c83  ! 1322: STB_I	stb	%r31, [%r4 + 0x0c83]
	.word 0xfa212f44  ! 1322: STW_I	stw	%r29, [%r4 + 0x0f44]
	.word 0xee710005  ! 1322: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf2290005  ! 1322: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xea210005  ! 1322: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xda310005  ! 1322: STH_R	sth	%r13, [%r4 + %r5]
	.word 0x00800003  ! 1322: BN	bn  	<label_0x3>
	.word 0xd8f18ce1  ! 1322: STXA_R	stxa	%r12, [%r6 + %r1] 0x67
	.word 0xea290005  ! 1331: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe0292371  ! 1331: STB_I	stb	%r16, [%r4 + 0x0371]
	.word 0xfe210005  ! 1331: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xea212324  ! 1331: STW_I	stw	%r21, [%r4 + 0x0324]
	.word 0xea290005  ! 1331: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf63123da  ! 1331: STH_I	sth	%r27, [%r4 + 0x03da]
	.word 0xf2212f34  ! 1331: STW_I	stw	%r25, [%r4 + 0x0f34]
	.word 0x08800001  ! 1331: BLEU	bleu  	<label_0x1>
	.word 0xd8f00962  ! 1331: STXA_R	stxa	%r12, [%r0 + %r2] 0x4b
	.word 0xfe290005  ! 1341: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe8292f44  ! 1341: STB_I	stb	%r20, [%r4 + 0x0f44]
	.word 0xe621286c  ! 1341: STW_I	stw	%r19, [%r4 + 0x086c]
	.word 0xea710005  ! 1341: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf2310005  ! 1341: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xe4212758  ! 1341: STW_I	stw	%r18, [%r4 + 0x0758]
	.word 0xd4312d16  ! 1341: STH_I	sth	%r10, [%r4 + 0x0d16]
	.word 0xe4290005  ! 1341: STB_R	stb	%r18, [%r4 + %r5]
	.word 0x0ac90001  ! 1341: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xf1f12005  ! 1341: CASXA_R	casxa	[%r4]%asi, %r5, %r24
	.word 0xec290005  ! 1351: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xec210005  ! 1351: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xd4310005  ! 1351: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf8710005  ! 1351: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf6312134  ! 1351: STH_I	sth	%r27, [%r4 + 0x0134]
	.word 0xe0312c6e  ! 1351: STH_I	sth	%r16, [%r4 + 0x0c6e]
	.word 0xec2920bd  ! 1351: STB_I	stb	%r22, [%r4 + 0x00bd]
	.word 0xdc210005  ! 1351: STW_R	stw	%r14, [%r4 + %r5]
	.word 0x08800003  ! 1351: BLEU	bleu  	<label_0x3>
	.word 0xd8f24ce3  ! 1351: STXA_R	stxa	%r12, [%r9 + %r3] 0x67
	.word 0xfc290005  ! 1360: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf4310005  ! 1360: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd42924c2  ! 1360: STB_I	stb	%r10, [%r4 + 0x04c2]
	.word 0xfe710005  ! 1360: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xdc21205c  ! 1360: STW_I	stw	%r14, [%r4 + 0x005c]
	.word 0xe2292de7  ! 1360: STB_I	stb	%r17, [%r4 + 0x0de7]
	.word 0xf4292cc1  ! 1360: STB_I	stb	%r26, [%r4 + 0x0cc1]
	.word 0x0c800003  ! 1360: BNEG	bneg  	<label_0x3>
	.word 0xe8b91005  ! 1360: STDA_R	stda	%r20, [%r4 + %r5] 0x80
	.word 0xfc290005  ! 1369: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf8210005  ! 1369: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xd8212b78  ! 1369: STW_I	stw	%r12, [%r4 + 0x0b78]
	.word 0xfe292899  ! 1369: STB_I	stb	%r31, [%r4 + 0x0899]
	.word 0xd4710005  ! 1369: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe4710005  ! 1369: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf6290005  ! 1369: STB_R	stb	%r27, [%r4 + %r5]
	.word 0x32800003  ! 1369: BNE	bne,a	<label_0x3>
	.word 0xd8f0cce3  ! 1369: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xf0290005  ! 1378: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd6290005  ! 1378: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf4210005  ! 1378: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xe2290005  ! 1378: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf0290005  ! 1378: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd8310005  ! 1378: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xd8290005  ! 1378: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x32800001  ! 1378: BNE	bne,a	<label_0x1>
	.word 0xd8a92d40  ! 1378: STBA_I	stba	%r12, [%r4 + 0x0d40] %asi
	.word 0xda290005  ! 1387: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe02921c2  ! 1387: STB_I	stb	%r16, [%r4 + 0x01c2]
	.word 0xe4312068  ! 1387: STH_I	sth	%r18, [%r4 + 0x0068]
	.word 0xf431273c  ! 1387: STH_I	sth	%r26, [%r4 + 0x073c]
	.word 0xe8292a67  ! 1387: STB_I	stb	%r20, [%r4 + 0x0a67]
	.word 0xf2310005  ! 1387: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xfe310005  ! 1387: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x1a800003  ! 1387: BCC	bcc  	<label_0x3>
	.word 0xd6f00ce2  ! 1387: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xe6290005  ! 1396: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf2310005  ! 1396: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd4290005  ! 1396: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xde712920  ! 1396: STX_I	stx	%r15, [%r4 + 0x0920]
	.word 0xec212f1c  ! 1396: STW_I	stw	%r22, [%r4 + 0x0f1c]
	.word 0xe0310005  ! 1396: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xee29296c  ! 1396: STB_I	stb	%r23, [%r4 + 0x096c]
	.word 0x0a800001  ! 1396: BCS	bcs  	<label_0x1>
	.word 0xd6f00ce3  ! 1396: STXA_R	stxa	%r11, [%r0 + %r3] 0x67
	.word 0xf8290005  ! 1405: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xee29294b  ! 1405: STB_I	stb	%r23, [%r4 + 0x094b]
	.word 0xe8290005  ! 1405: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf8712010  ! 1405: STX_I	stx	%r28, [%r4 + 0x0010]
	.word 0xe0290005  ! 1405: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xec212210  ! 1405: STW_I	stw	%r22, [%r4 + 0x0210]
	.word 0xec712a80  ! 1405: STX_I	stx	%r22, [%r4 + 0x0a80]
	.word 0x0a800001  ! 1405: BCS	bcs  	<label_0x1>
	.word 0xd6f00969  ! 1405: STXA_R	stxa	%r11, [%r0 + %r9] 0x4b
	.word 0xfe290005  ! 1415: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe2290005  ! 1415: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee712508  ! 1415: STX_I	stx	%r23, [%r4 + 0x0508]
	.word 0xe4210005  ! 1415: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xea290005  ! 1415: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xde2129b4  ! 1415: STW_I	stw	%r15, [%r4 + 0x09b4]
	.word 0xe0290005  ! 1415: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfc712ea0  ! 1415: STX_I	stx	%r30, [%r4 + 0x0ea0]
	.word 0x26800003  ! 1415: BL	bl,a	<label_0x3>
	.word 0xd6f08962  ! 1415: STXA_R	stxa	%r11, [%r2 + %r2] 0x4b
	.word 0xfa290005  ! 1424: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xee310005  ! 1424: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf2210005  ! 1424: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xf2712490  ! 1424: STX_I	stx	%r25, [%r4 + 0x0490]
	.word 0xfc290005  ! 1424: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe8710005  ! 1424: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xfa7127c0  ! 1424: STX_I	stx	%r29, [%r4 + 0x07c0]
	.word 0x26c10003  ! 1424: BRLZ	brlz,a,nt	%4,<label_0x10003>
	.word 0xd8f08980  ! 1424: STXA_R	stxa	%r12, [%r2 + %r0] 0x4c
	.word 0xf6290005  ! 1434: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe0212844  ! 1434: STW_I	stw	%r16, [%r4 + 0x0844]
	.word 0xe2290005  ! 1434: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf8712848  ! 1434: STX_I	stx	%r28, [%r4 + 0x0848]
	.word 0xee710005  ! 1434: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xec2925d7  ! 1434: STB_I	stb	%r22, [%r4 + 0x05d7]
	.word 0xee710005  ! 1434: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xea310005  ! 1434: STH_R	sth	%r21, [%r4 + %r5]
	.word 0x16800001  ! 1434: BGE	bge  	<label_0x1>
	.word 0xd6f04967  ! 1434: STXA_R	stxa	%r11, [%r1 + %r7] 0x4b
	.word 0xf2290005  ! 1444: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe02928e4  ! 1444: STB_I	stb	%r16, [%r4 + 0x08e4]
	.word 0xd42129b0  ! 1444: STW_I	stw	%r10, [%r4 + 0x09b0]
	.word 0xfa292738  ! 1444: STB_I	stb	%r29, [%r4 + 0x0738]
	.word 0xe8710005  ! 1444: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd431258e  ! 1444: STH_I	sth	%r10, [%r4 + 0x058e]
	.word 0xe6290005  ! 1444: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe42920cd  ! 1444: STB_I	stb	%r18, [%r4 + 0x00cd]
	.word 0x34800001  ! 1444: BG	bg,a	<label_0x1>
	.word 0xd8f00962  ! 1444: STXA_R	stxa	%r12, [%r0 + %r2] 0x4b
	.word 0xde290005  ! 1454: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe0310005  ! 1454: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xf87121f0  ! 1454: STX_I	stx	%r28, [%r4 + 0x01f0]
	.word 0xf2210005  ! 1454: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xda210005  ! 1454: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xf67127e0  ! 1454: STX_I	stx	%r27, [%r4 + 0x07e0]
	.word 0xee710005  ! 1454: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xda7128d0  ! 1454: STX_I	stx	%r13, [%r4 + 0x08d0]
	.word 0x06c90003  ! 1454: BRLZ	brlz  ,pt	%4,<label_0x90003>
	.word 0xf6a11005  ! 1454: STWA_R	stwa	%r27, [%r4 + %r5] 0x80
	.word 0xdc290005  ! 1463: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xde312ca0  ! 1463: STH_I	sth	%r15, [%r4 + 0x0ca0]
	.word 0xf0710005  ! 1463: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xda310005  ! 1463: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xd8210005  ! 1463: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe0312178  ! 1463: STH_I	sth	%r16, [%r4 + 0x0178]
	.word 0xdc312ae8  ! 1463: STH_I	sth	%r14, [%r4 + 0x0ae8]
	.word 0x0c800001  ! 1463: BNEG	bneg  	<label_0x1>
	.word 0xd6f00ce8  ! 1463: STXA_R	stxa	%r11, [%r0 + %r8] 0x67
	.word 0xec290005  ! 1472: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xea310005  ! 1472: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xf43121e6  ! 1472: STH_I	sth	%r26, [%r4 + 0x01e6]
	.word 0xe07129f8  ! 1472: STX_I	stx	%r16, [%r4 + 0x09f8]
	.word 0xd8210005  ! 1472: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xfc21208c  ! 1472: STW_I	stw	%r30, [%r4 + 0x008c]
	.word 0xf6712b10  ! 1472: STX_I	stx	%r27, [%r4 + 0x0b10]
	.word 0x2e800001  ! 1472: BVS	bvs,a	<label_0x1>
	.word 0xf5210005  ! 1472: STF_R	st	%f26, [%r5, %r4]
	.word 0xe2290005  ! 1482: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee710005  ! 1482: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xdc310005  ! 1482: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xee2125b0  ! 1482: STW_I	stw	%r23, [%r4 + 0x05b0]
	.word 0xd4710005  ! 1482: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe6710005  ! 1482: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe6212b44  ! 1482: STW_I	stw	%r19, [%r4 + 0x0b44]
	.word 0xf8292b0f  ! 1482: STB_I	stb	%r28, [%r4 + 0x0b0f]
	.word 0x1e800001  ! 1482: BVC	bvc  	<label_0x1>
	.word 0xd8f04ce9  ! 1482: STXA_R	stxa	%r12, [%r1 + %r9] 0x67
	.word 0xec290005  ! 1491: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xea710005  ! 1491: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xe4212dd8  ! 1491: STW_I	stw	%r18, [%r4 + 0x0dd8]
	.word 0xf4210005  ! 1491: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xee31221c  ! 1491: STH_I	sth	%r23, [%r4 + 0x021c]
	.word 0xe0292fd4  ! 1491: STB_I	stb	%r16, [%r4 + 0x0fd4]
	.word 0xe4290005  ! 1491: STB_R	stb	%r18, [%r4 + %r5]
	.word 0x02800001  ! 1491: BE	be  	<label_0x1>
	.word 0xd8f1c963  ! 1491: STXA_R	stxa	%r12, [%r7 + %r3] 0x4b
	.word 0xf6290005  ! 1501: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe6292fe2  ! 1501: STB_I	stb	%r19, [%r4 + 0x0fe2]
	.word 0xf4292007  ! 1501: STB_I	stb	%r26, [%r4 + 0x0007]
	.word 0xd4310005  ! 1501: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xe4290005  ! 1501: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe8212028  ! 1501: STW_I	stw	%r20, [%r4 + 0x0028]
	.word 0xd6710005  ! 1501: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xf0212968  ! 1501: STW_I	stw	%r24, [%r4 + 0x0968]
	.word 0x24800001  ! 1501: BLE	ble,a	<label_0x1>
	.word 0xd4a92037  ! 1501: STBA_I	stba	%r10, [%r4 + 0x0037] %asi
	.word 0xf8290005  ! 1511: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xfa2929f3  ! 1511: STB_I	stb	%r29, [%r4 + 0x09f3]
	.word 0xd4310005  ! 1511: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xd6712f08  ! 1511: STX_I	stx	%r11, [%r4 + 0x0f08]
	.word 0xd431243e  ! 1511: STH_I	sth	%r10, [%r4 + 0x043e]
	.word 0xe8712d68  ! 1511: STX_I	stx	%r20, [%r4 + 0x0d68]
	.word 0xee292215  ! 1511: STB_I	stb	%r23, [%r4 + 0x0215]
	.word 0xe0712670  ! 1511: STX_I	stx	%r16, [%r4 + 0x0670]
	.word 0x0ac90003  ! 1511: BRNZ	brnz  ,pt	%4,<label_0x90003>
	.word 0xd6f0c961  ! 1511: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xec290005  ! 1520: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xea292e93  ! 1520: STB_I	stb	%r21, [%r4 + 0x0e93]
	.word 0xfe710005  ! 1520: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xfe710005  ! 1520: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xde21260c  ! 1520: STW_I	stw	%r15, [%r4 + 0x060c]
	.word 0xfa310005  ! 1520: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xd4210005  ! 1520: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x0ac10001  ! 1520: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xd6f0cce0  ! 1520: STXA_R	stxa	%r11, [%r3 + %r0] 0x67
	.word 0xfe290005  ! 1530: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf4292b49  ! 1530: STB_I	stb	%r26, [%r4 + 0x0b49]
	.word 0xf2310005  ! 1530: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd431203a  ! 1530: STH_I	sth	%r10, [%r4 + 0x003a]
	.word 0xf2290005  ! 1530: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe4210005  ! 1530: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xf0212514  ! 1530: STW_I	stw	%r24, [%r4 + 0x0514]
	.word 0xf4710005  ! 1530: STX_R	stx	%r26, [%r4 + %r5]
	.word 0x24800001  ! 1530: BLE	ble,a	<label_0x1>
	.word 0xef390005  ! 1530: STDF_R	std	%f23, [%r5, %r4]
	.word 0xd6290005  ! 1540: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfe710005  ! 1540: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe6290005  ! 1540: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf4210005  ! 1540: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xdc712768  ! 1540: STX_I	stx	%r14, [%r4 + 0x0768]
	.word 0xe0310005  ! 1540: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xee292425  ! 1540: STB_I	stb	%r23, [%r4 + 0x0425]
	.word 0xdc712170  ! 1540: STX_I	stx	%r14, [%r4 + 0x0170]
	.word 0x04800003  ! 1540: BLE	ble  	<label_0x3>
	.word 0xd6f92424  ! 1540: SWAPA_I	swapa	%r11, [%r4 + 0x0424] %asi
	.word 0xd6290005  ! 1550: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf2712d88  ! 1550: STX_I	stx	%r25, [%r4 + 0x0d88]
	.word 0xe62122b0  ! 1550: STW_I	stw	%r19, [%r4 + 0x02b0]
	.word 0xe2712350  ! 1550: STX_I	stx	%r17, [%r4 + 0x0350]
	.word 0xfc210005  ! 1550: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xfe210005  ! 1550: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xf62124b8  ! 1550: STW_I	stw	%r27, [%r4 + 0x04b8]
	.word 0xe6710005  ! 1550: STX_R	stx	%r19, [%r4 + %r5]
	.word 0x10800001  ! 1550: BA	ba  	<label_0x1>
	.word 0xf1212934  ! 1550: STF_I	st	%f24, [0x0934, %r4]
	.word 0xd6290005  ! 1559: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf42121b0  ! 1559: STW_I	stw	%r26, [%r4 + 0x01b0]
	.word 0xde310005  ! 1559: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xf4310005  ! 1559: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xfe210005  ! 1559: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xfe210005  ! 1559: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xe6710005  ! 1559: STX_R	stx	%r19, [%r4 + %r5]
	.word 0x08800001  ! 1559: BLEU	bleu  	<label_0x1>
	.word 0xd6f08963  ! 1559: STXA_R	stxa	%r11, [%r2 + %r3] 0x4b
	.word 0xec290005  ! 1568: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe2310005  ! 1568: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xf8712088  ! 1568: STX_I	stx	%r28, [%r4 + 0x0088]
	.word 0xe2210005  ! 1568: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xf22929d3  ! 1568: STB_I	stb	%r25, [%r4 + 0x09d3]
	.word 0xf87129c0  ! 1568: STX_I	stx	%r28, [%r4 + 0x09c0]
	.word 0xdc290005  ! 1568: STB_R	stb	%r14, [%r4 + %r5]
	.word 0x00800001  ! 1568: BN	bn  	<label_0x1>
	.word 0xd8792a3c  ! 1568: SWAP_I	swap	%r12, [%r4 + 0x0a3c]
	.word 0xf6290005  ! 1577: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xee212f4c  ! 1577: STW_I	stw	%r23, [%r4 + 0x0f4c]
	.word 0xea212be8  ! 1577: STW_I	stw	%r21, [%r4 + 0x0be8]
	.word 0xfc310005  ! 1577: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xd4292e9c  ! 1577: STB_I	stb	%r10, [%r4 + 0x0e9c]
	.word 0xe0310005  ! 1577: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xf4292363  ! 1577: STB_I	stb	%r26, [%r4 + 0x0363]
	.word 0x02800001  ! 1577: BE	be  	<label_0x1>
	.word 0xd6f0c982  ! 1577: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xde290005  ! 1586: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe0710005  ! 1586: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xf0212f24  ! 1586: STW_I	stw	%r24, [%r4 + 0x0f24]
	.word 0xf0210005  ! 1586: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf2212610  ! 1586: STW_I	stw	%r25, [%r4 + 0x0610]
	.word 0xf0710005  ! 1586: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfe292c9b  ! 1586: STB_I	stb	%r31, [%r4 + 0x0c9b]
	.word 0x24c10003  ! 1586: BRLEZ	brlez,a,nt	%4,<label_0x10003>
	.word 0xd8f24ce2  ! 1586: STXA_R	stxa	%r12, [%r9 + %r2] 0x67
	.word 0xe0290005  ! 1596: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd6312dd2  ! 1596: STH_I	sth	%r11, [%r4 + 0x0dd2]
	.word 0xf87121d0  ! 1596: STX_I	stx	%r28, [%r4 + 0x01d0]
	.word 0xfe310005  ! 1596: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xfc21250c  ! 1596: STW_I	stw	%r30, [%r4 + 0x050c]
	.word 0xe0210005  ! 1596: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfc712840  ! 1596: STX_I	stx	%r30, [%r4 + 0x0840]
	.word 0xf4710005  ! 1596: STX_R	stx	%r26, [%r4 + %r5]
	.word 0x30800001  ! 1596: BA	ba,a	<label_0x1>
	.word 0xd4b92ec0  ! 1596: STDA_I	stda	%r10, [%r4 + 0x0ec0] %asi
	.word 0xd4290005  ! 1606: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xd4210005  ! 1606: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xea212738  ! 1606: STW_I	stw	%r21, [%r4 + 0x0738]
	.word 0xf8292ee2  ! 1606: STB_I	stb	%r28, [%r4 + 0x0ee2]
	.word 0xe4210005  ! 1606: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xf4212240  ! 1606: STW_I	stw	%r26, [%r4 + 0x0240]
	.word 0xd6212154  ! 1606: STW_I	stw	%r11, [%r4 + 0x0154]
	.word 0xea290005  ! 1606: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x0e800001  ! 1606: BVS	bvs  	<label_0x1>
	.word 0xd6a92695  ! 1606: STBA_I	stba	%r11, [%r4 + 0x0695] %asi
	.word 0xfe290005  ! 1615: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfe710005  ! 1615: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xdc212ab0  ! 1615: STW_I	stw	%r14, [%r4 + 0x0ab0]
	.word 0xf2212fcc  ! 1615: STW_I	stw	%r25, [%r4 + 0x0fcc]
	.word 0xea7120a0  ! 1615: STX_I	stx	%r21, [%r4 + 0x00a0]
	.word 0xf6212e1c  ! 1615: STW_I	stw	%r27, [%r4 + 0x0e1c]
	.word 0xde210005  ! 1615: STW_R	stw	%r15, [%r4 + %r5]
	.word 0x16800003  ! 1615: BGE	bge  	<label_0x3>
	.word 0xd8f00981  ! 1615: STXA_R	stxa	%r12, [%r0 + %r1] 0x4c
	.word 0xea290005  ! 1624: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xde290005  ! 1624: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xda29262f  ! 1624: STB_I	stb	%r13, [%r4 + 0x062f]
	.word 0xe0210005  ! 1624: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfe712f80  ! 1624: STX_I	stx	%r31, [%r4 + 0x0f80]
	.word 0xda212b48  ! 1624: STW_I	stw	%r13, [%r4 + 0x0b48]
	.word 0xfe2923bf  ! 1624: STB_I	stb	%r31, [%r4 + 0x03bf]
	.word 0x26800001  ! 1624: BL	bl,a	<label_0x1>
	.word 0xf4e92a06  ! 1624: LDSTUBA_I	ldstuba	%r26, [%r4 + 0x0a06] %asi
	.word 0xfa290005  ! 1633: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf4290005  ! 1633: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd4312576  ! 1633: STH_I	sth	%r10, [%r4 + 0x0576]
	.word 0xe67123e0  ! 1633: STX_I	stx	%r19, [%r4 + 0x03e0]
	.word 0xf031249a  ! 1633: STH_I	sth	%r24, [%r4 + 0x049a]
	.word 0xdc312256  ! 1633: STH_I	sth	%r14, [%r4 + 0x0256]
	.word 0xe6712a08  ! 1633: STX_I	stx	%r19, [%r4 + 0x0a08]
	.word 0x0e800001  ! 1633: BVS	bvs  	<label_0x1>
	.word 0xd6f08ce2  ! 1633: STXA_R	stxa	%r11, [%r2 + %r2] 0x67
	.word 0xfa290005  ! 1643: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe2312aa6  ! 1643: STH_I	sth	%r17, [%r4 + 0x0aa6]
	.word 0xde310005  ! 1643: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xec290005  ! 1643: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd83122ac  ! 1643: STH_I	sth	%r12, [%r4 + 0x02ac]
	.word 0xdc310005  ! 1643: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xf2210005  ! 1643: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xe0292caa  ! 1643: STB_I	stb	%r16, [%r4 + 0x0caa]
	.word 0x2c800001  ! 1643: BNEG	bneg,a	<label_0x1>
	.word 0xd6f0c987  ! 1643: STXA_R	stxa	%r11, [%r3 + %r7] 0x4c
	.word 0xe2290005  ! 1652: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xea2129c4  ! 1652: STW_I	stw	%r21, [%r4 + 0x09c4]
	.word 0xe2310005  ! 1652: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xea710005  ! 1652: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xec712480  ! 1652: STX_I	stx	%r22, [%r4 + 0x0480]
	.word 0xe6292389  ! 1652: STB_I	stb	%r19, [%r4 + 0x0389]
	.word 0xfc210005  ! 1652: STW_R	stw	%r30, [%r4 + %r5]
	.word 0x18800003  ! 1652: BGU	bgu  	<label_0x3>
	.word 0xd6f04961  ! 1652: STXA_R	stxa	%r11, [%r1 + %r1] 0x4b
	.word 0xfc290005  ! 1661: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe87123d0  ! 1661: STX_I	stx	%r20, [%r4 + 0x03d0]
	.word 0xec312d54  ! 1661: STH_I	sth	%r22, [%r4 + 0x0d54]
	.word 0xde292413  ! 1661: STB_I	stb	%r15, [%r4 + 0x0413]
	.word 0xe8310005  ! 1661: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf0212074  ! 1661: STW_I	stw	%r24, [%r4 + 0x0074]
	.word 0xe8210005  ! 1661: STW_R	stw	%r20, [%r4 + %r5]
	.word 0x08800001  ! 1661: BLEU	bleu  	<label_0x1>
	.word 0xd6f04967  ! 1661: STXA_R	stxa	%r11, [%r1 + %r7] 0x4b
	.word 0xec290005  ! 1670: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf0212630  ! 1670: STW_I	stw	%r24, [%r4 + 0x0630]
	.word 0xd63120de  ! 1670: STH_I	sth	%r11, [%r4 + 0x00de]
	.word 0xf0710005  ! 1670: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfe210005  ! 1670: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xf0712860  ! 1670: STX_I	stx	%r24, [%r4 + 0x0860]
	.word 0xda710005  ! 1670: STX_R	stx	%r13, [%r4 + %r5]
	.word 0x3c800001  ! 1670: BPOS	bpos,a	<label_0x1>
	.word 0xd6f00ce1  ! 1670: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xf4290005  ! 1679: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd8210005  ! 1679: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xee312092  ! 1679: STH_I	sth	%r23, [%r4 + 0x0092]
	.word 0xd87129f8  ! 1679: STX_I	stx	%r12, [%r4 + 0x09f8]
	.word 0xdc312b22  ! 1679: STH_I	sth	%r14, [%r4 + 0x0b22]
	.word 0xf2212970  ! 1679: STW_I	stw	%r25, [%r4 + 0x0970]
	.word 0xda310005  ! 1679: STH_R	sth	%r13, [%r4 + %r5]
	.word 0x1e800001  ! 1679: BVC	bvc  	<label_0x1>
	.word 0xd8f0cce0  ! 1679: STXA_R	stxa	%r12, [%r3 + %r0] 0x67
	.word 0xf0290005  ! 1689: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xea290005  ! 1689: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd6712a08  ! 1689: STX_I	stx	%r11, [%r4 + 0x0a08]
	.word 0xd6290005  ! 1689: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xde290005  ! 1689: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc310005  ! 1689: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xe8212f98  ! 1689: STW_I	stw	%r20, [%r4 + 0x0f98]
	.word 0xee3120f6  ! 1689: STH_I	sth	%r23, [%r4 + 0x00f6]
	.word 0x08800001  ! 1689: BLEU	bleu  	<label_0x1>
	.word 0xf8712b90  ! 1689: STX_I	stx	%r28, [%r4 + 0x0b90]
	.word 0xec290005  ! 1698: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xda7120a8  ! 1698: STX_I	stx	%r13, [%r4 + 0x00a8]
	.word 0xee710005  ! 1698: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe4290005  ! 1698: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf0292c28  ! 1698: STB_I	stb	%r24, [%r4 + 0x0c28]
	.word 0xe2210005  ! 1698: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xec710005  ! 1698: STX_R	stx	%r22, [%r4 + %r5]
	.word 0x0a800001  ! 1698: BCS	bcs  	<label_0x1>
	.word 0xd6f00ce8  ! 1698: STXA_R	stxa	%r11, [%r0 + %r8] 0x67
	.word 0xf4290005  ! 1707: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd431237e  ! 1707: STH_I	sth	%r10, [%r4 + 0x037e]
	.word 0xec312b50  ! 1707: STH_I	sth	%r22, [%r4 + 0x0b50]
	.word 0xf82125e0  ! 1707: STW_I	stw	%r28, [%r4 + 0x05e0]
	.word 0xd4310005  ! 1707: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xde710005  ! 1707: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf27121e8  ! 1707: STX_I	stx	%r25, [%r4 + 0x01e8]
	.word 0x00800001  ! 1707: BN	bn  	<label_0x1>
	.word 0xfa212e4c  ! 1707: STW_I	stw	%r29, [%r4 + 0x0e4c]
	.word 0xf0290005  ! 1716: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf8210005  ! 1716: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xee310005  ! 1716: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xfa31281e  ! 1716: STH_I	sth	%r29, [%r4 + 0x081e]
	.word 0xfa292f26  ! 1716: STB_I	stb	%r29, [%r4 + 0x0f26]
	.word 0xfe212b10  ! 1716: STW_I	stw	%r31, [%r4 + 0x0b10]
	.word 0xe2712010  ! 1716: STX_I	stx	%r17, [%r4 + 0x0010]
	.word 0x3e800001  ! 1716: BVC	bvc,a	<label_0x1>
	.word 0xf3f12005  ! 1716: CASXA_R	casxa	[%r4]%asi, %r5, %r25
	.word 0xde290005  ! 1726: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xde710005  ! 1726: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xea712560  ! 1726: STX_I	stx	%r21, [%r4 + 0x0560]
	.word 0xf0212c70  ! 1726: STW_I	stw	%r24, [%r4 + 0x0c70]
	.word 0xe6712068  ! 1726: STX_I	stx	%r19, [%r4 + 0x0068]
	.word 0xd4310005  ! 1726: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xd8312cd6  ! 1726: STH_I	sth	%r12, [%r4 + 0x0cd6]
	.word 0xee710005  ! 1726: STX_R	stx	%r23, [%r4 + %r5]
	.word 0x22c90001  ! 1726: BRZ	brz,a,pt	%4,<label_0x90001>
	.word 0xf9f12005  ! 1726: CASXA_R	casxa	[%r4]%asi, %r5, %r28
	.word 0xd6290005  ! 1735: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe029212a  ! 1735: STB_I	stb	%r16, [%r4 + 0x012a]
	.word 0xf6710005  ! 1735: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe6712528  ! 1735: STX_I	stx	%r19, [%r4 + 0x0528]
	.word 0xd6710005  ! 1735: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xfa292523  ! 1735: STB_I	stb	%r29, [%r4 + 0x0523]
	.word 0xe2310005  ! 1735: STH_R	sth	%r17, [%r4 + %r5]
	.word 0x22800001  ! 1735: BE	be,a	<label_0x1>
	.word 0xd6f1cce3  ! 1735: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xe8290005  ! 1744: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf6310005  ! 1744: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xfc210005  ! 1744: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xe2210005  ! 1744: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xe2310005  ! 1744: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xfe310005  ! 1744: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xea712a78  ! 1744: STX_I	stx	%r21, [%r4 + 0x0a78]
	.word 0x3a800001  ! 1744: BCC	bcc,a	<label_0x1>
	.word 0xf9210005  ! 1744: STF_R	st	%f28, [%r5, %r4]
	.word 0xd6290005  ! 1753: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xdc210005  ! 1753: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd6310005  ! 1753: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xee2126e4  ! 1753: STW_I	stw	%r23, [%r4 + 0x06e4]
	.word 0xfa710005  ! 1753: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xda710005  ! 1753: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xea310005  ! 1753: STH_R	sth	%r21, [%r4 + %r5]
	.word 0x04800003  ! 1753: BLE	ble  	<label_0x3>
	.word 0xd8f20983  ! 1753: STXA_R	stxa	%r12, [%r8 + %r3] 0x4c
	.word 0xf2290005  ! 1763: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe6712678  ! 1763: STX_I	stx	%r19, [%r4 + 0x0678]
	.word 0xf629280b  ! 1763: STB_I	stb	%r27, [%r4 + 0x080b]
	.word 0xf2312e88  ! 1763: STH_I	sth	%r25, [%r4 + 0x0e88]
	.word 0xea290005  ! 1763: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xfe210005  ! 1763: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xea710005  ! 1763: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xde292ed2  ! 1763: STB_I	stb	%r15, [%r4 + 0x0ed2]
	.word 0x40000001  ! 1763: CALL	call	disp30_1
	.word 0xeef92464  ! 1763: SWAPA_I	swapa	%r23, [%r4 + 0x0464] %asi
	.word 0xda290005  ! 1772: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe2212fd4  ! 1772: STW_I	stw	%r17, [%r4 + 0x0fd4]
	.word 0xf8710005  ! 1772: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xe2210005  ! 1772: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xea710005  ! 1772: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf621213c  ! 1772: STW_I	stw	%r27, [%r4 + 0x013c]
	.word 0xf831225a  ! 1772: STH_I	sth	%r28, [%r4 + 0x025a]
	.word 0x04800003  ! 1772: BLE	ble  	<label_0x3>
	.word 0xecb91005  ! 1772: STDA_R	stda	%r22, [%r4 + %r5] 0x80
	.word 0xe6290005  ! 1781: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfa3124f0  ! 1781: STH_I	sth	%r29, [%r4 + 0x04f0]
	.word 0xfc310005  ! 1781: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf0210005  ! 1781: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xfa290005  ! 1781: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe4712508  ! 1781: STX_I	stx	%r18, [%r4 + 0x0508]
	.word 0xd8710005  ! 1781: STX_R	stx	%r12, [%r4 + %r5]
	.word 0x2ac10003  ! 1781: BRNZ	brnz,a,nt	%4,<label_0x10003>
	.word 0xd6f0c968  ! 1781: STXA_R	stxa	%r11, [%r3 + %r8] 0x4b
	.word 0xf4290005  ! 1791: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe0712268  ! 1791: STX_I	stx	%r16, [%r4 + 0x0268]
	.word 0xde290005  ! 1791: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd4710005  ! 1791: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xea312bde  ! 1791: STH_I	sth	%r21, [%r4 + 0x0bde]
	.word 0xe8312bc8  ! 1791: STH_I	sth	%r20, [%r4 + 0x0bc8]
	.word 0xf4312a0a  ! 1791: STH_I	sth	%r26, [%r4 + 0x0a0a]
	.word 0xfa292e43  ! 1791: STB_I	stb	%r29, [%r4 + 0x0e43]
	.word 0x0cc90003  ! 1791: BRGZ	brgz  ,pt	%4,<label_0x90003>
	.word 0xfd210005  ! 1791: STF_R	st	%f30, [%r5, %r4]
	.word 0xea290005  ! 1800: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xdc712d18  ! 1800: STX_I	stx	%r14, [%r4 + 0x0d18]
	.word 0xe22128f8  ! 1800: STW_I	stw	%r17, [%r4 + 0x08f8]
	.word 0xe2310005  ! 1800: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xde710005  ! 1800: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf4712778  ! 1800: STX_I	stx	%r26, [%r4 + 0x0778]
	.word 0xde3122e2  ! 1800: STH_I	sth	%r15, [%r4 + 0x02e2]
	.word 0x1a800001  ! 1800: BCC	bcc  	<label_0x1>
	.word 0xf679249c  ! 1800: SWAP_I	swap	%r27, [%r4 + 0x049c]
	.word 0xec290005  ! 1809: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf8710005  ! 1809: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf0210005  ! 1809: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xfa212b50  ! 1809: STW_I	stw	%r29, [%r4 + 0x0b50]
	.word 0xdc310005  ! 1809: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xfc710005  ! 1809: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xd4310005  ! 1809: STH_R	sth	%r10, [%r4 + %r5]
	.word 0x1e800001  ! 1809: BVC	bvc  	<label_0x1>
	.word 0xd6f08ce9  ! 1809: STXA_R	stxa	%r11, [%r2 + %r9] 0x67
	.word 0xea290005  ! 1819: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf8290005  ! 1819: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xda212630  ! 1819: STW_I	stw	%r13, [%r4 + 0x0630]
	.word 0xd4712ae0  ! 1819: STX_I	stx	%r10, [%r4 + 0x0ae0]
	.word 0xf62126fc  ! 1819: STW_I	stw	%r27, [%r4 + 0x06fc]
	.word 0xe02928d8  ! 1819: STB_I	stb	%r16, [%r4 + 0x08d8]
	.word 0xe8210005  ! 1819: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe2290005  ! 1819: STB_R	stb	%r17, [%r4 + %r5]
	.word 0x06c10001  ! 1819: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xff392388  ! 1819: STDF_I	std	%f31, [0x0388, %r4]
	.word 0xf2290005  ! 1828: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf0310005  ! 1828: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xf2210005  ! 1828: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xe6292166  ! 1828: STB_I	stb	%r19, [%r4 + 0x0166]
	.word 0xf4712d80  ! 1828: STX_I	stx	%r26, [%r4 + 0x0d80]
	.word 0xf27121e0  ! 1828: STX_I	stx	%r25, [%r4 + 0x01e0]
	.word 0xe021295c  ! 1828: STW_I	stw	%r16, [%r4 + 0x095c]
	.word 0x22c10001  ! 1828: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xd6f08981  ! 1828: STXA_R	stxa	%r11, [%r2 + %r1] 0x4c
	.word 0xfc290005  ! 1837: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf0312376  ! 1837: STH_I	sth	%r24, [%r4 + 0x0376]
	.word 0xde310005  ! 1837: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xf0212c50  ! 1837: STW_I	stw	%r24, [%r4 + 0x0c50]
	.word 0xec290005  ! 1837: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf6712768  ! 1837: STX_I	stx	%r27, [%r4 + 0x0768]
	.word 0xfe310005  ! 1837: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x0cc90001  ! 1837: BRGZ	brgz  ,pt	%4,<label_0x90001>
	.word 0xe0312bbc  ! 1837: STH_I	sth	%r16, [%r4 + 0x0bbc]
	.word 0xf4290005  ! 1846: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe8290005  ! 1846: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfe290005  ! 1846: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf2312cc8  ! 1846: STH_I	sth	%r25, [%r4 + 0x0cc8]
	.word 0xe0290005  ! 1846: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf2292ec1  ! 1846: STB_I	stb	%r25, [%r4 + 0x0ec1]
	.word 0xf8210005  ! 1846: STW_R	stw	%r28, [%r4 + %r5]
	.word 0x0cc10001  ! 1846: BRGZ	brgz  ,nt	%4,<label_0x10001>
	.word 0xd6f08981  ! 1846: STXA_R	stxa	%r11, [%r2 + %r1] 0x4c
	.word 0xe4290005  ! 1855: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xda312de4  ! 1855: STH_I	sth	%r13, [%r4 + 0x0de4]
	.word 0xd8712650  ! 1855: STX_I	stx	%r12, [%r4 + 0x0650]
	.word 0xe4710005  ! 1855: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf8310005  ! 1855: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xd631252a  ! 1855: STH_I	sth	%r11, [%r4 + 0x052a]
	.word 0xf4310005  ! 1855: STH_R	sth	%r26, [%r4 + %r5]
	.word 0x0ec10001  ! 1855: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xe0b1264e  ! 1855: STHA_I	stha	%r16, [%r4 + 0x064e] %asi
	.word 0xee290005  ! 1864: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe8290005  ! 1864: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfe292f68  ! 1864: STB_I	stb	%r31, [%r4 + 0x0f68]
	.word 0xee710005  ! 1864: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xee2122cc  ! 1864: STW_I	stw	%r23, [%r4 + 0x02cc]
	.word 0xec292d55  ! 1864: STB_I	stb	%r22, [%r4 + 0x0d55]
	.word 0xf8292ade  ! 1864: STB_I	stb	%r28, [%r4 + 0x0ade]
	.word 0x26c10001  ! 1864: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xe0a12774  ! 1864: STWA_I	stwa	%r16, [%r4 + 0x0774] %asi
	.word 0xea290005  ! 1873: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd8212500  ! 1873: STW_I	stw	%r12, [%r4 + 0x0500]
	.word 0xfa712a38  ! 1873: STX_I	stx	%r29, [%r4 + 0x0a38]
	.word 0xdc2120a8  ! 1873: STW_I	stw	%r14, [%r4 + 0x00a8]
	.word 0xd6712678  ! 1873: STX_I	stx	%r11, [%r4 + 0x0678]
	.word 0xee290005  ! 1873: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfe290005  ! 1873: STB_R	stb	%r31, [%r4 + %r5]
	.word 0x2cc10001  ! 1873: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd8f0cce9  ! 1873: STXA_R	stxa	%r12, [%r3 + %r9] 0x67
	.word 0xd8290005  ! 1882: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xea712938  ! 1882: STX_I	stx	%r21, [%r4 + 0x0938]
	.word 0xf0310005  ! 1882: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xda312896  ! 1882: STH_I	sth	%r13, [%r4 + 0x0896]
	.word 0xfe3128b2  ! 1882: STH_I	sth	%r31, [%r4 + 0x08b2]
	.word 0xe6290005  ! 1882: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xee210005  ! 1882: STW_R	stw	%r23, [%r4 + %r5]
	.word 0x22800001  ! 1882: BE	be,a	<label_0x1>
	.word 0xeeb11005  ! 1882: STHA_R	stha	%r23, [%r4 + %r5] 0x80
	.word 0xe6290005  ! 1891: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe4292722  ! 1891: STB_I	stb	%r18, [%r4 + 0x0722]
	.word 0xdc2122e4  ! 1891: STW_I	stw	%r14, [%r4 + 0x02e4]
	.word 0xfe292f2b  ! 1891: STB_I	stb	%r31, [%r4 + 0x0f2b]
	.word 0xfe212fc0  ! 1891: STW_I	stw	%r31, [%r4 + 0x0fc0]
	.word 0xd8210005  ! 1891: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xec312292  ! 1891: STH_I	sth	%r22, [%r4 + 0x0292]
	.word 0x24c90001  ! 1891: BRLEZ	brlez,a,pt	%4,<label_0x90001>
	.word 0xd6f24ce6  ! 1891: STXA_R	stxa	%r11, [%r9 + %r6] 0x67
	.word 0xf4290005  ! 1900: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd6712140  ! 1900: STX_I	stx	%r11, [%r4 + 0x0140]
	.word 0xda712290  ! 1900: STX_I	stx	%r13, [%r4 + 0x0290]
	.word 0xe2210005  ! 1900: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xea290005  ! 1900: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe4290005  ! 1900: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd8712d78  ! 1900: STX_I	stx	%r12, [%r4 + 0x0d78]
	.word 0x26800001  ! 1900: BL	bl,a	<label_0x1>
	.word 0xd6f08ce3  ! 1900: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xd4290005  ! 1910: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfe712008  ! 1910: STX_I	stx	%r31, [%r4 + 0x0008]
	.word 0xee310005  ! 1910: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf4712230  ! 1910: STX_I	stx	%r26, [%r4 + 0x0230]
	.word 0xde210005  ! 1910: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xde312e56  ! 1910: STH_I	sth	%r15, [%r4 + 0x0e56]
	.word 0xe0210005  ! 1910: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfe212cc0  ! 1910: STW_I	stw	%r31, [%r4 + 0x0cc0]
	.word 0x3a800001  ! 1910: BCC	bcc,a	<label_0x1>
	.word 0xf0a11005  ! 1910: STWA_R	stwa	%r24, [%r4 + %r5] 0x80
	.word 0xe2290005  ! 1920: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe0312dc6  ! 1920: STH_I	sth	%r16, [%r4 + 0x0dc6]
	.word 0xfa712050  ! 1920: STX_I	stx	%r29, [%r4 + 0x0050]
	.word 0xf6290005  ! 1920: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfe31216c  ! 1920: STH_I	sth	%r31, [%r4 + 0x016c]
	.word 0xf6212334  ! 1920: STW_I	stw	%r27, [%r4 + 0x0334]
	.word 0xde292b9e  ! 1920: STB_I	stb	%r15, [%r4 + 0x0b9e]
	.word 0xd4212e74  ! 1920: STW_I	stw	%r10, [%r4 + 0x0e74]
	.word 0x1e800001  ! 1920: BVC	bvc  	<label_0x1>
	.word 0xe6310005  ! 1920: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xfc290005  ! 1929: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe6290005  ! 1929: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe22920fa  ! 1929: STB_I	stb	%r17, [%r4 + 0x00fa]
	.word 0xe6210005  ! 1929: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf4290005  ! 1929: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd8710005  ! 1929: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xe4292de6  ! 1929: STB_I	stb	%r18, [%r4 + 0x0de6]
	.word 0x26800001  ! 1929: BL	bl,a	<label_0x1>
	.word 0xe0f91005  ! 1929: SWAPA_R	swapa	%r16, [%r4 + %r5] 0x80
	.word 0xe2290005  ! 1938: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe02127a4  ! 1938: STW_I	stw	%r16, [%r4 + 0x07a4]
	.word 0xda290005  ! 1938: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd4710005  ! 1938: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xea290005  ! 1938: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xfa3124f6  ! 1938: STH_I	sth	%r29, [%r4 + 0x04f6]
	.word 0xdc310005  ! 1938: STH_R	sth	%r14, [%r4 + %r5]
	.word 0x14800001  ! 1938: BG	bg  	<label_0x1>
	.word 0xd6f08961  ! 1938: STXA_R	stxa	%r11, [%r2 + %r1] 0x4b
	.word 0xf2290005  ! 1948: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe4710005  ! 1948: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfe710005  ! 1948: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe4212e28  ! 1948: STW_I	stw	%r18, [%r4 + 0x0e28]
	.word 0xdc290005  ! 1948: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf6210005  ! 1948: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf4290005  ! 1948: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe6710005  ! 1948: STX_R	stx	%r19, [%r4 + %r5]
	.word 0x28800001  ! 1948: BLEU	bleu,a	<label_0x1>
	.word 0xd6f24ce1  ! 1948: STXA_R	stxa	%r11, [%r9 + %r1] 0x67
	.word 0xe0290005  ! 1957: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xde210005  ! 1957: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xf2710005  ! 1957: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xd629286a  ! 1957: STB_I	stb	%r11, [%r4 + 0x086a]
	.word 0xec2124e8  ! 1957: STW_I	stw	%r22, [%r4 + 0x04e8]
	.word 0xe0312a44  ! 1957: STH_I	sth	%r16, [%r4 + 0x0a44]
	.word 0xf0292fdd  ! 1957: STB_I	stb	%r24, [%r4 + 0x0fdd]
	.word 0x1a800001  ! 1957: BCC	bcc  	<label_0x1>
	.word 0xd8e91005  ! 1957: LDSTUBA_R	ldstuba	%r12, [%r4 + %r5] 0x80
	.word 0xe4290005  ! 1966: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf8212388  ! 1966: STW_I	stw	%r28, [%r4 + 0x0388]
	.word 0xf0312ab4  ! 1966: STH_I	sth	%r24, [%r4 + 0x0ab4]
	.word 0xf2210005  ! 1966: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xde212ce4  ! 1966: STW_I	stw	%r15, [%r4 + 0x0ce4]
	.word 0xec310005  ! 1966: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe07125d8  ! 1966: STX_I	stx	%r16, [%r4 + 0x05d8]
	.word 0x38800003  ! 1966: BGU	bgu,a	<label_0x3>
	.word 0xea2125e8  ! 1966: STW_I	stw	%r21, [%r4 + 0x05e8]
	.word 0xf6290005  ! 1975: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfa710005  ! 1975: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe8310005  ! 1975: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf8712430  ! 1975: STX_I	stx	%r28, [%r4 + 0x0430]
	.word 0xe4310005  ! 1975: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xfa31238c  ! 1975: STH_I	sth	%r29, [%r4 + 0x038c]
	.word 0xde710005  ! 1975: STX_R	stx	%r15, [%r4 + %r5]
	.word 0x16800001  ! 1975: BGE	bge  	<label_0x1>
	.word 0xd6f08968  ! 1975: STXA_R	stxa	%r11, [%r2 + %r8] 0x4b
	.word 0xde290005  ! 1985: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc292432  ! 1985: STB_I	stb	%r30, [%r4 + 0x0432]
	.word 0xd6210005  ! 1985: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xea312e86  ! 1985: STH_I	sth	%r21, [%r4 + 0x0e86]
	.word 0xe4290005  ! 1985: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe8210005  ! 1985: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xf2312d1e  ! 1985: STH_I	sth	%r25, [%r4 + 0x0d1e]
	.word 0xf8292cba  ! 1985: STB_I	stb	%r28, [%r4 + 0x0cba]
	.word 0x24c90001  ! 1985: BRLEZ	brlez,a,pt	%4,<label_0x90001>
	.word 0xd6f08ce3  ! 1985: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xea290005  ! 1995: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xfa2120bc  ! 1995: STW_I	stw	%r29, [%r4 + 0x00bc]
	.word 0xd8710005  ! 1995: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xfc29272a  ! 1995: STB_I	stb	%r30, [%r4 + 0x072a]
	.word 0xd82129ac  ! 1995: STW_I	stw	%r12, [%r4 + 0x09ac]
	.word 0xf4712f30  ! 1995: STX_I	stx	%r26, [%r4 + 0x0f30]
	.word 0xd8210005  ! 1995: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xdc292516  ! 1995: STB_I	stb	%r14, [%r4 + 0x0516]
	.word 0x36800003  ! 1995: BGE	bge,a	<label_0x3>
	.word 0xd6f00962  ! 1995: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
        ta      T_GOOD_TRAP
	nop
	nop

th_main_2:
	setx  0x30cf1522026b2f10, %r1, %r1
	setx  0xfe4a009c096a4670, %r1, %r2
	setx  0xac967b8c0fc1f3a0, %r1, %r3
	setx  0xe49b5eaf0c523ef8, %r1, %r6
	setx  0xb7aa3a9c0b3022a8, %r1, %r7
	setx  0xede4623107053eb8, %r1, %r8
	setx  0x76498c5801cdb220, %r1, %r9
	setx  0xdcf82fd07abb1abe, %r1, %r13
	setx  0x24e46b908d39aff4, %r1, %r14
	setx  0xef0c6320a819ad10, %r1, %r15
	setx  0x79eb0a80b428f5ab, %r1, %r16
	setx  0xf92fc6c027cc8121, %r1, %r17
	setx  0x16dba1a0d11e3614, %r1, %r18
	setx  0x25ef1f20a2dce480, %r1, %r19
	setx  0x47f609e089ead2b5, %r1, %r20
	setx  0xf9f248b035e76a0a, %r1, %r21
	setx  0x8f1677405a1310f2, %r1, %r22
	setx  0xa89b239095669980, %r1, %r23
	setx  0x52c6fb1085867705, %r1, %r24
	setx  0x4130c9108675dcda, %r1, %r25
	setx  0xfae60f506a96828d, %r1, %r26
	setx  0xccb67c30b17caeab, %r1, %r27
	setx  0x15354f902e9374c6, %r1, %r28
	setx  0xe280e80083bf03eb, %r1, %r29
	setx  0xda089f3020abf47e, %r1, %r30
	setx  0x7bcfb9d0bc63dc07, %r1, %r31
	setx  0x2547797ed27d2570, %r1, %r13
	setx  0xb000ff527d8d8a97, %r1, %r14
	setx  0xf2ac44b34a95c892, %r1, %r15
	setx  0x6c7d0f3a7f4adea0, %r1, %r16
	setx  0xe626b1e5f5e24a44, %r1, %r17
	setx  0x075c9e9bbc05d0cc, %r1, %r18
	setx  0x7e29676252fb94a0, %r1, %r19
	setx  0xab5964de48164ec0, %r1, %r20
	setx  0x367d41095e43c0be, %r1, %r21
	setx  0xa95fa457180e688d, %r1, %r22
	setx  0x1b2f197aa85f8368, %r1, %r23
	setx  0xaea5826252c8fbfc, %r1, %r24
	setx  0xb72e34ed479848b0, %r1, %r25
	setx  0x44d02635314bfd71, %r1, %r26
	setx  0x54cea11c1c669d05, %r1, %r27
	setx  0xd83841cdfed24c54, %r1, %r28
	setx  0x6aa32d0e64f69eb3, %r1, %r29
	setx  0x4c62a39fde1086a5, %r1, %r30
	setx  0x5fe7f10ace511051, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000d00, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xe0290005  ! 12: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe6710005  ! 12: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xd8312602  ! 12: STH_I	sth	%r12, [%r4 + 0x0602]
	.word 0xde210005  ! 12: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe4210005  ! 12: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xda31284a  ! 12: STH_I	sth	%r13, [%r4 + 0x084a]
	.word 0xf2212408  ! 12: STW_I	stw	%r25, [%r4 + 0x0408]
	.word 0xfc292d3c  ! 12: STB_I	stb	%r30, [%r4 + 0x0d3c]
	.word 0x26800001  ! 12: BL	bl,a	<label_0x1>
	.word 0xd6f0cce0  ! 12: STXA_R	stxa	%r11, [%r3 + %r0] 0x67
	.word 0xfa290005  ! 22: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe6290005  ! 22: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfc210005  ! 22: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xfc312704  ! 22: STH_I	sth	%r30, [%r4 + 0x0704]
	.word 0xd43127c6  ! 22: STH_I	sth	%r10, [%r4 + 0x07c6]
	.word 0xde292760  ! 22: STB_I	stb	%r15, [%r4 + 0x0760]
	.word 0xfc210005  ! 22: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xd43121d2  ! 22: STH_I	sth	%r10, [%r4 + 0x01d2]
	.word 0x26800001  ! 22: BL	bl,a	<label_0x1>
	.word 0xd6f04961  ! 22: STXA_R	stxa	%r11, [%r1 + %r1] 0x4b
	.word 0xe0290005  ! 32: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe4310005  ! 32: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xe6712e30  ! 32: STX_I	stx	%r19, [%r4 + 0x0e30]
	.word 0xfc310005  ! 32: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf2310005  ! 32: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd6712e78  ! 32: STX_I	stx	%r11, [%r4 + 0x0e78]
	.word 0xde31283c  ! 32: STH_I	sth	%r15, [%r4 + 0x083c]
	.word 0xf0210005  ! 32: STW_R	stw	%r24, [%r4 + %r5]
	.word 0x26c10001  ! 32: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xea3121f2  ! 32: STH_I	sth	%r21, [%r4 + 0x01f2]
	.word 0xe6290005  ! 41: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xda710005  ! 41: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xfc292364  ! 41: STB_I	stb	%r30, [%r4 + 0x0364]
	.word 0xea292765  ! 41: STB_I	stb	%r21, [%r4 + 0x0765]
	.word 0xfa712190  ! 41: STX_I	stx	%r29, [%r4 + 0x0190]
	.word 0xda290005  ! 41: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe221279c  ! 41: STW_I	stw	%r17, [%r4 + 0x079c]
	.word 0x0ec90001  ! 41: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xd6f0c961  ! 41: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xe6290005  ! 50: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe0712468  ! 50: STX_I	stx	%r16, [%r4 + 0x0468]
	.word 0xfc710005  ! 50: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xfe212574  ! 50: STW_I	stw	%r31, [%r4 + 0x0574]
	.word 0xde212a18  ! 50: STW_I	stw	%r15, [%r4 + 0x0a18]
	.word 0xf4710005  ! 50: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xec312432  ! 50: STH_I	sth	%r22, [%r4 + 0x0432]
	.word 0x04800001  ! 50: BLE	ble  	<label_0x1>
	.word 0xec712c68  ! 50: STX_I	stx	%r22, [%r4 + 0x0c68]
	.word 0xf8290005  ! 59: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xde292ace  ! 59: STB_I	stb	%r15, [%r4 + 0x0ace]
	.word 0xda710005  ! 59: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xe6290005  ! 59: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf2292383  ! 59: STB_I	stb	%r25, [%r4 + 0x0383]
	.word 0xde712a78  ! 59: STX_I	stx	%r15, [%r4 + 0x0a78]
	.word 0xd6712d40  ! 59: STX_I	stx	%r11, [%r4 + 0x0d40]
	.word 0x3e800001  ! 59: BVC	bvc,a	<label_0x1>
	.word 0xfcf91005  ! 59: SWAPA_R	swapa	%r30, [%r4 + %r5] 0x80
	.word 0xdc290005  ! 68: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf8710005  ! 68: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf2312c6c  ! 68: STH_I	sth	%r25, [%r4 + 0x0c6c]
	.word 0xd6312d10  ! 68: STH_I	sth	%r11, [%r4 + 0x0d10]
	.word 0xda292c4b  ! 68: STB_I	stb	%r13, [%r4 + 0x0c4b]
	.word 0xf0710005  ! 68: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xd4210005  ! 68: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x10800001  ! 68: BA	ba  	<label_0x1>
	.word 0xd8f08987  ! 68: STXA_R	stxa	%r12, [%r2 + %r7] 0x4c
	.word 0xf8290005  ! 77: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xee31220a  ! 77: STH_I	sth	%r23, [%r4 + 0x020a]
	.word 0xd6310005  ! 77: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xf6312d06  ! 77: STH_I	sth	%r27, [%r4 + 0x0d06]
	.word 0xe4312064  ! 77: STH_I	sth	%r18, [%r4 + 0x0064]
	.word 0xf6210005  ! 77: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf8290005  ! 77: STB_R	stb	%r28, [%r4 + %r5]
	.word 0x34800001  ! 77: BG	bg,a	<label_0x1>
	.word 0xd8f0c963  ! 77: STXA_R	stxa	%r12, [%r3 + %r3] 0x4b
	.word 0xd6290005  ! 86: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe6290005  ! 86: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd6312648  ! 86: STH_I	sth	%r11, [%r4 + 0x0648]
	.word 0xdc290005  ! 86: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd6712840  ! 86: STX_I	stx	%r11, [%r4 + 0x0840]
	.word 0xea290005  ! 86: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xea2127c4  ! 86: STW_I	stw	%r21, [%r4 + 0x07c4]
	.word 0x06c90001  ! 86: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xd8f18ce7  ! 86: STXA_R	stxa	%r12, [%r6 + %r7] 0x67
	.word 0xf0290005  ! 96: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfa29235d  ! 96: STB_I	stb	%r29, [%r4 + 0x035d]
	.word 0xdc290005  ! 96: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfc710005  ! 96: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xea3123d8  ! 96: STH_I	sth	%r21, [%r4 + 0x03d8]
	.word 0xd8290005  ! 96: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xdc212790  ! 96: STW_I	stw	%r14, [%r4 + 0x0790]
	.word 0xe8312150  ! 96: STH_I	sth	%r20, [%r4 + 0x0150]
	.word 0x18800001  ! 96: BGU	bgu  	<label_0x1>
	.word 0xf4b91005  ! 96: STDA_R	stda	%r26, [%r4 + %r5] 0x80
	.word 0xe0290005  ! 105: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xee210005  ! 105: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfe21299c  ! 105: STW_I	stw	%r31, [%r4 + 0x099c]
	.word 0xee310005  ! 105: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xee290005  ! 105: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe8310005  ! 105: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xe4290005  ! 105: STB_R	stb	%r18, [%r4 + %r5]
	.word 0x3c800003  ! 105: BPOS	bpos,a	<label_0x3>
	.word 0xd6f0c989  ! 105: STXA_R	stxa	%r11, [%r3 + %r9] 0x4c
	.word 0xf8290005  ! 114: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf6310005  ! 114: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xda310005  ! 114: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xe62120f0  ! 114: STW_I	stw	%r19, [%r4 + 0x00f0]
	.word 0xdc290005  ! 114: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf8210005  ! 114: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfc312c82  ! 114: STH_I	sth	%r30, [%r4 + 0x0c82]
	.word 0x06c10001  ! 114: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xe3210005  ! 114: STF_R	st	%f17, [%r5, %r4]
	.word 0xfa290005  ! 123: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xdc290005  ! 123: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd6710005  ! 123: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xe6290005  ! 123: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfc292627  ! 123: STB_I	stb	%r30, [%r4 + 0x0627]
	.word 0xde310005  ! 123: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xfe710005  ! 123: STX_R	stx	%r31, [%r4 + %r5]
	.word 0x1e800001  ! 123: BVC	bvc  	<label_0x1>
	.word 0xdd210005  ! 123: STF_R	st	%f14, [%r5, %r4]
	.word 0xd6290005  ! 133: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe8310005  ! 133: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xe4712130  ! 133: STX_I	stx	%r18, [%r4 + 0x0130]
	.word 0xe2290005  ! 133: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd6210005  ! 133: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xde310005  ! 133: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xf6712e40  ! 133: STX_I	stx	%r27, [%r4 + 0x0e40]
	.word 0xe6292b00  ! 133: STB_I	stb	%r19, [%r4 + 0x0b00]
	.word 0x2a800003  ! 133: BCS	bcs,a	<label_0x3>
	.word 0xf6b126b8  ! 133: STHA_I	stha	%r27, [%r4 + 0x06b8] %asi
	.word 0xe0290005  ! 143: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe2290005  ! 143: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf8292eff  ! 143: STB_I	stb	%r28, [%r4 + 0x0eff]
	.word 0xd4712aa8  ! 143: STX_I	stx	%r10, [%r4 + 0x0aa8]
	.word 0xdc210005  ! 143: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xf07124e8  ! 143: STX_I	stx	%r24, [%r4 + 0x04e8]
	.word 0xf621231c  ! 143: STW_I	stw	%r27, [%r4 + 0x031c]
	.word 0xfe212058  ! 143: STW_I	stw	%r31, [%r4 + 0x0058]
	.word 0x1e800001  ! 143: BVC	bvc  	<label_0x1>
	.word 0xd8f08982  ! 143: STXA_R	stxa	%r12, [%r2 + %r2] 0x4c
	.word 0xe0290005  ! 153: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfe710005  ! 153: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xfc2127b4  ! 153: STW_I	stw	%r30, [%r4 + 0x07b4]
	.word 0xd6710005  ! 153: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xf07128f0  ! 153: STX_I	stx	%r24, [%r4 + 0x08f0]
	.word 0xf2710005  ! 153: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xe0710005  ! 153: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xee712df8  ! 153: STX_I	stx	%r23, [%r4 + 0x0df8]
	.word 0x08800001  ! 153: BLEU	bleu  	<label_0x1>
	.word 0xd6f0cce3  ! 153: STXA_R	stxa	%r11, [%r3 + %r3] 0x67
	.word 0xd4290005  ! 162: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe03129b2  ! 162: STH_I	sth	%r16, [%r4 + 0x09b2]
	.word 0xe6710005  ! 162: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xf0310005  ! 162: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xfe2126f8  ! 162: STW_I	stw	%r31, [%r4 + 0x06f8]
	.word 0xd6310005  ! 162: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xee710005  ! 162: STX_R	stx	%r23, [%r4 + %r5]
	.word 0x04c90003  ! 162: BRLEZ	brlez  ,pt	%4,<label_0x90003>
	.word 0xe2f126b0  ! 162: STXA_I	stxa	%r17, [%r4 + 0x06b0] %asi
	.word 0xf8290005  ! 172: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf82124b4  ! 172: STW_I	stw	%r28, [%r4 + 0x04b4]
	.word 0xd4310005  ! 172: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xfa210005  ! 172: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xde710005  ! 172: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xd8312efc  ! 172: STH_I	sth	%r12, [%r4 + 0x0efc]
	.word 0xf821282c  ! 172: STW_I	stw	%r28, [%r4 + 0x082c]
	.word 0xda710005  ! 172: STX_R	stx	%r13, [%r4 + %r5]
	.word 0x3e800001  ! 172: BVC	bvc,a	<label_0x1>
	.word 0xfe212550  ! 172: STW_I	stw	%r31, [%r4 + 0x0550]
	.word 0xe0290005  ! 181: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf47129d0  ! 181: STX_I	stx	%r26, [%r4 + 0x09d0]
	.word 0xda212014  ! 181: STW_I	stw	%r13, [%r4 + 0x0014]
	.word 0xda7121e0  ! 181: STX_I	stx	%r13, [%r4 + 0x01e0]
	.word 0xfa210005  ! 181: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf4290005  ! 181: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xfa31201c  ! 181: STH_I	sth	%r29, [%r4 + 0x001c]
	.word 0x2ec90003  ! 181: BRGEZ	brgez,a,pt	%4,<label_0x90003>
	.word 0xed390005  ! 181: STDF_R	std	%f22, [%r5, %r4]
	.word 0xee290005  ! 190: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd8712540  ! 190: STX_I	stx	%r12, [%r4 + 0x0540]
	.word 0xda212f1c  ! 190: STW_I	stw	%r13, [%r4 + 0x0f1c]
	.word 0xfe2928b5  ! 190: STB_I	stb	%r31, [%r4 + 0x08b5]
	.word 0xde292f07  ! 190: STB_I	stb	%r15, [%r4 + 0x0f07]
	.word 0xf0710005  ! 190: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xee212fa0  ! 190: STW_I	stw	%r23, [%r4 + 0x0fa0]
	.word 0x26800003  ! 190: BL	bl,a	<label_0x3>
	.word 0xdfe11005  ! 190: CASA_I	casa	[%r4] 0x80, %r5, %r15
	.word 0xfe290005  ! 200: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfc29297f  ! 200: STB_I	stb	%r30, [%r4 + 0x097f]
	.word 0xde710005  ! 200: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xd8712e58  ! 200: STX_I	stx	%r12, [%r4 + 0x0e58]
	.word 0xfa210005  ! 200: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf2310005  ! 200: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xe2312f52  ! 200: STH_I	sth	%r17, [%r4 + 0x0f52]
	.word 0xe8312400  ! 200: STH_I	sth	%r20, [%r4 + 0x0400]
	.word 0x2ec10003  ! 200: BRGEZ	brgez,a,nt	%4,<label_0x10003>
	.word 0xd6f24988  ! 200: STXA_R	stxa	%r11, [%r9 + %r8] 0x4c
	.word 0xde290005  ! 209: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfa210005  ! 209: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe6712958  ! 209: STX_I	stx	%r19, [%r4 + 0x0958]
	.word 0xde212b78  ! 209: STW_I	stw	%r15, [%r4 + 0x0b78]
	.word 0xe6210005  ! 209: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xda2127c8  ! 209: STW_I	stw	%r13, [%r4 + 0x07c8]
	.word 0xfc310005  ! 209: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x02800001  ! 209: BE	be  	<label_0x1>
	.word 0xe8f11005  ! 209: STXA_R	stxa	%r20, [%r4 + %r5] 0x80
	.word 0xe2290005  ! 219: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe8312820  ! 219: STH_I	sth	%r20, [%r4 + 0x0820]
	.word 0xee210005  ! 219: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xd4712188  ! 219: STX_I	stx	%r10, [%r4 + 0x0188]
	.word 0xec290005  ! 219: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4290005  ! 219: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xde710005  ! 219: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xe6312df0  ! 219: STH_I	sth	%r19, [%r4 + 0x0df0]
	.word 0x04800001  ! 219: BLE	ble  	<label_0x1>
	.word 0xf0b12eea  ! 219: STHA_I	stha	%r24, [%r4 + 0x0eea] %asi
	.word 0xf2290005  ! 229: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfa292d55  ! 229: STB_I	stb	%r29, [%r4 + 0x0d55]
	.word 0xd8290005  ! 229: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xdc212ce0  ! 229: STW_I	stw	%r14, [%r4 + 0x0ce0]
	.word 0xd4712300  ! 229: STX_I	stx	%r10, [%r4 + 0x0300]
	.word 0xf8290005  ! 229: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xec290005  ! 229: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe2292cf1  ! 229: STB_I	stb	%r17, [%r4 + 0x0cf1]
	.word 0x28800001  ! 229: BLEU	bleu,a	<label_0x1>
	.word 0xd6f00ce2  ! 229: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xd4290005  ! 238: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe23127fe  ! 238: STH_I	sth	%r17, [%r4 + 0x07fe]
	.word 0xf2310005  ! 238: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xfa290005  ! 238: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd47120a0  ! 238: STX_I	stx	%r10, [%r4 + 0x00a0]
	.word 0xf0310005  ! 238: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xe2312af2  ! 238: STH_I	sth	%r17, [%r4 + 0x0af2]
	.word 0x0ac90001  ! 238: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xd6f1cce3  ! 238: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xe4290005  ! 247: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xda312540  ! 247: STH_I	sth	%r13, [%r4 + 0x0540]
	.word 0xda3125ce  ! 247: STH_I	sth	%r13, [%r4 + 0x05ce]
	.word 0xfc290005  ! 247: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xda710005  ! 247: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xd8212008  ! 247: STW_I	stw	%r12, [%r4 + 0x0008]
	.word 0xf0290005  ! 247: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x18800001  ! 247: BGU	bgu  	<label_0x1>
	.word 0xd8f1cce7  ! 247: STXA_R	stxa	%r12, [%r7 + %r7] 0x67
	.word 0xd4290005  ! 256: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xec210005  ! 256: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xdc312d26  ! 256: STH_I	sth	%r14, [%r4 + 0x0d26]
	.word 0xe8310005  ! 256: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xee31278e  ! 256: STH_I	sth	%r23, [%r4 + 0x078e]
	.word 0xfc212590  ! 256: STW_I	stw	%r30, [%r4 + 0x0590]
	.word 0xe4290005  ! 256: STB_R	stb	%r18, [%r4 + %r5]
	.word 0x04c90001  ! 256: BRLEZ	brlez  ,pt	%4,<label_0x90001>
	.word 0xd8f04962  ! 256: STXA_R	stxa	%r12, [%r1 + %r2] 0x4b
	.word 0xda290005  ! 266: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe43121d4  ! 266: STH_I	sth	%r18, [%r4 + 0x01d4]
	.word 0xd4310005  ! 266: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xdc710005  ! 266: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xdc210005  ! 266: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd629261a  ! 266: STB_I	stb	%r11, [%r4 + 0x061a]
	.word 0xe2212080  ! 266: STW_I	stw	%r17, [%r4 + 0x0080]
	.word 0xee310005  ! 266: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x12800001  ! 266: BNE	bne  	<label_0x1>
	.word 0xd8f08ce9  ! 266: STXA_R	stxa	%r12, [%r2 + %r9] 0x67
	.word 0xd4290005  ! 275: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xea292a1f  ! 275: STB_I	stb	%r21, [%r4 + 0x0a1f]
	.word 0xf6212480  ! 275: STW_I	stw	%r27, [%r4 + 0x0480]
	.word 0xe6290005  ! 275: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd8710005  ! 275: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xf4210005  ! 275: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xfc710005  ! 275: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x3a800001  ! 275: BCC	bcc,a	<label_0x1>
	.word 0xd6f08966  ! 275: STXA_R	stxa	%r11, [%r2 + %r6] 0x4b
	.word 0xd6290005  ! 284: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd6712d08  ! 284: STX_I	stx	%r11, [%r4 + 0x0d08]
	.word 0xf4212ca8  ! 284: STW_I	stw	%r26, [%r4 + 0x0ca8]
	.word 0xf8210005  ! 284: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfa310005  ! 284: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xe6292ad3  ! 284: STB_I	stb	%r19, [%r4 + 0x0ad3]
	.word 0xd8312a74  ! 284: STH_I	sth	%r12, [%r4 + 0x0a74]
	.word 0x38800003  ! 284: BGU	bgu,a	<label_0x3>
	.word 0xf3210005  ! 284: STF_R	st	%f25, [%r5, %r4]
	.word 0xec290005  ! 294: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd4712f58  ! 294: STX_I	stx	%r10, [%r4 + 0x0f58]
	.word 0xf6712fc0  ! 294: STX_I	stx	%r27, [%r4 + 0x0fc0]
	.word 0xf6310005  ! 294: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xd63124f0  ! 294: STH_I	sth	%r11, [%r4 + 0x04f0]
	.word 0xfe210005  ! 294: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xde292fbe  ! 294: STB_I	stb	%r15, [%r4 + 0x0fbe]
	.word 0xe6712d78  ! 294: STX_I	stx	%r19, [%r4 + 0x0d78]
	.word 0x00800001  ! 294: BN	bn  	<label_0x1>
	.word 0xd6f04981  ! 294: STXA_R	stxa	%r11, [%r1 + %r1] 0x4c
	.word 0xf2290005  ! 304: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf829238a  ! 304: STB_I	stb	%r28, [%r4 + 0x038a]
	.word 0xe63129f2  ! 304: STH_I	sth	%r19, [%r4 + 0x09f2]
	.word 0xd6212b94  ! 304: STW_I	stw	%r11, [%r4 + 0x0b94]
	.word 0xe0210005  ! 304: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xe4292e8e  ! 304: STB_I	stb	%r18, [%r4 + 0x0e8e]
	.word 0xf2712250  ! 304: STX_I	stx	%r25, [%r4 + 0x0250]
	.word 0xee290005  ! 304: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x0e800001  ! 304: BVS	bvs  	<label_0x1>
	.word 0xeea91005  ! 304: STBA_R	stba	%r23, [%r4 + %r5] 0x80
	.word 0xd4290005  ! 314: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xd8312e56  ! 314: STH_I	sth	%r12, [%r4 + 0x0e56]
	.word 0xe8212f60  ! 314: STW_I	stw	%r20, [%r4 + 0x0f60]
	.word 0xea290005  ! 314: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe8210005  ! 314: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xdc212b48  ! 314: STW_I	stw	%r14, [%r4 + 0x0b48]
	.word 0xe67125d0  ! 314: STX_I	stx	%r19, [%r4 + 0x05d0]
	.word 0xfe712980  ! 314: STX_I	stx	%r31, [%r4 + 0x0980]
	.word 0x2c800001  ! 314: BNEG	bneg,a	<label_0x1>
	.word 0xf0a91005  ! 314: STBA_R	stba	%r24, [%r4 + %r5] 0x80
	.word 0xf0290005  ! 323: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf8290005  ! 323: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xde290005  ! 323: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xda710005  ! 323: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf82923ce  ! 323: STB_I	stb	%r28, [%r4 + 0x03ce]
	.word 0xee310005  ! 323: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xdc290005  ! 323: STB_R	stb	%r14, [%r4 + %r5]
	.word 0x24800001  ! 323: BLE	ble,a	<label_0x1>
	.word 0xd6f24ce2  ! 323: STXA_R	stxa	%r11, [%r9 + %r2] 0x67
	.word 0xf0290005  ! 333: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd8710005  ! 333: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xea21201c  ! 333: STW_I	stw	%r21, [%r4 + 0x001c]
	.word 0xde7124b8  ! 333: STX_I	stx	%r15, [%r4 + 0x04b8]
	.word 0xfa210005  ! 333: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf8312e68  ! 333: STH_I	sth	%r28, [%r4 + 0x0e68]
	.word 0xfc290005  ! 333: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xec712010  ! 333: STX_I	stx	%r22, [%r4 + 0x0010]
	.word 0x1a800003  ! 333: BCC	bcc  	<label_0x3>
	.word 0xd7e12005  ! 333: CASA_R	casa	[%r4] %asi, %r5, %r11
	.word 0xde290005  ! 343: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xec312d9a  ! 343: STH_I	sth	%r22, [%r4 + 0x0d9a]
	.word 0xf0290005  ! 343: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfe3124ca  ! 343: STH_I	sth	%r31, [%r4 + 0x04ca]
	.word 0xea312f48  ! 343: STH_I	sth	%r21, [%r4 + 0x0f48]
	.word 0xda310005  ! 343: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xfa710005  ! 343: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xd4312fe0  ! 343: STH_I	sth	%r10, [%r4 + 0x0fe0]
	.word 0x20800003  ! 343: BN	bn,a	<label_0x3>
	.word 0xd6f04960  ! 343: STXA_R	stxa	%r11, [%r1 + %r0] 0x4b
	.word 0xfc290005  ! 352: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe8290005  ! 352: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe2712190  ! 352: STX_I	stx	%r17, [%r4 + 0x0190]
	.word 0xfa210005  ! 352: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe2710005  ! 352: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xea312c5c  ! 352: STH_I	sth	%r21, [%r4 + 0x0c5c]
	.word 0xfa290005  ! 352: STB_R	stb	%r29, [%r4 + %r5]
	.word 0x30800001  ! 352: BA	ba,a	<label_0x1>
	.word 0xd8f04ce2  ! 352: STXA_R	stxa	%r12, [%r1 + %r2] 0x67
	.word 0xd6290005  ! 362: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfa710005  ! 362: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xec310005  ! 362: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xde212ad8  ! 362: STW_I	stw	%r15, [%r4 + 0x0ad8]
	.word 0xda290005  ! 362: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe2212ae0  ! 362: STW_I	stw	%r17, [%r4 + 0x0ae0]
	.word 0xfc7121a0  ! 362: STX_I	stx	%r30, [%r4 + 0x01a0]
	.word 0xe6710005  ! 362: STX_R	stx	%r19, [%r4 + %r5]
	.word 0x0c800001  ! 362: BNEG	bneg  	<label_0x1>
	.word 0xd6f00ce1  ! 362: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xfc290005  ! 372: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfc212910  ! 372: STW_I	stw	%r30, [%r4 + 0x0910]
	.word 0xfe710005  ! 372: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xf2290005  ! 372: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe2710005  ! 372: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe8312e82  ! 372: STH_I	sth	%r20, [%r4 + 0x0e82]
	.word 0xf6292f8e  ! 372: STB_I	stb	%r27, [%r4 + 0x0f8e]
	.word 0xe6210005  ! 372: STW_R	stw	%r19, [%r4 + %r5]
	.word 0x3c800001  ! 372: BPOS	bpos,a	<label_0x1>
	.word 0xd6f18962  ! 372: STXA_R	stxa	%r11, [%r6 + %r2] 0x4b
	.word 0xf4290005  ! 382: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd8310005  ! 382: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe4712d30  ! 382: STX_I	stx	%r18, [%r4 + 0x0d30]
	.word 0xd4290005  ! 382: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xde2127c4  ! 382: STW_I	stw	%r15, [%r4 + 0x07c4]
	.word 0xec2922f8  ! 382: STB_I	stb	%r22, [%r4 + 0x02f8]
	.word 0xfa710005  ! 382: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xea212fb8  ! 382: STW_I	stw	%r21, [%r4 + 0x0fb8]
	.word 0x2e800003  ! 382: BVS	bvs,a	<label_0x3>
	.word 0xd8f20981  ! 382: STXA_R	stxa	%r12, [%r8 + %r1] 0x4c
	.word 0xee290005  ! 392: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe4292ba2  ! 392: STB_I	stb	%r18, [%r4 + 0x0ba2]
	.word 0xde310005  ! 392: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xfe2926ea  ! 392: STB_I	stb	%r31, [%r4 + 0x06ea]
	.word 0xde29243b  ! 392: STB_I	stb	%r15, [%r4 + 0x043b]
	.word 0xd8290005  ! 392: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xde212328  ! 392: STW_I	stw	%r15, [%r4 + 0x0328]
	.word 0xde212b48  ! 392: STW_I	stw	%r15, [%r4 + 0x0b48]
	.word 0x24c10001  ! 392: BRLEZ	brlez,a,nt	%4,<label_0x10001>
	.word 0xd8f18ce2  ! 392: STXA_R	stxa	%r12, [%r6 + %r2] 0x67
	.word 0xde290005  ! 402: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xde710005  ! 402: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xd6710005  ! 402: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xf6290005  ! 402: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf6212604  ! 402: STW_I	stw	%r27, [%r4 + 0x0604]
	.word 0xe0292879  ! 402: STB_I	stb	%r16, [%r4 + 0x0879]
	.word 0xf62929d3  ! 402: STB_I	stb	%r27, [%r4 + 0x09d3]
	.word 0xe6210005  ! 402: STW_R	stw	%r19, [%r4 + %r5]
	.word 0x40000001  ! 402: CALL	call	disp30_1
	.word 0xd6f08963  ! 402: STXA_R	stxa	%r11, [%r2 + %r3] 0x4b
	.word 0xfc290005  ! 412: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xec290005  ! 412: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xea290005  ! 412: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe2292f8f  ! 412: STB_I	stb	%r17, [%r4 + 0x0f8f]
	.word 0xec292a26  ! 412: STB_I	stb	%r22, [%r4 + 0x0a26]
	.word 0xda310005  ! 412: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xfe290005  ! 412: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xd8292830  ! 412: STB_I	stb	%r12, [%r4 + 0x0830]
	.word 0x2a800001  ! 412: BCS	bcs,a	<label_0x1>
	.word 0xd6f18ce0  ! 412: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xde290005  ! 421: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd4312c38  ! 421: STH_I	sth	%r10, [%r4 + 0x0c38]
	.word 0xe4210005  ! 421: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xea310005  ! 421: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xe0312de6  ! 421: STH_I	sth	%r16, [%r4 + 0x0de6]
	.word 0xf2290005  ! 421: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe4310005  ! 421: STH_R	sth	%r18, [%r4 + %r5]
	.word 0x22c90001  ! 421: BRZ	brz,a,pt	%4,<label_0x90001>
	.word 0xd8f0cce2  ! 421: STXA_R	stxa	%r12, [%r3 + %r2] 0x67
	.word 0xfc290005  ! 430: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd82929e3  ! 430: STB_I	stb	%r12, [%r4 + 0x09e3]
	.word 0xfe7127c0  ! 430: STX_I	stx	%r31, [%r4 + 0x07c0]
	.word 0xe8312a30  ! 430: STH_I	sth	%r20, [%r4 + 0x0a30]
	.word 0xec210005  ! 430: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xf431271e  ! 430: STH_I	sth	%r26, [%r4 + 0x071e]
	.word 0xe231264e  ! 430: STH_I	sth	%r17, [%r4 + 0x064e]
	.word 0x26800001  ! 430: BL	bl,a	<label_0x1>
	.word 0xe079249c  ! 430: SWAP_I	swap	%r16, [%r4 + 0x049c]
	.word 0xec290005  ! 440: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfe710005  ! 440: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xf0210005  ! 440: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xfe210005  ! 440: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xd67127d8  ! 440: STX_I	stx	%r11, [%r4 + 0x07d8]
	.word 0xe8710005  ! 440: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xee712318  ! 440: STX_I	stx	%r23, [%r4 + 0x0318]
	.word 0xe4712d60  ! 440: STX_I	stx	%r18, [%r4 + 0x0d60]
	.word 0x10800001  ! 440: BA	ba  	<label_0x1>
	.word 0xd6f0cce6  ! 440: STXA_R	stxa	%r11, [%r3 + %r6] 0x67
	.word 0xda290005  ! 450: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd67127a0  ! 450: STX_I	stx	%r11, [%r4 + 0x07a0]
	.word 0xd6712010  ! 450: STX_I	stx	%r11, [%r4 + 0x0010]
	.word 0xf6712f78  ! 450: STX_I	stx	%r27, [%r4 + 0x0f78]
	.word 0xee210005  ! 450: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xe0312d44  ! 450: STH_I	sth	%r16, [%r4 + 0x0d44]
	.word 0xf82122c0  ! 450: STW_I	stw	%r28, [%r4 + 0x02c0]
	.word 0xe2290005  ! 450: STB_R	stb	%r17, [%r4 + %r5]
	.word 0x06c90003  ! 450: BRLZ	brlz  ,pt	%4,<label_0x90003>
	.word 0xd6f04961  ! 450: STXA_R	stxa	%r11, [%r1 + %r1] 0x4b
	.word 0xea290005  ! 459: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf6212c4c  ! 459: STW_I	stw	%r27, [%r4 + 0x0c4c]
	.word 0xf0310005  ! 459: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xe2710005  ! 459: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xd6290005  ! 459: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfe290005  ! 459: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xec310005  ! 459: STH_R	sth	%r22, [%r4 + %r5]
	.word 0x1e800001  ! 459: BVC	bvc  	<label_0x1>
	.word 0xd6f0c980  ! 459: STXA_R	stxa	%r11, [%r3 + %r0] 0x4c
	.word 0xd6290005  ! 468: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf8210005  ! 468: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf4210005  ! 468: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xee210005  ! 468: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xf23128d4  ! 468: STH_I	sth	%r25, [%r4 + 0x08d4]
	.word 0xd4310005  ! 468: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xec212ab8  ! 468: STW_I	stw	%r22, [%r4 + 0x0ab8]
	.word 0x18800003  ! 468: BGU	bgu  	<label_0x3>
	.word 0xf2312994  ! 468: STH_I	sth	%r25, [%r4 + 0x0994]
	.word 0xfe290005  ! 478: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe8210005  ! 478: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe4710005  ! 478: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe4710005  ! 478: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfc312580  ! 478: STH_I	sth	%r30, [%r4 + 0x0580]
	.word 0xea212e5c  ! 478: STW_I	stw	%r21, [%r4 + 0x0e5c]
	.word 0xfc210005  ! 478: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xfc310005  ! 478: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x26c10001  ! 478: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xd6f04982  ! 478: STXA_R	stxa	%r11, [%r1 + %r2] 0x4c
	.word 0xe0290005  ! 488: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf03120f0  ! 488: STH_I	sth	%r24, [%r4 + 0x00f0]
	.word 0xd421202c  ! 488: STW_I	stw	%r10, [%r4 + 0x002c]
	.word 0xd8312632  ! 488: STH_I	sth	%r12, [%r4 + 0x0632]
	.word 0xea290005  ! 488: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe2310005  ! 488: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xde292fe3  ! 488: STB_I	stb	%r15, [%r4 + 0x0fe3]
	.word 0xee290005  ! 488: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x04c10003  ! 488: BRLEZ	brlez  ,nt	%4,<label_0x10003>
	.word 0xd6f04ce1  ! 488: STXA_R	stxa	%r11, [%r1 + %r1] 0x67
	.word 0xf2290005  ! 497: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf4210005  ! 497: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xe03129f4  ! 497: STH_I	sth	%r16, [%r4 + 0x09f4]
	.word 0xf67124a0  ! 497: STX_I	stx	%r27, [%r4 + 0x04a0]
	.word 0xfa290005  ! 497: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe22925fa  ! 497: STB_I	stb	%r17, [%r4 + 0x05fa]
	.word 0xe6710005  ! 497: STX_R	stx	%r19, [%r4 + %r5]
	.word 0x22c10001  ! 497: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xd6f18ce6  ! 497: STXA_R	stxa	%r11, [%r6 + %r6] 0x67
	.word 0xe6290005  ! 507: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe831245e  ! 507: STH_I	sth	%r20, [%r4 + 0x045e]
	.word 0xe47120e0  ! 507: STX_I	stx	%r18, [%r4 + 0x00e0]
	.word 0xe8290005  ! 507: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xdc212b50  ! 507: STW_I	stw	%r14, [%r4 + 0x0b50]
	.word 0xf8292e8a  ! 507: STB_I	stb	%r28, [%r4 + 0x0e8a]
	.word 0xd8310005  ! 507: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xde290005  ! 507: STB_R	stb	%r15, [%r4 + %r5]
	.word 0x1c800001  ! 507: BPOS	bpos  	<label_0x1>
	.word 0xd6f1cce3  ! 507: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xe2290005  ! 516: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd8210005  ! 516: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xf4292234  ! 516: STB_I	stb	%r26, [%r4 + 0x0234]
	.word 0xd631265a  ! 516: STH_I	sth	%r11, [%r4 + 0x065a]
	.word 0xf4712d78  ! 516: STX_I	stx	%r26, [%r4 + 0x0d78]
	.word 0xee310005  ! 516: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf4712440  ! 516: STX_I	stx	%r26, [%r4 + 0x0440]
	.word 0x2e800003  ! 516: BVS	bvs,a	<label_0x3>
	.word 0xd6f0cce9  ! 516: STXA_R	stxa	%r11, [%r3 + %r9] 0x67
	.word 0xec290005  ! 525: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfa290005  ! 525: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfc310005  ! 525: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf6212058  ! 525: STW_I	stw	%r27, [%r4 + 0x0058]
	.word 0xf4312484  ! 525: STH_I	sth	%r26, [%r4 + 0x0484]
	.word 0xfa312722  ! 525: STH_I	sth	%r29, [%r4 + 0x0722]
	.word 0xd4210005  ! 525: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x14800001  ! 525: BG	bg  	<label_0x1>
	.word 0xd6f1c961  ! 525: STXA_R	stxa	%r11, [%r7 + %r1] 0x4b
	.word 0xde290005  ! 534: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xda210005  ! 534: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xe6290005  ! 534: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe6710005  ! 534: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xee712548  ! 534: STX_I	stx	%r23, [%r4 + 0x0548]
	.word 0xec7124e0  ! 534: STX_I	stx	%r22, [%r4 + 0x04e0]
	.word 0xe4310005  ! 534: STH_R	sth	%r18, [%r4 + %r5]
	.word 0x2ec90001  ! 534: BRGEZ	brgez,a,pt	%4,<label_0x90001>
	.word 0xd6f00961  ! 534: STXA_R	stxa	%r11, [%r0 + %r1] 0x4b
	.word 0xf6290005  ! 543: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe0210005  ! 543: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xe8292880  ! 543: STB_I	stb	%r20, [%r4 + 0x0880]
	.word 0xf4310005  ! 543: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xda310005  ! 543: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xde712d38  ! 543: STX_I	stx	%r15, [%r4 + 0x0d38]
	.word 0xde312eee  ! 543: STH_I	sth	%r15, [%r4 + 0x0eee]
	.word 0x10800001  ! 543: BA	ba  	<label_0x1>
	.word 0xf2292999  ! 543: STB_I	stb	%r25, [%r4 + 0x0999]
	.word 0xea290005  ! 553: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xfa290005  ! 553: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfc2929d8  ! 553: STB_I	stb	%r30, [%r4 + 0x09d8]
	.word 0xe4710005  ! 553: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfa310005  ! 553: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xd421264c  ! 553: STW_I	stw	%r10, [%r4 + 0x064c]
	.word 0xfe212194  ! 553: STW_I	stw	%r31, [%r4 + 0x0194]
	.word 0xd4210005  ! 553: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x24c10001  ! 553: BRLEZ	brlez,a,nt	%4,<label_0x10001>
	.word 0xe8f92a58  ! 553: SWAPA_I	swapa	%r20, [%r4 + 0x0a58] %asi
	.word 0xea290005  ! 563: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf8710005  ! 563: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xfa212178  ! 563: STW_I	stw	%r29, [%r4 + 0x0178]
	.word 0xd47125c0  ! 563: STX_I	stx	%r10, [%r4 + 0x05c0]
	.word 0xe4210005  ! 563: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfc710005  ! 563: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe0290005  ! 563: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf0710005  ! 563: STX_R	stx	%r24, [%r4 + %r5]
	.word 0x38800003  ! 563: BGU	bgu,a	<label_0x3>
	.word 0xe8210005  ! 563: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe2290005  ! 572: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe2710005  ! 572: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xee712a20  ! 572: STX_I	stx	%r23, [%r4 + 0x0a20]
	.word 0xd829218e  ! 572: STB_I	stb	%r12, [%r4 + 0x018e]
	.word 0xe4292203  ! 572: STB_I	stb	%r18, [%r4 + 0x0203]
	.word 0xda710005  ! 572: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xea292af9  ! 572: STB_I	stb	%r21, [%r4 + 0x0af9]
	.word 0x12800001  ! 572: BNE	bne  	<label_0x1>
	.word 0xd5392a28  ! 572: STDF_I	std	%f10, [0x0a28, %r4]
	.word 0xf6290005  ! 582: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xd4290005  ! 582: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xda7122d8  ! 582: STX_I	stx	%r13, [%r4 + 0x02d8]
	.word 0xe4712950  ! 582: STX_I	stx	%r18, [%r4 + 0x0950]
	.word 0xea21206c  ! 582: STW_I	stw	%r21, [%r4 + 0x006c]
	.word 0xd63123a8  ! 582: STH_I	sth	%r11, [%r4 + 0x03a8]
	.word 0xea710005  ! 582: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xe6712750  ! 582: STX_I	stx	%r19, [%r4 + 0x0750]
	.word 0x1c800001  ! 582: BPOS	bpos  	<label_0x1>
	.word 0xd8f04ce8  ! 582: STXA_R	stxa	%r12, [%r1 + %r8] 0x67
	.word 0xf0290005  ! 591: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xee710005  ! 591: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xd6312c04  ! 591: STH_I	sth	%r11, [%r4 + 0x0c04]
	.word 0xda210005  ! 591: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xec712df0  ! 591: STX_I	stx	%r22, [%r4 + 0x0df0]
	.word 0xfa712d48  ! 591: STX_I	stx	%r29, [%r4 + 0x0d48]
	.word 0xf0710005  ! 591: STX_R	stx	%r24, [%r4 + %r5]
	.word 0x02800001  ! 591: BE	be  	<label_0x1>
	.word 0xdfe11005  ! 591: CASA_I	casa	[%r4] 0x80, %r5, %r15
	.word 0xf8290005  ! 600: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe6712a70  ! 600: STX_I	stx	%r19, [%r4 + 0x0a70]
	.word 0xe4712608  ! 600: STX_I	stx	%r18, [%r4 + 0x0608]
	.word 0xe0210005  ! 600: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfe712f20  ! 600: STX_I	stx	%r31, [%r4 + 0x0f20]
	.word 0xd4312ee4  ! 600: STH_I	sth	%r10, [%r4 + 0x0ee4]
	.word 0xf4712fe0  ! 600: STX_I	stx	%r26, [%r4 + 0x0fe0]
	.word 0x26800003  ! 600: BL	bl,a	<label_0x3>
	.word 0xd8f04ce0  ! 600: STXA_R	stxa	%r12, [%r1 + %r0] 0x67
	.word 0xf4290005  ! 609: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf2290005  ! 609: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfc7121a0  ! 609: STX_I	stx	%r30, [%r4 + 0x01a0]
	.word 0xd6310005  ! 609: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe4712118  ! 609: STX_I	stx	%r18, [%r4 + 0x0118]
	.word 0xf8210005  ! 609: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xd4310005  ! 609: STH_R	sth	%r10, [%r4 + %r5]
	.word 0x0e800003  ! 609: BVS	bvs  	<label_0x3>
	.word 0xd6f24ce0  ! 609: STXA_R	stxa	%r11, [%r9 + %r0] 0x67
	.word 0xd4290005  ! 619: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf8290005  ! 619: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe4210005  ! 619: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xd6210005  ! 619: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xd621251c  ! 619: STW_I	stw	%r11, [%r4 + 0x051c]
	.word 0xde712968  ! 619: STX_I	stx	%r15, [%r4 + 0x0968]
	.word 0xfe292336  ! 619: STB_I	stb	%r31, [%r4 + 0x0336]
	.word 0xd8310005  ! 619: STH_R	sth	%r12, [%r4 + %r5]
	.word 0x1e800003  ! 619: BVC	bvc  	<label_0x3>
	.word 0xd6f04ce9  ! 619: STXA_R	stxa	%r11, [%r1 + %r9] 0x67
	.word 0xfc290005  ! 628: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xdc712cf0  ! 628: STX_I	stx	%r14, [%r4 + 0x0cf0]
	.word 0xfa710005  ! 628: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xea312bf2  ! 628: STH_I	sth	%r21, [%r4 + 0x0bf2]
	.word 0xe2310005  ! 628: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xe8310005  ! 628: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf4310005  ! 628: STH_R	sth	%r26, [%r4 + %r5]
	.word 0x00800001  ! 628: BN	bn  	<label_0x1>
	.word 0xd7f11005  ! 628: CASXA_I	casxa	[%r4] 0x80, %r5, %r11
	.word 0xee290005  ! 638: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe8310005  ! 638: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xda2925cb  ! 638: STB_I	stb	%r13, [%r4 + 0x05cb]
	.word 0xdc212a20  ! 638: STW_I	stw	%r14, [%r4 + 0x0a20]
	.word 0xfe210005  ! 638: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xf62127e0  ! 638: STW_I	stw	%r27, [%r4 + 0x07e0]
	.word 0xee310005  ! 638: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xec210005  ! 638: STW_R	stw	%r22, [%r4 + %r5]
	.word 0x2c800003  ! 638: BNEG	bneg,a	<label_0x3>
	.word 0xfc7923a4  ! 638: SWAP_I	swap	%r30, [%r4 + 0x03a4]
	.word 0xf2290005  ! 648: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf2712a30  ! 648: STX_I	stx	%r25, [%r4 + 0x0a30]
	.word 0xf231207a  ! 648: STH_I	sth	%r25, [%r4 + 0x007a]
	.word 0xdc710005  ! 648: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xde29232d  ! 648: STB_I	stb	%r15, [%r4 + 0x032d]
	.word 0xfa290005  ! 648: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfa290005  ! 648: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd4292bdf  ! 648: STB_I	stb	%r10, [%r4 + 0x0bdf]
	.word 0x26c10001  ! 648: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xd8f24ce1  ! 648: STXA_R	stxa	%r12, [%r9 + %r1] 0x67
	.word 0xea290005  ! 658: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xfa710005  ! 658: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xf6210005  ! 658: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xee710005  ! 658: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf87120e0  ! 658: STX_I	stx	%r28, [%r4 + 0x00e0]
	.word 0xf62125a4  ! 658: STW_I	stw	%r27, [%r4 + 0x05a4]
	.word 0xfe210005  ! 658: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xdc7127b8  ! 658: STX_I	stx	%r14, [%r4 + 0x07b8]
	.word 0x04800001  ! 658: BLE	ble  	<label_0x1>
	.word 0xd6f08ce3  ! 658: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xe2290005  ! 668: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfa210005  ! 668: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd6312ce8  ! 668: STH_I	sth	%r11, [%r4 + 0x0ce8]
	.word 0xe0710005  ! 668: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xea292513  ! 668: STB_I	stb	%r21, [%r4 + 0x0513]
	.word 0xe62925a7  ! 668: STB_I	stb	%r19, [%r4 + 0x05a7]
	.word 0xe6290005  ! 668: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfc3121dc  ! 668: STH_I	sth	%r30, [%r4 + 0x01dc]
	.word 0x0cc90003  ! 668: BRGZ	brgz  ,pt	%4,<label_0x90003>
	.word 0xd6f24ce0  ! 668: STXA_R	stxa	%r11, [%r9 + %r0] 0x67
	.word 0xec290005  ! 678: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf2210005  ! 678: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xea290005  ! 678: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xea3122da  ! 678: STH_I	sth	%r21, [%r4 + 0x02da]
	.word 0xf0312194  ! 678: STH_I	sth	%r24, [%r4 + 0x0194]
	.word 0xf0212fb4  ! 678: STW_I	stw	%r24, [%r4 + 0x0fb4]
	.word 0xf2210005  ! 678: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xdc710005  ! 678: STX_R	stx	%r14, [%r4 + %r5]
	.word 0x2ac90001  ! 678: BRNZ	brnz,a,pt	%4,<label_0x90001>
	.word 0xf7390005  ! 678: STDF_R	std	%f27, [%r5, %r4]
	.word 0xe8290005  ! 687: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd8212b7c  ! 687: STW_I	stw	%r12, [%r4 + 0x0b7c]
	.word 0xf6712110  ! 687: STX_I	stx	%r27, [%r4 + 0x0110]
	.word 0xea312986  ! 687: STH_I	sth	%r21, [%r4 + 0x0986]
	.word 0xfa712b98  ! 687: STX_I	stx	%r29, [%r4 + 0x0b98]
	.word 0xfc290005  ! 687: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf6290005  ! 687: STB_R	stb	%r27, [%r4 + %r5]
	.word 0x0ec90001  ! 687: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xfd212d3c  ! 687: STF_I	st	%f30, [0x0d3c, %r4]
	.word 0xf2290005  ! 697: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xec212828  ! 697: STW_I	stw	%r22, [%r4 + 0x0828]
	.word 0xf02122a8  ! 697: STW_I	stw	%r24, [%r4 + 0x02a8]
	.word 0xf43126a4  ! 697: STH_I	sth	%r26, [%r4 + 0x06a4]
	.word 0xec212e94  ! 697: STW_I	stw	%r22, [%r4 + 0x0e94]
	.word 0xd6712148  ! 697: STX_I	stx	%r11, [%r4 + 0x0148]
	.word 0xe629237e  ! 697: STB_I	stb	%r19, [%r4 + 0x037e]
	.word 0xe8210005  ! 697: STW_R	stw	%r20, [%r4 + %r5]
	.word 0x04800003  ! 697: BLE	ble  	<label_0x3>
	.word 0xd6f24962  ! 697: STXA_R	stxa	%r11, [%r9 + %r2] 0x4b
	.word 0xd6290005  ! 707: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfa710005  ! 707: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xea2928c6  ! 707: STB_I	stb	%r21, [%r4 + 0x08c6]
	.word 0xd6290005  ! 707: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xee290005  ! 707: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe6290005  ! 707: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xdc712af8  ! 707: STX_I	stx	%r14, [%r4 + 0x0af8]
	.word 0xfc292f56  ! 707: STB_I	stb	%r30, [%r4 + 0x0f56]
	.word 0x0ac10001  ! 707: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xd6f08ce7  ! 707: STXA_R	stxa	%r11, [%r2 + %r7] 0x67
	.word 0xf2290005  ! 717: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd62128f4  ! 717: STW_I	stw	%r11, [%r4 + 0x08f4]
	.word 0xe2710005  ! 717: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xd6710005  ! 717: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xd8292b1c  ! 717: STB_I	stb	%r12, [%r4 + 0x0b1c]
	.word 0xe8292a31  ! 717: STB_I	stb	%r20, [%r4 + 0x0a31]
	.word 0xd8310005  ! 717: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe8290005  ! 717: STB_R	stb	%r20, [%r4 + %r5]
	.word 0x40000003  ! 717: CALL	call	disp30_3
	.word 0xfb392c00  ! 717: STDF_I	std	%f29, [0x0c00, %r4]
	.word 0xd8290005  ! 726: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf27123d8  ! 726: STX_I	stx	%r25, [%r4 + 0x03d8]
	.word 0xf2710005  ! 726: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xee21239c  ! 726: STW_I	stw	%r23, [%r4 + 0x039c]
	.word 0xfc7129f0  ! 726: STX_I	stx	%r30, [%r4 + 0x09f0]
	.word 0xde310005  ! 726: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xe83120da  ! 726: STH_I	sth	%r20, [%r4 + 0x00da]
	.word 0x2e800001  ! 726: BVS	bvs,a	<label_0x1>
	.word 0xd8f08980  ! 726: STXA_R	stxa	%r12, [%r2 + %r0] 0x4c
	.word 0xf0290005  ! 736: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfe710005  ! 736: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xde290005  ! 736: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe8292914  ! 736: STB_I	stb	%r20, [%r4 + 0x0914]
	.word 0xe231267e  ! 736: STH_I	sth	%r17, [%r4 + 0x067e]
	.word 0xf0710005  ! 736: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xd6710005  ! 736: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xfa710005  ! 736: STX_R	stx	%r29, [%r4 + %r5]
	.word 0x10800001  ! 736: BA	ba  	<label_0x1>
	.word 0xef210005  ! 736: STF_R	st	%f23, [%r5, %r4]
	.word 0xda290005  ! 745: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa210005  ! 745: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe4210005  ! 745: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xde210005  ! 745: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xf82124d8  ! 745: STW_I	stw	%r28, [%r4 + 0x04d8]
	.word 0xfa312b14  ! 745: STH_I	sth	%r29, [%r4 + 0x0b14]
	.word 0xf8290005  ! 745: STB_R	stb	%r28, [%r4 + %r5]
	.word 0x10800001  ! 745: BA	ba  	<label_0x1>
	.word 0xd6f04ce3  ! 745: STXA_R	stxa	%r11, [%r1 + %r3] 0x67
	.word 0xe0290005  ! 754: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf6710005  ! 754: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xee310005  ! 754: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xe0290005  ! 754: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf4292508  ! 754: STB_I	stb	%r26, [%r4 + 0x0508]
	.word 0xda292b9b  ! 754: STB_I	stb	%r13, [%r4 + 0x0b9b]
	.word 0xe6212728  ! 754: STW_I	stw	%r19, [%r4 + 0x0728]
	.word 0x40000001  ! 754: CALL	call	disp30_1
	.word 0xe6e92752  ! 754: LDSTUBA_I	ldstuba	%r19, [%r4 + 0x0752] %asi
	.word 0xf8290005  ! 763: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xde290005  ! 763: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc292723  ! 763: STB_I	stb	%r30, [%r4 + 0x0723]
	.word 0xea712888  ! 763: STX_I	stx	%r21, [%r4 + 0x0888]
	.word 0xdc310005  ! 763: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xee3120ce  ! 763: STH_I	sth	%r23, [%r4 + 0x00ce]
	.word 0xf6310005  ! 763: STH_R	sth	%r27, [%r4 + %r5]
	.word 0x2ec10003  ! 763: BRGEZ	brgez,a,nt	%4,<label_0x10003>
	.word 0xd6f1c967  ! 763: STXA_R	stxa	%r11, [%r7 + %r7] 0x4b
	.word 0xd8290005  ! 772: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xd8212e14  ! 772: STW_I	stw	%r12, [%r4 + 0x0e14]
	.word 0xd82920f1  ! 772: STB_I	stb	%r12, [%r4 + 0x00f1]
	.word 0xde2928a8  ! 772: STB_I	stb	%r15, [%r4 + 0x08a8]
	.word 0xe0710005  ! 772: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd4310005  ! 772: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf02922f3  ! 772: STB_I	stb	%r24, [%r4 + 0x02f3]
	.word 0x20800003  ! 772: BN	bn,a	<label_0x3>
	.word 0xf8f11005  ! 772: STXA_R	stxa	%r28, [%r4 + %r5] 0x80
	.word 0xf2290005  ! 782: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf0210005  ! 782: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xfc710005  ! 782: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xfa290005  ! 782: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf6212f28  ! 782: STW_I	stw	%r27, [%r4 + 0x0f28]
	.word 0xfc712468  ! 782: STX_I	stx	%r30, [%r4 + 0x0468]
	.word 0xfc312490  ! 782: STH_I	sth	%r30, [%r4 + 0x0490]
	.word 0xd6210005  ! 782: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x10800001  ! 782: BA	ba  	<label_0x1>
	.word 0xd6f0cce9  ! 782: STXA_R	stxa	%r11, [%r3 + %r9] 0x67
	.word 0xe2290005  ! 791: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd6290005  ! 791: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xee310005  ! 791: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xfe210005  ! 791: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xf0712010  ! 791: STX_I	stx	%r24, [%r4 + 0x0010]
	.word 0xd42129d0  ! 791: STW_I	stw	%r10, [%r4 + 0x09d0]
	.word 0xfc290005  ! 791: STB_R	stb	%r30, [%r4 + %r5]
	.word 0x02c10001  ! 791: BRZ	brz  ,nt	%4,<label_0x10001>
	.word 0xd4e91005  ! 791: LDSTUBA_R	ldstuba	%r10, [%r4 + %r5] 0x80
	.word 0xee290005  ! 801: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfa710005  ! 801: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xfc210005  ! 801: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xd4310005  ! 801: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf6210005  ! 801: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xe4290005  ! 801: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf6292f7e  ! 801: STB_I	stb	%r27, [%r4 + 0x0f7e]
	.word 0xfa712530  ! 801: STX_I	stx	%r29, [%r4 + 0x0530]
	.word 0x0a800001  ! 801: BCS	bcs  	<label_0x1>
	.word 0xd6f24ce9  ! 801: STXA_R	stxa	%r11, [%r9 + %r9] 0x67
	.word 0xfc290005  ! 810: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xea290005  ! 810: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe4212cfc  ! 810: STW_I	stw	%r18, [%r4 + 0x0cfc]
	.word 0xee310005  ! 810: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xd8312604  ! 810: STH_I	sth	%r12, [%r4 + 0x0604]
	.word 0xe8210005  ! 810: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xfc712ad8  ! 810: STX_I	stx	%r30, [%r4 + 0x0ad8]
	.word 0x1c800001  ! 810: BPOS	bpos  	<label_0x1>
	.word 0xd6f04ce1  ! 810: STXA_R	stxa	%r11, [%r1 + %r1] 0x67
	.word 0xec290005  ! 820: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xda310005  ! 820: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xec2922b2  ! 820: STB_I	stb	%r22, [%r4 + 0x02b2]
	.word 0xe0712f98  ! 820: STX_I	stx	%r16, [%r4 + 0x0f98]
	.word 0xe4212c54  ! 820: STW_I	stw	%r18, [%r4 + 0x0c54]
	.word 0xe4712b40  ! 820: STX_I	stx	%r18, [%r4 + 0x0b40]
	.word 0xf43127ec  ! 820: STH_I	sth	%r26, [%r4 + 0x07ec]
	.word 0xee290005  ! 820: STB_R	stb	%r23, [%r4 + %r5]
	.word 0x06c90001  ! 820: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xd6f0c963  ! 820: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xfa290005  ! 830: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe6712a80  ! 830: STX_I	stx	%r19, [%r4 + 0x0a80]
	.word 0xf4712d08  ! 830: STX_I	stx	%r26, [%r4 + 0x0d08]
	.word 0xe6210005  ! 830: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe2310005  ! 830: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xe2290005  ! 830: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd8292dbc  ! 830: STB_I	stb	%r12, [%r4 + 0x0dbc]
	.word 0xe8212958  ! 830: STW_I	stw	%r20, [%r4 + 0x0958]
	.word 0x0a800001  ! 830: BCS	bcs  	<label_0x1>
	.word 0xd6f1c987  ! 830: STXA_R	stxa	%r11, [%r7 + %r7] 0x4c
	.word 0xfa290005  ! 840: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xda7123b0  ! 840: STX_I	stx	%r13, [%r4 + 0x03b0]
	.word 0xfe310005  ! 840: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xee712fd0  ! 840: STX_I	stx	%r23, [%r4 + 0x0fd0]
	.word 0xde710005  ! 840: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf8290005  ! 840: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe4712350  ! 840: STX_I	stx	%r18, [%r4 + 0x0350]
	.word 0xd8290005  ! 840: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x26800003  ! 840: BL	bl,a	<label_0x3>
	.word 0xdcf129e8  ! 840: STXA_I	stxa	%r14, [%r4 + 0x09e8] %asi
	.word 0xde290005  ! 850: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfe710005  ! 850: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xec212c78  ! 850: STW_I	stw	%r22, [%r4 + 0x0c78]
	.word 0xd8310005  ! 850: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xec312b32  ! 850: STH_I	sth	%r22, [%r4 + 0x0b32]
	.word 0xfa310005  ! 850: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xe22924ad  ! 850: STB_I	stb	%r17, [%r4 + 0x04ad]
	.word 0xea292a8a  ! 850: STB_I	stb	%r21, [%r4 + 0x0a8a]
	.word 0x16800001  ! 850: BGE	bge  	<label_0x1>
	.word 0xd6f00ce1  ! 850: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xee290005  ! 859: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf4312b46  ! 859: STH_I	sth	%r26, [%r4 + 0x0b46]
	.word 0xe67127f0  ! 859: STX_I	stx	%r19, [%r4 + 0x07f0]
	.word 0xe6710005  ! 859: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xfa292a25  ! 859: STB_I	stb	%r29, [%r4 + 0x0a25]
	.word 0xe0210005  ! 859: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfa212124  ! 859: STW_I	stw	%r29, [%r4 + 0x0124]
	.word 0x24800003  ! 859: BLE	ble,a	<label_0x3>
	.word 0xd6f20986  ! 859: STXA_R	stxa	%r11, [%r8 + %r6] 0x4c
	.word 0xe2290005  ! 868: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc292cf6  ! 868: STB_I	stb	%r30, [%r4 + 0x0cf6]
	.word 0xf2290005  ! 868: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd4712060  ! 868: STX_I	stx	%r10, [%r4 + 0x0060]
	.word 0xda310005  ! 868: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xd67128d8  ! 868: STX_I	stx	%r11, [%r4 + 0x08d8]
	.word 0xe0290005  ! 868: STB_R	stb	%r16, [%r4 + %r5]
	.word 0x3e800001  ! 868: BVC	bvc,a	<label_0x1>
	.word 0xd6f00ce8  ! 868: STXA_R	stxa	%r11, [%r0 + %r8] 0x67
	.word 0xea290005  ! 878: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe23121a2  ! 878: STH_I	sth	%r17, [%r4 + 0x01a2]
	.word 0xe4310005  ! 878: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xe2212efc  ! 878: STW_I	stw	%r17, [%r4 + 0x0efc]
	.word 0xde712250  ! 878: STX_I	stx	%r15, [%r4 + 0x0250]
	.word 0xe8290005  ! 878: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf4290005  ! 878: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf6310005  ! 878: STH_R	sth	%r27, [%r4 + %r5]
	.word 0x40000003  ! 878: CALL	call	disp30_3
	.word 0xd8f1c988  ! 878: STXA_R	stxa	%r12, [%r7 + %r8] 0x4c
	.word 0xf4290005  ! 887: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xd4212688  ! 887: STW_I	stw	%r10, [%r4 + 0x0688]
	.word 0xe4292cd3  ! 887: STB_I	stb	%r18, [%r4 + 0x0cd3]
	.word 0xf0210005  ! 887: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xd621246c  ! 887: STW_I	stw	%r11, [%r4 + 0x046c]
	.word 0xec290005  ! 887: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd8290005  ! 887: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x40000001  ! 887: CALL	call	disp30_1
	.word 0xdcf11005  ! 887: STXA_R	stxa	%r14, [%r4 + %r5] 0x80
	.word 0xde290005  ! 897: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc710005  ! 897: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf2310005  ! 897: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xfa712938  ! 897: STX_I	stx	%r29, [%r4 + 0x0938]
	.word 0xe4290005  ! 897: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd8310005  ! 897: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf0710005  ! 897: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xee29296d  ! 897: STB_I	stb	%r23, [%r4 + 0x096d]
	.word 0x08800003  ! 897: BLEU	bleu  	<label_0x3>
	.word 0xd6f04ce3  ! 897: STXA_R	stxa	%r11, [%r1 + %r3] 0x67
	.word 0xde290005  ! 906: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf0312bf4  ! 906: STH_I	sth	%r24, [%r4 + 0x0bf4]
	.word 0xf82920bb  ! 906: STB_I	stb	%r28, [%r4 + 0x00bb]
	.word 0xe8712b18  ! 906: STX_I	stx	%r20, [%r4 + 0x0b18]
	.word 0xf831267a  ! 906: STH_I	sth	%r28, [%r4 + 0x067a]
	.word 0xea290005  ! 906: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf2310005  ! 906: STH_R	sth	%r25, [%r4 + %r5]
	.word 0x02c90001  ! 906: BRZ	brz  ,pt	%4,<label_0x90001>
	.word 0xd6f08ce0  ! 906: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
	.word 0xde290005  ! 915: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xea310005  ! 915: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xee290005  ! 915: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf4290005  ! 915: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe8292bcc  ! 915: STB_I	stb	%r20, [%r4 + 0x0bcc]
	.word 0xfc312182  ! 915: STH_I	sth	%r30, [%r4 + 0x0182]
	.word 0xee210005  ! 915: STW_R	stw	%r23, [%r4 + %r5]
	.word 0x0a800001  ! 915: BCS	bcs  	<label_0x1>
	.word 0xe0312df4  ! 915: STH_I	sth	%r16, [%r4 + 0x0df4]
	.word 0xf0290005  ! 925: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe8710005  ! 925: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf4212978  ! 925: STW_I	stw	%r26, [%r4 + 0x0978]
	.word 0xf43126f2  ! 925: STH_I	sth	%r26, [%r4 + 0x06f2]
	.word 0xe6210005  ! 925: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xda210005  ! 925: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xf0210005  ! 925: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf47122d0  ! 925: STX_I	stx	%r26, [%r4 + 0x02d0]
	.word 0x2ec90003  ! 925: BRGEZ	brgez,a,pt	%4,<label_0x90003>
	.word 0xd6f0c983  ! 925: STXA_R	stxa	%r11, [%r3 + %r3] 0x4c
	.word 0xd8290005  ! 934: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xfe210005  ! 934: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xd47126c8  ! 934: STX_I	stx	%r10, [%r4 + 0x06c8]
	.word 0xe6312588  ! 934: STH_I	sth	%r19, [%r4 + 0x0588]
	.word 0xda310005  ! 934: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xde312fb0  ! 934: STH_I	sth	%r15, [%r4 + 0x0fb0]
	.word 0xe8292da3  ! 934: STB_I	stb	%r20, [%r4 + 0x0da3]
	.word 0x00800001  ! 934: BN	bn  	<label_0x1>
	.word 0xd6f08961  ! 934: STXA_R	stxa	%r11, [%r2 + %r1] 0x4b
	.word 0xf4290005  ! 944: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf2312426  ! 944: STH_I	sth	%r25, [%r4 + 0x0426]
	.word 0xe8710005  ! 944: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf4310005  ! 944: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xf8712178  ! 944: STX_I	stx	%r28, [%r4 + 0x0178]
	.word 0xf0712ac8  ! 944: STX_I	stx	%r24, [%r4 + 0x0ac8]
	.word 0xdc310005  ! 944: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xfc310005  ! 944: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x24c90003  ! 944: BRLEZ	brlez,a,pt	%4,<label_0x90003>
	.word 0xfdf11005  ! 944: CASXA_I	casxa	[%r4] 0x80, %r5, %r30
	.word 0xf6290005  ! 953: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xdc2922da  ! 953: STB_I	stb	%r14, [%r4 + 0x02da]
	.word 0xf03129fc  ! 953: STH_I	sth	%r24, [%r4 + 0x09fc]
	.word 0xf2290005  ! 953: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd8292467  ! 953: STB_I	stb	%r12, [%r4 + 0x0467]
	.word 0xf6212c58  ! 953: STW_I	stw	%r27, [%r4 + 0x0c58]
	.word 0xf8712410  ! 953: STX_I	stx	%r28, [%r4 + 0x0410]
	.word 0x02800001  ! 953: BE	be  	<label_0x1>
	.word 0xd8f0c989  ! 953: STXA_R	stxa	%r12, [%r3 + %r9] 0x4c
	.word 0xfe290005  ! 963: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe8310005  ! 963: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf2290005  ! 963: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd4312230  ! 963: STH_I	sth	%r10, [%r4 + 0x0230]
	.word 0xda212f04  ! 963: STW_I	stw	%r13, [%r4 + 0x0f04]
	.word 0xfe2126bc  ! 963: STW_I	stw	%r31, [%r4 + 0x06bc]
	.word 0xea710005  ! 963: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xfe712d10  ! 963: STX_I	stx	%r31, [%r4 + 0x0d10]
	.word 0x0ec90001  ! 963: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xf831286e  ! 963: STH_I	sth	%r28, [%r4 + 0x086e]
	.word 0xf4290005  ! 972: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf27120a0  ! 972: STX_I	stx	%r25, [%r4 + 0x00a0]
	.word 0xf8710005  ! 972: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf8210005  ! 972: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfc310005  ! 972: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf2212060  ! 972: STW_I	stw	%r25, [%r4 + 0x0060]
	.word 0xec710005  ! 972: STX_R	stx	%r22, [%r4 + %r5]
	.word 0x2cc10001  ! 972: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd8f0cce1  ! 972: STXA_R	stxa	%r12, [%r3 + %r1] 0x67
	.word 0xe2290005  ! 981: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xec710005  ! 981: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xd4712c30  ! 981: STX_I	stx	%r10, [%r4 + 0x0c30]
	.word 0xfe210005  ! 981: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xe4290005  ! 981: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe0290005  ! 981: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfe210005  ! 981: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x1a800001  ! 981: BCC	bcc  	<label_0x1>
	.word 0xd8f0c981  ! 981: STXA_R	stxa	%r12, [%r3 + %r1] 0x4c
	.word 0xd6290005  ! 991: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd4212378  ! 991: STW_I	stw	%r10, [%r4 + 0x0378]
	.word 0xdc292f20  ! 991: STB_I	stb	%r14, [%r4 + 0x0f20]
	.word 0xe2710005  ! 991: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe8310005  ! 991: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf8310005  ! 991: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xd8212040  ! 991: STW_I	stw	%r12, [%r4 + 0x0040]
	.word 0xd8210005  ! 991: STW_R	stw	%r12, [%r4 + %r5]
	.word 0x3e800001  ! 991: BVC	bvc,a	<label_0x1>
	.word 0xd6f00ce7  ! 991: STXA_R	stxa	%r11, [%r0 + %r7] 0x67
	.word 0xd8290005  ! 1000: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf2210005  ! 1000: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xe2310005  ! 1000: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xfe7127d0  ! 1000: STX_I	stx	%r31, [%r4 + 0x07d0]
	.word 0xd6310005  ! 1000: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xf6710005  ! 1000: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe2210005  ! 1000: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x2a800001  ! 1000: BCS	bcs,a	<label_0x1>
	.word 0xf7e11005  ! 1000: CASA_I	casa	[%r4] 0x80, %r5, %r27
	.word 0xdc290005  ! 1009: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xd8290005  ! 1009: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe0310005  ! 1009: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xe82122fc  ! 1009: STW_I	stw	%r20, [%r4 + 0x02fc]
	.word 0xfe290005  ! 1009: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xdc290005  ! 1009: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf2712d70  ! 1009: STX_I	stx	%r25, [%r4 + 0x0d70]
	.word 0x3a800001  ! 1009: BCC	bcc,a	<label_0x1>
	.word 0xd6f18966  ! 1009: STXA_R	stxa	%r11, [%r6 + %r6] 0x4b
	.word 0xf8290005  ! 1019: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xfc212e30  ! 1019: STW_I	stw	%r30, [%r4 + 0x0e30]
	.word 0xd6710005  ! 1019: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xea210005  ! 1019: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xd6712820  ! 1019: STX_I	stx	%r11, [%r4 + 0x0820]
	.word 0xf82122c8  ! 1019: STW_I	stw	%r28, [%r4 + 0x02c8]
	.word 0xe8310005  ! 1019: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xe0310005  ! 1019: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x1a800001  ! 1019: BCC	bcc  	<label_0x1>
	.word 0xfa710005  ! 1019: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xd4290005  ! 1029: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xee292f00  ! 1029: STB_I	stb	%r23, [%r4 + 0x0f00]
	.word 0xf0290005  ! 1029: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xec312914  ! 1029: STH_I	sth	%r22, [%r4 + 0x0914]
	.word 0xf22921f7  ! 1029: STB_I	stb	%r25, [%r4 + 0x01f7]
	.word 0xe03128b6  ! 1029: STH_I	sth	%r16, [%r4 + 0x08b6]
	.word 0xe0310005  ! 1029: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xdc712db8  ! 1029: STX_I	stx	%r14, [%r4 + 0x0db8]
	.word 0x06800001  ! 1029: BL	bl  	<label_0x1>
	.word 0xede11005  ! 1029: CASA_I	casa	[%r4] 0x80, %r5, %r22
	.word 0xf2290005  ! 1038: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xda292348  ! 1038: STB_I	stb	%r13, [%r4 + 0x0348]
	.word 0xde290005  ! 1038: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe8290005  ! 1038: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf63128f0  ! 1038: STH_I	sth	%r27, [%r4 + 0x08f0]
	.word 0xe43123a6  ! 1038: STH_I	sth	%r18, [%r4 + 0x03a6]
	.word 0xf0710005  ! 1038: STX_R	stx	%r24, [%r4 + %r5]
	.word 0x40000003  ! 1038: CALL	call	disp30_3
	.word 0xdbe11005  ! 1038: CASA_I	casa	[%r4] 0x80, %r5, %r13
	.word 0xe8290005  ! 1048: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xec710005  ! 1048: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xd8310005  ! 1048: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf8292b23  ! 1048: STB_I	stb	%r28, [%r4 + 0x0b23]
	.word 0xea290005  ! 1048: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xfc212748  ! 1048: STW_I	stw	%r30, [%r4 + 0x0748]
	.word 0xec2128d4  ! 1048: STW_I	stw	%r22, [%r4 + 0x08d4]
	.word 0xea29282e  ! 1048: STB_I	stb	%r21, [%r4 + 0x082e]
	.word 0x0e800001  ! 1048: BVS	bvs  	<label_0x1>
	.word 0xe2a91005  ! 1048: STBA_R	stba	%r17, [%r4 + %r5] 0x80
	.word 0xd6290005  ! 1058: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xda312f1a  ! 1058: STH_I	sth	%r13, [%r4 + 0x0f1a]
	.word 0xea3122d4  ! 1058: STH_I	sth	%r21, [%r4 + 0x02d4]
	.word 0xee710005  ! 1058: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe6710005  ! 1058: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xf0290005  ! 1058: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe2710005  ! 1058: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe2712848  ! 1058: STX_I	stx	%r17, [%r4 + 0x0848]
	.word 0x28800003  ! 1058: BLEU	bleu,a	<label_0x3>
	.word 0xd8f04980  ! 1058: STXA_R	stxa	%r12, [%r1 + %r0] 0x4c
	.word 0xe6290005  ! 1067: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf2290005  ! 1067: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe07129f0  ! 1067: STX_I	stx	%r16, [%r4 + 0x09f0]
	.word 0xda2128b4  ! 1067: STW_I	stw	%r13, [%r4 + 0x08b4]
	.word 0xee210005  ! 1067: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xd6210005  ! 1067: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xda292026  ! 1067: STB_I	stb	%r13, [%r4 + 0x0026]
	.word 0x2e800001  ! 1067: BVS	bvs,a	<label_0x1>
	.word 0xe4a11005  ! 1067: STWA_R	stwa	%r18, [%r4 + %r5] 0x80
	.word 0xec290005  ! 1076: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf2292ce3  ! 1076: STB_I	stb	%r25, [%r4 + 0x0ce3]
	.word 0xde3125a6  ! 1076: STH_I	sth	%r15, [%r4 + 0x05a6]
	.word 0xfe210005  ! 1076: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xfc7123d0  ! 1076: STX_I	stx	%r30, [%r4 + 0x03d0]
	.word 0xd8710005  ! 1076: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xfe210005  ! 1076: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x1c800001  ! 1076: BPOS	bpos  	<label_0x1>
	.word 0xd8f0cce3  ! 1076: STXA_R	stxa	%r12, [%r3 + %r3] 0x67
	.word 0xfa290005  ! 1086: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf0712138  ! 1086: STX_I	stx	%r24, [%r4 + 0x0138]
	.word 0xe4712dc0  ! 1086: STX_I	stx	%r18, [%r4 + 0x0dc0]
	.word 0xf8710005  ! 1086: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xd6710005  ! 1086: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xe6310005  ! 1086: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xea312b90  ! 1086: STH_I	sth	%r21, [%r4 + 0x0b90]
	.word 0xf0710005  ! 1086: STX_R	stx	%r24, [%r4 + %r5]
	.word 0x2e800001  ! 1086: BVS	bvs,a	<label_0x1>
	.word 0xd6f1cce3  ! 1086: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xe4290005  ! 1096: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf6310005  ! 1096: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xd4312308  ! 1096: STH_I	sth	%r10, [%r4 + 0x0308]
	.word 0xec710005  ! 1096: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xdc710005  ! 1096: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xe8290005  ! 1096: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xec710005  ! 1096: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xfc310005  ! 1096: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x22c10001  ! 1096: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xdce91005  ! 1096: LDSTUBA_R	ldstuba	%r14, [%r4 + %r5] 0x80
	.word 0xe8290005  ! 1106: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe62129e0  ! 1106: STW_I	stw	%r19, [%r4 + 0x09e0]
	.word 0xf22925df  ! 1106: STB_I	stb	%r25, [%r4 + 0x05df]
	.word 0xf8712650  ! 1106: STX_I	stx	%r28, [%r4 + 0x0650]
	.word 0xde290005  ! 1106: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xd8210005  ! 1106: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xf8312db8  ! 1106: STH_I	sth	%r28, [%r4 + 0x0db8]
	.word 0xe2312d98  ! 1106: STH_I	sth	%r17, [%r4 + 0x0d98]
	.word 0x04800001  ! 1106: BLE	ble  	<label_0x1>
	.word 0xd6f00ce8  ! 1106: STXA_R	stxa	%r11, [%r0 + %r8] 0x67
	.word 0xe0290005  ! 1116: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd6712800  ! 1116: STX_I	stx	%r11, [%r4 + 0x0800]
	.word 0xd67124c0  ! 1116: STX_I	stx	%r11, [%r4 + 0x04c0]
	.word 0xf83129a6  ! 1116: STH_I	sth	%r28, [%r4 + 0x09a6]
	.word 0xe0312580  ! 1116: STH_I	sth	%r16, [%r4 + 0x0580]
	.word 0xea712d90  ! 1116: STX_I	stx	%r21, [%r4 + 0x0d90]
	.word 0xd47128b0  ! 1116: STX_I	stx	%r10, [%r4 + 0x08b0]
	.word 0xee310005  ! 1116: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x26c90001  ! 1116: BRLZ	brlz,a,pt	%4,<label_0x90001>
	.word 0xd6f00968  ! 1116: STXA_R	stxa	%r11, [%r0 + %r8] 0x4b
	.word 0xfa290005  ! 1125: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf8710005  ! 1125: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xd6212590  ! 1125: STW_I	stw	%r11, [%r4 + 0x0590]
	.word 0xe2710005  ! 1125: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xfa2924c8  ! 1125: STB_I	stb	%r29, [%r4 + 0x04c8]
	.word 0xee292c6b  ! 1125: STB_I	stb	%r23, [%r4 + 0x0c6b]
	.word 0xea210005  ! 1125: STW_R	stw	%r21, [%r4 + %r5]
	.word 0x30800003  ! 1125: BA	ba,a	<label_0x3>
	.word 0xd6f08980  ! 1125: STXA_R	stxa	%r11, [%r2 + %r0] 0x4c
	.word 0xe2290005  ! 1135: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe2310005  ! 1135: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xe6710005  ! 1135: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xfe310005  ! 1135: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xd6710005  ! 1135: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xf4212c2c  ! 1135: STW_I	stw	%r26, [%r4 + 0x0c2c]
	.word 0xee710005  ! 1135: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe0290005  ! 1135: STB_R	stb	%r16, [%r4 + %r5]
	.word 0x30800001  ! 1135: BA	ba,a	<label_0x1>
	.word 0xe4b91005  ! 1135: STDA_R	stda	%r18, [%r4 + %r5] 0x80
	.word 0xe6290005  ! 1144: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf0710005  ! 1144: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xde210005  ! 1144: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe2710005  ! 1144: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe2710005  ! 1144: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xf021294c  ! 1144: STW_I	stw	%r24, [%r4 + 0x094c]
	.word 0xd4210005  ! 1144: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x28800001  ! 1144: BLEU	bleu,a	<label_0x1>
	.word 0xd8f0c988  ! 1144: STXA_R	stxa	%r12, [%r3 + %r8] 0x4c
	.word 0xd4290005  ! 1154: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xde210005  ! 1154: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xea710005  ! 1154: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xd6710005  ! 1154: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xf8292d25  ! 1154: STB_I	stb	%r28, [%r4 + 0x0d25]
	.word 0xf831225a  ! 1154: STH_I	sth	%r28, [%r4 + 0x025a]
	.word 0xf2290005  ! 1154: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe0310005  ! 1154: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x2ac90001  ! 1154: BRNZ	brnz,a,pt	%4,<label_0x90001>
	.word 0xd6f00ce1  ! 1154: STXA_R	stxa	%r11, [%r0 + %r1] 0x67
	.word 0xda290005  ! 1164: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe2290005  ! 1164: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe8712b98  ! 1164: STX_I	stx	%r20, [%r4 + 0x0b98]
	.word 0xd8212790  ! 1164: STW_I	stw	%r12, [%r4 + 0x0790]
	.word 0xfa290005  ! 1164: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe2710005  ! 1164: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xf0312f02  ! 1164: STH_I	sth	%r24, [%r4 + 0x0f02]
	.word 0xe8210005  ! 1164: STW_R	stw	%r20, [%r4 + %r5]
	.word 0x40000001  ! 1164: CALL	call	disp30_1
	.word 0xd6f04ce8  ! 1164: STXA_R	stxa	%r11, [%r1 + %r8] 0x67
	.word 0xe6290005  ! 1174: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf0290005  ! 1174: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf4310005  ! 1174: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd8312428  ! 1174: STH_I	sth	%r12, [%r4 + 0x0428]
	.word 0xec292614  ! 1174: STB_I	stb	%r22, [%r4 + 0x0614]
	.word 0xd431270e  ! 1174: STH_I	sth	%r10, [%r4 + 0x070e]
	.word 0xf8312d0c  ! 1174: STH_I	sth	%r28, [%r4 + 0x0d0c]
	.word 0xee292387  ! 1174: STB_I	stb	%r23, [%r4 + 0x0387]
	.word 0x00800003  ! 1174: BN	bn  	<label_0x3>
	.word 0xd6f00983  ! 1174: STXA_R	stxa	%r11, [%r0 + %r3] 0x4c
	.word 0xea290005  ! 1183: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xea710005  ! 1183: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xe82120ec  ! 1183: STW_I	stw	%r20, [%r4 + 0x00ec]
	.word 0xf8710005  ! 1183: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xe42129fc  ! 1183: STW_I	stw	%r18, [%r4 + 0x09fc]
	.word 0xfc712ee0  ! 1183: STX_I	stx	%r30, [%r4 + 0x0ee0]
	.word 0xfc310005  ! 1183: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x04c10001  ! 1183: BRLEZ	brlez  ,nt	%4,<label_0x10001>
	.word 0xee792684  ! 1183: SWAP_I	swap	%r23, [%r4 + 0x0684]
	.word 0xda290005  ! 1192: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf8712928  ! 1192: STX_I	stx	%r28, [%r4 + 0x0928]
	.word 0xec210005  ! 1192: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xea210005  ! 1192: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xf0292d86  ! 1192: STB_I	stb	%r24, [%r4 + 0x0d86]
	.word 0xee710005  ! 1192: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf6210005  ! 1192: STW_R	stw	%r27, [%r4 + %r5]
	.word 0x18800003  ! 1192: BGU	bgu  	<label_0x3>
	.word 0xd8f0c963  ! 1192: STXA_R	stxa	%r12, [%r3 + %r3] 0x4b
	.word 0xdc290005  ! 1202: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfc712898  ! 1202: STX_I	stx	%r30, [%r4 + 0x0898]
	.word 0xe0310005  ! 1202: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xda212728  ! 1202: STW_I	stw	%r13, [%r4 + 0x0728]
	.word 0xe4290005  ! 1202: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe8310005  ! 1202: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf4312e1a  ! 1202: STH_I	sth	%r26, [%r4 + 0x0e1a]
	.word 0xf4292478  ! 1202: STB_I	stb	%r26, [%r4 + 0x0478]
	.word 0x32800001  ! 1202: BNE	bne,a	<label_0x1>
	.word 0xd6f04962  ! 1202: STXA_R	stxa	%r11, [%r1 + %r2] 0x4b
	.word 0xe8290005  ! 1211: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf0292044  ! 1211: STB_I	stb	%r24, [%r4 + 0x0044]
	.word 0xf82922e7  ! 1211: STB_I	stb	%r28, [%r4 + 0x02e7]
	.word 0xfa210005  ! 1211: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf6712178  ! 1211: STX_I	stx	%r27, [%r4 + 0x0178]
	.word 0xf2290005  ! 1211: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd6212bd4  ! 1211: STW_I	stw	%r11, [%r4 + 0x0bd4]
	.word 0x02800003  ! 1211: BE	be  	<label_0x3>
	.word 0xd8f04ce7  ! 1211: STXA_R	stxa	%r12, [%r1 + %r7] 0x67
	.word 0xf0290005  ! 1221: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf0310005  ! 1221: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xe63120d8  ! 1221: STH_I	sth	%r19, [%r4 + 0x00d8]
	.word 0xe0210005  ! 1221: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xe8712070  ! 1221: STX_I	stx	%r20, [%r4 + 0x0070]
	.word 0xee292df9  ! 1221: STB_I	stb	%r23, [%r4 + 0x0df9]
	.word 0xfc710005  ! 1221: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xdc3126b0  ! 1221: STH_I	sth	%r14, [%r4 + 0x06b0]
	.word 0x20800001  ! 1221: BN	bn,a	<label_0x1>
	.word 0xd8f24ce6  ! 1221: STXA_R	stxa	%r12, [%r9 + %r6] 0x67
	.word 0xf6290005  ! 1230: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xea292019  ! 1230: STB_I	stb	%r21, [%r4 + 0x0019]
	.word 0xe8290005  ! 1230: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xde2125b4  ! 1230: STW_I	stw	%r15, [%r4 + 0x05b4]
	.word 0xe8712408  ! 1230: STX_I	stx	%r20, [%r4 + 0x0408]
	.word 0xf4210005  ! 1230: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xfe212df4  ! 1230: STW_I	stw	%r31, [%r4 + 0x0df4]
	.word 0x04800001  ! 1230: BLE	ble  	<label_0x1>
	.word 0xd8f00ce2  ! 1230: STXA_R	stxa	%r12, [%r0 + %r2] 0x67
	.word 0xd8290005  ! 1239: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf62924d4  ! 1239: STB_I	stb	%r27, [%r4 + 0x04d4]
	.word 0xe6210005  ! 1239: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xea7124e0  ! 1239: STX_I	stx	%r21, [%r4 + 0x04e0]
	.word 0xdc710005  ! 1239: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xec2928ff  ! 1239: STB_I	stb	%r22, [%r4 + 0x08ff]
	.word 0xe6292770  ! 1239: STB_I	stb	%r19, [%r4 + 0x0770]
	.word 0x24c90001  ! 1239: BRLEZ	brlez,a,pt	%4,<label_0x90001>
	.word 0xd6f08ce6  ! 1239: STXA_R	stxa	%r11, [%r2 + %r6] 0x67
	.word 0xf6290005  ! 1248: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe62125c8  ! 1248: STW_I	stw	%r19, [%r4 + 0x05c8]
	.word 0xe0712640  ! 1248: STX_I	stx	%r16, [%r4 + 0x0640]
	.word 0xfa310005  ! 1248: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xe4710005  ! 1248: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfe310005  ! 1248: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xde210005  ! 1248: STW_R	stw	%r15, [%r4 + %r5]
	.word 0x16800001  ! 1248: BGE	bge  	<label_0x1>
	.word 0xf2310005  ! 1248: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xec290005  ! 1257: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xda292ee3  ! 1257: STB_I	stb	%r13, [%r4 + 0x0ee3]
	.word 0xd8712e88  ! 1257: STX_I	stx	%r12, [%r4 + 0x0e88]
	.word 0xda212148  ! 1257: STW_I	stw	%r13, [%r4 + 0x0148]
	.word 0xfc312fd6  ! 1257: STH_I	sth	%r30, [%r4 + 0x0fd6]
	.word 0xf4712900  ! 1257: STX_I	stx	%r26, [%r4 + 0x0900]
	.word 0xea210005  ! 1257: STW_R	stw	%r21, [%r4 + %r5]
	.word 0x2ec90003  ! 1257: BRGEZ	brgez,a,pt	%4,<label_0x90003>
	.word 0xd8f0c989  ! 1257: STXA_R	stxa	%r12, [%r3 + %r9] 0x4c
	.word 0xe0290005  ! 1266: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfe710005  ! 1266: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xd4290005  ! 1266: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xda210005  ! 1266: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xd87129d0  ! 1266: STX_I	stx	%r12, [%r4 + 0x09d0]
	.word 0xf4710005  ! 1266: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xde312e8c  ! 1266: STH_I	sth	%r15, [%r4 + 0x0e8c]
	.word 0x06c90001  ! 1266: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xd8f00966  ! 1266: STXA_R	stxa	%r12, [%r0 + %r6] 0x4b
	.word 0xf2290005  ! 1275: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf2290005  ! 1275: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe6710005  ! 1275: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xf8290005  ! 1275: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd4290005  ! 1275: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe0292346  ! 1275: STB_I	stb	%r16, [%r4 + 0x0346]
	.word 0xf0712d70  ! 1275: STX_I	stx	%r24, [%r4 + 0x0d70]
	.word 0x2cc90003  ! 1275: BRGZ	brgz,a,pt	%4,<label_0x90003>
	.word 0xd8f00ce7  ! 1275: STXA_R	stxa	%r12, [%r0 + %r7] 0x67
	.word 0xf6290005  ! 1284: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf2212128  ! 1284: STW_I	stw	%r25, [%r4 + 0x0128]
	.word 0xee210005  ! 1284: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xd4290005  ! 1284: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfa310005  ! 1284: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xea710005  ! 1284: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xec292558  ! 1284: STB_I	stb	%r22, [%r4 + 0x0558]
	.word 0x3a800003  ! 1284: BCC	bcc,a	<label_0x3>
	.word 0xd6f0cce0  ! 1284: STXA_R	stxa	%r11, [%r3 + %r0] 0x67
	.word 0xe8290005  ! 1293: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xda290005  ! 1293: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xec290005  ! 1293: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe8710005  ! 1293: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd629210e  ! 1293: STB_I	stb	%r11, [%r4 + 0x010e]
	.word 0xfc29215f  ! 1293: STB_I	stb	%r30, [%r4 + 0x015f]
	.word 0xda310005  ! 1293: STH_R	sth	%r13, [%r4 + %r5]
	.word 0x22800001  ! 1293: BE	be,a	<label_0x1>
	.word 0xd6f20ce1  ! 1293: STXA_R	stxa	%r11, [%r8 + %r1] 0x67
	.word 0xda290005  ! 1303: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa710005  ! 1303: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xfc310005  ! 1303: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf2212538  ! 1303: STW_I	stw	%r25, [%r4 + 0x0538]
	.word 0xea712b10  ! 1303: STX_I	stx	%r21, [%r4 + 0x0b10]
	.word 0xfe212cdc  ! 1303: STW_I	stw	%r31, [%r4 + 0x0cdc]
	.word 0xfa310005  ! 1303: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xf0290005  ! 1303: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x12800001  ! 1303: BNE	bne  	<label_0x1>
	.word 0xd8f0cce7  ! 1303: STXA_R	stxa	%r12, [%r3 + %r7] 0x67
	.word 0xf2290005  ! 1312: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd4310005  ! 1312: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xda212f94  ! 1312: STW_I	stw	%r13, [%r4 + 0x0f94]
	.word 0xf021245c  ! 1312: STW_I	stw	%r24, [%r4 + 0x045c]
	.word 0xe0310005  ! 1312: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xf2212aa4  ! 1312: STW_I	stw	%r25, [%r4 + 0x0aa4]
	.word 0xd4210005  ! 1312: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x0c800003  ! 1312: BNEG	bneg  	<label_0x3>
	.word 0xe8292d37  ! 1312: STB_I	stb	%r20, [%r4 + 0x0d37]
	.word 0xf0290005  ! 1322: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe6712488  ! 1322: STX_I	stx	%r19, [%r4 + 0x0488]
	.word 0xec2925af  ! 1322: STB_I	stb	%r22, [%r4 + 0x05af]
	.word 0xfe212758  ! 1322: STW_I	stw	%r31, [%r4 + 0x0758]
	.word 0xf6710005  ! 1322: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xf0290005  ! 1322: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf6210005  ! 1322: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf6310005  ! 1322: STH_R	sth	%r27, [%r4 + %r5]
	.word 0x00800001  ! 1322: BN	bn  	<label_0x1>
	.word 0xd6f0cce3  ! 1322: STXA_R	stxa	%r11, [%r3 + %r3] 0x67
	.word 0xf0290005  ! 1331: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe629290c  ! 1331: STB_I	stb	%r19, [%r4 + 0x090c]
	.word 0xe6210005  ! 1331: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe2212c6c  ! 1331: STW_I	stw	%r17, [%r4 + 0x0c6c]
	.word 0xfc290005  ! 1331: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf2312eaa  ! 1331: STH_I	sth	%r25, [%r4 + 0x0eaa]
	.word 0xe6212d8c  ! 1331: STW_I	stw	%r19, [%r4 + 0x0d8c]
	.word 0x08800001  ! 1331: BLEU	bleu  	<label_0x1>
	.word 0xd6f24ce9  ! 1331: STXA_R	stxa	%r11, [%r9 + %r9] 0x67
	.word 0xdc290005  ! 1341: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf0292403  ! 1341: STB_I	stb	%r24, [%r4 + 0x0403]
	.word 0xfc21295c  ! 1341: STW_I	stw	%r30, [%r4 + 0x095c]
	.word 0xea710005  ! 1341: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xfc310005  ! 1341: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf8212c30  ! 1341: STW_I	stw	%r28, [%r4 + 0x0c30]
	.word 0xfa312cbe  ! 1341: STH_I	sth	%r29, [%r4 + 0x0cbe]
	.word 0xf8290005  ! 1341: STB_R	stb	%r28, [%r4 + %r5]
	.word 0x0ac10003  ! 1341: BRNZ	brnz  ,nt	%4,<label_0x10003>
	.word 0xd5f12005  ! 1341: CASXA_R	casxa	[%r4]%asi, %r5, %r10
	.word 0xe0290005  ! 1351: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe2210005  ! 1351: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xfc310005  ! 1351: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xe0710005  ! 1351: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xf4312828  ! 1351: STH_I	sth	%r26, [%r4 + 0x0828]
	.word 0xfc312eb8  ! 1351: STH_I	sth	%r30, [%r4 + 0x0eb8]
	.word 0xfc292452  ! 1351: STB_I	stb	%r30, [%r4 + 0x0452]
	.word 0xe0210005  ! 1351: STW_R	stw	%r16, [%r4 + %r5]
	.word 0x28800001  ! 1351: BLEU	bleu,a	<label_0x1>
	.word 0xd8f00ce0  ! 1351: STXA_R	stxa	%r12, [%r0 + %r0] 0x67
	.word 0xf8290005  ! 1360: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf6310005  ! 1360: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xe62929e0  ! 1360: STB_I	stb	%r19, [%r4 + 0x09e0]
	.word 0xec710005  ! 1360: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xea212624  ! 1360: STW_I	stw	%r21, [%r4 + 0x0624]
	.word 0xf4292836  ! 1360: STB_I	stb	%r26, [%r4 + 0x0836]
	.word 0xdc292909  ! 1360: STB_I	stb	%r14, [%r4 + 0x0909]
	.word 0x0c800001  ! 1360: BNEG	bneg  	<label_0x1>
	.word 0xd8b91005  ! 1360: STDA_R	stda	%r12, [%r4 + %r5] 0x80
	.word 0xfe290005  ! 1369: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf8210005  ! 1369: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xd42125d4  ! 1369: STW_I	stw	%r10, [%r4 + 0x05d4]
	.word 0xe2292ecf  ! 1369: STB_I	stb	%r17, [%r4 + 0x0ecf]
	.word 0xf6710005  ! 1369: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xdc710005  ! 1369: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xd8290005  ! 1369: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x32800001  ! 1369: BNE	bne,a	<label_0x1>
	.word 0xd8f08ce1  ! 1369: STXA_R	stxa	%r12, [%r2 + %r1] 0x67
	.word 0xfc290005  ! 1378: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xea290005  ! 1378: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf0210005  ! 1378: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf2290005  ! 1378: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xde290005  ! 1378: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe2310005  ! 1378: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xde290005  ! 1378: STB_R	stb	%r15, [%r4 + %r5]
	.word 0x32800001  ! 1378: BNE	bne,a	<label_0x1>
	.word 0xdaa92c1f  ! 1378: STBA_I	stba	%r13, [%r4 + 0x0c1f] %asi
	.word 0xe2290005  ! 1387: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf8292fb2  ! 1387: STB_I	stb	%r28, [%r4 + 0x0fb2]
	.word 0xf0312796  ! 1387: STH_I	sth	%r24, [%r4 + 0x0796]
	.word 0xd8312140  ! 1387: STH_I	sth	%r12, [%r4 + 0x0140]
	.word 0xe4292067  ! 1387: STB_I	stb	%r18, [%r4 + 0x0067]
	.word 0xd4310005  ! 1387: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xd8310005  ! 1387: STH_R	sth	%r12, [%r4 + %r5]
	.word 0x3a800001  ! 1387: BCC	bcc,a	<label_0x1>
	.word 0xd6f08ce3  ! 1387: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xde290005  ! 1396: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe8310005  ! 1396: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xd6290005  ! 1396: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf6712760  ! 1396: STX_I	stx	%r27, [%r4 + 0x0760]
	.word 0xec212bc0  ! 1396: STW_I	stw	%r22, [%r4 + 0x0bc0]
	.word 0xe4310005  ! 1396: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xd82929f1  ! 1396: STB_I	stb	%r12, [%r4 + 0x09f1]
	.word 0x0a800001  ! 1396: BCS	bcs  	<label_0x1>
	.word 0xd8f04963  ! 1396: STXA_R	stxa	%r12, [%r1 + %r3] 0x4b
	.word 0xe0290005  ! 1405: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xea29281f  ! 1405: STB_I	stb	%r21, [%r4 + 0x081f]
	.word 0xd8290005  ! 1405: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xdc7127a0  ! 1405: STX_I	stx	%r14, [%r4 + 0x07a0]
	.word 0xd4290005  ! 1405: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xd82123f8  ! 1405: STW_I	stw	%r12, [%r4 + 0x03f8]
	.word 0xd6712428  ! 1405: STX_I	stx	%r11, [%r4 + 0x0428]
	.word 0x0a800003  ! 1405: BCS	bcs  	<label_0x3>
	.word 0xd8f00989  ! 1405: STXA_R	stxa	%r12, [%r0 + %r9] 0x4c
	.word 0xfa290005  ! 1415: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xec290005  ! 1415: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd8712328  ! 1415: STX_I	stx	%r12, [%r4 + 0x0328]
	.word 0xf6210005  ! 1415: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xd4290005  ! 1415: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xdc2120c8  ! 1415: STW_I	stw	%r14, [%r4 + 0x00c8]
	.word 0xde290005  ! 1415: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe67120c8  ! 1415: STX_I	stx	%r19, [%r4 + 0x00c8]
	.word 0x06800003  ! 1415: BL	bl  	<label_0x3>
	.word 0xd8f24ce7  ! 1415: STXA_R	stxa	%r12, [%r9 + %r7] 0x67
	.word 0xe2290005  ! 1424: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe6310005  ! 1424: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xfc210005  ! 1424: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xfc712458  ! 1424: STX_I	stx	%r30, [%r4 + 0x0458]
	.word 0xda290005  ! 1424: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe4710005  ! 1424: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xec712e80  ! 1424: STX_I	stx	%r22, [%r4 + 0x0e80]
	.word 0x06c90001  ! 1424: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xd6f04ce2  ! 1424: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xe6290005  ! 1434: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf021297c  ! 1434: STW_I	stw	%r24, [%r4 + 0x097c]
	.word 0xea290005  ! 1434: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd67122c8  ! 1434: STX_I	stx	%r11, [%r4 + 0x02c8]
	.word 0xde710005  ! 1434: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xf4292c19  ! 1434: STB_I	stb	%r26, [%r4 + 0x0c19]
	.word 0xe0710005  ! 1434: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xf0310005  ! 1434: STH_R	sth	%r24, [%r4 + %r5]
	.word 0x36800001  ! 1434: BGE	bge,a	<label_0x1>
	.word 0xd6f1cce6  ! 1434: STXA_R	stxa	%r11, [%r7 + %r6] 0x67
	.word 0xe4290005  ! 1444: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd6292f86  ! 1444: STB_I	stb	%r11, [%r4 + 0x0f86]
	.word 0xf2212480  ! 1444: STW_I	stw	%r25, [%r4 + 0x0480]
	.word 0xf02924e2  ! 1444: STB_I	stb	%r24, [%r4 + 0x04e2]
	.word 0xdc710005  ! 1444: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf6312008  ! 1444: STH_I	sth	%r27, [%r4 + 0x0008]
	.word 0xde290005  ! 1444: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfe2921d9  ! 1444: STB_I	stb	%r31, [%r4 + 0x01d9]
	.word 0x34800003  ! 1444: BG	bg,a	<label_0x3>
	.word 0xd6f00ce2  ! 1444: STXA_R	stxa	%r11, [%r0 + %r2] 0x67
	.word 0xec290005  ! 1454: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf2310005  ! 1454: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd6712928  ! 1454: STX_I	stx	%r11, [%r4 + 0x0928]
	.word 0xea210005  ! 1454: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xfa210005  ! 1454: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf2712448  ! 1454: STX_I	stx	%r25, [%r4 + 0x0448]
	.word 0xfc710005  ! 1454: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xfc712760  ! 1454: STX_I	stx	%r30, [%r4 + 0x0760]
	.word 0x26c90003  ! 1454: BRLZ	brlz,a,pt	%4,<label_0x90003>
	.word 0xfea11005  ! 1454: STWA_R	stwa	%r31, [%r4 + %r5] 0x80
	.word 0xf6290005  ! 1463: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfa31245e  ! 1463: STH_I	sth	%r29, [%r4 + 0x045e]
	.word 0xda710005  ! 1463: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xd8310005  ! 1463: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xee210005  ! 1463: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xe8312bae  ! 1463: STH_I	sth	%r20, [%r4 + 0x0bae]
	.word 0xe0312014  ! 1463: STH_I	sth	%r16, [%r4 + 0x0014]
	.word 0x0c800001  ! 1463: BNEG	bneg  	<label_0x1>
	.word 0xd6f00ce7  ! 1463: STXA_R	stxa	%r11, [%r0 + %r7] 0x67
	.word 0xe8290005  ! 1472: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfa310005  ! 1472: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xe2312592  ! 1472: STH_I	sth	%r17, [%r4 + 0x0592]
	.word 0xe2712888  ! 1472: STX_I	stx	%r17, [%r4 + 0x0888]
	.word 0xd4210005  ! 1472: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xea21257c  ! 1472: STW_I	stw	%r21, [%r4 + 0x057c]
	.word 0xfa712dd0  ! 1472: STX_I	stx	%r29, [%r4 + 0x0dd0]
	.word 0x2e800001  ! 1472: BVS	bvs,a	<label_0x1>
	.word 0xfd210005  ! 1472: STF_R	st	%f30, [%r5, %r4]
	.word 0xe2290005  ! 1482: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe8710005  ! 1482: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf2310005  ! 1482: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xe8212a28  ! 1482: STW_I	stw	%r20, [%r4 + 0x0a28]
	.word 0xe0710005  ! 1482: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd6710005  ! 1482: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xde212b38  ! 1482: STW_I	stw	%r15, [%r4 + 0x0b38]
	.word 0xf6292e7a  ! 1482: STB_I	stb	%r27, [%r4 + 0x0e7a]
	.word 0x3e800003  ! 1482: BVC	bvc,a	<label_0x3>
	.word 0xd8f04ce0  ! 1482: STXA_R	stxa	%r12, [%r1 + %r0] 0x67
	.word 0xee290005  ! 1491: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfa710005  ! 1491: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xf0212068  ! 1491: STW_I	stw	%r24, [%r4 + 0x0068]
	.word 0xee210005  ! 1491: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xf4312b06  ! 1491: STH_I	sth	%r26, [%r4 + 0x0b06]
	.word 0xf6292c19  ! 1491: STB_I	stb	%r27, [%r4 + 0x0c19]
	.word 0xde290005  ! 1491: STB_R	stb	%r15, [%r4 + %r5]
	.word 0x22800001  ! 1491: BE	be,a	<label_0x1>
	.word 0xd8f04982  ! 1491: STXA_R	stxa	%r12, [%r1 + %r2] 0x4c
	.word 0xe0290005  ! 1501: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfe292b60  ! 1501: STB_I	stb	%r31, [%r4 + 0x0b60]
	.word 0xee292f21  ! 1501: STB_I	stb	%r23, [%r4 + 0x0f21]
	.word 0xd6310005  ! 1501: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xec290005  ! 1501: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfc212900  ! 1501: STW_I	stw	%r30, [%r4 + 0x0900]
	.word 0xfe710005  ! 1501: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xd82122c4  ! 1501: STW_I	stw	%r12, [%r4 + 0x02c4]
	.word 0x24800001  ! 1501: BLE	ble,a	<label_0x1>
	.word 0xfea92694  ! 1501: STBA_I	stba	%r31, [%r4 + 0x0694] %asi
	.word 0xf4290005  ! 1511: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe229274a  ! 1511: STB_I	stb	%r17, [%r4 + 0x074a]
	.word 0xf4310005  ! 1511: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xe4712720  ! 1511: STX_I	stx	%r18, [%r4 + 0x0720]
	.word 0xdc31252c  ! 1511: STH_I	sth	%r14, [%r4 + 0x052c]
	.word 0xe8712348  ! 1511: STX_I	stx	%r20, [%r4 + 0x0348]
	.word 0xfa292f2f  ! 1511: STB_I	stb	%r29, [%r4 + 0x0f2f]
	.word 0xe2712288  ! 1511: STX_I	stx	%r17, [%r4 + 0x0288]
	.word 0x0ac90001  ! 1511: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xd8f00980  ! 1511: STXA_R	stxa	%r12, [%r0 + %r0] 0x4c
	.word 0xf0290005  ! 1520: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf8292185  ! 1520: STB_I	stb	%r28, [%r4 + 0x0185]
	.word 0xe2710005  ! 1520: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xee710005  ! 1520: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xea212f50  ! 1520: STW_I	stw	%r21, [%r4 + 0x0f50]
	.word 0xf8310005  ! 1520: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xd6210005  ! 1520: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x0ac90001  ! 1520: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xd6f18983  ! 1520: STXA_R	stxa	%r11, [%r6 + %r3] 0x4c
	.word 0xf8290005  ! 1530: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd629232f  ! 1530: STB_I	stb	%r11, [%r4 + 0x032f]
	.word 0xe2310005  ! 1530: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xe4312984  ! 1530: STH_I	sth	%r18, [%r4 + 0x0984]
	.word 0xf6290005  ! 1530: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf0210005  ! 1530: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf8212af0  ! 1530: STW_I	stw	%r28, [%r4 + 0x0af0]
	.word 0xe8710005  ! 1530: STX_R	stx	%r20, [%r4 + %r5]
	.word 0x24800001  ! 1530: BLE	ble,a	<label_0x1>
	.word 0xdf390005  ! 1530: STDF_R	std	%f15, [%r5, %r4]
	.word 0xe2290005  ! 1540: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfa710005  ! 1540: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe2290005  ! 1540: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe8210005  ! 1540: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xee712c90  ! 1540: STX_I	stx	%r23, [%r4 + 0x0c90]
	.word 0xfe310005  ! 1540: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xfc2924ea  ! 1540: STB_I	stb	%r30, [%r4 + 0x04ea]
	.word 0xe67123d0  ! 1540: STX_I	stx	%r19, [%r4 + 0x03d0]
	.word 0x04800001  ! 1540: BLE	ble  	<label_0x1>
	.word 0xd4f924bc  ! 1540: SWAPA_I	swapa	%r10, [%r4 + 0x04bc] %asi
	.word 0xe6290005  ! 1550: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xdc712e48  ! 1550: STX_I	stx	%r14, [%r4 + 0x0e48]
	.word 0xe4212af4  ! 1550: STW_I	stw	%r18, [%r4 + 0x0af4]
	.word 0xfc712768  ! 1550: STX_I	stx	%r30, [%r4 + 0x0768]
	.word 0xd4210005  ! 1550: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xde210005  ! 1550: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xda212190  ! 1550: STW_I	stw	%r13, [%r4 + 0x0190]
	.word 0xd6710005  ! 1550: STX_R	stx	%r11, [%r4 + %r5]
	.word 0x10800001  ! 1550: BA	ba  	<label_0x1>
	.word 0xe3212ebc  ! 1550: STF_I	st	%f17, [0x0ebc, %r4]
	.word 0xf0290005  ! 1559: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf2212fd8  ! 1559: STW_I	stw	%r25, [%r4 + 0x0fd8]
	.word 0xd4310005  ! 1559: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf6310005  ! 1559: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf4210005  ! 1559: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xf2210005  ! 1559: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xfc710005  ! 1559: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x08800001  ! 1559: BLEU	bleu  	<label_0x1>
	.word 0xd6f20967  ! 1559: STXA_R	stxa	%r11, [%r8 + %r7] 0x4b
	.word 0xe2290005  ! 1568: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf8310005  ! 1568: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf8712428  ! 1568: STX_I	stx	%r28, [%r4 + 0x0428]
	.word 0xda210005  ! 1568: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xea292591  ! 1568: STB_I	stb	%r21, [%r4 + 0x0591]
	.word 0xfe712138  ! 1568: STX_I	stx	%r31, [%r4 + 0x0138]
	.word 0xfa290005  ! 1568: STB_R	stb	%r29, [%r4 + %r5]
	.word 0x20800003  ! 1568: BN	bn,a	<label_0x3>
	.word 0xf0792a04  ! 1568: SWAP_I	swap	%r24, [%r4 + 0x0a04]
	.word 0xf2290005  ! 1577: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf6212768  ! 1577: STW_I	stw	%r27, [%r4 + 0x0768]
	.word 0xf2212fb0  ! 1577: STW_I	stw	%r25, [%r4 + 0x0fb0]
	.word 0xe4310005  ! 1577: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf8292580  ! 1577: STB_I	stb	%r28, [%r4 + 0x0580]
	.word 0xea310005  ! 1577: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xf42928b5  ! 1577: STB_I	stb	%r26, [%r4 + 0x08b5]
	.word 0x22800001  ! 1577: BE	be,a	<label_0x1>
	.word 0xd6f08ce0  ! 1577: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
	.word 0xf2290005  ! 1586: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe4710005  ! 1586: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xd8212244  ! 1586: STW_I	stw	%r12, [%r4 + 0x0244]
	.word 0xfe210005  ! 1586: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xea21270c  ! 1586: STW_I	stw	%r21, [%r4 + 0x070c]
	.word 0xe6710005  ! 1586: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xea29247e  ! 1586: STB_I	stb	%r21, [%r4 + 0x047e]
	.word 0x24c90001  ! 1586: BRLEZ	brlez,a,pt	%4,<label_0x90001>
	.word 0xd6f04ce8  ! 1586: STXA_R	stxa	%r11, [%r1 + %r8] 0x67
	.word 0xe2290005  ! 1596: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd83122fa  ! 1596: STH_I	sth	%r12, [%r4 + 0x02fa]
	.word 0xfa712548  ! 1596: STX_I	stx	%r29, [%r4 + 0x0548]
	.word 0xfc310005  ! 1596: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xe6212044  ! 1596: STW_I	stw	%r19, [%r4 + 0x0044]
	.word 0xd6210005  ! 1596: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xd8712f08  ! 1596: STX_I	stx	%r12, [%r4 + 0x0f08]
	.word 0xd6710005  ! 1596: STX_R	stx	%r11, [%r4 + %r5]
	.word 0x30800003  ! 1596: BA	ba,a	<label_0x3>
	.word 0xf0b927c8  ! 1596: STDA_I	stda	%r24, [%r4 + 0x07c8] %asi
	.word 0xd6290005  ! 1606: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xee210005  ! 1606: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xf621274c  ! 1606: STW_I	stw	%r27, [%r4 + 0x074c]
	.word 0xd42928c4  ! 1606: STB_I	stb	%r10, [%r4 + 0x08c4]
	.word 0xde210005  ! 1606: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xfe212b5c  ! 1606: STW_I	stw	%r31, [%r4 + 0x0b5c]
	.word 0xfe2129ec  ! 1606: STW_I	stw	%r31, [%r4 + 0x09ec]
	.word 0xd8290005  ! 1606: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x0e800001  ! 1606: BVS	bvs  	<label_0x1>
	.word 0xe0a92ad2  ! 1606: STBA_I	stba	%r16, [%r4 + 0x0ad2] %asi
	.word 0xf6290005  ! 1615: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xee710005  ! 1615: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xfa2120e8  ! 1615: STW_I	stw	%r29, [%r4 + 0x00e8]
	.word 0xe42122ac  ! 1615: STW_I	stw	%r18, [%r4 + 0x02ac]
	.word 0xf0712810  ! 1615: STX_I	stx	%r24, [%r4 + 0x0810]
	.word 0xf6212d14  ! 1615: STW_I	stw	%r27, [%r4 + 0x0d14]
	.word 0xe0210005  ! 1615: STW_R	stw	%r16, [%r4 + %r5]
	.word 0x16800001  ! 1615: BGE	bge  	<label_0x1>
	.word 0xd6f0cce0  ! 1615: STXA_R	stxa	%r11, [%r3 + %r0] 0x67
	.word 0xf0290005  ! 1624: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfc290005  ! 1624: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd6292bff  ! 1624: STB_I	stb	%r11, [%r4 + 0x0bff]
	.word 0xf2210005  ! 1624: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xd4712ff0  ! 1624: STX_I	stx	%r10, [%r4 + 0x0ff0]
	.word 0xf0212abc  ! 1624: STW_I	stw	%r24, [%r4 + 0x0abc]
	.word 0xd429289e  ! 1624: STB_I	stb	%r10, [%r4 + 0x089e]
	.word 0x06800001  ! 1624: BL	bl  	<label_0x1>
	.word 0xdae92ae7  ! 1624: LDSTUBA_I	ldstuba	%r13, [%r4 + 0x0ae7] %asi
	.word 0xe4290005  ! 1633: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xfe290005  ! 1633: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf4312e48  ! 1633: STH_I	sth	%r26, [%r4 + 0x0e48]
	.word 0xd8712338  ! 1633: STX_I	stx	%r12, [%r4 + 0x0338]
	.word 0xee3127b4  ! 1633: STH_I	sth	%r23, [%r4 + 0x07b4]
	.word 0xf0312998  ! 1633: STH_I	sth	%r24, [%r4 + 0x0998]
	.word 0xf27127d8  ! 1633: STX_I	stx	%r25, [%r4 + 0x07d8]
	.word 0x2e800003  ! 1633: BVS	bvs,a	<label_0x3>
	.word 0xd6f18ce3  ! 1633: STXA_R	stxa	%r11, [%r6 + %r3] 0x67
	.word 0xe0290005  ! 1643: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe4312f9a  ! 1643: STH_I	sth	%r18, [%r4 + 0x0f9a]
	.word 0xf8310005  ! 1643: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf6290005  ! 1643: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfe312ec8  ! 1643: STH_I	sth	%r31, [%r4 + 0x0ec8]
	.word 0xdc310005  ! 1643: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xdc210005  ! 1643: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xfc292c7d  ! 1643: STB_I	stb	%r30, [%r4 + 0x0c7d]
	.word 0x0c800001  ! 1643: BNEG	bneg  	<label_0x1>
	.word 0xd6f04983  ! 1643: STXA_R	stxa	%r11, [%r1 + %r3] 0x4c
	.word 0xdc290005  ! 1652: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf02129e8  ! 1652: STW_I	stw	%r24, [%r4 + 0x09e8]
	.word 0xd4310005  ! 1652: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xe6710005  ! 1652: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xde712608  ! 1652: STX_I	stx	%r15, [%r4 + 0x0608]
	.word 0xee2928f9  ! 1652: STB_I	stb	%r23, [%r4 + 0x08f9]
	.word 0xd8210005  ! 1652: STW_R	stw	%r12, [%r4 + %r5]
	.word 0x18800001  ! 1652: BGU	bgu  	<label_0x1>
	.word 0xd8f20ce1  ! 1652: STXA_R	stxa	%r12, [%r8 + %r1] 0x67
	.word 0xe6290005  ! 1661: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe0712d98  ! 1661: STX_I	stx	%r16, [%r4 + 0x0d98]
	.word 0xd4312800  ! 1661: STH_I	sth	%r10, [%r4 + 0x0800]
	.word 0xfe292de4  ! 1661: STB_I	stb	%r31, [%r4 + 0x0de4]
	.word 0xee310005  ! 1661: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xd8212720  ! 1661: STW_I	stw	%r12, [%r4 + 0x0720]
	.word 0xf8210005  ! 1661: STW_R	stw	%r28, [%r4 + %r5]
	.word 0x08800003  ! 1661: BLEU	bleu  	<label_0x3>
	.word 0xd6f18ce0  ! 1661: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xde290005  ! 1670: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe621265c  ! 1670: STW_I	stw	%r19, [%r4 + 0x065c]
	.word 0xe2312e7c  ! 1670: STH_I	sth	%r17, [%r4 + 0x0e7c]
	.word 0xe4710005  ! 1670: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xd8210005  ! 1670: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xf4712558  ! 1670: STX_I	stx	%r26, [%r4 + 0x0558]
	.word 0xea710005  ! 1670: STX_R	stx	%r21, [%r4 + %r5]
	.word 0x1c800003  ! 1670: BPOS	bpos  	<label_0x3>
	.word 0xd6f00ce3  ! 1670: STXA_R	stxa	%r11, [%r0 + %r3] 0x67
	.word 0xe2290005  ! 1679: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc210005  ! 1679: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xe2312d64  ! 1679: STH_I	sth	%r17, [%r4 + 0x0d64]
	.word 0xea712178  ! 1679: STX_I	stx	%r21, [%r4 + 0x0178]
	.word 0xd4312540  ! 1679: STH_I	sth	%r10, [%r4 + 0x0540]
	.word 0xfa2125d8  ! 1679: STW_I	stw	%r29, [%r4 + 0x05d8]
	.word 0xe6310005  ! 1679: STH_R	sth	%r19, [%r4 + %r5]
	.word 0x1e800001  ! 1679: BVC	bvc  	<label_0x1>
	.word 0xd6f0cce1  ! 1679: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xf8290005  ! 1689: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe6290005  ! 1689: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf87128a8  ! 1689: STX_I	stx	%r28, [%r4 + 0x08a8]
	.word 0xfe290005  ! 1689: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe6290005  ! 1689: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd8310005  ! 1689: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xda212064  ! 1689: STW_I	stw	%r13, [%r4 + 0x0064]
	.word 0xe4312bea  ! 1689: STH_I	sth	%r18, [%r4 + 0x0bea]
	.word 0x08800003  ! 1689: BLEU	bleu  	<label_0x3>
	.word 0xec712b58  ! 1689: STX_I	stx	%r22, [%r4 + 0x0b58]
	.word 0xec290005  ! 1698: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfe7129d8  ! 1698: STX_I	stx	%r31, [%r4 + 0x09d8]
	.word 0xec710005  ! 1698: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xe2290005  ! 1698: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe8292f82  ! 1698: STB_I	stb	%r20, [%r4 + 0x0f82]
	.word 0xf4210005  ! 1698: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xde710005  ! 1698: STX_R	stx	%r15, [%r4 + %r5]
	.word 0x2a800001  ! 1698: BCS	bcs,a	<label_0x1>
	.word 0xd6f08ce2  ! 1698: STXA_R	stxa	%r11, [%r2 + %r2] 0x67
	.word 0xf6290005  ! 1707: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xd63124f2  ! 1707: STH_I	sth	%r11, [%r4 + 0x04f2]
	.word 0xd6312ae0  ! 1707: STH_I	sth	%r11, [%r4 + 0x0ae0]
	.word 0xdc212b70  ! 1707: STW_I	stw	%r14, [%r4 + 0x0b70]
	.word 0xee310005  ! 1707: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf4710005  ! 1707: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xe6712980  ! 1707: STX_I	stx	%r19, [%r4 + 0x0980]
	.word 0x20800003  ! 1707: BN	bn,a	<label_0x3>
	.word 0xd8212a10  ! 1707: STW_I	stw	%r12, [%r4 + 0x0a10]
	.word 0xda290005  ! 1716: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfe210005  ! 1716: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xd6310005  ! 1716: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe431286e  ! 1716: STH_I	sth	%r18, [%r4 + 0x086e]
	.word 0xe6292c18  ! 1716: STB_I	stb	%r19, [%r4 + 0x0c18]
	.word 0xf2212ee0  ! 1716: STW_I	stw	%r25, [%r4 + 0x0ee0]
	.word 0xee7122e8  ! 1716: STX_I	stx	%r23, [%r4 + 0x02e8]
	.word 0x1e800003  ! 1716: BVC	bvc  	<label_0x3>
	.word 0xeff12005  ! 1716: CASXA_R	casxa	[%r4]%asi, %r5, %r23
	.word 0xde290005  ! 1726: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfe710005  ! 1726: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xf4712cb8  ! 1726: STX_I	stx	%r26, [%r4 + 0x0cb8]
	.word 0xfc2126dc  ! 1726: STW_I	stw	%r30, [%r4 + 0x06dc]
	.word 0xe2712110  ! 1726: STX_I	stx	%r17, [%r4 + 0x0110]
	.word 0xe4310005  ! 1726: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf631235e  ! 1726: STH_I	sth	%r27, [%r4 + 0x035e]
	.word 0xfc710005  ! 1726: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x22c10001  ! 1726: BRZ	brz,a,nt	%4,<label_0x10001>
	.word 0xe3f12005  ! 1726: CASXA_R	casxa	[%r4]%asi, %r5, %r17
	.word 0xfe290005  ! 1735: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe4292510  ! 1735: STB_I	stb	%r18, [%r4 + 0x0510]
	.word 0xfc710005  ! 1735: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xec712cc0  ! 1735: STX_I	stx	%r22, [%r4 + 0x0cc0]
	.word 0xf6710005  ! 1735: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xf22928bc  ! 1735: STB_I	stb	%r25, [%r4 + 0x08bc]
	.word 0xdc310005  ! 1735: STH_R	sth	%r14, [%r4 + %r5]
	.word 0x22800001  ! 1735: BE	be,a	<label_0x1>
	.word 0xd8f08969  ! 1735: STXA_R	stxa	%r12, [%r2 + %r9] 0x4b
	.word 0xfa290005  ! 1744: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xea310005  ! 1744: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xe6210005  ! 1744: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xea210005  ! 1744: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xe8310005  ! 1744: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf2310005  ! 1744: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xf4712ee8  ! 1744: STX_I	stx	%r26, [%r4 + 0x0ee8]
	.word 0x3a800003  ! 1744: BCC	bcc,a	<label_0x3>
	.word 0xe3210005  ! 1744: STF_R	st	%f17, [%r5, %r4]
	.word 0xe2290005  ! 1753: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe0210005  ! 1753: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xda310005  ! 1753: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xf0212ad8  ! 1753: STW_I	stw	%r24, [%r4 + 0x0ad8]
	.word 0xdc710005  ! 1753: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf8710005  ! 1753: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf4310005  ! 1753: STH_R	sth	%r26, [%r4 + %r5]
	.word 0x24800001  ! 1753: BLE	ble,a	<label_0x1>
	.word 0xd6f0c987  ! 1753: STXA_R	stxa	%r11, [%r3 + %r7] 0x4c
	.word 0xe2290005  ! 1763: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe0712320  ! 1763: STX_I	stx	%r16, [%r4 + 0x0320]
	.word 0xee292d88  ! 1763: STB_I	stb	%r23, [%r4 + 0x0d88]
	.word 0xfe3124fe  ! 1763: STH_I	sth	%r31, [%r4 + 0x04fe]
	.word 0xe0290005  ! 1763: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xec210005  ! 1763: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xde710005  ! 1763: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xea292d0a  ! 1763: STB_I	stb	%r21, [%r4 + 0x0d0a]
	.word 0x40000001  ! 1763: CALL	call	disp30_1
	.word 0xf8f92ee8  ! 1763: SWAPA_I	swapa	%r28, [%r4 + 0x0ee8] %asi
	.word 0xfe290005  ! 1772: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xd42125d8  ! 1772: STW_I	stw	%r10, [%r4 + 0x05d8]
	.word 0xf2710005  ! 1772: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xe0210005  ! 1772: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xfa710005  ! 1772: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xd821286c  ! 1772: STW_I	stw	%r12, [%r4 + 0x086c]
	.word 0xf2312062  ! 1772: STH_I	sth	%r25, [%r4 + 0x0062]
	.word 0x24800003  ! 1772: BLE	ble,a	<label_0x3>
	.word 0xe0b91005  ! 1772: STDA_R	stda	%r16, [%r4 + %r5] 0x80
	.word 0xd4290005  ! 1781: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe63128e6  ! 1781: STH_I	sth	%r19, [%r4 + 0x08e6]
	.word 0xe0310005  ! 1781: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xe2210005  ! 1781: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xe8290005  ! 1781: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf27127f0  ! 1781: STX_I	stx	%r25, [%r4 + 0x07f0]
	.word 0xec710005  ! 1781: STX_R	stx	%r22, [%r4 + %r5]
	.word 0x0ac90001  ! 1781: BRNZ	brnz  ,pt	%4,<label_0x90001>
	.word 0xd6f0cce1  ! 1781: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xe2290005  ! 1791: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf07123d8  ! 1791: STX_I	stx	%r24, [%r4 + 0x03d8]
	.word 0xf6290005  ! 1791: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe6710005  ! 1791: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe631274c  ! 1791: STH_I	sth	%r19, [%r4 + 0x074c]
	.word 0xfa312142  ! 1791: STH_I	sth	%r29, [%r4 + 0x0142]
	.word 0xde31260e  ! 1791: STH_I	sth	%r15, [%r4 + 0x060e]
	.word 0xf42923b8  ! 1791: STB_I	stb	%r26, [%r4 + 0x03b8]
	.word 0x0cc90001  ! 1791: BRGZ	brgz  ,pt	%4,<label_0x90001>
	.word 0xf1210005  ! 1791: STF_R	st	%f24, [%r5, %r4]
	.word 0xf8290005  ! 1800: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd67120a0  ! 1800: STX_I	stx	%r11, [%r4 + 0x00a0]
	.word 0xe421240c  ! 1800: STW_I	stw	%r18, [%r4 + 0x040c]
	.word 0xe6310005  ! 1800: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xec710005  ! 1800: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xf6712420  ! 1800: STX_I	stx	%r27, [%r4 + 0x0420]
	.word 0xfc312c04  ! 1800: STH_I	sth	%r30, [%r4 + 0x0c04]
	.word 0x3a800001  ! 1800: BCC	bcc,a	<label_0x1>
	.word 0xf679220c  ! 1800: SWAP_I	swap	%r27, [%r4 + 0x020c]
	.word 0xf6290005  ! 1809: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xdc710005  ! 1809: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf4210005  ! 1809: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xde2121d0  ! 1809: STW_I	stw	%r15, [%r4 + 0x01d0]
	.word 0xd4310005  ! 1809: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xe0710005  ! 1809: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd4310005  ! 1809: STH_R	sth	%r10, [%r4 + %r5]
	.word 0x3e800001  ! 1809: BVC	bvc,a	<label_0x1>
	.word 0xd6f24989  ! 1809: STXA_R	stxa	%r11, [%r9 + %r9] 0x4c
	.word 0xee290005  ! 1819: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd6290005  ! 1819: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xde212154  ! 1819: STW_I	stw	%r15, [%r4 + 0x0154]
	.word 0xfa712a10  ! 1819: STX_I	stx	%r29, [%r4 + 0x0a10]
	.word 0xe82129c4  ! 1819: STW_I	stw	%r20, [%r4 + 0x09c4]
	.word 0xe2292ea7  ! 1819: STB_I	stb	%r17, [%r4 + 0x0ea7]
	.word 0xfe210005  ! 1819: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xea290005  ! 1819: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x06c10001  ! 1819: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xfb392728  ! 1819: STDF_I	std	%f29, [0x0728, %r4]
	.word 0xd4290005  ! 1828: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe8310005  ! 1828: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xdc210005  ! 1828: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xfe292a72  ! 1828: STB_I	stb	%r31, [%r4 + 0x0a72]
	.word 0xec712600  ! 1828: STX_I	stx	%r22, [%r4 + 0x0600]
	.word 0xdc712830  ! 1828: STX_I	stx	%r14, [%r4 + 0x0830]
	.word 0xf821225c  ! 1828: STW_I	stw	%r28, [%r4 + 0x025c]
	.word 0x22c90001  ! 1828: BRZ	brz,a,pt	%4,<label_0x90001>
	.word 0xd6f24ce3  ! 1828: STXA_R	stxa	%r11, [%r9 + %r3] 0x67
	.word 0xfa290005  ! 1837: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd63124e6  ! 1837: STH_I	sth	%r11, [%r4 + 0x04e6]
	.word 0xe2310005  ! 1837: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xec2129bc  ! 1837: STW_I	stw	%r22, [%r4 + 0x09bc]
	.word 0xfa290005  ! 1837: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf8712158  ! 1837: STX_I	stx	%r28, [%r4 + 0x0158]
	.word 0xfe310005  ! 1837: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x2cc10001  ! 1837: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xe2312d3e  ! 1837: STH_I	sth	%r17, [%r4 + 0x0d3e]
	.word 0xda290005  ! 1846: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xde290005  ! 1846: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc290005  ! 1846: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xde312a48  ! 1846: STH_I	sth	%r15, [%r4 + 0x0a48]
	.word 0xfe290005  ! 1846: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe02922c4  ! 1846: STB_I	stb	%r16, [%r4 + 0x02c4]
	.word 0xd8210005  ! 1846: STW_R	stw	%r12, [%r4 + %r5]
	.word 0x2cc10001  ! 1846: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd8f08983  ! 1846: STXA_R	stxa	%r12, [%r2 + %r3] 0x4c
	.word 0xe8290005  ! 1855: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf8312c54  ! 1855: STH_I	sth	%r28, [%r4 + 0x0c54]
	.word 0xda712998  ! 1855: STX_I	stx	%r13, [%r4 + 0x0998]
	.word 0xe4710005  ! 1855: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe6310005  ! 1855: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xfa312fa6  ! 1855: STH_I	sth	%r29, [%r4 + 0x0fa6]
	.word 0xdc310005  ! 1855: STH_R	sth	%r14, [%r4 + %r5]
	.word 0x0ec10001  ! 1855: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xf8b12eb4  ! 1855: STHA_I	stha	%r28, [%r4 + 0x0eb4] %asi
	.word 0xec290005  ! 1864: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4290005  ! 1864: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd4292dda  ! 1864: STB_I	stb	%r10, [%r4 + 0x0dda]
	.word 0xfe710005  ! 1864: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe6212658  ! 1864: STW_I	stw	%r19, [%r4 + 0x0658]
	.word 0xd6292bb4  ! 1864: STB_I	stb	%r11, [%r4 + 0x0bb4]
	.word 0xde292f37  ! 1864: STB_I	stb	%r15, [%r4 + 0x0f37]
	.word 0x26c10003  ! 1864: BRLZ	brlz,a,nt	%4,<label_0x10003>
	.word 0xeca1283c  ! 1864: STWA_I	stwa	%r22, [%r4 + 0x083c] %asi
	.word 0xda290005  ! 1873: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd42124c0  ! 1873: STW_I	stw	%r10, [%r4 + 0x04c0]
	.word 0xe8712db8  ! 1873: STX_I	stx	%r20, [%r4 + 0x0db8]
	.word 0xf82120c4  ! 1873: STW_I	stw	%r28, [%r4 + 0x00c4]
	.word 0xfc712a88  ! 1873: STX_I	stx	%r30, [%r4 + 0x0a88]
	.word 0xfa290005  ! 1873: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf8290005  ! 1873: STB_R	stb	%r28, [%r4 + %r5]
	.word 0x2cc10001  ! 1873: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd6f24ce0  ! 1873: STXA_R	stxa	%r11, [%r9 + %r0] 0x67
	.word 0xf8290005  ! 1882: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf27123e0  ! 1882: STX_I	stx	%r25, [%r4 + 0x03e0]
	.word 0xf8310005  ! 1882: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf8312540  ! 1882: STH_I	sth	%r28, [%r4 + 0x0540]
	.word 0xdc312574  ! 1882: STH_I	sth	%r14, [%r4 + 0x0574]
	.word 0xe0290005  ! 1882: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf0210005  ! 1882: STW_R	stw	%r24, [%r4 + %r5]
	.word 0x22800001  ! 1882: BE	be,a	<label_0x1>
	.word 0xd8b11005  ! 1882: STHA_R	stha	%r12, [%r4 + %r5] 0x80
	.word 0xd6290005  ! 1891: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe6292e93  ! 1891: STB_I	stb	%r19, [%r4 + 0x0e93]
	.word 0xee212e3c  ! 1891: STW_I	stw	%r23, [%r4 + 0x0e3c]
	.word 0xe829270d  ! 1891: STB_I	stb	%r20, [%r4 + 0x070d]
	.word 0xf22122bc  ! 1891: STW_I	stw	%r25, [%r4 + 0x02bc]
	.word 0xf6210005  ! 1891: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xe8312de0  ! 1891: STH_I	sth	%r20, [%r4 + 0x0de0]
	.word 0x04c10003  ! 1891: BRLEZ	brlez  ,nt	%4,<label_0x10003>
	.word 0xd8f08980  ! 1891: STXA_R	stxa	%r12, [%r2 + %r0] 0x4c
	.word 0xe0290005  ! 1900: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe07126e8  ! 1900: STX_I	stx	%r16, [%r4 + 0x06e8]
	.word 0xe0712fb8  ! 1900: STX_I	stx	%r16, [%r4 + 0x0fb8]
	.word 0xd8210005  ! 1900: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe6290005  ! 1900: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe4290005  ! 1900: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd6712b08  ! 1900: STX_I	stx	%r11, [%r4 + 0x0b08]
	.word 0x26800003  ! 1900: BL	bl,a	<label_0x3>
	.word 0xd6f18ce0  ! 1900: STXA_R	stxa	%r11, [%r6 + %r0] 0x67
	.word 0xf4290005  ! 1910: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xea712a90  ! 1910: STX_I	stx	%r21, [%r4 + 0x0a90]
	.word 0xf4310005  ! 1910: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xf4712a58  ! 1910: STX_I	stx	%r26, [%r4 + 0x0a58]
	.word 0xe6210005  ! 1910: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xf6312dc4  ! 1910: STH_I	sth	%r27, [%r4 + 0x0dc4]
	.word 0xe4210005  ! 1910: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xee212900  ! 1910: STW_I	stw	%r23, [%r4 + 0x0900]
	.word 0x3a800003  ! 1910: BCC	bcc,a	<label_0x3>
	.word 0xeaa11005  ! 1910: STWA_R	stwa	%r21, [%r4 + %r5] 0x80
	.word 0xf2290005  ! 1920: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe0312ffa  ! 1920: STH_I	sth	%r16, [%r4 + 0x0ffa]
	.word 0xd67121a8  ! 1920: STX_I	stx	%r11, [%r4 + 0x01a8]
	.word 0xfa290005  ! 1920: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xdc312f20  ! 1920: STH_I	sth	%r14, [%r4 + 0x0f20]
	.word 0xf62125f0  ! 1920: STW_I	stw	%r27, [%r4 + 0x05f0]
	.word 0xd62928b2  ! 1920: STB_I	stb	%r11, [%r4 + 0x08b2]
	.word 0xfe212370  ! 1920: STW_I	stw	%r31, [%r4 + 0x0370]
	.word 0x3e800003  ! 1920: BVC	bvc,a	<label_0x3>
	.word 0xfc310005  ! 1920: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xfa290005  ! 1929: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe0290005  ! 1929: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfc292f68  ! 1929: STB_I	stb	%r30, [%r4 + 0x0f68]
	.word 0xd8210005  ! 1929: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe8290005  ! 1929: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd6710005  ! 1929: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xf8292b99  ! 1929: STB_I	stb	%r28, [%r4 + 0x0b99]
	.word 0x06800001  ! 1929: BL	bl  	<label_0x1>
	.word 0xd4f91005  ! 1929: SWAPA_R	swapa	%r10, [%r4 + %r5] 0x80
	.word 0xde290005  ! 1938: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf0212c70  ! 1938: STW_I	stw	%r24, [%r4 + 0x0c70]
	.word 0xe2290005  ! 1938: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xea710005  ! 1938: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf2290005  ! 1938: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfe312210  ! 1938: STH_I	sth	%r31, [%r4 + 0x0210]
	.word 0xfe310005  ! 1938: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x34800001  ! 1938: BG	bg,a	<label_0x1>
	.word 0xd6f08982  ! 1938: STXA_R	stxa	%r11, [%r2 + %r2] 0x4c
	.word 0xea290005  ! 1948: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xdc710005  ! 1948: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xfe710005  ! 1948: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xde212544  ! 1948: STW_I	stw	%r15, [%r4 + 0x0544]
	.word 0xe4290005  ! 1948: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xdc210005  ! 1948: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xe8290005  ! 1948: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe0710005  ! 1948: STX_R	stx	%r16, [%r4 + %r5]
	.word 0x28800001  ! 1948: BLEU	bleu,a	<label_0x1>
	.word 0xd6f0c981  ! 1948: STXA_R	stxa	%r11, [%r3 + %r1] 0x4c
	.word 0xee290005  ! 1957: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xea210005  ! 1957: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xe8710005  ! 1957: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xea292c75  ! 1957: STB_I	stb	%r21, [%r4 + 0x0c75]
	.word 0xdc2123d4  ! 1957: STW_I	stw	%r14, [%r4 + 0x03d4]
	.word 0xda312800  ! 1957: STH_I	sth	%r13, [%r4 + 0x0800]
	.word 0xd6292fb1  ! 1957: STB_I	stb	%r11, [%r4 + 0x0fb1]
	.word 0x3a800003  ! 1957: BCC	bcc,a	<label_0x3>
	.word 0xd8e91005  ! 1957: LDSTUBA_R	ldstuba	%r12, [%r4 + %r5] 0x80
	.word 0xfc290005  ! 1966: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfc2129c0  ! 1966: STW_I	stw	%r30, [%r4 + 0x09c0]
	.word 0xe8312a3e  ! 1966: STH_I	sth	%r20, [%r4 + 0x0a3e]
	.word 0xd4210005  ! 1966: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe821205c  ! 1966: STW_I	stw	%r20, [%r4 + 0x005c]
	.word 0xf2310005  ! 1966: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xd6712010  ! 1966: STX_I	stx	%r11, [%r4 + 0x0010]
	.word 0x18800001  ! 1966: BGU	bgu  	<label_0x1>
	.word 0xe02129b0  ! 1966: STW_I	stw	%r16, [%r4 + 0x09b0]
	.word 0xd6290005  ! 1975: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xea710005  ! 1975: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xde310005  ! 1975: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xd4712430  ! 1975: STX_I	stx	%r10, [%r4 + 0x0430]
	.word 0xd6310005  ! 1975: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xf03124e2  ! 1975: STH_I	sth	%r24, [%r4 + 0x04e2]
	.word 0xd4710005  ! 1975: STX_R	stx	%r10, [%r4 + %r5]
	.word 0x36800003  ! 1975: BGE	bge,a	<label_0x3>
	.word 0xd6f24980  ! 1975: STXA_R	stxa	%r11, [%r9 + %r0] 0x4c
	.word 0xf8290005  ! 1985: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xdc292f77  ! 1985: STB_I	stb	%r14, [%r4 + 0x0f77]
	.word 0xfa210005  ! 1985: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd8312be0  ! 1985: STH_I	sth	%r12, [%r4 + 0x0be0]
	.word 0xe4290005  ! 1985: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xfe210005  ! 1985: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xf63121de  ! 1985: STH_I	sth	%r27, [%r4 + 0x01de]
	.word 0xe62926e4  ! 1985: STB_I	stb	%r19, [%r4 + 0x06e4]
	.word 0x24c10001  ! 1985: BRLEZ	brlez,a,nt	%4,<label_0x10001>
	.word 0xd8f24983  ! 1985: STXA_R	stxa	%r12, [%r9 + %r3] 0x4c
	.word 0xf0290005  ! 1995: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfc212af0  ! 1995: STW_I	stw	%r30, [%r4 + 0x0af0]
	.word 0xea710005  ! 1995: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xee292c36  ! 1995: STB_I	stb	%r23, [%r4 + 0x0c36]
	.word 0xf8212284  ! 1995: STW_I	stw	%r28, [%r4 + 0x0284]
	.word 0xe4712488  ! 1995: STX_I	stx	%r18, [%r4 + 0x0488]
	.word 0xd4210005  ! 1995: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xec292e94  ! 1995: STB_I	stb	%r22, [%r4 + 0x0e94]
	.word 0x36800001  ! 1995: BGE	bge,a	<label_0x1>
	.word 0xd6f00968  ! 1995: STXA_R	stxa	%r11, [%r0 + %r8] 0x4b
        ta      T_GOOD_TRAP
	nop
	nop

th_main_3:
	setx  0x30cf1522026b2f10, %r1, %r1
	setx  0xfe4a009c096a4670, %r1, %r2
	setx  0xac967b8c0fc1f3a0, %r1, %r3
	setx  0xe49b5eaf0c523ef8, %r1, %r6
	setx  0xb7aa3a9c0b3022a8, %r1, %r7
	setx  0xede4623107053eb8, %r1, %r8
	setx  0x76498c5801cdb220, %r1, %r9
	setx  0xdcf82fd07abb1abe, %r1, %r13
	setx  0x24e46b908d39aff4, %r1, %r14
	setx  0xef0c6320a819ad10, %r1, %r15
	setx  0x79eb0a80b428f5ab, %r1, %r16
	setx  0xf92fc6c027cc8121, %r1, %r17
	setx  0x16dba1a0d11e3614, %r1, %r18
	setx  0x25ef1f20a2dce480, %r1, %r19
	setx  0x47f609e089ead2b5, %r1, %r20
	setx  0xf9f248b035e76a0a, %r1, %r21
	setx  0x8f1677405a1310f2, %r1, %r22
	setx  0xa89b239095669980, %r1, %r23
	setx  0x52c6fb1085867705, %r1, %r24
	setx  0x4130c9108675dcda, %r1, %r25
	setx  0xfae60f506a96828d, %r1, %r26
	setx  0xccb67c30b17caeab, %r1, %r27
	setx  0x15354f902e9374c6, %r1, %r28
	setx  0xe280e80083bf03eb, %r1, %r29
	setx  0xda089f3020abf47e, %r1, %r30
	setx  0x7bcfb9d0bc63dc07, %r1, %r31
	setx  0x2547797ed27d2570, %r1, %r13
	setx  0xb000ff527d8d8a97, %r1, %r14
	setx  0xf2ac44b34a95c892, %r1, %r15
	setx  0x6c7d0f3a7f4adea0, %r1, %r16
	setx  0xe626b1e5f5e24a44, %r1, %r17
	setx  0x075c9e9bbc05d0cc, %r1, %r18
	setx  0x7e29676252fb94a0, %r1, %r19
	setx  0xab5964de48164ec0, %r1, %r20
	setx  0x367d41095e43c0be, %r1, %r21
	setx  0xa95fa457180e688d, %r1, %r22
	setx  0x1b2f197aa85f8368, %r1, %r23
	setx  0xaea5826252c8fbfc, %r1, %r24
	setx  0xb72e34ed479848b0, %r1, %r25
	setx  0x44d02635314bfd71, %r1, %r26
	setx  0x54cea11c1c669d05, %r1, %r27
	setx  0xd83841cdfed24c54, %r1, %r28
	setx  0x6aa32d0e64f69eb3, %r1, %r29
	setx  0x4c62a39fde1086a5, %r1, %r30
	setx  0x5fe7f10ace511051, %r1, %r31
	setx  MAIN_BASE_DATA_VA, %r1, %r4
	setx  0x0000000000000d00, %r1, %r5
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
	setx  0x80, %r2, %r1
	wr  %r1, %r0, %asi
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xfc290005  ! 12: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf8710005  ! 12: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xf63124ac  ! 12: STH_I	sth	%r27, [%r4 + 0x04ac]
	.word 0xf2210005  ! 12: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xee210005  ! 12: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfc312ca8  ! 12: STH_I	sth	%r30, [%r4 + 0x0ca8]
	.word 0xf0212a60  ! 12: STW_I	stw	%r24, [%r4 + 0x0a60]
	.word 0xf229224b  ! 12: STB_I	stb	%r25, [%r4 + 0x024b]
	.word 0x26800001  ! 12: BL	bl,a	<label_0x1>
	.word 0xd8f18ce7  ! 12: STXA_R	stxa	%r12, [%r6 + %r7] 0x67
	.word 0xfc290005  ! 22: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf8290005  ! 22: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xdc210005  ! 22: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xda312cb0  ! 22: STH_I	sth	%r13, [%r4 + 0x0cb0]
	.word 0xe4312750  ! 22: STH_I	sth	%r18, [%r4 + 0x0750]
	.word 0xfc292683  ! 22: STB_I	stb	%r30, [%r4 + 0x0683]
	.word 0xec210005  ! 22: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xf6312d20  ! 22: STH_I	sth	%r27, [%r4 + 0x0d20]
	.word 0x06800003  ! 22: BL	bl  	<label_0x3>
	.word 0xd6f1c987  ! 22: STXA_R	stxa	%r11, [%r7 + %r7] 0x4c
	.word 0xf4290005  ! 32: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xea310005  ! 32: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xfc712308  ! 32: STX_I	stx	%r30, [%r4 + 0x0308]
	.word 0xd8310005  ! 32: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xd4310005  ! 32: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xee712648  ! 32: STX_I	stx	%r23, [%r4 + 0x0648]
	.word 0xd8312b2a  ! 32: STH_I	sth	%r12, [%r4 + 0x0b2a]
	.word 0xda210005  ! 32: STW_R	stw	%r13, [%r4 + %r5]
	.word 0x06c10003  ! 32: BRLZ	brlz  ,nt	%4,<label_0x10003>
	.word 0xe2312602  ! 32: STH_I	sth	%r17, [%r4 + 0x0602]
	.word 0xe4290005  ! 41: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xdc710005  ! 41: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xd829232e  ! 41: STB_I	stb	%r12, [%r4 + 0x032e]
	.word 0xf62925b0  ! 41: STB_I	stb	%r27, [%r4 + 0x05b0]
	.word 0xe6712f98  ! 41: STX_I	stx	%r19, [%r4 + 0x0f98]
	.word 0xf4290005  ! 41: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf2212788  ! 41: STW_I	stw	%r25, [%r4 + 0x0788]
	.word 0x0ec90001  ! 41: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xd6f08982  ! 41: STXA_R	stxa	%r11, [%r2 + %r2] 0x4c
	.word 0xfc290005  ! 50: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd4712d30  ! 50: STX_I	stx	%r10, [%r4 + 0x0d30]
	.word 0xde710005  ! 50: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xfc212370  ! 50: STW_I	stw	%r30, [%r4 + 0x0370]
	.word 0xd6212d54  ! 50: STW_I	stw	%r11, [%r4 + 0x0d54]
	.word 0xf0710005  ! 50: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xea312554  ! 50: STH_I	sth	%r21, [%r4 + 0x0554]
	.word 0x04800001  ! 50: BLE	ble  	<label_0x1>
	.word 0xe87125c8  ! 50: STX_I	stx	%r20, [%r4 + 0x05c8]
	.word 0xf6290005  ! 59: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xea2923eb  ! 59: STB_I	stb	%r21, [%r4 + 0x03eb]
	.word 0xe0710005  ! 59: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xdc290005  ! 59: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xee29234c  ! 59: STB_I	stb	%r23, [%r4 + 0x034c]
	.word 0xe67121e8  ! 59: STX_I	stx	%r19, [%r4 + 0x01e8]
	.word 0xf2712fc8  ! 59: STX_I	stx	%r25, [%r4 + 0x0fc8]
	.word 0x3e800003  ! 59: BVC	bvc,a	<label_0x3>
	.word 0xe8f91005  ! 59: SWAPA_R	swapa	%r20, [%r4 + %r5] 0x80
	.word 0xe2290005  ! 68: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf0710005  ! 68: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xea3126d2  ! 68: STH_I	sth	%r21, [%r4 + 0x06d2]
	.word 0xda312b08  ! 68: STH_I	sth	%r13, [%r4 + 0x0b08]
	.word 0xf2292e02  ! 68: STB_I	stb	%r25, [%r4 + 0x0e02]
	.word 0xe8710005  ! 68: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xe2210005  ! 68: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x30800003  ! 68: BA	ba,a	<label_0x3>
	.word 0xd6f00962  ! 68: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
	.word 0xf6290005  ! 77: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf6312c76  ! 77: STH_I	sth	%r27, [%r4 + 0x0c76]
	.word 0xe6310005  ! 77: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xfc312700  ! 77: STH_I	sth	%r30, [%r4 + 0x0700]
	.word 0xfc312ed6  ! 77: STH_I	sth	%r30, [%r4 + 0x0ed6]
	.word 0xfc210005  ! 77: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xe6290005  ! 77: STB_R	stb	%r19, [%r4 + %r5]
	.word 0x14800003  ! 77: BG	bg  	<label_0x3>
	.word 0xd6f0cce1  ! 77: STXA_R	stxa	%r11, [%r3 + %r1] 0x67
	.word 0xec290005  ! 86: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xda290005  ! 86: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xde312206  ! 86: STH_I	sth	%r15, [%r4 + 0x0206]
	.word 0xfa290005  ! 86: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe6712a78  ! 86: STX_I	stx	%r19, [%r4 + 0x0a78]
	.word 0xd4290005  ! 86: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfe212c28  ! 86: STW_I	stw	%r31, [%r4 + 0x0c28]
	.word 0x06c10001  ! 86: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd8f20ce6  ! 86: STXA_R	stxa	%r12, [%r8 + %r6] 0x67
	.word 0xde290005  ! 96: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xda292323  ! 96: STB_I	stb	%r13, [%r4 + 0x0323]
	.word 0xf4290005  ! 96: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xea710005  ! 96: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xfc312f1a  ! 96: STH_I	sth	%r30, [%r4 + 0x0f1a]
	.word 0xd6290005  ! 96: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe8212a18  ! 96: STW_I	stw	%r20, [%r4 + 0x0a18]
	.word 0xd6312d38  ! 96: STH_I	sth	%r11, [%r4 + 0x0d38]
	.word 0x38800003  ! 96: BGU	bgu,a	<label_0x3>
	.word 0xe4b91005  ! 96: STDA_R	stda	%r18, [%r4 + %r5] 0x80
	.word 0xfe290005  ! 105: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xdc210005  ! 105: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xe0212d88  ! 105: STW_I	stw	%r16, [%r4 + 0x0d88]
	.word 0xec310005  ! 105: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xf4290005  ! 105: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe2310005  ! 105: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xfa290005  ! 105: STB_R	stb	%r29, [%r4 + %r5]
	.word 0x3c800003  ! 105: BPOS	bpos,a	<label_0x3>
	.word 0xd6f0c962  ! 105: STXA_R	stxa	%r11, [%r3 + %r2] 0x4b
	.word 0xe0290005  ! 114: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf6310005  ! 114: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf2310005  ! 114: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xf8212014  ! 114: STW_I	stw	%r28, [%r4 + 0x0014]
	.word 0xf2290005  ! 114: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe2210005  ! 114: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xfc3123fc  ! 114: STH_I	sth	%r30, [%r4 + 0x03fc]
	.word 0x06c10001  ! 114: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xef210005  ! 114: STF_R	st	%f23, [%r5, %r4]
	.word 0xf0290005  ! 123: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xea290005  ! 123: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe6710005  ! 123: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe6290005  ! 123: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xea292ca9  ! 123: STB_I	stb	%r21, [%r4 + 0x0ca9]
	.word 0xf2310005  ! 123: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xf6710005  ! 123: STX_R	stx	%r27, [%r4 + %r5]
	.word 0x3e800001  ! 123: BVC	bvc,a	<label_0x1>
	.word 0xdb210005  ! 123: STF_R	st	%f13, [%r5, %r4]
	.word 0xec290005  ! 133: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfc310005  ! 133: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xf27125f8  ! 133: STX_I	stx	%r25, [%r4 + 0x05f8]
	.word 0xfa290005  ! 133: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xdc210005  ! 133: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xe2310005  ! 133: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xf4712ec0  ! 133: STX_I	stx	%r26, [%r4 + 0x0ec0]
	.word 0xe22925e1  ! 133: STB_I	stb	%r17, [%r4 + 0x05e1]
	.word 0x2a800001  ! 133: BCS	bcs,a	<label_0x1>
	.word 0xf2b12b98  ! 133: STHA_I	stha	%r25, [%r4 + 0x0b98] %asi
	.word 0xe6290005  ! 143: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xee290005  ! 143: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfe292d53  ! 143: STB_I	stb	%r31, [%r4 + 0x0d53]
	.word 0xee7123d0  ! 143: STX_I	stx	%r23, [%r4 + 0x03d0]
	.word 0xe8210005  ! 143: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xf6712ad8  ! 143: STX_I	stx	%r27, [%r4 + 0x0ad8]
	.word 0xf4212368  ! 143: STW_I	stw	%r26, [%r4 + 0x0368]
	.word 0xfe2120e4  ! 143: STW_I	stw	%r31, [%r4 + 0x00e4]
	.word 0x3e800001  ! 143: BVC	bvc,a	<label_0x1>
	.word 0xd6f04ce7  ! 143: STXA_R	stxa	%r11, [%r1 + %r7] 0x67
	.word 0xe4290005  ! 153: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xea710005  ! 153: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xea212e94  ! 153: STW_I	stw	%r21, [%r4 + 0x0e94]
	.word 0xee710005  ! 153: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe2712f68  ! 153: STX_I	stx	%r17, [%r4 + 0x0f68]
	.word 0xec710005  ! 153: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xdc710005  ! 153: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xee712518  ! 153: STX_I	stx	%r23, [%r4 + 0x0518]
	.word 0x28800001  ! 153: BLEU	bleu,a	<label_0x1>
	.word 0xd6f0c967  ! 153: STXA_R	stxa	%r11, [%r3 + %r7] 0x4b
	.word 0xee290005  ! 162: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xdc312072  ! 162: STH_I	sth	%r14, [%r4 + 0x0072]
	.word 0xee710005  ! 162: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xda310005  ! 162: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xec21223c  ! 162: STW_I	stw	%r22, [%r4 + 0x023c]
	.word 0xf4310005  ! 162: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd4710005  ! 162: STX_R	stx	%r10, [%r4 + %r5]
	.word 0x24c90003  ! 162: BRLEZ	brlez,a,pt	%4,<label_0x90003>
	.word 0xeef12198  ! 162: STXA_I	stxa	%r23, [%r4 + 0x0198] %asi
	.word 0xee290005  ! 172: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd6212284  ! 172: STW_I	stw	%r11, [%r4 + 0x0284]
	.word 0xf8310005  ! 172: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xea210005  ! 172: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xda710005  ! 172: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xec312b62  ! 172: STH_I	sth	%r22, [%r4 + 0x0b62]
	.word 0xe221299c  ! 172: STW_I	stw	%r17, [%r4 + 0x099c]
	.word 0xfc710005  ! 172: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x3e800001  ! 172: BVC	bvc,a	<label_0x1>
	.word 0xec212cbc  ! 172: STW_I	stw	%r22, [%r4 + 0x0cbc]
	.word 0xe0290005  ! 181: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf4712b30  ! 181: STX_I	stx	%r26, [%r4 + 0x0b30]
	.word 0xf22124a4  ! 181: STW_I	stw	%r25, [%r4 + 0x04a4]
	.word 0xd4712338  ! 181: STX_I	stx	%r10, [%r4 + 0x0338]
	.word 0xfc210005  ! 181: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xec290005  ! 181: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf8312b8e  ! 181: STH_I	sth	%r28, [%r4 + 0x0b8e]
	.word 0x2ec90001  ! 181: BRGEZ	brgez,a,pt	%4,<label_0x90001>
	.word 0xf1390005  ! 181: STDF_R	std	%f24, [%r5, %r4]
	.word 0xf8290005  ! 190: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf4712de0  ! 190: STX_I	stx	%r26, [%r4 + 0x0de0]
	.word 0xec212284  ! 190: STW_I	stw	%r22, [%r4 + 0x0284]
	.word 0xde292583  ! 190: STB_I	stb	%r15, [%r4 + 0x0583]
	.word 0xda2920cd  ! 190: STB_I	stb	%r13, [%r4 + 0x00cd]
	.word 0xdc710005  ! 190: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf22127a0  ! 190: STW_I	stw	%r25, [%r4 + 0x07a0]
	.word 0x26800001  ! 190: BL	bl,a	<label_0x1>
	.word 0xefe11005  ! 190: CASA_I	casa	[%r4] 0x80, %r5, %r23
	.word 0xd4290005  ! 200: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe02923b8  ! 200: STB_I	stb	%r16, [%r4 + 0x03b8]
	.word 0xfa710005  ! 200: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe27121c8  ! 200: STX_I	stx	%r17, [%r4 + 0x01c8]
	.word 0xfa210005  ! 200: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd6310005  ! 200: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xec31250a  ! 200: STH_I	sth	%r22, [%r4 + 0x050a]
	.word 0xea312d00  ! 200: STH_I	sth	%r21, [%r4 + 0x0d00]
	.word 0x2ec10003  ! 200: BRGEZ	brgez,a,nt	%4,<label_0x10003>
	.word 0xd8f0cce7  ! 200: STXA_R	stxa	%r12, [%r3 + %r7] 0x67
	.word 0xf2290005  ! 209: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfa210005  ! 209: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd6712240  ! 209: STX_I	stx	%r11, [%r4 + 0x0240]
	.word 0xfe212694  ! 209: STW_I	stw	%r31, [%r4 + 0x0694]
	.word 0xf4210005  ! 209: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xe02120a0  ! 209: STW_I	stw	%r16, [%r4 + 0x00a0]
	.word 0xda310005  ! 209: STH_R	sth	%r13, [%r4 + %r5]
	.word 0x22800003  ! 209: BE	be,a	<label_0x3>
	.word 0xe2f11005  ! 209: STXA_R	stxa	%r17, [%r4 + %r5] 0x80
	.word 0xd8290005  ! 219: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xea31227c  ! 219: STH_I	sth	%r21, [%r4 + 0x027c]
	.word 0xe6210005  ! 219: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xd8712070  ! 219: STX_I	stx	%r12, [%r4 + 0x0070]
	.word 0xec290005  ! 219: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe8290005  ! 219: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xec710005  ! 219: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xea3126e2  ! 219: STH_I	sth	%r21, [%r4 + 0x06e2]
	.word 0x24800001  ! 219: BLE	ble,a	<label_0x1>
	.word 0xeab12a34  ! 219: STHA_I	stha	%r21, [%r4 + 0x0a34] %asi
	.word 0xfe290005  ! 229: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfc292ca5  ! 229: STB_I	stb	%r30, [%r4 + 0x0ca5]
	.word 0xe8290005  ! 229: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe0212d0c  ! 229: STW_I	stw	%r16, [%r4 + 0x0d0c]
	.word 0xd67128f0  ! 229: STX_I	stx	%r11, [%r4 + 0x08f0]
	.word 0xd4290005  ! 229: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xee290005  ! 229: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xec292e35  ! 229: STB_I	stb	%r22, [%r4 + 0x0e35]
	.word 0x08800001  ! 229: BLEU	bleu  	<label_0x1>
	.word 0xd6f04961  ! 229: STXA_R	stxa	%r11, [%r1 + %r1] 0x4b
	.word 0xf4290005  ! 238: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xde312078  ! 238: STH_I	sth	%r15, [%r4 + 0x0078]
	.word 0xe2310005  ! 238: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xda290005  ! 238: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf4712a40  ! 238: STX_I	stx	%r26, [%r4 + 0x0a40]
	.word 0xf2310005  ! 238: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xee312444  ! 238: STH_I	sth	%r23, [%r4 + 0x0444]
	.word 0x0ac10001  ! 238: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xd6f0c983  ! 238: STXA_R	stxa	%r11, [%r3 + %r3] 0x4c
	.word 0xd6290005  ! 247: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xea312b08  ! 247: STH_I	sth	%r21, [%r4 + 0x0b08]
	.word 0xfa31227a  ! 247: STH_I	sth	%r29, [%r4 + 0x027a]
	.word 0xde290005  ! 247: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc710005  ! 247: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xdc2120e0  ! 247: STW_I	stw	%r14, [%r4 + 0x00e0]
	.word 0xf4290005  ! 247: STB_R	stb	%r26, [%r4 + %r5]
	.word 0x18800001  ! 247: BGU	bgu  	<label_0x1>
	.word 0xd6f1cce6  ! 247: STXA_R	stxa	%r11, [%r7 + %r6] 0x67
	.word 0xec290005  ! 256: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xfa210005  ! 256: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf43127fe  ! 256: STH_I	sth	%r26, [%r4 + 0x07fe]
	.word 0xf0310005  ! 256: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xd63124c6  ! 256: STH_I	sth	%r11, [%r4 + 0x04c6]
	.word 0xe8212924  ! 256: STW_I	stw	%r20, [%r4 + 0x0924]
	.word 0xfc290005  ! 256: STB_R	stb	%r30, [%r4 + %r5]
	.word 0x24c10001  ! 256: BRLEZ	brlez,a,nt	%4,<label_0x10001>
	.word 0xd6f00962  ! 256: STXA_R	stxa	%r11, [%r0 + %r2] 0x4b
	.word 0xfc290005  ! 266: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd63124a8  ! 266: STH_I	sth	%r11, [%r4 + 0x04a8]
	.word 0xf4310005  ! 266: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xf6710005  ! 266: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xd8210005  ! 266: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xe8292bb9  ! 266: STB_I	stb	%r20, [%r4 + 0x0bb9]
	.word 0xe0212dac  ! 266: STW_I	stw	%r16, [%r4 + 0x0dac]
	.word 0xde310005  ! 266: STH_R	sth	%r15, [%r4 + %r5]
	.word 0x32800001  ! 266: BNE	bne,a	<label_0x1>
	.word 0xd6f0c982  ! 266: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xf0290005  ! 275: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe2292c7d  ! 275: STB_I	stb	%r17, [%r4 + 0x0c7d]
	.word 0xde2120d8  ! 275: STW_I	stw	%r15, [%r4 + 0x00d8]
	.word 0xe6290005  ! 275: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xea710005  ! 275: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xe4210005  ! 275: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xd6710005  ! 275: STX_R	stx	%r11, [%r4 + %r5]
	.word 0x1a800001  ! 275: BCC	bcc  	<label_0x1>
	.word 0xd8f08969  ! 275: STXA_R	stxa	%r12, [%r2 + %r9] 0x4b
	.word 0xf2290005  ! 284: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe0712e18  ! 284: STX_I	stx	%r16, [%r4 + 0x0e18]
	.word 0xe6212bc4  ! 284: STW_I	stw	%r19, [%r4 + 0x0bc4]
	.word 0xec210005  ! 284: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xd6310005  ! 284: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xea292dee  ! 284: STB_I	stb	%r21, [%r4 + 0x0dee]
	.word 0xe0312676  ! 284: STH_I	sth	%r16, [%r4 + 0x0676]
	.word 0x18800001  ! 284: BGU	bgu  	<label_0x1>
	.word 0xf1210005  ! 284: STF_R	st	%f24, [%r5, %r4]
	.word 0xf2290005  ! 294: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd4712dd0  ! 294: STX_I	stx	%r10, [%r4 + 0x0dd0]
	.word 0xe2712ca0  ! 294: STX_I	stx	%r17, [%r4 + 0x0ca0]
	.word 0xe6310005  ! 294: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xf8312c74  ! 294: STH_I	sth	%r28, [%r4 + 0x0c74]
	.word 0xf0210005  ! 294: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf8292493  ! 294: STB_I	stb	%r28, [%r4 + 0x0493]
	.word 0xfa712850  ! 294: STX_I	stx	%r29, [%r4 + 0x0850]
	.word 0x20800001  ! 294: BN	bn,a	<label_0x1>
	.word 0xd6f0c989  ! 294: STXA_R	stxa	%r11, [%r3 + %r9] 0x4c
	.word 0xf6290005  ! 304: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xd62920c8  ! 304: STB_I	stb	%r11, [%r4 + 0x00c8]
	.word 0xee312236  ! 304: STH_I	sth	%r23, [%r4 + 0x0236]
	.word 0xd6212be8  ! 304: STW_I	stw	%r11, [%r4 + 0x0be8]
	.word 0xfe210005  ! 304: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xde2928ee  ! 304: STB_I	stb	%r15, [%r4 + 0x08ee]
	.word 0xde712818  ! 304: STX_I	stx	%r15, [%r4 + 0x0818]
	.word 0xfc290005  ! 304: STB_R	stb	%r30, [%r4 + %r5]
	.word 0x0e800001  ! 304: BVS	bvs  	<label_0x1>
	.word 0xeaa91005  ! 304: STBA_R	stba	%r21, [%r4 + %r5] 0x80
	.word 0xd8290005  ! 314: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xfc312956  ! 314: STH_I	sth	%r30, [%r4 + 0x0956]
	.word 0xf62125b4  ! 314: STW_I	stw	%r27, [%r4 + 0x05b4]
	.word 0xf6290005  ! 314: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf6210005  ! 314: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xe6212b1c  ! 314: STW_I	stw	%r19, [%r4 + 0x0b1c]
	.word 0xe0712e18  ! 314: STX_I	stx	%r16, [%r4 + 0x0e18]
	.word 0xf2712ee0  ! 314: STX_I	stx	%r25, [%r4 + 0x0ee0]
	.word 0x0c800001  ! 314: BNEG	bneg  	<label_0x1>
	.word 0xd4a91005  ! 314: STBA_R	stba	%r10, [%r4 + %r5] 0x80
	.word 0xda290005  ! 323: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa290005  ! 323: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf4290005  ! 323: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xea710005  ! 323: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf2292f1e  ! 323: STB_I	stb	%r25, [%r4 + 0x0f1e]
	.word 0xd4310005  ! 323: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xe4290005  ! 323: STB_R	stb	%r18, [%r4 + %r5]
	.word 0x04800001  ! 323: BLE	ble  	<label_0x1>
	.word 0xd8f08ce6  ! 323: STXA_R	stxa	%r12, [%r2 + %r6] 0x67
	.word 0xf0290005  ! 333: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfc710005  ! 333: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf0212c7c  ! 333: STW_I	stw	%r24, [%r4 + 0x0c7c]
	.word 0xd8712b70  ! 333: STX_I	stx	%r12, [%r4 + 0x0b70]
	.word 0xdc210005  ! 333: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd8312a08  ! 333: STH_I	sth	%r12, [%r4 + 0x0a08]
	.word 0xdc290005  ! 333: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf4712550  ! 333: STX_I	stx	%r26, [%r4 + 0x0550]
	.word 0x3a800003  ! 333: BCC	bcc,a	<label_0x3>
	.word 0xe9e12005  ! 333: CASA_R	casa	[%r4] %asi, %r5, %r20
	.word 0xe6290005  ! 343: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf6312832  ! 343: STH_I	sth	%r27, [%r4 + 0x0832]
	.word 0xda290005  ! 343: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd6312d50  ! 343: STH_I	sth	%r11, [%r4 + 0x0d50]
	.word 0xf6312b04  ! 343: STH_I	sth	%r27, [%r4 + 0x0b04]
	.word 0xf0310005  ! 343: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xe2710005  ! 343: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xd6312d50  ! 343: STH_I	sth	%r11, [%r4 + 0x0d50]
	.word 0x20800001  ! 343: BN	bn,a	<label_0x1>
	.word 0xd6f00ce8  ! 343: STXA_R	stxa	%r11, [%r0 + %r8] 0x67
	.word 0xe6290005  ! 352: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xec290005  ! 352: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe0712a60  ! 352: STX_I	stx	%r16, [%r4 + 0x0a60]
	.word 0xde210005  ! 352: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xec710005  ! 352: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xfc3125dc  ! 352: STH_I	sth	%r30, [%r4 + 0x05dc]
	.word 0xda290005  ! 352: STB_R	stb	%r13, [%r4 + %r5]
	.word 0x30800001  ! 352: BA	ba,a	<label_0x1>
	.word 0xd6f18988  ! 352: STXA_R	stxa	%r11, [%r6 + %r8] 0x4c
	.word 0xf2290005  ! 362: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xde710005  ! 362: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xe8310005  ! 362: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xfa2126d8  ! 362: STW_I	stw	%r29, [%r4 + 0x06d8]
	.word 0xf0290005  ! 362: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xdc212eb4  ! 362: STW_I	stw	%r14, [%r4 + 0x0eb4]
	.word 0xfe712df0  ! 362: STX_I	stx	%r31, [%r4 + 0x0df0]
	.word 0xea710005  ! 362: STX_R	stx	%r21, [%r4 + %r5]
	.word 0x0c800001  ! 362: BNEG	bneg  	<label_0x1>
	.word 0xd6f04986  ! 362: STXA_R	stxa	%r11, [%r1 + %r6] 0x4c
	.word 0xf4290005  ! 372: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf821236c  ! 372: STW_I	stw	%r28, [%r4 + 0x036c]
	.word 0xdc710005  ! 372: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf6290005  ! 372: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe0710005  ! 372: STX_R	stx	%r16, [%r4 + %r5]
	.word 0xd83125da  ! 372: STH_I	sth	%r12, [%r4 + 0x05da]
	.word 0xf02920c4  ! 372: STB_I	stb	%r24, [%r4 + 0x00c4]
	.word 0xd6210005  ! 372: STW_R	stw	%r11, [%r4 + %r5]
	.word 0x1c800001  ! 372: BPOS	bpos  	<label_0x1>
	.word 0xd6f18ce7  ! 372: STXA_R	stxa	%r11, [%r6 + %r7] 0x67
	.word 0xfc290005  ! 382: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xda310005  ! 382: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xfe712618  ! 382: STX_I	stx	%r31, [%r4 + 0x0618]
	.word 0xe8290005  ! 382: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe22120bc  ! 382: STW_I	stw	%r17, [%r4 + 0x00bc]
	.word 0xe229200e  ! 382: STB_I	stb	%r17, [%r4 + 0x000e]
	.word 0xd4710005  ! 382: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xf421272c  ! 382: STW_I	stw	%r26, [%r4 + 0x072c]
	.word 0x0e800003  ! 382: BVS	bvs  	<label_0x3>
	.word 0xd6f1cce7  ! 382: STXA_R	stxa	%r11, [%r7 + %r7] 0x67
	.word 0xe8290005  ! 392: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xdc292109  ! 392: STB_I	stb	%r14, [%r4 + 0x0109]
	.word 0xda310005  ! 392: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xf0292a42  ! 392: STB_I	stb	%r24, [%r4 + 0x0a42]
	.word 0xe8292de7  ! 392: STB_I	stb	%r20, [%r4 + 0x0de7]
	.word 0xd8290005  ! 392: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xf82126c8  ! 392: STW_I	stw	%r28, [%r4 + 0x06c8]
	.word 0xd8212770  ! 392: STW_I	stw	%r12, [%r4 + 0x0770]
	.word 0x04c10003  ! 392: BRLEZ	brlez  ,nt	%4,<label_0x10003>
	.word 0xd6f0c962  ! 392: STXA_R	stxa	%r11, [%r3 + %r2] 0x4b
	.word 0xf2290005  ! 402: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe2710005  ! 402: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xfe710005  ! 402: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xf0290005  ! 402: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe8212a64  ! 402: STW_I	stw	%r20, [%r4 + 0x0a64]
	.word 0xfe292393  ! 402: STB_I	stb	%r31, [%r4 + 0x0393]
	.word 0xde292eba  ! 402: STB_I	stb	%r15, [%r4 + 0x0eba]
	.word 0xe2210005  ! 402: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x40000001  ! 402: CALL	call	disp30_1
	.word 0xd6f04ce0  ! 402: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xf0290005  ! 412: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd8290005  ! 412: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xd4290005  ! 412: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xdc292b30  ! 412: STB_I	stb	%r14, [%r4 + 0x0b30]
	.word 0xf6292298  ! 412: STB_I	stb	%r27, [%r4 + 0x0298]
	.word 0xfa310005  ! 412: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xd8290005  ! 412: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xec29257c  ! 412: STB_I	stb	%r22, [%r4 + 0x057c]
	.word 0x2a800001  ! 412: BCS	bcs,a	<label_0x1>
	.word 0xd6f04989  ! 412: STXA_R	stxa	%r11, [%r1 + %r9] 0x4c
	.word 0xf2290005  ! 421: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfc312564  ! 421: STH_I	sth	%r30, [%r4 + 0x0564]
	.word 0xf8210005  ! 421: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xde310005  ! 421: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xec31260e  ! 421: STH_I	sth	%r22, [%r4 + 0x060e]
	.word 0xea290005  ! 421: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xfe310005  ! 421: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x02c90001  ! 421: BRZ	brz  ,pt	%4,<label_0x90001>
	.word 0xd6f04ce3  ! 421: STXA_R	stxa	%r11, [%r1 + %r3] 0x67
	.word 0xda290005  ! 430: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xfa2927c4  ! 430: STB_I	stb	%r29, [%r4 + 0x07c4]
	.word 0xda7129e0  ! 430: STX_I	stx	%r13, [%r4 + 0x09e0]
	.word 0xee3121f4  ! 430: STH_I	sth	%r23, [%r4 + 0x01f4]
	.word 0xee210005  ! 430: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfe312b88  ! 430: STH_I	sth	%r31, [%r4 + 0x0b88]
	.word 0xea3123a0  ! 430: STH_I	sth	%r21, [%r4 + 0x03a0]
	.word 0x06800001  ! 430: BL	bl  	<label_0x1>
	.word 0xf879236c  ! 430: SWAP_I	swap	%r28, [%r4 + 0x036c]
	.word 0xfc290005  ! 440: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe8710005  ! 440: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd8210005  ! 440: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xf6210005  ! 440: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xfa712ad0  ! 440: STX_I	stx	%r29, [%r4 + 0x0ad0]
	.word 0xfc710005  ! 440: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf8712360  ! 440: STX_I	stx	%r28, [%r4 + 0x0360]
	.word 0xee712400  ! 440: STX_I	stx	%r23, [%r4 + 0x0400]
	.word 0x10800001  ! 440: BA	ba  	<label_0x1>
	.word 0xd6f24ce1  ! 440: STXA_R	stxa	%r11, [%r9 + %r1] 0x67
	.word 0xd6290005  ! 450: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf0712c50  ! 450: STX_I	stx	%r24, [%r4 + 0x0c50]
	.word 0xfc7127b0  ! 450: STX_I	stx	%r30, [%r4 + 0x07b0]
	.word 0xe8712c70  ! 450: STX_I	stx	%r20, [%r4 + 0x0c70]
	.word 0xf2210005  ! 450: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xe6312f6e  ! 450: STH_I	sth	%r19, [%r4 + 0x0f6e]
	.word 0xe4212c78  ! 450: STW_I	stw	%r18, [%r4 + 0x0c78]
	.word 0xf2290005  ! 450: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x26c10003  ! 450: BRLZ	brlz,a,nt	%4,<label_0x10003>
	.word 0xd6f24981  ! 450: STXA_R	stxa	%r11, [%r9 + %r1] 0x4c
	.word 0xe6290005  ! 459: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xe8212e3c  ! 459: STW_I	stw	%r20, [%r4 + 0x0e3c]
	.word 0xf6310005  ! 459: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xfc710005  ! 459: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe0290005  ! 459: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xdc290005  ! 459: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xe2310005  ! 459: STH_R	sth	%r17, [%r4 + %r5]
	.word 0x1e800001  ! 459: BVC	bvc  	<label_0x1>
	.word 0xd6f04961  ! 459: STXA_R	stxa	%r11, [%r1 + %r1] 0x4b
	.word 0xf2290005  ! 468: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf2210005  ! 468: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xd4210005  ! 468: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe6210005  ! 468: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe4312d78  ! 468: STH_I	sth	%r18, [%r4 + 0x0d78]
	.word 0xd8310005  ! 468: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf6212258  ! 468: STW_I	stw	%r27, [%r4 + 0x0258]
	.word 0x18800001  ! 468: BGU	bgu  	<label_0x1>
	.word 0xec3126ca  ! 468: STH_I	sth	%r22, [%r4 + 0x06ca]
	.word 0xe2290005  ! 478: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xdc210005  ! 478: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xfc710005  ! 478: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe2710005  ! 478: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xee3127e4  ! 478: STH_I	sth	%r23, [%r4 + 0x07e4]
	.word 0xe0212a90  ! 478: STW_I	stw	%r16, [%r4 + 0x0a90]
	.word 0xea210005  ! 478: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xf4310005  ! 478: STH_R	sth	%r26, [%r4 + %r5]
	.word 0x06c90001  ! 478: BRLZ	brlz  ,pt	%4,<label_0x90001>
	.word 0xd6f0cce2  ! 478: STXA_R	stxa	%r11, [%r3 + %r2] 0x67
	.word 0xf6290005  ! 488: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf4312f72  ! 488: STH_I	sth	%r26, [%r4 + 0x0f72]
	.word 0xf0212188  ! 488: STW_I	stw	%r24, [%r4 + 0x0188]
	.word 0xf4312060  ! 488: STH_I	sth	%r26, [%r4 + 0x0060]
	.word 0xe2290005  ! 488: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee310005  ! 488: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xd6292f80  ! 488: STB_I	stb	%r11, [%r4 + 0x0f80]
	.word 0xd8290005  ! 488: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x04c10001  ! 488: BRLEZ	brlez  ,nt	%4,<label_0x10001>
	.word 0xd8f20981  ! 488: STXA_R	stxa	%r12, [%r8 + %r1] 0x4c
	.word 0xe4290005  ! 497: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe8210005  ! 497: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe631229c  ! 497: STH_I	sth	%r19, [%r4 + 0x029c]
	.word 0xde7120f0  ! 497: STX_I	stx	%r15, [%r4 + 0x00f0]
	.word 0xe6290005  ! 497: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xdc29285a  ! 497: STB_I	stb	%r14, [%r4 + 0x085a]
	.word 0xe0710005  ! 497: STX_R	stx	%r16, [%r4 + %r5]
	.word 0x02c10001  ! 497: BRZ	brz  ,nt	%4,<label_0x10001>
	.word 0xd6f04ce6  ! 497: STXA_R	stxa	%r11, [%r1 + %r6] 0x67
	.word 0xf8290005  ! 507: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xfe312b54  ! 507: STH_I	sth	%r31, [%r4 + 0x0b54]
	.word 0xe0712048  ! 507: STX_I	stx	%r16, [%r4 + 0x0048]
	.word 0xee290005  ! 507: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xec212a7c  ! 507: STW_I	stw	%r22, [%r4 + 0x0a7c]
	.word 0xdc292195  ! 507: STB_I	stb	%r14, [%r4 + 0x0195]
	.word 0xf4310005  ! 507: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xf6290005  ! 507: STB_R	stb	%r27, [%r4 + %r5]
	.word 0x1c800003  ! 507: BPOS	bpos  	<label_0x3>
	.word 0xd6f00961  ! 507: STXA_R	stxa	%r11, [%r0 + %r1] 0x4b
	.word 0xd4290005  ! 516: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf4210005  ! 516: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xfc292b10  ! 516: STB_I	stb	%r30, [%r4 + 0x0b10]
	.word 0xea3125ec  ! 516: STH_I	sth	%r21, [%r4 + 0x05ec]
	.word 0xec712478  ! 516: STX_I	stx	%r22, [%r4 + 0x0478]
	.word 0xe4310005  ! 516: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xdc712988  ! 516: STX_I	stx	%r14, [%r4 + 0x0988]
	.word 0x0e800001  ! 516: BVS	bvs  	<label_0x1>
	.word 0xd6f20ce3  ! 516: STXA_R	stxa	%r11, [%r8 + %r3] 0x67
	.word 0xda290005  ! 525: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xee290005  ! 525: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xfa310005  ! 525: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xe2212238  ! 525: STW_I	stw	%r17, [%r4 + 0x0238]
	.word 0xf631269a  ! 525: STH_I	sth	%r27, [%r4 + 0x069a]
	.word 0xf8312a5a  ! 525: STH_I	sth	%r28, [%r4 + 0x0a5a]
	.word 0xd4210005  ! 525: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x34800001  ! 525: BG	bg,a	<label_0x1>
	.word 0xd8f08ce2  ! 525: STXA_R	stxa	%r12, [%r2 + %r2] 0x67
	.word 0xfc290005  ! 534: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xec210005  ! 534: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xfc290005  ! 534: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd8710005  ! 534: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xe87126f8  ! 534: STX_I	stx	%r20, [%r4 + 0x06f8]
	.word 0xe67120b8  ! 534: STX_I	stx	%r19, [%r4 + 0x00b8]
	.word 0xf4310005  ! 534: STH_R	sth	%r26, [%r4 + %r5]
	.word 0x2ec10001  ! 534: BRGEZ	brgez,a,nt	%4,<label_0x10001>
	.word 0xd6f24983  ! 534: STXA_R	stxa	%r11, [%r9 + %r3] 0x4c
	.word 0xe0290005  ! 543: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf2210005  ! 543: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xfa292128  ! 543: STB_I	stb	%r29, [%r4 + 0x0128]
	.word 0xe6310005  ! 543: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xec310005  ! 543: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xdc712520  ! 543: STX_I	stx	%r14, [%r4 + 0x0520]
	.word 0xe2312d3e  ! 543: STH_I	sth	%r17, [%r4 + 0x0d3e]
	.word 0x10800003  ! 543: BA	ba  	<label_0x3>
	.word 0xf42921a0  ! 543: STB_I	stb	%r26, [%r4 + 0x01a0]
	.word 0xe2290005  ! 553: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf4290005  ! 553: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xee292983  ! 553: STB_I	stb	%r23, [%r4 + 0x0983]
	.word 0xe2710005  ! 553: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xf6310005  ! 553: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf62121e8  ! 553: STW_I	stw	%r27, [%r4 + 0x01e8]
	.word 0xfe2127f0  ! 553: STW_I	stw	%r31, [%r4 + 0x07f0]
	.word 0xd4210005  ! 553: STW_R	stw	%r10, [%r4 + %r5]
	.word 0x04c90003  ! 553: BRLEZ	brlez  ,pt	%4,<label_0x90003>
	.word 0xf4f92e80  ! 553: SWAPA_I	swapa	%r26, [%r4 + 0x0e80] %asi
	.word 0xe4290005  ! 563: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xda710005  ! 563: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xe82124a8  ! 563: STW_I	stw	%r20, [%r4 + 0x04a8]
	.word 0xf87126e8  ! 563: STX_I	stx	%r28, [%r4 + 0x06e8]
	.word 0xfe210005  ! 563: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xe8710005  ! 563: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xda290005  ! 563: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe2710005  ! 563: STX_R	stx	%r17, [%r4 + %r5]
	.word 0x18800003  ! 563: BGU	bgu  	<label_0x3>
	.word 0xe8210005  ! 563: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xfa290005  ! 572: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe6710005  ! 572: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xda712cc8  ! 572: STX_I	stx	%r13, [%r4 + 0x0cc8]
	.word 0xe0292630  ! 572: STB_I	stb	%r16, [%r4 + 0x0630]
	.word 0xf6292778  ! 572: STB_I	stb	%r27, [%r4 + 0x0778]
	.word 0xd6710005  ! 572: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xee292ce5  ! 572: STB_I	stb	%r23, [%r4 + 0x0ce5]
	.word 0x32800003  ! 572: BNE	bne,a	<label_0x3>
	.word 0xf7392080  ! 572: STDF_I	std	%f27, [0x0080, %r4]
	.word 0xe8290005  ! 582: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfa290005  ! 582: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf4712c38  ! 582: STX_I	stx	%r26, [%r4 + 0x0c38]
	.word 0xfe712500  ! 582: STX_I	stx	%r31, [%r4 + 0x0500]
	.word 0xd4212918  ! 582: STW_I	stw	%r10, [%r4 + 0x0918]
	.word 0xd63124d6  ! 582: STH_I	sth	%r11, [%r4 + 0x04d6]
	.word 0xf4710005  ! 582: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xf4712ec8  ! 582: STX_I	stx	%r26, [%r4 + 0x0ec8]
	.word 0x1c800001  ! 582: BPOS	bpos  	<label_0x1>
	.word 0xd6f0c963  ! 582: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xfc290005  ! 591: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe4710005  ! 591: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe8312da8  ! 591: STH_I	sth	%r20, [%r4 + 0x0da8]
	.word 0xea210005  ! 591: STW_R	stw	%r21, [%r4 + %r5]
	.word 0xe0712568  ! 591: STX_I	stx	%r16, [%r4 + 0x0568]
	.word 0xd47128b8  ! 591: STX_I	stx	%r10, [%r4 + 0x08b8]
	.word 0xf6710005  ! 591: STX_R	stx	%r27, [%r4 + %r5]
	.word 0x22800001  ! 591: BE	be,a	<label_0x1>
	.word 0xf7e11005  ! 591: CASA_I	casa	[%r4] 0x80, %r5, %r27
	.word 0xe4290005  ! 600: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd8712e68  ! 600: STX_I	stx	%r12, [%r4 + 0x0e68]
	.word 0xfe7127e0  ! 600: STX_I	stx	%r31, [%r4 + 0x07e0]
	.word 0xd8210005  ! 600: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xd6712a68  ! 600: STX_I	stx	%r11, [%r4 + 0x0a68]
	.word 0xee312b64  ! 600: STH_I	sth	%r23, [%r4 + 0x0b64]
	.word 0xf8712df8  ! 600: STX_I	stx	%r28, [%r4 + 0x0df8]
	.word 0x26800001  ! 600: BL	bl,a	<label_0x1>
	.word 0xd6f08ce2  ! 600: STXA_R	stxa	%r11, [%r2 + %r2] 0x67
	.word 0xda290005  ! 609: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xee290005  ! 609: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd67122a0  ! 609: STX_I	stx	%r11, [%r4 + 0x02a0]
	.word 0xdc310005  ! 609: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe87120a0  ! 609: STX_I	stx	%r20, [%r4 + 0x00a0]
	.word 0xee210005  ! 609: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfa310005  ! 609: STH_R	sth	%r29, [%r4 + %r5]
	.word 0x0e800001  ! 609: BVS	bvs  	<label_0x1>
	.word 0xd6f04ce9  ! 609: STXA_R	stxa	%r11, [%r1 + %r9] 0x67
	.word 0xfa290005  ! 619: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xfa290005  ! 619: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd4210005  ! 619: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe0210005  ! 619: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xd62127b4  ! 619: STW_I	stw	%r11, [%r4 + 0x07b4]
	.word 0xfa712290  ! 619: STX_I	stx	%r29, [%r4 + 0x0290]
	.word 0xe6292fab  ! 619: STB_I	stb	%r19, [%r4 + 0x0fab]
	.word 0xe4310005  ! 619: STH_R	sth	%r18, [%r4 + %r5]
	.word 0x1e800001  ! 619: BVC	bvc  	<label_0x1>
	.word 0xd8f0c961  ! 619: STXA_R	stxa	%r12, [%r3 + %r1] 0x4b
	.word 0xe4290005  ! 628: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xf4712c88  ! 628: STX_I	stx	%r26, [%r4 + 0x0c88]
	.word 0xd4710005  ! 628: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xea312606  ! 628: STH_I	sth	%r21, [%r4 + 0x0606]
	.word 0xd8310005  ! 628: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe6310005  ! 628: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xf6310005  ! 628: STH_R	sth	%r27, [%r4 + %r5]
	.word 0x20800001  ! 628: BN	bn,a	<label_0x1>
	.word 0xe5f11005  ! 628: CASXA_I	casxa	[%r4] 0x80, %r5, %r18
	.word 0xd8290005  ! 638: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe6310005  ! 638: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xe8292e8c  ! 638: STB_I	stb	%r20, [%r4 + 0x0e8c]
	.word 0xea212620  ! 638: STW_I	stw	%r21, [%r4 + 0x0620]
	.word 0xde210005  ! 638: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xf8212484  ! 638: STW_I	stw	%r28, [%r4 + 0x0484]
	.word 0xfc310005  ! 638: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xe2210005  ! 638: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x2c800003  ! 638: BNEG	bneg,a	<label_0x3>
	.word 0xe2792f58  ! 638: SWAP_I	swap	%r17, [%r4 + 0x0f58]
	.word 0xda290005  ! 648: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf6712578  ! 648: STX_I	stx	%r27, [%r4 + 0x0578]
	.word 0xfa312ae4  ! 648: STH_I	sth	%r29, [%r4 + 0x0ae4]
	.word 0xdc710005  ! 648: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xda292e54  ! 648: STB_I	stb	%r13, [%r4 + 0x0e54]
	.word 0xe2290005  ! 648: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe6290005  ! 648: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xfa292273  ! 648: STB_I	stb	%r29, [%r4 + 0x0273]
	.word 0x26c90001  ! 648: BRLZ	brlz,a,pt	%4,<label_0x90001>
	.word 0xd8f04981  ! 648: STXA_R	stxa	%r12, [%r1 + %r1] 0x4c
	.word 0xf6290005  ! 658: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xee710005  ! 658: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xfa210005  ! 658: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xee710005  ! 658: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xda712af0  ! 658: STX_I	stx	%r13, [%r4 + 0x0af0]
	.word 0xf4212714  ! 658: STW_I	stw	%r26, [%r4 + 0x0714]
	.word 0xd6210005  ! 658: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xf2712598  ! 658: STX_I	stx	%r25, [%r4 + 0x0598]
	.word 0x24800003  ! 658: BLE	ble,a	<label_0x3>
	.word 0xd8f08989  ! 658: STXA_R	stxa	%r12, [%r2 + %r9] 0x4c
	.word 0xe6290005  ! 668: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf6210005  ! 668: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf23127f6  ! 668: STH_I	sth	%r25, [%r4 + 0x07f6]
	.word 0xde710005  ! 668: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xe22927d9  ! 668: STB_I	stb	%r17, [%r4 + 0x07d9]
	.word 0xd42920ab  ! 668: STB_I	stb	%r10, [%r4 + 0x00ab]
	.word 0xf6290005  ! 668: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf0312a9a  ! 668: STH_I	sth	%r24, [%r4 + 0x0a9a]
	.word 0x0cc90003  ! 668: BRGZ	brgz  ,pt	%4,<label_0x90003>
	.word 0xd6f0c961  ! 668: STXA_R	stxa	%r11, [%r3 + %r1] 0x4b
	.word 0xfc290005  ! 678: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe2210005  ! 678: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xfe290005  ! 678: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfc312efc  ! 678: STH_I	sth	%r30, [%r4 + 0x0efc]
	.word 0xec3122d0  ! 678: STH_I	sth	%r22, [%r4 + 0x02d0]
	.word 0xe021279c  ! 678: STW_I	stw	%r16, [%r4 + 0x079c]
	.word 0xfa210005  ! 678: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xd4710005  ! 678: STX_R	stx	%r10, [%r4 + %r5]
	.word 0x2ac10001  ! 678: BRNZ	brnz,a,nt	%4,<label_0x10001>
	.word 0xff390005  ! 678: STDF_R	std	%f31, [%r5, %r4]
	.word 0xdc290005  ! 687: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xde2129f4  ! 687: STW_I	stw	%r15, [%r4 + 0x09f4]
	.word 0xd6712668  ! 687: STX_I	stx	%r11, [%r4 + 0x0668]
	.word 0xda312f04  ! 687: STH_I	sth	%r13, [%r4 + 0x0f04]
	.word 0xe4712f70  ! 687: STX_I	stx	%r18, [%r4 + 0x0f70]
	.word 0xe0290005  ! 687: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf2290005  ! 687: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x2ec90001  ! 687: BRGEZ	brgez,a,pt	%4,<label_0x90001>
	.word 0xed212ce4  ! 687: STF_I	st	%f22, [0x0ce4, %r4]
	.word 0xe0290005  ! 697: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd6212368  ! 697: STW_I	stw	%r11, [%r4 + 0x0368]
	.word 0xfc212988  ! 697: STW_I	stw	%r30, [%r4 + 0x0988]
	.word 0xe0312a12  ! 697: STH_I	sth	%r16, [%r4 + 0x0a12]
	.word 0xfe212d00  ! 697: STW_I	stw	%r31, [%r4 + 0x0d00]
	.word 0xf47126d0  ! 697: STX_I	stx	%r26, [%r4 + 0x06d0]
	.word 0xe8292b4c  ! 697: STB_I	stb	%r20, [%r4 + 0x0b4c]
	.word 0xd8210005  ! 697: STW_R	stw	%r12, [%r4 + %r5]
	.word 0x24800001  ! 697: BLE	ble,a	<label_0x1>
	.word 0xd8f00960  ! 697: STXA_R	stxa	%r12, [%r0 + %r0] 0x4b
	.word 0xf8290005  ! 707: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd6710005  ! 707: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xe2292784  ! 707: STB_I	stb	%r17, [%r4 + 0x0784]
	.word 0xea290005  ! 707: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xec290005  ! 707: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd6290005  ! 707: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf2712020  ! 707: STX_I	stx	%r25, [%r4 + 0x0020]
	.word 0xfe292e8e  ! 707: STB_I	stb	%r31, [%r4 + 0x0e8e]
	.word 0x0ac10001  ! 707: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xd6f18986  ! 707: STXA_R	stxa	%r11, [%r6 + %r6] 0x4c
	.word 0xd6290005  ! 717: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf2212698  ! 717: STW_I	stw	%r25, [%r4 + 0x0698]
	.word 0xe4710005  ! 717: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf8710005  ! 717: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xfc292677  ! 717: STB_I	stb	%r30, [%r4 + 0x0677]
	.word 0xd629246c  ! 717: STB_I	stb	%r11, [%r4 + 0x046c]
	.word 0xd8310005  ! 717: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf0290005  ! 717: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x40000001  ! 717: CALL	call	disp30_1
	.word 0xe73923f0  ! 717: STDF_I	std	%f19, [0x03f0, %r4]
	.word 0xd4290005  ! 726: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xde712068  ! 726: STX_I	stx	%r15, [%r4 + 0x0068]
	.word 0xd4710005  ! 726: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xfe2126a0  ! 726: STW_I	stw	%r31, [%r4 + 0x06a0]
	.word 0xea712558  ! 726: STX_I	stx	%r21, [%r4 + 0x0558]
	.word 0xd6310005  ! 726: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe431230a  ! 726: STH_I	sth	%r18, [%r4 + 0x030a]
	.word 0x2e800001  ! 726: BVS	bvs,a	<label_0x1>
	.word 0xd8f00962  ! 726: STXA_R	stxa	%r12, [%r0 + %r2] 0x4b
	.word 0xfe290005  ! 736: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf8710005  ! 736: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xee290005  ! 736: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe0292b42  ! 736: STB_I	stb	%r16, [%r4 + 0x0b42]
	.word 0xd431221e  ! 736: STH_I	sth	%r10, [%r4 + 0x021e]
	.word 0xe8710005  ! 736: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xfc710005  ! 736: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xfe710005  ! 736: STX_R	stx	%r31, [%r4 + %r5]
	.word 0x10800001  ! 736: BA	ba  	<label_0x1>
	.word 0xe1210005  ! 736: STF_R	st	%f16, [%r5, %r4]
	.word 0xf2290005  ! 745: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe4210005  ! 745: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xe2210005  ! 745: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xf4210005  ! 745: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xe4212a20  ! 745: STW_I	stw	%r18, [%r4 + 0x0a20]
	.word 0xd4312f5a  ! 745: STH_I	sth	%r10, [%r4 + 0x0f5a]
	.word 0xe4290005  ! 745: STB_R	stb	%r18, [%r4 + %r5]
	.word 0x10800003  ! 745: BA	ba  	<label_0x3>
	.word 0xd8f18ce7  ! 745: STXA_R	stxa	%r12, [%r6 + %r7] 0x67
	.word 0xec290005  ! 754: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe4710005  ! 754: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xe0310005  ! 754: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xe0290005  ! 754: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe029242c  ! 754: STB_I	stb	%r16, [%r4 + 0x042c]
	.word 0xfa292f75  ! 754: STB_I	stb	%r29, [%r4 + 0x0f75]
	.word 0xe6212ff4  ! 754: STW_I	stw	%r19, [%r4 + 0x0ff4]
	.word 0x40000003  ! 754: CALL	call	disp30_3
	.word 0xf2e926d4  ! 754: LDSTUBA_I	ldstuba	%r25, [%r4 + 0x06d4] %asi
	.word 0xd4290005  ! 763: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf2290005  ! 763: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe62924fa  ! 763: STB_I	stb	%r19, [%r4 + 0x04fa]
	.word 0xf4712548  ! 763: STX_I	stx	%r26, [%r4 + 0x0548]
	.word 0xd6310005  ! 763: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe0312b3e  ! 763: STH_I	sth	%r16, [%r4 + 0x0b3e]
	.word 0xe2310005  ! 763: STH_R	sth	%r17, [%r4 + %r5]
	.word 0x0ec10001  ! 763: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd6f18ce1  ! 763: STXA_R	stxa	%r11, [%r6 + %r1] 0x67
	.word 0xf0290005  ! 772: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xec212ae4  ! 772: STW_I	stw	%r22, [%r4 + 0x0ae4]
	.word 0xee292bf8  ! 772: STB_I	stb	%r23, [%r4 + 0x0bf8]
	.word 0xf8292c1b  ! 772: STB_I	stb	%r28, [%r4 + 0x0c1b]
	.word 0xda710005  ! 772: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xf6310005  ! 772: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xe229232f  ! 772: STB_I	stb	%r17, [%r4 + 0x032f]
	.word 0x20800003  ! 772: BN	bn,a	<label_0x3>
	.word 0xfef11005  ! 772: STXA_R	stxa	%r31, [%r4 + %r5] 0x80
	.word 0xe0290005  ! 782: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfc210005  ! 782: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xf4710005  ! 782: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xe8290005  ! 782: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe6212f80  ! 782: STW_I	stw	%r19, [%r4 + 0x0f80]
	.word 0xf0712310  ! 782: STX_I	stx	%r24, [%r4 + 0x0310]
	.word 0xf2312cb6  ! 782: STH_I	sth	%r25, [%r4 + 0x0cb6]
	.word 0xe2210005  ! 782: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x30800003  ! 782: BA	ba,a	<label_0x3>
	.word 0xd8f08967  ! 782: STXA_R	stxa	%r12, [%r2 + %r7] 0x4b
	.word 0xe8290005  ! 791: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xda290005  ! 791: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xdc310005  ! 791: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xfe210005  ! 791: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xf6712ad0  ! 791: STX_I	stx	%r27, [%r4 + 0x0ad0]
	.word 0xec212668  ! 791: STW_I	stw	%r22, [%r4 + 0x0668]
	.word 0xdc290005  ! 791: STB_R	stb	%r14, [%r4 + %r5]
	.word 0x02c10003  ! 791: BRZ	brz  ,nt	%4,<label_0x10003>
	.word 0xd8e91005  ! 791: LDSTUBA_R	ldstuba	%r12, [%r4 + %r5] 0x80
	.word 0xf4290005  ! 801: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xee710005  ! 801: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xf6210005  ! 801: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf4310005  ! 801: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xd4210005  ! 801: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xe8290005  ! 801: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe2292f41  ! 801: STB_I	stb	%r17, [%r4 + 0x0f41]
	.word 0xf07122c0  ! 801: STX_I	stx	%r24, [%r4 + 0x02c0]
	.word 0x0a800001  ! 801: BCS	bcs  	<label_0x1>
	.word 0xd8f20966  ! 801: STXA_R	stxa	%r12, [%r8 + %r6] 0x4b
	.word 0xda290005  ! 810: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd6290005  ! 810: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe22122e8  ! 810: STW_I	stw	%r17, [%r4 + 0x02e8]
	.word 0xf8310005  ! 810: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xdc31266a  ! 810: STH_I	sth	%r14, [%r4 + 0x066a]
	.word 0xf8210005  ! 810: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfe7126e0  ! 810: STX_I	stx	%r31, [%r4 + 0x06e0]
	.word 0x3c800001  ! 810: BPOS	bpos,a	<label_0x1>
	.word 0xd8f0c989  ! 810: STXA_R	stxa	%r12, [%r3 + %r9] 0x4c
	.word 0xf2290005  ! 820: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xea310005  ! 820: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xd829200d  ! 820: STB_I	stb	%r12, [%r4 + 0x000d]
	.word 0xfc712268  ! 820: STX_I	stx	%r30, [%r4 + 0x0268]
	.word 0xfc212124  ! 820: STW_I	stw	%r30, [%r4 + 0x0124]
	.word 0xee712010  ! 820: STX_I	stx	%r23, [%r4 + 0x0010]
	.word 0xdc312204  ! 820: STH_I	sth	%r14, [%r4 + 0x0204]
	.word 0xfc290005  ! 820: STB_R	stb	%r30, [%r4 + %r5]
	.word 0x26c10003  ! 820: BRLZ	brlz,a,nt	%4,<label_0x10003>
	.word 0xd6f08967  ! 820: STXA_R	stxa	%r11, [%r2 + %r7] 0x4b
	.word 0xfc290005  ! 830: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe6712130  ! 830: STX_I	stx	%r19, [%r4 + 0x0130]
	.word 0xde7120d0  ! 830: STX_I	stx	%r15, [%r4 + 0x00d0]
	.word 0xfc210005  ! 830: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xf6310005  ! 830: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf4290005  ! 830: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xfc29222d  ! 830: STB_I	stb	%r30, [%r4 + 0x022d]
	.word 0xda212e70  ! 830: STW_I	stw	%r13, [%r4 + 0x0e70]
	.word 0x2a800003  ! 830: BCS	bcs,a	<label_0x3>
	.word 0xd8f18ce1  ! 830: STXA_R	stxa	%r12, [%r6 + %r1] 0x67
	.word 0xe0290005  ! 840: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe0712f08  ! 840: STX_I	stx	%r16, [%r4 + 0x0f08]
	.word 0xf6310005  ! 840: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xfe712828  ! 840: STX_I	stx	%r31, [%r4 + 0x0828]
	.word 0xd6710005  ! 840: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xe0290005  ! 840: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xec712048  ! 840: STX_I	stx	%r22, [%r4 + 0x0048]
	.word 0xdc290005  ! 840: STB_R	stb	%r14, [%r4 + %r5]
	.word 0x06800003  ! 840: BL	bl  	<label_0x3>
	.word 0xfcf124c0  ! 840: STXA_I	stxa	%r30, [%r4 + 0x04c0] %asi
	.word 0xf6290005  ! 850: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xe2710005  ! 850: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xe6212660  ! 850: STW_I	stw	%r19, [%r4 + 0x0660]
	.word 0xf4310005  ! 850: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xf631294a  ! 850: STH_I	sth	%r27, [%r4 + 0x094a]
	.word 0xd8310005  ! 850: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf8292083  ! 850: STB_I	stb	%r28, [%r4 + 0x0083]
	.word 0xfa292a16  ! 850: STB_I	stb	%r29, [%r4 + 0x0a16]
	.word 0x36800003  ! 850: BGE	bge,a	<label_0x3>
	.word 0xd6f20960  ! 850: STXA_R	stxa	%r11, [%r8 + %r0] 0x4b
	.word 0xd8290005  ! 859: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xdc312fc6  ! 859: STH_I	sth	%r14, [%r4 + 0x0fc6]
	.word 0xda7121c0  ! 859: STX_I	stx	%r13, [%r4 + 0x01c0]
	.word 0xd6710005  ! 859: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xea292326  ! 859: STB_I	stb	%r21, [%r4 + 0x0326]
	.word 0xf8210005  ! 859: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf8212f90  ! 859: STW_I	stw	%r28, [%r4 + 0x0f90]
	.word 0x04800001  ! 859: BLE	ble  	<label_0x1>
	.word 0xd8f20ce6  ! 859: STXA_R	stxa	%r12, [%r8 + %r6] 0x67
	.word 0xee290005  ! 868: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe2292a53  ! 868: STB_I	stb	%r17, [%r4 + 0x0a53]
	.word 0xe6290005  ! 868: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf6712d00  ! 868: STX_I	stx	%r27, [%r4 + 0x0d00]
	.word 0xd8310005  ! 868: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xf47129e8  ! 868: STX_I	stx	%r26, [%r4 + 0x09e8]
	.word 0xf2290005  ! 868: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x3e800003  ! 868: BVC	bvc,a	<label_0x3>
	.word 0xd8f08ce7  ! 868: STXA_R	stxa	%r12, [%r2 + %r7] 0x67
	.word 0xd4290005  ! 878: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xea31278a  ! 878: STH_I	sth	%r21, [%r4 + 0x078a]
	.word 0xf0310005  ! 878: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xfe212244  ! 878: STW_I	stw	%r31, [%r4 + 0x0244]
	.word 0xf8712c98  ! 878: STX_I	stx	%r28, [%r4 + 0x0c98]
	.word 0xf8290005  ! 878: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd6290005  ! 878: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfe310005  ! 878: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x40000001  ! 878: CALL	call	disp30_1
	.word 0xd8f08983  ! 878: STXA_R	stxa	%r12, [%r2 + %r3] 0x4c
	.word 0xfc290005  ! 887: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd4212c60  ! 887: STW_I	stw	%r10, [%r4 + 0x0c60]
	.word 0xd4292340  ! 887: STB_I	stb	%r10, [%r4 + 0x0340]
	.word 0xf8210005  ! 887: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xea21203c  ! 887: STW_I	stw	%r21, [%r4 + 0x003c]
	.word 0xf2290005  ! 887: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd8290005  ! 887: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x40000001  ! 887: CALL	call	disp30_1
	.word 0xe6f11005  ! 887: STXA_R	stxa	%r19, [%r4 + %r5] 0x80
	.word 0xf6290005  ! 897: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf4710005  ! 897: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xe4310005  ! 897: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xfe712188  ! 897: STX_I	stx	%r31, [%r4 + 0x0188]
	.word 0xf0290005  ! 897: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xee310005  ! 897: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xe8710005  ! 897: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xe82926f6  ! 897: STB_I	stb	%r20, [%r4 + 0x06f6]
	.word 0x08800003  ! 897: BLEU	bleu  	<label_0x3>
	.word 0xd6f00988  ! 897: STXA_R	stxa	%r11, [%r0 + %r8] 0x4c
	.word 0xf4290005  ! 906: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf0312446  ! 906: STH_I	sth	%r24, [%r4 + 0x0446]
	.word 0xe4292437  ! 906: STB_I	stb	%r18, [%r4 + 0x0437]
	.word 0xda712620  ! 906: STX_I	stx	%r13, [%r4 + 0x0620]
	.word 0xea31214c  ! 906: STH_I	sth	%r21, [%r4 + 0x014c]
	.word 0xd6290005  ! 906: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xea310005  ! 906: STH_R	sth	%r21, [%r4 + %r5]
	.word 0x22c90001  ! 906: BRZ	brz,a,pt	%4,<label_0x90001>
	.word 0xd6f0c982  ! 906: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xf4290005  ! 915: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf6310005  ! 915: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xfc290005  ! 915: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf2290005  ! 915: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xd4292ef6  ! 915: STB_I	stb	%r10, [%r4 + 0x0ef6]
	.word 0xdc3122c0  ! 915: STH_I	sth	%r14, [%r4 + 0x02c0]
	.word 0xf6210005  ! 915: STW_R	stw	%r27, [%r4 + %r5]
	.word 0x2a800001  ! 915: BCS	bcs,a	<label_0x1>
	.word 0xdc312c16  ! 915: STH_I	sth	%r14, [%r4 + 0x0c16]
	.word 0xfc290005  ! 925: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfe710005  ! 925: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xea212428  ! 925: STW_I	stw	%r21, [%r4 + 0x0428]
	.word 0xda312ba6  ! 925: STH_I	sth	%r13, [%r4 + 0x0ba6]
	.word 0xdc210005  ! 925: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xe4210005  ! 925: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfc210005  ! 925: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xe0712578  ! 925: STX_I	stx	%r16, [%r4 + 0x0578]
	.word 0x0ec10001  ! 925: BRGEZ	brgez  ,nt	%4,<label_0x10001>
	.word 0xd6f1cce8  ! 925: STXA_R	stxa	%r11, [%r7 + %r8] 0x67
	.word 0xf8290005  ! 934: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd8210005  ! 934: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xf8712e70  ! 934: STX_I	stx	%r28, [%r4 + 0x0e70]
	.word 0xe631225a  ! 934: STH_I	sth	%r19, [%r4 + 0x025a]
	.word 0xe8310005  ! 934: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xd8312370  ! 934: STH_I	sth	%r12, [%r4 + 0x0370]
	.word 0xd6292038  ! 934: STB_I	stb	%r11, [%r4 + 0x0038]
	.word 0x00800001  ! 934: BN	bn  	<label_0x1>
	.word 0xd8f08968  ! 934: STXA_R	stxa	%r12, [%r2 + %r8] 0x4b
	.word 0xd8290005  ! 944: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xee312126  ! 944: STH_I	sth	%r23, [%r4 + 0x0126]
	.word 0xea710005  ! 944: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xf4310005  ! 944: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xe8712d30  ! 944: STX_I	stx	%r20, [%r4 + 0x0d30]
	.word 0xd8712690  ! 944: STX_I	stx	%r12, [%r4 + 0x0690]
	.word 0xfa310005  ! 944: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xfe310005  ! 944: STH_R	sth	%r31, [%r4 + %r5]
	.word 0x04c90001  ! 944: BRLEZ	brlez  ,pt	%4,<label_0x90001>
	.word 0xe3f11005  ! 944: CASXA_I	casxa	[%r4] 0x80, %r5, %r17
	.word 0xd4290005  ! 953: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf629258e  ! 953: STB_I	stb	%r27, [%r4 + 0x058e]
	.word 0xd8312d0e  ! 953: STH_I	sth	%r12, [%r4 + 0x0d0e]
	.word 0xfe290005  ! 953: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe2292311  ! 953: STB_I	stb	%r17, [%r4 + 0x0311]
	.word 0xe0212cf8  ! 953: STW_I	stw	%r16, [%r4 + 0x0cf8]
	.word 0xda712c40  ! 953: STX_I	stx	%r13, [%r4 + 0x0c40]
	.word 0x22800003  ! 953: BE	be,a	<label_0x3>
	.word 0xd6f24ce9  ! 953: STXA_R	stxa	%r11, [%r9 + %r9] 0x67
	.word 0xf4290005  ! 963: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe8310005  ! 963: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xda290005  ! 963: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xde312cd8  ! 963: STH_I	sth	%r15, [%r4 + 0x0cd8]
	.word 0xd4212d68  ! 963: STW_I	stw	%r10, [%r4 + 0x0d68]
	.word 0xf42129e4  ! 963: STW_I	stw	%r26, [%r4 + 0x09e4]
	.word 0xf4710005  ! 963: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xfc7123a8  ! 963: STX_I	stx	%r30, [%r4 + 0x03a8]
	.word 0x0ec90001  ! 963: BRGEZ	brgez  ,pt	%4,<label_0x90001>
	.word 0xe0312116  ! 963: STH_I	sth	%r16, [%r4 + 0x0116]
	.word 0xe2290005  ! 972: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee712ea0  ! 972: STX_I	stx	%r23, [%r4 + 0x0ea0]
	.word 0xe8710005  ! 972: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xd6210005  ! 972: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xd8310005  ! 972: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xea212a48  ! 972: STW_I	stw	%r21, [%r4 + 0x0a48]
	.word 0xf4710005  ! 972: STX_R	stx	%r26, [%r4 + %r5]
	.word 0x0cc90003  ! 972: BRGZ	brgz  ,pt	%4,<label_0x90003>
	.word 0xd6f1cce9  ! 972: STXA_R	stxa	%r11, [%r7 + %r9] 0x67
	.word 0xd4290005  ! 981: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xfa710005  ! 981: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xf67124a0  ! 981: STX_I	stx	%r27, [%r4 + 0x04a0]
	.word 0xd8210005  ! 981: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xf4290005  ! 981: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xec290005  ! 981: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xda210005  ! 981: STW_R	stw	%r13, [%r4 + %r5]
	.word 0x3a800001  ! 981: BCC	bcc,a	<label_0x1>
	.word 0xd6f08960  ! 981: STXA_R	stxa	%r11, [%r2 + %r0] 0x4b
	.word 0xda290005  ! 991: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe6212a04  ! 991: STW_I	stw	%r19, [%r4 + 0x0a04]
	.word 0xe6292d8b  ! 991: STB_I	stb	%r19, [%r4 + 0x0d8b]
	.word 0xe8710005  ! 991: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xf8310005  ! 991: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xe6310005  ! 991: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xd4212e74  ! 991: STW_I	stw	%r10, [%r4 + 0x0e74]
	.word 0xec210005  ! 991: STW_R	stw	%r22, [%r4 + %r5]
	.word 0x1e800003  ! 991: BVC	bvc  	<label_0x3>
	.word 0xd6f0c981  ! 991: STXA_R	stxa	%r11, [%r3 + %r1] 0x4c
	.word 0xe4290005  ! 1000: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xec210005  ! 1000: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xfa310005  ! 1000: STH_R	sth	%r29, [%r4 + %r5]
	.word 0xee712c80  ! 1000: STX_I	stx	%r23, [%r4 + 0x0c80]
	.word 0xf8310005  ! 1000: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xe6710005  ! 1000: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe6210005  ! 1000: STW_R	stw	%r19, [%r4 + %r5]
	.word 0x2a800003  ! 1000: BCS	bcs,a	<label_0x3>
	.word 0xd5e11005  ! 1000: CASA_I	casa	[%r4] 0x80, %r5, %r10
	.word 0xe8290005  ! 1009: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xf4290005  ! 1009: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xde310005  ! 1009: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xfc21249c  ! 1009: STW_I	stw	%r30, [%r4 + 0x049c]
	.word 0xe4290005  ! 1009: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xd4290005  ! 1009: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf6712b90  ! 1009: STX_I	stx	%r27, [%r4 + 0x0b90]
	.word 0x1a800001  ! 1009: BCC	bcc  	<label_0x1>
	.word 0xd6f1cce0  ! 1009: STXA_R	stxa	%r11, [%r7 + %r0] 0x67
	.word 0xfa290005  ! 1019: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd6212c60  ! 1019: STW_I	stw	%r11, [%r4 + 0x0c60]
	.word 0xf0710005  ! 1019: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xfc210005  ! 1019: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xfe7120b8  ! 1019: STX_I	stx	%r31, [%r4 + 0x00b8]
	.word 0xde212f2c  ! 1019: STW_I	stw	%r15, [%r4 + 0x0f2c]
	.word 0xda310005  ! 1019: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xd8310005  ! 1019: STH_R	sth	%r12, [%r4 + %r5]
	.word 0x1a800001  ! 1019: BCC	bcc  	<label_0x1>
	.word 0xfe710005  ! 1019: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xde290005  ! 1029: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xea292070  ! 1029: STB_I	stb	%r21, [%r4 + 0x0070]
	.word 0xe8290005  ! 1029: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe03121d8  ! 1029: STH_I	sth	%r16, [%r4 + 0x01d8]
	.word 0xd82928f7  ! 1029: STB_I	stb	%r12, [%r4 + 0x08f7]
	.word 0xe4312752  ! 1029: STH_I	sth	%r18, [%r4 + 0x0752]
	.word 0xee310005  ! 1029: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xd4712c68  ! 1029: STX_I	stx	%r10, [%r4 + 0x0c68]
	.word 0x26800001  ! 1029: BL	bl,a	<label_0x1>
	.word 0xe7e11005  ! 1029: CASA_I	casa	[%r4] 0x80, %r5, %r19
	.word 0xfc290005  ! 1038: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xec292c33  ! 1038: STB_I	stb	%r22, [%r4 + 0x0c33]
	.word 0xf8290005  ! 1038: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xf6290005  ! 1038: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf83125e0  ! 1038: STH_I	sth	%r28, [%r4 + 0x05e0]
	.word 0xe4312460  ! 1038: STH_I	sth	%r18, [%r4 + 0x0460]
	.word 0xe0710005  ! 1038: STX_R	stx	%r16, [%r4 + %r5]
	.word 0x40000001  ! 1038: CALL	call	disp30_1
	.word 0xd5e11005  ! 1038: CASA_I	casa	[%r4] 0x80, %r5, %r10
	.word 0xf0290005  ! 1048: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xee710005  ! 1048: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe4310005  ! 1048: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xf82922f5  ! 1048: STB_I	stb	%r28, [%r4 + 0x02f5]
	.word 0xe0290005  ! 1048: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf42126f0  ! 1048: STW_I	stw	%r26, [%r4 + 0x06f0]
	.word 0xfe212b00  ! 1048: STW_I	stw	%r31, [%r4 + 0x0b00]
	.word 0xee29202a  ! 1048: STB_I	stb	%r23, [%r4 + 0x002a]
	.word 0x2e800001  ! 1048: BVS	bvs,a	<label_0x1>
	.word 0xeaa91005  ! 1048: STBA_R	stba	%r21, [%r4 + %r5] 0x80
	.word 0xe2290005  ! 1058: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd431223a  ! 1058: STH_I	sth	%r10, [%r4 + 0x023a]
	.word 0xee312f70  ! 1058: STH_I	sth	%r23, [%r4 + 0x0f70]
	.word 0xdc710005  ! 1058: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xe6710005  ! 1058: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xec290005  ! 1058: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xee710005  ! 1058: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xe2712980  ! 1058: STX_I	stx	%r17, [%r4 + 0x0980]
	.word 0x28800001  ! 1058: BLEU	bleu,a	<label_0x1>
	.word 0xd6f1cce0  ! 1058: STXA_R	stxa	%r11, [%r7 + %r0] 0x67
	.word 0xfa290005  ! 1067: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe0290005  ! 1067: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xea712ce8  ! 1067: STX_I	stx	%r21, [%r4 + 0x0ce8]
	.word 0xe621279c  ! 1067: STW_I	stw	%r19, [%r4 + 0x079c]
	.word 0xe2210005  ! 1067: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xf8210005  ! 1067: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf82924aa  ! 1067: STB_I	stb	%r28, [%r4 + 0x04aa]
	.word 0x0e800003  ! 1067: BVS	bvs  	<label_0x3>
	.word 0xf8a11005  ! 1067: STWA_R	stwa	%r28, [%r4 + %r5] 0x80
	.word 0xe6290005  ! 1076: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf4292f12  ! 1076: STB_I	stb	%r26, [%r4 + 0x0f12]
	.word 0xe431234c  ! 1076: STH_I	sth	%r18, [%r4 + 0x034c]
	.word 0xd4210005  ! 1076: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xea712538  ! 1076: STX_I	stx	%r21, [%r4 + 0x0538]
	.word 0xec710005  ! 1076: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xe2210005  ! 1076: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x1c800003  ! 1076: BPOS	bpos  	<label_0x3>
	.word 0xd6f04989  ! 1076: STXA_R	stxa	%r11, [%r1 + %r9] 0x4c
	.word 0xf0290005  ! 1086: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd67122d8  ! 1086: STX_I	stx	%r11, [%r4 + 0x02d8]
	.word 0xdc712890  ! 1086: STX_I	stx	%r14, [%r4 + 0x0890]
	.word 0xf0710005  ! 1086: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xf8710005  ! 1086: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xd6310005  ! 1086: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe2312358  ! 1086: STH_I	sth	%r17, [%r4 + 0x0358]
	.word 0xdc710005  ! 1086: STX_R	stx	%r14, [%r4 + %r5]
	.word 0x0e800001  ! 1086: BVS	bvs  	<label_0x1>
	.word 0xd8f0c987  ! 1086: STXA_R	stxa	%r12, [%r3 + %r7] 0x4c
	.word 0xdc290005  ! 1096: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf4310005  ! 1096: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xda312242  ! 1096: STH_I	sth	%r13, [%r4 + 0x0242]
	.word 0xf0710005  ! 1096: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xec710005  ! 1096: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xd6290005  ! 1096: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xde710005  ! 1096: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xe2310005  ! 1096: STH_R	sth	%r17, [%r4 + %r5]
	.word 0x22c10003  ! 1096: BRZ	brz,a,nt	%4,<label_0x10003>
	.word 0xf6e91005  ! 1096: LDSTUBA_R	ldstuba	%r27, [%r4 + %r5] 0x80
	.word 0xee290005  ! 1106: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd421242c  ! 1106: STW_I	stw	%r10, [%r4 + 0x042c]
	.word 0xdc292cb7  ! 1106: STB_I	stb	%r14, [%r4 + 0x0cb7]
	.word 0xea712f80  ! 1106: STX_I	stx	%r21, [%r4 + 0x0f80]
	.word 0xfa290005  ! 1106: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe4210005  ! 1106: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xea3121ec  ! 1106: STH_I	sth	%r21, [%r4 + 0x01ec]
	.word 0xf6312d96  ! 1106: STH_I	sth	%r27, [%r4 + 0x0d96]
	.word 0x04800001  ! 1106: BLE	ble  	<label_0x1>
	.word 0xd8f1cce3  ! 1106: STXA_R	stxa	%r12, [%r7 + %r3] 0x67
	.word 0xda290005  ! 1116: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xf67124c8  ! 1116: STX_I	stx	%r27, [%r4 + 0x04c8]
	.word 0xfa712868  ! 1116: STX_I	stx	%r29, [%r4 + 0x0868]
	.word 0xf2312f0e  ! 1116: STH_I	sth	%r25, [%r4 + 0x0f0e]
	.word 0xd8312a02  ! 1116: STH_I	sth	%r12, [%r4 + 0x0a02]
	.word 0xdc712f78  ! 1116: STX_I	stx	%r14, [%r4 + 0x0f78]
	.word 0xde712768  ! 1116: STX_I	stx	%r15, [%r4 + 0x0768]
	.word 0xec310005  ! 1116: STH_R	sth	%r22, [%r4 + %r5]
	.word 0x26c10001  ! 1116: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xd8f00963  ! 1116: STXA_R	stxa	%r12, [%r0 + %r3] 0x4b
	.word 0xe8290005  ! 1125: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfc710005  ! 1125: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xec212d48  ! 1125: STW_I	stw	%r22, [%r4 + 0x0d48]
	.word 0xe6710005  ! 1125: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xe429205f  ! 1125: STB_I	stb	%r18, [%r4 + 0x005f]
	.word 0xe8292560  ! 1125: STB_I	stb	%r20, [%r4 + 0x0560]
	.word 0xe4210005  ! 1125: STW_R	stw	%r18, [%r4 + %r5]
	.word 0x30800001  ! 1125: BA	ba,a	<label_0x1>
	.word 0xd6f08ce0  ! 1125: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
	.word 0xf0290005  ! 1135: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe0310005  ! 1135: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xdc710005  ! 1135: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xdc310005  ! 1135: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xf8710005  ! 1135: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xfe2129f8  ! 1135: STW_I	stw	%r31, [%r4 + 0x09f8]
	.word 0xde710005  ! 1135: STX_R	stx	%r15, [%r4 + %r5]
	.word 0xfc290005  ! 1135: STB_R	stb	%r30, [%r4 + %r5]
	.word 0x10800003  ! 1135: BA	ba  	<label_0x3>
	.word 0xecb91005  ! 1135: STDA_R	stda	%r22, [%r4 + %r5] 0x80
	.word 0xf6290005  ! 1144: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf6710005  ! 1144: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xee210005  ! 1144: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xfa710005  ! 1144: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xe8710005  ! 1144: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xea212c78  ! 1144: STW_I	stw	%r21, [%r4 + 0x0c78]
	.word 0xfc210005  ! 1144: STW_R	stw	%r30, [%r4 + %r5]
	.word 0x08800001  ! 1144: BLEU	bleu  	<label_0x1>
	.word 0xd6f1c982  ! 1144: STXA_R	stxa	%r11, [%r7 + %r2] 0x4c
	.word 0xdc290005  ! 1154: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfe210005  ! 1154: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xe2710005  ! 1154: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xfc710005  ! 1154: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xe0292766  ! 1154: STB_I	stb	%r16, [%r4 + 0x0766]
	.word 0xe23126c8  ! 1154: STH_I	sth	%r17, [%r4 + 0x06c8]
	.word 0xec290005  ! 1154: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd6310005  ! 1154: STH_R	sth	%r11, [%r4 + %r5]
	.word 0x2ac10001  ! 1154: BRNZ	brnz,a,nt	%4,<label_0x10001>
	.word 0xd6f1cce1  ! 1154: STXA_R	stxa	%r11, [%r7 + %r1] 0x67
	.word 0xe4290005  ! 1164: STB_R	stb	%r18, [%r4 + %r5]
	.word 0xe2290005  ! 1164: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe4712f90  ! 1164: STX_I	stx	%r18, [%r4 + 0x0f90]
	.word 0xf8212968  ! 1164: STW_I	stw	%r28, [%r4 + 0x0968]
	.word 0xf4290005  ! 1164: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xda710005  ! 1164: STX_R	stx	%r13, [%r4 + %r5]
	.word 0xd6312792  ! 1164: STH_I	sth	%r11, [%r4 + 0x0792]
	.word 0xfe210005  ! 1164: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x40000003  ! 1164: CALL	call	disp30_3
	.word 0xd8f04ce2  ! 1164: STXA_R	stxa	%r12, [%r1 + %r2] 0x67
	.word 0xd8290005  ! 1174: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xde290005  ! 1174: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xea310005  ! 1174: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xd8312f56  ! 1174: STH_I	sth	%r12, [%r4 + 0x0f56]
	.word 0xe029238a  ! 1174: STB_I	stb	%r16, [%r4 + 0x038a]
	.word 0xfe31240c  ! 1174: STH_I	sth	%r31, [%r4 + 0x040c]
	.word 0xee312d02  ! 1174: STH_I	sth	%r23, [%r4 + 0x0d02]
	.word 0xda292b29  ! 1174: STB_I	stb	%r13, [%r4 + 0x0b29]
	.word 0x20800001  ! 1174: BN	bn,a	<label_0x1>
	.word 0xd8f18ce6  ! 1174: STXA_R	stxa	%r12, [%r6 + %r6] 0x67
	.word 0xe2290005  ! 1183: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xd8710005  ! 1183: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xf0212f00  ! 1183: STW_I	stw	%r24, [%r4 + 0x0f00]
	.word 0xf8710005  ! 1183: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xfa212438  ! 1183: STW_I	stw	%r29, [%r4 + 0x0438]
	.word 0xd6712230  ! 1183: STX_I	stx	%r11, [%r4 + 0x0230]
	.word 0xd8310005  ! 1183: STH_R	sth	%r12, [%r4 + %r5]
	.word 0x04c90001  ! 1183: BRLEZ	brlez  ,pt	%4,<label_0x90001>
	.word 0xd87923a4  ! 1183: SWAP_I	swap	%r12, [%r4 + 0x03a4]
	.word 0xe0290005  ! 1192: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xfa712ba0  ! 1192: STX_I	stx	%r29, [%r4 + 0x0ba0]
	.word 0xda210005  ! 1192: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xda210005  ! 1192: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xde29284c  ! 1192: STB_I	stb	%r15, [%r4 + 0x084c]
	.word 0xf2710005  ! 1192: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xe2210005  ! 1192: STW_R	stw	%r17, [%r4 + %r5]
	.word 0x38800001  ! 1192: BGU	bgu,a	<label_0x1>
	.word 0xd8f08ce2  ! 1192: STXA_R	stxa	%r12, [%r2 + %r2] 0x67
	.word 0xe0290005  ! 1202: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd47123e8  ! 1202: STX_I	stx	%r10, [%r4 + 0x03e8]
	.word 0xea310005  ! 1202: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xec2125e0  ! 1202: STW_I	stw	%r22, [%r4 + 0x05e0]
	.word 0xea290005  ! 1202: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe0310005  ! 1202: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xdc312f74  ! 1202: STH_I	sth	%r14, [%r4 + 0x0f74]
	.word 0xfe292dda  ! 1202: STB_I	stb	%r31, [%r4 + 0x0dda]
	.word 0x12800003  ! 1202: BNE	bne  	<label_0x3>
	.word 0xd8f0cce0  ! 1202: STXA_R	stxa	%r12, [%r3 + %r0] 0x67
	.word 0xf4290005  ! 1211: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf42926c9  ! 1211: STB_I	stb	%r26, [%r4 + 0x06c9]
	.word 0xda292e4a  ! 1211: STB_I	stb	%r13, [%r4 + 0x0e4a]
	.word 0xf2210005  ! 1211: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xd6712310  ! 1211: STX_I	stx	%r11, [%r4 + 0x0310]
	.word 0xd4290005  ! 1211: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe02125a0  ! 1211: STW_I	stw	%r16, [%r4 + 0x05a0]
	.word 0x22800003  ! 1211: BE	be,a	<label_0x3>
	.word 0xd8f0c980  ! 1211: STXA_R	stxa	%r12, [%r3 + %r0] 0x4c
	.word 0xea290005  ! 1221: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe4310005  ! 1221: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xdc312f58  ! 1221: STH_I	sth	%r14, [%r4 + 0x0f58]
	.word 0xdc210005  ! 1221: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xe2712060  ! 1221: STX_I	stx	%r17, [%r4 + 0x0060]
	.word 0xd62927ee  ! 1221: STB_I	stb	%r11, [%r4 + 0x07ee]
	.word 0xe2710005  ! 1221: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xda31263a  ! 1221: STH_I	sth	%r13, [%r4 + 0x063a]
	.word 0x20800001  ! 1221: BN	bn,a	<label_0x1>
	.word 0xd6f1c982  ! 1221: STXA_R	stxa	%r11, [%r7 + %r2] 0x4c
	.word 0xf4290005  ! 1230: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe6292683  ! 1230: STB_I	stb	%r19, [%r4 + 0x0683]
	.word 0xd8290005  ! 1230: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe62126e4  ! 1230: STW_I	stw	%r19, [%r4 + 0x06e4]
	.word 0xee712730  ! 1230: STX_I	stx	%r23, [%r4 + 0x0730]
	.word 0xfa210005  ! 1230: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xfa2126c4  ! 1230: STW_I	stw	%r29, [%r4 + 0x06c4]
	.word 0x04800001  ! 1230: BLE	ble  	<label_0x1>
	.word 0xd6f08963  ! 1230: STXA_R	stxa	%r11, [%r2 + %r3] 0x4b
	.word 0xf0290005  ! 1239: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xec292d5b  ! 1239: STB_I	stb	%r22, [%r4 + 0x0d5b]
	.word 0xec210005  ! 1239: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xf8712570  ! 1239: STX_I	stx	%r28, [%r4 + 0x0570]
	.word 0xe6710005  ! 1239: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xee292e6d  ! 1239: STB_I	stb	%r23, [%r4 + 0x0e6d]
	.word 0xe02924b3  ! 1239: STB_I	stb	%r16, [%r4 + 0x04b3]
	.word 0x04c90001  ! 1239: BRLEZ	brlez  ,pt	%4,<label_0x90001>
	.word 0xd8f0c968  ! 1239: STXA_R	stxa	%r12, [%r3 + %r8] 0x4b
	.word 0xde290005  ! 1248: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf021226c  ! 1248: STW_I	stw	%r24, [%r4 + 0x026c]
	.word 0xea712438  ! 1248: STX_I	stx	%r21, [%r4 + 0x0438]
	.word 0xf2310005  ! 1248: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xf6710005  ! 1248: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xdc310005  ! 1248: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xea210005  ! 1248: STW_R	stw	%r21, [%r4 + %r5]
	.word 0x36800003  ! 1248: BGE	bge,a	<label_0x3>
	.word 0xea310005  ! 1248: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xde290005  ! 1257: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xee29266f  ! 1257: STB_I	stb	%r23, [%r4 + 0x066f]
	.word 0xfc712a80  ! 1257: STX_I	stx	%r30, [%r4 + 0x0a80]
	.word 0xe4212ebc  ! 1257: STW_I	stw	%r18, [%r4 + 0x0ebc]
	.word 0xfa312242  ! 1257: STH_I	sth	%r29, [%r4 + 0x0242]
	.word 0xda712538  ! 1257: STX_I	stx	%r13, [%r4 + 0x0538]
	.word 0xe4210005  ! 1257: STW_R	stw	%r18, [%r4 + %r5]
	.word 0x2ec10001  ! 1257: BRGEZ	brgez,a,nt	%4,<label_0x10001>
	.word 0xd6f20ce6  ! 1257: STXA_R	stxa	%r11, [%r8 + %r6] 0x67
	.word 0xe8290005  ! 1266: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe4710005  ! 1266: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf6290005  ! 1266: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf0210005  ! 1266: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xe47120d0  ! 1266: STX_I	stx	%r18, [%r4 + 0x00d0]
	.word 0xf0710005  ! 1266: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xe6312e26  ! 1266: STH_I	sth	%r19, [%r4 + 0x0e26]
	.word 0x06c10001  ! 1266: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xd6f24981  ! 1266: STXA_R	stxa	%r11, [%r9 + %r1] 0x4c
	.word 0xd6290005  ! 1275: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf0290005  ! 1275: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe4710005  ! 1275: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfa290005  ! 1275: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe2290005  ! 1275: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe0292451  ! 1275: STB_I	stb	%r16, [%r4 + 0x0451]
	.word 0xd6712c80  ! 1275: STX_I	stx	%r11, [%r4 + 0x0c80]
	.word 0x2cc10001  ! 1275: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd6f04ce2  ! 1275: STXA_R	stxa	%r11, [%r1 + %r2] 0x67
	.word 0xe6290005  ! 1284: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xda212718  ! 1284: STW_I	stw	%r13, [%r4 + 0x0718]
	.word 0xf8210005  ! 1284: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xfe290005  ! 1284: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe0310005  ! 1284: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xec710005  ! 1284: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xfa292756  ! 1284: STB_I	stb	%r29, [%r4 + 0x0756]
	.word 0x1a800001  ! 1284: BCC	bcc  	<label_0x1>
	.word 0xd6f0cce9  ! 1284: STXA_R	stxa	%r11, [%r3 + %r9] 0x67
	.word 0xf2290005  ! 1293: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xe6290005  ! 1293: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xea290005  ! 1293: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xe4710005  ! 1293: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xfa2929ba  ! 1293: STB_I	stb	%r29, [%r4 + 0x09ba]
	.word 0xf22929db  ! 1293: STB_I	stb	%r25, [%r4 + 0x09db]
	.word 0xde310005  ! 1293: STH_R	sth	%r15, [%r4 + %r5]
	.word 0x22800003  ! 1293: BE	be,a	<label_0x3>
	.word 0xd6f1cce3  ! 1293: STXA_R	stxa	%r11, [%r7 + %r3] 0x67
	.word 0xfa290005  ! 1303: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xd4710005  ! 1303: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xe2310005  ! 1303: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xe82126dc  ! 1303: STW_I	stw	%r20, [%r4 + 0x06dc]
	.word 0xe8712cc8  ! 1303: STX_I	stx	%r20, [%r4 + 0x0cc8]
	.word 0xd8212ed4  ! 1303: STW_I	stw	%r12, [%r4 + 0x0ed4]
	.word 0xf6310005  ! 1303: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf0290005  ! 1303: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x32800003  ! 1303: BNE	bne,a	<label_0x3>
	.word 0xd8f18983  ! 1303: STXA_R	stxa	%r12, [%r6 + %r3] 0x4c
	.word 0xfa290005  ! 1312: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf8310005  ! 1312: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xf42127ac  ! 1312: STW_I	stw	%r26, [%r4 + 0x07ac]
	.word 0xe6212614  ! 1312: STW_I	stw	%r19, [%r4 + 0x0614]
	.word 0xf0310005  ! 1312: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xf2212218  ! 1312: STW_I	stw	%r25, [%r4 + 0x0218]
	.word 0xde210005  ! 1312: STW_R	stw	%r15, [%r4 + %r5]
	.word 0x0c800003  ! 1312: BNEG	bneg  	<label_0x3>
	.word 0xf82925bd  ! 1312: STB_I	stb	%r28, [%r4 + 0x05bd]
	.word 0xf4290005  ! 1322: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf6712388  ! 1322: STX_I	stx	%r27, [%r4 + 0x0388]
	.word 0xde292967  ! 1322: STB_I	stb	%r15, [%r4 + 0x0967]
	.word 0xe2212408  ! 1322: STW_I	stw	%r17, [%r4 + 0x0408]
	.word 0xfe710005  ! 1322: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xd8290005  ! 1322: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xd4210005  ! 1322: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xec310005  ! 1322: STH_R	sth	%r22, [%r4 + %r5]
	.word 0x00800001  ! 1322: BN	bn  	<label_0x1>
	.word 0xd8f0cce0  ! 1322: STXA_R	stxa	%r12, [%r3 + %r0] 0x67
	.word 0xe2290005  ! 1331: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xf22927f4  ! 1331: STB_I	stb	%r25, [%r4 + 0x07f4]
	.word 0xf4210005  ! 1331: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xfc212838  ! 1331: STW_I	stw	%r30, [%r4 + 0x0838]
	.word 0xe8290005  ! 1331: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe43127d0  ! 1331: STH_I	sth	%r18, [%r4 + 0x07d0]
	.word 0xf4212ce4  ! 1331: STW_I	stw	%r26, [%r4 + 0x0ce4]
	.word 0x08800003  ! 1331: BLEU	bleu  	<label_0x3>
	.word 0xd6f00968  ! 1331: STXA_R	stxa	%r11, [%r0 + %r8] 0x4b
	.word 0xe0290005  ! 1341: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xec292a4b  ! 1341: STB_I	stb	%r22, [%r4 + 0x0a4b]
	.word 0xd4212038  ! 1341: STW_I	stw	%r10, [%r4 + 0x0038]
	.word 0xd8710005  ! 1341: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xd8310005  ! 1341: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe8212248  ! 1341: STW_I	stw	%r20, [%r4 + 0x0248]
	.word 0xe8312a22  ! 1341: STH_I	sth	%r20, [%r4 + 0x0a22]
	.word 0xe6290005  ! 1341: STB_R	stb	%r19, [%r4 + %r5]
	.word 0x2ac90001  ! 1341: BRNZ	brnz,a,pt	%4,<label_0x90001>
	.word 0xfff12005  ! 1341: CASXA_R	casxa	[%r4]%asi, %r5, %r31
	.word 0xdc290005  ! 1351: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xec210005  ! 1351: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xf0310005  ! 1351: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xe8710005  ! 1351: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xee312a60  ! 1351: STH_I	sth	%r23, [%r4 + 0x0a60]
	.word 0xfe3123d2  ! 1351: STH_I	sth	%r31, [%r4 + 0x03d2]
	.word 0xfc292175  ! 1351: STB_I	stb	%r30, [%r4 + 0x0175]
	.word 0xfc210005  ! 1351: STW_R	stw	%r30, [%r4 + %r5]
	.word 0x28800003  ! 1351: BLEU	bleu,a	<label_0x3>
	.word 0xd8f08ce3  ! 1351: STXA_R	stxa	%r12, [%r2 + %r3] 0x67
	.word 0xf2290005  ! 1360: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xf8310005  ! 1360: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xe0292d32  ! 1360: STB_I	stb	%r16, [%r4 + 0x0d32]
	.word 0xe8710005  ! 1360: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xda212758  ! 1360: STW_I	stw	%r13, [%r4 + 0x0758]
	.word 0xe429234f  ! 1360: STB_I	stb	%r18, [%r4 + 0x034f]
	.word 0xd429213b  ! 1360: STB_I	stb	%r10, [%r4 + 0x013b]
	.word 0x2c800001  ! 1360: BNEG	bneg,a	<label_0x1>
	.word 0xf4b91005  ! 1360: STDA_R	stda	%r26, [%r4 + %r5] 0x80
	.word 0xfc290005  ! 1369: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xd8210005  ! 1369: STW_R	stw	%r12, [%r4 + %r5]
	.word 0xfc212848  ! 1369: STW_I	stw	%r30, [%r4 + 0x0848]
	.word 0xe82921de  ! 1369: STB_I	stb	%r20, [%r4 + 0x01de]
	.word 0xfc710005  ! 1369: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xec710005  ! 1369: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xd8290005  ! 1369: STB_R	stb	%r12, [%r4 + %r5]
	.word 0x12800001  ! 1369: BNE	bne  	<label_0x1>
	.word 0xd8f04ce0  ! 1369: STXA_R	stxa	%r12, [%r1 + %r0] 0x67
	.word 0xe2290005  ! 1378: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfe290005  ! 1378: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xe2210005  ! 1378: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xf0290005  ! 1378: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd6290005  ! 1378: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf4310005  ! 1378: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xf2290005  ! 1378: STB_R	stb	%r25, [%r4 + %r5]
	.word 0x12800003  ! 1378: BNE	bne  	<label_0x3>
	.word 0xf4a9214c  ! 1378: STBA_I	stba	%r26, [%r4 + 0x014c] %asi
	.word 0xf4290005  ! 1387: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xfa292c2e  ! 1387: STB_I	stb	%r29, [%r4 + 0x0c2e]
	.word 0xee312be6  ! 1387: STH_I	sth	%r23, [%r4 + 0x0be6]
	.word 0xea3124b6  ! 1387: STH_I	sth	%r21, [%r4 + 0x04b6]
	.word 0xea2925a5  ! 1387: STB_I	stb	%r21, [%r4 + 0x05a5]
	.word 0xd8310005  ! 1387: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe8310005  ! 1387: STH_R	sth	%r20, [%r4 + %r5]
	.word 0x3a800003  ! 1387: BCC	bcc,a	<label_0x3>
	.word 0xd8f0c982  ! 1387: STXA_R	stxa	%r12, [%r3 + %r2] 0x4c
	.word 0xf0290005  ! 1396: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xde310005  ! 1396: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xe8290005  ! 1396: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xdc712150  ! 1396: STX_I	stx	%r14, [%r4 + 0x0150]
	.word 0xfa212ac4  ! 1396: STW_I	stw	%r29, [%r4 + 0x0ac4]
	.word 0xe2310005  ! 1396: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xf229204c  ! 1396: STB_I	stb	%r25, [%r4 + 0x004c]
	.word 0x2a800001  ! 1396: BCS	bcs,a	<label_0x1>
	.word 0xd6f18989  ! 1396: STXA_R	stxa	%r11, [%r6 + %r9] 0x4c
	.word 0xee290005  ! 1405: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe6292329  ! 1405: STB_I	stb	%r19, [%r4 + 0x0329]
	.word 0xda290005  ! 1405: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe6712fb8  ! 1405: STX_I	stx	%r19, [%r4 + 0x0fb8]
	.word 0xea290005  ! 1405: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xda212d2c  ! 1405: STW_I	stw	%r13, [%r4 + 0x0d2c]
	.word 0xea7126c8  ! 1405: STX_I	stx	%r21, [%r4 + 0x06c8]
	.word 0x0a800003  ! 1405: BCS	bcs  	<label_0x3>
	.word 0xd6f00ce0  ! 1405: STXA_R	stxa	%r11, [%r0 + %r0] 0x67
	.word 0xda290005  ! 1415: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xee290005  ! 1415: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe27128a8  ! 1415: STX_I	stx	%r17, [%r4 + 0x08a8]
	.word 0xf0210005  ! 1415: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xe2290005  ! 1415: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee212a48  ! 1415: STW_I	stw	%r23, [%r4 + 0x0a48]
	.word 0xe2290005  ! 1415: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc712da8  ! 1415: STX_I	stx	%r30, [%r4 + 0x0da8]
	.word 0x26800001  ! 1415: BL	bl,a	<label_0x1>
	.word 0xd8f1c963  ! 1415: STXA_R	stxa	%r12, [%r7 + %r3] 0x4b
	.word 0xd6290005  ! 1424: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe2310005  ! 1424: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xfc210005  ! 1424: STW_R	stw	%r30, [%r4 + %r5]
	.word 0xf27124d8  ! 1424: STX_I	stx	%r25, [%r4 + 0x04d8]
	.word 0xde290005  ! 1424: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xf0710005  ! 1424: STX_R	stx	%r24, [%r4 + %r5]
	.word 0xd4712060  ! 1424: STX_I	stx	%r10, [%r4 + 0x0060]
	.word 0x26c10003  ! 1424: BRLZ	brlz,a,nt	%4,<label_0x10003>
	.word 0xd6f24982  ! 1424: STXA_R	stxa	%r11, [%r9 + %r2] 0x4c
	.word 0xf0290005  ! 1434: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xee212c78  ! 1434: STW_I	stw	%r23, [%r4 + 0x0c78]
	.word 0xd6290005  ! 1434: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xfe712c28  ! 1434: STX_I	stx	%r31, [%r4 + 0x0c28]
	.word 0xd8710005  ! 1434: STX_R	stx	%r12, [%r4 + %r5]
	.word 0xe82927cd  ! 1434: STB_I	stb	%r20, [%r4 + 0x07cd]
	.word 0xdc710005  ! 1434: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xfc310005  ! 1434: STH_R	sth	%r30, [%r4 + %r5]
	.word 0x16800001  ! 1434: BGE	bge  	<label_0x1>
	.word 0xd8f18ce3  ! 1434: STXA_R	stxa	%r12, [%r6 + %r3] 0x67
	.word 0xf4290005  ! 1444: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf6292f50  ! 1444: STB_I	stb	%r27, [%r4 + 0x0f50]
	.word 0xde212f9c  ! 1444: STW_I	stw	%r15, [%r4 + 0x0f9c]
	.word 0xec2925fb  ! 1444: STB_I	stb	%r22, [%r4 + 0x05fb]
	.word 0xfc710005  ! 1444: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xd43121c4  ! 1444: STH_I	sth	%r10, [%r4 + 0x01c4]
	.word 0xfc290005  ! 1444: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xdc2927c1  ! 1444: STB_I	stb	%r14, [%r4 + 0x07c1]
	.word 0x34800001  ! 1444: BG	bg,a	<label_0x1>
	.word 0xd6f0c980  ! 1444: STXA_R	stxa	%r11, [%r3 + %r0] 0x4c
	.word 0xf4290005  ! 1454: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xde310005  ! 1454: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xdc712030  ! 1454: STX_I	stx	%r14, [%r4 + 0x0030]
	.word 0xda210005  ! 1454: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xf0210005  ! 1454: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xf6712b08  ! 1454: STX_I	stx	%r27, [%r4 + 0x0b08]
	.word 0xfe710005  ! 1454: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xee7128b8  ! 1454: STX_I	stx	%r23, [%r4 + 0x08b8]
	.word 0x06c10001  ! 1454: BRLZ	brlz  ,nt	%4,<label_0x10001>
	.word 0xeca11005  ! 1454: STWA_R	stwa	%r22, [%r4 + %r5] 0x80
	.word 0xd6290005  ! 1463: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe43129a0  ! 1463: STH_I	sth	%r18, [%r4 + 0x09a0]
	.word 0xe8710005  ! 1463: STX_R	stx	%r20, [%r4 + %r5]
	.word 0xec310005  ! 1463: STH_R	sth	%r22, [%r4 + %r5]
	.word 0xe0210005  ! 1463: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xf4312944  ! 1463: STH_I	sth	%r26, [%r4 + 0x0944]
	.word 0xf0312890  ! 1463: STH_I	sth	%r24, [%r4 + 0x0890]
	.word 0x0c800003  ! 1463: BNEG	bneg  	<label_0x3>
	.word 0xd6f0c966  ! 1463: STXA_R	stxa	%r11, [%r3 + %r6] 0x4b
	.word 0xfe290005  ! 1472: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xee310005  ! 1472: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xf4312964  ! 1472: STH_I	sth	%r26, [%r4 + 0x0964]
	.word 0xea712808  ! 1472: STX_I	stx	%r21, [%r4 + 0x0808]
	.word 0xdc210005  ! 1472: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xde2129d4  ! 1472: STW_I	stw	%r15, [%r4 + 0x09d4]
	.word 0xfc712ea8  ! 1472: STX_I	stx	%r30, [%r4 + 0x0ea8]
	.word 0x2e800001  ! 1472: BVS	bvs,a	<label_0x1>
	.word 0xef210005  ! 1472: STF_R	st	%f23, [%r5, %r4]
	.word 0xf6290005  ! 1482: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xea710005  ! 1482: STX_R	stx	%r21, [%r4 + %r5]
	.word 0xfc310005  ! 1482: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xe6212c50  ! 1482: STW_I	stw	%r19, [%r4 + 0x0c50]
	.word 0xd4710005  ! 1482: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xfc710005  ! 1482: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf0212604  ! 1482: STW_I	stw	%r24, [%r4 + 0x0604]
	.word 0xd62922d8  ! 1482: STB_I	stb	%r11, [%r4 + 0x02d8]
	.word 0x3e800003  ! 1482: BVC	bvc,a	<label_0x3>
	.word 0xd6f08ce3  ! 1482: STXA_R	stxa	%r11, [%r2 + %r3] 0x67
	.word 0xf4290005  ! 1491: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe6710005  ! 1491: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xd82121d0  ! 1491: STW_I	stw	%r12, [%r4 + 0x01d0]
	.word 0xf0210005  ! 1491: STW_R	stw	%r24, [%r4 + %r5]
	.word 0xec312214  ! 1491: STH_I	sth	%r22, [%r4 + 0x0214]
	.word 0xf4292466  ! 1491: STB_I	stb	%r26, [%r4 + 0x0466]
	.word 0xea290005  ! 1491: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x02800001  ! 1491: BE	be  	<label_0x1>
	.word 0xd8f18ce1  ! 1491: STXA_R	stxa	%r12, [%r6 + %r1] 0x67
	.word 0xfc290005  ! 1501: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xf82922c3  ! 1501: STB_I	stb	%r28, [%r4 + 0x02c3]
	.word 0xde292f40  ! 1501: STB_I	stb	%r15, [%r4 + 0x0f40]
	.word 0xe8310005  ! 1501: STH_R	sth	%r20, [%r4 + %r5]
	.word 0xf0290005  ! 1501: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xda212878  ! 1501: STW_I	stw	%r13, [%r4 + 0x0878]
	.word 0xd4710005  ! 1501: STX_R	stx	%r10, [%r4 + %r5]
	.word 0xfe2120c8  ! 1501: STW_I	stw	%r31, [%r4 + 0x00c8]
	.word 0x04800001  ! 1501: BLE	ble  	<label_0x1>
	.word 0xdaa9220c  ! 1501: STBA_I	stba	%r13, [%r4 + 0x020c] %asi
	.word 0xe0290005  ! 1511: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xd82927a7  ! 1511: STB_I	stb	%r12, [%r4 + 0x07a7]
	.word 0xe2310005  ! 1511: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xe47129d8  ! 1511: STX_I	stx	%r18, [%r4 + 0x09d8]
	.word 0xfa31295c  ! 1511: STH_I	sth	%r29, [%r4 + 0x095c]
	.word 0xf8712148  ! 1511: STX_I	stx	%r28, [%r4 + 0x0148]
	.word 0xda292cb6  ! 1511: STB_I	stb	%r13, [%r4 + 0x0cb6]
	.word 0xf0712368  ! 1511: STX_I	stx	%r24, [%r4 + 0x0368]
	.word 0x0ac10001  ! 1511: BRNZ	brnz  ,nt	%4,<label_0x10001>
	.word 0xd6f00960  ! 1511: STXA_R	stxa	%r11, [%r0 + %r0] 0x4b
	.word 0xf6290005  ! 1520: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xea2926e4  ! 1520: STB_I	stb	%r21, [%r4 + 0x06e4]
	.word 0xfc710005  ! 1520: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xf4710005  ! 1520: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xe0212b48  ! 1520: STW_I	stw	%r16, [%r4 + 0x0b48]
	.word 0xf4310005  ! 1520: STH_R	sth	%r26, [%r4 + %r5]
	.word 0xfe210005  ! 1520: STW_R	stw	%r31, [%r4 + %r5]
	.word 0x0ac10003  ! 1520: BRNZ	brnz  ,nt	%4,<label_0x10003>
	.word 0xd8f0c961  ! 1520: STXA_R	stxa	%r12, [%r3 + %r1] 0x4b
	.word 0xd4290005  ! 1530: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xea292e7f  ! 1530: STB_I	stb	%r21, [%r4 + 0x0e7f]
	.word 0xda310005  ! 1530: STH_R	sth	%r13, [%r4 + %r5]
	.word 0xd6312f16  ! 1530: STH_I	sth	%r11, [%r4 + 0x0f16]
	.word 0xde290005  ! 1530: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe6210005  ! 1530: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xfe212728  ! 1530: STW_I	stw	%r31, [%r4 + 0x0728]
	.word 0xf4710005  ! 1530: STX_R	stx	%r26, [%r4 + %r5]
	.word 0x04800003  ! 1530: BLE	ble  	<label_0x3>
	.word 0xd9390005  ! 1530: STDF_R	std	%f12, [%r5, %r4]
	.word 0xfa290005  ! 1540: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf4710005  ! 1540: STX_R	stx	%r26, [%r4 + %r5]
	.word 0xf0290005  ! 1540: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xe6210005  ! 1540: STW_R	stw	%r19, [%r4 + %r5]
	.word 0xe2712818  ! 1540: STX_I	stx	%r17, [%r4 + 0x0818]
	.word 0xd8310005  ! 1540: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xe8292f5d  ! 1540: STB_I	stb	%r20, [%r4 + 0x0f5d]
	.word 0xf4712a90  ! 1540: STX_I	stx	%r26, [%r4 + 0x0a90]
	.word 0x04800001  ! 1540: BLE	ble  	<label_0x1>
	.word 0xf4f92c9c  ! 1540: SWAPA_I	swapa	%r26, [%r4 + 0x0c9c] %asi
	.word 0xde290005  ! 1550: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xe0712960  ! 1550: STX_I	stx	%r16, [%r4 + 0x0960]
	.word 0xf0212338  ! 1550: STW_I	stw	%r24, [%r4 + 0x0338]
	.word 0xe4712e08  ! 1550: STX_I	stx	%r18, [%r4 + 0x0e08]
	.word 0xee210005  ! 1550: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xe8210005  ! 1550: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xfe212cfc  ! 1550: STW_I	stw	%r31, [%r4 + 0x0cfc]
	.word 0xe2710005  ! 1550: STX_R	stx	%r17, [%r4 + %r5]
	.word 0x30800001  ! 1550: BA	ba,a	<label_0x1>
	.word 0xdb212d30  ! 1550: STF_I	st	%f13, [0x0d30, %r4]
	.word 0xfe290005  ! 1559: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xec21221c  ! 1559: STW_I	stw	%r22, [%r4 + 0x021c]
	.word 0xf2310005  ! 1559: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xf0310005  ! 1559: STH_R	sth	%r24, [%r4 + %r5]
	.word 0xfa210005  ! 1559: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xf6210005  ! 1559: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xfc710005  ! 1559: STX_R	stx	%r30, [%r4 + %r5]
	.word 0x28800001  ! 1559: BLEU	bleu,a	<label_0x1>
	.word 0xd6f20960  ! 1559: STXA_R	stxa	%r11, [%r8 + %r0] 0x4b
	.word 0xe6290005  ! 1568: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xf2310005  ! 1568: STH_R	sth	%r25, [%r4 + %r5]
	.word 0xea712c18  ! 1568: STX_I	stx	%r21, [%r4 + 0x0c18]
	.word 0xe4210005  ! 1568: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xde2922ad  ! 1568: STB_I	stb	%r15, [%r4 + 0x02ad]
	.word 0xfe712920  ! 1568: STX_I	stx	%r31, [%r4 + 0x0920]
	.word 0xfa290005  ! 1568: STB_R	stb	%r29, [%r4 + %r5]
	.word 0x00800001  ! 1568: BN	bn  	<label_0x1>
	.word 0xde7921a4  ! 1568: SWAP_I	swap	%r15, [%r4 + 0x01a4]
	.word 0xda290005  ! 1577: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xea212b18  ! 1577: STW_I	stw	%r21, [%r4 + 0x0b18]
	.word 0xf6212c30  ! 1577: STW_I	stw	%r27, [%r4 + 0x0c30]
	.word 0xfc310005  ! 1577: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xdc29266b  ! 1577: STB_I	stb	%r14, [%r4 + 0x066b]
	.word 0xe0310005  ! 1577: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xf8292afd  ! 1577: STB_I	stb	%r28, [%r4 + 0x0afd]
	.word 0x02800003  ! 1577: BE	be  	<label_0x3>
	.word 0xd8f1c980  ! 1577: STXA_R	stxa	%r12, [%r7 + %r0] 0x4c
	.word 0xf0290005  ! 1586: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xfa710005  ! 1586: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xde212e0c  ! 1586: STW_I	stw	%r15, [%r4 + 0x0e0c]
	.word 0xe2210005  ! 1586: STW_R	stw	%r17, [%r4 + %r5]
	.word 0xe8212668  ! 1586: STW_I	stw	%r20, [%r4 + 0x0668]
	.word 0xe4710005  ! 1586: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xda292726  ! 1586: STB_I	stb	%r13, [%r4 + 0x0726]
	.word 0x04c90003  ! 1586: BRLEZ	brlez  ,pt	%4,<label_0x90003>
	.word 0xd6f0cce6  ! 1586: STXA_R	stxa	%r11, [%r3 + %r6] 0x67
	.word 0xf8290005  ! 1596: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd431247a  ! 1596: STH_I	sth	%r10, [%r4 + 0x047a]
	.word 0xec712b68  ! 1596: STX_I	stx	%r22, [%r4 + 0x0b68]
	.word 0xde310005  ! 1596: STH_R	sth	%r15, [%r4 + %r5]
	.word 0xf4212324  ! 1596: STW_I	stw	%r26, [%r4 + 0x0324]
	.word 0xd6210005  ! 1596: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xe8712210  ! 1596: STX_I	stx	%r20, [%r4 + 0x0210]
	.word 0xea710005  ! 1596: STX_R	stx	%r21, [%r4 + %r5]
	.word 0x30800001  ! 1596: BA	ba,a	<label_0x1>
	.word 0xf4b92078  ! 1596: STDA_I	stda	%r26, [%r4 + 0x0078] %asi
	.word 0xdc290005  ! 1606: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfa210005  ! 1606: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xe02123fc  ! 1606: STW_I	stw	%r16, [%r4 + 0x03fc]
	.word 0xfc2920b5  ! 1606: STB_I	stb	%r30, [%r4 + 0x00b5]
	.word 0xe8210005  ! 1606: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xe02124e0  ! 1606: STW_I	stw	%r16, [%r4 + 0x04e0]
	.word 0xda212db8  ! 1606: STW_I	stw	%r13, [%r4 + 0x0db8]
	.word 0xea290005  ! 1606: STB_R	stb	%r21, [%r4 + %r5]
	.word 0x2e800001  ! 1606: BVS	bvs,a	<label_0x1>
	.word 0xeaa92af3  ! 1606: STBA_I	stba	%r21, [%r4 + 0x0af3] %asi
	.word 0xe6290005  ! 1615: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xd6710005  ! 1615: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xea2125a8  ! 1615: STW_I	stw	%r21, [%r4 + 0x05a8]
	.word 0xd42128b0  ! 1615: STW_I	stw	%r10, [%r4 + 0x08b0]
	.word 0xdc712420  ! 1615: STX_I	stx	%r14, [%r4 + 0x0420]
	.word 0xda212894  ! 1615: STW_I	stw	%r13, [%r4 + 0x0894]
	.word 0xea210005  ! 1615: STW_R	stw	%r21, [%r4 + %r5]
	.word 0x36800001  ! 1615: BGE	bge,a	<label_0x1>
	.word 0xd6f08ce1  ! 1615: STXA_R	stxa	%r11, [%r2 + %r1] 0x67
	.word 0xf2290005  ! 1624: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xec290005  ! 1624: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xe6292b3d  ! 1624: STB_I	stb	%r19, [%r4 + 0x0b3d]
	.word 0xe4210005  ! 1624: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xf4712218  ! 1624: STX_I	stx	%r26, [%r4 + 0x0218]
	.word 0xe42128cc  ! 1624: STW_I	stw	%r18, [%r4 + 0x08cc]
	.word 0xd62920db  ! 1624: STB_I	stb	%r11, [%r4 + 0x00db]
	.word 0x06800001  ! 1624: BL	bl  	<label_0x1>
	.word 0xfae92bf2  ! 1624: LDSTUBA_I	ldstuba	%r29, [%r4 + 0x0bf2] %asi
	.word 0xe8290005  ! 1633: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe2290005  ! 1633: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xfc312dac  ! 1633: STH_I	sth	%r30, [%r4 + 0x0dac]
	.word 0xd8712148  ! 1633: STX_I	stx	%r12, [%r4 + 0x0148]
	.word 0xf23124a2  ! 1633: STH_I	sth	%r25, [%r4 + 0x04a2]
	.word 0xe4312582  ! 1633: STH_I	sth	%r18, [%r4 + 0x0582]
	.word 0xfc7125a8  ! 1633: STX_I	stx	%r30, [%r4 + 0x05a8]
	.word 0x0e800003  ! 1633: BVS	bvs  	<label_0x3>
	.word 0xd6f0c963  ! 1633: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xec290005  ! 1643: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xd8312ee2  ! 1643: STH_I	sth	%r12, [%r4 + 0x0ee2]
	.word 0xd6310005  ! 1643: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe8290005  ! 1643: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xd43129bc  ! 1643: STH_I	sth	%r10, [%r4 + 0x09bc]
	.word 0xe0310005  ! 1643: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xee210005  ! 1643: STW_R	stw	%r23, [%r4 + %r5]
	.word 0xe029296f  ! 1643: STB_I	stb	%r16, [%r4 + 0x096f]
	.word 0x2c800001  ! 1643: BNEG	bneg,a	<label_0x1>
	.word 0xd6f1c963  ! 1643: STXA_R	stxa	%r11, [%r7 + %r3] 0x4b
	.word 0xf4290005  ! 1652: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf6212414  ! 1652: STW_I	stw	%r27, [%r4 + 0x0414]
	.word 0xe6310005  ! 1652: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xe6710005  ! 1652: STX_R	stx	%r19, [%r4 + %r5]
	.word 0xfc712648  ! 1652: STX_I	stx	%r30, [%r4 + 0x0648]
	.word 0xf0292d52  ! 1652: STB_I	stb	%r24, [%r4 + 0x0d52]
	.word 0xec210005  ! 1652: STW_R	stw	%r22, [%r4 + %r5]
	.word 0x38800001  ! 1652: BGU	bgu,a	<label_0x1>
	.word 0xd6f08989  ! 1652: STXA_R	stxa	%r11, [%r2 + %r9] 0x4c
	.word 0xf0290005  ! 1661: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xd4712f68  ! 1661: STX_I	stx	%r10, [%r4 + 0x0f68]
	.word 0xfe312a74  ! 1661: STH_I	sth	%r31, [%r4 + 0x0a74]
	.word 0xfc29289b  ! 1661: STB_I	stb	%r30, [%r4 + 0x089b]
	.word 0xdc310005  ! 1661: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xf22120d0  ! 1661: STW_I	stw	%r25, [%r4 + 0x00d0]
	.word 0xf8210005  ! 1661: STW_R	stw	%r28, [%r4 + %r5]
	.word 0x28800001  ! 1661: BLEU	bleu,a	<label_0x1>
	.word 0xd6f0c963  ! 1661: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xe0290005  ! 1670: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xf4212990  ! 1670: STW_I	stw	%r26, [%r4 + 0x0990]
	.word 0xfc31262e  ! 1670: STH_I	sth	%r30, [%r4 + 0x062e]
	.word 0xdc710005  ! 1670: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf6210005  ! 1670: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xea712180  ! 1670: STX_I	stx	%r21, [%r4 + 0x0180]
	.word 0xdc710005  ! 1670: STX_R	stx	%r14, [%r4 + %r5]
	.word 0x1c800001  ! 1670: BPOS	bpos  	<label_0x1>
	.word 0xd6f20ce3  ! 1670: STXA_R	stxa	%r11, [%r8 + %r3] 0x67
	.word 0xda290005  ! 1679: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xd6210005  ! 1679: STW_R	stw	%r11, [%r4 + %r5]
	.word 0xee312ece  ! 1679: STH_I	sth	%r23, [%r4 + 0x0ece]
	.word 0xee712cf8  ! 1679: STX_I	stx	%r23, [%r4 + 0x0cf8]
	.word 0xda312e5e  ! 1679: STH_I	sth	%r13, [%r4 + 0x0e5e]
	.word 0xe8212a14  ! 1679: STW_I	stw	%r20, [%r4 + 0x0a14]
	.word 0xf0310005  ! 1679: STH_R	sth	%r24, [%r4 + %r5]
	.word 0x1e800001  ! 1679: BVC	bvc  	<label_0x1>
	.word 0xd6f08980  ! 1679: STXA_R	stxa	%r11, [%r2 + %r0] 0x4c
	.word 0xe6290005  ! 1689: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xda290005  ! 1689: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe2712b90  ! 1689: STX_I	stx	%r17, [%r4 + 0x0b90]
	.word 0xea290005  ! 1689: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd4290005  ! 1689: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xe0310005  ! 1689: STH_R	sth	%r16, [%r4 + %r5]
	.word 0xd6212c04  ! 1689: STW_I	stw	%r11, [%r4 + 0x0c04]
	.word 0xf2312f92  ! 1689: STH_I	sth	%r25, [%r4 + 0x0f92]
	.word 0x08800003  ! 1689: BLEU	bleu  	<label_0x3>
	.word 0xdc7125b0  ! 1689: STX_I	stx	%r14, [%r4 + 0x05b0]
	.word 0xf8290005  ! 1698: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd8712810  ! 1698: STX_I	stx	%r12, [%r4 + 0x0810]
	.word 0xee710005  ! 1698: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xee290005  ! 1698: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xf0292063  ! 1698: STB_I	stb	%r24, [%r4 + 0x0063]
	.word 0xfa210005  ! 1698: STW_R	stw	%r29, [%r4 + %r5]
	.word 0xdc710005  ! 1698: STX_R	stx	%r14, [%r4 + %r5]
	.word 0x0a800001  ! 1698: BCS	bcs  	<label_0x1>
	.word 0xd6f04982  ! 1698: STXA_R	stxa	%r11, [%r1 + %r2] 0x4c
	.word 0xe8290005  ! 1707: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xee312ac6  ! 1707: STH_I	sth	%r23, [%r4 + 0x0ac6]
	.word 0xda3120f4  ! 1707: STH_I	sth	%r13, [%r4 + 0x00f4]
	.word 0xde212d08  ! 1707: STW_I	stw	%r15, [%r4 + 0x0d08]
	.word 0xd8310005  ! 1707: STH_R	sth	%r12, [%r4 + %r5]
	.word 0xdc710005  ! 1707: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xfc712768  ! 1707: STX_I	stx	%r30, [%r4 + 0x0768]
	.word 0x20800001  ! 1707: BN	bn,a	<label_0x1>
	.word 0xee2127cc  ! 1707: STW_I	stw	%r23, [%r4 + 0x07cc]
	.word 0xe8290005  ! 1716: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xde210005  ! 1716: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe2310005  ! 1716: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xea312578  ! 1716: STH_I	sth	%r21, [%r4 + 0x0578]
	.word 0xdc292ed7  ! 1716: STB_I	stb	%r14, [%r4 + 0x0ed7]
	.word 0xd62123cc  ! 1716: STW_I	stw	%r11, [%r4 + 0x03cc]
	.word 0xe2712ca8  ! 1716: STX_I	stx	%r17, [%r4 + 0x0ca8]
	.word 0x1e800001  ! 1716: BVC	bvc  	<label_0x1>
	.word 0xe7f12005  ! 1716: CASXA_R	casxa	[%r4]%asi, %r5, %r19
	.word 0xf0290005  ! 1726: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xf2710005  ! 1726: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xf4712bb0  ! 1726: STX_I	stx	%r26, [%r4 + 0x0bb0]
	.word 0xd4212358  ! 1726: STW_I	stw	%r10, [%r4 + 0x0358]
	.word 0xf8712738  ! 1726: STX_I	stx	%r28, [%r4 + 0x0738]
	.word 0xf8310005  ! 1726: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xee312b26  ! 1726: STH_I	sth	%r23, [%r4 + 0x0b26]
	.word 0xf6710005  ! 1726: STX_R	stx	%r27, [%r4 + %r5]
	.word 0x22c10003  ! 1726: BRZ	brz,a,nt	%4,<label_0x10003>
	.word 0xfdf12005  ! 1726: CASXA_R	casxa	[%r4]%asi, %r5, %r30
	.word 0xea290005  ! 1735: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xd4292eed  ! 1735: STB_I	stb	%r10, [%r4 + 0x0eed]
	.word 0xdc710005  ! 1735: STX_R	stx	%r14, [%r4 + %r5]
	.word 0xf6712528  ! 1735: STX_I	stx	%r27, [%r4 + 0x0528]
	.word 0xd6710005  ! 1735: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xd8292954  ! 1735: STB_I	stb	%r12, [%r4 + 0x0954]
	.word 0xee310005  ! 1735: STH_R	sth	%r23, [%r4 + %r5]
	.word 0x02800001  ! 1735: BE	be  	<label_0x1>
	.word 0xd8f04ce0  ! 1735: STXA_R	stxa	%r12, [%r1 + %r0] 0x67
	.word 0xf8290005  ! 1744: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe6310005  ! 1744: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xd4210005  ! 1744: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xdc210005  ! 1744: STW_R	stw	%r14, [%r4 + %r5]
	.word 0xd6310005  ! 1744: STH_R	sth	%r11, [%r4 + %r5]
	.word 0xe6310005  ! 1744: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xe0712768  ! 1744: STX_I	stx	%r16, [%r4 + 0x0768]
	.word 0x1a800001  ! 1744: BCC	bcc  	<label_0x1>
	.word 0xfd210005  ! 1744: STF_R	st	%f30, [%r5, %r4]
	.word 0xe2290005  ! 1753: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe0210005  ! 1753: STW_R	stw	%r16, [%r4 + %r5]
	.word 0xee310005  ! 1753: STH_R	sth	%r23, [%r4 + %r5]
	.word 0xd4212124  ! 1753: STW_I	stw	%r10, [%r4 + 0x0124]
	.word 0xf6710005  ! 1753: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xf6710005  ! 1753: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xec310005  ! 1753: STH_R	sth	%r22, [%r4 + %r5]
	.word 0x04800001  ! 1753: BLE	ble  	<label_0x1>
	.word 0xd6f1c980  ! 1753: STXA_R	stxa	%r11, [%r7 + %r0] 0x4c
	.word 0xd6290005  ! 1763: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xe8712648  ! 1763: STX_I	stx	%r20, [%r4 + 0x0648]
	.word 0xde292d7d  ! 1763: STB_I	stb	%r15, [%r4 + 0x0d7d]
	.word 0xda312d4c  ! 1763: STH_I	sth	%r13, [%r4 + 0x0d4c]
	.word 0xe6290005  ! 1763: STB_R	stb	%r19, [%r4 + %r5]
	.word 0xde210005  ! 1763: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xe2710005  ! 1763: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xec2924c6  ! 1763: STB_I	stb	%r22, [%r4 + 0x04c6]
	.word 0x40000001  ! 1763: CALL	call	disp30_1
	.word 0xdaf92c1c  ! 1763: SWAPA_I	swapa	%r13, [%r4 + 0x0c1c] %asi
	.word 0xf0290005  ! 1772: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xde212764  ! 1772: STW_I	stw	%r15, [%r4 + 0x0764]
	.word 0xec710005  ! 1772: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xe4210005  ! 1772: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xfa710005  ! 1772: STX_R	stx	%r29, [%r4 + %r5]
	.word 0xd6212060  ! 1772: STW_I	stw	%r11, [%r4 + 0x0060]
	.word 0xf43127ce  ! 1772: STH_I	sth	%r26, [%r4 + 0x07ce]
	.word 0x24800003  ! 1772: BLE	ble,a	<label_0x3>
	.word 0xfcb91005  ! 1772: STDA_R	stda	%r30, [%r4 + %r5] 0x80
	.word 0xf2290005  ! 1781: STB_R	stb	%r25, [%r4 + %r5]
	.word 0xfe3123e0  ! 1781: STH_I	sth	%r31, [%r4 + 0x03e0]
	.word 0xe6310005  ! 1781: STH_R	sth	%r19, [%r4 + %r5]
	.word 0xf6210005  ! 1781: STW_R	stw	%r27, [%r4 + %r5]
	.word 0xf6290005  ! 1781: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xde712f68  ! 1781: STX_I	stx	%r15, [%r4 + 0x0f68]
	.word 0xe0710005  ! 1781: STX_R	stx	%r16, [%r4 + %r5]
	.word 0x2ac90001  ! 1781: BRNZ	brnz,a,pt	%4,<label_0x90001>
	.word 0xd8f00ce2  ! 1781: STXA_R	stxa	%r12, [%r0 + %r2] 0x67
	.word 0xee290005  ! 1791: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xe8712c60  ! 1791: STX_I	stx	%r20, [%r4 + 0x0c60]
	.word 0xf0290005  ! 1791: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xec710005  ! 1791: STX_R	stx	%r22, [%r4 + %r5]
	.word 0xea312838  ! 1791: STH_I	sth	%r21, [%r4 + 0x0838]
	.word 0xda31286c  ! 1791: STH_I	sth	%r13, [%r4 + 0x086c]
	.word 0xe2312f90  ! 1791: STH_I	sth	%r17, [%r4 + 0x0f90]
	.word 0xf6292d6f  ! 1791: STB_I	stb	%r27, [%r4 + 0x0d6f]
	.word 0x0cc10001  ! 1791: BRGZ	brgz  ,nt	%4,<label_0x10001>
	.word 0xdb210005  ! 1791: STF_R	st	%f13, [%r5, %r4]
	.word 0xfa290005  ! 1800: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe87122c0  ! 1800: STX_I	stx	%r20, [%r4 + 0x02c0]
	.word 0xf2212280  ! 1800: STW_I	stw	%r25, [%r4 + 0x0280]
	.word 0xe4310005  ! 1800: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xd6710005  ! 1800: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xfa712280  ! 1800: STX_I	stx	%r29, [%r4 + 0x0280]
	.word 0xea3125e2  ! 1800: STH_I	sth	%r21, [%r4 + 0x05e2]
	.word 0x1a800001  ! 1800: BCC	bcc  	<label_0x1>
	.word 0xe87920a0  ! 1800: SWAP_I	swap	%r20, [%r4 + 0x00a0]
	.word 0xfe290005  ! 1809: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xf8710005  ! 1809: STX_R	stx	%r28, [%r4 + %r5]
	.word 0xec210005  ! 1809: STW_R	stw	%r22, [%r4 + %r5]
	.word 0xe6212bc0  ! 1809: STW_I	stw	%r19, [%r4 + 0x0bc0]
	.word 0xf6310005  ! 1809: STH_R	sth	%r27, [%r4 + %r5]
	.word 0xf6710005  ! 1809: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xe0310005  ! 1809: STH_R	sth	%r16, [%r4 + %r5]
	.word 0x1e800003  ! 1809: BVC	bvc  	<label_0x3>
	.word 0xd6f04ce0  ! 1809: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xd8290005  ! 1819: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xec290005  ! 1819: STB_R	stb	%r22, [%r4 + %r5]
	.word 0xf0212348  ! 1819: STW_I	stw	%r24, [%r4 + 0x0348]
	.word 0xe6712e60  ! 1819: STX_I	stx	%r19, [%r4 + 0x0e60]
	.word 0xdc212450  ! 1819: STW_I	stw	%r14, [%r4 + 0x0450]
	.word 0xd8292ab2  ! 1819: STB_I	stb	%r12, [%r4 + 0x0ab2]
	.word 0xde210005  ! 1819: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xfa290005  ! 1819: STB_R	stb	%r29, [%r4 + %r5]
	.word 0x26c90003  ! 1819: BRLZ	brlz,a,pt	%4,<label_0x90003>
	.word 0xfd392810  ! 1819: STDF_I	std	%f30, [0x0810, %r4]
	.word 0xfc290005  ! 1828: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xfc310005  ! 1828: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xe4210005  ! 1828: STW_R	stw	%r18, [%r4 + %r5]
	.word 0xf2292a61  ! 1828: STB_I	stb	%r25, [%r4 + 0x0a61]
	.word 0xe0712520  ! 1828: STX_I	stx	%r16, [%r4 + 0x0520]
	.word 0xdc712870  ! 1828: STX_I	stx	%r14, [%r4 + 0x0870]
	.word 0xe6212ab0  ! 1828: STW_I	stw	%r19, [%r4 + 0x0ab0]
	.word 0x02c90001  ! 1828: BRZ	brz  ,pt	%4,<label_0x90001>
	.word 0xd6f20ce3  ! 1828: STXA_R	stxa	%r11, [%r8 + %r3] 0x67
	.word 0xf6290005  ! 1837: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xf4312654  ! 1837: STH_I	sth	%r26, [%r4 + 0x0654]
	.word 0xea310005  ! 1837: STH_R	sth	%r21, [%r4 + %r5]
	.word 0xfa212cd0  ! 1837: STW_I	stw	%r29, [%r4 + 0x0cd0]
	.word 0xd6290005  ! 1837: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xec7129e8  ! 1837: STX_I	stx	%r22, [%r4 + 0x09e8]
	.word 0xf0310005  ! 1837: STH_R	sth	%r24, [%r4 + %r5]
	.word 0x2cc10003  ! 1837: BRGZ	brgz,a,nt	%4,<label_0x10003>
	.word 0xd8312f3c  ! 1837: STH_I	sth	%r12, [%r4 + 0x0f3c]
	.word 0xf8290005  ! 1846: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd4290005  ! 1846: STB_R	stb	%r10, [%r4 + %r5]
	.word 0xf6290005  ! 1846: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xda312b9c  ! 1846: STH_I	sth	%r13, [%r4 + 0x0b9c]
	.word 0xf0290005  ! 1846: STB_R	stb	%r24, [%r4 + %r5]
	.word 0xee292425  ! 1846: STB_I	stb	%r23, [%r4 + 0x0425]
	.word 0xdc210005  ! 1846: STW_R	stw	%r14, [%r4 + %r5]
	.word 0x2cc10001  ! 1846: BRGZ	brgz,a,nt	%4,<label_0x10001>
	.word 0xd6f18980  ! 1846: STXA_R	stxa	%r11, [%r6 + %r0] 0x4c
	.word 0xd6290005  ! 1855: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xd83126e0  ! 1855: STH_I	sth	%r12, [%r4 + 0x06e0]
	.word 0xec712550  ! 1855: STX_I	stx	%r22, [%r4 + 0x0550]
	.word 0xf2710005  ! 1855: STX_R	stx	%r25, [%r4 + %r5]
	.word 0xfe310005  ! 1855: STH_R	sth	%r31, [%r4 + %r5]
	.word 0xf8312d20  ! 1855: STH_I	sth	%r28, [%r4 + 0x0d20]
	.word 0xf6310005  ! 1855: STH_R	sth	%r27, [%r4 + %r5]
	.word 0x2ec90001  ! 1855: BRGEZ	brgez,a,pt	%4,<label_0x90001>
	.word 0xf2b125d0  ! 1855: STHA_I	stha	%r25, [%r4 + 0x05d0] %asi
	.word 0xe2290005  ! 1864: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xee290005  ! 1864: STB_R	stb	%r23, [%r4 + %r5]
	.word 0xd6292fa5  ! 1864: STB_I	stb	%r11, [%r4 + 0x0fa5]
	.word 0xee710005  ! 1864: STX_R	stx	%r23, [%r4 + %r5]
	.word 0xfe212344  ! 1864: STW_I	stw	%r31, [%r4 + 0x0344]
	.word 0xea292ef8  ! 1864: STB_I	stb	%r21, [%r4 + 0x0ef8]
	.word 0xfc292bde  ! 1864: STB_I	stb	%r30, [%r4 + 0x0bde]
	.word 0x26c10001  ! 1864: BRLZ	brlz,a,nt	%4,<label_0x10001>
	.word 0xfea121ec  ! 1864: STWA_I	stwa	%r31, [%r4 + 0x01ec] %asi
	.word 0xe8290005  ! 1873: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xe0212a84  ! 1873: STW_I	stw	%r16, [%r4 + 0x0a84]
	.word 0xde712998  ! 1873: STX_I	stx	%r15, [%r4 + 0x0998]
	.word 0xea212360  ! 1873: STW_I	stw	%r21, [%r4 + 0x0360]
	.word 0xe27129d8  ! 1873: STX_I	stx	%r17, [%r4 + 0x09d8]
	.word 0xdc290005  ! 1873: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf0290005  ! 1873: STB_R	stb	%r24, [%r4 + %r5]
	.word 0x0cc90003  ! 1873: BRGZ	brgz  ,pt	%4,<label_0x90003>
	.word 0xd8f0c960  ! 1873: STXA_R	stxa	%r12, [%r3 + %r0] 0x4b
	.word 0xda290005  ! 1882: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe0712ea0  ! 1882: STX_I	stx	%r16, [%r4 + 0x0ea0]
	.word 0xe2310005  ! 1882: STH_R	sth	%r17, [%r4 + %r5]
	.word 0xe6312f16  ! 1882: STH_I	sth	%r19, [%r4 + 0x0f16]
	.word 0xdc3120ea  ! 1882: STH_I	sth	%r14, [%r4 + 0x00ea]
	.word 0xdc290005  ! 1882: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf4210005  ! 1882: STW_R	stw	%r26, [%r4 + %r5]
	.word 0x22800003  ! 1882: BE	be,a	<label_0x3>
	.word 0xe8b11005  ! 1882: STHA_R	stha	%r20, [%r4 + %r5] 0x80
	.word 0xf6290005  ! 1891: STB_R	stb	%r27, [%r4 + %r5]
	.word 0xfe292ab3  ! 1891: STB_I	stb	%r31, [%r4 + 0x0ab3]
	.word 0xdc2124cc  ! 1891: STW_I	stw	%r14, [%r4 + 0x04cc]
	.word 0xf0292217  ! 1891: STB_I	stb	%r24, [%r4 + 0x0217]
	.word 0xe2212b74  ! 1891: STW_I	stw	%r17, [%r4 + 0x0b74]
	.word 0xe8210005  ! 1891: STW_R	stw	%r20, [%r4 + %r5]
	.word 0xfe312ee4  ! 1891: STH_I	sth	%r31, [%r4 + 0x0ee4]
	.word 0x04c10001  ! 1891: BRLEZ	brlez  ,nt	%4,<label_0x10001>
	.word 0xd6f0c982  ! 1891: STXA_R	stxa	%r11, [%r3 + %r2] 0x4c
	.word 0xd8290005  ! 1900: STB_R	stb	%r12, [%r4 + %r5]
	.word 0xe8712768  ! 1900: STX_I	stx	%r20, [%r4 + 0x0768]
	.word 0xfe712060  ! 1900: STX_I	stx	%r31, [%r4 + 0x0060]
	.word 0xde210005  ! 1900: STW_R	stw	%r15, [%r4 + %r5]
	.word 0xfc290005  ! 1900: STB_R	stb	%r30, [%r4 + %r5]
	.word 0xe0290005  ! 1900: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xde712990  ! 1900: STX_I	stx	%r15, [%r4 + 0x0990]
	.word 0x06800001  ! 1900: BL	bl  	<label_0x1>
	.word 0xd6f04967  ! 1900: STXA_R	stxa	%r11, [%r1 + %r7] 0x4b
	.word 0xdc290005  ! 1910: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xfe712800  ! 1910: STX_I	stx	%r31, [%r4 + 0x0800]
	.word 0xf8310005  ! 1910: STH_R	sth	%r28, [%r4 + %r5]
	.word 0xdc712c00  ! 1910: STX_I	stx	%r14, [%r4 + 0x0c00]
	.word 0xf2210005  ! 1910: STW_R	stw	%r25, [%r4 + %r5]
	.word 0xf2312694  ! 1910: STH_I	sth	%r25, [%r4 + 0x0694]
	.word 0xfe210005  ! 1910: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xfc212808  ! 1910: STW_I	stw	%r30, [%r4 + 0x0808]
	.word 0x1a800003  ! 1910: BCC	bcc  	<label_0x3>
	.word 0xf6a11005  ! 1910: STWA_R	stwa	%r27, [%r4 + %r5] 0x80
	.word 0xde290005  ! 1920: STB_R	stb	%r15, [%r4 + %r5]
	.word 0xfc312b0c  ! 1920: STH_I	sth	%r30, [%r4 + 0x0b0c]
	.word 0xf8712448  ! 1920: STX_I	stx	%r28, [%r4 + 0x0448]
	.word 0xe2290005  ! 1920: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe4312fb2  ! 1920: STH_I	sth	%r18, [%r4 + 0x0fb2]
	.word 0xf22122a4  ! 1920: STW_I	stw	%r25, [%r4 + 0x02a4]
	.word 0xe62927d1  ! 1920: STB_I	stb	%r19, [%r4 + 0x07d1]
	.word 0xe2212474  ! 1920: STW_I	stw	%r17, [%r4 + 0x0474]
	.word 0x1e800003  ! 1920: BVC	bvc  	<label_0x3>
	.word 0xd4310005  ! 1920: STH_R	sth	%r10, [%r4 + %r5]
	.word 0xf8290005  ! 1929: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xe0290005  ! 1929: STB_R	stb	%r16, [%r4 + %r5]
	.word 0xe229294c  ! 1929: STB_I	stb	%r17, [%r4 + 0x094c]
	.word 0xf8210005  ! 1929: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xf4290005  ! 1929: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xfc710005  ! 1929: STX_R	stx	%r30, [%r4 + %r5]
	.word 0xee292d2e  ! 1929: STB_I	stb	%r23, [%r4 + 0x0d2e]
	.word 0x26800001  ! 1929: BL	bl,a	<label_0x1>
	.word 0xeef91005  ! 1929: SWAPA_R	swapa	%r23, [%r4 + %r5] 0x80
	.word 0xfa290005  ! 1938: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xe4212944  ! 1938: STW_I	stw	%r18, [%r4 + 0x0944]
	.word 0xf8290005  ! 1938: STB_R	stb	%r28, [%r4 + %r5]
	.word 0xd6710005  ! 1938: STX_R	stx	%r11, [%r4 + %r5]
	.word 0xfa290005  ! 1938: STB_R	stb	%r29, [%r4 + %r5]
	.word 0xf83126a0  ! 1938: STH_I	sth	%r28, [%r4 + 0x06a0]
	.word 0xea310005  ! 1938: STH_R	sth	%r21, [%r4 + %r5]
	.word 0x34800001  ! 1938: BG	bg,a	<label_0x1>
	.word 0xd6f0c963  ! 1938: STXA_R	stxa	%r11, [%r3 + %r3] 0x4b
	.word 0xda290005  ! 1948: STB_R	stb	%r13, [%r4 + %r5]
	.word 0xe4710005  ! 1948: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xf6710005  ! 1948: STX_R	stx	%r27, [%r4 + %r5]
	.word 0xd6212414  ! 1948: STW_I	stw	%r11, [%r4 + 0x0414]
	.word 0xea290005  ! 1948: STB_R	stb	%r21, [%r4 + %r5]
	.word 0xf8210005  ! 1948: STW_R	stw	%r28, [%r4 + %r5]
	.word 0xdc290005  ! 1948: STB_R	stb	%r14, [%r4 + %r5]
	.word 0xf8710005  ! 1948: STX_R	stx	%r28, [%r4 + %r5]
	.word 0x28800003  ! 1948: BLEU	bleu,a	<label_0x3>
	.word 0xd6f04ce0  ! 1948: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xe8290005  ! 1957: STB_R	stb	%r20, [%r4 + %r5]
	.word 0xfe210005  ! 1957: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xfe710005  ! 1957: STX_R	stx	%r31, [%r4 + %r5]
	.word 0xe4292ecf  ! 1957: STB_I	stb	%r18, [%r4 + 0x0ecf]
	.word 0xe2212fd0  ! 1957: STW_I	stw	%r17, [%r4 + 0x0fd0]
	.word 0xf0312684  ! 1957: STH_I	sth	%r24, [%r4 + 0x0684]
	.word 0xfe2929d2  ! 1957: STB_I	stb	%r31, [%r4 + 0x09d2]
	.word 0x1a800001  ! 1957: BCC	bcc  	<label_0x1>
	.word 0xf2e91005  ! 1957: LDSTUBA_R	ldstuba	%r25, [%r4 + %r5] 0x80
	.word 0xf4290005  ! 1966: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xf02128c4  ! 1966: STW_I	stw	%r24, [%r4 + 0x08c4]
	.word 0xfa31211a  ! 1966: STH_I	sth	%r29, [%r4 + 0x011a]
	.word 0xf4210005  ! 1966: STW_R	stw	%r26, [%r4 + %r5]
	.word 0xda2126ec  ! 1966: STW_I	stw	%r13, [%r4 + 0x06ec]
	.word 0xe4310005  ! 1966: STH_R	sth	%r18, [%r4 + %r5]
	.word 0xea712478  ! 1966: STX_I	stx	%r21, [%r4 + 0x0478]
	.word 0x18800003  ! 1966: BGU	bgu  	<label_0x3>
	.word 0xde212f6c  ! 1966: STW_I	stw	%r15, [%r4 + 0x0f6c]
	.word 0xe2290005  ! 1975: STB_R	stb	%r17, [%r4 + %r5]
	.word 0xe2710005  ! 1975: STX_R	stx	%r17, [%r4 + %r5]
	.word 0xdc310005  ! 1975: STH_R	sth	%r14, [%r4 + %r5]
	.word 0xe2712bd0  ! 1975: STX_I	stx	%r17, [%r4 + 0x0bd0]
	.word 0xfc310005  ! 1975: STH_R	sth	%r30, [%r4 + %r5]
	.word 0xde3127d8  ! 1975: STH_I	sth	%r15, [%r4 + 0x07d8]
	.word 0xf0710005  ! 1975: STX_R	stx	%r24, [%r4 + %r5]
	.word 0x36800003  ! 1975: BGE	bge,a	<label_0x3>
	.word 0xd6f08980  ! 1975: STXA_R	stxa	%r11, [%r2 + %r0] 0x4c
	.word 0xf4290005  ! 1985: STB_R	stb	%r26, [%r4 + %r5]
	.word 0xe02926af  ! 1985: STB_I	stb	%r16, [%r4 + 0x06af]
	.word 0xda210005  ! 1985: STW_R	stw	%r13, [%r4 + %r5]
	.word 0xf0312b82  ! 1985: STH_I	sth	%r24, [%r4 + 0x0b82]
	.word 0xfe290005  ! 1985: STB_R	stb	%r31, [%r4 + %r5]
	.word 0xfe210005  ! 1985: STW_R	stw	%r31, [%r4 + %r5]
	.word 0xfe31223e  ! 1985: STH_I	sth	%r31, [%r4 + 0x023e]
	.word 0xf22928ed  ! 1985: STB_I	stb	%r25, [%r4 + 0x08ed]
	.word 0x24c90003  ! 1985: BRLEZ	brlez,a,pt	%4,<label_0x90003>
	.word 0xd6f04ce0  ! 1985: STXA_R	stxa	%r11, [%r1 + %r0] 0x67
	.word 0xd6290005  ! 1995: STB_R	stb	%r11, [%r4 + %r5]
	.word 0xf821207c  ! 1995: STW_I	stw	%r28, [%r4 + 0x007c]
	.word 0xe4710005  ! 1995: STX_R	stx	%r18, [%r4 + %r5]
	.word 0xd42929e4  ! 1995: STB_I	stb	%r10, [%r4 + 0x09e4]
	.word 0xf8212fbc  ! 1995: STW_I	stw	%r28, [%r4 + 0x0fbc]
	.word 0xf07126f8  ! 1995: STX_I	stx	%r24, [%r4 + 0x06f8]
	.word 0xd4210005  ! 1995: STW_R	stw	%r10, [%r4 + %r5]
	.word 0xd62928ce  ! 1995: STB_I	stb	%r11, [%r4 + 0x08ce]
	.word 0x36800001  ! 1995: BGE	bge,a	<label_0x1>
	.word 0xd6f08ce0  ! 1995: STXA_R	stxa	%r11, [%r2 + %r0] 0x67
        ta      T_GOOD_TRAP
	nop
	nop

.data
	.word  0x43488bf0,0xe79a3aba,0x159d62b4,0x7d57a21c
	.word  0x093044d2,0x17fba5d3,0x1ecb6340,0x905fb1d4
	.word  0xcdc94a62,0xd3d95b88,0x827d54ca,0x5d81705e
	.word  0x8dd12077,0x7da37ea2,0xd5a21d5e,0x1ef960ff
	.word  0x210af2c8,0xa9f4df4c,0x504bddc0,0xb3121db2
	.word  0xfc83d2a1,0x27d002c5,0x21054431,0x74ca1a1c
	.word  0x7c7b82d7,0xe3d08e03,0xf31693b0,0x94face27
	.word  0xc594f63f,0xc9af7c5b,0x51ba1459,0x6a00e961
	.word  0xe59d0530,0x924de921,0xf30162d9,0xe819450c
	.word  0x3ccd5393,0xae3caac6,0xdb303a64,0xa753d1d7
	.word  0x8749279e,0x074b08ee,0x99ecb3ee,0xd0ac5ca6
	.word  0x07c3c446,0x851cc9bd,0xff0c343b,0x1b782540
	.word  0xd140c770,0xf0c7847a,0x3f2f3aa3,0x92ca71b1
	.word  0x86fe970f,0xe182b55e,0x96f7d472,0x2798633d
	.word  0xfb343cdc,0xaa5ccffd,0x84838143,0xda0ea5ad
	.word  0x051438e7,0x223d8251,0x951acabf,0xa8176540
	.word  0xbd4c4e67,0x25425b9c,0x19fce377,0x1338dc0a
	.word  0x79b6e810,0x916893a2,0x3cbecf40,0x70afe025
	.word  0x24485ce2,0x24193443,0x8e352c44,0x0bb70071
	.word  0x54212299,0xb9d290fe,0xd51383a7,0xc805ed46
	.word  0x38d08e2a,0x51212dd1,0x5aa3e9f5,0x70308ce6
	.word  0x9ab9585c,0x98417f57,0x16262b74,0x5df7f010
	.word  0x3d08cbaf,0x33422d8e,0x3005d118,0x0dbf136c
	.word  0xb52e63d0,0xfa273b90,0x6a1dd560,0x1f50f704
	.word  0xdf5db3cd,0x7ec2f706,0xce692860,0xbd1bd15c
	.word  0xf04a0c93,0x61b9fa52,0x1b6363ea,0xe07b8c6a
	.word  0x74d0ed85,0x5841ac3c,0x0e999f39,0x406ea6b3
	.word  0xdd4c5777,0x2f1497a1,0xe301d047,0xe247d880
	.word  0xb29d8fee,0x4ea9ef4b,0xeed2b0a3,0x2f51394f
	.word  0x71c86935,0xad1731b6,0x0fdc0a2d,0x2e801876
	.word  0x3173ef32,0x2fb7f82f,0x4bf36b86,0x4da6bb19
	.word  0xb7f8bb8b,0xe3f332b9,0xd1a3cc12,0xeceb4e35
	.word  0x9f6d5ffa,0xb25bafe2,0x4ebc16f2,0xa41155dc
	.word  0x144d1677,0xaecf21f6,0x09819c06,0x50c1bb00
	.word  0x7c475b9a,0xe799a66e,0xd6c19f48,0x1c42d61e
	.word  0x6f227884,0xe121e36f,0x6b4a14f6,0x3a1fabc2
	.word  0x766c441d,0x61c21479,0x2219afff,0x4b176bac
	.word  0x082408fa,0x96e1f105,0x8731adc2,0xb9335fe5
	.word  0x193284fc,0x73b288d4,0xf840ac2e,0x36d16a70
	.word  0x3c2fb83d,0x35d81394,0x49c67f02,0xfada0517
	.word  0x31482af2,0xf6862b2e,0x017edddb,0x5167cd60
	.word  0x6aae5cd8,0x8e7c8b3c,0xa03d6312,0x22668e56
	.word  0x09dcb804,0xd6350702,0x4bab8d15,0x2cf22847
	.word  0x25f9b3da,0x31c1e344,0x3798a6e9,0x51661b27
	.word  0x30f7e83f,0x8b16730f,0xf2a2f1b1,0x6f171b6a
	.word  0x035e2b81,0x9c964b51,0x82099709,0xeb72c397
	.word  0x07cd17f8,0x8cb1eca6,0x1f7776a3,0x39b158f1
	.word  0xfefb149d,0xe3e14aee,0xa090df01,0x9c005816
	.word  0xf0d1eabf,0x124adec2,0xbd4a3464,0x50454196
	.word  0xb4ed4e53,0xfe7a7e37,0x93be5f2f,0x66a41886
	.word  0x7c3d352b,0xbdeeab68,0xa478b8f3,0x17c85659
	.word  0x8620c77d,0x3eff9639,0x5846d1e7,0x3550e562
	.word  0xf058b008,0xf2cd1142,0x301b8e30,0xbac9c8ea
	.word  0x5cde713a,0xbd283d8a,0x6567fd6b,0xec50c2a8
	.word  0xe2ac7eac,0x10d2eca0,0x4872161b,0xeea57710
	.word  0x0d3dae75,0x09d99636,0x9f744940,0xf271315e
	.word  0x3ebf84fc,0x0b2b0894,0xeeaaace1,0xe01a61d8
	.word  0xbd0fac4f,0x728fb230,0x48e06bea,0x38e6025c
	.word  0x06835008,0xb5397867,0xc5d9cf57,0x6cd4b796
	.word  0x1fbd4d4c,0x49caed84,0x892100c4,0xcca0c334
	.word  0x053813d3,0xf5b311ad,0x290b9148,0xc24b4b91
	.word  0x71cbd1f9,0xa02e223f,0x913f90eb,0x56ab5a2b
	.word  0xac7e94b9,0xf0e7fe2a,0xe610bb28,0x8ea0d61f
	.word  0xf11b8b93,0x21e94167,0xdb12e774,0x19da7a86
	.word  0x642cd792,0xe1d06961,0xf5af29de,0xe75dd825
	.word  0x77eb05d9,0x3002807c,0x730d764b,0xee5b19c1
	.word  0xfda281d2,0xa2914277,0x596bc6e0,0x7d4761d6
	.word  0x8301c333,0x1cd419dc,0x615a0155,0xf971864c
	.word  0x35b3b1a2,0x34e0b7ba,0x6116d4cb,0x1fb459ba
	.word  0x0dd2733a,0x203be292,0x4e7936ce,0xcc6cf0f2
	.word  0x67de7de1,0x259b2c38,0x9f5adefd,0xc7c12125
	.word  0xd315e118,0x720da5b0,0x69ad572a,0xcfd665b6
	.word  0x92a1d63c,0x660ad148,0x1f08ebfe,0xfbd7d624
	.word  0x04039aa3,0x6a4ea70b,0xaaa40d88,0x6a6b564b
	.word  0x98c84aee,0x05370da0,0xfcbaf38f,0x5154a38a
	.word  0x413909dd,0x4cabc98e,0x80d689aa,0x39589d11
	.word  0xb46e4ef3,0xc6c0948a,0x8518a82c,0xe2555be9
	.word  0xa19820e2,0xcfe849e4,0xfdb9906e,0xc1425997
	.word  0xdfe51368,0xe03e626a,0x1d416c26,0xe8f6d925
	.word  0x56cd8db4,0x6cb53915,0x05f5b79d,0xf86025fd
	.word  0xf4bf936a,0xb317bae0,0x3ea1bdcd,0xd6363dda
	.word  0xc4a33d42,0xd6d8cfb4,0xd957855c,0x92e19f82
	.word  0xc125fe64,0xdec042ad,0x3b5eaa17,0xf45c258b
	.word  0xdb31abec,0xfbfe3c28,0x06f3e86f,0xffede56e
	.word  0xe6bc3f27,0x5e9c6aac,0x6f43f83f,0x13031105
	.word  0xaa1ce41e,0x4cd0723f,0x6e19db2d,0xcfe71939
	.word  0xe8901b8b,0x8844bf33,0x7b8170f1,0xd5d74416
	.word  0x2f8973a5,0x473d8adf,0xc6287330,0x8b4d3ace
	.word  0xafd64199,0xb2f2ec65,0x6c7ce64d,0xb3ddad64
	.word  0x67835a7d,0xd04c8248,0x3746fac2,0x8b11a4c6
	.word  0x2f18067e,0xc3e51d38,0x7f174a99,0xbb1fc758
	.word  0xe1dc2293,0x62369fd7,0x95732bfc,0x3144b2d3
	.word  0x9db1694f,0x37aeb11a,0x0697e182,0xdc107ec8
	.word  0xdbcfe7de,0xa7bcb21f,0x34e5cc70,0x2985c0dc
	.word  0xb93b1bbf,0xb2ff6867,0xe47fe659,0xe4fd36d5
	.word  0xf7cf0e39,0xb8e489ee,0x13f86f6f,0xf53eaa43
	.word  0x3d83af80,0xe9036ebd,0x4f2c31b5,0xae0dd70a
	.word  0x4d358e2a,0xf2e9648c,0x7d91e791,0x8f76362e
	.word  0x218c4bb9,0x5c0f293b,0x83646d0b,0x7449a94d
	.word  0x7917ddbe,0x26ba1933,0x130d5abf,0x1b5c5f09
	.word  0x026b2c51,0x06be5ec7,0xd0a6978f,0xf9d542b0
	.word  0x752eb545,0xe90ea4ac,0xcebf1369,0xf1311925
	.word  0xca94de26,0xf8c69c87,0xb1013938,0x20efe7d9
	.word  0x73be3f7c,0x819f4bcd,0x8a4e43bb,0x813531e0
	.word  0x8546eb9d,0x4aacf979,0x7df65dec,0x71c1b456
	.word  0x95b61710,0x9979d260,0x3c9256fa,0xf960bc8a
	.word  0x7b78717b,0x4587f8d9,0xfe218c46,0x72bf6301
	.word  0x0df16cd9,0x6f73ac58,0xb271ebbe,0x88c311a0
	.word  0x7b229be5,0x39db7994,0x69cc4aa6,0x3a2aa5dc
	.word  0xe9c4ccf0,0x0ad240da,0xc8ff1ee1,0x30601069
	.word  0xec9a8fcd,0x43b2b403,0xd04115ef,0xbb3cf5fb
	.word  0x46fadfa0,0xdd6d7d22,0x94f0db3a,0xe66eb135
	.word  0xd31aa301,0x17c3c740,0x2c2d9046,0xfccc8e77
	.word  0x99a7325d,0x7ad96e61,0x4fbcd119,0x0130d65d
	.word  0xe06ccd12,0x44d58587,0x83da59ff,0xea32231c
	.word  0x82b575fb,0xdbcfbc37,0x34ab5397,0x26f59b1b
	.word  0xac5c86e5,0x9c43d637,0x8bd2c4b1,0x1e0da8d2
	.word  0x1dc97b7e,0x0df0f05d,0xfcb4ea7c,0xbd110de5
	.word  0x570c2324,0x4c9c8638,0xad0dc3e8,0x6663368d
	.word  0x7cbb86cc,0x66581ea5,0x9b6f4d0c,0xdce519f6
	.word  0x9c177ae5,0x1da5c533,0x69a24059,0xb9b7cb18
	.word  0x28dfb98f,0x4c6e336b,0x53771b97,0x0e7ae6f0
	.word  0x21f915e8,0xd078ee16,0xa5d68324,0x68ea854a
	.word  0xc74998bc,0xb63d0d4e,0x02b2dc74,0x940382ef
	.word  0xa7bbcae9,0xb25a5bd3,0xe370e7b8,0xa3e504ed
	.word  0x3f655b26,0xe29c732c,0x8252258b,0x73028ec8
	.word  0x1934c84a,0xd6f39b50,0x9e0a6324,0x2688f1ef
	.word  0xdd880ade,0xdd14dc60,0x1057c2b0,0xcb5c6060
	.word  0x176054ad,0x8d4c4a99,0x41804507,0x4ef36de6
	.word  0xbdee65fa,0x8cf96b38,0x1516b56b,0x72940063
	.word  0xa20e1f55,0x6ffaac1c,0xc238f496,0x018b9db8
	.word  0x86d23d7b,0x931ae12b,0x1f522b8d,0xaa732de9
	.word  0x3b2c6a36,0xad6e7526,0x3fab2a95,0xc9ca9c17
	.word  0x8f729a1c,0xf8f328af,0x8c80faa0,0x352fdcf7
	.word  0xb0b77690,0x1b0f381d,0x6ecf5039,0xa28d4169
	.word  0x081241ce,0x83430bac,0x41bd1119,0xff0b9616
	.word  0x27919f11,0x64d38eb8,0x4ad9ed20,0xcc380082
	.word  0x6489698f,0x31fc4c55,0x6cdeaabe,0x8f36c6ab
	.word  0xde187cdf,0xa7e1d34b,0x50c887ce,0xb07d1641
	.word  0x3461e6df,0xa1eb87b5,0x31032cd2,0x5f7b20d3
	.word  0x9ebaba3d,0x57e9c252,0x7cf858ac,0x23f4609d
	.word  0x56f2d050,0xd172e53e,0xcf5373f9,0x7780e845
	.word  0xd8b5117e,0x25330fd9,0xf24164c7,0x4e77c8c4
	.word  0x470e348b,0x78ec1fe8,0xcb857875,0x17d4083e
	.word  0x08c897c4,0x88373295,0xe45dcec0,0x4735b446
	.word  0x7e5e5ec5,0x9f5e09b7,0xfbb9091a,0x578ae629
	.word  0x602bd31a,0x3f02c450,0x2f4d12c2,0x4599db01
	.word  0x56fbebaf,0x4fbaf798,0x04436eae,0x4e471a8d
	.word  0x148755e1,0xb25ed04a,0x03a34cb3,0x545b32e2
	.word  0x087df103,0xbbd140ff,0x115c03b5,0x6bb904c7
	.word  0x6607e1f6,0xd345e6c7,0xa0a4d8a1,0x46866271
	.word  0x8335cf27,0x1fb88418,0x9141a0b5,0x1fd39b4f
	.word  0xfab3db3c,0x76c1aadc,0xc0f45385,0x28ffb378
	.word  0x2a6ef853,0x20176028,0x4f2acba1,0x93812742
	.word  0xc4078591,0xee51b5af,0xec57fc40,0xce988d23
	.word  0x45ead0af,0x192c9ee9,0xe86e7ef3,0xb6ecbdf0
	.word  0x879d5b1e,0x97ef8c57,0xc3887f87,0x2b809a22
	.word  0xadd61b27,0x38c7e8bf,0x7701662d,0x7e04d8f8
	.word  0xd6dcbe00,0xdd121f37,0x212080d4,0x83878078
	.word  0x193caade,0xea7359ef,0xa1bbfe31,0x2273ce70
	.word  0xfcc5c085,0x67f10b8d,0xe3b82ad8,0x309edd1d
	.word  0x239cadf1,0xfa1be17a,0x753cb02d,0x5efa66af
	.word  0x5552bebd,0x1f8db810,0x8382881f,0x30076385
	.word  0x99d950e7,0xb3113c66,0xb6b3eaab,0x75f4336a
	.word  0x58070ef6,0x1c1a8a8d,0xf81b9273,0xc663333e
	.word  0x1471cfde,0xa9d9e71c,0x90af6aa7,0x0b8a5c87
	.word  0x35c2a804,0x1992842a,0x867b6009,0x428a9896
	.word  0xf2f137ae,0xcfa0b156,0x993a8788,0x545c1466
	.word  0x4fcd5bd5,0xa10e1013,0x242609d0,0x54dc3789
	.word  0x62cba342,0x15e46544,0x37b15a67,0xdbdbd0a0
	.word  0x5f41e74a,0x6ccd79be,0x55ddd853,0x137bc0dd
	.word  0xe3cfac44,0x4cba8679,0xd48674d5,0x31cc200b
	.word  0x61fdd2f9,0x1838c29e,0xe485a80c,0xb953193b
	.word  0xfc7e6db9,0xd1cf5d60,0x404a4c1f,0xfc34b805
	.word  0xbd1182b2,0x0a974cc3,0xbd30d697,0xabc1b5e5
	.word  0xc6a53d64,0x7dcae7c6,0x4ad89363,0x4ab47d27
	.word  0x53a795a4,0x3311ea9b,0x31f4182e,0xad0bd583
	.word  0xd40b5e3f,0xcdc16826,0x890a8099,0x82428a2a
	.word  0xf808a709,0xe04037a1,0x15a471ad,0xd2153732
	.word  0x2d8146c6,0x86a51cdb,0x16eee98b,0x0d2a9142
	.word  0xe9af0835,0x40e32557,0x13b3ee31,0xba77c88a
	.word  0x4fe19d34,0xb925d92d,0x3da860da,0x3098a13b
	.word  0xc4bdd33c,0xf3ddc02d,0xc97646a2,0xcf79345c
	.word  0x0ece8133,0x6c677b5b,0xa52197be,0x44a6537b
	.word  0x052f7701,0x6d0e107a,0x339f4990,0x1402ca18
	.word  0xa92ccb4f,0x9ebc1ec0,0x0e72eb9f,0x282b4dbc
	.word  0xd277d5e1,0x292dad7f,0x444f7d7b,0xa41d51e7
	.word  0x9b36d6c5,0x302b1e32,0xdb04e1c4,0xb7eba57d
	.word  0x8b620be9,0x86f31d57,0xe0a75992,0xc0962c5e
	.word  0x30ec9db0,0x6d1da2a3,0x112d1737,0x8522b3ab
	.word  0x4d1bd424,0x0a36f95d,0x7e25a73a,0xa6f462b8
	.word  0x903e2e9a,0xdf6c886e,0x50031d3d,0x7afb4277
	.word  0x0cfc5337,0x28ea8d9e,0x67bf57d7,0xa91e2535
	.word  0x531816de,0x2e3c9383,0x0d099c73,0x0f1083b7
	.word  0x3c27898e,0xee7feabe,0xe32f4532,0x83e2e10f
	.word  0x26805541,0x4bbac2d9,0x1d905b57,0x965ff803
	.word  0xef165eb6,0xa8c20ed4,0x09ad7ba7,0x0471288d
	.word  0x36d16cba,0xe23ab0aa,0x5ac5fe56,0x4a0b8f22
	.word  0xe4f0b54b,0x34aa6b2d,0xd1dedad8,0x49cf5708
	.word  0x9fc601de,0x340268fe,0xd9ad3d5e,0xd9007618
	.word  0xd3b82173,0x7859fbc0,0xb22b2b6c,0x04c28270
	.word  0x248aa067,0xf3f79814,0x8a9e333e,0x8bd26c61
	.word  0x9da85593,0xcfcb1b27,0xaba39b9b,0x44653969
	.word  0x62cf62db,0x72436055,0xb2f8cec7,0x8f0ba66f
	.word  0x08ca9394,0xe548defe,0x8204c87a,0xca923f75
	.word  0x86e5b6f1,0x4cff8378,0x73bc3a73,0x0a21ff4c
	.word  0x5fa6c43a,0xe0978e1e,0x3aee0b33,0x35e76a75
	.word  0x06225d49,0xb8707b17,0x56ccd58e,0x73334e51
	.word  0xaeb69560,0x4269dea3,0x68310c4c,0x63168f84
	.word  0x381744cd,0xc4630d1d,0xe75f675a,0x110a6d70
	.word  0xf76a19a9,0x3014d7a2,0x59ade68a,0x43938598
	.word  0xd7021c6c,0x753a7bc9,0x125aeba5,0x3ee7280d
	.word  0x24c37cf4,0xa27279ba,0x279d4627,0x9fe9fa1c
	.word  0x531c5a16,0x098ac288,0xe2d44c93,0x339f939c
	.word  0x1a1a985c,0xa4305600,0xbb26fd92,0x14ba1a99
	.word  0x6a74fc4b,0x60ceadae,0x02251458,0x1444016c
	.word  0xf9e71943,0x863551d9,0x4b02d026,0x68e00c5d
	.word  0xc1c1e0c6,0x9bb4dd53,0xf79028ff,0x9a5366c1
	.word  0xbe3cf2c0,0xb365802c,0xf23ad7f3,0xefa7794c
	.word  0x26b08e81,0x1f9baa11,0xb93e6696,0xc33851e3
	.word  0xea287ee3,0x5c337b26,0x8dfa14dd,0x2b396355
	.word  0xed4c7b89,0x02f30f81,0x9a221a9a,0x7bcce6f6
	.word  0xc54bdc00,0x4c7e774e,0xbbb9325f,0x6ba0d49e
	.word  0x94c61c35,0x755048b1,0x48595262,0xd4df1d4b
	.word  0x9cde53c9,0xdcaa17d6,0xf92b994c,0x3b640b0a
	.word  0x48222bbb,0x19a41860,0x1bed2543,0x63d9eedc
	.word  0x6f365629,0xf8d7615d,0x14bf4369,0xaf3999b4
	.word  0x3748fc0b,0xf7ad7fdd,0x587f6c64,0x40c74397
	.word  0xe22bf423,0x89d29321,0xfa85ae06,0x20993817
	.word  0xe2c2adda,0x33beb8a8,0x26010f06,0x9e68b53e
	.word  0xd6554bc3,0x58331176,0x8cc8acfe,0xc8adadde
	.word  0x42ffe866,0x060c2eb3,0x01d363be,0xd9a5dbc9
	.word  0xebdc6b45,0x14f9c41f,0x0e33384c,0x9c22183e
	.word  0x5f9efac2,0x7df2db09,0x1a3ab965,0x912e99ac
	.word  0xb90fa1f4,0x5f6d482a,0x1e700ca0,0x2162cb0f
	.word  0x7f3febd5,0x08ad0f92,0x357132ee,0x6848323d
	.word  0xcccba0ba,0x880a662a,0x6bab4f59,0xc4812b4f
	.word  0xacf3abd0,0x4ab3e5ea,0x8c689e54,0x6b2f058f
	.word  0xf35f8df4,0x2a52557c,0x196b4183,0xca8b77cd
	.word  0xd822dd9d,0x8986cc84,0x5c92824b,0xdf4a49e0
	.word  0x5b935b74,0x7bbe455a,0xb720982e,0x6c56160f
	.word  0xad658aa1,0x503b09d6,0x760adb86,0x07c8e5e6
	.word  0x4b125003,0x4ae3aa4a,0x26089557,0xe7ac6fb1
	.word  0xf84dc2f7,0xbbf6a81b,0x35462a11,0x7d0f886c
	.word  0x76f638f1,0xa527d60f,0x6ab2b261,0xe4309993
	.word  0x68ec6ad6,0x999c7327,0x51319593,0x4791224e
	.word  0xae669420,0x668cc112,0xb2181503,0x5e688721
	.word  0x1f21b5cc,0x2cb54202,0x535b7607,0xc0f0c42f
	.word  0x25cf7a1f,0xc18ea6ab,0x943590a6,0xea9f07a9
	.word  0x43544f22,0xa6a4fa86,0x5337b2e0,0x28efdff1
	.word  0x6073fd36,0xd0e19cf2,0xab68bd64,0xba00a9de
	.word  0x3607829a,0x7e08932f,0xadfd04cd,0xef5cd148
	.word  0x565aef0a,0xa88c0da8,0xc274b756,0x9d7d6a76
	.word  0xd87afe58,0x565191da,0x7a04af7e,0xa5b4ec63
	.word  0x5c12ff26,0xc5285dc3,0x2f9ebb04,0x5c696f42
	.word  0x66d3ab70,0xc7c7f758,0x8bd5cfc0,0x92c4b2ad


