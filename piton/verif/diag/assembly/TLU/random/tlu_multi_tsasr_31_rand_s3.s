// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_tsasr_31_rand_s3.s
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
   random seed:	695007324
   Jal tlu_multi_tsasr_31.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"
#include "my_intr_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	nop

	wr	%g0, 4, %fprs
! Register init code

	setx 0xb03dcece0000ac72, %g1, %g0
	setx 0xa89d730a00001c16, %g1, %g1
	setx 0xdade45480000bda3, %g1, %g2
	setx 0x51e6f2b5000048cb, %g1, %g3
	setx 0x22f29d700000fc6f, %g1, %g4
	setx 0xeaaff0ac00007e3d, %g1, %g5
	setx 0xffe7b21600007886, %g1, %g6
	setx 0x138755be00002c59, %g1, %g7
	setx 0xf0c199090000fe05, %g1, %r16
	setx 0x97c401fe0000bc05, %g1, %r17
	setx 0xd40297bd00003db0, %g1, %r18
	setx 0xc4632bd100005ca5, %g1, %r19
	setx 0x0c3f895b00005af6, %g1, %r20
	setx 0x562c3290000019ad, %g1, %r21
	setx 0xe727943800008f0d, %g1, %r22
	setx 0xaf8b217000000eb3, %g1, %r23
	setx 0x53d9995f00007a17, %g1, %r24
	setx 0x2f40fb690000def9, %g1, %r25
	setx 0x173bd5af0000f901, %g1, %r26
	setx 0xa2a977410000f8dd, %g1, %r27
	setx 0x6c68aa7200000860, %g1, %r28
	setx 0xb103aefb0000282e, %g1, %r29
	setx 0x46479f2a0000d9e8, %g1, %r30
	setx 0x42d1a24700004f55, %g1, %r31
	save
	setx 0xab37e80100004a6c, %g1, %r16
	setx 0xcc0013710000fc34, %g1, %r17
	setx 0x9f629eb400006f60, %g1, %r18
	setx 0xcc9354e80000eb32, %g1, %r19
	setx 0x5097601200000895, %g1, %r20
	setx 0x3c4a97be00002d18, %g1, %r21
	setx 0x3ea9734700007f9b, %g1, %r22
	setx 0xdc61c16a00008dd7, %g1, %r23
	setx 0x7e01f2e000006d83, %g1, %r24
	setx 0x53da2b2400002d7d, %g1, %r25
	setx 0x7fae37e60000097e, %g1, %r26
	setx 0xfe601f2100009b04, %g1, %r27
	setx 0x2e1432920000d9be, %g1, %r28
	setx 0x037b7e860000cbc2, %g1, %r29
	setx 0xb51a255b0000bf45, %g1, %r30
	setx 0xe0ac9bf900001edc, %g1, %r31
	save
	setx 0x9e0257a00000599e, %g1, %r16
	setx 0xa156c12b0000bf2a, %g1, %r17
	setx 0x9016970100009fc9, %g1, %r18
	setx 0xf9d4917f00009fa3, %g1, %r19
	setx 0xc55925e80000ab0a, %g1, %r20
	setx 0xb1aa565c0000691d, %g1, %r21
	setx 0xae56a72200007c2d, %g1, %r22
	setx 0x3422262c0000281f, %g1, %r23
	setx 0xe1ab84590000d8da, %g1, %r24
	setx 0x4e002cd20000ff20, %g1, %r25
	setx 0x1397cfcd000019ba, %g1, %r26
	setx 0x8e8a492a00009ce8, %g1, %r27
	setx 0xfb24df4900004cbf, %g1, %r28
	setx 0x4dead8980000cfa8, %g1, %r29
	setx 0x71edb0d20000de40, %g1, %r30
	setx 0x3baaab8700005814, %g1, %r31
	restore
	setx	data_start, %r1, %g7
	ldd	[%g7+0], %f0
	ldd	[%g7+8], %f2
	ldd	[%g7+16], %f4
	ldd	[%g7+24], %f6
	ldd	[%g7+32], %f8
	ldd	[%g7+40], %f10
	ldd	[%g7+48], %f12
	ldd	[%g7+56], %f14
	ldd	[%g7+64], %f16
	ldd	[%g7+72], %f18
	ldd	[%g7+80], %f20
	ldd	[%g7+88], %f22
	ldd	[%g7+96], %f24
	ldd	[%g7+104], %f26
	ldd	[%g7+112], %f28
	ldd	[%g7+120], %f30
	ldd	[%g7+128], %f32
	ldd	[%g7+136], %f34
	ldd	[%g7+144], %f36
	ldd	[%g7+152], %f38
	ldd	[%g7+160], %f40
	ldd	[%g7+168], %f42
	ldd	[%g7+176], %f44
	ldd	[%g7+184], %f46
	ldd	[%g7+192], %f48
	ldd	[%g7+200], %f50
	ldd	[%g7+208], %f52
	ldd	[%g7+216], %f54
	ldd	[%g7+224], %f56
	ldd	[%g7+232], %f58
	ldd	[%g7+240], %f60
	ldd	[%g7+248], %f62
	wr	%g0, 4, %fprs
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	ta	T_CHANGE_PRIV
	wrpr	%g0, 1, %tl
	wrpr	%l0, %g0, %tpc
	wrpr	%l0, %g0, %tnpc
	wrpr	%l0, %g0, %tstate
	wrpr	%l0, %g0, %tt
	.word 0xa7504000  ! 1: RDPR_TNPC	<illegal instruction>
	.word 0x8d95a000  ! 2: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb5a4c8e0  ! 3: FSUBq	dis not found

	.word 0xbf500000  ! 4: RDPR_TPC	<illegal instruction>
	.word 0x8396e000  ! 5: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa9a748a0  ! 6: FSUBs	fsubs	%f29, %f0, %f20
	.word 0x8195e000  ! 7: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa1a6c9c0  ! 8: FDIVd	fdivd	%f58, %f0, %f16
	.word 0x87976000  ! 9: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8194a000  ! 10: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8394a000  ! 11: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa7508000  ! 12: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a50840  ! 13: FADDd	faddd	%f20, %f0, %f58
	.word 0xad508000  ! 14: RDPR_TSTATE	<illegal instruction>
	.word 0xb1500000  ! 15: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 16: RDPR_TPC	<illegal instruction>
	.word 0x8d97a000  ! 17: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xaba00520  ! 18: FSQRTs	fsqrt	
	.word 0x8195a000  ! 19: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9508000  ! 20: RDPR_TSTATE	<illegal instruction>
	.word 0xb550c000  ! 21: RDPR_TT	<illegal instruction>
	.word 0xaf500000  ! 22: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 23: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb1508000  ! 24: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 25: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 26: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x85946000  ! 27: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x8595a000  ! 28: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xbf508000  ! 29: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00540  ! 30: FSQRTd	fsqrt	
	.word 0x8396a000  ! 31: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x85942000  ! 32: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbfa688e0  ! 33: FSUBq	dis not found

	.word 0xb5508000  ! 34: RDPR_TSTATE	<illegal instruction>
	.word 0x8d946000  ! 35: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d97a000  ! 36: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xb5508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 38: RDPR_TT	<illegal instruction>
	.word 0x8794a000  ! 39: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8795e000  ! 40: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8596a000  ! 41: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x819fa000  ! 42: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d95e000  ! 43: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d956000  ! 44: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x85942000  ! 45: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x83962000  ! 46: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb3508000  ! 47: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a7c8e0  ! 48: FSUBq	dis not found

	.word 0xad50c000  ! 49: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 50: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 51: RDPR_TT	<illegal instruction>
	.word 0xa1a00560  ! 52: FSQRTq	fsqrt	
	.word 0x819fe000  ! 53: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x83972000  ! 54: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8194e000  ! 55: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb5508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x8194a000  ! 57: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbfa7c8e0  ! 58: FSUBq	dis not found

	.word 0xb9a6c9a0  ! 59: FDIVs	fdivs	%f27, %f0, %f28
	.word 0xb5500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0xbf500000  ! 61: RDPR_TPC	<illegal instruction>
	.word 0x839c2000  ! 62: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8396e000  ! 63: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x819de000  ! 64: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa5508000  ! 65: RDPR_TSTATE	<illegal instruction>
	.word 0xbd50c000  ! 66: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 67: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 68: RDPR_TT	<illegal instruction>
	.word 0x819ce000  ! 69: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x81966000  ! 70: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbd500000  ! 71: RDPR_TPC	<illegal instruction>
	.word 0x8194a000  ! 72: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa7a00540  ! 73: FSQRTd	fsqrt	
	.word 0x83976000  ! 74: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x85976000  ! 75: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819d2000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x83972000  ! 77: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x819d2000  ! 78: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x87962000  ! 79: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8d946000  ! 80: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d966000  ! 81: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8d962000  ! 82: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8195e000  ! 83: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbd50c000  ! 84: RDPR_TT	<illegal instruction>
	.word 0x81972000  ! 85: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8d976000  ! 86: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb1508000  ! 87: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 89: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 90: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbd504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xa7a448a0  ! 92: FSUBs	fsubs	%f17, %f0, %f19
	.word 0xa1504000  ! 93: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 94: RDPR_TNPC	<illegal instruction>
	.word 0x8d946000  ! 95: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xbb508000  ! 96: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a4c8a0  ! 97: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xb7504000  ! 98: RDPR_TNPC	<illegal instruction>
	.word 0xb5500000  ! 99: RDPR_TPC	<illegal instruction>
	.word 0x8d942000  ! 100: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x83976000  ! 101: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xa3508000  ! 102: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 103: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x839e6000  ! 104: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x819e6000  ! 105: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xaba7c920  ! 106: FMULs	fmuls	%f31, %f0, %f21
	.word 0x839d2000  ! 107: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8d956000  ! 108: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb9508000  ! 109: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 110: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8597e000  ! 111: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xbd50c000  ! 112: RDPR_TT	<illegal instruction>
	.word 0x8d96a000  ! 113: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xbba58860  ! 114: FADDq	dis not found

	.word 0x8d972000  ! 115: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xab500000  ! 116: RDPR_TPC	<illegal instruction>
	.word 0x819f2000  ! 117: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xab50c000  ! 118: RDPR_TT	<illegal instruction>
	.word 0xafa7c8e0  ! 119: FSUBq	dis not found

	.word 0xbf500000  ! 120: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 121: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xad508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x819de000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x81956000  ! 125: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb7500000  ! 126: RDPR_TPC	<illegal instruction>
	.word 0xb3504000  ! 127: RDPR_TNPC	<illegal instruction>
	.word 0x819f6000  ! 128: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb5504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0x819d2000  ! 130: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8794e000  ! 131: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x839f2000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819e2000  ! 133: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa9a408e0  ! 134: FSUBq	dis not found

	.word 0xafa00540  ! 135: FSQRTd	fsqrt	
	.word 0x87962000  ! 136: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8d952000  ! 137: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x87972000  ! 138: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x819e2000  ! 139: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa1504000  ! 140: RDPR_TNPC	<illegal instruction>
	.word 0x8d96a000  ! 141: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x819ee000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d96a000  ! 143: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x819fe000  ! 144: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819da000  ! 145: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8195a000  ! 146: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xaf500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0xa7a00520  ! 148: FSQRTs	fsqrt	
	.word 0x8d94e000  ! 149: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xad504000  ! 150: RDPR_TNPC	<illegal instruction>
	.word 0x8d95e000  ! 151: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819fe000  ! 152: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x87956000  ! 153: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8395a000  ! 154: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa3a00540  ! 155: FSQRTd	fsqrt	
	.word 0x819fe000  ! 156: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819fa000  ! 157: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d942000  ! 158: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xbb508000  ! 159: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 160: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x85952000  ! 161: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8d97e000  ! 162: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8396a000  ! 163: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x81966000  ! 164: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa3500000  ! 165: RDPR_TPC	<illegal instruction>
	.word 0x839e6000  ! 166: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839ea000  ! 167: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa1504000  ! 168: RDPR_TNPC	<illegal instruction>
	.word 0xa3508000  ! 169: RDPR_TSTATE	<illegal instruction>
	.word 0xbf508000  ! 170: RDPR_TSTATE	<illegal instruction>
	.word 0xa7504000  ! 171: RDPR_TNPC	<illegal instruction>
	.word 0xbda48840  ! 172: FADDd	faddd	%f18, %f0, %f30
	.word 0x819e2000  ! 173: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x839fe000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa1504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 176: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 177: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xad504000  ! 178: RDPR_TNPC	<illegal instruction>
	.word 0x8d962000  ! 179: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x87966000  ! 180: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb9500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xa750c000  ! 182: RDPR_TT	<illegal instruction>
	.word 0xbf508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0x819d2000  ! 184: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa5a449a0  ! 185: FDIVs	fdivs	%f17, %f0, %f18
	.word 0x8d966000  ! 186: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x839ee000  ! 187: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xb7a00520  ! 188: FSQRTs	fsqrt	
	.word 0x87952000  ! 189: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8397e000  ! 190: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x839d6000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xaf500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 193: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 194: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8795e000  ! 195: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x85956000  ! 196: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xbba00520  ! 197: FSQRTs	fsqrt	
	.word 0xb1508000  ! 198: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94e000  ! 199: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x81962000  ! 200: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xbfa788a0  ! 201: FSUBs	fsubs	%f30, %f0, %f31
	.word 0xa9500000  ! 202: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 203: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x839da000  ! 204: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xbf50c000  ! 205: RDPR_TT	<illegal instruction>
	.word 0x819f6000  ! 206: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa1508000  ! 207: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e000  ! 208: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8d94a000  ! 209: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa550c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xad504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0x8797e000  ! 212: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8595e000  ! 213: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xad508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 215: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x85976000  ! 216: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xa9500000  ! 217: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 218: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa9a508c0  ! 219: FSUBd	fsubd	%f20, %f0, %f20
	.word 0x839fe000  ! 220: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x839da000  ! 221: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8196e000  ! 222: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb350c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0xb5a689c0  ! 224: FDIVd	fdivd	%f26, %f0, %f26
	.word 0x839ce000  ! 225: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xaf504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xb3a5c9e0  ! 227: FDIVq	dis not found

	.word 0x819c6000  ! 228: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8194e000  ! 229: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8797a000  ! 230: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x81956000  ! 231: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xafa5c960  ! 232: FMULq	dis not found

	.word 0xb3a54940  ! 233: FMULd	fmuld	%f52, %f0, %f56
	.word 0xab50c000  ! 234: RDPR_TT	<illegal instruction>
	.word 0x819c6000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xbf500000  ! 236: RDPR_TPC	<illegal instruction>
	.word 0x8d96e000  ! 237: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x87946000  ! 238: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xa350c000  ! 239: RDPR_TT	<illegal instruction>
	.word 0x839f6000  ! 240: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x839da000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819ea000  ! 242: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbfa609c0  ! 243: FDIVd	fdivd	%f24, %f0, %f62
	.word 0xa1a709a0  ! 244: FDIVs	fdivs	%f28, %f0, %f16
	.word 0x839fe000  ! 245: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819d2000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x819fa000  ! 247: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x81966000  ! 248: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb7a58860  ! 249: FADDq	dis not found

	.word 0x83952000  ! 250: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa5500000  ! 251: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 252: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xbd50c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 254: RDPR_TT	<illegal instruction>
	.word 0x819f6000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8d95e000  ! 256: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa9a748e0  ! 257: FSUBq	dis not found

	.word 0x8194e000  ! 258: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa7a408c0  ! 259: FSUBd	fsubd	%f16, %f0, %f50
	.word 0xbba54860  ! 260: FADDq	dis not found

	.word 0x83946000  ! 261: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb1500000  ! 262: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 263: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x839ce000  ! 264: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d952000  ! 265: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8d96a000  ! 266: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8d97a000  ! 267: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x81956000  ! 268: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa1500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 270: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8194e000  ! 271: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb9508000  ! 272: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 273: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8195a000  ! 274: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x819ce000  ! 275: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa7a00540  ! 276: FSQRTd	fsqrt	
	.word 0xb9500000  ! 277: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 278: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb3508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0xaf508000  ! 280: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 281: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa9a5c9c0  ! 282: FDIVd	fdivd	%f54, %f0, %f20
	.word 0x85966000  ! 283: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa5504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0x83962000  ! 285: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xab508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xaba609a0  ! 287: FDIVs	fdivs	%f24, %f0, %f21
	.word 0x8797e000  ! 288: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb3500000  ! 289: RDPR_TPC	<illegal instruction>
	.word 0xaba588e0  ! 290: FSUBq	dis not found

	.word 0x85962000  ! 291: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x839da000  ! 292: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa350c000  ! 293: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 294: RDPR_TSTATE	<illegal instruction>
	.word 0x8d972000  ! 295: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819ce000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbf504000  ! 297: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0x8d966000  ! 299: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa3a4c8a0  ! 300: FSUBs	fsubs	%f19, %f0, %f17
	.word 0xa5500000  ! 301: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 302: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819de000  ! 303: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xb550c000  ! 304: RDPR_TT	<illegal instruction>
	.word 0x8d94e000  ! 305: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xbf504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0x8d966000  ! 307: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x839d2000  ! 308: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8397e000  ! 309: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x83972000  ! 310: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb1500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 312: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8d942000  ! 313: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x819ee000  ! 314: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xbfa40960  ! 315: FMULq	dis not found

	.word 0x839de000  ! 316: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb150c000  ! 317: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 318: RDPR_TPC	<illegal instruction>
	.word 0x85942000  ! 319: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb1500000  ! 320: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 321: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8195e000  ! 322: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x819e6000  ! 323: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8197a000  ! 324: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x819ce000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbb504000  ! 326: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a749a0  ! 328: FDIVs	fdivs	%f29, %f0, %f28
	.word 0xa9a7c8a0  ! 329: FSUBs	fsubs	%f31, %f0, %f20
	.word 0x8194a000  ! 330: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xbda74940  ! 331: FMULd	fmuld	%f60, %f0, %f30
	.word 0x8d956000  ! 332: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d95e000  ! 333: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb7508000  ! 334: RDPR_TSTATE	<illegal instruction>
	.word 0xbda7c8a0  ! 335: FSUBs	fsubs	%f31, %f0, %f30
	.word 0x839fa000  ! 336: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839ea000  ! 337: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb9508000  ! 338: RDPR_TSTATE	<illegal instruction>
	.word 0xb550c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 340: RDPR_TT	<illegal instruction>
	.word 0xb5504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 343: RDPR_TPC	<illegal instruction>
	.word 0xb3a7c920  ! 344: FMULs	fmuls	%f31, %f0, %f25
	.word 0x8394e000  ! 345: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa7504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0x8196e000  ! 347: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xab500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 349: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8195a000  ! 350: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8197e000  ! 351: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbda408e0  ! 352: FSUBq	dis not found

	.word 0x81966000  ! 353: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x819e6000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xb5508000  ! 355: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a50820  ! 356: FADDs	fadds	%f20, %f0, %f19
	.word 0xb5a64960  ! 357: FMULq	dis not found

	.word 0x85952000  ! 358: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xad500000  ! 359: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 361: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb9a64940  ! 362: FMULd	fmuld	%f56, %f0, %f28
	.word 0xa3a58940  ! 363: FMULd	fmuld	%f22, %f0, %f48
	.word 0xbfa58920  ! 364: FMULs	fmuls	%f22, %f0, %f31
	.word 0x8d956000  ! 365: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8597a000  ! 366: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xada00560  ! 367: FSQRTq	fsqrt	
	.word 0x8797a000  ! 368: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8797a000  ! 369: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8796e000  ! 370: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa550c000  ! 371: RDPR_TT	<illegal instruction>
	.word 0xb3a00540  ! 372: FSQRTd	fsqrt	
	.word 0x8197e000  ! 373: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xa350c000  ! 374: RDPR_TT	<illegal instruction>
	.word 0xa9a408a0  ! 375: FSUBs	fsubs	%f16, %f0, %f20
	.word 0x819e2000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8d942000  ! 377: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb3500000  ! 378: RDPR_TPC	<illegal instruction>
	.word 0xa7a6c860  ! 379: FADDq	dis not found

	.word 0xa1a6c920  ! 380: FMULs	fmuls	%f27, %f0, %f16
	.word 0xa9a70920  ! 381: FMULs	fmuls	%f28, %f0, %f20
	.word 0x87946000  ! 382: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xada40940  ! 383: FMULd	fmuld	%f16, %f0, %f22
	.word 0xa1a7c940  ! 384: FMULd	fmuld	%f62, %f0, %f16
	.word 0x819ee000  ! 385: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x839d6000  ! 386: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa3504000  ! 387: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0x819f2000  ! 389: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8d952000  ! 390: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8395a000  ! 391: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbf508000  ! 392: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 393: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 394: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 395: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 396: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 397: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbda00560  ! 398: FSQRTq	fsqrt	
	.word 0x819f6000  ! 399: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb5a5c820  ! 400: FADDs	fadds	%f23, %f0, %f26
	.word 0x8196a000  ! 401: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8395e000  ! 402: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8197e000  ! 403: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x819fe000  ! 404: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa350c000  ! 405: RDPR_TT	<illegal instruction>
	.word 0x8397e000  ! 406: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x81946000  ! 407: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8394e000  ! 408: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x81942000  ! 409: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x839f6000  ! 410: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819d6000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8195a000  ! 412: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8796e000  ! 413: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8594a000  ! 414: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x839f2000  ! 415: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x85976000  ! 416: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x85956000  ! 417: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xbda68940  ! 418: FMULd	fmuld	%f26, %f0, %f30
	.word 0x8594a000  ! 419: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x819ca000  ! 420: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8596e000  ! 421: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x839e2000  ! 422: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d972000  ! 423: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819da000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbfa70940  ! 425: FMULd	fmuld	%f28, %f0, %f62
	.word 0xa1a6c960  ! 426: FMULq	dis not found

	.word 0xbb50c000  ! 427: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 428: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x839ea000  ! 429: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x8d952000  ! 430: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8795a000  ! 431: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8794e000  ! 432: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8597a000  ! 433: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb1500000  ! 434: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xaf500000  ! 435: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 436: RDPR_TNPC	<illegal instruction>
	.word 0xb1a50820  ! 437: FADDs	fadds	%f20, %f0, %f24
	.word 0xafa489e0  ! 438: FDIVq	dis not found

	.word 0xab504000  ! 439: RDPR_TNPC	<illegal instruction>
	.word 0x81966000  ! 440: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb7500000  ! 441: RDPR_TPC	<illegal instruction>
	.word 0x839f2000  ! 442: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x85962000  ! 443: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb3508000  ! 444: RDPR_TSTATE	<illegal instruction>
	.word 0x8594a000  ! 445: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8394a000  ! 446: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819f6000  ! 447: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x839ea000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x81956000  ! 449: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x85962000  ! 450: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa5500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xb950c000  ! 452: RDPR_TT	<illegal instruction>
	.word 0x8395e000  ! 453: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839fe000  ! 454: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbf500000  ! 455: RDPR_TPC	<illegal instruction>
	.word 0xa5500000  ! 456: RDPR_TPC	<illegal instruction>
	.word 0x819fe000  ! 457: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xbd504000  ! 458: RDPR_TNPC	<illegal instruction>
	.word 0x8397e000  ! 459: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8d966000  ! 460: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8d95e000  ! 461: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xbda70840  ! 462: FADDd	faddd	%f28, %f0, %f30
	.word 0xb3500000  ! 463: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 464: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa350c000  ! 465: RDPR_TT	<illegal instruction>
	.word 0xb5a50840  ! 466: FADDd	faddd	%f20, %f0, %f26
	.word 0xb150c000  ! 467: RDPR_TT	<illegal instruction>
	.word 0x839c6000  ! 468: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xbfa00540  ! 469: FSQRTd	fsqrt	
	.word 0xb7a44960  ! 470: FMULq	dis not found

	.word 0xab508000  ! 471: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 473: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb9a449e0  ! 474: FDIVq	dis not found

	.word 0xa1a00520  ! 475: FSQRTs	fsqrt	
	.word 0x8397a000  ! 476: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8597e000  ! 477: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa7504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0x81972000  ! 479: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa7504000  ! 480: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 481: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8396e000  ! 482: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xa7504000  ! 483: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 484: RDPR_TPC	<illegal instruction>
	.word 0x839f2000  ! 485: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819f6000  ! 486: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xafa4c860  ! 487: FADDq	dis not found

	.word 0xb3504000  ! 488: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 489: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 490: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xab504000  ! 491: RDPR_TNPC	<illegal instruction>
	.word 0xa7a449a0  ! 492: FDIVs	fdivs	%f17, %f0, %f19
	.word 0x819ce000  ! 493: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa5508000  ! 494: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 495: RDPR_TPC	<illegal instruction>
	.word 0xa9508000  ! 496: RDPR_TSTATE	<illegal instruction>
	.word 0xaf500000  ! 497: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 498: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x85966000  ! 499: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8596a000  ! 500: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8d97a000  ! 501: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8597a000  ! 502: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa1a609c0  ! 503: FDIVd	fdivd	%f24, %f0, %f16
	.word 0x819fe000  ! 504: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1a6c8a0  ! 505: FSUBs	fsubs	%f27, %f0, %f16
	.word 0xa3508000  ! 506: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a00540  ! 507: FSQRTd	fsqrt	
	.word 0xb1a00520  ! 508: FSQRTs	fsqrt	
	.word 0xa1a00520  ! 509: FSQRTs	fsqrt	
	.word 0xb1a40940  ! 510: FMULd	fmuld	%f16, %f0, %f24
	.word 0x8594a000  ! 511: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0x8595a000  ! 512: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8394e000  ! 513: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x83946000  ! 514: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8794a000  ! 515: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xb7504000  ! 516: RDPR_TNPC	<illegal instruction>
	.word 0x8795a000  ! 517: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x819e2000  ! 518: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb3504000  ! 519: RDPR_TNPC	<illegal instruction>
	.word 0x8394a000  ! 520: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8d976000  ! 521: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x83966000  ! 522: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d94e000  ! 523: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa5508000  ! 524: RDPR_TSTATE	<illegal instruction>
	.word 0x839e2000  ! 525: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d976000  ! 526: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x819ea000  ! 527: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x819ca000  ! 528: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x87966000  ! 529: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbf50c000  ! 530: RDPR_TT	<illegal instruction>
	.word 0x839fe000  ! 531: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa9508000  ! 532: RDPR_TSTATE	<illegal instruction>
	.word 0xaf50c000  ! 533: RDPR_TT	<illegal instruction>
	.word 0x85976000  ! 534: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x839ea000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x839fa000  ! 536: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839f6000  ! 537: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb9a748c0  ! 538: FSUBd	fsubd	%f60, %f0, %f28
	.word 0x839d2000  ! 539: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb5504000  ! 540: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 541: RDPR_TT	<illegal instruction>
	.word 0xa5a5c860  ! 542: FADDq	dis not found

	.word 0xa7500000  ! 543: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 544: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x85942000  ! 545: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xbd500000  ! 546: RDPR_TPC	<illegal instruction>
	.word 0x839d2000  ! 547: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x819d2000  ! 548: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8196a000  ! 549: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xad504000  ! 550: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0x81966000  ! 552: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xab508000  ! 553: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a74860  ! 554: FADDq	dis not found

	.word 0x8d946000  ! 555: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d95a000  ! 556: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8595e000  ! 557: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa3500000  ! 558: RDPR_TPC	<illegal instruction>
	.word 0x819d2000  ! 559: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x839c6000  ! 560: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa7a689a0  ! 561: FDIVs	fdivs	%f26, %f0, %f19
	.word 0xa5500000  ! 562: RDPR_TPC	<illegal instruction>
	.word 0xbda408a0  ! 563: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xbb508000  ! 564: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 565: RDPR_TNPC	<illegal instruction>
	.word 0xbd504000  ! 566: RDPR_TNPC	<illegal instruction>
	.word 0x8396e000  ! 567: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb1a00520  ! 568: FSQRTs	fsqrt	
	.word 0xad50c000  ! 569: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 570: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 571: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xab500000  ! 572: RDPR_TPC	<illegal instruction>
	.word 0xb5a00560  ! 573: FSQRTq	fsqrt	
	.word 0xbb500000  ! 574: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 575: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa1504000  ! 576: RDPR_TNPC	<illegal instruction>
	.word 0xbba7c9c0  ! 577: FDIVd	fdivd	%f62, %f0, %f60
	.word 0xbd50c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xa5a54840  ! 579: FADDd	faddd	%f52, %f0, %f18
	.word 0xb9500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0x87976000  ! 581: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb9508000  ! 582: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 583: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8197e000  ! 584: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb5a789a0  ! 585: FDIVs	fdivs	%f30, %f0, %f26
	.word 0x8d966000  ! 586: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819ea000  ! 587: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x81946000  ! 588: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x87946000  ! 589: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d94e000  ! 590: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb3508000  ! 591: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a5c8c0  ! 592: FSUBd	fsubd	%f54, %f0, %f16
	.word 0x81972000  ! 593: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x83966000  ! 594: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8797a000  ! 595: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa9508000  ! 596: RDPR_TSTATE	<illegal instruction>
	.word 0x8d942000  ! 597: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa5a488e0  ! 598: FSUBq	dis not found

	.word 0x839fe000  ! 599: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8796a000  ! 600: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb3500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x81946000  ! 602: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbd504000  ! 603: RDPR_TNPC	<illegal instruction>
	.word 0xab500000  ! 604: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 605: RDPR_TT	<illegal instruction>
	.word 0xbda7c840  ! 606: FADDd	faddd	%f62, %f0, %f30
	.word 0xa950c000  ! 607: RDPR_TT	<illegal instruction>
	.word 0xa3a00540  ! 608: FSQRTd	fsqrt	
	.word 0x8394a000  ! 609: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8d956000  ! 610: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa7a60840  ! 611: FADDd	faddd	%f24, %f0, %f50
	.word 0xbb508000  ! 612: RDPR_TSTATE	<illegal instruction>
	.word 0xafa509e0  ! 613: FDIVq	dis not found

	.word 0xbb508000  ! 614: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a488a0  ! 615: FSUBs	fsubs	%f18, %f0, %f19
	.word 0x8d94a000  ! 616: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819f6000  ! 617: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb150c000  ! 618: RDPR_TT	<illegal instruction>
	.word 0xb9a00560  ! 619: FSQRTq	fsqrt	
	.word 0xafa4c9c0  ! 620: FDIVd	fdivd	%f50, %f0, %f54
	.word 0x81976000  ! 621: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa5500000  ! 622: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 623: RDPR_TNPC	<illegal instruction>
	.word 0xab500000  ! 624: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 625: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d966000  ! 626: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x85956000  ! 627: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xaba549a0  ! 628: FDIVs	fdivs	%f21, %f0, %f21
	.word 0xa9504000  ! 629: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 630: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xbb50c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 632: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x839fe000  ! 633: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8595a000  ! 634: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d966000  ! 635: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbf504000  ! 636: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 637: RDPR_TSTATE	<illegal instruction>
	.word 0x83962000  ! 638: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x81946000  ! 639: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x81976000  ! 640: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x87976000  ! 641: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8796e000  ! 642: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa7504000  ! 643: RDPR_TNPC	<illegal instruction>
	.word 0x8d97e000  ! 644: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8594e000  ! 645: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xbb500000  ! 646: RDPR_TPC	<illegal instruction>
	.word 0x819fe000  ! 647: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819ca000  ! 648: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb9a78940  ! 649: FMULd	fmuld	%f30, %f0, %f28
	.word 0x81946000  ! 650: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb3508000  ! 651: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a60920  ! 652: FMULs	fmuls	%f24, %f0, %f25
	.word 0xb1504000  ! 653: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 654: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbba44920  ! 655: FMULs	fmuls	%f17, %f0, %f29
	.word 0x8395e000  ! 656: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839fe000  ! 657: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x83956000  ! 658: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xafa408a0  ! 659: FSUBs	fsubs	%f16, %f0, %f23
	.word 0xbf508000  ! 660: RDPR_TSTATE	<illegal instruction>
	.word 0xad50c000  ! 661: RDPR_TT	<illegal instruction>
	.word 0x8397a000  ! 662: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa1508000  ! 663: RDPR_TSTATE	<illegal instruction>
	.word 0x839da000  ! 664: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xa9a64920  ! 665: FMULs	fmuls	%f25, %f0, %f20
	.word 0xbf50c000  ! 666: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 667: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8595e000  ! 668: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb1504000  ! 669: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 670: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xab508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 672: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 673: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8797e000  ! 674: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xa1500000  ! 675: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 676: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x819ca000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x839d6000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa3a58960  ! 679: FMULq	dis not found

	.word 0x8797a000  ! 680: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8d976000  ! 681: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa3504000  ! 682: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0x8d946000  ! 684: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8794e000  ! 685: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8d972000  ! 686: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa5504000  ! 687: RDPR_TNPC	<illegal instruction>
	.word 0xaba58920  ! 688: FMULs	fmuls	%f22, %f0, %f21
	.word 0x819d6000  ! 689: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xaba6c8a0  ! 690: FSUBs	fsubs	%f27, %f0, %f21
	.word 0xa1504000  ! 691: RDPR_TNPC	<illegal instruction>
	.word 0xb3a688e0  ! 692: FSUBq	dis not found

	.word 0xbb508000  ! 693: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 694: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb9a688c0  ! 695: FSUBd	fsubd	%f26, %f0, %f28
	.word 0x87942000  ! 696: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbda00540  ! 697: FSQRTd	fsqrt	
	.word 0xa1a00540  ! 698: FSQRTd	fsqrt	
	.word 0xbd50c000  ! 699: RDPR_TT	<illegal instruction>
	.word 0x8795e000  ! 700: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8596e000  ! 701: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb9500000  ! 702: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 703: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x819f2000  ! 704: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x87966000  ! 705: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa9504000  ! 706: RDPR_TNPC	<illegal instruction>
	.word 0x8394a000  ! 707: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xbd50c000  ! 708: RDPR_TT	<illegal instruction>
	.word 0xa7504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xa3a589c0  ! 710: FDIVd	fdivd	%f22, %f0, %f48
	.word 0xb7a7c840  ! 711: FADDd	faddd	%f62, %f0, %f58
	.word 0xb550c000  ! 712: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 713: RDPR_TT	<illegal instruction>
	.word 0xb150c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xa1508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xb7508000  ! 716: RDPR_TSTATE	<illegal instruction>
	.word 0x8d976000  ! 717: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa950c000  ! 718: RDPR_TT	<illegal instruction>
	.word 0x8d95a000  ! 719: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8d97e000  ! 720: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa9504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 722: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819d6000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x85956000  ! 724: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x819d6000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81942000  ! 726: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xaf50c000  ! 727: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 728: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 729: RDPR_TPC	<illegal instruction>
	.word 0x819d6000  ! 730: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8394a000  ! 731: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb3a00540  ! 732: FSQRTd	fsqrt	
	.word 0xa550c000  ! 733: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 734: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa3508000  ! 735: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 736: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa1a588a0  ! 737: FSUBs	fsubs	%f22, %f0, %f16
	.word 0x85952000  ! 738: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x85962000  ! 739: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x819d2000  ! 740: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d972000  ! 741: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb9a74840  ! 742: FADDd	faddd	%f60, %f0, %f28
	.word 0x839d2000  ! 743: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x839c6000  ! 744: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xb1500000  ! 745: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x819fa000  ! 747: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb7508000  ! 748: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 749: RDPR_TT	<illegal instruction>
	.word 0x819da000  ! 750: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb1508000  ! 751: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 752: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x819de000  ! 753: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbda609a0  ! 754: FDIVs	fdivs	%f24, %f0, %f30
	.word 0xb1a78860  ! 755: FADDq	dis not found

	.word 0xb3504000  ! 756: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 757: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xbd50c000  ! 758: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 759: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0x85966000  ! 761: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d95e000  ! 762: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x85966000  ! 763: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d97a000  ! 764: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa5504000  ! 765: RDPR_TNPC	<illegal instruction>
	.word 0x839fa000  ! 766: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839e6000  ! 767: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb3500000  ! 768: RDPR_TPC	<illegal instruction>
	.word 0x819c6000  ! 769: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8d97a000  ! 770: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8396a000  ! 771: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xb3508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 773: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x839fa000  ! 774: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xbda78940  ! 775: FMULd	fmuld	%f30, %f0, %f30
	.word 0xb550c000  ! 776: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 777: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xad500000  ! 778: RDPR_TPC	<illegal instruction>
	.word 0xb7500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 780: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x85942000  ! 781: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8794e000  ! 782: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8396e000  ! 783: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xbda00540  ! 784: FSQRTd	fsqrt	
	.word 0x819f6000  ! 785: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x819fa000  ! 786: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb9508000  ! 787: RDPR_TSTATE	<illegal instruction>
	.word 0xbb500000  ! 788: RDPR_TPC	<illegal instruction>
	.word 0xa9500000  ! 789: RDPR_TPC	<illegal instruction>
	.word 0x819f2000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xaf500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0xaf500000  ! 792: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 793: RDPR_TPC	<illegal instruction>
	.word 0x85956000  ! 794: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x85946000  ! 795: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x839ce000  ! 796: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa5500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 798: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 799: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xbb508000  ! 800: RDPR_TSTATE	<illegal instruction>
	.word 0x81972000  ! 801: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x83966000  ! 802: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbb50c000  ! 803: RDPR_TT	<illegal instruction>
	.word 0xa9508000  ! 804: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a789c0  ! 805: FDIVd	fdivd	%f30, %f0, %f28
	.word 0xa5a68840  ! 806: FADDd	faddd	%f26, %f0, %f18
	.word 0xaf508000  ! 807: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 808: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8596e000  ! 809: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb5a5c9c0  ! 810: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xb9504000  ! 811: RDPR_TNPC	<illegal instruction>
	.word 0xbf504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xa1a00540  ! 813: FSQRTd	fsqrt	
	.word 0x8d94a000  ! 814: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xb5a588e0  ! 815: FSUBq	dis not found

	.word 0x85942000  ! 816: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x85966000  ! 817: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa350c000  ! 818: RDPR_TT	<illegal instruction>
	.word 0xa1a7c9a0  ! 819: FDIVs	fdivs	%f31, %f0, %f16
	.word 0xa1a7c960  ! 820: FMULq	dis not found

	.word 0xb3a54820  ! 821: FADDs	fadds	%f21, %f0, %f25
	.word 0xa3a00560  ! 822: FSQRTq	fsqrt	
	.word 0xbf504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0x85956000  ! 824: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8396e000  ! 825: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xaf500000  ! 826: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb1a5c8a0  ! 828: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xab504000  ! 829: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8196e000  ! 831: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb950c000  ! 832: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 834: RDPR_TT	<illegal instruction>
	.word 0x87962000  ! 835: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x87952000  ! 836: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8d946000  ! 837: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x81942000  ! 838: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xaf504000  ! 839: RDPR_TNPC	<illegal instruction>
	.word 0x819ce000  ! 840: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8d95e000  ! 841: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xada549e0  ! 842: FDIVq	dis not found

	.word 0x839da000  ! 843: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x85956000  ! 844: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xab504000  ! 845: RDPR_TNPC	<illegal instruction>
	.word 0x819d6000  ! 846: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb7500000  ! 847: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 848: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa1508000  ! 849: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 850: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb3508000  ! 851: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 852: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb350c000  ! 853: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 854: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xb350c000  ! 855: RDPR_TT	<illegal instruction>
	.word 0x819c2000  ! 856: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb350c000  ! 857: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0x87966000  ! 859: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8195a000  ! 860: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xbfa00560  ! 861: FSQRTq	fsqrt	
	.word 0x8d956000  ! 862: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819ea000  ! 863: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xaf500000  ! 864: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 865: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x819d6000  ! 866: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xab504000  ! 867: RDPR_TNPC	<illegal instruction>
	.word 0xb1a749c0  ! 868: FDIVd	fdivd	%f60, %f0, %f24
	.word 0x839fa000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb7504000  ! 870: RDPR_TNPC	<illegal instruction>
	.word 0x87976000  ! 871: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xab508000  ! 872: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a749e0  ! 873: FDIVq	dis not found

	.word 0xb950c000  ! 874: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 875: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa3504000  ! 876: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 877: RDPR_TT	<illegal instruction>
	.word 0x8d96e000  ! 878: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x83942000  ! 879: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb1504000  ! 880: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 881: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xaf508000  ! 882: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a409e0  ! 883: FDIVq	dis not found

	.word 0xb9504000  ! 884: RDPR_TNPC	<illegal instruction>
	.word 0x8d956000  ! 885: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x839f6000  ! 886: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbf50c000  ! 887: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 888: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 889: RDPR_TSTATE	<illegal instruction>
	.word 0x839ca000  ! 890: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x839ce000  ! 891: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x819da000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb3504000  ! 893: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 894: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xb9a48860  ! 896: FADDq	dis not found

	.word 0xb3504000  ! 897: RDPR_TNPC	<illegal instruction>
	.word 0x839d6000  ! 898: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8d972000  ! 899: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbd504000  ! 900: RDPR_TNPC	<illegal instruction>
	.word 0x8195a000  ! 901: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8d94a000  ! 902: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819d6000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb7500000  ! 904: RDPR_TPC	<illegal instruction>
	.word 0xb3a54960  ! 905: FMULq	dis not found

	.word 0x83952000  ! 906: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8796a000  ! 907: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xb9504000  ! 908: RDPR_TNPC	<illegal instruction>
	.word 0x87972000  ! 909: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa3500000  ! 910: RDPR_TPC	<illegal instruction>
	.word 0xb3500000  ! 911: RDPR_TPC	<illegal instruction>
	.word 0xb7508000  ! 912: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a649e0  ! 913: FDIVq	dis not found

	.word 0xb1a7c840  ! 914: FADDd	faddd	%f62, %f0, %f24
	.word 0x839da000  ! 915: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x839f6000  ! 916: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819de000  ! 917: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8397a000  ! 918: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8d96e000  ! 919: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb5504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0x839c6000  ! 923: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xaf508000  ! 924: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a7c860  ! 925: FADDq	dis not found

	.word 0xb9a408e0  ! 926: FSUBq	dis not found

	.word 0x85976000  ! 927: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d966000  ! 928: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbf50c000  ! 929: RDPR_TT	<illegal instruction>
	.word 0x83972000  ! 930: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x819e6000  ! 931: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbb504000  ! 932: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 933: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 934: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x81942000  ! 935: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbf500000  ! 936: RDPR_TPC	<illegal instruction>
	.word 0x81962000  ! 937: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xad508000  ! 938: RDPR_TSTATE	<illegal instruction>
	.word 0x83962000  ! 939: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819e6000  ! 940: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xb9504000  ! 941: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 942: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 943: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x85942000  ! 944: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819ca000  ! 945: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa5504000  ! 946: RDPR_TNPC	<illegal instruction>
	.word 0xada708e0  ! 947: FSUBq	dis not found

	.word 0xa5500000  ! 948: RDPR_TPC	<illegal instruction>
	.word 0xa7a64940  ! 949: FMULd	fmuld	%f56, %f0, %f50
	.word 0xad508000  ! 950: RDPR_TSTATE	<illegal instruction>
	.word 0xa1508000  ! 951: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 953: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x83956000  ! 954: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa9500000  ! 955: RDPR_TPC	<illegal instruction>
	.word 0xb7a74940  ! 956: FMULd	fmuld	%f60, %f0, %f58
	.word 0x839e2000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x87962000  ! 958: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbf508000  ! 959: RDPR_TSTATE	<illegal instruction>
	.word 0xb3508000  ! 960: RDPR_TSTATE	<illegal instruction>
	.word 0x8797e000  ! 961: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb550c000  ! 962: RDPR_TT	<illegal instruction>
	.word 0xb3a00520  ! 963: FSQRTs	fsqrt	
	.word 0xb5a5c960  ! 964: FMULq	dis not found

	.word 0x83956000  ! 965: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa750c000  ! 966: RDPR_TT	<illegal instruction>
	.word 0xaf500000  ! 967: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 968: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d942000  ! 969: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8d94a000  ! 970: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xb5508000  ! 971: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xbf508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0xafa40940  ! 974: FMULd	fmuld	%f16, %f0, %f54
	.word 0xb7504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0xb9a7c8c0  ! 976: FSUBd	fsubd	%f62, %f0, %f28
	.word 0xa5504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 978: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 980: RDPR_TSTATE	<illegal instruction>
	.word 0x8396e000  ! 981: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb3a6c8a0  ! 982: FSUBs	fsubs	%f27, %f0, %f25
	.word 0xaf50c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0x8d972000  ! 984: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819fe000  ! 985: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x83946000  ! 986: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa3500000  ! 987: RDPR_TPC	<illegal instruction>
	.word 0x8796a000  ! 988: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8194a000  ! 989: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d95a000  ! 990: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa7504000  ! 991: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 992: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 993: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 994: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa950c000  ! 995: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 996: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x83966000  ! 997: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb150c000  ! 998: RDPR_TT	<illegal instruction>
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	ta	T_CHANGE_PRIV
	wrpr	%g0, 1, %tl
	wrpr	%l0, %g0, %tpc
	wrpr	%l0, %g0, %tnpc
	wrpr	%l0, %g0, %tstate
	wrpr	%l0, %g0, %tt
	.word 0xa1504000  ! 1: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x8d95a000  ! 2: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb9a708e0  ! 3: FSUBq	dis not found

	.word 0xbd500000  ! 4: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x83966000  ! 5: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb1a608a0  ! 6: FSUBs	fsubs	%f24, %f0, %f24
	.word 0x8196a000  ! 7: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xaba7c9c0  ! 8: FDIVd	fdivd	%f62, %f0, %f52
	.word 0x87966000  ! 9: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8194e000  ! 10: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8395a000  ! 11: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xa5508000  ! 12: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa5a44840  ! 13: FADDd	faddd	%f48, %f0, %f18
	.word 0xb1508000  ! 14: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 15: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 16: RDPR_TPC	<illegal instruction>
	.word 0x8d942000  ! 17: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb7a00520  ! 18: FSQRTs	fsqrt	
	.word 0x81942000  ! 19: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xad508000  ! 20: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xa150c000  ! 21: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 22: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 23: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbd508000  ! 24: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xa150c000  ! 25: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 26: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8596a000  ! 27: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x85956000  ! 28: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb9508000  ! 29: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xa5a00540  ! 30: FSQRTd	fsqrt	
	.word 0x8396a000  ! 31: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x85962000  ! 32: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa9a748e0  ! 33: FSUBq	dis not found

	.word 0xb5508000  ! 34: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x8d95a000  ! 35: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8d96a000  ! 36: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xad508000  ! 37: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xb750c000  ! 38: RDPR_TT	<illegal instruction>
	.word 0x87946000  ! 39: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x87956000  ! 40: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x85946000  ! 41: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x819ea000  ! 42: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8d97a000  ! 43: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8d962000  ! 44: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x85966000  ! 45: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x83962000  ! 46: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa5508000  ! 47: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb1a748e0  ! 48: FSUBq	dis not found

	.word 0xad50c000  ! 49: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 50: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 51: RDPR_TT	<illegal instruction>
	.word 0xa1a00560  ! 52: FSQRTq	fsqrt	
	.word 0x819c2000  ! 53: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8397a000  ! 54: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x81952000  ! 55: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbf508000  ! 56: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x81942000  ! 57: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xb7a708e0  ! 58: FSUBq	dis not found

	.word 0xb1a689a0  ! 59: FDIVs	fdivs	%f26, %f0, %f24
	.word 0xad500000  ! 60: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xa9500000  ! 61: RDPR_TPC	<illegal instruction>
	.word 0x839fa000  ! 62: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x83952000  ! 63: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819c6000  ! 64: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb7508000  ! 65: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb550c000  ! 66: RDPR_TT	<illegal instruction>
	.word 0xbd508000  ! 67: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 68: RDPR_TT	<illegal instruction>
	.word 0x819ee000  ! 69: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8195a000  ! 70: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb7500000  ! 71: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x8196a000  ! 72: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa9a00540  ! 73: FSQRTd	fsqrt	
	.word 0x8396a000  ! 74: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x85972000  ! 75: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x819ee000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8396e000  ! 77: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x819e6000  ! 78: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8796a000  ! 79: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d94e000  ! 80: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8d946000  ! 81: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d96e000  ! 82: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8196e000  ! 83: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbf50c000  ! 84: RDPR_TT	rdpr	%tt, %r31
	.word 0x81956000  ! 85: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8d962000  ! 86: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa5508000  ! 87: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb7500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0xaf500000  ! 89: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 90: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xbf504000  ! 91: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xa9a448a0  ! 92: FSUBs	fsubs	%f17, %f0, %f20
	.word 0xaf504000  ! 93: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 94: RDPR_TNPC	<illegal instruction>
	.word 0x8d942000  ! 95: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xbf508000  ! 96: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb7a708a0  ! 97: FSUBs	fsubs	%f28, %f0, %f27
	.word 0xa9504000  ! 98: RDPR_TNPC	<illegal instruction>
	.word 0xad500000  ! 99: RDPR_TPC	<illegal instruction>
	.word 0x8d97e000  ! 100: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x83972000  ! 101: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb9508000  ! 102: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8196e000  ! 103: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x839f6000  ! 104: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x819de000  ! 105: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xaba74920  ! 106: FMULs	fmuls	%f29, %f0, %f21
	.word 0x839ee000  ! 107: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x8d976000  ! 108: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa3508000  ! 109: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8394a000  ! 110: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8596a000  ! 111: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xab50c000  ! 112: RDPR_TT	rdpr	%tt, %r21
	.word 0x8d956000  ! 113: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xafa70860  ! 114: FADDq	dis not found

	.word 0x8d97a000  ! 115: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xbf500000  ! 116: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x819c2000  ! 117: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa950c000  ! 118: RDPR_TT	rdpr	%tt, %r20
	.word 0xb7a448e0  ! 119: FSUBq	dis not found

	.word 0xb5500000  ! 120: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 121: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa5508000  ! 122: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa7504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x819fa000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x81956000  ! 125: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xad500000  ! 126: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xab504000  ! 127: RDPR_TNPC	<illegal instruction>
	.word 0x819ea000  ! 128: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbb504000  ! 129: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x819ee000  ! 130: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x87946000  ! 131: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x839e2000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819e6000  ! 133: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xb1a7c8e0  ! 134: FSUBq	dis not found

	.word 0xb7a00540  ! 135: FSQRTd	fsqrt	
	.word 0x87976000  ! 136: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8d976000  ! 137: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8795e000  ! 138: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x819ea000  ! 139: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb3504000  ! 140: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8d94a000  ! 141: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819e6000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8d94e000  ! 143: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ca000  ! 144: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x819c2000  ! 145: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x81966000  ! 146: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb3500000  ! 147: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa7a00520  ! 148: FSQRTs	fsqrt	
	.word 0x8d976000  ! 149: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa5504000  ! 150: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x8d946000  ! 151: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819d6000  ! 152: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x87946000  ! 153: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x83966000  ! 154: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xada00540  ! 155: FSQRTd	fsqrt	
	.word 0x819da000  ! 156: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x819ce000  ! 157: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8d962000  ! 158: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xaf508000  ! 159: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x8d95e000  ! 160: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8596a000  ! 161: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8d97e000  ! 162: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8396e000  ! 163: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8197a000  ! 164: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb5500000  ! 165: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x839c6000  ! 166: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x839ca000  ! 167: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xbd504000  ! 168: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbd508000  ! 169: RDPR_TSTATE	<illegal instruction>
	.word 0xad508000  ! 170: RDPR_TSTATE	<illegal instruction>
	.word 0xa1504000  ! 171: RDPR_TNPC	<illegal instruction>
	.word 0xb3a44840  ! 172: FADDd	faddd	%f48, %f0, %f56
	.word 0x819ea000  ! 173: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x839f2000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xab504000  ! 175: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xb1508000  ! 176: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 177: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xa3504000  ! 178: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8d97e000  ! 179: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x87946000  ! 180: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb3500000  ! 181: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa550c000  ! 182: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0x819ee000  ! 184: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xbba7c9a0  ! 185: FDIVs	fdivs	%f31, %f0, %f29
	.word 0x8d976000  ! 186: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x839ea000  ! 187: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xbfa00520  ! 188: FSQRTs	fsqrt	
	.word 0x87962000  ! 189: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8395e000  ! 190: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x839fa000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb1500000  ! 192: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xa7508000  ! 193: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 194: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x87976000  ! 195: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8595e000  ! 196: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xaba00520  ! 197: FSQRTs	fsqrt	
	.word 0xb9508000  ! 198: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8d96e000  ! 199: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x81966000  ! 200: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb7a648a0  ! 201: FSUBs	fsubs	%f25, %f0, %f27
	.word 0xb1500000  ! 202: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8196a000  ! 203: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x839fe000  ! 204: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb550c000  ! 205: RDPR_TT	rdpr	%tt, %r26
	.word 0x819fe000  ! 206: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab508000  ! 207: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8596e000  ! 208: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8d952000  ! 209: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xbf50c000  ! 210: RDPR_TT	rdpr	%tt, %r31
	.word 0xbf504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0x8794e000  ! 212: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x8594e000  ! 213: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa1508000  ! 214: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8394a000  ! 215: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x85956000  ! 216: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xaf500000  ! 217: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x8394a000  ! 218: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa3a688c0  ! 219: FSUBd	fsubd	%f26, %f0, %f48
	.word 0x839c6000  ! 220: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x839c2000  ! 221: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x81962000  ! 222: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xab50c000  ! 223: RDPR_TT	rdpr	%tt, %r21
	.word 0xb7a7c9c0  ! 224: FDIVd	fdivd	%f62, %f0, %f58
	.word 0x839de000  ! 225: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb1504000  ! 226: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xb3a709e0  ! 227: FDIVq	dis not found

	.word 0x819e6000  ! 228: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x81962000  ! 229: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8796a000  ! 230: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x81972000  ! 231: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xbba64960  ! 232: FMULq	dis not found

	.word 0xb3a54940  ! 233: FMULd	fmuld	%f52, %f0, %f56
	.word 0xb350c000  ! 234: RDPR_TT	rdpr	%tt, %r25
	.word 0x819fa000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb5500000  ! 236: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8d956000  ! 237: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8797a000  ! 238: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xbf50c000  ! 239: RDPR_TT	rdpr	%tt, %r31
	.word 0x839e2000  ! 240: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839e6000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x819ca000  ! 242: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb5a709c0  ! 243: FDIVd	fdivd	%f28, %f0, %f26
	.word 0xb1a589a0  ! 244: FDIVs	fdivs	%f22, %f0, %f24
	.word 0x839c6000  ! 245: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x819ca000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x819f2000  ! 247: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x81956000  ! 248: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xaba78860  ! 249: FADDq	dis not found

	.word 0x83976000  ! 250: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb7500000  ! 251: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x8d942000  ! 252: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb150c000  ! 253: RDPR_TT	rdpr	%tt, %r24
	.word 0xa950c000  ! 254: RDPR_TT	<illegal instruction>
	.word 0x819f6000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8d966000  ! 256: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbfa688e0  ! 257: FSUBq	dis not found

	.word 0x81946000  ! 258: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa1a588c0  ! 259: FSUBd	fsubd	%f22, %f0, %f16
	.word 0xaba5c860  ! 260: FADDq	dis not found

	.word 0x83976000  ! 261: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb9500000  ! 262: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x8597a000  ! 263: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839ca000  ! 264: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x8d946000  ! 265: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d95e000  ! 266: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d962000  ! 267: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x81972000  ! 268: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb1500000  ! 269: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x85962000  ! 270: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x81966000  ! 271: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xad508000  ! 272: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x85966000  ! 273: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x81966000  ! 274: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x819d6000  ! 275: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xbda00540  ! 276: FSQRTd	fsqrt	
	.word 0xad500000  ! 277: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x83976000  ! 278: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xab508000  ! 279: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xb5508000  ! 280: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e000  ! 281: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb9a709c0  ! 282: FDIVd	fdivd	%f28, %f0, %f28
	.word 0x85966000  ! 283: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbd504000  ! 284: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x8395e000  ! 285: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xad508000  ! 286: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xbda509a0  ! 287: FDIVs	fdivs	%f20, %f0, %f30
	.word 0x8797a000  ! 288: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xaf500000  ! 289: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xa3a488e0  ! 290: FSUBq	dis not found

	.word 0x8597a000  ! 291: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839e2000  ! 292: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xa350c000  ! 293: RDPR_TT	rdpr	%tt, %r17
	.word 0xa1508000  ! 294: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 295: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x819da000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbd504000  ! 297: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xa1508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97e000  ! 299: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa7a508a0  ! 300: FSUBs	fsubs	%f20, %f0, %f19
	.word 0xaf500000  ! 301: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x8d94e000  ! 302: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ea000  ! 303: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbb50c000  ! 304: RDPR_TT	rdpr	%tt, %r29
	.word 0x8d95a000  ! 305: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xaf504000  ! 306: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x8d946000  ! 307: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x839c2000  ! 308: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x83976000  ! 309: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8396a000  ! 310: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa5500000  ! 311: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x85956000  ! 312: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8d972000  ! 313: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819da000  ! 314: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb9a58960  ! 315: FMULq	dis not found

	.word 0x839f6000  ! 316: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbb50c000  ! 317: RDPR_TT	rdpr	%tt, %r29
	.word 0xbf500000  ! 318: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 319: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb3500000  ! 320: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x8195e000  ! 321: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x81962000  ! 322: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x819de000  ! 323: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x81942000  ! 324: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x819de000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xaf504000  ! 326: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xa7508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0xaba509a0  ! 328: FDIVs	fdivs	%f20, %f0, %f21
	.word 0xa7a788a0  ! 329: FSUBs	fsubs	%f30, %f0, %f19
	.word 0x8194a000  ! 330: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xa5a60940  ! 331: FMULd	fmuld	%f24, %f0, %f18
	.word 0x8d96e000  ! 332: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8d95e000  ! 333: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa9508000  ! 334: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xb5a7c8a0  ! 335: FSUBs	fsubs	%f31, %f0, %f26
	.word 0x839e6000  ! 336: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839c2000  ! 337: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xa5508000  ! 338: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb950c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xb350c000  ! 340: RDPR_TT	<illegal instruction>
	.word 0xbd504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 343: RDPR_TPC	<illegal instruction>
	.word 0xa5a74920  ! 344: FMULs	fmuls	%f29, %f0, %f18
	.word 0x83966000  ! 345: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb7504000  ! 346: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x81952000  ! 347: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa9500000  ! 348: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x8396e000  ! 349: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8197e000  ! 350: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8196a000  ! 351: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb9a688e0  ! 352: FSUBq	dis not found

	.word 0x81962000  ! 353: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x819f6000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xab508000  ! 355: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xafa70820  ! 356: FADDs	fadds	%f28, %f0, %f23
	.word 0xbfa4c960  ! 357: FMULq	dis not found

	.word 0x8596a000  ! 358: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbf500000  ! 359: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xaf500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 361: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xada54940  ! 362: FMULd	fmuld	%f52, %f0, %f22
	.word 0xa7a50940  ! 363: FMULd	fmuld	%f20, %f0, %f50
	.word 0xa9a70920  ! 364: FMULs	fmuls	%f28, %f0, %f20
	.word 0x8d96e000  ! 365: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8594e000  ! 366: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb7a00560  ! 367: FSQRTq	fsqrt	
	.word 0x87952000  ! 368: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8796e000  ! 369: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x87946000  ! 370: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb750c000  ! 371: RDPR_TT	rdpr	%tt, %r27
	.word 0xaba00540  ! 372: FSQRTd	fsqrt	
	.word 0x81972000  ! 373: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xbb50c000  ! 374: RDPR_TT	rdpr	%tt, %r29
	.word 0xb7a508a0  ! 375: FSUBs	fsubs	%f20, %f0, %f27
	.word 0x819ea000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x8d972000  ! 377: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa5500000  ! 378: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xb1a7c860  ! 379: FADDq	dis not found

	.word 0xa7a5c920  ! 380: FMULs	fmuls	%f23, %f0, %f19
	.word 0xb5a4c920  ! 381: FMULs	fmuls	%f19, %f0, %f26
	.word 0x87942000  ! 382: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa7a50940  ! 383: FMULd	fmuld	%f20, %f0, %f50
	.word 0xa3a74940  ! 384: FMULd	fmuld	%f60, %f0, %f48
	.word 0x819e6000  ! 385: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x839fe000  ! 386: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xa9504000  ! 387: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xbf50c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 389: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8d97e000  ! 390: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x83956000  ! 391: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xab508000  ! 392: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xbd500000  ! 393: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 394: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 395: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 396: RDPR_TPC	<illegal instruction>
	.word 0x8795a000  ! 397: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbba00560  ! 398: FSQRTq	fsqrt	
	.word 0x819d2000  ! 399: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb1a5c820  ! 400: FADDs	fadds	%f23, %f0, %f24
	.word 0x8195a000  ! 401: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8395a000  ! 402: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8197e000  ! 403: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x819ee000  ! 404: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa950c000  ! 405: RDPR_TT	rdpr	%tt, %r20
	.word 0x83962000  ! 406: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x8196e000  ! 407: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83976000  ! 408: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8197a000  ! 409: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x839e2000  ! 410: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819c2000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x81972000  ! 412: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8794e000  ! 413: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x85972000  ! 414: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x839e2000  ! 415: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8595a000  ! 416: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8596e000  ! 417: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xb3a5c940  ! 418: FMULd	fmuld	%f54, %f0, %f56
	.word 0x8596e000  ! 419: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x819d2000  ! 420: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8596e000  ! 421: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x839d6000  ! 422: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8d95e000  ! 423: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819da000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xa7a54940  ! 425: FMULd	fmuld	%f52, %f0, %f50
	.word 0xafa54960  ! 426: FMULq	dis not found

	.word 0xb950c000  ! 427: RDPR_TT	rdpr	%tt, %r28
	.word 0x8394e000  ! 428: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x839ce000  ! 429: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d94a000  ! 430: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8796a000  ! 431: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8795a000  ! 432: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x8595a000  ! 433: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xa1500000  ! 434: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xb1500000  ! 435: RDPR_TPC	<illegal instruction>
	.word 0xaf504000  ! 436: RDPR_TNPC	<illegal instruction>
	.word 0xada58820  ! 437: FADDs	fadds	%f22, %f0, %f22
	.word 0xb5a409e0  ! 438: FDIVq	dis not found

	.word 0xb3504000  ! 439: RDPR_TNPC	<illegal instruction>
	.word 0x81952000  ! 440: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa3500000  ! 441: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x839ea000  ! 442: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x8596e000  ! 443: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa5508000  ! 444: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8595e000  ! 445: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x83962000  ! 446: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819ce000  ! 447: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x839f2000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x81942000  ! 449: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x85946000  ! 450: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xab500000  ! 451: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xaf50c000  ! 452: RDPR_TT	<illegal instruction>
	.word 0x8396a000  ! 453: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x839ce000  ! 454: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xa5500000  ! 455: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xb3500000  ! 456: RDPR_TPC	<illegal instruction>
	.word 0x819f2000  ! 457: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb1504000  ! 458: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x83966000  ! 459: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d972000  ! 460: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8d97e000  ! 461: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb5a50840  ! 462: FADDd	faddd	%f20, %f0, %f26
	.word 0xa1500000  ! 463: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x87966000  ! 464: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb950c000  ! 465: RDPR_TT	rdpr	%tt, %r28
	.word 0xb3a60840  ! 466: FADDd	faddd	%f24, %f0, %f56
	.word 0xa350c000  ! 467: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 468: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xb1a00540  ! 469: FSQRTd	fsqrt	
	.word 0xa9a4c960  ! 470: FMULq	dis not found

	.word 0xbf508000  ! 471: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb150c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0x8d976000  ! 473: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb1a709e0  ! 474: FDIVq	dis not found

	.word 0xa5a00520  ! 475: FSQRTs	fsqrt	
	.word 0x83946000  ! 476: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8594a000  ! 477: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa7504000  ! 478: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x8197a000  ! 479: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb7504000  ! 480: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8596a000  ! 481: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8394a000  ! 482: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa7504000  ! 483: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xbf500000  ! 484: RDPR_TPC	<illegal instruction>
	.word 0x839fe000  ! 485: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819ea000  ! 486: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa3a6c860  ! 487: FADDq	dis not found

	.word 0xab504000  ! 488: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xa1508000  ! 489: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 490: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa1504000  ! 491: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa7a5c9a0  ! 492: FDIVs	fdivs	%f23, %f0, %f19
	.word 0x819f2000  ! 493: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xbd508000  ! 494: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb9500000  ! 495: RDPR_TPC	<illegal instruction>
	.word 0xb5508000  ! 496: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 497: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 498: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x85962000  ! 499: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x85972000  ! 500: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8d97a000  ! 501: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8595e000  ! 502: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa9a449c0  ! 503: FDIVd	fdivd	%f48, %f0, %f20
	.word 0x819fa000  ! 504: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa9a688a0  ! 505: FSUBs	fsubs	%f26, %f0, %f20
	.word 0xa3508000  ! 506: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xa5a00540  ! 507: FSQRTd	fsqrt	
	.word 0xbfa00520  ! 508: FSQRTs	fsqrt	
	.word 0xaba00520  ! 509: FSQRTs	fsqrt	
	.word 0xb3a60940  ! 510: FMULd	fmuld	%f24, %f0, %f56
	.word 0x8596e000  ! 511: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8594e000  ! 512: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x83966000  ! 513: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x83942000  ! 514: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x87962000  ! 515: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb9504000  ! 516: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x87962000  ! 517: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819e2000  ! 518: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa7504000  ! 519: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x8394a000  ! 520: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8d94a000  ! 521: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x83972000  ! 522: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8d94e000  ! 523: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xb3508000  ! 524: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x839de000  ! 525: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8d95e000  ! 526: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x819de000  ! 527: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x819f2000  ! 528: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x87962000  ! 529: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xb550c000  ! 530: RDPR_TT	rdpr	%tt, %r26
	.word 0x839f6000  ! 531: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xbb508000  ! 532: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xad50c000  ! 533: RDPR_TT	<illegal instruction>
	.word 0x8597e000  ! 534: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x839f2000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x839ce000  ! 536: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x839d6000  ! 537: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xbda408c0  ! 538: FSUBd	fsubd	%f16, %f0, %f30
	.word 0x839fa000  ! 539: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xbd504000  ! 540: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xa950c000  ! 541: RDPR_TT	<illegal instruction>
	.word 0xb9a70860  ! 542: FADDq	dis not found

	.word 0xa7500000  ! 543: RDPR_TPC	<illegal instruction>
	.word 0x8d95e000  ! 544: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x85972000  ! 545: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xbd500000  ! 546: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x839da000  ! 547: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819f2000  ! 548: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x81942000  ! 549: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xad504000  ! 550: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xa750c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0x81972000  ! 552: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb7508000  ! 553: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xada5c860  ! 554: FADDq	dis not found

	.word 0x8d962000  ! 555: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8d94e000  ! 556: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8596e000  ! 557: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa3500000  ! 558: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x819d6000  ! 559: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839de000  ! 560: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb9a4c9a0  ! 561: FDIVs	fdivs	%f19, %f0, %f28
	.word 0xa9500000  ! 562: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xb7a7c8a0  ! 563: FSUBs	fsubs	%f31, %f0, %f27
	.word 0xa1508000  ! 564: RDPR_TSTATE	<illegal instruction>
	.word 0xbf504000  ! 565: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 566: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 567: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb7a00520  ! 568: FSQRTs	fsqrt	
	.word 0xb750c000  ! 569: RDPR_TT	rdpr	%tt, %r27
	.word 0xb1500000  ! 570: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 571: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xa9500000  ! 572: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xa9a00560  ! 573: FSQRTq	fsqrt	
	.word 0xb5500000  ! 574: RDPR_TPC	<illegal instruction>
	.word 0x8395a000  ! 575: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xaf504000  ! 576: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xa1a4c9c0  ! 577: FDIVd	fdivd	%f50, %f0, %f16
	.word 0xbd50c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xbfa40840  ! 579: FADDd	faddd	%f16, %f0, %f62
	.word 0xb9500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0x8794e000  ! 581: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xab508000  ! 582: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x83956000  ! 583: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x81946000  ! 584: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xbfa749a0  ! 585: FDIVs	fdivs	%f29, %f0, %f31
	.word 0x8d976000  ! 586: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x819ce000  ! 587: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x81966000  ! 588: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x87976000  ! 589: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8d96a000  ! 590: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb5508000  ! 591: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb9a788c0  ! 592: FSUBd	fsubd	%f30, %f0, %f28
	.word 0x81946000  ! 593: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8397e000  ! 594: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87966000  ! 595: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xad508000  ! 596: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x8d976000  ! 597: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xada488e0  ! 598: FSUBq	dis not found

	.word 0x839ce000  ! 599: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x87952000  ! 600: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbf500000  ! 601: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x81966000  ! 602: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa3504000  ! 603: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xb9500000  ! 604: RDPR_TPC	<illegal instruction>
	.word 0xa150c000  ! 605: RDPR_TT	<illegal instruction>
	.word 0xa1a40840  ! 606: FADDd	faddd	%f16, %f0, %f16
	.word 0xad50c000  ! 607: RDPR_TT	<illegal instruction>
	.word 0xa9a00540  ! 608: FSQRTd	fsqrt	
	.word 0x8395a000  ! 609: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x8d95e000  ! 610: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb3a7c840  ! 611: FADDd	faddd	%f62, %f0, %f56
	.word 0xb5508000  ! 612: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb5a5c9e0  ! 613: FDIVq	dis not found

	.word 0xb1508000  ! 614: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a408a0  ! 615: FSUBs	fsubs	%f16, %f0, %f19
	.word 0x8d97e000  ! 616: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819ea000  ! 617: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa550c000  ! 618: RDPR_TT	rdpr	%tt, %r18
	.word 0xb7a00560  ! 619: FSQRTq	fsqrt	
	.word 0xb7a789c0  ! 620: FDIVd	fdivd	%f30, %f0, %f58
	.word 0x81972000  ! 621: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa5500000  ! 622: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xab504000  ! 623: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 624: RDPR_TPC	<illegal instruction>
	.word 0x8797a000  ! 625: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8d956000  ! 626: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x85976000  ! 627: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3a709a0  ! 628: FDIVs	fdivs	%f28, %f0, %f25
	.word 0xb1504000  ! 629: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x85946000  ! 630: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb750c000  ! 631: RDPR_TT	rdpr	%tt, %r27
	.word 0x8d962000  ! 632: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x839f6000  ! 633: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8597a000  ! 634: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8d952000  ! 635: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb7504000  ! 636: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xad508000  ! 637: RDPR_TSTATE	<illegal instruction>
	.word 0x83956000  ! 638: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x81946000  ! 639: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8194a000  ! 640: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x87962000  ! 641: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8797a000  ! 642: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb7504000  ! 643: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8d976000  ! 644: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x85942000  ! 645: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb9500000  ! 646: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x819ea000  ! 647: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x819ca000  ! 648: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbda64940  ! 649: FMULd	fmuld	%f56, %f0, %f30
	.word 0x8195e000  ! 650: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb7508000  ! 651: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xa5a40920  ! 652: FMULs	fmuls	%f16, %f0, %f18
	.word 0xb5504000  ! 653: RDPR_TNPC	<illegal instruction>
	.word 0x81976000  ! 654: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb5a58920  ! 655: FMULs	fmuls	%f22, %f0, %f26
	.word 0x83962000  ! 656: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x839f2000  ! 657: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8397a000  ! 658: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xbba7c8a0  ! 659: FSUBs	fsubs	%f31, %f0, %f29
	.word 0xa9508000  ! 660: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xab50c000  ! 661: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 662: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb5508000  ! 663: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x839fa000  ! 664: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa3a54920  ! 665: FMULs	fmuls	%f21, %f0, %f17
	.word 0xbd50c000  ! 666: RDPR_TT	rdpr	%tt, %r30
	.word 0x819c2000  ! 667: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x85946000  ! 668: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb7504000  ! 669: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8195a000  ! 670: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9508000  ! 671: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xa3508000  ! 672: RDPR_TSTATE	<illegal instruction>
	.word 0x85952000  ! 673: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8797a000  ! 674: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb9500000  ! 675: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x8397a000  ! 676: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819f6000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x839e2000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0xbba58960  ! 679: FMULq	dis not found

	.word 0x8795e000  ! 680: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0x8d946000  ! 681: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa7504000  ! 682: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xab50c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0x8d95e000  ! 684: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8797a000  ! 685: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8d96a000  ! 686: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xbf504000  ! 687: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xa9a6c920  ! 688: FMULs	fmuls	%f27, %f0, %f20
	.word 0x819f2000  ! 689: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa9a4c8a0  ! 690: FSUBs	fsubs	%f19, %f0, %f20
	.word 0xad504000  ! 691: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xb3a788e0  ! 692: FSUBq	dis not found

	.word 0xa3508000  ! 693: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 694: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa3a7c8c0  ! 695: FSUBd	fsubd	%f62, %f0, %f48
	.word 0x8795e000  ! 696: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa1a00540  ! 697: FSQRTd	fsqrt	
	.word 0xb7a00540  ! 698: FSQRTd	fsqrt	
	.word 0xb150c000  ! 699: RDPR_TT	rdpr	%tt, %r24
	.word 0x8797e000  ! 700: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85962000  ! 701: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xab500000  ! 702: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x87942000  ! 703: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x819d2000  ! 704: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x87962000  ! 705: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa1504000  ! 706: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x8397e000  ! 707: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa350c000  ! 708: RDPR_TT	rdpr	%tt, %r17
	.word 0xa7504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xb9a489c0  ! 710: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xb5a68840  ! 711: FADDd	faddd	%f26, %f0, %f26
	.word 0xb550c000  ! 712: RDPR_TT	<illegal instruction>
	.word 0xb750c000  ! 713: RDPR_TT	<illegal instruction>
	.word 0xa550c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xbb508000  ! 716: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 717: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xbf50c000  ! 718: RDPR_TT	rdpr	%tt, %r31
	.word 0x8d956000  ! 719: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d95a000  ! 720: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb7504000  ! 721: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8394a000  ! 722: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x819ee000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x85942000  ! 724: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819c2000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8194e000  ! 726: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb150c000  ! 727: RDPR_TT	rdpr	%tt, %r24
	.word 0xa3508000  ! 728: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 729: RDPR_TPC	<illegal instruction>
	.word 0x819fa000  ! 730: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x83972000  ! 731: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa7a00540  ! 732: FSQRTd	fsqrt	
	.word 0xa750c000  ! 733: RDPR_TT	rdpr	%tt, %r19
	.word 0x81952000  ! 734: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xa5508000  ! 735: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8396e000  ! 736: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb3a448a0  ! 737: FSUBs	fsubs	%f17, %f0, %f25
	.word 0x8596a000  ! 738: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x85976000  ! 739: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819c2000  ! 740: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8d952000  ! 741: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xbda68840  ! 742: FADDd	faddd	%f26, %f0, %f30
	.word 0x839d6000  ! 743: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x839ea000  ! 744: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa9500000  ! 745: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xa5500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 747: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb3508000  ! 748: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb150c000  ! 749: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 750: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xb3508000  ! 751: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x8797e000  ! 752: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x819d2000  ! 753: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa9a589a0  ! 754: FDIVs	fdivs	%f22, %f0, %f20
	.word 0xa7a44860  ! 755: FADDq	dis not found

	.word 0xa7504000  ! 756: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x8797a000  ! 757: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xa550c000  ! 758: RDPR_TT	rdpr	%tt, %r18
	.word 0xbd50c000  ! 759: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0x85952000  ! 761: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8d96e000  ! 762: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8594e000  ! 763: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8d95e000  ! 764: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xbf504000  ! 765: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x839e6000  ! 766: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839d2000  ! 767: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xad500000  ! 768: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x819da000  ! 769: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d96a000  ! 770: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x83976000  ! 771: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb9508000  ! 772: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8d95a000  ! 773: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x839ee000  ! 774: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xafa78940  ! 775: FMULd	fmuld	%f30, %f0, %f54
	.word 0xb950c000  ! 776: RDPR_TT	rdpr	%tt, %r28
	.word 0x83942000  ! 777: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa1500000  ! 778: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xbd500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 780: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x85972000  ! 781: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x87942000  ! 782: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x83966000  ! 783: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xbba00540  ! 784: FSQRTd	fsqrt	
	.word 0x819ee000  ! 785: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x819ea000  ! 786: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xbb508000  ! 787: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xbb500000  ! 788: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 789: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbd500000  ! 791: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xa5500000  ! 792: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 793: RDPR_TPC	<illegal instruction>
	.word 0x85956000  ! 794: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8595a000  ! 795: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x839ce000  ! 796: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbb500000  ! 797: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xb7500000  ! 798: RDPR_TPC	<illegal instruction>
	.word 0x85966000  ! 799: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa3508000  ! 800: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x8195e000  ! 801: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x83952000  ! 802: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xad50c000  ! 803: RDPR_TT	rdpr	%tt, %r22
	.word 0xbd508000  ! 804: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a6c9c0  ! 805: FDIVd	fdivd	%f58, %f0, %f48
	.word 0xa9a54840  ! 806: FADDd	faddd	%f52, %f0, %f20
	.word 0xa7508000  ! 807: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 808: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8595a000  ! 809: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0xb7a689c0  ! 810: FDIVd	fdivd	%f26, %f0, %f58
	.word 0xb7504000  ! 811: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb5504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xb7a00540  ! 813: FSQRTd	fsqrt	
	.word 0x8d95e000  ! 814: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xb7a448e0  ! 815: FSUBq	dis not found

	.word 0x85966000  ! 816: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x85952000  ! 817: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb150c000  ! 818: RDPR_TT	rdpr	%tt, %r24
	.word 0xa7a6c9a0  ! 819: FDIVs	fdivs	%f27, %f0, %f19
	.word 0xaba6c960  ! 820: FMULq	dis not found

	.word 0xaba58820  ! 821: FADDs	fadds	%f22, %f0, %f21
	.word 0xb3a00560  ! 822: FSQRTq	fsqrt	
	.word 0xa5504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0x8596a000  ! 824: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8394e000  ! 825: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa1500000  ! 826: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x819de000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xb5a588a0  ! 828: FSUBs	fsubs	%f22, %f0, %f26
	.word 0xbf504000  ! 829: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x819c6000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8195e000  ! 831: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xb950c000  ! 832: RDPR_TT	rdpr	%tt, %r28
	.word 0xa1508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 834: RDPR_TT	<illegal instruction>
	.word 0x87976000  ! 835: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x87956000  ! 836: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d95a000  ! 837: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8195a000  ! 838: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb3504000  ! 839: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x819ce000  ! 840: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8d976000  ! 841: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa1a509e0  ! 842: FDIVq	dis not found

	.word 0x839fe000  ! 843: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x8594a000  ! 844: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xab504000  ! 845: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x819ca000  ! 846: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbd500000  ! 847: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x81962000  ! 848: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb9508000  ! 849: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8397a000  ! 850: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xad508000  ! 851: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x8597a000  ! 852: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb150c000  ! 853: RDPR_TT	rdpr	%tt, %r24
	.word 0x819fa000  ! 854: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb750c000  ! 855: RDPR_TT	rdpr	%tt, %r27
	.word 0x819d6000  ! 856: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb550c000  ! 857: RDPR_TT	rdpr	%tt, %r26
	.word 0xb1500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 859: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8196a000  ! 860: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xa3a00560  ! 861: FSQRTq	fsqrt	
	.word 0x8d94a000  ! 862: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819f2000  ! 863: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb5500000  ! 864: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x87972000  ! 865: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x819fa000  ! 866: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa1504000  ! 867: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xbda5c9c0  ! 868: FDIVd	fdivd	%f54, %f0, %f30
	.word 0x839da000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb9504000  ! 870: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0x8797a000  ! 871: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb1508000  ! 872: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xafa7c9e0  ! 873: FDIVq	dis not found

	.word 0xaf50c000  ! 874: RDPR_TT	<illegal instruction>
	.word 0x85962000  ! 875: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa9504000  ! 876: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xbd50c000  ! 877: RDPR_TT	<illegal instruction>
	.word 0x8d95a000  ! 878: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x83966000  ! 879: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa9504000  ! 880: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x8796e000  ! 881: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbd508000  ! 882: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xa5a589e0  ! 883: FDIVq	dis not found

	.word 0xbf504000  ! 884: RDPR_TNPC	<illegal instruction>
	.word 0x8d952000  ! 885: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x839f2000  ! 886: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa950c000  ! 887: RDPR_TT	rdpr	%tt, %r20
	.word 0xa7500000  ! 888: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 889: RDPR_TSTATE	<illegal instruction>
	.word 0x839c6000  ! 890: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x839c2000  ! 891: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x819c6000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa7504000  ! 893: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xa750c000  ! 894: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xb3a50860  ! 896: FADDq	dis not found

	.word 0xab504000  ! 897: RDPR_TNPC	<illegal instruction>
	.word 0x839ce000  ! 898: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d95a000  ! 899: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xbf504000  ! 900: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0x81956000  ! 901: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8d97e000  ! 902: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819ea000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa7500000  ! 904: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xb5a78960  ! 905: FMULq	dis not found

	.word 0x8394e000  ! 906: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x87946000  ! 907: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xab504000  ! 908: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0x8794e000  ! 909: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xb1500000  ! 910: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xbf500000  ! 911: RDPR_TPC	<illegal instruction>
	.word 0xa5508000  ! 912: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a789e0  ! 913: FDIVq	dis not found

	.word 0xbfa70840  ! 914: FADDd	faddd	%f28, %f0, %f62
	.word 0x839f2000  ! 915: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x839f2000  ! 916: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819f2000  ! 917: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8395e000  ! 918: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8d972000  ! 919: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xab504000  ! 920: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xa1504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xbf500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0x839f6000  ! 923: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xa3508000  ! 924: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xa5a5c860  ! 925: FADDq	dis not found

	.word 0xa9a488e0  ! 926: FSUBq	dis not found

	.word 0x85942000  ! 927: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8d94a000  ! 928: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xb350c000  ! 929: RDPR_TT	rdpr	%tt, %r25
	.word 0x83976000  ! 930: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819d2000  ! 931: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa3504000  ! 932: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xb7500000  ! 933: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 934: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8194e000  ! 935: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5500000  ! 936: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x81962000  ! 937: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xab508000  ! 938: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8397a000  ! 939: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819c2000  ! 940: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xaf504000  ! 941: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xb9508000  ! 942: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 943: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8595e000  ! 944: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x819e6000  ! 945: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa7504000  ! 946: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xa5a6c8e0  ! 947: FSUBq	dis not found

	.word 0xbd500000  ! 948: RDPR_TPC	<illegal instruction>
	.word 0xa5a44940  ! 949: FMULd	fmuld	%f48, %f0, %f18
	.word 0xa9508000  ! 950: RDPR_TSTATE	<illegal instruction>
	.word 0xb9508000  ! 951: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 953: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x83976000  ! 954: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb3500000  ! 955: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xb7a58940  ! 956: FMULd	fmuld	%f22, %f0, %f58
	.word 0x839f6000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8796e000  ! 958: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xa3508000  ! 959: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xad508000  ! 960: RDPR_TSTATE	<illegal instruction>
	.word 0x8796e000  ! 961: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xad50c000  ! 962: RDPR_TT	rdpr	%tt, %r22
	.word 0xa9a00520  ! 963: FSQRTs	fsqrt	
	.word 0xbba60960  ! 964: FMULq	dis not found

	.word 0x83942000  ! 965: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb950c000  ! 966: RDPR_TT	rdpr	%tt, %r28
	.word 0xb3500000  ! 967: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 968: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d942000  ! 969: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8d956000  ! 970: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xaf508000  ! 971: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x819ca000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa7508000  ! 973: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xbba78940  ! 974: FMULd	fmuld	%f30, %f0, %f60
	.word 0xa5504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0xb1a408c0  ! 976: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xab504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 978: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xa3508000  ! 980: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 981: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xaba648a0  ! 982: FSUBs	fsubs	%f25, %f0, %f21
	.word 0xaf50c000  ! 983: RDPR_TT	rdpr	%tt, %r23
	.word 0x8d95a000  ! 984: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819e2000  ! 985: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x83962000  ! 986: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xbd500000  ! 987: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x8794a000  ! 988: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x81946000  ! 989: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8d94a000  ! 990: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xaf504000  ! 991: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xb950c000  ! 992: RDPR_TT	<illegal instruction>
	.word 0xb7500000  ! 993: RDPR_TPC	<illegal instruction>
	.word 0x85976000  ! 994: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xab50c000  ! 995: RDPR_TT	rdpr	%tt, %r21
	.word 0x839e6000  ! 996: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x83966000  ! 997: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb750c000  ! 998: RDPR_TT	rdpr	%tt, %r27
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	ta	T_CHANGE_PRIV
	wrpr	%g0, 1, %tl
	wrpr	%l0, %g0, %tpc
	wrpr	%l0, %g0, %tnpc
	wrpr	%l0, %g0, %tstate
	wrpr	%l0, %g0, %tt
	.word 0xa3504000  ! 1: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8d962000  ! 2: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb9a408e0  ! 3: FSUBq	dis not found

	.word 0xa5500000  ! 4: RDPR_TPC	<illegal instruction>
	.word 0x8394a000  ! 5: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb3a688a0  ! 6: FSUBs	fsubs	%f26, %f0, %f25
	.word 0x81956000  ! 7: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xa5a689c0  ! 8: FDIVd	fdivd	%f26, %f0, %f18
	.word 0x8796a000  ! 9: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8196e000  ! 10: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0x83962000  ! 11: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xb5508000  ! 12: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a60840  ! 13: FADDd	faddd	%f24, %f0, %f50
	.word 0xa7508000  ! 14: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 15: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 16: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 17: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xada00520  ! 18: FSQRTs	fsqrt	
	.word 0x81956000  ! 19: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xbb508000  ! 20: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 21: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 22: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 23: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xbf508000  ! 24: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 25: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 26: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8597e000  ! 27: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x85956000  ! 28: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xbf508000  ! 29: RDPR_TSTATE	<illegal instruction>
	.word 0xada00540  ! 30: FSQRTd	fsqrt	
	.word 0x8396e000  ! 31: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x85942000  ! 32: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb1a508e0  ! 33: FSUBq	dis not found

	.word 0xa7508000  ! 34: RDPR_TSTATE	<illegal instruction>
	.word 0x8d942000  ! 35: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8d97e000  ! 36: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xaf508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 38: RDPR_TT	<illegal instruction>
	.word 0x87962000  ! 39: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8796e000  ! 40: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x85976000  ! 41: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x819da000  ! 42: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d962000  ! 43: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8d94e000  ! 44: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x85976000  ! 45: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8396e000  ! 46: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0xb5508000  ! 47: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a408e0  ! 48: FSUBq	dis not found

	.word 0xbf50c000  ! 49: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 50: RDPR_TT	<illegal instruction>
	.word 0xbd50c000  ! 51: RDPR_TT	<illegal instruction>
	.word 0xbda00560  ! 52: FSQRTq	fsqrt	
	.word 0x819fe000  ! 53: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x83972000  ! 54: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8197e000  ! 55: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xb3508000  ! 56: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x81966000  ! 57: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb5a588e0  ! 58: FSUBq	dis not found

	.word 0xb3a709a0  ! 59: FDIVs	fdivs	%f28, %f0, %f25
	.word 0xbf500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 61: RDPR_TPC	<illegal instruction>
	.word 0x839d2000  ! 62: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x83962000  ! 63: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819e6000  ! 64: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa9508000  ! 65: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 66: RDPR_TT	<illegal instruction>
	.word 0xad508000  ! 67: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 68: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 69: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x81962000  ! 70: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xaf500000  ! 71: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 72: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa1a00540  ! 73: FSQRTd	fsqrt	
	.word 0x83942000  ! 74: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8594e000  ! 75: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x819ca000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8397e000  ! 77: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819de000  ! 78: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x87966000  ! 79: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8d942000  ! 80: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8d956000  ! 81: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d976000  ! 82: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x81976000  ! 83: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa550c000  ! 84: RDPR_TT	rdpr	%tt, %r18
	.word 0x8194a000  ! 85: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d96e000  ! 86: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb5508000  ! 87: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 89: RDPR_TPC	<illegal instruction>
	.word 0x87956000  ! 90: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xbd504000  ! 91: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbda5c8a0  ! 92: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xb3504000  ! 93: RDPR_TNPC	<illegal instruction>
	.word 0xaf504000  ! 94: RDPR_TNPC	<illegal instruction>
	.word 0x8d96e000  ! 95: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xa7508000  ! 96: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xada6c8a0  ! 97: FSUBs	fsubs	%f27, %f0, %f22
	.word 0xa9504000  ! 98: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 99: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 100: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x83962000  ! 101: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xab508000  ! 102: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e000  ! 103: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x839fe000  ! 104: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0x819d6000  ! 105: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa3a50920  ! 106: FMULs	fmuls	%f20, %f0, %f17
	.word 0x839fa000  ! 107: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8d972000  ! 108: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbd508000  ! 109: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 110: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x85942000  ! 111: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xaf50c000  ! 112: RDPR_TT	<illegal instruction>
	.word 0x8d97a000  ! 113: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xaba54860  ! 114: FADDq	dis not found

	.word 0x8d96e000  ! 115: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xbd500000  ! 116: RDPR_TPC	rdpr	%tpc, %r30
	.word 0x819c6000  ! 117: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb150c000  ! 118: RDPR_TT	<illegal instruction>
	.word 0xb9a788e0  ! 119: FSUBq	dis not found

	.word 0xbf500000  ! 120: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 121: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb5508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x819fe000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8194e000  ! 125: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5500000  ! 126: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 127: RDPR_TNPC	<illegal instruction>
	.word 0x819d2000  ! 128: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xad504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 130: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x87952000  ! 131: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x839de000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819da000  ! 133: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xbfa748e0  ! 134: FSUBq	dis not found

	.word 0xa1a00540  ! 135: FSQRTd	fsqrt	
	.word 0x8796a000  ! 136: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d97e000  ! 137: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x87952000  ! 138: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x819da000  ! 139: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb9504000  ! 140: RDPR_TNPC	<illegal instruction>
	.word 0x8d97e000  ! 141: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819f2000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x8d946000  ! 143: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819fe000  ! 144: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819e2000  ! 145: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x81956000  ! 146: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb7500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0xb7a00520  ! 148: FSQRTs	fsqrt	
	.word 0x8d942000  ! 149: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xb5504000  ! 150: RDPR_TNPC	<illegal instruction>
	.word 0x8d966000  ! 151: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819ca000  ! 152: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8797a000  ! 153: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8397a000  ! 154: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xafa00540  ! 155: FSQRTd	fsqrt	
	.word 0x819da000  ! 156: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x819da000  ! 157: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8d972000  ! 158: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbb508000  ! 159: RDPR_TSTATE	<illegal instruction>
	.word 0x8d956000  ! 160: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8595e000  ! 161: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d97a000  ! 162: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x83942000  ! 163: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8196e000  ! 164: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xab500000  ! 165: RDPR_TPC	<illegal instruction>
	.word 0x839d6000  ! 166: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x839c6000  ! 167: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xa5504000  ! 168: RDPR_TNPC	<illegal instruction>
	.word 0xb5508000  ! 169: RDPR_TSTATE	<illegal instruction>
	.word 0xbb508000  ! 170: RDPR_TSTATE	<illegal instruction>
	.word 0xb9504000  ! 171: RDPR_TNPC	<illegal instruction>
	.word 0xa9a48840  ! 172: FADDd	faddd	%f18, %f0, %f20
	.word 0x819d6000  ! 173: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839ca000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xa3504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 176: RDPR_TSTATE	<illegal instruction>
	.word 0x8797a000  ! 177: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb9504000  ! 178: RDPR_TNPC	<illegal instruction>
	.word 0x8d97a000  ! 179: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x87966000  ! 180: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xa9500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xab50c000  ! 182: RDPR_TT	<illegal instruction>
	.word 0xbd508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0x819e6000  ! 184: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbda589a0  ! 185: FDIVs	fdivs	%f22, %f0, %f30
	.word 0x8d956000  ! 186: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x839d6000  ! 187: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xa5a00520  ! 188: FSQRTs	fsqrt	
	.word 0x87966000  ! 189: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x83956000  ! 190: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x839d2000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xb3500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 193: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 194: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87966000  ! 195: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x8594a000  ! 196: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb9a00520  ! 197: FSQRTs	fsqrt	
	.word 0xa3508000  ! 198: RDPR_TSTATE	<illegal instruction>
	.word 0x8d956000  ! 199: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x81966000  ! 200: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb5a7c8a0  ! 201: FSUBs	fsubs	%f31, %f0, %f26
	.word 0xb5500000  ! 202: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 203: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x839c2000  ! 204: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb150c000  ! 205: RDPR_TT	<illegal instruction>
	.word 0x819c2000  ! 206: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa3508000  ! 207: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e000  ! 208: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d972000  ! 209: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa550c000  ! 210: RDPR_TT	rdpr	%tt, %r18
	.word 0xbf504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 212: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x85972000  ! 213: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xbd508000  ! 214: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x8397e000  ! 215: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x85946000  ! 216: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xbb500000  ! 217: RDPR_TPC	<illegal instruction>
	.word 0x8396a000  ! 218: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xbfa7c8c0  ! 219: FSUBd	fsubd	%f62, %f0, %f62
	.word 0x839de000  ! 220: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x839ca000  ! 221: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x81976000  ! 222: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb550c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0xb9a709c0  ! 224: FDIVd	fdivd	%f28, %f0, %f28
	.word 0x839c6000  ! 225: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xbd504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xa3a4c9e0  ! 227: FDIVq	dis not found

	.word 0x819ce000  ! 228: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8195a000  ! 229: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x8797a000  ! 230: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8195e000  ! 231: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa7a60960  ! 232: FMULq	dis not found

	.word 0xb9a64940  ! 233: FMULd	fmuld	%f56, %f0, %f28
	.word 0xb950c000  ! 234: RDPR_TT	<illegal instruction>
	.word 0x819ea000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb7500000  ! 236: RDPR_TPC	<illegal instruction>
	.word 0x8d95a000  ! 237: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x87976000  ! 238: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xb550c000  ! 239: RDPR_TT	rdpr	%tt, %r26
	.word 0x839e6000  ! 240: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x839da000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819de000  ! 242: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xa7a5c9c0  ! 243: FDIVd	fdivd	%f54, %f0, %f50
	.word 0xa7a409a0  ! 244: FDIVs	fdivs	%f16, %f0, %f19
	.word 0x839da000  ! 245: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819e2000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x819fe000  ! 247: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x81946000  ! 248: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xb3a58860  ! 249: FADDq	dis not found

	.word 0x83952000  ! 250: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa9500000  ! 251: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 252: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb750c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xa350c000  ! 254: RDPR_TT	<illegal instruction>
	.word 0x819c6000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8d966000  ! 256: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb7a588e0  ! 257: FSUBq	dis not found

	.word 0x81962000  ! 258: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb7a748c0  ! 259: FSUBd	fsubd	%f60, %f0, %f58
	.word 0xa9a70860  ! 260: FADDq	dis not found

	.word 0x83946000  ! 261: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xb1500000  ! 262: RDPR_TPC	<illegal instruction>
	.word 0x8597a000  ! 263: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839e2000  ! 264: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d96e000  ! 265: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8d956000  ! 266: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d976000  ! 267: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x81976000  ! 268: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xab500000  ! 269: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x8594e000  ! 270: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8196e000  ! 271: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb9508000  ! 272: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 273: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8197a000  ! 274: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0x819ea000  ! 275: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb5a00540  ! 276: FSQRTd	fsqrt	
	.word 0xb9500000  ! 277: RDPR_TPC	<illegal instruction>
	.word 0x8394e000  ! 278: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa3508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 280: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 281: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xa7a709c0  ! 282: FDIVd	fdivd	%f28, %f0, %f50
	.word 0x8597a000  ! 283: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xab504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0x83972000  ! 285: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbb508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xafa509a0  ! 287: FDIVs	fdivs	%f20, %f0, %f23
	.word 0x8795a000  ! 288: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xa5500000  ! 289: RDPR_TPC	<illegal instruction>
	.word 0xb9a408e0  ! 290: FSUBq	dis not found

	.word 0x85952000  ! 291: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839c6000  ! 292: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0xad50c000  ! 293: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 294: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96a000  ! 295: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x819f2000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xbf504000  ! 297: RDPR_TNPC	<illegal instruction>
	.word 0xbb508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0x8d962000  ! 299: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xbba708a0  ! 300: FSUBs	fsubs	%f28, %f0, %f29
	.word 0xa7500000  ! 301: RDPR_TPC	<illegal instruction>
	.word 0x8d966000  ! 302: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819ee000  ! 303: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xaf50c000  ! 304: RDPR_TT	<illegal instruction>
	.word 0x8d97a000  ! 305: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa3504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0x8d972000  ! 307: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x839de000  ! 308: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x8396e000  ! 309: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x8394e000  ! 310: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb9500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0x8597e000  ! 312: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8d97e000  ! 313: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x819da000  ! 314: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb5a68960  ! 315: FMULq	dis not found

	.word 0x839ee000  ! 316: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa150c000  ! 317: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 318: RDPR_TPC	<illegal instruction>
	.word 0x85976000  ! 319: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbf500000  ! 320: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 321: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x81976000  ! 322: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819da000  ! 323: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x81972000  ! 324: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x819de000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbb504000  ! 326: RDPR_TNPC	<illegal instruction>
	.word 0xb3508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a449a0  ! 328: FDIVs	fdivs	%f17, %f0, %f16
	.word 0xb5a408a0  ! 329: FSUBs	fsubs	%f16, %f0, %f26
	.word 0x81946000  ! 330: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa9a64940  ! 331: FMULd	fmuld	%f56, %f0, %f20
	.word 0x8d94a000  ! 332: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8d94a000  ! 333: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xad508000  ! 334: RDPR_TSTATE	<illegal instruction>
	.word 0xbba608a0  ! 335: FSUBs	fsubs	%f24, %f0, %f29
	.word 0x839e2000  ! 336: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839ee000  ! 337: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xa1508000  ! 338: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xbb50c000  ! 340: RDPR_TT	<illegal instruction>
	.word 0xa9504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xa9500000  ! 343: RDPR_TPC	<illegal instruction>
	.word 0xbfa60920  ! 344: FMULs	fmuls	%f24, %f0, %f31
	.word 0x83956000  ! 345: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xa1504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 347: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb7500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 349: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x81962000  ! 350: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8196e000  ! 351: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbba5c8e0  ! 352: FSUBq	dis not found

	.word 0x8194a000  ! 353: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819e6000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xaf508000  ! 355: RDPR_TSTATE	<illegal instruction>
	.word 0xbba4c820  ! 356: FADDs	fadds	%f19, %f0, %f29
	.word 0xa9a58960  ! 357: FMULq	dis not found

	.word 0x8596e000  ! 358: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0xbf500000  ! 359: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xaf500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0x8795e000  ! 361: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xa9a50940  ! 362: FMULd	fmuld	%f20, %f0, %f20
	.word 0xbba48940  ! 363: FMULd	fmuld	%f18, %f0, %f60
	.word 0xb3a48920  ! 364: FMULs	fmuls	%f18, %f0, %f25
	.word 0x8d94a000  ! 365: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8594e000  ! 366: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb1a00560  ! 367: FSQRTq	fsqrt	
	.word 0x87962000  ! 368: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8794a000  ! 369: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8794e000  ! 370: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa750c000  ! 371: RDPR_TT	<illegal instruction>
	.word 0xafa00540  ! 372: FSQRTd	fsqrt	
	.word 0x81972000  ! 373: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xaf50c000  ! 374: RDPR_TT	<illegal instruction>
	.word 0xafa708a0  ! 375: FSUBs	fsubs	%f28, %f0, %f23
	.word 0x819ca000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d97a000  ! 377: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xab500000  ! 378: RDPR_TPC	<illegal instruction>
	.word 0xa1a44860  ! 379: FADDq	dis not found

	.word 0xb3a7c920  ! 380: FMULs	fmuls	%f31, %f0, %f25
	.word 0xafa64920  ! 381: FMULs	fmuls	%f25, %f0, %f23
	.word 0x8797a000  ! 382: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xb9a58940  ! 383: FMULd	fmuld	%f22, %f0, %f28
	.word 0xa3a64940  ! 384: FMULd	fmuld	%f56, %f0, %f48
	.word 0x819de000  ! 385: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x839f2000  ! 386: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xaf504000  ! 387: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0x819ee000  ! 389: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0x8d976000  ! 390: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x83956000  ! 391: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb3508000  ! 392: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 393: RDPR_TPC	<illegal instruction>
	.word 0xa9504000  ! 394: RDPR_TNPC	<illegal instruction>
	.word 0xab50c000  ! 395: RDPR_TT	<illegal instruction>
	.word 0xa9500000  ! 396: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 397: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbfa00560  ! 398: FSQRTq	fsqrt	
	.word 0x819ee000  ! 399: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb1a68820  ! 400: FADDs	fadds	%f26, %f0, %f24
	.word 0x8194a000  ! 401: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x83942000  ! 402: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8197e000  ! 403: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x819e2000  ! 404: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xa150c000  ! 405: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 406: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81972000  ! 407: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0x8395e000  ! 408: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x81962000  ! 409: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x839d2000  ! 410: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x819d6000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x81942000  ! 412: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x8794e000  ! 413: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0x85966000  ! 414: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x839da000  ! 415: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x85956000  ! 416: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8594a000  ! 417: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb5a68940  ! 418: FMULd	fmuld	%f26, %f0, %f26
	.word 0x8596a000  ! 419: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x819c2000  ! 420: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x8596a000  ! 421: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x839d6000  ! 422: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8d966000  ! 423: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819d6000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xb3a40940  ! 425: FMULd	fmuld	%f16, %f0, %f56
	.word 0xb3a78960  ! 426: FMULq	dis not found

	.word 0xa550c000  ! 427: RDPR_TT	<illegal instruction>
	.word 0x83972000  ! 428: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x839ce000  ! 429: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8d952000  ! 430: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x87972000  ! 431: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8796a000  ! 432: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x85962000  ! 433: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa1500000  ! 434: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xbd500000  ! 435: RDPR_TPC	<illegal instruction>
	.word 0xb1504000  ! 436: RDPR_TNPC	<illegal instruction>
	.word 0xada58820  ! 437: FADDs	fadds	%f22, %f0, %f22
	.word 0xa5a749e0  ! 438: FDIVq	dis not found

	.word 0xa3504000  ! 439: RDPR_TNPC	<illegal instruction>
	.word 0x8196a000  ! 440: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb5500000  ! 441: RDPR_TPC	<illegal instruction>
	.word 0x839de000  ! 442: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x85976000  ! 443: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3508000  ! 444: RDPR_TSTATE	<illegal instruction>
	.word 0x85962000  ! 445: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x83962000  ! 446: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0x819f6000  ! 447: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x839e2000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x81942000  ! 449: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x85952000  ! 450: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xb7500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xa950c000  ! 452: RDPR_TT	<illegal instruction>
	.word 0x8394a000  ! 453: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x839f6000  ! 454: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb9500000  ! 455: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 456: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 457: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0xab504000  ! 458: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 459: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d956000  ! 460: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8d96a000  ! 461: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb9a40840  ! 462: FADDd	faddd	%f16, %f0, %f28
	.word 0xb1500000  ! 463: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x87976000  ! 464: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xa750c000  ! 465: RDPR_TT	<illegal instruction>
	.word 0xa7a74840  ! 466: FADDd	faddd	%f60, %f0, %f50
	.word 0xa550c000  ! 467: RDPR_TT	<illegal instruction>
	.word 0x839d6000  ! 468: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xafa00540  ! 469: FSQRTd	fsqrt	
	.word 0xa7a4c960  ! 470: FMULq	dis not found

	.word 0xa1508000  ! 471: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xb350c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 473: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xa7a449e0  ! 474: FDIVq	dis not found

	.word 0xb7a00520  ! 475: FSQRTs	fsqrt	
	.word 0x8395e000  ! 476: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8594a000  ! 477: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xa9504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0x81946000  ! 479: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0xa7504000  ! 480: RDPR_TNPC	<illegal instruction>
	.word 0x85972000  ! 481: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8394a000  ! 482: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xa3504000  ! 483: RDPR_TNPC	<illegal instruction>
	.word 0xbd500000  ! 484: RDPR_TPC	<illegal instruction>
	.word 0x839c2000  ! 485: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x819fa000  ! 486: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa3a6c860  ! 487: FADDq	dis not found

	.word 0xa7504000  ! 488: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 489: RDPR_TSTATE	<illegal instruction>
	.word 0x85966000  ! 490: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xb9504000  ! 491: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xbba6c9a0  ! 492: FDIVs	fdivs	%f27, %f0, %f29
	.word 0x819d2000  ! 493: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb9508000  ! 494: RDPR_TSTATE	<illegal instruction>
	.word 0xb9500000  ! 495: RDPR_TPC	<illegal instruction>
	.word 0xa1508000  ! 496: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 497: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 498: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8594e000  ! 499: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x85966000  ! 500: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0x8d96e000  ! 501: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x85972000  ! 502: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb9a609c0  ! 503: FDIVd	fdivd	%f24, %f0, %f28
	.word 0x819ce000  ! 504: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xa7a508a0  ! 505: FSUBs	fsubs	%f20, %f0, %f19
	.word 0xb5508000  ! 506: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a00540  ! 507: FSQRTd	fsqrt	
	.word 0xada00520  ! 508: FSQRTs	fsqrt	
	.word 0xafa00520  ! 509: FSQRTs	fsqrt	
	.word 0xa7a78940  ! 510: FMULd	fmuld	%f30, %f0, %f50
	.word 0x8597e000  ! 511: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x85972000  ! 512: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8394e000  ! 513: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x83946000  ! 514: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x8797a000  ! 515: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0xaf504000  ! 516: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 517: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x819f6000  ! 518: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xaf504000  ! 519: RDPR_TNPC	<illegal instruction>
	.word 0x83942000  ! 520: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d95a000  ! 521: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x83966000  ! 522: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x8d946000  ! 523: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb9508000  ! 524: RDPR_TSTATE	<illegal instruction>
	.word 0x839d2000  ! 525: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x8d94a000  ! 526: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819da000  ! 527: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x819c6000  ! 528: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x87966000  ! 529: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb950c000  ! 530: RDPR_TT	<illegal instruction>
	.word 0x839da000  ! 531: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb9508000  ! 532: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 533: RDPR_TT	<illegal instruction>
	.word 0x8594e000  ! 534: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x839ee000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x839ce000  ! 536: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x839f2000  ! 537: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa9a688c0  ! 538: FSUBd	fsubd	%f26, %f0, %f20
	.word 0x839fa000  ! 539: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xa9504000  ! 540: RDPR_TNPC	<illegal instruction>
	.word 0xa350c000  ! 541: RDPR_TT	<illegal instruction>
	.word 0xbda4c860  ! 542: FADDq	dis not found

	.word 0xbd500000  ! 543: RDPR_TPC	<illegal instruction>
	.word 0x8d94e000  ! 544: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8596a000  ! 545: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xb9500000  ! 546: RDPR_TPC	<illegal instruction>
	.word 0x839f2000  ! 547: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x819ce000  ! 548: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8196e000  ! 549: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xa5504000  ! 550: RDPR_TNPC	<illegal instruction>
	.word 0xbf50c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 552: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb3508000  ! 553: RDPR_TSTATE	<illegal instruction>
	.word 0xbba48860  ! 554: FADDq	dis not found

	.word 0x8d95a000  ! 555: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8d94a000  ! 556: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x85942000  ! 557: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb5500000  ! 558: RDPR_TPC	<illegal instruction>
	.word 0x819e2000  ! 559: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x839c2000  ! 560: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb3a589a0  ! 561: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xa7500000  ! 562: RDPR_TPC	<illegal instruction>
	.word 0xb7a708a0  ! 563: FSUBs	fsubs	%f28, %f0, %f27
	.word 0xbf508000  ! 564: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 565: RDPR_TNPC	<illegal instruction>
	.word 0xa5504000  ! 566: RDPR_TNPC	<illegal instruction>
	.word 0x8395a000  ! 567: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb7a00520  ! 568: FSQRTs	fsqrt	
	.word 0xbf50c000  ! 569: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 570: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 571: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb5500000  ! 572: RDPR_TPC	<illegal instruction>
	.word 0xa3a00560  ! 573: FSQRTq	fsqrt	
	.word 0xbf500000  ! 574: RDPR_TPC	<illegal instruction>
	.word 0x83966000  ! 575: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa3504000  ! 576: RDPR_TNPC	<illegal instruction>
	.word 0xb3a509c0  ! 577: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb550c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xbba44840  ! 579: FADDd	faddd	%f48, %f0, %f60
	.word 0xa9500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0x87946000  ! 581: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xb1508000  ! 582: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 583: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x8197a000  ! 584: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xafa549a0  ! 585: FDIVs	fdivs	%f21, %f0, %f23
	.word 0x8d94a000  ! 586: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819c6000  ! 587: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8197e000  ! 588: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x87976000  ! 589: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8d96a000  ! 590: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xad508000  ! 591: RDPR_TSTATE	<illegal instruction>
	.word 0xa7a788c0  ! 592: FSUBd	fsubd	%f30, %f0, %f50
	.word 0x81956000  ! 593: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x8394e000  ! 594: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x87976000  ! 595: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0xbd508000  ! 596: RDPR_TSTATE	<illegal instruction>
	.word 0x8d976000  ! 597: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xb1a708e0  ! 598: FSUBq	dis not found

	.word 0x839f2000  ! 599: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8796a000  ! 600: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xa3500000  ! 601: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x81962000  ! 602: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb9504000  ! 603: RDPR_TNPC	<illegal instruction>
	.word 0xa9500000  ! 604: RDPR_TPC	<illegal instruction>
	.word 0xbd50c000  ! 605: RDPR_TT	<illegal instruction>
	.word 0xa7a68840  ! 606: FADDd	faddd	%f26, %f0, %f50
	.word 0xb350c000  ! 607: RDPR_TT	<illegal instruction>
	.word 0xa3a00540  ! 608: FSQRTd	fsqrt	
	.word 0x8395e000  ! 609: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8d972000  ! 610: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xbda64840  ! 611: FADDd	faddd	%f56, %f0, %f30
	.word 0xbb508000  ! 612: RDPR_TSTATE	<illegal instruction>
	.word 0xaba509e0  ! 613: FDIVq	dis not found

	.word 0xbf508000  ! 614: RDPR_TSTATE	<illegal instruction>
	.word 0xa1a6c8a0  ! 615: FSUBs	fsubs	%f27, %f0, %f16
	.word 0x8d94a000  ! 616: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819ca000  ! 617: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xb750c000  ! 618: RDPR_TT	<illegal instruction>
	.word 0xb7a00560  ! 619: FSQRTq	fsqrt	
	.word 0xb9a5c9c0  ! 620: FDIVd	fdivd	%f54, %f0, %f28
	.word 0x8195e000  ! 621: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xbd500000  ! 622: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 623: RDPR_TNPC	<illegal instruction>
	.word 0xb9500000  ! 624: RDPR_TPC	<illegal instruction>
	.word 0x87972000  ! 625: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8d966000  ! 626: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8597a000  ! 627: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xb5a449a0  ! 628: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xaf504000  ! 629: RDPR_TNPC	<illegal instruction>
	.word 0x8594a000  ! 630: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb750c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0x8d952000  ! 632: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x839e6000  ! 633: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x85976000  ! 634: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8d966000  ! 635: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb9504000  ! 636: RDPR_TNPC	<illegal instruction>
	.word 0xb1508000  ! 637: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 638: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81952000  ! 639: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x81962000  ! 640: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8796e000  ! 641: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x87942000  ! 642: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xb5504000  ! 643: RDPR_TNPC	<illegal instruction>
	.word 0x8d96a000  ! 644: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x85966000  ! 645: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbf500000  ! 646: RDPR_TPC	<illegal instruction>
	.word 0x819d2000  ! 647: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x819da000  ! 648: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb7a60940  ! 649: FMULd	fmuld	%f24, %f0, %f58
	.word 0x81966000  ! 650: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xb7508000  ! 651: RDPR_TSTATE	<illegal instruction>
	.word 0xbda54920  ! 652: FMULs	fmuls	%f21, %f0, %f30
	.word 0xaf504000  ! 653: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 654: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xa3a4c920  ! 655: FMULs	fmuls	%f19, %f0, %f17
	.word 0x83966000  ! 656: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x839fa000  ! 657: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x83966000  ! 658: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xa5a588a0  ! 659: FSUBs	fsubs	%f22, %f0, %f18
	.word 0xb1508000  ! 660: RDPR_TSTATE	<illegal instruction>
	.word 0xb550c000  ! 661: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 662: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xb7508000  ! 663: RDPR_TSTATE	<illegal instruction>
	.word 0x839fe000  ! 664: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xafa48920  ! 665: FMULs	fmuls	%f18, %f0, %f23
	.word 0xb950c000  ! 666: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 667: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x85976000  ! 668: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb9504000  ! 669: RDPR_TNPC	<illegal instruction>
	.word 0x8194e000  ! 670: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xb3508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0xa9508000  ! 672: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 673: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x8794e000  ! 674: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa9500000  ! 675: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 676: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x819d6000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839f6000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb1a4c960  ! 679: FMULq	dis not found

	.word 0x8797e000  ! 680: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d97e000  ! 681: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xb3504000  ! 682: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0x8d94a000  ! 684: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8796a000  ! 685: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d97e000  ! 686: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xbf504000  ! 687: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xada64920  ! 688: FMULs	fmuls	%f25, %f0, %f22
	.word 0x819fe000  ! 689: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9a688a0  ! 690: FSUBs	fsubs	%f26, %f0, %f20
	.word 0xa9504000  ! 691: RDPR_TNPC	<illegal instruction>
	.word 0xada508e0  ! 692: FSUBq	dis not found

	.word 0xb3508000  ! 693: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 694: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb3a408c0  ! 695: FSUBd	fsubd	%f16, %f0, %f56
	.word 0x87966000  ! 696: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xbba00540  ! 697: FSQRTd	fsqrt	
	.word 0xbba00540  ! 698: FSQRTd	fsqrt	
	.word 0xb350c000  ! 699: RDPR_TT	<illegal instruction>
	.word 0x87966000  ! 700: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0x85952000  ! 701: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbb500000  ! 702: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 703: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x819d6000  ! 704: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8797e000  ! 705: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb1504000  ! 706: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x8394e000  ! 707: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbb50c000  ! 708: RDPR_TT	<illegal instruction>
	.word 0xa1504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xb1a7c9c0  ! 710: FDIVd	fdivd	%f62, %f0, %f24
	.word 0xb9a4c840  ! 711: FADDd	faddd	%f50, %f0, %f28
	.word 0xb350c000  ! 712: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 713: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 716: RDPR_TSTATE	<illegal instruction>
	.word 0x8d972000  ! 717: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xb550c000  ! 718: RDPR_TT	rdpr	%tt, %r26
	.word 0x8d97e000  ! 719: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8d97a000  ! 720: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xab504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0x8395e000  ! 722: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x819c6000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x85946000  ! 724: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x819de000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8194e000  ! 726: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa150c000  ! 727: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 728: RDPR_TSTATE	<illegal instruction>
	.word 0xbd500000  ! 729: RDPR_TPC	<illegal instruction>
	.word 0x819fa000  ! 730: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x83952000  ! 731: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xada00540  ! 732: FSQRTd	fsqrt	
	.word 0xab50c000  ! 733: RDPR_TT	<illegal instruction>
	.word 0x8194e000  ! 734: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xa5508000  ! 735: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 736: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xb7a648a0  ! 737: FSUBs	fsubs	%f25, %f0, %f27
	.word 0x85956000  ! 738: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x85946000  ! 739: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x819fa000  ! 740: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8d976000  ! 741: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa9a44840  ! 742: FADDd	faddd	%f48, %f0, %f20
	.word 0x839ee000  ! 743: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x839ce000  ! 744: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xbf500000  ! 745: RDPR_TPC	<illegal instruction>
	.word 0xad500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x819ee000  ! 747: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xa7508000  ! 748: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 749: RDPR_TT	<illegal instruction>
	.word 0x819e6000  ! 750: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa9508000  ! 751: RDPR_TSTATE	<illegal instruction>
	.word 0x8796a000  ! 752: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x819d6000  ! 753: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xa7a709a0  ! 754: FDIVs	fdivs	%f28, %f0, %f19
	.word 0xbda5c860  ! 755: FADDq	dis not found

	.word 0xa1504000  ! 756: RDPR_TNPC	<illegal instruction>
	.word 0x8794e000  ! 757: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xbb50c000  ! 758: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 759: RDPR_TT	<illegal instruction>
	.word 0xa550c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0x8595a000  ! 761: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d976000  ! 762: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8595a000  ! 763: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d96e000  ! 764: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xaf504000  ! 765: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x839c2000  ! 766: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x839de000  ! 767: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbf500000  ! 768: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 769: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8d94e000  ! 770: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x83946000  ! 771: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xaf508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d952000  ! 773: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x839ea000  ! 774: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa9a4c940  ! 775: FMULd	fmuld	%f50, %f0, %f20
	.word 0xad50c000  ! 776: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 777: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb5500000  ! 778: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xbd500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 780: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8596a000  ! 781: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x87946000  ! 782: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x83942000  ! 783: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa1a00540  ! 784: FSQRTd	fsqrt	
	.word 0x819e2000  ! 785: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x819ca000  ! 786: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa5508000  ! 787: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 788: RDPR_TPC	<illegal instruction>
	.word 0xb5500000  ! 789: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbd500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0xa1500000  ! 792: RDPR_TPC	<illegal instruction>
	.word 0xab500000  ! 793: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 794: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x85952000  ! 795: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x839fe000  ! 796: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xbd500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 798: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 799: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb7508000  ! 800: RDPR_TSTATE	<illegal instruction>
	.word 0x8197e000  ! 801: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0x8395e000  ! 802: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb550c000  ! 803: RDPR_TT	<illegal instruction>
	.word 0xa3508000  ! 804: RDPR_TSTATE	<illegal instruction>
	.word 0xaba409c0  ! 805: FDIVd	fdivd	%f16, %f0, %f52
	.word 0xa7a40840  ! 806: FADDd	faddd	%f16, %f0, %f50
	.word 0xb3508000  ! 807: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 808: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x85956000  ! 809: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xb7a609c0  ! 810: FDIVd	fdivd	%f24, %f0, %f58
	.word 0xb7504000  ! 811: RDPR_TNPC	<illegal instruction>
	.word 0xb5504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xbda00540  ! 813: FSQRTd	fsqrt	
	.word 0x8d95a000  ! 814: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xaba748e0  ! 815: FSUBq	dis not found

	.word 0x8596a000  ! 816: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x85956000  ! 817: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xab50c000  ! 818: RDPR_TT	<illegal instruction>
	.word 0xa1a589a0  ! 819: FDIVs	fdivs	%f22, %f0, %f16
	.word 0xb1a70960  ! 820: FMULq	dis not found

	.word 0xa5a48820  ! 821: FADDs	fadds	%f18, %f0, %f18
	.word 0xb1a00560  ! 822: FSQRTq	fsqrt	
	.word 0xaf504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0x85952000  ! 824: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x83976000  ! 825: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb3500000  ! 826: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x819da000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xada788a0  ! 828: FSUBs	fsubs	%f30, %f0, %f22
	.word 0xad504000  ! 829: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x819ca000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8195e000  ! 831: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0xab50c000  ! 832: RDPR_TT	<illegal instruction>
	.word 0xa5508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0xa750c000  ! 834: RDPR_TT	<illegal instruction>
	.word 0x8794a000  ! 835: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8797e000  ! 836: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x8d966000  ! 837: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x81972000  ! 838: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xad504000  ! 839: RDPR_TNPC	<illegal instruction>
	.word 0x819d2000  ! 840: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d966000  ! 841: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xb3a509e0  ! 842: FDIVq	dis not found

	.word 0x839fa000  ! 843: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x8594e000  ! 844: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xaf504000  ! 845: RDPR_TNPC	<illegal instruction>
	.word 0x819ce000  ! 846: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbb500000  ! 847: RDPR_TPC	<illegal instruction>
	.word 0x81952000  ! 848: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xb5508000  ! 849: RDPR_TSTATE	<illegal instruction>
	.word 0x83952000  ! 850: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa5508000  ! 851: RDPR_TSTATE	<illegal instruction>
	.word 0x8594e000  ! 852: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xa350c000  ! 853: RDPR_TT	<illegal instruction>
	.word 0x819f6000  ! 854: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xab50c000  ! 855: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 856: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xa350c000  ! 857: RDPR_TT	<illegal instruction>
	.word 0xa9500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0x87952000  ! 859: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0x8196e000  ! 860: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xbfa00560  ! 861: FSQRTq	fsqrt	
	.word 0x8d956000  ! 862: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819d6000  ! 863: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xbb500000  ! 864: RDPR_TPC	<illegal instruction>
	.word 0x8795a000  ! 865: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0x819ce000  ! 866: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb5504000  ! 867: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xa3a449c0  ! 868: FDIVd	fdivd	%f48, %f0, %f48
	.word 0x839de000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xab504000  ! 870: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 871: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xbb508000  ! 872: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a609e0  ! 873: FDIVq	dis not found

	.word 0xb150c000  ! 874: RDPR_TT	<illegal instruction>
	.word 0x8594a000  ! 875: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xb9504000  ! 876: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 877: RDPR_TT	<illegal instruction>
	.word 0x8d97e000  ! 878: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x83956000  ! 879: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xad504000  ! 880: RDPR_TNPC	<illegal instruction>
	.word 0x87942000  ! 881: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa1508000  ! 882: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a649e0  ! 883: FDIVq	dis not found

	.word 0xb1504000  ! 884: RDPR_TNPC	<illegal instruction>
	.word 0x8d966000  ! 885: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x839e6000  ! 886: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xa950c000  ! 887: RDPR_TT	<illegal instruction>
	.word 0xa7500000  ! 888: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 889: RDPR_TSTATE	<illegal instruction>
	.word 0x839ce000  ! 890: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x839da000  ! 891: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x819ce000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbb504000  ! 893: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 894: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xa3a48860  ! 896: FADDq	dis not found

	.word 0xad504000  ! 897: RDPR_TNPC	<illegal instruction>
	.word 0x839c2000  ! 898: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8d96e000  ! 899: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xa3504000  ! 900: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8194a000  ! 901: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x8d966000  ! 902: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x819c2000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa5500000  ! 904: RDPR_TPC	<illegal instruction>
	.word 0xbba54960  ! 905: FMULq	dis not found

	.word 0x83972000  ! 906: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x87942000  ! 907: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa7504000  ! 908: RDPR_TNPC	<illegal instruction>
	.word 0x8794a000  ! 909: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xab500000  ! 910: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 911: RDPR_TPC	<illegal instruction>
	.word 0xad508000  ! 912: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a509e0  ! 913: FDIVq	dis not found

	.word 0xbba58840  ! 914: FADDd	faddd	%f22, %f0, %f60
	.word 0x839ce000  ! 915: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x839c2000  ! 916: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x819fa000  ! 917: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8397a000  ! 918: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8d972000  ! 919: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa1504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xab500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0x839da000  ! 923: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xb5508000  ! 924: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a58860  ! 925: FADDq	dis not found

	.word 0xb1a708e0  ! 926: FSUBq	dis not found

	.word 0x8595a000  ! 927: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x8d97e000  ! 928: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xbd50c000  ! 929: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 930: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x819da000  ! 931: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb3504000  ! 932: RDPR_TNPC	<illegal instruction>
	.word 0xb3500000  ! 933: RDPR_TPC	<illegal instruction>
	.word 0x81956000  ! 934: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0x81976000  ! 935: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xbd500000  ! 936: RDPR_TPC	<illegal instruction>
	.word 0x81966000  ! 937: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xa5508000  ! 938: RDPR_TSTATE	<illegal instruction>
	.word 0x8396a000  ! 939: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819fa000  ! 940: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa7504000  ! 941: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 942: RDPR_TSTATE	<illegal instruction>
	.word 0x8395e000  ! 943: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8594e000  ! 944: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x819c2000  ! 945: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xbd504000  ! 946: RDPR_TNPC	<illegal instruction>
	.word 0xa1a788e0  ! 947: FSUBq	dis not found

	.word 0xbd500000  ! 948: RDPR_TPC	<illegal instruction>
	.word 0xa9a70940  ! 949: FMULd	fmuld	%f28, %f0, %f20
	.word 0xa3508000  ! 950: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 951: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0x87976000  ! 953: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x83962000  ! 954: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa3500000  ! 955: RDPR_TPC	<illegal instruction>
	.word 0xafa74940  ! 956: FMULd	fmuld	%f60, %f0, %f54
	.word 0x839ee000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x87972000  ! 958: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xb9508000  ! 959: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 960: RDPR_TSTATE	<illegal instruction>
	.word 0x8795a000  ! 961: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbf50c000  ! 962: RDPR_TT	<illegal instruction>
	.word 0xafa00520  ! 963: FSQRTs	fsqrt	
	.word 0xb9a68960  ! 964: FMULq	dis not found

	.word 0x8396a000  ! 965: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xad50c000  ! 966: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 967: RDPR_TPC	<illegal instruction>
	.word 0x8394a000  ! 968: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x8d962000  ! 969: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8d94e000  ! 970: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa5508000  ! 971: RDPR_TSTATE	<illegal instruction>
	.word 0x819ce000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xab508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa58940  ! 974: FMULd	fmuld	%f22, %f0, %f62
	.word 0xa9504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0xb1a608c0  ! 976: FSUBd	fsubd	%f24, %f0, %f24
	.word 0xa9504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0xa7508000  ! 978: RDPR_TSTATE	<illegal instruction>
	.word 0xad504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 980: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 981: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xb3a6c8a0  ! 982: FSUBs	fsubs	%f27, %f0, %f25
	.word 0xad50c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0x8d946000  ! 984: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819d6000  ! 985: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8394e000  ! 986: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xbd500000  ! 987: RDPR_TPC	<illegal instruction>
	.word 0x87942000  ! 988: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x81946000  ! 989: WRPR_TPC_I	wrpr	%r17, 0x0000, %tpc
	.word 0x8d956000  ! 990: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xab504000  ! 991: RDPR_TNPC	<illegal instruction>
	.word 0xa950c000  ! 992: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 993: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 994: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb150c000  ! 995: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 996: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x83972000  ! 997: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xbf50c000  ! 998: RDPR_TT	<illegal instruction>
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	ta	T_CHANGE_PRIV
	wrpr	%g0, 1, %tl
	wrpr	%l0, %g0, %tpc
	wrpr	%l0, %g0, %tnpc
	wrpr	%l0, %g0, %tstate
	wrpr	%l0, %g0, %tt
	.word 0xb1504000  ! 1: RDPR_TNPC	<illegal instruction>
	.word 0x8d946000  ! 2: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xbba748e0  ! 3: FSUBq	dis not found

	.word 0xb5500000  ! 4: RDPR_TPC	<illegal instruction>
	.word 0x8394e000  ! 5: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb9a548a0  ! 6: FSUBs	fsubs	%f21, %f0, %f28
	.word 0x81962000  ! 7: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xbda649c0  ! 8: FDIVd	fdivd	%f56, %f0, %f30
	.word 0x8796a000  ! 9: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x81976000  ! 10: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8395a000  ! 11: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xb9508000  ! 12: RDPR_TSTATE	<illegal instruction>
	.word 0xaba4c840  ! 13: FADDd	faddd	%f50, %f0, %f52
	.word 0xbd508000  ! 14: RDPR_TSTATE	<illegal instruction>
	.word 0xa5500000  ! 15: RDPR_TPC	<illegal instruction>
	.word 0xa5500000  ! 16: RDPR_TPC	<illegal instruction>
	.word 0x8d946000  ! 17: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xb7a00520  ! 18: FSQRTs	fsqrt	
	.word 0x8197e000  ! 19: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbb508000  ! 20: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 21: RDPR_TT	<illegal instruction>
	.word 0xb1500000  ! 22: RDPR_TPC	<illegal instruction>
	.word 0x819c2000  ! 23: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa3508000  ! 24: RDPR_TSTATE	<illegal instruction>
	.word 0xbb50c000  ! 25: RDPR_TT	<illegal instruction>
	.word 0x8d966000  ! 26: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x8595e000  ! 27: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8595e000  ! 28: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xbf508000  ! 29: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a00540  ! 30: FSQRTd	fsqrt	
	.word 0x8395e000  ! 31: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8596a000  ! 32: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0xbda608e0  ! 33: FSUBq	dis not found

	.word 0xb9508000  ! 34: RDPR_TSTATE	<illegal instruction>
	.word 0x8d96e000  ! 35: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x8d96e000  ! 36: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb7508000  ! 37: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 38: RDPR_TT	<illegal instruction>
	.word 0x8797a000  ! 39: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8796e000  ! 40: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x8595a000  ! 41: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x819d2000  ! 42: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x8d972000  ! 43: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8d972000  ! 44: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8597e000  ! 45: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x83972000  ! 46: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb9508000  ! 47: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a748e0  ! 48: FSUBq	dis not found

	.word 0xb750c000  ! 49: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 50: RDPR_TT	<illegal instruction>
	.word 0xa550c000  ! 51: RDPR_TT	<illegal instruction>
	.word 0xbfa00560  ! 52: FSQRTq	fsqrt	
	.word 0x819fe000  ! 53: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x83942000  ! 54: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x81972000  ! 55: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb9508000  ! 56: RDPR_TSTATE	<illegal instruction>
	.word 0x81952000  ! 57: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xada7c8e0  ! 58: FSUBq	dis not found

	.word 0xb7a7c9a0  ! 59: FDIVs	fdivs	%f31, %f0, %f27
	.word 0xad500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0xbd500000  ! 61: RDPR_TPC	<illegal instruction>
	.word 0x839f6000  ! 62: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8394e000  ! 63: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x819d6000  ! 64: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0xad508000  ! 65: RDPR_TSTATE	<illegal instruction>
	.word 0xa150c000  ! 66: RDPR_TT	<illegal instruction>
	.word 0xa3508000  ! 67: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 68: RDPR_TT	<illegal instruction>
	.word 0x819fa000  ! 69: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8196a000  ! 70: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xb5500000  ! 71: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 72: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xbba00540  ! 73: FSQRTd	fsqrt	
	.word 0x8396a000  ! 74: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x85962000  ! 75: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x819d6000  ! 76: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x8397e000  ! 77: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x819ea000  ! 78: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x87946000  ! 79: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8d95a000  ! 80: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8d95e000  ! 81: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d94a000  ! 82: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x81976000  ! 83: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xab50c000  ! 84: RDPR_TT	<illegal instruction>
	.word 0x8196a000  ! 85: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x8d976000  ! 86: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa9508000  ! 87: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 88: RDPR_TPC	<illegal instruction>
	.word 0xa9500000  ! 89: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 90: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb1504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xa1a4c8a0  ! 92: FSUBs	fsubs	%f19, %f0, %f16
	.word 0xb1504000  ! 93: RDPR_TNPC	<illegal instruction>
	.word 0xbb504000  ! 94: RDPR_TNPC	<illegal instruction>
	.word 0x8d97e000  ! 95: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xab508000  ! 96: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a548a0  ! 97: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xb7504000  ! 98: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 99: RDPR_TPC	<illegal instruction>
	.word 0x8d97a000  ! 100: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x8394a000  ! 101: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb5508000  ! 102: RDPR_TSTATE	<illegal instruction>
	.word 0x8195a000  ! 103: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x839d6000  ! 104: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x819ce000  ! 105: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xada4c920  ! 106: FMULs	fmuls	%f19, %f0, %f22
	.word 0x839f2000  ! 107: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8d97a000  ! 108: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa5508000  ! 109: RDPR_TSTATE	<illegal instruction>
	.word 0x8394e000  ! 110: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0x8597a000  ! 111: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xa150c000  ! 112: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 113: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xb5a68860  ! 114: FADDq	dis not found

	.word 0x8d94a000  ! 115: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa9500000  ! 116: RDPR_TPC	<illegal instruction>
	.word 0x819fa000  ! 117: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xa350c000  ! 118: RDPR_TT	<illegal instruction>
	.word 0xb1a448e0  ! 119: FSUBq	dis not found

	.word 0xa7500000  ! 120: RDPR_TPC	<illegal instruction>
	.word 0x83952000  ! 121: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbf508000  ! 122: RDPR_TSTATE	<illegal instruction>
	.word 0xa5504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 124: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x81942000  ! 125: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xab500000  ! 126: RDPR_TPC	<illegal instruction>
	.word 0xab504000  ! 127: RDPR_TNPC	<illegal instruction>
	.word 0x819c2000  ! 128: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xa9504000  ! 129: RDPR_TNPC	<illegal instruction>
	.word 0x819d2000  ! 130: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x87972000  ! 131: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x839de000  ! 132: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819ca000  ! 133: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa3a788e0  ! 134: FSUBq	dis not found

	.word 0xa1a00540  ! 135: FSQRTd	fsqrt	
	.word 0x87972000  ! 136: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8d976000  ! 137: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8794a000  ! 138: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x819de000  ! 139: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xaf504000  ! 140: RDPR_TNPC	<illegal instruction>
	.word 0x8d976000  ! 141: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x819f6000  ! 142: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8d946000  ! 143: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819d2000  ! 144: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x819fa000  ! 145: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0x8195a000  ! 146: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb5500000  ! 147: RDPR_TPC	<illegal instruction>
	.word 0xa7a00520  ! 148: FSQRTs	fsqrt	
	.word 0x8d972000  ! 149: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa3504000  ! 150: RDPR_TNPC	<illegal instruction>
	.word 0x8d942000  ! 151: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x819fe000  ! 152: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8794a000  ! 153: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8395e000  ! 154: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xafa00540  ! 155: FSQRTd	fsqrt	
	.word 0x819ea000  ! 156: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x819f6000  ! 157: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0x8d97a000  ! 158: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0xa5508000  ! 159: RDPR_TSTATE	<illegal instruction>
	.word 0x8d94e000  ! 160: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8596a000  ! 161: WRPR_TSTATE_I	wrpr	%r26, 0x0000, %tstate
	.word 0x8d956000  ! 162: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x83956000  ! 163: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x81956000  ! 164: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xad500000  ! 165: RDPR_TPC	<illegal instruction>
	.word 0x839fa000  ! 166: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839ea000  ! 167: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xad504000  ! 168: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 169: RDPR_TSTATE	<illegal instruction>
	.word 0xb7508000  ! 170: RDPR_TSTATE	<illegal instruction>
	.word 0xb3504000  ! 171: RDPR_TNPC	<illegal instruction>
	.word 0xb7a58840  ! 172: FADDd	faddd	%f22, %f0, %f58
	.word 0x819d6000  ! 173: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0000, %hpstate
	.word 0x839ee000  ! 174: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xab504000  ! 175: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 176: RDPR_TSTATE	<illegal instruction>
	.word 0x8796a000  ! 177: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0xbf504000  ! 178: RDPR_TNPC	<illegal instruction>
	.word 0x8d95e000  ! 179: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8797e000  ! 180: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xb3500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xb150c000  ! 182: RDPR_TT	<illegal instruction>
	.word 0xab508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0x819e6000  ! 184: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xafa749a0  ! 185: FDIVs	fdivs	%f29, %f0, %f23
	.word 0x8d97e000  ! 186: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x839ea000  ! 187: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb1a00520  ! 188: FSQRTs	fsqrt	
	.word 0x87946000  ! 189: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0x8394a000  ! 190: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0x839da000  ! 191: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0xaf500000  ! 192: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 193: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 194: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0x87956000  ! 195: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8597a000  ! 196: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0xaba00520  ! 197: FSQRTs	fsqrt	
	.word 0xab508000  ! 198: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 199: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x81972000  ! 200: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xb1a5c8a0  ! 201: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb3500000  ! 202: RDPR_TPC	<illegal instruction>
	.word 0x81942000  ! 203: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x839ca000  ! 204: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0xb750c000  ! 205: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 206: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbb508000  ! 207: RDPR_TSTATE	<illegal instruction>
	.word 0x8597a000  ! 208: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8d94a000  ! 209: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xab50c000  ! 210: RDPR_TT	<illegal instruction>
	.word 0xb1504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0x8796a000  ! 212: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x85956000  ! 213: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0xad508000  ! 214: RDPR_TSTATE	<illegal instruction>
	.word 0x83972000  ! 215: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x8595e000  ! 216: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xab500000  ! 217: RDPR_TPC	<illegal instruction>
	.word 0x83946000  ! 218: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0xa5a408c0  ! 219: FSUBd	fsubd	%f16, %f0, %f18
	.word 0x839f6000  ! 220: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x839d2000  ! 221: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0x81962000  ! 222: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xaf50c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0xa9a509c0  ! 224: FDIVd	fdivd	%f20, %f0, %f20
	.word 0x839c2000  ! 225: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb1504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xbda6c9e0  ! 227: FDIVq	dis not found

	.word 0x819ca000  ! 228: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x81942000  ! 229: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x87942000  ! 230: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8197a000  ! 231: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xb3a44960  ! 232: FMULq	dis not found

	.word 0xb3a64940  ! 233: FMULd	fmuld	%f56, %f0, %f56
	.word 0xa750c000  ! 234: RDPR_TT	<illegal instruction>
	.word 0x819c6000  ! 235: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xb5500000  ! 236: RDPR_TPC	<illegal instruction>
	.word 0x8d946000  ! 237: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x87952000  ! 238: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xa150c000  ! 239: RDPR_TT	<illegal instruction>
	.word 0x839de000  ! 240: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x839ce000  ! 241: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x819c2000  ! 242: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xafa7c9c0  ! 243: FDIVd	fdivd	%f62, %f0, %f54
	.word 0xa7a6c9a0  ! 244: FDIVs	fdivs	%f27, %f0, %f19
	.word 0x839e2000  ! 245: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x819d2000  ! 246: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x819d2000  ! 247: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x81952000  ! 248: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xbba68860  ! 249: FADDq	dis not found

	.word 0x8395a000  ! 250: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0xbf500000  ! 251: RDPR_TPC	<illegal instruction>
	.word 0x8d96a000  ! 252: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xaf50c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xbf50c000  ! 254: RDPR_TT	<illegal instruction>
	.word 0x819e2000  ! 255: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x8d952000  ! 256: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb7a788e0  ! 257: FSUBq	dis not found

	.word 0x8195a000  ! 258: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xa1a548c0  ! 259: FSUBd	fsubd	%f52, %f0, %f16
	.word 0xafa5c860  ! 260: FADDq	dis not found

	.word 0x8394e000  ! 261: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xad500000  ! 262: RDPR_TPC	<illegal instruction>
	.word 0x8595a000  ! 263: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x839c2000  ! 264: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0x8d97e000  ! 265: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x8d946000  ! 266: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x8d956000  ! 267: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8194a000  ! 268: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0xb9500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 270: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x81966000  ! 271: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0xbf508000  ! 272: RDPR_TSTATE	<illegal instruction>
	.word 0x85956000  ! 273: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x8194a000  ! 274: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819f6000  ! 275: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xa9a00540  ! 276: FSQRTd	fsqrt	
	.word 0xab500000  ! 277: RDPR_TPC	<illegal instruction>
	.word 0x83972000  ! 278: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xa5508000  ! 279: RDPR_TSTATE	<illegal instruction>
	.word 0xa3508000  ! 280: RDPR_TSTATE	<illegal instruction>
	.word 0x85942000  ! 281: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa5a609c0  ! 282: FDIVd	fdivd	%f24, %f0, %f18
	.word 0x8595e000  ! 283: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xa3504000  ! 284: RDPR_TNPC	<illegal instruction>
	.word 0x8397e000  ! 285: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xa3508000  ! 286: RDPR_TSTATE	<illegal instruction>
	.word 0xbba4c9a0  ! 287: FDIVs	fdivs	%f19, %f0, %f29
	.word 0x8794e000  ! 288: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa3500000  ! 289: RDPR_TPC	<illegal instruction>
	.word 0xa7a448e0  ! 290: FSUBq	dis not found

	.word 0x8597e000  ! 291: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x839fa000  ! 292: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xbb50c000  ! 293: RDPR_TT	<illegal instruction>
	.word 0xaf508000  ! 294: RDPR_TSTATE	<illegal instruction>
	.word 0x8d97a000  ! 295: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x819fa000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r30, 0x0000, %hpstate
	.word 0xb1504000  ! 297: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0x8d966000  ! 299: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xbfa748a0  ! 300: FSUBs	fsubs	%f29, %f0, %f31
	.word 0xab500000  ! 301: RDPR_TPC	<illegal instruction>
	.word 0x8d972000  ! 302: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x819f2000  ! 303: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xa750c000  ! 304: RDPR_TT	<illegal instruction>
	.word 0x8d956000  ! 305: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb7504000  ! 306: RDPR_TNPC	<illegal instruction>
	.word 0x8d97e000  ! 307: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0x839da000  ! 308: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x8397a000  ! 309: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x83952000  ! 310: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbd500000  ! 311: RDPR_TPC	<illegal instruction>
	.word 0x8597e000  ! 312: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8d946000  ! 313: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819e6000  ! 314: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xbda74960  ! 315: FMULq	dis not found

	.word 0x839c2000  ! 316: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xb750c000  ! 317: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 318: RDPR_TPC	<illegal instruction>
	.word 0x85962000  ! 319: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xa9500000  ! 320: RDPR_TPC	<illegal instruction>
	.word 0x8194e000  ! 321: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8194a000  ! 322: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819da000  ! 323: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x8194a000  ! 324: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x819ca000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbf504000  ! 326: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 327: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a709a0  ! 328: FDIVs	fdivs	%f28, %f0, %f27
	.word 0xa1a4c8a0  ! 329: FSUBs	fsubs	%f19, %f0, %f16
	.word 0x81972000  ! 330: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xa9a68940  ! 331: FMULd	fmuld	%f26, %f0, %f20
	.word 0x8d96a000  ! 332: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x8d956000  ! 333: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa1508000  ! 334: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a788a0  ! 335: FSUBs	fsubs	%f30, %f0, %f26
	.word 0x839fa000  ! 336: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839f2000  ! 337: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xa9508000  ! 338: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 340: RDPR_TT	<illegal instruction>
	.word 0xa7504000  ! 341: RDPR_TNPC	<illegal instruction>
	.word 0xbd50c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xa1500000  ! 343: RDPR_TPC	<illegal instruction>
	.word 0xa7a40920  ! 344: FMULs	fmuls	%f16, %f0, %f19
	.word 0x83952000  ! 345: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa5504000  ! 346: RDPR_TNPC	<illegal instruction>
	.word 0x81956000  ! 347: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb7500000  ! 348: RDPR_TPC	<illegal instruction>
	.word 0x83976000  ! 349: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81952000  ! 350: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x8196e000  ! 351: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xb3a7c8e0  ! 352: FSUBq	dis not found

	.word 0x81942000  ! 353: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0x819c2000  ! 354: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb9508000  ! 355: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a4c820  ! 356: FADDs	fadds	%f19, %f0, %f25
	.word 0xada68960  ! 357: FMULq	dis not found

	.word 0x85962000  ! 358: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb7500000  ! 359: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xbb500000  ! 360: RDPR_TPC	<illegal instruction>
	.word 0x87956000  ! 361: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb1a4c940  ! 362: FMULd	fmuld	%f50, %f0, %f24
	.word 0xa9a40940  ! 363: FMULd	fmuld	%f16, %f0, %f20
	.word 0xb1a48920  ! 364: FMULs	fmuls	%f18, %f0, %f24
	.word 0x8d962000  ! 365: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x8595e000  ! 366: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb7a00560  ! 367: FSQRTq	fsqrt	
	.word 0x87942000  ! 368: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8797a000  ! 369: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8796e000  ! 370: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xb950c000  ! 371: RDPR_TT	<illegal instruction>
	.word 0xa7a00540  ! 372: FSQRTd	fsqrt	
	.word 0x8194e000  ! 373: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbd50c000  ! 374: RDPR_TT	<illegal instruction>
	.word 0xb7a4c8a0  ! 375: FSUBs	fsubs	%f19, %f0, %f27
	.word 0x819de000  ! 376: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x8d946000  ! 377: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xbb500000  ! 378: RDPR_TPC	<illegal instruction>
	.word 0xb1a48860  ! 379: FADDq	dis not found

	.word 0xbba5c920  ! 380: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb7a54920  ! 381: FMULs	fmuls	%f21, %f0, %f27
	.word 0x87956000  ! 382: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0xb9a60940  ! 383: FMULd	fmuld	%f24, %f0, %f28
	.word 0xaba68940  ! 384: FMULd	fmuld	%f26, %f0, %f52
	.word 0x819f2000  ! 385: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x839c2000  ! 386: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0000, %htstate
	.word 0xaf504000  ! 387: RDPR_TNPC	<illegal instruction>
	.word 0xb950c000  ! 388: RDPR_TT	<illegal instruction>
	.word 0x819c6000  ! 389: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8d966000  ! 390: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0x83952000  ! 391: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa1508000  ! 392: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 393: RDPR_TPC	<illegal instruction>
	.word 0xbb504000  ! 394: RDPR_TNPC	<illegal instruction>
	.word 0xaf50c000  ! 395: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 396: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 397: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbba00560  ! 398: FSQRTq	fsqrt	
	.word 0x819d2000  ! 399: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xaba40820  ! 400: FADDs	fadds	%f16, %f0, %f21
	.word 0x81952000  ! 401: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0x83972000  ! 402: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0x81976000  ! 403: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x819f6000  ! 404: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xb550c000  ! 405: RDPR_TT	<illegal instruction>
	.word 0x83942000  ! 406: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x81976000  ! 407: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0x8397a000  ! 408: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8194a000  ! 409: WRPR_TPC_I	wrpr	%r18, 0x0000, %tpc
	.word 0x839ca000  ! 410: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x819e2000  ! 411: WRHPR_HPSTATE_I	wrhpr	%r24, 0x0000, %hpstate
	.word 0x81962000  ! 412: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8796a000  ! 413: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x85946000  ! 414: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0x839ce000  ! 415: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x8597e000  ! 416: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x85966000  ! 417: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xada5c940  ! 418: FMULd	fmuld	%f54, %f0, %f22
	.word 0x85942000  ! 419: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819da000  ! 420: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x85956000  ! 421: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x839d6000  ! 422: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x8d96e000  ! 423: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x819d2000  ! 424: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xafa64940  ! 425: FMULd	fmuld	%f56, %f0, %f54
	.word 0xa3a64960  ! 426: FMULq	dis not found

	.word 0xb950c000  ! 427: RDPR_TT	<illegal instruction>
	.word 0x83952000  ! 428: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x839e2000  ! 429: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d95a000  ! 430: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8794a000  ! 431: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x8796a000  ! 432: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x85942000  ! 433: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xa1500000  ! 434: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xad500000  ! 435: RDPR_TPC	<illegal instruction>
	.word 0xb5504000  ! 436: RDPR_TNPC	<illegal instruction>
	.word 0xa7a70820  ! 437: FADDs	fadds	%f28, %f0, %f19
	.word 0xb5a7c9e0  ! 438: FDIVq	dis not found

	.word 0xb9504000  ! 439: RDPR_TNPC	<illegal instruction>
	.word 0x81942000  ! 440: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa7500000  ! 441: RDPR_TPC	<illegal instruction>
	.word 0x839f2000  ! 442: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8594a000  ! 443: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	.word 0xaf508000  ! 444: RDPR_TSTATE	<illegal instruction>
	.word 0x85976000  ! 445: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x8395a000  ! 446: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x819f2000  ! 447: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0x839f6000  ! 448: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x8194e000  ! 449: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8597e000  ! 450: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xa1500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xa750c000  ! 452: RDPR_TT	<illegal instruction>
	.word 0x8395a000  ! 453: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x839e6000  ! 454: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb9500000  ! 455: RDPR_TPC	<illegal instruction>
	.word 0xbb500000  ! 456: RDPR_TPC	<illegal instruction>
	.word 0x819da000  ! 457: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0xb9504000  ! 458: RDPR_TNPC	<illegal instruction>
	.word 0x8395e000  ! 459: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0x8d95e000  ! 460: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d95e000  ! 461: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa9a5c840  ! 462: FADDd	faddd	%f54, %f0, %f20
	.word 0xad500000  ! 463: RDPR_TPC	<illegal instruction>
	.word 0x8794e000  ! 464: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	.word 0xa750c000  ! 465: RDPR_TT	<illegal instruction>
	.word 0xa3a48840  ! 466: FADDd	faddd	%f18, %f0, %f48
	.word 0xad50c000  ! 467: RDPR_TT	<illegal instruction>
	.word 0x839ea000  ! 468: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xa5a00540  ! 469: FSQRTd	fsqrt	
	.word 0xb1a64960  ! 470: FMULq	dis not found

	.word 0xb7508000  ! 471: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xb550c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 473: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0xa9a609e0  ! 474: FDIVq	dis not found

	.word 0xa9a00520  ! 475: FSQRTs	fsqrt	
	.word 0x83956000  ! 476: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0x8597e000  ! 477: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0xb5504000  ! 478: RDPR_TNPC	<illegal instruction>
	.word 0x8197a000  ! 479: WRPR_TPC_I	wrpr	%r30, 0x0000, %tpc
	.word 0xbf504000  ! 480: RDPR_TNPC	<illegal instruction>
	.word 0x85952000  ! 481: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x8396a000  ! 482: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0xa5504000  ! 483: RDPR_TNPC	<illegal instruction>
	.word 0xbb500000  ! 484: RDPR_TPC	<illegal instruction>
	.word 0x839de000  ! 485: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x819e6000  ! 486: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa9a64860  ! 487: FADDq	dis not found

	.word 0xaf504000  ! 488: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 489: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 490: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0xb1504000  ! 491: RDPR_TNPC	<illegal instruction>
	.word 0xbfa549a0  ! 492: FDIVs	fdivs	%f21, %f0, %f31
	.word 0x819ce000  ! 493: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xbb508000  ! 494: RDPR_TSTATE	<illegal instruction>
	.word 0xa1500000  ! 495: RDPR_TPC	<illegal instruction>
	.word 0xa7508000  ! 496: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 497: RDPR_TPC	<illegal instruction>
	.word 0x85972000  ! 498: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x85962000  ! 499: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8597a000  ! 500: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x8d94e000  ! 501: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x85966000  ! 502: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xa3a709c0  ! 503: FDIVd	fdivd	%f28, %f0, %f48
	.word 0x819ca000  ! 504: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa1a548a0  ! 505: FSUBs	fsubs	%f21, %f0, %f16
	.word 0xa5508000  ! 506: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00540  ! 507: FSQRTd	fsqrt	
	.word 0xa3a00520  ! 508: FSQRTs	fsqrt	
	.word 0xb1a00520  ! 509: FSQRTs	fsqrt	
	.word 0xa3a54940  ! 510: FMULd	fmuld	%f52, %f0, %f48
	.word 0x8597a000  ! 511: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x85976000  ! 512: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0x83942000  ! 513: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8396e000  ! 514: WRPR_TNPC_I	wrpr	%r27, 0x0000, %tnpc
	.word 0x87952000  ! 515: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xb9504000  ! 516: RDPR_TNPC	<illegal instruction>
	.word 0x8796a000  ! 517: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x819f2000  ! 518: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb5504000  ! 519: RDPR_TNPC	<illegal instruction>
	.word 0x83952000  ! 520: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0x8d942000  ! 521: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8397a000  ! 522: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x8d97e000  ! 523: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xab508000  ! 524: RDPR_TSTATE	<illegal instruction>
	.word 0x839f2000  ! 525: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0x8d97a000  ! 526: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x819d2000  ! 527: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0x819ce000  ! 528: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8797e000  ! 529: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xab50c000  ! 530: RDPR_TT	<illegal instruction>
	.word 0x839fa000  ! 531: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0xad508000  ! 532: RDPR_TSTATE	<illegal instruction>
	.word 0xa950c000  ! 533: RDPR_TT	<illegal instruction>
	.word 0x8595a000  ! 534: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x839de000  ! 535: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x839e2000  ! 536: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x839f2000  ! 537: WRHPR_HTSTATE_I	wrhpr	%r28, 0x0000, %htstate
	.word 0xbba448c0  ! 538: FSUBd	fsubd	%f48, %f0, %f60
	.word 0x839d2000  ! 539: WRHPR_HTSTATE_I	wrhpr	%r20, 0x0000, %htstate
	.word 0xab504000  ! 540: RDPR_TNPC	<illegal instruction>
	.word 0xad50c000  ! 541: RDPR_TT	<illegal instruction>
	.word 0xa3a78860  ! 542: FADDq	dis not found

	.word 0xbb500000  ! 543: RDPR_TPC	<illegal instruction>
	.word 0x8d972000  ! 544: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x85976000  ! 545: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xbf500000  ! 546: RDPR_TPC	<illegal instruction>
	.word 0x839ce000  ! 547: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x819e6000  ! 548: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x81976000  ! 549: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xa9504000  ! 550: RDPR_TNPC	<illegal instruction>
	.word 0xb550c000  ! 551: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 552: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xaf508000  ! 553: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a40860  ! 554: FADDq	dis not found

	.word 0x8d976000  ! 555: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0x8d94e000  ! 556: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x85952000  ! 557: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbd500000  ! 558: RDPR_TPC	<illegal instruction>
	.word 0x819de000  ! 559: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x839de000  ! 560: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xbda449a0  ! 561: FDIVs	fdivs	%f17, %f0, %f30
	.word 0xa3500000  ! 562: RDPR_TPC	<illegal instruction>
	.word 0xb3a688a0  ! 563: FSUBs	fsubs	%f26, %f0, %f25
	.word 0xab508000  ! 564: RDPR_TSTATE	<illegal instruction>
	.word 0xbd504000  ! 565: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 566: RDPR_TNPC	<illegal instruction>
	.word 0x83972000  ! 567: WRPR_TNPC_I	wrpr	%r28, 0x0000, %tnpc
	.word 0xb1a00520  ! 568: FSQRTs	fsqrt	
	.word 0xa950c000  ! 569: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 570: RDPR_TPC	<illegal instruction>
	.word 0x85946000  ! 571: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xa1500000  ! 572: RDPR_TPC	<illegal instruction>
	.word 0xbba00560  ! 573: FSQRTq	fsqrt	
	.word 0xa7500000  ! 574: RDPR_TPC	<illegal instruction>
	.word 0x83956000  ! 575: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbd504000  ! 576: RDPR_TNPC	<illegal instruction>
	.word 0xb3a5c9c0  ! 577: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xb350c000  ! 578: RDPR_TT	<illegal instruction>
	.word 0xb1a70840  ! 579: FADDd	faddd	%f28, %f0, %f24
	.word 0xab500000  ! 580: RDPR_TPC	<illegal instruction>
	.word 0x8797e000  ! 581: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0xab508000  ! 582: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 583: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x81956000  ! 584: WRPR_TPC_I	wrpr	%r21, 0x0000, %tpc
	.word 0xb7a589a0  ! 585: FDIVs	fdivs	%f22, %f0, %f27
	.word 0x8d952000  ! 586: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x819fe000  ! 587: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x81966000  ! 588: WRPR_TPC_I	wrpr	%r25, 0x0000, %tpc
	.word 0x87962000  ! 589: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x8d96a000  ! 590: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0xb3508000  ! 591: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a548c0  ! 592: FSUBd	fsubd	%f52, %f0, %f20
	.word 0x81962000  ! 593: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x83946000  ! 594: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	.word 0x87942000  ! 595: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xbb508000  ! 596: RDPR_TSTATE	<illegal instruction>
	.word 0x8d972000  ! 597: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0xa3a6c8e0  ! 598: FSUBq	dis not found

	.word 0x839ce000  ! 599: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0x87942000  ! 600: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0xa3500000  ! 601: RDPR_TPC	<illegal instruction>
	.word 0x8196a000  ! 602: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0xbb504000  ! 603: RDPR_TNPC	<illegal instruction>
	.word 0xaf500000  ! 604: RDPR_TPC	<illegal instruction>
	.word 0xad50c000  ! 605: RDPR_TT	<illegal instruction>
	.word 0xada4c840  ! 606: FADDd	faddd	%f50, %f0, %f22
	.word 0xb150c000  ! 607: RDPR_TT	<illegal instruction>
	.word 0xa3a00540  ! 608: FSQRTd	fsqrt	
	.word 0x8396a000  ! 609: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x8d966000  ! 610: WRPR_PSTATE_I	wrpr	%r25, 0x0000, %pstate
	.word 0xa5a7c840  ! 611: FADDd	faddd	%f62, %f0, %f18
	.word 0xaf508000  ! 612: RDPR_TSTATE	<illegal instruction>
	.word 0xa5a489e0  ! 613: FDIVq	dis not found

	.word 0xb3508000  ! 614: RDPR_TSTATE	<illegal instruction>
	.word 0xbba448a0  ! 615: FSUBs	fsubs	%f17, %f0, %f29
	.word 0x8d946000  ! 616: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819f2000  ! 617: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xad50c000  ! 618: RDPR_TT	<illegal instruction>
	.word 0xb7a00560  ! 619: FSQRTq	fsqrt	
	.word 0xbda7c9c0  ! 620: FDIVd	fdivd	%f62, %f0, %f30
	.word 0x8197e000  ! 621: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xab500000  ! 622: RDPR_TPC	<illegal instruction>
	.word 0xb9504000  ! 623: RDPR_TNPC	<illegal instruction>
	.word 0xa5500000  ! 624: RDPR_TPC	<illegal instruction>
	.word 0x87956000  ! 625: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8d97a000  ! 626: WRPR_PSTATE_I	wrpr	%r30, 0x0000, %pstate
	.word 0x85952000  ! 627: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0xbfa649a0  ! 628: FDIVs	fdivs	%f25, %f0, %f31
	.word 0xbb504000  ! 629: RDPR_TNPC	<illegal instruction>
	.word 0x85962000  ! 630: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb950c000  ! 631: RDPR_TT	<illegal instruction>
	.word 0x8d946000  ! 632: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x839c6000  ! 633: WRHPR_HTSTATE_I	wrhpr	%r17, 0x0000, %htstate
	.word 0x8597e000  ! 634: WRPR_TSTATE_I	wrpr	%r31, 0x0000, %tstate
	.word 0x8d976000  ! 635: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa7504000  ! 636: RDPR_TNPC	<illegal instruction>
	.word 0xb7508000  ! 637: RDPR_TSTATE	<illegal instruction>
	.word 0x83976000  ! 638: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8194e000  ! 639: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0x8196a000  ! 640: WRPR_TPC_I	wrpr	%r26, 0x0000, %tpc
	.word 0x87976000  ! 641: WRPR_TT_I	wrpr	%r29, 0x0000, %tt
	.word 0x8795a000  ! 642: WRPR_TT_I	wrpr	%r22, 0x0000, %tt
	.word 0xbd504000  ! 643: RDPR_TNPC	<illegal instruction>
	.word 0x8d946000  ! 644: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x85942000  ! 645: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xb3500000  ! 646: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 647: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x819f2000  ! 648: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xb5a68940  ! 649: FMULd	fmuld	%f26, %f0, %f26
	.word 0x81962000  ! 650: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xb9508000  ! 651: RDPR_TSTATE	<illegal instruction>
	.word 0xada4c920  ! 652: FMULs	fmuls	%f19, %f0, %f22
	.word 0xab504000  ! 653: RDPR_TNPC	<illegal instruction>
	.word 0x81962000  ! 654: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa7a70920  ! 655: FMULs	fmuls	%f28, %f0, %f19
	.word 0x8397a000  ! 656: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x839da000  ! 657: WRHPR_HTSTATE_I	wrhpr	%r22, 0x0000, %htstate
	.word 0x83942000  ! 658: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa9a588a0  ! 659: FSUBs	fsubs	%f22, %f0, %f20
	.word 0xb3508000  ! 660: RDPR_TSTATE	<illegal instruction>
	.word 0xb150c000  ! 661: RDPR_TT	<illegal instruction>
	.word 0x83962000  ! 662: WRPR_TNPC_I	wrpr	%r24, 0x0000, %tnpc
	.word 0xa1508000  ! 663: RDPR_TSTATE	<illegal instruction>
	.word 0x839f6000  ! 664: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0xb3a68920  ! 665: FMULs	fmuls	%f26, %f0, %f25
	.word 0xb950c000  ! 666: RDPR_TT	<illegal instruction>
	.word 0x819ca000  ! 667: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8594e000  ! 668: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb7504000  ! 669: RDPR_TNPC	<illegal instruction>
	.word 0x81962000  ! 670: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xa1508000  ! 671: RDPR_TSTATE	<illegal instruction>
	.word 0xb7508000  ! 672: RDPR_TSTATE	<illegal instruction>
	.word 0x8596e000  ! 673: WRPR_TSTATE_I	wrpr	%r27, 0x0000, %tstate
	.word 0x8794a000  ! 674: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0xaf500000  ! 675: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 676: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x819c2000  ! 677: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0x839de000  ! 678: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xaba60960  ! 679: FMULq	dis not found

	.word 0x87942000  ! 680: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x8d942000  ! 681: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa1504000  ! 682: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 683: RDPR_TT	<illegal instruction>
	.word 0x8d956000  ! 684: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8796a000  ! 685: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8d952000  ! 686: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb9504000  ! 687: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xada58920  ! 688: FMULs	fmuls	%f22, %f0, %f22
	.word 0x819d2000  ! 689: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xbfa588a0  ! 690: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb1504000  ! 691: RDPR_TNPC	<illegal instruction>
	.word 0xa5a788e0  ! 692: FSUBq	dis not found

	.word 0xaf508000  ! 693: RDPR_TSTATE	<illegal instruction>
	.word 0x83966000  ! 694: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xb9a4c8c0  ! 695: FSUBd	fsubd	%f50, %f0, %f28
	.word 0x8795e000  ! 696: WRPR_TT_I	wrpr	%r23, 0x0000, %tt
	.word 0xada00540  ! 697: FSQRTd	fsqrt	
	.word 0xa7a00540  ! 698: FSQRTd	fsqrt	
	.word 0xa150c000  ! 699: RDPR_TT	<illegal instruction>
	.word 0x8797e000  ! 700: WRPR_TT_I	wrpr	%r31, 0x0000, %tt
	.word 0x85942000  ! 701: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0xaf500000  ! 702: RDPR_TPC	<illegal instruction>
	.word 0x87962000  ! 703: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0x819ea000  ! 704: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0x87952000  ! 705: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xbb504000  ! 706: RDPR_TNPC	<illegal instruction>
	.word 0x83976000  ! 707: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0xbf50c000  ! 708: RDPR_TT	<illegal instruction>
	.word 0xb9504000  ! 709: RDPR_TNPC	<illegal instruction>
	.word 0xa3a709c0  ! 710: FDIVd	fdivd	%f28, %f0, %f48
	.word 0xb1a70840  ! 711: FADDd	faddd	%f28, %f0, %f24
	.word 0xa150c000  ! 712: RDPR_TT	<illegal instruction>
	.word 0xad50c000  ! 713: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 714: RDPR_TT	<illegal instruction>
	.word 0xa7508000  ! 715: RDPR_TSTATE	<illegal instruction>
	.word 0xb1508000  ! 716: RDPR_TSTATE	<illegal instruction>
	.word 0x8d976000  ! 717: WRPR_PSTATE_I	wrpr	%r29, 0x0000, %pstate
	.word 0xa750c000  ! 718: RDPR_TT	<illegal instruction>
	.word 0x8d95e000  ! 719: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x8d95a000  ! 720: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xb5504000  ! 721: RDPR_TNPC	<illegal instruction>
	.word 0x83966000  ! 722: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0x819da000  ! 723: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0000, %hpstate
	.word 0x85956000  ! 724: WRPR_TSTATE_I	wrpr	%r21, 0x0000, %tstate
	.word 0x819c6000  ! 725: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x8196e000  ! 726: WRPR_TPC_I	wrpr	%r27, 0x0000, %tpc
	.word 0xad50c000  ! 727: RDPR_TT	<illegal instruction>
	.word 0xb7508000  ! 728: RDPR_TSTATE	<illegal instruction>
	.word 0xa7500000  ! 729: RDPR_TPC	<illegal instruction>
	.word 0x819fe000  ! 730: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x83952000  ! 731: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xa3a00540  ! 732: FSQRTd	fsqrt	
	.word 0xbb50c000  ! 733: RDPR_TT	<illegal instruction>
	.word 0x81942000  ! 734: WRPR_TPC_I	wrpr	%r16, 0x0000, %tpc
	.word 0xa3508000  ! 735: RDPR_TSTATE	<illegal instruction>
	.word 0x83942000  ! 736: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0xa3a708a0  ! 737: FSUBs	fsubs	%f28, %f0, %f17
	.word 0x8594e000  ! 738: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x85942000  ! 739: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x819ce000  ! 740: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8d97e000  ! 741: WRPR_PSTATE_I	wrpr	%r31, 0x0000, %pstate
	.word 0xafa60840  ! 742: FADDd	faddd	%f24, %f0, %f54
	.word 0x839de000  ! 743: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0x839de000  ! 744: WRHPR_HTSTATE_I	wrhpr	%r23, 0x0000, %htstate
	.word 0xb3500000  ! 745: RDPR_TPC	<illegal instruction>
	.word 0xbf500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0x819f2000  ! 747: WRHPR_HPSTATE_I	wrhpr	%r28, 0x0000, %hpstate
	.word 0xbb508000  ! 748: RDPR_TSTATE	<illegal instruction>
	.word 0xb750c000  ! 749: RDPR_TT	<illegal instruction>
	.word 0x819de000  ! 750: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0xbf508000  ! 751: RDPR_TSTATE	<illegal instruction>
	.word 0x8794a000  ! 752: WRPR_TT_I	wrpr	%r18, 0x0000, %tt
	.word 0x819f6000  ! 753: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xaba449a0  ! 754: FDIVs	fdivs	%f17, %f0, %f21
	.word 0xb9a64860  ! 755: FADDq	dis not found

	.word 0xb5504000  ! 756: RDPR_TNPC	<illegal instruction>
	.word 0x8796e000  ! 757: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0xbf50c000  ! 758: RDPR_TT	<illegal instruction>
	.word 0xb950c000  ! 759: RDPR_TT	<illegal instruction>
	.word 0xab50c000  ! 760: RDPR_TT	<illegal instruction>
	.word 0x85942000  ! 761: WRPR_TSTATE_I	wrpr	%r16, 0x0000, %tstate
	.word 0x8d96e000  ! 762: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0x85962000  ! 763: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8d94a000  ! 764: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa9504000  ! 765: RDPR_TNPC	<illegal instruction>
	.word 0x839ee000  ! 766: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0x839d6000  ! 767: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0xbf500000  ! 768: RDPR_TPC	<illegal instruction>
	.word 0x819ce000  ! 769: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0x8d95e000  ! 770: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0x83966000  ! 771: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xab508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d95a000  ! 773: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x839ce000  ! 774: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0000, %htstate
	.word 0xb5a7c940  ! 775: FMULd	fmuld	%f62, %f0, %f26
	.word 0xb350c000  ! 776: RDPR_TT	<illegal instruction>
	.word 0x8394e000  ! 777: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xab500000  ! 778: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 779: RDPR_TPC	<illegal instruction>
	.word 0x8397a000  ! 780: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0x85962000  ! 781: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0x8796a000  ! 782: WRPR_TT_I	wrpr	%r26, 0x0000, %tt
	.word 0x8394a000  ! 783: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xb1a00540  ! 784: FSQRTd	fsqrt	
	.word 0x819de000  ! 785: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x819e6000  ! 786: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0xa5508000  ! 787: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 788: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 789: RDPR_TPC	<illegal instruction>
	.word 0x819f6000  ! 790: WRHPR_HPSTATE_I	wrhpr	%r29, 0x0000, %hpstate
	.word 0xbf500000  ! 791: RDPR_TPC	<illegal instruction>
	.word 0xa5500000  ! 792: RDPR_TPC	<illegal instruction>
	.word 0xa5500000  ! 793: RDPR_TPC	<illegal instruction>
	.word 0x8595e000  ! 794: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8597a000  ! 795: WRPR_TSTATE_I	wrpr	%r30, 0x0000, %tstate
	.word 0x839ee000  ! 796: WRHPR_HTSTATE_I	wrhpr	%r27, 0x0000, %htstate
	.word 0xab500000  ! 797: RDPR_TPC	<illegal instruction>
	.word 0xa9500000  ! 798: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 799: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xb3508000  ! 800: RDPR_TSTATE	<illegal instruction>
	.word 0x81962000  ! 801: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8395e000  ! 802: WRPR_TNPC_I	wrpr	%r23, 0x0000, %tnpc
	.word 0xb950c000  ! 803: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 804: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a689c0  ! 805: FDIVd	fdivd	%f26, %f0, %f28
	.word 0xa7a48840  ! 806: FADDd	faddd	%f18, %f0, %f50
	.word 0xa3508000  ! 807: RDPR_TSTATE	<illegal instruction>
	.word 0x85972000  ! 808: WRPR_TSTATE_I	wrpr	%r28, 0x0000, %tstate
	.word 0x85976000  ! 809: WRPR_TSTATE_I	wrpr	%r29, 0x0000, %tstate
	.word 0xb3a649c0  ! 810: FDIVd	fdivd	%f56, %f0, %f56
	.word 0xb5504000  ! 811: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 812: RDPR_TNPC	<illegal instruction>
	.word 0xbfa00540  ! 813: FSQRTd	fsqrt	
	.word 0x8d946000  ! 814: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa3a608e0  ! 815: FSUBq	dis not found

	.word 0x8595a000  ! 816: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	.word 0x85966000  ! 817: WRPR_TSTATE_I	wrpr	%r25, 0x0000, %tstate
	.word 0xbb50c000  ! 818: RDPR_TT	<illegal instruction>
	.word 0xa3a489a0  ! 819: FDIVs	fdivs	%f18, %f0, %f17
	.word 0xb3a50960  ! 820: FMULq	dis not found

	.word 0xa9a68820  ! 821: FADDs	fadds	%f26, %f0, %f20
	.word 0xbfa00560  ! 822: FSQRTq	fsqrt	
	.word 0xb3504000  ! 823: RDPR_TNPC	<illegal instruction>
	.word 0x8594e000  ! 824: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0x8394e000  ! 825: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xa9500000  ! 826: RDPR_TPC	<illegal instruction>
	.word 0x819c6000  ! 827: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0xa5a608a0  ! 828: FSUBs	fsubs	%f24, %f0, %f18
	.word 0xbd504000  ! 829: RDPR_TNPC	<illegal instruction>
	.word 0x819de000  ! 830: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0000, %hpstate
	.word 0x81976000  ! 831: WRPR_TPC_I	wrpr	%r29, 0x0000, %tpc
	.word 0xb750c000  ! 832: RDPR_TT	<illegal instruction>
	.word 0xb9508000  ! 833: RDPR_TSTATE	<illegal instruction>
	.word 0xab50c000  ! 834: RDPR_TT	<illegal instruction>
	.word 0x87956000  ! 835: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x8797a000  ! 836: WRPR_TT_I	wrpr	%r30, 0x0000, %tt
	.word 0x8d972000  ! 837: WRPR_PSTATE_I	wrpr	%r28, 0x0000, %pstate
	.word 0x8195a000  ! 838: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0xb9504000  ! 839: RDPR_TNPC	<illegal instruction>
	.word 0x819ca000  ! 840: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0x8d942000  ! 841: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xbda749e0  ! 842: FDIVq	dis not found

	.word 0x839f6000  ! 843: WRHPR_HTSTATE_I	wrhpr	%r29, 0x0000, %htstate
	.word 0x85946000  ! 844: WRPR_TSTATE_I	wrpr	%r17, 0x0000, %tstate
	.word 0xb1504000  ! 845: RDPR_TNPC	<illegal instruction>
	.word 0x819c2000  ! 846: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb3500000  ! 847: RDPR_TPC	<illegal instruction>
	.word 0x8197e000  ! 848: WRPR_TPC_I	wrpr	%r31, 0x0000, %tpc
	.word 0xbd508000  ! 849: RDPR_TSTATE	<illegal instruction>
	.word 0x8397a000  ! 850: WRPR_TNPC_I	wrpr	%r30, 0x0000, %tnpc
	.word 0xa1508000  ! 851: RDPR_TSTATE	<illegal instruction>
	.word 0x85962000  ! 852: WRPR_TSTATE_I	wrpr	%r24, 0x0000, %tstate
	.word 0xb350c000  ! 853: RDPR_TT	<illegal instruction>
	.word 0x819ea000  ! 854: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xa150c000  ! 855: RDPR_TT	<illegal instruction>
	.word 0x819d2000  ! 856: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xb550c000  ! 857: RDPR_TT	<illegal instruction>
	.word 0xa7500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0x87942000  ! 859: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	.word 0x81952000  ! 860: WRPR_TPC_I	wrpr	%r20, 0x0000, %tpc
	.word 0xada00560  ! 861: FSQRTq	fsqrt	
	.word 0x8d942000  ! 862: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x819ea000  ! 863: WRHPR_HPSTATE_I	wrhpr	%r26, 0x0000, %hpstate
	.word 0xb7500000  ! 864: RDPR_TPC	<illegal instruction>
	.word 0x87956000  ! 865: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	.word 0x819d2000  ! 866: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0000, %hpstate
	.word 0xab504000  ! 867: RDPR_TNPC	<illegal instruction>
	.word 0xaba5c9c0  ! 868: FDIVd	fdivd	%f54, %f0, %f52
	.word 0x839ea000  ! 869: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0xb7504000  ! 870: RDPR_TNPC	<illegal instruction>
	.word 0x87962000  ! 871: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa7508000  ! 872: RDPR_TSTATE	<illegal instruction>
	.word 0xa9a489e0  ! 873: FDIVq	dis not found

	.word 0xa950c000  ! 874: RDPR_TT	<illegal instruction>
	.word 0x8595e000  ! 875: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0xb1504000  ! 876: RDPR_TNPC	<illegal instruction>
	.word 0xa550c000  ! 877: RDPR_TT	<illegal instruction>
	.word 0x8d962000  ! 878: WRPR_PSTATE_I	wrpr	%r24, 0x0000, %pstate
	.word 0x83966000  ! 879: WRPR_TNPC_I	wrpr	%r25, 0x0000, %tnpc
	.word 0xab504000  ! 880: RDPR_TNPC	<illegal instruction>
	.word 0x87952000  ! 881: WRPR_TT_I	wrpr	%r20, 0x0000, %tt
	.word 0xaf508000  ! 882: RDPR_TSTATE	<illegal instruction>
	.word 0xaba409e0  ! 883: FDIVq	dis not found

	.word 0xb9504000  ! 884: RDPR_TNPC	<illegal instruction>
	.word 0x8d96a000  ! 885: WRPR_PSTATE_I	wrpr	%r26, 0x0000, %pstate
	.word 0x839e6000  ! 886: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0xb150c000  ! 887: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 888: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 889: RDPR_TSTATE	<illegal instruction>
	.word 0x839fa000  ! 890: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x839d6000  ! 891: WRHPR_HTSTATE_I	wrhpr	%r21, 0x0000, %htstate
	.word 0x819ce000  ! 892: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb9504000  ! 893: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 894: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 895: RDPR_TPC	<illegal instruction>
	.word 0xb5a54860  ! 896: FADDq	dis not found

	.word 0xb9504000  ! 897: RDPR_TNPC	<illegal instruction>
	.word 0x839e2000  ! 898: WRHPR_HTSTATE_I	wrhpr	%r24, 0x0000, %htstate
	.word 0x8d96e000  ! 899: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xb5504000  ! 900: RDPR_TNPC	<illegal instruction>
	.word 0x8195e000  ! 901: WRPR_TPC_I	wrpr	%r23, 0x0000, %tpc
	.word 0x8d94e000  ! 902: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819ca000  ! 903: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xbd500000  ! 904: RDPR_TPC	<illegal instruction>
	.word 0xbba4c960  ! 905: FMULq	dis not found

	.word 0x8396a000  ! 906: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x87972000  ! 907: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0xa5504000  ! 908: RDPR_TNPC	<illegal instruction>
	.word 0x87946000  ! 909: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	.word 0xbb500000  ! 910: RDPR_TPC	<illegal instruction>
	.word 0xb9500000  ! 911: RDPR_TPC	<illegal instruction>
	.word 0xa3508000  ! 912: RDPR_TSTATE	<illegal instruction>
	.word 0xbba489e0  ! 913: FDIVq	dis not found

	.word 0xa5a50840  ! 914: FADDd	faddd	%f20, %f0, %f18
	.word 0x839ea000  ! 915: WRHPR_HTSTATE_I	wrhpr	%r26, 0x0000, %htstate
	.word 0x839fa000  ! 916: WRHPR_HTSTATE_I	wrhpr	%r30, 0x0000, %htstate
	.word 0x819c6000  ! 917: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0000, %hpstate
	.word 0x83976000  ! 918: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x8d956000  ! 919: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb5504000  ! 920: RDPR_TNPC	<illegal instruction>
	.word 0xa1504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xb1500000  ! 922: RDPR_TPC	<illegal instruction>
	.word 0x839fe000  ! 923: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	.word 0xb7508000  ! 924: RDPR_TSTATE	<illegal instruction>
	.word 0xa3a40860  ! 925: FADDq	dis not found

	.word 0xb7a588e0  ! 926: FSUBq	dis not found

	.word 0x8595e000  ! 927: WRPR_TSTATE_I	wrpr	%r23, 0x0000, %tstate
	.word 0x8d95e000  ! 928: WRPR_PSTATE_I	wrpr	%r23, 0x0000, %pstate
	.word 0xa350c000  ! 929: RDPR_TT	<illegal instruction>
	.word 0x83976000  ! 930: WRPR_TNPC_I	wrpr	%r29, 0x0000, %tnpc
	.word 0x819ca000  ! 931: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0000, %hpstate
	.word 0xa1504000  ! 932: RDPR_TNPC	<illegal instruction>
	.word 0xad500000  ! 933: RDPR_TPC	<illegal instruction>
	.word 0x8195a000  ! 934: WRPR_TPC_I	wrpr	%r22, 0x0000, %tpc
	.word 0x81962000  ! 935: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0xad500000  ! 936: RDPR_TPC	<illegal instruction>
	.word 0x81972000  ! 937: WRPR_TPC_I	wrpr	%r28, 0x0000, %tpc
	.word 0xbd508000  ! 938: RDPR_TSTATE	<illegal instruction>
	.word 0x8396a000  ! 939: WRPR_TNPC_I	wrpr	%r26, 0x0000, %tnpc
	.word 0x819ee000  ! 940: WRHPR_HPSTATE_I	wrhpr	%r27, 0x0000, %hpstate
	.word 0xb5504000  ! 941: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 942: RDPR_TSTATE	<illegal instruction>
	.word 0x8395a000  ! 943: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	.word 0x85952000  ! 944: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	.word 0x819ce000  ! 945: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0000, %hpstate
	.word 0xb5504000  ! 946: RDPR_TNPC	<illegal instruction>
	.word 0xb3a7c8e0  ! 947: FSUBq	dis not found

	.word 0xbf500000  ! 948: RDPR_TPC	<illegal instruction>
	.word 0xa1a50940  ! 949: FMULd	fmuld	%f20, %f0, %f16
	.word 0xa3508000  ! 950: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 951: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0x87972000  ! 953: WRPR_TT_I	wrpr	%r28, 0x0000, %tt
	.word 0x8394e000  ! 954: WRPR_TNPC_I	wrpr	%r19, 0x0000, %tnpc
	.word 0xb5500000  ! 955: RDPR_TPC	<illegal instruction>
	.word 0xb9a50940  ! 956: FMULd	fmuld	%f20, %f0, %f28
	.word 0x839ca000  ! 957: WRHPR_HTSTATE_I	wrhpr	%r18, 0x0000, %htstate
	.word 0x87966000  ! 958: WRPR_TT_I	wrpr	%r25, 0x0000, %tt
	.word 0xb7508000  ! 959: RDPR_TSTATE	<illegal instruction>
	.word 0xb5508000  ! 960: RDPR_TSTATE	<illegal instruction>
	.word 0x87962000  ! 961: WRPR_TT_I	wrpr	%r24, 0x0000, %tt
	.word 0xa550c000  ! 962: RDPR_TT	<illegal instruction>
	.word 0xa7a00520  ! 963: FSQRTs	fsqrt	
	.word 0xa9a78960  ! 964: FMULq	dis not found

	.word 0x83952000  ! 965: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xab50c000  ! 966: RDPR_TT	<illegal instruction>
	.word 0xa3500000  ! 967: RDPR_TPC	<illegal instruction>
	.word 0x83942000  ! 968: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	.word 0x8d94e000  ! 969: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x8d94a000  ! 970: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xbf508000  ! 971: RDPR_TSTATE	<illegal instruction>
	.word 0x819c2000  ! 972: WRHPR_HPSTATE_I	wrhpr	%r16, 0x0000, %hpstate
	.word 0xb9508000  ! 973: RDPR_TSTATE	<illegal instruction>
	.word 0xb5a54940  ! 974: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb3504000  ! 975: RDPR_TNPC	<illegal instruction>
	.word 0xb9a4c8c0  ! 976: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xb1504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 978: RDPR_TSTATE	<illegal instruction>
	.word 0xa3504000  ! 979: RDPR_TNPC	<illegal instruction>
	.word 0xbf508000  ! 980: RDPR_TSTATE	<illegal instruction>
	.word 0x8397e000  ! 981: WRPR_TNPC_I	wrpr	%r31, 0x0000, %tnpc
	.word 0xb1a488a0  ! 982: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xb950c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0x8d946000  ! 984: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819e6000  ! 985: WRHPR_HPSTATE_I	wrhpr	%r25, 0x0000, %hpstate
	.word 0x8394a000  ! 986: WRPR_TNPC_I	wrpr	%r18, 0x0000, %tnpc
	.word 0xad500000  ! 987: RDPR_TPC	<illegal instruction>
	.word 0x8796e000  ! 988: WRPR_TT_I	wrpr	%r27, 0x0000, %tt
	.word 0x81962000  ! 989: WRPR_TPC_I	wrpr	%r24, 0x0000, %tpc
	.word 0x8d96e000  ! 990: WRPR_PSTATE_I	wrpr	%r27, 0x0000, %pstate
	.word 0xbd504000  ! 991: RDPR_TNPC	<illegal instruction>
	.word 0xb750c000  ! 992: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 993: RDPR_TPC	<illegal instruction>
	.word 0x8594e000  ! 994: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	.word 0xab50c000  ! 995: RDPR_TT	<illegal instruction>
	.word 0x839e6000  ! 996: WRHPR_HTSTATE_I	wrhpr	%r25, 0x0000, %htstate
	.word 0x83952000  ! 997: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	.word 0xbf50c000  ! 998: RDPR_TT	<illegal instruction>

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x01461e2200005cf8
	.xword	0x696b0c3300000a7f
	.xword	0xdbff51610000f86b
	.xword	0x4e1270a30000be58
	.xword	0xf2acde140000ffe4
	.xword	0xe50e1e4a00004fea
	.xword	0x781051960000fa38
	.xword	0xaad07998000038ab
	.xword	0x700bae3300008c45
	.xword	0x44d10fe600000e6f
	.xword	0xff1bccef0000aab1
	.xword	0x6af782370000ded1
	.xword	0xc90180480000fb23
	.xword	0x9247bffb00006d91
	.xword	0xe45ac975000029c2
	.xword	0x102693790000ce07
	.xword	0xe41a34d200002966
	.xword	0x9dd0c89900003d95
	.xword	0x891c8227000019f3
	.xword	0x015633f40000bfd4
	.xword	0x93f7550200003af1
	.xword	0xd23d9b7b00002d07
	.xword	0x3a0baebb0000acf7
	.xword	0x1ce19efe00000ae8
	.xword	0xddec811c0000da7b
	.xword	0x82aba34000008b2c
	.xword	0xf459680f00008d97
	.xword	0xc993b8ef00007e11
	.xword	0x17179ef00000eb16
	.xword	0x920e82b60000e991
	.xword	0xc601fffd00008c2c
	.xword	0x2ceae42200005ecd
	.xword	0x12f43ffe0000098a
	.xword	0xea853da700008b32
	.xword	0x624057b700005af7
	.xword	0x66ed4d7300005a5d
	.xword	0x03884a4f00009d15
	.xword	0xcda83c050000fa23
	.xword	0x6f2a652100005dbe
	.xword	0xf699ec9a0000df32
	.xword	0x25bf27ce0000df98
	.xword	0xadfdb45b00006c50
	.xword	0xf60a3a3100002dee
	.xword	0x9279ffcb0000ec25
	.xword	0xd0c1786000004e80
	.xword	0x8f68b55a00003918
	.xword	0x5f825ce000002a5f
	.xword	0x26c8680800009b62
	.xword	0xfcc408ad00002b90
	.xword	0xd95d6e2700005a7e
	.xword	0x377f1eeb00000e2a
	.xword	0xb27082b30000ad75
	.xword	0x883c32d700003c26
	.xword	0x451a21b300008c7e
	.xword	0x1e72cd4a0000e853
	.xword	0x719cc5ba00003d6c
	.xword	0x507e0e7f0000dcdd
	.xword	0xe9fa906e00004cba
	.xword	0xc715bade000059ae
	.xword	0x7ecdd10f0000efed
	.xword	0xfd9b59840000cdf3
	.xword	0x0c93cbc000004d74
	.xword	0xb977ff570000bd0c
	.xword	0x1a69d69800000c64
	.xword	0xeb06004c00004ad3
	.xword	0x3b67f2b600002afc
	.xword	0x6887c5fb00007a52
	.xword	0x5e3ae1130000ab89
	.xword	0x10f6de500000a9e8
	.xword	0x42d5efc70000fbf3
	.xword	0x163cf1320000ccf9
	.xword	0x6b5df1630000ac43
	.xword	0x9f047f0d00004a57
	.xword	0xf5f400780000aa13
	.xword	0x574321c100009e1e
	.xword	0xaab396cf0000fec3
	.xword	0xa40077df00008e0f
	.xword	0xd67fc63d0000ccc3
	.xword	0x24a9cb500000a846
	.xword	0x8bfce81b0000da76
	.xword	0xc002be5800004970
	.xword	0x99c1058300004efd
	.xword	0xe67f0d4500002959
	.xword	0xf380f16400002e2f
	.xword	0x6ea7c3880000fcfd
	.xword	0x1a5e751400000ecd
	.xword	0x1f8c7c3700000b47
	.xword	0x8292a5fa0000dbf7
	.xword	0xc7013c650000d8a7
	.xword	0x740646a300008d1a
	.xword	0xaa6e49c30000eb08
	.xword	0x7e42475f00005af2
	.xword	0x99ed054f00002fad
	.xword	0x85bf4cef0000da77
	.xword	0xe6557e1300000e59
	.xword	0x8a09060c0000c86c
	.xword	0x95cf229100002ab8
	.xword	0x09987c5a00005ba8
	.xword	0xea4777b000009abf
	.xword	0x1053b5e2000088d9
	.xword	0x40f0aa2f00004c13
	.xword	0x66350d370000da25
	.xword	0x3c05ec5b00001f09
	.xword	0xa5325ff9000039db
	.xword	0x1ee7bb9a0000c94d
	.xword	0x3789bf8400002f8f
	.xword	0x5ff04e630000c8f8
	.xword	0x0df1865c00004c61
	.xword	0x73826ee90000bce9
	.xword	0xa9e9e1fe0000ef6e
	.xword	0x11e6ecce0000d90f
	.xword	0x18387a2900007c2c
	.xword	0x510d581d00004af8
	.xword	0xf7c4d2680000ad57
	.xword	0x9a0dd9620000d808
	.xword	0xf029f43800009e80
	.xword	0x33c3344a00005931
	.xword	0x8609d9c200005a74
	.xword	0xbf1824390000a88c
	.xword	0xf08867000000f8a1
	.xword	0x92dfef99000098ec
	.xword	0xe55f570d0000b8aa
	.xword	0x6ef1a6c300002ad0
	.xword	0xe6b0c0e500005fce
	.xword	0x77c363de0000fcd3
	.xword	0xad86a03a00007959
	.xword	0x22decc9b00009d20
	.xword	0x5015ed0a0000abcf



.text
	ta	T_GOOD_TRAP

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   int i;
!!# 
!!#   IJ_bind_thread_group("diag.j", 19, th_all, 0xf);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 21,"{16}" );
!!#   IJ_set_rvar ("diag.j", 22, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 23, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_rvar ("diag.j", 25, Rv_rand64, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 27, ijdefault, Ft_Rs1, "{16..31}");
!!#   IJ_set_ropr_fld ("diag.j", 28, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 29, ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld ("diag.j", 30, ijdefault, Ft_Rd, "{16..31}");
!!# 
!!#   IJ_printf ("diag.j", 32, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_init_regs_by_setx ("diag.j", 33, th_all, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 34, th_all, "\tsetx\tdata_start, %%r1, %%g7\n");
!!# 
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 37, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 41, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_th_fork("diag.j", 42,0x2, 0x4, 0x8, -1);;
!!# 
!!#   IJ_printf ("diag.j", 44, th_all, "\tta\tT_CHANGE_PRIV\n");
!!#   IJ_printf ("diag.j", 45, th_all, "\twrpr\t%%g0, 1, %%tl\n");
!!#   IJ_printf ("diag.j", 46, th_all, "\twrpr\t%%l0, %%g0, %%tpc\n");
!!#   IJ_printf ("diag.j", 47, th_all, "\twrpr\t%%l0, %%g0, %%tnpc\n");
!!#   IJ_printf ("diag.j", 48, th_all, "\twrpr\t%%l0, %%g0, %%tstate\n");
!!#   IJ_printf ("diag.j", 49, th_all, "\twrpr\t%%l0, %%g0, %%tt\n");
!!# 
!!#   return 0;
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   int j;
!!# 
!!#   IJ_th_join("diag.j", 58,0xf);
!!#   IJ_th_start ("diag.j", 59,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 61, th_all, "\t.data\ndata_start:\n\n");
!!#   for (j = 0; j < 128; j++) {
!!# 	IJ_printf  ("diag.j", 63, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	    | inst_block inst_type
!!# 	{
!!# 		IJ_generate ("diag.j", 94, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type:
!!# 	write_tsa
!!# 	| read_tsa
!!# 	| write_asr %rvar  Rv_mid_wt
!!# 	| fp_arith %rvar  Rv_mid_wt
!!# ;
!!# 
!!# write_tsa: 
!!# 	tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRHPR_HTSTATE_I
!!# ;
!!# 
!!# write_asr: 
!!# 	tWRPR_PSTATE_I
!!# 	| tWRHPR_HPSTATE_I 
!!# ;
!!# 
!!# read_tsa: 
!!# 	tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TT
!!# ;
!!# 
!!# fp_arith:
!!# 	tFADDs
!!# 	| tFADDd
!!# 	| tFADDq
!!# 	| tFSUBs
!!# 	| tFSUBd
!!# 	| tFSUBq
!!# 	| tFMULs
!!# 	| tFMULd
!!# 	| tFMULq
!!# 	| tFDIVs
!!# 	| tFDIVd
!!# 	| tFDIVq
!!# 	| tFSQRTs
!!# 	| tFSQRTd
!!# 	| tFSQRTq
!!# ;
!!# 
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
